; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131464 () Bool)

(assert start!131464)

(declare-fun b!1540027 () Bool)

(declare-fun res!1055540 () Bool)

(declare-fun e!857212 () Bool)

(assert (=> b!1540027 (=> (not res!1055540) (not e!857212))))

(declare-datatypes ((array!102266 0))(
  ( (array!102267 (arr!49341 (Array (_ BitVec 32) (_ BitVec 64))) (size!49892 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102266)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102266 (_ BitVec 32)) Bool)

(assert (=> b!1540027 (= res!1055540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540028 () Bool)

(declare-fun res!1055538 () Bool)

(assert (=> b!1540028 (=> (not res!1055538) (not e!857212))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540028 (= res!1055538 (validKeyInArray!0 (select (arr!49341 a!2792) i!951)))))

(declare-fun b!1540029 () Bool)

(declare-fun res!1055541 () Bool)

(assert (=> b!1540029 (=> (not res!1055541) (not e!857212))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1540029 (= res!1055541 (validKeyInArray!0 (select (arr!49341 a!2792) j!64)))))

(declare-fun b!1540030 () Bool)

(declare-fun res!1055539 () Bool)

(assert (=> b!1540030 (=> (not res!1055539) (not e!857212))))

(assert (=> b!1540030 (= res!1055539 (and (= (size!49892 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49892 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49892 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1055537 () Bool)

(assert (=> start!131464 (=> (not res!1055537) (not e!857212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131464 (= res!1055537 (validMask!0 mask!2480))))

(assert (=> start!131464 e!857212))

(assert (=> start!131464 true))

(declare-fun array_inv!38622 (array!102266) Bool)

(assert (=> start!131464 (array_inv!38622 a!2792)))

(declare-fun b!1540031 () Bool)

(assert (=> b!1540031 (= e!857212 false)))

(declare-fun lt!665667 () Bool)

(declare-datatypes ((List!35802 0))(
  ( (Nil!35799) (Cons!35798 (h!37261 (_ BitVec 64)) (t!50488 List!35802)) )
))
(declare-fun arrayNoDuplicates!0 (array!102266 (_ BitVec 32) List!35802) Bool)

(assert (=> b!1540031 (= lt!665667 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35799))))

(assert (= (and start!131464 res!1055537) b!1540030))

(assert (= (and b!1540030 res!1055539) b!1540028))

(assert (= (and b!1540028 res!1055538) b!1540029))

(assert (= (and b!1540029 res!1055541) b!1540027))

(assert (= (and b!1540027 res!1055540) b!1540031))

(declare-fun m!1422351 () Bool)

(assert (=> b!1540029 m!1422351))

(assert (=> b!1540029 m!1422351))

(declare-fun m!1422353 () Bool)

(assert (=> b!1540029 m!1422353))

(declare-fun m!1422355 () Bool)

(assert (=> b!1540031 m!1422355))

(declare-fun m!1422357 () Bool)

(assert (=> start!131464 m!1422357))

(declare-fun m!1422359 () Bool)

(assert (=> start!131464 m!1422359))

(declare-fun m!1422361 () Bool)

(assert (=> b!1540028 m!1422361))

(assert (=> b!1540028 m!1422361))

(declare-fun m!1422363 () Bool)

(assert (=> b!1540028 m!1422363))

(declare-fun m!1422365 () Bool)

(assert (=> b!1540027 m!1422365))

(push 1)

(assert (not b!1540028))

(assert (not b!1540027))

(assert (not b!1540029))

(assert (not start!131464))

(assert (not b!1540031))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

