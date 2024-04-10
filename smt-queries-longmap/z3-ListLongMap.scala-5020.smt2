; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68632 () Bool)

(assert start!68632)

(declare-fun b!798690 () Bool)

(declare-fun res!543217 () Bool)

(declare-fun e!442993 () Bool)

(assert (=> b!798690 (=> (not res!543217) (not e!442993))))

(declare-datatypes ((array!43422 0))(
  ( (array!43423 (arr!20791 (Array (_ BitVec 32) (_ BitVec 64))) (size!21212 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43422)

(declare-datatypes ((List!14754 0))(
  ( (Nil!14751) (Cons!14750 (h!15879 (_ BitVec 64)) (t!21069 List!14754)) )
))
(declare-fun arrayNoDuplicates!0 (array!43422 (_ BitVec 32) List!14754) Bool)

(assert (=> b!798690 (= res!543217 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14751))))

(declare-fun b!798691 () Bool)

(declare-fun res!543210 () Bool)

(assert (=> b!798691 (=> (not res!543210) (not e!442993))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43422 (_ BitVec 32)) Bool)

(assert (=> b!798691 (= res!543210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798692 () Bool)

(declare-fun e!442992 () Bool)

(assert (=> b!798692 (= e!442993 e!442992)))

(declare-fun res!543215 () Bool)

(assert (=> b!798692 (=> (not res!543215) (not e!442992))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356549 () array!43422)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356545 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8382 0))(
  ( (MissingZero!8382 (index!35896 (_ BitVec 32))) (Found!8382 (index!35897 (_ BitVec 32))) (Intermediate!8382 (undefined!9194 Bool) (index!35898 (_ BitVec 32)) (x!66780 (_ BitVec 32))) (Undefined!8382) (MissingVacant!8382 (index!35899 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43422 (_ BitVec 32)) SeekEntryResult!8382)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43422 (_ BitVec 32)) SeekEntryResult!8382)

(assert (=> b!798692 (= res!543215 (= (seekEntryOrOpen!0 lt!356545 lt!356549 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356545 lt!356549 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798692 (= lt!356545 (select (store (arr!20791 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798692 (= lt!356549 (array!43423 (store (arr!20791 a!3170) i!1163 k0!2044) (size!21212 a!3170)))))

(declare-fun b!798693 () Bool)

(declare-fun res!543211 () Bool)

(declare-fun e!442991 () Bool)

(assert (=> b!798693 (=> (not res!543211) (not e!442991))))

(assert (=> b!798693 (= res!543211 (and (= (size!21212 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21212 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21212 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798694 () Bool)

(declare-fun res!543214 () Bool)

(assert (=> b!798694 (=> (not res!543214) (not e!442991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798694 (= res!543214 (validKeyInArray!0 (select (arr!20791 a!3170) j!153)))))

(declare-fun b!798695 () Bool)

(declare-fun res!543209 () Bool)

(assert (=> b!798695 (=> (not res!543209) (not e!442993))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798695 (= res!543209 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21212 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20791 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21212 a!3170)) (= (select (arr!20791 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun lt!356548 () SeekEntryResult!8382)

(declare-fun b!798696 () Bool)

(declare-fun lt!356546 () SeekEntryResult!8382)

(assert (=> b!798696 (= e!442992 (and (= lt!356546 lt!356548) (= lt!356548 (Found!8382 j!153)) (not (= (select (arr!20791 a!3170) index!1236) (select (arr!20791 a!3170) j!153))) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (=> b!798696 (= lt!356548 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20791 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798696 (= lt!356546 (seekEntryOrOpen!0 (select (arr!20791 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!543216 () Bool)

(assert (=> start!68632 (=> (not res!543216) (not e!442991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68632 (= res!543216 (validMask!0 mask!3266))))

(assert (=> start!68632 e!442991))

(assert (=> start!68632 true))

(declare-fun array_inv!16587 (array!43422) Bool)

(assert (=> start!68632 (array_inv!16587 a!3170)))

(declare-fun b!798697 () Bool)

(assert (=> b!798697 (= e!442991 e!442993)))

(declare-fun res!543213 () Bool)

(assert (=> b!798697 (=> (not res!543213) (not e!442993))))

(declare-fun lt!356547 () SeekEntryResult!8382)

(assert (=> b!798697 (= res!543213 (or (= lt!356547 (MissingZero!8382 i!1163)) (= lt!356547 (MissingVacant!8382 i!1163))))))

(assert (=> b!798697 (= lt!356547 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798698 () Bool)

(declare-fun res!543212 () Bool)

(assert (=> b!798698 (=> (not res!543212) (not e!442991))))

(declare-fun arrayContainsKey!0 (array!43422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798698 (= res!543212 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798699 () Bool)

(declare-fun res!543218 () Bool)

(assert (=> b!798699 (=> (not res!543218) (not e!442991))))

(assert (=> b!798699 (= res!543218 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68632 res!543216) b!798693))

(assert (= (and b!798693 res!543211) b!798694))

(assert (= (and b!798694 res!543214) b!798699))

(assert (= (and b!798699 res!543218) b!798698))

(assert (= (and b!798698 res!543212) b!798697))

(assert (= (and b!798697 res!543213) b!798691))

(assert (= (and b!798691 res!543210) b!798690))

(assert (= (and b!798690 res!543217) b!798695))

(assert (= (and b!798695 res!543209) b!798692))

(assert (= (and b!798692 res!543215) b!798696))

(declare-fun m!739637 () Bool)

(assert (=> b!798697 m!739637))

(declare-fun m!739639 () Bool)

(assert (=> b!798691 m!739639))

(declare-fun m!739641 () Bool)

(assert (=> b!798692 m!739641))

(declare-fun m!739643 () Bool)

(assert (=> b!798692 m!739643))

(declare-fun m!739645 () Bool)

(assert (=> b!798692 m!739645))

(declare-fun m!739647 () Bool)

(assert (=> b!798692 m!739647))

(declare-fun m!739649 () Bool)

(assert (=> b!798695 m!739649))

(declare-fun m!739651 () Bool)

(assert (=> b!798695 m!739651))

(declare-fun m!739653 () Bool)

(assert (=> b!798699 m!739653))

(declare-fun m!739655 () Bool)

(assert (=> b!798694 m!739655))

(assert (=> b!798694 m!739655))

(declare-fun m!739657 () Bool)

(assert (=> b!798694 m!739657))

(declare-fun m!739659 () Bool)

(assert (=> b!798696 m!739659))

(assert (=> b!798696 m!739655))

(assert (=> b!798696 m!739655))

(declare-fun m!739661 () Bool)

(assert (=> b!798696 m!739661))

(assert (=> b!798696 m!739655))

(declare-fun m!739663 () Bool)

(assert (=> b!798696 m!739663))

(declare-fun m!739665 () Bool)

(assert (=> start!68632 m!739665))

(declare-fun m!739667 () Bool)

(assert (=> start!68632 m!739667))

(declare-fun m!739669 () Bool)

(assert (=> b!798698 m!739669))

(declare-fun m!739671 () Bool)

(assert (=> b!798690 m!739671))

(check-sat (not b!798697) (not b!798692) (not b!798691) (not b!798698) (not b!798696) (not b!798699) (not b!798690) (not start!68632) (not b!798694))
(check-sat)
