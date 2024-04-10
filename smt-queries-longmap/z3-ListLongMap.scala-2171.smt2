; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36362 () Bool)

(assert start!36362)

(declare-fun b!363783 () Bool)

(declare-fun e!222732 () Bool)

(declare-fun e!222731 () Bool)

(assert (=> b!363783 (= e!222732 e!222731)))

(declare-fun res!202944 () Bool)

(assert (=> b!363783 (=> (not res!202944) (not e!222731))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167916 () (_ BitVec 32))

(declare-fun lt!167913 () (_ BitVec 32))

(assert (=> b!363783 (= res!202944 (and (= lt!167913 (bvadd #b00000000000000000000000000000001 lt!167916)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20642 0))(
  ( (array!20643 (arr!9800 (Array (_ BitVec 32) (_ BitVec 64))) (size!10152 (_ BitVec 32))) )
))
(declare-fun lt!167917 () array!20642)

(declare-fun arrayCountValidKeys!0 (array!20642 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363783 (= lt!167913 (arrayCountValidKeys!0 lt!167917 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20642)

(assert (=> b!363783 (= lt!167916 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363783 (= lt!167917 (array!20643 (store (arr!9800 a!4289) i!1472 k0!2974) (size!10152 a!4289)))))

(declare-fun res!202948 () Bool)

(assert (=> start!36362 (=> (not res!202948) (not e!222732))))

(assert (=> start!36362 (= res!202948 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10152 a!4289))))))

(assert (=> start!36362 e!222732))

(assert (=> start!36362 true))

(declare-fun array_inv!7242 (array!20642) Bool)

(assert (=> start!36362 (array_inv!7242 a!4289)))

(declare-fun b!363784 () Bool)

(declare-fun res!202945 () Bool)

(assert (=> b!363784 (=> (not res!202945) (not e!222732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363784 (= res!202945 (not (validKeyInArray!0 (select (arr!9800 a!4289) i!1472))))))

(declare-fun b!363785 () Bool)

(declare-fun res!202946 () Bool)

(assert (=> b!363785 (=> (not res!202946) (not e!222732))))

(assert (=> b!363785 (= res!202946 (and (bvslt (size!10152 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10152 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363786 () Bool)

(declare-fun res!202947 () Bool)

(assert (=> b!363786 (=> (not res!202947) (not e!222732))))

(assert (=> b!363786 (= res!202947 (validKeyInArray!0 k0!2974))))

(declare-fun b!363787 () Bool)

(assert (=> b!363787 (= e!222731 (not true))))

(assert (=> b!363787 (= (bvadd (arrayCountValidKeys!0 lt!167917 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167913) (arrayCountValidKeys!0 lt!167917 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11270 0))(
  ( (Unit!11271) )
))
(declare-fun lt!167914 () Unit!11270)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11270)

(assert (=> b!363787 (= lt!167914 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167917 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363787 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167916) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167915 () Unit!11270)

(assert (=> b!363787 (= lt!167915 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36362 res!202948) b!363784))

(assert (= (and b!363784 res!202945) b!363786))

(assert (= (and b!363786 res!202947) b!363785))

(assert (= (and b!363785 res!202946) b!363783))

(assert (= (and b!363783 res!202944) b!363787))

(declare-fun m!360991 () Bool)

(assert (=> b!363786 m!360991))

(declare-fun m!360993 () Bool)

(assert (=> start!36362 m!360993))

(declare-fun m!360995 () Bool)

(assert (=> b!363787 m!360995))

(declare-fun m!360997 () Bool)

(assert (=> b!363787 m!360997))

(declare-fun m!360999 () Bool)

(assert (=> b!363787 m!360999))

(declare-fun m!361001 () Bool)

(assert (=> b!363787 m!361001))

(declare-fun m!361003 () Bool)

(assert (=> b!363787 m!361003))

(declare-fun m!361005 () Bool)

(assert (=> b!363787 m!361005))

(declare-fun m!361007 () Bool)

(assert (=> b!363784 m!361007))

(assert (=> b!363784 m!361007))

(declare-fun m!361009 () Bool)

(assert (=> b!363784 m!361009))

(declare-fun m!361011 () Bool)

(assert (=> b!363783 m!361011))

(declare-fun m!361013 () Bool)

(assert (=> b!363783 m!361013))

(declare-fun m!361015 () Bool)

(assert (=> b!363783 m!361015))

(check-sat (not b!363786) (not b!363784) (not start!36362) (not b!363783) (not b!363787))
(check-sat)
