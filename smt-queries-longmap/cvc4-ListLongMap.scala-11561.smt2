; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134652 () Bool)

(assert start!134652)

(declare-fun b!1571385 () Bool)

(declare-fun e!876164 () Bool)

(assert (=> b!1571385 (= e!876164 false)))

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13541 0))(
  ( (MissingZero!13541 (index!56562 (_ BitVec 32))) (Found!13541 (index!56563 (_ BitVec 32))) (Intermediate!13541 (undefined!14353 Bool) (index!56564 (_ BitVec 32)) (x!141259 (_ BitVec 32))) (Undefined!13541) (MissingVacant!13541 (index!56565 (_ BitVec 32))) )
))
(declare-fun lt!673561 () SeekEntryResult!13541)

(declare-datatypes ((array!104854 0))(
  ( (array!104855 (arr!50604 (Array (_ BitVec 32) (_ BitVec 64))) (size!51154 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104854)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104854 (_ BitVec 32)) SeekEntryResult!13541)

(assert (=> b!1571385 (= lt!673561 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))

(declare-fun b!1571384 () Bool)

(declare-fun res!1073620 () Bool)

(assert (=> b!1571384 (=> (not res!1073620) (not e!876164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571384 (= res!1073620 (validKeyInArray!0 k!2731))))

(declare-fun b!1571382 () Bool)

(declare-fun res!1073621 () Bool)

(assert (=> b!1571382 (=> (not res!1073621) (not e!876164))))

(assert (=> b!1571382 (= res!1073621 (= (size!51154 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571383 () Bool)

(declare-fun res!1073622 () Bool)

(assert (=> b!1571383 (=> (not res!1073622) (not e!876164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104854 (_ BitVec 32)) Bool)

(assert (=> b!1571383 (= res!1073622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun res!1073619 () Bool)

(assert (=> start!134652 (=> (not res!1073619) (not e!876164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134652 (= res!1073619 (validMask!0 mask!4043))))

(assert (=> start!134652 e!876164))

(assert (=> start!134652 true))

(declare-fun array_inv!39331 (array!104854) Bool)

(assert (=> start!134652 (array_inv!39331 a!3462)))

(assert (= (and start!134652 res!1073619) b!1571382))

(assert (= (and b!1571382 res!1073621) b!1571383))

(assert (= (and b!1571383 res!1073622) b!1571384))

(assert (= (and b!1571384 res!1073620) b!1571385))

(declare-fun m!1445349 () Bool)

(assert (=> b!1571385 m!1445349))

(declare-fun m!1445351 () Bool)

(assert (=> b!1571384 m!1445351))

(declare-fun m!1445353 () Bool)

(assert (=> b!1571383 m!1445353))

(declare-fun m!1445355 () Bool)

(assert (=> start!134652 m!1445355))

(declare-fun m!1445357 () Bool)

(assert (=> start!134652 m!1445357))

(push 1)

(assert (not start!134652))

(assert (not b!1571384))

(assert (not b!1571385))

(assert (not b!1571383))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

