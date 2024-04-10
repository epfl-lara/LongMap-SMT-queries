; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45426 () Bool)

(assert start!45426)

(declare-fun b!499548 () Bool)

(declare-fun e!292728 () Bool)

(declare-fun e!292730 () Bool)

(assert (=> b!499548 (= e!292728 e!292730)))

(declare-fun res!301503 () Bool)

(assert (=> b!499548 (=> res!301503 e!292730)))

(declare-fun lt!226525 () (_ BitVec 32))

(declare-datatypes ((array!32251 0))(
  ( (array!32252 (arr!15507 (Array (_ BitVec 32) (_ BitVec 64))) (size!15871 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32251)

(declare-datatypes ((SeekEntryResult!3974 0))(
  ( (MissingZero!3974 (index!18078 (_ BitVec 32))) (Found!3974 (index!18079 (_ BitVec 32))) (Intermediate!3974 (undefined!4786 Bool) (index!18080 (_ BitVec 32)) (x!47123 (_ BitVec 32))) (Undefined!3974) (MissingVacant!3974 (index!18081 (_ BitVec 32))) )
))
(declare-fun lt!226520 () SeekEntryResult!3974)

(assert (=> b!499548 (= res!301503 (or (bvsgt #b00000000000000000000000000000000 (x!47123 lt!226520)) (bvsgt (x!47123 lt!226520) #b01111111111111111111111111111110) (bvslt lt!226525 #b00000000000000000000000000000000) (bvsge lt!226525 (size!15871 a!3235)) (bvslt (index!18080 lt!226520) #b00000000000000000000000000000000) (bvsge (index!18080 lt!226520) (size!15871 a!3235)) (not (= lt!226520 (Intermediate!3974 false (index!18080 lt!226520) (x!47123 lt!226520))))))))

(assert (=> b!499548 (and (or (= (select (arr!15507 a!3235) (index!18080 lt!226520)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15507 a!3235) (index!18080 lt!226520)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15507 a!3235) (index!18080 lt!226520)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15507 a!3235) (index!18080 lt!226520)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14972 0))(
  ( (Unit!14973) )
))
(declare-fun lt!226523 () Unit!14972)

(declare-fun e!292733 () Unit!14972)

(assert (=> b!499548 (= lt!226523 e!292733)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!59303 () Bool)

(assert (=> b!499548 (= c!59303 (= (select (arr!15507 a!3235) (index!18080 lt!226520)) (select (arr!15507 a!3235) j!176)))))

(assert (=> b!499548 (and (bvslt (x!47123 lt!226520) #b01111111111111111111111111111110) (or (= (select (arr!15507 a!3235) (index!18080 lt!226520)) (select (arr!15507 a!3235) j!176)) (= (select (arr!15507 a!3235) (index!18080 lt!226520)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15507 a!3235) (index!18080 lt!226520)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499550 () Bool)

(declare-fun res!301497 () Bool)

(declare-fun e!292732 () Bool)

(assert (=> b!499550 (=> (not res!301497) (not e!292732))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499550 (= res!301497 (validKeyInArray!0 k!2280))))

(declare-fun b!499551 () Bool)

(declare-fun e!292731 () Bool)

(assert (=> b!499551 (= e!292732 e!292731)))

(declare-fun res!301502 () Bool)

(assert (=> b!499551 (=> (not res!301502) (not e!292731))))

(declare-fun lt!226528 () SeekEntryResult!3974)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499551 (= res!301502 (or (= lt!226528 (MissingZero!3974 i!1204)) (= lt!226528 (MissingVacant!3974 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32251 (_ BitVec 32)) SeekEntryResult!3974)

(assert (=> b!499551 (= lt!226528 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!499552 () Bool)

(declare-fun res!301501 () Bool)

(assert (=> b!499552 (=> (not res!301501) (not e!292732))))

(declare-fun arrayContainsKey!0 (array!32251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499552 (= res!301501 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499553 () Bool)

(declare-fun e!292734 () Bool)

(assert (=> b!499553 (= e!292734 (= (seekEntryOrOpen!0 (select (arr!15507 a!3235) j!176) a!3235 mask!3524) (Found!3974 j!176)))))

(declare-fun b!499554 () Bool)

(assert (=> b!499554 (= e!292730 true)))

(declare-fun lt!226519 () (_ BitVec 64))

(declare-fun lt!226521 () array!32251)

(declare-fun lt!226527 () SeekEntryResult!3974)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32251 (_ BitVec 32)) SeekEntryResult!3974)

(assert (=> b!499554 (= lt!226527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226525 lt!226519 lt!226521 mask!3524))))

(declare-fun b!499555 () Bool)

(declare-fun e!292727 () Bool)

(assert (=> b!499555 (= e!292727 false)))

(declare-fun b!499556 () Bool)

(declare-fun res!301508 () Bool)

(assert (=> b!499556 (=> (not res!301508) (not e!292731))))

(declare-datatypes ((List!9665 0))(
  ( (Nil!9662) (Cons!9661 (h!10535 (_ BitVec 64)) (t!15893 List!9665)) )
))
(declare-fun arrayNoDuplicates!0 (array!32251 (_ BitVec 32) List!9665) Bool)

(assert (=> b!499556 (= res!301508 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9662))))

(declare-fun b!499557 () Bool)

(declare-fun Unit!14974 () Unit!14972)

(assert (=> b!499557 (= e!292733 Unit!14974)))

(declare-fun b!499558 () Bool)

(declare-fun Unit!14975 () Unit!14972)

(assert (=> b!499558 (= e!292733 Unit!14975)))

(declare-fun lt!226522 () Unit!14972)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32251 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14972)

(assert (=> b!499558 (= lt!226522 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226525 #b00000000000000000000000000000000 (index!18080 lt!226520) (x!47123 lt!226520) mask!3524))))

(declare-fun res!301505 () Bool)

(assert (=> b!499558 (= res!301505 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226525 lt!226519 lt!226521 mask!3524) (Intermediate!3974 false (index!18080 lt!226520) (x!47123 lt!226520))))))

(assert (=> b!499558 (=> (not res!301505) (not e!292727))))

(assert (=> b!499558 e!292727))

(declare-fun b!499559 () Bool)

(declare-fun res!301499 () Bool)

(assert (=> b!499559 (=> (not res!301499) (not e!292732))))

(assert (=> b!499559 (= res!301499 (validKeyInArray!0 (select (arr!15507 a!3235) j!176)))))

(declare-fun b!499560 () Bool)

(declare-fun res!301506 () Bool)

(assert (=> b!499560 (=> (not res!301506) (not e!292731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32251 (_ BitVec 32)) Bool)

(assert (=> b!499560 (= res!301506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499561 () Bool)

(declare-fun res!301496 () Bool)

(assert (=> b!499561 (=> (not res!301496) (not e!292732))))

(assert (=> b!499561 (= res!301496 (and (= (size!15871 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15871 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15871 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499562 () Bool)

(declare-fun res!301498 () Bool)

(assert (=> b!499562 (=> res!301498 e!292728)))

(assert (=> b!499562 (= res!301498 (or (undefined!4786 lt!226520) (not (is-Intermediate!3974 lt!226520))))))

(declare-fun b!499549 () Bool)

(assert (=> b!499549 (= e!292731 (not e!292728))))

(declare-fun res!301500 () Bool)

(assert (=> b!499549 (=> res!301500 e!292728)))

(declare-fun lt!226524 () (_ BitVec 32))

(assert (=> b!499549 (= res!301500 (= lt!226520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226524 lt!226519 lt!226521 mask!3524)))))

(assert (=> b!499549 (= lt!226520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226525 (select (arr!15507 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499549 (= lt!226524 (toIndex!0 lt!226519 mask!3524))))

(assert (=> b!499549 (= lt!226519 (select (store (arr!15507 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499549 (= lt!226525 (toIndex!0 (select (arr!15507 a!3235) j!176) mask!3524))))

(assert (=> b!499549 (= lt!226521 (array!32252 (store (arr!15507 a!3235) i!1204 k!2280) (size!15871 a!3235)))))

(assert (=> b!499549 e!292734))

(declare-fun res!301504 () Bool)

(assert (=> b!499549 (=> (not res!301504) (not e!292734))))

(assert (=> b!499549 (= res!301504 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226526 () Unit!14972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14972)

(assert (=> b!499549 (= lt!226526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!301507 () Bool)

(assert (=> start!45426 (=> (not res!301507) (not e!292732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45426 (= res!301507 (validMask!0 mask!3524))))

(assert (=> start!45426 e!292732))

(assert (=> start!45426 true))

(declare-fun array_inv!11303 (array!32251) Bool)

(assert (=> start!45426 (array_inv!11303 a!3235)))

(assert (= (and start!45426 res!301507) b!499561))

(assert (= (and b!499561 res!301496) b!499559))

(assert (= (and b!499559 res!301499) b!499550))

(assert (= (and b!499550 res!301497) b!499552))

(assert (= (and b!499552 res!301501) b!499551))

(assert (= (and b!499551 res!301502) b!499560))

(assert (= (and b!499560 res!301506) b!499556))

(assert (= (and b!499556 res!301508) b!499549))

(assert (= (and b!499549 res!301504) b!499553))

(assert (= (and b!499549 (not res!301500)) b!499562))

(assert (= (and b!499562 (not res!301498)) b!499548))

(assert (= (and b!499548 c!59303) b!499558))

(assert (= (and b!499548 (not c!59303)) b!499557))

(assert (= (and b!499558 res!301505) b!499555))

(assert (= (and b!499548 (not res!301503)) b!499554))

(declare-fun m!480741 () Bool)

(assert (=> b!499549 m!480741))

(declare-fun m!480743 () Bool)

(assert (=> b!499549 m!480743))

(declare-fun m!480745 () Bool)

(assert (=> b!499549 m!480745))

(declare-fun m!480747 () Bool)

(assert (=> b!499549 m!480747))

(declare-fun m!480749 () Bool)

(assert (=> b!499549 m!480749))

(assert (=> b!499549 m!480747))

(declare-fun m!480751 () Bool)

(assert (=> b!499549 m!480751))

(declare-fun m!480753 () Bool)

(assert (=> b!499549 m!480753))

(assert (=> b!499549 m!480747))

(declare-fun m!480755 () Bool)

(assert (=> b!499549 m!480755))

(declare-fun m!480757 () Bool)

(assert (=> b!499549 m!480757))

(assert (=> b!499553 m!480747))

(assert (=> b!499553 m!480747))

(declare-fun m!480759 () Bool)

(assert (=> b!499553 m!480759))

(declare-fun m!480761 () Bool)

(assert (=> b!499550 m!480761))

(declare-fun m!480763 () Bool)

(assert (=> b!499552 m!480763))

(declare-fun m!480765 () Bool)

(assert (=> b!499558 m!480765))

(declare-fun m!480767 () Bool)

(assert (=> b!499558 m!480767))

(declare-fun m!480769 () Bool)

(assert (=> b!499560 m!480769))

(assert (=> b!499559 m!480747))

(assert (=> b!499559 m!480747))

(declare-fun m!480771 () Bool)

(assert (=> b!499559 m!480771))

(declare-fun m!480773 () Bool)

(assert (=> start!45426 m!480773))

(declare-fun m!480775 () Bool)

(assert (=> start!45426 m!480775))

(declare-fun m!480777 () Bool)

(assert (=> b!499551 m!480777))

(assert (=> b!499554 m!480767))

(declare-fun m!480779 () Bool)

(assert (=> b!499548 m!480779))

(assert (=> b!499548 m!480747))

(declare-fun m!480781 () Bool)

(assert (=> b!499556 m!480781))

(push 1)

