; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92384 () Bool)

(assert start!92384)

(declare-fun b!1050396 () Bool)

(declare-fun e!596066 () Bool)

(declare-fun e!596068 () Bool)

(assert (=> b!1050396 (= e!596066 e!596068)))

(declare-fun res!699530 () Bool)

(assert (=> b!1050396 (=> res!699530 e!596068)))

(declare-fun lt!463929 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050396 (= res!699530 (bvsle lt!463929 i!1381))))

(declare-fun b!1050397 () Bool)

(declare-fun e!596067 () Bool)

(assert (=> b!1050397 (= e!596067 true)))

(assert (=> b!1050397 false))

(declare-datatypes ((Unit!34384 0))(
  ( (Unit!34385) )
))
(declare-fun lt!463932 () Unit!34384)

(declare-datatypes ((array!66185 0))(
  ( (array!66186 (arr!31832 (Array (_ BitVec 32) (_ BitVec 64))) (size!32368 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66185)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-datatypes ((List!22144 0))(
  ( (Nil!22141) (Cons!22140 (h!23349 (_ BitVec 64)) (t!31451 List!22144)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66185 (_ BitVec 64) (_ BitVec 32) List!22144) Unit!34384)

(assert (=> b!1050397 (= lt!463932 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22141))))

(declare-fun arrayContainsKey!0 (array!66185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050397 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463930 () Unit!34384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66185 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34384)

(assert (=> b!1050397 (= lt!463930 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463929 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66185 (_ BitVec 32) List!22144) Bool)

(assert (=> b!1050397 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22141)))

(declare-fun lt!463931 () Unit!34384)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66185 (_ BitVec 32) (_ BitVec 32)) Unit!34384)

(assert (=> b!1050397 (= lt!463931 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!699529 () Bool)

(declare-fun e!596069 () Bool)

(assert (=> start!92384 (=> (not res!699529) (not e!596069))))

(assert (=> start!92384 (= res!699529 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32368 a!3488)) (bvslt (size!32368 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92384 e!596069))

(assert (=> start!92384 true))

(declare-fun array_inv!24612 (array!66185) Bool)

(assert (=> start!92384 (array_inv!24612 a!3488)))

(declare-fun b!1050398 () Bool)

(declare-fun e!596071 () Bool)

(assert (=> b!1050398 (= e!596071 (not e!596067))))

(declare-fun res!699523 () Bool)

(assert (=> b!1050398 (=> res!699523 e!596067)))

(assert (=> b!1050398 (= res!699523 (bvsle lt!463929 i!1381))))

(assert (=> b!1050398 e!596066))

(declare-fun res!699527 () Bool)

(assert (=> b!1050398 (=> (not res!699527) (not e!596066))))

(assert (=> b!1050398 (= res!699527 (= (select (store (arr!31832 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463929) k0!2747))))

(declare-fun b!1050399 () Bool)

(assert (=> b!1050399 (= e!596068 (arrayContainsKey!0 a!3488 k0!2747 lt!463929))))

(declare-fun b!1050400 () Bool)

(declare-fun res!699525 () Bool)

(assert (=> b!1050400 (=> (not res!699525) (not e!596069))))

(assert (=> b!1050400 (= res!699525 (= (select (arr!31832 a!3488) i!1381) k0!2747))))

(declare-fun b!1050401 () Bool)

(declare-fun res!699526 () Bool)

(assert (=> b!1050401 (=> (not res!699526) (not e!596069))))

(assert (=> b!1050401 (= res!699526 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22141))))

(declare-fun b!1050402 () Bool)

(declare-fun e!596065 () Bool)

(assert (=> b!1050402 (= e!596065 e!596071)))

(declare-fun res!699522 () Bool)

(assert (=> b!1050402 (=> (not res!699522) (not e!596071))))

(assert (=> b!1050402 (= res!699522 (not (= lt!463929 i!1381)))))

(declare-fun lt!463928 () array!66185)

(declare-fun arrayScanForKey!0 (array!66185 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050402 (= lt!463929 (arrayScanForKey!0 lt!463928 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050403 () Bool)

(assert (=> b!1050403 (= e!596069 e!596065)))

(declare-fun res!699528 () Bool)

(assert (=> b!1050403 (=> (not res!699528) (not e!596065))))

(assert (=> b!1050403 (= res!699528 (arrayContainsKey!0 lt!463928 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050403 (= lt!463928 (array!66186 (store (arr!31832 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32368 a!3488)))))

(declare-fun b!1050404 () Bool)

(declare-fun res!699524 () Bool)

(assert (=> b!1050404 (=> (not res!699524) (not e!596069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050404 (= res!699524 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92384 res!699529) b!1050401))

(assert (= (and b!1050401 res!699526) b!1050404))

(assert (= (and b!1050404 res!699524) b!1050400))

(assert (= (and b!1050400 res!699525) b!1050403))

(assert (= (and b!1050403 res!699528) b!1050402))

(assert (= (and b!1050402 res!699522) b!1050398))

(assert (= (and b!1050398 res!699527) b!1050396))

(assert (= (and b!1050396 (not res!699530)) b!1050399))

(assert (= (and b!1050398 (not res!699523)) b!1050397))

(declare-fun m!971073 () Bool)

(assert (=> b!1050400 m!971073))

(declare-fun m!971075 () Bool)

(assert (=> b!1050401 m!971075))

(declare-fun m!971077 () Bool)

(assert (=> start!92384 m!971077))

(declare-fun m!971079 () Bool)

(assert (=> b!1050397 m!971079))

(declare-fun m!971081 () Bool)

(assert (=> b!1050397 m!971081))

(declare-fun m!971083 () Bool)

(assert (=> b!1050397 m!971083))

(declare-fun m!971085 () Bool)

(assert (=> b!1050397 m!971085))

(declare-fun m!971087 () Bool)

(assert (=> b!1050397 m!971087))

(declare-fun m!971089 () Bool)

(assert (=> b!1050402 m!971089))

(declare-fun m!971091 () Bool)

(assert (=> b!1050403 m!971091))

(declare-fun m!971093 () Bool)

(assert (=> b!1050403 m!971093))

(declare-fun m!971095 () Bool)

(assert (=> b!1050404 m!971095))

(assert (=> b!1050398 m!971093))

(declare-fun m!971097 () Bool)

(assert (=> b!1050398 m!971097))

(declare-fun m!971099 () Bool)

(assert (=> b!1050399 m!971099))

(check-sat (not b!1050401) (not b!1050402) (not b!1050404) (not b!1050399) (not b!1050403) (not start!92384) (not b!1050397))
