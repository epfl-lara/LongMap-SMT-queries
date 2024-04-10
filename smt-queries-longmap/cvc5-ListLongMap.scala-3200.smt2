; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44946 () Bool)

(assert start!44946)

(declare-fun b!492879 () Bool)

(declare-fun res!295455 () Bool)

(declare-fun e!289535 () Bool)

(assert (=> b!492879 (=> (not res!295455) (not e!289535))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31891 0))(
  ( (array!31892 (arr!15330 (Array (_ BitVec 32) (_ BitVec 64))) (size!15694 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31891)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!492879 (= res!295455 (and (= (size!15694 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15694 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15694 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!289536 () Bool)

(declare-fun b!492880 () Bool)

(declare-datatypes ((SeekEntryResult!3797 0))(
  ( (MissingZero!3797 (index!17367 (_ BitVec 32))) (Found!3797 (index!17368 (_ BitVec 32))) (Intermediate!3797 (undefined!4609 Bool) (index!17369 (_ BitVec 32)) (x!46459 (_ BitVec 32))) (Undefined!3797) (MissingVacant!3797 (index!17370 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31891 (_ BitVec 32)) SeekEntryResult!3797)

(assert (=> b!492880 (= e!289536 (= (seekEntryOrOpen!0 (select (arr!15330 a!3235) j!176) a!3235 mask!3524) (Found!3797 j!176)))))

(declare-fun b!492881 () Bool)

(declare-fun res!295454 () Bool)

(declare-fun e!289534 () Bool)

(assert (=> b!492881 (=> (not res!295454) (not e!289534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31891 (_ BitVec 32)) Bool)

(assert (=> b!492881 (= res!295454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492882 () Bool)

(declare-fun res!295457 () Bool)

(assert (=> b!492882 (=> (not res!295457) (not e!289535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492882 (= res!295457 (validKeyInArray!0 (select (arr!15330 a!3235) j!176)))))

(declare-fun b!492883 () Bool)

(declare-fun res!295449 () Bool)

(assert (=> b!492883 (=> (not res!295449) (not e!289534))))

(declare-datatypes ((List!9488 0))(
  ( (Nil!9485) (Cons!9484 (h!10352 (_ BitVec 64)) (t!15716 List!9488)) )
))
(declare-fun arrayNoDuplicates!0 (array!31891 (_ BitVec 32) List!9488) Bool)

(assert (=> b!492883 (= res!295449 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9485))))

(declare-fun b!492884 () Bool)

(declare-fun res!295450 () Bool)

(assert (=> b!492884 (=> (not res!295450) (not e!289535))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492884 (= res!295450 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!295452 () Bool)

(assert (=> start!44946 (=> (not res!295452) (not e!289535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44946 (= res!295452 (validMask!0 mask!3524))))

(assert (=> start!44946 e!289535))

(assert (=> start!44946 true))

(declare-fun array_inv!11126 (array!31891) Bool)

(assert (=> start!44946 (array_inv!11126 a!3235)))

(declare-fun b!492885 () Bool)

(declare-fun res!295453 () Bool)

(assert (=> b!492885 (=> (not res!295453) (not e!289535))))

(assert (=> b!492885 (= res!295453 (validKeyInArray!0 k!2280))))

(declare-fun b!492886 () Bool)

(assert (=> b!492886 (= e!289535 e!289534)))

(declare-fun res!295451 () Bool)

(assert (=> b!492886 (=> (not res!295451) (not e!289534))))

(declare-fun lt!222821 () SeekEntryResult!3797)

(assert (=> b!492886 (= res!295451 (or (= lt!222821 (MissingZero!3797 i!1204)) (= lt!222821 (MissingVacant!3797 i!1204))))))

(assert (=> b!492886 (= lt!222821 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!492887 () Bool)

(assert (=> b!492887 (= e!289534 (not true))))

(declare-fun lt!222818 () (_ BitVec 32))

(declare-fun lt!222822 () SeekEntryResult!3797)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31891 (_ BitVec 32)) SeekEntryResult!3797)

(assert (=> b!492887 (= lt!222822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222818 (select (store (arr!15330 a!3235) i!1204 k!2280) j!176) (array!31892 (store (arr!15330 a!3235) i!1204 k!2280) (size!15694 a!3235)) mask!3524))))

(declare-fun lt!222823 () (_ BitVec 32))

(declare-fun lt!222819 () SeekEntryResult!3797)

(assert (=> b!492887 (= lt!222819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222823 (select (arr!15330 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492887 (= lt!222818 (toIndex!0 (select (store (arr!15330 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!492887 (= lt!222823 (toIndex!0 (select (arr!15330 a!3235) j!176) mask!3524))))

(assert (=> b!492887 e!289536))

(declare-fun res!295456 () Bool)

(assert (=> b!492887 (=> (not res!295456) (not e!289536))))

(assert (=> b!492887 (= res!295456 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14540 0))(
  ( (Unit!14541) )
))
(declare-fun lt!222820 () Unit!14540)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14540)

(assert (=> b!492887 (= lt!222820 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44946 res!295452) b!492879))

(assert (= (and b!492879 res!295455) b!492882))

(assert (= (and b!492882 res!295457) b!492885))

(assert (= (and b!492885 res!295453) b!492884))

(assert (= (and b!492884 res!295450) b!492886))

(assert (= (and b!492886 res!295451) b!492881))

(assert (= (and b!492881 res!295454) b!492883))

(assert (= (and b!492883 res!295449) b!492887))

(assert (= (and b!492887 res!295456) b!492880))

(declare-fun m!473559 () Bool)

(assert (=> b!492887 m!473559))

(declare-fun m!473561 () Bool)

(assert (=> b!492887 m!473561))

(declare-fun m!473563 () Bool)

(assert (=> b!492887 m!473563))

(assert (=> b!492887 m!473563))

(declare-fun m!473565 () Bool)

(assert (=> b!492887 m!473565))

(declare-fun m!473567 () Bool)

(assert (=> b!492887 m!473567))

(declare-fun m!473569 () Bool)

(assert (=> b!492887 m!473569))

(assert (=> b!492887 m!473567))

(declare-fun m!473571 () Bool)

(assert (=> b!492887 m!473571))

(assert (=> b!492887 m!473567))

(declare-fun m!473573 () Bool)

(assert (=> b!492887 m!473573))

(assert (=> b!492887 m!473563))

(declare-fun m!473575 () Bool)

(assert (=> b!492887 m!473575))

(declare-fun m!473577 () Bool)

(assert (=> b!492885 m!473577))

(declare-fun m!473579 () Bool)

(assert (=> b!492884 m!473579))

(declare-fun m!473581 () Bool)

(assert (=> b!492883 m!473581))

(assert (=> b!492882 m!473567))

(assert (=> b!492882 m!473567))

(declare-fun m!473583 () Bool)

(assert (=> b!492882 m!473583))

(declare-fun m!473585 () Bool)

(assert (=> b!492886 m!473585))

(declare-fun m!473587 () Bool)

(assert (=> start!44946 m!473587))

(declare-fun m!473589 () Bool)

(assert (=> start!44946 m!473589))

(assert (=> b!492880 m!473567))

(assert (=> b!492880 m!473567))

(declare-fun m!473591 () Bool)

(assert (=> b!492880 m!473591))

(declare-fun m!473593 () Bool)

(assert (=> b!492881 m!473593))

(push 1)

