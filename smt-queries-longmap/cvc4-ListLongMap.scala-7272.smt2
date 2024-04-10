; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92854 () Bool)

(assert start!92854)

(declare-fun b!1054500 () Bool)

(declare-fun res!703442 () Bool)

(declare-fun e!599104 () Bool)

(assert (=> b!1054500 (=> (not res!703442) (not e!599104))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054500 (= res!703442 (validKeyInArray!0 k!2747))))

(declare-fun b!1054501 () Bool)

(declare-fun e!599100 () Bool)

(assert (=> b!1054501 (= e!599104 e!599100)))

(declare-fun res!703444 () Bool)

(assert (=> b!1054501 (=> (not res!703444) (not e!599100))))

(declare-datatypes ((array!66514 0))(
  ( (array!66515 (arr!31989 (Array (_ BitVec 32) (_ BitVec 64))) (size!32525 (_ BitVec 32))) )
))
(declare-fun lt!465431 () array!66514)

(declare-fun arrayContainsKey!0 (array!66514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054501 (= res!703444 (arrayContainsKey!0 lt!465431 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66514)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054501 (= lt!465431 (array!66515 (store (arr!31989 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32525 a!3488)))))

(declare-fun b!1054502 () Bool)

(declare-fun lt!465430 () (_ BitVec 32))

(declare-fun e!599102 () Bool)

(assert (=> b!1054502 (= e!599102 (arrayContainsKey!0 a!3488 k!2747 lt!465430))))

(declare-fun b!1054503 () Bool)

(declare-fun e!599099 () Bool)

(assert (=> b!1054503 (= e!599099 true)))

(declare-datatypes ((List!22301 0))(
  ( (Nil!22298) (Cons!22297 (h!23506 (_ BitVec 64)) (t!31608 List!22301)) )
))
(declare-fun arrayNoDuplicates!0 (array!66514 (_ BitVec 32) List!22301) Bool)

(assert (=> b!1054503 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22298)))

(declare-datatypes ((Unit!34536 0))(
  ( (Unit!34537) )
))
(declare-fun lt!465432 () Unit!34536)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66514 (_ BitVec 32) (_ BitVec 32)) Unit!34536)

(assert (=> b!1054503 (= lt!465432 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054504 () Bool)

(declare-fun res!703448 () Bool)

(assert (=> b!1054504 (=> (not res!703448) (not e!599104))))

(assert (=> b!1054504 (= res!703448 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22298))))

(declare-fun b!1054505 () Bool)

(declare-fun e!599098 () Bool)

(assert (=> b!1054505 (= e!599098 e!599102)))

(declare-fun res!703440 () Bool)

(assert (=> b!1054505 (=> res!703440 e!599102)))

(assert (=> b!1054505 (= res!703440 (bvsle lt!465430 i!1381))))

(declare-fun b!1054506 () Bool)

(declare-fun e!599103 () Bool)

(assert (=> b!1054506 (= e!599103 (not e!599099))))

(declare-fun res!703447 () Bool)

(assert (=> b!1054506 (=> res!703447 e!599099)))

(assert (=> b!1054506 (= res!703447 (bvsle lt!465430 i!1381))))

(assert (=> b!1054506 e!599098))

(declare-fun res!703445 () Bool)

(assert (=> b!1054506 (=> (not res!703445) (not e!599098))))

(assert (=> b!1054506 (= res!703445 (= (select (store (arr!31989 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465430) k!2747))))

(declare-fun res!703443 () Bool)

(assert (=> start!92854 (=> (not res!703443) (not e!599104))))

(assert (=> start!92854 (= res!703443 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32525 a!3488)) (bvslt (size!32525 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92854 e!599104))

(assert (=> start!92854 true))

(declare-fun array_inv!24769 (array!66514) Bool)

(assert (=> start!92854 (array_inv!24769 a!3488)))

(declare-fun b!1054507 () Bool)

(assert (=> b!1054507 (= e!599100 e!599103)))

(declare-fun res!703446 () Bool)

(assert (=> b!1054507 (=> (not res!703446) (not e!599103))))

(assert (=> b!1054507 (= res!703446 (not (= lt!465430 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66514 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054507 (= lt!465430 (arrayScanForKey!0 lt!465431 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054508 () Bool)

(declare-fun res!703441 () Bool)

(assert (=> b!1054508 (=> (not res!703441) (not e!599104))))

(assert (=> b!1054508 (= res!703441 (= (select (arr!31989 a!3488) i!1381) k!2747))))

(assert (= (and start!92854 res!703443) b!1054504))

(assert (= (and b!1054504 res!703448) b!1054500))

(assert (= (and b!1054500 res!703442) b!1054508))

(assert (= (and b!1054508 res!703441) b!1054501))

(assert (= (and b!1054501 res!703444) b!1054507))

(assert (= (and b!1054507 res!703446) b!1054506))

(assert (= (and b!1054506 res!703445) b!1054505))

(assert (= (and b!1054505 (not res!703440)) b!1054502))

(assert (= (and b!1054506 (not res!703447)) b!1054503))

(declare-fun m!974557 () Bool)

(assert (=> b!1054508 m!974557))

(declare-fun m!974559 () Bool)

(assert (=> b!1054506 m!974559))

(declare-fun m!974561 () Bool)

(assert (=> b!1054506 m!974561))

(declare-fun m!974563 () Bool)

(assert (=> b!1054507 m!974563))

(declare-fun m!974565 () Bool)

(assert (=> b!1054502 m!974565))

(declare-fun m!974567 () Bool)

(assert (=> start!92854 m!974567))

(declare-fun m!974569 () Bool)

(assert (=> b!1054501 m!974569))

(assert (=> b!1054501 m!974559))

(declare-fun m!974571 () Bool)

(assert (=> b!1054504 m!974571))

(declare-fun m!974573 () Bool)

(assert (=> b!1054503 m!974573))

(declare-fun m!974575 () Bool)

(assert (=> b!1054503 m!974575))

(declare-fun m!974577 () Bool)

(assert (=> b!1054500 m!974577))

(push 1)

