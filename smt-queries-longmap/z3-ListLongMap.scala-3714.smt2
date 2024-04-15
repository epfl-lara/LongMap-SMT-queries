; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51068 () Bool)

(assert start!51068)

(declare-fun b!557912 () Bool)

(declare-fun e!321384 () Bool)

(declare-fun e!321383 () Bool)

(assert (=> b!557912 (= e!321384 e!321383)))

(declare-fun res!349921 () Bool)

(assert (=> b!557912 (=> (not res!349921) (not e!321383))))

(declare-datatypes ((SeekEntryResult!5317 0))(
  ( (MissingZero!5317 (index!23495 (_ BitVec 32))) (Found!5317 (index!23496 (_ BitVec 32))) (Intermediate!5317 (undefined!6129 Bool) (index!23497 (_ BitVec 32)) (x!52404 (_ BitVec 32))) (Undefined!5317) (MissingVacant!5317 (index!23498 (_ BitVec 32))) )
))
(declare-fun lt!253410 () SeekEntryResult!5317)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557912 (= res!349921 (or (= lt!253410 (MissingZero!5317 i!1132)) (= lt!253410 (MissingVacant!5317 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35131 0))(
  ( (array!35132 (arr!16871 (Array (_ BitVec 32) (_ BitVec 64))) (size!17236 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35131)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35131 (_ BitVec 32)) SeekEntryResult!5317)

(assert (=> b!557912 (= lt!253410 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557913 () Bool)

(declare-fun res!349920 () Bool)

(assert (=> b!557913 (=> (not res!349920) (not e!321384))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557913 (= res!349920 (validKeyInArray!0 (select (arr!16871 a!3118) j!142)))))

(declare-fun res!349926 () Bool)

(assert (=> start!51068 (=> (not res!349926) (not e!321384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51068 (= res!349926 (validMask!0 mask!3119))))

(assert (=> start!51068 e!321384))

(assert (=> start!51068 true))

(declare-fun array_inv!12754 (array!35131) Bool)

(assert (=> start!51068 (array_inv!12754 a!3118)))

(declare-fun b!557914 () Bool)

(declare-fun res!349922 () Bool)

(assert (=> b!557914 (=> (not res!349922) (not e!321383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35131 (_ BitVec 32)) Bool)

(assert (=> b!557914 (= res!349922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557915 () Bool)

(declare-fun e!321385 () Bool)

(assert (=> b!557915 (= e!321383 e!321385)))

(declare-fun res!349919 () Bool)

(assert (=> b!557915 (=> (not res!349919) (not e!321385))))

(declare-fun lt!253409 () SeekEntryResult!5317)

(declare-fun lt!253407 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35131 (_ BitVec 32)) SeekEntryResult!5317)

(assert (=> b!557915 (= res!349919 (= lt!253409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253407 (select (store (arr!16871 a!3118) i!1132 k0!1914) j!142) (array!35132 (store (arr!16871 a!3118) i!1132 k0!1914) (size!17236 a!3118)) mask!3119)))))

(declare-fun lt!253411 () (_ BitVec 32))

(assert (=> b!557915 (= lt!253409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253411 (select (arr!16871 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557915 (= lt!253407 (toIndex!0 (select (store (arr!16871 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!557915 (= lt!253411 (toIndex!0 (select (arr!16871 a!3118) j!142) mask!3119))))

(declare-fun b!557916 () Bool)

(declare-fun res!349923 () Bool)

(assert (=> b!557916 (=> (not res!349923) (not e!321383))))

(declare-datatypes ((List!10990 0))(
  ( (Nil!10987) (Cons!10986 (h!11980 (_ BitVec 64)) (t!17209 List!10990)) )
))
(declare-fun arrayNoDuplicates!0 (array!35131 (_ BitVec 32) List!10990) Bool)

(assert (=> b!557916 (= res!349923 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10987))))

(declare-fun b!557917 () Bool)

(declare-fun res!349927 () Bool)

(assert (=> b!557917 (=> (not res!349927) (not e!321384))))

(assert (=> b!557917 (= res!349927 (validKeyInArray!0 k0!1914))))

(declare-fun b!557918 () Bool)

(declare-fun e!321382 () Bool)

(assert (=> b!557918 (= e!321382 (validKeyInArray!0 (select (store (arr!16871 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun b!557919 () Bool)

(assert (=> b!557919 (= e!321385 (not e!321382))))

(declare-fun res!349928 () Bool)

(assert (=> b!557919 (=> res!349928 e!321382)))

(get-info :version)

(assert (=> b!557919 (= res!349928 (or (undefined!6129 lt!253409) (not ((_ is Intermediate!5317) lt!253409)) (= (select (arr!16871 a!3118) (index!23497 lt!253409)) (select (arr!16871 a!3118) j!142)) (= (select (arr!16871 a!3118) (index!23497 lt!253409)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!321381 () Bool)

(assert (=> b!557919 e!321381))

(declare-fun res!349917 () Bool)

(assert (=> b!557919 (=> (not res!349917) (not e!321381))))

(declare-fun lt!253408 () SeekEntryResult!5317)

(assert (=> b!557919 (= res!349917 (= lt!253408 (Found!5317 j!142)))))

(assert (=> b!557919 (= lt!253408 (seekEntryOrOpen!0 (select (arr!16871 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!557919 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17394 0))(
  ( (Unit!17395) )
))
(declare-fun lt!253406 () Unit!17394)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17394)

(assert (=> b!557919 (= lt!253406 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557920 () Bool)

(declare-fun res!349918 () Bool)

(assert (=> b!557920 (=> (not res!349918) (not e!321384))))

(declare-fun arrayContainsKey!0 (array!35131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557920 (= res!349918 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557921 () Bool)

(declare-fun e!321386 () Bool)

(assert (=> b!557921 (= e!321381 e!321386)))

(declare-fun res!349925 () Bool)

(assert (=> b!557921 (=> res!349925 e!321386)))

(assert (=> b!557921 (= res!349925 (or (undefined!6129 lt!253409) (not ((_ is Intermediate!5317) lt!253409)) (= (select (arr!16871 a!3118) (index!23497 lt!253409)) (select (arr!16871 a!3118) j!142)) (= (select (arr!16871 a!3118) (index!23497 lt!253409)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557922 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35131 (_ BitVec 32)) SeekEntryResult!5317)

(assert (=> b!557922 (= e!321386 (= lt!253408 (seekKeyOrZeroReturnVacant!0 (x!52404 lt!253409) (index!23497 lt!253409) (index!23497 lt!253409) (select (arr!16871 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!557923 () Bool)

(declare-fun res!349924 () Bool)

(assert (=> b!557923 (=> (not res!349924) (not e!321384))))

(assert (=> b!557923 (= res!349924 (and (= (size!17236 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17236 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17236 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51068 res!349926) b!557923))

(assert (= (and b!557923 res!349924) b!557913))

(assert (= (and b!557913 res!349920) b!557917))

(assert (= (and b!557917 res!349927) b!557920))

(assert (= (and b!557920 res!349918) b!557912))

(assert (= (and b!557912 res!349921) b!557914))

(assert (= (and b!557914 res!349922) b!557916))

(assert (= (and b!557916 res!349923) b!557915))

(assert (= (and b!557915 res!349919) b!557919))

(assert (= (and b!557919 res!349917) b!557921))

(assert (= (and b!557921 (not res!349925)) b!557922))

(assert (= (and b!557919 (not res!349928)) b!557918))

(declare-fun m!535337 () Bool)

(assert (=> b!557920 m!535337))

(declare-fun m!535339 () Bool)

(assert (=> b!557916 m!535339))

(declare-fun m!535341 () Bool)

(assert (=> start!51068 m!535341))

(declare-fun m!535343 () Bool)

(assert (=> start!51068 m!535343))

(declare-fun m!535345 () Bool)

(assert (=> b!557913 m!535345))

(assert (=> b!557913 m!535345))

(declare-fun m!535347 () Bool)

(assert (=> b!557913 m!535347))

(declare-fun m!535349 () Bool)

(assert (=> b!557921 m!535349))

(assert (=> b!557921 m!535345))

(declare-fun m!535351 () Bool)

(assert (=> b!557914 m!535351))

(declare-fun m!535353 () Bool)

(assert (=> b!557912 m!535353))

(assert (=> b!557915 m!535345))

(declare-fun m!535355 () Bool)

(assert (=> b!557915 m!535355))

(assert (=> b!557915 m!535345))

(declare-fun m!535357 () Bool)

(assert (=> b!557915 m!535357))

(declare-fun m!535359 () Bool)

(assert (=> b!557915 m!535359))

(declare-fun m!535361 () Bool)

(assert (=> b!557915 m!535361))

(assert (=> b!557915 m!535359))

(declare-fun m!535363 () Bool)

(assert (=> b!557915 m!535363))

(assert (=> b!557915 m!535345))

(assert (=> b!557915 m!535359))

(declare-fun m!535365 () Bool)

(assert (=> b!557915 m!535365))

(declare-fun m!535367 () Bool)

(assert (=> b!557917 m!535367))

(assert (=> b!557922 m!535345))

(assert (=> b!557922 m!535345))

(declare-fun m!535369 () Bool)

(assert (=> b!557922 m!535369))

(assert (=> b!557918 m!535361))

(assert (=> b!557918 m!535359))

(assert (=> b!557918 m!535359))

(declare-fun m!535371 () Bool)

(assert (=> b!557918 m!535371))

(assert (=> b!557919 m!535345))

(declare-fun m!535373 () Bool)

(assert (=> b!557919 m!535373))

(assert (=> b!557919 m!535349))

(declare-fun m!535375 () Bool)

(assert (=> b!557919 m!535375))

(assert (=> b!557919 m!535345))

(declare-fun m!535377 () Bool)

(assert (=> b!557919 m!535377))

(check-sat (not b!557915) (not b!557912) (not b!557920) (not b!557919) (not b!557916) (not b!557914) (not b!557917) (not b!557913) (not b!557918) (not b!557922) (not start!51068))
(check-sat)
