; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28180 () Bool)

(assert start!28180)

(declare-fun b!288517 () Bool)

(declare-fun res!150143 () Bool)

(declare-fun e!182674 () Bool)

(assert (=> b!288517 (=> (not res!150143) (not e!182674))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288517 (= res!150143 (validKeyInArray!0 k!2524))))

(declare-fun b!288518 () Bool)

(declare-fun res!150144 () Bool)

(assert (=> b!288518 (=> (not res!150144) (not e!182674))))

(declare-datatypes ((array!14494 0))(
  ( (array!14495 (arr!6874 (Array (_ BitVec 32) (_ BitVec 64))) (size!7226 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14494)

(declare-fun arrayContainsKey!0 (array!14494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288518 (= res!150144 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288519 () Bool)

(declare-fun res!150141 () Bool)

(assert (=> b!288519 (=> (not res!150141) (not e!182674))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!288519 (= res!150141 (and (= (size!7226 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7226 a!3312))))))

(declare-fun b!288520 () Bool)

(declare-fun e!182676 () Bool)

(assert (=> b!288520 (= e!182674 e!182676)))

(declare-fun res!150142 () Bool)

(assert (=> b!288520 (=> (not res!150142) (not e!182676))))

(declare-datatypes ((SeekEntryResult!2023 0))(
  ( (MissingZero!2023 (index!10262 (_ BitVec 32))) (Found!2023 (index!10263 (_ BitVec 32))) (Intermediate!2023 (undefined!2835 Bool) (index!10264 (_ BitVec 32)) (x!28476 (_ BitVec 32))) (Undefined!2023) (MissingVacant!2023 (index!10265 (_ BitVec 32))) )
))
(declare-fun lt!142144 () SeekEntryResult!2023)

(declare-fun lt!142142 () Bool)

(assert (=> b!288520 (= res!150142 (or lt!142142 (= lt!142144 (MissingVacant!2023 i!1256))))))

(assert (=> b!288520 (= lt!142142 (= lt!142144 (MissingZero!2023 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14494 (_ BitVec 32)) SeekEntryResult!2023)

(assert (=> b!288520 (= lt!142144 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288521 () Bool)

(declare-fun res!150140 () Bool)

(assert (=> b!288521 (=> (not res!150140) (not e!182676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14494 (_ BitVec 32)) Bool)

(assert (=> b!288521 (= res!150140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150146 () Bool)

(assert (=> start!28180 (=> (not res!150146) (not e!182674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28180 (= res!150146 (validMask!0 mask!3809))))

(assert (=> start!28180 e!182674))

(assert (=> start!28180 true))

(declare-fun array_inv!4837 (array!14494) Bool)

(assert (=> start!28180 (array_inv!4837 a!3312)))

(declare-fun b!288522 () Bool)

(declare-fun e!182677 () Bool)

(declare-fun e!182678 () Bool)

(assert (=> b!288522 (= e!182677 e!182678)))

(declare-fun res!150147 () Bool)

(assert (=> b!288522 (=> (not res!150147) (not e!182678))))

(declare-fun lt!142140 () Bool)

(declare-fun lt!142143 () SeekEntryResult!2023)

(assert (=> b!288522 (= res!150147 (and (or lt!142140 (not (undefined!2835 lt!142143))) (or lt!142140 (not (= (select (arr!6874 a!3312) (index!10264 lt!142143)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142140 (not (= (select (arr!6874 a!3312) (index!10264 lt!142143)) k!2524))) (not lt!142140)))))

(assert (=> b!288522 (= lt!142140 (not (is-Intermediate!2023 lt!142143)))))

(declare-fun b!288523 () Bool)

(assert (=> b!288523 (= e!182676 e!182677)))

(declare-fun res!150145 () Bool)

(assert (=> b!288523 (=> (not res!150145) (not e!182677))))

(assert (=> b!288523 (= res!150145 lt!142142)))

(declare-fun lt!142141 () (_ BitVec 32))

(declare-fun lt!142139 () SeekEntryResult!2023)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14494 (_ BitVec 32)) SeekEntryResult!2023)

(assert (=> b!288523 (= lt!142139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142141 k!2524 (array!14495 (store (arr!6874 a!3312) i!1256 k!2524) (size!7226 a!3312)) mask!3809))))

(assert (=> b!288523 (= lt!142143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142141 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288523 (= lt!142141 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288524 () Bool)

(assert (=> b!288524 (= e!182678 (not true))))

(assert (=> b!288524 (and (= (select (arr!6874 a!3312) (index!10264 lt!142143)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10264 lt!142143) i!1256))))

(assert (= (and start!28180 res!150146) b!288519))

(assert (= (and b!288519 res!150141) b!288517))

(assert (= (and b!288517 res!150143) b!288518))

(assert (= (and b!288518 res!150144) b!288520))

(assert (= (and b!288520 res!150142) b!288521))

(assert (= (and b!288521 res!150140) b!288523))

(assert (= (and b!288523 res!150145) b!288522))

(assert (= (and b!288522 res!150147) b!288524))

(declare-fun m!302741 () Bool)

(assert (=> b!288523 m!302741))

(declare-fun m!302743 () Bool)

(assert (=> b!288523 m!302743))

(declare-fun m!302745 () Bool)

(assert (=> b!288523 m!302745))

(declare-fun m!302747 () Bool)

(assert (=> b!288523 m!302747))

(declare-fun m!302749 () Bool)

(assert (=> b!288517 m!302749))

(declare-fun m!302751 () Bool)

(assert (=> b!288524 m!302751))

(declare-fun m!302753 () Bool)

(assert (=> b!288521 m!302753))

(declare-fun m!302755 () Bool)

(assert (=> b!288520 m!302755))

(declare-fun m!302757 () Bool)

(assert (=> b!288518 m!302757))

(assert (=> b!288522 m!302751))

(declare-fun m!302759 () Bool)

(assert (=> start!28180 m!302759))

(declare-fun m!302761 () Bool)

(assert (=> start!28180 m!302761))

(push 1)

