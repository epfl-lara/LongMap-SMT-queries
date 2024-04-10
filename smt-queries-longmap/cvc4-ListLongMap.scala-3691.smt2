; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50766 () Bool)

(assert start!50766)

(declare-fun b!555333 () Bool)

(declare-fun res!347748 () Bool)

(declare-fun e!320089 () Bool)

(assert (=> b!555333 (=> (not res!347748) (not e!320089))))

(declare-datatypes ((array!34991 0))(
  ( (array!34992 (arr!16805 (Array (_ BitVec 32) (_ BitVec 64))) (size!17169 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34991)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555333 (= res!347748 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555334 () Bool)

(declare-fun e!320088 () Bool)

(assert (=> b!555334 (= e!320089 e!320088)))

(declare-fun res!347750 () Bool)

(assert (=> b!555334 (=> (not res!347750) (not e!320088))))

(declare-datatypes ((SeekEntryResult!5254 0))(
  ( (MissingZero!5254 (index!23243 (_ BitVec 32))) (Found!5254 (index!23244 (_ BitVec 32))) (Intermediate!5254 (undefined!6066 Bool) (index!23245 (_ BitVec 32)) (x!52144 (_ BitVec 32))) (Undefined!5254) (MissingVacant!5254 (index!23246 (_ BitVec 32))) )
))
(declare-fun lt!252345 () SeekEntryResult!5254)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555334 (= res!347750 (or (= lt!252345 (MissingZero!5254 i!1132)) (= lt!252345 (MissingVacant!5254 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34991 (_ BitVec 32)) SeekEntryResult!5254)

(assert (=> b!555334 (= lt!252345 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!347749 () Bool)

(assert (=> start!50766 (=> (not res!347749) (not e!320089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50766 (= res!347749 (validMask!0 mask!3119))))

(assert (=> start!50766 e!320089))

(assert (=> start!50766 true))

(declare-fun array_inv!12601 (array!34991) Bool)

(assert (=> start!50766 (array_inv!12601 a!3118)))

(declare-fun b!555335 () Bool)

(declare-fun e!320090 () Bool)

(assert (=> b!555335 (= e!320088 e!320090)))

(declare-fun res!347746 () Bool)

(assert (=> b!555335 (=> (not res!347746) (not e!320090))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252344 () (_ BitVec 32))

(declare-fun lt!252349 () SeekEntryResult!5254)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34991 (_ BitVec 32)) SeekEntryResult!5254)

(assert (=> b!555335 (= res!347746 (= lt!252349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252344 (select (store (arr!16805 a!3118) i!1132 k!1914) j!142) (array!34992 (store (arr!16805 a!3118) i!1132 k!1914) (size!17169 a!3118)) mask!3119)))))

(declare-fun lt!252346 () (_ BitVec 32))

(assert (=> b!555335 (= lt!252349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252346 (select (arr!16805 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555335 (= lt!252344 (toIndex!0 (select (store (arr!16805 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555335 (= lt!252346 (toIndex!0 (select (arr!16805 a!3118) j!142) mask!3119))))

(declare-fun b!555336 () Bool)

(declare-fun res!347751 () Bool)

(assert (=> b!555336 (=> (not res!347751) (not e!320089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555336 (= res!347751 (validKeyInArray!0 (select (arr!16805 a!3118) j!142)))))

(declare-fun b!555337 () Bool)

(declare-fun res!347745 () Bool)

(assert (=> b!555337 (=> (not res!347745) (not e!320088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34991 (_ BitVec 32)) Bool)

(assert (=> b!555337 (= res!347745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555338 () Bool)

(declare-fun res!347753 () Bool)

(assert (=> b!555338 (=> (not res!347753) (not e!320088))))

(declare-datatypes ((List!10885 0))(
  ( (Nil!10882) (Cons!10881 (h!11866 (_ BitVec 64)) (t!17113 List!10885)) )
))
(declare-fun arrayNoDuplicates!0 (array!34991 (_ BitVec 32) List!10885) Bool)

(assert (=> b!555338 (= res!347753 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10882))))

(declare-fun b!555339 () Bool)

(declare-fun res!347752 () Bool)

(assert (=> b!555339 (=> (not res!347752) (not e!320089))))

(assert (=> b!555339 (= res!347752 (validKeyInArray!0 k!1914))))

(declare-fun b!555340 () Bool)

(assert (=> b!555340 (= e!320090 (not true))))

(declare-fun lt!252348 () SeekEntryResult!5254)

(assert (=> b!555340 (and (= lt!252348 (Found!5254 j!142)) (or (undefined!6066 lt!252349) (not (is-Intermediate!5254 lt!252349)) (= (select (arr!16805 a!3118) (index!23245 lt!252349)) (select (arr!16805 a!3118) j!142)) (not (= (select (arr!16805 a!3118) (index!23245 lt!252349)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252348 (MissingZero!5254 (index!23245 lt!252349)))))))

(assert (=> b!555340 (= lt!252348 (seekEntryOrOpen!0 (select (arr!16805 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555340 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17282 0))(
  ( (Unit!17283) )
))
(declare-fun lt!252347 () Unit!17282)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34991 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17282)

(assert (=> b!555340 (= lt!252347 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555341 () Bool)

(declare-fun res!347747 () Bool)

(assert (=> b!555341 (=> (not res!347747) (not e!320089))))

(assert (=> b!555341 (= res!347747 (and (= (size!17169 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17169 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17169 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50766 res!347749) b!555341))

(assert (= (and b!555341 res!347747) b!555336))

(assert (= (and b!555336 res!347751) b!555339))

(assert (= (and b!555339 res!347752) b!555333))

(assert (= (and b!555333 res!347748) b!555334))

(assert (= (and b!555334 res!347750) b!555337))

(assert (= (and b!555337 res!347745) b!555338))

(assert (= (and b!555338 res!347753) b!555335))

(assert (= (and b!555335 res!347746) b!555340))

(declare-fun m!532975 () Bool)

(assert (=> b!555338 m!532975))

(declare-fun m!532977 () Bool)

(assert (=> b!555340 m!532977))

(declare-fun m!532979 () Bool)

(assert (=> b!555340 m!532979))

(declare-fun m!532981 () Bool)

(assert (=> b!555340 m!532981))

(declare-fun m!532983 () Bool)

(assert (=> b!555340 m!532983))

(assert (=> b!555340 m!532979))

(declare-fun m!532985 () Bool)

(assert (=> b!555340 m!532985))

(declare-fun m!532987 () Bool)

(assert (=> start!50766 m!532987))

(declare-fun m!532989 () Bool)

(assert (=> start!50766 m!532989))

(declare-fun m!532991 () Bool)

(assert (=> b!555339 m!532991))

(assert (=> b!555336 m!532979))

(assert (=> b!555336 m!532979))

(declare-fun m!532993 () Bool)

(assert (=> b!555336 m!532993))

(declare-fun m!532995 () Bool)

(assert (=> b!555333 m!532995))

(assert (=> b!555335 m!532979))

(declare-fun m!532997 () Bool)

(assert (=> b!555335 m!532997))

(assert (=> b!555335 m!532997))

(declare-fun m!532999 () Bool)

(assert (=> b!555335 m!532999))

(declare-fun m!533001 () Bool)

(assert (=> b!555335 m!533001))

(assert (=> b!555335 m!532997))

(declare-fun m!533003 () Bool)

(assert (=> b!555335 m!533003))

(assert (=> b!555335 m!532979))

(declare-fun m!533005 () Bool)

(assert (=> b!555335 m!533005))

(assert (=> b!555335 m!532979))

(declare-fun m!533007 () Bool)

(assert (=> b!555335 m!533007))

(declare-fun m!533009 () Bool)

(assert (=> b!555334 m!533009))

(declare-fun m!533011 () Bool)

(assert (=> b!555337 m!533011))

(push 1)

