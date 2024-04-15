; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46242 () Bool)

(assert start!46242)

(declare-fun b!512029 () Bool)

(declare-fun res!312838 () Bool)

(declare-fun e!299034 () Bool)

(assert (=> b!512029 (=> (not res!312838) (not e!299034))))

(declare-datatypes ((array!32906 0))(
  ( (array!32907 (arr!15830 (Array (_ BitVec 32) (_ BitVec 64))) (size!16195 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32906)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512029 (= res!312838 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512030 () Bool)

(declare-fun res!312836 () Bool)

(declare-fun e!299035 () Bool)

(assert (=> b!512030 (=> res!312836 e!299035)))

(declare-datatypes ((SeekEntryResult!4294 0))(
  ( (MissingZero!4294 (index!19364 (_ BitVec 32))) (Found!4294 (index!19365 (_ BitVec 32))) (Intermediate!4294 (undefined!5106 Bool) (index!19366 (_ BitVec 32)) (x!48320 (_ BitVec 32))) (Undefined!4294) (MissingVacant!4294 (index!19367 (_ BitVec 32))) )
))
(declare-fun lt!234266 () SeekEntryResult!4294)

(get-info :version)

(assert (=> b!512030 (= res!312836 (or (not ((_ is Intermediate!4294) lt!234266)) (not (undefined!5106 lt!234266))))))

(declare-fun b!512031 () Bool)

(declare-fun e!299037 () Bool)

(assert (=> b!512031 (= e!299034 e!299037)))

(declare-fun res!312842 () Bool)

(assert (=> b!512031 (=> (not res!312842) (not e!299037))))

(declare-fun lt!234263 () SeekEntryResult!4294)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512031 (= res!312842 (or (= lt!234263 (MissingZero!4294 i!1204)) (= lt!234263 (MissingVacant!4294 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32906 (_ BitVec 32)) SeekEntryResult!4294)

(assert (=> b!512031 (= lt!234263 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512032 () Bool)

(declare-fun res!312840 () Bool)

(assert (=> b!512032 (=> (not res!312840) (not e!299037))))

(declare-datatypes ((List!10027 0))(
  ( (Nil!10024) (Cons!10023 (h!10903 (_ BitVec 64)) (t!16246 List!10027)) )
))
(declare-fun arrayNoDuplicates!0 (array!32906 (_ BitVec 32) List!10027) Bool)

(assert (=> b!512032 (= res!312840 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10024))))

(declare-fun b!512033 () Bool)

(declare-fun res!312837 () Bool)

(assert (=> b!512033 (=> (not res!312837) (not e!299037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32906 (_ BitVec 32)) Bool)

(assert (=> b!512033 (= res!312837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512034 () Bool)

(declare-fun res!312833 () Bool)

(assert (=> b!512034 (=> (not res!312833) (not e!299034))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512034 (= res!312833 (validKeyInArray!0 (select (arr!15830 a!3235) j!176)))))

(declare-fun b!512035 () Bool)

(declare-fun res!312841 () Bool)

(assert (=> b!512035 (=> (not res!312841) (not e!299034))))

(assert (=> b!512035 (= res!312841 (validKeyInArray!0 k0!2280))))

(declare-fun res!312835 () Bool)

(assert (=> start!46242 (=> (not res!312835) (not e!299034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46242 (= res!312835 (validMask!0 mask!3524))))

(assert (=> start!46242 e!299034))

(assert (=> start!46242 true))

(declare-fun array_inv!11713 (array!32906) Bool)

(assert (=> start!46242 (array_inv!11713 a!3235)))

(declare-fun b!512036 () Bool)

(assert (=> b!512036 (= e!299037 (not e!299035))))

(declare-fun res!312839 () Bool)

(assert (=> b!512036 (=> res!312839 e!299035)))

(declare-fun lt!234268 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32906 (_ BitVec 32)) SeekEntryResult!4294)

(assert (=> b!512036 (= res!312839 (= lt!234266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234268 (select (store (arr!15830 a!3235) i!1204 k0!2280) j!176) (array!32907 (store (arr!15830 a!3235) i!1204 k0!2280) (size!16195 a!3235)) mask!3524)))))

(declare-fun lt!234264 () (_ BitVec 32))

(assert (=> b!512036 (= lt!234266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234264 (select (arr!15830 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512036 (= lt!234268 (toIndex!0 (select (store (arr!15830 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512036 (= lt!234264 (toIndex!0 (select (arr!15830 a!3235) j!176) mask!3524))))

(declare-fun lt!234265 () SeekEntryResult!4294)

(assert (=> b!512036 (= lt!234265 (Found!4294 j!176))))

(assert (=> b!512036 (= lt!234265 (seekEntryOrOpen!0 (select (arr!15830 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512036 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15832 0))(
  ( (Unit!15833) )
))
(declare-fun lt!234267 () Unit!15832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15832)

(assert (=> b!512036 (= lt!234267 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512037 () Bool)

(assert (=> b!512037 (= e!299035 true)))

(assert (=> b!512037 (= lt!234265 Undefined!4294)))

(declare-fun b!512038 () Bool)

(declare-fun res!312834 () Bool)

(assert (=> b!512038 (=> (not res!312834) (not e!299034))))

(assert (=> b!512038 (= res!312834 (and (= (size!16195 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16195 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16195 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46242 res!312835) b!512038))

(assert (= (and b!512038 res!312834) b!512034))

(assert (= (and b!512034 res!312833) b!512035))

(assert (= (and b!512035 res!312841) b!512029))

(assert (= (and b!512029 res!312838) b!512031))

(assert (= (and b!512031 res!312842) b!512033))

(assert (= (and b!512033 res!312837) b!512032))

(assert (= (and b!512032 res!312840) b!512036))

(assert (= (and b!512036 (not res!312839)) b!512030))

(assert (= (and b!512030 (not res!312836)) b!512037))

(declare-fun m!493177 () Bool)

(assert (=> b!512033 m!493177))

(declare-fun m!493179 () Bool)

(assert (=> start!46242 m!493179))

(declare-fun m!493181 () Bool)

(assert (=> start!46242 m!493181))

(declare-fun m!493183 () Bool)

(assert (=> b!512032 m!493183))

(declare-fun m!493185 () Bool)

(assert (=> b!512031 m!493185))

(declare-fun m!493187 () Bool)

(assert (=> b!512029 m!493187))

(declare-fun m!493189 () Bool)

(assert (=> b!512034 m!493189))

(assert (=> b!512034 m!493189))

(declare-fun m!493191 () Bool)

(assert (=> b!512034 m!493191))

(declare-fun m!493193 () Bool)

(assert (=> b!512035 m!493193))

(declare-fun m!493195 () Bool)

(assert (=> b!512036 m!493195))

(declare-fun m!493197 () Bool)

(assert (=> b!512036 m!493197))

(declare-fun m!493199 () Bool)

(assert (=> b!512036 m!493199))

(assert (=> b!512036 m!493189))

(declare-fun m!493201 () Bool)

(assert (=> b!512036 m!493201))

(assert (=> b!512036 m!493189))

(declare-fun m!493203 () Bool)

(assert (=> b!512036 m!493203))

(assert (=> b!512036 m!493189))

(declare-fun m!493205 () Bool)

(assert (=> b!512036 m!493205))

(assert (=> b!512036 m!493199))

(declare-fun m!493207 () Bool)

(assert (=> b!512036 m!493207))

(assert (=> b!512036 m!493199))

(declare-fun m!493209 () Bool)

(assert (=> b!512036 m!493209))

(assert (=> b!512036 m!493189))

(declare-fun m!493211 () Bool)

(assert (=> b!512036 m!493211))

(check-sat (not b!512031) (not b!512033) (not b!512029) (not b!512034) (not start!46242) (not b!512036) (not b!512032) (not b!512035))
(check-sat)
