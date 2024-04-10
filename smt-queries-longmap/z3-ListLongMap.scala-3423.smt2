; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47462 () Bool)

(assert start!47462)

(declare-fun b!522670 () Bool)

(declare-fun res!320303 () Bool)

(declare-fun e!304834 () Bool)

(assert (=> b!522670 (=> (not res!320303) (not e!304834))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33288 0))(
  ( (array!33289 (arr!16000 (Array (_ BitVec 32) (_ BitVec 64))) (size!16364 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33288)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!522670 (= res!320303 (and (= (size!16364 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16364 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16364 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522671 () Bool)

(declare-fun res!320294 () Bool)

(declare-fun e!304831 () Bool)

(assert (=> b!522671 (=> (not res!320294) (not e!304831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33288 (_ BitVec 32)) Bool)

(assert (=> b!522671 (= res!320294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522672 () Bool)

(declare-datatypes ((Unit!16320 0))(
  ( (Unit!16321) )
))
(declare-fun e!304832 () Unit!16320)

(declare-fun Unit!16322 () Unit!16320)

(assert (=> b!522672 (= e!304832 Unit!16322)))

(declare-datatypes ((SeekEntryResult!4467 0))(
  ( (MissingZero!4467 (index!20071 (_ BitVec 32))) (Found!4467 (index!20072 (_ BitVec 32))) (Intermediate!4467 (undefined!5279 Bool) (index!20073 (_ BitVec 32)) (x!49045 (_ BitVec 32))) (Undefined!4467) (MissingVacant!4467 (index!20074 (_ BitVec 32))) )
))
(declare-fun lt!239752 () SeekEntryResult!4467)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!239753 () Unit!16320)

(declare-fun lt!239750 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33288 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16320)

(assert (=> b!522672 (= lt!239753 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239750 #b00000000000000000000000000000000 (index!20073 lt!239752) (x!49045 lt!239752) mask!3524))))

(declare-fun lt!239755 () (_ BitVec 64))

(declare-fun lt!239756 () array!33288)

(declare-fun res!320300 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33288 (_ BitVec 32)) SeekEntryResult!4467)

(assert (=> b!522672 (= res!320300 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239750 lt!239755 lt!239756 mask!3524) (Intermediate!4467 false (index!20073 lt!239752) (x!49045 lt!239752))))))

(declare-fun e!304833 () Bool)

(assert (=> b!522672 (=> (not res!320300) (not e!304833))))

(assert (=> b!522672 e!304833))

(declare-fun b!522673 () Bool)

(declare-fun e!304836 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33288 (_ BitVec 32)) SeekEntryResult!4467)

(assert (=> b!522673 (= e!304836 (= (seekEntryOrOpen!0 (select (arr!16000 a!3235) j!176) a!3235 mask!3524) (Found!4467 j!176)))))

(declare-fun b!522674 () Bool)

(assert (=> b!522674 (= e!304833 false)))

(declare-fun b!522675 () Bool)

(declare-fun e!304835 () Bool)

(assert (=> b!522675 (= e!304835 (bvsle #b00000000000000000000000000000000 (x!49045 lt!239752)))))

(assert (=> b!522675 (and (or (= (select (arr!16000 a!3235) (index!20073 lt!239752)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16000 a!3235) (index!20073 lt!239752)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16000 a!3235) (index!20073 lt!239752)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16000 a!3235) (index!20073 lt!239752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239751 () Unit!16320)

(assert (=> b!522675 (= lt!239751 e!304832)))

(declare-fun c!61490 () Bool)

(assert (=> b!522675 (= c!61490 (= (select (arr!16000 a!3235) (index!20073 lt!239752)) (select (arr!16000 a!3235) j!176)))))

(assert (=> b!522675 (and (bvslt (x!49045 lt!239752) #b01111111111111111111111111111110) (or (= (select (arr!16000 a!3235) (index!20073 lt!239752)) (select (arr!16000 a!3235) j!176)) (= (select (arr!16000 a!3235) (index!20073 lt!239752)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16000 a!3235) (index!20073 lt!239752)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522676 () Bool)

(declare-fun res!320302 () Bool)

(assert (=> b!522676 (=> res!320302 e!304835)))

(get-info :version)

(assert (=> b!522676 (= res!320302 (or (undefined!5279 lt!239752) (not ((_ is Intermediate!4467) lt!239752))))))

(declare-fun b!522677 () Bool)

(declare-fun Unit!16323 () Unit!16320)

(assert (=> b!522677 (= e!304832 Unit!16323)))

(declare-fun b!522678 () Bool)

(assert (=> b!522678 (= e!304831 (not e!304835))))

(declare-fun res!320292 () Bool)

(assert (=> b!522678 (=> res!320292 e!304835)))

(declare-fun lt!239758 () (_ BitVec 32))

(assert (=> b!522678 (= res!320292 (= lt!239752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239758 lt!239755 lt!239756 mask!3524)))))

(assert (=> b!522678 (= lt!239752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239750 (select (arr!16000 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522678 (= lt!239758 (toIndex!0 lt!239755 mask!3524))))

(assert (=> b!522678 (= lt!239755 (select (store (arr!16000 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522678 (= lt!239750 (toIndex!0 (select (arr!16000 a!3235) j!176) mask!3524))))

(assert (=> b!522678 (= lt!239756 (array!33289 (store (arr!16000 a!3235) i!1204 k0!2280) (size!16364 a!3235)))))

(assert (=> b!522678 e!304836))

(declare-fun res!320295 () Bool)

(assert (=> b!522678 (=> (not res!320295) (not e!304836))))

(assert (=> b!522678 (= res!320295 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239757 () Unit!16320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16320)

(assert (=> b!522678 (= lt!239757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522679 () Bool)

(declare-fun res!320297 () Bool)

(assert (=> b!522679 (=> (not res!320297) (not e!304834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522679 (= res!320297 (validKeyInArray!0 k0!2280))))

(declare-fun b!522681 () Bool)

(declare-fun res!320293 () Bool)

(assert (=> b!522681 (=> (not res!320293) (not e!304831))))

(declare-datatypes ((List!10158 0))(
  ( (Nil!10155) (Cons!10154 (h!11076 (_ BitVec 64)) (t!16386 List!10158)) )
))
(declare-fun arrayNoDuplicates!0 (array!33288 (_ BitVec 32) List!10158) Bool)

(assert (=> b!522681 (= res!320293 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10155))))

(declare-fun b!522682 () Bool)

(declare-fun res!320299 () Bool)

(assert (=> b!522682 (=> (not res!320299) (not e!304834))))

(declare-fun arrayContainsKey!0 (array!33288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522682 (= res!320299 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522683 () Bool)

(assert (=> b!522683 (= e!304834 e!304831)))

(declare-fun res!320296 () Bool)

(assert (=> b!522683 (=> (not res!320296) (not e!304831))))

(declare-fun lt!239754 () SeekEntryResult!4467)

(assert (=> b!522683 (= res!320296 (or (= lt!239754 (MissingZero!4467 i!1204)) (= lt!239754 (MissingVacant!4467 i!1204))))))

(assert (=> b!522683 (= lt!239754 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522680 () Bool)

(declare-fun res!320298 () Bool)

(assert (=> b!522680 (=> (not res!320298) (not e!304834))))

(assert (=> b!522680 (= res!320298 (validKeyInArray!0 (select (arr!16000 a!3235) j!176)))))

(declare-fun res!320301 () Bool)

(assert (=> start!47462 (=> (not res!320301) (not e!304834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47462 (= res!320301 (validMask!0 mask!3524))))

(assert (=> start!47462 e!304834))

(assert (=> start!47462 true))

(declare-fun array_inv!11796 (array!33288) Bool)

(assert (=> start!47462 (array_inv!11796 a!3235)))

(assert (= (and start!47462 res!320301) b!522670))

(assert (= (and b!522670 res!320303) b!522680))

(assert (= (and b!522680 res!320298) b!522679))

(assert (= (and b!522679 res!320297) b!522682))

(assert (= (and b!522682 res!320299) b!522683))

(assert (= (and b!522683 res!320296) b!522671))

(assert (= (and b!522671 res!320294) b!522681))

(assert (= (and b!522681 res!320293) b!522678))

(assert (= (and b!522678 res!320295) b!522673))

(assert (= (and b!522678 (not res!320292)) b!522676))

(assert (= (and b!522676 (not res!320302)) b!522675))

(assert (= (and b!522675 c!61490) b!522672))

(assert (= (and b!522675 (not c!61490)) b!522677))

(assert (= (and b!522672 res!320300) b!522674))

(declare-fun m!503583 () Bool)

(assert (=> b!522683 m!503583))

(declare-fun m!503585 () Bool)

(assert (=> b!522678 m!503585))

(declare-fun m!503587 () Bool)

(assert (=> b!522678 m!503587))

(declare-fun m!503589 () Bool)

(assert (=> b!522678 m!503589))

(declare-fun m!503591 () Bool)

(assert (=> b!522678 m!503591))

(declare-fun m!503593 () Bool)

(assert (=> b!522678 m!503593))

(assert (=> b!522678 m!503591))

(declare-fun m!503595 () Bool)

(assert (=> b!522678 m!503595))

(declare-fun m!503597 () Bool)

(assert (=> b!522678 m!503597))

(declare-fun m!503599 () Bool)

(assert (=> b!522678 m!503599))

(assert (=> b!522678 m!503591))

(declare-fun m!503601 () Bool)

(assert (=> b!522678 m!503601))

(declare-fun m!503603 () Bool)

(assert (=> b!522671 m!503603))

(declare-fun m!503605 () Bool)

(assert (=> b!522682 m!503605))

(declare-fun m!503607 () Bool)

(assert (=> b!522679 m!503607))

(declare-fun m!503609 () Bool)

(assert (=> b!522681 m!503609))

(assert (=> b!522680 m!503591))

(assert (=> b!522680 m!503591))

(declare-fun m!503611 () Bool)

(assert (=> b!522680 m!503611))

(declare-fun m!503613 () Bool)

(assert (=> b!522672 m!503613))

(declare-fun m!503615 () Bool)

(assert (=> b!522672 m!503615))

(declare-fun m!503617 () Bool)

(assert (=> b!522675 m!503617))

(assert (=> b!522675 m!503591))

(assert (=> b!522673 m!503591))

(assert (=> b!522673 m!503591))

(declare-fun m!503619 () Bool)

(assert (=> b!522673 m!503619))

(declare-fun m!503621 () Bool)

(assert (=> start!47462 m!503621))

(declare-fun m!503623 () Bool)

(assert (=> start!47462 m!503623))

(check-sat (not b!522681) (not b!522678) (not b!522671) (not b!522672) (not b!522679) (not b!522673) (not start!47462) (not b!522683) (not b!522680) (not b!522682))
(check-sat)
(get-model)

(declare-fun d!80413 () Bool)

(assert (=> d!80413 (= (validKeyInArray!0 (select (arr!16000 a!3235) j!176)) (and (not (= (select (arr!16000 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16000 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!522680 d!80413))

(declare-fun d!80415 () Bool)

(assert (=> d!80415 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!522679 d!80415))

(declare-fun lt!239792 () SeekEntryResult!4467)

(declare-fun e!304866 () SeekEntryResult!4467)

(declare-fun b!522739 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33288 (_ BitVec 32)) SeekEntryResult!4467)

(assert (=> b!522739 (= e!304866 (seekKeyOrZeroReturnVacant!0 (x!49045 lt!239792) (index!20073 lt!239792) (index!20073 lt!239792) (select (arr!16000 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!522740 () Bool)

(assert (=> b!522740 (= e!304866 (MissingZero!4467 (index!20073 lt!239792)))))

(declare-fun b!522741 () Bool)

(declare-fun e!304864 () SeekEntryResult!4467)

(assert (=> b!522741 (= e!304864 Undefined!4467)))

(declare-fun b!522742 () Bool)

(declare-fun e!304865 () SeekEntryResult!4467)

(assert (=> b!522742 (= e!304865 (Found!4467 (index!20073 lt!239792)))))

(declare-fun b!522743 () Bool)

(declare-fun c!61502 () Bool)

(declare-fun lt!239794 () (_ BitVec 64))

(assert (=> b!522743 (= c!61502 (= lt!239794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522743 (= e!304865 e!304866)))

(declare-fun b!522738 () Bool)

(assert (=> b!522738 (= e!304864 e!304865)))

(assert (=> b!522738 (= lt!239794 (select (arr!16000 a!3235) (index!20073 lt!239792)))))

(declare-fun c!61501 () Bool)

(assert (=> b!522738 (= c!61501 (= lt!239794 (select (arr!16000 a!3235) j!176)))))

(declare-fun d!80417 () Bool)

(declare-fun lt!239793 () SeekEntryResult!4467)

(assert (=> d!80417 (and (or ((_ is Undefined!4467) lt!239793) (not ((_ is Found!4467) lt!239793)) (and (bvsge (index!20072 lt!239793) #b00000000000000000000000000000000) (bvslt (index!20072 lt!239793) (size!16364 a!3235)))) (or ((_ is Undefined!4467) lt!239793) ((_ is Found!4467) lt!239793) (not ((_ is MissingZero!4467) lt!239793)) (and (bvsge (index!20071 lt!239793) #b00000000000000000000000000000000) (bvslt (index!20071 lt!239793) (size!16364 a!3235)))) (or ((_ is Undefined!4467) lt!239793) ((_ is Found!4467) lt!239793) ((_ is MissingZero!4467) lt!239793) (not ((_ is MissingVacant!4467) lt!239793)) (and (bvsge (index!20074 lt!239793) #b00000000000000000000000000000000) (bvslt (index!20074 lt!239793) (size!16364 a!3235)))) (or ((_ is Undefined!4467) lt!239793) (ite ((_ is Found!4467) lt!239793) (= (select (arr!16000 a!3235) (index!20072 lt!239793)) (select (arr!16000 a!3235) j!176)) (ite ((_ is MissingZero!4467) lt!239793) (= (select (arr!16000 a!3235) (index!20071 lt!239793)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4467) lt!239793) (= (select (arr!16000 a!3235) (index!20074 lt!239793)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80417 (= lt!239793 e!304864)))

(declare-fun c!61500 () Bool)

(assert (=> d!80417 (= c!61500 (and ((_ is Intermediate!4467) lt!239792) (undefined!5279 lt!239792)))))

(assert (=> d!80417 (= lt!239792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16000 a!3235) j!176) mask!3524) (select (arr!16000 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80417 (validMask!0 mask!3524)))

(assert (=> d!80417 (= (seekEntryOrOpen!0 (select (arr!16000 a!3235) j!176) a!3235 mask!3524) lt!239793)))

(assert (= (and d!80417 c!61500) b!522741))

(assert (= (and d!80417 (not c!61500)) b!522738))

(assert (= (and b!522738 c!61501) b!522742))

(assert (= (and b!522738 (not c!61501)) b!522743))

(assert (= (and b!522743 c!61502) b!522740))

(assert (= (and b!522743 (not c!61502)) b!522739))

(assert (=> b!522739 m!503591))

(declare-fun m!503667 () Bool)

(assert (=> b!522739 m!503667))

(declare-fun m!503669 () Bool)

(assert (=> b!522738 m!503669))

(declare-fun m!503671 () Bool)

(assert (=> d!80417 m!503671))

(declare-fun m!503673 () Bool)

(assert (=> d!80417 m!503673))

(assert (=> d!80417 m!503621))

(assert (=> d!80417 m!503591))

(assert (=> d!80417 m!503593))

(assert (=> d!80417 m!503593))

(assert (=> d!80417 m!503591))

(declare-fun m!503675 () Bool)

(assert (=> d!80417 m!503675))

(declare-fun m!503677 () Bool)

(assert (=> d!80417 m!503677))

(assert (=> b!522673 d!80417))

(declare-fun e!304869 () SeekEntryResult!4467)

(declare-fun lt!239795 () SeekEntryResult!4467)

(declare-fun b!522745 () Bool)

(assert (=> b!522745 (= e!304869 (seekKeyOrZeroReturnVacant!0 (x!49045 lt!239795) (index!20073 lt!239795) (index!20073 lt!239795) k0!2280 a!3235 mask!3524))))

(declare-fun b!522746 () Bool)

(assert (=> b!522746 (= e!304869 (MissingZero!4467 (index!20073 lt!239795)))))

(declare-fun b!522747 () Bool)

(declare-fun e!304867 () SeekEntryResult!4467)

(assert (=> b!522747 (= e!304867 Undefined!4467)))

(declare-fun b!522748 () Bool)

(declare-fun e!304868 () SeekEntryResult!4467)

(assert (=> b!522748 (= e!304868 (Found!4467 (index!20073 lt!239795)))))

(declare-fun b!522749 () Bool)

(declare-fun c!61505 () Bool)

(declare-fun lt!239797 () (_ BitVec 64))

(assert (=> b!522749 (= c!61505 (= lt!239797 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522749 (= e!304868 e!304869)))

(declare-fun b!522744 () Bool)

(assert (=> b!522744 (= e!304867 e!304868)))

(assert (=> b!522744 (= lt!239797 (select (arr!16000 a!3235) (index!20073 lt!239795)))))

(declare-fun c!61504 () Bool)

(assert (=> b!522744 (= c!61504 (= lt!239797 k0!2280))))

(declare-fun d!80423 () Bool)

(declare-fun lt!239796 () SeekEntryResult!4467)

(assert (=> d!80423 (and (or ((_ is Undefined!4467) lt!239796) (not ((_ is Found!4467) lt!239796)) (and (bvsge (index!20072 lt!239796) #b00000000000000000000000000000000) (bvslt (index!20072 lt!239796) (size!16364 a!3235)))) (or ((_ is Undefined!4467) lt!239796) ((_ is Found!4467) lt!239796) (not ((_ is MissingZero!4467) lt!239796)) (and (bvsge (index!20071 lt!239796) #b00000000000000000000000000000000) (bvslt (index!20071 lt!239796) (size!16364 a!3235)))) (or ((_ is Undefined!4467) lt!239796) ((_ is Found!4467) lt!239796) ((_ is MissingZero!4467) lt!239796) (not ((_ is MissingVacant!4467) lt!239796)) (and (bvsge (index!20074 lt!239796) #b00000000000000000000000000000000) (bvslt (index!20074 lt!239796) (size!16364 a!3235)))) (or ((_ is Undefined!4467) lt!239796) (ite ((_ is Found!4467) lt!239796) (= (select (arr!16000 a!3235) (index!20072 lt!239796)) k0!2280) (ite ((_ is MissingZero!4467) lt!239796) (= (select (arr!16000 a!3235) (index!20071 lt!239796)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4467) lt!239796) (= (select (arr!16000 a!3235) (index!20074 lt!239796)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80423 (= lt!239796 e!304867)))

(declare-fun c!61503 () Bool)

(assert (=> d!80423 (= c!61503 (and ((_ is Intermediate!4467) lt!239795) (undefined!5279 lt!239795)))))

(assert (=> d!80423 (= lt!239795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80423 (validMask!0 mask!3524)))

(assert (=> d!80423 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!239796)))

(assert (= (and d!80423 c!61503) b!522747))

(assert (= (and d!80423 (not c!61503)) b!522744))

(assert (= (and b!522744 c!61504) b!522748))

(assert (= (and b!522744 (not c!61504)) b!522749))

(assert (= (and b!522749 c!61505) b!522746))

(assert (= (and b!522749 (not c!61505)) b!522745))

(declare-fun m!503679 () Bool)

(assert (=> b!522745 m!503679))

(declare-fun m!503681 () Bool)

(assert (=> b!522744 m!503681))

(declare-fun m!503683 () Bool)

(assert (=> d!80423 m!503683))

(declare-fun m!503685 () Bool)

(assert (=> d!80423 m!503685))

(assert (=> d!80423 m!503621))

(declare-fun m!503687 () Bool)

(assert (=> d!80423 m!503687))

(assert (=> d!80423 m!503687))

(declare-fun m!503689 () Bool)

(assert (=> d!80423 m!503689))

(declare-fun m!503691 () Bool)

(assert (=> d!80423 m!503691))

(assert (=> b!522683 d!80423))

(declare-fun d!80425 () Bool)

(declare-fun lt!239809 () (_ BitVec 32))

(declare-fun lt!239808 () (_ BitVec 32))

(assert (=> d!80425 (= lt!239809 (bvmul (bvxor lt!239808 (bvlshr lt!239808 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80425 (= lt!239808 ((_ extract 31 0) (bvand (bvxor (select (arr!16000 a!3235) j!176) (bvlshr (select (arr!16000 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80425 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320341 (let ((h!11079 ((_ extract 31 0) (bvand (bvxor (select (arr!16000 a!3235) j!176) (bvlshr (select (arr!16000 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49048 (bvmul (bvxor h!11079 (bvlshr h!11079 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49048 (bvlshr x!49048 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320341 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320341 #b00000000000000000000000000000000))))))

(assert (=> d!80425 (= (toIndex!0 (select (arr!16000 a!3235) j!176) mask!3524) (bvand (bvxor lt!239809 (bvlshr lt!239809 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!522678 d!80425))

(declare-fun b!522782 () Bool)

(declare-fun e!304896 () Bool)

(declare-fun call!31817 () Bool)

(assert (=> b!522782 (= e!304896 call!31817)))

(declare-fun bm!31814 () Bool)

(assert (=> bm!31814 (= call!31817 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80431 () Bool)

(declare-fun res!320359 () Bool)

(declare-fun e!304894 () Bool)

(assert (=> d!80431 (=> res!320359 e!304894)))

(assert (=> d!80431 (= res!320359 (bvsge j!176 (size!16364 a!3235)))))

(assert (=> d!80431 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!304894)))

(declare-fun b!522783 () Bool)

(declare-fun e!304895 () Bool)

(assert (=> b!522783 (= e!304895 call!31817)))

(declare-fun b!522784 () Bool)

(assert (=> b!522784 (= e!304896 e!304895)))

(declare-fun lt!239836 () (_ BitVec 64))

(assert (=> b!522784 (= lt!239836 (select (arr!16000 a!3235) j!176))))

(declare-fun lt!239834 () Unit!16320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33288 (_ BitVec 64) (_ BitVec 32)) Unit!16320)

(assert (=> b!522784 (= lt!239834 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!239836 j!176))))

(assert (=> b!522784 (arrayContainsKey!0 a!3235 lt!239836 #b00000000000000000000000000000000)))

(declare-fun lt!239835 () Unit!16320)

(assert (=> b!522784 (= lt!239835 lt!239834)))

(declare-fun res!320358 () Bool)

(assert (=> b!522784 (= res!320358 (= (seekEntryOrOpen!0 (select (arr!16000 a!3235) j!176) a!3235 mask!3524) (Found!4467 j!176)))))

(assert (=> b!522784 (=> (not res!320358) (not e!304895))))

(declare-fun b!522785 () Bool)

(assert (=> b!522785 (= e!304894 e!304896)))

(declare-fun c!61514 () Bool)

(assert (=> b!522785 (= c!61514 (validKeyInArray!0 (select (arr!16000 a!3235) j!176)))))

(assert (= (and d!80431 (not res!320359)) b!522785))

(assert (= (and b!522785 c!61514) b!522784))

(assert (= (and b!522785 (not c!61514)) b!522782))

(assert (= (and b!522784 res!320358) b!522783))

(assert (= (or b!522783 b!522782) bm!31814))

(declare-fun m!503711 () Bool)

(assert (=> bm!31814 m!503711))

(assert (=> b!522784 m!503591))

(declare-fun m!503713 () Bool)

(assert (=> b!522784 m!503713))

(declare-fun m!503715 () Bool)

(assert (=> b!522784 m!503715))

(assert (=> b!522784 m!503591))

(assert (=> b!522784 m!503619))

(assert (=> b!522785 m!503591))

(assert (=> b!522785 m!503591))

(assert (=> b!522785 m!503611))

(assert (=> b!522678 d!80431))

(declare-fun b!522825 () Bool)

(declare-fun e!304924 () SeekEntryResult!4467)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522825 (= e!304924 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239750 #b00000000000000000000000000000000 mask!3524) (select (arr!16000 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!522826 () Bool)

(declare-fun e!304920 () Bool)

(declare-fun e!304921 () Bool)

(assert (=> b!522826 (= e!304920 e!304921)))

(declare-fun res!320375 () Bool)

(declare-fun lt!239849 () SeekEntryResult!4467)

(assert (=> b!522826 (= res!320375 (and ((_ is Intermediate!4467) lt!239849) (not (undefined!5279 lt!239849)) (bvslt (x!49045 lt!239849) #b01111111111111111111111111111110) (bvsge (x!49045 lt!239849) #b00000000000000000000000000000000) (bvsge (x!49045 lt!239849) #b00000000000000000000000000000000)))))

(assert (=> b!522826 (=> (not res!320375) (not e!304921))))

(declare-fun b!522827 () Bool)

(assert (=> b!522827 (and (bvsge (index!20073 lt!239849) #b00000000000000000000000000000000) (bvslt (index!20073 lt!239849) (size!16364 a!3235)))))

(declare-fun res!320376 () Bool)

(assert (=> b!522827 (= res!320376 (= (select (arr!16000 a!3235) (index!20073 lt!239849)) (select (arr!16000 a!3235) j!176)))))

(declare-fun e!304922 () Bool)

(assert (=> b!522827 (=> res!320376 e!304922)))

(assert (=> b!522827 (= e!304921 e!304922)))

(declare-fun d!80439 () Bool)

(assert (=> d!80439 e!304920))

(declare-fun c!61528 () Bool)

(assert (=> d!80439 (= c!61528 (and ((_ is Intermediate!4467) lt!239849) (undefined!5279 lt!239849)))))

(declare-fun e!304923 () SeekEntryResult!4467)

(assert (=> d!80439 (= lt!239849 e!304923)))

(declare-fun c!61529 () Bool)

(assert (=> d!80439 (= c!61529 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239848 () (_ BitVec 64))

(assert (=> d!80439 (= lt!239848 (select (arr!16000 a!3235) lt!239750))))

(assert (=> d!80439 (validMask!0 mask!3524)))

(assert (=> d!80439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239750 (select (arr!16000 a!3235) j!176) a!3235 mask!3524) lt!239849)))

(declare-fun b!522828 () Bool)

(assert (=> b!522828 (= e!304923 (Intermediate!4467 true lt!239750 #b00000000000000000000000000000000))))

(declare-fun b!522829 () Bool)

(assert (=> b!522829 (and (bvsge (index!20073 lt!239849) #b00000000000000000000000000000000) (bvslt (index!20073 lt!239849) (size!16364 a!3235)))))

(declare-fun res!320377 () Bool)

(assert (=> b!522829 (= res!320377 (= (select (arr!16000 a!3235) (index!20073 lt!239849)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522829 (=> res!320377 e!304922)))

(declare-fun b!522830 () Bool)

(assert (=> b!522830 (= e!304924 (Intermediate!4467 false lt!239750 #b00000000000000000000000000000000))))

(declare-fun b!522831 () Bool)

(assert (=> b!522831 (= e!304923 e!304924)))

(declare-fun c!61527 () Bool)

(assert (=> b!522831 (= c!61527 (or (= lt!239848 (select (arr!16000 a!3235) j!176)) (= (bvadd lt!239848 lt!239848) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522832 () Bool)

(assert (=> b!522832 (and (bvsge (index!20073 lt!239849) #b00000000000000000000000000000000) (bvslt (index!20073 lt!239849) (size!16364 a!3235)))))

(assert (=> b!522832 (= e!304922 (= (select (arr!16000 a!3235) (index!20073 lt!239849)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!522833 () Bool)

(assert (=> b!522833 (= e!304920 (bvsge (x!49045 lt!239849) #b01111111111111111111111111111110))))

(assert (= (and d!80439 c!61529) b!522828))

(assert (= (and d!80439 (not c!61529)) b!522831))

(assert (= (and b!522831 c!61527) b!522830))

(assert (= (and b!522831 (not c!61527)) b!522825))

(assert (= (and d!80439 c!61528) b!522833))

(assert (= (and d!80439 (not c!61528)) b!522826))

(assert (= (and b!522826 res!320375) b!522827))

(assert (= (and b!522827 (not res!320376)) b!522829))

(assert (= (and b!522829 (not res!320377)) b!522832))

(declare-fun m!503721 () Bool)

(assert (=> b!522829 m!503721))

(assert (=> b!522827 m!503721))

(declare-fun m!503725 () Bool)

(assert (=> b!522825 m!503725))

(assert (=> b!522825 m!503725))

(assert (=> b!522825 m!503591))

(declare-fun m!503727 () Bool)

(assert (=> b!522825 m!503727))

(assert (=> b!522832 m!503721))

(declare-fun m!503733 () Bool)

(assert (=> d!80439 m!503733))

(assert (=> d!80439 m!503621))

(assert (=> b!522678 d!80439))

(declare-fun d!80443 () Bool)

(assert (=> d!80443 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!239860 () Unit!16320)

(declare-fun choose!38 (array!33288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16320)

(assert (=> d!80443 (= lt!239860 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80443 (validMask!0 mask!3524)))

(assert (=> d!80443 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!239860)))

(declare-fun bs!16438 () Bool)

(assert (= bs!16438 d!80443))

(assert (=> bs!16438 m!503595))

(declare-fun m!503745 () Bool)

(assert (=> bs!16438 m!503745))

(assert (=> bs!16438 m!503621))

(assert (=> b!522678 d!80443))

(declare-fun d!80449 () Bool)

(declare-fun lt!239862 () (_ BitVec 32))

(declare-fun lt!239861 () (_ BitVec 32))

(assert (=> d!80449 (= lt!239862 (bvmul (bvxor lt!239861 (bvlshr lt!239861 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80449 (= lt!239861 ((_ extract 31 0) (bvand (bvxor lt!239755 (bvlshr lt!239755 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80449 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320341 (let ((h!11079 ((_ extract 31 0) (bvand (bvxor lt!239755 (bvlshr lt!239755 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49048 (bvmul (bvxor h!11079 (bvlshr h!11079 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49048 (bvlshr x!49048 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320341 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320341 #b00000000000000000000000000000000))))))

(assert (=> d!80449 (= (toIndex!0 lt!239755 mask!3524) (bvand (bvxor lt!239862 (bvlshr lt!239862 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!522678 d!80449))

(declare-fun e!304949 () SeekEntryResult!4467)

(declare-fun b!522870 () Bool)

(assert (=> b!522870 (= e!304949 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239758 #b00000000000000000000000000000000 mask!3524) lt!239755 lt!239756 mask!3524))))

(declare-fun b!522871 () Bool)

(declare-fun e!304945 () Bool)

(declare-fun e!304946 () Bool)

(assert (=> b!522871 (= e!304945 e!304946)))

(declare-fun res!320390 () Bool)

(declare-fun lt!239864 () SeekEntryResult!4467)

(assert (=> b!522871 (= res!320390 (and ((_ is Intermediate!4467) lt!239864) (not (undefined!5279 lt!239864)) (bvslt (x!49045 lt!239864) #b01111111111111111111111111111110) (bvsge (x!49045 lt!239864) #b00000000000000000000000000000000) (bvsge (x!49045 lt!239864) #b00000000000000000000000000000000)))))

(assert (=> b!522871 (=> (not res!320390) (not e!304946))))

(declare-fun b!522872 () Bool)

(assert (=> b!522872 (and (bvsge (index!20073 lt!239864) #b00000000000000000000000000000000) (bvslt (index!20073 lt!239864) (size!16364 lt!239756)))))

(declare-fun res!320391 () Bool)

(assert (=> b!522872 (= res!320391 (= (select (arr!16000 lt!239756) (index!20073 lt!239864)) lt!239755))))

(declare-fun e!304947 () Bool)

(assert (=> b!522872 (=> res!320391 e!304947)))

(assert (=> b!522872 (= e!304946 e!304947)))

(declare-fun d!80451 () Bool)

(assert (=> d!80451 e!304945))

(declare-fun c!61543 () Bool)

(assert (=> d!80451 (= c!61543 (and ((_ is Intermediate!4467) lt!239864) (undefined!5279 lt!239864)))))

(declare-fun e!304948 () SeekEntryResult!4467)

(assert (=> d!80451 (= lt!239864 e!304948)))

(declare-fun c!61544 () Bool)

(assert (=> d!80451 (= c!61544 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239863 () (_ BitVec 64))

(assert (=> d!80451 (= lt!239863 (select (arr!16000 lt!239756) lt!239758))))

(assert (=> d!80451 (validMask!0 mask!3524)))

(assert (=> d!80451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239758 lt!239755 lt!239756 mask!3524) lt!239864)))

(declare-fun b!522873 () Bool)

(assert (=> b!522873 (= e!304948 (Intermediate!4467 true lt!239758 #b00000000000000000000000000000000))))

(declare-fun b!522874 () Bool)

(assert (=> b!522874 (and (bvsge (index!20073 lt!239864) #b00000000000000000000000000000000) (bvslt (index!20073 lt!239864) (size!16364 lt!239756)))))

(declare-fun res!320392 () Bool)

(assert (=> b!522874 (= res!320392 (= (select (arr!16000 lt!239756) (index!20073 lt!239864)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522874 (=> res!320392 e!304947)))

(declare-fun b!522875 () Bool)

(assert (=> b!522875 (= e!304949 (Intermediate!4467 false lt!239758 #b00000000000000000000000000000000))))

(declare-fun b!522876 () Bool)

(assert (=> b!522876 (= e!304948 e!304949)))

(declare-fun c!61542 () Bool)

(assert (=> b!522876 (= c!61542 (or (= lt!239863 lt!239755) (= (bvadd lt!239863 lt!239863) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522877 () Bool)

(assert (=> b!522877 (and (bvsge (index!20073 lt!239864) #b00000000000000000000000000000000) (bvslt (index!20073 lt!239864) (size!16364 lt!239756)))))

(assert (=> b!522877 (= e!304947 (= (select (arr!16000 lt!239756) (index!20073 lt!239864)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!522878 () Bool)

(assert (=> b!522878 (= e!304945 (bvsge (x!49045 lt!239864) #b01111111111111111111111111111110))))

(assert (= (and d!80451 c!61544) b!522873))

(assert (= (and d!80451 (not c!61544)) b!522876))

(assert (= (and b!522876 c!61542) b!522875))

(assert (= (and b!522876 (not c!61542)) b!522870))

(assert (= (and d!80451 c!61543) b!522878))

(assert (= (and d!80451 (not c!61543)) b!522871))

(assert (= (and b!522871 res!320390) b!522872))

(assert (= (and b!522872 (not res!320391)) b!522874))

(assert (= (and b!522874 (not res!320392)) b!522877))

(declare-fun m!503747 () Bool)

(assert (=> b!522874 m!503747))

(assert (=> b!522872 m!503747))

(declare-fun m!503749 () Bool)

(assert (=> b!522870 m!503749))

(assert (=> b!522870 m!503749))

(declare-fun m!503753 () Bool)

(assert (=> b!522870 m!503753))

(assert (=> b!522877 m!503747))

(declare-fun m!503755 () Bool)

(assert (=> d!80451 m!503755))

(assert (=> d!80451 m!503621))

(assert (=> b!522678 d!80451))

(declare-fun d!80455 () Bool)

(declare-fun e!304957 () Bool)

(assert (=> d!80455 e!304957))

(declare-fun res!320398 () Bool)

(assert (=> d!80455 (=> (not res!320398) (not e!304957))))

(assert (=> d!80455 (= res!320398 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16364 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16364 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16364 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16364 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16364 a!3235))))))

(declare-fun lt!239874 () Unit!16320)

(declare-fun choose!47 (array!33288 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16320)

(assert (=> d!80455 (= lt!239874 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!239750 #b00000000000000000000000000000000 (index!20073 lt!239752) (x!49045 lt!239752) mask!3524))))

(assert (=> d!80455 (validMask!0 mask!3524)))

(assert (=> d!80455 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239750 #b00000000000000000000000000000000 (index!20073 lt!239752) (x!49045 lt!239752) mask!3524) lt!239874)))

(declare-fun b!522890 () Bool)

(assert (=> b!522890 (= e!304957 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239750 (select (store (arr!16000 a!3235) i!1204 k0!2280) j!176) (array!33289 (store (arr!16000 a!3235) i!1204 k0!2280) (size!16364 a!3235)) mask!3524) (Intermediate!4467 false (index!20073 lt!239752) (x!49045 lt!239752))))))

(assert (= (and d!80455 res!320398) b!522890))

(declare-fun m!503765 () Bool)

(assert (=> d!80455 m!503765))

(assert (=> d!80455 m!503621))

(assert (=> b!522890 m!503587))

(assert (=> b!522890 m!503589))

(assert (=> b!522890 m!503589))

(declare-fun m!503767 () Bool)

(assert (=> b!522890 m!503767))

(assert (=> b!522672 d!80455))

(declare-fun e!304962 () SeekEntryResult!4467)

(declare-fun b!522891 () Bool)

(assert (=> b!522891 (= e!304962 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239750 #b00000000000000000000000000000000 mask!3524) lt!239755 lt!239756 mask!3524))))

(declare-fun b!522892 () Bool)

(declare-fun e!304958 () Bool)

(declare-fun e!304959 () Bool)

(assert (=> b!522892 (= e!304958 e!304959)))

(declare-fun res!320399 () Bool)

(declare-fun lt!239876 () SeekEntryResult!4467)

(assert (=> b!522892 (= res!320399 (and ((_ is Intermediate!4467) lt!239876) (not (undefined!5279 lt!239876)) (bvslt (x!49045 lt!239876) #b01111111111111111111111111111110) (bvsge (x!49045 lt!239876) #b00000000000000000000000000000000) (bvsge (x!49045 lt!239876) #b00000000000000000000000000000000)))))

(assert (=> b!522892 (=> (not res!320399) (not e!304959))))

(declare-fun b!522893 () Bool)

(assert (=> b!522893 (and (bvsge (index!20073 lt!239876) #b00000000000000000000000000000000) (bvslt (index!20073 lt!239876) (size!16364 lt!239756)))))

(declare-fun res!320400 () Bool)

(assert (=> b!522893 (= res!320400 (= (select (arr!16000 lt!239756) (index!20073 lt!239876)) lt!239755))))

(declare-fun e!304960 () Bool)

(assert (=> b!522893 (=> res!320400 e!304960)))

(assert (=> b!522893 (= e!304959 e!304960)))

(declare-fun d!80465 () Bool)

(assert (=> d!80465 e!304958))

(declare-fun c!61549 () Bool)

(assert (=> d!80465 (= c!61549 (and ((_ is Intermediate!4467) lt!239876) (undefined!5279 lt!239876)))))

(declare-fun e!304961 () SeekEntryResult!4467)

(assert (=> d!80465 (= lt!239876 e!304961)))

(declare-fun c!61550 () Bool)

(assert (=> d!80465 (= c!61550 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239875 () (_ BitVec 64))

(assert (=> d!80465 (= lt!239875 (select (arr!16000 lt!239756) lt!239750))))

(assert (=> d!80465 (validMask!0 mask!3524)))

(assert (=> d!80465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239750 lt!239755 lt!239756 mask!3524) lt!239876)))

(declare-fun b!522894 () Bool)

(assert (=> b!522894 (= e!304961 (Intermediate!4467 true lt!239750 #b00000000000000000000000000000000))))

(declare-fun b!522895 () Bool)

(assert (=> b!522895 (and (bvsge (index!20073 lt!239876) #b00000000000000000000000000000000) (bvslt (index!20073 lt!239876) (size!16364 lt!239756)))))

(declare-fun res!320401 () Bool)

(assert (=> b!522895 (= res!320401 (= (select (arr!16000 lt!239756) (index!20073 lt!239876)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522895 (=> res!320401 e!304960)))

(declare-fun b!522896 () Bool)

(assert (=> b!522896 (= e!304962 (Intermediate!4467 false lt!239750 #b00000000000000000000000000000000))))

(declare-fun b!522897 () Bool)

(assert (=> b!522897 (= e!304961 e!304962)))

(declare-fun c!61548 () Bool)

(assert (=> b!522897 (= c!61548 (or (= lt!239875 lt!239755) (= (bvadd lt!239875 lt!239875) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522898 () Bool)

(assert (=> b!522898 (and (bvsge (index!20073 lt!239876) #b00000000000000000000000000000000) (bvslt (index!20073 lt!239876) (size!16364 lt!239756)))))

(assert (=> b!522898 (= e!304960 (= (select (arr!16000 lt!239756) (index!20073 lt!239876)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!522899 () Bool)

(assert (=> b!522899 (= e!304958 (bvsge (x!49045 lt!239876) #b01111111111111111111111111111110))))

(assert (= (and d!80465 c!61550) b!522894))

(assert (= (and d!80465 (not c!61550)) b!522897))

(assert (= (and b!522897 c!61548) b!522896))

(assert (= (and b!522897 (not c!61548)) b!522891))

(assert (= (and d!80465 c!61549) b!522899))

(assert (= (and d!80465 (not c!61549)) b!522892))

(assert (= (and b!522892 res!320399) b!522893))

(assert (= (and b!522893 (not res!320400)) b!522895))

(assert (= (and b!522895 (not res!320401)) b!522898))

(declare-fun m!503769 () Bool)

(assert (=> b!522895 m!503769))

(assert (=> b!522893 m!503769))

(assert (=> b!522891 m!503725))

(assert (=> b!522891 m!503725))

(declare-fun m!503771 () Bool)

(assert (=> b!522891 m!503771))

(assert (=> b!522898 m!503769))

(declare-fun m!503773 () Bool)

(assert (=> d!80465 m!503773))

(assert (=> d!80465 m!503621))

(assert (=> b!522672 d!80465))

(declare-fun b!522900 () Bool)

(declare-fun e!304965 () Bool)

(declare-fun call!31818 () Bool)

(assert (=> b!522900 (= e!304965 call!31818)))

(declare-fun bm!31815 () Bool)

(assert (=> bm!31815 (= call!31818 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80467 () Bool)

(declare-fun res!320403 () Bool)

(declare-fun e!304963 () Bool)

(assert (=> d!80467 (=> res!320403 e!304963)))

(assert (=> d!80467 (= res!320403 (bvsge #b00000000000000000000000000000000 (size!16364 a!3235)))))

(assert (=> d!80467 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!304963)))

(declare-fun b!522901 () Bool)

(declare-fun e!304964 () Bool)

(assert (=> b!522901 (= e!304964 call!31818)))

(declare-fun b!522902 () Bool)

(assert (=> b!522902 (= e!304965 e!304964)))

(declare-fun lt!239879 () (_ BitVec 64))

(assert (=> b!522902 (= lt!239879 (select (arr!16000 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!239877 () Unit!16320)

(assert (=> b!522902 (= lt!239877 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!239879 #b00000000000000000000000000000000))))

(assert (=> b!522902 (arrayContainsKey!0 a!3235 lt!239879 #b00000000000000000000000000000000)))

(declare-fun lt!239878 () Unit!16320)

(assert (=> b!522902 (= lt!239878 lt!239877)))

(declare-fun res!320402 () Bool)

(assert (=> b!522902 (= res!320402 (= (seekEntryOrOpen!0 (select (arr!16000 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4467 #b00000000000000000000000000000000)))))

(assert (=> b!522902 (=> (not res!320402) (not e!304964))))

(declare-fun b!522903 () Bool)

(assert (=> b!522903 (= e!304963 e!304965)))

(declare-fun c!61551 () Bool)

(assert (=> b!522903 (= c!61551 (validKeyInArray!0 (select (arr!16000 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80467 (not res!320403)) b!522903))

(assert (= (and b!522903 c!61551) b!522902))

(assert (= (and b!522903 (not c!61551)) b!522900))

(assert (= (and b!522902 res!320402) b!522901))

(assert (= (or b!522901 b!522900) bm!31815))

(declare-fun m!503775 () Bool)

(assert (=> bm!31815 m!503775))

(declare-fun m!503777 () Bool)

(assert (=> b!522902 m!503777))

(declare-fun m!503779 () Bool)

(assert (=> b!522902 m!503779))

(declare-fun m!503781 () Bool)

(assert (=> b!522902 m!503781))

(assert (=> b!522902 m!503777))

(declare-fun m!503783 () Bool)

(assert (=> b!522902 m!503783))

(assert (=> b!522903 m!503777))

(assert (=> b!522903 m!503777))

(declare-fun m!503785 () Bool)

(assert (=> b!522903 m!503785))

(assert (=> b!522671 d!80467))

(declare-fun d!80469 () Bool)

(declare-fun res!320414 () Bool)

(declare-fun e!304978 () Bool)

(assert (=> d!80469 (=> res!320414 e!304978)))

(assert (=> d!80469 (= res!320414 (= (select (arr!16000 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80469 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!304978)))

(declare-fun b!522918 () Bool)

(declare-fun e!304979 () Bool)

(assert (=> b!522918 (= e!304978 e!304979)))

(declare-fun res!320415 () Bool)

(assert (=> b!522918 (=> (not res!320415) (not e!304979))))

(assert (=> b!522918 (= res!320415 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16364 a!3235)))))

(declare-fun b!522919 () Bool)

(assert (=> b!522919 (= e!304979 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80469 (not res!320414)) b!522918))

(assert (= (and b!522918 res!320415) b!522919))

(assert (=> d!80469 m!503777))

(declare-fun m!503787 () Bool)

(assert (=> b!522919 m!503787))

(assert (=> b!522682 d!80469))

(declare-fun d!80473 () Bool)

(declare-fun res!320426 () Bool)

(declare-fun e!304992 () Bool)

(assert (=> d!80473 (=> res!320426 e!304992)))

(assert (=> d!80473 (= res!320426 (bvsge #b00000000000000000000000000000000 (size!16364 a!3235)))))

(assert (=> d!80473 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10155) e!304992)))

(declare-fun b!522935 () Bool)

(declare-fun e!304995 () Bool)

(assert (=> b!522935 (= e!304992 e!304995)))

(declare-fun res!320427 () Bool)

(assert (=> b!522935 (=> (not res!320427) (not e!304995))))

(declare-fun e!304993 () Bool)

(assert (=> b!522935 (= res!320427 (not e!304993))))

(declare-fun res!320425 () Bool)

(assert (=> b!522935 (=> (not res!320425) (not e!304993))))

(assert (=> b!522935 (= res!320425 (validKeyInArray!0 (select (arr!16000 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!522936 () Bool)

(declare-fun e!304994 () Bool)

(assert (=> b!522936 (= e!304995 e!304994)))

(declare-fun c!61557 () Bool)

(assert (=> b!522936 (= c!61557 (validKeyInArray!0 (select (arr!16000 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!522937 () Bool)

(declare-fun call!31824 () Bool)

(assert (=> b!522937 (= e!304994 call!31824)))

(declare-fun bm!31821 () Bool)

(assert (=> bm!31821 (= call!31824 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61557 (Cons!10154 (select (arr!16000 a!3235) #b00000000000000000000000000000000) Nil!10155) Nil!10155)))))

(declare-fun b!522938 () Bool)

(declare-fun contains!2765 (List!10158 (_ BitVec 64)) Bool)

(assert (=> b!522938 (= e!304993 (contains!2765 Nil!10155 (select (arr!16000 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!522939 () Bool)

(assert (=> b!522939 (= e!304994 call!31824)))

(assert (= (and d!80473 (not res!320426)) b!522935))

(assert (= (and b!522935 res!320425) b!522938))

(assert (= (and b!522935 res!320427) b!522936))

(assert (= (and b!522936 c!61557) b!522939))

(assert (= (and b!522936 (not c!61557)) b!522937))

(assert (= (or b!522939 b!522937) bm!31821))

(assert (=> b!522935 m!503777))

(assert (=> b!522935 m!503777))

(assert (=> b!522935 m!503785))

(assert (=> b!522936 m!503777))

(assert (=> b!522936 m!503777))

(assert (=> b!522936 m!503785))

(assert (=> bm!31821 m!503777))

(declare-fun m!503797 () Bool)

(assert (=> bm!31821 m!503797))

(assert (=> b!522938 m!503777))

(assert (=> b!522938 m!503777))

(declare-fun m!503799 () Bool)

(assert (=> b!522938 m!503799))

(assert (=> b!522681 d!80473))

(declare-fun d!80479 () Bool)

(assert (=> d!80479 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47462 d!80479))

(declare-fun d!80481 () Bool)

(assert (=> d!80481 (= (array_inv!11796 a!3235) (bvsge (size!16364 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47462 d!80481))

(check-sat (not d!80455) (not d!80439) (not d!80417) (not d!80465) (not b!522938) (not bm!31821) (not b!522903) (not b!522919) (not b!522739) (not b!522784) (not b!522891) (not d!80423) (not b!522890) (not b!522825) (not b!522870) (not b!522785) (not b!522902) (not b!522745) (not d!80451) (not bm!31814) (not bm!31815) (not d!80443) (not b!522935) (not b!522936))
(check-sat)
