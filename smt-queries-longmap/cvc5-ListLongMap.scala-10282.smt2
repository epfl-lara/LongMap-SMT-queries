; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121044 () Bool)

(assert start!121044)

(declare-fun b!1407356 () Bool)

(declare-fun res!944894 () Bool)

(declare-fun e!796668 () Bool)

(assert (=> b!1407356 (=> (not res!944894) (not e!796668))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96273 0))(
  ( (array!96274 (arr!46482 (Array (_ BitVec 32) (_ BitVec 64))) (size!47033 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96273)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1407356 (= res!944894 (and (= (size!47033 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47033 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47033 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407357 () Bool)

(declare-fun e!796669 () Bool)

(assert (=> b!1407357 (= e!796669 true)))

(declare-datatypes ((SeekEntryResult!10696 0))(
  ( (MissingZero!10696 (index!45161 (_ BitVec 32))) (Found!10696 (index!45162 (_ BitVec 32))) (Intermediate!10696 (undefined!11508 Bool) (index!45163 (_ BitVec 32)) (x!126914 (_ BitVec 32))) (Undefined!10696) (MissingVacant!10696 (index!45164 (_ BitVec 32))) )
))
(declare-fun lt!619699 () SeekEntryResult!10696)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96273 (_ BitVec 32)) SeekEntryResult!10696)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407357 (= lt!619699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46482 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46482 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96274 (store (arr!46482 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47033 a!2901)) mask!2840))))

(declare-fun b!1407358 () Bool)

(declare-fun res!944892 () Bool)

(assert (=> b!1407358 (=> (not res!944892) (not e!796668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407358 (= res!944892 (validKeyInArray!0 (select (arr!46482 a!2901) j!112)))))

(declare-fun b!1407359 () Bool)

(declare-fun res!944893 () Bool)

(assert (=> b!1407359 (=> (not res!944893) (not e!796668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96273 (_ BitVec 32)) Bool)

(assert (=> b!1407359 (= res!944893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407360 () Bool)

(declare-fun res!944889 () Bool)

(assert (=> b!1407360 (=> (not res!944889) (not e!796668))))

(declare-datatypes ((List!32988 0))(
  ( (Nil!32985) (Cons!32984 (h!34246 (_ BitVec 64)) (t!47674 List!32988)) )
))
(declare-fun arrayNoDuplicates!0 (array!96273 (_ BitVec 32) List!32988) Bool)

(assert (=> b!1407360 (= res!944889 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32985))))

(declare-fun b!1407361 () Bool)

(declare-fun res!944895 () Bool)

(assert (=> b!1407361 (=> (not res!944895) (not e!796668))))

(assert (=> b!1407361 (= res!944895 (validKeyInArray!0 (select (arr!46482 a!2901) i!1037)))))

(declare-fun res!944890 () Bool)

(assert (=> start!121044 (=> (not res!944890) (not e!796668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121044 (= res!944890 (validMask!0 mask!2840))))

(assert (=> start!121044 e!796668))

(assert (=> start!121044 true))

(declare-fun array_inv!35763 (array!96273) Bool)

(assert (=> start!121044 (array_inv!35763 a!2901)))

(declare-fun b!1407362 () Bool)

(assert (=> b!1407362 (= e!796668 (not e!796669))))

(declare-fun res!944896 () Bool)

(assert (=> b!1407362 (=> res!944896 e!796669)))

(declare-fun lt!619698 () SeekEntryResult!10696)

(assert (=> b!1407362 (= res!944896 (or (not (is-Intermediate!10696 lt!619698)) (undefined!11508 lt!619698)))))

(declare-fun e!796667 () Bool)

(assert (=> b!1407362 e!796667))

(declare-fun res!944891 () Bool)

(assert (=> b!1407362 (=> (not res!944891) (not e!796667))))

(assert (=> b!1407362 (= res!944891 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47393 0))(
  ( (Unit!47394) )
))
(declare-fun lt!619700 () Unit!47393)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96273 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47393)

(assert (=> b!1407362 (= lt!619700 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407362 (= lt!619698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46482 a!2901) j!112) mask!2840) (select (arr!46482 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407363 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96273 (_ BitVec 32)) SeekEntryResult!10696)

(assert (=> b!1407363 (= e!796667 (= (seekEntryOrOpen!0 (select (arr!46482 a!2901) j!112) a!2901 mask!2840) (Found!10696 j!112)))))

(assert (= (and start!121044 res!944890) b!1407356))

(assert (= (and b!1407356 res!944894) b!1407361))

(assert (= (and b!1407361 res!944895) b!1407358))

(assert (= (and b!1407358 res!944892) b!1407359))

(assert (= (and b!1407359 res!944893) b!1407360))

(assert (= (and b!1407360 res!944889) b!1407362))

(assert (= (and b!1407362 res!944891) b!1407363))

(assert (= (and b!1407362 (not res!944896)) b!1407357))

(declare-fun m!1296639 () Bool)

(assert (=> b!1407361 m!1296639))

(assert (=> b!1407361 m!1296639))

(declare-fun m!1296641 () Bool)

(assert (=> b!1407361 m!1296641))

(declare-fun m!1296643 () Bool)

(assert (=> start!121044 m!1296643))

(declare-fun m!1296645 () Bool)

(assert (=> start!121044 m!1296645))

(declare-fun m!1296647 () Bool)

(assert (=> b!1407360 m!1296647))

(declare-fun m!1296649 () Bool)

(assert (=> b!1407358 m!1296649))

(assert (=> b!1407358 m!1296649))

(declare-fun m!1296651 () Bool)

(assert (=> b!1407358 m!1296651))

(declare-fun m!1296653 () Bool)

(assert (=> b!1407359 m!1296653))

(assert (=> b!1407363 m!1296649))

(assert (=> b!1407363 m!1296649))

(declare-fun m!1296655 () Bool)

(assert (=> b!1407363 m!1296655))

(declare-fun m!1296657 () Bool)

(assert (=> b!1407357 m!1296657))

(declare-fun m!1296659 () Bool)

(assert (=> b!1407357 m!1296659))

(assert (=> b!1407357 m!1296659))

(declare-fun m!1296661 () Bool)

(assert (=> b!1407357 m!1296661))

(assert (=> b!1407357 m!1296661))

(assert (=> b!1407357 m!1296659))

(declare-fun m!1296663 () Bool)

(assert (=> b!1407357 m!1296663))

(assert (=> b!1407362 m!1296649))

(declare-fun m!1296665 () Bool)

(assert (=> b!1407362 m!1296665))

(assert (=> b!1407362 m!1296649))

(declare-fun m!1296667 () Bool)

(assert (=> b!1407362 m!1296667))

(assert (=> b!1407362 m!1296665))

(assert (=> b!1407362 m!1296649))

(declare-fun m!1296669 () Bool)

(assert (=> b!1407362 m!1296669))

(declare-fun m!1296671 () Bool)

(assert (=> b!1407362 m!1296671))

(push 1)

(assert (not b!1407361))

(assert (not b!1407358))

(assert (not start!121044))

(assert (not b!1407360))

(assert (not b!1407362))

(assert (not b!1407359))

(assert (not b!1407357))

(assert (not b!1407363))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

