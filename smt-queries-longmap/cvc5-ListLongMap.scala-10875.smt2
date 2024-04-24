; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127784 () Bool)

(assert start!127784)

(declare-fun b!1499880 () Bool)

(declare-fun res!1019860 () Bool)

(declare-fun e!839985 () Bool)

(assert (=> b!1499880 (=> (not res!1019860) (not e!839985))))

(declare-datatypes ((array!100010 0))(
  ( (array!100011 (arr!48261 (Array (_ BitVec 32) (_ BitVec 64))) (size!48812 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100010)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499880 (= res!1019860 (validKeyInArray!0 (select (arr!48261 a!2850) i!996)))))

(declare-fun b!1499881 () Bool)

(declare-fun res!1019858 () Bool)

(assert (=> b!1499881 (=> (not res!1019858) (not e!839985))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499881 (= res!1019858 (validKeyInArray!0 (select (arr!48261 a!2850) j!87)))))

(declare-fun b!1499882 () Bool)

(declare-fun res!1019859 () Bool)

(assert (=> b!1499882 (=> (not res!1019859) (not e!839985))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100010 (_ BitVec 32)) Bool)

(assert (=> b!1499882 (= res!1019859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019857 () Bool)

(assert (=> start!127784 (=> (not res!1019857) (not e!839985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127784 (= res!1019857 (validMask!0 mask!2661))))

(assert (=> start!127784 e!839985))

(assert (=> start!127784 true))

(declare-fun array_inv!37542 (array!100010) Bool)

(assert (=> start!127784 (array_inv!37542 a!2850)))

(declare-fun b!1499883 () Bool)

(declare-fun res!1019861 () Bool)

(assert (=> b!1499883 (=> (not res!1019861) (not e!839985))))

(assert (=> b!1499883 (= res!1019861 (and (= (size!48812 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48812 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48812 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499884 () Bool)

(assert (=> b!1499884 (= e!839985 false)))

(declare-fun lt!653253 () Bool)

(declare-datatypes ((List!34740 0))(
  ( (Nil!34737) (Cons!34736 (h!36148 (_ BitVec 64)) (t!49426 List!34740)) )
))
(declare-fun arrayNoDuplicates!0 (array!100010 (_ BitVec 32) List!34740) Bool)

(assert (=> b!1499884 (= lt!653253 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34737))))

(assert (= (and start!127784 res!1019857) b!1499883))

(assert (= (and b!1499883 res!1019861) b!1499880))

(assert (= (and b!1499880 res!1019860) b!1499881))

(assert (= (and b!1499881 res!1019858) b!1499882))

(assert (= (and b!1499882 res!1019859) b!1499884))

(declare-fun m!1382977 () Bool)

(assert (=> b!1499882 m!1382977))

(declare-fun m!1382979 () Bool)

(assert (=> start!127784 m!1382979))

(declare-fun m!1382981 () Bool)

(assert (=> start!127784 m!1382981))

(declare-fun m!1382983 () Bool)

(assert (=> b!1499881 m!1382983))

(assert (=> b!1499881 m!1382983))

(declare-fun m!1382985 () Bool)

(assert (=> b!1499881 m!1382985))

(declare-fun m!1382987 () Bool)

(assert (=> b!1499880 m!1382987))

(assert (=> b!1499880 m!1382987))

(declare-fun m!1382989 () Bool)

(assert (=> b!1499880 m!1382989))

(declare-fun m!1382991 () Bool)

(assert (=> b!1499884 m!1382991))

(push 1)

(assert (not b!1499884))

(assert (not b!1499882))

(assert (not b!1499881))

(assert (not start!127784))

(assert (not b!1499880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

