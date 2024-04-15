; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134590 () Bool)

(assert start!134590)

(declare-fun b!1570999 () Bool)

(declare-fun res!1073420 () Bool)

(declare-fun e!875930 () Bool)

(assert (=> b!1570999 (=> (not res!1073420) (not e!875930))))

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570999 (= res!1073420 (validKeyInArray!0 k!2731))))

(declare-fun res!1073419 () Bool)

(assert (=> start!134590 (=> (not res!1073419) (not e!875930))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134590 (= res!1073419 (validMask!0 mask!4043))))

(assert (=> start!134590 e!875930))

(assert (=> start!134590 true))

(declare-datatypes ((array!104770 0))(
  ( (array!104771 (arr!50563 (Array (_ BitVec 32) (_ BitVec 64))) (size!51115 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104770)

(declare-fun array_inv!39499 (array!104770) Bool)

(assert (=> start!134590 (array_inv!39499 a!3462)))

(declare-fun b!1570998 () Bool)

(declare-fun res!1073418 () Bool)

(assert (=> b!1570998 (=> (not res!1073418) (not e!875930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104770 (_ BitVec 32)) Bool)

(assert (=> b!1570998 (= res!1073418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1570997 () Bool)

(declare-fun res!1073421 () Bool)

(assert (=> b!1570997 (=> (not res!1073421) (not e!875930))))

(assert (=> b!1570997 (= res!1073421 (= (size!51115 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571000 () Bool)

(assert (=> b!1571000 (= e!875930 false)))

(declare-datatypes ((SeekEntryResult!13535 0))(
  ( (MissingZero!13535 (index!56538 (_ BitVec 32))) (Found!13535 (index!56539 (_ BitVec 32))) (Intermediate!13535 (undefined!14347 Bool) (index!56540 (_ BitVec 32)) (x!141232 (_ BitVec 32))) (Undefined!13535) (MissingVacant!13535 (index!56541 (_ BitVec 32))) )
))
(declare-fun lt!673257 () SeekEntryResult!13535)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104770 (_ BitVec 32)) SeekEntryResult!13535)

(assert (=> b!1571000 (= lt!673257 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))

(assert (= (and start!134590 res!1073419) b!1570997))

(assert (= (and b!1570997 res!1073421) b!1570998))

(assert (= (and b!1570998 res!1073418) b!1570999))

(assert (= (and b!1570999 res!1073420) b!1571000))

(declare-fun m!1444397 () Bool)

(assert (=> b!1570999 m!1444397))

(declare-fun m!1444399 () Bool)

(assert (=> start!134590 m!1444399))

(declare-fun m!1444401 () Bool)

(assert (=> start!134590 m!1444401))

(declare-fun m!1444403 () Bool)

(assert (=> b!1570998 m!1444403))

(declare-fun m!1444405 () Bool)

(assert (=> b!1571000 m!1444405))

(push 1)

(assert (not b!1570998))

(assert (not start!134590))

(assert (not b!1570999))

(assert (not b!1571000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

