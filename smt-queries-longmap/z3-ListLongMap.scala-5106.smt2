; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69410 () Bool)

(assert start!69410)

(declare-fun b!808721 () Bool)

(declare-fun e!447802 () Bool)

(declare-fun e!447805 () Bool)

(assert (=> b!808721 (= e!447802 e!447805)))

(declare-fun res!552305 () Bool)

(assert (=> b!808721 (=> (not res!552305) (not e!447805))))

(declare-datatypes ((SeekEntryResult!8590 0))(
  ( (MissingZero!8590 (index!36728 (_ BitVec 32))) (Found!8590 (index!36729 (_ BitVec 32))) (Intermediate!8590 (undefined!9402 Bool) (index!36730 (_ BitVec 32)) (x!67696 (_ BitVec 32))) (Undefined!8590) (MissingVacant!8590 (index!36731 (_ BitVec 32))) )
))
(declare-fun lt!362303 () SeekEntryResult!8590)

(declare-datatypes ((array!43942 0))(
  ( (array!43943 (arr!21043 (Array (_ BitVec 32) (_ BitVec 64))) (size!21463 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43942)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!362305 () SeekEntryResult!8590)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808721 (= res!552305 (and (= lt!362305 lt!362303) (= lt!362303 (Found!8590 j!153)) (not (= (select (arr!21043 a!3170) index!1236) (select (arr!21043 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43942 (_ BitVec 32)) SeekEntryResult!8590)

(assert (=> b!808721 (= lt!362303 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21043 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43942 (_ BitVec 32)) SeekEntryResult!8590)

(assert (=> b!808721 (= lt!362305 (seekEntryOrOpen!0 (select (arr!21043 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808722 () Bool)

(declare-fun e!447801 () Bool)

(declare-fun e!447804 () Bool)

(assert (=> b!808722 (= e!447801 e!447804)))

(declare-fun res!552299 () Bool)

(assert (=> b!808722 (=> (not res!552299) (not e!447804))))

(declare-fun lt!362301 () SeekEntryResult!8590)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808722 (= res!552299 (or (= lt!362301 (MissingZero!8590 i!1163)) (= lt!362301 (MissingVacant!8590 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!808722 (= lt!362301 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808723 () Bool)

(declare-fun res!552297 () Bool)

(assert (=> b!808723 (=> (not res!552297) (not e!447804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43942 (_ BitVec 32)) Bool)

(assert (=> b!808723 (= res!552297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808724 () Bool)

(assert (=> b!808724 (= e!447805 false)))

(declare-fun lt!362304 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808724 (= lt!362304 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!808725 () Bool)

(declare-fun res!552300 () Bool)

(assert (=> b!808725 (=> (not res!552300) (not e!447801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808725 (= res!552300 (validKeyInArray!0 (select (arr!21043 a!3170) j!153)))))

(declare-fun res!552303 () Bool)

(assert (=> start!69410 (=> (not res!552303) (not e!447801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69410 (= res!552303 (validMask!0 mask!3266))))

(assert (=> start!69410 e!447801))

(assert (=> start!69410 true))

(declare-fun array_inv!16902 (array!43942) Bool)

(assert (=> start!69410 (array_inv!16902 a!3170)))

(declare-fun b!808726 () Bool)

(declare-fun res!552302 () Bool)

(assert (=> b!808726 (=> (not res!552302) (not e!447804))))

(declare-datatypes ((List!14913 0))(
  ( (Nil!14910) (Cons!14909 (h!16044 (_ BitVec 64)) (t!21220 List!14913)) )
))
(declare-fun arrayNoDuplicates!0 (array!43942 (_ BitVec 32) List!14913) Bool)

(assert (=> b!808726 (= res!552302 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14910))))

(declare-fun b!808727 () Bool)

(assert (=> b!808727 (= e!447804 e!447802)))

(declare-fun res!552298 () Bool)

(assert (=> b!808727 (=> (not res!552298) (not e!447802))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362306 () array!43942)

(declare-fun lt!362302 () (_ BitVec 64))

(assert (=> b!808727 (= res!552298 (= (seekEntryOrOpen!0 lt!362302 lt!362306 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362302 lt!362306 mask!3266)))))

(assert (=> b!808727 (= lt!362302 (select (store (arr!21043 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808727 (= lt!362306 (array!43943 (store (arr!21043 a!3170) i!1163 k0!2044) (size!21463 a!3170)))))

(declare-fun b!808728 () Bool)

(declare-fun res!552304 () Bool)

(assert (=> b!808728 (=> (not res!552304) (not e!447801))))

(declare-fun arrayContainsKey!0 (array!43942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808728 (= res!552304 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808729 () Bool)

(declare-fun res!552301 () Bool)

(assert (=> b!808729 (=> (not res!552301) (not e!447804))))

(assert (=> b!808729 (= res!552301 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21463 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21043 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21463 a!3170)) (= (select (arr!21043 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808730 () Bool)

(declare-fun res!552306 () Bool)

(assert (=> b!808730 (=> (not res!552306) (not e!447801))))

(assert (=> b!808730 (= res!552306 (validKeyInArray!0 k0!2044))))

(declare-fun b!808731 () Bool)

(declare-fun res!552296 () Bool)

(assert (=> b!808731 (=> (not res!552296) (not e!447801))))

(assert (=> b!808731 (= res!552296 (and (= (size!21463 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21463 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21463 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69410 res!552303) b!808731))

(assert (= (and b!808731 res!552296) b!808725))

(assert (= (and b!808725 res!552300) b!808730))

(assert (= (and b!808730 res!552306) b!808728))

(assert (= (and b!808728 res!552304) b!808722))

(assert (= (and b!808722 res!552299) b!808723))

(assert (= (and b!808723 res!552297) b!808726))

(assert (= (and b!808726 res!552302) b!808729))

(assert (= (and b!808729 res!552301) b!808727))

(assert (= (and b!808727 res!552298) b!808721))

(assert (= (and b!808721 res!552305) b!808724))

(declare-fun m!751183 () Bool)

(assert (=> b!808726 m!751183))

(declare-fun m!751185 () Bool)

(assert (=> b!808724 m!751185))

(declare-fun m!751187 () Bool)

(assert (=> b!808725 m!751187))

(assert (=> b!808725 m!751187))

(declare-fun m!751189 () Bool)

(assert (=> b!808725 m!751189))

(declare-fun m!751191 () Bool)

(assert (=> b!808727 m!751191))

(declare-fun m!751193 () Bool)

(assert (=> b!808727 m!751193))

(declare-fun m!751195 () Bool)

(assert (=> b!808727 m!751195))

(declare-fun m!751197 () Bool)

(assert (=> b!808727 m!751197))

(declare-fun m!751199 () Bool)

(assert (=> b!808723 m!751199))

(declare-fun m!751201 () Bool)

(assert (=> b!808721 m!751201))

(assert (=> b!808721 m!751187))

(assert (=> b!808721 m!751187))

(declare-fun m!751203 () Bool)

(assert (=> b!808721 m!751203))

(assert (=> b!808721 m!751187))

(declare-fun m!751205 () Bool)

(assert (=> b!808721 m!751205))

(declare-fun m!751207 () Bool)

(assert (=> b!808729 m!751207))

(declare-fun m!751209 () Bool)

(assert (=> b!808729 m!751209))

(declare-fun m!751211 () Bool)

(assert (=> b!808722 m!751211))

(declare-fun m!751213 () Bool)

(assert (=> start!69410 m!751213))

(declare-fun m!751215 () Bool)

(assert (=> start!69410 m!751215))

(declare-fun m!751217 () Bool)

(assert (=> b!808730 m!751217))

(declare-fun m!751219 () Bool)

(assert (=> b!808728 m!751219))

(check-sat (not b!808728) (not b!808722) (not b!808726) (not b!808721) (not b!808725) (not b!808727) (not b!808724) (not start!69410) (not b!808730) (not b!808723))
(check-sat)
