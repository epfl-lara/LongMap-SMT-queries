; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101978 () Bool)

(assert start!101978)

(declare-fun b!1227754 () Bool)

(declare-fun res!816368 () Bool)

(declare-fun e!697058 () Bool)

(assert (=> b!1227754 (=> (not res!816368) (not e!697058))))

(declare-datatypes ((List!27021 0))(
  ( (Nil!27018) (Cons!27017 (h!28226 (_ BitVec 64)) (t!40484 List!27021)) )
))
(declare-fun acc!823 () List!27021)

(declare-fun noDuplicate!1680 (List!27021) Bool)

(assert (=> b!1227754 (= res!816368 (noDuplicate!1680 acc!823))))

(declare-fun b!1227755 () Bool)

(declare-fun res!816374 () Bool)

(declare-fun e!697057 () Bool)

(assert (=> b!1227755 (=> res!816374 e!697057)))

(declare-fun contains!7083 (List!27021 (_ BitVec 64)) Bool)

(assert (=> b!1227755 (= res!816374 (contains!7083 Nil!27018 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227756 () Bool)

(assert (=> b!1227756 (= e!697057 true)))

(declare-datatypes ((Unit!40662 0))(
  ( (Unit!40663) )
))
(declare-fun lt!558939 () Unit!40662)

(declare-fun noDuplicateSubseq!40 (List!27021 List!27021) Unit!40662)

(assert (=> b!1227756 (= lt!558939 (noDuplicateSubseq!40 Nil!27018 acc!823))))

(declare-fun b!1227757 () Bool)

(declare-fun res!816373 () Bool)

(assert (=> b!1227757 (=> res!816373 e!697057)))

(declare-fun subseq!487 (List!27021 List!27021) Bool)

(assert (=> b!1227757 (= res!816373 (not (subseq!487 Nil!27018 acc!823)))))

(declare-fun b!1227758 () Bool)

(declare-fun res!816371 () Bool)

(assert (=> b!1227758 (=> (not res!816371) (not e!697058))))

(declare-datatypes ((array!79251 0))(
  ( (array!79252 (arr!38248 (Array (_ BitVec 32) (_ BitVec 64))) (size!38784 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79251)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79251 (_ BitVec 32) List!27021) Bool)

(assert (=> b!1227758 (= res!816371 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227759 () Bool)

(declare-fun res!816376 () Bool)

(assert (=> b!1227759 (=> res!816376 e!697057)))

(assert (=> b!1227759 (= res!816376 (contains!7083 Nil!27018 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!816370 () Bool)

(assert (=> start!101978 (=> (not res!816370) (not e!697058))))

(assert (=> start!101978 (= res!816370 (bvslt (size!38784 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101978 e!697058))

(declare-fun array_inv!29096 (array!79251) Bool)

(assert (=> start!101978 (array_inv!29096 a!3806)))

(assert (=> start!101978 true))

(declare-fun b!1227760 () Bool)

(declare-fun res!816366 () Bool)

(assert (=> b!1227760 (=> (not res!816366) (not e!697058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227760 (= res!816366 (validKeyInArray!0 (select (arr!38248 a!3806) from!3184)))))

(declare-fun b!1227761 () Bool)

(assert (=> b!1227761 (= e!697058 (not e!697057))))

(declare-fun res!816367 () Bool)

(assert (=> b!1227761 (=> res!816367 e!697057)))

(assert (=> b!1227761 (= res!816367 (bvsgt from!3184 (size!38784 a!3806)))))

(assert (=> b!1227761 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27017 (select (arr!38248 a!3806) from!3184) acc!823))))

(declare-fun b!1227762 () Bool)

(declare-fun res!816378 () Bool)

(assert (=> b!1227762 (=> (not res!816378) (not e!697058))))

(assert (=> b!1227762 (= res!816378 (not (contains!7083 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227763 () Bool)

(declare-fun res!816369 () Bool)

(assert (=> b!1227763 (=> (not res!816369) (not e!697058))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1227763 (= res!816369 (validKeyInArray!0 k!2913))))

(declare-fun b!1227764 () Bool)

(declare-fun res!816375 () Bool)

(assert (=> b!1227764 (=> (not res!816375) (not e!697058))))

(declare-fun arrayContainsKey!0 (array!79251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227764 (= res!816375 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227765 () Bool)

(declare-fun res!816372 () Bool)

(assert (=> b!1227765 (=> (not res!816372) (not e!697058))))

(assert (=> b!1227765 (= res!816372 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38784 a!3806)) (bvslt from!3184 (size!38784 a!3806))))))

(declare-fun b!1227766 () Bool)

(declare-fun res!816377 () Bool)

(assert (=> b!1227766 (=> (not res!816377) (not e!697058))))

(assert (=> b!1227766 (= res!816377 (not (contains!7083 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101978 res!816370) b!1227763))

(assert (= (and b!1227763 res!816369) b!1227765))

(assert (= (and b!1227765 res!816372) b!1227754))

(assert (= (and b!1227754 res!816368) b!1227766))

(assert (= (and b!1227766 res!816377) b!1227762))

(assert (= (and b!1227762 res!816378) b!1227764))

(assert (= (and b!1227764 res!816375) b!1227758))

(assert (= (and b!1227758 res!816371) b!1227760))

(assert (= (and b!1227760 res!816366) b!1227761))

(assert (= (and b!1227761 (not res!816367)) b!1227759))

(assert (= (and b!1227759 (not res!816376)) b!1227755))

(assert (= (and b!1227755 (not res!816374)) b!1227757))

(assert (= (and b!1227757 (not res!816373)) b!1227756))

(declare-fun m!1132451 () Bool)

(assert (=> start!101978 m!1132451))

(declare-fun m!1132453 () Bool)

(assert (=> b!1227761 m!1132453))

(declare-fun m!1132455 () Bool)

(assert (=> b!1227761 m!1132455))

(declare-fun m!1132457 () Bool)

(assert (=> b!1227762 m!1132457))

(declare-fun m!1132459 () Bool)

(assert (=> b!1227757 m!1132459))

(declare-fun m!1132461 () Bool)

(assert (=> b!1227764 m!1132461))

(declare-fun m!1132463 () Bool)

(assert (=> b!1227754 m!1132463))

(assert (=> b!1227760 m!1132453))

(assert (=> b!1227760 m!1132453))

(declare-fun m!1132465 () Bool)

(assert (=> b!1227760 m!1132465))

(declare-fun m!1132467 () Bool)

(assert (=> b!1227759 m!1132467))

(declare-fun m!1132469 () Bool)

(assert (=> b!1227756 m!1132469))

(declare-fun m!1132471 () Bool)

(assert (=> b!1227763 m!1132471))

(declare-fun m!1132473 () Bool)

(assert (=> b!1227755 m!1132473))

(declare-fun m!1132475 () Bool)

(assert (=> b!1227758 m!1132475))

(declare-fun m!1132477 () Bool)

(assert (=> b!1227766 m!1132477))

(push 1)

(assert (not b!1227761))

(assert (not b!1227754))

(assert (not b!1227758))

(assert (not b!1227763))

(assert (not b!1227764))

(assert (not b!1227762))

(assert (not b!1227766))

(assert (not start!101978))

(assert (not b!1227759))

(assert (not b!1227757))

(assert (not b!1227760))

(assert (not b!1227756))

(assert (not b!1227755))

(check-sat)

