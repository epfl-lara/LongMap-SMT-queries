; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119136 () Bool)

(assert start!119136)

(declare-fun res!929990 () Bool)

(declare-fun e!787171 () Bool)

(assert (=> start!119136 (=> (not res!929990) (not e!787171))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119136 (= res!929990 (validMask!0 mask!2840))))

(assert (=> start!119136 e!787171))

(assert (=> start!119136 true))

(declare-datatypes ((array!95073 0))(
  ( (array!95074 (arr!45902 (Array (_ BitVec 32) (_ BitVec 64))) (size!46452 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95073)

(declare-fun array_inv!34930 (array!95073) Bool)

(assert (=> start!119136 (array_inv!34930 a!2901)))

(declare-fun b!1389829 () Bool)

(declare-fun res!929994 () Bool)

(assert (=> b!1389829 (=> (not res!929994) (not e!787171))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389829 (= res!929994 (validKeyInArray!0 (select (arr!45902 a!2901) j!112)))))

(declare-fun b!1389830 () Bool)

(assert (=> b!1389830 (= e!787171 (not (bvsge mask!2840 #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95073 (_ BitVec 32)) Bool)

(assert (=> b!1389830 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46442 0))(
  ( (Unit!46443) )
))
(declare-fun lt!610644 () Unit!46442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46442)

(assert (=> b!1389830 (= lt!610644 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10219 0))(
  ( (MissingZero!10219 (index!43247 (_ BitVec 32))) (Found!10219 (index!43248 (_ BitVec 32))) (Intermediate!10219 (undefined!11031 Bool) (index!43249 (_ BitVec 32)) (x!124937 (_ BitVec 32))) (Undefined!10219) (MissingVacant!10219 (index!43250 (_ BitVec 32))) )
))
(declare-fun lt!610643 () SeekEntryResult!10219)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95073 (_ BitVec 32)) SeekEntryResult!10219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389830 (= lt!610643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45902 a!2901) j!112) mask!2840) (select (arr!45902 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389831 () Bool)

(declare-fun res!929992 () Bool)

(assert (=> b!1389831 (=> (not res!929992) (not e!787171))))

(declare-datatypes ((List!32421 0))(
  ( (Nil!32418) (Cons!32417 (h!33635 (_ BitVec 64)) (t!47115 List!32421)) )
))
(declare-fun arrayNoDuplicates!0 (array!95073 (_ BitVec 32) List!32421) Bool)

(assert (=> b!1389831 (= res!929992 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32418))))

(declare-fun b!1389832 () Bool)

(declare-fun res!929993 () Bool)

(assert (=> b!1389832 (=> (not res!929993) (not e!787171))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389832 (= res!929993 (validKeyInArray!0 (select (arr!45902 a!2901) i!1037)))))

(declare-fun b!1389833 () Bool)

(declare-fun res!929995 () Bool)

(assert (=> b!1389833 (=> (not res!929995) (not e!787171))))

(assert (=> b!1389833 (= res!929995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389834 () Bool)

(declare-fun res!929991 () Bool)

(assert (=> b!1389834 (=> (not res!929991) (not e!787171))))

(assert (=> b!1389834 (= res!929991 (and (= (size!46452 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46452 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46452 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119136 res!929990) b!1389834))

(assert (= (and b!1389834 res!929991) b!1389832))

(assert (= (and b!1389832 res!929993) b!1389829))

(assert (= (and b!1389829 res!929994) b!1389833))

(assert (= (and b!1389833 res!929995) b!1389831))

(assert (= (and b!1389831 res!929992) b!1389830))

(declare-fun m!1275519 () Bool)

(assert (=> b!1389833 m!1275519))

(declare-fun m!1275521 () Bool)

(assert (=> b!1389831 m!1275521))

(declare-fun m!1275523 () Bool)

(assert (=> start!119136 m!1275523))

(declare-fun m!1275525 () Bool)

(assert (=> start!119136 m!1275525))

(declare-fun m!1275527 () Bool)

(assert (=> b!1389830 m!1275527))

(declare-fun m!1275529 () Bool)

(assert (=> b!1389830 m!1275529))

(assert (=> b!1389830 m!1275527))

(declare-fun m!1275531 () Bool)

(assert (=> b!1389830 m!1275531))

(assert (=> b!1389830 m!1275529))

(assert (=> b!1389830 m!1275527))

(declare-fun m!1275533 () Bool)

(assert (=> b!1389830 m!1275533))

(declare-fun m!1275535 () Bool)

(assert (=> b!1389830 m!1275535))

(assert (=> b!1389829 m!1275527))

(assert (=> b!1389829 m!1275527))

(declare-fun m!1275537 () Bool)

(assert (=> b!1389829 m!1275537))

(declare-fun m!1275539 () Bool)

(assert (=> b!1389832 m!1275539))

(assert (=> b!1389832 m!1275539))

(declare-fun m!1275541 () Bool)

(assert (=> b!1389832 m!1275541))

(push 1)

(assert (not b!1389829))

(assert (not start!119136))

(assert (not b!1389831))

(assert (not b!1389830))

(assert (not b!1389833))

(assert (not b!1389832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

