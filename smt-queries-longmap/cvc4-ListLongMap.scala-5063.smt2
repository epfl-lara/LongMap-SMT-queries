; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68892 () Bool)

(assert start!68892)

(declare-fun b!803470 () Bool)

(declare-fun res!547993 () Bool)

(declare-fun e!445219 () Bool)

(assert (=> b!803470 (=> (not res!547993) (not e!445219))))

(declare-datatypes ((array!43682 0))(
  ( (array!43683 (arr!20921 (Array (_ BitVec 32) (_ BitVec 64))) (size!21342 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43682)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43682 (_ BitVec 32)) Bool)

(assert (=> b!803470 (= res!547993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803471 () Bool)

(declare-fun res!547999 () Bool)

(declare-fun e!445220 () Bool)

(assert (=> b!803471 (=> (not res!547999) (not e!445220))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803471 (= res!547999 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803472 () Bool)

(declare-fun res!547996 () Bool)

(assert (=> b!803472 (=> (not res!547996) (not e!445219))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803472 (= res!547996 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21342 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20921 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21342 a!3170)) (= (select (arr!20921 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803473 () Bool)

(declare-fun res!547991 () Bool)

(assert (=> b!803473 (=> (not res!547991) (not e!445219))))

(declare-datatypes ((List!14884 0))(
  ( (Nil!14881) (Cons!14880 (h!16009 (_ BitVec 64)) (t!21199 List!14884)) )
))
(declare-fun arrayNoDuplicates!0 (array!43682 (_ BitVec 32) List!14884) Bool)

(assert (=> b!803473 (= res!547991 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14881))))

(declare-fun res!547997 () Bool)

(assert (=> start!68892 (=> (not res!547997) (not e!445220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68892 (= res!547997 (validMask!0 mask!3266))))

(assert (=> start!68892 e!445220))

(assert (=> start!68892 true))

(declare-fun array_inv!16717 (array!43682) Bool)

(assert (=> start!68892 (array_inv!16717 a!3170)))

(declare-datatypes ((SeekEntryResult!8512 0))(
  ( (MissingZero!8512 (index!36416 (_ BitVec 32))) (Found!8512 (index!36417 (_ BitVec 32))) (Intermediate!8512 (undefined!9324 Bool) (index!36418 (_ BitVec 32)) (x!67254 (_ BitVec 32))) (Undefined!8512) (MissingVacant!8512 (index!36419 (_ BitVec 32))) )
))
(declare-fun lt!359628 () SeekEntryResult!8512)

(declare-fun b!803474 () Bool)

(declare-fun e!445217 () Bool)

(declare-fun lt!359625 () SeekEntryResult!8512)

(assert (=> b!803474 (= e!445217 (not (or (not (= lt!359625 lt!359628)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun lt!359626 () (_ BitVec 64))

(declare-fun lt!359627 () array!43682)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!359631 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43682 (_ BitVec 32)) SeekEntryResult!8512)

(assert (=> b!803474 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359631 vacantAfter!23 lt!359626 lt!359627 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359631 vacantBefore!23 (select (arr!20921 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27564 0))(
  ( (Unit!27565) )
))
(declare-fun lt!359630 () Unit!27564)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43682 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27564)

(assert (=> b!803474 (= lt!359630 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359631 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803474 (= lt!359631 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803475 () Bool)

(declare-fun res!548000 () Bool)

(assert (=> b!803475 (=> (not res!548000) (not e!445220))))

(assert (=> b!803475 (= res!548000 (and (= (size!21342 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21342 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21342 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803476 () Bool)

(declare-fun res!547992 () Bool)

(assert (=> b!803476 (=> (not res!547992) (not e!445220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803476 (= res!547992 (validKeyInArray!0 (select (arr!20921 a!3170) j!153)))))

(declare-fun b!803477 () Bool)

(declare-fun e!445218 () Bool)

(declare-fun e!445216 () Bool)

(assert (=> b!803477 (= e!445218 e!445216)))

(declare-fun res!547994 () Bool)

(assert (=> b!803477 (=> (not res!547994) (not e!445216))))

(declare-fun lt!359624 () SeekEntryResult!8512)

(declare-fun lt!359633 () SeekEntryResult!8512)

(assert (=> b!803477 (= res!547994 (= lt!359624 lt!359633))))

(assert (=> b!803477 (= lt!359633 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20921 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43682 (_ BitVec 32)) SeekEntryResult!8512)

(assert (=> b!803477 (= lt!359624 (seekEntryOrOpen!0 (select (arr!20921 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803478 () Bool)

(assert (=> b!803478 (= e!445220 e!445219)))

(declare-fun res!547989 () Bool)

(assert (=> b!803478 (=> (not res!547989) (not e!445219))))

(declare-fun lt!359629 () SeekEntryResult!8512)

(assert (=> b!803478 (= res!547989 (or (= lt!359629 (MissingZero!8512 i!1163)) (= lt!359629 (MissingVacant!8512 i!1163))))))

(assert (=> b!803478 (= lt!359629 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803479 () Bool)

(assert (=> b!803479 (= e!445216 e!445217)))

(declare-fun res!547998 () Bool)

(assert (=> b!803479 (=> (not res!547998) (not e!445217))))

(assert (=> b!803479 (= res!547998 (and (= lt!359633 lt!359628) (not (= (select (arr!20921 a!3170) index!1236) (select (arr!20921 a!3170) j!153)))))))

(assert (=> b!803479 (= lt!359628 (Found!8512 j!153))))

(declare-fun b!803480 () Bool)

(declare-fun res!547990 () Bool)

(assert (=> b!803480 (=> (not res!547990) (not e!445220))))

(assert (=> b!803480 (= res!547990 (validKeyInArray!0 k!2044))))

(declare-fun b!803481 () Bool)

(assert (=> b!803481 (= e!445219 e!445218)))

(declare-fun res!547995 () Bool)

(assert (=> b!803481 (=> (not res!547995) (not e!445218))))

(declare-fun lt!359632 () SeekEntryResult!8512)

(assert (=> b!803481 (= res!547995 (= lt!359632 lt!359625))))

(assert (=> b!803481 (= lt!359625 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359626 lt!359627 mask!3266))))

(assert (=> b!803481 (= lt!359632 (seekEntryOrOpen!0 lt!359626 lt!359627 mask!3266))))

(assert (=> b!803481 (= lt!359626 (select (store (arr!20921 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803481 (= lt!359627 (array!43683 (store (arr!20921 a!3170) i!1163 k!2044) (size!21342 a!3170)))))

(assert (= (and start!68892 res!547997) b!803475))

(assert (= (and b!803475 res!548000) b!803476))

(assert (= (and b!803476 res!547992) b!803480))

(assert (= (and b!803480 res!547990) b!803471))

(assert (= (and b!803471 res!547999) b!803478))

(assert (= (and b!803478 res!547989) b!803470))

(assert (= (and b!803470 res!547993) b!803473))

(assert (= (and b!803473 res!547991) b!803472))

(assert (= (and b!803472 res!547996) b!803481))

(assert (= (and b!803481 res!547995) b!803477))

(assert (= (and b!803477 res!547994) b!803479))

(assert (= (and b!803479 res!547998) b!803474))

(declare-fun m!745203 () Bool)

(assert (=> b!803471 m!745203))

(declare-fun m!745205 () Bool)

(assert (=> b!803470 m!745205))

(declare-fun m!745207 () Bool)

(assert (=> b!803474 m!745207))

(assert (=> b!803474 m!745207))

(declare-fun m!745209 () Bool)

(assert (=> b!803474 m!745209))

(declare-fun m!745211 () Bool)

(assert (=> b!803474 m!745211))

(declare-fun m!745213 () Bool)

(assert (=> b!803474 m!745213))

(declare-fun m!745215 () Bool)

(assert (=> b!803474 m!745215))

(assert (=> b!803476 m!745207))

(assert (=> b!803476 m!745207))

(declare-fun m!745217 () Bool)

(assert (=> b!803476 m!745217))

(declare-fun m!745219 () Bool)

(assert (=> b!803480 m!745219))

(declare-fun m!745221 () Bool)

(assert (=> b!803472 m!745221))

(declare-fun m!745223 () Bool)

(assert (=> b!803472 m!745223))

(declare-fun m!745225 () Bool)

(assert (=> b!803478 m!745225))

(declare-fun m!745227 () Bool)

(assert (=> b!803481 m!745227))

(declare-fun m!745229 () Bool)

(assert (=> b!803481 m!745229))

(declare-fun m!745231 () Bool)

(assert (=> b!803481 m!745231))

(declare-fun m!745233 () Bool)

(assert (=> b!803481 m!745233))

(declare-fun m!745235 () Bool)

(assert (=> b!803473 m!745235))

(assert (=> b!803477 m!745207))

(assert (=> b!803477 m!745207))

(declare-fun m!745237 () Bool)

(assert (=> b!803477 m!745237))

(assert (=> b!803477 m!745207))

(declare-fun m!745239 () Bool)

(assert (=> b!803477 m!745239))

(declare-fun m!745241 () Bool)

(assert (=> b!803479 m!745241))

(assert (=> b!803479 m!745207))

(declare-fun m!745243 () Bool)

(assert (=> start!68892 m!745243))

(declare-fun m!745245 () Bool)

(assert (=> start!68892 m!745245))

(push 1)

(assert (not b!803473))

(assert (not b!803480))

