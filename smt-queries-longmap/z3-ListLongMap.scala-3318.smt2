; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45854 () Bool)

(assert start!45854)

(declare-fun b!507874 () Bool)

(declare-fun res!308836 () Bool)

(declare-fun e!297201 () Bool)

(assert (=> b!507874 (=> (not res!308836) (not e!297201))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32610 0))(
  ( (array!32611 (arr!15685 (Array (_ BitVec 32) (_ BitVec 64))) (size!16049 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32610)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507874 (= res!308836 (and (= (size!16049 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16049 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16049 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507875 () Bool)

(declare-fun res!308839 () Bool)

(assert (=> b!507875 (=> (not res!308839) (not e!297201))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507875 (= res!308839 (validKeyInArray!0 k0!2280))))

(declare-fun b!507876 () Bool)

(declare-fun res!308833 () Bool)

(assert (=> b!507876 (=> (not res!308833) (not e!297201))))

(declare-fun arrayContainsKey!0 (array!32610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507876 (= res!308833 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!308837 () Bool)

(assert (=> start!45854 (=> (not res!308837) (not e!297201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45854 (= res!308837 (validMask!0 mask!3524))))

(assert (=> start!45854 e!297201))

(assert (=> start!45854 true))

(declare-fun array_inv!11481 (array!32610) Bool)

(assert (=> start!45854 (array_inv!11481 a!3235)))

(declare-fun b!507877 () Bool)

(declare-fun e!297204 () Bool)

(declare-fun e!297202 () Bool)

(assert (=> b!507877 (= e!297204 e!297202)))

(declare-fun res!308843 () Bool)

(assert (=> b!507877 (=> res!308843 e!297202)))

(declare-fun lt!232086 () Bool)

(declare-datatypes ((SeekEntryResult!4152 0))(
  ( (MissingZero!4152 (index!18796 (_ BitVec 32))) (Found!4152 (index!18797 (_ BitVec 32))) (Intermediate!4152 (undefined!4964 Bool) (index!18798 (_ BitVec 32)) (x!47785 (_ BitVec 32))) (Undefined!4152) (MissingVacant!4152 (index!18799 (_ BitVec 32))) )
))
(declare-fun lt!232085 () SeekEntryResult!4152)

(assert (=> b!507877 (= res!308843 (or (and (not lt!232086) (undefined!4964 lt!232085)) (and (not lt!232086) (not (undefined!4964 lt!232085)))))))

(get-info :version)

(assert (=> b!507877 (= lt!232086 (not ((_ is Intermediate!4152) lt!232085)))))

(declare-fun b!507878 () Bool)

(declare-fun res!308840 () Bool)

(declare-fun e!297203 () Bool)

(assert (=> b!507878 (=> (not res!308840) (not e!297203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32610 (_ BitVec 32)) Bool)

(assert (=> b!507878 (= res!308840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507879 () Bool)

(assert (=> b!507879 (= e!297201 e!297203)))

(declare-fun res!308834 () Bool)

(assert (=> b!507879 (=> (not res!308834) (not e!297203))))

(declare-fun lt!232081 () SeekEntryResult!4152)

(assert (=> b!507879 (= res!308834 (or (= lt!232081 (MissingZero!4152 i!1204)) (= lt!232081 (MissingVacant!4152 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32610 (_ BitVec 32)) SeekEntryResult!4152)

(assert (=> b!507879 (= lt!232081 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507880 () Bool)

(declare-fun res!308835 () Bool)

(assert (=> b!507880 (=> (not res!308835) (not e!297203))))

(declare-datatypes ((List!9843 0))(
  ( (Nil!9840) (Cons!9839 (h!10716 (_ BitVec 64)) (t!16071 List!9843)) )
))
(declare-fun arrayNoDuplicates!0 (array!32610 (_ BitVec 32) List!9843) Bool)

(assert (=> b!507880 (= res!308835 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9840))))

(declare-fun b!507881 () Bool)

(assert (=> b!507881 (= e!297202 true)))

(declare-fun lt!232083 () (_ BitVec 64))

(declare-fun lt!232082 () array!32610)

(declare-fun lt!232087 () SeekEntryResult!4152)

(assert (=> b!507881 (= lt!232087 (seekEntryOrOpen!0 lt!232083 lt!232082 mask!3524))))

(assert (=> b!507881 false))

(declare-fun b!507882 () Bool)

(declare-fun res!308841 () Bool)

(assert (=> b!507882 (=> (not res!308841) (not e!297201))))

(assert (=> b!507882 (= res!308841 (validKeyInArray!0 (select (arr!15685 a!3235) j!176)))))

(declare-fun e!297199 () Bool)

(declare-fun b!507883 () Bool)

(assert (=> b!507883 (= e!297199 (= (seekEntryOrOpen!0 (select (arr!15685 a!3235) j!176) a!3235 mask!3524) (Found!4152 j!176)))))

(declare-fun b!507884 () Bool)

(assert (=> b!507884 (= e!297203 (not e!297204))))

(declare-fun res!308838 () Bool)

(assert (=> b!507884 (=> res!308838 e!297204)))

(declare-fun lt!232080 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32610 (_ BitVec 32)) SeekEntryResult!4152)

(assert (=> b!507884 (= res!308838 (= lt!232085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232080 lt!232083 lt!232082 mask!3524)))))

(declare-fun lt!232084 () (_ BitVec 32))

(assert (=> b!507884 (= lt!232085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232084 (select (arr!15685 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507884 (= lt!232080 (toIndex!0 lt!232083 mask!3524))))

(assert (=> b!507884 (= lt!232083 (select (store (arr!15685 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507884 (= lt!232084 (toIndex!0 (select (arr!15685 a!3235) j!176) mask!3524))))

(assert (=> b!507884 (= lt!232082 (array!32611 (store (arr!15685 a!3235) i!1204 k0!2280) (size!16049 a!3235)))))

(assert (=> b!507884 e!297199))

(declare-fun res!308842 () Bool)

(assert (=> b!507884 (=> (not res!308842) (not e!297199))))

(assert (=> b!507884 (= res!308842 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15592 0))(
  ( (Unit!15593) )
))
(declare-fun lt!232079 () Unit!15592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32610 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15592)

(assert (=> b!507884 (= lt!232079 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45854 res!308837) b!507874))

(assert (= (and b!507874 res!308836) b!507882))

(assert (= (and b!507882 res!308841) b!507875))

(assert (= (and b!507875 res!308839) b!507876))

(assert (= (and b!507876 res!308833) b!507879))

(assert (= (and b!507879 res!308834) b!507878))

(assert (= (and b!507878 res!308840) b!507880))

(assert (= (and b!507880 res!308835) b!507884))

(assert (= (and b!507884 res!308842) b!507883))

(assert (= (and b!507884 (not res!308838)) b!507877))

(assert (= (and b!507877 (not res!308843)) b!507881))

(declare-fun m!488711 () Bool)

(assert (=> b!507880 m!488711))

(declare-fun m!488713 () Bool)

(assert (=> b!507878 m!488713))

(declare-fun m!488715 () Bool)

(assert (=> start!45854 m!488715))

(declare-fun m!488717 () Bool)

(assert (=> start!45854 m!488717))

(declare-fun m!488719 () Bool)

(assert (=> b!507883 m!488719))

(assert (=> b!507883 m!488719))

(declare-fun m!488721 () Bool)

(assert (=> b!507883 m!488721))

(assert (=> b!507882 m!488719))

(assert (=> b!507882 m!488719))

(declare-fun m!488723 () Bool)

(assert (=> b!507882 m!488723))

(declare-fun m!488725 () Bool)

(assert (=> b!507879 m!488725))

(declare-fun m!488727 () Bool)

(assert (=> b!507884 m!488727))

(declare-fun m!488729 () Bool)

(assert (=> b!507884 m!488729))

(declare-fun m!488731 () Bool)

(assert (=> b!507884 m!488731))

(declare-fun m!488733 () Bool)

(assert (=> b!507884 m!488733))

(assert (=> b!507884 m!488719))

(declare-fun m!488735 () Bool)

(assert (=> b!507884 m!488735))

(assert (=> b!507884 m!488719))

(declare-fun m!488737 () Bool)

(assert (=> b!507884 m!488737))

(assert (=> b!507884 m!488719))

(declare-fun m!488739 () Bool)

(assert (=> b!507884 m!488739))

(declare-fun m!488741 () Bool)

(assert (=> b!507884 m!488741))

(declare-fun m!488743 () Bool)

(assert (=> b!507875 m!488743))

(declare-fun m!488745 () Bool)

(assert (=> b!507876 m!488745))

(declare-fun m!488747 () Bool)

(assert (=> b!507881 m!488747))

(check-sat (not b!507880) (not b!507878) (not b!507876) (not b!507883) (not b!507875) (not b!507879) (not b!507881) (not start!45854) (not b!507884) (not b!507882))
(check-sat)
