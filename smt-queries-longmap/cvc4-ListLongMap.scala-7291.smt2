; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93172 () Bool)

(assert start!93172)

(declare-fun e!600737 () Bool)

(declare-fun b!1056624 () Bool)

(declare-datatypes ((array!66643 0))(
  ( (array!66644 (arr!32046 (Array (_ BitVec 32) (_ BitVec 64))) (size!32582 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66643)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056624 (= e!600737 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056625 () Bool)

(declare-fun res!705374 () Bool)

(declare-fun e!600739 () Bool)

(assert (=> b!1056625 (=> (not res!705374) (not e!600739))))

(assert (=> b!1056625 (= res!705374 (= (select (arr!32046 a!3488) i!1381) k!2747))))

(declare-fun b!1056626 () Bool)

(declare-fun e!600740 () Bool)

(declare-fun e!600736 () Bool)

(assert (=> b!1056626 (= e!600740 e!600736)))

(declare-fun res!705370 () Bool)

(assert (=> b!1056626 (=> (not res!705370) (not e!600736))))

(declare-fun lt!466155 () (_ BitVec 32))

(assert (=> b!1056626 (= res!705370 (not (= lt!466155 i!1381)))))

(declare-fun lt!466154 () array!66643)

(declare-fun arrayScanForKey!0 (array!66643 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056626 (= lt!466155 (arrayScanForKey!0 lt!466154 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!705369 () Bool)

(assert (=> start!93172 (=> (not res!705369) (not e!600739))))

(assert (=> start!93172 (= res!705369 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32582 a!3488)) (bvslt (size!32582 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93172 e!600739))

(assert (=> start!93172 true))

(declare-fun array_inv!24826 (array!66643) Bool)

(assert (=> start!93172 (array_inv!24826 a!3488)))

(declare-fun b!1056627 () Bool)

(declare-fun res!705371 () Bool)

(assert (=> b!1056627 (=> (not res!705371) (not e!600739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056627 (= res!705371 (validKeyInArray!0 k!2747))))

(declare-fun b!1056628 () Bool)

(declare-fun e!600741 () Bool)

(assert (=> b!1056628 (= e!600741 e!600737)))

(declare-fun res!705373 () Bool)

(assert (=> b!1056628 (=> res!705373 e!600737)))

(assert (=> b!1056628 (= res!705373 (or (bvsgt lt!466155 i!1381) (bvsle i!1381 lt!466155)))))

(declare-fun b!1056629 () Bool)

(declare-fun e!600738 () Bool)

(assert (=> b!1056629 (= e!600736 (not e!600738))))

(declare-fun res!705366 () Bool)

(assert (=> b!1056629 (=> res!705366 e!600738)))

(assert (=> b!1056629 (= res!705366 (or (bvsgt lt!466155 i!1381) (bvsle i!1381 lt!466155)))))

(assert (=> b!1056629 e!600741))

(declare-fun res!705367 () Bool)

(assert (=> b!1056629 (=> (not res!705367) (not e!600741))))

(assert (=> b!1056629 (= res!705367 (= (select (store (arr!32046 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466155) k!2747))))

(declare-fun b!1056630 () Bool)

(assert (=> b!1056630 (= e!600738 true)))

(declare-datatypes ((List!22358 0))(
  ( (Nil!22355) (Cons!22354 (h!23563 (_ BitVec 64)) (t!31665 List!22358)) )
))
(declare-fun arrayNoDuplicates!0 (array!66643 (_ BitVec 32) List!22358) Bool)

(assert (=> b!1056630 (arrayNoDuplicates!0 a!3488 lt!466155 Nil!22355)))

(declare-datatypes ((Unit!34614 0))(
  ( (Unit!34615) )
))
(declare-fun lt!466153 () Unit!34614)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66643 (_ BitVec 32) (_ BitVec 32)) Unit!34614)

(assert (=> b!1056630 (= lt!466153 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466155))))

(declare-fun b!1056631 () Bool)

(assert (=> b!1056631 (= e!600739 e!600740)))

(declare-fun res!705368 () Bool)

(assert (=> b!1056631 (=> (not res!705368) (not e!600740))))

(assert (=> b!1056631 (= res!705368 (arrayContainsKey!0 lt!466154 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056631 (= lt!466154 (array!66644 (store (arr!32046 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32582 a!3488)))))

(declare-fun b!1056632 () Bool)

(declare-fun res!705372 () Bool)

(assert (=> b!1056632 (=> (not res!705372) (not e!600739))))

(assert (=> b!1056632 (= res!705372 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22355))))

(assert (= (and start!93172 res!705369) b!1056632))

(assert (= (and b!1056632 res!705372) b!1056627))

(assert (= (and b!1056627 res!705371) b!1056625))

(assert (= (and b!1056625 res!705374) b!1056631))

(assert (= (and b!1056631 res!705368) b!1056626))

(assert (= (and b!1056626 res!705370) b!1056629))

(assert (= (and b!1056629 res!705367) b!1056628))

(assert (= (and b!1056628 (not res!705373)) b!1056624))

(assert (= (and b!1056629 (not res!705366)) b!1056630))

(declare-fun m!976429 () Bool)

(assert (=> b!1056631 m!976429))

(declare-fun m!976431 () Bool)

(assert (=> b!1056631 m!976431))

(declare-fun m!976433 () Bool)

(assert (=> b!1056624 m!976433))

(assert (=> b!1056629 m!976431))

(declare-fun m!976435 () Bool)

(assert (=> b!1056629 m!976435))

(declare-fun m!976437 () Bool)

(assert (=> b!1056627 m!976437))

(declare-fun m!976439 () Bool)

(assert (=> b!1056626 m!976439))

(declare-fun m!976441 () Bool)

(assert (=> start!93172 m!976441))

(declare-fun m!976443 () Bool)

(assert (=> b!1056630 m!976443))

(declare-fun m!976445 () Bool)

(assert (=> b!1056630 m!976445))

(declare-fun m!976447 () Bool)

(assert (=> b!1056632 m!976447))

(declare-fun m!976449 () Bool)

(assert (=> b!1056625 m!976449))

(push 1)

(assert (not b!1056632))

