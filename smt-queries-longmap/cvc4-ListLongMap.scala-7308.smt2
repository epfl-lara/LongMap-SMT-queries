; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93454 () Bool)

(assert start!93454)

(declare-fun e!602254 () Bool)

(declare-datatypes ((array!66757 0))(
  ( (array!66758 (arr!32097 (Array (_ BitVec 32) (_ BitVec 64))) (size!32633 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66757)

(declare-fun b!1058577 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058577 (= e!602254 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1058578 () Bool)

(declare-fun res!707154 () Bool)

(declare-fun e!602258 () Bool)

(assert (=> b!1058578 (=> (not res!707154) (not e!602258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058578 (= res!707154 (validKeyInArray!0 k!2747))))

(declare-fun b!1058579 () Bool)

(declare-fun e!602259 () Bool)

(declare-fun e!602256 () Bool)

(assert (=> b!1058579 (= e!602259 e!602256)))

(declare-fun res!707153 () Bool)

(assert (=> b!1058579 (=> (not res!707153) (not e!602256))))

(declare-fun lt!466981 () (_ BitVec 32))

(assert (=> b!1058579 (= res!707153 (not (= lt!466981 i!1381)))))

(declare-fun lt!466986 () array!66757)

(declare-fun arrayScanForKey!0 (array!66757 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058579 (= lt!466981 (arrayScanForKey!0 lt!466986 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058580 () Bool)

(assert (=> b!1058580 (= e!602258 e!602259)))

(declare-fun res!707155 () Bool)

(assert (=> b!1058580 (=> (not res!707155) (not e!602259))))

(assert (=> b!1058580 (= res!707155 (arrayContainsKey!0 lt!466986 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058580 (= lt!466986 (array!66758 (store (arr!32097 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32633 a!3488)))))

(declare-fun b!1058581 () Bool)

(declare-fun res!707159 () Bool)

(assert (=> b!1058581 (=> (not res!707159) (not e!602258))))

(declare-datatypes ((List!22409 0))(
  ( (Nil!22406) (Cons!22405 (h!23614 (_ BitVec 64)) (t!31716 List!22409)) )
))
(declare-fun arrayNoDuplicates!0 (array!66757 (_ BitVec 32) List!22409) Bool)

(assert (=> b!1058581 (= res!707159 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22406))))

(declare-fun b!1058582 () Bool)

(declare-fun e!602260 () Bool)

(assert (=> b!1058582 (= e!602260 e!602254)))

(declare-fun res!707156 () Bool)

(assert (=> b!1058582 (=> res!707156 e!602254)))

(assert (=> b!1058582 (= res!707156 (or (bvsgt lt!466981 i!1381) (bvsle i!1381 lt!466981)))))

(declare-fun b!1058583 () Bool)

(declare-fun res!707158 () Bool)

(assert (=> b!1058583 (=> (not res!707158) (not e!602258))))

(assert (=> b!1058583 (= res!707158 (= (select (arr!32097 a!3488) i!1381) k!2747))))

(declare-fun res!707152 () Bool)

(assert (=> start!93454 (=> (not res!707152) (not e!602258))))

(assert (=> start!93454 (= res!707152 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32633 a!3488)) (bvslt (size!32633 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93454 e!602258))

(assert (=> start!93454 true))

(declare-fun array_inv!24877 (array!66757) Bool)

(assert (=> start!93454 (array_inv!24877 a!3488)))

(declare-fun b!1058584 () Bool)

(declare-fun e!602257 () Bool)

(assert (=> b!1058584 (= e!602256 (not e!602257))))

(declare-fun res!707157 () Bool)

(assert (=> b!1058584 (=> res!707157 e!602257)))

(assert (=> b!1058584 (= res!707157 (or (bvsgt lt!466981 i!1381) (bvsle i!1381 lt!466981)))))

(assert (=> b!1058584 e!602260))

(declare-fun res!707151 () Bool)

(assert (=> b!1058584 (=> (not res!707151) (not e!602260))))

(assert (=> b!1058584 (= res!707151 (= (select (store (arr!32097 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466981) k!2747))))

(declare-fun b!1058585 () Bool)

(assert (=> b!1058585 (= e!602257 true)))

(assert (=> b!1058585 (not (= (select (arr!32097 a!3488) lt!466981) k!2747))))

(declare-datatypes ((Unit!34716 0))(
  ( (Unit!34717) )
))
(declare-fun lt!466984 () Unit!34716)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66757 (_ BitVec 64) (_ BitVec 32) List!22409) Unit!34716)

(assert (=> b!1058585 (= lt!466984 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!466981 Nil!22406))))

(declare-fun lt!466985 () (_ BitVec 32))

(assert (=> b!1058585 (arrayContainsKey!0 a!3488 k!2747 lt!466985)))

(declare-fun lt!466982 () Unit!34716)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66757 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34716)

(assert (=> b!1058585 (= lt!466982 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466985))))

(assert (=> b!1058585 (= lt!466985 (bvadd #b00000000000000000000000000000001 lt!466981))))

(assert (=> b!1058585 (arrayNoDuplicates!0 a!3488 lt!466981 Nil!22406)))

(declare-fun lt!466983 () Unit!34716)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66757 (_ BitVec 32) (_ BitVec 32)) Unit!34716)

(assert (=> b!1058585 (= lt!466983 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466981))))

(assert (= (and start!93454 res!707152) b!1058581))

(assert (= (and b!1058581 res!707159) b!1058578))

(assert (= (and b!1058578 res!707154) b!1058583))

(assert (= (and b!1058583 res!707158) b!1058580))

(assert (= (and b!1058580 res!707155) b!1058579))

(assert (= (and b!1058579 res!707153) b!1058584))

(assert (= (and b!1058584 res!707151) b!1058582))

(assert (= (and b!1058582 (not res!707156)) b!1058577))

(assert (= (and b!1058584 (not res!707157)) b!1058585))

(declare-fun m!978227 () Bool)

(assert (=> b!1058580 m!978227))

(declare-fun m!978229 () Bool)

(assert (=> b!1058580 m!978229))

(declare-fun m!978231 () Bool)

(assert (=> b!1058579 m!978231))

(declare-fun m!978233 () Bool)

(assert (=> b!1058585 m!978233))

(declare-fun m!978235 () Bool)

(assert (=> b!1058585 m!978235))

(declare-fun m!978237 () Bool)

(assert (=> b!1058585 m!978237))

(declare-fun m!978239 () Bool)

(assert (=> b!1058585 m!978239))

(declare-fun m!978241 () Bool)

(assert (=> b!1058585 m!978241))

(declare-fun m!978243 () Bool)

(assert (=> b!1058585 m!978243))

(assert (=> b!1058584 m!978229))

(declare-fun m!978245 () Bool)

(assert (=> b!1058584 m!978245))

(declare-fun m!978247 () Bool)

(assert (=> b!1058583 m!978247))

(declare-fun m!978249 () Bool)

(assert (=> b!1058577 m!978249))

(declare-fun m!978251 () Bool)

(assert (=> b!1058578 m!978251))

(declare-fun m!978253 () Bool)

(assert (=> start!93454 m!978253))

(declare-fun m!978255 () Bool)

(assert (=> b!1058581 m!978255))

(push 1)

