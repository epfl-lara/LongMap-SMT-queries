; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25732 () Bool)

(assert start!25732)

(declare-fun b!266816 () Bool)

(declare-fun res!131118 () Bool)

(declare-fun e!172573 () Bool)

(assert (=> b!266816 (=> (not res!131118) (not e!172573))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266816 (= res!131118 (validKeyInArray!0 k!2698))))

(declare-fun b!266817 () Bool)

(declare-fun e!172572 () Bool)

(assert (=> b!266817 (= e!172573 e!172572)))

(declare-fun res!131115 () Bool)

(assert (=> b!266817 (=> (not res!131115) (not e!172572))))

(declare-datatypes ((SeekEntryResult!1301 0))(
  ( (MissingZero!1301 (index!7374 (_ BitVec 32))) (Found!1301 (index!7375 (_ BitVec 32))) (Intermediate!1301 (undefined!2113 Bool) (index!7376 (_ BitVec 32)) (x!25674 (_ BitVec 32))) (Undefined!1301) (MissingVacant!1301 (index!7377 (_ BitVec 32))) )
))
(declare-fun lt!134539 () SeekEntryResult!1301)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266817 (= res!131115 (or (= lt!134539 (MissingZero!1301 i!1355)) (= lt!134539 (MissingVacant!1301 i!1355))))))

(declare-datatypes ((array!12911 0))(
  ( (array!12912 (arr!6110 (Array (_ BitVec 32) (_ BitVec 64))) (size!6462 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12911)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12911 (_ BitVec 32)) SeekEntryResult!1301)

(assert (=> b!266817 (= lt!134539 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266818 () Bool)

(assert (=> b!266818 (= e!172572 (bvsge #b00000000000000000000000000000000 (size!6462 a!3436)))))

(declare-fun b!266819 () Bool)

(declare-fun res!131113 () Bool)

(assert (=> b!266819 (=> (not res!131113) (not e!172573))))

(assert (=> b!266819 (= res!131113 (and (= (size!6462 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6462 a!3436))))))

(declare-fun b!266820 () Bool)

(declare-fun res!131114 () Bool)

(assert (=> b!266820 (=> (not res!131114) (not e!172572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12911 (_ BitVec 32)) Bool)

(assert (=> b!266820 (= res!131114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!131112 () Bool)

(assert (=> start!25732 (=> (not res!131112) (not e!172573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25732 (= res!131112 (validMask!0 mask!4002))))

(assert (=> start!25732 e!172573))

(assert (=> start!25732 true))

(declare-fun array_inv!4073 (array!12911) Bool)

(assert (=> start!25732 (array_inv!4073 a!3436)))

(declare-fun b!266821 () Bool)

(declare-fun res!131117 () Bool)

(assert (=> b!266821 (=> (not res!131117) (not e!172573))))

(declare-fun arrayContainsKey!0 (array!12911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266821 (= res!131117 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266822 () Bool)

(declare-fun res!131116 () Bool)

(assert (=> b!266822 (=> (not res!131116) (not e!172572))))

(declare-datatypes ((List!3924 0))(
  ( (Nil!3921) (Cons!3920 (h!4587 (_ BitVec 64)) (t!9006 List!3924)) )
))
(declare-fun arrayNoDuplicates!0 (array!12911 (_ BitVec 32) List!3924) Bool)

(assert (=> b!266822 (= res!131116 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3921))))

(assert (= (and start!25732 res!131112) b!266819))

(assert (= (and b!266819 res!131113) b!266816))

(assert (= (and b!266816 res!131118) b!266821))

(assert (= (and b!266821 res!131117) b!266817))

(assert (= (and b!266817 res!131115) b!266820))

(assert (= (and b!266820 res!131114) b!266822))

(assert (= (and b!266822 res!131116) b!266818))

(declare-fun m!283329 () Bool)

(assert (=> b!266822 m!283329))

(declare-fun m!283331 () Bool)

(assert (=> b!266820 m!283331))

(declare-fun m!283333 () Bool)

(assert (=> b!266816 m!283333))

(declare-fun m!283335 () Bool)

(assert (=> start!25732 m!283335))

(declare-fun m!283337 () Bool)

(assert (=> start!25732 m!283337))

(declare-fun m!283339 () Bool)

(assert (=> b!266821 m!283339))

(declare-fun m!283341 () Bool)

(assert (=> b!266817 m!283341))

(push 1)

