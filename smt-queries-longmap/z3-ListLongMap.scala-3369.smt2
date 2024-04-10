; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46268 () Bool)

(assert start!46268)

(declare-fun b!512510 () Bool)

(declare-fun res!313180 () Bool)

(declare-fun e!299292 () Bool)

(assert (=> b!512510 (=> (not res!313180) (not e!299292))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512510 (= res!313180 (validKeyInArray!0 k0!2280))))

(declare-fun b!512511 () Bool)

(declare-fun e!299295 () Bool)

(assert (=> b!512511 (= e!299292 e!299295)))

(declare-fun res!313174 () Bool)

(assert (=> b!512511 (=> (not res!313174) (not e!299295))))

(declare-datatypes ((SeekEntryResult!4305 0))(
  ( (MissingZero!4305 (index!19408 (_ BitVec 32))) (Found!4305 (index!19409 (_ BitVec 32))) (Intermediate!4305 (undefined!5117 Bool) (index!19410 (_ BitVec 32)) (x!48352 (_ BitVec 32))) (Undefined!4305) (MissingVacant!4305 (index!19411 (_ BitVec 32))) )
))
(declare-fun lt!234625 () SeekEntryResult!4305)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512511 (= res!313174 (or (= lt!234625 (MissingZero!4305 i!1204)) (= lt!234625 (MissingVacant!4305 i!1204))))))

(declare-datatypes ((array!32922 0))(
  ( (array!32923 (arr!15838 (Array (_ BitVec 32) (_ BitVec 64))) (size!16202 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32922)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32922 (_ BitVec 32)) SeekEntryResult!4305)

(assert (=> b!512511 (= lt!234625 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512512 () Bool)

(declare-fun e!299293 () Bool)

(assert (=> b!512512 (= e!299293 true)))

(declare-fun lt!234623 () SeekEntryResult!4305)

(assert (=> b!512512 (= lt!234623 Undefined!4305)))

(declare-fun b!512513 () Bool)

(assert (=> b!512513 (= e!299295 (not e!299293))))

(declare-fun res!313178 () Bool)

(assert (=> b!512513 (=> res!313178 e!299293)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!234626 () SeekEntryResult!4305)

(declare-fun lt!234628 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32922 (_ BitVec 32)) SeekEntryResult!4305)

(assert (=> b!512513 (= res!313178 (= lt!234626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234628 (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176) (array!32923 (store (arr!15838 a!3235) i!1204 k0!2280) (size!16202 a!3235)) mask!3524)))))

(declare-fun lt!234627 () (_ BitVec 32))

(assert (=> b!512513 (= lt!234626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234627 (select (arr!15838 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512513 (= lt!234628 (toIndex!0 (select (store (arr!15838 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512513 (= lt!234627 (toIndex!0 (select (arr!15838 a!3235) j!176) mask!3524))))

(assert (=> b!512513 (= lt!234623 (Found!4305 j!176))))

(assert (=> b!512513 (= lt!234623 (seekEntryOrOpen!0 (select (arr!15838 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32922 (_ BitVec 32)) Bool)

(assert (=> b!512513 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15868 0))(
  ( (Unit!15869) )
))
(declare-fun lt!234624 () Unit!15868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15868)

(assert (=> b!512513 (= lt!234624 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512514 () Bool)

(declare-fun res!313181 () Bool)

(assert (=> b!512514 (=> (not res!313181) (not e!299292))))

(assert (=> b!512514 (= res!313181 (validKeyInArray!0 (select (arr!15838 a!3235) j!176)))))

(declare-fun res!313173 () Bool)

(assert (=> start!46268 (=> (not res!313173) (not e!299292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46268 (= res!313173 (validMask!0 mask!3524))))

(assert (=> start!46268 e!299292))

(assert (=> start!46268 true))

(declare-fun array_inv!11634 (array!32922) Bool)

(assert (=> start!46268 (array_inv!11634 a!3235)))

(declare-fun b!512515 () Bool)

(declare-fun res!313179 () Bool)

(assert (=> b!512515 (=> (not res!313179) (not e!299295))))

(declare-datatypes ((List!9996 0))(
  ( (Nil!9993) (Cons!9992 (h!10872 (_ BitVec 64)) (t!16224 List!9996)) )
))
(declare-fun arrayNoDuplicates!0 (array!32922 (_ BitVec 32) List!9996) Bool)

(assert (=> b!512515 (= res!313179 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9993))))

(declare-fun b!512516 () Bool)

(declare-fun res!313176 () Bool)

(assert (=> b!512516 (=> (not res!313176) (not e!299295))))

(assert (=> b!512516 (= res!313176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512517 () Bool)

(declare-fun res!313172 () Bool)

(assert (=> b!512517 (=> (not res!313172) (not e!299292))))

(assert (=> b!512517 (= res!313172 (and (= (size!16202 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16202 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16202 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512518 () Bool)

(declare-fun res!313175 () Bool)

(assert (=> b!512518 (=> (not res!313175) (not e!299292))))

(declare-fun arrayContainsKey!0 (array!32922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512518 (= res!313175 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512519 () Bool)

(declare-fun res!313177 () Bool)

(assert (=> b!512519 (=> res!313177 e!299293)))

(get-info :version)

(assert (=> b!512519 (= res!313177 (or (not ((_ is Intermediate!4305) lt!234626)) (not (undefined!5117 lt!234626))))))

(assert (= (and start!46268 res!313173) b!512517))

(assert (= (and b!512517 res!313172) b!512514))

(assert (= (and b!512514 res!313181) b!512510))

(assert (= (and b!512510 res!313180) b!512518))

(assert (= (and b!512518 res!313175) b!512511))

(assert (= (and b!512511 res!313174) b!512516))

(assert (= (and b!512516 res!313176) b!512515))

(assert (= (and b!512515 res!313179) b!512513))

(assert (= (and b!512513 (not res!313178)) b!512519))

(assert (= (and b!512519 (not res!313177)) b!512512))

(declare-fun m!494181 () Bool)

(assert (=> b!512514 m!494181))

(assert (=> b!512514 m!494181))

(declare-fun m!494183 () Bool)

(assert (=> b!512514 m!494183))

(declare-fun m!494185 () Bool)

(assert (=> b!512515 m!494185))

(declare-fun m!494187 () Bool)

(assert (=> start!46268 m!494187))

(declare-fun m!494189 () Bool)

(assert (=> start!46268 m!494189))

(declare-fun m!494191 () Bool)

(assert (=> b!512513 m!494191))

(declare-fun m!494193 () Bool)

(assert (=> b!512513 m!494193))

(declare-fun m!494195 () Bool)

(assert (=> b!512513 m!494195))

(assert (=> b!512513 m!494181))

(declare-fun m!494197 () Bool)

(assert (=> b!512513 m!494197))

(assert (=> b!512513 m!494195))

(declare-fun m!494199 () Bool)

(assert (=> b!512513 m!494199))

(assert (=> b!512513 m!494181))

(declare-fun m!494201 () Bool)

(assert (=> b!512513 m!494201))

(assert (=> b!512513 m!494181))

(declare-fun m!494203 () Bool)

(assert (=> b!512513 m!494203))

(assert (=> b!512513 m!494181))

(declare-fun m!494205 () Bool)

(assert (=> b!512513 m!494205))

(assert (=> b!512513 m!494195))

(declare-fun m!494207 () Bool)

(assert (=> b!512513 m!494207))

(declare-fun m!494209 () Bool)

(assert (=> b!512518 m!494209))

(declare-fun m!494211 () Bool)

(assert (=> b!512516 m!494211))

(declare-fun m!494213 () Bool)

(assert (=> b!512511 m!494213))

(declare-fun m!494215 () Bool)

(assert (=> b!512510 m!494215))

(check-sat (not b!512513) (not b!512511) (not start!46268) (not b!512515) (not b!512510) (not b!512518) (not b!512516) (not b!512514))
(check-sat)
