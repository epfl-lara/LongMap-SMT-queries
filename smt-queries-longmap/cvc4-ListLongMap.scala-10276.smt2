; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120820 () Bool)

(assert start!120820)

(declare-fun b!1405784 () Bool)

(declare-fun res!944003 () Bool)

(declare-fun e!795713 () Bool)

(assert (=> b!1405784 (=> (not res!944003) (not e!795713))))

(declare-datatypes ((array!96127 0))(
  ( (array!96128 (arr!46411 (Array (_ BitVec 32) (_ BitVec 64))) (size!46961 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96127)

(declare-datatypes ((List!32930 0))(
  ( (Nil!32927) (Cons!32926 (h!34180 (_ BitVec 64)) (t!47624 List!32930)) )
))
(declare-fun arrayNoDuplicates!0 (array!96127 (_ BitVec 32) List!32930) Bool)

(assert (=> b!1405784 (= res!944003 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32927))))

(declare-fun b!1405785 () Bool)

(declare-fun res!944006 () Bool)

(assert (=> b!1405785 (=> (not res!944006) (not e!795713))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405785 (= res!944006 (validKeyInArray!0 (select (arr!46411 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!795715 () Bool)

(declare-fun b!1405786 () Bool)

(declare-datatypes ((SeekEntryResult!10722 0))(
  ( (MissingZero!10722 (index!45265 (_ BitVec 32))) (Found!10722 (index!45266 (_ BitVec 32))) (Intermediate!10722 (undefined!11534 Bool) (index!45267 (_ BitVec 32)) (x!126873 (_ BitVec 32))) (Undefined!10722) (MissingVacant!10722 (index!45268 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96127 (_ BitVec 32)) SeekEntryResult!10722)

(assert (=> b!1405786 (= e!795715 (= (seekEntryOrOpen!0 (select (arr!46411 a!2901) j!112) a!2901 mask!2840) (Found!10722 j!112)))))

(declare-fun res!944002 () Bool)

(assert (=> start!120820 (=> (not res!944002) (not e!795713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120820 (= res!944002 (validMask!0 mask!2840))))

(assert (=> start!120820 e!795713))

(assert (=> start!120820 true))

(declare-fun array_inv!35439 (array!96127) Bool)

(assert (=> start!120820 (array_inv!35439 a!2901)))

(declare-fun b!1405787 () Bool)

(declare-fun res!944005 () Bool)

(assert (=> b!1405787 (=> (not res!944005) (not e!795713))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405787 (= res!944005 (and (= (size!46961 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46961 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46961 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405788 () Bool)

(declare-fun res!944007 () Bool)

(assert (=> b!1405788 (=> (not res!944007) (not e!795713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96127 (_ BitVec 32)) Bool)

(assert (=> b!1405788 (= res!944007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405789 () Bool)

(declare-fun e!795716 () Bool)

(assert (=> b!1405789 (= e!795716 true)))

(declare-fun lt!619138 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405789 (= lt!619138 (toIndex!0 (select (store (arr!46411 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1405790 () Bool)

(assert (=> b!1405790 (= e!795713 (not e!795716))))

(declare-fun res!944004 () Bool)

(assert (=> b!1405790 (=> res!944004 e!795716)))

(declare-fun lt!619140 () SeekEntryResult!10722)

(assert (=> b!1405790 (= res!944004 (or (not (is-Intermediate!10722 lt!619140)) (undefined!11534 lt!619140)))))

(assert (=> b!1405790 e!795715))

(declare-fun res!944008 () Bool)

(assert (=> b!1405790 (=> (not res!944008) (not e!795715))))

(assert (=> b!1405790 (= res!944008 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47418 0))(
  ( (Unit!47419) )
))
(declare-fun lt!619139 () Unit!47418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47418)

(assert (=> b!1405790 (= lt!619139 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96127 (_ BitVec 32)) SeekEntryResult!10722)

(assert (=> b!1405790 (= lt!619140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46411 a!2901) j!112) mask!2840) (select (arr!46411 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405791 () Bool)

(declare-fun res!944001 () Bool)

(assert (=> b!1405791 (=> (not res!944001) (not e!795713))))

(assert (=> b!1405791 (= res!944001 (validKeyInArray!0 (select (arr!46411 a!2901) i!1037)))))

(assert (= (and start!120820 res!944002) b!1405787))

(assert (= (and b!1405787 res!944005) b!1405791))

(assert (= (and b!1405791 res!944001) b!1405785))

(assert (= (and b!1405785 res!944006) b!1405788))

(assert (= (and b!1405788 res!944007) b!1405784))

(assert (= (and b!1405784 res!944003) b!1405790))

(assert (= (and b!1405790 res!944008) b!1405786))

(assert (= (and b!1405790 (not res!944004)) b!1405789))

(declare-fun m!1294657 () Bool)

(assert (=> b!1405791 m!1294657))

(assert (=> b!1405791 m!1294657))

(declare-fun m!1294659 () Bool)

(assert (=> b!1405791 m!1294659))

(declare-fun m!1294661 () Bool)

(assert (=> b!1405784 m!1294661))

(declare-fun m!1294663 () Bool)

(assert (=> start!120820 m!1294663))

(declare-fun m!1294665 () Bool)

(assert (=> start!120820 m!1294665))

(declare-fun m!1294667 () Bool)

(assert (=> b!1405788 m!1294667))

(declare-fun m!1294669 () Bool)

(assert (=> b!1405790 m!1294669))

(declare-fun m!1294671 () Bool)

(assert (=> b!1405790 m!1294671))

(assert (=> b!1405790 m!1294669))

(declare-fun m!1294673 () Bool)

(assert (=> b!1405790 m!1294673))

(assert (=> b!1405790 m!1294671))

(assert (=> b!1405790 m!1294669))

(declare-fun m!1294675 () Bool)

(assert (=> b!1405790 m!1294675))

(declare-fun m!1294677 () Bool)

(assert (=> b!1405790 m!1294677))

(assert (=> b!1405786 m!1294669))

(assert (=> b!1405786 m!1294669))

(declare-fun m!1294679 () Bool)

(assert (=> b!1405786 m!1294679))

(assert (=> b!1405785 m!1294669))

(assert (=> b!1405785 m!1294669))

(declare-fun m!1294681 () Bool)

(assert (=> b!1405785 m!1294681))

(declare-fun m!1294683 () Bool)

(assert (=> b!1405789 m!1294683))

(declare-fun m!1294685 () Bool)

(assert (=> b!1405789 m!1294685))

(assert (=> b!1405789 m!1294685))

(declare-fun m!1294687 () Bool)

(assert (=> b!1405789 m!1294687))

(push 1)

(assert (not b!1405789))

(assert (not b!1405784))

(assert (not b!1405788))

(assert (not b!1405786))

(assert (not b!1405790))

(assert (not b!1405791))

(assert (not start!120820))

(assert (not b!1405785))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

