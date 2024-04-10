; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119188 () Bool)

(assert start!119188)

(declare-fun b!1390350 () Bool)

(declare-fun res!930512 () Bool)

(declare-fun e!787382 () Bool)

(assert (=> b!1390350 (=> (not res!930512) (not e!787382))))

(declare-datatypes ((array!95125 0))(
  ( (array!95126 (arr!45928 (Array (_ BitVec 32) (_ BitVec 64))) (size!46478 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95125)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390350 (= res!930512 (validKeyInArray!0 (select (arr!45928 a!2901) j!112)))))

(declare-fun b!1390351 () Bool)

(declare-fun res!930511 () Bool)

(assert (=> b!1390351 (=> (not res!930511) (not e!787382))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390351 (= res!930511 (validKeyInArray!0 (select (arr!45928 a!2901) i!1037)))))

(declare-fun b!1390352 () Bool)

(declare-fun res!930517 () Bool)

(assert (=> b!1390352 (=> (not res!930517) (not e!787382))))

(declare-datatypes ((List!32447 0))(
  ( (Nil!32444) (Cons!32443 (h!33661 (_ BitVec 64)) (t!47141 List!32447)) )
))
(declare-fun arrayNoDuplicates!0 (array!95125 (_ BitVec 32) List!32447) Bool)

(assert (=> b!1390352 (= res!930517 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32444))))

(declare-fun res!930513 () Bool)

(assert (=> start!119188 (=> (not res!930513) (not e!787382))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119188 (= res!930513 (validMask!0 mask!2840))))

(assert (=> start!119188 e!787382))

(assert (=> start!119188 true))

(declare-fun array_inv!34956 (array!95125) Bool)

(assert (=> start!119188 (array_inv!34956 a!2901)))

(declare-fun b!1390353 () Bool)

(declare-fun res!930516 () Bool)

(assert (=> b!1390353 (=> (not res!930516) (not e!787382))))

(assert (=> b!1390353 (= res!930516 (and (= (size!46478 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46478 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46478 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390354 () Bool)

(declare-fun e!787381 () Bool)

(declare-datatypes ((SeekEntryResult!10245 0))(
  ( (MissingZero!10245 (index!43351 (_ BitVec 32))) (Found!10245 (index!43352 (_ BitVec 32))) (Intermediate!10245 (undefined!11057 Bool) (index!43353 (_ BitVec 32)) (x!125027 (_ BitVec 32))) (Undefined!10245) (MissingVacant!10245 (index!43354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95125 (_ BitVec 32)) SeekEntryResult!10245)

(assert (=> b!1390354 (= e!787381 (= (seekEntryOrOpen!0 (select (arr!45928 a!2901) j!112) a!2901 mask!2840) (Found!10245 j!112)))))

(declare-fun b!1390355 () Bool)

(declare-fun res!930514 () Bool)

(assert (=> b!1390355 (=> (not res!930514) (not e!787382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95125 (_ BitVec 32)) Bool)

(assert (=> b!1390355 (= res!930514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390356 () Bool)

(assert (=> b!1390356 (= e!787382 (not true))))

(assert (=> b!1390356 e!787381))

(declare-fun res!930515 () Bool)

(assert (=> b!1390356 (=> (not res!930515) (not e!787381))))

(assert (=> b!1390356 (= res!930515 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46494 0))(
  ( (Unit!46495) )
))
(declare-fun lt!610799 () Unit!46494)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46494)

(assert (=> b!1390356 (= lt!610799 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610800 () SeekEntryResult!10245)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95125 (_ BitVec 32)) SeekEntryResult!10245)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390356 (= lt!610800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45928 a!2901) j!112) mask!2840) (select (arr!45928 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119188 res!930513) b!1390353))

(assert (= (and b!1390353 res!930516) b!1390351))

(assert (= (and b!1390351 res!930511) b!1390350))

(assert (= (and b!1390350 res!930512) b!1390355))

(assert (= (and b!1390355 res!930514) b!1390352))

(assert (= (and b!1390352 res!930517) b!1390356))

(assert (= (and b!1390356 res!930515) b!1390354))

(declare-fun m!1276177 () Bool)

(assert (=> b!1390351 m!1276177))

(assert (=> b!1390351 m!1276177))

(declare-fun m!1276179 () Bool)

(assert (=> b!1390351 m!1276179))

(declare-fun m!1276181 () Bool)

(assert (=> start!119188 m!1276181))

(declare-fun m!1276183 () Bool)

(assert (=> start!119188 m!1276183))

(declare-fun m!1276185 () Bool)

(assert (=> b!1390354 m!1276185))

(assert (=> b!1390354 m!1276185))

(declare-fun m!1276187 () Bool)

(assert (=> b!1390354 m!1276187))

(assert (=> b!1390356 m!1276185))

(declare-fun m!1276189 () Bool)

(assert (=> b!1390356 m!1276189))

(assert (=> b!1390356 m!1276185))

(declare-fun m!1276191 () Bool)

(assert (=> b!1390356 m!1276191))

(assert (=> b!1390356 m!1276189))

(assert (=> b!1390356 m!1276185))

(declare-fun m!1276193 () Bool)

(assert (=> b!1390356 m!1276193))

(declare-fun m!1276195 () Bool)

(assert (=> b!1390356 m!1276195))

(declare-fun m!1276197 () Bool)

(assert (=> b!1390352 m!1276197))

(declare-fun m!1276199 () Bool)

(assert (=> b!1390355 m!1276199))

(assert (=> b!1390350 m!1276185))

(assert (=> b!1390350 m!1276185))

(declare-fun m!1276201 () Bool)

(assert (=> b!1390350 m!1276201))

(push 1)

(assert (not b!1390354))

(assert (not b!1390352))

(assert (not b!1390350))

(assert (not b!1390351))

(assert (not start!119188))

(assert (not b!1390355))

(assert (not b!1390356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

