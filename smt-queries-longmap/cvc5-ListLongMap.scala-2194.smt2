; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36522 () Bool)

(assert start!36522)

(declare-fun b!364928 () Bool)

(declare-fun res!203996 () Bool)

(declare-fun e!223376 () Bool)

(assert (=> b!364928 (=> (not res!203996) (not e!223376))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364928 (= res!203996 (validKeyInArray!0 k!2974))))

(declare-fun b!364929 () Bool)

(declare-fun e!223378 () Bool)

(assert (=> b!364929 (= e!223376 e!223378)))

(declare-fun res!203994 () Bool)

(assert (=> b!364929 (=> (not res!203994) (not e!223378))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168965 () (_ BitVec 32))

(declare-fun lt!168967 () (_ BitVec 32))

(assert (=> b!364929 (= res!203994 (and (= lt!168965 (bvadd #b00000000000000000000000000000001 lt!168967)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!20781 0))(
  ( (array!20782 (arr!9868 (Array (_ BitVec 32) (_ BitVec 64))) (size!10220 (_ BitVec 32))) )
))
(declare-fun lt!168961 () array!20781)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20781 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364929 (= lt!168965 (arrayCountValidKeys!0 lt!168961 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20781)

(assert (=> b!364929 (= lt!168967 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364929 (= lt!168961 (array!20782 (store (arr!9868 a!4289) i!1472 k!2974) (size!10220 a!4289)))))

(declare-fun b!364930 () Bool)

(declare-fun res!203995 () Bool)

(assert (=> b!364930 (=> (not res!203995) (not e!223376))))

(assert (=> b!364930 (= res!203995 (not (validKeyInArray!0 (select (arr!9868 a!4289) i!1472))))))

(declare-fun b!364931 () Bool)

(declare-fun res!203993 () Bool)

(assert (=> b!364931 (=> (not res!203993) (not e!223376))))

(assert (=> b!364931 (= res!203993 (and (bvslt (size!10220 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10220 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203998 () Bool)

(assert (=> start!36522 (=> (not res!203998) (not e!223376))))

(assert (=> start!36522 (= res!203998 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10220 a!4289))))))

(assert (=> start!36522 e!223376))

(assert (=> start!36522 true))

(declare-fun array_inv!7310 (array!20781) Bool)

(assert (=> start!36522 (array_inv!7310 a!4289)))

(declare-fun b!364932 () Bool)

(declare-fun e!223375 () Bool)

(assert (=> b!364932 (= e!223375 true)))

(assert (=> b!364932 (= (arrayCountValidKeys!0 lt!168961 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-datatypes ((Unit!11370 0))(
  ( (Unit!11371) )
))
(declare-fun lt!168963 () Unit!11370)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20781 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11370)

(assert (=> b!364932 (= lt!168963 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!364933 () Bool)

(assert (=> b!364933 (= e!223378 (not e!223375))))

(declare-fun res!203997 () Bool)

(assert (=> b!364933 (=> res!203997 e!223375)))

(declare-fun lt!168966 () (_ BitVec 32))

(declare-fun lt!168964 () (_ BitVec 32))

(assert (=> b!364933 (= res!203997 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10220 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168964 (bvadd #b00000000000000000000000000000001 lt!168966)))))))

(declare-fun lt!168969 () (_ BitVec 32))

(assert (=> b!364933 (= (bvadd lt!168969 lt!168965) lt!168964)))

(assert (=> b!364933 (= lt!168964 (arrayCountValidKeys!0 lt!168961 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364933 (= lt!168969 (arrayCountValidKeys!0 lt!168961 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168962 () Unit!11370)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11370)

(assert (=> b!364933 (= lt!168962 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168961 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168970 () (_ BitVec 32))

(assert (=> b!364933 (= (bvadd lt!168970 lt!168967) lt!168966)))

(assert (=> b!364933 (= lt!168966 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364933 (= lt!168970 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168968 () Unit!11370)

(assert (=> b!364933 (= lt!168968 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36522 res!203998) b!364930))

(assert (= (and b!364930 res!203995) b!364928))

(assert (= (and b!364928 res!203996) b!364931))

(assert (= (and b!364931 res!203993) b!364929))

(assert (= (and b!364929 res!203994) b!364933))

(assert (= (and b!364933 (not res!203997)) b!364932))

(declare-fun m!362675 () Bool)

(assert (=> b!364928 m!362675))

(declare-fun m!362677 () Bool)

(assert (=> start!36522 m!362677))

(declare-fun m!362679 () Bool)

(assert (=> b!364932 m!362679))

(declare-fun m!362681 () Bool)

(assert (=> b!364932 m!362681))

(declare-fun m!362683 () Bool)

(assert (=> b!364932 m!362683))

(declare-fun m!362685 () Bool)

(assert (=> b!364929 m!362685))

(declare-fun m!362687 () Bool)

(assert (=> b!364929 m!362687))

(declare-fun m!362689 () Bool)

(assert (=> b!364929 m!362689))

(declare-fun m!362691 () Bool)

(assert (=> b!364930 m!362691))

(assert (=> b!364930 m!362691))

(declare-fun m!362693 () Bool)

(assert (=> b!364930 m!362693))

(declare-fun m!362695 () Bool)

(assert (=> b!364933 m!362695))

(declare-fun m!362697 () Bool)

(assert (=> b!364933 m!362697))

(declare-fun m!362699 () Bool)

(assert (=> b!364933 m!362699))

(declare-fun m!362701 () Bool)

(assert (=> b!364933 m!362701))

(declare-fun m!362703 () Bool)

(assert (=> b!364933 m!362703))

(declare-fun m!362705 () Bool)

(assert (=> b!364933 m!362705))

(push 1)

(assert (not b!364930))

(assert (not b!364933))

(assert (not b!364929))

(assert (not b!364928))

(assert (not start!36522))

(assert (not b!364932))

(check-sat)

