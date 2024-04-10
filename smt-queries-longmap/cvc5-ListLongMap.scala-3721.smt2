; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51254 () Bool)

(assert start!51254)

(declare-fun b!559584 () Bool)

(declare-fun e!322382 () Bool)

(declare-fun e!322379 () Bool)

(assert (=> b!559584 (= e!322382 e!322379)))

(declare-fun res!350980 () Bool)

(assert (=> b!559584 (=> (not res!350980) (not e!322379))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5342 0))(
  ( (MissingZero!5342 (index!23595 (_ BitVec 32))) (Found!5342 (index!23596 (_ BitVec 32))) (Intermediate!5342 (undefined!6154 Bool) (index!23597 (_ BitVec 32)) (x!52508 (_ BitVec 32))) (Undefined!5342) (MissingVacant!5342 (index!23598 (_ BitVec 32))) )
))
(declare-fun lt!254330 () SeekEntryResult!5342)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35182 0))(
  ( (array!35183 (arr!16893 (Array (_ BitVec 32) (_ BitVec 64))) (size!17257 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35182)

(declare-fun lt!254326 () (_ BitVec 64))

(declare-fun lt!254325 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35182 (_ BitVec 32)) SeekEntryResult!5342)

(assert (=> b!559584 (= res!350980 (= lt!254330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254325 lt!254326 (array!35183 (store (arr!16893 a!3118) i!1132 k!1914) (size!17257 a!3118)) mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!254329 () (_ BitVec 32))

(assert (=> b!559584 (= lt!254330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254329 (select (arr!16893 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559584 (= lt!254325 (toIndex!0 lt!254326 mask!3119))))

(assert (=> b!559584 (= lt!254326 (select (store (arr!16893 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!559584 (= lt!254329 (toIndex!0 (select (arr!16893 a!3118) j!142) mask!3119))))

(declare-fun b!559585 () Bool)

(declare-fun e!322377 () Bool)

(declare-fun e!322378 () Bool)

(assert (=> b!559585 (= e!322377 e!322378)))

(declare-fun res!350974 () Bool)

(assert (=> b!559585 (=> res!350974 e!322378)))

(declare-fun lt!254328 () (_ BitVec 64))

(assert (=> b!559585 (= res!350974 (or (= lt!254328 (select (arr!16893 a!3118) j!142)) (= lt!254328 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!559585 (= lt!254328 (select (arr!16893 a!3118) (index!23597 lt!254330)))))

(declare-fun b!559586 () Bool)

(declare-fun res!350977 () Bool)

(assert (=> b!559586 (=> (not res!350977) (not e!322382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35182 (_ BitVec 32)) Bool)

(assert (=> b!559586 (= res!350977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!350978 () Bool)

(declare-fun e!322383 () Bool)

(assert (=> start!51254 (=> (not res!350978) (not e!322383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51254 (= res!350978 (validMask!0 mask!3119))))

(assert (=> start!51254 e!322383))

(assert (=> start!51254 true))

(declare-fun array_inv!12689 (array!35182) Bool)

(assert (=> start!51254 (array_inv!12689 a!3118)))

(declare-fun b!559587 () Bool)

(assert (=> b!559587 (= e!322383 e!322382)))

(declare-fun res!350976 () Bool)

(assert (=> b!559587 (=> (not res!350976) (not e!322382))))

(declare-fun lt!254331 () SeekEntryResult!5342)

(assert (=> b!559587 (= res!350976 (or (= lt!254331 (MissingZero!5342 i!1132)) (= lt!254331 (MissingVacant!5342 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35182 (_ BitVec 32)) SeekEntryResult!5342)

(assert (=> b!559587 (= lt!254331 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun lt!254332 () SeekEntryResult!5342)

(declare-fun b!559588 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35182 (_ BitVec 32)) SeekEntryResult!5342)

(assert (=> b!559588 (= e!322378 (= lt!254332 (seekKeyOrZeroReturnVacant!0 (x!52508 lt!254330) (index!23597 lt!254330) (index!23597 lt!254330) (select (arr!16893 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559589 () Bool)

(declare-fun res!350975 () Bool)

(assert (=> b!559589 (=> (not res!350975) (not e!322383))))

(declare-fun arrayContainsKey!0 (array!35182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559589 (= res!350975 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559590 () Bool)

(assert (=> b!559590 (= e!322379 (not (or (undefined!6154 lt!254330) (not (is-Intermediate!5342 lt!254330)) (let ((bdg!16975 (select (arr!16893 a!3118) (index!23597 lt!254330)))) (or (= bdg!16975 (select (arr!16893 a!3118) j!142)) (= bdg!16975 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23597 lt!254330) #b00000000000000000000000000000000) (bvsge (index!23597 lt!254330) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52508 lt!254330) #b01111111111111111111111111111110) (bvslt (x!52508 lt!254330) #b00000000000000000000000000000000) (= (select (store (arr!16893 a!3118) i!1132 k!1914) (index!23597 lt!254330)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!322381 () Bool)

(assert (=> b!559590 e!322381))

(declare-fun res!350981 () Bool)

(assert (=> b!559590 (=> (not res!350981) (not e!322381))))

(assert (=> b!559590 (= res!350981 (= lt!254332 (Found!5342 j!142)))))

(assert (=> b!559590 (= lt!254332 (seekEntryOrOpen!0 (select (arr!16893 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!559590 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17458 0))(
  ( (Unit!17459) )
))
(declare-fun lt!254327 () Unit!17458)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17458)

(assert (=> b!559590 (= lt!254327 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559591 () Bool)

(declare-fun res!350984 () Bool)

(assert (=> b!559591 (=> (not res!350984) (not e!322383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559591 (= res!350984 (validKeyInArray!0 (select (arr!16893 a!3118) j!142)))))

(declare-fun b!559592 () Bool)

(declare-fun res!350973 () Bool)

(assert (=> b!559592 (=> (not res!350973) (not e!322382))))

(declare-datatypes ((List!10973 0))(
  ( (Nil!10970) (Cons!10969 (h!11969 (_ BitVec 64)) (t!17201 List!10973)) )
))
(declare-fun arrayNoDuplicates!0 (array!35182 (_ BitVec 32) List!10973) Bool)

(assert (=> b!559592 (= res!350973 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10970))))

(declare-fun b!559593 () Bool)

(declare-fun res!350983 () Bool)

(assert (=> b!559593 (=> (not res!350983) (not e!322383))))

(assert (=> b!559593 (= res!350983 (validKeyInArray!0 k!1914))))

(declare-fun b!559594 () Bool)

(assert (=> b!559594 (= e!322381 e!322377)))

(declare-fun res!350982 () Bool)

(assert (=> b!559594 (=> res!350982 e!322377)))

(assert (=> b!559594 (= res!350982 (or (undefined!6154 lt!254330) (not (is-Intermediate!5342 lt!254330))))))

(declare-fun b!559595 () Bool)

(declare-fun res!350979 () Bool)

(assert (=> b!559595 (=> (not res!350979) (not e!322383))))

(assert (=> b!559595 (= res!350979 (and (= (size!17257 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17257 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17257 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51254 res!350978) b!559595))

(assert (= (and b!559595 res!350979) b!559591))

(assert (= (and b!559591 res!350984) b!559593))

(assert (= (and b!559593 res!350983) b!559589))

(assert (= (and b!559589 res!350975) b!559587))

(assert (= (and b!559587 res!350976) b!559586))

(assert (= (and b!559586 res!350977) b!559592))

(assert (= (and b!559592 res!350973) b!559584))

(assert (= (and b!559584 res!350980) b!559590))

(assert (= (and b!559590 res!350981) b!559594))

(assert (= (and b!559594 (not res!350982)) b!559585))

(assert (= (and b!559585 (not res!350974)) b!559588))

(declare-fun m!537411 () Bool)

(assert (=> b!559587 m!537411))

(declare-fun m!537413 () Bool)

(assert (=> b!559588 m!537413))

(assert (=> b!559588 m!537413))

(declare-fun m!537415 () Bool)

(assert (=> b!559588 m!537415))

(assert (=> b!559585 m!537413))

(declare-fun m!537417 () Bool)

(assert (=> b!559585 m!537417))

(declare-fun m!537419 () Bool)

(assert (=> start!51254 m!537419))

(declare-fun m!537421 () Bool)

(assert (=> start!51254 m!537421))

(declare-fun m!537423 () Bool)

(assert (=> b!559592 m!537423))

(declare-fun m!537425 () Bool)

(assert (=> b!559586 m!537425))

(assert (=> b!559590 m!537413))

(declare-fun m!537427 () Bool)

(assert (=> b!559590 m!537427))

(declare-fun m!537429 () Bool)

(assert (=> b!559590 m!537429))

(declare-fun m!537431 () Bool)

(assert (=> b!559590 m!537431))

(assert (=> b!559590 m!537413))

(declare-fun m!537433 () Bool)

(assert (=> b!559590 m!537433))

(assert (=> b!559590 m!537417))

(declare-fun m!537435 () Bool)

(assert (=> b!559590 m!537435))

(assert (=> b!559584 m!537413))

(declare-fun m!537437 () Bool)

(assert (=> b!559584 m!537437))

(assert (=> b!559584 m!537413))

(declare-fun m!537439 () Bool)

(assert (=> b!559584 m!537439))

(declare-fun m!537441 () Bool)

(assert (=> b!559584 m!537441))

(declare-fun m!537443 () Bool)

(assert (=> b!559584 m!537443))

(assert (=> b!559584 m!537413))

(declare-fun m!537445 () Bool)

(assert (=> b!559584 m!537445))

(assert (=> b!559584 m!537427))

(declare-fun m!537447 () Bool)

(assert (=> b!559593 m!537447))

(declare-fun m!537449 () Bool)

(assert (=> b!559589 m!537449))

(assert (=> b!559591 m!537413))

(assert (=> b!559591 m!537413))

(declare-fun m!537451 () Bool)

(assert (=> b!559591 m!537451))

(push 1)

(assert (not b!559586))

(assert (not b!559584))

(assert (not b!559591))

(assert (not b!559588))

(assert (not b!559592))

(assert (not b!559593))

(assert (not b!559590))

(assert (not start!51254))

(assert (not b!559589))

(assert (not b!559587))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!559699 () Bool)

(declare-fun e!322454 () Bool)

(declare-fun e!322452 () Bool)

(assert (=> b!559699 (= e!322454 e!322452)))

(declare-fun res!351079 () Bool)

(assert (=> b!559699 (=> (not res!351079) (not e!322452))))

(declare-fun e!322453 () Bool)

(assert (=> b!559699 (= res!351079 (not e!322453))))

(declare-fun res!351078 () Bool)

(assert (=> b!559699 (=> (not res!351078) (not e!322453))))

(assert (=> b!559699 (= res!351078 (validKeyInArray!0 (select (arr!16893 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559700 () Bool)

(declare-fun e!322455 () Bool)

(declare-fun call!32441 () Bool)

(assert (=> b!559700 (= e!322455 call!32441)))

(declare-fun b!559701 () Bool)

(assert (=> b!559701 (= e!322452 e!322455)))

(declare-fun c!64655 () Bool)

(assert (=> b!559701 (= c!64655 (validKeyInArray!0 (select (arr!16893 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83793 () Bool)

(declare-fun res!351080 () Bool)

(assert (=> d!83793 (=> res!351080 e!322454)))

(assert (=> d!83793 (= res!351080 (bvsge #b00000000000000000000000000000000 (size!17257 a!3118)))))

(assert (=> d!83793 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10970) e!322454)))

(declare-fun b!559702 () Bool)

(assert (=> b!559702 (= e!322455 call!32441)))

(declare-fun bm!32438 () Bool)

(assert (=> bm!32438 (= call!32441 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64655 (Cons!10969 (select (arr!16893 a!3118) #b00000000000000000000000000000000) Nil!10970) Nil!10970)))))

(declare-fun b!559703 () Bool)

(declare-fun contains!2860 (List!10973 (_ BitVec 64)) Bool)

(assert (=> b!559703 (= e!322453 (contains!2860 Nil!10970 (select (arr!16893 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83793 (not res!351080)) b!559699))

(assert (= (and b!559699 res!351078) b!559703))

(assert (= (and b!559699 res!351079) b!559701))

(assert (= (and b!559701 c!64655) b!559700))

(assert (= (and b!559701 (not c!64655)) b!559702))

(assert (= (or b!559700 b!559702) bm!32438))

(declare-fun m!537547 () Bool)

(assert (=> b!559699 m!537547))

(assert (=> b!559699 m!537547))

(declare-fun m!537549 () Bool)

(assert (=> b!559699 m!537549))

(assert (=> b!559701 m!537547))

(assert (=> b!559701 m!537547))

(assert (=> b!559701 m!537549))

(assert (=> bm!32438 m!537547))

(declare-fun m!537551 () Bool)

(assert (=> bm!32438 m!537551))

(assert (=> b!559703 m!537547))

(assert (=> b!559703 m!537547))

(declare-fun m!537553 () Bool)

(assert (=> b!559703 m!537553))

(assert (=> b!559592 d!83793))

(declare-fun d!83795 () Bool)

(declare-fun lt!254412 () SeekEntryResult!5342)

(assert (=> d!83795 (and (or (is-Undefined!5342 lt!254412) (not (is-Found!5342 lt!254412)) (and (bvsge (index!23596 lt!254412) #b00000000000000000000000000000000) (bvslt (index!23596 lt!254412) (size!17257 a!3118)))) (or (is-Undefined!5342 lt!254412) (is-Found!5342 lt!254412) (not (is-MissingZero!5342 lt!254412)) (and (bvsge (index!23595 lt!254412) #b00000000000000000000000000000000) (bvslt (index!23595 lt!254412) (size!17257 a!3118)))) (or (is-Undefined!5342 lt!254412) (is-Found!5342 lt!254412) (is-MissingZero!5342 lt!254412) (not (is-MissingVacant!5342 lt!254412)) (and (bvsge (index!23598 lt!254412) #b00000000000000000000000000000000) (bvslt (index!23598 lt!254412) (size!17257 a!3118)))) (or (is-Undefined!5342 lt!254412) (ite (is-Found!5342 lt!254412) (= (select (arr!16893 a!3118) (index!23596 lt!254412)) k!1914) (ite (is-MissingZero!5342 lt!254412) (= (select (arr!16893 a!3118) (index!23595 lt!254412)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5342 lt!254412) (= (select (arr!16893 a!3118) (index!23598 lt!254412)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!322487 () SeekEntryResult!5342)

(assert (=> d!83795 (= lt!254412 e!322487)))

(declare-fun c!64677 () Bool)

(declare-fun lt!254411 () SeekEntryResult!5342)

(assert (=> d!83795 (= c!64677 (and (is-Intermediate!5342 lt!254411) (undefined!6154 lt!254411)))))

(assert (=> d!83795 (= lt!254411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83795 (validMask!0 mask!3119)))

(assert (=> d!83795 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!254412)))

(declare-fun b!559754 () Bool)

(declare-fun e!322486 () SeekEntryResult!5342)

(assert (=> b!559754 (= e!322486 (MissingZero!5342 (index!23597 lt!254411)))))

(declare-fun b!559755 () Bool)

(declare-fun c!64676 () Bool)

(declare-fun lt!254413 () (_ BitVec 64))

(assert (=> b!559755 (= c!64676 (= lt!254413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322488 () SeekEntryResult!5342)

(assert (=> b!559755 (= e!322488 e!322486)))

(declare-fun b!559756 () Bool)

(assert (=> b!559756 (= e!322487 e!322488)))

(assert (=> b!559756 (= lt!254413 (select (arr!16893 a!3118) (index!23597 lt!254411)))))

(declare-fun c!64678 () Bool)

(assert (=> b!559756 (= c!64678 (= lt!254413 k!1914))))

(declare-fun b!559757 () Bool)

(assert (=> b!559757 (= e!322488 (Found!5342 (index!23597 lt!254411)))))

(declare-fun b!559758 () Bool)

(assert (=> b!559758 (= e!322486 (seekKeyOrZeroReturnVacant!0 (x!52508 lt!254411) (index!23597 lt!254411) (index!23597 lt!254411) k!1914 a!3118 mask!3119))))

(declare-fun b!559759 () Bool)

(assert (=> b!559759 (= e!322487 Undefined!5342)))

(assert (= (and d!83795 c!64677) b!559759))

(assert (= (and d!83795 (not c!64677)) b!559756))

(assert (= (and b!559756 c!64678) b!559757))

(assert (= (and b!559756 (not c!64678)) b!559755))

(assert (= (and b!559755 c!64676) b!559754))

(assert (= (and b!559755 (not c!64676)) b!559758))

(declare-fun m!537579 () Bool)

(assert (=> d!83795 m!537579))

(declare-fun m!537581 () Bool)

(assert (=> d!83795 m!537581))

(declare-fun m!537583 () Bool)

(assert (=> d!83795 m!537583))

(assert (=> d!83795 m!537419))

(declare-fun m!537585 () Bool)

(assert (=> d!83795 m!537585))

(declare-fun m!537587 () Bool)

(assert (=> d!83795 m!537587))

(assert (=> d!83795 m!537579))

(declare-fun m!537589 () Bool)

(assert (=> b!559756 m!537589))

(declare-fun m!537591 () Bool)

(assert (=> b!559758 m!537591))

(assert (=> b!559587 d!83795))

(declare-fun b!559772 () Bool)

(declare-fun e!322500 () Bool)

(declare-fun call!32450 () Bool)

(assert (=> b!559772 (= e!322500 call!32450)))

(declare-fun b!559773 () Bool)

(declare-fun e!322498 () Bool)

(assert (=> b!559773 (= e!322500 e!322498)))

(declare-fun lt!254427 () (_ BitVec 64))

(assert (=> b!559773 (= lt!254427 (select (arr!16893 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!254428 () Unit!17458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35182 (_ BitVec 64) (_ BitVec 32)) Unit!17458)

(assert (=> b!559773 (= lt!254428 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254427 #b00000000000000000000000000000000))))

(assert (=> b!559773 (arrayContainsKey!0 a!3118 lt!254427 #b00000000000000000000000000000000)))

(declare-fun lt!254426 () Unit!17458)

(assert (=> b!559773 (= lt!254426 lt!254428)))

(declare-fun res!351098 () Bool)

(assert (=> b!559773 (= res!351098 (= (seekEntryOrOpen!0 (select (arr!16893 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5342 #b00000000000000000000000000000000)))))

(assert (=> b!559773 (=> (not res!351098) (not e!322498))))

(declare-fun b!559774 () Bool)

(assert (=> b!559774 (= e!322498 call!32450)))

(declare-fun bm!32447 () Bool)

(assert (=> bm!32447 (= call!32450 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559775 () Bool)

(declare-fun e!322499 () Bool)

(assert (=> b!559775 (= e!322499 e!322500)))

(declare-fun c!64682 () Bool)

(assert (=> b!559775 (= c!64682 (validKeyInArray!0 (select (arr!16893 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83803 () Bool)

(declare-fun res!351097 () Bool)

(assert (=> d!83803 (=> res!351097 e!322499)))

(assert (=> d!83803 (= res!351097 (bvsge #b00000000000000000000000000000000 (size!17257 a!3118)))))

(assert (=> d!83803 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!322499)))

(assert (= (and d!83803 (not res!351097)) b!559775))

(assert (= (and b!559775 c!64682) b!559773))

(assert (= (and b!559775 (not c!64682)) b!559772))

(assert (= (and b!559773 res!351098) b!559774))

(assert (= (or b!559774 b!559772) bm!32447))

(assert (=> b!559773 m!537547))

(declare-fun m!537601 () Bool)

(assert (=> b!559773 m!537601))

(declare-fun m!537603 () Bool)

(assert (=> b!559773 m!537603))

(assert (=> b!559773 m!537547))

(declare-fun m!537605 () Bool)

(assert (=> b!559773 m!537605))

(declare-fun m!537607 () Bool)

(assert (=> bm!32447 m!537607))

(assert (=> b!559775 m!537547))

(assert (=> b!559775 m!537547))

(assert (=> b!559775 m!537549))

(assert (=> b!559586 d!83803))

(declare-fun b!559850 () Bool)

(declare-fun e!322546 () SeekEntryResult!5342)

(assert (=> b!559850 (= e!322546 (MissingVacant!5342 (index!23597 lt!254330)))))

(declare-fun b!559851 () Bool)

(declare-fun e!322547 () SeekEntryResult!5342)

(assert (=> b!559851 (= e!322547 Undefined!5342)))

(declare-fun b!559852 () Bool)

(declare-fun c!64715 () Bool)

(declare-fun lt!254452 () (_ BitVec 64))

(assert (=> b!559852 (= c!64715 (= lt!254452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322545 () SeekEntryResult!5342)

(assert (=> b!559852 (= e!322545 e!322546)))

(declare-fun b!559853 () Bool)

(assert (=> b!559853 (= e!322547 e!322545)))

(declare-fun c!64714 () Bool)

(assert (=> b!559853 (= c!64714 (= lt!254452 (select (arr!16893 a!3118) j!142)))))

(declare-fun lt!254451 () SeekEntryResult!5342)

(declare-fun d!83809 () Bool)

(assert (=> d!83809 (and (or (is-Undefined!5342 lt!254451) (not (is-Found!5342 lt!254451)) (and (bvsge (index!23596 lt!254451) #b00000000000000000000000000000000) (bvslt (index!23596 lt!254451) (size!17257 a!3118)))) (or (is-Undefined!5342 lt!254451) (is-Found!5342 lt!254451) (not (is-MissingVacant!5342 lt!254451)) (not (= (index!23598 lt!254451) (index!23597 lt!254330))) (and (bvsge (index!23598 lt!254451) #b00000000000000000000000000000000) (bvslt (index!23598 lt!254451) (size!17257 a!3118)))) (or (is-Undefined!5342 lt!254451) (ite (is-Found!5342 lt!254451) (= (select (arr!16893 a!3118) (index!23596 lt!254451)) (select (arr!16893 a!3118) j!142)) (and (is-MissingVacant!5342 lt!254451) (= (index!23598 lt!254451) (index!23597 lt!254330)) (= (select (arr!16893 a!3118) (index!23598 lt!254451)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!83809 (= lt!254451 e!322547)))

(declare-fun c!64713 () Bool)

(assert (=> d!83809 (= c!64713 (bvsge (x!52508 lt!254330) #b01111111111111111111111111111110))))

(assert (=> d!83809 (= lt!254452 (select (arr!16893 a!3118) (index!23597 lt!254330)))))

(assert (=> d!83809 (validMask!0 mask!3119)))

(assert (=> d!83809 (= (seekKeyOrZeroReturnVacant!0 (x!52508 lt!254330) (index!23597 lt!254330) (index!23597 lt!254330) (select (arr!16893 a!3118) j!142) a!3118 mask!3119) lt!254451)))

(declare-fun b!559854 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559854 (= e!322546 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52508 lt!254330) #b00000000000000000000000000000001) (nextIndex!0 (index!23597 lt!254330) (x!52508 lt!254330) mask!3119) (index!23597 lt!254330) (select (arr!16893 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559855 () Bool)

(assert (=> b!559855 (= e!322545 (Found!5342 (index!23597 lt!254330)))))

(assert (= (and d!83809 c!64713) b!559851))

(assert (= (and d!83809 (not c!64713)) b!559853))

(assert (= (and b!559853 c!64714) b!559855))

(assert (= (and b!559853 (not c!64714)) b!559852))

(assert (= (and b!559852 c!64715) b!559850))

(assert (= (and b!559852 (not c!64715)) b!559854))

(declare-fun m!537649 () Bool)

(assert (=> d!83809 m!537649))

(declare-fun m!537651 () Bool)

(assert (=> d!83809 m!537651))

(assert (=> d!83809 m!537417))

(assert (=> d!83809 m!537419))

(declare-fun m!537653 () Bool)

(assert (=> b!559854 m!537653))

(assert (=> b!559854 m!537653))

(assert (=> b!559854 m!537413))

(declare-fun m!537655 () Bool)

(assert (=> b!559854 m!537655))

(assert (=> b!559588 d!83809))

(declare-fun d!83823 () Bool)

(assert (=> d!83823 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51254 d!83823))

(declare-fun d!83829 () Bool)

(assert (=> d!83829 (= (array_inv!12689 a!3118) (bvsge (size!17257 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51254 d!83829))

(declare-fun d!83831 () Bool)

(assert (=> d!83831 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559593 d!83831))

(declare-fun d!83837 () Bool)

(declare-fun e!322592 () Bool)

(assert (=> d!83837 e!322592))

(declare-fun c!64743 () Bool)

(declare-fun lt!254480 () SeekEntryResult!5342)

(assert (=> d!83837 (= c!64743 (and (is-Intermediate!5342 lt!254480) (undefined!6154 lt!254480)))))

(declare-fun e!322591 () SeekEntryResult!5342)

(assert (=> d!83837 (= lt!254480 e!322591)))

(declare-fun c!64742 () Bool)

(assert (=> d!83837 (= c!64742 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254479 () (_ BitVec 64))

(assert (=> d!83837 (= lt!254479 (select (arr!16893 (array!35183 (store (arr!16893 a!3118) i!1132 k!1914) (size!17257 a!3118))) lt!254325))))

(assert (=> d!83837 (validMask!0 mask!3119)))

(assert (=> d!83837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254325 lt!254326 (array!35183 (store (arr!16893 a!3118) i!1132 k!1914) (size!17257 a!3118)) mask!3119) lt!254480)))

(declare-fun b!559927 () Bool)

(declare-fun e!322589 () Bool)

(assert (=> b!559927 (= e!322592 e!322589)))

(declare-fun res!351137 () Bool)

(assert (=> b!559927 (= res!351137 (and (is-Intermediate!5342 lt!254480) (not (undefined!6154 lt!254480)) (bvslt (x!52508 lt!254480) #b01111111111111111111111111111110) (bvsge (x!52508 lt!254480) #b00000000000000000000000000000000) (bvsge (x!52508 lt!254480) #b00000000000000000000000000000000)))))

(assert (=> b!559927 (=> (not res!351137) (not e!322589))))

(declare-fun b!559928 () Bool)

(assert (=> b!559928 (and (bvsge (index!23597 lt!254480) #b00000000000000000000000000000000) (bvslt (index!23597 lt!254480) (size!17257 (array!35183 (store (arr!16893 a!3118) i!1132 k!1914) (size!17257 a!3118)))))))

(declare-fun e!322590 () Bool)

(assert (=> b!559928 (= e!322590 (= (select (arr!16893 (array!35183 (store (arr!16893 a!3118) i!1132 k!1914) (size!17257 a!3118))) (index!23597 lt!254480)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559929 () Bool)

(declare-fun e!322588 () SeekEntryResult!5342)

(assert (=> b!559929 (= e!322591 e!322588)))

(declare-fun c!64741 () Bool)

(assert (=> b!559929 (= c!64741 (or (= lt!254479 lt!254326) (= (bvadd lt!254479 lt!254479) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559930 () Bool)

(assert (=> b!559930 (= e!322592 (bvsge (x!52508 lt!254480) #b01111111111111111111111111111110))))

(declare-fun b!559931 () Bool)

(assert (=> b!559931 (= e!322591 (Intermediate!5342 true lt!254325 #b00000000000000000000000000000000))))

(declare-fun b!559932 () Bool)

(assert (=> b!559932 (= e!322588 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254325 #b00000000000000000000000000000000 mask!3119) lt!254326 (array!35183 (store (arr!16893 a!3118) i!1132 k!1914) (size!17257 a!3118)) mask!3119))))

(declare-fun b!559933 () Bool)

(assert (=> b!559933 (and (bvsge (index!23597 lt!254480) #b00000000000000000000000000000000) (bvslt (index!23597 lt!254480) (size!17257 (array!35183 (store (arr!16893 a!3118) i!1132 k!1914) (size!17257 a!3118)))))))

(declare-fun res!351136 () Bool)

(assert (=> b!559933 (= res!351136 (= (select (arr!16893 (array!35183 (store (arr!16893 a!3118) i!1132 k!1914) (size!17257 a!3118))) (index!23597 lt!254480)) lt!254326))))

(assert (=> b!559933 (=> res!351136 e!322590)))

(assert (=> b!559933 (= e!322589 e!322590)))

(declare-fun b!559934 () Bool)

(assert (=> b!559934 (= e!322588 (Intermediate!5342 false lt!254325 #b00000000000000000000000000000000))))

(declare-fun b!559935 () Bool)

(assert (=> b!559935 (and (bvsge (index!23597 lt!254480) #b00000000000000000000000000000000) (bvslt (index!23597 lt!254480) (size!17257 (array!35183 (store (arr!16893 a!3118) i!1132 k!1914) (size!17257 a!3118)))))))

(declare-fun res!351135 () Bool)

(assert (=> b!559935 (= res!351135 (= (select (arr!16893 (array!35183 (store (arr!16893 a!3118) i!1132 k!1914) (size!17257 a!3118))) (index!23597 lt!254480)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559935 (=> res!351135 e!322590)))

(assert (= (and d!83837 c!64742) b!559931))

(assert (= (and d!83837 (not c!64742)) b!559929))

(assert (= (and b!559929 c!64741) b!559934))

(assert (= (and b!559929 (not c!64741)) b!559932))

(assert (= (and d!83837 c!64743) b!559930))

(assert (= (and d!83837 (not c!64743)) b!559927))

(assert (= (and b!559927 res!351137) b!559933))

(assert (= (and b!559933 (not res!351136)) b!559935))

(assert (= (and b!559935 (not res!351135)) b!559928))

(declare-fun m!537682 () Bool)

(assert (=> b!559935 m!537682))

(assert (=> b!559928 m!537682))

(declare-fun m!537689 () Bool)

(assert (=> b!559932 m!537689))

(assert (=> b!559932 m!537689))

(declare-fun m!537693 () Bool)

(assert (=> b!559932 m!537693))

(declare-fun m!537697 () Bool)

(assert (=> d!83837 m!537697))

(assert (=> d!83837 m!537419))

(assert (=> b!559933 m!537682))

(assert (=> b!559584 d!83837))

(declare-fun d!83847 () Bool)

(declare-fun e!322600 () Bool)

(assert (=> d!83847 e!322600))

(declare-fun c!64749 () Bool)

(declare-fun lt!254485 () SeekEntryResult!5342)

(assert (=> d!83847 (= c!64749 (and (is-Intermediate!5342 lt!254485) (undefined!6154 lt!254485)))))

(declare-fun e!322599 () SeekEntryResult!5342)

(assert (=> d!83847 (= lt!254485 e!322599)))

(declare-fun c!64748 () Bool)

(assert (=> d!83847 (= c!64748 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254484 () (_ BitVec 64))

(assert (=> d!83847 (= lt!254484 (select (arr!16893 a!3118) lt!254329))))

(assert (=> d!83847 (validMask!0 mask!3119)))

(assert (=> d!83847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254329 (select (arr!16893 a!3118) j!142) a!3118 mask!3119) lt!254485)))

(declare-fun b!559942 () Bool)

(declare-fun e!322597 () Bool)

(assert (=> b!559942 (= e!322600 e!322597)))

(declare-fun res!351140 () Bool)

(assert (=> b!559942 (= res!351140 (and (is-Intermediate!5342 lt!254485) (not (undefined!6154 lt!254485)) (bvslt (x!52508 lt!254485) #b01111111111111111111111111111110) (bvsge (x!52508 lt!254485) #b00000000000000000000000000000000) (bvsge (x!52508 lt!254485) #b00000000000000000000000000000000)))))

(assert (=> b!559942 (=> (not res!351140) (not e!322597))))

(declare-fun b!559943 () Bool)

(assert (=> b!559943 (and (bvsge (index!23597 lt!254485) #b00000000000000000000000000000000) (bvslt (index!23597 lt!254485) (size!17257 a!3118)))))

(declare-fun e!322598 () Bool)

(assert (=> b!559943 (= e!322598 (= (select (arr!16893 a!3118) (index!23597 lt!254485)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559944 () Bool)

(declare-fun e!322596 () SeekEntryResult!5342)

(assert (=> b!559944 (= e!322599 e!322596)))

(declare-fun c!64747 () Bool)

(assert (=> b!559944 (= c!64747 (or (= lt!254484 (select (arr!16893 a!3118) j!142)) (= (bvadd lt!254484 lt!254484) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559945 () Bool)

(assert (=> b!559945 (= e!322600 (bvsge (x!52508 lt!254485) #b01111111111111111111111111111110))))

(declare-fun b!559946 () Bool)

(assert (=> b!559946 (= e!322599 (Intermediate!5342 true lt!254329 #b00000000000000000000000000000000))))

(declare-fun b!559947 () Bool)

(assert (=> b!559947 (= e!322596 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254329 #b00000000000000000000000000000000 mask!3119) (select (arr!16893 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559948 () Bool)

(assert (=> b!559948 (and (bvsge (index!23597 lt!254485) #b00000000000000000000000000000000) (bvslt (index!23597 lt!254485) (size!17257 a!3118)))))

(declare-fun res!351139 () Bool)

(assert (=> b!559948 (= res!351139 (= (select (arr!16893 a!3118) (index!23597 lt!254485)) (select (arr!16893 a!3118) j!142)))))

(assert (=> b!559948 (=> res!351139 e!322598)))

(assert (=> b!559948 (= e!322597 e!322598)))

(declare-fun b!559949 () Bool)

(assert (=> b!559949 (= e!322596 (Intermediate!5342 false lt!254329 #b00000000000000000000000000000000))))

(declare-fun b!559950 () Bool)

(assert (=> b!559950 (and (bvsge (index!23597 lt!254485) #b00000000000000000000000000000000) (bvslt (index!23597 lt!254485) (size!17257 a!3118)))))

(declare-fun res!351138 () Bool)

(assert (=> b!559950 (= res!351138 (= (select (arr!16893 a!3118) (index!23597 lt!254485)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559950 (=> res!351138 e!322598)))

(assert (= (and d!83847 c!64748) b!559946))

(assert (= (and d!83847 (not c!64748)) b!559944))

(assert (= (and b!559944 c!64747) b!559949))

(assert (= (and b!559944 (not c!64747)) b!559947))

(assert (= (and d!83847 c!64749) b!559945))

(assert (= (and d!83847 (not c!64749)) b!559942))

(assert (= (and b!559942 res!351140) b!559948))

(assert (= (and b!559948 (not res!351139)) b!559950))

(assert (= (and b!559950 (not res!351138)) b!559943))

(declare-fun m!537699 () Bool)

(assert (=> b!559950 m!537699))

(assert (=> b!559943 m!537699))

(declare-fun m!537701 () Bool)

(assert (=> b!559947 m!537701))

(assert (=> b!559947 m!537701))

(assert (=> b!559947 m!537413))

(declare-fun m!537703 () Bool)

(assert (=> b!559947 m!537703))

(declare-fun m!537705 () Bool)

(assert (=> d!83847 m!537705))

(assert (=> d!83847 m!537419))

(assert (=> b!559948 m!537699))

(assert (=> b!559584 d!83847))

(declare-fun d!83849 () Bool)

(declare-fun lt!254491 () (_ BitVec 32))

(declare-fun lt!254490 () (_ BitVec 32))

(assert (=> d!83849 (= lt!254491 (bvmul (bvxor lt!254490 (bvlshr lt!254490 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83849 (= lt!254490 ((_ extract 31 0) (bvand (bvxor lt!254326 (bvlshr lt!254326 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83849 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!351141 (let ((h!11973 ((_ extract 31 0) (bvand (bvxor lt!254326 (bvlshr lt!254326 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52517 (bvmul (bvxor h!11973 (bvlshr h!11973 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52517 (bvlshr x!52517 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!351141 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!351141 #b00000000000000000000000000000000))))))

(assert (=> d!83849 (= (toIndex!0 lt!254326 mask!3119) (bvand (bvxor lt!254491 (bvlshr lt!254491 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559584 d!83849))

(declare-fun d!83851 () Bool)

(declare-fun lt!254493 () (_ BitVec 32))

(declare-fun lt!254492 () (_ BitVec 32))

(assert (=> d!83851 (= lt!254493 (bvmul (bvxor lt!254492 (bvlshr lt!254492 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83851 (= lt!254492 ((_ extract 31 0) (bvand (bvxor (select (arr!16893 a!3118) j!142) (bvlshr (select (arr!16893 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83851 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!351141 (let ((h!11973 ((_ extract 31 0) (bvand (bvxor (select (arr!16893 a!3118) j!142) (bvlshr (select (arr!16893 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52517 (bvmul (bvxor h!11973 (bvlshr h!11973 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52517 (bvlshr x!52517 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!351141 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!351141 #b00000000000000000000000000000000))))))

(assert (=> d!83851 (= (toIndex!0 (select (arr!16893 a!3118) j!142) mask!3119) (bvand (bvxor lt!254493 (bvlshr lt!254493 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559584 d!83851))

(declare-fun d!83853 () Bool)

(declare-fun res!351146 () Bool)

(declare-fun e!322605 () Bool)

(assert (=> d!83853 (=> res!351146 e!322605)))

(assert (=> d!83853 (= res!351146 (= (select (arr!16893 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83853 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!322605)))

(declare-fun b!559955 () Bool)

(declare-fun e!322606 () Bool)

(assert (=> b!559955 (= e!322605 e!322606)))

(declare-fun res!351147 () Bool)

(assert (=> b!559955 (=> (not res!351147) (not e!322606))))

(assert (=> b!559955 (= res!351147 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17257 a!3118)))))

(declare-fun b!559956 () Bool)

(assert (=> b!559956 (= e!322606 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83853 (not res!351146)) b!559955))

(assert (= (and b!559955 res!351147) b!559956))

(assert (=> d!83853 m!537547))

(declare-fun m!537707 () Bool)

(assert (=> b!559956 m!537707))

(assert (=> b!559589 d!83853))

(declare-fun d!83855 () Bool)

(assert (=> d!83855 (= (validKeyInArray!0 (select (arr!16893 a!3118) j!142)) (and (not (= (select (arr!16893 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16893 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559591 d!83855))

(declare-fun d!83857 () Bool)

(declare-fun lt!254495 () SeekEntryResult!5342)

(assert (=> d!83857 (and (or (is-Undefined!5342 lt!254495) (not (is-Found!5342 lt!254495)) (and (bvsge (index!23596 lt!254495) #b00000000000000000000000000000000) (bvslt (index!23596 lt!254495) (size!17257 a!3118)))) (or (is-Undefined!5342 lt!254495) (is-Found!5342 lt!254495) (not (is-MissingZero!5342 lt!254495)) (and (bvsge (index!23595 lt!254495) #b00000000000000000000000000000000) (bvslt (index!23595 lt!254495) (size!17257 a!3118)))) (or (is-Undefined!5342 lt!254495) (is-Found!5342 lt!254495) (is-MissingZero!5342 lt!254495) (not (is-MissingVacant!5342 lt!254495)) (and (bvsge (index!23598 lt!254495) #b00000000000000000000000000000000) (bvslt (index!23598 lt!254495) (size!17257 a!3118)))) (or (is-Undefined!5342 lt!254495) (ite (is-Found!5342 lt!254495) (= (select (arr!16893 a!3118) (index!23596 lt!254495)) (select (arr!16893 a!3118) j!142)) (ite (is-MissingZero!5342 lt!254495) (= (select (arr!16893 a!3118) (index!23595 lt!254495)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5342 lt!254495) (= (select (arr!16893 a!3118) (index!23598 lt!254495)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!322608 () SeekEntryResult!5342)

(assert (=> d!83857 (= lt!254495 e!322608)))

(declare-fun c!64751 () Bool)

(declare-fun lt!254494 () SeekEntryResult!5342)

(assert (=> d!83857 (= c!64751 (and (is-Intermediate!5342 lt!254494) (undefined!6154 lt!254494)))))

(assert (=> d!83857 (= lt!254494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16893 a!3118) j!142) mask!3119) (select (arr!16893 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83857 (validMask!0 mask!3119)))

(assert (=> d!83857 (= (seekEntryOrOpen!0 (select (arr!16893 a!3118) j!142) a!3118 mask!3119) lt!254495)))

(declare-fun b!559957 () Bool)

(declare-fun e!322607 () SeekEntryResult!5342)

(assert (=> b!559957 (= e!322607 (MissingZero!5342 (index!23597 lt!254494)))))

(declare-fun b!559958 () Bool)

(declare-fun c!64750 () Bool)

(declare-fun lt!254496 () (_ BitVec 64))

(assert (=> b!559958 (= c!64750 (= lt!254496 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322609 () SeekEntryResult!5342)

(assert (=> b!559958 (= e!322609 e!322607)))

(declare-fun b!559959 () Bool)

(assert (=> b!559959 (= e!322608 e!322609)))

(assert (=> b!559959 (= lt!254496 (select (arr!16893 a!3118) (index!23597 lt!254494)))))

(declare-fun c!64752 () Bool)

(assert (=> b!559959 (= c!64752 (= lt!254496 (select (arr!16893 a!3118) j!142)))))

(declare-fun b!559960 () Bool)

(assert (=> b!559960 (= e!322609 (Found!5342 (index!23597 lt!254494)))))

(declare-fun b!559961 () Bool)

(assert (=> b!559961 (= e!322607 (seekKeyOrZeroReturnVacant!0 (x!52508 lt!254494) (index!23597 lt!254494) (index!23597 lt!254494) (select (arr!16893 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559962 () Bool)

(assert (=> b!559962 (= e!322608 Undefined!5342)))

(assert (= (and d!83857 c!64751) b!559962))

(assert (= (and d!83857 (not c!64751)) b!559959))

(assert (= (and b!559959 c!64752) b!559960))

(assert (= (and b!559959 (not c!64752)) b!559958))

(assert (= (and b!559958 c!64750) b!559957))

(assert (= (and b!559958 (not c!64750)) b!559961))

(assert (=> d!83857 m!537437))

(assert (=> d!83857 m!537413))

(declare-fun m!537709 () Bool)

(assert (=> d!83857 m!537709))

(declare-fun m!537711 () Bool)

(assert (=> d!83857 m!537711))

(assert (=> d!83857 m!537419))

(declare-fun m!537713 () Bool)

(assert (=> d!83857 m!537713))

(declare-fun m!537715 () Bool)

(assert (=> d!83857 m!537715))

(assert (=> d!83857 m!537413))

(assert (=> d!83857 m!537437))

(declare-fun m!537717 () Bool)

(assert (=> b!559959 m!537717))

(assert (=> b!559961 m!537413))

(declare-fun m!537719 () Bool)

(assert (=> b!559961 m!537719))

(assert (=> b!559590 d!83857))

(declare-fun b!559963 () Bool)

(declare-fun e!322612 () Bool)

(declare-fun call!32455 () Bool)

(assert (=> b!559963 (= e!322612 call!32455)))

(declare-fun b!559964 () Bool)

(declare-fun e!322610 () Bool)

(assert (=> b!559964 (= e!322612 e!322610)))

(declare-fun lt!254498 () (_ BitVec 64))

(assert (=> b!559964 (= lt!254498 (select (arr!16893 a!3118) j!142))))

(declare-fun lt!254499 () Unit!17458)

(assert (=> b!559964 (= lt!254499 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254498 j!142))))

(assert (=> b!559964 (arrayContainsKey!0 a!3118 lt!254498 #b00000000000000000000000000000000)))

(declare-fun lt!254497 () Unit!17458)

(assert (=> b!559964 (= lt!254497 lt!254499)))

(declare-fun res!351149 () Bool)

(assert (=> b!559964 (= res!351149 (= (seekEntryOrOpen!0 (select (arr!16893 a!3118) j!142) a!3118 mask!3119) (Found!5342 j!142)))))

(assert (=> b!559964 (=> (not res!351149) (not e!322610))))

(declare-fun b!559965 () Bool)

(assert (=> b!559965 (= e!322610 call!32455)))

(declare-fun bm!32452 () Bool)

(assert (=> bm!32452 (= call!32455 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559966 () Bool)

(declare-fun e!322611 () Bool)

(assert (=> b!559966 (= e!322611 e!322612)))

(declare-fun c!64753 () Bool)

(assert (=> b!559966 (= c!64753 (validKeyInArray!0 (select (arr!16893 a!3118) j!142)))))

(declare-fun d!83859 () Bool)

(declare-fun res!351148 () Bool)

(assert (=> d!83859 (=> res!351148 e!322611)))

(assert (=> d!83859 (= res!351148 (bvsge j!142 (size!17257 a!3118)))))

(assert (=> d!83859 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!322611)))

(assert (= (and d!83859 (not res!351148)) b!559966))

(assert (= (and b!559966 c!64753) b!559964))

(assert (= (and b!559966 (not c!64753)) b!559963))

(assert (= (and b!559964 res!351149) b!559965))

(assert (= (or b!559965 b!559963) bm!32452))

(assert (=> b!559964 m!537413))

(declare-fun m!537721 () Bool)

(assert (=> b!559964 m!537721))

(declare-fun m!537723 () Bool)

(assert (=> b!559964 m!537723))

(assert (=> b!559964 m!537413))

(assert (=> b!559964 m!537433))

(declare-fun m!537725 () Bool)

(assert (=> bm!32452 m!537725))

(assert (=> b!559966 m!537413))

(assert (=> b!559966 m!537413))

(assert (=> b!559966 m!537451))

(assert (=> b!559590 d!83859))

(declare-fun d!83861 () Bool)

(assert (=> d!83861 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!254506 () Unit!17458)

(declare-fun choose!38 (array!35182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17458)

(assert (=> d!83861 (= lt!254506 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83861 (validMask!0 mask!3119)))

(assert (=> d!83861 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!254506)))

(declare-fun bs!17402 () Bool)

(assert (= bs!17402 d!83861))

(assert (=> bs!17402 m!537435))

(declare-fun m!537727 () Bool)

(assert (=> bs!17402 m!537727))

(assert (=> bs!17402 m!537419))

(assert (=> b!559590 d!83861))

(push 1)

