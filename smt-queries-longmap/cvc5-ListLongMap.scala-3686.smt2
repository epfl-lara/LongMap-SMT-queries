; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50732 () Bool)

(assert start!50732)

(declare-fun b!554874 () Bool)

(declare-fun res!347292 () Bool)

(declare-fun e!319887 () Bool)

(assert (=> b!554874 (=> (not res!347292) (not e!319887))))

(declare-datatypes ((array!34957 0))(
  ( (array!34958 (arr!16788 (Array (_ BitVec 32) (_ BitVec 64))) (size!17152 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34957)

(declare-datatypes ((List!10868 0))(
  ( (Nil!10865) (Cons!10864 (h!11849 (_ BitVec 64)) (t!17096 List!10868)) )
))
(declare-fun arrayNoDuplicates!0 (array!34957 (_ BitVec 32) List!10868) Bool)

(assert (=> b!554874 (= res!347292 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10865))))

(declare-fun res!347289 () Bool)

(declare-fun e!319886 () Bool)

(assert (=> start!50732 (=> (not res!347289) (not e!319886))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50732 (= res!347289 (validMask!0 mask!3119))))

(assert (=> start!50732 e!319886))

(assert (=> start!50732 true))

(declare-fun array_inv!12584 (array!34957) Bool)

(assert (=> start!50732 (array_inv!12584 a!3118)))

(declare-fun b!554875 () Bool)

(assert (=> b!554875 (= e!319886 e!319887)))

(declare-fun res!347290 () Bool)

(assert (=> b!554875 (=> (not res!347290) (not e!319887))))

(declare-datatypes ((SeekEntryResult!5237 0))(
  ( (MissingZero!5237 (index!23175 (_ BitVec 32))) (Found!5237 (index!23176 (_ BitVec 32))) (Intermediate!5237 (undefined!6049 Bool) (index!23177 (_ BitVec 32)) (x!52087 (_ BitVec 32))) (Undefined!5237) (MissingVacant!5237 (index!23178 (_ BitVec 32))) )
))
(declare-fun lt!252043 () SeekEntryResult!5237)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554875 (= res!347290 (or (= lt!252043 (MissingZero!5237 i!1132)) (= lt!252043 (MissingVacant!5237 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34957 (_ BitVec 32)) SeekEntryResult!5237)

(assert (=> b!554875 (= lt!252043 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554876 () Bool)

(declare-fun e!319885 () Bool)

(assert (=> b!554876 (= e!319887 e!319885)))

(declare-fun res!347291 () Bool)

(assert (=> b!554876 (=> (not res!347291) (not e!319885))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252038 () SeekEntryResult!5237)

(declare-fun lt!252040 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34957 (_ BitVec 32)) SeekEntryResult!5237)

(assert (=> b!554876 (= res!347291 (= lt!252038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252040 (select (store (arr!16788 a!3118) i!1132 k!1914) j!142) (array!34958 (store (arr!16788 a!3118) i!1132 k!1914) (size!17152 a!3118)) mask!3119)))))

(declare-fun lt!252042 () (_ BitVec 32))

(assert (=> b!554876 (= lt!252038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252042 (select (arr!16788 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554876 (= lt!252040 (toIndex!0 (select (store (arr!16788 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554876 (= lt!252042 (toIndex!0 (select (arr!16788 a!3118) j!142) mask!3119))))

(declare-fun b!554877 () Bool)

(declare-fun res!347294 () Bool)

(assert (=> b!554877 (=> (not res!347294) (not e!319887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34957 (_ BitVec 32)) Bool)

(assert (=> b!554877 (= res!347294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554878 () Bool)

(declare-fun res!347287 () Bool)

(assert (=> b!554878 (=> (not res!347287) (not e!319886))))

(declare-fun arrayContainsKey!0 (array!34957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554878 (= res!347287 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554879 () Bool)

(declare-fun res!347286 () Bool)

(assert (=> b!554879 (=> (not res!347286) (not e!319886))))

(assert (=> b!554879 (= res!347286 (and (= (size!17152 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17152 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17152 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554880 () Bool)

(declare-fun res!347288 () Bool)

(assert (=> b!554880 (=> (not res!347288) (not e!319886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554880 (= res!347288 (validKeyInArray!0 k!1914))))

(declare-fun b!554881 () Bool)

(declare-fun res!347293 () Bool)

(assert (=> b!554881 (=> (not res!347293) (not e!319886))))

(assert (=> b!554881 (= res!347293 (validKeyInArray!0 (select (arr!16788 a!3118) j!142)))))

(declare-fun b!554882 () Bool)

(assert (=> b!554882 (= e!319885 (not true))))

(declare-fun lt!252039 () SeekEntryResult!5237)

(assert (=> b!554882 (and (= lt!252039 (Found!5237 j!142)) (or (undefined!6049 lt!252038) (not (is-Intermediate!5237 lt!252038)) (= (select (arr!16788 a!3118) (index!23177 lt!252038)) (select (arr!16788 a!3118) j!142)) (not (= (select (arr!16788 a!3118) (index!23177 lt!252038)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252039 (MissingZero!5237 (index!23177 lt!252038)))))))

(assert (=> b!554882 (= lt!252039 (seekEntryOrOpen!0 (select (arr!16788 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554882 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17248 0))(
  ( (Unit!17249) )
))
(declare-fun lt!252041 () Unit!17248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17248)

(assert (=> b!554882 (= lt!252041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50732 res!347289) b!554879))

(assert (= (and b!554879 res!347286) b!554881))

(assert (= (and b!554881 res!347293) b!554880))

(assert (= (and b!554880 res!347288) b!554878))

(assert (= (and b!554878 res!347287) b!554875))

(assert (= (and b!554875 res!347290) b!554877))

(assert (= (and b!554877 res!347294) b!554874))

(assert (= (and b!554874 res!347292) b!554876))

(assert (= (and b!554876 res!347291) b!554882))

(declare-fun m!532329 () Bool)

(assert (=> start!50732 m!532329))

(declare-fun m!532331 () Bool)

(assert (=> start!50732 m!532331))

(declare-fun m!532333 () Bool)

(assert (=> b!554876 m!532333))

(declare-fun m!532335 () Bool)

(assert (=> b!554876 m!532335))

(assert (=> b!554876 m!532333))

(assert (=> b!554876 m!532333))

(declare-fun m!532337 () Bool)

(assert (=> b!554876 m!532337))

(declare-fun m!532339 () Bool)

(assert (=> b!554876 m!532339))

(assert (=> b!554876 m!532339))

(declare-fun m!532341 () Bool)

(assert (=> b!554876 m!532341))

(declare-fun m!532343 () Bool)

(assert (=> b!554876 m!532343))

(assert (=> b!554876 m!532339))

(declare-fun m!532345 () Bool)

(assert (=> b!554876 m!532345))

(declare-fun m!532347 () Bool)

(assert (=> b!554875 m!532347))

(declare-fun m!532349 () Bool)

(assert (=> b!554878 m!532349))

(declare-fun m!532351 () Bool)

(assert (=> b!554877 m!532351))

(assert (=> b!554882 m!532333))

(declare-fun m!532353 () Bool)

(assert (=> b!554882 m!532353))

(declare-fun m!532355 () Bool)

(assert (=> b!554882 m!532355))

(declare-fun m!532357 () Bool)

(assert (=> b!554882 m!532357))

(assert (=> b!554882 m!532333))

(declare-fun m!532359 () Bool)

(assert (=> b!554882 m!532359))

(declare-fun m!532361 () Bool)

(assert (=> b!554874 m!532361))

(assert (=> b!554881 m!532333))

(assert (=> b!554881 m!532333))

(declare-fun m!532363 () Bool)

(assert (=> b!554881 m!532363))

(declare-fun m!532365 () Bool)

(assert (=> b!554880 m!532365))

(push 1)

