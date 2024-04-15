; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46014 () Bool)

(assert start!46014)

(declare-fun b!509378 () Bool)

(declare-fun res!310367 () Bool)

(declare-fun e!297842 () Bool)

(assert (=> b!509378 (=> (not res!310367) (not e!297842))))

(declare-datatypes ((array!32735 0))(
  ( (array!32736 (arr!15746 (Array (_ BitVec 32) (_ BitVec 64))) (size!16111 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32735)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32735 (_ BitVec 32)) Bool)

(assert (=> b!509378 (= res!310367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509379 () Bool)

(declare-fun e!297843 () Bool)

(assert (=> b!509379 (= e!297843 e!297842)))

(declare-fun res!310373 () Bool)

(assert (=> b!509379 (=> (not res!310373) (not e!297842))))

(declare-datatypes ((SeekEntryResult!4210 0))(
  ( (MissingZero!4210 (index!19028 (_ BitVec 32))) (Found!4210 (index!19029 (_ BitVec 32))) (Intermediate!4210 (undefined!5022 Bool) (index!19030 (_ BitVec 32)) (x!48006 (_ BitVec 32))) (Undefined!4210) (MissingVacant!4210 (index!19031 (_ BitVec 32))) )
))
(declare-fun lt!232625 () SeekEntryResult!4210)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509379 (= res!310373 (or (= lt!232625 (MissingZero!4210 i!1204)) (= lt!232625 (MissingVacant!4210 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32735 (_ BitVec 32)) SeekEntryResult!4210)

(assert (=> b!509379 (= lt!232625 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509380 () Bool)

(assert (=> b!509380 (= e!297842 (not true))))

(declare-fun lt!232626 () (_ BitVec 32))

(declare-fun lt!232627 () SeekEntryResult!4210)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32735 (_ BitVec 32)) SeekEntryResult!4210)

(assert (=> b!509380 (= lt!232627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232626 (select (store (arr!15746 a!3235) i!1204 k0!2280) j!176) (array!32736 (store (arr!15746 a!3235) i!1204 k0!2280) (size!16111 a!3235)) mask!3524))))

(declare-fun lt!232624 () (_ BitVec 32))

(declare-fun lt!232623 () SeekEntryResult!4210)

(assert (=> b!509380 (= lt!232623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232624 (select (arr!15746 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509380 (= lt!232626 (toIndex!0 (select (store (arr!15746 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509380 (= lt!232624 (toIndex!0 (select (arr!15746 a!3235) j!176) mask!3524))))

(declare-fun e!297841 () Bool)

(assert (=> b!509380 e!297841))

(declare-fun res!310368 () Bool)

(assert (=> b!509380 (=> (not res!310368) (not e!297841))))

(assert (=> b!509380 (= res!310368 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15664 0))(
  ( (Unit!15665) )
))
(declare-fun lt!232622 () Unit!15664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15664)

(assert (=> b!509380 (= lt!232622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509381 () Bool)

(declare-fun res!310365 () Bool)

(assert (=> b!509381 (=> (not res!310365) (not e!297843))))

(assert (=> b!509381 (= res!310365 (and (= (size!16111 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16111 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16111 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509382 () Bool)

(declare-fun res!310369 () Bool)

(assert (=> b!509382 (=> (not res!310369) (not e!297843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509382 (= res!310369 (validKeyInArray!0 k0!2280))))

(declare-fun b!509383 () Bool)

(declare-fun res!310372 () Bool)

(assert (=> b!509383 (=> (not res!310372) (not e!297842))))

(declare-datatypes ((List!9943 0))(
  ( (Nil!9940) (Cons!9939 (h!10816 (_ BitVec 64)) (t!16162 List!9943)) )
))
(declare-fun arrayNoDuplicates!0 (array!32735 (_ BitVec 32) List!9943) Bool)

(assert (=> b!509383 (= res!310372 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9940))))

(declare-fun b!509384 () Bool)

(assert (=> b!509384 (= e!297841 (= (seekEntryOrOpen!0 (select (arr!15746 a!3235) j!176) a!3235 mask!3524) (Found!4210 j!176)))))

(declare-fun b!509385 () Bool)

(declare-fun res!310371 () Bool)

(assert (=> b!509385 (=> (not res!310371) (not e!297843))))

(declare-fun arrayContainsKey!0 (array!32735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509385 (= res!310371 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!310366 () Bool)

(assert (=> start!46014 (=> (not res!310366) (not e!297843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46014 (= res!310366 (validMask!0 mask!3524))))

(assert (=> start!46014 e!297843))

(assert (=> start!46014 true))

(declare-fun array_inv!11629 (array!32735) Bool)

(assert (=> start!46014 (array_inv!11629 a!3235)))

(declare-fun b!509386 () Bool)

(declare-fun res!310370 () Bool)

(assert (=> b!509386 (=> (not res!310370) (not e!297843))))

(assert (=> b!509386 (= res!310370 (validKeyInArray!0 (select (arr!15746 a!3235) j!176)))))

(assert (= (and start!46014 res!310366) b!509381))

(assert (= (and b!509381 res!310365) b!509386))

(assert (= (and b!509386 res!310370) b!509382))

(assert (= (and b!509382 res!310369) b!509385))

(assert (= (and b!509385 res!310371) b!509379))

(assert (= (and b!509379 res!310373) b!509378))

(assert (= (and b!509378 res!310367) b!509383))

(assert (= (and b!509383 res!310372) b!509380))

(assert (= (and b!509380 res!310368) b!509384))

(declare-fun m!489853 () Bool)

(assert (=> b!509386 m!489853))

(assert (=> b!509386 m!489853))

(declare-fun m!489855 () Bool)

(assert (=> b!509386 m!489855))

(declare-fun m!489857 () Bool)

(assert (=> b!509382 m!489857))

(declare-fun m!489859 () Bool)

(assert (=> start!46014 m!489859))

(declare-fun m!489861 () Bool)

(assert (=> start!46014 m!489861))

(declare-fun m!489863 () Bool)

(assert (=> b!509378 m!489863))

(declare-fun m!489865 () Bool)

(assert (=> b!509383 m!489865))

(declare-fun m!489867 () Bool)

(assert (=> b!509380 m!489867))

(declare-fun m!489869 () Bool)

(assert (=> b!509380 m!489869))

(declare-fun m!489871 () Bool)

(assert (=> b!509380 m!489871))

(declare-fun m!489873 () Bool)

(assert (=> b!509380 m!489873))

(assert (=> b!509380 m!489867))

(assert (=> b!509380 m!489853))

(declare-fun m!489875 () Bool)

(assert (=> b!509380 m!489875))

(assert (=> b!509380 m!489853))

(declare-fun m!489877 () Bool)

(assert (=> b!509380 m!489877))

(assert (=> b!509380 m!489853))

(declare-fun m!489879 () Bool)

(assert (=> b!509380 m!489879))

(assert (=> b!509380 m!489867))

(declare-fun m!489881 () Bool)

(assert (=> b!509380 m!489881))

(assert (=> b!509384 m!489853))

(assert (=> b!509384 m!489853))

(declare-fun m!489883 () Bool)

(assert (=> b!509384 m!489883))

(declare-fun m!489885 () Bool)

(assert (=> b!509379 m!489885))

(declare-fun m!489887 () Bool)

(assert (=> b!509385 m!489887))

(check-sat (not b!509384) (not b!509382) (not b!509385) (not b!509383) (not b!509379) (not b!509378) (not b!509386) (not b!509380) (not start!46014))
(check-sat)
