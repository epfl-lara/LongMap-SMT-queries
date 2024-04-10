; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119884 () Bool)

(assert start!119884)

(declare-fun b!1395878 () Bool)

(declare-fun res!934962 () Bool)

(declare-fun e!790261 () Bool)

(assert (=> b!1395878 (=> (not res!934962) (not e!790261))))

(declare-datatypes ((array!95464 0))(
  ( (array!95465 (arr!46087 (Array (_ BitVec 32) (_ BitVec 64))) (size!46637 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95464)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395878 (= res!934962 (validKeyInArray!0 (select (arr!46087 a!2901) j!112)))))

(declare-fun b!1395879 () Bool)

(declare-fun res!934960 () Bool)

(assert (=> b!1395879 (=> (not res!934960) (not e!790261))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95464 (_ BitVec 32)) Bool)

(assert (=> b!1395879 (= res!934960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395880 () Bool)

(declare-fun res!934961 () Bool)

(assert (=> b!1395880 (=> (not res!934961) (not e!790261))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395880 (= res!934961 (and (= (size!46637 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46637 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46637 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395881 () Bool)

(declare-fun res!934958 () Bool)

(assert (=> b!1395881 (=> (not res!934958) (not e!790261))))

(assert (=> b!1395881 (= res!934958 (validKeyInArray!0 (select (arr!46087 a!2901) i!1037)))))

(declare-fun b!1395883 () Bool)

(declare-fun res!934963 () Bool)

(assert (=> b!1395883 (=> (not res!934963) (not e!790261))))

(declare-datatypes ((List!32606 0))(
  ( (Nil!32603) (Cons!32602 (h!33841 (_ BitVec 64)) (t!47300 List!32606)) )
))
(declare-fun arrayNoDuplicates!0 (array!95464 (_ BitVec 32) List!32606) Bool)

(assert (=> b!1395883 (= res!934963 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32603))))

(declare-fun b!1395884 () Bool)

(declare-fun e!790262 () Bool)

(assert (=> b!1395884 (= e!790262 true)))

(declare-datatypes ((SeekEntryResult!10404 0))(
  ( (MissingZero!10404 (index!43987 (_ BitVec 32))) (Found!10404 (index!43988 (_ BitVec 32))) (Intermediate!10404 (undefined!11216 Bool) (index!43989 (_ BitVec 32)) (x!125652 (_ BitVec 32))) (Undefined!10404) (MissingVacant!10404 (index!43990 (_ BitVec 32))) )
))
(declare-fun lt!613171 () SeekEntryResult!10404)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95464 (_ BitVec 32)) SeekEntryResult!10404)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395884 (= lt!613171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46087 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46087 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95465 (store (arr!46087 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46637 a!2901)) mask!2840))))

(declare-fun b!1395885 () Bool)

(declare-fun e!790260 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95464 (_ BitVec 32)) SeekEntryResult!10404)

(assert (=> b!1395885 (= e!790260 (= (seekEntryOrOpen!0 (select (arr!46087 a!2901) j!112) a!2901 mask!2840) (Found!10404 j!112)))))

(declare-fun res!934959 () Bool)

(assert (=> start!119884 (=> (not res!934959) (not e!790261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119884 (= res!934959 (validMask!0 mask!2840))))

(assert (=> start!119884 e!790261))

(assert (=> start!119884 true))

(declare-fun array_inv!35115 (array!95464) Bool)

(assert (=> start!119884 (array_inv!35115 a!2901)))

(declare-fun b!1395882 () Bool)

(assert (=> b!1395882 (= e!790261 (not e!790262))))

(declare-fun res!934957 () Bool)

(assert (=> b!1395882 (=> res!934957 e!790262)))

(declare-fun lt!613172 () SeekEntryResult!10404)

(assert (=> b!1395882 (= res!934957 (or (not (is-Intermediate!10404 lt!613172)) (undefined!11216 lt!613172)))))

(assert (=> b!1395882 e!790260))

(declare-fun res!934956 () Bool)

(assert (=> b!1395882 (=> (not res!934956) (not e!790260))))

(assert (=> b!1395882 (= res!934956 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46812 0))(
  ( (Unit!46813) )
))
(declare-fun lt!613173 () Unit!46812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46812)

(assert (=> b!1395882 (= lt!613173 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395882 (= lt!613172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46087 a!2901) j!112) mask!2840) (select (arr!46087 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119884 res!934959) b!1395880))

(assert (= (and b!1395880 res!934961) b!1395881))

(assert (= (and b!1395881 res!934958) b!1395878))

(assert (= (and b!1395878 res!934962) b!1395879))

(assert (= (and b!1395879 res!934960) b!1395883))

(assert (= (and b!1395883 res!934963) b!1395882))

(assert (= (and b!1395882 res!934956) b!1395885))

(assert (= (and b!1395882 (not res!934957)) b!1395884))

(declare-fun m!1282319 () Bool)

(assert (=> b!1395882 m!1282319))

(declare-fun m!1282321 () Bool)

(assert (=> b!1395882 m!1282321))

(assert (=> b!1395882 m!1282319))

(declare-fun m!1282323 () Bool)

(assert (=> b!1395882 m!1282323))

(assert (=> b!1395882 m!1282321))

(assert (=> b!1395882 m!1282319))

(declare-fun m!1282325 () Bool)

(assert (=> b!1395882 m!1282325))

(declare-fun m!1282327 () Bool)

(assert (=> b!1395882 m!1282327))

(declare-fun m!1282329 () Bool)

(assert (=> b!1395884 m!1282329))

(declare-fun m!1282331 () Bool)

(assert (=> b!1395884 m!1282331))

(assert (=> b!1395884 m!1282331))

(declare-fun m!1282333 () Bool)

(assert (=> b!1395884 m!1282333))

(assert (=> b!1395884 m!1282333))

(assert (=> b!1395884 m!1282331))

(declare-fun m!1282335 () Bool)

(assert (=> b!1395884 m!1282335))

(declare-fun m!1282337 () Bool)

(assert (=> b!1395883 m!1282337))

(assert (=> b!1395885 m!1282319))

(assert (=> b!1395885 m!1282319))

(declare-fun m!1282339 () Bool)

(assert (=> b!1395885 m!1282339))

(declare-fun m!1282341 () Bool)

(assert (=> start!119884 m!1282341))

(declare-fun m!1282343 () Bool)

(assert (=> start!119884 m!1282343))

(declare-fun m!1282345 () Bool)

(assert (=> b!1395879 m!1282345))

(assert (=> b!1395878 m!1282319))

(assert (=> b!1395878 m!1282319))

(declare-fun m!1282347 () Bool)

(assert (=> b!1395878 m!1282347))

(declare-fun m!1282349 () Bool)

(assert (=> b!1395881 m!1282349))

(assert (=> b!1395881 m!1282349))

(declare-fun m!1282351 () Bool)

(assert (=> b!1395881 m!1282351))

(push 1)

(assert (not b!1395884))

(assert (not b!1395882))

(assert (not b!1395879))

(assert (not b!1395885))

(assert (not start!119884))

(assert (not b!1395881))

(assert (not b!1395878))

(assert (not b!1395883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

