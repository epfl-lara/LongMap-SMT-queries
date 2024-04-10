; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69098 () Bool)

(assert start!69098)

(declare-fun b!805970 () Bool)

(declare-fun res!550294 () Bool)

(declare-fun e!446330 () Bool)

(assert (=> b!805970 (=> (not res!550294) (not e!446330))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43843 0))(
  ( (array!43844 (arr!21000 (Array (_ BitVec 32) (_ BitVec 64))) (size!21421 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43843)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805970 (= res!550294 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21421 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21000 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21421 a!3170)) (= (select (arr!21000 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805971 () Bool)

(declare-fun e!446333 () Bool)

(assert (=> b!805971 (= e!446333 (not true))))

(declare-datatypes ((SeekEntryResult!8591 0))(
  ( (MissingZero!8591 (index!36732 (_ BitVec 32))) (Found!8591 (index!36733 (_ BitVec 32))) (Intermediate!8591 (undefined!9403 Bool) (index!36734 (_ BitVec 32)) (x!67552 (_ BitVec 32))) (Undefined!8591) (MissingVacant!8591 (index!36735 (_ BitVec 32))) )
))
(declare-fun lt!360908 () SeekEntryResult!8591)

(assert (=> b!805971 (= lt!360908 (Found!8591 index!1236))))

(declare-fun b!805972 () Bool)

(declare-fun res!550299 () Bool)

(assert (=> b!805972 (=> (not res!550299) (not e!446330))))

(declare-datatypes ((List!14963 0))(
  ( (Nil!14960) (Cons!14959 (h!16088 (_ BitVec 64)) (t!21278 List!14963)) )
))
(declare-fun arrayNoDuplicates!0 (array!43843 (_ BitVec 32) List!14963) Bool)

(assert (=> b!805972 (= res!550299 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14960))))

(declare-fun b!805973 () Bool)

(declare-fun e!446331 () Bool)

(assert (=> b!805973 (= e!446331 e!446333)))

(declare-fun res!550297 () Bool)

(assert (=> b!805973 (=> (not res!550297) (not e!446333))))

(declare-fun lt!360907 () SeekEntryResult!8591)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!360910 () SeekEntryResult!8591)

(assert (=> b!805973 (= res!550297 (and (= lt!360910 lt!360907) (= lt!360907 (Found!8591 j!153)) (= (select (arr!21000 a!3170) index!1236) (select (arr!21000 a!3170) j!153))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43843 (_ BitVec 32)) SeekEntryResult!8591)

(assert (=> b!805973 (= lt!360907 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21000 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43843 (_ BitVec 32)) SeekEntryResult!8591)

(assert (=> b!805973 (= lt!360910 (seekEntryOrOpen!0 (select (arr!21000 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805974 () Bool)

(declare-fun res!550301 () Bool)

(declare-fun e!446332 () Bool)

(assert (=> b!805974 (=> (not res!550301) (not e!446332))))

(assert (=> b!805974 (= res!550301 (and (= (size!21421 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21421 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21421 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805976 () Bool)

(declare-fun res!550292 () Bool)

(assert (=> b!805976 (=> (not res!550292) (not e!446330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43843 (_ BitVec 32)) Bool)

(assert (=> b!805976 (= res!550292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805977 () Bool)

(declare-fun res!550296 () Bool)

(assert (=> b!805977 (=> (not res!550296) (not e!446332))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805977 (= res!550296 (validKeyInArray!0 k!2044))))

(declare-fun b!805978 () Bool)

(declare-fun res!550291 () Bool)

(assert (=> b!805978 (=> (not res!550291) (not e!446332))))

(assert (=> b!805978 (= res!550291 (validKeyInArray!0 (select (arr!21000 a!3170) j!153)))))

(declare-fun b!805979 () Bool)

(assert (=> b!805979 (= e!446330 e!446331)))

(declare-fun res!550293 () Bool)

(assert (=> b!805979 (=> (not res!550293) (not e!446331))))

(declare-fun lt!360909 () SeekEntryResult!8591)

(assert (=> b!805979 (= res!550293 (= lt!360909 lt!360908))))

(declare-fun lt!360906 () array!43843)

(declare-fun lt!360911 () (_ BitVec 64))

(assert (=> b!805979 (= lt!360908 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360911 lt!360906 mask!3266))))

(assert (=> b!805979 (= lt!360909 (seekEntryOrOpen!0 lt!360911 lt!360906 mask!3266))))

(assert (=> b!805979 (= lt!360911 (select (store (arr!21000 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805979 (= lt!360906 (array!43844 (store (arr!21000 a!3170) i!1163 k!2044) (size!21421 a!3170)))))

(declare-fun b!805980 () Bool)

(assert (=> b!805980 (= e!446332 e!446330)))

(declare-fun res!550300 () Bool)

(assert (=> b!805980 (=> (not res!550300) (not e!446330))))

(declare-fun lt!360905 () SeekEntryResult!8591)

(assert (=> b!805980 (= res!550300 (or (= lt!360905 (MissingZero!8591 i!1163)) (= lt!360905 (MissingVacant!8591 i!1163))))))

(assert (=> b!805980 (= lt!360905 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805975 () Bool)

(declare-fun res!550298 () Bool)

(assert (=> b!805975 (=> (not res!550298) (not e!446332))))

(declare-fun arrayContainsKey!0 (array!43843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805975 (= res!550298 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!550295 () Bool)

(assert (=> start!69098 (=> (not res!550295) (not e!446332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69098 (= res!550295 (validMask!0 mask!3266))))

(assert (=> start!69098 e!446332))

(assert (=> start!69098 true))

(declare-fun array_inv!16796 (array!43843) Bool)

(assert (=> start!69098 (array_inv!16796 a!3170)))

(assert (= (and start!69098 res!550295) b!805974))

(assert (= (and b!805974 res!550301) b!805978))

(assert (= (and b!805978 res!550291) b!805977))

(assert (= (and b!805977 res!550296) b!805975))

(assert (= (and b!805975 res!550298) b!805980))

(assert (= (and b!805980 res!550300) b!805976))

(assert (= (and b!805976 res!550292) b!805972))

(assert (= (and b!805972 res!550299) b!805970))

(assert (= (and b!805970 res!550294) b!805979))

(assert (= (and b!805979 res!550293) b!805973))

(assert (= (and b!805973 res!550297) b!805971))

(declare-fun m!747917 () Bool)

(assert (=> b!805976 m!747917))

(declare-fun m!747919 () Bool)

(assert (=> b!805977 m!747919))

(declare-fun m!747921 () Bool)

(assert (=> b!805973 m!747921))

(declare-fun m!747923 () Bool)

(assert (=> b!805973 m!747923))

(assert (=> b!805973 m!747923))

(declare-fun m!747925 () Bool)

(assert (=> b!805973 m!747925))

(assert (=> b!805973 m!747923))

(declare-fun m!747927 () Bool)

(assert (=> b!805973 m!747927))

(declare-fun m!747929 () Bool)

(assert (=> b!805980 m!747929))

(declare-fun m!747931 () Bool)

(assert (=> b!805972 m!747931))

(assert (=> b!805978 m!747923))

(assert (=> b!805978 m!747923))

(declare-fun m!747933 () Bool)

(assert (=> b!805978 m!747933))

(declare-fun m!747935 () Bool)

(assert (=> b!805979 m!747935))

(declare-fun m!747937 () Bool)

(assert (=> b!805979 m!747937))

(declare-fun m!747939 () Bool)

(assert (=> b!805979 m!747939))

(declare-fun m!747941 () Bool)

(assert (=> b!805979 m!747941))

(declare-fun m!747943 () Bool)

(assert (=> b!805975 m!747943))

(declare-fun m!747945 () Bool)

(assert (=> start!69098 m!747945))

(declare-fun m!747947 () Bool)

(assert (=> start!69098 m!747947))

(declare-fun m!747949 () Bool)

(assert (=> b!805970 m!747949))

(declare-fun m!747951 () Bool)

(assert (=> b!805970 m!747951))

(push 1)

