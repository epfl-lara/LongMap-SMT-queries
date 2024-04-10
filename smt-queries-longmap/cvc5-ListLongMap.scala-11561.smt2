; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134648 () Bool)

(assert start!134648)

(declare-fun res!1073597 () Bool)

(declare-fun e!876152 () Bool)

(assert (=> start!134648 (=> (not res!1073597) (not e!876152))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134648 (= res!1073597 (validMask!0 mask!4043))))

(assert (=> start!134648 e!876152))

(assert (=> start!134648 true))

(declare-datatypes ((array!104850 0))(
  ( (array!104851 (arr!50602 (Array (_ BitVec 32) (_ BitVec 64))) (size!51152 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104850)

(declare-fun array_inv!39329 (array!104850) Bool)

(assert (=> start!134648 (array_inv!39329 a!3462)))

(declare-fun b!1571359 () Bool)

(declare-fun res!1073595 () Bool)

(assert (=> b!1571359 (=> (not res!1073595) (not e!876152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104850 (_ BitVec 32)) Bool)

(assert (=> b!1571359 (= res!1073595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1571361 () Bool)

(assert (=> b!1571361 (= e!876152 false)))

(declare-fun k!2731 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13539 0))(
  ( (MissingZero!13539 (index!56554 (_ BitVec 32))) (Found!13539 (index!56555 (_ BitVec 32))) (Intermediate!13539 (undefined!14351 Bool) (index!56556 (_ BitVec 32)) (x!141257 (_ BitVec 32))) (Undefined!13539) (MissingVacant!13539 (index!56557 (_ BitVec 32))) )
))
(declare-fun lt!673555 () SeekEntryResult!13539)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104850 (_ BitVec 32)) SeekEntryResult!13539)

(assert (=> b!1571361 (= lt!673555 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))

(declare-fun b!1571360 () Bool)

(declare-fun res!1073596 () Bool)

(assert (=> b!1571360 (=> (not res!1073596) (not e!876152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571360 (= res!1073596 (validKeyInArray!0 k!2731))))

(declare-fun b!1571358 () Bool)

(declare-fun res!1073598 () Bool)

(assert (=> b!1571358 (=> (not res!1073598) (not e!876152))))

(assert (=> b!1571358 (= res!1073598 (= (size!51152 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(assert (= (and start!134648 res!1073597) b!1571358))

(assert (= (and b!1571358 res!1073598) b!1571359))

(assert (= (and b!1571359 res!1073595) b!1571360))

(assert (= (and b!1571360 res!1073596) b!1571361))

(declare-fun m!1445329 () Bool)

(assert (=> start!134648 m!1445329))

(declare-fun m!1445331 () Bool)

(assert (=> start!134648 m!1445331))

(declare-fun m!1445333 () Bool)

(assert (=> b!1571359 m!1445333))

(declare-fun m!1445335 () Bool)

(assert (=> b!1571361 m!1445335))

(declare-fun m!1445337 () Bool)

(assert (=> b!1571360 m!1445337))

(push 1)

(assert (not start!134648))

(assert (not b!1571360))

(assert (not b!1571361))

(assert (not b!1571359))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

