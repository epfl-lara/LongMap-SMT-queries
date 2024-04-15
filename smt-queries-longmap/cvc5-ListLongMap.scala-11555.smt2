; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134542 () Bool)

(assert start!134542)

(declare-fun res!1073294 () Bool)

(declare-fun e!875830 () Bool)

(assert (=> start!134542 (=> (not res!1073294) (not e!875830))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134542 (= res!1073294 (validMask!0 mask!4043))))

(assert (=> start!134542 e!875830))

(assert (=> start!134542 true))

(declare-datatypes ((array!104743 0))(
  ( (array!104744 (arr!50551 (Array (_ BitVec 32) (_ BitVec 64))) (size!51103 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104743)

(declare-fun array_inv!39487 (array!104743) Bool)

(assert (=> start!134542 (array_inv!39487 a!3462)))

(declare-fun b!1570855 () Bool)

(declare-fun res!1073295 () Bool)

(assert (=> b!1570855 (=> (not res!1073295) (not e!875830))))

(assert (=> b!1570855 (= res!1073295 (= (size!51103 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1570856 () Bool)

(assert (=> b!1570856 (= e!875830 false)))

(declare-fun lt!673203 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104743 (_ BitVec 32)) Bool)

(assert (=> b!1570856 (= lt!673203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134542 res!1073294) b!1570855))

(assert (= (and b!1570855 res!1073295) b!1570856))

(declare-fun m!1444275 () Bool)

(assert (=> start!134542 m!1444275))

(declare-fun m!1444277 () Bool)

(assert (=> start!134542 m!1444277))

(declare-fun m!1444279 () Bool)

(assert (=> b!1570856 m!1444279))

(push 1)

(assert (not b!1570856))

(assert (not start!134542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

