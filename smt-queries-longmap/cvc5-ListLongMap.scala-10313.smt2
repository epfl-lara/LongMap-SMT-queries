; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121200 () Bool)

(assert start!121200)

(declare-fun res!946969 () Bool)

(declare-fun e!797498 () Bool)

(assert (=> start!121200 (=> (not res!946969) (not e!797498))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121200 (= res!946969 (validMask!0 mask!2840))))

(assert (=> start!121200 e!797498))

(assert (=> start!121200 true))

(declare-datatypes ((array!96354 0))(
  ( (array!96355 (arr!46520 (Array (_ BitVec 32) (_ BitVec 64))) (size!47070 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96354)

(declare-fun array_inv!35548 (array!96354) Bool)

(assert (=> start!121200 (array_inv!35548 a!2901)))

(declare-fun b!1409246 () Bool)

(declare-fun e!797501 () Bool)

(assert (=> b!1409246 (= e!797501 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10831 0))(
  ( (MissingZero!10831 (index!45701 (_ BitVec 32))) (Found!10831 (index!45702 (_ BitVec 32))) (Intermediate!10831 (undefined!11643 Bool) (index!45703 (_ BitVec 32)) (x!127296 (_ BitVec 32))) (Undefined!10831) (MissingVacant!10831 (index!45704 (_ BitVec 32))) )
))
(declare-fun lt!620652 () SeekEntryResult!10831)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96354 (_ BitVec 32)) SeekEntryResult!10831)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409246 (= lt!620652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46520 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46520 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96355 (store (arr!46520 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47070 a!2901)) mask!2840))))

(declare-fun b!1409247 () Bool)

(declare-fun res!946974 () Bool)

(assert (=> b!1409247 (=> (not res!946974) (not e!797498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409247 (= res!946974 (validKeyInArray!0 (select (arr!46520 a!2901) j!112)))))

(declare-fun b!1409248 () Bool)

(declare-fun e!797500 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96354 (_ BitVec 32)) SeekEntryResult!10831)

(assert (=> b!1409248 (= e!797500 (= (seekEntryOrOpen!0 (select (arr!46520 a!2901) j!112) a!2901 mask!2840) (Found!10831 j!112)))))

(declare-fun b!1409249 () Bool)

(declare-fun res!946975 () Bool)

(assert (=> b!1409249 (=> (not res!946975) (not e!797498))))

(assert (=> b!1409249 (= res!946975 (validKeyInArray!0 (select (arr!46520 a!2901) i!1037)))))

(declare-fun b!1409250 () Bool)

(declare-fun res!946968 () Bool)

(assert (=> b!1409250 (=> (not res!946968) (not e!797498))))

(assert (=> b!1409250 (= res!946968 (and (= (size!47070 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47070 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47070 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409251 () Bool)

(assert (=> b!1409251 (= e!797498 (not e!797501))))

(declare-fun res!946973 () Bool)

(assert (=> b!1409251 (=> res!946973 e!797501)))

(declare-fun lt!620651 () SeekEntryResult!10831)

(assert (=> b!1409251 (= res!946973 (or (not (is-Intermediate!10831 lt!620651)) (undefined!11643 lt!620651)))))

(assert (=> b!1409251 e!797500))

(declare-fun res!946972 () Bool)

(assert (=> b!1409251 (=> (not res!946972) (not e!797500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96354 (_ BitVec 32)) Bool)

(assert (=> b!1409251 (= res!946972 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47636 0))(
  ( (Unit!47637) )
))
(declare-fun lt!620650 () Unit!47636)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47636)

(assert (=> b!1409251 (= lt!620650 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409251 (= lt!620651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46520 a!2901) j!112) mask!2840) (select (arr!46520 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409252 () Bool)

(declare-fun res!946970 () Bool)

(assert (=> b!1409252 (=> (not res!946970) (not e!797498))))

(declare-datatypes ((List!33039 0))(
  ( (Nil!33036) (Cons!33035 (h!34298 (_ BitVec 64)) (t!47733 List!33039)) )
))
(declare-fun arrayNoDuplicates!0 (array!96354 (_ BitVec 32) List!33039) Bool)

(assert (=> b!1409252 (= res!946970 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33036))))

(declare-fun b!1409253 () Bool)

(declare-fun res!946971 () Bool)

(assert (=> b!1409253 (=> (not res!946971) (not e!797498))))

(assert (=> b!1409253 (= res!946971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121200 res!946969) b!1409250))

(assert (= (and b!1409250 res!946968) b!1409249))

(assert (= (and b!1409249 res!946975) b!1409247))

(assert (= (and b!1409247 res!946974) b!1409253))

(assert (= (and b!1409253 res!946971) b!1409252))

(assert (= (and b!1409252 res!946970) b!1409251))

(assert (= (and b!1409251 res!946972) b!1409248))

(assert (= (and b!1409251 (not res!946973)) b!1409246))

(declare-fun m!1298883 () Bool)

(assert (=> b!1409251 m!1298883))

(declare-fun m!1298885 () Bool)

(assert (=> b!1409251 m!1298885))

(assert (=> b!1409251 m!1298883))

(declare-fun m!1298887 () Bool)

(assert (=> b!1409251 m!1298887))

(assert (=> b!1409251 m!1298885))

(assert (=> b!1409251 m!1298883))

(declare-fun m!1298889 () Bool)

(assert (=> b!1409251 m!1298889))

(declare-fun m!1298891 () Bool)

(assert (=> b!1409251 m!1298891))

(declare-fun m!1298893 () Bool)

(assert (=> b!1409249 m!1298893))

(assert (=> b!1409249 m!1298893))

(declare-fun m!1298895 () Bool)

(assert (=> b!1409249 m!1298895))

(assert (=> b!1409247 m!1298883))

(assert (=> b!1409247 m!1298883))

(declare-fun m!1298897 () Bool)

(assert (=> b!1409247 m!1298897))

(declare-fun m!1298899 () Bool)

(assert (=> b!1409253 m!1298899))

(declare-fun m!1298901 () Bool)

(assert (=> b!1409252 m!1298901))

(declare-fun m!1298903 () Bool)

(assert (=> start!121200 m!1298903))

(declare-fun m!1298905 () Bool)

(assert (=> start!121200 m!1298905))

(declare-fun m!1298907 () Bool)

(assert (=> b!1409246 m!1298907))

(declare-fun m!1298909 () Bool)

(assert (=> b!1409246 m!1298909))

(assert (=> b!1409246 m!1298909))

(declare-fun m!1298911 () Bool)

(assert (=> b!1409246 m!1298911))

(assert (=> b!1409246 m!1298911))

(assert (=> b!1409246 m!1298909))

(declare-fun m!1298913 () Bool)

(assert (=> b!1409246 m!1298913))

(assert (=> b!1409248 m!1298883))

(assert (=> b!1409248 m!1298883))

(declare-fun m!1298915 () Bool)

(assert (=> b!1409248 m!1298915))

(push 1)

(assert (not b!1409251))

(assert (not b!1409246))

(assert (not b!1409249))

(assert (not b!1409247))

(assert (not b!1409252))

(assert (not start!121200))

(assert (not b!1409248))

(assert (not b!1409253))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

