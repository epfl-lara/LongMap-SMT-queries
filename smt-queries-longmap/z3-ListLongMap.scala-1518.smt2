; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28630 () Bool)

(assert start!28630)

(declare-fun b!292814 () Bool)

(declare-fun res!153846 () Bool)

(declare-fun e!185212 () Bool)

(assert (=> b!292814 (=> (not res!153846) (not e!185212))))

(declare-datatypes ((array!14814 0))(
  ( (array!14815 (arr!7030 (Array (_ BitVec 32) (_ BitVec 64))) (size!7382 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14814)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292814 (= res!153846 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292815 () Bool)

(declare-fun e!185213 () Bool)

(assert (=> b!292815 (= e!185212 e!185213)))

(declare-fun res!153845 () Bool)

(assert (=> b!292815 (=> (not res!153845) (not e!185213))))

(declare-datatypes ((SeekEntryResult!2144 0))(
  ( (MissingZero!2144 (index!10746 (_ BitVec 32))) (Found!2144 (index!10747 (_ BitVec 32))) (Intermediate!2144 (undefined!2956 Bool) (index!10748 (_ BitVec 32)) (x!29039 (_ BitVec 32))) (Undefined!2144) (MissingVacant!2144 (index!10749 (_ BitVec 32))) )
))
(declare-fun lt!145119 () SeekEntryResult!2144)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292815 (= res!153845 (or (= lt!145119 (MissingZero!2144 i!1256)) (= lt!145119 (MissingVacant!2144 i!1256))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14814 (_ BitVec 32)) SeekEntryResult!2144)

(assert (=> b!292815 (= lt!145119 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!153848 () Bool)

(assert (=> start!28630 (=> (not res!153848) (not e!185212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28630 (= res!153848 (validMask!0 mask!3809))))

(assert (=> start!28630 e!185212))

(assert (=> start!28630 true))

(declare-fun array_inv!4980 (array!14814) Bool)

(assert (=> start!28630 (array_inv!4980 a!3312)))

(declare-fun b!292816 () Bool)

(declare-fun res!153849 () Bool)

(assert (=> b!292816 (=> (not res!153849) (not e!185212))))

(assert (=> b!292816 (= res!153849 (and (= (size!7382 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7382 a!3312))))))

(declare-fun b!292817 () Bool)

(declare-fun res!153844 () Bool)

(assert (=> b!292817 (=> (not res!153844) (not e!185213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14814 (_ BitVec 32)) Bool)

(assert (=> b!292817 (= res!153844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292818 () Bool)

(assert (=> b!292818 (= e!185213 false)))

(declare-fun lt!145121 () (_ BitVec 32))

(declare-fun lt!145122 () SeekEntryResult!2144)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14814 (_ BitVec 32)) SeekEntryResult!2144)

(assert (=> b!292818 (= lt!145122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145121 k0!2524 (array!14815 (store (arr!7030 a!3312) i!1256 k0!2524) (size!7382 a!3312)) mask!3809))))

(declare-fun lt!145120 () SeekEntryResult!2144)

(assert (=> b!292818 (= lt!145120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145121 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292818 (= lt!145121 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292819 () Bool)

(declare-fun res!153847 () Bool)

(assert (=> b!292819 (=> (not res!153847) (not e!185212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292819 (= res!153847 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28630 res!153848) b!292816))

(assert (= (and b!292816 res!153849) b!292819))

(assert (= (and b!292819 res!153847) b!292814))

(assert (= (and b!292814 res!153846) b!292815))

(assert (= (and b!292815 res!153845) b!292817))

(assert (= (and b!292817 res!153844) b!292818))

(declare-fun m!306743 () Bool)

(assert (=> b!292819 m!306743))

(declare-fun m!306745 () Bool)

(assert (=> b!292815 m!306745))

(declare-fun m!306747 () Bool)

(assert (=> b!292818 m!306747))

(declare-fun m!306749 () Bool)

(assert (=> b!292818 m!306749))

(declare-fun m!306751 () Bool)

(assert (=> b!292818 m!306751))

(declare-fun m!306753 () Bool)

(assert (=> b!292818 m!306753))

(declare-fun m!306755 () Bool)

(assert (=> start!28630 m!306755))

(declare-fun m!306757 () Bool)

(assert (=> start!28630 m!306757))

(declare-fun m!306759 () Bool)

(assert (=> b!292814 m!306759))

(declare-fun m!306761 () Bool)

(assert (=> b!292817 m!306761))

(check-sat (not b!292815) (not start!28630) (not b!292814) (not b!292819) (not b!292817) (not b!292818))
(check-sat)
