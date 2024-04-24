; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93006 () Bool)

(assert start!93006)

(declare-fun b!1055108 () Bool)

(declare-fun e!599394 () Bool)

(declare-fun e!599396 () Bool)

(assert (=> b!1055108 (= e!599394 e!599396)))

(declare-fun res!703290 () Bool)

(assert (=> b!1055108 (=> res!703290 e!599396)))

(declare-fun lt!465737 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055108 (= res!703290 (bvsle lt!465737 i!1381))))

(declare-fun b!1055109 () Bool)

(declare-fun res!703291 () Bool)

(declare-fun e!599395 () Bool)

(assert (=> b!1055109 (=> (not res!703291) (not e!599395))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055109 (= res!703291 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055110 () Bool)

(declare-fun e!599398 () Bool)

(declare-fun e!599397 () Bool)

(assert (=> b!1055110 (= e!599398 e!599397)))

(declare-fun res!703285 () Bool)

(assert (=> b!1055110 (=> (not res!703285) (not e!599397))))

(assert (=> b!1055110 (= res!703285 (not (= lt!465737 i!1381)))))

(declare-datatypes ((array!66514 0))(
  ( (array!66515 (arr!31984 (Array (_ BitVec 32) (_ BitVec 64))) (size!32521 (_ BitVec 32))) )
))
(declare-fun lt!465736 () array!66514)

(declare-fun arrayScanForKey!0 (array!66514 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055110 (= lt!465737 (arrayScanForKey!0 lt!465736 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!703288 () Bool)

(assert (=> start!93006 (=> (not res!703288) (not e!599395))))

(declare-fun a!3488 () array!66514)

(assert (=> start!93006 (= res!703288 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32521 a!3488)) (bvslt (size!32521 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93006 e!599395))

(assert (=> start!93006 true))

(declare-fun array_inv!24766 (array!66514) Bool)

(assert (=> start!93006 (array_inv!24766 a!3488)))

(declare-fun b!1055111 () Bool)

(assert (=> b!1055111 (= e!599397 (not (or (bvsle lt!465737 i!1381) (bvsgt #b00000000000000000000000000000000 (size!32521 a!3488)) (bvsle i!1381 (size!32521 a!3488)))))))

(assert (=> b!1055111 e!599394))

(declare-fun res!703287 () Bool)

(assert (=> b!1055111 (=> (not res!703287) (not e!599394))))

(assert (=> b!1055111 (= res!703287 (= (select (store (arr!31984 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465737) k0!2747))))

(declare-fun b!1055112 () Bool)

(assert (=> b!1055112 (= e!599395 e!599398)))

(declare-fun res!703292 () Bool)

(assert (=> b!1055112 (=> (not res!703292) (not e!599398))))

(declare-fun arrayContainsKey!0 (array!66514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055112 (= res!703292 (arrayContainsKey!0 lt!465736 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055112 (= lt!465736 (array!66515 (store (arr!31984 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32521 a!3488)))))

(declare-fun b!1055113 () Bool)

(declare-fun res!703286 () Bool)

(assert (=> b!1055113 (=> (not res!703286) (not e!599395))))

(assert (=> b!1055113 (= res!703286 (= (select (arr!31984 a!3488) i!1381) k0!2747))))

(declare-fun b!1055114 () Bool)

(assert (=> b!1055114 (= e!599396 (arrayContainsKey!0 a!3488 k0!2747 lt!465737))))

(declare-fun b!1055115 () Bool)

(declare-fun res!703289 () Bool)

(assert (=> b!1055115 (=> (not res!703289) (not e!599395))))

(declare-datatypes ((List!22266 0))(
  ( (Nil!22263) (Cons!22262 (h!23480 (_ BitVec 64)) (t!31565 List!22266)) )
))
(declare-fun arrayNoDuplicates!0 (array!66514 (_ BitVec 32) List!22266) Bool)

(assert (=> b!1055115 (= res!703289 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22263))))

(assert (= (and start!93006 res!703288) b!1055115))

(assert (= (and b!1055115 res!703289) b!1055109))

(assert (= (and b!1055109 res!703291) b!1055113))

(assert (= (and b!1055113 res!703286) b!1055112))

(assert (= (and b!1055112 res!703292) b!1055110))

(assert (= (and b!1055110 res!703285) b!1055111))

(assert (= (and b!1055111 res!703287) b!1055108))

(assert (= (and b!1055108 (not res!703290)) b!1055114))

(declare-fun m!975659 () Bool)

(assert (=> b!1055114 m!975659))

(declare-fun m!975661 () Bool)

(assert (=> start!93006 m!975661))

(declare-fun m!975663 () Bool)

(assert (=> b!1055113 m!975663))

(declare-fun m!975665 () Bool)

(assert (=> b!1055115 m!975665))

(declare-fun m!975667 () Bool)

(assert (=> b!1055110 m!975667))

(declare-fun m!975669 () Bool)

(assert (=> b!1055111 m!975669))

(declare-fun m!975671 () Bool)

(assert (=> b!1055111 m!975671))

(declare-fun m!975673 () Bool)

(assert (=> b!1055109 m!975673))

(declare-fun m!975675 () Bool)

(assert (=> b!1055112 m!975675))

(assert (=> b!1055112 m!975669))

(check-sat (not b!1055109) (not b!1055110) (not start!93006) (not b!1055112) (not b!1055114) (not b!1055115))
(check-sat)
