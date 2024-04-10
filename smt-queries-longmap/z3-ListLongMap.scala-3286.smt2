; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45662 () Bool)

(assert start!45662)

(declare-fun b!503809 () Bool)

(declare-fun res!305070 () Bool)

(declare-fun e!295018 () Bool)

(assert (=> b!503809 (=> res!305070 e!295018)))

(declare-fun e!295023 () Bool)

(assert (=> b!503809 (= res!305070 e!295023)))

(declare-fun res!305077 () Bool)

(assert (=> b!503809 (=> (not res!305077) (not e!295023))))

(declare-datatypes ((SeekEntryResult!4056 0))(
  ( (MissingZero!4056 (index!18412 (_ BitVec 32))) (Found!4056 (index!18413 (_ BitVec 32))) (Intermediate!4056 (undefined!4868 Bool) (index!18414 (_ BitVec 32)) (x!47433 (_ BitVec 32))) (Undefined!4056) (MissingVacant!4056 (index!18415 (_ BitVec 32))) )
))
(declare-fun lt!229263 () SeekEntryResult!4056)

(assert (=> b!503809 (= res!305077 (bvsgt #b00000000000000000000000000000000 (x!47433 lt!229263)))))

(declare-fun lt!229269 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32418 0))(
  ( (array!32419 (arr!15589 (Array (_ BitVec 32) (_ BitVec 64))) (size!15953 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32418)

(declare-fun b!503810 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32418 (_ BitVec 32)) SeekEntryResult!4056)

(assert (=> b!503810 (= e!295023 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229269 (index!18414 lt!229263) (select (arr!15589 a!3235) j!176) a!3235 mask!3524) (Found!4056 j!176))))))

(declare-fun b!503811 () Bool)

(declare-fun e!295022 () Bool)

(declare-fun e!295019 () Bool)

(assert (=> b!503811 (= e!295022 (not e!295019))))

(declare-fun res!305064 () Bool)

(assert (=> b!503811 (=> res!305064 e!295019)))

(declare-fun lt!229268 () array!32418)

(declare-fun lt!229264 () (_ BitVec 64))

(declare-fun lt!229273 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32418 (_ BitVec 32)) SeekEntryResult!4056)

(assert (=> b!503811 (= res!305064 (= lt!229263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229273 lt!229264 lt!229268 mask!3524)))))

(assert (=> b!503811 (= lt!229263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229269 (select (arr!15589 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503811 (= lt!229273 (toIndex!0 lt!229264 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503811 (= lt!229264 (select (store (arr!15589 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503811 (= lt!229269 (toIndex!0 (select (arr!15589 a!3235) j!176) mask!3524))))

(assert (=> b!503811 (= lt!229268 (array!32419 (store (arr!15589 a!3235) i!1204 k0!2280) (size!15953 a!3235)))))

(declare-fun e!295025 () Bool)

(assert (=> b!503811 e!295025))

(declare-fun res!305073 () Bool)

(assert (=> b!503811 (=> (not res!305073) (not e!295025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32418 (_ BitVec 32)) Bool)

(assert (=> b!503811 (= res!305073 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15300 0))(
  ( (Unit!15301) )
))
(declare-fun lt!229271 () Unit!15300)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15300)

(assert (=> b!503811 (= lt!229271 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503812 () Bool)

(declare-fun res!305065 () Bool)

(declare-fun e!295024 () Bool)

(assert (=> b!503812 (=> (not res!305065) (not e!295024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503812 (= res!305065 (validKeyInArray!0 (select (arr!15589 a!3235) j!176)))))

(declare-fun b!503813 () Bool)

(assert (=> b!503813 (= e!295019 e!295018)))

(declare-fun res!305067 () Bool)

(assert (=> b!503813 (=> res!305067 e!295018)))

(assert (=> b!503813 (= res!305067 (or (bvsgt (x!47433 lt!229263) #b01111111111111111111111111111110) (bvslt lt!229269 #b00000000000000000000000000000000) (bvsge lt!229269 (size!15953 a!3235)) (bvslt (index!18414 lt!229263) #b00000000000000000000000000000000) (bvsge (index!18414 lt!229263) (size!15953 a!3235)) (not (= lt!229263 (Intermediate!4056 false (index!18414 lt!229263) (x!47433 lt!229263))))))))

(assert (=> b!503813 (= (index!18414 lt!229263) i!1204)))

(declare-fun lt!229267 () Unit!15300)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32418 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15300)

(assert (=> b!503813 (= lt!229267 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229269 #b00000000000000000000000000000000 (index!18414 lt!229263) (x!47433 lt!229263) mask!3524))))

(assert (=> b!503813 (and (or (= (select (arr!15589 a!3235) (index!18414 lt!229263)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15589 a!3235) (index!18414 lt!229263)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15589 a!3235) (index!18414 lt!229263)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15589 a!3235) (index!18414 lt!229263)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229272 () Unit!15300)

(declare-fun e!295026 () Unit!15300)

(assert (=> b!503813 (= lt!229272 e!295026)))

(declare-fun c!59651 () Bool)

(assert (=> b!503813 (= c!59651 (= (select (arr!15589 a!3235) (index!18414 lt!229263)) (select (arr!15589 a!3235) j!176)))))

(assert (=> b!503813 (and (bvslt (x!47433 lt!229263) #b01111111111111111111111111111110) (or (= (select (arr!15589 a!3235) (index!18414 lt!229263)) (select (arr!15589 a!3235) j!176)) (= (select (arr!15589 a!3235) (index!18414 lt!229263)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15589 a!3235) (index!18414 lt!229263)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503814 () Bool)

(assert (=> b!503814 (= e!295024 e!295022)))

(declare-fun res!305074 () Bool)

(assert (=> b!503814 (=> (not res!305074) (not e!295022))))

(declare-fun lt!229270 () SeekEntryResult!4056)

(assert (=> b!503814 (= res!305074 (or (= lt!229270 (MissingZero!4056 i!1204)) (= lt!229270 (MissingVacant!4056 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32418 (_ BitVec 32)) SeekEntryResult!4056)

(assert (=> b!503814 (= lt!229270 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503815 () Bool)

(assert (=> b!503815 (= e!295025 (= (seekEntryOrOpen!0 (select (arr!15589 a!3235) j!176) a!3235 mask!3524) (Found!4056 j!176)))))

(declare-fun res!305072 () Bool)

(assert (=> start!45662 (=> (not res!305072) (not e!295024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45662 (= res!305072 (validMask!0 mask!3524))))

(assert (=> start!45662 e!295024))

(assert (=> start!45662 true))

(declare-fun array_inv!11385 (array!32418) Bool)

(assert (=> start!45662 (array_inv!11385 a!3235)))

(declare-fun b!503816 () Bool)

(declare-fun res!305069 () Bool)

(assert (=> b!503816 (=> (not res!305069) (not e!295022))))

(assert (=> b!503816 (= res!305069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503817 () Bool)

(declare-fun res!305071 () Bool)

(assert (=> b!503817 (=> (not res!305071) (not e!295024))))

(assert (=> b!503817 (= res!305071 (validKeyInArray!0 k0!2280))))

(declare-fun b!503818 () Bool)

(declare-fun e!295021 () Bool)

(assert (=> b!503818 (= e!295021 false)))

(declare-fun b!503819 () Bool)

(declare-fun Unit!15302 () Unit!15300)

(assert (=> b!503819 (= e!295026 Unit!15302)))

(declare-fun lt!229265 () Unit!15300)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32418 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15300)

(assert (=> b!503819 (= lt!229265 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229269 #b00000000000000000000000000000000 (index!18414 lt!229263) (x!47433 lt!229263) mask!3524))))

(declare-fun res!305076 () Bool)

(assert (=> b!503819 (= res!305076 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229269 lt!229264 lt!229268 mask!3524) (Intermediate!4056 false (index!18414 lt!229263) (x!47433 lt!229263))))))

(assert (=> b!503819 (=> (not res!305076) (not e!295021))))

(assert (=> b!503819 e!295021))

(declare-fun b!503820 () Bool)

(assert (=> b!503820 (= e!295018 true)))

(declare-fun lt!229266 () SeekEntryResult!4056)

(assert (=> b!503820 (= lt!229266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229269 lt!229264 lt!229268 mask!3524))))

(declare-fun b!503821 () Bool)

(declare-fun Unit!15303 () Unit!15300)

(assert (=> b!503821 (= e!295026 Unit!15303)))

(declare-fun b!503822 () Bool)

(declare-fun res!305068 () Bool)

(assert (=> b!503822 (=> (not res!305068) (not e!295024))))

(declare-fun arrayContainsKey!0 (array!32418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503822 (= res!305068 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503823 () Bool)

(declare-fun res!305066 () Bool)

(assert (=> b!503823 (=> (not res!305066) (not e!295024))))

(assert (=> b!503823 (= res!305066 (and (= (size!15953 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15953 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15953 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503824 () Bool)

(declare-fun res!305078 () Bool)

(assert (=> b!503824 (=> (not res!305078) (not e!295022))))

(declare-datatypes ((List!9747 0))(
  ( (Nil!9744) (Cons!9743 (h!10620 (_ BitVec 64)) (t!15975 List!9747)) )
))
(declare-fun arrayNoDuplicates!0 (array!32418 (_ BitVec 32) List!9747) Bool)

(assert (=> b!503824 (= res!305078 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9744))))

(declare-fun b!503825 () Bool)

(declare-fun res!305075 () Bool)

(assert (=> b!503825 (=> res!305075 e!295019)))

(get-info :version)

(assert (=> b!503825 (= res!305075 (or (undefined!4868 lt!229263) (not ((_ is Intermediate!4056) lt!229263))))))

(assert (= (and start!45662 res!305072) b!503823))

(assert (= (and b!503823 res!305066) b!503812))

(assert (= (and b!503812 res!305065) b!503817))

(assert (= (and b!503817 res!305071) b!503822))

(assert (= (and b!503822 res!305068) b!503814))

(assert (= (and b!503814 res!305074) b!503816))

(assert (= (and b!503816 res!305069) b!503824))

(assert (= (and b!503824 res!305078) b!503811))

(assert (= (and b!503811 res!305073) b!503815))

(assert (= (and b!503811 (not res!305064)) b!503825))

(assert (= (and b!503825 (not res!305075)) b!503813))

(assert (= (and b!503813 c!59651) b!503819))

(assert (= (and b!503813 (not c!59651)) b!503821))

(assert (= (and b!503819 res!305076) b!503818))

(assert (= (and b!503813 (not res!305067)) b!503809))

(assert (= (and b!503809 res!305077) b!503810))

(assert (= (and b!503809 (not res!305070)) b!503820))

(declare-fun m!484609 () Bool)

(assert (=> b!503817 m!484609))

(declare-fun m!484611 () Bool)

(assert (=> b!503812 m!484611))

(assert (=> b!503812 m!484611))

(declare-fun m!484613 () Bool)

(assert (=> b!503812 m!484613))

(declare-fun m!484615 () Bool)

(assert (=> b!503822 m!484615))

(declare-fun m!484617 () Bool)

(assert (=> b!503824 m!484617))

(declare-fun m!484619 () Bool)

(assert (=> b!503811 m!484619))

(declare-fun m!484621 () Bool)

(assert (=> b!503811 m!484621))

(declare-fun m!484623 () Bool)

(assert (=> b!503811 m!484623))

(declare-fun m!484625 () Bool)

(assert (=> b!503811 m!484625))

(assert (=> b!503811 m!484611))

(declare-fun m!484627 () Bool)

(assert (=> b!503811 m!484627))

(declare-fun m!484629 () Bool)

(assert (=> b!503811 m!484629))

(declare-fun m!484631 () Bool)

(assert (=> b!503811 m!484631))

(assert (=> b!503811 m!484611))

(declare-fun m!484633 () Bool)

(assert (=> b!503811 m!484633))

(assert (=> b!503811 m!484611))

(declare-fun m!484635 () Bool)

(assert (=> b!503820 m!484635))

(declare-fun m!484637 () Bool)

(assert (=> b!503816 m!484637))

(assert (=> b!503810 m!484611))

(assert (=> b!503810 m!484611))

(declare-fun m!484639 () Bool)

(assert (=> b!503810 m!484639))

(declare-fun m!484641 () Bool)

(assert (=> b!503813 m!484641))

(declare-fun m!484643 () Bool)

(assert (=> b!503813 m!484643))

(assert (=> b!503813 m!484611))

(assert (=> b!503815 m!484611))

(assert (=> b!503815 m!484611))

(declare-fun m!484645 () Bool)

(assert (=> b!503815 m!484645))

(declare-fun m!484647 () Bool)

(assert (=> b!503819 m!484647))

(assert (=> b!503819 m!484635))

(declare-fun m!484649 () Bool)

(assert (=> start!45662 m!484649))

(declare-fun m!484651 () Bool)

(assert (=> start!45662 m!484651))

(declare-fun m!484653 () Bool)

(assert (=> b!503814 m!484653))

(check-sat (not b!503819) (not b!503813) (not b!503815) (not b!503812) (not b!503824) (not b!503814) (not b!503816) (not b!503817) (not b!503822) (not start!45662) (not b!503810) (not b!503811) (not b!503820))
(check-sat)
