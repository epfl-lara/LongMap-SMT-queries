; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68442 () Bool)

(assert start!68442)

(declare-fun b!794351 () Bool)

(declare-fun res!538502 () Bool)

(declare-fun e!441276 () Bool)

(assert (=> b!794351 (=> (not res!538502) (not e!441276))))

(declare-datatypes ((array!43106 0))(
  ( (array!43107 (arr!20629 (Array (_ BitVec 32) (_ BitVec 64))) (size!21049 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43106)

(declare-datatypes ((List!14499 0))(
  ( (Nil!14496) (Cons!14495 (h!15630 (_ BitVec 64)) (t!20806 List!14499)) )
))
(declare-fun arrayNoDuplicates!0 (array!43106 (_ BitVec 32) List!14499) Bool)

(assert (=> b!794351 (= res!538502 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14496))))

(declare-fun b!794352 () Bool)

(declare-fun res!538496 () Bool)

(declare-fun e!441275 () Bool)

(assert (=> b!794352 (=> (not res!538496) (not e!441275))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794352 (= res!538496 (validKeyInArray!0 (select (arr!20629 a!3170) j!153)))))

(declare-fun b!794353 () Bool)

(assert (=> b!794353 (= e!441276 false)))

(declare-datatypes ((SeekEntryResult!8176 0))(
  ( (MissingZero!8176 (index!35072 (_ BitVec 32))) (Found!8176 (index!35073 (_ BitVec 32))) (Intermediate!8176 (undefined!8988 Bool) (index!35074 (_ BitVec 32)) (x!66169 (_ BitVec 32))) (Undefined!8176) (MissingVacant!8176 (index!35075 (_ BitVec 32))) )
))
(declare-fun lt!354070 () SeekEntryResult!8176)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354067 () (_ BitVec 64))

(declare-fun lt!354068 () array!43106)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43106 (_ BitVec 32)) SeekEntryResult!8176)

(assert (=> b!794353 (= lt!354070 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354067 lt!354068 mask!3266))))

(declare-fun lt!354069 () SeekEntryResult!8176)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43106 (_ BitVec 32)) SeekEntryResult!8176)

(assert (=> b!794353 (= lt!354069 (seekEntryOrOpen!0 lt!354067 lt!354068 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794353 (= lt!354067 (select (store (arr!20629 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794353 (= lt!354068 (array!43107 (store (arr!20629 a!3170) i!1163 k0!2044) (size!21049 a!3170)))))

(declare-fun b!794354 () Bool)

(assert (=> b!794354 (= e!441275 e!441276)))

(declare-fun res!538499 () Bool)

(assert (=> b!794354 (=> (not res!538499) (not e!441276))))

(declare-fun lt!354066 () SeekEntryResult!8176)

(assert (=> b!794354 (= res!538499 (or (= lt!354066 (MissingZero!8176 i!1163)) (= lt!354066 (MissingVacant!8176 i!1163))))))

(assert (=> b!794354 (= lt!354066 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794355 () Bool)

(declare-fun res!538495 () Bool)

(assert (=> b!794355 (=> (not res!538495) (not e!441276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43106 (_ BitVec 32)) Bool)

(assert (=> b!794355 (= res!538495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794356 () Bool)

(declare-fun res!538503 () Bool)

(assert (=> b!794356 (=> (not res!538503) (not e!441275))))

(assert (=> b!794356 (= res!538503 (validKeyInArray!0 k0!2044))))

(declare-fun res!538497 () Bool)

(assert (=> start!68442 (=> (not res!538497) (not e!441275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68442 (= res!538497 (validMask!0 mask!3266))))

(assert (=> start!68442 e!441275))

(assert (=> start!68442 true))

(declare-fun array_inv!16488 (array!43106) Bool)

(assert (=> start!68442 (array_inv!16488 a!3170)))

(declare-fun b!794350 () Bool)

(declare-fun res!538501 () Bool)

(assert (=> b!794350 (=> (not res!538501) (not e!441276))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794350 (= res!538501 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21049 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20629 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21049 a!3170)) (= (select (arr!20629 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794357 () Bool)

(declare-fun res!538500 () Bool)

(assert (=> b!794357 (=> (not res!538500) (not e!441275))))

(assert (=> b!794357 (= res!538500 (and (= (size!21049 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21049 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21049 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794358 () Bool)

(declare-fun res!538498 () Bool)

(assert (=> b!794358 (=> (not res!538498) (not e!441275))))

(declare-fun arrayContainsKey!0 (array!43106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794358 (= res!538498 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68442 res!538497) b!794357))

(assert (= (and b!794357 res!538500) b!794352))

(assert (= (and b!794352 res!538496) b!794356))

(assert (= (and b!794356 res!538503) b!794358))

(assert (= (and b!794358 res!538498) b!794354))

(assert (= (and b!794354 res!538499) b!794355))

(assert (= (and b!794355 res!538495) b!794351))

(assert (= (and b!794351 res!538502) b!794350))

(assert (= (and b!794350 res!538501) b!794353))

(declare-fun m!735263 () Bool)

(assert (=> b!794350 m!735263))

(declare-fun m!735265 () Bool)

(assert (=> b!794350 m!735265))

(declare-fun m!735267 () Bool)

(assert (=> b!794358 m!735267))

(declare-fun m!735269 () Bool)

(assert (=> b!794355 m!735269))

(declare-fun m!735271 () Bool)

(assert (=> b!794352 m!735271))

(assert (=> b!794352 m!735271))

(declare-fun m!735273 () Bool)

(assert (=> b!794352 m!735273))

(declare-fun m!735275 () Bool)

(assert (=> b!794351 m!735275))

(declare-fun m!735277 () Bool)

(assert (=> start!68442 m!735277))

(declare-fun m!735279 () Bool)

(assert (=> start!68442 m!735279))

(declare-fun m!735281 () Bool)

(assert (=> b!794353 m!735281))

(declare-fun m!735283 () Bool)

(assert (=> b!794353 m!735283))

(declare-fun m!735285 () Bool)

(assert (=> b!794353 m!735285))

(declare-fun m!735287 () Bool)

(assert (=> b!794353 m!735287))

(declare-fun m!735289 () Bool)

(assert (=> b!794356 m!735289))

(declare-fun m!735291 () Bool)

(assert (=> b!794354 m!735291))

(check-sat (not b!794356) (not b!794352) (not b!794353) (not b!794355) (not start!68442) (not b!794351) (not b!794358) (not b!794354))
(check-sat)
