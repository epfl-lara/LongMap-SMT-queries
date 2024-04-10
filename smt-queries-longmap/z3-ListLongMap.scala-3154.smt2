; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44450 () Bool)

(assert start!44450)

(declare-fun b!488169 () Bool)

(declare-fun res!291337 () Bool)

(declare-fun e!287204 () Bool)

(assert (=> b!488169 (=> (not res!291337) (not e!287204))))

(declare-datatypes ((array!31605 0))(
  ( (array!31606 (arr!15193 (Array (_ BitVec 32) (_ BitVec 64))) (size!15557 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31605)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488169 (= res!291337 (validKeyInArray!0 (select (arr!15193 a!3235) j!176)))))

(declare-fun b!488170 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!287205 () Bool)

(declare-datatypes ((SeekEntryResult!3660 0))(
  ( (MissingZero!3660 (index!16819 (_ BitVec 32))) (Found!3660 (index!16820 (_ BitVec 32))) (Intermediate!3660 (undefined!4472 Bool) (index!16821 (_ BitVec 32)) (x!45939 (_ BitVec 32))) (Undefined!3660) (MissingVacant!3660 (index!16822 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31605 (_ BitVec 32)) SeekEntryResult!3660)

(assert (=> b!488170 (= e!287205 (= (seekEntryOrOpen!0 (select (arr!15193 a!3235) j!176) a!3235 mask!3524) (Found!3660 j!176)))))

(declare-fun b!488171 () Bool)

(declare-fun e!287202 () Bool)

(assert (=> b!488171 (= e!287204 e!287202)))

(declare-fun res!291331 () Bool)

(assert (=> b!488171 (=> (not res!291331) (not e!287202))))

(declare-fun lt!220323 () SeekEntryResult!3660)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488171 (= res!291331 (or (= lt!220323 (MissingZero!3660 i!1204)) (= lt!220323 (MissingVacant!3660 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!488171 (= lt!220323 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488172 () Bool)

(assert (=> b!488172 (= e!287202 (not true))))

(declare-fun lt!220324 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488172 (= lt!220324 (toIndex!0 (select (arr!15193 a!3235) j!176) mask!3524))))

(assert (=> b!488172 e!287205))

(declare-fun res!291330 () Bool)

(assert (=> b!488172 (=> (not res!291330) (not e!287205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31605 (_ BitVec 32)) Bool)

(assert (=> b!488172 (= res!291330 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14266 0))(
  ( (Unit!14267) )
))
(declare-fun lt!220322 () Unit!14266)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14266)

(assert (=> b!488172 (= lt!220322 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!291332 () Bool)

(assert (=> start!44450 (=> (not res!291332) (not e!287204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44450 (= res!291332 (validMask!0 mask!3524))))

(assert (=> start!44450 e!287204))

(assert (=> start!44450 true))

(declare-fun array_inv!10989 (array!31605) Bool)

(assert (=> start!44450 (array_inv!10989 a!3235)))

(declare-fun b!488173 () Bool)

(declare-fun res!291338 () Bool)

(assert (=> b!488173 (=> (not res!291338) (not e!287204))))

(declare-fun arrayContainsKey!0 (array!31605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488173 (= res!291338 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488174 () Bool)

(declare-fun res!291335 () Bool)

(assert (=> b!488174 (=> (not res!291335) (not e!287202))))

(declare-datatypes ((List!9351 0))(
  ( (Nil!9348) (Cons!9347 (h!10206 (_ BitVec 64)) (t!15579 List!9351)) )
))
(declare-fun arrayNoDuplicates!0 (array!31605 (_ BitVec 32) List!9351) Bool)

(assert (=> b!488174 (= res!291335 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9348))))

(declare-fun b!488175 () Bool)

(declare-fun res!291333 () Bool)

(assert (=> b!488175 (=> (not res!291333) (not e!287204))))

(assert (=> b!488175 (= res!291333 (and (= (size!15557 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15557 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15557 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488176 () Bool)

(declare-fun res!291334 () Bool)

(assert (=> b!488176 (=> (not res!291334) (not e!287202))))

(assert (=> b!488176 (= res!291334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488177 () Bool)

(declare-fun res!291336 () Bool)

(assert (=> b!488177 (=> (not res!291336) (not e!287204))))

(assert (=> b!488177 (= res!291336 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44450 res!291332) b!488175))

(assert (= (and b!488175 res!291333) b!488169))

(assert (= (and b!488169 res!291337) b!488177))

(assert (= (and b!488177 res!291336) b!488173))

(assert (= (and b!488173 res!291338) b!488171))

(assert (= (and b!488171 res!291331) b!488176))

(assert (= (and b!488176 res!291334) b!488174))

(assert (= (and b!488174 res!291335) b!488172))

(assert (= (and b!488172 res!291330) b!488170))

(declare-fun m!467921 () Bool)

(assert (=> b!488174 m!467921))

(declare-fun m!467923 () Bool)

(assert (=> b!488176 m!467923))

(declare-fun m!467925 () Bool)

(assert (=> b!488170 m!467925))

(assert (=> b!488170 m!467925))

(declare-fun m!467927 () Bool)

(assert (=> b!488170 m!467927))

(declare-fun m!467929 () Bool)

(assert (=> b!488171 m!467929))

(assert (=> b!488169 m!467925))

(assert (=> b!488169 m!467925))

(declare-fun m!467931 () Bool)

(assert (=> b!488169 m!467931))

(declare-fun m!467933 () Bool)

(assert (=> b!488173 m!467933))

(declare-fun m!467935 () Bool)

(assert (=> b!488177 m!467935))

(assert (=> b!488172 m!467925))

(assert (=> b!488172 m!467925))

(declare-fun m!467937 () Bool)

(assert (=> b!488172 m!467937))

(declare-fun m!467939 () Bool)

(assert (=> b!488172 m!467939))

(declare-fun m!467941 () Bool)

(assert (=> b!488172 m!467941))

(declare-fun m!467943 () Bool)

(assert (=> start!44450 m!467943))

(declare-fun m!467945 () Bool)

(assert (=> start!44450 m!467945))

(check-sat (not b!488174) (not b!488173) (not b!488169) (not b!488177) (not start!44450) (not b!488176) (not b!488170) (not b!488172) (not b!488171))
(check-sat)
