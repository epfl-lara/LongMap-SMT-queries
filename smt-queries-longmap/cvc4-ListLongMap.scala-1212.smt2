; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25742 () Bool)

(assert start!25742)

(declare-fun b!266913 () Bool)

(declare-fun e!172619 () Bool)

(assert (=> b!266913 (= e!172619 false)))

(declare-fun lt!134563 () Bool)

(declare-datatypes ((array!12921 0))(
  ( (array!12922 (arr!6115 (Array (_ BitVec 32) (_ BitVec 64))) (size!6467 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12921)

(declare-datatypes ((List!3929 0))(
  ( (Nil!3926) (Cons!3925 (h!4592 (_ BitVec 64)) (t!9011 List!3929)) )
))
(declare-fun arrayNoDuplicates!0 (array!12921 (_ BitVec 32) List!3929) Bool)

(assert (=> b!266913 (= lt!134563 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3926))))

(declare-fun b!266914 () Bool)

(declare-fun res!131213 () Bool)

(declare-fun e!172617 () Bool)

(assert (=> b!266914 (=> (not res!131213) (not e!172617))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266914 (= res!131213 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266915 () Bool)

(declare-fun res!131214 () Bool)

(assert (=> b!266915 (=> (not res!131214) (not e!172619))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12921 (_ BitVec 32)) Bool)

(assert (=> b!266915 (= res!131214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!131210 () Bool)

(assert (=> start!25742 (=> (not res!131210) (not e!172617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25742 (= res!131210 (validMask!0 mask!4002))))

(assert (=> start!25742 e!172617))

(assert (=> start!25742 true))

(declare-fun array_inv!4078 (array!12921) Bool)

(assert (=> start!25742 (array_inv!4078 a!3436)))

(declare-fun b!266916 () Bool)

(assert (=> b!266916 (= e!172617 e!172619)))

(declare-fun res!131211 () Bool)

(assert (=> b!266916 (=> (not res!131211) (not e!172619))))

(declare-datatypes ((SeekEntryResult!1306 0))(
  ( (MissingZero!1306 (index!7394 (_ BitVec 32))) (Found!1306 (index!7395 (_ BitVec 32))) (Intermediate!1306 (undefined!2118 Bool) (index!7396 (_ BitVec 32)) (x!25687 (_ BitVec 32))) (Undefined!1306) (MissingVacant!1306 (index!7397 (_ BitVec 32))) )
))
(declare-fun lt!134562 () SeekEntryResult!1306)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266916 (= res!131211 (or (= lt!134562 (MissingZero!1306 i!1355)) (= lt!134562 (MissingVacant!1306 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12921 (_ BitVec 32)) SeekEntryResult!1306)

(assert (=> b!266916 (= lt!134562 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266917 () Bool)

(declare-fun res!131209 () Bool)

(assert (=> b!266917 (=> (not res!131209) (not e!172617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266917 (= res!131209 (validKeyInArray!0 k!2698))))

(declare-fun b!266918 () Bool)

(declare-fun res!131212 () Bool)

(assert (=> b!266918 (=> (not res!131212) (not e!172617))))

(assert (=> b!266918 (= res!131212 (and (= (size!6467 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6467 a!3436))))))

(assert (= (and start!25742 res!131210) b!266918))

(assert (= (and b!266918 res!131212) b!266917))

(assert (= (and b!266917 res!131209) b!266914))

(assert (= (and b!266914 res!131213) b!266916))

(assert (= (and b!266916 res!131211) b!266915))

(assert (= (and b!266915 res!131214) b!266913))

(declare-fun m!283399 () Bool)

(assert (=> start!25742 m!283399))

(declare-fun m!283401 () Bool)

(assert (=> start!25742 m!283401))

(declare-fun m!283403 () Bool)

(assert (=> b!266916 m!283403))

(declare-fun m!283405 () Bool)

(assert (=> b!266917 m!283405))

(declare-fun m!283407 () Bool)

(assert (=> b!266915 m!283407))

(declare-fun m!283409 () Bool)

(assert (=> b!266913 m!283409))

(declare-fun m!283411 () Bool)

(assert (=> b!266914 m!283411))

(push 1)

(assert (not b!266915))

(assert (not b!266914))

(assert (not b!266916))

(assert (not start!25742))

(assert (not b!266917))

