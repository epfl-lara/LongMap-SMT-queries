; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45620 () Bool)

(assert start!45620)

(declare-fun b!502738 () Bool)

(declare-fun e!294457 () Bool)

(declare-fun e!294458 () Bool)

(assert (=> b!502738 (= e!294457 e!294458)))

(declare-fun res!304124 () Bool)

(assert (=> b!502738 (=> (not res!304124) (not e!294458))))

(declare-datatypes ((SeekEntryResult!4035 0))(
  ( (MissingZero!4035 (index!18328 (_ BitVec 32))) (Found!4035 (index!18329 (_ BitVec 32))) (Intermediate!4035 (undefined!4847 Bool) (index!18330 (_ BitVec 32)) (x!47356 (_ BitVec 32))) (Undefined!4035) (MissingVacant!4035 (index!18331 (_ BitVec 32))) )
))
(declare-fun lt!228580 () SeekEntryResult!4035)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502738 (= res!304124 (or (= lt!228580 (MissingZero!4035 i!1204)) (= lt!228580 (MissingVacant!4035 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32376 0))(
  ( (array!32377 (arr!15568 (Array (_ BitVec 32) (_ BitVec 64))) (size!15932 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32376)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32376 (_ BitVec 32)) SeekEntryResult!4035)

(assert (=> b!502738 (= lt!228580 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502739 () Bool)

(declare-fun res!304119 () Bool)

(declare-fun e!294452 () Bool)

(assert (=> b!502739 (=> res!304119 e!294452)))

(declare-fun e!294455 () Bool)

(assert (=> b!502739 (= res!304119 e!294455)))

(declare-fun res!304126 () Bool)

(assert (=> b!502739 (=> (not res!304126) (not e!294455))))

(declare-fun lt!228574 () SeekEntryResult!4035)

(assert (=> b!502739 (= res!304126 (bvsgt #b00000000000000000000000000000000 (x!47356 lt!228574)))))

(declare-fun b!502740 () Bool)

(declare-fun res!304133 () Bool)

(assert (=> b!502740 (=> (not res!304133) (not e!294457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502740 (= res!304133 (validKeyInArray!0 k0!2280))))

(declare-fun b!502741 () Bool)

(declare-fun res!304131 () Bool)

(assert (=> b!502741 (=> (not res!304131) (not e!294458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32376 (_ BitVec 32)) Bool)

(assert (=> b!502741 (= res!304131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502742 () Bool)

(declare-fun res!304128 () Bool)

(assert (=> b!502742 (=> (not res!304128) (not e!294457))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!502742 (= res!304128 (validKeyInArray!0 (select (arr!15568 a!3235) j!176)))))

(declare-fun b!502743 () Bool)

(declare-fun res!304121 () Bool)

(assert (=> b!502743 (=> (not res!304121) (not e!294457))))

(declare-fun arrayContainsKey!0 (array!32376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502743 (= res!304121 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!304123 () Bool)

(assert (=> start!45620 (=> (not res!304123) (not e!294457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45620 (= res!304123 (validMask!0 mask!3524))))

(assert (=> start!45620 e!294457))

(assert (=> start!45620 true))

(declare-fun array_inv!11364 (array!32376) Bool)

(assert (=> start!45620 (array_inv!11364 a!3235)))

(declare-fun b!502744 () Bool)

(declare-fun res!304127 () Bool)

(assert (=> b!502744 (=> (not res!304127) (not e!294458))))

(declare-datatypes ((List!9726 0))(
  ( (Nil!9723) (Cons!9722 (h!10599 (_ BitVec 64)) (t!15954 List!9726)) )
))
(declare-fun arrayNoDuplicates!0 (array!32376 (_ BitVec 32) List!9726) Bool)

(assert (=> b!502744 (= res!304127 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9723))))

(declare-fun b!502745 () Bool)

(declare-fun res!304120 () Bool)

(declare-fun e!294454 () Bool)

(assert (=> b!502745 (=> res!304120 e!294454)))

(get-info :version)

(assert (=> b!502745 (= res!304120 (or (undefined!4847 lt!228574) (not ((_ is Intermediate!4035) lt!228574))))))

(declare-fun b!502746 () Bool)

(assert (=> b!502746 (= e!294454 e!294452)))

(declare-fun res!304122 () Bool)

(assert (=> b!502746 (=> res!304122 e!294452)))

(declare-fun lt!228571 () (_ BitVec 32))

(assert (=> b!502746 (= res!304122 (or (bvsgt (x!47356 lt!228574) #b01111111111111111111111111111110) (bvslt lt!228571 #b00000000000000000000000000000000) (bvsge lt!228571 (size!15932 a!3235)) (bvslt (index!18330 lt!228574) #b00000000000000000000000000000000) (bvsge (index!18330 lt!228574) (size!15932 a!3235)) (not (= lt!228574 (Intermediate!4035 false (index!18330 lt!228574) (x!47356 lt!228574))))))))

(assert (=> b!502746 (= (index!18330 lt!228574) i!1204)))

(declare-datatypes ((Unit!15216 0))(
  ( (Unit!15217) )
))
(declare-fun lt!228570 () Unit!15216)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32376 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15216)

(assert (=> b!502746 (= lt!228570 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228571 #b00000000000000000000000000000000 (index!18330 lt!228574) (x!47356 lt!228574) mask!3524))))

(assert (=> b!502746 (and (or (= (select (arr!15568 a!3235) (index!18330 lt!228574)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15568 a!3235) (index!18330 lt!228574)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15568 a!3235) (index!18330 lt!228574)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15568 a!3235) (index!18330 lt!228574)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228578 () Unit!15216)

(declare-fun e!294459 () Unit!15216)

(assert (=> b!502746 (= lt!228578 e!294459)))

(declare-fun c!59588 () Bool)

(assert (=> b!502746 (= c!59588 (= (select (arr!15568 a!3235) (index!18330 lt!228574)) (select (arr!15568 a!3235) j!176)))))

(assert (=> b!502746 (and (bvslt (x!47356 lt!228574) #b01111111111111111111111111111110) (or (= (select (arr!15568 a!3235) (index!18330 lt!228574)) (select (arr!15568 a!3235) j!176)) (= (select (arr!15568 a!3235) (index!18330 lt!228574)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15568 a!3235) (index!18330 lt!228574)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502747 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32376 (_ BitVec 32)) SeekEntryResult!4035)

(assert (=> b!502747 (= e!294455 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228571 (index!18330 lt!228574) (select (arr!15568 a!3235) j!176) a!3235 mask!3524) (Found!4035 j!176))))))

(declare-fun b!502748 () Bool)

(declare-fun Unit!15218 () Unit!15216)

(assert (=> b!502748 (= e!294459 Unit!15218)))

(declare-fun b!502749 () Bool)

(declare-fun e!294453 () Bool)

(assert (=> b!502749 (= e!294453 false)))

(declare-fun b!502750 () Bool)

(declare-fun Unit!15219 () Unit!15216)

(assert (=> b!502750 (= e!294459 Unit!15219)))

(declare-fun lt!228577 () Unit!15216)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32376 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15216)

(assert (=> b!502750 (= lt!228577 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228571 #b00000000000000000000000000000000 (index!18330 lt!228574) (x!47356 lt!228574) mask!3524))))

(declare-fun lt!228573 () array!32376)

(declare-fun lt!228579 () (_ BitVec 64))

(declare-fun res!304125 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32376 (_ BitVec 32)) SeekEntryResult!4035)

(assert (=> b!502750 (= res!304125 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228571 lt!228579 lt!228573 mask!3524) (Intermediate!4035 false (index!18330 lt!228574) (x!47356 lt!228574))))))

(assert (=> b!502750 (=> (not res!304125) (not e!294453))))

(assert (=> b!502750 e!294453))

(declare-fun e!294451 () Bool)

(declare-fun b!502751 () Bool)

(assert (=> b!502751 (= e!294451 (= (seekEntryOrOpen!0 (select (arr!15568 a!3235) j!176) a!3235 mask!3524) (Found!4035 j!176)))))

(declare-fun b!502752 () Bool)

(assert (=> b!502752 (= e!294458 (not e!294454))))

(declare-fun res!304132 () Bool)

(assert (=> b!502752 (=> res!304132 e!294454)))

(declare-fun lt!228575 () (_ BitVec 32))

(assert (=> b!502752 (= res!304132 (= lt!228574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228575 lt!228579 lt!228573 mask!3524)))))

(assert (=> b!502752 (= lt!228574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228571 (select (arr!15568 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502752 (= lt!228575 (toIndex!0 lt!228579 mask!3524))))

(assert (=> b!502752 (= lt!228579 (select (store (arr!15568 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502752 (= lt!228571 (toIndex!0 (select (arr!15568 a!3235) j!176) mask!3524))))

(assert (=> b!502752 (= lt!228573 (array!32377 (store (arr!15568 a!3235) i!1204 k0!2280) (size!15932 a!3235)))))

(assert (=> b!502752 e!294451))

(declare-fun res!304129 () Bool)

(assert (=> b!502752 (=> (not res!304129) (not e!294451))))

(assert (=> b!502752 (= res!304129 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228572 () Unit!15216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15216)

(assert (=> b!502752 (= lt!228572 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502753 () Bool)

(assert (=> b!502753 (= e!294452 true)))

(declare-fun lt!228576 () SeekEntryResult!4035)

(assert (=> b!502753 (= lt!228576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228571 lt!228579 lt!228573 mask!3524))))

(declare-fun b!502754 () Bool)

(declare-fun res!304130 () Bool)

(assert (=> b!502754 (=> (not res!304130) (not e!294457))))

(assert (=> b!502754 (= res!304130 (and (= (size!15932 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15932 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15932 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45620 res!304123) b!502754))

(assert (= (and b!502754 res!304130) b!502742))

(assert (= (and b!502742 res!304128) b!502740))

(assert (= (and b!502740 res!304133) b!502743))

(assert (= (and b!502743 res!304121) b!502738))

(assert (= (and b!502738 res!304124) b!502741))

(assert (= (and b!502741 res!304131) b!502744))

(assert (= (and b!502744 res!304127) b!502752))

(assert (= (and b!502752 res!304129) b!502751))

(assert (= (and b!502752 (not res!304132)) b!502745))

(assert (= (and b!502745 (not res!304120)) b!502746))

(assert (= (and b!502746 c!59588) b!502750))

(assert (= (and b!502746 (not c!59588)) b!502748))

(assert (= (and b!502750 res!304125) b!502749))

(assert (= (and b!502746 (not res!304122)) b!502739))

(assert (= (and b!502739 res!304126) b!502747))

(assert (= (and b!502739 (not res!304119)) b!502753))

(declare-fun m!483643 () Bool)

(assert (=> b!502743 m!483643))

(declare-fun m!483645 () Bool)

(assert (=> b!502750 m!483645))

(declare-fun m!483647 () Bool)

(assert (=> b!502750 m!483647))

(declare-fun m!483649 () Bool)

(assert (=> b!502747 m!483649))

(assert (=> b!502747 m!483649))

(declare-fun m!483651 () Bool)

(assert (=> b!502747 m!483651))

(assert (=> b!502742 m!483649))

(assert (=> b!502742 m!483649))

(declare-fun m!483653 () Bool)

(assert (=> b!502742 m!483653))

(declare-fun m!483655 () Bool)

(assert (=> b!502741 m!483655))

(declare-fun m!483657 () Bool)

(assert (=> b!502740 m!483657))

(declare-fun m!483659 () Bool)

(assert (=> b!502752 m!483659))

(declare-fun m!483661 () Bool)

(assert (=> b!502752 m!483661))

(declare-fun m!483663 () Bool)

(assert (=> b!502752 m!483663))

(declare-fun m!483665 () Bool)

(assert (=> b!502752 m!483665))

(assert (=> b!502752 m!483649))

(declare-fun m!483667 () Bool)

(assert (=> b!502752 m!483667))

(assert (=> b!502752 m!483649))

(declare-fun m!483669 () Bool)

(assert (=> b!502752 m!483669))

(assert (=> b!502752 m!483649))

(declare-fun m!483671 () Bool)

(assert (=> b!502752 m!483671))

(declare-fun m!483673 () Bool)

(assert (=> b!502752 m!483673))

(declare-fun m!483675 () Bool)

(assert (=> start!45620 m!483675))

(declare-fun m!483677 () Bool)

(assert (=> start!45620 m!483677))

(declare-fun m!483679 () Bool)

(assert (=> b!502738 m!483679))

(declare-fun m!483681 () Bool)

(assert (=> b!502746 m!483681))

(declare-fun m!483683 () Bool)

(assert (=> b!502746 m!483683))

(assert (=> b!502746 m!483649))

(assert (=> b!502753 m!483647))

(assert (=> b!502751 m!483649))

(assert (=> b!502751 m!483649))

(declare-fun m!483685 () Bool)

(assert (=> b!502751 m!483685))

(declare-fun m!483687 () Bool)

(assert (=> b!502744 m!483687))

(check-sat (not b!502750) (not b!502751) (not start!45620) (not b!502738) (not b!502747) (not b!502743) (not b!502741) (not b!502752) (not b!502753) (not b!502740) (not b!502746) (not b!502742) (not b!502744))
(check-sat)
