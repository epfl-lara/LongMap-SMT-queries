; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135042 () Bool)

(assert start!135042)

(declare-fun res!1074362 () Bool)

(declare-fun e!877606 () Bool)

(assert (=> start!135042 (=> (not res!1074362) (not e!877606))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135042 (= res!1074362 (validMask!0 mask!4043))))

(assert (=> start!135042 e!877606))

(assert (=> start!135042 true))

(declare-datatypes ((array!104954 0))(
  ( (array!104955 (arr!50647 (Array (_ BitVec 32) (_ BitVec 64))) (size!51198 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104954)

(declare-fun array_inv!39602 (array!104954) Bool)

(assert (=> start!135042 (array_inv!39602 a!3462)))

(declare-fun b!1573700 () Bool)

(declare-fun res!1074361 () Bool)

(assert (=> b!1573700 (=> (not res!1074361) (not e!877606))))

(assert (=> b!1573700 (= res!1074361 (= (size!51198 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1573701 () Bool)

(assert (=> b!1573701 (= e!877606 false)))

(declare-fun lt!674436 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104954 (_ BitVec 32)) Bool)

(assert (=> b!1573701 (= lt!674436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!135042 res!1074362) b!1573700))

(assert (= (and b!1573700 res!1074361) b!1573701))

(declare-fun m!1447509 () Bool)

(assert (=> start!135042 m!1447509))

(declare-fun m!1447511 () Bool)

(assert (=> start!135042 m!1447511))

(declare-fun m!1447513 () Bool)

(assert (=> b!1573701 m!1447513))

(check-sat (not b!1573701) (not start!135042))
(check-sat)
