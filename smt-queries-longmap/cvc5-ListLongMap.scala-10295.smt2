; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121092 () Bool)

(assert start!121092)

(declare-fun res!945631 () Bool)

(declare-fun e!796850 () Bool)

(assert (=> start!121092 (=> (not res!945631) (not e!796850))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121092 (= res!945631 (validMask!0 mask!2840))))

(assert (=> start!121092 e!796850))

(assert (=> start!121092 true))

(declare-datatypes ((array!96246 0))(
  ( (array!96247 (arr!46466 (Array (_ BitVec 32) (_ BitVec 64))) (size!47016 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96246)

(declare-fun array_inv!35494 (array!96246) Bool)

(assert (=> start!121092 (array_inv!35494 a!2901)))

(declare-fun b!1407905 () Bool)

(declare-fun e!796852 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10777 0))(
  ( (MissingZero!10777 (index!45485 (_ BitVec 32))) (Found!10777 (index!45486 (_ BitVec 32))) (Intermediate!10777 (undefined!11589 Bool) (index!45487 (_ BitVec 32)) (x!127098 (_ BitVec 32))) (Undefined!10777) (MissingVacant!10777 (index!45488 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96246 (_ BitVec 32)) SeekEntryResult!10777)

(assert (=> b!1407905 (= e!796852 (= (seekEntryOrOpen!0 (select (arr!46466 a!2901) j!112) a!2901 mask!2840) (Found!10777 j!112)))))

(declare-fun b!1407906 () Bool)

(declare-fun e!796851 () Bool)

(assert (=> b!1407906 (= e!796851 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!619984 () SeekEntryResult!10777)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96246 (_ BitVec 32)) SeekEntryResult!10777)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407906 (= lt!619984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46466 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46466 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96247 (store (arr!46466 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47016 a!2901)) mask!2840))))

(declare-fun b!1407907 () Bool)

(declare-fun res!945629 () Bool)

(assert (=> b!1407907 (=> (not res!945629) (not e!796850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407907 (= res!945629 (validKeyInArray!0 (select (arr!46466 a!2901) i!1037)))))

(declare-fun b!1407908 () Bool)

(declare-fun res!945627 () Bool)

(assert (=> b!1407908 (=> (not res!945627) (not e!796850))))

(assert (=> b!1407908 (= res!945627 (and (= (size!47016 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47016 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47016 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407909 () Bool)

(declare-fun res!945632 () Bool)

(assert (=> b!1407909 (=> (not res!945632) (not e!796850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96246 (_ BitVec 32)) Bool)

(assert (=> b!1407909 (= res!945632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407910 () Bool)

(declare-fun res!945628 () Bool)

(assert (=> b!1407910 (=> (not res!945628) (not e!796850))))

(declare-datatypes ((List!32985 0))(
  ( (Nil!32982) (Cons!32981 (h!34244 (_ BitVec 64)) (t!47679 List!32985)) )
))
(declare-fun arrayNoDuplicates!0 (array!96246 (_ BitVec 32) List!32985) Bool)

(assert (=> b!1407910 (= res!945628 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32982))))

(declare-fun b!1407911 () Bool)

(declare-fun res!945633 () Bool)

(assert (=> b!1407911 (=> (not res!945633) (not e!796850))))

(assert (=> b!1407911 (= res!945633 (validKeyInArray!0 (select (arr!46466 a!2901) j!112)))))

(declare-fun b!1407912 () Bool)

(assert (=> b!1407912 (= e!796850 (not e!796851))))

(declare-fun res!945634 () Bool)

(assert (=> b!1407912 (=> res!945634 e!796851)))

(declare-fun lt!619986 () SeekEntryResult!10777)

(assert (=> b!1407912 (= res!945634 (or (not (is-Intermediate!10777 lt!619986)) (undefined!11589 lt!619986)))))

(assert (=> b!1407912 e!796852))

(declare-fun res!945630 () Bool)

(assert (=> b!1407912 (=> (not res!945630) (not e!796852))))

(assert (=> b!1407912 (= res!945630 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47528 0))(
  ( (Unit!47529) )
))
(declare-fun lt!619985 () Unit!47528)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47528)

(assert (=> b!1407912 (= lt!619985 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407912 (= lt!619986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46466 a!2901) j!112) mask!2840) (select (arr!46466 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121092 res!945631) b!1407908))

(assert (= (and b!1407908 res!945627) b!1407907))

(assert (= (and b!1407907 res!945629) b!1407911))

(assert (= (and b!1407911 res!945633) b!1407909))

(assert (= (and b!1407909 res!945632) b!1407910))

(assert (= (and b!1407910 res!945628) b!1407912))

(assert (= (and b!1407912 res!945630) b!1407905))

(assert (= (and b!1407912 (not res!945634)) b!1407906))

(declare-fun m!1296987 () Bool)

(assert (=> b!1407907 m!1296987))

(assert (=> b!1407907 m!1296987))

(declare-fun m!1296989 () Bool)

(assert (=> b!1407907 m!1296989))

(declare-fun m!1296991 () Bool)

(assert (=> b!1407912 m!1296991))

(declare-fun m!1296993 () Bool)

(assert (=> b!1407912 m!1296993))

(assert (=> b!1407912 m!1296991))

(declare-fun m!1296995 () Bool)

(assert (=> b!1407912 m!1296995))

(assert (=> b!1407912 m!1296993))

(assert (=> b!1407912 m!1296991))

(declare-fun m!1296997 () Bool)

(assert (=> b!1407912 m!1296997))

(declare-fun m!1296999 () Bool)

(assert (=> b!1407912 m!1296999))

(declare-fun m!1297001 () Bool)

(assert (=> start!121092 m!1297001))

(declare-fun m!1297003 () Bool)

(assert (=> start!121092 m!1297003))

(declare-fun m!1297005 () Bool)

(assert (=> b!1407906 m!1297005))

(declare-fun m!1297007 () Bool)

(assert (=> b!1407906 m!1297007))

(assert (=> b!1407906 m!1297007))

(declare-fun m!1297009 () Bool)

(assert (=> b!1407906 m!1297009))

(assert (=> b!1407906 m!1297009))

(assert (=> b!1407906 m!1297007))

(declare-fun m!1297011 () Bool)

(assert (=> b!1407906 m!1297011))

(declare-fun m!1297013 () Bool)

(assert (=> b!1407910 m!1297013))

(assert (=> b!1407911 m!1296991))

(assert (=> b!1407911 m!1296991))

(declare-fun m!1297015 () Bool)

(assert (=> b!1407911 m!1297015))

(declare-fun m!1297017 () Bool)

(assert (=> b!1407909 m!1297017))

(assert (=> b!1407905 m!1296991))

(assert (=> b!1407905 m!1296991))

(declare-fun m!1297019 () Bool)

(assert (=> b!1407905 m!1297019))

(push 1)

(assert (not b!1407910))

(assert (not b!1407906))

(assert (not start!121092))

(assert (not b!1407909))

(assert (not b!1407907))

(assert (not b!1407912))

(assert (not b!1407911))

(assert (not b!1407905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

