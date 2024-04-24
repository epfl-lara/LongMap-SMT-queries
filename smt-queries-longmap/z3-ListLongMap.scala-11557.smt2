; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135036 () Bool)

(assert start!135036)

(declare-fun res!1074344 () Bool)

(declare-fun e!877588 () Bool)

(assert (=> start!135036 (=> (not res!1074344) (not e!877588))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135036 (= res!1074344 (validMask!0 mask!4043))))

(assert (=> start!135036 e!877588))

(assert (=> start!135036 true))

(declare-datatypes ((array!104948 0))(
  ( (array!104949 (arr!50644 (Array (_ BitVec 32) (_ BitVec 64))) (size!51195 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104948)

(declare-fun array_inv!39599 (array!104948) Bool)

(assert (=> start!135036 (array_inv!39599 a!3462)))

(declare-fun b!1573682 () Bool)

(declare-fun res!1074343 () Bool)

(assert (=> b!1573682 (=> (not res!1074343) (not e!877588))))

(assert (=> b!1573682 (= res!1074343 (= (size!51195 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1573683 () Bool)

(assert (=> b!1573683 (= e!877588 false)))

(declare-fun lt!674427 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104948 (_ BitVec 32)) Bool)

(assert (=> b!1573683 (= lt!674427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!135036 res!1074344) b!1573682))

(assert (= (and b!1573682 res!1074343) b!1573683))

(declare-fun m!1447491 () Bool)

(assert (=> start!135036 m!1447491))

(declare-fun m!1447493 () Bool)

(assert (=> start!135036 m!1447493))

(declare-fun m!1447495 () Bool)

(assert (=> b!1573683 m!1447495))

(check-sat (not b!1573683) (not start!135036))
(check-sat)
