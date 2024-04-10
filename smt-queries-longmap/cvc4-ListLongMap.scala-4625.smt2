; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64388 () Bool)

(assert start!64388)

(declare-fun b!724281 () Bool)

(declare-fun res!485757 () Bool)

(declare-fun e!405667 () Bool)

(assert (=> b!724281 (=> (not res!485757) (not e!405667))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40969 0))(
  ( (array!40970 (arr!19607 (Array (_ BitVec 32) (_ BitVec 64))) (size!20028 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40969)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724281 (= res!485757 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20028 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20028 a!3186))))))

(declare-fun b!724282 () Bool)

(declare-fun e!405671 () Bool)

(declare-fun e!405669 () Bool)

(assert (=> b!724282 (= e!405671 e!405669)))

(declare-fun res!485748 () Bool)

(assert (=> b!724282 (=> (not res!485748) (not e!405669))))

(declare-fun lt!320936 () (_ BitVec 64))

(declare-fun lt!320935 () array!40969)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7207 0))(
  ( (MissingZero!7207 (index!31196 (_ BitVec 32))) (Found!7207 (index!31197 (_ BitVec 32))) (Intermediate!7207 (undefined!8019 Bool) (index!31198 (_ BitVec 32)) (x!62184 (_ BitVec 32))) (Undefined!7207) (MissingVacant!7207 (index!31199 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40969 (_ BitVec 32)) SeekEntryResult!7207)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724282 (= res!485748 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320936 mask!3328) lt!320936 lt!320935 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320936 lt!320935 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!724282 (= lt!320936 (select (store (arr!19607 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!724282 (= lt!320935 (array!40970 (store (arr!19607 a!3186) i!1173 k!2102) (size!20028 a!3186)))))

(declare-fun e!405670 () Bool)

(declare-fun b!724283 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40969 (_ BitVec 32)) SeekEntryResult!7207)

(assert (=> b!724283 (= e!405670 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19607 a!3186) j!159) a!3186 mask!3328) (Found!7207 j!159)))))

(declare-fun b!724284 () Bool)

(assert (=> b!724284 (= e!405669 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge resIntermediateX!5 #b00000000000000000000000000000000))))))

(declare-fun e!405666 () Bool)

(assert (=> b!724284 e!405666))

(declare-fun res!485756 () Bool)

(assert (=> b!724284 (=> (not res!485756) (not e!405666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40969 (_ BitVec 32)) Bool)

(assert (=> b!724284 (= res!485756 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24732 0))(
  ( (Unit!24733) )
))
(declare-fun lt!320939 () Unit!24732)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24732)

(assert (=> b!724284 (= lt!320939 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!320938 () SeekEntryResult!7207)

(declare-fun b!724285 () Bool)

(assert (=> b!724285 (= e!405670 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19607 a!3186) j!159) a!3186 mask!3328) lt!320938))))

(declare-fun b!724287 () Bool)

(declare-fun e!405665 () Bool)

(assert (=> b!724287 (= e!405665 e!405667)))

(declare-fun res!485754 () Bool)

(assert (=> b!724287 (=> (not res!485754) (not e!405667))))

(declare-fun lt!320937 () SeekEntryResult!7207)

(assert (=> b!724287 (= res!485754 (or (= lt!320937 (MissingZero!7207 i!1173)) (= lt!320937 (MissingVacant!7207 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40969 (_ BitVec 32)) SeekEntryResult!7207)

(assert (=> b!724287 (= lt!320937 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!724288 () Bool)

(declare-fun res!485751 () Bool)

(assert (=> b!724288 (=> (not res!485751) (not e!405671))))

(assert (=> b!724288 (= res!485751 e!405670)))

(declare-fun c!79639 () Bool)

(assert (=> b!724288 (= c!79639 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724289 () Bool)

(assert (=> b!724289 (= e!405667 e!405671)))

(declare-fun res!485759 () Bool)

(assert (=> b!724289 (=> (not res!485759) (not e!405671))))

(assert (=> b!724289 (= res!485759 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19607 a!3186) j!159) mask!3328) (select (arr!19607 a!3186) j!159) a!3186 mask!3328) lt!320938))))

(assert (=> b!724289 (= lt!320938 (Intermediate!7207 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724290 () Bool)

(declare-fun res!485749 () Bool)

(assert (=> b!724290 (=> (not res!485749) (not e!405665))))

(assert (=> b!724290 (= res!485749 (and (= (size!20028 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20028 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20028 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724291 () Bool)

(declare-fun res!485758 () Bool)

(assert (=> b!724291 (=> (not res!485758) (not e!405665))))

(declare-fun arrayContainsKey!0 (array!40969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724291 (= res!485758 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724292 () Bool)

(declare-fun res!485747 () Bool)

(assert (=> b!724292 (=> (not res!485747) (not e!405667))))

(declare-datatypes ((List!13609 0))(
  ( (Nil!13606) (Cons!13605 (h!14659 (_ BitVec 64)) (t!19924 List!13609)) )
))
(declare-fun arrayNoDuplicates!0 (array!40969 (_ BitVec 32) List!13609) Bool)

(assert (=> b!724292 (= res!485747 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13606))))

(declare-fun b!724293 () Bool)

(assert (=> b!724293 (= e!405666 (= (seekEntryOrOpen!0 (select (arr!19607 a!3186) j!159) a!3186 mask!3328) (Found!7207 j!159)))))

(declare-fun b!724294 () Bool)

(declare-fun res!485750 () Bool)

(assert (=> b!724294 (=> (not res!485750) (not e!405671))))

(assert (=> b!724294 (= res!485750 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19607 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724295 () Bool)

(declare-fun res!485752 () Bool)

(assert (=> b!724295 (=> (not res!485752) (not e!405665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724295 (= res!485752 (validKeyInArray!0 (select (arr!19607 a!3186) j!159)))))

(declare-fun b!724296 () Bool)

(declare-fun res!485746 () Bool)

(assert (=> b!724296 (=> (not res!485746) (not e!405667))))

(assert (=> b!724296 (= res!485746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724286 () Bool)

(declare-fun res!485753 () Bool)

(assert (=> b!724286 (=> (not res!485753) (not e!405665))))

(assert (=> b!724286 (= res!485753 (validKeyInArray!0 k!2102))))

(declare-fun res!485755 () Bool)

(assert (=> start!64388 (=> (not res!485755) (not e!405665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64388 (= res!485755 (validMask!0 mask!3328))))

(assert (=> start!64388 e!405665))

(assert (=> start!64388 true))

(declare-fun array_inv!15403 (array!40969) Bool)

(assert (=> start!64388 (array_inv!15403 a!3186)))

(assert (= (and start!64388 res!485755) b!724290))

(assert (= (and b!724290 res!485749) b!724295))

(assert (= (and b!724295 res!485752) b!724286))

(assert (= (and b!724286 res!485753) b!724291))

(assert (= (and b!724291 res!485758) b!724287))

(assert (= (and b!724287 res!485754) b!724296))

(assert (= (and b!724296 res!485746) b!724292))

(assert (= (and b!724292 res!485747) b!724281))

(assert (= (and b!724281 res!485757) b!724289))

(assert (= (and b!724289 res!485759) b!724294))

(assert (= (and b!724294 res!485750) b!724288))

(assert (= (and b!724288 c!79639) b!724285))

(assert (= (and b!724288 (not c!79639)) b!724283))

(assert (= (and b!724288 res!485751) b!724282))

(assert (= (and b!724282 res!485748) b!724284))

(assert (= (and b!724284 res!485756) b!724293))

(declare-fun m!678653 () Bool)

(assert (=> b!724282 m!678653))

(declare-fun m!678655 () Bool)

(assert (=> b!724282 m!678655))

(declare-fun m!678657 () Bool)

(assert (=> b!724282 m!678657))

(declare-fun m!678659 () Bool)

(assert (=> b!724282 m!678659))

(assert (=> b!724282 m!678653))

(declare-fun m!678661 () Bool)

(assert (=> b!724282 m!678661))

(declare-fun m!678663 () Bool)

(assert (=> start!64388 m!678663))

(declare-fun m!678665 () Bool)

(assert (=> start!64388 m!678665))

(declare-fun m!678667 () Bool)

(assert (=> b!724283 m!678667))

(assert (=> b!724283 m!678667))

(declare-fun m!678669 () Bool)

(assert (=> b!724283 m!678669))

(declare-fun m!678671 () Bool)

(assert (=> b!724291 m!678671))

(assert (=> b!724295 m!678667))

(assert (=> b!724295 m!678667))

(declare-fun m!678673 () Bool)

(assert (=> b!724295 m!678673))

(assert (=> b!724285 m!678667))

(assert (=> b!724285 m!678667))

(declare-fun m!678675 () Bool)

(assert (=> b!724285 m!678675))

(assert (=> b!724293 m!678667))

(assert (=> b!724293 m!678667))

(declare-fun m!678677 () Bool)

(assert (=> b!724293 m!678677))

(declare-fun m!678679 () Bool)

(assert (=> b!724292 m!678679))

(declare-fun m!678681 () Bool)

(assert (=> b!724296 m!678681))

(assert (=> b!724289 m!678667))

(assert (=> b!724289 m!678667))

(declare-fun m!678683 () Bool)

(assert (=> b!724289 m!678683))

(assert (=> b!724289 m!678683))

(assert (=> b!724289 m!678667))

(declare-fun m!678685 () Bool)

(assert (=> b!724289 m!678685))

(declare-fun m!678687 () Bool)

(assert (=> b!724287 m!678687))

(declare-fun m!678689 () Bool)

(assert (=> b!724294 m!678689))

(declare-fun m!678691 () Bool)

(assert (=> b!724286 m!678691))

(declare-fun m!678693 () Bool)

(assert (=> b!724284 m!678693))

(declare-fun m!678695 () Bool)

(assert (=> b!724284 m!678695))

(push 1)

(assert (not b!724291))

(assert (not start!64388))

(assert (not b!724296))

(assert (not b!724286))

(assert (not b!724283))

(assert (not b!724285))

(assert (not b!724289))

(assert (not b!724293))

(assert (not b!724284))

(assert (not b!724292))

(assert (not b!724295))

(assert (not b!724287))

(assert (not b!724282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!724377 () Bool)

(declare-fun e!405727 () Bool)

(declare-fun call!34794 () Bool)

(assert (=> b!724377 (= e!405727 call!34794)))

(declare-fun b!724378 () Bool)

(declare-fun e!405728 () Bool)

(assert (=> b!724378 (= e!405727 e!405728)))

(declare-fun lt!320961 () (_ BitVec 64))

(assert (=> b!724378 (= lt!320961 (select (arr!19607 a!3186) j!159))))

(declare-fun lt!320963 () Unit!24732)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40969 (_ BitVec 64) (_ BitVec 32)) Unit!24732)

(assert (=> b!724378 (= lt!320963 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!320961 j!159))))

(assert (=> b!724378 (arrayContainsKey!0 a!3186 lt!320961 #b00000000000000000000000000000000)))

(declare-fun lt!320962 () Unit!24732)

(assert (=> b!724378 (= lt!320962 lt!320963)))

(declare-fun res!485789 () Bool)

(assert (=> b!724378 (= res!485789 (= (seekEntryOrOpen!0 (select (arr!19607 a!3186) j!159) a!3186 mask!3328) (Found!7207 j!159)))))

(assert (=> b!724378 (=> (not res!485789) (not e!405728))))

(declare-fun b!724379 () Bool)

(assert (=> b!724379 (= e!405728 call!34794)))

(declare-fun bm!34791 () Bool)

(assert (=> bm!34791 (= call!34794 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!724380 () Bool)

(declare-fun e!405726 () Bool)

(assert (=> b!724380 (= e!405726 e!405727)))

(declare-fun c!79666 () Bool)

(assert (=> b!724380 (= c!79666 (validKeyInArray!0 (select (arr!19607 a!3186) j!159)))))

(declare-fun d!99313 () Bool)

(declare-fun res!485788 () Bool)

(assert (=> d!99313 (=> res!485788 e!405726)))

(assert (=> d!99313 (= res!485788 (bvsge j!159 (size!20028 a!3186)))))

(assert (=> d!99313 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!405726)))

(assert (= (and d!99313 (not res!485788)) b!724380))

(assert (= (and b!724380 c!79666) b!724378))

(assert (= (and b!724380 (not c!79666)) b!724377))

(assert (= (and b!724378 res!485789) b!724379))

(assert (= (or b!724379 b!724377) bm!34791))

(assert (=> b!724378 m!678667))

(declare-fun m!678739 () Bool)

(assert (=> b!724378 m!678739))

(declare-fun m!678741 () Bool)

(assert (=> b!724378 m!678741))

(assert (=> b!724378 m!678667))

(assert (=> b!724378 m!678677))

(declare-fun m!678743 () Bool)

(assert (=> bm!34791 m!678743))

(assert (=> b!724380 m!678667))

(assert (=> b!724380 m!678667))

(assert (=> b!724380 m!678673))

(assert (=> b!724284 d!99313))

(declare-fun d!99323 () Bool)

(assert (=> d!99323 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!320966 () Unit!24732)

(declare-fun choose!38 (array!40969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24732)

(assert (=> d!99323 (= lt!320966 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99323 (validMask!0 mask!3328)))

(assert (=> d!99323 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!320966)))

(declare-fun bs!20809 () Bool)

(assert (= bs!20809 d!99323))

(assert (=> bs!20809 m!678693))

(declare-fun m!678745 () Bool)

(assert (=> bs!20809 m!678745))

(assert (=> bs!20809 m!678663))

(assert (=> b!724284 d!99323))

(declare-fun b!724447 () Bool)

(declare-fun e!405765 () SeekEntryResult!7207)

(assert (=> b!724447 (= e!405765 (MissingVacant!7207 resIntermediateIndex!5))))

(declare-fun b!724449 () Bool)

(declare-fun e!405766 () SeekEntryResult!7207)

(declare-fun e!405767 () SeekEntryResult!7207)

(assert (=> b!724449 (= e!405766 e!405767)))

(declare-fun c!79692 () Bool)

(declare-fun lt!320983 () (_ BitVec 64))

(assert (=> b!724449 (= c!79692 (= lt!320983 (select (arr!19607 a!3186) j!159)))))

(declare-fun b!724450 () Bool)

(assert (=> b!724450 (= e!405767 (Found!7207 index!1321))))

(declare-fun d!99325 () Bool)

(declare-fun lt!320984 () SeekEntryResult!7207)

(assert (=> d!99325 (and (or (is-Undefined!7207 lt!320984) (not (is-Found!7207 lt!320984)) (and (bvsge (index!31197 lt!320984) #b00000000000000000000000000000000) (bvslt (index!31197 lt!320984) (size!20028 a!3186)))) (or (is-Undefined!7207 lt!320984) (is-Found!7207 lt!320984) (not (is-MissingVacant!7207 lt!320984)) (not (= (index!31199 lt!320984) resIntermediateIndex!5)) (and (bvsge (index!31199 lt!320984) #b00000000000000000000000000000000) (bvslt (index!31199 lt!320984) (size!20028 a!3186)))) (or (is-Undefined!7207 lt!320984) (ite (is-Found!7207 lt!320984) (= (select (arr!19607 a!3186) (index!31197 lt!320984)) (select (arr!19607 a!3186) j!159)) (and (is-MissingVacant!7207 lt!320984) (= (index!31199 lt!320984) resIntermediateIndex!5) (= (select (arr!19607 a!3186) (index!31199 lt!320984)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99325 (= lt!320984 e!405766)))

(declare-fun c!79693 () Bool)

(assert (=> d!99325 (= c!79693 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99325 (= lt!320983 (select (arr!19607 a!3186) index!1321))))

(assert (=> d!99325 (validMask!0 mask!3328)))

(assert (=> d!99325 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19607 a!3186) j!159) a!3186 mask!3328) lt!320984)))

(declare-fun b!724448 () Bool)

(assert (=> b!724448 (= e!405766 Undefined!7207)))

(declare-fun b!724451 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724451 (= e!405765 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19607 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724452 () Bool)

(declare-fun c!79691 () Bool)

(assert (=> b!724452 (= c!79691 (= lt!320983 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724452 (= e!405767 e!405765)))

(assert (= (and d!99325 c!79693) b!724448))

(assert (= (and d!99325 (not c!79693)) b!724449))

(assert (= (and b!724449 c!79692) b!724450))

(assert (= (and b!724449 (not c!79692)) b!724452))

(assert (= (and b!724452 c!79691) b!724447))

(assert (= (and b!724452 (not c!79691)) b!724451))

(declare-fun m!678757 () Bool)

(assert (=> d!99325 m!678757))

(declare-fun m!678759 () Bool)

(assert (=> d!99325 m!678759))

(declare-fun m!678763 () Bool)

(assert (=> d!99325 m!678763))

(assert (=> d!99325 m!678663))

(declare-fun m!678765 () Bool)

(assert (=> b!724451 m!678765))

(assert (=> b!724451 m!678765))

(assert (=> b!724451 m!678667))

(declare-fun m!678769 () Bool)

(assert (=> b!724451 m!678769))

(assert (=> b!724283 d!99325))

(declare-fun b!724453 () Bool)

(declare-fun e!405769 () Bool)

(declare-fun call!34795 () Bool)

(assert (=> b!724453 (= e!405769 call!34795)))

(declare-fun b!724454 () Bool)

(declare-fun e!405770 () Bool)

(assert (=> b!724454 (= e!405769 e!405770)))

(declare-fun lt!320985 () (_ BitVec 64))

(assert (=> b!724454 (= lt!320985 (select (arr!19607 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!320987 () Unit!24732)

(assert (=> b!724454 (= lt!320987 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!320985 #b00000000000000000000000000000000))))

(assert (=> b!724454 (arrayContainsKey!0 a!3186 lt!320985 #b00000000000000000000000000000000)))

(declare-fun lt!320986 () Unit!24732)

(assert (=> b!724454 (= lt!320986 lt!320987)))

(declare-fun res!485810 () Bool)

(assert (=> b!724454 (= res!485810 (= (seekEntryOrOpen!0 (select (arr!19607 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7207 #b00000000000000000000000000000000)))))

(assert (=> b!724454 (=> (not res!485810) (not e!405770))))

(declare-fun b!724455 () Bool)

(assert (=> b!724455 (= e!405770 call!34795)))

(declare-fun bm!34792 () Bool)

(assert (=> bm!34792 (= call!34795 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!724456 () Bool)

(declare-fun e!405768 () Bool)

(assert (=> b!724456 (= e!405768 e!405769)))

(declare-fun c!79694 () Bool)

(assert (=> b!724456 (= c!79694 (validKeyInArray!0 (select (arr!19607 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99329 () Bool)

(declare-fun res!485809 () Bool)

(assert (=> d!99329 (=> res!485809 e!405768)))

(assert (=> d!99329 (= res!485809 (bvsge #b00000000000000000000000000000000 (size!20028 a!3186)))))

(assert (=> d!99329 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!405768)))

(assert (= (and d!99329 (not res!485809)) b!724456))

(assert (= (and b!724456 c!79694) b!724454))

(assert (= (and b!724456 (not c!79694)) b!724453))

(assert (= (and b!724454 res!485810) b!724455))

(assert (= (or b!724455 b!724453) bm!34792))

(declare-fun m!678773 () Bool)

(assert (=> b!724454 m!678773))

(declare-fun m!678775 () Bool)

(assert (=> b!724454 m!678775))

(declare-fun m!678777 () Bool)

(assert (=> b!724454 m!678777))

(assert (=> b!724454 m!678773))

(declare-fun m!678779 () Bool)

(assert (=> b!724454 m!678779))

(declare-fun m!678781 () Bool)

(assert (=> bm!34792 m!678781))

(assert (=> b!724456 m!678773))

(assert (=> b!724456 m!678773))

(declare-fun m!678783 () Bool)

(assert (=> b!724456 m!678783))

(assert (=> b!724296 d!99329))

(declare-fun d!99333 () Bool)

(declare-fun e!405803 () Bool)

(assert (=> d!99333 e!405803))

(declare-fun c!79712 () Bool)

(declare-fun lt!321025 () SeekEntryResult!7207)

(assert (=> d!99333 (= c!79712 (and (is-Intermediate!7207 lt!321025) (undefined!8019 lt!321025)))))

(declare-fun e!405807 () SeekEntryResult!7207)

(assert (=> d!99333 (= lt!321025 e!405807)))

(declare-fun c!79711 () Bool)

(assert (=> d!99333 (= c!79711 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!321026 () (_ BitVec 64))

(assert (=> d!99333 (= lt!321026 (select (arr!19607 a!3186) index!1321))))

(assert (=> d!99333 (validMask!0 mask!3328)))

(assert (=> d!99333 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19607 a!3186) j!159) a!3186 mask!3328) lt!321025)))

(declare-fun b!724509 () Bool)

(declare-fun e!405806 () SeekEntryResult!7207)

(assert (=> b!724509 (= e!405806 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19607 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724510 () Bool)

(declare-fun e!405804 () Bool)

(assert (=> b!724510 (= e!405803 e!405804)))

(declare-fun res!485832 () Bool)

(assert (=> b!724510 (= res!485832 (and (is-Intermediate!7207 lt!321025) (not (undefined!8019 lt!321025)) (bvslt (x!62184 lt!321025) #b01111111111111111111111111111110) (bvsge (x!62184 lt!321025) #b00000000000000000000000000000000) (bvsge (x!62184 lt!321025) x!1131)))))

(assert (=> b!724510 (=> (not res!485832) (not e!405804))))

(declare-fun b!724511 () Bool)

(assert (=> b!724511 (and (bvsge (index!31198 lt!321025) #b00000000000000000000000000000000) (bvslt (index!31198 lt!321025) (size!20028 a!3186)))))

(declare-fun res!485834 () Bool)

(assert (=> b!724511 (= res!485834 (= (select (arr!19607 a!3186) (index!31198 lt!321025)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!405805 () Bool)

(assert (=> b!724511 (=> res!485834 e!405805)))

(declare-fun b!724512 () Bool)

(assert (=> b!724512 (and (bvsge (index!31198 lt!321025) #b00000000000000000000000000000000) (bvslt (index!31198 lt!321025) (size!20028 a!3186)))))

(declare-fun res!485833 () Bool)

(assert (=> b!724512 (= res!485833 (= (select (arr!19607 a!3186) (index!31198 lt!321025)) (select (arr!19607 a!3186) j!159)))))

(assert (=> b!724512 (=> res!485833 e!405805)))

(assert (=> b!724512 (= e!405804 e!405805)))

(declare-fun b!724513 () Bool)

(assert (=> b!724513 (= e!405807 e!405806)))

(declare-fun c!79713 () Bool)

(assert (=> b!724513 (= c!79713 (or (= lt!321026 (select (arr!19607 a!3186) j!159)) (= (bvadd lt!321026 lt!321026) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724514 () Bool)

(assert (=> b!724514 (and (bvsge (index!31198 lt!321025) #b00000000000000000000000000000000) (bvslt (index!31198 lt!321025) (size!20028 a!3186)))))

(assert (=> b!724514 (= e!405805 (= (select (arr!19607 a!3186) (index!31198 lt!321025)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724515 () Bool)

(assert (=> b!724515 (= e!405803 (bvsge (x!62184 lt!321025) #b01111111111111111111111111111110))))

(declare-fun b!724516 () Bool)

(assert (=> b!724516 (= e!405807 (Intermediate!7207 true index!1321 x!1131))))

(declare-fun b!724517 () Bool)

(assert (=> b!724517 (= e!405806 (Intermediate!7207 false index!1321 x!1131))))

(assert (= (and d!99333 c!79711) b!724516))

(assert (= (and d!99333 (not c!79711)) b!724513))

(assert (= (and b!724513 c!79713) b!724517))

(assert (= (and b!724513 (not c!79713)) b!724509))

(assert (= (and d!99333 c!79712) b!724515))

(assert (= (and d!99333 (not c!79712)) b!724510))

(assert (= (and b!724510 res!485832) b!724512))

(assert (= (and b!724512 (not res!485833)) b!724511))

(assert (= (and b!724511 (not res!485834)) b!724514))

(assert (=> d!99333 m!678763))

(assert (=> d!99333 m!678663))

(declare-fun m!678815 () Bool)

(assert (=> b!724512 m!678815))

(assert (=> b!724511 m!678815))

(assert (=> b!724509 m!678765))

(assert (=> b!724509 m!678765))

(assert (=> b!724509 m!678667))

(declare-fun m!678817 () Bool)

(assert (=> b!724509 m!678817))

(assert (=> b!724514 m!678815))

(assert (=> b!724285 d!99333))

(declare-fun d!99361 () Bool)

(assert (=> d!99361 (= (validKeyInArray!0 (select (arr!19607 a!3186) j!159)) (and (not (= (select (arr!19607 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19607 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!724295 d!99361))

(declare-fun d!99365 () Bool)

(assert (=> d!99365 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64388 d!99365))

(declare-fun d!99369 () Bool)

(assert (=> d!99369 (= (array_inv!15403 a!3186) (bvsge (size!20028 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64388 d!99369))

(declare-fun d!99373 () Bool)

(declare-fun res!485856 () Bool)

(declare-fun e!405851 () Bool)

(assert (=> d!99373 (=> res!485856 e!405851)))

(assert (=> d!99373 (= res!485856 (bvsge #b00000000000000000000000000000000 (size!20028 a!3186)))))

(assert (=> d!99373 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13606) e!405851)))

(declare-fun b!724585 () Bool)

(declare-fun e!405850 () Bool)

(assert (=> b!724585 (= e!405851 e!405850)))

(declare-fun res!485857 () Bool)

(assert (=> b!724585 (=> (not res!485857) (not e!405850))))

(declare-fun e!405849 () Bool)

(assert (=> b!724585 (= res!485857 (not e!405849))))

(declare-fun res!485858 () Bool)

(assert (=> b!724585 (=> (not res!485858) (not e!405849))))

(assert (=> b!724585 (= res!485858 (validKeyInArray!0 (select (arr!19607 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724586 () Bool)

(declare-fun e!405852 () Bool)

(declare-fun call!34802 () Bool)

(assert (=> b!724586 (= e!405852 call!34802)))

(declare-fun b!724587 () Bool)

(assert (=> b!724587 (= e!405850 e!405852)))

(declare-fun c!79737 () Bool)

(assert (=> b!724587 (= c!79737 (validKeyInArray!0 (select (arr!19607 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724588 () Bool)

(assert (=> b!724588 (= e!405852 call!34802)))

(declare-fun bm!34799 () Bool)

(assert (=> bm!34799 (= call!34802 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79737 (Cons!13605 (select (arr!19607 a!3186) #b00000000000000000000000000000000) Nil!13606) Nil!13606)))))

(declare-fun b!724589 () Bool)

(declare-fun contains!4048 (List!13609 (_ BitVec 64)) Bool)

(assert (=> b!724589 (= e!405849 (contains!4048 Nil!13606 (select (arr!19607 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99373 (not res!485856)) b!724585))

(assert (= (and b!724585 res!485858) b!724589))

(assert (= (and b!724585 res!485857) b!724587))

(assert (= (and b!724587 c!79737) b!724586))

(assert (= (and b!724587 (not c!79737)) b!724588))

(assert (= (or b!724586 b!724588) bm!34799))

(assert (=> b!724585 m!678773))

(assert (=> b!724585 m!678773))

(assert (=> b!724585 m!678783))

(assert (=> b!724587 m!678773))

(assert (=> b!724587 m!678773))

(assert (=> b!724587 m!678783))

(assert (=> bm!34799 m!678773))

(declare-fun m!678859 () Bool)

(assert (=> bm!34799 m!678859))

(assert (=> b!724589 m!678773))

(assert (=> b!724589 m!678773))

(declare-fun m!678861 () Bool)

(assert (=> b!724589 m!678861))

(assert (=> b!724292 d!99373))

(declare-fun d!99385 () Bool)

(declare-fun res!485867 () Bool)

(declare-fun e!405863 () Bool)

(assert (=> d!99385 (=> res!485867 e!405863)))

(assert (=> d!99385 (= res!485867 (= (select (arr!19607 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99385 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!405863)))

(declare-fun b!724602 () Bool)

(declare-fun e!405864 () Bool)

(assert (=> b!724602 (= e!405863 e!405864)))

(declare-fun res!485868 () Bool)

(assert (=> b!724602 (=> (not res!485868) (not e!405864))))

(assert (=> b!724602 (= res!485868 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20028 a!3186)))))

(declare-fun b!724603 () Bool)

(assert (=> b!724603 (= e!405864 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99385 (not res!485867)) b!724602))

(assert (= (and b!724602 res!485868) b!724603))

(assert (=> d!99385 m!678773))

(declare-fun m!678863 () Bool)

(assert (=> b!724603 m!678863))

(assert (=> b!724291 d!99385))

(declare-fun b!724624 () Bool)

(declare-fun e!405879 () SeekEntryResult!7207)

(declare-fun e!405877 () SeekEntryResult!7207)

(assert (=> b!724624 (= e!405879 e!405877)))

(declare-fun lt!321067 () (_ BitVec 64))

(declare-fun lt!321066 () SeekEntryResult!7207)

(assert (=> b!724624 (= lt!321067 (select (arr!19607 a!3186) (index!31198 lt!321066)))))

(declare-fun c!79750 () Bool)

(assert (=> b!724624 (= c!79750 (= lt!321067 (select (arr!19607 a!3186) j!159)))))

(declare-fun b!724625 () Bool)

(assert (=> b!724625 (= e!405879 Undefined!7207)))

(declare-fun b!724626 () Bool)

(declare-fun c!79749 () Bool)

(assert (=> b!724626 (= c!79749 (= lt!321067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!405878 () SeekEntryResult!7207)

(assert (=> b!724626 (= e!405877 e!405878)))

(declare-fun b!724627 () Bool)

(assert (=> b!724627 (= e!405878 (seekKeyOrZeroReturnVacant!0 (x!62184 lt!321066) (index!31198 lt!321066) (index!31198 lt!321066) (select (arr!19607 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724628 () Bool)

(assert (=> b!724628 (= e!405878 (MissingZero!7207 (index!31198 lt!321066)))))

(declare-fun b!724629 () Bool)

(assert (=> b!724629 (= e!405877 (Found!7207 (index!31198 lt!321066)))))

(declare-fun d!99387 () Bool)

(declare-fun lt!321065 () SeekEntryResult!7207)

(assert (=> d!99387 (and (or (is-Undefined!7207 lt!321065) (not (is-Found!7207 lt!321065)) (and (bvsge (index!31197 lt!321065) #b00000000000000000000000000000000) (bvslt (index!31197 lt!321065) (size!20028 a!3186)))) (or (is-Undefined!7207 lt!321065) (is-Found!7207 lt!321065) (not (is-MissingZero!7207 lt!321065)) (and (bvsge (index!31196 lt!321065) #b00000000000000000000000000000000) (bvslt (index!31196 lt!321065) (size!20028 a!3186)))) (or (is-Undefined!7207 lt!321065) (is-Found!7207 lt!321065) (is-MissingZero!7207 lt!321065) (not (is-MissingVacant!7207 lt!321065)) (and (bvsge (index!31199 lt!321065) #b00000000000000000000000000000000) (bvslt (index!31199 lt!321065) (size!20028 a!3186)))) (or (is-Undefined!7207 lt!321065) (ite (is-Found!7207 lt!321065) (= (select (arr!19607 a!3186) (index!31197 lt!321065)) (select (arr!19607 a!3186) j!159)) (ite (is-MissingZero!7207 lt!321065) (= (select (arr!19607 a!3186) (index!31196 lt!321065)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7207 lt!321065) (= (select (arr!19607 a!3186) (index!31199 lt!321065)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99387 (= lt!321065 e!405879)))

(declare-fun c!79748 () Bool)

(assert (=> d!99387 (= c!79748 (and (is-Intermediate!7207 lt!321066) (undefined!8019 lt!321066)))))

(assert (=> d!99387 (= lt!321066 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19607 a!3186) j!159) mask!3328) (select (arr!19607 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99387 (validMask!0 mask!3328)))

(assert (=> d!99387 (= (seekEntryOrOpen!0 (select (arr!19607 a!3186) j!159) a!3186 mask!3328) lt!321065)))

(assert (= (and d!99387 c!79748) b!724625))

(assert (= (and d!99387 (not c!79748)) b!724624))

(assert (= (and b!724624 c!79750) b!724629))

(assert (= (and b!724624 (not c!79750)) b!724626))

(assert (= (and b!724626 c!79749) b!724628))

(assert (= (and b!724626 (not c!79749)) b!724627))

(declare-fun m!678881 () Bool)

(assert (=> b!724624 m!678881))

(assert (=> b!724627 m!678667))

(declare-fun m!678883 () Bool)

(assert (=> b!724627 m!678883))

(declare-fun m!678885 () Bool)

(assert (=> d!99387 m!678885))

(assert (=> d!99387 m!678667))

(assert (=> d!99387 m!678683))

(declare-fun m!678887 () Bool)

(assert (=> d!99387 m!678887))

(assert (=> d!99387 m!678663))

(assert (=> d!99387 m!678683))

(assert (=> d!99387 m!678667))

(assert (=> d!99387 m!678685))

(declare-fun m!678889 () Bool)

(assert (=> d!99387 m!678889))

(assert (=> b!724293 d!99387))

(declare-fun d!99395 () Bool)

(declare-fun e!405880 () Bool)

(assert (=> d!99395 e!405880))

(declare-fun c!79752 () Bool)

(declare-fun lt!321068 () SeekEntryResult!7207)

(assert (=> d!99395 (= c!79752 (and (is-Intermediate!7207 lt!321068) (undefined!8019 lt!321068)))))

(declare-fun e!405884 () SeekEntryResult!7207)

(assert (=> d!99395 (= lt!321068 e!405884)))

(declare-fun c!79751 () Bool)

(assert (=> d!99395 (= c!79751 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!321069 () (_ BitVec 64))

(assert (=> d!99395 (= lt!321069 (select (arr!19607 lt!320935) (toIndex!0 lt!320936 mask!3328)))))

(assert (=> d!99395 (validMask!0 mask!3328)))

(assert (=> d!99395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320936 mask!3328) lt!320936 lt!320935 mask!3328) lt!321068)))

(declare-fun e!405883 () SeekEntryResult!7207)

(declare-fun b!724630 () Bool)

(assert (=> b!724630 (= e!405883 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!320936 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!320936 lt!320935 mask!3328))))

(declare-fun b!724631 () Bool)

(declare-fun e!405881 () Bool)

(assert (=> b!724631 (= e!405880 e!405881)))

(declare-fun res!485873 () Bool)

(assert (=> b!724631 (= res!485873 (and (is-Intermediate!7207 lt!321068) (not (undefined!8019 lt!321068)) (bvslt (x!62184 lt!321068) #b01111111111111111111111111111110) (bvsge (x!62184 lt!321068) #b00000000000000000000000000000000) (bvsge (x!62184 lt!321068) #b00000000000000000000000000000000)))))

