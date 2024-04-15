; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53004 () Bool)

(assert start!53004)

(declare-fun res!365231 () Bool)

(declare-fun e!331905 () Bool)

(assert (=> start!53004 (=> (not res!365231) (not e!331905))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53004 (= res!365231 (validMask!0 mask!3053))))

(assert (=> start!53004 e!331905))

(assert (=> start!53004 true))

(declare-datatypes ((array!36036 0))(
  ( (array!36037 (arr!17297 (Array (_ BitVec 32) (_ BitVec 64))) (size!17662 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36036)

(declare-fun array_inv!13180 (array!36036) Bool)

(assert (=> start!53004 (array_inv!13180 a!2986)))

(declare-fun b!577056 () Bool)

(declare-fun res!365232 () Bool)

(assert (=> b!577056 (=> (not res!365232) (not e!331905))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577056 (= res!365232 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577057 () Bool)

(declare-fun res!365233 () Bool)

(assert (=> b!577057 (=> (not res!365233) (not e!331905))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577057 (= res!365233 (validKeyInArray!0 (select (arr!17297 a!2986) j!136)))))

(declare-fun b!577058 () Bool)

(assert (=> b!577058 (= e!331905 false)))

(declare-datatypes ((SeekEntryResult!5734 0))(
  ( (MissingZero!5734 (index!25163 (_ BitVec 32))) (Found!5734 (index!25164 (_ BitVec 32))) (Intermediate!5734 (undefined!6546 Bool) (index!25165 (_ BitVec 32)) (x!54086 (_ BitVec 32))) (Undefined!5734) (MissingVacant!5734 (index!25166 (_ BitVec 32))) )
))
(declare-fun lt!263710 () SeekEntryResult!5734)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36036 (_ BitVec 32)) SeekEntryResult!5734)

(assert (=> b!577058 (= lt!263710 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577059 () Bool)

(declare-fun res!365234 () Bool)

(assert (=> b!577059 (=> (not res!365234) (not e!331905))))

(assert (=> b!577059 (= res!365234 (validKeyInArray!0 k0!1786))))

(declare-fun b!577060 () Bool)

(declare-fun res!365230 () Bool)

(assert (=> b!577060 (=> (not res!365230) (not e!331905))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577060 (= res!365230 (and (= (size!17662 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17662 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17662 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53004 res!365231) b!577060))

(assert (= (and b!577060 res!365230) b!577057))

(assert (= (and b!577057 res!365233) b!577059))

(assert (= (and b!577059 res!365234) b!577056))

(assert (= (and b!577056 res!365232) b!577058))

(declare-fun m!555455 () Bool)

(assert (=> b!577058 m!555455))

(declare-fun m!555457 () Bool)

(assert (=> start!53004 m!555457))

(declare-fun m!555459 () Bool)

(assert (=> start!53004 m!555459))

(declare-fun m!555461 () Bool)

(assert (=> b!577059 m!555461))

(declare-fun m!555463 () Bool)

(assert (=> b!577056 m!555463))

(declare-fun m!555465 () Bool)

(assert (=> b!577057 m!555465))

(assert (=> b!577057 m!555465))

(declare-fun m!555467 () Bool)

(assert (=> b!577057 m!555467))

(check-sat (not b!577057) (not start!53004) (not b!577058) (not b!577059) (not b!577056))
(check-sat)
