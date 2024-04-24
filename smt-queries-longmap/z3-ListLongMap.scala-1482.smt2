; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28270 () Bool)

(assert start!28270)

(declare-fun b!289844 () Bool)

(declare-fun res!151298 () Bool)

(declare-fun e!183466 () Bool)

(assert (=> b!289844 (=> (not res!151298) (not e!183466))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289844 (= res!151298 (validKeyInArray!0 k0!2524))))

(declare-fun b!289845 () Bool)

(declare-fun e!183465 () Bool)

(assert (=> b!289845 (= e!183465 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2036 0))(
  ( (MissingZero!2036 (index!10314 (_ BitVec 32))) (Found!2036 (index!10315 (_ BitVec 32))) (Intermediate!2036 (undefined!2848 Bool) (index!10316 (_ BitVec 32)) (x!28625 (_ BitVec 32))) (Undefined!2036) (MissingVacant!2036 (index!10317 (_ BitVec 32))) )
))
(declare-fun lt!143113 () SeekEntryResult!2036)

(declare-datatypes ((array!14589 0))(
  ( (array!14590 (arr!6922 (Array (_ BitVec 32) (_ BitVec 64))) (size!7274 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14589)

(declare-fun lt!143112 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14589 (_ BitVec 32)) SeekEntryResult!2036)

(assert (=> b!289845 (= lt!143113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143112 k0!2524 (array!14590 (store (arr!6922 a!3312) i!1256 k0!2524) (size!7274 a!3312)) mask!3809))))

(declare-fun lt!143115 () SeekEntryResult!2036)

(assert (=> b!289845 (= lt!143115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143112 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289845 (= lt!143112 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289846 () Bool)

(declare-fun res!151297 () Bool)

(assert (=> b!289846 (=> (not res!151297) (not e!183466))))

(declare-fun arrayContainsKey!0 (array!14589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289846 (= res!151297 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289847 () Bool)

(assert (=> b!289847 (= e!183466 e!183465)))

(declare-fun res!151302 () Bool)

(assert (=> b!289847 (=> (not res!151302) (not e!183465))))

(declare-fun lt!143114 () SeekEntryResult!2036)

(assert (=> b!289847 (= res!151302 (or (= lt!143114 (MissingZero!2036 i!1256)) (= lt!143114 (MissingVacant!2036 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14589 (_ BitVec 32)) SeekEntryResult!2036)

(assert (=> b!289847 (= lt!143114 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289848 () Bool)

(declare-fun res!151301 () Bool)

(assert (=> b!289848 (=> (not res!151301) (not e!183465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14589 (_ BitVec 32)) Bool)

(assert (=> b!289848 (= res!151301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!151299 () Bool)

(assert (=> start!28270 (=> (not res!151299) (not e!183466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28270 (= res!151299 (validMask!0 mask!3809))))

(assert (=> start!28270 e!183466))

(assert (=> start!28270 true))

(declare-fun array_inv!4872 (array!14589) Bool)

(assert (=> start!28270 (array_inv!4872 a!3312)))

(declare-fun b!289849 () Bool)

(declare-fun res!151300 () Bool)

(assert (=> b!289849 (=> (not res!151300) (not e!183466))))

(assert (=> b!289849 (= res!151300 (and (= (size!7274 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7274 a!3312))))))

(assert (= (and start!28270 res!151299) b!289849))

(assert (= (and b!289849 res!151300) b!289844))

(assert (= (and b!289844 res!151298) b!289846))

(assert (= (and b!289846 res!151297) b!289847))

(assert (= (and b!289847 res!151302) b!289848))

(assert (= (and b!289848 res!151301) b!289845))

(declare-fun m!304073 () Bool)

(assert (=> start!28270 m!304073))

(declare-fun m!304075 () Bool)

(assert (=> start!28270 m!304075))

(declare-fun m!304077 () Bool)

(assert (=> b!289846 m!304077))

(declare-fun m!304079 () Bool)

(assert (=> b!289847 m!304079))

(declare-fun m!304081 () Bool)

(assert (=> b!289845 m!304081))

(declare-fun m!304083 () Bool)

(assert (=> b!289845 m!304083))

(declare-fun m!304085 () Bool)

(assert (=> b!289845 m!304085))

(declare-fun m!304087 () Bool)

(assert (=> b!289845 m!304087))

(declare-fun m!304089 () Bool)

(assert (=> b!289844 m!304089))

(declare-fun m!304091 () Bool)

(assert (=> b!289848 m!304091))

(check-sat (not b!289848) (not start!28270) (not b!289844) (not b!289847) (not b!289845) (not b!289846))
(check-sat)
