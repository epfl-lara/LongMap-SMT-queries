; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119634 () Bool)

(assert start!119634)

(declare-fun b!1393547 () Bool)

(declare-fun res!932959 () Bool)

(declare-fun e!789071 () Bool)

(assert (=> b!1393547 (=> (not res!932959) (not e!789071))))

(declare-datatypes ((array!95316 0))(
  ( (array!95317 (arr!46016 (Array (_ BitVec 32) (_ BitVec 64))) (size!46566 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95316)

(declare-datatypes ((List!32535 0))(
  ( (Nil!32532) (Cons!32531 (h!33764 (_ BitVec 64)) (t!47229 List!32535)) )
))
(declare-fun arrayNoDuplicates!0 (array!95316 (_ BitVec 32) List!32535) Bool)

(assert (=> b!1393547 (= res!932959 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32532))))

(declare-fun b!1393548 () Bool)

(declare-fun res!932957 () Bool)

(assert (=> b!1393548 (=> (not res!932957) (not e!789071))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95316 (_ BitVec 32)) Bool)

(assert (=> b!1393548 (= res!932957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393549 () Bool)

(declare-fun res!932960 () Bool)

(assert (=> b!1393549 (=> (not res!932960) (not e!789071))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393549 (= res!932960 (validKeyInArray!0 (select (arr!46016 a!2901) i!1037)))))

(declare-fun b!1393550 () Bool)

(declare-fun res!932961 () Bool)

(assert (=> b!1393550 (=> (not res!932961) (not e!789071))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393550 (= res!932961 (validKeyInArray!0 (select (arr!46016 a!2901) j!112)))))

(declare-fun b!1393551 () Bool)

(declare-fun e!789074 () Bool)

(assert (=> b!1393551 (= e!789074 true)))

(declare-datatypes ((SeekEntryResult!10333 0))(
  ( (MissingZero!10333 (index!43703 (_ BitVec 32))) (Found!10333 (index!43704 (_ BitVec 32))) (Intermediate!10333 (undefined!11145 Bool) (index!43705 (_ BitVec 32)) (x!125385 (_ BitVec 32))) (Undefined!10333) (MissingVacant!10333 (index!43706 (_ BitVec 32))) )
))
(declare-fun lt!612031 () SeekEntryResult!10333)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95316 (_ BitVec 32)) SeekEntryResult!10333)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393551 (= lt!612031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46016 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46016 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95317 (store (arr!46016 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46566 a!2901)) mask!2840))))

(declare-fun b!1393552 () Bool)

(assert (=> b!1393552 (= e!789071 (not e!789074))))

(declare-fun res!932962 () Bool)

(assert (=> b!1393552 (=> res!932962 e!789074)))

(declare-fun lt!612033 () SeekEntryResult!10333)

(assert (=> b!1393552 (= res!932962 (or (not (is-Intermediate!10333 lt!612033)) (undefined!11145 lt!612033)))))

(declare-fun e!789072 () Bool)

(assert (=> b!1393552 e!789072))

(declare-fun res!932955 () Bool)

(assert (=> b!1393552 (=> (not res!932955) (not e!789072))))

(assert (=> b!1393552 (= res!932955 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46670 0))(
  ( (Unit!46671) )
))
(declare-fun lt!612032 () Unit!46670)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46670)

(assert (=> b!1393552 (= lt!612032 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393552 (= lt!612033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46016 a!2901) j!112) mask!2840) (select (arr!46016 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932958 () Bool)

(assert (=> start!119634 (=> (not res!932958) (not e!789071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119634 (= res!932958 (validMask!0 mask!2840))))

(assert (=> start!119634 e!789071))

(assert (=> start!119634 true))

(declare-fun array_inv!35044 (array!95316) Bool)

(assert (=> start!119634 (array_inv!35044 a!2901)))

(declare-fun b!1393553 () Bool)

(declare-fun res!932956 () Bool)

(assert (=> b!1393553 (=> (not res!932956) (not e!789071))))

(assert (=> b!1393553 (= res!932956 (and (= (size!46566 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46566 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46566 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393554 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95316 (_ BitVec 32)) SeekEntryResult!10333)

(assert (=> b!1393554 (= e!789072 (= (seekEntryOrOpen!0 (select (arr!46016 a!2901) j!112) a!2901 mask!2840) (Found!10333 j!112)))))

(assert (= (and start!119634 res!932958) b!1393553))

(assert (= (and b!1393553 res!932956) b!1393549))

(assert (= (and b!1393549 res!932960) b!1393550))

(assert (= (and b!1393550 res!932961) b!1393548))

(assert (= (and b!1393548 res!932957) b!1393547))

(assert (= (and b!1393547 res!932959) b!1393552))

(assert (= (and b!1393552 res!932955) b!1393554))

(assert (= (and b!1393552 (not res!932962)) b!1393551))

(declare-fun m!1279503 () Bool)

(assert (=> b!1393551 m!1279503))

(declare-fun m!1279505 () Bool)

(assert (=> b!1393551 m!1279505))

(assert (=> b!1393551 m!1279505))

(declare-fun m!1279507 () Bool)

(assert (=> b!1393551 m!1279507))

(assert (=> b!1393551 m!1279507))

(assert (=> b!1393551 m!1279505))

(declare-fun m!1279509 () Bool)

(assert (=> b!1393551 m!1279509))

(declare-fun m!1279511 () Bool)

(assert (=> start!119634 m!1279511))

(declare-fun m!1279513 () Bool)

(assert (=> start!119634 m!1279513))

(declare-fun m!1279515 () Bool)

(assert (=> b!1393552 m!1279515))

(declare-fun m!1279517 () Bool)

(assert (=> b!1393552 m!1279517))

(assert (=> b!1393552 m!1279515))

(declare-fun m!1279519 () Bool)

(assert (=> b!1393552 m!1279519))

(assert (=> b!1393552 m!1279517))

(assert (=> b!1393552 m!1279515))

(declare-fun m!1279521 () Bool)

(assert (=> b!1393552 m!1279521))

(declare-fun m!1279523 () Bool)

(assert (=> b!1393552 m!1279523))

(declare-fun m!1279525 () Bool)

(assert (=> b!1393549 m!1279525))

(assert (=> b!1393549 m!1279525))

(declare-fun m!1279527 () Bool)

(assert (=> b!1393549 m!1279527))

(assert (=> b!1393550 m!1279515))

(assert (=> b!1393550 m!1279515))

(declare-fun m!1279529 () Bool)

(assert (=> b!1393550 m!1279529))

(declare-fun m!1279531 () Bool)

(assert (=> b!1393547 m!1279531))

(assert (=> b!1393554 m!1279515))

(assert (=> b!1393554 m!1279515))

(declare-fun m!1279533 () Bool)

(assert (=> b!1393554 m!1279533))

(declare-fun m!1279535 () Bool)

(assert (=> b!1393548 m!1279535))

(push 1)

(assert (not start!119634))

(assert (not b!1393554))

(assert (not b!1393552))

(assert (not b!1393548))

(assert (not b!1393547))

(assert (not b!1393549))

(assert (not b!1393551))

(assert (not b!1393550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

