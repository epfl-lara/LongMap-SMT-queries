; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26724 () Bool)

(assert start!26724)

(declare-fun b!277585 () Bool)

(declare-fun e!177113 () Bool)

(assert (=> b!277585 (= e!177113 false)))

(declare-datatypes ((Unit!8735 0))(
  ( (Unit!8736) )
))
(declare-fun lt!138026 () Unit!8735)

(declare-fun e!177115 () Unit!8735)

(assert (=> b!277585 (= lt!138026 e!177115)))

(declare-fun c!45625 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13820 0))(
  ( (array!13821 (arr!6559 (Array (_ BitVec 32) (_ BitVec 64))) (size!6911 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13820)

(assert (=> b!277585 (= c!45625 (bvslt startIndex!26 (bvsub (size!6911 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277586 () Bool)

(declare-fun lt!138027 () Unit!8735)

(assert (=> b!277586 (= e!177115 lt!138027)))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13820 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8735)

(assert (=> b!277586 (= lt!138027 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13820 (_ BitVec 32)) Bool)

(assert (=> b!277586 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13821 (store (arr!6559 a!3325) i!1267 k0!2581) (size!6911 a!3325)) mask!3868)))

(declare-fun b!277587 () Bool)

(declare-fun res!141440 () Bool)

(declare-fun e!177114 () Bool)

(assert (=> b!277587 (=> (not res!141440) (not e!177114))))

(declare-datatypes ((List!4280 0))(
  ( (Nil!4277) (Cons!4276 (h!4943 (_ BitVec 64)) (t!9354 List!4280)) )
))
(declare-fun arrayNoDuplicates!0 (array!13820 (_ BitVec 32) List!4280) Bool)

(assert (=> b!277587 (= res!141440 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4277))))

(declare-fun b!277588 () Bool)

(assert (=> b!277588 (= e!177114 e!177113)))

(declare-fun res!141443 () Bool)

(assert (=> b!277588 (=> (not res!141443) (not e!177113))))

(declare-datatypes ((SeekEntryResult!1682 0))(
  ( (MissingZero!1682 (index!8898 (_ BitVec 32))) (Found!1682 (index!8899 (_ BitVec 32))) (Intermediate!1682 (undefined!2494 Bool) (index!8900 (_ BitVec 32)) (x!27255 (_ BitVec 32))) (Undefined!1682) (MissingVacant!1682 (index!8901 (_ BitVec 32))) )
))
(declare-fun lt!138025 () SeekEntryResult!1682)

(assert (=> b!277588 (= res!141443 (or (= lt!138025 (MissingZero!1682 i!1267)) (= lt!138025 (MissingVacant!1682 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13820 (_ BitVec 32)) SeekEntryResult!1682)

(assert (=> b!277588 (= lt!138025 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!141439 () Bool)

(assert (=> start!26724 (=> (not res!141439) (not e!177114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26724 (= res!141439 (validMask!0 mask!3868))))

(assert (=> start!26724 e!177114))

(declare-fun array_inv!4509 (array!13820) Bool)

(assert (=> start!26724 (array_inv!4509 a!3325)))

(assert (=> start!26724 true))

(declare-fun b!277589 () Bool)

(declare-fun res!141442 () Bool)

(assert (=> b!277589 (=> (not res!141442) (not e!177113))))

(assert (=> b!277589 (= res!141442 (= startIndex!26 i!1267))))

(declare-fun b!277590 () Bool)

(declare-fun res!141438 () Bool)

(assert (=> b!277590 (=> (not res!141438) (not e!177114))))

(declare-fun arrayContainsKey!0 (array!13820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277590 (= res!141438 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277591 () Bool)

(declare-fun Unit!8737 () Unit!8735)

(assert (=> b!277591 (= e!177115 Unit!8737)))

(declare-fun b!277592 () Bool)

(declare-fun res!141441 () Bool)

(assert (=> b!277592 (=> (not res!141441) (not e!177114))))

(assert (=> b!277592 (= res!141441 (and (= (size!6911 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6911 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6911 a!3325))))))

(declare-fun b!277593 () Bool)

(declare-fun res!141444 () Bool)

(assert (=> b!277593 (=> (not res!141444) (not e!177113))))

(assert (=> b!277593 (= res!141444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277594 () Bool)

(declare-fun res!141437 () Bool)

(assert (=> b!277594 (=> (not res!141437) (not e!177114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277594 (= res!141437 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26724 res!141439) b!277592))

(assert (= (and b!277592 res!141441) b!277594))

(assert (= (and b!277594 res!141437) b!277587))

(assert (= (and b!277587 res!141440) b!277590))

(assert (= (and b!277590 res!141438) b!277588))

(assert (= (and b!277588 res!141443) b!277593))

(assert (= (and b!277593 res!141444) b!277589))

(assert (= (and b!277589 res!141442) b!277585))

(assert (= (and b!277585 c!45625) b!277586))

(assert (= (and b!277585 (not c!45625)) b!277591))

(declare-fun m!292757 () Bool)

(assert (=> b!277590 m!292757))

(declare-fun m!292759 () Bool)

(assert (=> start!26724 m!292759))

(declare-fun m!292761 () Bool)

(assert (=> start!26724 m!292761))

(declare-fun m!292763 () Bool)

(assert (=> b!277594 m!292763))

(declare-fun m!292765 () Bool)

(assert (=> b!277586 m!292765))

(declare-fun m!292767 () Bool)

(assert (=> b!277586 m!292767))

(declare-fun m!292769 () Bool)

(assert (=> b!277586 m!292769))

(declare-fun m!292771 () Bool)

(assert (=> b!277588 m!292771))

(declare-fun m!292773 () Bool)

(assert (=> b!277593 m!292773))

(declare-fun m!292775 () Bool)

(assert (=> b!277587 m!292775))

(check-sat (not b!277594) (not b!277588) (not b!277586) (not start!26724) (not b!277590) (not b!277593) (not b!277587))
(check-sat)
