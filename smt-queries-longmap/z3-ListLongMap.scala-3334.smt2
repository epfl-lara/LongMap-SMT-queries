; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45986 () Bool)

(assert start!45986)

(declare-fun b!509183 () Bool)

(declare-fun res!310087 () Bool)

(declare-fun e!297797 () Bool)

(assert (=> b!509183 (=> (not res!310087) (not e!297797))))

(declare-datatypes ((array!32698 0))(
  ( (array!32699 (arr!15727 (Array (_ BitVec 32) (_ BitVec 64))) (size!16091 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32698)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32698 (_ BitVec 32)) Bool)

(assert (=> b!509183 (= res!310087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!310086 () Bool)

(declare-fun e!297798 () Bool)

(assert (=> start!45986 (=> (not res!310086) (not e!297798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45986 (= res!310086 (validMask!0 mask!3524))))

(assert (=> start!45986 e!297798))

(assert (=> start!45986 true))

(declare-fun array_inv!11586 (array!32698) Bool)

(assert (=> start!45986 (array_inv!11586 a!3235)))

(declare-fun b!509184 () Bool)

(declare-fun res!310084 () Bool)

(assert (=> b!509184 (=> (not res!310084) (not e!297798))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509184 (= res!310084 (and (= (size!16091 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16091 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16091 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509185 () Bool)

(assert (=> b!509185 (= e!297797 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4150 0))(
  ( (MissingZero!4150 (index!18788 (_ BitVec 32))) (Found!4150 (index!18789 (_ BitVec 32))) (Intermediate!4150 (undefined!4962 Bool) (index!18790 (_ BitVec 32)) (x!47908 (_ BitVec 32))) (Undefined!4150) (MissingVacant!4150 (index!18791 (_ BitVec 32))) )
))
(declare-fun lt!232601 () SeekEntryResult!4150)

(declare-fun lt!232600 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32698 (_ BitVec 32)) SeekEntryResult!4150)

(assert (=> b!509185 (= lt!232601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232600 (select (store (arr!15727 a!3235) i!1204 k0!2280) j!176) (array!32699 (store (arr!15727 a!3235) i!1204 k0!2280) (size!16091 a!3235)) mask!3524))))

(declare-fun lt!232602 () SeekEntryResult!4150)

(declare-fun lt!232599 () (_ BitVec 32))

(assert (=> b!509185 (= lt!232602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232599 (select (arr!15727 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509185 (= lt!232600 (toIndex!0 (select (store (arr!15727 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509185 (= lt!232599 (toIndex!0 (select (arr!15727 a!3235) j!176) mask!3524))))

(declare-fun e!297796 () Bool)

(assert (=> b!509185 e!297796))

(declare-fun res!310088 () Bool)

(assert (=> b!509185 (=> (not res!310088) (not e!297796))))

(assert (=> b!509185 (= res!310088 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15619 0))(
  ( (Unit!15620) )
))
(declare-fun lt!232603 () Unit!15619)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15619)

(assert (=> b!509185 (= lt!232603 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509186 () Bool)

(declare-fun res!310089 () Bool)

(assert (=> b!509186 (=> (not res!310089) (not e!297798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509186 (= res!310089 (validKeyInArray!0 k0!2280))))

(declare-fun b!509187 () Bool)

(assert (=> b!509187 (= e!297798 e!297797)))

(declare-fun res!310083 () Bool)

(assert (=> b!509187 (=> (not res!310083) (not e!297797))))

(declare-fun lt!232598 () SeekEntryResult!4150)

(assert (=> b!509187 (= res!310083 (or (= lt!232598 (MissingZero!4150 i!1204)) (= lt!232598 (MissingVacant!4150 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32698 (_ BitVec 32)) SeekEntryResult!4150)

(assert (=> b!509187 (= lt!232598 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509188 () Bool)

(declare-fun res!310085 () Bool)

(assert (=> b!509188 (=> (not res!310085) (not e!297797))))

(declare-datatypes ((List!9792 0))(
  ( (Nil!9789) (Cons!9788 (h!10665 (_ BitVec 64)) (t!16012 List!9792)) )
))
(declare-fun arrayNoDuplicates!0 (array!32698 (_ BitVec 32) List!9792) Bool)

(assert (=> b!509188 (= res!310085 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9789))))

(declare-fun b!509189 () Bool)

(assert (=> b!509189 (= e!297796 (= (seekEntryOrOpen!0 (select (arr!15727 a!3235) j!176) a!3235 mask!3524) (Found!4150 j!176)))))

(declare-fun b!509190 () Bool)

(declare-fun res!310090 () Bool)

(assert (=> b!509190 (=> (not res!310090) (not e!297798))))

(declare-fun arrayContainsKey!0 (array!32698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509190 (= res!310090 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509191 () Bool)

(declare-fun res!310082 () Bool)

(assert (=> b!509191 (=> (not res!310082) (not e!297798))))

(assert (=> b!509191 (= res!310082 (validKeyInArray!0 (select (arr!15727 a!3235) j!176)))))

(assert (= (and start!45986 res!310086) b!509184))

(assert (= (and b!509184 res!310084) b!509191))

(assert (= (and b!509191 res!310082) b!509186))

(assert (= (and b!509186 res!310089) b!509190))

(assert (= (and b!509190 res!310090) b!509187))

(assert (= (and b!509187 res!310083) b!509183))

(assert (= (and b!509183 res!310087) b!509188))

(assert (= (and b!509188 res!310085) b!509185))

(assert (= (and b!509185 res!310088) b!509189))

(declare-fun m!490249 () Bool)

(assert (=> b!509186 m!490249))

(declare-fun m!490251 () Bool)

(assert (=> b!509191 m!490251))

(assert (=> b!509191 m!490251))

(declare-fun m!490253 () Bool)

(assert (=> b!509191 m!490253))

(declare-fun m!490255 () Bool)

(assert (=> b!509190 m!490255))

(declare-fun m!490257 () Bool)

(assert (=> b!509185 m!490257))

(declare-fun m!490259 () Bool)

(assert (=> b!509185 m!490259))

(declare-fun m!490261 () Bool)

(assert (=> b!509185 m!490261))

(assert (=> b!509185 m!490257))

(assert (=> b!509185 m!490251))

(declare-fun m!490263 () Bool)

(assert (=> b!509185 m!490263))

(assert (=> b!509185 m!490251))

(declare-fun m!490265 () Bool)

(assert (=> b!509185 m!490265))

(assert (=> b!509185 m!490257))

(declare-fun m!490267 () Bool)

(assert (=> b!509185 m!490267))

(declare-fun m!490269 () Bool)

(assert (=> b!509185 m!490269))

(assert (=> b!509185 m!490251))

(declare-fun m!490271 () Bool)

(assert (=> b!509185 m!490271))

(declare-fun m!490273 () Bool)

(assert (=> b!509183 m!490273))

(assert (=> b!509189 m!490251))

(assert (=> b!509189 m!490251))

(declare-fun m!490275 () Bool)

(assert (=> b!509189 m!490275))

(declare-fun m!490277 () Bool)

(assert (=> b!509187 m!490277))

(declare-fun m!490279 () Bool)

(assert (=> b!509188 m!490279))

(declare-fun m!490281 () Bool)

(assert (=> start!45986 m!490281))

(declare-fun m!490283 () Bool)

(assert (=> start!45986 m!490283))

(check-sat (not b!509187) (not b!509191) (not b!509183) (not b!509186) (not b!509190) (not b!509189) (not b!509185) (not start!45986) (not b!509188))
(check-sat)
