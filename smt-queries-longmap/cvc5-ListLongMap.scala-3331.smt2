; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45978 () Bool)

(assert start!45978)

(declare-fun res!309846 () Bool)

(declare-fun e!297729 () Bool)

(assert (=> start!45978 (=> (not res!309846) (not e!297729))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45978 (= res!309846 (validMask!0 mask!3524))))

(assert (=> start!45978 e!297729))

(assert (=> start!45978 true))

(declare-datatypes ((array!32689 0))(
  ( (array!32690 (arr!15723 (Array (_ BitVec 32) (_ BitVec 64))) (size!16087 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32689)

(declare-fun array_inv!11519 (array!32689) Bool)

(assert (=> start!45978 (array_inv!11519 a!3235)))

(declare-fun b!509001 () Bool)

(declare-fun res!309847 () Bool)

(declare-fun e!297726 () Bool)

(assert (=> b!509001 (=> (not res!309847) (not e!297726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32689 (_ BitVec 32)) Bool)

(assert (=> b!509001 (= res!309847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509002 () Bool)

(declare-fun res!309848 () Bool)

(assert (=> b!509002 (=> (not res!309848) (not e!297726))))

(declare-datatypes ((List!9881 0))(
  ( (Nil!9878) (Cons!9877 (h!10754 (_ BitVec 64)) (t!16109 List!9881)) )
))
(declare-fun arrayNoDuplicates!0 (array!32689 (_ BitVec 32) List!9881) Bool)

(assert (=> b!509002 (= res!309848 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9878))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!297727 () Bool)

(declare-fun b!509003 () Bool)

(declare-datatypes ((SeekEntryResult!4190 0))(
  ( (MissingZero!4190 (index!18948 (_ BitVec 32))) (Found!4190 (index!18949 (_ BitVec 32))) (Intermediate!4190 (undefined!5002 Bool) (index!18950 (_ BitVec 32)) (x!47927 (_ BitVec 32))) (Undefined!4190) (MissingVacant!4190 (index!18951 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32689 (_ BitVec 32)) SeekEntryResult!4190)

(assert (=> b!509003 (= e!297727 (= (seekEntryOrOpen!0 (select (arr!15723 a!3235) j!176) a!3235 mask!3524) (Found!4190 j!176)))))

(declare-fun b!509004 () Bool)

(declare-fun res!309854 () Bool)

(assert (=> b!509004 (=> (not res!309854) (not e!297729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509004 (= res!309854 (validKeyInArray!0 (select (arr!15723 a!3235) j!176)))))

(declare-fun b!509005 () Bool)

(declare-fun res!309851 () Bool)

(assert (=> b!509005 (=> (not res!309851) (not e!297729))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509005 (= res!309851 (and (= (size!16087 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16087 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16087 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509006 () Bool)

(declare-fun res!309853 () Bool)

(assert (=> b!509006 (=> (not res!309853) (not e!297729))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509006 (= res!309853 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509007 () Bool)

(declare-fun res!309852 () Bool)

(assert (=> b!509007 (=> (not res!309852) (not e!297729))))

(assert (=> b!509007 (= res!309852 (validKeyInArray!0 k!2280))))

(declare-fun b!509008 () Bool)

(assert (=> b!509008 (= e!297729 e!297726)))

(declare-fun res!309849 () Bool)

(assert (=> b!509008 (=> (not res!309849) (not e!297726))))

(declare-fun lt!232426 () SeekEntryResult!4190)

(assert (=> b!509008 (= res!309849 (or (= lt!232426 (MissingZero!4190 i!1204)) (= lt!232426 (MissingVacant!4190 i!1204))))))

(assert (=> b!509008 (= lt!232426 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509009 () Bool)

(assert (=> b!509009 (= e!297726 (not true))))

(declare-fun lt!232429 () SeekEntryResult!4190)

(declare-fun lt!232428 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32689 (_ BitVec 32)) SeekEntryResult!4190)

(assert (=> b!509009 (= lt!232429 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232428 (select (store (arr!15723 a!3235) i!1204 k!2280) j!176) (array!32690 (store (arr!15723 a!3235) i!1204 k!2280) (size!16087 a!3235)) mask!3524))))

(declare-fun lt!232425 () SeekEntryResult!4190)

(declare-fun lt!232427 () (_ BitVec 32))

(assert (=> b!509009 (= lt!232425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232427 (select (arr!15723 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509009 (= lt!232428 (toIndex!0 (select (store (arr!15723 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509009 (= lt!232427 (toIndex!0 (select (arr!15723 a!3235) j!176) mask!3524))))

(assert (=> b!509009 e!297727))

(declare-fun res!309850 () Bool)

(assert (=> b!509009 (=> (not res!309850) (not e!297727))))

(assert (=> b!509009 (= res!309850 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15638 0))(
  ( (Unit!15639) )
))
(declare-fun lt!232424 () Unit!15638)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15638)

(assert (=> b!509009 (= lt!232424 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45978 res!309846) b!509005))

(assert (= (and b!509005 res!309851) b!509004))

(assert (= (and b!509004 res!309854) b!509007))

(assert (= (and b!509007 res!309852) b!509006))

(assert (= (and b!509006 res!309853) b!509008))

(assert (= (and b!509008 res!309849) b!509001))

(assert (= (and b!509001 res!309847) b!509002))

(assert (= (and b!509002 res!309848) b!509009))

(assert (= (and b!509009 res!309850) b!509003))

(declare-fun m!489741 () Bool)

(assert (=> b!509008 m!489741))

(declare-fun m!489743 () Bool)

(assert (=> b!509003 m!489743))

(assert (=> b!509003 m!489743))

(declare-fun m!489745 () Bool)

(assert (=> b!509003 m!489745))

(declare-fun m!489747 () Bool)

(assert (=> b!509006 m!489747))

(assert (=> b!509004 m!489743))

(assert (=> b!509004 m!489743))

(declare-fun m!489749 () Bool)

(assert (=> b!509004 m!489749))

(declare-fun m!489751 () Bool)

(assert (=> b!509007 m!489751))

(declare-fun m!489753 () Bool)

(assert (=> b!509001 m!489753))

(declare-fun m!489755 () Bool)

(assert (=> b!509009 m!489755))

(declare-fun m!489757 () Bool)

(assert (=> b!509009 m!489757))

(declare-fun m!489759 () Bool)

(assert (=> b!509009 m!489759))

(declare-fun m!489761 () Bool)

(assert (=> b!509009 m!489761))

(assert (=> b!509009 m!489755))

(assert (=> b!509009 m!489743))

(declare-fun m!489763 () Bool)

(assert (=> b!509009 m!489763))

(assert (=> b!509009 m!489743))

(declare-fun m!489765 () Bool)

(assert (=> b!509009 m!489765))

(assert (=> b!509009 m!489755))

(declare-fun m!489767 () Bool)

(assert (=> b!509009 m!489767))

(assert (=> b!509009 m!489743))

(declare-fun m!489769 () Bool)

(assert (=> b!509009 m!489769))

(declare-fun m!489771 () Bool)

(assert (=> start!45978 m!489771))

(declare-fun m!489773 () Bool)

(assert (=> start!45978 m!489773))

(declare-fun m!489775 () Bool)

(assert (=> b!509002 m!489775))

(push 1)

