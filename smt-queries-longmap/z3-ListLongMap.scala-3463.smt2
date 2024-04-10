; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48110 () Bool)

(assert start!48110)

(declare-fun b!529774 () Bool)

(declare-fun e!308702 () Bool)

(declare-fun e!308703 () Bool)

(assert (=> b!529774 (= e!308702 e!308703)))

(declare-fun res!325487 () Bool)

(assert (=> b!529774 (=> res!325487 e!308703)))

(declare-fun lt!244249 () Bool)

(declare-datatypes ((SeekEntryResult!4587 0))(
  ( (MissingZero!4587 (index!20572 (_ BitVec 32))) (Found!4587 (index!20573 (_ BitVec 32))) (Intermediate!4587 (undefined!5399 Bool) (index!20574 (_ BitVec 32)) (x!49545 (_ BitVec 32))) (Undefined!4587) (MissingVacant!4587 (index!20575 (_ BitVec 32))) )
))
(declare-fun lt!244248 () SeekEntryResult!4587)

(assert (=> b!529774 (= res!325487 (or (and (not lt!244249) (undefined!5399 lt!244248)) (and (not lt!244249) (not (undefined!5399 lt!244248)))))))

(get-info :version)

(assert (=> b!529774 (= lt!244249 (not ((_ is Intermediate!4587) lt!244248)))))

(declare-fun b!529775 () Bool)

(declare-fun res!325488 () Bool)

(declare-fun e!308698 () Bool)

(assert (=> b!529775 (=> (not res!325488) (not e!308698))))

(declare-datatypes ((array!33546 0))(
  ( (array!33547 (arr!16120 (Array (_ BitVec 32) (_ BitVec 64))) (size!16484 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33546)

(declare-datatypes ((List!10278 0))(
  ( (Nil!10275) (Cons!10274 (h!11214 (_ BitVec 64)) (t!16506 List!10278)) )
))
(declare-fun arrayNoDuplicates!0 (array!33546 (_ BitVec 32) List!10278) Bool)

(assert (=> b!529775 (= res!325488 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10275))))

(declare-fun b!529776 () Bool)

(declare-fun e!308700 () Bool)

(assert (=> b!529776 (= e!308700 e!308698)))

(declare-fun res!325486 () Bool)

(assert (=> b!529776 (=> (not res!325486) (not e!308698))))

(declare-fun lt!244250 () SeekEntryResult!4587)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529776 (= res!325486 (or (= lt!244250 (MissingZero!4587 i!1204)) (= lt!244250 (MissingVacant!4587 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33546 (_ BitVec 32)) SeekEntryResult!4587)

(assert (=> b!529776 (= lt!244250 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529777 () Bool)

(declare-fun res!325482 () Bool)

(assert (=> b!529777 (=> (not res!325482) (not e!308700))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!529777 (= res!325482 (and (= (size!16484 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16484 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16484 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529778 () Bool)

(assert (=> b!529778 (= e!308703 true)))

(assert (=> b!529778 false))

(declare-fun e!308699 () Bool)

(declare-fun b!529779 () Bool)

(assert (=> b!529779 (= e!308699 (= (seekEntryOrOpen!0 (select (arr!16120 a!3235) j!176) a!3235 mask!3524) (Found!4587 j!176)))))

(declare-fun res!325483 () Bool)

(assert (=> start!48110 (=> (not res!325483) (not e!308700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48110 (= res!325483 (validMask!0 mask!3524))))

(assert (=> start!48110 e!308700))

(assert (=> start!48110 true))

(declare-fun array_inv!11916 (array!33546) Bool)

(assert (=> start!48110 (array_inv!11916 a!3235)))

(declare-fun b!529780 () Bool)

(assert (=> b!529780 (= e!308698 (not e!308702))))

(declare-fun res!325480 () Bool)

(assert (=> b!529780 (=> res!325480 e!308702)))

(declare-fun lt!244247 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33546 (_ BitVec 32)) SeekEntryResult!4587)

(assert (=> b!529780 (= res!325480 (= lt!244248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244247 (select (store (arr!16120 a!3235) i!1204 k0!2280) j!176) (array!33547 (store (arr!16120 a!3235) i!1204 k0!2280) (size!16484 a!3235)) mask!3524)))))

(declare-fun lt!244251 () (_ BitVec 32))

(assert (=> b!529780 (= lt!244248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244251 (select (arr!16120 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529780 (= lt!244247 (toIndex!0 (select (store (arr!16120 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!529780 (= lt!244251 (toIndex!0 (select (arr!16120 a!3235) j!176) mask!3524))))

(assert (=> b!529780 e!308699))

(declare-fun res!325485 () Bool)

(assert (=> b!529780 (=> (not res!325485) (not e!308699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33546 (_ BitVec 32)) Bool)

(assert (=> b!529780 (= res!325485 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16786 0))(
  ( (Unit!16787) )
))
(declare-fun lt!244252 () Unit!16786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16786)

(assert (=> b!529780 (= lt!244252 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529781 () Bool)

(declare-fun res!325484 () Bool)

(assert (=> b!529781 (=> (not res!325484) (not e!308698))))

(assert (=> b!529781 (= res!325484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529782 () Bool)

(declare-fun res!325481 () Bool)

(assert (=> b!529782 (=> (not res!325481) (not e!308700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529782 (= res!325481 (validKeyInArray!0 k0!2280))))

(declare-fun b!529783 () Bool)

(declare-fun res!325490 () Bool)

(assert (=> b!529783 (=> (not res!325490) (not e!308700))))

(assert (=> b!529783 (= res!325490 (validKeyInArray!0 (select (arr!16120 a!3235) j!176)))))

(declare-fun b!529784 () Bool)

(declare-fun res!325489 () Bool)

(assert (=> b!529784 (=> (not res!325489) (not e!308700))))

(declare-fun arrayContainsKey!0 (array!33546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529784 (= res!325489 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!48110 res!325483) b!529777))

(assert (= (and b!529777 res!325482) b!529783))

(assert (= (and b!529783 res!325490) b!529782))

(assert (= (and b!529782 res!325481) b!529784))

(assert (= (and b!529784 res!325489) b!529776))

(assert (= (and b!529776 res!325486) b!529781))

(assert (= (and b!529781 res!325484) b!529775))

(assert (= (and b!529775 res!325488) b!529780))

(assert (= (and b!529780 res!325485) b!529779))

(assert (= (and b!529780 (not res!325480)) b!529774))

(assert (= (and b!529774 (not res!325487)) b!529778))

(declare-fun m!510261 () Bool)

(assert (=> b!529775 m!510261))

(declare-fun m!510263 () Bool)

(assert (=> b!529781 m!510263))

(declare-fun m!510265 () Bool)

(assert (=> b!529783 m!510265))

(assert (=> b!529783 m!510265))

(declare-fun m!510267 () Bool)

(assert (=> b!529783 m!510267))

(declare-fun m!510269 () Bool)

(assert (=> b!529780 m!510269))

(declare-fun m!510271 () Bool)

(assert (=> b!529780 m!510271))

(declare-fun m!510273 () Bool)

(assert (=> b!529780 m!510273))

(assert (=> b!529780 m!510265))

(declare-fun m!510275 () Bool)

(assert (=> b!529780 m!510275))

(assert (=> b!529780 m!510265))

(declare-fun m!510277 () Bool)

(assert (=> b!529780 m!510277))

(assert (=> b!529780 m!510273))

(declare-fun m!510279 () Bool)

(assert (=> b!529780 m!510279))

(assert (=> b!529780 m!510273))

(declare-fun m!510281 () Bool)

(assert (=> b!529780 m!510281))

(assert (=> b!529780 m!510265))

(declare-fun m!510283 () Bool)

(assert (=> b!529780 m!510283))

(declare-fun m!510285 () Bool)

(assert (=> start!48110 m!510285))

(declare-fun m!510287 () Bool)

(assert (=> start!48110 m!510287))

(declare-fun m!510289 () Bool)

(assert (=> b!529776 m!510289))

(assert (=> b!529779 m!510265))

(assert (=> b!529779 m!510265))

(declare-fun m!510291 () Bool)

(assert (=> b!529779 m!510291))

(declare-fun m!510293 () Bool)

(assert (=> b!529784 m!510293))

(declare-fun m!510295 () Bool)

(assert (=> b!529782 m!510295))

(check-sat (not b!529776) (not start!48110) (not b!529781) (not b!529783) (not b!529775) (not b!529784) (not b!529779) (not b!529782) (not b!529780))
(check-sat)
