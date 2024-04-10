; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26058 () Bool)

(assert start!26058)

(declare-fun b!268791 () Bool)

(declare-fun res!133069 () Bool)

(declare-fun e!173559 () Bool)

(assert (=> b!268791 (=> (not res!133069) (not e!173559))))

(declare-datatypes ((array!13155 0))(
  ( (array!13156 (arr!6227 (Array (_ BitVec 32) (_ BitVec 64))) (size!6579 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13155)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268791 (= res!133069 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268792 () Bool)

(declare-fun res!133071 () Bool)

(assert (=> b!268792 (=> (not res!133071) (not e!173559))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268792 (= res!133071 (and (= (size!6579 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6579 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6579 a!3325))))))

(declare-fun b!268793 () Bool)

(declare-fun e!173560 () Bool)

(assert (=> b!268793 (= e!173560 false)))

(declare-fun lt!134995 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13155 (_ BitVec 32)) Bool)

(assert (=> b!268793 (= lt!134995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268794 () Bool)

(declare-fun res!133070 () Bool)

(assert (=> b!268794 (=> (not res!133070) (not e!173559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268794 (= res!133070 (validKeyInArray!0 k!2581))))

(declare-fun b!268795 () Bool)

(assert (=> b!268795 (= e!173559 e!173560)))

(declare-fun res!133074 () Bool)

(assert (=> b!268795 (=> (not res!133074) (not e!173560))))

(declare-datatypes ((SeekEntryResult!1385 0))(
  ( (MissingZero!1385 (index!7710 (_ BitVec 32))) (Found!1385 (index!7711 (_ BitVec 32))) (Intermediate!1385 (undefined!2197 Bool) (index!7712 (_ BitVec 32)) (x!26070 (_ BitVec 32))) (Undefined!1385) (MissingVacant!1385 (index!7713 (_ BitVec 32))) )
))
(declare-fun lt!134994 () SeekEntryResult!1385)

(assert (=> b!268795 (= res!133074 (or (= lt!134994 (MissingZero!1385 i!1267)) (= lt!134994 (MissingVacant!1385 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13155 (_ BitVec 32)) SeekEntryResult!1385)

(assert (=> b!268795 (= lt!134994 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!133072 () Bool)

(assert (=> start!26058 (=> (not res!133072) (not e!173559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26058 (= res!133072 (validMask!0 mask!3868))))

(assert (=> start!26058 e!173559))

(declare-fun array_inv!4190 (array!13155) Bool)

(assert (=> start!26058 (array_inv!4190 a!3325)))

(assert (=> start!26058 true))

(declare-fun b!268796 () Bool)

(declare-fun res!133073 () Bool)

(assert (=> b!268796 (=> (not res!133073) (not e!173559))))

(declare-datatypes ((List!4035 0))(
  ( (Nil!4032) (Cons!4031 (h!4698 (_ BitVec 64)) (t!9117 List!4035)) )
))
(declare-fun arrayNoDuplicates!0 (array!13155 (_ BitVec 32) List!4035) Bool)

(assert (=> b!268796 (= res!133073 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4032))))

(assert (= (and start!26058 res!133072) b!268792))

(assert (= (and b!268792 res!133071) b!268794))

(assert (= (and b!268794 res!133070) b!268796))

(assert (= (and b!268796 res!133073) b!268791))

(assert (= (and b!268791 res!133069) b!268795))

(assert (= (and b!268795 res!133074) b!268793))

(declare-fun m!284841 () Bool)

(assert (=> b!268796 m!284841))

(declare-fun m!284843 () Bool)

(assert (=> b!268793 m!284843))

(declare-fun m!284845 () Bool)

(assert (=> start!26058 m!284845))

(declare-fun m!284847 () Bool)

(assert (=> start!26058 m!284847))

(declare-fun m!284849 () Bool)

(assert (=> b!268794 m!284849))

(declare-fun m!284851 () Bool)

(assert (=> b!268795 m!284851))

(declare-fun m!284853 () Bool)

(assert (=> b!268791 m!284853))

(push 1)

