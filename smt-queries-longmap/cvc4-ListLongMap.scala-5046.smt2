; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68790 () Bool)

(assert start!68790)

(declare-fun b!801716 () Bool)

(declare-fun res!546241 () Bool)

(declare-fun e!444382 () Bool)

(assert (=> b!801716 (=> (not res!546241) (not e!444382))))

(declare-datatypes ((array!43580 0))(
  ( (array!43581 (arr!20870 (Array (_ BitVec 32) (_ BitVec 64))) (size!21291 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43580)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43580 (_ BitVec 32)) Bool)

(assert (=> b!801716 (= res!546241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801717 () Bool)

(declare-fun e!444381 () Bool)

(declare-fun e!444380 () Bool)

(assert (=> b!801717 (= e!444381 e!444380)))

(declare-fun res!546235 () Bool)

(assert (=> b!801717 (=> (not res!546235) (not e!444380))))

(declare-datatypes ((SeekEntryResult!8461 0))(
  ( (MissingZero!8461 (index!36212 (_ BitVec 32))) (Found!8461 (index!36213 (_ BitVec 32))) (Intermediate!8461 (undefined!9273 Bool) (index!36214 (_ BitVec 32)) (x!67067 (_ BitVec 32))) (Undefined!8461) (MissingVacant!8461 (index!36215 (_ BitVec 32))) )
))
(declare-fun lt!358396 () SeekEntryResult!8461)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358394 () SeekEntryResult!8461)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801717 (= res!546235 (and (= lt!358396 lt!358394) (= lt!358394 (Found!8461 j!153)) (not (= (select (arr!20870 a!3170) index!1236) (select (arr!20870 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43580 (_ BitVec 32)) SeekEntryResult!8461)

(assert (=> b!801717 (= lt!358394 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20870 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43580 (_ BitVec 32)) SeekEntryResult!8461)

(assert (=> b!801717 (= lt!358396 (seekEntryOrOpen!0 (select (arr!20870 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801718 () Bool)

(declare-fun res!546242 () Bool)

(declare-fun e!444383 () Bool)

(assert (=> b!801718 (=> (not res!546242) (not e!444383))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801718 (= res!546242 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801719 () Bool)

(declare-fun res!546236 () Bool)

(assert (=> b!801719 (=> (not res!546236) (not e!444382))))

(declare-datatypes ((List!14833 0))(
  ( (Nil!14830) (Cons!14829 (h!15958 (_ BitVec 64)) (t!21148 List!14833)) )
))
(declare-fun arrayNoDuplicates!0 (array!43580 (_ BitVec 32) List!14833) Bool)

(assert (=> b!801719 (= res!546236 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14830))))

(declare-fun res!546237 () Bool)

(assert (=> start!68790 (=> (not res!546237) (not e!444383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68790 (= res!546237 (validMask!0 mask!3266))))

(assert (=> start!68790 e!444383))

(assert (=> start!68790 true))

(declare-fun array_inv!16666 (array!43580) Bool)

(assert (=> start!68790 (array_inv!16666 a!3170)))

(declare-fun b!801720 () Bool)

(declare-fun res!546243 () Bool)

(assert (=> b!801720 (=> (not res!546243) (not e!444383))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801720 (= res!546243 (and (= (size!21291 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21291 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21291 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801721 () Bool)

(declare-fun res!546239 () Bool)

(assert (=> b!801721 (=> (not res!546239) (not e!444382))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!801721 (= res!546239 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21291 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20870 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21291 a!3170)) (= (select (arr!20870 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801722 () Bool)

(assert (=> b!801722 (= e!444380 (not true))))

(declare-fun lt!358399 () (_ BitVec 64))

(declare-fun lt!358398 () array!43580)

(declare-fun lt!358395 () (_ BitVec 32))

(assert (=> b!801722 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358395 vacantAfter!23 lt!358399 lt!358398 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358395 vacantBefore!23 (select (arr!20870 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27462 0))(
  ( (Unit!27463) )
))
(declare-fun lt!358397 () Unit!27462)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43580 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27462)

(assert (=> b!801722 (= lt!358397 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358395 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801722 (= lt!358395 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801723 () Bool)

(assert (=> b!801723 (= e!444383 e!444382)))

(declare-fun res!546240 () Bool)

(assert (=> b!801723 (=> (not res!546240) (not e!444382))))

(declare-fun lt!358400 () SeekEntryResult!8461)

(assert (=> b!801723 (= res!546240 (or (= lt!358400 (MissingZero!8461 i!1163)) (= lt!358400 (MissingVacant!8461 i!1163))))))

(assert (=> b!801723 (= lt!358400 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801724 () Bool)

(declare-fun res!546245 () Bool)

(assert (=> b!801724 (=> (not res!546245) (not e!444383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801724 (= res!546245 (validKeyInArray!0 k!2044))))

(declare-fun b!801725 () Bool)

(assert (=> b!801725 (= e!444382 e!444381)))

(declare-fun res!546244 () Bool)

(assert (=> b!801725 (=> (not res!546244) (not e!444381))))

(assert (=> b!801725 (= res!546244 (= (seekEntryOrOpen!0 lt!358399 lt!358398 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358399 lt!358398 mask!3266)))))

(assert (=> b!801725 (= lt!358399 (select (store (arr!20870 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801725 (= lt!358398 (array!43581 (store (arr!20870 a!3170) i!1163 k!2044) (size!21291 a!3170)))))

(declare-fun b!801726 () Bool)

(declare-fun res!546238 () Bool)

(assert (=> b!801726 (=> (not res!546238) (not e!444383))))

(assert (=> b!801726 (= res!546238 (validKeyInArray!0 (select (arr!20870 a!3170) j!153)))))

(assert (= (and start!68790 res!546237) b!801720))

(assert (= (and b!801720 res!546243) b!801726))

(assert (= (and b!801726 res!546238) b!801724))

(assert (= (and b!801724 res!546245) b!801718))

(assert (= (and b!801718 res!546242) b!801723))

(assert (= (and b!801723 res!546240) b!801716))

(assert (= (and b!801716 res!546241) b!801719))

(assert (= (and b!801719 res!546236) b!801721))

(assert (= (and b!801721 res!546239) b!801725))

(assert (= (and b!801725 res!546244) b!801717))

(assert (= (and b!801717 res!546235) b!801722))

(declare-fun m!742923 () Bool)

(assert (=> b!801722 m!742923))

(declare-fun m!742925 () Bool)

(assert (=> b!801722 m!742925))

(declare-fun m!742927 () Bool)

(assert (=> b!801722 m!742927))

(assert (=> b!801722 m!742923))

(declare-fun m!742929 () Bool)

(assert (=> b!801722 m!742929))

(declare-fun m!742931 () Bool)

(assert (=> b!801722 m!742931))

(declare-fun m!742933 () Bool)

(assert (=> b!801717 m!742933))

(assert (=> b!801717 m!742923))

(assert (=> b!801717 m!742923))

(declare-fun m!742935 () Bool)

(assert (=> b!801717 m!742935))

(assert (=> b!801717 m!742923))

(declare-fun m!742937 () Bool)

(assert (=> b!801717 m!742937))

(declare-fun m!742939 () Bool)

(assert (=> b!801719 m!742939))

(declare-fun m!742941 () Bool)

(assert (=> b!801716 m!742941))

(declare-fun m!742943 () Bool)

(assert (=> b!801718 m!742943))

(declare-fun m!742945 () Bool)

(assert (=> b!801723 m!742945))

(assert (=> b!801726 m!742923))

(assert (=> b!801726 m!742923))

(declare-fun m!742947 () Bool)

(assert (=> b!801726 m!742947))

(declare-fun m!742949 () Bool)

(assert (=> b!801725 m!742949))

(declare-fun m!742951 () Bool)

(assert (=> b!801725 m!742951))

(declare-fun m!742953 () Bool)

(assert (=> b!801725 m!742953))

(declare-fun m!742955 () Bool)

(assert (=> b!801725 m!742955))

(declare-fun m!742957 () Bool)

(assert (=> b!801724 m!742957))

(declare-fun m!742959 () Bool)

(assert (=> start!68790 m!742959))

(declare-fun m!742961 () Bool)

(assert (=> start!68790 m!742961))

(declare-fun m!742963 () Bool)

(assert (=> b!801721 m!742963))

(declare-fun m!742965 () Bool)

(assert (=> b!801721 m!742965))

(push 1)

