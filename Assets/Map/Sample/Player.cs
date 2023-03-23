using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Map.Sample
{
    public class Player : MonoBehaviour
    {
        private Coroutine moveCoroutine = null;

        private Vector2 target;
        private float progress;

        private void Update()
        {
            transform.position = Vector2.Lerp(transform.position, target, progress * 2f);
            if (progress < 1f)
            {
                progress += Time.deltaTime;
                if (progress >= 1f)
                    progress = 1f;
            }
        }

        public void Move(Block block)
        {
            if (moveCoroutine != null)
                StopCoroutine(moveCoroutine);
            moveCoroutine = StartCoroutine(MoveStep(block));
        }

        private IEnumerator MoveStep(Block block)
        {
            while (block.next != null)
            {
                progress = 0f;
                block = block.next;
                var targetPos = Map.Instance.GetBlockItem(block);
                target = targetPos.transform.position;
                yield return new WaitForSeconds(0.5f);
            }
        }
    }
}
