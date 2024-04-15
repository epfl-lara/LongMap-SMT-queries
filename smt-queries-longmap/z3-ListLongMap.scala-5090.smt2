; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69078 () Bool)

(assert start!69078)

(declare-fun b!805720 () Bool)

(declare-fun res!550184 () Bool)

(declare-fun e!446179 () Bool)

(assert (=> b!805720 (=> (not res!550184) (not e!446179))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43840 0))(
  ( (array!43841 (arr!20999 (Array (_ BitVec 32) (_ BitVec 64))) (size!21420 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43840)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805720 (= res!550184 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21420 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20999 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21420 a!3170)) (= (select (arr!20999 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!550181 () Bool)

(declare-fun e!446178 () Bool)

(assert (=> start!69078 (=> (not res!550181) (not e!446178))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69078 (= res!550181 (validMask!0 mask!3266))))

(assert (=> start!69078 e!446178))

(assert (=> start!69078 true))

(declare-fun array_inv!16882 (array!43840) Bool)

(assert (=> start!69078 (array_inv!16882 a!3170)))

(declare-fun b!805721 () Bool)

(declare-fun e!446176 () Bool)

(assert (=> b!805721 (= e!446176 (not true))))

(declare-datatypes ((SeekEntryResult!8587 0))(
  ( (MissingZero!8587 (index!36716 (_ BitVec 32))) (Found!8587 (index!36717 (_ BitVec 32))) (Intermediate!8587 (undefined!9399 Bool) (index!36718 (_ BitVec 32)) (x!67543 (_ BitVec 32))) (Undefined!8587) (MissingVacant!8587 (index!36719 (_ BitVec 32))) )
))
(declare-fun lt!360669 () SeekEntryResult!8587)

(assert (=> b!805721 (= lt!360669 (Found!8587 index!1236))))

(declare-fun b!805722 () Bool)

(declare-fun res!550182 () Bool)

(assert (=> b!805722 (=> (not res!550182) (not e!446179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43840 (_ BitVec 32)) Bool)

(assert (=> b!805722 (= res!550182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805723 () Bool)

(declare-fun res!550183 () Bool)

(assert (=> b!805723 (=> (not res!550183) (not e!446178))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805723 (= res!550183 (validKeyInArray!0 k0!2044))))

(declare-fun b!805724 () Bool)

(declare-fun res!550190 () Bool)

(assert (=> b!805724 (=> (not res!550190) (not e!446178))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805724 (= res!550190 (and (= (size!21420 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21420 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21420 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805725 () Bool)

(declare-fun res!550185 () Bool)

(assert (=> b!805725 (=> (not res!550185) (not e!446178))))

(declare-fun arrayContainsKey!0 (array!43840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805725 (= res!550185 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805726 () Bool)

(declare-fun res!550188 () Bool)

(assert (=> b!805726 (=> (not res!550188) (not e!446179))))

(declare-datatypes ((List!15001 0))(
  ( (Nil!14998) (Cons!14997 (h!16126 (_ BitVec 64)) (t!21307 List!15001)) )
))
(declare-fun arrayNoDuplicates!0 (array!43840 (_ BitVec 32) List!15001) Bool)

(assert (=> b!805726 (= res!550188 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14998))))

(declare-fun b!805727 () Bool)

(declare-fun e!446177 () Bool)

(assert (=> b!805727 (= e!446179 e!446177)))

(declare-fun res!550191 () Bool)

(assert (=> b!805727 (=> (not res!550191) (not e!446177))))

(declare-fun lt!360671 () SeekEntryResult!8587)

(assert (=> b!805727 (= res!550191 (= lt!360671 lt!360669))))

(declare-fun lt!360667 () array!43840)

(declare-fun lt!360665 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43840 (_ BitVec 32)) SeekEntryResult!8587)

(assert (=> b!805727 (= lt!360669 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360665 lt!360667 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43840 (_ BitVec 32)) SeekEntryResult!8587)

(assert (=> b!805727 (= lt!360671 (seekEntryOrOpen!0 lt!360665 lt!360667 mask!3266))))

(assert (=> b!805727 (= lt!360665 (select (store (arr!20999 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805727 (= lt!360667 (array!43841 (store (arr!20999 a!3170) i!1163 k0!2044) (size!21420 a!3170)))))

(declare-fun b!805728 () Bool)

(assert (=> b!805728 (= e!446178 e!446179)))

(declare-fun res!550186 () Bool)

(assert (=> b!805728 (=> (not res!550186) (not e!446179))))

(declare-fun lt!360666 () SeekEntryResult!8587)

(assert (=> b!805728 (= res!550186 (or (= lt!360666 (MissingZero!8587 i!1163)) (= lt!360666 (MissingVacant!8587 i!1163))))))

(assert (=> b!805728 (= lt!360666 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805729 () Bool)

(declare-fun res!550187 () Bool)

(assert (=> b!805729 (=> (not res!550187) (not e!446178))))

(assert (=> b!805729 (= res!550187 (validKeyInArray!0 (select (arr!20999 a!3170) j!153)))))

(declare-fun b!805730 () Bool)

(assert (=> b!805730 (= e!446177 e!446176)))

(declare-fun res!550189 () Bool)

(assert (=> b!805730 (=> (not res!550189) (not e!446176))))

(declare-fun lt!360668 () SeekEntryResult!8587)

(declare-fun lt!360670 () SeekEntryResult!8587)

(assert (=> b!805730 (= res!550189 (and (= lt!360668 lt!360670) (= lt!360670 (Found!8587 j!153)) (= (select (arr!20999 a!3170) index!1236) (select (arr!20999 a!3170) j!153))))))

(assert (=> b!805730 (= lt!360670 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20999 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!805730 (= lt!360668 (seekEntryOrOpen!0 (select (arr!20999 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69078 res!550181) b!805724))

(assert (= (and b!805724 res!550190) b!805729))

(assert (= (and b!805729 res!550187) b!805723))

(assert (= (and b!805723 res!550183) b!805725))

(assert (= (and b!805725 res!550185) b!805728))

(assert (= (and b!805728 res!550186) b!805722))

(assert (= (and b!805722 res!550182) b!805726))

(assert (= (and b!805726 res!550188) b!805720))

(assert (= (and b!805720 res!550184) b!805727))

(assert (= (and b!805727 res!550191) b!805730))

(assert (= (and b!805730 res!550189) b!805721))

(declare-fun m!747175 () Bool)

(assert (=> b!805727 m!747175))

(declare-fun m!747177 () Bool)

(assert (=> b!805727 m!747177))

(declare-fun m!747179 () Bool)

(assert (=> b!805727 m!747179))

(declare-fun m!747181 () Bool)

(assert (=> b!805727 m!747181))

(declare-fun m!747183 () Bool)

(assert (=> b!805728 m!747183))

(declare-fun m!747185 () Bool)

(assert (=> b!805725 m!747185))

(declare-fun m!747187 () Bool)

(assert (=> b!805720 m!747187))

(declare-fun m!747189 () Bool)

(assert (=> b!805720 m!747189))

(declare-fun m!747191 () Bool)

(assert (=> b!805722 m!747191))

(declare-fun m!747193 () Bool)

(assert (=> b!805730 m!747193))

(declare-fun m!747195 () Bool)

(assert (=> b!805730 m!747195))

(assert (=> b!805730 m!747195))

(declare-fun m!747197 () Bool)

(assert (=> b!805730 m!747197))

(assert (=> b!805730 m!747195))

(declare-fun m!747199 () Bool)

(assert (=> b!805730 m!747199))

(declare-fun m!747201 () Bool)

(assert (=> b!805726 m!747201))

(declare-fun m!747203 () Bool)

(assert (=> b!805723 m!747203))

(assert (=> b!805729 m!747195))

(assert (=> b!805729 m!747195))

(declare-fun m!747205 () Bool)

(assert (=> b!805729 m!747205))

(declare-fun m!747207 () Bool)

(assert (=> start!69078 m!747207))

(declare-fun m!747209 () Bool)

(assert (=> start!69078 m!747209))

(check-sat (not b!805725) (not b!805722) (not b!805730) (not b!805728) (not b!805729) (not b!805723) (not start!69078) (not b!805727) (not b!805726))
(check-sat)
