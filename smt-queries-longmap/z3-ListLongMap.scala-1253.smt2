; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26078 () Bool)

(assert start!26078)

(declare-fun b!268806 () Bool)

(declare-fun res!133136 () Bool)

(declare-fun e!173539 () Bool)

(assert (=> b!268806 (=> (not res!133136) (not e!173539))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((array!13164 0))(
  ( (array!13165 (arr!6231 (Array (_ BitVec 32) (_ BitVec 64))) (size!6584 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13164)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268806 (= res!133136 (and (= (size!6584 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6584 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6584 a!3325))))))

(declare-fun b!268807 () Bool)

(declare-fun res!133139 () Bool)

(assert (=> b!268807 (=> (not res!133139) (not e!173539))))

(declare-datatypes ((List!4012 0))(
  ( (Nil!4009) (Cons!4008 (h!4675 (_ BitVec 64)) (t!9085 List!4012)) )
))
(declare-fun arrayNoDuplicates!0 (array!13164 (_ BitVec 32) List!4012) Bool)

(assert (=> b!268807 (= res!133139 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4009))))

(declare-fun res!133141 () Bool)

(assert (=> start!26078 (=> (not res!133141) (not e!173539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26078 (= res!133141 (validMask!0 mask!3868))))

(assert (=> start!26078 e!173539))

(declare-fun array_inv!4203 (array!13164) Bool)

(assert (=> start!26078 (array_inv!4203 a!3325)))

(assert (=> start!26078 true))

(declare-fun b!268808 () Bool)

(declare-fun e!173540 () Bool)

(assert (=> b!268808 (= e!173540 false)))

(declare-fun lt!134867 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13164 (_ BitVec 32)) Bool)

(assert (=> b!268808 (= lt!134867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268809 () Bool)

(declare-fun res!133138 () Bool)

(assert (=> b!268809 (=> (not res!133138) (not e!173539))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268809 (= res!133138 (validKeyInArray!0 k0!2581))))

(declare-fun b!268810 () Bool)

(declare-fun res!133140 () Bool)

(assert (=> b!268810 (=> (not res!133140) (not e!173539))))

(declare-fun arrayContainsKey!0 (array!13164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268810 (= res!133140 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268811 () Bool)

(assert (=> b!268811 (= e!173539 e!173540)))

(declare-fun res!133137 () Bool)

(assert (=> b!268811 (=> (not res!133137) (not e!173540))))

(declare-datatypes ((SeekEntryResult!1388 0))(
  ( (MissingZero!1388 (index!7722 (_ BitVec 32))) (Found!1388 (index!7723 (_ BitVec 32))) (Intermediate!1388 (undefined!2200 Bool) (index!7724 (_ BitVec 32)) (x!26096 (_ BitVec 32))) (Undefined!1388) (MissingVacant!1388 (index!7725 (_ BitVec 32))) )
))
(declare-fun lt!134868 () SeekEntryResult!1388)

(assert (=> b!268811 (= res!133137 (or (= lt!134868 (MissingZero!1388 i!1267)) (= lt!134868 (MissingVacant!1388 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13164 (_ BitVec 32)) SeekEntryResult!1388)

(assert (=> b!268811 (= lt!134868 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26078 res!133141) b!268806))

(assert (= (and b!268806 res!133136) b!268809))

(assert (= (and b!268809 res!133138) b!268807))

(assert (= (and b!268807 res!133139) b!268810))

(assert (= (and b!268810 res!133140) b!268811))

(assert (= (and b!268811 res!133137) b!268808))

(declare-fun m!284375 () Bool)

(assert (=> start!26078 m!284375))

(declare-fun m!284377 () Bool)

(assert (=> start!26078 m!284377))

(declare-fun m!284379 () Bool)

(assert (=> b!268808 m!284379))

(declare-fun m!284381 () Bool)

(assert (=> b!268810 m!284381))

(declare-fun m!284383 () Bool)

(assert (=> b!268809 m!284383))

(declare-fun m!284385 () Bool)

(assert (=> b!268811 m!284385))

(declare-fun m!284387 () Bool)

(assert (=> b!268807 m!284387))

(check-sat (not b!268809) (not b!268811) (not b!268807) (not start!26078) (not b!268808) (not b!268810))
(check-sat)
