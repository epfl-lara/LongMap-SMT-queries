; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120826 () Bool)

(assert start!120826)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96133 0))(
  ( (array!96134 (arr!46414 (Array (_ BitVec 32) (_ BitVec 64))) (size!46964 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96133)

(declare-fun b!1405856 () Bool)

(declare-fun e!795752 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10725 0))(
  ( (MissingZero!10725 (index!45277 (_ BitVec 32))) (Found!10725 (index!45278 (_ BitVec 32))) (Intermediate!10725 (undefined!11537 Bool) (index!45279 (_ BitVec 32)) (x!126884 (_ BitVec 32))) (Undefined!10725) (MissingVacant!10725 (index!45280 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96133 (_ BitVec 32)) SeekEntryResult!10725)

(assert (=> b!1405856 (= e!795752 (= (seekEntryOrOpen!0 (select (arr!46414 a!2901) j!112) a!2901 mask!2840) (Found!10725 j!112)))))

(declare-fun b!1405857 () Bool)

(declare-fun e!795750 () Bool)

(assert (=> b!1405857 (= e!795750 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!619165 () SeekEntryResult!10725)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96133 (_ BitVec 32)) SeekEntryResult!10725)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405857 (= lt!619165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46414 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46414 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96134 (store (arr!46414 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46964 a!2901)) mask!2840))))

(declare-fun b!1405858 () Bool)

(declare-fun res!944080 () Bool)

(declare-fun e!795749 () Bool)

(assert (=> b!1405858 (=> (not res!944080) (not e!795749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405858 (= res!944080 (validKeyInArray!0 (select (arr!46414 a!2901) i!1037)))))

(declare-fun b!1405859 () Bool)

(declare-fun res!944079 () Bool)

(assert (=> b!1405859 (=> (not res!944079) (not e!795749))))

(assert (=> b!1405859 (= res!944079 (validKeyInArray!0 (select (arr!46414 a!2901) j!112)))))

(declare-fun b!1405860 () Bool)

(declare-fun res!944075 () Bool)

(assert (=> b!1405860 (=> (not res!944075) (not e!795749))))

(assert (=> b!1405860 (= res!944075 (and (= (size!46964 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46964 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46964 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!944073 () Bool)

(assert (=> start!120826 (=> (not res!944073) (not e!795749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120826 (= res!944073 (validMask!0 mask!2840))))

(assert (=> start!120826 e!795749))

(assert (=> start!120826 true))

(declare-fun array_inv!35442 (array!96133) Bool)

(assert (=> start!120826 (array_inv!35442 a!2901)))

(declare-fun b!1405861 () Bool)

(assert (=> b!1405861 (= e!795749 (not e!795750))))

(declare-fun res!944076 () Bool)

(assert (=> b!1405861 (=> res!944076 e!795750)))

(declare-fun lt!619167 () SeekEntryResult!10725)

(assert (=> b!1405861 (= res!944076 (or (not (is-Intermediate!10725 lt!619167)) (undefined!11537 lt!619167)))))

(assert (=> b!1405861 e!795752))

(declare-fun res!944074 () Bool)

(assert (=> b!1405861 (=> (not res!944074) (not e!795752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96133 (_ BitVec 32)) Bool)

(assert (=> b!1405861 (= res!944074 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47424 0))(
  ( (Unit!47425) )
))
(declare-fun lt!619166 () Unit!47424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47424)

(assert (=> b!1405861 (= lt!619166 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1405861 (= lt!619167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46414 a!2901) j!112) mask!2840) (select (arr!46414 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405862 () Bool)

(declare-fun res!944077 () Bool)

(assert (=> b!1405862 (=> (not res!944077) (not e!795749))))

(assert (=> b!1405862 (= res!944077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405863 () Bool)

(declare-fun res!944078 () Bool)

(assert (=> b!1405863 (=> (not res!944078) (not e!795749))))

(declare-datatypes ((List!32933 0))(
  ( (Nil!32930) (Cons!32929 (h!34183 (_ BitVec 64)) (t!47627 List!32933)) )
))
(declare-fun arrayNoDuplicates!0 (array!96133 (_ BitVec 32) List!32933) Bool)

(assert (=> b!1405863 (= res!944078 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32930))))

(assert (= (and start!120826 res!944073) b!1405860))

(assert (= (and b!1405860 res!944075) b!1405858))

(assert (= (and b!1405858 res!944080) b!1405859))

(assert (= (and b!1405859 res!944079) b!1405862))

(assert (= (and b!1405862 res!944077) b!1405863))

(assert (= (and b!1405863 res!944078) b!1405861))

(assert (= (and b!1405861 res!944074) b!1405856))

(assert (= (and b!1405861 (not res!944076)) b!1405857))

(declare-fun m!1294757 () Bool)

(assert (=> b!1405862 m!1294757))

(declare-fun m!1294759 () Bool)

(assert (=> start!120826 m!1294759))

(declare-fun m!1294761 () Bool)

(assert (=> start!120826 m!1294761))

(declare-fun m!1294763 () Bool)

(assert (=> b!1405859 m!1294763))

(assert (=> b!1405859 m!1294763))

(declare-fun m!1294765 () Bool)

(assert (=> b!1405859 m!1294765))

(declare-fun m!1294767 () Bool)

(assert (=> b!1405857 m!1294767))

(declare-fun m!1294769 () Bool)

(assert (=> b!1405857 m!1294769))

(assert (=> b!1405857 m!1294769))

(declare-fun m!1294771 () Bool)

(assert (=> b!1405857 m!1294771))

(assert (=> b!1405857 m!1294771))

(assert (=> b!1405857 m!1294769))

(declare-fun m!1294773 () Bool)

(assert (=> b!1405857 m!1294773))

(assert (=> b!1405861 m!1294763))

(declare-fun m!1294775 () Bool)

(assert (=> b!1405861 m!1294775))

(assert (=> b!1405861 m!1294763))

(declare-fun m!1294777 () Bool)

(assert (=> b!1405861 m!1294777))

(assert (=> b!1405861 m!1294775))

(assert (=> b!1405861 m!1294763))

(declare-fun m!1294779 () Bool)

(assert (=> b!1405861 m!1294779))

(declare-fun m!1294781 () Bool)

(assert (=> b!1405861 m!1294781))

(assert (=> b!1405856 m!1294763))

(assert (=> b!1405856 m!1294763))

(declare-fun m!1294783 () Bool)

(assert (=> b!1405856 m!1294783))

(declare-fun m!1294785 () Bool)

(assert (=> b!1405863 m!1294785))

(declare-fun m!1294787 () Bool)

(assert (=> b!1405858 m!1294787))

(assert (=> b!1405858 m!1294787))

(declare-fun m!1294789 () Bool)

(assert (=> b!1405858 m!1294789))

(push 1)

(assert (not b!1405862))

(assert (not b!1405859))

(assert (not b!1405856))

(assert (not b!1405857))

(assert (not b!1405858))

(assert (not start!120826))

(assert (not b!1405861))

(assert (not b!1405863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

