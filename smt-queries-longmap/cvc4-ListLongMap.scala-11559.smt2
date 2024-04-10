; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134640 () Bool)

(assert start!134640)

(declare-fun b!1571313 () Bool)

(declare-fun e!876127 () Bool)

(assert (=> b!1571313 (= e!876127 false)))

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13535 0))(
  ( (MissingZero!13535 (index!56538 (_ BitVec 32))) (Found!13535 (index!56539 (_ BitVec 32))) (Intermediate!13535 (undefined!14347 Bool) (index!56540 (_ BitVec 32)) (x!141237 (_ BitVec 32))) (Undefined!13535) (MissingVacant!13535 (index!56541 (_ BitVec 32))) )
))
(declare-fun lt!673543 () SeekEntryResult!13535)

(declare-datatypes ((array!104842 0))(
  ( (array!104843 (arr!50598 (Array (_ BitVec 32) (_ BitVec 64))) (size!51148 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104842)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104842 (_ BitVec 32)) SeekEntryResult!13535)

(assert (=> b!1571313 (= lt!673543 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))

(declare-fun b!1571311 () Bool)

(declare-fun res!1073550 () Bool)

(assert (=> b!1571311 (=> (not res!1073550) (not e!876127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104842 (_ BitVec 32)) Bool)

(assert (=> b!1571311 (= res!1073550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1571312 () Bool)

(declare-fun res!1073549 () Bool)

(assert (=> b!1571312 (=> (not res!1073549) (not e!876127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571312 (= res!1073549 (validKeyInArray!0 k!2731))))

(declare-fun res!1073547 () Bool)

(assert (=> start!134640 (=> (not res!1073547) (not e!876127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134640 (= res!1073547 (validMask!0 mask!4043))))

(assert (=> start!134640 e!876127))

(assert (=> start!134640 true))

(declare-fun array_inv!39325 (array!104842) Bool)

(assert (=> start!134640 (array_inv!39325 a!3462)))

(declare-fun b!1571310 () Bool)

(declare-fun res!1073548 () Bool)

(assert (=> b!1571310 (=> (not res!1073548) (not e!876127))))

(assert (=> b!1571310 (= res!1073548 (= (size!51148 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(assert (= (and start!134640 res!1073547) b!1571310))

(assert (= (and b!1571310 res!1073548) b!1571311))

(assert (= (and b!1571311 res!1073550) b!1571312))

(assert (= (and b!1571312 res!1073549) b!1571313))

(declare-fun m!1445289 () Bool)

(assert (=> b!1571313 m!1445289))

(declare-fun m!1445291 () Bool)

(assert (=> b!1571311 m!1445291))

(declare-fun m!1445293 () Bool)

(assert (=> b!1571312 m!1445293))

(declare-fun m!1445295 () Bool)

(assert (=> start!134640 m!1445295))

(declare-fun m!1445297 () Bool)

(assert (=> start!134640 m!1445297))

(push 1)

(assert (not b!1571312))

(assert (not start!134640))

(assert (not b!1571311))

(assert (not b!1571313))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

