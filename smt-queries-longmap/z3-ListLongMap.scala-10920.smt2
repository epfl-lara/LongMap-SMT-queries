; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127784 () Bool)

(assert start!127784)

(declare-fun res!1022856 () Bool)

(declare-fun e!840055 () Bool)

(assert (=> start!127784 (=> (not res!1022856) (not e!840055))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127784 (= res!1022856 (validMask!0 mask!2661))))

(assert (=> start!127784 e!840055))

(assert (=> start!127784 true))

(declare-datatypes ((array!100165 0))(
  ( (array!100166 (arr!48342 (Array (_ BitVec 32) (_ BitVec 64))) (size!48892 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100165)

(declare-fun array_inv!37370 (array!100165) Bool)

(assert (=> start!127784 (array_inv!37370 a!2850)))

(declare-fun b!1501777 () Bool)

(declare-fun res!1022857 () Bool)

(assert (=> b!1501777 (=> (not res!1022857) (not e!840055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100165 (_ BitVec 32)) Bool)

(assert (=> b!1501777 (= res!1022857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501778 () Bool)

(assert (=> b!1501778 (= e!840055 false)))

(declare-fun lt!653260 () Bool)

(declare-datatypes ((List!34834 0))(
  ( (Nil!34831) (Cons!34830 (h!36227 (_ BitVec 64)) (t!49528 List!34834)) )
))
(declare-fun arrayNoDuplicates!0 (array!100165 (_ BitVec 32) List!34834) Bool)

(assert (=> b!1501778 (= lt!653260 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34831))))

(declare-fun b!1501779 () Bool)

(declare-fun res!1022854 () Bool)

(assert (=> b!1501779 (=> (not res!1022854) (not e!840055))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501779 (= res!1022854 (and (= (size!48892 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48892 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48892 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501780 () Bool)

(declare-fun res!1022853 () Bool)

(assert (=> b!1501780 (=> (not res!1022853) (not e!840055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501780 (= res!1022853 (validKeyInArray!0 (select (arr!48342 a!2850) i!996)))))

(declare-fun b!1501781 () Bool)

(declare-fun res!1022855 () Bool)

(assert (=> b!1501781 (=> (not res!1022855) (not e!840055))))

(assert (=> b!1501781 (= res!1022855 (validKeyInArray!0 (select (arr!48342 a!2850) j!87)))))

(assert (= (and start!127784 res!1022856) b!1501779))

(assert (= (and b!1501779 res!1022854) b!1501780))

(assert (= (and b!1501780 res!1022853) b!1501781))

(assert (= (and b!1501781 res!1022855) b!1501777))

(assert (= (and b!1501777 res!1022857) b!1501778))

(declare-fun m!1385051 () Bool)

(assert (=> start!127784 m!1385051))

(declare-fun m!1385053 () Bool)

(assert (=> start!127784 m!1385053))

(declare-fun m!1385055 () Bool)

(assert (=> b!1501780 m!1385055))

(assert (=> b!1501780 m!1385055))

(declare-fun m!1385057 () Bool)

(assert (=> b!1501780 m!1385057))

(declare-fun m!1385059 () Bool)

(assert (=> b!1501781 m!1385059))

(assert (=> b!1501781 m!1385059))

(declare-fun m!1385061 () Bool)

(assert (=> b!1501781 m!1385061))

(declare-fun m!1385063 () Bool)

(assert (=> b!1501777 m!1385063))

(declare-fun m!1385065 () Bool)

(assert (=> b!1501778 m!1385065))

(check-sat (not b!1501778) (not b!1501780) (not b!1501781) (not b!1501777) (not start!127784))
