; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45608 () Bool)

(assert start!45608)

(declare-fun b!502432 () Bool)

(declare-fun res!303850 () Bool)

(declare-fun e!294290 () Bool)

(assert (=> b!502432 (=> (not res!303850) (not e!294290))))

(declare-datatypes ((array!32364 0))(
  ( (array!32365 (arr!15562 (Array (_ BitVec 32) (_ BitVec 64))) (size!15926 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32364)

(declare-datatypes ((List!9720 0))(
  ( (Nil!9717) (Cons!9716 (h!10593 (_ BitVec 64)) (t!15948 List!9720)) )
))
(declare-fun arrayNoDuplicates!0 (array!32364 (_ BitVec 32) List!9720) Bool)

(assert (=> b!502432 (= res!303850 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9717))))

(declare-datatypes ((SeekEntryResult!4029 0))(
  ( (MissingZero!4029 (index!18304 (_ BitVec 32))) (Found!4029 (index!18305 (_ BitVec 32))) (Intermediate!4029 (undefined!4841 Bool) (index!18306 (_ BitVec 32)) (x!47334 (_ BitVec 32))) (Undefined!4029) (MissingVacant!4029 (index!18307 (_ BitVec 32))) )
))
(declare-fun lt!228372 () SeekEntryResult!4029)

(declare-fun e!294291 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!502433 () Bool)

(declare-fun lt!228379 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32364 (_ BitVec 32)) SeekEntryResult!4029)

(assert (=> b!502433 (= e!294291 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228379 (index!18306 lt!228372) (select (arr!15562 a!3235) j!176) a!3235 mask!3524) (Found!4029 j!176))))))

(declare-fun b!502434 () Bool)

(declare-datatypes ((Unit!15192 0))(
  ( (Unit!15193) )
))
(declare-fun e!294294 () Unit!15192)

(declare-fun Unit!15194 () Unit!15192)

(assert (=> b!502434 (= e!294294 Unit!15194)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!228377 () Unit!15192)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32364 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15192)

(assert (=> b!502434 (= lt!228377 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228379 #b00000000000000000000000000000000 (index!18306 lt!228372) (x!47334 lt!228372) mask!3524))))

(declare-fun lt!228382 () (_ BitVec 64))

(declare-fun lt!228376 () array!32364)

(declare-fun res!303855 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32364 (_ BitVec 32)) SeekEntryResult!4029)

(assert (=> b!502434 (= res!303855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228379 lt!228382 lt!228376 mask!3524) (Intermediate!4029 false (index!18306 lt!228372) (x!47334 lt!228372))))))

(declare-fun e!294295 () Bool)

(assert (=> b!502434 (=> (not res!303855) (not e!294295))))

(assert (=> b!502434 e!294295))

(declare-fun b!502436 () Bool)

(declare-fun res!303853 () Bool)

(declare-fun e!294293 () Bool)

(assert (=> b!502436 (=> (not res!303853) (not e!294293))))

(declare-fun arrayContainsKey!0 (array!32364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502436 (= res!303853 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502437 () Bool)

(declare-fun res!303861 () Bool)

(assert (=> b!502437 (=> (not res!303861) (not e!294293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502437 (= res!303861 (validKeyInArray!0 (select (arr!15562 a!3235) j!176)))))

(declare-fun b!502438 () Bool)

(assert (=> b!502438 (= e!294295 false)))

(declare-fun b!502439 () Bool)

(declare-fun res!303859 () Bool)

(assert (=> b!502439 (=> (not res!303859) (not e!294290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32364 (_ BitVec 32)) Bool)

(assert (=> b!502439 (= res!303859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502440 () Bool)

(declare-fun e!294296 () Bool)

(assert (=> b!502440 (= e!294290 (not e!294296))))

(declare-fun res!303852 () Bool)

(assert (=> b!502440 (=> res!303852 e!294296)))

(declare-fun lt!228380 () (_ BitVec 32))

(assert (=> b!502440 (= res!303852 (= lt!228372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228380 lt!228382 lt!228376 mask!3524)))))

(assert (=> b!502440 (= lt!228372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228379 (select (arr!15562 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502440 (= lt!228380 (toIndex!0 lt!228382 mask!3524))))

(assert (=> b!502440 (= lt!228382 (select (store (arr!15562 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502440 (= lt!228379 (toIndex!0 (select (arr!15562 a!3235) j!176) mask!3524))))

(assert (=> b!502440 (= lt!228376 (array!32365 (store (arr!15562 a!3235) i!1204 k0!2280) (size!15926 a!3235)))))

(declare-fun e!294289 () Bool)

(assert (=> b!502440 e!294289))

(declare-fun res!303858 () Bool)

(assert (=> b!502440 (=> (not res!303858) (not e!294289))))

(assert (=> b!502440 (= res!303858 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228378 () Unit!15192)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15192)

(assert (=> b!502440 (= lt!228378 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502441 () Bool)

(declare-fun res!303856 () Bool)

(assert (=> b!502441 (=> res!303856 e!294296)))

(get-info :version)

(assert (=> b!502441 (= res!303856 (or (undefined!4841 lt!228372) (not ((_ is Intermediate!4029) lt!228372))))))

(declare-fun b!502442 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32364 (_ BitVec 32)) SeekEntryResult!4029)

(assert (=> b!502442 (= e!294289 (= (seekEntryOrOpen!0 (select (arr!15562 a!3235) j!176) a!3235 mask!3524) (Found!4029 j!176)))))

(declare-fun b!502443 () Bool)

(assert (=> b!502443 (= e!294293 e!294290)))

(declare-fun res!303863 () Bool)

(assert (=> b!502443 (=> (not res!303863) (not e!294290))))

(declare-fun lt!228381 () SeekEntryResult!4029)

(assert (=> b!502443 (= res!303863 (or (= lt!228381 (MissingZero!4029 i!1204)) (= lt!228381 (MissingVacant!4029 i!1204))))))

(assert (=> b!502443 (= lt!228381 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502444 () Bool)

(declare-fun res!303857 () Bool)

(assert (=> b!502444 (=> (not res!303857) (not e!294293))))

(assert (=> b!502444 (= res!303857 (and (= (size!15926 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15926 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15926 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502435 () Bool)

(declare-fun e!294292 () Bool)

(assert (=> b!502435 (= e!294292 true)))

(declare-fun lt!228373 () SeekEntryResult!4029)

(assert (=> b!502435 (= lt!228373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228379 lt!228382 lt!228376 mask!3524))))

(declare-fun res!303862 () Bool)

(assert (=> start!45608 (=> (not res!303862) (not e!294293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45608 (= res!303862 (validMask!0 mask!3524))))

(assert (=> start!45608 e!294293))

(assert (=> start!45608 true))

(declare-fun array_inv!11358 (array!32364) Bool)

(assert (=> start!45608 (array_inv!11358 a!3235)))

(declare-fun b!502445 () Bool)

(declare-fun res!303854 () Bool)

(assert (=> b!502445 (=> res!303854 e!294292)))

(assert (=> b!502445 (= res!303854 e!294291)))

(declare-fun res!303860 () Bool)

(assert (=> b!502445 (=> (not res!303860) (not e!294291))))

(assert (=> b!502445 (= res!303860 (bvsgt #b00000000000000000000000000000000 (x!47334 lt!228372)))))

(declare-fun b!502446 () Bool)

(declare-fun Unit!15195 () Unit!15192)

(assert (=> b!502446 (= e!294294 Unit!15195)))

(declare-fun b!502447 () Bool)

(assert (=> b!502447 (= e!294296 e!294292)))

(declare-fun res!303849 () Bool)

(assert (=> b!502447 (=> res!303849 e!294292)))

(assert (=> b!502447 (= res!303849 (or (bvsgt (x!47334 lt!228372) #b01111111111111111111111111111110) (bvslt lt!228379 #b00000000000000000000000000000000) (bvsge lt!228379 (size!15926 a!3235)) (bvslt (index!18306 lt!228372) #b00000000000000000000000000000000) (bvsge (index!18306 lt!228372) (size!15926 a!3235)) (not (= lt!228372 (Intermediate!4029 false (index!18306 lt!228372) (x!47334 lt!228372))))))))

(assert (=> b!502447 (= (index!18306 lt!228372) i!1204)))

(declare-fun lt!228375 () Unit!15192)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32364 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15192)

(assert (=> b!502447 (= lt!228375 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228379 #b00000000000000000000000000000000 (index!18306 lt!228372) (x!47334 lt!228372) mask!3524))))

(assert (=> b!502447 (and (or (= (select (arr!15562 a!3235) (index!18306 lt!228372)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15562 a!3235) (index!18306 lt!228372)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15562 a!3235) (index!18306 lt!228372)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15562 a!3235) (index!18306 lt!228372)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228374 () Unit!15192)

(assert (=> b!502447 (= lt!228374 e!294294)))

(declare-fun c!59570 () Bool)

(assert (=> b!502447 (= c!59570 (= (select (arr!15562 a!3235) (index!18306 lt!228372)) (select (arr!15562 a!3235) j!176)))))

(assert (=> b!502447 (and (bvslt (x!47334 lt!228372) #b01111111111111111111111111111110) (or (= (select (arr!15562 a!3235) (index!18306 lt!228372)) (select (arr!15562 a!3235) j!176)) (= (select (arr!15562 a!3235) (index!18306 lt!228372)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15562 a!3235) (index!18306 lt!228372)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502448 () Bool)

(declare-fun res!303851 () Bool)

(assert (=> b!502448 (=> (not res!303851) (not e!294293))))

(assert (=> b!502448 (= res!303851 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45608 res!303862) b!502444))

(assert (= (and b!502444 res!303857) b!502437))

(assert (= (and b!502437 res!303861) b!502448))

(assert (= (and b!502448 res!303851) b!502436))

(assert (= (and b!502436 res!303853) b!502443))

(assert (= (and b!502443 res!303863) b!502439))

(assert (= (and b!502439 res!303859) b!502432))

(assert (= (and b!502432 res!303850) b!502440))

(assert (= (and b!502440 res!303858) b!502442))

(assert (= (and b!502440 (not res!303852)) b!502441))

(assert (= (and b!502441 (not res!303856)) b!502447))

(assert (= (and b!502447 c!59570) b!502434))

(assert (= (and b!502447 (not c!59570)) b!502446))

(assert (= (and b!502434 res!303855) b!502438))

(assert (= (and b!502447 (not res!303849)) b!502445))

(assert (= (and b!502445 res!303860) b!502433))

(assert (= (and b!502445 (not res!303854)) b!502435))

(declare-fun m!483367 () Bool)

(assert (=> b!502448 m!483367))

(declare-fun m!483369 () Bool)

(assert (=> b!502439 m!483369))

(declare-fun m!483371 () Bool)

(assert (=> b!502442 m!483371))

(assert (=> b!502442 m!483371))

(declare-fun m!483373 () Bool)

(assert (=> b!502442 m!483373))

(declare-fun m!483375 () Bool)

(assert (=> b!502435 m!483375))

(declare-fun m!483377 () Bool)

(assert (=> b!502436 m!483377))

(declare-fun m!483379 () Bool)

(assert (=> b!502434 m!483379))

(assert (=> b!502434 m!483375))

(assert (=> b!502433 m!483371))

(assert (=> b!502433 m!483371))

(declare-fun m!483381 () Bool)

(assert (=> b!502433 m!483381))

(declare-fun m!483383 () Bool)

(assert (=> b!502432 m!483383))

(assert (=> b!502437 m!483371))

(assert (=> b!502437 m!483371))

(declare-fun m!483385 () Bool)

(assert (=> b!502437 m!483385))

(declare-fun m!483387 () Bool)

(assert (=> b!502447 m!483387))

(declare-fun m!483389 () Bool)

(assert (=> b!502447 m!483389))

(assert (=> b!502447 m!483371))

(declare-fun m!483391 () Bool)

(assert (=> b!502443 m!483391))

(declare-fun m!483393 () Bool)

(assert (=> start!45608 m!483393))

(declare-fun m!483395 () Bool)

(assert (=> start!45608 m!483395))

(declare-fun m!483397 () Bool)

(assert (=> b!502440 m!483397))

(declare-fun m!483399 () Bool)

(assert (=> b!502440 m!483399))

(declare-fun m!483401 () Bool)

(assert (=> b!502440 m!483401))

(assert (=> b!502440 m!483371))

(declare-fun m!483403 () Bool)

(assert (=> b!502440 m!483403))

(declare-fun m!483405 () Bool)

(assert (=> b!502440 m!483405))

(assert (=> b!502440 m!483371))

(declare-fun m!483407 () Bool)

(assert (=> b!502440 m!483407))

(declare-fun m!483409 () Bool)

(assert (=> b!502440 m!483409))

(assert (=> b!502440 m!483371))

(declare-fun m!483411 () Bool)

(assert (=> b!502440 m!483411))

(check-sat (not b!502435) (not b!502443) (not b!502442) (not b!502432) (not b!502436) (not start!45608) (not b!502448) (not b!502434) (not b!502439) (not b!502437) (not b!502433) (not b!502440) (not b!502447))
(check-sat)
