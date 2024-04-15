; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51374 () Bool)

(assert start!51374)

(declare-fun b!560947 () Bool)

(declare-fun e!323210 () Bool)

(declare-fun e!323212 () Bool)

(assert (=> b!560947 (= e!323210 e!323212)))

(declare-fun res!352244 () Bool)

(assert (=> b!560947 (=> (not res!352244) (not e!323212))))

(declare-fun lt!255123 () (_ BitVec 32))

(declare-datatypes ((array!35248 0))(
  ( (array!35249 (arr!16925 (Array (_ BitVec 32) (_ BitVec 64))) (size!17290 (_ BitVec 32))) )
))
(declare-fun lt!255128 () array!35248)

(declare-datatypes ((SeekEntryResult!5371 0))(
  ( (MissingZero!5371 (index!23711 (_ BitVec 32))) (Found!5371 (index!23712 (_ BitVec 32))) (Intermediate!5371 (undefined!6183 Bool) (index!23713 (_ BitVec 32)) (x!52629 (_ BitVec 32))) (Undefined!5371) (MissingVacant!5371 (index!23714 (_ BitVec 32))) )
))
(declare-fun lt!255126 () SeekEntryResult!5371)

(declare-fun lt!255124 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35248 (_ BitVec 32)) SeekEntryResult!5371)

(assert (=> b!560947 (= res!352244 (= lt!255126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255123 lt!255124 lt!255128 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255129 () (_ BitVec 32))

(declare-fun a!3118 () array!35248)

(assert (=> b!560947 (= lt!255126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255129 (select (arr!16925 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560947 (= lt!255123 (toIndex!0 lt!255124 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560947 (= lt!255124 (select (store (arr!16925 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560947 (= lt!255129 (toIndex!0 (select (arr!16925 a!3118) j!142) mask!3119))))

(assert (=> b!560947 (= lt!255128 (array!35249 (store (arr!16925 a!3118) i!1132 k0!1914) (size!17290 a!3118)))))

(declare-fun b!560948 () Bool)

(declare-fun res!352245 () Bool)

(assert (=> b!560948 (=> (not res!352245) (not e!323210))))

(declare-datatypes ((List!11044 0))(
  ( (Nil!11041) (Cons!11040 (h!12043 (_ BitVec 64)) (t!17263 List!11044)) )
))
(declare-fun arrayNoDuplicates!0 (array!35248 (_ BitVec 32) List!11044) Bool)

(assert (=> b!560948 (= res!352245 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11041))))

(declare-fun b!560950 () Bool)

(assert (=> b!560950 (= e!323212 (not true))))

(declare-fun e!323215 () Bool)

(assert (=> b!560950 e!323215))

(declare-fun res!352248 () Bool)

(assert (=> b!560950 (=> (not res!352248) (not e!323215))))

(declare-fun lt!255125 () SeekEntryResult!5371)

(assert (=> b!560950 (= res!352248 (= lt!255125 (Found!5371 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35248 (_ BitVec 32)) SeekEntryResult!5371)

(assert (=> b!560950 (= lt!255125 (seekEntryOrOpen!0 (select (arr!16925 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35248 (_ BitVec 32)) Bool)

(assert (=> b!560950 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17502 0))(
  ( (Unit!17503) )
))
(declare-fun lt!255122 () Unit!17502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17502)

(assert (=> b!560950 (= lt!255122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560951 () Bool)

(declare-fun res!352249 () Bool)

(assert (=> b!560951 (=> (not res!352249) (not e!323210))))

(assert (=> b!560951 (= res!352249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560952 () Bool)

(declare-fun e!323217 () Bool)

(assert (=> b!560952 (= e!323215 e!323217)))

(declare-fun res!352243 () Bool)

(assert (=> b!560952 (=> res!352243 e!323217)))

(get-info :version)

(assert (=> b!560952 (= res!352243 (or (undefined!6183 lt!255126) (not ((_ is Intermediate!5371) lt!255126))))))

(declare-fun b!560953 () Bool)

(declare-fun res!352252 () Bool)

(declare-fun e!323216 () Bool)

(assert (=> b!560953 (=> (not res!352252) (not e!323216))))

(declare-fun arrayContainsKey!0 (array!35248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560953 (= res!352252 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560954 () Bool)

(declare-fun res!352241 () Bool)

(assert (=> b!560954 (=> (not res!352241) (not e!323216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560954 (= res!352241 (validKeyInArray!0 (select (arr!16925 a!3118) j!142)))))

(declare-fun b!560955 () Bool)

(declare-fun e!323213 () Bool)

(declare-fun e!323214 () Bool)

(assert (=> b!560955 (= e!323213 e!323214)))

(declare-fun res!352242 () Bool)

(assert (=> b!560955 (=> (not res!352242) (not e!323214))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35248 (_ BitVec 32)) SeekEntryResult!5371)

(assert (=> b!560955 (= res!352242 (= lt!255125 (seekKeyOrZeroReturnVacant!0 (x!52629 lt!255126) (index!23713 lt!255126) (index!23713 lt!255126) (select (arr!16925 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560956 () Bool)

(declare-fun res!352246 () Bool)

(assert (=> b!560956 (=> (not res!352246) (not e!323216))))

(assert (=> b!560956 (= res!352246 (and (= (size!17290 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17290 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17290 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560957 () Bool)

(assert (=> b!560957 (= e!323216 e!323210)))

(declare-fun res!352250 () Bool)

(assert (=> b!560957 (=> (not res!352250) (not e!323210))))

(declare-fun lt!255130 () SeekEntryResult!5371)

(assert (=> b!560957 (= res!352250 (or (= lt!255130 (MissingZero!5371 i!1132)) (= lt!255130 (MissingVacant!5371 i!1132))))))

(assert (=> b!560957 (= lt!255130 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560958 () Bool)

(assert (=> b!560958 (= e!323214 (= (seekEntryOrOpen!0 lt!255124 lt!255128 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52629 lt!255126) (index!23713 lt!255126) (index!23713 lt!255126) lt!255124 lt!255128 mask!3119)))))

(declare-fun b!560959 () Bool)

(assert (=> b!560959 (= e!323217 e!323213)))

(declare-fun res!352247 () Bool)

(assert (=> b!560959 (=> res!352247 e!323213)))

(declare-fun lt!255127 () (_ BitVec 64))

(assert (=> b!560959 (= res!352247 (or (= lt!255127 (select (arr!16925 a!3118) j!142)) (= lt!255127 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560959 (= lt!255127 (select (arr!16925 a!3118) (index!23713 lt!255126)))))

(declare-fun b!560949 () Bool)

(declare-fun res!352251 () Bool)

(assert (=> b!560949 (=> (not res!352251) (not e!323216))))

(assert (=> b!560949 (= res!352251 (validKeyInArray!0 k0!1914))))

(declare-fun res!352253 () Bool)

(assert (=> start!51374 (=> (not res!352253) (not e!323216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51374 (= res!352253 (validMask!0 mask!3119))))

(assert (=> start!51374 e!323216))

(assert (=> start!51374 true))

(declare-fun array_inv!12808 (array!35248) Bool)

(assert (=> start!51374 (array_inv!12808 a!3118)))

(assert (= (and start!51374 res!352253) b!560956))

(assert (= (and b!560956 res!352246) b!560954))

(assert (= (and b!560954 res!352241) b!560949))

(assert (= (and b!560949 res!352251) b!560953))

(assert (= (and b!560953 res!352252) b!560957))

(assert (= (and b!560957 res!352250) b!560951))

(assert (= (and b!560951 res!352249) b!560948))

(assert (= (and b!560948 res!352245) b!560947))

(assert (= (and b!560947 res!352244) b!560950))

(assert (= (and b!560950 res!352248) b!560952))

(assert (= (and b!560952 (not res!352243)) b!560959))

(assert (= (and b!560959 (not res!352247)) b!560955))

(assert (= (and b!560955 res!352242) b!560958))

(declare-fun m!538313 () Bool)

(assert (=> start!51374 m!538313))

(declare-fun m!538315 () Bool)

(assert (=> start!51374 m!538315))

(declare-fun m!538317 () Bool)

(assert (=> b!560947 m!538317))

(declare-fun m!538319 () Bool)

(assert (=> b!560947 m!538319))

(assert (=> b!560947 m!538317))

(declare-fun m!538321 () Bool)

(assert (=> b!560947 m!538321))

(declare-fun m!538323 () Bool)

(assert (=> b!560947 m!538323))

(declare-fun m!538325 () Bool)

(assert (=> b!560947 m!538325))

(assert (=> b!560947 m!538317))

(declare-fun m!538327 () Bool)

(assert (=> b!560947 m!538327))

(declare-fun m!538329 () Bool)

(assert (=> b!560947 m!538329))

(declare-fun m!538331 () Bool)

(assert (=> b!560951 m!538331))

(assert (=> b!560950 m!538317))

(assert (=> b!560950 m!538317))

(declare-fun m!538333 () Bool)

(assert (=> b!560950 m!538333))

(declare-fun m!538335 () Bool)

(assert (=> b!560950 m!538335))

(declare-fun m!538337 () Bool)

(assert (=> b!560950 m!538337))

(declare-fun m!538339 () Bool)

(assert (=> b!560949 m!538339))

(assert (=> b!560955 m!538317))

(assert (=> b!560955 m!538317))

(declare-fun m!538341 () Bool)

(assert (=> b!560955 m!538341))

(declare-fun m!538343 () Bool)

(assert (=> b!560957 m!538343))

(declare-fun m!538345 () Bool)

(assert (=> b!560948 m!538345))

(assert (=> b!560959 m!538317))

(declare-fun m!538347 () Bool)

(assert (=> b!560959 m!538347))

(assert (=> b!560954 m!538317))

(assert (=> b!560954 m!538317))

(declare-fun m!538349 () Bool)

(assert (=> b!560954 m!538349))

(declare-fun m!538351 () Bool)

(assert (=> b!560953 m!538351))

(declare-fun m!538353 () Bool)

(assert (=> b!560958 m!538353))

(declare-fun m!538355 () Bool)

(assert (=> b!560958 m!538355))

(check-sat (not b!560951) (not start!51374) (not b!560954) (not b!560947) (not b!560949) (not b!560950) (not b!560957) (not b!560948) (not b!560953) (not b!560958) (not b!560955))
(check-sat)
