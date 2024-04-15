; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36388 () Bool)

(assert start!36388)

(declare-fun b!363841 () Bool)

(declare-fun e!222767 () Bool)

(declare-fun e!222766 () Bool)

(assert (=> b!363841 (= e!222767 e!222766)))

(declare-fun res!203147 () Bool)

(assert (=> b!363841 (=> (not res!203147) (not e!222766))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168130 () (_ BitVec 32))

(declare-fun lt!168128 () (_ BitVec 32))

(assert (=> b!363841 (= res!203147 (and (= lt!168128 (bvadd #b00000000000000000000000000000001 lt!168130)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20664 0))(
  ( (array!20665 (arr!9811 (Array (_ BitVec 32) (_ BitVec 64))) (size!10164 (_ BitVec 32))) )
))
(declare-fun lt!168125 () array!20664)

(declare-fun arrayCountValidKeys!0 (array!20664 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363841 (= lt!168128 (arrayCountValidKeys!0 lt!168125 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20664)

(assert (=> b!363841 (= lt!168130 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363841 (= lt!168125 (array!20665 (store (arr!9811 a!4289) i!1472 k0!2974) (size!10164 a!4289)))))

(declare-fun b!363842 () Bool)

(declare-fun e!222768 () Bool)

(assert (=> b!363842 (= e!222766 (not e!222768))))

(declare-fun res!203145 () Bool)

(assert (=> b!363842 (=> res!203145 e!222768)))

(declare-fun lt!168124 () (_ BitVec 32))

(declare-fun lt!168131 () (_ BitVec 32))

(assert (=> b!363842 (= res!203145 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10164 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168131 (bvadd #b00000000000000000000000000000001 lt!168124)))))))

(declare-fun lt!168132 () (_ BitVec 32))

(assert (=> b!363842 (= (bvadd lt!168132 lt!168128) lt!168131)))

(assert (=> b!363842 (= lt!168131 (arrayCountValidKeys!0 lt!168125 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363842 (= lt!168132 (arrayCountValidKeys!0 lt!168125 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11288 0))(
  ( (Unit!11289) )
))
(declare-fun lt!168127 () Unit!11288)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11288)

(assert (=> b!363842 (= lt!168127 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168125 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168133 () (_ BitVec 32))

(assert (=> b!363842 (= (bvadd lt!168133 lt!168130) lt!168124)))

(assert (=> b!363842 (= lt!168124 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363842 (= lt!168133 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168126 () Unit!11288)

(assert (=> b!363842 (= lt!168126 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363843 () Bool)

(declare-fun res!203146 () Bool)

(assert (=> b!363843 (=> (not res!203146) (not e!222767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363843 (= res!203146 (not (validKeyInArray!0 (select (arr!9811 a!4289) i!1472))))))

(declare-fun b!363844 () Bool)

(declare-fun res!203149 () Bool)

(assert (=> b!363844 (=> (not res!203149) (not e!222767))))

(assert (=> b!363844 (= res!203149 (and (bvslt (size!10164 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10164 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203144 () Bool)

(assert (=> start!36388 (=> (not res!203144) (not e!222767))))

(assert (=> start!36388 (= res!203144 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10164 a!4289))))))

(assert (=> start!36388 e!222767))

(assert (=> start!36388 true))

(declare-fun array_inv!7260 (array!20664) Bool)

(assert (=> start!36388 (array_inv!7260 a!4289)))

(declare-fun b!363845 () Bool)

(declare-fun res!203148 () Bool)

(assert (=> b!363845 (=> (not res!203148) (not e!222767))))

(assert (=> b!363845 (= res!203148 (validKeyInArray!0 k0!2974))))

(declare-fun b!363846 () Bool)

(assert (=> b!363846 (= e!222768 true)))

(assert (=> b!363846 (= (arrayCountValidKeys!0 lt!168125 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!168129 () Unit!11288)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20664 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11288)

(assert (=> b!363846 (= lt!168129 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(assert (= (and start!36388 res!203144) b!363843))

(assert (= (and b!363843 res!203146) b!363845))

(assert (= (and b!363845 res!203148) b!363844))

(assert (= (and b!363844 res!203149) b!363841))

(assert (= (and b!363841 res!203147) b!363842))

(assert (= (and b!363842 (not res!203145)) b!363846))

(declare-fun m!360841 () Bool)

(assert (=> start!36388 m!360841))

(declare-fun m!360843 () Bool)

(assert (=> b!363842 m!360843))

(declare-fun m!360845 () Bool)

(assert (=> b!363842 m!360845))

(declare-fun m!360847 () Bool)

(assert (=> b!363842 m!360847))

(declare-fun m!360849 () Bool)

(assert (=> b!363842 m!360849))

(declare-fun m!360851 () Bool)

(assert (=> b!363842 m!360851))

(declare-fun m!360853 () Bool)

(assert (=> b!363842 m!360853))

(declare-fun m!360855 () Bool)

(assert (=> b!363845 m!360855))

(declare-fun m!360857 () Bool)

(assert (=> b!363841 m!360857))

(declare-fun m!360859 () Bool)

(assert (=> b!363841 m!360859))

(declare-fun m!360861 () Bool)

(assert (=> b!363841 m!360861))

(declare-fun m!360863 () Bool)

(assert (=> b!363846 m!360863))

(declare-fun m!360865 () Bool)

(assert (=> b!363846 m!360865))

(declare-fun m!360867 () Bool)

(assert (=> b!363846 m!360867))

(declare-fun m!360869 () Bool)

(assert (=> b!363843 m!360869))

(assert (=> b!363843 m!360869))

(declare-fun m!360871 () Bool)

(assert (=> b!363843 m!360871))

(check-sat (not b!363841) (not b!363845) (not b!363846) (not b!363843) (not start!36388) (not b!363842))
(check-sat)
