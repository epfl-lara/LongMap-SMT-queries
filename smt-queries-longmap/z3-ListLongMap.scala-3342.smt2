; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46034 () Bool)

(assert start!46034)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32746 0))(
  ( (array!32747 (arr!15751 (Array (_ BitVec 32) (_ BitVec 64))) (size!16115 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32746)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!298085 () Bool)

(declare-fun b!509831 () Bool)

(declare-datatypes ((SeekEntryResult!4174 0))(
  ( (MissingZero!4174 (index!18884 (_ BitVec 32))) (Found!4174 (index!18885 (_ BitVec 32))) (Intermediate!4174 (undefined!4986 Bool) (index!18886 (_ BitVec 32)) (x!47996 (_ BitVec 32))) (Undefined!4174) (MissingVacant!4174 (index!18887 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32746 (_ BitVec 32)) SeekEntryResult!4174)

(assert (=> b!509831 (= e!298085 (= (seekEntryOrOpen!0 (select (arr!15751 a!3235) j!176) a!3235 mask!3524) (Found!4174 j!176)))))

(declare-fun b!509832 () Bool)

(declare-fun res!310732 () Bool)

(declare-fun e!298086 () Bool)

(assert (=> b!509832 (=> (not res!310732) (not e!298086))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509832 (= res!310732 (validKeyInArray!0 k0!2280))))

(declare-fun b!509833 () Bool)

(declare-fun e!298083 () Bool)

(assert (=> b!509833 (= e!298086 e!298083)))

(declare-fun res!310734 () Bool)

(assert (=> b!509833 (=> (not res!310734) (not e!298083))))

(declare-fun lt!233033 () SeekEntryResult!4174)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509833 (= res!310734 (or (= lt!233033 (MissingZero!4174 i!1204)) (= lt!233033 (MissingVacant!4174 i!1204))))))

(assert (=> b!509833 (= lt!233033 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509834 () Bool)

(declare-fun res!310737 () Bool)

(assert (=> b!509834 (=> (not res!310737) (not e!298086))))

(assert (=> b!509834 (= res!310737 (validKeyInArray!0 (select (arr!15751 a!3235) j!176)))))

(declare-fun b!509835 () Bool)

(declare-fun res!310730 () Bool)

(assert (=> b!509835 (=> (not res!310730) (not e!298083))))

(declare-datatypes ((List!9816 0))(
  ( (Nil!9813) (Cons!9812 (h!10689 (_ BitVec 64)) (t!16036 List!9816)) )
))
(declare-fun arrayNoDuplicates!0 (array!32746 (_ BitVec 32) List!9816) Bool)

(assert (=> b!509835 (= res!310730 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9813))))

(declare-fun b!509836 () Bool)

(assert (=> b!509836 (= e!298083 (not true))))

(declare-fun lt!233030 () SeekEntryResult!4174)

(declare-fun lt!233034 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32746 (_ BitVec 32)) SeekEntryResult!4174)

(assert (=> b!509836 (= lt!233030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233034 (select (store (arr!15751 a!3235) i!1204 k0!2280) j!176) (array!32747 (store (arr!15751 a!3235) i!1204 k0!2280) (size!16115 a!3235)) mask!3524))))

(declare-fun lt!233035 () (_ BitVec 32))

(declare-fun lt!233031 () SeekEntryResult!4174)

(assert (=> b!509836 (= lt!233031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233035 (select (arr!15751 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509836 (= lt!233034 (toIndex!0 (select (store (arr!15751 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509836 (= lt!233035 (toIndex!0 (select (arr!15751 a!3235) j!176) mask!3524))))

(assert (=> b!509836 e!298085))

(declare-fun res!310738 () Bool)

(assert (=> b!509836 (=> (not res!310738) (not e!298085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32746 (_ BitVec 32)) Bool)

(assert (=> b!509836 (= res!310738 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15667 0))(
  ( (Unit!15668) )
))
(declare-fun lt!233032 () Unit!15667)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15667)

(assert (=> b!509836 (= lt!233032 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509837 () Bool)

(declare-fun res!310733 () Bool)

(assert (=> b!509837 (=> (not res!310733) (not e!298086))))

(declare-fun arrayContainsKey!0 (array!32746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509837 (= res!310733 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!310736 () Bool)

(assert (=> start!46034 (=> (not res!310736) (not e!298086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46034 (= res!310736 (validMask!0 mask!3524))))

(assert (=> start!46034 e!298086))

(assert (=> start!46034 true))

(declare-fun array_inv!11610 (array!32746) Bool)

(assert (=> start!46034 (array_inv!11610 a!3235)))

(declare-fun b!509838 () Bool)

(declare-fun res!310731 () Bool)

(assert (=> b!509838 (=> (not res!310731) (not e!298083))))

(assert (=> b!509838 (= res!310731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509839 () Bool)

(declare-fun res!310735 () Bool)

(assert (=> b!509839 (=> (not res!310735) (not e!298086))))

(assert (=> b!509839 (= res!310735 (and (= (size!16115 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16115 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16115 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46034 res!310736) b!509839))

(assert (= (and b!509839 res!310735) b!509834))

(assert (= (and b!509834 res!310737) b!509832))

(assert (= (and b!509832 res!310732) b!509837))

(assert (= (and b!509837 res!310733) b!509833))

(assert (= (and b!509833 res!310734) b!509838))

(assert (= (and b!509838 res!310731) b!509835))

(assert (= (and b!509835 res!310730) b!509836))

(assert (= (and b!509836 res!310738) b!509831))

(declare-fun m!491113 () Bool)

(assert (=> b!509837 m!491113))

(declare-fun m!491115 () Bool)

(assert (=> b!509835 m!491115))

(declare-fun m!491117 () Bool)

(assert (=> b!509836 m!491117))

(declare-fun m!491119 () Bool)

(assert (=> b!509836 m!491119))

(declare-fun m!491121 () Bool)

(assert (=> b!509836 m!491121))

(declare-fun m!491123 () Bool)

(assert (=> b!509836 m!491123))

(assert (=> b!509836 m!491117))

(declare-fun m!491125 () Bool)

(assert (=> b!509836 m!491125))

(assert (=> b!509836 m!491117))

(declare-fun m!491127 () Bool)

(assert (=> b!509836 m!491127))

(declare-fun m!491129 () Bool)

(assert (=> b!509836 m!491129))

(declare-fun m!491131 () Bool)

(assert (=> b!509836 m!491131))

(assert (=> b!509836 m!491129))

(declare-fun m!491133 () Bool)

(assert (=> b!509836 m!491133))

(assert (=> b!509836 m!491129))

(declare-fun m!491135 () Bool)

(assert (=> b!509832 m!491135))

(assert (=> b!509834 m!491117))

(assert (=> b!509834 m!491117))

(declare-fun m!491137 () Bool)

(assert (=> b!509834 m!491137))

(declare-fun m!491139 () Bool)

(assert (=> start!46034 m!491139))

(declare-fun m!491141 () Bool)

(assert (=> start!46034 m!491141))

(declare-fun m!491143 () Bool)

(assert (=> b!509838 m!491143))

(assert (=> b!509831 m!491117))

(assert (=> b!509831 m!491117))

(declare-fun m!491145 () Bool)

(assert (=> b!509831 m!491145))

(declare-fun m!491147 () Bool)

(assert (=> b!509833 m!491147))

(check-sat (not b!509835) (not b!509838) (not b!509831) (not b!509833) (not b!509836) (not b!509832) (not start!46034) (not b!509837) (not b!509834))
(check-sat)
