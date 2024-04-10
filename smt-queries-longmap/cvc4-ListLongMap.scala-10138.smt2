; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119596 () Bool)

(assert start!119596)

(declare-fun b!1393091 () Bool)

(declare-fun res!932504 () Bool)

(declare-fun e!788844 () Bool)

(assert (=> b!1393091 (=> (not res!932504) (not e!788844))))

(declare-datatypes ((array!95278 0))(
  ( (array!95279 (arr!45997 (Array (_ BitVec 32) (_ BitVec 64))) (size!46547 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95278)

(declare-datatypes ((List!32516 0))(
  ( (Nil!32513) (Cons!32512 (h!33745 (_ BitVec 64)) (t!47210 List!32516)) )
))
(declare-fun arrayNoDuplicates!0 (array!95278 (_ BitVec 32) List!32516) Bool)

(assert (=> b!1393091 (= res!932504 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32513))))

(declare-fun b!1393092 () Bool)

(declare-fun e!788846 () Bool)

(assert (=> b!1393092 (= e!788844 (not e!788846))))

(declare-fun res!932502 () Bool)

(assert (=> b!1393092 (=> res!932502 e!788846)))

(declare-datatypes ((SeekEntryResult!10314 0))(
  ( (MissingZero!10314 (index!43627 (_ BitVec 32))) (Found!10314 (index!43628 (_ BitVec 32))) (Intermediate!10314 (undefined!11126 Bool) (index!43629 (_ BitVec 32)) (x!125310 (_ BitVec 32))) (Undefined!10314) (MissingVacant!10314 (index!43630 (_ BitVec 32))) )
))
(declare-fun lt!611860 () SeekEntryResult!10314)

(assert (=> b!1393092 (= res!932502 (or (not (is-Intermediate!10314 lt!611860)) (undefined!11126 lt!611860)))))

(declare-fun e!788845 () Bool)

(assert (=> b!1393092 e!788845))

(declare-fun res!932500 () Bool)

(assert (=> b!1393092 (=> (not res!932500) (not e!788845))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95278 (_ BitVec 32)) Bool)

(assert (=> b!1393092 (= res!932500 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46632 0))(
  ( (Unit!46633) )
))
(declare-fun lt!611861 () Unit!46632)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46632)

(assert (=> b!1393092 (= lt!611861 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95278 (_ BitVec 32)) SeekEntryResult!10314)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393092 (= lt!611860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45997 a!2901) j!112) mask!2840) (select (arr!45997 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393093 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95278 (_ BitVec 32)) SeekEntryResult!10314)

(assert (=> b!1393093 (= e!788845 (= (seekEntryOrOpen!0 (select (arr!45997 a!2901) j!112) a!2901 mask!2840) (Found!10314 j!112)))))

(declare-fun b!1393094 () Bool)

(assert (=> b!1393094 (= e!788846 true)))

(declare-fun lt!611862 () SeekEntryResult!10314)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393094 (= lt!611862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45997 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45997 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95279 (store (arr!45997 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46547 a!2901)) mask!2840))))

(declare-fun b!1393095 () Bool)

(declare-fun res!932499 () Bool)

(assert (=> b!1393095 (=> (not res!932499) (not e!788844))))

(assert (=> b!1393095 (= res!932499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393096 () Bool)

(declare-fun res!932505 () Bool)

(assert (=> b!1393096 (=> (not res!932505) (not e!788844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393096 (= res!932505 (validKeyInArray!0 (select (arr!45997 a!2901) j!112)))))

(declare-fun res!932503 () Bool)

(assert (=> start!119596 (=> (not res!932503) (not e!788844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119596 (= res!932503 (validMask!0 mask!2840))))

(assert (=> start!119596 e!788844))

(assert (=> start!119596 true))

(declare-fun array_inv!35025 (array!95278) Bool)

(assert (=> start!119596 (array_inv!35025 a!2901)))

(declare-fun b!1393097 () Bool)

(declare-fun res!932506 () Bool)

(assert (=> b!1393097 (=> (not res!932506) (not e!788844))))

(assert (=> b!1393097 (= res!932506 (validKeyInArray!0 (select (arr!45997 a!2901) i!1037)))))

(declare-fun b!1393098 () Bool)

(declare-fun res!932501 () Bool)

(assert (=> b!1393098 (=> (not res!932501) (not e!788844))))

(assert (=> b!1393098 (= res!932501 (and (= (size!46547 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46547 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46547 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119596 res!932503) b!1393098))

(assert (= (and b!1393098 res!932501) b!1393097))

(assert (= (and b!1393097 res!932506) b!1393096))

(assert (= (and b!1393096 res!932505) b!1393095))

(assert (= (and b!1393095 res!932499) b!1393091))

(assert (= (and b!1393091 res!932504) b!1393092))

(assert (= (and b!1393092 res!932500) b!1393093))

(assert (= (and b!1393092 (not res!932502)) b!1393094))

(declare-fun m!1278857 () Bool)

(assert (=> b!1393091 m!1278857))

(declare-fun m!1278859 () Bool)

(assert (=> b!1393092 m!1278859))

(declare-fun m!1278861 () Bool)

(assert (=> b!1393092 m!1278861))

(assert (=> b!1393092 m!1278859))

(declare-fun m!1278863 () Bool)

(assert (=> b!1393092 m!1278863))

(assert (=> b!1393092 m!1278861))

(assert (=> b!1393092 m!1278859))

(declare-fun m!1278865 () Bool)

(assert (=> b!1393092 m!1278865))

(declare-fun m!1278867 () Bool)

(assert (=> b!1393092 m!1278867))

(declare-fun m!1278869 () Bool)

(assert (=> start!119596 m!1278869))

(declare-fun m!1278871 () Bool)

(assert (=> start!119596 m!1278871))

(assert (=> b!1393093 m!1278859))

(assert (=> b!1393093 m!1278859))

(declare-fun m!1278873 () Bool)

(assert (=> b!1393093 m!1278873))

(declare-fun m!1278875 () Bool)

(assert (=> b!1393097 m!1278875))

(assert (=> b!1393097 m!1278875))

(declare-fun m!1278877 () Bool)

(assert (=> b!1393097 m!1278877))

(assert (=> b!1393096 m!1278859))

(assert (=> b!1393096 m!1278859))

(declare-fun m!1278879 () Bool)

(assert (=> b!1393096 m!1278879))

(declare-fun m!1278881 () Bool)

(assert (=> b!1393094 m!1278881))

(declare-fun m!1278883 () Bool)

(assert (=> b!1393094 m!1278883))

(assert (=> b!1393094 m!1278883))

(declare-fun m!1278885 () Bool)

(assert (=> b!1393094 m!1278885))

(assert (=> b!1393094 m!1278885))

(assert (=> b!1393094 m!1278883))

(declare-fun m!1278887 () Bool)

(assert (=> b!1393094 m!1278887))

(declare-fun m!1278889 () Bool)

(assert (=> b!1393095 m!1278889))

(push 1)

(assert (not b!1393094))

(assert (not b!1393092))

(assert (not b!1393093))

(assert (not b!1393097))

(assert (not start!119596))

(assert (not b!1393095))

(assert (not b!1393091))

(assert (not b!1393096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

