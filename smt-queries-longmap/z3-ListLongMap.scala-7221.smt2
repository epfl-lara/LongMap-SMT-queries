; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92386 () Bool)

(assert start!92386)

(declare-fun lt!463759 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun b!1050299 () Bool)

(declare-datatypes ((array!66128 0))(
  ( (array!66129 (arr!31803 (Array (_ BitVec 32) (_ BitVec 64))) (size!32341 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66128)

(declare-fun e!596017 () Bool)

(declare-fun arrayContainsKey!0 (array!66128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050299 (= e!596017 (arrayContainsKey!0 a!3488 k0!2747 lt!463759))))

(declare-fun b!1050300 () Bool)

(declare-fun res!699516 () Bool)

(declare-fun e!596018 () Bool)

(assert (=> b!1050300 (=> (not res!699516) (not e!596018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050300 (= res!699516 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050301 () Bool)

(declare-fun e!596021 () Bool)

(assert (=> b!1050301 (= e!596018 e!596021)))

(declare-fun res!699513 () Bool)

(assert (=> b!1050301 (=> (not res!699513) (not e!596021))))

(declare-fun lt!463758 () array!66128)

(assert (=> b!1050301 (= res!699513 (arrayContainsKey!0 lt!463758 k0!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050301 (= lt!463758 (array!66129 (store (arr!31803 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32341 a!3488)))))

(declare-fun b!1050302 () Bool)

(declare-fun res!699514 () Bool)

(assert (=> b!1050302 (=> (not res!699514) (not e!596018))))

(declare-datatypes ((List!22174 0))(
  ( (Nil!22171) (Cons!22170 (h!23379 (_ BitVec 64)) (t!31472 List!22174)) )
))
(declare-fun arrayNoDuplicates!0 (array!66128 (_ BitVec 32) List!22174) Bool)

(assert (=> b!1050302 (= res!699514 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22171))))

(declare-fun b!1050303 () Bool)

(declare-fun res!699510 () Bool)

(assert (=> b!1050303 (=> (not res!699510) (not e!596018))))

(assert (=> b!1050303 (= res!699510 (= (select (arr!31803 a!3488) i!1381) k0!2747))))

(declare-fun b!1050304 () Bool)

(declare-fun e!596019 () Bool)

(assert (=> b!1050304 (= e!596021 e!596019)))

(declare-fun res!699509 () Bool)

(assert (=> b!1050304 (=> (not res!699509) (not e!596019))))

(assert (=> b!1050304 (= res!699509 (not (= lt!463759 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66128 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050304 (= lt!463759 (arrayScanForKey!0 lt!463758 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!699517 () Bool)

(assert (=> start!92386 (=> (not res!699517) (not e!596018))))

(assert (=> start!92386 (= res!699517 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32341 a!3488)) (bvslt (size!32341 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92386 e!596018))

(assert (=> start!92386 true))

(declare-fun array_inv!24586 (array!66128) Bool)

(assert (=> start!92386 (array_inv!24586 a!3488)))

(declare-fun b!1050305 () Bool)

(declare-fun e!596016 () Bool)

(assert (=> b!1050305 (= e!596019 (not e!596016))))

(declare-fun res!699511 () Bool)

(assert (=> b!1050305 (=> res!699511 e!596016)))

(assert (=> b!1050305 (= res!699511 (bvsle lt!463759 i!1381))))

(declare-fun e!596022 () Bool)

(assert (=> b!1050305 e!596022))

(declare-fun res!699512 () Bool)

(assert (=> b!1050305 (=> (not res!699512) (not e!596022))))

(assert (=> b!1050305 (= res!699512 (= (select (store (arr!31803 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463759) k0!2747))))

(declare-fun b!1050306 () Bool)

(assert (=> b!1050306 (= e!596022 e!596017)))

(declare-fun res!699515 () Bool)

(assert (=> b!1050306 (=> res!699515 e!596017)))

(assert (=> b!1050306 (= res!699515 (bvsle lt!463759 i!1381))))

(declare-fun b!1050307 () Bool)

(assert (=> b!1050307 (= e!596016 true)))

(assert (=> b!1050307 false))

(declare-datatypes ((Unit!34259 0))(
  ( (Unit!34260) )
))
(declare-fun lt!463762 () Unit!34259)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66128 (_ BitVec 64) (_ BitVec 32) List!22174) Unit!34259)

(assert (=> b!1050307 (= lt!463762 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22171))))

(assert (=> b!1050307 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463761 () Unit!34259)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66128 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34259)

(assert (=> b!1050307 (= lt!463761 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463759 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050307 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22171)))

(declare-fun lt!463760 () Unit!34259)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66128 (_ BitVec 32) (_ BitVec 32)) Unit!34259)

(assert (=> b!1050307 (= lt!463760 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92386 res!699517) b!1050302))

(assert (= (and b!1050302 res!699514) b!1050300))

(assert (= (and b!1050300 res!699516) b!1050303))

(assert (= (and b!1050303 res!699510) b!1050301))

(assert (= (and b!1050301 res!699513) b!1050304))

(assert (= (and b!1050304 res!699509) b!1050305))

(assert (= (and b!1050305 res!699512) b!1050306))

(assert (= (and b!1050306 (not res!699515)) b!1050299))

(assert (= (and b!1050305 (not res!699511)) b!1050307))

(declare-fun m!970513 () Bool)

(assert (=> b!1050303 m!970513))

(declare-fun m!970515 () Bool)

(assert (=> b!1050307 m!970515))

(declare-fun m!970517 () Bool)

(assert (=> b!1050307 m!970517))

(declare-fun m!970519 () Bool)

(assert (=> b!1050307 m!970519))

(declare-fun m!970521 () Bool)

(assert (=> b!1050307 m!970521))

(declare-fun m!970523 () Bool)

(assert (=> b!1050307 m!970523))

(declare-fun m!970525 () Bool)

(assert (=> b!1050299 m!970525))

(declare-fun m!970527 () Bool)

(assert (=> b!1050305 m!970527))

(declare-fun m!970529 () Bool)

(assert (=> b!1050305 m!970529))

(declare-fun m!970531 () Bool)

(assert (=> b!1050300 m!970531))

(declare-fun m!970533 () Bool)

(assert (=> b!1050302 m!970533))

(declare-fun m!970535 () Bool)

(assert (=> b!1050301 m!970535))

(assert (=> b!1050301 m!970527))

(declare-fun m!970537 () Bool)

(assert (=> start!92386 m!970537))

(declare-fun m!970539 () Bool)

(assert (=> b!1050304 m!970539))

(check-sat (not start!92386) (not b!1050299) (not b!1050302) (not b!1050307) (not b!1050301) (not b!1050304) (not b!1050300))
(check-sat)
