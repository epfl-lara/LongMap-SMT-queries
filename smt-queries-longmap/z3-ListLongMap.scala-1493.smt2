; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28384 () Bool)

(assert start!28384)

(declare-fun b!290712 () Bool)

(declare-fun res!152024 () Bool)

(declare-fun e!183953 () Bool)

(assert (=> b!290712 (=> (not res!152024) (not e!183953))))

(declare-datatypes ((array!14658 0))(
  ( (array!14659 (arr!6955 (Array (_ BitVec 32) (_ BitVec 64))) (size!7307 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14658)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14658 (_ BitVec 32)) Bool)

(assert (=> b!290712 (= res!152024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152028 () Bool)

(declare-fun e!183952 () Bool)

(assert (=> start!28384 (=> (not res!152028) (not e!183952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28384 (= res!152028 (validMask!0 mask!3809))))

(assert (=> start!28384 e!183952))

(assert (=> start!28384 true))

(declare-fun array_inv!4905 (array!14658) Bool)

(assert (=> start!28384 (array_inv!4905 a!3312)))

(declare-fun b!290713 () Bool)

(declare-fun e!183954 () Bool)

(declare-fun e!183955 () Bool)

(assert (=> b!290713 (= e!183954 e!183955)))

(declare-fun res!152029 () Bool)

(assert (=> b!290713 (=> (not res!152029) (not e!183955))))

(declare-datatypes ((SeekEntryResult!2069 0))(
  ( (MissingZero!2069 (index!10446 (_ BitVec 32))) (Found!2069 (index!10447 (_ BitVec 32))) (Intermediate!2069 (undefined!2881 Bool) (index!10448 (_ BitVec 32)) (x!28752 (_ BitVec 32))) (Undefined!2069) (MissingVacant!2069 (index!10449 (_ BitVec 32))) )
))
(declare-fun lt!143674 () SeekEntryResult!2069)

(declare-fun lt!143673 () Bool)

(assert (=> b!290713 (= res!152029 (and (or lt!143673 (not (undefined!2881 lt!143674))) (not lt!143673) (= (select (arr!6955 a!3312) (index!10448 lt!143674)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290713 (= lt!143673 (not ((_ is Intermediate!2069) lt!143674)))))

(declare-fun b!290714 () Bool)

(assert (=> b!290714 (= e!183953 e!183954)))

(declare-fun res!152031 () Bool)

(assert (=> b!290714 (=> (not res!152031) (not e!183954))))

(declare-fun lt!143675 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143676 () SeekEntryResult!2069)

(assert (=> b!290714 (= res!152031 (and (not lt!143675) (= lt!143676 (MissingVacant!2069 i!1256))))))

(declare-fun lt!143671 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!143672 () SeekEntryResult!2069)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14658 (_ BitVec 32)) SeekEntryResult!2069)

(assert (=> b!290714 (= lt!143672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143671 k0!2524 (array!14659 (store (arr!6955 a!3312) i!1256 k0!2524) (size!7307 a!3312)) mask!3809))))

(assert (=> b!290714 (= lt!143674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143671 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290714 (= lt!143671 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290715 () Bool)

(assert (=> b!290715 (= e!183955 (not true))))

(assert (=> b!290715 (= (index!10448 lt!143674) i!1256)))

(declare-fun b!290716 () Bool)

(assert (=> b!290716 (= e!183952 e!183953)))

(declare-fun res!152025 () Bool)

(assert (=> b!290716 (=> (not res!152025) (not e!183953))))

(assert (=> b!290716 (= res!152025 (or lt!143675 (= lt!143676 (MissingVacant!2069 i!1256))))))

(assert (=> b!290716 (= lt!143675 (= lt!143676 (MissingZero!2069 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14658 (_ BitVec 32)) SeekEntryResult!2069)

(assert (=> b!290716 (= lt!143676 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290717 () Bool)

(declare-fun res!152030 () Bool)

(assert (=> b!290717 (=> (not res!152030) (not e!183952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290717 (= res!152030 (validKeyInArray!0 k0!2524))))

(declare-fun b!290718 () Bool)

(declare-fun res!152027 () Bool)

(assert (=> b!290718 (=> (not res!152027) (not e!183952))))

(declare-fun arrayContainsKey!0 (array!14658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290718 (= res!152027 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290719 () Bool)

(declare-fun res!152026 () Bool)

(assert (=> b!290719 (=> (not res!152026) (not e!183952))))

(assert (=> b!290719 (= res!152026 (and (= (size!7307 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7307 a!3312))))))

(assert (= (and start!28384 res!152028) b!290719))

(assert (= (and b!290719 res!152026) b!290717))

(assert (= (and b!290717 res!152030) b!290718))

(assert (= (and b!290718 res!152027) b!290716))

(assert (= (and b!290716 res!152025) b!290712))

(assert (= (and b!290712 res!152024) b!290714))

(assert (= (and b!290714 res!152031) b!290713))

(assert (= (and b!290713 res!152029) b!290715))

(declare-fun m!304871 () Bool)

(assert (=> start!28384 m!304871))

(declare-fun m!304873 () Bool)

(assert (=> start!28384 m!304873))

(declare-fun m!304875 () Bool)

(assert (=> b!290714 m!304875))

(declare-fun m!304877 () Bool)

(assert (=> b!290714 m!304877))

(declare-fun m!304879 () Bool)

(assert (=> b!290714 m!304879))

(declare-fun m!304881 () Bool)

(assert (=> b!290714 m!304881))

(declare-fun m!304883 () Bool)

(assert (=> b!290717 m!304883))

(declare-fun m!304885 () Bool)

(assert (=> b!290718 m!304885))

(declare-fun m!304887 () Bool)

(assert (=> b!290712 m!304887))

(declare-fun m!304889 () Bool)

(assert (=> b!290716 m!304889))

(declare-fun m!304891 () Bool)

(assert (=> b!290713 m!304891))

(check-sat (not b!290712) (not b!290718) (not start!28384) (not b!290716) (not b!290714) (not b!290717))
(check-sat)
