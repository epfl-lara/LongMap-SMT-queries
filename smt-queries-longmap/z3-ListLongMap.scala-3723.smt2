; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51334 () Bool)

(assert start!51334)

(declare-fun b!560204 () Bool)

(declare-fun e!322761 () Bool)

(declare-fun e!322763 () Bool)

(assert (=> b!560204 (= e!322761 e!322763)))

(declare-fun res!351365 () Bool)

(assert (=> b!560204 (=> (not res!351365) (not e!322763))))

(declare-fun lt!254658 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!254661 () (_ BitVec 32))

(declare-datatypes ((array!35199 0))(
  ( (array!35200 (arr!16900 (Array (_ BitVec 32) (_ BitVec 64))) (size!17264 (_ BitVec 32))) )
))
(declare-fun lt!254659 () array!35199)

(declare-datatypes ((SeekEntryResult!5349 0))(
  ( (MissingZero!5349 (index!23623 (_ BitVec 32))) (Found!5349 (index!23624 (_ BitVec 32))) (Intermediate!5349 (undefined!6161 Bool) (index!23625 (_ BitVec 32)) (x!52540 (_ BitVec 32))) (Undefined!5349) (MissingVacant!5349 (index!23626 (_ BitVec 32))) )
))
(declare-fun lt!254657 () SeekEntryResult!5349)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35199 (_ BitVec 32)) SeekEntryResult!5349)

(assert (=> b!560204 (= res!351365 (= lt!254657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254661 lt!254658 lt!254659 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun a!3118 () array!35199)

(declare-fun lt!254655 () (_ BitVec 32))

(assert (=> b!560204 (= lt!254657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254655 (select (arr!16900 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560204 (= lt!254661 (toIndex!0 lt!254658 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560204 (= lt!254658 (select (store (arr!16900 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560204 (= lt!254655 (toIndex!0 (select (arr!16900 a!3118) j!142) mask!3119))))

(assert (=> b!560204 (= lt!254659 (array!35200 (store (arr!16900 a!3118) i!1132 k0!1914) (size!17264 a!3118)))))

(declare-fun b!560205 () Bool)

(declare-fun e!322764 () Bool)

(assert (=> b!560205 (= e!322764 e!322761)))

(declare-fun res!351361 () Bool)

(assert (=> b!560205 (=> (not res!351361) (not e!322761))))

(declare-fun lt!254656 () SeekEntryResult!5349)

(assert (=> b!560205 (= res!351361 (or (= lt!254656 (MissingZero!5349 i!1132)) (= lt!254656 (MissingVacant!5349 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35199 (_ BitVec 32)) SeekEntryResult!5349)

(assert (=> b!560205 (= lt!254656 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560206 () Bool)

(declare-fun res!351367 () Bool)

(assert (=> b!560206 (=> (not res!351367) (not e!322764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560206 (= res!351367 (validKeyInArray!0 (select (arr!16900 a!3118) j!142)))))

(declare-fun b!560208 () Bool)

(declare-fun res!351362 () Bool)

(assert (=> b!560208 (=> (not res!351362) (not e!322761))))

(declare-datatypes ((List!10980 0))(
  ( (Nil!10977) (Cons!10976 (h!11979 (_ BitVec 64)) (t!17208 List!10980)) )
))
(declare-fun arrayNoDuplicates!0 (array!35199 (_ BitVec 32) List!10980) Bool)

(assert (=> b!560208 (= res!351362 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10977))))

(declare-fun b!560209 () Bool)

(declare-fun e!322765 () Bool)

(declare-fun e!322766 () Bool)

(assert (=> b!560209 (= e!322765 e!322766)))

(declare-fun res!351364 () Bool)

(assert (=> b!560209 (=> res!351364 e!322766)))

(get-info :version)

(assert (=> b!560209 (= res!351364 (or (undefined!6161 lt!254657) (not ((_ is Intermediate!5349) lt!254657))))))

(declare-fun b!560210 () Bool)

(assert (=> b!560210 (= e!322763 (not true))))

(assert (=> b!560210 e!322765))

(declare-fun res!351363 () Bool)

(assert (=> b!560210 (=> (not res!351363) (not e!322765))))

(declare-fun lt!254654 () SeekEntryResult!5349)

(assert (=> b!560210 (= res!351363 (= lt!254654 (Found!5349 j!142)))))

(assert (=> b!560210 (= lt!254654 (seekEntryOrOpen!0 (select (arr!16900 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35199 (_ BitVec 32)) Bool)

(assert (=> b!560210 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17472 0))(
  ( (Unit!17473) )
))
(declare-fun lt!254660 () Unit!17472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17472)

(assert (=> b!560210 (= lt!254660 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560211 () Bool)

(declare-fun res!351359 () Bool)

(assert (=> b!560211 (=> (not res!351359) (not e!322764))))

(assert (=> b!560211 (= res!351359 (validKeyInArray!0 k0!1914))))

(declare-fun b!560212 () Bool)

(declare-fun e!322760 () Bool)

(declare-fun e!322767 () Bool)

(assert (=> b!560212 (= e!322760 e!322767)))

(declare-fun res!351358 () Bool)

(assert (=> b!560212 (=> (not res!351358) (not e!322767))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35199 (_ BitVec 32)) SeekEntryResult!5349)

(assert (=> b!560212 (= res!351358 (= lt!254654 (seekKeyOrZeroReturnVacant!0 (x!52540 lt!254657) (index!23625 lt!254657) (index!23625 lt!254657) (select (arr!16900 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560213 () Bool)

(assert (=> b!560213 (= e!322766 e!322760)))

(declare-fun res!351368 () Bool)

(assert (=> b!560213 (=> res!351368 e!322760)))

(declare-fun lt!254662 () (_ BitVec 64))

(assert (=> b!560213 (= res!351368 (or (= lt!254662 (select (arr!16900 a!3118) j!142)) (= lt!254662 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560213 (= lt!254662 (select (arr!16900 a!3118) (index!23625 lt!254657)))))

(declare-fun b!560214 () Bool)

(declare-fun res!351360 () Bool)

(assert (=> b!560214 (=> (not res!351360) (not e!322761))))

(assert (=> b!560214 (= res!351360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!351356 () Bool)

(assert (=> start!51334 (=> (not res!351356) (not e!322764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51334 (= res!351356 (validMask!0 mask!3119))))

(assert (=> start!51334 e!322764))

(assert (=> start!51334 true))

(declare-fun array_inv!12696 (array!35199) Bool)

(assert (=> start!51334 (array_inv!12696 a!3118)))

(declare-fun b!560207 () Bool)

(assert (=> b!560207 (= e!322767 (= (seekEntryOrOpen!0 lt!254658 lt!254659 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52540 lt!254657) (index!23625 lt!254657) (index!23625 lt!254657) lt!254658 lt!254659 mask!3119)))))

(declare-fun b!560215 () Bool)

(declare-fun res!351366 () Bool)

(assert (=> b!560215 (=> (not res!351366) (not e!322764))))

(declare-fun arrayContainsKey!0 (array!35199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560215 (= res!351366 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560216 () Bool)

(declare-fun res!351357 () Bool)

(assert (=> b!560216 (=> (not res!351357) (not e!322764))))

(assert (=> b!560216 (= res!351357 (and (= (size!17264 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17264 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17264 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51334 res!351356) b!560216))

(assert (= (and b!560216 res!351357) b!560206))

(assert (= (and b!560206 res!351367) b!560211))

(assert (= (and b!560211 res!351359) b!560215))

(assert (= (and b!560215 res!351366) b!560205))

(assert (= (and b!560205 res!351361) b!560214))

(assert (= (and b!560214 res!351360) b!560208))

(assert (= (and b!560208 res!351362) b!560204))

(assert (= (and b!560204 res!351365) b!560210))

(assert (= (and b!560210 res!351363) b!560209))

(assert (= (and b!560209 (not res!351364)) b!560213))

(assert (= (and b!560213 (not res!351368)) b!560212))

(assert (= (and b!560212 res!351358) b!560207))

(declare-fun m!537941 () Bool)

(assert (=> b!560204 m!537941))

(declare-fun m!537943 () Bool)

(assert (=> b!560204 m!537943))

(assert (=> b!560204 m!537941))

(declare-fun m!537945 () Bool)

(assert (=> b!560204 m!537945))

(assert (=> b!560204 m!537941))

(declare-fun m!537947 () Bool)

(assert (=> b!560204 m!537947))

(declare-fun m!537949 () Bool)

(assert (=> b!560204 m!537949))

(declare-fun m!537951 () Bool)

(assert (=> b!560204 m!537951))

(declare-fun m!537953 () Bool)

(assert (=> b!560204 m!537953))

(assert (=> b!560213 m!537941))

(declare-fun m!537955 () Bool)

(assert (=> b!560213 m!537955))

(declare-fun m!537957 () Bool)

(assert (=> b!560211 m!537957))

(assert (=> b!560206 m!537941))

(assert (=> b!560206 m!537941))

(declare-fun m!537959 () Bool)

(assert (=> b!560206 m!537959))

(declare-fun m!537961 () Bool)

(assert (=> b!560214 m!537961))

(declare-fun m!537963 () Bool)

(assert (=> b!560207 m!537963))

(declare-fun m!537965 () Bool)

(assert (=> b!560207 m!537965))

(declare-fun m!537967 () Bool)

(assert (=> b!560208 m!537967))

(assert (=> b!560210 m!537941))

(assert (=> b!560210 m!537941))

(declare-fun m!537969 () Bool)

(assert (=> b!560210 m!537969))

(declare-fun m!537971 () Bool)

(assert (=> b!560210 m!537971))

(declare-fun m!537973 () Bool)

(assert (=> b!560210 m!537973))

(declare-fun m!537975 () Bool)

(assert (=> b!560205 m!537975))

(declare-fun m!537977 () Bool)

(assert (=> b!560215 m!537977))

(assert (=> b!560212 m!537941))

(assert (=> b!560212 m!537941))

(declare-fun m!537979 () Bool)

(assert (=> b!560212 m!537979))

(declare-fun m!537981 () Bool)

(assert (=> start!51334 m!537981))

(declare-fun m!537983 () Bool)

(assert (=> start!51334 m!537983))

(check-sat (not start!51334) (not b!560208) (not b!560212) (not b!560205) (not b!560207) (not b!560210) (not b!560214) (not b!560215) (not b!560206) (not b!560211) (not b!560204))
(check-sat)
