; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45962 () Bool)

(assert start!45962)

(declare-fun b!508860 () Bool)

(declare-fun res!309763 () Bool)

(declare-fun e!297651 () Bool)

(assert (=> b!508860 (=> (not res!309763) (not e!297651))))

(declare-datatypes ((array!32674 0))(
  ( (array!32675 (arr!15715 (Array (_ BitVec 32) (_ BitVec 64))) (size!16079 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32674)

(declare-datatypes ((List!9780 0))(
  ( (Nil!9777) (Cons!9776 (h!10653 (_ BitVec 64)) (t!16000 List!9780)) )
))
(declare-fun arrayNoDuplicates!0 (array!32674 (_ BitVec 32) List!9780) Bool)

(assert (=> b!508860 (= res!309763 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9777))))

(declare-fun b!508861 () Bool)

(assert (=> b!508861 (= e!297651 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!232403 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508861 (= lt!232403 (toIndex!0 (select (store (arr!15715 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!297652 () Bool)

(assert (=> b!508861 e!297652))

(declare-fun res!309761 () Bool)

(assert (=> b!508861 (=> (not res!309761) (not e!297652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32674 (_ BitVec 32)) Bool)

(assert (=> b!508861 (= res!309761 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15595 0))(
  ( (Unit!15596) )
))
(declare-fun lt!232404 () Unit!15595)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15595)

(assert (=> b!508861 (= lt!232404 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508862 () Bool)

(declare-fun res!309766 () Bool)

(declare-fun e!297654 () Bool)

(assert (=> b!508862 (=> (not res!309766) (not e!297654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508862 (= res!309766 (validKeyInArray!0 (select (arr!15715 a!3235) j!176)))))

(declare-fun b!508863 () Bool)

(assert (=> b!508863 (= e!297654 e!297651)))

(declare-fun res!309764 () Bool)

(assert (=> b!508863 (=> (not res!309764) (not e!297651))))

(declare-datatypes ((SeekEntryResult!4138 0))(
  ( (MissingZero!4138 (index!18740 (_ BitVec 32))) (Found!4138 (index!18741 (_ BitVec 32))) (Intermediate!4138 (undefined!4950 Bool) (index!18742 (_ BitVec 32)) (x!47864 (_ BitVec 32))) (Undefined!4138) (MissingVacant!4138 (index!18743 (_ BitVec 32))) )
))
(declare-fun lt!232405 () SeekEntryResult!4138)

(assert (=> b!508863 (= res!309764 (or (= lt!232405 (MissingZero!4138 i!1204)) (= lt!232405 (MissingVacant!4138 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32674 (_ BitVec 32)) SeekEntryResult!4138)

(assert (=> b!508863 (= lt!232405 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508864 () Bool)

(declare-fun res!309759 () Bool)

(assert (=> b!508864 (=> (not res!309759) (not e!297654))))

(assert (=> b!508864 (= res!309759 (validKeyInArray!0 k0!2280))))

(declare-fun b!508865 () Bool)

(declare-fun res!309758 () Bool)

(assert (=> b!508865 (=> (not res!309758) (not e!297654))))

(assert (=> b!508865 (= res!309758 (and (= (size!16079 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16079 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16079 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508866 () Bool)

(declare-fun res!309760 () Bool)

(assert (=> b!508866 (=> (not res!309760) (not e!297654))))

(declare-fun arrayContainsKey!0 (array!32674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508866 (= res!309760 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508867 () Bool)

(assert (=> b!508867 (= e!297652 (= (seekEntryOrOpen!0 (select (arr!15715 a!3235) j!176) a!3235 mask!3524) (Found!4138 j!176)))))

(declare-fun b!508859 () Bool)

(declare-fun res!309762 () Bool)

(assert (=> b!508859 (=> (not res!309762) (not e!297651))))

(assert (=> b!508859 (= res!309762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!309765 () Bool)

(assert (=> start!45962 (=> (not res!309765) (not e!297654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45962 (= res!309765 (validMask!0 mask!3524))))

(assert (=> start!45962 e!297654))

(assert (=> start!45962 true))

(declare-fun array_inv!11574 (array!32674) Bool)

(assert (=> start!45962 (array_inv!11574 a!3235)))

(assert (= (and start!45962 res!309765) b!508865))

(assert (= (and b!508865 res!309758) b!508862))

(assert (= (and b!508862 res!309766) b!508864))

(assert (= (and b!508864 res!309759) b!508866))

(assert (= (and b!508866 res!309760) b!508863))

(assert (= (and b!508863 res!309764) b!508859))

(assert (= (and b!508859 res!309762) b!508860))

(assert (= (and b!508860 res!309763) b!508861))

(assert (= (and b!508861 res!309761) b!508867))

(declare-fun m!489835 () Bool)

(assert (=> b!508863 m!489835))

(declare-fun m!489837 () Bool)

(assert (=> start!45962 m!489837))

(declare-fun m!489839 () Bool)

(assert (=> start!45962 m!489839))

(declare-fun m!489841 () Bool)

(assert (=> b!508867 m!489841))

(assert (=> b!508867 m!489841))

(declare-fun m!489843 () Bool)

(assert (=> b!508867 m!489843))

(declare-fun m!489845 () Bool)

(assert (=> b!508861 m!489845))

(declare-fun m!489847 () Bool)

(assert (=> b!508861 m!489847))

(declare-fun m!489849 () Bool)

(assert (=> b!508861 m!489849))

(declare-fun m!489851 () Bool)

(assert (=> b!508861 m!489851))

(assert (=> b!508861 m!489849))

(declare-fun m!489853 () Bool)

(assert (=> b!508861 m!489853))

(declare-fun m!489855 () Bool)

(assert (=> b!508859 m!489855))

(declare-fun m!489857 () Bool)

(assert (=> b!508860 m!489857))

(assert (=> b!508862 m!489841))

(assert (=> b!508862 m!489841))

(declare-fun m!489859 () Bool)

(assert (=> b!508862 m!489859))

(declare-fun m!489861 () Bool)

(assert (=> b!508866 m!489861))

(declare-fun m!489863 () Bool)

(assert (=> b!508864 m!489863))

(check-sat (not b!508861) (not b!508859) (not start!45962) (not b!508863) (not b!508864) (not b!508867) (not b!508862) (not b!508866) (not b!508860))
(check-sat)
