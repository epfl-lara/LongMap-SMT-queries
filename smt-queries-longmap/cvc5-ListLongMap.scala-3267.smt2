; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45474 () Bool)

(assert start!45474)

(declare-fun res!302443 () Bool)

(declare-fun e!293303 () Bool)

(assert (=> start!45474 (=> (not res!302443) (not e!293303))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45474 (= res!302443 (validMask!0 mask!3524))))

(assert (=> start!45474 e!293303))

(assert (=> start!45474 true))

(declare-datatypes ((array!32299 0))(
  ( (array!32300 (arr!15531 (Array (_ BitVec 32) (_ BitVec 64))) (size!15895 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32299)

(declare-fun array_inv!11327 (array!32299) Bool)

(assert (=> start!45474 (array_inv!11327 a!3235)))

(declare-fun b!500628 () Bool)

(declare-fun res!302433 () Bool)

(declare-fun e!293306 () Bool)

(assert (=> b!500628 (=> (not res!302433) (not e!293306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32299 (_ BitVec 32)) Bool)

(assert (=> b!500628 (= res!302433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!293307 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!500629 () Bool)

(declare-datatypes ((SeekEntryResult!3998 0))(
  ( (MissingZero!3998 (index!18174 (_ BitVec 32))) (Found!3998 (index!18175 (_ BitVec 32))) (Intermediate!3998 (undefined!4810 Bool) (index!18176 (_ BitVec 32)) (x!47211 (_ BitVec 32))) (Undefined!3998) (MissingVacant!3998 (index!18177 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32299 (_ BitVec 32)) SeekEntryResult!3998)

(assert (=> b!500629 (= e!293307 (= (seekEntryOrOpen!0 (select (arr!15531 a!3235) j!176) a!3235 mask!3524) (Found!3998 j!176)))))

(declare-fun b!500630 () Bool)

(declare-fun res!302441 () Bool)

(assert (=> b!500630 (=> (not res!302441) (not e!293303))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500630 (= res!302441 (and (= (size!15895 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15895 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15895 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500631 () Bool)

(declare-fun e!293308 () Bool)

(assert (=> b!500631 (= e!293308 true)))

(declare-fun lt!227248 () array!32299)

(declare-fun lt!227240 () SeekEntryResult!3998)

(declare-fun lt!227243 () (_ BitVec 32))

(declare-fun lt!227246 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32299 (_ BitVec 32)) SeekEntryResult!3998)

(assert (=> b!500631 (= lt!227240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227243 lt!227246 lt!227248 mask!3524))))

(declare-fun b!500632 () Bool)

(declare-fun res!302437 () Bool)

(assert (=> b!500632 (=> (not res!302437) (not e!293303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500632 (= res!302437 (validKeyInArray!0 (select (arr!15531 a!3235) j!176)))))

(declare-fun b!500633 () Bool)

(assert (=> b!500633 (= e!293303 e!293306)))

(declare-fun res!302435 () Bool)

(assert (=> b!500633 (=> (not res!302435) (not e!293306))))

(declare-fun lt!227242 () SeekEntryResult!3998)

(assert (=> b!500633 (= res!302435 (or (= lt!227242 (MissingZero!3998 i!1204)) (= lt!227242 (MissingVacant!3998 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!500633 (= lt!227242 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500634 () Bool)

(declare-fun res!302440 () Bool)

(assert (=> b!500634 (=> (not res!302440) (not e!293306))))

(declare-datatypes ((List!9689 0))(
  ( (Nil!9686) (Cons!9685 (h!10559 (_ BitVec 64)) (t!15917 List!9689)) )
))
(declare-fun arrayNoDuplicates!0 (array!32299 (_ BitVec 32) List!9689) Bool)

(assert (=> b!500634 (= res!302440 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9686))))

(declare-fun b!500635 () Bool)

(declare-fun e!293309 () Bool)

(assert (=> b!500635 (= e!293309 false)))

(declare-fun b!500636 () Bool)

(declare-fun e!293305 () Bool)

(assert (=> b!500636 (= e!293305 e!293308)))

(declare-fun res!302444 () Bool)

(assert (=> b!500636 (=> res!302444 e!293308)))

(declare-fun lt!227247 () SeekEntryResult!3998)

(assert (=> b!500636 (= res!302444 (or (bvsgt #b00000000000000000000000000000000 (x!47211 lt!227247)) (bvsgt (x!47211 lt!227247) #b01111111111111111111111111111110) (bvslt lt!227243 #b00000000000000000000000000000000) (bvsge lt!227243 (size!15895 a!3235)) (bvslt (index!18176 lt!227247) #b00000000000000000000000000000000) (bvsge (index!18176 lt!227247) (size!15895 a!3235)) (not (= lt!227247 (Intermediate!3998 false (index!18176 lt!227247) (x!47211 lt!227247))))))))

(assert (=> b!500636 (and (or (= (select (arr!15531 a!3235) (index!18176 lt!227247)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15531 a!3235) (index!18176 lt!227247)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15531 a!3235) (index!18176 lt!227247)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15531 a!3235) (index!18176 lt!227247)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!15068 0))(
  ( (Unit!15069) )
))
(declare-fun lt!227245 () Unit!15068)

(declare-fun e!293304 () Unit!15068)

(assert (=> b!500636 (= lt!227245 e!293304)))

(declare-fun c!59375 () Bool)

(assert (=> b!500636 (= c!59375 (= (select (arr!15531 a!3235) (index!18176 lt!227247)) (select (arr!15531 a!3235) j!176)))))

(assert (=> b!500636 (and (bvslt (x!47211 lt!227247) #b01111111111111111111111111111110) (or (= (select (arr!15531 a!3235) (index!18176 lt!227247)) (select (arr!15531 a!3235) j!176)) (= (select (arr!15531 a!3235) (index!18176 lt!227247)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15531 a!3235) (index!18176 lt!227247)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500637 () Bool)

(declare-fun res!302439 () Bool)

(assert (=> b!500637 (=> (not res!302439) (not e!293303))))

(declare-fun arrayContainsKey!0 (array!32299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500637 (= res!302439 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500638 () Bool)

(declare-fun res!302432 () Bool)

(assert (=> b!500638 (=> (not res!302432) (not e!293303))))

(assert (=> b!500638 (= res!302432 (validKeyInArray!0 k!2280))))

(declare-fun b!500639 () Bool)

(declare-fun res!302434 () Bool)

(assert (=> b!500639 (=> res!302434 e!293305)))

(assert (=> b!500639 (= res!302434 (or (undefined!4810 lt!227247) (not (is-Intermediate!3998 lt!227247))))))

(declare-fun b!500640 () Bool)

(declare-fun Unit!15070 () Unit!15068)

(assert (=> b!500640 (= e!293304 Unit!15070)))

(declare-fun b!500641 () Bool)

(declare-fun Unit!15071 () Unit!15068)

(assert (=> b!500641 (= e!293304 Unit!15071)))

(declare-fun lt!227244 () Unit!15068)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32299 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15068)

(assert (=> b!500641 (= lt!227244 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227243 #b00000000000000000000000000000000 (index!18176 lt!227247) (x!47211 lt!227247) mask!3524))))

(declare-fun res!302436 () Bool)

(assert (=> b!500641 (= res!302436 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227243 lt!227246 lt!227248 mask!3524) (Intermediate!3998 false (index!18176 lt!227247) (x!47211 lt!227247))))))

(assert (=> b!500641 (=> (not res!302436) (not e!293309))))

(assert (=> b!500641 e!293309))

(declare-fun b!500642 () Bool)

(assert (=> b!500642 (= e!293306 (not e!293305))))

(declare-fun res!302438 () Bool)

(assert (=> b!500642 (=> res!302438 e!293305)))

(declare-fun lt!227241 () (_ BitVec 32))

(assert (=> b!500642 (= res!302438 (= lt!227247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227241 lt!227246 lt!227248 mask!3524)))))

(assert (=> b!500642 (= lt!227247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227243 (select (arr!15531 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500642 (= lt!227241 (toIndex!0 lt!227246 mask!3524))))

(assert (=> b!500642 (= lt!227246 (select (store (arr!15531 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500642 (= lt!227243 (toIndex!0 (select (arr!15531 a!3235) j!176) mask!3524))))

(assert (=> b!500642 (= lt!227248 (array!32300 (store (arr!15531 a!3235) i!1204 k!2280) (size!15895 a!3235)))))

(assert (=> b!500642 e!293307))

(declare-fun res!302442 () Bool)

(assert (=> b!500642 (=> (not res!302442) (not e!293307))))

(assert (=> b!500642 (= res!302442 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227239 () Unit!15068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15068)

(assert (=> b!500642 (= lt!227239 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45474 res!302443) b!500630))

(assert (= (and b!500630 res!302441) b!500632))

(assert (= (and b!500632 res!302437) b!500638))

(assert (= (and b!500638 res!302432) b!500637))

(assert (= (and b!500637 res!302439) b!500633))

(assert (= (and b!500633 res!302435) b!500628))

(assert (= (and b!500628 res!302433) b!500634))

(assert (= (and b!500634 res!302440) b!500642))

(assert (= (and b!500642 res!302442) b!500629))

(assert (= (and b!500642 (not res!302438)) b!500639))

(assert (= (and b!500639 (not res!302434)) b!500636))

(assert (= (and b!500636 c!59375) b!500641))

(assert (= (and b!500636 (not c!59375)) b!500640))

(assert (= (and b!500641 res!302436) b!500635))

(assert (= (and b!500636 (not res!302444)) b!500631))

(declare-fun m!481749 () Bool)

(assert (=> b!500631 m!481749))

(declare-fun m!481751 () Bool)

(assert (=> b!500637 m!481751))

(declare-fun m!481753 () Bool)

(assert (=> b!500628 m!481753))

(declare-fun m!481755 () Bool)

(assert (=> start!45474 m!481755))

(declare-fun m!481757 () Bool)

(assert (=> start!45474 m!481757))

(declare-fun m!481759 () Bool)

(assert (=> b!500638 m!481759))

(declare-fun m!481761 () Bool)

(assert (=> b!500633 m!481761))

(declare-fun m!481763 () Bool)

(assert (=> b!500642 m!481763))

(declare-fun m!481765 () Bool)

(assert (=> b!500642 m!481765))

(declare-fun m!481767 () Bool)

(assert (=> b!500642 m!481767))

(declare-fun m!481769 () Bool)

(assert (=> b!500642 m!481769))

(assert (=> b!500642 m!481763))

(declare-fun m!481771 () Bool)

(assert (=> b!500642 m!481771))

(assert (=> b!500642 m!481763))

(declare-fun m!481773 () Bool)

(assert (=> b!500642 m!481773))

(declare-fun m!481775 () Bool)

(assert (=> b!500642 m!481775))

(declare-fun m!481777 () Bool)

(assert (=> b!500642 m!481777))

(declare-fun m!481779 () Bool)

(assert (=> b!500642 m!481779))

(declare-fun m!481781 () Bool)

(assert (=> b!500636 m!481781))

(assert (=> b!500636 m!481763))

(assert (=> b!500632 m!481763))

(assert (=> b!500632 m!481763))

(declare-fun m!481783 () Bool)

(assert (=> b!500632 m!481783))

(declare-fun m!481785 () Bool)

(assert (=> b!500634 m!481785))

(assert (=> b!500629 m!481763))

(assert (=> b!500629 m!481763))

(declare-fun m!481787 () Bool)

(assert (=> b!500629 m!481787))

(declare-fun m!481789 () Bool)

(assert (=> b!500641 m!481789))

(assert (=> b!500641 m!481749))

(push 1)

