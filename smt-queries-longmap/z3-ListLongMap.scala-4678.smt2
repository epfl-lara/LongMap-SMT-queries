; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65108 () Bool)

(assert start!65108)

(declare-datatypes ((array!41298 0))(
  ( (array!41299 (arr!19763 (Array (_ BitVec 32) (_ BitVec 64))) (size!20184 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41298)

(declare-fun b!735138 () Bool)

(declare-datatypes ((SeekEntryResult!7360 0))(
  ( (MissingZero!7360 (index!31808 (_ BitVec 32))) (Found!7360 (index!31809 (_ BitVec 32))) (Intermediate!7360 (undefined!8172 Bool) (index!31810 (_ BitVec 32)) (x!62825 (_ BitVec 32))) (Undefined!7360) (MissingVacant!7360 (index!31811 (_ BitVec 32))) )
))
(declare-fun lt!325745 () SeekEntryResult!7360)

(declare-fun e!411298 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!325747 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41298 (_ BitVec 32)) SeekEntryResult!7360)

(assert (=> b!735138 (= e!411298 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325747 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325745)))))

(declare-fun b!735139 () Bool)

(declare-fun res!494040 () Bool)

(declare-fun e!411296 () Bool)

(assert (=> b!735139 (=> (not res!494040) (not e!411296))))

(declare-datatypes ((List!13804 0))(
  ( (Nil!13801) (Cons!13800 (h!14872 (_ BitVec 64)) (t!20110 List!13804)) )
))
(declare-fun arrayNoDuplicates!0 (array!41298 (_ BitVec 32) List!13804) Bool)

(assert (=> b!735139 (= res!494040 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13801))))

(declare-fun b!735140 () Bool)

(declare-fun res!494044 () Bool)

(declare-fun e!411301 () Bool)

(assert (=> b!735140 (=> (not res!494044) (not e!411301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735140 (= res!494044 (validKeyInArray!0 (select (arr!19763 a!3186) j!159)))))

(declare-fun b!735141 () Bool)

(declare-datatypes ((Unit!25016 0))(
  ( (Unit!25017) )
))
(declare-fun e!411299 () Unit!25016)

(declare-fun Unit!25018 () Unit!25016)

(assert (=> b!735141 (= e!411299 Unit!25018)))

(assert (=> b!735141 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325747 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325745)))

(declare-fun b!735142 () Bool)

(declare-fun res!494041 () Bool)

(assert (=> b!735142 (=> (not res!494041) (not e!411301))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735142 (= res!494041 (and (= (size!20184 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20184 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20184 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735143 () Bool)

(declare-fun e!411297 () Bool)

(declare-fun e!411303 () Bool)

(assert (=> b!735143 (= e!411297 e!411303)))

(declare-fun res!494033 () Bool)

(assert (=> b!735143 (=> (not res!494033) (not e!411303))))

(declare-fun lt!325754 () SeekEntryResult!7360)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41298 (_ BitVec 32)) SeekEntryResult!7360)

(assert (=> b!735143 (= res!494033 (= (seekEntryOrOpen!0 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325754))))

(assert (=> b!735143 (= lt!325754 (Found!7360 j!159))))

(declare-fun b!735144 () Bool)

(declare-fun res!494043 () Bool)

(declare-fun e!411295 () Bool)

(assert (=> b!735144 (=> (not res!494043) (not e!411295))))

(declare-fun e!411294 () Bool)

(assert (=> b!735144 (= res!494043 e!411294)))

(declare-fun c!80937 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735144 (= c!80937 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735145 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41298 (_ BitVec 32)) SeekEntryResult!7360)

(assert (=> b!735145 (= e!411294 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) (Found!7360 j!159)))))

(declare-fun b!735146 () Bool)

(declare-fun res!494030 () Bool)

(assert (=> b!735146 (=> (not res!494030) (not e!411295))))

(assert (=> b!735146 (= res!494030 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19763 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735147 () Bool)

(declare-fun res!494035 () Bool)

(assert (=> b!735147 (=> (not res!494035) (not e!411301))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!735147 (= res!494035 (validKeyInArray!0 k0!2102))))

(declare-fun b!735148 () Bool)

(declare-fun res!494045 () Bool)

(assert (=> b!735148 (=> (not res!494045) (not e!411296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41298 (_ BitVec 32)) Bool)

(assert (=> b!735148 (= res!494045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735149 () Bool)

(assert (=> b!735149 (= e!411301 e!411296)))

(declare-fun res!494032 () Bool)

(assert (=> b!735149 (=> (not res!494032) (not e!411296))))

(declare-fun lt!325755 () SeekEntryResult!7360)

(assert (=> b!735149 (= res!494032 (or (= lt!325755 (MissingZero!7360 i!1173)) (= lt!325755 (MissingVacant!7360 i!1173))))))

(assert (=> b!735149 (= lt!325755 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!494029 () Bool)

(assert (=> start!65108 (=> (not res!494029) (not e!411301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65108 (= res!494029 (validMask!0 mask!3328))))

(assert (=> start!65108 e!411301))

(assert (=> start!65108 true))

(declare-fun array_inv!15646 (array!41298) Bool)

(assert (=> start!65108 (array_inv!15646 a!3186)))

(declare-fun b!735150 () Bool)

(assert (=> b!735150 (= e!411294 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325745))))

(declare-fun b!735151 () Bool)

(declare-fun res!494039 () Bool)

(assert (=> b!735151 (=> (not res!494039) (not e!411301))))

(declare-fun arrayContainsKey!0 (array!41298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735151 (= res!494039 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735152 () Bool)

(declare-fun e!411302 () Bool)

(assert (=> b!735152 (= e!411302 true)))

(declare-fun lt!325746 () SeekEntryResult!7360)

(declare-fun lt!325757 () array!41298)

(declare-fun lt!325749 () (_ BitVec 64))

(assert (=> b!735152 (= lt!325746 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325747 lt!325749 lt!325757 mask!3328))))

(declare-fun b!735153 () Bool)

(assert (=> b!735153 (= e!411296 e!411295)))

(declare-fun res!494036 () Bool)

(assert (=> b!735153 (=> (not res!494036) (not e!411295))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735153 (= res!494036 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19763 a!3186) j!159) mask!3328) (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325745))))

(assert (=> b!735153 (= lt!325745 (Intermediate!7360 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735154 () Bool)

(declare-fun e!411304 () Bool)

(assert (=> b!735154 (= e!411295 e!411304)))

(declare-fun res!494042 () Bool)

(assert (=> b!735154 (=> (not res!494042) (not e!411304))))

(declare-fun lt!325756 () SeekEntryResult!7360)

(declare-fun lt!325751 () SeekEntryResult!7360)

(assert (=> b!735154 (= res!494042 (= lt!325756 lt!325751))))

(assert (=> b!735154 (= lt!325751 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325749 lt!325757 mask!3328))))

(assert (=> b!735154 (= lt!325756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325749 mask!3328) lt!325749 lt!325757 mask!3328))))

(assert (=> b!735154 (= lt!325749 (select (store (arr!19763 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735154 (= lt!325757 (array!41299 (store (arr!19763 a!3186) i!1173 k0!2102) (size!20184 a!3186)))))

(declare-fun b!735155 () Bool)

(declare-fun res!494037 () Bool)

(assert (=> b!735155 (=> (not res!494037) (not e!411296))))

(assert (=> b!735155 (= res!494037 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20184 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20184 a!3186))))))

(declare-fun b!735156 () Bool)

(assert (=> b!735156 (= e!411303 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325754))))

(declare-fun b!735157 () Bool)

(declare-fun res!494046 () Bool)

(assert (=> b!735157 (=> res!494046 e!411302)))

(assert (=> b!735157 (= res!494046 e!411298)))

(declare-fun c!80935 () Bool)

(declare-fun lt!325748 () Bool)

(assert (=> b!735157 (= c!80935 lt!325748)))

(declare-fun b!735158 () Bool)

(declare-fun Unit!25019 () Unit!25016)

(assert (=> b!735158 (= e!411299 Unit!25019)))

(declare-fun lt!325752 () SeekEntryResult!7360)

(assert (=> b!735158 (= lt!325752 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19763 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!325753 () SeekEntryResult!7360)

(assert (=> b!735158 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325747 resIntermediateIndex!5 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325753)))

(declare-fun b!735159 () Bool)

(assert (=> b!735159 (= e!411298 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325747 resIntermediateIndex!5 (select (arr!19763 a!3186) j!159) a!3186 mask!3328) lt!325753)))))

(declare-fun b!735160 () Bool)

(declare-fun e!411293 () Bool)

(assert (=> b!735160 (= e!411293 e!411302)))

(declare-fun res!494038 () Bool)

(assert (=> b!735160 (=> res!494038 e!411302)))

(assert (=> b!735160 (= res!494038 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!325747 #b00000000000000000000000000000000) (bvsge lt!325747 (size!20184 a!3186))))))

(declare-fun lt!325750 () Unit!25016)

(assert (=> b!735160 (= lt!325750 e!411299)))

(declare-fun c!80936 () Bool)

(assert (=> b!735160 (= c!80936 lt!325748)))

(assert (=> b!735160 (= lt!325748 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735160 (= lt!325747 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735161 () Bool)

(assert (=> b!735161 (= e!411304 (not e!411293))))

(declare-fun res!494034 () Bool)

(assert (=> b!735161 (=> res!494034 e!411293)))

(get-info :version)

(assert (=> b!735161 (= res!494034 (or (not ((_ is Intermediate!7360) lt!325751)) (bvsge x!1131 (x!62825 lt!325751))))))

(assert (=> b!735161 (= lt!325753 (Found!7360 j!159))))

(assert (=> b!735161 e!411297))

(declare-fun res!494031 () Bool)

(assert (=> b!735161 (=> (not res!494031) (not e!411297))))

(assert (=> b!735161 (= res!494031 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!325744 () Unit!25016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25016)

(assert (=> b!735161 (= lt!325744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65108 res!494029) b!735142))

(assert (= (and b!735142 res!494041) b!735140))

(assert (= (and b!735140 res!494044) b!735147))

(assert (= (and b!735147 res!494035) b!735151))

(assert (= (and b!735151 res!494039) b!735149))

(assert (= (and b!735149 res!494032) b!735148))

(assert (= (and b!735148 res!494045) b!735139))

(assert (= (and b!735139 res!494040) b!735155))

(assert (= (and b!735155 res!494037) b!735153))

(assert (= (and b!735153 res!494036) b!735146))

(assert (= (and b!735146 res!494030) b!735144))

(assert (= (and b!735144 c!80937) b!735150))

(assert (= (and b!735144 (not c!80937)) b!735145))

(assert (= (and b!735144 res!494043) b!735154))

(assert (= (and b!735154 res!494042) b!735161))

(assert (= (and b!735161 res!494031) b!735143))

(assert (= (and b!735143 res!494033) b!735156))

(assert (= (and b!735161 (not res!494034)) b!735160))

(assert (= (and b!735160 c!80936) b!735141))

(assert (= (and b!735160 (not c!80936)) b!735158))

(assert (= (and b!735160 (not res!494038)) b!735157))

(assert (= (and b!735157 c!80935) b!735138))

(assert (= (and b!735157 (not c!80935)) b!735159))

(assert (= (and b!735157 (not res!494046)) b!735152))

(declare-fun m!687023 () Bool)

(assert (=> b!735149 m!687023))

(declare-fun m!687025 () Bool)

(assert (=> b!735138 m!687025))

(assert (=> b!735138 m!687025))

(declare-fun m!687027 () Bool)

(assert (=> b!735138 m!687027))

(declare-fun m!687029 () Bool)

(assert (=> b!735139 m!687029))

(declare-fun m!687031 () Bool)

(assert (=> b!735161 m!687031))

(declare-fun m!687033 () Bool)

(assert (=> b!735161 m!687033))

(declare-fun m!687035 () Bool)

(assert (=> b!735152 m!687035))

(declare-fun m!687037 () Bool)

(assert (=> b!735154 m!687037))

(declare-fun m!687039 () Bool)

(assert (=> b!735154 m!687039))

(declare-fun m!687041 () Bool)

(assert (=> b!735154 m!687041))

(declare-fun m!687043 () Bool)

(assert (=> b!735154 m!687043))

(declare-fun m!687045 () Bool)

(assert (=> b!735154 m!687045))

(assert (=> b!735154 m!687039))

(assert (=> b!735158 m!687025))

(assert (=> b!735158 m!687025))

(declare-fun m!687047 () Bool)

(assert (=> b!735158 m!687047))

(assert (=> b!735158 m!687025))

(declare-fun m!687049 () Bool)

(assert (=> b!735158 m!687049))

(declare-fun m!687051 () Bool)

(assert (=> b!735151 m!687051))

(assert (=> b!735143 m!687025))

(assert (=> b!735143 m!687025))

(declare-fun m!687053 () Bool)

(assert (=> b!735143 m!687053))

(declare-fun m!687055 () Bool)

(assert (=> b!735147 m!687055))

(declare-fun m!687057 () Bool)

(assert (=> start!65108 m!687057))

(declare-fun m!687059 () Bool)

(assert (=> start!65108 m!687059))

(assert (=> b!735153 m!687025))

(assert (=> b!735153 m!687025))

(declare-fun m!687061 () Bool)

(assert (=> b!735153 m!687061))

(assert (=> b!735153 m!687061))

(assert (=> b!735153 m!687025))

(declare-fun m!687063 () Bool)

(assert (=> b!735153 m!687063))

(declare-fun m!687065 () Bool)

(assert (=> b!735146 m!687065))

(assert (=> b!735141 m!687025))

(assert (=> b!735141 m!687025))

(assert (=> b!735141 m!687027))

(assert (=> b!735156 m!687025))

(assert (=> b!735156 m!687025))

(declare-fun m!687067 () Bool)

(assert (=> b!735156 m!687067))

(assert (=> b!735145 m!687025))

(assert (=> b!735145 m!687025))

(assert (=> b!735145 m!687047))

(declare-fun m!687069 () Bool)

(assert (=> b!735148 m!687069))

(assert (=> b!735150 m!687025))

(assert (=> b!735150 m!687025))

(declare-fun m!687071 () Bool)

(assert (=> b!735150 m!687071))

(assert (=> b!735140 m!687025))

(assert (=> b!735140 m!687025))

(declare-fun m!687073 () Bool)

(assert (=> b!735140 m!687073))

(declare-fun m!687075 () Bool)

(assert (=> b!735160 m!687075))

(assert (=> b!735159 m!687025))

(assert (=> b!735159 m!687025))

(assert (=> b!735159 m!687049))

(check-sat (not b!735156) (not b!735152) (not b!735154) (not b!735149) (not b!735161) (not b!735141) (not b!735158) (not start!65108) (not b!735140) (not b!735147) (not b!735151) (not b!735145) (not b!735160) (not b!735159) (not b!735139) (not b!735153) (not b!735148) (not b!735143) (not b!735150) (not b!735138))
(check-sat)
