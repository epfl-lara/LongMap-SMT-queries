; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51476 () Bool)

(assert start!51476)

(declare-fun b!562927 () Bool)

(declare-fun e!324417 () Bool)

(declare-fun e!324420 () Bool)

(assert (=> b!562927 (= e!324417 e!324420)))

(declare-fun res!354085 () Bool)

(assert (=> b!562927 (=> (not res!354085) (not e!324420))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5420 0))(
  ( (MissingZero!5420 (index!23907 (_ BitVec 32))) (Found!5420 (index!23908 (_ BitVec 32))) (Intermediate!5420 (undefined!6232 Bool) (index!23909 (_ BitVec 32)) (x!52803 (_ BitVec 32))) (Undefined!5420) (MissingVacant!5420 (index!23910 (_ BitVec 32))) )
))
(declare-fun lt!256811 () SeekEntryResult!5420)

(declare-datatypes ((array!35341 0))(
  ( (array!35342 (arr!16971 (Array (_ BitVec 32) (_ BitVec 64))) (size!17335 (_ BitVec 32))) )
))
(declare-fun lt!256816 () array!35341)

(declare-fun lt!256814 () (_ BitVec 32))

(declare-fun lt!256807 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35341 (_ BitVec 32)) SeekEntryResult!5420)

(assert (=> b!562927 (= res!354085 (= lt!256811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256814 lt!256807 lt!256816 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!256815 () (_ BitVec 32))

(declare-fun a!3118 () array!35341)

(assert (=> b!562927 (= lt!256811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256815 (select (arr!16971 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562927 (= lt!256814 (toIndex!0 lt!256807 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562927 (= lt!256807 (select (store (arr!16971 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562927 (= lt!256815 (toIndex!0 (select (arr!16971 a!3118) j!142) mask!3119))))

(assert (=> b!562927 (= lt!256816 (array!35342 (store (arr!16971 a!3118) i!1132 k!1914) (size!17335 a!3118)))))

(declare-fun b!562928 () Bool)

(declare-fun e!324422 () Bool)

(declare-fun e!324418 () Bool)

(assert (=> b!562928 (= e!324422 e!324418)))

(declare-fun res!354089 () Bool)

(assert (=> b!562928 (=> res!354089 e!324418)))

(declare-fun lt!256818 () (_ BitVec 64))

(assert (=> b!562928 (= res!354089 (or (= lt!256818 (select (arr!16971 a!3118) j!142)) (= lt!256818 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562928 (= lt!256818 (select (arr!16971 a!3118) (index!23909 lt!256811)))))

(declare-fun b!562929 () Bool)

(declare-fun res!354087 () Bool)

(assert (=> b!562929 (=> (not res!354087) (not e!324417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35341 (_ BitVec 32)) Bool)

(assert (=> b!562929 (= res!354087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562930 () Bool)

(declare-fun res!354083 () Bool)

(declare-fun e!324423 () Bool)

(assert (=> b!562930 (=> (not res!354083) (not e!324423))))

(declare-fun arrayContainsKey!0 (array!35341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562930 (= res!354083 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562931 () Bool)

(declare-fun res!354088 () Bool)

(assert (=> b!562931 (=> (not res!354088) (not e!324423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562931 (= res!354088 (validKeyInArray!0 k!1914))))

(declare-fun b!562932 () Bool)

(assert (=> b!562932 (= e!324420 (not e!324422))))

(declare-fun res!354081 () Bool)

(assert (=> b!562932 (=> res!354081 e!324422)))

(assert (=> b!562932 (= res!354081 (or (undefined!6232 lt!256811) (not (is-Intermediate!5420 lt!256811))))))

(declare-fun lt!256809 () SeekEntryResult!5420)

(declare-fun lt!256819 () SeekEntryResult!5420)

(assert (=> b!562932 (= lt!256809 lt!256819)))

(assert (=> b!562932 (= lt!256819 (Found!5420 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35341 (_ BitVec 32)) SeekEntryResult!5420)

(assert (=> b!562932 (= lt!256809 (seekEntryOrOpen!0 (select (arr!16971 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562932 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17614 0))(
  ( (Unit!17615) )
))
(declare-fun lt!256812 () Unit!17614)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17614)

(assert (=> b!562932 (= lt!256812 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562933 () Bool)

(declare-fun e!324419 () Bool)

(assert (=> b!562933 (= e!324419 (bvsge mask!3119 #b00000000000000000000000000000000))))

(declare-fun lt!256810 () SeekEntryResult!5420)

(declare-fun lt!256806 () SeekEntryResult!5420)

(assert (=> b!562933 (= lt!256810 lt!256806)))

(declare-fun lt!256813 () Unit!17614)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17614)

(assert (=> b!562933 (= lt!256813 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52803 lt!256811) (index!23909 lt!256811) (index!23909 lt!256811) mask!3119))))

(declare-fun b!562934 () Bool)

(declare-fun res!354082 () Bool)

(assert (=> b!562934 (=> (not res!354082) (not e!324423))))

(assert (=> b!562934 (= res!354082 (validKeyInArray!0 (select (arr!16971 a!3118) j!142)))))

(declare-fun b!562935 () Bool)

(assert (=> b!562935 (= e!324423 e!324417)))

(declare-fun res!354079 () Bool)

(assert (=> b!562935 (=> (not res!354079) (not e!324417))))

(declare-fun lt!256808 () SeekEntryResult!5420)

(assert (=> b!562935 (= res!354079 (or (= lt!256808 (MissingZero!5420 i!1132)) (= lt!256808 (MissingVacant!5420 i!1132))))))

(assert (=> b!562935 (= lt!256808 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562926 () Bool)

(declare-fun res!354084 () Bool)

(assert (=> b!562926 (=> (not res!354084) (not e!324417))))

(declare-datatypes ((List!11051 0))(
  ( (Nil!11048) (Cons!11047 (h!12050 (_ BitVec 64)) (t!17279 List!11051)) )
))
(declare-fun arrayNoDuplicates!0 (array!35341 (_ BitVec 32) List!11051) Bool)

(assert (=> b!562926 (= res!354084 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11048))))

(declare-fun res!354080 () Bool)

(assert (=> start!51476 (=> (not res!354080) (not e!324423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51476 (= res!354080 (validMask!0 mask!3119))))

(assert (=> start!51476 e!324423))

(assert (=> start!51476 true))

(declare-fun array_inv!12767 (array!35341) Bool)

(assert (=> start!51476 (array_inv!12767 a!3118)))

(declare-fun b!562936 () Bool)

(declare-fun res!354086 () Bool)

(assert (=> b!562936 (=> (not res!354086) (not e!324423))))

(assert (=> b!562936 (= res!354086 (and (= (size!17335 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17335 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17335 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562937 () Bool)

(assert (=> b!562937 (= e!324418 e!324419)))

(declare-fun res!354078 () Bool)

(assert (=> b!562937 (=> res!354078 e!324419)))

(assert (=> b!562937 (= res!354078 (or (bvslt (index!23909 lt!256811) #b00000000000000000000000000000000) (bvsge (index!23909 lt!256811) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52803 lt!256811) #b01111111111111111111111111111110) (bvslt (x!52803 lt!256811) #b00000000000000000000000000000000) (not (= lt!256818 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16971 a!3118) i!1132 k!1914) (index!23909 lt!256811)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256810 lt!256819))))))

(declare-fun lt!256817 () SeekEntryResult!5420)

(assert (=> b!562937 (= lt!256817 lt!256806)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35341 (_ BitVec 32)) SeekEntryResult!5420)

(assert (=> b!562937 (= lt!256806 (seekKeyOrZeroReturnVacant!0 (x!52803 lt!256811) (index!23909 lt!256811) (index!23909 lt!256811) lt!256807 lt!256816 mask!3119))))

(assert (=> b!562937 (= lt!256817 (seekEntryOrOpen!0 lt!256807 lt!256816 mask!3119))))

(assert (=> b!562937 (= lt!256809 lt!256810)))

(assert (=> b!562937 (= lt!256810 (seekKeyOrZeroReturnVacant!0 (x!52803 lt!256811) (index!23909 lt!256811) (index!23909 lt!256811) (select (arr!16971 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and start!51476 res!354080) b!562936))

(assert (= (and b!562936 res!354086) b!562934))

(assert (= (and b!562934 res!354082) b!562931))

(assert (= (and b!562931 res!354088) b!562930))

(assert (= (and b!562930 res!354083) b!562935))

(assert (= (and b!562935 res!354079) b!562929))

(assert (= (and b!562929 res!354087) b!562926))

(assert (= (and b!562926 res!354084) b!562927))

(assert (= (and b!562927 res!354085) b!562932))

(assert (= (and b!562932 (not res!354081)) b!562928))

(assert (= (and b!562928 (not res!354089)) b!562937))

(assert (= (and b!562937 (not res!354078)) b!562933))

(declare-fun m!541125 () Bool)

(assert (=> b!562929 m!541125))

(declare-fun m!541127 () Bool)

(assert (=> b!562935 m!541127))

(declare-fun m!541129 () Bool)

(assert (=> b!562930 m!541129))

(declare-fun m!541131 () Bool)

(assert (=> b!562931 m!541131))

(declare-fun m!541133 () Bool)

(assert (=> b!562933 m!541133))

(declare-fun m!541135 () Bool)

(assert (=> b!562926 m!541135))

(declare-fun m!541137 () Bool)

(assert (=> b!562937 m!541137))

(declare-fun m!541139 () Bool)

(assert (=> b!562937 m!541139))

(declare-fun m!541141 () Bool)

(assert (=> b!562937 m!541141))

(declare-fun m!541143 () Bool)

(assert (=> b!562937 m!541143))

(assert (=> b!562937 m!541139))

(declare-fun m!541145 () Bool)

(assert (=> b!562937 m!541145))

(declare-fun m!541147 () Bool)

(assert (=> b!562937 m!541147))

(declare-fun m!541149 () Bool)

(assert (=> start!51476 m!541149))

(declare-fun m!541151 () Bool)

(assert (=> start!51476 m!541151))

(assert (=> b!562928 m!541139))

(declare-fun m!541153 () Bool)

(assert (=> b!562928 m!541153))

(assert (=> b!562932 m!541139))

(assert (=> b!562932 m!541139))

(declare-fun m!541155 () Bool)

(assert (=> b!562932 m!541155))

(declare-fun m!541157 () Bool)

(assert (=> b!562932 m!541157))

(declare-fun m!541159 () Bool)

(assert (=> b!562932 m!541159))

(assert (=> b!562927 m!541139))

(declare-fun m!541161 () Bool)

(assert (=> b!562927 m!541161))

(assert (=> b!562927 m!541139))

(declare-fun m!541163 () Bool)

(assert (=> b!562927 m!541163))

(assert (=> b!562927 m!541139))

(declare-fun m!541165 () Bool)

(assert (=> b!562927 m!541165))

(declare-fun m!541167 () Bool)

(assert (=> b!562927 m!541167))

(declare-fun m!541169 () Bool)

(assert (=> b!562927 m!541169))

(assert (=> b!562927 m!541141))

(assert (=> b!562934 m!541139))

(assert (=> b!562934 m!541139))

(declare-fun m!541171 () Bool)

(assert (=> b!562934 m!541171))

(push 1)

