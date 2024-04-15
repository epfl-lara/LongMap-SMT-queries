; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44934 () Bool)

(assert start!44934)

(declare-fun e!289359 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31889 0))(
  ( (array!31890 (arr!15329 (Array (_ BitVec 32) (_ BitVec 64))) (size!15694 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31889)

(declare-fun b!492608 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3793 0))(
  ( (MissingZero!3793 (index!17351 (_ BitVec 32))) (Found!3793 (index!17352 (_ BitVec 32))) (Intermediate!3793 (undefined!4605 Bool) (index!17353 (_ BitVec 32)) (x!46450 (_ BitVec 32))) (Undefined!3793) (MissingVacant!3793 (index!17354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31889 (_ BitVec 32)) SeekEntryResult!3793)

(assert (=> b!492608 (= e!289359 (= (seekEntryOrOpen!0 (select (arr!15329 a!3235) j!176) a!3235 mask!3524) (Found!3793 j!176)))))

(declare-fun b!492609 () Bool)

(declare-fun res!295320 () Bool)

(declare-fun e!289360 () Bool)

(assert (=> b!492609 (=> (not res!295320) (not e!289360))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492609 (= res!295320 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492610 () Bool)

(declare-fun res!295326 () Bool)

(assert (=> b!492610 (=> (not res!295326) (not e!289360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492610 (= res!295326 (validKeyInArray!0 k0!2280))))

(declare-fun res!295325 () Bool)

(assert (=> start!44934 (=> (not res!295325) (not e!289360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44934 (= res!295325 (validMask!0 mask!3524))))

(assert (=> start!44934 e!289360))

(assert (=> start!44934 true))

(declare-fun array_inv!11212 (array!31889) Bool)

(assert (=> start!44934 (array_inv!11212 a!3235)))

(declare-fun b!492611 () Bool)

(declare-fun res!295321 () Bool)

(declare-fun e!289362 () Bool)

(assert (=> b!492611 (=> (not res!295321) (not e!289362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31889 (_ BitVec 32)) Bool)

(assert (=> b!492611 (= res!295321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492612 () Bool)

(assert (=> b!492612 (= e!289360 e!289362)))

(declare-fun res!295322 () Bool)

(assert (=> b!492612 (=> (not res!295322) (not e!289362))))

(declare-fun lt!222587 () SeekEntryResult!3793)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492612 (= res!295322 (or (= lt!222587 (MissingZero!3793 i!1204)) (= lt!222587 (MissingVacant!3793 i!1204))))))

(assert (=> b!492612 (= lt!222587 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492613 () Bool)

(declare-fun res!295328 () Bool)

(assert (=> b!492613 (=> (not res!295328) (not e!289360))))

(assert (=> b!492613 (= res!295328 (validKeyInArray!0 (select (arr!15329 a!3235) j!176)))))

(declare-fun b!492614 () Bool)

(assert (=> b!492614 (= e!289362 (not true))))

(declare-fun lt!222584 () (_ BitVec 32))

(declare-fun lt!222588 () SeekEntryResult!3793)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31889 (_ BitVec 32)) SeekEntryResult!3793)

(assert (=> b!492614 (= lt!222588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222584 (select (store (arr!15329 a!3235) i!1204 k0!2280) j!176) (array!31890 (store (arr!15329 a!3235) i!1204 k0!2280) (size!15694 a!3235)) mask!3524))))

(declare-fun lt!222586 () SeekEntryResult!3793)

(declare-fun lt!222589 () (_ BitVec 32))

(assert (=> b!492614 (= lt!222586 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222589 (select (arr!15329 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492614 (= lt!222584 (toIndex!0 (select (store (arr!15329 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492614 (= lt!222589 (toIndex!0 (select (arr!15329 a!3235) j!176) mask!3524))))

(assert (=> b!492614 e!289359))

(declare-fun res!295324 () Bool)

(assert (=> b!492614 (=> (not res!295324) (not e!289359))))

(assert (=> b!492614 (= res!295324 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14518 0))(
  ( (Unit!14519) )
))
(declare-fun lt!222585 () Unit!14518)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14518)

(assert (=> b!492614 (= lt!222585 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492615 () Bool)

(declare-fun res!295323 () Bool)

(assert (=> b!492615 (=> (not res!295323) (not e!289360))))

(assert (=> b!492615 (= res!295323 (and (= (size!15694 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15694 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15694 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492616 () Bool)

(declare-fun res!295327 () Bool)

(assert (=> b!492616 (=> (not res!295327) (not e!289362))))

(declare-datatypes ((List!9526 0))(
  ( (Nil!9523) (Cons!9522 (h!10390 (_ BitVec 64)) (t!15745 List!9526)) )
))
(declare-fun arrayNoDuplicates!0 (array!31889 (_ BitVec 32) List!9526) Bool)

(assert (=> b!492616 (= res!295327 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9523))))

(assert (= (and start!44934 res!295325) b!492615))

(assert (= (and b!492615 res!295323) b!492613))

(assert (= (and b!492613 res!295328) b!492610))

(assert (= (and b!492610 res!295326) b!492609))

(assert (= (and b!492609 res!295320) b!492612))

(assert (= (and b!492612 res!295322) b!492611))

(assert (= (and b!492611 res!295321) b!492616))

(assert (= (and b!492616 res!295327) b!492614))

(assert (= (and b!492614 res!295324) b!492608))

(declare-fun m!472807 () Bool)

(assert (=> b!492609 m!472807))

(declare-fun m!472809 () Bool)

(assert (=> b!492616 m!472809))

(declare-fun m!472811 () Bool)

(assert (=> b!492610 m!472811))

(declare-fun m!472813 () Bool)

(assert (=> b!492613 m!472813))

(assert (=> b!492613 m!472813))

(declare-fun m!472815 () Bool)

(assert (=> b!492613 m!472815))

(declare-fun m!472817 () Bool)

(assert (=> start!44934 m!472817))

(declare-fun m!472819 () Bool)

(assert (=> start!44934 m!472819))

(assert (=> b!492608 m!472813))

(assert (=> b!492608 m!472813))

(declare-fun m!472821 () Bool)

(assert (=> b!492608 m!472821))

(declare-fun m!472823 () Bool)

(assert (=> b!492611 m!472823))

(declare-fun m!472825 () Bool)

(assert (=> b!492612 m!472825))

(declare-fun m!472827 () Bool)

(assert (=> b!492614 m!472827))

(declare-fun m!472829 () Bool)

(assert (=> b!492614 m!472829))

(declare-fun m!472831 () Bool)

(assert (=> b!492614 m!472831))

(assert (=> b!492614 m!472813))

(declare-fun m!472833 () Bool)

(assert (=> b!492614 m!472833))

(assert (=> b!492614 m!472831))

(declare-fun m!472835 () Bool)

(assert (=> b!492614 m!472835))

(assert (=> b!492614 m!472831))

(declare-fun m!472837 () Bool)

(assert (=> b!492614 m!472837))

(assert (=> b!492614 m!472813))

(assert (=> b!492614 m!472813))

(declare-fun m!472839 () Bool)

(assert (=> b!492614 m!472839))

(declare-fun m!472841 () Bool)

(assert (=> b!492614 m!472841))

(check-sat (not b!492614) (not b!492610) (not b!492616) (not b!492611) (not start!44934) (not b!492608) (not b!492609) (not b!492612) (not b!492613))
(check-sat)
