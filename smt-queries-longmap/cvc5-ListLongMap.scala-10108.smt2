; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119334 () Bool)

(assert start!119334)

(declare-fun b!1391059 () Bool)

(declare-fun res!930537 () Bool)

(declare-fun e!787939 () Bool)

(assert (=> b!1391059 (=> (not res!930537) (not e!787939))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95193 0))(
  ( (array!95194 (arr!45960 (Array (_ BitVec 32) (_ BitVec 64))) (size!46511 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95193)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391059 (= res!930537 (and (= (size!46511 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46511 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46511 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391060 () Bool)

(declare-fun res!930540 () Bool)

(assert (=> b!1391060 (=> (not res!930540) (not e!787939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391060 (= res!930540 (validKeyInArray!0 (select (arr!45960 a!2901) i!1037)))))

(declare-fun b!1391061 () Bool)

(declare-fun res!930541 () Bool)

(assert (=> b!1391061 (=> (not res!930541) (not e!787939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95193 (_ BitVec 32)) Bool)

(assert (=> b!1391061 (= res!930541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391062 () Bool)

(declare-fun res!930536 () Bool)

(assert (=> b!1391062 (=> (not res!930536) (not e!787939))))

(assert (=> b!1391062 (= res!930536 (validKeyInArray!0 (select (arr!45960 a!2901) j!112)))))

(declare-fun res!930539 () Bool)

(assert (=> start!119334 (=> (not res!930539) (not e!787939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119334 (= res!930539 (validMask!0 mask!2840))))

(assert (=> start!119334 e!787939))

(assert (=> start!119334 true))

(declare-fun array_inv!35241 (array!95193) Bool)

(assert (=> start!119334 (array_inv!35241 a!2901)))

(declare-fun b!1391063 () Bool)

(declare-fun res!930538 () Bool)

(assert (=> b!1391063 (=> (not res!930538) (not e!787939))))

(declare-datatypes ((List!32466 0))(
  ( (Nil!32463) (Cons!32462 (h!33688 (_ BitVec 64)) (t!47152 List!32466)) )
))
(declare-fun arrayNoDuplicates!0 (array!95193 (_ BitVec 32) List!32466) Bool)

(assert (=> b!1391063 (= res!930538 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32463))))

(declare-fun b!1391064 () Bool)

(assert (=> b!1391064 (= e!787939 (not true))))

(assert (=> b!1391064 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46391 0))(
  ( (Unit!46392) )
))
(declare-fun lt!611072 () Unit!46391)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46391)

(assert (=> b!1391064 (= lt!611072 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10180 0))(
  ( (MissingZero!10180 (index!43091 (_ BitVec 32))) (Found!10180 (index!43092 (_ BitVec 32))) (Intermediate!10180 (undefined!10992 Bool) (index!43093 (_ BitVec 32)) (x!124925 (_ BitVec 32))) (Undefined!10180) (MissingVacant!10180 (index!43094 (_ BitVec 32))) )
))
(declare-fun lt!611071 () SeekEntryResult!10180)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95193 (_ BitVec 32)) SeekEntryResult!10180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391064 (= lt!611071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45960 a!2901) j!112) mask!2840) (select (arr!45960 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119334 res!930539) b!1391059))

(assert (= (and b!1391059 res!930537) b!1391060))

(assert (= (and b!1391060 res!930540) b!1391062))

(assert (= (and b!1391062 res!930536) b!1391061))

(assert (= (and b!1391061 res!930541) b!1391063))

(assert (= (and b!1391063 res!930538) b!1391064))

(declare-fun m!1277011 () Bool)

(assert (=> b!1391060 m!1277011))

(assert (=> b!1391060 m!1277011))

(declare-fun m!1277013 () Bool)

(assert (=> b!1391060 m!1277013))

(declare-fun m!1277015 () Bool)

(assert (=> start!119334 m!1277015))

(declare-fun m!1277017 () Bool)

(assert (=> start!119334 m!1277017))

(declare-fun m!1277019 () Bool)

(assert (=> b!1391063 m!1277019))

(declare-fun m!1277021 () Bool)

(assert (=> b!1391062 m!1277021))

(assert (=> b!1391062 m!1277021))

(declare-fun m!1277023 () Bool)

(assert (=> b!1391062 m!1277023))

(declare-fun m!1277025 () Bool)

(assert (=> b!1391061 m!1277025))

(assert (=> b!1391064 m!1277021))

(declare-fun m!1277027 () Bool)

(assert (=> b!1391064 m!1277027))

(assert (=> b!1391064 m!1277021))

(declare-fun m!1277029 () Bool)

(assert (=> b!1391064 m!1277029))

(assert (=> b!1391064 m!1277027))

(assert (=> b!1391064 m!1277021))

(declare-fun m!1277031 () Bool)

(assert (=> b!1391064 m!1277031))

(declare-fun m!1277033 () Bool)

(assert (=> b!1391064 m!1277033))

(push 1)

(assert (not start!119334))

(assert (not b!1391063))

(assert (not b!1391064))

(assert (not b!1391062))

(assert (not b!1391061))

(assert (not b!1391060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

