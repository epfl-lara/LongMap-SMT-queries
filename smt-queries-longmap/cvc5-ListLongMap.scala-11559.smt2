; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134636 () Bool)

(assert start!134636)

(declare-fun res!1073526 () Bool)

(declare-fun e!876115 () Bool)

(assert (=> start!134636 (=> (not res!1073526) (not e!876115))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134636 (= res!1073526 (validMask!0 mask!4043))))

(assert (=> start!134636 e!876115))

(assert (=> start!134636 true))

(declare-datatypes ((array!104838 0))(
  ( (array!104839 (arr!50596 (Array (_ BitVec 32) (_ BitVec 64))) (size!51146 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104838)

(declare-fun array_inv!39323 (array!104838) Bool)

(assert (=> start!134636 (array_inv!39323 a!3462)))

(declare-fun b!1571286 () Bool)

(declare-fun res!1073524 () Bool)

(assert (=> b!1571286 (=> (not res!1073524) (not e!876115))))

(assert (=> b!1571286 (= res!1073524 (= (size!51146 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571288 () Bool)

(declare-fun res!1073525 () Bool)

(assert (=> b!1571288 (=> (not res!1073525) (not e!876115))))

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571288 (= res!1073525 (validKeyInArray!0 k!2731))))

(declare-fun b!1571289 () Bool)

(assert (=> b!1571289 (= e!876115 false)))

(declare-datatypes ((SeekEntryResult!13533 0))(
  ( (MissingZero!13533 (index!56530 (_ BitVec 32))) (Found!13533 (index!56531 (_ BitVec 32))) (Intermediate!13533 (undefined!14345 Bool) (index!56532 (_ BitVec 32)) (x!141235 (_ BitVec 32))) (Undefined!13533) (MissingVacant!13533 (index!56533 (_ BitVec 32))) )
))
(declare-fun lt!673537 () SeekEntryResult!13533)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104838 (_ BitVec 32)) SeekEntryResult!13533)

(assert (=> b!1571289 (= lt!673537 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))

(declare-fun b!1571287 () Bool)

(declare-fun res!1073523 () Bool)

(assert (=> b!1571287 (=> (not res!1073523) (not e!876115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104838 (_ BitVec 32)) Bool)

(assert (=> b!1571287 (= res!1073523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134636 res!1073526) b!1571286))

(assert (= (and b!1571286 res!1073524) b!1571287))

(assert (= (and b!1571287 res!1073523) b!1571288))

(assert (= (and b!1571288 res!1073525) b!1571289))

(declare-fun m!1445269 () Bool)

(assert (=> start!134636 m!1445269))

(declare-fun m!1445271 () Bool)

(assert (=> start!134636 m!1445271))

(declare-fun m!1445273 () Bool)

(assert (=> b!1571288 m!1445273))

(declare-fun m!1445275 () Bool)

(assert (=> b!1571289 m!1445275))

(declare-fun m!1445277 () Bool)

(assert (=> b!1571287 m!1445277))

(push 1)

(assert (not b!1571289))

(assert (not b!1571288))

(assert (not start!134636))

(assert (not b!1571287))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

