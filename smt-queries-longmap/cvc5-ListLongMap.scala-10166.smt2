; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119814 () Bool)

(assert start!119814)

(declare-fun b!1395422 () Bool)

(declare-fun e!789996 () Bool)

(assert (=> b!1395422 (= e!789996 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95445 0))(
  ( (array!95446 (arr!46079 (Array (_ BitVec 32) (_ BitVec 64))) (size!46629 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95445)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10396 0))(
  ( (MissingZero!10396 (index!43955 (_ BitVec 32))) (Found!10396 (index!43956 (_ BitVec 32))) (Intermediate!10396 (undefined!11208 Bool) (index!43957 (_ BitVec 32)) (x!125622 (_ BitVec 32))) (Undefined!10396) (MissingVacant!10396 (index!43958 (_ BitVec 32))) )
))
(declare-fun lt!612980 () SeekEntryResult!10396)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95445 (_ BitVec 32)) SeekEntryResult!10396)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395422 (= lt!612980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46079 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46079 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95446 (store (arr!46079 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46629 a!2901)) mask!2840))))

(declare-fun res!934671 () Bool)

(declare-fun e!789995 () Bool)

(assert (=> start!119814 (=> (not res!934671) (not e!789995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119814 (= res!934671 (validMask!0 mask!2840))))

(assert (=> start!119814 e!789995))

(assert (=> start!119814 true))

(declare-fun array_inv!35107 (array!95445) Bool)

(assert (=> start!119814 (array_inv!35107 a!2901)))

(declare-fun b!1395423 () Bool)

(declare-fun res!934670 () Bool)

(assert (=> b!1395423 (=> (not res!934670) (not e!789995))))

(assert (=> b!1395423 (= res!934670 (and (= (size!46629 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46629 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46629 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395424 () Bool)

(declare-fun res!934669 () Bool)

(assert (=> b!1395424 (=> (not res!934669) (not e!789995))))

(declare-datatypes ((List!32598 0))(
  ( (Nil!32595) (Cons!32594 (h!33830 (_ BitVec 64)) (t!47292 List!32598)) )
))
(declare-fun arrayNoDuplicates!0 (array!95445 (_ BitVec 32) List!32598) Bool)

(assert (=> b!1395424 (= res!934669 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32595))))

(declare-fun b!1395425 () Bool)

(declare-fun res!934665 () Bool)

(assert (=> b!1395425 (=> (not res!934665) (not e!789995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395425 (= res!934665 (validKeyInArray!0 (select (arr!46079 a!2901) j!112)))))

(declare-fun e!789997 () Bool)

(declare-fun b!1395426 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95445 (_ BitVec 32)) SeekEntryResult!10396)

(assert (=> b!1395426 (= e!789997 (= (seekEntryOrOpen!0 (select (arr!46079 a!2901) j!112) a!2901 mask!2840) (Found!10396 j!112)))))

(declare-fun b!1395427 () Bool)

(declare-fun res!934667 () Bool)

(assert (=> b!1395427 (=> (not res!934667) (not e!789995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95445 (_ BitVec 32)) Bool)

(assert (=> b!1395427 (= res!934667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395428 () Bool)

(assert (=> b!1395428 (= e!789995 (not e!789996))))

(declare-fun res!934672 () Bool)

(assert (=> b!1395428 (=> res!934672 e!789996)))

(declare-fun lt!612981 () SeekEntryResult!10396)

(assert (=> b!1395428 (= res!934672 (or (not (is-Intermediate!10396 lt!612981)) (undefined!11208 lt!612981)))))

(assert (=> b!1395428 e!789997))

(declare-fun res!934668 () Bool)

(assert (=> b!1395428 (=> (not res!934668) (not e!789997))))

(assert (=> b!1395428 (= res!934668 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46796 0))(
  ( (Unit!46797) )
))
(declare-fun lt!612979 () Unit!46796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46796)

(assert (=> b!1395428 (= lt!612979 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395428 (= lt!612981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46079 a!2901) j!112) mask!2840) (select (arr!46079 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395429 () Bool)

(declare-fun res!934666 () Bool)

(assert (=> b!1395429 (=> (not res!934666) (not e!789995))))

(assert (=> b!1395429 (= res!934666 (validKeyInArray!0 (select (arr!46079 a!2901) i!1037)))))

(assert (= (and start!119814 res!934671) b!1395423))

(assert (= (and b!1395423 res!934670) b!1395429))

(assert (= (and b!1395429 res!934666) b!1395425))

(assert (= (and b!1395425 res!934665) b!1395427))

(assert (= (and b!1395427 res!934667) b!1395424))

(assert (= (and b!1395424 res!934669) b!1395428))

(assert (= (and b!1395428 res!934668) b!1395426))

(assert (= (and b!1395428 (not res!934672)) b!1395422))

(declare-fun m!1281897 () Bool)

(assert (=> b!1395424 m!1281897))

(declare-fun m!1281899 () Bool)

(assert (=> b!1395428 m!1281899))

(declare-fun m!1281901 () Bool)

(assert (=> b!1395428 m!1281901))

(assert (=> b!1395428 m!1281899))

(declare-fun m!1281903 () Bool)

(assert (=> b!1395428 m!1281903))

(assert (=> b!1395428 m!1281901))

(assert (=> b!1395428 m!1281899))

(declare-fun m!1281905 () Bool)

(assert (=> b!1395428 m!1281905))

(declare-fun m!1281907 () Bool)

(assert (=> b!1395428 m!1281907))

(assert (=> b!1395426 m!1281899))

(assert (=> b!1395426 m!1281899))

(declare-fun m!1281909 () Bool)

(assert (=> b!1395426 m!1281909))

(declare-fun m!1281911 () Bool)

(assert (=> b!1395429 m!1281911))

(assert (=> b!1395429 m!1281911))

(declare-fun m!1281913 () Bool)

(assert (=> b!1395429 m!1281913))

(declare-fun m!1281915 () Bool)

(assert (=> start!119814 m!1281915))

(declare-fun m!1281917 () Bool)

(assert (=> start!119814 m!1281917))

(declare-fun m!1281919 () Bool)

(assert (=> b!1395422 m!1281919))

(declare-fun m!1281921 () Bool)

(assert (=> b!1395422 m!1281921))

(assert (=> b!1395422 m!1281921))

(declare-fun m!1281923 () Bool)

(assert (=> b!1395422 m!1281923))

(assert (=> b!1395422 m!1281923))

(assert (=> b!1395422 m!1281921))

(declare-fun m!1281925 () Bool)

(assert (=> b!1395422 m!1281925))

(assert (=> b!1395425 m!1281899))

(assert (=> b!1395425 m!1281899))

(declare-fun m!1281927 () Bool)

(assert (=> b!1395425 m!1281927))

(declare-fun m!1281929 () Bool)

(assert (=> b!1395427 m!1281929))

(push 1)

(assert (not b!1395425))

(assert (not b!1395429))

(assert (not b!1395428))

(assert (not b!1395422))

(assert (not b!1395426))

(assert (not b!1395424))

(assert (not start!119814))

(assert (not b!1395427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

