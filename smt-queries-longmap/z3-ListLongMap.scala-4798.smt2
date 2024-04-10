; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65850 () Bool)

(assert start!65850)

(declare-fun b!758715 () Bool)

(declare-fun res!513331 () Bool)

(declare-fun e!422996 () Bool)

(assert (=> b!758715 (=> (not res!513331) (not e!422996))))

(declare-datatypes ((array!42023 0))(
  ( (array!42024 (arr!20125 (Array (_ BitVec 32) (_ BitVec 64))) (size!20546 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42023)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758715 (= res!513331 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758716 () Bool)

(declare-fun res!513333 () Bool)

(declare-fun e!423001 () Bool)

(assert (=> b!758716 (=> (not res!513333) (not e!423001))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42023 (_ BitVec 32)) Bool)

(assert (=> b!758716 (= res!513333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758717 () Bool)

(declare-fun res!513326 () Bool)

(assert (=> b!758717 (=> (not res!513326) (not e!423001))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758717 (= res!513326 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20546 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20546 a!3186))))))

(declare-fun b!758718 () Bool)

(declare-fun res!513335 () Bool)

(declare-fun e!423005 () Bool)

(assert (=> b!758718 (=> (not res!513335) (not e!423005))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758718 (= res!513335 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20125 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758719 () Bool)

(declare-fun e!422997 () Bool)

(declare-fun e!423004 () Bool)

(assert (=> b!758719 (= e!422997 e!423004)))

(declare-fun res!513327 () Bool)

(assert (=> b!758719 (=> res!513327 e!423004)))

(assert (=> b!758719 (= res!513327 (or (not (= (select (arr!20125 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-datatypes ((SeekEntryResult!7725 0))(
  ( (MissingZero!7725 (index!33268 (_ BitVec 32))) (Found!7725 (index!33269 (_ BitVec 32))) (Intermediate!7725 (undefined!8537 Bool) (index!33270 (_ BitVec 32)) (x!64155 (_ BitVec 32))) (Undefined!7725) (MissingVacant!7725 (index!33271 (_ BitVec 32))) )
))
(declare-fun lt!338057 () SeekEntryResult!7725)

(declare-fun lt!338056 () SeekEntryResult!7725)

(declare-fun lt!338069 () SeekEntryResult!7725)

(declare-fun lt!338060 () SeekEntryResult!7725)

(assert (=> b!758719 (and (= lt!338069 lt!338057) (= lt!338056 lt!338060))))

(declare-fun lt!338067 () array!42023)

(declare-fun lt!338068 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42023 (_ BitVec 32)) SeekEntryResult!7725)

(assert (=> b!758719 (= lt!338057 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!338068 lt!338067 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42023 (_ BitVec 32)) SeekEntryResult!7725)

(assert (=> b!758719 (= lt!338069 (seekEntryOrOpen!0 lt!338068 lt!338067 mask!3328))))

(declare-fun lt!338059 () (_ BitVec 64))

(assert (=> b!758719 (= lt!338059 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!26280 0))(
  ( (Unit!26281) )
))
(declare-fun lt!338064 () Unit!26280)

(declare-fun e!423003 () Unit!26280)

(assert (=> b!758719 (= lt!338064 e!423003)))

(declare-fun c!83080 () Bool)

(assert (=> b!758719 (= c!83080 (= lt!338059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!513329 () Bool)

(assert (=> start!65850 (=> (not res!513329) (not e!422996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65850 (= res!513329 (validMask!0 mask!3328))))

(assert (=> start!65850 e!422996))

(assert (=> start!65850 true))

(declare-fun array_inv!15921 (array!42023) Bool)

(assert (=> start!65850 (array_inv!15921 a!3186)))

(declare-fun b!758720 () Bool)

(assert (=> b!758720 (= e!423001 e!423005)))

(declare-fun res!513322 () Bool)

(assert (=> b!758720 (=> (not res!513322) (not e!423005))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!338061 () SeekEntryResult!7725)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42023 (_ BitVec 32)) SeekEntryResult!7725)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758720 (= res!513322 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20125 a!3186) j!159) mask!3328) (select (arr!20125 a!3186) j!159) a!3186 mask!3328) lt!338061))))

(assert (=> b!758720 (= lt!338061 (Intermediate!7725 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758721 () Bool)

(declare-fun e!422998 () Bool)

(declare-fun e!422995 () Bool)

(assert (=> b!758721 (= e!422998 e!422995)))

(declare-fun res!513318 () Bool)

(assert (=> b!758721 (=> res!513318 e!422995)))

(declare-fun lt!338055 () SeekEntryResult!7725)

(assert (=> b!758721 (= res!513318 (not (= lt!338060 lt!338055)))))

(assert (=> b!758721 (= lt!338060 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20125 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758722 () Bool)

(declare-fun e!423000 () Bool)

(assert (=> b!758722 (= e!423000 (not e!422998))))

(declare-fun res!513324 () Bool)

(assert (=> b!758722 (=> res!513324 e!422998)))

(declare-fun lt!338066 () SeekEntryResult!7725)

(get-info :version)

(assert (=> b!758722 (= res!513324 (or (not ((_ is Intermediate!7725) lt!338066)) (bvslt x!1131 (x!64155 lt!338066)) (not (= x!1131 (x!64155 lt!338066))) (not (= index!1321 (index!33270 lt!338066)))))))

(declare-fun e!422999 () Bool)

(assert (=> b!758722 e!422999))

(declare-fun res!513323 () Bool)

(assert (=> b!758722 (=> (not res!513323) (not e!422999))))

(assert (=> b!758722 (= res!513323 (= lt!338056 lt!338055))))

(assert (=> b!758722 (= lt!338055 (Found!7725 j!159))))

(assert (=> b!758722 (= lt!338056 (seekEntryOrOpen!0 (select (arr!20125 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!758722 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338062 () Unit!26280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42023 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26280)

(assert (=> b!758722 (= lt!338062 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758723 () Bool)

(declare-fun e!422994 () Bool)

(assert (=> b!758723 (= e!422994 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20125 a!3186) j!159) a!3186 mask!3328) (Found!7725 j!159)))))

(declare-fun b!758724 () Bool)

(declare-fun res!513330 () Bool)

(assert (=> b!758724 (=> (not res!513330) (not e!422996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758724 (= res!513330 (validKeyInArray!0 k0!2102))))

(declare-fun b!758725 () Bool)

(assert (=> b!758725 (= e!423004 true)))

(assert (=> b!758725 (= lt!338057 lt!338060)))

(declare-fun lt!338063 () Unit!26280)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42023 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26280)

(assert (=> b!758725 (= lt!338063 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758726 () Bool)

(declare-fun Unit!26282 () Unit!26280)

(assert (=> b!758726 (= e!423003 Unit!26282)))

(assert (=> b!758726 false))

(declare-fun b!758727 () Bool)

(assert (=> b!758727 (= e!422996 e!423001)))

(declare-fun res!513321 () Bool)

(assert (=> b!758727 (=> (not res!513321) (not e!423001))))

(declare-fun lt!338058 () SeekEntryResult!7725)

(assert (=> b!758727 (= res!513321 (or (= lt!338058 (MissingZero!7725 i!1173)) (= lt!338058 (MissingVacant!7725 i!1173))))))

(assert (=> b!758727 (= lt!338058 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758728 () Bool)

(assert (=> b!758728 (= e!422999 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20125 a!3186) j!159) a!3186 mask!3328) lt!338055))))

(declare-fun b!758729 () Bool)

(declare-fun res!513319 () Bool)

(assert (=> b!758729 (=> (not res!513319) (not e!423005))))

(assert (=> b!758729 (= res!513319 e!422994)))

(declare-fun c!83079 () Bool)

(assert (=> b!758729 (= c!83079 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758730 () Bool)

(assert (=> b!758730 (= e!422994 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20125 a!3186) j!159) a!3186 mask!3328) lt!338061))))

(declare-fun b!758731 () Bool)

(declare-fun res!513334 () Bool)

(assert (=> b!758731 (=> (not res!513334) (not e!423001))))

(declare-datatypes ((List!14127 0))(
  ( (Nil!14124) (Cons!14123 (h!15195 (_ BitVec 64)) (t!20442 List!14127)) )
))
(declare-fun arrayNoDuplicates!0 (array!42023 (_ BitVec 32) List!14127) Bool)

(assert (=> b!758731 (= res!513334 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14124))))

(declare-fun b!758732 () Bool)

(declare-fun res!513320 () Bool)

(assert (=> b!758732 (=> (not res!513320) (not e!422996))))

(assert (=> b!758732 (= res!513320 (validKeyInArray!0 (select (arr!20125 a!3186) j!159)))))

(declare-fun b!758733 () Bool)

(declare-fun Unit!26283 () Unit!26280)

(assert (=> b!758733 (= e!423003 Unit!26283)))

(declare-fun b!758734 () Bool)

(assert (=> b!758734 (= e!423005 e!423000)))

(declare-fun res!513325 () Bool)

(assert (=> b!758734 (=> (not res!513325) (not e!423000))))

(declare-fun lt!338065 () SeekEntryResult!7725)

(assert (=> b!758734 (= res!513325 (= lt!338065 lt!338066))))

(assert (=> b!758734 (= lt!338066 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338068 lt!338067 mask!3328))))

(assert (=> b!758734 (= lt!338065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338068 mask!3328) lt!338068 lt!338067 mask!3328))))

(assert (=> b!758734 (= lt!338068 (select (store (arr!20125 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758734 (= lt!338067 (array!42024 (store (arr!20125 a!3186) i!1173 k0!2102) (size!20546 a!3186)))))

(declare-fun b!758735 () Bool)

(declare-fun res!513328 () Bool)

(assert (=> b!758735 (=> (not res!513328) (not e!422996))))

(assert (=> b!758735 (= res!513328 (and (= (size!20546 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20546 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20546 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758736 () Bool)

(assert (=> b!758736 (= e!422995 e!422997)))

(declare-fun res!513332 () Bool)

(assert (=> b!758736 (=> res!513332 e!422997)))

(assert (=> b!758736 (= res!513332 (= lt!338059 lt!338068))))

(assert (=> b!758736 (= lt!338059 (select (store (arr!20125 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!65850 res!513329) b!758735))

(assert (= (and b!758735 res!513328) b!758732))

(assert (= (and b!758732 res!513320) b!758724))

(assert (= (and b!758724 res!513330) b!758715))

(assert (= (and b!758715 res!513331) b!758727))

(assert (= (and b!758727 res!513321) b!758716))

(assert (= (and b!758716 res!513333) b!758731))

(assert (= (and b!758731 res!513334) b!758717))

(assert (= (and b!758717 res!513326) b!758720))

(assert (= (and b!758720 res!513322) b!758718))

(assert (= (and b!758718 res!513335) b!758729))

(assert (= (and b!758729 c!83079) b!758730))

(assert (= (and b!758729 (not c!83079)) b!758723))

(assert (= (and b!758729 res!513319) b!758734))

(assert (= (and b!758734 res!513325) b!758722))

(assert (= (and b!758722 res!513323) b!758728))

(assert (= (and b!758722 (not res!513324)) b!758721))

(assert (= (and b!758721 (not res!513318)) b!758736))

(assert (= (and b!758736 (not res!513332)) b!758719))

(assert (= (and b!758719 c!83080) b!758726))

(assert (= (and b!758719 (not c!83080)) b!758733))

(assert (= (and b!758719 (not res!513327)) b!758725))

(declare-fun m!706155 () Bool)

(assert (=> start!65850 m!706155))

(declare-fun m!706157 () Bool)

(assert (=> start!65850 m!706157))

(declare-fun m!706159 () Bool)

(assert (=> b!758736 m!706159))

(declare-fun m!706161 () Bool)

(assert (=> b!758736 m!706161))

(declare-fun m!706163 () Bool)

(assert (=> b!758731 m!706163))

(declare-fun m!706165 () Bool)

(assert (=> b!758732 m!706165))

(assert (=> b!758732 m!706165))

(declare-fun m!706167 () Bool)

(assert (=> b!758732 m!706167))

(declare-fun m!706169 () Bool)

(assert (=> b!758734 m!706169))

(declare-fun m!706171 () Bool)

(assert (=> b!758734 m!706171))

(assert (=> b!758734 m!706171))

(declare-fun m!706173 () Bool)

(assert (=> b!758734 m!706173))

(assert (=> b!758734 m!706159))

(declare-fun m!706175 () Bool)

(assert (=> b!758734 m!706175))

(assert (=> b!758723 m!706165))

(assert (=> b!758723 m!706165))

(declare-fun m!706177 () Bool)

(assert (=> b!758723 m!706177))

(declare-fun m!706179 () Bool)

(assert (=> b!758727 m!706179))

(declare-fun m!706181 () Bool)

(assert (=> b!758715 m!706181))

(declare-fun m!706183 () Bool)

(assert (=> b!758716 m!706183))

(assert (=> b!758722 m!706165))

(assert (=> b!758722 m!706165))

(declare-fun m!706185 () Bool)

(assert (=> b!758722 m!706185))

(declare-fun m!706187 () Bool)

(assert (=> b!758722 m!706187))

(declare-fun m!706189 () Bool)

(assert (=> b!758722 m!706189))

(assert (=> b!758728 m!706165))

(assert (=> b!758728 m!706165))

(declare-fun m!706191 () Bool)

(assert (=> b!758728 m!706191))

(assert (=> b!758730 m!706165))

(assert (=> b!758730 m!706165))

(declare-fun m!706193 () Bool)

(assert (=> b!758730 m!706193))

(declare-fun m!706195 () Bool)

(assert (=> b!758725 m!706195))

(assert (=> b!758721 m!706165))

(assert (=> b!758721 m!706165))

(assert (=> b!758721 m!706177))

(declare-fun m!706197 () Bool)

(assert (=> b!758719 m!706197))

(declare-fun m!706199 () Bool)

(assert (=> b!758719 m!706199))

(declare-fun m!706201 () Bool)

(assert (=> b!758719 m!706201))

(declare-fun m!706203 () Bool)

(assert (=> b!758718 m!706203))

(assert (=> b!758720 m!706165))

(assert (=> b!758720 m!706165))

(declare-fun m!706205 () Bool)

(assert (=> b!758720 m!706205))

(assert (=> b!758720 m!706205))

(assert (=> b!758720 m!706165))

(declare-fun m!706207 () Bool)

(assert (=> b!758720 m!706207))

(declare-fun m!706209 () Bool)

(assert (=> b!758724 m!706209))

(check-sat (not b!758728) (not b!758715) (not b!758730) (not start!65850) (not b!758731) (not b!758720) (not b!758727) (not b!758719) (not b!758723) (not b!758722) (not b!758732) (not b!758734) (not b!758721) (not b!758724) (not b!758725) (not b!758716))
(check-sat)
