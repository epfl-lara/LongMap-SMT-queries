; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48108 () Bool)

(assert start!48108)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!308616 () Bool)

(declare-datatypes ((array!33554 0))(
  ( (array!33555 (arr!16124 (Array (_ BitVec 32) (_ BitVec 64))) (size!16489 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33554)

(declare-fun b!529668 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4588 0))(
  ( (MissingZero!4588 (index!20576 (_ BitVec 32))) (Found!4588 (index!20577 (_ BitVec 32))) (Intermediate!4588 (undefined!5400 Bool) (index!20578 (_ BitVec 32)) (x!49557 (_ BitVec 32))) (Undefined!4588) (MissingVacant!4588 (index!20579 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33554 (_ BitVec 32)) SeekEntryResult!4588)

(assert (=> b!529668 (= e!308616 (= (seekEntryOrOpen!0 (select (arr!16124 a!3235) j!176) a!3235 mask!3524) (Found!4588 j!176)))))

(declare-fun b!529669 () Bool)

(declare-fun res!325522 () Bool)

(declare-fun e!308615 () Bool)

(assert (=> b!529669 (=> (not res!325522) (not e!308615))))

(declare-datatypes ((List!10321 0))(
  ( (Nil!10318) (Cons!10317 (h!11257 (_ BitVec 64)) (t!16540 List!10321)) )
))
(declare-fun arrayNoDuplicates!0 (array!33554 (_ BitVec 32) List!10321) Bool)

(assert (=> b!529669 (= res!325522 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10318))))

(declare-fun b!529670 () Bool)

(declare-fun e!308618 () Bool)

(assert (=> b!529670 (= e!308618 e!308615)))

(declare-fun res!325516 () Bool)

(assert (=> b!529670 (=> (not res!325516) (not e!308615))))

(declare-fun lt!244142 () SeekEntryResult!4588)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529670 (= res!325516 (or (= lt!244142 (MissingZero!4588 i!1204)) (= lt!244142 (MissingVacant!4588 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!529670 (= lt!244142 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529671 () Bool)

(declare-fun res!325518 () Bool)

(assert (=> b!529671 (=> (not res!325518) (not e!308618))))

(assert (=> b!529671 (= res!325518 (and (= (size!16489 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16489 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16489 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529672 () Bool)

(declare-fun res!325520 () Bool)

(assert (=> b!529672 (=> (not res!325520) (not e!308618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529672 (= res!325520 (validKeyInArray!0 k0!2280))))

(declare-fun b!529673 () Bool)

(declare-fun e!308619 () Bool)

(declare-fun e!308614 () Bool)

(assert (=> b!529673 (= e!308619 e!308614)))

(declare-fun res!325521 () Bool)

(assert (=> b!529673 (=> res!325521 e!308614)))

(declare-fun lt!244143 () Bool)

(declare-fun lt!244140 () SeekEntryResult!4588)

(assert (=> b!529673 (= res!325521 (or (and (not lt!244143) (undefined!5400 lt!244140)) (and (not lt!244143) (not (undefined!5400 lt!244140)))))))

(get-info :version)

(assert (=> b!529673 (= lt!244143 (not ((_ is Intermediate!4588) lt!244140)))))

(declare-fun b!529674 () Bool)

(assert (=> b!529674 (= e!308615 (not e!308619))))

(declare-fun res!325526 () Bool)

(assert (=> b!529674 (=> res!325526 e!308619)))

(declare-fun lt!244137 () (_ BitVec 64))

(declare-fun lt!244144 () array!33554)

(declare-fun lt!244138 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33554 (_ BitVec 32)) SeekEntryResult!4588)

(assert (=> b!529674 (= res!325526 (= lt!244140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244138 lt!244137 lt!244144 mask!3524)))))

(declare-fun lt!244136 () (_ BitVec 32))

(assert (=> b!529674 (= lt!244140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244136 (select (arr!16124 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529674 (= lt!244138 (toIndex!0 lt!244137 mask!3524))))

(assert (=> b!529674 (= lt!244137 (select (store (arr!16124 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529674 (= lt!244136 (toIndex!0 (select (arr!16124 a!3235) j!176) mask!3524))))

(assert (=> b!529674 (= lt!244144 (array!33555 (store (arr!16124 a!3235) i!1204 k0!2280) (size!16489 a!3235)))))

(assert (=> b!529674 e!308616))

(declare-fun res!325525 () Bool)

(assert (=> b!529674 (=> (not res!325525) (not e!308616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33554 (_ BitVec 32)) Bool)

(assert (=> b!529674 (= res!325525 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16774 0))(
  ( (Unit!16775) )
))
(declare-fun lt!244139 () Unit!16774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16774)

(assert (=> b!529674 (= lt!244139 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529675 () Bool)

(declare-fun res!325519 () Bool)

(assert (=> b!529675 (=> (not res!325519) (not e!308615))))

(assert (=> b!529675 (= res!325519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!325523 () Bool)

(assert (=> start!48108 (=> (not res!325523) (not e!308618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48108 (= res!325523 (validMask!0 mask!3524))))

(assert (=> start!48108 e!308618))

(assert (=> start!48108 true))

(declare-fun array_inv!12007 (array!33554) Bool)

(assert (=> start!48108 (array_inv!12007 a!3235)))

(declare-fun b!529676 () Bool)

(assert (=> b!529676 (= e!308614 true)))

(declare-fun lt!244141 () SeekEntryResult!4588)

(assert (=> b!529676 (= lt!244141 (seekEntryOrOpen!0 lt!244137 lt!244144 mask!3524))))

(assert (=> b!529676 false))

(declare-fun b!529677 () Bool)

(declare-fun res!325524 () Bool)

(assert (=> b!529677 (=> (not res!325524) (not e!308618))))

(assert (=> b!529677 (= res!325524 (validKeyInArray!0 (select (arr!16124 a!3235) j!176)))))

(declare-fun b!529678 () Bool)

(declare-fun res!325517 () Bool)

(assert (=> b!529678 (=> (not res!325517) (not e!308618))))

(declare-fun arrayContainsKey!0 (array!33554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529678 (= res!325517 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!48108 res!325523) b!529671))

(assert (= (and b!529671 res!325518) b!529677))

(assert (= (and b!529677 res!325524) b!529672))

(assert (= (and b!529672 res!325520) b!529678))

(assert (= (and b!529678 res!325517) b!529670))

(assert (= (and b!529670 res!325516) b!529675))

(assert (= (and b!529675 res!325519) b!529669))

(assert (= (and b!529669 res!325522) b!529674))

(assert (= (and b!529674 res!325525) b!529668))

(assert (= (and b!529674 (not res!325526)) b!529673))

(assert (= (and b!529673 (not res!325521)) b!529676))

(declare-fun m!509695 () Bool)

(assert (=> b!529669 m!509695))

(declare-fun m!509697 () Bool)

(assert (=> b!529674 m!509697))

(declare-fun m!509699 () Bool)

(assert (=> b!529674 m!509699))

(declare-fun m!509701 () Bool)

(assert (=> b!529674 m!509701))

(declare-fun m!509703 () Bool)

(assert (=> b!529674 m!509703))

(declare-fun m!509705 () Bool)

(assert (=> b!529674 m!509705))

(declare-fun m!509707 () Bool)

(assert (=> b!529674 m!509707))

(assert (=> b!529674 m!509703))

(declare-fun m!509709 () Bool)

(assert (=> b!529674 m!509709))

(assert (=> b!529674 m!509703))

(declare-fun m!509711 () Bool)

(assert (=> b!529674 m!509711))

(declare-fun m!509713 () Bool)

(assert (=> b!529674 m!509713))

(declare-fun m!509715 () Bool)

(assert (=> b!529676 m!509715))

(declare-fun m!509717 () Bool)

(assert (=> b!529670 m!509717))

(declare-fun m!509719 () Bool)

(assert (=> start!48108 m!509719))

(declare-fun m!509721 () Bool)

(assert (=> start!48108 m!509721))

(declare-fun m!509723 () Bool)

(assert (=> b!529678 m!509723))

(declare-fun m!509725 () Bool)

(assert (=> b!529672 m!509725))

(assert (=> b!529677 m!509703))

(assert (=> b!529677 m!509703))

(declare-fun m!509727 () Bool)

(assert (=> b!529677 m!509727))

(assert (=> b!529668 m!509703))

(assert (=> b!529668 m!509703))

(declare-fun m!509729 () Bool)

(assert (=> b!529668 m!509729))

(declare-fun m!509731 () Bool)

(assert (=> b!529675 m!509731))

(check-sat (not b!529676) (not start!48108) (not b!529670) (not b!529669) (not b!529674) (not b!529668) (not b!529675) (not b!529678) (not b!529677) (not b!529672))
(check-sat)
