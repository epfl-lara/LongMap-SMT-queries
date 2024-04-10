; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45780 () Bool)

(assert start!45780)

(declare-fun b!506653 () Bool)

(declare-fun res!307621 () Bool)

(declare-fun e!296537 () Bool)

(assert (=> b!506653 (=> (not res!307621) (not e!296537))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506653 (= res!307621 (validKeyInArray!0 k!2280))))

(declare-fun b!506654 () Bool)

(declare-fun e!296536 () Bool)

(declare-fun e!296535 () Bool)

(assert (=> b!506654 (= e!296536 e!296535)))

(declare-fun res!307615 () Bool)

(assert (=> b!506654 (=> res!307615 e!296535)))

(declare-fun lt!231214 () Bool)

(declare-datatypes ((SeekEntryResult!4115 0))(
  ( (MissingZero!4115 (index!18648 (_ BitVec 32))) (Found!4115 (index!18649 (_ BitVec 32))) (Intermediate!4115 (undefined!4927 Bool) (index!18650 (_ BitVec 32)) (x!47652 (_ BitVec 32))) (Undefined!4115) (MissingVacant!4115 (index!18651 (_ BitVec 32))) )
))
(declare-fun lt!231210 () SeekEntryResult!4115)

(assert (=> b!506654 (= res!307615 (or (and (not lt!231214) (undefined!4927 lt!231210)) (and (not lt!231214) (not (undefined!4927 lt!231210)))))))

(assert (=> b!506654 (= lt!231214 (not (is-Intermediate!4115 lt!231210)))))

(declare-fun b!506655 () Bool)

(declare-fun res!307613 () Bool)

(assert (=> b!506655 (=> (not res!307613) (not e!296537))))

(declare-datatypes ((array!32536 0))(
  ( (array!32537 (arr!15648 (Array (_ BitVec 32) (_ BitVec 64))) (size!16012 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32536)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!506655 (= res!307613 (validKeyInArray!0 (select (arr!15648 a!3235) j!176)))))

(declare-fun b!506656 () Bool)

(declare-fun res!307620 () Bool)

(declare-fun e!296533 () Bool)

(assert (=> b!506656 (=> (not res!307620) (not e!296533))))

(declare-datatypes ((List!9806 0))(
  ( (Nil!9803) (Cons!9802 (h!10679 (_ BitVec 64)) (t!16034 List!9806)) )
))
(declare-fun arrayNoDuplicates!0 (array!32536 (_ BitVec 32) List!9806) Bool)

(assert (=> b!506656 (= res!307620 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9803))))

(declare-fun res!307618 () Bool)

(assert (=> start!45780 (=> (not res!307618) (not e!296537))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45780 (= res!307618 (validMask!0 mask!3524))))

(assert (=> start!45780 e!296537))

(assert (=> start!45780 true))

(declare-fun array_inv!11444 (array!32536) Bool)

(assert (=> start!45780 (array_inv!11444 a!3235)))

(declare-fun b!506657 () Bool)

(assert (=> b!506657 (= e!296535 true)))

(assert (=> b!506657 false))

(declare-fun b!506658 () Bool)

(declare-fun res!307616 () Bool)

(assert (=> b!506658 (=> (not res!307616) (not e!296533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32536 (_ BitVec 32)) Bool)

(assert (=> b!506658 (= res!307616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506659 () Bool)

(assert (=> b!506659 (= e!296537 e!296533)))

(declare-fun res!307619 () Bool)

(assert (=> b!506659 (=> (not res!307619) (not e!296533))))

(declare-fun lt!231211 () SeekEntryResult!4115)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506659 (= res!307619 (or (= lt!231211 (MissingZero!4115 i!1204)) (= lt!231211 (MissingVacant!4115 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32536 (_ BitVec 32)) SeekEntryResult!4115)

(assert (=> b!506659 (= lt!231211 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506660 () Bool)

(declare-fun res!307614 () Bool)

(assert (=> b!506660 (=> (not res!307614) (not e!296537))))

(assert (=> b!506660 (= res!307614 (and (= (size!16012 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16012 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16012 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506661 () Bool)

(assert (=> b!506661 (= e!296533 (not e!296536))))

(declare-fun res!307622 () Bool)

(assert (=> b!506661 (=> res!307622 e!296536)))

(declare-fun lt!231212 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32536 (_ BitVec 32)) SeekEntryResult!4115)

(assert (=> b!506661 (= res!307622 (= lt!231210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231212 (select (store (arr!15648 a!3235) i!1204 k!2280) j!176) (array!32537 (store (arr!15648 a!3235) i!1204 k!2280) (size!16012 a!3235)) mask!3524)))))

(declare-fun lt!231213 () (_ BitVec 32))

(assert (=> b!506661 (= lt!231210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231213 (select (arr!15648 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506661 (= lt!231212 (toIndex!0 (select (store (arr!15648 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506661 (= lt!231213 (toIndex!0 (select (arr!15648 a!3235) j!176) mask!3524))))

(declare-fun e!296538 () Bool)

(assert (=> b!506661 e!296538))

(declare-fun res!307617 () Bool)

(assert (=> b!506661 (=> (not res!307617) (not e!296538))))

(assert (=> b!506661 (= res!307617 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15518 0))(
  ( (Unit!15519) )
))
(declare-fun lt!231209 () Unit!15518)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15518)

(assert (=> b!506661 (= lt!231209 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506662 () Bool)

(declare-fun res!307612 () Bool)

(assert (=> b!506662 (=> (not res!307612) (not e!296537))))

(declare-fun arrayContainsKey!0 (array!32536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506662 (= res!307612 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506663 () Bool)

(assert (=> b!506663 (= e!296538 (= (seekEntryOrOpen!0 (select (arr!15648 a!3235) j!176) a!3235 mask!3524) (Found!4115 j!176)))))

(assert (= (and start!45780 res!307618) b!506660))

(assert (= (and b!506660 res!307614) b!506655))

(assert (= (and b!506655 res!307613) b!506653))

(assert (= (and b!506653 res!307621) b!506662))

(assert (= (and b!506662 res!307612) b!506659))

(assert (= (and b!506659 res!307619) b!506658))

(assert (= (and b!506658 res!307616) b!506656))

(assert (= (and b!506656 res!307620) b!506661))

(assert (= (and b!506661 res!307617) b!506663))

(assert (= (and b!506661 (not res!307622)) b!506654))

(assert (= (and b!506654 (not res!307615)) b!506657))

(declare-fun m!487335 () Bool)

(assert (=> b!506661 m!487335))

(declare-fun m!487337 () Bool)

(assert (=> b!506661 m!487337))

(declare-fun m!487339 () Bool)

(assert (=> b!506661 m!487339))

(assert (=> b!506661 m!487339))

(declare-fun m!487341 () Bool)

(assert (=> b!506661 m!487341))

(declare-fun m!487343 () Bool)

(assert (=> b!506661 m!487343))

(declare-fun m!487345 () Bool)

(assert (=> b!506661 m!487345))

(assert (=> b!506661 m!487343))

(declare-fun m!487347 () Bool)

(assert (=> b!506661 m!487347))

(assert (=> b!506661 m!487339))

(declare-fun m!487349 () Bool)

(assert (=> b!506661 m!487349))

(assert (=> b!506661 m!487343))

(declare-fun m!487351 () Bool)

(assert (=> b!506661 m!487351))

(declare-fun m!487353 () Bool)

(assert (=> start!45780 m!487353))

(declare-fun m!487355 () Bool)

(assert (=> start!45780 m!487355))

(assert (=> b!506655 m!487343))

(assert (=> b!506655 m!487343))

(declare-fun m!487357 () Bool)

(assert (=> b!506655 m!487357))

(declare-fun m!487359 () Bool)

(assert (=> b!506653 m!487359))

(declare-fun m!487361 () Bool)

(assert (=> b!506656 m!487361))

(declare-fun m!487363 () Bool)

(assert (=> b!506659 m!487363))

(declare-fun m!487365 () Bool)

(assert (=> b!506662 m!487365))

(assert (=> b!506663 m!487343))

(assert (=> b!506663 m!487343))

(declare-fun m!487367 () Bool)

(assert (=> b!506663 m!487367))

(declare-fun m!487369 () Bool)

(assert (=> b!506658 m!487369))

(push 1)

