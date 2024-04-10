; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44678 () Bool)

(assert start!44678)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31737 0))(
  ( (array!31738 (arr!15256 (Array (_ BitVec 32) (_ BitVec 64))) (size!15620 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31737)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!490245 () Bool)

(declare-fun e!288221 () Bool)

(declare-datatypes ((SeekEntryResult!3723 0))(
  ( (MissingZero!3723 (index!17071 (_ BitVec 32))) (Found!3723 (index!17072 (_ BitVec 32))) (Intermediate!3723 (undefined!4535 Bool) (index!17073 (_ BitVec 32)) (x!46173 (_ BitVec 32))) (Undefined!3723) (MissingVacant!3723 (index!17074 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31737 (_ BitVec 32)) SeekEntryResult!3723)

(assert (=> b!490245 (= e!288221 (= (seekEntryOrOpen!0 (select (arr!15256 a!3235) j!176) a!3235 mask!3524) (Found!3723 j!176)))))

(declare-fun b!490246 () Bool)

(declare-fun e!288222 () Bool)

(assert (=> b!490246 (= e!288222 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!221363 () (_ BitVec 32))

(declare-fun lt!221367 () SeekEntryResult!3723)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31737 (_ BitVec 32)) SeekEntryResult!3723)

(assert (=> b!490246 (= lt!221367 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221363 (select (store (arr!15256 a!3235) i!1204 k0!2280) j!176) (array!31738 (store (arr!15256 a!3235) i!1204 k0!2280) (size!15620 a!3235)) mask!3524))))

(declare-fun lt!221368 () SeekEntryResult!3723)

(declare-fun lt!221364 () (_ BitVec 32))

(assert (=> b!490246 (= lt!221368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221364 (select (arr!15256 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490246 (= lt!221363 (toIndex!0 (select (store (arr!15256 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490246 (= lt!221364 (toIndex!0 (select (arr!15256 a!3235) j!176) mask!3524))))

(assert (=> b!490246 e!288221))

(declare-fun res!293186 () Bool)

(assert (=> b!490246 (=> (not res!293186) (not e!288221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31737 (_ BitVec 32)) Bool)

(assert (=> b!490246 (= res!293186 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14392 0))(
  ( (Unit!14393) )
))
(declare-fun lt!221366 () Unit!14392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14392)

(assert (=> b!490246 (= lt!221366 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490247 () Bool)

(declare-fun e!288220 () Bool)

(assert (=> b!490247 (= e!288220 e!288222)))

(declare-fun res!293184 () Bool)

(assert (=> b!490247 (=> (not res!293184) (not e!288222))))

(declare-fun lt!221365 () SeekEntryResult!3723)

(assert (=> b!490247 (= res!293184 (or (= lt!221365 (MissingZero!3723 i!1204)) (= lt!221365 (MissingVacant!3723 i!1204))))))

(assert (=> b!490247 (= lt!221365 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!293185 () Bool)

(assert (=> start!44678 (=> (not res!293185) (not e!288220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44678 (= res!293185 (validMask!0 mask!3524))))

(assert (=> start!44678 e!288220))

(assert (=> start!44678 true))

(declare-fun array_inv!11052 (array!31737) Bool)

(assert (=> start!44678 (array_inv!11052 a!3235)))

(declare-fun b!490248 () Bool)

(declare-fun res!293182 () Bool)

(assert (=> b!490248 (=> (not res!293182) (not e!288220))))

(declare-fun arrayContainsKey!0 (array!31737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490248 (= res!293182 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490249 () Bool)

(declare-fun res!293183 () Bool)

(assert (=> b!490249 (=> (not res!293183) (not e!288222))))

(declare-datatypes ((List!9414 0))(
  ( (Nil!9411) (Cons!9410 (h!10272 (_ BitVec 64)) (t!15642 List!9414)) )
))
(declare-fun arrayNoDuplicates!0 (array!31737 (_ BitVec 32) List!9414) Bool)

(assert (=> b!490249 (= res!293183 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9411))))

(declare-fun b!490250 () Bool)

(declare-fun res!293189 () Bool)

(assert (=> b!490250 (=> (not res!293189) (not e!288222))))

(assert (=> b!490250 (= res!293189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490251 () Bool)

(declare-fun res!293188 () Bool)

(assert (=> b!490251 (=> (not res!293188) (not e!288220))))

(assert (=> b!490251 (= res!293188 (and (= (size!15620 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15620 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15620 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490252 () Bool)

(declare-fun res!293187 () Bool)

(assert (=> b!490252 (=> (not res!293187) (not e!288220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490252 (= res!293187 (validKeyInArray!0 k0!2280))))

(declare-fun b!490253 () Bool)

(declare-fun res!293181 () Bool)

(assert (=> b!490253 (=> (not res!293181) (not e!288220))))

(assert (=> b!490253 (= res!293181 (validKeyInArray!0 (select (arr!15256 a!3235) j!176)))))

(assert (= (and start!44678 res!293185) b!490251))

(assert (= (and b!490251 res!293188) b!490253))

(assert (= (and b!490253 res!293181) b!490252))

(assert (= (and b!490252 res!293187) b!490248))

(assert (= (and b!490248 res!293182) b!490247))

(assert (= (and b!490247 res!293184) b!490250))

(assert (= (and b!490250 res!293189) b!490249))

(assert (= (and b!490249 res!293183) b!490246))

(assert (= (and b!490246 res!293186) b!490245))

(declare-fun m!470289 () Bool)

(assert (=> b!490249 m!470289))

(declare-fun m!470291 () Bool)

(assert (=> b!490253 m!470291))

(assert (=> b!490253 m!470291))

(declare-fun m!470293 () Bool)

(assert (=> b!490253 m!470293))

(assert (=> b!490245 m!470291))

(assert (=> b!490245 m!470291))

(declare-fun m!470295 () Bool)

(assert (=> b!490245 m!470295))

(declare-fun m!470297 () Bool)

(assert (=> b!490252 m!470297))

(declare-fun m!470299 () Bool)

(assert (=> b!490248 m!470299))

(declare-fun m!470301 () Bool)

(assert (=> start!44678 m!470301))

(declare-fun m!470303 () Bool)

(assert (=> start!44678 m!470303))

(declare-fun m!470305 () Bool)

(assert (=> b!490247 m!470305))

(declare-fun m!470307 () Bool)

(assert (=> b!490246 m!470307))

(declare-fun m!470309 () Bool)

(assert (=> b!490246 m!470309))

(declare-fun m!470311 () Bool)

(assert (=> b!490246 m!470311))

(assert (=> b!490246 m!470311))

(declare-fun m!470313 () Bool)

(assert (=> b!490246 m!470313))

(assert (=> b!490246 m!470291))

(declare-fun m!470315 () Bool)

(assert (=> b!490246 m!470315))

(declare-fun m!470317 () Bool)

(assert (=> b!490246 m!470317))

(assert (=> b!490246 m!470311))

(declare-fun m!470319 () Bool)

(assert (=> b!490246 m!470319))

(assert (=> b!490246 m!470291))

(declare-fun m!470321 () Bool)

(assert (=> b!490246 m!470321))

(assert (=> b!490246 m!470291))

(declare-fun m!470323 () Bool)

(assert (=> b!490250 m!470323))

(check-sat (not b!490253) (not b!490252) (not b!490249) (not b!490246) (not b!490248) (not b!490247) (not b!490245) (not b!490250) (not start!44678))
