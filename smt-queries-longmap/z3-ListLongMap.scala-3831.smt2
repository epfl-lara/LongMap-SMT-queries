; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52540 () Bool)

(assert start!52540)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!573587 () Bool)

(declare-datatypes ((SeekEntryResult!5673 0))(
  ( (MissingZero!5673 (index!24919 (_ BitVec 32))) (Found!5673 (index!24920 (_ BitVec 32))) (Intermediate!5673 (undefined!6485 Bool) (index!24921 (_ BitVec 32)) (x!53791 (_ BitVec 32))) (Undefined!5673) (MissingVacant!5673 (index!24922 (_ BitVec 32))) )
))
(declare-fun lt!261931 () SeekEntryResult!5673)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!329981 () Bool)

(declare-datatypes ((array!35874 0))(
  ( (array!35875 (arr!17224 (Array (_ BitVec 32) (_ BitVec 64))) (size!17588 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35874)

(get-info :version)

(assert (=> b!573587 (= e!329981 (not (or (undefined!6485 lt!261931) (not ((_ is Intermediate!5673) lt!261931)) (let ((bdg!17977 (select (arr!17224 a!3118) (index!24921 lt!261931)))) (or (= bdg!17977 (select (arr!17224 a!3118) j!142)) (= bdg!17977 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24921 lt!261931) #b00000000000000000000000000000000) (bvsge (index!24921 lt!261931) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!53791 lt!261931) #b01111111111111111111111111111110) (bvsge (x!53791 lt!261931) #b00000000000000000000000000000000)))))))))

(declare-fun e!329980 () Bool)

(assert (=> b!573587 e!329980))

(declare-fun res!362833 () Bool)

(assert (=> b!573587 (=> (not res!362833) (not e!329980))))

(declare-fun lt!261935 () SeekEntryResult!5673)

(assert (=> b!573587 (= res!362833 (= lt!261935 (Found!5673 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35874 (_ BitVec 32)) SeekEntryResult!5673)

(assert (=> b!573587 (= lt!261935 (seekEntryOrOpen!0 (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35874 (_ BitVec 32)) Bool)

(assert (=> b!573587 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18048 0))(
  ( (Unit!18049) )
))
(declare-fun lt!261929 () Unit!18048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18048)

(assert (=> b!573587 (= lt!261929 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573588 () Bool)

(declare-fun e!329984 () Bool)

(declare-fun e!329983 () Bool)

(assert (=> b!573588 (= e!329984 e!329983)))

(declare-fun res!362829 () Bool)

(assert (=> b!573588 (=> (not res!362829) (not e!329983))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35874 (_ BitVec 32)) SeekEntryResult!5673)

(assert (=> b!573588 (= res!362829 (= lt!261935 (seekKeyOrZeroReturnVacant!0 (x!53791 lt!261931) (index!24921 lt!261931) (index!24921 lt!261931) (select (arr!17224 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573589 () Bool)

(declare-fun res!362834 () Bool)

(declare-fun e!329982 () Bool)

(assert (=> b!573589 (=> (not res!362834) (not e!329982))))

(declare-datatypes ((List!11304 0))(
  ( (Nil!11301) (Cons!11300 (h!12330 (_ BitVec 64)) (t!17532 List!11304)) )
))
(declare-fun arrayNoDuplicates!0 (array!35874 (_ BitVec 32) List!11304) Bool)

(assert (=> b!573589 (= res!362834 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11301))))

(declare-fun b!573590 () Bool)

(declare-fun res!362824 () Bool)

(declare-fun e!329978 () Bool)

(assert (=> b!573590 (=> (not res!362824) (not e!329978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573590 (= res!362824 (validKeyInArray!0 (select (arr!17224 a!3118) j!142)))))

(declare-fun b!573591 () Bool)

(declare-fun e!329985 () Bool)

(assert (=> b!573591 (= e!329980 e!329985)))

(declare-fun res!362828 () Bool)

(assert (=> b!573591 (=> res!362828 e!329985)))

(assert (=> b!573591 (= res!362828 (or (undefined!6485 lt!261931) (not ((_ is Intermediate!5673) lt!261931))))))

(declare-fun res!362831 () Bool)

(assert (=> start!52540 (=> (not res!362831) (not e!329978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52540 (= res!362831 (validMask!0 mask!3119))))

(assert (=> start!52540 e!329978))

(assert (=> start!52540 true))

(declare-fun array_inv!13020 (array!35874) Bool)

(assert (=> start!52540 (array_inv!13020 a!3118)))

(declare-fun b!573592 () Bool)

(declare-fun res!362827 () Bool)

(assert (=> b!573592 (=> (not res!362827) (not e!329978))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!573592 (= res!362827 (and (= (size!17588 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17588 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17588 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573593 () Bool)

(assert (=> b!573593 (= e!329985 e!329984)))

(declare-fun res!362825 () Bool)

(assert (=> b!573593 (=> res!362825 e!329984)))

(declare-fun lt!261934 () (_ BitVec 64))

(assert (=> b!573593 (= res!362825 (or (= lt!261934 (select (arr!17224 a!3118) j!142)) (= lt!261934 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!573593 (= lt!261934 (select (arr!17224 a!3118) (index!24921 lt!261931)))))

(declare-fun b!573594 () Bool)

(declare-fun res!362832 () Bool)

(assert (=> b!573594 (=> (not res!362832) (not e!329978))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573594 (= res!362832 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573595 () Bool)

(assert (=> b!573595 (= e!329978 e!329982)))

(declare-fun res!362823 () Bool)

(assert (=> b!573595 (=> (not res!362823) (not e!329982))))

(declare-fun lt!261936 () SeekEntryResult!5673)

(assert (=> b!573595 (= res!362823 (or (= lt!261936 (MissingZero!5673 i!1132)) (= lt!261936 (MissingVacant!5673 i!1132))))))

(assert (=> b!573595 (= lt!261936 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!573596 () Bool)

(declare-fun lt!261930 () array!35874)

(declare-fun lt!261933 () (_ BitVec 64))

(assert (=> b!573596 (= e!329983 (= (seekEntryOrOpen!0 lt!261933 lt!261930 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53791 lt!261931) (index!24921 lt!261931) (index!24921 lt!261931) lt!261933 lt!261930 mask!3119)))))

(declare-fun b!573597 () Bool)

(declare-fun res!362822 () Bool)

(assert (=> b!573597 (=> (not res!362822) (not e!329978))))

(assert (=> b!573597 (= res!362822 (validKeyInArray!0 k0!1914))))

(declare-fun b!573598 () Bool)

(assert (=> b!573598 (= e!329982 e!329981)))

(declare-fun res!362830 () Bool)

(assert (=> b!573598 (=> (not res!362830) (not e!329981))))

(declare-fun lt!261932 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35874 (_ BitVec 32)) SeekEntryResult!5673)

(assert (=> b!573598 (= res!362830 (= lt!261931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261932 lt!261933 lt!261930 mask!3119)))))

(declare-fun lt!261937 () (_ BitVec 32))

(assert (=> b!573598 (= lt!261931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261937 (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573598 (= lt!261932 (toIndex!0 lt!261933 mask!3119))))

(assert (=> b!573598 (= lt!261933 (select (store (arr!17224 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!573598 (= lt!261937 (toIndex!0 (select (arr!17224 a!3118) j!142) mask!3119))))

(assert (=> b!573598 (= lt!261930 (array!35875 (store (arr!17224 a!3118) i!1132 k0!1914) (size!17588 a!3118)))))

(declare-fun b!573599 () Bool)

(declare-fun res!362826 () Bool)

(assert (=> b!573599 (=> (not res!362826) (not e!329982))))

(assert (=> b!573599 (= res!362826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52540 res!362831) b!573592))

(assert (= (and b!573592 res!362827) b!573590))

(assert (= (and b!573590 res!362824) b!573597))

(assert (= (and b!573597 res!362822) b!573594))

(assert (= (and b!573594 res!362832) b!573595))

(assert (= (and b!573595 res!362823) b!573599))

(assert (= (and b!573599 res!362826) b!573589))

(assert (= (and b!573589 res!362834) b!573598))

(assert (= (and b!573598 res!362830) b!573587))

(assert (= (and b!573587 res!362833) b!573591))

(assert (= (and b!573591 (not res!362828)) b!573593))

(assert (= (and b!573593 (not res!362825)) b!573588))

(assert (= (and b!573588 res!362829) b!573596))

(declare-fun m!552569 () Bool)

(assert (=> b!573595 m!552569))

(declare-fun m!552571 () Bool)

(assert (=> b!573599 m!552571))

(declare-fun m!552573 () Bool)

(assert (=> b!573597 m!552573))

(declare-fun m!552575 () Bool)

(assert (=> start!52540 m!552575))

(declare-fun m!552577 () Bool)

(assert (=> start!52540 m!552577))

(declare-fun m!552579 () Bool)

(assert (=> b!573587 m!552579))

(declare-fun m!552581 () Bool)

(assert (=> b!573587 m!552581))

(declare-fun m!552583 () Bool)

(assert (=> b!573587 m!552583))

(declare-fun m!552585 () Bool)

(assert (=> b!573587 m!552585))

(assert (=> b!573587 m!552579))

(declare-fun m!552587 () Bool)

(assert (=> b!573587 m!552587))

(declare-fun m!552589 () Bool)

(assert (=> b!573589 m!552589))

(assert (=> b!573598 m!552579))

(declare-fun m!552591 () Bool)

(assert (=> b!573598 m!552591))

(assert (=> b!573598 m!552579))

(declare-fun m!552593 () Bool)

(assert (=> b!573598 m!552593))

(declare-fun m!552595 () Bool)

(assert (=> b!573598 m!552595))

(declare-fun m!552597 () Bool)

(assert (=> b!573598 m!552597))

(declare-fun m!552599 () Bool)

(assert (=> b!573598 m!552599))

(declare-fun m!552601 () Bool)

(assert (=> b!573598 m!552601))

(assert (=> b!573598 m!552579))

(assert (=> b!573588 m!552579))

(assert (=> b!573588 m!552579))

(declare-fun m!552603 () Bool)

(assert (=> b!573588 m!552603))

(assert (=> b!573593 m!552579))

(assert (=> b!573593 m!552585))

(assert (=> b!573590 m!552579))

(assert (=> b!573590 m!552579))

(declare-fun m!552605 () Bool)

(assert (=> b!573590 m!552605))

(declare-fun m!552607 () Bool)

(assert (=> b!573594 m!552607))

(declare-fun m!552609 () Bool)

(assert (=> b!573596 m!552609))

(declare-fun m!552611 () Bool)

(assert (=> b!573596 m!552611))

(check-sat (not b!573598) (not b!573589) (not b!573596) (not b!573590) (not start!52540) (not b!573594) (not b!573595) (not b!573597) (not b!573588) (not b!573587) (not b!573599))
(check-sat)
(get-model)

(declare-fun b!573651 () Bool)

(declare-fun c!65748 () Bool)

(declare-fun lt!261971 () (_ BitVec 64))

(assert (=> b!573651 (= c!65748 (= lt!261971 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330017 () SeekEntryResult!5673)

(declare-fun e!330016 () SeekEntryResult!5673)

(assert (=> b!573651 (= e!330017 e!330016)))

(declare-fun b!573652 () Bool)

(declare-fun lt!261973 () SeekEntryResult!5673)

(assert (=> b!573652 (= e!330016 (seekKeyOrZeroReturnVacant!0 (x!53791 lt!261973) (index!24921 lt!261973) (index!24921 lt!261973) k0!1914 a!3118 mask!3119))))

(declare-fun b!573653 () Bool)

(declare-fun e!330018 () SeekEntryResult!5673)

(assert (=> b!573653 (= e!330018 e!330017)))

(assert (=> b!573653 (= lt!261971 (select (arr!17224 a!3118) (index!24921 lt!261973)))))

(declare-fun c!65750 () Bool)

(assert (=> b!573653 (= c!65750 (= lt!261971 k0!1914))))

(declare-fun b!573654 () Bool)

(assert (=> b!573654 (= e!330016 (MissingZero!5673 (index!24921 lt!261973)))))

(declare-fun d!84959 () Bool)

(declare-fun lt!261972 () SeekEntryResult!5673)

(assert (=> d!84959 (and (or ((_ is Undefined!5673) lt!261972) (not ((_ is Found!5673) lt!261972)) (and (bvsge (index!24920 lt!261972) #b00000000000000000000000000000000) (bvslt (index!24920 lt!261972) (size!17588 a!3118)))) (or ((_ is Undefined!5673) lt!261972) ((_ is Found!5673) lt!261972) (not ((_ is MissingZero!5673) lt!261972)) (and (bvsge (index!24919 lt!261972) #b00000000000000000000000000000000) (bvslt (index!24919 lt!261972) (size!17588 a!3118)))) (or ((_ is Undefined!5673) lt!261972) ((_ is Found!5673) lt!261972) ((_ is MissingZero!5673) lt!261972) (not ((_ is MissingVacant!5673) lt!261972)) (and (bvsge (index!24922 lt!261972) #b00000000000000000000000000000000) (bvslt (index!24922 lt!261972) (size!17588 a!3118)))) (or ((_ is Undefined!5673) lt!261972) (ite ((_ is Found!5673) lt!261972) (= (select (arr!17224 a!3118) (index!24920 lt!261972)) k0!1914) (ite ((_ is MissingZero!5673) lt!261972) (= (select (arr!17224 a!3118) (index!24919 lt!261972)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5673) lt!261972) (= (select (arr!17224 a!3118) (index!24922 lt!261972)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84959 (= lt!261972 e!330018)))

(declare-fun c!65749 () Bool)

(assert (=> d!84959 (= c!65749 (and ((_ is Intermediate!5673) lt!261973) (undefined!6485 lt!261973)))))

(assert (=> d!84959 (= lt!261973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84959 (validMask!0 mask!3119)))

(assert (=> d!84959 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!261972)))

(declare-fun b!573655 () Bool)

(assert (=> b!573655 (= e!330018 Undefined!5673)))

(declare-fun b!573656 () Bool)

(assert (=> b!573656 (= e!330017 (Found!5673 (index!24921 lt!261973)))))

(assert (= (and d!84959 c!65749) b!573655))

(assert (= (and d!84959 (not c!65749)) b!573653))

(assert (= (and b!573653 c!65750) b!573656))

(assert (= (and b!573653 (not c!65750)) b!573651))

(assert (= (and b!573651 c!65748) b!573654))

(assert (= (and b!573651 (not c!65748)) b!573652))

(declare-fun m!552657 () Bool)

(assert (=> b!573652 m!552657))

(declare-fun m!552659 () Bool)

(assert (=> b!573653 m!552659))

(declare-fun m!552661 () Bool)

(assert (=> d!84959 m!552661))

(declare-fun m!552663 () Bool)

(assert (=> d!84959 m!552663))

(declare-fun m!552665 () Bool)

(assert (=> d!84959 m!552665))

(declare-fun m!552667 () Bool)

(assert (=> d!84959 m!552667))

(assert (=> d!84959 m!552575))

(assert (=> d!84959 m!552661))

(declare-fun m!552669 () Bool)

(assert (=> d!84959 m!552669))

(assert (=> b!573595 d!84959))

(declare-fun b!573668 () Bool)

(declare-fun e!330029 () Bool)

(declare-fun e!330030 () Bool)

(assert (=> b!573668 (= e!330029 e!330030)))

(declare-fun res!362880 () Bool)

(assert (=> b!573668 (=> (not res!362880) (not e!330030))))

(declare-fun e!330028 () Bool)

(assert (=> b!573668 (= res!362880 (not e!330028))))

(declare-fun res!362881 () Bool)

(assert (=> b!573668 (=> (not res!362881) (not e!330028))))

(assert (=> b!573668 (= res!362881 (validKeyInArray!0 (select (arr!17224 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573669 () Bool)

(declare-fun e!330027 () Bool)

(declare-fun call!32648 () Bool)

(assert (=> b!573669 (= e!330027 call!32648)))

(declare-fun bm!32645 () Bool)

(declare-fun c!65753 () Bool)

(assert (=> bm!32645 (= call!32648 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65753 (Cons!11300 (select (arr!17224 a!3118) #b00000000000000000000000000000000) Nil!11301) Nil!11301)))))

(declare-fun b!573670 () Bool)

(assert (=> b!573670 (= e!330030 e!330027)))

(assert (=> b!573670 (= c!65753 (validKeyInArray!0 (select (arr!17224 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573671 () Bool)

(assert (=> b!573671 (= e!330027 call!32648)))

(declare-fun d!84961 () Bool)

(declare-fun res!362882 () Bool)

(assert (=> d!84961 (=> res!362882 e!330029)))

(assert (=> d!84961 (= res!362882 (bvsge #b00000000000000000000000000000000 (size!17588 a!3118)))))

(assert (=> d!84961 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11301) e!330029)))

(declare-fun b!573667 () Bool)

(declare-fun contains!2886 (List!11304 (_ BitVec 64)) Bool)

(assert (=> b!573667 (= e!330028 (contains!2886 Nil!11301 (select (arr!17224 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84961 (not res!362882)) b!573668))

(assert (= (and b!573668 res!362881) b!573667))

(assert (= (and b!573668 res!362880) b!573670))

(assert (= (and b!573670 c!65753) b!573669))

(assert (= (and b!573670 (not c!65753)) b!573671))

(assert (= (or b!573669 b!573671) bm!32645))

(declare-fun m!552671 () Bool)

(assert (=> b!573668 m!552671))

(assert (=> b!573668 m!552671))

(declare-fun m!552673 () Bool)

(assert (=> b!573668 m!552673))

(assert (=> bm!32645 m!552671))

(declare-fun m!552675 () Bool)

(assert (=> bm!32645 m!552675))

(assert (=> b!573670 m!552671))

(assert (=> b!573670 m!552671))

(assert (=> b!573670 m!552673))

(assert (=> b!573667 m!552671))

(assert (=> b!573667 m!552671))

(declare-fun m!552677 () Bool)

(assert (=> b!573667 m!552677))

(assert (=> b!573589 d!84961))

(declare-fun d!84963 () Bool)

(declare-fun res!362887 () Bool)

(declare-fun e!330035 () Bool)

(assert (=> d!84963 (=> res!362887 e!330035)))

(assert (=> d!84963 (= res!362887 (= (select (arr!17224 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84963 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!330035)))

(declare-fun b!573676 () Bool)

(declare-fun e!330036 () Bool)

(assert (=> b!573676 (= e!330035 e!330036)))

(declare-fun res!362888 () Bool)

(assert (=> b!573676 (=> (not res!362888) (not e!330036))))

(assert (=> b!573676 (= res!362888 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17588 a!3118)))))

(declare-fun b!573677 () Bool)

(assert (=> b!573677 (= e!330036 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84963 (not res!362887)) b!573676))

(assert (= (and b!573676 res!362888) b!573677))

(assert (=> d!84963 m!552671))

(declare-fun m!552679 () Bool)

(assert (=> b!573677 m!552679))

(assert (=> b!573594 d!84963))

(declare-fun b!573678 () Bool)

(declare-fun c!65754 () Bool)

(declare-fun lt!261974 () (_ BitVec 64))

(assert (=> b!573678 (= c!65754 (= lt!261974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330038 () SeekEntryResult!5673)

(declare-fun e!330037 () SeekEntryResult!5673)

(assert (=> b!573678 (= e!330038 e!330037)))

(declare-fun lt!261976 () SeekEntryResult!5673)

(declare-fun b!573679 () Bool)

(assert (=> b!573679 (= e!330037 (seekKeyOrZeroReturnVacant!0 (x!53791 lt!261976) (index!24921 lt!261976) (index!24921 lt!261976) lt!261933 lt!261930 mask!3119))))

(declare-fun b!573680 () Bool)

(declare-fun e!330039 () SeekEntryResult!5673)

(assert (=> b!573680 (= e!330039 e!330038)))

(assert (=> b!573680 (= lt!261974 (select (arr!17224 lt!261930) (index!24921 lt!261976)))))

(declare-fun c!65756 () Bool)

(assert (=> b!573680 (= c!65756 (= lt!261974 lt!261933))))

(declare-fun b!573681 () Bool)

(assert (=> b!573681 (= e!330037 (MissingZero!5673 (index!24921 lt!261976)))))

(declare-fun d!84967 () Bool)

(declare-fun lt!261975 () SeekEntryResult!5673)

(assert (=> d!84967 (and (or ((_ is Undefined!5673) lt!261975) (not ((_ is Found!5673) lt!261975)) (and (bvsge (index!24920 lt!261975) #b00000000000000000000000000000000) (bvslt (index!24920 lt!261975) (size!17588 lt!261930)))) (or ((_ is Undefined!5673) lt!261975) ((_ is Found!5673) lt!261975) (not ((_ is MissingZero!5673) lt!261975)) (and (bvsge (index!24919 lt!261975) #b00000000000000000000000000000000) (bvslt (index!24919 lt!261975) (size!17588 lt!261930)))) (or ((_ is Undefined!5673) lt!261975) ((_ is Found!5673) lt!261975) ((_ is MissingZero!5673) lt!261975) (not ((_ is MissingVacant!5673) lt!261975)) (and (bvsge (index!24922 lt!261975) #b00000000000000000000000000000000) (bvslt (index!24922 lt!261975) (size!17588 lt!261930)))) (or ((_ is Undefined!5673) lt!261975) (ite ((_ is Found!5673) lt!261975) (= (select (arr!17224 lt!261930) (index!24920 lt!261975)) lt!261933) (ite ((_ is MissingZero!5673) lt!261975) (= (select (arr!17224 lt!261930) (index!24919 lt!261975)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5673) lt!261975) (= (select (arr!17224 lt!261930) (index!24922 lt!261975)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84967 (= lt!261975 e!330039)))

(declare-fun c!65755 () Bool)

(assert (=> d!84967 (= c!65755 (and ((_ is Intermediate!5673) lt!261976) (undefined!6485 lt!261976)))))

(assert (=> d!84967 (= lt!261976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!261933 mask!3119) lt!261933 lt!261930 mask!3119))))

(assert (=> d!84967 (validMask!0 mask!3119)))

(assert (=> d!84967 (= (seekEntryOrOpen!0 lt!261933 lt!261930 mask!3119) lt!261975)))

(declare-fun b!573682 () Bool)

(assert (=> b!573682 (= e!330039 Undefined!5673)))

(declare-fun b!573683 () Bool)

(assert (=> b!573683 (= e!330038 (Found!5673 (index!24921 lt!261976)))))

(assert (= (and d!84967 c!65755) b!573682))

(assert (= (and d!84967 (not c!65755)) b!573680))

(assert (= (and b!573680 c!65756) b!573683))

(assert (= (and b!573680 (not c!65756)) b!573678))

(assert (= (and b!573678 c!65754) b!573681))

(assert (= (and b!573678 (not c!65754)) b!573679))

(declare-fun m!552681 () Bool)

(assert (=> b!573679 m!552681))

(declare-fun m!552683 () Bool)

(assert (=> b!573680 m!552683))

(assert (=> d!84967 m!552597))

(declare-fun m!552685 () Bool)

(assert (=> d!84967 m!552685))

(declare-fun m!552687 () Bool)

(assert (=> d!84967 m!552687))

(declare-fun m!552689 () Bool)

(assert (=> d!84967 m!552689))

(assert (=> d!84967 m!552575))

(assert (=> d!84967 m!552597))

(declare-fun m!552691 () Bool)

(assert (=> d!84967 m!552691))

(assert (=> b!573596 d!84967))

(declare-fun b!573714 () Bool)

(declare-fun e!330062 () SeekEntryResult!5673)

(assert (=> b!573714 (= e!330062 (Found!5673 (index!24921 lt!261931)))))

(declare-fun b!573715 () Bool)

(declare-fun c!65768 () Bool)

(declare-fun lt!261990 () (_ BitVec 64))

(assert (=> b!573715 (= c!65768 (= lt!261990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330061 () SeekEntryResult!5673)

(assert (=> b!573715 (= e!330062 e!330061)))

(declare-fun b!573716 () Bool)

(declare-fun e!330063 () SeekEntryResult!5673)

(assert (=> b!573716 (= e!330063 e!330062)))

(declare-fun c!65767 () Bool)

(assert (=> b!573716 (= c!65767 (= lt!261990 lt!261933))))

(declare-fun b!573717 () Bool)

(assert (=> b!573717 (= e!330063 Undefined!5673)))

(declare-fun lt!261991 () SeekEntryResult!5673)

(declare-fun d!84969 () Bool)

(assert (=> d!84969 (and (or ((_ is Undefined!5673) lt!261991) (not ((_ is Found!5673) lt!261991)) (and (bvsge (index!24920 lt!261991) #b00000000000000000000000000000000) (bvslt (index!24920 lt!261991) (size!17588 lt!261930)))) (or ((_ is Undefined!5673) lt!261991) ((_ is Found!5673) lt!261991) (not ((_ is MissingVacant!5673) lt!261991)) (not (= (index!24922 lt!261991) (index!24921 lt!261931))) (and (bvsge (index!24922 lt!261991) #b00000000000000000000000000000000) (bvslt (index!24922 lt!261991) (size!17588 lt!261930)))) (or ((_ is Undefined!5673) lt!261991) (ite ((_ is Found!5673) lt!261991) (= (select (arr!17224 lt!261930) (index!24920 lt!261991)) lt!261933) (and ((_ is MissingVacant!5673) lt!261991) (= (index!24922 lt!261991) (index!24921 lt!261931)) (= (select (arr!17224 lt!261930) (index!24922 lt!261991)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84969 (= lt!261991 e!330063)))

(declare-fun c!65766 () Bool)

(assert (=> d!84969 (= c!65766 (bvsge (x!53791 lt!261931) #b01111111111111111111111111111110))))

(assert (=> d!84969 (= lt!261990 (select (arr!17224 lt!261930) (index!24921 lt!261931)))))

(assert (=> d!84969 (validMask!0 mask!3119)))

(assert (=> d!84969 (= (seekKeyOrZeroReturnVacant!0 (x!53791 lt!261931) (index!24921 lt!261931) (index!24921 lt!261931) lt!261933 lt!261930 mask!3119) lt!261991)))

(declare-fun b!573718 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573718 (= e!330061 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53791 lt!261931) #b00000000000000000000000000000001) (nextIndex!0 (index!24921 lt!261931) (x!53791 lt!261931) mask!3119) (index!24921 lt!261931) lt!261933 lt!261930 mask!3119))))

(declare-fun b!573719 () Bool)

(assert (=> b!573719 (= e!330061 (MissingVacant!5673 (index!24921 lt!261931)))))

(assert (= (and d!84969 c!65766) b!573717))

(assert (= (and d!84969 (not c!65766)) b!573716))

(assert (= (and b!573716 c!65767) b!573714))

(assert (= (and b!573716 (not c!65767)) b!573715))

(assert (= (and b!573715 c!65768) b!573719))

(assert (= (and b!573715 (not c!65768)) b!573718))

(declare-fun m!552707 () Bool)

(assert (=> d!84969 m!552707))

(declare-fun m!552709 () Bool)

(assert (=> d!84969 m!552709))

(declare-fun m!552711 () Bool)

(assert (=> d!84969 m!552711))

(assert (=> d!84969 m!552575))

(declare-fun m!552713 () Bool)

(assert (=> b!573718 m!552713))

(assert (=> b!573718 m!552713))

(declare-fun m!552715 () Bool)

(assert (=> b!573718 m!552715))

(assert (=> b!573596 d!84969))

(declare-fun d!84981 () Bool)

(assert (=> d!84981 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52540 d!84981))

(declare-fun d!84985 () Bool)

(assert (=> d!84985 (= (array_inv!13020 a!3118) (bvsge (size!17588 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52540 d!84985))

(declare-fun d!84987 () Bool)

(assert (=> d!84987 (= (validKeyInArray!0 (select (arr!17224 a!3118) j!142)) (and (not (= (select (arr!17224 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17224 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573590 d!84987))

(declare-fun b!573744 () Bool)

(declare-fun c!65778 () Bool)

(declare-fun lt!262007 () (_ BitVec 64))

(assert (=> b!573744 (= c!65778 (= lt!262007 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330080 () SeekEntryResult!5673)

(declare-fun e!330079 () SeekEntryResult!5673)

(assert (=> b!573744 (= e!330080 e!330079)))

(declare-fun b!573745 () Bool)

(declare-fun lt!262009 () SeekEntryResult!5673)

(assert (=> b!573745 (= e!330079 (seekKeyOrZeroReturnVacant!0 (x!53791 lt!262009) (index!24921 lt!262009) (index!24921 lt!262009) (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573746 () Bool)

(declare-fun e!330081 () SeekEntryResult!5673)

(assert (=> b!573746 (= e!330081 e!330080)))

(assert (=> b!573746 (= lt!262007 (select (arr!17224 a!3118) (index!24921 lt!262009)))))

(declare-fun c!65780 () Bool)

(assert (=> b!573746 (= c!65780 (= lt!262007 (select (arr!17224 a!3118) j!142)))))

(declare-fun b!573747 () Bool)

(assert (=> b!573747 (= e!330079 (MissingZero!5673 (index!24921 lt!262009)))))

(declare-fun d!84989 () Bool)

(declare-fun lt!262008 () SeekEntryResult!5673)

(assert (=> d!84989 (and (or ((_ is Undefined!5673) lt!262008) (not ((_ is Found!5673) lt!262008)) (and (bvsge (index!24920 lt!262008) #b00000000000000000000000000000000) (bvslt (index!24920 lt!262008) (size!17588 a!3118)))) (or ((_ is Undefined!5673) lt!262008) ((_ is Found!5673) lt!262008) (not ((_ is MissingZero!5673) lt!262008)) (and (bvsge (index!24919 lt!262008) #b00000000000000000000000000000000) (bvslt (index!24919 lt!262008) (size!17588 a!3118)))) (or ((_ is Undefined!5673) lt!262008) ((_ is Found!5673) lt!262008) ((_ is MissingZero!5673) lt!262008) (not ((_ is MissingVacant!5673) lt!262008)) (and (bvsge (index!24922 lt!262008) #b00000000000000000000000000000000) (bvslt (index!24922 lt!262008) (size!17588 a!3118)))) (or ((_ is Undefined!5673) lt!262008) (ite ((_ is Found!5673) lt!262008) (= (select (arr!17224 a!3118) (index!24920 lt!262008)) (select (arr!17224 a!3118) j!142)) (ite ((_ is MissingZero!5673) lt!262008) (= (select (arr!17224 a!3118) (index!24919 lt!262008)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5673) lt!262008) (= (select (arr!17224 a!3118) (index!24922 lt!262008)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84989 (= lt!262008 e!330081)))

(declare-fun c!65779 () Bool)

(assert (=> d!84989 (= c!65779 (and ((_ is Intermediate!5673) lt!262009) (undefined!6485 lt!262009)))))

(assert (=> d!84989 (= lt!262009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17224 a!3118) j!142) mask!3119) (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84989 (validMask!0 mask!3119)))

(assert (=> d!84989 (= (seekEntryOrOpen!0 (select (arr!17224 a!3118) j!142) a!3118 mask!3119) lt!262008)))

(declare-fun b!573748 () Bool)

(assert (=> b!573748 (= e!330081 Undefined!5673)))

(declare-fun b!573749 () Bool)

(assert (=> b!573749 (= e!330080 (Found!5673 (index!24921 lt!262009)))))

(assert (= (and d!84989 c!65779) b!573748))

(assert (= (and d!84989 (not c!65779)) b!573746))

(assert (= (and b!573746 c!65780) b!573749))

(assert (= (and b!573746 (not c!65780)) b!573744))

(assert (= (and b!573744 c!65778) b!573747))

(assert (= (and b!573744 (not c!65778)) b!573745))

(assert (=> b!573745 m!552579))

(declare-fun m!552729 () Bool)

(assert (=> b!573745 m!552729))

(declare-fun m!552731 () Bool)

(assert (=> b!573746 m!552731))

(assert (=> d!84989 m!552579))

(assert (=> d!84989 m!552591))

(declare-fun m!552733 () Bool)

(assert (=> d!84989 m!552733))

(declare-fun m!552735 () Bool)

(assert (=> d!84989 m!552735))

(declare-fun m!552737 () Bool)

(assert (=> d!84989 m!552737))

(assert (=> d!84989 m!552575))

(assert (=> d!84989 m!552591))

(assert (=> d!84989 m!552579))

(declare-fun m!552739 () Bool)

(assert (=> d!84989 m!552739))

(assert (=> b!573587 d!84989))

(declare-fun call!32657 () Bool)

(declare-fun bm!32654 () Bool)

(assert (=> bm!32654 (= call!32657 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573782 () Bool)

(declare-fun e!330101 () Bool)

(assert (=> b!573782 (= e!330101 call!32657)))

(declare-fun b!573783 () Bool)

(declare-fun e!330102 () Bool)

(assert (=> b!573783 (= e!330102 e!330101)))

(declare-fun c!65795 () Bool)

(assert (=> b!573783 (= c!65795 (validKeyInArray!0 (select (arr!17224 a!3118) j!142)))))

(declare-fun d!84991 () Bool)

(declare-fun res!362911 () Bool)

(assert (=> d!84991 (=> res!362911 e!330102)))

(assert (=> d!84991 (= res!362911 (bvsge j!142 (size!17588 a!3118)))))

(assert (=> d!84991 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330102)))

(declare-fun b!573784 () Bool)

(declare-fun e!330100 () Bool)

(assert (=> b!573784 (= e!330100 call!32657)))

(declare-fun b!573785 () Bool)

(assert (=> b!573785 (= e!330101 e!330100)))

(declare-fun lt!262026 () (_ BitVec 64))

(assert (=> b!573785 (= lt!262026 (select (arr!17224 a!3118) j!142))))

(declare-fun lt!262027 () Unit!18048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35874 (_ BitVec 64) (_ BitVec 32)) Unit!18048)

(assert (=> b!573785 (= lt!262027 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262026 j!142))))

(assert (=> b!573785 (arrayContainsKey!0 a!3118 lt!262026 #b00000000000000000000000000000000)))

(declare-fun lt!262025 () Unit!18048)

(assert (=> b!573785 (= lt!262025 lt!262027)))

(declare-fun res!362912 () Bool)

(assert (=> b!573785 (= res!362912 (= (seekEntryOrOpen!0 (select (arr!17224 a!3118) j!142) a!3118 mask!3119) (Found!5673 j!142)))))

(assert (=> b!573785 (=> (not res!362912) (not e!330100))))

(assert (= (and d!84991 (not res!362911)) b!573783))

(assert (= (and b!573783 c!65795) b!573785))

(assert (= (and b!573783 (not c!65795)) b!573782))

(assert (= (and b!573785 res!362912) b!573784))

(assert (= (or b!573784 b!573782) bm!32654))

(declare-fun m!552763 () Bool)

(assert (=> bm!32654 m!552763))

(assert (=> b!573783 m!552579))

(assert (=> b!573783 m!552579))

(assert (=> b!573783 m!552605))

(assert (=> b!573785 m!552579))

(declare-fun m!552765 () Bool)

(assert (=> b!573785 m!552765))

(declare-fun m!552767 () Bool)

(assert (=> b!573785 m!552767))

(assert (=> b!573785 m!552579))

(assert (=> b!573785 m!552587))

(assert (=> b!573587 d!84991))

(declare-fun d!84997 () Bool)

(assert (=> d!84997 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262034 () Unit!18048)

(declare-fun choose!38 (array!35874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18048)

(assert (=> d!84997 (= lt!262034 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84997 (validMask!0 mask!3119)))

(assert (=> d!84997 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262034)))

(declare-fun bs!17761 () Bool)

(assert (= bs!17761 d!84997))

(assert (=> bs!17761 m!552581))

(declare-fun m!552769 () Bool)

(assert (=> bs!17761 m!552769))

(assert (=> bs!17761 m!552575))

(assert (=> b!573587 d!84997))

(declare-fun d!84999 () Bool)

(assert (=> d!84999 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573597 d!84999))

(declare-fun bm!32655 () Bool)

(declare-fun call!32658 () Bool)

(assert (=> bm!32655 (= call!32658 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573798 () Bool)

(declare-fun e!330110 () Bool)

(assert (=> b!573798 (= e!330110 call!32658)))

(declare-fun b!573799 () Bool)

(declare-fun e!330111 () Bool)

(assert (=> b!573799 (= e!330111 e!330110)))

(declare-fun c!65802 () Bool)

(assert (=> b!573799 (= c!65802 (validKeyInArray!0 (select (arr!17224 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85001 () Bool)

(declare-fun res!362913 () Bool)

(assert (=> d!85001 (=> res!362913 e!330111)))

(assert (=> d!85001 (= res!362913 (bvsge #b00000000000000000000000000000000 (size!17588 a!3118)))))

(assert (=> d!85001 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330111)))

(declare-fun b!573800 () Bool)

(declare-fun e!330109 () Bool)

(assert (=> b!573800 (= e!330109 call!32658)))

(declare-fun b!573801 () Bool)

(assert (=> b!573801 (= e!330110 e!330109)))

(declare-fun lt!262036 () (_ BitVec 64))

(assert (=> b!573801 (= lt!262036 (select (arr!17224 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262037 () Unit!18048)

(assert (=> b!573801 (= lt!262037 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262036 #b00000000000000000000000000000000))))

(assert (=> b!573801 (arrayContainsKey!0 a!3118 lt!262036 #b00000000000000000000000000000000)))

(declare-fun lt!262035 () Unit!18048)

(assert (=> b!573801 (= lt!262035 lt!262037)))

(declare-fun res!362914 () Bool)

(assert (=> b!573801 (= res!362914 (= (seekEntryOrOpen!0 (select (arr!17224 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5673 #b00000000000000000000000000000000)))))

(assert (=> b!573801 (=> (not res!362914) (not e!330109))))

(assert (= (and d!85001 (not res!362913)) b!573799))

(assert (= (and b!573799 c!65802) b!573801))

(assert (= (and b!573799 (not c!65802)) b!573798))

(assert (= (and b!573801 res!362914) b!573800))

(assert (= (or b!573800 b!573798) bm!32655))

(declare-fun m!552771 () Bool)

(assert (=> bm!32655 m!552771))

(assert (=> b!573799 m!552671))

(assert (=> b!573799 m!552671))

(assert (=> b!573799 m!552673))

(assert (=> b!573801 m!552671))

(declare-fun m!552773 () Bool)

(assert (=> b!573801 m!552773))

(declare-fun m!552775 () Bool)

(assert (=> b!573801 m!552775))

(assert (=> b!573801 m!552671))

(declare-fun m!552777 () Bool)

(assert (=> b!573801 m!552777))

(assert (=> b!573599 d!85001))

(declare-fun b!573802 () Bool)

(declare-fun e!330113 () SeekEntryResult!5673)

(assert (=> b!573802 (= e!330113 (Found!5673 (index!24921 lt!261931)))))

(declare-fun b!573803 () Bool)

(declare-fun c!65805 () Bool)

(declare-fun lt!262038 () (_ BitVec 64))

(assert (=> b!573803 (= c!65805 (= lt!262038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330112 () SeekEntryResult!5673)

(assert (=> b!573803 (= e!330113 e!330112)))

(declare-fun b!573804 () Bool)

(declare-fun e!330114 () SeekEntryResult!5673)

(assert (=> b!573804 (= e!330114 e!330113)))

(declare-fun c!65804 () Bool)

(assert (=> b!573804 (= c!65804 (= lt!262038 (select (arr!17224 a!3118) j!142)))))

(declare-fun b!573805 () Bool)

(assert (=> b!573805 (= e!330114 Undefined!5673)))

(declare-fun d!85003 () Bool)

(declare-fun lt!262039 () SeekEntryResult!5673)

(assert (=> d!85003 (and (or ((_ is Undefined!5673) lt!262039) (not ((_ is Found!5673) lt!262039)) (and (bvsge (index!24920 lt!262039) #b00000000000000000000000000000000) (bvslt (index!24920 lt!262039) (size!17588 a!3118)))) (or ((_ is Undefined!5673) lt!262039) ((_ is Found!5673) lt!262039) (not ((_ is MissingVacant!5673) lt!262039)) (not (= (index!24922 lt!262039) (index!24921 lt!261931))) (and (bvsge (index!24922 lt!262039) #b00000000000000000000000000000000) (bvslt (index!24922 lt!262039) (size!17588 a!3118)))) (or ((_ is Undefined!5673) lt!262039) (ite ((_ is Found!5673) lt!262039) (= (select (arr!17224 a!3118) (index!24920 lt!262039)) (select (arr!17224 a!3118) j!142)) (and ((_ is MissingVacant!5673) lt!262039) (= (index!24922 lt!262039) (index!24921 lt!261931)) (= (select (arr!17224 a!3118) (index!24922 lt!262039)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85003 (= lt!262039 e!330114)))

(declare-fun c!65803 () Bool)

(assert (=> d!85003 (= c!65803 (bvsge (x!53791 lt!261931) #b01111111111111111111111111111110))))

(assert (=> d!85003 (= lt!262038 (select (arr!17224 a!3118) (index!24921 lt!261931)))))

(assert (=> d!85003 (validMask!0 mask!3119)))

(assert (=> d!85003 (= (seekKeyOrZeroReturnVacant!0 (x!53791 lt!261931) (index!24921 lt!261931) (index!24921 lt!261931) (select (arr!17224 a!3118) j!142) a!3118 mask!3119) lt!262039)))

(declare-fun b!573806 () Bool)

(assert (=> b!573806 (= e!330112 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53791 lt!261931) #b00000000000000000000000000000001) (nextIndex!0 (index!24921 lt!261931) (x!53791 lt!261931) mask!3119) (index!24921 lt!261931) (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573807 () Bool)

(assert (=> b!573807 (= e!330112 (MissingVacant!5673 (index!24921 lt!261931)))))

(assert (= (and d!85003 c!65803) b!573805))

(assert (= (and d!85003 (not c!65803)) b!573804))

(assert (= (and b!573804 c!65804) b!573802))

(assert (= (and b!573804 (not c!65804)) b!573803))

(assert (= (and b!573803 c!65805) b!573807))

(assert (= (and b!573803 (not c!65805)) b!573806))

(declare-fun m!552779 () Bool)

(assert (=> d!85003 m!552779))

(declare-fun m!552781 () Bool)

(assert (=> d!85003 m!552781))

(assert (=> d!85003 m!552585))

(assert (=> d!85003 m!552575))

(assert (=> b!573806 m!552713))

(assert (=> b!573806 m!552713))

(assert (=> b!573806 m!552579))

(declare-fun m!552783 () Bool)

(assert (=> b!573806 m!552783))

(assert (=> b!573588 d!85003))

(declare-fun b!573866 () Bool)

(declare-fun e!330149 () SeekEntryResult!5673)

(assert (=> b!573866 (= e!330149 (Intermediate!5673 true lt!261932 #b00000000000000000000000000000000))))

(declare-fun b!573867 () Bool)

(declare-fun e!330148 () SeekEntryResult!5673)

(assert (=> b!573867 (= e!330148 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261932 #b00000000000000000000000000000000 mask!3119) lt!261933 lt!261930 mask!3119))))

(declare-fun b!573868 () Bool)

(declare-fun lt!262057 () SeekEntryResult!5673)

(assert (=> b!573868 (and (bvsge (index!24921 lt!262057) #b00000000000000000000000000000000) (bvslt (index!24921 lt!262057) (size!17588 lt!261930)))))

(declare-fun res!362928 () Bool)

(assert (=> b!573868 (= res!362928 (= (select (arr!17224 lt!261930) (index!24921 lt!262057)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330151 () Bool)

(assert (=> b!573868 (=> res!362928 e!330151)))

(declare-fun b!573869 () Bool)

(assert (=> b!573869 (= e!330148 (Intermediate!5673 false lt!261932 #b00000000000000000000000000000000))))

(declare-fun d!85005 () Bool)

(declare-fun e!330150 () Bool)

(assert (=> d!85005 e!330150))

(declare-fun c!65831 () Bool)

(assert (=> d!85005 (= c!65831 (and ((_ is Intermediate!5673) lt!262057) (undefined!6485 lt!262057)))))

(assert (=> d!85005 (= lt!262057 e!330149)))

(declare-fun c!65830 () Bool)

(assert (=> d!85005 (= c!65830 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262058 () (_ BitVec 64))

(assert (=> d!85005 (= lt!262058 (select (arr!17224 lt!261930) lt!261932))))

(assert (=> d!85005 (validMask!0 mask!3119)))

(assert (=> d!85005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261932 lt!261933 lt!261930 mask!3119) lt!262057)))

(declare-fun b!573870 () Bool)

(assert (=> b!573870 (= e!330150 (bvsge (x!53791 lt!262057) #b01111111111111111111111111111110))))

(declare-fun b!573871 () Bool)

(assert (=> b!573871 (and (bvsge (index!24921 lt!262057) #b00000000000000000000000000000000) (bvslt (index!24921 lt!262057) (size!17588 lt!261930)))))

(declare-fun res!362929 () Bool)

(assert (=> b!573871 (= res!362929 (= (select (arr!17224 lt!261930) (index!24921 lt!262057)) lt!261933))))

(assert (=> b!573871 (=> res!362929 e!330151)))

(declare-fun e!330152 () Bool)

(assert (=> b!573871 (= e!330152 e!330151)))

(declare-fun b!573872 () Bool)

(assert (=> b!573872 (and (bvsge (index!24921 lt!262057) #b00000000000000000000000000000000) (bvslt (index!24921 lt!262057) (size!17588 lt!261930)))))

(assert (=> b!573872 (= e!330151 (= (select (arr!17224 lt!261930) (index!24921 lt!262057)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573873 () Bool)

(assert (=> b!573873 (= e!330150 e!330152)))

(declare-fun res!362927 () Bool)

(assert (=> b!573873 (= res!362927 (and ((_ is Intermediate!5673) lt!262057) (not (undefined!6485 lt!262057)) (bvslt (x!53791 lt!262057) #b01111111111111111111111111111110) (bvsge (x!53791 lt!262057) #b00000000000000000000000000000000) (bvsge (x!53791 lt!262057) #b00000000000000000000000000000000)))))

(assert (=> b!573873 (=> (not res!362927) (not e!330152))))

(declare-fun b!573874 () Bool)

(assert (=> b!573874 (= e!330149 e!330148)))

(declare-fun c!65829 () Bool)

(assert (=> b!573874 (= c!65829 (or (= lt!262058 lt!261933) (= (bvadd lt!262058 lt!262058) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!85005 c!65830) b!573866))

(assert (= (and d!85005 (not c!65830)) b!573874))

(assert (= (and b!573874 c!65829) b!573869))

(assert (= (and b!573874 (not c!65829)) b!573867))

(assert (= (and d!85005 c!65831) b!573870))

(assert (= (and d!85005 (not c!65831)) b!573873))

(assert (= (and b!573873 res!362927) b!573871))

(assert (= (and b!573871 (not res!362929)) b!573868))

(assert (= (and b!573868 (not res!362928)) b!573872))

(declare-fun m!552817 () Bool)

(assert (=> b!573867 m!552817))

(assert (=> b!573867 m!552817))

(declare-fun m!552819 () Bool)

(assert (=> b!573867 m!552819))

(declare-fun m!552821 () Bool)

(assert (=> d!85005 m!552821))

(assert (=> d!85005 m!552575))

(declare-fun m!552823 () Bool)

(assert (=> b!573872 m!552823))

(assert (=> b!573868 m!552823))

(assert (=> b!573871 m!552823))

(assert (=> b!573598 d!85005))

(declare-fun b!573880 () Bool)

(declare-fun e!330158 () SeekEntryResult!5673)

(assert (=> b!573880 (= e!330158 (Intermediate!5673 true lt!261937 #b00000000000000000000000000000000))))

(declare-fun e!330157 () SeekEntryResult!5673)

(declare-fun b!573881 () Bool)

(assert (=> b!573881 (= e!330157 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261937 #b00000000000000000000000000000000 mask!3119) (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573882 () Bool)

(declare-fun lt!262059 () SeekEntryResult!5673)

(assert (=> b!573882 (and (bvsge (index!24921 lt!262059) #b00000000000000000000000000000000) (bvslt (index!24921 lt!262059) (size!17588 a!3118)))))

(declare-fun res!362934 () Bool)

(assert (=> b!573882 (= res!362934 (= (select (arr!17224 a!3118) (index!24921 lt!262059)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330160 () Bool)

(assert (=> b!573882 (=> res!362934 e!330160)))

(declare-fun b!573883 () Bool)

(assert (=> b!573883 (= e!330157 (Intermediate!5673 false lt!261937 #b00000000000000000000000000000000))))

(declare-fun d!85023 () Bool)

(declare-fun e!330159 () Bool)

(assert (=> d!85023 e!330159))

(declare-fun c!65835 () Bool)

(assert (=> d!85023 (= c!65835 (and ((_ is Intermediate!5673) lt!262059) (undefined!6485 lt!262059)))))

(assert (=> d!85023 (= lt!262059 e!330158)))

(declare-fun c!65834 () Bool)

(assert (=> d!85023 (= c!65834 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262060 () (_ BitVec 64))

(assert (=> d!85023 (= lt!262060 (select (arr!17224 a!3118) lt!261937))))

(assert (=> d!85023 (validMask!0 mask!3119)))

(assert (=> d!85023 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261937 (select (arr!17224 a!3118) j!142) a!3118 mask!3119) lt!262059)))

(declare-fun b!573884 () Bool)

(assert (=> b!573884 (= e!330159 (bvsge (x!53791 lt!262059) #b01111111111111111111111111111110))))

(declare-fun b!573885 () Bool)

(assert (=> b!573885 (and (bvsge (index!24921 lt!262059) #b00000000000000000000000000000000) (bvslt (index!24921 lt!262059) (size!17588 a!3118)))))

(declare-fun res!362935 () Bool)

(assert (=> b!573885 (= res!362935 (= (select (arr!17224 a!3118) (index!24921 lt!262059)) (select (arr!17224 a!3118) j!142)))))

(assert (=> b!573885 (=> res!362935 e!330160)))

(declare-fun e!330161 () Bool)

(assert (=> b!573885 (= e!330161 e!330160)))

(declare-fun b!573886 () Bool)

(assert (=> b!573886 (and (bvsge (index!24921 lt!262059) #b00000000000000000000000000000000) (bvslt (index!24921 lt!262059) (size!17588 a!3118)))))

(assert (=> b!573886 (= e!330160 (= (select (arr!17224 a!3118) (index!24921 lt!262059)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573887 () Bool)

(assert (=> b!573887 (= e!330159 e!330161)))

(declare-fun res!362933 () Bool)

(assert (=> b!573887 (= res!362933 (and ((_ is Intermediate!5673) lt!262059) (not (undefined!6485 lt!262059)) (bvslt (x!53791 lt!262059) #b01111111111111111111111111111110) (bvsge (x!53791 lt!262059) #b00000000000000000000000000000000) (bvsge (x!53791 lt!262059) #b00000000000000000000000000000000)))))

(assert (=> b!573887 (=> (not res!362933) (not e!330161))))

(declare-fun b!573888 () Bool)

(assert (=> b!573888 (= e!330158 e!330157)))

(declare-fun c!65833 () Bool)

(assert (=> b!573888 (= c!65833 (or (= lt!262060 (select (arr!17224 a!3118) j!142)) (= (bvadd lt!262060 lt!262060) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!85023 c!65834) b!573880))

(assert (= (and d!85023 (not c!65834)) b!573888))

(assert (= (and b!573888 c!65833) b!573883))

(assert (= (and b!573888 (not c!65833)) b!573881))

(assert (= (and d!85023 c!65835) b!573884))

(assert (= (and d!85023 (not c!65835)) b!573887))

(assert (= (and b!573887 res!362933) b!573885))

(assert (= (and b!573885 (not res!362935)) b!573882))

(assert (= (and b!573882 (not res!362934)) b!573886))

(declare-fun m!552825 () Bool)

(assert (=> b!573881 m!552825))

(assert (=> b!573881 m!552825))

(assert (=> b!573881 m!552579))

(declare-fun m!552827 () Bool)

(assert (=> b!573881 m!552827))

(declare-fun m!552829 () Bool)

(assert (=> d!85023 m!552829))

(assert (=> d!85023 m!552575))

(declare-fun m!552831 () Bool)

(assert (=> b!573886 m!552831))

(assert (=> b!573882 m!552831))

(assert (=> b!573885 m!552831))

(assert (=> b!573598 d!85023))

(declare-fun d!85025 () Bool)

(declare-fun lt!262066 () (_ BitVec 32))

(declare-fun lt!262065 () (_ BitVec 32))

(assert (=> d!85025 (= lt!262066 (bvmul (bvxor lt!262065 (bvlshr lt!262065 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85025 (= lt!262065 ((_ extract 31 0) (bvand (bvxor lt!261933 (bvlshr lt!261933 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85025 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362936 (let ((h!12332 ((_ extract 31 0) (bvand (bvxor lt!261933 (bvlshr lt!261933 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53797 (bvmul (bvxor h!12332 (bvlshr h!12332 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53797 (bvlshr x!53797 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362936 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362936 #b00000000000000000000000000000000))))))

(assert (=> d!85025 (= (toIndex!0 lt!261933 mask!3119) (bvand (bvxor lt!262066 (bvlshr lt!262066 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573598 d!85025))

(declare-fun d!85027 () Bool)

(declare-fun lt!262068 () (_ BitVec 32))

(declare-fun lt!262067 () (_ BitVec 32))

(assert (=> d!85027 (= lt!262068 (bvmul (bvxor lt!262067 (bvlshr lt!262067 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85027 (= lt!262067 ((_ extract 31 0) (bvand (bvxor (select (arr!17224 a!3118) j!142) (bvlshr (select (arr!17224 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85027 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362936 (let ((h!12332 ((_ extract 31 0) (bvand (bvxor (select (arr!17224 a!3118) j!142) (bvlshr (select (arr!17224 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53797 (bvmul (bvxor h!12332 (bvlshr h!12332 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53797 (bvlshr x!53797 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362936 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362936 #b00000000000000000000000000000000))))))

(assert (=> d!85027 (= (toIndex!0 (select (arr!17224 a!3118) j!142) mask!3119) (bvand (bvxor lt!262068 (bvlshr lt!262068 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573598 d!85027))

(check-sat (not b!573679) (not b!573745) (not b!573652) (not d!84997) (not b!573881) (not b!573718) (not b!573867) (not d!85005) (not b!573677) (not b!573806) (not b!573668) (not bm!32655) (not d!84967) (not b!573783) (not b!573799) (not b!573670) (not b!573801) (not d!84989) (not b!573785) (not d!84959) (not bm!32654) (not d!85003) (not b!573667) (not d!85023) (not bm!32645) (not d!84969))
(check-sat)
