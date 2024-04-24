; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45812 () Bool)

(assert start!45812)

(declare-fun b!507285 () Bool)

(declare-fun e!296872 () Bool)

(assert (=> b!507285 (= e!296872 true)))

(declare-datatypes ((SeekEntryResult!4087 0))(
  ( (MissingZero!4087 (index!18536 (_ BitVec 32))) (Found!4087 (index!18537 (_ BitVec 32))) (Intermediate!4087 (undefined!4899 Bool) (index!18538 (_ BitVec 32)) (x!47677 (_ BitVec 32))) (Undefined!4087) (MissingVacant!4087 (index!18539 (_ BitVec 32))) )
))
(declare-fun lt!231663 () SeekEntryResult!4087)

(declare-datatypes ((array!32569 0))(
  ( (array!32570 (arr!15664 (Array (_ BitVec 32) (_ BitVec 64))) (size!16028 (_ BitVec 32))) )
))
(declare-fun lt!231664 () array!32569)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!231667 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32569 (_ BitVec 32)) SeekEntryResult!4087)

(assert (=> b!507285 (= lt!231663 (seekEntryOrOpen!0 lt!231667 lt!231664 mask!3524))))

(assert (=> b!507285 false))

(declare-fun b!507286 () Bool)

(declare-fun res!308299 () Bool)

(declare-fun e!296876 () Bool)

(assert (=> b!507286 (=> (not res!308299) (not e!296876))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507286 (= res!308299 (validKeyInArray!0 k0!2280))))

(declare-fun res!308300 () Bool)

(assert (=> start!45812 (=> (not res!308300) (not e!296876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45812 (= res!308300 (validMask!0 mask!3524))))

(assert (=> start!45812 e!296876))

(assert (=> start!45812 true))

(declare-fun a!3235 () array!32569)

(declare-fun array_inv!11523 (array!32569) Bool)

(assert (=> start!45812 (array_inv!11523 a!3235)))

(declare-fun b!507287 () Bool)

(declare-fun res!308301 () Bool)

(assert (=> b!507287 (=> (not res!308301) (not e!296876))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507287 (= res!308301 (and (= (size!16028 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16028 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16028 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507288 () Bool)

(declare-fun e!296873 () Bool)

(assert (=> b!507288 (= e!296873 e!296872)))

(declare-fun res!308308 () Bool)

(assert (=> b!507288 (=> res!308308 e!296872)))

(declare-fun lt!231666 () Bool)

(declare-fun lt!231661 () SeekEntryResult!4087)

(assert (=> b!507288 (= res!308308 (or (and (not lt!231666) (undefined!4899 lt!231661)) (and (not lt!231666) (not (undefined!4899 lt!231661)))))))

(get-info :version)

(assert (=> b!507288 (= lt!231666 (not ((_ is Intermediate!4087) lt!231661)))))

(declare-fun b!507289 () Bool)

(declare-fun e!296875 () Bool)

(assert (=> b!507289 (= e!296876 e!296875)))

(declare-fun res!308302 () Bool)

(assert (=> b!507289 (=> (not res!308302) (not e!296875))))

(declare-fun lt!231665 () SeekEntryResult!4087)

(assert (=> b!507289 (= res!308302 (or (= lt!231665 (MissingZero!4087 i!1204)) (= lt!231665 (MissingVacant!4087 i!1204))))))

(assert (=> b!507289 (= lt!231665 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun e!296874 () Bool)

(declare-fun b!507290 () Bool)

(assert (=> b!507290 (= e!296874 (= (seekEntryOrOpen!0 (select (arr!15664 a!3235) j!176) a!3235 mask!3524) (Found!4087 j!176)))))

(declare-fun b!507291 () Bool)

(declare-fun res!308306 () Bool)

(assert (=> b!507291 (=> (not res!308306) (not e!296875))))

(declare-datatypes ((List!9729 0))(
  ( (Nil!9726) (Cons!9725 (h!10602 (_ BitVec 64)) (t!15949 List!9729)) )
))
(declare-fun arrayNoDuplicates!0 (array!32569 (_ BitVec 32) List!9729) Bool)

(assert (=> b!507291 (= res!308306 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9726))))

(declare-fun b!507292 () Bool)

(declare-fun res!308298 () Bool)

(assert (=> b!507292 (=> (not res!308298) (not e!296876))))

(assert (=> b!507292 (= res!308298 (validKeyInArray!0 (select (arr!15664 a!3235) j!176)))))

(declare-fun b!507293 () Bool)

(declare-fun res!308305 () Bool)

(assert (=> b!507293 (=> (not res!308305) (not e!296875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32569 (_ BitVec 32)) Bool)

(assert (=> b!507293 (= res!308305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507294 () Bool)

(assert (=> b!507294 (= e!296875 (not e!296873))))

(declare-fun res!308307 () Bool)

(assert (=> b!507294 (=> res!308307 e!296873)))

(declare-fun lt!231659 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32569 (_ BitVec 32)) SeekEntryResult!4087)

(assert (=> b!507294 (= res!308307 (= lt!231661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231659 lt!231667 lt!231664 mask!3524)))))

(declare-fun lt!231662 () (_ BitVec 32))

(assert (=> b!507294 (= lt!231661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231662 (select (arr!15664 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507294 (= lt!231659 (toIndex!0 lt!231667 mask!3524))))

(assert (=> b!507294 (= lt!231667 (select (store (arr!15664 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507294 (= lt!231662 (toIndex!0 (select (arr!15664 a!3235) j!176) mask!3524))))

(assert (=> b!507294 (= lt!231664 (array!32570 (store (arr!15664 a!3235) i!1204 k0!2280) (size!16028 a!3235)))))

(assert (=> b!507294 e!296874))

(declare-fun res!308303 () Bool)

(assert (=> b!507294 (=> (not res!308303) (not e!296874))))

(assert (=> b!507294 (= res!308303 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15523 0))(
  ( (Unit!15524) )
))
(declare-fun lt!231660 () Unit!15523)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15523)

(assert (=> b!507294 (= lt!231660 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507295 () Bool)

(declare-fun res!308304 () Bool)

(assert (=> b!507295 (=> (not res!308304) (not e!296876))))

(declare-fun arrayContainsKey!0 (array!32569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507295 (= res!308304 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45812 res!308300) b!507287))

(assert (= (and b!507287 res!308301) b!507292))

(assert (= (and b!507292 res!308298) b!507286))

(assert (= (and b!507286 res!308299) b!507295))

(assert (= (and b!507295 res!308304) b!507289))

(assert (= (and b!507289 res!308302) b!507293))

(assert (= (and b!507293 res!308305) b!507291))

(assert (= (and b!507291 res!308306) b!507294))

(assert (= (and b!507294 res!308303) b!507290))

(assert (= (and b!507294 (not res!308307)) b!507288))

(assert (= (and b!507288 (not res!308308)) b!507285))

(declare-fun m!488287 () Bool)

(assert (=> b!507289 m!488287))

(declare-fun m!488289 () Bool)

(assert (=> b!507292 m!488289))

(assert (=> b!507292 m!488289))

(declare-fun m!488291 () Bool)

(assert (=> b!507292 m!488291))

(assert (=> b!507290 m!488289))

(assert (=> b!507290 m!488289))

(declare-fun m!488293 () Bool)

(assert (=> b!507290 m!488293))

(declare-fun m!488295 () Bool)

(assert (=> b!507294 m!488295))

(declare-fun m!488297 () Bool)

(assert (=> b!507294 m!488297))

(declare-fun m!488299 () Bool)

(assert (=> b!507294 m!488299))

(declare-fun m!488301 () Bool)

(assert (=> b!507294 m!488301))

(declare-fun m!488303 () Bool)

(assert (=> b!507294 m!488303))

(assert (=> b!507294 m!488289))

(declare-fun m!488305 () Bool)

(assert (=> b!507294 m!488305))

(assert (=> b!507294 m!488289))

(declare-fun m!488307 () Bool)

(assert (=> b!507294 m!488307))

(assert (=> b!507294 m!488289))

(declare-fun m!488309 () Bool)

(assert (=> b!507294 m!488309))

(declare-fun m!488311 () Bool)

(assert (=> b!507286 m!488311))

(declare-fun m!488313 () Bool)

(assert (=> b!507285 m!488313))

(declare-fun m!488315 () Bool)

(assert (=> start!45812 m!488315))

(declare-fun m!488317 () Bool)

(assert (=> start!45812 m!488317))

(declare-fun m!488319 () Bool)

(assert (=> b!507295 m!488319))

(declare-fun m!488321 () Bool)

(assert (=> b!507293 m!488321))

(declare-fun m!488323 () Bool)

(assert (=> b!507291 m!488323))

(check-sat (not b!507294) (not start!45812) (not b!507291) (not b!507293) (not b!507290) (not b!507295) (not b!507289) (not b!507292) (not b!507286) (not b!507285))
(check-sat)
