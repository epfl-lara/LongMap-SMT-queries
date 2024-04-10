; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134626 () Bool)

(assert start!134626)

(declare-fun res!1073490 () Bool)

(declare-fun e!876086 () Bool)

(assert (=> start!134626 (=> (not res!1073490) (not e!876086))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134626 (= res!1073490 (validMask!0 mask!4043))))

(assert (=> start!134626 e!876086))

(assert (=> start!134626 true))

(declare-datatypes ((array!104828 0))(
  ( (array!104829 (arr!50591 (Array (_ BitVec 32) (_ BitVec 64))) (size!51141 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104828)

(declare-fun array_inv!39318 (array!104828) Bool)

(assert (=> start!134626 (array_inv!39318 a!3462)))

(declare-fun b!1571252 () Bool)

(declare-fun res!1073489 () Bool)

(assert (=> b!1571252 (=> (not res!1073489) (not e!876086))))

(assert (=> b!1571252 (= res!1073489 (= (size!51141 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571253 () Bool)

(assert (=> b!1571253 (= e!876086 false)))

(declare-fun lt!673522 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104828 (_ BitVec 32)) Bool)

(assert (=> b!1571253 (= lt!673522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134626 res!1073490) b!1571252))

(assert (= (and b!1571252 res!1073489) b!1571253))

(declare-fun m!1445239 () Bool)

(assert (=> start!134626 m!1445239))

(declare-fun m!1445241 () Bool)

(assert (=> start!134626 m!1445241))

(declare-fun m!1445243 () Bool)

(assert (=> b!1571253 m!1445243))

(check-sat (not start!134626) (not b!1571253))
(check-sat)
