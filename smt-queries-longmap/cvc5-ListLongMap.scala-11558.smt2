; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134630 () Bool)

(assert start!134630)

(declare-fun res!1073501 () Bool)

(declare-fun e!876097 () Bool)

(assert (=> start!134630 (=> (not res!1073501) (not e!876097))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134630 (= res!1073501 (validMask!0 mask!4043))))

(assert (=> start!134630 e!876097))

(assert (=> start!134630 true))

(declare-datatypes ((array!104832 0))(
  ( (array!104833 (arr!50593 (Array (_ BitVec 32) (_ BitVec 64))) (size!51143 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104832)

(declare-fun array_inv!39320 (array!104832) Bool)

(assert (=> start!134630 (array_inv!39320 a!3462)))

(declare-fun b!1571264 () Bool)

(declare-fun res!1073502 () Bool)

(assert (=> b!1571264 (=> (not res!1073502) (not e!876097))))

(assert (=> b!1571264 (= res!1073502 (= (size!51143 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571265 () Bool)

(assert (=> b!1571265 (= e!876097 false)))

(declare-fun lt!673528 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104832 (_ BitVec 32)) Bool)

(assert (=> b!1571265 (= lt!673528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134630 res!1073501) b!1571264))

(assert (= (and b!1571264 res!1073502) b!1571265))

(declare-fun m!1445251 () Bool)

(assert (=> start!134630 m!1445251))

(declare-fun m!1445253 () Bool)

(assert (=> start!134630 m!1445253))

(declare-fun m!1445255 () Bool)

(assert (=> b!1571265 m!1445255))

(push 1)

(assert (not b!1571265))

(assert (not start!134630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

