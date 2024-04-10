; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46852 () Bool)

(assert start!46852)

(declare-fun b!517222 () Bool)

(declare-fun e!301815 () Bool)

(declare-fun e!301814 () Bool)

(assert (=> b!517222 (= e!301815 e!301814)))

(declare-fun res!316611 () Bool)

(assert (=> b!517222 (=> (not res!316611) (not e!301814))))

(declare-datatypes ((SeekEntryResult!4387 0))(
  ( (MissingZero!4387 (index!19736 (_ BitVec 32))) (Found!4387 (index!19737 (_ BitVec 32))) (Intermediate!4387 (undefined!5199 Bool) (index!19738 (_ BitVec 32)) (x!48692 (_ BitVec 32))) (Undefined!4387) (MissingVacant!4387 (index!19739 (_ BitVec 32))) )
))
(declare-fun lt!236770 () SeekEntryResult!4387)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517222 (= res!316611 (or (= lt!236770 (MissingZero!4387 i!1204)) (= lt!236770 (MissingVacant!4387 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((array!33107 0))(
  ( (array!33108 (arr!15920 (Array (_ BitVec 32) (_ BitVec 64))) (size!16284 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33107)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33107 (_ BitVec 32)) SeekEntryResult!4387)

(assert (=> b!517222 (= lt!236770 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!517223 () Bool)

(declare-fun res!316613 () Bool)

(assert (=> b!517223 (=> (not res!316613) (not e!301815))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517223 (= res!316613 (validKeyInArray!0 (select (arr!15920 a!3235) j!176)))))

(declare-fun b!517224 () Bool)

(declare-fun res!316608 () Bool)

(assert (=> b!517224 (=> (not res!316608) (not e!301815))))

(declare-fun arrayContainsKey!0 (array!33107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517224 (= res!316608 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517225 () Bool)

(declare-fun e!301811 () Bool)

(assert (=> b!517225 (= e!301811 (= (seekEntryOrOpen!0 (select (arr!15920 a!3235) j!176) a!3235 mask!3524) (Found!4387 j!176)))))

(declare-fun b!517226 () Bool)

(declare-fun res!316603 () Bool)

(assert (=> b!517226 (=> (not res!316603) (not e!301815))))

(assert (=> b!517226 (= res!316603 (validKeyInArray!0 k!2280))))

(declare-fun res!316607 () Bool)

(assert (=> start!46852 (=> (not res!316607) (not e!301815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46852 (= res!316607 (validMask!0 mask!3524))))

(assert (=> start!46852 e!301815))

(assert (=> start!46852 true))

(declare-fun array_inv!11716 (array!33107) Bool)

(assert (=> start!46852 (array_inv!11716 a!3235)))

(declare-fun b!517227 () Bool)

(declare-fun res!316610 () Bool)

(assert (=> b!517227 (=> (not res!316610) (not e!301815))))

(assert (=> b!517227 (= res!316610 (and (= (size!16284 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16284 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16284 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517228 () Bool)

(declare-fun res!316606 () Bool)

(declare-fun e!301812 () Bool)

(assert (=> b!517228 (=> res!316606 e!301812)))

(declare-fun lt!236772 () SeekEntryResult!4387)

(assert (=> b!517228 (= res!316606 (or (undefined!5199 lt!236772) (not (is-Intermediate!4387 lt!236772))))))

(declare-fun b!517229 () Bool)

(declare-fun res!316604 () Bool)

(assert (=> b!517229 (=> (not res!316604) (not e!301814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33107 (_ BitVec 32)) Bool)

(assert (=> b!517229 (= res!316604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517230 () Bool)

(declare-fun res!316612 () Bool)

(assert (=> b!517230 (=> (not res!316612) (not e!301814))))

(declare-datatypes ((List!10078 0))(
  ( (Nil!10075) (Cons!10074 (h!10975 (_ BitVec 64)) (t!16306 List!10078)) )
))
(declare-fun arrayNoDuplicates!0 (array!33107 (_ BitVec 32) List!10078) Bool)

(assert (=> b!517230 (= res!316612 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10075))))

(declare-fun b!517231 () Bool)

(assert (=> b!517231 (= e!301814 (not e!301812))))

(declare-fun res!316609 () Bool)

(assert (=> b!517231 (=> res!316609 e!301812)))

(declare-fun lt!236773 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33107 (_ BitVec 32)) SeekEntryResult!4387)

(assert (=> b!517231 (= res!316609 (= lt!236772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236773 (select (store (arr!15920 a!3235) i!1204 k!2280) j!176) (array!33108 (store (arr!15920 a!3235) i!1204 k!2280) (size!16284 a!3235)) mask!3524)))))

(declare-fun lt!236769 () (_ BitVec 32))

(assert (=> b!517231 (= lt!236772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236769 (select (arr!15920 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517231 (= lt!236773 (toIndex!0 (select (store (arr!15920 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!517231 (= lt!236769 (toIndex!0 (select (arr!15920 a!3235) j!176) mask!3524))))

(assert (=> b!517231 e!301811))

(declare-fun res!316605 () Bool)

(assert (=> b!517231 (=> (not res!316605) (not e!301811))))

(assert (=> b!517231 (= res!316605 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16032 0))(
  ( (Unit!16033) )
))
(declare-fun lt!236771 () Unit!16032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16032)

(assert (=> b!517231 (= lt!236771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517232 () Bool)

(assert (=> b!517232 (= e!301812 (or (not (= (select (arr!15920 a!3235) (index!19738 lt!236772)) (select (arr!15920 a!3235) j!176))) (bvsgt (x!48692 lt!236772) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48692 lt!236772)) (and (bvsge lt!236769 #b00000000000000000000000000000000) (bvslt lt!236769 (size!16284 a!3235)))))))

(assert (=> b!517232 (and (bvslt (x!48692 lt!236772) #b01111111111111111111111111111110) (or (= (select (arr!15920 a!3235) (index!19738 lt!236772)) (select (arr!15920 a!3235) j!176)) (= (select (arr!15920 a!3235) (index!19738 lt!236772)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15920 a!3235) (index!19738 lt!236772)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46852 res!316607) b!517227))

(assert (= (and b!517227 res!316610) b!517223))

(assert (= (and b!517223 res!316613) b!517226))

(assert (= (and b!517226 res!316603) b!517224))

(assert (= (and b!517224 res!316608) b!517222))

(assert (= (and b!517222 res!316611) b!517229))

(assert (= (and b!517229 res!316604) b!517230))

(assert (= (and b!517230 res!316612) b!517231))

(assert (= (and b!517231 res!316605) b!517225))

(assert (= (and b!517231 (not res!316609)) b!517228))

(assert (= (and b!517228 (not res!316606)) b!517232))

(declare-fun m!498697 () Bool)

(assert (=> b!517225 m!498697))

(assert (=> b!517225 m!498697))

(declare-fun m!498699 () Bool)

(assert (=> b!517225 m!498699))

(declare-fun m!498701 () Bool)

(assert (=> b!517226 m!498701))

(declare-fun m!498703 () Bool)

(assert (=> b!517232 m!498703))

(assert (=> b!517232 m!498697))

(declare-fun m!498705 () Bool)

(assert (=> b!517222 m!498705))

(declare-fun m!498707 () Bool)

(assert (=> b!517224 m!498707))

(declare-fun m!498709 () Bool)

(assert (=> start!46852 m!498709))

(declare-fun m!498711 () Bool)

(assert (=> start!46852 m!498711))

(declare-fun m!498713 () Bool)

(assert (=> b!517229 m!498713))

(declare-fun m!498715 () Bool)

(assert (=> b!517230 m!498715))

(assert (=> b!517223 m!498697))

(assert (=> b!517223 m!498697))

(declare-fun m!498717 () Bool)

(assert (=> b!517223 m!498717))

(declare-fun m!498719 () Bool)

(assert (=> b!517231 m!498719))

(declare-fun m!498721 () Bool)

(assert (=> b!517231 m!498721))

(declare-fun m!498723 () Bool)

(assert (=> b!517231 m!498723))

(assert (=> b!517231 m!498697))

(declare-fun m!498725 () Bool)

(assert (=> b!517231 m!498725))

(assert (=> b!517231 m!498697))

(assert (=> b!517231 m!498723))

(declare-fun m!498727 () Bool)

(assert (=> b!517231 m!498727))

(declare-fun m!498729 () Bool)

(assert (=> b!517231 m!498729))

(assert (=> b!517231 m!498723))

(declare-fun m!498731 () Bool)

(assert (=> b!517231 m!498731))

(assert (=> b!517231 m!498697))

(declare-fun m!498733 () Bool)

(assert (=> b!517231 m!498733))

(push 1)

(assert (not b!517222))

(assert (not b!517223))

(assert (not b!517230))

(assert (not b!517226))

(assert (not b!517225))

(assert (not b!517229))

(assert (not start!46852))

(assert (not b!517231))

(assert (not b!517224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79681 () Bool)

(assert (=> d!79681 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517226 d!79681))

(declare-fun d!79683 () Bool)

(assert (=> d!79683 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46852 d!79683))

(declare-fun d!79697 () Bool)

(assert (=> d!79697 (= (array_inv!11716 a!3235) (bvsge (size!16284 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46852 d!79697))

(declare-fun b!517369 () Bool)

(declare-fun e!301906 () SeekEntryResult!4387)

(declare-fun e!301907 () SeekEntryResult!4387)

(assert (=> b!517369 (= e!301906 e!301907)))

(declare-fun lt!236832 () (_ BitVec 64))

(declare-fun lt!236834 () SeekEntryResult!4387)

(assert (=> b!517369 (= lt!236832 (select (arr!15920 a!3235) (index!19738 lt!236834)))))

(declare-fun c!60643 () Bool)

(assert (=> b!517369 (= c!60643 (= lt!236832 k!2280))))

(declare-fun b!517370 () Bool)

(declare-fun c!60644 () Bool)

(assert (=> b!517370 (= c!60644 (= lt!236832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301905 () SeekEntryResult!4387)

(assert (=> b!517370 (= e!301907 e!301905)))

(declare-fun b!517371 () Bool)

(assert (=> b!517371 (= e!301906 Undefined!4387)))

(declare-fun b!517372 () Bool)

(assert (=> b!517372 (= e!301905 (MissingZero!4387 (index!19738 lt!236834)))))

(declare-fun d!79699 () Bool)

(declare-fun lt!236833 () SeekEntryResult!4387)

(assert (=> d!79699 (and (or (is-Undefined!4387 lt!236833) (not (is-Found!4387 lt!236833)) (and (bvsge (index!19737 lt!236833) #b00000000000000000000000000000000) (bvslt (index!19737 lt!236833) (size!16284 a!3235)))) (or (is-Undefined!4387 lt!236833) (is-Found!4387 lt!236833) (not (is-MissingZero!4387 lt!236833)) (and (bvsge (index!19736 lt!236833) #b00000000000000000000000000000000) (bvslt (index!19736 lt!236833) (size!16284 a!3235)))) (or (is-Undefined!4387 lt!236833) (is-Found!4387 lt!236833) (is-MissingZero!4387 lt!236833) (not (is-MissingVacant!4387 lt!236833)) (and (bvsge (index!19739 lt!236833) #b00000000000000000000000000000000) (bvslt (index!19739 lt!236833) (size!16284 a!3235)))) (or (is-Undefined!4387 lt!236833) (ite (is-Found!4387 lt!236833) (= (select (arr!15920 a!3235) (index!19737 lt!236833)) k!2280) (ite (is-MissingZero!4387 lt!236833) (= (select (arr!15920 a!3235) (index!19736 lt!236833)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4387 lt!236833) (= (select (arr!15920 a!3235) (index!19739 lt!236833)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79699 (= lt!236833 e!301906)))

(declare-fun c!60645 () Bool)

(assert (=> d!79699 (= c!60645 (and (is-Intermediate!4387 lt!236834) (undefined!5199 lt!236834)))))

(assert (=> d!79699 (= lt!236834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79699 (validMask!0 mask!3524)))

(assert (=> d!79699 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!236833)))

(declare-fun b!517373 () Bool)

(assert (=> b!517373 (= e!301907 (Found!4387 (index!19738 lt!236834)))))

(declare-fun b!517374 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33107 (_ BitVec 32)) SeekEntryResult!4387)

(assert (=> b!517374 (= e!301905 (seekKeyOrZeroReturnVacant!0 (x!48692 lt!236834) (index!19738 lt!236834) (index!19738 lt!236834) k!2280 a!3235 mask!3524))))

(assert (= (and d!79699 c!60645) b!517371))

(assert (= (and d!79699 (not c!60645)) b!517369))

(assert (= (and b!517369 c!60643) b!517373))

(assert (= (and b!517369 (not c!60643)) b!517370))

(assert (= (and b!517370 c!60644) b!517372))

(assert (= (and b!517370 (not c!60644)) b!517374))

(declare-fun m!498819 () Bool)

(assert (=> b!517369 m!498819))

(assert (=> d!79699 m!498709))

(declare-fun m!498821 () Bool)

(assert (=> d!79699 m!498821))

(declare-fun m!498823 () Bool)

(assert (=> d!79699 m!498823))

(declare-fun m!498825 () Bool)

(assert (=> d!79699 m!498825))

(declare-fun m!498827 () Bool)

(assert (=> d!79699 m!498827))

(assert (=> d!79699 m!498823))

(declare-fun m!498829 () Bool)

(assert (=> d!79699 m!498829))

(declare-fun m!498831 () Bool)

(assert (=> b!517374 m!498831))

(assert (=> b!517222 d!79699))

(declare-fun d!79721 () Bool)

(assert (=> d!79721 (= (validKeyInArray!0 (select (arr!15920 a!3235) j!176)) (and (not (= (select (arr!15920 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15920 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517223 d!79721))

(declare-fun d!79723 () Bool)

(declare-fun res!316669 () Bool)

(declare-fun e!301922 () Bool)

(assert (=> d!79723 (=> res!316669 e!301922)))

(assert (=> d!79723 (= res!316669 (bvsge #b00000000000000000000000000000000 (size!16284 a!3235)))))

(assert (=> d!79723 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!301922)))

(declare-fun b!517395 () Bool)

(declare-fun e!301921 () Bool)

(declare-fun call!31677 () Bool)

(assert (=> b!517395 (= e!301921 call!31677)))

(declare-fun b!517396 () Bool)

(declare-fun e!301920 () Bool)

(assert (=> b!517396 (= e!301920 call!31677)))

(declare-fun b!517397 () Bool)

(assert (=> b!517397 (= e!301920 e!301921)))

(declare-fun lt!236849 () (_ BitVec 64))

(assert (=> b!517397 (= lt!236849 (select (arr!15920 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236848 () Unit!16032)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33107 (_ BitVec 64) (_ BitVec 32)) Unit!16032)

(assert (=> b!517397 (= lt!236848 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236849 #b00000000000000000000000000000000))))

(assert (=> b!517397 (arrayContainsKey!0 a!3235 lt!236849 #b00000000000000000000000000000000)))

(declare-fun lt!236847 () Unit!16032)

(assert (=> b!517397 (= lt!236847 lt!236848)))

(declare-fun res!316670 () Bool)

(assert (=> b!517397 (= res!316670 (= (seekEntryOrOpen!0 (select (arr!15920 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4387 #b00000000000000000000000000000000)))))

(assert (=> b!517397 (=> (not res!316670) (not e!301921))))

(declare-fun b!517398 () Bool)

(assert (=> b!517398 (= e!301922 e!301920)))

(declare-fun c!60654 () Bool)

(assert (=> b!517398 (= c!60654 (validKeyInArray!0 (select (arr!15920 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31674 () Bool)

(assert (=> bm!31674 (= call!31677 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79723 (not res!316669)) b!517398))

(assert (= (and b!517398 c!60654) b!517397))

(assert (= (and b!517398 (not c!60654)) b!517396))

(assert (= (and b!517397 res!316670) b!517395))

(assert (= (or b!517395 b!517396) bm!31674))

(declare-fun m!498833 () Bool)

(assert (=> b!517397 m!498833))

(declare-fun m!498835 () Bool)

(assert (=> b!517397 m!498835))

(declare-fun m!498837 () Bool)

(assert (=> b!517397 m!498837))

(assert (=> b!517397 m!498833))

(declare-fun m!498839 () Bool)

(assert (=> b!517397 m!498839))

(assert (=> b!517398 m!498833))

(assert (=> b!517398 m!498833))

(declare-fun m!498841 () Bool)

(assert (=> b!517398 m!498841))

(declare-fun m!498843 () Bool)

(assert (=> bm!31674 m!498843))

(assert (=> b!517229 d!79723))

(declare-fun d!79725 () Bool)

(declare-fun res!316675 () Bool)

(declare-fun e!301937 () Bool)

(assert (=> d!79725 (=> res!316675 e!301937)))

(assert (=> d!79725 (= res!316675 (= (select (arr!15920 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79725 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!301937)))

(declare-fun b!517425 () Bool)

(declare-fun e!301938 () Bool)

(assert (=> b!517425 (= e!301937 e!301938)))

(declare-fun res!316676 () Bool)

(assert (=> b!517425 (=> (not res!316676) (not e!301938))))

(assert (=> b!517425 (= res!316676 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16284 a!3235)))))

(declare-fun b!517426 () Bool)

(assert (=> b!517426 (= e!301938 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79725 (not res!316675)) b!517425))

(assert (= (and b!517425 res!316676) b!517426))

(assert (=> d!79725 m!498833))

(declare-fun m!498871 () Bool)

(assert (=> b!517426 m!498871))

(assert (=> b!517224 d!79725))

(declare-fun b!517431 () Bool)

(declare-fun e!301944 () SeekEntryResult!4387)

(declare-fun e!301945 () SeekEntryResult!4387)

(assert (=> b!517431 (= e!301944 e!301945)))

(declare-fun lt!236860 () (_ BitVec 64))

(declare-fun lt!236862 () SeekEntryResult!4387)

(assert (=> b!517431 (= lt!236860 (select (arr!15920 a!3235) (index!19738 lt!236862)))))

(declare-fun c!60667 () Bool)

(assert (=> b!517431 (= c!60667 (= lt!236860 (select (arr!15920 a!3235) j!176)))))

(declare-fun b!517432 () Bool)

(declare-fun c!60668 () Bool)

(assert (=> b!517432 (= c!60668 (= lt!236860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301943 () SeekEntryResult!4387)

(assert (=> b!517432 (= e!301945 e!301943)))

(declare-fun b!517433 () Bool)

(assert (=> b!517433 (= e!301944 Undefined!4387)))

(declare-fun b!517434 () Bool)

(assert (=> b!517434 (= e!301943 (MissingZero!4387 (index!19738 lt!236862)))))

(declare-fun d!79733 () Bool)

(declare-fun lt!236861 () SeekEntryResult!4387)

(assert (=> d!79733 (and (or (is-Undefined!4387 lt!236861) (not (is-Found!4387 lt!236861)) (and (bvsge (index!19737 lt!236861) #b00000000000000000000000000000000) (bvslt (index!19737 lt!236861) (size!16284 a!3235)))) (or (is-Undefined!4387 lt!236861) (is-Found!4387 lt!236861) (not (is-MissingZero!4387 lt!236861)) (and (bvsge (index!19736 lt!236861) #b00000000000000000000000000000000) (bvslt (index!19736 lt!236861) (size!16284 a!3235)))) (or (is-Undefined!4387 lt!236861) (is-Found!4387 lt!236861) (is-MissingZero!4387 lt!236861) (not (is-MissingVacant!4387 lt!236861)) (and (bvsge (index!19739 lt!236861) #b00000000000000000000000000000000) (bvslt (index!19739 lt!236861) (size!16284 a!3235)))) (or (is-Undefined!4387 lt!236861) (ite (is-Found!4387 lt!236861) (= (select (arr!15920 a!3235) (index!19737 lt!236861)) (select (arr!15920 a!3235) j!176)) (ite (is-MissingZero!4387 lt!236861) (= (select (arr!15920 a!3235) (index!19736 lt!236861)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4387 lt!236861) (= (select (arr!15920 a!3235) (index!19739 lt!236861)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79733 (= lt!236861 e!301944)))

(declare-fun c!60669 () Bool)

(assert (=> d!79733 (= c!60669 (and (is-Intermediate!4387 lt!236862) (undefined!5199 lt!236862)))))

(assert (=> d!79733 (= lt!236862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15920 a!3235) j!176) mask!3524) (select (arr!15920 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79733 (validMask!0 mask!3524)))

(assert (=> d!79733 (= (seekEntryOrOpen!0 (select (arr!15920 a!3235) j!176) a!3235 mask!3524) lt!236861)))

(declare-fun b!517435 () Bool)

(assert (=> b!517435 (= e!301945 (Found!4387 (index!19738 lt!236862)))))

(declare-fun b!517436 () Bool)

(assert (=> b!517436 (= e!301943 (seekKeyOrZeroReturnVacant!0 (x!48692 lt!236862) (index!19738 lt!236862) (index!19738 lt!236862) (select (arr!15920 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!79733 c!60669) b!517433))

(assert (= (and d!79733 (not c!60669)) b!517431))

(assert (= (and b!517431 c!60667) b!517435))

(assert (= (and b!517431 (not c!60667)) b!517432))

(assert (= (and b!517432 c!60668) b!517434))

(assert (= (and b!517432 (not c!60668)) b!517436))

(declare-fun m!498873 () Bool)

(assert (=> b!517431 m!498873))

(assert (=> d!79733 m!498709))

(declare-fun m!498875 () Bool)

(assert (=> d!79733 m!498875))

(assert (=> d!79733 m!498697))

(assert (=> d!79733 m!498725))

(declare-fun m!498877 () Bool)

(assert (=> d!79733 m!498877))

(declare-fun m!498879 () Bool)

(assert (=> d!79733 m!498879))

(assert (=> d!79733 m!498725))

(assert (=> d!79733 m!498697))

(declare-fun m!498881 () Bool)

(assert (=> d!79733 m!498881))

(assert (=> b!517436 m!498697))

(declare-fun m!498883 () Bool)

(assert (=> b!517436 m!498883))

(assert (=> b!517225 d!79733))

(declare-fun d!79735 () Bool)

(declare-fun res!316701 () Bool)

(declare-fun e!301970 () Bool)

(assert (=> d!79735 (=> res!316701 e!301970)))

(assert (=> d!79735 (= res!316701 (bvsge #b00000000000000000000000000000000 (size!16284 a!3235)))))

(assert (=> d!79735 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10075) e!301970)))

(declare-fun b!517466 () Bool)

(declare-fun e!301969 () Bool)

(assert (=> b!517466 (= e!301970 e!301969)))

(declare-fun res!316699 () Bool)

(assert (=> b!517466 (=> (not res!316699) (not e!301969))))

(declare-fun e!301968 () Bool)

(assert (=> b!517466 (= res!316699 (not e!301968))))

(declare-fun res!316700 () Bool)

(assert (=> b!517466 (=> (not res!316700) (not e!301968))))

(assert (=> b!517466 (= res!316700 (validKeyInArray!0 (select (arr!15920 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517467 () Bool)

(declare-fun contains!2745 (List!10078 (_ BitVec 64)) Bool)

(assert (=> b!517467 (= e!301968 (contains!2745 Nil!10075 (select (arr!15920 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517468 () Bool)

(declare-fun e!301967 () Bool)

(assert (=> b!517468 (= e!301969 e!301967)))

(declare-fun c!60675 () Bool)

(assert (=> b!517468 (= c!60675 (validKeyInArray!0 (select (arr!15920 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31677 () Bool)

(declare-fun call!31680 () Bool)

(assert (=> bm!31677 (= call!31680 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60675 (Cons!10074 (select (arr!15920 a!3235) #b00000000000000000000000000000000) Nil!10075) Nil!10075)))))

(declare-fun b!517469 () Bool)

(assert (=> b!517469 (= e!301967 call!31680)))

(declare-fun b!517470 () Bool)

(assert (=> b!517470 (= e!301967 call!31680)))

(assert (= (and d!79735 (not res!316701)) b!517466))

(assert (= (and b!517466 res!316700) b!517467))

(assert (= (and b!517466 res!316699) b!517468))

(assert (= (and b!517468 c!60675) b!517470))

(assert (= (and b!517468 (not c!60675)) b!517469))

(assert (= (or b!517470 b!517469) bm!31677))

(assert (=> b!517466 m!498833))

(assert (=> b!517466 m!498833))

(assert (=> b!517466 m!498841))

(assert (=> b!517467 m!498833))

(assert (=> b!517467 m!498833))

(declare-fun m!498895 () Bool)

(assert (=> b!517467 m!498895))

(assert (=> b!517468 m!498833))

(assert (=> b!517468 m!498833))

(assert (=> b!517468 m!498841))

(assert (=> bm!31677 m!498833))

(declare-fun m!498897 () Bool)

(assert (=> bm!31677 m!498897))

(assert (=> b!517230 d!79735))

(declare-fun d!79739 () Bool)

(declare-fun lt!236881 () (_ BitVec 32))

(declare-fun lt!236880 () (_ BitVec 32))

(assert (=> d!79739 (= lt!236881 (bvmul (bvxor lt!236880 (bvlshr lt!236880 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79739 (= lt!236880 ((_ extract 31 0) (bvand (bvxor (select (arr!15920 a!3235) j!176) (bvlshr (select (arr!15920 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79739 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316702 (let ((h!10978 ((_ extract 31 0) (bvand (bvxor (select (arr!15920 a!3235) j!176) (bvlshr (select (arr!15920 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48697 (bvmul (bvxor h!10978 (bvlshr h!10978 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48697 (bvlshr x!48697 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316702 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316702 #b00000000000000000000000000000000))))))

(assert (=> d!79739 (= (toIndex!0 (select (arr!15920 a!3235) j!176) mask!3524) (bvand (bvxor lt!236881 (bvlshr lt!236881 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517231 d!79739))

(declare-fun b!517502 () Bool)

(declare-fun e!301993 () SeekEntryResult!4387)

(declare-fun e!301989 () SeekEntryResult!4387)

(assert (=> b!517502 (= e!301993 e!301989)))

(declare-fun c!60688 () Bool)

(declare-fun lt!236891 () (_ BitVec 64))

(assert (=> b!517502 (= c!60688 (or (= lt!236891 (select (arr!15920 a!3235) j!176)) (= (bvadd lt!236891 lt!236891) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517503 () Bool)

(declare-fun lt!236892 () SeekEntryResult!4387)

(assert (=> b!517503 (and (bvsge (index!19738 lt!236892) #b00000000000000000000000000000000) (bvslt (index!19738 lt!236892) (size!16284 a!3235)))))

(declare-fun e!301992 () Bool)

(assert (=> b!517503 (= e!301992 (= (select (arr!15920 a!3235) (index!19738 lt!236892)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79747 () Bool)

(declare-fun e!301991 () Bool)

(assert (=> d!79747 e!301991))

(declare-fun c!60687 () Bool)

(assert (=> d!79747 (= c!60687 (and (is-Intermediate!4387 lt!236892) (undefined!5199 lt!236892)))))

(assert (=> d!79747 (= lt!236892 e!301993)))

(declare-fun c!60686 () Bool)

(assert (=> d!79747 (= c!60686 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79747 (= lt!236891 (select (arr!15920 a!3235) lt!236769))))

(assert (=> d!79747 (validMask!0 mask!3524)))

(assert (=> d!79747 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236769 (select (arr!15920 a!3235) j!176) a!3235 mask!3524) lt!236892)))

(declare-fun b!517504 () Bool)

(assert (=> b!517504 (and (bvsge (index!19738 lt!236892) #b00000000000000000000000000000000) (bvslt (index!19738 lt!236892) (size!16284 a!3235)))))

(declare-fun res!316714 () Bool)

(assert (=> b!517504 (= res!316714 (= (select (arr!15920 a!3235) (index!19738 lt!236892)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517504 (=> res!316714 e!301992)))

(declare-fun b!517505 () Bool)

(assert (=> b!517505 (and (bvsge (index!19738 lt!236892) #b00000000000000000000000000000000) (bvslt (index!19738 lt!236892) (size!16284 a!3235)))))

(declare-fun res!316716 () Bool)

(assert (=> b!517505 (= res!316716 (= (select (arr!15920 a!3235) (index!19738 lt!236892)) (select (arr!15920 a!3235) j!176)))))

(assert (=> b!517505 (=> res!316716 e!301992)))

(declare-fun e!301990 () Bool)

(assert (=> b!517505 (= e!301990 e!301992)))

(declare-fun b!517506 () Bool)

(assert (=> b!517506 (= e!301989 (Intermediate!4387 false lt!236769 #b00000000000000000000000000000000))))

(declare-fun b!517507 () Bool)

(assert (=> b!517507 (= e!301991 e!301990)))

(declare-fun res!316715 () Bool)

(assert (=> b!517507 (= res!316715 (and (is-Intermediate!4387 lt!236892) (not (undefined!5199 lt!236892)) (bvslt (x!48692 lt!236892) #b01111111111111111111111111111110) (bvsge (x!48692 lt!236892) #b00000000000000000000000000000000) (bvsge (x!48692 lt!236892) #b00000000000000000000000000000000)))))

(assert (=> b!517507 (=> (not res!316715) (not e!301990))))

(declare-fun b!517508 () Bool)

(assert (=> b!517508 (= e!301993 (Intermediate!4387 true lt!236769 #b00000000000000000000000000000000))))

(declare-fun b!517509 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517509 (= e!301989 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236769 #b00000000000000000000000000000000 mask!3524) (select (arr!15920 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517510 () Bool)

(assert (=> b!517510 (= e!301991 (bvsge (x!48692 lt!236892) #b01111111111111111111111111111110))))

(assert (= (and d!79747 c!60686) b!517508))

(assert (= (and d!79747 (not c!60686)) b!517502))

(assert (= (and b!517502 c!60688) b!517506))

(assert (= (and b!517502 (not c!60688)) b!517509))

(assert (= (and d!79747 c!60687) b!517510))

(assert (= (and d!79747 (not c!60687)) b!517507))

(assert (= (and b!517507 res!316715) b!517505))

(assert (= (and b!517505 (not res!316716)) b!517504))

(assert (= (and b!517504 (not res!316714)) b!517503))

(declare-fun m!498915 () Bool)

(assert (=> d!79747 m!498915))

(assert (=> d!79747 m!498709))

(declare-fun m!498917 () Bool)

(assert (=> b!517509 m!498917))

(assert (=> b!517509 m!498917))

(assert (=> b!517509 m!498697))

(declare-fun m!498919 () Bool)

(assert (=> b!517509 m!498919))

(declare-fun m!498921 () Bool)

(assert (=> b!517505 m!498921))

(assert (=> b!517504 m!498921))

(assert (=> b!517503 m!498921))

(assert (=> b!517231 d!79747))

(declare-fun d!79751 () Bool)

(declare-fun res!316717 () Bool)

(declare-fun e!301996 () Bool)

(assert (=> d!79751 (=> res!316717 e!301996)))

(assert (=> d!79751 (= res!316717 (bvsge j!176 (size!16284 a!3235)))))

(assert (=> d!79751 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!301996)))

(declare-fun b!517511 () Bool)

(declare-fun e!301995 () Bool)

(declare-fun call!31682 () Bool)

(assert (=> b!517511 (= e!301995 call!31682)))

(declare-fun b!517512 () Bool)

(declare-fun e!301994 () Bool)

(assert (=> b!517512 (= e!301994 call!31682)))

(declare-fun b!517513 () Bool)

(assert (=> b!517513 (= e!301994 e!301995)))

(declare-fun lt!236895 () (_ BitVec 64))

(assert (=> b!517513 (= lt!236895 (select (arr!15920 a!3235) j!176))))

(declare-fun lt!236894 () Unit!16032)

(assert (=> b!517513 (= lt!236894 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236895 j!176))))

(assert (=> b!517513 (arrayContainsKey!0 a!3235 lt!236895 #b00000000000000000000000000000000)))

(declare-fun lt!236893 () Unit!16032)

(assert (=> b!517513 (= lt!236893 lt!236894)))

(declare-fun res!316718 () Bool)

(assert (=> b!517513 (= res!316718 (= (seekEntryOrOpen!0 (select (arr!15920 a!3235) j!176) a!3235 mask!3524) (Found!4387 j!176)))))

(assert (=> b!517513 (=> (not res!316718) (not e!301995))))

(declare-fun b!517514 () Bool)

(assert (=> b!517514 (= e!301996 e!301994)))

(declare-fun c!60689 () Bool)

(assert (=> b!517514 (= c!60689 (validKeyInArray!0 (select (arr!15920 a!3235) j!176)))))

(declare-fun bm!31679 () Bool)

(assert (=> bm!31679 (= call!31682 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79751 (not res!316717)) b!517514))

(assert (= (and b!517514 c!60689) b!517513))

(assert (= (and b!517514 (not c!60689)) b!517512))

(assert (= (and b!517513 res!316718) b!517511))

(assert (= (or b!517511 b!517512) bm!31679))

(assert (=> b!517513 m!498697))

(declare-fun m!498923 () Bool)

(assert (=> b!517513 m!498923))

(declare-fun m!498925 () Bool)

(assert (=> b!517513 m!498925))

(assert (=> b!517513 m!498697))

(assert (=> b!517513 m!498699))

(assert (=> b!517514 m!498697))

(assert (=> b!517514 m!498697))

(assert (=> b!517514 m!498717))

(declare-fun m!498927 () Bool)

(assert (=> bm!31679 m!498927))

(assert (=> b!517231 d!79751))

(declare-fun b!517515 () Bool)

(declare-fun e!302001 () SeekEntryResult!4387)

(declare-fun e!301997 () SeekEntryResult!4387)

(assert (=> b!517515 (= e!302001 e!301997)))

(declare-fun c!60692 () Bool)

(declare-fun lt!236896 () (_ BitVec 64))

(assert (=> b!517515 (= c!60692 (or (= lt!236896 (select (store (arr!15920 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!236896 lt!236896) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!236897 () SeekEntryResult!4387)

(declare-fun b!517516 () Bool)

(assert (=> b!517516 (and (bvsge (index!19738 lt!236897) #b00000000000000000000000000000000) (bvslt (index!19738 lt!236897) (size!16284 (array!33108 (store (arr!15920 a!3235) i!1204 k!2280) (size!16284 a!3235)))))))

(declare-fun e!302000 () Bool)

(assert (=> b!517516 (= e!302000 (= (select (arr!15920 (array!33108 (store (arr!15920 a!3235) i!1204 k!2280) (size!16284 a!3235))) (index!19738 lt!236897)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79753 () Bool)

(declare-fun e!301999 () Bool)

(assert (=> d!79753 e!301999))

(declare-fun c!60691 () Bool)

(assert (=> d!79753 (= c!60691 (and (is-Intermediate!4387 lt!236897) (undefined!5199 lt!236897)))))

(assert (=> d!79753 (= lt!236897 e!302001)))

(declare-fun c!60690 () Bool)

(assert (=> d!79753 (= c!60690 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79753 (= lt!236896 (select (arr!15920 (array!33108 (store (arr!15920 a!3235) i!1204 k!2280) (size!16284 a!3235))) lt!236773))))

(assert (=> d!79753 (validMask!0 mask!3524)))

(assert (=> d!79753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236773 (select (store (arr!15920 a!3235) i!1204 k!2280) j!176) (array!33108 (store (arr!15920 a!3235) i!1204 k!2280) (size!16284 a!3235)) mask!3524) lt!236897)))

(declare-fun b!517517 () Bool)

(assert (=> b!517517 (and (bvsge (index!19738 lt!236897) #b00000000000000000000000000000000) (bvslt (index!19738 lt!236897) (size!16284 (array!33108 (store (arr!15920 a!3235) i!1204 k!2280) (size!16284 a!3235)))))))

(declare-fun res!316719 () Bool)

(assert (=> b!517517 (= res!316719 (= (select (arr!15920 (array!33108 (store (arr!15920 a!3235) i!1204 k!2280) (size!16284 a!3235))) (index!19738 lt!236897)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517517 (=> res!316719 e!302000)))

(declare-fun b!517518 () Bool)

(assert (=> b!517518 (and (bvsge (index!19738 lt!236897) #b00000000000000000000000000000000) (bvslt (index!19738 lt!236897) (size!16284 (array!33108 (store (arr!15920 a!3235) i!1204 k!2280) (size!16284 a!3235)))))))

(declare-fun res!316721 () Bool)

(assert (=> b!517518 (= res!316721 (= (select (arr!15920 (array!33108 (store (arr!15920 a!3235) i!1204 k!2280) (size!16284 a!3235))) (index!19738 lt!236897)) (select (store (arr!15920 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!517518 (=> res!316721 e!302000)))

(declare-fun e!301998 () Bool)

(assert (=> b!517518 (= e!301998 e!302000)))

(declare-fun b!517519 () Bool)

(assert (=> b!517519 (= e!301997 (Intermediate!4387 false lt!236773 #b00000000000000000000000000000000))))

(declare-fun b!517520 () Bool)

(assert (=> b!517520 (= e!301999 e!301998)))

(declare-fun res!316720 () Bool)

(assert (=> b!517520 (= res!316720 (and (is-Intermediate!4387 lt!236897) (not (undefined!5199 lt!236897)) (bvslt (x!48692 lt!236897) #b01111111111111111111111111111110) (bvsge (x!48692 lt!236897) #b00000000000000000000000000000000) (bvsge (x!48692 lt!236897) #b00000000000000000000000000000000)))))

(assert (=> b!517520 (=> (not res!316720) (not e!301998))))

(declare-fun b!517521 () Bool)

(assert (=> b!517521 (= e!302001 (Intermediate!4387 true lt!236773 #b00000000000000000000000000000000))))

(declare-fun b!517522 () Bool)

(assert (=> b!517522 (= e!301997 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236773 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15920 a!3235) i!1204 k!2280) j!176) (array!33108 (store (arr!15920 a!3235) i!1204 k!2280) (size!16284 a!3235)) mask!3524))))

(declare-fun b!517523 () Bool)

(assert (=> b!517523 (= e!301999 (bvsge (x!48692 lt!236897) #b01111111111111111111111111111110))))

(assert (= (and d!79753 c!60690) b!517521))

(assert (= (and d!79753 (not c!60690)) b!517515))

(assert (= (and b!517515 c!60692) b!517519))

(assert (= (and b!517515 (not c!60692)) b!517522))

(assert (= (and d!79753 c!60691) b!517523))

(assert (= (and d!79753 (not c!60691)) b!517520))

(assert (= (and b!517520 res!316720) b!517518))

(assert (= (and b!517518 (not res!316721)) b!517517))

(assert (= (and b!517517 (not res!316719)) b!517516))

(declare-fun m!498929 () Bool)

(assert (=> d!79753 m!498929))

(assert (=> d!79753 m!498709))

(declare-fun m!498931 () Bool)

(assert (=> b!517522 m!498931))

(assert (=> b!517522 m!498931))

(assert (=> b!517522 m!498723))

(declare-fun m!498933 () Bool)

(assert (=> b!517522 m!498933))

(declare-fun m!498935 () Bool)

(assert (=> b!517518 m!498935))

(assert (=> b!517517 m!498935))

(assert (=> b!517516 m!498935))

(assert (=> b!517231 d!79753))

(declare-fun d!79755 () Bool)

(assert (=> d!79755 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!236900 () Unit!16032)

(declare-fun choose!38 (array!33107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16032)

(assert (=> d!79755 (= lt!236900 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79755 (validMask!0 mask!3524)))

(assert (=> d!79755 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!236900)))

(declare-fun bs!16338 () Bool)

(assert (= bs!16338 d!79755))

(assert (=> bs!16338 m!498729))

(declare-fun m!498937 () Bool)

(assert (=> bs!16338 m!498937))

(assert (=> bs!16338 m!498709))

(assert (=> b!517231 d!79755))

(declare-fun d!79757 () Bool)

(declare-fun lt!236902 () (_ BitVec 32))

(declare-fun lt!236901 () (_ BitVec 32))

(assert (=> d!79757 (= lt!236902 (bvmul (bvxor lt!236901 (bvlshr lt!236901 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79757 (= lt!236901 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15920 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15920 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79757 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316702 (let ((h!10978 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15920 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15920 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48697 (bvmul (bvxor h!10978 (bvlshr h!10978 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48697 (bvlshr x!48697 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316702 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316702 #b00000000000000000000000000000000))))))

(assert (=> d!79757 (= (toIndex!0 (select (store (arr!15920 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!236902 (bvlshr lt!236902 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517231 d!79757))

(push 1)

