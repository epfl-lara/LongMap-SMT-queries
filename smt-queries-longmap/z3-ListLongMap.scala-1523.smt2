; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28660 () Bool)

(assert start!28660)

(declare-fun b!293084 () Bool)

(declare-fun res!154119 () Bool)

(declare-fun e!185348 () Bool)

(assert (=> b!293084 (=> (not res!154119) (not e!185348))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14844 0))(
  ( (array!14845 (arr!7045 (Array (_ BitVec 32) (_ BitVec 64))) (size!7397 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14844)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!293084 (= res!154119 (and (= (size!7397 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7397 a!3312))))))

(declare-fun b!293085 () Bool)

(declare-fun e!185346 () Bool)

(assert (=> b!293085 (= e!185348 e!185346)))

(declare-fun res!154116 () Bool)

(assert (=> b!293085 (=> (not res!154116) (not e!185346))))

(declare-datatypes ((SeekEntryResult!2159 0))(
  ( (MissingZero!2159 (index!10806 (_ BitVec 32))) (Found!2159 (index!10807 (_ BitVec 32))) (Intermediate!2159 (undefined!2971 Bool) (index!10808 (_ BitVec 32)) (x!29094 (_ BitVec 32))) (Undefined!2159) (MissingVacant!2159 (index!10809 (_ BitVec 32))) )
))
(declare-fun lt!145302 () SeekEntryResult!2159)

(assert (=> b!293085 (= res!154116 (or (= lt!145302 (MissingZero!2159 i!1256)) (= lt!145302 (MissingVacant!2159 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14844 (_ BitVec 32)) SeekEntryResult!2159)

(assert (=> b!293085 (= lt!145302 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!293086 () Bool)

(declare-fun res!154115 () Bool)

(assert (=> b!293086 (=> (not res!154115) (not e!185346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14844 (_ BitVec 32)) Bool)

(assert (=> b!293086 (= res!154115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293087 () Bool)

(declare-fun res!154114 () Bool)

(assert (=> b!293087 (=> (not res!154114) (not e!185348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293087 (= res!154114 (validKeyInArray!0 k0!2524))))

(declare-fun b!293088 () Bool)

(assert (=> b!293088 (= e!185346 false)))

(declare-fun lt!145299 () (_ BitVec 32))

(declare-fun lt!145301 () SeekEntryResult!2159)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14844 (_ BitVec 32)) SeekEntryResult!2159)

(assert (=> b!293088 (= lt!145301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145299 k0!2524 (array!14845 (store (arr!7045 a!3312) i!1256 k0!2524) (size!7397 a!3312)) mask!3809))))

(declare-fun lt!145300 () SeekEntryResult!2159)

(assert (=> b!293088 (= lt!145300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145299 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293088 (= lt!145299 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!293089 () Bool)

(declare-fun res!154117 () Bool)

(assert (=> b!293089 (=> (not res!154117) (not e!185348))))

(declare-fun arrayContainsKey!0 (array!14844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293089 (= res!154117 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!154118 () Bool)

(assert (=> start!28660 (=> (not res!154118) (not e!185348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28660 (= res!154118 (validMask!0 mask!3809))))

(assert (=> start!28660 e!185348))

(assert (=> start!28660 true))

(declare-fun array_inv!4995 (array!14844) Bool)

(assert (=> start!28660 (array_inv!4995 a!3312)))

(assert (= (and start!28660 res!154118) b!293084))

(assert (= (and b!293084 res!154119) b!293087))

(assert (= (and b!293087 res!154114) b!293089))

(assert (= (and b!293089 res!154117) b!293085))

(assert (= (and b!293085 res!154116) b!293086))

(assert (= (and b!293086 res!154115) b!293088))

(declare-fun m!307043 () Bool)

(assert (=> b!293086 m!307043))

(declare-fun m!307045 () Bool)

(assert (=> b!293085 m!307045))

(declare-fun m!307047 () Bool)

(assert (=> b!293088 m!307047))

(declare-fun m!307049 () Bool)

(assert (=> b!293088 m!307049))

(declare-fun m!307051 () Bool)

(assert (=> b!293088 m!307051))

(declare-fun m!307053 () Bool)

(assert (=> b!293088 m!307053))

(declare-fun m!307055 () Bool)

(assert (=> b!293087 m!307055))

(declare-fun m!307057 () Bool)

(assert (=> start!28660 m!307057))

(declare-fun m!307059 () Bool)

(assert (=> start!28660 m!307059))

(declare-fun m!307061 () Bool)

(assert (=> b!293089 m!307061))

(check-sat (not b!293086) (not b!293089) (not start!28660) (not b!293087) (not b!293088) (not b!293085))
(check-sat)
