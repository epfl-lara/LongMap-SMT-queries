; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28648 () Bool)

(assert start!28648)

(declare-fun b!292976 () Bool)

(declare-fun res!154008 () Bool)

(declare-fun e!185293 () Bool)

(assert (=> b!292976 (=> (not res!154008) (not e!185293))))

(declare-datatypes ((array!14832 0))(
  ( (array!14833 (arr!7039 (Array (_ BitVec 32) (_ BitVec 64))) (size!7391 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14832)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14832 (_ BitVec 32)) Bool)

(assert (=> b!292976 (= res!154008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!154011 () Bool)

(declare-fun e!185292 () Bool)

(assert (=> start!28648 (=> (not res!154011) (not e!185292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28648 (= res!154011 (validMask!0 mask!3809))))

(assert (=> start!28648 e!185292))

(assert (=> start!28648 true))

(declare-fun array_inv!4989 (array!14832) Bool)

(assert (=> start!28648 (array_inv!4989 a!3312)))

(declare-fun b!292977 () Bool)

(assert (=> b!292977 (= e!185292 e!185293)))

(declare-fun res!154007 () Bool)

(assert (=> b!292977 (=> (not res!154007) (not e!185293))))

(declare-datatypes ((SeekEntryResult!2153 0))(
  ( (MissingZero!2153 (index!10782 (_ BitVec 32))) (Found!2153 (index!10783 (_ BitVec 32))) (Intermediate!2153 (undefined!2965 Bool) (index!10784 (_ BitVec 32)) (x!29072 (_ BitVec 32))) (Undefined!2153) (MissingVacant!2153 (index!10785 (_ BitVec 32))) )
))
(declare-fun lt!145228 () SeekEntryResult!2153)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292977 (= res!154007 (or (= lt!145228 (MissingZero!2153 i!1256)) (= lt!145228 (MissingVacant!2153 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14832 (_ BitVec 32)) SeekEntryResult!2153)

(assert (=> b!292977 (= lt!145228 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292978 () Bool)

(declare-fun res!154006 () Bool)

(assert (=> b!292978 (=> (not res!154006) (not e!185292))))

(assert (=> b!292978 (= res!154006 (and (= (size!7391 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7391 a!3312))))))

(declare-fun b!292979 () Bool)

(declare-fun res!154009 () Bool)

(assert (=> b!292979 (=> (not res!154009) (not e!185292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292979 (= res!154009 (validKeyInArray!0 k0!2524))))

(declare-fun b!292980 () Bool)

(declare-fun res!154010 () Bool)

(assert (=> b!292980 (=> (not res!154010) (not e!185292))))

(declare-fun arrayContainsKey!0 (array!14832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292980 (= res!154010 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292981 () Bool)

(assert (=> b!292981 (= e!185293 false)))

(declare-fun lt!145230 () (_ BitVec 32))

(declare-fun lt!145227 () SeekEntryResult!2153)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14832 (_ BitVec 32)) SeekEntryResult!2153)

(assert (=> b!292981 (= lt!145227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145230 k0!2524 (array!14833 (store (arr!7039 a!3312) i!1256 k0!2524) (size!7391 a!3312)) mask!3809))))

(declare-fun lt!145229 () SeekEntryResult!2153)

(assert (=> b!292981 (= lt!145229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145230 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292981 (= lt!145230 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28648 res!154011) b!292978))

(assert (= (and b!292978 res!154006) b!292979))

(assert (= (and b!292979 res!154009) b!292980))

(assert (= (and b!292980 res!154010) b!292977))

(assert (= (and b!292977 res!154007) b!292976))

(assert (= (and b!292976 res!154008) b!292981))

(declare-fun m!306923 () Bool)

(assert (=> start!28648 m!306923))

(declare-fun m!306925 () Bool)

(assert (=> start!28648 m!306925))

(declare-fun m!306927 () Bool)

(assert (=> b!292980 m!306927))

(declare-fun m!306929 () Bool)

(assert (=> b!292976 m!306929))

(declare-fun m!306931 () Bool)

(assert (=> b!292977 m!306931))

(declare-fun m!306933 () Bool)

(assert (=> b!292981 m!306933))

(declare-fun m!306935 () Bool)

(assert (=> b!292981 m!306935))

(declare-fun m!306937 () Bool)

(assert (=> b!292981 m!306937))

(declare-fun m!306939 () Bool)

(assert (=> b!292981 m!306939))

(declare-fun m!306941 () Bool)

(assert (=> b!292979 m!306941))

(check-sat (not start!28648) (not b!292977) (not b!292979) (not b!292981) (not b!292976) (not b!292980))
(check-sat)
