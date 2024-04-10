; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68618 () Bool)

(assert start!68618)

(declare-fun b!798480 () Bool)

(declare-fun e!442909 () Bool)

(declare-fun e!442910 () Bool)

(assert (=> b!798480 (= e!442909 e!442910)))

(declare-fun res!543001 () Bool)

(assert (=> b!798480 (=> (not res!543001) (not e!442910))))

(declare-datatypes ((SeekEntryResult!8375 0))(
  ( (MissingZero!8375 (index!35868 (_ BitVec 32))) (Found!8375 (index!35869 (_ BitVec 32))) (Intermediate!8375 (undefined!9187 Bool) (index!35870 (_ BitVec 32)) (x!66757 (_ BitVec 32))) (Undefined!8375) (MissingVacant!8375 (index!35871 (_ BitVec 32))) )
))
(declare-fun lt!356442 () SeekEntryResult!8375)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798480 (= res!543001 (or (= lt!356442 (MissingZero!8375 i!1163)) (= lt!356442 (MissingVacant!8375 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43408 0))(
  ( (array!43409 (arr!20784 (Array (_ BitVec 32) (_ BitVec 64))) (size!21205 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43408)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43408 (_ BitVec 32)) SeekEntryResult!8375)

(assert (=> b!798480 (= lt!356442 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798481 () Bool)

(declare-fun res!542999 () Bool)

(assert (=> b!798481 (=> (not res!542999) (not e!442909))))

(declare-fun arrayContainsKey!0 (array!43408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798481 (= res!542999 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798482 () Bool)

(declare-fun res!543007 () Bool)

(assert (=> b!798482 (=> (not res!543007) (not e!442909))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798482 (= res!543007 (validKeyInArray!0 (select (arr!20784 a!3170) j!153)))))

(declare-fun b!798484 () Bool)

(declare-fun e!442907 () Bool)

(assert (=> b!798484 (= e!442910 e!442907)))

(declare-fun res!543004 () Bool)

(assert (=> b!798484 (=> (not res!543004) (not e!442907))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356441 () array!43408)

(declare-fun lt!356440 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43408 (_ BitVec 32)) SeekEntryResult!8375)

(assert (=> b!798484 (= res!543004 (= (seekEntryOrOpen!0 lt!356440 lt!356441 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356440 lt!356441 mask!3266)))))

(assert (=> b!798484 (= lt!356440 (select (store (arr!20784 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798484 (= lt!356441 (array!43409 (store (arr!20784 a!3170) i!1163 k!2044) (size!21205 a!3170)))))

(declare-fun b!798485 () Bool)

(declare-fun res!543003 () Bool)

(assert (=> b!798485 (=> (not res!543003) (not e!442909))))

(assert (=> b!798485 (= res!543003 (and (= (size!21205 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21205 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21205 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798486 () Bool)

(declare-fun res!543000 () Bool)

(assert (=> b!798486 (=> (not res!543000) (not e!442910))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798486 (= res!543000 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21205 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20784 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21205 a!3170)) (= (select (arr!20784 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798487 () Bool)

(declare-fun res!543008 () Bool)

(assert (=> b!798487 (=> (not res!543008) (not e!442910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43408 (_ BitVec 32)) Bool)

(assert (=> b!798487 (= res!543008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798488 () Bool)

(declare-fun res!543005 () Bool)

(assert (=> b!798488 (=> (not res!543005) (not e!442910))))

(declare-datatypes ((List!14747 0))(
  ( (Nil!14744) (Cons!14743 (h!15872 (_ BitVec 64)) (t!21062 List!14747)) )
))
(declare-fun arrayNoDuplicates!0 (array!43408 (_ BitVec 32) List!14747) Bool)

(assert (=> b!798488 (= res!543005 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14744))))

(declare-fun b!798489 () Bool)

(declare-fun res!543002 () Bool)

(assert (=> b!798489 (=> (not res!543002) (not e!442909))))

(assert (=> b!798489 (= res!543002 (validKeyInArray!0 k!2044))))

(declare-fun b!798483 () Bool)

(assert (=> b!798483 (= e!442907 false)))

(declare-fun lt!356443 () SeekEntryResult!8375)

(assert (=> b!798483 (= lt!356443 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20784 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!356444 () SeekEntryResult!8375)

(assert (=> b!798483 (= lt!356444 (seekEntryOrOpen!0 (select (arr!20784 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!543006 () Bool)

(assert (=> start!68618 (=> (not res!543006) (not e!442909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68618 (= res!543006 (validMask!0 mask!3266))))

(assert (=> start!68618 e!442909))

(assert (=> start!68618 true))

(declare-fun array_inv!16580 (array!43408) Bool)

(assert (=> start!68618 (array_inv!16580 a!3170)))

(assert (= (and start!68618 res!543006) b!798485))

(assert (= (and b!798485 res!543003) b!798482))

(assert (= (and b!798482 res!543007) b!798489))

(assert (= (and b!798489 res!543002) b!798481))

(assert (= (and b!798481 res!542999) b!798480))

(assert (= (and b!798480 res!543001) b!798487))

(assert (= (and b!798487 res!543008) b!798488))

(assert (= (and b!798488 res!543005) b!798486))

(assert (= (and b!798486 res!543000) b!798484))

(assert (= (and b!798484 res!543004) b!798483))

(declare-fun m!739391 () Bool)

(assert (=> b!798481 m!739391))

(declare-fun m!739393 () Bool)

(assert (=> b!798482 m!739393))

(assert (=> b!798482 m!739393))

(declare-fun m!739395 () Bool)

(assert (=> b!798482 m!739395))

(declare-fun m!739397 () Bool)

(assert (=> b!798487 m!739397))

(declare-fun m!739399 () Bool)

(assert (=> b!798480 m!739399))

(declare-fun m!739401 () Bool)

(assert (=> b!798484 m!739401))

(declare-fun m!739403 () Bool)

(assert (=> b!798484 m!739403))

(declare-fun m!739405 () Bool)

(assert (=> b!798484 m!739405))

(declare-fun m!739407 () Bool)

(assert (=> b!798484 m!739407))

(assert (=> b!798483 m!739393))

(assert (=> b!798483 m!739393))

(declare-fun m!739409 () Bool)

(assert (=> b!798483 m!739409))

(assert (=> b!798483 m!739393))

(declare-fun m!739411 () Bool)

(assert (=> b!798483 m!739411))

(declare-fun m!739413 () Bool)

(assert (=> b!798488 m!739413))

(declare-fun m!739415 () Bool)

(assert (=> b!798489 m!739415))

(declare-fun m!739417 () Bool)

(assert (=> start!68618 m!739417))

(declare-fun m!739419 () Bool)

(assert (=> start!68618 m!739419))

(declare-fun m!739421 () Bool)

(assert (=> b!798486 m!739421))

(declare-fun m!739423 () Bool)

(assert (=> b!798486 m!739423))

(push 1)

(assert (not b!798484))

(assert (not b!798489))

(assert (not b!798480))

(assert (not b!798482))

(assert (not b!798488))

(assert (not start!68618))

(assert (not b!798487))

(assert (not b!798481))

(assert (not b!798483))

(check-sat)

