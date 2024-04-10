; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46236 () Bool)

(assert start!46236)

(declare-fun b!512030 () Bool)

(declare-fun res!312693 () Bool)

(declare-fun e!299102 () Bool)

(assert (=> b!512030 (=> (not res!312693) (not e!299102))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512030 (= res!312693 (validKeyInArray!0 k!2280))))

(declare-fun b!512032 () Bool)

(declare-fun res!312701 () Bool)

(declare-fun e!299100 () Bool)

(assert (=> b!512032 (=> (not res!312701) (not e!299100))))

(declare-datatypes ((array!32890 0))(
  ( (array!32891 (arr!15822 (Array (_ BitVec 32) (_ BitVec 64))) (size!16186 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32890)

(declare-datatypes ((List!9980 0))(
  ( (Nil!9977) (Cons!9976 (h!10856 (_ BitVec 64)) (t!16208 List!9980)) )
))
(declare-fun arrayNoDuplicates!0 (array!32890 (_ BitVec 32) List!9980) Bool)

(assert (=> b!512032 (= res!312701 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9977))))

(declare-fun b!512033 () Bool)

(declare-fun res!312698 () Bool)

(assert (=> b!512033 (=> (not res!312698) (not e!299102))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512033 (= res!312698 (and (= (size!16186 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16186 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16186 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512034 () Bool)

(declare-fun res!312697 () Bool)

(assert (=> b!512034 (=> (not res!312697) (not e!299102))))

(declare-fun arrayContainsKey!0 (array!32890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512034 (= res!312697 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512035 () Bool)

(declare-fun res!312696 () Bool)

(assert (=> b!512035 (=> (not res!312696) (not e!299102))))

(assert (=> b!512035 (= res!312696 (validKeyInArray!0 (select (arr!15822 a!3235) j!176)))))

(declare-fun b!512036 () Bool)

(declare-fun e!299103 () Bool)

(assert (=> b!512036 (= e!299103 false)))

(declare-datatypes ((SeekEntryResult!4289 0))(
  ( (MissingZero!4289 (index!19344 (_ BitVec 32))) (Found!4289 (index!19345 (_ BitVec 32))) (Intermediate!4289 (undefined!5101 Bool) (index!19346 (_ BitVec 32)) (x!48296 (_ BitVec 32))) (Undefined!4289) (MissingVacant!4289 (index!19347 (_ BitVec 32))) )
))
(declare-fun lt!234337 () SeekEntryResult!4289)

(assert (=> b!512036 (= lt!234337 Undefined!4289)))

(declare-fun b!512037 () Bool)

(declare-fun res!312694 () Bool)

(assert (=> b!512037 (=> res!312694 e!299103)))

(declare-fun lt!234339 () SeekEntryResult!4289)

(assert (=> b!512037 (= res!312694 (or (not (is-Intermediate!4289 lt!234339)) (not (undefined!5101 lt!234339))))))

(declare-fun b!512031 () Bool)

(assert (=> b!512031 (= e!299102 e!299100)))

(declare-fun res!312699 () Bool)

(assert (=> b!512031 (=> (not res!312699) (not e!299100))))

(declare-fun lt!234335 () SeekEntryResult!4289)

(assert (=> b!512031 (= res!312699 (or (= lt!234335 (MissingZero!4289 i!1204)) (= lt!234335 (MissingVacant!4289 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32890 (_ BitVec 32)) SeekEntryResult!4289)

(assert (=> b!512031 (= lt!234335 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!312700 () Bool)

(assert (=> start!46236 (=> (not res!312700) (not e!299102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46236 (= res!312700 (validMask!0 mask!3524))))

(assert (=> start!46236 e!299102))

(assert (=> start!46236 true))

(declare-fun array_inv!11618 (array!32890) Bool)

(assert (=> start!46236 (array_inv!11618 a!3235)))

(declare-fun b!512038 () Bool)

(assert (=> b!512038 (= e!299100 (not e!299103))))

(declare-fun res!312695 () Bool)

(assert (=> b!512038 (=> res!312695 e!299103)))

(declare-fun lt!234340 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32890 (_ BitVec 32)) SeekEntryResult!4289)

(assert (=> b!512038 (= res!312695 (= lt!234339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234340 (select (store (arr!15822 a!3235) i!1204 k!2280) j!176) (array!32891 (store (arr!15822 a!3235) i!1204 k!2280) (size!16186 a!3235)) mask!3524)))))

(declare-fun lt!234336 () (_ BitVec 32))

(assert (=> b!512038 (= lt!234339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234336 (select (arr!15822 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512038 (= lt!234340 (toIndex!0 (select (store (arr!15822 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512038 (= lt!234336 (toIndex!0 (select (arr!15822 a!3235) j!176) mask!3524))))

(assert (=> b!512038 (= lt!234337 (Found!4289 j!176))))

(assert (=> b!512038 (= lt!234337 (seekEntryOrOpen!0 (select (arr!15822 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32890 (_ BitVec 32)) Bool)

(assert (=> b!512038 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15836 0))(
  ( (Unit!15837) )
))
(declare-fun lt!234338 () Unit!15836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32890 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15836)

(assert (=> b!512038 (= lt!234338 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512039 () Bool)

(declare-fun res!312692 () Bool)

(assert (=> b!512039 (=> (not res!312692) (not e!299100))))

(assert (=> b!512039 (= res!312692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46236 res!312700) b!512033))

(assert (= (and b!512033 res!312698) b!512035))

(assert (= (and b!512035 res!312696) b!512030))

(assert (= (and b!512030 res!312693) b!512034))

(assert (= (and b!512034 res!312697) b!512031))

(assert (= (and b!512031 res!312699) b!512039))

(assert (= (and b!512039 res!312692) b!512032))

(assert (= (and b!512032 res!312701) b!512038))

(assert (= (and b!512038 (not res!312695)) b!512037))

(assert (= (and b!512037 (not res!312694)) b!512036))

(declare-fun m!493605 () Bool)

(assert (=> start!46236 m!493605))

(declare-fun m!493607 () Bool)

(assert (=> start!46236 m!493607))

(declare-fun m!493609 () Bool)

(assert (=> b!512032 m!493609))

(declare-fun m!493611 () Bool)

(assert (=> b!512030 m!493611))

(declare-fun m!493613 () Bool)

(assert (=> b!512035 m!493613))

(assert (=> b!512035 m!493613))

(declare-fun m!493615 () Bool)

(assert (=> b!512035 m!493615))

(assert (=> b!512038 m!493613))

(declare-fun m!493617 () Bool)

(assert (=> b!512038 m!493617))

(declare-fun m!493619 () Bool)

(assert (=> b!512038 m!493619))

(declare-fun m!493621 () Bool)

(assert (=> b!512038 m!493621))

(declare-fun m!493623 () Bool)

(assert (=> b!512038 m!493623))

(assert (=> b!512038 m!493613))

(declare-fun m!493625 () Bool)

(assert (=> b!512038 m!493625))

(assert (=> b!512038 m!493613))

(declare-fun m!493627 () Bool)

(assert (=> b!512038 m!493627))

(assert (=> b!512038 m!493623))

(declare-fun m!493629 () Bool)

(assert (=> b!512038 m!493629))

(assert (=> b!512038 m!493613))

(declare-fun m!493631 () Bool)

(assert (=> b!512038 m!493631))

(assert (=> b!512038 m!493623))

(declare-fun m!493633 () Bool)

(assert (=> b!512038 m!493633))

(declare-fun m!493635 () Bool)

(assert (=> b!512031 m!493635))

(declare-fun m!493637 () Bool)

(assert (=> b!512039 m!493637))

(declare-fun m!493639 () Bool)

(assert (=> b!512034 m!493639))

(push 1)

