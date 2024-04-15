; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36506 () Bool)

(assert start!36506)

(declare-fun b!364640 () Bool)

(declare-fun res!203847 () Bool)

(declare-fun e!223190 () Bool)

(assert (=> b!364640 (=> (not res!203847) (not e!223190))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364640 (= res!203847 (validKeyInArray!0 k!2974))))

(declare-fun b!364641 () Bool)

(declare-fun e!223192 () Bool)

(assert (=> b!364641 (= e!223190 e!223192)))

(declare-fun res!203850 () Bool)

(assert (=> b!364641 (=> (not res!203850) (not e!223192))))

(declare-fun lt!168704 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168700 () (_ BitVec 32))

(assert (=> b!364641 (= res!203850 (and (= lt!168704 (bvadd #b00000000000000000000000000000001 lt!168700)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20761 0))(
  ( (array!20762 (arr!9858 (Array (_ BitVec 32) (_ BitVec 64))) (size!10211 (_ BitVec 32))) )
))
(declare-fun lt!168701 () array!20761)

(declare-fun arrayCountValidKeys!0 (array!20761 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364641 (= lt!168704 (arrayCountValidKeys!0 lt!168701 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20761)

(assert (=> b!364641 (= lt!168700 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364641 (= lt!168701 (array!20762 (store (arr!9858 a!4289) i!1472 k!2974) (size!10211 a!4289)))))

(declare-fun b!364643 () Bool)

(declare-fun res!203849 () Bool)

(assert (=> b!364643 (=> (not res!203849) (not e!223190))))

(assert (=> b!364643 (= res!203849 (not (validKeyInArray!0 (select (arr!9858 a!4289) i!1472))))))

(declare-fun b!364644 () Bool)

(declare-fun res!203848 () Bool)

(assert (=> b!364644 (=> (not res!203848) (not e!223190))))

(assert (=> b!364644 (= res!203848 (and (bvslt (size!10211 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10211 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun lt!168705 () (_ BitVec 32))

(declare-fun b!364642 () Bool)

(declare-fun lt!168703 () (_ BitVec 32))

(assert (=> b!364642 (= e!223192 (not (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10211 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168703 (bvadd #b00000000000000000000000000000001 lt!168705))) (bvslt (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))))

(declare-fun lt!168702 () (_ BitVec 32))

(assert (=> b!364642 (= (bvadd lt!168702 lt!168704) lt!168703)))

(assert (=> b!364642 (= lt!168703 (arrayCountValidKeys!0 lt!168701 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364642 (= lt!168702 (arrayCountValidKeys!0 lt!168701 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11346 0))(
  ( (Unit!11347) )
))
(declare-fun lt!168699 () Unit!11346)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11346)

(assert (=> b!364642 (= lt!168699 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168701 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168698 () (_ BitVec 32))

(assert (=> b!364642 (= (bvadd lt!168698 lt!168700) lt!168705)))

(assert (=> b!364642 (= lt!168705 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364642 (= lt!168698 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168706 () Unit!11346)

(assert (=> b!364642 (= lt!168706 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!203851 () Bool)

(assert (=> start!36506 (=> (not res!203851) (not e!223190))))

(assert (=> start!36506 (= res!203851 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10211 a!4289))))))

(assert (=> start!36506 e!223190))

(assert (=> start!36506 true))

(declare-fun array_inv!7307 (array!20761) Bool)

(assert (=> start!36506 (array_inv!7307 a!4289)))

(assert (= (and start!36506 res!203851) b!364643))

(assert (= (and b!364643 res!203849) b!364640))

(assert (= (and b!364640 res!203847) b!364644))

(assert (= (and b!364644 res!203848) b!364641))

(assert (= (and b!364641 res!203850) b!364642))

(declare-fun m!361925 () Bool)

(assert (=> start!36506 m!361925))

(declare-fun m!361927 () Bool)

(assert (=> b!364643 m!361927))

(assert (=> b!364643 m!361927))

(declare-fun m!361929 () Bool)

(assert (=> b!364643 m!361929))

(declare-fun m!361931 () Bool)

(assert (=> b!364642 m!361931))

(declare-fun m!361933 () Bool)

(assert (=> b!364642 m!361933))

(declare-fun m!361935 () Bool)

(assert (=> b!364642 m!361935))

(declare-fun m!361937 () Bool)

(assert (=> b!364642 m!361937))

(declare-fun m!361939 () Bool)

(assert (=> b!364642 m!361939))

(declare-fun m!361941 () Bool)

(assert (=> b!364642 m!361941))

(declare-fun m!361943 () Bool)

(assert (=> b!364641 m!361943))

(declare-fun m!361945 () Bool)

(assert (=> b!364641 m!361945))

(declare-fun m!361947 () Bool)

(assert (=> b!364641 m!361947))

(declare-fun m!361949 () Bool)

(assert (=> b!364640 m!361949))

(push 1)

(assert (not start!36506))

(assert (not b!364641))

(assert (not b!364640))

(assert (not b!364643))

(assert (not b!364642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

