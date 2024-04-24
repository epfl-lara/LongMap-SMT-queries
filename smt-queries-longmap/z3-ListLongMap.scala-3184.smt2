; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44720 () Bool)

(assert start!44720)

(declare-fun b!490886 () Bool)

(declare-fun res!293880 () Bool)

(declare-fun e!288492 () Bool)

(assert (=> b!490886 (=> (not res!293880) (not e!288492))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490886 (= res!293880 (validKeyInArray!0 k0!2280))))

(declare-fun b!490887 () Bool)

(declare-fun res!293884 () Bool)

(assert (=> b!490887 (=> (not res!293884) (not e!288492))))

(declare-datatypes ((array!31780 0))(
  ( (array!31781 (arr!15277 (Array (_ BitVec 32) (_ BitVec 64))) (size!15641 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31780)

(declare-fun arrayContainsKey!0 (array!31780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490887 (= res!293884 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490888 () Bool)

(declare-fun res!293877 () Bool)

(assert (=> b!490888 (=> (not res!293877) (not e!288492))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490888 (= res!293877 (and (= (size!15641 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15641 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15641 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490889 () Bool)

(declare-fun res!293878 () Bool)

(declare-fun e!288493 () Bool)

(assert (=> b!490889 (=> (not res!293878) (not e!288493))))

(declare-datatypes ((List!9342 0))(
  ( (Nil!9339) (Cons!9338 (h!10200 (_ BitVec 64)) (t!15562 List!9342)) )
))
(declare-fun arrayNoDuplicates!0 (array!31780 (_ BitVec 32) List!9342) Bool)

(assert (=> b!490889 (= res!293878 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9339))))

(declare-fun b!490890 () Bool)

(declare-fun e!288494 () Bool)

(assert (=> b!490890 (= e!288494 true)))

(declare-datatypes ((SeekEntryResult!3700 0))(
  ( (MissingZero!3700 (index!16979 (_ BitVec 32))) (Found!3700 (index!16980 (_ BitVec 32))) (Intermediate!3700 (undefined!4512 Bool) (index!16981 (_ BitVec 32)) (x!46219 (_ BitVec 32))) (Undefined!3700) (MissingVacant!3700 (index!16982 (_ BitVec 32))) )
))
(declare-fun lt!221846 () SeekEntryResult!3700)

(declare-fun lt!221848 () (_ BitVec 64))

(declare-fun lt!221847 () array!31780)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31780 (_ BitVec 32)) SeekEntryResult!3700)

(assert (=> b!490890 (= lt!221846 (seekEntryOrOpen!0 lt!221848 lt!221847 mask!3524))))

(declare-datatypes ((Unit!14407 0))(
  ( (Unit!14408) )
))
(declare-fun lt!221845 () Unit!14407)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31780 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14407)

(assert (=> b!490890 (= lt!221845 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun res!293879 () Bool)

(assert (=> start!44720 (=> (not res!293879) (not e!288492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44720 (= res!293879 (validMask!0 mask!3524))))

(assert (=> start!44720 e!288492))

(assert (=> start!44720 true))

(declare-fun array_inv!11136 (array!31780) Bool)

(assert (=> start!44720 (array_inv!11136 a!3235)))

(declare-fun b!490891 () Bool)

(assert (=> b!490891 (= e!288492 e!288493)))

(declare-fun res!293883 () Bool)

(assert (=> b!490891 (=> (not res!293883) (not e!288493))))

(declare-fun lt!221844 () SeekEntryResult!3700)

(assert (=> b!490891 (= res!293883 (or (= lt!221844 (MissingZero!3700 i!1204)) (= lt!221844 (MissingVacant!3700 i!1204))))))

(assert (=> b!490891 (= lt!221844 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490892 () Bool)

(declare-fun res!293881 () Bool)

(assert (=> b!490892 (=> (not res!293881) (not e!288492))))

(assert (=> b!490892 (= res!293881 (validKeyInArray!0 (select (arr!15277 a!3235) j!176)))))

(declare-fun b!490893 () Bool)

(assert (=> b!490893 (= e!288493 (not e!288494))))

(declare-fun res!293882 () Bool)

(assert (=> b!490893 (=> res!293882 e!288494)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31780 (_ BitVec 32)) SeekEntryResult!3700)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490893 (= res!293882 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15277 a!3235) j!176) mask!3524) (select (arr!15277 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221848 mask!3524) lt!221848 lt!221847 mask!3524))))))

(assert (=> b!490893 (= lt!221848 (select (store (arr!15277 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490893 (= lt!221847 (array!31781 (store (arr!15277 a!3235) i!1204 k0!2280) (size!15641 a!3235)))))

(assert (=> b!490893 (= lt!221846 (Found!3700 j!176))))

(assert (=> b!490893 (= lt!221846 (seekEntryOrOpen!0 (select (arr!15277 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31780 (_ BitVec 32)) Bool)

(assert (=> b!490893 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221843 () Unit!14407)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14407)

(assert (=> b!490893 (= lt!221843 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490894 () Bool)

(declare-fun res!293876 () Bool)

(assert (=> b!490894 (=> (not res!293876) (not e!288493))))

(assert (=> b!490894 (= res!293876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44720 res!293879) b!490888))

(assert (= (and b!490888 res!293877) b!490892))

(assert (= (and b!490892 res!293881) b!490886))

(assert (= (and b!490886 res!293880) b!490887))

(assert (= (and b!490887 res!293884) b!490891))

(assert (= (and b!490891 res!293883) b!490894))

(assert (= (and b!490894 res!293876) b!490889))

(assert (= (and b!490889 res!293878) b!490893))

(assert (= (and b!490893 (not res!293882)) b!490890))

(declare-fun m!471481 () Bool)

(assert (=> b!490891 m!471481))

(declare-fun m!471483 () Bool)

(assert (=> b!490894 m!471483))

(declare-fun m!471485 () Bool)

(assert (=> start!44720 m!471485))

(declare-fun m!471487 () Bool)

(assert (=> start!44720 m!471487))

(declare-fun m!471489 () Bool)

(assert (=> b!490887 m!471489))

(declare-fun m!471491 () Bool)

(assert (=> b!490889 m!471491))

(declare-fun m!471493 () Bool)

(assert (=> b!490890 m!471493))

(declare-fun m!471495 () Bool)

(assert (=> b!490890 m!471495))

(declare-fun m!471497 () Bool)

(assert (=> b!490892 m!471497))

(assert (=> b!490892 m!471497))

(declare-fun m!471499 () Bool)

(assert (=> b!490892 m!471499))

(declare-fun m!471501 () Bool)

(assert (=> b!490886 m!471501))

(declare-fun m!471503 () Bool)

(assert (=> b!490893 m!471503))

(declare-fun m!471505 () Bool)

(assert (=> b!490893 m!471505))

(declare-fun m!471507 () Bool)

(assert (=> b!490893 m!471507))

(declare-fun m!471509 () Bool)

(assert (=> b!490893 m!471509))

(assert (=> b!490893 m!471497))

(declare-fun m!471511 () Bool)

(assert (=> b!490893 m!471511))

(assert (=> b!490893 m!471497))

(assert (=> b!490893 m!471509))

(declare-fun m!471513 () Bool)

(assert (=> b!490893 m!471513))

(assert (=> b!490893 m!471497))

(declare-fun m!471515 () Bool)

(assert (=> b!490893 m!471515))

(assert (=> b!490893 m!471513))

(declare-fun m!471517 () Bool)

(assert (=> b!490893 m!471517))

(assert (=> b!490893 m!471497))

(declare-fun m!471519 () Bool)

(assert (=> b!490893 m!471519))

(check-sat (not b!490886) (not b!490891) (not b!490892) (not b!490889) (not b!490893) (not b!490890) (not start!44720) (not b!490887) (not b!490894))
(check-sat)
