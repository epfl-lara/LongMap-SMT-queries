; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65256 () Bool)

(assert start!65256)

(declare-fun b!736133 () Bool)

(declare-fun res!494454 () Bool)

(declare-fun e!411935 () Bool)

(assert (=> b!736133 (=> (not res!494454) (not e!411935))))

(declare-datatypes ((array!41299 0))(
  ( (array!41300 (arr!19759 (Array (_ BitVec 32) (_ BitVec 64))) (size!20179 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41299)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736133 (= res!494454 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736134 () Bool)

(declare-fun e!411933 () Bool)

(declare-fun e!411930 () Bool)

(assert (=> b!736134 (= e!411933 e!411930)))

(declare-fun res!494446 () Bool)

(assert (=> b!736134 (=> (not res!494446) (not e!411930))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7315 0))(
  ( (MissingZero!7315 (index!31628 (_ BitVec 32))) (Found!7315 (index!31629 (_ BitVec 32))) (Intermediate!7315 (undefined!8127 Bool) (index!31630 (_ BitVec 32)) (x!62797 (_ BitVec 32))) (Undefined!7315) (MissingVacant!7315 (index!31631 (_ BitVec 32))) )
))
(declare-fun lt!326298 () SeekEntryResult!7315)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41299 (_ BitVec 32)) SeekEntryResult!7315)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736134 (= res!494446 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19759 a!3186) j!159) mask!3328) (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!326298))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736134 (= lt!326298 (Intermediate!7315 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736135 () Bool)

(declare-fun res!494453 () Bool)

(assert (=> b!736135 (=> (not res!494453) (not e!411933))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!736135 (= res!494453 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20179 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20179 a!3186))))))

(declare-fun b!736136 () Bool)

(declare-fun res!494458 () Bool)

(assert (=> b!736136 (=> (not res!494458) (not e!411930))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736136 (= res!494458 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19759 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!494444 () Bool)

(assert (=> start!65256 (=> (not res!494444) (not e!411935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65256 (= res!494444 (validMask!0 mask!3328))))

(assert (=> start!65256 e!411935))

(assert (=> start!65256 true))

(declare-fun array_inv!15618 (array!41299) Bool)

(assert (=> start!65256 (array_inv!15618 a!3186)))

(declare-fun b!736137 () Bool)

(declare-fun e!411926 () Bool)

(declare-fun e!411936 () Bool)

(assert (=> b!736137 (= e!411926 (not e!411936))))

(declare-fun res!494459 () Bool)

(assert (=> b!736137 (=> res!494459 e!411936)))

(declare-fun lt!326299 () SeekEntryResult!7315)

(get-info :version)

(assert (=> b!736137 (= res!494459 (or (not ((_ is Intermediate!7315) lt!326299)) (bvsge x!1131 (x!62797 lt!326299))))))

(declare-fun lt!326306 () SeekEntryResult!7315)

(assert (=> b!736137 (= lt!326306 (Found!7315 j!159))))

(declare-fun e!411928 () Bool)

(assert (=> b!736137 e!411928))

(declare-fun res!494461 () Bool)

(assert (=> b!736137 (=> (not res!494461) (not e!411928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41299 (_ BitVec 32)) Bool)

(assert (=> b!736137 (= res!494461 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25033 0))(
  ( (Unit!25034) )
))
(declare-fun lt!326310 () Unit!25033)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25033)

(assert (=> b!736137 (= lt!326310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736138 () Bool)

(declare-fun res!494445 () Bool)

(declare-fun e!411927 () Bool)

(assert (=> b!736138 (=> res!494445 e!411927)))

(declare-fun e!411929 () Bool)

(assert (=> b!736138 (= res!494445 e!411929)))

(declare-fun c!81229 () Bool)

(declare-fun lt!326302 () Bool)

(assert (=> b!736138 (= c!81229 lt!326302)))

(declare-fun e!411931 () Bool)

(declare-fun b!736139 () Bool)

(assert (=> b!736139 (= e!411931 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!326298))))

(declare-fun b!736140 () Bool)

(assert (=> b!736140 (= e!411935 e!411933)))

(declare-fun res!494460 () Bool)

(assert (=> b!736140 (=> (not res!494460) (not e!411933))))

(declare-fun lt!326305 () SeekEntryResult!7315)

(assert (=> b!736140 (= res!494460 (or (= lt!326305 (MissingZero!7315 i!1173)) (= lt!326305 (MissingVacant!7315 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41299 (_ BitVec 32)) SeekEntryResult!7315)

(assert (=> b!736140 (= lt!326305 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736141 () Bool)

(declare-fun e!411932 () Bool)

(assert (=> b!736141 (= e!411928 e!411932)))

(declare-fun res!494447 () Bool)

(assert (=> b!736141 (=> (not res!494447) (not e!411932))))

(declare-fun lt!326304 () SeekEntryResult!7315)

(assert (=> b!736141 (= res!494447 (= (seekEntryOrOpen!0 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!326304))))

(assert (=> b!736141 (= lt!326304 (Found!7315 j!159))))

(declare-fun b!736142 () Bool)

(assert (=> b!736142 (= e!411930 e!411926)))

(declare-fun res!494457 () Bool)

(assert (=> b!736142 (=> (not res!494457) (not e!411926))))

(declare-fun lt!326297 () SeekEntryResult!7315)

(assert (=> b!736142 (= res!494457 (= lt!326297 lt!326299))))

(declare-fun lt!326301 () array!41299)

(declare-fun lt!326309 () (_ BitVec 64))

(assert (=> b!736142 (= lt!326299 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326309 lt!326301 mask!3328))))

(assert (=> b!736142 (= lt!326297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326309 mask!3328) lt!326309 lt!326301 mask!3328))))

(assert (=> b!736142 (= lt!326309 (select (store (arr!19759 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736142 (= lt!326301 (array!41300 (store (arr!19759 a!3186) i!1173 k0!2102) (size!20179 a!3186)))))

(declare-fun lt!326307 () (_ BitVec 32))

(declare-fun b!736143 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41299 (_ BitVec 32)) SeekEntryResult!7315)

(assert (=> b!736143 (= e!411929 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326307 resIntermediateIndex!5 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!326306)))))

(declare-fun b!736144 () Bool)

(assert (=> b!736144 (= e!411932 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!326304))))

(declare-fun b!736145 () Bool)

(declare-fun e!411934 () Unit!25033)

(declare-fun Unit!25035 () Unit!25033)

(assert (=> b!736145 (= e!411934 Unit!25035)))

(declare-fun lt!326308 () SeekEntryResult!7315)

(assert (=> b!736145 (= lt!326308 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19759 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736145 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326307 resIntermediateIndex!5 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!326306)))

(declare-fun b!736146 () Bool)

(assert (=> b!736146 (= e!411936 e!411927)))

(declare-fun res!494455 () Bool)

(assert (=> b!736146 (=> res!494455 e!411927)))

(assert (=> b!736146 (= res!494455 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326307 #b00000000000000000000000000000000) (bvsge lt!326307 (size!20179 a!3186))))))

(declare-fun lt!326300 () Unit!25033)

(assert (=> b!736146 (= lt!326300 e!411934)))

(declare-fun c!81230 () Bool)

(assert (=> b!736146 (= c!81230 lt!326302)))

(assert (=> b!736146 (= lt!326302 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736146 (= lt!326307 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!736147 () Bool)

(assert (=> b!736147 (= e!411929 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326307 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!326298)))))

(declare-fun b!736148 () Bool)

(declare-fun res!494448 () Bool)

(assert (=> b!736148 (=> (not res!494448) (not e!411935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736148 (= res!494448 (validKeyInArray!0 (select (arr!19759 a!3186) j!159)))))

(declare-fun b!736149 () Bool)

(assert (=> b!736149 (= e!411927 true)))

(declare-fun lt!326303 () SeekEntryResult!7315)

(assert (=> b!736149 (= lt!326303 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326307 lt!326309 lt!326301 mask!3328))))

(declare-fun b!736150 () Bool)

(declare-fun res!494456 () Bool)

(assert (=> b!736150 (=> (not res!494456) (not e!411930))))

(assert (=> b!736150 (= res!494456 e!411931)))

(declare-fun c!81228 () Bool)

(assert (=> b!736150 (= c!81228 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736151 () Bool)

(declare-fun res!494449 () Bool)

(assert (=> b!736151 (=> (not res!494449) (not e!411933))))

(assert (=> b!736151 (= res!494449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736152 () Bool)

(declare-fun res!494451 () Bool)

(assert (=> b!736152 (=> (not res!494451) (not e!411935))))

(assert (=> b!736152 (= res!494451 (and (= (size!20179 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20179 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20179 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736153 () Bool)

(declare-fun res!494452 () Bool)

(assert (=> b!736153 (=> (not res!494452) (not e!411933))))

(declare-datatypes ((List!13668 0))(
  ( (Nil!13665) (Cons!13664 (h!14742 (_ BitVec 64)) (t!19975 List!13668)) )
))
(declare-fun arrayNoDuplicates!0 (array!41299 (_ BitVec 32) List!13668) Bool)

(assert (=> b!736153 (= res!494452 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13665))))

(declare-fun b!736154 () Bool)

(declare-fun res!494450 () Bool)

(assert (=> b!736154 (=> (not res!494450) (not e!411935))))

(assert (=> b!736154 (= res!494450 (validKeyInArray!0 k0!2102))))

(declare-fun b!736155 () Bool)

(declare-fun Unit!25036 () Unit!25033)

(assert (=> b!736155 (= e!411934 Unit!25036)))

(assert (=> b!736155 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326307 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) lt!326298)))

(declare-fun b!736156 () Bool)

(assert (=> b!736156 (= e!411931 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19759 a!3186) j!159) a!3186 mask!3328) (Found!7315 j!159)))))

(assert (= (and start!65256 res!494444) b!736152))

(assert (= (and b!736152 res!494451) b!736148))

(assert (= (and b!736148 res!494448) b!736154))

(assert (= (and b!736154 res!494450) b!736133))

(assert (= (and b!736133 res!494454) b!736140))

(assert (= (and b!736140 res!494460) b!736151))

(assert (= (and b!736151 res!494449) b!736153))

(assert (= (and b!736153 res!494452) b!736135))

(assert (= (and b!736135 res!494453) b!736134))

(assert (= (and b!736134 res!494446) b!736136))

(assert (= (and b!736136 res!494458) b!736150))

(assert (= (and b!736150 c!81228) b!736139))

(assert (= (and b!736150 (not c!81228)) b!736156))

(assert (= (and b!736150 res!494456) b!736142))

(assert (= (and b!736142 res!494457) b!736137))

(assert (= (and b!736137 res!494461) b!736141))

(assert (= (and b!736141 res!494447) b!736144))

(assert (= (and b!736137 (not res!494459)) b!736146))

(assert (= (and b!736146 c!81230) b!736155))

(assert (= (and b!736146 (not c!81230)) b!736145))

(assert (= (and b!736146 (not res!494455)) b!736138))

(assert (= (and b!736138 c!81229) b!736147))

(assert (= (and b!736138 (not c!81229)) b!736143))

(assert (= (and b!736138 (not res!494445)) b!736149))

(declare-fun m!688941 () Bool)

(assert (=> b!736156 m!688941))

(assert (=> b!736156 m!688941))

(declare-fun m!688943 () Bool)

(assert (=> b!736156 m!688943))

(assert (=> b!736143 m!688941))

(assert (=> b!736143 m!688941))

(declare-fun m!688945 () Bool)

(assert (=> b!736143 m!688945))

(assert (=> b!736155 m!688941))

(assert (=> b!736155 m!688941))

(declare-fun m!688947 () Bool)

(assert (=> b!736155 m!688947))

(declare-fun m!688949 () Bool)

(assert (=> b!736151 m!688949))

(declare-fun m!688951 () Bool)

(assert (=> b!736154 m!688951))

(assert (=> b!736148 m!688941))

(assert (=> b!736148 m!688941))

(declare-fun m!688953 () Bool)

(assert (=> b!736148 m!688953))

(assert (=> b!736141 m!688941))

(assert (=> b!736141 m!688941))

(declare-fun m!688955 () Bool)

(assert (=> b!736141 m!688955))

(declare-fun m!688957 () Bool)

(assert (=> b!736142 m!688957))

(declare-fun m!688959 () Bool)

(assert (=> b!736142 m!688959))

(declare-fun m!688961 () Bool)

(assert (=> b!736142 m!688961))

(assert (=> b!736142 m!688959))

(declare-fun m!688963 () Bool)

(assert (=> b!736142 m!688963))

(declare-fun m!688965 () Bool)

(assert (=> b!736142 m!688965))

(declare-fun m!688967 () Bool)

(assert (=> b!736137 m!688967))

(declare-fun m!688969 () Bool)

(assert (=> b!736137 m!688969))

(assert (=> b!736145 m!688941))

(assert (=> b!736145 m!688941))

(assert (=> b!736145 m!688943))

(assert (=> b!736145 m!688941))

(assert (=> b!736145 m!688945))

(declare-fun m!688971 () Bool)

(assert (=> b!736153 m!688971))

(declare-fun m!688973 () Bool)

(assert (=> b!736140 m!688973))

(assert (=> b!736134 m!688941))

(assert (=> b!736134 m!688941))

(declare-fun m!688975 () Bool)

(assert (=> b!736134 m!688975))

(assert (=> b!736134 m!688975))

(assert (=> b!736134 m!688941))

(declare-fun m!688977 () Bool)

(assert (=> b!736134 m!688977))

(assert (=> b!736139 m!688941))

(assert (=> b!736139 m!688941))

(declare-fun m!688979 () Bool)

(assert (=> b!736139 m!688979))

(declare-fun m!688981 () Bool)

(assert (=> b!736149 m!688981))

(declare-fun m!688983 () Bool)

(assert (=> start!65256 m!688983))

(declare-fun m!688985 () Bool)

(assert (=> start!65256 m!688985))

(declare-fun m!688987 () Bool)

(assert (=> b!736136 m!688987))

(assert (=> b!736144 m!688941))

(assert (=> b!736144 m!688941))

(declare-fun m!688989 () Bool)

(assert (=> b!736144 m!688989))

(declare-fun m!688991 () Bool)

(assert (=> b!736133 m!688991))

(assert (=> b!736147 m!688941))

(assert (=> b!736147 m!688941))

(assert (=> b!736147 m!688947))

(declare-fun m!688993 () Bool)

(assert (=> b!736146 m!688993))

(check-sat (not b!736148) (not b!736156) (not b!736144) (not b!736141) (not b!736155) (not b!736143) (not b!736137) (not b!736153) (not start!65256) (not b!736146) (not b!736142) (not b!736134) (not b!736133) (not b!736151) (not b!736145) (not b!736149) (not b!736140) (not b!736139) (not b!736147) (not b!736154))
(check-sat)
