; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120580 () Bool)

(assert start!120580)

(declare-fun b!1404015 () Bool)

(declare-fun e!794896 () Bool)

(assert (=> b!1404015 (= e!794896 (not true))))

(declare-fun e!794895 () Bool)

(assert (=> b!1404015 e!794895))

(declare-fun res!942532 () Bool)

(assert (=> b!1404015 (=> (not res!942532) (not e!794895))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95989 0))(
  ( (array!95990 (arr!46345 (Array (_ BitVec 32) (_ BitVec 64))) (size!46895 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95989)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95989 (_ BitVec 32)) Bool)

(assert (=> b!1404015 (= res!942532 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47328 0))(
  ( (Unit!47329) )
))
(declare-fun lt!618572 () Unit!47328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47328)

(assert (=> b!1404015 (= lt!618572 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10662 0))(
  ( (MissingZero!10662 (index!45025 (_ BitVec 32))) (Found!10662 (index!45026 (_ BitVec 32))) (Intermediate!10662 (undefined!11474 Bool) (index!45027 (_ BitVec 32)) (x!126625 (_ BitVec 32))) (Undefined!10662) (MissingVacant!10662 (index!45028 (_ BitVec 32))) )
))
(declare-fun lt!618573 () SeekEntryResult!10662)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95989 (_ BitVec 32)) SeekEntryResult!10662)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404015 (= lt!618573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46345 a!2901) j!112) mask!2840) (select (arr!46345 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404016 () Bool)

(declare-fun res!942526 () Bool)

(assert (=> b!1404016 (=> (not res!942526) (not e!794896))))

(assert (=> b!1404016 (= res!942526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942530 () Bool)

(assert (=> start!120580 (=> (not res!942530) (not e!794896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120580 (= res!942530 (validMask!0 mask!2840))))

(assert (=> start!120580 e!794896))

(assert (=> start!120580 true))

(declare-fun array_inv!35373 (array!95989) Bool)

(assert (=> start!120580 (array_inv!35373 a!2901)))

(declare-fun b!1404017 () Bool)

(declare-fun res!942528 () Bool)

(assert (=> b!1404017 (=> (not res!942528) (not e!794896))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404017 (= res!942528 (validKeyInArray!0 (select (arr!46345 a!2901) i!1037)))))

(declare-fun b!1404018 () Bool)

(declare-fun res!942531 () Bool)

(assert (=> b!1404018 (=> (not res!942531) (not e!794896))))

(assert (=> b!1404018 (= res!942531 (validKeyInArray!0 (select (arr!46345 a!2901) j!112)))))

(declare-fun b!1404019 () Bool)

(declare-fun res!942529 () Bool)

(assert (=> b!1404019 (=> (not res!942529) (not e!794896))))

(declare-datatypes ((List!32864 0))(
  ( (Nil!32861) (Cons!32860 (h!34108 (_ BitVec 64)) (t!47558 List!32864)) )
))
(declare-fun arrayNoDuplicates!0 (array!95989 (_ BitVec 32) List!32864) Bool)

(assert (=> b!1404019 (= res!942529 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32861))))

(declare-fun b!1404020 () Bool)

(declare-fun res!942527 () Bool)

(assert (=> b!1404020 (=> (not res!942527) (not e!794896))))

(assert (=> b!1404020 (= res!942527 (and (= (size!46895 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46895 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46895 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404021 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95989 (_ BitVec 32)) SeekEntryResult!10662)

(assert (=> b!1404021 (= e!794895 (= (seekEntryOrOpen!0 (select (arr!46345 a!2901) j!112) a!2901 mask!2840) (Found!10662 j!112)))))

(assert (= (and start!120580 res!942530) b!1404020))

(assert (= (and b!1404020 res!942527) b!1404017))

(assert (= (and b!1404017 res!942528) b!1404018))

(assert (= (and b!1404018 res!942531) b!1404016))

(assert (= (and b!1404016 res!942526) b!1404019))

(assert (= (and b!1404019 res!942529) b!1404015))

(assert (= (and b!1404015 res!942532) b!1404021))

(declare-fun m!1292809 () Bool)

(assert (=> b!1404018 m!1292809))

(assert (=> b!1404018 m!1292809))

(declare-fun m!1292811 () Bool)

(assert (=> b!1404018 m!1292811))

(assert (=> b!1404015 m!1292809))

(declare-fun m!1292813 () Bool)

(assert (=> b!1404015 m!1292813))

(assert (=> b!1404015 m!1292809))

(declare-fun m!1292815 () Bool)

(assert (=> b!1404015 m!1292815))

(assert (=> b!1404015 m!1292813))

(assert (=> b!1404015 m!1292809))

(declare-fun m!1292817 () Bool)

(assert (=> b!1404015 m!1292817))

(declare-fun m!1292819 () Bool)

(assert (=> b!1404015 m!1292819))

(declare-fun m!1292821 () Bool)

(assert (=> b!1404016 m!1292821))

(declare-fun m!1292823 () Bool)

(assert (=> b!1404019 m!1292823))

(assert (=> b!1404021 m!1292809))

(assert (=> b!1404021 m!1292809))

(declare-fun m!1292825 () Bool)

(assert (=> b!1404021 m!1292825))

(declare-fun m!1292827 () Bool)

(assert (=> b!1404017 m!1292827))

(assert (=> b!1404017 m!1292827))

(declare-fun m!1292829 () Bool)

(assert (=> b!1404017 m!1292829))

(declare-fun m!1292831 () Bool)

(assert (=> start!120580 m!1292831))

(declare-fun m!1292833 () Bool)

(assert (=> start!120580 m!1292833))

(push 1)

(assert (not b!1404017))

(assert (not b!1404016))

(assert (not b!1404018))

(assert (not b!1404019))

(assert (not start!120580))

(assert (not b!1404015))

(assert (not b!1404021))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

