; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36376 () Bool)

(assert start!36376)

(declare-fun b!363888 () Bool)

(declare-fun e!222794 () Bool)

(declare-fun e!222796 () Bool)

(assert (=> b!363888 (= e!222794 e!222796)))

(declare-fun res!203052 () Bool)

(assert (=> b!363888 (=> (not res!203052) (not e!222796))))

(declare-fun lt!168019 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168021 () (_ BitVec 32))

(assert (=> b!363888 (= res!203052 (and (= lt!168019 (bvadd #b00000000000000000000000000000001 lt!168021)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!20656 0))(
  ( (array!20657 (arr!9807 (Array (_ BitVec 32) (_ BitVec 64))) (size!10159 (_ BitVec 32))) )
))
(declare-fun lt!168018 () array!20656)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20656 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363888 (= lt!168019 (arrayCountValidKeys!0 lt!168018 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20656)

(assert (=> b!363888 (= lt!168021 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363888 (= lt!168018 (array!20657 (store (arr!9807 a!4289) i!1472 k!2974) (size!10159 a!4289)))))

(declare-fun b!363889 () Bool)

(declare-fun res!203049 () Bool)

(assert (=> b!363889 (=> (not res!203049) (not e!222794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363889 (= res!203049 (not (validKeyInArray!0 (select (arr!9807 a!4289) i!1472))))))

(declare-fun b!363890 () Bool)

(declare-fun res!203051 () Bool)

(assert (=> b!363890 (=> (not res!203051) (not e!222794))))

(assert (=> b!363890 (= res!203051 (and (bvslt (size!10159 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10159 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203050 () Bool)

(assert (=> start!36376 (=> (not res!203050) (not e!222794))))

(assert (=> start!36376 (= res!203050 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10159 a!4289))))))

(assert (=> start!36376 e!222794))

(assert (=> start!36376 true))

(declare-fun array_inv!7249 (array!20656) Bool)

(assert (=> start!36376 (array_inv!7249 a!4289)))

(declare-fun b!363891 () Bool)

(assert (=> b!363891 (= e!222796 (not true))))

(assert (=> b!363891 (= (bvadd (arrayCountValidKeys!0 lt!168018 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168019) (arrayCountValidKeys!0 lt!168018 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11284 0))(
  ( (Unit!11285) )
))
(declare-fun lt!168020 () Unit!11284)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11284)

(assert (=> b!363891 (= lt!168020 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168018 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363891 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168021) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168022 () Unit!11284)

(assert (=> b!363891 (= lt!168022 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363892 () Bool)

(declare-fun res!203053 () Bool)

(assert (=> b!363892 (=> (not res!203053) (not e!222794))))

(assert (=> b!363892 (= res!203053 (validKeyInArray!0 k!2974))))

(assert (= (and start!36376 res!203050) b!363889))

(assert (= (and b!363889 res!203049) b!363892))

(assert (= (and b!363892 res!203053) b!363890))

(assert (= (and b!363890 res!203051) b!363888))

(assert (= (and b!363888 res!203052) b!363891))

(declare-fun m!361173 () Bool)

(assert (=> b!363892 m!361173))

(declare-fun m!361175 () Bool)

(assert (=> b!363888 m!361175))

(declare-fun m!361177 () Bool)

(assert (=> b!363888 m!361177))

(declare-fun m!361179 () Bool)

(assert (=> b!363888 m!361179))

(declare-fun m!361181 () Bool)

(assert (=> b!363891 m!361181))

(declare-fun m!361183 () Bool)

(assert (=> b!363891 m!361183))

(declare-fun m!361185 () Bool)

(assert (=> b!363891 m!361185))

(declare-fun m!361187 () Bool)

(assert (=> b!363891 m!361187))

(declare-fun m!361189 () Bool)

(assert (=> b!363891 m!361189))

(declare-fun m!361191 () Bool)

(assert (=> b!363891 m!361191))

(declare-fun m!361193 () Bool)

(assert (=> b!363889 m!361193))

(assert (=> b!363889 m!361193))

(declare-fun m!361195 () Bool)

(assert (=> b!363889 m!361195))

(declare-fun m!361197 () Bool)

(assert (=> start!36376 m!361197))

(push 1)

(assert (not b!363892))

(assert (not b!363889))

(assert (not start!36376))

(assert (not b!363891))

(assert (not b!363888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

