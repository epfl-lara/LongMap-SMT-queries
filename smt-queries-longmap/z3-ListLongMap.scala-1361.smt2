; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26726 () Bool)

(assert start!26726)

(declare-fun b!277568 () Bool)

(declare-fun res!141440 () Bool)

(declare-fun e!177101 () Bool)

(assert (=> b!277568 (=> (not res!141440) (not e!177101))))

(declare-datatypes ((array!13823 0))(
  ( (array!13824 (arr!6561 (Array (_ BitVec 32) (_ BitVec 64))) (size!6913 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13823)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!277568 (= res!141440 (and (= (size!6913 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6913 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6913 a!3325))))))

(declare-fun b!277569 () Bool)

(declare-fun res!141447 () Bool)

(assert (=> b!277569 (=> (not res!141447) (not e!177101))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277569 (= res!141447 (validKeyInArray!0 k0!2581))))

(declare-fun b!277570 () Bool)

(declare-fun res!141441 () Bool)

(assert (=> b!277570 (=> (not res!141441) (not e!177101))))

(declare-fun arrayContainsKey!0 (array!13823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277570 (= res!141441 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277571 () Bool)

(declare-datatypes ((Unit!8758 0))(
  ( (Unit!8759) )
))
(declare-fun e!177102 () Unit!8758)

(declare-fun lt!137977 () Unit!8758)

(assert (=> b!277571 (= e!177102 lt!137977)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13823 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8758)

(assert (=> b!277571 (= lt!137977 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13823 (_ BitVec 32)) Bool)

(assert (=> b!277571 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13824 (store (arr!6561 a!3325) i!1267 k0!2581) (size!6913 a!3325)) mask!3868)))

(declare-fun b!277572 () Bool)

(declare-fun res!141445 () Bool)

(declare-fun e!177103 () Bool)

(assert (=> b!277572 (=> (not res!141445) (not e!177103))))

(assert (=> b!277572 (= res!141445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277573 () Bool)

(declare-fun res!141446 () Bool)

(assert (=> b!277573 (=> (not res!141446) (not e!177101))))

(declare-datatypes ((List!4369 0))(
  ( (Nil!4366) (Cons!4365 (h!5032 (_ BitVec 64)) (t!9451 List!4369)) )
))
(declare-fun arrayNoDuplicates!0 (array!13823 (_ BitVec 32) List!4369) Bool)

(assert (=> b!277573 (= res!141446 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4366))))

(declare-fun b!277574 () Bool)

(assert (=> b!277574 (= e!177103 false)))

(declare-fun lt!137975 () Unit!8758)

(assert (=> b!277574 (= lt!137975 e!177102)))

(declare-fun c!45615 () Bool)

(assert (=> b!277574 (= c!45615 (bvslt startIndex!26 (bvsub (size!6913 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!141444 () Bool)

(assert (=> start!26726 (=> (not res!141444) (not e!177101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26726 (= res!141444 (validMask!0 mask!3868))))

(assert (=> start!26726 e!177101))

(declare-fun array_inv!4524 (array!13823) Bool)

(assert (=> start!26726 (array_inv!4524 a!3325)))

(assert (=> start!26726 true))

(declare-fun b!277575 () Bool)

(assert (=> b!277575 (= e!177101 e!177103)))

(declare-fun res!141442 () Bool)

(assert (=> b!277575 (=> (not res!141442) (not e!177103))))

(declare-datatypes ((SeekEntryResult!1719 0))(
  ( (MissingZero!1719 (index!9046 (_ BitVec 32))) (Found!1719 (index!9047 (_ BitVec 32))) (Intermediate!1719 (undefined!2531 Bool) (index!9048 (_ BitVec 32)) (x!27292 (_ BitVec 32))) (Undefined!1719) (MissingVacant!1719 (index!9049 (_ BitVec 32))) )
))
(declare-fun lt!137976 () SeekEntryResult!1719)

(assert (=> b!277575 (= res!141442 (or (= lt!137976 (MissingZero!1719 i!1267)) (= lt!137976 (MissingVacant!1719 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13823 (_ BitVec 32)) SeekEntryResult!1719)

(assert (=> b!277575 (= lt!137976 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277576 () Bool)

(declare-fun res!141443 () Bool)

(assert (=> b!277576 (=> (not res!141443) (not e!177103))))

(assert (=> b!277576 (= res!141443 (= startIndex!26 i!1267))))

(declare-fun b!277577 () Bool)

(declare-fun Unit!8760 () Unit!8758)

(assert (=> b!277577 (= e!177102 Unit!8760)))

(assert (= (and start!26726 res!141444) b!277568))

(assert (= (and b!277568 res!141440) b!277569))

(assert (= (and b!277569 res!141447) b!277573))

(assert (= (and b!277573 res!141446) b!277570))

(assert (= (and b!277570 res!141441) b!277575))

(assert (= (and b!277575 res!141442) b!277572))

(assert (= (and b!277572 res!141445) b!277576))

(assert (= (and b!277576 res!141443) b!277574))

(assert (= (and b!277574 c!45615) b!277571))

(assert (= (and b!277574 (not c!45615)) b!277577))

(declare-fun m!292571 () Bool)

(assert (=> b!277573 m!292571))

(declare-fun m!292573 () Bool)

(assert (=> b!277570 m!292573))

(declare-fun m!292575 () Bool)

(assert (=> start!26726 m!292575))

(declare-fun m!292577 () Bool)

(assert (=> start!26726 m!292577))

(declare-fun m!292579 () Bool)

(assert (=> b!277569 m!292579))

(declare-fun m!292581 () Bool)

(assert (=> b!277571 m!292581))

(declare-fun m!292583 () Bool)

(assert (=> b!277571 m!292583))

(declare-fun m!292585 () Bool)

(assert (=> b!277571 m!292585))

(declare-fun m!292587 () Bool)

(assert (=> b!277572 m!292587))

(declare-fun m!292589 () Bool)

(assert (=> b!277575 m!292589))

(check-sat (not b!277571) (not b!277573) (not b!277570) (not b!277575) (not b!277569) (not start!26726) (not b!277572))
(check-sat)
