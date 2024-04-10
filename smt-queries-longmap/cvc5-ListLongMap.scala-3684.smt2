; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50720 () Bool)

(assert start!50720)

(declare-fun b!554712 () Bool)

(declare-fun res!347127 () Bool)

(declare-fun e!319814 () Bool)

(assert (=> b!554712 (=> (not res!347127) (not e!319814))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554712 (= res!347127 (validKeyInArray!0 k!1914))))

(declare-fun b!554713 () Bool)

(declare-fun res!347125 () Bool)

(assert (=> b!554713 (=> (not res!347125) (not e!319814))))

(declare-datatypes ((array!34945 0))(
  ( (array!34946 (arr!16782 (Array (_ BitVec 32) (_ BitVec 64))) (size!17146 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34945)

(declare-fun arrayContainsKey!0 (array!34945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554713 (= res!347125 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554714 () Bool)

(declare-fun e!319815 () Bool)

(assert (=> b!554714 (= e!319814 e!319815)))

(declare-fun res!347128 () Bool)

(assert (=> b!554714 (=> (not res!347128) (not e!319815))))

(declare-datatypes ((SeekEntryResult!5231 0))(
  ( (MissingZero!5231 (index!23151 (_ BitVec 32))) (Found!5231 (index!23152 (_ BitVec 32))) (Intermediate!5231 (undefined!6043 Bool) (index!23153 (_ BitVec 32)) (x!52065 (_ BitVec 32))) (Undefined!5231) (MissingVacant!5231 (index!23154 (_ BitVec 32))) )
))
(declare-fun lt!251935 () SeekEntryResult!5231)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554714 (= res!347128 (or (= lt!251935 (MissingZero!5231 i!1132)) (= lt!251935 (MissingVacant!5231 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34945 (_ BitVec 32)) SeekEntryResult!5231)

(assert (=> b!554714 (= lt!251935 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554715 () Bool)

(declare-fun res!347124 () Bool)

(assert (=> b!554715 (=> (not res!347124) (not e!319814))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!554715 (= res!347124 (and (= (size!17146 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17146 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17146 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554716 () Bool)

(declare-fun res!347131 () Bool)

(assert (=> b!554716 (=> (not res!347131) (not e!319815))))

(declare-datatypes ((List!10862 0))(
  ( (Nil!10859) (Cons!10858 (h!11843 (_ BitVec 64)) (t!17090 List!10862)) )
))
(declare-fun arrayNoDuplicates!0 (array!34945 (_ BitVec 32) List!10862) Bool)

(assert (=> b!554716 (= res!347131 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10859))))

(declare-fun res!347132 () Bool)

(assert (=> start!50720 (=> (not res!347132) (not e!319814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50720 (= res!347132 (validMask!0 mask!3119))))

(assert (=> start!50720 e!319814))

(assert (=> start!50720 true))

(declare-fun array_inv!12578 (array!34945) Bool)

(assert (=> start!50720 (array_inv!12578 a!3118)))

(declare-fun b!554717 () Bool)

(declare-fun e!319812 () Bool)

(assert (=> b!554717 (= e!319815 e!319812)))

(declare-fun res!347130 () Bool)

(assert (=> b!554717 (=> (not res!347130) (not e!319812))))

(declare-fun lt!251930 () (_ BitVec 32))

(declare-fun lt!251934 () SeekEntryResult!5231)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34945 (_ BitVec 32)) SeekEntryResult!5231)

(assert (=> b!554717 (= res!347130 (= lt!251934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251930 (select (store (arr!16782 a!3118) i!1132 k!1914) j!142) (array!34946 (store (arr!16782 a!3118) i!1132 k!1914) (size!17146 a!3118)) mask!3119)))))

(declare-fun lt!251931 () (_ BitVec 32))

(assert (=> b!554717 (= lt!251934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251931 (select (arr!16782 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554717 (= lt!251930 (toIndex!0 (select (store (arr!16782 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554717 (= lt!251931 (toIndex!0 (select (arr!16782 a!3118) j!142) mask!3119))))

(declare-fun b!554718 () Bool)

(declare-fun res!347126 () Bool)

(assert (=> b!554718 (=> (not res!347126) (not e!319815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34945 (_ BitVec 32)) Bool)

(assert (=> b!554718 (= res!347126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554719 () Bool)

(declare-fun res!347129 () Bool)

(assert (=> b!554719 (=> (not res!347129) (not e!319814))))

(assert (=> b!554719 (= res!347129 (validKeyInArray!0 (select (arr!16782 a!3118) j!142)))))

(declare-fun b!554720 () Bool)

(assert (=> b!554720 (= e!319812 (not true))))

(declare-fun lt!251932 () SeekEntryResult!5231)

(assert (=> b!554720 (and (= lt!251932 (Found!5231 j!142)) (or (undefined!6043 lt!251934) (not (is-Intermediate!5231 lt!251934)) (= (select (arr!16782 a!3118) (index!23153 lt!251934)) (select (arr!16782 a!3118) j!142)) (not (= (select (arr!16782 a!3118) (index!23153 lt!251934)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251932 (MissingZero!5231 (index!23153 lt!251934)))))))

(assert (=> b!554720 (= lt!251932 (seekEntryOrOpen!0 (select (arr!16782 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554720 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17236 0))(
  ( (Unit!17237) )
))
(declare-fun lt!251933 () Unit!17236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17236)

(assert (=> b!554720 (= lt!251933 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50720 res!347132) b!554715))

(assert (= (and b!554715 res!347124) b!554719))

(assert (= (and b!554719 res!347129) b!554712))

(assert (= (and b!554712 res!347127) b!554713))

(assert (= (and b!554713 res!347125) b!554714))

(assert (= (and b!554714 res!347128) b!554718))

(assert (= (and b!554718 res!347126) b!554716))

(assert (= (and b!554716 res!347131) b!554717))

(assert (= (and b!554717 res!347130) b!554720))

(declare-fun m!532101 () Bool)

(assert (=> b!554717 m!532101))

(declare-fun m!532103 () Bool)

(assert (=> b!554717 m!532103))

(declare-fun m!532105 () Bool)

(assert (=> b!554717 m!532105))

(declare-fun m!532107 () Bool)

(assert (=> b!554717 m!532107))

(assert (=> b!554717 m!532101))

(assert (=> b!554717 m!532105))

(assert (=> b!554717 m!532101))

(declare-fun m!532109 () Bool)

(assert (=> b!554717 m!532109))

(declare-fun m!532111 () Bool)

(assert (=> b!554717 m!532111))

(assert (=> b!554717 m!532105))

(declare-fun m!532113 () Bool)

(assert (=> b!554717 m!532113))

(declare-fun m!532115 () Bool)

(assert (=> start!50720 m!532115))

(declare-fun m!532117 () Bool)

(assert (=> start!50720 m!532117))

(declare-fun m!532119 () Bool)

(assert (=> b!554716 m!532119))

(declare-fun m!532121 () Bool)

(assert (=> b!554714 m!532121))

(declare-fun m!532123 () Bool)

(assert (=> b!554713 m!532123))

(declare-fun m!532125 () Bool)

(assert (=> b!554712 m!532125))

(declare-fun m!532127 () Bool)

(assert (=> b!554718 m!532127))

(assert (=> b!554719 m!532101))

(assert (=> b!554719 m!532101))

(declare-fun m!532129 () Bool)

(assert (=> b!554719 m!532129))

(assert (=> b!554720 m!532101))

(declare-fun m!532131 () Bool)

(assert (=> b!554720 m!532131))

(declare-fun m!532133 () Bool)

(assert (=> b!554720 m!532133))

(declare-fun m!532135 () Bool)

(assert (=> b!554720 m!532135))

(assert (=> b!554720 m!532101))

(declare-fun m!532137 () Bool)

(assert (=> b!554720 m!532137))

(push 1)

