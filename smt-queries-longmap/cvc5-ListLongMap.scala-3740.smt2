; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51434 () Bool)

(assert start!51434)

(declare-fun e!323960 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5399 0))(
  ( (MissingZero!5399 (index!23823 (_ BitVec 32))) (Found!5399 (index!23824 (_ BitVec 32))) (Intermediate!5399 (undefined!6211 Bool) (index!23825 (_ BitVec 32)) (x!52726 (_ BitVec 32))) (Undefined!5399) (MissingVacant!5399 (index!23826 (_ BitVec 32))) )
))
(declare-fun lt!256005 () SeekEntryResult!5399)

(declare-fun b!562154 () Bool)

(declare-datatypes ((array!35299 0))(
  ( (array!35300 (arr!16950 (Array (_ BitVec 32) (_ BitVec 64))) (size!17314 (_ BitVec 32))) )
))
(declare-fun lt!256007 () array!35299)

(declare-fun lt!256006 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35299 (_ BitVec 32)) SeekEntryResult!5399)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35299 (_ BitVec 32)) SeekEntryResult!5399)

(assert (=> b!562154 (= e!323960 (= (seekEntryOrOpen!0 lt!256006 lt!256007 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52726 lt!256005) (index!23825 lt!256005) (index!23825 lt!256005) lt!256006 lt!256007 mask!3119)))))

(declare-fun b!562155 () Bool)

(declare-fun res!353310 () Bool)

(declare-fun e!323961 () Bool)

(assert (=> b!562155 (=> (not res!353310) (not e!323961))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562155 (= res!353310 (validKeyInArray!0 k!1914))))

(declare-fun b!562157 () Bool)

(declare-fun res!353317 () Bool)

(assert (=> b!562157 (=> (not res!353317) (not e!323961))))

(declare-fun a!3118 () array!35299)

(declare-fun arrayContainsKey!0 (array!35299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562157 (= res!353317 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562158 () Bool)

(declare-fun e!323962 () Bool)

(assert (=> b!562158 (= e!323962 e!323960)))

(declare-fun res!353316 () Bool)

(assert (=> b!562158 (=> (not res!353316) (not e!323960))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!256009 () SeekEntryResult!5399)

(assert (=> b!562158 (= res!353316 (= lt!256009 (seekKeyOrZeroReturnVacant!0 (x!52726 lt!256005) (index!23825 lt!256005) (index!23825 lt!256005) (select (arr!16950 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562159 () Bool)

(declare-fun res!353309 () Bool)

(assert (=> b!562159 (=> (not res!353309) (not e!323961))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562159 (= res!353309 (and (= (size!17314 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17314 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17314 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562160 () Bool)

(declare-fun e!323966 () Bool)

(assert (=> b!562160 (= e!323966 e!323962)))

(declare-fun res!353307 () Bool)

(assert (=> b!562160 (=> res!353307 e!323962)))

(declare-fun lt!256011 () (_ BitVec 64))

(assert (=> b!562160 (= res!353307 (or (= lt!256011 (select (arr!16950 a!3118) j!142)) (= lt!256011 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562160 (= lt!256011 (select (arr!16950 a!3118) (index!23825 lt!256005)))))

(declare-fun b!562161 () Bool)

(declare-fun e!323964 () Bool)

(assert (=> b!562161 (= e!323961 e!323964)))

(declare-fun res!353314 () Bool)

(assert (=> b!562161 (=> (not res!353314) (not e!323964))))

(declare-fun lt!256012 () SeekEntryResult!5399)

(assert (=> b!562161 (= res!353314 (or (= lt!256012 (MissingZero!5399 i!1132)) (= lt!256012 (MissingVacant!5399 i!1132))))))

(assert (=> b!562161 (= lt!256012 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562162 () Bool)

(declare-fun res!353306 () Bool)

(assert (=> b!562162 (=> (not res!353306) (not e!323964))))

(declare-datatypes ((List!11030 0))(
  ( (Nil!11027) (Cons!11026 (h!12029 (_ BitVec 64)) (t!17258 List!11030)) )
))
(declare-fun arrayNoDuplicates!0 (array!35299 (_ BitVec 32) List!11030) Bool)

(assert (=> b!562162 (= res!353306 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11027))))

(declare-fun b!562163 () Bool)

(declare-fun res!353313 () Bool)

(assert (=> b!562163 (=> (not res!353313) (not e!323964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35299 (_ BitVec 32)) Bool)

(assert (=> b!562163 (= res!353313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562164 () Bool)

(declare-fun e!323965 () Bool)

(assert (=> b!562164 (= e!323965 (not true))))

(declare-fun e!323963 () Bool)

(assert (=> b!562164 e!323963))

(declare-fun res!353311 () Bool)

(assert (=> b!562164 (=> (not res!353311) (not e!323963))))

(assert (=> b!562164 (= res!353311 (= lt!256009 (Found!5399 j!142)))))

(assert (=> b!562164 (= lt!256009 (seekEntryOrOpen!0 (select (arr!16950 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562164 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17572 0))(
  ( (Unit!17573) )
))
(declare-fun lt!256008 () Unit!17572)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17572)

(assert (=> b!562164 (= lt!256008 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!353308 () Bool)

(assert (=> start!51434 (=> (not res!353308) (not e!323961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51434 (= res!353308 (validMask!0 mask!3119))))

(assert (=> start!51434 e!323961))

(assert (=> start!51434 true))

(declare-fun array_inv!12746 (array!35299) Bool)

(assert (=> start!51434 (array_inv!12746 a!3118)))

(declare-fun b!562156 () Bool)

(declare-fun res!353315 () Bool)

(assert (=> b!562156 (=> (not res!353315) (not e!323961))))

(assert (=> b!562156 (= res!353315 (validKeyInArray!0 (select (arr!16950 a!3118) j!142)))))

(declare-fun b!562165 () Bool)

(assert (=> b!562165 (= e!323964 e!323965)))

(declare-fun res!353318 () Bool)

(assert (=> b!562165 (=> (not res!353318) (not e!323965))))

(declare-fun lt!256004 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35299 (_ BitVec 32)) SeekEntryResult!5399)

(assert (=> b!562165 (= res!353318 (= lt!256005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256004 lt!256006 lt!256007 mask!3119)))))

(declare-fun lt!256010 () (_ BitVec 32))

(assert (=> b!562165 (= lt!256005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256010 (select (arr!16950 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562165 (= lt!256004 (toIndex!0 lt!256006 mask!3119))))

(assert (=> b!562165 (= lt!256006 (select (store (arr!16950 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562165 (= lt!256010 (toIndex!0 (select (arr!16950 a!3118) j!142) mask!3119))))

(assert (=> b!562165 (= lt!256007 (array!35300 (store (arr!16950 a!3118) i!1132 k!1914) (size!17314 a!3118)))))

(declare-fun b!562166 () Bool)

(assert (=> b!562166 (= e!323963 e!323966)))

(declare-fun res!353312 () Bool)

(assert (=> b!562166 (=> res!353312 e!323966)))

(assert (=> b!562166 (= res!353312 (or (undefined!6211 lt!256005) (not (is-Intermediate!5399 lt!256005))))))

(assert (= (and start!51434 res!353308) b!562159))

(assert (= (and b!562159 res!353309) b!562156))

(assert (= (and b!562156 res!353315) b!562155))

(assert (= (and b!562155 res!353310) b!562157))

(assert (= (and b!562157 res!353317) b!562161))

(assert (= (and b!562161 res!353314) b!562163))

(assert (= (and b!562163 res!353313) b!562162))

(assert (= (and b!562162 res!353306) b!562165))

(assert (= (and b!562165 res!353318) b!562164))

(assert (= (and b!562164 res!353311) b!562166))

(assert (= (and b!562166 (not res!353312)) b!562160))

(assert (= (and b!562160 (not res!353307)) b!562158))

(assert (= (and b!562158 res!353316) b!562154))

(declare-fun m!540141 () Bool)

(assert (=> b!562157 m!540141))

(declare-fun m!540143 () Bool)

(assert (=> b!562162 m!540143))

(declare-fun m!540145 () Bool)

(assert (=> start!51434 m!540145))

(declare-fun m!540147 () Bool)

(assert (=> start!51434 m!540147))

(declare-fun m!540149 () Bool)

(assert (=> b!562158 m!540149))

(assert (=> b!562158 m!540149))

(declare-fun m!540151 () Bool)

(assert (=> b!562158 m!540151))

(declare-fun m!540153 () Bool)

(assert (=> b!562161 m!540153))

(assert (=> b!562164 m!540149))

(assert (=> b!562164 m!540149))

(declare-fun m!540155 () Bool)

(assert (=> b!562164 m!540155))

(declare-fun m!540157 () Bool)

(assert (=> b!562164 m!540157))

(declare-fun m!540159 () Bool)

(assert (=> b!562164 m!540159))

(declare-fun m!540161 () Bool)

(assert (=> b!562154 m!540161))

(declare-fun m!540163 () Bool)

(assert (=> b!562154 m!540163))

(assert (=> b!562160 m!540149))

(declare-fun m!540165 () Bool)

(assert (=> b!562160 m!540165))

(assert (=> b!562165 m!540149))

(declare-fun m!540167 () Bool)

(assert (=> b!562165 m!540167))

(assert (=> b!562165 m!540149))

(declare-fun m!540169 () Bool)

(assert (=> b!562165 m!540169))

(assert (=> b!562165 m!540149))

(declare-fun m!540171 () Bool)

(assert (=> b!562165 m!540171))

(declare-fun m!540173 () Bool)

(assert (=> b!562165 m!540173))

(declare-fun m!540175 () Bool)

(assert (=> b!562165 m!540175))

(declare-fun m!540177 () Bool)

(assert (=> b!562165 m!540177))

(assert (=> b!562156 m!540149))

(assert (=> b!562156 m!540149))

(declare-fun m!540179 () Bool)

(assert (=> b!562156 m!540179))

(declare-fun m!540181 () Bool)

(assert (=> b!562155 m!540181))

(declare-fun m!540183 () Bool)

(assert (=> b!562163 m!540183))

(push 1)

