; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45980 () Bool)

(assert start!45980)

(declare-fun b!509102 () Bool)

(declare-fun res!310006 () Bool)

(declare-fun e!297760 () Bool)

(assert (=> b!509102 (=> (not res!310006) (not e!297760))))

(declare-datatypes ((array!32692 0))(
  ( (array!32693 (arr!15724 (Array (_ BitVec 32) (_ BitVec 64))) (size!16088 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32692)

(declare-datatypes ((List!9789 0))(
  ( (Nil!9786) (Cons!9785 (h!10662 (_ BitVec 64)) (t!16009 List!9789)) )
))
(declare-fun arrayNoDuplicates!0 (array!32692 (_ BitVec 32) List!9789) Bool)

(assert (=> b!509102 (= res!310006 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9786))))

(declare-fun res!310001 () Bool)

(declare-fun e!297762 () Bool)

(assert (=> start!45980 (=> (not res!310001) (not e!297762))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45980 (= res!310001 (validMask!0 mask!3524))))

(assert (=> start!45980 e!297762))

(assert (=> start!45980 true))

(declare-fun array_inv!11583 (array!32692) Bool)

(assert (=> start!45980 (array_inv!11583 a!3235)))

(declare-fun b!509103 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!297761 () Bool)

(declare-datatypes ((SeekEntryResult!4147 0))(
  ( (MissingZero!4147 (index!18776 (_ BitVec 32))) (Found!4147 (index!18777 (_ BitVec 32))) (Intermediate!4147 (undefined!4959 Bool) (index!18778 (_ BitVec 32)) (x!47897 (_ BitVec 32))) (Undefined!4147) (MissingVacant!4147 (index!18779 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32692 (_ BitVec 32)) SeekEntryResult!4147)

(assert (=> b!509103 (= e!297761 (= (seekEntryOrOpen!0 (select (arr!15724 a!3235) j!176) a!3235 mask!3524) (Found!4147 j!176)))))

(declare-fun b!509104 () Bool)

(assert (=> b!509104 (= e!297762 e!297760)))

(declare-fun res!310004 () Bool)

(assert (=> b!509104 (=> (not res!310004) (not e!297760))))

(declare-fun lt!232547 () SeekEntryResult!4147)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509104 (= res!310004 (or (= lt!232547 (MissingZero!4147 i!1204)) (= lt!232547 (MissingVacant!4147 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!509104 (= lt!232547 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509105 () Bool)

(assert (=> b!509105 (= e!297760 (not true))))

(declare-fun lt!232544 () SeekEntryResult!4147)

(declare-fun lt!232546 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32692 (_ BitVec 32)) SeekEntryResult!4147)

(assert (=> b!509105 (= lt!232544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232546 (select (store (arr!15724 a!3235) i!1204 k0!2280) j!176) (array!32693 (store (arr!15724 a!3235) i!1204 k0!2280) (size!16088 a!3235)) mask!3524))))

(declare-fun lt!232549 () (_ BitVec 32))

(declare-fun lt!232548 () SeekEntryResult!4147)

(assert (=> b!509105 (= lt!232548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232549 (select (arr!15724 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509105 (= lt!232546 (toIndex!0 (select (store (arr!15724 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509105 (= lt!232549 (toIndex!0 (select (arr!15724 a!3235) j!176) mask!3524))))

(assert (=> b!509105 e!297761))

(declare-fun res!310009 () Bool)

(assert (=> b!509105 (=> (not res!310009) (not e!297761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32692 (_ BitVec 32)) Bool)

(assert (=> b!509105 (= res!310009 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15613 0))(
  ( (Unit!15614) )
))
(declare-fun lt!232545 () Unit!15613)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15613)

(assert (=> b!509105 (= lt!232545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509106 () Bool)

(declare-fun res!310002 () Bool)

(assert (=> b!509106 (=> (not res!310002) (not e!297760))))

(assert (=> b!509106 (= res!310002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509107 () Bool)

(declare-fun res!310008 () Bool)

(assert (=> b!509107 (=> (not res!310008) (not e!297762))))

(assert (=> b!509107 (= res!310008 (and (= (size!16088 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16088 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16088 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509108 () Bool)

(declare-fun res!310003 () Bool)

(assert (=> b!509108 (=> (not res!310003) (not e!297762))))

(declare-fun arrayContainsKey!0 (array!32692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509108 (= res!310003 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509109 () Bool)

(declare-fun res!310007 () Bool)

(assert (=> b!509109 (=> (not res!310007) (not e!297762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509109 (= res!310007 (validKeyInArray!0 k0!2280))))

(declare-fun b!509110 () Bool)

(declare-fun res!310005 () Bool)

(assert (=> b!509110 (=> (not res!310005) (not e!297762))))

(assert (=> b!509110 (= res!310005 (validKeyInArray!0 (select (arr!15724 a!3235) j!176)))))

(assert (= (and start!45980 res!310001) b!509107))

(assert (= (and b!509107 res!310008) b!509110))

(assert (= (and b!509110 res!310005) b!509109))

(assert (= (and b!509109 res!310007) b!509108))

(assert (= (and b!509108 res!310003) b!509104))

(assert (= (and b!509104 res!310004) b!509106))

(assert (= (and b!509106 res!310002) b!509102))

(assert (= (and b!509102 res!310006) b!509105))

(assert (= (and b!509105 res!310009) b!509103))

(declare-fun m!490141 () Bool)

(assert (=> b!509109 m!490141))

(declare-fun m!490143 () Bool)

(assert (=> b!509108 m!490143))

(declare-fun m!490145 () Bool)

(assert (=> b!509102 m!490145))

(declare-fun m!490147 () Bool)

(assert (=> b!509106 m!490147))

(declare-fun m!490149 () Bool)

(assert (=> b!509103 m!490149))

(assert (=> b!509103 m!490149))

(declare-fun m!490151 () Bool)

(assert (=> b!509103 m!490151))

(assert (=> b!509110 m!490149))

(assert (=> b!509110 m!490149))

(declare-fun m!490153 () Bool)

(assert (=> b!509110 m!490153))

(declare-fun m!490155 () Bool)

(assert (=> start!45980 m!490155))

(declare-fun m!490157 () Bool)

(assert (=> start!45980 m!490157))

(declare-fun m!490159 () Bool)

(assert (=> b!509105 m!490159))

(declare-fun m!490161 () Bool)

(assert (=> b!509105 m!490161))

(assert (=> b!509105 m!490149))

(declare-fun m!490163 () Bool)

(assert (=> b!509105 m!490163))

(assert (=> b!509105 m!490149))

(declare-fun m!490165 () Bool)

(assert (=> b!509105 m!490165))

(assert (=> b!509105 m!490161))

(declare-fun m!490167 () Bool)

(assert (=> b!509105 m!490167))

(assert (=> b!509105 m!490161))

(declare-fun m!490169 () Bool)

(assert (=> b!509105 m!490169))

(assert (=> b!509105 m!490149))

(declare-fun m!490171 () Bool)

(assert (=> b!509105 m!490171))

(declare-fun m!490173 () Bool)

(assert (=> b!509105 m!490173))

(declare-fun m!490175 () Bool)

(assert (=> b!509104 m!490175))

(check-sat (not start!45980) (not b!509103) (not b!509102) (not b!509105) (not b!509109) (not b!509110) (not b!509108) (not b!509104) (not b!509106))
(check-sat)
