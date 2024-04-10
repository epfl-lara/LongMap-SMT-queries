; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119280 () Bool)

(assert start!119280)

(declare-fun b!1390977 () Bool)

(declare-fun res!930993 () Bool)

(declare-fun e!787696 () Bool)

(assert (=> b!1390977 (=> (not res!930993) (not e!787696))))

(declare-datatypes ((array!95166 0))(
  ( (array!95167 (arr!45947 (Array (_ BitVec 32) (_ BitVec 64))) (size!46497 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95166)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390977 (= res!930993 (validKeyInArray!0 (select (arr!45947 a!2901) j!112)))))

(declare-fun b!1390978 () Bool)

(assert (=> b!1390978 (= e!787696 (not true))))

(declare-fun e!787697 () Bool)

(assert (=> b!1390978 e!787697))

(declare-fun res!930997 () Bool)

(assert (=> b!1390978 (=> (not res!930997) (not e!787697))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95166 (_ BitVec 32)) Bool)

(assert (=> b!1390978 (= res!930997 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46532 0))(
  ( (Unit!46533) )
))
(declare-fun lt!611021 () Unit!46532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46532)

(assert (=> b!1390978 (= lt!611021 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10264 0))(
  ( (MissingZero!10264 (index!43427 (_ BitVec 32))) (Found!10264 (index!43428 (_ BitVec 32))) (Intermediate!10264 (undefined!11076 Bool) (index!43429 (_ BitVec 32)) (x!125108 (_ BitVec 32))) (Undefined!10264) (MissingVacant!10264 (index!43430 (_ BitVec 32))) )
))
(declare-fun lt!611022 () SeekEntryResult!10264)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95166 (_ BitVec 32)) SeekEntryResult!10264)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390978 (= lt!611022 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45947 a!2901) j!112) mask!2840) (select (arr!45947 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390979 () Bool)

(declare-fun res!930996 () Bool)

(assert (=> b!1390979 (=> (not res!930996) (not e!787696))))

(declare-datatypes ((List!32466 0))(
  ( (Nil!32463) (Cons!32462 (h!33683 (_ BitVec 64)) (t!47160 List!32466)) )
))
(declare-fun arrayNoDuplicates!0 (array!95166 (_ BitVec 32) List!32466) Bool)

(assert (=> b!1390979 (= res!930996 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32463))))

(declare-fun b!1390980 () Bool)

(declare-fun res!930991 () Bool)

(assert (=> b!1390980 (=> (not res!930991) (not e!787696))))

(assert (=> b!1390980 (= res!930991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930994 () Bool)

(assert (=> start!119280 (=> (not res!930994) (not e!787696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119280 (= res!930994 (validMask!0 mask!2840))))

(assert (=> start!119280 e!787696))

(assert (=> start!119280 true))

(declare-fun array_inv!34975 (array!95166) Bool)

(assert (=> start!119280 (array_inv!34975 a!2901)))

(declare-fun b!1390981 () Bool)

(declare-fun res!930995 () Bool)

(assert (=> b!1390981 (=> (not res!930995) (not e!787696))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390981 (= res!930995 (validKeyInArray!0 (select (arr!45947 a!2901) i!1037)))))

(declare-fun b!1390982 () Bool)

(declare-fun res!930992 () Bool)

(assert (=> b!1390982 (=> (not res!930992) (not e!787696))))

(assert (=> b!1390982 (= res!930992 (and (= (size!46497 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46497 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46497 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390983 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95166 (_ BitVec 32)) SeekEntryResult!10264)

(assert (=> b!1390983 (= e!787697 (= (seekEntryOrOpen!0 (select (arr!45947 a!2901) j!112) a!2901 mask!2840) (Found!10264 j!112)))))

(assert (= (and start!119280 res!930994) b!1390982))

(assert (= (and b!1390982 res!930992) b!1390981))

(assert (= (and b!1390981 res!930995) b!1390977))

(assert (= (and b!1390977 res!930993) b!1390980))

(assert (= (and b!1390980 res!930991) b!1390979))

(assert (= (and b!1390979 res!930996) b!1390978))

(assert (= (and b!1390978 res!930997) b!1390983))

(declare-fun m!1276797 () Bool)

(assert (=> b!1390979 m!1276797))

(declare-fun m!1276799 () Bool)

(assert (=> b!1390977 m!1276799))

(assert (=> b!1390977 m!1276799))

(declare-fun m!1276801 () Bool)

(assert (=> b!1390977 m!1276801))

(declare-fun m!1276803 () Bool)

(assert (=> b!1390981 m!1276803))

(assert (=> b!1390981 m!1276803))

(declare-fun m!1276805 () Bool)

(assert (=> b!1390981 m!1276805))

(assert (=> b!1390978 m!1276799))

(declare-fun m!1276807 () Bool)

(assert (=> b!1390978 m!1276807))

(assert (=> b!1390978 m!1276799))

(declare-fun m!1276809 () Bool)

(assert (=> b!1390978 m!1276809))

(assert (=> b!1390978 m!1276807))

(assert (=> b!1390978 m!1276799))

(declare-fun m!1276811 () Bool)

(assert (=> b!1390978 m!1276811))

(declare-fun m!1276813 () Bool)

(assert (=> b!1390978 m!1276813))

(assert (=> b!1390983 m!1276799))

(assert (=> b!1390983 m!1276799))

(declare-fun m!1276815 () Bool)

(assert (=> b!1390983 m!1276815))

(declare-fun m!1276817 () Bool)

(assert (=> b!1390980 m!1276817))

(declare-fun m!1276819 () Bool)

(assert (=> start!119280 m!1276819))

(declare-fun m!1276821 () Bool)

(assert (=> start!119280 m!1276821))

(push 1)

(assert (not b!1390983))

(assert (not b!1390977))

(assert (not b!1390981))

(assert (not start!119280))

(assert (not b!1390980))

(assert (not b!1390978))

(assert (not b!1390979))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

