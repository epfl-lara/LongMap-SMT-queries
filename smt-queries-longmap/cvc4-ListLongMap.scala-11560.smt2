; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134646 () Bool)

(assert start!134646)

(declare-fun b!1571347 () Bool)

(declare-fun res!1073584 () Bool)

(declare-fun e!876146 () Bool)

(assert (=> b!1571347 (=> (not res!1073584) (not e!876146))))

(declare-datatypes ((array!104848 0))(
  ( (array!104849 (arr!50601 (Array (_ BitVec 32) (_ BitVec 64))) (size!51151 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104848)

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104848 (_ BitVec 32)) Bool)

(assert (=> b!1571347 (= res!1073584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun res!1073586 () Bool)

(assert (=> start!134646 (=> (not res!1073586) (not e!876146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134646 (= res!1073586 (validMask!0 mask!4043))))

(assert (=> start!134646 e!876146))

(assert (=> start!134646 true))

(declare-fun array_inv!39328 (array!104848) Bool)

(assert (=> start!134646 (array_inv!39328 a!3462)))

(declare-fun b!1571346 () Bool)

(declare-fun res!1073583 () Bool)

(assert (=> b!1571346 (=> (not res!1073583) (not e!876146))))

(assert (=> b!1571346 (= res!1073583 (= (size!51151 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571348 () Bool)

(declare-fun res!1073585 () Bool)

(assert (=> b!1571348 (=> (not res!1073585) (not e!876146))))

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571348 (= res!1073585 (validKeyInArray!0 k!2731))))

(declare-fun b!1571349 () Bool)

(assert (=> b!1571349 (= e!876146 false)))

(declare-datatypes ((SeekEntryResult!13538 0))(
  ( (MissingZero!13538 (index!56550 (_ BitVec 32))) (Found!13538 (index!56551 (_ BitVec 32))) (Intermediate!13538 (undefined!14350 Bool) (index!56552 (_ BitVec 32)) (x!141248 (_ BitVec 32))) (Undefined!13538) (MissingVacant!13538 (index!56553 (_ BitVec 32))) )
))
(declare-fun lt!673552 () SeekEntryResult!13538)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104848 (_ BitVec 32)) SeekEntryResult!13538)

(assert (=> b!1571349 (= lt!673552 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))

(assert (= (and start!134646 res!1073586) b!1571346))

(assert (= (and b!1571346 res!1073583) b!1571347))

(assert (= (and b!1571347 res!1073584) b!1571348))

(assert (= (and b!1571348 res!1073585) b!1571349))

(declare-fun m!1445319 () Bool)

(assert (=> b!1571347 m!1445319))

(declare-fun m!1445321 () Bool)

(assert (=> start!134646 m!1445321))

(declare-fun m!1445323 () Bool)

(assert (=> start!134646 m!1445323))

(declare-fun m!1445325 () Bool)

(assert (=> b!1571348 m!1445325))

(declare-fun m!1445327 () Bool)

(assert (=> b!1571349 m!1445327))

(push 1)

(assert (not start!134646))

(assert (not b!1571348))

(assert (not b!1571347))

(assert (not b!1571349))

(check-sat)

(pop 1)

