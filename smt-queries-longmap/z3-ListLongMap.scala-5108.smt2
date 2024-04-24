; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69422 () Bool)

(assert start!69422)

(declare-fun b!808919 () Bool)

(declare-fun e!447891 () Bool)

(declare-fun e!447893 () Bool)

(assert (=> b!808919 (= e!447891 e!447893)))

(declare-fun res!552500 () Bool)

(assert (=> b!808919 (=> (not res!552500) (not e!447893))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8596 0))(
  ( (MissingZero!8596 (index!36752 (_ BitVec 32))) (Found!8596 (index!36753 (_ BitVec 32))) (Intermediate!8596 (undefined!9408 Bool) (index!36754 (_ BitVec 32)) (x!67718 (_ BitVec 32))) (Undefined!8596) (MissingVacant!8596 (index!36755 (_ BitVec 32))) )
))
(declare-fun lt!362410 () SeekEntryResult!8596)

(declare-datatypes ((array!43954 0))(
  ( (array!43955 (arr!21049 (Array (_ BitVec 32) (_ BitVec 64))) (size!21469 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43954)

(declare-fun lt!362411 () SeekEntryResult!8596)

(assert (=> b!808919 (= res!552500 (and (= lt!362410 lt!362411) (= lt!362411 (Found!8596 j!153)) (not (= (select (arr!21049 a!3170) index!1236) (select (arr!21049 a!3170) j!153)))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43954 (_ BitVec 32)) SeekEntryResult!8596)

(assert (=> b!808919 (= lt!362411 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21049 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43954 (_ BitVec 32)) SeekEntryResult!8596)

(assert (=> b!808919 (= lt!362410 (seekEntryOrOpen!0 (select (arr!21049 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808920 () Bool)

(declare-fun e!447895 () Bool)

(declare-fun e!447894 () Bool)

(assert (=> b!808920 (= e!447895 e!447894)))

(declare-fun res!552499 () Bool)

(assert (=> b!808920 (=> (not res!552499) (not e!447894))))

(declare-fun lt!362414 () SeekEntryResult!8596)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808920 (= res!552499 (or (= lt!362414 (MissingZero!8596 i!1163)) (= lt!362414 (MissingVacant!8596 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!808920 (= lt!362414 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!552495 () Bool)

(assert (=> start!69422 (=> (not res!552495) (not e!447895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69422 (= res!552495 (validMask!0 mask!3266))))

(assert (=> start!69422 e!447895))

(assert (=> start!69422 true))

(declare-fun array_inv!16908 (array!43954) Bool)

(assert (=> start!69422 (array_inv!16908 a!3170)))

(declare-fun b!808921 () Bool)

(declare-fun res!552496 () Bool)

(assert (=> b!808921 (=> (not res!552496) (not e!447894))))

(declare-datatypes ((List!14919 0))(
  ( (Nil!14916) (Cons!14915 (h!16050 (_ BitVec 64)) (t!21226 List!14919)) )
))
(declare-fun arrayNoDuplicates!0 (array!43954 (_ BitVec 32) List!14919) Bool)

(assert (=> b!808921 (= res!552496 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14916))))

(declare-fun b!808922 () Bool)

(declare-fun res!552494 () Bool)

(assert (=> b!808922 (=> (not res!552494) (not e!447895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808922 (= res!552494 (validKeyInArray!0 (select (arr!21049 a!3170) j!153)))))

(declare-fun b!808923 () Bool)

(declare-fun res!552502 () Bool)

(assert (=> b!808923 (=> (not res!552502) (not e!447895))))

(declare-fun arrayContainsKey!0 (array!43954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808923 (= res!552502 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808924 () Bool)

(assert (=> b!808924 (= e!447893 false)))

(declare-fun lt!362412 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808924 (= lt!362412 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!808925 () Bool)

(declare-fun res!552497 () Bool)

(assert (=> b!808925 (=> (not res!552497) (not e!447894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43954 (_ BitVec 32)) Bool)

(assert (=> b!808925 (= res!552497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808926 () Bool)

(declare-fun res!552503 () Bool)

(assert (=> b!808926 (=> (not res!552503) (not e!447895))))

(assert (=> b!808926 (= res!552503 (validKeyInArray!0 k0!2044))))

(declare-fun b!808927 () Bool)

(assert (=> b!808927 (= e!447894 e!447891)))

(declare-fun res!552504 () Bool)

(assert (=> b!808927 (=> (not res!552504) (not e!447891))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362413 () array!43954)

(declare-fun lt!362409 () (_ BitVec 64))

(assert (=> b!808927 (= res!552504 (= (seekEntryOrOpen!0 lt!362409 lt!362413 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362409 lt!362413 mask!3266)))))

(assert (=> b!808927 (= lt!362409 (select (store (arr!21049 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808927 (= lt!362413 (array!43955 (store (arr!21049 a!3170) i!1163 k0!2044) (size!21469 a!3170)))))

(declare-fun b!808928 () Bool)

(declare-fun res!552498 () Bool)

(assert (=> b!808928 (=> (not res!552498) (not e!447894))))

(assert (=> b!808928 (= res!552498 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21469 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21049 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21469 a!3170)) (= (select (arr!21049 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808929 () Bool)

(declare-fun res!552501 () Bool)

(assert (=> b!808929 (=> (not res!552501) (not e!447895))))

(assert (=> b!808929 (= res!552501 (and (= (size!21469 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21469 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21469 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69422 res!552495) b!808929))

(assert (= (and b!808929 res!552501) b!808922))

(assert (= (and b!808922 res!552494) b!808926))

(assert (= (and b!808926 res!552503) b!808923))

(assert (= (and b!808923 res!552502) b!808920))

(assert (= (and b!808920 res!552499) b!808925))

(assert (= (and b!808925 res!552497) b!808921))

(assert (= (and b!808921 res!552496) b!808928))

(assert (= (and b!808928 res!552498) b!808927))

(assert (= (and b!808927 res!552504) b!808919))

(assert (= (and b!808919 res!552500) b!808924))

(declare-fun m!751411 () Bool)

(assert (=> b!808921 m!751411))

(declare-fun m!751413 () Bool)

(assert (=> b!808923 m!751413))

(declare-fun m!751415 () Bool)

(assert (=> b!808927 m!751415))

(declare-fun m!751417 () Bool)

(assert (=> b!808927 m!751417))

(declare-fun m!751419 () Bool)

(assert (=> b!808927 m!751419))

(declare-fun m!751421 () Bool)

(assert (=> b!808927 m!751421))

(declare-fun m!751423 () Bool)

(assert (=> b!808928 m!751423))

(declare-fun m!751425 () Bool)

(assert (=> b!808928 m!751425))

(declare-fun m!751427 () Bool)

(assert (=> b!808920 m!751427))

(declare-fun m!751429 () Bool)

(assert (=> b!808924 m!751429))

(declare-fun m!751431 () Bool)

(assert (=> b!808926 m!751431))

(declare-fun m!751433 () Bool)

(assert (=> b!808922 m!751433))

(assert (=> b!808922 m!751433))

(declare-fun m!751435 () Bool)

(assert (=> b!808922 m!751435))

(declare-fun m!751437 () Bool)

(assert (=> b!808919 m!751437))

(assert (=> b!808919 m!751433))

(assert (=> b!808919 m!751433))

(declare-fun m!751439 () Bool)

(assert (=> b!808919 m!751439))

(assert (=> b!808919 m!751433))

(declare-fun m!751441 () Bool)

(assert (=> b!808919 m!751441))

(declare-fun m!751443 () Bool)

(assert (=> start!69422 m!751443))

(declare-fun m!751445 () Bool)

(assert (=> start!69422 m!751445))

(declare-fun m!751447 () Bool)

(assert (=> b!808925 m!751447))

(check-sat (not b!808926) (not b!808927) (not b!808921) (not b!808922) (not start!69422) (not b!808924) (not b!808919) (not b!808923) (not b!808925) (not b!808920))
(check-sat)
