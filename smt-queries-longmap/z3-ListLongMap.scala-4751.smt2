; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65568 () Bool)

(assert start!65568)

(declare-fun b!749121 () Bool)

(declare-fun res!505423 () Bool)

(declare-fun e!418037 () Bool)

(assert (=> b!749121 (=> (not res!505423) (not e!418037))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749121 (= res!505423 (validKeyInArray!0 k0!2102))))

(declare-fun b!749122 () Bool)

(declare-fun e!418038 () Bool)

(declare-fun e!418039 () Bool)

(assert (=> b!749122 (= e!418038 e!418039)))

(declare-fun res!505428 () Bool)

(assert (=> b!749122 (=> res!505428 e!418039)))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!749122 (= res!505428 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-datatypes ((array!41741 0))(
  ( (array!41742 (arr!19984 (Array (_ BitVec 32) (_ BitVec 64))) (size!20405 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41741)

(assert (=> b!749122 (= (select (store (arr!19984 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25716 0))(
  ( (Unit!25717) )
))
(declare-fun lt!333028 () Unit!25716)

(declare-fun e!418042 () Unit!25716)

(assert (=> b!749122 (= lt!333028 e!418042)))

(declare-fun c!82234 () Bool)

(assert (=> b!749122 (= c!82234 (= (select (store (arr!19984 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749124 () Bool)

(declare-fun res!505418 () Bool)

(declare-fun e!418040 () Bool)

(assert (=> b!749124 (=> (not res!505418) (not e!418040))))

(declare-datatypes ((List!13986 0))(
  ( (Nil!13983) (Cons!13982 (h!15054 (_ BitVec 64)) (t!20301 List!13986)) )
))
(declare-fun arrayNoDuplicates!0 (array!41741 (_ BitVec 32) List!13986) Bool)

(assert (=> b!749124 (= res!505418 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13983))))

(declare-fun b!749125 () Bool)

(declare-fun res!505420 () Bool)

(assert (=> b!749125 (=> (not res!505420) (not e!418037))))

(declare-fun arrayContainsKey!0 (array!41741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749125 (= res!505420 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749126 () Bool)

(declare-fun res!505432 () Bool)

(assert (=> b!749126 (=> (not res!505432) (not e!418037))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!749126 (= res!505432 (and (= (size!20405 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20405 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20405 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749127 () Bool)

(declare-fun e!418034 () Bool)

(assert (=> b!749127 (= e!418040 e!418034)))

(declare-fun res!505430 () Bool)

(assert (=> b!749127 (=> (not res!505430) (not e!418034))))

(declare-datatypes ((SeekEntryResult!7584 0))(
  ( (MissingZero!7584 (index!32704 (_ BitVec 32))) (Found!7584 (index!32705 (_ BitVec 32))) (Intermediate!7584 (undefined!8396 Bool) (index!32706 (_ BitVec 32)) (x!63638 (_ BitVec 32))) (Undefined!7584) (MissingVacant!7584 (index!32707 (_ BitVec 32))) )
))
(declare-fun lt!333029 () SeekEntryResult!7584)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41741 (_ BitVec 32)) SeekEntryResult!7584)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749127 (= res!505430 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19984 a!3186) j!159) mask!3328) (select (arr!19984 a!3186) j!159) a!3186 mask!3328) lt!333029))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749127 (= lt!333029 (Intermediate!7584 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749128 () Bool)

(declare-fun e!418035 () Bool)

(assert (=> b!749128 (= e!418035 (not e!418038))))

(declare-fun res!505429 () Bool)

(assert (=> b!749128 (=> res!505429 e!418038)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!333031 () SeekEntryResult!7584)

(get-info :version)

(assert (=> b!749128 (= res!505429 (or (not ((_ is Intermediate!7584) lt!333031)) (bvslt x!1131 (x!63638 lt!333031)) (not (= x!1131 (x!63638 lt!333031))) (not (= index!1321 (index!32706 lt!333031)))))))

(declare-fun e!418041 () Bool)

(assert (=> b!749128 e!418041))

(declare-fun res!505426 () Bool)

(assert (=> b!749128 (=> (not res!505426) (not e!418041))))

(declare-fun lt!333035 () SeekEntryResult!7584)

(declare-fun lt!333030 () SeekEntryResult!7584)

(assert (=> b!749128 (= res!505426 (= lt!333035 lt!333030))))

(assert (=> b!749128 (= lt!333030 (Found!7584 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41741 (_ BitVec 32)) SeekEntryResult!7584)

(assert (=> b!749128 (= lt!333035 (seekEntryOrOpen!0 (select (arr!19984 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41741 (_ BitVec 32)) Bool)

(assert (=> b!749128 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333034 () Unit!25716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25716)

(assert (=> b!749128 (= lt!333034 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749129 () Bool)

(declare-fun res!505427 () Bool)

(assert (=> b!749129 (=> (not res!505427) (not e!418034))))

(declare-fun e!418043 () Bool)

(assert (=> b!749129 (= res!505427 e!418043)))

(declare-fun c!82233 () Bool)

(assert (=> b!749129 (= c!82233 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749130 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41741 (_ BitVec 32)) SeekEntryResult!7584)

(assert (=> b!749130 (= e!418043 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19984 a!3186) j!159) a!3186 mask!3328) (Found!7584 j!159)))))

(declare-fun b!749131 () Bool)

(assert (=> b!749131 (= e!418043 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19984 a!3186) j!159) a!3186 mask!3328) lt!333029))))

(declare-fun b!749132 () Bool)

(declare-fun res!505424 () Bool)

(assert (=> b!749132 (=> (not res!505424) (not e!418040))))

(assert (=> b!749132 (= res!505424 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20405 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20405 a!3186))))))

(declare-fun b!749133 () Bool)

(assert (=> b!749133 (= e!418034 e!418035)))

(declare-fun res!505421 () Bool)

(assert (=> b!749133 (=> (not res!505421) (not e!418035))))

(declare-fun lt!333026 () SeekEntryResult!7584)

(assert (=> b!749133 (= res!505421 (= lt!333026 lt!333031))))

(declare-fun lt!333032 () array!41741)

(declare-fun lt!333033 () (_ BitVec 64))

(assert (=> b!749133 (= lt!333031 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333033 lt!333032 mask!3328))))

(assert (=> b!749133 (= lt!333026 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333033 mask!3328) lt!333033 lt!333032 mask!3328))))

(assert (=> b!749133 (= lt!333033 (select (store (arr!19984 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749133 (= lt!333032 (array!41742 (store (arr!19984 a!3186) i!1173 k0!2102) (size!20405 a!3186)))))

(declare-fun b!749134 () Bool)

(assert (=> b!749134 (= e!418037 e!418040)))

(declare-fun res!505417 () Bool)

(assert (=> b!749134 (=> (not res!505417) (not e!418040))))

(declare-fun lt!333027 () SeekEntryResult!7584)

(assert (=> b!749134 (= res!505417 (or (= lt!333027 (MissingZero!7584 i!1173)) (= lt!333027 (MissingVacant!7584 i!1173))))))

(assert (=> b!749134 (= lt!333027 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749135 () Bool)

(declare-fun res!505431 () Bool)

(assert (=> b!749135 (=> res!505431 e!418038)))

(assert (=> b!749135 (= res!505431 (= (select (store (arr!19984 a!3186) i!1173 k0!2102) index!1321) lt!333033))))

(declare-fun res!505425 () Bool)

(assert (=> start!65568 (=> (not res!505425) (not e!418037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65568 (= res!505425 (validMask!0 mask!3328))))

(assert (=> start!65568 e!418037))

(assert (=> start!65568 true))

(declare-fun array_inv!15780 (array!41741) Bool)

(assert (=> start!65568 (array_inv!15780 a!3186)))

(declare-fun b!749123 () Bool)

(assert (=> b!749123 (= e!418041 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19984 a!3186) j!159) a!3186 mask!3328) lt!333030))))

(declare-fun b!749136 () Bool)

(declare-fun res!505416 () Bool)

(assert (=> b!749136 (=> (not res!505416) (not e!418037))))

(assert (=> b!749136 (= res!505416 (validKeyInArray!0 (select (arr!19984 a!3186) j!159)))))

(declare-fun b!749137 () Bool)

(declare-fun res!505433 () Bool)

(assert (=> b!749137 (=> (not res!505433) (not e!418034))))

(assert (=> b!749137 (= res!505433 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19984 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749138 () Bool)

(declare-fun res!505419 () Bool)

(assert (=> b!749138 (=> res!505419 e!418038)))

(assert (=> b!749138 (= res!505419 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19984 a!3186) j!159) a!3186 mask!3328) lt!333030)))))

(declare-fun b!749139 () Bool)

(declare-fun Unit!25718 () Unit!25716)

(assert (=> b!749139 (= e!418042 Unit!25718)))

(assert (=> b!749139 false))

(declare-fun b!749140 () Bool)

(assert (=> b!749140 (= e!418039 (validKeyInArray!0 lt!333033))))

(declare-fun b!749141 () Bool)

(declare-fun Unit!25719 () Unit!25716)

(assert (=> b!749141 (= e!418042 Unit!25719)))

(declare-fun b!749142 () Bool)

(declare-fun res!505422 () Bool)

(assert (=> b!749142 (=> (not res!505422) (not e!418040))))

(assert (=> b!749142 (= res!505422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65568 res!505425) b!749126))

(assert (= (and b!749126 res!505432) b!749136))

(assert (= (and b!749136 res!505416) b!749121))

(assert (= (and b!749121 res!505423) b!749125))

(assert (= (and b!749125 res!505420) b!749134))

(assert (= (and b!749134 res!505417) b!749142))

(assert (= (and b!749142 res!505422) b!749124))

(assert (= (and b!749124 res!505418) b!749132))

(assert (= (and b!749132 res!505424) b!749127))

(assert (= (and b!749127 res!505430) b!749137))

(assert (= (and b!749137 res!505433) b!749129))

(assert (= (and b!749129 c!82233) b!749131))

(assert (= (and b!749129 (not c!82233)) b!749130))

(assert (= (and b!749129 res!505427) b!749133))

(assert (= (and b!749133 res!505421) b!749128))

(assert (= (and b!749128 res!505426) b!749123))

(assert (= (and b!749128 (not res!505429)) b!749138))

(assert (= (and b!749138 (not res!505419)) b!749135))

(assert (= (and b!749135 (not res!505431)) b!749122))

(assert (= (and b!749122 c!82234) b!749139))

(assert (= (and b!749122 (not c!82234)) b!749141))

(assert (= (and b!749122 (not res!505428)) b!749140))

(declare-fun m!698799 () Bool)

(assert (=> b!749134 m!698799))

(declare-fun m!698801 () Bool)

(assert (=> b!749128 m!698801))

(assert (=> b!749128 m!698801))

(declare-fun m!698803 () Bool)

(assert (=> b!749128 m!698803))

(declare-fun m!698805 () Bool)

(assert (=> b!749128 m!698805))

(declare-fun m!698807 () Bool)

(assert (=> b!749128 m!698807))

(assert (=> b!749123 m!698801))

(assert (=> b!749123 m!698801))

(declare-fun m!698809 () Bool)

(assert (=> b!749123 m!698809))

(declare-fun m!698811 () Bool)

(assert (=> b!749121 m!698811))

(declare-fun m!698813 () Bool)

(assert (=> b!749124 m!698813))

(assert (=> b!749138 m!698801))

(assert (=> b!749138 m!698801))

(declare-fun m!698815 () Bool)

(assert (=> b!749138 m!698815))

(declare-fun m!698817 () Bool)

(assert (=> b!749140 m!698817))

(declare-fun m!698819 () Bool)

(assert (=> b!749135 m!698819))

(declare-fun m!698821 () Bool)

(assert (=> b!749135 m!698821))

(assert (=> b!749130 m!698801))

(assert (=> b!749130 m!698801))

(assert (=> b!749130 m!698815))

(declare-fun m!698823 () Bool)

(assert (=> b!749125 m!698823))

(assert (=> b!749136 m!698801))

(assert (=> b!749136 m!698801))

(declare-fun m!698825 () Bool)

(assert (=> b!749136 m!698825))

(declare-fun m!698827 () Bool)

(assert (=> start!65568 m!698827))

(declare-fun m!698829 () Bool)

(assert (=> start!65568 m!698829))

(declare-fun m!698831 () Bool)

(assert (=> b!749133 m!698831))

(assert (=> b!749133 m!698831))

(declare-fun m!698833 () Bool)

(assert (=> b!749133 m!698833))

(assert (=> b!749133 m!698819))

(declare-fun m!698835 () Bool)

(assert (=> b!749133 m!698835))

(declare-fun m!698837 () Bool)

(assert (=> b!749133 m!698837))

(declare-fun m!698839 () Bool)

(assert (=> b!749137 m!698839))

(assert (=> b!749122 m!698819))

(assert (=> b!749122 m!698821))

(assert (=> b!749131 m!698801))

(assert (=> b!749131 m!698801))

(declare-fun m!698841 () Bool)

(assert (=> b!749131 m!698841))

(assert (=> b!749127 m!698801))

(assert (=> b!749127 m!698801))

(declare-fun m!698843 () Bool)

(assert (=> b!749127 m!698843))

(assert (=> b!749127 m!698843))

(assert (=> b!749127 m!698801))

(declare-fun m!698845 () Bool)

(assert (=> b!749127 m!698845))

(declare-fun m!698847 () Bool)

(assert (=> b!749142 m!698847))

(check-sat (not b!749127) (not b!749121) (not b!749125) (not b!749128) (not start!65568) (not b!749134) (not b!749124) (not b!749138) (not b!749142) (not b!749130) (not b!749131) (not b!749140) (not b!749136) (not b!749123) (not b!749133))
(check-sat)
