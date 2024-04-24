; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46238 () Bool)

(assert start!46238)

(declare-fun b!512149 () Bool)

(declare-fun e!299133 () Bool)

(declare-fun e!299134 () Bool)

(assert (=> b!512149 (= e!299133 (not e!299134))))

(declare-fun res!312870 () Bool)

(assert (=> b!512149 (=> res!312870 e!299134)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!234459 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4246 0))(
  ( (MissingZero!4246 (index!19172 (_ BitVec 32))) (Found!4246 (index!19173 (_ BitVec 32))) (Intermediate!4246 (undefined!5058 Bool) (index!19174 (_ BitVec 32)) (x!48266 (_ BitVec 32))) (Undefined!4246) (MissingVacant!4246 (index!19175 (_ BitVec 32))) )
))
(declare-fun lt!234457 () SeekEntryResult!4246)

(declare-datatypes ((array!32893 0))(
  ( (array!32894 (arr!15823 (Array (_ BitVec 32) (_ BitVec 64))) (size!16187 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32893)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32893 (_ BitVec 32)) SeekEntryResult!4246)

(assert (=> b!512149 (= res!312870 (= lt!234457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234459 (select (store (arr!15823 a!3235) i!1204 k0!2280) j!176) (array!32894 (store (arr!15823 a!3235) i!1204 k0!2280) (size!16187 a!3235)) mask!3524)))))

(declare-fun lt!234460 () (_ BitVec 32))

(assert (=> b!512149 (= lt!234457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234460 (select (arr!15823 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512149 (= lt!234459 (toIndex!0 (select (store (arr!15823 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512149 (= lt!234460 (toIndex!0 (select (arr!15823 a!3235) j!176) mask!3524))))

(declare-fun lt!234455 () SeekEntryResult!4246)

(assert (=> b!512149 (= lt!234455 (Found!4246 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32893 (_ BitVec 32)) SeekEntryResult!4246)

(assert (=> b!512149 (= lt!234455 (seekEntryOrOpen!0 (select (arr!15823 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32893 (_ BitVec 32)) Bool)

(assert (=> b!512149 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15811 0))(
  ( (Unit!15812) )
))
(declare-fun lt!234458 () Unit!15811)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15811)

(assert (=> b!512149 (= lt!234458 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512150 () Bool)

(declare-fun e!299136 () Bool)

(assert (=> b!512150 (= e!299136 e!299133)))

(declare-fun res!312871 () Bool)

(assert (=> b!512150 (=> (not res!312871) (not e!299133))))

(declare-fun lt!234456 () SeekEntryResult!4246)

(assert (=> b!512150 (= res!312871 (or (= lt!234456 (MissingZero!4246 i!1204)) (= lt!234456 (MissingVacant!4246 i!1204))))))

(assert (=> b!512150 (= lt!234456 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!312865 () Bool)

(assert (=> start!46238 (=> (not res!312865) (not e!299136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46238 (= res!312865 (validMask!0 mask!3524))))

(assert (=> start!46238 e!299136))

(assert (=> start!46238 true))

(declare-fun array_inv!11682 (array!32893) Bool)

(assert (=> start!46238 (array_inv!11682 a!3235)))

(declare-fun b!512151 () Bool)

(declare-fun res!312874 () Bool)

(assert (=> b!512151 (=> (not res!312874) (not e!299133))))

(assert (=> b!512151 (= res!312874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512152 () Bool)

(declare-fun res!312869 () Bool)

(assert (=> b!512152 (=> (not res!312869) (not e!299133))))

(declare-datatypes ((List!9888 0))(
  ( (Nil!9885) (Cons!9884 (h!10764 (_ BitVec 64)) (t!16108 List!9888)) )
))
(declare-fun arrayNoDuplicates!0 (array!32893 (_ BitVec 32) List!9888) Bool)

(assert (=> b!512152 (= res!312869 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9885))))

(declare-fun b!512153 () Bool)

(declare-fun res!312868 () Bool)

(assert (=> b!512153 (=> (not res!312868) (not e!299136))))

(assert (=> b!512153 (= res!312868 (and (= (size!16187 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16187 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16187 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512154 () Bool)

(declare-fun res!312872 () Bool)

(assert (=> b!512154 (=> (not res!312872) (not e!299136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512154 (= res!312872 (validKeyInArray!0 k0!2280))))

(declare-fun b!512155 () Bool)

(declare-fun res!312866 () Bool)

(assert (=> b!512155 (=> res!312866 e!299134)))

(get-info :version)

(assert (=> b!512155 (= res!312866 (or (not ((_ is Intermediate!4246) lt!234457)) (not (undefined!5058 lt!234457))))))

(declare-fun b!512156 () Bool)

(assert (=> b!512156 (= e!299134 true)))

(assert (=> b!512156 (= lt!234455 Undefined!4246)))

(declare-fun b!512157 () Bool)

(declare-fun res!312867 () Bool)

(assert (=> b!512157 (=> (not res!312867) (not e!299136))))

(declare-fun arrayContainsKey!0 (array!32893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512157 (= res!312867 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512158 () Bool)

(declare-fun res!312873 () Bool)

(assert (=> b!512158 (=> (not res!312873) (not e!299136))))

(assert (=> b!512158 (= res!312873 (validKeyInArray!0 (select (arr!15823 a!3235) j!176)))))

(assert (= (and start!46238 res!312865) b!512153))

(assert (= (and b!512153 res!312868) b!512158))

(assert (= (and b!512158 res!312873) b!512154))

(assert (= (and b!512154 res!312872) b!512157))

(assert (= (and b!512157 res!312867) b!512150))

(assert (= (and b!512150 res!312871) b!512151))

(assert (= (and b!512151 res!312874) b!512152))

(assert (= (and b!512152 res!312869) b!512149))

(assert (= (and b!512149 (not res!312870)) b!512155))

(assert (= (and b!512155 (not res!312866)) b!512156))

(declare-fun m!494005 () Bool)

(assert (=> b!512157 m!494005))

(declare-fun m!494007 () Bool)

(assert (=> b!512149 m!494007))

(declare-fun m!494009 () Bool)

(assert (=> b!512149 m!494009))

(declare-fun m!494011 () Bool)

(assert (=> b!512149 m!494011))

(declare-fun m!494013 () Bool)

(assert (=> b!512149 m!494013))

(declare-fun m!494015 () Bool)

(assert (=> b!512149 m!494015))

(assert (=> b!512149 m!494013))

(declare-fun m!494017 () Bool)

(assert (=> b!512149 m!494017))

(assert (=> b!512149 m!494013))

(declare-fun m!494019 () Bool)

(assert (=> b!512149 m!494019))

(assert (=> b!512149 m!494013))

(declare-fun m!494021 () Bool)

(assert (=> b!512149 m!494021))

(assert (=> b!512149 m!494011))

(declare-fun m!494023 () Bool)

(assert (=> b!512149 m!494023))

(assert (=> b!512149 m!494011))

(declare-fun m!494025 () Bool)

(assert (=> b!512149 m!494025))

(declare-fun m!494027 () Bool)

(assert (=> b!512151 m!494027))

(declare-fun m!494029 () Bool)

(assert (=> start!46238 m!494029))

(declare-fun m!494031 () Bool)

(assert (=> start!46238 m!494031))

(declare-fun m!494033 () Bool)

(assert (=> b!512150 m!494033))

(assert (=> b!512158 m!494013))

(assert (=> b!512158 m!494013))

(declare-fun m!494035 () Bool)

(assert (=> b!512158 m!494035))

(declare-fun m!494037 () Bool)

(assert (=> b!512152 m!494037))

(declare-fun m!494039 () Bool)

(assert (=> b!512154 m!494039))

(check-sat (not b!512152) (not start!46238) (not b!512149) (not b!512158) (not b!512150) (not b!512157) (not b!512154) (not b!512151))
(check-sat)
