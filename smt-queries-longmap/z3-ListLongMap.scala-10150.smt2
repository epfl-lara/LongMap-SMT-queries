; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119666 () Bool)

(assert start!119666)

(declare-fun b!1393931 () Bool)

(declare-fun e!789265 () Bool)

(assert (=> b!1393931 (= e!789265 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95348 0))(
  ( (array!95349 (arr!46032 (Array (_ BitVec 32) (_ BitVec 64))) (size!46582 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95348)

(declare-datatypes ((SeekEntryResult!10349 0))(
  ( (MissingZero!10349 (index!43767 (_ BitVec 32))) (Found!10349 (index!43768 (_ BitVec 32))) (Intermediate!10349 (undefined!11161 Bool) (index!43769 (_ BitVec 32)) (x!125441 (_ BitVec 32))) (Undefined!10349) (MissingVacant!10349 (index!43770 (_ BitVec 32))) )
))
(declare-fun lt!612177 () SeekEntryResult!10349)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95348 (_ BitVec 32)) SeekEntryResult!10349)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393931 (= lt!612177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46032 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46032 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95349 (store (arr!46032 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46582 a!2901)) mask!2840))))

(declare-fun b!1393932 () Bool)

(declare-fun res!933339 () Bool)

(declare-fun e!789266 () Bool)

(assert (=> b!1393932 (=> (not res!933339) (not e!789266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393932 (= res!933339 (validKeyInArray!0 (select (arr!46032 a!2901) i!1037)))))

(declare-fun b!1393933 () Bool)

(declare-fun res!933345 () Bool)

(assert (=> b!1393933 (=> (not res!933345) (not e!789266))))

(assert (=> b!1393933 (= res!933345 (validKeyInArray!0 (select (arr!46032 a!2901) j!112)))))

(declare-fun b!1393934 () Bool)

(declare-fun res!933341 () Bool)

(assert (=> b!1393934 (=> (not res!933341) (not e!789266))))

(declare-datatypes ((List!32551 0))(
  ( (Nil!32548) (Cons!32547 (h!33780 (_ BitVec 64)) (t!47245 List!32551)) )
))
(declare-fun arrayNoDuplicates!0 (array!95348 (_ BitVec 32) List!32551) Bool)

(assert (=> b!1393934 (= res!933341 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32548))))

(declare-fun b!1393935 () Bool)

(declare-fun res!933343 () Bool)

(assert (=> b!1393935 (=> (not res!933343) (not e!789266))))

(assert (=> b!1393935 (= res!933343 (and (= (size!46582 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46582 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46582 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393936 () Bool)

(assert (=> b!1393936 (= e!789266 (not e!789265))))

(declare-fun res!933346 () Bool)

(assert (=> b!1393936 (=> res!933346 e!789265)))

(declare-fun lt!612176 () SeekEntryResult!10349)

(get-info :version)

(assert (=> b!1393936 (= res!933346 (or (not ((_ is Intermediate!10349) lt!612176)) (undefined!11161 lt!612176)))))

(declare-fun e!789264 () Bool)

(assert (=> b!1393936 e!789264))

(declare-fun res!933340 () Bool)

(assert (=> b!1393936 (=> (not res!933340) (not e!789264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95348 (_ BitVec 32)) Bool)

(assert (=> b!1393936 (= res!933340 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46702 0))(
  ( (Unit!46703) )
))
(declare-fun lt!612175 () Unit!46702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46702)

(assert (=> b!1393936 (= lt!612175 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393936 (= lt!612176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46032 a!2901) j!112) mask!2840) (select (arr!46032 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!933342 () Bool)

(assert (=> start!119666 (=> (not res!933342) (not e!789266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119666 (= res!933342 (validMask!0 mask!2840))))

(assert (=> start!119666 e!789266))

(assert (=> start!119666 true))

(declare-fun array_inv!35060 (array!95348) Bool)

(assert (=> start!119666 (array_inv!35060 a!2901)))

(declare-fun b!1393937 () Bool)

(declare-fun res!933344 () Bool)

(assert (=> b!1393937 (=> (not res!933344) (not e!789266))))

(assert (=> b!1393937 (= res!933344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393938 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95348 (_ BitVec 32)) SeekEntryResult!10349)

(assert (=> b!1393938 (= e!789264 (= (seekEntryOrOpen!0 (select (arr!46032 a!2901) j!112) a!2901 mask!2840) (Found!10349 j!112)))))

(assert (= (and start!119666 res!933342) b!1393935))

(assert (= (and b!1393935 res!933343) b!1393932))

(assert (= (and b!1393932 res!933339) b!1393933))

(assert (= (and b!1393933 res!933345) b!1393937))

(assert (= (and b!1393937 res!933344) b!1393934))

(assert (= (and b!1393934 res!933341) b!1393936))

(assert (= (and b!1393936 res!933340) b!1393938))

(assert (= (and b!1393936 (not res!933346)) b!1393931))

(declare-fun m!1280047 () Bool)

(assert (=> b!1393931 m!1280047))

(declare-fun m!1280049 () Bool)

(assert (=> b!1393931 m!1280049))

(assert (=> b!1393931 m!1280049))

(declare-fun m!1280051 () Bool)

(assert (=> b!1393931 m!1280051))

(assert (=> b!1393931 m!1280051))

(assert (=> b!1393931 m!1280049))

(declare-fun m!1280053 () Bool)

(assert (=> b!1393931 m!1280053))

(declare-fun m!1280055 () Bool)

(assert (=> b!1393938 m!1280055))

(assert (=> b!1393938 m!1280055))

(declare-fun m!1280057 () Bool)

(assert (=> b!1393938 m!1280057))

(declare-fun m!1280059 () Bool)

(assert (=> b!1393934 m!1280059))

(declare-fun m!1280061 () Bool)

(assert (=> b!1393937 m!1280061))

(declare-fun m!1280063 () Bool)

(assert (=> b!1393932 m!1280063))

(assert (=> b!1393932 m!1280063))

(declare-fun m!1280065 () Bool)

(assert (=> b!1393932 m!1280065))

(declare-fun m!1280067 () Bool)

(assert (=> start!119666 m!1280067))

(declare-fun m!1280069 () Bool)

(assert (=> start!119666 m!1280069))

(assert (=> b!1393936 m!1280055))

(declare-fun m!1280071 () Bool)

(assert (=> b!1393936 m!1280071))

(assert (=> b!1393936 m!1280055))

(declare-fun m!1280073 () Bool)

(assert (=> b!1393936 m!1280073))

(assert (=> b!1393936 m!1280071))

(assert (=> b!1393936 m!1280055))

(declare-fun m!1280075 () Bool)

(assert (=> b!1393936 m!1280075))

(declare-fun m!1280077 () Bool)

(assert (=> b!1393936 m!1280077))

(assert (=> b!1393933 m!1280055))

(assert (=> b!1393933 m!1280055))

(declare-fun m!1280079 () Bool)

(assert (=> b!1393933 m!1280079))

(check-sat (not b!1393934) (not b!1393938) (not start!119666) (not b!1393933) (not b!1393931) (not b!1393936) (not b!1393932) (not b!1393937))
