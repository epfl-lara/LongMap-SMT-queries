; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68392 () Bool)

(assert start!68392)

(declare-fun b!794757 () Bool)

(declare-fun res!539285 () Bool)

(declare-fun e!441239 () Bool)

(assert (=> b!794757 (=> (not res!539285) (not e!441239))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43182 0))(
  ( (array!43183 (arr!20671 (Array (_ BitVec 32) (_ BitVec 64))) (size!21092 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43182)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794757 (= res!539285 (and (= (size!21092 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21092 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21092 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794758 () Bool)

(declare-fun e!441238 () Bool)

(declare-fun e!441237 () Bool)

(assert (=> b!794758 (= e!441238 e!441237)))

(declare-fun res!539281 () Bool)

(assert (=> b!794758 (=> (not res!539281) (not e!441237))))

(declare-fun lt!354279 () (_ BitVec 64))

(declare-fun lt!354278 () array!43182)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8262 0))(
  ( (MissingZero!8262 (index!35416 (_ BitVec 32))) (Found!8262 (index!35417 (_ BitVec 32))) (Intermediate!8262 (undefined!9074 Bool) (index!35418 (_ BitVec 32)) (x!66340 (_ BitVec 32))) (Undefined!8262) (MissingVacant!8262 (index!35419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43182 (_ BitVec 32)) SeekEntryResult!8262)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43182 (_ BitVec 32)) SeekEntryResult!8262)

(assert (=> b!794758 (= res!539281 (= (seekEntryOrOpen!0 lt!354279 lt!354278 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354279 lt!354278 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!794758 (= lt!354279 (select (store (arr!20671 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794758 (= lt!354278 (array!43183 (store (arr!20671 a!3170) i!1163 k0!2044) (size!21092 a!3170)))))

(declare-fun b!794759 () Bool)

(declare-fun res!539279 () Bool)

(assert (=> b!794759 (=> (not res!539279) (not e!441238))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794759 (= res!539279 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21092 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20671 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21092 a!3170)) (= (select (arr!20671 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794760 () Bool)

(declare-fun res!539282 () Bool)

(assert (=> b!794760 (=> (not res!539282) (not e!441238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43182 (_ BitVec 32)) Bool)

(assert (=> b!794760 (= res!539282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794762 () Bool)

(assert (=> b!794762 (= e!441239 e!441238)))

(declare-fun res!539278 () Bool)

(assert (=> b!794762 (=> (not res!539278) (not e!441238))))

(declare-fun lt!354280 () SeekEntryResult!8262)

(assert (=> b!794762 (= res!539278 (or (= lt!354280 (MissingZero!8262 i!1163)) (= lt!354280 (MissingVacant!8262 i!1163))))))

(assert (=> b!794762 (= lt!354280 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794763 () Bool)

(assert (=> b!794763 (= e!441237 false)))

(declare-fun lt!354281 () SeekEntryResult!8262)

(assert (=> b!794763 (= lt!354281 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20671 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354277 () SeekEntryResult!8262)

(assert (=> b!794763 (= lt!354277 (seekEntryOrOpen!0 (select (arr!20671 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!794764 () Bool)

(declare-fun res!539284 () Bool)

(assert (=> b!794764 (=> (not res!539284) (not e!441239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794764 (= res!539284 (validKeyInArray!0 (select (arr!20671 a!3170) j!153)))))

(declare-fun b!794765 () Bool)

(declare-fun res!539277 () Bool)

(assert (=> b!794765 (=> (not res!539277) (not e!441239))))

(assert (=> b!794765 (= res!539277 (validKeyInArray!0 k0!2044))))

(declare-fun b!794766 () Bool)

(declare-fun res!539280 () Bool)

(assert (=> b!794766 (=> (not res!539280) (not e!441238))))

(declare-datatypes ((List!14634 0))(
  ( (Nil!14631) (Cons!14630 (h!15759 (_ BitVec 64)) (t!20949 List!14634)) )
))
(declare-fun arrayNoDuplicates!0 (array!43182 (_ BitVec 32) List!14634) Bool)

(assert (=> b!794766 (= res!539280 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14631))))

(declare-fun b!794761 () Bool)

(declare-fun res!539276 () Bool)

(assert (=> b!794761 (=> (not res!539276) (not e!441239))))

(declare-fun arrayContainsKey!0 (array!43182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794761 (= res!539276 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!539283 () Bool)

(assert (=> start!68392 (=> (not res!539283) (not e!441239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68392 (= res!539283 (validMask!0 mask!3266))))

(assert (=> start!68392 e!441239))

(assert (=> start!68392 true))

(declare-fun array_inv!16467 (array!43182) Bool)

(assert (=> start!68392 (array_inv!16467 a!3170)))

(assert (= (and start!68392 res!539283) b!794757))

(assert (= (and b!794757 res!539285) b!794764))

(assert (= (and b!794764 res!539284) b!794765))

(assert (= (and b!794765 res!539277) b!794761))

(assert (= (and b!794761 res!539276) b!794762))

(assert (= (and b!794762 res!539278) b!794760))

(assert (= (and b!794760 res!539282) b!794766))

(assert (= (and b!794766 res!539280) b!794759))

(assert (= (and b!794759 res!539279) b!794758))

(assert (= (and b!794758 res!539281) b!794763))

(declare-fun m!735321 () Bool)

(assert (=> start!68392 m!735321))

(declare-fun m!735323 () Bool)

(assert (=> start!68392 m!735323))

(declare-fun m!735325 () Bool)

(assert (=> b!794760 m!735325))

(declare-fun m!735327 () Bool)

(assert (=> b!794762 m!735327))

(declare-fun m!735329 () Bool)

(assert (=> b!794759 m!735329))

(declare-fun m!735331 () Bool)

(assert (=> b!794759 m!735331))

(declare-fun m!735333 () Bool)

(assert (=> b!794764 m!735333))

(assert (=> b!794764 m!735333))

(declare-fun m!735335 () Bool)

(assert (=> b!794764 m!735335))

(assert (=> b!794763 m!735333))

(assert (=> b!794763 m!735333))

(declare-fun m!735337 () Bool)

(assert (=> b!794763 m!735337))

(assert (=> b!794763 m!735333))

(declare-fun m!735339 () Bool)

(assert (=> b!794763 m!735339))

(declare-fun m!735341 () Bool)

(assert (=> b!794765 m!735341))

(declare-fun m!735343 () Bool)

(assert (=> b!794766 m!735343))

(declare-fun m!735345 () Bool)

(assert (=> b!794758 m!735345))

(declare-fun m!735347 () Bool)

(assert (=> b!794758 m!735347))

(declare-fun m!735349 () Bool)

(assert (=> b!794758 m!735349))

(declare-fun m!735351 () Bool)

(assert (=> b!794758 m!735351))

(declare-fun m!735353 () Bool)

(assert (=> b!794761 m!735353))

(check-sat (not b!794761) (not b!794765) (not b!794762) (not b!794766) (not b!794764) (not b!794760) (not start!68392) (not b!794763) (not b!794758))
(check-sat)
