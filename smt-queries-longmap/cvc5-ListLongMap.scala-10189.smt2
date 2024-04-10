; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120060 () Bool)

(assert start!120060)

(declare-fun b!1397770 () Bool)

(declare-fun e!791317 () Bool)

(declare-fun e!791314 () Bool)

(assert (=> b!1397770 (= e!791317 e!791314)))

(declare-fun res!936683 () Bool)

(assert (=> b!1397770 (=> res!936683 e!791314)))

(declare-datatypes ((SeekEntryResult!10465 0))(
  ( (MissingZero!10465 (index!44231 (_ BitVec 32))) (Found!10465 (index!44232 (_ BitVec 32))) (Intermediate!10465 (undefined!11277 Bool) (index!44233 (_ BitVec 32)) (x!125887 (_ BitVec 32))) (Undefined!10465) (MissingVacant!10465 (index!44234 (_ BitVec 32))) )
))
(declare-fun lt!614463 () SeekEntryResult!10465)

(declare-fun lt!614461 () (_ BitVec 32))

(declare-datatypes ((array!95589 0))(
  ( (array!95590 (arr!46148 (Array (_ BitVec 32) (_ BitVec 64))) (size!46698 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95589)

(declare-fun lt!614460 () SeekEntryResult!10465)

(assert (=> b!1397770 (= res!936683 (or (= lt!614460 lt!614463) (not (is-Intermediate!10465 lt!614463)) (bvslt (x!125887 lt!614460) #b00000000000000000000000000000000) (bvsgt (x!125887 lt!614460) #b01111111111111111111111111111110) (bvslt lt!614461 #b00000000000000000000000000000000) (bvsge lt!614461 (size!46698 a!2901)) (bvslt (index!44233 lt!614460) #b00000000000000000000000000000000) (bvsge (index!44233 lt!614460) (size!46698 a!2901)) (not (= lt!614460 (Intermediate!10465 false (index!44233 lt!614460) (x!125887 lt!614460)))) (not (= lt!614463 (Intermediate!10465 (undefined!11277 lt!614463) (index!44233 lt!614463) (x!125887 lt!614463))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!614466 () array!95589)

(declare-fun lt!614462 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95589 (_ BitVec 32)) SeekEntryResult!10465)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397770 (= lt!614463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614462 mask!2840) lt!614462 lt!614466 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397770 (= lt!614462 (select (store (arr!46148 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397770 (= lt!614466 (array!95590 (store (arr!46148 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46698 a!2901)))))

(declare-fun b!1397771 () Bool)

(declare-fun res!936686 () Bool)

(declare-fun e!791316 () Bool)

(assert (=> b!1397771 (=> (not res!936686) (not e!791316))))

(declare-datatypes ((List!32667 0))(
  ( (Nil!32664) (Cons!32663 (h!33905 (_ BitVec 64)) (t!47361 List!32667)) )
))
(declare-fun arrayNoDuplicates!0 (array!95589 (_ BitVec 32) List!32667) Bool)

(assert (=> b!1397771 (= res!936686 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32664))))

(declare-fun b!1397772 () Bool)

(assert (=> b!1397772 (= e!791316 (not e!791317))))

(declare-fun res!936688 () Bool)

(assert (=> b!1397772 (=> res!936688 e!791317)))

(assert (=> b!1397772 (= res!936688 (or (not (is-Intermediate!10465 lt!614460)) (undefined!11277 lt!614460)))))

(declare-fun e!791315 () Bool)

(assert (=> b!1397772 e!791315))

(declare-fun res!936691 () Bool)

(assert (=> b!1397772 (=> (not res!936691) (not e!791315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95589 (_ BitVec 32)) Bool)

(assert (=> b!1397772 (= res!936691 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46934 0))(
  ( (Unit!46935) )
))
(declare-fun lt!614465 () Unit!46934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46934)

(assert (=> b!1397772 (= lt!614465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397772 (= lt!614460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614461 (select (arr!46148 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397772 (= lt!614461 (toIndex!0 (select (arr!46148 a!2901) j!112) mask!2840))))

(declare-fun b!1397773 () Bool)

(declare-fun res!936687 () Bool)

(assert (=> b!1397773 (=> (not res!936687) (not e!791316))))

(assert (=> b!1397773 (= res!936687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397774 () Bool)

(declare-fun res!936690 () Bool)

(assert (=> b!1397774 (=> (not res!936690) (not e!791316))))

(assert (=> b!1397774 (= res!936690 (and (= (size!46698 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46698 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46698 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397775 () Bool)

(assert (=> b!1397775 (= e!791314 true)))

(declare-fun lt!614464 () SeekEntryResult!10465)

(assert (=> b!1397775 (= lt!614464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614461 lt!614462 lt!614466 mask!2840))))

(declare-fun b!1397776 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95589 (_ BitVec 32)) SeekEntryResult!10465)

(assert (=> b!1397776 (= e!791315 (= (seekEntryOrOpen!0 (select (arr!46148 a!2901) j!112) a!2901 mask!2840) (Found!10465 j!112)))))

(declare-fun b!1397777 () Bool)

(declare-fun res!936689 () Bool)

(assert (=> b!1397777 (=> (not res!936689) (not e!791316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397777 (= res!936689 (validKeyInArray!0 (select (arr!46148 a!2901) j!112)))))

(declare-fun res!936685 () Bool)

(assert (=> start!120060 (=> (not res!936685) (not e!791316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120060 (= res!936685 (validMask!0 mask!2840))))

(assert (=> start!120060 e!791316))

(assert (=> start!120060 true))

(declare-fun array_inv!35176 (array!95589) Bool)

(assert (=> start!120060 (array_inv!35176 a!2901)))

(declare-fun b!1397778 () Bool)

(declare-fun res!936684 () Bool)

(assert (=> b!1397778 (=> (not res!936684) (not e!791316))))

(assert (=> b!1397778 (= res!936684 (validKeyInArray!0 (select (arr!46148 a!2901) i!1037)))))

(assert (= (and start!120060 res!936685) b!1397774))

(assert (= (and b!1397774 res!936690) b!1397778))

(assert (= (and b!1397778 res!936684) b!1397777))

(assert (= (and b!1397777 res!936689) b!1397773))

(assert (= (and b!1397773 res!936687) b!1397771))

(assert (= (and b!1397771 res!936686) b!1397772))

(assert (= (and b!1397772 res!936691) b!1397776))

(assert (= (and b!1397772 (not res!936688)) b!1397770))

(assert (= (and b!1397770 (not res!936683)) b!1397775))

(declare-fun m!1284651 () Bool)

(assert (=> b!1397775 m!1284651))

(declare-fun m!1284653 () Bool)

(assert (=> b!1397770 m!1284653))

(assert (=> b!1397770 m!1284653))

(declare-fun m!1284655 () Bool)

(assert (=> b!1397770 m!1284655))

(declare-fun m!1284657 () Bool)

(assert (=> b!1397770 m!1284657))

(declare-fun m!1284659 () Bool)

(assert (=> b!1397770 m!1284659))

(declare-fun m!1284661 () Bool)

(assert (=> b!1397776 m!1284661))

(assert (=> b!1397776 m!1284661))

(declare-fun m!1284663 () Bool)

(assert (=> b!1397776 m!1284663))

(declare-fun m!1284665 () Bool)

(assert (=> start!120060 m!1284665))

(declare-fun m!1284667 () Bool)

(assert (=> start!120060 m!1284667))

(declare-fun m!1284669 () Bool)

(assert (=> b!1397771 m!1284669))

(assert (=> b!1397777 m!1284661))

(assert (=> b!1397777 m!1284661))

(declare-fun m!1284671 () Bool)

(assert (=> b!1397777 m!1284671))

(assert (=> b!1397772 m!1284661))

(declare-fun m!1284673 () Bool)

(assert (=> b!1397772 m!1284673))

(assert (=> b!1397772 m!1284661))

(declare-fun m!1284675 () Bool)

(assert (=> b!1397772 m!1284675))

(declare-fun m!1284677 () Bool)

(assert (=> b!1397772 m!1284677))

(assert (=> b!1397772 m!1284661))

(declare-fun m!1284679 () Bool)

(assert (=> b!1397772 m!1284679))

(declare-fun m!1284681 () Bool)

(assert (=> b!1397773 m!1284681))

(declare-fun m!1284683 () Bool)

(assert (=> b!1397778 m!1284683))

(assert (=> b!1397778 m!1284683))

(declare-fun m!1284685 () Bool)

(assert (=> b!1397778 m!1284685))

(push 1)

