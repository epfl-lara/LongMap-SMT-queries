; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47804 () Bool)

(assert start!47804)

(declare-fun b!526833 () Bool)

(declare-fun e!307053 () Bool)

(declare-fun e!307052 () Bool)

(assert (=> b!526833 (= e!307053 (not e!307052))))

(declare-fun res!323449 () Bool)

(assert (=> b!526833 (=> res!323449 e!307052)))

(declare-datatypes ((array!33442 0))(
  ( (array!33443 (arr!16072 (Array (_ BitVec 32) (_ BitVec 64))) (size!16436 (_ BitVec 32))) )
))
(declare-fun lt!242454 () array!33442)

(declare-fun lt!242453 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4495 0))(
  ( (MissingZero!4495 (index!20192 (_ BitVec 32))) (Found!4495 (index!20193 (_ BitVec 32))) (Intermediate!4495 (undefined!5307 Bool) (index!20194 (_ BitVec 32)) (x!49305 (_ BitVec 32))) (Undefined!4495) (MissingVacant!4495 (index!20195 (_ BitVec 32))) )
))
(declare-fun lt!242451 () SeekEntryResult!4495)

(declare-fun lt!242455 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33442 (_ BitVec 32)) SeekEntryResult!4495)

(assert (=> b!526833 (= res!323449 (= lt!242451 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242455 lt!242453 lt!242454 mask!3524)))))

(declare-fun lt!242446 () (_ BitVec 32))

(declare-fun a!3235 () array!33442)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526833 (= lt!242451 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242446 (select (arr!16072 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526833 (= lt!242455 (toIndex!0 lt!242453 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526833 (= lt!242453 (select (store (arr!16072 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526833 (= lt!242446 (toIndex!0 (select (arr!16072 a!3235) j!176) mask!3524))))

(assert (=> b!526833 (= lt!242454 (array!33443 (store (arr!16072 a!3235) i!1204 k0!2280) (size!16436 a!3235)))))

(declare-fun e!307047 () Bool)

(assert (=> b!526833 e!307047))

(declare-fun res!323451 () Bool)

(assert (=> b!526833 (=> (not res!323451) (not e!307047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33442 (_ BitVec 32)) Bool)

(assert (=> b!526833 (= res!323451 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16591 0))(
  ( (Unit!16592) )
))
(declare-fun lt!242449 () Unit!16591)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16591)

(assert (=> b!526833 (= lt!242449 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526834 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33442 (_ BitVec 32)) SeekEntryResult!4495)

(assert (=> b!526834 (= e!307047 (= (seekEntryOrOpen!0 (select (arr!16072 a!3235) j!176) a!3235 mask!3524) (Found!4495 j!176)))))

(declare-fun b!526835 () Bool)

(declare-fun res!323447 () Bool)

(assert (=> b!526835 (=> res!323447 e!307052)))

(get-info :version)

(assert (=> b!526835 (= res!323447 (or (undefined!5307 lt!242451) (not ((_ is Intermediate!4495) lt!242451))))))

(declare-fun b!526836 () Bool)

(declare-fun e!307050 () Bool)

(assert (=> b!526836 (= e!307050 e!307053)))

(declare-fun res!323444 () Bool)

(assert (=> b!526836 (=> (not res!323444) (not e!307053))))

(declare-fun lt!242450 () SeekEntryResult!4495)

(assert (=> b!526836 (= res!323444 (or (= lt!242450 (MissingZero!4495 i!1204)) (= lt!242450 (MissingVacant!4495 i!1204))))))

(assert (=> b!526836 (= lt!242450 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526838 () Bool)

(assert (=> b!526838 (= e!307052 (or (bvsgt (x!49305 lt!242451) #b01111111111111111111111111111110) (and (bvsge lt!242446 #b00000000000000000000000000000000) (bvslt lt!242446 (size!16436 a!3235)))))))

(assert (=> b!526838 (= (index!20194 lt!242451) i!1204)))

(declare-fun lt!242452 () Unit!16591)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33442 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16591)

(assert (=> b!526838 (= lt!242452 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242446 #b00000000000000000000000000000000 (index!20194 lt!242451) (x!49305 lt!242451) mask!3524))))

(assert (=> b!526838 (and (or (= (select (arr!16072 a!3235) (index!20194 lt!242451)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16072 a!3235) (index!20194 lt!242451)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16072 a!3235) (index!20194 lt!242451)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16072 a!3235) (index!20194 lt!242451)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242448 () Unit!16591)

(declare-fun e!307051 () Unit!16591)

(assert (=> b!526838 (= lt!242448 e!307051)))

(declare-fun c!62000 () Bool)

(assert (=> b!526838 (= c!62000 (= (select (arr!16072 a!3235) (index!20194 lt!242451)) (select (arr!16072 a!3235) j!176)))))

(assert (=> b!526838 (and (bvslt (x!49305 lt!242451) #b01111111111111111111111111111110) (or (= (select (arr!16072 a!3235) (index!20194 lt!242451)) (select (arr!16072 a!3235) j!176)) (= (select (arr!16072 a!3235) (index!20194 lt!242451)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16072 a!3235) (index!20194 lt!242451)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526839 () Bool)

(declare-fun e!307048 () Bool)

(assert (=> b!526839 (= e!307048 false)))

(declare-fun b!526840 () Bool)

(declare-fun res!323446 () Bool)

(assert (=> b!526840 (=> (not res!323446) (not e!307050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526840 (= res!323446 (validKeyInArray!0 (select (arr!16072 a!3235) j!176)))))

(declare-fun b!526841 () Bool)

(declare-fun res!323452 () Bool)

(assert (=> b!526841 (=> (not res!323452) (not e!307053))))

(declare-datatypes ((List!10137 0))(
  ( (Nil!10134) (Cons!10133 (h!11064 (_ BitVec 64)) (t!16357 List!10137)) )
))
(declare-fun arrayNoDuplicates!0 (array!33442 (_ BitVec 32) List!10137) Bool)

(assert (=> b!526841 (= res!323452 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10134))))

(declare-fun b!526842 () Bool)

(declare-fun Unit!16593 () Unit!16591)

(assert (=> b!526842 (= e!307051 Unit!16593)))

(declare-fun lt!242447 () Unit!16591)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33442 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16591)

(assert (=> b!526842 (= lt!242447 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242446 #b00000000000000000000000000000000 (index!20194 lt!242451) (x!49305 lt!242451) mask!3524))))

(declare-fun res!323445 () Bool)

(assert (=> b!526842 (= res!323445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242446 lt!242453 lt!242454 mask!3524) (Intermediate!4495 false (index!20194 lt!242451) (x!49305 lt!242451))))))

(assert (=> b!526842 (=> (not res!323445) (not e!307048))))

(assert (=> b!526842 e!307048))

(declare-fun b!526843 () Bool)

(declare-fun res!323454 () Bool)

(assert (=> b!526843 (=> (not res!323454) (not e!307053))))

(assert (=> b!526843 (= res!323454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526844 () Bool)

(declare-fun Unit!16594 () Unit!16591)

(assert (=> b!526844 (= e!307051 Unit!16594)))

(declare-fun b!526845 () Bool)

(declare-fun res!323453 () Bool)

(assert (=> b!526845 (=> (not res!323453) (not e!307050))))

(assert (=> b!526845 (= res!323453 (validKeyInArray!0 k0!2280))))

(declare-fun b!526846 () Bool)

(declare-fun res!323455 () Bool)

(assert (=> b!526846 (=> (not res!323455) (not e!307050))))

(declare-fun arrayContainsKey!0 (array!33442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526846 (= res!323455 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526837 () Bool)

(declare-fun res!323448 () Bool)

(assert (=> b!526837 (=> (not res!323448) (not e!307050))))

(assert (=> b!526837 (= res!323448 (and (= (size!16436 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16436 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16436 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!323450 () Bool)

(assert (=> start!47804 (=> (not res!323450) (not e!307050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47804 (= res!323450 (validMask!0 mask!3524))))

(assert (=> start!47804 e!307050))

(assert (=> start!47804 true))

(declare-fun array_inv!11931 (array!33442) Bool)

(assert (=> start!47804 (array_inv!11931 a!3235)))

(assert (= (and start!47804 res!323450) b!526837))

(assert (= (and b!526837 res!323448) b!526840))

(assert (= (and b!526840 res!323446) b!526845))

(assert (= (and b!526845 res!323453) b!526846))

(assert (= (and b!526846 res!323455) b!526836))

(assert (= (and b!526836 res!323444) b!526843))

(assert (= (and b!526843 res!323454) b!526841))

(assert (= (and b!526841 res!323452) b!526833))

(assert (= (and b!526833 res!323451) b!526834))

(assert (= (and b!526833 (not res!323449)) b!526835))

(assert (= (and b!526835 (not res!323447)) b!526838))

(assert (= (and b!526838 c!62000) b!526842))

(assert (= (and b!526838 (not c!62000)) b!526844))

(assert (= (and b!526842 res!323445) b!526839))

(declare-fun m!507805 () Bool)

(assert (=> b!526845 m!507805))

(declare-fun m!507807 () Bool)

(assert (=> b!526836 m!507807))

(declare-fun m!507809 () Bool)

(assert (=> b!526843 m!507809))

(declare-fun m!507811 () Bool)

(assert (=> b!526834 m!507811))

(assert (=> b!526834 m!507811))

(declare-fun m!507813 () Bool)

(assert (=> b!526834 m!507813))

(declare-fun m!507815 () Bool)

(assert (=> b!526842 m!507815))

(declare-fun m!507817 () Bool)

(assert (=> b!526842 m!507817))

(assert (=> b!526840 m!507811))

(assert (=> b!526840 m!507811))

(declare-fun m!507819 () Bool)

(assert (=> b!526840 m!507819))

(declare-fun m!507821 () Bool)

(assert (=> b!526846 m!507821))

(declare-fun m!507823 () Bool)

(assert (=> b!526838 m!507823))

(declare-fun m!507825 () Bool)

(assert (=> b!526838 m!507825))

(assert (=> b!526838 m!507811))

(declare-fun m!507827 () Bool)

(assert (=> start!47804 m!507827))

(declare-fun m!507829 () Bool)

(assert (=> start!47804 m!507829))

(declare-fun m!507831 () Bool)

(assert (=> b!526841 m!507831))

(declare-fun m!507833 () Bool)

(assert (=> b!526833 m!507833))

(declare-fun m!507835 () Bool)

(assert (=> b!526833 m!507835))

(declare-fun m!507837 () Bool)

(assert (=> b!526833 m!507837))

(declare-fun m!507839 () Bool)

(assert (=> b!526833 m!507839))

(assert (=> b!526833 m!507811))

(declare-fun m!507841 () Bool)

(assert (=> b!526833 m!507841))

(declare-fun m!507843 () Bool)

(assert (=> b!526833 m!507843))

(assert (=> b!526833 m!507811))

(declare-fun m!507845 () Bool)

(assert (=> b!526833 m!507845))

(assert (=> b!526833 m!507811))

(declare-fun m!507847 () Bool)

(assert (=> b!526833 m!507847))

(check-sat (not b!526840) (not b!526841) (not b!526834) (not b!526842) (not b!526838) (not start!47804) (not b!526833) (not b!526836) (not b!526845) (not b!526843) (not b!526846))
(check-sat)
(get-model)

(declare-fun b!526943 () Bool)

(declare-fun e!307103 () SeekEntryResult!4495)

(declare-fun e!307102 () SeekEntryResult!4495)

(assert (=> b!526943 (= e!307103 e!307102)))

(declare-fun lt!242524 () (_ BitVec 64))

(declare-fun lt!242523 () SeekEntryResult!4495)

(assert (=> b!526943 (= lt!242524 (select (arr!16072 a!3235) (index!20194 lt!242523)))))

(declare-fun c!62013 () Bool)

(assert (=> b!526943 (= c!62013 (= lt!242524 k0!2280))))

(declare-fun b!526945 () Bool)

(declare-fun c!62014 () Bool)

(assert (=> b!526945 (= c!62014 (= lt!242524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307104 () SeekEntryResult!4495)

(assert (=> b!526945 (= e!307102 e!307104)))

(declare-fun b!526946 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33442 (_ BitVec 32)) SeekEntryResult!4495)

(assert (=> b!526946 (= e!307104 (seekKeyOrZeroReturnVacant!0 (x!49305 lt!242523) (index!20194 lt!242523) (index!20194 lt!242523) k0!2280 a!3235 mask!3524))))

(declare-fun b!526947 () Bool)

(assert (=> b!526947 (= e!307103 Undefined!4495)))

(declare-fun b!526948 () Bool)

(assert (=> b!526948 (= e!307104 (MissingZero!4495 (index!20194 lt!242523)))))

(declare-fun d!80805 () Bool)

(declare-fun lt!242522 () SeekEntryResult!4495)

(assert (=> d!80805 (and (or ((_ is Undefined!4495) lt!242522) (not ((_ is Found!4495) lt!242522)) (and (bvsge (index!20193 lt!242522) #b00000000000000000000000000000000) (bvslt (index!20193 lt!242522) (size!16436 a!3235)))) (or ((_ is Undefined!4495) lt!242522) ((_ is Found!4495) lt!242522) (not ((_ is MissingZero!4495) lt!242522)) (and (bvsge (index!20192 lt!242522) #b00000000000000000000000000000000) (bvslt (index!20192 lt!242522) (size!16436 a!3235)))) (or ((_ is Undefined!4495) lt!242522) ((_ is Found!4495) lt!242522) ((_ is MissingZero!4495) lt!242522) (not ((_ is MissingVacant!4495) lt!242522)) (and (bvsge (index!20195 lt!242522) #b00000000000000000000000000000000) (bvslt (index!20195 lt!242522) (size!16436 a!3235)))) (or ((_ is Undefined!4495) lt!242522) (ite ((_ is Found!4495) lt!242522) (= (select (arr!16072 a!3235) (index!20193 lt!242522)) k0!2280) (ite ((_ is MissingZero!4495) lt!242522) (= (select (arr!16072 a!3235) (index!20192 lt!242522)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4495) lt!242522) (= (select (arr!16072 a!3235) (index!20195 lt!242522)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80805 (= lt!242522 e!307103)))

(declare-fun c!62015 () Bool)

(assert (=> d!80805 (= c!62015 (and ((_ is Intermediate!4495) lt!242523) (undefined!5307 lt!242523)))))

(assert (=> d!80805 (= lt!242523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80805 (validMask!0 mask!3524)))

(assert (=> d!80805 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!242522)))

(declare-fun b!526944 () Bool)

(assert (=> b!526944 (= e!307102 (Found!4495 (index!20194 lt!242523)))))

(assert (= (and d!80805 c!62015) b!526947))

(assert (= (and d!80805 (not c!62015)) b!526943))

(assert (= (and b!526943 c!62013) b!526944))

(assert (= (and b!526943 (not c!62013)) b!526945))

(assert (= (and b!526945 c!62014) b!526948))

(assert (= (and b!526945 (not c!62014)) b!526946))

(declare-fun m!507937 () Bool)

(assert (=> b!526943 m!507937))

(declare-fun m!507939 () Bool)

(assert (=> b!526946 m!507939))

(declare-fun m!507941 () Bool)

(assert (=> d!80805 m!507941))

(declare-fun m!507943 () Bool)

(assert (=> d!80805 m!507943))

(declare-fun m!507945 () Bool)

(assert (=> d!80805 m!507945))

(assert (=> d!80805 m!507827))

(assert (=> d!80805 m!507945))

(declare-fun m!507947 () Bool)

(assert (=> d!80805 m!507947))

(declare-fun m!507949 () Bool)

(assert (=> d!80805 m!507949))

(assert (=> b!526836 d!80805))

(declare-fun d!80807 () Bool)

(declare-fun res!323536 () Bool)

(declare-fun e!307113 () Bool)

(assert (=> d!80807 (=> res!323536 e!307113)))

(assert (=> d!80807 (= res!323536 (bvsge #b00000000000000000000000000000000 (size!16436 a!3235)))))

(assert (=> d!80807 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10134) e!307113)))

(declare-fun b!526959 () Bool)

(declare-fun e!307116 () Bool)

(declare-fun call!31860 () Bool)

(assert (=> b!526959 (= e!307116 call!31860)))

(declare-fun b!526960 () Bool)

(declare-fun e!307114 () Bool)

(assert (=> b!526960 (= e!307114 e!307116)))

(declare-fun c!62018 () Bool)

(assert (=> b!526960 (= c!62018 (validKeyInArray!0 (select (arr!16072 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!526961 () Bool)

(assert (=> b!526961 (= e!307116 call!31860)))

(declare-fun b!526962 () Bool)

(declare-fun e!307115 () Bool)

(declare-fun contains!2751 (List!10137 (_ BitVec 64)) Bool)

(assert (=> b!526962 (= e!307115 (contains!2751 Nil!10134 (select (arr!16072 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31857 () Bool)

(assert (=> bm!31857 (= call!31860 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62018 (Cons!10133 (select (arr!16072 a!3235) #b00000000000000000000000000000000) Nil!10134) Nil!10134)))))

(declare-fun b!526963 () Bool)

(assert (=> b!526963 (= e!307113 e!307114)))

(declare-fun res!323535 () Bool)

(assert (=> b!526963 (=> (not res!323535) (not e!307114))))

(assert (=> b!526963 (= res!323535 (not e!307115))))

(declare-fun res!323534 () Bool)

(assert (=> b!526963 (=> (not res!323534) (not e!307115))))

(assert (=> b!526963 (= res!323534 (validKeyInArray!0 (select (arr!16072 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80807 (not res!323536)) b!526963))

(assert (= (and b!526963 res!323534) b!526962))

(assert (= (and b!526963 res!323535) b!526960))

(assert (= (and b!526960 c!62018) b!526961))

(assert (= (and b!526960 (not c!62018)) b!526959))

(assert (= (or b!526961 b!526959) bm!31857))

(declare-fun m!507951 () Bool)

(assert (=> b!526960 m!507951))

(assert (=> b!526960 m!507951))

(declare-fun m!507953 () Bool)

(assert (=> b!526960 m!507953))

(assert (=> b!526962 m!507951))

(assert (=> b!526962 m!507951))

(declare-fun m!507955 () Bool)

(assert (=> b!526962 m!507955))

(assert (=> bm!31857 m!507951))

(declare-fun m!507957 () Bool)

(assert (=> bm!31857 m!507957))

(assert (=> b!526963 m!507951))

(assert (=> b!526963 m!507951))

(assert (=> b!526963 m!507953))

(assert (=> b!526841 d!80807))

(declare-fun d!80809 () Bool)

(assert (=> d!80809 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47804 d!80809))

(declare-fun d!80815 () Bool)

(assert (=> d!80815 (= (array_inv!11931 a!3235) (bvsge (size!16436 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47804 d!80815))

(declare-fun d!80819 () Bool)

(declare-fun e!307119 () Bool)

(assert (=> d!80819 e!307119))

(declare-fun res!323540 () Bool)

(assert (=> d!80819 (=> (not res!323540) (not e!307119))))

(assert (=> d!80819 (= res!323540 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16436 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16436 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16436 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16436 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16436 a!3235))))))

(declare-fun lt!242533 () Unit!16591)

(declare-fun choose!47 (array!33442 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16591)

(assert (=> d!80819 (= lt!242533 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!242446 #b00000000000000000000000000000000 (index!20194 lt!242451) (x!49305 lt!242451) mask!3524))))

(assert (=> d!80819 (validMask!0 mask!3524)))

(assert (=> d!80819 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242446 #b00000000000000000000000000000000 (index!20194 lt!242451) (x!49305 lt!242451) mask!3524) lt!242533)))

(declare-fun b!526966 () Bool)

(assert (=> b!526966 (= e!307119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242446 (select (store (arr!16072 a!3235) i!1204 k0!2280) j!176) (array!33443 (store (arr!16072 a!3235) i!1204 k0!2280) (size!16436 a!3235)) mask!3524) (Intermediate!4495 false (index!20194 lt!242451) (x!49305 lt!242451))))))

(assert (= (and d!80819 res!323540) b!526966))

(declare-fun m!507959 () Bool)

(assert (=> d!80819 m!507959))

(assert (=> d!80819 m!507827))

(assert (=> b!526966 m!507833))

(assert (=> b!526966 m!507839))

(assert (=> b!526966 m!507839))

(declare-fun m!507961 () Bool)

(assert (=> b!526966 m!507961))

(assert (=> b!526842 d!80819))

(declare-fun b!527015 () Bool)

(declare-fun e!307148 () Bool)

(declare-fun lt!242557 () SeekEntryResult!4495)

(assert (=> b!527015 (= e!307148 (bvsge (x!49305 lt!242557) #b01111111111111111111111111111110))))

(declare-fun b!527016 () Bool)

(declare-fun e!307151 () Bool)

(assert (=> b!527016 (= e!307148 e!307151)))

(declare-fun res!323553 () Bool)

(assert (=> b!527016 (= res!323553 (and ((_ is Intermediate!4495) lt!242557) (not (undefined!5307 lt!242557)) (bvslt (x!49305 lt!242557) #b01111111111111111111111111111110) (bvsge (x!49305 lt!242557) #b00000000000000000000000000000000) (bvsge (x!49305 lt!242557) #b00000000000000000000000000000000)))))

(assert (=> b!527016 (=> (not res!323553) (not e!307151))))

(declare-fun b!527017 () Bool)

(declare-fun e!307149 () SeekEntryResult!4495)

(declare-fun e!307152 () SeekEntryResult!4495)

(assert (=> b!527017 (= e!307149 e!307152)))

(declare-fun c!62039 () Bool)

(declare-fun lt!242556 () (_ BitVec 64))

(assert (=> b!527017 (= c!62039 (or (= lt!242556 lt!242453) (= (bvadd lt!242556 lt!242556) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527018 () Bool)

(assert (=> b!527018 (and (bvsge (index!20194 lt!242557) #b00000000000000000000000000000000) (bvslt (index!20194 lt!242557) (size!16436 lt!242454)))))

(declare-fun e!307150 () Bool)

(assert (=> b!527018 (= e!307150 (= (select (arr!16072 lt!242454) (index!20194 lt!242557)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80823 () Bool)

(assert (=> d!80823 e!307148))

(declare-fun c!62037 () Bool)

(assert (=> d!80823 (= c!62037 (and ((_ is Intermediate!4495) lt!242557) (undefined!5307 lt!242557)))))

(assert (=> d!80823 (= lt!242557 e!307149)))

(declare-fun c!62038 () Bool)

(assert (=> d!80823 (= c!62038 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80823 (= lt!242556 (select (arr!16072 lt!242454) lt!242446))))

(assert (=> d!80823 (validMask!0 mask!3524)))

(assert (=> d!80823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242446 lt!242453 lt!242454 mask!3524) lt!242557)))

(declare-fun b!527019 () Bool)

(assert (=> b!527019 (and (bvsge (index!20194 lt!242557) #b00000000000000000000000000000000) (bvslt (index!20194 lt!242557) (size!16436 lt!242454)))))

(declare-fun res!323554 () Bool)

(assert (=> b!527019 (= res!323554 (= (select (arr!16072 lt!242454) (index!20194 lt!242557)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!527019 (=> res!323554 e!307150)))

(declare-fun b!527020 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527020 (= e!307152 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242446 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!242453 lt!242454 mask!3524))))

(declare-fun b!527021 () Bool)

(assert (=> b!527021 (and (bvsge (index!20194 lt!242557) #b00000000000000000000000000000000) (bvslt (index!20194 lt!242557) (size!16436 lt!242454)))))

(declare-fun res!323555 () Bool)

(assert (=> b!527021 (= res!323555 (= (select (arr!16072 lt!242454) (index!20194 lt!242557)) lt!242453))))

(assert (=> b!527021 (=> res!323555 e!307150)))

(assert (=> b!527021 (= e!307151 e!307150)))

(declare-fun b!527022 () Bool)

(assert (=> b!527022 (= e!307152 (Intermediate!4495 false lt!242446 #b00000000000000000000000000000000))))

(declare-fun b!527023 () Bool)

(assert (=> b!527023 (= e!307149 (Intermediate!4495 true lt!242446 #b00000000000000000000000000000000))))

(assert (= (and d!80823 c!62038) b!527023))

(assert (= (and d!80823 (not c!62038)) b!527017))

(assert (= (and b!527017 c!62039) b!527022))

(assert (= (and b!527017 (not c!62039)) b!527020))

(assert (= (and d!80823 c!62037) b!527015))

(assert (= (and d!80823 (not c!62037)) b!527016))

(assert (= (and b!527016 res!323553) b!527021))

(assert (= (and b!527021 (not res!323555)) b!527019))

(assert (= (and b!527019 (not res!323554)) b!527018))

(declare-fun m!507969 () Bool)

(assert (=> b!527019 m!507969))

(declare-fun m!507971 () Bool)

(assert (=> d!80823 m!507971))

(assert (=> d!80823 m!507827))

(assert (=> b!527021 m!507969))

(assert (=> b!527018 m!507969))

(declare-fun m!507973 () Bool)

(assert (=> b!527020 m!507973))

(assert (=> b!527020 m!507973))

(declare-fun m!507975 () Bool)

(assert (=> b!527020 m!507975))

(assert (=> b!526842 d!80823))

(declare-fun d!80827 () Bool)

(assert (=> d!80827 (= (index!20194 lt!242451) i!1204)))

(declare-fun lt!242563 () Unit!16591)

(declare-fun choose!104 (array!33442 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16591)

(assert (=> d!80827 (= lt!242563 (choose!104 a!3235 i!1204 k0!2280 j!176 lt!242446 #b00000000000000000000000000000000 (index!20194 lt!242451) (x!49305 lt!242451) mask!3524))))

(assert (=> d!80827 (validMask!0 mask!3524)))

(assert (=> d!80827 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242446 #b00000000000000000000000000000000 (index!20194 lt!242451) (x!49305 lt!242451) mask!3524) lt!242563)))

(declare-fun bs!16541 () Bool)

(assert (= bs!16541 d!80827))

(declare-fun m!508003 () Bool)

(assert (=> bs!16541 m!508003))

(assert (=> bs!16541 m!507827))

(assert (=> b!526838 d!80827))

(declare-fun b!527038 () Bool)

(declare-fun e!307162 () Bool)

(declare-fun e!307163 () Bool)

(assert (=> b!527038 (= e!307162 e!307163)))

(declare-fun c!62045 () Bool)

(assert (=> b!527038 (= c!62045 (validKeyInArray!0 (select (arr!16072 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!527039 () Bool)

(declare-fun e!307164 () Bool)

(assert (=> b!527039 (= e!307163 e!307164)))

(declare-fun lt!242570 () (_ BitVec 64))

(assert (=> b!527039 (= lt!242570 (select (arr!16072 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!242572 () Unit!16591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33442 (_ BitVec 64) (_ BitVec 32)) Unit!16591)

(assert (=> b!527039 (= lt!242572 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!242570 #b00000000000000000000000000000000))))

(assert (=> b!527039 (arrayContainsKey!0 a!3235 lt!242570 #b00000000000000000000000000000000)))

(declare-fun lt!242571 () Unit!16591)

(assert (=> b!527039 (= lt!242571 lt!242572)))

(declare-fun res!323560 () Bool)

(assert (=> b!527039 (= res!323560 (= (seekEntryOrOpen!0 (select (arr!16072 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4495 #b00000000000000000000000000000000)))))

(assert (=> b!527039 (=> (not res!323560) (not e!307164))))

(declare-fun b!527040 () Bool)

(declare-fun call!31866 () Bool)

(assert (=> b!527040 (= e!307163 call!31866)))

(declare-fun b!527041 () Bool)

(assert (=> b!527041 (= e!307164 call!31866)))

(declare-fun bm!31863 () Bool)

(assert (=> bm!31863 (= call!31866 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80833 () Bool)

(declare-fun res!323561 () Bool)

(assert (=> d!80833 (=> res!323561 e!307162)))

(assert (=> d!80833 (= res!323561 (bvsge #b00000000000000000000000000000000 (size!16436 a!3235)))))

(assert (=> d!80833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!307162)))

(assert (= (and d!80833 (not res!323561)) b!527038))

(assert (= (and b!527038 c!62045) b!527039))

(assert (= (and b!527038 (not c!62045)) b!527040))

(assert (= (and b!527039 res!323560) b!527041))

(assert (= (or b!527041 b!527040) bm!31863))

(assert (=> b!527038 m!507951))

(assert (=> b!527038 m!507951))

(assert (=> b!527038 m!507953))

(assert (=> b!527039 m!507951))

(declare-fun m!508005 () Bool)

(assert (=> b!527039 m!508005))

(declare-fun m!508007 () Bool)

(assert (=> b!527039 m!508007))

(assert (=> b!527039 m!507951))

(declare-fun m!508009 () Bool)

(assert (=> b!527039 m!508009))

(declare-fun m!508011 () Bool)

(assert (=> bm!31863 m!508011))

(assert (=> b!526843 d!80833))

(declare-fun d!80835 () Bool)

(declare-fun lt!242591 () (_ BitVec 32))

(declare-fun lt!242590 () (_ BitVec 32))

(assert (=> d!80835 (= lt!242591 (bvmul (bvxor lt!242590 (bvlshr lt!242590 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80835 (= lt!242590 ((_ extract 31 0) (bvand (bvxor (select (arr!16072 a!3235) j!176) (bvlshr (select (arr!16072 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80835 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!323566 (let ((h!11068 ((_ extract 31 0) (bvand (bvxor (select (arr!16072 a!3235) j!176) (bvlshr (select (arr!16072 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49312 (bvmul (bvxor h!11068 (bvlshr h!11068 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49312 (bvlshr x!49312 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!323566 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!323566 #b00000000000000000000000000000000))))))

(assert (=> d!80835 (= (toIndex!0 (select (arr!16072 a!3235) j!176) mask!3524) (bvand (bvxor lt!242591 (bvlshr lt!242591 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!526833 d!80835))

(declare-fun b!527062 () Bool)

(declare-fun e!307178 () Bool)

(declare-fun lt!242593 () SeekEntryResult!4495)

(assert (=> b!527062 (= e!307178 (bvsge (x!49305 lt!242593) #b01111111111111111111111111111110))))

(declare-fun b!527063 () Bool)

(declare-fun e!307181 () Bool)

(assert (=> b!527063 (= e!307178 e!307181)))

(declare-fun res!323569 () Bool)

(assert (=> b!527063 (= res!323569 (and ((_ is Intermediate!4495) lt!242593) (not (undefined!5307 lt!242593)) (bvslt (x!49305 lt!242593) #b01111111111111111111111111111110) (bvsge (x!49305 lt!242593) #b00000000000000000000000000000000) (bvsge (x!49305 lt!242593) #b00000000000000000000000000000000)))))

(assert (=> b!527063 (=> (not res!323569) (not e!307181))))

(declare-fun b!527064 () Bool)

(declare-fun e!307179 () SeekEntryResult!4495)

(declare-fun e!307182 () SeekEntryResult!4495)

(assert (=> b!527064 (= e!307179 e!307182)))

(declare-fun c!62055 () Bool)

(declare-fun lt!242592 () (_ BitVec 64))

(assert (=> b!527064 (= c!62055 (or (= lt!242592 (select (arr!16072 a!3235) j!176)) (= (bvadd lt!242592 lt!242592) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527065 () Bool)

(assert (=> b!527065 (and (bvsge (index!20194 lt!242593) #b00000000000000000000000000000000) (bvslt (index!20194 lt!242593) (size!16436 a!3235)))))

(declare-fun e!307180 () Bool)

(assert (=> b!527065 (= e!307180 (= (select (arr!16072 a!3235) (index!20194 lt!242593)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80837 () Bool)

(assert (=> d!80837 e!307178))

(declare-fun c!62053 () Bool)

(assert (=> d!80837 (= c!62053 (and ((_ is Intermediate!4495) lt!242593) (undefined!5307 lt!242593)))))

(assert (=> d!80837 (= lt!242593 e!307179)))

(declare-fun c!62054 () Bool)

(assert (=> d!80837 (= c!62054 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80837 (= lt!242592 (select (arr!16072 a!3235) lt!242446))))

(assert (=> d!80837 (validMask!0 mask!3524)))

(assert (=> d!80837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242446 (select (arr!16072 a!3235) j!176) a!3235 mask!3524) lt!242593)))

(declare-fun b!527066 () Bool)

(assert (=> b!527066 (and (bvsge (index!20194 lt!242593) #b00000000000000000000000000000000) (bvslt (index!20194 lt!242593) (size!16436 a!3235)))))

(declare-fun res!323570 () Bool)

(assert (=> b!527066 (= res!323570 (= (select (arr!16072 a!3235) (index!20194 lt!242593)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!527066 (=> res!323570 e!307180)))

(declare-fun b!527067 () Bool)

(assert (=> b!527067 (= e!307182 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242446 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!16072 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!527068 () Bool)

(assert (=> b!527068 (and (bvsge (index!20194 lt!242593) #b00000000000000000000000000000000) (bvslt (index!20194 lt!242593) (size!16436 a!3235)))))

(declare-fun res!323571 () Bool)

(assert (=> b!527068 (= res!323571 (= (select (arr!16072 a!3235) (index!20194 lt!242593)) (select (arr!16072 a!3235) j!176)))))

(assert (=> b!527068 (=> res!323571 e!307180)))

(assert (=> b!527068 (= e!307181 e!307180)))

(declare-fun b!527069 () Bool)

(assert (=> b!527069 (= e!307182 (Intermediate!4495 false lt!242446 #b00000000000000000000000000000000))))

(declare-fun b!527070 () Bool)

(assert (=> b!527070 (= e!307179 (Intermediate!4495 true lt!242446 #b00000000000000000000000000000000))))

(assert (= (and d!80837 c!62054) b!527070))

(assert (= (and d!80837 (not c!62054)) b!527064))

(assert (= (and b!527064 c!62055) b!527069))

(assert (= (and b!527064 (not c!62055)) b!527067))

(assert (= (and d!80837 c!62053) b!527062))

(assert (= (and d!80837 (not c!62053)) b!527063))

(assert (= (and b!527063 res!323569) b!527068))

(assert (= (and b!527068 (not res!323571)) b!527066))

(assert (= (and b!527066 (not res!323570)) b!527065))

(declare-fun m!508025 () Bool)

(assert (=> b!527066 m!508025))

(declare-fun m!508027 () Bool)

(assert (=> d!80837 m!508027))

(assert (=> d!80837 m!507827))

(assert (=> b!527068 m!508025))

(assert (=> b!527065 m!508025))

(assert (=> b!527067 m!507973))

(assert (=> b!527067 m!507973))

(assert (=> b!527067 m!507811))

(declare-fun m!508029 () Bool)

(assert (=> b!527067 m!508029))

(assert (=> b!526833 d!80837))

(declare-fun b!527075 () Bool)

(declare-fun e!307185 () Bool)

(declare-fun e!307186 () Bool)

(assert (=> b!527075 (= e!307185 e!307186)))

(declare-fun c!62058 () Bool)

(assert (=> b!527075 (= c!62058 (validKeyInArray!0 (select (arr!16072 a!3235) j!176)))))

(declare-fun b!527076 () Bool)

(declare-fun e!307187 () Bool)

(assert (=> b!527076 (= e!307186 e!307187)))

(declare-fun lt!242594 () (_ BitVec 64))

(assert (=> b!527076 (= lt!242594 (select (arr!16072 a!3235) j!176))))

(declare-fun lt!242596 () Unit!16591)

(assert (=> b!527076 (= lt!242596 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!242594 j!176))))

(assert (=> b!527076 (arrayContainsKey!0 a!3235 lt!242594 #b00000000000000000000000000000000)))

(declare-fun lt!242595 () Unit!16591)

(assert (=> b!527076 (= lt!242595 lt!242596)))

(declare-fun res!323572 () Bool)

(assert (=> b!527076 (= res!323572 (= (seekEntryOrOpen!0 (select (arr!16072 a!3235) j!176) a!3235 mask!3524) (Found!4495 j!176)))))

(assert (=> b!527076 (=> (not res!323572) (not e!307187))))

(declare-fun b!527077 () Bool)

(declare-fun call!31870 () Bool)

(assert (=> b!527077 (= e!307186 call!31870)))

(declare-fun b!527078 () Bool)

(assert (=> b!527078 (= e!307187 call!31870)))

(declare-fun bm!31867 () Bool)

(assert (=> bm!31867 (= call!31870 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80841 () Bool)

(declare-fun res!323573 () Bool)

(assert (=> d!80841 (=> res!323573 e!307185)))

(assert (=> d!80841 (= res!323573 (bvsge j!176 (size!16436 a!3235)))))

(assert (=> d!80841 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!307185)))

(assert (= (and d!80841 (not res!323573)) b!527075))

(assert (= (and b!527075 c!62058) b!527076))

(assert (= (and b!527075 (not c!62058)) b!527077))

(assert (= (and b!527076 res!323572) b!527078))

(assert (= (or b!527078 b!527077) bm!31867))

(assert (=> b!527075 m!507811))

(assert (=> b!527075 m!507811))

(assert (=> b!527075 m!507819))

(assert (=> b!527076 m!507811))

(declare-fun m!508031 () Bool)

(assert (=> b!527076 m!508031))

(declare-fun m!508033 () Bool)

(assert (=> b!527076 m!508033))

(assert (=> b!527076 m!507811))

(assert (=> b!527076 m!507813))

(declare-fun m!508035 () Bool)

(assert (=> bm!31867 m!508035))

(assert (=> b!526833 d!80841))

(declare-fun b!527085 () Bool)

(declare-fun e!307192 () Bool)

(declare-fun lt!242598 () SeekEntryResult!4495)

(assert (=> b!527085 (= e!307192 (bvsge (x!49305 lt!242598) #b01111111111111111111111111111110))))

(declare-fun b!527086 () Bool)

(declare-fun e!307195 () Bool)

(assert (=> b!527086 (= e!307192 e!307195)))

(declare-fun res!323580 () Bool)

(assert (=> b!527086 (= res!323580 (and ((_ is Intermediate!4495) lt!242598) (not (undefined!5307 lt!242598)) (bvslt (x!49305 lt!242598) #b01111111111111111111111111111110) (bvsge (x!49305 lt!242598) #b00000000000000000000000000000000) (bvsge (x!49305 lt!242598) #b00000000000000000000000000000000)))))

(assert (=> b!527086 (=> (not res!323580) (not e!307195))))

(declare-fun b!527087 () Bool)

(declare-fun e!307193 () SeekEntryResult!4495)

(declare-fun e!307196 () SeekEntryResult!4495)

(assert (=> b!527087 (= e!307193 e!307196)))

(declare-fun c!62061 () Bool)

(declare-fun lt!242597 () (_ BitVec 64))

(assert (=> b!527087 (= c!62061 (or (= lt!242597 lt!242453) (= (bvadd lt!242597 lt!242597) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527088 () Bool)

(assert (=> b!527088 (and (bvsge (index!20194 lt!242598) #b00000000000000000000000000000000) (bvslt (index!20194 lt!242598) (size!16436 lt!242454)))))

(declare-fun e!307194 () Bool)

(assert (=> b!527088 (= e!307194 (= (select (arr!16072 lt!242454) (index!20194 lt!242598)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80843 () Bool)

(assert (=> d!80843 e!307192))

(declare-fun c!62059 () Bool)

(assert (=> d!80843 (= c!62059 (and ((_ is Intermediate!4495) lt!242598) (undefined!5307 lt!242598)))))

(assert (=> d!80843 (= lt!242598 e!307193)))

(declare-fun c!62060 () Bool)

(assert (=> d!80843 (= c!62060 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80843 (= lt!242597 (select (arr!16072 lt!242454) lt!242455))))

(assert (=> d!80843 (validMask!0 mask!3524)))

(assert (=> d!80843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242455 lt!242453 lt!242454 mask!3524) lt!242598)))

(declare-fun b!527089 () Bool)

(assert (=> b!527089 (and (bvsge (index!20194 lt!242598) #b00000000000000000000000000000000) (bvslt (index!20194 lt!242598) (size!16436 lt!242454)))))

(declare-fun res!323581 () Bool)

(assert (=> b!527089 (= res!323581 (= (select (arr!16072 lt!242454) (index!20194 lt!242598)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!527089 (=> res!323581 e!307194)))

(declare-fun b!527090 () Bool)

(assert (=> b!527090 (= e!307196 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242455 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!242453 lt!242454 mask!3524))))

(declare-fun b!527091 () Bool)

(assert (=> b!527091 (and (bvsge (index!20194 lt!242598) #b00000000000000000000000000000000) (bvslt (index!20194 lt!242598) (size!16436 lt!242454)))))

(declare-fun res!323582 () Bool)

(assert (=> b!527091 (= res!323582 (= (select (arr!16072 lt!242454) (index!20194 lt!242598)) lt!242453))))

(assert (=> b!527091 (=> res!323582 e!307194)))

(assert (=> b!527091 (= e!307195 e!307194)))

(declare-fun b!527092 () Bool)

(assert (=> b!527092 (= e!307196 (Intermediate!4495 false lt!242455 #b00000000000000000000000000000000))))

(declare-fun b!527093 () Bool)

(assert (=> b!527093 (= e!307193 (Intermediate!4495 true lt!242455 #b00000000000000000000000000000000))))

(assert (= (and d!80843 c!62060) b!527093))

(assert (= (and d!80843 (not c!62060)) b!527087))

(assert (= (and b!527087 c!62061) b!527092))

(assert (= (and b!527087 (not c!62061)) b!527090))

(assert (= (and d!80843 c!62059) b!527085))

(assert (= (and d!80843 (not c!62059)) b!527086))

(assert (= (and b!527086 res!323580) b!527091))

(assert (= (and b!527091 (not res!323582)) b!527089))

(assert (= (and b!527089 (not res!323581)) b!527088))

(declare-fun m!508037 () Bool)

(assert (=> b!527089 m!508037))

(declare-fun m!508039 () Bool)

(assert (=> d!80843 m!508039))

(assert (=> d!80843 m!507827))

(assert (=> b!527091 m!508037))

(assert (=> b!527088 m!508037))

(declare-fun m!508041 () Bool)

(assert (=> b!527090 m!508041))

(assert (=> b!527090 m!508041))

(declare-fun m!508043 () Bool)

(assert (=> b!527090 m!508043))

(assert (=> b!526833 d!80843))

(declare-fun d!80847 () Bool)

(declare-fun lt!242600 () (_ BitVec 32))

(declare-fun lt!242599 () (_ BitVec 32))

(assert (=> d!80847 (= lt!242600 (bvmul (bvxor lt!242599 (bvlshr lt!242599 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80847 (= lt!242599 ((_ extract 31 0) (bvand (bvxor lt!242453 (bvlshr lt!242453 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80847 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!323566 (let ((h!11068 ((_ extract 31 0) (bvand (bvxor lt!242453 (bvlshr lt!242453 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49312 (bvmul (bvxor h!11068 (bvlshr h!11068 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49312 (bvlshr x!49312 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!323566 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!323566 #b00000000000000000000000000000000))))))

(assert (=> d!80847 (= (toIndex!0 lt!242453 mask!3524) (bvand (bvxor lt!242600 (bvlshr lt!242600 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!526833 d!80847))

(declare-fun d!80849 () Bool)

(assert (=> d!80849 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!242603 () Unit!16591)

(declare-fun choose!38 (array!33442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16591)

(assert (=> d!80849 (= lt!242603 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80849 (validMask!0 mask!3524)))

(assert (=> d!80849 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!242603)))

(declare-fun bs!16542 () Bool)

(assert (= bs!16542 d!80849))

(assert (=> bs!16542 m!507847))

(declare-fun m!508045 () Bool)

(assert (=> bs!16542 m!508045))

(assert (=> bs!16542 m!507827))

(assert (=> b!526833 d!80849))

(declare-fun b!527094 () Bool)

(declare-fun e!307198 () SeekEntryResult!4495)

(declare-fun e!307197 () SeekEntryResult!4495)

(assert (=> b!527094 (= e!307198 e!307197)))

(declare-fun lt!242606 () (_ BitVec 64))

(declare-fun lt!242605 () SeekEntryResult!4495)

(assert (=> b!527094 (= lt!242606 (select (arr!16072 a!3235) (index!20194 lt!242605)))))

(declare-fun c!62062 () Bool)

(assert (=> b!527094 (= c!62062 (= lt!242606 (select (arr!16072 a!3235) j!176)))))

(declare-fun b!527096 () Bool)

(declare-fun c!62063 () Bool)

(assert (=> b!527096 (= c!62063 (= lt!242606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307199 () SeekEntryResult!4495)

(assert (=> b!527096 (= e!307197 e!307199)))

(declare-fun b!527097 () Bool)

(assert (=> b!527097 (= e!307199 (seekKeyOrZeroReturnVacant!0 (x!49305 lt!242605) (index!20194 lt!242605) (index!20194 lt!242605) (select (arr!16072 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!527098 () Bool)

(assert (=> b!527098 (= e!307198 Undefined!4495)))

(declare-fun b!527099 () Bool)

(assert (=> b!527099 (= e!307199 (MissingZero!4495 (index!20194 lt!242605)))))

(declare-fun d!80851 () Bool)

(declare-fun lt!242604 () SeekEntryResult!4495)

(assert (=> d!80851 (and (or ((_ is Undefined!4495) lt!242604) (not ((_ is Found!4495) lt!242604)) (and (bvsge (index!20193 lt!242604) #b00000000000000000000000000000000) (bvslt (index!20193 lt!242604) (size!16436 a!3235)))) (or ((_ is Undefined!4495) lt!242604) ((_ is Found!4495) lt!242604) (not ((_ is MissingZero!4495) lt!242604)) (and (bvsge (index!20192 lt!242604) #b00000000000000000000000000000000) (bvslt (index!20192 lt!242604) (size!16436 a!3235)))) (or ((_ is Undefined!4495) lt!242604) ((_ is Found!4495) lt!242604) ((_ is MissingZero!4495) lt!242604) (not ((_ is MissingVacant!4495) lt!242604)) (and (bvsge (index!20195 lt!242604) #b00000000000000000000000000000000) (bvslt (index!20195 lt!242604) (size!16436 a!3235)))) (or ((_ is Undefined!4495) lt!242604) (ite ((_ is Found!4495) lt!242604) (= (select (arr!16072 a!3235) (index!20193 lt!242604)) (select (arr!16072 a!3235) j!176)) (ite ((_ is MissingZero!4495) lt!242604) (= (select (arr!16072 a!3235) (index!20192 lt!242604)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4495) lt!242604) (= (select (arr!16072 a!3235) (index!20195 lt!242604)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80851 (= lt!242604 e!307198)))

(declare-fun c!62064 () Bool)

(assert (=> d!80851 (= c!62064 (and ((_ is Intermediate!4495) lt!242605) (undefined!5307 lt!242605)))))

(assert (=> d!80851 (= lt!242605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16072 a!3235) j!176) mask!3524) (select (arr!16072 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80851 (validMask!0 mask!3524)))

(assert (=> d!80851 (= (seekEntryOrOpen!0 (select (arr!16072 a!3235) j!176) a!3235 mask!3524) lt!242604)))

(declare-fun b!527095 () Bool)

(assert (=> b!527095 (= e!307197 (Found!4495 (index!20194 lt!242605)))))

(assert (= (and d!80851 c!62064) b!527098))

(assert (= (and d!80851 (not c!62064)) b!527094))

(assert (= (and b!527094 c!62062) b!527095))

(assert (= (and b!527094 (not c!62062)) b!527096))

(assert (= (and b!527096 c!62063) b!527099))

(assert (= (and b!527096 (not c!62063)) b!527097))

(declare-fun m!508047 () Bool)

(assert (=> b!527094 m!508047))

(assert (=> b!527097 m!507811))

(declare-fun m!508049 () Bool)

(assert (=> b!527097 m!508049))

(declare-fun m!508051 () Bool)

(assert (=> d!80851 m!508051))

(declare-fun m!508053 () Bool)

(assert (=> d!80851 m!508053))

(assert (=> d!80851 m!507811))

(assert (=> d!80851 m!507845))

(assert (=> d!80851 m!507827))

(assert (=> d!80851 m!507845))

(assert (=> d!80851 m!507811))

(declare-fun m!508055 () Bool)

(assert (=> d!80851 m!508055))

(declare-fun m!508057 () Bool)

(assert (=> d!80851 m!508057))

(assert (=> b!526834 d!80851))

(declare-fun d!80853 () Bool)

(assert (=> d!80853 (= (validKeyInArray!0 (select (arr!16072 a!3235) j!176)) (and (not (= (select (arr!16072 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16072 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!526840 d!80853))

(declare-fun d!80855 () Bool)

(assert (=> d!80855 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!526845 d!80855))

(declare-fun d!80857 () Bool)

(declare-fun res!323590 () Bool)

(declare-fun e!307209 () Bool)

(assert (=> d!80857 (=> res!323590 e!307209)))

(assert (=> d!80857 (= res!323590 (= (select (arr!16072 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80857 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!307209)))

(declare-fun b!527113 () Bool)

(declare-fun e!307210 () Bool)

(assert (=> b!527113 (= e!307209 e!307210)))

(declare-fun res!323591 () Bool)

(assert (=> b!527113 (=> (not res!323591) (not e!307210))))

(assert (=> b!527113 (= res!323591 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16436 a!3235)))))

(declare-fun b!527114 () Bool)

(assert (=> b!527114 (= e!307210 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80857 (not res!323590)) b!527113))

(assert (= (and b!527113 res!323591) b!527114))

(assert (=> d!80857 m!507951))

(declare-fun m!508067 () Bool)

(assert (=> b!527114 m!508067))

(assert (=> b!526846 d!80857))

(check-sat (not b!526963) (not d!80851) (not b!527076) (not b!526966) (not bm!31867) (not bm!31863) (not d!80837) (not b!527039) (not b!527067) (not d!80819) (not d!80843) (not d!80827) (not d!80805) (not b!527097) (not b!527038) (not bm!31857) (not b!526962) (not b!527020) (not b!527090) (not b!526960) (not b!527075) (not d!80849) (not b!527114) (not d!80823) (not b!526946))
(check-sat)
