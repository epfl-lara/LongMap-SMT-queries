; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47904 () Bool)

(assert start!47904)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33482 0))(
  ( (array!33483 (arr!16091 (Array (_ BitVec 32) (_ BitVec 64))) (size!16456 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33482)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!307441 () Bool)

(declare-datatypes ((SeekEntryResult!4555 0))(
  ( (MissingZero!4555 (index!20438 (_ BitVec 32))) (Found!4555 (index!20439 (_ BitVec 32))) (Intermediate!4555 (undefined!5367 Bool) (index!20440 (_ BitVec 32)) (x!49415 (_ BitVec 32))) (Undefined!4555) (MissingVacant!4555 (index!20441 (_ BitVec 32))) )
))
(declare-fun lt!242804 () SeekEntryResult!4555)

(declare-fun b!527582 () Bool)

(declare-fun lt!242811 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33482 (_ BitVec 32)) SeekEntryResult!4555)

(assert (=> b!527582 (= e!307441 (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!242811 (index!20440 lt!242804) (select (arr!16091 a!3235) j!176) a!3235 mask!3524) (Found!4555 j!176)))))

(declare-fun b!527583 () Bool)

(declare-fun e!307440 () Bool)

(assert (=> b!527583 (= e!307440 false)))

(declare-fun b!527584 () Bool)

(declare-fun res!323994 () Bool)

(declare-fun e!307444 () Bool)

(assert (=> b!527584 (=> (not res!323994) (not e!307444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527584 (= res!323994 (validKeyInArray!0 (select (arr!16091 a!3235) j!176)))))

(declare-fun b!527585 () Bool)

(declare-fun e!307446 () Bool)

(assert (=> b!527585 (= e!307446 e!307441)))

(declare-fun res!323992 () Bool)

(assert (=> b!527585 (=> res!323992 e!307441)))

(assert (=> b!527585 (= res!323992 (or (bvsgt (x!49415 lt!242804) #b01111111111111111111111111111110) (bvslt lt!242811 #b00000000000000000000000000000000) (bvsge lt!242811 (size!16456 a!3235)) (bvslt (index!20440 lt!242804) #b00000000000000000000000000000000) (bvsge (index!20440 lt!242804) (size!16456 a!3235)) (not (= lt!242804 (Intermediate!4555 false (index!20440 lt!242804) (x!49415 lt!242804)))) (bvsle #b00000000000000000000000000000000 (x!49415 lt!242804))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527585 (= (index!20440 lt!242804) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!16666 0))(
  ( (Unit!16667) )
))
(declare-fun lt!242806 () Unit!16666)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16666)

(assert (=> b!527585 (= lt!242806 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242811 #b00000000000000000000000000000000 (index!20440 lt!242804) (x!49415 lt!242804) mask!3524))))

(assert (=> b!527585 (and (or (= (select (arr!16091 a!3235) (index!20440 lt!242804)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16091 a!3235) (index!20440 lt!242804)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16091 a!3235) (index!20440 lt!242804)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16091 a!3235) (index!20440 lt!242804)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242803 () Unit!16666)

(declare-fun e!307445 () Unit!16666)

(assert (=> b!527585 (= lt!242803 e!307445)))

(declare-fun c!62103 () Bool)

(assert (=> b!527585 (= c!62103 (= (select (arr!16091 a!3235) (index!20440 lt!242804)) (select (arr!16091 a!3235) j!176)))))

(assert (=> b!527585 (and (bvslt (x!49415 lt!242804) #b01111111111111111111111111111110) (or (= (select (arr!16091 a!3235) (index!20440 lt!242804)) (select (arr!16091 a!3235) j!176)) (= (select (arr!16091 a!3235) (index!20440 lt!242804)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16091 a!3235) (index!20440 lt!242804)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527586 () Bool)

(declare-fun res!324002 () Bool)

(assert (=> b!527586 (=> res!324002 e!307446)))

(get-info :version)

(assert (=> b!527586 (= res!324002 (or (undefined!5367 lt!242804) (not ((_ is Intermediate!4555) lt!242804))))))

(declare-fun b!527587 () Bool)

(declare-fun e!307443 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33482 (_ BitVec 32)) SeekEntryResult!4555)

(assert (=> b!527587 (= e!307443 (= (seekEntryOrOpen!0 (select (arr!16091 a!3235) j!176) a!3235 mask!3524) (Found!4555 j!176)))))

(declare-fun b!527588 () Bool)

(declare-fun res!323993 () Bool)

(assert (=> b!527588 (=> (not res!323993) (not e!307444))))

(assert (=> b!527588 (= res!323993 (validKeyInArray!0 k0!2280))))

(declare-fun b!527589 () Bool)

(declare-fun res!324001 () Bool)

(assert (=> b!527589 (=> (not res!324001) (not e!307444))))

(declare-fun arrayContainsKey!0 (array!33482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527589 (= res!324001 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!323991 () Bool)

(assert (=> start!47904 (=> (not res!323991) (not e!307444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47904 (= res!323991 (validMask!0 mask!3524))))

(assert (=> start!47904 e!307444))

(assert (=> start!47904 true))

(declare-fun array_inv!11974 (array!33482) Bool)

(assert (=> start!47904 (array_inv!11974 a!3235)))

(declare-fun b!527590 () Bool)

(declare-fun Unit!16668 () Unit!16666)

(assert (=> b!527590 (= e!307445 Unit!16668)))

(declare-fun lt!242810 () Unit!16666)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16666)

(assert (=> b!527590 (= lt!242810 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242811 #b00000000000000000000000000000000 (index!20440 lt!242804) (x!49415 lt!242804) mask!3524))))

(declare-fun lt!242807 () (_ BitVec 64))

(declare-fun res!323998 () Bool)

(declare-fun lt!242808 () array!33482)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33482 (_ BitVec 32)) SeekEntryResult!4555)

(assert (=> b!527590 (= res!323998 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242811 lt!242807 lt!242808 mask!3524) (Intermediate!4555 false (index!20440 lt!242804) (x!49415 lt!242804))))))

(assert (=> b!527590 (=> (not res!323998) (not e!307440))))

(assert (=> b!527590 e!307440))

(declare-fun b!527591 () Bool)

(declare-fun e!307439 () Bool)

(assert (=> b!527591 (= e!307439 (not e!307446))))

(declare-fun res!323996 () Bool)

(assert (=> b!527591 (=> res!323996 e!307446)))

(declare-fun lt!242809 () (_ BitVec 32))

(assert (=> b!527591 (= res!323996 (= lt!242804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242809 lt!242807 lt!242808 mask!3524)))))

(assert (=> b!527591 (= lt!242804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242811 (select (arr!16091 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527591 (= lt!242809 (toIndex!0 lt!242807 mask!3524))))

(assert (=> b!527591 (= lt!242807 (select (store (arr!16091 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527591 (= lt!242811 (toIndex!0 (select (arr!16091 a!3235) j!176) mask!3524))))

(assert (=> b!527591 (= lt!242808 (array!33483 (store (arr!16091 a!3235) i!1204 k0!2280) (size!16456 a!3235)))))

(assert (=> b!527591 e!307443))

(declare-fun res!324000 () Bool)

(assert (=> b!527591 (=> (not res!324000) (not e!307443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33482 (_ BitVec 32)) Bool)

(assert (=> b!527591 (= res!324000 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242805 () Unit!16666)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16666)

(assert (=> b!527591 (= lt!242805 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527592 () Bool)

(declare-fun Unit!16669 () Unit!16666)

(assert (=> b!527592 (= e!307445 Unit!16669)))

(declare-fun b!527593 () Bool)

(assert (=> b!527593 (= e!307444 e!307439)))

(declare-fun res!323999 () Bool)

(assert (=> b!527593 (=> (not res!323999) (not e!307439))))

(declare-fun lt!242812 () SeekEntryResult!4555)

(assert (=> b!527593 (= res!323999 (or (= lt!242812 (MissingZero!4555 i!1204)) (= lt!242812 (MissingVacant!4555 i!1204))))))

(assert (=> b!527593 (= lt!242812 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527594 () Bool)

(declare-fun res!323990 () Bool)

(assert (=> b!527594 (=> (not res!323990) (not e!307444))))

(assert (=> b!527594 (= res!323990 (and (= (size!16456 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16456 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16456 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527595 () Bool)

(declare-fun res!323995 () Bool)

(assert (=> b!527595 (=> (not res!323995) (not e!307439))))

(assert (=> b!527595 (= res!323995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527596 () Bool)

(declare-fun res!323997 () Bool)

(assert (=> b!527596 (=> (not res!323997) (not e!307439))))

(declare-datatypes ((List!10288 0))(
  ( (Nil!10285) (Cons!10284 (h!11218 (_ BitVec 64)) (t!16507 List!10288)) )
))
(declare-fun arrayNoDuplicates!0 (array!33482 (_ BitVec 32) List!10288) Bool)

(assert (=> b!527596 (= res!323997 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10285))))

(assert (= (and start!47904 res!323991) b!527594))

(assert (= (and b!527594 res!323990) b!527584))

(assert (= (and b!527584 res!323994) b!527588))

(assert (= (and b!527588 res!323993) b!527589))

(assert (= (and b!527589 res!324001) b!527593))

(assert (= (and b!527593 res!323999) b!527595))

(assert (= (and b!527595 res!323995) b!527596))

(assert (= (and b!527596 res!323997) b!527591))

(assert (= (and b!527591 res!324000) b!527587))

(assert (= (and b!527591 (not res!323996)) b!527586))

(assert (= (and b!527586 (not res!324002)) b!527585))

(assert (= (and b!527585 c!62103) b!527590))

(assert (= (and b!527585 (not c!62103)) b!527592))

(assert (= (and b!527590 res!323998) b!527583))

(assert (= (and b!527585 (not res!323992)) b!527582))

(declare-fun m!507769 () Bool)

(assert (=> b!527587 m!507769))

(assert (=> b!527587 m!507769))

(declare-fun m!507771 () Bool)

(assert (=> b!527587 m!507771))

(declare-fun m!507773 () Bool)

(assert (=> start!47904 m!507773))

(declare-fun m!507775 () Bool)

(assert (=> start!47904 m!507775))

(declare-fun m!507777 () Bool)

(assert (=> b!527595 m!507777))

(assert (=> b!527582 m!507769))

(assert (=> b!527582 m!507769))

(declare-fun m!507779 () Bool)

(assert (=> b!527582 m!507779))

(declare-fun m!507781 () Bool)

(assert (=> b!527585 m!507781))

(declare-fun m!507783 () Bool)

(assert (=> b!527585 m!507783))

(assert (=> b!527585 m!507769))

(declare-fun m!507785 () Bool)

(assert (=> b!527589 m!507785))

(declare-fun m!507787 () Bool)

(assert (=> b!527590 m!507787))

(declare-fun m!507789 () Bool)

(assert (=> b!527590 m!507789))

(declare-fun m!507791 () Bool)

(assert (=> b!527596 m!507791))

(declare-fun m!507793 () Bool)

(assert (=> b!527588 m!507793))

(declare-fun m!507795 () Bool)

(assert (=> b!527591 m!507795))

(declare-fun m!507797 () Bool)

(assert (=> b!527591 m!507797))

(declare-fun m!507799 () Bool)

(assert (=> b!527591 m!507799))

(declare-fun m!507801 () Bool)

(assert (=> b!527591 m!507801))

(declare-fun m!507803 () Bool)

(assert (=> b!527591 m!507803))

(assert (=> b!527591 m!507769))

(declare-fun m!507805 () Bool)

(assert (=> b!527591 m!507805))

(assert (=> b!527591 m!507769))

(declare-fun m!507807 () Bool)

(assert (=> b!527591 m!507807))

(assert (=> b!527591 m!507769))

(declare-fun m!507809 () Bool)

(assert (=> b!527591 m!507809))

(assert (=> b!527584 m!507769))

(assert (=> b!527584 m!507769))

(declare-fun m!507811 () Bool)

(assert (=> b!527584 m!507811))

(declare-fun m!507813 () Bool)

(assert (=> b!527593 m!507813))

(check-sat (not b!527584) (not b!527588) (not b!527590) (not b!527589) (not b!527593) (not b!527587) (not b!527596) (not b!527591) (not b!527595) (not start!47904) (not b!527585) (not b!527582))
(check-sat)
(get-model)

(declare-fun d!80685 () Bool)

(assert (=> d!80685 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!527588 d!80685))

(declare-fun lt!242880 () SeekEntryResult!4555)

(declare-fun e!307501 () SeekEntryResult!4555)

(declare-fun b!527699 () Bool)

(assert (=> b!527699 (= e!307501 (seekKeyOrZeroReturnVacant!0 (x!49415 lt!242880) (index!20440 lt!242880) (index!20440 lt!242880) (select (arr!16091 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!527700 () Bool)

(declare-fun c!62117 () Bool)

(declare-fun lt!242879 () (_ BitVec 64))

(assert (=> b!527700 (= c!62117 (= lt!242879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307502 () SeekEntryResult!4555)

(assert (=> b!527700 (= e!307502 e!307501)))

(declare-fun b!527701 () Bool)

(assert (=> b!527701 (= e!307502 (Found!4555 (index!20440 lt!242880)))))

(declare-fun b!527702 () Bool)

(declare-fun e!307503 () SeekEntryResult!4555)

(assert (=> b!527702 (= e!307503 Undefined!4555)))

(declare-fun d!80687 () Bool)

(declare-fun lt!242881 () SeekEntryResult!4555)

(assert (=> d!80687 (and (or ((_ is Undefined!4555) lt!242881) (not ((_ is Found!4555) lt!242881)) (and (bvsge (index!20439 lt!242881) #b00000000000000000000000000000000) (bvslt (index!20439 lt!242881) (size!16456 a!3235)))) (or ((_ is Undefined!4555) lt!242881) ((_ is Found!4555) lt!242881) (not ((_ is MissingZero!4555) lt!242881)) (and (bvsge (index!20438 lt!242881) #b00000000000000000000000000000000) (bvslt (index!20438 lt!242881) (size!16456 a!3235)))) (or ((_ is Undefined!4555) lt!242881) ((_ is Found!4555) lt!242881) ((_ is MissingZero!4555) lt!242881) (not ((_ is MissingVacant!4555) lt!242881)) (and (bvsge (index!20441 lt!242881) #b00000000000000000000000000000000) (bvslt (index!20441 lt!242881) (size!16456 a!3235)))) (or ((_ is Undefined!4555) lt!242881) (ite ((_ is Found!4555) lt!242881) (= (select (arr!16091 a!3235) (index!20439 lt!242881)) (select (arr!16091 a!3235) j!176)) (ite ((_ is MissingZero!4555) lt!242881) (= (select (arr!16091 a!3235) (index!20438 lt!242881)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4555) lt!242881) (= (select (arr!16091 a!3235) (index!20441 lt!242881)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80687 (= lt!242881 e!307503)))

(declare-fun c!62116 () Bool)

(assert (=> d!80687 (= c!62116 (and ((_ is Intermediate!4555) lt!242880) (undefined!5367 lt!242880)))))

(assert (=> d!80687 (= lt!242880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16091 a!3235) j!176) mask!3524) (select (arr!16091 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80687 (validMask!0 mask!3524)))

(assert (=> d!80687 (= (seekEntryOrOpen!0 (select (arr!16091 a!3235) j!176) a!3235 mask!3524) lt!242881)))

(declare-fun b!527703 () Bool)

(assert (=> b!527703 (= e!307503 e!307502)))

(assert (=> b!527703 (= lt!242879 (select (arr!16091 a!3235) (index!20440 lt!242880)))))

(declare-fun c!62118 () Bool)

(assert (=> b!527703 (= c!62118 (= lt!242879 (select (arr!16091 a!3235) j!176)))))

(declare-fun b!527704 () Bool)

(assert (=> b!527704 (= e!307501 (MissingZero!4555 (index!20440 lt!242880)))))

(assert (= (and d!80687 c!62116) b!527702))

(assert (= (and d!80687 (not c!62116)) b!527703))

(assert (= (and b!527703 c!62118) b!527701))

(assert (= (and b!527703 (not c!62118)) b!527700))

(assert (= (and b!527700 c!62117) b!527704))

(assert (= (and b!527700 (not c!62117)) b!527699))

(assert (=> b!527699 m!507769))

(declare-fun m!507907 () Bool)

(assert (=> b!527699 m!507907))

(declare-fun m!507909 () Bool)

(assert (=> d!80687 m!507909))

(assert (=> d!80687 m!507805))

(assert (=> d!80687 m!507769))

(declare-fun m!507911 () Bool)

(assert (=> d!80687 m!507911))

(assert (=> d!80687 m!507769))

(assert (=> d!80687 m!507805))

(declare-fun m!507913 () Bool)

(assert (=> d!80687 m!507913))

(declare-fun m!507915 () Bool)

(assert (=> d!80687 m!507915))

(assert (=> d!80687 m!507773))

(declare-fun m!507917 () Bool)

(assert (=> b!527703 m!507917))

(assert (=> b!527587 d!80687))

(declare-fun d!80689 () Bool)

(declare-fun e!307524 () Bool)

(assert (=> d!80689 e!307524))

(declare-fun c!62135 () Bool)

(declare-fun lt!242893 () SeekEntryResult!4555)

(assert (=> d!80689 (= c!62135 (and ((_ is Intermediate!4555) lt!242893) (undefined!5367 lt!242893)))))

(declare-fun e!307523 () SeekEntryResult!4555)

(assert (=> d!80689 (= lt!242893 e!307523)))

(declare-fun c!62134 () Bool)

(assert (=> d!80689 (= c!62134 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242892 () (_ BitVec 64))

(assert (=> d!80689 (= lt!242892 (select (arr!16091 lt!242808) lt!242809))))

(assert (=> d!80689 (validMask!0 mask!3524)))

(assert (=> d!80689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242809 lt!242807 lt!242808 mask!3524) lt!242893)))

(declare-fun b!527741 () Bool)

(declare-fun e!307525 () SeekEntryResult!4555)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527741 (= e!307525 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242809 #b00000000000000000000000000000000 mask!3524) lt!242807 lt!242808 mask!3524))))

(declare-fun b!527742 () Bool)

(assert (=> b!527742 (and (bvsge (index!20440 lt!242893) #b00000000000000000000000000000000) (bvslt (index!20440 lt!242893) (size!16456 lt!242808)))))

(declare-fun res!324087 () Bool)

(assert (=> b!527742 (= res!324087 (= (select (arr!16091 lt!242808) (index!20440 lt!242893)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307527 () Bool)

(assert (=> b!527742 (=> res!324087 e!307527)))

(declare-fun b!527743 () Bool)

(assert (=> b!527743 (and (bvsge (index!20440 lt!242893) #b00000000000000000000000000000000) (bvslt (index!20440 lt!242893) (size!16456 lt!242808)))))

(declare-fun res!324088 () Bool)

(assert (=> b!527743 (= res!324088 (= (select (arr!16091 lt!242808) (index!20440 lt!242893)) lt!242807))))

(assert (=> b!527743 (=> res!324088 e!307527)))

(declare-fun e!307526 () Bool)

(assert (=> b!527743 (= e!307526 e!307527)))

(declare-fun b!527744 () Bool)

(assert (=> b!527744 (= e!307525 (Intermediate!4555 false lt!242809 #b00000000000000000000000000000000))))

(declare-fun b!527745 () Bool)

(assert (=> b!527745 (= e!307524 (bvsge (x!49415 lt!242893) #b01111111111111111111111111111110))))

(declare-fun b!527746 () Bool)

(assert (=> b!527746 (= e!307523 (Intermediate!4555 true lt!242809 #b00000000000000000000000000000000))))

(declare-fun b!527747 () Bool)

(assert (=> b!527747 (= e!307524 e!307526)))

(declare-fun res!324089 () Bool)

(assert (=> b!527747 (= res!324089 (and ((_ is Intermediate!4555) lt!242893) (not (undefined!5367 lt!242893)) (bvslt (x!49415 lt!242893) #b01111111111111111111111111111110) (bvsge (x!49415 lt!242893) #b00000000000000000000000000000000) (bvsge (x!49415 lt!242893) #b00000000000000000000000000000000)))))

(assert (=> b!527747 (=> (not res!324089) (not e!307526))))

(declare-fun b!527748 () Bool)

(assert (=> b!527748 (and (bvsge (index!20440 lt!242893) #b00000000000000000000000000000000) (bvslt (index!20440 lt!242893) (size!16456 lt!242808)))))

(assert (=> b!527748 (= e!307527 (= (select (arr!16091 lt!242808) (index!20440 lt!242893)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!527749 () Bool)

(assert (=> b!527749 (= e!307523 e!307525)))

(declare-fun c!62136 () Bool)

(assert (=> b!527749 (= c!62136 (or (= lt!242892 lt!242807) (= (bvadd lt!242892 lt!242892) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80689 c!62134) b!527746))

(assert (= (and d!80689 (not c!62134)) b!527749))

(assert (= (and b!527749 c!62136) b!527744))

(assert (= (and b!527749 (not c!62136)) b!527741))

(assert (= (and d!80689 c!62135) b!527745))

(assert (= (and d!80689 (not c!62135)) b!527747))

(assert (= (and b!527747 res!324089) b!527743))

(assert (= (and b!527743 (not res!324088)) b!527742))

(assert (= (and b!527742 (not res!324087)) b!527748))

(declare-fun m!507929 () Bool)

(assert (=> b!527741 m!507929))

(assert (=> b!527741 m!507929))

(declare-fun m!507931 () Bool)

(assert (=> b!527741 m!507931))

(declare-fun m!507933 () Bool)

(assert (=> d!80689 m!507933))

(assert (=> d!80689 m!507773))

(declare-fun m!507935 () Bool)

(assert (=> b!527742 m!507935))

(assert (=> b!527743 m!507935))

(assert (=> b!527748 m!507935))

(assert (=> b!527591 d!80689))

(declare-fun d!80699 () Bool)

(declare-fun lt!242902 () (_ BitVec 32))

(declare-fun lt!242901 () (_ BitVec 32))

(assert (=> d!80699 (= lt!242902 (bvmul (bvxor lt!242901 (bvlshr lt!242901 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80699 (= lt!242901 ((_ extract 31 0) (bvand (bvxor (select (arr!16091 a!3235) j!176) (bvlshr (select (arr!16091 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80699 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!324090 (let ((h!11221 ((_ extract 31 0) (bvand (bvxor (select (arr!16091 a!3235) j!176) (bvlshr (select (arr!16091 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49420 (bvmul (bvxor h!11221 (bvlshr h!11221 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49420 (bvlshr x!49420 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!324090 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!324090 #b00000000000000000000000000000000))))))

(assert (=> d!80699 (= (toIndex!0 (select (arr!16091 a!3235) j!176) mask!3524) (bvand (bvxor lt!242902 (bvlshr lt!242902 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!527591 d!80699))

(declare-fun d!80703 () Bool)

(declare-fun lt!242904 () (_ BitVec 32))

(declare-fun lt!242903 () (_ BitVec 32))

(assert (=> d!80703 (= lt!242904 (bvmul (bvxor lt!242903 (bvlshr lt!242903 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80703 (= lt!242903 ((_ extract 31 0) (bvand (bvxor lt!242807 (bvlshr lt!242807 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80703 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!324090 (let ((h!11221 ((_ extract 31 0) (bvand (bvxor lt!242807 (bvlshr lt!242807 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49420 (bvmul (bvxor h!11221 (bvlshr h!11221 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49420 (bvlshr x!49420 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!324090 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!324090 #b00000000000000000000000000000000))))))

(assert (=> d!80703 (= (toIndex!0 lt!242807 mask!3524) (bvand (bvxor lt!242904 (bvlshr lt!242904 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!527591 d!80703))

(declare-fun b!527761 () Bool)

(declare-fun e!307537 () Bool)

(declare-fun call!31870 () Bool)

(assert (=> b!527761 (= e!307537 call!31870)))

(declare-fun b!527762 () Bool)

(declare-fun e!307538 () Bool)

(assert (=> b!527762 (= e!307538 e!307537)))

(declare-fun c!62139 () Bool)

(assert (=> b!527762 (= c!62139 (validKeyInArray!0 (select (arr!16091 a!3235) j!176)))))

(declare-fun d!80705 () Bool)

(declare-fun res!324099 () Bool)

(assert (=> d!80705 (=> res!324099 e!307538)))

(assert (=> d!80705 (= res!324099 (bvsge j!176 (size!16456 a!3235)))))

(assert (=> d!80705 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!307538)))

(declare-fun b!527763 () Bool)

(declare-fun e!307539 () Bool)

(assert (=> b!527763 (= e!307537 e!307539)))

(declare-fun lt!242911 () (_ BitVec 64))

(assert (=> b!527763 (= lt!242911 (select (arr!16091 a!3235) j!176))))

(declare-fun lt!242912 () Unit!16666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33482 (_ BitVec 64) (_ BitVec 32)) Unit!16666)

(assert (=> b!527763 (= lt!242912 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!242911 j!176))))

(assert (=> b!527763 (arrayContainsKey!0 a!3235 lt!242911 #b00000000000000000000000000000000)))

(declare-fun lt!242913 () Unit!16666)

(assert (=> b!527763 (= lt!242913 lt!242912)))

(declare-fun res!324098 () Bool)

(assert (=> b!527763 (= res!324098 (= (seekEntryOrOpen!0 (select (arr!16091 a!3235) j!176) a!3235 mask!3524) (Found!4555 j!176)))))

(assert (=> b!527763 (=> (not res!324098) (not e!307539))))

(declare-fun b!527764 () Bool)

(assert (=> b!527764 (= e!307539 call!31870)))

(declare-fun bm!31867 () Bool)

(assert (=> bm!31867 (= call!31870 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!80705 (not res!324099)) b!527762))

(assert (= (and b!527762 c!62139) b!527763))

(assert (= (and b!527762 (not c!62139)) b!527761))

(assert (= (and b!527763 res!324098) b!527764))

(assert (= (or b!527764 b!527761) bm!31867))

(assert (=> b!527762 m!507769))

(assert (=> b!527762 m!507769))

(assert (=> b!527762 m!507811))

(assert (=> b!527763 m!507769))

(declare-fun m!507941 () Bool)

(assert (=> b!527763 m!507941))

(declare-fun m!507943 () Bool)

(assert (=> b!527763 m!507943))

(assert (=> b!527763 m!507769))

(assert (=> b!527763 m!507771))

(declare-fun m!507945 () Bool)

(assert (=> bm!31867 m!507945))

(assert (=> b!527591 d!80705))

(declare-fun d!80709 () Bool)

(assert (=> d!80709 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!242922 () Unit!16666)

(declare-fun choose!38 (array!33482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16666)

(assert (=> d!80709 (= lt!242922 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80709 (validMask!0 mask!3524)))

(assert (=> d!80709 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!242922)))

(declare-fun bs!16516 () Bool)

(assert (= bs!16516 d!80709))

(assert (=> bs!16516 m!507807))

(declare-fun m!507947 () Bool)

(assert (=> bs!16516 m!507947))

(assert (=> bs!16516 m!507773))

(assert (=> b!527591 d!80709))

(declare-fun d!80711 () Bool)

(declare-fun e!307553 () Bool)

(assert (=> d!80711 e!307553))

(declare-fun c!62147 () Bool)

(declare-fun lt!242924 () SeekEntryResult!4555)

(assert (=> d!80711 (= c!62147 (and ((_ is Intermediate!4555) lt!242924) (undefined!5367 lt!242924)))))

(declare-fun e!307552 () SeekEntryResult!4555)

(assert (=> d!80711 (= lt!242924 e!307552)))

(declare-fun c!62146 () Bool)

(assert (=> d!80711 (= c!62146 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242923 () (_ BitVec 64))

(assert (=> d!80711 (= lt!242923 (select (arr!16091 a!3235) lt!242811))))

(assert (=> d!80711 (validMask!0 mask!3524)))

(assert (=> d!80711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242811 (select (arr!16091 a!3235) j!176) a!3235 mask!3524) lt!242924)))

(declare-fun e!307554 () SeekEntryResult!4555)

(declare-fun b!527785 () Bool)

(assert (=> b!527785 (= e!307554 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242811 #b00000000000000000000000000000000 mask!3524) (select (arr!16091 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!527786 () Bool)

(assert (=> b!527786 (and (bvsge (index!20440 lt!242924) #b00000000000000000000000000000000) (bvslt (index!20440 lt!242924) (size!16456 a!3235)))))

(declare-fun res!324108 () Bool)

(assert (=> b!527786 (= res!324108 (= (select (arr!16091 a!3235) (index!20440 lt!242924)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307556 () Bool)

(assert (=> b!527786 (=> res!324108 e!307556)))

(declare-fun b!527787 () Bool)

(assert (=> b!527787 (and (bvsge (index!20440 lt!242924) #b00000000000000000000000000000000) (bvslt (index!20440 lt!242924) (size!16456 a!3235)))))

(declare-fun res!324109 () Bool)

(assert (=> b!527787 (= res!324109 (= (select (arr!16091 a!3235) (index!20440 lt!242924)) (select (arr!16091 a!3235) j!176)))))

(assert (=> b!527787 (=> res!324109 e!307556)))

(declare-fun e!307555 () Bool)

(assert (=> b!527787 (= e!307555 e!307556)))

(declare-fun b!527788 () Bool)

(assert (=> b!527788 (= e!307554 (Intermediate!4555 false lt!242811 #b00000000000000000000000000000000))))

(declare-fun b!527789 () Bool)

(assert (=> b!527789 (= e!307553 (bvsge (x!49415 lt!242924) #b01111111111111111111111111111110))))

(declare-fun b!527790 () Bool)

(assert (=> b!527790 (= e!307552 (Intermediate!4555 true lt!242811 #b00000000000000000000000000000000))))

(declare-fun b!527791 () Bool)

(assert (=> b!527791 (= e!307553 e!307555)))

(declare-fun res!324110 () Bool)

(assert (=> b!527791 (= res!324110 (and ((_ is Intermediate!4555) lt!242924) (not (undefined!5367 lt!242924)) (bvslt (x!49415 lt!242924) #b01111111111111111111111111111110) (bvsge (x!49415 lt!242924) #b00000000000000000000000000000000) (bvsge (x!49415 lt!242924) #b00000000000000000000000000000000)))))

(assert (=> b!527791 (=> (not res!324110) (not e!307555))))

(declare-fun b!527792 () Bool)

(assert (=> b!527792 (and (bvsge (index!20440 lt!242924) #b00000000000000000000000000000000) (bvslt (index!20440 lt!242924) (size!16456 a!3235)))))

(assert (=> b!527792 (= e!307556 (= (select (arr!16091 a!3235) (index!20440 lt!242924)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!527793 () Bool)

(assert (=> b!527793 (= e!307552 e!307554)))

(declare-fun c!62148 () Bool)

(assert (=> b!527793 (= c!62148 (or (= lt!242923 (select (arr!16091 a!3235) j!176)) (= (bvadd lt!242923 lt!242923) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80711 c!62146) b!527790))

(assert (= (and d!80711 (not c!62146)) b!527793))

(assert (= (and b!527793 c!62148) b!527788))

(assert (= (and b!527793 (not c!62148)) b!527785))

(assert (= (and d!80711 c!62147) b!527789))

(assert (= (and d!80711 (not c!62147)) b!527791))

(assert (= (and b!527791 res!324110) b!527787))

(assert (= (and b!527787 (not res!324109)) b!527786))

(assert (= (and b!527786 (not res!324108)) b!527792))

(declare-fun m!507951 () Bool)

(assert (=> b!527785 m!507951))

(assert (=> b!527785 m!507951))

(assert (=> b!527785 m!507769))

(declare-fun m!507953 () Bool)

(assert (=> b!527785 m!507953))

(declare-fun m!507955 () Bool)

(assert (=> d!80711 m!507955))

(assert (=> d!80711 m!507773))

(declare-fun m!507959 () Bool)

(assert (=> b!527786 m!507959))

(assert (=> b!527787 m!507959))

(assert (=> b!527792 m!507959))

(assert (=> b!527591 d!80711))

(declare-fun d!80715 () Bool)

(declare-fun res!324119 () Bool)

(declare-fun e!307567 () Bool)

(assert (=> d!80715 (=> res!324119 e!307567)))

(assert (=> d!80715 (= res!324119 (= (select (arr!16091 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80715 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!307567)))

(declare-fun b!527808 () Bool)

(declare-fun e!307568 () Bool)

(assert (=> b!527808 (= e!307567 e!307568)))

(declare-fun res!324120 () Bool)

(assert (=> b!527808 (=> (not res!324120) (not e!307568))))

(assert (=> b!527808 (= res!324120 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16456 a!3235)))))

(declare-fun b!527809 () Bool)

(assert (=> b!527809 (= e!307568 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80715 (not res!324119)) b!527808))

(assert (= (and b!527808 res!324120) b!527809))

(declare-fun m!507965 () Bool)

(assert (=> d!80715 m!507965))

(declare-fun m!507967 () Bool)

(assert (=> b!527809 m!507967))

(assert (=> b!527589 d!80715))

(declare-fun d!80717 () Bool)

(declare-fun e!307571 () Bool)

(assert (=> d!80717 e!307571))

(declare-fun res!324124 () Bool)

(assert (=> d!80717 (=> (not res!324124) (not e!307571))))

(assert (=> d!80717 (= res!324124 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16456 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16456 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16456 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16456 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16456 a!3235))))))

(declare-fun lt!242938 () Unit!16666)

(declare-fun choose!47 (array!33482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16666)

(assert (=> d!80717 (= lt!242938 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!242811 #b00000000000000000000000000000000 (index!20440 lt!242804) (x!49415 lt!242804) mask!3524))))

(assert (=> d!80717 (validMask!0 mask!3524)))

(assert (=> d!80717 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242811 #b00000000000000000000000000000000 (index!20440 lt!242804) (x!49415 lt!242804) mask!3524) lt!242938)))

(declare-fun b!527812 () Bool)

(assert (=> b!527812 (= e!307571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242811 (select (store (arr!16091 a!3235) i!1204 k0!2280) j!176) (array!33483 (store (arr!16091 a!3235) i!1204 k0!2280) (size!16456 a!3235)) mask!3524) (Intermediate!4555 false (index!20440 lt!242804) (x!49415 lt!242804))))))

(assert (= (and d!80717 res!324124) b!527812))

(declare-fun m!507971 () Bool)

(assert (=> d!80717 m!507971))

(assert (=> d!80717 m!507773))

(assert (=> b!527812 m!507797))

(assert (=> b!527812 m!507801))

(assert (=> b!527812 m!507801))

(declare-fun m!507973 () Bool)

(assert (=> b!527812 m!507973))

(assert (=> b!527590 d!80717))

(declare-fun d!80727 () Bool)

(declare-fun e!307581 () Bool)

(assert (=> d!80727 e!307581))

(declare-fun c!62159 () Bool)

(declare-fun lt!242944 () SeekEntryResult!4555)

(assert (=> d!80727 (= c!62159 (and ((_ is Intermediate!4555) lt!242944) (undefined!5367 lt!242944)))))

(declare-fun e!307580 () SeekEntryResult!4555)

(assert (=> d!80727 (= lt!242944 e!307580)))

(declare-fun c!62158 () Bool)

(assert (=> d!80727 (= c!62158 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242943 () (_ BitVec 64))

(assert (=> d!80727 (= lt!242943 (select (arr!16091 lt!242808) lt!242811))))

(assert (=> d!80727 (validMask!0 mask!3524)))

(assert (=> d!80727 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242811 lt!242807 lt!242808 mask!3524) lt!242944)))

(declare-fun b!527827 () Bool)

(declare-fun e!307582 () SeekEntryResult!4555)

(assert (=> b!527827 (= e!307582 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242811 #b00000000000000000000000000000000 mask!3524) lt!242807 lt!242808 mask!3524))))

(declare-fun b!527828 () Bool)

(assert (=> b!527828 (and (bvsge (index!20440 lt!242944) #b00000000000000000000000000000000) (bvslt (index!20440 lt!242944) (size!16456 lt!242808)))))

(declare-fun res!324127 () Bool)

(assert (=> b!527828 (= res!324127 (= (select (arr!16091 lt!242808) (index!20440 lt!242944)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307584 () Bool)

(assert (=> b!527828 (=> res!324127 e!307584)))

(declare-fun b!527829 () Bool)

(assert (=> b!527829 (and (bvsge (index!20440 lt!242944) #b00000000000000000000000000000000) (bvslt (index!20440 lt!242944) (size!16456 lt!242808)))))

(declare-fun res!324128 () Bool)

(assert (=> b!527829 (= res!324128 (= (select (arr!16091 lt!242808) (index!20440 lt!242944)) lt!242807))))

(assert (=> b!527829 (=> res!324128 e!307584)))

(declare-fun e!307583 () Bool)

(assert (=> b!527829 (= e!307583 e!307584)))

(declare-fun b!527830 () Bool)

(assert (=> b!527830 (= e!307582 (Intermediate!4555 false lt!242811 #b00000000000000000000000000000000))))

(declare-fun b!527831 () Bool)

(assert (=> b!527831 (= e!307581 (bvsge (x!49415 lt!242944) #b01111111111111111111111111111110))))

(declare-fun b!527832 () Bool)

(assert (=> b!527832 (= e!307580 (Intermediate!4555 true lt!242811 #b00000000000000000000000000000000))))

(declare-fun b!527833 () Bool)

(assert (=> b!527833 (= e!307581 e!307583)))

(declare-fun res!324129 () Bool)

(assert (=> b!527833 (= res!324129 (and ((_ is Intermediate!4555) lt!242944) (not (undefined!5367 lt!242944)) (bvslt (x!49415 lt!242944) #b01111111111111111111111111111110) (bvsge (x!49415 lt!242944) #b00000000000000000000000000000000) (bvsge (x!49415 lt!242944) #b00000000000000000000000000000000)))))

(assert (=> b!527833 (=> (not res!324129) (not e!307583))))

(declare-fun b!527834 () Bool)

(assert (=> b!527834 (and (bvsge (index!20440 lt!242944) #b00000000000000000000000000000000) (bvslt (index!20440 lt!242944) (size!16456 lt!242808)))))

(assert (=> b!527834 (= e!307584 (= (select (arr!16091 lt!242808) (index!20440 lt!242944)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!527835 () Bool)

(assert (=> b!527835 (= e!307580 e!307582)))

(declare-fun c!62160 () Bool)

(assert (=> b!527835 (= c!62160 (or (= lt!242943 lt!242807) (= (bvadd lt!242943 lt!242943) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80727 c!62158) b!527832))

(assert (= (and d!80727 (not c!62158)) b!527835))

(assert (= (and b!527835 c!62160) b!527830))

(assert (= (and b!527835 (not c!62160)) b!527827))

(assert (= (and d!80727 c!62159) b!527831))

(assert (= (and d!80727 (not c!62159)) b!527833))

(assert (= (and b!527833 res!324129) b!527829))

(assert (= (and b!527829 (not res!324128)) b!527828))

(assert (= (and b!527828 (not res!324127)) b!527834))

(assert (=> b!527827 m!507951))

(assert (=> b!527827 m!507951))

(declare-fun m!507975 () Bool)

(assert (=> b!527827 m!507975))

(declare-fun m!507977 () Bool)

(assert (=> d!80727 m!507977))

(assert (=> d!80727 m!507773))

(declare-fun m!507979 () Bool)

(assert (=> b!527828 m!507979))

(assert (=> b!527829 m!507979))

(assert (=> b!527834 m!507979))

(assert (=> b!527590 d!80727))

(declare-fun lt!242952 () SeekEntryResult!4555)

(declare-fun e!307589 () SeekEntryResult!4555)

(declare-fun b!527842 () Bool)

(assert (=> b!527842 (= e!307589 (seekKeyOrZeroReturnVacant!0 (x!49415 lt!242952) (index!20440 lt!242952) (index!20440 lt!242952) k0!2280 a!3235 mask!3524))))

(declare-fun b!527843 () Bool)

(declare-fun c!62164 () Bool)

(declare-fun lt!242951 () (_ BitVec 64))

(assert (=> b!527843 (= c!62164 (= lt!242951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307590 () SeekEntryResult!4555)

(assert (=> b!527843 (= e!307590 e!307589)))

(declare-fun b!527844 () Bool)

(assert (=> b!527844 (= e!307590 (Found!4555 (index!20440 lt!242952)))))

(declare-fun b!527845 () Bool)

(declare-fun e!307591 () SeekEntryResult!4555)

(assert (=> b!527845 (= e!307591 Undefined!4555)))

(declare-fun d!80729 () Bool)

(declare-fun lt!242953 () SeekEntryResult!4555)

(assert (=> d!80729 (and (or ((_ is Undefined!4555) lt!242953) (not ((_ is Found!4555) lt!242953)) (and (bvsge (index!20439 lt!242953) #b00000000000000000000000000000000) (bvslt (index!20439 lt!242953) (size!16456 a!3235)))) (or ((_ is Undefined!4555) lt!242953) ((_ is Found!4555) lt!242953) (not ((_ is MissingZero!4555) lt!242953)) (and (bvsge (index!20438 lt!242953) #b00000000000000000000000000000000) (bvslt (index!20438 lt!242953) (size!16456 a!3235)))) (or ((_ is Undefined!4555) lt!242953) ((_ is Found!4555) lt!242953) ((_ is MissingZero!4555) lt!242953) (not ((_ is MissingVacant!4555) lt!242953)) (and (bvsge (index!20441 lt!242953) #b00000000000000000000000000000000) (bvslt (index!20441 lt!242953) (size!16456 a!3235)))) (or ((_ is Undefined!4555) lt!242953) (ite ((_ is Found!4555) lt!242953) (= (select (arr!16091 a!3235) (index!20439 lt!242953)) k0!2280) (ite ((_ is MissingZero!4555) lt!242953) (= (select (arr!16091 a!3235) (index!20438 lt!242953)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4555) lt!242953) (= (select (arr!16091 a!3235) (index!20441 lt!242953)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80729 (= lt!242953 e!307591)))

(declare-fun c!62163 () Bool)

(assert (=> d!80729 (= c!62163 (and ((_ is Intermediate!4555) lt!242952) (undefined!5367 lt!242952)))))

(assert (=> d!80729 (= lt!242952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80729 (validMask!0 mask!3524)))

(assert (=> d!80729 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!242953)))

(declare-fun b!527846 () Bool)

(assert (=> b!527846 (= e!307591 e!307590)))

(assert (=> b!527846 (= lt!242951 (select (arr!16091 a!3235) (index!20440 lt!242952)))))

(declare-fun c!62165 () Bool)

(assert (=> b!527846 (= c!62165 (= lt!242951 k0!2280))))

(declare-fun b!527847 () Bool)

(assert (=> b!527847 (= e!307589 (MissingZero!4555 (index!20440 lt!242952)))))

(assert (= (and d!80729 c!62163) b!527845))

(assert (= (and d!80729 (not c!62163)) b!527846))

(assert (= (and b!527846 c!62165) b!527844))

(assert (= (and b!527846 (not c!62165)) b!527843))

(assert (= (and b!527843 c!62164) b!527847))

(assert (= (and b!527843 (not c!62164)) b!527842))

(declare-fun m!507981 () Bool)

(assert (=> b!527842 m!507981))

(declare-fun m!507983 () Bool)

(assert (=> d!80729 m!507983))

(declare-fun m!507985 () Bool)

(assert (=> d!80729 m!507985))

(declare-fun m!507987 () Bool)

(assert (=> d!80729 m!507987))

(assert (=> d!80729 m!507985))

(declare-fun m!507989 () Bool)

(assert (=> d!80729 m!507989))

(declare-fun m!507991 () Bool)

(assert (=> d!80729 m!507991))

(assert (=> d!80729 m!507773))

(declare-fun m!507993 () Bool)

(assert (=> b!527846 m!507993))

(assert (=> b!527593 d!80729))

(declare-fun d!80731 () Bool)

(assert (=> d!80731 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47904 d!80731))

(declare-fun d!80743 () Bool)

(assert (=> d!80743 (= (array_inv!11974 a!3235) (bvsge (size!16456 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47904 d!80743))

(declare-fun lt!242990 () SeekEntryResult!4555)

(declare-fun d!80745 () Bool)

(assert (=> d!80745 (and (or ((_ is Undefined!4555) lt!242990) (not ((_ is Found!4555) lt!242990)) (and (bvsge (index!20439 lt!242990) #b00000000000000000000000000000000) (bvslt (index!20439 lt!242990) (size!16456 a!3235)))) (or ((_ is Undefined!4555) lt!242990) ((_ is Found!4555) lt!242990) (not ((_ is MissingVacant!4555) lt!242990)) (not (= (index!20441 lt!242990) (index!20440 lt!242804))) (and (bvsge (index!20441 lt!242990) #b00000000000000000000000000000000) (bvslt (index!20441 lt!242990) (size!16456 a!3235)))) (or ((_ is Undefined!4555) lt!242990) (ite ((_ is Found!4555) lt!242990) (= (select (arr!16091 a!3235) (index!20439 lt!242990)) (select (arr!16091 a!3235) j!176)) (and ((_ is MissingVacant!4555) lt!242990) (= (index!20441 lt!242990) (index!20440 lt!242804)) (= (select (arr!16091 a!3235) (index!20441 lt!242990)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!307643 () SeekEntryResult!4555)

(assert (=> d!80745 (= lt!242990 e!307643)))

(declare-fun c!62199 () Bool)

(assert (=> d!80745 (= c!62199 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242989 () (_ BitVec 64))

(assert (=> d!80745 (= lt!242989 (select (arr!16091 a!3235) lt!242811))))

(assert (=> d!80745 (validMask!0 mask!3524)))

(assert (=> d!80745 (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!242811 (index!20440 lt!242804) (select (arr!16091 a!3235) j!176) a!3235 mask!3524) lt!242990)))

(declare-fun b!527933 () Bool)

(assert (=> b!527933 (= e!307643 Undefined!4555)))

(declare-fun b!527934 () Bool)

(declare-fun c!62198 () Bool)

(assert (=> b!527934 (= c!62198 (= lt!242989 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307642 () SeekEntryResult!4555)

(declare-fun e!307641 () SeekEntryResult!4555)

(assert (=> b!527934 (= e!307642 e!307641)))

(declare-fun b!527935 () Bool)

(assert (=> b!527935 (= e!307643 e!307642)))

(declare-fun c!62197 () Bool)

(assert (=> b!527935 (= c!62197 (= lt!242989 (select (arr!16091 a!3235) j!176)))))

(declare-fun b!527936 () Bool)

(assert (=> b!527936 (= e!307641 (MissingVacant!4555 (index!20440 lt!242804)))))

(declare-fun b!527937 () Bool)

(assert (=> b!527937 (= e!307642 (Found!4555 lt!242811))))

(declare-fun b!527938 () Bool)

(assert (=> b!527938 (= e!307641 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242811 #b00000000000000000000000000000000 mask!3524) (index!20440 lt!242804) (select (arr!16091 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80745 c!62199) b!527933))

(assert (= (and d!80745 (not c!62199)) b!527935))

(assert (= (and b!527935 c!62197) b!527937))

(assert (= (and b!527935 (not c!62197)) b!527934))

(assert (= (and b!527934 c!62198) b!527936))

(assert (= (and b!527934 (not c!62198)) b!527938))

(declare-fun m!508035 () Bool)

(assert (=> d!80745 m!508035))

(declare-fun m!508037 () Bool)

(assert (=> d!80745 m!508037))

(assert (=> d!80745 m!507955))

(assert (=> d!80745 m!507773))

(assert (=> b!527938 m!507951))

(assert (=> b!527938 m!507951))

(assert (=> b!527938 m!507769))

(declare-fun m!508039 () Bool)

(assert (=> b!527938 m!508039))

(assert (=> b!527582 d!80745))

(declare-fun d!80749 () Bool)

(assert (=> d!80749 (= (index!20440 lt!242804) i!1204)))

(declare-fun lt!242996 () Unit!16666)

(declare-fun choose!104 (array!33482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16666)

(assert (=> d!80749 (= lt!242996 (choose!104 a!3235 i!1204 k0!2280 j!176 lt!242811 #b00000000000000000000000000000000 (index!20440 lt!242804) (x!49415 lt!242804) mask!3524))))

(assert (=> d!80749 (validMask!0 mask!3524)))

(assert (=> d!80749 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242811 #b00000000000000000000000000000000 (index!20440 lt!242804) (x!49415 lt!242804) mask!3524) lt!242996)))

(declare-fun bs!16518 () Bool)

(assert (= bs!16518 d!80749))

(declare-fun m!508041 () Bool)

(assert (=> bs!16518 m!508041))

(assert (=> bs!16518 m!507773))

(assert (=> b!527585 d!80749))

(declare-fun b!527975 () Bool)

(declare-fun e!307672 () Bool)

(declare-fun e!307669 () Bool)

(assert (=> b!527975 (= e!307672 e!307669)))

(declare-fun res!324170 () Bool)

(assert (=> b!527975 (=> (not res!324170) (not e!307669))))

(declare-fun e!307670 () Bool)

(assert (=> b!527975 (= res!324170 (not e!307670))))

(declare-fun res!324169 () Bool)

(assert (=> b!527975 (=> (not res!324169) (not e!307670))))

(assert (=> b!527975 (= res!324169 (validKeyInArray!0 (select (arr!16091 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!527976 () Bool)

(declare-fun e!307671 () Bool)

(declare-fun call!31882 () Bool)

(assert (=> b!527976 (= e!307671 call!31882)))

(declare-fun d!80751 () Bool)

(declare-fun res!324171 () Bool)

(assert (=> d!80751 (=> res!324171 e!307672)))

(assert (=> d!80751 (= res!324171 (bvsge #b00000000000000000000000000000000 (size!16456 a!3235)))))

(assert (=> d!80751 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10285) e!307672)))

(declare-fun b!527977 () Bool)

(assert (=> b!527977 (= e!307669 e!307671)))

(declare-fun c!62211 () Bool)

(assert (=> b!527977 (= c!62211 (validKeyInArray!0 (select (arr!16091 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!527978 () Bool)

(declare-fun contains!2757 (List!10288 (_ BitVec 64)) Bool)

(assert (=> b!527978 (= e!307670 (contains!2757 Nil!10285 (select (arr!16091 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31879 () Bool)

(assert (=> bm!31879 (= call!31882 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62211 (Cons!10284 (select (arr!16091 a!3235) #b00000000000000000000000000000000) Nil!10285) Nil!10285)))))

(declare-fun b!527979 () Bool)

(assert (=> b!527979 (= e!307671 call!31882)))

(assert (= (and d!80751 (not res!324171)) b!527975))

(assert (= (and b!527975 res!324169) b!527978))

(assert (= (and b!527975 res!324170) b!527977))

(assert (= (and b!527977 c!62211) b!527979))

(assert (= (and b!527977 (not c!62211)) b!527976))

(assert (= (or b!527979 b!527976) bm!31879))

(assert (=> b!527975 m!507965))

(assert (=> b!527975 m!507965))

(declare-fun m!508077 () Bool)

(assert (=> b!527975 m!508077))

(assert (=> b!527977 m!507965))

(assert (=> b!527977 m!507965))

(assert (=> b!527977 m!508077))

(assert (=> b!527978 m!507965))

(assert (=> b!527978 m!507965))

(declare-fun m!508079 () Bool)

(assert (=> b!527978 m!508079))

(assert (=> bm!31879 m!507965))

(declare-fun m!508081 () Bool)

(assert (=> bm!31879 m!508081))

(assert (=> b!527596 d!80751))

(declare-fun d!80759 () Bool)

(assert (=> d!80759 (= (validKeyInArray!0 (select (arr!16091 a!3235) j!176)) (and (not (= (select (arr!16091 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16091 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!527584 d!80759))

(declare-fun b!527980 () Bool)

(declare-fun e!307673 () Bool)

(declare-fun call!31883 () Bool)

(assert (=> b!527980 (= e!307673 call!31883)))

(declare-fun b!527981 () Bool)

(declare-fun e!307674 () Bool)

(assert (=> b!527981 (= e!307674 e!307673)))

(declare-fun c!62212 () Bool)

(assert (=> b!527981 (= c!62212 (validKeyInArray!0 (select (arr!16091 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80761 () Bool)

(declare-fun res!324173 () Bool)

(assert (=> d!80761 (=> res!324173 e!307674)))

(assert (=> d!80761 (= res!324173 (bvsge #b00000000000000000000000000000000 (size!16456 a!3235)))))

(assert (=> d!80761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!307674)))

(declare-fun b!527982 () Bool)

(declare-fun e!307675 () Bool)

(assert (=> b!527982 (= e!307673 e!307675)))

(declare-fun lt!243002 () (_ BitVec 64))

(assert (=> b!527982 (= lt!243002 (select (arr!16091 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!243003 () Unit!16666)

(assert (=> b!527982 (= lt!243003 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!243002 #b00000000000000000000000000000000))))

(assert (=> b!527982 (arrayContainsKey!0 a!3235 lt!243002 #b00000000000000000000000000000000)))

(declare-fun lt!243004 () Unit!16666)

(assert (=> b!527982 (= lt!243004 lt!243003)))

(declare-fun res!324172 () Bool)

(assert (=> b!527982 (= res!324172 (= (seekEntryOrOpen!0 (select (arr!16091 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4555 #b00000000000000000000000000000000)))))

(assert (=> b!527982 (=> (not res!324172) (not e!307675))))

(declare-fun b!527983 () Bool)

(assert (=> b!527983 (= e!307675 call!31883)))

(declare-fun bm!31880 () Bool)

(assert (=> bm!31880 (= call!31883 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!80761 (not res!324173)) b!527981))

(assert (= (and b!527981 c!62212) b!527982))

(assert (= (and b!527981 (not c!62212)) b!527980))

(assert (= (and b!527982 res!324172) b!527983))

(assert (= (or b!527983 b!527980) bm!31880))

(assert (=> b!527981 m!507965))

(assert (=> b!527981 m!507965))

(assert (=> b!527981 m!508077))

(assert (=> b!527982 m!507965))

(declare-fun m!508083 () Bool)

(assert (=> b!527982 m!508083))

(declare-fun m!508085 () Bool)

(assert (=> b!527982 m!508085))

(assert (=> b!527982 m!507965))

(declare-fun m!508087 () Bool)

(assert (=> b!527982 m!508087))

(declare-fun m!508089 () Bool)

(assert (=> bm!31880 m!508089))

(assert (=> b!527595 d!80761))

(check-sat (not d!80729) (not b!527785) (not bm!31880) (not b!527741) (not bm!31879) (not b!527982) (not b!527699) (not b!527827) (not b!527938) (not d!80709) (not b!527809) (not b!527842) (not d!80749) (not b!527762) (not b!527981) (not b!527763) (not b!527977) (not d!80717) (not d!80727) (not d!80689) (not b!527975) (not bm!31867) (not b!527978) (not d!80711) (not b!527812) (not d!80687) (not d!80745))
(check-sat)
