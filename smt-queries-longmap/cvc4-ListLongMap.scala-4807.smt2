; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66120 () Bool)

(assert start!66120)

(declare-fun b!761693 () Bool)

(declare-fun res!515111 () Bool)

(declare-fun e!424624 () Bool)

(assert (=> b!761693 (=> (not res!515111) (not e!424624))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42088 0))(
  ( (array!42089 (arr!20153 (Array (_ BitVec 32) (_ BitVec 64))) (size!20574 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42088)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!761693 (= res!515111 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20574 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20574 a!3186))))))

(declare-fun b!761694 () Bool)

(declare-fun res!515109 () Bool)

(declare-fun e!424630 () Bool)

(assert (=> b!761694 (=> (not res!515109) (not e!424630))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!761694 (= res!515109 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!761695 () Bool)

(declare-fun res!515112 () Bool)

(declare-fun e!424626 () Bool)

(assert (=> b!761695 (=> (not res!515112) (not e!424626))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!761695 (= res!515112 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20153 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!515100 () Bool)

(assert (=> start!66120 (=> (not res!515100) (not e!424630))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66120 (= res!515100 (validMask!0 mask!3328))))

(assert (=> start!66120 e!424630))

(assert (=> start!66120 true))

(declare-fun array_inv!15949 (array!42088) Bool)

(assert (=> start!66120 (array_inv!15949 a!3186)))

(declare-fun b!761696 () Bool)

(assert (=> b!761696 (= e!424630 e!424624)))

(declare-fun res!515103 () Bool)

(assert (=> b!761696 (=> (not res!515103) (not e!424624))))

(declare-datatypes ((SeekEntryResult!7753 0))(
  ( (MissingZero!7753 (index!33380 (_ BitVec 32))) (Found!7753 (index!33381 (_ BitVec 32))) (Intermediate!7753 (undefined!8565 Bool) (index!33382 (_ BitVec 32)) (x!64284 (_ BitVec 32))) (Undefined!7753) (MissingVacant!7753 (index!33383 (_ BitVec 32))) )
))
(declare-fun lt!339325 () SeekEntryResult!7753)

(assert (=> b!761696 (= res!515103 (or (= lt!339325 (MissingZero!7753 i!1173)) (= lt!339325 (MissingVacant!7753 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42088 (_ BitVec 32)) SeekEntryResult!7753)

(assert (=> b!761696 (= lt!339325 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!339330 () (_ BitVec 64))

(declare-fun b!761697 () Bool)

(declare-fun lt!339332 () SeekEntryResult!7753)

(declare-fun e!424631 () Bool)

(assert (=> b!761697 (= e!424631 (or (not (= (select (store (arr!20153 a!3186) i!1173 k!2102) index!1321) lt!339330)) (not (undefined!8565 lt!339332))))))

(declare-fun b!761698 () Bool)

(declare-fun res!515108 () Bool)

(assert (=> b!761698 (=> (not res!515108) (not e!424624))))

(declare-datatypes ((List!14155 0))(
  ( (Nil!14152) (Cons!14151 (h!15232 (_ BitVec 64)) (t!20470 List!14155)) )
))
(declare-fun arrayNoDuplicates!0 (array!42088 (_ BitVec 32) List!14155) Bool)

(assert (=> b!761698 (= res!515108 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14152))))

(declare-fun b!761699 () Bool)

(declare-fun e!424629 () Bool)

(assert (=> b!761699 (= e!424626 e!424629)))

(declare-fun res!515104 () Bool)

(assert (=> b!761699 (=> (not res!515104) (not e!424629))))

(declare-fun lt!339329 () SeekEntryResult!7753)

(assert (=> b!761699 (= res!515104 (= lt!339329 lt!339332))))

(declare-fun lt!339328 () array!42088)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42088 (_ BitVec 32)) SeekEntryResult!7753)

(assert (=> b!761699 (= lt!339332 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339330 lt!339328 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!761699 (= lt!339329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339330 mask!3328) lt!339330 lt!339328 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!761699 (= lt!339330 (select (store (arr!20153 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!761699 (= lt!339328 (array!42089 (store (arr!20153 a!3186) i!1173 k!2102) (size!20574 a!3186)))))

(declare-fun b!761700 () Bool)

(declare-fun res!515105 () Bool)

(assert (=> b!761700 (=> (not res!515105) (not e!424624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42088 (_ BitVec 32)) Bool)

(assert (=> b!761700 (= res!515105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!761701 () Bool)

(declare-fun res!515101 () Bool)

(assert (=> b!761701 (=> (not res!515101) (not e!424630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!761701 (= res!515101 (validKeyInArray!0 k!2102))))

(declare-fun b!761702 () Bool)

(declare-fun e!424628 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42088 (_ BitVec 32)) SeekEntryResult!7753)

(assert (=> b!761702 (= e!424628 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20153 a!3186) j!159) a!3186 mask!3328) (Found!7753 j!159)))))

(declare-fun b!761703 () Bool)

(declare-fun res!515097 () Bool)

(assert (=> b!761703 (=> (not res!515097) (not e!424630))))

(assert (=> b!761703 (= res!515097 (and (= (size!20574 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20574 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20574 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!761704 () Bool)

(declare-fun res!515113 () Bool)

(assert (=> b!761704 (=> res!515113 e!424631)))

(assert (=> b!761704 (= res!515113 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20153 a!3186) j!159) a!3186 mask!3328) (Found!7753 j!159))))))

(declare-fun b!761705 () Bool)

(declare-fun e!424627 () Bool)

(declare-fun e!424625 () Bool)

(assert (=> b!761705 (= e!424627 e!424625)))

(declare-fun res!515107 () Bool)

(assert (=> b!761705 (=> (not res!515107) (not e!424625))))

(declare-fun lt!339331 () SeekEntryResult!7753)

(assert (=> b!761705 (= res!515107 (= (seekEntryOrOpen!0 (select (arr!20153 a!3186) j!159) a!3186 mask!3328) lt!339331))))

(assert (=> b!761705 (= lt!339331 (Found!7753 j!159))))

(declare-fun b!761706 () Bool)

(declare-fun res!515099 () Bool)

(assert (=> b!761706 (=> (not res!515099) (not e!424630))))

(assert (=> b!761706 (= res!515099 (validKeyInArray!0 (select (arr!20153 a!3186) j!159)))))

(declare-fun b!761707 () Bool)

(assert (=> b!761707 (= e!424624 e!424626)))

(declare-fun res!515098 () Bool)

(assert (=> b!761707 (=> (not res!515098) (not e!424626))))

(declare-fun lt!339327 () SeekEntryResult!7753)

(assert (=> b!761707 (= res!515098 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20153 a!3186) j!159) mask!3328) (select (arr!20153 a!3186) j!159) a!3186 mask!3328) lt!339327))))

(assert (=> b!761707 (= lt!339327 (Intermediate!7753 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!761708 () Bool)

(assert (=> b!761708 (= e!424629 (not e!424631))))

(declare-fun res!515110 () Bool)

(assert (=> b!761708 (=> res!515110 e!424631)))

(assert (=> b!761708 (= res!515110 (or (not (is-Intermediate!7753 lt!339332)) (bvslt x!1131 (x!64284 lt!339332)) (not (= x!1131 (x!64284 lt!339332))) (not (= index!1321 (index!33382 lt!339332)))))))

(assert (=> b!761708 e!424627))

(declare-fun res!515106 () Bool)

(assert (=> b!761708 (=> (not res!515106) (not e!424627))))

(assert (=> b!761708 (= res!515106 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26346 0))(
  ( (Unit!26347) )
))
(declare-fun lt!339326 () Unit!26346)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26346)

(assert (=> b!761708 (= lt!339326 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!761709 () Bool)

(declare-fun res!515102 () Bool)

(assert (=> b!761709 (=> (not res!515102) (not e!424626))))

(assert (=> b!761709 (= res!515102 e!424628)))

(declare-fun c!83683 () Bool)

(assert (=> b!761709 (= c!83683 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!761710 () Bool)

(assert (=> b!761710 (= e!424625 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20153 a!3186) j!159) a!3186 mask!3328) lt!339331))))

(declare-fun b!761711 () Bool)

(assert (=> b!761711 (= e!424628 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20153 a!3186) j!159) a!3186 mask!3328) lt!339327))))

(assert (= (and start!66120 res!515100) b!761703))

(assert (= (and b!761703 res!515097) b!761706))

(assert (= (and b!761706 res!515099) b!761701))

(assert (= (and b!761701 res!515101) b!761694))

(assert (= (and b!761694 res!515109) b!761696))

(assert (= (and b!761696 res!515103) b!761700))

(assert (= (and b!761700 res!515105) b!761698))

(assert (= (and b!761698 res!515108) b!761693))

(assert (= (and b!761693 res!515111) b!761707))

(assert (= (and b!761707 res!515098) b!761695))

(assert (= (and b!761695 res!515112) b!761709))

(assert (= (and b!761709 c!83683) b!761711))

(assert (= (and b!761709 (not c!83683)) b!761702))

(assert (= (and b!761709 res!515102) b!761699))

(assert (= (and b!761699 res!515104) b!761708))

(assert (= (and b!761708 res!515106) b!761705))

(assert (= (and b!761705 res!515107) b!761710))

(assert (= (and b!761708 (not res!515110)) b!761704))

(assert (= (and b!761704 (not res!515113)) b!761697))

(declare-fun m!708621 () Bool)

(assert (=> b!761699 m!708621))

(declare-fun m!708623 () Bool)

(assert (=> b!761699 m!708623))

(assert (=> b!761699 m!708623))

(declare-fun m!708625 () Bool)

(assert (=> b!761699 m!708625))

(declare-fun m!708627 () Bool)

(assert (=> b!761699 m!708627))

(declare-fun m!708629 () Bool)

(assert (=> b!761699 m!708629))

(assert (=> b!761697 m!708627))

(declare-fun m!708631 () Bool)

(assert (=> b!761697 m!708631))

(declare-fun m!708633 () Bool)

(assert (=> b!761695 m!708633))

(declare-fun m!708635 () Bool)

(assert (=> b!761708 m!708635))

(declare-fun m!708637 () Bool)

(assert (=> b!761708 m!708637))

(declare-fun m!708639 () Bool)

(assert (=> b!761696 m!708639))

(declare-fun m!708641 () Bool)

(assert (=> b!761710 m!708641))

(assert (=> b!761710 m!708641))

(declare-fun m!708643 () Bool)

(assert (=> b!761710 m!708643))

(assert (=> b!761705 m!708641))

(assert (=> b!761705 m!708641))

(declare-fun m!708645 () Bool)

(assert (=> b!761705 m!708645))

(declare-fun m!708647 () Bool)

(assert (=> b!761700 m!708647))

(declare-fun m!708649 () Bool)

(assert (=> b!761698 m!708649))

(assert (=> b!761702 m!708641))

(assert (=> b!761702 m!708641))

(declare-fun m!708651 () Bool)

(assert (=> b!761702 m!708651))

(declare-fun m!708653 () Bool)

(assert (=> b!761701 m!708653))

(assert (=> b!761704 m!708641))

(assert (=> b!761704 m!708641))

(assert (=> b!761704 m!708651))

(assert (=> b!761711 m!708641))

(assert (=> b!761711 m!708641))

(declare-fun m!708655 () Bool)

(assert (=> b!761711 m!708655))

(declare-fun m!708657 () Bool)

(assert (=> b!761694 m!708657))

(declare-fun m!708659 () Bool)

(assert (=> start!66120 m!708659))

(declare-fun m!708661 () Bool)

(assert (=> start!66120 m!708661))

(assert (=> b!761706 m!708641))

(assert (=> b!761706 m!708641))

(declare-fun m!708663 () Bool)

(assert (=> b!761706 m!708663))

(assert (=> b!761707 m!708641))

(assert (=> b!761707 m!708641))

(declare-fun m!708665 () Bool)

(assert (=> b!761707 m!708665))

(assert (=> b!761707 m!708665))

(assert (=> b!761707 m!708641))

(declare-fun m!708667 () Bool)

(assert (=> b!761707 m!708667))

(push 1)

(assert (not b!761698))

(assert (not b!761694))

(assert (not b!761711))

(assert (not b!761704))

(assert (not b!761705))

(assert (not b!761696))

(assert (not b!761708))

(assert (not b!761700))

(assert (not b!761707))

(assert (not b!761706))

(assert (not b!761702))

(assert (not b!761701))

(assert (not b!761699))

(assert (not start!66120))

(assert (not b!761710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!761808 () Bool)

(declare-fun e!424690 () SeekEntryResult!7753)

(declare-fun e!424689 () SeekEntryResult!7753)

(assert (=> b!761808 (= e!424690 e!424689)))

(declare-fun c!83724 () Bool)

(declare-fun lt!339377 () (_ BitVec 64))

(assert (=> b!761808 (= c!83724 (= lt!339377 (select (arr!20153 a!3186) j!159)))))

(declare-fun b!761809 () Bool)

(assert (=> b!761809 (= e!424689 (Found!7753 index!1321))))

(declare-fun d!100835 () Bool)

(declare-fun lt!339378 () SeekEntryResult!7753)

(assert (=> d!100835 (and (or (is-Undefined!7753 lt!339378) (not (is-Found!7753 lt!339378)) (and (bvsge (index!33381 lt!339378) #b00000000000000000000000000000000) (bvslt (index!33381 lt!339378) (size!20574 a!3186)))) (or (is-Undefined!7753 lt!339378) (is-Found!7753 lt!339378) (not (is-MissingVacant!7753 lt!339378)) (not (= (index!33383 lt!339378) resIntermediateIndex!5)) (and (bvsge (index!33383 lt!339378) #b00000000000000000000000000000000) (bvslt (index!33383 lt!339378) (size!20574 a!3186)))) (or (is-Undefined!7753 lt!339378) (ite (is-Found!7753 lt!339378) (= (select (arr!20153 a!3186) (index!33381 lt!339378)) (select (arr!20153 a!3186) j!159)) (and (is-MissingVacant!7753 lt!339378) (= (index!33383 lt!339378) resIntermediateIndex!5) (= (select (arr!20153 a!3186) (index!33383 lt!339378)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100835 (= lt!339378 e!424690)))

(declare-fun c!83725 () Bool)

(assert (=> d!100835 (= c!83725 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100835 (= lt!339377 (select (arr!20153 a!3186) index!1321))))

(assert (=> d!100835 (validMask!0 mask!3328)))

(assert (=> d!100835 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20153 a!3186) j!159) a!3186 mask!3328) lt!339378)))

(declare-fun b!761810 () Bool)

(declare-fun e!424688 () SeekEntryResult!7753)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!761810 (= e!424688 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20153 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761811 () Bool)

(assert (=> b!761811 (= e!424688 (MissingVacant!7753 resIntermediateIndex!5))))

(declare-fun b!761812 () Bool)

(declare-fun c!83723 () Bool)

(assert (=> b!761812 (= c!83723 (= lt!339377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761812 (= e!424689 e!424688)))

(declare-fun b!761813 () Bool)

(assert (=> b!761813 (= e!424690 Undefined!7753)))

(assert (= (and d!100835 c!83725) b!761813))

(assert (= (and d!100835 (not c!83725)) b!761808))

(assert (= (and b!761808 c!83724) b!761809))

(assert (= (and b!761808 (not c!83724)) b!761812))

(assert (= (and b!761812 c!83723) b!761811))

(assert (= (and b!761812 (not c!83723)) b!761810))

(declare-fun m!708727 () Bool)

(assert (=> d!100835 m!708727))

(declare-fun m!708729 () Bool)

(assert (=> d!100835 m!708729))

(declare-fun m!708731 () Bool)

(assert (=> d!100835 m!708731))

(assert (=> d!100835 m!708659))

(declare-fun m!708733 () Bool)

(assert (=> b!761810 m!708733))

(assert (=> b!761810 m!708733))

(assert (=> b!761810 m!708641))

(declare-fun m!708735 () Bool)

(assert (=> b!761810 m!708735))

(assert (=> b!761702 d!100835))

(assert (=> b!761704 d!100835))

(declare-fun d!100839 () Bool)

(declare-fun res!515139 () Bool)

(declare-fun e!424706 () Bool)

(assert (=> d!100839 (=> res!515139 e!424706)))

(assert (=> d!100839 (= res!515139 (= (select (arr!20153 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!100839 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!424706)))

(declare-fun b!761839 () Bool)

(declare-fun e!424707 () Bool)

(assert (=> b!761839 (= e!424706 e!424707)))

(declare-fun res!515140 () Bool)

(assert (=> b!761839 (=> (not res!515140) (not e!424707))))

(assert (=> b!761839 (= res!515140 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20574 a!3186)))))

(declare-fun b!761840 () Bool)

(assert (=> b!761840 (= e!424707 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100839 (not res!515139)) b!761839))

(assert (= (and b!761839 res!515140) b!761840))

(declare-fun m!708745 () Bool)

(assert (=> d!100839 m!708745))

(declare-fun m!708747 () Bool)

(assert (=> b!761840 m!708747))

(assert (=> b!761694 d!100839))

(declare-fun d!100843 () Bool)

(declare-fun lt!339411 () SeekEntryResult!7753)

(assert (=> d!100843 (and (or (is-Undefined!7753 lt!339411) (not (is-Found!7753 lt!339411)) (and (bvsge (index!33381 lt!339411) #b00000000000000000000000000000000) (bvslt (index!33381 lt!339411) (size!20574 a!3186)))) (or (is-Undefined!7753 lt!339411) (is-Found!7753 lt!339411) (not (is-MissingZero!7753 lt!339411)) (and (bvsge (index!33380 lt!339411) #b00000000000000000000000000000000) (bvslt (index!33380 lt!339411) (size!20574 a!3186)))) (or (is-Undefined!7753 lt!339411) (is-Found!7753 lt!339411) (is-MissingZero!7753 lt!339411) (not (is-MissingVacant!7753 lt!339411)) (and (bvsge (index!33383 lt!339411) #b00000000000000000000000000000000) (bvslt (index!33383 lt!339411) (size!20574 a!3186)))) (or (is-Undefined!7753 lt!339411) (ite (is-Found!7753 lt!339411) (= (select (arr!20153 a!3186) (index!33381 lt!339411)) (select (arr!20153 a!3186) j!159)) (ite (is-MissingZero!7753 lt!339411) (= (select (arr!20153 a!3186) (index!33380 lt!339411)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7753 lt!339411) (= (select (arr!20153 a!3186) (index!33383 lt!339411)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!424742 () SeekEntryResult!7753)

(assert (=> d!100843 (= lt!339411 e!424742)))

(declare-fun c!83751 () Bool)

(declare-fun lt!339412 () SeekEntryResult!7753)

(assert (=> d!100843 (= c!83751 (and (is-Intermediate!7753 lt!339412) (undefined!8565 lt!339412)))))

(assert (=> d!100843 (= lt!339412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20153 a!3186) j!159) mask!3328) (select (arr!20153 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100843 (validMask!0 mask!3328)))

(assert (=> d!100843 (= (seekEntryOrOpen!0 (select (arr!20153 a!3186) j!159) a!3186 mask!3328) lt!339411)))

(declare-fun b!761890 () Bool)

(declare-fun c!83752 () Bool)

(declare-fun lt!339413 () (_ BitVec 64))

(assert (=> b!761890 (= c!83752 (= lt!339413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424741 () SeekEntryResult!7753)

(declare-fun e!424743 () SeekEntryResult!7753)

(assert (=> b!761890 (= e!424741 e!424743)))

(declare-fun b!761891 () Bool)

(assert (=> b!761891 (= e!424742 e!424741)))

(assert (=> b!761891 (= lt!339413 (select (arr!20153 a!3186) (index!33382 lt!339412)))))

(declare-fun c!83753 () Bool)

(assert (=> b!761891 (= c!83753 (= lt!339413 (select (arr!20153 a!3186) j!159)))))

(declare-fun b!761892 () Bool)

(assert (=> b!761892 (= e!424741 (Found!7753 (index!33382 lt!339412)))))

(declare-fun b!761893 () Bool)

(assert (=> b!761893 (= e!424743 (seekKeyOrZeroReturnVacant!0 (x!64284 lt!339412) (index!33382 lt!339412) (index!33382 lt!339412) (select (arr!20153 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761894 () Bool)

(assert (=> b!761894 (= e!424742 Undefined!7753)))

(declare-fun b!761895 () Bool)

(assert (=> b!761895 (= e!424743 (MissingZero!7753 (index!33382 lt!339412)))))

(assert (= (and d!100843 c!83751) b!761894))

(assert (= (and d!100843 (not c!83751)) b!761891))

(assert (= (and b!761891 c!83753) b!761892))

(assert (= (and b!761891 (not c!83753)) b!761890))

(assert (= (and b!761890 c!83752) b!761895))

(assert (= (and b!761890 (not c!83752)) b!761893))

(assert (=> d!100843 m!708659))

(assert (=> d!100843 m!708641))

(assert (=> d!100843 m!708665))

(declare-fun m!708787 () Bool)

(assert (=> d!100843 m!708787))

(declare-fun m!708789 () Bool)

(assert (=> d!100843 m!708789))

(assert (=> d!100843 m!708665))

(assert (=> d!100843 m!708641))

(assert (=> d!100843 m!708667))

(declare-fun m!708791 () Bool)

(assert (=> d!100843 m!708791))

(declare-fun m!708793 () Bool)

(assert (=> b!761891 m!708793))

(assert (=> b!761893 m!708641))

(declare-fun m!708795 () Bool)

(assert (=> b!761893 m!708795))

(assert (=> b!761705 d!100843))

(declare-fun d!100865 () Bool)

(assert (=> d!100865 (= (validKeyInArray!0 (select (arr!20153 a!3186) j!159)) (and (not (= (select (arr!20153 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20153 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!761706 d!100865))

(declare-fun d!100867 () Bool)

(declare-fun lt!339414 () SeekEntryResult!7753)

(assert (=> d!100867 (and (or (is-Undefined!7753 lt!339414) (not (is-Found!7753 lt!339414)) (and (bvsge (index!33381 lt!339414) #b00000000000000000000000000000000) (bvslt (index!33381 lt!339414) (size!20574 a!3186)))) (or (is-Undefined!7753 lt!339414) (is-Found!7753 lt!339414) (not (is-MissingZero!7753 lt!339414)) (and (bvsge (index!33380 lt!339414) #b00000000000000000000000000000000) (bvslt (index!33380 lt!339414) (size!20574 a!3186)))) (or (is-Undefined!7753 lt!339414) (is-Found!7753 lt!339414) (is-MissingZero!7753 lt!339414) (not (is-MissingVacant!7753 lt!339414)) (and (bvsge (index!33383 lt!339414) #b00000000000000000000000000000000) (bvslt (index!33383 lt!339414) (size!20574 a!3186)))) (or (is-Undefined!7753 lt!339414) (ite (is-Found!7753 lt!339414) (= (select (arr!20153 a!3186) (index!33381 lt!339414)) k!2102) (ite (is-MissingZero!7753 lt!339414) (= (select (arr!20153 a!3186) (index!33380 lt!339414)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7753 lt!339414) (= (select (arr!20153 a!3186) (index!33383 lt!339414)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!424745 () SeekEntryResult!7753)

(assert (=> d!100867 (= lt!339414 e!424745)))

(declare-fun c!83754 () Bool)

(declare-fun lt!339415 () SeekEntryResult!7753)

(assert (=> d!100867 (= c!83754 (and (is-Intermediate!7753 lt!339415) (undefined!8565 lt!339415)))))

(assert (=> d!100867 (= lt!339415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!100867 (validMask!0 mask!3328)))

(assert (=> d!100867 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!339414)))

(declare-fun b!761896 () Bool)

(declare-fun c!83755 () Bool)

(declare-fun lt!339416 () (_ BitVec 64))

(assert (=> b!761896 (= c!83755 (= lt!339416 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424744 () SeekEntryResult!7753)

(declare-fun e!424746 () SeekEntryResult!7753)

(assert (=> b!761896 (= e!424744 e!424746)))

(declare-fun b!761897 () Bool)

(assert (=> b!761897 (= e!424745 e!424744)))

(assert (=> b!761897 (= lt!339416 (select (arr!20153 a!3186) (index!33382 lt!339415)))))

(declare-fun c!83756 () Bool)

(assert (=> b!761897 (= c!83756 (= lt!339416 k!2102))))

(declare-fun b!761898 () Bool)

(assert (=> b!761898 (= e!424744 (Found!7753 (index!33382 lt!339415)))))

(declare-fun b!761899 () Bool)

(assert (=> b!761899 (= e!424746 (seekKeyOrZeroReturnVacant!0 (x!64284 lt!339415) (index!33382 lt!339415) (index!33382 lt!339415) k!2102 a!3186 mask!3328))))

(declare-fun b!761900 () Bool)

(assert (=> b!761900 (= e!424745 Undefined!7753)))

(declare-fun b!761901 () Bool)

(assert (=> b!761901 (= e!424746 (MissingZero!7753 (index!33382 lt!339415)))))

(assert (= (and d!100867 c!83754) b!761900))

(assert (= (and d!100867 (not c!83754)) b!761897))

(assert (= (and b!761897 c!83756) b!761898))

(assert (= (and b!761897 (not c!83756)) b!761896))

(assert (= (and b!761896 c!83755) b!761901))

(assert (= (and b!761896 (not c!83755)) b!761899))

(assert (=> d!100867 m!708659))

(declare-fun m!708797 () Bool)

(assert (=> d!100867 m!708797))

(declare-fun m!708799 () Bool)

(assert (=> d!100867 m!708799))

(declare-fun m!708801 () Bool)

(assert (=> d!100867 m!708801))

(assert (=> d!100867 m!708797))

(declare-fun m!708803 () Bool)

(assert (=> d!100867 m!708803))

(declare-fun m!708805 () Bool)

(assert (=> d!100867 m!708805))

(declare-fun m!708807 () Bool)

(assert (=> b!761897 m!708807))

(declare-fun m!708809 () Bool)

(assert (=> b!761899 m!708809))

(assert (=> b!761696 d!100867))

(declare-fun b!761984 () Bool)

(declare-fun lt!339443 () SeekEntryResult!7753)

(assert (=> b!761984 (and (bvsge (index!33382 lt!339443) #b00000000000000000000000000000000) (bvslt (index!33382 lt!339443) (size!20574 a!3186)))))

(declare-fun res!515186 () Bool)

(assert (=> b!761984 (= res!515186 (= (select (arr!20153 a!3186) (index!33382 lt!339443)) (select (arr!20153 a!3186) j!159)))))

(declare-fun e!424795 () Bool)

(assert (=> b!761984 (=> res!515186 e!424795)))

(declare-fun e!424797 () Bool)

(assert (=> b!761984 (= e!424797 e!424795)))

(declare-fun b!761985 () Bool)

(assert (=> b!761985 (and (bvsge (index!33382 lt!339443) #b00000000000000000000000000000000) (bvslt (index!33382 lt!339443) (size!20574 a!3186)))))

(assert (=> b!761985 (= e!424795 (= (select (arr!20153 a!3186) (index!33382 lt!339443)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100869 () Bool)

(declare-fun e!424793 () Bool)

(assert (=> d!100869 e!424793))

(declare-fun c!83786 () Bool)

(assert (=> d!100869 (= c!83786 (and (is-Intermediate!7753 lt!339443) (undefined!8565 lt!339443)))))

(declare-fun e!424794 () SeekEntryResult!7753)

(assert (=> d!100869 (= lt!339443 e!424794)))

(declare-fun c!83785 () Bool)

(assert (=> d!100869 (= c!83785 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!339444 () (_ BitVec 64))

(assert (=> d!100869 (= lt!339444 (select (arr!20153 a!3186) (toIndex!0 (select (arr!20153 a!3186) j!159) mask!3328)))))

(assert (=> d!100869 (validMask!0 mask!3328)))

(assert (=> d!100869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20153 a!3186) j!159) mask!3328) (select (arr!20153 a!3186) j!159) a!3186 mask!3328) lt!339443)))

(declare-fun b!761986 () Bool)

(declare-fun e!424796 () SeekEntryResult!7753)

(assert (=> b!761986 (= e!424794 e!424796)))

(declare-fun c!83787 () Bool)

(assert (=> b!761986 (= c!83787 (or (= lt!339444 (select (arr!20153 a!3186) j!159)) (= (bvadd lt!339444 lt!339444) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761987 () Bool)

(assert (=> b!761987 (= e!424794 (Intermediate!7753 true (toIndex!0 (select (arr!20153 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761988 () Bool)

(assert (=> b!761988 (= e!424793 e!424797)))

(declare-fun res!515185 () Bool)

(assert (=> b!761988 (= res!515185 (and (is-Intermediate!7753 lt!339443) (not (undefined!8565 lt!339443)) (bvslt (x!64284 lt!339443) #b01111111111111111111111111111110) (bvsge (x!64284 lt!339443) #b00000000000000000000000000000000) (bvsge (x!64284 lt!339443) #b00000000000000000000000000000000)))))

(assert (=> b!761988 (=> (not res!515185) (not e!424797))))

(declare-fun b!761989 () Bool)

(assert (=> b!761989 (= e!424796 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20153 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20153 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761990 () Bool)

(assert (=> b!761990 (= e!424796 (Intermediate!7753 false (toIndex!0 (select (arr!20153 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761991 () Bool)

(assert (=> b!761991 (and (bvsge (index!33382 lt!339443) #b00000000000000000000000000000000) (bvslt (index!33382 lt!339443) (size!20574 a!3186)))))

(declare-fun res!515187 () Bool)

(assert (=> b!761991 (= res!515187 (= (select (arr!20153 a!3186) (index!33382 lt!339443)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761991 (=> res!515187 e!424795)))

(declare-fun b!761992 () Bool)

(assert (=> b!761992 (= e!424793 (bvsge (x!64284 lt!339443) #b01111111111111111111111111111110))))

(assert (= (and d!100869 c!83785) b!761987))

(assert (= (and d!100869 (not c!83785)) b!761986))

(assert (= (and b!761986 c!83787) b!761990))

(assert (= (and b!761986 (not c!83787)) b!761989))

(assert (= (and d!100869 c!83786) b!761992))

(assert (= (and d!100869 (not c!83786)) b!761988))

(assert (= (and b!761988 res!515185) b!761984))

(assert (= (and b!761984 (not res!515186)) b!761991))

(assert (= (and b!761991 (not res!515187)) b!761985))

(declare-fun m!708853 () Bool)

(assert (=> b!761984 m!708853))

(assert (=> b!761991 m!708853))

(assert (=> b!761985 m!708853))

(assert (=> b!761989 m!708665))

(declare-fun m!708855 () Bool)

(assert (=> b!761989 m!708855))

(assert (=> b!761989 m!708855))

(assert (=> b!761989 m!708641))

(declare-fun m!708857 () Bool)

(assert (=> b!761989 m!708857))

(assert (=> d!100869 m!708665))

(declare-fun m!708859 () Bool)

(assert (=> d!100869 m!708859))

(assert (=> d!100869 m!708659))

(assert (=> b!761707 d!100869))

(declare-fun d!100893 () Bool)

(declare-fun lt!339450 () (_ BitVec 32))

(declare-fun lt!339449 () (_ BitVec 32))

(assert (=> d!100893 (= lt!339450 (bvmul (bvxor lt!339449 (bvlshr lt!339449 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100893 (= lt!339449 ((_ extract 31 0) (bvand (bvxor (select (arr!20153 a!3186) j!159) (bvlshr (select (arr!20153 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100893 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!515188 (let ((h!15234 ((_ extract 31 0) (bvand (bvxor (select (arr!20153 a!3186) j!159) (bvlshr (select (arr!20153 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64291 (bvmul (bvxor h!15234 (bvlshr h!15234 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64291 (bvlshr x!64291 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!515188 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!515188 #b00000000000000000000000000000000))))))

(assert (=> d!100893 (= (toIndex!0 (select (arr!20153 a!3186) j!159) mask!3328) (bvand (bvxor lt!339450 (bvlshr lt!339450 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!761707 d!100893))

(declare-fun b!762019 () Bool)

(declare-fun e!424814 () Bool)

(declare-fun e!424815 () Bool)

(assert (=> b!762019 (= e!424814 e!424815)))

(declare-fun lt!339463 () (_ BitVec 64))

(assert (=> b!762019 (= lt!339463 (select (arr!20153 a!3186) j!159))))

(declare-fun lt!339464 () Unit!26346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42088 (_ BitVec 64) (_ BitVec 32)) Unit!26346)

(assert (=> b!762019 (= lt!339464 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339463 j!159))))

(assert (=> b!762019 (arrayContainsKey!0 a!3186 lt!339463 #b00000000000000000000000000000000)))

(declare-fun lt!339465 () Unit!26346)

(assert (=> b!762019 (= lt!339465 lt!339464)))

(declare-fun res!515193 () Bool)

(assert (=> b!762019 (= res!515193 (= (seekEntryOrOpen!0 (select (arr!20153 a!3186) j!159) a!3186 mask!3328) (Found!7753 j!159)))))

(assert (=> b!762019 (=> (not res!515193) (not e!424815))))

(declare-fun d!100895 () Bool)

(declare-fun res!515194 () Bool)

(declare-fun e!424813 () Bool)

(assert (=> d!100895 (=> res!515194 e!424813)))

(assert (=> d!100895 (= res!515194 (bvsge j!159 (size!20574 a!3186)))))

(assert (=> d!100895 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!424813)))

(declare-fun b!762020 () Bool)

(declare-fun call!34994 () Bool)

(assert (=> b!762020 (= e!424815 call!34994)))

(declare-fun bm!34991 () Bool)

(assert (=> bm!34991 (= call!34994 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!762021 () Bool)

(assert (=> b!762021 (= e!424814 call!34994)))

(declare-fun b!762022 () Bool)

(assert (=> b!762022 (= e!424813 e!424814)))

(declare-fun c!83799 () Bool)

(assert (=> b!762022 (= c!83799 (validKeyInArray!0 (select (arr!20153 a!3186) j!159)))))

(assert (= (and d!100895 (not res!515194)) b!762022))

(assert (= (and b!762022 c!83799) b!762019))

(assert (= (and b!762022 (not c!83799)) b!762021))

(assert (= (and b!762019 res!515193) b!762020))

(assert (= (or b!762020 b!762021) bm!34991))

(assert (=> b!762019 m!708641))

(declare-fun m!708869 () Bool)

(assert (=> b!762019 m!708869))

(declare-fun m!708871 () Bool)

(assert (=> b!762019 m!708871))

(assert (=> b!762019 m!708641))

(assert (=> b!762019 m!708645))

(declare-fun m!708873 () Bool)

(assert (=> bm!34991 m!708873))

(assert (=> b!762022 m!708641))

(assert (=> b!762022 m!708641))

(assert (=> b!762022 m!708663))

(assert (=> b!761708 d!100895))

(declare-fun d!100899 () Bool)

(assert (=> d!100899 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!339470 () Unit!26346)

(declare-fun choose!38 (array!42088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26346)

(assert (=> d!100899 (= lt!339470 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100899 (validMask!0 mask!3328)))

(assert (=> d!100899 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!339470)))

(declare-fun bs!21413 () Bool)

(assert (= bs!21413 d!100899))

(assert (=> bs!21413 m!708635))

(declare-fun m!708883 () Bool)

(assert (=> bs!21413 m!708883))

(assert (=> bs!21413 m!708659))

(assert (=> b!761708 d!100899))

(declare-fun d!100903 () Bool)

(assert (=> d!100903 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66120 d!100903))

(declare-fun d!100909 () Bool)

(assert (=> d!100909 (= (array_inv!15949 a!3186) (bvsge (size!20574 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66120 d!100909))

(declare-fun b!762087 () Bool)

(declare-fun e!424862 () Bool)

(declare-fun e!424861 () Bool)

(assert (=> b!762087 (= e!424862 e!424861)))

(declare-fun c!83817 () Bool)

(assert (=> b!762087 (= c!83817 (validKeyInArray!0 (select (arr!20153 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!100911 () Bool)

(declare-fun res!515227 () Bool)

(declare-fun e!424863 () Bool)

(assert (=> d!100911 (=> res!515227 e!424863)))

(assert (=> d!100911 (= res!515227 (bvsge #b00000000000000000000000000000000 (size!20574 a!3186)))))

(assert (=> d!100911 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14152) e!424863)))

(declare-fun b!762088 () Bool)

(declare-fun call!35000 () Bool)

(assert (=> b!762088 (= e!424861 call!35000)))

(declare-fun b!762089 () Bool)

(assert (=> b!762089 (= e!424863 e!424862)))

(declare-fun res!515226 () Bool)

(assert (=> b!762089 (=> (not res!515226) (not e!424862))))

(declare-fun e!424860 () Bool)

(assert (=> b!762089 (= res!515226 (not e!424860))))

(declare-fun res!515228 () Bool)

(assert (=> b!762089 (=> (not res!515228) (not e!424860))))

(assert (=> b!762089 (= res!515228 (validKeyInArray!0 (select (arr!20153 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!762090 () Bool)

(assert (=> b!762090 (= e!424861 call!35000)))

(declare-fun bm!34997 () Bool)

(assert (=> bm!34997 (= call!35000 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83817 (Cons!14151 (select (arr!20153 a!3186) #b00000000000000000000000000000000) Nil!14152) Nil!14152)))))

(declare-fun b!762091 () Bool)

(declare-fun contains!4074 (List!14155 (_ BitVec 64)) Bool)

(assert (=> b!762091 (= e!424860 (contains!4074 Nil!14152 (select (arr!20153 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100911 (not res!515227)) b!762089))

(assert (= (and b!762089 res!515228) b!762091))

(assert (= (and b!762089 res!515226) b!762087))

(assert (= (and b!762087 c!83817) b!762088))

(assert (= (and b!762087 (not c!83817)) b!762090))

(assert (= (or b!762088 b!762090) bm!34997))

(assert (=> b!762087 m!708745))

(assert (=> b!762087 m!708745))

(declare-fun m!708911 () Bool)

(assert (=> b!762087 m!708911))

(assert (=> b!762089 m!708745))

(assert (=> b!762089 m!708745))

(assert (=> b!762089 m!708911))

(assert (=> bm!34997 m!708745))

(declare-fun m!708913 () Bool)

(assert (=> bm!34997 m!708913))

(assert (=> b!762091 m!708745))

(assert (=> b!762091 m!708745))

(declare-fun m!708915 () Bool)

(assert (=> b!762091 m!708915))

(assert (=> b!761698 d!100911))

(declare-fun b!762092 () Bool)

(declare-fun lt!339485 () SeekEntryResult!7753)

(assert (=> b!762092 (and (bvsge (index!33382 lt!339485) #b00000000000000000000000000000000) (bvslt (index!33382 lt!339485) (size!20574 lt!339328)))))

(declare-fun res!515230 () Bool)

(assert (=> b!762092 (= res!515230 (= (select (arr!20153 lt!339328) (index!33382 lt!339485)) lt!339330))))

(declare-fun e!424866 () Bool)

(assert (=> b!762092 (=> res!515230 e!424866)))

(declare-fun e!424868 () Bool)

(assert (=> b!762092 (= e!424868 e!424866)))

(declare-fun b!762093 () Bool)

(assert (=> b!762093 (and (bvsge (index!33382 lt!339485) #b00000000000000000000000000000000) (bvslt (index!33382 lt!339485) (size!20574 lt!339328)))))

(assert (=> b!762093 (= e!424866 (= (select (arr!20153 lt!339328) (index!33382 lt!339485)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100923 () Bool)

(declare-fun e!424864 () Bool)

(assert (=> d!100923 e!424864))

(declare-fun c!83819 () Bool)

(assert (=> d!100923 (= c!83819 (and (is-Intermediate!7753 lt!339485) (undefined!8565 lt!339485)))))

(declare-fun e!424865 () SeekEntryResult!7753)

(assert (=> d!100923 (= lt!339485 e!424865)))

(declare-fun c!83818 () Bool)

(assert (=> d!100923 (= c!83818 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!339486 () (_ BitVec 64))

(assert (=> d!100923 (= lt!339486 (select (arr!20153 lt!339328) index!1321))))

(assert (=> d!100923 (validMask!0 mask!3328)))

(assert (=> d!100923 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339330 lt!339328 mask!3328) lt!339485)))

(declare-fun b!762094 () Bool)

(declare-fun e!424867 () SeekEntryResult!7753)

(assert (=> b!762094 (= e!424865 e!424867)))

(declare-fun c!83820 () Bool)

(assert (=> b!762094 (= c!83820 (or (= lt!339486 lt!339330) (= (bvadd lt!339486 lt!339486) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762095 () Bool)

(assert (=> b!762095 (= e!424865 (Intermediate!7753 true index!1321 x!1131))))

(declare-fun b!762096 () Bool)

(assert (=> b!762096 (= e!424864 e!424868)))

(declare-fun res!515229 () Bool)

(assert (=> b!762096 (= res!515229 (and (is-Intermediate!7753 lt!339485) (not (undefined!8565 lt!339485)) (bvslt (x!64284 lt!339485) #b01111111111111111111111111111110) (bvsge (x!64284 lt!339485) #b00000000000000000000000000000000) (bvsge (x!64284 lt!339485) x!1131)))))

(assert (=> b!762096 (=> (not res!515229) (not e!424868))))

(declare-fun b!762097 () Bool)

(assert (=> b!762097 (= e!424867 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!339330 lt!339328 mask!3328))))

(declare-fun b!762098 () Bool)

(assert (=> b!762098 (= e!424867 (Intermediate!7753 false index!1321 x!1131))))

(declare-fun b!762099 () Bool)

(assert (=> b!762099 (and (bvsge (index!33382 lt!339485) #b00000000000000000000000000000000) (bvslt (index!33382 lt!339485) (size!20574 lt!339328)))))

(declare-fun res!515231 () Bool)

(assert (=> b!762099 (= res!515231 (= (select (arr!20153 lt!339328) (index!33382 lt!339485)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!762099 (=> res!515231 e!424866)))

(declare-fun b!762100 () Bool)

(assert (=> b!762100 (= e!424864 (bvsge (x!64284 lt!339485) #b01111111111111111111111111111110))))

(assert (= (and d!100923 c!83818) b!762095))

(assert (= (and d!100923 (not c!83818)) b!762094))

(assert (= (and b!762094 c!83820) b!762098))

(assert (= (and b!762094 (not c!83820)) b!762097))

(assert (= (and d!100923 c!83819) b!762100))

(assert (= (and d!100923 (not c!83819)) b!762096))

(assert (= (and b!762096 res!515229) b!762092))

(assert (= (and b!762092 (not res!515230)) b!762099))

(assert (= (and b!762099 (not res!515231)) b!762093))

(declare-fun m!708917 () Bool)

(assert (=> b!762092 m!708917))

(assert (=> b!762099 m!708917))

(assert (=> b!762093 m!708917))

(assert (=> b!762097 m!708733))

(assert (=> b!762097 m!708733))

(declare-fun m!708919 () Bool)

(assert (=> b!762097 m!708919))

