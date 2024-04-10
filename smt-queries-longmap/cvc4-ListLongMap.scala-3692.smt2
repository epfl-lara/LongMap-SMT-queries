; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50772 () Bool)

(assert start!50772)

(declare-fun b!555414 () Bool)

(declare-fun res!347827 () Bool)

(declare-fun e!320126 () Bool)

(assert (=> b!555414 (=> (not res!347827) (not e!320126))))

(declare-datatypes ((array!34997 0))(
  ( (array!34998 (arr!16808 (Array (_ BitVec 32) (_ BitVec 64))) (size!17172 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34997)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34997 (_ BitVec 32)) Bool)

(assert (=> b!555414 (= res!347827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!347826 () Bool)

(declare-fun e!320125 () Bool)

(assert (=> start!50772 (=> (not res!347826) (not e!320125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50772 (= res!347826 (validMask!0 mask!3119))))

(assert (=> start!50772 e!320125))

(assert (=> start!50772 true))

(declare-fun array_inv!12604 (array!34997) Bool)

(assert (=> start!50772 (array_inv!12604 a!3118)))

(declare-fun b!555415 () Bool)

(declare-fun res!347829 () Bool)

(assert (=> b!555415 (=> (not res!347829) (not e!320125))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555415 (= res!347829 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555416 () Bool)

(assert (=> b!555416 (= e!320125 e!320126)))

(declare-fun res!347828 () Bool)

(assert (=> b!555416 (=> (not res!347828) (not e!320126))))

(declare-datatypes ((SeekEntryResult!5257 0))(
  ( (MissingZero!5257 (index!23255 (_ BitVec 32))) (Found!5257 (index!23256 (_ BitVec 32))) (Intermediate!5257 (undefined!6069 Bool) (index!23257 (_ BitVec 32)) (x!52155 (_ BitVec 32))) (Undefined!5257) (MissingVacant!5257 (index!23258 (_ BitVec 32))) )
))
(declare-fun lt!252400 () SeekEntryResult!5257)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555416 (= res!347828 (or (= lt!252400 (MissingZero!5257 i!1132)) (= lt!252400 (MissingVacant!5257 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34997 (_ BitVec 32)) SeekEntryResult!5257)

(assert (=> b!555416 (= lt!252400 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555417 () Bool)

(declare-fun res!347834 () Bool)

(assert (=> b!555417 (=> (not res!347834) (not e!320126))))

(declare-datatypes ((List!10888 0))(
  ( (Nil!10885) (Cons!10884 (h!11869 (_ BitVec 64)) (t!17116 List!10888)) )
))
(declare-fun arrayNoDuplicates!0 (array!34997 (_ BitVec 32) List!10888) Bool)

(assert (=> b!555417 (= res!347834 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10885))))

(declare-fun b!555418 () Bool)

(declare-fun e!320127 () Bool)

(assert (=> b!555418 (= e!320126 e!320127)))

(declare-fun res!347830 () Bool)

(assert (=> b!555418 (=> (not res!347830) (not e!320127))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252402 () SeekEntryResult!5257)

(declare-fun lt!252399 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34997 (_ BitVec 32)) SeekEntryResult!5257)

(assert (=> b!555418 (= res!347830 (= lt!252402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252399 (select (store (arr!16808 a!3118) i!1132 k!1914) j!142) (array!34998 (store (arr!16808 a!3118) i!1132 k!1914) (size!17172 a!3118)) mask!3119)))))

(declare-fun lt!252401 () (_ BitVec 32))

(assert (=> b!555418 (= lt!252402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252401 (select (arr!16808 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555418 (= lt!252399 (toIndex!0 (select (store (arr!16808 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555418 (= lt!252401 (toIndex!0 (select (arr!16808 a!3118) j!142) mask!3119))))

(declare-fun b!555419 () Bool)

(declare-fun res!347832 () Bool)

(assert (=> b!555419 (=> (not res!347832) (not e!320125))))

(assert (=> b!555419 (= res!347832 (and (= (size!17172 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17172 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17172 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555420 () Bool)

(declare-fun res!347831 () Bool)

(assert (=> b!555420 (=> (not res!347831) (not e!320125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555420 (= res!347831 (validKeyInArray!0 k!1914))))

(declare-fun b!555421 () Bool)

(declare-fun res!347833 () Bool)

(assert (=> b!555421 (=> (not res!347833) (not e!320125))))

(assert (=> b!555421 (= res!347833 (validKeyInArray!0 (select (arr!16808 a!3118) j!142)))))

(declare-fun b!555422 () Bool)

(assert (=> b!555422 (= e!320127 (not true))))

(declare-fun lt!252403 () SeekEntryResult!5257)

(assert (=> b!555422 (and (= lt!252403 (Found!5257 j!142)) (or (undefined!6069 lt!252402) (not (is-Intermediate!5257 lt!252402)) (= (select (arr!16808 a!3118) (index!23257 lt!252402)) (select (arr!16808 a!3118) j!142)) (not (= (select (arr!16808 a!3118) (index!23257 lt!252402)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252403 (MissingZero!5257 (index!23257 lt!252402)))))))

(assert (=> b!555422 (= lt!252403 (seekEntryOrOpen!0 (select (arr!16808 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555422 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17288 0))(
  ( (Unit!17289) )
))
(declare-fun lt!252398 () Unit!17288)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17288)

(assert (=> b!555422 (= lt!252398 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50772 res!347826) b!555419))

(assert (= (and b!555419 res!347832) b!555421))

(assert (= (and b!555421 res!347833) b!555420))

(assert (= (and b!555420 res!347831) b!555415))

(assert (= (and b!555415 res!347829) b!555416))

(assert (= (and b!555416 res!347828) b!555414))

(assert (= (and b!555414 res!347827) b!555417))

(assert (= (and b!555417 res!347834) b!555418))

(assert (= (and b!555418 res!347830) b!555422))

(declare-fun m!533089 () Bool)

(assert (=> b!555422 m!533089))

(declare-fun m!533091 () Bool)

(assert (=> b!555422 m!533091))

(declare-fun m!533093 () Bool)

(assert (=> b!555422 m!533093))

(declare-fun m!533095 () Bool)

(assert (=> b!555422 m!533095))

(assert (=> b!555422 m!533091))

(declare-fun m!533097 () Bool)

(assert (=> b!555422 m!533097))

(declare-fun m!533099 () Bool)

(assert (=> b!555417 m!533099))

(assert (=> b!555421 m!533091))

(assert (=> b!555421 m!533091))

(declare-fun m!533101 () Bool)

(assert (=> b!555421 m!533101))

(declare-fun m!533103 () Bool)

(assert (=> b!555416 m!533103))

(declare-fun m!533105 () Bool)

(assert (=> start!50772 m!533105))

(declare-fun m!533107 () Bool)

(assert (=> start!50772 m!533107))

(declare-fun m!533109 () Bool)

(assert (=> b!555415 m!533109))

(declare-fun m!533111 () Bool)

(assert (=> b!555414 m!533111))

(assert (=> b!555418 m!533091))

(declare-fun m!533113 () Bool)

(assert (=> b!555418 m!533113))

(assert (=> b!555418 m!533091))

(declare-fun m!533115 () Bool)

(assert (=> b!555418 m!533115))

(declare-fun m!533117 () Bool)

(assert (=> b!555418 m!533117))

(assert (=> b!555418 m!533115))

(assert (=> b!555418 m!533091))

(declare-fun m!533119 () Bool)

(assert (=> b!555418 m!533119))

(declare-fun m!533121 () Bool)

(assert (=> b!555418 m!533121))

(assert (=> b!555418 m!533115))

(declare-fun m!533123 () Bool)

(assert (=> b!555418 m!533123))

(declare-fun m!533125 () Bool)

(assert (=> b!555420 m!533125))

(push 1)

(assert (not b!555414))

(assert (not b!555422))

(assert (not b!555417))

(assert (not b!555420))

(assert (not b!555415))

(assert (not b!555418))

(assert (not b!555416))

(assert (not b!555421))

