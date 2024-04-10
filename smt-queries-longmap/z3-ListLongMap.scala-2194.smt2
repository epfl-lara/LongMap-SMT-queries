; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36524 () Bool)

(assert start!36524)

(declare-fun b!364946 () Bool)

(declare-fun res!204014 () Bool)

(declare-fun e!223390 () Bool)

(assert (=> b!364946 (=> (not res!204014) (not e!223390))))

(declare-datatypes ((array!20783 0))(
  ( (array!20784 (arr!9869 (Array (_ BitVec 32) (_ BitVec 64))) (size!10221 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20783)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364946 (= res!204014 (not (validKeyInArray!0 (select (arr!9869 a!4289) i!1472))))))

(declare-fun b!364947 () Bool)

(declare-fun res!204013 () Bool)

(assert (=> b!364947 (=> (not res!204013) (not e!223390))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364947 (= res!204013 (and (bvslt (size!10221 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10221 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364948 () Bool)

(declare-fun e!223388 () Bool)

(assert (=> b!364948 (= e!223388 true)))

(declare-fun lt!168998 () array!20783)

(declare-fun arrayCountValidKeys!0 (array!20783 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364948 (= (arrayCountValidKeys!0 lt!168998 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-datatypes ((Unit!11372 0))(
  ( (Unit!11373) )
))
(declare-fun lt!169000 () Unit!11372)

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20783 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11372)

(assert (=> b!364948 (= lt!169000 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!364949 () Bool)

(declare-fun res!204011 () Bool)

(assert (=> b!364949 (=> (not res!204011) (not e!223390))))

(assert (=> b!364949 (= res!204011 (validKeyInArray!0 k0!2974))))

(declare-fun b!364950 () Bool)

(declare-fun e!223387 () Bool)

(assert (=> b!364950 (= e!223387 (not e!223388))))

(declare-fun res!204015 () Bool)

(assert (=> b!364950 (=> res!204015 e!223388)))

(declare-fun lt!168995 () (_ BitVec 32))

(declare-fun lt!168991 () (_ BitVec 32))

(assert (=> b!364950 (= res!204015 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10221 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168991 (bvadd #b00000000000000000000000000000001 lt!168995)))))))

(declare-fun lt!168994 () (_ BitVec 32))

(declare-fun lt!168996 () (_ BitVec 32))

(assert (=> b!364950 (= (bvadd lt!168994 lt!168996) lt!168991)))

(assert (=> b!364950 (= lt!168991 (arrayCountValidKeys!0 lt!168998 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364950 (= lt!168994 (arrayCountValidKeys!0 lt!168998 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168992 () Unit!11372)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11372)

(assert (=> b!364950 (= lt!168992 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168998 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168997 () (_ BitVec 32))

(declare-fun lt!168993 () (_ BitVec 32))

(assert (=> b!364950 (= (bvadd lt!168997 lt!168993) lt!168995)))

(assert (=> b!364950 (= lt!168995 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364950 (= lt!168997 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168999 () Unit!11372)

(assert (=> b!364950 (= lt!168999 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!204016 () Bool)

(assert (=> start!36524 (=> (not res!204016) (not e!223390))))

(assert (=> start!36524 (= res!204016 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10221 a!4289))))))

(assert (=> start!36524 e!223390))

(assert (=> start!36524 true))

(declare-fun array_inv!7311 (array!20783) Bool)

(assert (=> start!36524 (array_inv!7311 a!4289)))

(declare-fun b!364951 () Bool)

(assert (=> b!364951 (= e!223390 e!223387)))

(declare-fun res!204012 () Bool)

(assert (=> b!364951 (=> (not res!204012) (not e!223387))))

(assert (=> b!364951 (= res!204012 (and (= lt!168996 (bvadd #b00000000000000000000000000000001 lt!168993)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364951 (= lt!168996 (arrayCountValidKeys!0 lt!168998 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364951 (= lt!168993 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364951 (= lt!168998 (array!20784 (store (arr!9869 a!4289) i!1472 k0!2974) (size!10221 a!4289)))))

(assert (= (and start!36524 res!204016) b!364946))

(assert (= (and b!364946 res!204014) b!364949))

(assert (= (and b!364949 res!204011) b!364947))

(assert (= (and b!364947 res!204013) b!364951))

(assert (= (and b!364951 res!204012) b!364950))

(assert (= (and b!364950 (not res!204015)) b!364948))

(declare-fun m!362707 () Bool)

(assert (=> b!364948 m!362707))

(declare-fun m!362709 () Bool)

(assert (=> b!364948 m!362709))

(declare-fun m!362711 () Bool)

(assert (=> b!364948 m!362711))

(declare-fun m!362713 () Bool)

(assert (=> b!364949 m!362713))

(declare-fun m!362715 () Bool)

(assert (=> start!36524 m!362715))

(declare-fun m!362717 () Bool)

(assert (=> b!364950 m!362717))

(declare-fun m!362719 () Bool)

(assert (=> b!364950 m!362719))

(declare-fun m!362721 () Bool)

(assert (=> b!364950 m!362721))

(declare-fun m!362723 () Bool)

(assert (=> b!364950 m!362723))

(declare-fun m!362725 () Bool)

(assert (=> b!364950 m!362725))

(declare-fun m!362727 () Bool)

(assert (=> b!364950 m!362727))

(declare-fun m!362729 () Bool)

(assert (=> b!364946 m!362729))

(assert (=> b!364946 m!362729))

(declare-fun m!362731 () Bool)

(assert (=> b!364946 m!362731))

(declare-fun m!362733 () Bool)

(assert (=> b!364951 m!362733))

(declare-fun m!362735 () Bool)

(assert (=> b!364951 m!362735))

(declare-fun m!362737 () Bool)

(assert (=> b!364951 m!362737))

(check-sat (not b!364949) (not b!364950) (not start!36524) (not b!364946) (not b!364951) (not b!364948))
(check-sat)
