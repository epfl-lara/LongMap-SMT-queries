; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44858 () Bool)

(assert start!44858)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!492268 () Bool)

(declare-fun e!289186 () Bool)

(declare-datatypes ((array!31861 0))(
  ( (array!31862 (arr!15316 (Array (_ BitVec 32) (_ BitVec 64))) (size!15680 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31861)

(declare-datatypes ((SeekEntryResult!3739 0))(
  ( (MissingZero!3739 (index!17135 (_ BitVec 32))) (Found!3739 (index!17136 (_ BitVec 32))) (Intermediate!3739 (undefined!4551 Bool) (index!17137 (_ BitVec 32)) (x!46368 (_ BitVec 32))) (Undefined!3739) (MissingVacant!3739 (index!17138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31861 (_ BitVec 32)) SeekEntryResult!3739)

(assert (=> b!492268 (= e!289186 (= (seekEntryOrOpen!0 (select (arr!15316 a!3235) j!176) a!3235 mask!3524) (Found!3739 j!176)))))

(declare-fun b!492269 () Bool)

(declare-fun res!295080 () Bool)

(declare-fun e!289185 () Bool)

(assert (=> b!492269 (=> (not res!295080) (not e!289185))))

(declare-datatypes ((List!9381 0))(
  ( (Nil!9378) (Cons!9377 (h!10242 (_ BitVec 64)) (t!15601 List!9381)) )
))
(declare-fun arrayNoDuplicates!0 (array!31861 (_ BitVec 32) List!9381) Bool)

(assert (=> b!492269 (= res!295080 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9378))))

(declare-fun b!492270 () Bool)

(declare-fun res!295077 () Bool)

(declare-fun e!289184 () Bool)

(assert (=> b!492270 (=> (not res!295077) (not e!289184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492270 (= res!295077 (validKeyInArray!0 (select (arr!15316 a!3235) j!176)))))

(declare-fun b!492271 () Bool)

(assert (=> b!492271 (= e!289184 e!289185)))

(declare-fun res!295075 () Bool)

(assert (=> b!492271 (=> (not res!295075) (not e!289185))))

(declare-fun lt!222594 () SeekEntryResult!3739)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492271 (= res!295075 (or (= lt!222594 (MissingZero!3739 i!1204)) (= lt!222594 (MissingVacant!3739 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!492271 (= lt!222594 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492272 () Bool)

(declare-fun res!295081 () Bool)

(assert (=> b!492272 (=> (not res!295081) (not e!289184))))

(assert (=> b!492272 (= res!295081 (and (= (size!15680 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15680 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15680 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492273 () Bool)

(declare-fun res!295079 () Bool)

(assert (=> b!492273 (=> (not res!295079) (not e!289184))))

(assert (=> b!492273 (= res!295079 (validKeyInArray!0 k0!2280))))

(declare-fun b!492274 () Bool)

(declare-fun res!295076 () Bool)

(assert (=> b!492274 (=> (not res!295076) (not e!289185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31861 (_ BitVec 32)) Bool)

(assert (=> b!492274 (= res!295076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492275 () Bool)

(declare-fun e!289187 () Bool)

(assert (=> b!492275 (= e!289185 (not e!289187))))

(declare-fun res!295083 () Bool)

(assert (=> b!492275 (=> res!295083 e!289187)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31861 (_ BitVec 32)) SeekEntryResult!3739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492275 (= res!295083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15316 a!3235) j!176) mask!3524) (select (arr!15316 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) (array!31862 (store (arr!15316 a!3235) i!1204 k0!2280) (size!15680 a!3235)) mask!3524)))))

(assert (=> b!492275 e!289186))

(declare-fun res!295084 () Bool)

(assert (=> b!492275 (=> (not res!295084) (not e!289186))))

(assert (=> b!492275 (= res!295084 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14485 0))(
  ( (Unit!14486) )
))
(declare-fun lt!222595 () Unit!14485)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14485)

(assert (=> b!492275 (= lt!222595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!295082 () Bool)

(assert (=> start!44858 (=> (not res!295082) (not e!289184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44858 (= res!295082 (validMask!0 mask!3524))))

(assert (=> start!44858 e!289184))

(assert (=> start!44858 true))

(declare-fun array_inv!11175 (array!31861) Bool)

(assert (=> start!44858 (array_inv!11175 a!3235)))

(declare-fun b!492276 () Bool)

(assert (=> b!492276 (= e!289187 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!492277 () Bool)

(declare-fun res!295078 () Bool)

(assert (=> b!492277 (=> (not res!295078) (not e!289184))))

(declare-fun arrayContainsKey!0 (array!31861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492277 (= res!295078 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44858 res!295082) b!492272))

(assert (= (and b!492272 res!295081) b!492270))

(assert (= (and b!492270 res!295077) b!492273))

(assert (= (and b!492273 res!295079) b!492277))

(assert (= (and b!492277 res!295078) b!492271))

(assert (= (and b!492271 res!295075) b!492274))

(assert (= (and b!492274 res!295076) b!492269))

(assert (= (and b!492269 res!295080) b!492275))

(assert (= (and b!492275 res!295084) b!492268))

(assert (= (and b!492275 (not res!295083)) b!492276))

(declare-fun m!473215 () Bool)

(assert (=> start!44858 m!473215))

(declare-fun m!473217 () Bool)

(assert (=> start!44858 m!473217))

(declare-fun m!473219 () Bool)

(assert (=> b!492270 m!473219))

(assert (=> b!492270 m!473219))

(declare-fun m!473221 () Bool)

(assert (=> b!492270 m!473221))

(declare-fun m!473223 () Bool)

(assert (=> b!492274 m!473223))

(declare-fun m!473225 () Bool)

(assert (=> b!492277 m!473225))

(declare-fun m!473227 () Bool)

(assert (=> b!492273 m!473227))

(assert (=> b!492268 m!473219))

(assert (=> b!492268 m!473219))

(declare-fun m!473229 () Bool)

(assert (=> b!492268 m!473229))

(declare-fun m!473231 () Bool)

(assert (=> b!492275 m!473231))

(declare-fun m!473233 () Bool)

(assert (=> b!492275 m!473233))

(declare-fun m!473235 () Bool)

(assert (=> b!492275 m!473235))

(declare-fun m!473237 () Bool)

(assert (=> b!492275 m!473237))

(assert (=> b!492275 m!473219))

(declare-fun m!473239 () Bool)

(assert (=> b!492275 m!473239))

(assert (=> b!492275 m!473219))

(assert (=> b!492275 m!473237))

(declare-fun m!473241 () Bool)

(assert (=> b!492275 m!473241))

(assert (=> b!492275 m!473235))

(declare-fun m!473243 () Bool)

(assert (=> b!492275 m!473243))

(assert (=> b!492275 m!473219))

(declare-fun m!473245 () Bool)

(assert (=> b!492275 m!473245))

(assert (=> b!492275 m!473235))

(assert (=> b!492275 m!473241))

(declare-fun m!473247 () Bool)

(assert (=> b!492271 m!473247))

(declare-fun m!473249 () Bool)

(assert (=> b!492269 m!473249))

(check-sat (not start!44858) (not b!492269) (not b!492271) (not b!492273) (not b!492275) (not b!492274) (not b!492270) (not b!492268) (not b!492277))
(check-sat)
