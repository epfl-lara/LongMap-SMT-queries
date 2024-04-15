; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127752 () Bool)

(assert start!127752)

(declare-fun b!1501566 () Bool)

(declare-fun res!1022832 () Bool)

(declare-fun e!839898 () Bool)

(assert (=> b!1501566 (=> (not res!1022832) (not e!839898))))

(declare-datatypes ((array!100127 0))(
  ( (array!100128 (arr!48324 (Array (_ BitVec 32) (_ BitVec 64))) (size!48876 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100127)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501566 (= res!1022832 (validKeyInArray!0 (select (arr!48324 a!2850) j!87)))))

(declare-fun b!1501567 () Bool)

(declare-fun res!1022830 () Bool)

(assert (=> b!1501567 (=> (not res!1022830) (not e!839898))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501567 (= res!1022830 (and (= (size!48876 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48876 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48876 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1022834 () Bool)

(assert (=> start!127752 (=> (not res!1022834) (not e!839898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127752 (= res!1022834 (validMask!0 mask!2661))))

(assert (=> start!127752 e!839898))

(assert (=> start!127752 true))

(declare-fun array_inv!37557 (array!100127) Bool)

(assert (=> start!127752 (array_inv!37557 a!2850)))

(declare-fun b!1501568 () Bool)

(assert (=> b!1501568 (= e!839898 false)))

(declare-fun lt!653002 () Bool)

(declare-datatypes ((List!34894 0))(
  ( (Nil!34891) (Cons!34890 (h!36288 (_ BitVec 64)) (t!49580 List!34894)) )
))
(declare-fun arrayNoDuplicates!0 (array!100127 (_ BitVec 32) List!34894) Bool)

(assert (=> b!1501568 (= lt!653002 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34891))))

(declare-fun b!1501569 () Bool)

(declare-fun res!1022833 () Bool)

(assert (=> b!1501569 (=> (not res!1022833) (not e!839898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100127 (_ BitVec 32)) Bool)

(assert (=> b!1501569 (= res!1022833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501570 () Bool)

(declare-fun res!1022831 () Bool)

(assert (=> b!1501570 (=> (not res!1022831) (not e!839898))))

(assert (=> b!1501570 (= res!1022831 (validKeyInArray!0 (select (arr!48324 a!2850) i!996)))))

(assert (= (and start!127752 res!1022834) b!1501567))

(assert (= (and b!1501567 res!1022830) b!1501570))

(assert (= (and b!1501570 res!1022831) b!1501566))

(assert (= (and b!1501566 res!1022832) b!1501569))

(assert (= (and b!1501569 res!1022833) b!1501568))

(declare-fun m!1384293 () Bool)

(assert (=> b!1501569 m!1384293))

(declare-fun m!1384295 () Bool)

(assert (=> b!1501570 m!1384295))

(assert (=> b!1501570 m!1384295))

(declare-fun m!1384297 () Bool)

(assert (=> b!1501570 m!1384297))

(declare-fun m!1384299 () Bool)

(assert (=> b!1501568 m!1384299))

(declare-fun m!1384301 () Bool)

(assert (=> start!127752 m!1384301))

(declare-fun m!1384303 () Bool)

(assert (=> start!127752 m!1384303))

(declare-fun m!1384305 () Bool)

(assert (=> b!1501566 m!1384305))

(assert (=> b!1501566 m!1384305))

(declare-fun m!1384307 () Bool)

(assert (=> b!1501566 m!1384307))

(push 1)

(assert (not b!1501569))

(assert (not b!1501570))

(assert (not b!1501568))

(assert (not start!127752))

(assert (not b!1501566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

