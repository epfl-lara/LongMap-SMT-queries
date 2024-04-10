; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67186 () Bool)

(assert start!67186)

(declare-fun b!777044 () Bool)

(declare-fun e!432362 () Bool)

(declare-fun e!432361 () Bool)

(assert (=> b!777044 (= e!432362 e!432361)))

(declare-fun res!525794 () Bool)

(assert (=> b!777044 (=> (not res!525794) (not e!432361))))

(declare-datatypes ((SeekEntryResult!7966 0))(
  ( (MissingZero!7966 (index!34232 (_ BitVec 32))) (Found!7966 (index!34233 (_ BitVec 32))) (Intermediate!7966 (undefined!8778 Bool) (index!34234 (_ BitVec 32)) (x!65165 (_ BitVec 32))) (Undefined!7966) (MissingVacant!7966 (index!34235 (_ BitVec 32))) )
))
(declare-fun lt!346208 () SeekEntryResult!7966)

(declare-fun lt!346213 () SeekEntryResult!7966)

(assert (=> b!777044 (= res!525794 (= lt!346208 lt!346213))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!346214 () (_ BitVec 64))

(declare-datatypes ((array!42541 0))(
  ( (array!42542 (arr!20366 (Array (_ BitVec 32) (_ BitVec 64))) (size!20787 (_ BitVec 32))) )
))
(declare-fun lt!346209 () array!42541)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42541 (_ BitVec 32)) SeekEntryResult!7966)

(assert (=> b!777044 (= lt!346213 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346214 lt!346209 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777044 (= lt!346208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346214 mask!3328) lt!346214 lt!346209 mask!3328))))

(declare-fun a!3186 () array!42541)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!777044 (= lt!346214 (select (store (arr!20366 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!777044 (= lt!346209 (array!42542 (store (arr!20366 a!3186) i!1173 k!2102) (size!20787 a!3186)))))

(declare-fun b!777045 () Bool)

(declare-fun res!525788 () Bool)

(declare-fun e!432360 () Bool)

(assert (=> b!777045 (=> (not res!525788) (not e!432360))))

(declare-fun arrayContainsKey!0 (array!42541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777045 (= res!525788 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777046 () Bool)

(declare-fun res!525780 () Bool)

(assert (=> b!777046 (=> (not res!525780) (not e!432360))))

(assert (=> b!777046 (= res!525780 (and (= (size!20787 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20787 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20787 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777047 () Bool)

(declare-fun res!525783 () Bool)

(assert (=> b!777047 (=> (not res!525783) (not e!432360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777047 (= res!525783 (validKeyInArray!0 (select (arr!20366 a!3186) j!159)))))

(declare-fun b!777048 () Bool)

(declare-fun e!432365 () Bool)

(assert (=> b!777048 (= e!432365 e!432362)))

(declare-fun res!525787 () Bool)

(assert (=> b!777048 (=> (not res!525787) (not e!432362))))

(declare-fun lt!346207 () SeekEntryResult!7966)

(assert (=> b!777048 (= res!525787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20366 a!3186) j!159) mask!3328) (select (arr!20366 a!3186) j!159) a!3186 mask!3328) lt!346207))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777048 (= lt!346207 (Intermediate!7966 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777049 () Bool)

(declare-fun res!525791 () Bool)

(declare-fun e!432363 () Bool)

(assert (=> b!777049 (=> res!525791 e!432363)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42541 (_ BitVec 32)) SeekEntryResult!7966)

(assert (=> b!777049 (= res!525791 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20366 a!3186) j!159) a!3186 mask!3328) (Found!7966 j!159))))))

(declare-fun e!432364 () Bool)

(declare-fun b!777050 () Bool)

(assert (=> b!777050 (= e!432364 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20366 a!3186) j!159) a!3186 mask!3328) (Found!7966 j!159)))))

(declare-fun b!777051 () Bool)

(assert (=> b!777051 (= e!432361 (not e!432363))))

(declare-fun res!525784 () Bool)

(assert (=> b!777051 (=> res!525784 e!432363)))

(assert (=> b!777051 (= res!525784 (or (not (is-Intermediate!7966 lt!346213)) (bvslt x!1131 (x!65165 lt!346213)) (not (= x!1131 (x!65165 lt!346213))) (not (= index!1321 (index!34234 lt!346213)))))))

(declare-fun e!432367 () Bool)

(assert (=> b!777051 e!432367))

(declare-fun res!525789 () Bool)

(assert (=> b!777051 (=> (not res!525789) (not e!432367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42541 (_ BitVec 32)) Bool)

(assert (=> b!777051 (= res!525789 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26826 0))(
  ( (Unit!26827) )
))
(declare-fun lt!346210 () Unit!26826)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26826)

(assert (=> b!777051 (= lt!346210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!525793 () Bool)

(assert (=> start!67186 (=> (not res!525793) (not e!432360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67186 (= res!525793 (validMask!0 mask!3328))))

(assert (=> start!67186 e!432360))

(assert (=> start!67186 true))

(declare-fun array_inv!16162 (array!42541) Bool)

(assert (=> start!67186 (array_inv!16162 a!3186)))

(declare-fun b!777052 () Bool)

(declare-fun e!432366 () Bool)

(assert (=> b!777052 (= e!432367 e!432366)))

(declare-fun res!525785 () Bool)

(assert (=> b!777052 (=> (not res!525785) (not e!432366))))

(declare-fun lt!346212 () SeekEntryResult!7966)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42541 (_ BitVec 32)) SeekEntryResult!7966)

(assert (=> b!777052 (= res!525785 (= (seekEntryOrOpen!0 (select (arr!20366 a!3186) j!159) a!3186 mask!3328) lt!346212))))

(assert (=> b!777052 (= lt!346212 (Found!7966 j!159))))

(declare-fun b!777053 () Bool)

(declare-fun res!525790 () Bool)

(assert (=> b!777053 (=> (not res!525790) (not e!432360))))

(assert (=> b!777053 (= res!525790 (validKeyInArray!0 k!2102))))

(declare-fun b!777054 () Bool)

(assert (=> b!777054 (= e!432363 (= (seekEntryOrOpen!0 lt!346214 lt!346209 mask!3328) (Found!7966 index!1321)))))

(declare-fun b!777055 () Bool)

(declare-fun res!525796 () Bool)

(assert (=> b!777055 (=> (not res!525796) (not e!432362))))

(assert (=> b!777055 (= res!525796 e!432364)))

(declare-fun c!86032 () Bool)

(assert (=> b!777055 (= c!86032 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!777056 () Bool)

(assert (=> b!777056 (= e!432360 e!432365)))

(declare-fun res!525797 () Bool)

(assert (=> b!777056 (=> (not res!525797) (not e!432365))))

(declare-fun lt!346211 () SeekEntryResult!7966)

(assert (=> b!777056 (= res!525797 (or (= lt!346211 (MissingZero!7966 i!1173)) (= lt!346211 (MissingVacant!7966 i!1173))))))

(assert (=> b!777056 (= lt!346211 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!777057 () Bool)

(declare-fun res!525792 () Bool)

(assert (=> b!777057 (=> (not res!525792) (not e!432365))))

(assert (=> b!777057 (= res!525792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777058 () Bool)

(declare-fun res!525795 () Bool)

(assert (=> b!777058 (=> (not res!525795) (not e!432365))))

(assert (=> b!777058 (= res!525795 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20787 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20787 a!3186))))))

(declare-fun b!777059 () Bool)

(assert (=> b!777059 (= e!432366 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20366 a!3186) j!159) a!3186 mask!3328) lt!346212))))

(declare-fun b!777060 () Bool)

(declare-fun res!525782 () Bool)

(assert (=> b!777060 (=> (not res!525782) (not e!432362))))

(assert (=> b!777060 (= res!525782 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20366 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777061 () Bool)

(assert (=> b!777061 (= e!432364 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20366 a!3186) j!159) a!3186 mask!3328) lt!346207))))

(declare-fun b!777062 () Bool)

(declare-fun res!525781 () Bool)

(assert (=> b!777062 (=> res!525781 e!432363)))

(assert (=> b!777062 (= res!525781 (or (not (= (select (store (arr!20366 a!3186) i!1173 k!2102) index!1321) lt!346214)) (undefined!8778 lt!346213)))))

(declare-fun b!777063 () Bool)

(declare-fun res!525786 () Bool)

(assert (=> b!777063 (=> (not res!525786) (not e!432365))))

(declare-datatypes ((List!14368 0))(
  ( (Nil!14365) (Cons!14364 (h!15472 (_ BitVec 64)) (t!20683 List!14368)) )
))
(declare-fun arrayNoDuplicates!0 (array!42541 (_ BitVec 32) List!14368) Bool)

(assert (=> b!777063 (= res!525786 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14365))))

(assert (= (and start!67186 res!525793) b!777046))

(assert (= (and b!777046 res!525780) b!777047))

(assert (= (and b!777047 res!525783) b!777053))

(assert (= (and b!777053 res!525790) b!777045))

(assert (= (and b!777045 res!525788) b!777056))

(assert (= (and b!777056 res!525797) b!777057))

(assert (= (and b!777057 res!525792) b!777063))

(assert (= (and b!777063 res!525786) b!777058))

(assert (= (and b!777058 res!525795) b!777048))

(assert (= (and b!777048 res!525787) b!777060))

(assert (= (and b!777060 res!525782) b!777055))

(assert (= (and b!777055 c!86032) b!777061))

(assert (= (and b!777055 (not c!86032)) b!777050))

(assert (= (and b!777055 res!525796) b!777044))

(assert (= (and b!777044 res!525794) b!777051))

(assert (= (and b!777051 res!525789) b!777052))

(assert (= (and b!777052 res!525785) b!777059))

(assert (= (and b!777051 (not res!525784)) b!777049))

(assert (= (and b!777049 (not res!525791)) b!777062))

(assert (= (and b!777062 (not res!525781)) b!777054))

(declare-fun m!721029 () Bool)

(assert (=> b!777060 m!721029))

(declare-fun m!721031 () Bool)

(assert (=> b!777050 m!721031))

(assert (=> b!777050 m!721031))

(declare-fun m!721033 () Bool)

(assert (=> b!777050 m!721033))

(declare-fun m!721035 () Bool)

(assert (=> b!777062 m!721035))

(declare-fun m!721037 () Bool)

(assert (=> b!777062 m!721037))

(declare-fun m!721039 () Bool)

(assert (=> b!777053 m!721039))

(assert (=> b!777049 m!721031))

(assert (=> b!777049 m!721031))

(assert (=> b!777049 m!721033))

(assert (=> b!777047 m!721031))

(assert (=> b!777047 m!721031))

(declare-fun m!721041 () Bool)

(assert (=> b!777047 m!721041))

(assert (=> b!777052 m!721031))

(assert (=> b!777052 m!721031))

(declare-fun m!721043 () Bool)

(assert (=> b!777052 m!721043))

(declare-fun m!721045 () Bool)

(assert (=> b!777044 m!721045))

(declare-fun m!721047 () Bool)

(assert (=> b!777044 m!721047))

(declare-fun m!721049 () Bool)

(assert (=> b!777044 m!721049))

(assert (=> b!777044 m!721045))

(declare-fun m!721051 () Bool)

(assert (=> b!777044 m!721051))

(assert (=> b!777044 m!721035))

(declare-fun m!721053 () Bool)

(assert (=> b!777054 m!721053))

(assert (=> b!777048 m!721031))

(assert (=> b!777048 m!721031))

(declare-fun m!721055 () Bool)

(assert (=> b!777048 m!721055))

(assert (=> b!777048 m!721055))

(assert (=> b!777048 m!721031))

(declare-fun m!721057 () Bool)

(assert (=> b!777048 m!721057))

(declare-fun m!721059 () Bool)

(assert (=> b!777051 m!721059))

(declare-fun m!721061 () Bool)

(assert (=> b!777051 m!721061))

(declare-fun m!721063 () Bool)

(assert (=> b!777057 m!721063))

(declare-fun m!721065 () Bool)

(assert (=> start!67186 m!721065))

(declare-fun m!721067 () Bool)

(assert (=> start!67186 m!721067))

(assert (=> b!777059 m!721031))

(assert (=> b!777059 m!721031))

(declare-fun m!721069 () Bool)

(assert (=> b!777059 m!721069))

(assert (=> b!777061 m!721031))

(assert (=> b!777061 m!721031))

(declare-fun m!721071 () Bool)

(assert (=> b!777061 m!721071))

(declare-fun m!721073 () Bool)

(assert (=> b!777045 m!721073))

(declare-fun m!721075 () Bool)

(assert (=> b!777056 m!721075))

(declare-fun m!721077 () Bool)

(assert (=> b!777063 m!721077))

(push 1)

(assert (not start!67186))

(assert (not b!777063))

(assert (not b!777054))

(assert (not b!777045))

(assert (not b!777048))

(assert (not b!777057))

(assert (not b!777061))

(assert (not b!777053))

(assert (not b!777050))

(assert (not b!777047))

(assert (not b!777056))

(assert (not b!777059))

(assert (not b!777049))

(assert (not b!777051))

(assert (not b!777052))

(assert (not b!777044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!777166 () Bool)

(declare-fun e!432431 () SeekEntryResult!7966)

(declare-fun lt!346260 () SeekEntryResult!7966)

(assert (=> b!777166 (= e!432431 (MissingZero!7966 (index!34234 lt!346260)))))

(declare-fun b!777167 () Bool)

(declare-fun c!86076 () Bool)

(declare-fun lt!346261 () (_ BitVec 64))

(assert (=> b!777167 (= c!86076 (= lt!346261 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432430 () SeekEntryResult!7966)

(assert (=> b!777167 (= e!432430 e!432431)))

(declare-fun b!777168 () Bool)

(assert (=> b!777168 (= e!432430 (Found!7966 (index!34234 lt!346260)))))

(declare-fun b!777169 () Bool)

(declare-fun e!432429 () SeekEntryResult!7966)

(assert (=> b!777169 (= e!432429 e!432430)))

(assert (=> b!777169 (= lt!346261 (select (arr!20366 a!3186) (index!34234 lt!346260)))))

(declare-fun c!86075 () Bool)

(assert (=> b!777169 (= c!86075 (= lt!346261 k!2102))))

(declare-fun b!777170 () Bool)

(assert (=> b!777170 (= e!432429 Undefined!7966)))

(declare-fun d!102153 () Bool)

(declare-fun lt!346262 () SeekEntryResult!7966)

(assert (=> d!102153 (and (or (is-Undefined!7966 lt!346262) (not (is-Found!7966 lt!346262)) (and (bvsge (index!34233 lt!346262) #b00000000000000000000000000000000) (bvslt (index!34233 lt!346262) (size!20787 a!3186)))) (or (is-Undefined!7966 lt!346262) (is-Found!7966 lt!346262) (not (is-MissingZero!7966 lt!346262)) (and (bvsge (index!34232 lt!346262) #b00000000000000000000000000000000) (bvslt (index!34232 lt!346262) (size!20787 a!3186)))) (or (is-Undefined!7966 lt!346262) (is-Found!7966 lt!346262) (is-MissingZero!7966 lt!346262) (not (is-MissingVacant!7966 lt!346262)) (and (bvsge (index!34235 lt!346262) #b00000000000000000000000000000000) (bvslt (index!34235 lt!346262) (size!20787 a!3186)))) (or (is-Undefined!7966 lt!346262) (ite (is-Found!7966 lt!346262) (= (select (arr!20366 a!3186) (index!34233 lt!346262)) k!2102) (ite (is-MissingZero!7966 lt!346262) (= (select (arr!20366 a!3186) (index!34232 lt!346262)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7966 lt!346262) (= (select (arr!20366 a!3186) (index!34235 lt!346262)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102153 (= lt!346262 e!432429)))

(declare-fun c!86077 () Bool)

(assert (=> d!102153 (= c!86077 (and (is-Intermediate!7966 lt!346260) (undefined!8778 lt!346260)))))

(assert (=> d!102153 (= lt!346260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102153 (validMask!0 mask!3328)))

(assert (=> d!102153 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!346262)))

(declare-fun b!777171 () Bool)

(assert (=> b!777171 (= e!432431 (seekKeyOrZeroReturnVacant!0 (x!65165 lt!346260) (index!34234 lt!346260) (index!34234 lt!346260) k!2102 a!3186 mask!3328))))

(assert (= (and d!102153 c!86077) b!777170))

(assert (= (and d!102153 (not c!86077)) b!777169))

(assert (= (and b!777169 c!86075) b!777168))

(assert (= (and b!777169 (not c!86075)) b!777167))

(assert (= (and b!777167 c!86076) b!777166))

(assert (= (and b!777167 (not c!86076)) b!777171))

(declare-fun m!721149 () Bool)

(assert (=> b!777169 m!721149))

(declare-fun m!721155 () Bool)

(assert (=> d!102153 m!721155))

(declare-fun m!721157 () Bool)

(assert (=> d!102153 m!721157))

(assert (=> d!102153 m!721065))

(declare-fun m!721161 () Bool)

(assert (=> d!102153 m!721161))

(declare-fun m!721163 () Bool)

(assert (=> d!102153 m!721163))

(declare-fun m!721167 () Bool)

(assert (=> d!102153 m!721167))

(assert (=> d!102153 m!721161))

(declare-fun m!721169 () Bool)

(assert (=> b!777171 m!721169))

(assert (=> b!777056 d!102153))

(declare-fun d!102171 () Bool)

(declare-fun res!525822 () Bool)

(declare-fun e!432440 () Bool)

(assert (=> d!102171 (=> res!525822 e!432440)))

(assert (=> d!102171 (= res!525822 (= (select (arr!20366 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!102171 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!432440)))

(declare-fun b!777184 () Bool)

(declare-fun e!432442 () Bool)

(assert (=> b!777184 (= e!432440 e!432442)))

(declare-fun res!525823 () Bool)

(assert (=> b!777184 (=> (not res!525823) (not e!432442))))

(assert (=> b!777184 (= res!525823 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20787 a!3186)))))

(declare-fun b!777185 () Bool)

(assert (=> b!777185 (= e!432442 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102171 (not res!525822)) b!777184))

(assert (= (and b!777184 res!525823) b!777185))

(declare-fun m!721171 () Bool)

(assert (=> d!102171 m!721171))

(declare-fun m!721173 () Bool)

(assert (=> b!777185 m!721173))

(assert (=> b!777045 d!102171))

(declare-fun d!102175 () Bool)

(assert (=> d!102175 (= (validKeyInArray!0 (select (arr!20366 a!3186) j!159)) (and (not (= (select (arr!20366 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20366 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!777047 d!102175))

(declare-fun b!777226 () Bool)

(declare-fun e!432468 () Bool)

(declare-fun call!35179 () Bool)

(assert (=> b!777226 (= e!432468 call!35179)))

(declare-fun b!777227 () Bool)

(declare-fun e!432469 () Bool)

(assert (=> b!777227 (= e!432468 e!432469)))

(declare-fun lt!346282 () (_ BitVec 64))

(assert (=> b!777227 (= lt!346282 (select (arr!20366 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!346281 () Unit!26826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42541 (_ BitVec 64) (_ BitVec 32)) Unit!26826)

(assert (=> b!777227 (= lt!346281 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346282 #b00000000000000000000000000000000))))

(assert (=> b!777227 (arrayContainsKey!0 a!3186 lt!346282 #b00000000000000000000000000000000)))

(declare-fun lt!346280 () Unit!26826)

(assert (=> b!777227 (= lt!346280 lt!346281)))

(declare-fun res!525842 () Bool)

(assert (=> b!777227 (= res!525842 (= (seekEntryOrOpen!0 (select (arr!20366 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7966 #b00000000000000000000000000000000)))))

(assert (=> b!777227 (=> (not res!525842) (not e!432469))))

(declare-fun d!102177 () Bool)

(declare-fun res!525841 () Bool)

(declare-fun e!432467 () Bool)

(assert (=> d!102177 (=> res!525841 e!432467)))

(assert (=> d!102177 (= res!525841 (bvsge #b00000000000000000000000000000000 (size!20787 a!3186)))))

(assert (=> d!102177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!432467)))

(declare-fun b!777228 () Bool)

(assert (=> b!777228 (= e!432469 call!35179)))

(declare-fun b!777229 () Bool)

(assert (=> b!777229 (= e!432467 e!432468)))

(declare-fun c!86093 () Bool)

(assert (=> b!777229 (= c!86093 (validKeyInArray!0 (select (arr!20366 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35176 () Bool)

(assert (=> bm!35176 (= call!35179 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102177 (not res!525841)) b!777229))

(assert (= (and b!777229 c!86093) b!777227))

(assert (= (and b!777229 (not c!86093)) b!777226))

(assert (= (and b!777227 res!525842) b!777228))

(assert (= (or b!777228 b!777226) bm!35176))

(assert (=> b!777227 m!721171))

(declare-fun m!721191 () Bool)

(assert (=> b!777227 m!721191))

(declare-fun m!721193 () Bool)

(assert (=> b!777227 m!721193))

(assert (=> b!777227 m!721171))

(declare-fun m!721195 () Bool)

(assert (=> b!777227 m!721195))

(assert (=> b!777229 m!721171))

(assert (=> b!777229 m!721171))

(declare-fun m!721197 () Bool)

(assert (=> b!777229 m!721197))

(declare-fun m!721199 () Bool)

(assert (=> bm!35176 m!721199))

(assert (=> b!777057 d!102177))

(declare-fun d!102183 () Bool)

(assert (=> d!102183 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!777053 d!102183))

(declare-fun b!777337 () Bool)

(declare-fun e!432532 () Bool)

(declare-fun e!432534 () Bool)

(assert (=> b!777337 (= e!432532 e!432534)))

(declare-fun res!525879 () Bool)

(declare-fun lt!346333 () SeekEntryResult!7966)

(assert (=> b!777337 (= res!525879 (and (is-Intermediate!7966 lt!346333) (not (undefined!8778 lt!346333)) (bvslt (x!65165 lt!346333) #b01111111111111111111111111111110) (bvsge (x!65165 lt!346333) #b00000000000000000000000000000000) (bvsge (x!65165 lt!346333) x!1131)))))

(assert (=> b!777337 (=> (not res!525879) (not e!432534))))

(declare-fun b!777338 () Bool)

(assert (=> b!777338 (and (bvsge (index!34234 lt!346333) #b00000000000000000000000000000000) (bvslt (index!34234 lt!346333) (size!20787 lt!346209)))))

(declare-fun res!525880 () Bool)

(assert (=> b!777338 (= res!525880 (= (select (arr!20366 lt!346209) (index!34234 lt!346333)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432533 () Bool)

(assert (=> b!777338 (=> res!525880 e!432533)))

(declare-fun b!777339 () Bool)

(assert (=> b!777339 (= e!432532 (bvsge (x!65165 lt!346333) #b01111111111111111111111111111110))))

(declare-fun b!777340 () Bool)

(declare-fun e!432536 () SeekEntryResult!7966)

(declare-fun e!432535 () SeekEntryResult!7966)

(assert (=> b!777340 (= e!432536 e!432535)))

(declare-fun c!86130 () Bool)

(declare-fun lt!346334 () (_ BitVec 64))

(assert (=> b!777340 (= c!86130 (or (= lt!346334 lt!346214) (= (bvadd lt!346334 lt!346334) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777342 () Bool)

(assert (=> b!777342 (and (bvsge (index!34234 lt!346333) #b00000000000000000000000000000000) (bvslt (index!34234 lt!346333) (size!20787 lt!346209)))))

(declare-fun res!525881 () Bool)

(assert (=> b!777342 (= res!525881 (= (select (arr!20366 lt!346209) (index!34234 lt!346333)) lt!346214))))

(assert (=> b!777342 (=> res!525881 e!432533)))

(assert (=> b!777342 (= e!432534 e!432533)))

(declare-fun b!777343 () Bool)

(assert (=> b!777343 (= e!432536 (Intermediate!7966 true index!1321 x!1131))))

(declare-fun b!777344 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777344 (= e!432535 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!346214 lt!346209 mask!3328))))

(declare-fun b!777345 () Bool)

(assert (=> b!777345 (= e!432535 (Intermediate!7966 false index!1321 x!1131))))

(declare-fun d!102185 () Bool)

(assert (=> d!102185 e!432532))

(declare-fun c!86131 () Bool)

(assert (=> d!102185 (= c!86131 (and (is-Intermediate!7966 lt!346333) (undefined!8778 lt!346333)))))

(assert (=> d!102185 (= lt!346333 e!432536)))

(declare-fun c!86132 () Bool)

(assert (=> d!102185 (= c!86132 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102185 (= lt!346334 (select (arr!20366 lt!346209) index!1321))))

(assert (=> d!102185 (validMask!0 mask!3328)))

(assert (=> d!102185 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346214 lt!346209 mask!3328) lt!346333)))

(declare-fun b!777341 () Bool)

(assert (=> b!777341 (and (bvsge (index!34234 lt!346333) #b00000000000000000000000000000000) (bvslt (index!34234 lt!346333) (size!20787 lt!346209)))))

(assert (=> b!777341 (= e!432533 (= (select (arr!20366 lt!346209) (index!34234 lt!346333)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102185 c!86132) b!777343))

(assert (= (and d!102185 (not c!86132)) b!777340))

(assert (= (and b!777340 c!86130) b!777345))

(assert (= (and b!777340 (not c!86130)) b!777344))

(assert (= (and d!102185 c!86131) b!777339))

(assert (= (and d!102185 (not c!86131)) b!777337))

(assert (= (and b!777337 res!525879) b!777342))

(assert (= (and b!777342 (not res!525881)) b!777338))

(assert (= (and b!777338 (not res!525880)) b!777341))

(declare-fun m!721259 () Bool)

(assert (=> b!777342 m!721259))

(assert (=> b!777338 m!721259))

(declare-fun m!721261 () Bool)

(assert (=> b!777344 m!721261))

(assert (=> b!777344 m!721261))

(declare-fun m!721263 () Bool)

(assert (=> b!777344 m!721263))

(assert (=> b!777341 m!721259))

(declare-fun m!721265 () Bool)

(assert (=> d!102185 m!721265))

(assert (=> d!102185 m!721065))

(assert (=> b!777044 d!102185))

(declare-fun b!777354 () Bool)

(declare-fun e!432543 () Bool)

(declare-fun e!432545 () Bool)

(assert (=> b!777354 (= e!432543 e!432545)))

(declare-fun res!525886 () Bool)

(declare-fun lt!346335 () SeekEntryResult!7966)

(assert (=> b!777354 (= res!525886 (and (is-Intermediate!7966 lt!346335) (not (undefined!8778 lt!346335)) (bvslt (x!65165 lt!346335) #b01111111111111111111111111111110) (bvsge (x!65165 lt!346335) #b00000000000000000000000000000000) (bvsge (x!65165 lt!346335) #b00000000000000000000000000000000)))))

(assert (=> b!777354 (=> (not res!525886) (not e!432545))))

(declare-fun b!777355 () Bool)

(assert (=> b!777355 (and (bvsge (index!34234 lt!346335) #b00000000000000000000000000000000) (bvslt (index!34234 lt!346335) (size!20787 lt!346209)))))

(declare-fun res!525887 () Bool)

(assert (=> b!777355 (= res!525887 (= (select (arr!20366 lt!346209) (index!34234 lt!346335)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432544 () Bool)

(assert (=> b!777355 (=> res!525887 e!432544)))

(declare-fun b!777356 () Bool)

(assert (=> b!777356 (= e!432543 (bvsge (x!65165 lt!346335) #b01111111111111111111111111111110))))

(declare-fun b!777357 () Bool)

(declare-fun e!432547 () SeekEntryResult!7966)

(declare-fun e!432546 () SeekEntryResult!7966)

(assert (=> b!777357 (= e!432547 e!432546)))

(declare-fun c!86135 () Bool)

(declare-fun lt!346336 () (_ BitVec 64))

(assert (=> b!777357 (= c!86135 (or (= lt!346336 lt!346214) (= (bvadd lt!346336 lt!346336) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777359 () Bool)

(assert (=> b!777359 (and (bvsge (index!34234 lt!346335) #b00000000000000000000000000000000) (bvslt (index!34234 lt!346335) (size!20787 lt!346209)))))

(declare-fun res!525888 () Bool)

(assert (=> b!777359 (= res!525888 (= (select (arr!20366 lt!346209) (index!34234 lt!346335)) lt!346214))))

(assert (=> b!777359 (=> res!525888 e!432544)))

(assert (=> b!777359 (= e!432545 e!432544)))

(declare-fun b!777360 () Bool)

(assert (=> b!777360 (= e!432547 (Intermediate!7966 true (toIndex!0 lt!346214 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!777361 () Bool)

(assert (=> b!777361 (= e!432546 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!346214 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!346214 lt!346209 mask!3328))))

(declare-fun b!777362 () Bool)

(assert (=> b!777362 (= e!432546 (Intermediate!7966 false (toIndex!0 lt!346214 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!102213 () Bool)

(assert (=> d!102213 e!432543))

(declare-fun c!86136 () Bool)

(assert (=> d!102213 (= c!86136 (and (is-Intermediate!7966 lt!346335) (undefined!8778 lt!346335)))))

(assert (=> d!102213 (= lt!346335 e!432547)))

(declare-fun c!86137 () Bool)

(assert (=> d!102213 (= c!86137 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102213 (= lt!346336 (select (arr!20366 lt!346209) (toIndex!0 lt!346214 mask!3328)))))

(assert (=> d!102213 (validMask!0 mask!3328)))

(assert (=> d!102213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346214 mask!3328) lt!346214 lt!346209 mask!3328) lt!346335)))

(declare-fun b!777358 () Bool)

(assert (=> b!777358 (and (bvsge (index!34234 lt!346335) #b00000000000000000000000000000000) (bvslt (index!34234 lt!346335) (size!20787 lt!346209)))))

(assert (=> b!777358 (= e!432544 (= (select (arr!20366 lt!346209) (index!34234 lt!346335)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102213 c!86137) b!777360))

(assert (= (and d!102213 (not c!86137)) b!777357))

(assert (= (and b!777357 c!86135) b!777362))

(assert (= (and b!777357 (not c!86135)) b!777361))

(assert (= (and d!102213 c!86136) b!777356))

(assert (= (and d!102213 (not c!86136)) b!777354))

(assert (= (and b!777354 res!525886) b!777359))

(assert (= (and b!777359 (not res!525888)) b!777355))

(assert (= (and b!777355 (not res!525887)) b!777358))

(declare-fun m!721267 () Bool)

(assert (=> b!777359 m!721267))

(assert (=> b!777355 m!721267))

(assert (=> b!777361 m!721045))

(declare-fun m!721269 () Bool)

(assert (=> b!777361 m!721269))

(assert (=> b!777361 m!721269))

(declare-fun m!721271 () Bool)

(assert (=> b!777361 m!721271))

(assert (=> b!777358 m!721267))

(assert (=> d!102213 m!721045))

(declare-fun m!721273 () Bool)

(assert (=> d!102213 m!721273))

(assert (=> d!102213 m!721065))

(assert (=> b!777044 d!102213))

(declare-fun d!102215 () Bool)

(declare-fun lt!346342 () (_ BitVec 32))

(declare-fun lt!346341 () (_ BitVec 32))

(assert (=> d!102215 (= lt!346342 (bvmul (bvxor lt!346341 (bvlshr lt!346341 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102215 (= lt!346341 ((_ extract 31 0) (bvand (bvxor lt!346214 (bvlshr lt!346214 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102215 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!525889 (let ((h!15475 ((_ extract 31 0) (bvand (bvxor lt!346214 (bvlshr lt!346214 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65173 (bvmul (bvxor h!15475 (bvlshr h!15475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65173 (bvlshr x!65173 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!525889 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!525889 #b00000000000000000000000000000000))))))

(assert (=> d!102215 (= (toIndex!0 lt!346214 mask!3328) (bvand (bvxor lt!346342 (bvlshr lt!346342 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!777044 d!102215))

(declare-fun b!777368 () Bool)

(declare-fun e!432554 () SeekEntryResult!7966)

(declare-fun lt!346343 () SeekEntryResult!7966)

(assert (=> b!777368 (= e!432554 (MissingZero!7966 (index!34234 lt!346343)))))

(declare-fun b!777369 () Bool)

(declare-fun c!86140 () Bool)

(declare-fun lt!346344 () (_ BitVec 64))

(assert (=> b!777369 (= c!86140 (= lt!346344 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432553 () SeekEntryResult!7966)

(assert (=> b!777369 (= e!432553 e!432554)))

(declare-fun b!777370 () Bool)

(assert (=> b!777370 (= e!432553 (Found!7966 (index!34234 lt!346343)))))

(declare-fun b!777371 () Bool)

(declare-fun e!432552 () SeekEntryResult!7966)

(assert (=> b!777371 (= e!432552 e!432553)))

(assert (=> b!777371 (= lt!346344 (select (arr!20366 lt!346209) (index!34234 lt!346343)))))

(declare-fun c!86139 () Bool)

(assert (=> b!777371 (= c!86139 (= lt!346344 lt!346214))))

(declare-fun b!777372 () Bool)

(assert (=> b!777372 (= e!432552 Undefined!7966)))

(declare-fun d!102217 () Bool)

(declare-fun lt!346345 () SeekEntryResult!7966)

(assert (=> d!102217 (and (or (is-Undefined!7966 lt!346345) (not (is-Found!7966 lt!346345)) (and (bvsge (index!34233 lt!346345) #b00000000000000000000000000000000) (bvslt (index!34233 lt!346345) (size!20787 lt!346209)))) (or (is-Undefined!7966 lt!346345) (is-Found!7966 lt!346345) (not (is-MissingZero!7966 lt!346345)) (and (bvsge (index!34232 lt!346345) #b00000000000000000000000000000000) (bvslt (index!34232 lt!346345) (size!20787 lt!346209)))) (or (is-Undefined!7966 lt!346345) (is-Found!7966 lt!346345) (is-MissingZero!7966 lt!346345) (not (is-MissingVacant!7966 lt!346345)) (and (bvsge (index!34235 lt!346345) #b00000000000000000000000000000000) (bvslt (index!34235 lt!346345) (size!20787 lt!346209)))) (or (is-Undefined!7966 lt!346345) (ite (is-Found!7966 lt!346345) (= (select (arr!20366 lt!346209) (index!34233 lt!346345)) lt!346214) (ite (is-MissingZero!7966 lt!346345) (= (select (arr!20366 lt!346209) (index!34232 lt!346345)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7966 lt!346345) (= (select (arr!20366 lt!346209) (index!34235 lt!346345)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102217 (= lt!346345 e!432552)))

(declare-fun c!86141 () Bool)

(assert (=> d!102217 (= c!86141 (and (is-Intermediate!7966 lt!346343) (undefined!8778 lt!346343)))))

(assert (=> d!102217 (= lt!346343 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346214 mask!3328) lt!346214 lt!346209 mask!3328))))

(assert (=> d!102217 (validMask!0 mask!3328)))

(assert (=> d!102217 (= (seekEntryOrOpen!0 lt!346214 lt!346209 mask!3328) lt!346345)))

(declare-fun b!777373 () Bool)

(assert (=> b!777373 (= e!432554 (seekKeyOrZeroReturnVacant!0 (x!65165 lt!346343) (index!34234 lt!346343) (index!34234 lt!346343) lt!346214 lt!346209 mask!3328))))

(assert (= (and d!102217 c!86141) b!777372))

(assert (= (and d!102217 (not c!86141)) b!777371))

(assert (= (and b!777371 c!86139) b!777370))

(assert (= (and b!777371 (not c!86139)) b!777369))

(assert (= (and b!777369 c!86140) b!777368))

(assert (= (and b!777369 (not c!86140)) b!777373))

(declare-fun m!721279 () Bool)

(assert (=> b!777371 m!721279))

(declare-fun m!721281 () Bool)

(assert (=> d!102217 m!721281))

(declare-fun m!721283 () Bool)

(assert (=> d!102217 m!721283))

(assert (=> d!102217 m!721065))

(assert (=> d!102217 m!721045))

(assert (=> d!102217 m!721051))

(declare-fun m!721285 () Bool)

(assert (=> d!102217 m!721285))

(assert (=> d!102217 m!721045))

(declare-fun m!721287 () Bool)

(assert (=> b!777373 m!721287))

(assert (=> b!777054 d!102217))

(declare-fun d!102219 () Bool)

(assert (=> d!102219 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67186 d!102219))

(declare-fun d!102221 () Bool)

(assert (=> d!102221 (= (array_inv!16162 a!3186) (bvsge (size!20787 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67186 d!102221))

(declare-fun b!777386 () Bool)

(declare-fun e!432562 () Bool)

(declare-fun call!35186 () Bool)

(assert (=> b!777386 (= e!432562 call!35186)))

(declare-fun b!777387 () Bool)

(declare-fun e!432563 () Bool)

(assert (=> b!777387 (= e!432562 e!432563)))

(declare-fun lt!346354 () (_ BitVec 64))

(assert (=> b!777387 (= lt!346354 (select (arr!20366 a!3186) j!159))))

(declare-fun lt!346353 () Unit!26826)

(assert (=> b!777387 (= lt!346353 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346354 j!159))))

(assert (=> b!777387 (arrayContainsKey!0 a!3186 lt!346354 #b00000000000000000000000000000000)))

(declare-fun lt!346352 () Unit!26826)

(assert (=> b!777387 (= lt!346352 lt!346353)))

(declare-fun res!525894 () Bool)

(assert (=> b!777387 (= res!525894 (= (seekEntryOrOpen!0 (select (arr!20366 a!3186) j!159) a!3186 mask!3328) (Found!7966 j!159)))))

(assert (=> b!777387 (=> (not res!525894) (not e!432563))))

(declare-fun d!102223 () Bool)

(declare-fun res!525893 () Bool)

(declare-fun e!432561 () Bool)

(assert (=> d!102223 (=> res!525893 e!432561)))

