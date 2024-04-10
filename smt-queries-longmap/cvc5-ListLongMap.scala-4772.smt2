; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65692 () Bool)

(assert start!65692)

(declare-fun b!753287 () Bool)

(declare-fun e!420156 () Bool)

(declare-fun e!420161 () Bool)

(assert (=> b!753287 (= e!420156 e!420161)))

(declare-fun res!508846 () Bool)

(assert (=> b!753287 (=> (not res!508846) (not e!420161))))

(declare-datatypes ((SeekEntryResult!7646 0))(
  ( (MissingZero!7646 (index!32952 (_ BitVec 32))) (Found!7646 (index!32953 (_ BitVec 32))) (Intermediate!7646 (undefined!8458 Bool) (index!32954 (_ BitVec 32)) (x!63868 (_ BitVec 32))) (Undefined!7646) (MissingVacant!7646 (index!32955 (_ BitVec 32))) )
))
(declare-fun lt!335148 () SeekEntryResult!7646)

(declare-fun lt!335146 () SeekEntryResult!7646)

(assert (=> b!753287 (= res!508846 (= lt!335148 lt!335146))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41865 0))(
  ( (array!41866 (arr!20046 (Array (_ BitVec 32) (_ BitVec 64))) (size!20467 (_ BitVec 32))) )
))
(declare-fun lt!335147 () array!41865)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!335143 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41865 (_ BitVec 32)) SeekEntryResult!7646)

(assert (=> b!753287 (= lt!335146 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335143 lt!335147 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753287 (= lt!335148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335143 mask!3328) lt!335143 lt!335147 mask!3328))))

(declare-fun a!3186 () array!41865)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!753287 (= lt!335143 (select (store (arr!20046 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!753287 (= lt!335147 (array!41866 (store (arr!20046 a!3186) i!1173 k!2102) (size!20467 a!3186)))))

(declare-fun b!753288 () Bool)

(declare-fun e!420153 () Bool)

(assert (=> b!753288 (= e!420153 true)))

(declare-fun e!420157 () Bool)

(assert (=> b!753288 e!420157))

(declare-fun res!508851 () Bool)

(assert (=> b!753288 (=> (not res!508851) (not e!420157))))

(declare-fun lt!335151 () (_ BitVec 64))

(assert (=> b!753288 (= res!508851 (= lt!335151 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25964 0))(
  ( (Unit!25965) )
))
(declare-fun lt!335144 () Unit!25964)

(declare-fun e!420151 () Unit!25964)

(assert (=> b!753288 (= lt!335144 e!420151)))

(declare-fun c!82606 () Bool)

(assert (=> b!753288 (= c!82606 (= lt!335151 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753289 () Bool)

(declare-fun e!420150 () Bool)

(declare-fun e!420158 () Bool)

(assert (=> b!753289 (= e!420150 e!420158)))

(declare-fun res!508845 () Bool)

(assert (=> b!753289 (=> (not res!508845) (not e!420158))))

(declare-fun lt!335150 () SeekEntryResult!7646)

(assert (=> b!753289 (= res!508845 (or (= lt!335150 (MissingZero!7646 i!1173)) (= lt!335150 (MissingVacant!7646 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41865 (_ BitVec 32)) SeekEntryResult!7646)

(assert (=> b!753289 (= lt!335150 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!753290 () Bool)

(declare-fun e!420152 () Bool)

(assert (=> b!753290 (= e!420161 (not e!420152))))

(declare-fun res!508843 () Bool)

(assert (=> b!753290 (=> res!508843 e!420152)))

(assert (=> b!753290 (= res!508843 (or (not (is-Intermediate!7646 lt!335146)) (bvslt x!1131 (x!63868 lt!335146)) (not (= x!1131 (x!63868 lt!335146))) (not (= index!1321 (index!32954 lt!335146)))))))

(declare-fun e!420155 () Bool)

(assert (=> b!753290 e!420155))

(declare-fun res!508842 () Bool)

(assert (=> b!753290 (=> (not res!508842) (not e!420155))))

(declare-fun lt!335145 () SeekEntryResult!7646)

(declare-fun lt!335153 () SeekEntryResult!7646)

(assert (=> b!753290 (= res!508842 (= lt!335145 lt!335153))))

(assert (=> b!753290 (= lt!335153 (Found!7646 j!159))))

(assert (=> b!753290 (= lt!335145 (seekEntryOrOpen!0 (select (arr!20046 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41865 (_ BitVec 32)) Bool)

(assert (=> b!753290 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335149 () Unit!25964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25964)

(assert (=> b!753290 (= lt!335149 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753291 () Bool)

(declare-fun res!508849 () Bool)

(assert (=> b!753291 (=> (not res!508849) (not e!420156))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!753291 (= res!508849 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20046 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!335152 () SeekEntryResult!7646)

(declare-fun b!753292 () Bool)

(declare-fun e!420159 () Bool)

(assert (=> b!753292 (= e!420159 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20046 a!3186) j!159) a!3186 mask!3328) lt!335152))))

(declare-fun b!753293 () Bool)

(declare-fun Unit!25966 () Unit!25964)

(assert (=> b!753293 (= e!420151 Unit!25966)))

(assert (=> b!753293 false))

(declare-fun b!753294 () Bool)

(declare-fun res!508856 () Bool)

(assert (=> b!753294 (=> (not res!508856) (not e!420150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753294 (= res!508856 (validKeyInArray!0 k!2102))))

(declare-fun b!753296 () Bool)

(declare-fun lt!335142 () SeekEntryResult!7646)

(assert (=> b!753296 (= e!420157 (= lt!335145 lt!335142))))

(declare-fun b!753297 () Bool)

(assert (=> b!753297 (= e!420158 e!420156)))

(declare-fun res!508852 () Bool)

(assert (=> b!753297 (=> (not res!508852) (not e!420156))))

(assert (=> b!753297 (= res!508852 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20046 a!3186) j!159) mask!3328) (select (arr!20046 a!3186) j!159) a!3186 mask!3328) lt!335152))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753297 (= lt!335152 (Intermediate!7646 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753298 () Bool)

(declare-fun e!420154 () Bool)

(assert (=> b!753298 (= e!420152 e!420154)))

(declare-fun res!508853 () Bool)

(assert (=> b!753298 (=> res!508853 e!420154)))

(assert (=> b!753298 (= res!508853 (not (= lt!335142 lt!335153)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41865 (_ BitVec 32)) SeekEntryResult!7646)

(assert (=> b!753298 (= lt!335142 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20046 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753299 () Bool)

(declare-fun res!508850 () Bool)

(assert (=> b!753299 (=> (not res!508850) (not e!420158))))

(assert (=> b!753299 (= res!508850 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20467 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20467 a!3186))))))

(declare-fun b!753300 () Bool)

(declare-fun res!508848 () Bool)

(assert (=> b!753300 (=> (not res!508848) (not e!420156))))

(assert (=> b!753300 (= res!508848 e!420159)))

(declare-fun c!82605 () Bool)

(assert (=> b!753300 (= c!82605 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753301 () Bool)

(declare-fun Unit!25967 () Unit!25964)

(assert (=> b!753301 (= e!420151 Unit!25967)))

(declare-fun b!753302 () Bool)

(declare-fun res!508841 () Bool)

(assert (=> b!753302 (=> (not res!508841) (not e!420150))))

(declare-fun arrayContainsKey!0 (array!41865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753302 (= res!508841 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753303 () Bool)

(declare-fun res!508838 () Bool)

(assert (=> b!753303 (=> (not res!508838) (not e!420158))))

(declare-datatypes ((List!14048 0))(
  ( (Nil!14045) (Cons!14044 (h!15116 (_ BitVec 64)) (t!20363 List!14048)) )
))
(declare-fun arrayNoDuplicates!0 (array!41865 (_ BitVec 32) List!14048) Bool)

(assert (=> b!753303 (= res!508838 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14045))))

(declare-fun b!753304 () Bool)

(assert (=> b!753304 (= e!420159 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20046 a!3186) j!159) a!3186 mask!3328) (Found!7646 j!159)))))

(declare-fun b!753295 () Bool)

(declare-fun res!508847 () Bool)

(assert (=> b!753295 (=> (not res!508847) (not e!420150))))

(assert (=> b!753295 (= res!508847 (and (= (size!20467 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20467 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20467 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!508855 () Bool)

(assert (=> start!65692 (=> (not res!508855) (not e!420150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65692 (= res!508855 (validMask!0 mask!3328))))

(assert (=> start!65692 e!420150))

(assert (=> start!65692 true))

(declare-fun array_inv!15842 (array!41865) Bool)

(assert (=> start!65692 (array_inv!15842 a!3186)))

(declare-fun b!753305 () Bool)

(declare-fun res!508840 () Bool)

(assert (=> b!753305 (=> (not res!508840) (not e!420158))))

(assert (=> b!753305 (= res!508840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753306 () Bool)

(declare-fun res!508839 () Bool)

(assert (=> b!753306 (=> (not res!508839) (not e!420150))))

(assert (=> b!753306 (= res!508839 (validKeyInArray!0 (select (arr!20046 a!3186) j!159)))))

(declare-fun b!753307 () Bool)

(assert (=> b!753307 (= e!420154 e!420153)))

(declare-fun res!508854 () Bool)

(assert (=> b!753307 (=> res!508854 e!420153)))

(assert (=> b!753307 (= res!508854 (= lt!335151 lt!335143))))

(assert (=> b!753307 (= lt!335151 (select (store (arr!20046 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!753308 () Bool)

(assert (=> b!753308 (= e!420155 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20046 a!3186) j!159) a!3186 mask!3328) lt!335153))))

(declare-fun b!753309 () Bool)

(declare-fun res!508844 () Bool)

(assert (=> b!753309 (=> (not res!508844) (not e!420157))))

(assert (=> b!753309 (= res!508844 (= (seekEntryOrOpen!0 lt!335143 lt!335147 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335143 lt!335147 mask!3328)))))

(assert (= (and start!65692 res!508855) b!753295))

(assert (= (and b!753295 res!508847) b!753306))

(assert (= (and b!753306 res!508839) b!753294))

(assert (= (and b!753294 res!508856) b!753302))

(assert (= (and b!753302 res!508841) b!753289))

(assert (= (and b!753289 res!508845) b!753305))

(assert (= (and b!753305 res!508840) b!753303))

(assert (= (and b!753303 res!508838) b!753299))

(assert (= (and b!753299 res!508850) b!753297))

(assert (= (and b!753297 res!508852) b!753291))

(assert (= (and b!753291 res!508849) b!753300))

(assert (= (and b!753300 c!82605) b!753292))

(assert (= (and b!753300 (not c!82605)) b!753304))

(assert (= (and b!753300 res!508848) b!753287))

(assert (= (and b!753287 res!508846) b!753290))

(assert (= (and b!753290 res!508842) b!753308))

(assert (= (and b!753290 (not res!508843)) b!753298))

(assert (= (and b!753298 (not res!508853)) b!753307))

(assert (= (and b!753307 (not res!508854)) b!753288))

(assert (= (and b!753288 c!82606) b!753293))

(assert (= (and b!753288 (not c!82606)) b!753301))

(assert (= (and b!753288 res!508851) b!753309))

(assert (= (and b!753309 res!508844) b!753296))

(declare-fun m!702019 () Bool)

(assert (=> b!753287 m!702019))

(declare-fun m!702021 () Bool)

(assert (=> b!753287 m!702021))

(assert (=> b!753287 m!702019))

(declare-fun m!702023 () Bool)

(assert (=> b!753287 m!702023))

(declare-fun m!702025 () Bool)

(assert (=> b!753287 m!702025))

(declare-fun m!702027 () Bool)

(assert (=> b!753287 m!702027))

(declare-fun m!702029 () Bool)

(assert (=> b!753291 m!702029))

(declare-fun m!702031 () Bool)

(assert (=> b!753304 m!702031))

(assert (=> b!753304 m!702031))

(declare-fun m!702033 () Bool)

(assert (=> b!753304 m!702033))

(assert (=> b!753292 m!702031))

(assert (=> b!753292 m!702031))

(declare-fun m!702035 () Bool)

(assert (=> b!753292 m!702035))

(assert (=> b!753308 m!702031))

(assert (=> b!753308 m!702031))

(declare-fun m!702037 () Bool)

(assert (=> b!753308 m!702037))

(assert (=> b!753290 m!702031))

(assert (=> b!753290 m!702031))

(declare-fun m!702039 () Bool)

(assert (=> b!753290 m!702039))

(declare-fun m!702041 () Bool)

(assert (=> b!753290 m!702041))

(declare-fun m!702043 () Bool)

(assert (=> b!753290 m!702043))

(declare-fun m!702045 () Bool)

(assert (=> b!753303 m!702045))

(assert (=> b!753307 m!702025))

(declare-fun m!702047 () Bool)

(assert (=> b!753307 m!702047))

(assert (=> b!753298 m!702031))

(assert (=> b!753298 m!702031))

(assert (=> b!753298 m!702033))

(declare-fun m!702049 () Bool)

(assert (=> b!753309 m!702049))

(declare-fun m!702051 () Bool)

(assert (=> b!753309 m!702051))

(declare-fun m!702053 () Bool)

(assert (=> b!753302 m!702053))

(declare-fun m!702055 () Bool)

(assert (=> start!65692 m!702055))

(declare-fun m!702057 () Bool)

(assert (=> start!65692 m!702057))

(declare-fun m!702059 () Bool)

(assert (=> b!753294 m!702059))

(assert (=> b!753306 m!702031))

(assert (=> b!753306 m!702031))

(declare-fun m!702061 () Bool)

(assert (=> b!753306 m!702061))

(assert (=> b!753297 m!702031))

(assert (=> b!753297 m!702031))

(declare-fun m!702063 () Bool)

(assert (=> b!753297 m!702063))

(assert (=> b!753297 m!702063))

(assert (=> b!753297 m!702031))

(declare-fun m!702065 () Bool)

(assert (=> b!753297 m!702065))

(declare-fun m!702067 () Bool)

(assert (=> b!753305 m!702067))

(declare-fun m!702069 () Bool)

(assert (=> b!753289 m!702069))

(push 1)

