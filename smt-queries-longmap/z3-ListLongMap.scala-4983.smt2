; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68388 () Bool)

(assert start!68388)

(declare-fun b!794758 () Bool)

(declare-fun res!539422 () Bool)

(declare-fun e!441179 () Bool)

(assert (=> b!794758 (=> (not res!539422) (not e!441179))))

(declare-datatypes ((array!43195 0))(
  ( (array!43196 (arr!20678 (Array (_ BitVec 32) (_ BitVec 64))) (size!21099 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43195)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794758 (= res!539422 (validKeyInArray!0 (select (arr!20678 a!3170) j!153)))))

(declare-fun b!794759 () Bool)

(declare-fun res!539425 () Bool)

(declare-fun e!441178 () Bool)

(assert (=> b!794759 (=> (not res!539425) (not e!441178))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794759 (= res!539425 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21099 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20678 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21099 a!3170)) (= (select (arr!20678 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794760 () Bool)

(assert (=> b!794760 (= e!441179 e!441178)))

(declare-fun res!539417 () Bool)

(assert (=> b!794760 (=> (not res!539417) (not e!441178))))

(declare-datatypes ((SeekEntryResult!8266 0))(
  ( (MissingZero!8266 (index!35432 (_ BitVec 32))) (Found!8266 (index!35433 (_ BitVec 32))) (Intermediate!8266 (undefined!9078 Bool) (index!35434 (_ BitVec 32)) (x!66363 (_ BitVec 32))) (Undefined!8266) (MissingVacant!8266 (index!35435 (_ BitVec 32))) )
))
(declare-fun lt!354137 () SeekEntryResult!8266)

(assert (=> b!794760 (= res!539417 (or (= lt!354137 (MissingZero!8266 i!1163)) (= lt!354137 (MissingVacant!8266 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43195 (_ BitVec 32)) SeekEntryResult!8266)

(assert (=> b!794760 (= lt!354137 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794761 () Bool)

(declare-fun res!539418 () Bool)

(assert (=> b!794761 (=> (not res!539418) (not e!441178))))

(declare-datatypes ((List!14680 0))(
  ( (Nil!14677) (Cons!14676 (h!15805 (_ BitVec 64)) (t!20986 List!14680)) )
))
(declare-fun arrayNoDuplicates!0 (array!43195 (_ BitVec 32) List!14680) Bool)

(assert (=> b!794761 (= res!539418 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14677))))

(declare-fun b!794762 () Bool)

(declare-fun res!539424 () Bool)

(declare-fun e!441181 () Bool)

(assert (=> b!794762 (=> (not res!539424) (not e!441181))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43195 (_ BitVec 32)) SeekEntryResult!8266)

(assert (=> b!794762 (= res!539424 (= (seekEntryOrOpen!0 (select (arr!20678 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20678 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!794763 () Bool)

(declare-fun res!539426 () Bool)

(assert (=> b!794763 (=> (not res!539426) (not e!441179))))

(assert (=> b!794763 (= res!539426 (and (= (size!21099 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21099 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21099 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!539419 () Bool)

(assert (=> start!68388 (=> (not res!539419) (not e!441179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68388 (= res!539419 (validMask!0 mask!3266))))

(assert (=> start!68388 e!441179))

(assert (=> start!68388 true))

(declare-fun array_inv!16561 (array!43195) Bool)

(assert (=> start!68388 (array_inv!16561 a!3170)))

(declare-fun b!794764 () Bool)

(declare-fun res!539421 () Bool)

(assert (=> b!794764 (=> (not res!539421) (not e!441179))))

(declare-fun arrayContainsKey!0 (array!43195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794764 (= res!539421 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794765 () Bool)

(declare-fun res!539423 () Bool)

(assert (=> b!794765 (=> (not res!539423) (not e!441179))))

(assert (=> b!794765 (= res!539423 (validKeyInArray!0 k0!2044))))

(declare-fun b!794766 () Bool)

(assert (=> b!794766 (= e!441181 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun b!794767 () Bool)

(declare-fun res!539420 () Bool)

(assert (=> b!794767 (=> (not res!539420) (not e!441178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43195 (_ BitVec 32)) Bool)

(assert (=> b!794767 (= res!539420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794768 () Bool)

(assert (=> b!794768 (= e!441178 e!441181)))

(declare-fun res!539427 () Bool)

(assert (=> b!794768 (=> (not res!539427) (not e!441181))))

(declare-fun lt!354136 () (_ BitVec 64))

(declare-fun lt!354135 () array!43195)

(assert (=> b!794768 (= res!539427 (= (seekEntryOrOpen!0 lt!354136 lt!354135 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354136 lt!354135 mask!3266)))))

(assert (=> b!794768 (= lt!354136 (select (store (arr!20678 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794768 (= lt!354135 (array!43196 (store (arr!20678 a!3170) i!1163 k0!2044) (size!21099 a!3170)))))

(assert (= (and start!68388 res!539419) b!794763))

(assert (= (and b!794763 res!539426) b!794758))

(assert (= (and b!794758 res!539422) b!794765))

(assert (= (and b!794765 res!539423) b!794764))

(assert (= (and b!794764 res!539421) b!794760))

(assert (= (and b!794760 res!539417) b!794767))

(assert (= (and b!794767 res!539420) b!794761))

(assert (= (and b!794761 res!539418) b!794759))

(assert (= (and b!794759 res!539425) b!794768))

(assert (= (and b!794768 res!539427) b!794762))

(assert (= (and b!794762 res!539424) b!794766))

(declare-fun m!734851 () Bool)

(assert (=> b!794762 m!734851))

(assert (=> b!794762 m!734851))

(declare-fun m!734853 () Bool)

(assert (=> b!794762 m!734853))

(assert (=> b!794762 m!734851))

(declare-fun m!734855 () Bool)

(assert (=> b!794762 m!734855))

(declare-fun m!734857 () Bool)

(assert (=> b!794768 m!734857))

(declare-fun m!734859 () Bool)

(assert (=> b!794768 m!734859))

(declare-fun m!734861 () Bool)

(assert (=> b!794768 m!734861))

(declare-fun m!734863 () Bool)

(assert (=> b!794768 m!734863))

(declare-fun m!734865 () Bool)

(assert (=> b!794767 m!734865))

(declare-fun m!734867 () Bool)

(assert (=> b!794765 m!734867))

(assert (=> b!794758 m!734851))

(assert (=> b!794758 m!734851))

(declare-fun m!734869 () Bool)

(assert (=> b!794758 m!734869))

(declare-fun m!734871 () Bool)

(assert (=> b!794759 m!734871))

(declare-fun m!734873 () Bool)

(assert (=> b!794759 m!734873))

(declare-fun m!734875 () Bool)

(assert (=> b!794761 m!734875))

(declare-fun m!734877 () Bool)

(assert (=> b!794760 m!734877))

(declare-fun m!734879 () Bool)

(assert (=> b!794764 m!734879))

(declare-fun m!734881 () Bool)

(assert (=> start!68388 m!734881))

(declare-fun m!734883 () Bool)

(assert (=> start!68388 m!734883))

(check-sat (not b!794760) (not start!68388) (not b!794758) (not b!794764) (not b!794767) (not b!794765) (not b!794768) (not b!794761) (not b!794762))
(check-sat)
