; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46030 () Bool)

(assert start!46030)

(declare-fun b!509703 () Bool)

(declare-fun res!310554 () Bool)

(declare-fun e!298038 () Bool)

(assert (=> b!509703 (=> (not res!310554) (not e!298038))))

(declare-datatypes ((array!32741 0))(
  ( (array!32742 (arr!15749 (Array (_ BitVec 32) (_ BitVec 64))) (size!16113 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32741)

(declare-datatypes ((List!9907 0))(
  ( (Nil!9904) (Cons!9903 (h!10780 (_ BitVec 64)) (t!16135 List!9907)) )
))
(declare-fun arrayNoDuplicates!0 (array!32741 (_ BitVec 32) List!9907) Bool)

(assert (=> b!509703 (= res!310554 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9904))))

(declare-fun b!509704 () Bool)

(declare-fun res!310548 () Bool)

(assert (=> b!509704 (=> (not res!310548) (not e!298038))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32741 (_ BitVec 32)) Bool)

(assert (=> b!509704 (= res!310548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!298041 () Bool)

(declare-fun b!509705 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4216 0))(
  ( (MissingZero!4216 (index!19052 (_ BitVec 32))) (Found!4216 (index!19053 (_ BitVec 32))) (Intermediate!4216 (undefined!5028 Bool) (index!19054 (_ BitVec 32)) (x!48017 (_ BitVec 32))) (Undefined!4216) (MissingVacant!4216 (index!19055 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32741 (_ BitVec 32)) SeekEntryResult!4216)

(assert (=> b!509705 (= e!298041 (= (seekEntryOrOpen!0 (select (arr!15749 a!3235) j!176) a!3235 mask!3524) (Found!4216 j!176)))))

(declare-fun b!509706 () Bool)

(assert (=> b!509706 (= e!298038 (not true))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!232897 () (_ BitVec 32))

(declare-fun lt!232896 () SeekEntryResult!4216)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32741 (_ BitVec 32)) SeekEntryResult!4216)

(assert (=> b!509706 (= lt!232896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232897 (select (store (arr!15749 a!3235) i!1204 k!2280) j!176) (array!32742 (store (arr!15749 a!3235) i!1204 k!2280) (size!16113 a!3235)) mask!3524))))

(declare-fun lt!232895 () (_ BitVec 32))

(declare-fun lt!232892 () SeekEntryResult!4216)

(assert (=> b!509706 (= lt!232892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232895 (select (arr!15749 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509706 (= lt!232897 (toIndex!0 (select (store (arr!15749 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509706 (= lt!232895 (toIndex!0 (select (arr!15749 a!3235) j!176) mask!3524))))

(assert (=> b!509706 e!298041))

(declare-fun res!310550 () Bool)

(assert (=> b!509706 (=> (not res!310550) (not e!298041))))

(assert (=> b!509706 (= res!310550 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15690 0))(
  ( (Unit!15691) )
))
(declare-fun lt!232893 () Unit!15690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15690)

(assert (=> b!509706 (= lt!232893 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509708 () Bool)

(declare-fun res!310552 () Bool)

(declare-fun e!298039 () Bool)

(assert (=> b!509708 (=> (not res!310552) (not e!298039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509708 (= res!310552 (validKeyInArray!0 (select (arr!15749 a!3235) j!176)))))

(declare-fun b!509709 () Bool)

(declare-fun res!310551 () Bool)

(assert (=> b!509709 (=> (not res!310551) (not e!298039))))

(assert (=> b!509709 (= res!310551 (and (= (size!16113 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16113 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16113 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509710 () Bool)

(declare-fun res!310553 () Bool)

(assert (=> b!509710 (=> (not res!310553) (not e!298039))))

(assert (=> b!509710 (= res!310553 (validKeyInArray!0 k!2280))))

(declare-fun b!509711 () Bool)

(declare-fun res!310556 () Bool)

(assert (=> b!509711 (=> (not res!310556) (not e!298039))))

(declare-fun arrayContainsKey!0 (array!32741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509711 (= res!310556 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509707 () Bool)

(assert (=> b!509707 (= e!298039 e!298038)))

(declare-fun res!310549 () Bool)

(assert (=> b!509707 (=> (not res!310549) (not e!298038))))

(declare-fun lt!232894 () SeekEntryResult!4216)

(assert (=> b!509707 (= res!310549 (or (= lt!232894 (MissingZero!4216 i!1204)) (= lt!232894 (MissingVacant!4216 i!1204))))))

(assert (=> b!509707 (= lt!232894 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!310555 () Bool)

(assert (=> start!46030 (=> (not res!310555) (not e!298039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46030 (= res!310555 (validMask!0 mask!3524))))

(assert (=> start!46030 e!298039))

(assert (=> start!46030 true))

(declare-fun array_inv!11545 (array!32741) Bool)

(assert (=> start!46030 (array_inv!11545 a!3235)))

(assert (= (and start!46030 res!310555) b!509709))

(assert (= (and b!509709 res!310551) b!509708))

(assert (= (and b!509708 res!310552) b!509710))

(assert (= (and b!509710 res!310553) b!509711))

(assert (= (and b!509711 res!310556) b!509707))

(assert (= (and b!509707 res!310549) b!509704))

(assert (= (and b!509704 res!310548) b!509703))

(assert (= (and b!509703 res!310554) b!509706))

(assert (= (and b!509706 res!310550) b!509705))

(declare-fun m!490677 () Bool)

(assert (=> b!509704 m!490677))

(declare-fun m!490679 () Bool)

(assert (=> b!509708 m!490679))

(assert (=> b!509708 m!490679))

(declare-fun m!490681 () Bool)

(assert (=> b!509708 m!490681))

(assert (=> b!509705 m!490679))

(assert (=> b!509705 m!490679))

(declare-fun m!490683 () Bool)

(assert (=> b!509705 m!490683))

(declare-fun m!490685 () Bool)

(assert (=> b!509710 m!490685))

(declare-fun m!490687 () Bool)

(assert (=> b!509703 m!490687))

(declare-fun m!490689 () Bool)

(assert (=> b!509711 m!490689))

(declare-fun m!490691 () Bool)

(assert (=> b!509706 m!490691))

(declare-fun m!490693 () Bool)

(assert (=> b!509706 m!490693))

(declare-fun m!490695 () Bool)

(assert (=> b!509706 m!490695))

(assert (=> b!509706 m!490679))

(declare-fun m!490697 () Bool)

(assert (=> b!509706 m!490697))

(assert (=> b!509706 m!490679))

(declare-fun m!490699 () Bool)

(assert (=> b!509706 m!490699))

(assert (=> b!509706 m!490695))

(declare-fun m!490701 () Bool)

(assert (=> b!509706 m!490701))

(assert (=> b!509706 m!490679))

(declare-fun m!490703 () Bool)

(assert (=> b!509706 m!490703))

(assert (=> b!509706 m!490695))

(declare-fun m!490705 () Bool)

(assert (=> b!509706 m!490705))

(declare-fun m!490707 () Bool)

(assert (=> b!509707 m!490707))

(declare-fun m!490709 () Bool)

(assert (=> start!46030 m!490709))

(declare-fun m!490711 () Bool)

(assert (=> start!46030 m!490711))

(push 1)

(assert (not b!509705))

(assert (not b!509710))

(assert (not b!509708))

(assert (not b!509711))

(assert (not b!509706))

(assert (not b!509704))

(assert (not b!509703))

(assert (not b!509707))

(assert (not start!46030))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

