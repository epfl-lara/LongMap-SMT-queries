; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36468 () Bool)

(assert start!36468)

(declare-fun b!364605 () Bool)

(declare-fun e!223190 () Bool)

(assert (=> b!364605 (= e!223190 (not true))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168618 () (_ BitVec 32))

(declare-datatypes ((array!20748 0))(
  ( (array!20749 (arr!9853 (Array (_ BitVec 32) (_ BitVec 64))) (size!10205 (_ BitVec 32))) )
))
(declare-fun lt!168620 () array!20748)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20748 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364605 (= (bvadd (arrayCountValidKeys!0 lt!168620 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168618) (arrayCountValidKeys!0 lt!168620 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11340 0))(
  ( (Unit!11341) )
))
(declare-fun lt!168619 () Unit!11340)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11340)

(assert (=> b!364605 (= lt!168619 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168620 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168621 () (_ BitVec 32))

(declare-fun a!4289 () array!20748)

(assert (=> b!364605 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168621) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168622 () Unit!11340)

(assert (=> b!364605 (= lt!168622 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364606 () Bool)

(declare-fun res!203766 () Bool)

(declare-fun e!223192 () Bool)

(assert (=> b!364606 (=> (not res!203766) (not e!223192))))

(assert (=> b!364606 (= res!203766 (and (bvslt (size!10205 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10205 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364607 () Bool)

(declare-fun res!203768 () Bool)

(assert (=> b!364607 (=> (not res!203768) (not e!223192))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364607 (= res!203768 (validKeyInArray!0 k!2974))))

(declare-fun b!364608 () Bool)

(declare-fun res!203769 () Bool)

(assert (=> b!364608 (=> (not res!203769) (not e!223192))))

(assert (=> b!364608 (= res!203769 (not (validKeyInArray!0 (select (arr!9853 a!4289) i!1472))))))

(declare-fun res!203770 () Bool)

(assert (=> start!36468 (=> (not res!203770) (not e!223192))))

(assert (=> start!36468 (= res!203770 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10205 a!4289))))))

(assert (=> start!36468 e!223192))

(assert (=> start!36468 true))

(declare-fun array_inv!7295 (array!20748) Bool)

(assert (=> start!36468 (array_inv!7295 a!4289)))

(declare-fun b!364609 () Bool)

(assert (=> b!364609 (= e!223192 e!223190)))

(declare-fun res!203767 () Bool)

(assert (=> b!364609 (=> (not res!203767) (not e!223190))))

(assert (=> b!364609 (= res!203767 (and (= lt!168618 (bvadd #b00000000000000000000000000000001 lt!168621)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364609 (= lt!168618 (arrayCountValidKeys!0 lt!168620 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364609 (= lt!168621 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364609 (= lt!168620 (array!20749 (store (arr!9853 a!4289) i!1472 k!2974) (size!10205 a!4289)))))

(assert (= (and start!36468 res!203770) b!364608))

(assert (= (and b!364608 res!203769) b!364607))

(assert (= (and b!364607 res!203768) b!364606))

(assert (= (and b!364606 res!203766) b!364609))

(assert (= (and b!364609 res!203767) b!364605))

(declare-fun m!362189 () Bool)

(assert (=> b!364605 m!362189))

(declare-fun m!362191 () Bool)

(assert (=> b!364605 m!362191))

(declare-fun m!362193 () Bool)

(assert (=> b!364605 m!362193))

(declare-fun m!362195 () Bool)

(assert (=> b!364605 m!362195))

(declare-fun m!362197 () Bool)

(assert (=> b!364605 m!362197))

(declare-fun m!362199 () Bool)

(assert (=> b!364605 m!362199))

(declare-fun m!362201 () Bool)

(assert (=> b!364607 m!362201))

(declare-fun m!362203 () Bool)

(assert (=> b!364608 m!362203))

(assert (=> b!364608 m!362203))

(declare-fun m!362205 () Bool)

(assert (=> b!364608 m!362205))

(declare-fun m!362207 () Bool)

(assert (=> start!36468 m!362207))

(declare-fun m!362209 () Bool)

(assert (=> b!364609 m!362209))

(declare-fun m!362211 () Bool)

(assert (=> b!364609 m!362211))

(declare-fun m!362213 () Bool)

(assert (=> b!364609 m!362213))

(push 1)

(assert (not b!364608))

(assert (not start!36468))

(assert (not b!364607))

(assert (not b!364605))

(assert (not b!364609))

(check-sat)

