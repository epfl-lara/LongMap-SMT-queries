; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28412 () Bool)

(assert start!28412)

(declare-fun b!290905 () Bool)

(declare-fun e!184082 () Bool)

(declare-fun e!184081 () Bool)

(assert (=> b!290905 (= e!184082 e!184081)))

(declare-fun res!152243 () Bool)

(assert (=> b!290905 (=> (not res!152243) (not e!184081))))

(declare-datatypes ((SeekEntryResult!2115 0))(
  ( (MissingZero!2115 (index!10630 (_ BitVec 32))) (Found!2115 (index!10631 (_ BitVec 32))) (Intermediate!2115 (undefined!2927 Bool) (index!10632 (_ BitVec 32)) (x!28822 (_ BitVec 32))) (Undefined!2115) (MissingVacant!2115 (index!10633 (_ BitVec 32))) )
))
(declare-fun lt!143792 () SeekEntryResult!2115)

(declare-fun lt!143793 () Bool)

(declare-datatypes ((array!14681 0))(
  ( (array!14682 (arr!6966 (Array (_ BitVec 32) (_ BitVec 64))) (size!7318 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14681)

(assert (=> b!290905 (= res!152243 (and (or lt!143793 (not (undefined!2927 lt!143792))) (not lt!143793) (= (select (arr!6966 a!3312) (index!10632 lt!143792)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290905 (= lt!143793 (not ((_ is Intermediate!2115) lt!143792)))))

(declare-fun res!152247 () Bool)

(declare-fun e!184080 () Bool)

(assert (=> start!28412 (=> (not res!152247) (not e!184080))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28412 (= res!152247 (validMask!0 mask!3809))))

(assert (=> start!28412 e!184080))

(assert (=> start!28412 true))

(declare-fun array_inv!4929 (array!14681) Bool)

(assert (=> start!28412 (array_inv!4929 a!3312)))

(declare-fun b!290906 () Bool)

(declare-fun res!152250 () Bool)

(declare-fun e!184078 () Bool)

(assert (=> b!290906 (=> (not res!152250) (not e!184078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14681 (_ BitVec 32)) Bool)

(assert (=> b!290906 (= res!152250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290907 () Bool)

(assert (=> b!290907 (= e!184081 (not true))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290907 (= (index!10632 lt!143792) i!1256)))

(declare-fun b!290908 () Bool)

(assert (=> b!290908 (= e!184080 e!184078)))

(declare-fun res!152248 () Bool)

(assert (=> b!290908 (=> (not res!152248) (not e!184078))))

(declare-fun lt!143795 () Bool)

(declare-fun lt!143797 () SeekEntryResult!2115)

(assert (=> b!290908 (= res!152248 (or lt!143795 (= lt!143797 (MissingVacant!2115 i!1256))))))

(assert (=> b!290908 (= lt!143795 (= lt!143797 (MissingZero!2115 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14681 (_ BitVec 32)) SeekEntryResult!2115)

(assert (=> b!290908 (= lt!143797 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290909 () Bool)

(assert (=> b!290909 (= e!184078 e!184082)))

(declare-fun res!152245 () Bool)

(assert (=> b!290909 (=> (not res!152245) (not e!184082))))

(assert (=> b!290909 (= res!152245 (and (not lt!143795) (= lt!143797 (MissingVacant!2115 i!1256))))))

(declare-fun lt!143796 () (_ BitVec 32))

(declare-fun lt!143794 () SeekEntryResult!2115)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14681 (_ BitVec 32)) SeekEntryResult!2115)

(assert (=> b!290909 (= lt!143794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143796 k0!2524 (array!14682 (store (arr!6966 a!3312) i!1256 k0!2524) (size!7318 a!3312)) mask!3809))))

(assert (=> b!290909 (= lt!143792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143796 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290909 (= lt!143796 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290910 () Bool)

(declare-fun res!152246 () Bool)

(assert (=> b!290910 (=> (not res!152246) (not e!184080))))

(assert (=> b!290910 (= res!152246 (and (= (size!7318 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7318 a!3312))))))

(declare-fun b!290911 () Bool)

(declare-fun res!152244 () Bool)

(assert (=> b!290911 (=> (not res!152244) (not e!184080))))

(declare-fun arrayContainsKey!0 (array!14681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290911 (= res!152244 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290912 () Bool)

(declare-fun res!152249 () Bool)

(assert (=> b!290912 (=> (not res!152249) (not e!184080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290912 (= res!152249 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28412 res!152247) b!290910))

(assert (= (and b!290910 res!152246) b!290912))

(assert (= (and b!290912 res!152249) b!290911))

(assert (= (and b!290911 res!152244) b!290908))

(assert (= (and b!290908 res!152248) b!290906))

(assert (= (and b!290906 res!152250) b!290909))

(assert (= (and b!290909 res!152245) b!290905))

(assert (= (and b!290905 res!152243) b!290907))

(declare-fun m!304885 () Bool)

(assert (=> b!290908 m!304885))

(declare-fun m!304887 () Bool)

(assert (=> b!290912 m!304887))

(declare-fun m!304889 () Bool)

(assert (=> b!290909 m!304889))

(declare-fun m!304891 () Bool)

(assert (=> b!290909 m!304891))

(declare-fun m!304893 () Bool)

(assert (=> b!290909 m!304893))

(declare-fun m!304895 () Bool)

(assert (=> b!290909 m!304895))

(declare-fun m!304897 () Bool)

(assert (=> b!290906 m!304897))

(declare-fun m!304899 () Bool)

(assert (=> b!290905 m!304899))

(declare-fun m!304901 () Bool)

(assert (=> start!28412 m!304901))

(declare-fun m!304903 () Bool)

(assert (=> start!28412 m!304903))

(declare-fun m!304905 () Bool)

(assert (=> b!290911 m!304905))

(check-sat (not start!28412) (not b!290908) (not b!290909) (not b!290911) (not b!290906) (not b!290912))
(check-sat)
