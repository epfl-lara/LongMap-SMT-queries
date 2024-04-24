; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45608 () Bool)

(assert start!45608)

(declare-fun b!502626 () Bool)

(declare-fun res!304076 () Bool)

(declare-fun e!294388 () Bool)

(assert (=> b!502626 (=> (not res!304076) (not e!294388))))

(declare-datatypes ((array!32365 0))(
  ( (array!32366 (arr!15562 (Array (_ BitVec 32) (_ BitVec 64))) (size!15926 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32365)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32365 (_ BitVec 32)) Bool)

(assert (=> b!502626 (= res!304076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502627 () Bool)

(declare-fun e!294385 () Bool)

(declare-fun e!294389 () Bool)

(assert (=> b!502627 (= e!294385 e!294389)))

(declare-fun res!304069 () Bool)

(assert (=> b!502627 (=> res!304069 e!294389)))

(declare-fun lt!228554 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3985 0))(
  ( (MissingZero!3985 (index!18128 (_ BitVec 32))) (Found!3985 (index!18129 (_ BitVec 32))) (Intermediate!3985 (undefined!4797 Bool) (index!18130 (_ BitVec 32)) (x!47303 (_ BitVec 32))) (Undefined!3985) (MissingVacant!3985 (index!18131 (_ BitVec 32))) )
))
(declare-fun lt!228553 () SeekEntryResult!3985)

(assert (=> b!502627 (= res!304069 (or (bvsgt (x!47303 lt!228553) #b01111111111111111111111111111110) (bvslt lt!228554 #b00000000000000000000000000000000) (bvsge lt!228554 (size!15926 a!3235)) (bvslt (index!18130 lt!228553) #b00000000000000000000000000000000) (bvsge (index!18130 lt!228553) (size!15926 a!3235)) (not (= lt!228553 (Intermediate!3985 false (index!18130 lt!228553) (x!47303 lt!228553))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502627 (= (index!18130 lt!228553) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15175 0))(
  ( (Unit!15176) )
))
(declare-fun lt!228559 () Unit!15175)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15175)

(assert (=> b!502627 (= lt!228559 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228554 #b00000000000000000000000000000000 (index!18130 lt!228553) (x!47303 lt!228553) mask!3524))))

(assert (=> b!502627 (and (or (= (select (arr!15562 a!3235) (index!18130 lt!228553)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15562 a!3235) (index!18130 lt!228553)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15562 a!3235) (index!18130 lt!228553)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15562 a!3235) (index!18130 lt!228553)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228555 () Unit!15175)

(declare-fun e!294386 () Unit!15175)

(assert (=> b!502627 (= lt!228555 e!294386)))

(declare-fun c!59558 () Bool)

(assert (=> b!502627 (= c!59558 (= (select (arr!15562 a!3235) (index!18130 lt!228553)) (select (arr!15562 a!3235) j!176)))))

(assert (=> b!502627 (and (bvslt (x!47303 lt!228553) #b01111111111111111111111111111110) (or (= (select (arr!15562 a!3235) (index!18130 lt!228553)) (select (arr!15562 a!3235) j!176)) (= (select (arr!15562 a!3235) (index!18130 lt!228553)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15562 a!3235) (index!18130 lt!228553)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!294387 () Bool)

(declare-fun b!502628 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32365 (_ BitVec 32)) SeekEntryResult!3985)

(assert (=> b!502628 (= e!294387 (= (seekEntryOrOpen!0 (select (arr!15562 a!3235) j!176) a!3235 mask!3524) (Found!3985 j!176)))))

(declare-fun b!502629 () Bool)

(declare-fun res!304079 () Bool)

(declare-fun e!294392 () Bool)

(assert (=> b!502629 (=> (not res!304079) (not e!294392))))

(declare-fun arrayContainsKey!0 (array!32365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502629 (= res!304079 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502630 () Bool)

(declare-fun Unit!15177 () Unit!15175)

(assert (=> b!502630 (= e!294386 Unit!15177)))

(declare-fun b!502631 () Bool)

(assert (=> b!502631 (= e!294388 (not e!294385))))

(declare-fun res!304070 () Bool)

(assert (=> b!502631 (=> res!304070 e!294385)))

(declare-fun lt!228557 () (_ BitVec 64))

(declare-fun lt!228552 () (_ BitVec 32))

(declare-fun lt!228549 () array!32365)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32365 (_ BitVec 32)) SeekEntryResult!3985)

(assert (=> b!502631 (= res!304070 (= lt!228553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228552 lt!228557 lt!228549 mask!3524)))))

(assert (=> b!502631 (= lt!228553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228554 (select (arr!15562 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502631 (= lt!228552 (toIndex!0 lt!228557 mask!3524))))

(assert (=> b!502631 (= lt!228557 (select (store (arr!15562 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502631 (= lt!228554 (toIndex!0 (select (arr!15562 a!3235) j!176) mask!3524))))

(assert (=> b!502631 (= lt!228549 (array!32366 (store (arr!15562 a!3235) i!1204 k0!2280) (size!15926 a!3235)))))

(assert (=> b!502631 e!294387))

(declare-fun res!304078 () Bool)

(assert (=> b!502631 (=> (not res!304078) (not e!294387))))

(assert (=> b!502631 (= res!304078 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228556 () Unit!15175)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15175)

(assert (=> b!502631 (= lt!228556 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502632 () Bool)

(declare-fun res!304077 () Bool)

(assert (=> b!502632 (=> (not res!304077) (not e!294392))))

(assert (=> b!502632 (= res!304077 (and (= (size!15926 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15926 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15926 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502633 () Bool)

(declare-fun res!304073 () Bool)

(assert (=> b!502633 (=> res!304073 e!294389)))

(declare-fun e!294393 () Bool)

(assert (=> b!502633 (= res!304073 e!294393)))

(declare-fun res!304067 () Bool)

(assert (=> b!502633 (=> (not res!304067) (not e!294393))))

(assert (=> b!502633 (= res!304067 (bvsgt #b00000000000000000000000000000000 (x!47303 lt!228553)))))

(declare-fun b!502634 () Bool)

(declare-fun e!294391 () Bool)

(assert (=> b!502634 (= e!294391 false)))

(declare-fun b!502635 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32365 (_ BitVec 32)) SeekEntryResult!3985)

(assert (=> b!502635 (= e!294393 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228554 (index!18130 lt!228553) (select (arr!15562 a!3235) j!176) a!3235 mask!3524) (Found!3985 j!176))))))

(declare-fun res!304072 () Bool)

(assert (=> start!45608 (=> (not res!304072) (not e!294392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45608 (= res!304072 (validMask!0 mask!3524))))

(assert (=> start!45608 e!294392))

(assert (=> start!45608 true))

(declare-fun array_inv!11421 (array!32365) Bool)

(assert (=> start!45608 (array_inv!11421 a!3235)))

(declare-fun b!502636 () Bool)

(declare-fun Unit!15178 () Unit!15175)

(assert (=> b!502636 (= e!294386 Unit!15178)))

(declare-fun lt!228558 () Unit!15175)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15175)

(assert (=> b!502636 (= lt!228558 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228554 #b00000000000000000000000000000000 (index!18130 lt!228553) (x!47303 lt!228553) mask!3524))))

(declare-fun res!304068 () Bool)

(assert (=> b!502636 (= res!304068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228554 lt!228557 lt!228549 mask!3524) (Intermediate!3985 false (index!18130 lt!228553) (x!47303 lt!228553))))))

(assert (=> b!502636 (=> (not res!304068) (not e!294391))))

(assert (=> b!502636 e!294391))

(declare-fun b!502637 () Bool)

(declare-fun res!304071 () Bool)

(assert (=> b!502637 (=> (not res!304071) (not e!294388))))

(declare-datatypes ((List!9627 0))(
  ( (Nil!9624) (Cons!9623 (h!10500 (_ BitVec 64)) (t!15847 List!9627)) )
))
(declare-fun arrayNoDuplicates!0 (array!32365 (_ BitVec 32) List!9627) Bool)

(assert (=> b!502637 (= res!304071 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9624))))

(declare-fun b!502638 () Bool)

(declare-fun res!304074 () Bool)

(assert (=> b!502638 (=> res!304074 e!294385)))

(get-info :version)

(assert (=> b!502638 (= res!304074 (or (undefined!4797 lt!228553) (not ((_ is Intermediate!3985) lt!228553))))))

(declare-fun b!502639 () Bool)

(assert (=> b!502639 (= e!294389 true)))

(declare-fun lt!228550 () SeekEntryResult!3985)

(assert (=> b!502639 (= lt!228550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228554 lt!228557 lt!228549 mask!3524))))

(declare-fun b!502640 () Bool)

(assert (=> b!502640 (= e!294392 e!294388)))

(declare-fun res!304080 () Bool)

(assert (=> b!502640 (=> (not res!304080) (not e!294388))))

(declare-fun lt!228551 () SeekEntryResult!3985)

(assert (=> b!502640 (= res!304080 (or (= lt!228551 (MissingZero!3985 i!1204)) (= lt!228551 (MissingVacant!3985 i!1204))))))

(assert (=> b!502640 (= lt!228551 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502641 () Bool)

(declare-fun res!304081 () Bool)

(assert (=> b!502641 (=> (not res!304081) (not e!294392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502641 (= res!304081 (validKeyInArray!0 k0!2280))))

(declare-fun b!502642 () Bool)

(declare-fun res!304075 () Bool)

(assert (=> b!502642 (=> (not res!304075) (not e!294392))))

(assert (=> b!502642 (= res!304075 (validKeyInArray!0 (select (arr!15562 a!3235) j!176)))))

(assert (= (and start!45608 res!304072) b!502632))

(assert (= (and b!502632 res!304077) b!502642))

(assert (= (and b!502642 res!304075) b!502641))

(assert (= (and b!502641 res!304081) b!502629))

(assert (= (and b!502629 res!304079) b!502640))

(assert (= (and b!502640 res!304080) b!502626))

(assert (= (and b!502626 res!304076) b!502637))

(assert (= (and b!502637 res!304071) b!502631))

(assert (= (and b!502631 res!304078) b!502628))

(assert (= (and b!502631 (not res!304070)) b!502638))

(assert (= (and b!502638 (not res!304074)) b!502627))

(assert (= (and b!502627 c!59558) b!502636))

(assert (= (and b!502627 (not c!59558)) b!502630))

(assert (= (and b!502636 res!304068) b!502634))

(assert (= (and b!502627 (not res!304069)) b!502633))

(assert (= (and b!502633 res!304067) b!502635))

(assert (= (and b!502633 (not res!304073)) b!502639))

(declare-fun m!483781 () Bool)

(assert (=> b!502641 m!483781))

(declare-fun m!483783 () Bool)

(assert (=> b!502631 m!483783))

(declare-fun m!483785 () Bool)

(assert (=> b!502631 m!483785))

(declare-fun m!483787 () Bool)

(assert (=> b!502631 m!483787))

(declare-fun m!483789 () Bool)

(assert (=> b!502631 m!483789))

(declare-fun m!483791 () Bool)

(assert (=> b!502631 m!483791))

(declare-fun m!483793 () Bool)

(assert (=> b!502631 m!483793))

(assert (=> b!502631 m!483783))

(declare-fun m!483795 () Bool)

(assert (=> b!502631 m!483795))

(assert (=> b!502631 m!483783))

(declare-fun m!483797 () Bool)

(assert (=> b!502631 m!483797))

(declare-fun m!483799 () Bool)

(assert (=> b!502631 m!483799))

(declare-fun m!483801 () Bool)

(assert (=> b!502626 m!483801))

(assert (=> b!502635 m!483783))

(assert (=> b!502635 m!483783))

(declare-fun m!483803 () Bool)

(assert (=> b!502635 m!483803))

(declare-fun m!483805 () Bool)

(assert (=> b!502639 m!483805))

(declare-fun m!483807 () Bool)

(assert (=> b!502637 m!483807))

(declare-fun m!483809 () Bool)

(assert (=> b!502629 m!483809))

(assert (=> b!502628 m!483783))

(assert (=> b!502628 m!483783))

(declare-fun m!483811 () Bool)

(assert (=> b!502628 m!483811))

(declare-fun m!483813 () Bool)

(assert (=> b!502636 m!483813))

(assert (=> b!502636 m!483805))

(declare-fun m!483815 () Bool)

(assert (=> b!502640 m!483815))

(assert (=> b!502642 m!483783))

(assert (=> b!502642 m!483783))

(declare-fun m!483817 () Bool)

(assert (=> b!502642 m!483817))

(declare-fun m!483819 () Bool)

(assert (=> b!502627 m!483819))

(declare-fun m!483821 () Bool)

(assert (=> b!502627 m!483821))

(assert (=> b!502627 m!483783))

(declare-fun m!483823 () Bool)

(assert (=> start!45608 m!483823))

(declare-fun m!483825 () Bool)

(assert (=> start!45608 m!483825))

(check-sat (not b!502642) (not start!45608) (not b!502631) (not b!502635) (not b!502628) (not b!502626) (not b!502627) (not b!502639) (not b!502636) (not b!502629) (not b!502640) (not b!502641) (not b!502637))
(check-sat)
