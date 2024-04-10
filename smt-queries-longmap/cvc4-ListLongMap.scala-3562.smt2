; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48946 () Bool)

(assert start!48946)

(declare-fun b!539614 () Bool)

(declare-fun e!312731 () Bool)

(declare-fun e!312732 () Bool)

(assert (=> b!539614 (= e!312731 e!312732)))

(declare-fun res!334819 () Bool)

(assert (=> b!539614 (=> (not res!334819) (not e!312732))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4876 0))(
  ( (MissingZero!4876 (index!21728 (_ BitVec 32))) (Found!4876 (index!21729 (_ BitVec 32))) (Intermediate!4876 (undefined!5688 Bool) (index!21730 (_ BitVec 32)) (x!50635 (_ BitVec 32))) (Undefined!4876) (MissingVacant!4876 (index!21731 (_ BitVec 32))) )
))
(declare-fun lt!247170 () SeekEntryResult!4876)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539614 (= res!334819 (= lt!247170 (Intermediate!4876 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34158 0))(
  ( (array!34159 (arr!16418 (Array (_ BitVec 32) (_ BitVec 64))) (size!16782 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34158)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34158 (_ BitVec 32)) SeekEntryResult!4876)

(assert (=> b!539614 (= lt!247170 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16418 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539615 () Bool)

(assert (=> b!539615 (= e!312732 (= (select (arr!16418 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!539616 () Bool)

(declare-fun e!312730 () Bool)

(assert (=> b!539616 (= e!312730 e!312731)))

(declare-fun res!334822 () Bool)

(assert (=> b!539616 (=> (not res!334822) (not e!312731))))

(declare-fun lt!247171 () SeekEntryResult!4876)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539616 (= res!334822 (or (= lt!247171 (MissingZero!4876 i!1153)) (= lt!247171 (MissingVacant!4876 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34158 (_ BitVec 32)) SeekEntryResult!4876)

(assert (=> b!539616 (= lt!247171 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539617 () Bool)

(declare-fun res!334821 () Bool)

(assert (=> b!539617 (=> (not res!334821) (not e!312730))))

(assert (=> b!539617 (= res!334821 (and (= (size!16782 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16782 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16782 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539618 () Bool)

(declare-fun res!334825 () Bool)

(assert (=> b!539618 (=> (not res!334825) (not e!312730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539618 (= res!334825 (validKeyInArray!0 k!1998))))

(declare-fun b!539619 () Bool)

(declare-fun res!334820 () Bool)

(assert (=> b!539619 (=> (not res!334820) (not e!312732))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539619 (= res!334820 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16418 a!3154) j!147) mask!3216) (select (arr!16418 a!3154) j!147) a!3154 mask!3216) lt!247170))))

(declare-fun res!334827 () Bool)

(assert (=> start!48946 (=> (not res!334827) (not e!312730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48946 (= res!334827 (validMask!0 mask!3216))))

(assert (=> start!48946 e!312730))

(assert (=> start!48946 true))

(declare-fun array_inv!12214 (array!34158) Bool)

(assert (=> start!48946 (array_inv!12214 a!3154)))

(declare-fun b!539620 () Bool)

(declare-fun res!334828 () Bool)

(assert (=> b!539620 (=> (not res!334828) (not e!312731))))

(assert (=> b!539620 (= res!334828 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16782 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16782 a!3154)) (= (select (arr!16418 a!3154) resIndex!32) (select (arr!16418 a!3154) j!147))))))

(declare-fun b!539621 () Bool)

(declare-fun res!334823 () Bool)

(assert (=> b!539621 (=> (not res!334823) (not e!312730))))

(assert (=> b!539621 (= res!334823 (validKeyInArray!0 (select (arr!16418 a!3154) j!147)))))

(declare-fun b!539622 () Bool)

(declare-fun res!334829 () Bool)

(assert (=> b!539622 (=> (not res!334829) (not e!312731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34158 (_ BitVec 32)) Bool)

(assert (=> b!539622 (= res!334829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539623 () Bool)

(declare-fun res!334824 () Bool)

(assert (=> b!539623 (=> (not res!334824) (not e!312731))))

(declare-datatypes ((List!10537 0))(
  ( (Nil!10534) (Cons!10533 (h!11476 (_ BitVec 64)) (t!16765 List!10537)) )
))
(declare-fun arrayNoDuplicates!0 (array!34158 (_ BitVec 32) List!10537) Bool)

(assert (=> b!539623 (= res!334824 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10534))))

(declare-fun b!539624 () Bool)

(declare-fun res!334826 () Bool)

(assert (=> b!539624 (=> (not res!334826) (not e!312730))))

(declare-fun arrayContainsKey!0 (array!34158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539624 (= res!334826 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48946 res!334827) b!539617))

(assert (= (and b!539617 res!334821) b!539621))

(assert (= (and b!539621 res!334823) b!539618))

(assert (= (and b!539618 res!334825) b!539624))

(assert (= (and b!539624 res!334826) b!539616))

(assert (= (and b!539616 res!334822) b!539622))

(assert (= (and b!539622 res!334829) b!539623))

(assert (= (and b!539623 res!334824) b!539620))

(assert (= (and b!539620 res!334828) b!539614))

(assert (= (and b!539614 res!334819) b!539619))

(assert (= (and b!539619 res!334820) b!539615))

(declare-fun m!518609 () Bool)

(assert (=> b!539622 m!518609))

(declare-fun m!518611 () Bool)

(assert (=> b!539614 m!518611))

(assert (=> b!539614 m!518611))

(declare-fun m!518613 () Bool)

(assert (=> b!539614 m!518613))

(declare-fun m!518615 () Bool)

(assert (=> b!539615 m!518615))

(declare-fun m!518617 () Bool)

(assert (=> b!539623 m!518617))

(declare-fun m!518619 () Bool)

(assert (=> b!539618 m!518619))

(declare-fun m!518621 () Bool)

(assert (=> b!539624 m!518621))

(assert (=> b!539621 m!518611))

(assert (=> b!539621 m!518611))

(declare-fun m!518623 () Bool)

(assert (=> b!539621 m!518623))

(declare-fun m!518625 () Bool)

(assert (=> b!539620 m!518625))

(assert (=> b!539620 m!518611))

(assert (=> b!539619 m!518611))

(assert (=> b!539619 m!518611))

(declare-fun m!518627 () Bool)

(assert (=> b!539619 m!518627))

(assert (=> b!539619 m!518627))

(assert (=> b!539619 m!518611))

(declare-fun m!518629 () Bool)

(assert (=> b!539619 m!518629))

(declare-fun m!518631 () Bool)

(assert (=> start!48946 m!518631))

(declare-fun m!518633 () Bool)

(assert (=> start!48946 m!518633))

(declare-fun m!518635 () Bool)

(assert (=> b!539616 m!518635))

(push 1)

(assert (not start!48946))

(assert (not b!539614))

(assert (not b!539618))

(assert (not b!539616))

(assert (not b!539622))

(assert (not b!539619))

(assert (not b!539621))

(assert (not b!539624))

(assert (not b!539623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!31997 () Bool)

(declare-fun call!32000 () Bool)

(declare-fun c!62720 () Bool)

(assert (=> bm!31997 (= call!32000 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62720 (Cons!10533 (select (arr!16418 a!3154) #b00000000000000000000000000000000) Nil!10534) Nil!10534)))))

(declare-fun d!81593 () Bool)

(declare-fun res!334848 () Bool)

(declare-fun e!312757 () Bool)

(assert (=> d!81593 (=> res!334848 e!312757)))

(assert (=> d!81593 (= res!334848 (bvsge #b00000000000000000000000000000000 (size!16782 a!3154)))))

(assert (=> d!81593 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10534) e!312757)))

(declare-fun b!539662 () Bool)

(declare-fun e!312756 () Bool)

(assert (=> b!539662 (= e!312757 e!312756)))

(declare-fun res!334846 () Bool)

(assert (=> b!539662 (=> (not res!334846) (not e!312756))))

(declare-fun e!312758 () Bool)

(assert (=> b!539662 (= res!334846 (not e!312758))))

(declare-fun res!334847 () Bool)

(assert (=> b!539662 (=> (not res!334847) (not e!312758))))

(assert (=> b!539662 (= res!334847 (validKeyInArray!0 (select (arr!16418 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!539663 () Bool)

(declare-fun e!312759 () Bool)

(assert (=> b!539663 (= e!312759 call!32000)))

(declare-fun b!539664 () Bool)

(assert (=> b!539664 (= e!312756 e!312759)))

(assert (=> b!539664 (= c!62720 (validKeyInArray!0 (select (arr!16418 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!539665 () Bool)

(assert (=> b!539665 (= e!312759 call!32000)))

(declare-fun b!539666 () Bool)

(declare-fun contains!2793 (List!10537 (_ BitVec 64)) Bool)

(assert (=> b!539666 (= e!312758 (contains!2793 Nil!10534 (select (arr!16418 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81593 (not res!334848)) b!539662))

(assert (= (and b!539662 res!334847) b!539666))

(assert (= (and b!539662 res!334846) b!539664))

(assert (= (and b!539664 c!62720) b!539663))

(assert (= (and b!539664 (not c!62720)) b!539665))

(assert (= (or b!539663 b!539665) bm!31997))

(declare-fun m!518645 () Bool)

(assert (=> bm!31997 m!518645))

(declare-fun m!518647 () Bool)

(assert (=> bm!31997 m!518647))

(assert (=> b!539662 m!518645))

(assert (=> b!539662 m!518645))

(declare-fun m!518649 () Bool)

(assert (=> b!539662 m!518649))

(assert (=> b!539664 m!518645))

(assert (=> b!539664 m!518645))

(assert (=> b!539664 m!518649))

(assert (=> b!539666 m!518645))

(assert (=> b!539666 m!518645))

(declare-fun m!518651 () Bool)

(assert (=> b!539666 m!518651))

(assert (=> b!539623 d!81593))

(declare-fun d!81599 () Bool)

(assert (=> d!81599 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!539618 d!81599))

(declare-fun b!539718 () Bool)

(declare-fun e!312791 () SeekEntryResult!4876)

(assert (=> b!539718 (= e!312791 Undefined!4876)))

(declare-fun e!312792 () SeekEntryResult!4876)

(declare-fun b!539719 () Bool)

(declare-fun lt!247205 () SeekEntryResult!4876)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34158 (_ BitVec 32)) SeekEntryResult!4876)

(assert (=> b!539719 (= e!312792 (seekKeyOrZeroReturnVacant!0 (x!50635 lt!247205) (index!21730 lt!247205) (index!21730 lt!247205) k!1998 a!3154 mask!3216))))

(declare-fun b!539720 () Bool)

(declare-fun e!312790 () SeekEntryResult!4876)

(assert (=> b!539720 (= e!312790 (Found!4876 (index!21730 lt!247205)))))

(declare-fun b!539721 () Bool)

(assert (=> b!539721 (= e!312792 (MissingZero!4876 (index!21730 lt!247205)))))

(declare-fun b!539722 () Bool)

(declare-fun c!62741 () Bool)

(declare-fun lt!247207 () (_ BitVec 64))

(assert (=> b!539722 (= c!62741 (= lt!247207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!539722 (= e!312790 e!312792)))

(declare-fun b!539723 () Bool)

(assert (=> b!539723 (= e!312791 e!312790)))

(assert (=> b!539723 (= lt!247207 (select (arr!16418 a!3154) (index!21730 lt!247205)))))

(declare-fun c!62740 () Bool)

(assert (=> b!539723 (= c!62740 (= lt!247207 k!1998))))

(declare-fun d!81601 () Bool)

(declare-fun lt!247206 () SeekEntryResult!4876)

(assert (=> d!81601 (and (or (is-Undefined!4876 lt!247206) (not (is-Found!4876 lt!247206)) (and (bvsge (index!21729 lt!247206) #b00000000000000000000000000000000) (bvslt (index!21729 lt!247206) (size!16782 a!3154)))) (or (is-Undefined!4876 lt!247206) (is-Found!4876 lt!247206) (not (is-MissingZero!4876 lt!247206)) (and (bvsge (index!21728 lt!247206) #b00000000000000000000000000000000) (bvslt (index!21728 lt!247206) (size!16782 a!3154)))) (or (is-Undefined!4876 lt!247206) (is-Found!4876 lt!247206) (is-MissingZero!4876 lt!247206) (not (is-MissingVacant!4876 lt!247206)) (and (bvsge (index!21731 lt!247206) #b00000000000000000000000000000000) (bvslt (index!21731 lt!247206) (size!16782 a!3154)))) (or (is-Undefined!4876 lt!247206) (ite (is-Found!4876 lt!247206) (= (select (arr!16418 a!3154) (index!21729 lt!247206)) k!1998) (ite (is-MissingZero!4876 lt!247206) (= (select (arr!16418 a!3154) (index!21728 lt!247206)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4876 lt!247206) (= (select (arr!16418 a!3154) (index!21731 lt!247206)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81601 (= lt!247206 e!312791)))

(declare-fun c!62739 () Bool)

(assert (=> d!81601 (= c!62739 (and (is-Intermediate!4876 lt!247205) (undefined!5688 lt!247205)))))

(assert (=> d!81601 (= lt!247205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81601 (validMask!0 mask!3216)))

(assert (=> d!81601 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!247206)))

(assert (= (and d!81601 c!62739) b!539718))

(assert (= (and d!81601 (not c!62739)) b!539723))

(assert (= (and b!539723 c!62740) b!539720))

(assert (= (and b!539723 (not c!62740)) b!539722))

(assert (= (and b!539722 c!62741) b!539721))

(assert (= (and b!539722 (not c!62741)) b!539719))

(declare-fun m!518671 () Bool)

(assert (=> b!539719 m!518671))

(declare-fun m!518673 () Bool)

(assert (=> b!539723 m!518673))

(declare-fun m!518675 () Bool)

(assert (=> d!81601 m!518675))

(declare-fun m!518677 () Bool)

(assert (=> d!81601 m!518677))

(declare-fun m!518679 () Bool)

(assert (=> d!81601 m!518679))

(declare-fun m!518681 () Bool)

(assert (=> d!81601 m!518681))

(assert (=> d!81601 m!518631))

(assert (=> d!81601 m!518677))

(declare-fun m!518683 () Bool)

(assert (=> d!81601 m!518683))

(assert (=> b!539616 d!81601))

(declare-fun d!81611 () Bool)

(declare-fun res!334879 () Bool)

(declare-fun e!312820 () Bool)

(assert (=> d!81611 (=> res!334879 e!312820)))

(assert (=> d!81611 (= res!334879 (bvsge #b00000000000000000000000000000000 (size!16782 a!3154)))))

(assert (=> d!81611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!312820)))

(declare-fun b!539759 () Bool)

(declare-fun e!312821 () Bool)

(declare-fun call!32006 () Bool)

(assert (=> b!539759 (= e!312821 call!32006)))

(declare-fun b!539761 () Bool)

(declare-fun e!312816 () Bool)

(assert (=> b!539761 (= e!312820 e!312816)))

(declare-fun c!62753 () Bool)

(assert (=> b!539761 (= c!62753 (validKeyInArray!0 (select (arr!16418 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32003 () Bool)

(assert (=> bm!32003 (= call!32006 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!539764 () Bool)

(assert (=> b!539764 (= e!312816 e!312821)))

(declare-fun lt!247226 () (_ BitVec 64))

(assert (=> b!539764 (= lt!247226 (select (arr!16418 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16886 0))(
  ( (Unit!16887) )
))
(declare-fun lt!247230 () Unit!16886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34158 (_ BitVec 64) (_ BitVec 32)) Unit!16886)

(assert (=> b!539764 (= lt!247230 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247226 #b00000000000000000000000000000000))))

(assert (=> b!539764 (arrayContainsKey!0 a!3154 lt!247226 #b00000000000000000000000000000000)))

(declare-fun lt!247229 () Unit!16886)

(assert (=> b!539764 (= lt!247229 lt!247230)))

(declare-fun res!334878 () Bool)

(assert (=> b!539764 (= res!334878 (= (seekEntryOrOpen!0 (select (arr!16418 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4876 #b00000000000000000000000000000000)))))

(assert (=> b!539764 (=> (not res!334878) (not e!312821))))

(declare-fun b!539766 () Bool)

(assert (=> b!539766 (= e!312816 call!32006)))

(assert (= (and d!81611 (not res!334879)) b!539761))

(assert (= (and b!539761 c!62753) b!539764))

(assert (= (and b!539761 (not c!62753)) b!539766))

(assert (= (and b!539764 res!334878) b!539759))

(assert (= (or b!539759 b!539766) bm!32003))

(assert (=> b!539761 m!518645))

(assert (=> b!539761 m!518645))

(assert (=> b!539761 m!518649))

(declare-fun m!518695 () Bool)

(assert (=> bm!32003 m!518695))

(assert (=> b!539764 m!518645))

(declare-fun m!518697 () Bool)

(assert (=> b!539764 m!518697))

(declare-fun m!518701 () Bool)

(assert (=> b!539764 m!518701))

(assert (=> b!539764 m!518645))

(declare-fun m!518705 () Bool)

(assert (=> b!539764 m!518705))

(assert (=> b!539622 d!81611))

(declare-fun d!81621 () Bool)

(assert (=> d!81621 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48946 d!81621))

(declare-fun d!81629 () Bool)

(assert (=> d!81629 (= (array_inv!12214 a!3154) (bvsge (size!16782 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48946 d!81629))

(declare-fun d!81631 () Bool)

(assert (=> d!81631 (= (validKeyInArray!0 (select (arr!16418 a!3154) j!147)) (and (not (= (select (arr!16418 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16418 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!539621 d!81631))

(declare-fun d!81633 () Bool)

(declare-fun res!334902 () Bool)

(declare-fun e!312849 () Bool)

(assert (=> d!81633 (=> res!334902 e!312849)))

(assert (=> d!81633 (= res!334902 (= (select (arr!16418 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81633 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!312849)))

(declare-fun b!539803 () Bool)

(declare-fun e!312850 () Bool)

(assert (=> b!539803 (= e!312849 e!312850)))

(declare-fun res!334903 () Bool)

(assert (=> b!539803 (=> (not res!334903) (not e!312850))))

(assert (=> b!539803 (= res!334903 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16782 a!3154)))))

(declare-fun b!539804 () Bool)

(assert (=> b!539804 (= e!312850 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81633 (not res!334902)) b!539803))

(assert (= (and b!539803 res!334903) b!539804))

(assert (=> d!81633 m!518645))

(declare-fun m!518733 () Bool)

(assert (=> b!539804 m!518733))

(assert (=> b!539624 d!81633))

(declare-fun b!539853 () Bool)

(declare-fun lt!247259 () SeekEntryResult!4876)

(assert (=> b!539853 (and (bvsge (index!21730 lt!247259) #b00000000000000000000000000000000) (bvslt (index!21730 lt!247259) (size!16782 a!3154)))))

(declare-fun res!334917 () Bool)

(assert (=> b!539853 (= res!334917 (= (select (arr!16418 a!3154) (index!21730 lt!247259)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!312879 () Bool)

(assert (=> b!539853 (=> res!334917 e!312879)))

(declare-fun b!539854 () Bool)

(assert (=> b!539854 (and (bvsge (index!21730 lt!247259) #b00000000000000000000000000000000) (bvslt (index!21730 lt!247259) (size!16782 a!3154)))))

(declare-fun res!334916 () Bool)

(assert (=> b!539854 (= res!334916 (= (select (arr!16418 a!3154) (index!21730 lt!247259)) (select (arr!16418 a!3154) j!147)))))

(assert (=> b!539854 (=> res!334916 e!312879)))

(declare-fun e!312883 () Bool)

(assert (=> b!539854 (= e!312883 e!312879)))

(declare-fun b!539855 () Bool)

(declare-fun e!312882 () Bool)

(assert (=> b!539855 (= e!312882 e!312883)))

(declare-fun res!334918 () Bool)

(assert (=> b!539855 (= res!334918 (and (is-Intermediate!4876 lt!247259) (not (undefined!5688 lt!247259)) (bvslt (x!50635 lt!247259) #b01111111111111111111111111111110) (bvsge (x!50635 lt!247259) #b00000000000000000000000000000000) (bvsge (x!50635 lt!247259) #b00000000000000000000000000000000)))))

(assert (=> b!539855 (=> (not res!334918) (not e!312883))))

(declare-fun b!539856 () Bool)

(assert (=> b!539856 (and (bvsge (index!21730 lt!247259) #b00000000000000000000000000000000) (bvslt (index!21730 lt!247259) (size!16782 a!3154)))))

(assert (=> b!539856 (= e!312879 (= (select (arr!16418 a!3154) (index!21730 lt!247259)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!312881 () SeekEntryResult!4876)

(declare-fun b!539858 () Bool)

(assert (=> b!539858 (= e!312881 (Intermediate!4876 true (toIndex!0 (select (arr!16418 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!539859 () Bool)

(declare-fun e!312880 () SeekEntryResult!4876)

(assert (=> b!539859 (= e!312881 e!312880)))

(declare-fun c!62783 () Bool)

(declare-fun lt!247258 () (_ BitVec 64))

(assert (=> b!539859 (= c!62783 (or (= lt!247258 (select (arr!16418 a!3154) j!147)) (= (bvadd lt!247258 lt!247258) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!539860 () Bool)

(assert (=> b!539860 (= e!312882 (bvsge (x!50635 lt!247259) #b01111111111111111111111111111110))))

(declare-fun b!539861 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539861 (= e!312880 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16418 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16418 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!81639 () Bool)

(assert (=> d!81639 e!312882))

(declare-fun c!62782 () Bool)

(assert (=> d!81639 (= c!62782 (and (is-Intermediate!4876 lt!247259) (undefined!5688 lt!247259)))))

(assert (=> d!81639 (= lt!247259 e!312881)))

(declare-fun c!62781 () Bool)

(assert (=> d!81639 (= c!62781 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81639 (= lt!247258 (select (arr!16418 a!3154) (toIndex!0 (select (arr!16418 a!3154) j!147) mask!3216)))))

(assert (=> d!81639 (validMask!0 mask!3216)))

(assert (=> d!81639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16418 a!3154) j!147) mask!3216) (select (arr!16418 a!3154) j!147) a!3154 mask!3216) lt!247259)))

(declare-fun b!539857 () Bool)

(assert (=> b!539857 (= e!312880 (Intermediate!4876 false (toIndex!0 (select (arr!16418 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(assert (= (and d!81639 c!62781) b!539858))

(assert (= (and d!81639 (not c!62781)) b!539859))

(assert (= (and b!539859 c!62783) b!539857))

(assert (= (and b!539859 (not c!62783)) b!539861))

(assert (= (and d!81639 c!62782) b!539860))

(assert (= (and d!81639 (not c!62782)) b!539855))

(assert (= (and b!539855 res!334918) b!539854))

(assert (= (and b!539854 (not res!334916)) b!539853))

(assert (= (and b!539853 (not res!334917)) b!539856))

(declare-fun m!518757 () Bool)

(assert (=> b!539854 m!518757))

(assert (=> b!539853 m!518757))

(assert (=> b!539856 m!518757))

(assert (=> d!81639 m!518627))

(declare-fun m!518759 () Bool)

(assert (=> d!81639 m!518759))

(assert (=> d!81639 m!518631))

(assert (=> b!539861 m!518627))

(declare-fun m!518761 () Bool)

(assert (=> b!539861 m!518761))

(assert (=> b!539861 m!518761))

(assert (=> b!539861 m!518611))

(declare-fun m!518763 () Bool)

(assert (=> b!539861 m!518763))

(assert (=> b!539619 d!81639))

(declare-fun d!81651 () Bool)

(declare-fun lt!247265 () (_ BitVec 32))

(declare-fun lt!247264 () (_ BitVec 32))

(assert (=> d!81651 (= lt!247265 (bvmul (bvxor lt!247264 (bvlshr lt!247264 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81651 (= lt!247264 ((_ extract 31 0) (bvand (bvxor (select (arr!16418 a!3154) j!147) (bvlshr (select (arr!16418 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81651 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!334925 (let ((h!11479 ((_ extract 31 0) (bvand (bvxor (select (arr!16418 a!3154) j!147) (bvlshr (select (arr!16418 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50641 (bvmul (bvxor h!11479 (bvlshr h!11479 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50641 (bvlshr x!50641 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!334925 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!334925 #b00000000000000000000000000000000))))))

(assert (=> d!81651 (= (toIndex!0 (select (arr!16418 a!3154) j!147) mask!3216) (bvand (bvxor lt!247265 (bvlshr lt!247265 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!539619 d!81651))

(declare-fun b!539877 () Bool)

(declare-fun lt!247267 () SeekEntryResult!4876)

(assert (=> b!539877 (and (bvsge (index!21730 lt!247267) #b00000000000000000000000000000000) (bvslt (index!21730 lt!247267) (size!16782 a!3154)))))

(declare-fun res!334930 () Bool)

(assert (=> b!539877 (= res!334930 (= (select (arr!16418 a!3154) (index!21730 lt!247267)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!312896 () Bool)

(assert (=> b!539877 (=> res!334930 e!312896)))

(declare-fun b!539878 () Bool)

(assert (=> b!539878 (and (bvsge (index!21730 lt!247267) #b00000000000000000000000000000000) (bvslt (index!21730 lt!247267) (size!16782 a!3154)))))

(declare-fun res!334929 () Bool)

(assert (=> b!539878 (= res!334929 (= (select (arr!16418 a!3154) (index!21730 lt!247267)) (select (arr!16418 a!3154) j!147)))))

(assert (=> b!539878 (=> res!334929 e!312896)))

(declare-fun e!312900 () Bool)

(assert (=> b!539878 (= e!312900 e!312896)))

(declare-fun b!539879 () Bool)

(declare-fun e!312899 () Bool)

(assert (=> b!539879 (= e!312899 e!312900)))

(declare-fun res!334931 () Bool)

(assert (=> b!539879 (= res!334931 (and (is-Intermediate!4876 lt!247267) (not (undefined!5688 lt!247267)) (bvslt (x!50635 lt!247267) #b01111111111111111111111111111110) (bvsge (x!50635 lt!247267) #b00000000000000000000000000000000) (bvsge (x!50635 lt!247267) x!1030)))))

(assert (=> b!539879 (=> (not res!334931) (not e!312900))))

(declare-fun b!539880 () Bool)

(assert (=> b!539880 (and (bvsge (index!21730 lt!247267) #b00000000000000000000000000000000) (bvslt (index!21730 lt!247267) (size!16782 a!3154)))))

(assert (=> b!539880 (= e!312896 (= (select (arr!16418 a!3154) (index!21730 lt!247267)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!539882 () Bool)

(declare-fun e!312898 () SeekEntryResult!4876)

(assert (=> b!539882 (= e!312898 (Intermediate!4876 true index!1177 x!1030))))

(declare-fun b!539883 () Bool)

(declare-fun e!312897 () SeekEntryResult!4876)

(assert (=> b!539883 (= e!312898 e!312897)))

(declare-fun c!62789 () Bool)

(declare-fun lt!247266 () (_ BitVec 64))

(assert (=> b!539883 (= c!62789 (or (= lt!247266 (select (arr!16418 a!3154) j!147)) (= (bvadd lt!247266 lt!247266) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!539884 () Bool)

(assert (=> b!539884 (= e!312899 (bvsge (x!50635 lt!247267) #b01111111111111111111111111111110))))

(declare-fun b!539885 () Bool)

(assert (=> b!539885 (= e!312897 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16418 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!81653 () Bool)

(assert (=> d!81653 e!312899))

(declare-fun c!62788 () Bool)

(assert (=> d!81653 (= c!62788 (and (is-Intermediate!4876 lt!247267) (undefined!5688 lt!247267)))))

(assert (=> d!81653 (= lt!247267 e!312898)))

(declare-fun c!62787 () Bool)

(assert (=> d!81653 (= c!62787 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81653 (= lt!247266 (select (arr!16418 a!3154) index!1177))))

(assert (=> d!81653 (validMask!0 mask!3216)))

(assert (=> d!81653 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16418 a!3154) j!147) a!3154 mask!3216) lt!247267)))

(declare-fun b!539881 () Bool)

