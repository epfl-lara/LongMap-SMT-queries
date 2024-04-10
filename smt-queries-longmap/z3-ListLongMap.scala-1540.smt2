; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29172 () Bool)

(assert start!29172)

(declare-fun b!296014 () Bool)

(declare-fun e!187096 () Bool)

(assert (=> b!296014 (= e!187096 (not true))))

(declare-datatypes ((array!14975 0))(
  ( (array!14976 (arr!7098 (Array (_ BitVec 32) (_ BitVec 64))) (size!7450 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14975)

(declare-datatypes ((SeekEntryResult!2247 0))(
  ( (MissingZero!2247 (index!11158 (_ BitVec 32))) (Found!2247 (index!11159 (_ BitVec 32))) (Intermediate!2247 (undefined!3059 Bool) (index!11160 (_ BitVec 32)) (x!29371 (_ BitVec 32))) (Undefined!2247) (MissingVacant!2247 (index!11161 (_ BitVec 32))) )
))
(declare-fun lt!146898 () SeekEntryResult!2247)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296014 (and (= (select (arr!7098 a!3312) (index!11160 lt!146898)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11160 lt!146898) i!1256))))

(declare-fun b!296015 () Bool)

(declare-fun e!187095 () Bool)

(declare-fun e!187093 () Bool)

(assert (=> b!296015 (= e!187095 e!187093)))

(declare-fun res!155826 () Bool)

(assert (=> b!296015 (=> (not res!155826) (not e!187093))))

(declare-fun lt!146896 () Bool)

(declare-fun lt!146897 () SeekEntryResult!2247)

(assert (=> b!296015 (= res!155826 (or lt!146896 (= lt!146897 (MissingVacant!2247 i!1256))))))

(assert (=> b!296015 (= lt!146896 (= lt!146897 (MissingZero!2247 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14975 (_ BitVec 32)) SeekEntryResult!2247)

(assert (=> b!296015 (= lt!146897 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296016 () Bool)

(declare-fun res!155825 () Bool)

(assert (=> b!296016 (=> (not res!155825) (not e!187095))))

(assert (=> b!296016 (= res!155825 (and (= (size!7450 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7450 a!3312))))))

(declare-fun b!296017 () Bool)

(declare-fun e!187094 () Bool)

(assert (=> b!296017 (= e!187093 e!187094)))

(declare-fun res!155828 () Bool)

(assert (=> b!296017 (=> (not res!155828) (not e!187094))))

(assert (=> b!296017 (= res!155828 lt!146896)))

(declare-fun lt!146901 () (_ BitVec 32))

(declare-fun lt!146899 () SeekEntryResult!2247)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14975 (_ BitVec 32)) SeekEntryResult!2247)

(assert (=> b!296017 (= lt!146899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146901 k0!2524 (array!14976 (store (arr!7098 a!3312) i!1256 k0!2524) (size!7450 a!3312)) mask!3809))))

(assert (=> b!296017 (= lt!146898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146901 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296017 (= lt!146901 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296018 () Bool)

(declare-fun res!155822 () Bool)

(assert (=> b!296018 (=> (not res!155822) (not e!187095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296018 (= res!155822 (validKeyInArray!0 k0!2524))))

(declare-fun b!296019 () Bool)

(declare-fun res!155829 () Bool)

(assert (=> b!296019 (=> (not res!155829) (not e!187093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14975 (_ BitVec 32)) Bool)

(assert (=> b!296019 (= res!155829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!155824 () Bool)

(assert (=> start!29172 (=> (not res!155824) (not e!187095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29172 (= res!155824 (validMask!0 mask!3809))))

(assert (=> start!29172 e!187095))

(assert (=> start!29172 true))

(declare-fun array_inv!5061 (array!14975) Bool)

(assert (=> start!29172 (array_inv!5061 a!3312)))

(declare-fun b!296020 () Bool)

(assert (=> b!296020 (= e!187094 e!187096)))

(declare-fun res!155823 () Bool)

(assert (=> b!296020 (=> (not res!155823) (not e!187096))))

(declare-fun lt!146900 () Bool)

(assert (=> b!296020 (= res!155823 (and (or lt!146900 (not (undefined!3059 lt!146898))) (or lt!146900 (not (= (select (arr!7098 a!3312) (index!11160 lt!146898)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146900 (not (= (select (arr!7098 a!3312) (index!11160 lt!146898)) k0!2524))) (not lt!146900)))))

(get-info :version)

(assert (=> b!296020 (= lt!146900 (not ((_ is Intermediate!2247) lt!146898)))))

(declare-fun b!296021 () Bool)

(declare-fun res!155827 () Bool)

(assert (=> b!296021 (=> (not res!155827) (not e!187095))))

(declare-fun arrayContainsKey!0 (array!14975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296021 (= res!155827 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29172 res!155824) b!296016))

(assert (= (and b!296016 res!155825) b!296018))

(assert (= (and b!296018 res!155822) b!296021))

(assert (= (and b!296021 res!155827) b!296015))

(assert (= (and b!296015 res!155826) b!296019))

(assert (= (and b!296019 res!155829) b!296017))

(assert (= (and b!296017 res!155828) b!296020))

(assert (= (and b!296020 res!155823) b!296014))

(declare-fun m!309073 () Bool)

(assert (=> b!296014 m!309073))

(declare-fun m!309075 () Bool)

(assert (=> b!296017 m!309075))

(declare-fun m!309077 () Bool)

(assert (=> b!296017 m!309077))

(declare-fun m!309079 () Bool)

(assert (=> b!296017 m!309079))

(declare-fun m!309081 () Bool)

(assert (=> b!296017 m!309081))

(declare-fun m!309083 () Bool)

(assert (=> b!296018 m!309083))

(declare-fun m!309085 () Bool)

(assert (=> b!296019 m!309085))

(declare-fun m!309087 () Bool)

(assert (=> b!296021 m!309087))

(declare-fun m!309089 () Bool)

(assert (=> start!29172 m!309089))

(declare-fun m!309091 () Bool)

(assert (=> start!29172 m!309091))

(assert (=> b!296020 m!309073))

(declare-fun m!309093 () Bool)

(assert (=> b!296015 m!309093))

(check-sat (not b!296015) (not b!296019) (not b!296021) (not b!296018) (not start!29172) (not b!296017))
(check-sat)
