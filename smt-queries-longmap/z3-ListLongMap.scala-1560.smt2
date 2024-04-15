; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29632 () Bool)

(assert start!29632)

(declare-fun res!157568 () Bool)

(declare-fun e!188776 () Bool)

(assert (=> start!29632 (=> (not res!157568) (not e!188776))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29632 (= res!157568 (validMask!0 mask!3809))))

(assert (=> start!29632 e!188776))

(assert (=> start!29632 true))

(declare-datatypes ((array!15103 0))(
  ( (array!15104 (arr!7152 (Array (_ BitVec 32) (_ BitVec 64))) (size!7505 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15103)

(declare-fun array_inv!5124 (array!15103) Bool)

(assert (=> start!29632 (array_inv!5124 a!3312)))

(declare-fun b!298853 () Bool)

(declare-fun res!157566 () Bool)

(assert (=> b!298853 (=> (not res!157566) (not e!188776))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298853 (= res!157566 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298854 () Bool)

(declare-fun res!157564 () Bool)

(assert (=> b!298854 (=> (not res!157564) (not e!188776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298854 (= res!157564 (validKeyInArray!0 k0!2524))))

(declare-fun b!298855 () Bool)

(declare-fun e!188777 () Bool)

(declare-fun e!188775 () Bool)

(assert (=> b!298855 (= e!188777 e!188775)))

(declare-fun res!157563 () Bool)

(assert (=> b!298855 (=> (not res!157563) (not e!188775))))

(declare-fun lt!148481 () Bool)

(declare-datatypes ((SeekEntryResult!2300 0))(
  ( (MissingZero!2300 (index!11373 (_ BitVec 32))) (Found!2300 (index!11374 (_ BitVec 32))) (Intermediate!2300 (undefined!3112 Bool) (index!11375 (_ BitVec 32)) (x!29630 (_ BitVec 32))) (Undefined!2300) (MissingVacant!2300 (index!11376 (_ BitVec 32))) )
))
(declare-fun lt!148484 () SeekEntryResult!2300)

(assert (=> b!298855 (= res!157563 (and (or lt!148481 (not (undefined!3112 lt!148484))) (not lt!148481) (= (select (arr!7152 a!3312) (index!11375 lt!148484)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!298855 (= lt!148481 (not ((_ is Intermediate!2300) lt!148484)))))

(declare-fun b!298856 () Bool)

(declare-fun res!157567 () Bool)

(declare-fun e!188773 () Bool)

(assert (=> b!298856 (=> (not res!157567) (not e!188773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15103 (_ BitVec 32)) Bool)

(assert (=> b!298856 (= res!157567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298857 () Bool)

(assert (=> b!298857 (= e!188775 (not true))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148479 () (_ BitVec 32))

(declare-datatypes ((Unit!9275 0))(
  ( (Unit!9276) )
))
(declare-fun lt!148482 () Unit!9275)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!15103 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9275)

(assert (=> b!298857 (= lt!148482 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148479 (index!11375 lt!148484) (x!29630 lt!148484) mask!3809))))

(assert (=> b!298857 (= (index!11375 lt!148484) i!1256)))

(declare-fun b!298858 () Bool)

(assert (=> b!298858 (= e!188773 e!188777)))

(declare-fun res!157569 () Bool)

(assert (=> b!298858 (=> (not res!157569) (not e!188777))))

(declare-fun lt!148480 () SeekEntryResult!2300)

(declare-fun lt!148483 () Bool)

(assert (=> b!298858 (= res!157569 (and (not lt!148483) (= lt!148480 (MissingVacant!2300 i!1256))))))

(declare-fun lt!148478 () SeekEntryResult!2300)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15103 (_ BitVec 32)) SeekEntryResult!2300)

(assert (=> b!298858 (= lt!148478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148479 k0!2524 (array!15104 (store (arr!7152 a!3312) i!1256 k0!2524) (size!7505 a!3312)) mask!3809))))

(assert (=> b!298858 (= lt!148484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148479 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298858 (= lt!148479 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298859 () Bool)

(assert (=> b!298859 (= e!188776 e!188773)))

(declare-fun res!157565 () Bool)

(assert (=> b!298859 (=> (not res!157565) (not e!188773))))

(assert (=> b!298859 (= res!157565 (or lt!148483 (= lt!148480 (MissingVacant!2300 i!1256))))))

(assert (=> b!298859 (= lt!148483 (= lt!148480 (MissingZero!2300 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15103 (_ BitVec 32)) SeekEntryResult!2300)

(assert (=> b!298859 (= lt!148480 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!298860 () Bool)

(declare-fun res!157562 () Bool)

(assert (=> b!298860 (=> (not res!157562) (not e!188776))))

(assert (=> b!298860 (= res!157562 (and (= (size!7505 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7505 a!3312))))))

(assert (= (and start!29632 res!157568) b!298860))

(assert (= (and b!298860 res!157562) b!298854))

(assert (= (and b!298854 res!157564) b!298853))

(assert (= (and b!298853 res!157566) b!298859))

(assert (= (and b!298859 res!157565) b!298856))

(assert (= (and b!298856 res!157567) b!298858))

(assert (= (and b!298858 res!157569) b!298855))

(assert (= (and b!298855 res!157563) b!298857))

(declare-fun m!310747 () Bool)

(assert (=> start!29632 m!310747))

(declare-fun m!310749 () Bool)

(assert (=> start!29632 m!310749))

(declare-fun m!310751 () Bool)

(assert (=> b!298853 m!310751))

(declare-fun m!310753 () Bool)

(assert (=> b!298855 m!310753))

(declare-fun m!310755 () Bool)

(assert (=> b!298854 m!310755))

(declare-fun m!310757 () Bool)

(assert (=> b!298857 m!310757))

(declare-fun m!310759 () Bool)

(assert (=> b!298856 m!310759))

(declare-fun m!310761 () Bool)

(assert (=> b!298859 m!310761))

(declare-fun m!310763 () Bool)

(assert (=> b!298858 m!310763))

(declare-fun m!310765 () Bool)

(assert (=> b!298858 m!310765))

(declare-fun m!310767 () Bool)

(assert (=> b!298858 m!310767))

(declare-fun m!310769 () Bool)

(assert (=> b!298858 m!310769))

(check-sat (not b!298858) (not b!298854) (not b!298859) (not b!298856) (not b!298857) (not start!29632) (not b!298853))
(check-sat)
