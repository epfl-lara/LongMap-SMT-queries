; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67300 () Bool)

(assert start!67300)

(declare-fun b!777569 () Bool)

(declare-fun e!432729 () Bool)

(declare-fun e!432728 () Bool)

(assert (=> b!777569 (= e!432729 e!432728)))

(declare-fun res!525948 () Bool)

(assert (=> b!777569 (=> (not res!525948) (not e!432728))))

(declare-datatypes ((array!42535 0))(
  ( (array!42536 (arr!20359 (Array (_ BitVec 32) (_ BitVec 64))) (size!20779 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42535)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7915 0))(
  ( (MissingZero!7915 (index!34028 (_ BitVec 32))) (Found!7915 (index!34029 (_ BitVec 32))) (Intermediate!7915 (undefined!8727 Bool) (index!34030 (_ BitVec 32)) (x!65125 (_ BitVec 32))) (Undefined!7915) (MissingVacant!7915 (index!34031 (_ BitVec 32))) )
))
(declare-fun lt!346433 () SeekEntryResult!7915)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42535 (_ BitVec 32)) SeekEntryResult!7915)

(assert (=> b!777569 (= res!525948 (= (seekEntryOrOpen!0 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346433))))

(assert (=> b!777569 (= lt!346433 (Found!7915 j!159))))

(declare-fun b!777570 () Bool)

(declare-fun res!525951 () Bool)

(declare-fun e!432724 () Bool)

(assert (=> b!777570 (=> (not res!525951) (not e!432724))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!777570 (= res!525951 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20779 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20779 a!3186))))))

(declare-fun b!777571 () Bool)

(declare-fun e!432726 () Bool)

(assert (=> b!777571 (= e!432726 e!432724)))

(declare-fun res!525959 () Bool)

(assert (=> b!777571 (=> (not res!525959) (not e!432724))))

(declare-fun lt!346438 () SeekEntryResult!7915)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!777571 (= res!525959 (or (= lt!346438 (MissingZero!7915 i!1173)) (= lt!346438 (MissingVacant!7915 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!777571 (= lt!346438 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!777572 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42535 (_ BitVec 32)) SeekEntryResult!7915)

(assert (=> b!777572 (= e!432728 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346433))))

(declare-fun b!777573 () Bool)

(declare-fun res!525957 () Bool)

(assert (=> b!777573 (=> (not res!525957) (not e!432726))))

(assert (=> b!777573 (= res!525957 (and (= (size!20779 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20779 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20779 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777574 () Bool)

(declare-fun res!525953 () Bool)

(declare-fun e!432722 () Bool)

(assert (=> b!777574 (=> res!525953 e!432722)))

(assert (=> b!777574 (= res!525953 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) (Found!7915 j!159))))))

(declare-fun b!777575 () Bool)

(declare-fun e!432727 () Bool)

(declare-fun e!432723 () Bool)

(assert (=> b!777575 (= e!432727 e!432723)))

(declare-fun res!525952 () Bool)

(assert (=> b!777575 (=> (not res!525952) (not e!432723))))

(declare-fun lt!346431 () SeekEntryResult!7915)

(declare-fun lt!346436 () SeekEntryResult!7915)

(assert (=> b!777575 (= res!525952 (= lt!346431 lt!346436))))

(declare-fun lt!346437 () array!42535)

(declare-fun lt!346432 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42535 (_ BitVec 32)) SeekEntryResult!7915)

(assert (=> b!777575 (= lt!346436 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346432 lt!346437 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777575 (= lt!346431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346432 mask!3328) lt!346432 lt!346437 mask!3328))))

(assert (=> b!777575 (= lt!346432 (select (store (arr!20359 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777575 (= lt!346437 (array!42536 (store (arr!20359 a!3186) i!1173 k0!2102) (size!20779 a!3186)))))

(declare-fun b!777576 () Bool)

(declare-fun res!525945 () Bool)

(assert (=> b!777576 (=> (not res!525945) (not e!432724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42535 (_ BitVec 32)) Bool)

(assert (=> b!777576 (= res!525945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!525960 () Bool)

(assert (=> start!67300 (=> (not res!525960) (not e!432726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67300 (= res!525960 (validMask!0 mask!3328))))

(assert (=> start!67300 e!432726))

(assert (=> start!67300 true))

(declare-fun array_inv!16218 (array!42535) Bool)

(assert (=> start!67300 (array_inv!16218 a!3186)))

(declare-fun b!777577 () Bool)

(assert (=> b!777577 (= e!432722 (= (seekEntryOrOpen!0 lt!346432 lt!346437 mask!3328) (Found!7915 index!1321)))))

(declare-fun b!777578 () Bool)

(declare-fun res!525946 () Bool)

(assert (=> b!777578 (=> res!525946 e!432722)))

(assert (=> b!777578 (= res!525946 (or (not (= (select (store (arr!20359 a!3186) i!1173 k0!2102) index!1321) lt!346432)) (undefined!8727 lt!346436)))))

(declare-fun b!777579 () Bool)

(declare-fun res!525956 () Bool)

(assert (=> b!777579 (=> (not res!525956) (not e!432727))))

(declare-fun e!432725 () Bool)

(assert (=> b!777579 (= res!525956 e!432725)))

(declare-fun c!86216 () Bool)

(assert (=> b!777579 (= c!86216 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!346435 () SeekEntryResult!7915)

(declare-fun b!777580 () Bool)

(assert (=> b!777580 (= e!432725 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346435))))

(declare-fun b!777581 () Bool)

(declare-fun res!525943 () Bool)

(assert (=> b!777581 (=> (not res!525943) (not e!432726))))

(declare-fun arrayContainsKey!0 (array!42535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777581 (= res!525943 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777582 () Bool)

(assert (=> b!777582 (= e!432723 (not e!432722))))

(declare-fun res!525958 () Bool)

(assert (=> b!777582 (=> res!525958 e!432722)))

(get-info :version)

(assert (=> b!777582 (= res!525958 (or (not ((_ is Intermediate!7915) lt!346436)) (bvslt x!1131 (x!65125 lt!346436)) (not (= x!1131 (x!65125 lt!346436))) (not (= index!1321 (index!34030 lt!346436)))))))

(assert (=> b!777582 e!432729))

(declare-fun res!525950 () Bool)

(assert (=> b!777582 (=> (not res!525950) (not e!432729))))

(assert (=> b!777582 (= res!525950 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26803 0))(
  ( (Unit!26804) )
))
(declare-fun lt!346434 () Unit!26803)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26803)

(assert (=> b!777582 (= lt!346434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777583 () Bool)

(declare-fun res!525954 () Bool)

(assert (=> b!777583 (=> (not res!525954) (not e!432724))))

(declare-datatypes ((List!14268 0))(
  ( (Nil!14265) (Cons!14264 (h!15378 (_ BitVec 64)) (t!20575 List!14268)) )
))
(declare-fun arrayNoDuplicates!0 (array!42535 (_ BitVec 32) List!14268) Bool)

(assert (=> b!777583 (= res!525954 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14265))))

(declare-fun b!777584 () Bool)

(declare-fun res!525944 () Bool)

(assert (=> b!777584 (=> (not res!525944) (not e!432726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777584 (= res!525944 (validKeyInArray!0 (select (arr!20359 a!3186) j!159)))))

(declare-fun b!777585 () Bool)

(assert (=> b!777585 (= e!432724 e!432727)))

(declare-fun res!525955 () Bool)

(assert (=> b!777585 (=> (not res!525955) (not e!432727))))

(assert (=> b!777585 (= res!525955 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20359 a!3186) j!159) mask!3328) (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346435))))

(assert (=> b!777585 (= lt!346435 (Intermediate!7915 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777586 () Bool)

(declare-fun res!525947 () Bool)

(assert (=> b!777586 (=> (not res!525947) (not e!432727))))

(assert (=> b!777586 (= res!525947 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20359 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777587 () Bool)

(declare-fun res!525949 () Bool)

(assert (=> b!777587 (=> (not res!525949) (not e!432726))))

(assert (=> b!777587 (= res!525949 (validKeyInArray!0 k0!2102))))

(declare-fun b!777588 () Bool)

(assert (=> b!777588 (= e!432725 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) (Found!7915 j!159)))))

(assert (= (and start!67300 res!525960) b!777573))

(assert (= (and b!777573 res!525957) b!777584))

(assert (= (and b!777584 res!525944) b!777587))

(assert (= (and b!777587 res!525949) b!777581))

(assert (= (and b!777581 res!525943) b!777571))

(assert (= (and b!777571 res!525959) b!777576))

(assert (= (and b!777576 res!525945) b!777583))

(assert (= (and b!777583 res!525954) b!777570))

(assert (= (and b!777570 res!525951) b!777585))

(assert (= (and b!777585 res!525955) b!777586))

(assert (= (and b!777586 res!525947) b!777579))

(assert (= (and b!777579 c!86216) b!777580))

(assert (= (and b!777579 (not c!86216)) b!777588))

(assert (= (and b!777579 res!525956) b!777575))

(assert (= (and b!777575 res!525952) b!777582))

(assert (= (and b!777582 res!525950) b!777569))

(assert (= (and b!777569 res!525948) b!777572))

(assert (= (and b!777582 (not res!525958)) b!777574))

(assert (= (and b!777574 (not res!525953)) b!777578))

(assert (= (and b!777578 (not res!525946)) b!777577))

(declare-fun m!721991 () Bool)

(assert (=> b!777584 m!721991))

(assert (=> b!777584 m!721991))

(declare-fun m!721993 () Bool)

(assert (=> b!777584 m!721993))

(declare-fun m!721995 () Bool)

(assert (=> b!777577 m!721995))

(assert (=> b!777569 m!721991))

(assert (=> b!777569 m!721991))

(declare-fun m!721997 () Bool)

(assert (=> b!777569 m!721997))

(assert (=> b!777588 m!721991))

(assert (=> b!777588 m!721991))

(declare-fun m!721999 () Bool)

(assert (=> b!777588 m!721999))

(declare-fun m!722001 () Bool)

(assert (=> b!777586 m!722001))

(declare-fun m!722003 () Bool)

(assert (=> b!777581 m!722003))

(declare-fun m!722005 () Bool)

(assert (=> b!777571 m!722005))

(declare-fun m!722007 () Bool)

(assert (=> b!777582 m!722007))

(declare-fun m!722009 () Bool)

(assert (=> b!777582 m!722009))

(assert (=> b!777585 m!721991))

(assert (=> b!777585 m!721991))

(declare-fun m!722011 () Bool)

(assert (=> b!777585 m!722011))

(assert (=> b!777585 m!722011))

(assert (=> b!777585 m!721991))

(declare-fun m!722013 () Bool)

(assert (=> b!777585 m!722013))

(assert (=> b!777572 m!721991))

(assert (=> b!777572 m!721991))

(declare-fun m!722015 () Bool)

(assert (=> b!777572 m!722015))

(declare-fun m!722017 () Bool)

(assert (=> b!777578 m!722017))

(declare-fun m!722019 () Bool)

(assert (=> b!777578 m!722019))

(assert (=> b!777574 m!721991))

(assert (=> b!777574 m!721991))

(assert (=> b!777574 m!721999))

(declare-fun m!722021 () Bool)

(assert (=> b!777583 m!722021))

(declare-fun m!722023 () Bool)

(assert (=> start!67300 m!722023))

(declare-fun m!722025 () Bool)

(assert (=> start!67300 m!722025))

(declare-fun m!722027 () Bool)

(assert (=> b!777576 m!722027))

(assert (=> b!777580 m!721991))

(assert (=> b!777580 m!721991))

(declare-fun m!722029 () Bool)

(assert (=> b!777580 m!722029))

(declare-fun m!722031 () Bool)

(assert (=> b!777587 m!722031))

(declare-fun m!722033 () Bool)

(assert (=> b!777575 m!722033))

(assert (=> b!777575 m!722033))

(declare-fun m!722035 () Bool)

(assert (=> b!777575 m!722035))

(assert (=> b!777575 m!722017))

(declare-fun m!722037 () Bool)

(assert (=> b!777575 m!722037))

(declare-fun m!722039 () Bool)

(assert (=> b!777575 m!722039))

(check-sat (not b!777585) (not b!777574) (not start!67300) (not b!777584) (not b!777580) (not b!777582) (not b!777588) (not b!777583) (not b!777571) (not b!777587) (not b!777572) (not b!777577) (not b!777576) (not b!777581) (not b!777569) (not b!777575))
(check-sat)
(get-model)

(declare-fun lt!346495 () SeekEntryResult!7915)

(declare-fun b!777721 () Bool)

(declare-fun e!432792 () SeekEntryResult!7915)

(assert (=> b!777721 (= e!432792 (seekKeyOrZeroReturnVacant!0 (x!65125 lt!346495) (index!34030 lt!346495) (index!34030 lt!346495) (select (arr!20359 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777722 () Bool)

(declare-fun e!432791 () SeekEntryResult!7915)

(assert (=> b!777722 (= e!432791 Undefined!7915)))

(declare-fun b!777723 () Bool)

(declare-fun e!432793 () SeekEntryResult!7915)

(assert (=> b!777723 (= e!432793 (Found!7915 (index!34030 lt!346495)))))

(declare-fun d!102393 () Bool)

(declare-fun lt!346494 () SeekEntryResult!7915)

(assert (=> d!102393 (and (or ((_ is Undefined!7915) lt!346494) (not ((_ is Found!7915) lt!346494)) (and (bvsge (index!34029 lt!346494) #b00000000000000000000000000000000) (bvslt (index!34029 lt!346494) (size!20779 a!3186)))) (or ((_ is Undefined!7915) lt!346494) ((_ is Found!7915) lt!346494) (not ((_ is MissingZero!7915) lt!346494)) (and (bvsge (index!34028 lt!346494) #b00000000000000000000000000000000) (bvslt (index!34028 lt!346494) (size!20779 a!3186)))) (or ((_ is Undefined!7915) lt!346494) ((_ is Found!7915) lt!346494) ((_ is MissingZero!7915) lt!346494) (not ((_ is MissingVacant!7915) lt!346494)) (and (bvsge (index!34031 lt!346494) #b00000000000000000000000000000000) (bvslt (index!34031 lt!346494) (size!20779 a!3186)))) (or ((_ is Undefined!7915) lt!346494) (ite ((_ is Found!7915) lt!346494) (= (select (arr!20359 a!3186) (index!34029 lt!346494)) (select (arr!20359 a!3186) j!159)) (ite ((_ is MissingZero!7915) lt!346494) (= (select (arr!20359 a!3186) (index!34028 lt!346494)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7915) lt!346494) (= (select (arr!20359 a!3186) (index!34031 lt!346494)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102393 (= lt!346494 e!432791)))

(declare-fun c!86229 () Bool)

(assert (=> d!102393 (= c!86229 (and ((_ is Intermediate!7915) lt!346495) (undefined!8727 lt!346495)))))

(assert (=> d!102393 (= lt!346495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20359 a!3186) j!159) mask!3328) (select (arr!20359 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102393 (validMask!0 mask!3328)))

(assert (=> d!102393 (= (seekEntryOrOpen!0 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346494)))

(declare-fun b!777724 () Bool)

(declare-fun c!86231 () Bool)

(declare-fun lt!346493 () (_ BitVec 64))

(assert (=> b!777724 (= c!86231 (= lt!346493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777724 (= e!432793 e!432792)))

(declare-fun b!777725 () Bool)

(assert (=> b!777725 (= e!432792 (MissingZero!7915 (index!34030 lt!346495)))))

(declare-fun b!777726 () Bool)

(assert (=> b!777726 (= e!432791 e!432793)))

(assert (=> b!777726 (= lt!346493 (select (arr!20359 a!3186) (index!34030 lt!346495)))))

(declare-fun c!86230 () Bool)

(assert (=> b!777726 (= c!86230 (= lt!346493 (select (arr!20359 a!3186) j!159)))))

(assert (= (and d!102393 c!86229) b!777722))

(assert (= (and d!102393 (not c!86229)) b!777726))

(assert (= (and b!777726 c!86230) b!777723))

(assert (= (and b!777726 (not c!86230)) b!777724))

(assert (= (and b!777724 c!86231) b!777725))

(assert (= (and b!777724 (not c!86231)) b!777721))

(assert (=> b!777721 m!721991))

(declare-fun m!722141 () Bool)

(assert (=> b!777721 m!722141))

(declare-fun m!722143 () Bool)

(assert (=> d!102393 m!722143))

(assert (=> d!102393 m!722011))

(assert (=> d!102393 m!721991))

(assert (=> d!102393 m!722013))

(assert (=> d!102393 m!722023))

(declare-fun m!722145 () Bool)

(assert (=> d!102393 m!722145))

(declare-fun m!722147 () Bool)

(assert (=> d!102393 m!722147))

(assert (=> d!102393 m!721991))

(assert (=> d!102393 m!722011))

(declare-fun m!722149 () Bool)

(assert (=> b!777726 m!722149))

(assert (=> b!777569 d!102393))

(declare-fun b!777745 () Bool)

(declare-fun e!432805 () Bool)

(declare-fun lt!346500 () SeekEntryResult!7915)

(assert (=> b!777745 (= e!432805 (bvsge (x!65125 lt!346500) #b01111111111111111111111111111110))))

(declare-fun e!432804 () SeekEntryResult!7915)

(declare-fun b!777746 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777746 (= e!432804 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20359 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777747 () Bool)

(assert (=> b!777747 (= e!432804 (Intermediate!7915 false index!1321 x!1131))))

(declare-fun b!777748 () Bool)

(assert (=> b!777748 (and (bvsge (index!34030 lt!346500) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346500) (size!20779 a!3186)))))

(declare-fun res!526076 () Bool)

(assert (=> b!777748 (= res!526076 (= (select (arr!20359 a!3186) (index!34030 lt!346500)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432808 () Bool)

(assert (=> b!777748 (=> res!526076 e!432808)))

(declare-fun d!102395 () Bool)

(assert (=> d!102395 e!432805))

(declare-fun c!86238 () Bool)

(assert (=> d!102395 (= c!86238 (and ((_ is Intermediate!7915) lt!346500) (undefined!8727 lt!346500)))))

(declare-fun e!432806 () SeekEntryResult!7915)

(assert (=> d!102395 (= lt!346500 e!432806)))

(declare-fun c!86240 () Bool)

(assert (=> d!102395 (= c!86240 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!346501 () (_ BitVec 64))

(assert (=> d!102395 (= lt!346501 (select (arr!20359 a!3186) index!1321))))

(assert (=> d!102395 (validMask!0 mask!3328)))

(assert (=> d!102395 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346500)))

(declare-fun b!777749 () Bool)

(declare-fun e!432807 () Bool)

(assert (=> b!777749 (= e!432805 e!432807)))

(declare-fun res!526075 () Bool)

(assert (=> b!777749 (= res!526075 (and ((_ is Intermediate!7915) lt!346500) (not (undefined!8727 lt!346500)) (bvslt (x!65125 lt!346500) #b01111111111111111111111111111110) (bvsge (x!65125 lt!346500) #b00000000000000000000000000000000) (bvsge (x!65125 lt!346500) x!1131)))))

(assert (=> b!777749 (=> (not res!526075) (not e!432807))))

(declare-fun b!777750 () Bool)

(assert (=> b!777750 (and (bvsge (index!34030 lt!346500) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346500) (size!20779 a!3186)))))

(assert (=> b!777750 (= e!432808 (= (select (arr!20359 a!3186) (index!34030 lt!346500)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777751 () Bool)

(assert (=> b!777751 (and (bvsge (index!34030 lt!346500) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346500) (size!20779 a!3186)))))

(declare-fun res!526077 () Bool)

(assert (=> b!777751 (= res!526077 (= (select (arr!20359 a!3186) (index!34030 lt!346500)) (select (arr!20359 a!3186) j!159)))))

(assert (=> b!777751 (=> res!526077 e!432808)))

(assert (=> b!777751 (= e!432807 e!432808)))

(declare-fun b!777752 () Bool)

(assert (=> b!777752 (= e!432806 (Intermediate!7915 true index!1321 x!1131))))

(declare-fun b!777753 () Bool)

(assert (=> b!777753 (= e!432806 e!432804)))

(declare-fun c!86239 () Bool)

(assert (=> b!777753 (= c!86239 (or (= lt!346501 (select (arr!20359 a!3186) j!159)) (= (bvadd lt!346501 lt!346501) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102395 c!86240) b!777752))

(assert (= (and d!102395 (not c!86240)) b!777753))

(assert (= (and b!777753 c!86239) b!777747))

(assert (= (and b!777753 (not c!86239)) b!777746))

(assert (= (and d!102395 c!86238) b!777745))

(assert (= (and d!102395 (not c!86238)) b!777749))

(assert (= (and b!777749 res!526075) b!777751))

(assert (= (and b!777751 (not res!526077)) b!777748))

(assert (= (and b!777748 (not res!526076)) b!777750))

(declare-fun m!722151 () Bool)

(assert (=> b!777750 m!722151))

(declare-fun m!722153 () Bool)

(assert (=> d!102395 m!722153))

(assert (=> d!102395 m!722023))

(declare-fun m!722155 () Bool)

(assert (=> b!777746 m!722155))

(assert (=> b!777746 m!722155))

(assert (=> b!777746 m!721991))

(declare-fun m!722157 () Bool)

(assert (=> b!777746 m!722157))

(assert (=> b!777748 m!722151))

(assert (=> b!777751 m!722151))

(assert (=> b!777580 d!102395))

(declare-fun d!102399 () Bool)

(declare-fun res!526082 () Bool)

(declare-fun e!432813 () Bool)

(assert (=> d!102399 (=> res!526082 e!432813)))

(assert (=> d!102399 (= res!526082 (= (select (arr!20359 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102399 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!432813)))

(declare-fun b!777758 () Bool)

(declare-fun e!432814 () Bool)

(assert (=> b!777758 (= e!432813 e!432814)))

(declare-fun res!526083 () Bool)

(assert (=> b!777758 (=> (not res!526083) (not e!432814))))

(assert (=> b!777758 (= res!526083 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20779 a!3186)))))

(declare-fun b!777759 () Bool)

(assert (=> b!777759 (= e!432814 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102399 (not res!526082)) b!777758))

(assert (= (and b!777758 res!526083) b!777759))

(declare-fun m!722159 () Bool)

(assert (=> d!102399 m!722159))

(declare-fun m!722161 () Bool)

(assert (=> b!777759 m!722161))

(assert (=> b!777581 d!102399))

(declare-fun b!777760 () Bool)

(declare-fun e!432816 () SeekEntryResult!7915)

(declare-fun lt!346504 () SeekEntryResult!7915)

(assert (=> b!777760 (= e!432816 (seekKeyOrZeroReturnVacant!0 (x!65125 lt!346504) (index!34030 lt!346504) (index!34030 lt!346504) k0!2102 a!3186 mask!3328))))

(declare-fun b!777761 () Bool)

(declare-fun e!432815 () SeekEntryResult!7915)

(assert (=> b!777761 (= e!432815 Undefined!7915)))

(declare-fun b!777762 () Bool)

(declare-fun e!432817 () SeekEntryResult!7915)

(assert (=> b!777762 (= e!432817 (Found!7915 (index!34030 lt!346504)))))

(declare-fun d!102401 () Bool)

(declare-fun lt!346503 () SeekEntryResult!7915)

(assert (=> d!102401 (and (or ((_ is Undefined!7915) lt!346503) (not ((_ is Found!7915) lt!346503)) (and (bvsge (index!34029 lt!346503) #b00000000000000000000000000000000) (bvslt (index!34029 lt!346503) (size!20779 a!3186)))) (or ((_ is Undefined!7915) lt!346503) ((_ is Found!7915) lt!346503) (not ((_ is MissingZero!7915) lt!346503)) (and (bvsge (index!34028 lt!346503) #b00000000000000000000000000000000) (bvslt (index!34028 lt!346503) (size!20779 a!3186)))) (or ((_ is Undefined!7915) lt!346503) ((_ is Found!7915) lt!346503) ((_ is MissingZero!7915) lt!346503) (not ((_ is MissingVacant!7915) lt!346503)) (and (bvsge (index!34031 lt!346503) #b00000000000000000000000000000000) (bvslt (index!34031 lt!346503) (size!20779 a!3186)))) (or ((_ is Undefined!7915) lt!346503) (ite ((_ is Found!7915) lt!346503) (= (select (arr!20359 a!3186) (index!34029 lt!346503)) k0!2102) (ite ((_ is MissingZero!7915) lt!346503) (= (select (arr!20359 a!3186) (index!34028 lt!346503)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7915) lt!346503) (= (select (arr!20359 a!3186) (index!34031 lt!346503)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102401 (= lt!346503 e!432815)))

(declare-fun c!86241 () Bool)

(assert (=> d!102401 (= c!86241 (and ((_ is Intermediate!7915) lt!346504) (undefined!8727 lt!346504)))))

(assert (=> d!102401 (= lt!346504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102401 (validMask!0 mask!3328)))

(assert (=> d!102401 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!346503)))

(declare-fun b!777763 () Bool)

(declare-fun c!86243 () Bool)

(declare-fun lt!346502 () (_ BitVec 64))

(assert (=> b!777763 (= c!86243 (= lt!346502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777763 (= e!432817 e!432816)))

(declare-fun b!777764 () Bool)

(assert (=> b!777764 (= e!432816 (MissingZero!7915 (index!34030 lt!346504)))))

(declare-fun b!777765 () Bool)

(assert (=> b!777765 (= e!432815 e!432817)))

(assert (=> b!777765 (= lt!346502 (select (arr!20359 a!3186) (index!34030 lt!346504)))))

(declare-fun c!86242 () Bool)

(assert (=> b!777765 (= c!86242 (= lt!346502 k0!2102))))

(assert (= (and d!102401 c!86241) b!777761))

(assert (= (and d!102401 (not c!86241)) b!777765))

(assert (= (and b!777765 c!86242) b!777762))

(assert (= (and b!777765 (not c!86242)) b!777763))

(assert (= (and b!777763 c!86243) b!777764))

(assert (= (and b!777763 (not c!86243)) b!777760))

(declare-fun m!722163 () Bool)

(assert (=> b!777760 m!722163))

(declare-fun m!722165 () Bool)

(assert (=> d!102401 m!722165))

(declare-fun m!722167 () Bool)

(assert (=> d!102401 m!722167))

(declare-fun m!722169 () Bool)

(assert (=> d!102401 m!722169))

(assert (=> d!102401 m!722023))

(declare-fun m!722171 () Bool)

(assert (=> d!102401 m!722171))

(declare-fun m!722173 () Bool)

(assert (=> d!102401 m!722173))

(assert (=> d!102401 m!722167))

(declare-fun m!722175 () Bool)

(assert (=> b!777765 m!722175))

(assert (=> b!777571 d!102401))

(declare-fun b!777766 () Bool)

(declare-fun e!432819 () SeekEntryResult!7915)

(declare-fun lt!346507 () SeekEntryResult!7915)

(assert (=> b!777766 (= e!432819 (seekKeyOrZeroReturnVacant!0 (x!65125 lt!346507) (index!34030 lt!346507) (index!34030 lt!346507) lt!346432 lt!346437 mask!3328))))

(declare-fun b!777767 () Bool)

(declare-fun e!432818 () SeekEntryResult!7915)

(assert (=> b!777767 (= e!432818 Undefined!7915)))

(declare-fun b!777768 () Bool)

(declare-fun e!432820 () SeekEntryResult!7915)

(assert (=> b!777768 (= e!432820 (Found!7915 (index!34030 lt!346507)))))

(declare-fun d!102403 () Bool)

(declare-fun lt!346506 () SeekEntryResult!7915)

(assert (=> d!102403 (and (or ((_ is Undefined!7915) lt!346506) (not ((_ is Found!7915) lt!346506)) (and (bvsge (index!34029 lt!346506) #b00000000000000000000000000000000) (bvslt (index!34029 lt!346506) (size!20779 lt!346437)))) (or ((_ is Undefined!7915) lt!346506) ((_ is Found!7915) lt!346506) (not ((_ is MissingZero!7915) lt!346506)) (and (bvsge (index!34028 lt!346506) #b00000000000000000000000000000000) (bvslt (index!34028 lt!346506) (size!20779 lt!346437)))) (or ((_ is Undefined!7915) lt!346506) ((_ is Found!7915) lt!346506) ((_ is MissingZero!7915) lt!346506) (not ((_ is MissingVacant!7915) lt!346506)) (and (bvsge (index!34031 lt!346506) #b00000000000000000000000000000000) (bvslt (index!34031 lt!346506) (size!20779 lt!346437)))) (or ((_ is Undefined!7915) lt!346506) (ite ((_ is Found!7915) lt!346506) (= (select (arr!20359 lt!346437) (index!34029 lt!346506)) lt!346432) (ite ((_ is MissingZero!7915) lt!346506) (= (select (arr!20359 lt!346437) (index!34028 lt!346506)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7915) lt!346506) (= (select (arr!20359 lt!346437) (index!34031 lt!346506)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102403 (= lt!346506 e!432818)))

(declare-fun c!86244 () Bool)

(assert (=> d!102403 (= c!86244 (and ((_ is Intermediate!7915) lt!346507) (undefined!8727 lt!346507)))))

(assert (=> d!102403 (= lt!346507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346432 mask!3328) lt!346432 lt!346437 mask!3328))))

(assert (=> d!102403 (validMask!0 mask!3328)))

(assert (=> d!102403 (= (seekEntryOrOpen!0 lt!346432 lt!346437 mask!3328) lt!346506)))

(declare-fun b!777769 () Bool)

(declare-fun c!86246 () Bool)

(declare-fun lt!346505 () (_ BitVec 64))

(assert (=> b!777769 (= c!86246 (= lt!346505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777769 (= e!432820 e!432819)))

(declare-fun b!777770 () Bool)

(assert (=> b!777770 (= e!432819 (MissingZero!7915 (index!34030 lt!346507)))))

(declare-fun b!777771 () Bool)

(assert (=> b!777771 (= e!432818 e!432820)))

(assert (=> b!777771 (= lt!346505 (select (arr!20359 lt!346437) (index!34030 lt!346507)))))

(declare-fun c!86245 () Bool)

(assert (=> b!777771 (= c!86245 (= lt!346505 lt!346432))))

(assert (= (and d!102403 c!86244) b!777767))

(assert (= (and d!102403 (not c!86244)) b!777771))

(assert (= (and b!777771 c!86245) b!777768))

(assert (= (and b!777771 (not c!86245)) b!777769))

(assert (= (and b!777769 c!86246) b!777770))

(assert (= (and b!777769 (not c!86246)) b!777766))

(declare-fun m!722177 () Bool)

(assert (=> b!777766 m!722177))

(declare-fun m!722179 () Bool)

(assert (=> d!102403 m!722179))

(assert (=> d!102403 m!722033))

(assert (=> d!102403 m!722035))

(assert (=> d!102403 m!722023))

(declare-fun m!722181 () Bool)

(assert (=> d!102403 m!722181))

(declare-fun m!722183 () Bool)

(assert (=> d!102403 m!722183))

(assert (=> d!102403 m!722033))

(declare-fun m!722185 () Bool)

(assert (=> b!777771 m!722185))

(assert (=> b!777577 d!102403))

(declare-fun b!777802 () Bool)

(declare-fun e!432836 () SeekEntryResult!7915)

(assert (=> b!777802 (= e!432836 (MissingVacant!7915 resIntermediateIndex!5))))

(declare-fun b!777803 () Bool)

(declare-fun e!432838 () SeekEntryResult!7915)

(assert (=> b!777803 (= e!432838 Undefined!7915)))

(declare-fun b!777804 () Bool)

(declare-fun c!86263 () Bool)

(declare-fun lt!346522 () (_ BitVec 64))

(assert (=> b!777804 (= c!86263 (= lt!346522 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432837 () SeekEntryResult!7915)

(assert (=> b!777804 (= e!432837 e!432836)))

(declare-fun d!102405 () Bool)

(declare-fun lt!346521 () SeekEntryResult!7915)

(assert (=> d!102405 (and (or ((_ is Undefined!7915) lt!346521) (not ((_ is Found!7915) lt!346521)) (and (bvsge (index!34029 lt!346521) #b00000000000000000000000000000000) (bvslt (index!34029 lt!346521) (size!20779 a!3186)))) (or ((_ is Undefined!7915) lt!346521) ((_ is Found!7915) lt!346521) (not ((_ is MissingVacant!7915) lt!346521)) (not (= (index!34031 lt!346521) resIntermediateIndex!5)) (and (bvsge (index!34031 lt!346521) #b00000000000000000000000000000000) (bvslt (index!34031 lt!346521) (size!20779 a!3186)))) (or ((_ is Undefined!7915) lt!346521) (ite ((_ is Found!7915) lt!346521) (= (select (arr!20359 a!3186) (index!34029 lt!346521)) (select (arr!20359 a!3186) j!159)) (and ((_ is MissingVacant!7915) lt!346521) (= (index!34031 lt!346521) resIntermediateIndex!5) (= (select (arr!20359 a!3186) (index!34031 lt!346521)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102405 (= lt!346521 e!432838)))

(declare-fun c!86264 () Bool)

(assert (=> d!102405 (= c!86264 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102405 (= lt!346522 (select (arr!20359 a!3186) index!1321))))

(assert (=> d!102405 (validMask!0 mask!3328)))

(assert (=> d!102405 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346521)))

(declare-fun b!777805 () Bool)

(assert (=> b!777805 (= e!432837 (Found!7915 index!1321))))

(declare-fun b!777806 () Bool)

(assert (=> b!777806 (= e!432836 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20359 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777807 () Bool)

(assert (=> b!777807 (= e!432838 e!432837)))

(declare-fun c!86262 () Bool)

(assert (=> b!777807 (= c!86262 (= lt!346522 (select (arr!20359 a!3186) j!159)))))

(assert (= (and d!102405 c!86264) b!777803))

(assert (= (and d!102405 (not c!86264)) b!777807))

(assert (= (and b!777807 c!86262) b!777805))

(assert (= (and b!777807 (not c!86262)) b!777804))

(assert (= (and b!777804 c!86263) b!777802))

(assert (= (and b!777804 (not c!86263)) b!777806))

(declare-fun m!722201 () Bool)

(assert (=> d!102405 m!722201))

(declare-fun m!722203 () Bool)

(assert (=> d!102405 m!722203))

(assert (=> d!102405 m!722153))

(assert (=> d!102405 m!722023))

(assert (=> b!777806 m!722155))

(assert (=> b!777806 m!722155))

(assert (=> b!777806 m!721991))

(declare-fun m!722205 () Bool)

(assert (=> b!777806 m!722205))

(assert (=> b!777588 d!102405))

(declare-fun d!102411 () Bool)

(assert (=> d!102411 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67300 d!102411))

(declare-fun d!102419 () Bool)

(assert (=> d!102419 (= (array_inv!16218 a!3186) (bvsge (size!20779 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67300 d!102419))

(declare-fun b!777838 () Bool)

(declare-fun e!432858 () Bool)

(declare-fun lt!346535 () SeekEntryResult!7915)

(assert (=> b!777838 (= e!432858 (bvsge (x!65125 lt!346535) #b01111111111111111111111111111110))))

(declare-fun e!432857 () SeekEntryResult!7915)

(declare-fun b!777839 () Bool)

(assert (=> b!777839 (= e!432857 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20359 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20359 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777840 () Bool)

(assert (=> b!777840 (= e!432857 (Intermediate!7915 false (toIndex!0 (select (arr!20359 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!777841 () Bool)

(assert (=> b!777841 (and (bvsge (index!34030 lt!346535) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346535) (size!20779 a!3186)))))

(declare-fun res!526091 () Bool)

(assert (=> b!777841 (= res!526091 (= (select (arr!20359 a!3186) (index!34030 lt!346535)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432861 () Bool)

(assert (=> b!777841 (=> res!526091 e!432861)))

(declare-fun d!102421 () Bool)

(assert (=> d!102421 e!432858))

(declare-fun c!86277 () Bool)

(assert (=> d!102421 (= c!86277 (and ((_ is Intermediate!7915) lt!346535) (undefined!8727 lt!346535)))))

(declare-fun e!432859 () SeekEntryResult!7915)

(assert (=> d!102421 (= lt!346535 e!432859)))

(declare-fun c!86279 () Bool)

(assert (=> d!102421 (= c!86279 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!346536 () (_ BitVec 64))

(assert (=> d!102421 (= lt!346536 (select (arr!20359 a!3186) (toIndex!0 (select (arr!20359 a!3186) j!159) mask!3328)))))

(assert (=> d!102421 (validMask!0 mask!3328)))

(assert (=> d!102421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20359 a!3186) j!159) mask!3328) (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346535)))

(declare-fun b!777842 () Bool)

(declare-fun e!432860 () Bool)

(assert (=> b!777842 (= e!432858 e!432860)))

(declare-fun res!526090 () Bool)

(assert (=> b!777842 (= res!526090 (and ((_ is Intermediate!7915) lt!346535) (not (undefined!8727 lt!346535)) (bvslt (x!65125 lt!346535) #b01111111111111111111111111111110) (bvsge (x!65125 lt!346535) #b00000000000000000000000000000000) (bvsge (x!65125 lt!346535) #b00000000000000000000000000000000)))))

(assert (=> b!777842 (=> (not res!526090) (not e!432860))))

(declare-fun b!777843 () Bool)

(assert (=> b!777843 (and (bvsge (index!34030 lt!346535) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346535) (size!20779 a!3186)))))

(assert (=> b!777843 (= e!432861 (= (select (arr!20359 a!3186) (index!34030 lt!346535)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777844 () Bool)

(assert (=> b!777844 (and (bvsge (index!34030 lt!346535) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346535) (size!20779 a!3186)))))

(declare-fun res!526092 () Bool)

(assert (=> b!777844 (= res!526092 (= (select (arr!20359 a!3186) (index!34030 lt!346535)) (select (arr!20359 a!3186) j!159)))))

(assert (=> b!777844 (=> res!526092 e!432861)))

(assert (=> b!777844 (= e!432860 e!432861)))

(declare-fun b!777845 () Bool)

(assert (=> b!777845 (= e!432859 (Intermediate!7915 true (toIndex!0 (select (arr!20359 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!777846 () Bool)

(assert (=> b!777846 (= e!432859 e!432857)))

(declare-fun c!86278 () Bool)

(assert (=> b!777846 (= c!86278 (or (= lt!346536 (select (arr!20359 a!3186) j!159)) (= (bvadd lt!346536 lt!346536) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102421 c!86279) b!777845))

(assert (= (and d!102421 (not c!86279)) b!777846))

(assert (= (and b!777846 c!86278) b!777840))

(assert (= (and b!777846 (not c!86278)) b!777839))

(assert (= (and d!102421 c!86277) b!777838))

(assert (= (and d!102421 (not c!86277)) b!777842))

(assert (= (and b!777842 res!526090) b!777844))

(assert (= (and b!777844 (not res!526092)) b!777841))

(assert (= (and b!777841 (not res!526091)) b!777843))

(declare-fun m!722231 () Bool)

(assert (=> b!777843 m!722231))

(assert (=> d!102421 m!722011))

(declare-fun m!722233 () Bool)

(assert (=> d!102421 m!722233))

(assert (=> d!102421 m!722023))

(assert (=> b!777839 m!722011))

(declare-fun m!722235 () Bool)

(assert (=> b!777839 m!722235))

(assert (=> b!777839 m!722235))

(assert (=> b!777839 m!721991))

(declare-fun m!722237 () Bool)

(assert (=> b!777839 m!722237))

(assert (=> b!777841 m!722231))

(assert (=> b!777844 m!722231))

(assert (=> b!777585 d!102421))

(declare-fun d!102423 () Bool)

(declare-fun lt!346542 () (_ BitVec 32))

(declare-fun lt!346541 () (_ BitVec 32))

(assert (=> d!102423 (= lt!346542 (bvmul (bvxor lt!346541 (bvlshr lt!346541 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102423 (= lt!346541 ((_ extract 31 0) (bvand (bvxor (select (arr!20359 a!3186) j!159) (bvlshr (select (arr!20359 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102423 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526093 (let ((h!15381 ((_ extract 31 0) (bvand (bvxor (select (arr!20359 a!3186) j!159) (bvlshr (select (arr!20359 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65130 (bvmul (bvxor h!15381 (bvlshr h!15381 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65130 (bvlshr x!65130 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526093 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526093 #b00000000000000000000000000000000))))))

(assert (=> d!102423 (= (toIndex!0 (select (arr!20359 a!3186) j!159) mask!3328) (bvand (bvxor lt!346542 (bvlshr lt!346542 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!777585 d!102423))

(assert (=> b!777574 d!102405))

(declare-fun b!777847 () Bool)

(declare-fun e!432863 () Bool)

(declare-fun lt!346543 () SeekEntryResult!7915)

(assert (=> b!777847 (= e!432863 (bvsge (x!65125 lt!346543) #b01111111111111111111111111111110))))

(declare-fun e!432862 () SeekEntryResult!7915)

(declare-fun b!777848 () Bool)

(assert (=> b!777848 (= e!432862 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!346432 lt!346437 mask!3328))))

(declare-fun b!777849 () Bool)

(assert (=> b!777849 (= e!432862 (Intermediate!7915 false index!1321 x!1131))))

(declare-fun b!777850 () Bool)

(assert (=> b!777850 (and (bvsge (index!34030 lt!346543) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346543) (size!20779 lt!346437)))))

(declare-fun res!526095 () Bool)

(assert (=> b!777850 (= res!526095 (= (select (arr!20359 lt!346437) (index!34030 lt!346543)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432866 () Bool)

(assert (=> b!777850 (=> res!526095 e!432866)))

(declare-fun d!102425 () Bool)

(assert (=> d!102425 e!432863))

(declare-fun c!86280 () Bool)

(assert (=> d!102425 (= c!86280 (and ((_ is Intermediate!7915) lt!346543) (undefined!8727 lt!346543)))))

(declare-fun e!432864 () SeekEntryResult!7915)

(assert (=> d!102425 (= lt!346543 e!432864)))

(declare-fun c!86282 () Bool)

(assert (=> d!102425 (= c!86282 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!346544 () (_ BitVec 64))

(assert (=> d!102425 (= lt!346544 (select (arr!20359 lt!346437) index!1321))))

(assert (=> d!102425 (validMask!0 mask!3328)))

(assert (=> d!102425 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346432 lt!346437 mask!3328) lt!346543)))

(declare-fun b!777851 () Bool)

(declare-fun e!432865 () Bool)

(assert (=> b!777851 (= e!432863 e!432865)))

(declare-fun res!526094 () Bool)

(assert (=> b!777851 (= res!526094 (and ((_ is Intermediate!7915) lt!346543) (not (undefined!8727 lt!346543)) (bvslt (x!65125 lt!346543) #b01111111111111111111111111111110) (bvsge (x!65125 lt!346543) #b00000000000000000000000000000000) (bvsge (x!65125 lt!346543) x!1131)))))

(assert (=> b!777851 (=> (not res!526094) (not e!432865))))

(declare-fun b!777852 () Bool)

(assert (=> b!777852 (and (bvsge (index!34030 lt!346543) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346543) (size!20779 lt!346437)))))

(assert (=> b!777852 (= e!432866 (= (select (arr!20359 lt!346437) (index!34030 lt!346543)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777853 () Bool)

(assert (=> b!777853 (and (bvsge (index!34030 lt!346543) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346543) (size!20779 lt!346437)))))

(declare-fun res!526096 () Bool)

(assert (=> b!777853 (= res!526096 (= (select (arr!20359 lt!346437) (index!34030 lt!346543)) lt!346432))))

(assert (=> b!777853 (=> res!526096 e!432866)))

(assert (=> b!777853 (= e!432865 e!432866)))

(declare-fun b!777854 () Bool)

(assert (=> b!777854 (= e!432864 (Intermediate!7915 true index!1321 x!1131))))

(declare-fun b!777855 () Bool)

(assert (=> b!777855 (= e!432864 e!432862)))

(declare-fun c!86281 () Bool)

(assert (=> b!777855 (= c!86281 (or (= lt!346544 lt!346432) (= (bvadd lt!346544 lt!346544) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102425 c!86282) b!777854))

(assert (= (and d!102425 (not c!86282)) b!777855))

(assert (= (and b!777855 c!86281) b!777849))

(assert (= (and b!777855 (not c!86281)) b!777848))

(assert (= (and d!102425 c!86280) b!777847))

(assert (= (and d!102425 (not c!86280)) b!777851))

(assert (= (and b!777851 res!526094) b!777853))

(assert (= (and b!777853 (not res!526096)) b!777850))

(assert (= (and b!777850 (not res!526095)) b!777852))

(declare-fun m!722239 () Bool)

(assert (=> b!777852 m!722239))

(declare-fun m!722241 () Bool)

(assert (=> d!102425 m!722241))

(assert (=> d!102425 m!722023))

(assert (=> b!777848 m!722155))

(assert (=> b!777848 m!722155))

(declare-fun m!722243 () Bool)

(assert (=> b!777848 m!722243))

(assert (=> b!777850 m!722239))

(assert (=> b!777853 m!722239))

(assert (=> b!777575 d!102425))

(declare-fun b!777858 () Bool)

(declare-fun e!432868 () Bool)

(declare-fun lt!346549 () SeekEntryResult!7915)

(assert (=> b!777858 (= e!432868 (bvsge (x!65125 lt!346549) #b01111111111111111111111111111110))))

(declare-fun b!777859 () Bool)

(declare-fun e!432867 () SeekEntryResult!7915)

(assert (=> b!777859 (= e!432867 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!346432 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!346432 lt!346437 mask!3328))))

(declare-fun b!777860 () Bool)

(assert (=> b!777860 (= e!432867 (Intermediate!7915 false (toIndex!0 lt!346432 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!777861 () Bool)

(assert (=> b!777861 (and (bvsge (index!34030 lt!346549) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346549) (size!20779 lt!346437)))))

(declare-fun res!526098 () Bool)

(assert (=> b!777861 (= res!526098 (= (select (arr!20359 lt!346437) (index!34030 lt!346549)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432871 () Bool)

(assert (=> b!777861 (=> res!526098 e!432871)))

(declare-fun d!102427 () Bool)

(assert (=> d!102427 e!432868))

(declare-fun c!86283 () Bool)

(assert (=> d!102427 (= c!86283 (and ((_ is Intermediate!7915) lt!346549) (undefined!8727 lt!346549)))))

(declare-fun e!432869 () SeekEntryResult!7915)

(assert (=> d!102427 (= lt!346549 e!432869)))

(declare-fun c!86285 () Bool)

(assert (=> d!102427 (= c!86285 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!346550 () (_ BitVec 64))

(assert (=> d!102427 (= lt!346550 (select (arr!20359 lt!346437) (toIndex!0 lt!346432 mask!3328)))))

(assert (=> d!102427 (validMask!0 mask!3328)))

(assert (=> d!102427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346432 mask!3328) lt!346432 lt!346437 mask!3328) lt!346549)))

(declare-fun b!777862 () Bool)

(declare-fun e!432870 () Bool)

(assert (=> b!777862 (= e!432868 e!432870)))

(declare-fun res!526097 () Bool)

(assert (=> b!777862 (= res!526097 (and ((_ is Intermediate!7915) lt!346549) (not (undefined!8727 lt!346549)) (bvslt (x!65125 lt!346549) #b01111111111111111111111111111110) (bvsge (x!65125 lt!346549) #b00000000000000000000000000000000) (bvsge (x!65125 lt!346549) #b00000000000000000000000000000000)))))

(assert (=> b!777862 (=> (not res!526097) (not e!432870))))

(declare-fun b!777863 () Bool)

(assert (=> b!777863 (and (bvsge (index!34030 lt!346549) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346549) (size!20779 lt!346437)))))

(assert (=> b!777863 (= e!432871 (= (select (arr!20359 lt!346437) (index!34030 lt!346549)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777864 () Bool)

(assert (=> b!777864 (and (bvsge (index!34030 lt!346549) #b00000000000000000000000000000000) (bvslt (index!34030 lt!346549) (size!20779 lt!346437)))))

(declare-fun res!526099 () Bool)

(assert (=> b!777864 (= res!526099 (= (select (arr!20359 lt!346437) (index!34030 lt!346549)) lt!346432))))

(assert (=> b!777864 (=> res!526099 e!432871)))

(assert (=> b!777864 (= e!432870 e!432871)))

(declare-fun b!777865 () Bool)

(assert (=> b!777865 (= e!432869 (Intermediate!7915 true (toIndex!0 lt!346432 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!777866 () Bool)

(assert (=> b!777866 (= e!432869 e!432867)))

(declare-fun c!86284 () Bool)

(assert (=> b!777866 (= c!86284 (or (= lt!346550 lt!346432) (= (bvadd lt!346550 lt!346550) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102427 c!86285) b!777865))

(assert (= (and d!102427 (not c!86285)) b!777866))

(assert (= (and b!777866 c!86284) b!777860))

(assert (= (and b!777866 (not c!86284)) b!777859))

(assert (= (and d!102427 c!86283) b!777858))

(assert (= (and d!102427 (not c!86283)) b!777862))

(assert (= (and b!777862 res!526097) b!777864))

(assert (= (and b!777864 (not res!526099)) b!777861))

(assert (= (and b!777861 (not res!526098)) b!777863))

(declare-fun m!722245 () Bool)

(assert (=> b!777863 m!722245))

(assert (=> d!102427 m!722033))

(declare-fun m!722247 () Bool)

(assert (=> d!102427 m!722247))

(assert (=> d!102427 m!722023))

(assert (=> b!777859 m!722033))

(declare-fun m!722249 () Bool)

(assert (=> b!777859 m!722249))

(assert (=> b!777859 m!722249))

(declare-fun m!722251 () Bool)

(assert (=> b!777859 m!722251))

(assert (=> b!777861 m!722245))

(assert (=> b!777864 m!722245))

(assert (=> b!777575 d!102427))

(declare-fun d!102429 () Bool)

(declare-fun lt!346552 () (_ BitVec 32))

(declare-fun lt!346551 () (_ BitVec 32))

(assert (=> d!102429 (= lt!346552 (bvmul (bvxor lt!346551 (bvlshr lt!346551 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102429 (= lt!346551 ((_ extract 31 0) (bvand (bvxor lt!346432 (bvlshr lt!346432 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102429 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526093 (let ((h!15381 ((_ extract 31 0) (bvand (bvxor lt!346432 (bvlshr lt!346432 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65130 (bvmul (bvxor h!15381 (bvlshr h!15381 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65130 (bvlshr x!65130 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526093 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526093 #b00000000000000000000000000000000))))))

(assert (=> d!102429 (= (toIndex!0 lt!346432 mask!3328) (bvand (bvxor lt!346552 (bvlshr lt!346552 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!777575 d!102429))

(declare-fun d!102431 () Bool)

(assert (=> d!102431 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!777587 d!102431))

(declare-fun b!777927 () Bool)

(declare-fun e!432909 () Bool)

(declare-fun call!35202 () Bool)

(assert (=> b!777927 (= e!432909 call!35202)))

(declare-fun b!777928 () Bool)

(declare-fun e!432910 () Bool)

(assert (=> b!777928 (= e!432910 call!35202)))

(declare-fun bm!35199 () Bool)

(assert (=> bm!35199 (= call!35202 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!777929 () Bool)

(declare-fun e!432908 () Bool)

(assert (=> b!777929 (= e!432908 e!432910)))

(declare-fun c!86306 () Bool)

(assert (=> b!777929 (= c!86306 (validKeyInArray!0 (select (arr!20359 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102433 () Bool)

(declare-fun res!526124 () Bool)

(assert (=> d!102433 (=> res!526124 e!432908)))

(assert (=> d!102433 (= res!526124 (bvsge #b00000000000000000000000000000000 (size!20779 a!3186)))))

(assert (=> d!102433 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!432908)))

(declare-fun b!777930 () Bool)

(assert (=> b!777930 (= e!432910 e!432909)))

(declare-fun lt!346567 () (_ BitVec 64))

(assert (=> b!777930 (= lt!346567 (select (arr!20359 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!346569 () Unit!26803)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42535 (_ BitVec 64) (_ BitVec 32)) Unit!26803)

(assert (=> b!777930 (= lt!346569 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346567 #b00000000000000000000000000000000))))

(assert (=> b!777930 (arrayContainsKey!0 a!3186 lt!346567 #b00000000000000000000000000000000)))

(declare-fun lt!346568 () Unit!26803)

(assert (=> b!777930 (= lt!346568 lt!346569)))

(declare-fun res!526123 () Bool)

(assert (=> b!777930 (= res!526123 (= (seekEntryOrOpen!0 (select (arr!20359 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7915 #b00000000000000000000000000000000)))))

(assert (=> b!777930 (=> (not res!526123) (not e!432909))))

(assert (= (and d!102433 (not res!526124)) b!777929))

(assert (= (and b!777929 c!86306) b!777930))

(assert (= (and b!777929 (not c!86306)) b!777928))

(assert (= (and b!777930 res!526123) b!777927))

(assert (= (or b!777927 b!777928) bm!35199))

(declare-fun m!722269 () Bool)

(assert (=> bm!35199 m!722269))

(assert (=> b!777929 m!722159))

(assert (=> b!777929 m!722159))

(declare-fun m!722271 () Bool)

(assert (=> b!777929 m!722271))

(assert (=> b!777930 m!722159))

(declare-fun m!722273 () Bool)

(assert (=> b!777930 m!722273))

(declare-fun m!722275 () Bool)

(assert (=> b!777930 m!722275))

(assert (=> b!777930 m!722159))

(declare-fun m!722277 () Bool)

(assert (=> b!777930 m!722277))

(assert (=> b!777576 d!102433))

(declare-fun b!777940 () Bool)

(declare-fun e!432917 () Bool)

(declare-fun call!35203 () Bool)

(assert (=> b!777940 (= e!432917 call!35203)))

(declare-fun b!777941 () Bool)

(declare-fun e!432918 () Bool)

(assert (=> b!777941 (= e!432918 call!35203)))

(declare-fun bm!35200 () Bool)

(assert (=> bm!35200 (= call!35203 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!777942 () Bool)

(declare-fun e!432916 () Bool)

(assert (=> b!777942 (= e!432916 e!432918)))

(declare-fun c!86310 () Bool)

(assert (=> b!777942 (= c!86310 (validKeyInArray!0 (select (arr!20359 a!3186) j!159)))))

(declare-fun d!102439 () Bool)

(declare-fun res!526129 () Bool)

(assert (=> d!102439 (=> res!526129 e!432916)))

(assert (=> d!102439 (= res!526129 (bvsge j!159 (size!20779 a!3186)))))

(assert (=> d!102439 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!432916)))

(declare-fun b!777943 () Bool)

(assert (=> b!777943 (= e!432918 e!432917)))

(declare-fun lt!346572 () (_ BitVec 64))

(assert (=> b!777943 (= lt!346572 (select (arr!20359 a!3186) j!159))))

(declare-fun lt!346574 () Unit!26803)

(assert (=> b!777943 (= lt!346574 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346572 j!159))))

(assert (=> b!777943 (arrayContainsKey!0 a!3186 lt!346572 #b00000000000000000000000000000000)))

(declare-fun lt!346573 () Unit!26803)

(assert (=> b!777943 (= lt!346573 lt!346574)))

(declare-fun res!526128 () Bool)

(assert (=> b!777943 (= res!526128 (= (seekEntryOrOpen!0 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) (Found!7915 j!159)))))

(assert (=> b!777943 (=> (not res!526128) (not e!432917))))

(assert (= (and d!102439 (not res!526129)) b!777942))

(assert (= (and b!777942 c!86310) b!777943))

(assert (= (and b!777942 (not c!86310)) b!777941))

(assert (= (and b!777943 res!526128) b!777940))

(assert (= (or b!777940 b!777941) bm!35200))

(declare-fun m!722279 () Bool)

(assert (=> bm!35200 m!722279))

(assert (=> b!777942 m!721991))

(assert (=> b!777942 m!721991))

(assert (=> b!777942 m!721993))

(assert (=> b!777943 m!721991))

(declare-fun m!722281 () Bool)

(assert (=> b!777943 m!722281))

(declare-fun m!722283 () Bool)

(assert (=> b!777943 m!722283))

(assert (=> b!777943 m!721991))

(assert (=> b!777943 m!721997))

(assert (=> b!777582 d!102439))

(declare-fun d!102441 () Bool)

(assert (=> d!102441 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!346585 () Unit!26803)

(declare-fun choose!38 (array!42535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26803)

(assert (=> d!102441 (= lt!346585 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102441 (validMask!0 mask!3328)))

(assert (=> d!102441 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!346585)))

(declare-fun bs!21692 () Bool)

(assert (= bs!21692 d!102441))

(assert (=> bs!21692 m!722007))

(declare-fun m!722293 () Bool)

(assert (=> bs!21692 m!722293))

(assert (=> bs!21692 m!722023))

(assert (=> b!777582 d!102441))

(declare-fun b!777972 () Bool)

(declare-fun e!432938 () Bool)

(declare-fun e!432937 () Bool)

(assert (=> b!777972 (= e!432938 e!432937)))

(declare-fun res!526143 () Bool)

(assert (=> b!777972 (=> (not res!526143) (not e!432937))))

(declare-fun e!432939 () Bool)

(assert (=> b!777972 (= res!526143 (not e!432939))))

(declare-fun res!526144 () Bool)

(assert (=> b!777972 (=> (not res!526144) (not e!432939))))

(assert (=> b!777972 (= res!526144 (validKeyInArray!0 (select (arr!20359 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102447 () Bool)

(declare-fun res!526145 () Bool)

(assert (=> d!102447 (=> res!526145 e!432938)))

(assert (=> d!102447 (= res!526145 (bvsge #b00000000000000000000000000000000 (size!20779 a!3186)))))

(assert (=> d!102447 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14265) e!432938)))

(declare-fun b!777973 () Bool)

(declare-fun e!432940 () Bool)

(assert (=> b!777973 (= e!432937 e!432940)))

(declare-fun c!86319 () Bool)

(assert (=> b!777973 (= c!86319 (validKeyInArray!0 (select (arr!20359 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!777974 () Bool)

(declare-fun contains!4075 (List!14268 (_ BitVec 64)) Bool)

(assert (=> b!777974 (= e!432939 (contains!4075 Nil!14265 (select (arr!20359 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!777975 () Bool)

(declare-fun call!35206 () Bool)

(assert (=> b!777975 (= e!432940 call!35206)))

(declare-fun bm!35203 () Bool)

(assert (=> bm!35203 (= call!35206 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86319 (Cons!14264 (select (arr!20359 a!3186) #b00000000000000000000000000000000) Nil!14265) Nil!14265)))))

(declare-fun b!777976 () Bool)

(assert (=> b!777976 (= e!432940 call!35206)))

(assert (= (and d!102447 (not res!526145)) b!777972))

(assert (= (and b!777972 res!526144) b!777974))

(assert (= (and b!777972 res!526143) b!777973))

(assert (= (and b!777973 c!86319) b!777975))

(assert (= (and b!777973 (not c!86319)) b!777976))

(assert (= (or b!777975 b!777976) bm!35203))

(assert (=> b!777972 m!722159))

(assert (=> b!777972 m!722159))

(assert (=> b!777972 m!722271))

(assert (=> b!777973 m!722159))

(assert (=> b!777973 m!722159))

(assert (=> b!777973 m!722271))

(assert (=> b!777974 m!722159))

(assert (=> b!777974 m!722159))

(declare-fun m!722311 () Bool)

(assert (=> b!777974 m!722311))

(assert (=> bm!35203 m!722159))

(declare-fun m!722313 () Bool)

(assert (=> bm!35203 m!722313))

(assert (=> b!777583 d!102447))

(declare-fun b!777977 () Bool)

(declare-fun e!432941 () SeekEntryResult!7915)

(assert (=> b!777977 (= e!432941 (MissingVacant!7915 resIntermediateIndex!5))))

(declare-fun b!777978 () Bool)

(declare-fun e!432943 () SeekEntryResult!7915)

(assert (=> b!777978 (= e!432943 Undefined!7915)))

(declare-fun b!777979 () Bool)

(declare-fun c!86321 () Bool)

(declare-fun lt!346597 () (_ BitVec 64))

(assert (=> b!777979 (= c!86321 (= lt!346597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432942 () SeekEntryResult!7915)

(assert (=> b!777979 (= e!432942 e!432941)))

(declare-fun d!102457 () Bool)

(declare-fun lt!346596 () SeekEntryResult!7915)

(assert (=> d!102457 (and (or ((_ is Undefined!7915) lt!346596) (not ((_ is Found!7915) lt!346596)) (and (bvsge (index!34029 lt!346596) #b00000000000000000000000000000000) (bvslt (index!34029 lt!346596) (size!20779 a!3186)))) (or ((_ is Undefined!7915) lt!346596) ((_ is Found!7915) lt!346596) (not ((_ is MissingVacant!7915) lt!346596)) (not (= (index!34031 lt!346596) resIntermediateIndex!5)) (and (bvsge (index!34031 lt!346596) #b00000000000000000000000000000000) (bvslt (index!34031 lt!346596) (size!20779 a!3186)))) (or ((_ is Undefined!7915) lt!346596) (ite ((_ is Found!7915) lt!346596) (= (select (arr!20359 a!3186) (index!34029 lt!346596)) (select (arr!20359 a!3186) j!159)) (and ((_ is MissingVacant!7915) lt!346596) (= (index!34031 lt!346596) resIntermediateIndex!5) (= (select (arr!20359 a!3186) (index!34031 lt!346596)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102457 (= lt!346596 e!432943)))

(declare-fun c!86322 () Bool)

(assert (=> d!102457 (= c!86322 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102457 (= lt!346597 (select (arr!20359 a!3186) resIntermediateIndex!5))))

(assert (=> d!102457 (validMask!0 mask!3328)))

(assert (=> d!102457 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20359 a!3186) j!159) a!3186 mask!3328) lt!346596)))

(declare-fun b!777980 () Bool)

(assert (=> b!777980 (= e!432942 (Found!7915 resIntermediateIndex!5))))

(declare-fun b!777981 () Bool)

(assert (=> b!777981 (= e!432941 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20359 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777982 () Bool)

(assert (=> b!777982 (= e!432943 e!432942)))

(declare-fun c!86320 () Bool)

(assert (=> b!777982 (= c!86320 (= lt!346597 (select (arr!20359 a!3186) j!159)))))

(assert (= (and d!102457 c!86322) b!777978))

(assert (= (and d!102457 (not c!86322)) b!777982))

(assert (= (and b!777982 c!86320) b!777980))

(assert (= (and b!777982 (not c!86320)) b!777979))

(assert (= (and b!777979 c!86321) b!777977))

(assert (= (and b!777979 (not c!86321)) b!777981))

(declare-fun m!722315 () Bool)

(assert (=> d!102457 m!722315))

(declare-fun m!722317 () Bool)

(assert (=> d!102457 m!722317))

(assert (=> d!102457 m!722001))

(assert (=> d!102457 m!722023))

(declare-fun m!722319 () Bool)

(assert (=> b!777981 m!722319))

(assert (=> b!777981 m!722319))

(assert (=> b!777981 m!721991))

(declare-fun m!722321 () Bool)

(assert (=> b!777981 m!722321))

(assert (=> b!777572 d!102457))

(declare-fun d!102459 () Bool)

(assert (=> d!102459 (= (validKeyInArray!0 (select (arr!20359 a!3186) j!159)) (and (not (= (select (arr!20359 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20359 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!777584 d!102459))

(check-sat (not b!777942) (not bm!35203) (not b!777974) (not b!777943) (not d!102403) (not d!102457) (not b!777973) (not b!777848) (not d!102441) (not d!102401) (not b!777746) (not d!102425) (not b!777972) (not d!102421) (not d!102393) (not d!102395) (not b!777930) (not d!102427) (not b!777806) (not b!777929) (not b!777766) (not bm!35200) (not b!777721) (not b!777759) (not b!777839) (not b!777859) (not b!777760) (not d!102405) (not bm!35199) (not b!777981))
(check-sat)
