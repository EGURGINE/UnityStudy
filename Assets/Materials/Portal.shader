Shader "Unlit/Portal"
{
	Properties{
		[IntRange] _StencilID("Stencil ID",Range(0,255)) = 0
	}

	SubShader
	{
		Tags {
			//Portal �� �ٸ� �� ���� ���� ������ �Ǿ�� �Ѵ�.
			//Geometry�� Queue�� 2000��
			"Queue" = "Geometry-1"
		}

		Pass
		{
			//�� ���̴��� ������ ���ۿ� ������ ���� �ʱ⿡ ZBuffer�� ����� �ʿ䰡 ����
			Zwrite off
			//Portal ��ü�� �������� �Ǹ� �ȵ� -> ColorMask 0
			ColorMask 0
			// ��Ż�� �ո鸸 ���
			Cull front
			Stencil{
				// Stencil ���۸� ����ϸ� ���� 1(or _StencilID)�� �ʱ�ȭ
				Ref[_StencilID]
				// Stencil ���ۿ� ���� �ֵ��� Pass
				Comp always
				//���ۿ� Ref ���� ����
				Pass replace
			}
		}
	}
}
