; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119436 () Bool)

(assert start!119436)

(declare-fun res!931681 () Bool)

(declare-fun e!788220 () Bool)

(assert (=> start!119436 (=> (not res!931681) (not e!788220))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119436 (= res!931681 (validMask!0 mask!2840))))

(assert (=> start!119436 e!788220))

(assert (=> start!119436 true))

(declare-datatypes ((array!95220 0))(
  ( (array!95221 (arr!45971 (Array (_ BitVec 32) (_ BitVec 64))) (size!46521 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95220)

(declare-fun array_inv!34999 (array!95220) Bool)

(assert (=> start!119436 (array_inv!34999 a!2901)))

(declare-fun b!1391957 () Bool)

(declare-fun res!931683 () Bool)

(assert (=> b!1391957 (=> (not res!931683) (not e!788220))))

(declare-datatypes ((List!32490 0))(
  ( (Nil!32487) (Cons!32486 (h!33713 (_ BitVec 64)) (t!47184 List!32490)) )
))
(declare-fun arrayNoDuplicates!0 (array!95220 (_ BitVec 32) List!32490) Bool)

(assert (=> b!1391957 (= res!931683 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32487))))

(declare-fun b!1391958 () Bool)

(declare-fun res!931679 () Bool)

(assert (=> b!1391958 (=> (not res!931679) (not e!788220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95220 (_ BitVec 32)) Bool)

(assert (=> b!1391958 (= res!931679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!788219 () Bool)

(declare-fun b!1391959 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10288 0))(
  ( (MissingZero!10288 (index!43523 (_ BitVec 32))) (Found!10288 (index!43524 (_ BitVec 32))) (Intermediate!10288 (undefined!11100 Bool) (index!43525 (_ BitVec 32)) (x!125208 (_ BitVec 32))) (Undefined!10288) (MissingVacant!10288 (index!43526 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95220 (_ BitVec 32)) SeekEntryResult!10288)

(assert (=> b!1391959 (= e!788219 (= (seekEntryOrOpen!0 (select (arr!45971 a!2901) j!112) a!2901 mask!2840) (Found!10288 j!112)))))

(declare-fun b!1391960 () Bool)

(declare-fun res!931684 () Bool)

(assert (=> b!1391960 (=> (not res!931684) (not e!788220))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391960 (= res!931684 (and (= (size!46521 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46521 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46521 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391961 () Bool)

(declare-fun res!931682 () Bool)

(assert (=> b!1391961 (=> (not res!931682) (not e!788220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391961 (= res!931682 (validKeyInArray!0 (select (arr!45971 a!2901) j!112)))))

(declare-fun b!1391962 () Bool)

(declare-fun e!788222 () Bool)

(assert (=> b!1391962 (= e!788220 (not e!788222))))

(declare-fun res!931680 () Bool)

(assert (=> b!1391962 (=> res!931680 e!788222)))

(declare-fun lt!611410 () SeekEntryResult!10288)

(assert (=> b!1391962 (= res!931680 (or (not (is-Intermediate!10288 lt!611410)) (undefined!11100 lt!611410)))))

(assert (=> b!1391962 e!788219))

(declare-fun res!931678 () Bool)

(assert (=> b!1391962 (=> (not res!931678) (not e!788219))))

(assert (=> b!1391962 (= res!931678 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46580 0))(
  ( (Unit!46581) )
))
(declare-fun lt!611412 () Unit!46580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46580)

(assert (=> b!1391962 (= lt!611412 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95220 (_ BitVec 32)) SeekEntryResult!10288)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391962 (= lt!611410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45971 a!2901) j!112) mask!2840) (select (arr!45971 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391963 () Bool)

(assert (=> b!1391963 (= e!788222 true)))

(declare-fun lt!611411 () (_ BitVec 32))

(assert (=> b!1391963 (= lt!611411 (toIndex!0 (select (store (arr!45971 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1391964 () Bool)

(declare-fun res!931677 () Bool)

(assert (=> b!1391964 (=> (not res!931677) (not e!788220))))

(assert (=> b!1391964 (= res!931677 (validKeyInArray!0 (select (arr!45971 a!2901) i!1037)))))

(assert (= (and start!119436 res!931681) b!1391960))

(assert (= (and b!1391960 res!931684) b!1391964))

(assert (= (and b!1391964 res!931677) b!1391961))

(assert (= (and b!1391961 res!931682) b!1391958))

(assert (= (and b!1391958 res!931679) b!1391957))

(assert (= (and b!1391957 res!931683) b!1391962))

(assert (= (and b!1391962 res!931678) b!1391959))

(assert (= (and b!1391962 (not res!931680)) b!1391963))

(declare-fun m!1277715 () Bool)

(assert (=> b!1391963 m!1277715))

(declare-fun m!1277717 () Bool)

(assert (=> b!1391963 m!1277717))

(assert (=> b!1391963 m!1277717))

(declare-fun m!1277719 () Bool)

(assert (=> b!1391963 m!1277719))

(declare-fun m!1277721 () Bool)

(assert (=> b!1391957 m!1277721))

(declare-fun m!1277723 () Bool)

(assert (=> b!1391964 m!1277723))

(assert (=> b!1391964 m!1277723))

(declare-fun m!1277725 () Bool)

(assert (=> b!1391964 m!1277725))

(declare-fun m!1277727 () Bool)

(assert (=> start!119436 m!1277727))

(declare-fun m!1277729 () Bool)

(assert (=> start!119436 m!1277729))

(declare-fun m!1277731 () Bool)

(assert (=> b!1391958 m!1277731))

(declare-fun m!1277733 () Bool)

(assert (=> b!1391961 m!1277733))

(assert (=> b!1391961 m!1277733))

(declare-fun m!1277735 () Bool)

(assert (=> b!1391961 m!1277735))

(assert (=> b!1391962 m!1277733))

(declare-fun m!1277737 () Bool)

(assert (=> b!1391962 m!1277737))

(assert (=> b!1391962 m!1277733))

(declare-fun m!1277739 () Bool)

(assert (=> b!1391962 m!1277739))

(assert (=> b!1391962 m!1277737))

(assert (=> b!1391962 m!1277733))

(declare-fun m!1277741 () Bool)

(assert (=> b!1391962 m!1277741))

(declare-fun m!1277743 () Bool)

(assert (=> b!1391962 m!1277743))

(assert (=> b!1391959 m!1277733))

(assert (=> b!1391959 m!1277733))

(declare-fun m!1277745 () Bool)

(assert (=> b!1391959 m!1277745))

(push 1)

(assert (not start!119436))

(assert (not b!1391961))

(assert (not b!1391963))

(assert (not b!1391962))

(assert (not b!1391958))

(assert (not b!1391959))

(assert (not b!1391957))

(assert (not b!1391964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

