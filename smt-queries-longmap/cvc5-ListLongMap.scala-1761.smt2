; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32202 () Bool)

(assert start!32202)

(declare-fun b!320741 () Bool)

(declare-fun e!198945 () Bool)

(assert (=> b!320741 (= e!198945 false)))

(declare-datatypes ((array!16405 0))(
  ( (array!16406 (arr!7761 (Array (_ BitVec 32) (_ BitVec 64))) (size!8113 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16405)

(declare-datatypes ((SeekEntryResult!2857 0))(
  ( (MissingZero!2857 (index!13604 (_ BitVec 32))) (Found!2857 (index!13605 (_ BitVec 32))) (Intermediate!2857 (undefined!3669 Bool) (index!13606 (_ BitVec 32)) (x!31977 (_ BitVec 32))) (Undefined!2857) (MissingVacant!2857 (index!13607 (_ BitVec 32))) )
))
(declare-fun lt!156138 () SeekEntryResult!2857)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16405 (_ BitVec 32)) SeekEntryResult!2857)

(assert (=> b!320741 (= lt!156138 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!320742 () Bool)

(declare-fun res!174916 () Bool)

(assert (=> b!320742 (=> (not res!174916) (not e!198945))))

(declare-fun arrayContainsKey!0 (array!16405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320742 (= res!174916 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320743 () Bool)

(declare-fun res!174912 () Bool)

(assert (=> b!320743 (=> (not res!174912) (not e!198945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16405 (_ BitVec 32)) Bool)

(assert (=> b!320743 (= res!174912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320744 () Bool)

(declare-fun res!174917 () Bool)

(assert (=> b!320744 (=> (not res!174917) (not e!198945))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320744 (= res!174917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2857 false resIndex!58 resX!58)))))

(declare-fun res!174913 () Bool)

(assert (=> start!32202 (=> (not res!174913) (not e!198945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32202 (= res!174913 (validMask!0 mask!3777))))

(assert (=> start!32202 e!198945))

(declare-fun array_inv!5711 (array!16405) Bool)

(assert (=> start!32202 (array_inv!5711 a!3305)))

(assert (=> start!32202 true))

(declare-fun b!320745 () Bool)

(declare-fun res!174915 () Bool)

(assert (=> b!320745 (=> (not res!174915) (not e!198945))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320745 (= res!174915 (and (= (select (arr!7761 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8113 a!3305))))))

(declare-fun b!320746 () Bool)

(declare-fun res!174914 () Bool)

(assert (=> b!320746 (=> (not res!174914) (not e!198945))))

(assert (=> b!320746 (= res!174914 (and (= (size!8113 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8113 a!3305))))))

(declare-fun b!320747 () Bool)

(declare-fun res!174918 () Bool)

(assert (=> b!320747 (=> (not res!174918) (not e!198945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320747 (= res!174918 (validKeyInArray!0 k!2497))))

(declare-fun b!320748 () Bool)

(declare-fun res!174911 () Bool)

(assert (=> b!320748 (=> (not res!174911) (not e!198945))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16405 (_ BitVec 32)) SeekEntryResult!2857)

(assert (=> b!320748 (= res!174911 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2857 i!1250)))))

(assert (= (and start!32202 res!174913) b!320746))

(assert (= (and b!320746 res!174914) b!320747))

(assert (= (and b!320747 res!174918) b!320742))

(assert (= (and b!320742 res!174916) b!320748))

(assert (= (and b!320748 res!174911) b!320743))

(assert (= (and b!320743 res!174912) b!320744))

(assert (= (and b!320744 res!174917) b!320745))

(assert (= (and b!320745 res!174915) b!320741))

(declare-fun m!329231 () Bool)

(assert (=> b!320745 m!329231))

(declare-fun m!329233 () Bool)

(assert (=> b!320741 m!329233))

(declare-fun m!329235 () Bool)

(assert (=> b!320744 m!329235))

(assert (=> b!320744 m!329235))

(declare-fun m!329237 () Bool)

(assert (=> b!320744 m!329237))

(declare-fun m!329239 () Bool)

(assert (=> b!320747 m!329239))

(declare-fun m!329241 () Bool)

(assert (=> b!320742 m!329241))

(declare-fun m!329243 () Bool)

(assert (=> b!320743 m!329243))

(declare-fun m!329245 () Bool)

(assert (=> start!32202 m!329245))

(declare-fun m!329247 () Bool)

(assert (=> start!32202 m!329247))

(declare-fun m!329249 () Bool)

(assert (=> b!320748 m!329249))

(push 1)

(assert (not b!320744))

(assert (not b!320748))

(assert (not b!320743))

(assert (not start!32202))

(assert (not b!320742))

(assert (not b!320747))

(assert (not b!320741))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

