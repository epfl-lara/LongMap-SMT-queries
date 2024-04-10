; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134642 () Bool)

(assert start!134642)

(declare-fun b!1571324 () Bool)

(declare-fun res!1073561 () Bool)

(declare-fun e!876134 () Bool)

(assert (=> b!1571324 (=> (not res!1073561) (not e!876134))))

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571324 (= res!1073561 (validKeyInArray!0 k!2731))))

(declare-fun res!1073559 () Bool)

(assert (=> start!134642 (=> (not res!1073559) (not e!876134))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134642 (= res!1073559 (validMask!0 mask!4043))))

(assert (=> start!134642 e!876134))

(assert (=> start!134642 true))

(declare-datatypes ((array!104844 0))(
  ( (array!104845 (arr!50599 (Array (_ BitVec 32) (_ BitVec 64))) (size!51149 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104844)

(declare-fun array_inv!39326 (array!104844) Bool)

(assert (=> start!134642 (array_inv!39326 a!3462)))

(declare-fun b!1571323 () Bool)

(declare-fun res!1073562 () Bool)

(assert (=> b!1571323 (=> (not res!1073562) (not e!876134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104844 (_ BitVec 32)) Bool)

(assert (=> b!1571323 (= res!1073562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1571325 () Bool)

(assert (=> b!1571325 (= e!876134 false)))

(declare-datatypes ((SeekEntryResult!13536 0))(
  ( (MissingZero!13536 (index!56542 (_ BitVec 32))) (Found!13536 (index!56543 (_ BitVec 32))) (Intermediate!13536 (undefined!14348 Bool) (index!56544 (_ BitVec 32)) (x!141246 (_ BitVec 32))) (Undefined!13536) (MissingVacant!13536 (index!56545 (_ BitVec 32))) )
))
(declare-fun lt!673546 () SeekEntryResult!13536)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104844 (_ BitVec 32)) SeekEntryResult!13536)

(assert (=> b!1571325 (= lt!673546 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))

(declare-fun b!1571322 () Bool)

(declare-fun res!1073560 () Bool)

(assert (=> b!1571322 (=> (not res!1073560) (not e!876134))))

(assert (=> b!1571322 (= res!1073560 (= (size!51149 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(assert (= (and start!134642 res!1073559) b!1571322))

(assert (= (and b!1571322 res!1073560) b!1571323))

(assert (= (and b!1571323 res!1073562) b!1571324))

(assert (= (and b!1571324 res!1073561) b!1571325))

(declare-fun m!1445299 () Bool)

(assert (=> b!1571324 m!1445299))

(declare-fun m!1445301 () Bool)

(assert (=> start!134642 m!1445301))

(declare-fun m!1445303 () Bool)

(assert (=> start!134642 m!1445303))

(declare-fun m!1445305 () Bool)

(assert (=> b!1571323 m!1445305))

(declare-fun m!1445307 () Bool)

(assert (=> b!1571325 m!1445307))

(push 1)

(assert (not b!1571325))

(assert (not start!134642))

(assert (not b!1571324))

(assert (not b!1571323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

