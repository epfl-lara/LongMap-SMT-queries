; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68528 () Bool)

(assert start!68528)

(declare-fun b!796918 () Bool)

(declare-fun res!541442 () Bool)

(declare-fun e!442158 () Bool)

(assert (=> b!796918 (=> (not res!541442) (not e!442158))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796918 (= res!541442 (validKeyInArray!0 k!2044))))

(declare-fun b!796919 () Bool)

(declare-fun res!541448 () Bool)

(declare-fun e!442155 () Bool)

(assert (=> b!796919 (=> (not res!541448) (not e!442155))))

(declare-datatypes ((array!43318 0))(
  ( (array!43319 (arr!20739 (Array (_ BitVec 32) (_ BitVec 64))) (size!21160 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43318)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43318 (_ BitVec 32)) Bool)

(assert (=> b!796919 (= res!541448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796920 () Bool)

(declare-fun e!442160 () Bool)

(declare-fun e!442159 () Bool)

(assert (=> b!796920 (= e!442160 e!442159)))

(declare-fun res!541438 () Bool)

(assert (=> b!796920 (=> (not res!541438) (not e!442159))))

(declare-datatypes ((SeekEntryResult!8330 0))(
  ( (MissingZero!8330 (index!35688 (_ BitVec 32))) (Found!8330 (index!35689 (_ BitVec 32))) (Intermediate!8330 (undefined!9142 Bool) (index!35690 (_ BitVec 32)) (x!66592 (_ BitVec 32))) (Undefined!8330) (MissingVacant!8330 (index!35691 (_ BitVec 32))) )
))
(declare-fun lt!355436 () SeekEntryResult!8330)

(declare-fun lt!355430 () SeekEntryResult!8330)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796920 (= res!541438 (and (= lt!355430 lt!355436) (= (select (arr!20739 a!3170) index!1236) (select (arr!20739 a!3170) j!153))))))

(assert (=> b!796920 (= lt!355436 (Found!8330 j!153))))

(declare-fun b!796921 () Bool)

(declare-fun res!541446 () Bool)

(assert (=> b!796921 (=> (not res!541446) (not e!442158))))

(assert (=> b!796921 (= res!541446 (validKeyInArray!0 (select (arr!20739 a!3170) j!153)))))

(declare-fun b!796922 () Bool)

(declare-fun res!541439 () Bool)

(assert (=> b!796922 (=> (not res!541439) (not e!442155))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796922 (= res!541439 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21160 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20739 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21160 a!3170)) (= (select (arr!20739 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun lt!355432 () SeekEntryResult!8330)

(declare-fun b!796923 () Bool)

(assert (=> b!796923 (= e!442159 (not (or (not (= lt!355432 lt!355436)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(assert (=> b!796923 (= lt!355432 (Found!8330 index!1236))))

(declare-fun b!796924 () Bool)

(declare-fun e!442157 () Bool)

(assert (=> b!796924 (= e!442155 e!442157)))

(declare-fun res!541437 () Bool)

(assert (=> b!796924 (=> (not res!541437) (not e!442157))))

(declare-fun lt!355431 () SeekEntryResult!8330)

(assert (=> b!796924 (= res!541437 (= lt!355431 lt!355432))))

(declare-fun lt!355435 () (_ BitVec 64))

(declare-fun lt!355429 () array!43318)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43318 (_ BitVec 32)) SeekEntryResult!8330)

(assert (=> b!796924 (= lt!355432 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355435 lt!355429 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43318 (_ BitVec 32)) SeekEntryResult!8330)

(assert (=> b!796924 (= lt!355431 (seekEntryOrOpen!0 lt!355435 lt!355429 mask!3266))))

(assert (=> b!796924 (= lt!355435 (select (store (arr!20739 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796924 (= lt!355429 (array!43319 (store (arr!20739 a!3170) i!1163 k!2044) (size!21160 a!3170)))))

(declare-fun b!796925 () Bool)

(declare-fun res!541447 () Bool)

(assert (=> b!796925 (=> (not res!541447) (not e!442158))))

(declare-fun arrayContainsKey!0 (array!43318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796925 (= res!541447 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796926 () Bool)

(declare-fun res!541443 () Bool)

(assert (=> b!796926 (=> (not res!541443) (not e!442155))))

(declare-datatypes ((List!14702 0))(
  ( (Nil!14699) (Cons!14698 (h!15827 (_ BitVec 64)) (t!21017 List!14702)) )
))
(declare-fun arrayNoDuplicates!0 (array!43318 (_ BitVec 32) List!14702) Bool)

(assert (=> b!796926 (= res!541443 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14699))))

(declare-fun b!796927 () Bool)

(assert (=> b!796927 (= e!442157 e!442160)))

(declare-fun res!541445 () Bool)

(assert (=> b!796927 (=> (not res!541445) (not e!442160))))

(declare-fun lt!355433 () SeekEntryResult!8330)

(assert (=> b!796927 (= res!541445 (= lt!355433 lt!355430))))

(assert (=> b!796927 (= lt!355430 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20739 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796927 (= lt!355433 (seekEntryOrOpen!0 (select (arr!20739 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!541444 () Bool)

(assert (=> start!68528 (=> (not res!541444) (not e!442158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68528 (= res!541444 (validMask!0 mask!3266))))

(assert (=> start!68528 e!442158))

(assert (=> start!68528 true))

(declare-fun array_inv!16535 (array!43318) Bool)

(assert (=> start!68528 (array_inv!16535 a!3170)))

(declare-fun b!796928 () Bool)

(declare-fun res!541440 () Bool)

(assert (=> b!796928 (=> (not res!541440) (not e!442158))))

(assert (=> b!796928 (= res!541440 (and (= (size!21160 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21160 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21160 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796929 () Bool)

(assert (=> b!796929 (= e!442158 e!442155)))

(declare-fun res!541441 () Bool)

(assert (=> b!796929 (=> (not res!541441) (not e!442155))))

(declare-fun lt!355434 () SeekEntryResult!8330)

(assert (=> b!796929 (= res!541441 (or (= lt!355434 (MissingZero!8330 i!1163)) (= lt!355434 (MissingVacant!8330 i!1163))))))

(assert (=> b!796929 (= lt!355434 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68528 res!541444) b!796928))

(assert (= (and b!796928 res!541440) b!796921))

(assert (= (and b!796921 res!541446) b!796918))

(assert (= (and b!796918 res!541442) b!796925))

(assert (= (and b!796925 res!541447) b!796929))

(assert (= (and b!796929 res!541441) b!796919))

(assert (= (and b!796919 res!541448) b!796926))

(assert (= (and b!796926 res!541443) b!796922))

(assert (= (and b!796922 res!541439) b!796924))

(assert (= (and b!796924 res!541437) b!796927))

(assert (= (and b!796927 res!541445) b!796920))

(assert (= (and b!796920 res!541438) b!796923))

(declare-fun m!737753 () Bool)

(assert (=> b!796929 m!737753))

(declare-fun m!737755 () Bool)

(assert (=> b!796919 m!737755))

(declare-fun m!737757 () Bool)

(assert (=> b!796920 m!737757))

(declare-fun m!737759 () Bool)

(assert (=> b!796920 m!737759))

(assert (=> b!796921 m!737759))

(assert (=> b!796921 m!737759))

(declare-fun m!737761 () Bool)

(assert (=> b!796921 m!737761))

(declare-fun m!737763 () Bool)

(assert (=> b!796918 m!737763))

(declare-fun m!737765 () Bool)

(assert (=> b!796926 m!737765))

(declare-fun m!737767 () Bool)

(assert (=> b!796922 m!737767))

(declare-fun m!737769 () Bool)

(assert (=> b!796922 m!737769))

(assert (=> b!796927 m!737759))

(assert (=> b!796927 m!737759))

(declare-fun m!737771 () Bool)

(assert (=> b!796927 m!737771))

(assert (=> b!796927 m!737759))

(declare-fun m!737773 () Bool)

(assert (=> b!796927 m!737773))

(declare-fun m!737775 () Bool)

(assert (=> b!796925 m!737775))

(declare-fun m!737777 () Bool)

(assert (=> b!796924 m!737777))

(declare-fun m!737779 () Bool)

(assert (=> b!796924 m!737779))

(declare-fun m!737781 () Bool)

(assert (=> b!796924 m!737781))

(declare-fun m!737783 () Bool)

(assert (=> b!796924 m!737783))

(declare-fun m!737785 () Bool)

(assert (=> start!68528 m!737785))

(declare-fun m!737787 () Bool)

(assert (=> start!68528 m!737787))

(push 1)

(assert (not b!796926))

(assert (not b!796918))

(assert (not b!796925))

(assert (not b!796924))

(assert (not b!796919))

(assert (not b!796929))

(assert (not start!68528))

(assert (not b!796921))

(assert (not b!796927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

