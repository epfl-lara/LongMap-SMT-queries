; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120822 () Bool)

(assert start!120822)

(declare-fun b!1405808 () Bool)

(declare-fun res!944028 () Bool)

(declare-fun e!795725 () Bool)

(assert (=> b!1405808 (=> (not res!944028) (not e!795725))))

(declare-datatypes ((array!96129 0))(
  ( (array!96130 (arr!46412 (Array (_ BitVec 32) (_ BitVec 64))) (size!46962 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96129)

(declare-datatypes ((List!32931 0))(
  ( (Nil!32928) (Cons!32927 (h!34181 (_ BitVec 64)) (t!47625 List!32931)) )
))
(declare-fun arrayNoDuplicates!0 (array!96129 (_ BitVec 32) List!32931) Bool)

(assert (=> b!1405808 (= res!944028 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32928))))

(declare-fun b!1405809 () Bool)

(declare-fun res!944031 () Bool)

(assert (=> b!1405809 (=> (not res!944031) (not e!795725))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96129 (_ BitVec 32)) Bool)

(assert (=> b!1405809 (= res!944031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405810 () Bool)

(declare-fun res!944025 () Bool)

(assert (=> b!1405810 (=> (not res!944025) (not e!795725))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405810 (= res!944025 (and (= (size!46962 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46962 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46962 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!944032 () Bool)

(assert (=> start!120822 (=> (not res!944032) (not e!795725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120822 (= res!944032 (validMask!0 mask!2840))))

(assert (=> start!120822 e!795725))

(assert (=> start!120822 true))

(declare-fun array_inv!35440 (array!96129) Bool)

(assert (=> start!120822 (array_inv!35440 a!2901)))

(declare-fun e!795727 () Bool)

(declare-fun b!1405811 () Bool)

(declare-datatypes ((SeekEntryResult!10723 0))(
  ( (MissingZero!10723 (index!45269 (_ BitVec 32))) (Found!10723 (index!45270 (_ BitVec 32))) (Intermediate!10723 (undefined!11535 Bool) (index!45271 (_ BitVec 32)) (x!126882 (_ BitVec 32))) (Undefined!10723) (MissingVacant!10723 (index!45272 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96129 (_ BitVec 32)) SeekEntryResult!10723)

(assert (=> b!1405811 (= e!795727 (= (seekEntryOrOpen!0 (select (arr!46412 a!2901) j!112) a!2901 mask!2840) (Found!10723 j!112)))))

(declare-fun b!1405812 () Bool)

(declare-fun res!944027 () Bool)

(assert (=> b!1405812 (=> (not res!944027) (not e!795725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405812 (= res!944027 (validKeyInArray!0 (select (arr!46412 a!2901) j!112)))))

(declare-fun b!1405813 () Bool)

(declare-fun e!795726 () Bool)

(assert (=> b!1405813 (= e!795725 (not e!795726))))

(declare-fun res!944030 () Bool)

(assert (=> b!1405813 (=> res!944030 e!795726)))

(declare-fun lt!619147 () SeekEntryResult!10723)

(assert (=> b!1405813 (= res!944030 (or (not (is-Intermediate!10723 lt!619147)) (undefined!11535 lt!619147)))))

(assert (=> b!1405813 e!795727))

(declare-fun res!944029 () Bool)

(assert (=> b!1405813 (=> (not res!944029) (not e!795727))))

(assert (=> b!1405813 (= res!944029 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47420 0))(
  ( (Unit!47421) )
))
(declare-fun lt!619148 () Unit!47420)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47420)

(assert (=> b!1405813 (= lt!619148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96129 (_ BitVec 32)) SeekEntryResult!10723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405813 (= lt!619147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46412 a!2901) j!112) mask!2840) (select (arr!46412 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405814 () Bool)

(assert (=> b!1405814 (= e!795726 true)))

(declare-fun lt!619149 () SeekEntryResult!10723)

(assert (=> b!1405814 (= lt!619149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46412 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46412 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96130 (store (arr!46412 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46962 a!2901)) mask!2840))))

(declare-fun b!1405815 () Bool)

(declare-fun res!944026 () Bool)

(assert (=> b!1405815 (=> (not res!944026) (not e!795725))))

(assert (=> b!1405815 (= res!944026 (validKeyInArray!0 (select (arr!46412 a!2901) i!1037)))))

(assert (= (and start!120822 res!944032) b!1405810))

(assert (= (and b!1405810 res!944025) b!1405815))

(assert (= (and b!1405815 res!944026) b!1405812))

(assert (= (and b!1405812 res!944027) b!1405809))

(assert (= (and b!1405809 res!944031) b!1405808))

(assert (= (and b!1405808 res!944028) b!1405813))

(assert (= (and b!1405813 res!944029) b!1405811))

(assert (= (and b!1405813 (not res!944030)) b!1405814))

(declare-fun m!1294689 () Bool)

(assert (=> b!1405809 m!1294689))

(declare-fun m!1294691 () Bool)

(assert (=> b!1405811 m!1294691))

(assert (=> b!1405811 m!1294691))

(declare-fun m!1294693 () Bool)

(assert (=> b!1405811 m!1294693))

(declare-fun m!1294695 () Bool)

(assert (=> b!1405815 m!1294695))

(assert (=> b!1405815 m!1294695))

(declare-fun m!1294697 () Bool)

(assert (=> b!1405815 m!1294697))

(assert (=> b!1405812 m!1294691))

(assert (=> b!1405812 m!1294691))

(declare-fun m!1294699 () Bool)

(assert (=> b!1405812 m!1294699))

(declare-fun m!1294701 () Bool)

(assert (=> b!1405814 m!1294701))

(declare-fun m!1294703 () Bool)

(assert (=> b!1405814 m!1294703))

(assert (=> b!1405814 m!1294703))

(declare-fun m!1294705 () Bool)

(assert (=> b!1405814 m!1294705))

(assert (=> b!1405814 m!1294705))

(assert (=> b!1405814 m!1294703))

(declare-fun m!1294707 () Bool)

(assert (=> b!1405814 m!1294707))

(declare-fun m!1294709 () Bool)

(assert (=> start!120822 m!1294709))

(declare-fun m!1294711 () Bool)

(assert (=> start!120822 m!1294711))

(declare-fun m!1294713 () Bool)

(assert (=> b!1405808 m!1294713))

(assert (=> b!1405813 m!1294691))

(declare-fun m!1294715 () Bool)

(assert (=> b!1405813 m!1294715))

(assert (=> b!1405813 m!1294691))

(declare-fun m!1294717 () Bool)

(assert (=> b!1405813 m!1294717))

(assert (=> b!1405813 m!1294715))

(assert (=> b!1405813 m!1294691))

(declare-fun m!1294719 () Bool)

(assert (=> b!1405813 m!1294719))

(declare-fun m!1294721 () Bool)

(assert (=> b!1405813 m!1294721))

(push 1)

(assert (not b!1405809))

(assert (not b!1405808))

(assert (not b!1405813))

(assert (not b!1405812))

(assert (not b!1405815))

(assert (not b!1405814))

(assert (not b!1405811))

(assert (not start!120822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

