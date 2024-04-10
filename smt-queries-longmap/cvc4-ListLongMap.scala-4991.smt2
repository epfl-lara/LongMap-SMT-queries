; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68460 () Bool)

(assert start!68460)

(declare-fun b!795795 () Bool)

(declare-fun e!441646 () Bool)

(declare-fun e!441644 () Bool)

(assert (=> b!795795 (= e!441646 e!441644)))

(declare-fun res!540314 () Bool)

(assert (=> b!795795 (=> (not res!540314) (not e!441644))))

(declare-datatypes ((array!43250 0))(
  ( (array!43251 (arr!20705 (Array (_ BitVec 32) (_ BitVec 64))) (size!21126 (_ BitVec 32))) )
))
(declare-fun lt!354754 () array!43250)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354753 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8296 0))(
  ( (MissingZero!8296 (index!35552 (_ BitVec 32))) (Found!8296 (index!35553 (_ BitVec 32))) (Intermediate!8296 (undefined!9108 Bool) (index!35554 (_ BitVec 32)) (x!66462 (_ BitVec 32))) (Undefined!8296) (MissingVacant!8296 (index!35555 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43250 (_ BitVec 32)) SeekEntryResult!8296)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43250 (_ BitVec 32)) SeekEntryResult!8296)

(assert (=> b!795795 (= res!540314 (= (seekEntryOrOpen!0 lt!354753 lt!354754 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354753 lt!354754 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43250)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795795 (= lt!354753 (select (store (arr!20705 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795795 (= lt!354754 (array!43251 (store (arr!20705 a!3170) i!1163 k!2044) (size!21126 a!3170)))))

(declare-fun b!795796 () Bool)

(declare-fun res!540315 () Bool)

(declare-fun e!441645 () Bool)

(assert (=> b!795796 (=> (not res!540315) (not e!441645))))

(assert (=> b!795796 (= res!540315 (and (= (size!21126 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21126 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21126 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795797 () Bool)

(declare-fun res!540318 () Bool)

(assert (=> b!795797 (=> (not res!540318) (not e!441645))))

(declare-fun arrayContainsKey!0 (array!43250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795797 (= res!540318 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun lt!354751 () SeekEntryResult!8296)

(declare-fun b!795798 () Bool)

(declare-fun lt!354752 () SeekEntryResult!8296)

(assert (=> b!795798 (= e!441644 (and (= lt!354751 lt!354752) (= lt!354752 (Found!8296 j!153)) (= (select (arr!20705 a!3170) index!1236) (select (arr!20705 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795798 (= lt!354752 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20705 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795798 (= lt!354751 (seekEntryOrOpen!0 (select (arr!20705 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795799 () Bool)

(assert (=> b!795799 (= e!441645 e!441646)))

(declare-fun res!540316 () Bool)

(assert (=> b!795799 (=> (not res!540316) (not e!441646))))

(declare-fun lt!354755 () SeekEntryResult!8296)

(assert (=> b!795799 (= res!540316 (or (= lt!354755 (MissingZero!8296 i!1163)) (= lt!354755 (MissingVacant!8296 i!1163))))))

(assert (=> b!795799 (= lt!354755 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795800 () Bool)

(declare-fun res!540321 () Bool)

(assert (=> b!795800 (=> (not res!540321) (not e!441645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795800 (= res!540321 (validKeyInArray!0 k!2044))))

(declare-fun b!795801 () Bool)

(declare-fun res!540317 () Bool)

(assert (=> b!795801 (=> (not res!540317) (not e!441646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43250 (_ BitVec 32)) Bool)

(assert (=> b!795801 (= res!540317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795802 () Bool)

(declare-fun res!540323 () Bool)

(assert (=> b!795802 (=> (not res!540323) (not e!441646))))

(declare-datatypes ((List!14668 0))(
  ( (Nil!14665) (Cons!14664 (h!15793 (_ BitVec 64)) (t!20983 List!14668)) )
))
(declare-fun arrayNoDuplicates!0 (array!43250 (_ BitVec 32) List!14668) Bool)

(assert (=> b!795802 (= res!540323 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14665))))

(declare-fun b!795803 () Bool)

(declare-fun res!540322 () Bool)

(assert (=> b!795803 (=> (not res!540322) (not e!441645))))

(assert (=> b!795803 (= res!540322 (validKeyInArray!0 (select (arr!20705 a!3170) j!153)))))

(declare-fun res!540320 () Bool)

(assert (=> start!68460 (=> (not res!540320) (not e!441645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68460 (= res!540320 (validMask!0 mask!3266))))

(assert (=> start!68460 e!441645))

(assert (=> start!68460 true))

(declare-fun array_inv!16501 (array!43250) Bool)

(assert (=> start!68460 (array_inv!16501 a!3170)))

(declare-fun b!795804 () Bool)

(declare-fun res!540319 () Bool)

(assert (=> b!795804 (=> (not res!540319) (not e!441646))))

(assert (=> b!795804 (= res!540319 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21126 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20705 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21126 a!3170)) (= (select (arr!20705 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68460 res!540320) b!795796))

(assert (= (and b!795796 res!540315) b!795803))

(assert (= (and b!795803 res!540322) b!795800))

(assert (= (and b!795800 res!540321) b!795797))

(assert (= (and b!795797 res!540318) b!795799))

(assert (= (and b!795799 res!540316) b!795801))

(assert (= (and b!795801 res!540317) b!795802))

(assert (= (and b!795802 res!540323) b!795804))

(assert (= (and b!795804 res!540319) b!795795))

(assert (= (and b!795795 res!540314) b!795798))

(declare-fun m!736493 () Bool)

(assert (=> b!795798 m!736493))

(declare-fun m!736495 () Bool)

(assert (=> b!795798 m!736495))

(assert (=> b!795798 m!736495))

(declare-fun m!736497 () Bool)

(assert (=> b!795798 m!736497))

(assert (=> b!795798 m!736495))

(declare-fun m!736499 () Bool)

(assert (=> b!795798 m!736499))

(declare-fun m!736501 () Bool)

(assert (=> b!795800 m!736501))

(declare-fun m!736503 () Bool)

(assert (=> b!795795 m!736503))

(declare-fun m!736505 () Bool)

(assert (=> b!795795 m!736505))

(declare-fun m!736507 () Bool)

(assert (=> b!795795 m!736507))

(declare-fun m!736509 () Bool)

(assert (=> b!795795 m!736509))

(declare-fun m!736511 () Bool)

(assert (=> b!795802 m!736511))

(declare-fun m!736513 () Bool)

(assert (=> b!795797 m!736513))

(declare-fun m!736515 () Bool)

(assert (=> b!795799 m!736515))

(declare-fun m!736517 () Bool)

(assert (=> b!795801 m!736517))

(declare-fun m!736519 () Bool)

(assert (=> b!795804 m!736519))

(declare-fun m!736521 () Bool)

(assert (=> b!795804 m!736521))

(declare-fun m!736523 () Bool)

(assert (=> start!68460 m!736523))

(declare-fun m!736525 () Bool)

(assert (=> start!68460 m!736525))

(assert (=> b!795803 m!736495))

(assert (=> b!795803 m!736495))

(declare-fun m!736527 () Bool)

(assert (=> b!795803 m!736527))

(push 1)

(assert (not start!68460))

(assert (not b!795798))

(assert (not b!795803))

(assert (not b!795802))

(assert (not b!795801))

(assert (not b!795797))

(assert (not b!795800))

(assert (not b!795799))

(assert (not b!795795))

(check-sat)

(pop 1)

(push 1)

(check-sat)

