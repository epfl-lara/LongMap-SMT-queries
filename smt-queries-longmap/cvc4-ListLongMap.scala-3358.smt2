; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46204 () Bool)

(assert start!46204)

(declare-fun b!511550 () Bool)

(declare-fun res!312214 () Bool)

(declare-fun e!298909 () Bool)

(assert (=> b!511550 (=> (not res!312214) (not e!298909))))

(declare-datatypes ((array!32858 0))(
  ( (array!32859 (arr!15806 (Array (_ BitVec 32) (_ BitVec 64))) (size!16170 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32858)

(declare-datatypes ((List!9964 0))(
  ( (Nil!9961) (Cons!9960 (h!10840 (_ BitVec 64)) (t!16192 List!9964)) )
))
(declare-fun arrayNoDuplicates!0 (array!32858 (_ BitVec 32) List!9964) Bool)

(assert (=> b!511550 (= res!312214 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9961))))

(declare-fun b!511551 () Bool)

(declare-fun e!298911 () Bool)

(assert (=> b!511551 (= e!298909 (not e!298911))))

(declare-fun res!312213 () Bool)

(assert (=> b!511551 (=> res!312213 e!298911)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!234051 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4273 0))(
  ( (MissingZero!4273 (index!19280 (_ BitVec 32))) (Found!4273 (index!19281 (_ BitVec 32))) (Intermediate!4273 (undefined!5085 Bool) (index!19282 (_ BitVec 32)) (x!48232 (_ BitVec 32))) (Undefined!4273) (MissingVacant!4273 (index!19283 (_ BitVec 32))) )
))
(declare-fun lt!234047 () SeekEntryResult!4273)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32858 (_ BitVec 32)) SeekEntryResult!4273)

(assert (=> b!511551 (= res!312213 (= lt!234047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234051 (select (store (arr!15806 a!3235) i!1204 k!2280) j!176) (array!32859 (store (arr!15806 a!3235) i!1204 k!2280) (size!16170 a!3235)) mask!3524)))))

(declare-fun lt!234052 () (_ BitVec 32))

(assert (=> b!511551 (= lt!234047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234052 (select (arr!15806 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511551 (= lt!234051 (toIndex!0 (select (store (arr!15806 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511551 (= lt!234052 (toIndex!0 (select (arr!15806 a!3235) j!176) mask!3524))))

(declare-fun lt!234050 () SeekEntryResult!4273)

(assert (=> b!511551 (= lt!234050 (Found!4273 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32858 (_ BitVec 32)) SeekEntryResult!4273)

(assert (=> b!511551 (= lt!234050 (seekEntryOrOpen!0 (select (arr!15806 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32858 (_ BitVec 32)) Bool)

(assert (=> b!511551 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15804 0))(
  ( (Unit!15805) )
))
(declare-fun lt!234049 () Unit!15804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15804)

(assert (=> b!511551 (= lt!234049 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511552 () Bool)

(assert (=> b!511552 (= e!298911 true)))

(assert (=> b!511552 (= lt!234050 Undefined!4273)))

(declare-fun b!511553 () Bool)

(declare-fun res!312220 () Bool)

(declare-fun e!298910 () Bool)

(assert (=> b!511553 (=> (not res!312220) (not e!298910))))

(declare-fun arrayContainsKey!0 (array!32858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511553 (= res!312220 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511554 () Bool)

(declare-fun res!312215 () Bool)

(assert (=> b!511554 (=> (not res!312215) (not e!298909))))

(assert (=> b!511554 (= res!312215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511555 () Bool)

(declare-fun res!312216 () Bool)

(assert (=> b!511555 (=> res!312216 e!298911)))

(assert (=> b!511555 (= res!312216 (or (not (is-Intermediate!4273 lt!234047)) (not (undefined!5085 lt!234047))))))

(declare-fun b!511556 () Bool)

(declare-fun res!312217 () Bool)

(assert (=> b!511556 (=> (not res!312217) (not e!298910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511556 (= res!312217 (validKeyInArray!0 (select (arr!15806 a!3235) j!176)))))

(declare-fun res!312221 () Bool)

(assert (=> start!46204 (=> (not res!312221) (not e!298910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46204 (= res!312221 (validMask!0 mask!3524))))

(assert (=> start!46204 e!298910))

(assert (=> start!46204 true))

(declare-fun array_inv!11602 (array!32858) Bool)

(assert (=> start!46204 (array_inv!11602 a!3235)))

(declare-fun b!511557 () Bool)

(declare-fun res!312212 () Bool)

(assert (=> b!511557 (=> (not res!312212) (not e!298910))))

(assert (=> b!511557 (= res!312212 (and (= (size!16170 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16170 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16170 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511558 () Bool)

(declare-fun res!312218 () Bool)

(assert (=> b!511558 (=> (not res!312218) (not e!298910))))

(assert (=> b!511558 (= res!312218 (validKeyInArray!0 k!2280))))

(declare-fun b!511559 () Bool)

(assert (=> b!511559 (= e!298910 e!298909)))

(declare-fun res!312219 () Bool)

(assert (=> b!511559 (=> (not res!312219) (not e!298909))))

(declare-fun lt!234048 () SeekEntryResult!4273)

(assert (=> b!511559 (= res!312219 (or (= lt!234048 (MissingZero!4273 i!1204)) (= lt!234048 (MissingVacant!4273 i!1204))))))

(assert (=> b!511559 (= lt!234048 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!46204 res!312221) b!511557))

(assert (= (and b!511557 res!312212) b!511556))

(assert (= (and b!511556 res!312217) b!511558))

(assert (= (and b!511558 res!312218) b!511553))

(assert (= (and b!511553 res!312220) b!511559))

(assert (= (and b!511559 res!312219) b!511554))

(assert (= (and b!511554 res!312215) b!511550))

(assert (= (and b!511550 res!312214) b!511551))

(assert (= (and b!511551 (not res!312213)) b!511555))

(assert (= (and b!511555 (not res!312216)) b!511552))

(declare-fun m!493029 () Bool)

(assert (=> b!511556 m!493029))

(assert (=> b!511556 m!493029))

(declare-fun m!493031 () Bool)

(assert (=> b!511556 m!493031))

(declare-fun m!493033 () Bool)

(assert (=> start!46204 m!493033))

(declare-fun m!493035 () Bool)

(assert (=> start!46204 m!493035))

(declare-fun m!493037 () Bool)

(assert (=> b!511558 m!493037))

(declare-fun m!493039 () Bool)

(assert (=> b!511553 m!493039))

(declare-fun m!493041 () Bool)

(assert (=> b!511559 m!493041))

(declare-fun m!493043 () Bool)

(assert (=> b!511551 m!493043))

(declare-fun m!493045 () Bool)

(assert (=> b!511551 m!493045))

(declare-fun m!493047 () Bool)

(assert (=> b!511551 m!493047))

(assert (=> b!511551 m!493029))

(declare-fun m!493049 () Bool)

(assert (=> b!511551 m!493049))

(assert (=> b!511551 m!493029))

(declare-fun m!493051 () Bool)

(assert (=> b!511551 m!493051))

(assert (=> b!511551 m!493029))

(declare-fun m!493053 () Bool)

(assert (=> b!511551 m!493053))

(assert (=> b!511551 m!493029))

(declare-fun m!493055 () Bool)

(assert (=> b!511551 m!493055))

(assert (=> b!511551 m!493047))

(declare-fun m!493057 () Bool)

(assert (=> b!511551 m!493057))

(assert (=> b!511551 m!493047))

(declare-fun m!493059 () Bool)

(assert (=> b!511551 m!493059))

(declare-fun m!493061 () Bool)

(assert (=> b!511550 m!493061))

(declare-fun m!493063 () Bool)

(assert (=> b!511554 m!493063))

(push 1)

