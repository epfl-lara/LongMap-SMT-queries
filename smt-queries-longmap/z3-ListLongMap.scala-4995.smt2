; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68460 () Bool)

(assert start!68460)

(declare-fun b!795865 () Bool)

(declare-fun e!441631 () Bool)

(declare-fun e!441630 () Bool)

(assert (=> b!795865 (= e!441631 e!441630)))

(declare-fun res!540525 () Bool)

(assert (=> b!795865 (=> (not res!540525) (not e!441630))))

(declare-datatypes ((SeekEntryResult!8302 0))(
  ( (MissingZero!8302 (index!35576 (_ BitVec 32))) (Found!8302 (index!35577 (_ BitVec 32))) (Intermediate!8302 (undefined!9114 Bool) (index!35578 (_ BitVec 32)) (x!66495 (_ BitVec 32))) (Undefined!8302) (MissingVacant!8302 (index!35579 (_ BitVec 32))) )
))
(declare-fun lt!354683 () SeekEntryResult!8302)

(declare-datatypes ((array!43267 0))(
  ( (array!43268 (arr!20714 (Array (_ BitVec 32) (_ BitVec 64))) (size!21135 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43267)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!354689 () SeekEntryResult!8302)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795865 (= res!540525 (and (= lt!354689 lt!354683) (= lt!354683 (Found!8302 j!153)) (= (select (arr!20714 a!3170) index!1236) (select (arr!20714 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43267 (_ BitVec 32)) SeekEntryResult!8302)

(assert (=> b!795865 (= lt!354683 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20714 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43267 (_ BitVec 32)) SeekEntryResult!8302)

(assert (=> b!795865 (= lt!354689 (seekEntryOrOpen!0 (select (arr!20714 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795866 () Bool)

(declare-fun res!540526 () Bool)

(declare-fun e!441634 () Bool)

(assert (=> b!795866 (=> (not res!540526) (not e!441634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43267 (_ BitVec 32)) Bool)

(assert (=> b!795866 (= res!540526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795867 () Bool)

(assert (=> b!795867 (= e!441634 e!441631)))

(declare-fun res!540531 () Bool)

(assert (=> b!795867 (=> (not res!540531) (not e!441631))))

(declare-fun lt!354687 () SeekEntryResult!8302)

(declare-fun lt!354684 () SeekEntryResult!8302)

(assert (=> b!795867 (= res!540531 (= lt!354687 lt!354684))))

(declare-fun lt!354688 () array!43267)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354686 () (_ BitVec 64))

(assert (=> b!795867 (= lt!354684 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354686 lt!354688 mask!3266))))

(assert (=> b!795867 (= lt!354687 (seekEntryOrOpen!0 lt!354686 lt!354688 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!795867 (= lt!354686 (select (store (arr!20714 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795867 (= lt!354688 (array!43268 (store (arr!20714 a!3170) i!1163 k0!2044) (size!21135 a!3170)))))

(declare-fun b!795868 () Bool)

(declare-fun res!540530 () Bool)

(assert (=> b!795868 (=> (not res!540530) (not e!441634))))

(declare-datatypes ((List!14716 0))(
  ( (Nil!14713) (Cons!14712 (h!15841 (_ BitVec 64)) (t!21022 List!14716)) )
))
(declare-fun arrayNoDuplicates!0 (array!43267 (_ BitVec 32) List!14716) Bool)

(assert (=> b!795868 (= res!540530 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14713))))

(declare-fun b!795869 () Bool)

(declare-fun res!540529 () Bool)

(assert (=> b!795869 (=> (not res!540529) (not e!441634))))

(assert (=> b!795869 (= res!540529 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21135 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20714 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21135 a!3170)) (= (select (arr!20714 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795870 () Bool)

(declare-fun res!540528 () Bool)

(declare-fun e!441632 () Bool)

(assert (=> b!795870 (=> (not res!540528) (not e!441632))))

(declare-fun arrayContainsKey!0 (array!43267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795870 (= res!540528 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795871 () Bool)

(assert (=> b!795871 (= e!441632 e!441634)))

(declare-fun res!540533 () Bool)

(assert (=> b!795871 (=> (not res!540533) (not e!441634))))

(declare-fun lt!354685 () SeekEntryResult!8302)

(assert (=> b!795871 (= res!540533 (or (= lt!354685 (MissingZero!8302 i!1163)) (= lt!354685 (MissingVacant!8302 i!1163))))))

(assert (=> b!795871 (= lt!354685 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795872 () Bool)

(declare-fun res!540527 () Bool)

(assert (=> b!795872 (=> (not res!540527) (not e!441632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795872 (= res!540527 (validKeyInArray!0 k0!2044))))

(declare-fun b!795873 () Bool)

(declare-fun res!540534 () Bool)

(assert (=> b!795873 (=> (not res!540534) (not e!441632))))

(assert (=> b!795873 (= res!540534 (and (= (size!21135 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21135 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21135 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795874 () Bool)

(declare-fun res!540524 () Bool)

(assert (=> b!795874 (=> (not res!540524) (not e!441632))))

(assert (=> b!795874 (= res!540524 (validKeyInArray!0 (select (arr!20714 a!3170) j!153)))))

(declare-fun b!795875 () Bool)

(assert (=> b!795875 (= e!441630 (not (bvsge mask!3266 #b00000000000000000000000000000000)))))

(assert (=> b!795875 (= lt!354684 (Found!8302 index!1236))))

(declare-fun res!540532 () Bool)

(assert (=> start!68460 (=> (not res!540532) (not e!441632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68460 (= res!540532 (validMask!0 mask!3266))))

(assert (=> start!68460 e!441632))

(assert (=> start!68460 true))

(declare-fun array_inv!16597 (array!43267) Bool)

(assert (=> start!68460 (array_inv!16597 a!3170)))

(assert (= (and start!68460 res!540532) b!795873))

(assert (= (and b!795873 res!540534) b!795874))

(assert (= (and b!795874 res!540524) b!795872))

(assert (= (and b!795872 res!540527) b!795870))

(assert (= (and b!795870 res!540528) b!795871))

(assert (= (and b!795871 res!540533) b!795866))

(assert (= (and b!795866 res!540526) b!795868))

(assert (= (and b!795868 res!540530) b!795869))

(assert (= (and b!795869 res!540529) b!795867))

(assert (= (and b!795867 res!540531) b!795865))

(assert (= (and b!795865 res!540525) b!795875))

(declare-fun m!736129 () Bool)

(assert (=> b!795867 m!736129))

(declare-fun m!736131 () Bool)

(assert (=> b!795867 m!736131))

(declare-fun m!736133 () Bool)

(assert (=> b!795867 m!736133))

(declare-fun m!736135 () Bool)

(assert (=> b!795867 m!736135))

(declare-fun m!736137 () Bool)

(assert (=> b!795865 m!736137))

(declare-fun m!736139 () Bool)

(assert (=> b!795865 m!736139))

(assert (=> b!795865 m!736139))

(declare-fun m!736141 () Bool)

(assert (=> b!795865 m!736141))

(assert (=> b!795865 m!736139))

(declare-fun m!736143 () Bool)

(assert (=> b!795865 m!736143))

(declare-fun m!736145 () Bool)

(assert (=> b!795866 m!736145))

(declare-fun m!736147 () Bool)

(assert (=> b!795869 m!736147))

(declare-fun m!736149 () Bool)

(assert (=> b!795869 m!736149))

(declare-fun m!736151 () Bool)

(assert (=> b!795872 m!736151))

(declare-fun m!736153 () Bool)

(assert (=> start!68460 m!736153))

(declare-fun m!736155 () Bool)

(assert (=> start!68460 m!736155))

(declare-fun m!736157 () Bool)

(assert (=> b!795868 m!736157))

(declare-fun m!736159 () Bool)

(assert (=> b!795870 m!736159))

(assert (=> b!795874 m!736139))

(assert (=> b!795874 m!736139))

(declare-fun m!736161 () Bool)

(assert (=> b!795874 m!736161))

(declare-fun m!736163 () Bool)

(assert (=> b!795871 m!736163))

(check-sat (not b!795872) (not b!795868) (not b!795874) (not b!795867) (not b!795866) (not b!795870) (not b!795871) (not b!795865) (not start!68460))
(check-sat)
