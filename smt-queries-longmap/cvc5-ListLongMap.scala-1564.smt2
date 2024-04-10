; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29824 () Bool)

(assert start!29824)

(declare-fun b!300141 () Bool)

(declare-fun e!189549 () Bool)

(assert (=> b!300141 (= e!189549 false)))

(declare-fun lt!149277 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2318 0))(
  ( (MissingZero!2318 (index!11448 (_ BitVec 32))) (Found!2318 (index!11449 (_ BitVec 32))) (Intermediate!2318 (undefined!3130 Bool) (index!11450 (_ BitVec 32)) (x!29706 (_ BitVec 32))) (Undefined!2318) (MissingVacant!2318 (index!11451 (_ BitVec 32))) )
))
(declare-fun lt!149276 () SeekEntryResult!2318)

(declare-datatypes ((array!15147 0))(
  ( (array!15148 (arr!7169 (Array (_ BitVec 32) (_ BitVec 64))) (size!7521 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15147)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15147 (_ BitVec 32)) SeekEntryResult!2318)

(assert (=> b!300141 (= lt!149276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149277 k!2524 (array!15148 (store (arr!7169 a!3312) i!1256 k!2524) (size!7521 a!3312)) mask!3809))))

(declare-fun lt!149275 () SeekEntryResult!2318)

(assert (=> b!300141 (= lt!149275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149277 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300141 (= lt!149277 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300142 () Bool)

(declare-fun res!158176 () Bool)

(declare-fun e!189550 () Bool)

(assert (=> b!300142 (=> (not res!158176) (not e!189550))))

(declare-fun arrayContainsKey!0 (array!15147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300142 (= res!158176 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!158174 () Bool)

(assert (=> start!29824 (=> (not res!158174) (not e!189550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29824 (= res!158174 (validMask!0 mask!3809))))

(assert (=> start!29824 e!189550))

(assert (=> start!29824 true))

(declare-fun array_inv!5132 (array!15147) Bool)

(assert (=> start!29824 (array_inv!5132 a!3312)))

(declare-fun b!300143 () Bool)

(declare-fun res!158173 () Bool)

(assert (=> b!300143 (=> (not res!158173) (not e!189550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300143 (= res!158173 (validKeyInArray!0 k!2524))))

(declare-fun b!300144 () Bool)

(declare-fun res!158177 () Bool)

(assert (=> b!300144 (=> (not res!158177) (not e!189549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15147 (_ BitVec 32)) Bool)

(assert (=> b!300144 (= res!158177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300145 () Bool)

(declare-fun res!158175 () Bool)

(assert (=> b!300145 (=> (not res!158175) (not e!189550))))

(assert (=> b!300145 (= res!158175 (and (= (size!7521 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7521 a!3312))))))

(declare-fun b!300146 () Bool)

(assert (=> b!300146 (= e!189550 e!189549)))

(declare-fun res!158178 () Bool)

(assert (=> b!300146 (=> (not res!158178) (not e!189549))))

(declare-fun lt!149274 () SeekEntryResult!2318)

(assert (=> b!300146 (= res!158178 (or (= lt!149274 (MissingZero!2318 i!1256)) (= lt!149274 (MissingVacant!2318 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15147 (_ BitVec 32)) SeekEntryResult!2318)

(assert (=> b!300146 (= lt!149274 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29824 res!158174) b!300145))

(assert (= (and b!300145 res!158175) b!300143))

(assert (= (and b!300143 res!158173) b!300142))

(assert (= (and b!300142 res!158176) b!300146))

(assert (= (and b!300146 res!158178) b!300144))

(assert (= (and b!300144 res!158177) b!300141))

(declare-fun m!312183 () Bool)

(assert (=> b!300144 m!312183))

(declare-fun m!312185 () Bool)

(assert (=> b!300141 m!312185))

(declare-fun m!312187 () Bool)

(assert (=> b!300141 m!312187))

(declare-fun m!312189 () Bool)

(assert (=> b!300141 m!312189))

(declare-fun m!312191 () Bool)

(assert (=> b!300141 m!312191))

(declare-fun m!312193 () Bool)

(assert (=> start!29824 m!312193))

(declare-fun m!312195 () Bool)

(assert (=> start!29824 m!312195))

(declare-fun m!312197 () Bool)

(assert (=> b!300143 m!312197))

(declare-fun m!312199 () Bool)

(assert (=> b!300142 m!312199))

(declare-fun m!312201 () Bool)

(assert (=> b!300146 m!312201))

(push 1)

