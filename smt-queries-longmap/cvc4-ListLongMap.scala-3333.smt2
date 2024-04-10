; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45994 () Bool)

(assert start!45994)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32705 0))(
  ( (array!32706 (arr!15731 (Array (_ BitVec 32) (_ BitVec 64))) (size!16095 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32705)

(declare-fun b!509217 () Bool)

(declare-fun e!297823 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4198 0))(
  ( (MissingZero!4198 (index!18980 (_ BitVec 32))) (Found!4198 (index!18981 (_ BitVec 32))) (Intermediate!4198 (undefined!5010 Bool) (index!18982 (_ BitVec 32)) (x!47951 (_ BitVec 32))) (Undefined!4198) (MissingVacant!4198 (index!18983 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32705 (_ BitVec 32)) SeekEntryResult!4198)

(assert (=> b!509217 (= e!297823 (= (seekEntryOrOpen!0 (select (arr!15731 a!3235) j!176) a!3235 mask!3524) (Found!4198 j!176)))))

(declare-fun b!509218 () Bool)

(declare-fun res!310067 () Bool)

(declare-fun e!297824 () Bool)

(assert (=> b!509218 (=> (not res!310067) (not e!297824))))

(declare-datatypes ((List!9889 0))(
  ( (Nil!9886) (Cons!9885 (h!10762 (_ BitVec 64)) (t!16117 List!9889)) )
))
(declare-fun arrayNoDuplicates!0 (array!32705 (_ BitVec 32) List!9889) Bool)

(assert (=> b!509218 (= res!310067 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9886))))

(declare-fun b!509219 () Bool)

(declare-fun res!310070 () Bool)

(declare-fun e!297825 () Bool)

(assert (=> b!509219 (=> (not res!310070) (not e!297825))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509219 (= res!310070 (validKeyInArray!0 k!2280))))

(declare-fun b!509220 () Bool)

(declare-fun res!310064 () Bool)

(assert (=> b!509220 (=> (not res!310064) (not e!297825))))

(declare-fun arrayContainsKey!0 (array!32705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509220 (= res!310064 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509221 () Bool)

(declare-fun res!310069 () Bool)

(assert (=> b!509221 (=> (not res!310069) (not e!297825))))

(assert (=> b!509221 (= res!310069 (validKeyInArray!0 (select (arr!15731 a!3235) j!176)))))

(declare-fun res!310066 () Bool)

(assert (=> start!45994 (=> (not res!310066) (not e!297825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45994 (= res!310066 (validMask!0 mask!3524))))

(assert (=> start!45994 e!297825))

(assert (=> start!45994 true))

(declare-fun array_inv!11527 (array!32705) Bool)

(assert (=> start!45994 (array_inv!11527 a!3235)))

(declare-fun b!509222 () Bool)

(assert (=> b!509222 (= e!297825 e!297824)))

(declare-fun res!310068 () Bool)

(assert (=> b!509222 (=> (not res!310068) (not e!297824))))

(declare-fun lt!232568 () SeekEntryResult!4198)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509222 (= res!310068 (or (= lt!232568 (MissingZero!4198 i!1204)) (= lt!232568 (MissingVacant!4198 i!1204))))))

(assert (=> b!509222 (= lt!232568 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509223 () Bool)

(declare-fun res!310065 () Bool)

(assert (=> b!509223 (=> (not res!310065) (not e!297824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32705 (_ BitVec 32)) Bool)

(assert (=> b!509223 (= res!310065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509224 () Bool)

(assert (=> b!509224 (= e!297824 (not true))))

(declare-fun lt!232570 () SeekEntryResult!4198)

(declare-fun lt!232572 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32705 (_ BitVec 32)) SeekEntryResult!4198)

(assert (=> b!509224 (= lt!232570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232572 (select (store (arr!15731 a!3235) i!1204 k!2280) j!176) (array!32706 (store (arr!15731 a!3235) i!1204 k!2280) (size!16095 a!3235)) mask!3524))))

(declare-fun lt!232571 () SeekEntryResult!4198)

(declare-fun lt!232573 () (_ BitVec 32))

(assert (=> b!509224 (= lt!232571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232573 (select (arr!15731 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509224 (= lt!232572 (toIndex!0 (select (store (arr!15731 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509224 (= lt!232573 (toIndex!0 (select (arr!15731 a!3235) j!176) mask!3524))))

(assert (=> b!509224 e!297823))

(declare-fun res!310062 () Bool)

(assert (=> b!509224 (=> (not res!310062) (not e!297823))))

(assert (=> b!509224 (= res!310062 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15654 0))(
  ( (Unit!15655) )
))
(declare-fun lt!232569 () Unit!15654)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15654)

(assert (=> b!509224 (= lt!232569 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509225 () Bool)

(declare-fun res!310063 () Bool)

(assert (=> b!509225 (=> (not res!310063) (not e!297825))))

(assert (=> b!509225 (= res!310063 (and (= (size!16095 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16095 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16095 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45994 res!310066) b!509225))

(assert (= (and b!509225 res!310063) b!509221))

(assert (= (and b!509221 res!310069) b!509219))

(assert (= (and b!509219 res!310070) b!509220))

(assert (= (and b!509220 res!310064) b!509222))

(assert (= (and b!509222 res!310068) b!509223))

(assert (= (and b!509223 res!310065) b!509218))

(assert (= (and b!509218 res!310067) b!509224))

(assert (= (and b!509224 res!310062) b!509217))

(declare-fun m!490029 () Bool)

(assert (=> b!509223 m!490029))

(declare-fun m!490031 () Bool)

(assert (=> start!45994 m!490031))

(declare-fun m!490033 () Bool)

(assert (=> start!45994 m!490033))

(declare-fun m!490035 () Bool)

(assert (=> b!509222 m!490035))

(declare-fun m!490037 () Bool)

(assert (=> b!509219 m!490037))

(declare-fun m!490039 () Bool)

(assert (=> b!509217 m!490039))

(assert (=> b!509217 m!490039))

(declare-fun m!490041 () Bool)

(assert (=> b!509217 m!490041))

(assert (=> b!509221 m!490039))

(assert (=> b!509221 m!490039))

(declare-fun m!490043 () Bool)

(assert (=> b!509221 m!490043))

(declare-fun m!490045 () Bool)

(assert (=> b!509220 m!490045))

(declare-fun m!490047 () Bool)

(assert (=> b!509218 m!490047))

(declare-fun m!490049 () Bool)

(assert (=> b!509224 m!490049))

(declare-fun m!490051 () Bool)

(assert (=> b!509224 m!490051))

(declare-fun m!490053 () Bool)

(assert (=> b!509224 m!490053))

(assert (=> b!509224 m!490039))

(declare-fun m!490055 () Bool)

(assert (=> b!509224 m!490055))

(assert (=> b!509224 m!490039))

(assert (=> b!509224 m!490053))

(declare-fun m!490057 () Bool)

(assert (=> b!509224 m!490057))

(assert (=> b!509224 m!490053))

(declare-fun m!490059 () Bool)

(assert (=> b!509224 m!490059))

(declare-fun m!490061 () Bool)

(assert (=> b!509224 m!490061))

(assert (=> b!509224 m!490039))

(declare-fun m!490063 () Bool)

(assert (=> b!509224 m!490063))

(push 1)

