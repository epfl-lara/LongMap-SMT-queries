; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51924 () Bool)

(assert start!51924)

(declare-fun b!567653 () Bool)

(declare-fun e!326614 () Bool)

(declare-fun e!326613 () Bool)

(assert (=> b!567653 (= e!326614 e!326613)))

(declare-fun res!358240 () Bool)

(assert (=> b!567653 (=> (not res!358240) (not e!326613))))

(declare-fun lt!258609 () (_ BitVec 32))

(declare-fun lt!258606 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5554 0))(
  ( (MissingZero!5554 (index!24443 (_ BitVec 32))) (Found!5554 (index!24444 (_ BitVec 32))) (Intermediate!5554 (undefined!6366 Bool) (index!24445 (_ BitVec 32)) (x!53307 (_ BitVec 32))) (Undefined!5554) (MissingVacant!5554 (index!24446 (_ BitVec 32))) )
))
(declare-fun lt!258613 () SeekEntryResult!5554)

(declare-datatypes ((array!35618 0))(
  ( (array!35619 (arr!17105 (Array (_ BitVec 32) (_ BitVec 64))) (size!17469 (_ BitVec 32))) )
))
(declare-fun lt!258612 () array!35618)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35618 (_ BitVec 32)) SeekEntryResult!5554)

(assert (=> b!567653 (= res!358240 (= lt!258613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258609 lt!258606 lt!258612 mask!3119)))))

(declare-fun lt!258608 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun a!3118 () array!35618)

(assert (=> b!567653 (= lt!258613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258608 (select (arr!17105 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567653 (= lt!258609 (toIndex!0 lt!258606 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567653 (= lt!258606 (select (store (arr!17105 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!567653 (= lt!258608 (toIndex!0 (select (arr!17105 a!3118) j!142) mask!3119))))

(assert (=> b!567653 (= lt!258612 (array!35619 (store (arr!17105 a!3118) i!1132 k!1914) (size!17469 a!3118)))))

(declare-fun b!567654 () Bool)

(declare-fun e!326616 () Bool)

(assert (=> b!567654 (= e!326616 e!326614)))

(declare-fun res!358245 () Bool)

(assert (=> b!567654 (=> (not res!358245) (not e!326614))))

(declare-fun lt!258610 () SeekEntryResult!5554)

(assert (=> b!567654 (= res!358245 (or (= lt!258610 (MissingZero!5554 i!1132)) (= lt!258610 (MissingVacant!5554 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35618 (_ BitVec 32)) SeekEntryResult!5554)

(assert (=> b!567654 (= lt!258610 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567655 () Bool)

(declare-fun res!358244 () Bool)

(assert (=> b!567655 (=> (not res!358244) (not e!326614))))

(declare-datatypes ((List!11185 0))(
  ( (Nil!11182) (Cons!11181 (h!12193 (_ BitVec 64)) (t!17413 List!11185)) )
))
(declare-fun arrayNoDuplicates!0 (array!35618 (_ BitVec 32) List!11185) Bool)

(assert (=> b!567655 (= res!358244 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11182))))

(declare-fun b!567656 () Bool)

(declare-fun res!358243 () Bool)

(assert (=> b!567656 (=> (not res!358243) (not e!326616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567656 (= res!358243 (validKeyInArray!0 (select (arr!17105 a!3118) j!142)))))

(declare-fun b!567657 () Bool)

(declare-fun res!358242 () Bool)

(assert (=> b!567657 (=> (not res!358242) (not e!326616))))

(assert (=> b!567657 (= res!358242 (validKeyInArray!0 k!1914))))

(declare-fun b!567658 () Bool)

(declare-fun e!326615 () Bool)

(assert (=> b!567658 (= e!326613 (not e!326615))))

(declare-fun res!358246 () Bool)

(assert (=> b!567658 (=> res!358246 e!326615)))

(assert (=> b!567658 (= res!358246 (or (undefined!6366 lt!258613) (not (is-Intermediate!5554 lt!258613)) (not (= (select (arr!17105 a!3118) (index!24445 lt!258613)) (select (arr!17105 a!3118) j!142)))))))

(declare-fun lt!258607 () SeekEntryResult!5554)

(assert (=> b!567658 (= lt!258607 (Found!5554 j!142))))

(assert (=> b!567658 (= lt!258607 (seekEntryOrOpen!0 (select (arr!17105 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35618 (_ BitVec 32)) Bool)

(assert (=> b!567658 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17810 0))(
  ( (Unit!17811) )
))
(declare-fun lt!258611 () Unit!17810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17810)

(assert (=> b!567658 (= lt!258611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!358241 () Bool)

(assert (=> start!51924 (=> (not res!358241) (not e!326616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51924 (= res!358241 (validMask!0 mask!3119))))

(assert (=> start!51924 e!326616))

(assert (=> start!51924 true))

(declare-fun array_inv!12901 (array!35618) Bool)

(assert (=> start!51924 (array_inv!12901 a!3118)))

(declare-fun b!567659 () Bool)

(assert (=> b!567659 (= e!326615 (= lt!258607 (seekEntryOrOpen!0 lt!258606 lt!258612 mask!3119)))))

(declare-fun b!567660 () Bool)

(declare-fun res!358247 () Bool)

(assert (=> b!567660 (=> (not res!358247) (not e!326614))))

(assert (=> b!567660 (= res!358247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567661 () Bool)

(declare-fun res!358238 () Bool)

(assert (=> b!567661 (=> (not res!358238) (not e!326616))))

(declare-fun arrayContainsKey!0 (array!35618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567661 (= res!358238 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567662 () Bool)

(declare-fun res!358239 () Bool)

(assert (=> b!567662 (=> (not res!358239) (not e!326616))))

(assert (=> b!567662 (= res!358239 (and (= (size!17469 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17469 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17469 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51924 res!358241) b!567662))

(assert (= (and b!567662 res!358239) b!567656))

(assert (= (and b!567656 res!358243) b!567657))

(assert (= (and b!567657 res!358242) b!567661))

(assert (= (and b!567661 res!358238) b!567654))

(assert (= (and b!567654 res!358245) b!567660))

(assert (= (and b!567660 res!358247) b!567655))

(assert (= (and b!567655 res!358244) b!567653))

(assert (= (and b!567653 res!358240) b!567658))

(assert (= (and b!567658 (not res!358246)) b!567659))

(declare-fun m!546293 () Bool)

(assert (=> b!567656 m!546293))

(assert (=> b!567656 m!546293))

(declare-fun m!546295 () Bool)

(assert (=> b!567656 m!546295))

(declare-fun m!546297 () Bool)

(assert (=> b!567655 m!546297))

(declare-fun m!546299 () Bool)

(assert (=> b!567654 m!546299))

(declare-fun m!546301 () Bool)

(assert (=> start!51924 m!546301))

(declare-fun m!546303 () Bool)

(assert (=> start!51924 m!546303))

(declare-fun m!546305 () Bool)

(assert (=> b!567657 m!546305))

(declare-fun m!546307 () Bool)

(assert (=> b!567661 m!546307))

(declare-fun m!546309 () Bool)

(assert (=> b!567659 m!546309))

(assert (=> b!567653 m!546293))

(declare-fun m!546311 () Bool)

(assert (=> b!567653 m!546311))

(declare-fun m!546313 () Bool)

(assert (=> b!567653 m!546313))

(assert (=> b!567653 m!546293))

(declare-fun m!546315 () Bool)

(assert (=> b!567653 m!546315))

(assert (=> b!567653 m!546293))

(declare-fun m!546317 () Bool)

(assert (=> b!567653 m!546317))

(declare-fun m!546319 () Bool)

(assert (=> b!567653 m!546319))

(declare-fun m!546321 () Bool)

(assert (=> b!567653 m!546321))

(declare-fun m!546323 () Bool)

(assert (=> b!567660 m!546323))

(assert (=> b!567658 m!546293))

(declare-fun m!546325 () Bool)

(assert (=> b!567658 m!546325))

(declare-fun m!546327 () Bool)

(assert (=> b!567658 m!546327))

(declare-fun m!546329 () Bool)

(assert (=> b!567658 m!546329))

(assert (=> b!567658 m!546293))

(declare-fun m!546331 () Bool)

(assert (=> b!567658 m!546331))

(push 1)

(assert (not b!567661))

(assert (not b!567657))

(assert (not b!567659))

(assert (not b!567660))

(assert (not b!567658))

(assert (not b!567655))

(assert (not b!567654))

(assert (not start!51924))

(assert (not b!567656))

(assert (not b!567653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84295 () Bool)

(assert (=> d!84295 (= (validKeyInArray!0 (select (arr!17105 a!3118) j!142)) (and (not (= (select (arr!17105 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17105 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567656 d!84295))

(declare-fun d!84297 () Bool)

(declare-fun res!358261 () Bool)

(declare-fun e!326633 () Bool)

(assert (=> d!84297 (=> res!358261 e!326633)))

(assert (=> d!84297 (= res!358261 (= (select (arr!17105 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84297 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!326633)))

(declare-fun b!567682 () Bool)

(declare-fun e!326634 () Bool)

(assert (=> b!567682 (= e!326633 e!326634)))

(declare-fun res!358262 () Bool)

(assert (=> b!567682 (=> (not res!358262) (not e!326634))))

(assert (=> b!567682 (= res!358262 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17469 a!3118)))))

(declare-fun b!567683 () Bool)

(assert (=> b!567683 (= e!326634 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84297 (not res!358261)) b!567682))

(assert (= (and b!567682 res!358262) b!567683))

(declare-fun m!546341 () Bool)

(assert (=> d!84297 m!546341))

(declare-fun m!546343 () Bool)

(assert (=> b!567683 m!546343))

(assert (=> b!567661 d!84297))

(declare-fun d!84299 () Bool)

(assert (=> d!84299 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567657 d!84299))

(declare-fun d!84301 () Bool)

(declare-fun lt!258629 () SeekEntryResult!5554)

(assert (=> d!84301 (and (or (is-Undefined!5554 lt!258629) (not (is-Found!5554 lt!258629)) (and (bvsge (index!24444 lt!258629) #b00000000000000000000000000000000) (bvslt (index!24444 lt!258629) (size!17469 lt!258612)))) (or (is-Undefined!5554 lt!258629) (is-Found!5554 lt!258629) (not (is-MissingZero!5554 lt!258629)) (and (bvsge (index!24443 lt!258629) #b00000000000000000000000000000000) (bvslt (index!24443 lt!258629) (size!17469 lt!258612)))) (or (is-Undefined!5554 lt!258629) (is-Found!5554 lt!258629) (is-MissingZero!5554 lt!258629) (not (is-MissingVacant!5554 lt!258629)) (and (bvsge (index!24446 lt!258629) #b00000000000000000000000000000000) (bvslt (index!24446 lt!258629) (size!17469 lt!258612)))) (or (is-Undefined!5554 lt!258629) (ite (is-Found!5554 lt!258629) (= (select (arr!17105 lt!258612) (index!24444 lt!258629)) lt!258606) (ite (is-MissingZero!5554 lt!258629) (= (select (arr!17105 lt!258612) (index!24443 lt!258629)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5554 lt!258629) (= (select (arr!17105 lt!258612) (index!24446 lt!258629)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!326652 () SeekEntryResult!5554)

(assert (=> d!84301 (= lt!258629 e!326652)))

(declare-fun c!65070 () Bool)

(declare-fun lt!258630 () SeekEntryResult!5554)

(assert (=> d!84301 (= c!65070 (and (is-Intermediate!5554 lt!258630) (undefined!6366 lt!258630)))))

(assert (=> d!84301 (= lt!258630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!258606 mask!3119) lt!258606 lt!258612 mask!3119))))

(assert (=> d!84301 (validMask!0 mask!3119)))

(assert (=> d!84301 (= (seekEntryOrOpen!0 lt!258606 lt!258612 mask!3119) lt!258629)))

(declare-fun b!567708 () Bool)

(assert (=> b!567708 (= e!326652 Undefined!5554)))

(declare-fun b!567709 () Bool)

(declare-fun e!326651 () SeekEntryResult!5554)

(assert (=> b!567709 (= e!326652 e!326651)))

(declare-fun lt!258631 () (_ BitVec 64))

(assert (=> b!567709 (= lt!258631 (select (arr!17105 lt!258612) (index!24445 lt!258630)))))

(declare-fun c!65072 () Bool)

(assert (=> b!567709 (= c!65072 (= lt!258631 lt!258606))))

(declare-fun b!567710 () Bool)

(declare-fun c!65071 () Bool)

(assert (=> b!567710 (= c!65071 (= lt!258631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326650 () SeekEntryResult!5554)

(assert (=> b!567710 (= e!326651 e!326650)))

(declare-fun b!567711 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35618 (_ BitVec 32)) SeekEntryResult!5554)

(assert (=> b!567711 (= e!326650 (seekKeyOrZeroReturnVacant!0 (x!53307 lt!258630) (index!24445 lt!258630) (index!24445 lt!258630) lt!258606 lt!258612 mask!3119))))

(declare-fun b!567712 () Bool)

(assert (=> b!567712 (= e!326650 (MissingZero!5554 (index!24445 lt!258630)))))

(declare-fun b!567713 () Bool)

(assert (=> b!567713 (= e!326651 (Found!5554 (index!24445 lt!258630)))))

(assert (= (and d!84301 c!65070) b!567708))

(assert (= (and d!84301 (not c!65070)) b!567709))

(assert (= (and b!567709 c!65072) b!567713))

(assert (= (and b!567709 (not c!65072)) b!567710))

(assert (= (and b!567710 c!65071) b!567712))

(assert (= (and b!567710 (not c!65071)) b!567711))

(declare-fun m!546353 () Bool)

(assert (=> d!84301 m!546353))

(assert (=> d!84301 m!546319))

(declare-fun m!546355 () Bool)

(assert (=> d!84301 m!546355))

(assert (=> d!84301 m!546319))

(declare-fun m!546357 () Bool)

(assert (=> d!84301 m!546357))

(assert (=> d!84301 m!546301))

(declare-fun m!546359 () Bool)

(assert (=> d!84301 m!546359))

(declare-fun m!546361 () Bool)

(assert (=> b!567709 m!546361))

(declare-fun m!546363 () Bool)

(assert (=> b!567711 m!546363))

(assert (=> b!567659 d!84301))

(declare-fun d!84311 () Bool)

(assert (=> d!84311 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51924 d!84311))

(declare-fun d!84317 () Bool)

(assert (=> d!84317 (= (array_inv!12901 a!3118) (bvsge (size!17469 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51924 d!84317))

(declare-fun b!567811 () Bool)

(declare-fun e!326716 () SeekEntryResult!5554)

(assert (=> b!567811 (= e!326716 (Intermediate!5554 false lt!258609 #b00000000000000000000000000000000))))

(declare-fun b!567812 () Bool)

(declare-fun e!326715 () Bool)

(declare-fun lt!258667 () SeekEntryResult!5554)

(assert (=> b!567812 (= e!326715 (bvsge (x!53307 lt!258667) #b01111111111111111111111111111110))))

(declare-fun b!567813 () Bool)

(declare-fun e!326713 () Bool)

(assert (=> b!567813 (= e!326715 e!326713)))

(declare-fun res!358306 () Bool)

(assert (=> b!567813 (= res!358306 (and (is-Intermediate!5554 lt!258667) (not (undefined!6366 lt!258667)) (bvslt (x!53307 lt!258667) #b01111111111111111111111111111110) (bvsge (x!53307 lt!258667) #b00000000000000000000000000000000) (bvsge (x!53307 lt!258667) #b00000000000000000000000000000000)))))

(assert (=> b!567813 (=> (not res!358306) (not e!326713))))

(declare-fun b!567814 () Bool)

(assert (=> b!567814 (and (bvsge (index!24445 lt!258667) #b00000000000000000000000000000000) (bvslt (index!24445 lt!258667) (size!17469 lt!258612)))))

(declare-fun res!358307 () Bool)

(assert (=> b!567814 (= res!358307 (= (select (arr!17105 lt!258612) (index!24445 lt!258667)) lt!258606))))

(declare-fun e!326714 () Bool)

(assert (=> b!567814 (=> res!358307 e!326714)))

(assert (=> b!567814 (= e!326713 e!326714)))

(declare-fun d!84321 () Bool)

(assert (=> d!84321 e!326715))

(declare-fun c!65105 () Bool)

(assert (=> d!84321 (= c!65105 (and (is-Intermediate!5554 lt!258667) (undefined!6366 lt!258667)))))

(declare-fun e!326717 () SeekEntryResult!5554)

(assert (=> d!84321 (= lt!258667 e!326717)))

(declare-fun c!65106 () Bool)

(assert (=> d!84321 (= c!65106 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258668 () (_ BitVec 64))

(assert (=> d!84321 (= lt!258668 (select (arr!17105 lt!258612) lt!258609))))

(assert (=> d!84321 (validMask!0 mask!3119)))

(assert (=> d!84321 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258609 lt!258606 lt!258612 mask!3119) lt!258667)))

(declare-fun b!567815 () Bool)

(assert (=> b!567815 (= e!326717 (Intermediate!5554 true lt!258609 #b00000000000000000000000000000000))))

(declare-fun b!567816 () Bool)

(assert (=> b!567816 (and (bvsge (index!24445 lt!258667) #b00000000000000000000000000000000) (bvslt (index!24445 lt!258667) (size!17469 lt!258612)))))

(assert (=> b!567816 (= e!326714 (= (select (arr!17105 lt!258612) (index!24445 lt!258667)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!567817 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567817 (= e!326716 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258609 #b00000000000000000000000000000000 mask!3119) lt!258606 lt!258612 mask!3119))))

(declare-fun b!567818 () Bool)

(assert (=> b!567818 (= e!326717 e!326716)))

(declare-fun c!65104 () Bool)

(assert (=> b!567818 (= c!65104 (or (= lt!258668 lt!258606) (= (bvadd lt!258668 lt!258668) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567819 () Bool)

(assert (=> b!567819 (and (bvsge (index!24445 lt!258667) #b00000000000000000000000000000000) (bvslt (index!24445 lt!258667) (size!17469 lt!258612)))))

(declare-fun res!358305 () Bool)

(assert (=> b!567819 (= res!358305 (= (select (arr!17105 lt!258612) (index!24445 lt!258667)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567819 (=> res!358305 e!326714)))

(assert (= (and d!84321 c!65106) b!567815))

(assert (= (and d!84321 (not c!65106)) b!567818))

(assert (= (and b!567818 c!65104) b!567811))

(assert (= (and b!567818 (not c!65104)) b!567817))

(assert (= (and d!84321 c!65105) b!567812))

(assert (= (and d!84321 (not c!65105)) b!567813))

(assert (= (and b!567813 res!358306) b!567814))

(assert (= (and b!567814 (not res!358307)) b!567819))

(assert (= (and b!567819 (not res!358305)) b!567816))

(declare-fun m!546411 () Bool)

(assert (=> b!567816 m!546411))

(assert (=> b!567814 m!546411))

(assert (=> b!567819 m!546411))

(declare-fun m!546413 () Bool)

(assert (=> d!84321 m!546413))

(assert (=> d!84321 m!546301))

(declare-fun m!546415 () Bool)

(assert (=> b!567817 m!546415))

(assert (=> b!567817 m!546415))

(declare-fun m!546417 () Bool)

(assert (=> b!567817 m!546417))

(assert (=> b!567653 d!84321))

(declare-fun b!567820 () Bool)

(declare-fun e!326721 () SeekEntryResult!5554)

(assert (=> b!567820 (= e!326721 (Intermediate!5554 false lt!258608 #b00000000000000000000000000000000))))

(declare-fun b!567821 () Bool)

(declare-fun e!326720 () Bool)

(declare-fun lt!258669 () SeekEntryResult!5554)

(assert (=> b!567821 (= e!326720 (bvsge (x!53307 lt!258669) #b01111111111111111111111111111110))))

(declare-fun b!567822 () Bool)

(declare-fun e!326718 () Bool)

(assert (=> b!567822 (= e!326720 e!326718)))

(declare-fun res!358309 () Bool)

(assert (=> b!567822 (= res!358309 (and (is-Intermediate!5554 lt!258669) (not (undefined!6366 lt!258669)) (bvslt (x!53307 lt!258669) #b01111111111111111111111111111110) (bvsge (x!53307 lt!258669) #b00000000000000000000000000000000) (bvsge (x!53307 lt!258669) #b00000000000000000000000000000000)))))

(assert (=> b!567822 (=> (not res!358309) (not e!326718))))

(declare-fun b!567823 () Bool)

(assert (=> b!567823 (and (bvsge (index!24445 lt!258669) #b00000000000000000000000000000000) (bvslt (index!24445 lt!258669) (size!17469 a!3118)))))

(declare-fun res!358310 () Bool)

(assert (=> b!567823 (= res!358310 (= (select (arr!17105 a!3118) (index!24445 lt!258669)) (select (arr!17105 a!3118) j!142)))))

(declare-fun e!326719 () Bool)

(assert (=> b!567823 (=> res!358310 e!326719)))

(assert (=> b!567823 (= e!326718 e!326719)))

(declare-fun d!84339 () Bool)

(assert (=> d!84339 e!326720))

(declare-fun c!65108 () Bool)

(assert (=> d!84339 (= c!65108 (and (is-Intermediate!5554 lt!258669) (undefined!6366 lt!258669)))))

(declare-fun e!326722 () SeekEntryResult!5554)

(assert (=> d!84339 (= lt!258669 e!326722)))

(declare-fun c!65109 () Bool)

(assert (=> d!84339 (= c!65109 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258670 () (_ BitVec 64))

(assert (=> d!84339 (= lt!258670 (select (arr!17105 a!3118) lt!258608))))

(assert (=> d!84339 (validMask!0 mask!3119)))

(assert (=> d!84339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258608 (select (arr!17105 a!3118) j!142) a!3118 mask!3119) lt!258669)))

(declare-fun b!567824 () Bool)

(assert (=> b!567824 (= e!326722 (Intermediate!5554 true lt!258608 #b00000000000000000000000000000000))))

(declare-fun b!567825 () Bool)

(assert (=> b!567825 (and (bvsge (index!24445 lt!258669) #b00000000000000000000000000000000) (bvslt (index!24445 lt!258669) (size!17469 a!3118)))))

(assert (=> b!567825 (= e!326719 (= (select (arr!17105 a!3118) (index!24445 lt!258669)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!567826 () Bool)

(assert (=> b!567826 (= e!326721 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258608 #b00000000000000000000000000000000 mask!3119) (select (arr!17105 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567827 () Bool)

(assert (=> b!567827 (= e!326722 e!326721)))

(declare-fun c!65107 () Bool)

(assert (=> b!567827 (= c!65107 (or (= lt!258670 (select (arr!17105 a!3118) j!142)) (= (bvadd lt!258670 lt!258670) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567828 () Bool)

(assert (=> b!567828 (and (bvsge (index!24445 lt!258669) #b00000000000000000000000000000000) (bvslt (index!24445 lt!258669) (size!17469 a!3118)))))

(declare-fun res!358308 () Bool)

(assert (=> b!567828 (= res!358308 (= (select (arr!17105 a!3118) (index!24445 lt!258669)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567828 (=> res!358308 e!326719)))

(assert (= (and d!84339 c!65109) b!567824))

(assert (= (and d!84339 (not c!65109)) b!567827))

(assert (= (and b!567827 c!65107) b!567820))

(assert (= (and b!567827 (not c!65107)) b!567826))

(assert (= (and d!84339 c!65108) b!567821))

(assert (= (and d!84339 (not c!65108)) b!567822))

(assert (= (and b!567822 res!358309) b!567823))

(assert (= (and b!567823 (not res!358310)) b!567828))

(assert (= (and b!567828 (not res!358308)) b!567825))

(declare-fun m!546419 () Bool)

(assert (=> b!567825 m!546419))

(assert (=> b!567823 m!546419))

(assert (=> b!567828 m!546419))

(declare-fun m!546421 () Bool)

(assert (=> d!84339 m!546421))

(assert (=> d!84339 m!546301))

(declare-fun m!546423 () Bool)

(assert (=> b!567826 m!546423))

(assert (=> b!567826 m!546423))

(assert (=> b!567826 m!546293))

(declare-fun m!546425 () Bool)

(assert (=> b!567826 m!546425))

(assert (=> b!567653 d!84339))

(declare-fun d!84341 () Bool)

(declare-fun lt!258676 () (_ BitVec 32))

(declare-fun lt!258675 () (_ BitVec 32))

(assert (=> d!84341 (= lt!258676 (bvmul (bvxor lt!258675 (bvlshr lt!258675 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84341 (= lt!258675 ((_ extract 31 0) (bvand (bvxor lt!258606 (bvlshr lt!258606 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84341 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358311 (let ((h!12195 ((_ extract 31 0) (bvand (bvxor lt!258606 (bvlshr lt!258606 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53311 (bvmul (bvxor h!12195 (bvlshr h!12195 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53311 (bvlshr x!53311 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358311 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358311 #b00000000000000000000000000000000))))))

(assert (=> d!84341 (= (toIndex!0 lt!258606 mask!3119) (bvand (bvxor lt!258676 (bvlshr lt!258676 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567653 d!84341))

(declare-fun d!84343 () Bool)

(declare-fun lt!258682 () (_ BitVec 32))

(declare-fun lt!258681 () (_ BitVec 32))

(assert (=> d!84343 (= lt!258682 (bvmul (bvxor lt!258681 (bvlshr lt!258681 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84343 (= lt!258681 ((_ extract 31 0) (bvand (bvxor (select (arr!17105 a!3118) j!142) (bvlshr (select (arr!17105 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84343 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358311 (let ((h!12195 ((_ extract 31 0) (bvand (bvxor (select (arr!17105 a!3118) j!142) (bvlshr (select (arr!17105 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53311 (bvmul (bvxor h!12195 (bvlshr h!12195 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53311 (bvlshr x!53311 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358311 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358311 #b00000000000000000000000000000000))))))

(assert (=> d!84343 (= (toIndex!0 (select (arr!17105 a!3118) j!142) mask!3119) (bvand (bvxor lt!258682 (bvlshr lt!258682 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567653 d!84343))

(declare-fun d!84345 () Bool)

(declare-fun lt!258683 () SeekEntryResult!5554)

(assert (=> d!84345 (and (or (is-Undefined!5554 lt!258683) (not (is-Found!5554 lt!258683)) (and (bvsge (index!24444 lt!258683) #b00000000000000000000000000000000) (bvslt (index!24444 lt!258683) (size!17469 a!3118)))) (or (is-Undefined!5554 lt!258683) (is-Found!5554 lt!258683) (not (is-MissingZero!5554 lt!258683)) (and (bvsge (index!24443 lt!258683) #b00000000000000000000000000000000) (bvslt (index!24443 lt!258683) (size!17469 a!3118)))) (or (is-Undefined!5554 lt!258683) (is-Found!5554 lt!258683) (is-MissingZero!5554 lt!258683) (not (is-MissingVacant!5554 lt!258683)) (and (bvsge (index!24446 lt!258683) #b00000000000000000000000000000000) (bvslt (index!24446 lt!258683) (size!17469 a!3118)))) (or (is-Undefined!5554 lt!258683) (ite (is-Found!5554 lt!258683) (= (select (arr!17105 a!3118) (index!24444 lt!258683)) (select (arr!17105 a!3118) j!142)) (ite (is-MissingZero!5554 lt!258683) (= (select (arr!17105 a!3118) (index!24443 lt!258683)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5554 lt!258683) (= (select (arr!17105 a!3118) (index!24446 lt!258683)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!326729 () SeekEntryResult!5554)

(assert (=> d!84345 (= lt!258683 e!326729)))

(declare-fun c!65114 () Bool)

(declare-fun lt!258684 () SeekEntryResult!5554)

(assert (=> d!84345 (= c!65114 (and (is-Intermediate!5554 lt!258684) (undefined!6366 lt!258684)))))

(assert (=> d!84345 (= lt!258684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17105 a!3118) j!142) mask!3119) (select (arr!17105 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84345 (validMask!0 mask!3119)))

(assert (=> d!84345 (= (seekEntryOrOpen!0 (select (arr!17105 a!3118) j!142) a!3118 mask!3119) lt!258683)))

(declare-fun b!567837 () Bool)

(assert (=> b!567837 (= e!326729 Undefined!5554)))

(declare-fun b!567838 () Bool)

(declare-fun e!326728 () SeekEntryResult!5554)

(assert (=> b!567838 (= e!326729 e!326728)))

(declare-fun lt!258685 () (_ BitVec 64))

(assert (=> b!567838 (= lt!258685 (select (arr!17105 a!3118) (index!24445 lt!258684)))))

(declare-fun c!65116 () Bool)

(assert (=> b!567838 (= c!65116 (= lt!258685 (select (arr!17105 a!3118) j!142)))))

(declare-fun b!567839 () Bool)

(declare-fun c!65115 () Bool)

(assert (=> b!567839 (= c!65115 (= lt!258685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326727 () SeekEntryResult!5554)

(assert (=> b!567839 (= e!326728 e!326727)))

(declare-fun b!567840 () Bool)

(assert (=> b!567840 (= e!326727 (seekKeyOrZeroReturnVacant!0 (x!53307 lt!258684) (index!24445 lt!258684) (index!24445 lt!258684) (select (arr!17105 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567841 () Bool)

(assert (=> b!567841 (= e!326727 (MissingZero!5554 (index!24445 lt!258684)))))

(declare-fun b!567842 () Bool)

(assert (=> b!567842 (= e!326728 (Found!5554 (index!24445 lt!258684)))))

(assert (= (and d!84345 c!65114) b!567837))

(assert (= (and d!84345 (not c!65114)) b!567838))

(assert (= (and b!567838 c!65116) b!567842))

(assert (= (and b!567838 (not c!65116)) b!567839))

(assert (= (and b!567839 c!65115) b!567841))

(assert (= (and b!567839 (not c!65115)) b!567840))

(declare-fun m!546427 () Bool)

(assert (=> d!84345 m!546427))

(assert (=> d!84345 m!546311))

(assert (=> d!84345 m!546293))

(declare-fun m!546429 () Bool)

(assert (=> d!84345 m!546429))

(assert (=> d!84345 m!546293))

(assert (=> d!84345 m!546311))

(declare-fun m!546431 () Bool)

(assert (=> d!84345 m!546431))

(assert (=> d!84345 m!546301))

(declare-fun m!546433 () Bool)

(assert (=> d!84345 m!546433))

(declare-fun m!546435 () Bool)

(assert (=> b!567838 m!546435))

(assert (=> b!567840 m!546293))

(declare-fun m!546437 () Bool)

(assert (=> b!567840 m!546437))

(assert (=> b!567658 d!84345))

(declare-fun bm!32529 () Bool)

(declare-fun call!32532 () Bool)

(assert (=> bm!32529 (= call!32532 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567897 () Bool)

(declare-fun e!326762 () Bool)

(assert (=> b!567897 (= e!326762 call!32532)))

(declare-fun b!567898 () Bool)

(declare-fun e!326761 () Bool)

(declare-fun e!326763 () Bool)

(assert (=> b!567898 (= e!326761 e!326763)))

(declare-fun c!65136 () Bool)

(assert (=> b!567898 (= c!65136 (validKeyInArray!0 (select (arr!17105 a!3118) j!142)))))

(declare-fun b!567899 () Bool)

(assert (=> b!567899 (= e!326763 e!326762)))

(declare-fun lt!258707 () (_ BitVec 64))

(assert (=> b!567899 (= lt!258707 (select (arr!17105 a!3118) j!142))))

(declare-fun lt!258705 () Unit!17810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35618 (_ BitVec 64) (_ BitVec 32)) Unit!17810)

(assert (=> b!567899 (= lt!258705 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258707 j!142))))

(assert (=> b!567899 (arrayContainsKey!0 a!3118 lt!258707 #b00000000000000000000000000000000)))

(declare-fun lt!258706 () Unit!17810)

(assert (=> b!567899 (= lt!258706 lt!258705)))

(declare-fun res!358329 () Bool)

(assert (=> b!567899 (= res!358329 (= (seekEntryOrOpen!0 (select (arr!17105 a!3118) j!142) a!3118 mask!3119) (Found!5554 j!142)))))

(assert (=> b!567899 (=> (not res!358329) (not e!326762))))

(declare-fun d!84347 () Bool)

(declare-fun res!358330 () Bool)

(assert (=> d!84347 (=> res!358330 e!326761)))

(assert (=> d!84347 (= res!358330 (bvsge j!142 (size!17469 a!3118)))))

(assert (=> d!84347 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326761)))

(declare-fun b!567900 () Bool)

(assert (=> b!567900 (= e!326763 call!32532)))

(assert (= (and d!84347 (not res!358330)) b!567898))

(assert (= (and b!567898 c!65136) b!567899))

(assert (= (and b!567898 (not c!65136)) b!567900))

(assert (= (and b!567899 res!358329) b!567897))

(assert (= (or b!567897 b!567900) bm!32529))

(declare-fun m!546467 () Bool)

(assert (=> bm!32529 m!546467))

