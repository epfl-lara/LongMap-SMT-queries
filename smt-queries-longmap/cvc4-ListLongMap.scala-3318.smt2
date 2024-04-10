; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45856 () Bool)

(assert start!45856)

(declare-fun b!507907 () Bool)

(declare-fun e!297219 () Bool)

(declare-fun e!297221 () Bool)

(assert (=> b!507907 (= e!297219 (not e!297221))))

(declare-fun res!308872 () Bool)

(assert (=> b!507907 (=> res!308872 e!297221)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32612 0))(
  ( (array!32613 (arr!15686 (Array (_ BitVec 32) (_ BitVec 64))) (size!16050 (_ BitVec 32))) )
))
(declare-fun lt!232111 () array!32612)

(declare-fun lt!232114 () (_ BitVec 64))

(declare-fun lt!232112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4153 0))(
  ( (MissingZero!4153 (index!18800 (_ BitVec 32))) (Found!4153 (index!18801 (_ BitVec 32))) (Intermediate!4153 (undefined!4965 Bool) (index!18802 (_ BitVec 32)) (x!47786 (_ BitVec 32))) (Undefined!4153) (MissingVacant!4153 (index!18803 (_ BitVec 32))) )
))
(declare-fun lt!232109 () SeekEntryResult!4153)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32612 (_ BitVec 32)) SeekEntryResult!4153)

(assert (=> b!507907 (= res!308872 (= lt!232109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232112 lt!232114 lt!232111 mask!3524)))))

(declare-fun a!3235 () array!32612)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!232108 () (_ BitVec 32))

(assert (=> b!507907 (= lt!232109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232108 (select (arr!15686 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507907 (= lt!232112 (toIndex!0 lt!232114 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507907 (= lt!232114 (select (store (arr!15686 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507907 (= lt!232108 (toIndex!0 (select (arr!15686 a!3235) j!176) mask!3524))))

(assert (=> b!507907 (= lt!232111 (array!32613 (store (arr!15686 a!3235) i!1204 k!2280) (size!16050 a!3235)))))

(declare-fun e!297217 () Bool)

(assert (=> b!507907 e!297217))

(declare-fun res!308869 () Bool)

(assert (=> b!507907 (=> (not res!308869) (not e!297217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32612 (_ BitVec 32)) Bool)

(assert (=> b!507907 (= res!308869 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15594 0))(
  ( (Unit!15595) )
))
(declare-fun lt!232113 () Unit!15594)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15594)

(assert (=> b!507907 (= lt!232113 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507908 () Bool)

(declare-fun res!308876 () Bool)

(declare-fun e!297220 () Bool)

(assert (=> b!507908 (=> (not res!308876) (not e!297220))))

(declare-fun arrayContainsKey!0 (array!32612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507908 (= res!308876 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507909 () Bool)

(declare-fun res!308868 () Bool)

(assert (=> b!507909 (=> (not res!308868) (not e!297220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507909 (= res!308868 (validKeyInArray!0 (select (arr!15686 a!3235) j!176)))))

(declare-fun b!507910 () Bool)

(declare-fun res!308870 () Bool)

(assert (=> b!507910 (=> (not res!308870) (not e!297220))))

(assert (=> b!507910 (= res!308870 (and (= (size!16050 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16050 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16050 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507911 () Bool)

(declare-fun res!308874 () Bool)

(assert (=> b!507911 (=> (not res!308874) (not e!297219))))

(declare-datatypes ((List!9844 0))(
  ( (Nil!9841) (Cons!9840 (h!10717 (_ BitVec 64)) (t!16072 List!9844)) )
))
(declare-fun arrayNoDuplicates!0 (array!32612 (_ BitVec 32) List!9844) Bool)

(assert (=> b!507911 (= res!308874 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9841))))

(declare-fun b!507912 () Bool)

(assert (=> b!507912 (= e!297220 e!297219)))

(declare-fun res!308871 () Bool)

(assert (=> b!507912 (=> (not res!308871) (not e!297219))))

(declare-fun lt!232110 () SeekEntryResult!4153)

(assert (=> b!507912 (= res!308871 (or (= lt!232110 (MissingZero!4153 i!1204)) (= lt!232110 (MissingVacant!4153 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32612 (_ BitVec 32)) SeekEntryResult!4153)

(assert (=> b!507912 (= lt!232110 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507913 () Bool)

(declare-fun res!308873 () Bool)

(assert (=> b!507913 (=> (not res!308873) (not e!297219))))

(assert (=> b!507913 (= res!308873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507914 () Bool)

(declare-fun e!297218 () Bool)

(assert (=> b!507914 (= e!297221 e!297218)))

(declare-fun res!308867 () Bool)

(assert (=> b!507914 (=> res!308867 e!297218)))

(declare-fun lt!232106 () Bool)

(assert (=> b!507914 (= res!308867 (or (and (not lt!232106) (undefined!4965 lt!232109)) (and (not lt!232106) (not (undefined!4965 lt!232109)))))))

(assert (=> b!507914 (= lt!232106 (not (is-Intermediate!4153 lt!232109)))))

(declare-fun b!507915 () Bool)

(assert (=> b!507915 (= e!297218 true)))

(declare-fun lt!232107 () SeekEntryResult!4153)

(assert (=> b!507915 (= lt!232107 (seekEntryOrOpen!0 lt!232114 lt!232111 mask!3524))))

(assert (=> b!507915 false))

(declare-fun b!507916 () Bool)

(assert (=> b!507916 (= e!297217 (= (seekEntryOrOpen!0 (select (arr!15686 a!3235) j!176) a!3235 mask!3524) (Found!4153 j!176)))))

(declare-fun res!308866 () Bool)

(assert (=> start!45856 (=> (not res!308866) (not e!297220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45856 (= res!308866 (validMask!0 mask!3524))))

(assert (=> start!45856 e!297220))

(assert (=> start!45856 true))

(declare-fun array_inv!11482 (array!32612) Bool)

(assert (=> start!45856 (array_inv!11482 a!3235)))

(declare-fun b!507917 () Bool)

(declare-fun res!308875 () Bool)

(assert (=> b!507917 (=> (not res!308875) (not e!297220))))

(assert (=> b!507917 (= res!308875 (validKeyInArray!0 k!2280))))

(assert (= (and start!45856 res!308866) b!507910))

(assert (= (and b!507910 res!308870) b!507909))

(assert (= (and b!507909 res!308868) b!507917))

(assert (= (and b!507917 res!308875) b!507908))

(assert (= (and b!507908 res!308876) b!507912))

(assert (= (and b!507912 res!308871) b!507913))

(assert (= (and b!507913 res!308873) b!507911))

(assert (= (and b!507911 res!308874) b!507907))

(assert (= (and b!507907 res!308869) b!507916))

(assert (= (and b!507907 (not res!308872)) b!507914))

(assert (= (and b!507914 (not res!308867)) b!507915))

(declare-fun m!488749 () Bool)

(assert (=> start!45856 m!488749))

(declare-fun m!488751 () Bool)

(assert (=> start!45856 m!488751))

(declare-fun m!488753 () Bool)

(assert (=> b!507909 m!488753))

(assert (=> b!507909 m!488753))

(declare-fun m!488755 () Bool)

(assert (=> b!507909 m!488755))

(assert (=> b!507916 m!488753))

(assert (=> b!507916 m!488753))

(declare-fun m!488757 () Bool)

(assert (=> b!507916 m!488757))

(declare-fun m!488759 () Bool)

(assert (=> b!507913 m!488759))

(declare-fun m!488761 () Bool)

(assert (=> b!507911 m!488761))

(declare-fun m!488763 () Bool)

(assert (=> b!507907 m!488763))

(declare-fun m!488765 () Bool)

(assert (=> b!507907 m!488765))

(declare-fun m!488767 () Bool)

(assert (=> b!507907 m!488767))

(declare-fun m!488769 () Bool)

(assert (=> b!507907 m!488769))

(assert (=> b!507907 m!488753))

(declare-fun m!488771 () Bool)

(assert (=> b!507907 m!488771))

(declare-fun m!488773 () Bool)

(assert (=> b!507907 m!488773))

(assert (=> b!507907 m!488753))

(declare-fun m!488775 () Bool)

(assert (=> b!507907 m!488775))

(assert (=> b!507907 m!488753))

(declare-fun m!488777 () Bool)

(assert (=> b!507907 m!488777))

(declare-fun m!488779 () Bool)

(assert (=> b!507908 m!488779))

(declare-fun m!488781 () Bool)

(assert (=> b!507912 m!488781))

(declare-fun m!488783 () Bool)

(assert (=> b!507915 m!488783))

(declare-fun m!488785 () Bool)

(assert (=> b!507917 m!488785))

(push 1)

