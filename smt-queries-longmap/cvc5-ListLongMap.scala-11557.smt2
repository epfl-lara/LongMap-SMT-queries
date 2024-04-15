; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134578 () Bool)

(assert start!134578)

(declare-fun res!1073367 () Bool)

(declare-fun e!875893 () Bool)

(assert (=> start!134578 (=> (not res!1073367) (not e!875893))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134578 (= res!1073367 (validMask!0 mask!4043))))

(assert (=> start!134578 e!875893))

(assert (=> start!134578 true))

(declare-datatypes ((array!104758 0))(
  ( (array!104759 (arr!50557 (Array (_ BitVec 32) (_ BitVec 64))) (size!51109 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104758)

(declare-fun array_inv!39493 (array!104758) Bool)

(assert (=> start!134578 (array_inv!39493 a!3462)))

(declare-fun b!1570945 () Bool)

(declare-fun res!1073366 () Bool)

(assert (=> b!1570945 (=> (not res!1073366) (not e!875893))))

(assert (=> b!1570945 (= res!1073366 (= (size!51109 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1570946 () Bool)

(assert (=> b!1570946 (= e!875893 false)))

(declare-fun lt!673239 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104758 (_ BitVec 32)) Bool)

(assert (=> b!1570946 (= lt!673239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134578 res!1073367) b!1570945))

(assert (= (and b!1570945 res!1073366) b!1570946))

(declare-fun m!1444353 () Bool)

(assert (=> start!134578 m!1444353))

(declare-fun m!1444355 () Bool)

(assert (=> start!134578 m!1444355))

(declare-fun m!1444357 () Bool)

(assert (=> b!1570946 m!1444357))

(push 1)

(assert (not start!134578))

(assert (not b!1570946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

