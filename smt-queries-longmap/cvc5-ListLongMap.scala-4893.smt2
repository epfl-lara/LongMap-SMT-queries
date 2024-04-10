; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67470 () Bool)

(assert start!67470)

(declare-fun b!780778 () Bool)

(declare-fun res!528314 () Bool)

(declare-fun e!434291 () Bool)

(assert (=> b!780778 (=> (not res!528314) (not e!434291))))

(declare-datatypes ((array!42636 0))(
  ( (array!42637 (arr!20409 (Array (_ BitVec 32) (_ BitVec 64))) (size!20830 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42636)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780778 (= res!528314 (validKeyInArray!0 (select (arr!20409 a!3186) j!159)))))

(declare-fun b!780779 () Bool)

(declare-fun e!434294 () Bool)

(declare-fun e!434293 () Bool)

(assert (=> b!780779 (= e!434294 e!434293)))

(declare-fun res!528313 () Bool)

(assert (=> b!780779 (=> (not res!528313) (not e!434293))))

(declare-datatypes ((SeekEntryResult!8009 0))(
  ( (MissingZero!8009 (index!34404 (_ BitVec 32))) (Found!8009 (index!34405 (_ BitVec 32))) (Intermediate!8009 (undefined!8821 Bool) (index!34406 (_ BitVec 32)) (x!65355 (_ BitVec 32))) (Undefined!8009) (MissingVacant!8009 (index!34407 (_ BitVec 32))) )
))
(declare-fun lt!347950 () SeekEntryResult!8009)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42636 (_ BitVec 32)) SeekEntryResult!8009)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780779 (= res!528313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20409 a!3186) j!159) mask!3328) (select (arr!20409 a!3186) j!159) a!3186 mask!3328) lt!347950))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780779 (= lt!347950 (Intermediate!8009 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780780 () Bool)

(declare-fun res!528323 () Bool)

(assert (=> b!780780 (=> (not res!528323) (not e!434291))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780780 (= res!528323 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780781 () Bool)

(declare-fun res!528309 () Bool)

(assert (=> b!780781 (=> (not res!528309) (not e!434293))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!780781 (= res!528309 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20409 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780782 () Bool)

(declare-datatypes ((Unit!26924 0))(
  ( (Unit!26925) )
))
(declare-fun e!434289 () Unit!26924)

(declare-fun Unit!26926 () Unit!26924)

(assert (=> b!780782 (= e!434289 Unit!26926)))

(assert (=> b!780782 false))

(declare-fun b!780783 () Bool)

(declare-fun res!528322 () Bool)

(assert (=> b!780783 (=> (not res!528322) (not e!434294))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!780783 (= res!528322 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20830 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20830 a!3186))))))

(declare-fun b!780784 () Bool)

(declare-fun res!528308 () Bool)

(declare-fun e!434286 () Bool)

(assert (=> b!780784 (=> res!528308 e!434286)))

(declare-fun lt!347947 () (_ BitVec 64))

(assert (=> b!780784 (= res!528308 (= (select (store (arr!20409 a!3186) i!1173 k!2102) index!1321) lt!347947))))

(declare-fun b!780785 () Bool)

(declare-fun res!528318 () Bool)

(assert (=> b!780785 (=> (not res!528318) (not e!434294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42636 (_ BitVec 32)) Bool)

(assert (=> b!780785 (= res!528318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780786 () Bool)

(declare-fun e!434288 () Bool)

(assert (=> b!780786 (= e!434288 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20409 a!3186) j!159) a!3186 mask!3328) lt!347950))))

(declare-fun b!780787 () Bool)

(declare-fun res!528315 () Bool)

(assert (=> b!780787 (=> (not res!528315) (not e!434291))))

(assert (=> b!780787 (= res!528315 (validKeyInArray!0 k!2102))))

(declare-fun lt!347954 () SeekEntryResult!8009)

(declare-fun b!780788 () Bool)

(declare-fun e!434290 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42636 (_ BitVec 32)) SeekEntryResult!8009)

(assert (=> b!780788 (= e!434290 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20409 a!3186) j!159) a!3186 mask!3328) lt!347954))))

(declare-fun b!780789 () Bool)

(declare-fun res!528312 () Bool)

(assert (=> b!780789 (=> (not res!528312) (not e!434291))))

(assert (=> b!780789 (= res!528312 (and (= (size!20830 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20830 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20830 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!528320 () Bool)

(assert (=> start!67470 (=> (not res!528320) (not e!434291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67470 (= res!528320 (validMask!0 mask!3328))))

(assert (=> start!67470 e!434291))

(assert (=> start!67470 true))

(declare-fun array_inv!16205 (array!42636) Bool)

(assert (=> start!67470 (array_inv!16205 a!3186)))

(declare-fun b!780790 () Bool)

(declare-fun e!434287 () Bool)

(assert (=> b!780790 (= e!434293 e!434287)))

(declare-fun res!528317 () Bool)

(assert (=> b!780790 (=> (not res!528317) (not e!434287))))

(declare-fun lt!347948 () SeekEntryResult!8009)

(declare-fun lt!347952 () SeekEntryResult!8009)

(assert (=> b!780790 (= res!528317 (= lt!347948 lt!347952))))

(declare-fun lt!347949 () array!42636)

(assert (=> b!780790 (= lt!347952 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347947 lt!347949 mask!3328))))

(assert (=> b!780790 (= lt!347948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347947 mask!3328) lt!347947 lt!347949 mask!3328))))

(assert (=> b!780790 (= lt!347947 (select (store (arr!20409 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!780790 (= lt!347949 (array!42637 (store (arr!20409 a!3186) i!1173 k!2102) (size!20830 a!3186)))))

(declare-fun b!780791 () Bool)

(assert (=> b!780791 (= e!434291 e!434294)))

(declare-fun res!528310 () Bool)

(assert (=> b!780791 (=> (not res!528310) (not e!434294))))

(declare-fun lt!347945 () SeekEntryResult!8009)

(assert (=> b!780791 (= res!528310 (or (= lt!347945 (MissingZero!8009 i!1173)) (= lt!347945 (MissingVacant!8009 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42636 (_ BitVec 32)) SeekEntryResult!8009)

(assert (=> b!780791 (= lt!347945 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!780792 () Bool)

(assert (=> b!780792 (= e!434288 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20409 a!3186) j!159) a!3186 mask!3328) (Found!8009 j!159)))))

(declare-fun b!780793 () Bool)

(assert (=> b!780793 (= e!434287 (not e!434286))))

(declare-fun res!528321 () Bool)

(assert (=> b!780793 (=> res!528321 e!434286)))

(assert (=> b!780793 (= res!528321 (or (not (is-Intermediate!8009 lt!347952)) (bvslt x!1131 (x!65355 lt!347952)) (not (= x!1131 (x!65355 lt!347952))) (not (= index!1321 (index!34406 lt!347952)))))))

(assert (=> b!780793 e!434290))

(declare-fun res!528316 () Bool)

(assert (=> b!780793 (=> (not res!528316) (not e!434290))))

(declare-fun lt!347953 () SeekEntryResult!8009)

(assert (=> b!780793 (= res!528316 (= lt!347953 lt!347954))))

(assert (=> b!780793 (= lt!347954 (Found!8009 j!159))))

(assert (=> b!780793 (= lt!347953 (seekEntryOrOpen!0 (select (arr!20409 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!780793 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347946 () Unit!26924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26924)

(assert (=> b!780793 (= lt!347946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780794 () Bool)

(declare-fun res!528319 () Bool)

(assert (=> b!780794 (=> res!528319 e!434286)))

(assert (=> b!780794 (= res!528319 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20409 a!3186) j!159) a!3186 mask!3328) lt!347954)))))

(declare-fun b!780795 () Bool)

(declare-fun Unit!26927 () Unit!26924)

(assert (=> b!780795 (= e!434289 Unit!26927)))

(declare-fun b!780796 () Bool)

(declare-fun res!528311 () Bool)

(assert (=> b!780796 (=> (not res!528311) (not e!434293))))

(assert (=> b!780796 (= res!528311 e!434288)))

(declare-fun c!86641 () Bool)

(assert (=> b!780796 (= c!86641 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!780797 () Bool)

(assert (=> b!780797 (= e!434286 (= (select (store (arr!20409 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!347951 () Unit!26924)

(assert (=> b!780797 (= lt!347951 e!434289)))

(declare-fun c!86640 () Bool)

(assert (=> b!780797 (= c!86640 (= (select (store (arr!20409 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780798 () Bool)

(declare-fun res!528307 () Bool)

(assert (=> b!780798 (=> (not res!528307) (not e!434294))))

(declare-datatypes ((List!14411 0))(
  ( (Nil!14408) (Cons!14407 (h!15524 (_ BitVec 64)) (t!20726 List!14411)) )
))
(declare-fun arrayNoDuplicates!0 (array!42636 (_ BitVec 32) List!14411) Bool)

(assert (=> b!780798 (= res!528307 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14408))))

(assert (= (and start!67470 res!528320) b!780789))

(assert (= (and b!780789 res!528312) b!780778))

(assert (= (and b!780778 res!528314) b!780787))

(assert (= (and b!780787 res!528315) b!780780))

(assert (= (and b!780780 res!528323) b!780791))

(assert (= (and b!780791 res!528310) b!780785))

(assert (= (and b!780785 res!528318) b!780798))

(assert (= (and b!780798 res!528307) b!780783))

(assert (= (and b!780783 res!528322) b!780779))

(assert (= (and b!780779 res!528313) b!780781))

(assert (= (and b!780781 res!528309) b!780796))

(assert (= (and b!780796 c!86641) b!780786))

(assert (= (and b!780796 (not c!86641)) b!780792))

(assert (= (and b!780796 res!528311) b!780790))

(assert (= (and b!780790 res!528317) b!780793))

(assert (= (and b!780793 res!528316) b!780788))

(assert (= (and b!780793 (not res!528321)) b!780794))

(assert (= (and b!780794 (not res!528319)) b!780784))

(assert (= (and b!780784 (not res!528308)) b!780797))

(assert (= (and b!780797 c!86640) b!780782))

(assert (= (and b!780797 (not c!86640)) b!780795))

(declare-fun m!724001 () Bool)

(assert (=> b!780797 m!724001))

(declare-fun m!724003 () Bool)

(assert (=> b!780797 m!724003))

(declare-fun m!724005 () Bool)

(assert (=> b!780781 m!724005))

(declare-fun m!724007 () Bool)

(assert (=> b!780788 m!724007))

(assert (=> b!780788 m!724007))

(declare-fun m!724009 () Bool)

(assert (=> b!780788 m!724009))

(declare-fun m!724011 () Bool)

(assert (=> b!780780 m!724011))

(assert (=> b!780784 m!724001))

(assert (=> b!780784 m!724003))

(assert (=> b!780792 m!724007))

(assert (=> b!780792 m!724007))

(declare-fun m!724013 () Bool)

(assert (=> b!780792 m!724013))

(declare-fun m!724015 () Bool)

(assert (=> b!780798 m!724015))

(assert (=> b!780778 m!724007))

(assert (=> b!780778 m!724007))

(declare-fun m!724017 () Bool)

(assert (=> b!780778 m!724017))

(declare-fun m!724019 () Bool)

(assert (=> b!780791 m!724019))

(assert (=> b!780786 m!724007))

(assert (=> b!780786 m!724007))

(declare-fun m!724021 () Bool)

(assert (=> b!780786 m!724021))

(assert (=> b!780793 m!724007))

(assert (=> b!780793 m!724007))

(declare-fun m!724023 () Bool)

(assert (=> b!780793 m!724023))

(declare-fun m!724025 () Bool)

(assert (=> b!780793 m!724025))

(declare-fun m!724027 () Bool)

(assert (=> b!780793 m!724027))

(declare-fun m!724029 () Bool)

(assert (=> b!780785 m!724029))

(assert (=> b!780779 m!724007))

(assert (=> b!780779 m!724007))

(declare-fun m!724031 () Bool)

(assert (=> b!780779 m!724031))

(assert (=> b!780779 m!724031))

(assert (=> b!780779 m!724007))

(declare-fun m!724033 () Bool)

(assert (=> b!780779 m!724033))

(declare-fun m!724035 () Bool)

(assert (=> start!67470 m!724035))

(declare-fun m!724037 () Bool)

(assert (=> start!67470 m!724037))

(declare-fun m!724039 () Bool)

(assert (=> b!780790 m!724039))

(declare-fun m!724041 () Bool)

(assert (=> b!780790 m!724041))

(declare-fun m!724043 () Bool)

(assert (=> b!780790 m!724043))

(declare-fun m!724045 () Bool)

(assert (=> b!780790 m!724045))

(assert (=> b!780790 m!724001))

(assert (=> b!780790 m!724041))

(assert (=> b!780794 m!724007))

(assert (=> b!780794 m!724007))

(assert (=> b!780794 m!724013))

(declare-fun m!724047 () Bool)

(assert (=> b!780787 m!724047))

(push 1)

(assert (not b!780790))

(assert (not b!780785))

(assert (not b!780779))

(assert (not b!780788))

(assert (not b!780778))

(assert (not start!67470))

(assert (not b!780787))

(assert (not b!780792))

(assert (not b!780793))

(assert (not b!780786))

(assert (not b!780798))

(assert (not b!780780))

(assert (not b!780794))

(assert (not b!780791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102531 () Bool)

(assert (=> d!102531 (= (validKeyInArray!0 (select (arr!20409 a!3186) j!159)) (and (not (= (select (arr!20409 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20409 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780778 d!102531))

(declare-fun e!434399 () SeekEntryResult!8009)

(declare-fun b!781012 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781012 (= e!434399 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20409 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20409 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!781013 () Bool)

(assert (=> b!781013 (= e!434399 (Intermediate!8009 false (toIndex!0 (select (arr!20409 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!781014 () Bool)

(declare-fun e!434396 () SeekEntryResult!8009)

(assert (=> b!781014 (= e!434396 e!434399)))

(declare-fun lt!348040 () (_ BitVec 64))

(declare-fun c!86691 () Bool)

(assert (=> b!781014 (= c!86691 (or (= lt!348040 (select (arr!20409 a!3186) j!159)) (= (bvadd lt!348040 lt!348040) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781015 () Bool)

(declare-fun lt!348039 () SeekEntryResult!8009)

(assert (=> b!781015 (and (bvsge (index!34406 lt!348039) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348039) (size!20830 a!3186)))))

(declare-fun e!434395 () Bool)

(assert (=> b!781015 (= e!434395 (= (select (arr!20409 a!3186) (index!34406 lt!348039)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781017 () Bool)

(assert (=> b!781017 (and (bvsge (index!34406 lt!348039) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348039) (size!20830 a!3186)))))

(declare-fun res!528441 () Bool)

(assert (=> b!781017 (= res!528441 (= (select (arr!20409 a!3186) (index!34406 lt!348039)) (select (arr!20409 a!3186) j!159)))))

(assert (=> b!781017 (=> res!528441 e!434395)))

(declare-fun e!434398 () Bool)

(assert (=> b!781017 (= e!434398 e!434395)))

(declare-fun b!781018 () Bool)

(declare-fun e!434397 () Bool)

(assert (=> b!781018 (= e!434397 e!434398)))

(declare-fun res!528442 () Bool)

(assert (=> b!781018 (= res!528442 (and (is-Intermediate!8009 lt!348039) (not (undefined!8821 lt!348039)) (bvslt (x!65355 lt!348039) #b01111111111111111111111111111110) (bvsge (x!65355 lt!348039) #b00000000000000000000000000000000) (bvsge (x!65355 lt!348039) #b00000000000000000000000000000000)))))

(assert (=> b!781018 (=> (not res!528442) (not e!434398))))

(declare-fun b!781019 () Bool)

(assert (=> b!781019 (and (bvsge (index!34406 lt!348039) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348039) (size!20830 a!3186)))))

(declare-fun res!528443 () Bool)

(assert (=> b!781019 (= res!528443 (= (select (arr!20409 a!3186) (index!34406 lt!348039)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781019 (=> res!528443 e!434395)))

(declare-fun b!781020 () Bool)

(assert (=> b!781020 (= e!434396 (Intermediate!8009 true (toIndex!0 (select (arr!20409 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!781016 () Bool)

(assert (=> b!781016 (= e!434397 (bvsge (x!65355 lt!348039) #b01111111111111111111111111111110))))

(declare-fun d!102533 () Bool)

(assert (=> d!102533 e!434397))

(declare-fun c!86692 () Bool)

(assert (=> d!102533 (= c!86692 (and (is-Intermediate!8009 lt!348039) (undefined!8821 lt!348039)))))

(assert (=> d!102533 (= lt!348039 e!434396)))

(declare-fun c!86690 () Bool)

(assert (=> d!102533 (= c!86690 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102533 (= lt!348040 (select (arr!20409 a!3186) (toIndex!0 (select (arr!20409 a!3186) j!159) mask!3328)))))

(assert (=> d!102533 (validMask!0 mask!3328)))

(assert (=> d!102533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20409 a!3186) j!159) mask!3328) (select (arr!20409 a!3186) j!159) a!3186 mask!3328) lt!348039)))

(assert (= (and d!102533 c!86690) b!781020))

(assert (= (and d!102533 (not c!86690)) b!781014))

(assert (= (and b!781014 c!86691) b!781013))

(assert (= (and b!781014 (not c!86691)) b!781012))

(assert (= (and d!102533 c!86692) b!781016))

(assert (= (and d!102533 (not c!86692)) b!781018))

(assert (= (and b!781018 res!528442) b!781017))

(assert (= (and b!781017 (not res!528441)) b!781019))

(assert (= (and b!781019 (not res!528443)) b!781015))

(assert (=> b!781012 m!724031))

(declare-fun m!724177 () Bool)

(assert (=> b!781012 m!724177))

(assert (=> b!781012 m!724177))

(assert (=> b!781012 m!724007))

(declare-fun m!724179 () Bool)

(assert (=> b!781012 m!724179))

(declare-fun m!724181 () Bool)

(assert (=> b!781017 m!724181))

(assert (=> b!781015 m!724181))

(assert (=> b!781019 m!724181))

(assert (=> d!102533 m!724031))

(declare-fun m!724183 () Bool)

(assert (=> d!102533 m!724183))

(assert (=> d!102533 m!724035))

(assert (=> b!780779 d!102533))

(declare-fun d!102545 () Bool)

(declare-fun lt!348046 () (_ BitVec 32))

(declare-fun lt!348045 () (_ BitVec 32))

(assert (=> d!102545 (= lt!348046 (bvmul (bvxor lt!348045 (bvlshr lt!348045 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102545 (= lt!348045 ((_ extract 31 0) (bvand (bvxor (select (arr!20409 a!3186) j!159) (bvlshr (select (arr!20409 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102545 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!528444 (let ((h!15527 ((_ extract 31 0) (bvand (bvxor (select (arr!20409 a!3186) j!159) (bvlshr (select (arr!20409 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65362 (bvmul (bvxor h!15527 (bvlshr h!15527 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65362 (bvlshr x!65362 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!528444 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!528444 #b00000000000000000000000000000000))))))

(assert (=> d!102545 (= (toIndex!0 (select (arr!20409 a!3186) j!159) mask!3328) (bvand (bvxor lt!348046 (bvlshr lt!348046 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!780779 d!102545))

(declare-fun b!781021 () Bool)

(declare-fun e!434404 () SeekEntryResult!8009)

(assert (=> b!781021 (= e!434404 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!347947 lt!347949 mask!3328))))

(declare-fun b!781022 () Bool)

(assert (=> b!781022 (= e!434404 (Intermediate!8009 false index!1321 x!1131))))

(declare-fun b!781023 () Bool)

(declare-fun e!434401 () SeekEntryResult!8009)

(assert (=> b!781023 (= e!434401 e!434404)))

(declare-fun c!86694 () Bool)

(declare-fun lt!348048 () (_ BitVec 64))

(assert (=> b!781023 (= c!86694 (or (= lt!348048 lt!347947) (= (bvadd lt!348048 lt!348048) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781024 () Bool)

(declare-fun lt!348047 () SeekEntryResult!8009)

(assert (=> b!781024 (and (bvsge (index!34406 lt!348047) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348047) (size!20830 lt!347949)))))

(declare-fun e!434400 () Bool)

(assert (=> b!781024 (= e!434400 (= (select (arr!20409 lt!347949) (index!34406 lt!348047)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781026 () Bool)

(assert (=> b!781026 (and (bvsge (index!34406 lt!348047) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348047) (size!20830 lt!347949)))))

(declare-fun res!528445 () Bool)

(assert (=> b!781026 (= res!528445 (= (select (arr!20409 lt!347949) (index!34406 lt!348047)) lt!347947))))

(assert (=> b!781026 (=> res!528445 e!434400)))

(declare-fun e!434403 () Bool)

(assert (=> b!781026 (= e!434403 e!434400)))

(declare-fun b!781027 () Bool)

(declare-fun e!434402 () Bool)

(assert (=> b!781027 (= e!434402 e!434403)))

(declare-fun res!528446 () Bool)

(assert (=> b!781027 (= res!528446 (and (is-Intermediate!8009 lt!348047) (not (undefined!8821 lt!348047)) (bvslt (x!65355 lt!348047) #b01111111111111111111111111111110) (bvsge (x!65355 lt!348047) #b00000000000000000000000000000000) (bvsge (x!65355 lt!348047) x!1131)))))

(assert (=> b!781027 (=> (not res!528446) (not e!434403))))

(declare-fun b!781028 () Bool)

(assert (=> b!781028 (and (bvsge (index!34406 lt!348047) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348047) (size!20830 lt!347949)))))

(declare-fun res!528447 () Bool)

(assert (=> b!781028 (= res!528447 (= (select (arr!20409 lt!347949) (index!34406 lt!348047)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781028 (=> res!528447 e!434400)))

(declare-fun b!781029 () Bool)

(assert (=> b!781029 (= e!434401 (Intermediate!8009 true index!1321 x!1131))))

(declare-fun b!781025 () Bool)

(assert (=> b!781025 (= e!434402 (bvsge (x!65355 lt!348047) #b01111111111111111111111111111110))))

(declare-fun d!102547 () Bool)

(assert (=> d!102547 e!434402))

(declare-fun c!86695 () Bool)

(assert (=> d!102547 (= c!86695 (and (is-Intermediate!8009 lt!348047) (undefined!8821 lt!348047)))))

(assert (=> d!102547 (= lt!348047 e!434401)))

(declare-fun c!86693 () Bool)

(assert (=> d!102547 (= c!86693 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102547 (= lt!348048 (select (arr!20409 lt!347949) index!1321))))

(assert (=> d!102547 (validMask!0 mask!3328)))

(assert (=> d!102547 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347947 lt!347949 mask!3328) lt!348047)))

(assert (= (and d!102547 c!86693) b!781029))

(assert (= (and d!102547 (not c!86693)) b!781023))

(assert (= (and b!781023 c!86694) b!781022))

(assert (= (and b!781023 (not c!86694)) b!781021))

(assert (= (and d!102547 c!86695) b!781025))

(assert (= (and d!102547 (not c!86695)) b!781027))

(assert (= (and b!781027 res!528446) b!781026))

(assert (= (and b!781026 (not res!528445)) b!781028))

(assert (= (and b!781028 (not res!528447)) b!781024))

(declare-fun m!724185 () Bool)

(assert (=> b!781021 m!724185))

(assert (=> b!781021 m!724185))

(declare-fun m!724187 () Bool)

(assert (=> b!781021 m!724187))

(declare-fun m!724189 () Bool)

(assert (=> b!781026 m!724189))

(assert (=> b!781024 m!724189))

(assert (=> b!781028 m!724189))

(declare-fun m!724191 () Bool)

(assert (=> d!102547 m!724191))

(assert (=> d!102547 m!724035))

(assert (=> b!780790 d!102547))

(declare-fun b!781038 () Bool)

(declare-fun e!434413 () SeekEntryResult!8009)

(assert (=> b!781038 (= e!434413 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!347947 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!347947 lt!347949 mask!3328))))

(declare-fun b!781039 () Bool)

(assert (=> b!781039 (= e!434413 (Intermediate!8009 false (toIndex!0 lt!347947 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!781040 () Bool)

(declare-fun e!434410 () SeekEntryResult!8009)

(assert (=> b!781040 (= e!434410 e!434413)))

(declare-fun c!86701 () Bool)

(declare-fun lt!348056 () (_ BitVec 64))

(assert (=> b!781040 (= c!86701 (or (= lt!348056 lt!347947) (= (bvadd lt!348056 lt!348056) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781041 () Bool)

(declare-fun lt!348055 () SeekEntryResult!8009)

(assert (=> b!781041 (and (bvsge (index!34406 lt!348055) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348055) (size!20830 lt!347949)))))

(declare-fun e!434409 () Bool)

(assert (=> b!781041 (= e!434409 (= (select (arr!20409 lt!347949) (index!34406 lt!348055)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781043 () Bool)

(assert (=> b!781043 (and (bvsge (index!34406 lt!348055) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348055) (size!20830 lt!347949)))))

(declare-fun res!528448 () Bool)

(assert (=> b!781043 (= res!528448 (= (select (arr!20409 lt!347949) (index!34406 lt!348055)) lt!347947))))

(assert (=> b!781043 (=> res!528448 e!434409)))

(declare-fun e!434412 () Bool)

(assert (=> b!781043 (= e!434412 e!434409)))

(declare-fun b!781044 () Bool)

(declare-fun e!434411 () Bool)

(assert (=> b!781044 (= e!434411 e!434412)))

(declare-fun res!528449 () Bool)

(assert (=> b!781044 (= res!528449 (and (is-Intermediate!8009 lt!348055) (not (undefined!8821 lt!348055)) (bvslt (x!65355 lt!348055) #b01111111111111111111111111111110) (bvsge (x!65355 lt!348055) #b00000000000000000000000000000000) (bvsge (x!65355 lt!348055) #b00000000000000000000000000000000)))))

(assert (=> b!781044 (=> (not res!528449) (not e!434412))))

(declare-fun b!781045 () Bool)

(assert (=> b!781045 (and (bvsge (index!34406 lt!348055) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348055) (size!20830 lt!347949)))))

(declare-fun res!528450 () Bool)

(assert (=> b!781045 (= res!528450 (= (select (arr!20409 lt!347949) (index!34406 lt!348055)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781045 (=> res!528450 e!434409)))

(declare-fun b!781046 () Bool)

(assert (=> b!781046 (= e!434410 (Intermediate!8009 true (toIndex!0 lt!347947 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!781042 () Bool)

(assert (=> b!781042 (= e!434411 (bvsge (x!65355 lt!348055) #b01111111111111111111111111111110))))

(declare-fun d!102549 () Bool)

(assert (=> d!102549 e!434411))

(declare-fun c!86702 () Bool)

(assert (=> d!102549 (= c!86702 (and (is-Intermediate!8009 lt!348055) (undefined!8821 lt!348055)))))

(assert (=> d!102549 (= lt!348055 e!434410)))

(declare-fun c!86700 () Bool)

(assert (=> d!102549 (= c!86700 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102549 (= lt!348056 (select (arr!20409 lt!347949) (toIndex!0 lt!347947 mask!3328)))))

(assert (=> d!102549 (validMask!0 mask!3328)))

(assert (=> d!102549 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347947 mask!3328) lt!347947 lt!347949 mask!3328) lt!348055)))

(assert (= (and d!102549 c!86700) b!781046))

(assert (= (and d!102549 (not c!86700)) b!781040))

(assert (= (and b!781040 c!86701) b!781039))

(assert (= (and b!781040 (not c!86701)) b!781038))

(assert (= (and d!102549 c!86702) b!781042))

(assert (= (and d!102549 (not c!86702)) b!781044))

(assert (= (and b!781044 res!528449) b!781043))

(assert (= (and b!781043 (not res!528448)) b!781045))

(assert (= (and b!781045 (not res!528450)) b!781041))

(assert (=> b!781038 m!724041))

(declare-fun m!724193 () Bool)

(assert (=> b!781038 m!724193))

(assert (=> b!781038 m!724193))

(declare-fun m!724195 () Bool)

(assert (=> b!781038 m!724195))

(declare-fun m!724197 () Bool)

(assert (=> b!781043 m!724197))

(assert (=> b!781041 m!724197))

(assert (=> b!781045 m!724197))

(assert (=> d!102549 m!724041))

(declare-fun m!724199 () Bool)

(assert (=> d!102549 m!724199))

(assert (=> d!102549 m!724035))

(assert (=> b!780790 d!102549))

(declare-fun d!102551 () Bool)

(declare-fun lt!348058 () (_ BitVec 32))

(declare-fun lt!348057 () (_ BitVec 32))

(assert (=> d!102551 (= lt!348058 (bvmul (bvxor lt!348057 (bvlshr lt!348057 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102551 (= lt!348057 ((_ extract 31 0) (bvand (bvxor lt!347947 (bvlshr lt!347947 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102551 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!528444 (let ((h!15527 ((_ extract 31 0) (bvand (bvxor lt!347947 (bvlshr lt!347947 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65362 (bvmul (bvxor h!15527 (bvlshr h!15527 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65362 (bvlshr x!65362 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!528444 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!528444 #b00000000000000000000000000000000))))))

(assert (=> d!102551 (= (toIndex!0 lt!347947 mask!3328) (bvand (bvxor lt!348058 (bvlshr lt!348058 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!780790 d!102551))

(declare-fun d!102553 () Bool)

(declare-fun lt!348086 () SeekEntryResult!8009)

(assert (=> d!102553 (and (or (is-Undefined!8009 lt!348086) (not (is-Found!8009 lt!348086)) (and (bvsge (index!34405 lt!348086) #b00000000000000000000000000000000) (bvslt (index!34405 lt!348086) (size!20830 a!3186)))) (or (is-Undefined!8009 lt!348086) (is-Found!8009 lt!348086) (not (is-MissingZero!8009 lt!348086)) (and (bvsge (index!34404 lt!348086) #b00000000000000000000000000000000) (bvslt (index!34404 lt!348086) (size!20830 a!3186)))) (or (is-Undefined!8009 lt!348086) (is-Found!8009 lt!348086) (is-MissingZero!8009 lt!348086) (not (is-MissingVacant!8009 lt!348086)) (and (bvsge (index!34407 lt!348086) #b00000000000000000000000000000000) (bvslt (index!34407 lt!348086) (size!20830 a!3186)))) (or (is-Undefined!8009 lt!348086) (ite (is-Found!8009 lt!348086) (= (select (arr!20409 a!3186) (index!34405 lt!348086)) k!2102) (ite (is-MissingZero!8009 lt!348086) (= (select (arr!20409 a!3186) (index!34404 lt!348086)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8009 lt!348086) (= (select (arr!20409 a!3186) (index!34407 lt!348086)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!434454 () SeekEntryResult!8009)

(assert (=> d!102553 (= lt!348086 e!434454)))

(declare-fun c!86729 () Bool)

(declare-fun lt!348087 () SeekEntryResult!8009)

(assert (=> d!102553 (= c!86729 (and (is-Intermediate!8009 lt!348087) (undefined!8821 lt!348087)))))

(assert (=> d!102553 (= lt!348087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102553 (validMask!0 mask!3328)))

(assert (=> d!102553 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!348086)))

(declare-fun b!781117 () Bool)

(declare-fun e!434455 () SeekEntryResult!8009)

(assert (=> b!781117 (= e!434455 (MissingZero!8009 (index!34406 lt!348087)))))

(declare-fun b!781118 () Bool)

(assert (=> b!781118 (= e!434454 Undefined!8009)))

(declare-fun b!781119 () Bool)

(declare-fun e!434456 () SeekEntryResult!8009)

(assert (=> b!781119 (= e!434456 (Found!8009 (index!34406 lt!348087)))))

(declare-fun b!781120 () Bool)

(assert (=> b!781120 (= e!434454 e!434456)))

(declare-fun lt!348085 () (_ BitVec 64))

(assert (=> b!781120 (= lt!348085 (select (arr!20409 a!3186) (index!34406 lt!348087)))))

(declare-fun c!86731 () Bool)

(assert (=> b!781120 (= c!86731 (= lt!348085 k!2102))))

(declare-fun b!781121 () Bool)

(assert (=> b!781121 (= e!434455 (seekKeyOrZeroReturnVacant!0 (x!65355 lt!348087) (index!34406 lt!348087) (index!34406 lt!348087) k!2102 a!3186 mask!3328))))

(declare-fun b!781122 () Bool)

(declare-fun c!86730 () Bool)

(assert (=> b!781122 (= c!86730 (= lt!348085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781122 (= e!434456 e!434455)))

(assert (= (and d!102553 c!86729) b!781118))

(assert (= (and d!102553 (not c!86729)) b!781120))

(assert (= (and b!781120 c!86731) b!781119))

(assert (= (and b!781120 (not c!86731)) b!781122))

(assert (= (and b!781122 c!86730) b!781117))

(assert (= (and b!781122 (not c!86730)) b!781121))

(declare-fun m!724231 () Bool)

(assert (=> d!102553 m!724231))

(assert (=> d!102553 m!724231))

(declare-fun m!724233 () Bool)

(assert (=> d!102553 m!724233))

(declare-fun m!724235 () Bool)

(assert (=> d!102553 m!724235))

(declare-fun m!724237 () Bool)

(assert (=> d!102553 m!724237))

(assert (=> d!102553 m!724035))

(declare-fun m!724239 () Bool)

(assert (=> d!102553 m!724239))

(declare-fun m!724241 () Bool)

(assert (=> b!781120 m!724241))

(declare-fun m!724243 () Bool)

(assert (=> b!781121 m!724243))

(assert (=> b!780791 d!102553))

(declare-fun d!102563 () Bool)

(declare-fun res!528474 () Bool)

(declare-fun e!434464 () Bool)

(assert (=> d!102563 (=> res!528474 e!434464)))

(assert (=> d!102563 (= res!528474 (= (select (arr!20409 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!102563 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!434464)))

(declare-fun b!781133 () Bool)

(declare-fun e!434465 () Bool)

(assert (=> b!781133 (= e!434464 e!434465)))

(declare-fun res!528475 () Bool)

(assert (=> b!781133 (=> (not res!528475) (not e!434465))))

(assert (=> b!781133 (= res!528475 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20830 a!3186)))))

(declare-fun b!781134 () Bool)

(assert (=> b!781134 (= e!434465 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102563 (not res!528474)) b!781133))

(assert (= (and b!781133 res!528475) b!781134))

(declare-fun m!724247 () Bool)

(assert (=> d!102563 m!724247))

(declare-fun m!724249 () Bool)

(assert (=> b!781134 m!724249))

(assert (=> b!780780 d!102563))

(declare-fun e!434470 () SeekEntryResult!8009)

(declare-fun b!781135 () Bool)

(assert (=> b!781135 (= e!434470 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20409 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!781136 () Bool)

(assert (=> b!781136 (= e!434470 (Intermediate!8009 false index!1321 x!1131))))

(declare-fun b!781137 () Bool)

(declare-fun e!434467 () SeekEntryResult!8009)

(assert (=> b!781137 (= e!434467 e!434470)))

(declare-fun lt!348095 () (_ BitVec 64))

(declare-fun c!86736 () Bool)

(assert (=> b!781137 (= c!86736 (or (= lt!348095 (select (arr!20409 a!3186) j!159)) (= (bvadd lt!348095 lt!348095) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781138 () Bool)

(declare-fun lt!348094 () SeekEntryResult!8009)

(assert (=> b!781138 (and (bvsge (index!34406 lt!348094) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348094) (size!20830 a!3186)))))

(declare-fun e!434466 () Bool)

(assert (=> b!781138 (= e!434466 (= (select (arr!20409 a!3186) (index!34406 lt!348094)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781140 () Bool)

(assert (=> b!781140 (and (bvsge (index!34406 lt!348094) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348094) (size!20830 a!3186)))))

(declare-fun res!528476 () Bool)

(assert (=> b!781140 (= res!528476 (= (select (arr!20409 a!3186) (index!34406 lt!348094)) (select (arr!20409 a!3186) j!159)))))

(assert (=> b!781140 (=> res!528476 e!434466)))

(declare-fun e!434469 () Bool)

(assert (=> b!781140 (= e!434469 e!434466)))

(declare-fun b!781141 () Bool)

(declare-fun e!434468 () Bool)

(assert (=> b!781141 (= e!434468 e!434469)))

(declare-fun res!528477 () Bool)

(assert (=> b!781141 (= res!528477 (and (is-Intermediate!8009 lt!348094) (not (undefined!8821 lt!348094)) (bvslt (x!65355 lt!348094) #b01111111111111111111111111111110) (bvsge (x!65355 lt!348094) #b00000000000000000000000000000000) (bvsge (x!65355 lt!348094) x!1131)))))

(assert (=> b!781141 (=> (not res!528477) (not e!434469))))

(declare-fun b!781142 () Bool)

(assert (=> b!781142 (and (bvsge (index!34406 lt!348094) #b00000000000000000000000000000000) (bvslt (index!34406 lt!348094) (size!20830 a!3186)))))

(declare-fun res!528478 () Bool)

(assert (=> b!781142 (= res!528478 (= (select (arr!20409 a!3186) (index!34406 lt!348094)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781142 (=> res!528478 e!434466)))

(declare-fun b!781143 () Bool)

(assert (=> b!781143 (= e!434467 (Intermediate!8009 true index!1321 x!1131))))

(declare-fun b!781139 () Bool)

(assert (=> b!781139 (= e!434468 (bvsge (x!65355 lt!348094) #b01111111111111111111111111111110))))

(declare-fun d!102567 () Bool)

(assert (=> d!102567 e!434468))

(declare-fun c!86737 () Bool)

(assert (=> d!102567 (= c!86737 (and (is-Intermediate!8009 lt!348094) (undefined!8821 lt!348094)))))

(assert (=> d!102567 (= lt!348094 e!434467)))

(declare-fun c!86735 () Bool)

(assert (=> d!102567 (= c!86735 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102567 (= lt!348095 (select (arr!20409 a!3186) index!1321))))

(assert (=> d!102567 (validMask!0 mask!3328)))

(assert (=> d!102567 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20409 a!3186) j!159) a!3186 mask!3328) lt!348094)))

(assert (= (and d!102567 c!86735) b!781143))

(assert (= (and d!102567 (not c!86735)) b!781137))

(assert (= (and b!781137 c!86736) b!781136))

(assert (= (and b!781137 (not c!86736)) b!781135))

(assert (= (and d!102567 c!86737) b!781139))

(assert (= (and d!102567 (not c!86737)) b!781141))

(assert (= (and b!781141 res!528477) b!781140))

(assert (= (and b!781140 (not res!528476)) b!781142))

(assert (= (and b!781142 (not res!528478)) b!781138))

(assert (=> b!781135 m!724185))

(assert (=> b!781135 m!724185))

(assert (=> b!781135 m!724007))

(declare-fun m!724265 () Bool)

(assert (=> b!781135 m!724265))

(declare-fun m!724267 () Bool)

(assert (=> b!781140 m!724267))

(assert (=> b!781138 m!724267))

(assert (=> b!781142 m!724267))

(declare-fun m!724269 () Bool)

(assert (=> d!102567 m!724269))

(assert (=> d!102567 m!724035))

(assert (=> b!780786 d!102567))

(declare-fun d!102571 () Bool)

(assert (=> d!102571 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780787 d!102571))

(declare-fun d!102573 () Bool)

(declare-fun res!528500 () Bool)

(declare-fun e!434498 () Bool)

(assert (=> d!102573 (=> res!528500 e!434498)))

(assert (=> d!102573 (= res!528500 (bvsge #b00000000000000000000000000000000 (size!20830 a!3186)))))

(assert (=> d!102573 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14408) e!434498)))

(declare-fun bm!35239 () Bool)

(declare-fun call!35242 () Bool)

(declare-fun c!86747 () Bool)

(assert (=> bm!35239 (= call!35242 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86747 (Cons!14407 (select (arr!20409 a!3186) #b00000000000000000000000000000000) Nil!14408) Nil!14408)))))

(declare-fun b!781182 () Bool)

(declare-fun e!434501 () Bool)

(declare-fun contains!4106 (List!14411 (_ BitVec 64)) Bool)

(assert (=> b!781182 (= e!434501 (contains!4106 Nil!14408 (select (arr!20409 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!781183 () Bool)

(declare-fun e!434499 () Bool)

(assert (=> b!781183 (= e!434499 call!35242)))

(declare-fun b!781184 () Bool)

(declare-fun e!434500 () Bool)

(assert (=> b!781184 (= e!434498 e!434500)))

(declare-fun res!528501 () Bool)

(assert (=> b!781184 (=> (not res!528501) (not e!434500))))

(assert (=> b!781184 (= res!528501 (not e!434501))))

(declare-fun res!528499 () Bool)

(assert (=> b!781184 (=> (not res!528499) (not e!434501))))

(assert (=> b!781184 (= res!528499 (validKeyInArray!0 (select (arr!20409 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!781185 () Bool)

(assert (=> b!781185 (= e!434500 e!434499)))

(assert (=> b!781185 (= c!86747 (validKeyInArray!0 (select (arr!20409 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!781186 () Bool)

(assert (=> b!781186 (= e!434499 call!35242)))

(assert (= (and d!102573 (not res!528500)) b!781184))

(assert (= (and b!781184 res!528499) b!781182))

(assert (= (and b!781184 res!528501) b!781185))

(assert (= (and b!781185 c!86747) b!781186))

(assert (= (and b!781185 (not c!86747)) b!781183))

(assert (= (or b!781186 b!781183) bm!35239))

(assert (=> bm!35239 m!724247))

(declare-fun m!724293 () Bool)

(assert (=> bm!35239 m!724293))

(assert (=> b!781182 m!724247))

(assert (=> b!781182 m!724247))

(declare-fun m!724295 () Bool)

(assert (=> b!781182 m!724295))

(assert (=> b!781184 m!724247))

(assert (=> b!781184 m!724247))

(declare-fun m!724299 () Bool)

(assert (=> b!781184 m!724299))

(assert (=> b!781185 m!724247))

(assert (=> b!781185 m!724247))

(assert (=> b!781185 m!724299))

(assert (=> b!780798 d!102573))

(declare-fun b!781253 () Bool)

(declare-fun e!434544 () SeekEntryResult!8009)

(declare-fun e!434546 () SeekEntryResult!8009)

(assert (=> b!781253 (= e!434544 e!434546)))

(declare-fun c!86771 () Bool)

(declare-fun lt!348137 () (_ BitVec 64))

(assert (=> b!781253 (= c!86771 (= lt!348137 (select (arr!20409 a!3186) j!159)))))

(declare-fun b!781254 () Bool)

(declare-fun e!434545 () SeekEntryResult!8009)

(assert (=> b!781254 (= e!434545 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20409 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102585 () Bool)

(declare-fun lt!348136 () SeekEntryResult!8009)

(assert (=> d!102585 (and (or (is-Undefined!8009 lt!348136) (not (is-Found!8009 lt!348136)) (and (bvsge (index!34405 lt!348136) #b00000000000000000000000000000000) (bvslt (index!34405 lt!348136) (size!20830 a!3186)))) (or (is-Undefined!8009 lt!348136) (is-Found!8009 lt!348136) (not (is-MissingVacant!8009 lt!348136)) (not (= (index!34407 lt!348136) resIntermediateIndex!5)) (and (bvsge (index!34407 lt!348136) #b00000000000000000000000000000000) (bvslt (index!34407 lt!348136) (size!20830 a!3186)))) (or (is-Undefined!8009 lt!348136) (ite (is-Found!8009 lt!348136) (= (select (arr!20409 a!3186) (index!34405 lt!348136)) (select (arr!20409 a!3186) j!159)) (and (is-MissingVacant!8009 lt!348136) (= (index!34407 lt!348136) resIntermediateIndex!5) (= (select (arr!20409 a!3186) (index!34407 lt!348136)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102585 (= lt!348136 e!434544)))

(declare-fun c!86769 () Bool)

(assert (=> d!102585 (= c!86769 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102585 (= lt!348137 (select (arr!20409 a!3186) resIntermediateIndex!5))))

(assert (=> d!102585 (validMask!0 mask!3328)))

(assert (=> d!102585 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20409 a!3186) j!159) a!3186 mask!3328) lt!348136)))

(declare-fun b!781255 () Bool)

(declare-fun c!86770 () Bool)

(assert (=> b!781255 (= c!86770 (= lt!348137 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781255 (= e!434546 e!434545)))

(declare-fun b!781256 () Bool)

(assert (=> b!781256 (= e!434544 Undefined!8009)))

(declare-fun b!781257 () Bool)

(assert (=> b!781257 (= e!434545 (MissingVacant!8009 resIntermediateIndex!5))))

(declare-fun b!781258 () Bool)

(assert (=> b!781258 (= e!434546 (Found!8009 resIntermediateIndex!5))))

(assert (= (and d!102585 c!86769) b!781256))

(assert (= (and d!102585 (not c!86769)) b!781253))

(assert (= (and b!781253 c!86771) b!781258))

(assert (= (and b!781253 (not c!86771)) b!781255))

(assert (= (and b!781255 c!86770) b!781257))

(assert (= (and b!781255 (not c!86770)) b!781254))

(declare-fun m!724333 () Bool)

(assert (=> b!781254 m!724333))

(assert (=> b!781254 m!724333))

(assert (=> b!781254 m!724007))

(declare-fun m!724335 () Bool)

(assert (=> b!781254 m!724335))

(declare-fun m!724337 () Bool)

(assert (=> d!102585 m!724337))

(declare-fun m!724339 () Bool)

(assert (=> d!102585 m!724339))

(assert (=> d!102585 m!724005))

(assert (=> d!102585 m!724035))

(assert (=> b!780788 d!102585))

(declare-fun b!781259 () Bool)

(declare-fun e!434547 () SeekEntryResult!8009)

(declare-fun e!434549 () SeekEntryResult!8009)

(assert (=> b!781259 (= e!434547 e!434549)))

(declare-fun lt!348139 () (_ BitVec 64))

(declare-fun c!86774 () Bool)

(assert (=> b!781259 (= c!86774 (= lt!348139 (select (arr!20409 a!3186) j!159)))))

(declare-fun b!781260 () Bool)

(declare-fun e!434548 () SeekEntryResult!8009)

(assert (=> b!781260 (= e!434548 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20409 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!348138 () SeekEntryResult!8009)

(declare-fun d!102603 () Bool)

(assert (=> d!102603 (and (or (is-Undefined!8009 lt!348138) (not (is-Found!8009 lt!348138)) (and (bvsge (index!34405 lt!348138) #b00000000000000000000000000000000) (bvslt (index!34405 lt!348138) (size!20830 a!3186)))) (or (is-Undefined!8009 lt!348138) (is-Found!8009 lt!348138) (not (is-MissingVacant!8009 lt!348138)) (not (= (index!34407 lt!348138) resIntermediateIndex!5)) (and (bvsge (index!34407 lt!348138) #b00000000000000000000000000000000) (bvslt (index!34407 lt!348138) (size!20830 a!3186)))) (or (is-Undefined!8009 lt!348138) (ite (is-Found!8009 lt!348138) (= (select (arr!20409 a!3186) (index!34405 lt!348138)) (select (arr!20409 a!3186) j!159)) (and (is-MissingVacant!8009 lt!348138) (= (index!34407 lt!348138) resIntermediateIndex!5) (= (select (arr!20409 a!3186) (index!34407 lt!348138)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102603 (= lt!348138 e!434547)))

(declare-fun c!86772 () Bool)

(assert (=> d!102603 (= c!86772 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102603 (= lt!348139 (select (arr!20409 a!3186) index!1321))))

(assert (=> d!102603 (validMask!0 mask!3328)))

(assert (=> d!102603 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20409 a!3186) j!159) a!3186 mask!3328) lt!348138)))

(declare-fun b!781261 () Bool)

(declare-fun c!86773 () Bool)

(assert (=> b!781261 (= c!86773 (= lt!348139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781261 (= e!434549 e!434548)))

(declare-fun b!781262 () Bool)

(assert (=> b!781262 (= e!434547 Undefined!8009)))

(declare-fun b!781263 () Bool)

(assert (=> b!781263 (= e!434548 (MissingVacant!8009 resIntermediateIndex!5))))

(declare-fun b!781264 () Bool)

(assert (=> b!781264 (= e!434549 (Found!8009 index!1321))))

(assert (= (and d!102603 c!86772) b!781262))

(assert (= (and d!102603 (not c!86772)) b!781259))

(assert (= (and b!781259 c!86774) b!781264))

(assert (= (and b!781259 (not c!86774)) b!781261))

(assert (= (and b!781261 c!86773) b!781263))

(assert (= (and b!781261 (not c!86773)) b!781260))

(assert (=> b!781260 m!724185))

(assert (=> b!781260 m!724185))

(assert (=> b!781260 m!724007))

(declare-fun m!724349 () Bool)

(assert (=> b!781260 m!724349))

(declare-fun m!724351 () Bool)

(assert (=> d!102603 m!724351))

(declare-fun m!724353 () Bool)

(assert (=> d!102603 m!724353))

(assert (=> d!102603 m!724269))

(assert (=> d!102603 m!724035))

(assert (=> b!780794 d!102603))

(declare-fun b!781273 () Bool)

(declare-fun e!434556 () Bool)

(declare-fun e!434557 () Bool)

(assert (=> b!781273 (= e!434556 e!434557)))

(declare-fun c!86777 () Bool)

(assert (=> b!781273 (= c!86777 (validKeyInArray!0 (select (arr!20409 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102607 () Bool)

(declare-fun res!528532 () Bool)

(assert (=> d!102607 (=> res!528532 e!434556)))

(assert (=> d!102607 (= res!528532 (bvsge #b00000000000000000000000000000000 (size!20830 a!3186)))))

(assert (=> d!102607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!434556)))

(declare-fun b!781274 () Bool)

(declare-fun e!434558 () Bool)

(assert (=> b!781274 (= e!434557 e!434558)))

(declare-fun lt!348148 () (_ BitVec 64))

(assert (=> b!781274 (= lt!348148 (select (arr!20409 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!348149 () Unit!26924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42636 (_ BitVec 64) (_ BitVec 32)) Unit!26924)

(assert (=> b!781274 (= lt!348149 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348148 #b00000000000000000000000000000000))))

(assert (=> b!781274 (arrayContainsKey!0 a!3186 lt!348148 #b00000000000000000000000000000000)))

(declare-fun lt!348150 () Unit!26924)

(assert (=> b!781274 (= lt!348150 lt!348149)))

(declare-fun res!528531 () Bool)

(assert (=> b!781274 (= res!528531 (= (seekEntryOrOpen!0 (select (arr!20409 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8009 #b00000000000000000000000000000000)))))

(assert (=> b!781274 (=> (not res!528531) (not e!434558))))

(declare-fun b!781275 () Bool)

(declare-fun call!35251 () Bool)

(assert (=> b!781275 (= e!434557 call!35251)))

(declare-fun b!781276 () Bool)

(assert (=> b!781276 (= e!434558 call!35251)))

(declare-fun bm!35248 () Bool)

(assert (=> bm!35248 (= call!35251 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102607 (not res!528532)) b!781273))

(assert (= (and b!781273 c!86777) b!781274))

(assert (= (and b!781273 (not c!86777)) b!781275))

(assert (= (and b!781274 res!528531) b!781276))

(assert (= (or b!781276 b!781275) bm!35248))

(assert (=> b!781273 m!724247))

(assert (=> b!781273 m!724247))

(assert (=> b!781273 m!724299))

(assert (=> b!781274 m!724247))

(declare-fun m!724355 () Bool)

(assert (=> b!781274 m!724355))

(declare-fun m!724357 () Bool)

(assert (=> b!781274 m!724357))

(assert (=> b!781274 m!724247))

(declare-fun m!724359 () Bool)

(assert (=> b!781274 m!724359))

(declare-fun m!724361 () Bool)

(assert (=> bm!35248 m!724361))

(assert (=> b!780785 d!102607))

(declare-fun d!102609 () Bool)

(assert (=> d!102609 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67470 d!102609))

(declare-fun d!102613 () Bool)

(assert (=> d!102613 (= (array_inv!16205 a!3186) (bvsge (size!20830 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67470 d!102613))

(assert (=> b!780792 d!102603))

(declare-fun d!102615 () Bool)

(declare-fun lt!348161 () SeekEntryResult!8009)

(assert (=> d!102615 (and (or (is-Undefined!8009 lt!348161) (not (is-Found!8009 lt!348161)) (and (bvsge (index!34405 lt!348161) #b00000000000000000000000000000000) (bvslt (index!34405 lt!348161) (size!20830 a!3186)))) (or (is-Undefined!8009 lt!348161) (is-Found!8009 lt!348161) (not (is-MissingZero!8009 lt!348161)) (and (bvsge (index!34404 lt!348161) #b00000000000000000000000000000000) (bvslt (index!34404 lt!348161) (size!20830 a!3186)))) (or (is-Undefined!8009 lt!348161) (is-Found!8009 lt!348161) (is-MissingZero!8009 lt!348161) (not (is-MissingVacant!8009 lt!348161)) (and (bvsge (index!34407 lt!348161) #b00000000000000000000000000000000) (bvslt (index!34407 lt!348161) (size!20830 a!3186)))) (or (is-Undefined!8009 lt!348161) (ite (is-Found!8009 lt!348161) (= (select (arr!20409 a!3186) (index!34405 lt!348161)) (select (arr!20409 a!3186) j!159)) (ite (is-MissingZero!8009 lt!348161) (= (select (arr!20409 a!3186) (index!34404 lt!348161)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8009 lt!348161) (= (select (arr!20409 a!3186) (index!34407 lt!348161)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!434572 () SeekEntryResult!8009)

(assert (=> d!102615 (= lt!348161 e!434572)))

(declare-fun c!86787 () Bool)

(declare-fun lt!348162 () SeekEntryResult!8009)

(assert (=> d!102615 (= c!86787 (and (is-Intermediate!8009 lt!348162) (undefined!8821 lt!348162)))))

(assert (=> d!102615 (= lt!348162 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20409 a!3186) j!159) mask!3328) (select (arr!20409 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102615 (validMask!0 mask!3328)))

(assert (=> d!102615 (= (seekEntryOrOpen!0 (select (arr!20409 a!3186) j!159) a!3186 mask!3328) lt!348161)))

(declare-fun b!781299 () Bool)

(declare-fun e!434573 () SeekEntryResult!8009)

(assert (=> b!781299 (= e!434573 (MissingZero!8009 (index!34406 lt!348162)))))

(declare-fun b!781300 () Bool)

(assert (=> b!781300 (= e!434572 Undefined!8009)))

(declare-fun b!781301 () Bool)

(declare-fun e!434574 () SeekEntryResult!8009)

(assert (=> b!781301 (= e!434574 (Found!8009 (index!34406 lt!348162)))))

(declare-fun b!781302 () Bool)

(assert (=> b!781302 (= e!434572 e!434574)))

(declare-fun lt!348160 () (_ BitVec 64))

(assert (=> b!781302 (= lt!348160 (select (arr!20409 a!3186) (index!34406 lt!348162)))))

(declare-fun c!86789 () Bool)

(assert (=> b!781302 (= c!86789 (= lt!348160 (select (arr!20409 a!3186) j!159)))))

(declare-fun b!781303 () Bool)

(assert (=> b!781303 (= e!434573 (seekKeyOrZeroReturnVacant!0 (x!65355 lt!348162) (index!34406 lt!348162) (index!34406 lt!348162) (select (arr!20409 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!781304 () Bool)

(declare-fun c!86788 () Bool)

(assert (=> b!781304 (= c!86788 (= lt!348160 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781304 (= e!434574 e!434573)))

(assert (= (and d!102615 c!86787) b!781300))

(assert (= (and d!102615 (not c!86787)) b!781302))

(assert (= (and b!781302 c!86789) b!781301))

(assert (= (and b!781302 (not c!86789)) b!781304))

(assert (= (and b!781304 c!86788) b!781299))

(assert (= (and b!781304 (not c!86788)) b!781303))

(assert (=> d!102615 m!724007))

(assert (=> d!102615 m!724031))

(assert (=> d!102615 m!724031))

(assert (=> d!102615 m!724007))

(assert (=> d!102615 m!724033))

(declare-fun m!724379 () Bool)

(assert (=> d!102615 m!724379))

(declare-fun m!724381 () Bool)

(assert (=> d!102615 m!724381))

(assert (=> d!102615 m!724035))

(declare-fun m!724383 () Bool)

(assert (=> d!102615 m!724383))

(declare-fun m!724385 () Bool)

(assert (=> b!781302 m!724385))

(assert (=> b!781303 m!724007))

(declare-fun m!724387 () Bool)

(assert (=> b!781303 m!724387))

(assert (=> b!780793 d!102615))

(declare-fun b!781313 () Bool)

(declare-fun e!434580 () Bool)

(declare-fun e!434581 () Bool)

(assert (=> b!781313 (= e!434580 e!434581)))

(declare-fun c!86793 () Bool)

(assert (=> b!781313 (= c!86793 (validKeyInArray!0 (select (arr!20409 a!3186) j!159)))))

(declare-fun d!102619 () Bool)

(declare-fun res!528540 () Bool)

(assert (=> d!102619 (=> res!528540 e!434580)))

(assert (=> d!102619 (= res!528540 (bvsge j!159 (size!20830 a!3186)))))

(assert (=> d!102619 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!434580)))

(declare-fun b!781314 () Bool)

(declare-fun e!434582 () Bool)

(assert (=> b!781314 (= e!434581 e!434582)))

(declare-fun lt!348165 () (_ BitVec 64))

(assert (=> b!781314 (= lt!348165 (select (arr!20409 a!3186) j!159))))

(declare-fun lt!348166 () Unit!26924)

(assert (=> b!781314 (= lt!348166 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348165 j!159))))

(assert (=> b!781314 (arrayContainsKey!0 a!3186 lt!348165 #b00000000000000000000000000000000)))

(declare-fun lt!348167 () Unit!26924)

(assert (=> b!781314 (= lt!348167 lt!348166)))

(declare-fun res!528539 () Bool)

(assert (=> b!781314 (= res!528539 (= (seekEntryOrOpen!0 (select (arr!20409 a!3186) j!159) a!3186 mask!3328) (Found!8009 j!159)))))

(assert (=> b!781314 (=> (not res!528539) (not e!434582))))

(declare-fun b!781315 () Bool)

(declare-fun call!35252 () Bool)

(assert (=> b!781315 (= e!434581 call!35252)))

(declare-fun b!781316 () Bool)

(assert (=> b!781316 (= e!434582 call!35252)))

(declare-fun bm!35249 () Bool)

(assert (=> bm!35249 (= call!35252 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102619 (not res!528540)) b!781313))

(assert (= (and b!781313 c!86793) b!781314))

(assert (= (and b!781313 (not c!86793)) b!781315))

(assert (= (and b!781314 res!528539) b!781316))

(assert (= (or b!781316 b!781315) bm!35249))

(assert (=> b!781313 m!724007))

(assert (=> b!781313 m!724007))

(assert (=> b!781313 m!724017))

(assert (=> b!781314 m!724007))

(declare-fun m!724397 () Bool)

(assert (=> b!781314 m!724397))

(declare-fun m!724399 () Bool)

(assert (=> b!781314 m!724399))

(assert (=> b!781314 m!724007))

(assert (=> b!781314 m!724023))

(declare-fun m!724401 () Bool)

(assert (=> bm!35249 m!724401))

(assert (=> b!780793 d!102619))

(declare-fun d!102623 () Bool)

(assert (=> d!102623 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348170 () Unit!26924)

(declare-fun choose!38 (array!42636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26924)

(assert (=> d!102623 (= lt!348170 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102623 (validMask!0 mask!3328)))

(assert (=> d!102623 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!348170)))

(declare-fun bs!21731 () Bool)

(assert (= bs!21731 d!102623))

(assert (=> bs!21731 m!724025))

(declare-fun m!724403 () Bool)

(assert (=> bs!21731 m!724403))

(assert (=> bs!21731 m!724035))

(assert (=> b!780793 d!102623))

(push 1)

