; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52690 () Bool)

(assert start!52690)

(declare-fun b!574700 () Bool)

(declare-fun e!330658 () Bool)

(declare-fun e!330662 () Bool)

(assert (=> b!574700 (= e!330658 e!330662)))

(declare-fun res!363395 () Bool)

(assert (=> b!574700 (=> res!363395 e!330662)))

(declare-fun lt!262499 () (_ BitVec 64))

(declare-datatypes ((array!35898 0))(
  ( (array!35899 (arr!17233 (Array (_ BitVec 32) (_ BitVec 64))) (size!17597 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35898)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!574700 (= res!363395 (or (= lt!262499 (select (arr!17233 a!3118) j!142)) (= lt!262499 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5682 0))(
  ( (MissingZero!5682 (index!24955 (_ BitVec 32))) (Found!5682 (index!24956 (_ BitVec 32))) (Intermediate!5682 (undefined!6494 Bool) (index!24957 (_ BitVec 32)) (x!53842 (_ BitVec 32))) (Undefined!5682) (MissingVacant!5682 (index!24958 (_ BitVec 32))) )
))
(declare-fun lt!262500 () SeekEntryResult!5682)

(assert (=> b!574700 (= lt!262499 (select (arr!17233 a!3118) (index!24957 lt!262500)))))

(declare-fun res!363394 () Bool)

(declare-fun e!330657 () Bool)

(assert (=> start!52690 (=> (not res!363394) (not e!330657))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52690 (= res!363394 (validMask!0 mask!3119))))

(assert (=> start!52690 e!330657))

(assert (=> start!52690 true))

(declare-fun array_inv!13029 (array!35898) Bool)

(assert (=> start!52690 (array_inv!13029 a!3118)))

(declare-fun b!574701 () Bool)

(declare-fun e!330661 () Bool)

(assert (=> b!574701 (= e!330661 e!330658)))

(declare-fun res!363391 () Bool)

(assert (=> b!574701 (=> res!363391 e!330658)))

(get-info :version)

(assert (=> b!574701 (= res!363391 (or (undefined!6494 lt!262500) (not ((_ is Intermediate!5682) lt!262500))))))

(declare-fun b!574702 () Bool)

(declare-fun e!330659 () Bool)

(declare-fun e!330660 () Bool)

(assert (=> b!574702 (= e!330659 e!330660)))

(declare-fun res!363401 () Bool)

(assert (=> b!574702 (=> (not res!363401) (not e!330660))))

(declare-fun lt!262501 () array!35898)

(declare-fun lt!262497 () (_ BitVec 32))

(declare-fun lt!262502 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35898 (_ BitVec 32)) SeekEntryResult!5682)

(assert (=> b!574702 (= res!363401 (= lt!262500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262497 lt!262502 lt!262501 mask!3119)))))

(declare-fun lt!262496 () (_ BitVec 32))

(assert (=> b!574702 (= lt!262500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262496 (select (arr!17233 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574702 (= lt!262497 (toIndex!0 lt!262502 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574702 (= lt!262502 (select (store (arr!17233 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!574702 (= lt!262496 (toIndex!0 (select (arr!17233 a!3118) j!142) mask!3119))))

(assert (=> b!574702 (= lt!262501 (array!35899 (store (arr!17233 a!3118) i!1132 k0!1914) (size!17597 a!3118)))))

(declare-fun b!574703 () Bool)

(assert (=> b!574703 (= e!330657 e!330659)))

(declare-fun res!363398 () Bool)

(assert (=> b!574703 (=> (not res!363398) (not e!330659))))

(declare-fun lt!262498 () SeekEntryResult!5682)

(assert (=> b!574703 (= res!363398 (or (= lt!262498 (MissingZero!5682 i!1132)) (= lt!262498 (MissingVacant!5682 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35898 (_ BitVec 32)) SeekEntryResult!5682)

(assert (=> b!574703 (= lt!262498 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!574704 () Bool)

(declare-fun res!363389 () Bool)

(assert (=> b!574704 (=> (not res!363389) (not e!330657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574704 (= res!363389 (validKeyInArray!0 (select (arr!17233 a!3118) j!142)))))

(declare-fun b!574705 () Bool)

(declare-fun res!363397 () Bool)

(assert (=> b!574705 (=> (not res!363397) (not e!330657))))

(assert (=> b!574705 (= res!363397 (validKeyInArray!0 k0!1914))))

(declare-fun b!574706 () Bool)

(assert (=> b!574706 (= e!330660 (not (or (undefined!6494 lt!262500) (not ((_ is Intermediate!5682) lt!262500)) (let ((bdg!18025 (select (arr!17233 a!3118) (index!24957 lt!262500)))) (or (= bdg!18025 (select (arr!17233 a!3118) j!142)) (= bdg!18025 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24957 lt!262500) #b00000000000000000000000000000000) (bvsge (index!24957 lt!262500) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53842 lt!262500) #b01111111111111111111111111111110) (bvslt (x!53842 lt!262500) #b00000000000000000000000000000000) (not (= bdg!18025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (store (arr!17233 a!3118) i!1132 k0!1914) (index!24957 lt!262500)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!574706 e!330661))

(declare-fun res!363392 () Bool)

(assert (=> b!574706 (=> (not res!363392) (not e!330661))))

(declare-fun lt!262503 () SeekEntryResult!5682)

(assert (=> b!574706 (= res!363392 (= lt!262503 (Found!5682 j!142)))))

(assert (=> b!574706 (= lt!262503 (seekEntryOrOpen!0 (select (arr!17233 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35898 (_ BitVec 32)) Bool)

(assert (=> b!574706 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18066 0))(
  ( (Unit!18067) )
))
(declare-fun lt!262504 () Unit!18066)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18066)

(assert (=> b!574706 (= lt!262504 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574707 () Bool)

(declare-fun res!363393 () Bool)

(assert (=> b!574707 (=> (not res!363393) (not e!330657))))

(assert (=> b!574707 (= res!363393 (and (= (size!17597 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17597 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17597 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574708 () Bool)

(declare-fun res!363399 () Bool)

(assert (=> b!574708 (=> (not res!363399) (not e!330659))))

(assert (=> b!574708 (= res!363399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!574709 () Bool)

(declare-fun res!363390 () Bool)

(assert (=> b!574709 (=> (not res!363390) (not e!330659))))

(declare-datatypes ((List!11313 0))(
  ( (Nil!11310) (Cons!11309 (h!12345 (_ BitVec 64)) (t!17541 List!11313)) )
))
(declare-fun arrayNoDuplicates!0 (array!35898 (_ BitVec 32) List!11313) Bool)

(assert (=> b!574709 (= res!363390 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11310))))

(declare-fun b!574710 () Bool)

(declare-fun res!363400 () Bool)

(assert (=> b!574710 (=> (not res!363400) (not e!330657))))

(declare-fun arrayContainsKey!0 (array!35898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574710 (= res!363400 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!330656 () Bool)

(declare-fun b!574711 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35898 (_ BitVec 32)) SeekEntryResult!5682)

(assert (=> b!574711 (= e!330656 (= (seekEntryOrOpen!0 lt!262502 lt!262501 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53842 lt!262500) (index!24957 lt!262500) (index!24957 lt!262500) lt!262502 lt!262501 mask!3119)))))

(declare-fun b!574712 () Bool)

(assert (=> b!574712 (= e!330662 e!330656)))

(declare-fun res!363396 () Bool)

(assert (=> b!574712 (=> (not res!363396) (not e!330656))))

(assert (=> b!574712 (= res!363396 (= lt!262503 (seekKeyOrZeroReturnVacant!0 (x!53842 lt!262500) (index!24957 lt!262500) (index!24957 lt!262500) (select (arr!17233 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!52690 res!363394) b!574707))

(assert (= (and b!574707 res!363393) b!574704))

(assert (= (and b!574704 res!363389) b!574705))

(assert (= (and b!574705 res!363397) b!574710))

(assert (= (and b!574710 res!363400) b!574703))

(assert (= (and b!574703 res!363398) b!574708))

(assert (= (and b!574708 res!363399) b!574709))

(assert (= (and b!574709 res!363390) b!574702))

(assert (= (and b!574702 res!363401) b!574706))

(assert (= (and b!574706 res!363392) b!574701))

(assert (= (and b!574701 (not res!363391)) b!574700))

(assert (= (and b!574700 (not res!363395)) b!574712))

(assert (= (and b!574712 res!363396) b!574711))

(declare-fun m!553543 () Bool)

(assert (=> b!574702 m!553543))

(declare-fun m!553545 () Bool)

(assert (=> b!574702 m!553545))

(declare-fun m!553547 () Bool)

(assert (=> b!574702 m!553547))

(declare-fun m!553549 () Bool)

(assert (=> b!574702 m!553549))

(declare-fun m!553551 () Bool)

(assert (=> b!574702 m!553551))

(declare-fun m!553553 () Bool)

(assert (=> b!574702 m!553553))

(assert (=> b!574702 m!553543))

(assert (=> b!574702 m!553543))

(declare-fun m!553555 () Bool)

(assert (=> b!574702 m!553555))

(declare-fun m!553557 () Bool)

(assert (=> b!574703 m!553557))

(assert (=> b!574712 m!553543))

(assert (=> b!574712 m!553543))

(declare-fun m!553559 () Bool)

(assert (=> b!574712 m!553559))

(declare-fun m!553561 () Bool)

(assert (=> start!52690 m!553561))

(declare-fun m!553563 () Bool)

(assert (=> start!52690 m!553563))

(assert (=> b!574704 m!553543))

(assert (=> b!574704 m!553543))

(declare-fun m!553565 () Bool)

(assert (=> b!574704 m!553565))

(declare-fun m!553567 () Bool)

(assert (=> b!574709 m!553567))

(declare-fun m!553569 () Bool)

(assert (=> b!574711 m!553569))

(declare-fun m!553571 () Bool)

(assert (=> b!574711 m!553571))

(declare-fun m!553573 () Bool)

(assert (=> b!574710 m!553573))

(assert (=> b!574700 m!553543))

(declare-fun m!553575 () Bool)

(assert (=> b!574700 m!553575))

(declare-fun m!553577 () Bool)

(assert (=> b!574705 m!553577))

(assert (=> b!574706 m!553575))

(declare-fun m!553579 () Bool)

(assert (=> b!574706 m!553579))

(assert (=> b!574706 m!553543))

(declare-fun m!553581 () Bool)

(assert (=> b!574706 m!553581))

(assert (=> b!574706 m!553553))

(declare-fun m!553583 () Bool)

(assert (=> b!574706 m!553583))

(assert (=> b!574706 m!553543))

(declare-fun m!553585 () Bool)

(assert (=> b!574706 m!553585))

(declare-fun m!553587 () Bool)

(assert (=> b!574708 m!553587))

(check-sat (not b!574710) (not b!574702) (not b!574708) (not b!574704) (not b!574711) (not b!574709) (not start!52690) (not b!574712) (not b!574705) (not b!574706) (not b!574703))
(check-sat)
(get-model)

(declare-fun d!85181 () Bool)

(declare-fun res!363445 () Bool)

(declare-fun e!330692 () Bool)

(assert (=> d!85181 (=> res!363445 e!330692)))

(assert (=> d!85181 (= res!363445 (= (select (arr!17233 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85181 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!330692)))

(declare-fun b!574756 () Bool)

(declare-fun e!330693 () Bool)

(assert (=> b!574756 (= e!330692 e!330693)))

(declare-fun res!363446 () Bool)

(assert (=> b!574756 (=> (not res!363446) (not e!330693))))

(assert (=> b!574756 (= res!363446 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17597 a!3118)))))

(declare-fun b!574757 () Bool)

(assert (=> b!574757 (= e!330693 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85181 (not res!363445)) b!574756))

(assert (= (and b!574756 res!363446) b!574757))

(declare-fun m!553635 () Bool)

(assert (=> d!85181 m!553635))

(declare-fun m!553637 () Bool)

(assert (=> b!574757 m!553637))

(assert (=> b!574710 d!85181))

(declare-fun d!85183 () Bool)

(assert (=> d!85183 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52690 d!85183))

(declare-fun d!85185 () Bool)

(assert (=> d!85185 (= (array_inv!13029 a!3118) (bvsge (size!17597 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52690 d!85185))

(declare-fun b!574768 () Bool)

(declare-fun e!330704 () Bool)

(declare-fun e!330702 () Bool)

(assert (=> b!574768 (= e!330704 e!330702)))

(declare-fun c!66020 () Bool)

(assert (=> b!574768 (= c!66020 (validKeyInArray!0 (select (arr!17233 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85187 () Bool)

(declare-fun res!363453 () Bool)

(declare-fun e!330703 () Bool)

(assert (=> d!85187 (=> res!363453 e!330703)))

(assert (=> d!85187 (= res!363453 (bvsge #b00000000000000000000000000000000 (size!17597 a!3118)))))

(assert (=> d!85187 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11310) e!330703)))

(declare-fun bm!32687 () Bool)

(declare-fun call!32690 () Bool)

(assert (=> bm!32687 (= call!32690 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66020 (Cons!11309 (select (arr!17233 a!3118) #b00000000000000000000000000000000) Nil!11310) Nil!11310)))))

(declare-fun b!574769 () Bool)

(assert (=> b!574769 (= e!330703 e!330704)))

(declare-fun res!363454 () Bool)

(assert (=> b!574769 (=> (not res!363454) (not e!330704))))

(declare-fun e!330705 () Bool)

(assert (=> b!574769 (= res!363454 (not e!330705))))

(declare-fun res!363455 () Bool)

(assert (=> b!574769 (=> (not res!363455) (not e!330705))))

(assert (=> b!574769 (= res!363455 (validKeyInArray!0 (select (arr!17233 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574770 () Bool)

(assert (=> b!574770 (= e!330702 call!32690)))

(declare-fun b!574771 () Bool)

(declare-fun contains!2891 (List!11313 (_ BitVec 64)) Bool)

(assert (=> b!574771 (= e!330705 (contains!2891 Nil!11310 (select (arr!17233 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574772 () Bool)

(assert (=> b!574772 (= e!330702 call!32690)))

(assert (= (and d!85187 (not res!363453)) b!574769))

(assert (= (and b!574769 res!363455) b!574771))

(assert (= (and b!574769 res!363454) b!574768))

(assert (= (and b!574768 c!66020) b!574772))

(assert (= (and b!574768 (not c!66020)) b!574770))

(assert (= (or b!574772 b!574770) bm!32687))

(assert (=> b!574768 m!553635))

(assert (=> b!574768 m!553635))

(declare-fun m!553639 () Bool)

(assert (=> b!574768 m!553639))

(assert (=> bm!32687 m!553635))

(declare-fun m!553641 () Bool)

(assert (=> bm!32687 m!553641))

(assert (=> b!574769 m!553635))

(assert (=> b!574769 m!553635))

(assert (=> b!574769 m!553639))

(assert (=> b!574771 m!553635))

(assert (=> b!574771 m!553635))

(declare-fun m!553643 () Bool)

(assert (=> b!574771 m!553643))

(assert (=> b!574709 d!85187))

(declare-fun e!330727 () SeekEntryResult!5682)

(declare-fun b!574801 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574801 (= e!330727 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262497 #b00000000000000000000000000000000 mask!3119) lt!262502 lt!262501 mask!3119))))

(declare-fun b!574802 () Bool)

(declare-fun e!330728 () Bool)

(declare-fun lt!262537 () SeekEntryResult!5682)

(assert (=> b!574802 (= e!330728 (bvsge (x!53842 lt!262537) #b01111111111111111111111111111110))))

(declare-fun b!574803 () Bool)

(assert (=> b!574803 (and (bvsge (index!24957 lt!262537) #b00000000000000000000000000000000) (bvslt (index!24957 lt!262537) (size!17597 lt!262501)))))

(declare-fun res!363468 () Bool)

(assert (=> b!574803 (= res!363468 (= (select (arr!17233 lt!262501) (index!24957 lt!262537)) lt!262502))))

(declare-fun e!330726 () Bool)

(assert (=> b!574803 (=> res!363468 e!330726)))

(declare-fun e!330724 () Bool)

(assert (=> b!574803 (= e!330724 e!330726)))

(declare-fun b!574804 () Bool)

(assert (=> b!574804 (= e!330728 e!330724)))

(declare-fun res!363470 () Bool)

(assert (=> b!574804 (= res!363470 (and ((_ is Intermediate!5682) lt!262537) (not (undefined!6494 lt!262537)) (bvslt (x!53842 lt!262537) #b01111111111111111111111111111110) (bvsge (x!53842 lt!262537) #b00000000000000000000000000000000) (bvsge (x!53842 lt!262537) #b00000000000000000000000000000000)))))

(assert (=> b!574804 (=> (not res!363470) (not e!330724))))

(declare-fun b!574805 () Bool)

(declare-fun e!330725 () SeekEntryResult!5682)

(assert (=> b!574805 (= e!330725 (Intermediate!5682 true lt!262497 #b00000000000000000000000000000000))))

(declare-fun b!574806 () Bool)

(assert (=> b!574806 (and (bvsge (index!24957 lt!262537) #b00000000000000000000000000000000) (bvslt (index!24957 lt!262537) (size!17597 lt!262501)))))

(assert (=> b!574806 (= e!330726 (= (select (arr!17233 lt!262501) (index!24957 lt!262537)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!85189 () Bool)

(assert (=> d!85189 e!330728))

(declare-fun c!66029 () Bool)

(assert (=> d!85189 (= c!66029 (and ((_ is Intermediate!5682) lt!262537) (undefined!6494 lt!262537)))))

(assert (=> d!85189 (= lt!262537 e!330725)))

(declare-fun c!66030 () Bool)

(assert (=> d!85189 (= c!66030 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262536 () (_ BitVec 64))

(assert (=> d!85189 (= lt!262536 (select (arr!17233 lt!262501) lt!262497))))

(assert (=> d!85189 (validMask!0 mask!3119)))

(assert (=> d!85189 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262497 lt!262502 lt!262501 mask!3119) lt!262537)))

(declare-fun b!574807 () Bool)

(assert (=> b!574807 (= e!330725 e!330727)))

(declare-fun c!66031 () Bool)

(assert (=> b!574807 (= c!66031 (or (= lt!262536 lt!262502) (= (bvadd lt!262536 lt!262536) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574808 () Bool)

(assert (=> b!574808 (and (bvsge (index!24957 lt!262537) #b00000000000000000000000000000000) (bvslt (index!24957 lt!262537) (size!17597 lt!262501)))))

(declare-fun res!363469 () Bool)

(assert (=> b!574808 (= res!363469 (= (select (arr!17233 lt!262501) (index!24957 lt!262537)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574808 (=> res!363469 e!330726)))

(declare-fun b!574809 () Bool)

(assert (=> b!574809 (= e!330727 (Intermediate!5682 false lt!262497 #b00000000000000000000000000000000))))

(assert (= (and d!85189 c!66030) b!574805))

(assert (= (and d!85189 (not c!66030)) b!574807))

(assert (= (and b!574807 c!66031) b!574809))

(assert (= (and b!574807 (not c!66031)) b!574801))

(assert (= (and d!85189 c!66029) b!574802))

(assert (= (and d!85189 (not c!66029)) b!574804))

(assert (= (and b!574804 res!363470) b!574803))

(assert (= (and b!574803 (not res!363468)) b!574808))

(assert (= (and b!574808 (not res!363469)) b!574806))

(declare-fun m!553649 () Bool)

(assert (=> b!574803 m!553649))

(declare-fun m!553653 () Bool)

(assert (=> b!574801 m!553653))

(assert (=> b!574801 m!553653))

(declare-fun m!553655 () Bool)

(assert (=> b!574801 m!553655))

(assert (=> b!574808 m!553649))

(declare-fun m!553659 () Bool)

(assert (=> d!85189 m!553659))

(assert (=> d!85189 m!553561))

(assert (=> b!574806 m!553649))

(assert (=> b!574702 d!85189))

(declare-fun b!574827 () Bool)

(declare-fun e!330742 () SeekEntryResult!5682)

(assert (=> b!574827 (= e!330742 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262496 #b00000000000000000000000000000000 mask!3119) (select (arr!17233 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574828 () Bool)

(declare-fun e!330743 () Bool)

(declare-fun lt!262545 () SeekEntryResult!5682)

(assert (=> b!574828 (= e!330743 (bvsge (x!53842 lt!262545) #b01111111111111111111111111111110))))

(declare-fun b!574829 () Bool)

(assert (=> b!574829 (and (bvsge (index!24957 lt!262545) #b00000000000000000000000000000000) (bvslt (index!24957 lt!262545) (size!17597 a!3118)))))

(declare-fun res!363474 () Bool)

(assert (=> b!574829 (= res!363474 (= (select (arr!17233 a!3118) (index!24957 lt!262545)) (select (arr!17233 a!3118) j!142)))))

(declare-fun e!330741 () Bool)

(assert (=> b!574829 (=> res!363474 e!330741)))

(declare-fun e!330739 () Bool)

(assert (=> b!574829 (= e!330739 e!330741)))

(declare-fun b!574830 () Bool)

(assert (=> b!574830 (= e!330743 e!330739)))

(declare-fun res!363476 () Bool)

(assert (=> b!574830 (= res!363476 (and ((_ is Intermediate!5682) lt!262545) (not (undefined!6494 lt!262545)) (bvslt (x!53842 lt!262545) #b01111111111111111111111111111110) (bvsge (x!53842 lt!262545) #b00000000000000000000000000000000) (bvsge (x!53842 lt!262545) #b00000000000000000000000000000000)))))

(assert (=> b!574830 (=> (not res!363476) (not e!330739))))

(declare-fun b!574831 () Bool)

(declare-fun e!330740 () SeekEntryResult!5682)

(assert (=> b!574831 (= e!330740 (Intermediate!5682 true lt!262496 #b00000000000000000000000000000000))))

(declare-fun b!574832 () Bool)

(assert (=> b!574832 (and (bvsge (index!24957 lt!262545) #b00000000000000000000000000000000) (bvslt (index!24957 lt!262545) (size!17597 a!3118)))))

(assert (=> b!574832 (= e!330741 (= (select (arr!17233 a!3118) (index!24957 lt!262545)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!85197 () Bool)

(assert (=> d!85197 e!330743))

(declare-fun c!66038 () Bool)

(assert (=> d!85197 (= c!66038 (and ((_ is Intermediate!5682) lt!262545) (undefined!6494 lt!262545)))))

(assert (=> d!85197 (= lt!262545 e!330740)))

(declare-fun c!66039 () Bool)

(assert (=> d!85197 (= c!66039 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262544 () (_ BitVec 64))

(assert (=> d!85197 (= lt!262544 (select (arr!17233 a!3118) lt!262496))))

(assert (=> d!85197 (validMask!0 mask!3119)))

(assert (=> d!85197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262496 (select (arr!17233 a!3118) j!142) a!3118 mask!3119) lt!262545)))

(declare-fun b!574833 () Bool)

(assert (=> b!574833 (= e!330740 e!330742)))

(declare-fun c!66040 () Bool)

(assert (=> b!574833 (= c!66040 (or (= lt!262544 (select (arr!17233 a!3118) j!142)) (= (bvadd lt!262544 lt!262544) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574834 () Bool)

(assert (=> b!574834 (and (bvsge (index!24957 lt!262545) #b00000000000000000000000000000000) (bvslt (index!24957 lt!262545) (size!17597 a!3118)))))

(declare-fun res!363475 () Bool)

(assert (=> b!574834 (= res!363475 (= (select (arr!17233 a!3118) (index!24957 lt!262545)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574834 (=> res!363475 e!330741)))

(declare-fun b!574835 () Bool)

(assert (=> b!574835 (= e!330742 (Intermediate!5682 false lt!262496 #b00000000000000000000000000000000))))

(assert (= (and d!85197 c!66039) b!574831))

(assert (= (and d!85197 (not c!66039)) b!574833))

(assert (= (and b!574833 c!66040) b!574835))

(assert (= (and b!574833 (not c!66040)) b!574827))

(assert (= (and d!85197 c!66038) b!574828))

(assert (= (and d!85197 (not c!66038)) b!574830))

(assert (= (and b!574830 res!363476) b!574829))

(assert (= (and b!574829 (not res!363474)) b!574834))

(assert (= (and b!574834 (not res!363475)) b!574832))

(declare-fun m!553661 () Bool)

(assert (=> b!574829 m!553661))

(declare-fun m!553663 () Bool)

(assert (=> b!574827 m!553663))

(assert (=> b!574827 m!553663))

(assert (=> b!574827 m!553543))

(declare-fun m!553665 () Bool)

(assert (=> b!574827 m!553665))

(assert (=> b!574834 m!553661))

(declare-fun m!553667 () Bool)

(assert (=> d!85197 m!553667))

(assert (=> d!85197 m!553561))

(assert (=> b!574832 m!553661))

(assert (=> b!574702 d!85197))

(declare-fun d!85199 () Bool)

(declare-fun lt!262554 () (_ BitVec 32))

(declare-fun lt!262553 () (_ BitVec 32))

(assert (=> d!85199 (= lt!262554 (bvmul (bvxor lt!262553 (bvlshr lt!262553 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85199 (= lt!262553 ((_ extract 31 0) (bvand (bvxor lt!262502 (bvlshr lt!262502 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85199 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363477 (let ((h!12347 ((_ extract 31 0) (bvand (bvxor lt!262502 (bvlshr lt!262502 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53845 (bvmul (bvxor h!12347 (bvlshr h!12347 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53845 (bvlshr x!53845 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363477 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363477 #b00000000000000000000000000000000))))))

(assert (=> d!85199 (= (toIndex!0 lt!262502 mask!3119) (bvand (bvxor lt!262554 (bvlshr lt!262554 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574702 d!85199))

(declare-fun d!85203 () Bool)

(declare-fun lt!262556 () (_ BitVec 32))

(declare-fun lt!262555 () (_ BitVec 32))

(assert (=> d!85203 (= lt!262556 (bvmul (bvxor lt!262555 (bvlshr lt!262555 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85203 (= lt!262555 ((_ extract 31 0) (bvand (bvxor (select (arr!17233 a!3118) j!142) (bvlshr (select (arr!17233 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85203 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363477 (let ((h!12347 ((_ extract 31 0) (bvand (bvxor (select (arr!17233 a!3118) j!142) (bvlshr (select (arr!17233 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53845 (bvmul (bvxor h!12347 (bvlshr h!12347 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53845 (bvlshr x!53845 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363477 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363477 #b00000000000000000000000000000000))))))

(assert (=> d!85203 (= (toIndex!0 (select (arr!17233 a!3118) j!142) mask!3119) (bvand (bvxor lt!262556 (bvlshr lt!262556 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574702 d!85203))

(declare-fun b!574899 () Bool)

(declare-fun e!330777 () SeekEntryResult!5682)

(declare-fun e!330779 () SeekEntryResult!5682)

(assert (=> b!574899 (= e!330777 e!330779)))

(declare-fun lt!262579 () (_ BitVec 64))

(declare-fun lt!262580 () SeekEntryResult!5682)

(assert (=> b!574899 (= lt!262579 (select (arr!17233 lt!262501) (index!24957 lt!262580)))))

(declare-fun c!66069 () Bool)

(assert (=> b!574899 (= c!66069 (= lt!262579 lt!262502))))

(declare-fun d!85205 () Bool)

(declare-fun lt!262578 () SeekEntryResult!5682)

(assert (=> d!85205 (and (or ((_ is Undefined!5682) lt!262578) (not ((_ is Found!5682) lt!262578)) (and (bvsge (index!24956 lt!262578) #b00000000000000000000000000000000) (bvslt (index!24956 lt!262578) (size!17597 lt!262501)))) (or ((_ is Undefined!5682) lt!262578) ((_ is Found!5682) lt!262578) (not ((_ is MissingZero!5682) lt!262578)) (and (bvsge (index!24955 lt!262578) #b00000000000000000000000000000000) (bvslt (index!24955 lt!262578) (size!17597 lt!262501)))) (or ((_ is Undefined!5682) lt!262578) ((_ is Found!5682) lt!262578) ((_ is MissingZero!5682) lt!262578) (not ((_ is MissingVacant!5682) lt!262578)) (and (bvsge (index!24958 lt!262578) #b00000000000000000000000000000000) (bvslt (index!24958 lt!262578) (size!17597 lt!262501)))) (or ((_ is Undefined!5682) lt!262578) (ite ((_ is Found!5682) lt!262578) (= (select (arr!17233 lt!262501) (index!24956 lt!262578)) lt!262502) (ite ((_ is MissingZero!5682) lt!262578) (= (select (arr!17233 lt!262501) (index!24955 lt!262578)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5682) lt!262578) (= (select (arr!17233 lt!262501) (index!24958 lt!262578)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85205 (= lt!262578 e!330777)))

(declare-fun c!66070 () Bool)

(assert (=> d!85205 (= c!66070 (and ((_ is Intermediate!5682) lt!262580) (undefined!6494 lt!262580)))))

(assert (=> d!85205 (= lt!262580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!262502 mask!3119) lt!262502 lt!262501 mask!3119))))

(assert (=> d!85205 (validMask!0 mask!3119)))

(assert (=> d!85205 (= (seekEntryOrOpen!0 lt!262502 lt!262501 mask!3119) lt!262578)))

(declare-fun b!574900 () Bool)

(declare-fun c!66071 () Bool)

(assert (=> b!574900 (= c!66071 (= lt!262579 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330778 () SeekEntryResult!5682)

(assert (=> b!574900 (= e!330779 e!330778)))

(declare-fun b!574901 () Bool)

(assert (=> b!574901 (= e!330777 Undefined!5682)))

(declare-fun b!574902 () Bool)

(assert (=> b!574902 (= e!330778 (seekKeyOrZeroReturnVacant!0 (x!53842 lt!262580) (index!24957 lt!262580) (index!24957 lt!262580) lt!262502 lt!262501 mask!3119))))

(declare-fun b!574903 () Bool)

(assert (=> b!574903 (= e!330779 (Found!5682 (index!24957 lt!262580)))))

(declare-fun b!574904 () Bool)

(assert (=> b!574904 (= e!330778 (MissingZero!5682 (index!24957 lt!262580)))))

(assert (= (and d!85205 c!66070) b!574901))

(assert (= (and d!85205 (not c!66070)) b!574899))

(assert (= (and b!574899 c!66069) b!574903))

(assert (= (and b!574899 (not c!66069)) b!574900))

(assert (= (and b!574900 c!66071) b!574904))

(assert (= (and b!574900 (not c!66071)) b!574902))

(declare-fun m!553703 () Bool)

(assert (=> b!574899 m!553703))

(assert (=> d!85205 m!553549))

(declare-fun m!553705 () Bool)

(assert (=> d!85205 m!553705))

(assert (=> d!85205 m!553549))

(declare-fun m!553707 () Bool)

(assert (=> d!85205 m!553707))

(assert (=> d!85205 m!553561))

(declare-fun m!553709 () Bool)

(assert (=> d!85205 m!553709))

(declare-fun m!553711 () Bool)

(assert (=> d!85205 m!553711))

(declare-fun m!553713 () Bool)

(assert (=> b!574902 m!553713))

(assert (=> b!574711 d!85205))

(declare-fun b!574956 () Bool)

(declare-fun e!330810 () SeekEntryResult!5682)

(assert (=> b!574956 (= e!330810 (MissingVacant!5682 (index!24957 lt!262500)))))

(declare-fun lt!262605 () SeekEntryResult!5682)

(declare-fun d!85211 () Bool)

(assert (=> d!85211 (and (or ((_ is Undefined!5682) lt!262605) (not ((_ is Found!5682) lt!262605)) (and (bvsge (index!24956 lt!262605) #b00000000000000000000000000000000) (bvslt (index!24956 lt!262605) (size!17597 lt!262501)))) (or ((_ is Undefined!5682) lt!262605) ((_ is Found!5682) lt!262605) (not ((_ is MissingVacant!5682) lt!262605)) (not (= (index!24958 lt!262605) (index!24957 lt!262500))) (and (bvsge (index!24958 lt!262605) #b00000000000000000000000000000000) (bvslt (index!24958 lt!262605) (size!17597 lt!262501)))) (or ((_ is Undefined!5682) lt!262605) (ite ((_ is Found!5682) lt!262605) (= (select (arr!17233 lt!262501) (index!24956 lt!262605)) lt!262502) (and ((_ is MissingVacant!5682) lt!262605) (= (index!24958 lt!262605) (index!24957 lt!262500)) (= (select (arr!17233 lt!262501) (index!24958 lt!262605)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!330811 () SeekEntryResult!5682)

(assert (=> d!85211 (= lt!262605 e!330811)))

(declare-fun c!66094 () Bool)

(assert (=> d!85211 (= c!66094 (bvsge (x!53842 lt!262500) #b01111111111111111111111111111110))))

(declare-fun lt!262604 () (_ BitVec 64))

(assert (=> d!85211 (= lt!262604 (select (arr!17233 lt!262501) (index!24957 lt!262500)))))

(assert (=> d!85211 (validMask!0 mask!3119)))

(assert (=> d!85211 (= (seekKeyOrZeroReturnVacant!0 (x!53842 lt!262500) (index!24957 lt!262500) (index!24957 lt!262500) lt!262502 lt!262501 mask!3119) lt!262605)))

(declare-fun b!574957 () Bool)

(declare-fun e!330809 () SeekEntryResult!5682)

(assert (=> b!574957 (= e!330811 e!330809)))

(declare-fun c!66093 () Bool)

(assert (=> b!574957 (= c!66093 (= lt!262604 lt!262502))))

(declare-fun b!574958 () Bool)

(assert (=> b!574958 (= e!330810 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53842 lt!262500) #b00000000000000000000000000000001) (nextIndex!0 (index!24957 lt!262500) (x!53842 lt!262500) mask!3119) (index!24957 lt!262500) lt!262502 lt!262501 mask!3119))))

(declare-fun b!574959 () Bool)

(assert (=> b!574959 (= e!330809 (Found!5682 (index!24957 lt!262500)))))

(declare-fun b!574960 () Bool)

(assert (=> b!574960 (= e!330811 Undefined!5682)))

(declare-fun b!574961 () Bool)

(declare-fun c!66095 () Bool)

(assert (=> b!574961 (= c!66095 (= lt!262604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574961 (= e!330809 e!330810)))

(assert (= (and d!85211 c!66094) b!574960))

(assert (= (and d!85211 (not c!66094)) b!574957))

(assert (= (and b!574957 c!66093) b!574959))

(assert (= (and b!574957 (not c!66093)) b!574961))

(assert (= (and b!574961 c!66095) b!574956))

(assert (= (and b!574961 (not c!66095)) b!574958))

(declare-fun m!553749 () Bool)

(assert (=> d!85211 m!553749))

(declare-fun m!553751 () Bool)

(assert (=> d!85211 m!553751))

(declare-fun m!553753 () Bool)

(assert (=> d!85211 m!553753))

(assert (=> d!85211 m!553561))

(declare-fun m!553755 () Bool)

(assert (=> b!574958 m!553755))

(assert (=> b!574958 m!553755))

(declare-fun m!553757 () Bool)

(assert (=> b!574958 m!553757))

(assert (=> b!574711 d!85211))

(declare-fun b!574970 () Bool)

(declare-fun e!330819 () SeekEntryResult!5682)

(assert (=> b!574970 (= e!330819 (MissingVacant!5682 (index!24957 lt!262500)))))

(declare-fun d!85227 () Bool)

(declare-fun lt!262613 () SeekEntryResult!5682)

(assert (=> d!85227 (and (or ((_ is Undefined!5682) lt!262613) (not ((_ is Found!5682) lt!262613)) (and (bvsge (index!24956 lt!262613) #b00000000000000000000000000000000) (bvslt (index!24956 lt!262613) (size!17597 a!3118)))) (or ((_ is Undefined!5682) lt!262613) ((_ is Found!5682) lt!262613) (not ((_ is MissingVacant!5682) lt!262613)) (not (= (index!24958 lt!262613) (index!24957 lt!262500))) (and (bvsge (index!24958 lt!262613) #b00000000000000000000000000000000) (bvslt (index!24958 lt!262613) (size!17597 a!3118)))) (or ((_ is Undefined!5682) lt!262613) (ite ((_ is Found!5682) lt!262613) (= (select (arr!17233 a!3118) (index!24956 lt!262613)) (select (arr!17233 a!3118) j!142)) (and ((_ is MissingVacant!5682) lt!262613) (= (index!24958 lt!262613) (index!24957 lt!262500)) (= (select (arr!17233 a!3118) (index!24958 lt!262613)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!330820 () SeekEntryResult!5682)

(assert (=> d!85227 (= lt!262613 e!330820)))

(declare-fun c!66099 () Bool)

(assert (=> d!85227 (= c!66099 (bvsge (x!53842 lt!262500) #b01111111111111111111111111111110))))

(declare-fun lt!262612 () (_ BitVec 64))

(assert (=> d!85227 (= lt!262612 (select (arr!17233 a!3118) (index!24957 lt!262500)))))

(assert (=> d!85227 (validMask!0 mask!3119)))

(assert (=> d!85227 (= (seekKeyOrZeroReturnVacant!0 (x!53842 lt!262500) (index!24957 lt!262500) (index!24957 lt!262500) (select (arr!17233 a!3118) j!142) a!3118 mask!3119) lt!262613)))

(declare-fun b!574971 () Bool)

(declare-fun e!330818 () SeekEntryResult!5682)

(assert (=> b!574971 (= e!330820 e!330818)))

(declare-fun c!66098 () Bool)

(assert (=> b!574971 (= c!66098 (= lt!262612 (select (arr!17233 a!3118) j!142)))))

(declare-fun b!574972 () Bool)

(assert (=> b!574972 (= e!330819 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53842 lt!262500) #b00000000000000000000000000000001) (nextIndex!0 (index!24957 lt!262500) (x!53842 lt!262500) mask!3119) (index!24957 lt!262500) (select (arr!17233 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574973 () Bool)

(assert (=> b!574973 (= e!330818 (Found!5682 (index!24957 lt!262500)))))

(declare-fun b!574974 () Bool)

(assert (=> b!574974 (= e!330820 Undefined!5682)))

(declare-fun b!574975 () Bool)

(declare-fun c!66100 () Bool)

(assert (=> b!574975 (= c!66100 (= lt!262612 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574975 (= e!330818 e!330819)))

(assert (= (and d!85227 c!66099) b!574974))

(assert (= (and d!85227 (not c!66099)) b!574971))

(assert (= (and b!574971 c!66098) b!574973))

(assert (= (and b!574971 (not c!66098)) b!574975))

(assert (= (and b!574975 c!66100) b!574970))

(assert (= (and b!574975 (not c!66100)) b!574972))

(declare-fun m!553759 () Bool)

(assert (=> d!85227 m!553759))

(declare-fun m!553761 () Bool)

(assert (=> d!85227 m!553761))

(assert (=> d!85227 m!553575))

(assert (=> d!85227 m!553561))

(assert (=> b!574972 m!553755))

(assert (=> b!574972 m!553755))

(assert (=> b!574972 m!553543))

(declare-fun m!553763 () Bool)

(assert (=> b!574972 m!553763))

(assert (=> b!574712 d!85227))

(declare-fun d!85229 () Bool)

(assert (=> d!85229 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574705 d!85229))

(declare-fun b!574976 () Bool)

(declare-fun e!330821 () SeekEntryResult!5682)

(declare-fun e!330823 () SeekEntryResult!5682)

(assert (=> b!574976 (= e!330821 e!330823)))

(declare-fun lt!262615 () (_ BitVec 64))

(declare-fun lt!262616 () SeekEntryResult!5682)

(assert (=> b!574976 (= lt!262615 (select (arr!17233 a!3118) (index!24957 lt!262616)))))

(declare-fun c!66101 () Bool)

(assert (=> b!574976 (= c!66101 (= lt!262615 k0!1914))))

(declare-fun d!85231 () Bool)

(declare-fun lt!262614 () SeekEntryResult!5682)

(assert (=> d!85231 (and (or ((_ is Undefined!5682) lt!262614) (not ((_ is Found!5682) lt!262614)) (and (bvsge (index!24956 lt!262614) #b00000000000000000000000000000000) (bvslt (index!24956 lt!262614) (size!17597 a!3118)))) (or ((_ is Undefined!5682) lt!262614) ((_ is Found!5682) lt!262614) (not ((_ is MissingZero!5682) lt!262614)) (and (bvsge (index!24955 lt!262614) #b00000000000000000000000000000000) (bvslt (index!24955 lt!262614) (size!17597 a!3118)))) (or ((_ is Undefined!5682) lt!262614) ((_ is Found!5682) lt!262614) ((_ is MissingZero!5682) lt!262614) (not ((_ is MissingVacant!5682) lt!262614)) (and (bvsge (index!24958 lt!262614) #b00000000000000000000000000000000) (bvslt (index!24958 lt!262614) (size!17597 a!3118)))) (or ((_ is Undefined!5682) lt!262614) (ite ((_ is Found!5682) lt!262614) (= (select (arr!17233 a!3118) (index!24956 lt!262614)) k0!1914) (ite ((_ is MissingZero!5682) lt!262614) (= (select (arr!17233 a!3118) (index!24955 lt!262614)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5682) lt!262614) (= (select (arr!17233 a!3118) (index!24958 lt!262614)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85231 (= lt!262614 e!330821)))

(declare-fun c!66102 () Bool)

(assert (=> d!85231 (= c!66102 (and ((_ is Intermediate!5682) lt!262616) (undefined!6494 lt!262616)))))

(assert (=> d!85231 (= lt!262616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85231 (validMask!0 mask!3119)))

(assert (=> d!85231 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!262614)))

(declare-fun b!574977 () Bool)

(declare-fun c!66103 () Bool)

(assert (=> b!574977 (= c!66103 (= lt!262615 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330822 () SeekEntryResult!5682)

(assert (=> b!574977 (= e!330823 e!330822)))

(declare-fun b!574978 () Bool)

(assert (=> b!574978 (= e!330821 Undefined!5682)))

(declare-fun b!574979 () Bool)

(assert (=> b!574979 (= e!330822 (seekKeyOrZeroReturnVacant!0 (x!53842 lt!262616) (index!24957 lt!262616) (index!24957 lt!262616) k0!1914 a!3118 mask!3119))))

(declare-fun b!574980 () Bool)

(assert (=> b!574980 (= e!330823 (Found!5682 (index!24957 lt!262616)))))

(declare-fun b!574981 () Bool)

(assert (=> b!574981 (= e!330822 (MissingZero!5682 (index!24957 lt!262616)))))

(assert (= (and d!85231 c!66102) b!574978))

(assert (= (and d!85231 (not c!66102)) b!574976))

(assert (= (and b!574976 c!66101) b!574980))

(assert (= (and b!574976 (not c!66101)) b!574977))

(assert (= (and b!574977 c!66103) b!574981))

(assert (= (and b!574977 (not c!66103)) b!574979))

(declare-fun m!553765 () Bool)

(assert (=> b!574976 m!553765))

(declare-fun m!553767 () Bool)

(assert (=> d!85231 m!553767))

(declare-fun m!553769 () Bool)

(assert (=> d!85231 m!553769))

(assert (=> d!85231 m!553767))

(declare-fun m!553771 () Bool)

(assert (=> d!85231 m!553771))

(assert (=> d!85231 m!553561))

(declare-fun m!553773 () Bool)

(assert (=> d!85231 m!553773))

(declare-fun m!553775 () Bool)

(assert (=> d!85231 m!553775))

(declare-fun m!553777 () Bool)

(assert (=> b!574979 m!553777))

(assert (=> b!574703 d!85231))

(declare-fun d!85233 () Bool)

(assert (=> d!85233 (= (validKeyInArray!0 (select (arr!17233 a!3118) j!142)) (and (not (= (select (arr!17233 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17233 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574704 d!85233))

(declare-fun bm!32696 () Bool)

(declare-fun call!32699 () Bool)

(assert (=> bm!32696 (= call!32699 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!575012 () Bool)

(declare-fun e!330842 () Bool)

(declare-fun e!330844 () Bool)

(assert (=> b!575012 (= e!330842 e!330844)))

(declare-fun c!66116 () Bool)

(assert (=> b!575012 (= c!66116 (validKeyInArray!0 (select (arr!17233 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!575013 () Bool)

(declare-fun e!330843 () Bool)

(assert (=> b!575013 (= e!330843 call!32699)))

(declare-fun b!575014 () Bool)

(assert (=> b!575014 (= e!330844 call!32699)))

(declare-fun b!575015 () Bool)

(assert (=> b!575015 (= e!330844 e!330843)))

(declare-fun lt!262633 () (_ BitVec 64))

(assert (=> b!575015 (= lt!262633 (select (arr!17233 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262634 () Unit!18066)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35898 (_ BitVec 64) (_ BitVec 32)) Unit!18066)

(assert (=> b!575015 (= lt!262634 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262633 #b00000000000000000000000000000000))))

(assert (=> b!575015 (arrayContainsKey!0 a!3118 lt!262633 #b00000000000000000000000000000000)))

(declare-fun lt!262632 () Unit!18066)

(assert (=> b!575015 (= lt!262632 lt!262634)))

(declare-fun res!363507 () Bool)

(assert (=> b!575015 (= res!363507 (= (seekEntryOrOpen!0 (select (arr!17233 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5682 #b00000000000000000000000000000000)))))

(assert (=> b!575015 (=> (not res!363507) (not e!330843))))

(declare-fun d!85235 () Bool)

(declare-fun res!363508 () Bool)

(assert (=> d!85235 (=> res!363508 e!330842)))

(assert (=> d!85235 (= res!363508 (bvsge #b00000000000000000000000000000000 (size!17597 a!3118)))))

(assert (=> d!85235 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330842)))

(assert (= (and d!85235 (not res!363508)) b!575012))

(assert (= (and b!575012 c!66116) b!575015))

(assert (= (and b!575012 (not c!66116)) b!575014))

(assert (= (and b!575015 res!363507) b!575013))

(assert (= (or b!575013 b!575014) bm!32696))

(declare-fun m!553797 () Bool)

(assert (=> bm!32696 m!553797))

(assert (=> b!575012 m!553635))

(assert (=> b!575012 m!553635))

(assert (=> b!575012 m!553639))

(assert (=> b!575015 m!553635))

(declare-fun m!553799 () Bool)

(assert (=> b!575015 m!553799))

(declare-fun m!553801 () Bool)

(assert (=> b!575015 m!553801))

(assert (=> b!575015 m!553635))

(declare-fun m!553803 () Bool)

(assert (=> b!575015 m!553803))

(assert (=> b!574708 d!85235))

(declare-fun b!575016 () Bool)

(declare-fun e!330845 () SeekEntryResult!5682)

(declare-fun e!330847 () SeekEntryResult!5682)

(assert (=> b!575016 (= e!330845 e!330847)))

(declare-fun lt!262636 () (_ BitVec 64))

(declare-fun lt!262637 () SeekEntryResult!5682)

(assert (=> b!575016 (= lt!262636 (select (arr!17233 a!3118) (index!24957 lt!262637)))))

(declare-fun c!66117 () Bool)

(assert (=> b!575016 (= c!66117 (= lt!262636 (select (arr!17233 a!3118) j!142)))))

(declare-fun d!85243 () Bool)

(declare-fun lt!262635 () SeekEntryResult!5682)

(assert (=> d!85243 (and (or ((_ is Undefined!5682) lt!262635) (not ((_ is Found!5682) lt!262635)) (and (bvsge (index!24956 lt!262635) #b00000000000000000000000000000000) (bvslt (index!24956 lt!262635) (size!17597 a!3118)))) (or ((_ is Undefined!5682) lt!262635) ((_ is Found!5682) lt!262635) (not ((_ is MissingZero!5682) lt!262635)) (and (bvsge (index!24955 lt!262635) #b00000000000000000000000000000000) (bvslt (index!24955 lt!262635) (size!17597 a!3118)))) (or ((_ is Undefined!5682) lt!262635) ((_ is Found!5682) lt!262635) ((_ is MissingZero!5682) lt!262635) (not ((_ is MissingVacant!5682) lt!262635)) (and (bvsge (index!24958 lt!262635) #b00000000000000000000000000000000) (bvslt (index!24958 lt!262635) (size!17597 a!3118)))) (or ((_ is Undefined!5682) lt!262635) (ite ((_ is Found!5682) lt!262635) (= (select (arr!17233 a!3118) (index!24956 lt!262635)) (select (arr!17233 a!3118) j!142)) (ite ((_ is MissingZero!5682) lt!262635) (= (select (arr!17233 a!3118) (index!24955 lt!262635)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5682) lt!262635) (= (select (arr!17233 a!3118) (index!24958 lt!262635)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85243 (= lt!262635 e!330845)))

(declare-fun c!66118 () Bool)

(assert (=> d!85243 (= c!66118 (and ((_ is Intermediate!5682) lt!262637) (undefined!6494 lt!262637)))))

(assert (=> d!85243 (= lt!262637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17233 a!3118) j!142) mask!3119) (select (arr!17233 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85243 (validMask!0 mask!3119)))

(assert (=> d!85243 (= (seekEntryOrOpen!0 (select (arr!17233 a!3118) j!142) a!3118 mask!3119) lt!262635)))

(declare-fun b!575017 () Bool)

(declare-fun c!66119 () Bool)

(assert (=> b!575017 (= c!66119 (= lt!262636 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330846 () SeekEntryResult!5682)

(assert (=> b!575017 (= e!330847 e!330846)))

(declare-fun b!575018 () Bool)

(assert (=> b!575018 (= e!330845 Undefined!5682)))

(declare-fun b!575019 () Bool)

(assert (=> b!575019 (= e!330846 (seekKeyOrZeroReturnVacant!0 (x!53842 lt!262637) (index!24957 lt!262637) (index!24957 lt!262637) (select (arr!17233 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575020 () Bool)

(assert (=> b!575020 (= e!330847 (Found!5682 (index!24957 lt!262637)))))

(declare-fun b!575021 () Bool)

(assert (=> b!575021 (= e!330846 (MissingZero!5682 (index!24957 lt!262637)))))

(assert (= (and d!85243 c!66118) b!575018))

(assert (= (and d!85243 (not c!66118)) b!575016))

(assert (= (and b!575016 c!66117) b!575020))

(assert (= (and b!575016 (not c!66117)) b!575017))

(assert (= (and b!575017 c!66119) b!575021))

(assert (= (and b!575017 (not c!66119)) b!575019))

(declare-fun m!553805 () Bool)

(assert (=> b!575016 m!553805))

(assert (=> d!85243 m!553545))

(assert (=> d!85243 m!553543))

(declare-fun m!553807 () Bool)

(assert (=> d!85243 m!553807))

(assert (=> d!85243 m!553543))

(assert (=> d!85243 m!553545))

(declare-fun m!553809 () Bool)

(assert (=> d!85243 m!553809))

(assert (=> d!85243 m!553561))

(declare-fun m!553811 () Bool)

(assert (=> d!85243 m!553811))

(declare-fun m!553813 () Bool)

(assert (=> d!85243 m!553813))

(assert (=> b!575019 m!553543))

(declare-fun m!553815 () Bool)

(assert (=> b!575019 m!553815))

(assert (=> b!574706 d!85243))

(declare-fun bm!32697 () Bool)

(declare-fun call!32700 () Bool)

(assert (=> bm!32697 (= call!32700 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!575022 () Bool)

(declare-fun e!330848 () Bool)

(declare-fun e!330850 () Bool)

(assert (=> b!575022 (= e!330848 e!330850)))

(declare-fun c!66120 () Bool)

(assert (=> b!575022 (= c!66120 (validKeyInArray!0 (select (arr!17233 a!3118) j!142)))))

(declare-fun b!575023 () Bool)

(declare-fun e!330849 () Bool)

(assert (=> b!575023 (= e!330849 call!32700)))

(declare-fun b!575024 () Bool)

(assert (=> b!575024 (= e!330850 call!32700)))

(declare-fun b!575025 () Bool)

(assert (=> b!575025 (= e!330850 e!330849)))

(declare-fun lt!262639 () (_ BitVec 64))

(assert (=> b!575025 (= lt!262639 (select (arr!17233 a!3118) j!142))))

(declare-fun lt!262640 () Unit!18066)

(assert (=> b!575025 (= lt!262640 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262639 j!142))))

(assert (=> b!575025 (arrayContainsKey!0 a!3118 lt!262639 #b00000000000000000000000000000000)))

(declare-fun lt!262638 () Unit!18066)

(assert (=> b!575025 (= lt!262638 lt!262640)))

(declare-fun res!363509 () Bool)

(assert (=> b!575025 (= res!363509 (= (seekEntryOrOpen!0 (select (arr!17233 a!3118) j!142) a!3118 mask!3119) (Found!5682 j!142)))))

(assert (=> b!575025 (=> (not res!363509) (not e!330849))))

(declare-fun d!85245 () Bool)

(declare-fun res!363510 () Bool)

(assert (=> d!85245 (=> res!363510 e!330848)))

(assert (=> d!85245 (= res!363510 (bvsge j!142 (size!17597 a!3118)))))

(assert (=> d!85245 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330848)))

(assert (= (and d!85245 (not res!363510)) b!575022))

(assert (= (and b!575022 c!66120) b!575025))

(assert (= (and b!575022 (not c!66120)) b!575024))

(assert (= (and b!575025 res!363509) b!575023))

(assert (= (or b!575023 b!575024) bm!32697))

(declare-fun m!553817 () Bool)

(assert (=> bm!32697 m!553817))

(assert (=> b!575022 m!553543))

(assert (=> b!575022 m!553543))

(assert (=> b!575022 m!553565))

(assert (=> b!575025 m!553543))

(declare-fun m!553819 () Bool)

(assert (=> b!575025 m!553819))

(declare-fun m!553821 () Bool)

(assert (=> b!575025 m!553821))

(assert (=> b!575025 m!553543))

(assert (=> b!575025 m!553585))

(assert (=> b!574706 d!85245))

(declare-fun d!85249 () Bool)

(assert (=> d!85249 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262643 () Unit!18066)

(declare-fun choose!38 (array!35898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18066)

(assert (=> d!85249 (= lt!262643 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85249 (validMask!0 mask!3119)))

(assert (=> d!85249 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262643)))

(declare-fun bs!17776 () Bool)

(assert (= bs!17776 d!85249))

(assert (=> bs!17776 m!553581))

(declare-fun m!553825 () Bool)

(assert (=> bs!17776 m!553825))

(assert (=> bs!17776 m!553561))

(assert (=> b!574706 d!85249))

(check-sat (not b!574979) (not b!574827) (not b!574972) (not b!574801) (not b!574958) (not b!574902) (not d!85231) (not bm!32696) (not d!85227) (not bm!32697) (not d!85205) (not b!575012) (not b!575022) (not b!574769) (not b!574768) (not b!575015) (not d!85197) (not d!85211) (not d!85243) (not d!85249) (not d!85189) (not b!575025) (not bm!32687) (not b!574757) (not b!575019) (not b!574771))
(check-sat)
