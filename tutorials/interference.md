# 网络中的干扰(Interference)

在无线网络中，基站(Base Station, BS)之间的干扰通常是限制性能的主要因素。在随机几何中，对干扰的分析是关键步骤。下面对干扰的统计特性进行分析。

假设$I$ 表示接收机Rx处的总干扰，由来自每个干扰BS的干扰组成

$$ I = \sum_{i=1}^N I_i$$

其中$I_i​$表示第$i​$个BS的干扰。假若BS服从的是最常用的齐次泊松点过程(Homogeneous Poisson Point Process)，那么可以利用矩生成函数(Moment Generating Function, MGF)来求干扰的矩。干扰的MGF表示为

$$ \mathcal{M}_I(s) = E[\exp(s I_i)] = E_N[\sum_{i=1}^N E[\exp(sI_i)]] = \exp(-E[N](1-E[\exp(sI_i)])) $$

根据矩生成函数在概率论中的定义，易得

$$ E[I^n] = \frac{d^n}{ds^n} \mathcal{M}_I(s) |_{s=0}$$

通过该式就可以计算得到干扰的矩。实际上，在随机几何中，这与概率生成函数(Probability Generating Functional, PGFL)利用拉普拉斯变换求干扰的矩是类似的。