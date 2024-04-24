; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131458 () Bool)

(assert start!131458)

(declare-fun b!1539982 () Bool)

(declare-fun res!1055495 () Bool)

(declare-fun e!857193 () Bool)

(assert (=> b!1539982 (=> (not res!1055495) (not e!857193))))

(declare-datatypes ((array!102260 0))(
  ( (array!102261 (arr!49338 (Array (_ BitVec 32) (_ BitVec 64))) (size!49889 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102260)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102260 (_ BitVec 32)) Bool)

(assert (=> b!1539982 (= res!1055495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539983 () Bool)

(assert (=> b!1539983 (= e!857193 false)))

(declare-fun lt!665658 () Bool)

(declare-datatypes ((List!35799 0))(
  ( (Nil!35796) (Cons!35795 (h!37258 (_ BitVec 64)) (t!50485 List!35799)) )
))
(declare-fun arrayNoDuplicates!0 (array!102260 (_ BitVec 32) List!35799) Bool)

(assert (=> b!1539983 (= lt!665658 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35796))))

(declare-fun b!1539984 () Bool)

(declare-fun res!1055496 () Bool)

(assert (=> b!1539984 (=> (not res!1055496) (not e!857193))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539984 (= res!1055496 (and (= (size!49889 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49889 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49889 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539985 () Bool)

(declare-fun res!1055492 () Bool)

(assert (=> b!1539985 (=> (not res!1055492) (not e!857193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539985 (= res!1055492 (validKeyInArray!0 (select (arr!49338 a!2792) j!64)))))

(declare-fun res!1055493 () Bool)

(assert (=> start!131458 (=> (not res!1055493) (not e!857193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131458 (= res!1055493 (validMask!0 mask!2480))))

(assert (=> start!131458 e!857193))

(assert (=> start!131458 true))

(declare-fun array_inv!38619 (array!102260) Bool)

(assert (=> start!131458 (array_inv!38619 a!2792)))

(declare-fun b!1539986 () Bool)

(declare-fun res!1055494 () Bool)

(assert (=> b!1539986 (=> (not res!1055494) (not e!857193))))

(assert (=> b!1539986 (= res!1055494 (validKeyInArray!0 (select (arr!49338 a!2792) i!951)))))

(assert (= (and start!131458 res!1055493) b!1539984))

(assert (= (and b!1539984 res!1055496) b!1539986))

(assert (= (and b!1539986 res!1055494) b!1539985))

(assert (= (and b!1539985 res!1055492) b!1539982))

(assert (= (and b!1539982 res!1055495) b!1539983))

(declare-fun m!1422303 () Bool)

(assert (=> b!1539983 m!1422303))

(declare-fun m!1422305 () Bool)

(assert (=> start!131458 m!1422305))

(declare-fun m!1422307 () Bool)

(assert (=> start!131458 m!1422307))

(declare-fun m!1422309 () Bool)

(assert (=> b!1539985 m!1422309))

(assert (=> b!1539985 m!1422309))

(declare-fun m!1422311 () Bool)

(assert (=> b!1539985 m!1422311))

(declare-fun m!1422313 () Bool)

(assert (=> b!1539982 m!1422313))

(declare-fun m!1422315 () Bool)

(assert (=> b!1539986 m!1422315))

(assert (=> b!1539986 m!1422315))

(declare-fun m!1422317 () Bool)

(assert (=> b!1539986 m!1422317))

(push 1)

(assert (not b!1539986))

(assert (not b!1539982))

(assert (not start!131458))

(assert (not b!1539985))

(assert (not b!1539983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

