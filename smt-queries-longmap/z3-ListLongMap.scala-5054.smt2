; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68836 () Bool)

(assert start!68836)

(declare-fun b!802484 () Bool)

(declare-fun res!547004 () Bool)

(declare-fun e!444736 () Bool)

(assert (=> b!802484 (=> (not res!547004) (not e!444736))))

(declare-datatypes ((array!43626 0))(
  ( (array!43627 (arr!20893 (Array (_ BitVec 32) (_ BitVec 64))) (size!21314 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43626)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43626 (_ BitVec 32)) Bool)

(assert (=> b!802484 (= res!547004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802485 () Bool)

(declare-fun res!547011 () Bool)

(declare-fun e!444737 () Bool)

(assert (=> b!802485 (=> (not res!547011) (not e!444737))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802485 (= res!547011 (and (= (size!21314 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21314 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21314 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802486 () Bool)

(declare-fun res!547003 () Bool)

(assert (=> b!802486 (=> (not res!547003) (not e!444737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802486 (= res!547003 (validKeyInArray!0 (select (arr!20893 a!3170) j!153)))))

(declare-fun b!802487 () Bool)

(declare-fun res!547013 () Bool)

(assert (=> b!802487 (=> (not res!547013) (not e!444737))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!802487 (= res!547013 (validKeyInArray!0 k0!2044))))

(declare-fun b!802488 () Bool)

(declare-fun res!547007 () Bool)

(assert (=> b!802488 (=> (not res!547007) (not e!444736))))

(declare-datatypes ((List!14856 0))(
  ( (Nil!14853) (Cons!14852 (h!15981 (_ BitVec 64)) (t!21171 List!14856)) )
))
(declare-fun arrayNoDuplicates!0 (array!43626 (_ BitVec 32) List!14856) Bool)

(assert (=> b!802488 (= res!547007 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14853))))

(declare-fun b!802489 () Bool)

(declare-fun e!444733 () Bool)

(assert (=> b!802489 (= e!444736 e!444733)))

(declare-fun res!547010 () Bool)

(assert (=> b!802489 (=> (not res!547010) (not e!444733))))

(declare-fun lt!358880 () array!43626)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358881 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8484 0))(
  ( (MissingZero!8484 (index!36304 (_ BitVec 32))) (Found!8484 (index!36305 (_ BitVec 32))) (Intermediate!8484 (undefined!9296 Bool) (index!36306 (_ BitVec 32)) (x!67154 (_ BitVec 32))) (Undefined!8484) (MissingVacant!8484 (index!36307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43626 (_ BitVec 32)) SeekEntryResult!8484)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43626 (_ BitVec 32)) SeekEntryResult!8484)

(assert (=> b!802489 (= res!547010 (= (seekEntryOrOpen!0 lt!358881 lt!358880 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358881 lt!358880 mask!3266)))))

(assert (=> b!802489 (= lt!358881 (select (store (arr!20893 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802489 (= lt!358880 (array!43627 (store (arr!20893 a!3170) i!1163 k0!2044) (size!21314 a!3170)))))

(declare-fun b!802490 () Bool)

(assert (=> b!802490 (= e!444737 e!444736)))

(declare-fun res!547008 () Bool)

(assert (=> b!802490 (=> (not res!547008) (not e!444736))))

(declare-fun lt!358878 () SeekEntryResult!8484)

(assert (=> b!802490 (= res!547008 (or (= lt!358878 (MissingZero!8484 i!1163)) (= lt!358878 (MissingVacant!8484 i!1163))))))

(assert (=> b!802490 (= lt!358878 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802491 () Bool)

(declare-fun e!444734 () Bool)

(assert (=> b!802491 (= e!444734 (not true))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!358877 () (_ BitVec 32))

(assert (=> b!802491 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358877 vacantAfter!23 lt!358881 lt!358880 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358877 vacantBefore!23 (select (arr!20893 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27508 0))(
  ( (Unit!27509) )
))
(declare-fun lt!358882 () Unit!27508)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43626 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27508)

(assert (=> b!802491 (= lt!358882 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358877 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802491 (= lt!358877 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802493 () Bool)

(assert (=> b!802493 (= e!444733 e!444734)))

(declare-fun res!547012 () Bool)

(assert (=> b!802493 (=> (not res!547012) (not e!444734))))

(declare-fun lt!358879 () SeekEntryResult!8484)

(declare-fun lt!358883 () SeekEntryResult!8484)

(assert (=> b!802493 (= res!547012 (and (= lt!358879 lt!358883) (= lt!358883 (Found!8484 j!153)) (not (= (select (arr!20893 a!3170) index!1236) (select (arr!20893 a!3170) j!153)))))))

(assert (=> b!802493 (= lt!358883 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20893 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802493 (= lt!358879 (seekEntryOrOpen!0 (select (arr!20893 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802494 () Bool)

(declare-fun res!547005 () Bool)

(assert (=> b!802494 (=> (not res!547005) (not e!444737))))

(declare-fun arrayContainsKey!0 (array!43626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802494 (= res!547005 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802492 () Bool)

(declare-fun res!547009 () Bool)

(assert (=> b!802492 (=> (not res!547009) (not e!444736))))

(assert (=> b!802492 (= res!547009 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21314 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20893 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21314 a!3170)) (= (select (arr!20893 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!547006 () Bool)

(assert (=> start!68836 (=> (not res!547006) (not e!444737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68836 (= res!547006 (validMask!0 mask!3266))))

(assert (=> start!68836 e!444737))

(assert (=> start!68836 true))

(declare-fun array_inv!16689 (array!43626) Bool)

(assert (=> start!68836 (array_inv!16689 a!3170)))

(assert (= (and start!68836 res!547006) b!802485))

(assert (= (and b!802485 res!547011) b!802486))

(assert (= (and b!802486 res!547003) b!802487))

(assert (= (and b!802487 res!547013) b!802494))

(assert (= (and b!802494 res!547005) b!802490))

(assert (= (and b!802490 res!547008) b!802484))

(assert (= (and b!802484 res!547004) b!802488))

(assert (= (and b!802488 res!547007) b!802492))

(assert (= (and b!802492 res!547009) b!802489))

(assert (= (and b!802489 res!547010) b!802493))

(assert (= (and b!802493 res!547012) b!802491))

(declare-fun m!743953 () Bool)

(assert (=> b!802484 m!743953))

(declare-fun m!743955 () Bool)

(assert (=> b!802488 m!743955))

(declare-fun m!743957 () Bool)

(assert (=> b!802489 m!743957))

(declare-fun m!743959 () Bool)

(assert (=> b!802489 m!743959))

(declare-fun m!743961 () Bool)

(assert (=> b!802489 m!743961))

(declare-fun m!743963 () Bool)

(assert (=> b!802489 m!743963))

(declare-fun m!743965 () Bool)

(assert (=> b!802494 m!743965))

(declare-fun m!743967 () Bool)

(assert (=> b!802487 m!743967))

(declare-fun m!743969 () Bool)

(assert (=> b!802490 m!743969))

(declare-fun m!743971 () Bool)

(assert (=> b!802486 m!743971))

(assert (=> b!802486 m!743971))

(declare-fun m!743973 () Bool)

(assert (=> b!802486 m!743973))

(assert (=> b!802491 m!743971))

(declare-fun m!743975 () Bool)

(assert (=> b!802491 m!743975))

(declare-fun m!743977 () Bool)

(assert (=> b!802491 m!743977))

(assert (=> b!802491 m!743971))

(declare-fun m!743979 () Bool)

(assert (=> b!802491 m!743979))

(declare-fun m!743981 () Bool)

(assert (=> b!802491 m!743981))

(declare-fun m!743983 () Bool)

(assert (=> b!802492 m!743983))

(declare-fun m!743985 () Bool)

(assert (=> b!802492 m!743985))

(declare-fun m!743987 () Bool)

(assert (=> start!68836 m!743987))

(declare-fun m!743989 () Bool)

(assert (=> start!68836 m!743989))

(declare-fun m!743991 () Bool)

(assert (=> b!802493 m!743991))

(assert (=> b!802493 m!743971))

(assert (=> b!802493 m!743971))

(declare-fun m!743993 () Bool)

(assert (=> b!802493 m!743993))

(assert (=> b!802493 m!743971))

(declare-fun m!743995 () Bool)

(assert (=> b!802493 m!743995))

(check-sat (not start!68836) (not b!802493) (not b!802487) (not b!802490) (not b!802488) (not b!802484) (not b!802491) (not b!802489) (not b!802494) (not b!802486))
(check-sat)
