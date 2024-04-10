; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68920 () Bool)

(assert start!68920)

(declare-fun b!803951 () Bool)

(declare-fun res!548478 () Bool)

(declare-fun e!445448 () Bool)

(assert (=> b!803951 (=> (not res!548478) (not e!445448))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803951 (= res!548478 (validKeyInArray!0 k0!2044))))

(declare-fun b!803952 () Bool)

(declare-fun e!445445 () Bool)

(declare-fun e!445444 () Bool)

(assert (=> b!803952 (= e!445445 e!445444)))

(declare-fun res!548474 () Bool)

(assert (=> b!803952 (=> (not res!548474) (not e!445444))))

(declare-datatypes ((SeekEntryResult!8526 0))(
  ( (MissingZero!8526 (index!36472 (_ BitVec 32))) (Found!8526 (index!36473 (_ BitVec 32))) (Intermediate!8526 (undefined!9338 Bool) (index!36474 (_ BitVec 32)) (x!67308 (_ BitVec 32))) (Undefined!8526) (MissingVacant!8526 (index!36475 (_ BitVec 32))) )
))
(declare-fun lt!359978 () SeekEntryResult!8526)

(declare-fun lt!359977 () SeekEntryResult!8526)

(declare-datatypes ((array!43710 0))(
  ( (array!43711 (arr!20935 (Array (_ BitVec 32) (_ BitVec 64))) (size!21356 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43710)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803952 (= res!548474 (and (= lt!359977 lt!359978) (= lt!359978 (Found!8526 j!153)) (not (= (select (arr!20935 a!3170) index!1236) (select (arr!20935 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43710 (_ BitVec 32)) SeekEntryResult!8526)

(assert (=> b!803952 (= lt!359978 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20935 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43710 (_ BitVec 32)) SeekEntryResult!8526)

(assert (=> b!803952 (= lt!359977 (seekEntryOrOpen!0 (select (arr!20935 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803953 () Bool)

(assert (=> b!803953 (= e!445444 (not true))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359979 () (_ BitVec 64))

(declare-fun lt!359981 () (_ BitVec 32))

(declare-fun lt!359980 () array!43710)

(assert (=> b!803953 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359981 vacantAfter!23 lt!359979 lt!359980 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359981 vacantBefore!23 (select (arr!20935 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27592 0))(
  ( (Unit!27593) )
))
(declare-fun lt!359976 () Unit!27592)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43710 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27592)

(assert (=> b!803953 (= lt!359976 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359981 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803953 (= lt!359981 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803954 () Bool)

(declare-fun res!548471 () Bool)

(declare-fun e!445446 () Bool)

(assert (=> b!803954 (=> (not res!548471) (not e!445446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43710 (_ BitVec 32)) Bool)

(assert (=> b!803954 (= res!548471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803955 () Bool)

(assert (=> b!803955 (= e!445446 e!445445)))

(declare-fun res!548472 () Bool)

(assert (=> b!803955 (=> (not res!548472) (not e!445445))))

(assert (=> b!803955 (= res!548472 (= (seekEntryOrOpen!0 lt!359979 lt!359980 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359979 lt!359980 mask!3266)))))

(assert (=> b!803955 (= lt!359979 (select (store (arr!20935 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803955 (= lt!359980 (array!43711 (store (arr!20935 a!3170) i!1163 k0!2044) (size!21356 a!3170)))))

(declare-fun b!803956 () Bool)

(declare-fun res!548475 () Bool)

(assert (=> b!803956 (=> (not res!548475) (not e!445446))))

(assert (=> b!803956 (= res!548475 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21356 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20935 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21356 a!3170)) (= (select (arr!20935 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803957 () Bool)

(declare-fun res!548480 () Bool)

(assert (=> b!803957 (=> (not res!548480) (not e!445448))))

(declare-fun arrayContainsKey!0 (array!43710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803957 (= res!548480 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!548476 () Bool)

(assert (=> start!68920 (=> (not res!548476) (not e!445448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68920 (= res!548476 (validMask!0 mask!3266))))

(assert (=> start!68920 e!445448))

(assert (=> start!68920 true))

(declare-fun array_inv!16731 (array!43710) Bool)

(assert (=> start!68920 (array_inv!16731 a!3170)))

(declare-fun b!803958 () Bool)

(declare-fun res!548477 () Bool)

(assert (=> b!803958 (=> (not res!548477) (not e!445448))))

(assert (=> b!803958 (= res!548477 (and (= (size!21356 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21356 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21356 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803959 () Bool)

(declare-fun res!548470 () Bool)

(assert (=> b!803959 (=> (not res!548470) (not e!445446))))

(declare-datatypes ((List!14898 0))(
  ( (Nil!14895) (Cons!14894 (h!16023 (_ BitVec 64)) (t!21213 List!14898)) )
))
(declare-fun arrayNoDuplicates!0 (array!43710 (_ BitVec 32) List!14898) Bool)

(assert (=> b!803959 (= res!548470 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14895))))

(declare-fun b!803960 () Bool)

(declare-fun res!548473 () Bool)

(assert (=> b!803960 (=> (not res!548473) (not e!445448))))

(assert (=> b!803960 (= res!548473 (validKeyInArray!0 (select (arr!20935 a!3170) j!153)))))

(declare-fun b!803961 () Bool)

(assert (=> b!803961 (= e!445448 e!445446)))

(declare-fun res!548479 () Bool)

(assert (=> b!803961 (=> (not res!548479) (not e!445446))))

(declare-fun lt!359975 () SeekEntryResult!8526)

(assert (=> b!803961 (= res!548479 (or (= lt!359975 (MissingZero!8526 i!1163)) (= lt!359975 (MissingVacant!8526 i!1163))))))

(assert (=> b!803961 (= lt!359975 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68920 res!548476) b!803958))

(assert (= (and b!803958 res!548477) b!803960))

(assert (= (and b!803960 res!548473) b!803951))

(assert (= (and b!803951 res!548478) b!803957))

(assert (= (and b!803957 res!548480) b!803961))

(assert (= (and b!803961 res!548479) b!803954))

(assert (= (and b!803954 res!548471) b!803959))

(assert (= (and b!803959 res!548470) b!803956))

(assert (= (and b!803956 res!548475) b!803955))

(assert (= (and b!803955 res!548472) b!803952))

(assert (= (and b!803952 res!548474) b!803953))

(declare-fun m!745819 () Bool)

(assert (=> b!803961 m!745819))

(declare-fun m!745821 () Bool)

(assert (=> start!68920 m!745821))

(declare-fun m!745823 () Bool)

(assert (=> start!68920 m!745823))

(declare-fun m!745825 () Bool)

(assert (=> b!803956 m!745825))

(declare-fun m!745827 () Bool)

(assert (=> b!803956 m!745827))

(declare-fun m!745829 () Bool)

(assert (=> b!803959 m!745829))

(declare-fun m!745831 () Bool)

(assert (=> b!803951 m!745831))

(declare-fun m!745833 () Bool)

(assert (=> b!803957 m!745833))

(declare-fun m!745835 () Bool)

(assert (=> b!803952 m!745835))

(declare-fun m!745837 () Bool)

(assert (=> b!803952 m!745837))

(assert (=> b!803952 m!745837))

(declare-fun m!745839 () Bool)

(assert (=> b!803952 m!745839))

(assert (=> b!803952 m!745837))

(declare-fun m!745841 () Bool)

(assert (=> b!803952 m!745841))

(declare-fun m!745843 () Bool)

(assert (=> b!803954 m!745843))

(assert (=> b!803960 m!745837))

(assert (=> b!803960 m!745837))

(declare-fun m!745845 () Bool)

(assert (=> b!803960 m!745845))

(declare-fun m!745847 () Bool)

(assert (=> b!803955 m!745847))

(declare-fun m!745849 () Bool)

(assert (=> b!803955 m!745849))

(declare-fun m!745851 () Bool)

(assert (=> b!803955 m!745851))

(declare-fun m!745853 () Bool)

(assert (=> b!803955 m!745853))

(assert (=> b!803953 m!745837))

(declare-fun m!745855 () Bool)

(assert (=> b!803953 m!745855))

(declare-fun m!745857 () Bool)

(assert (=> b!803953 m!745857))

(declare-fun m!745859 () Bool)

(assert (=> b!803953 m!745859))

(assert (=> b!803953 m!745837))

(declare-fun m!745861 () Bool)

(assert (=> b!803953 m!745861))

(check-sat (not b!803955) (not b!803961) (not b!803952) (not b!803951) (not b!803953) (not b!803954) (not b!803957) (not b!803960) (not b!803959) (not start!68920))
(check-sat)
