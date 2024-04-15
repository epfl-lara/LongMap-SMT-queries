; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46470 () Bool)

(assert start!46470)

(declare-fun b!513642 () Bool)

(declare-fun res!313903 () Bool)

(declare-fun e!299918 () Bool)

(assert (=> b!513642 (=> (not res!313903) (not e!299918))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513642 (= res!313903 (validKeyInArray!0 k0!2280))))

(declare-fun b!513643 () Bool)

(declare-fun res!313902 () Bool)

(assert (=> b!513643 (=> (not res!313902) (not e!299918))))

(declare-datatypes ((array!32963 0))(
  ( (array!32964 (arr!15854 (Array (_ BitVec 32) (_ BitVec 64))) (size!16219 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32963)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!513643 (= res!313902 (validKeyInArray!0 (select (arr!15854 a!3235) j!176)))))

(declare-fun b!513644 () Bool)

(declare-fun res!313904 () Bool)

(assert (=> b!513644 (=> (not res!313904) (not e!299918))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513644 (= res!313904 (and (= (size!16219 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16219 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16219 a!3235)) (not (= i!1204 j!176))))))

(declare-datatypes ((SeekEntryResult!4318 0))(
  ( (MissingZero!4318 (index!19460 (_ BitVec 32))) (Found!4318 (index!19461 (_ BitVec 32))) (Intermediate!4318 (undefined!5130 Bool) (index!19462 (_ BitVec 32)) (x!48426 (_ BitVec 32))) (Undefined!4318) (MissingVacant!4318 (index!19463 (_ BitVec 32))) )
))
(declare-fun lt!235048 () SeekEntryResult!4318)

(declare-fun b!513645 () Bool)

(declare-fun e!299922 () Bool)

(assert (=> b!513645 (= e!299922 (or (= (select (arr!15854 a!3235) (index!19462 lt!235048)) (select (arr!15854 a!3235) j!176)) (= (select (arr!15854 a!3235) (index!19462 lt!235048)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!19462 lt!235048) #b00000000000000000000000000000000) (bvslt (index!19462 lt!235048) (size!16219 a!3235)))))))

(assert (=> b!513645 (bvslt (x!48426 lt!235048) #b01111111111111111111111111111110)))

(declare-fun b!513646 () Bool)

(declare-fun e!299920 () Bool)

(assert (=> b!513646 (= e!299920 (not e!299922))))

(declare-fun res!313905 () Bool)

(assert (=> b!513646 (=> res!313905 e!299922)))

(declare-fun lt!235046 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32963 (_ BitVec 32)) SeekEntryResult!4318)

(assert (=> b!513646 (= res!313905 (= lt!235048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235046 (select (store (arr!15854 a!3235) i!1204 k0!2280) j!176) (array!32964 (store (arr!15854 a!3235) i!1204 k0!2280) (size!16219 a!3235)) mask!3524)))))

(declare-fun lt!235047 () (_ BitVec 32))

(assert (=> b!513646 (= lt!235048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235047 (select (arr!15854 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513646 (= lt!235046 (toIndex!0 (select (store (arr!15854 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!513646 (= lt!235047 (toIndex!0 (select (arr!15854 a!3235) j!176) mask!3524))))

(declare-fun e!299919 () Bool)

(assert (=> b!513646 e!299919))

(declare-fun res!313897 () Bool)

(assert (=> b!513646 (=> (not res!313897) (not e!299919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32963 (_ BitVec 32)) Bool)

(assert (=> b!513646 (= res!313897 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15880 0))(
  ( (Unit!15881) )
))
(declare-fun lt!235044 () Unit!15880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15880)

(assert (=> b!513646 (= lt!235044 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513647 () Bool)

(declare-fun res!313906 () Bool)

(assert (=> b!513647 (=> (not res!313906) (not e!299920))))

(assert (=> b!513647 (= res!313906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!313900 () Bool)

(assert (=> start!46470 (=> (not res!313900) (not e!299918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46470 (= res!313900 (validMask!0 mask!3524))))

(assert (=> start!46470 e!299918))

(assert (=> start!46470 true))

(declare-fun array_inv!11737 (array!32963) Bool)

(assert (=> start!46470 (array_inv!11737 a!3235)))

(declare-fun b!513648 () Bool)

(declare-fun res!313899 () Bool)

(assert (=> b!513648 (=> res!313899 e!299922)))

(get-info :version)

(assert (=> b!513648 (= res!313899 (or (undefined!5130 lt!235048) (not ((_ is Intermediate!4318) lt!235048))))))

(declare-fun b!513649 () Bool)

(declare-fun res!313901 () Bool)

(assert (=> b!513649 (=> (not res!313901) (not e!299918))))

(declare-fun arrayContainsKey!0 (array!32963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513649 (= res!313901 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513650 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32963 (_ BitVec 32)) SeekEntryResult!4318)

(assert (=> b!513650 (= e!299919 (= (seekEntryOrOpen!0 (select (arr!15854 a!3235) j!176) a!3235 mask!3524) (Found!4318 j!176)))))

(declare-fun b!513651 () Bool)

(assert (=> b!513651 (= e!299918 e!299920)))

(declare-fun res!313898 () Bool)

(assert (=> b!513651 (=> (not res!313898) (not e!299920))))

(declare-fun lt!235045 () SeekEntryResult!4318)

(assert (=> b!513651 (= res!313898 (or (= lt!235045 (MissingZero!4318 i!1204)) (= lt!235045 (MissingVacant!4318 i!1204))))))

(assert (=> b!513651 (= lt!235045 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!513652 () Bool)

(declare-fun res!313907 () Bool)

(assert (=> b!513652 (=> (not res!313907) (not e!299920))))

(declare-datatypes ((List!10051 0))(
  ( (Nil!10048) (Cons!10047 (h!10936 (_ BitVec 64)) (t!16270 List!10051)) )
))
(declare-fun arrayNoDuplicates!0 (array!32963 (_ BitVec 32) List!10051) Bool)

(assert (=> b!513652 (= res!313907 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10048))))

(assert (= (and start!46470 res!313900) b!513644))

(assert (= (and b!513644 res!313904) b!513643))

(assert (= (and b!513643 res!313902) b!513642))

(assert (= (and b!513642 res!313903) b!513649))

(assert (= (and b!513649 res!313901) b!513651))

(assert (= (and b!513651 res!313898) b!513647))

(assert (= (and b!513647 res!313906) b!513652))

(assert (= (and b!513652 res!313907) b!513646))

(assert (= (and b!513646 res!313897) b!513650))

(assert (= (and b!513646 (not res!313905)) b!513648))

(assert (= (and b!513648 (not res!313899)) b!513645))

(declare-fun m!494659 () Bool)

(assert (=> b!513647 m!494659))

(declare-fun m!494661 () Bool)

(assert (=> b!513651 m!494661))

(declare-fun m!494663 () Bool)

(assert (=> b!513652 m!494663))

(declare-fun m!494665 () Bool)

(assert (=> b!513645 m!494665))

(declare-fun m!494667 () Bool)

(assert (=> b!513645 m!494667))

(declare-fun m!494669 () Bool)

(assert (=> b!513649 m!494669))

(assert (=> b!513643 m!494667))

(assert (=> b!513643 m!494667))

(declare-fun m!494671 () Bool)

(assert (=> b!513643 m!494671))

(declare-fun m!494673 () Bool)

(assert (=> start!46470 m!494673))

(declare-fun m!494675 () Bool)

(assert (=> start!46470 m!494675))

(assert (=> b!513650 m!494667))

(assert (=> b!513650 m!494667))

(declare-fun m!494677 () Bool)

(assert (=> b!513650 m!494677))

(declare-fun m!494679 () Bool)

(assert (=> b!513642 m!494679))

(declare-fun m!494681 () Bool)

(assert (=> b!513646 m!494681))

(declare-fun m!494683 () Bool)

(assert (=> b!513646 m!494683))

(declare-fun m!494685 () Bool)

(assert (=> b!513646 m!494685))

(declare-fun m!494687 () Bool)

(assert (=> b!513646 m!494687))

(assert (=> b!513646 m!494681))

(assert (=> b!513646 m!494667))

(declare-fun m!494689 () Bool)

(assert (=> b!513646 m!494689))

(assert (=> b!513646 m!494667))

(declare-fun m!494691 () Bool)

(assert (=> b!513646 m!494691))

(assert (=> b!513646 m!494667))

(declare-fun m!494693 () Bool)

(assert (=> b!513646 m!494693))

(assert (=> b!513646 m!494681))

(declare-fun m!494695 () Bool)

(assert (=> b!513646 m!494695))

(check-sat (not b!513651) (not b!513652) (not b!513646) (not start!46470) (not b!513650) (not b!513647) (not b!513643) (not b!513642) (not b!513649))
(check-sat)
(get-model)

(declare-fun b!513729 () Bool)

(declare-fun e!299964 () Bool)

(declare-fun e!299963 () Bool)

(assert (=> b!513729 (= e!299964 e!299963)))

(declare-fun c!60159 () Bool)

(assert (=> b!513729 (= c!60159 (validKeyInArray!0 (select (arr!15854 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513730 () Bool)

(declare-fun call!31555 () Bool)

(assert (=> b!513730 (= e!299963 call!31555)))

(declare-fun b!513731 () Bool)

(declare-fun e!299962 () Bool)

(declare-fun contains!2718 (List!10051 (_ BitVec 64)) Bool)

(assert (=> b!513731 (= e!299962 (contains!2718 Nil!10048 (select (arr!15854 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79063 () Bool)

(declare-fun res!313982 () Bool)

(declare-fun e!299961 () Bool)

(assert (=> d!79063 (=> res!313982 e!299961)))

(assert (=> d!79063 (= res!313982 (bvsge #b00000000000000000000000000000000 (size!16219 a!3235)))))

(assert (=> d!79063 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10048) e!299961)))

(declare-fun b!513732 () Bool)

(assert (=> b!513732 (= e!299963 call!31555)))

(declare-fun b!513733 () Bool)

(assert (=> b!513733 (= e!299961 e!299964)))

(declare-fun res!313981 () Bool)

(assert (=> b!513733 (=> (not res!313981) (not e!299964))))

(assert (=> b!513733 (= res!313981 (not e!299962))))

(declare-fun res!313980 () Bool)

(assert (=> b!513733 (=> (not res!313980) (not e!299962))))

(assert (=> b!513733 (= res!313980 (validKeyInArray!0 (select (arr!15854 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31552 () Bool)

(assert (=> bm!31552 (= call!31555 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60159 (Cons!10047 (select (arr!15854 a!3235) #b00000000000000000000000000000000) Nil!10048) Nil!10048)))))

(assert (= (and d!79063 (not res!313982)) b!513733))

(assert (= (and b!513733 res!313980) b!513731))

(assert (= (and b!513733 res!313981) b!513729))

(assert (= (and b!513729 c!60159) b!513730))

(assert (= (and b!513729 (not c!60159)) b!513732))

(assert (= (or b!513730 b!513732) bm!31552))

(declare-fun m!494773 () Bool)

(assert (=> b!513729 m!494773))

(assert (=> b!513729 m!494773))

(declare-fun m!494775 () Bool)

(assert (=> b!513729 m!494775))

(assert (=> b!513731 m!494773))

(assert (=> b!513731 m!494773))

(declare-fun m!494777 () Bool)

(assert (=> b!513731 m!494777))

(assert (=> b!513733 m!494773))

(assert (=> b!513733 m!494773))

(assert (=> b!513733 m!494775))

(assert (=> bm!31552 m!494773))

(declare-fun m!494779 () Bool)

(assert (=> bm!31552 m!494779))

(assert (=> b!513652 d!79063))

(declare-fun d!79065 () Bool)

(assert (=> d!79065 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46470 d!79065))

(declare-fun d!79067 () Bool)

(assert (=> d!79067 (= (array_inv!11737 a!3235) (bvsge (size!16219 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46470 d!79067))

(declare-fun d!79069 () Bool)

(declare-fun res!313987 () Bool)

(declare-fun e!299972 () Bool)

(assert (=> d!79069 (=> res!313987 e!299972)))

(assert (=> d!79069 (= res!313987 (bvsge #b00000000000000000000000000000000 (size!16219 a!3235)))))

(assert (=> d!79069 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299972)))

(declare-fun b!513742 () Bool)

(declare-fun e!299971 () Bool)

(assert (=> b!513742 (= e!299972 e!299971)))

(declare-fun c!60162 () Bool)

(assert (=> b!513742 (= c!60162 (validKeyInArray!0 (select (arr!15854 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31555 () Bool)

(declare-fun call!31558 () Bool)

(assert (=> bm!31555 (= call!31558 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513743 () Bool)

(declare-fun e!299973 () Bool)

(assert (=> b!513743 (= e!299973 call!31558)))

(declare-fun b!513744 () Bool)

(assert (=> b!513744 (= e!299971 call!31558)))

(declare-fun b!513745 () Bool)

(assert (=> b!513745 (= e!299971 e!299973)))

(declare-fun lt!235087 () (_ BitVec 64))

(assert (=> b!513745 (= lt!235087 (select (arr!15854 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235085 () Unit!15880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32963 (_ BitVec 64) (_ BitVec 32)) Unit!15880)

(assert (=> b!513745 (= lt!235085 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235087 #b00000000000000000000000000000000))))

(assert (=> b!513745 (arrayContainsKey!0 a!3235 lt!235087 #b00000000000000000000000000000000)))

(declare-fun lt!235086 () Unit!15880)

(assert (=> b!513745 (= lt!235086 lt!235085)))

(declare-fun res!313988 () Bool)

(assert (=> b!513745 (= res!313988 (= (seekEntryOrOpen!0 (select (arr!15854 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4318 #b00000000000000000000000000000000)))))

(assert (=> b!513745 (=> (not res!313988) (not e!299973))))

(assert (= (and d!79069 (not res!313987)) b!513742))

(assert (= (and b!513742 c!60162) b!513745))

(assert (= (and b!513742 (not c!60162)) b!513744))

(assert (= (and b!513745 res!313988) b!513743))

(assert (= (or b!513743 b!513744) bm!31555))

(assert (=> b!513742 m!494773))

(assert (=> b!513742 m!494773))

(assert (=> b!513742 m!494775))

(declare-fun m!494781 () Bool)

(assert (=> bm!31555 m!494781))

(assert (=> b!513745 m!494773))

(declare-fun m!494783 () Bool)

(assert (=> b!513745 m!494783))

(declare-fun m!494785 () Bool)

(assert (=> b!513745 m!494785))

(assert (=> b!513745 m!494773))

(declare-fun m!494787 () Bool)

(assert (=> b!513745 m!494787))

(assert (=> b!513647 d!79069))

(declare-fun d!79071 () Bool)

(assert (=> d!79071 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513642 d!79071))

(declare-fun b!513758 () Bool)

(declare-fun e!299980 () SeekEntryResult!4318)

(declare-fun lt!235094 () SeekEntryResult!4318)

(assert (=> b!513758 (= e!299980 (MissingZero!4318 (index!19462 lt!235094)))))

(declare-fun b!513759 () Bool)

(declare-fun c!60169 () Bool)

(declare-fun lt!235096 () (_ BitVec 64))

(assert (=> b!513759 (= c!60169 (= lt!235096 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299982 () SeekEntryResult!4318)

(assert (=> b!513759 (= e!299982 e!299980)))

(declare-fun b!513760 () Bool)

(declare-fun e!299981 () SeekEntryResult!4318)

(assert (=> b!513760 (= e!299981 Undefined!4318)))

(declare-fun b!513761 () Bool)

(assert (=> b!513761 (= e!299981 e!299982)))

(assert (=> b!513761 (= lt!235096 (select (arr!15854 a!3235) (index!19462 lt!235094)))))

(declare-fun c!60171 () Bool)

(assert (=> b!513761 (= c!60171 (= lt!235096 k0!2280))))

(declare-fun d!79073 () Bool)

(declare-fun lt!235095 () SeekEntryResult!4318)

(assert (=> d!79073 (and (or ((_ is Undefined!4318) lt!235095) (not ((_ is Found!4318) lt!235095)) (and (bvsge (index!19461 lt!235095) #b00000000000000000000000000000000) (bvslt (index!19461 lt!235095) (size!16219 a!3235)))) (or ((_ is Undefined!4318) lt!235095) ((_ is Found!4318) lt!235095) (not ((_ is MissingZero!4318) lt!235095)) (and (bvsge (index!19460 lt!235095) #b00000000000000000000000000000000) (bvslt (index!19460 lt!235095) (size!16219 a!3235)))) (or ((_ is Undefined!4318) lt!235095) ((_ is Found!4318) lt!235095) ((_ is MissingZero!4318) lt!235095) (not ((_ is MissingVacant!4318) lt!235095)) (and (bvsge (index!19463 lt!235095) #b00000000000000000000000000000000) (bvslt (index!19463 lt!235095) (size!16219 a!3235)))) (or ((_ is Undefined!4318) lt!235095) (ite ((_ is Found!4318) lt!235095) (= (select (arr!15854 a!3235) (index!19461 lt!235095)) k0!2280) (ite ((_ is MissingZero!4318) lt!235095) (= (select (arr!15854 a!3235) (index!19460 lt!235095)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4318) lt!235095) (= (select (arr!15854 a!3235) (index!19463 lt!235095)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79073 (= lt!235095 e!299981)))

(declare-fun c!60170 () Bool)

(assert (=> d!79073 (= c!60170 (and ((_ is Intermediate!4318) lt!235094) (undefined!5130 lt!235094)))))

(assert (=> d!79073 (= lt!235094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79073 (validMask!0 mask!3524)))

(assert (=> d!79073 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235095)))

(declare-fun b!513762 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32963 (_ BitVec 32)) SeekEntryResult!4318)

(assert (=> b!513762 (= e!299980 (seekKeyOrZeroReturnVacant!0 (x!48426 lt!235094) (index!19462 lt!235094) (index!19462 lt!235094) k0!2280 a!3235 mask!3524))))

(declare-fun b!513763 () Bool)

(assert (=> b!513763 (= e!299982 (Found!4318 (index!19462 lt!235094)))))

(assert (= (and d!79073 c!60170) b!513760))

(assert (= (and d!79073 (not c!60170)) b!513761))

(assert (= (and b!513761 c!60171) b!513763))

(assert (= (and b!513761 (not c!60171)) b!513759))

(assert (= (and b!513759 c!60169) b!513758))

(assert (= (and b!513759 (not c!60169)) b!513762))

(declare-fun m!494789 () Bool)

(assert (=> b!513761 m!494789))

(declare-fun m!494791 () Bool)

(assert (=> d!79073 m!494791))

(declare-fun m!494793 () Bool)

(assert (=> d!79073 m!494793))

(declare-fun m!494795 () Bool)

(assert (=> d!79073 m!494795))

(assert (=> d!79073 m!494673))

(declare-fun m!494797 () Bool)

(assert (=> d!79073 m!494797))

(assert (=> d!79073 m!494795))

(declare-fun m!494799 () Bool)

(assert (=> d!79073 m!494799))

(declare-fun m!494801 () Bool)

(assert (=> b!513762 m!494801))

(assert (=> b!513651 d!79073))

(declare-fun d!79089 () Bool)

(declare-fun lt!235102 () (_ BitVec 32))

(declare-fun lt!235101 () (_ BitVec 32))

(assert (=> d!79089 (= lt!235102 (bvmul (bvxor lt!235101 (bvlshr lt!235101 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79089 (= lt!235101 ((_ extract 31 0) (bvand (bvxor (select (arr!15854 a!3235) j!176) (bvlshr (select (arr!15854 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79089 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313989 (let ((h!10939 ((_ extract 31 0) (bvand (bvxor (select (arr!15854 a!3235) j!176) (bvlshr (select (arr!15854 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48429 (bvmul (bvxor h!10939 (bvlshr h!10939 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48429 (bvlshr x!48429 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313989 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313989 #b00000000000000000000000000000000))))))

(assert (=> d!79089 (= (toIndex!0 (select (arr!15854 a!3235) j!176) mask!3524) (bvand (bvxor lt!235102 (bvlshr lt!235102 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513646 d!79089))

(declare-fun d!79093 () Bool)

(declare-fun res!313996 () Bool)

(declare-fun e!299992 () Bool)

(assert (=> d!79093 (=> res!313996 e!299992)))

(assert (=> d!79093 (= res!313996 (bvsge j!176 (size!16219 a!3235)))))

(assert (=> d!79093 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299992)))

(declare-fun b!513774 () Bool)

(declare-fun e!299991 () Bool)

(assert (=> b!513774 (= e!299992 e!299991)))

(declare-fun c!60174 () Bool)

(assert (=> b!513774 (= c!60174 (validKeyInArray!0 (select (arr!15854 a!3235) j!176)))))

(declare-fun bm!31558 () Bool)

(declare-fun call!31561 () Bool)

(assert (=> bm!31558 (= call!31561 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513775 () Bool)

(declare-fun e!299993 () Bool)

(assert (=> b!513775 (= e!299993 call!31561)))

(declare-fun b!513776 () Bool)

(assert (=> b!513776 (= e!299991 call!31561)))

(declare-fun b!513777 () Bool)

(assert (=> b!513777 (= e!299991 e!299993)))

(declare-fun lt!235105 () (_ BitVec 64))

(assert (=> b!513777 (= lt!235105 (select (arr!15854 a!3235) j!176))))

(declare-fun lt!235103 () Unit!15880)

(assert (=> b!513777 (= lt!235103 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235105 j!176))))

(assert (=> b!513777 (arrayContainsKey!0 a!3235 lt!235105 #b00000000000000000000000000000000)))

(declare-fun lt!235104 () Unit!15880)

(assert (=> b!513777 (= lt!235104 lt!235103)))

(declare-fun res!313997 () Bool)

(assert (=> b!513777 (= res!313997 (= (seekEntryOrOpen!0 (select (arr!15854 a!3235) j!176) a!3235 mask!3524) (Found!4318 j!176)))))

(assert (=> b!513777 (=> (not res!313997) (not e!299993))))

(assert (= (and d!79093 (not res!313996)) b!513774))

(assert (= (and b!513774 c!60174) b!513777))

(assert (= (and b!513774 (not c!60174)) b!513776))

(assert (= (and b!513777 res!313997) b!513775))

(assert (= (or b!513775 b!513776) bm!31558))

(assert (=> b!513774 m!494667))

(assert (=> b!513774 m!494667))

(assert (=> b!513774 m!494671))

(declare-fun m!494803 () Bool)

(assert (=> bm!31558 m!494803))

(assert (=> b!513777 m!494667))

(declare-fun m!494805 () Bool)

(assert (=> b!513777 m!494805))

(declare-fun m!494807 () Bool)

(assert (=> b!513777 m!494807))

(assert (=> b!513777 m!494667))

(assert (=> b!513777 m!494677))

(assert (=> b!513646 d!79093))

(declare-fun d!79095 () Bool)

(declare-fun lt!235107 () (_ BitVec 32))

(declare-fun lt!235106 () (_ BitVec 32))

(assert (=> d!79095 (= lt!235107 (bvmul (bvxor lt!235106 (bvlshr lt!235106 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79095 (= lt!235106 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15854 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15854 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79095 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313989 (let ((h!10939 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15854 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15854 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48429 (bvmul (bvxor h!10939 (bvlshr h!10939 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48429 (bvlshr x!48429 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313989 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313989 #b00000000000000000000000000000000))))))

(assert (=> d!79095 (= (toIndex!0 (select (store (arr!15854 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235107 (bvlshr lt!235107 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513646 d!79095))

(declare-fun lt!235136 () SeekEntryResult!4318)

(declare-fun b!513851 () Bool)

(assert (=> b!513851 (and (bvsge (index!19462 lt!235136) #b00000000000000000000000000000000) (bvslt (index!19462 lt!235136) (size!16219 (array!32964 (store (arr!15854 a!3235) i!1204 k0!2280) (size!16219 a!3235)))))))

(declare-fun res!314031 () Bool)

(assert (=> b!513851 (= res!314031 (= (select (arr!15854 (array!32964 (store (arr!15854 a!3235) i!1204 k0!2280) (size!16219 a!3235))) (index!19462 lt!235136)) (select (store (arr!15854 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!300044 () Bool)

(assert (=> b!513851 (=> res!314031 e!300044)))

(declare-fun e!300045 () Bool)

(assert (=> b!513851 (= e!300045 e!300044)))

(declare-fun b!513852 () Bool)

(declare-fun e!300047 () SeekEntryResult!4318)

(assert (=> b!513852 (= e!300047 (Intermediate!4318 false lt!235046 #b00000000000000000000000000000000))))

(declare-fun b!513853 () Bool)

(assert (=> b!513853 (and (bvsge (index!19462 lt!235136) #b00000000000000000000000000000000) (bvslt (index!19462 lt!235136) (size!16219 (array!32964 (store (arr!15854 a!3235) i!1204 k0!2280) (size!16219 a!3235)))))))

(assert (=> b!513853 (= e!300044 (= (select (arr!15854 (array!32964 (store (arr!15854 a!3235) i!1204 k0!2280) (size!16219 a!3235))) (index!19462 lt!235136)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513854 () Bool)

(declare-fun e!300048 () SeekEntryResult!4318)

(assert (=> b!513854 (= e!300048 e!300047)))

(declare-fun c!60197 () Bool)

(declare-fun lt!235137 () (_ BitVec 64))

(assert (=> b!513854 (= c!60197 (or (= lt!235137 (select (store (arr!15854 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!235137 lt!235137) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513855 () Bool)

(declare-fun e!300046 () Bool)

(assert (=> b!513855 (= e!300046 (bvsge (x!48426 lt!235136) #b01111111111111111111111111111110))))

(declare-fun b!513856 () Bool)

(assert (=> b!513856 (= e!300046 e!300045)))

(declare-fun res!314030 () Bool)

(assert (=> b!513856 (= res!314030 (and ((_ is Intermediate!4318) lt!235136) (not (undefined!5130 lt!235136)) (bvslt (x!48426 lt!235136) #b01111111111111111111111111111110) (bvsge (x!48426 lt!235136) #b00000000000000000000000000000000) (bvsge (x!48426 lt!235136) #b00000000000000000000000000000000)))))

(assert (=> b!513856 (=> (not res!314030) (not e!300045))))

(declare-fun b!513858 () Bool)

(assert (=> b!513858 (and (bvsge (index!19462 lt!235136) #b00000000000000000000000000000000) (bvslt (index!19462 lt!235136) (size!16219 (array!32964 (store (arr!15854 a!3235) i!1204 k0!2280) (size!16219 a!3235)))))))

(declare-fun res!314029 () Bool)

(assert (=> b!513858 (= res!314029 (= (select (arr!15854 (array!32964 (store (arr!15854 a!3235) i!1204 k0!2280) (size!16219 a!3235))) (index!19462 lt!235136)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513858 (=> res!314029 e!300044)))

(declare-fun b!513859 () Bool)

(assert (=> b!513859 (= e!300048 (Intermediate!4318 true lt!235046 #b00000000000000000000000000000000))))

(declare-fun b!513857 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513857 (= e!300047 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235046 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15854 a!3235) i!1204 k0!2280) j!176) (array!32964 (store (arr!15854 a!3235) i!1204 k0!2280) (size!16219 a!3235)) mask!3524))))

(declare-fun d!79097 () Bool)

(assert (=> d!79097 e!300046))

(declare-fun c!60196 () Bool)

(assert (=> d!79097 (= c!60196 (and ((_ is Intermediate!4318) lt!235136) (undefined!5130 lt!235136)))))

(assert (=> d!79097 (= lt!235136 e!300048)))

(declare-fun c!60198 () Bool)

(assert (=> d!79097 (= c!60198 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79097 (= lt!235137 (select (arr!15854 (array!32964 (store (arr!15854 a!3235) i!1204 k0!2280) (size!16219 a!3235))) lt!235046))))

(assert (=> d!79097 (validMask!0 mask!3524)))

(assert (=> d!79097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235046 (select (store (arr!15854 a!3235) i!1204 k0!2280) j!176) (array!32964 (store (arr!15854 a!3235) i!1204 k0!2280) (size!16219 a!3235)) mask!3524) lt!235136)))

(assert (= (and d!79097 c!60198) b!513859))

(assert (= (and d!79097 (not c!60198)) b!513854))

(assert (= (and b!513854 c!60197) b!513852))

(assert (= (and b!513854 (not c!60197)) b!513857))

(assert (= (and d!79097 c!60196) b!513855))

(assert (= (and d!79097 (not c!60196)) b!513856))

(assert (= (and b!513856 res!314030) b!513851))

(assert (= (and b!513851 (not res!314031)) b!513858))

(assert (= (and b!513858 (not res!314029)) b!513853))

(declare-fun m!494843 () Bool)

(assert (=> d!79097 m!494843))

(assert (=> d!79097 m!494673))

(declare-fun m!494845 () Bool)

(assert (=> b!513858 m!494845))

(assert (=> b!513853 m!494845))

(declare-fun m!494847 () Bool)

(assert (=> b!513857 m!494847))

(assert (=> b!513857 m!494847))

(assert (=> b!513857 m!494681))

(declare-fun m!494849 () Bool)

(assert (=> b!513857 m!494849))

(assert (=> b!513851 m!494845))

(assert (=> b!513646 d!79097))

(declare-fun d!79111 () Bool)

(assert (=> d!79111 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235143 () Unit!15880)

(declare-fun choose!38 (array!32963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15880)

(assert (=> d!79111 (= lt!235143 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79111 (validMask!0 mask!3524)))

(assert (=> d!79111 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235143)))

(declare-fun bs!16231 () Bool)

(assert (= bs!16231 d!79111))

(assert (=> bs!16231 m!494691))

(declare-fun m!494861 () Bool)

(assert (=> bs!16231 m!494861))

(assert (=> bs!16231 m!494673))

(assert (=> b!513646 d!79111))

(declare-fun b!513864 () Bool)

(declare-fun lt!235144 () SeekEntryResult!4318)

(assert (=> b!513864 (and (bvsge (index!19462 lt!235144) #b00000000000000000000000000000000) (bvslt (index!19462 lt!235144) (size!16219 a!3235)))))

(declare-fun res!314036 () Bool)

(assert (=> b!513864 (= res!314036 (= (select (arr!15854 a!3235) (index!19462 lt!235144)) (select (arr!15854 a!3235) j!176)))))

(declare-fun e!300052 () Bool)

(assert (=> b!513864 (=> res!314036 e!300052)))

(declare-fun e!300053 () Bool)

(assert (=> b!513864 (= e!300053 e!300052)))

(declare-fun b!513865 () Bool)

(declare-fun e!300055 () SeekEntryResult!4318)

(assert (=> b!513865 (= e!300055 (Intermediate!4318 false lt!235047 #b00000000000000000000000000000000))))

(declare-fun b!513866 () Bool)

(assert (=> b!513866 (and (bvsge (index!19462 lt!235144) #b00000000000000000000000000000000) (bvslt (index!19462 lt!235144) (size!16219 a!3235)))))

(assert (=> b!513866 (= e!300052 (= (select (arr!15854 a!3235) (index!19462 lt!235144)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513867 () Bool)

(declare-fun e!300056 () SeekEntryResult!4318)

(assert (=> b!513867 (= e!300056 e!300055)))

(declare-fun lt!235145 () (_ BitVec 64))

(declare-fun c!60201 () Bool)

(assert (=> b!513867 (= c!60201 (or (= lt!235145 (select (arr!15854 a!3235) j!176)) (= (bvadd lt!235145 lt!235145) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513868 () Bool)

(declare-fun e!300054 () Bool)

(assert (=> b!513868 (= e!300054 (bvsge (x!48426 lt!235144) #b01111111111111111111111111111110))))

(declare-fun b!513869 () Bool)

(assert (=> b!513869 (= e!300054 e!300053)))

(declare-fun res!314035 () Bool)

(assert (=> b!513869 (= res!314035 (and ((_ is Intermediate!4318) lt!235144) (not (undefined!5130 lt!235144)) (bvslt (x!48426 lt!235144) #b01111111111111111111111111111110) (bvsge (x!48426 lt!235144) #b00000000000000000000000000000000) (bvsge (x!48426 lt!235144) #b00000000000000000000000000000000)))))

(assert (=> b!513869 (=> (not res!314035) (not e!300053))))

(declare-fun b!513871 () Bool)

(assert (=> b!513871 (and (bvsge (index!19462 lt!235144) #b00000000000000000000000000000000) (bvslt (index!19462 lt!235144) (size!16219 a!3235)))))

(declare-fun res!314034 () Bool)

(assert (=> b!513871 (= res!314034 (= (select (arr!15854 a!3235) (index!19462 lt!235144)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513871 (=> res!314034 e!300052)))

(declare-fun b!513872 () Bool)

(assert (=> b!513872 (= e!300056 (Intermediate!4318 true lt!235047 #b00000000000000000000000000000000))))

(declare-fun b!513870 () Bool)

(assert (=> b!513870 (= e!300055 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235047 #b00000000000000000000000000000000 mask!3524) (select (arr!15854 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79115 () Bool)

(assert (=> d!79115 e!300054))

(declare-fun c!60200 () Bool)

(assert (=> d!79115 (= c!60200 (and ((_ is Intermediate!4318) lt!235144) (undefined!5130 lt!235144)))))

(assert (=> d!79115 (= lt!235144 e!300056)))

(declare-fun c!60202 () Bool)

(assert (=> d!79115 (= c!60202 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79115 (= lt!235145 (select (arr!15854 a!3235) lt!235047))))

(assert (=> d!79115 (validMask!0 mask!3524)))

(assert (=> d!79115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235047 (select (arr!15854 a!3235) j!176) a!3235 mask!3524) lt!235144)))

(assert (= (and d!79115 c!60202) b!513872))

(assert (= (and d!79115 (not c!60202)) b!513867))

(assert (= (and b!513867 c!60201) b!513865))

(assert (= (and b!513867 (not c!60201)) b!513870))

(assert (= (and d!79115 c!60200) b!513868))

(assert (= (and d!79115 (not c!60200)) b!513869))

(assert (= (and b!513869 res!314035) b!513864))

(assert (= (and b!513864 (not res!314036)) b!513871))

(assert (= (and b!513871 (not res!314034)) b!513866))

(declare-fun m!494863 () Bool)

(assert (=> d!79115 m!494863))

(assert (=> d!79115 m!494673))

(declare-fun m!494865 () Bool)

(assert (=> b!513871 m!494865))

(assert (=> b!513866 m!494865))

(declare-fun m!494867 () Bool)

(assert (=> b!513870 m!494867))

(assert (=> b!513870 m!494867))

(assert (=> b!513870 m!494667))

(declare-fun m!494869 () Bool)

(assert (=> b!513870 m!494869))

(assert (=> b!513864 m!494865))

(assert (=> b!513646 d!79115))

(declare-fun d!79117 () Bool)

(declare-fun res!314047 () Bool)

(declare-fun e!300075 () Bool)

(assert (=> d!79117 (=> res!314047 e!300075)))

(assert (=> d!79117 (= res!314047 (= (select (arr!15854 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79117 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!300075)))

(declare-fun b!513899 () Bool)

(declare-fun e!300076 () Bool)

(assert (=> b!513899 (= e!300075 e!300076)))

(declare-fun res!314048 () Bool)

(assert (=> b!513899 (=> (not res!314048) (not e!300076))))

(assert (=> b!513899 (= res!314048 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16219 a!3235)))))

(declare-fun b!513900 () Bool)

(assert (=> b!513900 (= e!300076 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79117 (not res!314047)) b!513899))

(assert (= (and b!513899 res!314048) b!513900))

(assert (=> d!79117 m!494773))

(declare-fun m!494871 () Bool)

(assert (=> b!513900 m!494871))

(assert (=> b!513649 d!79117))

(declare-fun b!513906 () Bool)

(declare-fun e!300081 () SeekEntryResult!4318)

(declare-fun lt!235152 () SeekEntryResult!4318)

(assert (=> b!513906 (= e!300081 (MissingZero!4318 (index!19462 lt!235152)))))

(declare-fun b!513907 () Bool)

(declare-fun c!60212 () Bool)

(declare-fun lt!235154 () (_ BitVec 64))

(assert (=> b!513907 (= c!60212 (= lt!235154 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300083 () SeekEntryResult!4318)

(assert (=> b!513907 (= e!300083 e!300081)))

(declare-fun b!513908 () Bool)

(declare-fun e!300082 () SeekEntryResult!4318)

(assert (=> b!513908 (= e!300082 Undefined!4318)))

(declare-fun b!513909 () Bool)

(assert (=> b!513909 (= e!300082 e!300083)))

(assert (=> b!513909 (= lt!235154 (select (arr!15854 a!3235) (index!19462 lt!235152)))))

(declare-fun c!60214 () Bool)

(assert (=> b!513909 (= c!60214 (= lt!235154 (select (arr!15854 a!3235) j!176)))))

(declare-fun d!79119 () Bool)

(declare-fun lt!235153 () SeekEntryResult!4318)

(assert (=> d!79119 (and (or ((_ is Undefined!4318) lt!235153) (not ((_ is Found!4318) lt!235153)) (and (bvsge (index!19461 lt!235153) #b00000000000000000000000000000000) (bvslt (index!19461 lt!235153) (size!16219 a!3235)))) (or ((_ is Undefined!4318) lt!235153) ((_ is Found!4318) lt!235153) (not ((_ is MissingZero!4318) lt!235153)) (and (bvsge (index!19460 lt!235153) #b00000000000000000000000000000000) (bvslt (index!19460 lt!235153) (size!16219 a!3235)))) (or ((_ is Undefined!4318) lt!235153) ((_ is Found!4318) lt!235153) ((_ is MissingZero!4318) lt!235153) (not ((_ is MissingVacant!4318) lt!235153)) (and (bvsge (index!19463 lt!235153) #b00000000000000000000000000000000) (bvslt (index!19463 lt!235153) (size!16219 a!3235)))) (or ((_ is Undefined!4318) lt!235153) (ite ((_ is Found!4318) lt!235153) (= (select (arr!15854 a!3235) (index!19461 lt!235153)) (select (arr!15854 a!3235) j!176)) (ite ((_ is MissingZero!4318) lt!235153) (= (select (arr!15854 a!3235) (index!19460 lt!235153)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4318) lt!235153) (= (select (arr!15854 a!3235) (index!19463 lt!235153)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79119 (= lt!235153 e!300082)))

(declare-fun c!60213 () Bool)

(assert (=> d!79119 (= c!60213 (and ((_ is Intermediate!4318) lt!235152) (undefined!5130 lt!235152)))))

(assert (=> d!79119 (= lt!235152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15854 a!3235) j!176) mask!3524) (select (arr!15854 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79119 (validMask!0 mask!3524)))

(assert (=> d!79119 (= (seekEntryOrOpen!0 (select (arr!15854 a!3235) j!176) a!3235 mask!3524) lt!235153)))

(declare-fun b!513910 () Bool)

(assert (=> b!513910 (= e!300081 (seekKeyOrZeroReturnVacant!0 (x!48426 lt!235152) (index!19462 lt!235152) (index!19462 lt!235152) (select (arr!15854 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513911 () Bool)

(assert (=> b!513911 (= e!300083 (Found!4318 (index!19462 lt!235152)))))

(assert (= (and d!79119 c!60213) b!513908))

(assert (= (and d!79119 (not c!60213)) b!513909))

(assert (= (and b!513909 c!60214) b!513911))

(assert (= (and b!513909 (not c!60214)) b!513907))

(assert (= (and b!513907 c!60212) b!513906))

(assert (= (and b!513907 (not c!60212)) b!513910))

(declare-fun m!494877 () Bool)

(assert (=> b!513909 m!494877))

(declare-fun m!494879 () Bool)

(assert (=> d!79119 m!494879))

(declare-fun m!494881 () Bool)

(assert (=> d!79119 m!494881))

(assert (=> d!79119 m!494667))

(assert (=> d!79119 m!494689))

(assert (=> d!79119 m!494673))

(declare-fun m!494883 () Bool)

(assert (=> d!79119 m!494883))

(assert (=> d!79119 m!494689))

(assert (=> d!79119 m!494667))

(declare-fun m!494885 () Bool)

(assert (=> d!79119 m!494885))

(assert (=> b!513910 m!494667))

(declare-fun m!494887 () Bool)

(assert (=> b!513910 m!494887))

(assert (=> b!513650 d!79119))

(declare-fun d!79123 () Bool)

(assert (=> d!79123 (= (validKeyInArray!0 (select (arr!15854 a!3235) j!176)) (and (not (= (select (arr!15854 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15854 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513643 d!79123))

(check-sat (not b!513742) (not d!79119) (not b!513870) (not b!513774) (not b!513857) (not b!513733) (not d!79097) (not b!513731) (not bm!31558) (not b!513910) (not b!513745) (not b!513900) (not bm!31555) (not d!79115) (not b!513762) (not d!79111) (not b!513729) (not bm!31552) (not d!79073) (not b!513777))
(check-sat)
