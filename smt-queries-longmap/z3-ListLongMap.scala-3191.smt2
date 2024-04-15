; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44760 () Bool)

(assert start!44760)

(declare-fun b!491252 () Bool)

(declare-fun e!288621 () Bool)

(declare-fun e!288619 () Bool)

(assert (=> b!491252 (= e!288621 e!288619)))

(declare-fun res!294335 () Bool)

(assert (=> b!491252 (=> (not res!294335) (not e!288619))))

(declare-datatypes ((SeekEntryResult!3766 0))(
  ( (MissingZero!3766 (index!17243 (_ BitVec 32))) (Found!3766 (index!17244 (_ BitVec 32))) (Intermediate!3766 (undefined!4578 Bool) (index!17245 (_ BitVec 32)) (x!46339 (_ BitVec 32))) (Undefined!3766) (MissingVacant!3766 (index!17246 (_ BitVec 32))) )
))
(declare-fun lt!221975 () SeekEntryResult!3766)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491252 (= res!294335 (or (= lt!221975 (MissingZero!3766 i!1204)) (= lt!221975 (MissingVacant!3766 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31829 0))(
  ( (array!31830 (arr!15302 (Array (_ BitVec 32) (_ BitVec 64))) (size!15667 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31829)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31829 (_ BitVec 32)) SeekEntryResult!3766)

(assert (=> b!491252 (= lt!221975 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491253 () Bool)

(declare-fun res!294330 () Bool)

(assert (=> b!491253 (=> (not res!294330) (not e!288619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31829 (_ BitVec 32)) Bool)

(assert (=> b!491253 (= res!294330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!294333 () Bool)

(assert (=> start!44760 (=> (not res!294333) (not e!288621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44760 (= res!294333 (validMask!0 mask!3524))))

(assert (=> start!44760 e!288621))

(assert (=> start!44760 true))

(declare-fun array_inv!11185 (array!31829) Bool)

(assert (=> start!44760 (array_inv!11185 a!3235)))

(declare-fun b!491254 () Bool)

(declare-fun res!294336 () Bool)

(assert (=> b!491254 (=> (not res!294336) (not e!288621))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491254 (= res!294336 (validKeyInArray!0 (select (arr!15302 a!3235) j!176)))))

(declare-fun b!491255 () Bool)

(declare-fun res!294332 () Bool)

(assert (=> b!491255 (=> (not res!294332) (not e!288621))))

(assert (=> b!491255 (= res!294332 (and (= (size!15667 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15667 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15667 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491256 () Bool)

(declare-fun res!294337 () Bool)

(assert (=> b!491256 (=> (not res!294337) (not e!288621))))

(declare-fun arrayContainsKey!0 (array!31829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491256 (= res!294337 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491257 () Bool)

(declare-fun e!288618 () Bool)

(assert (=> b!491257 (= e!288618 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!221980 () (_ BitVec 64))

(declare-fun lt!221979 () SeekEntryResult!3766)

(declare-fun lt!221976 () array!31829)

(assert (=> b!491257 (= lt!221979 (seekEntryOrOpen!0 lt!221980 lt!221976 mask!3524))))

(declare-datatypes ((Unit!14464 0))(
  ( (Unit!14465) )
))
(declare-fun lt!221978 () Unit!14464)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31829 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14464)

(assert (=> b!491257 (= lt!221978 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491258 () Bool)

(declare-fun res!294338 () Bool)

(assert (=> b!491258 (=> (not res!294338) (not e!288621))))

(assert (=> b!491258 (= res!294338 (validKeyInArray!0 k0!2280))))

(declare-fun b!491259 () Bool)

(declare-fun res!294334 () Bool)

(assert (=> b!491259 (=> (not res!294334) (not e!288619))))

(declare-datatypes ((List!9499 0))(
  ( (Nil!9496) (Cons!9495 (h!10357 (_ BitVec 64)) (t!15718 List!9499)) )
))
(declare-fun arrayNoDuplicates!0 (array!31829 (_ BitVec 32) List!9499) Bool)

(assert (=> b!491259 (= res!294334 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9496))))

(declare-fun b!491260 () Bool)

(assert (=> b!491260 (= e!288619 (not e!288618))))

(declare-fun res!294331 () Bool)

(assert (=> b!491260 (=> res!294331 e!288618)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31829 (_ BitVec 32)) SeekEntryResult!3766)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491260 (= res!294331 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15302 a!3235) j!176) mask!3524) (select (arr!15302 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221980 mask!3524) lt!221980 lt!221976 mask!3524))))))

(assert (=> b!491260 (= lt!221980 (select (store (arr!15302 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491260 (= lt!221976 (array!31830 (store (arr!15302 a!3235) i!1204 k0!2280) (size!15667 a!3235)))))

(assert (=> b!491260 (= lt!221979 (Found!3766 j!176))))

(assert (=> b!491260 (= lt!221979 (seekEntryOrOpen!0 (select (arr!15302 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491260 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221977 () Unit!14464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14464)

(assert (=> b!491260 (= lt!221977 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44760 res!294333) b!491255))

(assert (= (and b!491255 res!294332) b!491254))

(assert (= (and b!491254 res!294336) b!491258))

(assert (= (and b!491258 res!294338) b!491256))

(assert (= (and b!491256 res!294337) b!491252))

(assert (= (and b!491252 res!294335) b!491253))

(assert (= (and b!491253 res!294330) b!491259))

(assert (= (and b!491259 res!294334) b!491260))

(assert (= (and b!491260 (not res!294331)) b!491257))

(declare-fun m!471391 () Bool)

(assert (=> b!491260 m!471391))

(declare-fun m!471393 () Bool)

(assert (=> b!491260 m!471393))

(declare-fun m!471395 () Bool)

(assert (=> b!491260 m!471395))

(declare-fun m!471397 () Bool)

(assert (=> b!491260 m!471397))

(declare-fun m!471399 () Bool)

(assert (=> b!491260 m!471399))

(declare-fun m!471401 () Bool)

(assert (=> b!491260 m!471401))

(assert (=> b!491260 m!471399))

(assert (=> b!491260 m!471397))

(assert (=> b!491260 m!471399))

(declare-fun m!471403 () Bool)

(assert (=> b!491260 m!471403))

(assert (=> b!491260 m!471399))

(declare-fun m!471405 () Bool)

(assert (=> b!491260 m!471405))

(declare-fun m!471407 () Bool)

(assert (=> b!491260 m!471407))

(declare-fun m!471409 () Bool)

(assert (=> b!491260 m!471409))

(assert (=> b!491260 m!471407))

(declare-fun m!471411 () Bool)

(assert (=> b!491258 m!471411))

(declare-fun m!471413 () Bool)

(assert (=> b!491256 m!471413))

(declare-fun m!471415 () Bool)

(assert (=> b!491252 m!471415))

(assert (=> b!491254 m!471399))

(assert (=> b!491254 m!471399))

(declare-fun m!471417 () Bool)

(assert (=> b!491254 m!471417))

(declare-fun m!471419 () Bool)

(assert (=> b!491253 m!471419))

(declare-fun m!471421 () Bool)

(assert (=> start!44760 m!471421))

(declare-fun m!471423 () Bool)

(assert (=> start!44760 m!471423))

(declare-fun m!471425 () Bool)

(assert (=> b!491257 m!471425))

(declare-fun m!471427 () Bool)

(assert (=> b!491257 m!471427))

(declare-fun m!471429 () Bool)

(assert (=> b!491259 m!471429))

(check-sat (not b!491259) (not b!491254) (not b!491260) (not start!44760) (not b!491256) (not b!491258) (not b!491252) (not b!491257) (not b!491253))
(check-sat)
