; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36358 () Bool)

(assert start!36358)

(declare-fun b!363753 () Bool)

(declare-fun res!202914 () Bool)

(declare-fun e!222714 () Bool)

(assert (=> b!363753 (=> (not res!202914) (not e!222714))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20638 0))(
  ( (array!20639 (arr!9798 (Array (_ BitVec 32) (_ BitVec 64))) (size!10150 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20638)

(assert (=> b!363753 (= res!202914 (and (bvslt (size!10150 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10150 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363754 () Bool)

(declare-fun e!222713 () Bool)

(assert (=> b!363754 (= e!222714 e!222713)))

(declare-fun res!202917 () Bool)

(assert (=> b!363754 (=> (not res!202917) (not e!222713))))

(declare-fun lt!167883 () (_ BitVec 32))

(declare-fun lt!167886 () (_ BitVec 32))

(assert (=> b!363754 (= res!202917 (and (= lt!167883 (bvadd #b00000000000000000000000000000001 lt!167886)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!167884 () array!20638)

(declare-fun arrayCountValidKeys!0 (array!20638 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363754 (= lt!167883 (arrayCountValidKeys!0 lt!167884 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363754 (= lt!167886 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363754 (= lt!167884 (array!20639 (store (arr!9798 a!4289) i!1472 k!2974) (size!10150 a!4289)))))

(declare-fun b!363755 () Bool)

(assert (=> b!363755 (= e!222713 (not true))))

(assert (=> b!363755 (= (bvadd (arrayCountValidKeys!0 lt!167884 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167883) (arrayCountValidKeys!0 lt!167884 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11266 0))(
  ( (Unit!11267) )
))
(declare-fun lt!167885 () Unit!11266)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11266)

(assert (=> b!363755 (= lt!167885 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167884 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363755 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167886) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167887 () Unit!11266)

(assert (=> b!363755 (= lt!167887 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363756 () Bool)

(declare-fun res!202918 () Bool)

(assert (=> b!363756 (=> (not res!202918) (not e!222714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363756 (= res!202918 (validKeyInArray!0 k!2974))))

(declare-fun b!363757 () Bool)

(declare-fun res!202916 () Bool)

(assert (=> b!363757 (=> (not res!202916) (not e!222714))))

(assert (=> b!363757 (= res!202916 (not (validKeyInArray!0 (select (arr!9798 a!4289) i!1472))))))

(declare-fun res!202915 () Bool)

(assert (=> start!36358 (=> (not res!202915) (not e!222714))))

(assert (=> start!36358 (= res!202915 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10150 a!4289))))))

(assert (=> start!36358 e!222714))

(assert (=> start!36358 true))

(declare-fun array_inv!7240 (array!20638) Bool)

(assert (=> start!36358 (array_inv!7240 a!4289)))

(assert (= (and start!36358 res!202915) b!363757))

(assert (= (and b!363757 res!202916) b!363756))

(assert (= (and b!363756 res!202918) b!363753))

(assert (= (and b!363753 res!202914) b!363754))

(assert (= (and b!363754 res!202917) b!363755))

(declare-fun m!360939 () Bool)

(assert (=> b!363756 m!360939))

(declare-fun m!360941 () Bool)

(assert (=> b!363757 m!360941))

(assert (=> b!363757 m!360941))

(declare-fun m!360943 () Bool)

(assert (=> b!363757 m!360943))

(declare-fun m!360945 () Bool)

(assert (=> b!363754 m!360945))

(declare-fun m!360947 () Bool)

(assert (=> b!363754 m!360947))

(declare-fun m!360949 () Bool)

(assert (=> b!363754 m!360949))

(declare-fun m!360951 () Bool)

(assert (=> start!36358 m!360951))

(declare-fun m!360953 () Bool)

(assert (=> b!363755 m!360953))

(declare-fun m!360955 () Bool)

(assert (=> b!363755 m!360955))

(declare-fun m!360957 () Bool)

(assert (=> b!363755 m!360957))

(declare-fun m!360959 () Bool)

(assert (=> b!363755 m!360959))

(declare-fun m!360961 () Bool)

(assert (=> b!363755 m!360961))

(declare-fun m!360963 () Bool)

(assert (=> b!363755 m!360963))

(push 1)

(assert (not start!36358))

(assert (not b!363754))

(assert (not b!363756))

(assert (not b!363755))

(assert (not b!363757))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

