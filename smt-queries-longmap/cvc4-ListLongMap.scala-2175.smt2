; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36388 () Bool)

(assert start!36388)

(declare-fun b!363986 () Bool)

(declare-fun res!203150 () Bool)

(declare-fun e!222857 () Bool)

(assert (=> b!363986 (=> (not res!203150) (not e!222857))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363986 (= res!203150 (validKeyInArray!0 k!2974))))

(declare-fun b!363987 () Bool)

(declare-fun res!203149 () Bool)

(assert (=> b!363987 (=> (not res!203149) (not e!222857))))

(declare-datatypes ((array!20668 0))(
  ( (array!20669 (arr!9813 (Array (_ BitVec 32) (_ BitVec 64))) (size!10165 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20668)

(declare-fun i!1472 () (_ BitVec 32))

(assert (=> b!363987 (= res!203149 (not (validKeyInArray!0 (select (arr!9813 a!4289) i!1472))))))

(declare-fun b!363989 () Bool)

(declare-fun e!222858 () Bool)

(assert (=> b!363989 (= e!222857 e!222858)))

(declare-fun res!203147 () Bool)

(assert (=> b!363989 (=> (not res!203147) (not e!222858))))

(declare-fun lt!168157 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168151 () (_ BitVec 32))

(assert (=> b!363989 (= res!203147 (and (= lt!168157 (bvadd #b00000000000000000000000000000001 lt!168151)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168149 () array!20668)

(declare-fun arrayCountValidKeys!0 (array!20668 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363989 (= lt!168157 (arrayCountValidKeys!0 lt!168149 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363989 (= lt!168151 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363989 (= lt!168149 (array!20669 (store (arr!9813 a!4289) i!1472 k!2974) (size!10165 a!4289)))))

(declare-fun b!363990 () Bool)

(declare-fun e!222856 () Bool)

(assert (=> b!363990 (= e!222858 (not e!222856))))

(declare-fun res!203151 () Bool)

(assert (=> b!363990 (=> res!203151 e!222856)))

(declare-fun lt!168153 () (_ BitVec 32))

(declare-fun lt!168155 () (_ BitVec 32))

(assert (=> b!363990 (= res!203151 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10165 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168153 (bvadd #b00000000000000000000000000000001 lt!168155)))))))

(declare-fun lt!168150 () (_ BitVec 32))

(assert (=> b!363990 (= (bvadd lt!168150 lt!168157) lt!168153)))

(assert (=> b!363990 (= lt!168153 (arrayCountValidKeys!0 lt!168149 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363990 (= lt!168150 (arrayCountValidKeys!0 lt!168149 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11296 0))(
  ( (Unit!11297) )
))
(declare-fun lt!168154 () Unit!11296)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11296)

(assert (=> b!363990 (= lt!168154 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168149 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168156 () (_ BitVec 32))

(assert (=> b!363990 (= (bvadd lt!168156 lt!168151) lt!168155)))

(assert (=> b!363990 (= lt!168155 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363990 (= lt!168156 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168148 () Unit!11296)

(assert (=> b!363990 (= lt!168148 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363991 () Bool)

(declare-fun res!203152 () Bool)

(assert (=> b!363991 (=> (not res!203152) (not e!222857))))

(assert (=> b!363991 (= res!203152 (and (bvslt (size!10165 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10165 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363988 () Bool)

(assert (=> b!363988 (= e!222856 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363988 (= (arrayCountValidKeys!0 lt!168149 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!168152 () Unit!11296)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20668 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11296)

(assert (=> b!363988 (= lt!168152 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun res!203148 () Bool)

(assert (=> start!36388 (=> (not res!203148) (not e!222857))))

(assert (=> start!36388 (= res!203148 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10165 a!4289))))))

(assert (=> start!36388 e!222857))

(assert (=> start!36388 true))

(declare-fun array_inv!7255 (array!20668) Bool)

(assert (=> start!36388 (array_inv!7255 a!4289)))

(assert (= (and start!36388 res!203148) b!363987))

(assert (= (and b!363987 res!203149) b!363986))

(assert (= (and b!363986 res!203150) b!363991))

(assert (= (and b!363991 res!203152) b!363989))

(assert (= (and b!363989 res!203147) b!363990))

(assert (= (and b!363990 (not res!203151)) b!363988))

(declare-fun m!361341 () Bool)

(assert (=> b!363990 m!361341))

(declare-fun m!361343 () Bool)

(assert (=> b!363990 m!361343))

(declare-fun m!361345 () Bool)

(assert (=> b!363990 m!361345))

(declare-fun m!361347 () Bool)

(assert (=> b!363990 m!361347))

(declare-fun m!361349 () Bool)

(assert (=> b!363990 m!361349))

(declare-fun m!361351 () Bool)

(assert (=> b!363990 m!361351))

(declare-fun m!361353 () Bool)

(assert (=> b!363987 m!361353))

(assert (=> b!363987 m!361353))

(declare-fun m!361355 () Bool)

(assert (=> b!363987 m!361355))

(declare-fun m!361357 () Bool)

(assert (=> b!363989 m!361357))

(declare-fun m!361359 () Bool)

(assert (=> b!363989 m!361359))

(declare-fun m!361361 () Bool)

(assert (=> b!363989 m!361361))

(declare-fun m!361363 () Bool)

(assert (=> b!363988 m!361363))

(declare-fun m!361365 () Bool)

(assert (=> b!363988 m!361365))

(declare-fun m!361367 () Bool)

(assert (=> b!363988 m!361367))

(declare-fun m!361369 () Bool)

(assert (=> start!36388 m!361369))

(declare-fun m!361371 () Bool)

(assert (=> b!363986 m!361371))

(push 1)

(assert (not b!363989))

(assert (not b!363986))

(assert (not b!363987))

(assert (not start!36388))

(assert (not b!363988))

(assert (not b!363990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

