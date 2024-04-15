; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47802 () Bool)

(assert start!47802)

(declare-fun b!526623 () Bool)

(declare-fun res!323322 () Bool)

(declare-fun e!306913 () Bool)

(assert (=> b!526623 (=> (not res!323322) (not e!306913))))

(declare-datatypes ((array!33449 0))(
  ( (array!33450 (arr!16076 (Array (_ BitVec 32) (_ BitVec 64))) (size!16441 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33449)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33449 (_ BitVec 32)) Bool)

(assert (=> b!526623 (= res!323322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526624 () Bool)

(declare-fun res!323328 () Bool)

(declare-fun e!306914 () Bool)

(assert (=> b!526624 (=> res!323328 e!306914)))

(declare-datatypes ((SeekEntryResult!4540 0))(
  ( (MissingZero!4540 (index!20372 (_ BitVec 32))) (Found!4540 (index!20373 (_ BitVec 32))) (Intermediate!4540 (undefined!5352 Bool) (index!20374 (_ BitVec 32)) (x!49348 (_ BitVec 32))) (Undefined!4540) (MissingVacant!4540 (index!20375 (_ BitVec 32))) )
))
(declare-fun lt!242208 () SeekEntryResult!4540)

(get-info :version)

(assert (=> b!526624 (= res!323328 (or (undefined!5352 lt!242208) (not ((_ is Intermediate!4540) lt!242208))))))

(declare-fun b!526625 () Bool)

(declare-fun res!323330 () Bool)

(assert (=> b!526625 (=> (not res!323330) (not e!306913))))

(declare-datatypes ((List!10273 0))(
  ( (Nil!10270) (Cons!10269 (h!11200 (_ BitVec 64)) (t!16492 List!10273)) )
))
(declare-fun arrayNoDuplicates!0 (array!33449 (_ BitVec 32) List!10273) Bool)

(assert (=> b!526625 (= res!323330 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10270))))

(declare-fun b!526626 () Bool)

(declare-fun e!306916 () Bool)

(assert (=> b!526626 (= e!306916 e!306913)))

(declare-fun res!323333 () Bool)

(assert (=> b!526626 (=> (not res!323333) (not e!306913))))

(declare-fun lt!242200 () SeekEntryResult!4540)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526626 (= res!323333 (or (= lt!242200 (MissingZero!4540 i!1204)) (= lt!242200 (MissingVacant!4540 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33449 (_ BitVec 32)) SeekEntryResult!4540)

(assert (=> b!526626 (= lt!242200 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun e!306918 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!526627 () Bool)

(assert (=> b!526627 (= e!306918 (= (seekEntryOrOpen!0 (select (arr!16076 a!3235) j!176) a!3235 mask!3524) (Found!4540 j!176)))))

(declare-fun b!526628 () Bool)

(declare-fun lt!242202 () (_ BitVec 32))

(assert (=> b!526628 (= e!306914 (or (bvsgt (x!49348 lt!242208) #b01111111111111111111111111111110) (and (bvsge lt!242202 #b00000000000000000000000000000000) (bvslt lt!242202 (size!16441 a!3235)))))))

(assert (=> b!526628 (= (index!20374 lt!242208) i!1204)))

(declare-datatypes ((Unit!16606 0))(
  ( (Unit!16607) )
))
(declare-fun lt!242206 () Unit!16606)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16606)

(assert (=> b!526628 (= lt!242206 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242202 #b00000000000000000000000000000000 (index!20374 lt!242208) (x!49348 lt!242208) mask!3524))))

(assert (=> b!526628 (and (or (= (select (arr!16076 a!3235) (index!20374 lt!242208)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16076 a!3235) (index!20374 lt!242208)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16076 a!3235) (index!20374 lt!242208)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16076 a!3235) (index!20374 lt!242208)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242201 () Unit!16606)

(declare-fun e!306912 () Unit!16606)

(assert (=> b!526628 (= lt!242201 e!306912)))

(declare-fun c!61956 () Bool)

(assert (=> b!526628 (= c!61956 (= (select (arr!16076 a!3235) (index!20374 lt!242208)) (select (arr!16076 a!3235) j!176)))))

(assert (=> b!526628 (and (bvslt (x!49348 lt!242208) #b01111111111111111111111111111110) (or (= (select (arr!16076 a!3235) (index!20374 lt!242208)) (select (arr!16076 a!3235) j!176)) (= (select (arr!16076 a!3235) (index!20374 lt!242208)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16076 a!3235) (index!20374 lt!242208)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526630 () Bool)

(declare-fun res!323329 () Bool)

(assert (=> b!526630 (=> (not res!323329) (not e!306916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526630 (= res!323329 (validKeyInArray!0 (select (arr!16076 a!3235) j!176)))))

(declare-fun b!526631 () Bool)

(declare-fun e!306917 () Bool)

(assert (=> b!526631 (= e!306917 false)))

(declare-fun b!526632 () Bool)

(declare-fun res!323324 () Bool)

(assert (=> b!526632 (=> (not res!323324) (not e!306916))))

(assert (=> b!526632 (= res!323324 (and (= (size!16441 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16441 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16441 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526633 () Bool)

(assert (=> b!526633 (= e!306913 (not e!306914))))

(declare-fun res!323327 () Bool)

(assert (=> b!526633 (=> res!323327 e!306914)))

(declare-fun lt!242203 () (_ BitVec 64))

(declare-fun lt!242207 () array!33449)

(declare-fun lt!242209 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33449 (_ BitVec 32)) SeekEntryResult!4540)

(assert (=> b!526633 (= res!323327 (= lt!242208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242209 lt!242203 lt!242207 mask!3524)))))

(assert (=> b!526633 (= lt!242208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242202 (select (arr!16076 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526633 (= lt!242209 (toIndex!0 lt!242203 mask!3524))))

(assert (=> b!526633 (= lt!242203 (select (store (arr!16076 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526633 (= lt!242202 (toIndex!0 (select (arr!16076 a!3235) j!176) mask!3524))))

(assert (=> b!526633 (= lt!242207 (array!33450 (store (arr!16076 a!3235) i!1204 k0!2280) (size!16441 a!3235)))))

(assert (=> b!526633 e!306918))

(declare-fun res!323331 () Bool)

(assert (=> b!526633 (=> (not res!323331) (not e!306918))))

(assert (=> b!526633 (= res!323331 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242204 () Unit!16606)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16606)

(assert (=> b!526633 (= lt!242204 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526634 () Bool)

(declare-fun Unit!16608 () Unit!16606)

(assert (=> b!526634 (= e!306912 Unit!16608)))

(declare-fun lt!242205 () Unit!16606)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16606)

(assert (=> b!526634 (= lt!242205 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242202 #b00000000000000000000000000000000 (index!20374 lt!242208) (x!49348 lt!242208) mask!3524))))

(declare-fun res!323323 () Bool)

(assert (=> b!526634 (= res!323323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242202 lt!242203 lt!242207 mask!3524) (Intermediate!4540 false (index!20374 lt!242208) (x!49348 lt!242208))))))

(assert (=> b!526634 (=> (not res!323323) (not e!306917))))

(assert (=> b!526634 e!306917))

(declare-fun res!323332 () Bool)

(assert (=> start!47802 (=> (not res!323332) (not e!306916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47802 (= res!323332 (validMask!0 mask!3524))))

(assert (=> start!47802 e!306916))

(assert (=> start!47802 true))

(declare-fun array_inv!11959 (array!33449) Bool)

(assert (=> start!47802 (array_inv!11959 a!3235)))

(declare-fun b!526629 () Bool)

(declare-fun Unit!16609 () Unit!16606)

(assert (=> b!526629 (= e!306912 Unit!16609)))

(declare-fun b!526635 () Bool)

(declare-fun res!323325 () Bool)

(assert (=> b!526635 (=> (not res!323325) (not e!306916))))

(declare-fun arrayContainsKey!0 (array!33449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526635 (= res!323325 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526636 () Bool)

(declare-fun res!323326 () Bool)

(assert (=> b!526636 (=> (not res!323326) (not e!306916))))

(assert (=> b!526636 (= res!323326 (validKeyInArray!0 k0!2280))))

(assert (= (and start!47802 res!323332) b!526632))

(assert (= (and b!526632 res!323324) b!526630))

(assert (= (and b!526630 res!323329) b!526636))

(assert (= (and b!526636 res!323326) b!526635))

(assert (= (and b!526635 res!323325) b!526626))

(assert (= (and b!526626 res!323333) b!526623))

(assert (= (and b!526623 res!323322) b!526625))

(assert (= (and b!526625 res!323330) b!526633))

(assert (= (and b!526633 res!323331) b!526627))

(assert (= (and b!526633 (not res!323327)) b!526624))

(assert (= (and b!526624 (not res!323328)) b!526628))

(assert (= (and b!526628 c!61956) b!526634))

(assert (= (and b!526628 (not c!61956)) b!526629))

(assert (= (and b!526634 res!323323) b!526631))

(declare-fun m!506869 () Bool)

(assert (=> b!526628 m!506869))

(declare-fun m!506871 () Bool)

(assert (=> b!526628 m!506871))

(declare-fun m!506873 () Bool)

(assert (=> b!526628 m!506873))

(declare-fun m!506875 () Bool)

(assert (=> start!47802 m!506875))

(declare-fun m!506877 () Bool)

(assert (=> start!47802 m!506877))

(declare-fun m!506879 () Bool)

(assert (=> b!526625 m!506879))

(declare-fun m!506881 () Bool)

(assert (=> b!526636 m!506881))

(declare-fun m!506883 () Bool)

(assert (=> b!526633 m!506883))

(declare-fun m!506885 () Bool)

(assert (=> b!526633 m!506885))

(declare-fun m!506887 () Bool)

(assert (=> b!526633 m!506887))

(declare-fun m!506889 () Bool)

(assert (=> b!526633 m!506889))

(declare-fun m!506891 () Bool)

(assert (=> b!526633 m!506891))

(assert (=> b!526633 m!506873))

(declare-fun m!506893 () Bool)

(assert (=> b!526633 m!506893))

(assert (=> b!526633 m!506873))

(declare-fun m!506895 () Bool)

(assert (=> b!526633 m!506895))

(assert (=> b!526633 m!506873))

(declare-fun m!506897 () Bool)

(assert (=> b!526633 m!506897))

(assert (=> b!526630 m!506873))

(assert (=> b!526630 m!506873))

(declare-fun m!506899 () Bool)

(assert (=> b!526630 m!506899))

(declare-fun m!506901 () Bool)

(assert (=> b!526634 m!506901))

(declare-fun m!506903 () Bool)

(assert (=> b!526634 m!506903))

(declare-fun m!506905 () Bool)

(assert (=> b!526623 m!506905))

(assert (=> b!526627 m!506873))

(assert (=> b!526627 m!506873))

(declare-fun m!506907 () Bool)

(assert (=> b!526627 m!506907))

(declare-fun m!506909 () Bool)

(assert (=> b!526635 m!506909))

(declare-fun m!506911 () Bool)

(assert (=> b!526626 m!506911))

(check-sat (not start!47802) (not b!526636) (not b!526628) (not b!526634) (not b!526635) (not b!526630) (not b!526627) (not b!526625) (not b!526623) (not b!526626) (not b!526633))
(check-sat)
(get-model)

(declare-fun d!80567 () Bool)

(declare-fun lt!242277 () SeekEntryResult!4540)

(assert (=> d!80567 (and (or ((_ is Undefined!4540) lt!242277) (not ((_ is Found!4540) lt!242277)) (and (bvsge (index!20373 lt!242277) #b00000000000000000000000000000000) (bvslt (index!20373 lt!242277) (size!16441 a!3235)))) (or ((_ is Undefined!4540) lt!242277) ((_ is Found!4540) lt!242277) (not ((_ is MissingZero!4540) lt!242277)) (and (bvsge (index!20372 lt!242277) #b00000000000000000000000000000000) (bvslt (index!20372 lt!242277) (size!16441 a!3235)))) (or ((_ is Undefined!4540) lt!242277) ((_ is Found!4540) lt!242277) ((_ is MissingZero!4540) lt!242277) (not ((_ is MissingVacant!4540) lt!242277)) (and (bvsge (index!20375 lt!242277) #b00000000000000000000000000000000) (bvslt (index!20375 lt!242277) (size!16441 a!3235)))) (or ((_ is Undefined!4540) lt!242277) (ite ((_ is Found!4540) lt!242277) (= (select (arr!16076 a!3235) (index!20373 lt!242277)) k0!2280) (ite ((_ is MissingZero!4540) lt!242277) (= (select (arr!16076 a!3235) (index!20372 lt!242277)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4540) lt!242277) (= (select (arr!16076 a!3235) (index!20375 lt!242277)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!306969 () SeekEntryResult!4540)

(assert (=> d!80567 (= lt!242277 e!306969)))

(declare-fun c!61970 () Bool)

(declare-fun lt!242276 () SeekEntryResult!4540)

(assert (=> d!80567 (= c!61970 (and ((_ is Intermediate!4540) lt!242276) (undefined!5352 lt!242276)))))

(assert (=> d!80567 (= lt!242276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80567 (validMask!0 mask!3524)))

(assert (=> d!80567 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!242277)))

(declare-fun b!526733 () Bool)

(declare-fun e!306967 () SeekEntryResult!4540)

(assert (=> b!526733 (= e!306967 (MissingZero!4540 (index!20374 lt!242276)))))

(declare-fun b!526734 () Bool)

(declare-fun e!306968 () SeekEntryResult!4540)

(assert (=> b!526734 (= e!306968 (Found!4540 (index!20374 lt!242276)))))

(declare-fun b!526735 () Bool)

(declare-fun c!61969 () Bool)

(declare-fun lt!242278 () (_ BitVec 64))

(assert (=> b!526735 (= c!61969 (= lt!242278 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!526735 (= e!306968 e!306967)))

(declare-fun b!526736 () Bool)

(assert (=> b!526736 (= e!306969 e!306968)))

(assert (=> b!526736 (= lt!242278 (select (arr!16076 a!3235) (index!20374 lt!242276)))))

(declare-fun c!61971 () Bool)

(assert (=> b!526736 (= c!61971 (= lt!242278 k0!2280))))

(declare-fun b!526737 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33449 (_ BitVec 32)) SeekEntryResult!4540)

(assert (=> b!526737 (= e!306967 (seekKeyOrZeroReturnVacant!0 (x!49348 lt!242276) (index!20374 lt!242276) (index!20374 lt!242276) k0!2280 a!3235 mask!3524))))

(declare-fun b!526738 () Bool)

(assert (=> b!526738 (= e!306969 Undefined!4540)))

(assert (= (and d!80567 c!61970) b!526738))

(assert (= (and d!80567 (not c!61970)) b!526736))

(assert (= (and b!526736 c!61971) b!526734))

(assert (= (and b!526736 (not c!61971)) b!526735))

(assert (= (and b!526735 c!61969) b!526733))

(assert (= (and b!526735 (not c!61969)) b!526737))

(declare-fun m!507001 () Bool)

(assert (=> d!80567 m!507001))

(declare-fun m!507003 () Bool)

(assert (=> d!80567 m!507003))

(declare-fun m!507005 () Bool)

(assert (=> d!80567 m!507005))

(declare-fun m!507007 () Bool)

(assert (=> d!80567 m!507007))

(assert (=> d!80567 m!507003))

(declare-fun m!507009 () Bool)

(assert (=> d!80567 m!507009))

(assert (=> d!80567 m!506875))

(declare-fun m!507011 () Bool)

(assert (=> b!526736 m!507011))

(declare-fun m!507013 () Bool)

(assert (=> b!526737 m!507013))

(assert (=> b!526626 d!80567))

(declare-fun d!80569 () Bool)

(assert (=> d!80569 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47802 d!80569))

(declare-fun d!80571 () Bool)

(assert (=> d!80571 (= (array_inv!11959 a!3235) (bvsge (size!16441 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47802 d!80571))

(declare-fun d!80573 () Bool)

(declare-fun lt!242280 () SeekEntryResult!4540)

(assert (=> d!80573 (and (or ((_ is Undefined!4540) lt!242280) (not ((_ is Found!4540) lt!242280)) (and (bvsge (index!20373 lt!242280) #b00000000000000000000000000000000) (bvslt (index!20373 lt!242280) (size!16441 a!3235)))) (or ((_ is Undefined!4540) lt!242280) ((_ is Found!4540) lt!242280) (not ((_ is MissingZero!4540) lt!242280)) (and (bvsge (index!20372 lt!242280) #b00000000000000000000000000000000) (bvslt (index!20372 lt!242280) (size!16441 a!3235)))) (or ((_ is Undefined!4540) lt!242280) ((_ is Found!4540) lt!242280) ((_ is MissingZero!4540) lt!242280) (not ((_ is MissingVacant!4540) lt!242280)) (and (bvsge (index!20375 lt!242280) #b00000000000000000000000000000000) (bvslt (index!20375 lt!242280) (size!16441 a!3235)))) (or ((_ is Undefined!4540) lt!242280) (ite ((_ is Found!4540) lt!242280) (= (select (arr!16076 a!3235) (index!20373 lt!242280)) (select (arr!16076 a!3235) j!176)) (ite ((_ is MissingZero!4540) lt!242280) (= (select (arr!16076 a!3235) (index!20372 lt!242280)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4540) lt!242280) (= (select (arr!16076 a!3235) (index!20375 lt!242280)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!306972 () SeekEntryResult!4540)

(assert (=> d!80573 (= lt!242280 e!306972)))

(declare-fun c!61973 () Bool)

(declare-fun lt!242279 () SeekEntryResult!4540)

(assert (=> d!80573 (= c!61973 (and ((_ is Intermediate!4540) lt!242279) (undefined!5352 lt!242279)))))

(assert (=> d!80573 (= lt!242279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16076 a!3235) j!176) mask!3524) (select (arr!16076 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80573 (validMask!0 mask!3524)))

(assert (=> d!80573 (= (seekEntryOrOpen!0 (select (arr!16076 a!3235) j!176) a!3235 mask!3524) lt!242280)))

(declare-fun b!526739 () Bool)

(declare-fun e!306970 () SeekEntryResult!4540)

(assert (=> b!526739 (= e!306970 (MissingZero!4540 (index!20374 lt!242279)))))

(declare-fun b!526740 () Bool)

(declare-fun e!306971 () SeekEntryResult!4540)

(assert (=> b!526740 (= e!306971 (Found!4540 (index!20374 lt!242279)))))

(declare-fun b!526741 () Bool)

(declare-fun c!61972 () Bool)

(declare-fun lt!242281 () (_ BitVec 64))

(assert (=> b!526741 (= c!61972 (= lt!242281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!526741 (= e!306971 e!306970)))

(declare-fun b!526742 () Bool)

(assert (=> b!526742 (= e!306972 e!306971)))

(assert (=> b!526742 (= lt!242281 (select (arr!16076 a!3235) (index!20374 lt!242279)))))

(declare-fun c!61974 () Bool)

(assert (=> b!526742 (= c!61974 (= lt!242281 (select (arr!16076 a!3235) j!176)))))

(declare-fun b!526743 () Bool)

(assert (=> b!526743 (= e!306970 (seekKeyOrZeroReturnVacant!0 (x!49348 lt!242279) (index!20374 lt!242279) (index!20374 lt!242279) (select (arr!16076 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!526744 () Bool)

(assert (=> b!526744 (= e!306972 Undefined!4540)))

(assert (= (and d!80573 c!61973) b!526744))

(assert (= (and d!80573 (not c!61973)) b!526742))

(assert (= (and b!526742 c!61974) b!526740))

(assert (= (and b!526742 (not c!61974)) b!526741))

(assert (= (and b!526741 c!61972) b!526739))

(assert (= (and b!526741 (not c!61972)) b!526743))

(declare-fun m!507015 () Bool)

(assert (=> d!80573 m!507015))

(assert (=> d!80573 m!506873))

(assert (=> d!80573 m!506893))

(declare-fun m!507017 () Bool)

(assert (=> d!80573 m!507017))

(declare-fun m!507019 () Bool)

(assert (=> d!80573 m!507019))

(assert (=> d!80573 m!506893))

(assert (=> d!80573 m!506873))

(declare-fun m!507021 () Bool)

(assert (=> d!80573 m!507021))

(assert (=> d!80573 m!506875))

(declare-fun m!507023 () Bool)

(assert (=> b!526742 m!507023))

(assert (=> b!526743 m!506873))

(declare-fun m!507025 () Bool)

(assert (=> b!526743 m!507025))

(assert (=> b!526627 d!80573))

(declare-fun d!80575 () Bool)

(assert (=> d!80575 (= (index!20374 lt!242208) i!1204)))

(declare-fun lt!242284 () Unit!16606)

(declare-fun choose!104 (array!33449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16606)

(assert (=> d!80575 (= lt!242284 (choose!104 a!3235 i!1204 k0!2280 j!176 lt!242202 #b00000000000000000000000000000000 (index!20374 lt!242208) (x!49348 lt!242208) mask!3524))))

(assert (=> d!80575 (validMask!0 mask!3524)))

(assert (=> d!80575 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242202 #b00000000000000000000000000000000 (index!20374 lt!242208) (x!49348 lt!242208) mask!3524) lt!242284)))

(declare-fun bs!16495 () Bool)

(assert (= bs!16495 d!80575))

(declare-fun m!507027 () Bool)

(assert (=> bs!16495 m!507027))

(assert (=> bs!16495 m!506875))

(assert (=> b!526628 d!80575))

(declare-fun d!80577 () Bool)

(declare-fun lt!242290 () (_ BitVec 32))

(declare-fun lt!242289 () (_ BitVec 32))

(assert (=> d!80577 (= lt!242290 (bvmul (bvxor lt!242289 (bvlshr lt!242289 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80577 (= lt!242289 ((_ extract 31 0) (bvand (bvxor lt!242203 (bvlshr lt!242203 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80577 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!323406 (let ((h!11203 ((_ extract 31 0) (bvand (bvxor lt!242203 (bvlshr lt!242203 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49352 (bvmul (bvxor h!11203 (bvlshr h!11203 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49352 (bvlshr x!49352 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!323406 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!323406 #b00000000000000000000000000000000))))))

(assert (=> d!80577 (= (toIndex!0 lt!242203 mask!3524) (bvand (bvxor lt!242290 (bvlshr lt!242290 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!526633 d!80577))

(declare-fun d!80581 () Bool)

(declare-fun lt!242292 () (_ BitVec 32))

(declare-fun lt!242291 () (_ BitVec 32))

(assert (=> d!80581 (= lt!242292 (bvmul (bvxor lt!242291 (bvlshr lt!242291 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80581 (= lt!242291 ((_ extract 31 0) (bvand (bvxor (select (arr!16076 a!3235) j!176) (bvlshr (select (arr!16076 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80581 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!323406 (let ((h!11203 ((_ extract 31 0) (bvand (bvxor (select (arr!16076 a!3235) j!176) (bvlshr (select (arr!16076 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49352 (bvmul (bvxor h!11203 (bvlshr h!11203 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49352 (bvlshr x!49352 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!323406 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!323406 #b00000000000000000000000000000000))))))

(assert (=> d!80581 (= (toIndex!0 (select (arr!16076 a!3235) j!176) mask!3524) (bvand (bvxor lt!242292 (bvlshr lt!242292 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!526633 d!80581))

(declare-fun bm!31846 () Bool)

(declare-fun call!31849 () Bool)

(assert (=> bm!31846 (= call!31849 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!526757 () Bool)

(declare-fun e!306982 () Bool)

(assert (=> b!526757 (= e!306982 call!31849)))

(declare-fun b!526758 () Bool)

(declare-fun e!306983 () Bool)

(assert (=> b!526758 (= e!306983 call!31849)))

(declare-fun b!526759 () Bool)

(assert (=> b!526759 (= e!306983 e!306982)))

(declare-fun lt!242307 () (_ BitVec 64))

(assert (=> b!526759 (= lt!242307 (select (arr!16076 a!3235) j!176))))

(declare-fun lt!242306 () Unit!16606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33449 (_ BitVec 64) (_ BitVec 32)) Unit!16606)

(assert (=> b!526759 (= lt!242306 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!242307 j!176))))

(assert (=> b!526759 (arrayContainsKey!0 a!3235 lt!242307 #b00000000000000000000000000000000)))

(declare-fun lt!242305 () Unit!16606)

(assert (=> b!526759 (= lt!242305 lt!242306)))

(declare-fun res!323414 () Bool)

(assert (=> b!526759 (= res!323414 (= (seekEntryOrOpen!0 (select (arr!16076 a!3235) j!176) a!3235 mask!3524) (Found!4540 j!176)))))

(assert (=> b!526759 (=> (not res!323414) (not e!306982))))

(declare-fun d!80583 () Bool)

(declare-fun res!323415 () Bool)

(declare-fun e!306984 () Bool)

(assert (=> d!80583 (=> res!323415 e!306984)))

(assert (=> d!80583 (= res!323415 (bvsge j!176 (size!16441 a!3235)))))

(assert (=> d!80583 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!306984)))

(declare-fun b!526756 () Bool)

(assert (=> b!526756 (= e!306984 e!306983)))

(declare-fun c!61977 () Bool)

(assert (=> b!526756 (= c!61977 (validKeyInArray!0 (select (arr!16076 a!3235) j!176)))))

(assert (= (and d!80583 (not res!323415)) b!526756))

(assert (= (and b!526756 c!61977) b!526759))

(assert (= (and b!526756 (not c!61977)) b!526758))

(assert (= (and b!526759 res!323414) b!526757))

(assert (= (or b!526757 b!526758) bm!31846))

(declare-fun m!507035 () Bool)

(assert (=> bm!31846 m!507035))

(assert (=> b!526759 m!506873))

(declare-fun m!507037 () Bool)

(assert (=> b!526759 m!507037))

(declare-fun m!507039 () Bool)

(assert (=> b!526759 m!507039))

(assert (=> b!526759 m!506873))

(assert (=> b!526759 m!506907))

(assert (=> b!526756 m!506873))

(assert (=> b!526756 m!506873))

(assert (=> b!526756 m!506899))

(assert (=> b!526633 d!80583))

(declare-fun b!526805 () Bool)

(declare-fun e!307010 () Bool)

(declare-fun e!307011 () Bool)

(assert (=> b!526805 (= e!307010 e!307011)))

(declare-fun res!323432 () Bool)

(declare-fun lt!242318 () SeekEntryResult!4540)

(assert (=> b!526805 (= res!323432 (and ((_ is Intermediate!4540) lt!242318) (not (undefined!5352 lt!242318)) (bvslt (x!49348 lt!242318) #b01111111111111111111111111111110) (bvsge (x!49348 lt!242318) #b00000000000000000000000000000000) (bvsge (x!49348 lt!242318) #b00000000000000000000000000000000)))))

(assert (=> b!526805 (=> (not res!323432) (not e!307011))))

(declare-fun b!526806 () Bool)

(declare-fun e!307013 () SeekEntryResult!4540)

(assert (=> b!526806 (= e!307013 (Intermediate!4540 false lt!242202 #b00000000000000000000000000000000))))

(declare-fun b!526807 () Bool)

(assert (=> b!526807 (and (bvsge (index!20374 lt!242318) #b00000000000000000000000000000000) (bvslt (index!20374 lt!242318) (size!16441 a!3235)))))

(declare-fun res!323431 () Bool)

(assert (=> b!526807 (= res!323431 (= (select (arr!16076 a!3235) (index!20374 lt!242318)) (select (arr!16076 a!3235) j!176)))))

(declare-fun e!307014 () Bool)

(assert (=> b!526807 (=> res!323431 e!307014)))

(assert (=> b!526807 (= e!307011 e!307014)))

(declare-fun b!526808 () Bool)

(declare-fun e!307012 () SeekEntryResult!4540)

(assert (=> b!526808 (= e!307012 (Intermediate!4540 true lt!242202 #b00000000000000000000000000000000))))

(declare-fun b!526809 () Bool)

(assert (=> b!526809 (and (bvsge (index!20374 lt!242318) #b00000000000000000000000000000000) (bvslt (index!20374 lt!242318) (size!16441 a!3235)))))

(declare-fun res!323433 () Bool)

(assert (=> b!526809 (= res!323433 (= (select (arr!16076 a!3235) (index!20374 lt!242318)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!526809 (=> res!323433 e!307014)))

(declare-fun b!526810 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526810 (= e!307013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242202 #b00000000000000000000000000000000 mask!3524) (select (arr!16076 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!526811 () Bool)

(assert (=> b!526811 (= e!307012 e!307013)))

(declare-fun c!61994 () Bool)

(declare-fun lt!242319 () (_ BitVec 64))

(assert (=> b!526811 (= c!61994 (or (= lt!242319 (select (arr!16076 a!3235) j!176)) (= (bvadd lt!242319 lt!242319) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526812 () Bool)

(assert (=> b!526812 (and (bvsge (index!20374 lt!242318) #b00000000000000000000000000000000) (bvslt (index!20374 lt!242318) (size!16441 a!3235)))))

(assert (=> b!526812 (= e!307014 (= (select (arr!16076 a!3235) (index!20374 lt!242318)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!526813 () Bool)

(assert (=> b!526813 (= e!307010 (bvsge (x!49348 lt!242318) #b01111111111111111111111111111110))))

(declare-fun d!80593 () Bool)

(assert (=> d!80593 e!307010))

(declare-fun c!61995 () Bool)

(assert (=> d!80593 (= c!61995 (and ((_ is Intermediate!4540) lt!242318) (undefined!5352 lt!242318)))))

(assert (=> d!80593 (= lt!242318 e!307012)))

(declare-fun c!61993 () Bool)

(assert (=> d!80593 (= c!61993 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80593 (= lt!242319 (select (arr!16076 a!3235) lt!242202))))

(assert (=> d!80593 (validMask!0 mask!3524)))

(assert (=> d!80593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242202 (select (arr!16076 a!3235) j!176) a!3235 mask!3524) lt!242318)))

(assert (= (and d!80593 c!61993) b!526808))

(assert (= (and d!80593 (not c!61993)) b!526811))

(assert (= (and b!526811 c!61994) b!526806))

(assert (= (and b!526811 (not c!61994)) b!526810))

(assert (= (and d!80593 c!61995) b!526813))

(assert (= (and d!80593 (not c!61995)) b!526805))

(assert (= (and b!526805 res!323432) b!526807))

(assert (= (and b!526807 (not res!323431)) b!526809))

(assert (= (and b!526809 (not res!323433)) b!526812))

(declare-fun m!507049 () Bool)

(assert (=> b!526812 m!507049))

(assert (=> b!526809 m!507049))

(declare-fun m!507051 () Bool)

(assert (=> d!80593 m!507051))

(assert (=> d!80593 m!506875))

(declare-fun m!507053 () Bool)

(assert (=> b!526810 m!507053))

(assert (=> b!526810 m!507053))

(assert (=> b!526810 m!506873))

(declare-fun m!507055 () Bool)

(assert (=> b!526810 m!507055))

(assert (=> b!526807 m!507049))

(assert (=> b!526633 d!80593))

(declare-fun d!80601 () Bool)

(assert (=> d!80601 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!242328 () Unit!16606)

(declare-fun choose!38 (array!33449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16606)

(assert (=> d!80601 (= lt!242328 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80601 (validMask!0 mask!3524)))

(assert (=> d!80601 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!242328)))

(declare-fun bs!16497 () Bool)

(assert (= bs!16497 d!80601))

(assert (=> bs!16497 m!506895))

(declare-fun m!507057 () Bool)

(assert (=> bs!16497 m!507057))

(assert (=> bs!16497 m!506875))

(assert (=> b!526633 d!80601))

(declare-fun b!526826 () Bool)

(declare-fun e!307021 () Bool)

(declare-fun e!307022 () Bool)

(assert (=> b!526826 (= e!307021 e!307022)))

(declare-fun res!323435 () Bool)

(declare-fun lt!242329 () SeekEntryResult!4540)

(assert (=> b!526826 (= res!323435 (and ((_ is Intermediate!4540) lt!242329) (not (undefined!5352 lt!242329)) (bvslt (x!49348 lt!242329) #b01111111111111111111111111111110) (bvsge (x!49348 lt!242329) #b00000000000000000000000000000000) (bvsge (x!49348 lt!242329) #b00000000000000000000000000000000)))))

(assert (=> b!526826 (=> (not res!323435) (not e!307022))))

(declare-fun b!526827 () Bool)

(declare-fun e!307024 () SeekEntryResult!4540)

(assert (=> b!526827 (= e!307024 (Intermediate!4540 false lt!242209 #b00000000000000000000000000000000))))

(declare-fun b!526828 () Bool)

(assert (=> b!526828 (and (bvsge (index!20374 lt!242329) #b00000000000000000000000000000000) (bvslt (index!20374 lt!242329) (size!16441 lt!242207)))))

(declare-fun res!323434 () Bool)

(assert (=> b!526828 (= res!323434 (= (select (arr!16076 lt!242207) (index!20374 lt!242329)) lt!242203))))

(declare-fun e!307025 () Bool)

(assert (=> b!526828 (=> res!323434 e!307025)))

(assert (=> b!526828 (= e!307022 e!307025)))

(declare-fun b!526829 () Bool)

(declare-fun e!307023 () SeekEntryResult!4540)

(assert (=> b!526829 (= e!307023 (Intermediate!4540 true lt!242209 #b00000000000000000000000000000000))))

(declare-fun b!526830 () Bool)

(assert (=> b!526830 (and (bvsge (index!20374 lt!242329) #b00000000000000000000000000000000) (bvslt (index!20374 lt!242329) (size!16441 lt!242207)))))

(declare-fun res!323436 () Bool)

(assert (=> b!526830 (= res!323436 (= (select (arr!16076 lt!242207) (index!20374 lt!242329)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!526830 (=> res!323436 e!307025)))

(declare-fun b!526831 () Bool)

(assert (=> b!526831 (= e!307024 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242209 #b00000000000000000000000000000000 mask!3524) lt!242203 lt!242207 mask!3524))))

(declare-fun b!526832 () Bool)

(assert (=> b!526832 (= e!307023 e!307024)))

(declare-fun c!62003 () Bool)

(declare-fun lt!242330 () (_ BitVec 64))

(assert (=> b!526832 (= c!62003 (or (= lt!242330 lt!242203) (= (bvadd lt!242330 lt!242330) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526833 () Bool)

(assert (=> b!526833 (and (bvsge (index!20374 lt!242329) #b00000000000000000000000000000000) (bvslt (index!20374 lt!242329) (size!16441 lt!242207)))))

(assert (=> b!526833 (= e!307025 (= (select (arr!16076 lt!242207) (index!20374 lt!242329)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!526834 () Bool)

(assert (=> b!526834 (= e!307021 (bvsge (x!49348 lt!242329) #b01111111111111111111111111111110))))

(declare-fun d!80603 () Bool)

(assert (=> d!80603 e!307021))

(declare-fun c!62004 () Bool)

(assert (=> d!80603 (= c!62004 (and ((_ is Intermediate!4540) lt!242329) (undefined!5352 lt!242329)))))

(assert (=> d!80603 (= lt!242329 e!307023)))

(declare-fun c!62002 () Bool)

(assert (=> d!80603 (= c!62002 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80603 (= lt!242330 (select (arr!16076 lt!242207) lt!242209))))

(assert (=> d!80603 (validMask!0 mask!3524)))

(assert (=> d!80603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242209 lt!242203 lt!242207 mask!3524) lt!242329)))

(assert (= (and d!80603 c!62002) b!526829))

(assert (= (and d!80603 (not c!62002)) b!526832))

(assert (= (and b!526832 c!62003) b!526827))

(assert (= (and b!526832 (not c!62003)) b!526831))

(assert (= (and d!80603 c!62004) b!526834))

(assert (= (and d!80603 (not c!62004)) b!526826))

(assert (= (and b!526826 res!323435) b!526828))

(assert (= (and b!526828 (not res!323434)) b!526830))

(assert (= (and b!526830 (not res!323436)) b!526833))

(declare-fun m!507059 () Bool)

(assert (=> b!526833 m!507059))

(assert (=> b!526830 m!507059))

(declare-fun m!507061 () Bool)

(assert (=> d!80603 m!507061))

(assert (=> d!80603 m!506875))

(declare-fun m!507063 () Bool)

(assert (=> b!526831 m!507063))

(assert (=> b!526831 m!507063))

(declare-fun m!507065 () Bool)

(assert (=> b!526831 m!507065))

(assert (=> b!526828 m!507059))

(assert (=> b!526633 d!80603))

(declare-fun d!80605 () Bool)

(declare-fun e!307037 () Bool)

(assert (=> d!80605 e!307037))

(declare-fun res!323439 () Bool)

(assert (=> d!80605 (=> (not res!323439) (not e!307037))))

(assert (=> d!80605 (= res!323439 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16441 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16441 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16441 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16441 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16441 a!3235))))))

(declare-fun lt!242342 () Unit!16606)

(declare-fun choose!47 (array!33449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16606)

(assert (=> d!80605 (= lt!242342 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!242202 #b00000000000000000000000000000000 (index!20374 lt!242208) (x!49348 lt!242208) mask!3524))))

(assert (=> d!80605 (validMask!0 mask!3524)))

(assert (=> d!80605 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242202 #b00000000000000000000000000000000 (index!20374 lt!242208) (x!49348 lt!242208) mask!3524) lt!242342)))

(declare-fun b!526855 () Bool)

(assert (=> b!526855 (= e!307037 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242202 (select (store (arr!16076 a!3235) i!1204 k0!2280) j!176) (array!33450 (store (arr!16076 a!3235) i!1204 k0!2280) (size!16441 a!3235)) mask!3524) (Intermediate!4540 false (index!20374 lt!242208) (x!49348 lt!242208))))))

(assert (= (and d!80605 res!323439) b!526855))

(declare-fun m!507081 () Bool)

(assert (=> d!80605 m!507081))

(assert (=> d!80605 m!506875))

(assert (=> b!526855 m!506883))

(assert (=> b!526855 m!506889))

(assert (=> b!526855 m!506889))

(declare-fun m!507083 () Bool)

(assert (=> b!526855 m!507083))

(assert (=> b!526634 d!80605))

(declare-fun b!526862 () Bool)

(declare-fun e!307041 () Bool)

(declare-fun e!307042 () Bool)

(assert (=> b!526862 (= e!307041 e!307042)))

(declare-fun res!323441 () Bool)

(declare-fun lt!242346 () SeekEntryResult!4540)

(assert (=> b!526862 (= res!323441 (and ((_ is Intermediate!4540) lt!242346) (not (undefined!5352 lt!242346)) (bvslt (x!49348 lt!242346) #b01111111111111111111111111111110) (bvsge (x!49348 lt!242346) #b00000000000000000000000000000000) (bvsge (x!49348 lt!242346) #b00000000000000000000000000000000)))))

(assert (=> b!526862 (=> (not res!323441) (not e!307042))))

(declare-fun b!526863 () Bool)

(declare-fun e!307044 () SeekEntryResult!4540)

(assert (=> b!526863 (= e!307044 (Intermediate!4540 false lt!242202 #b00000000000000000000000000000000))))

(declare-fun b!526864 () Bool)

(assert (=> b!526864 (and (bvsge (index!20374 lt!242346) #b00000000000000000000000000000000) (bvslt (index!20374 lt!242346) (size!16441 lt!242207)))))

(declare-fun res!323440 () Bool)

(assert (=> b!526864 (= res!323440 (= (select (arr!16076 lt!242207) (index!20374 lt!242346)) lt!242203))))

(declare-fun e!307045 () Bool)

(assert (=> b!526864 (=> res!323440 e!307045)))

(assert (=> b!526864 (= e!307042 e!307045)))

(declare-fun b!526865 () Bool)

(declare-fun e!307043 () SeekEntryResult!4540)

(assert (=> b!526865 (= e!307043 (Intermediate!4540 true lt!242202 #b00000000000000000000000000000000))))

(declare-fun b!526866 () Bool)

(assert (=> b!526866 (and (bvsge (index!20374 lt!242346) #b00000000000000000000000000000000) (bvslt (index!20374 lt!242346) (size!16441 lt!242207)))))

(declare-fun res!323442 () Bool)

(assert (=> b!526866 (= res!323442 (= (select (arr!16076 lt!242207) (index!20374 lt!242346)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!526866 (=> res!323442 e!307045)))

(declare-fun b!526867 () Bool)

(assert (=> b!526867 (= e!307044 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242202 #b00000000000000000000000000000000 mask!3524) lt!242203 lt!242207 mask!3524))))

(declare-fun b!526868 () Bool)

(assert (=> b!526868 (= e!307043 e!307044)))

(declare-fun c!62018 () Bool)

(declare-fun lt!242347 () (_ BitVec 64))

(assert (=> b!526868 (= c!62018 (or (= lt!242347 lt!242203) (= (bvadd lt!242347 lt!242347) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526869 () Bool)

(assert (=> b!526869 (and (bvsge (index!20374 lt!242346) #b00000000000000000000000000000000) (bvslt (index!20374 lt!242346) (size!16441 lt!242207)))))

(assert (=> b!526869 (= e!307045 (= (select (arr!16076 lt!242207) (index!20374 lt!242346)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!526870 () Bool)

(assert (=> b!526870 (= e!307041 (bvsge (x!49348 lt!242346) #b01111111111111111111111111111110))))

(declare-fun d!80611 () Bool)

(assert (=> d!80611 e!307041))

(declare-fun c!62019 () Bool)

(assert (=> d!80611 (= c!62019 (and ((_ is Intermediate!4540) lt!242346) (undefined!5352 lt!242346)))))

(assert (=> d!80611 (= lt!242346 e!307043)))

(declare-fun c!62017 () Bool)

(assert (=> d!80611 (= c!62017 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80611 (= lt!242347 (select (arr!16076 lt!242207) lt!242202))))

(assert (=> d!80611 (validMask!0 mask!3524)))

(assert (=> d!80611 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242202 lt!242203 lt!242207 mask!3524) lt!242346)))

(assert (= (and d!80611 c!62017) b!526865))

(assert (= (and d!80611 (not c!62017)) b!526868))

(assert (= (and b!526868 c!62018) b!526863))

(assert (= (and b!526868 (not c!62018)) b!526867))

(assert (= (and d!80611 c!62019) b!526870))

(assert (= (and d!80611 (not c!62019)) b!526862))

(assert (= (and b!526862 res!323441) b!526864))

(assert (= (and b!526864 (not res!323440)) b!526866))

(assert (= (and b!526866 (not res!323442)) b!526869))

(declare-fun m!507089 () Bool)

(assert (=> b!526869 m!507089))

(assert (=> b!526866 m!507089))

(declare-fun m!507093 () Bool)

(assert (=> d!80611 m!507093))

(assert (=> d!80611 m!506875))

(assert (=> b!526867 m!507053))

(assert (=> b!526867 m!507053))

(declare-fun m!507099 () Bool)

(assert (=> b!526867 m!507099))

(assert (=> b!526864 m!507089))

(assert (=> b!526634 d!80611))

(declare-fun bm!31847 () Bool)

(declare-fun call!31850 () Bool)

(assert (=> bm!31847 (= call!31850 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!526872 () Bool)

(declare-fun e!307046 () Bool)

(assert (=> b!526872 (= e!307046 call!31850)))

(declare-fun b!526873 () Bool)

(declare-fun e!307047 () Bool)

(assert (=> b!526873 (= e!307047 call!31850)))

(declare-fun b!526874 () Bool)

(assert (=> b!526874 (= e!307047 e!307046)))

(declare-fun lt!242350 () (_ BitVec 64))

(assert (=> b!526874 (= lt!242350 (select (arr!16076 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!242349 () Unit!16606)

(assert (=> b!526874 (= lt!242349 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!242350 #b00000000000000000000000000000000))))

(assert (=> b!526874 (arrayContainsKey!0 a!3235 lt!242350 #b00000000000000000000000000000000)))

(declare-fun lt!242348 () Unit!16606)

(assert (=> b!526874 (= lt!242348 lt!242349)))

(declare-fun res!323443 () Bool)

(assert (=> b!526874 (= res!323443 (= (seekEntryOrOpen!0 (select (arr!16076 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4540 #b00000000000000000000000000000000)))))

(assert (=> b!526874 (=> (not res!323443) (not e!307046))))

(declare-fun d!80613 () Bool)

(declare-fun res!323444 () Bool)

(declare-fun e!307048 () Bool)

(assert (=> d!80613 (=> res!323444 e!307048)))

(assert (=> d!80613 (= res!323444 (bvsge #b00000000000000000000000000000000 (size!16441 a!3235)))))

(assert (=> d!80613 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!307048)))

(declare-fun b!526871 () Bool)

(assert (=> b!526871 (= e!307048 e!307047)))

(declare-fun c!62020 () Bool)

(assert (=> b!526871 (= c!62020 (validKeyInArray!0 (select (arr!16076 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80613 (not res!323444)) b!526871))

(assert (= (and b!526871 c!62020) b!526874))

(assert (= (and b!526871 (not c!62020)) b!526873))

(assert (= (and b!526874 res!323443) b!526872))

(assert (= (or b!526872 b!526873) bm!31847))

(declare-fun m!507103 () Bool)

(assert (=> bm!31847 m!507103))

(declare-fun m!507105 () Bool)

(assert (=> b!526874 m!507105))

(declare-fun m!507107 () Bool)

(assert (=> b!526874 m!507107))

(declare-fun m!507109 () Bool)

(assert (=> b!526874 m!507109))

(assert (=> b!526874 m!507105))

(declare-fun m!507111 () Bool)

(assert (=> b!526874 m!507111))

(assert (=> b!526871 m!507105))

(assert (=> b!526871 m!507105))

(declare-fun m!507113 () Bool)

(assert (=> b!526871 m!507113))

(assert (=> b!526623 d!80613))

(declare-fun d!80617 () Bool)

(assert (=> d!80617 (= (validKeyInArray!0 (select (arr!16076 a!3235) j!176)) (and (not (= (select (arr!16076 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16076 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!526630 d!80617))

(declare-fun d!80619 () Bool)

(declare-fun res!323449 () Bool)

(declare-fun e!307059 () Bool)

(assert (=> d!80619 (=> res!323449 e!307059)))

(assert (=> d!80619 (= res!323449 (= (select (arr!16076 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80619 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!307059)))

(declare-fun b!526891 () Bool)

(declare-fun e!307060 () Bool)

(assert (=> b!526891 (= e!307059 e!307060)))

(declare-fun res!323450 () Bool)

(assert (=> b!526891 (=> (not res!323450) (not e!307060))))

(assert (=> b!526891 (= res!323450 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16441 a!3235)))))

(declare-fun b!526892 () Bool)

(assert (=> b!526892 (= e!307060 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80619 (not res!323449)) b!526891))

(assert (= (and b!526891 res!323450) b!526892))

(assert (=> d!80619 m!507105))

(declare-fun m!507117 () Bool)

(assert (=> b!526892 m!507117))

(assert (=> b!526635 d!80619))

(declare-fun d!80623 () Bool)

(assert (=> d!80623 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!526636 d!80623))

(declare-fun bm!31853 () Bool)

(declare-fun call!31856 () Bool)

(declare-fun c!62035 () Bool)

(assert (=> bm!31853 (= call!31856 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62035 (Cons!10269 (select (arr!16076 a!3235) #b00000000000000000000000000000000) Nil!10270) Nil!10270)))))

(declare-fun b!526933 () Bool)

(declare-fun e!307091 () Bool)

(assert (=> b!526933 (= e!307091 call!31856)))

(declare-fun b!526934 () Bool)

(declare-fun e!307092 () Bool)

(declare-fun contains!2755 (List!10273 (_ BitVec 64)) Bool)

(assert (=> b!526934 (= e!307092 (contains!2755 Nil!10270 (select (arr!16076 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!526935 () Bool)

(assert (=> b!526935 (= e!307091 call!31856)))

(declare-fun b!526937 () Bool)

(declare-fun e!307093 () Bool)

(assert (=> b!526937 (= e!307093 e!307091)))

(assert (=> b!526937 (= c!62035 (validKeyInArray!0 (select (arr!16076 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80625 () Bool)

(declare-fun res!323476 () Bool)

(declare-fun e!307090 () Bool)

(assert (=> d!80625 (=> res!323476 e!307090)))

(assert (=> d!80625 (= res!323476 (bvsge #b00000000000000000000000000000000 (size!16441 a!3235)))))

(assert (=> d!80625 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10270) e!307090)))

(declare-fun b!526936 () Bool)

(assert (=> b!526936 (= e!307090 e!307093)))

(declare-fun res!323478 () Bool)

(assert (=> b!526936 (=> (not res!323478) (not e!307093))))

(assert (=> b!526936 (= res!323478 (not e!307092))))

(declare-fun res!323477 () Bool)

(assert (=> b!526936 (=> (not res!323477) (not e!307092))))

(assert (=> b!526936 (= res!323477 (validKeyInArray!0 (select (arr!16076 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80625 (not res!323476)) b!526936))

(assert (= (and b!526936 res!323477) b!526934))

(assert (= (and b!526936 res!323478) b!526937))

(assert (= (and b!526937 c!62035) b!526933))

(assert (= (and b!526937 (not c!62035)) b!526935))

(assert (= (or b!526933 b!526935) bm!31853))

(assert (=> bm!31853 m!507105))

(declare-fun m!507135 () Bool)

(assert (=> bm!31853 m!507135))

(assert (=> b!526934 m!507105))

(assert (=> b!526934 m!507105))

(declare-fun m!507137 () Bool)

(assert (=> b!526934 m!507137))

(assert (=> b!526937 m!507105))

(assert (=> b!526937 m!507105))

(assert (=> b!526937 m!507113))

(assert (=> b!526936 m!507105))

(assert (=> b!526936 m!507105))

(assert (=> b!526936 m!507113))

(assert (=> b!526625 d!80625))

(check-sat (not d!80611) (not b!526810) (not b!526756) (not b!526871) (not b!526759) (not d!80601) (not b!526874) (not d!80575) (not d!80605) (not b!526937) (not d!80603) (not b!526831) (not b!526737) (not d!80567) (not bm!31853) (not bm!31846) (not b!526936) (not d!80573) (not b!526934) (not bm!31847) (not b!526743) (not d!80593) (not b!526855) (not b!526867) (not b!526892))
(check-sat)
