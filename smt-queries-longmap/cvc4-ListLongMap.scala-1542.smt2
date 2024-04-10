; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29186 () Bool)

(assert start!29186)

(declare-fun b!296182 () Bool)

(declare-fun res!155997 () Bool)

(declare-fun e!187201 () Bool)

(assert (=> b!296182 (=> (not res!155997) (not e!187201))))

(declare-datatypes ((array!14989 0))(
  ( (array!14990 (arr!7105 (Array (_ BitVec 32) (_ BitVec 64))) (size!7457 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14989)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296182 (= res!155997 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296183 () Bool)

(declare-fun res!155993 () Bool)

(assert (=> b!296183 (=> (not res!155993) (not e!187201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296183 (= res!155993 (validKeyInArray!0 k!2524))))

(declare-fun b!296184 () Bool)

(declare-fun e!187200 () Bool)

(assert (=> b!296184 (= e!187200 (not true))))

(declare-datatypes ((SeekEntryResult!2254 0))(
  ( (MissingZero!2254 (index!11186 (_ BitVec 32))) (Found!2254 (index!11187 (_ BitVec 32))) (Intermediate!2254 (undefined!3066 Bool) (index!11188 (_ BitVec 32)) (x!29394 (_ BitVec 32))) (Undefined!2254) (MissingVacant!2254 (index!11189 (_ BitVec 32))) )
))
(declare-fun lt!147024 () SeekEntryResult!2254)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296184 (and (= (select (arr!7105 a!3312) (index!11188 lt!147024)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11188 lt!147024) i!1256))))

(declare-fun b!296185 () Bool)

(declare-fun e!187199 () Bool)

(assert (=> b!296185 (= e!187201 e!187199)))

(declare-fun res!155995 () Bool)

(assert (=> b!296185 (=> (not res!155995) (not e!187199))))

(declare-fun lt!147023 () SeekEntryResult!2254)

(declare-fun lt!147026 () Bool)

(assert (=> b!296185 (= res!155995 (or lt!147026 (= lt!147023 (MissingVacant!2254 i!1256))))))

(assert (=> b!296185 (= lt!147026 (= lt!147023 (MissingZero!2254 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14989 (_ BitVec 32)) SeekEntryResult!2254)

(assert (=> b!296185 (= lt!147023 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296186 () Bool)

(declare-fun e!187197 () Bool)

(assert (=> b!296186 (= e!187197 e!187200)))

(declare-fun res!155991 () Bool)

(assert (=> b!296186 (=> (not res!155991) (not e!187200))))

(declare-fun lt!147022 () Bool)

(assert (=> b!296186 (= res!155991 (and (or lt!147022 (not (undefined!3066 lt!147024))) (or lt!147022 (not (= (select (arr!7105 a!3312) (index!11188 lt!147024)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147022 (not (= (select (arr!7105 a!3312) (index!11188 lt!147024)) k!2524))) (not lt!147022)))))

(assert (=> b!296186 (= lt!147022 (not (is-Intermediate!2254 lt!147024)))))

(declare-fun b!296188 () Bool)

(declare-fun res!155990 () Bool)

(assert (=> b!296188 (=> (not res!155990) (not e!187201))))

(assert (=> b!296188 (= res!155990 (and (= (size!7457 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7457 a!3312))))))

(declare-fun b!296189 () Bool)

(assert (=> b!296189 (= e!187199 e!187197)))

(declare-fun res!155992 () Bool)

(assert (=> b!296189 (=> (not res!155992) (not e!187197))))

(assert (=> b!296189 (= res!155992 lt!147026)))

(declare-fun lt!147027 () SeekEntryResult!2254)

(declare-fun lt!147025 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14989 (_ BitVec 32)) SeekEntryResult!2254)

(assert (=> b!296189 (= lt!147027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147025 k!2524 (array!14990 (store (arr!7105 a!3312) i!1256 k!2524) (size!7457 a!3312)) mask!3809))))

(assert (=> b!296189 (= lt!147024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147025 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296189 (= lt!147025 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296187 () Bool)

(declare-fun res!155994 () Bool)

(assert (=> b!296187 (=> (not res!155994) (not e!187199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14989 (_ BitVec 32)) Bool)

(assert (=> b!296187 (= res!155994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!155996 () Bool)

(assert (=> start!29186 (=> (not res!155996) (not e!187201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29186 (= res!155996 (validMask!0 mask!3809))))

(assert (=> start!29186 e!187201))

(assert (=> start!29186 true))

(declare-fun array_inv!5068 (array!14989) Bool)

(assert (=> start!29186 (array_inv!5068 a!3312)))

(assert (= (and start!29186 res!155996) b!296188))

(assert (= (and b!296188 res!155990) b!296183))

(assert (= (and b!296183 res!155993) b!296182))

(assert (= (and b!296182 res!155997) b!296185))

(assert (= (and b!296185 res!155995) b!296187))

(assert (= (and b!296187 res!155994) b!296189))

(assert (= (and b!296189 res!155992) b!296186))

(assert (= (and b!296186 res!155991) b!296184))

(declare-fun m!309227 () Bool)

(assert (=> b!296187 m!309227))

(declare-fun m!309229 () Bool)

(assert (=> b!296183 m!309229))

(declare-fun m!309231 () Bool)

(assert (=> b!296184 m!309231))

(declare-fun m!309233 () Bool)

(assert (=> start!29186 m!309233))

(declare-fun m!309235 () Bool)

(assert (=> start!29186 m!309235))

(declare-fun m!309237 () Bool)

(assert (=> b!296189 m!309237))

(declare-fun m!309239 () Bool)

(assert (=> b!296189 m!309239))

(declare-fun m!309241 () Bool)

(assert (=> b!296189 m!309241))

(declare-fun m!309243 () Bool)

(assert (=> b!296189 m!309243))

(declare-fun m!309245 () Bool)

(assert (=> b!296182 m!309245))

(declare-fun m!309247 () Bool)

(assert (=> b!296185 m!309247))

(assert (=> b!296186 m!309231))

(push 1)

