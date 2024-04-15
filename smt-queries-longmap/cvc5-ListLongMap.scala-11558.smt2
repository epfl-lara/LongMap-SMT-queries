; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134584 () Bool)

(assert start!134584)

(declare-fun res!1073384 () Bool)

(declare-fun e!875912 () Bool)

(assert (=> start!134584 (=> (not res!1073384) (not e!875912))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134584 (= res!1073384 (validMask!0 mask!4043))))

(assert (=> start!134584 e!875912))

(assert (=> start!134584 true))

(declare-datatypes ((array!104764 0))(
  ( (array!104765 (arr!50560 (Array (_ BitVec 32) (_ BitVec 64))) (size!51112 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104764)

(declare-fun array_inv!39496 (array!104764) Bool)

(assert (=> start!134584 (array_inv!39496 a!3462)))

(declare-fun b!1570963 () Bool)

(declare-fun res!1073385 () Bool)

(assert (=> b!1570963 (=> (not res!1073385) (not e!875912))))

(assert (=> b!1570963 (= res!1073385 (= (size!51112 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1570964 () Bool)

(assert (=> b!1570964 (= e!875912 false)))

(declare-fun lt!673248 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104764 (_ BitVec 32)) Bool)

(assert (=> b!1570964 (= lt!673248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134584 res!1073384) b!1570963))

(assert (= (and b!1570963 res!1073385) b!1570964))

(declare-fun m!1444371 () Bool)

(assert (=> start!134584 m!1444371))

(declare-fun m!1444373 () Bool)

(assert (=> start!134584 m!1444373))

(declare-fun m!1444375 () Bool)

(assert (=> b!1570964 m!1444375))

(push 1)

(assert (not b!1570964))

(assert (not start!134584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

