; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135064 () Bool)

(assert start!135064)

(declare-fun res!1074480 () Bool)

(declare-fun e!877672 () Bool)

(assert (=> start!135064 (=> (not res!1074480) (not e!877672))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135064 (= res!1074480 (validMask!0 mask!4043))))

(assert (=> start!135064 e!877672))

(assert (=> start!135064 true))

(declare-datatypes ((array!104976 0))(
  ( (array!104977 (arr!50658 (Array (_ BitVec 32) (_ BitVec 64))) (size!51209 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104976)

(declare-fun array_inv!39613 (array!104976) Bool)

(assert (=> start!135064 (array_inv!39613 a!3462)))

(declare-fun b!1573821 () Bool)

(assert (=> b!1573821 (= e!877672 false)))

(declare-fun k!2731 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13489 0))(
  ( (MissingZero!13489 (index!56354 (_ BitVec 32))) (Found!13489 (index!56355 (_ BitVec 32))) (Intermediate!13489 (undefined!14301 Bool) (index!56356 (_ BitVec 32)) (x!141258 (_ BitVec 32))) (Undefined!13489) (MissingVacant!13489 (index!56357 (_ BitVec 32))) )
))
(declare-fun lt!674469 () SeekEntryResult!13489)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104976 (_ BitVec 32)) SeekEntryResult!13489)

(assert (=> b!1573821 (= lt!674469 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))

(declare-fun b!1573820 () Bool)

(declare-fun res!1074481 () Bool)

(assert (=> b!1573820 (=> (not res!1074481) (not e!877672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573820 (= res!1074481 (validKeyInArray!0 k!2731))))

(declare-fun b!1573819 () Bool)

(declare-fun res!1074479 () Bool)

(assert (=> b!1573819 (=> (not res!1074479) (not e!877672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104976 (_ BitVec 32)) Bool)

(assert (=> b!1573819 (= res!1074479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1573818 () Bool)

(declare-fun res!1074482 () Bool)

(assert (=> b!1573818 (=> (not res!1074482) (not e!877672))))

(assert (=> b!1573818 (= res!1074482 (= (size!51209 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(assert (= (and start!135064 res!1074480) b!1573818))

(assert (= (and b!1573818 res!1074482) b!1573819))

(assert (= (and b!1573819 res!1074479) b!1573820))

(assert (= (and b!1573820 res!1074481) b!1573821))

(declare-fun m!1447607 () Bool)

(assert (=> start!135064 m!1447607))

(declare-fun m!1447609 () Bool)

(assert (=> start!135064 m!1447609))

(declare-fun m!1447611 () Bool)

(assert (=> b!1573821 m!1447611))

(declare-fun m!1447613 () Bool)

(assert (=> b!1573820 m!1447613))

(declare-fun m!1447615 () Bool)

(assert (=> b!1573819 m!1447615))

(push 1)

(assert (not b!1573819))

(assert (not start!135064))

(assert (not b!1573820))

(assert (not b!1573821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

