; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131062 () Bool)

(assert start!131062)

(declare-fun b!1535059 () Bool)

(declare-fun e!855438 () Bool)

(assert (=> b!1535059 (= e!855438 false)))

(declare-fun lt!664614 () Bool)

(declare-datatypes ((array!101897 0))(
  ( (array!101898 (arr!49158 (Array (_ BitVec 32) (_ BitVec 64))) (size!49709 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101897)

(declare-datatypes ((List!35619 0))(
  ( (Nil!35616) (Cons!35615 (h!37078 (_ BitVec 64)) (t!50305 List!35619)) )
))
(declare-fun arrayNoDuplicates!0 (array!101897 (_ BitVec 32) List!35619) Bool)

(assert (=> b!1535059 (= lt!664614 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35616))))

(declare-fun b!1535060 () Bool)

(declare-fun res!1050659 () Bool)

(assert (=> b!1535060 (=> (not res!1050659) (not e!855438))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101897 (_ BitVec 32)) Bool)

(assert (=> b!1535060 (= res!1050659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1050661 () Bool)

(assert (=> start!131062 (=> (not res!1050661) (not e!855438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131062 (= res!1050661 (validMask!0 mask!2480))))

(assert (=> start!131062 e!855438))

(assert (=> start!131062 true))

(declare-fun array_inv!38439 (array!101897) Bool)

(assert (=> start!131062 (array_inv!38439 a!2792)))

(declare-fun b!1535061 () Bool)

(declare-fun res!1050662 () Bool)

(assert (=> b!1535061 (=> (not res!1050662) (not e!855438))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535061 (= res!1050662 (validKeyInArray!0 (select (arr!49158 a!2792) i!951)))))

(declare-fun b!1535062 () Bool)

(declare-fun res!1050663 () Bool)

(assert (=> b!1535062 (=> (not res!1050663) (not e!855438))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1535062 (= res!1050663 (and (= (size!49709 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49709 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49709 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535063 () Bool)

(declare-fun res!1050660 () Bool)

(assert (=> b!1535063 (=> (not res!1050660) (not e!855438))))

(assert (=> b!1535063 (= res!1050660 (validKeyInArray!0 (select (arr!49158 a!2792) j!64)))))

(assert (= (and start!131062 res!1050661) b!1535062))

(assert (= (and b!1535062 res!1050663) b!1535061))

(assert (= (and b!1535061 res!1050662) b!1535063))

(assert (= (and b!1535063 res!1050660) b!1535060))

(assert (= (and b!1535060 res!1050659) b!1535059))

(declare-fun m!1417629 () Bool)

(assert (=> b!1535059 m!1417629))

(declare-fun m!1417631 () Bool)

(assert (=> b!1535063 m!1417631))

(assert (=> b!1535063 m!1417631))

(declare-fun m!1417633 () Bool)

(assert (=> b!1535063 m!1417633))

(declare-fun m!1417635 () Bool)

(assert (=> start!131062 m!1417635))

(declare-fun m!1417637 () Bool)

(assert (=> start!131062 m!1417637))

(declare-fun m!1417639 () Bool)

(assert (=> b!1535060 m!1417639))

(declare-fun m!1417641 () Bool)

(assert (=> b!1535061 m!1417641))

(assert (=> b!1535061 m!1417641))

(declare-fun m!1417643 () Bool)

(assert (=> b!1535061 m!1417643))

(push 1)

(assert (not b!1535060))

(assert (not b!1535059))

(assert (not b!1535061))

(assert (not b!1535063))

(assert (not start!131062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

