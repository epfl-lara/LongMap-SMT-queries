; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44438 () Bool)

(assert start!44438)

(declare-fun res!291298 () Bool)

(declare-fun e!287153 () Bool)

(assert (=> start!44438 (=> (not res!291298) (not e!287153))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44438 (= res!291298 (validMask!0 mask!3524))))

(assert (=> start!44438 e!287153))

(assert (=> start!44438 true))

(declare-datatypes ((array!31594 0))(
  ( (array!31595 (arr!15187 (Array (_ BitVec 32) (_ BitVec 64))) (size!15551 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31594)

(declare-fun array_inv!11046 (array!31594) Bool)

(assert (=> start!44438 (array_inv!11046 a!3235)))

(declare-fun b!488081 () Bool)

(declare-fun e!287152 () Bool)

(assert (=> b!488081 (= e!287153 e!287152)))

(declare-fun res!291296 () Bool)

(assert (=> b!488081 (=> (not res!291296) (not e!287152))))

(declare-datatypes ((SeekEntryResult!3610 0))(
  ( (MissingZero!3610 (index!16619 (_ BitVec 32))) (Found!3610 (index!16620 (_ BitVec 32))) (Intermediate!3610 (undefined!4422 Bool) (index!16621 (_ BitVec 32)) (x!45886 (_ BitVec 32))) (Undefined!3610) (MissingVacant!3610 (index!16622 (_ BitVec 32))) )
))
(declare-fun lt!220326 () SeekEntryResult!3610)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488081 (= res!291296 (or (= lt!220326 (MissingZero!3610 i!1204)) (= lt!220326 (MissingVacant!3610 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31594 (_ BitVec 32)) SeekEntryResult!3610)

(assert (=> b!488081 (= lt!220326 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488082 () Bool)

(declare-fun res!291302 () Bool)

(assert (=> b!488082 (=> (not res!291302) (not e!287153))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488082 (= res!291302 (and (= (size!15551 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15551 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15551 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488083 () Bool)

(assert (=> b!488083 (= e!287152 (not true))))

(declare-fun lt!220327 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488083 (= lt!220327 (toIndex!0 (select (arr!15187 a!3235) j!176) mask!3524))))

(declare-fun e!287154 () Bool)

(assert (=> b!488083 e!287154))

(declare-fun res!291304 () Bool)

(assert (=> b!488083 (=> (not res!291304) (not e!287154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31594 (_ BitVec 32)) Bool)

(assert (=> b!488083 (= res!291304 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14227 0))(
  ( (Unit!14228) )
))
(declare-fun lt!220325 () Unit!14227)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14227)

(assert (=> b!488083 (= lt!220325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488084 () Bool)

(assert (=> b!488084 (= e!287154 (= (seekEntryOrOpen!0 (select (arr!15187 a!3235) j!176) a!3235 mask!3524) (Found!3610 j!176)))))

(declare-fun b!488085 () Bool)

(declare-fun res!291301 () Bool)

(assert (=> b!488085 (=> (not res!291301) (not e!287153))))

(declare-fun arrayContainsKey!0 (array!31594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488085 (= res!291301 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488086 () Bool)

(declare-fun res!291300 () Bool)

(assert (=> b!488086 (=> (not res!291300) (not e!287152))))

(declare-datatypes ((List!9252 0))(
  ( (Nil!9249) (Cons!9248 (h!10107 (_ BitVec 64)) (t!15472 List!9252)) )
))
(declare-fun arrayNoDuplicates!0 (array!31594 (_ BitVec 32) List!9252) Bool)

(assert (=> b!488086 (= res!291300 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9249))))

(declare-fun b!488087 () Bool)

(declare-fun res!291297 () Bool)

(assert (=> b!488087 (=> (not res!291297) (not e!287153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488087 (= res!291297 (validKeyInArray!0 k0!2280))))

(declare-fun b!488088 () Bool)

(declare-fun res!291299 () Bool)

(assert (=> b!488088 (=> (not res!291299) (not e!287152))))

(assert (=> b!488088 (= res!291299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488089 () Bool)

(declare-fun res!291303 () Bool)

(assert (=> b!488089 (=> (not res!291303) (not e!287153))))

(assert (=> b!488089 (= res!291303 (validKeyInArray!0 (select (arr!15187 a!3235) j!176)))))

(assert (= (and start!44438 res!291298) b!488082))

(assert (= (and b!488082 res!291302) b!488089))

(assert (= (and b!488089 res!291303) b!488087))

(assert (= (and b!488087 res!291297) b!488085))

(assert (= (and b!488085 res!291301) b!488081))

(assert (= (and b!488081 res!291296) b!488088))

(assert (= (and b!488088 res!291299) b!488086))

(assert (= (and b!488086 res!291300) b!488083))

(assert (= (and b!488083 res!291304) b!488084))

(declare-fun m!468079 () Bool)

(assert (=> b!488089 m!468079))

(assert (=> b!488089 m!468079))

(declare-fun m!468081 () Bool)

(assert (=> b!488089 m!468081))

(declare-fun m!468083 () Bool)

(assert (=> b!488086 m!468083))

(declare-fun m!468085 () Bool)

(assert (=> b!488081 m!468085))

(declare-fun m!468087 () Bool)

(assert (=> b!488087 m!468087))

(declare-fun m!468089 () Bool)

(assert (=> b!488088 m!468089))

(assert (=> b!488083 m!468079))

(assert (=> b!488083 m!468079))

(declare-fun m!468091 () Bool)

(assert (=> b!488083 m!468091))

(declare-fun m!468093 () Bool)

(assert (=> b!488083 m!468093))

(declare-fun m!468095 () Bool)

(assert (=> b!488083 m!468095))

(assert (=> b!488084 m!468079))

(assert (=> b!488084 m!468079))

(declare-fun m!468097 () Bool)

(assert (=> b!488084 m!468097))

(declare-fun m!468099 () Bool)

(assert (=> start!44438 m!468099))

(declare-fun m!468101 () Bool)

(assert (=> start!44438 m!468101))

(declare-fun m!468103 () Bool)

(assert (=> b!488085 m!468103))

(check-sat (not b!488086) (not start!44438) (not b!488083) (not b!488089) (not b!488081) (not b!488087) (not b!488085) (not b!488084) (not b!488088))
(check-sat)
