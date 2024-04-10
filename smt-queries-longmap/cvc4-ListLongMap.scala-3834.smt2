; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52692 () Bool)

(assert start!52692)

(declare-fun b!574739 () Bool)

(declare-fun e!330681 () Bool)

(declare-fun e!330687 () Bool)

(assert (=> b!574739 (= e!330681 e!330687)))

(declare-fun res!363429 () Bool)

(assert (=> b!574739 (=> (not res!363429) (not e!330687))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5683 0))(
  ( (MissingZero!5683 (index!24959 (_ BitVec 32))) (Found!5683 (index!24960 (_ BitVec 32))) (Intermediate!5683 (undefined!6495 Bool) (index!24961 (_ BitVec 32)) (x!53843 (_ BitVec 32))) (Undefined!5683) (MissingVacant!5683 (index!24962 (_ BitVec 32))) )
))
(declare-fun lt!262523 () SeekEntryResult!5683)

(declare-datatypes ((array!35900 0))(
  ( (array!35901 (arr!17234 (Array (_ BitVec 32) (_ BitVec 64))) (size!17598 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35900)

(declare-fun lt!262528 () SeekEntryResult!5683)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35900 (_ BitVec 32)) SeekEntryResult!5683)

(assert (=> b!574739 (= res!363429 (= lt!262523 (seekKeyOrZeroReturnVacant!0 (x!53843 lt!262528) (index!24961 lt!262528) (index!24961 lt!262528) (select (arr!17234 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!574740 () Bool)

(declare-fun e!330686 () Bool)

(declare-fun e!330682 () Bool)

(assert (=> b!574740 (= e!330686 e!330682)))

(declare-fun res!363434 () Bool)

(assert (=> b!574740 (=> (not res!363434) (not e!330682))))

(declare-fun lt!262524 () SeekEntryResult!5683)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574740 (= res!363434 (or (= lt!262524 (MissingZero!5683 i!1132)) (= lt!262524 (MissingVacant!5683 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35900 (_ BitVec 32)) SeekEntryResult!5683)

(assert (=> b!574740 (= lt!262524 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!574741 () Bool)

(declare-fun e!330684 () Bool)

(assert (=> b!574741 (= e!330682 e!330684)))

(declare-fun res!363438 () Bool)

(assert (=> b!574741 (=> (not res!363438) (not e!330684))))

(declare-fun lt!262529 () (_ BitVec 32))

(declare-fun lt!262531 () (_ BitVec 64))

(declare-fun lt!262530 () array!35900)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35900 (_ BitVec 32)) SeekEntryResult!5683)

(assert (=> b!574741 (= res!363438 (= lt!262528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262529 lt!262531 lt!262530 mask!3119)))))

(declare-fun lt!262527 () (_ BitVec 32))

(assert (=> b!574741 (= lt!262528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262527 (select (arr!17234 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574741 (= lt!262529 (toIndex!0 lt!262531 mask!3119))))

(assert (=> b!574741 (= lt!262531 (select (store (arr!17234 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!574741 (= lt!262527 (toIndex!0 (select (arr!17234 a!3118) j!142) mask!3119))))

(assert (=> b!574741 (= lt!262530 (array!35901 (store (arr!17234 a!3118) i!1132 k!1914) (size!17598 a!3118)))))

(declare-fun b!574742 () Bool)

(declare-fun res!363433 () Bool)

(assert (=> b!574742 (=> (not res!363433) (not e!330686))))

(assert (=> b!574742 (= res!363433 (and (= (size!17598 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17598 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17598 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574743 () Bool)

(declare-fun res!363432 () Bool)

(assert (=> b!574743 (=> (not res!363432) (not e!330682))))

(declare-datatypes ((List!11314 0))(
  ( (Nil!11311) (Cons!11310 (h!12346 (_ BitVec 64)) (t!17542 List!11314)) )
))
(declare-fun arrayNoDuplicates!0 (array!35900 (_ BitVec 32) List!11314) Bool)

(assert (=> b!574743 (= res!363432 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11311))))

(declare-fun b!574744 () Bool)

(assert (=> b!574744 (= e!330687 (= (seekEntryOrOpen!0 lt!262531 lt!262530 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53843 lt!262528) (index!24961 lt!262528) (index!24961 lt!262528) lt!262531 lt!262530 mask!3119)))))

(declare-fun b!574745 () Bool)

(declare-fun e!330680 () Bool)

(declare-fun e!330683 () Bool)

(assert (=> b!574745 (= e!330680 e!330683)))

(declare-fun res!363436 () Bool)

(assert (=> b!574745 (=> res!363436 e!330683)))

(assert (=> b!574745 (= res!363436 (or (undefined!6495 lt!262528) (not (is-Intermediate!5683 lt!262528))))))

(declare-fun b!574746 () Bool)

(declare-fun res!363430 () Bool)

(assert (=> b!574746 (=> (not res!363430) (not e!330686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574746 (= res!363430 (validKeyInArray!0 k!1914))))

(declare-fun b!574747 () Bool)

(declare-fun res!363439 () Bool)

(assert (=> b!574747 (=> (not res!363439) (not e!330686))))

(assert (=> b!574747 (= res!363439 (validKeyInArray!0 (select (arr!17234 a!3118) j!142)))))

(declare-fun b!574748 () Bool)

(assert (=> b!574748 (= e!330683 e!330681)))

(declare-fun res!363435 () Bool)

(assert (=> b!574748 (=> res!363435 e!330681)))

(declare-fun lt!262525 () (_ BitVec 64))

(assert (=> b!574748 (= res!363435 (or (= lt!262525 (select (arr!17234 a!3118) j!142)) (= lt!262525 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574748 (= lt!262525 (select (arr!17234 a!3118) (index!24961 lt!262528)))))

(declare-fun res!363431 () Bool)

(assert (=> start!52692 (=> (not res!363431) (not e!330686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52692 (= res!363431 (validMask!0 mask!3119))))

(assert (=> start!52692 e!330686))

(assert (=> start!52692 true))

(declare-fun array_inv!13030 (array!35900) Bool)

(assert (=> start!52692 (array_inv!13030 a!3118)))

(declare-fun b!574749 () Bool)

(declare-fun res!363440 () Bool)

(assert (=> b!574749 (=> (not res!363440) (not e!330682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35900 (_ BitVec 32)) Bool)

(assert (=> b!574749 (= res!363440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!574750 () Bool)

(assert (=> b!574750 (= e!330684 (not (or (undefined!6495 lt!262528) (not (is-Intermediate!5683 lt!262528)) (let ((bdg!18025 (select (arr!17234 a!3118) (index!24961 lt!262528)))) (or (= bdg!18025 (select (arr!17234 a!3118) j!142)) (= bdg!18025 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24961 lt!262528) #b00000000000000000000000000000000) (bvsge (index!24961 lt!262528) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53843 lt!262528) #b01111111111111111111111111111110) (bvslt (x!53843 lt!262528) #b00000000000000000000000000000000) (not (= bdg!18025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (store (arr!17234 a!3118) i!1132 k!1914) (index!24961 lt!262528)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!574750 e!330680))

(declare-fun res!363428 () Bool)

(assert (=> b!574750 (=> (not res!363428) (not e!330680))))

(assert (=> b!574750 (= res!363428 (= lt!262523 (Found!5683 j!142)))))

(assert (=> b!574750 (= lt!262523 (seekEntryOrOpen!0 (select (arr!17234 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!574750 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18068 0))(
  ( (Unit!18069) )
))
(declare-fun lt!262526 () Unit!18068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18068)

(assert (=> b!574750 (= lt!262526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574751 () Bool)

(declare-fun res!363437 () Bool)

(assert (=> b!574751 (=> (not res!363437) (not e!330686))))

(declare-fun arrayContainsKey!0 (array!35900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574751 (= res!363437 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52692 res!363431) b!574742))

(assert (= (and b!574742 res!363433) b!574747))

(assert (= (and b!574747 res!363439) b!574746))

(assert (= (and b!574746 res!363430) b!574751))

(assert (= (and b!574751 res!363437) b!574740))

(assert (= (and b!574740 res!363434) b!574749))

(assert (= (and b!574749 res!363440) b!574743))

(assert (= (and b!574743 res!363432) b!574741))

(assert (= (and b!574741 res!363438) b!574750))

(assert (= (and b!574750 res!363428) b!574745))

(assert (= (and b!574745 (not res!363436)) b!574748))

(assert (= (and b!574748 (not res!363435)) b!574739))

(assert (= (and b!574739 res!363429) b!574744))

(declare-fun m!553589 () Bool)

(assert (=> b!574750 m!553589))

(declare-fun m!553591 () Bool)

(assert (=> b!574750 m!553591))

(declare-fun m!553593 () Bool)

(assert (=> b!574750 m!553593))

(declare-fun m!553595 () Bool)

(assert (=> b!574750 m!553595))

(declare-fun m!553597 () Bool)

(assert (=> b!574750 m!553597))

(declare-fun m!553599 () Bool)

(assert (=> b!574750 m!553599))

(assert (=> b!574750 m!553591))

(declare-fun m!553601 () Bool)

(assert (=> b!574750 m!553601))

(assert (=> b!574747 m!553591))

(assert (=> b!574747 m!553591))

(declare-fun m!553603 () Bool)

(assert (=> b!574747 m!553603))

(assert (=> b!574748 m!553591))

(assert (=> b!574748 m!553595))

(declare-fun m!553605 () Bool)

(assert (=> b!574749 m!553605))

(assert (=> b!574739 m!553591))

(assert (=> b!574739 m!553591))

(declare-fun m!553607 () Bool)

(assert (=> b!574739 m!553607))

(declare-fun m!553609 () Bool)

(assert (=> b!574740 m!553609))

(declare-fun m!553611 () Bool)

(assert (=> b!574743 m!553611))

(declare-fun m!553613 () Bool)

(assert (=> b!574744 m!553613))

(declare-fun m!553615 () Bool)

(assert (=> b!574744 m!553615))

(declare-fun m!553617 () Bool)

(assert (=> b!574746 m!553617))

(declare-fun m!553619 () Bool)

(assert (=> b!574751 m!553619))

(assert (=> b!574741 m!553591))

(declare-fun m!553621 () Bool)

(assert (=> b!574741 m!553621))

(assert (=> b!574741 m!553591))

(declare-fun m!553623 () Bool)

(assert (=> b!574741 m!553623))

(declare-fun m!553625 () Bool)

(assert (=> b!574741 m!553625))

(assert (=> b!574741 m!553597))

(declare-fun m!553627 () Bool)

(assert (=> b!574741 m!553627))

(assert (=> b!574741 m!553591))

(declare-fun m!553629 () Bool)

(assert (=> b!574741 m!553629))

(declare-fun m!553631 () Bool)

(assert (=> start!52692 m!553631))

(declare-fun m!553633 () Bool)

(assert (=> start!52692 m!553633))

(push 1)

(assert (not b!574743))

(assert (not b!574744))

(assert (not b!574747))

(assert (not b!574751))

(assert (not b!574740))

(assert (not b!574749))

(assert (not b!574739))

(assert (not b!574746))

(assert (not b!574741))

(assert (not b!574750))

(assert (not start!52692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!574810 () Bool)

(declare-fun e!330729 () Bool)

(declare-fun contains!2892 (List!11314 (_ BitVec 64)) Bool)

(assert (=> b!574810 (= e!330729 (contains!2892 Nil!11311 (select (arr!17234 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574811 () Bool)

(declare-fun e!330731 () Bool)

(declare-fun call!32693 () Bool)

(assert (=> b!574811 (= e!330731 call!32693)))

(declare-fun b!574812 () Bool)

(assert (=> b!574812 (= e!330731 call!32693)))

(declare-fun d!85193 () Bool)

(declare-fun res!363473 () Bool)

(declare-fun e!330730 () Bool)

(assert (=> d!85193 (=> res!363473 e!330730)))

(assert (=> d!85193 (= res!363473 (bvsge #b00000000000000000000000000000000 (size!17598 a!3118)))))

(assert (=> d!85193 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11311) e!330730)))

(declare-fun bm!32690 () Bool)

(declare-fun c!66032 () Bool)

(assert (=> bm!32690 (= call!32693 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66032 (Cons!11310 (select (arr!17234 a!3118) #b00000000000000000000000000000000) Nil!11311) Nil!11311)))))

(declare-fun b!574813 () Bool)

(declare-fun e!330732 () Bool)

(assert (=> b!574813 (= e!330730 e!330732)))

(declare-fun res!363472 () Bool)

(assert (=> b!574813 (=> (not res!363472) (not e!330732))))

(assert (=> b!574813 (= res!363472 (not e!330729))))

(declare-fun res!363471 () Bool)

(assert (=> b!574813 (=> (not res!363471) (not e!330729))))

(assert (=> b!574813 (= res!363471 (validKeyInArray!0 (select (arr!17234 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574814 () Bool)

(assert (=> b!574814 (= e!330732 e!330731)))

(assert (=> b!574814 (= c!66032 (validKeyInArray!0 (select (arr!17234 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!85193 (not res!363473)) b!574813))

(assert (= (and b!574813 res!363471) b!574810))

(assert (= (and b!574813 res!363472) b!574814))

(assert (= (and b!574814 c!66032) b!574812))

(assert (= (and b!574814 (not c!66032)) b!574811))

(assert (= (or b!574812 b!574811) bm!32690))

(declare-fun m!553645 () Bool)

(assert (=> b!574810 m!553645))

(assert (=> b!574810 m!553645))

(declare-fun m!553647 () Bool)

(assert (=> b!574810 m!553647))

(assert (=> bm!32690 m!553645))

(declare-fun m!553651 () Bool)

(assert (=> bm!32690 m!553651))

(assert (=> b!574813 m!553645))

(assert (=> b!574813 m!553645))

(declare-fun m!553657 () Bool)

(assert (=> b!574813 m!553657))

(assert (=> b!574814 m!553645))

(assert (=> b!574814 m!553645))

(assert (=> b!574814 m!553657))

(assert (=> b!574743 d!85193))

(declare-fun b!574854 () Bool)

(declare-fun e!330753 () SeekEntryResult!5683)

(declare-fun e!330754 () SeekEntryResult!5683)

(assert (=> b!574854 (= e!330753 e!330754)))

(declare-fun lt!262564 () (_ BitVec 64))

(declare-fun lt!262563 () SeekEntryResult!5683)

(assert (=> b!574854 (= lt!262564 (select (arr!17234 lt!262530) (index!24961 lt!262563)))))

(declare-fun c!66052 () Bool)

(assert (=> b!574854 (= c!66052 (= lt!262564 lt!262531))))

(declare-fun b!574855 () Bool)

(declare-fun e!330755 () SeekEntryResult!5683)

(assert (=> b!574855 (= e!330755 (MissingZero!5683 (index!24961 lt!262563)))))

(declare-fun b!574856 () Bool)

(assert (=> b!574856 (= e!330754 (Found!5683 (index!24961 lt!262563)))))

(declare-fun b!574857 () Bool)

(declare-fun c!66053 () Bool)

(assert (=> b!574857 (= c!66053 (= lt!262564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574857 (= e!330754 e!330755)))

(declare-fun b!574858 () Bool)

(assert (=> b!574858 (= e!330755 (seekKeyOrZeroReturnVacant!0 (x!53843 lt!262563) (index!24961 lt!262563) (index!24961 lt!262563) lt!262531 lt!262530 mask!3119))))

(declare-fun b!574859 () Bool)

(assert (=> b!574859 (= e!330753 Undefined!5683)))

(declare-fun d!85195 () Bool)

(declare-fun lt!262565 () SeekEntryResult!5683)

(assert (=> d!85195 (and (or (is-Undefined!5683 lt!262565) (not (is-Found!5683 lt!262565)) (and (bvsge (index!24960 lt!262565) #b00000000000000000000000000000000) (bvslt (index!24960 lt!262565) (size!17598 lt!262530)))) (or (is-Undefined!5683 lt!262565) (is-Found!5683 lt!262565) (not (is-MissingZero!5683 lt!262565)) (and (bvsge (index!24959 lt!262565) #b00000000000000000000000000000000) (bvslt (index!24959 lt!262565) (size!17598 lt!262530)))) (or (is-Undefined!5683 lt!262565) (is-Found!5683 lt!262565) (is-MissingZero!5683 lt!262565) (not (is-MissingVacant!5683 lt!262565)) (and (bvsge (index!24962 lt!262565) #b00000000000000000000000000000000) (bvslt (index!24962 lt!262565) (size!17598 lt!262530)))) (or (is-Undefined!5683 lt!262565) (ite (is-Found!5683 lt!262565) (= (select (arr!17234 lt!262530) (index!24960 lt!262565)) lt!262531) (ite (is-MissingZero!5683 lt!262565) (= (select (arr!17234 lt!262530) (index!24959 lt!262565)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5683 lt!262565) (= (select (arr!17234 lt!262530) (index!24962 lt!262565)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85195 (= lt!262565 e!330753)))

(declare-fun c!66051 () Bool)

(assert (=> d!85195 (= c!66051 (and (is-Intermediate!5683 lt!262563) (undefined!6495 lt!262563)))))

(assert (=> d!85195 (= lt!262563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!262531 mask!3119) lt!262531 lt!262530 mask!3119))))

(assert (=> d!85195 (validMask!0 mask!3119)))

(assert (=> d!85195 (= (seekEntryOrOpen!0 lt!262531 lt!262530 mask!3119) lt!262565)))

(assert (= (and d!85195 c!66051) b!574859))

(assert (= (and d!85195 (not c!66051)) b!574854))

(assert (= (and b!574854 c!66052) b!574856))

(assert (= (and b!574854 (not c!66052)) b!574857))

(assert (= (and b!574857 c!66053) b!574855))

(assert (= (and b!574857 (not c!66053)) b!574858))

(declare-fun m!553683 () Bool)

(assert (=> b!574854 m!553683))

(declare-fun m!553685 () Bool)

(assert (=> b!574858 m!553685))

(assert (=> d!85195 m!553625))

(declare-fun m!553687 () Bool)

(assert (=> d!85195 m!553687))

(assert (=> d!85195 m!553625))

(declare-fun m!553689 () Bool)

(assert (=> d!85195 m!553689))

(assert (=> d!85195 m!553631))

(declare-fun m!553691 () Bool)

(assert (=> d!85195 m!553691))

(declare-fun m!553693 () Bool)

(assert (=> d!85195 m!553693))

(assert (=> b!574744 d!85195))

(declare-fun b!574932 () Bool)

(declare-fun c!66082 () Bool)

(declare-fun lt!262595 () (_ BitVec 64))

(assert (=> b!574932 (= c!66082 (= lt!262595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330797 () SeekEntryResult!5683)

(declare-fun e!330799 () SeekEntryResult!5683)

(assert (=> b!574932 (= e!330797 e!330799)))

(declare-fun lt!262596 () SeekEntryResult!5683)

(declare-fun d!85207 () Bool)

(assert (=> d!85207 (and (or (is-Undefined!5683 lt!262596) (not (is-Found!5683 lt!262596)) (and (bvsge (index!24960 lt!262596) #b00000000000000000000000000000000) (bvslt (index!24960 lt!262596) (size!17598 lt!262530)))) (or (is-Undefined!5683 lt!262596) (is-Found!5683 lt!262596) (not (is-MissingVacant!5683 lt!262596)) (not (= (index!24962 lt!262596) (index!24961 lt!262528))) (and (bvsge (index!24962 lt!262596) #b00000000000000000000000000000000) (bvslt (index!24962 lt!262596) (size!17598 lt!262530)))) (or (is-Undefined!5683 lt!262596) (ite (is-Found!5683 lt!262596) (= (select (arr!17234 lt!262530) (index!24960 lt!262596)) lt!262531) (and (is-MissingVacant!5683 lt!262596) (= (index!24962 lt!262596) (index!24961 lt!262528)) (= (select (arr!17234 lt!262530) (index!24962 lt!262596)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!330798 () SeekEntryResult!5683)

(assert (=> d!85207 (= lt!262596 e!330798)))

(declare-fun c!66083 () Bool)

(assert (=> d!85207 (= c!66083 (bvsge (x!53843 lt!262528) #b01111111111111111111111111111110))))

(assert (=> d!85207 (= lt!262595 (select (arr!17234 lt!262530) (index!24961 lt!262528)))))

(assert (=> d!85207 (validMask!0 mask!3119)))

(assert (=> d!85207 (= (seekKeyOrZeroReturnVacant!0 (x!53843 lt!262528) (index!24961 lt!262528) (index!24961 lt!262528) lt!262531 lt!262530 mask!3119) lt!262596)))

(declare-fun b!574933 () Bool)

(assert (=> b!574933 (= e!330799 (MissingVacant!5683 (index!24961 lt!262528)))))

(declare-fun b!574934 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574934 (= e!330799 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53843 lt!262528) #b00000000000000000000000000000001) (nextIndex!0 (index!24961 lt!262528) (x!53843 lt!262528) mask!3119) (index!24961 lt!262528) lt!262531 lt!262530 mask!3119))))

(declare-fun b!574935 () Bool)

(assert (=> b!574935 (= e!330798 e!330797)))

(declare-fun c!66081 () Bool)

(assert (=> b!574935 (= c!66081 (= lt!262595 lt!262531))))

(declare-fun b!574936 () Bool)

(assert (=> b!574936 (= e!330798 Undefined!5683)))

(declare-fun b!574937 () Bool)

(assert (=> b!574937 (= e!330797 (Found!5683 (index!24961 lt!262528)))))

(assert (= (and d!85207 c!66083) b!574936))

(assert (= (and d!85207 (not c!66083)) b!574935))

(assert (= (and b!574935 c!66081) b!574937))

(assert (= (and b!574935 (not c!66081)) b!574932))

(assert (= (and b!574932 c!66082) b!574933))

(assert (= (and b!574932 (not c!66082)) b!574934))

(declare-fun m!553727 () Bool)

(assert (=> d!85207 m!553727))

(declare-fun m!553729 () Bool)

(assert (=> d!85207 m!553729))

(declare-fun m!553731 () Bool)

(assert (=> d!85207 m!553731))

(assert (=> d!85207 m!553631))

(declare-fun m!553733 () Bool)

(assert (=> b!574934 m!553733))

(assert (=> b!574934 m!553733))

(declare-fun m!553737 () Bool)

(assert (=> b!574934 m!553737))

(assert (=> b!574744 d!85207))

(declare-fun d!85223 () Bool)

(declare-fun res!363502 () Bool)

(declare-fun e!330824 () Bool)

(assert (=> d!85223 (=> res!363502 e!330824)))

(assert (=> d!85223 (= res!363502 (bvsge #b00000000000000000000000000000000 (size!17598 a!3118)))))

(assert (=> d!85223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330824)))

(declare-fun b!574982 () Bool)

(declare-fun e!330826 () Bool)

(declare-fun e!330825 () Bool)

(assert (=> b!574982 (= e!330826 e!330825)))

(declare-fun lt!262619 () (_ BitVec 64))

(assert (=> b!574982 (= lt!262619 (select (arr!17234 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262618 () Unit!18068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35900 (_ BitVec 64) (_ BitVec 32)) Unit!18068)

(assert (=> b!574982 (= lt!262618 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262619 #b00000000000000000000000000000000))))

(assert (=> b!574982 (arrayContainsKey!0 a!3118 lt!262619 #b00000000000000000000000000000000)))

(declare-fun lt!262617 () Unit!18068)

(assert (=> b!574982 (= lt!262617 lt!262618)))

(declare-fun res!363501 () Bool)

(assert (=> b!574982 (= res!363501 (= (seekEntryOrOpen!0 (select (arr!17234 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5683 #b00000000000000000000000000000000)))))

(assert (=> b!574982 (=> (not res!363501) (not e!330825))))

(declare-fun b!574983 () Bool)

(declare-fun call!32696 () Bool)

(assert (=> b!574983 (= e!330826 call!32696)))

(declare-fun bm!32693 () Bool)

(assert (=> bm!32693 (= call!32696 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!574984 () Bool)

(assert (=> b!574984 (= e!330824 e!330826)))

(declare-fun c!66104 () Bool)

(assert (=> b!574984 (= c!66104 (validKeyInArray!0 (select (arr!17234 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574985 () Bool)

(assert (=> b!574985 (= e!330825 call!32696)))

(assert (= (and d!85223 (not res!363502)) b!574984))

(assert (= (and b!574984 c!66104) b!574982))

(assert (= (and b!574984 (not c!66104)) b!574983))

(assert (= (and b!574982 res!363501) b!574985))

(assert (= (or b!574985 b!574983) bm!32693))

(assert (=> b!574982 m!553645))

(declare-fun m!553779 () Bool)

(assert (=> b!574982 m!553779))

(declare-fun m!553781 () Bool)

(assert (=> b!574982 m!553781))

(assert (=> b!574982 m!553645))

(declare-fun m!553783 () Bool)

(assert (=> b!574982 m!553783))

(declare-fun m!553785 () Bool)

(assert (=> bm!32693 m!553785))

(assert (=> b!574984 m!553645))

(assert (=> b!574984 m!553645))

(assert (=> b!574984 m!553657))

(assert (=> b!574749 d!85223))

(declare-fun d!85237 () Bool)

(assert (=> d!85237 (= (validKeyInArray!0 (select (arr!17234 a!3118) j!142)) (and (not (= (select (arr!17234 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17234 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574747 d!85237))

(declare-fun d!85239 () Bool)

(assert (=> d!85239 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52692 d!85239))

(declare-fun d!85247 () Bool)

(assert (=> d!85247 (= (array_inv!13030 a!3118) (bvsge (size!17598 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52692 d!85247))

(declare-fun d!85251 () Bool)

(assert (=> d!85251 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574746 d!85251))

(declare-fun d!85253 () Bool)

(declare-fun res!363515 () Bool)

(declare-fun e!330855 () Bool)

(assert (=> d!85253 (=> res!363515 e!330855)))

(assert (=> d!85253 (= res!363515 (= (select (arr!17234 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!85253 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!330855)))

(declare-fun b!575030 () Bool)

(declare-fun e!330856 () Bool)

(assert (=> b!575030 (= e!330855 e!330856)))

(declare-fun res!363516 () Bool)

(assert (=> b!575030 (=> (not res!363516) (not e!330856))))

(assert (=> b!575030 (= res!363516 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17598 a!3118)))))

(declare-fun b!575031 () Bool)

(assert (=> b!575031 (= e!330856 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85253 (not res!363515)) b!575030))

(assert (= (and b!575030 res!363516) b!575031))

(assert (=> d!85253 m!553645))

(declare-fun m!553823 () Bool)

(assert (=> b!575031 m!553823))

(assert (=> b!574751 d!85253))

(declare-fun b!575074 () Bool)

(declare-fun lt!262666 () SeekEntryResult!5683)

(assert (=> b!575074 (and (bvsge (index!24961 lt!262666) #b00000000000000000000000000000000) (bvslt (index!24961 lt!262666) (size!17598 lt!262530)))))

(declare-fun res!363531 () Bool)

(assert (=> b!575074 (= res!363531 (= (select (arr!17234 lt!262530) (index!24961 lt!262666)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330884 () Bool)

(assert (=> b!575074 (=> res!363531 e!330884)))

(declare-fun b!575075 () Bool)

(declare-fun e!330883 () SeekEntryResult!5683)

(declare-fun e!330886 () SeekEntryResult!5683)

(assert (=> b!575075 (= e!330883 e!330886)))

(declare-fun c!66137 () Bool)

(declare-fun lt!262665 () (_ BitVec 64))

(assert (=> b!575075 (= c!66137 (or (= lt!262665 lt!262531) (= (bvadd lt!262665 lt!262665) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!575076 () Bool)

(declare-fun e!330882 () Bool)

(assert (=> b!575076 (= e!330882 (bvsge (x!53843 lt!262666) #b01111111111111111111111111111110))))

(declare-fun d!85255 () Bool)

(assert (=> d!85255 e!330882))

(declare-fun c!66138 () Bool)

(assert (=> d!85255 (= c!66138 (and (is-Intermediate!5683 lt!262666) (undefined!6495 lt!262666)))))

(assert (=> d!85255 (= lt!262666 e!330883)))

(declare-fun c!66136 () Bool)

(assert (=> d!85255 (= c!66136 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85255 (= lt!262665 (select (arr!17234 lt!262530) lt!262529))))

(assert (=> d!85255 (validMask!0 mask!3119)))

(assert (=> d!85255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262529 lt!262531 lt!262530 mask!3119) lt!262666)))

(declare-fun b!575077 () Bool)

(declare-fun e!330885 () Bool)

(assert (=> b!575077 (= e!330882 e!330885)))

(declare-fun res!363529 () Bool)

(assert (=> b!575077 (= res!363529 (and (is-Intermediate!5683 lt!262666) (not (undefined!6495 lt!262666)) (bvslt (x!53843 lt!262666) #b01111111111111111111111111111110) (bvsge (x!53843 lt!262666) #b00000000000000000000000000000000) (bvsge (x!53843 lt!262666) #b00000000000000000000000000000000)))))

(assert (=> b!575077 (=> (not res!363529) (not e!330885))))

(declare-fun b!575078 () Bool)

(assert (=> b!575078 (= e!330886 (Intermediate!5683 false lt!262529 #b00000000000000000000000000000000))))

(declare-fun b!575079 () Bool)

(assert (=> b!575079 (= e!330886 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262529 #b00000000000000000000000000000000 mask!3119) lt!262531 lt!262530 mask!3119))))

(declare-fun b!575080 () Bool)

(assert (=> b!575080 (and (bvsge (index!24961 lt!262666) #b00000000000000000000000000000000) (bvslt (index!24961 lt!262666) (size!17598 lt!262530)))))

(assert (=> b!575080 (= e!330884 (= (select (arr!17234 lt!262530) (index!24961 lt!262666)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!575081 () Bool)

(assert (=> b!575081 (and (bvsge (index!24961 lt!262666) #b00000000000000000000000000000000) (bvslt (index!24961 lt!262666) (size!17598 lt!262530)))))

(declare-fun res!363530 () Bool)

(assert (=> b!575081 (= res!363530 (= (select (arr!17234 lt!262530) (index!24961 lt!262666)) lt!262531))))

(assert (=> b!575081 (=> res!363530 e!330884)))

(assert (=> b!575081 (= e!330885 e!330884)))

(declare-fun b!575082 () Bool)

(assert (=> b!575082 (= e!330883 (Intermediate!5683 true lt!262529 #b00000000000000000000000000000000))))

(assert (= (and d!85255 c!66136) b!575082))

(assert (= (and d!85255 (not c!66136)) b!575075))

(assert (= (and b!575075 c!66137) b!575078))

(assert (= (and b!575075 (not c!66137)) b!575079))

(assert (= (and d!85255 c!66138) b!575076))

(assert (= (and d!85255 (not c!66138)) b!575077))

(assert (= (and b!575077 res!363529) b!575081))

(assert (= (and b!575081 (not res!363530)) b!575074))

(assert (= (and b!575074 (not res!363531)) b!575080))

(declare-fun m!553853 () Bool)

(assert (=> d!85255 m!553853))

(assert (=> d!85255 m!553631))

(declare-fun m!553855 () Bool)

(assert (=> b!575079 m!553855))

(assert (=> b!575079 m!553855))

(declare-fun m!553857 () Bool)

(assert (=> b!575079 m!553857))

(declare-fun m!553859 () Bool)

(assert (=> b!575074 m!553859))

(assert (=> b!575080 m!553859))

(assert (=> b!575081 m!553859))

(assert (=> b!574741 d!85255))

(declare-fun b!575083 () Bool)

(declare-fun lt!262668 () SeekEntryResult!5683)

(assert (=> b!575083 (and (bvsge (index!24961 lt!262668) #b00000000000000000000000000000000) (bvslt (index!24961 lt!262668) (size!17598 a!3118)))))

(declare-fun res!363534 () Bool)

(assert (=> b!575083 (= res!363534 (= (select (arr!17234 a!3118) (index!24961 lt!262668)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330889 () Bool)

(assert (=> b!575083 (=> res!363534 e!330889)))

(declare-fun b!575084 () Bool)

(declare-fun e!330888 () SeekEntryResult!5683)

(declare-fun e!330891 () SeekEntryResult!5683)

(assert (=> b!575084 (= e!330888 e!330891)))

(declare-fun lt!262667 () (_ BitVec 64))

(declare-fun c!66140 () Bool)

(assert (=> b!575084 (= c!66140 (or (= lt!262667 (select (arr!17234 a!3118) j!142)) (= (bvadd lt!262667 lt!262667) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!575085 () Bool)

(declare-fun e!330887 () Bool)

(assert (=> b!575085 (= e!330887 (bvsge (x!53843 lt!262668) #b01111111111111111111111111111110))))

(declare-fun d!85271 () Bool)

(assert (=> d!85271 e!330887))

(declare-fun c!66141 () Bool)

(assert (=> d!85271 (= c!66141 (and (is-Intermediate!5683 lt!262668) (undefined!6495 lt!262668)))))

(assert (=> d!85271 (= lt!262668 e!330888)))

(declare-fun c!66139 () Bool)

(assert (=> d!85271 (= c!66139 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85271 (= lt!262667 (select (arr!17234 a!3118) lt!262527))))

(assert (=> d!85271 (validMask!0 mask!3119)))

(assert (=> d!85271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262527 (select (arr!17234 a!3118) j!142) a!3118 mask!3119) lt!262668)))

(declare-fun b!575086 () Bool)

(declare-fun e!330890 () Bool)

(assert (=> b!575086 (= e!330887 e!330890)))

(declare-fun res!363532 () Bool)

(assert (=> b!575086 (= res!363532 (and (is-Intermediate!5683 lt!262668) (not (undefined!6495 lt!262668)) (bvslt (x!53843 lt!262668) #b01111111111111111111111111111110) (bvsge (x!53843 lt!262668) #b00000000000000000000000000000000) (bvsge (x!53843 lt!262668) #b00000000000000000000000000000000)))))

(assert (=> b!575086 (=> (not res!363532) (not e!330890))))

(declare-fun b!575087 () Bool)

(assert (=> b!575087 (= e!330891 (Intermediate!5683 false lt!262527 #b00000000000000000000000000000000))))

(declare-fun b!575088 () Bool)

(assert (=> b!575088 (= e!330891 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262527 #b00000000000000000000000000000000 mask!3119) (select (arr!17234 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575089 () Bool)

(assert (=> b!575089 (and (bvsge (index!24961 lt!262668) #b00000000000000000000000000000000) (bvslt (index!24961 lt!262668) (size!17598 a!3118)))))

(assert (=> b!575089 (= e!330889 (= (select (arr!17234 a!3118) (index!24961 lt!262668)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!575090 () Bool)

(assert (=> b!575090 (and (bvsge (index!24961 lt!262668) #b00000000000000000000000000000000) (bvslt (index!24961 lt!262668) (size!17598 a!3118)))))

(declare-fun res!363533 () Bool)

(assert (=> b!575090 (= res!363533 (= (select (arr!17234 a!3118) (index!24961 lt!262668)) (select (arr!17234 a!3118) j!142)))))

(assert (=> b!575090 (=> res!363533 e!330889)))

(assert (=> b!575090 (= e!330890 e!330889)))

(declare-fun b!575091 () Bool)

(assert (=> b!575091 (= e!330888 (Intermediate!5683 true lt!262527 #b00000000000000000000000000000000))))

(assert (= (and d!85271 c!66139) b!575091))

(assert (= (and d!85271 (not c!66139)) b!575084))

(assert (= (and b!575084 c!66140) b!575087))

(assert (= (and b!575084 (not c!66140)) b!575088))

(assert (= (and d!85271 c!66141) b!575085))

(assert (= (and d!85271 (not c!66141)) b!575086))

(assert (= (and b!575086 res!363532) b!575090))

(assert (= (and b!575090 (not res!363533)) b!575083))

(assert (= (and b!575083 (not res!363534)) b!575089))

(declare-fun m!553861 () Bool)

(assert (=> d!85271 m!553861))

(assert (=> d!85271 m!553631))

(declare-fun m!553863 () Bool)

(assert (=> b!575088 m!553863))

(assert (=> b!575088 m!553863))

(assert (=> b!575088 m!553591))

(declare-fun m!553865 () Bool)

(assert (=> b!575088 m!553865))

(declare-fun m!553867 () Bool)

(assert (=> b!575083 m!553867))

(assert (=> b!575089 m!553867))

(assert (=> b!575090 m!553867))

(assert (=> b!574741 d!85271))

(declare-fun d!85273 () Bool)

(declare-fun lt!262677 () (_ BitVec 32))

(declare-fun lt!262676 () (_ BitVec 32))

(assert (=> d!85273 (= lt!262677 (bvmul (bvxor lt!262676 (bvlshr lt!262676 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85273 (= lt!262676 ((_ extract 31 0) (bvand (bvxor lt!262531 (bvlshr lt!262531 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85273 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363541 (let ((h!12349 ((_ extract 31 0) (bvand (bvxor lt!262531 (bvlshr lt!262531 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53852 (bvmul (bvxor h!12349 (bvlshr h!12349 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53852 (bvlshr x!53852 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363541 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363541 #b00000000000000000000000000000000))))))

(assert (=> d!85273 (= (toIndex!0 lt!262531 mask!3119) (bvand (bvxor lt!262677 (bvlshr lt!262677 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574741 d!85273))

(declare-fun d!85277 () Bool)

(declare-fun lt!262679 () (_ BitVec 32))

(declare-fun lt!262678 () (_ BitVec 32))

(assert (=> d!85277 (= lt!262679 (bvmul (bvxor lt!262678 (bvlshr lt!262678 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85277 (= lt!262678 ((_ extract 31 0) (bvand (bvxor (select (arr!17234 a!3118) j!142) (bvlshr (select (arr!17234 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85277 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363541 (let ((h!12349 ((_ extract 31 0) (bvand (bvxor (select (arr!17234 a!3118) j!142) (bvlshr (select (arr!17234 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53852 (bvmul (bvxor h!12349 (bvlshr h!12349 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53852 (bvlshr x!53852 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363541 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363541 #b00000000000000000000000000000000))))))

(assert (=> d!85277 (= (toIndex!0 (select (arr!17234 a!3118) j!142) mask!3119) (bvand (bvxor lt!262679 (bvlshr lt!262679 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574741 d!85277))

(declare-fun b!575111 () Bool)

(declare-fun e!330907 () SeekEntryResult!5683)

(declare-fun e!330908 () SeekEntryResult!5683)

(assert (=> b!575111 (= e!330907 e!330908)))

(declare-fun lt!262681 () (_ BitVec 64))

(declare-fun lt!262680 () SeekEntryResult!5683)

(assert (=> b!575111 (= lt!262681 (select (arr!17234 a!3118) (index!24961 lt!262680)))))

(declare-fun c!66147 () Bool)

(assert (=> b!575111 (= c!66147 (= lt!262681 (select (arr!17234 a!3118) j!142)))))

(declare-fun b!575112 () Bool)

(declare-fun e!330909 () SeekEntryResult!5683)

(assert (=> b!575112 (= e!330909 (MissingZero!5683 (index!24961 lt!262680)))))

(declare-fun b!575113 () Bool)

(assert (=> b!575113 (= e!330908 (Found!5683 (index!24961 lt!262680)))))

(declare-fun b!575114 () Bool)

(declare-fun c!66148 () Bool)

(assert (=> b!575114 (= c!66148 (= lt!262681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!575114 (= e!330908 e!330909)))

(declare-fun b!575115 () Bool)

(assert (=> b!575115 (= e!330909 (seekKeyOrZeroReturnVacant!0 (x!53843 lt!262680) (index!24961 lt!262680) (index!24961 lt!262680) (select (arr!17234 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575116 () Bool)

(assert (=> b!575116 (= e!330907 Undefined!5683)))

(declare-fun d!85279 () Bool)

(declare-fun lt!262682 () SeekEntryResult!5683)

(assert (=> d!85279 (and (or (is-Undefined!5683 lt!262682) (not (is-Found!5683 lt!262682)) (and (bvsge (index!24960 lt!262682) #b00000000000000000000000000000000) (bvslt (index!24960 lt!262682) (size!17598 a!3118)))) (or (is-Undefined!5683 lt!262682) (is-Found!5683 lt!262682) (not (is-MissingZero!5683 lt!262682)) (and (bvsge (index!24959 lt!262682) #b00000000000000000000000000000000) (bvslt (index!24959 lt!262682) (size!17598 a!3118)))) (or (is-Undefined!5683 lt!262682) (is-Found!5683 lt!262682) (is-MissingZero!5683 lt!262682) (not (is-MissingVacant!5683 lt!262682)) (and (bvsge (index!24962 lt!262682) #b00000000000000000000000000000000) (bvslt (index!24962 lt!262682) (size!17598 a!3118)))) (or (is-Undefined!5683 lt!262682) (ite (is-Found!5683 lt!262682) (= (select (arr!17234 a!3118) (index!24960 lt!262682)) (select (arr!17234 a!3118) j!142)) (ite (is-MissingZero!5683 lt!262682) (= (select (arr!17234 a!3118) (index!24959 lt!262682)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5683 lt!262682) (= (select (arr!17234 a!3118) (index!24962 lt!262682)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85279 (= lt!262682 e!330907)))

(declare-fun c!66146 () Bool)

(assert (=> d!85279 (= c!66146 (and (is-Intermediate!5683 lt!262680) (undefined!6495 lt!262680)))))

(assert (=> d!85279 (= lt!262680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17234 a!3118) j!142) mask!3119) (select (arr!17234 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85279 (validMask!0 mask!3119)))

(assert (=> d!85279 (= (seekEntryOrOpen!0 (select (arr!17234 a!3118) j!142) a!3118 mask!3119) lt!262682)))

(assert (= (and d!85279 c!66146) b!575116))

(assert (= (and d!85279 (not c!66146)) b!575111))

(assert (= (and b!575111 c!66147) b!575113))

(assert (= (and b!575111 (not c!66147)) b!575114))

(assert (= (and b!575114 c!66148) b!575112))

(assert (= (and b!575114 (not c!66148)) b!575115))

(declare-fun m!553883 () Bool)

(assert (=> b!575111 m!553883))

(assert (=> b!575115 m!553591))

(declare-fun m!553885 () Bool)

(assert (=> b!575115 m!553885))

(assert (=> d!85279 m!553591))

(assert (=> d!85279 m!553621))

(declare-fun m!553887 () Bool)

(assert (=> d!85279 m!553887))

(assert (=> d!85279 m!553621))

(assert (=> d!85279 m!553591))

(declare-fun m!553889 () Bool)

(assert (=> d!85279 m!553889))

(assert (=> d!85279 m!553631))

(declare-fun m!553891 () Bool)

(assert (=> d!85279 m!553891))

(declare-fun m!553893 () Bool)

(assert (=> d!85279 m!553893))

(assert (=> b!574750 d!85279))

(declare-fun d!85281 () Bool)

(declare-fun res!363548 () Bool)

(declare-fun e!330910 () Bool)

(assert (=> d!85281 (=> res!363548 e!330910)))

(assert (=> d!85281 (= res!363548 (bvsge j!142 (size!17598 a!3118)))))

(assert (=> d!85281 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330910)))

(declare-fun b!575117 () Bool)

(declare-fun e!330912 () Bool)

(declare-fun e!330911 () Bool)

(assert (=> b!575117 (= e!330912 e!330911)))

(declare-fun lt!262685 () (_ BitVec 64))

(assert (=> b!575117 (= lt!262685 (select (arr!17234 a!3118) j!142))))

(declare-fun lt!262684 () Unit!18068)

(assert (=> b!575117 (= lt!262684 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262685 j!142))))

(assert (=> b!575117 (arrayContainsKey!0 a!3118 lt!262685 #b00000000000000000000000000000000)))

(declare-fun lt!262683 () Unit!18068)

(assert (=> b!575117 (= lt!262683 lt!262684)))

(declare-fun res!363547 () Bool)

(assert (=> b!575117 (= res!363547 (= (seekEntryOrOpen!0 (select (arr!17234 a!3118) j!142) a!3118 mask!3119) (Found!5683 j!142)))))

(assert (=> b!575117 (=> (not res!363547) (not e!330911))))

(declare-fun b!575118 () Bool)

(declare-fun call!32708 () Bool)

(assert (=> b!575118 (= e!330912 call!32708)))

(declare-fun bm!32705 () Bool)

(assert (=> bm!32705 (= call!32708 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!575119 () Bool)

(assert (=> b!575119 (= e!330910 e!330912)))

(declare-fun c!66149 () Bool)

(assert (=> b!575119 (= c!66149 (validKeyInArray!0 (select (arr!17234 a!3118) j!142)))))

(declare-fun b!575120 () Bool)

(assert (=> b!575120 (= e!330911 call!32708)))

(assert (= (and d!85281 (not res!363548)) b!575119))

(assert (= (and b!575119 c!66149) b!575117))

(assert (= (and b!575119 (not c!66149)) b!575118))

(assert (= (and b!575117 res!363547) b!575120))

(assert (= (or b!575120 b!575118) bm!32705))

(assert (=> b!575117 m!553591))

(declare-fun m!553895 () Bool)

(assert (=> b!575117 m!553895))

(declare-fun m!553897 () Bool)

(assert (=> b!575117 m!553897))

(assert (=> b!575117 m!553591))

(assert (=> b!575117 m!553601))

(declare-fun m!553899 () Bool)

(assert (=> bm!32705 m!553899))

(assert (=> b!575119 m!553591))

(assert (=> b!575119 m!553591))

(assert (=> b!575119 m!553603))

(assert (=> b!574750 d!85281))

(declare-fun d!85283 () Bool)

(assert (=> d!85283 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262688 () Unit!18068)

(declare-fun choose!38 (array!35900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18068)

(assert (=> d!85283 (= lt!262688 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85283 (validMask!0 mask!3119)))

(assert (=> d!85283 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262688)))

(declare-fun bs!17778 () Bool)

(assert (= bs!17778 d!85283))

(assert (=> bs!17778 m!553593))

(declare-fun m!553901 () Bool)

(assert (=> bs!17778 m!553901))

(assert (=> bs!17778 m!553631))

(assert (=> b!574750 d!85283))

(declare-fun b!575121 () Bool)

(declare-fun c!66151 () Bool)

(declare-fun lt!262689 () (_ BitVec 64))

(assert (=> b!575121 (= c!66151 (= lt!262689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330913 () SeekEntryResult!5683)

(declare-fun e!330915 () SeekEntryResult!5683)

(assert (=> b!575121 (= e!330913 e!330915)))

