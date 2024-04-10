; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50066 () Bool)

(assert start!50066)

(declare-fun b!548614 () Bool)

(declare-fun res!341939 () Bool)

(declare-fun e!316926 () Bool)

(assert (=> b!548614 (=> (not res!341939) (not e!316926))))

(declare-datatypes ((array!34603 0))(
  ( (array!34604 (arr!16620 (Array (_ BitVec 32) (_ BitVec 64))) (size!16984 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34603)

(declare-datatypes ((List!10700 0))(
  ( (Nil!10697) (Cons!10696 (h!11666 (_ BitVec 64)) (t!16928 List!10700)) )
))
(declare-fun arrayNoDuplicates!0 (array!34603 (_ BitVec 32) List!10700) Bool)

(assert (=> b!548614 (= res!341939 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10697))))

(declare-fun b!548615 () Bool)

(declare-fun res!341941 () Bool)

(declare-fun e!316924 () Bool)

(assert (=> b!548615 (=> (not res!341941) (not e!316924))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548615 (= res!341941 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!341942 () Bool)

(assert (=> start!50066 (=> (not res!341942) (not e!316924))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50066 (= res!341942 (validMask!0 mask!3119))))

(assert (=> start!50066 e!316924))

(assert (=> start!50066 true))

(declare-fun array_inv!12416 (array!34603) Bool)

(assert (=> start!50066 (array_inv!12416 a!3118)))

(declare-fun b!548616 () Bool)

(assert (=> b!548616 (= e!316926 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsgt mask!3119 #b00111111111111111111111111111111)))))

(declare-fun b!548617 () Bool)

(declare-fun res!341938 () Bool)

(assert (=> b!548617 (=> (not res!341938) (not e!316924))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548617 (= res!341938 (and (= (size!16984 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16984 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16984 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548618 () Bool)

(declare-fun res!341937 () Bool)

(assert (=> b!548618 (=> (not res!341937) (not e!316924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548618 (= res!341937 (validKeyInArray!0 k!1914))))

(declare-fun b!548619 () Bool)

(declare-fun res!341940 () Bool)

(assert (=> b!548619 (=> (not res!341940) (not e!316926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34603 (_ BitVec 32)) Bool)

(assert (=> b!548619 (= res!341940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548620 () Bool)

(declare-fun res!341936 () Bool)

(assert (=> b!548620 (=> (not res!341936) (not e!316924))))

(assert (=> b!548620 (= res!341936 (validKeyInArray!0 (select (arr!16620 a!3118) j!142)))))

(declare-fun b!548621 () Bool)

(assert (=> b!548621 (= e!316924 e!316926)))

(declare-fun res!341935 () Bool)

(assert (=> b!548621 (=> (not res!341935) (not e!316926))))

(declare-datatypes ((SeekEntryResult!5069 0))(
  ( (MissingZero!5069 (index!22503 (_ BitVec 32))) (Found!5069 (index!22504 (_ BitVec 32))) (Intermediate!5069 (undefined!5881 Bool) (index!22505 (_ BitVec 32)) (x!51444 (_ BitVec 32))) (Undefined!5069) (MissingVacant!5069 (index!22506 (_ BitVec 32))) )
))
(declare-fun lt!249874 () SeekEntryResult!5069)

(assert (=> b!548621 (= res!341935 (or (= lt!249874 (MissingZero!5069 i!1132)) (= lt!249874 (MissingVacant!5069 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34603 (_ BitVec 32)) SeekEntryResult!5069)

(assert (=> b!548621 (= lt!249874 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50066 res!341942) b!548617))

(assert (= (and b!548617 res!341938) b!548620))

(assert (= (and b!548620 res!341936) b!548618))

(assert (= (and b!548618 res!341937) b!548615))

(assert (= (and b!548615 res!341941) b!548621))

(assert (= (and b!548621 res!341935) b!548619))

(assert (= (and b!548619 res!341940) b!548614))

(assert (= (and b!548614 res!341939) b!548616))

(declare-fun m!525597 () Bool)

(assert (=> b!548614 m!525597))

(declare-fun m!525599 () Bool)

(assert (=> b!548619 m!525599))

(declare-fun m!525601 () Bool)

(assert (=> start!50066 m!525601))

(declare-fun m!525603 () Bool)

(assert (=> start!50066 m!525603))

(declare-fun m!525605 () Bool)

(assert (=> b!548618 m!525605))

(declare-fun m!525607 () Bool)

(assert (=> b!548615 m!525607))

(declare-fun m!525609 () Bool)

(assert (=> b!548620 m!525609))

(assert (=> b!548620 m!525609))

(declare-fun m!525611 () Bool)

(assert (=> b!548620 m!525611))

(declare-fun m!525613 () Bool)

(assert (=> b!548621 m!525613))

(push 1)

(assert (not b!548618))

(assert (not b!548620))

(assert (not b!548619))

(assert (not b!548614))

(assert (not b!548615))

(assert (not b!548621))

(assert (not start!50066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82675 () Bool)

(declare-fun lt!249913 () SeekEntryResult!5069)

(assert (=> d!82675 (and (or (is-Undefined!5069 lt!249913) (not (is-Found!5069 lt!249913)) (and (bvsge (index!22504 lt!249913) #b00000000000000000000000000000000) (bvslt (index!22504 lt!249913) (size!16984 a!3118)))) (or (is-Undefined!5069 lt!249913) (is-Found!5069 lt!249913) (not (is-MissingZero!5069 lt!249913)) (and (bvsge (index!22503 lt!249913) #b00000000000000000000000000000000) (bvslt (index!22503 lt!249913) (size!16984 a!3118)))) (or (is-Undefined!5069 lt!249913) (is-Found!5069 lt!249913) (is-MissingZero!5069 lt!249913) (not (is-MissingVacant!5069 lt!249913)) (and (bvsge (index!22506 lt!249913) #b00000000000000000000000000000000) (bvslt (index!22506 lt!249913) (size!16984 a!3118)))) (or (is-Undefined!5069 lt!249913) (ite (is-Found!5069 lt!249913) (= (select (arr!16620 a!3118) (index!22504 lt!249913)) k!1914) (ite (is-MissingZero!5069 lt!249913) (= (select (arr!16620 a!3118) (index!22503 lt!249913)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5069 lt!249913) (= (select (arr!16620 a!3118) (index!22506 lt!249913)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!316975 () SeekEntryResult!5069)

(assert (=> d!82675 (= lt!249913 e!316975)))

(declare-fun c!63691 () Bool)

(declare-fun lt!249912 () SeekEntryResult!5069)

(assert (=> d!82675 (= c!63691 (and (is-Intermediate!5069 lt!249912) (undefined!5881 lt!249912)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34603 (_ BitVec 32)) SeekEntryResult!5069)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82675 (= lt!249912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82675 (validMask!0 mask!3119)))

(assert (=> d!82675 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249913)))

(declare-fun e!316977 () SeekEntryResult!5069)

(declare-fun b!548720 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34603 (_ BitVec 32)) SeekEntryResult!5069)

(assert (=> b!548720 (= e!316977 (seekKeyOrZeroReturnVacant!0 (x!51444 lt!249912) (index!22505 lt!249912) (index!22505 lt!249912) k!1914 a!3118 mask!3119))))

(declare-fun b!548721 () Bool)

(declare-fun c!63690 () Bool)

(declare-fun lt!249911 () (_ BitVec 64))

(assert (=> b!548721 (= c!63690 (= lt!249911 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316976 () SeekEntryResult!5069)

(assert (=> b!548721 (= e!316976 e!316977)))

(declare-fun b!548722 () Bool)

(assert (=> b!548722 (= e!316975 Undefined!5069)))

(declare-fun b!548723 () Bool)

(assert (=> b!548723 (= e!316976 (Found!5069 (index!22505 lt!249912)))))

(declare-fun b!548724 () Bool)

(assert (=> b!548724 (= e!316975 e!316976)))

(assert (=> b!548724 (= lt!249911 (select (arr!16620 a!3118) (index!22505 lt!249912)))))

(declare-fun c!63689 () Bool)

(assert (=> b!548724 (= c!63689 (= lt!249911 k!1914))))

(declare-fun b!548725 () Bool)

(assert (=> b!548725 (= e!316977 (MissingZero!5069 (index!22505 lt!249912)))))

(assert (= (and d!82675 c!63691) b!548722))

(assert (= (and d!82675 (not c!63691)) b!548724))

(assert (= (and b!548724 c!63689) b!548723))

(assert (= (and b!548724 (not c!63689)) b!548721))

(assert (= (and b!548721 c!63690) b!548725))

(assert (= (and b!548721 (not c!63690)) b!548720))

(declare-fun m!525677 () Bool)

(assert (=> d!82675 m!525677))

(declare-fun m!525679 () Bool)

(assert (=> d!82675 m!525679))

(assert (=> d!82675 m!525679))

(declare-fun m!525681 () Bool)

(assert (=> d!82675 m!525681))

(declare-fun m!525683 () Bool)

(assert (=> d!82675 m!525683))

(declare-fun m!525685 () Bool)

(assert (=> d!82675 m!525685))

(assert (=> d!82675 m!525601))

(declare-fun m!525687 () Bool)

(assert (=> b!548720 m!525687))

(declare-fun m!525689 () Bool)

(assert (=> b!548724 m!525689))

(assert (=> b!548621 d!82675))

(declare-fun d!82685 () Bool)

(declare-fun res!342011 () Bool)

(declare-fun e!316989 () Bool)

(assert (=> d!82685 (=> res!342011 e!316989)))

(assert (=> d!82685 (= res!342011 (= (select (arr!16620 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82685 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!316989)))

(declare-fun b!548738 () Bool)

(declare-fun e!316990 () Bool)

(assert (=> b!548738 (= e!316989 e!316990)))

(declare-fun res!342012 () Bool)

(assert (=> b!548738 (=> (not res!342012) (not e!316990))))

(assert (=> b!548738 (= res!342012 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16984 a!3118)))))

(declare-fun b!548739 () Bool)

(assert (=> b!548739 (= e!316990 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82685 (not res!342011)) b!548738))

(assert (= (and b!548738 res!342012) b!548739))

(declare-fun m!525703 () Bool)

(assert (=> d!82685 m!525703))

(declare-fun m!525705 () Bool)

(assert (=> b!548739 m!525705))

(assert (=> b!548615 d!82685))

(declare-fun d!82693 () Bool)

(assert (=> d!82693 (= (validKeyInArray!0 (select (arr!16620 a!3118) j!142)) (and (not (= (select (arr!16620 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16620 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548620 d!82693))

(declare-fun d!82699 () Bool)

(assert (=> d!82699 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50066 d!82699))

(declare-fun d!82711 () Bool)

(assert (=> d!82711 (= (array_inv!12416 a!3118) (bvsge (size!16984 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50066 d!82711))

(declare-fun b!548783 () Bool)

(declare-fun e!317028 () Bool)

(declare-fun e!317029 () Bool)

(assert (=> b!548783 (= e!317028 e!317029)))

(declare-fun res!342043 () Bool)

(assert (=> b!548783 (=> (not res!342043) (not e!317029))))

(declare-fun e!317027 () Bool)

(assert (=> b!548783 (= res!342043 (not e!317027))))

(declare-fun res!342042 () Bool)

(assert (=> b!548783 (=> (not res!342042) (not e!317027))))

(assert (=> b!548783 (= res!342042 (validKeyInArray!0 (select (arr!16620 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548784 () Bool)

(declare-fun contains!2828 (List!10700 (_ BitVec 64)) Bool)

(assert (=> b!548784 (= e!317027 (contains!2828 Nil!10697 (select (arr!16620 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548785 () Bool)

(declare-fun e!317030 () Bool)

(assert (=> b!548785 (= e!317029 e!317030)))

(declare-fun c!63700 () Bool)

(assert (=> b!548785 (= c!63700 (validKeyInArray!0 (select (arr!16620 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548786 () Bool)

(declare-fun call!32224 () Bool)

(assert (=> b!548786 (= e!317030 call!32224)))

(declare-fun b!548787 () Bool)

(assert (=> b!548787 (= e!317030 call!32224)))

(declare-fun d!82713 () Bool)

(declare-fun res!342044 () Bool)

(assert (=> d!82713 (=> res!342044 e!317028)))

(assert (=> d!82713 (= res!342044 (bvsge #b00000000000000000000000000000000 (size!16984 a!3118)))))

(assert (=> d!82713 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10697) e!317028)))

(declare-fun bm!32221 () Bool)

(assert (=> bm!32221 (= call!32224 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63700 (Cons!10696 (select (arr!16620 a!3118) #b00000000000000000000000000000000) Nil!10697) Nil!10697)))))

(assert (= (and d!82713 (not res!342044)) b!548783))

(assert (= (and b!548783 res!342042) b!548784))

(assert (= (and b!548783 res!342043) b!548785))

(assert (= (and b!548785 c!63700) b!548786))

(assert (= (and b!548785 (not c!63700)) b!548787))

(assert (= (or b!548786 b!548787) bm!32221))

(assert (=> b!548783 m!525703))

(assert (=> b!548783 m!525703))

(declare-fun m!525715 () Bool)

(assert (=> b!548783 m!525715))

(assert (=> b!548784 m!525703))

(assert (=> b!548784 m!525703))

(declare-fun m!525717 () Bool)

(assert (=> b!548784 m!525717))

(assert (=> b!548785 m!525703))

(assert (=> b!548785 m!525703))

(assert (=> b!548785 m!525715))

(assert (=> bm!32221 m!525703))

(declare-fun m!525719 () Bool)

(assert (=> bm!32221 m!525719))

(assert (=> b!548614 d!82713))

(declare-fun b!548813 () Bool)

(declare-fun e!317047 () Bool)

(declare-fun e!317048 () Bool)

(assert (=> b!548813 (= e!317047 e!317048)))

(declare-fun lt!249929 () (_ BitVec 64))

(assert (=> b!548813 (= lt!249929 (select (arr!16620 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16976 0))(
  ( (Unit!16977) )
))
(declare-fun lt!249931 () Unit!16976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34603 (_ BitVec 64) (_ BitVec 32)) Unit!16976)

(assert (=> b!548813 (= lt!249931 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249929 #b00000000000000000000000000000000))))

(assert (=> b!548813 (arrayContainsKey!0 a!3118 lt!249929 #b00000000000000000000000000000000)))

(declare-fun lt!249930 () Unit!16976)

(assert (=> b!548813 (= lt!249930 lt!249931)))

(declare-fun res!342052 () Bool)

(assert (=> b!548813 (= res!342052 (= (seekEntryOrOpen!0 (select (arr!16620 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5069 #b00000000000000000000000000000000)))))

