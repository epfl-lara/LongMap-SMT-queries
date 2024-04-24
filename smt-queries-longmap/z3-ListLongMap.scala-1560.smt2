; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29632 () Bool)

(assert start!29632)

(declare-fun b!299076 () Bool)

(declare-fun e!188916 () Bool)

(declare-fun e!188917 () Bool)

(assert (=> b!299076 (= e!188916 e!188917)))

(declare-fun res!157689 () Bool)

(assert (=> b!299076 (=> (not res!157689) (not e!188917))))

(declare-datatypes ((SeekEntryResult!2270 0))(
  ( (MissingZero!2270 (index!11253 (_ BitVec 32))) (Found!2270 (index!11254 (_ BitVec 32))) (Intermediate!2270 (undefined!3082 Bool) (index!11255 (_ BitVec 32)) (x!29602 (_ BitVec 32))) (Undefined!2270) (MissingVacant!2270 (index!11256 (_ BitVec 32))) )
))
(declare-fun lt!148735 () SeekEntryResult!2270)

(declare-fun lt!148734 () Bool)

(declare-datatypes ((array!15111 0))(
  ( (array!15112 (arr!7156 (Array (_ BitVec 32) (_ BitVec 64))) (size!7508 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15111)

(assert (=> b!299076 (= res!157689 (and (or lt!148734 (not (undefined!3082 lt!148735))) (not lt!148734) (= (select (arr!7156 a!3312) (index!11255 lt!148735)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!299076 (= lt!148734 (not ((_ is Intermediate!2270) lt!148735)))))

(declare-fun b!299077 () Bool)

(declare-fun e!188919 () Bool)

(assert (=> b!299077 (= e!188919 e!188916)))

(declare-fun res!157691 () Bool)

(assert (=> b!299077 (=> (not res!157691) (not e!188916))))

(declare-fun lt!148731 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148732 () SeekEntryResult!2270)

(assert (=> b!299077 (= res!157691 (and (not lt!148731) (= lt!148732 (MissingVacant!2270 i!1256))))))

(declare-fun lt!148736 () (_ BitVec 32))

(declare-fun lt!148733 () SeekEntryResult!2270)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15111 (_ BitVec 32)) SeekEntryResult!2270)

(assert (=> b!299077 (= lt!148733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148736 k0!2524 (array!15112 (store (arr!7156 a!3312) i!1256 k0!2524) (size!7508 a!3312)) mask!3809))))

(assert (=> b!299077 (= lt!148735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148736 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299077 (= lt!148736 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!299078 () Bool)

(declare-fun res!157690 () Bool)

(declare-fun e!188918 () Bool)

(assert (=> b!299078 (=> (not res!157690) (not e!188918))))

(assert (=> b!299078 (= res!157690 (and (= (size!7508 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7508 a!3312))))))

(declare-fun b!299079 () Bool)

(declare-fun res!157694 () Bool)

(assert (=> b!299079 (=> (not res!157694) (not e!188918))))

(declare-fun arrayContainsKey!0 (array!15111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299079 (= res!157694 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!299080 () Bool)

(declare-fun res!157695 () Bool)

(assert (=> b!299080 (=> (not res!157695) (not e!188918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299080 (= res!157695 (validKeyInArray!0 k0!2524))))

(declare-fun b!299081 () Bool)

(assert (=> b!299081 (= e!188917 (not true))))

(declare-datatypes ((Unit!9277 0))(
  ( (Unit!9278) )
))
(declare-fun lt!148737 () Unit!9277)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!15111 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9277)

(assert (=> b!299081 (= lt!148737 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148736 (index!11255 lt!148735) (x!29602 lt!148735) mask!3809))))

(assert (=> b!299081 (= (index!11255 lt!148735) i!1256)))

(declare-fun b!299082 () Bool)

(declare-fun res!157692 () Bool)

(assert (=> b!299082 (=> (not res!157692) (not e!188919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15111 (_ BitVec 32)) Bool)

(assert (=> b!299082 (= res!157692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!157693 () Bool)

(assert (=> start!29632 (=> (not res!157693) (not e!188918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29632 (= res!157693 (validMask!0 mask!3809))))

(assert (=> start!29632 e!188918))

(assert (=> start!29632 true))

(declare-fun array_inv!5106 (array!15111) Bool)

(assert (=> start!29632 (array_inv!5106 a!3312)))

(declare-fun b!299075 () Bool)

(assert (=> b!299075 (= e!188918 e!188919)))

(declare-fun res!157688 () Bool)

(assert (=> b!299075 (=> (not res!157688) (not e!188919))))

(assert (=> b!299075 (= res!157688 (or lt!148731 (= lt!148732 (MissingVacant!2270 i!1256))))))

(assert (=> b!299075 (= lt!148731 (= lt!148732 (MissingZero!2270 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15111 (_ BitVec 32)) SeekEntryResult!2270)

(assert (=> b!299075 (= lt!148732 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29632 res!157693) b!299078))

(assert (= (and b!299078 res!157690) b!299080))

(assert (= (and b!299080 res!157695) b!299079))

(assert (= (and b!299079 res!157694) b!299075))

(assert (= (and b!299075 res!157688) b!299082))

(assert (= (and b!299082 res!157692) b!299077))

(assert (= (and b!299077 res!157691) b!299076))

(assert (= (and b!299076 res!157689) b!299081))

(declare-fun m!311589 () Bool)

(assert (=> b!299081 m!311589))

(declare-fun m!311591 () Bool)

(assert (=> b!299080 m!311591))

(declare-fun m!311593 () Bool)

(assert (=> start!29632 m!311593))

(declare-fun m!311595 () Bool)

(assert (=> start!29632 m!311595))

(declare-fun m!311597 () Bool)

(assert (=> b!299077 m!311597))

(declare-fun m!311599 () Bool)

(assert (=> b!299077 m!311599))

(declare-fun m!311601 () Bool)

(assert (=> b!299077 m!311601))

(declare-fun m!311603 () Bool)

(assert (=> b!299077 m!311603))

(declare-fun m!311605 () Bool)

(assert (=> b!299075 m!311605))

(declare-fun m!311607 () Bool)

(assert (=> b!299076 m!311607))

(declare-fun m!311609 () Bool)

(assert (=> b!299082 m!311609))

(declare-fun m!311611 () Bool)

(assert (=> b!299079 m!311611))

(check-sat (not b!299082) (not b!299077) (not b!299075) (not b!299079) (not b!299081) (not start!29632) (not b!299080))
(check-sat)
