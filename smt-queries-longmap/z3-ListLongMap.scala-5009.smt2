; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68566 () Bool)

(assert start!68566)

(declare-fun b!797589 () Bool)

(declare-fun e!442490 () Bool)

(declare-fun e!442487 () Bool)

(assert (=> b!797589 (= e!442490 e!442487)))

(declare-fun res!542115 () Bool)

(assert (=> b!797589 (=> (not res!542115) (not e!442487))))

(declare-datatypes ((SeekEntryResult!8349 0))(
  ( (MissingZero!8349 (index!35764 (_ BitVec 32))) (Found!8349 (index!35765 (_ BitVec 32))) (Intermediate!8349 (undefined!9161 Bool) (index!35766 (_ BitVec 32)) (x!66659 (_ BitVec 32))) (Undefined!8349) (MissingVacant!8349 (index!35767 (_ BitVec 32))) )
))
(declare-fun lt!355867 () SeekEntryResult!8349)

(declare-datatypes ((array!43356 0))(
  ( (array!43357 (arr!20758 (Array (_ BitVec 32) (_ BitVec 64))) (size!21179 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43356)

(declare-fun lt!355869 () SeekEntryResult!8349)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797589 (= res!542115 (and (= lt!355867 lt!355869) (= (select (arr!20758 a!3170) index!1236) (select (arr!20758 a!3170) j!153))))))

(assert (=> b!797589 (= lt!355869 (Found!8349 j!153))))

(declare-fun b!797590 () Bool)

(declare-fun e!442484 () Bool)

(assert (=> b!797590 (= e!442484 e!442490)))

(declare-fun res!542117 () Bool)

(assert (=> b!797590 (=> (not res!542117) (not e!442490))))

(declare-fun lt!355871 () SeekEntryResult!8349)

(assert (=> b!797590 (= res!542117 (= lt!355871 lt!355867))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43356 (_ BitVec 32)) SeekEntryResult!8349)

(assert (=> b!797590 (= lt!355867 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20758 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43356 (_ BitVec 32)) SeekEntryResult!8349)

(assert (=> b!797590 (= lt!355871 (seekEntryOrOpen!0 (select (arr!20758 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797591 () Bool)

(declare-fun res!542110 () Bool)

(declare-fun e!442488 () Bool)

(assert (=> b!797591 (=> (not res!542110) (not e!442488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43356 (_ BitVec 32)) Bool)

(assert (=> b!797591 (= res!542110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797592 () Bool)

(declare-fun res!542109 () Bool)

(assert (=> b!797592 (=> (not res!542109) (not e!442488))))

(declare-datatypes ((List!14721 0))(
  ( (Nil!14718) (Cons!14717 (h!15846 (_ BitVec 64)) (t!21036 List!14721)) )
))
(declare-fun arrayNoDuplicates!0 (array!43356 (_ BitVec 32) List!14721) Bool)

(assert (=> b!797592 (= res!542109 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14718))))

(declare-fun b!797593 () Bool)

(declare-fun res!542118 () Bool)

(declare-fun e!442486 () Bool)

(assert (=> b!797593 (=> (not res!542118) (not e!442486))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797593 (= res!542118 (validKeyInArray!0 k0!2044))))

(declare-fun b!797594 () Bool)

(declare-fun e!442489 () Bool)

(declare-fun lt!355874 () (_ BitVec 64))

(assert (=> b!797594 (= e!442489 (validKeyInArray!0 lt!355874))))

(declare-fun b!797596 () Bool)

(assert (=> b!797596 (= e!442488 e!442484)))

(declare-fun res!542114 () Bool)

(assert (=> b!797596 (=> (not res!542114) (not e!442484))))

(declare-fun lt!355873 () SeekEntryResult!8349)

(declare-fun lt!355870 () SeekEntryResult!8349)

(assert (=> b!797596 (= res!542114 (= lt!355873 lt!355870))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355872 () array!43356)

(assert (=> b!797596 (= lt!355870 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355874 lt!355872 mask!3266))))

(assert (=> b!797596 (= lt!355873 (seekEntryOrOpen!0 lt!355874 lt!355872 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797596 (= lt!355874 (select (store (arr!20758 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797596 (= lt!355872 (array!43357 (store (arr!20758 a!3170) i!1163 k0!2044) (size!21179 a!3170)))))

(declare-fun b!797597 () Bool)

(assert (=> b!797597 (= e!442486 e!442488)))

(declare-fun res!542112 () Bool)

(assert (=> b!797597 (=> (not res!542112) (not e!442488))))

(declare-fun lt!355868 () SeekEntryResult!8349)

(assert (=> b!797597 (= res!542112 (or (= lt!355868 (MissingZero!8349 i!1163)) (= lt!355868 (MissingVacant!8349 i!1163))))))

(assert (=> b!797597 (= lt!355868 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797598 () Bool)

(declare-fun res!542111 () Bool)

(assert (=> b!797598 (=> (not res!542111) (not e!442486))))

(assert (=> b!797598 (= res!542111 (validKeyInArray!0 (select (arr!20758 a!3170) j!153)))))

(declare-fun b!797599 () Bool)

(declare-fun res!542108 () Bool)

(assert (=> b!797599 (=> (not res!542108) (not e!442486))))

(declare-fun arrayContainsKey!0 (array!43356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797599 (= res!542108 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797600 () Bool)

(declare-fun res!542120 () Bool)

(assert (=> b!797600 (=> (not res!542120) (not e!442486))))

(assert (=> b!797600 (= res!542120 (and (= (size!21179 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21179 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21179 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797601 () Bool)

(assert (=> b!797601 (= e!442487 (not e!442489))))

(declare-fun res!542113 () Bool)

(assert (=> b!797601 (=> res!542113 e!442489)))

(assert (=> b!797601 (= res!542113 (or (not (= lt!355870 lt!355869)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20758 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!797601 (= lt!355870 (Found!8349 index!1236))))

(declare-fun res!542119 () Bool)

(assert (=> start!68566 (=> (not res!542119) (not e!442486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68566 (= res!542119 (validMask!0 mask!3266))))

(assert (=> start!68566 e!442486))

(assert (=> start!68566 true))

(declare-fun array_inv!16554 (array!43356) Bool)

(assert (=> start!68566 (array_inv!16554 a!3170)))

(declare-fun b!797595 () Bool)

(declare-fun res!542116 () Bool)

(assert (=> b!797595 (=> (not res!542116) (not e!442488))))

(assert (=> b!797595 (= res!542116 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21179 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20758 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21179 a!3170)) (= (select (arr!20758 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68566 res!542119) b!797600))

(assert (= (and b!797600 res!542120) b!797598))

(assert (= (and b!797598 res!542111) b!797593))

(assert (= (and b!797593 res!542118) b!797599))

(assert (= (and b!797599 res!542108) b!797597))

(assert (= (and b!797597 res!542112) b!797591))

(assert (= (and b!797591 res!542110) b!797592))

(assert (= (and b!797592 res!542109) b!797595))

(assert (= (and b!797595 res!542116) b!797596))

(assert (= (and b!797596 res!542114) b!797590))

(assert (= (and b!797590 res!542117) b!797589))

(assert (= (and b!797589 res!542115) b!797601))

(assert (= (and b!797601 (not res!542113)) b!797594))

(declare-fun m!738447 () Bool)

(assert (=> b!797597 m!738447))

(declare-fun m!738449 () Bool)

(assert (=> start!68566 m!738449))

(declare-fun m!738451 () Bool)

(assert (=> start!68566 m!738451))

(declare-fun m!738453 () Bool)

(assert (=> b!797592 m!738453))

(declare-fun m!738455 () Bool)

(assert (=> b!797596 m!738455))

(declare-fun m!738457 () Bool)

(assert (=> b!797596 m!738457))

(declare-fun m!738459 () Bool)

(assert (=> b!797596 m!738459))

(declare-fun m!738461 () Bool)

(assert (=> b!797596 m!738461))

(declare-fun m!738463 () Bool)

(assert (=> b!797598 m!738463))

(assert (=> b!797598 m!738463))

(declare-fun m!738465 () Bool)

(assert (=> b!797598 m!738465))

(declare-fun m!738467 () Bool)

(assert (=> b!797593 m!738467))

(declare-fun m!738469 () Bool)

(assert (=> b!797591 m!738469))

(declare-fun m!738471 () Bool)

(assert (=> b!797595 m!738471))

(declare-fun m!738473 () Bool)

(assert (=> b!797595 m!738473))

(assert (=> b!797601 m!738459))

(declare-fun m!738475 () Bool)

(assert (=> b!797601 m!738475))

(declare-fun m!738477 () Bool)

(assert (=> b!797594 m!738477))

(declare-fun m!738479 () Bool)

(assert (=> b!797589 m!738479))

(assert (=> b!797589 m!738463))

(declare-fun m!738481 () Bool)

(assert (=> b!797599 m!738481))

(assert (=> b!797590 m!738463))

(assert (=> b!797590 m!738463))

(declare-fun m!738483 () Bool)

(assert (=> b!797590 m!738483))

(assert (=> b!797590 m!738463))

(declare-fun m!738485 () Bool)

(assert (=> b!797590 m!738485))

(check-sat (not b!797590) (not b!797594) (not b!797591) (not b!797598) (not b!797597) (not b!797593) (not start!68566) (not b!797596) (not b!797599) (not b!797592))
(check-sat)
