; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135004 () Bool)

(assert start!135004)

(declare-fun res!1074284 () Bool)

(declare-fun e!877538 () Bool)

(assert (=> start!135004 (=> (not res!1074284) (not e!877538))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135004 (= res!1074284 (validMask!0 mask!4043))))

(assert (=> start!135004 e!877538))

(assert (=> start!135004 true))

(declare-datatypes ((array!104937 0))(
  ( (array!104938 (arr!50640 (Array (_ BitVec 32) (_ BitVec 64))) (size!51191 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104937)

(declare-fun array_inv!39595 (array!104937) Bool)

(assert (=> start!135004 (array_inv!39595 a!3462)))

(declare-fun b!1573604 () Bool)

(declare-fun res!1074283 () Bool)

(assert (=> b!1573604 (=> (not res!1074283) (not e!877538))))

(assert (=> b!1573604 (= res!1074283 (= (size!51191 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1573605 () Bool)

(assert (=> b!1573605 (= e!877538 false)))

(declare-fun lt!674397 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104937 (_ BitVec 32)) Bool)

(assert (=> b!1573605 (= lt!674397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!135004 res!1074284) b!1573604))

(assert (= (and b!1573604 res!1074283) b!1573605))

(declare-fun m!1447425 () Bool)

(assert (=> start!135004 m!1447425))

(declare-fun m!1447427 () Bool)

(assert (=> start!135004 m!1447427))

(declare-fun m!1447429 () Bool)

(assert (=> b!1573605 m!1447429))

(push 1)

(assert (not start!135004))

(assert (not b!1573605))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

