; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119806 () Bool)

(assert start!119806)

(declare-fun b!1395317 () Bool)

(declare-fun res!934564 () Bool)

(declare-fun e!789949 () Bool)

(assert (=> b!1395317 (=> (not res!934564) (not e!789949))))

(declare-datatypes ((array!95437 0))(
  ( (array!95438 (arr!46075 (Array (_ BitVec 32) (_ BitVec 64))) (size!46625 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95437)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395317 (= res!934564 (validKeyInArray!0 (select (arr!46075 a!2901) j!112)))))

(declare-fun b!1395318 () Bool)

(declare-fun e!789947 () Bool)

(assert (=> b!1395318 (= e!789947 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10392 0))(
  ( (MissingZero!10392 (index!43939 (_ BitVec 32))) (Found!10392 (index!43940 (_ BitVec 32))) (Intermediate!10392 (undefined!11204 Bool) (index!43941 (_ BitVec 32)) (x!125602 (_ BitVec 32))) (Undefined!10392) (MissingVacant!10392 (index!43942 (_ BitVec 32))) )
))
(declare-fun lt!612953 () SeekEntryResult!10392)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95437 (_ BitVec 32)) SeekEntryResult!10392)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395318 (= lt!612953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46075 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46075 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95438 (store (arr!46075 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46625 a!2901)) mask!2840))))

(declare-fun b!1395319 () Bool)

(declare-fun res!934562 () Bool)

(assert (=> b!1395319 (=> (not res!934562) (not e!789949))))

(assert (=> b!1395319 (= res!934562 (and (= (size!46625 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46625 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46625 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395320 () Bool)

(declare-fun res!934565 () Bool)

(assert (=> b!1395320 (=> (not res!934565) (not e!789949))))

(declare-datatypes ((List!32594 0))(
  ( (Nil!32591) (Cons!32590 (h!33826 (_ BitVec 64)) (t!47288 List!32594)) )
))
(declare-fun arrayNoDuplicates!0 (array!95437 (_ BitVec 32) List!32594) Bool)

(assert (=> b!1395320 (= res!934565 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32591))))

(declare-fun b!1395321 () Bool)

(assert (=> b!1395321 (= e!789949 (not e!789947))))

(declare-fun res!934560 () Bool)

(assert (=> b!1395321 (=> res!934560 e!789947)))

(declare-fun lt!612954 () SeekEntryResult!10392)

(assert (=> b!1395321 (= res!934560 (or (not (is-Intermediate!10392 lt!612954)) (undefined!11204 lt!612954)))))

(declare-fun e!789950 () Bool)

(assert (=> b!1395321 e!789950))

(declare-fun res!934561 () Bool)

(assert (=> b!1395321 (=> (not res!934561) (not e!789950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95437 (_ BitVec 32)) Bool)

(assert (=> b!1395321 (= res!934561 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46788 0))(
  ( (Unit!46789) )
))
(declare-fun lt!612952 () Unit!46788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46788)

(assert (=> b!1395321 (= lt!612952 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395321 (= lt!612954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46075 a!2901) j!112) mask!2840) (select (arr!46075 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!934563 () Bool)

(assert (=> start!119806 (=> (not res!934563) (not e!789949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119806 (= res!934563 (validMask!0 mask!2840))))

(assert (=> start!119806 e!789949))

(assert (=> start!119806 true))

(declare-fun array_inv!35103 (array!95437) Bool)

(assert (=> start!119806 (array_inv!35103 a!2901)))

(declare-fun b!1395322 () Bool)

(declare-fun res!934566 () Bool)

(assert (=> b!1395322 (=> (not res!934566) (not e!789949))))

(assert (=> b!1395322 (= res!934566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395323 () Bool)

(declare-fun res!934567 () Bool)

(assert (=> b!1395323 (=> (not res!934567) (not e!789949))))

(assert (=> b!1395323 (= res!934567 (validKeyInArray!0 (select (arr!46075 a!2901) i!1037)))))

(declare-fun b!1395324 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95437 (_ BitVec 32)) SeekEntryResult!10392)

(assert (=> b!1395324 (= e!789950 (= (seekEntryOrOpen!0 (select (arr!46075 a!2901) j!112) a!2901 mask!2840) (Found!10392 j!112)))))

(assert (= (and start!119806 res!934563) b!1395319))

(assert (= (and b!1395319 res!934562) b!1395323))

(assert (= (and b!1395323 res!934567) b!1395317))

(assert (= (and b!1395317 res!934564) b!1395322))

(assert (= (and b!1395322 res!934566) b!1395320))

(assert (= (and b!1395320 res!934565) b!1395321))

(assert (= (and b!1395321 res!934561) b!1395324))

(assert (= (and b!1395321 (not res!934560)) b!1395318))

(declare-fun m!1281761 () Bool)

(assert (=> b!1395324 m!1281761))

(assert (=> b!1395324 m!1281761))

(declare-fun m!1281763 () Bool)

(assert (=> b!1395324 m!1281763))

(declare-fun m!1281765 () Bool)

(assert (=> b!1395318 m!1281765))

(declare-fun m!1281767 () Bool)

(assert (=> b!1395318 m!1281767))

(assert (=> b!1395318 m!1281767))

(declare-fun m!1281769 () Bool)

(assert (=> b!1395318 m!1281769))

(assert (=> b!1395318 m!1281769))

(assert (=> b!1395318 m!1281767))

(declare-fun m!1281771 () Bool)

(assert (=> b!1395318 m!1281771))

(declare-fun m!1281773 () Bool)

(assert (=> start!119806 m!1281773))

(declare-fun m!1281775 () Bool)

(assert (=> start!119806 m!1281775))

(declare-fun m!1281777 () Bool)

(assert (=> b!1395323 m!1281777))

(assert (=> b!1395323 m!1281777))

(declare-fun m!1281779 () Bool)

(assert (=> b!1395323 m!1281779))

(assert (=> b!1395321 m!1281761))

(declare-fun m!1281781 () Bool)

(assert (=> b!1395321 m!1281781))

(assert (=> b!1395321 m!1281761))

(declare-fun m!1281783 () Bool)

(assert (=> b!1395321 m!1281783))

(assert (=> b!1395321 m!1281781))

(assert (=> b!1395321 m!1281761))

(declare-fun m!1281785 () Bool)

(assert (=> b!1395321 m!1281785))

(declare-fun m!1281787 () Bool)

(assert (=> b!1395321 m!1281787))

(declare-fun m!1281789 () Bool)

(assert (=> b!1395322 m!1281789))

(declare-fun m!1281791 () Bool)

(assert (=> b!1395320 m!1281791))

(assert (=> b!1395317 m!1281761))

(assert (=> b!1395317 m!1281761))

(declare-fun m!1281793 () Bool)

(assert (=> b!1395317 m!1281793))

(push 1)

(assert (not b!1395323))

(assert (not start!119806))

(assert (not b!1395322))

(assert (not b!1395318))

(assert (not b!1395320))

(assert (not b!1395324))

(assert (not b!1395317))

(assert (not b!1395321))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

