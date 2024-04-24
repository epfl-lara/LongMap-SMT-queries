; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68370 () Bool)

(assert start!68370)

(declare-fun b!793473 () Bool)

(declare-fun res!537618 () Bool)

(declare-fun e!440943 () Bool)

(assert (=> b!793473 (=> (not res!537618) (not e!440943))))

(declare-datatypes ((array!43034 0))(
  ( (array!43035 (arr!20593 (Array (_ BitVec 32) (_ BitVec 64))) (size!21013 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43034)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793473 (= res!537618 (validKeyInArray!0 (select (arr!20593 a!3170) j!153)))))

(declare-fun b!793475 () Bool)

(declare-fun res!537619 () Bool)

(assert (=> b!793475 (=> (not res!537619) (not e!440943))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793475 (= res!537619 (and (= (size!21013 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21013 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21013 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793476 () Bool)

(declare-fun e!440942 () Bool)

(assert (=> b!793476 (= e!440943 e!440942)))

(declare-fun res!537623 () Bool)

(assert (=> b!793476 (=> (not res!537623) (not e!440942))))

(declare-datatypes ((SeekEntryResult!8140 0))(
  ( (MissingZero!8140 (index!34928 (_ BitVec 32))) (Found!8140 (index!34929 (_ BitVec 32))) (Intermediate!8140 (undefined!8952 Bool) (index!34930 (_ BitVec 32)) (x!66037 (_ BitVec 32))) (Undefined!8140) (MissingVacant!8140 (index!34931 (_ BitVec 32))) )
))
(declare-fun lt!353863 () SeekEntryResult!8140)

(assert (=> b!793476 (= res!537623 (or (= lt!353863 (MissingZero!8140 i!1163)) (= lt!353863 (MissingVacant!8140 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43034 (_ BitVec 32)) SeekEntryResult!8140)

(assert (=> b!793476 (= lt!353863 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793477 () Bool)

(declare-fun res!537620 () Bool)

(assert (=> b!793477 (=> (not res!537620) (not e!440943))))

(assert (=> b!793477 (= res!537620 (validKeyInArray!0 k0!2044))))

(declare-fun b!793478 () Bool)

(assert (=> b!793478 (= e!440942 false)))

(declare-fun lt!353862 () Bool)

(declare-datatypes ((List!14463 0))(
  ( (Nil!14460) (Cons!14459 (h!15594 (_ BitVec 64)) (t!20770 List!14463)) )
))
(declare-fun arrayNoDuplicates!0 (array!43034 (_ BitVec 32) List!14463) Bool)

(assert (=> b!793478 (= lt!353862 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14460))))

(declare-fun b!793479 () Bool)

(declare-fun res!537621 () Bool)

(assert (=> b!793479 (=> (not res!537621) (not e!440943))))

(declare-fun arrayContainsKey!0 (array!43034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793479 (= res!537621 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!537624 () Bool)

(assert (=> start!68370 (=> (not res!537624) (not e!440943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68370 (= res!537624 (validMask!0 mask!3266))))

(assert (=> start!68370 e!440943))

(assert (=> start!68370 true))

(declare-fun array_inv!16452 (array!43034) Bool)

(assert (=> start!68370 (array_inv!16452 a!3170)))

(declare-fun b!793474 () Bool)

(declare-fun res!537622 () Bool)

(assert (=> b!793474 (=> (not res!537622) (not e!440942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43034 (_ BitVec 32)) Bool)

(assert (=> b!793474 (= res!537622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68370 res!537624) b!793475))

(assert (= (and b!793475 res!537619) b!793473))

(assert (= (and b!793473 res!537618) b!793477))

(assert (= (and b!793477 res!537620) b!793479))

(assert (= (and b!793479 res!537621) b!793476))

(assert (= (and b!793476 res!537623) b!793474))

(assert (= (and b!793474 res!537622) b!793478))

(declare-fun m!734417 () Bool)

(assert (=> b!793474 m!734417))

(declare-fun m!734419 () Bool)

(assert (=> b!793477 m!734419))

(declare-fun m!734421 () Bool)

(assert (=> b!793478 m!734421))

(declare-fun m!734423 () Bool)

(assert (=> b!793479 m!734423))

(declare-fun m!734425 () Bool)

(assert (=> start!68370 m!734425))

(declare-fun m!734427 () Bool)

(assert (=> start!68370 m!734427))

(declare-fun m!734429 () Bool)

(assert (=> b!793476 m!734429))

(declare-fun m!734431 () Bool)

(assert (=> b!793473 m!734431))

(assert (=> b!793473 m!734431))

(declare-fun m!734433 () Bool)

(assert (=> b!793473 m!734433))

(check-sat (not b!793476) (not b!793477) (not b!793474) (not b!793473) (not b!793479) (not start!68370) (not b!793478))
(check-sat)
