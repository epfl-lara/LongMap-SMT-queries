; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134602 () Bool)

(assert start!134602)

(declare-fun b!1571071 () Bool)

(declare-fun res!1073490 () Bool)

(declare-fun e!875965 () Bool)

(assert (=> b!1571071 (=> (not res!1073490) (not e!875965))))

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571071 (= res!1073490 (validKeyInArray!0 k!2731))))

(declare-fun b!1571070 () Bool)

(declare-fun res!1073491 () Bool)

(assert (=> b!1571070 (=> (not res!1073491) (not e!875965))))

(declare-datatypes ((array!104782 0))(
  ( (array!104783 (arr!50569 (Array (_ BitVec 32) (_ BitVec 64))) (size!51121 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104782)

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104782 (_ BitVec 32)) Bool)

(assert (=> b!1571070 (= res!1073491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1571069 () Bool)

(declare-fun res!1073492 () Bool)

(assert (=> b!1571069 (=> (not res!1073492) (not e!875965))))

(assert (=> b!1571069 (= res!1073492 (= (size!51121 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571072 () Bool)

(assert (=> b!1571072 (= e!875965 false)))

(declare-datatypes ((SeekEntryResult!13541 0))(
  ( (MissingZero!13541 (index!56562 (_ BitVec 32))) (Found!13541 (index!56563 (_ BitVec 32))) (Intermediate!13541 (undefined!14353 Bool) (index!56564 (_ BitVec 32)) (x!141254 (_ BitVec 32))) (Undefined!13541) (MissingVacant!13541 (index!56565 (_ BitVec 32))) )
))
(declare-fun lt!673275 () SeekEntryResult!13541)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104782 (_ BitVec 32)) SeekEntryResult!13541)

(assert (=> b!1571072 (= lt!673275 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))

(declare-fun res!1073493 () Bool)

(assert (=> start!134602 (=> (not res!1073493) (not e!875965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134602 (= res!1073493 (validMask!0 mask!4043))))

(assert (=> start!134602 e!875965))

(assert (=> start!134602 true))

(declare-fun array_inv!39505 (array!104782) Bool)

(assert (=> start!134602 (array_inv!39505 a!3462)))

(assert (= (and start!134602 res!1073493) b!1571069))

(assert (= (and b!1571069 res!1073492) b!1571070))

(assert (= (and b!1571070 res!1073491) b!1571071))

(assert (= (and b!1571071 res!1073490) b!1571072))

(declare-fun m!1444457 () Bool)

(assert (=> b!1571071 m!1444457))

(declare-fun m!1444459 () Bool)

(assert (=> b!1571070 m!1444459))

(declare-fun m!1444461 () Bool)

(assert (=> b!1571072 m!1444461))

(declare-fun m!1444463 () Bool)

(assert (=> start!134602 m!1444463))

(declare-fun m!1444465 () Bool)

(assert (=> start!134602 m!1444465))

(push 1)

(assert (not start!134602))

(assert (not b!1571072))

(assert (not b!1571071))

(assert (not b!1571070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

