; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124120 () Bool)

(assert start!124120)

(declare-fun res!969313 () Bool)

(declare-fun e!811144 () Bool)

(assert (=> start!124120 (=> (not res!969313) (not e!811144))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124120 (= res!969313 (validMask!0 mask!2687))))

(assert (=> start!124120 e!811144))

(assert (=> start!124120 true))

(declare-datatypes ((array!97745 0))(
  ( (array!97746 (arr!47170 (Array (_ BitVec 32) (_ BitVec 64))) (size!47721 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97745)

(declare-fun array_inv!36451 (array!97745) Bool)

(assert (=> start!124120 (array_inv!36451 a!2862)))

(declare-fun b!1437140 () Bool)

(assert (=> b!1437140 (= e!811144 (bvsgt #b00000000000000000000000000000000 (size!47721 a!2862)))))

(declare-fun b!1437141 () Bool)

(declare-fun res!969310 () Bool)

(assert (=> b!1437141 (=> (not res!969310) (not e!811144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97745 (_ BitVec 32)) Bool)

(assert (=> b!1437141 (= res!969310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437142 () Bool)

(declare-fun res!969309 () Bool)

(assert (=> b!1437142 (=> (not res!969309) (not e!811144))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437142 (= res!969309 (and (= (size!47721 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47721 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47721 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437143 () Bool)

(declare-fun res!969311 () Bool)

(assert (=> b!1437143 (=> (not res!969311) (not e!811144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437143 (= res!969311 (validKeyInArray!0 (select (arr!47170 a!2862) i!1006)))))

(declare-fun b!1437144 () Bool)

(declare-fun res!969312 () Bool)

(assert (=> b!1437144 (=> (not res!969312) (not e!811144))))

(assert (=> b!1437144 (= res!969312 (validKeyInArray!0 (select (arr!47170 a!2862) j!93)))))

(assert (= (and start!124120 res!969313) b!1437142))

(assert (= (and b!1437142 res!969309) b!1437143))

(assert (= (and b!1437143 res!969311) b!1437144))

(assert (= (and b!1437144 res!969312) b!1437141))

(assert (= (and b!1437141 res!969310) b!1437140))

(declare-fun m!1326637 () Bool)

(assert (=> start!124120 m!1326637))

(declare-fun m!1326639 () Bool)

(assert (=> start!124120 m!1326639))

(declare-fun m!1326641 () Bool)

(assert (=> b!1437141 m!1326641))

(declare-fun m!1326643 () Bool)

(assert (=> b!1437143 m!1326643))

(assert (=> b!1437143 m!1326643))

(declare-fun m!1326645 () Bool)

(assert (=> b!1437143 m!1326645))

(declare-fun m!1326647 () Bool)

(assert (=> b!1437144 m!1326647))

(assert (=> b!1437144 m!1326647))

(declare-fun m!1326649 () Bool)

(assert (=> b!1437144 m!1326649))

(check-sat (not b!1437144) (not start!124120) (not b!1437141) (not b!1437143))
(check-sat)
