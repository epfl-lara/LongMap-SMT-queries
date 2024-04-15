; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46116 () Bool)

(assert start!46116)

(declare-fun b!510755 () Bool)

(declare-fun res!311747 () Bool)

(declare-fun e!298452 () Bool)

(assert (=> b!510755 (=> (not res!311747) (not e!298452))))

(declare-datatypes ((array!32837 0))(
  ( (array!32838 (arr!15797 (Array (_ BitVec 32) (_ BitVec 64))) (size!16162 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32837)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32837 (_ BitVec 32)) Bool)

(assert (=> b!510755 (= res!311747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510756 () Bool)

(declare-fun res!311744 () Bool)

(declare-fun e!298455 () Bool)

(assert (=> b!510756 (=> (not res!311744) (not e!298455))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510756 (= res!311744 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510757 () Bool)

(declare-fun res!311750 () Bool)

(assert (=> b!510757 (=> (not res!311750) (not e!298455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510757 (= res!311750 (validKeyInArray!0 k0!2280))))

(declare-fun b!510758 () Bool)

(assert (=> b!510758 (= e!298455 e!298452)))

(declare-fun res!311746 () Bool)

(assert (=> b!510758 (=> (not res!311746) (not e!298452))))

(declare-datatypes ((SeekEntryResult!4261 0))(
  ( (MissingZero!4261 (index!19232 (_ BitVec 32))) (Found!4261 (index!19233 (_ BitVec 32))) (Intermediate!4261 (undefined!5073 Bool) (index!19234 (_ BitVec 32)) (x!48193 (_ BitVec 32))) (Undefined!4261) (MissingVacant!4261 (index!19235 (_ BitVec 32))) )
))
(declare-fun lt!233543 () SeekEntryResult!4261)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510758 (= res!311746 (or (= lt!233543 (MissingZero!4261 i!1204)) (= lt!233543 (MissingVacant!4261 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32837 (_ BitVec 32)) SeekEntryResult!4261)

(assert (=> b!510758 (= lt!233543 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510759 () Bool)

(declare-fun e!298454 () Bool)

(assert (=> b!510759 (= e!298452 (not e!298454))))

(declare-fun res!311745 () Bool)

(assert (=> b!510759 (=> res!311745 e!298454)))

(declare-fun lt!233545 () SeekEntryResult!4261)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!233542 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32837 (_ BitVec 32)) SeekEntryResult!4261)

(assert (=> b!510759 (= res!311745 (= lt!233545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233542 (select (store (arr!15797 a!3235) i!1204 k0!2280) j!176) (array!32838 (store (arr!15797 a!3235) i!1204 k0!2280) (size!16162 a!3235)) mask!3524)))))

(declare-fun lt!233540 () (_ BitVec 32))

(assert (=> b!510759 (= lt!233545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233540 (select (arr!15797 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510759 (= lt!233542 (toIndex!0 (select (store (arr!15797 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510759 (= lt!233540 (toIndex!0 (select (arr!15797 a!3235) j!176) mask!3524))))

(declare-fun lt!233544 () SeekEntryResult!4261)

(assert (=> b!510759 (= lt!233544 (Found!4261 j!176))))

(assert (=> b!510759 (= lt!233544 (seekEntryOrOpen!0 (select (arr!15797 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510759 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15766 0))(
  ( (Unit!15767) )
))
(declare-fun lt!233541 () Unit!15766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15766)

(assert (=> b!510759 (= lt!233541 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!311743 () Bool)

(assert (=> start!46116 (=> (not res!311743) (not e!298455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46116 (= res!311743 (validMask!0 mask!3524))))

(assert (=> start!46116 e!298455))

(assert (=> start!46116 true))

(declare-fun array_inv!11680 (array!32837) Bool)

(assert (=> start!46116 (array_inv!11680 a!3235)))

(declare-fun b!510760 () Bool)

(get-info :version)

(assert (=> b!510760 (= e!298454 (or (not ((_ is Intermediate!4261) lt!233545)) (not (undefined!5073 lt!233545)) (= lt!233544 Undefined!4261)))))

(declare-fun b!510761 () Bool)

(declare-fun res!311748 () Bool)

(assert (=> b!510761 (=> (not res!311748) (not e!298455))))

(assert (=> b!510761 (= res!311748 (and (= (size!16162 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16162 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16162 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510762 () Bool)

(declare-fun res!311742 () Bool)

(assert (=> b!510762 (=> (not res!311742) (not e!298452))))

(declare-datatypes ((List!9994 0))(
  ( (Nil!9991) (Cons!9990 (h!10867 (_ BitVec 64)) (t!16213 List!9994)) )
))
(declare-fun arrayNoDuplicates!0 (array!32837 (_ BitVec 32) List!9994) Bool)

(assert (=> b!510762 (= res!311742 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9991))))

(declare-fun b!510763 () Bool)

(declare-fun res!311749 () Bool)

(assert (=> b!510763 (=> (not res!311749) (not e!298455))))

(assert (=> b!510763 (= res!311749 (validKeyInArray!0 (select (arr!15797 a!3235) j!176)))))

(assert (= (and start!46116 res!311743) b!510761))

(assert (= (and b!510761 res!311748) b!510763))

(assert (= (and b!510763 res!311749) b!510757))

(assert (= (and b!510757 res!311750) b!510756))

(assert (= (and b!510756 res!311744) b!510758))

(assert (= (and b!510758 res!311746) b!510755))

(assert (= (and b!510755 res!311747) b!510762))

(assert (= (and b!510762 res!311742) b!510759))

(assert (= (and b!510759 (not res!311745)) b!510760))

(declare-fun m!491785 () Bool)

(assert (=> b!510756 m!491785))

(declare-fun m!491787 () Bool)

(assert (=> start!46116 m!491787))

(declare-fun m!491789 () Bool)

(assert (=> start!46116 m!491789))

(declare-fun m!491791 () Bool)

(assert (=> b!510762 m!491791))

(declare-fun m!491793 () Bool)

(assert (=> b!510763 m!491793))

(assert (=> b!510763 m!491793))

(declare-fun m!491795 () Bool)

(assert (=> b!510763 m!491795))

(declare-fun m!491797 () Bool)

(assert (=> b!510758 m!491797))

(declare-fun m!491799 () Bool)

(assert (=> b!510759 m!491799))

(declare-fun m!491801 () Bool)

(assert (=> b!510759 m!491801))

(declare-fun m!491803 () Bool)

(assert (=> b!510759 m!491803))

(assert (=> b!510759 m!491793))

(declare-fun m!491805 () Bool)

(assert (=> b!510759 m!491805))

(declare-fun m!491807 () Bool)

(assert (=> b!510759 m!491807))

(assert (=> b!510759 m!491799))

(assert (=> b!510759 m!491793))

(declare-fun m!491809 () Bool)

(assert (=> b!510759 m!491809))

(assert (=> b!510759 m!491793))

(declare-fun m!491811 () Bool)

(assert (=> b!510759 m!491811))

(assert (=> b!510759 m!491793))

(declare-fun m!491813 () Bool)

(assert (=> b!510759 m!491813))

(assert (=> b!510759 m!491799))

(declare-fun m!491815 () Bool)

(assert (=> b!510759 m!491815))

(declare-fun m!491817 () Bool)

(assert (=> b!510757 m!491817))

(declare-fun m!491819 () Bool)

(assert (=> b!510755 m!491819))

(check-sat (not b!510757) (not start!46116) (not b!510763) (not b!510759) (not b!510762) (not b!510755) (not b!510758) (not b!510756))
(check-sat)
(get-model)

(declare-fun d!78665 () Bool)

(declare-fun lt!233587 () (_ BitVec 32))

(declare-fun lt!233586 () (_ BitVec 32))

(assert (=> d!78665 (= lt!233587 (bvmul (bvxor lt!233586 (bvlshr lt!233586 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78665 (= lt!233586 ((_ extract 31 0) (bvand (bvxor (select (arr!15797 a!3235) j!176) (bvlshr (select (arr!15797 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78665 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!311805 (let ((h!10870 ((_ extract 31 0) (bvand (bvxor (select (arr!15797 a!3235) j!176) (bvlshr (select (arr!15797 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48196 (bvmul (bvxor h!10870 (bvlshr h!10870 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48196 (bvlshr x!48196 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!311805 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!311805 #b00000000000000000000000000000000))))))

(assert (=> d!78665 (= (toIndex!0 (select (arr!15797 a!3235) j!176) mask!3524) (bvand (bvxor lt!233587 (bvlshr lt!233587 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!510759 d!78665))

(declare-fun d!78667 () Bool)

(declare-fun lt!233594 () SeekEntryResult!4261)

(assert (=> d!78667 (and (or ((_ is Undefined!4261) lt!233594) (not ((_ is Found!4261) lt!233594)) (and (bvsge (index!19233 lt!233594) #b00000000000000000000000000000000) (bvslt (index!19233 lt!233594) (size!16162 a!3235)))) (or ((_ is Undefined!4261) lt!233594) ((_ is Found!4261) lt!233594) (not ((_ is MissingZero!4261) lt!233594)) (and (bvsge (index!19232 lt!233594) #b00000000000000000000000000000000) (bvslt (index!19232 lt!233594) (size!16162 a!3235)))) (or ((_ is Undefined!4261) lt!233594) ((_ is Found!4261) lt!233594) ((_ is MissingZero!4261) lt!233594) (not ((_ is MissingVacant!4261) lt!233594)) (and (bvsge (index!19235 lt!233594) #b00000000000000000000000000000000) (bvslt (index!19235 lt!233594) (size!16162 a!3235)))) (or ((_ is Undefined!4261) lt!233594) (ite ((_ is Found!4261) lt!233594) (= (select (arr!15797 a!3235) (index!19233 lt!233594)) (select (arr!15797 a!3235) j!176)) (ite ((_ is MissingZero!4261) lt!233594) (= (select (arr!15797 a!3235) (index!19232 lt!233594)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4261) lt!233594) (= (select (arr!15797 a!3235) (index!19235 lt!233594)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!298487 () SeekEntryResult!4261)

(assert (=> d!78667 (= lt!233594 e!298487)))

(declare-fun c!59793 () Bool)

(declare-fun lt!233596 () SeekEntryResult!4261)

(assert (=> d!78667 (= c!59793 (and ((_ is Intermediate!4261) lt!233596) (undefined!5073 lt!233596)))))

(assert (=> d!78667 (= lt!233596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15797 a!3235) j!176) mask!3524) (select (arr!15797 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78667 (validMask!0 mask!3524)))

(assert (=> d!78667 (= (seekEntryOrOpen!0 (select (arr!15797 a!3235) j!176) a!3235 mask!3524) lt!233594)))

(declare-fun b!510830 () Bool)

(assert (=> b!510830 (= e!298487 Undefined!4261)))

(declare-fun b!510831 () Bool)

(declare-fun e!298486 () SeekEntryResult!4261)

(assert (=> b!510831 (= e!298486 (MissingZero!4261 (index!19234 lt!233596)))))

(declare-fun b!510832 () Bool)

(declare-fun e!298488 () SeekEntryResult!4261)

(assert (=> b!510832 (= e!298487 e!298488)))

(declare-fun lt!233595 () (_ BitVec 64))

(assert (=> b!510832 (= lt!233595 (select (arr!15797 a!3235) (index!19234 lt!233596)))))

(declare-fun c!59792 () Bool)

(assert (=> b!510832 (= c!59792 (= lt!233595 (select (arr!15797 a!3235) j!176)))))

(declare-fun b!510833 () Bool)

(assert (=> b!510833 (= e!298488 (Found!4261 (index!19234 lt!233596)))))

(declare-fun b!510834 () Bool)

(declare-fun c!59791 () Bool)

(assert (=> b!510834 (= c!59791 (= lt!233595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!510834 (= e!298488 e!298486)))

(declare-fun b!510835 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32837 (_ BitVec 32)) SeekEntryResult!4261)

(assert (=> b!510835 (= e!298486 (seekKeyOrZeroReturnVacant!0 (x!48193 lt!233596) (index!19234 lt!233596) (index!19234 lt!233596) (select (arr!15797 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!78667 c!59793) b!510830))

(assert (= (and d!78667 (not c!59793)) b!510832))

(assert (= (and b!510832 c!59792) b!510833))

(assert (= (and b!510832 (not c!59792)) b!510834))

(assert (= (and b!510834 c!59791) b!510831))

(assert (= (and b!510834 (not c!59791)) b!510835))

(assert (=> d!78667 m!491793))

(assert (=> d!78667 m!491809))

(declare-fun m!491893 () Bool)

(assert (=> d!78667 m!491893))

(assert (=> d!78667 m!491787))

(assert (=> d!78667 m!491809))

(assert (=> d!78667 m!491793))

(declare-fun m!491895 () Bool)

(assert (=> d!78667 m!491895))

(declare-fun m!491897 () Bool)

(assert (=> d!78667 m!491897))

(declare-fun m!491899 () Bool)

(assert (=> d!78667 m!491899))

(declare-fun m!491901 () Bool)

(assert (=> b!510832 m!491901))

(assert (=> b!510835 m!491793))

(declare-fun m!491903 () Bool)

(assert (=> b!510835 m!491903))

(assert (=> b!510759 d!78667))

(declare-fun d!78669 () Bool)

(declare-fun res!311811 () Bool)

(declare-fun e!298497 () Bool)

(assert (=> d!78669 (=> res!311811 e!298497)))

(assert (=> d!78669 (= res!311811 (bvsge j!176 (size!16162 a!3235)))))

(assert (=> d!78669 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!298497)))

(declare-fun b!510844 () Bool)

(declare-fun e!298496 () Bool)

(assert (=> b!510844 (= e!298497 e!298496)))

(declare-fun c!59796 () Bool)

(assert (=> b!510844 (= c!59796 (validKeyInArray!0 (select (arr!15797 a!3235) j!176)))))

(declare-fun b!510845 () Bool)

(declare-fun call!31471 () Bool)

(assert (=> b!510845 (= e!298496 call!31471)))

(declare-fun b!510846 () Bool)

(declare-fun e!298495 () Bool)

(assert (=> b!510846 (= e!298496 e!298495)))

(declare-fun lt!233604 () (_ BitVec 64))

(assert (=> b!510846 (= lt!233604 (select (arr!15797 a!3235) j!176))))

(declare-fun lt!233605 () Unit!15766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32837 (_ BitVec 64) (_ BitVec 32)) Unit!15766)

(assert (=> b!510846 (= lt!233605 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!233604 j!176))))

(assert (=> b!510846 (arrayContainsKey!0 a!3235 lt!233604 #b00000000000000000000000000000000)))

(declare-fun lt!233603 () Unit!15766)

(assert (=> b!510846 (= lt!233603 lt!233605)))

(declare-fun res!311810 () Bool)

(assert (=> b!510846 (= res!311810 (= (seekEntryOrOpen!0 (select (arr!15797 a!3235) j!176) a!3235 mask!3524) (Found!4261 j!176)))))

(assert (=> b!510846 (=> (not res!311810) (not e!298495))))

(declare-fun b!510847 () Bool)

(assert (=> b!510847 (= e!298495 call!31471)))

(declare-fun bm!31468 () Bool)

(assert (=> bm!31468 (= call!31471 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!78669 (not res!311811)) b!510844))

(assert (= (and b!510844 c!59796) b!510846))

(assert (= (and b!510844 (not c!59796)) b!510845))

(assert (= (and b!510846 res!311810) b!510847))

(assert (= (or b!510847 b!510845) bm!31468))

(assert (=> b!510844 m!491793))

(assert (=> b!510844 m!491793))

(assert (=> b!510844 m!491795))

(assert (=> b!510846 m!491793))

(declare-fun m!491905 () Bool)

(assert (=> b!510846 m!491905))

(declare-fun m!491907 () Bool)

(assert (=> b!510846 m!491907))

(assert (=> b!510846 m!491793))

(assert (=> b!510846 m!491813))

(declare-fun m!491909 () Bool)

(assert (=> bm!31468 m!491909))

(assert (=> b!510759 d!78669))

(declare-fun d!78671 () Bool)

(declare-fun e!298528 () Bool)

(assert (=> d!78671 e!298528))

(declare-fun c!59806 () Bool)

(declare-fun lt!233610 () SeekEntryResult!4261)

(assert (=> d!78671 (= c!59806 (and ((_ is Intermediate!4261) lt!233610) (undefined!5073 lt!233610)))))

(declare-fun e!298529 () SeekEntryResult!4261)

(assert (=> d!78671 (= lt!233610 e!298529)))

(declare-fun c!59807 () Bool)

(assert (=> d!78671 (= c!59807 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!233611 () (_ BitVec 64))

(assert (=> d!78671 (= lt!233611 (select (arr!15797 (array!32838 (store (arr!15797 a!3235) i!1204 k0!2280) (size!16162 a!3235))) lt!233542))))

(assert (=> d!78671 (validMask!0 mask!3524)))

(assert (=> d!78671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233542 (select (store (arr!15797 a!3235) i!1204 k0!2280) j!176) (array!32838 (store (arr!15797 a!3235) i!1204 k0!2280) (size!16162 a!3235)) mask!3524) lt!233610)))

(declare-fun b!510887 () Bool)

(assert (=> b!510887 (and (bvsge (index!19234 lt!233610) #b00000000000000000000000000000000) (bvslt (index!19234 lt!233610) (size!16162 (array!32838 (store (arr!15797 a!3235) i!1204 k0!2280) (size!16162 a!3235)))))))

(declare-fun res!311834 () Bool)

(assert (=> b!510887 (= res!311834 (= (select (arr!15797 (array!32838 (store (arr!15797 a!3235) i!1204 k0!2280) (size!16162 a!3235))) (index!19234 lt!233610)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!298527 () Bool)

(assert (=> b!510887 (=> res!311834 e!298527)))

(declare-fun b!510888 () Bool)

(assert (=> b!510888 (= e!298528 (bvsge (x!48193 lt!233610) #b01111111111111111111111111111110))))

(declare-fun b!510889 () Bool)

(declare-fun e!298530 () SeekEntryResult!4261)

(assert (=> b!510889 (= e!298529 e!298530)))

(declare-fun c!59808 () Bool)

(assert (=> b!510889 (= c!59808 (or (= lt!233611 (select (store (arr!15797 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!233611 lt!233611) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!510890 () Bool)

(assert (=> b!510890 (= e!298530 (Intermediate!4261 false lt!233542 #b00000000000000000000000000000000))))

(declare-fun b!510891 () Bool)

(declare-fun e!298526 () Bool)

(assert (=> b!510891 (= e!298528 e!298526)))

(declare-fun res!311833 () Bool)

(assert (=> b!510891 (= res!311833 (and ((_ is Intermediate!4261) lt!233610) (not (undefined!5073 lt!233610)) (bvslt (x!48193 lt!233610) #b01111111111111111111111111111110) (bvsge (x!48193 lt!233610) #b00000000000000000000000000000000) (bvsge (x!48193 lt!233610) #b00000000000000000000000000000000)))))

(assert (=> b!510891 (=> (not res!311833) (not e!298526))))

(declare-fun b!510892 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510892 (= e!298530 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!233542 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15797 a!3235) i!1204 k0!2280) j!176) (array!32838 (store (arr!15797 a!3235) i!1204 k0!2280) (size!16162 a!3235)) mask!3524))))

(declare-fun b!510893 () Bool)

(assert (=> b!510893 (and (bvsge (index!19234 lt!233610) #b00000000000000000000000000000000) (bvslt (index!19234 lt!233610) (size!16162 (array!32838 (store (arr!15797 a!3235) i!1204 k0!2280) (size!16162 a!3235)))))))

(declare-fun res!311835 () Bool)

(assert (=> b!510893 (= res!311835 (= (select (arr!15797 (array!32838 (store (arr!15797 a!3235) i!1204 k0!2280) (size!16162 a!3235))) (index!19234 lt!233610)) (select (store (arr!15797 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!510893 (=> res!311835 e!298527)))

(assert (=> b!510893 (= e!298526 e!298527)))

(declare-fun b!510894 () Bool)

(assert (=> b!510894 (and (bvsge (index!19234 lt!233610) #b00000000000000000000000000000000) (bvslt (index!19234 lt!233610) (size!16162 (array!32838 (store (arr!15797 a!3235) i!1204 k0!2280) (size!16162 a!3235)))))))

(assert (=> b!510894 (= e!298527 (= (select (arr!15797 (array!32838 (store (arr!15797 a!3235) i!1204 k0!2280) (size!16162 a!3235))) (index!19234 lt!233610)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!510895 () Bool)

(assert (=> b!510895 (= e!298529 (Intermediate!4261 true lt!233542 #b00000000000000000000000000000000))))

(assert (= (and d!78671 c!59807) b!510895))

(assert (= (and d!78671 (not c!59807)) b!510889))

(assert (= (and b!510889 c!59808) b!510890))

(assert (= (and b!510889 (not c!59808)) b!510892))

(assert (= (and d!78671 c!59806) b!510888))

(assert (= (and d!78671 (not c!59806)) b!510891))

(assert (= (and b!510891 res!311833) b!510893))

(assert (= (and b!510893 (not res!311835)) b!510887))

(assert (= (and b!510887 (not res!311834)) b!510894))

(declare-fun m!491921 () Bool)

(assert (=> b!510892 m!491921))

(assert (=> b!510892 m!491921))

(assert (=> b!510892 m!491799))

(declare-fun m!491923 () Bool)

(assert (=> b!510892 m!491923))

(declare-fun m!491925 () Bool)

(assert (=> b!510894 m!491925))

(assert (=> b!510893 m!491925))

(assert (=> b!510887 m!491925))

(declare-fun m!491927 () Bool)

(assert (=> d!78671 m!491927))

(assert (=> d!78671 m!491787))

(assert (=> b!510759 d!78671))

(declare-fun d!78683 () Bool)

(declare-fun e!298533 () Bool)

(assert (=> d!78683 e!298533))

(declare-fun c!59809 () Bool)

(declare-fun lt!233612 () SeekEntryResult!4261)

(assert (=> d!78683 (= c!59809 (and ((_ is Intermediate!4261) lt!233612) (undefined!5073 lt!233612)))))

(declare-fun e!298534 () SeekEntryResult!4261)

(assert (=> d!78683 (= lt!233612 e!298534)))

(declare-fun c!59810 () Bool)

(assert (=> d!78683 (= c!59810 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!233613 () (_ BitVec 64))

(assert (=> d!78683 (= lt!233613 (select (arr!15797 a!3235) lt!233540))))

(assert (=> d!78683 (validMask!0 mask!3524)))

(assert (=> d!78683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233540 (select (arr!15797 a!3235) j!176) a!3235 mask!3524) lt!233612)))

(declare-fun b!510896 () Bool)

(assert (=> b!510896 (and (bvsge (index!19234 lt!233612) #b00000000000000000000000000000000) (bvslt (index!19234 lt!233612) (size!16162 a!3235)))))

(declare-fun res!311837 () Bool)

(assert (=> b!510896 (= res!311837 (= (select (arr!15797 a!3235) (index!19234 lt!233612)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!298532 () Bool)

(assert (=> b!510896 (=> res!311837 e!298532)))

(declare-fun b!510897 () Bool)

(assert (=> b!510897 (= e!298533 (bvsge (x!48193 lt!233612) #b01111111111111111111111111111110))))

(declare-fun b!510898 () Bool)

(declare-fun e!298535 () SeekEntryResult!4261)

(assert (=> b!510898 (= e!298534 e!298535)))

(declare-fun c!59811 () Bool)

(assert (=> b!510898 (= c!59811 (or (= lt!233613 (select (arr!15797 a!3235) j!176)) (= (bvadd lt!233613 lt!233613) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!510899 () Bool)

(assert (=> b!510899 (= e!298535 (Intermediate!4261 false lt!233540 #b00000000000000000000000000000000))))

(declare-fun b!510900 () Bool)

(declare-fun e!298531 () Bool)

(assert (=> b!510900 (= e!298533 e!298531)))

(declare-fun res!311836 () Bool)

(assert (=> b!510900 (= res!311836 (and ((_ is Intermediate!4261) lt!233612) (not (undefined!5073 lt!233612)) (bvslt (x!48193 lt!233612) #b01111111111111111111111111111110) (bvsge (x!48193 lt!233612) #b00000000000000000000000000000000) (bvsge (x!48193 lt!233612) #b00000000000000000000000000000000)))))

(assert (=> b!510900 (=> (not res!311836) (not e!298531))))

(declare-fun b!510901 () Bool)

(assert (=> b!510901 (= e!298535 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!233540 #b00000000000000000000000000000000 mask!3524) (select (arr!15797 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!510902 () Bool)

(assert (=> b!510902 (and (bvsge (index!19234 lt!233612) #b00000000000000000000000000000000) (bvslt (index!19234 lt!233612) (size!16162 a!3235)))))

(declare-fun res!311838 () Bool)

(assert (=> b!510902 (= res!311838 (= (select (arr!15797 a!3235) (index!19234 lt!233612)) (select (arr!15797 a!3235) j!176)))))

(assert (=> b!510902 (=> res!311838 e!298532)))

(assert (=> b!510902 (= e!298531 e!298532)))

(declare-fun b!510903 () Bool)

(assert (=> b!510903 (and (bvsge (index!19234 lt!233612) #b00000000000000000000000000000000) (bvslt (index!19234 lt!233612) (size!16162 a!3235)))))

(assert (=> b!510903 (= e!298532 (= (select (arr!15797 a!3235) (index!19234 lt!233612)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!510904 () Bool)

(assert (=> b!510904 (= e!298534 (Intermediate!4261 true lt!233540 #b00000000000000000000000000000000))))

(assert (= (and d!78683 c!59810) b!510904))

(assert (= (and d!78683 (not c!59810)) b!510898))

(assert (= (and b!510898 c!59811) b!510899))

(assert (= (and b!510898 (not c!59811)) b!510901))

(assert (= (and d!78683 c!59809) b!510897))

(assert (= (and d!78683 (not c!59809)) b!510900))

(assert (= (and b!510900 res!311836) b!510902))

(assert (= (and b!510902 (not res!311838)) b!510896))

(assert (= (and b!510896 (not res!311837)) b!510903))

(declare-fun m!491929 () Bool)

(assert (=> b!510901 m!491929))

(assert (=> b!510901 m!491929))

(assert (=> b!510901 m!491793))

(declare-fun m!491931 () Bool)

(assert (=> b!510901 m!491931))

(declare-fun m!491933 () Bool)

(assert (=> b!510903 m!491933))

(assert (=> b!510902 m!491933))

(assert (=> b!510896 m!491933))

(declare-fun m!491935 () Bool)

(assert (=> d!78683 m!491935))

(assert (=> d!78683 m!491787))

(assert (=> b!510759 d!78683))

(declare-fun d!78685 () Bool)

(assert (=> d!78685 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233616 () Unit!15766)

(declare-fun choose!38 (array!32837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15766)

(assert (=> d!78685 (= lt!233616 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78685 (validMask!0 mask!3524)))

(assert (=> d!78685 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!233616)))

(declare-fun bs!16162 () Bool)

(assert (= bs!16162 d!78685))

(assert (=> bs!16162 m!491811))

(declare-fun m!491937 () Bool)

(assert (=> bs!16162 m!491937))

(assert (=> bs!16162 m!491787))

(assert (=> b!510759 d!78685))

(declare-fun d!78691 () Bool)

(declare-fun lt!233618 () (_ BitVec 32))

(declare-fun lt!233617 () (_ BitVec 32))

(assert (=> d!78691 (= lt!233618 (bvmul (bvxor lt!233617 (bvlshr lt!233617 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78691 (= lt!233617 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15797 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15797 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78691 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!311805 (let ((h!10870 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15797 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15797 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48196 (bvmul (bvxor h!10870 (bvlshr h!10870 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48196 (bvlshr x!48196 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!311805 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!311805 #b00000000000000000000000000000000))))))

(assert (=> d!78691 (= (toIndex!0 (select (store (arr!15797 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!233618 (bvlshr lt!233618 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!510759 d!78691))

(declare-fun d!78693 () Bool)

(assert (=> d!78693 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46116 d!78693))

(declare-fun d!78695 () Bool)

(assert (=> d!78695 (= (array_inv!11680 a!3235) (bvsge (size!16162 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46116 d!78695))

(declare-fun d!78697 () Bool)

(assert (=> d!78697 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!510757 d!78697))

(declare-fun d!78699 () Bool)

(assert (=> d!78699 (= (validKeyInArray!0 (select (arr!15797 a!3235) j!176)) (and (not (= (select (arr!15797 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15797 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!510763 d!78699))

(declare-fun d!78701 () Bool)

(declare-fun lt!233628 () SeekEntryResult!4261)

(assert (=> d!78701 (and (or ((_ is Undefined!4261) lt!233628) (not ((_ is Found!4261) lt!233628)) (and (bvsge (index!19233 lt!233628) #b00000000000000000000000000000000) (bvslt (index!19233 lt!233628) (size!16162 a!3235)))) (or ((_ is Undefined!4261) lt!233628) ((_ is Found!4261) lt!233628) (not ((_ is MissingZero!4261) lt!233628)) (and (bvsge (index!19232 lt!233628) #b00000000000000000000000000000000) (bvslt (index!19232 lt!233628) (size!16162 a!3235)))) (or ((_ is Undefined!4261) lt!233628) ((_ is Found!4261) lt!233628) ((_ is MissingZero!4261) lt!233628) (not ((_ is MissingVacant!4261) lt!233628)) (and (bvsge (index!19235 lt!233628) #b00000000000000000000000000000000) (bvslt (index!19235 lt!233628) (size!16162 a!3235)))) (or ((_ is Undefined!4261) lt!233628) (ite ((_ is Found!4261) lt!233628) (= (select (arr!15797 a!3235) (index!19233 lt!233628)) k0!2280) (ite ((_ is MissingZero!4261) lt!233628) (= (select (arr!15797 a!3235) (index!19232 lt!233628)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4261) lt!233628) (= (select (arr!15797 a!3235) (index!19235 lt!233628)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!298546 () SeekEntryResult!4261)

(assert (=> d!78701 (= lt!233628 e!298546)))

(declare-fun c!59823 () Bool)

(declare-fun lt!233630 () SeekEntryResult!4261)

(assert (=> d!78701 (= c!59823 (and ((_ is Intermediate!4261) lt!233630) (undefined!5073 lt!233630)))))

(assert (=> d!78701 (= lt!233630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78701 (validMask!0 mask!3524)))

(assert (=> d!78701 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!233628)))

(declare-fun b!510923 () Bool)

(assert (=> b!510923 (= e!298546 Undefined!4261)))

(declare-fun b!510924 () Bool)

(declare-fun e!298545 () SeekEntryResult!4261)

(assert (=> b!510924 (= e!298545 (MissingZero!4261 (index!19234 lt!233630)))))

(declare-fun b!510925 () Bool)

(declare-fun e!298547 () SeekEntryResult!4261)

(assert (=> b!510925 (= e!298546 e!298547)))

(declare-fun lt!233629 () (_ BitVec 64))

(assert (=> b!510925 (= lt!233629 (select (arr!15797 a!3235) (index!19234 lt!233630)))))

(declare-fun c!59822 () Bool)

(assert (=> b!510925 (= c!59822 (= lt!233629 k0!2280))))

(declare-fun b!510926 () Bool)

(assert (=> b!510926 (= e!298547 (Found!4261 (index!19234 lt!233630)))))

(declare-fun b!510927 () Bool)

(declare-fun c!59821 () Bool)

(assert (=> b!510927 (= c!59821 (= lt!233629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!510927 (= e!298547 e!298545)))

(declare-fun b!510928 () Bool)

(assert (=> b!510928 (= e!298545 (seekKeyOrZeroReturnVacant!0 (x!48193 lt!233630) (index!19234 lt!233630) (index!19234 lt!233630) k0!2280 a!3235 mask!3524))))

(assert (= (and d!78701 c!59823) b!510923))

(assert (= (and d!78701 (not c!59823)) b!510925))

(assert (= (and b!510925 c!59822) b!510926))

(assert (= (and b!510925 (not c!59822)) b!510927))

(assert (= (and b!510927 c!59821) b!510924))

(assert (= (and b!510927 (not c!59821)) b!510928))

(declare-fun m!491953 () Bool)

(assert (=> d!78701 m!491953))

(declare-fun m!491955 () Bool)

(assert (=> d!78701 m!491955))

(assert (=> d!78701 m!491787))

(assert (=> d!78701 m!491953))

(declare-fun m!491957 () Bool)

(assert (=> d!78701 m!491957))

(declare-fun m!491959 () Bool)

(assert (=> d!78701 m!491959))

(declare-fun m!491961 () Bool)

(assert (=> d!78701 m!491961))

(declare-fun m!491963 () Bool)

(assert (=> b!510925 m!491963))

(declare-fun m!491965 () Bool)

(assert (=> b!510928 m!491965))

(assert (=> b!510758 d!78701))

(declare-fun d!78705 () Bool)

(declare-fun res!311843 () Bool)

(declare-fun e!298554 () Bool)

(assert (=> d!78705 (=> res!311843 e!298554)))

(assert (=> d!78705 (= res!311843 (= (select (arr!15797 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78705 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!298554)))

(declare-fun b!510937 () Bool)

(declare-fun e!298555 () Bool)

(assert (=> b!510937 (= e!298554 e!298555)))

(declare-fun res!311844 () Bool)

(assert (=> b!510937 (=> (not res!311844) (not e!298555))))

(assert (=> b!510937 (= res!311844 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16162 a!3235)))))

(declare-fun b!510938 () Bool)

(assert (=> b!510938 (= e!298555 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78705 (not res!311843)) b!510937))

(assert (= (and b!510937 res!311844) b!510938))

(declare-fun m!491967 () Bool)

(assert (=> d!78705 m!491967))

(declare-fun m!491969 () Bool)

(assert (=> b!510938 m!491969))

(assert (=> b!510756 d!78705))

(declare-fun b!510963 () Bool)

(declare-fun e!298571 () Bool)

(declare-fun e!298572 () Bool)

(assert (=> b!510963 (= e!298571 e!298572)))

(declare-fun c!59835 () Bool)

(assert (=> b!510963 (= c!59835 (validKeyInArray!0 (select (arr!15797 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78707 () Bool)

(declare-fun res!311852 () Bool)

(declare-fun e!298573 () Bool)

(assert (=> d!78707 (=> res!311852 e!298573)))

(assert (=> d!78707 (= res!311852 (bvsge #b00000000000000000000000000000000 (size!16162 a!3235)))))

(assert (=> d!78707 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9991) e!298573)))

(declare-fun bm!31474 () Bool)

(declare-fun call!31477 () Bool)

(assert (=> bm!31474 (= call!31477 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59835 (Cons!9990 (select (arr!15797 a!3235) #b00000000000000000000000000000000) Nil!9991) Nil!9991)))))

(declare-fun b!510964 () Bool)

(assert (=> b!510964 (= e!298572 call!31477)))

(declare-fun b!510965 () Bool)

(assert (=> b!510965 (= e!298573 e!298571)))

(declare-fun res!311851 () Bool)

(assert (=> b!510965 (=> (not res!311851) (not e!298571))))

(declare-fun e!298574 () Bool)

(assert (=> b!510965 (= res!311851 (not e!298574))))

(declare-fun res!311853 () Bool)

(assert (=> b!510965 (=> (not res!311853) (not e!298574))))

(assert (=> b!510965 (= res!311853 (validKeyInArray!0 (select (arr!15797 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!510966 () Bool)

(declare-fun contains!2708 (List!9994 (_ BitVec 64)) Bool)

(assert (=> b!510966 (= e!298574 (contains!2708 Nil!9991 (select (arr!15797 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!510967 () Bool)

(assert (=> b!510967 (= e!298572 call!31477)))

(assert (= (and d!78707 (not res!311852)) b!510965))

(assert (= (and b!510965 res!311853) b!510966))

(assert (= (and b!510965 res!311851) b!510963))

(assert (= (and b!510963 c!59835) b!510967))

(assert (= (and b!510963 (not c!59835)) b!510964))

(assert (= (or b!510967 b!510964) bm!31474))

(assert (=> b!510963 m!491967))

(assert (=> b!510963 m!491967))

(declare-fun m!491985 () Bool)

(assert (=> b!510963 m!491985))

(assert (=> bm!31474 m!491967))

(declare-fun m!491987 () Bool)

(assert (=> bm!31474 m!491987))

(assert (=> b!510965 m!491967))

(assert (=> b!510965 m!491967))

(assert (=> b!510965 m!491985))

(assert (=> b!510966 m!491967))

(assert (=> b!510966 m!491967))

(declare-fun m!491989 () Bool)

(assert (=> b!510966 m!491989))

(assert (=> b!510762 d!78707))

(declare-fun d!78711 () Bool)

(declare-fun res!311855 () Bool)

(declare-fun e!298577 () Bool)

(assert (=> d!78711 (=> res!311855 e!298577)))

(assert (=> d!78711 (= res!311855 (bvsge #b00000000000000000000000000000000 (size!16162 a!3235)))))

(assert (=> d!78711 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!298577)))

(declare-fun b!510968 () Bool)

(declare-fun e!298576 () Bool)

(assert (=> b!510968 (= e!298577 e!298576)))

(declare-fun c!59836 () Bool)

(assert (=> b!510968 (= c!59836 (validKeyInArray!0 (select (arr!15797 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!510969 () Bool)

(declare-fun call!31478 () Bool)

(assert (=> b!510969 (= e!298576 call!31478)))

(declare-fun b!510970 () Bool)

(declare-fun e!298575 () Bool)

(assert (=> b!510970 (= e!298576 e!298575)))

(declare-fun lt!233641 () (_ BitVec 64))

(assert (=> b!510970 (= lt!233641 (select (arr!15797 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!233642 () Unit!15766)

(assert (=> b!510970 (= lt!233642 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!233641 #b00000000000000000000000000000000))))

(assert (=> b!510970 (arrayContainsKey!0 a!3235 lt!233641 #b00000000000000000000000000000000)))

(declare-fun lt!233640 () Unit!15766)

(assert (=> b!510970 (= lt!233640 lt!233642)))

(declare-fun res!311854 () Bool)

(assert (=> b!510970 (= res!311854 (= (seekEntryOrOpen!0 (select (arr!15797 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4261 #b00000000000000000000000000000000)))))

(assert (=> b!510970 (=> (not res!311854) (not e!298575))))

(declare-fun b!510971 () Bool)

(assert (=> b!510971 (= e!298575 call!31478)))

(declare-fun bm!31475 () Bool)

(assert (=> bm!31475 (= call!31478 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!78711 (not res!311855)) b!510968))

(assert (= (and b!510968 c!59836) b!510970))

(assert (= (and b!510968 (not c!59836)) b!510969))

(assert (= (and b!510970 res!311854) b!510971))

(assert (= (or b!510971 b!510969) bm!31475))

(assert (=> b!510968 m!491967))

(assert (=> b!510968 m!491967))

(assert (=> b!510968 m!491985))

(assert (=> b!510970 m!491967))

(declare-fun m!491991 () Bool)

(assert (=> b!510970 m!491991))

(declare-fun m!491993 () Bool)

(assert (=> b!510970 m!491993))

(assert (=> b!510970 m!491967))

(declare-fun m!491995 () Bool)

(assert (=> b!510970 m!491995))

(declare-fun m!491997 () Bool)

(assert (=> bm!31475 m!491997))

(assert (=> b!510755 d!78711))

(check-sat (not b!510901) (not bm!31474) (not b!510963) (not d!78683) (not b!510835) (not b!510970) (not b!510968) (not b!510892) (not b!510846) (not b!510965) (not d!78701) (not b!510966) (not bm!31475) (not d!78671) (not b!510928) (not b!510938) (not bm!31468) (not d!78685) (not b!510844) (not d!78667))
(check-sat)
