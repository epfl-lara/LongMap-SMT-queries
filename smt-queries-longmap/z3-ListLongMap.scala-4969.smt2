; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68448 () Bool)

(assert start!68448)

(declare-fun b!794431 () Bool)

(declare-fun res!538577 () Bool)

(declare-fun e!441303 () Bool)

(assert (=> b!794431 (=> (not res!538577) (not e!441303))))

(declare-datatypes ((array!43112 0))(
  ( (array!43113 (arr!20632 (Array (_ BitVec 32) (_ BitVec 64))) (size!21052 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43112)

(declare-datatypes ((List!14502 0))(
  ( (Nil!14499) (Cons!14498 (h!15633 (_ BitVec 64)) (t!20809 List!14502)) )
))
(declare-fun arrayNoDuplicates!0 (array!43112 (_ BitVec 32) List!14502) Bool)

(assert (=> b!794431 (= res!538577 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14499))))

(declare-fun b!794432 () Bool)

(declare-fun res!538579 () Bool)

(assert (=> b!794432 (=> (not res!538579) (not e!441303))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794432 (= res!538579 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21052 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20632 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21052 a!3170)) (= (select (arr!20632 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794433 () Bool)

(declare-fun res!538578 () Bool)

(declare-fun e!441304 () Bool)

(assert (=> b!794433 (=> (not res!538578) (not e!441304))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794433 (= res!538578 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!538576 () Bool)

(assert (=> start!68448 (=> (not res!538576) (not e!441304))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68448 (= res!538576 (validMask!0 mask!3266))))

(assert (=> start!68448 e!441304))

(assert (=> start!68448 true))

(declare-fun array_inv!16491 (array!43112) Bool)

(assert (=> start!68448 (array_inv!16491 a!3170)))

(declare-fun b!794434 () Bool)

(declare-fun res!538580 () Bool)

(assert (=> b!794434 (=> (not res!538580) (not e!441304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794434 (= res!538580 (validKeyInArray!0 k0!2044))))

(declare-fun b!794435 () Bool)

(declare-fun res!538581 () Bool)

(assert (=> b!794435 (=> (not res!538581) (not e!441304))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794435 (= res!538581 (validKeyInArray!0 (select (arr!20632 a!3170) j!153)))))

(declare-fun b!794436 () Bool)

(assert (=> b!794436 (= e!441304 e!441303)))

(declare-fun res!538584 () Bool)

(assert (=> b!794436 (=> (not res!538584) (not e!441303))))

(declare-datatypes ((SeekEntryResult!8179 0))(
  ( (MissingZero!8179 (index!35084 (_ BitVec 32))) (Found!8179 (index!35085 (_ BitVec 32))) (Intermediate!8179 (undefined!8991 Bool) (index!35086 (_ BitVec 32)) (x!66180 (_ BitVec 32))) (Undefined!8179) (MissingVacant!8179 (index!35087 (_ BitVec 32))) )
))
(declare-fun lt!354113 () SeekEntryResult!8179)

(assert (=> b!794436 (= res!538584 (or (= lt!354113 (MissingZero!8179 i!1163)) (= lt!354113 (MissingVacant!8179 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43112 (_ BitVec 32)) SeekEntryResult!8179)

(assert (=> b!794436 (= lt!354113 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794437 () Bool)

(assert (=> b!794437 (= e!441303 false)))

(declare-fun lt!354115 () array!43112)

(declare-fun lt!354114 () (_ BitVec 64))

(declare-fun lt!354112 () SeekEntryResult!8179)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43112 (_ BitVec 32)) SeekEntryResult!8179)

(assert (=> b!794437 (= lt!354112 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354114 lt!354115 mask!3266))))

(declare-fun lt!354111 () SeekEntryResult!8179)

(assert (=> b!794437 (= lt!354111 (seekEntryOrOpen!0 lt!354114 lt!354115 mask!3266))))

(assert (=> b!794437 (= lt!354114 (select (store (arr!20632 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794437 (= lt!354115 (array!43113 (store (arr!20632 a!3170) i!1163 k0!2044) (size!21052 a!3170)))))

(declare-fun b!794438 () Bool)

(declare-fun res!538583 () Bool)

(assert (=> b!794438 (=> (not res!538583) (not e!441303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43112 (_ BitVec 32)) Bool)

(assert (=> b!794438 (= res!538583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794439 () Bool)

(declare-fun res!538582 () Bool)

(assert (=> b!794439 (=> (not res!538582) (not e!441304))))

(assert (=> b!794439 (= res!538582 (and (= (size!21052 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21052 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21052 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68448 res!538576) b!794439))

(assert (= (and b!794439 res!538582) b!794435))

(assert (= (and b!794435 res!538581) b!794434))

(assert (= (and b!794434 res!538580) b!794433))

(assert (= (and b!794433 res!538578) b!794436))

(assert (= (and b!794436 res!538584) b!794438))

(assert (= (and b!794438 res!538583) b!794431))

(assert (= (and b!794431 res!538577) b!794432))

(assert (= (and b!794432 res!538579) b!794437))

(declare-fun m!735353 () Bool)

(assert (=> start!68448 m!735353))

(declare-fun m!735355 () Bool)

(assert (=> start!68448 m!735355))

(declare-fun m!735357 () Bool)

(assert (=> b!794438 m!735357))

(declare-fun m!735359 () Bool)

(assert (=> b!794432 m!735359))

(declare-fun m!735361 () Bool)

(assert (=> b!794432 m!735361))

(declare-fun m!735363 () Bool)

(assert (=> b!794437 m!735363))

(declare-fun m!735365 () Bool)

(assert (=> b!794437 m!735365))

(declare-fun m!735367 () Bool)

(assert (=> b!794437 m!735367))

(declare-fun m!735369 () Bool)

(assert (=> b!794437 m!735369))

(declare-fun m!735371 () Bool)

(assert (=> b!794431 m!735371))

(declare-fun m!735373 () Bool)

(assert (=> b!794433 m!735373))

(declare-fun m!735375 () Bool)

(assert (=> b!794434 m!735375))

(declare-fun m!735377 () Bool)

(assert (=> b!794436 m!735377))

(declare-fun m!735379 () Bool)

(assert (=> b!794435 m!735379))

(assert (=> b!794435 m!735379))

(declare-fun m!735381 () Bool)

(assert (=> b!794435 m!735381))

(check-sat (not b!794436) (not b!794433) (not b!794431) (not b!794438) (not b!794434) (not b!794435) (not start!68448) (not b!794437))
(check-sat)
