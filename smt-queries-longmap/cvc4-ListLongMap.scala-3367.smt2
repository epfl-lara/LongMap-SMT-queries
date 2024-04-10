; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46258 () Bool)

(assert start!46258)

(declare-fun b!512360 () Bool)

(declare-fun res!313022 () Bool)

(declare-fun e!299235 () Bool)

(assert (=> b!512360 (=> (not res!313022) (not e!299235))))

(declare-datatypes ((array!32912 0))(
  ( (array!32913 (arr!15833 (Array (_ BitVec 32) (_ BitVec 64))) (size!16197 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32912)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512360 (= res!313022 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512361 () Bool)

(declare-fun res!313028 () Bool)

(assert (=> b!512361 (=> (not res!313028) (not e!299235))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512361 (= res!313028 (and (= (size!16197 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16197 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16197 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512362 () Bool)

(declare-fun res!313029 () Bool)

(declare-fun e!299234 () Bool)

(assert (=> b!512362 (=> res!313029 e!299234)))

(declare-datatypes ((SeekEntryResult!4300 0))(
  ( (MissingZero!4300 (index!19388 (_ BitVec 32))) (Found!4300 (index!19389 (_ BitVec 32))) (Intermediate!4300 (undefined!5112 Bool) (index!19390 (_ BitVec 32)) (x!48331 (_ BitVec 32))) (Undefined!4300) (MissingVacant!4300 (index!19391 (_ BitVec 32))) )
))
(declare-fun lt!234537 () SeekEntryResult!4300)

(assert (=> b!512362 (= res!313029 (or (not (is-Intermediate!4300 lt!234537)) (not (undefined!5112 lt!234537))))))

(declare-fun b!512363 () Bool)

(declare-fun res!313023 () Bool)

(declare-fun e!299232 () Bool)

(assert (=> b!512363 (=> (not res!313023) (not e!299232))))

(declare-datatypes ((List!9991 0))(
  ( (Nil!9988) (Cons!9987 (h!10867 (_ BitVec 64)) (t!16219 List!9991)) )
))
(declare-fun arrayNoDuplicates!0 (array!32912 (_ BitVec 32) List!9991) Bool)

(assert (=> b!512363 (= res!313023 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9988))))

(declare-fun res!313026 () Bool)

(assert (=> start!46258 (=> (not res!313026) (not e!299235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46258 (= res!313026 (validMask!0 mask!3524))))

(assert (=> start!46258 e!299235))

(assert (=> start!46258 true))

(declare-fun array_inv!11629 (array!32912) Bool)

(assert (=> start!46258 (array_inv!11629 a!3235)))

(declare-fun b!512364 () Bool)

(assert (=> b!512364 (= e!299235 e!299232)))

(declare-fun res!313027 () Bool)

(assert (=> b!512364 (=> (not res!313027) (not e!299232))))

(declare-fun lt!234538 () SeekEntryResult!4300)

(assert (=> b!512364 (= res!313027 (or (= lt!234538 (MissingZero!4300 i!1204)) (= lt!234538 (MissingVacant!4300 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32912 (_ BitVec 32)) SeekEntryResult!4300)

(assert (=> b!512364 (= lt!234538 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512365 () Bool)

(declare-fun res!313024 () Bool)

(assert (=> b!512365 (=> (not res!313024) (not e!299232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32912 (_ BitVec 32)) Bool)

(assert (=> b!512365 (= res!313024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512366 () Bool)

(declare-fun res!313031 () Bool)

(assert (=> b!512366 (=> (not res!313031) (not e!299235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512366 (= res!313031 (validKeyInArray!0 (select (arr!15833 a!3235) j!176)))))

(declare-fun b!512367 () Bool)

(assert (=> b!512367 (= e!299232 (not e!299234))))

(declare-fun res!313030 () Bool)

(assert (=> b!512367 (=> res!313030 e!299234)))

(declare-fun lt!234536 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32912 (_ BitVec 32)) SeekEntryResult!4300)

(assert (=> b!512367 (= res!313030 (= lt!234537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234536 (select (store (arr!15833 a!3235) i!1204 k!2280) j!176) (array!32913 (store (arr!15833 a!3235) i!1204 k!2280) (size!16197 a!3235)) mask!3524)))))

(declare-fun lt!234533 () (_ BitVec 32))

(assert (=> b!512367 (= lt!234537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234533 (select (arr!15833 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512367 (= lt!234536 (toIndex!0 (select (store (arr!15833 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512367 (= lt!234533 (toIndex!0 (select (arr!15833 a!3235) j!176) mask!3524))))

(declare-fun lt!234535 () SeekEntryResult!4300)

(assert (=> b!512367 (= lt!234535 (Found!4300 j!176))))

(assert (=> b!512367 (= lt!234535 (seekEntryOrOpen!0 (select (arr!15833 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512367 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15858 0))(
  ( (Unit!15859) )
))
(declare-fun lt!234534 () Unit!15858)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15858)

(assert (=> b!512367 (= lt!234534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512368 () Bool)

(assert (=> b!512368 (= e!299234 true)))

(assert (=> b!512368 (= lt!234535 Undefined!4300)))

(declare-fun b!512369 () Bool)

(declare-fun res!313025 () Bool)

(assert (=> b!512369 (=> (not res!313025) (not e!299235))))

(assert (=> b!512369 (= res!313025 (validKeyInArray!0 k!2280))))

(assert (= (and start!46258 res!313026) b!512361))

(assert (= (and b!512361 res!313028) b!512366))

(assert (= (and b!512366 res!313031) b!512369))

(assert (= (and b!512369 res!313025) b!512360))

(assert (= (and b!512360 res!313022) b!512364))

(assert (= (and b!512364 res!313027) b!512365))

(assert (= (and b!512365 res!313024) b!512363))

(assert (= (and b!512363 res!313023) b!512367))

(assert (= (and b!512367 (not res!313030)) b!512362))

(assert (= (and b!512362 (not res!313029)) b!512368))

(declare-fun m!494001 () Bool)

(assert (=> b!512360 m!494001))

(declare-fun m!494003 () Bool)

(assert (=> start!46258 m!494003))

(declare-fun m!494005 () Bool)

(assert (=> start!46258 m!494005))

(declare-fun m!494007 () Bool)

(assert (=> b!512366 m!494007))

(assert (=> b!512366 m!494007))

(declare-fun m!494009 () Bool)

(assert (=> b!512366 m!494009))

(declare-fun m!494011 () Bool)

(assert (=> b!512367 m!494011))

(declare-fun m!494013 () Bool)

(assert (=> b!512367 m!494013))

(declare-fun m!494015 () Bool)

(assert (=> b!512367 m!494015))

(assert (=> b!512367 m!494007))

(assert (=> b!512367 m!494007))

(declare-fun m!494017 () Bool)

(assert (=> b!512367 m!494017))

(assert (=> b!512367 m!494015))

(declare-fun m!494019 () Bool)

(assert (=> b!512367 m!494019))

(assert (=> b!512367 m!494007))

(declare-fun m!494021 () Bool)

(assert (=> b!512367 m!494021))

(assert (=> b!512367 m!494007))

(declare-fun m!494023 () Bool)

(assert (=> b!512367 m!494023))

(assert (=> b!512367 m!494015))

(declare-fun m!494025 () Bool)

(assert (=> b!512367 m!494025))

(declare-fun m!494027 () Bool)

(assert (=> b!512367 m!494027))

(declare-fun m!494029 () Bool)

(assert (=> b!512365 m!494029))

(declare-fun m!494031 () Bool)

(assert (=> b!512363 m!494031))

(declare-fun m!494033 () Bool)

(assert (=> b!512369 m!494033))

(declare-fun m!494035 () Bool)

(assert (=> b!512364 m!494035))

(push 1)

