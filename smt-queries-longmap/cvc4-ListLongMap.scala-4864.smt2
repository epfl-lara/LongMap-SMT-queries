; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67030 () Bool)

(assert start!67030)

(declare-fun res!523489 () Bool)

(declare-fun e!430809 () Bool)

(assert (=> start!67030 (=> (not res!523489) (not e!430809))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67030 (= res!523489 (validMask!0 mask!3328))))

(assert (=> start!67030 e!430809))

(assert (=> start!67030 true))

(declare-datatypes ((array!42454 0))(
  ( (array!42455 (arr!20324 (Array (_ BitVec 32) (_ BitVec 64))) (size!20745 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42454)

(declare-fun array_inv!16120 (array!42454) Bool)

(assert (=> start!67030 (array_inv!16120 a!3186)))

(declare-fun b!773959 () Bool)

(declare-fun res!523483 () Bool)

(declare-fun e!430817 () Bool)

(assert (=> b!773959 (=> (not res!523483) (not e!430817))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773959 (= res!523483 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20745 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20745 a!3186))))))

(declare-fun b!773960 () Bool)

(declare-datatypes ((Unit!26710 0))(
  ( (Unit!26711) )
))
(declare-fun e!430810 () Unit!26710)

(declare-fun Unit!26712 () Unit!26710)

(assert (=> b!773960 (= e!430810 Unit!26712)))

(declare-datatypes ((SeekEntryResult!7924 0))(
  ( (MissingZero!7924 (index!34064 (_ BitVec 32))) (Found!7924 (index!34065 (_ BitVec 32))) (Intermediate!7924 (undefined!8736 Bool) (index!34066 (_ BitVec 32)) (x!64999 (_ BitVec 32))) (Undefined!7924) (MissingVacant!7924 (index!34067 (_ BitVec 32))) )
))
(declare-fun lt!344702 () SeekEntryResult!7924)

(declare-fun lt!344707 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42454 (_ BitVec 32)) SeekEntryResult!7924)

(assert (=> b!773960 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344707 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344702)))

(declare-fun b!773961 () Bool)

(declare-fun res!523476 () Bool)

(assert (=> b!773961 (=> (not res!523476) (not e!430809))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773961 (= res!523476 (and (= (size!20745 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20745 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20745 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773962 () Bool)

(declare-fun e!430813 () Bool)

(declare-fun e!430811 () Bool)

(assert (=> b!773962 (= e!430813 e!430811)))

(declare-fun res!523493 () Bool)

(assert (=> b!773962 (=> (not res!523493) (not e!430811))))

(declare-fun lt!344701 () SeekEntryResult!7924)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42454 (_ BitVec 32)) SeekEntryResult!7924)

(assert (=> b!773962 (= res!523493 (= (seekEntryOrOpen!0 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344701))))

(assert (=> b!773962 (= lt!344701 (Found!7924 j!159))))

(declare-fun e!430806 () Bool)

(declare-fun b!773963 () Bool)

(assert (=> b!773963 (= e!430806 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344702))))

(declare-fun b!773964 () Bool)

(declare-fun e!430814 () Bool)

(declare-fun e!430812 () Bool)

(assert (=> b!773964 (= e!430814 e!430812)))

(declare-fun res!523482 () Bool)

(assert (=> b!773964 (=> res!523482 e!430812)))

(assert (=> b!773964 (= res!523482 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344707 #b00000000000000000000000000000000) (bvsge lt!344707 (size!20745 a!3186))))))

(declare-fun lt!344698 () Unit!26710)

(assert (=> b!773964 (= lt!344698 e!430810)))

(declare-fun c!85642 () Bool)

(declare-fun lt!344704 () Bool)

(assert (=> b!773964 (= c!85642 lt!344704)))

(assert (=> b!773964 (= lt!344704 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773964 (= lt!344707 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773965 () Bool)

(declare-fun res!523492 () Bool)

(assert (=> b!773965 (=> (not res!523492) (not e!430809))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773965 (= res!523492 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773966 () Bool)

(declare-fun res!523491 () Bool)

(declare-fun e!430816 () Bool)

(assert (=> b!773966 (=> (not res!523491) (not e!430816))))

(assert (=> b!773966 (= res!523491 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20324 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773967 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42454 (_ BitVec 32)) SeekEntryResult!7924)

(assert (=> b!773967 (= e!430806 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) (Found!7924 j!159)))))

(declare-fun b!773968 () Bool)

(declare-fun res!523486 () Bool)

(assert (=> b!773968 (=> (not res!523486) (not e!430816))))

(assert (=> b!773968 (= res!523486 e!430806)))

(declare-fun c!85640 () Bool)

(assert (=> b!773968 (= c!85640 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773969 () Bool)

(declare-fun e!430815 () Bool)

(assert (=> b!773969 (= e!430816 e!430815)))

(declare-fun res!523481 () Bool)

(assert (=> b!773969 (=> (not res!523481) (not e!430815))))

(declare-fun lt!344705 () SeekEntryResult!7924)

(declare-fun lt!344700 () SeekEntryResult!7924)

(assert (=> b!773969 (= res!523481 (= lt!344705 lt!344700))))

(declare-fun lt!344699 () (_ BitVec 64))

(declare-fun lt!344708 () array!42454)

(assert (=> b!773969 (= lt!344700 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344699 lt!344708 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773969 (= lt!344705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344699 mask!3328) lt!344699 lt!344708 mask!3328))))

(assert (=> b!773969 (= lt!344699 (select (store (arr!20324 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!773969 (= lt!344708 (array!42455 (store (arr!20324 a!3186) i!1173 k!2102) (size!20745 a!3186)))))

(declare-fun b!773970 () Bool)

(assert (=> b!773970 (= e!430812 (= lt!344705 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344707 lt!344699 lt!344708 mask!3328)))))

(declare-fun b!773971 () Bool)

(assert (=> b!773971 (= e!430809 e!430817)))

(declare-fun res!523490 () Bool)

(assert (=> b!773971 (=> (not res!523490) (not e!430817))))

(declare-fun lt!344697 () SeekEntryResult!7924)

(assert (=> b!773971 (= res!523490 (or (= lt!344697 (MissingZero!7924 i!1173)) (= lt!344697 (MissingVacant!7924 i!1173))))))

(assert (=> b!773971 (= lt!344697 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!773972 () Bool)

(assert (=> b!773972 (= e!430817 e!430816)))

(declare-fun res!523479 () Bool)

(assert (=> b!773972 (=> (not res!523479) (not e!430816))))

(assert (=> b!773972 (= res!523479 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20324 a!3186) j!159) mask!3328) (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344702))))

(assert (=> b!773972 (= lt!344702 (Intermediate!7924 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!344696 () SeekEntryResult!7924)

(declare-fun b!773973 () Bool)

(declare-fun e!430808 () Bool)

(assert (=> b!773973 (= e!430808 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344707 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344696)))))

(declare-fun b!773974 () Bool)

(declare-fun res!523477 () Bool)

(assert (=> b!773974 (=> (not res!523477) (not e!430809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773974 (= res!523477 (validKeyInArray!0 k!2102))))

(declare-fun b!773975 () Bool)

(declare-fun res!523487 () Bool)

(assert (=> b!773975 (=> (not res!523487) (not e!430817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42454 (_ BitVec 32)) Bool)

(assert (=> b!773975 (= res!523487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773976 () Bool)

(assert (=> b!773976 (= e!430811 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344701))))

(declare-fun b!773977 () Bool)

(declare-fun Unit!26713 () Unit!26710)

(assert (=> b!773977 (= e!430810 Unit!26713)))

(declare-fun lt!344703 () SeekEntryResult!7924)

(assert (=> b!773977 (= lt!344703 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773977 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344707 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344696)))

(declare-fun b!773978 () Bool)

(declare-fun res!523488 () Bool)

(assert (=> b!773978 (=> res!523488 e!430812)))

(assert (=> b!773978 (= res!523488 e!430808)))

(declare-fun c!85641 () Bool)

(assert (=> b!773978 (= c!85641 lt!344704)))

(declare-fun b!773979 () Bool)

(declare-fun res!523478 () Bool)

(assert (=> b!773979 (=> (not res!523478) (not e!430817))))

(declare-datatypes ((List!14326 0))(
  ( (Nil!14323) (Cons!14322 (h!15427 (_ BitVec 64)) (t!20641 List!14326)) )
))
(declare-fun arrayNoDuplicates!0 (array!42454 (_ BitVec 32) List!14326) Bool)

(assert (=> b!773979 (= res!523478 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14323))))

(declare-fun b!773980 () Bool)

(assert (=> b!773980 (= e!430815 (not e!430814))))

(declare-fun res!523485 () Bool)

(assert (=> b!773980 (=> res!523485 e!430814)))

(assert (=> b!773980 (= res!523485 (or (not (is-Intermediate!7924 lt!344700)) (bvsge x!1131 (x!64999 lt!344700))))))

(assert (=> b!773980 (= lt!344696 (Found!7924 j!159))))

(assert (=> b!773980 e!430813))

(declare-fun res!523484 () Bool)

(assert (=> b!773980 (=> (not res!523484) (not e!430813))))

(assert (=> b!773980 (= res!523484 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344706 () Unit!26710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26710)

(assert (=> b!773980 (= lt!344706 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773981 () Bool)

(declare-fun res!523480 () Bool)

(assert (=> b!773981 (=> (not res!523480) (not e!430809))))

(assert (=> b!773981 (= res!523480 (validKeyInArray!0 (select (arr!20324 a!3186) j!159)))))

(declare-fun b!773982 () Bool)

(assert (=> b!773982 (= e!430808 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344707 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344702)))))

(assert (= (and start!67030 res!523489) b!773961))

(assert (= (and b!773961 res!523476) b!773981))

(assert (= (and b!773981 res!523480) b!773974))

(assert (= (and b!773974 res!523477) b!773965))

(assert (= (and b!773965 res!523492) b!773971))

(assert (= (and b!773971 res!523490) b!773975))

(assert (= (and b!773975 res!523487) b!773979))

(assert (= (and b!773979 res!523478) b!773959))

(assert (= (and b!773959 res!523483) b!773972))

(assert (= (and b!773972 res!523479) b!773966))

(assert (= (and b!773966 res!523491) b!773968))

(assert (= (and b!773968 c!85640) b!773963))

(assert (= (and b!773968 (not c!85640)) b!773967))

(assert (= (and b!773968 res!523486) b!773969))

(assert (= (and b!773969 res!523481) b!773980))

(assert (= (and b!773980 res!523484) b!773962))

(assert (= (and b!773962 res!523493) b!773976))

(assert (= (and b!773980 (not res!523485)) b!773964))

(assert (= (and b!773964 c!85642) b!773960))

(assert (= (and b!773964 (not c!85642)) b!773977))

(assert (= (and b!773964 (not res!523482)) b!773978))

(assert (= (and b!773978 c!85641) b!773982))

(assert (= (and b!773978 (not c!85641)) b!773973))

(assert (= (and b!773978 (not res!523488)) b!773970))

(declare-fun m!718571 () Bool)

(assert (=> b!773982 m!718571))

(assert (=> b!773982 m!718571))

(declare-fun m!718573 () Bool)

(assert (=> b!773982 m!718573))

(assert (=> b!773963 m!718571))

(assert (=> b!773963 m!718571))

(declare-fun m!718575 () Bool)

(assert (=> b!773963 m!718575))

(assert (=> b!773973 m!718571))

(assert (=> b!773973 m!718571))

(declare-fun m!718577 () Bool)

(assert (=> b!773973 m!718577))

(declare-fun m!718579 () Bool)

(assert (=> b!773974 m!718579))

(declare-fun m!718581 () Bool)

(assert (=> b!773969 m!718581))

(declare-fun m!718583 () Bool)

(assert (=> b!773969 m!718583))

(declare-fun m!718585 () Bool)

(assert (=> b!773969 m!718585))

(declare-fun m!718587 () Bool)

(assert (=> b!773969 m!718587))

(assert (=> b!773969 m!718581))

(declare-fun m!718589 () Bool)

(assert (=> b!773969 m!718589))

(assert (=> b!773981 m!718571))

(assert (=> b!773981 m!718571))

(declare-fun m!718591 () Bool)

(assert (=> b!773981 m!718591))

(declare-fun m!718593 () Bool)

(assert (=> start!67030 m!718593))

(declare-fun m!718595 () Bool)

(assert (=> start!67030 m!718595))

(declare-fun m!718597 () Bool)

(assert (=> b!773964 m!718597))

(assert (=> b!773977 m!718571))

(assert (=> b!773977 m!718571))

(declare-fun m!718599 () Bool)

(assert (=> b!773977 m!718599))

(assert (=> b!773977 m!718571))

(assert (=> b!773977 m!718577))

(declare-fun m!718601 () Bool)

(assert (=> b!773970 m!718601))

(declare-fun m!718603 () Bool)

(assert (=> b!773979 m!718603))

(assert (=> b!773972 m!718571))

(assert (=> b!773972 m!718571))

(declare-fun m!718605 () Bool)

(assert (=> b!773972 m!718605))

(assert (=> b!773972 m!718605))

(assert (=> b!773972 m!718571))

(declare-fun m!718607 () Bool)

(assert (=> b!773972 m!718607))

(declare-fun m!718609 () Bool)

(assert (=> b!773980 m!718609))

(declare-fun m!718611 () Bool)

(assert (=> b!773980 m!718611))

(declare-fun m!718613 () Bool)

(assert (=> b!773971 m!718613))

(declare-fun m!718615 () Bool)

(assert (=> b!773966 m!718615))

(assert (=> b!773967 m!718571))

(assert (=> b!773967 m!718571))

(assert (=> b!773967 m!718599))

(assert (=> b!773960 m!718571))

(assert (=> b!773960 m!718571))

(assert (=> b!773960 m!718573))

(declare-fun m!718617 () Bool)

(assert (=> b!773965 m!718617))

(assert (=> b!773976 m!718571))

(assert (=> b!773976 m!718571))

(declare-fun m!718619 () Bool)

(assert (=> b!773976 m!718619))

(declare-fun m!718621 () Bool)

(assert (=> b!773975 m!718621))

(assert (=> b!773962 m!718571))

(assert (=> b!773962 m!718571))

(declare-fun m!718623 () Bool)

(assert (=> b!773962 m!718623))

(push 1)

(assert (not b!773963))

(assert (not b!773973))

(assert (not b!773964))

(assert (not b!773967))

(assert (not b!773974))

(assert (not b!773976))

(assert (not start!67030))

(assert (not b!773982))

(assert (not b!773977))

(assert (not b!773980))

(assert (not b!773971))

(assert (not b!773965))

(assert (not b!773969))

(assert (not b!773975))

(assert (not b!773972))

(assert (not b!773979))

(assert (not b!773970))

(assert (not b!773962))

(assert (not b!773960))

(assert (not b!773981))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101985 () Bool)

(assert (=> d!101985 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!773974 d!101985))

(declare-fun d!101987 () Bool)

(declare-fun lt!344727 () (_ BitVec 32))

(assert (=> d!101987 (and (bvsge lt!344727 #b00000000000000000000000000000000) (bvslt lt!344727 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101987 (= lt!344727 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101987 (validMask!0 mask!3328)))

(assert (=> d!101987 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!344727)))

(declare-fun bs!21629 () Bool)

(assert (= bs!21629 d!101987))

(declare-fun m!718645 () Bool)

(assert (=> bs!21629 m!718645))

(assert (=> bs!21629 m!718593))

(assert (=> b!773964 d!101987))

(declare-fun bm!35154 () Bool)

(declare-fun call!35157 () Bool)

(assert (=> bm!35154 (= call!35157 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!774054 () Bool)

(declare-fun e!430863 () Bool)

(assert (=> b!774054 (= e!430863 call!35157)))

(declare-fun b!774055 () Bool)

(declare-fun e!430865 () Bool)

(assert (=> b!774055 (= e!430865 call!35157)))

(declare-fun b!774056 () Bool)

(assert (=> b!774056 (= e!430863 e!430865)))

(declare-fun lt!344739 () (_ BitVec 64))

(assert (=> b!774056 (= lt!344739 (select (arr!20324 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!344740 () Unit!26710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42454 (_ BitVec 64) (_ BitVec 32)) Unit!26710)

(assert (=> b!774056 (= lt!344740 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344739 #b00000000000000000000000000000000))))

(assert (=> b!774056 (arrayContainsKey!0 a!3186 lt!344739 #b00000000000000000000000000000000)))

(declare-fun lt!344738 () Unit!26710)

(assert (=> b!774056 (= lt!344738 lt!344740)))

(declare-fun res!523514 () Bool)

(assert (=> b!774056 (= res!523514 (= (seekEntryOrOpen!0 (select (arr!20324 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7924 #b00000000000000000000000000000000)))))

(assert (=> b!774056 (=> (not res!523514) (not e!430865))))

(declare-fun d!101989 () Bool)

(declare-fun res!523513 () Bool)

(declare-fun e!430864 () Bool)

(assert (=> d!101989 (=> res!523513 e!430864)))

(assert (=> d!101989 (= res!523513 (bvsge #b00000000000000000000000000000000 (size!20745 a!3186)))))

(assert (=> d!101989 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!430864)))

(declare-fun b!774057 () Bool)

(assert (=> b!774057 (= e!430864 e!430863)))

(declare-fun c!85669 () Bool)

(assert (=> b!774057 (= c!85669 (validKeyInArray!0 (select (arr!20324 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101989 (not res!523513)) b!774057))

(assert (= (and b!774057 c!85669) b!774056))

(assert (= (and b!774057 (not c!85669)) b!774054))

(assert (= (and b!774056 res!523514) b!774055))

(assert (= (or b!774055 b!774054) bm!35154))

(declare-fun m!718673 () Bool)

(assert (=> bm!35154 m!718673))

(declare-fun m!718675 () Bool)

(assert (=> b!774056 m!718675))

(declare-fun m!718677 () Bool)

(assert (=> b!774056 m!718677))

(declare-fun m!718679 () Bool)

(assert (=> b!774056 m!718679))

(assert (=> b!774056 m!718675))

(declare-fun m!718681 () Bool)

(assert (=> b!774056 m!718681))

(assert (=> b!774057 m!718675))

(assert (=> b!774057 m!718675))

(declare-fun m!718683 () Bool)

(assert (=> b!774057 m!718683))

(assert (=> b!773975 d!101989))

(declare-fun d!102001 () Bool)

(declare-fun res!523519 () Bool)

(declare-fun e!430870 () Bool)

(assert (=> d!102001 (=> res!523519 e!430870)))

(assert (=> d!102001 (= res!523519 (= (select (arr!20324 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!102001 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!430870)))

(declare-fun b!774062 () Bool)

(declare-fun e!430871 () Bool)

(assert (=> b!774062 (= e!430870 e!430871)))

(declare-fun res!523520 () Bool)

(assert (=> b!774062 (=> (not res!523520) (not e!430871))))

(assert (=> b!774062 (= res!523520 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20745 a!3186)))))

(declare-fun b!774063 () Bool)

(assert (=> b!774063 (= e!430871 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102001 (not res!523519)) b!774062))

(assert (= (and b!774062 res!523520) b!774063))

(assert (=> d!102001 m!718675))

(declare-fun m!718685 () Bool)

(assert (=> b!774063 m!718685))

(assert (=> b!773965 d!102001))

(declare-fun lt!344764 () SeekEntryResult!7924)

(declare-fun d!102003 () Bool)

(assert (=> d!102003 (and (or (is-Undefined!7924 lt!344764) (not (is-Found!7924 lt!344764)) (and (bvsge (index!34065 lt!344764) #b00000000000000000000000000000000) (bvslt (index!34065 lt!344764) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344764) (is-Found!7924 lt!344764) (not (is-MissingVacant!7924 lt!344764)) (not (= (index!34067 lt!344764) resIntermediateIndex!5)) (and (bvsge (index!34067 lt!344764) #b00000000000000000000000000000000) (bvslt (index!34067 lt!344764) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344764) (ite (is-Found!7924 lt!344764) (= (select (arr!20324 a!3186) (index!34065 lt!344764)) (select (arr!20324 a!3186) j!159)) (and (is-MissingVacant!7924 lt!344764) (= (index!34067 lt!344764) resIntermediateIndex!5) (= (select (arr!20324 a!3186) (index!34067 lt!344764)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!430902 () SeekEntryResult!7924)

(assert (=> d!102003 (= lt!344764 e!430902)))

(declare-fun c!85690 () Bool)

(assert (=> d!102003 (= c!85690 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!344763 () (_ BitVec 64))

(assert (=> d!102003 (= lt!344763 (select (arr!20324 a!3186) resIntermediateIndex!5))))

(assert (=> d!102003 (validMask!0 mask!3328)))

(assert (=> d!102003 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344764)))

(declare-fun b!774115 () Bool)

(declare-fun e!430904 () SeekEntryResult!7924)

(assert (=> b!774115 (= e!430904 (MissingVacant!7924 resIntermediateIndex!5))))

(declare-fun b!774116 () Bool)

(declare-fun c!85688 () Bool)

(assert (=> b!774116 (= c!85688 (= lt!344763 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430903 () SeekEntryResult!7924)

(assert (=> b!774116 (= e!430903 e!430904)))

(declare-fun b!774117 () Bool)

(assert (=> b!774117 (= e!430904 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774118 () Bool)

(assert (=> b!774118 (= e!430902 e!430903)))

(declare-fun c!85689 () Bool)

(assert (=> b!774118 (= c!85689 (= lt!344763 (select (arr!20324 a!3186) j!159)))))

(declare-fun b!774119 () Bool)

(assert (=> b!774119 (= e!430903 (Found!7924 resIntermediateIndex!5))))

(declare-fun b!774120 () Bool)

(assert (=> b!774120 (= e!430902 Undefined!7924)))

(assert (= (and d!102003 c!85690) b!774120))

(assert (= (and d!102003 (not c!85690)) b!774118))

(assert (= (and b!774118 c!85689) b!774119))

(assert (= (and b!774118 (not c!85689)) b!774116))

(assert (= (and b!774116 c!85688) b!774115))

(assert (= (and b!774116 (not c!85688)) b!774117))

(declare-fun m!718699 () Bool)

(assert (=> d!102003 m!718699))

(declare-fun m!718701 () Bool)

(assert (=> d!102003 m!718701))

(assert (=> d!102003 m!718615))

(assert (=> d!102003 m!718593))

(declare-fun m!718703 () Bool)

(assert (=> b!774117 m!718703))

(assert (=> b!774117 m!718703))

(assert (=> b!774117 m!718571))

(declare-fun m!718705 () Bool)

(assert (=> b!774117 m!718705))

(assert (=> b!773976 d!102003))

(declare-fun b!774215 () Bool)

(declare-fun lt!344806 () SeekEntryResult!7924)

(assert (=> b!774215 (and (bvsge (index!34066 lt!344806) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344806) (size!20745 a!3186)))))

(declare-fun e!430961 () Bool)

(assert (=> b!774215 (= e!430961 (= (select (arr!20324 a!3186) (index!34066 lt!344806)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430962 () SeekEntryResult!7924)

(declare-fun b!774216 () Bool)

(assert (=> b!774216 (= e!430962 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344707 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20324 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774217 () Bool)

(declare-fun e!430960 () SeekEntryResult!7924)

(assert (=> b!774217 (= e!430960 (Intermediate!7924 true lt!344707 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun d!102013 () Bool)

(declare-fun e!430964 () Bool)

(assert (=> d!102013 e!430964))

(declare-fun c!85722 () Bool)

(assert (=> d!102013 (= c!85722 (and (is-Intermediate!7924 lt!344806) (undefined!8736 lt!344806)))))

(assert (=> d!102013 (= lt!344806 e!430960)))

(declare-fun c!85724 () Bool)

(assert (=> d!102013 (= c!85724 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!344805 () (_ BitVec 64))

(assert (=> d!102013 (= lt!344805 (select (arr!20324 a!3186) lt!344707))))

(assert (=> d!102013 (validMask!0 mask!3328)))

(assert (=> d!102013 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344707 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344806)))

(declare-fun b!774218 () Bool)

(assert (=> b!774218 (= e!430964 (bvsge (x!64999 lt!344806) #b01111111111111111111111111111110))))

(declare-fun b!774219 () Bool)

(declare-fun e!430963 () Bool)

(assert (=> b!774219 (= e!430964 e!430963)))

(declare-fun res!523571 () Bool)

(assert (=> b!774219 (= res!523571 (and (is-Intermediate!7924 lt!344806) (not (undefined!8736 lt!344806)) (bvslt (x!64999 lt!344806) #b01111111111111111111111111111110) (bvsge (x!64999 lt!344806) #b00000000000000000000000000000000) (bvsge (x!64999 lt!344806) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!774219 (=> (not res!523571) (not e!430963))))

(declare-fun b!774220 () Bool)

(assert (=> b!774220 (and (bvsge (index!34066 lt!344806) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344806) (size!20745 a!3186)))))

(declare-fun res!523570 () Bool)

(assert (=> b!774220 (= res!523570 (= (select (arr!20324 a!3186) (index!34066 lt!344806)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774220 (=> res!523570 e!430961)))

(declare-fun b!774221 () Bool)

(assert (=> b!774221 (= e!430962 (Intermediate!7924 false lt!344707 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774222 () Bool)

(assert (=> b!774222 (and (bvsge (index!34066 lt!344806) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344806) (size!20745 a!3186)))))

(declare-fun res!523572 () Bool)

(assert (=> b!774222 (= res!523572 (= (select (arr!20324 a!3186) (index!34066 lt!344806)) (select (arr!20324 a!3186) j!159)))))

(assert (=> b!774222 (=> res!523572 e!430961)))

(assert (=> b!774222 (= e!430963 e!430961)))

(declare-fun b!774223 () Bool)

(assert (=> b!774223 (= e!430960 e!430962)))

(declare-fun c!85723 () Bool)

(assert (=> b!774223 (= c!85723 (or (= lt!344805 (select (arr!20324 a!3186) j!159)) (= (bvadd lt!344805 lt!344805) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102013 c!85724) b!774217))

(assert (= (and d!102013 (not c!85724)) b!774223))

(assert (= (and b!774223 c!85723) b!774221))

(assert (= (and b!774223 (not c!85723)) b!774216))

(assert (= (and d!102013 c!85722) b!774218))

(assert (= (and d!102013 (not c!85722)) b!774219))

(assert (= (and b!774219 res!523571) b!774222))

(assert (= (and b!774222 (not res!523572)) b!774220))

(assert (= (and b!774220 (not res!523570)) b!774215))

(declare-fun m!718763 () Bool)

(assert (=> d!102013 m!718763))

(assert (=> d!102013 m!718593))

(declare-fun m!718765 () Bool)

(assert (=> b!774220 m!718765))

(assert (=> b!774222 m!718765))

(declare-fun m!718767 () Bool)

(assert (=> b!774216 m!718767))

(assert (=> b!774216 m!718767))

(assert (=> b!774216 m!718571))

(declare-fun m!718769 () Bool)

(assert (=> b!774216 m!718769))

(assert (=> b!774215 m!718765))

(assert (=> b!773982 d!102013))

(declare-fun b!774224 () Bool)

(declare-fun lt!344808 () SeekEntryResult!7924)

(assert (=> b!774224 (and (bvsge (index!34066 lt!344808) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344808) (size!20745 a!3186)))))

(declare-fun e!430966 () Bool)

(assert (=> b!774224 (= e!430966 (= (select (arr!20324 a!3186) (index!34066 lt!344808)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!774225 () Bool)

(declare-fun e!430967 () SeekEntryResult!7924)

(assert (=> b!774225 (= e!430967 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20324 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20324 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!430965 () SeekEntryResult!7924)

(declare-fun b!774226 () Bool)

(assert (=> b!774226 (= e!430965 (Intermediate!7924 true (toIndex!0 (select (arr!20324 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!102035 () Bool)

(declare-fun e!430969 () Bool)

(assert (=> d!102035 e!430969))

(declare-fun c!85725 () Bool)

(assert (=> d!102035 (= c!85725 (and (is-Intermediate!7924 lt!344808) (undefined!8736 lt!344808)))))

(assert (=> d!102035 (= lt!344808 e!430965)))

(declare-fun c!85727 () Bool)

(assert (=> d!102035 (= c!85727 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!344807 () (_ BitVec 64))

(assert (=> d!102035 (= lt!344807 (select (arr!20324 a!3186) (toIndex!0 (select (arr!20324 a!3186) j!159) mask!3328)))))

(assert (=> d!102035 (validMask!0 mask!3328)))

(assert (=> d!102035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20324 a!3186) j!159) mask!3328) (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344808)))

(declare-fun b!774227 () Bool)

(assert (=> b!774227 (= e!430969 (bvsge (x!64999 lt!344808) #b01111111111111111111111111111110))))

(declare-fun b!774228 () Bool)

(declare-fun e!430968 () Bool)

(assert (=> b!774228 (= e!430969 e!430968)))

(declare-fun res!523574 () Bool)

(assert (=> b!774228 (= res!523574 (and (is-Intermediate!7924 lt!344808) (not (undefined!8736 lt!344808)) (bvslt (x!64999 lt!344808) #b01111111111111111111111111111110) (bvsge (x!64999 lt!344808) #b00000000000000000000000000000000) (bvsge (x!64999 lt!344808) #b00000000000000000000000000000000)))))

(assert (=> b!774228 (=> (not res!523574) (not e!430968))))

(declare-fun b!774229 () Bool)

(assert (=> b!774229 (and (bvsge (index!34066 lt!344808) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344808) (size!20745 a!3186)))))

(declare-fun res!523573 () Bool)

(assert (=> b!774229 (= res!523573 (= (select (arr!20324 a!3186) (index!34066 lt!344808)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774229 (=> res!523573 e!430966)))

(declare-fun b!774230 () Bool)

(assert (=> b!774230 (= e!430967 (Intermediate!7924 false (toIndex!0 (select (arr!20324 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774231 () Bool)

(assert (=> b!774231 (and (bvsge (index!34066 lt!344808) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344808) (size!20745 a!3186)))))

(declare-fun res!523575 () Bool)

(assert (=> b!774231 (= res!523575 (= (select (arr!20324 a!3186) (index!34066 lt!344808)) (select (arr!20324 a!3186) j!159)))))

(assert (=> b!774231 (=> res!523575 e!430966)))

(assert (=> b!774231 (= e!430968 e!430966)))

(declare-fun b!774232 () Bool)

(assert (=> b!774232 (= e!430965 e!430967)))

(declare-fun c!85726 () Bool)

(assert (=> b!774232 (= c!85726 (or (= lt!344807 (select (arr!20324 a!3186) j!159)) (= (bvadd lt!344807 lt!344807) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102035 c!85727) b!774226))

(assert (= (and d!102035 (not c!85727)) b!774232))

(assert (= (and b!774232 c!85726) b!774230))

(assert (= (and b!774232 (not c!85726)) b!774225))

(assert (= (and d!102035 c!85725) b!774227))

(assert (= (and d!102035 (not c!85725)) b!774228))

(assert (= (and b!774228 res!523574) b!774231))

(assert (= (and b!774231 (not res!523575)) b!774229))

(assert (= (and b!774229 (not res!523573)) b!774224))

(assert (=> d!102035 m!718605))

(declare-fun m!718771 () Bool)

(assert (=> d!102035 m!718771))

(assert (=> d!102035 m!718593))

(declare-fun m!718773 () Bool)

(assert (=> b!774229 m!718773))

(assert (=> b!774231 m!718773))

(assert (=> b!774225 m!718605))

(declare-fun m!718775 () Bool)

(assert (=> b!774225 m!718775))

(assert (=> b!774225 m!718775))

(assert (=> b!774225 m!718571))

(declare-fun m!718777 () Bool)

(assert (=> b!774225 m!718777))

(assert (=> b!774224 m!718773))

(assert (=> b!773972 d!102035))

(declare-fun d!102037 () Bool)

(declare-fun lt!344820 () (_ BitVec 32))

(declare-fun lt!344819 () (_ BitVec 32))

(assert (=> d!102037 (= lt!344820 (bvmul (bvxor lt!344819 (bvlshr lt!344819 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102037 (= lt!344819 ((_ extract 31 0) (bvand (bvxor (select (arr!20324 a!3186) j!159) (bvlshr (select (arr!20324 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102037 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!523576 (let ((h!15430 ((_ extract 31 0) (bvand (bvxor (select (arr!20324 a!3186) j!159) (bvlshr (select (arr!20324 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65009 (bvmul (bvxor h!15430 (bvlshr h!15430 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65009 (bvlshr x!65009 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!523576 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!523576 #b00000000000000000000000000000000))))))

(assert (=> d!102037 (= (toIndex!0 (select (arr!20324 a!3186) j!159) mask!3328) (bvand (bvxor lt!344820 (bvlshr lt!344820 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!773972 d!102037))

(declare-fun b!774321 () Bool)

(declare-fun e!431024 () SeekEntryResult!7924)

(declare-fun lt!344851 () SeekEntryResult!7924)

(assert (=> b!774321 (= e!431024 (Found!7924 (index!34066 lt!344851)))))

(declare-fun e!431025 () SeekEntryResult!7924)

(declare-fun b!774322 () Bool)

(assert (=> b!774322 (= e!431025 (seekKeyOrZeroReturnVacant!0 (x!64999 lt!344851) (index!34066 lt!344851) (index!34066 lt!344851) (select (arr!20324 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774323 () Bool)

(declare-fun c!85759 () Bool)

(declare-fun lt!344849 () (_ BitVec 64))

(assert (=> b!774323 (= c!85759 (= lt!344849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774323 (= e!431024 e!431025)))

(declare-fun b!774324 () Bool)

(declare-fun e!431026 () SeekEntryResult!7924)

(assert (=> b!774324 (= e!431026 e!431024)))

(assert (=> b!774324 (= lt!344849 (select (arr!20324 a!3186) (index!34066 lt!344851)))))

(declare-fun c!85761 () Bool)

(assert (=> b!774324 (= c!85761 (= lt!344849 (select (arr!20324 a!3186) j!159)))))

(declare-fun d!102041 () Bool)

(declare-fun lt!344850 () SeekEntryResult!7924)

(assert (=> d!102041 (and (or (is-Undefined!7924 lt!344850) (not (is-Found!7924 lt!344850)) (and (bvsge (index!34065 lt!344850) #b00000000000000000000000000000000) (bvslt (index!34065 lt!344850) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344850) (is-Found!7924 lt!344850) (not (is-MissingZero!7924 lt!344850)) (and (bvsge (index!34064 lt!344850) #b00000000000000000000000000000000) (bvslt (index!34064 lt!344850) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344850) (is-Found!7924 lt!344850) (is-MissingZero!7924 lt!344850) (not (is-MissingVacant!7924 lt!344850)) (and (bvsge (index!34067 lt!344850) #b00000000000000000000000000000000) (bvslt (index!34067 lt!344850) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344850) (ite (is-Found!7924 lt!344850) (= (select (arr!20324 a!3186) (index!34065 lt!344850)) (select (arr!20324 a!3186) j!159)) (ite (is-MissingZero!7924 lt!344850) (= (select (arr!20324 a!3186) (index!34064 lt!344850)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7924 lt!344850) (= (select (arr!20324 a!3186) (index!34067 lt!344850)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102041 (= lt!344850 e!431026)))

(declare-fun c!85760 () Bool)

(assert (=> d!102041 (= c!85760 (and (is-Intermediate!7924 lt!344851) (undefined!8736 lt!344851)))))

(assert (=> d!102041 (= lt!344851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20324 a!3186) j!159) mask!3328) (select (arr!20324 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102041 (validMask!0 mask!3328)))

(assert (=> d!102041 (= (seekEntryOrOpen!0 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344850)))

(declare-fun b!774325 () Bool)

(assert (=> b!774325 (= e!431025 (MissingZero!7924 (index!34066 lt!344851)))))

(declare-fun b!774326 () Bool)

(assert (=> b!774326 (= e!431026 Undefined!7924)))

(assert (= (and d!102041 c!85760) b!774326))

(assert (= (and d!102041 (not c!85760)) b!774324))

(assert (= (and b!774324 c!85761) b!774321))

(assert (= (and b!774324 (not c!85761)) b!774323))

(assert (= (and b!774323 c!85759) b!774325))

(assert (= (and b!774323 (not c!85759)) b!774322))

(assert (=> b!774322 m!718571))

(declare-fun m!718835 () Bool)

(assert (=> b!774322 m!718835))

(declare-fun m!718837 () Bool)

(assert (=> b!774324 m!718837))

(declare-fun m!718839 () Bool)

(assert (=> d!102041 m!718839))

(assert (=> d!102041 m!718571))

(assert (=> d!102041 m!718605))

(declare-fun m!718841 () Bool)

(assert (=> d!102041 m!718841))

(assert (=> d!102041 m!718593))

(declare-fun m!718843 () Bool)

(assert (=> d!102041 m!718843))

(assert (=> d!102041 m!718605))

(assert (=> d!102041 m!718571))

(assert (=> d!102041 m!718607))

(assert (=> b!773962 d!102041))

(declare-fun lt!344853 () SeekEntryResult!7924)

(declare-fun d!102063 () Bool)

(assert (=> d!102063 (and (or (is-Undefined!7924 lt!344853) (not (is-Found!7924 lt!344853)) (and (bvsge (index!34065 lt!344853) #b00000000000000000000000000000000) (bvslt (index!34065 lt!344853) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344853) (is-Found!7924 lt!344853) (not (is-MissingVacant!7924 lt!344853)) (not (= (index!34067 lt!344853) resIntermediateIndex!5)) (and (bvsge (index!34067 lt!344853) #b00000000000000000000000000000000) (bvslt (index!34067 lt!344853) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344853) (ite (is-Found!7924 lt!344853) (= (select (arr!20324 a!3186) (index!34065 lt!344853)) (select (arr!20324 a!3186) j!159)) (and (is-MissingVacant!7924 lt!344853) (= (index!34067 lt!344853) resIntermediateIndex!5) (= (select (arr!20324 a!3186) (index!34067 lt!344853)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!431027 () SeekEntryResult!7924)

(assert (=> d!102063 (= lt!344853 e!431027)))

(declare-fun c!85764 () Bool)

(assert (=> d!102063 (= c!85764 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!344852 () (_ BitVec 64))

(assert (=> d!102063 (= lt!344852 (select (arr!20324 a!3186) lt!344707))))

(assert (=> d!102063 (validMask!0 mask!3328)))

(assert (=> d!102063 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344707 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344853)))

(declare-fun b!774327 () Bool)

(declare-fun e!431029 () SeekEntryResult!7924)

(assert (=> b!774327 (= e!431029 (MissingVacant!7924 resIntermediateIndex!5))))

(declare-fun b!774328 () Bool)

(declare-fun c!85762 () Bool)

(assert (=> b!774328 (= c!85762 (= lt!344852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431028 () SeekEntryResult!7924)

(assert (=> b!774328 (= e!431028 e!431029)))

(declare-fun b!774329 () Bool)

(assert (=> b!774329 (= e!431029 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344707 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774330 () Bool)

(assert (=> b!774330 (= e!431027 e!431028)))

(declare-fun c!85763 () Bool)

(assert (=> b!774330 (= c!85763 (= lt!344852 (select (arr!20324 a!3186) j!159)))))

(declare-fun b!774331 () Bool)

(assert (=> b!774331 (= e!431028 (Found!7924 lt!344707))))

(declare-fun b!774332 () Bool)

(assert (=> b!774332 (= e!431027 Undefined!7924)))

(assert (= (and d!102063 c!85764) b!774332))

(assert (= (and d!102063 (not c!85764)) b!774330))

(assert (= (and b!774330 c!85763) b!774331))

(assert (= (and b!774330 (not c!85763)) b!774328))

(assert (= (and b!774328 c!85762) b!774327))

(assert (= (and b!774328 (not c!85762)) b!774329))

(declare-fun m!718845 () Bool)

(assert (=> d!102063 m!718845))

(declare-fun m!718847 () Bool)

(assert (=> d!102063 m!718847))

(assert (=> d!102063 m!718763))

(assert (=> d!102063 m!718593))

(assert (=> b!774329 m!718767))

(assert (=> b!774329 m!718767))

(assert (=> b!774329 m!718571))

(declare-fun m!718849 () Bool)

(assert (=> b!774329 m!718849))

(assert (=> b!773973 d!102063))

(declare-fun b!774333 () Bool)

(declare-fun lt!344855 () SeekEntryResult!7924)

(assert (=> b!774333 (and (bvsge (index!34066 lt!344855) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344855) (size!20745 a!3186)))))

(declare-fun e!431031 () Bool)

(assert (=> b!774333 (= e!431031 (= (select (arr!20324 a!3186) (index!34066 lt!344855)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!774334 () Bool)

(declare-fun e!431032 () SeekEntryResult!7924)

(assert (=> b!774334 (= e!431032 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20324 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774335 () Bool)

(declare-fun e!431030 () SeekEntryResult!7924)

(assert (=> b!774335 (= e!431030 (Intermediate!7924 true index!1321 x!1131))))

(declare-fun d!102065 () Bool)

(declare-fun e!431034 () Bool)

(assert (=> d!102065 e!431034))

(declare-fun c!85765 () Bool)

(assert (=> d!102065 (= c!85765 (and (is-Intermediate!7924 lt!344855) (undefined!8736 lt!344855)))))

(assert (=> d!102065 (= lt!344855 e!431030)))

(declare-fun c!85767 () Bool)

(assert (=> d!102065 (= c!85767 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!344854 () (_ BitVec 64))

(assert (=> d!102065 (= lt!344854 (select (arr!20324 a!3186) index!1321))))

(assert (=> d!102065 (validMask!0 mask!3328)))

(assert (=> d!102065 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344855)))

(declare-fun b!774336 () Bool)

(assert (=> b!774336 (= e!431034 (bvsge (x!64999 lt!344855) #b01111111111111111111111111111110))))

(declare-fun b!774337 () Bool)

(declare-fun e!431033 () Bool)

(assert (=> b!774337 (= e!431034 e!431033)))

(declare-fun res!523604 () Bool)

(assert (=> b!774337 (= res!523604 (and (is-Intermediate!7924 lt!344855) (not (undefined!8736 lt!344855)) (bvslt (x!64999 lt!344855) #b01111111111111111111111111111110) (bvsge (x!64999 lt!344855) #b00000000000000000000000000000000) (bvsge (x!64999 lt!344855) x!1131)))))

(assert (=> b!774337 (=> (not res!523604) (not e!431033))))

(declare-fun b!774338 () Bool)

(assert (=> b!774338 (and (bvsge (index!34066 lt!344855) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344855) (size!20745 a!3186)))))

(declare-fun res!523603 () Bool)

(assert (=> b!774338 (= res!523603 (= (select (arr!20324 a!3186) (index!34066 lt!344855)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774338 (=> res!523603 e!431031)))

(declare-fun b!774339 () Bool)

(assert (=> b!774339 (= e!431032 (Intermediate!7924 false index!1321 x!1131))))

(declare-fun b!774340 () Bool)

(assert (=> b!774340 (and (bvsge (index!34066 lt!344855) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344855) (size!20745 a!3186)))))

(declare-fun res!523605 () Bool)

(assert (=> b!774340 (= res!523605 (= (select (arr!20324 a!3186) (index!34066 lt!344855)) (select (arr!20324 a!3186) j!159)))))

(assert (=> b!774340 (=> res!523605 e!431031)))

(assert (=> b!774340 (= e!431033 e!431031)))

(declare-fun b!774341 () Bool)

(assert (=> b!774341 (= e!431030 e!431032)))

(declare-fun c!85766 () Bool)

(assert (=> b!774341 (= c!85766 (or (= lt!344854 (select (arr!20324 a!3186) j!159)) (= (bvadd lt!344854 lt!344854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102065 c!85767) b!774335))

(assert (= (and d!102065 (not c!85767)) b!774341))

(assert (= (and b!774341 c!85766) b!774339))

(assert (= (and b!774341 (not c!85766)) b!774334))

(assert (= (and d!102065 c!85765) b!774336))

(assert (= (and d!102065 (not c!85765)) b!774337))

(assert (= (and b!774337 res!523604) b!774340))

(assert (= (and b!774340 (not res!523605)) b!774338))

(assert (= (and b!774338 (not res!523603)) b!774333))

(declare-fun m!718851 () Bool)

(assert (=> d!102065 m!718851))

(assert (=> d!102065 m!718593))

(declare-fun m!718853 () Bool)

(assert (=> b!774338 m!718853))

(assert (=> b!774340 m!718853))

(assert (=> b!774334 m!718597))

(assert (=> b!774334 m!718597))

(assert (=> b!774334 m!718571))

(declare-fun m!718855 () Bool)

(assert (=> b!774334 m!718855))

(assert (=> b!774333 m!718853))

(assert (=> b!773963 d!102065))

(declare-fun d!102067 () Bool)

(assert (=> d!102067 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67030 d!102067))

(declare-fun d!102069 () Bool)

(assert (=> d!102069 (= (array_inv!16120 a!3186) (bvsge (size!20745 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67030 d!102069))

(declare-fun b!774354 () Bool)

(declare-fun lt!344861 () SeekEntryResult!7924)

(assert (=> b!774354 (and (bvsge (index!34066 lt!344861) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344861) (size!20745 lt!344708)))))

(declare-fun e!431042 () Bool)

(assert (=> b!774354 (= e!431042 (= (select (arr!20324 lt!344708) (index!34066 lt!344861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431043 () SeekEntryResult!7924)

(declare-fun b!774355 () Bool)

(assert (=> b!774355 (= e!431043 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!344699 lt!344708 mask!3328))))

(declare-fun b!774356 () Bool)

(declare-fun e!431041 () SeekEntryResult!7924)

(assert (=> b!774356 (= e!431041 (Intermediate!7924 true index!1321 x!1131))))

(declare-fun d!102071 () Bool)

(declare-fun e!431045 () Bool)

(assert (=> d!102071 e!431045))

(declare-fun c!85774 () Bool)

(assert (=> d!102071 (= c!85774 (and (is-Intermediate!7924 lt!344861) (undefined!8736 lt!344861)))))

(assert (=> d!102071 (= lt!344861 e!431041)))

(declare-fun c!85776 () Bool)

(assert (=> d!102071 (= c!85776 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!344860 () (_ BitVec 64))

(assert (=> d!102071 (= lt!344860 (select (arr!20324 lt!344708) index!1321))))

(assert (=> d!102071 (validMask!0 mask!3328)))

(assert (=> d!102071 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344699 lt!344708 mask!3328) lt!344861)))

(declare-fun b!774357 () Bool)

(assert (=> b!774357 (= e!431045 (bvsge (x!64999 lt!344861) #b01111111111111111111111111111110))))

(declare-fun b!774358 () Bool)

(declare-fun e!431044 () Bool)

(assert (=> b!774358 (= e!431045 e!431044)))

(declare-fun res!523607 () Bool)

(assert (=> b!774358 (= res!523607 (and (is-Intermediate!7924 lt!344861) (not (undefined!8736 lt!344861)) (bvslt (x!64999 lt!344861) #b01111111111111111111111111111110) (bvsge (x!64999 lt!344861) #b00000000000000000000000000000000) (bvsge (x!64999 lt!344861) x!1131)))))

(assert (=> b!774358 (=> (not res!523607) (not e!431044))))

(declare-fun b!774359 () Bool)

(assert (=> b!774359 (and (bvsge (index!34066 lt!344861) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344861) (size!20745 lt!344708)))))

(declare-fun res!523606 () Bool)

(assert (=> b!774359 (= res!523606 (= (select (arr!20324 lt!344708) (index!34066 lt!344861)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774359 (=> res!523606 e!431042)))

(declare-fun b!774360 () Bool)

(assert (=> b!774360 (= e!431043 (Intermediate!7924 false index!1321 x!1131))))

(declare-fun b!774361 () Bool)

(assert (=> b!774361 (and (bvsge (index!34066 lt!344861) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344861) (size!20745 lt!344708)))))

(declare-fun res!523608 () Bool)

(assert (=> b!774361 (= res!523608 (= (select (arr!20324 lt!344708) (index!34066 lt!344861)) lt!344699))))

(assert (=> b!774361 (=> res!523608 e!431042)))

(assert (=> b!774361 (= e!431044 e!431042)))

(declare-fun b!774362 () Bool)

(assert (=> b!774362 (= e!431041 e!431043)))

(declare-fun c!85775 () Bool)

(assert (=> b!774362 (= c!85775 (or (= lt!344860 lt!344699) (= (bvadd lt!344860 lt!344860) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102071 c!85776) b!774356))

(assert (= (and d!102071 (not c!85776)) b!774362))

(assert (= (and b!774362 c!85775) b!774360))

(assert (= (and b!774362 (not c!85775)) b!774355))

(assert (= (and d!102071 c!85774) b!774357))

(assert (= (and d!102071 (not c!85774)) b!774358))

(assert (= (and b!774358 res!523607) b!774361))

(assert (= (and b!774361 (not res!523608)) b!774359))

(assert (= (and b!774359 (not res!523606)) b!774354))

(declare-fun m!718857 () Bool)

(assert (=> d!102071 m!718857))

(assert (=> d!102071 m!718593))

(declare-fun m!718859 () Bool)

(assert (=> b!774359 m!718859))

(assert (=> b!774361 m!718859))

(assert (=> b!774355 m!718597))

(assert (=> b!774355 m!718597))

(declare-fun m!718861 () Bool)

(assert (=> b!774355 m!718861))

(assert (=> b!774354 m!718859))

(assert (=> b!773969 d!102071))

(declare-fun b!774363 () Bool)

(declare-fun lt!344863 () SeekEntryResult!7924)

(assert (=> b!774363 (and (bvsge (index!34066 lt!344863) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344863) (size!20745 lt!344708)))))

(declare-fun e!431047 () Bool)

(assert (=> b!774363 (= e!431047 (= (select (arr!20324 lt!344708) (index!34066 lt!344863)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!774364 () Bool)

(declare-fun e!431048 () SeekEntryResult!7924)

(assert (=> b!774364 (= e!431048 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!344699 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!344699 lt!344708 mask!3328))))

(declare-fun b!774365 () Bool)

(declare-fun e!431046 () SeekEntryResult!7924)

(assert (=> b!774365 (= e!431046 (Intermediate!7924 true (toIndex!0 lt!344699 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!102073 () Bool)

(declare-fun e!431050 () Bool)

(assert (=> d!102073 e!431050))

(declare-fun c!85777 () Bool)

(assert (=> d!102073 (= c!85777 (and (is-Intermediate!7924 lt!344863) (undefined!8736 lt!344863)))))

(assert (=> d!102073 (= lt!344863 e!431046)))

(declare-fun c!85779 () Bool)

(assert (=> d!102073 (= c!85779 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!344862 () (_ BitVec 64))

(assert (=> d!102073 (= lt!344862 (select (arr!20324 lt!344708) (toIndex!0 lt!344699 mask!3328)))))

(assert (=> d!102073 (validMask!0 mask!3328)))

(assert (=> d!102073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344699 mask!3328) lt!344699 lt!344708 mask!3328) lt!344863)))

(declare-fun b!774366 () Bool)

(assert (=> b!774366 (= e!431050 (bvsge (x!64999 lt!344863) #b01111111111111111111111111111110))))

(declare-fun b!774367 () Bool)

(declare-fun e!431049 () Bool)

(assert (=> b!774367 (= e!431050 e!431049)))

(declare-fun res!523610 () Bool)

(assert (=> b!774367 (= res!523610 (and (is-Intermediate!7924 lt!344863) (not (undefined!8736 lt!344863)) (bvslt (x!64999 lt!344863) #b01111111111111111111111111111110) (bvsge (x!64999 lt!344863) #b00000000000000000000000000000000) (bvsge (x!64999 lt!344863) #b00000000000000000000000000000000)))))

(assert (=> b!774367 (=> (not res!523610) (not e!431049))))

(declare-fun b!774368 () Bool)

(assert (=> b!774368 (and (bvsge (index!34066 lt!344863) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344863) (size!20745 lt!344708)))))

(declare-fun res!523609 () Bool)

(assert (=> b!774368 (= res!523609 (= (select (arr!20324 lt!344708) (index!34066 lt!344863)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774368 (=> res!523609 e!431047)))

(declare-fun b!774369 () Bool)

(assert (=> b!774369 (= e!431048 (Intermediate!7924 false (toIndex!0 lt!344699 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774370 () Bool)

(assert (=> b!774370 (and (bvsge (index!34066 lt!344863) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344863) (size!20745 lt!344708)))))

(declare-fun res!523611 () Bool)

(assert (=> b!774370 (= res!523611 (= (select (arr!20324 lt!344708) (index!34066 lt!344863)) lt!344699))))

(assert (=> b!774370 (=> res!523611 e!431047)))

(assert (=> b!774370 (= e!431049 e!431047)))

(declare-fun b!774371 () Bool)

(assert (=> b!774371 (= e!431046 e!431048)))

(declare-fun c!85778 () Bool)

(assert (=> b!774371 (= c!85778 (or (= lt!344862 lt!344699) (= (bvadd lt!344862 lt!344862) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102073 c!85779) b!774365))

(assert (= (and d!102073 (not c!85779)) b!774371))

(assert (= (and b!774371 c!85778) b!774369))

(assert (= (and b!774371 (not c!85778)) b!774364))

(assert (= (and d!102073 c!85777) b!774366))

(assert (= (and d!102073 (not c!85777)) b!774367))

(assert (= (and b!774367 res!523610) b!774370))

(assert (= (and b!774370 (not res!523611)) b!774368))

(assert (= (and b!774368 (not res!523609)) b!774363))

(assert (=> d!102073 m!718581))

(declare-fun m!718863 () Bool)

(assert (=> d!102073 m!718863))

(assert (=> d!102073 m!718593))

(declare-fun m!718865 () Bool)

(assert (=> b!774368 m!718865))

(assert (=> b!774370 m!718865))

(assert (=> b!774364 m!718581))

(declare-fun m!718867 () Bool)

(assert (=> b!774364 m!718867))

(assert (=> b!774364 m!718867))

(declare-fun m!718869 () Bool)

(assert (=> b!774364 m!718869))

(assert (=> b!774363 m!718865))

(assert (=> b!773969 d!102073))

(declare-fun d!102075 () Bool)

(declare-fun lt!344867 () (_ BitVec 32))

(declare-fun lt!344866 () (_ BitVec 32))

(assert (=> d!102075 (= lt!344867 (bvmul (bvxor lt!344866 (bvlshr lt!344866 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102075 (= lt!344866 ((_ extract 31 0) (bvand (bvxor lt!344699 (bvlshr lt!344699 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102075 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!523576 (let ((h!15430 ((_ extract 31 0) (bvand (bvxor lt!344699 (bvlshr lt!344699 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65009 (bvmul (bvxor h!15430 (bvlshr h!15430 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65009 (bvlshr x!65009 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!523576 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!523576 #b00000000000000000000000000000000))))))

(assert (=> d!102075 (= (toIndex!0 lt!344699 mask!3328) (bvand (bvxor lt!344867 (bvlshr lt!344867 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!773969 d!102075))

(declare-fun call!35169 () Bool)

(declare-fun bm!35166 () Bool)

(assert (=> bm!35166 (= call!35169 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!774378 () Bool)

(declare-fun e!431054 () Bool)

(assert (=> b!774378 (= e!431054 call!35169)))

(declare-fun b!774379 () Bool)

(declare-fun e!431056 () Bool)

(assert (=> b!774379 (= e!431056 call!35169)))

(declare-fun b!774380 () Bool)

(assert (=> b!774380 (= e!431054 e!431056)))

(declare-fun lt!344869 () (_ BitVec 64))

(assert (=> b!774380 (= lt!344869 (select (arr!20324 a!3186) j!159))))

(declare-fun lt!344870 () Unit!26710)

(assert (=> b!774380 (= lt!344870 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344869 j!159))))

(assert (=> b!774380 (arrayContainsKey!0 a!3186 lt!344869 #b00000000000000000000000000000000)))

(declare-fun lt!344868 () Unit!26710)

(assert (=> b!774380 (= lt!344868 lt!344870)))

(declare-fun res!523613 () Bool)

(assert (=> b!774380 (= res!523613 (= (seekEntryOrOpen!0 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) (Found!7924 j!159)))))

(assert (=> b!774380 (=> (not res!523613) (not e!431056))))

(declare-fun d!102079 () Bool)

(declare-fun res!523612 () Bool)

(declare-fun e!431055 () Bool)

(assert (=> d!102079 (=> res!523612 e!431055)))

(assert (=> d!102079 (= res!523612 (bvsge j!159 (size!20745 a!3186)))))

(assert (=> d!102079 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!431055)))

(declare-fun b!774381 () Bool)

(assert (=> b!774381 (= e!431055 e!431054)))

(declare-fun c!85783 () Bool)

(assert (=> b!774381 (= c!85783 (validKeyInArray!0 (select (arr!20324 a!3186) j!159)))))

(assert (= (and d!102079 (not res!523612)) b!774381))

(assert (= (and b!774381 c!85783) b!774380))

(assert (= (and b!774381 (not c!85783)) b!774378))

(assert (= (and b!774380 res!523613) b!774379))

(assert (= (or b!774379 b!774378) bm!35166))

(declare-fun m!718879 () Bool)

(assert (=> bm!35166 m!718879))

(assert (=> b!774380 m!718571))

(declare-fun m!718881 () Bool)

(assert (=> b!774380 m!718881))

(declare-fun m!718883 () Bool)

(assert (=> b!774380 m!718883))

(assert (=> b!774380 m!718571))

(assert (=> b!774380 m!718623))

(assert (=> b!774381 m!718571))

(assert (=> b!774381 m!718571))

(assert (=> b!774381 m!718591))

(assert (=> b!773980 d!102079))

(declare-fun d!102081 () Bool)

(assert (=> d!102081 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!344883 () Unit!26710)

(declare-fun choose!38 (array!42454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26710)

(assert (=> d!102081 (= lt!344883 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102081 (validMask!0 mask!3328)))

(assert (=> d!102081 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!344883)))

(declare-fun bs!21633 () Bool)

(assert (= bs!21633 d!102081))

(assert (=> bs!21633 m!718609))

(declare-fun m!718899 () Bool)

(assert (=> bs!21633 m!718899))

(assert (=> bs!21633 m!718593))

(assert (=> b!773980 d!102081))

(declare-fun b!774403 () Bool)

(declare-fun lt!344885 () SeekEntryResult!7924)

(assert (=> b!774403 (and (bvsge (index!34066 lt!344885) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344885) (size!20745 lt!344708)))))

(declare-fun e!431069 () Bool)

(assert (=> b!774403 (= e!431069 (= (select (arr!20324 lt!344708) (index!34066 lt!344885)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431070 () SeekEntryResult!7924)

(declare-fun b!774404 () Bool)

(assert (=> b!774404 (= e!431070 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344707 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!344699 lt!344708 mask!3328))))

(declare-fun b!774405 () Bool)

(declare-fun e!431068 () SeekEntryResult!7924)

(assert (=> b!774405 (= e!431068 (Intermediate!7924 true lt!344707 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun d!102089 () Bool)

(declare-fun e!431072 () Bool)

(assert (=> d!102089 e!431072))

(declare-fun c!85793 () Bool)

(assert (=> d!102089 (= c!85793 (and (is-Intermediate!7924 lt!344885) (undefined!8736 lt!344885)))))

(assert (=> d!102089 (= lt!344885 e!431068)))

(declare-fun c!85795 () Bool)

(assert (=> d!102089 (= c!85795 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!344884 () (_ BitVec 64))

(assert (=> d!102089 (= lt!344884 (select (arr!20324 lt!344708) lt!344707))))

(assert (=> d!102089 (validMask!0 mask!3328)))

(assert (=> d!102089 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344707 lt!344699 lt!344708 mask!3328) lt!344885)))

(declare-fun b!774406 () Bool)

(assert (=> b!774406 (= e!431072 (bvsge (x!64999 lt!344885) #b01111111111111111111111111111110))))

(declare-fun b!774407 () Bool)

(declare-fun e!431071 () Bool)

(assert (=> b!774407 (= e!431072 e!431071)))

(declare-fun res!523618 () Bool)

(assert (=> b!774407 (= res!523618 (and (is-Intermediate!7924 lt!344885) (not (undefined!8736 lt!344885)) (bvslt (x!64999 lt!344885) #b01111111111111111111111111111110) (bvsge (x!64999 lt!344885) #b00000000000000000000000000000000) (bvsge (x!64999 lt!344885) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!774407 (=> (not res!523618) (not e!431071))))

(declare-fun b!774408 () Bool)

(assert (=> b!774408 (and (bvsge (index!34066 lt!344885) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344885) (size!20745 lt!344708)))))

(declare-fun res!523617 () Bool)

(assert (=> b!774408 (= res!523617 (= (select (arr!20324 lt!344708) (index!34066 lt!344885)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774408 (=> res!523617 e!431069)))

(declare-fun b!774409 () Bool)

(assert (=> b!774409 (= e!431070 (Intermediate!7924 false lt!344707 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774410 () Bool)

(assert (=> b!774410 (and (bvsge (index!34066 lt!344885) #b00000000000000000000000000000000) (bvslt (index!34066 lt!344885) (size!20745 lt!344708)))))

(declare-fun res!523619 () Bool)

(assert (=> b!774410 (= res!523619 (= (select (arr!20324 lt!344708) (index!34066 lt!344885)) lt!344699))))

(assert (=> b!774410 (=> res!523619 e!431069)))

(assert (=> b!774410 (= e!431071 e!431069)))

(declare-fun b!774411 () Bool)

(assert (=> b!774411 (= e!431068 e!431070)))

(declare-fun c!85794 () Bool)

(assert (=> b!774411 (= c!85794 (or (= lt!344884 lt!344699) (= (bvadd lt!344884 lt!344884) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102089 c!85795) b!774405))

(assert (= (and d!102089 (not c!85795)) b!774411))

(assert (= (and b!774411 c!85794) b!774409))

(assert (= (and b!774411 (not c!85794)) b!774404))

(assert (= (and d!102089 c!85793) b!774406))

(assert (= (and d!102089 (not c!85793)) b!774407))

(assert (= (and b!774407 res!523618) b!774410))

(assert (= (and b!774410 (not res!523619)) b!774408))

(assert (= (and b!774408 (not res!523617)) b!774403))

(declare-fun m!718911 () Bool)

(assert (=> d!102089 m!718911))

(assert (=> d!102089 m!718593))

(declare-fun m!718913 () Bool)

(assert (=> b!774408 m!718913))

(assert (=> b!774410 m!718913))

(assert (=> b!774404 m!718767))

(assert (=> b!774404 m!718767))

(declare-fun m!718915 () Bool)

(assert (=> b!774404 m!718915))

(assert (=> b!774403 m!718913))

(assert (=> b!773970 d!102089))

(declare-fun d!102093 () Bool)

(assert (=> d!102093 (= (validKeyInArray!0 (select (arr!20324 a!3186) j!159)) (and (not (= (select (arr!20324 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20324 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!773981 d!102093))

(assert (=> b!773960 d!102013))

(declare-fun b!774421 () Bool)

(declare-fun e!431078 () SeekEntryResult!7924)

(declare-fun lt!344890 () SeekEntryResult!7924)

(assert (=> b!774421 (= e!431078 (Found!7924 (index!34066 lt!344890)))))

(declare-fun b!774422 () Bool)

(declare-fun e!431079 () SeekEntryResult!7924)

(assert (=> b!774422 (= e!431079 (seekKeyOrZeroReturnVacant!0 (x!64999 lt!344890) (index!34066 lt!344890) (index!34066 lt!344890) k!2102 a!3186 mask!3328))))

(declare-fun b!774423 () Bool)

(declare-fun c!85799 () Bool)

(declare-fun lt!344888 () (_ BitVec 64))

(assert (=> b!774423 (= c!85799 (= lt!344888 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774423 (= e!431078 e!431079)))

(declare-fun b!774424 () Bool)

(declare-fun e!431080 () SeekEntryResult!7924)

(assert (=> b!774424 (= e!431080 e!431078)))

(assert (=> b!774424 (= lt!344888 (select (arr!20324 a!3186) (index!34066 lt!344890)))))

(declare-fun c!85801 () Bool)

(assert (=> b!774424 (= c!85801 (= lt!344888 k!2102))))

(declare-fun d!102095 () Bool)

(declare-fun lt!344889 () SeekEntryResult!7924)

(assert (=> d!102095 (and (or (is-Undefined!7924 lt!344889) (not (is-Found!7924 lt!344889)) (and (bvsge (index!34065 lt!344889) #b00000000000000000000000000000000) (bvslt (index!34065 lt!344889) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344889) (is-Found!7924 lt!344889) (not (is-MissingZero!7924 lt!344889)) (and (bvsge (index!34064 lt!344889) #b00000000000000000000000000000000) (bvslt (index!34064 lt!344889) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344889) (is-Found!7924 lt!344889) (is-MissingZero!7924 lt!344889) (not (is-MissingVacant!7924 lt!344889)) (and (bvsge (index!34067 lt!344889) #b00000000000000000000000000000000) (bvslt (index!34067 lt!344889) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344889) (ite (is-Found!7924 lt!344889) (= (select (arr!20324 a!3186) (index!34065 lt!344889)) k!2102) (ite (is-MissingZero!7924 lt!344889) (= (select (arr!20324 a!3186) (index!34064 lt!344889)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7924 lt!344889) (= (select (arr!20324 a!3186) (index!34067 lt!344889)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102095 (= lt!344889 e!431080)))

(declare-fun c!85800 () Bool)

(assert (=> d!102095 (= c!85800 (and (is-Intermediate!7924 lt!344890) (undefined!8736 lt!344890)))))

(assert (=> d!102095 (= lt!344890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102095 (validMask!0 mask!3328)))

(assert (=> d!102095 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!344889)))

(declare-fun b!774425 () Bool)

(assert (=> b!774425 (= e!431079 (MissingZero!7924 (index!34066 lt!344890)))))

(declare-fun b!774426 () Bool)

(assert (=> b!774426 (= e!431080 Undefined!7924)))

(assert (= (and d!102095 c!85800) b!774426))

(assert (= (and d!102095 (not c!85800)) b!774424))

(assert (= (and b!774424 c!85801) b!774421))

(assert (= (and b!774424 (not c!85801)) b!774423))

(assert (= (and b!774423 c!85799) b!774425))

(assert (= (and b!774423 (not c!85799)) b!774422))

(declare-fun m!718923 () Bool)

(assert (=> b!774422 m!718923))

(declare-fun m!718925 () Bool)

(assert (=> b!774424 m!718925))

(declare-fun m!718927 () Bool)

(assert (=> d!102095 m!718927))

(declare-fun m!718929 () Bool)

(assert (=> d!102095 m!718929))

(declare-fun m!718931 () Bool)

(assert (=> d!102095 m!718931))

(assert (=> d!102095 m!718593))

(declare-fun m!718933 () Bool)

(assert (=> d!102095 m!718933))

(assert (=> d!102095 m!718929))

(declare-fun m!718935 () Bool)

(assert (=> d!102095 m!718935))

(assert (=> b!773971 d!102095))

(declare-fun d!102099 () Bool)

(declare-fun lt!344894 () SeekEntryResult!7924)

(assert (=> d!102099 (and (or (is-Undefined!7924 lt!344894) (not (is-Found!7924 lt!344894)) (and (bvsge (index!34065 lt!344894) #b00000000000000000000000000000000) (bvslt (index!34065 lt!344894) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344894) (is-Found!7924 lt!344894) (not (is-MissingVacant!7924 lt!344894)) (not (= (index!34067 lt!344894) resIntermediateIndex!5)) (and (bvsge (index!34067 lt!344894) #b00000000000000000000000000000000) (bvslt (index!34067 lt!344894) (size!20745 a!3186)))) (or (is-Undefined!7924 lt!344894) (ite (is-Found!7924 lt!344894) (= (select (arr!20324 a!3186) (index!34065 lt!344894)) (select (arr!20324 a!3186) j!159)) (and (is-MissingVacant!7924 lt!344894) (= (index!34067 lt!344894) resIntermediateIndex!5) (= (select (arr!20324 a!3186) (index!34067 lt!344894)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!431086 () SeekEntryResult!7924)

(assert (=> d!102099 (= lt!344894 e!431086)))

(declare-fun c!85807 () Bool)

(assert (=> d!102099 (= c!85807 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!344893 () (_ BitVec 64))

(assert (=> d!102099 (= lt!344893 (select (arr!20324 a!3186) index!1321))))

(assert (=> d!102099 (validMask!0 mask!3328)))

(assert (=> d!102099 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328) lt!344894)))

(declare-fun b!774436 () Bool)

(declare-fun e!431088 () SeekEntryResult!7924)

(assert (=> b!774436 (= e!431088 (MissingVacant!7924 resIntermediateIndex!5))))

(declare-fun b!774437 () Bool)

(declare-fun c!85805 () Bool)

(assert (=> b!774437 (= c!85805 (= lt!344893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431087 () SeekEntryResult!7924)

(assert (=> b!774437 (= e!431087 e!431088)))

(declare-fun b!774438 () Bool)

(assert (=> b!774438 (= e!431088 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20324 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774439 () Bool)

(assert (=> b!774439 (= e!431086 e!431087)))

(declare-fun c!85806 () Bool)

(assert (=> b!774439 (= c!85806 (= lt!344893 (select (arr!20324 a!3186) j!159)))))

(declare-fun b!774440 () Bool)

(assert (=> b!774440 (= e!431087 (Found!7924 index!1321))))

(declare-fun b!774441 () Bool)

(assert (=> b!774441 (= e!431086 Undefined!7924)))

(assert (= (and d!102099 c!85807) b!774441))

(assert (= (and d!102099 (not c!85807)) b!774439))

(assert (= (and b!774439 c!85806) b!774440))

(assert (= (and b!774439 (not c!85806)) b!774437))

(assert (= (and b!774437 c!85805) b!774436))

(assert (= (and b!774437 (not c!85805)) b!774438))

(declare-fun m!718945 () Bool)

(assert (=> d!102099 m!718945))

(declare-fun m!718947 () Bool)

(assert (=> d!102099 m!718947))

(assert (=> d!102099 m!718851))

(assert (=> d!102099 m!718593))

(assert (=> b!774438 m!718597))

(assert (=> b!774438 m!718597))

(assert (=> b!774438 m!718571))

(declare-fun m!718949 () Bool)

(assert (=> b!774438 m!718949))

(assert (=> b!773977 d!102099))

(assert (=> b!773977 d!102063))

(assert (=> b!773967 d!102099))

(declare-fun b!774467 () Bool)

(declare-fun e!431107 () Bool)

(declare-fun contains!4096 (List!14326 (_ BitVec 64)) Bool)

(assert (=> b!774467 (= e!431107 (contains!4096 Nil!14323 (select (arr!20324 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!774468 () Bool)

(declare-fun e!431105 () Bool)

(declare-fun call!35172 () Bool)

(assert (=> b!774468 (= e!431105 call!35172)))

(declare-fun bm!35169 () Bool)

(declare-fun c!85816 () Bool)

(assert (=> bm!35169 (= call!35172 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85816 (Cons!14322 (select (arr!20324 a!3186) #b00000000000000000000000000000000) Nil!14323) Nil!14323)))))

(declare-fun b!774469 () Bool)

(declare-fun e!431108 () Bool)

(assert (=> b!774469 (= e!431108 e!431105)))

(assert (=> b!774469 (= c!85816 (validKeyInArray!0 (select (arr!20324 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!774470 () Bool)

(declare-fun e!431106 () Bool)

(assert (=> b!774470 (= e!431106 e!431108)))

(declare-fun res!523636 () Bool)

(assert (=> b!774470 (=> (not res!523636) (not e!431108))))

(assert (=> b!774470 (= res!523636 (not e!431107))))

(declare-fun res!523635 () Bool)

(assert (=> b!774470 (=> (not res!523635) (not e!431107))))

(assert (=> b!774470 (= res!523635 (validKeyInArray!0 (select (arr!20324 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102105 () Bool)

(declare-fun res!523637 () Bool)

(assert (=> d!102105 (=> res!523637 e!431106)))

(assert (=> d!102105 (= res!523637 (bvsge #b00000000000000000000000000000000 (size!20745 a!3186)))))

(assert (=> d!102105 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14323) e!431106)))

(declare-fun b!774471 () Bool)

(assert (=> b!774471 (= e!431105 call!35172)))

(assert (= (and d!102105 (not res!523637)) b!774470))

(assert (= (and b!774470 res!523635) b!774467))

(assert (= (and b!774470 res!523636) b!774469))

(assert (= (and b!774469 c!85816) b!774468))

(assert (= (and b!774469 (not c!85816)) b!774471))

(assert (= (or b!774468 b!774471) bm!35169))

(assert (=> b!774467 m!718675))

(assert (=> b!774467 m!718675))

(declare-fun m!718963 () Bool)

(assert (=> b!774467 m!718963))

(assert (=> bm!35169 m!718675))

(declare-fun m!718965 () Bool)

(assert (=> bm!35169 m!718965))

(assert (=> b!774469 m!718675))

(assert (=> b!774469 m!718675))

(assert (=> b!774469 m!718683))

(assert (=> b!774470 m!718675))

(assert (=> b!774470 m!718675))

(assert (=> b!774470 m!718683))

(assert (=> b!773979 d!102105))

(push 1)

