; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47710 () Bool)

(assert start!47710)

(declare-datatypes ((array!33347 0))(
  ( (array!33348 (arr!16025 (Array (_ BitVec 32) (_ BitVec 64))) (size!16389 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33347)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!305995 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!524709 () Bool)

(declare-datatypes ((SeekEntryResult!4492 0))(
  ( (MissingZero!4492 (index!20180 (_ BitVec 32))) (Found!4492 (index!20181 (_ BitVec 32))) (Intermediate!4492 (undefined!5304 Bool) (index!20182 (_ BitVec 32)) (x!49161 (_ BitVec 32))) (Undefined!4492) (MissingVacant!4492 (index!20183 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33347 (_ BitVec 32)) SeekEntryResult!4492)

(assert (=> b!524709 (= e!305995 (= (seekEntryOrOpen!0 (select (arr!16025 a!3235) j!176) a!3235 mask!3524) (Found!4492 j!176)))))

(declare-fun b!524710 () Bool)

(declare-fun e!306000 () Bool)

(declare-fun e!305993 () Bool)

(assert (=> b!524710 (= e!306000 e!305993)))

(declare-fun res!321590 () Bool)

(assert (=> b!524710 (=> res!321590 e!305993)))

(declare-fun lt!240876 () SeekEntryResult!4492)

(declare-fun lt!240873 () (_ BitVec 32))

(assert (=> b!524710 (= res!321590 (or (bvsgt #b00000000000000000000000000000000 (x!49161 lt!240876)) (bvsgt (x!49161 lt!240876) #b01111111111111111111111111111110) (bvslt lt!240873 #b00000000000000000000000000000000) (bvsge lt!240873 (size!16389 a!3235)) (bvslt (index!20182 lt!240876) #b00000000000000000000000000000000) (bvsge (index!20182 lt!240876) (size!16389 a!3235)) (not (= lt!240876 (Intermediate!4492 false (index!20182 lt!240876) (x!49161 lt!240876))))))))

(declare-fun lt!240877 () Bool)

(declare-fun lt!240875 () (_ BitVec 64))

(assert (=> b!524710 (and (or lt!240877 (= lt!240875 #b1000000000000000000000000000000000000000000000000000000000000000)) (not lt!240877) (= lt!240875 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524710 (= lt!240877 (= lt!240875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16420 0))(
  ( (Unit!16421) )
))
(declare-fun lt!240882 () Unit!16420)

(declare-fun e!305997 () Unit!16420)

(assert (=> b!524710 (= lt!240882 e!305997)))

(declare-fun c!61871 () Bool)

(assert (=> b!524710 (= c!61871 (= lt!240875 (select (arr!16025 a!3235) j!176)))))

(assert (=> b!524710 (= lt!240875 (select (arr!16025 a!3235) (index!20182 lt!240876)))))

(assert (=> b!524710 (and (bvslt (x!49161 lt!240876) #b01111111111111111111111111111110) (let ((bdg!15572 (select (arr!16025 a!3235) (index!20182 lt!240876)))) (or (= bdg!15572 (select (arr!16025 a!3235) j!176)) (= bdg!15572 #b0000000000000000000000000000000000000000000000000000000000000000) (= bdg!15572 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!524711 () Bool)

(declare-fun res!321581 () Bool)

(assert (=> b!524711 (=> res!321581 e!306000)))

(assert (=> b!524711 (= res!321581 (or (undefined!5304 lt!240876) (not (is-Intermediate!4492 lt!240876))))))

(declare-fun b!524712 () Bool)

(declare-fun res!321584 () Bool)

(declare-fun e!305999 () Bool)

(assert (=> b!524712 (=> (not res!321584) (not e!305999))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524712 (= res!321584 (and (= (size!16389 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16389 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16389 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524713 () Bool)

(declare-fun e!305994 () Bool)

(assert (=> b!524713 (= e!305994 false)))

(declare-fun b!524714 () Bool)

(declare-fun res!321586 () Bool)

(assert (=> b!524714 (=> (not res!321586) (not e!305999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524714 (= res!321586 (validKeyInArray!0 (select (arr!16025 a!3235) j!176)))))

(declare-fun res!321582 () Bool)

(assert (=> start!47710 (=> (not res!321582) (not e!305999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47710 (= res!321582 (validMask!0 mask!3524))))

(assert (=> start!47710 e!305999))

(assert (=> start!47710 true))

(declare-fun array_inv!11821 (array!33347) Bool)

(assert (=> start!47710 (array_inv!11821 a!3235)))

(declare-fun b!524715 () Bool)

(declare-fun lt!240878 () (_ BitVec 64))

(declare-fun lt!240883 () array!33347)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33347 (_ BitVec 32)) SeekEntryResult!4492)

(assert (=> b!524715 (= e!305993 (not (= lt!240876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240873 lt!240878 lt!240883 mask!3524))))))

(declare-fun b!524716 () Bool)

(declare-fun res!321583 () Bool)

(assert (=> b!524716 (=> (not res!321583) (not e!305999))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524716 (= res!321583 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524717 () Bool)

(declare-fun e!305998 () Bool)

(assert (=> b!524717 (= e!305999 e!305998)))

(declare-fun res!321580 () Bool)

(assert (=> b!524717 (=> (not res!321580) (not e!305998))))

(declare-fun lt!240874 () SeekEntryResult!4492)

(assert (=> b!524717 (= res!321580 (or (= lt!240874 (MissingZero!4492 i!1204)) (= lt!240874 (MissingVacant!4492 i!1204))))))

(assert (=> b!524717 (= lt!240874 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!524718 () Bool)

(declare-fun res!321589 () Bool)

(assert (=> b!524718 (=> (not res!321589) (not e!305998))))

(declare-datatypes ((List!10183 0))(
  ( (Nil!10180) (Cons!10179 (h!11110 (_ BitVec 64)) (t!16411 List!10183)) )
))
(declare-fun arrayNoDuplicates!0 (array!33347 (_ BitVec 32) List!10183) Bool)

(assert (=> b!524718 (= res!321589 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10180))))

(declare-fun b!524719 () Bool)

(declare-fun res!321585 () Bool)

(assert (=> b!524719 (=> (not res!321585) (not e!305999))))

(assert (=> b!524719 (= res!321585 (validKeyInArray!0 k!2280))))

(declare-fun b!524720 () Bool)

(declare-fun res!321578 () Bool)

(assert (=> b!524720 (=> (not res!321578) (not e!305998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33347 (_ BitVec 32)) Bool)

(assert (=> b!524720 (= res!321578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524721 () Bool)

(assert (=> b!524721 (= e!305998 (not e!306000))))

(declare-fun res!321579 () Bool)

(assert (=> b!524721 (=> res!321579 e!306000)))

(declare-fun lt!240881 () (_ BitVec 32))

(assert (=> b!524721 (= res!321579 (= lt!240876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240881 lt!240878 lt!240883 mask!3524)))))

(assert (=> b!524721 (= lt!240876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240873 (select (arr!16025 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524721 (= lt!240881 (toIndex!0 lt!240878 mask!3524))))

(assert (=> b!524721 (= lt!240878 (select (store (arr!16025 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524721 (= lt!240873 (toIndex!0 (select (arr!16025 a!3235) j!176) mask!3524))))

(assert (=> b!524721 (= lt!240883 (array!33348 (store (arr!16025 a!3235) i!1204 k!2280) (size!16389 a!3235)))))

(assert (=> b!524721 e!305995))

(declare-fun res!321588 () Bool)

(assert (=> b!524721 (=> (not res!321588) (not e!305995))))

(assert (=> b!524721 (= res!321588 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240879 () Unit!16420)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16420)

(assert (=> b!524721 (= lt!240879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524722 () Bool)

(declare-fun Unit!16422 () Unit!16420)

(assert (=> b!524722 (= e!305997 Unit!16422)))

(declare-fun lt!240880 () Unit!16420)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16420)

(assert (=> b!524722 (= lt!240880 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240873 #b00000000000000000000000000000000 (index!20182 lt!240876) (x!49161 lt!240876) mask!3524))))

(declare-fun res!321587 () Bool)

(assert (=> b!524722 (= res!321587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240873 lt!240878 lt!240883 mask!3524) (Intermediate!4492 false (index!20182 lt!240876) (x!49161 lt!240876))))))

(assert (=> b!524722 (=> (not res!321587) (not e!305994))))

(assert (=> b!524722 e!305994))

(declare-fun b!524723 () Bool)

(declare-fun Unit!16423 () Unit!16420)

(assert (=> b!524723 (= e!305997 Unit!16423)))

(assert (= (and start!47710 res!321582) b!524712))

(assert (= (and b!524712 res!321584) b!524714))

(assert (= (and b!524714 res!321586) b!524719))

(assert (= (and b!524719 res!321585) b!524716))

(assert (= (and b!524716 res!321583) b!524717))

(assert (= (and b!524717 res!321580) b!524720))

(assert (= (and b!524720 res!321578) b!524718))

(assert (= (and b!524718 res!321589) b!524721))

(assert (= (and b!524721 res!321588) b!524709))

(assert (= (and b!524721 (not res!321579)) b!524711))

(assert (= (and b!524711 (not res!321581)) b!524710))

(assert (= (and b!524710 c!61871) b!524722))

(assert (= (and b!524710 (not c!61871)) b!524723))

(assert (= (and b!524722 res!321587) b!524713))

(assert (= (and b!524710 (not res!321590)) b!524715))

(declare-fun m!505335 () Bool)

(assert (=> b!524709 m!505335))

(assert (=> b!524709 m!505335))

(declare-fun m!505337 () Bool)

(assert (=> b!524709 m!505337))

(assert (=> b!524710 m!505335))

(declare-fun m!505339 () Bool)

(assert (=> b!524710 m!505339))

(declare-fun m!505341 () Bool)

(assert (=> b!524716 m!505341))

(declare-fun m!505343 () Bool)

(assert (=> b!524722 m!505343))

(declare-fun m!505345 () Bool)

(assert (=> b!524722 m!505345))

(declare-fun m!505347 () Bool)

(assert (=> b!524718 m!505347))

(assert (=> b!524715 m!505345))

(assert (=> b!524714 m!505335))

(assert (=> b!524714 m!505335))

(declare-fun m!505349 () Bool)

(assert (=> b!524714 m!505349))

(declare-fun m!505351 () Bool)

(assert (=> start!47710 m!505351))

(declare-fun m!505353 () Bool)

(assert (=> start!47710 m!505353))

(declare-fun m!505355 () Bool)

(assert (=> b!524717 m!505355))

(declare-fun m!505357 () Bool)

(assert (=> b!524720 m!505357))

(declare-fun m!505359 () Bool)

(assert (=> b!524719 m!505359))

(declare-fun m!505361 () Bool)

(assert (=> b!524721 m!505361))

(declare-fun m!505363 () Bool)

(assert (=> b!524721 m!505363))

(assert (=> b!524721 m!505335))

(declare-fun m!505365 () Bool)

(assert (=> b!524721 m!505365))

(declare-fun m!505367 () Bool)

(assert (=> b!524721 m!505367))

(assert (=> b!524721 m!505335))

(declare-fun m!505369 () Bool)

(assert (=> b!524721 m!505369))

(declare-fun m!505371 () Bool)

(assert (=> b!524721 m!505371))

(assert (=> b!524721 m!505335))

(declare-fun m!505373 () Bool)

(assert (=> b!524721 m!505373))

(declare-fun m!505375 () Bool)

(assert (=> b!524721 m!505375))

(push 1)

