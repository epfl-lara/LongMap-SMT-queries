; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36364 () Bool)

(assert start!36364)

(declare-fun b!363798 () Bool)

(declare-fun res!202963 () Bool)

(declare-fun e!222742 () Bool)

(assert (=> b!363798 (=> (not res!202963) (not e!222742))))

(declare-datatypes ((array!20644 0))(
  ( (array!20645 (arr!9801 (Array (_ BitVec 32) (_ BitVec 64))) (size!10153 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20644)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363798 (= res!202963 (not (validKeyInArray!0 (select (arr!9801 a!4289) i!1472))))))

(declare-fun res!202962 () Bool)

(assert (=> start!36364 (=> (not res!202962) (not e!222742))))

(assert (=> start!36364 (= res!202962 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10153 a!4289))))))

(assert (=> start!36364 e!222742))

(assert (=> start!36364 true))

(declare-fun array_inv!7243 (array!20644) Bool)

(assert (=> start!36364 (array_inv!7243 a!4289)))

(declare-fun b!363799 () Bool)

(declare-fun res!202959 () Bool)

(assert (=> b!363799 (=> (not res!202959) (not e!222742))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363799 (= res!202959 (and (bvslt (size!10153 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10153 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363800 () Bool)

(declare-fun res!202960 () Bool)

(assert (=> b!363800 (=> (not res!202960) (not e!222742))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363800 (= res!202960 (validKeyInArray!0 k!2974))))

(declare-fun b!363801 () Bool)

(declare-fun e!222741 () Bool)

(assert (=> b!363801 (= e!222741 (not true))))

(declare-fun lt!167929 () (_ BitVec 32))

(declare-fun lt!167930 () array!20644)

(declare-fun arrayCountValidKeys!0 (array!20644 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363801 (= (bvadd (arrayCountValidKeys!0 lt!167930 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167929) (arrayCountValidKeys!0 lt!167930 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11272 0))(
  ( (Unit!11273) )
))
(declare-fun lt!167931 () Unit!11272)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11272)

(assert (=> b!363801 (= lt!167931 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167930 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167928 () (_ BitVec 32))

(assert (=> b!363801 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167928) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167932 () Unit!11272)

(assert (=> b!363801 (= lt!167932 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363802 () Bool)

(assert (=> b!363802 (= e!222742 e!222741)))

(declare-fun res!202961 () Bool)

(assert (=> b!363802 (=> (not res!202961) (not e!222741))))

(assert (=> b!363802 (= res!202961 (and (= lt!167929 (bvadd #b00000000000000000000000000000001 lt!167928)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363802 (= lt!167929 (arrayCountValidKeys!0 lt!167930 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363802 (= lt!167928 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363802 (= lt!167930 (array!20645 (store (arr!9801 a!4289) i!1472 k!2974) (size!10153 a!4289)))))

(assert (= (and start!36364 res!202962) b!363798))

(assert (= (and b!363798 res!202963) b!363800))

(assert (= (and b!363800 res!202960) b!363799))

(assert (= (and b!363799 res!202959) b!363802))

(assert (= (and b!363802 res!202961) b!363801))

(declare-fun m!361017 () Bool)

(assert (=> b!363802 m!361017))

(declare-fun m!361019 () Bool)

(assert (=> b!363802 m!361019))

(declare-fun m!361021 () Bool)

(assert (=> b!363802 m!361021))

(declare-fun m!361023 () Bool)

(assert (=> b!363798 m!361023))

(assert (=> b!363798 m!361023))

(declare-fun m!361025 () Bool)

(assert (=> b!363798 m!361025))

(declare-fun m!361027 () Bool)

(assert (=> b!363800 m!361027))

(declare-fun m!361029 () Bool)

(assert (=> b!363801 m!361029))

(declare-fun m!361031 () Bool)

(assert (=> b!363801 m!361031))

(declare-fun m!361033 () Bool)

(assert (=> b!363801 m!361033))

(declare-fun m!361035 () Bool)

(assert (=> b!363801 m!361035))

(declare-fun m!361037 () Bool)

(assert (=> b!363801 m!361037))

(declare-fun m!361039 () Bool)

(assert (=> b!363801 m!361039))

(declare-fun m!361041 () Bool)

(assert (=> start!36364 m!361041))

(push 1)

(assert (not start!36364))

(assert (not b!363800))

(assert (not b!363801))

(assert (not b!363802))

(assert (not b!363798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

