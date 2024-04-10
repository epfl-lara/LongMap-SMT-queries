; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29250 () Bool)

(assert start!29250)

(declare-fun b!296590 () Bool)

(declare-fun e!187449 () Bool)

(assert (=> b!296590 (= e!187449 (not true))))

(declare-datatypes ((array!15008 0))(
  ( (array!15009 (arr!7113 (Array (_ BitVec 32) (_ BitVec 64))) (size!7465 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15008)

(declare-datatypes ((SeekEntryResult!2262 0))(
  ( (MissingZero!2262 (index!11218 (_ BitVec 32))) (Found!2262 (index!11219 (_ BitVec 32))) (Intermediate!2262 (undefined!3074 Bool) (index!11220 (_ BitVec 32)) (x!29432 (_ BitVec 32))) (Undefined!2262) (MissingVacant!2262 (index!11221 (_ BitVec 32))) )
))
(declare-fun lt!147266 () SeekEntryResult!2262)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296590 (and (= (select (arr!7113 a!3312) (index!11220 lt!147266)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11220 lt!147266) i!1256))))

(declare-fun b!296591 () Bool)

(declare-fun res!156263 () Bool)

(declare-fun e!187452 () Bool)

(assert (=> b!296591 (=> (not res!156263) (not e!187452))))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!296591 (= res!156263 (and (= (size!7465 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7465 a!3312))))))

(declare-fun b!296592 () Bool)

(declare-fun res!156261 () Bool)

(assert (=> b!296592 (=> (not res!156261) (not e!187452))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296592 (= res!156261 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296593 () Bool)

(declare-fun res!156260 () Bool)

(declare-fun e!187450 () Bool)

(assert (=> b!296593 (=> (not res!156260) (not e!187450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15008 (_ BitVec 32)) Bool)

(assert (=> b!296593 (= res!156260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296594 () Bool)

(declare-fun res!156264 () Bool)

(assert (=> b!296594 (=> (not res!156264) (not e!187452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296594 (= res!156264 (validKeyInArray!0 k0!2524))))

(declare-fun b!296595 () Bool)

(declare-fun e!187451 () Bool)

(assert (=> b!296595 (= e!187451 e!187449)))

(declare-fun res!156257 () Bool)

(assert (=> b!296595 (=> (not res!156257) (not e!187449))))

(declare-fun lt!147267 () Bool)

(assert (=> b!296595 (= res!156257 (and (or lt!147267 (not (undefined!3074 lt!147266))) (or lt!147267 (not (= (select (arr!7113 a!3312) (index!11220 lt!147266)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147267 (not (= (select (arr!7113 a!3312) (index!11220 lt!147266)) k0!2524))) (not lt!147267)))))

(get-info :version)

(assert (=> b!296595 (= lt!147267 (not ((_ is Intermediate!2262) lt!147266)))))

(declare-fun res!156262 () Bool)

(assert (=> start!29250 (=> (not res!156262) (not e!187452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29250 (= res!156262 (validMask!0 mask!3809))))

(assert (=> start!29250 e!187452))

(assert (=> start!29250 true))

(declare-fun array_inv!5076 (array!15008) Bool)

(assert (=> start!29250 (array_inv!5076 a!3312)))

(declare-fun b!296596 () Bool)

(assert (=> b!296596 (= e!187452 e!187450)))

(declare-fun res!156259 () Bool)

(assert (=> b!296596 (=> (not res!156259) (not e!187450))))

(declare-fun lt!147262 () SeekEntryResult!2262)

(declare-fun lt!147265 () Bool)

(assert (=> b!296596 (= res!156259 (or lt!147265 (= lt!147262 (MissingVacant!2262 i!1256))))))

(assert (=> b!296596 (= lt!147265 (= lt!147262 (MissingZero!2262 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15008 (_ BitVec 32)) SeekEntryResult!2262)

(assert (=> b!296596 (= lt!147262 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296597 () Bool)

(assert (=> b!296597 (= e!187450 e!187451)))

(declare-fun res!156258 () Bool)

(assert (=> b!296597 (=> (not res!156258) (not e!187451))))

(assert (=> b!296597 (= res!156258 lt!147265)))

(declare-fun lt!147263 () SeekEntryResult!2262)

(declare-fun lt!147264 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15008 (_ BitVec 32)) SeekEntryResult!2262)

(assert (=> b!296597 (= lt!147263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147264 k0!2524 (array!15009 (store (arr!7113 a!3312) i!1256 k0!2524) (size!7465 a!3312)) mask!3809))))

(assert (=> b!296597 (= lt!147266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147264 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296597 (= lt!147264 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29250 res!156262) b!296591))

(assert (= (and b!296591 res!156263) b!296594))

(assert (= (and b!296594 res!156264) b!296592))

(assert (= (and b!296592 res!156261) b!296596))

(assert (= (and b!296596 res!156259) b!296593))

(assert (= (and b!296593 res!156260) b!296597))

(assert (= (and b!296597 res!156258) b!296595))

(assert (= (and b!296595 res!156257) b!296590))

(declare-fun m!309523 () Bool)

(assert (=> start!29250 m!309523))

(declare-fun m!309525 () Bool)

(assert (=> start!29250 m!309525))

(declare-fun m!309527 () Bool)

(assert (=> b!296597 m!309527))

(declare-fun m!309529 () Bool)

(assert (=> b!296597 m!309529))

(declare-fun m!309531 () Bool)

(assert (=> b!296597 m!309531))

(declare-fun m!309533 () Bool)

(assert (=> b!296597 m!309533))

(declare-fun m!309535 () Bool)

(assert (=> b!296593 m!309535))

(declare-fun m!309537 () Bool)

(assert (=> b!296592 m!309537))

(declare-fun m!309539 () Bool)

(assert (=> b!296595 m!309539))

(assert (=> b!296590 m!309539))

(declare-fun m!309541 () Bool)

(assert (=> b!296596 m!309541))

(declare-fun m!309543 () Bool)

(assert (=> b!296594 m!309543))

(check-sat (not b!296597) (not start!29250) (not b!296592) (not b!296596) (not b!296593) (not b!296594))
(check-sat)
