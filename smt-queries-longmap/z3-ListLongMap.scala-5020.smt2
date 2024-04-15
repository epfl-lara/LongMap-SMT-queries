; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68610 () Bool)

(assert start!68610)

(declare-fun res!543076 () Bool)

(declare-fun e!442827 () Bool)

(assert (=> start!68610 (=> (not res!543076) (not e!442827))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68610 (= res!543076 (validMask!0 mask!3266))))

(assert (=> start!68610 e!442827))

(assert (=> start!68610 true))

(declare-datatypes ((array!43417 0))(
  ( (array!43418 (arr!20789 (Array (_ BitVec 32) (_ BitVec 64))) (size!21210 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43417)

(declare-fun array_inv!16672 (array!43417) Bool)

(assert (=> start!68610 (array_inv!16672 a!3170)))

(declare-fun b!798410 () Bool)

(declare-fun res!543073 () Bool)

(assert (=> b!798410 (=> (not res!543073) (not e!442827))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798410 (= res!543073 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798411 () Bool)

(declare-fun res!543072 () Bool)

(assert (=> b!798411 (=> (not res!543072) (not e!442827))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798411 (= res!543072 (and (= (size!21210 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21210 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21210 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798412 () Bool)

(declare-fun res!543069 () Bool)

(declare-fun e!442825 () Bool)

(assert (=> b!798412 (=> (not res!543069) (not e!442825))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798412 (= res!543069 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21210 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20789 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21210 a!3170)) (= (select (arr!20789 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798413 () Bool)

(declare-fun e!442826 () Bool)

(assert (=> b!798413 (= e!442825 e!442826)))

(declare-fun res!543070 () Bool)

(assert (=> b!798413 (=> (not res!543070) (not e!442826))))

(declare-fun lt!356293 () array!43417)

(declare-fun lt!356290 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8377 0))(
  ( (MissingZero!8377 (index!35876 (_ BitVec 32))) (Found!8377 (index!35877 (_ BitVec 32))) (Intermediate!8377 (undefined!9189 Bool) (index!35878 (_ BitVec 32)) (x!66770 (_ BitVec 32))) (Undefined!8377) (MissingVacant!8377 (index!35879 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43417 (_ BitVec 32)) SeekEntryResult!8377)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43417 (_ BitVec 32)) SeekEntryResult!8377)

(assert (=> b!798413 (= res!543070 (= (seekEntryOrOpen!0 lt!356290 lt!356293 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356290 lt!356293 mask!3266)))))

(assert (=> b!798413 (= lt!356290 (select (store (arr!20789 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798413 (= lt!356293 (array!43418 (store (arr!20789 a!3170) i!1163 k0!2044) (size!21210 a!3170)))))

(declare-fun b!798414 () Bool)

(declare-fun res!543077 () Bool)

(assert (=> b!798414 (=> (not res!543077) (not e!442827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798414 (= res!543077 (validKeyInArray!0 (select (arr!20789 a!3170) j!153)))))

(declare-fun b!798415 () Bool)

(declare-fun res!543075 () Bool)

(assert (=> b!798415 (=> (not res!543075) (not e!442827))))

(assert (=> b!798415 (= res!543075 (validKeyInArray!0 k0!2044))))

(declare-fun b!798416 () Bool)

(declare-fun res!543071 () Bool)

(assert (=> b!798416 (=> (not res!543071) (not e!442825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43417 (_ BitVec 32)) Bool)

(assert (=> b!798416 (= res!543071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798417 () Bool)

(assert (=> b!798417 (= e!442827 e!442825)))

(declare-fun res!543078 () Bool)

(assert (=> b!798417 (=> (not res!543078) (not e!442825))))

(declare-fun lt!356292 () SeekEntryResult!8377)

(assert (=> b!798417 (= res!543078 (or (= lt!356292 (MissingZero!8377 i!1163)) (= lt!356292 (MissingVacant!8377 i!1163))))))

(assert (=> b!798417 (= lt!356292 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798418 () Bool)

(declare-fun res!543074 () Bool)

(assert (=> b!798418 (=> (not res!543074) (not e!442825))))

(declare-datatypes ((List!14791 0))(
  ( (Nil!14788) (Cons!14787 (h!15916 (_ BitVec 64)) (t!21097 List!14791)) )
))
(declare-fun arrayNoDuplicates!0 (array!43417 (_ BitVec 32) List!14791) Bool)

(assert (=> b!798418 (= res!543074 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14788))))

(declare-fun lt!356291 () SeekEntryResult!8377)

(declare-fun lt!356294 () SeekEntryResult!8377)

(declare-fun b!798419 () Bool)

(assert (=> b!798419 (= e!442826 (and (= lt!356294 lt!356291) (= lt!356291 (Found!8377 j!153)) (not (= (select (arr!20789 a!3170) index!1236) (select (arr!20789 a!3170) j!153))) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (=> b!798419 (= lt!356291 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20789 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798419 (= lt!356294 (seekEntryOrOpen!0 (select (arr!20789 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68610 res!543076) b!798411))

(assert (= (and b!798411 res!543072) b!798414))

(assert (= (and b!798414 res!543077) b!798415))

(assert (= (and b!798415 res!543075) b!798410))

(assert (= (and b!798410 res!543073) b!798417))

(assert (= (and b!798417 res!543078) b!798416))

(assert (= (and b!798416 res!543071) b!798418))

(assert (= (and b!798418 res!543074) b!798412))

(assert (= (and b!798412 res!543069) b!798413))

(assert (= (and b!798413 res!543070) b!798419))

(declare-fun m!738859 () Bool)

(assert (=> b!798412 m!738859))

(declare-fun m!738861 () Bool)

(assert (=> b!798412 m!738861))

(declare-fun m!738863 () Bool)

(assert (=> b!798416 m!738863))

(declare-fun m!738865 () Bool)

(assert (=> b!798415 m!738865))

(declare-fun m!738867 () Bool)

(assert (=> b!798419 m!738867))

(declare-fun m!738869 () Bool)

(assert (=> b!798419 m!738869))

(assert (=> b!798419 m!738869))

(declare-fun m!738871 () Bool)

(assert (=> b!798419 m!738871))

(assert (=> b!798419 m!738869))

(declare-fun m!738873 () Bool)

(assert (=> b!798419 m!738873))

(assert (=> b!798414 m!738869))

(assert (=> b!798414 m!738869))

(declare-fun m!738875 () Bool)

(assert (=> b!798414 m!738875))

(declare-fun m!738877 () Bool)

(assert (=> start!68610 m!738877))

(declare-fun m!738879 () Bool)

(assert (=> start!68610 m!738879))

(declare-fun m!738881 () Bool)

(assert (=> b!798410 m!738881))

(declare-fun m!738883 () Bool)

(assert (=> b!798413 m!738883))

(declare-fun m!738885 () Bool)

(assert (=> b!798413 m!738885))

(declare-fun m!738887 () Bool)

(assert (=> b!798413 m!738887))

(declare-fun m!738889 () Bool)

(assert (=> b!798413 m!738889))

(declare-fun m!738891 () Bool)

(assert (=> b!798418 m!738891))

(declare-fun m!738893 () Bool)

(assert (=> b!798417 m!738893))

(check-sat (not b!798413) (not b!798419) (not b!798415) (not b!798416) (not b!798410) (not b!798417) (not b!798418) (not start!68610) (not b!798414))
(check-sat)
