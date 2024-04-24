; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92514 () Bool)

(assert start!92514)

(declare-fun res!698392 () Bool)

(declare-fun e!595742 () Bool)

(assert (=> start!92514 (=> (not res!698392) (not e!595742))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66130 0))(
  ( (array!66131 (arr!31798 (Array (_ BitVec 32) (_ BitVec 64))) (size!32335 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66130)

(assert (=> start!92514 (= res!698392 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32335 a!3488)) (bvslt (size!32335 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92514 e!595742))

(assert (=> start!92514 true))

(declare-fun array_inv!24580 (array!66130) Bool)

(assert (=> start!92514 (array_inv!24580 a!3488)))

(declare-fun b!1050071 () Bool)

(declare-fun res!698399 () Bool)

(assert (=> b!1050071 (=> (not res!698399) (not e!595742))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1050071 (= res!698399 (= (select (arr!31798 a!3488) i!1381) k0!2747))))

(declare-fun b!1050072 () Bool)

(declare-fun e!595747 () Bool)

(assert (=> b!1050072 (= e!595747 (not true))))

(declare-fun e!595746 () Bool)

(assert (=> b!1050072 e!595746))

(declare-fun res!698396 () Bool)

(assert (=> b!1050072 (=> (not res!698396) (not e!595746))))

(declare-fun lt!463792 () (_ BitVec 32))

(assert (=> b!1050072 (= res!698396 (= (select (store (arr!31798 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463792) k0!2747))))

(declare-fun b!1050073 () Bool)

(declare-fun e!595744 () Bool)

(assert (=> b!1050073 (= e!595742 e!595744)))

(declare-fun res!698397 () Bool)

(assert (=> b!1050073 (=> (not res!698397) (not e!595744))))

(declare-fun lt!463793 () array!66130)

(declare-fun arrayContainsKey!0 (array!66130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050073 (= res!698397 (arrayContainsKey!0 lt!463793 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050073 (= lt!463793 (array!66131 (store (arr!31798 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32335 a!3488)))))

(declare-fun b!1050074 () Bool)

(declare-fun e!595743 () Bool)

(assert (=> b!1050074 (= e!595746 e!595743)))

(declare-fun res!698394 () Bool)

(assert (=> b!1050074 (=> res!698394 e!595743)))

(assert (=> b!1050074 (= res!698394 (bvsle lt!463792 i!1381))))

(declare-fun b!1050075 () Bool)

(declare-fun res!698398 () Bool)

(assert (=> b!1050075 (=> (not res!698398) (not e!595742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050075 (= res!698398 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050076 () Bool)

(declare-fun res!698393 () Bool)

(assert (=> b!1050076 (=> (not res!698393) (not e!595742))))

(declare-datatypes ((List!22080 0))(
  ( (Nil!22077) (Cons!22076 (h!23294 (_ BitVec 64)) (t!31379 List!22080)) )
))
(declare-fun arrayNoDuplicates!0 (array!66130 (_ BitVec 32) List!22080) Bool)

(assert (=> b!1050076 (= res!698393 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22077))))

(declare-fun b!1050077 () Bool)

(assert (=> b!1050077 (= e!595743 (arrayContainsKey!0 a!3488 k0!2747 lt!463792))))

(declare-fun b!1050078 () Bool)

(assert (=> b!1050078 (= e!595744 e!595747)))

(declare-fun res!698395 () Bool)

(assert (=> b!1050078 (=> (not res!698395) (not e!595747))))

(assert (=> b!1050078 (= res!698395 (not (= lt!463792 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66130 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050078 (= lt!463792 (arrayScanForKey!0 lt!463793 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92514 res!698392) b!1050076))

(assert (= (and b!1050076 res!698393) b!1050075))

(assert (= (and b!1050075 res!698398) b!1050071))

(assert (= (and b!1050071 res!698399) b!1050073))

(assert (= (and b!1050073 res!698397) b!1050078))

(assert (= (and b!1050078 res!698395) b!1050072))

(assert (= (and b!1050072 res!698396) b!1050074))

(assert (= (and b!1050074 (not res!698394)) b!1050077))

(declare-fun m!971315 () Bool)

(assert (=> b!1050072 m!971315))

(declare-fun m!971317 () Bool)

(assert (=> b!1050072 m!971317))

(declare-fun m!971319 () Bool)

(assert (=> b!1050077 m!971319))

(declare-fun m!971321 () Bool)

(assert (=> start!92514 m!971321))

(declare-fun m!971323 () Bool)

(assert (=> b!1050073 m!971323))

(assert (=> b!1050073 m!971315))

(declare-fun m!971325 () Bool)

(assert (=> b!1050071 m!971325))

(declare-fun m!971327 () Bool)

(assert (=> b!1050076 m!971327))

(declare-fun m!971329 () Bool)

(assert (=> b!1050075 m!971329))

(declare-fun m!971331 () Bool)

(assert (=> b!1050078 m!971331))

(check-sat (not b!1050076) (not b!1050078) (not start!92514) (not b!1050075) (not b!1050077) (not b!1050073))
(check-sat)
