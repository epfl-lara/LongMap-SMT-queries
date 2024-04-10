; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68746 () Bool)

(assert start!68746)

(declare-fun b!800874 () Bool)

(declare-fun e!443991 () Bool)

(declare-fun e!443994 () Bool)

(assert (=> b!800874 (= e!443991 e!443994)))

(declare-fun res!545399 () Bool)

(assert (=> b!800874 (=> (not res!545399) (not e!443994))))

(declare-fun lt!357876 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43536 0))(
  ( (array!43537 (arr!20848 (Array (_ BitVec 32) (_ BitVec 64))) (size!21269 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43536)

(assert (=> b!800874 (= res!545399 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357876 #b00000000000000000000000000000000) (bvslt lt!357876 (size!21269 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800874 (= lt!357876 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800875 () Bool)

(declare-fun res!545402 () Bool)

(assert (=> b!800875 (=> (not res!545402) (not e!443994))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357880 () (_ BitVec 64))

(declare-fun lt!357879 () array!43536)

(declare-datatypes ((SeekEntryResult!8439 0))(
  ( (MissingZero!8439 (index!36124 (_ BitVec 32))) (Found!8439 (index!36125 (_ BitVec 32))) (Intermediate!8439 (undefined!9251 Bool) (index!36126 (_ BitVec 32)) (x!66989 (_ BitVec 32))) (Undefined!8439) (MissingVacant!8439 (index!36127 (_ BitVec 32))) )
))
(declare-fun lt!357875 () SeekEntryResult!8439)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43536 (_ BitVec 32)) SeekEntryResult!8439)

(assert (=> b!800875 (= res!545402 (= lt!357875 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357876 vacantAfter!23 lt!357880 lt!357879 mask!3266)))))

(declare-fun b!800876 () Bool)

(declare-fun e!443995 () Bool)

(declare-fun e!443996 () Bool)

(assert (=> b!800876 (= e!443995 e!443996)))

(declare-fun res!545393 () Bool)

(assert (=> b!800876 (=> (not res!545393) (not e!443996))))

(assert (=> b!800876 (= res!545393 (= lt!357875 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357880 lt!357879 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43536 (_ BitVec 32)) SeekEntryResult!8439)

(assert (=> b!800876 (= lt!357875 (seekEntryOrOpen!0 lt!357880 lt!357879 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800876 (= lt!357880 (select (store (arr!20848 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800876 (= lt!357879 (array!43537 (store (arr!20848 a!3170) i!1163 k0!2044) (size!21269 a!3170)))))

(declare-fun b!800877 () Bool)

(declare-fun e!443992 () Bool)

(assert (=> b!800877 (= e!443992 e!443995)))

(declare-fun res!545394 () Bool)

(assert (=> b!800877 (=> (not res!545394) (not e!443995))))

(declare-fun lt!357877 () SeekEntryResult!8439)

(assert (=> b!800877 (= res!545394 (or (= lt!357877 (MissingZero!8439 i!1163)) (= lt!357877 (MissingVacant!8439 i!1163))))))

(assert (=> b!800877 (= lt!357877 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800878 () Bool)

(declare-fun res!545404 () Bool)

(assert (=> b!800878 (=> (not res!545404) (not e!443995))))

(declare-datatypes ((List!14811 0))(
  ( (Nil!14808) (Cons!14807 (h!15936 (_ BitVec 64)) (t!21126 List!14811)) )
))
(declare-fun arrayNoDuplicates!0 (array!43536 (_ BitVec 32) List!14811) Bool)

(assert (=> b!800878 (= res!545404 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14808))))

(declare-fun b!800879 () Bool)

(assert (=> b!800879 (= e!443996 e!443991)))

(declare-fun res!545401 () Bool)

(assert (=> b!800879 (=> (not res!545401) (not e!443991))))

(declare-fun lt!357874 () SeekEntryResult!8439)

(declare-fun lt!357878 () SeekEntryResult!8439)

(assert (=> b!800879 (= res!545401 (and (= lt!357874 lt!357878) (= lt!357878 (Found!8439 j!153)) (not (= (select (arr!20848 a!3170) index!1236) (select (arr!20848 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800879 (= lt!357878 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20848 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800879 (= lt!357874 (seekEntryOrOpen!0 (select (arr!20848 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!545396 () Bool)

(assert (=> start!68746 (=> (not res!545396) (not e!443992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68746 (= res!545396 (validMask!0 mask!3266))))

(assert (=> start!68746 e!443992))

(assert (=> start!68746 true))

(declare-fun array_inv!16644 (array!43536) Bool)

(assert (=> start!68746 (array_inv!16644 a!3170)))

(declare-fun b!800880 () Bool)

(declare-fun res!545397 () Bool)

(assert (=> b!800880 (=> (not res!545397) (not e!443992))))

(declare-fun arrayContainsKey!0 (array!43536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800880 (= res!545397 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800881 () Bool)

(declare-fun res!545395 () Bool)

(assert (=> b!800881 (=> (not res!545395) (not e!443995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43536 (_ BitVec 32)) Bool)

(assert (=> b!800881 (= res!545395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800882 () Bool)

(declare-fun res!545403 () Bool)

(assert (=> b!800882 (=> (not res!545403) (not e!443992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800882 (= res!545403 (validKeyInArray!0 k0!2044))))

(declare-fun b!800883 () Bool)

(declare-fun res!545405 () Bool)

(assert (=> b!800883 (=> (not res!545405) (not e!443992))))

(assert (=> b!800883 (= res!545405 (and (= (size!21269 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21269 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21269 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800884 () Bool)

(declare-fun res!545398 () Bool)

(assert (=> b!800884 (=> (not res!545398) (not e!443992))))

(assert (=> b!800884 (= res!545398 (validKeyInArray!0 (select (arr!20848 a!3170) j!153)))))

(declare-fun b!800885 () Bool)

(assert (=> b!800885 (= e!443994 false)))

(declare-fun lt!357881 () SeekEntryResult!8439)

(assert (=> b!800885 (= lt!357881 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357876 vacantBefore!23 (select (arr!20848 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800886 () Bool)

(declare-fun res!545400 () Bool)

(assert (=> b!800886 (=> (not res!545400) (not e!443995))))

(assert (=> b!800886 (= res!545400 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21269 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20848 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21269 a!3170)) (= (select (arr!20848 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68746 res!545396) b!800883))

(assert (= (and b!800883 res!545405) b!800884))

(assert (= (and b!800884 res!545398) b!800882))

(assert (= (and b!800882 res!545403) b!800880))

(assert (= (and b!800880 res!545397) b!800877))

(assert (= (and b!800877 res!545394) b!800881))

(assert (= (and b!800881 res!545395) b!800878))

(assert (= (and b!800878 res!545404) b!800886))

(assert (= (and b!800886 res!545400) b!800876))

(assert (= (and b!800876 res!545393) b!800879))

(assert (= (and b!800879 res!545401) b!800874))

(assert (= (and b!800874 res!545399) b!800875))

(assert (= (and b!800875 res!545402) b!800885))

(declare-fun m!741995 () Bool)

(assert (=> b!800885 m!741995))

(assert (=> b!800885 m!741995))

(declare-fun m!741997 () Bool)

(assert (=> b!800885 m!741997))

(declare-fun m!741999 () Bool)

(assert (=> b!800881 m!741999))

(assert (=> b!800884 m!741995))

(assert (=> b!800884 m!741995))

(declare-fun m!742001 () Bool)

(assert (=> b!800884 m!742001))

(declare-fun m!742003 () Bool)

(assert (=> b!800879 m!742003))

(assert (=> b!800879 m!741995))

(assert (=> b!800879 m!741995))

(declare-fun m!742005 () Bool)

(assert (=> b!800879 m!742005))

(assert (=> b!800879 m!741995))

(declare-fun m!742007 () Bool)

(assert (=> b!800879 m!742007))

(declare-fun m!742009 () Bool)

(assert (=> b!800886 m!742009))

(declare-fun m!742011 () Bool)

(assert (=> b!800886 m!742011))

(declare-fun m!742013 () Bool)

(assert (=> b!800877 m!742013))

(declare-fun m!742015 () Bool)

(assert (=> start!68746 m!742015))

(declare-fun m!742017 () Bool)

(assert (=> start!68746 m!742017))

(declare-fun m!742019 () Bool)

(assert (=> b!800876 m!742019))

(declare-fun m!742021 () Bool)

(assert (=> b!800876 m!742021))

(declare-fun m!742023 () Bool)

(assert (=> b!800876 m!742023))

(declare-fun m!742025 () Bool)

(assert (=> b!800876 m!742025))

(declare-fun m!742027 () Bool)

(assert (=> b!800874 m!742027))

(declare-fun m!742029 () Bool)

(assert (=> b!800882 m!742029))

(declare-fun m!742031 () Bool)

(assert (=> b!800878 m!742031))

(declare-fun m!742033 () Bool)

(assert (=> b!800875 m!742033))

(declare-fun m!742035 () Bool)

(assert (=> b!800880 m!742035))

(check-sat (not b!800885) (not b!800874) (not b!800878) (not b!800877) (not b!800879) (not b!800881) (not start!68746) (not b!800875) (not b!800880) (not b!800884) (not b!800882) (not b!800876))
(check-sat)
