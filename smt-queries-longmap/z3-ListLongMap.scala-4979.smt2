; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68364 () Bool)

(assert start!68364)

(declare-fun b!794380 () Bool)

(declare-fun res!539046 () Bool)

(declare-fun e!441034 () Bool)

(assert (=> b!794380 (=> (not res!539046) (not e!441034))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43171 0))(
  ( (array!43172 (arr!20666 (Array (_ BitVec 32) (_ BitVec 64))) (size!21087 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43171)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794380 (= res!539046 (and (= (size!21087 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21087 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21087 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!539043 () Bool)

(assert (=> start!68364 (=> (not res!539043) (not e!441034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68364 (= res!539043 (validMask!0 mask!3266))))

(assert (=> start!68364 e!441034))

(assert (=> start!68364 true))

(declare-fun array_inv!16549 (array!43171) Bool)

(assert (=> start!68364 (array_inv!16549 a!3170)))

(declare-fun b!794381 () Bool)

(declare-fun e!441036 () Bool)

(declare-fun e!441037 () Bool)

(assert (=> b!794381 (= e!441036 e!441037)))

(declare-fun res!539049 () Bool)

(assert (=> b!794381 (=> (not res!539049) (not e!441037))))

(declare-fun lt!353991 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!353992 () array!43171)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8254 0))(
  ( (MissingZero!8254 (index!35384 (_ BitVec 32))) (Found!8254 (index!35385 (_ BitVec 32))) (Intermediate!8254 (undefined!9066 Bool) (index!35386 (_ BitVec 32)) (x!66319 (_ BitVec 32))) (Undefined!8254) (MissingVacant!8254 (index!35387 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43171 (_ BitVec 32)) SeekEntryResult!8254)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43171 (_ BitVec 32)) SeekEntryResult!8254)

(assert (=> b!794381 (= res!539049 (= (seekEntryOrOpen!0 lt!353991 lt!353992 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353991 lt!353992 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!794381 (= lt!353991 (select (store (arr!20666 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794381 (= lt!353992 (array!43172 (store (arr!20666 a!3170) i!1163 k0!2044) (size!21087 a!3170)))))

(declare-fun b!794382 () Bool)

(declare-fun res!539040 () Bool)

(assert (=> b!794382 (=> (not res!539040) (not e!441037))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794382 (= res!539040 (= (seekEntryOrOpen!0 (select (arr!20666 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20666 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!794383 () Bool)

(declare-fun res!539048 () Bool)

(assert (=> b!794383 (=> (not res!539048) (not e!441034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794383 (= res!539048 (validKeyInArray!0 (select (arr!20666 a!3170) j!153)))))

(declare-fun b!794384 () Bool)

(declare-fun res!539042 () Bool)

(assert (=> b!794384 (=> (not res!539042) (not e!441036))))

(declare-datatypes ((List!14668 0))(
  ( (Nil!14665) (Cons!14664 (h!15793 (_ BitVec 64)) (t!20974 List!14668)) )
))
(declare-fun arrayNoDuplicates!0 (array!43171 (_ BitVec 32) List!14668) Bool)

(assert (=> b!794384 (= res!539042 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14665))))

(declare-fun b!794385 () Bool)

(declare-fun res!539045 () Bool)

(assert (=> b!794385 (=> (not res!539045) (not e!441034))))

(assert (=> b!794385 (= res!539045 (validKeyInArray!0 k0!2044))))

(declare-fun b!794386 () Bool)

(assert (=> b!794386 (= e!441034 e!441036)))

(declare-fun res!539047 () Bool)

(assert (=> b!794386 (=> (not res!539047) (not e!441036))))

(declare-fun lt!353993 () SeekEntryResult!8254)

(assert (=> b!794386 (= res!539047 (or (= lt!353993 (MissingZero!8254 i!1163)) (= lt!353993 (MissingVacant!8254 i!1163))))))

(assert (=> b!794386 (= lt!353993 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794387 () Bool)

(declare-fun res!539039 () Bool)

(assert (=> b!794387 (=> (not res!539039) (not e!441036))))

(assert (=> b!794387 (= res!539039 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21087 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20666 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21087 a!3170)) (= (select (arr!20666 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794388 () Bool)

(assert (=> b!794388 (= e!441037 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!794389 () Bool)

(declare-fun res!539044 () Bool)

(assert (=> b!794389 (=> (not res!539044) (not e!441036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43171 (_ BitVec 32)) Bool)

(assert (=> b!794389 (= res!539044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794390 () Bool)

(declare-fun res!539041 () Bool)

(assert (=> b!794390 (=> (not res!539041) (not e!441034))))

(declare-fun arrayContainsKey!0 (array!43171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794390 (= res!539041 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68364 res!539043) b!794380))

(assert (= (and b!794380 res!539046) b!794383))

(assert (= (and b!794383 res!539048) b!794385))

(assert (= (and b!794385 res!539045) b!794390))

(assert (= (and b!794390 res!539041) b!794386))

(assert (= (and b!794386 res!539047) b!794389))

(assert (= (and b!794389 res!539044) b!794384))

(assert (= (and b!794384 res!539042) b!794387))

(assert (= (and b!794387 res!539039) b!794381))

(assert (= (and b!794381 res!539049) b!794382))

(assert (= (and b!794382 res!539040) b!794388))

(declare-fun m!734443 () Bool)

(assert (=> b!794385 m!734443))

(declare-fun m!734445 () Bool)

(assert (=> start!68364 m!734445))

(declare-fun m!734447 () Bool)

(assert (=> start!68364 m!734447))

(declare-fun m!734449 () Bool)

(assert (=> b!794383 m!734449))

(assert (=> b!794383 m!734449))

(declare-fun m!734451 () Bool)

(assert (=> b!794383 m!734451))

(assert (=> b!794382 m!734449))

(assert (=> b!794382 m!734449))

(declare-fun m!734453 () Bool)

(assert (=> b!794382 m!734453))

(assert (=> b!794382 m!734449))

(declare-fun m!734455 () Bool)

(assert (=> b!794382 m!734455))

(declare-fun m!734457 () Bool)

(assert (=> b!794390 m!734457))

(declare-fun m!734459 () Bool)

(assert (=> b!794386 m!734459))

(declare-fun m!734461 () Bool)

(assert (=> b!794387 m!734461))

(declare-fun m!734463 () Bool)

(assert (=> b!794387 m!734463))

(declare-fun m!734465 () Bool)

(assert (=> b!794381 m!734465))

(declare-fun m!734467 () Bool)

(assert (=> b!794381 m!734467))

(declare-fun m!734469 () Bool)

(assert (=> b!794381 m!734469))

(declare-fun m!734471 () Bool)

(assert (=> b!794381 m!734471))

(declare-fun m!734473 () Bool)

(assert (=> b!794389 m!734473))

(declare-fun m!734475 () Bool)

(assert (=> b!794384 m!734475))

(check-sat (not start!68364) (not b!794389) (not b!794384) (not b!794390) (not b!794383) (not b!794381) (not b!794382) (not b!794385) (not b!794386))
(check-sat)
