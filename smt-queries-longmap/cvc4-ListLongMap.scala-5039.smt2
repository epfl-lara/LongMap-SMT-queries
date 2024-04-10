; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68748 () Bool)

(assert start!68748)

(declare-fun b!800913 () Bool)

(declare-fun res!545440 () Bool)

(declare-fun e!444012 () Bool)

(assert (=> b!800913 (=> (not res!545440) (not e!444012))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43538 0))(
  ( (array!43539 (arr!20849 (Array (_ BitVec 32) (_ BitVec 64))) (size!21270 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43538)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!800913 (= res!545440 (and (= (size!21270 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21270 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21270 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800914 () Bool)

(declare-fun res!545435 () Bool)

(declare-fun e!444013 () Bool)

(assert (=> b!800914 (=> (not res!545435) (not e!444013))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800914 (= res!545435 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21270 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20849 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21270 a!3170)) (= (select (arr!20849 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800915 () Bool)

(declare-fun res!545438 () Bool)

(assert (=> b!800915 (=> (not res!545438) (not e!444013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43538 (_ BitVec 32)) Bool)

(assert (=> b!800915 (= res!545438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800916 () Bool)

(declare-fun e!444010 () Bool)

(assert (=> b!800916 (= e!444013 e!444010)))

(declare-fun res!545437 () Bool)

(assert (=> b!800916 (=> (not res!545437) (not e!444010))))

(declare-fun lt!357902 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8440 0))(
  ( (MissingZero!8440 (index!36128 (_ BitVec 32))) (Found!8440 (index!36129 (_ BitVec 32))) (Intermediate!8440 (undefined!9252 Bool) (index!36130 (_ BitVec 32)) (x!66990 (_ BitVec 32))) (Undefined!8440) (MissingVacant!8440 (index!36131 (_ BitVec 32))) )
))
(declare-fun lt!357899 () SeekEntryResult!8440)

(declare-fun lt!357905 () array!43538)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43538 (_ BitVec 32)) SeekEntryResult!8440)

(assert (=> b!800916 (= res!545437 (= lt!357899 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357902 lt!357905 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43538 (_ BitVec 32)) SeekEntryResult!8440)

(assert (=> b!800916 (= lt!357899 (seekEntryOrOpen!0 lt!357902 lt!357905 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!800916 (= lt!357902 (select (store (arr!20849 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800916 (= lt!357905 (array!43539 (store (arr!20849 a!3170) i!1163 k!2044) (size!21270 a!3170)))))

(declare-fun b!800917 () Bool)

(declare-fun res!545432 () Bool)

(assert (=> b!800917 (=> (not res!545432) (not e!444012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800917 (= res!545432 (validKeyInArray!0 (select (arr!20849 a!3170) j!153)))))

(declare-fun b!800918 () Bool)

(assert (=> b!800918 (= e!444012 e!444013)))

(declare-fun res!545443 () Bool)

(assert (=> b!800918 (=> (not res!545443) (not e!444013))))

(declare-fun lt!357901 () SeekEntryResult!8440)

(assert (=> b!800918 (= res!545443 (or (= lt!357901 (MissingZero!8440 i!1163)) (= lt!357901 (MissingVacant!8440 i!1163))))))

(assert (=> b!800918 (= lt!357901 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800920 () Bool)

(declare-fun e!444009 () Bool)

(assert (=> b!800920 (= e!444009 false)))

(declare-fun lt!357898 () SeekEntryResult!8440)

(declare-fun lt!357903 () (_ BitVec 32))

(assert (=> b!800920 (= lt!357898 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357903 vacantBefore!23 (select (arr!20849 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800921 () Bool)

(declare-fun res!545439 () Bool)

(assert (=> b!800921 (=> (not res!545439) (not e!444013))))

(declare-datatypes ((List!14812 0))(
  ( (Nil!14809) (Cons!14808 (h!15937 (_ BitVec 64)) (t!21127 List!14812)) )
))
(declare-fun arrayNoDuplicates!0 (array!43538 (_ BitVec 32) List!14812) Bool)

(assert (=> b!800921 (= res!545439 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14809))))

(declare-fun b!800922 () Bool)

(declare-fun res!545441 () Bool)

(assert (=> b!800922 (=> (not res!545441) (not e!444012))))

(declare-fun arrayContainsKey!0 (array!43538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800922 (= res!545441 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800923 () Bool)

(declare-fun e!444014 () Bool)

(assert (=> b!800923 (= e!444014 e!444009)))

(declare-fun res!545444 () Bool)

(assert (=> b!800923 (=> (not res!545444) (not e!444009))))

(assert (=> b!800923 (= res!545444 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357903 #b00000000000000000000000000000000) (bvslt lt!357903 (size!21270 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800923 (= lt!357903 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800924 () Bool)

(declare-fun res!545433 () Bool)

(assert (=> b!800924 (=> (not res!545433) (not e!444009))))

(assert (=> b!800924 (= res!545433 (= lt!357899 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357903 vacantAfter!23 lt!357902 lt!357905 mask!3266)))))

(declare-fun b!800925 () Bool)

(declare-fun res!545436 () Bool)

(assert (=> b!800925 (=> (not res!545436) (not e!444012))))

(assert (=> b!800925 (= res!545436 (validKeyInArray!0 k!2044))))

(declare-fun b!800919 () Bool)

(assert (=> b!800919 (= e!444010 e!444014)))

(declare-fun res!545434 () Bool)

(assert (=> b!800919 (=> (not res!545434) (not e!444014))))

(declare-fun lt!357900 () SeekEntryResult!8440)

(declare-fun lt!357904 () SeekEntryResult!8440)

(assert (=> b!800919 (= res!545434 (and (= lt!357904 lt!357900) (= lt!357900 (Found!8440 j!153)) (not (= (select (arr!20849 a!3170) index!1236) (select (arr!20849 a!3170) j!153)))))))

(assert (=> b!800919 (= lt!357900 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20849 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800919 (= lt!357904 (seekEntryOrOpen!0 (select (arr!20849 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!545442 () Bool)

(assert (=> start!68748 (=> (not res!545442) (not e!444012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68748 (= res!545442 (validMask!0 mask!3266))))

(assert (=> start!68748 e!444012))

(assert (=> start!68748 true))

(declare-fun array_inv!16645 (array!43538) Bool)

(assert (=> start!68748 (array_inv!16645 a!3170)))

(assert (= (and start!68748 res!545442) b!800913))

(assert (= (and b!800913 res!545440) b!800917))

(assert (= (and b!800917 res!545432) b!800925))

(assert (= (and b!800925 res!545436) b!800922))

(assert (= (and b!800922 res!545441) b!800918))

(assert (= (and b!800918 res!545443) b!800915))

(assert (= (and b!800915 res!545438) b!800921))

(assert (= (and b!800921 res!545439) b!800914))

(assert (= (and b!800914 res!545435) b!800916))

(assert (= (and b!800916 res!545437) b!800919))

(assert (= (and b!800919 res!545434) b!800923))

(assert (= (and b!800923 res!545444) b!800924))

(assert (= (and b!800924 res!545433) b!800920))

(declare-fun m!742037 () Bool)

(assert (=> b!800914 m!742037))

(declare-fun m!742039 () Bool)

(assert (=> b!800914 m!742039))

(declare-fun m!742041 () Bool)

(assert (=> b!800917 m!742041))

(assert (=> b!800917 m!742041))

(declare-fun m!742043 () Bool)

(assert (=> b!800917 m!742043))

(declare-fun m!742045 () Bool)

(assert (=> start!68748 m!742045))

(declare-fun m!742047 () Bool)

(assert (=> start!68748 m!742047))

(declare-fun m!742049 () Bool)

(assert (=> b!800921 m!742049))

(assert (=> b!800920 m!742041))

(assert (=> b!800920 m!742041))

(declare-fun m!742051 () Bool)

(assert (=> b!800920 m!742051))

(declare-fun m!742053 () Bool)

(assert (=> b!800923 m!742053))

(declare-fun m!742055 () Bool)

(assert (=> b!800925 m!742055))

(declare-fun m!742057 () Bool)

(assert (=> b!800922 m!742057))

(declare-fun m!742059 () Bool)

(assert (=> b!800924 m!742059))

(declare-fun m!742061 () Bool)

(assert (=> b!800916 m!742061))

(declare-fun m!742063 () Bool)

(assert (=> b!800916 m!742063))

(declare-fun m!742065 () Bool)

(assert (=> b!800916 m!742065))

(declare-fun m!742067 () Bool)

(assert (=> b!800916 m!742067))

(declare-fun m!742069 () Bool)

(assert (=> b!800915 m!742069))

(declare-fun m!742071 () Bool)

(assert (=> b!800919 m!742071))

(assert (=> b!800919 m!742041))

(assert (=> b!800919 m!742041))

(declare-fun m!742073 () Bool)

(assert (=> b!800919 m!742073))

(assert (=> b!800919 m!742041))

(declare-fun m!742075 () Bool)

(assert (=> b!800919 m!742075))

(declare-fun m!742077 () Bool)

(assert (=> b!800918 m!742077))

(push 1)

