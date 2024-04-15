; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68454 () Bool)

(assert start!68454)

(declare-fun b!795766 () Bool)

(declare-fun res!540431 () Bool)

(declare-fun e!441588 () Bool)

(assert (=> b!795766 (=> (not res!540431) (not e!441588))))

(declare-datatypes ((array!43261 0))(
  ( (array!43262 (arr!20711 (Array (_ BitVec 32) (_ BitVec 64))) (size!21132 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43261)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795766 (= res!540431 (validKeyInArray!0 (select (arr!20711 a!3170) j!153)))))

(declare-fun b!795767 () Bool)

(declare-fun e!441589 () Bool)

(assert (=> b!795767 (= e!441588 e!441589)))

(declare-fun res!540425 () Bool)

(assert (=> b!795767 (=> (not res!540425) (not e!441589))))

(declare-datatypes ((SeekEntryResult!8299 0))(
  ( (MissingZero!8299 (index!35564 (_ BitVec 32))) (Found!8299 (index!35565 (_ BitVec 32))) (Intermediate!8299 (undefined!9111 Bool) (index!35566 (_ BitVec 32)) (x!66484 (_ BitVec 32))) (Undefined!8299) (MissingVacant!8299 (index!35567 (_ BitVec 32))) )
))
(declare-fun lt!354625 () SeekEntryResult!8299)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795767 (= res!540425 (or (= lt!354625 (MissingZero!8299 i!1163)) (= lt!354625 (MissingVacant!8299 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43261 (_ BitVec 32)) SeekEntryResult!8299)

(assert (=> b!795767 (= lt!354625 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!540435 () Bool)

(assert (=> start!68454 (=> (not res!540435) (not e!441588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68454 (= res!540435 (validMask!0 mask!3266))))

(assert (=> start!68454 e!441588))

(assert (=> start!68454 true))

(declare-fun array_inv!16594 (array!43261) Bool)

(assert (=> start!68454 (array_inv!16594 a!3170)))

(declare-fun b!795768 () Bool)

(declare-fun e!441585 () Bool)

(declare-fun e!441587 () Bool)

(assert (=> b!795768 (= e!441585 e!441587)))

(declare-fun res!540433 () Bool)

(assert (=> b!795768 (=> (not res!540433) (not e!441587))))

(declare-fun lt!354622 () SeekEntryResult!8299)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!354620 () SeekEntryResult!8299)

(assert (=> b!795768 (= res!540433 (and (= lt!354620 lt!354622) (= lt!354622 (Found!8299 j!153)) (= (select (arr!20711 a!3170) index!1236) (select (arr!20711 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43261 (_ BitVec 32)) SeekEntryResult!8299)

(assert (=> b!795768 (= lt!354622 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20711 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795768 (= lt!354620 (seekEntryOrOpen!0 (select (arr!20711 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795769 () Bool)

(declare-fun res!540434 () Bool)

(assert (=> b!795769 (=> (not res!540434) (not e!441589))))

(declare-datatypes ((List!14713 0))(
  ( (Nil!14710) (Cons!14709 (h!15838 (_ BitVec 64)) (t!21019 List!14713)) )
))
(declare-fun arrayNoDuplicates!0 (array!43261 (_ BitVec 32) List!14713) Bool)

(assert (=> b!795769 (= res!540434 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14710))))

(declare-fun b!795770 () Bool)

(declare-fun res!540432 () Bool)

(assert (=> b!795770 (=> (not res!540432) (not e!441588))))

(assert (=> b!795770 (= res!540432 (and (= (size!21132 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21132 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21132 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795771 () Bool)

(declare-fun res!540429 () Bool)

(assert (=> b!795771 (=> (not res!540429) (not e!441588))))

(declare-fun arrayContainsKey!0 (array!43261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795771 (= res!540429 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795772 () Bool)

(declare-fun res!540428 () Bool)

(assert (=> b!795772 (=> (not res!540428) (not e!441588))))

(assert (=> b!795772 (= res!540428 (validKeyInArray!0 k0!2044))))

(declare-fun b!795773 () Bool)

(assert (=> b!795773 (= e!441589 e!441585)))

(declare-fun res!540430 () Bool)

(assert (=> b!795773 (=> (not res!540430) (not e!441585))))

(declare-fun lt!354626 () SeekEntryResult!8299)

(declare-fun lt!354621 () SeekEntryResult!8299)

(assert (=> b!795773 (= res!540430 (= lt!354626 lt!354621))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354624 () (_ BitVec 64))

(declare-fun lt!354623 () array!43261)

(assert (=> b!795773 (= lt!354621 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354624 lt!354623 mask!3266))))

(assert (=> b!795773 (= lt!354626 (seekEntryOrOpen!0 lt!354624 lt!354623 mask!3266))))

(assert (=> b!795773 (= lt!354624 (select (store (arr!20711 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795773 (= lt!354623 (array!43262 (store (arr!20711 a!3170) i!1163 k0!2044) (size!21132 a!3170)))))

(declare-fun b!795774 () Bool)

(declare-fun res!540426 () Bool)

(assert (=> b!795774 (=> (not res!540426) (not e!441589))))

(assert (=> b!795774 (= res!540426 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21132 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20711 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21132 a!3170)) (= (select (arr!20711 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795775 () Bool)

(assert (=> b!795775 (= e!441587 (not true))))

(assert (=> b!795775 (= lt!354621 (Found!8299 index!1236))))

(declare-fun b!795776 () Bool)

(declare-fun res!540427 () Bool)

(assert (=> b!795776 (=> (not res!540427) (not e!441589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43261 (_ BitVec 32)) Bool)

(assert (=> b!795776 (= res!540427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68454 res!540435) b!795770))

(assert (= (and b!795770 res!540432) b!795766))

(assert (= (and b!795766 res!540431) b!795772))

(assert (= (and b!795772 res!540428) b!795771))

(assert (= (and b!795771 res!540429) b!795767))

(assert (= (and b!795767 res!540425) b!795776))

(assert (= (and b!795776 res!540427) b!795769))

(assert (= (and b!795769 res!540434) b!795774))

(assert (= (and b!795774 res!540426) b!795773))

(assert (= (and b!795773 res!540430) b!795768))

(assert (= (and b!795768 res!540433) b!795775))

(declare-fun m!736021 () Bool)

(assert (=> b!795766 m!736021))

(assert (=> b!795766 m!736021))

(declare-fun m!736023 () Bool)

(assert (=> b!795766 m!736023))

(declare-fun m!736025 () Bool)

(assert (=> start!68454 m!736025))

(declare-fun m!736027 () Bool)

(assert (=> start!68454 m!736027))

(declare-fun m!736029 () Bool)

(assert (=> b!795769 m!736029))

(declare-fun m!736031 () Bool)

(assert (=> b!795773 m!736031))

(declare-fun m!736033 () Bool)

(assert (=> b!795773 m!736033))

(declare-fun m!736035 () Bool)

(assert (=> b!795773 m!736035))

(declare-fun m!736037 () Bool)

(assert (=> b!795773 m!736037))

(declare-fun m!736039 () Bool)

(assert (=> b!795767 m!736039))

(declare-fun m!736041 () Bool)

(assert (=> b!795768 m!736041))

(assert (=> b!795768 m!736021))

(assert (=> b!795768 m!736021))

(declare-fun m!736043 () Bool)

(assert (=> b!795768 m!736043))

(assert (=> b!795768 m!736021))

(declare-fun m!736045 () Bool)

(assert (=> b!795768 m!736045))

(declare-fun m!736047 () Bool)

(assert (=> b!795776 m!736047))

(declare-fun m!736049 () Bool)

(assert (=> b!795774 m!736049))

(declare-fun m!736051 () Bool)

(assert (=> b!795774 m!736051))

(declare-fun m!736053 () Bool)

(assert (=> b!795771 m!736053))

(declare-fun m!736055 () Bool)

(assert (=> b!795772 m!736055))

(check-sat (not start!68454) (not b!795766) (not b!795771) (not b!795776) (not b!795773) (not b!795769) (not b!795772) (not b!795768) (not b!795767))
(check-sat)
