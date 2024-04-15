; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120486 () Bool)

(assert start!120486)

(declare-datatypes ((array!95848 0))(
  ( (array!95849 (arr!46275 (Array (_ BitVec 32) (_ BitVec 64))) (size!46827 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95848)

(declare-fun e!794388 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1402925 () Bool)

(declare-datatypes ((SeekEntryResult!10618 0))(
  ( (MissingZero!10618 (index!44849 (_ BitVec 32))) (Found!10618 (index!44850 (_ BitVec 32))) (Intermediate!10618 (undefined!11430 Bool) (index!44851 (_ BitVec 32)) (x!126458 (_ BitVec 32))) (Undefined!10618) (MissingVacant!10618 (index!44852 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95848 (_ BitVec 32)) SeekEntryResult!10618)

(assert (=> b!1402925 (= e!794388 (= (seekEntryOrOpen!0 (select (arr!46275 a!2901) j!112) a!2901 mask!2840) (Found!10618 j!112)))))

(declare-fun res!941493 () Bool)

(declare-fun e!794390 () Bool)

(assert (=> start!120486 (=> (not res!941493) (not e!794390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120486 (= res!941493 (validMask!0 mask!2840))))

(assert (=> start!120486 e!794390))

(assert (=> start!120486 true))

(declare-fun array_inv!35508 (array!95848) Bool)

(assert (=> start!120486 (array_inv!35508 a!2901)))

(declare-fun b!1402926 () Bool)

(declare-fun res!941490 () Bool)

(assert (=> b!1402926 (=> (not res!941490) (not e!794390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95848 (_ BitVec 32)) Bool)

(assert (=> b!1402926 (= res!941490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402927 () Bool)

(declare-fun e!794389 () Bool)

(assert (=> b!1402927 (= e!794389 true)))

(declare-fun lt!618049 () SeekEntryResult!10618)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95848 (_ BitVec 32)) SeekEntryResult!10618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402927 (= lt!618049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46275 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46275 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95849 (store (arr!46275 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46827 a!2901)) mask!2840))))

(declare-fun b!1402928 () Bool)

(assert (=> b!1402928 (= e!794390 (not e!794389))))

(declare-fun res!941494 () Bool)

(assert (=> b!1402928 (=> res!941494 e!794389)))

(declare-fun lt!618050 () SeekEntryResult!10618)

(assert (=> b!1402928 (= res!941494 (or (not (is-Intermediate!10618 lt!618050)) (undefined!11430 lt!618050)))))

(assert (=> b!1402928 e!794388))

(declare-fun res!941489 () Bool)

(assert (=> b!1402928 (=> (not res!941489) (not e!794388))))

(assert (=> b!1402928 (= res!941489 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47083 0))(
  ( (Unit!47084) )
))
(declare-fun lt!618048 () Unit!47083)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47083)

(assert (=> b!1402928 (= lt!618048 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402928 (= lt!618050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46275 a!2901) j!112) mask!2840) (select (arr!46275 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1402929 () Bool)

(declare-fun res!941488 () Bool)

(assert (=> b!1402929 (=> (not res!941488) (not e!794390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402929 (= res!941488 (validKeyInArray!0 (select (arr!46275 a!2901) j!112)))))

(declare-fun b!1402930 () Bool)

(declare-fun res!941492 () Bool)

(assert (=> b!1402930 (=> (not res!941492) (not e!794390))))

(declare-datatypes ((List!32872 0))(
  ( (Nil!32869) (Cons!32868 (h!34116 (_ BitVec 64)) (t!47558 List!32872)) )
))
(declare-fun arrayNoDuplicates!0 (array!95848 (_ BitVec 32) List!32872) Bool)

(assert (=> b!1402930 (= res!941492 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32869))))

(declare-fun b!1402931 () Bool)

(declare-fun res!941487 () Bool)

(assert (=> b!1402931 (=> (not res!941487) (not e!794390))))

(assert (=> b!1402931 (= res!941487 (validKeyInArray!0 (select (arr!46275 a!2901) i!1037)))))

(declare-fun b!1402932 () Bool)

(declare-fun res!941491 () Bool)

(assert (=> b!1402932 (=> (not res!941491) (not e!794390))))

(assert (=> b!1402932 (= res!941491 (and (= (size!46827 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46827 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46827 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120486 res!941493) b!1402932))

(assert (= (and b!1402932 res!941491) b!1402931))

(assert (= (and b!1402931 res!941487) b!1402929))

(assert (= (and b!1402929 res!941488) b!1402926))

(assert (= (and b!1402926 res!941490) b!1402930))

(assert (= (and b!1402930 res!941492) b!1402928))

(assert (= (and b!1402928 res!941489) b!1402925))

(assert (= (and b!1402928 (not res!941494)) b!1402927))

(declare-fun m!1290927 () Bool)

(assert (=> b!1402929 m!1290927))

(assert (=> b!1402929 m!1290927))

(declare-fun m!1290929 () Bool)

(assert (=> b!1402929 m!1290929))

(declare-fun m!1290931 () Bool)

(assert (=> start!120486 m!1290931))

(declare-fun m!1290933 () Bool)

(assert (=> start!120486 m!1290933))

(assert (=> b!1402928 m!1290927))

(declare-fun m!1290935 () Bool)

(assert (=> b!1402928 m!1290935))

(assert (=> b!1402928 m!1290927))

(declare-fun m!1290937 () Bool)

(assert (=> b!1402928 m!1290937))

(assert (=> b!1402928 m!1290935))

(assert (=> b!1402928 m!1290927))

(declare-fun m!1290939 () Bool)

(assert (=> b!1402928 m!1290939))

(declare-fun m!1290941 () Bool)

(assert (=> b!1402928 m!1290941))

(declare-fun m!1290943 () Bool)

(assert (=> b!1402927 m!1290943))

(declare-fun m!1290945 () Bool)

(assert (=> b!1402927 m!1290945))

(assert (=> b!1402927 m!1290945))

(declare-fun m!1290947 () Bool)

(assert (=> b!1402927 m!1290947))

(assert (=> b!1402927 m!1290947))

(assert (=> b!1402927 m!1290945))

(declare-fun m!1290949 () Bool)

(assert (=> b!1402927 m!1290949))

(declare-fun m!1290951 () Bool)

(assert (=> b!1402931 m!1290951))

(assert (=> b!1402931 m!1290951))

(declare-fun m!1290953 () Bool)

(assert (=> b!1402931 m!1290953))

(declare-fun m!1290955 () Bool)

(assert (=> b!1402926 m!1290955))

(declare-fun m!1290957 () Bool)

(assert (=> b!1402930 m!1290957))

(assert (=> b!1402925 m!1290927))

(assert (=> b!1402925 m!1290927))

(declare-fun m!1290959 () Bool)

(assert (=> b!1402925 m!1290959))

(push 1)

(assert (not b!1402928))

(assert (not b!1402931))

(assert (not start!120486))

(assert (not b!1402925))

(assert (not b!1402926))

(assert (not b!1402929))

(assert (not b!1402927))

(assert (not b!1402930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

