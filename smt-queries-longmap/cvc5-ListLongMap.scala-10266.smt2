; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120756 () Bool)

(assert start!120756)

(declare-fun b!1405095 () Bool)

(declare-fun res!943313 () Bool)

(declare-fun e!795410 () Bool)

(assert (=> b!1405095 (=> (not res!943313) (not e!795410))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96063 0))(
  ( (array!96064 (arr!46379 (Array (_ BitVec 32) (_ BitVec 64))) (size!46929 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96063)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405095 (= res!943313 (and (= (size!46929 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46929 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46929 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405096 () Bool)

(declare-fun res!943314 () Bool)

(assert (=> b!1405096 (=> (not res!943314) (not e!795410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405096 (= res!943314 (validKeyInArray!0 (select (arr!46379 a!2901) i!1037)))))

(declare-fun b!1405097 () Bool)

(declare-fun res!943315 () Bool)

(assert (=> b!1405097 (=> (not res!943315) (not e!795410))))

(declare-datatypes ((List!32898 0))(
  ( (Nil!32895) (Cons!32894 (h!34148 (_ BitVec 64)) (t!47592 List!32898)) )
))
(declare-fun arrayNoDuplicates!0 (array!96063 (_ BitVec 32) List!32898) Bool)

(assert (=> b!1405097 (= res!943315 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32895))))

(declare-fun b!1405098 () Bool)

(declare-fun res!943317 () Bool)

(assert (=> b!1405098 (=> (not res!943317) (not e!795410))))

(assert (=> b!1405098 (= res!943317 (validKeyInArray!0 (select (arr!46379 a!2901) j!112)))))

(declare-fun b!1405099 () Bool)

(declare-fun e!795409 () Bool)

(declare-datatypes ((SeekEntryResult!10690 0))(
  ( (MissingZero!10690 (index!45137 (_ BitVec 32))) (Found!10690 (index!45138 (_ BitVec 32))) (Intermediate!10690 (undefined!11502 Bool) (index!45139 (_ BitVec 32)) (x!126761 (_ BitVec 32))) (Undefined!10690) (MissingVacant!10690 (index!45140 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96063 (_ BitVec 32)) SeekEntryResult!10690)

(assert (=> b!1405099 (= e!795409 (= (seekEntryOrOpen!0 (select (arr!46379 a!2901) j!112) a!2901 mask!2840) (Found!10690 j!112)))))

(declare-fun b!1405100 () Bool)

(assert (=> b!1405100 (= e!795410 (not true))))

(assert (=> b!1405100 e!795409))

(declare-fun res!943312 () Bool)

(assert (=> b!1405100 (=> (not res!943312) (not e!795409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96063 (_ BitVec 32)) Bool)

(assert (=> b!1405100 (= res!943312 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47354 0))(
  ( (Unit!47355) )
))
(declare-fun lt!618930 () Unit!47354)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96063 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47354)

(assert (=> b!1405100 (= lt!618930 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618929 () SeekEntryResult!10690)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96063 (_ BitVec 32)) SeekEntryResult!10690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405100 (= lt!618929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46379 a!2901) j!112) mask!2840) (select (arr!46379 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!943318 () Bool)

(assert (=> start!120756 (=> (not res!943318) (not e!795410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120756 (= res!943318 (validMask!0 mask!2840))))

(assert (=> start!120756 e!795410))

(assert (=> start!120756 true))

(declare-fun array_inv!35407 (array!96063) Bool)

(assert (=> start!120756 (array_inv!35407 a!2901)))

(declare-fun b!1405101 () Bool)

(declare-fun res!943316 () Bool)

(assert (=> b!1405101 (=> (not res!943316) (not e!795410))))

(assert (=> b!1405101 (= res!943316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120756 res!943318) b!1405095))

(assert (= (and b!1405095 res!943313) b!1405096))

(assert (= (and b!1405096 res!943314) b!1405098))

(assert (= (and b!1405098 res!943317) b!1405101))

(assert (= (and b!1405101 res!943316) b!1405097))

(assert (= (and b!1405097 res!943315) b!1405100))

(assert (= (and b!1405100 res!943312) b!1405099))

(declare-fun m!1293795 () Bool)

(assert (=> b!1405097 m!1293795))

(declare-fun m!1293797 () Bool)

(assert (=> b!1405101 m!1293797))

(declare-fun m!1293799 () Bool)

(assert (=> b!1405098 m!1293799))

(assert (=> b!1405098 m!1293799))

(declare-fun m!1293801 () Bool)

(assert (=> b!1405098 m!1293801))

(assert (=> b!1405099 m!1293799))

(assert (=> b!1405099 m!1293799))

(declare-fun m!1293803 () Bool)

(assert (=> b!1405099 m!1293803))

(assert (=> b!1405100 m!1293799))

(declare-fun m!1293805 () Bool)

(assert (=> b!1405100 m!1293805))

(assert (=> b!1405100 m!1293799))

(declare-fun m!1293807 () Bool)

(assert (=> b!1405100 m!1293807))

(assert (=> b!1405100 m!1293805))

(assert (=> b!1405100 m!1293799))

(declare-fun m!1293809 () Bool)

(assert (=> b!1405100 m!1293809))

(declare-fun m!1293811 () Bool)

(assert (=> b!1405100 m!1293811))

(declare-fun m!1293813 () Bool)

(assert (=> start!120756 m!1293813))

(declare-fun m!1293815 () Bool)

(assert (=> start!120756 m!1293815))

(declare-fun m!1293817 () Bool)

(assert (=> b!1405096 m!1293817))

(assert (=> b!1405096 m!1293817))

(declare-fun m!1293819 () Bool)

(assert (=> b!1405096 m!1293819))

(push 1)

(assert (not b!1405100))

(assert (not b!1405097))

(assert (not b!1405098))

(assert (not b!1405099))

(assert (not b!1405096))

(assert (not start!120756))

(assert (not b!1405101))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

