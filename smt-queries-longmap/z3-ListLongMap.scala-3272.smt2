; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45564 () Bool)

(assert start!45564)

(declare-fun b!501345 () Bool)

(declare-fun e!293686 () Bool)

(assert (=> b!501345 (= e!293686 false)))

(declare-fun b!501346 () Bool)

(declare-fun res!303008 () Bool)

(declare-fun e!293689 () Bool)

(assert (=> b!501346 (=> (not res!303008) (not e!293689))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501346 (= res!303008 (validKeyInArray!0 k0!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4009 0))(
  ( (MissingZero!4009 (index!18224 (_ BitVec 32))) (Found!4009 (index!18225 (_ BitVec 32))) (Intermediate!4009 (undefined!4821 Bool) (index!18226 (_ BitVec 32)) (x!47269 (_ BitVec 32))) (Undefined!4009) (MissingVacant!4009 (index!18227 (_ BitVec 32))) )
))
(declare-fun lt!227612 () SeekEntryResult!4009)

(declare-fun e!293687 () Bool)

(declare-datatypes ((array!32330 0))(
  ( (array!32331 (arr!15545 (Array (_ BitVec 32) (_ BitVec 64))) (size!15910 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32330)

(declare-fun b!501347 () Bool)

(declare-fun lt!227619 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32330 (_ BitVec 32)) SeekEntryResult!4009)

(assert (=> b!501347 (= e!293687 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!227619 (index!18226 lt!227612) (select (arr!15545 a!3235) j!176) a!3235 mask!3524) (Found!4009 j!176))))))

(declare-fun b!501348 () Bool)

(declare-fun res!303003 () Bool)

(assert (=> b!501348 (=> (not res!303003) (not e!293689))))

(assert (=> b!501348 (= res!303003 (validKeyInArray!0 (select (arr!15545 a!3235) j!176)))))

(declare-fun b!501349 () Bool)

(declare-fun res!303013 () Bool)

(declare-fun e!293684 () Bool)

(assert (=> b!501349 (=> (not res!303013) (not e!293684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32330 (_ BitVec 32)) Bool)

(assert (=> b!501349 (= res!303013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501350 () Bool)

(declare-fun e!293691 () Bool)

(assert (=> b!501350 (= e!293684 (not e!293691))))

(declare-fun res!303000 () Bool)

(assert (=> b!501350 (=> res!303000 e!293691)))

(declare-fun lt!227613 () array!32330)

(declare-fun lt!227620 () (_ BitVec 64))

(declare-fun lt!227618 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32330 (_ BitVec 32)) SeekEntryResult!4009)

(assert (=> b!501350 (= res!303000 (= lt!227612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227618 lt!227620 lt!227613 mask!3524)))))

(assert (=> b!501350 (= lt!227612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227619 (select (arr!15545 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501350 (= lt!227618 (toIndex!0 lt!227620 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501350 (= lt!227620 (select (store (arr!15545 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501350 (= lt!227619 (toIndex!0 (select (arr!15545 a!3235) j!176) mask!3524))))

(assert (=> b!501350 (= lt!227613 (array!32331 (store (arr!15545 a!3235) i!1204 k0!2280) (size!15910 a!3235)))))

(declare-fun e!293688 () Bool)

(assert (=> b!501350 e!293688))

(declare-fun res!303004 () Bool)

(assert (=> b!501350 (=> (not res!303004) (not e!293688))))

(assert (=> b!501350 (= res!303004 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15106 0))(
  ( (Unit!15107) )
))
(declare-fun lt!227615 () Unit!15106)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15106)

(assert (=> b!501350 (= lt!227615 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501351 () Bool)

(declare-fun res!303012 () Bool)

(assert (=> b!501351 (=> (not res!303012) (not e!293684))))

(declare-datatypes ((List!9742 0))(
  ( (Nil!9739) (Cons!9738 (h!10615 (_ BitVec 64)) (t!15961 List!9742)) )
))
(declare-fun arrayNoDuplicates!0 (array!32330 (_ BitVec 32) List!9742) Bool)

(assert (=> b!501351 (= res!303012 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9739))))

(declare-fun b!501352 () Bool)

(declare-fun e!293685 () Unit!15106)

(declare-fun Unit!15108 () Unit!15106)

(assert (=> b!501352 (= e!293685 Unit!15108)))

(declare-fun b!501353 () Bool)

(declare-fun Unit!15109 () Unit!15106)

(assert (=> b!501353 (= e!293685 Unit!15109)))

(declare-fun lt!227616 () Unit!15106)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32330 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15106)

(assert (=> b!501353 (= lt!227616 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227619 #b00000000000000000000000000000000 (index!18226 lt!227612) (x!47269 lt!227612) mask!3524))))

(declare-fun res!303002 () Bool)

(assert (=> b!501353 (= res!303002 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227619 lt!227620 lt!227613 mask!3524) (Intermediate!4009 false (index!18226 lt!227612) (x!47269 lt!227612))))))

(assert (=> b!501353 (=> (not res!303002) (not e!293686))))

(assert (=> b!501353 e!293686))

(declare-fun b!501354 () Bool)

(declare-fun e!293683 () Bool)

(assert (=> b!501354 (= e!293683 true)))

(declare-fun lt!227614 () SeekEntryResult!4009)

(assert (=> b!501354 (= lt!227614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227619 lt!227620 lt!227613 mask!3524))))

(declare-fun b!501355 () Bool)

(assert (=> b!501355 (= e!293689 e!293684)))

(declare-fun res!303007 () Bool)

(assert (=> b!501355 (=> (not res!303007) (not e!293684))))

(declare-fun lt!227611 () SeekEntryResult!4009)

(assert (=> b!501355 (= res!303007 (or (= lt!227611 (MissingZero!4009 i!1204)) (= lt!227611 (MissingVacant!4009 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32330 (_ BitVec 32)) SeekEntryResult!4009)

(assert (=> b!501355 (= lt!227611 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501356 () Bool)

(declare-fun res!303005 () Bool)

(assert (=> b!501356 (=> res!303005 e!293691)))

(get-info :version)

(assert (=> b!501356 (= res!303005 (or (undefined!4821 lt!227612) (not ((_ is Intermediate!4009) lt!227612))))))

(declare-fun b!501357 () Bool)

(declare-fun res!303001 () Bool)

(assert (=> b!501357 (=> (not res!303001) (not e!293689))))

(assert (=> b!501357 (= res!303001 (and (= (size!15910 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15910 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15910 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501358 () Bool)

(declare-fun res!303006 () Bool)

(assert (=> b!501358 (=> res!303006 e!293683)))

(assert (=> b!501358 (= res!303006 e!293687)))

(declare-fun res!303014 () Bool)

(assert (=> b!501358 (=> (not res!303014) (not e!293687))))

(assert (=> b!501358 (= res!303014 (bvsgt #b00000000000000000000000000000000 (x!47269 lt!227612)))))

(declare-fun res!303010 () Bool)

(assert (=> start!45564 (=> (not res!303010) (not e!293689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45564 (= res!303010 (validMask!0 mask!3524))))

(assert (=> start!45564 e!293689))

(assert (=> start!45564 true))

(declare-fun array_inv!11428 (array!32330) Bool)

(assert (=> start!45564 (array_inv!11428 a!3235)))

(declare-fun b!501359 () Bool)

(declare-fun res!303011 () Bool)

(assert (=> b!501359 (=> (not res!303011) (not e!293689))))

(declare-fun arrayContainsKey!0 (array!32330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501359 (= res!303011 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501360 () Bool)

(assert (=> b!501360 (= e!293688 (= (seekEntryOrOpen!0 (select (arr!15545 a!3235) j!176) a!3235 mask!3524) (Found!4009 j!176)))))

(declare-fun b!501361 () Bool)

(assert (=> b!501361 (= e!293691 e!293683)))

(declare-fun res!303009 () Bool)

(assert (=> b!501361 (=> res!303009 e!293683)))

(assert (=> b!501361 (= res!303009 (or (bvsgt (x!47269 lt!227612) #b01111111111111111111111111111110) (bvslt lt!227619 #b00000000000000000000000000000000) (bvsge lt!227619 (size!15910 a!3235)) (bvslt (index!18226 lt!227612) #b00000000000000000000000000000000) (bvsge (index!18226 lt!227612) (size!15910 a!3235)) (not (= lt!227612 (Intermediate!4009 false (index!18226 lt!227612) (x!47269 lt!227612))))))))

(assert (=> b!501361 (= (index!18226 lt!227612) i!1204)))

(declare-fun lt!227617 () Unit!15106)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32330 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15106)

(assert (=> b!501361 (= lt!227617 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227619 #b00000000000000000000000000000000 (index!18226 lt!227612) (x!47269 lt!227612) mask!3524))))

(assert (=> b!501361 (and (or (= (select (arr!15545 a!3235) (index!18226 lt!227612)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15545 a!3235) (index!18226 lt!227612)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15545 a!3235) (index!18226 lt!227612)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15545 a!3235) (index!18226 lt!227612)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227610 () Unit!15106)

(assert (=> b!501361 (= lt!227610 e!293685)))

(declare-fun c!59451 () Bool)

(assert (=> b!501361 (= c!59451 (= (select (arr!15545 a!3235) (index!18226 lt!227612)) (select (arr!15545 a!3235) j!176)))))

(assert (=> b!501361 (and (bvslt (x!47269 lt!227612) #b01111111111111111111111111111110) (or (= (select (arr!15545 a!3235) (index!18226 lt!227612)) (select (arr!15545 a!3235) j!176)) (= (select (arr!15545 a!3235) (index!18226 lt!227612)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15545 a!3235) (index!18226 lt!227612)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45564 res!303010) b!501357))

(assert (= (and b!501357 res!303001) b!501348))

(assert (= (and b!501348 res!303003) b!501346))

(assert (= (and b!501346 res!303008) b!501359))

(assert (= (and b!501359 res!303011) b!501355))

(assert (= (and b!501355 res!303007) b!501349))

(assert (= (and b!501349 res!303013) b!501351))

(assert (= (and b!501351 res!303012) b!501350))

(assert (= (and b!501350 res!303004) b!501360))

(assert (= (and b!501350 (not res!303000)) b!501356))

(assert (= (and b!501356 (not res!303005)) b!501361))

(assert (= (and b!501361 c!59451) b!501353))

(assert (= (and b!501361 (not c!59451)) b!501352))

(assert (= (and b!501353 res!303002) b!501345))

(assert (= (and b!501361 (not res!303009)) b!501358))

(assert (= (and b!501358 res!303014) b!501347))

(assert (= (and b!501358 (not res!303006)) b!501354))

(declare-fun m!481879 () Bool)

(assert (=> b!501351 m!481879))

(declare-fun m!481881 () Bool)

(assert (=> b!501353 m!481881))

(declare-fun m!481883 () Bool)

(assert (=> b!501353 m!481883))

(declare-fun m!481885 () Bool)

(assert (=> b!501347 m!481885))

(assert (=> b!501347 m!481885))

(declare-fun m!481887 () Bool)

(assert (=> b!501347 m!481887))

(assert (=> b!501360 m!481885))

(assert (=> b!501360 m!481885))

(declare-fun m!481889 () Bool)

(assert (=> b!501360 m!481889))

(declare-fun m!481891 () Bool)

(assert (=> b!501359 m!481891))

(declare-fun m!481893 () Bool)

(assert (=> start!45564 m!481893))

(declare-fun m!481895 () Bool)

(assert (=> start!45564 m!481895))

(declare-fun m!481897 () Bool)

(assert (=> b!501355 m!481897))

(declare-fun m!481899 () Bool)

(assert (=> b!501349 m!481899))

(assert (=> b!501354 m!481883))

(declare-fun m!481901 () Bool)

(assert (=> b!501350 m!481901))

(declare-fun m!481903 () Bool)

(assert (=> b!501350 m!481903))

(declare-fun m!481905 () Bool)

(assert (=> b!501350 m!481905))

(assert (=> b!501350 m!481885))

(declare-fun m!481907 () Bool)

(assert (=> b!501350 m!481907))

(assert (=> b!501350 m!481885))

(declare-fun m!481909 () Bool)

(assert (=> b!501350 m!481909))

(assert (=> b!501350 m!481885))

(declare-fun m!481911 () Bool)

(assert (=> b!501350 m!481911))

(declare-fun m!481913 () Bool)

(assert (=> b!501350 m!481913))

(declare-fun m!481915 () Bool)

(assert (=> b!501350 m!481915))

(declare-fun m!481917 () Bool)

(assert (=> b!501346 m!481917))

(declare-fun m!481919 () Bool)

(assert (=> b!501361 m!481919))

(declare-fun m!481921 () Bool)

(assert (=> b!501361 m!481921))

(assert (=> b!501361 m!481885))

(assert (=> b!501348 m!481885))

(assert (=> b!501348 m!481885))

(declare-fun m!481923 () Bool)

(assert (=> b!501348 m!481923))

(check-sat (not b!501360) (not b!501350) (not b!501359) (not b!501353) (not b!501349) (not b!501354) (not b!501346) (not b!501355) (not start!45564) (not b!501361) (not b!501351) (not b!501348) (not b!501347))
(check-sat)
