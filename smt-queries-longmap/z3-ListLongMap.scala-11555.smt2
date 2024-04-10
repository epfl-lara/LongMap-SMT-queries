; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134590 () Bool)

(assert start!134590)

(declare-fun res!1073418 () Bool)

(declare-fun e!876023 () Bool)

(assert (=> start!134590 (=> (not res!1073418) (not e!876023))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134590 (= res!1073418 (validMask!0 mask!4043))))

(assert (=> start!134590 e!876023))

(assert (=> start!134590 true))

(declare-datatypes ((array!104813 0))(
  ( (array!104814 (arr!50585 (Array (_ BitVec 32) (_ BitVec 64))) (size!51135 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104813)

(declare-fun array_inv!39312 (array!104813) Bool)

(assert (=> start!134590 (array_inv!39312 a!3462)))

(declare-fun b!1571162 () Bool)

(declare-fun res!1073417 () Bool)

(assert (=> b!1571162 (=> (not res!1073417) (not e!876023))))

(assert (=> b!1571162 (= res!1073417 (= (size!51135 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571163 () Bool)

(assert (=> b!1571163 (= e!876023 false)))

(declare-fun lt!673486 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104813 (_ BitVec 32)) Bool)

(assert (=> b!1571163 (= lt!673486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134590 res!1073418) b!1571162))

(assert (= (and b!1571162 res!1073417) b!1571163))

(declare-fun m!1445161 () Bool)

(assert (=> start!134590 m!1445161))

(declare-fun m!1445163 () Bool)

(assert (=> start!134590 m!1445163))

(declare-fun m!1445165 () Bool)

(assert (=> b!1571163 m!1445165))

(check-sat (not start!134590) (not b!1571163))
(check-sat)
