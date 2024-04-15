; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68292 () Bool)

(assert start!68292)

(declare-fun b!793361 () Bool)

(declare-fun res!538025 () Bool)

(declare-fun e!440667 () Bool)

(assert (=> b!793361 (=> (not res!538025) (not e!440667))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793361 (= res!538025 (validKeyInArray!0 k0!2044))))

(declare-fun b!793362 () Bool)

(declare-fun res!538029 () Bool)

(declare-fun e!440666 () Bool)

(assert (=> b!793362 (=> (not res!538029) (not e!440666))))

(declare-datatypes ((array!43099 0))(
  ( (array!43100 (arr!20630 (Array (_ BitVec 32) (_ BitVec 64))) (size!21051 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43099)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43099 (_ BitVec 32)) Bool)

(assert (=> b!793362 (= res!538029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793363 () Bool)

(declare-fun res!538021 () Bool)

(assert (=> b!793363 (=> (not res!538021) (not e!440667))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793363 (= res!538021 (validKeyInArray!0 (select (arr!20630 a!3170) j!153)))))

(declare-fun b!793365 () Bool)

(declare-fun res!538024 () Bool)

(assert (=> b!793365 (=> (not res!538024) (not e!440666))))

(declare-datatypes ((List!14632 0))(
  ( (Nil!14629) (Cons!14628 (h!15757 (_ BitVec 64)) (t!20938 List!14632)) )
))
(declare-fun arrayNoDuplicates!0 (array!43099 (_ BitVec 32) List!14632) Bool)

(assert (=> b!793365 (= res!538024 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14629))))

(declare-fun b!793366 () Bool)

(declare-fun res!538028 () Bool)

(assert (=> b!793366 (=> (not res!538028) (not e!440667))))

(declare-fun arrayContainsKey!0 (array!43099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793366 (= res!538028 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793367 () Bool)

(assert (=> b!793367 (= e!440667 e!440666)))

(declare-fun res!538026 () Bool)

(assert (=> b!793367 (=> (not res!538026) (not e!440666))))

(declare-datatypes ((SeekEntryResult!8218 0))(
  ( (MissingZero!8218 (index!35240 (_ BitVec 32))) (Found!8218 (index!35241 (_ BitVec 32))) (Intermediate!8218 (undefined!9030 Bool) (index!35242 (_ BitVec 32)) (x!66187 (_ BitVec 32))) (Undefined!8218) (MissingVacant!8218 (index!35243 (_ BitVec 32))) )
))
(declare-fun lt!353524 () SeekEntryResult!8218)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793367 (= res!538026 (or (= lt!353524 (MissingZero!8218 i!1163)) (= lt!353524 (MissingVacant!8218 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43099 (_ BitVec 32)) SeekEntryResult!8218)

(assert (=> b!793367 (= lt!353524 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793368 () Bool)

(declare-fun res!538020 () Bool)

(assert (=> b!793368 (=> (not res!538020) (not e!440666))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793368 (= res!538020 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21051 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20630 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21051 a!3170)) (= (select (arr!20630 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793369 () Bool)

(declare-fun e!440668 () Bool)

(assert (=> b!793369 (= e!440668 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!793370 () Bool)

(declare-fun res!538027 () Bool)

(assert (=> b!793370 (=> (not res!538027) (not e!440667))))

(assert (=> b!793370 (= res!538027 (and (= (size!21051 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21051 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21051 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!538023 () Bool)

(assert (=> start!68292 (=> (not res!538023) (not e!440667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68292 (= res!538023 (validMask!0 mask!3266))))

(assert (=> start!68292 e!440667))

(assert (=> start!68292 true))

(declare-fun array_inv!16513 (array!43099) Bool)

(assert (=> start!68292 (array_inv!16513 a!3170)))

(declare-fun b!793364 () Bool)

(assert (=> b!793364 (= e!440666 e!440668)))

(declare-fun res!538022 () Bool)

(assert (=> b!793364 (=> (not res!538022) (not e!440668))))

(declare-fun lt!353525 () array!43099)

(declare-fun lt!353523 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43099 (_ BitVec 32)) SeekEntryResult!8218)

(assert (=> b!793364 (= res!538022 (= (seekEntryOrOpen!0 lt!353523 lt!353525 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353523 lt!353525 mask!3266)))))

(assert (=> b!793364 (= lt!353523 (select (store (arr!20630 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793364 (= lt!353525 (array!43100 (store (arr!20630 a!3170) i!1163 k0!2044) (size!21051 a!3170)))))

(assert (= (and start!68292 res!538023) b!793370))

(assert (= (and b!793370 res!538027) b!793363))

(assert (= (and b!793363 res!538021) b!793361))

(assert (= (and b!793361 res!538025) b!793366))

(assert (= (and b!793366 res!538028) b!793367))

(assert (= (and b!793367 res!538026) b!793362))

(assert (= (and b!793362 res!538029) b!793365))

(assert (= (and b!793365 res!538024) b!793368))

(assert (= (and b!793368 res!538020) b!793364))

(assert (= (and b!793364 res!538022) b!793369))

(declare-fun m!733351 () Bool)

(assert (=> b!793367 m!733351))

(declare-fun m!733353 () Bool)

(assert (=> b!793364 m!733353))

(declare-fun m!733355 () Bool)

(assert (=> b!793364 m!733355))

(declare-fun m!733357 () Bool)

(assert (=> b!793364 m!733357))

(declare-fun m!733359 () Bool)

(assert (=> b!793364 m!733359))

(declare-fun m!733361 () Bool)

(assert (=> b!793363 m!733361))

(assert (=> b!793363 m!733361))

(declare-fun m!733363 () Bool)

(assert (=> b!793363 m!733363))

(declare-fun m!733365 () Bool)

(assert (=> b!793361 m!733365))

(declare-fun m!733367 () Bool)

(assert (=> b!793365 m!733367))

(declare-fun m!733369 () Bool)

(assert (=> start!68292 m!733369))

(declare-fun m!733371 () Bool)

(assert (=> start!68292 m!733371))

(declare-fun m!733373 () Bool)

(assert (=> b!793366 m!733373))

(declare-fun m!733375 () Bool)

(assert (=> b!793368 m!733375))

(declare-fun m!733377 () Bool)

(assert (=> b!793368 m!733377))

(declare-fun m!733379 () Bool)

(assert (=> b!793362 m!733379))

(check-sat (not b!793362) (not b!793367) (not b!793364) (not b!793361) (not b!793365) (not b!793363) (not b!793366) (not start!68292))
(check-sat)
