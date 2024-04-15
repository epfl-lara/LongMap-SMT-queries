; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45756 () Bool)

(assert start!45756)

(declare-fun b!506184 () Bool)

(declare-fun e!296252 () Bool)

(declare-fun e!296255 () Bool)

(assert (=> b!506184 (= e!296252 (not e!296255))))

(declare-fun res!307292 () Bool)

(assert (=> b!506184 (=> res!307292 e!296255)))

(declare-datatypes ((SeekEntryResult!4105 0))(
  ( (MissingZero!4105 (index!18608 (_ BitVec 32))) (Found!4105 (index!18609 (_ BitVec 32))) (Intermediate!4105 (undefined!4917 Bool) (index!18610 (_ BitVec 32)) (x!47621 (_ BitVec 32))) (Undefined!4105) (MissingVacant!4105 (index!18611 (_ BitVec 32))) )
))
(declare-fun lt!230870 () SeekEntryResult!4105)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32522 0))(
  ( (array!32523 (arr!15641 (Array (_ BitVec 32) (_ BitVec 64))) (size!16006 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32522)

(declare-fun lt!230867 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32522 (_ BitVec 32)) SeekEntryResult!4105)

(assert (=> b!506184 (= res!307292 (= lt!230870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230867 (select (store (arr!15641 a!3235) i!1204 k0!2280) j!176) (array!32523 (store (arr!15641 a!3235) i!1204 k0!2280) (size!16006 a!3235)) mask!3524)))))

(declare-fun lt!230868 () (_ BitVec 32))

(assert (=> b!506184 (= lt!230870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230868 (select (arr!15641 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506184 (= lt!230867 (toIndex!0 (select (store (arr!15641 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506184 (= lt!230868 (toIndex!0 (select (arr!15641 a!3235) j!176) mask!3524))))

(declare-fun e!296251 () Bool)

(assert (=> b!506184 e!296251))

(declare-fun res!307295 () Bool)

(assert (=> b!506184 (=> (not res!307295) (not e!296251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32522 (_ BitVec 32)) Bool)

(assert (=> b!506184 (= res!307295 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15484 0))(
  ( (Unit!15485) )
))
(declare-fun lt!230872 () Unit!15484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15484)

(assert (=> b!506184 (= lt!230872 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506185 () Bool)

(declare-fun e!296253 () Bool)

(assert (=> b!506185 (= e!296253 true)))

(assert (=> b!506185 false))

(declare-fun b!506186 () Bool)

(declare-fun res!307291 () Bool)

(declare-fun e!296256 () Bool)

(assert (=> b!506186 (=> (not res!307291) (not e!296256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506186 (= res!307291 (validKeyInArray!0 k0!2280))))

(declare-fun b!506187 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32522 (_ BitVec 32)) SeekEntryResult!4105)

(assert (=> b!506187 (= e!296251 (= (seekEntryOrOpen!0 (select (arr!15641 a!3235) j!176) a!3235 mask!3524) (Found!4105 j!176)))))

(declare-fun b!506188 () Bool)

(declare-fun res!307287 () Bool)

(assert (=> b!506188 (=> (not res!307287) (not e!296256))))

(assert (=> b!506188 (= res!307287 (validKeyInArray!0 (select (arr!15641 a!3235) j!176)))))

(declare-fun b!506189 () Bool)

(declare-fun res!307285 () Bool)

(assert (=> b!506189 (=> (not res!307285) (not e!296252))))

(assert (=> b!506189 (= res!307285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506190 () Bool)

(assert (=> b!506190 (= e!296256 e!296252)))

(declare-fun res!307288 () Bool)

(assert (=> b!506190 (=> (not res!307288) (not e!296252))))

(declare-fun lt!230871 () SeekEntryResult!4105)

(assert (=> b!506190 (= res!307288 (or (= lt!230871 (MissingZero!4105 i!1204)) (= lt!230871 (MissingVacant!4105 i!1204))))))

(assert (=> b!506190 (= lt!230871 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506191 () Bool)

(declare-fun res!307289 () Bool)

(assert (=> b!506191 (=> (not res!307289) (not e!296256))))

(declare-fun arrayContainsKey!0 (array!32522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506191 (= res!307289 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!307286 () Bool)

(assert (=> start!45756 (=> (not res!307286) (not e!296256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45756 (= res!307286 (validMask!0 mask!3524))))

(assert (=> start!45756 e!296256))

(assert (=> start!45756 true))

(declare-fun array_inv!11524 (array!32522) Bool)

(assert (=> start!45756 (array_inv!11524 a!3235)))

(declare-fun b!506192 () Bool)

(declare-fun res!307293 () Bool)

(assert (=> b!506192 (=> (not res!307293) (not e!296256))))

(assert (=> b!506192 (= res!307293 (and (= (size!16006 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16006 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16006 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506193 () Bool)

(assert (=> b!506193 (= e!296255 e!296253)))

(declare-fun res!307294 () Bool)

(assert (=> b!506193 (=> res!307294 e!296253)))

(declare-fun lt!230869 () Bool)

(assert (=> b!506193 (= res!307294 (or (and (not lt!230869) (undefined!4917 lt!230870)) (and (not lt!230869) (not (undefined!4917 lt!230870)))))))

(get-info :version)

(assert (=> b!506193 (= lt!230869 (not ((_ is Intermediate!4105) lt!230870)))))

(declare-fun b!506194 () Bool)

(declare-fun res!307290 () Bool)

(assert (=> b!506194 (=> (not res!307290) (not e!296252))))

(declare-datatypes ((List!9838 0))(
  ( (Nil!9835) (Cons!9834 (h!10711 (_ BitVec 64)) (t!16057 List!9838)) )
))
(declare-fun arrayNoDuplicates!0 (array!32522 (_ BitVec 32) List!9838) Bool)

(assert (=> b!506194 (= res!307290 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9835))))

(assert (= (and start!45756 res!307286) b!506192))

(assert (= (and b!506192 res!307293) b!506188))

(assert (= (and b!506188 res!307287) b!506186))

(assert (= (and b!506186 res!307291) b!506191))

(assert (= (and b!506191 res!307289) b!506190))

(assert (= (and b!506190 res!307288) b!506189))

(assert (= (and b!506189 res!307285) b!506194))

(assert (= (and b!506194 res!307290) b!506184))

(assert (= (and b!506184 res!307295) b!506187))

(assert (= (and b!506184 (not res!307292)) b!506193))

(assert (= (and b!506193 (not res!307294)) b!506185))

(declare-fun m!486367 () Bool)

(assert (=> b!506186 m!486367))

(declare-fun m!486369 () Bool)

(assert (=> b!506194 m!486369))

(declare-fun m!486371 () Bool)

(assert (=> b!506187 m!486371))

(assert (=> b!506187 m!486371))

(declare-fun m!486373 () Bool)

(assert (=> b!506187 m!486373))

(declare-fun m!486375 () Bool)

(assert (=> b!506191 m!486375))

(declare-fun m!486377 () Bool)

(assert (=> b!506190 m!486377))

(assert (=> b!506188 m!486371))

(assert (=> b!506188 m!486371))

(declare-fun m!486379 () Bool)

(assert (=> b!506188 m!486379))

(declare-fun m!486381 () Bool)

(assert (=> start!45756 m!486381))

(declare-fun m!486383 () Bool)

(assert (=> start!45756 m!486383))

(declare-fun m!486385 () Bool)

(assert (=> b!506189 m!486385))

(declare-fun m!486387 () Bool)

(assert (=> b!506184 m!486387))

(declare-fun m!486389 () Bool)

(assert (=> b!506184 m!486389))

(declare-fun m!486391 () Bool)

(assert (=> b!506184 m!486391))

(assert (=> b!506184 m!486391))

(declare-fun m!486393 () Bool)

(assert (=> b!506184 m!486393))

(assert (=> b!506184 m!486371))

(declare-fun m!486395 () Bool)

(assert (=> b!506184 m!486395))

(assert (=> b!506184 m!486371))

(declare-fun m!486397 () Bool)

(assert (=> b!506184 m!486397))

(assert (=> b!506184 m!486371))

(declare-fun m!486399 () Bool)

(assert (=> b!506184 m!486399))

(assert (=> b!506184 m!486391))

(declare-fun m!486401 () Bool)

(assert (=> b!506184 m!486401))

(check-sat (not b!506184) (not b!506189) (not b!506194) (not b!506191) (not b!506190) (not b!506187) (not b!506188) (not b!506186) (not start!45756))
(check-sat)
