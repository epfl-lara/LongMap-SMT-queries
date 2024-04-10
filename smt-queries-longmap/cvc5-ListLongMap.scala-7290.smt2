; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93162 () Bool)

(assert start!93162)

(declare-fun b!1056496 () Bool)

(declare-fun e!600638 () Bool)

(assert (=> b!1056496 (= e!600638 (not true))))

(declare-fun e!600643 () Bool)

(assert (=> b!1056496 e!600643))

(declare-fun res!705245 () Bool)

(assert (=> b!1056496 (=> (not res!705245) (not e!600643))))

(declare-fun lt!466116 () (_ BitVec 32))

(declare-datatypes ((array!66633 0))(
  ( (array!66634 (arr!32041 (Array (_ BitVec 32) (_ BitVec 64))) (size!32577 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66633)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056496 (= res!705245 (= (select (store (arr!32041 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466116) k!2747))))

(declare-fun b!1056497 () Bool)

(declare-fun e!600642 () Bool)

(assert (=> b!1056497 (= e!600642 e!600638)))

(declare-fun res!705242 () Bool)

(assert (=> b!1056497 (=> (not res!705242) (not e!600638))))

(assert (=> b!1056497 (= res!705242 (not (= lt!466116 i!1381)))))

(declare-fun lt!466115 () array!66633)

(declare-fun arrayScanForKey!0 (array!66633 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056497 (= lt!466116 (arrayScanForKey!0 lt!466115 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056498 () Bool)

(declare-fun res!705238 () Bool)

(declare-fun e!600640 () Bool)

(assert (=> b!1056498 (=> (not res!705238) (not e!600640))))

(assert (=> b!1056498 (= res!705238 (= (select (arr!32041 a!3488) i!1381) k!2747))))

(declare-fun b!1056499 () Bool)

(declare-fun e!600639 () Bool)

(assert (=> b!1056499 (= e!600643 e!600639)))

(declare-fun res!705239 () Bool)

(assert (=> b!1056499 (=> res!705239 e!600639)))

(assert (=> b!1056499 (= res!705239 (or (bvsgt lt!466116 i!1381) (bvsle i!1381 lt!466116)))))

(declare-fun b!1056500 () Bool)

(declare-fun res!705244 () Bool)

(assert (=> b!1056500 (=> (not res!705244) (not e!600640))))

(declare-datatypes ((List!22353 0))(
  ( (Nil!22350) (Cons!22349 (h!23558 (_ BitVec 64)) (t!31660 List!22353)) )
))
(declare-fun arrayNoDuplicates!0 (array!66633 (_ BitVec 32) List!22353) Bool)

(assert (=> b!1056500 (= res!705244 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22350))))

(declare-fun res!705241 () Bool)

(assert (=> start!93162 (=> (not res!705241) (not e!600640))))

(assert (=> start!93162 (= res!705241 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32577 a!3488)) (bvslt (size!32577 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93162 e!600640))

(assert (=> start!93162 true))

(declare-fun array_inv!24821 (array!66633) Bool)

(assert (=> start!93162 (array_inv!24821 a!3488)))

(declare-fun b!1056501 () Bool)

(declare-fun arrayContainsKey!0 (array!66633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056501 (= e!600639 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056502 () Bool)

(declare-fun res!705240 () Bool)

(assert (=> b!1056502 (=> (not res!705240) (not e!600640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056502 (= res!705240 (validKeyInArray!0 k!2747))))

(declare-fun b!1056503 () Bool)

(assert (=> b!1056503 (= e!600640 e!600642)))

(declare-fun res!705243 () Bool)

(assert (=> b!1056503 (=> (not res!705243) (not e!600642))))

(assert (=> b!1056503 (= res!705243 (arrayContainsKey!0 lt!466115 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056503 (= lt!466115 (array!66634 (store (arr!32041 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32577 a!3488)))))

(assert (= (and start!93162 res!705241) b!1056500))

(assert (= (and b!1056500 res!705244) b!1056502))

(assert (= (and b!1056502 res!705240) b!1056498))

(assert (= (and b!1056498 res!705238) b!1056503))

(assert (= (and b!1056503 res!705243) b!1056497))

(assert (= (and b!1056497 res!705242) b!1056496))

(assert (= (and b!1056496 res!705245) b!1056499))

(assert (= (and b!1056499 (not res!705239)) b!1056501))

(declare-fun m!976331 () Bool)

(assert (=> b!1056502 m!976331))

(declare-fun m!976333 () Bool)

(assert (=> b!1056503 m!976333))

(declare-fun m!976335 () Bool)

(assert (=> b!1056503 m!976335))

(declare-fun m!976337 () Bool)

(assert (=> b!1056501 m!976337))

(assert (=> b!1056496 m!976335))

(declare-fun m!976339 () Bool)

(assert (=> b!1056496 m!976339))

(declare-fun m!976341 () Bool)

(assert (=> b!1056497 m!976341))

(declare-fun m!976343 () Bool)

(assert (=> start!93162 m!976343))

(declare-fun m!976345 () Bool)

(assert (=> b!1056498 m!976345))

(declare-fun m!976347 () Bool)

(assert (=> b!1056500 m!976347))

(push 1)

