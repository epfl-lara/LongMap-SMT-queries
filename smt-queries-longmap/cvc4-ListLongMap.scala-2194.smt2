; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36526 () Bool)

(assert start!36526)

(declare-fun b!364964 () Bool)

(declare-fun e!223402 () Bool)

(assert (=> b!364964 (= e!223402 true)))

(declare-datatypes ((array!20785 0))(
  ( (array!20786 (arr!9870 (Array (_ BitVec 32) (_ BitVec 64))) (size!10222 (_ BitVec 32))) )
))
(declare-fun lt!169022 () array!20785)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun a!4289 () array!20785)

(declare-fun arrayCountValidKeys!0 (array!20785 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364964 (= (arrayCountValidKeys!0 lt!169022 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-datatypes ((Unit!11374 0))(
  ( (Unit!11375) )
))
(declare-fun lt!169029 () Unit!11374)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11374)

(assert (=> b!364964 (= lt!169029 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!364965 () Bool)

(declare-fun res!204029 () Bool)

(declare-fun e!223399 () Bool)

(assert (=> b!364965 (=> (not res!204029) (not e!223399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364965 (= res!204029 (validKeyInArray!0 k!2974))))

(declare-fun b!364966 () Bool)

(declare-fun e!223400 () Bool)

(assert (=> b!364966 (= e!223399 e!223400)))

(declare-fun res!204032 () Bool)

(assert (=> b!364966 (=> (not res!204032) (not e!223400))))

(declare-fun lt!169024 () (_ BitVec 32))

(declare-fun lt!169030 () (_ BitVec 32))

(assert (=> b!364966 (= res!204032 (and (= lt!169030 (bvadd #b00000000000000000000000000000001 lt!169024)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364966 (= lt!169030 (arrayCountValidKeys!0 lt!169022 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364966 (= lt!169024 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364966 (= lt!169022 (array!20786 (store (arr!9870 a!4289) i!1472 k!2974) (size!10222 a!4289)))))

(declare-fun b!364967 () Bool)

(assert (=> b!364967 (= e!223400 (not e!223402))))

(declare-fun res!204031 () Bool)

(assert (=> b!364967 (=> res!204031 e!223402)))

(declare-fun lt!169027 () (_ BitVec 32))

(declare-fun lt!169025 () (_ BitVec 32))

(assert (=> b!364967 (= res!204031 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10222 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!169027 (bvadd #b00000000000000000000000000000001 lt!169025)))))))

(declare-fun lt!169028 () (_ BitVec 32))

(assert (=> b!364967 (= (bvadd lt!169028 lt!169030) lt!169027)))

(assert (=> b!364967 (= lt!169027 (arrayCountValidKeys!0 lt!169022 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364967 (= lt!169028 (arrayCountValidKeys!0 lt!169022 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!169026 () Unit!11374)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11374)

(assert (=> b!364967 (= lt!169026 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!169022 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!169023 () (_ BitVec 32))

(assert (=> b!364967 (= (bvadd lt!169023 lt!169024) lt!169025)))

(assert (=> b!364967 (= lt!169025 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364967 (= lt!169023 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!169021 () Unit!11374)

(assert (=> b!364967 (= lt!169021 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364969 () Bool)

(declare-fun res!204034 () Bool)

(assert (=> b!364969 (=> (not res!204034) (not e!223399))))

(assert (=> b!364969 (= res!204034 (and (bvslt (size!10222 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10222 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364968 () Bool)

(declare-fun res!204030 () Bool)

(assert (=> b!364968 (=> (not res!204030) (not e!223399))))

(assert (=> b!364968 (= res!204030 (not (validKeyInArray!0 (select (arr!9870 a!4289) i!1472))))))

(declare-fun res!204033 () Bool)

(assert (=> start!36526 (=> (not res!204033) (not e!223399))))

(assert (=> start!36526 (= res!204033 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10222 a!4289))))))

(assert (=> start!36526 e!223399))

(assert (=> start!36526 true))

(declare-fun array_inv!7312 (array!20785) Bool)

(assert (=> start!36526 (array_inv!7312 a!4289)))

(assert (= (and start!36526 res!204033) b!364968))

(assert (= (and b!364968 res!204030) b!364965))

(assert (= (and b!364965 res!204029) b!364969))

(assert (= (and b!364969 res!204034) b!364966))

(assert (= (and b!364966 res!204032) b!364967))

(assert (= (and b!364967 (not res!204031)) b!364964))

(declare-fun m!362739 () Bool)

(assert (=> start!36526 m!362739))

(declare-fun m!362741 () Bool)

(assert (=> b!364967 m!362741))

(declare-fun m!362743 () Bool)

(assert (=> b!364967 m!362743))

(declare-fun m!362745 () Bool)

(assert (=> b!364967 m!362745))

(declare-fun m!362747 () Bool)

(assert (=> b!364967 m!362747))

(declare-fun m!362749 () Bool)

(assert (=> b!364967 m!362749))

(declare-fun m!362751 () Bool)

(assert (=> b!364967 m!362751))

(declare-fun m!362753 () Bool)

(assert (=> b!364965 m!362753))

(declare-fun m!362755 () Bool)

(assert (=> b!364966 m!362755))

(declare-fun m!362757 () Bool)

(assert (=> b!364966 m!362757))

(declare-fun m!362759 () Bool)

(assert (=> b!364966 m!362759))

(declare-fun m!362761 () Bool)

(assert (=> b!364968 m!362761))

(assert (=> b!364968 m!362761))

(declare-fun m!362763 () Bool)

(assert (=> b!364968 m!362763))

(declare-fun m!362765 () Bool)

(assert (=> b!364964 m!362765))

(declare-fun m!362767 () Bool)

(assert (=> b!364964 m!362767))

(declare-fun m!362769 () Bool)

(assert (=> b!364964 m!362769))

(push 1)

(assert (not b!364964))

(assert (not start!36526))

(assert (not b!364967))

(assert (not b!364965))

(assert (not b!364966))

(assert (not b!364968))

(check-sat)

(pop 1)

(push 1)

