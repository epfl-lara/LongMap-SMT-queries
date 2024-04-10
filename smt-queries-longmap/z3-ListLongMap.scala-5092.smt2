; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69160 () Bool)

(assert start!69160)

(declare-fun b!806471 () Bool)

(declare-fun e!446605 () Bool)

(declare-fun e!446609 () Bool)

(assert (=> b!806471 (= e!446605 e!446609)))

(declare-fun res!550594 () Bool)

(assert (=> b!806471 (=> (not res!550594) (not e!446609))))

(declare-datatypes ((SeekEntryResult!8598 0))(
  ( (MissingZero!8598 (index!36760 (_ BitVec 32))) (Found!8598 (index!36761 (_ BitVec 32))) (Intermediate!8598 (undefined!9410 Bool) (index!36762 (_ BitVec 32)) (x!67578 (_ BitVec 32))) (Undefined!8598) (MissingVacant!8598 (index!36763 (_ BitVec 32))) )
))
(declare-fun lt!361157 () SeekEntryResult!8598)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806471 (= res!550594 (or (= lt!361157 (MissingZero!8598 i!1163)) (= lt!361157 (MissingVacant!8598 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43860 0))(
  ( (array!43861 (arr!21007 (Array (_ BitVec 32) (_ BitVec 64))) (size!21428 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43860)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43860 (_ BitVec 32)) SeekEntryResult!8598)

(assert (=> b!806471 (= lt!361157 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806472 () Bool)

(declare-fun res!550596 () Bool)

(assert (=> b!806472 (=> (not res!550596) (not e!446609))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806472 (= res!550596 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21428 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21007 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21428 a!3170)) (= (select (arr!21007 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806473 () Bool)

(declare-fun res!550598 () Bool)

(assert (=> b!806473 (=> (not res!550598) (not e!446609))))

(declare-datatypes ((List!14970 0))(
  ( (Nil!14967) (Cons!14966 (h!16095 (_ BitVec 64)) (t!21285 List!14970)) )
))
(declare-fun arrayNoDuplicates!0 (array!43860 (_ BitVec 32) List!14970) Bool)

(assert (=> b!806473 (= res!550598 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14967))))

(declare-fun b!806474 () Bool)

(declare-fun res!550600 () Bool)

(assert (=> b!806474 (=> (not res!550600) (not e!446605))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806474 (= res!550600 (and (= (size!21428 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21428 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21428 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806475 () Bool)

(declare-fun res!550601 () Bool)

(assert (=> b!806475 (=> (not res!550601) (not e!446605))))

(declare-fun arrayContainsKey!0 (array!43860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806475 (= res!550601 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806476 () Bool)

(declare-fun e!446607 () Bool)

(assert (=> b!806476 (= e!446607 (not true))))

(declare-fun lt!361162 () SeekEntryResult!8598)

(assert (=> b!806476 (= lt!361162 (Found!8598 index!1236))))

(declare-fun b!806477 () Bool)

(declare-fun e!446608 () Bool)

(assert (=> b!806477 (= e!446608 e!446607)))

(declare-fun res!550599 () Bool)

(assert (=> b!806477 (=> (not res!550599) (not e!446607))))

(declare-fun lt!361158 () SeekEntryResult!8598)

(declare-fun lt!361163 () SeekEntryResult!8598)

(assert (=> b!806477 (= res!550599 (and (= lt!361158 lt!361163) (= lt!361163 (Found!8598 j!153)) (= (select (arr!21007 a!3170) index!1236) (select (arr!21007 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43860 (_ BitVec 32)) SeekEntryResult!8598)

(assert (=> b!806477 (= lt!361163 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21007 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806477 (= lt!361158 (seekEntryOrOpen!0 (select (arr!21007 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!550597 () Bool)

(assert (=> start!69160 (=> (not res!550597) (not e!446605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69160 (= res!550597 (validMask!0 mask!3266))))

(assert (=> start!69160 e!446605))

(assert (=> start!69160 true))

(declare-fun array_inv!16803 (array!43860) Bool)

(assert (=> start!69160 (array_inv!16803 a!3170)))

(declare-fun b!806478 () Bool)

(declare-fun res!550604 () Bool)

(assert (=> b!806478 (=> (not res!550604) (not e!446609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43860 (_ BitVec 32)) Bool)

(assert (=> b!806478 (= res!550604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806479 () Bool)

(declare-fun res!550602 () Bool)

(assert (=> b!806479 (=> (not res!550602) (not e!446605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806479 (= res!550602 (validKeyInArray!0 (select (arr!21007 a!3170) j!153)))))

(declare-fun b!806480 () Bool)

(assert (=> b!806480 (= e!446609 e!446608)))

(declare-fun res!550595 () Bool)

(assert (=> b!806480 (=> (not res!550595) (not e!446608))))

(declare-fun lt!361160 () SeekEntryResult!8598)

(assert (=> b!806480 (= res!550595 (= lt!361160 lt!361162))))

(declare-fun lt!361159 () array!43860)

(declare-fun lt!361161 () (_ BitVec 64))

(assert (=> b!806480 (= lt!361162 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361161 lt!361159 mask!3266))))

(assert (=> b!806480 (= lt!361160 (seekEntryOrOpen!0 lt!361161 lt!361159 mask!3266))))

(assert (=> b!806480 (= lt!361161 (select (store (arr!21007 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806480 (= lt!361159 (array!43861 (store (arr!21007 a!3170) i!1163 k0!2044) (size!21428 a!3170)))))

(declare-fun b!806481 () Bool)

(declare-fun res!550603 () Bool)

(assert (=> b!806481 (=> (not res!550603) (not e!446605))))

(assert (=> b!806481 (= res!550603 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69160 res!550597) b!806474))

(assert (= (and b!806474 res!550600) b!806479))

(assert (= (and b!806479 res!550602) b!806481))

(assert (= (and b!806481 res!550603) b!806475))

(assert (= (and b!806475 res!550601) b!806471))

(assert (= (and b!806471 res!550594) b!806478))

(assert (= (and b!806478 res!550604) b!806473))

(assert (= (and b!806473 res!550598) b!806472))

(assert (= (and b!806472 res!550596) b!806480))

(assert (= (and b!806480 res!550595) b!806477))

(assert (= (and b!806477 res!550599) b!806476))

(declare-fun m!748397 () Bool)

(assert (=> b!806479 m!748397))

(assert (=> b!806479 m!748397))

(declare-fun m!748399 () Bool)

(assert (=> b!806479 m!748399))

(declare-fun m!748401 () Bool)

(assert (=> b!806480 m!748401))

(declare-fun m!748403 () Bool)

(assert (=> b!806480 m!748403))

(declare-fun m!748405 () Bool)

(assert (=> b!806480 m!748405))

(declare-fun m!748407 () Bool)

(assert (=> b!806480 m!748407))

(declare-fun m!748409 () Bool)

(assert (=> b!806472 m!748409))

(declare-fun m!748411 () Bool)

(assert (=> b!806472 m!748411))

(declare-fun m!748413 () Bool)

(assert (=> b!806471 m!748413))

(declare-fun m!748415 () Bool)

(assert (=> start!69160 m!748415))

(declare-fun m!748417 () Bool)

(assert (=> start!69160 m!748417))

(declare-fun m!748419 () Bool)

(assert (=> b!806473 m!748419))

(declare-fun m!748421 () Bool)

(assert (=> b!806478 m!748421))

(declare-fun m!748423 () Bool)

(assert (=> b!806477 m!748423))

(assert (=> b!806477 m!748397))

(assert (=> b!806477 m!748397))

(declare-fun m!748425 () Bool)

(assert (=> b!806477 m!748425))

(assert (=> b!806477 m!748397))

(declare-fun m!748427 () Bool)

(assert (=> b!806477 m!748427))

(declare-fun m!748429 () Bool)

(assert (=> b!806475 m!748429))

(declare-fun m!748431 () Bool)

(assert (=> b!806481 m!748431))

(check-sat (not b!806480) (not b!806475) (not b!806479) (not start!69160) (not b!806473) (not b!806481) (not b!806471) (not b!806477) (not b!806478))
(check-sat)
