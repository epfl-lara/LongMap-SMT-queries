; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92860 () Bool)

(assert start!92860)

(declare-fun lt!465467 () (_ BitVec 32))

(declare-fun e!599166 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-datatypes ((array!66520 0))(
  ( (array!66521 (arr!31992 (Array (_ BitVec 32) (_ BitVec 64))) (size!32528 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66520)

(declare-fun b!1054581 () Bool)

(declare-fun arrayContainsKey!0 (array!66520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054581 (= e!599166 (arrayContainsKey!0 a!3488 k!2747 lt!465467))))

(declare-fun b!1054582 () Bool)

(declare-fun res!703526 () Bool)

(declare-fun e!599162 () Bool)

(assert (=> b!1054582 (=> (not res!703526) (not e!599162))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054582 (= res!703526 (= (select (arr!31992 a!3488) i!1381) k!2747))))

(declare-fun b!1054583 () Bool)

(declare-fun e!599163 () Bool)

(declare-fun e!599165 () Bool)

(assert (=> b!1054583 (= e!599163 (not e!599165))))

(declare-fun res!703528 () Bool)

(assert (=> b!1054583 (=> res!703528 e!599165)))

(assert (=> b!1054583 (= res!703528 (bvsle lt!465467 i!1381))))

(declare-fun e!599164 () Bool)

(assert (=> b!1054583 e!599164))

(declare-fun res!703529 () Bool)

(assert (=> b!1054583 (=> (not res!703529) (not e!599164))))

(assert (=> b!1054583 (= res!703529 (= (select (store (arr!31992 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465467) k!2747))))

(declare-fun res!703525 () Bool)

(assert (=> start!92860 (=> (not res!703525) (not e!599162))))

(assert (=> start!92860 (= res!703525 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32528 a!3488)) (bvslt (size!32528 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92860 e!599162))

(assert (=> start!92860 true))

(declare-fun array_inv!24772 (array!66520) Bool)

(assert (=> start!92860 (array_inv!24772 a!3488)))

(declare-fun b!1054584 () Bool)

(declare-fun e!599161 () Bool)

(assert (=> b!1054584 (= e!599162 e!599161)))

(declare-fun res!703522 () Bool)

(assert (=> b!1054584 (=> (not res!703522) (not e!599161))))

(declare-fun lt!465466 () array!66520)

(assert (=> b!1054584 (= res!703522 (arrayContainsKey!0 lt!465466 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054584 (= lt!465466 (array!66521 (store (arr!31992 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32528 a!3488)))))

(declare-fun b!1054585 () Bool)

(declare-fun res!703521 () Bool)

(assert (=> b!1054585 (=> (not res!703521) (not e!599162))))

(declare-datatypes ((List!22304 0))(
  ( (Nil!22301) (Cons!22300 (h!23509 (_ BitVec 64)) (t!31611 List!22304)) )
))
(declare-fun arrayNoDuplicates!0 (array!66520 (_ BitVec 32) List!22304) Bool)

(assert (=> b!1054585 (= res!703521 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22301))))

(declare-fun b!1054586 () Bool)

(assert (=> b!1054586 (= e!599164 e!599166)))

(declare-fun res!703524 () Bool)

(assert (=> b!1054586 (=> res!703524 e!599166)))

(assert (=> b!1054586 (= res!703524 (bvsle lt!465467 i!1381))))

(declare-fun b!1054587 () Bool)

(assert (=> b!1054587 (= e!599165 true)))

(assert (=> b!1054587 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34542 0))(
  ( (Unit!34543) )
))
(declare-fun lt!465465 () Unit!34542)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34542)

(assert (=> b!1054587 (= lt!465465 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465467 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054587 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22301)))

(declare-fun lt!465468 () Unit!34542)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66520 (_ BitVec 32) (_ BitVec 32)) Unit!34542)

(assert (=> b!1054587 (= lt!465468 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054588 () Bool)

(assert (=> b!1054588 (= e!599161 e!599163)))

(declare-fun res!703523 () Bool)

(assert (=> b!1054588 (=> (not res!703523) (not e!599163))))

(assert (=> b!1054588 (= res!703523 (not (= lt!465467 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66520 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054588 (= lt!465467 (arrayScanForKey!0 lt!465466 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054589 () Bool)

(declare-fun res!703527 () Bool)

(assert (=> b!1054589 (=> (not res!703527) (not e!599162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054589 (= res!703527 (validKeyInArray!0 k!2747))))

(assert (= (and start!92860 res!703525) b!1054585))

(assert (= (and b!1054585 res!703521) b!1054589))

(assert (= (and b!1054589 res!703527) b!1054582))

(assert (= (and b!1054582 res!703526) b!1054584))

(assert (= (and b!1054584 res!703522) b!1054588))

(assert (= (and b!1054588 res!703523) b!1054583))

(assert (= (and b!1054583 res!703529) b!1054586))

(assert (= (and b!1054586 (not res!703524)) b!1054581))

(assert (= (and b!1054583 (not res!703528)) b!1054587))

(declare-fun m!974631 () Bool)

(assert (=> b!1054583 m!974631))

(declare-fun m!974633 () Bool)

(assert (=> b!1054583 m!974633))

(declare-fun m!974635 () Bool)

(assert (=> b!1054587 m!974635))

(declare-fun m!974637 () Bool)

(assert (=> b!1054587 m!974637))

(declare-fun m!974639 () Bool)

(assert (=> b!1054587 m!974639))

(declare-fun m!974641 () Bool)

(assert (=> b!1054587 m!974641))

(declare-fun m!974643 () Bool)

(assert (=> b!1054588 m!974643))

(declare-fun m!974645 () Bool)

(assert (=> b!1054582 m!974645))

(declare-fun m!974647 () Bool)

(assert (=> b!1054585 m!974647))

(declare-fun m!974649 () Bool)

(assert (=> b!1054589 m!974649))

(declare-fun m!974651 () Bool)

(assert (=> b!1054584 m!974651))

(assert (=> b!1054584 m!974631))

(declare-fun m!974653 () Bool)

(assert (=> b!1054581 m!974653))

(declare-fun m!974655 () Bool)

(assert (=> start!92860 m!974655))

(push 1)

