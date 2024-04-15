; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44970 () Bool)

(assert start!44970)

(declare-fun b!493105 () Bool)

(declare-fun e!289586 () Bool)

(declare-fun e!289587 () Bool)

(assert (=> b!493105 (= e!289586 e!289587)))

(declare-fun res!295824 () Bool)

(assert (=> b!493105 (=> (not res!295824) (not e!289587))))

(declare-datatypes ((SeekEntryResult!3811 0))(
  ( (MissingZero!3811 (index!17423 (_ BitVec 32))) (Found!3811 (index!17424 (_ BitVec 32))) (Intermediate!3811 (undefined!4623 Bool) (index!17425 (_ BitVec 32)) (x!46516 (_ BitVec 32))) (Undefined!3811) (MissingVacant!3811 (index!17426 (_ BitVec 32))) )
))
(declare-fun lt!222899 () SeekEntryResult!3811)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493105 (= res!295824 (or (= lt!222899 (MissingZero!3811 i!1204)) (= lt!222899 (MissingVacant!3811 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31925 0))(
  ( (array!31926 (arr!15347 (Array (_ BitVec 32) (_ BitVec 64))) (size!15712 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31925)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31925 (_ BitVec 32)) SeekEntryResult!3811)

(assert (=> b!493105 (= lt!222899 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493106 () Bool)

(declare-fun res!295823 () Bool)

(assert (=> b!493106 (=> (not res!295823) (not e!289586))))

(declare-fun arrayContainsKey!0 (array!31925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493106 (= res!295823 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493107 () Bool)

(declare-fun e!289584 () Bool)

(assert (=> b!493107 (= e!289587 (not e!289584))))

(declare-fun res!295818 () Bool)

(assert (=> b!493107 (=> res!295818 e!289584)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!222903 () SeekEntryResult!3811)

(declare-fun lt!222900 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31925 (_ BitVec 32)) SeekEntryResult!3811)

(assert (=> b!493107 (= res!295818 (= lt!222903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222900 (select (store (arr!15347 a!3235) i!1204 k0!2280) j!176) (array!31926 (store (arr!15347 a!3235) i!1204 k0!2280) (size!15712 a!3235)) mask!3524)))))

(declare-fun lt!222901 () (_ BitVec 32))

(assert (=> b!493107 (= lt!222903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222901 (select (arr!15347 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493107 (= lt!222900 (toIndex!0 (select (store (arr!15347 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493107 (= lt!222901 (toIndex!0 (select (arr!15347 a!3235) j!176) mask!3524))))

(declare-fun lt!222902 () SeekEntryResult!3811)

(assert (=> b!493107 (= lt!222902 (Found!3811 j!176))))

(assert (=> b!493107 (= lt!222902 (seekEntryOrOpen!0 (select (arr!15347 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31925 (_ BitVec 32)) Bool)

(assert (=> b!493107 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14554 0))(
  ( (Unit!14555) )
))
(declare-fun lt!222904 () Unit!14554)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14554)

(assert (=> b!493107 (= lt!222904 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493108 () Bool)

(declare-fun res!295821 () Bool)

(assert (=> b!493108 (=> (not res!295821) (not e!289587))))

(assert (=> b!493108 (= res!295821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493109 () Bool)

(declare-fun res!295817 () Bool)

(assert (=> b!493109 (=> res!295817 e!289584)))

(get-info :version)

(assert (=> b!493109 (= res!295817 (or (not ((_ is Intermediate!3811) lt!222903)) (not (undefined!4623 lt!222903))))))

(declare-fun b!493110 () Bool)

(declare-fun res!295825 () Bool)

(assert (=> b!493110 (=> (not res!295825) (not e!289586))))

(assert (=> b!493110 (= res!295825 (and (= (size!15712 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15712 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15712 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493111 () Bool)

(declare-fun res!295819 () Bool)

(assert (=> b!493111 (=> (not res!295819) (not e!289587))))

(declare-datatypes ((List!9544 0))(
  ( (Nil!9541) (Cons!9540 (h!10408 (_ BitVec 64)) (t!15763 List!9544)) )
))
(declare-fun arrayNoDuplicates!0 (array!31925 (_ BitVec 32) List!9544) Bool)

(assert (=> b!493111 (= res!295819 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9541))))

(declare-fun b!493112 () Bool)

(declare-fun res!295826 () Bool)

(assert (=> b!493112 (=> (not res!295826) (not e!289586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493112 (= res!295826 (validKeyInArray!0 k0!2280))))

(declare-fun res!295820 () Bool)

(assert (=> start!44970 (=> (not res!295820) (not e!289586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44970 (= res!295820 (validMask!0 mask!3524))))

(assert (=> start!44970 e!289586))

(assert (=> start!44970 true))

(declare-fun array_inv!11230 (array!31925) Bool)

(assert (=> start!44970 (array_inv!11230 a!3235)))

(declare-fun b!493113 () Bool)

(assert (=> b!493113 (= e!289584 true)))

(assert (=> b!493113 (= lt!222902 Undefined!3811)))

(declare-fun b!493114 () Bool)

(declare-fun res!295822 () Bool)

(assert (=> b!493114 (=> (not res!295822) (not e!289586))))

(assert (=> b!493114 (= res!295822 (validKeyInArray!0 (select (arr!15347 a!3235) j!176)))))

(assert (= (and start!44970 res!295820) b!493110))

(assert (= (and b!493110 res!295825) b!493114))

(assert (= (and b!493114 res!295822) b!493112))

(assert (= (and b!493112 res!295826) b!493106))

(assert (= (and b!493106 res!295823) b!493105))

(assert (= (and b!493105 res!295824) b!493108))

(assert (= (and b!493108 res!295821) b!493111))

(assert (= (and b!493111 res!295819) b!493107))

(assert (= (and b!493107 (not res!295818)) b!493109))

(assert (= (and b!493109 (not res!295817)) b!493113))

(declare-fun m!473455 () Bool)

(assert (=> b!493105 m!473455))

(declare-fun m!473457 () Bool)

(assert (=> start!44970 m!473457))

(declare-fun m!473459 () Bool)

(assert (=> start!44970 m!473459))

(declare-fun m!473461 () Bool)

(assert (=> b!493106 m!473461))

(declare-fun m!473463 () Bool)

(assert (=> b!493108 m!473463))

(declare-fun m!473465 () Bool)

(assert (=> b!493114 m!473465))

(assert (=> b!493114 m!473465))

(declare-fun m!473467 () Bool)

(assert (=> b!493114 m!473467))

(declare-fun m!473469 () Bool)

(assert (=> b!493107 m!473469))

(declare-fun m!473471 () Bool)

(assert (=> b!493107 m!473471))

(declare-fun m!473473 () Bool)

(assert (=> b!493107 m!473473))

(assert (=> b!493107 m!473473))

(declare-fun m!473475 () Bool)

(assert (=> b!493107 m!473475))

(assert (=> b!493107 m!473465))

(declare-fun m!473477 () Bool)

(assert (=> b!493107 m!473477))

(assert (=> b!493107 m!473465))

(declare-fun m!473479 () Bool)

(assert (=> b!493107 m!473479))

(assert (=> b!493107 m!473473))

(declare-fun m!473481 () Bool)

(assert (=> b!493107 m!473481))

(assert (=> b!493107 m!473465))

(declare-fun m!473483 () Bool)

(assert (=> b!493107 m!473483))

(assert (=> b!493107 m!473465))

(declare-fun m!473485 () Bool)

(assert (=> b!493107 m!473485))

(declare-fun m!473487 () Bool)

(assert (=> b!493112 m!473487))

(declare-fun m!473489 () Bool)

(assert (=> b!493111 m!473489))

(check-sat (not b!493114) (not b!493111) (not b!493106) (not b!493112) (not b!493107) (not start!44970) (not b!493105) (not b!493108))
(check-sat)
