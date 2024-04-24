; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44600 () Bool)

(assert start!44600)

(declare-fun res!292264 () Bool)

(declare-fun e!287775 () Bool)

(assert (=> start!44600 (=> (not res!292264) (not e!287775))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44600 (= res!292264 (validMask!0 mask!3524))))

(assert (=> start!44600 e!287775))

(assert (=> start!44600 true))

(declare-datatypes ((array!31660 0))(
  ( (array!31661 (arr!15217 (Array (_ BitVec 32) (_ BitVec 64))) (size!15581 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31660)

(declare-fun array_inv!11076 (array!31660) Bool)

(assert (=> start!44600 (array_inv!11076 a!3235)))

(declare-fun b!489266 () Bool)

(declare-fun res!292263 () Bool)

(assert (=> b!489266 (=> (not res!292263) (not e!287775))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489266 (= res!292263 (validKeyInArray!0 (select (arr!15217 a!3235) j!176)))))

(declare-fun b!489267 () Bool)

(declare-fun res!292261 () Bool)

(declare-fun e!287772 () Bool)

(assert (=> b!489267 (=> (not res!292261) (not e!287772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31660 (_ BitVec 32)) Bool)

(assert (=> b!489267 (= res!292261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489268 () Bool)

(declare-fun res!292259 () Bool)

(assert (=> b!489268 (=> (not res!292259) (not e!287775))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489268 (= res!292259 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489269 () Bool)

(declare-fun res!292260 () Bool)

(assert (=> b!489269 (=> (not res!292260) (not e!287775))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489269 (= res!292260 (and (= (size!15581 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15581 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15581 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489270 () Bool)

(assert (=> b!489270 (= e!287772 (not true))))

(declare-datatypes ((SeekEntryResult!3640 0))(
  ( (MissingZero!3640 (index!16739 (_ BitVec 32))) (Found!3640 (index!16740 (_ BitVec 32))) (Intermediate!3640 (undefined!4452 Bool) (index!16741 (_ BitVec 32)) (x!45999 (_ BitVec 32))) (Undefined!3640) (MissingVacant!3640 (index!16742 (_ BitVec 32))) )
))
(declare-fun lt!220763 () SeekEntryResult!3640)

(declare-fun lt!220768 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31660 (_ BitVec 32)) SeekEntryResult!3640)

(assert (=> b!489270 (= lt!220763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220768 (select (store (arr!15217 a!3235) i!1204 k0!2280) j!176) (array!31661 (store (arr!15217 a!3235) i!1204 k0!2280) (size!15581 a!3235)) mask!3524))))

(declare-fun lt!220766 () SeekEntryResult!3640)

(declare-fun lt!220767 () (_ BitVec 32))

(assert (=> b!489270 (= lt!220766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220767 (select (arr!15217 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489270 (= lt!220768 (toIndex!0 (select (store (arr!15217 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489270 (= lt!220767 (toIndex!0 (select (arr!15217 a!3235) j!176) mask!3524))))

(declare-fun e!287773 () Bool)

(assert (=> b!489270 e!287773))

(declare-fun res!292258 () Bool)

(assert (=> b!489270 (=> (not res!292258) (not e!287773))))

(assert (=> b!489270 (= res!292258 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14287 0))(
  ( (Unit!14288) )
))
(declare-fun lt!220765 () Unit!14287)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14287)

(assert (=> b!489270 (= lt!220765 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489271 () Bool)

(declare-fun res!292256 () Bool)

(assert (=> b!489271 (=> (not res!292256) (not e!287775))))

(assert (=> b!489271 (= res!292256 (validKeyInArray!0 k0!2280))))

(declare-fun b!489272 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31660 (_ BitVec 32)) SeekEntryResult!3640)

(assert (=> b!489272 (= e!287773 (= (seekEntryOrOpen!0 (select (arr!15217 a!3235) j!176) a!3235 mask!3524) (Found!3640 j!176)))))

(declare-fun b!489273 () Bool)

(assert (=> b!489273 (= e!287775 e!287772)))

(declare-fun res!292262 () Bool)

(assert (=> b!489273 (=> (not res!292262) (not e!287772))))

(declare-fun lt!220764 () SeekEntryResult!3640)

(assert (=> b!489273 (= res!292262 (or (= lt!220764 (MissingZero!3640 i!1204)) (= lt!220764 (MissingVacant!3640 i!1204))))))

(assert (=> b!489273 (= lt!220764 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489274 () Bool)

(declare-fun res!292257 () Bool)

(assert (=> b!489274 (=> (not res!292257) (not e!287772))))

(declare-datatypes ((List!9282 0))(
  ( (Nil!9279) (Cons!9278 (h!10140 (_ BitVec 64)) (t!15502 List!9282)) )
))
(declare-fun arrayNoDuplicates!0 (array!31660 (_ BitVec 32) List!9282) Bool)

(assert (=> b!489274 (= res!292257 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9279))))

(assert (= (and start!44600 res!292264) b!489269))

(assert (= (and b!489269 res!292260) b!489266))

(assert (= (and b!489266 res!292263) b!489271))

(assert (= (and b!489271 res!292256) b!489268))

(assert (= (and b!489268 res!292259) b!489273))

(assert (= (and b!489273 res!292262) b!489267))

(assert (= (and b!489267 res!292261) b!489274))

(assert (= (and b!489274 res!292257) b!489270))

(assert (= (and b!489270 res!292258) b!489272))

(declare-fun m!469249 () Bool)

(assert (=> b!489268 m!469249))

(declare-fun m!469251 () Bool)

(assert (=> start!44600 m!469251))

(declare-fun m!469253 () Bool)

(assert (=> start!44600 m!469253))

(declare-fun m!469255 () Bool)

(assert (=> b!489272 m!469255))

(assert (=> b!489272 m!469255))

(declare-fun m!469257 () Bool)

(assert (=> b!489272 m!469257))

(assert (=> b!489266 m!469255))

(assert (=> b!489266 m!469255))

(declare-fun m!469259 () Bool)

(assert (=> b!489266 m!469259))

(declare-fun m!469261 () Bool)

(assert (=> b!489267 m!469261))

(declare-fun m!469263 () Bool)

(assert (=> b!489274 m!469263))

(declare-fun m!469265 () Bool)

(assert (=> b!489273 m!469265))

(declare-fun m!469267 () Bool)

(assert (=> b!489270 m!469267))

(declare-fun m!469269 () Bool)

(assert (=> b!489270 m!469269))

(declare-fun m!469271 () Bool)

(assert (=> b!489270 m!469271))

(assert (=> b!489270 m!469271))

(declare-fun m!469273 () Bool)

(assert (=> b!489270 m!469273))

(assert (=> b!489270 m!469255))

(declare-fun m!469275 () Bool)

(assert (=> b!489270 m!469275))

(assert (=> b!489270 m!469255))

(declare-fun m!469277 () Bool)

(assert (=> b!489270 m!469277))

(assert (=> b!489270 m!469271))

(declare-fun m!469279 () Bool)

(assert (=> b!489270 m!469279))

(assert (=> b!489270 m!469255))

(declare-fun m!469281 () Bool)

(assert (=> b!489270 m!469281))

(declare-fun m!469283 () Bool)

(assert (=> b!489271 m!469283))

(check-sat (not b!489272) (not b!489267) (not b!489266) (not start!44600) (not b!489268) (not b!489274) (not b!489273) (not b!489271) (not b!489270))
(check-sat)
