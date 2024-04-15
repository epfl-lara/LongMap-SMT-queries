; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28664 () Bool)

(assert start!28664)

(declare-fun b!292890 () Bool)

(declare-fun res!154002 () Bool)

(declare-fun e!185221 () Bool)

(assert (=> b!292890 (=> (not res!154002) (not e!185221))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14836 0))(
  ( (array!14837 (arr!7041 (Array (_ BitVec 32) (_ BitVec 64))) (size!7394 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14836)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292890 (= res!154002 (and (= (size!7394 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7394 a!3312))))))

(declare-fun b!292891 () Bool)

(declare-fun res!154001 () Bool)

(declare-fun e!185222 () Bool)

(assert (=> b!292891 (=> (not res!154001) (not e!185222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14836 (_ BitVec 32)) Bool)

(assert (=> b!292891 (= res!154001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292892 () Bool)

(declare-fun res!153998 () Bool)

(assert (=> b!292892 (=> (not res!153998) (not e!185221))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292892 (= res!153998 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!153999 () Bool)

(assert (=> start!28664 (=> (not res!153999) (not e!185221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28664 (= res!153999 (validMask!0 mask!3809))))

(assert (=> start!28664 e!185221))

(assert (=> start!28664 true))

(declare-fun array_inv!5013 (array!14836) Bool)

(assert (=> start!28664 (array_inv!5013 a!3312)))

(declare-fun b!292893 () Bool)

(assert (=> b!292893 (= e!185221 e!185222)))

(declare-fun res!154000 () Bool)

(assert (=> b!292893 (=> (not res!154000) (not e!185222))))

(declare-datatypes ((SeekEntryResult!2189 0))(
  ( (MissingZero!2189 (index!10926 (_ BitVec 32))) (Found!2189 (index!10927 (_ BitVec 32))) (Intermediate!2189 (undefined!3001 Bool) (index!10928 (_ BitVec 32)) (x!29123 (_ BitVec 32))) (Undefined!2189) (MissingVacant!2189 (index!10929 (_ BitVec 32))) )
))
(declare-fun lt!145061 () SeekEntryResult!2189)

(assert (=> b!292893 (= res!154000 (or (= lt!145061 (MissingZero!2189 i!1256)) (= lt!145061 (MissingVacant!2189 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14836 (_ BitVec 32)) SeekEntryResult!2189)

(assert (=> b!292893 (= lt!145061 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292894 () Bool)

(assert (=> b!292894 (= e!185222 false)))

(declare-fun lt!145062 () (_ BitVec 32))

(declare-fun lt!145059 () SeekEntryResult!2189)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14836 (_ BitVec 32)) SeekEntryResult!2189)

(assert (=> b!292894 (= lt!145059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145062 k0!2524 (array!14837 (store (arr!7041 a!3312) i!1256 k0!2524) (size!7394 a!3312)) mask!3809))))

(declare-fun lt!145060 () SeekEntryResult!2189)

(assert (=> b!292894 (= lt!145060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145062 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292894 (= lt!145062 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292895 () Bool)

(declare-fun res!154003 () Bool)

(assert (=> b!292895 (=> (not res!154003) (not e!185221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292895 (= res!154003 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28664 res!153999) b!292890))

(assert (= (and b!292890 res!154002) b!292895))

(assert (= (and b!292895 res!154003) b!292892))

(assert (= (and b!292892 res!153998) b!292893))

(assert (= (and b!292893 res!154000) b!292891))

(assert (= (and b!292891 res!154001) b!292894))

(declare-fun m!306245 () Bool)

(assert (=> b!292894 m!306245))

(declare-fun m!306247 () Bool)

(assert (=> b!292894 m!306247))

(declare-fun m!306249 () Bool)

(assert (=> b!292894 m!306249))

(declare-fun m!306251 () Bool)

(assert (=> b!292894 m!306251))

(declare-fun m!306253 () Bool)

(assert (=> b!292895 m!306253))

(declare-fun m!306255 () Bool)

(assert (=> b!292892 m!306255))

(declare-fun m!306257 () Bool)

(assert (=> b!292891 m!306257))

(declare-fun m!306259 () Bool)

(assert (=> b!292893 m!306259))

(declare-fun m!306261 () Bool)

(assert (=> start!28664 m!306261))

(declare-fun m!306263 () Bool)

(assert (=> start!28664 m!306263))

(check-sat (not b!292892) (not b!292894) (not b!292895) (not start!28664) (not b!292891) (not b!292893))
(check-sat)
