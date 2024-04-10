; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45026 () Bool)

(assert start!45026)

(declare-fun b!494036 () Bool)

(declare-fun e!290022 () Bool)

(declare-fun e!290025 () Bool)

(assert (=> b!494036 (= e!290022 (not e!290025))))

(declare-fun res!296607 () Bool)

(assert (=> b!494036 (=> res!296607 e!290025)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!223532 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31971 0))(
  ( (array!31972 (arr!15370 (Array (_ BitVec 32) (_ BitVec 64))) (size!15734 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31971)

(declare-datatypes ((SeekEntryResult!3837 0))(
  ( (MissingZero!3837 (index!17527 (_ BitVec 32))) (Found!3837 (index!17528 (_ BitVec 32))) (Intermediate!3837 (undefined!4649 Bool) (index!17529 (_ BitVec 32)) (x!46603 (_ BitVec 32))) (Undefined!3837) (MissingVacant!3837 (index!17530 (_ BitVec 32))) )
))
(declare-fun lt!223529 () SeekEntryResult!3837)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31971 (_ BitVec 32)) SeekEntryResult!3837)

(assert (=> b!494036 (= res!296607 (= lt!223529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223532 (select (store (arr!15370 a!3235) i!1204 k0!2280) j!176) (array!31972 (store (arr!15370 a!3235) i!1204 k0!2280) (size!15734 a!3235)) mask!3524)))))

(declare-fun lt!223533 () (_ BitVec 32))

(assert (=> b!494036 (= lt!223529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223533 (select (arr!15370 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494036 (= lt!223532 (toIndex!0 (select (store (arr!15370 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494036 (= lt!223533 (toIndex!0 (select (arr!15370 a!3235) j!176) mask!3524))))

(declare-fun lt!223530 () SeekEntryResult!3837)

(assert (=> b!494036 (= lt!223530 (Found!3837 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31971 (_ BitVec 32)) SeekEntryResult!3837)

(assert (=> b!494036 (= lt!223530 (seekEntryOrOpen!0 (select (arr!15370 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31971 (_ BitVec 32)) Bool)

(assert (=> b!494036 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14620 0))(
  ( (Unit!14621) )
))
(declare-fun lt!223534 () Unit!14620)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14620)

(assert (=> b!494036 (= lt!223534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494037 () Bool)

(declare-fun res!296606 () Bool)

(declare-fun e!290024 () Bool)

(assert (=> b!494037 (=> (not res!296606) (not e!290024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494037 (= res!296606 (validKeyInArray!0 (select (arr!15370 a!3235) j!176)))))

(declare-fun b!494038 () Bool)

(declare-fun res!296609 () Bool)

(assert (=> b!494038 (=> (not res!296609) (not e!290024))))

(assert (=> b!494038 (= res!296609 (validKeyInArray!0 k0!2280))))

(declare-fun b!494039 () Bool)

(declare-fun res!296608 () Bool)

(assert (=> b!494039 (=> (not res!296608) (not e!290024))))

(declare-fun arrayContainsKey!0 (array!31971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494039 (= res!296608 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494040 () Bool)

(assert (=> b!494040 (= e!290024 e!290022)))

(declare-fun res!296610 () Bool)

(assert (=> b!494040 (=> (not res!296610) (not e!290022))))

(declare-fun lt!223531 () SeekEntryResult!3837)

(assert (=> b!494040 (= res!296610 (or (= lt!223531 (MissingZero!3837 i!1204)) (= lt!223531 (MissingVacant!3837 i!1204))))))

(assert (=> b!494040 (= lt!223531 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494041 () Bool)

(assert (=> b!494041 (= e!290025 true)))

(assert (=> b!494041 (= lt!223530 Undefined!3837)))

(declare-fun b!494042 () Bool)

(declare-fun res!296611 () Bool)

(assert (=> b!494042 (=> (not res!296611) (not e!290022))))

(assert (=> b!494042 (= res!296611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!296614 () Bool)

(assert (=> start!45026 (=> (not res!296614) (not e!290024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45026 (= res!296614 (validMask!0 mask!3524))))

(assert (=> start!45026 e!290024))

(assert (=> start!45026 true))

(declare-fun array_inv!11166 (array!31971) Bool)

(assert (=> start!45026 (array_inv!11166 a!3235)))

(declare-fun b!494043 () Bool)

(declare-fun res!296615 () Bool)

(assert (=> b!494043 (=> (not res!296615) (not e!290022))))

(declare-datatypes ((List!9528 0))(
  ( (Nil!9525) (Cons!9524 (h!10392 (_ BitVec 64)) (t!15756 List!9528)) )
))
(declare-fun arrayNoDuplicates!0 (array!31971 (_ BitVec 32) List!9528) Bool)

(assert (=> b!494043 (= res!296615 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9525))))

(declare-fun b!494044 () Bool)

(declare-fun res!296613 () Bool)

(assert (=> b!494044 (=> res!296613 e!290025)))

(get-info :version)

(assert (=> b!494044 (= res!296613 (or (not ((_ is Intermediate!3837) lt!223529)) (not (undefined!4649 lt!223529))))))

(declare-fun b!494045 () Bool)

(declare-fun res!296612 () Bool)

(assert (=> b!494045 (=> (not res!296612) (not e!290024))))

(assert (=> b!494045 (= res!296612 (and (= (size!15734 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15734 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15734 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45026 res!296614) b!494045))

(assert (= (and b!494045 res!296612) b!494037))

(assert (= (and b!494037 res!296606) b!494038))

(assert (= (and b!494038 res!296609) b!494039))

(assert (= (and b!494039 res!296608) b!494040))

(assert (= (and b!494040 res!296610) b!494042))

(assert (= (and b!494042 res!296611) b!494043))

(assert (= (and b!494043 res!296615) b!494036))

(assert (= (and b!494036 (not res!296607)) b!494044))

(assert (= (and b!494044 (not res!296613)) b!494041))

(declare-fun m!474999 () Bool)

(assert (=> start!45026 m!474999))

(declare-fun m!475001 () Bool)

(assert (=> start!45026 m!475001))

(declare-fun m!475003 () Bool)

(assert (=> b!494037 m!475003))

(assert (=> b!494037 m!475003))

(declare-fun m!475005 () Bool)

(assert (=> b!494037 m!475005))

(declare-fun m!475007 () Bool)

(assert (=> b!494039 m!475007))

(declare-fun m!475009 () Bool)

(assert (=> b!494040 m!475009))

(declare-fun m!475011 () Bool)

(assert (=> b!494042 m!475011))

(declare-fun m!475013 () Bool)

(assert (=> b!494036 m!475013))

(declare-fun m!475015 () Bool)

(assert (=> b!494036 m!475015))

(declare-fun m!475017 () Bool)

(assert (=> b!494036 m!475017))

(assert (=> b!494036 m!475003))

(declare-fun m!475019 () Bool)

(assert (=> b!494036 m!475019))

(assert (=> b!494036 m!475003))

(assert (=> b!494036 m!475017))

(declare-fun m!475021 () Bool)

(assert (=> b!494036 m!475021))

(assert (=> b!494036 m!475003))

(declare-fun m!475023 () Bool)

(assert (=> b!494036 m!475023))

(declare-fun m!475025 () Bool)

(assert (=> b!494036 m!475025))

(assert (=> b!494036 m!475017))

(declare-fun m!475027 () Bool)

(assert (=> b!494036 m!475027))

(assert (=> b!494036 m!475003))

(declare-fun m!475029 () Bool)

(assert (=> b!494036 m!475029))

(declare-fun m!475031 () Bool)

(assert (=> b!494038 m!475031))

(declare-fun m!475033 () Bool)

(assert (=> b!494043 m!475033))

(check-sat (not b!494042) (not start!45026) (not b!494038) (not b!494039) (not b!494036) (not b!494037) (not b!494043) (not b!494040))
(check-sat)
