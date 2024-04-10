; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69334 () Bool)

(assert start!69334)

(declare-fun b!808721 () Bool)

(declare-fun res!552656 () Bool)

(declare-fun e!447678 () Bool)

(assert (=> b!808721 (=> (not res!552656) (not e!447678))))

(declare-datatypes ((array!43983 0))(
  ( (array!43984 (arr!21067 (Array (_ BitVec 32) (_ BitVec 64))) (size!21488 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43983)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808721 (= res!552656 (validKeyInArray!0 (select (arr!21067 a!3170) j!153)))))

(declare-fun b!808722 () Bool)

(declare-fun res!552649 () Bool)

(assert (=> b!808722 (=> (not res!552649) (not e!447678))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!808722 (= res!552649 (validKeyInArray!0 k0!2044))))

(declare-fun b!808723 () Bool)

(declare-fun e!447677 () Bool)

(declare-fun e!447680 () Bool)

(assert (=> b!808723 (= e!447677 e!447680)))

(declare-fun res!552646 () Bool)

(assert (=> b!808723 (=> (not res!552646) (not e!447680))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362392 () array!43983)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!362393 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8658 0))(
  ( (MissingZero!8658 (index!37000 (_ BitVec 32))) (Found!8658 (index!37001 (_ BitVec 32))) (Intermediate!8658 (undefined!9470 Bool) (index!37002 (_ BitVec 32)) (x!67804 (_ BitVec 32))) (Undefined!8658) (MissingVacant!8658 (index!37003 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43983 (_ BitVec 32)) SeekEntryResult!8658)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43983 (_ BitVec 32)) SeekEntryResult!8658)

(assert (=> b!808723 (= res!552646 (= (seekEntryOrOpen!0 lt!362393 lt!362392 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362393 lt!362392 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808723 (= lt!362393 (select (store (arr!21067 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808723 (= lt!362392 (array!43984 (store (arr!21067 a!3170) i!1163 k0!2044) (size!21488 a!3170)))))

(declare-fun res!552653 () Bool)

(assert (=> start!69334 (=> (not res!552653) (not e!447678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69334 (= res!552653 (validMask!0 mask!3266))))

(assert (=> start!69334 e!447678))

(assert (=> start!69334 true))

(declare-fun array_inv!16863 (array!43983) Bool)

(assert (=> start!69334 (array_inv!16863 a!3170)))

(declare-fun b!808724 () Bool)

(declare-fun res!552647 () Bool)

(assert (=> b!808724 (=> (not res!552647) (not e!447677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43983 (_ BitVec 32)) Bool)

(assert (=> b!808724 (= res!552647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808725 () Bool)

(declare-fun res!552655 () Bool)

(assert (=> b!808725 (=> (not res!552655) (not e!447677))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808725 (= res!552655 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21488 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21067 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21488 a!3170)) (= (select (arr!21067 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun lt!362391 () (_ BitVec 32))

(declare-fun e!447676 () Bool)

(declare-fun b!808726 () Bool)

(assert (=> b!808726 (= e!447676 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (or (bvslt lt!362391 #b00000000000000000000000000000000) (bvsge lt!362391 (size!21488 a!3170)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808726 (= lt!362391 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808727 () Bool)

(assert (=> b!808727 (= e!447680 e!447676)))

(declare-fun res!552651 () Bool)

(assert (=> b!808727 (=> (not res!552651) (not e!447676))))

(declare-fun lt!362395 () SeekEntryResult!8658)

(declare-fun lt!362396 () SeekEntryResult!8658)

(assert (=> b!808727 (= res!552651 (and (= lt!362395 lt!362396) (= lt!362396 (Found!8658 j!153)) (not (= (select (arr!21067 a!3170) index!1236) (select (arr!21067 a!3170) j!153)))))))

(assert (=> b!808727 (= lt!362396 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21067 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808727 (= lt!362395 (seekEntryOrOpen!0 (select (arr!21067 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808728 () Bool)

(assert (=> b!808728 (= e!447678 e!447677)))

(declare-fun res!552652 () Bool)

(assert (=> b!808728 (=> (not res!552652) (not e!447677))))

(declare-fun lt!362394 () SeekEntryResult!8658)

(assert (=> b!808728 (= res!552652 (or (= lt!362394 (MissingZero!8658 i!1163)) (= lt!362394 (MissingVacant!8658 i!1163))))))

(assert (=> b!808728 (= lt!362394 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808729 () Bool)

(declare-fun res!552648 () Bool)

(assert (=> b!808729 (=> (not res!552648) (not e!447678))))

(declare-fun arrayContainsKey!0 (array!43983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808729 (= res!552648 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808730 () Bool)

(declare-fun res!552654 () Bool)

(assert (=> b!808730 (=> (not res!552654) (not e!447677))))

(declare-datatypes ((List!15030 0))(
  ( (Nil!15027) (Cons!15026 (h!16155 (_ BitVec 64)) (t!21345 List!15030)) )
))
(declare-fun arrayNoDuplicates!0 (array!43983 (_ BitVec 32) List!15030) Bool)

(assert (=> b!808730 (= res!552654 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15027))))

(declare-fun b!808731 () Bool)

(declare-fun res!552650 () Bool)

(assert (=> b!808731 (=> (not res!552650) (not e!447678))))

(assert (=> b!808731 (= res!552650 (and (= (size!21488 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21488 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21488 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69334 res!552653) b!808731))

(assert (= (and b!808731 res!552650) b!808721))

(assert (= (and b!808721 res!552656) b!808722))

(assert (= (and b!808722 res!552649) b!808729))

(assert (= (and b!808729 res!552648) b!808728))

(assert (= (and b!808728 res!552652) b!808724))

(assert (= (and b!808724 res!552647) b!808730))

(assert (= (and b!808730 res!552654) b!808725))

(assert (= (and b!808725 res!552655) b!808723))

(assert (= (and b!808723 res!552646) b!808727))

(assert (= (and b!808727 res!552651) b!808726))

(declare-fun m!750877 () Bool)

(assert (=> start!69334 m!750877))

(declare-fun m!750879 () Bool)

(assert (=> start!69334 m!750879))

(declare-fun m!750881 () Bool)

(assert (=> b!808724 m!750881))

(declare-fun m!750883 () Bool)

(assert (=> b!808723 m!750883))

(declare-fun m!750885 () Bool)

(assert (=> b!808723 m!750885))

(declare-fun m!750887 () Bool)

(assert (=> b!808723 m!750887))

(declare-fun m!750889 () Bool)

(assert (=> b!808723 m!750889))

(declare-fun m!750891 () Bool)

(assert (=> b!808730 m!750891))

(declare-fun m!750893 () Bool)

(assert (=> b!808721 m!750893))

(assert (=> b!808721 m!750893))

(declare-fun m!750895 () Bool)

(assert (=> b!808721 m!750895))

(declare-fun m!750897 () Bool)

(assert (=> b!808727 m!750897))

(assert (=> b!808727 m!750893))

(assert (=> b!808727 m!750893))

(declare-fun m!750899 () Bool)

(assert (=> b!808727 m!750899))

(assert (=> b!808727 m!750893))

(declare-fun m!750901 () Bool)

(assert (=> b!808727 m!750901))

(declare-fun m!750903 () Bool)

(assert (=> b!808722 m!750903))

(declare-fun m!750905 () Bool)

(assert (=> b!808726 m!750905))

(declare-fun m!750907 () Bool)

(assert (=> b!808725 m!750907))

(declare-fun m!750909 () Bool)

(assert (=> b!808725 m!750909))

(declare-fun m!750911 () Bool)

(assert (=> b!808729 m!750911))

(declare-fun m!750913 () Bool)

(assert (=> b!808728 m!750913))

(check-sat (not b!808721) (not start!69334) (not b!808723) (not b!808728) (not b!808724) (not b!808729) (not b!808727) (not b!808726) (not b!808722) (not b!808730))
(check-sat)
(get-model)

(declare-fun d!103823 () Bool)

(declare-fun lt!362417 () (_ BitVec 32))

(assert (=> d!103823 (and (bvsge lt!362417 #b00000000000000000000000000000000) (bvslt lt!362417 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103823 (= lt!362417 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!103823 (validMask!0 mask!3266)))

(assert (=> d!103823 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!362417)))

(declare-fun bs!22402 () Bool)

(assert (= bs!22402 d!103823))

(declare-fun m!750953 () Bool)

(assert (=> bs!22402 m!750953))

(assert (=> bs!22402 m!750877))

(assert (=> b!808726 d!103823))

(declare-fun d!103825 () Bool)

(assert (=> d!103825 (= (validKeyInArray!0 (select (arr!21067 a!3170) j!153)) (and (not (= (select (arr!21067 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21067 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!808721 d!103825))

(declare-fun b!808775 () Bool)

(declare-fun e!447704 () Bool)

(declare-fun e!447707 () Bool)

(assert (=> b!808775 (= e!447704 e!447707)))

(declare-fun c!88450 () Bool)

(assert (=> b!808775 (= c!88450 (validKeyInArray!0 (select (arr!21067 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103827 () Bool)

(declare-fun res!552698 () Bool)

(declare-fun e!447706 () Bool)

(assert (=> d!103827 (=> res!552698 e!447706)))

(assert (=> d!103827 (= res!552698 (bvsge #b00000000000000000000000000000000 (size!21488 a!3170)))))

(assert (=> d!103827 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15027) e!447706)))

(declare-fun b!808776 () Bool)

(declare-fun call!35403 () Bool)

(assert (=> b!808776 (= e!447707 call!35403)))

(declare-fun b!808777 () Bool)

(assert (=> b!808777 (= e!447706 e!447704)))

(declare-fun res!552697 () Bool)

(assert (=> b!808777 (=> (not res!552697) (not e!447704))))

(declare-fun e!447705 () Bool)

(assert (=> b!808777 (= res!552697 (not e!447705))))

(declare-fun res!552696 () Bool)

(assert (=> b!808777 (=> (not res!552696) (not e!447705))))

(assert (=> b!808777 (= res!552696 (validKeyInArray!0 (select (arr!21067 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808778 () Bool)

(assert (=> b!808778 (= e!447707 call!35403)))

(declare-fun bm!35400 () Bool)

(assert (=> bm!35400 (= call!35403 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88450 (Cons!15026 (select (arr!21067 a!3170) #b00000000000000000000000000000000) Nil!15027) Nil!15027)))))

(declare-fun b!808779 () Bool)

(declare-fun contains!4128 (List!15030 (_ BitVec 64)) Bool)

(assert (=> b!808779 (= e!447705 (contains!4128 Nil!15027 (select (arr!21067 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!103827 (not res!552698)) b!808777))

(assert (= (and b!808777 res!552696) b!808779))

(assert (= (and b!808777 res!552697) b!808775))

(assert (= (and b!808775 c!88450) b!808778))

(assert (= (and b!808775 (not c!88450)) b!808776))

(assert (= (or b!808778 b!808776) bm!35400))

(declare-fun m!750955 () Bool)

(assert (=> b!808775 m!750955))

(assert (=> b!808775 m!750955))

(declare-fun m!750957 () Bool)

(assert (=> b!808775 m!750957))

(assert (=> b!808777 m!750955))

(assert (=> b!808777 m!750955))

(assert (=> b!808777 m!750957))

(assert (=> bm!35400 m!750955))

(declare-fun m!750959 () Bool)

(assert (=> bm!35400 m!750959))

(assert (=> b!808779 m!750955))

(assert (=> b!808779 m!750955))

(declare-fun m!750961 () Bool)

(assert (=> b!808779 m!750961))

(assert (=> b!808730 d!103827))

(declare-fun b!808792 () Bool)

(declare-fun c!88459 () Bool)

(declare-fun lt!362426 () (_ BitVec 64))

(assert (=> b!808792 (= c!88459 (= lt!362426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447714 () SeekEntryResult!8658)

(declare-fun e!447715 () SeekEntryResult!8658)

(assert (=> b!808792 (= e!447714 e!447715)))

(declare-fun b!808793 () Bool)

(declare-fun lt!362425 () SeekEntryResult!8658)

(assert (=> b!808793 (= e!447715 (MissingZero!8658 (index!37002 lt!362425)))))

(declare-fun b!808794 () Bool)

(assert (=> b!808794 (= e!447715 (seekKeyOrZeroReturnVacant!0 (x!67804 lt!362425) (index!37002 lt!362425) (index!37002 lt!362425) lt!362393 lt!362392 mask!3266))))

(declare-fun b!808795 () Bool)

(assert (=> b!808795 (= e!447714 (Found!8658 (index!37002 lt!362425)))))

(declare-fun b!808796 () Bool)

(declare-fun e!447716 () SeekEntryResult!8658)

(assert (=> b!808796 (= e!447716 e!447714)))

(assert (=> b!808796 (= lt!362426 (select (arr!21067 lt!362392) (index!37002 lt!362425)))))

(declare-fun c!88457 () Bool)

(assert (=> b!808796 (= c!88457 (= lt!362426 lt!362393))))

(declare-fun d!103829 () Bool)

(declare-fun lt!362424 () SeekEntryResult!8658)

(get-info :version)

(assert (=> d!103829 (and (or ((_ is Undefined!8658) lt!362424) (not ((_ is Found!8658) lt!362424)) (and (bvsge (index!37001 lt!362424) #b00000000000000000000000000000000) (bvslt (index!37001 lt!362424) (size!21488 lt!362392)))) (or ((_ is Undefined!8658) lt!362424) ((_ is Found!8658) lt!362424) (not ((_ is MissingZero!8658) lt!362424)) (and (bvsge (index!37000 lt!362424) #b00000000000000000000000000000000) (bvslt (index!37000 lt!362424) (size!21488 lt!362392)))) (or ((_ is Undefined!8658) lt!362424) ((_ is Found!8658) lt!362424) ((_ is MissingZero!8658) lt!362424) (not ((_ is MissingVacant!8658) lt!362424)) (and (bvsge (index!37003 lt!362424) #b00000000000000000000000000000000) (bvslt (index!37003 lt!362424) (size!21488 lt!362392)))) (or ((_ is Undefined!8658) lt!362424) (ite ((_ is Found!8658) lt!362424) (= (select (arr!21067 lt!362392) (index!37001 lt!362424)) lt!362393) (ite ((_ is MissingZero!8658) lt!362424) (= (select (arr!21067 lt!362392) (index!37000 lt!362424)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8658) lt!362424) (= (select (arr!21067 lt!362392) (index!37003 lt!362424)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103829 (= lt!362424 e!447716)))

(declare-fun c!88458 () Bool)

(assert (=> d!103829 (= c!88458 (and ((_ is Intermediate!8658) lt!362425) (undefined!9470 lt!362425)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43983 (_ BitVec 32)) SeekEntryResult!8658)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103829 (= lt!362425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362393 mask!3266) lt!362393 lt!362392 mask!3266))))

(assert (=> d!103829 (validMask!0 mask!3266)))

(assert (=> d!103829 (= (seekEntryOrOpen!0 lt!362393 lt!362392 mask!3266) lt!362424)))

(declare-fun b!808797 () Bool)

(assert (=> b!808797 (= e!447716 Undefined!8658)))

(assert (= (and d!103829 c!88458) b!808797))

(assert (= (and d!103829 (not c!88458)) b!808796))

(assert (= (and b!808796 c!88457) b!808795))

(assert (= (and b!808796 (not c!88457)) b!808792))

(assert (= (and b!808792 c!88459) b!808793))

(assert (= (and b!808792 (not c!88459)) b!808794))

(declare-fun m!750963 () Bool)

(assert (=> b!808794 m!750963))

(declare-fun m!750965 () Bool)

(assert (=> b!808796 m!750965))

(declare-fun m!750967 () Bool)

(assert (=> d!103829 m!750967))

(declare-fun m!750969 () Bool)

(assert (=> d!103829 m!750969))

(declare-fun m!750971 () Bool)

(assert (=> d!103829 m!750971))

(assert (=> d!103829 m!750967))

(declare-fun m!750973 () Bool)

(assert (=> d!103829 m!750973))

(assert (=> d!103829 m!750877))

(declare-fun m!750975 () Bool)

(assert (=> d!103829 m!750975))

(assert (=> b!808723 d!103829))

(declare-fun d!103831 () Bool)

(declare-fun lt!362431 () SeekEntryResult!8658)

(assert (=> d!103831 (and (or ((_ is Undefined!8658) lt!362431) (not ((_ is Found!8658) lt!362431)) (and (bvsge (index!37001 lt!362431) #b00000000000000000000000000000000) (bvslt (index!37001 lt!362431) (size!21488 lt!362392)))) (or ((_ is Undefined!8658) lt!362431) ((_ is Found!8658) lt!362431) (not ((_ is MissingVacant!8658) lt!362431)) (not (= (index!37003 lt!362431) vacantAfter!23)) (and (bvsge (index!37003 lt!362431) #b00000000000000000000000000000000) (bvslt (index!37003 lt!362431) (size!21488 lt!362392)))) (or ((_ is Undefined!8658) lt!362431) (ite ((_ is Found!8658) lt!362431) (= (select (arr!21067 lt!362392) (index!37001 lt!362431)) lt!362393) (and ((_ is MissingVacant!8658) lt!362431) (= (index!37003 lt!362431) vacantAfter!23) (= (select (arr!21067 lt!362392) (index!37003 lt!362431)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!447723 () SeekEntryResult!8658)

(assert (=> d!103831 (= lt!362431 e!447723)))

(declare-fun c!88468 () Bool)

(assert (=> d!103831 (= c!88468 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!362432 () (_ BitVec 64))

(assert (=> d!103831 (= lt!362432 (select (arr!21067 lt!362392) index!1236))))

(assert (=> d!103831 (validMask!0 mask!3266)))

(assert (=> d!103831 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362393 lt!362392 mask!3266) lt!362431)))

(declare-fun b!808810 () Bool)

(declare-fun e!447724 () SeekEntryResult!8658)

(assert (=> b!808810 (= e!447724 (Found!8658 index!1236))))

(declare-fun b!808811 () Bool)

(declare-fun c!88466 () Bool)

(assert (=> b!808811 (= c!88466 (= lt!362432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447725 () SeekEntryResult!8658)

(assert (=> b!808811 (= e!447724 e!447725)))

(declare-fun b!808812 () Bool)

(assert (=> b!808812 (= e!447725 (MissingVacant!8658 vacantAfter!23))))

(declare-fun b!808813 () Bool)

(assert (=> b!808813 (= e!447725 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!362393 lt!362392 mask!3266))))

(declare-fun b!808814 () Bool)

(assert (=> b!808814 (= e!447723 e!447724)))

(declare-fun c!88467 () Bool)

(assert (=> b!808814 (= c!88467 (= lt!362432 lt!362393))))

(declare-fun b!808815 () Bool)

(assert (=> b!808815 (= e!447723 Undefined!8658)))

(assert (= (and d!103831 c!88468) b!808815))

(assert (= (and d!103831 (not c!88468)) b!808814))

(assert (= (and b!808814 c!88467) b!808810))

(assert (= (and b!808814 (not c!88467)) b!808811))

(assert (= (and b!808811 c!88466) b!808812))

(assert (= (and b!808811 (not c!88466)) b!808813))

(declare-fun m!750977 () Bool)

(assert (=> d!103831 m!750977))

(declare-fun m!750979 () Bool)

(assert (=> d!103831 m!750979))

(declare-fun m!750981 () Bool)

(assert (=> d!103831 m!750981))

(assert (=> d!103831 m!750877))

(assert (=> b!808813 m!750905))

(assert (=> b!808813 m!750905))

(declare-fun m!750983 () Bool)

(assert (=> b!808813 m!750983))

(assert (=> b!808723 d!103831))

(declare-fun b!808833 () Bool)

(declare-fun e!447740 () Bool)

(declare-fun e!447739 () Bool)

(assert (=> b!808833 (= e!447740 e!447739)))

(declare-fun c!88473 () Bool)

(assert (=> b!808833 (= c!88473 (validKeyInArray!0 (select (arr!21067 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808834 () Bool)

(declare-fun e!447738 () Bool)

(assert (=> b!808834 (= e!447739 e!447738)))

(declare-fun lt!362445 () (_ BitVec 64))

(assert (=> b!808834 (= lt!362445 (select (arr!21067 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27620 0))(
  ( (Unit!27621) )
))
(declare-fun lt!362446 () Unit!27620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43983 (_ BitVec 64) (_ BitVec 32)) Unit!27620)

(assert (=> b!808834 (= lt!362446 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362445 #b00000000000000000000000000000000))))

(assert (=> b!808834 (arrayContainsKey!0 a!3170 lt!362445 #b00000000000000000000000000000000)))

(declare-fun lt!362447 () Unit!27620)

(assert (=> b!808834 (= lt!362447 lt!362446)))

(declare-fun res!552707 () Bool)

(assert (=> b!808834 (= res!552707 (= (seekEntryOrOpen!0 (select (arr!21067 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8658 #b00000000000000000000000000000000)))))

(assert (=> b!808834 (=> (not res!552707) (not e!447738))))

(declare-fun b!808835 () Bool)

(declare-fun call!35408 () Bool)

(assert (=> b!808835 (= e!447738 call!35408)))

(declare-fun bm!35405 () Bool)

(assert (=> bm!35405 (= call!35408 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!808832 () Bool)

(assert (=> b!808832 (= e!447739 call!35408)))

(declare-fun d!103837 () Bool)

(declare-fun res!552708 () Bool)

(assert (=> d!103837 (=> res!552708 e!447740)))

(assert (=> d!103837 (= res!552708 (bvsge #b00000000000000000000000000000000 (size!21488 a!3170)))))

(assert (=> d!103837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!447740)))

(assert (= (and d!103837 (not res!552708)) b!808833))

(assert (= (and b!808833 c!88473) b!808834))

(assert (= (and b!808833 (not c!88473)) b!808832))

(assert (= (and b!808834 res!552707) b!808835))

(assert (= (or b!808835 b!808832) bm!35405))

(assert (=> b!808833 m!750955))

(assert (=> b!808833 m!750955))

(assert (=> b!808833 m!750957))

(assert (=> b!808834 m!750955))

(declare-fun m!750985 () Bool)

(assert (=> b!808834 m!750985))

(declare-fun m!750987 () Bool)

(assert (=> b!808834 m!750987))

(assert (=> b!808834 m!750955))

(declare-fun m!750989 () Bool)

(assert (=> b!808834 m!750989))

(declare-fun m!750991 () Bool)

(assert (=> bm!35405 m!750991))

(assert (=> b!808724 d!103837))

(declare-fun d!103841 () Bool)

(declare-fun res!552715 () Bool)

(declare-fun e!447748 () Bool)

(assert (=> d!103841 (=> res!552715 e!447748)))

(assert (=> d!103841 (= res!552715 (= (select (arr!21067 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103841 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!447748)))

(declare-fun b!808844 () Bool)

(declare-fun e!447749 () Bool)

(assert (=> b!808844 (= e!447748 e!447749)))

(declare-fun res!552716 () Bool)

(assert (=> b!808844 (=> (not res!552716) (not e!447749))))

(assert (=> b!808844 (= res!552716 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21488 a!3170)))))

(declare-fun b!808845 () Bool)

(assert (=> b!808845 (= e!447749 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103841 (not res!552715)) b!808844))

(assert (= (and b!808844 res!552716) b!808845))

(assert (=> d!103841 m!750955))

(declare-fun m!751005 () Bool)

(assert (=> b!808845 m!751005))

(assert (=> b!808729 d!103841))

(declare-fun d!103845 () Bool)

(assert (=> d!103845 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!808722 d!103845))

(declare-fun lt!362451 () SeekEntryResult!8658)

(declare-fun d!103847 () Bool)

(assert (=> d!103847 (and (or ((_ is Undefined!8658) lt!362451) (not ((_ is Found!8658) lt!362451)) (and (bvsge (index!37001 lt!362451) #b00000000000000000000000000000000) (bvslt (index!37001 lt!362451) (size!21488 a!3170)))) (or ((_ is Undefined!8658) lt!362451) ((_ is Found!8658) lt!362451) (not ((_ is MissingVacant!8658) lt!362451)) (not (= (index!37003 lt!362451) vacantBefore!23)) (and (bvsge (index!37003 lt!362451) #b00000000000000000000000000000000) (bvslt (index!37003 lt!362451) (size!21488 a!3170)))) (or ((_ is Undefined!8658) lt!362451) (ite ((_ is Found!8658) lt!362451) (= (select (arr!21067 a!3170) (index!37001 lt!362451)) (select (arr!21067 a!3170) j!153)) (and ((_ is MissingVacant!8658) lt!362451) (= (index!37003 lt!362451) vacantBefore!23) (= (select (arr!21067 a!3170) (index!37003 lt!362451)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!447750 () SeekEntryResult!8658)

(assert (=> d!103847 (= lt!362451 e!447750)))

(declare-fun c!88477 () Bool)

(assert (=> d!103847 (= c!88477 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!362452 () (_ BitVec 64))

(assert (=> d!103847 (= lt!362452 (select (arr!21067 a!3170) index!1236))))

(assert (=> d!103847 (validMask!0 mask!3266)))

(assert (=> d!103847 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21067 a!3170) j!153) a!3170 mask!3266) lt!362451)))

(declare-fun b!808846 () Bool)

(declare-fun e!447751 () SeekEntryResult!8658)

(assert (=> b!808846 (= e!447751 (Found!8658 index!1236))))

(declare-fun b!808847 () Bool)

(declare-fun c!88475 () Bool)

(assert (=> b!808847 (= c!88475 (= lt!362452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447752 () SeekEntryResult!8658)

(assert (=> b!808847 (= e!447751 e!447752)))

(declare-fun b!808848 () Bool)

(assert (=> b!808848 (= e!447752 (MissingVacant!8658 vacantBefore!23))))

(declare-fun b!808849 () Bool)

(assert (=> b!808849 (= e!447752 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21067 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808850 () Bool)

(assert (=> b!808850 (= e!447750 e!447751)))

(declare-fun c!88476 () Bool)

(assert (=> b!808850 (= c!88476 (= lt!362452 (select (arr!21067 a!3170) j!153)))))

(declare-fun b!808851 () Bool)

(assert (=> b!808851 (= e!447750 Undefined!8658)))

(assert (= (and d!103847 c!88477) b!808851))

(assert (= (and d!103847 (not c!88477)) b!808850))

(assert (= (and b!808850 c!88476) b!808846))

(assert (= (and b!808850 (not c!88476)) b!808847))

(assert (= (and b!808847 c!88475) b!808848))

(assert (= (and b!808847 (not c!88475)) b!808849))

(declare-fun m!751007 () Bool)

(assert (=> d!103847 m!751007))

(declare-fun m!751009 () Bool)

(assert (=> d!103847 m!751009))

(assert (=> d!103847 m!750897))

(assert (=> d!103847 m!750877))

(assert (=> b!808849 m!750905))

(assert (=> b!808849 m!750905))

(assert (=> b!808849 m!750893))

(declare-fun m!751011 () Bool)

(assert (=> b!808849 m!751011))

(assert (=> b!808727 d!103847))

(declare-fun b!808852 () Bool)

(declare-fun c!88480 () Bool)

(declare-fun lt!362455 () (_ BitVec 64))

(assert (=> b!808852 (= c!88480 (= lt!362455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447753 () SeekEntryResult!8658)

(declare-fun e!447754 () SeekEntryResult!8658)

(assert (=> b!808852 (= e!447753 e!447754)))

(declare-fun b!808853 () Bool)

(declare-fun lt!362454 () SeekEntryResult!8658)

(assert (=> b!808853 (= e!447754 (MissingZero!8658 (index!37002 lt!362454)))))

(declare-fun b!808854 () Bool)

(assert (=> b!808854 (= e!447754 (seekKeyOrZeroReturnVacant!0 (x!67804 lt!362454) (index!37002 lt!362454) (index!37002 lt!362454) (select (arr!21067 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808855 () Bool)

(assert (=> b!808855 (= e!447753 (Found!8658 (index!37002 lt!362454)))))

(declare-fun b!808856 () Bool)

(declare-fun e!447755 () SeekEntryResult!8658)

(assert (=> b!808856 (= e!447755 e!447753)))

(assert (=> b!808856 (= lt!362455 (select (arr!21067 a!3170) (index!37002 lt!362454)))))

(declare-fun c!88478 () Bool)

(assert (=> b!808856 (= c!88478 (= lt!362455 (select (arr!21067 a!3170) j!153)))))

(declare-fun d!103849 () Bool)

(declare-fun lt!362453 () SeekEntryResult!8658)

(assert (=> d!103849 (and (or ((_ is Undefined!8658) lt!362453) (not ((_ is Found!8658) lt!362453)) (and (bvsge (index!37001 lt!362453) #b00000000000000000000000000000000) (bvslt (index!37001 lt!362453) (size!21488 a!3170)))) (or ((_ is Undefined!8658) lt!362453) ((_ is Found!8658) lt!362453) (not ((_ is MissingZero!8658) lt!362453)) (and (bvsge (index!37000 lt!362453) #b00000000000000000000000000000000) (bvslt (index!37000 lt!362453) (size!21488 a!3170)))) (or ((_ is Undefined!8658) lt!362453) ((_ is Found!8658) lt!362453) ((_ is MissingZero!8658) lt!362453) (not ((_ is MissingVacant!8658) lt!362453)) (and (bvsge (index!37003 lt!362453) #b00000000000000000000000000000000) (bvslt (index!37003 lt!362453) (size!21488 a!3170)))) (or ((_ is Undefined!8658) lt!362453) (ite ((_ is Found!8658) lt!362453) (= (select (arr!21067 a!3170) (index!37001 lt!362453)) (select (arr!21067 a!3170) j!153)) (ite ((_ is MissingZero!8658) lt!362453) (= (select (arr!21067 a!3170) (index!37000 lt!362453)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8658) lt!362453) (= (select (arr!21067 a!3170) (index!37003 lt!362453)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103849 (= lt!362453 e!447755)))

(declare-fun c!88479 () Bool)

(assert (=> d!103849 (= c!88479 (and ((_ is Intermediate!8658) lt!362454) (undefined!9470 lt!362454)))))

(assert (=> d!103849 (= lt!362454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21067 a!3170) j!153) mask!3266) (select (arr!21067 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103849 (validMask!0 mask!3266)))

(assert (=> d!103849 (= (seekEntryOrOpen!0 (select (arr!21067 a!3170) j!153) a!3170 mask!3266) lt!362453)))

(declare-fun b!808857 () Bool)

(assert (=> b!808857 (= e!447755 Undefined!8658)))

(assert (= (and d!103849 c!88479) b!808857))

(assert (= (and d!103849 (not c!88479)) b!808856))

(assert (= (and b!808856 c!88478) b!808855))

(assert (= (and b!808856 (not c!88478)) b!808852))

(assert (= (and b!808852 c!88480) b!808853))

(assert (= (and b!808852 (not c!88480)) b!808854))

(assert (=> b!808854 m!750893))

(declare-fun m!751013 () Bool)

(assert (=> b!808854 m!751013))

(declare-fun m!751015 () Bool)

(assert (=> b!808856 m!751015))

(declare-fun m!751017 () Bool)

(assert (=> d!103849 m!751017))

(assert (=> d!103849 m!750893))

(declare-fun m!751019 () Bool)

(assert (=> d!103849 m!751019))

(declare-fun m!751021 () Bool)

(assert (=> d!103849 m!751021))

(assert (=> d!103849 m!750893))

(assert (=> d!103849 m!751017))

(declare-fun m!751023 () Bool)

(assert (=> d!103849 m!751023))

(assert (=> d!103849 m!750877))

(declare-fun m!751025 () Bool)

(assert (=> d!103849 m!751025))

(assert (=> b!808727 d!103849))

(declare-fun b!808858 () Bool)

(declare-fun c!88483 () Bool)

(declare-fun lt!362458 () (_ BitVec 64))

(assert (=> b!808858 (= c!88483 (= lt!362458 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447756 () SeekEntryResult!8658)

(declare-fun e!447757 () SeekEntryResult!8658)

(assert (=> b!808858 (= e!447756 e!447757)))

(declare-fun b!808859 () Bool)

(declare-fun lt!362457 () SeekEntryResult!8658)

(assert (=> b!808859 (= e!447757 (MissingZero!8658 (index!37002 lt!362457)))))

(declare-fun b!808860 () Bool)

(assert (=> b!808860 (= e!447757 (seekKeyOrZeroReturnVacant!0 (x!67804 lt!362457) (index!37002 lt!362457) (index!37002 lt!362457) k0!2044 a!3170 mask!3266))))

(declare-fun b!808861 () Bool)

(assert (=> b!808861 (= e!447756 (Found!8658 (index!37002 lt!362457)))))

(declare-fun b!808862 () Bool)

(declare-fun e!447758 () SeekEntryResult!8658)

(assert (=> b!808862 (= e!447758 e!447756)))

(assert (=> b!808862 (= lt!362458 (select (arr!21067 a!3170) (index!37002 lt!362457)))))

(declare-fun c!88481 () Bool)

(assert (=> b!808862 (= c!88481 (= lt!362458 k0!2044))))

(declare-fun d!103851 () Bool)

(declare-fun lt!362456 () SeekEntryResult!8658)

(assert (=> d!103851 (and (or ((_ is Undefined!8658) lt!362456) (not ((_ is Found!8658) lt!362456)) (and (bvsge (index!37001 lt!362456) #b00000000000000000000000000000000) (bvslt (index!37001 lt!362456) (size!21488 a!3170)))) (or ((_ is Undefined!8658) lt!362456) ((_ is Found!8658) lt!362456) (not ((_ is MissingZero!8658) lt!362456)) (and (bvsge (index!37000 lt!362456) #b00000000000000000000000000000000) (bvslt (index!37000 lt!362456) (size!21488 a!3170)))) (or ((_ is Undefined!8658) lt!362456) ((_ is Found!8658) lt!362456) ((_ is MissingZero!8658) lt!362456) (not ((_ is MissingVacant!8658) lt!362456)) (and (bvsge (index!37003 lt!362456) #b00000000000000000000000000000000) (bvslt (index!37003 lt!362456) (size!21488 a!3170)))) (or ((_ is Undefined!8658) lt!362456) (ite ((_ is Found!8658) lt!362456) (= (select (arr!21067 a!3170) (index!37001 lt!362456)) k0!2044) (ite ((_ is MissingZero!8658) lt!362456) (= (select (arr!21067 a!3170) (index!37000 lt!362456)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8658) lt!362456) (= (select (arr!21067 a!3170) (index!37003 lt!362456)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103851 (= lt!362456 e!447758)))

(declare-fun c!88482 () Bool)

(assert (=> d!103851 (= c!88482 (and ((_ is Intermediate!8658) lt!362457) (undefined!9470 lt!362457)))))

(assert (=> d!103851 (= lt!362457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103851 (validMask!0 mask!3266)))

(assert (=> d!103851 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!362456)))

(declare-fun b!808863 () Bool)

(assert (=> b!808863 (= e!447758 Undefined!8658)))

(assert (= (and d!103851 c!88482) b!808863))

(assert (= (and d!103851 (not c!88482)) b!808862))

(assert (= (and b!808862 c!88481) b!808861))

(assert (= (and b!808862 (not c!88481)) b!808858))

(assert (= (and b!808858 c!88483) b!808859))

(assert (= (and b!808858 (not c!88483)) b!808860))

(declare-fun m!751027 () Bool)

(assert (=> b!808860 m!751027))

(declare-fun m!751029 () Bool)

(assert (=> b!808862 m!751029))

(declare-fun m!751031 () Bool)

(assert (=> d!103851 m!751031))

(declare-fun m!751033 () Bool)

(assert (=> d!103851 m!751033))

(declare-fun m!751035 () Bool)

(assert (=> d!103851 m!751035))

(assert (=> d!103851 m!751031))

(declare-fun m!751037 () Bool)

(assert (=> d!103851 m!751037))

(assert (=> d!103851 m!750877))

(declare-fun m!751039 () Bool)

(assert (=> d!103851 m!751039))

(assert (=> b!808728 d!103851))

(declare-fun d!103853 () Bool)

(assert (=> d!103853 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69334 d!103853))

(declare-fun d!103861 () Bool)

(assert (=> d!103861 (= (array_inv!16863 a!3170) (bvsge (size!21488 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69334 d!103861))

(check-sat (not d!103829) (not d!103847) (not b!808779) (not bm!35405) (not bm!35400) (not b!808794) (not b!808813) (not b!808834) (not d!103849) (not b!808849) (not d!103851) (not b!808845) (not b!808777) (not b!808775) (not d!103823) (not b!808854) (not b!808833) (not b!808860) (not d!103831))
(check-sat)
