; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93044 () Bool)

(assert start!93044)

(declare-fun b!1055556 () Bool)

(declare-fun res!704379 () Bool)

(declare-fun e!599941 () Bool)

(assert (=> b!1055556 (=> res!704379 e!599941)))

(declare-datatypes ((List!22324 0))(
  ( (Nil!22321) (Cons!22320 (h!23529 (_ BitVec 64)) (t!31631 List!22324)) )
))
(declare-fun noDuplicate!1552 (List!22324) Bool)

(assert (=> b!1055556 (= res!704379 (not (noDuplicate!1552 Nil!22321)))))

(declare-fun b!1055557 () Bool)

(declare-fun res!704381 () Bool)

(declare-fun e!599940 () Bool)

(assert (=> b!1055557 (=> (not res!704381) (not e!599940))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055557 (= res!704381 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055558 () Bool)

(declare-fun res!704380 () Bool)

(assert (=> b!1055558 (=> res!704380 e!599941)))

(declare-fun contains!6184 (List!22324 (_ BitVec 64)) Bool)

(assert (=> b!1055558 (= res!704380 (contains!6184 Nil!22321 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055559 () Bool)

(declare-fun e!599935 () Bool)

(declare-fun e!599934 () Bool)

(assert (=> b!1055559 (= e!599935 (not e!599934))))

(declare-fun res!704374 () Bool)

(assert (=> b!1055559 (=> res!704374 e!599934)))

(declare-fun lt!465806 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055559 (= res!704374 (bvsle lt!465806 i!1381))))

(declare-fun e!599936 () Bool)

(assert (=> b!1055559 e!599936))

(declare-fun res!704378 () Bool)

(assert (=> b!1055559 (=> (not res!704378) (not e!599936))))

(declare-datatypes ((array!66569 0))(
  ( (array!66570 (arr!32012 (Array (_ BitVec 32) (_ BitVec 64))) (size!32548 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66569)

(assert (=> b!1055559 (= res!704378 (= (select (store (arr!32012 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465806) k0!2747))))

(declare-fun b!1055560 () Bool)

(assert (=> b!1055560 (= e!599934 e!599941)))

(declare-fun res!704373 () Bool)

(assert (=> b!1055560 (=> res!704373 e!599941)))

(assert (=> b!1055560 (= res!704373 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32548 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055560 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34582 0))(
  ( (Unit!34583) )
))
(declare-fun lt!465804 () Unit!34582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34582)

(assert (=> b!1055560 (= lt!465804 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465806 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66569 (_ BitVec 32) List!22324) Bool)

(assert (=> b!1055560 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22321)))

(declare-fun lt!465805 () Unit!34582)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66569 (_ BitVec 32) (_ BitVec 32)) Unit!34582)

(assert (=> b!1055560 (= lt!465805 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055561 () Bool)

(declare-fun e!599937 () Bool)

(assert (=> b!1055561 (= e!599937 e!599935)))

(declare-fun res!704370 () Bool)

(assert (=> b!1055561 (=> (not res!704370) (not e!599935))))

(assert (=> b!1055561 (= res!704370 (not (= lt!465806 i!1381)))))

(declare-fun lt!465803 () array!66569)

(declare-fun arrayScanForKey!0 (array!66569 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055561 (= lt!465806 (arrayScanForKey!0 lt!465803 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055562 () Bool)

(declare-fun res!704371 () Bool)

(assert (=> b!1055562 (=> (not res!704371) (not e!599940))))

(assert (=> b!1055562 (= res!704371 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22321))))

(declare-fun res!704376 () Bool)

(assert (=> start!93044 (=> (not res!704376) (not e!599940))))

(assert (=> start!93044 (= res!704376 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32548 a!3488)) (bvslt (size!32548 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93044 e!599940))

(assert (=> start!93044 true))

(declare-fun array_inv!24792 (array!66569) Bool)

(assert (=> start!93044 (array_inv!24792 a!3488)))

(declare-fun b!1055563 () Bool)

(declare-fun e!599939 () Bool)

(assert (=> b!1055563 (= e!599939 (arrayContainsKey!0 a!3488 k0!2747 lt!465806))))

(declare-fun b!1055564 () Bool)

(declare-fun res!704375 () Bool)

(assert (=> b!1055564 (=> (not res!704375) (not e!599940))))

(assert (=> b!1055564 (= res!704375 (= (select (arr!32012 a!3488) i!1381) k0!2747))))

(declare-fun b!1055565 () Bool)

(assert (=> b!1055565 (= e!599940 e!599937)))

(declare-fun res!704372 () Bool)

(assert (=> b!1055565 (=> (not res!704372) (not e!599937))))

(assert (=> b!1055565 (= res!704372 (arrayContainsKey!0 lt!465803 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055565 (= lt!465803 (array!66570 (store (arr!32012 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32548 a!3488)))))

(declare-fun b!1055566 () Bool)

(assert (=> b!1055566 (= e!599936 e!599939)))

(declare-fun res!704377 () Bool)

(assert (=> b!1055566 (=> res!704377 e!599939)))

(assert (=> b!1055566 (= res!704377 (bvsle lt!465806 i!1381))))

(declare-fun b!1055567 () Bool)

(assert (=> b!1055567 (= e!599941 true)))

(declare-fun lt!465807 () Bool)

(assert (=> b!1055567 (= lt!465807 (contains!6184 Nil!22321 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!93044 res!704376) b!1055562))

(assert (= (and b!1055562 res!704371) b!1055557))

(assert (= (and b!1055557 res!704381) b!1055564))

(assert (= (and b!1055564 res!704375) b!1055565))

(assert (= (and b!1055565 res!704372) b!1055561))

(assert (= (and b!1055561 res!704370) b!1055559))

(assert (= (and b!1055559 res!704378) b!1055566))

(assert (= (and b!1055566 (not res!704377)) b!1055563))

(assert (= (and b!1055559 (not res!704374)) b!1055560))

(assert (= (and b!1055560 (not res!704373)) b!1055556))

(assert (= (and b!1055556 (not res!704379)) b!1055558))

(assert (= (and b!1055558 (not res!704380)) b!1055567))

(declare-fun m!975541 () Bool)

(assert (=> b!1055558 m!975541))

(declare-fun m!975543 () Bool)

(assert (=> b!1055560 m!975543))

(declare-fun m!975545 () Bool)

(assert (=> b!1055560 m!975545))

(declare-fun m!975547 () Bool)

(assert (=> b!1055560 m!975547))

(declare-fun m!975549 () Bool)

(assert (=> b!1055560 m!975549))

(declare-fun m!975551 () Bool)

(assert (=> b!1055562 m!975551))

(declare-fun m!975553 () Bool)

(assert (=> b!1055556 m!975553))

(declare-fun m!975555 () Bool)

(assert (=> b!1055559 m!975555))

(declare-fun m!975557 () Bool)

(assert (=> b!1055559 m!975557))

(declare-fun m!975559 () Bool)

(assert (=> b!1055564 m!975559))

(declare-fun m!975561 () Bool)

(assert (=> b!1055557 m!975561))

(declare-fun m!975563 () Bool)

(assert (=> b!1055561 m!975563))

(declare-fun m!975565 () Bool)

(assert (=> start!93044 m!975565))

(declare-fun m!975567 () Bool)

(assert (=> b!1055565 m!975567))

(assert (=> b!1055565 m!975555))

(declare-fun m!975569 () Bool)

(assert (=> b!1055567 m!975569))

(declare-fun m!975571 () Bool)

(assert (=> b!1055563 m!975571))

(check-sat (not start!93044) (not b!1055561) (not b!1055562) (not b!1055558) (not b!1055560) (not b!1055557) (not b!1055563) (not b!1055565) (not b!1055567) (not b!1055556))
(check-sat)
