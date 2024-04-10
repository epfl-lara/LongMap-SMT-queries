; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134632 () Bool)

(assert start!134632)

(declare-fun res!1073507 () Bool)

(declare-fun e!876103 () Bool)

(assert (=> start!134632 (=> (not res!1073507) (not e!876103))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134632 (= res!1073507 (validMask!0 mask!4043))))

(assert (=> start!134632 e!876103))

(assert (=> start!134632 true))

(declare-datatypes ((array!104834 0))(
  ( (array!104835 (arr!50594 (Array (_ BitVec 32) (_ BitVec 64))) (size!51144 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104834)

(declare-fun array_inv!39321 (array!104834) Bool)

(assert (=> start!134632 (array_inv!39321 a!3462)))

(declare-fun b!1571270 () Bool)

(declare-fun res!1073508 () Bool)

(assert (=> b!1571270 (=> (not res!1073508) (not e!876103))))

(assert (=> b!1571270 (= res!1073508 (= (size!51144 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571271 () Bool)

(assert (=> b!1571271 (= e!876103 false)))

(declare-fun lt!673531 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104834 (_ BitVec 32)) Bool)

(assert (=> b!1571271 (= lt!673531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134632 res!1073507) b!1571270))

(assert (= (and b!1571270 res!1073508) b!1571271))

(declare-fun m!1445257 () Bool)

(assert (=> start!134632 m!1445257))

(declare-fun m!1445259 () Bool)

(assert (=> start!134632 m!1445259))

(declare-fun m!1445261 () Bool)

(assert (=> b!1571271 m!1445261))

(check-sat (not b!1571271) (not start!134632))
(check-sat)
