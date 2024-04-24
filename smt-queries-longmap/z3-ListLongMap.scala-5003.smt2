; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68652 () Bool)

(assert start!68652)

(declare-fun b!797569 () Bool)

(declare-fun res!541714 () Bool)

(declare-fun e!442580 () Bool)

(assert (=> b!797569 (=> (not res!541714) (not e!442580))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43316 0))(
  ( (array!43317 (arr!20734 (Array (_ BitVec 32) (_ BitVec 64))) (size!21154 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43316)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!797569 (= res!541714 (and (= (size!21154 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21154 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21154 a!3170)) (not (= i!1163 j!153))))))

(declare-fun e!442581 () Bool)

(declare-datatypes ((SeekEntryResult!8281 0))(
  ( (MissingZero!8281 (index!35492 (_ BitVec 32))) (Found!8281 (index!35493 (_ BitVec 32))) (Intermediate!8281 (undefined!9093 Bool) (index!35494 (_ BitVec 32)) (x!66554 (_ BitVec 32))) (Undefined!8281) (MissingVacant!8281 (index!35495 (_ BitVec 32))) )
))
(declare-fun lt!355707 () SeekEntryResult!8281)

(declare-fun lt!355703 () SeekEntryResult!8281)

(declare-fun b!797570 () Bool)

(assert (=> b!797570 (= e!442581 (not (or (not (= lt!355707 lt!355703)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797570 (= lt!355707 (Found!8281 index!1236))))

(declare-fun b!797571 () Bool)

(declare-fun e!442578 () Bool)

(assert (=> b!797571 (= e!442578 e!442581)))

(declare-fun res!541716 () Bool)

(assert (=> b!797571 (=> (not res!541716) (not e!442581))))

(declare-fun lt!355705 () SeekEntryResult!8281)

(assert (=> b!797571 (= res!541716 (and (= lt!355705 lt!355703) (= (select (arr!20734 a!3170) index!1236) (select (arr!20734 a!3170) j!153))))))

(assert (=> b!797571 (= lt!355703 (Found!8281 j!153))))

(declare-fun b!797572 () Bool)

(declare-fun res!541715 () Bool)

(assert (=> b!797572 (=> (not res!541715) (not e!442580))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797572 (= res!541715 (validKeyInArray!0 k0!2044))))

(declare-fun b!797573 () Bool)

(declare-fun res!541719 () Bool)

(declare-fun e!442577 () Bool)

(assert (=> b!797573 (=> (not res!541719) (not e!442577))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797573 (= res!541719 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21154 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20734 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21154 a!3170)) (= (select (arr!20734 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797574 () Bool)

(declare-fun res!541723 () Bool)

(assert (=> b!797574 (=> (not res!541723) (not e!442580))))

(assert (=> b!797574 (= res!541723 (validKeyInArray!0 (select (arr!20734 a!3170) j!153)))))

(declare-fun b!797575 () Bool)

(declare-fun res!541724 () Bool)

(assert (=> b!797575 (=> (not res!541724) (not e!442577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43316 (_ BitVec 32)) Bool)

(assert (=> b!797575 (= res!541724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!541725 () Bool)

(assert (=> start!68652 (=> (not res!541725) (not e!442580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68652 (= res!541725 (validMask!0 mask!3266))))

(assert (=> start!68652 e!442580))

(assert (=> start!68652 true))

(declare-fun array_inv!16593 (array!43316) Bool)

(assert (=> start!68652 (array_inv!16593 a!3170)))

(declare-fun b!797576 () Bool)

(declare-fun e!442582 () Bool)

(assert (=> b!797576 (= e!442577 e!442582)))

(declare-fun res!541721 () Bool)

(assert (=> b!797576 (=> (not res!541721) (not e!442582))))

(declare-fun lt!355708 () SeekEntryResult!8281)

(assert (=> b!797576 (= res!541721 (= lt!355708 lt!355707))))

(declare-fun lt!355704 () array!43316)

(declare-fun lt!355701 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43316 (_ BitVec 32)) SeekEntryResult!8281)

(assert (=> b!797576 (= lt!355707 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355701 lt!355704 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43316 (_ BitVec 32)) SeekEntryResult!8281)

(assert (=> b!797576 (= lt!355708 (seekEntryOrOpen!0 lt!355701 lt!355704 mask!3266))))

(assert (=> b!797576 (= lt!355701 (select (store (arr!20734 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797576 (= lt!355704 (array!43317 (store (arr!20734 a!3170) i!1163 k0!2044) (size!21154 a!3170)))))

(declare-fun b!797577 () Bool)

(assert (=> b!797577 (= e!442580 e!442577)))

(declare-fun res!541717 () Bool)

(assert (=> b!797577 (=> (not res!541717) (not e!442577))))

(declare-fun lt!355702 () SeekEntryResult!8281)

(assert (=> b!797577 (= res!541717 (or (= lt!355702 (MissingZero!8281 i!1163)) (= lt!355702 (MissingVacant!8281 i!1163))))))

(assert (=> b!797577 (= lt!355702 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797578 () Bool)

(assert (=> b!797578 (= e!442582 e!442578)))

(declare-fun res!541720 () Bool)

(assert (=> b!797578 (=> (not res!541720) (not e!442578))))

(declare-fun lt!355706 () SeekEntryResult!8281)

(assert (=> b!797578 (= res!541720 (= lt!355706 lt!355705))))

(assert (=> b!797578 (= lt!355705 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20734 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797578 (= lt!355706 (seekEntryOrOpen!0 (select (arr!20734 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797579 () Bool)

(declare-fun res!541718 () Bool)

(assert (=> b!797579 (=> (not res!541718) (not e!442580))))

(declare-fun arrayContainsKey!0 (array!43316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797579 (= res!541718 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797580 () Bool)

(declare-fun res!541722 () Bool)

(assert (=> b!797580 (=> (not res!541722) (not e!442577))))

(declare-datatypes ((List!14604 0))(
  ( (Nil!14601) (Cons!14600 (h!15735 (_ BitVec 64)) (t!20911 List!14604)) )
))
(declare-fun arrayNoDuplicates!0 (array!43316 (_ BitVec 32) List!14604) Bool)

(assert (=> b!797580 (= res!541722 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14601))))

(assert (= (and start!68652 res!541725) b!797569))

(assert (= (and b!797569 res!541714) b!797574))

(assert (= (and b!797574 res!541723) b!797572))

(assert (= (and b!797572 res!541715) b!797579))

(assert (= (and b!797579 res!541718) b!797577))

(assert (= (and b!797577 res!541717) b!797575))

(assert (= (and b!797575 res!541724) b!797580))

(assert (= (and b!797580 res!541722) b!797573))

(assert (= (and b!797573 res!541719) b!797576))

(assert (= (and b!797576 res!541721) b!797578))

(assert (= (and b!797578 res!541720) b!797571))

(assert (= (and b!797571 res!541716) b!797570))

(declare-fun m!738833 () Bool)

(assert (=> b!797578 m!738833))

(assert (=> b!797578 m!738833))

(declare-fun m!738835 () Bool)

(assert (=> b!797578 m!738835))

(assert (=> b!797578 m!738833))

(declare-fun m!738837 () Bool)

(assert (=> b!797578 m!738837))

(declare-fun m!738839 () Bool)

(assert (=> start!68652 m!738839))

(declare-fun m!738841 () Bool)

(assert (=> start!68652 m!738841))

(declare-fun m!738843 () Bool)

(assert (=> b!797576 m!738843))

(declare-fun m!738845 () Bool)

(assert (=> b!797576 m!738845))

(declare-fun m!738847 () Bool)

(assert (=> b!797576 m!738847))

(declare-fun m!738849 () Bool)

(assert (=> b!797576 m!738849))

(declare-fun m!738851 () Bool)

(assert (=> b!797573 m!738851))

(declare-fun m!738853 () Bool)

(assert (=> b!797573 m!738853))

(declare-fun m!738855 () Bool)

(assert (=> b!797580 m!738855))

(declare-fun m!738857 () Bool)

(assert (=> b!797579 m!738857))

(declare-fun m!738859 () Bool)

(assert (=> b!797572 m!738859))

(declare-fun m!738861 () Bool)

(assert (=> b!797575 m!738861))

(assert (=> b!797574 m!738833))

(assert (=> b!797574 m!738833))

(declare-fun m!738863 () Bool)

(assert (=> b!797574 m!738863))

(declare-fun m!738865 () Bool)

(assert (=> b!797571 m!738865))

(assert (=> b!797571 m!738833))

(declare-fun m!738867 () Bool)

(assert (=> b!797577 m!738867))

(check-sat (not b!797576) (not b!797572) (not b!797580) (not start!68652) (not b!797574) (not b!797579) (not b!797575) (not b!797577) (not b!797578))
(check-sat)
