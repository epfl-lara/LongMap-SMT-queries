; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68850 () Bool)

(assert start!68850)

(declare-fun res!547484 () Bool)

(declare-fun e!444863 () Bool)

(assert (=> start!68850 (=> (not res!547484) (not e!444863))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68850 (= res!547484 (validMask!0 mask!3266))))

(assert (=> start!68850 e!444863))

(assert (=> start!68850 true))

(declare-datatypes ((array!43657 0))(
  ( (array!43658 (arr!20909 (Array (_ BitVec 32) (_ BitVec 64))) (size!21330 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43657)

(declare-fun array_inv!16792 (array!43657) Bool)

(assert (=> start!68850 (array_inv!16792 a!3170)))

(declare-datatypes ((SeekEntryResult!8497 0))(
  ( (MissingZero!8497 (index!36356 (_ BitVec 32))) (Found!8497 (index!36357 (_ BitVec 32))) (Intermediate!8497 (undefined!9309 Bool) (index!36358 (_ BitVec 32)) (x!67210 (_ BitVec 32))) (Undefined!8497) (MissingVacant!8497 (index!36359 (_ BitVec 32))) )
))
(declare-fun lt!359084 () SeekEntryResult!8497)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun b!802824 () Bool)

(declare-fun lt!359083 () SeekEntryResult!8497)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun e!444866 () Bool)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802824 (= e!444866 (not (or (not (= lt!359084 lt!359083)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20909 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!359087 () (_ BitVec 32))

(declare-fun lt!359082 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!359081 () array!43657)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43657 (_ BitVec 32)) SeekEntryResult!8497)

(assert (=> b!802824 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359087 vacantAfter!23 lt!359082 lt!359081 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359087 vacantBefore!23 (select (arr!20909 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27508 0))(
  ( (Unit!27509) )
))
(declare-fun lt!359085 () Unit!27508)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27508)

(assert (=> b!802824 (= lt!359085 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359087 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802824 (= lt!359087 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802825 () Bool)

(declare-fun res!547492 () Bool)

(declare-fun e!444868 () Bool)

(assert (=> b!802825 (=> (not res!547492) (not e!444868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43657 (_ BitVec 32)) Bool)

(assert (=> b!802825 (= res!547492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802826 () Bool)

(declare-fun e!444865 () Bool)

(declare-fun e!444867 () Bool)

(assert (=> b!802826 (= e!444865 e!444867)))

(declare-fun res!547493 () Bool)

(assert (=> b!802826 (=> (not res!547493) (not e!444867))))

(declare-fun lt!359089 () SeekEntryResult!8497)

(declare-fun lt!359090 () SeekEntryResult!8497)

(assert (=> b!802826 (= res!547493 (= lt!359089 lt!359090))))

(assert (=> b!802826 (= lt!359090 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20909 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43657 (_ BitVec 32)) SeekEntryResult!8497)

(assert (=> b!802826 (= lt!359089 (seekEntryOrOpen!0 (select (arr!20909 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802827 () Bool)

(assert (=> b!802827 (= e!444868 e!444865)))

(declare-fun res!547490 () Bool)

(assert (=> b!802827 (=> (not res!547490) (not e!444865))))

(declare-fun lt!359086 () SeekEntryResult!8497)

(assert (=> b!802827 (= res!547490 (= lt!359086 lt!359084))))

(assert (=> b!802827 (= lt!359084 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359082 lt!359081 mask!3266))))

(assert (=> b!802827 (= lt!359086 (seekEntryOrOpen!0 lt!359082 lt!359081 mask!3266))))

(assert (=> b!802827 (= lt!359082 (select (store (arr!20909 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802827 (= lt!359081 (array!43658 (store (arr!20909 a!3170) i!1163 k0!2044) (size!21330 a!3170)))))

(declare-fun b!802828 () Bool)

(declare-fun res!547483 () Bool)

(assert (=> b!802828 (=> (not res!547483) (not e!444863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802828 (= res!547483 (validKeyInArray!0 k0!2044))))

(declare-fun b!802829 () Bool)

(assert (=> b!802829 (= e!444863 e!444868)))

(declare-fun res!547491 () Bool)

(assert (=> b!802829 (=> (not res!547491) (not e!444868))))

(declare-fun lt!359088 () SeekEntryResult!8497)

(assert (=> b!802829 (= res!547491 (or (= lt!359088 (MissingZero!8497 i!1163)) (= lt!359088 (MissingVacant!8497 i!1163))))))

(assert (=> b!802829 (= lt!359088 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802830 () Bool)

(declare-fun res!547494 () Bool)

(assert (=> b!802830 (=> (not res!547494) (not e!444868))))

(declare-datatypes ((List!14911 0))(
  ( (Nil!14908) (Cons!14907 (h!16036 (_ BitVec 64)) (t!21217 List!14911)) )
))
(declare-fun arrayNoDuplicates!0 (array!43657 (_ BitVec 32) List!14911) Bool)

(assert (=> b!802830 (= res!547494 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14908))))

(declare-fun b!802831 () Bool)

(declare-fun res!547486 () Bool)

(assert (=> b!802831 (=> (not res!547486) (not e!444863))))

(declare-fun arrayContainsKey!0 (array!43657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802831 (= res!547486 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802832 () Bool)

(declare-fun res!547488 () Bool)

(assert (=> b!802832 (=> (not res!547488) (not e!444863))))

(assert (=> b!802832 (= res!547488 (and (= (size!21330 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21330 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21330 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802833 () Bool)

(assert (=> b!802833 (= e!444867 e!444866)))

(declare-fun res!547485 () Bool)

(assert (=> b!802833 (=> (not res!547485) (not e!444866))))

(assert (=> b!802833 (= res!547485 (and (= lt!359090 lt!359083) (not (= (select (arr!20909 a!3170) index!1236) (select (arr!20909 a!3170) j!153)))))))

(assert (=> b!802833 (= lt!359083 (Found!8497 j!153))))

(declare-fun b!802834 () Bool)

(declare-fun res!547489 () Bool)

(assert (=> b!802834 (=> (not res!547489) (not e!444868))))

(assert (=> b!802834 (= res!547489 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21330 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20909 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21330 a!3170)) (= (select (arr!20909 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802835 () Bool)

(declare-fun res!547487 () Bool)

(assert (=> b!802835 (=> (not res!547487) (not e!444863))))

(assert (=> b!802835 (= res!547487 (validKeyInArray!0 (select (arr!20909 a!3170) j!153)))))

(assert (= (and start!68850 res!547484) b!802832))

(assert (= (and b!802832 res!547488) b!802835))

(assert (= (and b!802835 res!547487) b!802828))

(assert (= (and b!802828 res!547483) b!802831))

(assert (= (and b!802831 res!547486) b!802829))

(assert (= (and b!802829 res!547491) b!802825))

(assert (= (and b!802825 res!547492) b!802830))

(assert (= (and b!802830 res!547494) b!802834))

(assert (= (and b!802834 res!547489) b!802827))

(assert (= (and b!802827 res!547490) b!802826))

(assert (= (and b!802826 res!547493) b!802833))

(assert (= (and b!802833 res!547485) b!802824))

(declare-fun m!743959 () Bool)

(assert (=> b!802825 m!743959))

(declare-fun m!743961 () Bool)

(assert (=> b!802834 m!743961))

(declare-fun m!743963 () Bool)

(assert (=> b!802834 m!743963))

(declare-fun m!743965 () Bool)

(assert (=> b!802835 m!743965))

(assert (=> b!802835 m!743965))

(declare-fun m!743967 () Bool)

(assert (=> b!802835 m!743967))

(assert (=> b!802826 m!743965))

(assert (=> b!802826 m!743965))

(declare-fun m!743969 () Bool)

(assert (=> b!802826 m!743969))

(assert (=> b!802826 m!743965))

(declare-fun m!743971 () Bool)

(assert (=> b!802826 m!743971))

(declare-fun m!743973 () Bool)

(assert (=> b!802827 m!743973))

(declare-fun m!743975 () Bool)

(assert (=> b!802827 m!743975))

(declare-fun m!743977 () Bool)

(assert (=> b!802827 m!743977))

(declare-fun m!743979 () Bool)

(assert (=> b!802827 m!743979))

(declare-fun m!743981 () Bool)

(assert (=> b!802831 m!743981))

(declare-fun m!743983 () Bool)

(assert (=> b!802830 m!743983))

(declare-fun m!743985 () Bool)

(assert (=> b!802833 m!743985))

(assert (=> b!802833 m!743965))

(declare-fun m!743987 () Bool)

(assert (=> b!802829 m!743987))

(declare-fun m!743989 () Bool)

(assert (=> start!68850 m!743989))

(declare-fun m!743991 () Bool)

(assert (=> start!68850 m!743991))

(declare-fun m!743993 () Bool)

(assert (=> b!802828 m!743993))

(declare-fun m!743995 () Bool)

(assert (=> b!802824 m!743995))

(assert (=> b!802824 m!743965))

(declare-fun m!743997 () Bool)

(assert (=> b!802824 m!743997))

(assert (=> b!802824 m!743965))

(declare-fun m!743999 () Bool)

(assert (=> b!802824 m!743999))

(declare-fun m!744001 () Bool)

(assert (=> b!802824 m!744001))

(declare-fun m!744003 () Bool)

(assert (=> b!802824 m!744003))

(assert (=> b!802824 m!743977))

(check-sat (not b!802827) (not b!802830) (not b!802825) (not b!802835) (not b!802824) (not b!802831) (not b!802828) (not b!802826) (not b!802829) (not start!68850))
(check-sat)
