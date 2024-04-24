; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68526 () Bool)

(assert start!68526)

(declare-fun b!795567 () Bool)

(declare-fun res!539714 () Bool)

(declare-fun e!441718 () Bool)

(assert (=> b!795567 (=> (not res!539714) (not e!441718))))

(declare-datatypes ((array!43190 0))(
  ( (array!43191 (arr!20671 (Array (_ BitVec 32) (_ BitVec 64))) (size!21091 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43190)

(declare-datatypes ((List!14541 0))(
  ( (Nil!14538) (Cons!14537 (h!15672 (_ BitVec 64)) (t!20848 List!14541)) )
))
(declare-fun arrayNoDuplicates!0 (array!43190 (_ BitVec 32) List!14541) Bool)

(assert (=> b!795567 (= res!539714 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14538))))

(declare-fun res!539713 () Bool)

(declare-fun e!441721 () Bool)

(assert (=> start!68526 (=> (not res!539713) (not e!441721))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68526 (= res!539713 (validMask!0 mask!3266))))

(assert (=> start!68526 e!441721))

(assert (=> start!68526 true))

(declare-fun array_inv!16530 (array!43190) Bool)

(assert (=> start!68526 (array_inv!16530 a!3170)))

(declare-fun b!795568 () Bool)

(declare-fun res!539720 () Bool)

(assert (=> b!795568 (=> (not res!539720) (not e!441721))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795568 (= res!539720 (validKeyInArray!0 k0!2044))))

(declare-fun b!795569 () Bool)

(declare-fun e!441720 () Bool)

(assert (=> b!795569 (= e!441720 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8218 0))(
  ( (MissingZero!8218 (index!35240 (_ BitVec 32))) (Found!8218 (index!35241 (_ BitVec 32))) (Intermediate!8218 (undefined!9030 Bool) (index!35242 (_ BitVec 32)) (x!66323 (_ BitVec 32))) (Undefined!8218) (MissingVacant!8218 (index!35243 (_ BitVec 32))) )
))
(declare-fun lt!354609 () SeekEntryResult!8218)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43190 (_ BitVec 32)) SeekEntryResult!8218)

(assert (=> b!795569 (= lt!354609 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20671 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354608 () SeekEntryResult!8218)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43190 (_ BitVec 32)) SeekEntryResult!8218)

(assert (=> b!795569 (= lt!354608 (seekEntryOrOpen!0 (select (arr!20671 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795570 () Bool)

(assert (=> b!795570 (= e!441718 e!441720)))

(declare-fun res!539719 () Bool)

(assert (=> b!795570 (=> (not res!539719) (not e!441720))))

(declare-fun lt!354607 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354610 () array!43190)

(assert (=> b!795570 (= res!539719 (= (seekEntryOrOpen!0 lt!354607 lt!354610 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354607 lt!354610 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795570 (= lt!354607 (select (store (arr!20671 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795570 (= lt!354610 (array!43191 (store (arr!20671 a!3170) i!1163 k0!2044) (size!21091 a!3170)))))

(declare-fun b!795571 () Bool)

(declare-fun res!539716 () Bool)

(assert (=> b!795571 (=> (not res!539716) (not e!441721))))

(assert (=> b!795571 (= res!539716 (and (= (size!21091 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21091 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21091 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795572 () Bool)

(declare-fun res!539712 () Bool)

(assert (=> b!795572 (=> (not res!539712) (not e!441718))))

(assert (=> b!795572 (= res!539712 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21091 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20671 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21091 a!3170)) (= (select (arr!20671 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795573 () Bool)

(assert (=> b!795573 (= e!441721 e!441718)))

(declare-fun res!539715 () Bool)

(assert (=> b!795573 (=> (not res!539715) (not e!441718))))

(declare-fun lt!354606 () SeekEntryResult!8218)

(assert (=> b!795573 (= res!539715 (or (= lt!354606 (MissingZero!8218 i!1163)) (= lt!354606 (MissingVacant!8218 i!1163))))))

(assert (=> b!795573 (= lt!354606 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795574 () Bool)

(declare-fun res!539721 () Bool)

(assert (=> b!795574 (=> (not res!539721) (not e!441718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43190 (_ BitVec 32)) Bool)

(assert (=> b!795574 (= res!539721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795575 () Bool)

(declare-fun res!539717 () Bool)

(assert (=> b!795575 (=> (not res!539717) (not e!441721))))

(declare-fun arrayContainsKey!0 (array!43190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795575 (= res!539717 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795576 () Bool)

(declare-fun res!539718 () Bool)

(assert (=> b!795576 (=> (not res!539718) (not e!441721))))

(assert (=> b!795576 (= res!539718 (validKeyInArray!0 (select (arr!20671 a!3170) j!153)))))

(assert (= (and start!68526 res!539713) b!795571))

(assert (= (and b!795571 res!539716) b!795576))

(assert (= (and b!795576 res!539718) b!795568))

(assert (= (and b!795568 res!539720) b!795575))

(assert (= (and b!795575 res!539717) b!795573))

(assert (= (and b!795573 res!539715) b!795574))

(assert (= (and b!795574 res!539721) b!795567))

(assert (= (and b!795567 res!539714) b!795572))

(assert (= (and b!795572 res!539712) b!795570))

(assert (= (and b!795570 res!539719) b!795569))

(declare-fun m!736571 () Bool)

(assert (=> b!795568 m!736571))

(declare-fun m!736573 () Bool)

(assert (=> b!795575 m!736573))

(declare-fun m!736575 () Bool)

(assert (=> b!795576 m!736575))

(assert (=> b!795576 m!736575))

(declare-fun m!736577 () Bool)

(assert (=> b!795576 m!736577))

(declare-fun m!736579 () Bool)

(assert (=> b!795567 m!736579))

(declare-fun m!736581 () Bool)

(assert (=> start!68526 m!736581))

(declare-fun m!736583 () Bool)

(assert (=> start!68526 m!736583))

(declare-fun m!736585 () Bool)

(assert (=> b!795574 m!736585))

(declare-fun m!736587 () Bool)

(assert (=> b!795572 m!736587))

(declare-fun m!736589 () Bool)

(assert (=> b!795572 m!736589))

(assert (=> b!795569 m!736575))

(assert (=> b!795569 m!736575))

(declare-fun m!736591 () Bool)

(assert (=> b!795569 m!736591))

(assert (=> b!795569 m!736575))

(declare-fun m!736593 () Bool)

(assert (=> b!795569 m!736593))

(declare-fun m!736595 () Bool)

(assert (=> b!795573 m!736595))

(declare-fun m!736597 () Bool)

(assert (=> b!795570 m!736597))

(declare-fun m!736599 () Bool)

(assert (=> b!795570 m!736599))

(declare-fun m!736601 () Bool)

(assert (=> b!795570 m!736601))

(declare-fun m!736603 () Bool)

(assert (=> b!795570 m!736603))

(check-sat (not b!795576) (not start!68526) (not b!795568) (not b!795575) (not b!795569) (not b!795570) (not b!795573) (not b!795567) (not b!795574))
(check-sat)
