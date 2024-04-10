; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29828 () Bool)

(assert start!29828)

(declare-fun res!158209 () Bool)

(declare-fun e!189568 () Bool)

(assert (=> start!29828 (=> (not res!158209) (not e!189568))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29828 (= res!158209 (validMask!0 mask!3809))))

(assert (=> start!29828 e!189568))

(assert (=> start!29828 true))

(declare-datatypes ((array!15151 0))(
  ( (array!15152 (arr!7171 (Array (_ BitVec 32) (_ BitVec 64))) (size!7523 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15151)

(declare-fun array_inv!5134 (array!15151) Bool)

(assert (=> start!29828 (array_inv!5134 a!3312)))

(declare-fun b!300177 () Bool)

(declare-fun res!158210 () Bool)

(assert (=> b!300177 (=> (not res!158210) (not e!189568))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300177 (= res!158210 (and (= (size!7523 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7523 a!3312))))))

(declare-fun b!300178 () Bool)

(declare-fun res!158213 () Bool)

(declare-fun e!189567 () Bool)

(assert (=> b!300178 (=> (not res!158213) (not e!189567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15151 (_ BitVec 32)) Bool)

(assert (=> b!300178 (= res!158213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300179 () Bool)

(assert (=> b!300179 (= e!189567 false)))

(declare-fun lt!149300 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2320 0))(
  ( (MissingZero!2320 (index!11456 (_ BitVec 32))) (Found!2320 (index!11457 (_ BitVec 32))) (Intermediate!2320 (undefined!3132 Bool) (index!11458 (_ BitVec 32)) (x!29708 (_ BitVec 32))) (Undefined!2320) (MissingVacant!2320 (index!11459 (_ BitVec 32))) )
))
(declare-fun lt!149298 () SeekEntryResult!2320)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15151 (_ BitVec 32)) SeekEntryResult!2320)

(assert (=> b!300179 (= lt!149298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149300 k!2524 (array!15152 (store (arr!7171 a!3312) i!1256 k!2524) (size!7523 a!3312)) mask!3809))))

(declare-fun lt!149299 () SeekEntryResult!2320)

(assert (=> b!300179 (= lt!149299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149300 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300179 (= lt!149300 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300180 () Bool)

(assert (=> b!300180 (= e!189568 e!189567)))

(declare-fun res!158212 () Bool)

(assert (=> b!300180 (=> (not res!158212) (not e!189567))))

(declare-fun lt!149301 () SeekEntryResult!2320)

(assert (=> b!300180 (= res!158212 (or (= lt!149301 (MissingZero!2320 i!1256)) (= lt!149301 (MissingVacant!2320 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15151 (_ BitVec 32)) SeekEntryResult!2320)

(assert (=> b!300180 (= lt!149301 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!300181 () Bool)

(declare-fun res!158211 () Bool)

(assert (=> b!300181 (=> (not res!158211) (not e!189568))))

(declare-fun arrayContainsKey!0 (array!15151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300181 (= res!158211 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300182 () Bool)

(declare-fun res!158214 () Bool)

(assert (=> b!300182 (=> (not res!158214) (not e!189568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300182 (= res!158214 (validKeyInArray!0 k!2524))))

(assert (= (and start!29828 res!158209) b!300177))

(assert (= (and b!300177 res!158210) b!300182))

(assert (= (and b!300182 res!158214) b!300181))

(assert (= (and b!300181 res!158211) b!300180))

(assert (= (and b!300180 res!158212) b!300178))

(assert (= (and b!300178 res!158213) b!300179))

(declare-fun m!312223 () Bool)

(assert (=> b!300180 m!312223))

(declare-fun m!312225 () Bool)

(assert (=> b!300178 m!312225))

(declare-fun m!312227 () Bool)

(assert (=> b!300181 m!312227))

(declare-fun m!312229 () Bool)

(assert (=> start!29828 m!312229))

(declare-fun m!312231 () Bool)

(assert (=> start!29828 m!312231))

(declare-fun m!312233 () Bool)

(assert (=> b!300182 m!312233))

(declare-fun m!312235 () Bool)

(assert (=> b!300179 m!312235))

(declare-fun m!312237 () Bool)

(assert (=> b!300179 m!312237))

(declare-fun m!312239 () Bool)

(assert (=> b!300179 m!312239))

(declare-fun m!312241 () Bool)

(assert (=> b!300179 m!312241))

(push 1)

(assert (not b!300182))

(assert (not b!300181))

