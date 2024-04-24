; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68538 () Bool)

(assert start!68538)

(declare-fun b!795756 () Bool)

(declare-fun e!441791 () Bool)

(declare-fun e!441790 () Bool)

(assert (=> b!795756 (= e!441791 e!441790)))

(declare-fun res!539907 () Bool)

(assert (=> b!795756 (=> (not res!539907) (not e!441790))))

(declare-datatypes ((SeekEntryResult!8224 0))(
  ( (MissingZero!8224 (index!35264 (_ BitVec 32))) (Found!8224 (index!35265 (_ BitVec 32))) (Intermediate!8224 (undefined!9036 Bool) (index!35266 (_ BitVec 32)) (x!66345 (_ BitVec 32))) (Undefined!8224) (MissingVacant!8224 (index!35267 (_ BitVec 32))) )
))
(declare-fun lt!354678 () SeekEntryResult!8224)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795756 (= res!539907 (or (= lt!354678 (MissingZero!8224 i!1163)) (= lt!354678 (MissingVacant!8224 i!1163))))))

(declare-datatypes ((array!43202 0))(
  ( (array!43203 (arr!20677 (Array (_ BitVec 32) (_ BitVec 64))) (size!21097 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43202)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43202 (_ BitVec 32)) SeekEntryResult!8224)

(assert (=> b!795756 (= lt!354678 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795757 () Bool)

(declare-fun res!539903 () Bool)

(assert (=> b!795757 (=> (not res!539903) (not e!441791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795757 (= res!539903 (validKeyInArray!0 k0!2044))))

(declare-fun b!795758 () Bool)

(declare-fun res!539905 () Bool)

(assert (=> b!795758 (=> (not res!539905) (not e!441791))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795758 (= res!539905 (and (= (size!21097 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21097 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21097 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795759 () Bool)

(declare-fun res!539901 () Bool)

(assert (=> b!795759 (=> (not res!539901) (not e!441790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43202 (_ BitVec 32)) Bool)

(assert (=> b!795759 (= res!539901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!539906 () Bool)

(assert (=> start!68538 (=> (not res!539906) (not e!441791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68538 (= res!539906 (validMask!0 mask!3266))))

(assert (=> start!68538 e!441791))

(assert (=> start!68538 true))

(declare-fun array_inv!16536 (array!43202) Bool)

(assert (=> start!68538 (array_inv!16536 a!3170)))

(declare-fun b!795760 () Bool)

(declare-fun res!539902 () Bool)

(assert (=> b!795760 (=> (not res!539902) (not e!441791))))

(assert (=> b!795760 (= res!539902 (validKeyInArray!0 (select (arr!20677 a!3170) j!153)))))

(declare-fun b!795761 () Bool)

(declare-fun res!539909 () Bool)

(assert (=> b!795761 (=> (not res!539909) (not e!441791))))

(declare-fun arrayContainsKey!0 (array!43202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795761 (= res!539909 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795762 () Bool)

(declare-fun res!539908 () Bool)

(assert (=> b!795762 (=> (not res!539908) (not e!441790))))

(declare-datatypes ((List!14547 0))(
  ( (Nil!14544) (Cons!14543 (h!15678 (_ BitVec 64)) (t!20854 List!14547)) )
))
(declare-fun arrayNoDuplicates!0 (array!43202 (_ BitVec 32) List!14547) Bool)

(assert (=> b!795762 (= res!539908 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14544))))

(declare-fun b!795763 () Bool)

(declare-fun e!441793 () Bool)

(assert (=> b!795763 (= e!441793 false)))

(declare-fun lt!354679 () SeekEntryResult!8224)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43202 (_ BitVec 32)) SeekEntryResult!8224)

(assert (=> b!795763 (= lt!354679 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20677 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354682 () SeekEntryResult!8224)

(assert (=> b!795763 (= lt!354682 (seekEntryOrOpen!0 (select (arr!20677 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795764 () Bool)

(assert (=> b!795764 (= e!441790 e!441793)))

(declare-fun res!539910 () Bool)

(assert (=> b!795764 (=> (not res!539910) (not e!441793))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354681 () array!43202)

(declare-fun lt!354680 () (_ BitVec 64))

(assert (=> b!795764 (= res!539910 (= (seekEntryOrOpen!0 lt!354680 lt!354681 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354680 lt!354681 mask!3266)))))

(assert (=> b!795764 (= lt!354680 (select (store (arr!20677 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795764 (= lt!354681 (array!43203 (store (arr!20677 a!3170) i!1163 k0!2044) (size!21097 a!3170)))))

(declare-fun b!795765 () Bool)

(declare-fun res!539904 () Bool)

(assert (=> b!795765 (=> (not res!539904) (not e!441790))))

(assert (=> b!795765 (= res!539904 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21097 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20677 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21097 a!3170)) (= (select (arr!20677 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68538 res!539906) b!795758))

(assert (= (and b!795758 res!539905) b!795760))

(assert (= (and b!795760 res!539902) b!795757))

(assert (= (and b!795757 res!539903) b!795761))

(assert (= (and b!795761 res!539909) b!795756))

(assert (= (and b!795756 res!539907) b!795759))

(assert (= (and b!795759 res!539901) b!795762))

(assert (= (and b!795762 res!539908) b!795765))

(assert (= (and b!795765 res!539904) b!795764))

(assert (= (and b!795764 res!539910) b!795763))

(declare-fun m!736775 () Bool)

(assert (=> b!795761 m!736775))

(declare-fun m!736777 () Bool)

(assert (=> b!795763 m!736777))

(assert (=> b!795763 m!736777))

(declare-fun m!736779 () Bool)

(assert (=> b!795763 m!736779))

(assert (=> b!795763 m!736777))

(declare-fun m!736781 () Bool)

(assert (=> b!795763 m!736781))

(declare-fun m!736783 () Bool)

(assert (=> b!795764 m!736783))

(declare-fun m!736785 () Bool)

(assert (=> b!795764 m!736785))

(declare-fun m!736787 () Bool)

(assert (=> b!795764 m!736787))

(declare-fun m!736789 () Bool)

(assert (=> b!795764 m!736789))

(declare-fun m!736791 () Bool)

(assert (=> b!795756 m!736791))

(declare-fun m!736793 () Bool)

(assert (=> b!795765 m!736793))

(declare-fun m!736795 () Bool)

(assert (=> b!795765 m!736795))

(declare-fun m!736797 () Bool)

(assert (=> b!795757 m!736797))

(declare-fun m!736799 () Bool)

(assert (=> start!68538 m!736799))

(declare-fun m!736801 () Bool)

(assert (=> start!68538 m!736801))

(declare-fun m!736803 () Bool)

(assert (=> b!795759 m!736803))

(assert (=> b!795760 m!736777))

(assert (=> b!795760 m!736777))

(declare-fun m!736805 () Bool)

(assert (=> b!795760 m!736805))

(declare-fun m!736807 () Bool)

(assert (=> b!795762 m!736807))

(check-sat (not b!795763) (not b!795764) (not b!795760) (not b!795762) (not b!795756) (not start!68538) (not b!795761) (not b!795757) (not b!795759))
(check-sat)
