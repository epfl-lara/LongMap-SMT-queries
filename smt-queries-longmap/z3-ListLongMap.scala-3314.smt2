; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45830 () Bool)

(assert start!45830)

(declare-fun b!507478 () Bool)

(declare-fun e!296988 () Bool)

(assert (=> b!507478 (= e!296988 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32586 0))(
  ( (array!32587 (arr!15673 (Array (_ BitVec 32) (_ BitVec 64))) (size!16037 (_ BitVec 32))) )
))
(declare-fun lt!231756 () array!32586)

(declare-datatypes ((SeekEntryResult!4140 0))(
  ( (MissingZero!4140 (index!18748 (_ BitVec 32))) (Found!4140 (index!18749 (_ BitVec 32))) (Intermediate!4140 (undefined!4952 Bool) (index!18750 (_ BitVec 32)) (x!47741 (_ BitVec 32))) (Undefined!4140) (MissingVacant!4140 (index!18751 (_ BitVec 32))) )
))
(declare-fun lt!231762 () SeekEntryResult!4140)

(declare-fun lt!231760 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32586 (_ BitVec 32)) SeekEntryResult!4140)

(assert (=> b!507478 (= lt!231762 (seekEntryOrOpen!0 lt!231760 lt!231756 mask!3524))))

(assert (=> b!507478 false))

(declare-fun b!507479 () Bool)

(declare-fun e!296986 () Bool)

(declare-fun e!296985 () Bool)

(assert (=> b!507479 (= e!296986 (not e!296985))))

(declare-fun res!308444 () Bool)

(assert (=> b!507479 (=> res!308444 e!296985)))

(declare-fun lt!231759 () (_ BitVec 32))

(declare-fun lt!231758 () SeekEntryResult!4140)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32586 (_ BitVec 32)) SeekEntryResult!4140)

(assert (=> b!507479 (= res!308444 (= lt!231758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231759 lt!231760 lt!231756 mask!3524)))))

(declare-fun a!3235 () array!32586)

(declare-fun lt!231761 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507479 (= lt!231758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231761 (select (arr!15673 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507479 (= lt!231759 (toIndex!0 lt!231760 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507479 (= lt!231760 (select (store (arr!15673 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507479 (= lt!231761 (toIndex!0 (select (arr!15673 a!3235) j!176) mask!3524))))

(assert (=> b!507479 (= lt!231756 (array!32587 (store (arr!15673 a!3235) i!1204 k0!2280) (size!16037 a!3235)))))

(declare-fun e!296983 () Bool)

(assert (=> b!507479 e!296983))

(declare-fun res!308437 () Bool)

(assert (=> b!507479 (=> (not res!308437) (not e!296983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32586 (_ BitVec 32)) Bool)

(assert (=> b!507479 (= res!308437 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15568 0))(
  ( (Unit!15569) )
))
(declare-fun lt!231757 () Unit!15568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15568)

(assert (=> b!507479 (= lt!231757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507480 () Bool)

(declare-fun res!308438 () Bool)

(declare-fun e!296987 () Bool)

(assert (=> b!507480 (=> (not res!308438) (not e!296987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507480 (= res!308438 (validKeyInArray!0 k0!2280))))

(declare-fun b!507481 () Bool)

(declare-fun res!308439 () Bool)

(assert (=> b!507481 (=> (not res!308439) (not e!296987))))

(assert (=> b!507481 (= res!308439 (validKeyInArray!0 (select (arr!15673 a!3235) j!176)))))

(declare-fun res!308440 () Bool)

(assert (=> start!45830 (=> (not res!308440) (not e!296987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45830 (= res!308440 (validMask!0 mask!3524))))

(assert (=> start!45830 e!296987))

(assert (=> start!45830 true))

(declare-fun array_inv!11469 (array!32586) Bool)

(assert (=> start!45830 (array_inv!11469 a!3235)))

(declare-fun b!507482 () Bool)

(assert (=> b!507482 (= e!296987 e!296986)))

(declare-fun res!308443 () Bool)

(assert (=> b!507482 (=> (not res!308443) (not e!296986))))

(declare-fun lt!231763 () SeekEntryResult!4140)

(assert (=> b!507482 (= res!308443 (or (= lt!231763 (MissingZero!4140 i!1204)) (= lt!231763 (MissingVacant!4140 i!1204))))))

(assert (=> b!507482 (= lt!231763 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507483 () Bool)

(declare-fun res!308441 () Bool)

(assert (=> b!507483 (=> (not res!308441) (not e!296987))))

(declare-fun arrayContainsKey!0 (array!32586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507483 (= res!308441 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507484 () Bool)

(declare-fun res!308442 () Bool)

(assert (=> b!507484 (=> (not res!308442) (not e!296987))))

(assert (=> b!507484 (= res!308442 (and (= (size!16037 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16037 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16037 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507485 () Bool)

(assert (=> b!507485 (= e!296983 (= (seekEntryOrOpen!0 (select (arr!15673 a!3235) j!176) a!3235 mask!3524) (Found!4140 j!176)))))

(declare-fun b!507486 () Bool)

(assert (=> b!507486 (= e!296985 e!296988)))

(declare-fun res!308445 () Bool)

(assert (=> b!507486 (=> res!308445 e!296988)))

(declare-fun lt!231755 () Bool)

(assert (=> b!507486 (= res!308445 (or (and (not lt!231755) (undefined!4952 lt!231758)) (and (not lt!231755) (not (undefined!4952 lt!231758)))))))

(get-info :version)

(assert (=> b!507486 (= lt!231755 (not ((_ is Intermediate!4140) lt!231758)))))

(declare-fun b!507487 () Bool)

(declare-fun res!308447 () Bool)

(assert (=> b!507487 (=> (not res!308447) (not e!296986))))

(declare-datatypes ((List!9831 0))(
  ( (Nil!9828) (Cons!9827 (h!10704 (_ BitVec 64)) (t!16059 List!9831)) )
))
(declare-fun arrayNoDuplicates!0 (array!32586 (_ BitVec 32) List!9831) Bool)

(assert (=> b!507487 (= res!308447 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9828))))

(declare-fun b!507488 () Bool)

(declare-fun res!308446 () Bool)

(assert (=> b!507488 (=> (not res!308446) (not e!296986))))

(assert (=> b!507488 (= res!308446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45830 res!308440) b!507484))

(assert (= (and b!507484 res!308442) b!507481))

(assert (= (and b!507481 res!308439) b!507480))

(assert (= (and b!507480 res!308438) b!507483))

(assert (= (and b!507483 res!308441) b!507482))

(assert (= (and b!507482 res!308443) b!507488))

(assert (= (and b!507488 res!308446) b!507487))

(assert (= (and b!507487 res!308447) b!507479))

(assert (= (and b!507479 res!308437) b!507485))

(assert (= (and b!507479 (not res!308444)) b!507486))

(assert (= (and b!507486 (not res!308445)) b!507478))

(declare-fun m!488255 () Bool)

(assert (=> b!507478 m!488255))

(declare-fun m!488257 () Bool)

(assert (=> b!507488 m!488257))

(declare-fun m!488259 () Bool)

(assert (=> b!507482 m!488259))

(declare-fun m!488261 () Bool)

(assert (=> b!507479 m!488261))

(declare-fun m!488263 () Bool)

(assert (=> b!507479 m!488263))

(declare-fun m!488265 () Bool)

(assert (=> b!507479 m!488265))

(declare-fun m!488267 () Bool)

(assert (=> b!507479 m!488267))

(declare-fun m!488269 () Bool)

(assert (=> b!507479 m!488269))

(declare-fun m!488271 () Bool)

(assert (=> b!507479 m!488271))

(declare-fun m!488273 () Bool)

(assert (=> b!507479 m!488273))

(assert (=> b!507479 m!488271))

(declare-fun m!488275 () Bool)

(assert (=> b!507479 m!488275))

(assert (=> b!507479 m!488271))

(declare-fun m!488277 () Bool)

(assert (=> b!507479 m!488277))

(declare-fun m!488279 () Bool)

(assert (=> b!507480 m!488279))

(declare-fun m!488281 () Bool)

(assert (=> start!45830 m!488281))

(declare-fun m!488283 () Bool)

(assert (=> start!45830 m!488283))

(declare-fun m!488285 () Bool)

(assert (=> b!507487 m!488285))

(assert (=> b!507481 m!488271))

(assert (=> b!507481 m!488271))

(declare-fun m!488287 () Bool)

(assert (=> b!507481 m!488287))

(assert (=> b!507485 m!488271))

(assert (=> b!507485 m!488271))

(declare-fun m!488289 () Bool)

(assert (=> b!507485 m!488289))

(declare-fun m!488291 () Bool)

(assert (=> b!507483 m!488291))

(check-sat (not b!507478) (not b!507485) (not b!507483) (not b!507480) (not b!507487) (not b!507482) (not b!507488) (not b!507479) (not start!45830) (not b!507481))
(check-sat)
