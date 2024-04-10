; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29650 () Bool)

(assert start!29650)

(declare-fun b!299128 () Bool)

(declare-fun res!157696 () Bool)

(declare-fun e!188952 () Bool)

(assert (=> b!299128 (=> (not res!157696) (not e!188952))))

(declare-datatypes ((array!15114 0))(
  ( (array!15115 (arr!7157 (Array (_ BitVec 32) (_ BitVec 64))) (size!7509 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15114)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15114 (_ BitVec 32)) Bool)

(assert (=> b!299128 (= res!157696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299129 () Bool)

(declare-fun e!188953 () Bool)

(declare-fun e!188950 () Bool)

(assert (=> b!299129 (= e!188953 e!188950)))

(declare-fun res!157697 () Bool)

(assert (=> b!299129 (=> (not res!157697) (not e!188950))))

(declare-datatypes ((SeekEntryResult!2306 0))(
  ( (MissingZero!2306 (index!11397 (_ BitVec 32))) (Found!2306 (index!11398 (_ BitVec 32))) (Intermediate!2306 (undefined!3118 Bool) (index!11399 (_ BitVec 32)) (x!29641 (_ BitVec 32))) (Undefined!2306) (MissingVacant!2306 (index!11400 (_ BitVec 32))) )
))
(declare-fun lt!148714 () SeekEntryResult!2306)

(declare-fun lt!148716 () Bool)

(assert (=> b!299129 (= res!157697 (and (or lt!148716 (not (undefined!3118 lt!148714))) (not lt!148716) (= (select (arr!7157 a!3312) (index!11399 lt!148714)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!299129 (= lt!148716 (not (is-Intermediate!2306 lt!148714)))))

(declare-fun b!299130 () Bool)

(declare-fun res!157692 () Bool)

(declare-fun e!188951 () Bool)

(assert (=> b!299130 (=> (not res!157692) (not e!188951))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299130 (= res!157692 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!299131 () Bool)

(assert (=> b!299131 (= e!188952 e!188953)))

(declare-fun res!157693 () Bool)

(assert (=> b!299131 (=> (not res!157693) (not e!188953))))

(declare-fun lt!148717 () SeekEntryResult!2306)

(declare-fun lt!148715 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!299131 (= res!157693 (and (not lt!148715) (= lt!148717 (MissingVacant!2306 i!1256))))))

(declare-fun lt!148718 () (_ BitVec 32))

(declare-fun lt!148713 () SeekEntryResult!2306)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15114 (_ BitVec 32)) SeekEntryResult!2306)

(assert (=> b!299131 (= lt!148713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148718 k!2524 (array!15115 (store (arr!7157 a!3312) i!1256 k!2524) (size!7509 a!3312)) mask!3809))))

(assert (=> b!299131 (= lt!148714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148718 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299131 (= lt!148718 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!299132 () Bool)

(assert (=> b!299132 (= e!188951 e!188952)))

(declare-fun res!157694 () Bool)

(assert (=> b!299132 (=> (not res!157694) (not e!188952))))

(assert (=> b!299132 (= res!157694 (or lt!148715 (= lt!148717 (MissingVacant!2306 i!1256))))))

(assert (=> b!299132 (= lt!148715 (= lt!148717 (MissingZero!2306 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15114 (_ BitVec 32)) SeekEntryResult!2306)

(assert (=> b!299132 (= lt!148717 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!299133 () Bool)

(declare-fun res!157698 () Bool)

(assert (=> b!299133 (=> (not res!157698) (not e!188951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299133 (= res!157698 (validKeyInArray!0 k!2524))))

(declare-fun res!157695 () Bool)

(assert (=> start!29650 (=> (not res!157695) (not e!188951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29650 (= res!157695 (validMask!0 mask!3809))))

(assert (=> start!29650 e!188951))

(assert (=> start!29650 true))

(declare-fun array_inv!5120 (array!15114) Bool)

(assert (=> start!29650 (array_inv!5120 a!3312)))

(declare-fun b!299134 () Bool)

(assert (=> b!299134 (= e!188950 (not true))))

(declare-datatypes ((Unit!9323 0))(
  ( (Unit!9324) )
))
(declare-fun lt!148719 () Unit!9323)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!15114 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9323)

(assert (=> b!299134 (= lt!148719 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!148718 (index!11399 lt!148714) (x!29641 lt!148714) mask!3809))))

(assert (=> b!299134 (= (index!11399 lt!148714) i!1256)))

(declare-fun b!299135 () Bool)

(declare-fun res!157691 () Bool)

(assert (=> b!299135 (=> (not res!157691) (not e!188951))))

(assert (=> b!299135 (= res!157691 (and (= (size!7509 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7509 a!3312))))))

(assert (= (and start!29650 res!157695) b!299135))

(assert (= (and b!299135 res!157691) b!299133))

(assert (= (and b!299133 res!157698) b!299130))

(assert (= (and b!299130 res!157692) b!299132))

(assert (= (and b!299132 res!157694) b!299128))

(assert (= (and b!299128 res!157696) b!299131))

(assert (= (and b!299131 res!157693) b!299129))

(assert (= (and b!299129 res!157697) b!299134))

(declare-fun m!311487 () Bool)

(assert (=> b!299130 m!311487))

(declare-fun m!311489 () Bool)

(assert (=> start!29650 m!311489))

(declare-fun m!311491 () Bool)

(assert (=> start!29650 m!311491))

(declare-fun m!311493 () Bool)

(assert (=> b!299129 m!311493))

(declare-fun m!311495 () Bool)

(assert (=> b!299133 m!311495))

(declare-fun m!311497 () Bool)

(assert (=> b!299134 m!311497))

(declare-fun m!311499 () Bool)

(assert (=> b!299131 m!311499))

(declare-fun m!311501 () Bool)

(assert (=> b!299131 m!311501))

(declare-fun m!311503 () Bool)

(assert (=> b!299131 m!311503))

(declare-fun m!311505 () Bool)

(assert (=> b!299131 m!311505))

(declare-fun m!311507 () Bool)

(assert (=> b!299132 m!311507))

(declare-fun m!311509 () Bool)

(assert (=> b!299128 m!311509))

(push 1)

