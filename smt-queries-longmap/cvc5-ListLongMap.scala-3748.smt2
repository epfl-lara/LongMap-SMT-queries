; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51482 () Bool)

(assert start!51482)

(declare-fun b!563035 () Bool)

(declare-fun res!354188 () Bool)

(declare-fun e!324483 () Bool)

(assert (=> b!563035 (=> (not res!354188) (not e!324483))))

(declare-datatypes ((array!35347 0))(
  ( (array!35348 (arr!16974 (Array (_ BitVec 32) (_ BitVec 64))) (size!17338 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35347)

(declare-datatypes ((List!11054 0))(
  ( (Nil!11051) (Cons!11050 (h!12053 (_ BitVec 64)) (t!17282 List!11054)) )
))
(declare-fun arrayNoDuplicates!0 (array!35347 (_ BitVec 32) List!11054) Bool)

(assert (=> b!563035 (= res!354188 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11051))))

(declare-fun b!563036 () Bool)

(declare-fun e!324480 () Bool)

(declare-fun e!324481 () Bool)

(assert (=> b!563036 (= e!324480 (not e!324481))))

(declare-fun res!354193 () Bool)

(assert (=> b!563036 (=> res!354193 e!324481)))

(declare-datatypes ((SeekEntryResult!5423 0))(
  ( (MissingZero!5423 (index!23919 (_ BitVec 32))) (Found!5423 (index!23920 (_ BitVec 32))) (Intermediate!5423 (undefined!6235 Bool) (index!23921 (_ BitVec 32)) (x!52814 (_ BitVec 32))) (Undefined!5423) (MissingVacant!5423 (index!23922 (_ BitVec 32))) )
))
(declare-fun lt!256942 () SeekEntryResult!5423)

(assert (=> b!563036 (= res!354193 (or (undefined!6235 lt!256942) (not (is-Intermediate!5423 lt!256942))))))

(declare-fun lt!256945 () SeekEntryResult!5423)

(declare-fun lt!256944 () SeekEntryResult!5423)

(assert (=> b!563036 (= lt!256945 lt!256944)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!563036 (= lt!256944 (Found!5423 j!142))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35347 (_ BitVec 32)) SeekEntryResult!5423)

(assert (=> b!563036 (= lt!256945 (seekEntryOrOpen!0 (select (arr!16974 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35347 (_ BitVec 32)) Bool)

(assert (=> b!563036 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17620 0))(
  ( (Unit!17621) )
))
(declare-fun lt!256938 () Unit!17620)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17620)

(assert (=> b!563036 (= lt!256938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563037 () Bool)

(declare-fun res!354194 () Bool)

(declare-fun e!324486 () Bool)

(assert (=> b!563037 (=> (not res!354194) (not e!324486))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563037 (= res!354194 (and (= (size!17338 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17338 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17338 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563038 () Bool)

(declare-fun res!354186 () Bool)

(assert (=> b!563038 (=> (not res!354186) (not e!324486))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563038 (= res!354186 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563039 () Bool)

(declare-fun e!324484 () Bool)

(declare-fun e!324485 () Bool)

(assert (=> b!563039 (= e!324484 e!324485)))

(declare-fun res!354197 () Bool)

(assert (=> b!563039 (=> res!354197 e!324485)))

(declare-fun lt!256936 () SeekEntryResult!5423)

(declare-fun lt!256932 () (_ BitVec 64))

(assert (=> b!563039 (= res!354197 (or (bvslt (index!23921 lt!256942) #b00000000000000000000000000000000) (bvsge (index!23921 lt!256942) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52814 lt!256942) #b01111111111111111111111111111110) (bvslt (x!52814 lt!256942) #b00000000000000000000000000000000) (not (= lt!256932 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16974 a!3118) i!1132 k!1914) (index!23921 lt!256942)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256936 lt!256944))))))

(declare-fun lt!256940 () SeekEntryResult!5423)

(declare-fun lt!256933 () SeekEntryResult!5423)

(assert (=> b!563039 (= lt!256940 lt!256933)))

(declare-fun lt!256939 () (_ BitVec 64))

(declare-fun lt!256937 () array!35347)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35347 (_ BitVec 32)) SeekEntryResult!5423)

(assert (=> b!563039 (= lt!256933 (seekKeyOrZeroReturnVacant!0 (x!52814 lt!256942) (index!23921 lt!256942) (index!23921 lt!256942) lt!256939 lt!256937 mask!3119))))

(assert (=> b!563039 (= lt!256940 (seekEntryOrOpen!0 lt!256939 lt!256937 mask!3119))))

(assert (=> b!563039 (= lt!256945 lt!256936)))

(assert (=> b!563039 (= lt!256936 (seekKeyOrZeroReturnVacant!0 (x!52814 lt!256942) (index!23921 lt!256942) (index!23921 lt!256942) (select (arr!16974 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!563040 () Bool)

(assert (=> b!563040 (= e!324485 true)))

(assert (=> b!563040 (= lt!256936 lt!256933)))

(declare-fun lt!256934 () Unit!17620)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17620)

(assert (=> b!563040 (= lt!256934 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52814 lt!256942) (index!23921 lt!256942) (index!23921 lt!256942) mask!3119))))

(declare-fun b!563041 () Bool)

(declare-fun res!354189 () Bool)

(assert (=> b!563041 (=> (not res!354189) (not e!324486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563041 (= res!354189 (validKeyInArray!0 (select (arr!16974 a!3118) j!142)))))

(declare-fun b!563042 () Bool)

(declare-fun res!354191 () Bool)

(assert (=> b!563042 (=> (not res!354191) (not e!324486))))

(assert (=> b!563042 (= res!354191 (validKeyInArray!0 k!1914))))

(declare-fun b!563043 () Bool)

(declare-fun res!354187 () Bool)

(assert (=> b!563043 (=> (not res!354187) (not e!324483))))

(assert (=> b!563043 (= res!354187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563034 () Bool)

(assert (=> b!563034 (= e!324483 e!324480)))

(declare-fun res!354195 () Bool)

(assert (=> b!563034 (=> (not res!354195) (not e!324480))))

(declare-fun lt!256941 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35347 (_ BitVec 32)) SeekEntryResult!5423)

(assert (=> b!563034 (= res!354195 (= lt!256942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256941 lt!256939 lt!256937 mask!3119)))))

(declare-fun lt!256943 () (_ BitVec 32))

(assert (=> b!563034 (= lt!256942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256943 (select (arr!16974 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563034 (= lt!256941 (toIndex!0 lt!256939 mask!3119))))

(assert (=> b!563034 (= lt!256939 (select (store (arr!16974 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!563034 (= lt!256943 (toIndex!0 (select (arr!16974 a!3118) j!142) mask!3119))))

(assert (=> b!563034 (= lt!256937 (array!35348 (store (arr!16974 a!3118) i!1132 k!1914) (size!17338 a!3118)))))

(declare-fun res!354192 () Bool)

(assert (=> start!51482 (=> (not res!354192) (not e!324486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51482 (= res!354192 (validMask!0 mask!3119))))

(assert (=> start!51482 e!324486))

(assert (=> start!51482 true))

(declare-fun array_inv!12770 (array!35347) Bool)

(assert (=> start!51482 (array_inv!12770 a!3118)))

(declare-fun b!563044 () Bool)

(assert (=> b!563044 (= e!324481 e!324484)))

(declare-fun res!354190 () Bool)

(assert (=> b!563044 (=> res!354190 e!324484)))

(assert (=> b!563044 (= res!354190 (or (= lt!256932 (select (arr!16974 a!3118) j!142)) (= lt!256932 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!563044 (= lt!256932 (select (arr!16974 a!3118) (index!23921 lt!256942)))))

(declare-fun b!563045 () Bool)

(assert (=> b!563045 (= e!324486 e!324483)))

(declare-fun res!354196 () Bool)

(assert (=> b!563045 (=> (not res!354196) (not e!324483))))

(declare-fun lt!256935 () SeekEntryResult!5423)

(assert (=> b!563045 (= res!354196 (or (= lt!256935 (MissingZero!5423 i!1132)) (= lt!256935 (MissingVacant!5423 i!1132))))))

(assert (=> b!563045 (= lt!256935 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51482 res!354192) b!563037))

(assert (= (and b!563037 res!354194) b!563041))

(assert (= (and b!563041 res!354189) b!563042))

(assert (= (and b!563042 res!354191) b!563038))

(assert (= (and b!563038 res!354186) b!563045))

(assert (= (and b!563045 res!354196) b!563043))

(assert (= (and b!563043 res!354187) b!563035))

(assert (= (and b!563035 res!354188) b!563034))

(assert (= (and b!563034 res!354195) b!563036))

(assert (= (and b!563036 (not res!354193)) b!563044))

(assert (= (and b!563044 (not res!354190)) b!563039))

(assert (= (and b!563039 (not res!354197)) b!563040))

(declare-fun m!541269 () Bool)

(assert (=> b!563039 m!541269))

(declare-fun m!541271 () Bool)

(assert (=> b!563039 m!541271))

(declare-fun m!541273 () Bool)

(assert (=> b!563039 m!541273))

(declare-fun m!541275 () Bool)

(assert (=> b!563039 m!541275))

(assert (=> b!563039 m!541269))

(declare-fun m!541277 () Bool)

(assert (=> b!563039 m!541277))

(declare-fun m!541279 () Bool)

(assert (=> b!563039 m!541279))

(declare-fun m!541281 () Bool)

(assert (=> b!563038 m!541281))

(assert (=> b!563036 m!541269))

(assert (=> b!563036 m!541269))

(declare-fun m!541283 () Bool)

(assert (=> b!563036 m!541283))

(declare-fun m!541285 () Bool)

(assert (=> b!563036 m!541285))

(declare-fun m!541287 () Bool)

(assert (=> b!563036 m!541287))

(declare-fun m!541289 () Bool)

(assert (=> start!51482 m!541289))

(declare-fun m!541291 () Bool)

(assert (=> start!51482 m!541291))

(declare-fun m!541293 () Bool)

(assert (=> b!563042 m!541293))

(assert (=> b!563044 m!541269))

(declare-fun m!541295 () Bool)

(assert (=> b!563044 m!541295))

(declare-fun m!541297 () Bool)

(assert (=> b!563043 m!541297))

(assert (=> b!563034 m!541269))

(declare-fun m!541299 () Bool)

(assert (=> b!563034 m!541299))

(declare-fun m!541301 () Bool)

(assert (=> b!563034 m!541301))

(assert (=> b!563034 m!541269))

(declare-fun m!541303 () Bool)

(assert (=> b!563034 m!541303))

(declare-fun m!541305 () Bool)

(assert (=> b!563034 m!541305))

(assert (=> b!563034 m!541269))

(declare-fun m!541307 () Bool)

(assert (=> b!563034 m!541307))

(assert (=> b!563034 m!541277))

(assert (=> b!563041 m!541269))

(assert (=> b!563041 m!541269))

(declare-fun m!541309 () Bool)

(assert (=> b!563041 m!541309))

(declare-fun m!541311 () Bool)

(assert (=> b!563040 m!541311))

(declare-fun m!541313 () Bool)

(assert (=> b!563035 m!541313))

(declare-fun m!541315 () Bool)

(assert (=> b!563045 m!541315))

(push 1)

