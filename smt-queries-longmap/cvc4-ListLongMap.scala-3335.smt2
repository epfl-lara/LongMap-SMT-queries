; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46006 () Bool)

(assert start!46006)

(declare-fun b!509379 () Bool)

(declare-fun res!310228 () Bool)

(declare-fun e!297895 () Bool)

(assert (=> b!509379 (=> (not res!310228) (not e!297895))))

(declare-datatypes ((array!32717 0))(
  ( (array!32718 (arr!15737 (Array (_ BitVec 32) (_ BitVec 64))) (size!16101 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32717)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32717 (_ BitVec 32)) Bool)

(assert (=> b!509379 (= res!310228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509380 () Bool)

(assert (=> b!509380 (= e!297895 (not true))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!232679 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4204 0))(
  ( (MissingZero!4204 (index!19004 (_ BitVec 32))) (Found!4204 (index!19005 (_ BitVec 32))) (Intermediate!4204 (undefined!5016 Bool) (index!19006 (_ BitVec 32)) (x!47973 (_ BitVec 32))) (Undefined!4204) (MissingVacant!4204 (index!19007 (_ BitVec 32))) )
))
(declare-fun lt!232680 () SeekEntryResult!4204)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32717 (_ BitVec 32)) SeekEntryResult!4204)

(assert (=> b!509380 (= lt!232680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232679 (select (store (arr!15737 a!3235) i!1204 k!2280) j!176) (array!32718 (store (arr!15737 a!3235) i!1204 k!2280) (size!16101 a!3235)) mask!3524))))

(declare-fun lt!232678 () SeekEntryResult!4204)

(declare-fun lt!232676 () (_ BitVec 32))

(assert (=> b!509380 (= lt!232678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232676 (select (arr!15737 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509380 (= lt!232679 (toIndex!0 (select (store (arr!15737 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509380 (= lt!232676 (toIndex!0 (select (arr!15737 a!3235) j!176) mask!3524))))

(declare-fun e!297894 () Bool)

(assert (=> b!509380 e!297894))

(declare-fun res!310230 () Bool)

(assert (=> b!509380 (=> (not res!310230) (not e!297894))))

(assert (=> b!509380 (= res!310230 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15666 0))(
  ( (Unit!15667) )
))
(declare-fun lt!232677 () Unit!15666)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15666)

(assert (=> b!509380 (= lt!232677 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509381 () Bool)

(declare-fun res!310232 () Bool)

(declare-fun e!297897 () Bool)

(assert (=> b!509381 (=> (not res!310232) (not e!297897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509381 (= res!310232 (validKeyInArray!0 k!2280))))

(declare-fun b!509382 () Bool)

(declare-fun res!310231 () Bool)

(assert (=> b!509382 (=> (not res!310231) (not e!297897))))

(assert (=> b!509382 (= res!310231 (and (= (size!16101 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16101 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16101 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509383 () Bool)

(declare-fun res!310224 () Bool)

(assert (=> b!509383 (=> (not res!310224) (not e!297897))))

(declare-fun arrayContainsKey!0 (array!32717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509383 (= res!310224 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!310226 () Bool)

(assert (=> start!46006 (=> (not res!310226) (not e!297897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46006 (= res!310226 (validMask!0 mask!3524))))

(assert (=> start!46006 e!297897))

(assert (=> start!46006 true))

(declare-fun array_inv!11533 (array!32717) Bool)

(assert (=> start!46006 (array_inv!11533 a!3235)))

(declare-fun b!509384 () Bool)

(assert (=> b!509384 (= e!297897 e!297895)))

(declare-fun res!310229 () Bool)

(assert (=> b!509384 (=> (not res!310229) (not e!297895))))

(declare-fun lt!232681 () SeekEntryResult!4204)

(assert (=> b!509384 (= res!310229 (or (= lt!232681 (MissingZero!4204 i!1204)) (= lt!232681 (MissingVacant!4204 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32717 (_ BitVec 32)) SeekEntryResult!4204)

(assert (=> b!509384 (= lt!232681 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509385 () Bool)

(declare-fun res!310225 () Bool)

(assert (=> b!509385 (=> (not res!310225) (not e!297897))))

(assert (=> b!509385 (= res!310225 (validKeyInArray!0 (select (arr!15737 a!3235) j!176)))))

(declare-fun b!509386 () Bool)

(assert (=> b!509386 (= e!297894 (= (seekEntryOrOpen!0 (select (arr!15737 a!3235) j!176) a!3235 mask!3524) (Found!4204 j!176)))))

(declare-fun b!509387 () Bool)

(declare-fun res!310227 () Bool)

(assert (=> b!509387 (=> (not res!310227) (not e!297895))))

(declare-datatypes ((List!9895 0))(
  ( (Nil!9892) (Cons!9891 (h!10768 (_ BitVec 64)) (t!16123 List!9895)) )
))
(declare-fun arrayNoDuplicates!0 (array!32717 (_ BitVec 32) List!9895) Bool)

(assert (=> b!509387 (= res!310227 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9892))))

(assert (= (and start!46006 res!310226) b!509382))

(assert (= (and b!509382 res!310231) b!509385))

(assert (= (and b!509385 res!310225) b!509381))

(assert (= (and b!509381 res!310232) b!509383))

(assert (= (and b!509383 res!310224) b!509384))

(assert (= (and b!509384 res!310229) b!509379))

(assert (= (and b!509379 res!310228) b!509387))

(assert (= (and b!509387 res!310227) b!509380))

(assert (= (and b!509380 res!310230) b!509386))

(declare-fun m!490245 () Bool)

(assert (=> b!509380 m!490245))

(declare-fun m!490247 () Bool)

(assert (=> b!509380 m!490247))

(declare-fun m!490249 () Bool)

(assert (=> b!509380 m!490249))

(assert (=> b!509380 m!490249))

(declare-fun m!490251 () Bool)

(assert (=> b!509380 m!490251))

(declare-fun m!490253 () Bool)

(assert (=> b!509380 m!490253))

(declare-fun m!490255 () Bool)

(assert (=> b!509380 m!490255))

(assert (=> b!509380 m!490253))

(declare-fun m!490257 () Bool)

(assert (=> b!509380 m!490257))

(assert (=> b!509380 m!490249))

(declare-fun m!490259 () Bool)

(assert (=> b!509380 m!490259))

(assert (=> b!509380 m!490253))

(declare-fun m!490261 () Bool)

(assert (=> b!509380 m!490261))

(assert (=> b!509385 m!490253))

(assert (=> b!509385 m!490253))

(declare-fun m!490263 () Bool)

(assert (=> b!509385 m!490263))

(declare-fun m!490265 () Bool)

(assert (=> b!509383 m!490265))

(declare-fun m!490267 () Bool)

(assert (=> b!509379 m!490267))

(declare-fun m!490269 () Bool)

(assert (=> b!509387 m!490269))

(declare-fun m!490271 () Bool)

(assert (=> b!509384 m!490271))

(assert (=> b!509386 m!490253))

(assert (=> b!509386 m!490253))

(declare-fun m!490273 () Bool)

(assert (=> b!509386 m!490273))

(declare-fun m!490275 () Bool)

(assert (=> start!46006 m!490275))

(declare-fun m!490277 () Bool)

(assert (=> start!46006 m!490277))

(declare-fun m!490279 () Bool)

(assert (=> b!509381 m!490279))

(push 1)

