; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45866 () Bool)

(assert start!45866)

(declare-fun b!508016 () Bool)

(declare-fun res!308978 () Bool)

(declare-fun e!297265 () Bool)

(assert (=> b!508016 (=> (not res!308978) (not e!297265))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508016 (= res!308978 (validKeyInArray!0 k0!2280))))

(declare-fun res!308976 () Bool)

(assert (=> start!45866 (=> (not res!308976) (not e!297265))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45866 (= res!308976 (validMask!0 mask!3524))))

(assert (=> start!45866 e!297265))

(assert (=> start!45866 true))

(declare-datatypes ((array!32622 0))(
  ( (array!32623 (arr!15691 (Array (_ BitVec 32) (_ BitVec 64))) (size!16055 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32622)

(declare-fun array_inv!11487 (array!32622) Bool)

(assert (=> start!45866 (array_inv!11487 a!3235)))

(declare-fun b!508017 () Bool)

(declare-fun res!308975 () Bool)

(declare-fun e!297267 () Bool)

(assert (=> b!508017 (=> (not res!308975) (not e!297267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32622 (_ BitVec 32)) Bool)

(assert (=> b!508017 (= res!308975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508018 () Bool)

(declare-fun res!308980 () Bool)

(assert (=> b!508018 (=> (not res!308980) (not e!297265))))

(declare-fun arrayContainsKey!0 (array!32622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508018 (= res!308980 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508019 () Bool)

(declare-fun res!308979 () Bool)

(assert (=> b!508019 (=> (not res!308979) (not e!297265))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508019 (= res!308979 (and (= (size!16055 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16055 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16055 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508020 () Bool)

(assert (=> b!508020 (= e!297267 false)))

(declare-fun lt!232143 () Bool)

(declare-datatypes ((List!9849 0))(
  ( (Nil!9846) (Cons!9845 (h!10722 (_ BitVec 64)) (t!16077 List!9849)) )
))
(declare-fun arrayNoDuplicates!0 (array!32622 (_ BitVec 32) List!9849) Bool)

(assert (=> b!508020 (= lt!232143 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9846))))

(declare-fun b!508021 () Bool)

(assert (=> b!508021 (= e!297265 e!297267)))

(declare-fun res!308981 () Bool)

(assert (=> b!508021 (=> (not res!308981) (not e!297267))))

(declare-datatypes ((SeekEntryResult!4158 0))(
  ( (MissingZero!4158 (index!18820 (_ BitVec 32))) (Found!4158 (index!18821 (_ BitVec 32))) (Intermediate!4158 (undefined!4970 Bool) (index!18822 (_ BitVec 32)) (x!47807 (_ BitVec 32))) (Undefined!4158) (MissingVacant!4158 (index!18823 (_ BitVec 32))) )
))
(declare-fun lt!232144 () SeekEntryResult!4158)

(assert (=> b!508021 (= res!308981 (or (= lt!232144 (MissingZero!4158 i!1204)) (= lt!232144 (MissingVacant!4158 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32622 (_ BitVec 32)) SeekEntryResult!4158)

(assert (=> b!508021 (= lt!232144 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508022 () Bool)

(declare-fun res!308977 () Bool)

(assert (=> b!508022 (=> (not res!308977) (not e!297265))))

(assert (=> b!508022 (= res!308977 (validKeyInArray!0 (select (arr!15691 a!3235) j!176)))))

(assert (= (and start!45866 res!308976) b!508019))

(assert (= (and b!508019 res!308979) b!508022))

(assert (= (and b!508022 res!308977) b!508016))

(assert (= (and b!508016 res!308978) b!508018))

(assert (= (and b!508018 res!308980) b!508021))

(assert (= (and b!508021 res!308981) b!508017))

(assert (= (and b!508017 res!308975) b!508020))

(declare-fun m!488859 () Bool)

(assert (=> b!508017 m!488859))

(declare-fun m!488861 () Bool)

(assert (=> b!508018 m!488861))

(declare-fun m!488863 () Bool)

(assert (=> b!508021 m!488863))

(declare-fun m!488865 () Bool)

(assert (=> b!508022 m!488865))

(assert (=> b!508022 m!488865))

(declare-fun m!488867 () Bool)

(assert (=> b!508022 m!488867))

(declare-fun m!488869 () Bool)

(assert (=> b!508016 m!488869))

(declare-fun m!488871 () Bool)

(assert (=> start!45866 m!488871))

(declare-fun m!488873 () Bool)

(assert (=> start!45866 m!488873))

(declare-fun m!488875 () Bool)

(assert (=> b!508020 m!488875))

(check-sat (not b!508020) (not b!508022) (not b!508017) (not b!508021) (not b!508016) (not b!508018) (not start!45866))
(check-sat)
