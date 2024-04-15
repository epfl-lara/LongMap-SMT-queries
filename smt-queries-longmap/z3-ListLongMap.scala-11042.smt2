; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129032 () Bool)

(assert start!129032)

(declare-fun b!1514073 () Bool)

(declare-fun e!844945 () Bool)

(assert (=> b!1514073 (= e!844945 (not true))))

(declare-fun e!844943 () Bool)

(assert (=> b!1514073 e!844943))

(declare-fun res!1034194 () Bool)

(assert (=> b!1514073 (=> (not res!1034194) (not e!844943))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100888 0))(
  ( (array!100889 (arr!48682 (Array (_ BitVec 32) (_ BitVec 64))) (size!49234 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100888)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100888 (_ BitVec 32)) Bool)

(assert (=> b!1514073 (= res!1034194 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50459 0))(
  ( (Unit!50460) )
))
(declare-fun lt!656032 () Unit!50459)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50459)

(assert (=> b!1514073 (= lt!656032 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514074 () Bool)

(declare-fun res!1034188 () Bool)

(declare-fun e!844947 () Bool)

(assert (=> b!1514074 (=> (not res!1034188) (not e!844947))))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12876 0))(
  ( (MissingZero!12876 (index!53899 (_ BitVec 32))) (Found!12876 (index!53900 (_ BitVec 32))) (Intermediate!12876 (undefined!13688 Bool) (index!53901 (_ BitVec 32)) (x!135612 (_ BitVec 32))) (Undefined!12876) (MissingVacant!12876 (index!53902 (_ BitVec 32))) )
))
(declare-fun lt!656033 () SeekEntryResult!12876)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100888 (_ BitVec 32)) SeekEntryResult!12876)

(assert (=> b!1514074 (= res!1034188 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48682 a!2804) j!70) a!2804 mask!2512) lt!656033))))

(declare-fun b!1514075 () Bool)

(declare-fun res!1034190 () Bool)

(declare-fun e!844944 () Bool)

(assert (=> b!1514075 (=> (not res!1034190) (not e!844944))))

(declare-datatypes ((List!35243 0))(
  ( (Nil!35240) (Cons!35239 (h!36652 (_ BitVec 64)) (t!49929 List!35243)) )
))
(declare-fun arrayNoDuplicates!0 (array!100888 (_ BitVec 32) List!35243) Bool)

(assert (=> b!1514075 (= res!1034190 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35240))))

(declare-fun res!1034183 () Bool)

(assert (=> start!129032 (=> (not res!1034183) (not e!844944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129032 (= res!1034183 (validMask!0 mask!2512))))

(assert (=> start!129032 e!844944))

(assert (=> start!129032 true))

(declare-fun array_inv!37915 (array!100888) Bool)

(assert (=> start!129032 (array_inv!37915 a!2804)))

(declare-fun b!1514076 () Bool)

(assert (=> b!1514076 (= e!844944 e!844947)))

(declare-fun res!1034191 () Bool)

(assert (=> b!1514076 (=> (not res!1034191) (not e!844947))))

(declare-fun lt!656031 () SeekEntryResult!12876)

(assert (=> b!1514076 (= res!1034191 (= lt!656031 lt!656033))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514076 (= lt!656033 (Intermediate!12876 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514076 (= lt!656031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48682 a!2804) j!70) mask!2512) (select (arr!48682 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514077 () Bool)

(declare-fun res!1034195 () Bool)

(assert (=> b!1514077 (=> (not res!1034195) (not e!844944))))

(assert (=> b!1514077 (= res!1034195 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49234 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49234 a!2804))))))

(declare-fun b!1514078 () Bool)

(assert (=> b!1514078 (= e!844947 e!844945)))

(declare-fun res!1034192 () Bool)

(assert (=> b!1514078 (=> (not res!1034192) (not e!844945))))

(declare-fun lt!656030 () (_ BitVec 64))

(declare-fun lt!656034 () array!100888)

(assert (=> b!1514078 (= res!1034192 (= lt!656031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656030 mask!2512) lt!656030 lt!656034 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514078 (= lt!656030 (select (store (arr!48682 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514078 (= lt!656034 (array!100889 (store (arr!48682 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49234 a!2804)))))

(declare-fun b!1514079 () Bool)

(declare-fun e!844941 () Bool)

(assert (=> b!1514079 (= e!844943 e!844941)))

(declare-fun res!1034189 () Bool)

(assert (=> b!1514079 (=> res!1034189 e!844941)))

(assert (=> b!1514079 (= res!1034189 (or (not (= (select (arr!48682 a!2804) j!70) lt!656030)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48682 a!2804) index!487) (select (arr!48682 a!2804) j!70)) (not (= (select (arr!48682 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514080 () Bool)

(declare-fun e!844942 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100888 (_ BitVec 32)) SeekEntryResult!12876)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100888 (_ BitVec 32)) SeekEntryResult!12876)

(assert (=> b!1514080 (= e!844942 (= (seekEntryOrOpen!0 lt!656030 lt!656034 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656030 lt!656034 mask!2512)))))

(declare-fun b!1514081 () Bool)

(declare-fun res!1034185 () Bool)

(assert (=> b!1514081 (=> (not res!1034185) (not e!844944))))

(assert (=> b!1514081 (= res!1034185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514082 () Bool)

(declare-fun res!1034193 () Bool)

(assert (=> b!1514082 (=> (not res!1034193) (not e!844944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514082 (= res!1034193 (validKeyInArray!0 (select (arr!48682 a!2804) i!961)))))

(declare-fun b!1514083 () Bool)

(declare-fun res!1034187 () Bool)

(assert (=> b!1514083 (=> (not res!1034187) (not e!844944))))

(assert (=> b!1514083 (= res!1034187 (validKeyInArray!0 (select (arr!48682 a!2804) j!70)))))

(declare-fun b!1514084 () Bool)

(assert (=> b!1514084 (= e!844941 e!844942)))

(declare-fun res!1034186 () Bool)

(assert (=> b!1514084 (=> (not res!1034186) (not e!844942))))

(assert (=> b!1514084 (= res!1034186 (= (seekEntryOrOpen!0 (select (arr!48682 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48682 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514085 () Bool)

(declare-fun res!1034184 () Bool)

(assert (=> b!1514085 (=> (not res!1034184) (not e!844943))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100888 (_ BitVec 32)) SeekEntryResult!12876)

(assert (=> b!1514085 (= res!1034184 (= (seekEntry!0 (select (arr!48682 a!2804) j!70) a!2804 mask!2512) (Found!12876 j!70)))))

(declare-fun b!1514086 () Bool)

(declare-fun res!1034182 () Bool)

(assert (=> b!1514086 (=> (not res!1034182) (not e!844944))))

(assert (=> b!1514086 (= res!1034182 (and (= (size!49234 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49234 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49234 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129032 res!1034183) b!1514086))

(assert (= (and b!1514086 res!1034182) b!1514082))

(assert (= (and b!1514082 res!1034193) b!1514083))

(assert (= (and b!1514083 res!1034187) b!1514081))

(assert (= (and b!1514081 res!1034185) b!1514075))

(assert (= (and b!1514075 res!1034190) b!1514077))

(assert (= (and b!1514077 res!1034195) b!1514076))

(assert (= (and b!1514076 res!1034191) b!1514074))

(assert (= (and b!1514074 res!1034188) b!1514078))

(assert (= (and b!1514078 res!1034192) b!1514073))

(assert (= (and b!1514073 res!1034194) b!1514085))

(assert (= (and b!1514085 res!1034184) b!1514079))

(assert (= (and b!1514079 (not res!1034189)) b!1514084))

(assert (= (and b!1514084 res!1034186) b!1514080))

(declare-fun m!1396457 () Bool)

(assert (=> b!1514078 m!1396457))

(assert (=> b!1514078 m!1396457))

(declare-fun m!1396459 () Bool)

(assert (=> b!1514078 m!1396459))

(declare-fun m!1396461 () Bool)

(assert (=> b!1514078 m!1396461))

(declare-fun m!1396463 () Bool)

(assert (=> b!1514078 m!1396463))

(declare-fun m!1396465 () Bool)

(assert (=> b!1514076 m!1396465))

(assert (=> b!1514076 m!1396465))

(declare-fun m!1396467 () Bool)

(assert (=> b!1514076 m!1396467))

(assert (=> b!1514076 m!1396467))

(assert (=> b!1514076 m!1396465))

(declare-fun m!1396469 () Bool)

(assert (=> b!1514076 m!1396469))

(declare-fun m!1396471 () Bool)

(assert (=> b!1514075 m!1396471))

(declare-fun m!1396473 () Bool)

(assert (=> b!1514081 m!1396473))

(assert (=> b!1514074 m!1396465))

(assert (=> b!1514074 m!1396465))

(declare-fun m!1396475 () Bool)

(assert (=> b!1514074 m!1396475))

(assert (=> b!1514085 m!1396465))

(assert (=> b!1514085 m!1396465))

(declare-fun m!1396477 () Bool)

(assert (=> b!1514085 m!1396477))

(assert (=> b!1514079 m!1396465))

(declare-fun m!1396479 () Bool)

(assert (=> b!1514079 m!1396479))

(declare-fun m!1396481 () Bool)

(assert (=> b!1514073 m!1396481))

(declare-fun m!1396483 () Bool)

(assert (=> b!1514073 m!1396483))

(declare-fun m!1396485 () Bool)

(assert (=> b!1514082 m!1396485))

(assert (=> b!1514082 m!1396485))

(declare-fun m!1396487 () Bool)

(assert (=> b!1514082 m!1396487))

(declare-fun m!1396489 () Bool)

(assert (=> start!129032 m!1396489))

(declare-fun m!1396491 () Bool)

(assert (=> start!129032 m!1396491))

(declare-fun m!1396493 () Bool)

(assert (=> b!1514080 m!1396493))

(declare-fun m!1396495 () Bool)

(assert (=> b!1514080 m!1396495))

(assert (=> b!1514084 m!1396465))

(assert (=> b!1514084 m!1396465))

(declare-fun m!1396497 () Bool)

(assert (=> b!1514084 m!1396497))

(assert (=> b!1514084 m!1396465))

(declare-fun m!1396499 () Bool)

(assert (=> b!1514084 m!1396499))

(assert (=> b!1514083 m!1396465))

(assert (=> b!1514083 m!1396465))

(declare-fun m!1396501 () Bool)

(assert (=> b!1514083 m!1396501))

(check-sat (not b!1514083) (not b!1514085) (not b!1514073) (not start!129032) (not b!1514074) (not b!1514080) (not b!1514075) (not b!1514084) (not b!1514082) (not b!1514078) (not b!1514081) (not b!1514076))
(check-sat)
