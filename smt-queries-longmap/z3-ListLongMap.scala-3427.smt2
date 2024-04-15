; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47604 () Bool)

(assert start!47604)

(declare-fun b!523516 () Bool)

(declare-fun e!305308 () Bool)

(declare-fun e!305307 () Bool)

(assert (=> b!523516 (= e!305308 e!305307)))

(declare-fun res!320816 () Bool)

(assert (=> b!523516 (=> (not res!320816) (not e!305307))))

(declare-datatypes ((SeekEntryResult!4474 0))(
  ( (MissingZero!4474 (index!20105 (_ BitVec 32))) (Found!4474 (index!20106 (_ BitVec 32))) (Intermediate!4474 (undefined!5286 Bool) (index!20107 (_ BitVec 32)) (x!49097 (_ BitVec 32))) (Undefined!4474) (MissingVacant!4474 (index!20108 (_ BitVec 32))) )
))
(declare-fun lt!240107 () SeekEntryResult!4474)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523516 (= res!320816 (or (= lt!240107 (MissingZero!4474 i!1204)) (= lt!240107 (MissingVacant!4474 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33314 0))(
  ( (array!33315 (arr!16010 (Array (_ BitVec 32) (_ BitVec 64))) (size!16375 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33314)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33314 (_ BitVec 32)) SeekEntryResult!4474)

(assert (=> b!523516 (= lt!240107 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!523517 () Bool)

(declare-fun res!320812 () Bool)

(assert (=> b!523517 (=> (not res!320812) (not e!305307))))

(declare-datatypes ((List!10207 0))(
  ( (Nil!10204) (Cons!10203 (h!11131 (_ BitVec 64)) (t!16426 List!10207)) )
))
(declare-fun arrayNoDuplicates!0 (array!33314 (_ BitVec 32) List!10207) Bool)

(assert (=> b!523517 (= res!320812 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10204))))

(declare-fun b!523518 () Bool)

(declare-fun res!320814 () Bool)

(assert (=> b!523518 (=> (not res!320814) (not e!305308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523518 (= res!320814 (validKeyInArray!0 k0!2280))))

(declare-fun b!523519 () Bool)

(declare-fun res!320821 () Bool)

(assert (=> b!523519 (=> (not res!320821) (not e!305308))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!523519 (= res!320821 (validKeyInArray!0 (select (arr!16010 a!3235) j!176)))))

(declare-fun e!305310 () Bool)

(declare-fun b!523520 () Bool)

(assert (=> b!523520 (= e!305310 (= (seekEntryOrOpen!0 (select (arr!16010 a!3235) j!176) a!3235 mask!3524) (Found!4474 j!176)))))

(declare-fun lt!240103 () SeekEntryResult!4474)

(declare-fun lt!240109 () (_ BitVec 32))

(declare-fun e!305312 () Bool)

(declare-fun b!523521 () Bool)

(assert (=> b!523521 (= e!305312 (or (bvsgt #b00000000000000000000000000000000 (x!49097 lt!240103)) (bvsgt (x!49097 lt!240103) #b01111111111111111111111111111110) (bvslt lt!240109 #b00000000000000000000000000000000) (bvsge lt!240109 (size!16375 a!3235)) (and (bvsge (index!20107 lt!240103) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240103) (size!16375 a!3235)))))))

(assert (=> b!523521 (and (or (= (select (arr!16010 a!3235) (index!20107 lt!240103)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16010 a!3235) (index!20107 lt!240103)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16010 a!3235) (index!20107 lt!240103)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16010 a!3235) (index!20107 lt!240103)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16342 0))(
  ( (Unit!16343) )
))
(declare-fun lt!240102 () Unit!16342)

(declare-fun e!305311 () Unit!16342)

(assert (=> b!523521 (= lt!240102 e!305311)))

(declare-fun c!61656 () Bool)

(assert (=> b!523521 (= c!61656 (= (select (arr!16010 a!3235) (index!20107 lt!240103)) (select (arr!16010 a!3235) j!176)))))

(assert (=> b!523521 (and (bvslt (x!49097 lt!240103) #b01111111111111111111111111111110) (or (= (select (arr!16010 a!3235) (index!20107 lt!240103)) (select (arr!16010 a!3235) j!176)) (= (select (arr!16010 a!3235) (index!20107 lt!240103)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16010 a!3235) (index!20107 lt!240103)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523522 () Bool)

(declare-fun Unit!16344 () Unit!16342)

(assert (=> b!523522 (= e!305311 Unit!16344)))

(declare-fun b!523523 () Bool)

(declare-fun e!305313 () Bool)

(assert (=> b!523523 (= e!305313 false)))

(declare-fun res!320819 () Bool)

(assert (=> start!47604 (=> (not res!320819) (not e!305308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47604 (= res!320819 (validMask!0 mask!3524))))

(assert (=> start!47604 e!305308))

(assert (=> start!47604 true))

(declare-fun array_inv!11893 (array!33314) Bool)

(assert (=> start!47604 (array_inv!11893 a!3235)))

(declare-fun b!523515 () Bool)

(declare-fun res!320811 () Bool)

(assert (=> b!523515 (=> (not res!320811) (not e!305308))))

(declare-fun arrayContainsKey!0 (array!33314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523515 (= res!320811 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523524 () Bool)

(declare-fun res!320817 () Bool)

(assert (=> b!523524 (=> res!320817 e!305312)))

(get-info :version)

(assert (=> b!523524 (= res!320817 (or (undefined!5286 lt!240103) (not ((_ is Intermediate!4474) lt!240103))))))

(declare-fun b!523525 () Bool)

(assert (=> b!523525 (= e!305307 (not e!305312))))

(declare-fun res!320822 () Bool)

(assert (=> b!523525 (=> res!320822 e!305312)))

(declare-fun lt!240105 () (_ BitVec 32))

(declare-fun lt!240108 () (_ BitVec 64))

(declare-fun lt!240104 () array!33314)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33314 (_ BitVec 32)) SeekEntryResult!4474)

(assert (=> b!523525 (= res!320822 (= lt!240103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240105 lt!240108 lt!240104 mask!3524)))))

(assert (=> b!523525 (= lt!240103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240109 (select (arr!16010 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523525 (= lt!240105 (toIndex!0 lt!240108 mask!3524))))

(assert (=> b!523525 (= lt!240108 (select (store (arr!16010 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!523525 (= lt!240109 (toIndex!0 (select (arr!16010 a!3235) j!176) mask!3524))))

(assert (=> b!523525 (= lt!240104 (array!33315 (store (arr!16010 a!3235) i!1204 k0!2280) (size!16375 a!3235)))))

(assert (=> b!523525 e!305310))

(declare-fun res!320818 () Bool)

(assert (=> b!523525 (=> (not res!320818) (not e!305310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33314 (_ BitVec 32)) Bool)

(assert (=> b!523525 (= res!320818 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240101 () Unit!16342)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16342)

(assert (=> b!523525 (= lt!240101 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523526 () Bool)

(declare-fun Unit!16345 () Unit!16342)

(assert (=> b!523526 (= e!305311 Unit!16345)))

(declare-fun lt!240106 () Unit!16342)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33314 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16342)

(assert (=> b!523526 (= lt!240106 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240109 #b00000000000000000000000000000000 (index!20107 lt!240103) (x!49097 lt!240103) mask!3524))))

(declare-fun res!320815 () Bool)

(assert (=> b!523526 (= res!320815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240109 lt!240108 lt!240104 mask!3524) (Intermediate!4474 false (index!20107 lt!240103) (x!49097 lt!240103))))))

(assert (=> b!523526 (=> (not res!320815) (not e!305313))))

(assert (=> b!523526 e!305313))

(declare-fun b!523527 () Bool)

(declare-fun res!320820 () Bool)

(assert (=> b!523527 (=> (not res!320820) (not e!305307))))

(assert (=> b!523527 (= res!320820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523528 () Bool)

(declare-fun res!320813 () Bool)

(assert (=> b!523528 (=> (not res!320813) (not e!305308))))

(assert (=> b!523528 (= res!320813 (and (= (size!16375 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16375 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16375 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47604 res!320819) b!523528))

(assert (= (and b!523528 res!320813) b!523519))

(assert (= (and b!523519 res!320821) b!523518))

(assert (= (and b!523518 res!320814) b!523515))

(assert (= (and b!523515 res!320811) b!523516))

(assert (= (and b!523516 res!320816) b!523527))

(assert (= (and b!523527 res!320820) b!523517))

(assert (= (and b!523517 res!320812) b!523525))

(assert (= (and b!523525 res!320818) b!523520))

(assert (= (and b!523525 (not res!320822)) b!523524))

(assert (= (and b!523524 (not res!320817)) b!523521))

(assert (= (and b!523521 c!61656) b!523526))

(assert (= (and b!523521 (not c!61656)) b!523522))

(assert (= (and b!523526 res!320815) b!523523))

(declare-fun m!503761 () Bool)

(assert (=> start!47604 m!503761))

(declare-fun m!503763 () Bool)

(assert (=> start!47604 m!503763))

(declare-fun m!503765 () Bool)

(assert (=> b!523515 m!503765))

(declare-fun m!503767 () Bool)

(assert (=> b!523525 m!503767))

(declare-fun m!503769 () Bool)

(assert (=> b!523525 m!503769))

(declare-fun m!503771 () Bool)

(assert (=> b!523525 m!503771))

(declare-fun m!503773 () Bool)

(assert (=> b!523525 m!503773))

(declare-fun m!503775 () Bool)

(assert (=> b!523525 m!503775))

(assert (=> b!523525 m!503773))

(declare-fun m!503777 () Bool)

(assert (=> b!523525 m!503777))

(declare-fun m!503779 () Bool)

(assert (=> b!523525 m!503779))

(assert (=> b!523525 m!503773))

(declare-fun m!503781 () Bool)

(assert (=> b!523525 m!503781))

(declare-fun m!503783 () Bool)

(assert (=> b!523525 m!503783))

(declare-fun m!503785 () Bool)

(assert (=> b!523521 m!503785))

(assert (=> b!523521 m!503773))

(declare-fun m!503787 () Bool)

(assert (=> b!523518 m!503787))

(declare-fun m!503789 () Bool)

(assert (=> b!523527 m!503789))

(assert (=> b!523520 m!503773))

(assert (=> b!523520 m!503773))

(declare-fun m!503791 () Bool)

(assert (=> b!523520 m!503791))

(assert (=> b!523519 m!503773))

(assert (=> b!523519 m!503773))

(declare-fun m!503793 () Bool)

(assert (=> b!523519 m!503793))

(declare-fun m!503795 () Bool)

(assert (=> b!523516 m!503795))

(declare-fun m!503797 () Bool)

(assert (=> b!523526 m!503797))

(declare-fun m!503799 () Bool)

(assert (=> b!523526 m!503799))

(declare-fun m!503801 () Bool)

(assert (=> b!523517 m!503801))

(check-sat (not b!523527) (not b!523519) (not b!523520) (not b!523515) (not b!523517) (not b!523516) (not b!523526) (not start!47604) (not b!523525) (not b!523518))
(check-sat)
(get-model)

(declare-fun b!523623 () Bool)

(declare-fun e!305366 () Bool)

(declare-fun call!31828 () Bool)

(assert (=> b!523623 (= e!305366 call!31828)))

(declare-fun b!523624 () Bool)

(declare-fun e!305364 () Bool)

(declare-fun e!305367 () Bool)

(assert (=> b!523624 (= e!305364 e!305367)))

(declare-fun res!320901 () Bool)

(assert (=> b!523624 (=> (not res!320901) (not e!305367))))

(declare-fun e!305365 () Bool)

(assert (=> b!523624 (= res!320901 (not e!305365))))

(declare-fun res!320902 () Bool)

(assert (=> b!523624 (=> (not res!320902) (not e!305365))))

(assert (=> b!523624 (= res!320902 (validKeyInArray!0 (select (arr!16010 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80421 () Bool)

(declare-fun res!320903 () Bool)

(assert (=> d!80421 (=> res!320903 e!305364)))

(assert (=> d!80421 (= res!320903 (bvsge #b00000000000000000000000000000000 (size!16375 a!3235)))))

(assert (=> d!80421 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10204) e!305364)))

(declare-fun bm!31825 () Bool)

(declare-fun c!61665 () Bool)

(assert (=> bm!31825 (= call!31828 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61665 (Cons!10203 (select (arr!16010 a!3235) #b00000000000000000000000000000000) Nil!10204) Nil!10204)))))

(declare-fun b!523625 () Bool)

(declare-fun contains!2751 (List!10207 (_ BitVec 64)) Bool)

(assert (=> b!523625 (= e!305365 (contains!2751 Nil!10204 (select (arr!16010 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523626 () Bool)

(assert (=> b!523626 (= e!305367 e!305366)))

(assert (=> b!523626 (= c!61665 (validKeyInArray!0 (select (arr!16010 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523627 () Bool)

(assert (=> b!523627 (= e!305366 call!31828)))

(assert (= (and d!80421 (not res!320903)) b!523624))

(assert (= (and b!523624 res!320902) b!523625))

(assert (= (and b!523624 res!320901) b!523626))

(assert (= (and b!523626 c!61665) b!523623))

(assert (= (and b!523626 (not c!61665)) b!523627))

(assert (= (or b!523623 b!523627) bm!31825))

(declare-fun m!503887 () Bool)

(assert (=> b!523624 m!503887))

(assert (=> b!523624 m!503887))

(declare-fun m!503889 () Bool)

(assert (=> b!523624 m!503889))

(assert (=> bm!31825 m!503887))

(declare-fun m!503891 () Bool)

(assert (=> bm!31825 m!503891))

(assert (=> b!523625 m!503887))

(assert (=> b!523625 m!503887))

(declare-fun m!503893 () Bool)

(assert (=> b!523625 m!503893))

(assert (=> b!523626 m!503887))

(assert (=> b!523626 m!503887))

(assert (=> b!523626 m!503889))

(assert (=> b!523517 d!80421))

(declare-fun lt!240170 () SeekEntryResult!4474)

(declare-fun b!523640 () Bool)

(declare-fun e!305376 () SeekEntryResult!4474)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33314 (_ BitVec 32)) SeekEntryResult!4474)

(assert (=> b!523640 (= e!305376 (seekKeyOrZeroReturnVacant!0 (x!49097 lt!240170) (index!20107 lt!240170) (index!20107 lt!240170) k0!2280 a!3235 mask!3524))))

(declare-fun b!523641 () Bool)

(declare-fun c!61674 () Bool)

(declare-fun lt!240172 () (_ BitVec 64))

(assert (=> b!523641 (= c!61674 (= lt!240172 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305375 () SeekEntryResult!4474)

(assert (=> b!523641 (= e!305375 e!305376)))

(declare-fun b!523642 () Bool)

(declare-fun e!305374 () SeekEntryResult!4474)

(assert (=> b!523642 (= e!305374 e!305375)))

(assert (=> b!523642 (= lt!240172 (select (arr!16010 a!3235) (index!20107 lt!240170)))))

(declare-fun c!61673 () Bool)

(assert (=> b!523642 (= c!61673 (= lt!240172 k0!2280))))

(declare-fun b!523643 () Bool)

(assert (=> b!523643 (= e!305375 (Found!4474 (index!20107 lt!240170)))))

(declare-fun b!523644 () Bool)

(assert (=> b!523644 (= e!305374 Undefined!4474)))

(declare-fun b!523645 () Bool)

(assert (=> b!523645 (= e!305376 (MissingZero!4474 (index!20107 lt!240170)))))

(declare-fun d!80423 () Bool)

(declare-fun lt!240171 () SeekEntryResult!4474)

(assert (=> d!80423 (and (or ((_ is Undefined!4474) lt!240171) (not ((_ is Found!4474) lt!240171)) (and (bvsge (index!20106 lt!240171) #b00000000000000000000000000000000) (bvslt (index!20106 lt!240171) (size!16375 a!3235)))) (or ((_ is Undefined!4474) lt!240171) ((_ is Found!4474) lt!240171) (not ((_ is MissingZero!4474) lt!240171)) (and (bvsge (index!20105 lt!240171) #b00000000000000000000000000000000) (bvslt (index!20105 lt!240171) (size!16375 a!3235)))) (or ((_ is Undefined!4474) lt!240171) ((_ is Found!4474) lt!240171) ((_ is MissingZero!4474) lt!240171) (not ((_ is MissingVacant!4474) lt!240171)) (and (bvsge (index!20108 lt!240171) #b00000000000000000000000000000000) (bvslt (index!20108 lt!240171) (size!16375 a!3235)))) (or ((_ is Undefined!4474) lt!240171) (ite ((_ is Found!4474) lt!240171) (= (select (arr!16010 a!3235) (index!20106 lt!240171)) k0!2280) (ite ((_ is MissingZero!4474) lt!240171) (= (select (arr!16010 a!3235) (index!20105 lt!240171)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4474) lt!240171) (= (select (arr!16010 a!3235) (index!20108 lt!240171)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80423 (= lt!240171 e!305374)))

(declare-fun c!61672 () Bool)

(assert (=> d!80423 (= c!61672 (and ((_ is Intermediate!4474) lt!240170) (undefined!5286 lt!240170)))))

(assert (=> d!80423 (= lt!240170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80423 (validMask!0 mask!3524)))

(assert (=> d!80423 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!240171)))

(assert (= (and d!80423 c!61672) b!523644))

(assert (= (and d!80423 (not c!61672)) b!523642))

(assert (= (and b!523642 c!61673) b!523643))

(assert (= (and b!523642 (not c!61673)) b!523641))

(assert (= (and b!523641 c!61674) b!523645))

(assert (= (and b!523641 (not c!61674)) b!523640))

(declare-fun m!503895 () Bool)

(assert (=> b!523640 m!503895))

(declare-fun m!503897 () Bool)

(assert (=> b!523642 m!503897))

(declare-fun m!503899 () Bool)

(assert (=> d!80423 m!503899))

(declare-fun m!503901 () Bool)

(assert (=> d!80423 m!503901))

(assert (=> d!80423 m!503761))

(assert (=> d!80423 m!503899))

(declare-fun m!503903 () Bool)

(assert (=> d!80423 m!503903))

(declare-fun m!503905 () Bool)

(assert (=> d!80423 m!503905))

(declare-fun m!503907 () Bool)

(assert (=> d!80423 m!503907))

(assert (=> b!523516 d!80423))

(declare-fun d!80425 () Bool)

(declare-fun res!320909 () Bool)

(declare-fun e!305383 () Bool)

(assert (=> d!80425 (=> res!320909 e!305383)))

(assert (=> d!80425 (= res!320909 (bvsge #b00000000000000000000000000000000 (size!16375 a!3235)))))

(assert (=> d!80425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!305383)))

(declare-fun b!523654 () Bool)

(declare-fun e!305384 () Bool)

(declare-fun e!305385 () Bool)

(assert (=> b!523654 (= e!305384 e!305385)))

(declare-fun lt!240180 () (_ BitVec 64))

(assert (=> b!523654 (= lt!240180 (select (arr!16010 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!240179 () Unit!16342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33314 (_ BitVec 64) (_ BitVec 32)) Unit!16342)

(assert (=> b!523654 (= lt!240179 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240180 #b00000000000000000000000000000000))))

(assert (=> b!523654 (arrayContainsKey!0 a!3235 lt!240180 #b00000000000000000000000000000000)))

(declare-fun lt!240181 () Unit!16342)

(assert (=> b!523654 (= lt!240181 lt!240179)))

(declare-fun res!320908 () Bool)

(assert (=> b!523654 (= res!320908 (= (seekEntryOrOpen!0 (select (arr!16010 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4474 #b00000000000000000000000000000000)))))

(assert (=> b!523654 (=> (not res!320908) (not e!305385))))

(declare-fun bm!31828 () Bool)

(declare-fun call!31831 () Bool)

(assert (=> bm!31828 (= call!31831 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!523655 () Bool)

(assert (=> b!523655 (= e!305383 e!305384)))

(declare-fun c!61677 () Bool)

(assert (=> b!523655 (= c!61677 (validKeyInArray!0 (select (arr!16010 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523656 () Bool)

(assert (=> b!523656 (= e!305385 call!31831)))

(declare-fun b!523657 () Bool)

(assert (=> b!523657 (= e!305384 call!31831)))

(assert (= (and d!80425 (not res!320909)) b!523655))

(assert (= (and b!523655 c!61677) b!523654))

(assert (= (and b!523655 (not c!61677)) b!523657))

(assert (= (and b!523654 res!320908) b!523656))

(assert (= (or b!523656 b!523657) bm!31828))

(assert (=> b!523654 m!503887))

(declare-fun m!503909 () Bool)

(assert (=> b!523654 m!503909))

(declare-fun m!503911 () Bool)

(assert (=> b!523654 m!503911))

(assert (=> b!523654 m!503887))

(declare-fun m!503913 () Bool)

(assert (=> b!523654 m!503913))

(declare-fun m!503915 () Bool)

(assert (=> bm!31828 m!503915))

(assert (=> b!523655 m!503887))

(assert (=> b!523655 m!503887))

(assert (=> b!523655 m!503889))

(assert (=> b!523527 d!80425))

(declare-fun d!80429 () Bool)

(assert (=> d!80429 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523518 d!80429))

(declare-fun d!80431 () Bool)

(declare-fun lt!240187 () (_ BitVec 32))

(declare-fun lt!240186 () (_ BitVec 32))

(assert (=> d!80431 (= lt!240187 (bvmul (bvxor lt!240186 (bvlshr lt!240186 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80431 (= lt!240186 ((_ extract 31 0) (bvand (bvxor (select (arr!16010 a!3235) j!176) (bvlshr (select (arr!16010 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80431 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320910 (let ((h!11134 ((_ extract 31 0) (bvand (bvxor (select (arr!16010 a!3235) j!176) (bvlshr (select (arr!16010 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49100 (bvmul (bvxor h!11134 (bvlshr h!11134 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49100 (bvlshr x!49100 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320910 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320910 #b00000000000000000000000000000000))))))

(assert (=> d!80431 (= (toIndex!0 (select (arr!16010 a!3235) j!176) mask!3524) (bvand (bvxor lt!240187 (bvlshr lt!240187 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523525 d!80431))

(declare-fun d!80433 () Bool)

(declare-fun res!320912 () Bool)

(declare-fun e!305386 () Bool)

(assert (=> d!80433 (=> res!320912 e!305386)))

(assert (=> d!80433 (= res!320912 (bvsge j!176 (size!16375 a!3235)))))

(assert (=> d!80433 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!305386)))

(declare-fun b!523658 () Bool)

(declare-fun e!305387 () Bool)

(declare-fun e!305388 () Bool)

(assert (=> b!523658 (= e!305387 e!305388)))

(declare-fun lt!240189 () (_ BitVec 64))

(assert (=> b!523658 (= lt!240189 (select (arr!16010 a!3235) j!176))))

(declare-fun lt!240188 () Unit!16342)

(assert (=> b!523658 (= lt!240188 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240189 j!176))))

(assert (=> b!523658 (arrayContainsKey!0 a!3235 lt!240189 #b00000000000000000000000000000000)))

(declare-fun lt!240190 () Unit!16342)

(assert (=> b!523658 (= lt!240190 lt!240188)))

(declare-fun res!320911 () Bool)

(assert (=> b!523658 (= res!320911 (= (seekEntryOrOpen!0 (select (arr!16010 a!3235) j!176) a!3235 mask!3524) (Found!4474 j!176)))))

(assert (=> b!523658 (=> (not res!320911) (not e!305388))))

(declare-fun bm!31829 () Bool)

(declare-fun call!31832 () Bool)

(assert (=> bm!31829 (= call!31832 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!523659 () Bool)

(assert (=> b!523659 (= e!305386 e!305387)))

(declare-fun c!61678 () Bool)

(assert (=> b!523659 (= c!61678 (validKeyInArray!0 (select (arr!16010 a!3235) j!176)))))

(declare-fun b!523660 () Bool)

(assert (=> b!523660 (= e!305388 call!31832)))

(declare-fun b!523661 () Bool)

(assert (=> b!523661 (= e!305387 call!31832)))

(assert (= (and d!80433 (not res!320912)) b!523659))

(assert (= (and b!523659 c!61678) b!523658))

(assert (= (and b!523659 (not c!61678)) b!523661))

(assert (= (and b!523658 res!320911) b!523660))

(assert (= (or b!523660 b!523661) bm!31829))

(assert (=> b!523658 m!503773))

(declare-fun m!503917 () Bool)

(assert (=> b!523658 m!503917))

(declare-fun m!503919 () Bool)

(assert (=> b!523658 m!503919))

(assert (=> b!523658 m!503773))

(assert (=> b!523658 m!503791))

(declare-fun m!503921 () Bool)

(assert (=> bm!31829 m!503921))

(assert (=> b!523659 m!503773))

(assert (=> b!523659 m!503773))

(assert (=> b!523659 m!503793))

(assert (=> b!523525 d!80433))

(declare-fun d!80435 () Bool)

(assert (=> d!80435 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!240197 () Unit!16342)

(declare-fun choose!38 (array!33314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16342)

(assert (=> d!80435 (= lt!240197 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80435 (validMask!0 mask!3524)))

(assert (=> d!80435 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!240197)))

(declare-fun bs!16426 () Bool)

(assert (= bs!16426 d!80435))

(assert (=> bs!16426 m!503777))

(declare-fun m!503923 () Bool)

(assert (=> bs!16426 m!503923))

(assert (=> bs!16426 m!503761))

(assert (=> b!523525 d!80435))

(declare-fun d!80439 () Bool)

(declare-fun e!305440 () Bool)

(assert (=> d!80439 e!305440))

(declare-fun c!61708 () Bool)

(declare-fun lt!240229 () SeekEntryResult!4474)

(assert (=> d!80439 (= c!61708 (and ((_ is Intermediate!4474) lt!240229) (undefined!5286 lt!240229)))))

(declare-fun e!305441 () SeekEntryResult!4474)

(assert (=> d!80439 (= lt!240229 e!305441)))

(declare-fun c!61710 () Bool)

(assert (=> d!80439 (= c!61710 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240228 () (_ BitVec 64))

(assert (=> d!80439 (= lt!240228 (select (arr!16010 lt!240104) lt!240105))))

(assert (=> d!80439 (validMask!0 mask!3524)))

(assert (=> d!80439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240105 lt!240108 lt!240104 mask!3524) lt!240229)))

(declare-fun e!305442 () SeekEntryResult!4474)

(declare-fun b!523747 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523747 (= e!305442 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240105 #b00000000000000000000000000000000 mask!3524) lt!240108 lt!240104 mask!3524))))

(declare-fun b!523748 () Bool)

(assert (=> b!523748 (and (bvsge (index!20107 lt!240229) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240229) (size!16375 lt!240104)))))

(declare-fun res!320942 () Bool)

(assert (=> b!523748 (= res!320942 (= (select (arr!16010 lt!240104) (index!20107 lt!240229)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305444 () Bool)

(assert (=> b!523748 (=> res!320942 e!305444)))

(declare-fun b!523749 () Bool)

(assert (=> b!523749 (= e!305441 e!305442)))

(declare-fun c!61709 () Bool)

(assert (=> b!523749 (= c!61709 (or (= lt!240228 lt!240108) (= (bvadd lt!240228 lt!240228) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523750 () Bool)

(declare-fun e!305443 () Bool)

(assert (=> b!523750 (= e!305440 e!305443)))

(declare-fun res!320941 () Bool)

(assert (=> b!523750 (= res!320941 (and ((_ is Intermediate!4474) lt!240229) (not (undefined!5286 lt!240229)) (bvslt (x!49097 lt!240229) #b01111111111111111111111111111110) (bvsge (x!49097 lt!240229) #b00000000000000000000000000000000) (bvsge (x!49097 lt!240229) #b00000000000000000000000000000000)))))

(assert (=> b!523750 (=> (not res!320941) (not e!305443))))

(declare-fun b!523751 () Bool)

(assert (=> b!523751 (and (bvsge (index!20107 lt!240229) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240229) (size!16375 lt!240104)))))

(declare-fun res!320943 () Bool)

(assert (=> b!523751 (= res!320943 (= (select (arr!16010 lt!240104) (index!20107 lt!240229)) lt!240108))))

(assert (=> b!523751 (=> res!320943 e!305444)))

(assert (=> b!523751 (= e!305443 e!305444)))

(declare-fun b!523752 () Bool)

(assert (=> b!523752 (= e!305442 (Intermediate!4474 false lt!240105 #b00000000000000000000000000000000))))

(declare-fun b!523753 () Bool)

(assert (=> b!523753 (= e!305441 (Intermediate!4474 true lt!240105 #b00000000000000000000000000000000))))

(declare-fun b!523754 () Bool)

(assert (=> b!523754 (= e!305440 (bvsge (x!49097 lt!240229) #b01111111111111111111111111111110))))

(declare-fun b!523755 () Bool)

(assert (=> b!523755 (and (bvsge (index!20107 lt!240229) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240229) (size!16375 lt!240104)))))

(assert (=> b!523755 (= e!305444 (= (select (arr!16010 lt!240104) (index!20107 lt!240229)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80439 c!61710) b!523753))

(assert (= (and d!80439 (not c!61710)) b!523749))

(assert (= (and b!523749 c!61709) b!523752))

(assert (= (and b!523749 (not c!61709)) b!523747))

(assert (= (and d!80439 c!61708) b!523754))

(assert (= (and d!80439 (not c!61708)) b!523750))

(assert (= (and b!523750 res!320941) b!523751))

(assert (= (and b!523751 (not res!320943)) b!523748))

(assert (= (and b!523748 (not res!320942)) b!523755))

(declare-fun m!503951 () Bool)

(assert (=> b!523755 m!503951))

(declare-fun m!503953 () Bool)

(assert (=> b!523747 m!503953))

(assert (=> b!523747 m!503953))

(declare-fun m!503955 () Bool)

(assert (=> b!523747 m!503955))

(assert (=> b!523748 m!503951))

(assert (=> b!523751 m!503951))

(declare-fun m!503957 () Bool)

(assert (=> d!80439 m!503957))

(assert (=> d!80439 m!503761))

(assert (=> b!523525 d!80439))

(declare-fun d!80449 () Bool)

(declare-fun lt!240233 () (_ BitVec 32))

(declare-fun lt!240232 () (_ BitVec 32))

(assert (=> d!80449 (= lt!240233 (bvmul (bvxor lt!240232 (bvlshr lt!240232 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80449 (= lt!240232 ((_ extract 31 0) (bvand (bvxor lt!240108 (bvlshr lt!240108 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80449 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320910 (let ((h!11134 ((_ extract 31 0) (bvand (bvxor lt!240108 (bvlshr lt!240108 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49100 (bvmul (bvxor h!11134 (bvlshr h!11134 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49100 (bvlshr x!49100 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320910 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320910 #b00000000000000000000000000000000))))))

(assert (=> d!80449 (= (toIndex!0 lt!240108 mask!3524) (bvand (bvxor lt!240233 (bvlshr lt!240233 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523525 d!80449))

(declare-fun d!80451 () Bool)

(declare-fun e!305450 () Bool)

(assert (=> d!80451 e!305450))

(declare-fun c!61714 () Bool)

(declare-fun lt!240235 () SeekEntryResult!4474)

(assert (=> d!80451 (= c!61714 (and ((_ is Intermediate!4474) lt!240235) (undefined!5286 lt!240235)))))

(declare-fun e!305451 () SeekEntryResult!4474)

(assert (=> d!80451 (= lt!240235 e!305451)))

(declare-fun c!61716 () Bool)

(assert (=> d!80451 (= c!61716 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240234 () (_ BitVec 64))

(assert (=> d!80451 (= lt!240234 (select (arr!16010 a!3235) lt!240109))))

(assert (=> d!80451 (validMask!0 mask!3524)))

(assert (=> d!80451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240109 (select (arr!16010 a!3235) j!176) a!3235 mask!3524) lt!240235)))

(declare-fun b!523765 () Bool)

(declare-fun e!305452 () SeekEntryResult!4474)

(assert (=> b!523765 (= e!305452 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240109 #b00000000000000000000000000000000 mask!3524) (select (arr!16010 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523766 () Bool)

(assert (=> b!523766 (and (bvsge (index!20107 lt!240235) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240235) (size!16375 a!3235)))))

(declare-fun res!320948 () Bool)

(assert (=> b!523766 (= res!320948 (= (select (arr!16010 a!3235) (index!20107 lt!240235)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305454 () Bool)

(assert (=> b!523766 (=> res!320948 e!305454)))

(declare-fun b!523767 () Bool)

(assert (=> b!523767 (= e!305451 e!305452)))

(declare-fun c!61715 () Bool)

(assert (=> b!523767 (= c!61715 (or (= lt!240234 (select (arr!16010 a!3235) j!176)) (= (bvadd lt!240234 lt!240234) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523768 () Bool)

(declare-fun e!305453 () Bool)

(assert (=> b!523768 (= e!305450 e!305453)))

(declare-fun res!320947 () Bool)

(assert (=> b!523768 (= res!320947 (and ((_ is Intermediate!4474) lt!240235) (not (undefined!5286 lt!240235)) (bvslt (x!49097 lt!240235) #b01111111111111111111111111111110) (bvsge (x!49097 lt!240235) #b00000000000000000000000000000000) (bvsge (x!49097 lt!240235) #b00000000000000000000000000000000)))))

(assert (=> b!523768 (=> (not res!320947) (not e!305453))))

(declare-fun b!523769 () Bool)

(assert (=> b!523769 (and (bvsge (index!20107 lt!240235) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240235) (size!16375 a!3235)))))

(declare-fun res!320949 () Bool)

(assert (=> b!523769 (= res!320949 (= (select (arr!16010 a!3235) (index!20107 lt!240235)) (select (arr!16010 a!3235) j!176)))))

(assert (=> b!523769 (=> res!320949 e!305454)))

(assert (=> b!523769 (= e!305453 e!305454)))

(declare-fun b!523770 () Bool)

(assert (=> b!523770 (= e!305452 (Intermediate!4474 false lt!240109 #b00000000000000000000000000000000))))

(declare-fun b!523771 () Bool)

(assert (=> b!523771 (= e!305451 (Intermediate!4474 true lt!240109 #b00000000000000000000000000000000))))

(declare-fun b!523772 () Bool)

(assert (=> b!523772 (= e!305450 (bvsge (x!49097 lt!240235) #b01111111111111111111111111111110))))

(declare-fun b!523773 () Bool)

(assert (=> b!523773 (and (bvsge (index!20107 lt!240235) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240235) (size!16375 a!3235)))))

(assert (=> b!523773 (= e!305454 (= (select (arr!16010 a!3235) (index!20107 lt!240235)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80451 c!61716) b!523771))

(assert (= (and d!80451 (not c!61716)) b!523767))

(assert (= (and b!523767 c!61715) b!523770))

(assert (= (and b!523767 (not c!61715)) b!523765))

(assert (= (and d!80451 c!61714) b!523772))

(assert (= (and d!80451 (not c!61714)) b!523768))

(assert (= (and b!523768 res!320947) b!523769))

(assert (= (and b!523769 (not res!320949)) b!523766))

(assert (= (and b!523766 (not res!320948)) b!523773))

(declare-fun m!503967 () Bool)

(assert (=> b!523773 m!503967))

(declare-fun m!503969 () Bool)

(assert (=> b!523765 m!503969))

(assert (=> b!523765 m!503969))

(assert (=> b!523765 m!503773))

(declare-fun m!503971 () Bool)

(assert (=> b!523765 m!503971))

(assert (=> b!523766 m!503967))

(assert (=> b!523769 m!503967))

(declare-fun m!503973 () Bool)

(assert (=> d!80451 m!503973))

(assert (=> d!80451 m!503761))

(assert (=> b!523525 d!80451))

(declare-fun d!80457 () Bool)

(assert (=> d!80457 (= (validKeyInArray!0 (select (arr!16010 a!3235) j!176)) (and (not (= (select (arr!16010 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16010 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523519 d!80457))

(declare-fun d!80459 () Bool)

(declare-fun e!305473 () Bool)

(assert (=> d!80459 e!305473))

(declare-fun res!320964 () Bool)

(assert (=> d!80459 (=> (not res!320964) (not e!305473))))

(assert (=> d!80459 (= res!320964 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16375 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16375 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16375 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16375 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16375 a!3235))))))

(declare-fun lt!240243 () Unit!16342)

(declare-fun choose!47 (array!33314 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16342)

(assert (=> d!80459 (= lt!240243 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!240109 #b00000000000000000000000000000000 (index!20107 lt!240103) (x!49097 lt!240103) mask!3524))))

(assert (=> d!80459 (validMask!0 mask!3524)))

(assert (=> d!80459 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240109 #b00000000000000000000000000000000 (index!20107 lt!240103) (x!49097 lt!240103) mask!3524) lt!240243)))

(declare-fun b!523796 () Bool)

(assert (=> b!523796 (= e!305473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240109 (select (store (arr!16010 a!3235) i!1204 k0!2280) j!176) (array!33315 (store (arr!16010 a!3235) i!1204 k0!2280) (size!16375 a!3235)) mask!3524) (Intermediate!4474 false (index!20107 lt!240103) (x!49097 lt!240103))))))

(assert (= (and d!80459 res!320964) b!523796))

(declare-fun m!503993 () Bool)

(assert (=> d!80459 m!503993))

(assert (=> d!80459 m!503761))

(assert (=> b!523796 m!503767))

(assert (=> b!523796 m!503769))

(assert (=> b!523796 m!503769))

(declare-fun m!503995 () Bool)

(assert (=> b!523796 m!503995))

(assert (=> b!523526 d!80459))

(declare-fun d!80475 () Bool)

(declare-fun e!305474 () Bool)

(assert (=> d!80475 e!305474))

(declare-fun c!61721 () Bool)

(declare-fun lt!240245 () SeekEntryResult!4474)

(assert (=> d!80475 (= c!61721 (and ((_ is Intermediate!4474) lt!240245) (undefined!5286 lt!240245)))))

(declare-fun e!305475 () SeekEntryResult!4474)

(assert (=> d!80475 (= lt!240245 e!305475)))

(declare-fun c!61723 () Bool)

(assert (=> d!80475 (= c!61723 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240244 () (_ BitVec 64))

(assert (=> d!80475 (= lt!240244 (select (arr!16010 lt!240104) lt!240109))))

(assert (=> d!80475 (validMask!0 mask!3524)))

(assert (=> d!80475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240109 lt!240108 lt!240104 mask!3524) lt!240245)))

(declare-fun e!305476 () SeekEntryResult!4474)

(declare-fun b!523797 () Bool)

(assert (=> b!523797 (= e!305476 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240109 #b00000000000000000000000000000000 mask!3524) lt!240108 lt!240104 mask!3524))))

(declare-fun b!523798 () Bool)

(assert (=> b!523798 (and (bvsge (index!20107 lt!240245) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240245) (size!16375 lt!240104)))))

(declare-fun res!320966 () Bool)

(assert (=> b!523798 (= res!320966 (= (select (arr!16010 lt!240104) (index!20107 lt!240245)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305478 () Bool)

(assert (=> b!523798 (=> res!320966 e!305478)))

(declare-fun b!523799 () Bool)

(assert (=> b!523799 (= e!305475 e!305476)))

(declare-fun c!61722 () Bool)

(assert (=> b!523799 (= c!61722 (or (= lt!240244 lt!240108) (= (bvadd lt!240244 lt!240244) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523800 () Bool)

(declare-fun e!305477 () Bool)

(assert (=> b!523800 (= e!305474 e!305477)))

(declare-fun res!320965 () Bool)

(assert (=> b!523800 (= res!320965 (and ((_ is Intermediate!4474) lt!240245) (not (undefined!5286 lt!240245)) (bvslt (x!49097 lt!240245) #b01111111111111111111111111111110) (bvsge (x!49097 lt!240245) #b00000000000000000000000000000000) (bvsge (x!49097 lt!240245) #b00000000000000000000000000000000)))))

(assert (=> b!523800 (=> (not res!320965) (not e!305477))))

(declare-fun b!523801 () Bool)

(assert (=> b!523801 (and (bvsge (index!20107 lt!240245) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240245) (size!16375 lt!240104)))))

(declare-fun res!320967 () Bool)

(assert (=> b!523801 (= res!320967 (= (select (arr!16010 lt!240104) (index!20107 lt!240245)) lt!240108))))

(assert (=> b!523801 (=> res!320967 e!305478)))

(assert (=> b!523801 (= e!305477 e!305478)))

(declare-fun b!523802 () Bool)

(assert (=> b!523802 (= e!305476 (Intermediate!4474 false lt!240109 #b00000000000000000000000000000000))))

(declare-fun b!523803 () Bool)

(assert (=> b!523803 (= e!305475 (Intermediate!4474 true lt!240109 #b00000000000000000000000000000000))))

(declare-fun b!523804 () Bool)

(assert (=> b!523804 (= e!305474 (bvsge (x!49097 lt!240245) #b01111111111111111111111111111110))))

(declare-fun b!523805 () Bool)

(assert (=> b!523805 (and (bvsge (index!20107 lt!240245) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240245) (size!16375 lt!240104)))))

(assert (=> b!523805 (= e!305478 (= (select (arr!16010 lt!240104) (index!20107 lt!240245)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80475 c!61723) b!523803))

(assert (= (and d!80475 (not c!61723)) b!523799))

(assert (= (and b!523799 c!61722) b!523802))

(assert (= (and b!523799 (not c!61722)) b!523797))

(assert (= (and d!80475 c!61721) b!523804))

(assert (= (and d!80475 (not c!61721)) b!523800))

(assert (= (and b!523800 res!320965) b!523801))

(assert (= (and b!523801 (not res!320967)) b!523798))

(assert (= (and b!523798 (not res!320966)) b!523805))

(declare-fun m!503997 () Bool)

(assert (=> b!523805 m!503997))

(assert (=> b!523797 m!503969))

(assert (=> b!523797 m!503969))

(declare-fun m!503999 () Bool)

(assert (=> b!523797 m!503999))

(assert (=> b!523798 m!503997))

(assert (=> b!523801 m!503997))

(declare-fun m!504001 () Bool)

(assert (=> d!80475 m!504001))

(assert (=> d!80475 m!503761))

(assert (=> b!523526 d!80475))

(declare-fun d!80477 () Bool)

(assert (=> d!80477 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47604 d!80477))

(declare-fun d!80483 () Bool)

(assert (=> d!80483 (= (array_inv!11893 a!3235) (bvsge (size!16375 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47604 d!80483))

(declare-fun b!523821 () Bool)

(declare-fun lt!240258 () SeekEntryResult!4474)

(declare-fun e!305493 () SeekEntryResult!4474)

(assert (=> b!523821 (= e!305493 (seekKeyOrZeroReturnVacant!0 (x!49097 lt!240258) (index!20107 lt!240258) (index!20107 lt!240258) (select (arr!16010 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523822 () Bool)

(declare-fun c!61729 () Bool)

(declare-fun lt!240260 () (_ BitVec 64))

(assert (=> b!523822 (= c!61729 (= lt!240260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305492 () SeekEntryResult!4474)

(assert (=> b!523822 (= e!305492 e!305493)))

(declare-fun b!523823 () Bool)

(declare-fun e!305491 () SeekEntryResult!4474)

(assert (=> b!523823 (= e!305491 e!305492)))

(assert (=> b!523823 (= lt!240260 (select (arr!16010 a!3235) (index!20107 lt!240258)))))

(declare-fun c!61728 () Bool)

(assert (=> b!523823 (= c!61728 (= lt!240260 (select (arr!16010 a!3235) j!176)))))

(declare-fun b!523824 () Bool)

(assert (=> b!523824 (= e!305492 (Found!4474 (index!20107 lt!240258)))))

(declare-fun b!523825 () Bool)

(assert (=> b!523825 (= e!305491 Undefined!4474)))

(declare-fun b!523826 () Bool)

(assert (=> b!523826 (= e!305493 (MissingZero!4474 (index!20107 lt!240258)))))

(declare-fun d!80485 () Bool)

(declare-fun lt!240259 () SeekEntryResult!4474)

(assert (=> d!80485 (and (or ((_ is Undefined!4474) lt!240259) (not ((_ is Found!4474) lt!240259)) (and (bvsge (index!20106 lt!240259) #b00000000000000000000000000000000) (bvslt (index!20106 lt!240259) (size!16375 a!3235)))) (or ((_ is Undefined!4474) lt!240259) ((_ is Found!4474) lt!240259) (not ((_ is MissingZero!4474) lt!240259)) (and (bvsge (index!20105 lt!240259) #b00000000000000000000000000000000) (bvslt (index!20105 lt!240259) (size!16375 a!3235)))) (or ((_ is Undefined!4474) lt!240259) ((_ is Found!4474) lt!240259) ((_ is MissingZero!4474) lt!240259) (not ((_ is MissingVacant!4474) lt!240259)) (and (bvsge (index!20108 lt!240259) #b00000000000000000000000000000000) (bvslt (index!20108 lt!240259) (size!16375 a!3235)))) (or ((_ is Undefined!4474) lt!240259) (ite ((_ is Found!4474) lt!240259) (= (select (arr!16010 a!3235) (index!20106 lt!240259)) (select (arr!16010 a!3235) j!176)) (ite ((_ is MissingZero!4474) lt!240259) (= (select (arr!16010 a!3235) (index!20105 lt!240259)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4474) lt!240259) (= (select (arr!16010 a!3235) (index!20108 lt!240259)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80485 (= lt!240259 e!305491)))

(declare-fun c!61727 () Bool)

(assert (=> d!80485 (= c!61727 (and ((_ is Intermediate!4474) lt!240258) (undefined!5286 lt!240258)))))

(assert (=> d!80485 (= lt!240258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16010 a!3235) j!176) mask!3524) (select (arr!16010 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80485 (validMask!0 mask!3524)))

(assert (=> d!80485 (= (seekEntryOrOpen!0 (select (arr!16010 a!3235) j!176) a!3235 mask!3524) lt!240259)))

(assert (= (and d!80485 c!61727) b!523825))

(assert (= (and d!80485 (not c!61727)) b!523823))

(assert (= (and b!523823 c!61728) b!523824))

(assert (= (and b!523823 (not c!61728)) b!523822))

(assert (= (and b!523822 c!61729) b!523826))

(assert (= (and b!523822 (not c!61729)) b!523821))

(assert (=> b!523821 m!503773))

(declare-fun m!504015 () Bool)

(assert (=> b!523821 m!504015))

(declare-fun m!504017 () Bool)

(assert (=> b!523823 m!504017))

(assert (=> d!80485 m!503773))

(assert (=> d!80485 m!503775))

(declare-fun m!504019 () Bool)

(assert (=> d!80485 m!504019))

(assert (=> d!80485 m!503761))

(assert (=> d!80485 m!503775))

(assert (=> d!80485 m!503773))

(declare-fun m!504021 () Bool)

(assert (=> d!80485 m!504021))

(declare-fun m!504023 () Bool)

(assert (=> d!80485 m!504023))

(declare-fun m!504027 () Bool)

(assert (=> d!80485 m!504027))

(assert (=> b!523520 d!80485))

(declare-fun d!80489 () Bool)

(declare-fun res!320987 () Bool)

(declare-fun e!305506 () Bool)

(assert (=> d!80489 (=> res!320987 e!305506)))

(assert (=> d!80489 (= res!320987 (= (select (arr!16010 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80489 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!305506)))

(declare-fun b!523844 () Bool)

(declare-fun e!305507 () Bool)

(assert (=> b!523844 (= e!305506 e!305507)))

(declare-fun res!320988 () Bool)

(assert (=> b!523844 (=> (not res!320988) (not e!305507))))

(assert (=> b!523844 (= res!320988 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16375 a!3235)))))

(declare-fun b!523845 () Bool)

(assert (=> b!523845 (= e!305507 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80489 (not res!320987)) b!523844))

(assert (= (and b!523844 res!320988) b!523845))

(assert (=> d!80489 m!503887))

(declare-fun m!504039 () Bool)

(assert (=> b!523845 m!504039))

(assert (=> b!523515 d!80489))

(check-sat (not b!523796) (not b!523655) (not b!523765) (not b!523659) (not b!523821) (not d!80435) (not b!523624) (not b!523654) (not d!80475) (not d!80485) (not d!80423) (not b!523797) (not b!523625) (not b!523626) (not b!523658) (not d!80439) (not d!80451) (not b!523845) (not bm!31825) (not b!523747) (not b!523640) (not bm!31828) (not d!80459) (not bm!31829))
(check-sat)
