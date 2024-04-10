; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92402 () Bool)

(assert start!92402)

(declare-fun b!1050597 () Bool)

(declare-fun res!699725 () Bool)

(declare-fun e!596215 () Bool)

(assert (=> b!1050597 (=> (not res!699725) (not e!596215))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050597 (= res!699725 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050598 () Bool)

(declare-fun e!596214 () Bool)

(assert (=> b!1050598 (= e!596215 e!596214)))

(declare-fun res!699728 () Bool)

(assert (=> b!1050598 (=> (not res!699728) (not e!596214))))

(declare-datatypes ((array!66203 0))(
  ( (array!66204 (arr!31841 (Array (_ BitVec 32) (_ BitVec 64))) (size!32377 (_ BitVec 32))) )
))
(declare-fun lt!464021 () array!66203)

(declare-fun arrayContainsKey!0 (array!66203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050598 (= res!699728 (arrayContainsKey!0 lt!464021 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66203)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050598 (= lt!464021 (array!66204 (store (arr!31841 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32377 a!3488)))))

(declare-fun b!1050599 () Bool)

(declare-fun e!596212 () Bool)

(assert (=> b!1050599 (= e!596212 (not true))))

(declare-fun lt!464022 () (_ BitVec 32))

(assert (=> b!1050599 (= (select (store (arr!31841 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464022) k0!2747)))

(declare-fun res!699723 () Bool)

(assert (=> start!92402 (=> (not res!699723) (not e!596215))))

(assert (=> start!92402 (= res!699723 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32377 a!3488)) (bvslt (size!32377 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92402 e!596215))

(assert (=> start!92402 true))

(declare-fun array_inv!24621 (array!66203) Bool)

(assert (=> start!92402 (array_inv!24621 a!3488)))

(declare-fun b!1050600 () Bool)

(declare-fun res!699726 () Bool)

(assert (=> b!1050600 (=> (not res!699726) (not e!596215))))

(declare-datatypes ((List!22153 0))(
  ( (Nil!22150) (Cons!22149 (h!23358 (_ BitVec 64)) (t!31460 List!22153)) )
))
(declare-fun arrayNoDuplicates!0 (array!66203 (_ BitVec 32) List!22153) Bool)

(assert (=> b!1050600 (= res!699726 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22150))))

(declare-fun b!1050601 () Bool)

(assert (=> b!1050601 (= e!596214 e!596212)))

(declare-fun res!699724 () Bool)

(assert (=> b!1050601 (=> (not res!699724) (not e!596212))))

(assert (=> b!1050601 (= res!699724 (not (= lt!464022 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66203 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050601 (= lt!464022 (arrayScanForKey!0 lt!464021 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050602 () Bool)

(declare-fun res!699727 () Bool)

(assert (=> b!1050602 (=> (not res!699727) (not e!596215))))

(assert (=> b!1050602 (= res!699727 (= (select (arr!31841 a!3488) i!1381) k0!2747))))

(assert (= (and start!92402 res!699723) b!1050600))

(assert (= (and b!1050600 res!699726) b!1050597))

(assert (= (and b!1050597 res!699725) b!1050602))

(assert (= (and b!1050602 res!699727) b!1050598))

(assert (= (and b!1050598 res!699728) b!1050601))

(assert (= (and b!1050601 res!699724) b!1050599))

(declare-fun m!971277 () Bool)

(assert (=> b!1050597 m!971277))

(declare-fun m!971279 () Bool)

(assert (=> b!1050598 m!971279))

(declare-fun m!971281 () Bool)

(assert (=> b!1050598 m!971281))

(declare-fun m!971283 () Bool)

(assert (=> b!1050602 m!971283))

(declare-fun m!971285 () Bool)

(assert (=> b!1050601 m!971285))

(declare-fun m!971287 () Bool)

(assert (=> start!92402 m!971287))

(assert (=> b!1050599 m!971281))

(declare-fun m!971289 () Bool)

(assert (=> b!1050599 m!971289))

(declare-fun m!971291 () Bool)

(assert (=> b!1050600 m!971291))

(check-sat (not start!92402) (not b!1050601) (not b!1050600) (not b!1050597) (not b!1050598))
(check-sat)
