; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67380 () Bool)

(assert start!67380)

(declare-fun b!779653 () Bool)

(declare-fun e!433718 () Bool)

(declare-fun e!433713 () Bool)

(assert (=> b!779653 (= e!433718 e!433713)))

(declare-fun res!527594 () Bool)

(assert (=> b!779653 (=> (not res!527594) (not e!433713))))

(declare-datatypes ((SeekEntryResult!7997 0))(
  ( (MissingZero!7997 (index!34356 (_ BitVec 32))) (Found!7997 (index!34357 (_ BitVec 32))) (Intermediate!7997 (undefined!8809 Bool) (index!34358 (_ BitVec 32)) (x!65302 (_ BitVec 32))) (Undefined!7997) (MissingVacant!7997 (index!34359 (_ BitVec 32))) )
))
(declare-fun lt!347425 () SeekEntryResult!7997)

(declare-fun lt!347422 () SeekEntryResult!7997)

(assert (=> b!779653 (= res!527594 (= lt!347425 lt!347422))))

(declare-fun lt!347429 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42609 0))(
  ( (array!42610 (arr!20397 (Array (_ BitVec 32) (_ BitVec 64))) (size!20818 (_ BitVec 32))) )
))
(declare-fun lt!347424 () array!42609)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42609 (_ BitVec 32)) SeekEntryResult!7997)

(assert (=> b!779653 (= lt!347422 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347429 lt!347424 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779653 (= lt!347425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347429 mask!3328) lt!347429 lt!347424 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun a!3186 () array!42609)

(assert (=> b!779653 (= lt!347429 (select (store (arr!20397 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!779653 (= lt!347424 (array!42610 (store (arr!20397 a!3186) i!1173 k!2102) (size!20818 a!3186)))))

(declare-fun b!779654 () Bool)

(declare-fun res!527587 () Bool)

(declare-fun e!433712 () Bool)

(assert (=> b!779654 (=> (not res!527587) (not e!433712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779654 (= res!527587 (validKeyInArray!0 k!2102))))

(declare-fun b!779655 () Bool)

(declare-fun res!527596 () Bool)

(assert (=> b!779655 (=> (not res!527596) (not e!433712))))

(assert (=> b!779655 (= res!527596 (and (= (size!20818 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20818 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20818 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779656 () Bool)

(declare-fun res!527590 () Bool)

(assert (=> b!779656 (=> (not res!527590) (not e!433718))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!779656 (= res!527590 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20397 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779657 () Bool)

(declare-fun res!527597 () Bool)

(declare-fun e!433715 () Bool)

(assert (=> b!779657 (=> (not res!527597) (not e!433715))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779657 (= res!527597 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20818 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20818 a!3186))))))

(declare-fun b!779658 () Bool)

(declare-fun res!527585 () Bool)

(assert (=> b!779658 (=> (not res!527585) (not e!433715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42609 (_ BitVec 32)) Bool)

(assert (=> b!779658 (= res!527585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779659 () Bool)

(assert (=> b!779659 (= e!433712 e!433715)))

(declare-fun res!527600 () Bool)

(assert (=> b!779659 (=> (not res!527600) (not e!433715))))

(declare-fun lt!347423 () SeekEntryResult!7997)

(assert (=> b!779659 (= res!527600 (or (= lt!347423 (MissingZero!7997 i!1173)) (= lt!347423 (MissingVacant!7997 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42609 (_ BitVec 32)) SeekEntryResult!7997)

(assert (=> b!779659 (= lt!347423 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!433711 () Bool)

(declare-fun lt!347426 () SeekEntryResult!7997)

(declare-fun b!779660 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42609 (_ BitVec 32)) SeekEntryResult!7997)

(assert (=> b!779660 (= e!433711 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20397 a!3186) j!159) a!3186 mask!3328) lt!347426))))

(declare-fun lt!347427 () SeekEntryResult!7997)

(declare-fun e!433717 () Bool)

(declare-fun b!779661 () Bool)

(assert (=> b!779661 (= e!433717 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20397 a!3186) j!159) a!3186 mask!3328) lt!347427))))

(declare-fun b!779662 () Bool)

(assert (=> b!779662 (= e!433717 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20397 a!3186) j!159) a!3186 mask!3328) (Found!7997 j!159)))))

(declare-fun b!779663 () Bool)

(declare-fun e!433716 () Bool)

(declare-fun e!433710 () Bool)

(assert (=> b!779663 (= e!433716 e!433710)))

(declare-fun res!527593 () Bool)

(assert (=> b!779663 (=> res!527593 e!433710)))

(declare-fun lt!347421 () SeekEntryResult!7997)

(assert (=> b!779663 (= res!527593 (or (not (= lt!347421 lt!347426)) (= (select (store (arr!20397 a!3186) i!1173 k!2102) index!1321) lt!347429) (not (= (select (store (arr!20397 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!779663 (= lt!347421 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20397 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779664 () Bool)

(assert (=> b!779664 (= e!433710 (= lt!347421 (MissingVacant!7997 resIntermediateIndex!5)))))

(declare-fun lt!347420 () SeekEntryResult!7997)

(assert (=> b!779664 (= lt!347420 lt!347421)))

(declare-fun b!779665 () Bool)

(declare-fun res!527591 () Bool)

(assert (=> b!779665 (=> (not res!527591) (not e!433712))))

(declare-fun arrayContainsKey!0 (array!42609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779665 (= res!527591 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779666 () Bool)

(assert (=> b!779666 (= e!433715 e!433718)))

(declare-fun res!527599 () Bool)

(assert (=> b!779666 (=> (not res!527599) (not e!433718))))

(assert (=> b!779666 (= res!527599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20397 a!3186) j!159) mask!3328) (select (arr!20397 a!3186) j!159) a!3186 mask!3328) lt!347427))))

(assert (=> b!779666 (= lt!347427 (Intermediate!7997 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!527586 () Bool)

(assert (=> start!67380 (=> (not res!527586) (not e!433712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67380 (= res!527586 (validMask!0 mask!3328))))

(assert (=> start!67380 e!433712))

(assert (=> start!67380 true))

(declare-fun array_inv!16193 (array!42609) Bool)

(assert (=> start!67380 (array_inv!16193 a!3186)))

(declare-fun b!779667 () Bool)

(declare-fun res!527588 () Bool)

(assert (=> b!779667 (=> (not res!527588) (not e!433718))))

(assert (=> b!779667 (= res!527588 e!433717)))

(declare-fun c!86437 () Bool)

(assert (=> b!779667 (= c!86437 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779668 () Bool)

(declare-fun res!527598 () Bool)

(assert (=> b!779668 (=> (not res!527598) (not e!433712))))

(assert (=> b!779668 (= res!527598 (validKeyInArray!0 (select (arr!20397 a!3186) j!159)))))

(declare-fun b!779669 () Bool)

(declare-fun res!527589 () Bool)

(assert (=> b!779669 (=> (not res!527589) (not e!433715))))

(declare-datatypes ((List!14399 0))(
  ( (Nil!14396) (Cons!14395 (h!15509 (_ BitVec 64)) (t!20714 List!14399)) )
))
(declare-fun arrayNoDuplicates!0 (array!42609 (_ BitVec 32) List!14399) Bool)

(assert (=> b!779669 (= res!527589 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14396))))

(declare-fun b!779670 () Bool)

(assert (=> b!779670 (= e!433713 (not e!433716))))

(declare-fun res!527595 () Bool)

(assert (=> b!779670 (=> res!527595 e!433716)))

(assert (=> b!779670 (= res!527595 (or (not (is-Intermediate!7997 lt!347422)) (bvslt x!1131 (x!65302 lt!347422)) (not (= x!1131 (x!65302 lt!347422))) (not (= index!1321 (index!34358 lt!347422)))))))

(assert (=> b!779670 e!433711))

(declare-fun res!527592 () Bool)

(assert (=> b!779670 (=> (not res!527592) (not e!433711))))

(assert (=> b!779670 (= res!527592 (= lt!347420 lt!347426))))

(assert (=> b!779670 (= lt!347426 (Found!7997 j!159))))

(assert (=> b!779670 (= lt!347420 (seekEntryOrOpen!0 (select (arr!20397 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!779670 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26888 0))(
  ( (Unit!26889) )
))
(declare-fun lt!347428 () Unit!26888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26888)

(assert (=> b!779670 (= lt!347428 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67380 res!527586) b!779655))

(assert (= (and b!779655 res!527596) b!779668))

(assert (= (and b!779668 res!527598) b!779654))

(assert (= (and b!779654 res!527587) b!779665))

(assert (= (and b!779665 res!527591) b!779659))

(assert (= (and b!779659 res!527600) b!779658))

(assert (= (and b!779658 res!527585) b!779669))

(assert (= (and b!779669 res!527589) b!779657))

(assert (= (and b!779657 res!527597) b!779666))

(assert (= (and b!779666 res!527599) b!779656))

(assert (= (and b!779656 res!527590) b!779667))

(assert (= (and b!779667 c!86437) b!779661))

(assert (= (and b!779667 (not c!86437)) b!779662))

(assert (= (and b!779667 res!527588) b!779653))

(assert (= (and b!779653 res!527594) b!779670))

(assert (= (and b!779670 res!527592) b!779660))

(assert (= (and b!779670 (not res!527595)) b!779663))

(assert (= (and b!779663 (not res!527593)) b!779664))

(declare-fun m!723143 () Bool)

(assert (=> b!779658 m!723143))

(declare-fun m!723145 () Bool)

(assert (=> start!67380 m!723145))

(declare-fun m!723147 () Bool)

(assert (=> start!67380 m!723147))

(declare-fun m!723149 () Bool)

(assert (=> b!779666 m!723149))

(assert (=> b!779666 m!723149))

(declare-fun m!723151 () Bool)

(assert (=> b!779666 m!723151))

(assert (=> b!779666 m!723151))

(assert (=> b!779666 m!723149))

(declare-fun m!723153 () Bool)

(assert (=> b!779666 m!723153))

(declare-fun m!723155 () Bool)

(assert (=> b!779665 m!723155))

(assert (=> b!779668 m!723149))

(assert (=> b!779668 m!723149))

(declare-fun m!723157 () Bool)

(assert (=> b!779668 m!723157))

(declare-fun m!723159 () Bool)

(assert (=> b!779653 m!723159))

(declare-fun m!723161 () Bool)

(assert (=> b!779653 m!723161))

(assert (=> b!779653 m!723161))

(declare-fun m!723163 () Bool)

(assert (=> b!779653 m!723163))

(declare-fun m!723165 () Bool)

(assert (=> b!779653 m!723165))

(declare-fun m!723167 () Bool)

(assert (=> b!779653 m!723167))

(declare-fun m!723169 () Bool)

(assert (=> b!779654 m!723169))

(assert (=> b!779660 m!723149))

(assert (=> b!779660 m!723149))

(declare-fun m!723171 () Bool)

(assert (=> b!779660 m!723171))

(declare-fun m!723173 () Bool)

(assert (=> b!779669 m!723173))

(assert (=> b!779663 m!723165))

(declare-fun m!723175 () Bool)

(assert (=> b!779663 m!723175))

(assert (=> b!779663 m!723149))

(assert (=> b!779663 m!723149))

(declare-fun m!723177 () Bool)

(assert (=> b!779663 m!723177))

(assert (=> b!779670 m!723149))

(assert (=> b!779670 m!723149))

(declare-fun m!723179 () Bool)

(assert (=> b!779670 m!723179))

(declare-fun m!723181 () Bool)

(assert (=> b!779670 m!723181))

(declare-fun m!723183 () Bool)

(assert (=> b!779670 m!723183))

(declare-fun m!723185 () Bool)

(assert (=> b!779656 m!723185))

(assert (=> b!779662 m!723149))

(assert (=> b!779662 m!723149))

(assert (=> b!779662 m!723177))

(assert (=> b!779661 m!723149))

(assert (=> b!779661 m!723149))

(declare-fun m!723187 () Bool)

(assert (=> b!779661 m!723187))

(declare-fun m!723189 () Bool)

(assert (=> b!779659 m!723189))

(push 1)

(assert (not start!67380))

(assert (not b!779661))

(assert (not b!779665))

(assert (not b!779668))

(assert (not b!779670))

(assert (not b!779659))

(assert (not b!779660))

(assert (not b!779666))

(assert (not b!779669))

(assert (not b!779654))

(assert (not b!779662))

(assert (not b!779658))

(assert (not b!779653))

(assert (not b!779663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!779848 () Bool)

(declare-fun lt!347505 () SeekEntryResult!7997)

(assert (=> b!779848 (and (bvsge (index!34358 lt!347505) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347505) (size!20818 a!3186)))))

(declare-fun res!527727 () Bool)

(assert (=> b!779848 (= res!527727 (= (select (arr!20397 a!3186) (index!34358 lt!347505)) (select (arr!20397 a!3186) j!159)))))

(declare-fun e!433814 () Bool)

(assert (=> b!779848 (=> res!527727 e!433814)))

(declare-fun e!433815 () Bool)

(assert (=> b!779848 (= e!433815 e!433814)))

(declare-fun b!779849 () Bool)

(declare-fun e!433817 () SeekEntryResult!7997)

(assert (=> b!779849 (= e!433817 (Intermediate!7997 false index!1321 x!1131))))

(declare-fun b!779850 () Bool)

(declare-fun e!433816 () SeekEntryResult!7997)

(assert (=> b!779850 (= e!433816 e!433817)))

(declare-fun lt!347504 () (_ BitVec 64))

(declare-fun c!86466 () Bool)

(assert (=> b!779850 (= c!86466 (or (= lt!347504 (select (arr!20397 a!3186) j!159)) (= (bvadd lt!347504 lt!347504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102405 () Bool)

(declare-fun e!433818 () Bool)

(assert (=> d!102405 e!433818))

(declare-fun c!86467 () Bool)

(assert (=> d!102405 (= c!86467 (and (is-Intermediate!7997 lt!347505) (undefined!8809 lt!347505)))))

(assert (=> d!102405 (= lt!347505 e!433816)))

(declare-fun c!86465 () Bool)

(assert (=> d!102405 (= c!86465 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102405 (= lt!347504 (select (arr!20397 a!3186) index!1321))))

(assert (=> d!102405 (validMask!0 mask!3328)))

(assert (=> d!102405 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20397 a!3186) j!159) a!3186 mask!3328) lt!347505)))

(declare-fun b!779851 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779851 (= e!433817 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20397 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779852 () Bool)

(assert (=> b!779852 (= e!433816 (Intermediate!7997 true index!1321 x!1131))))

(declare-fun b!779853 () Bool)

(assert (=> b!779853 (= e!433818 e!433815)))

(declare-fun res!527725 () Bool)

(assert (=> b!779853 (= res!527725 (and (is-Intermediate!7997 lt!347505) (not (undefined!8809 lt!347505)) (bvslt (x!65302 lt!347505) #b01111111111111111111111111111110) (bvsge (x!65302 lt!347505) #b00000000000000000000000000000000) (bvsge (x!65302 lt!347505) x!1131)))))

(assert (=> b!779853 (=> (not res!527725) (not e!433815))))

(declare-fun b!779854 () Bool)

(assert (=> b!779854 (and (bvsge (index!34358 lt!347505) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347505) (size!20818 a!3186)))))

(declare-fun res!527726 () Bool)

(assert (=> b!779854 (= res!527726 (= (select (arr!20397 a!3186) (index!34358 lt!347505)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779854 (=> res!527726 e!433814)))

(declare-fun b!779855 () Bool)

(assert (=> b!779855 (and (bvsge (index!34358 lt!347505) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347505) (size!20818 a!3186)))))

(assert (=> b!779855 (= e!433814 (= (select (arr!20397 a!3186) (index!34358 lt!347505)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!779856 () Bool)

(assert (=> b!779856 (= e!433818 (bvsge (x!65302 lt!347505) #b01111111111111111111111111111110))))

(assert (= (and d!102405 c!86465) b!779852))

(assert (= (and d!102405 (not c!86465)) b!779850))

(assert (= (and b!779850 c!86466) b!779849))

(assert (= (and b!779850 (not c!86466)) b!779851))

(assert (= (and d!102405 c!86467) b!779856))

(assert (= (and d!102405 (not c!86467)) b!779853))

(assert (= (and b!779853 res!527725) b!779848))

(assert (= (and b!779848 (not res!527727)) b!779854))

(assert (= (and b!779854 (not res!527726)) b!779855))

(declare-fun m!723313 () Bool)

(assert (=> b!779851 m!723313))

(assert (=> b!779851 m!723313))

(assert (=> b!779851 m!723149))

(declare-fun m!723315 () Bool)

(assert (=> b!779851 m!723315))

(declare-fun m!723317 () Bool)

(assert (=> b!779848 m!723317))

(assert (=> b!779854 m!723317))

(declare-fun m!723319 () Bool)

(assert (=> d!102405 m!723319))

(assert (=> d!102405 m!723145))

(assert (=> b!779855 m!723317))

(assert (=> b!779661 d!102405))

(declare-fun b!779920 () Bool)

(declare-fun e!433856 () SeekEntryResult!7997)

(assert (=> b!779920 (= e!433856 (Found!7997 resIntermediateIndex!5))))

(declare-fun b!779921 () Bool)

(declare-fun c!86492 () Bool)

(declare-fun lt!347536 () (_ BitVec 64))

(assert (=> b!779921 (= c!86492 (= lt!347536 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433857 () SeekEntryResult!7997)

(assert (=> b!779921 (= e!433856 e!433857)))

(declare-fun b!779922 () Bool)

(assert (=> b!779922 (= e!433857 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20397 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779923 () Bool)

(assert (=> b!779923 (= e!433857 (MissingVacant!7997 resIntermediateIndex!5))))

(declare-fun b!779924 () Bool)

(declare-fun e!433855 () SeekEntryResult!7997)

(assert (=> b!779924 (= e!433855 Undefined!7997)))

(declare-fun b!779925 () Bool)

(assert (=> b!779925 (= e!433855 e!433856)))

(declare-fun c!86494 () Bool)

(assert (=> b!779925 (= c!86494 (= lt!347536 (select (arr!20397 a!3186) j!159)))))

(declare-fun d!102421 () Bool)

(declare-fun lt!347535 () SeekEntryResult!7997)

(assert (=> d!102421 (and (or (is-Undefined!7997 lt!347535) (not (is-Found!7997 lt!347535)) (and (bvsge (index!34357 lt!347535) #b00000000000000000000000000000000) (bvslt (index!34357 lt!347535) (size!20818 a!3186)))) (or (is-Undefined!7997 lt!347535) (is-Found!7997 lt!347535) (not (is-MissingVacant!7997 lt!347535)) (not (= (index!34359 lt!347535) resIntermediateIndex!5)) (and (bvsge (index!34359 lt!347535) #b00000000000000000000000000000000) (bvslt (index!34359 lt!347535) (size!20818 a!3186)))) (or (is-Undefined!7997 lt!347535) (ite (is-Found!7997 lt!347535) (= (select (arr!20397 a!3186) (index!34357 lt!347535)) (select (arr!20397 a!3186) j!159)) (and (is-MissingVacant!7997 lt!347535) (= (index!34359 lt!347535) resIntermediateIndex!5) (= (select (arr!20397 a!3186) (index!34359 lt!347535)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102421 (= lt!347535 e!433855)))

(declare-fun c!86493 () Bool)

(assert (=> d!102421 (= c!86493 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102421 (= lt!347536 (select (arr!20397 a!3186) resIntermediateIndex!5))))

(assert (=> d!102421 (validMask!0 mask!3328)))

(assert (=> d!102421 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20397 a!3186) j!159) a!3186 mask!3328) lt!347535)))

(assert (= (and d!102421 c!86493) b!779924))

(assert (= (and d!102421 (not c!86493)) b!779925))

(assert (= (and b!779925 c!86494) b!779920))

(assert (= (and b!779925 (not c!86494)) b!779921))

(assert (= (and b!779921 c!86492) b!779923))

(assert (= (and b!779921 (not c!86492)) b!779922))

(declare-fun m!723341 () Bool)

(assert (=> b!779922 m!723341))

(assert (=> b!779922 m!723341))

(assert (=> b!779922 m!723149))

(declare-fun m!723343 () Bool)

(assert (=> b!779922 m!723343))

(declare-fun m!723345 () Bool)

(assert (=> d!102421 m!723345))

(declare-fun m!723347 () Bool)

(assert (=> d!102421 m!723347))

(assert (=> d!102421 m!723185))

(assert (=> d!102421 m!723145))

(assert (=> b!779660 d!102421))

(declare-fun b!779977 () Bool)

(declare-fun e!433890 () SeekEntryResult!7997)

(declare-fun lt!347554 () SeekEntryResult!7997)

(assert (=> b!779977 (= e!433890 (Found!7997 (index!34358 lt!347554)))))

(declare-fun b!779978 () Bool)

(declare-fun e!433889 () SeekEntryResult!7997)

(assert (=> b!779978 (= e!433889 (MissingZero!7997 (index!34358 lt!347554)))))

(declare-fun b!779979 () Bool)

(declare-fun c!86516 () Bool)

(declare-fun lt!347555 () (_ BitVec 64))

(assert (=> b!779979 (= c!86516 (= lt!347555 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779979 (= e!433890 e!433889)))

(declare-fun b!779981 () Bool)

(assert (=> b!779981 (= e!433889 (seekKeyOrZeroReturnVacant!0 (x!65302 lt!347554) (index!34358 lt!347554) (index!34358 lt!347554) (select (arr!20397 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779982 () Bool)

(declare-fun e!433888 () SeekEntryResult!7997)

(assert (=> b!779982 (= e!433888 e!433890)))

(assert (=> b!779982 (= lt!347555 (select (arr!20397 a!3186) (index!34358 lt!347554)))))

(declare-fun c!86518 () Bool)

(assert (=> b!779982 (= c!86518 (= lt!347555 (select (arr!20397 a!3186) j!159)))))

(declare-fun b!779980 () Bool)

(assert (=> b!779980 (= e!433888 Undefined!7997)))

(declare-fun d!102429 () Bool)

(declare-fun lt!347553 () SeekEntryResult!7997)

(assert (=> d!102429 (and (or (is-Undefined!7997 lt!347553) (not (is-Found!7997 lt!347553)) (and (bvsge (index!34357 lt!347553) #b00000000000000000000000000000000) (bvslt (index!34357 lt!347553) (size!20818 a!3186)))) (or (is-Undefined!7997 lt!347553) (is-Found!7997 lt!347553) (not (is-MissingZero!7997 lt!347553)) (and (bvsge (index!34356 lt!347553) #b00000000000000000000000000000000) (bvslt (index!34356 lt!347553) (size!20818 a!3186)))) (or (is-Undefined!7997 lt!347553) (is-Found!7997 lt!347553) (is-MissingZero!7997 lt!347553) (not (is-MissingVacant!7997 lt!347553)) (and (bvsge (index!34359 lt!347553) #b00000000000000000000000000000000) (bvslt (index!34359 lt!347553) (size!20818 a!3186)))) (or (is-Undefined!7997 lt!347553) (ite (is-Found!7997 lt!347553) (= (select (arr!20397 a!3186) (index!34357 lt!347553)) (select (arr!20397 a!3186) j!159)) (ite (is-MissingZero!7997 lt!347553) (= (select (arr!20397 a!3186) (index!34356 lt!347553)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7997 lt!347553) (= (select (arr!20397 a!3186) (index!34359 lt!347553)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102429 (= lt!347553 e!433888)))

(declare-fun c!86517 () Bool)

(assert (=> d!102429 (= c!86517 (and (is-Intermediate!7997 lt!347554) (undefined!8809 lt!347554)))))

(assert (=> d!102429 (= lt!347554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20397 a!3186) j!159) mask!3328) (select (arr!20397 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102429 (validMask!0 mask!3328)))

(assert (=> d!102429 (= (seekEntryOrOpen!0 (select (arr!20397 a!3186) j!159) a!3186 mask!3328) lt!347553)))

(assert (= (and d!102429 c!86517) b!779980))

(assert (= (and d!102429 (not c!86517)) b!779982))

(assert (= (and b!779982 c!86518) b!779977))

(assert (= (and b!779982 (not c!86518)) b!779979))

(assert (= (and b!779979 c!86516) b!779978))

(assert (= (and b!779979 (not c!86516)) b!779981))

(assert (=> b!779981 m!723149))

(declare-fun m!723367 () Bool)

(assert (=> b!779981 m!723367))

(declare-fun m!723369 () Bool)

(assert (=> b!779982 m!723369))

(declare-fun m!723371 () Bool)

(assert (=> d!102429 m!723371))

(assert (=> d!102429 m!723151))

(assert (=> d!102429 m!723149))

(assert (=> d!102429 m!723153))

(declare-fun m!723373 () Bool)

(assert (=> d!102429 m!723373))

(declare-fun m!723375 () Bool)

(assert (=> d!102429 m!723375))

(assert (=> d!102429 m!723145))

(assert (=> d!102429 m!723149))

(assert (=> d!102429 m!723151))

(assert (=> b!779670 d!102429))

(declare-fun b!780015 () Bool)

(declare-fun e!433910 () Bool)

(declare-fun call!35223 () Bool)

(assert (=> b!780015 (= e!433910 call!35223)))

(declare-fun b!780016 () Bool)

(declare-fun e!433911 () Bool)

(declare-fun e!433909 () Bool)

(assert (=> b!780016 (= e!433911 e!433909)))

(declare-fun c!86533 () Bool)

(assert (=> b!780016 (= c!86533 (validKeyInArray!0 (select (arr!20397 a!3186) j!159)))))

(declare-fun bm!35220 () Bool)

(assert (=> bm!35220 (= call!35223 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!780017 () Bool)

(assert (=> b!780017 (= e!433909 e!433910)))

(declare-fun lt!347573 () (_ BitVec 64))

(assert (=> b!780017 (= lt!347573 (select (arr!20397 a!3186) j!159))))

(declare-fun lt!347574 () Unit!26888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42609 (_ BitVec 64) (_ BitVec 32)) Unit!26888)

(assert (=> b!780017 (= lt!347574 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347573 j!159))))

(assert (=> b!780017 (arrayContainsKey!0 a!3186 lt!347573 #b00000000000000000000000000000000)))

(declare-fun lt!347572 () Unit!26888)

(assert (=> b!780017 (= lt!347572 lt!347574)))

(declare-fun res!527756 () Bool)

(assert (=> b!780017 (= res!527756 (= (seekEntryOrOpen!0 (select (arr!20397 a!3186) j!159) a!3186 mask!3328) (Found!7997 j!159)))))

(assert (=> b!780017 (=> (not res!527756) (not e!433910))))

(declare-fun b!780018 () Bool)

(assert (=> b!780018 (= e!433909 call!35223)))

(declare-fun d!102441 () Bool)

(declare-fun res!527757 () Bool)

(assert (=> d!102441 (=> res!527757 e!433911)))

(assert (=> d!102441 (= res!527757 (bvsge j!159 (size!20818 a!3186)))))

(assert (=> d!102441 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!433911)))

(assert (= (and d!102441 (not res!527757)) b!780016))

(assert (= (and b!780016 c!86533) b!780017))

(assert (= (and b!780016 (not c!86533)) b!780018))

(assert (= (and b!780017 res!527756) b!780015))

(assert (= (or b!780015 b!780018) bm!35220))

(assert (=> b!780016 m!723149))

(assert (=> b!780016 m!723149))

(assert (=> b!780016 m!723157))

(declare-fun m!723401 () Bool)

(assert (=> bm!35220 m!723401))

(assert (=> b!780017 m!723149))

(declare-fun m!723403 () Bool)

(assert (=> b!780017 m!723403))

(declare-fun m!723405 () Bool)

(assert (=> b!780017 m!723405))

(assert (=> b!780017 m!723149))

(assert (=> b!780017 m!723179))

(assert (=> b!779670 d!102441))

(declare-fun d!102447 () Bool)

(assert (=> d!102447 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347585 () Unit!26888)

(declare-fun choose!38 (array!42609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26888)

(assert (=> d!102447 (= lt!347585 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102447 (validMask!0 mask!3328)))

(assert (=> d!102447 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!347585)))

(declare-fun bs!21715 () Bool)

(assert (= bs!21715 d!102447))

(assert (=> bs!21715 m!723181))

(declare-fun m!723413 () Bool)

(assert (=> bs!21715 m!723413))

(assert (=> bs!21715 m!723145))

(assert (=> b!779670 d!102447))

(declare-fun b!780037 () Bool)

(declare-fun e!433926 () SeekEntryResult!7997)

(declare-fun lt!347590 () SeekEntryResult!7997)

(assert (=> b!780037 (= e!433926 (Found!7997 (index!34358 lt!347590)))))

(declare-fun b!780038 () Bool)

(declare-fun e!433925 () SeekEntryResult!7997)

(assert (=> b!780038 (= e!433925 (MissingZero!7997 (index!34358 lt!347590)))))

(declare-fun b!780039 () Bool)

(declare-fun c!86540 () Bool)

(declare-fun lt!347591 () (_ BitVec 64))

(assert (=> b!780039 (= c!86540 (= lt!347591 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780039 (= e!433926 e!433925)))

(declare-fun b!780041 () Bool)

(assert (=> b!780041 (= e!433925 (seekKeyOrZeroReturnVacant!0 (x!65302 lt!347590) (index!34358 lt!347590) (index!34358 lt!347590) k!2102 a!3186 mask!3328))))

(declare-fun b!780042 () Bool)

(declare-fun e!433924 () SeekEntryResult!7997)

(assert (=> b!780042 (= e!433924 e!433926)))

(assert (=> b!780042 (= lt!347591 (select (arr!20397 a!3186) (index!34358 lt!347590)))))

(declare-fun c!86542 () Bool)

(assert (=> b!780042 (= c!86542 (= lt!347591 k!2102))))

(declare-fun b!780040 () Bool)

(assert (=> b!780040 (= e!433924 Undefined!7997)))

(declare-fun d!102451 () Bool)

(declare-fun lt!347589 () SeekEntryResult!7997)

(assert (=> d!102451 (and (or (is-Undefined!7997 lt!347589) (not (is-Found!7997 lt!347589)) (and (bvsge (index!34357 lt!347589) #b00000000000000000000000000000000) (bvslt (index!34357 lt!347589) (size!20818 a!3186)))) (or (is-Undefined!7997 lt!347589) (is-Found!7997 lt!347589) (not (is-MissingZero!7997 lt!347589)) (and (bvsge (index!34356 lt!347589) #b00000000000000000000000000000000) (bvslt (index!34356 lt!347589) (size!20818 a!3186)))) (or (is-Undefined!7997 lt!347589) (is-Found!7997 lt!347589) (is-MissingZero!7997 lt!347589) (not (is-MissingVacant!7997 lt!347589)) (and (bvsge (index!34359 lt!347589) #b00000000000000000000000000000000) (bvslt (index!34359 lt!347589) (size!20818 a!3186)))) (or (is-Undefined!7997 lt!347589) (ite (is-Found!7997 lt!347589) (= (select (arr!20397 a!3186) (index!34357 lt!347589)) k!2102) (ite (is-MissingZero!7997 lt!347589) (= (select (arr!20397 a!3186) (index!34356 lt!347589)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7997 lt!347589) (= (select (arr!20397 a!3186) (index!34359 lt!347589)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102451 (= lt!347589 e!433924)))

(declare-fun c!86541 () Bool)

(assert (=> d!102451 (= c!86541 (and (is-Intermediate!7997 lt!347590) (undefined!8809 lt!347590)))))

(assert (=> d!102451 (= lt!347590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102451 (validMask!0 mask!3328)))

(assert (=> d!102451 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!347589)))

(assert (= (and d!102451 c!86541) b!780040))

(assert (= (and d!102451 (not c!86541)) b!780042))

(assert (= (and b!780042 c!86542) b!780037))

(assert (= (and b!780042 (not c!86542)) b!780039))

(assert (= (and b!780039 c!86540) b!780038))

(assert (= (and b!780039 (not c!86540)) b!780041))

(declare-fun m!723421 () Bool)

(assert (=> b!780041 m!723421))

(declare-fun m!723423 () Bool)

(assert (=> b!780042 m!723423))

(declare-fun m!723425 () Bool)

(assert (=> d!102451 m!723425))

(declare-fun m!723427 () Bool)

(assert (=> d!102451 m!723427))

(declare-fun m!723429 () Bool)

(assert (=> d!102451 m!723429))

(declare-fun m!723431 () Bool)

(assert (=> d!102451 m!723431))

(declare-fun m!723433 () Bool)

(assert (=> d!102451 m!723433))

(assert (=> d!102451 m!723145))

(assert (=> d!102451 m!723427))

(assert (=> b!779659 d!102451))

(declare-fun b!780043 () Bool)

(declare-fun e!433928 () Bool)

(declare-fun call!35227 () Bool)

(assert (=> b!780043 (= e!433928 call!35227)))

(declare-fun b!780044 () Bool)

(declare-fun e!433929 () Bool)

(declare-fun e!433927 () Bool)

(assert (=> b!780044 (= e!433929 e!433927)))

(declare-fun c!86543 () Bool)

(assert (=> b!780044 (= c!86543 (validKeyInArray!0 (select (arr!20397 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35224 () Bool)

(assert (=> bm!35224 (= call!35227 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!780045 () Bool)

(assert (=> b!780045 (= e!433927 e!433928)))

(declare-fun lt!347593 () (_ BitVec 64))

(assert (=> b!780045 (= lt!347593 (select (arr!20397 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!347594 () Unit!26888)

(assert (=> b!780045 (= lt!347594 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347593 #b00000000000000000000000000000000))))

(assert (=> b!780045 (arrayContainsKey!0 a!3186 lt!347593 #b00000000000000000000000000000000)))

(declare-fun lt!347592 () Unit!26888)

(assert (=> b!780045 (= lt!347592 lt!347594)))

(declare-fun res!527764 () Bool)

(assert (=> b!780045 (= res!527764 (= (seekEntryOrOpen!0 (select (arr!20397 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7997 #b00000000000000000000000000000000)))))

(assert (=> b!780045 (=> (not res!527764) (not e!433928))))

(declare-fun b!780046 () Bool)

(assert (=> b!780046 (= e!433927 call!35227)))

(declare-fun d!102457 () Bool)

(declare-fun res!527765 () Bool)

(assert (=> d!102457 (=> res!527765 e!433929)))

(assert (=> d!102457 (= res!527765 (bvsge #b00000000000000000000000000000000 (size!20818 a!3186)))))

(assert (=> d!102457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!433929)))

(assert (= (and d!102457 (not res!527765)) b!780044))

(assert (= (and b!780044 c!86543) b!780045))

(assert (= (and b!780044 (not c!86543)) b!780046))

(assert (= (and b!780045 res!527764) b!780043))

(assert (= (or b!780043 b!780046) bm!35224))

(declare-fun m!723435 () Bool)

(assert (=> b!780044 m!723435))

(assert (=> b!780044 m!723435))

(declare-fun m!723437 () Bool)

(assert (=> b!780044 m!723437))

(declare-fun m!723439 () Bool)

(assert (=> bm!35224 m!723439))

(assert (=> b!780045 m!723435))

(declare-fun m!723441 () Bool)

(assert (=> b!780045 m!723441))

(declare-fun m!723443 () Bool)

(assert (=> b!780045 m!723443))

(assert (=> b!780045 m!723435))

(declare-fun m!723445 () Bool)

(assert (=> b!780045 m!723445))

(assert (=> b!779658 d!102457))

(declare-fun b!780081 () Bool)

(declare-fun e!433955 () Bool)

(declare-fun e!433956 () Bool)

(assert (=> b!780081 (= e!433955 e!433956)))

(declare-fun c!86552 () Bool)

(assert (=> b!780081 (= c!86552 (validKeyInArray!0 (select (arr!20397 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35227 () Bool)

(declare-fun call!35230 () Bool)

(assert (=> bm!35227 (= call!35230 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86552 (Cons!14395 (select (arr!20397 a!3186) #b00000000000000000000000000000000) Nil!14396) Nil!14396)))))

(declare-fun b!780082 () Bool)

(declare-fun e!433954 () Bool)

(assert (=> b!780082 (= e!433954 e!433955)))

(declare-fun res!527786 () Bool)

(assert (=> b!780082 (=> (not res!527786) (not e!433955))))

(declare-fun e!433957 () Bool)

(assert (=> b!780082 (= res!527786 (not e!433957))))

(declare-fun res!527785 () Bool)

(assert (=> b!780082 (=> (not res!527785) (not e!433957))))

(assert (=> b!780082 (= res!527785 (validKeyInArray!0 (select (arr!20397 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!780083 () Bool)

(declare-fun contains!4104 (List!14399 (_ BitVec 64)) Bool)

(assert (=> b!780083 (= e!433957 (contains!4104 Nil!14396 (select (arr!20397 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102459 () Bool)

(declare-fun res!527787 () Bool)

(assert (=> d!102459 (=> res!527787 e!433954)))

(assert (=> d!102459 (= res!527787 (bvsge #b00000000000000000000000000000000 (size!20818 a!3186)))))

(assert (=> d!102459 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14396) e!433954)))

(declare-fun b!780084 () Bool)

(assert (=> b!780084 (= e!433956 call!35230)))

(declare-fun b!780085 () Bool)

(assert (=> b!780085 (= e!433956 call!35230)))

(assert (= (and d!102459 (not res!527787)) b!780082))

(assert (= (and b!780082 res!527785) b!780083))

(assert (= (and b!780082 res!527786) b!780081))

(assert (= (and b!780081 c!86552) b!780084))

(assert (= (and b!780081 (not c!86552)) b!780085))

(assert (= (or b!780084 b!780085) bm!35227))

(assert (=> b!780081 m!723435))

(assert (=> b!780081 m!723435))

(assert (=> b!780081 m!723437))

(assert (=> bm!35227 m!723435))

(declare-fun m!723465 () Bool)

(assert (=> bm!35227 m!723465))

(assert (=> b!780082 m!723435))

(assert (=> b!780082 m!723435))

(assert (=> b!780082 m!723437))

(assert (=> b!780083 m!723435))

(assert (=> b!780083 m!723435))

(declare-fun m!723467 () Bool)

(assert (=> b!780083 m!723467))

(assert (=> b!779669 d!102459))

(declare-fun d!102471 () Bool)

(assert (=> d!102471 (= (validKeyInArray!0 (select (arr!20397 a!3186) j!159)) (and (not (= (select (arr!20397 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20397 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!779668 d!102471))

(declare-fun d!102473 () Bool)

(assert (=> d!102473 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67380 d!102473))

(declare-fun d!102483 () Bool)

(assert (=> d!102483 (= (array_inv!16193 a!3186) (bvsge (size!20818 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67380 d!102483))

(declare-fun b!780114 () Bool)

(declare-fun lt!347616 () SeekEntryResult!7997)

(assert (=> b!780114 (and (bvsge (index!34358 lt!347616) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347616) (size!20818 a!3186)))))

(declare-fun res!527804 () Bool)

(assert (=> b!780114 (= res!527804 (= (select (arr!20397 a!3186) (index!34358 lt!347616)) (select (arr!20397 a!3186) j!159)))))

(declare-fun e!433978 () Bool)

(assert (=> b!780114 (=> res!527804 e!433978)))

(declare-fun e!433979 () Bool)

(assert (=> b!780114 (= e!433979 e!433978)))

(declare-fun b!780115 () Bool)

(declare-fun e!433981 () SeekEntryResult!7997)

(assert (=> b!780115 (= e!433981 (Intermediate!7997 false (toIndex!0 (select (arr!20397 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780116 () Bool)

(declare-fun e!433980 () SeekEntryResult!7997)

(assert (=> b!780116 (= e!433980 e!433981)))

(declare-fun lt!347615 () (_ BitVec 64))

(declare-fun c!86561 () Bool)

(assert (=> b!780116 (= c!86561 (or (= lt!347615 (select (arr!20397 a!3186) j!159)) (= (bvadd lt!347615 lt!347615) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102485 () Bool)

(declare-fun e!433982 () Bool)

(assert (=> d!102485 e!433982))

(declare-fun c!86562 () Bool)

(assert (=> d!102485 (= c!86562 (and (is-Intermediate!7997 lt!347616) (undefined!8809 lt!347616)))))

(assert (=> d!102485 (= lt!347616 e!433980)))

(declare-fun c!86560 () Bool)

(assert (=> d!102485 (= c!86560 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102485 (= lt!347615 (select (arr!20397 a!3186) (toIndex!0 (select (arr!20397 a!3186) j!159) mask!3328)))))

(assert (=> d!102485 (validMask!0 mask!3328)))

(assert (=> d!102485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20397 a!3186) j!159) mask!3328) (select (arr!20397 a!3186) j!159) a!3186 mask!3328) lt!347616)))

(declare-fun b!780117 () Bool)

(assert (=> b!780117 (= e!433981 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20397 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20397 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780118 () Bool)

(assert (=> b!780118 (= e!433980 (Intermediate!7997 true (toIndex!0 (select (arr!20397 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780119 () Bool)

(assert (=> b!780119 (= e!433982 e!433979)))

(declare-fun res!527802 () Bool)

(assert (=> b!780119 (= res!527802 (and (is-Intermediate!7997 lt!347616) (not (undefined!8809 lt!347616)) (bvslt (x!65302 lt!347616) #b01111111111111111111111111111110) (bvsge (x!65302 lt!347616) #b00000000000000000000000000000000) (bvsge (x!65302 lt!347616) #b00000000000000000000000000000000)))))

(assert (=> b!780119 (=> (not res!527802) (not e!433979))))

(declare-fun b!780120 () Bool)

(assert (=> b!780120 (and (bvsge (index!34358 lt!347616) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347616) (size!20818 a!3186)))))

(declare-fun res!527803 () Bool)

(assert (=> b!780120 (= res!527803 (= (select (arr!20397 a!3186) (index!34358 lt!347616)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780120 (=> res!527803 e!433978)))

(declare-fun b!780121 () Bool)

(assert (=> b!780121 (and (bvsge (index!34358 lt!347616) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347616) (size!20818 a!3186)))))

(assert (=> b!780121 (= e!433978 (= (select (arr!20397 a!3186) (index!34358 lt!347616)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780122 () Bool)

(assert (=> b!780122 (= e!433982 (bvsge (x!65302 lt!347616) #b01111111111111111111111111111110))))

(assert (= (and d!102485 c!86560) b!780118))

(assert (= (and d!102485 (not c!86560)) b!780116))

(assert (= (and b!780116 c!86561) b!780115))

(assert (= (and b!780116 (not c!86561)) b!780117))

(assert (= (and d!102485 c!86562) b!780122))

(assert (= (and d!102485 (not c!86562)) b!780119))

(assert (= (and b!780119 res!527802) b!780114))

(assert (= (and b!780114 (not res!527804)) b!780120))

(assert (= (and b!780120 (not res!527803)) b!780121))

(assert (=> b!780117 m!723151))

(declare-fun m!723491 () Bool)

(assert (=> b!780117 m!723491))

(assert (=> b!780117 m!723491))

(assert (=> b!780117 m!723149))

(declare-fun m!723493 () Bool)

(assert (=> b!780117 m!723493))

(declare-fun m!723495 () Bool)

(assert (=> b!780114 m!723495))

(assert (=> b!780120 m!723495))

(assert (=> d!102485 m!723151))

(declare-fun m!723497 () Bool)

(assert (=> d!102485 m!723497))

(assert (=> d!102485 m!723145))

(assert (=> b!780121 m!723495))

(assert (=> b!779666 d!102485))

(declare-fun d!102487 () Bool)

(declare-fun lt!347628 () (_ BitVec 32))

(declare-fun lt!347627 () (_ BitVec 32))

(assert (=> d!102487 (= lt!347628 (bvmul (bvxor lt!347627 (bvlshr lt!347627 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102487 (= lt!347627 ((_ extract 31 0) (bvand (bvxor (select (arr!20397 a!3186) j!159) (bvlshr (select (arr!20397 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102487 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!527805 (let ((h!15514 ((_ extract 31 0) (bvand (bvxor (select (arr!20397 a!3186) j!159) (bvlshr (select (arr!20397 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65313 (bvmul (bvxor h!15514 (bvlshr h!15514 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65313 (bvlshr x!65313 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!527805 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!527805 #b00000000000000000000000000000000))))))

(assert (=> d!102487 (= (toIndex!0 (select (arr!20397 a!3186) j!159) mask!3328) (bvand (bvxor lt!347628 (bvlshr lt!347628 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!779666 d!102487))

(declare-fun d!102489 () Bool)

(assert (=> d!102489 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!779654 d!102489))

(declare-fun d!102491 () Bool)

(declare-fun res!527810 () Bool)

(declare-fun e!433996 () Bool)

(assert (=> d!102491 (=> res!527810 e!433996)))

(assert (=> d!102491 (= res!527810 (= (select (arr!20397 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!102491 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!433996)))

(declare-fun b!780145 () Bool)

(declare-fun e!433997 () Bool)

(assert (=> b!780145 (= e!433996 e!433997)))

(declare-fun res!527811 () Bool)

(assert (=> b!780145 (=> (not res!527811) (not e!433997))))

(assert (=> b!780145 (= res!527811 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20818 a!3186)))))

(declare-fun b!780146 () Bool)

(assert (=> b!780146 (= e!433997 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102491 (not res!527810)) b!780145))

(assert (= (and b!780145 res!527811) b!780146))

(assert (=> d!102491 m!723435))

(declare-fun m!723505 () Bool)

(assert (=> b!780146 m!723505))

(assert (=> b!779665 d!102491))

(declare-fun b!780147 () Bool)

(declare-fun lt!347633 () SeekEntryResult!7997)

(assert (=> b!780147 (and (bvsge (index!34358 lt!347633) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347633) (size!20818 lt!347424)))))

(declare-fun res!527814 () Bool)

(assert (=> b!780147 (= res!527814 (= (select (arr!20397 lt!347424) (index!34358 lt!347633)) lt!347429))))

(declare-fun e!433998 () Bool)

(assert (=> b!780147 (=> res!527814 e!433998)))

(declare-fun e!433999 () Bool)

(assert (=> b!780147 (= e!433999 e!433998)))

(declare-fun b!780148 () Bool)

(declare-fun e!434001 () SeekEntryResult!7997)

(assert (=> b!780148 (= e!434001 (Intermediate!7997 false index!1321 x!1131))))

(declare-fun b!780149 () Bool)

(declare-fun e!434000 () SeekEntryResult!7997)

(assert (=> b!780149 (= e!434000 e!434001)))

(declare-fun c!86573 () Bool)

(declare-fun lt!347632 () (_ BitVec 64))

(assert (=> b!780149 (= c!86573 (or (= lt!347632 lt!347429) (= (bvadd lt!347632 lt!347632) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102493 () Bool)

(declare-fun e!434002 () Bool)

(assert (=> d!102493 e!434002))

(declare-fun c!86574 () Bool)

(assert (=> d!102493 (= c!86574 (and (is-Intermediate!7997 lt!347633) (undefined!8809 lt!347633)))))

(assert (=> d!102493 (= lt!347633 e!434000)))

(declare-fun c!86572 () Bool)

(assert (=> d!102493 (= c!86572 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102493 (= lt!347632 (select (arr!20397 lt!347424) index!1321))))

(assert (=> d!102493 (validMask!0 mask!3328)))

(assert (=> d!102493 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347429 lt!347424 mask!3328) lt!347633)))

(declare-fun b!780150 () Bool)

(assert (=> b!780150 (= e!434001 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!347429 lt!347424 mask!3328))))

(declare-fun b!780151 () Bool)

(assert (=> b!780151 (= e!434000 (Intermediate!7997 true index!1321 x!1131))))

(declare-fun b!780152 () Bool)

(assert (=> b!780152 (= e!434002 e!433999)))

(declare-fun res!527812 () Bool)

(assert (=> b!780152 (= res!527812 (and (is-Intermediate!7997 lt!347633) (not (undefined!8809 lt!347633)) (bvslt (x!65302 lt!347633) #b01111111111111111111111111111110) (bvsge (x!65302 lt!347633) #b00000000000000000000000000000000) (bvsge (x!65302 lt!347633) x!1131)))))

(assert (=> b!780152 (=> (not res!527812) (not e!433999))))

(declare-fun b!780153 () Bool)

(assert (=> b!780153 (and (bvsge (index!34358 lt!347633) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347633) (size!20818 lt!347424)))))

(declare-fun res!527813 () Bool)

(assert (=> b!780153 (= res!527813 (= (select (arr!20397 lt!347424) (index!34358 lt!347633)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780153 (=> res!527813 e!433998)))

(declare-fun b!780154 () Bool)

(assert (=> b!780154 (and (bvsge (index!34358 lt!347633) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347633) (size!20818 lt!347424)))))

(assert (=> b!780154 (= e!433998 (= (select (arr!20397 lt!347424) (index!34358 lt!347633)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780155 () Bool)

(assert (=> b!780155 (= e!434002 (bvsge (x!65302 lt!347633) #b01111111111111111111111111111110))))

(assert (= (and d!102493 c!86572) b!780151))

(assert (= (and d!102493 (not c!86572)) b!780149))

(assert (= (and b!780149 c!86573) b!780148))

(assert (= (and b!780149 (not c!86573)) b!780150))

(assert (= (and d!102493 c!86574) b!780155))

(assert (= (and d!102493 (not c!86574)) b!780152))

(assert (= (and b!780152 res!527812) b!780147))

(assert (= (and b!780147 (not res!527814)) b!780153))

(assert (= (and b!780153 (not res!527813)) b!780154))

(assert (=> b!780150 m!723313))

(assert (=> b!780150 m!723313))

(declare-fun m!723517 () Bool)

(assert (=> b!780150 m!723517))

(declare-fun m!723519 () Bool)

(assert (=> b!780147 m!723519))

(assert (=> b!780153 m!723519))

(declare-fun m!723521 () Bool)

(assert (=> d!102493 m!723521))

(assert (=> d!102493 m!723145))

(assert (=> b!780154 m!723519))

(assert (=> b!779653 d!102493))

(declare-fun b!780160 () Bool)

(declare-fun lt!347638 () SeekEntryResult!7997)

(assert (=> b!780160 (and (bvsge (index!34358 lt!347638) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347638) (size!20818 lt!347424)))))

(declare-fun res!527819 () Bool)

(assert (=> b!780160 (= res!527819 (= (select (arr!20397 lt!347424) (index!34358 lt!347638)) lt!347429))))

(declare-fun e!434006 () Bool)

(assert (=> b!780160 (=> res!527819 e!434006)))

(declare-fun e!434007 () Bool)

(assert (=> b!780160 (= e!434007 e!434006)))

(declare-fun b!780161 () Bool)

(declare-fun e!434009 () SeekEntryResult!7997)

(assert (=> b!780161 (= e!434009 (Intermediate!7997 false (toIndex!0 lt!347429 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780162 () Bool)

(declare-fun e!434008 () SeekEntryResult!7997)

(assert (=> b!780162 (= e!434008 e!434009)))

(declare-fun c!86577 () Bool)

(declare-fun lt!347637 () (_ BitVec 64))

(assert (=> b!780162 (= c!86577 (or (= lt!347637 lt!347429) (= (bvadd lt!347637 lt!347637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102499 () Bool)

(declare-fun e!434010 () Bool)

(assert (=> d!102499 e!434010))

(declare-fun c!86578 () Bool)

(assert (=> d!102499 (= c!86578 (and (is-Intermediate!7997 lt!347638) (undefined!8809 lt!347638)))))

(assert (=> d!102499 (= lt!347638 e!434008)))

(declare-fun c!86576 () Bool)

(assert (=> d!102499 (= c!86576 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102499 (= lt!347637 (select (arr!20397 lt!347424) (toIndex!0 lt!347429 mask!3328)))))

(assert (=> d!102499 (validMask!0 mask!3328)))

(assert (=> d!102499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347429 mask!3328) lt!347429 lt!347424 mask!3328) lt!347638)))

(declare-fun b!780163 () Bool)

(assert (=> b!780163 (= e!434009 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!347429 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!347429 lt!347424 mask!3328))))

(declare-fun b!780164 () Bool)

(assert (=> b!780164 (= e!434008 (Intermediate!7997 true (toIndex!0 lt!347429 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780165 () Bool)

(assert (=> b!780165 (= e!434010 e!434007)))

(declare-fun res!527817 () Bool)

(assert (=> b!780165 (= res!527817 (and (is-Intermediate!7997 lt!347638) (not (undefined!8809 lt!347638)) (bvslt (x!65302 lt!347638) #b01111111111111111111111111111110) (bvsge (x!65302 lt!347638) #b00000000000000000000000000000000) (bvsge (x!65302 lt!347638) #b00000000000000000000000000000000)))))

(assert (=> b!780165 (=> (not res!527817) (not e!434007))))

(declare-fun b!780166 () Bool)

(assert (=> b!780166 (and (bvsge (index!34358 lt!347638) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347638) (size!20818 lt!347424)))))

(declare-fun res!527818 () Bool)

(assert (=> b!780166 (= res!527818 (= (select (arr!20397 lt!347424) (index!34358 lt!347638)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!780166 (=> res!527818 e!434006)))

(declare-fun b!780167 () Bool)

(assert (=> b!780167 (and (bvsge (index!34358 lt!347638) #b00000000000000000000000000000000) (bvslt (index!34358 lt!347638) (size!20818 lt!347424)))))

(assert (=> b!780167 (= e!434006 (= (select (arr!20397 lt!347424) (index!34358 lt!347638)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780168 () Bool)

(assert (=> b!780168 (= e!434010 (bvsge (x!65302 lt!347638) #b01111111111111111111111111111110))))

(assert (= (and d!102499 c!86576) b!780164))

(assert (= (and d!102499 (not c!86576)) b!780162))

(assert (= (and b!780162 c!86577) b!780161))

(assert (= (and b!780162 (not c!86577)) b!780163))

(assert (= (and d!102499 c!86578) b!780168))

(assert (= (and d!102499 (not c!86578)) b!780165))

(assert (= (and b!780165 res!527817) b!780160))

(assert (= (and b!780160 (not res!527819)) b!780166))

(assert (= (and b!780166 (not res!527818)) b!780167))

(assert (=> b!780163 m!723161))

(declare-fun m!723523 () Bool)

(assert (=> b!780163 m!723523))

(assert (=> b!780163 m!723523))

(declare-fun m!723525 () Bool)

(assert (=> b!780163 m!723525))

(declare-fun m!723527 () Bool)

(assert (=> b!780160 m!723527))

(assert (=> b!780166 m!723527))

(assert (=> d!102499 m!723161))

(declare-fun m!723529 () Bool)

(assert (=> d!102499 m!723529))

(assert (=> d!102499 m!723145))

(assert (=> b!780167 m!723527))

(assert (=> b!779653 d!102499))

(declare-fun d!102501 () Bool)

(declare-fun lt!347640 () (_ BitVec 32))

(declare-fun lt!347639 () (_ BitVec 32))

(assert (=> d!102501 (= lt!347640 (bvmul (bvxor lt!347639 (bvlshr lt!347639 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102501 (= lt!347639 ((_ extract 31 0) (bvand (bvxor lt!347429 (bvlshr lt!347429 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102501 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!527805 (let ((h!15514 ((_ extract 31 0) (bvand (bvxor lt!347429 (bvlshr lt!347429 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65313 (bvmul (bvxor h!15514 (bvlshr h!15514 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65313 (bvlshr x!65313 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!527805 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!527805 #b00000000000000000000000000000000))))))

(assert (=> d!102501 (= (toIndex!0 lt!347429 mask!3328) (bvand (bvxor lt!347640 (bvlshr lt!347640 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!779653 d!102501))

(declare-fun b!780169 () Bool)

(declare-fun e!434012 () SeekEntryResult!7997)

(assert (=> b!780169 (= e!434012 (Found!7997 index!1321))))

(declare-fun b!780170 () Bool)

(declare-fun c!86579 () Bool)

(declare-fun lt!347642 () (_ BitVec 64))

(assert (=> b!780170 (= c!86579 (= lt!347642 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434013 () SeekEntryResult!7997)

(assert (=> b!780170 (= e!434012 e!434013)))

(declare-fun b!780171 () Bool)

(assert (=> b!780171 (= e!434013 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20397 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780172 () Bool)

(assert (=> b!780172 (= e!434013 (MissingVacant!7997 resIntermediateIndex!5))))

(declare-fun b!780173 () Bool)

(declare-fun e!434011 () SeekEntryResult!7997)

(assert (=> b!780173 (= e!434011 Undefined!7997)))

(declare-fun b!780174 () Bool)

(assert (=> b!780174 (= e!434011 e!434012)))

(declare-fun c!86581 () Bool)

(assert (=> b!780174 (= c!86581 (= lt!347642 (select (arr!20397 a!3186) j!159)))))

(declare-fun d!102503 () Bool)

(declare-fun lt!347641 () SeekEntryResult!7997)

(assert (=> d!102503 (and (or (is-Undefined!7997 lt!347641) (not (is-Found!7997 lt!347641)) (and (bvsge (index!34357 lt!347641) #b00000000000000000000000000000000) (bvslt (index!34357 lt!347641) (size!20818 a!3186)))) (or (is-Undefined!7997 lt!347641) (is-Found!7997 lt!347641) (not (is-MissingVacant!7997 lt!347641)) (not (= (index!34359 lt!347641) resIntermediateIndex!5)) (and (bvsge (index!34359 lt!347641) #b00000000000000000000000000000000) (bvslt (index!34359 lt!347641) (size!20818 a!3186)))) (or (is-Undefined!7997 lt!347641) (ite (is-Found!7997 lt!347641) (= (select (arr!20397 a!3186) (index!34357 lt!347641)) (select (arr!20397 a!3186) j!159)) (and (is-MissingVacant!7997 lt!347641) (= (index!34359 lt!347641) resIntermediateIndex!5) (= (select (arr!20397 a!3186) (index!34359 lt!347641)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102503 (= lt!347641 e!434011)))

(declare-fun c!86580 () Bool)

(assert (=> d!102503 (= c!86580 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102503 (= lt!347642 (select (arr!20397 a!3186) index!1321))))

(assert (=> d!102503 (validMask!0 mask!3328)))

(assert (=> d!102503 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20397 a!3186) j!159) a!3186 mask!3328) lt!347641)))

(assert (= (and d!102503 c!86580) b!780173))

(assert (= (and d!102503 (not c!86580)) b!780174))

(assert (= (and b!780174 c!86581) b!780169))

(assert (= (and b!780174 (not c!86581)) b!780170))

(assert (= (and b!780170 c!86579) b!780172))

(assert (= (and b!780170 (not c!86579)) b!780171))

(assert (=> b!780171 m!723313))

(assert (=> b!780171 m!723313))

(assert (=> b!780171 m!723149))

(declare-fun m!723531 () Bool)

(assert (=> b!780171 m!723531))

(declare-fun m!723533 () Bool)

(assert (=> d!102503 m!723533))

(declare-fun m!723535 () Bool)

(assert (=> d!102503 m!723535))

(assert (=> d!102503 m!723319))

(assert (=> d!102503 m!723145))

(assert (=> b!779663 d!102503))

(assert (=> b!779662 d!102503))

(push 1)

