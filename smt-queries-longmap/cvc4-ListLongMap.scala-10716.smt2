; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125438 () Bool)

(assert start!125438)

(declare-fun b!1467494 () Bool)

(declare-fun res!996035 () Bool)

(declare-fun e!824290 () Bool)

(assert (=> b!1467494 (=> (not res!996035) (not e!824290))))

(declare-datatypes ((array!98886 0))(
  ( (array!98887 (arr!47731 (Array (_ BitVec 32) (_ BitVec 64))) (size!48281 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98886)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98886 (_ BitVec 32)) Bool)

(assert (=> b!1467494 (= res!996035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467495 () Bool)

(declare-fun res!996033 () Bool)

(assert (=> b!1467495 (=> (not res!996033) (not e!824290))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467495 (= res!996033 (validKeyInArray!0 (select (arr!47731 a!2862) i!1006)))))

(declare-fun res!996037 () Bool)

(assert (=> start!125438 (=> (not res!996037) (not e!824290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125438 (= res!996037 (validMask!0 mask!2687))))

(assert (=> start!125438 e!824290))

(assert (=> start!125438 true))

(declare-fun array_inv!36759 (array!98886) Bool)

(assert (=> start!125438 (array_inv!36759 a!2862)))

(declare-fun b!1467496 () Bool)

(declare-fun res!996036 () Bool)

(assert (=> b!1467496 (=> (not res!996036) (not e!824290))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1467496 (= res!996036 (and (= (size!48281 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48281 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48281 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467497 () Bool)

(declare-fun res!996034 () Bool)

(assert (=> b!1467497 (=> (not res!996034) (not e!824290))))

(assert (=> b!1467497 (= res!996034 (validKeyInArray!0 (select (arr!47731 a!2862) j!93)))))

(declare-fun b!1467498 () Bool)

(assert (=> b!1467498 (= e!824290 false)))

(declare-fun lt!642111 () Bool)

(declare-datatypes ((List!34232 0))(
  ( (Nil!34229) (Cons!34228 (h!35578 (_ BitVec 64)) (t!48926 List!34232)) )
))
(declare-fun arrayNoDuplicates!0 (array!98886 (_ BitVec 32) List!34232) Bool)

(assert (=> b!1467498 (= lt!642111 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34229))))

(assert (= (and start!125438 res!996037) b!1467496))

(assert (= (and b!1467496 res!996036) b!1467495))

(assert (= (and b!1467495 res!996033) b!1467497))

(assert (= (and b!1467497 res!996034) b!1467494))

(assert (= (and b!1467494 res!996035) b!1467498))

(declare-fun m!1354437 () Bool)

(assert (=> start!125438 m!1354437))

(declare-fun m!1354439 () Bool)

(assert (=> start!125438 m!1354439))

(declare-fun m!1354441 () Bool)

(assert (=> b!1467497 m!1354441))

(assert (=> b!1467497 m!1354441))

(declare-fun m!1354443 () Bool)

(assert (=> b!1467497 m!1354443))

(declare-fun m!1354445 () Bool)

(assert (=> b!1467495 m!1354445))

(assert (=> b!1467495 m!1354445))

(declare-fun m!1354447 () Bool)

(assert (=> b!1467495 m!1354447))

(declare-fun m!1354449 () Bool)

(assert (=> b!1467494 m!1354449))

(declare-fun m!1354451 () Bool)

(assert (=> b!1467498 m!1354451))

(push 1)

(assert (not b!1467498))

(assert (not b!1467495))

(assert (not b!1467497))

(assert (not start!125438))

(assert (not b!1467494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

