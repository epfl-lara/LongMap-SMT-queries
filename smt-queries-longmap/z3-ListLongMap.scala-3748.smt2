; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51484 () Bool)

(assert start!51484)

(declare-fun b!563070 () Bool)

(declare-fun e!324503 () Bool)

(declare-fun e!324504 () Bool)

(assert (=> b!563070 (= e!324503 e!324504)))

(declare-fun res!354227 () Bool)

(assert (=> b!563070 (=> res!354227 e!324504)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35349 0))(
  ( (array!35350 (arr!16975 (Array (_ BitVec 32) (_ BitVec 64))) (size!17339 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35349)

(declare-fun lt!256982 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5424 0))(
  ( (MissingZero!5424 (index!23923 (_ BitVec 32))) (Found!5424 (index!23924 (_ BitVec 32))) (Intermediate!5424 (undefined!6236 Bool) (index!23925 (_ BitVec 32)) (x!52815 (_ BitVec 32))) (Undefined!5424) (MissingVacant!5424 (index!23926 (_ BitVec 32))) )
))
(declare-fun lt!256977 () SeekEntryResult!5424)

(declare-fun lt!256985 () SeekEntryResult!5424)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!256986 () SeekEntryResult!5424)

(assert (=> b!563070 (= res!354227 (or (bvslt (index!23925 lt!256986) #b00000000000000000000000000000000) (bvsge (index!23925 lt!256986) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52815 lt!256986) #b01111111111111111111111111111110) (bvslt (x!52815 lt!256986) #b00000000000000000000000000000000) (not (= lt!256982 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16975 a!3118) i!1132 k0!1914) (index!23925 lt!256986)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256977 lt!256985))))))

(declare-fun lt!256984 () SeekEntryResult!5424)

(declare-fun lt!256980 () SeekEntryResult!5424)

(assert (=> b!563070 (= lt!256984 lt!256980)))

(declare-fun lt!256975 () array!35349)

(declare-fun lt!256974 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35349 (_ BitVec 32)) SeekEntryResult!5424)

(assert (=> b!563070 (= lt!256980 (seekKeyOrZeroReturnVacant!0 (x!52815 lt!256986) (index!23925 lt!256986) (index!23925 lt!256986) lt!256974 lt!256975 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35349 (_ BitVec 32)) SeekEntryResult!5424)

(assert (=> b!563070 (= lt!256984 (seekEntryOrOpen!0 lt!256974 lt!256975 mask!3119))))

(declare-fun lt!256979 () SeekEntryResult!5424)

(assert (=> b!563070 (= lt!256979 lt!256977)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!563070 (= lt!256977 (seekKeyOrZeroReturnVacant!0 (x!52815 lt!256986) (index!23925 lt!256986) (index!23925 lt!256986) (select (arr!16975 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!563071 () Bool)

(declare-fun res!354233 () Bool)

(declare-fun e!324502 () Bool)

(assert (=> b!563071 (=> (not res!354233) (not e!324502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563071 (= res!354233 (validKeyInArray!0 k0!1914))))

(declare-fun b!563072 () Bool)

(declare-fun res!354225 () Bool)

(assert (=> b!563072 (=> (not res!354225) (not e!324502))))

(assert (=> b!563072 (= res!354225 (validKeyInArray!0 (select (arr!16975 a!3118) j!142)))))

(declare-fun b!563073 () Bool)

(declare-fun e!324507 () Bool)

(declare-fun e!324505 () Bool)

(assert (=> b!563073 (= e!324507 e!324505)))

(declare-fun res!354223 () Bool)

(assert (=> b!563073 (=> (not res!354223) (not e!324505))))

(declare-fun lt!256983 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35349 (_ BitVec 32)) SeekEntryResult!5424)

(assert (=> b!563073 (= res!354223 (= lt!256986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256983 lt!256974 lt!256975 mask!3119)))))

(declare-fun lt!256978 () (_ BitVec 32))

(assert (=> b!563073 (= lt!256986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256978 (select (arr!16975 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563073 (= lt!256983 (toIndex!0 lt!256974 mask!3119))))

(assert (=> b!563073 (= lt!256974 (select (store (arr!16975 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!563073 (= lt!256978 (toIndex!0 (select (arr!16975 a!3118) j!142) mask!3119))))

(assert (=> b!563073 (= lt!256975 (array!35350 (store (arr!16975 a!3118) i!1132 k0!1914) (size!17339 a!3118)))))

(declare-fun b!563074 () Bool)

(assert (=> b!563074 (= e!324502 e!324507)))

(declare-fun res!354224 () Bool)

(assert (=> b!563074 (=> (not res!354224) (not e!324507))))

(declare-fun lt!256976 () SeekEntryResult!5424)

(assert (=> b!563074 (= res!354224 (or (= lt!256976 (MissingZero!5424 i!1132)) (= lt!256976 (MissingVacant!5424 i!1132))))))

(assert (=> b!563074 (= lt!256976 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563075 () Bool)

(declare-fun res!354231 () Bool)

(assert (=> b!563075 (=> (not res!354231) (not e!324502))))

(assert (=> b!563075 (= res!354231 (and (= (size!17339 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17339 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17339 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563076 () Bool)

(declare-fun res!354230 () Bool)

(assert (=> b!563076 (=> (not res!354230) (not e!324502))))

(declare-fun arrayContainsKey!0 (array!35349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563076 (= res!354230 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563077 () Bool)

(declare-fun res!354229 () Bool)

(assert (=> b!563077 (=> (not res!354229) (not e!324507))))

(declare-datatypes ((List!11055 0))(
  ( (Nil!11052) (Cons!11051 (h!12054 (_ BitVec 64)) (t!17283 List!11055)) )
))
(declare-fun arrayNoDuplicates!0 (array!35349 (_ BitVec 32) List!11055) Bool)

(assert (=> b!563077 (= res!354229 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11052))))

(declare-fun b!563078 () Bool)

(declare-fun e!324506 () Bool)

(assert (=> b!563078 (= e!324505 (not e!324506))))

(declare-fun res!354226 () Bool)

(assert (=> b!563078 (=> res!354226 e!324506)))

(get-info :version)

(assert (=> b!563078 (= res!354226 (or (undefined!6236 lt!256986) (not ((_ is Intermediate!5424) lt!256986))))))

(assert (=> b!563078 (= lt!256979 lt!256985)))

(assert (=> b!563078 (= lt!256985 (Found!5424 j!142))))

(assert (=> b!563078 (= lt!256979 (seekEntryOrOpen!0 (select (arr!16975 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35349 (_ BitVec 32)) Bool)

(assert (=> b!563078 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17622 0))(
  ( (Unit!17623) )
))
(declare-fun lt!256987 () Unit!17622)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35349 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17622)

(assert (=> b!563078 (= lt!256987 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563079 () Bool)

(assert (=> b!563079 (= e!324504 true)))

(assert (=> b!563079 (= lt!256977 lt!256980)))

(declare-fun lt!256981 () Unit!17622)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35349 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17622)

(assert (=> b!563079 (= lt!256981 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52815 lt!256986) (index!23925 lt!256986) (index!23925 lt!256986) mask!3119))))

(declare-fun b!563080 () Bool)

(assert (=> b!563080 (= e!324506 e!324503)))

(declare-fun res!354222 () Bool)

(assert (=> b!563080 (=> res!354222 e!324503)))

(assert (=> b!563080 (= res!354222 (or (= lt!256982 (select (arr!16975 a!3118) j!142)) (= lt!256982 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!563080 (= lt!256982 (select (arr!16975 a!3118) (index!23925 lt!256986)))))

(declare-fun b!563081 () Bool)

(declare-fun res!354232 () Bool)

(assert (=> b!563081 (=> (not res!354232) (not e!324507))))

(assert (=> b!563081 (= res!354232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!354228 () Bool)

(assert (=> start!51484 (=> (not res!354228) (not e!324502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51484 (= res!354228 (validMask!0 mask!3119))))

(assert (=> start!51484 e!324502))

(assert (=> start!51484 true))

(declare-fun array_inv!12771 (array!35349) Bool)

(assert (=> start!51484 (array_inv!12771 a!3118)))

(assert (= (and start!51484 res!354228) b!563075))

(assert (= (and b!563075 res!354231) b!563072))

(assert (= (and b!563072 res!354225) b!563071))

(assert (= (and b!563071 res!354233) b!563076))

(assert (= (and b!563076 res!354230) b!563074))

(assert (= (and b!563074 res!354224) b!563081))

(assert (= (and b!563081 res!354232) b!563077))

(assert (= (and b!563077 res!354229) b!563073))

(assert (= (and b!563073 res!354223) b!563078))

(assert (= (and b!563078 (not res!354226)) b!563080))

(assert (= (and b!563080 (not res!354222)) b!563070))

(assert (= (and b!563070 (not res!354227)) b!563079))

(declare-fun m!541317 () Bool)

(assert (=> b!563080 m!541317))

(declare-fun m!541319 () Bool)

(assert (=> b!563080 m!541319))

(declare-fun m!541321 () Bool)

(assert (=> b!563073 m!541321))

(assert (=> b!563073 m!541317))

(declare-fun m!541323 () Bool)

(assert (=> b!563073 m!541323))

(assert (=> b!563073 m!541317))

(assert (=> b!563073 m!541317))

(declare-fun m!541325 () Bool)

(assert (=> b!563073 m!541325))

(declare-fun m!541327 () Bool)

(assert (=> b!563073 m!541327))

(declare-fun m!541329 () Bool)

(assert (=> b!563073 m!541329))

(declare-fun m!541331 () Bool)

(assert (=> b!563073 m!541331))

(declare-fun m!541333 () Bool)

(assert (=> b!563071 m!541333))

(assert (=> b!563070 m!541317))

(declare-fun m!541335 () Bool)

(assert (=> b!563070 m!541335))

(assert (=> b!563070 m!541317))

(declare-fun m!541337 () Bool)

(assert (=> b!563070 m!541337))

(declare-fun m!541339 () Bool)

(assert (=> b!563070 m!541339))

(assert (=> b!563070 m!541329))

(declare-fun m!541341 () Bool)

(assert (=> b!563070 m!541341))

(declare-fun m!541343 () Bool)

(assert (=> b!563074 m!541343))

(declare-fun m!541345 () Bool)

(assert (=> b!563079 m!541345))

(assert (=> b!563078 m!541317))

(assert (=> b!563078 m!541317))

(declare-fun m!541347 () Bool)

(assert (=> b!563078 m!541347))

(declare-fun m!541349 () Bool)

(assert (=> b!563078 m!541349))

(declare-fun m!541351 () Bool)

(assert (=> b!563078 m!541351))

(assert (=> b!563072 m!541317))

(assert (=> b!563072 m!541317))

(declare-fun m!541353 () Bool)

(assert (=> b!563072 m!541353))

(declare-fun m!541355 () Bool)

(assert (=> b!563081 m!541355))

(declare-fun m!541357 () Bool)

(assert (=> start!51484 m!541357))

(declare-fun m!541359 () Bool)

(assert (=> start!51484 m!541359))

(declare-fun m!541361 () Bool)

(assert (=> b!563077 m!541361))

(declare-fun m!541363 () Bool)

(assert (=> b!563076 m!541363))

(check-sat (not start!51484) (not b!563072) (not b!563076) (not b!563073) (not b!563081) (not b!563071) (not b!563070) (not b!563079) (not b!563077) (not b!563074) (not b!563078))
(check-sat)
