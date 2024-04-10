; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28400 () Bool)

(assert start!28400)

(declare-fun b!290761 () Bool)

(declare-fun e!183992 () Bool)

(assert (=> b!290761 (= e!183992 (not true))))

(declare-datatypes ((SeekEntryResult!2109 0))(
  ( (MissingZero!2109 (index!10606 (_ BitVec 32))) (Found!2109 (index!10607 (_ BitVec 32))) (Intermediate!2109 (undefined!2921 Bool) (index!10608 (_ BitVec 32)) (x!28800 (_ BitVec 32))) (Undefined!2109) (MissingVacant!2109 (index!10609 (_ BitVec 32))) )
))
(declare-fun lt!143685 () SeekEntryResult!2109)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290761 (= (index!10608 lt!143685) i!1256)))

(declare-fun b!290762 () Bool)

(declare-fun res!152101 () Bool)

(declare-fun e!183990 () Bool)

(assert (=> b!290762 (=> (not res!152101) (not e!183990))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290762 (= res!152101 (validKeyInArray!0 k0!2524))))

(declare-fun b!290763 () Bool)

(declare-fun res!152099 () Bool)

(assert (=> b!290763 (=> (not res!152099) (not e!183990))))

(declare-datatypes ((array!14669 0))(
  ( (array!14670 (arr!6960 (Array (_ BitVec 32) (_ BitVec 64))) (size!7312 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14669)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290763 (= res!152099 (and (= (size!7312 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7312 a!3312))))))

(declare-fun b!290764 () Bool)

(declare-fun e!183989 () Bool)

(assert (=> b!290764 (= e!183990 e!183989)))

(declare-fun res!152100 () Bool)

(assert (=> b!290764 (=> (not res!152100) (not e!183989))))

(declare-fun lt!143689 () Bool)

(declare-fun lt!143686 () SeekEntryResult!2109)

(assert (=> b!290764 (= res!152100 (or lt!143689 (= lt!143686 (MissingVacant!2109 i!1256))))))

(assert (=> b!290764 (= lt!143689 (= lt!143686 (MissingZero!2109 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14669 (_ BitVec 32)) SeekEntryResult!2109)

(assert (=> b!290764 (= lt!143686 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290765 () Bool)

(declare-fun e!183991 () Bool)

(assert (=> b!290765 (= e!183991 e!183992)))

(declare-fun res!152106 () Bool)

(assert (=> b!290765 (=> (not res!152106) (not e!183992))))

(declare-fun lt!143684 () Bool)

(assert (=> b!290765 (= res!152106 (and (or lt!143684 (not (undefined!2921 lt!143685))) (not lt!143684) (= (select (arr!6960 a!3312) (index!10608 lt!143685)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290765 (= lt!143684 (not ((_ is Intermediate!2109) lt!143685)))))

(declare-fun b!290766 () Bool)

(declare-fun res!152102 () Bool)

(assert (=> b!290766 (=> (not res!152102) (not e!183989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14669 (_ BitVec 32)) Bool)

(assert (=> b!290766 (= res!152102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152103 () Bool)

(assert (=> start!28400 (=> (not res!152103) (not e!183990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28400 (= res!152103 (validMask!0 mask!3809))))

(assert (=> start!28400 e!183990))

(assert (=> start!28400 true))

(declare-fun array_inv!4923 (array!14669) Bool)

(assert (=> start!28400 (array_inv!4923 a!3312)))

(declare-fun b!290767 () Bool)

(assert (=> b!290767 (= e!183989 e!183991)))

(declare-fun res!152104 () Bool)

(assert (=> b!290767 (=> (not res!152104) (not e!183991))))

(assert (=> b!290767 (= res!152104 (and (not lt!143689) (= lt!143686 (MissingVacant!2109 i!1256))))))

(declare-fun lt!143687 () SeekEntryResult!2109)

(declare-fun lt!143688 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14669 (_ BitVec 32)) SeekEntryResult!2109)

(assert (=> b!290767 (= lt!143687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143688 k0!2524 (array!14670 (store (arr!6960 a!3312) i!1256 k0!2524) (size!7312 a!3312)) mask!3809))))

(assert (=> b!290767 (= lt!143685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143688 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290767 (= lt!143688 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290768 () Bool)

(declare-fun res!152105 () Bool)

(assert (=> b!290768 (=> (not res!152105) (not e!183990))))

(declare-fun arrayContainsKey!0 (array!14669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290768 (= res!152105 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28400 res!152103) b!290763))

(assert (= (and b!290763 res!152099) b!290762))

(assert (= (and b!290762 res!152101) b!290768))

(assert (= (and b!290768 res!152105) b!290764))

(assert (= (and b!290764 res!152100) b!290766))

(assert (= (and b!290766 res!152102) b!290767))

(assert (= (and b!290767 res!152104) b!290765))

(assert (= (and b!290765 res!152106) b!290761))

(declare-fun m!304753 () Bool)

(assert (=> b!290764 m!304753))

(declare-fun m!304755 () Bool)

(assert (=> b!290768 m!304755))

(declare-fun m!304757 () Bool)

(assert (=> b!290765 m!304757))

(declare-fun m!304759 () Bool)

(assert (=> start!28400 m!304759))

(declare-fun m!304761 () Bool)

(assert (=> start!28400 m!304761))

(declare-fun m!304763 () Bool)

(assert (=> b!290762 m!304763))

(declare-fun m!304765 () Bool)

(assert (=> b!290766 m!304765))

(declare-fun m!304767 () Bool)

(assert (=> b!290767 m!304767))

(declare-fun m!304769 () Bool)

(assert (=> b!290767 m!304769))

(declare-fun m!304771 () Bool)

(assert (=> b!290767 m!304771))

(declare-fun m!304773 () Bool)

(assert (=> b!290767 m!304773))

(check-sat (not b!290767) (not b!290764) (not b!290768) (not b!290766) (not start!28400) (not b!290762))
(check-sat)
