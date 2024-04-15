; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36370 () Bool)

(assert start!36370)

(declare-fun res!202984 () Bool)

(declare-fun e!222660 () Bool)

(assert (=> start!36370 (=> (not res!202984) (not e!222660))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20646 0))(
  ( (array!20647 (arr!9802 (Array (_ BitVec 32) (_ BitVec 64))) (size!10155 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20646)

(assert (=> start!36370 (= res!202984 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10155 a!4289))))))

(assert (=> start!36370 e!222660))

(assert (=> start!36370 true))

(declare-fun array_inv!7251 (array!20646) Bool)

(assert (=> start!36370 (array_inv!7251 a!4289)))

(declare-fun b!363679 () Bool)

(declare-fun res!202986 () Bool)

(assert (=> b!363679 (=> (not res!202986) (not e!222660))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363679 (= res!202986 (validKeyInArray!0 k0!2974))))

(declare-fun b!363680 () Bool)

(declare-fun res!202987 () Bool)

(assert (=> b!363680 (=> (not res!202987) (not e!222660))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363680 (= res!202987 (and (bvslt (size!10155 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10155 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363681 () Bool)

(declare-fun res!202983 () Bool)

(assert (=> b!363681 (=> (not res!202983) (not e!222660))))

(assert (=> b!363681 (= res!202983 (not (validKeyInArray!0 (select (arr!9802 a!4289) i!1472))))))

(declare-fun b!363682 () Bool)

(declare-fun e!222659 () Bool)

(assert (=> b!363682 (= e!222660 e!222659)))

(declare-fun res!202982 () Bool)

(assert (=> b!363682 (=> (not res!202982) (not e!222659))))

(declare-fun lt!167854 () (_ BitVec 32))

(declare-fun lt!167863 () (_ BitVec 32))

(assert (=> b!363682 (= res!202982 (and (= lt!167854 (bvadd #b00000000000000000000000000000001 lt!167863)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!167860 () array!20646)

(declare-fun arrayCountValidKeys!0 (array!20646 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363682 (= lt!167854 (arrayCountValidKeys!0 lt!167860 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363682 (= lt!167863 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363682 (= lt!167860 (array!20647 (store (arr!9802 a!4289) i!1472 k0!2974) (size!10155 a!4289)))))

(declare-fun b!363683 () Bool)

(declare-fun e!222658 () Bool)

(assert (=> b!363683 (= e!222659 (not e!222658))))

(declare-fun res!202985 () Bool)

(assert (=> b!363683 (=> res!202985 e!222658)))

(declare-fun lt!167861 () (_ BitVec 32))

(declare-fun lt!167855 () (_ BitVec 32))

(assert (=> b!363683 (= res!202985 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10155 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!167861 (bvadd #b00000000000000000000000000000001 lt!167855)))))))

(declare-fun lt!167862 () (_ BitVec 32))

(assert (=> b!363683 (= (bvadd lt!167862 lt!167854) lt!167861)))

(assert (=> b!363683 (= lt!167861 (arrayCountValidKeys!0 lt!167860 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363683 (= lt!167862 (arrayCountValidKeys!0 lt!167860 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11270 0))(
  ( (Unit!11271) )
))
(declare-fun lt!167856 () Unit!11270)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11270)

(assert (=> b!363683 (= lt!167856 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167860 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167858 () (_ BitVec 32))

(assert (=> b!363683 (= (bvadd lt!167858 lt!167863) lt!167855)))

(assert (=> b!363683 (= lt!167855 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363683 (= lt!167858 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!167859 () Unit!11270)

(assert (=> b!363683 (= lt!167859 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363684 () Bool)

(assert (=> b!363684 (= e!222658 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363684 (= (arrayCountValidKeys!0 lt!167860 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!167857 () Unit!11270)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20646 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11270)

(assert (=> b!363684 (= lt!167857 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(assert (= (and start!36370 res!202984) b!363681))

(assert (= (and b!363681 res!202983) b!363679))

(assert (= (and b!363679 res!202986) b!363680))

(assert (= (and b!363680 res!202987) b!363682))

(assert (= (and b!363682 res!202982) b!363683))

(assert (= (and b!363683 (not res!202985)) b!363684))

(declare-fun m!360553 () Bool)

(assert (=> b!363681 m!360553))

(assert (=> b!363681 m!360553))

(declare-fun m!360555 () Bool)

(assert (=> b!363681 m!360555))

(declare-fun m!360557 () Bool)

(assert (=> b!363679 m!360557))

(declare-fun m!360559 () Bool)

(assert (=> b!363682 m!360559))

(declare-fun m!360561 () Bool)

(assert (=> b!363682 m!360561))

(declare-fun m!360563 () Bool)

(assert (=> b!363682 m!360563))

(declare-fun m!360565 () Bool)

(assert (=> start!36370 m!360565))

(declare-fun m!360567 () Bool)

(assert (=> b!363684 m!360567))

(declare-fun m!360569 () Bool)

(assert (=> b!363684 m!360569))

(declare-fun m!360571 () Bool)

(assert (=> b!363684 m!360571))

(declare-fun m!360573 () Bool)

(assert (=> b!363683 m!360573))

(declare-fun m!360575 () Bool)

(assert (=> b!363683 m!360575))

(declare-fun m!360577 () Bool)

(assert (=> b!363683 m!360577))

(declare-fun m!360579 () Bool)

(assert (=> b!363683 m!360579))

(declare-fun m!360581 () Bool)

(assert (=> b!363683 m!360581))

(declare-fun m!360583 () Bool)

(assert (=> b!363683 m!360583))

(check-sat (not b!363679) (not b!363684) (not b!363683) (not start!36370) (not b!363681) (not b!363682))
(check-sat)
