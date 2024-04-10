; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25748 () Bool)

(assert start!25748)

(declare-fun b!266967 () Bool)

(declare-fun res!131265 () Bool)

(declare-fun e!172646 () Bool)

(assert (=> b!266967 (=> (not res!131265) (not e!172646))))

(declare-datatypes ((array!12927 0))(
  ( (array!12928 (arr!6118 (Array (_ BitVec 32) (_ BitVec 64))) (size!6470 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12927)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266967 (= res!131265 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!131268 () Bool)

(assert (=> start!25748 (=> (not res!131268) (not e!172646))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25748 (= res!131268 (validMask!0 mask!4002))))

(assert (=> start!25748 e!172646))

(assert (=> start!25748 true))

(declare-fun array_inv!4081 (array!12927) Bool)

(assert (=> start!25748 (array_inv!4081 a!3436)))

(declare-fun b!266968 () Bool)

(declare-fun res!131267 () Bool)

(declare-fun e!172645 () Bool)

(assert (=> b!266968 (=> (not res!131267) (not e!172645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12927 (_ BitVec 32)) Bool)

(assert (=> b!266968 (= res!131267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266969 () Bool)

(declare-fun res!131264 () Bool)

(assert (=> b!266969 (=> (not res!131264) (not e!172646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266969 (= res!131264 (validKeyInArray!0 k!2698))))

(declare-fun b!266970 () Bool)

(assert (=> b!266970 (= e!172645 false)))

(declare-fun lt!134580 () Bool)

(declare-datatypes ((List!3932 0))(
  ( (Nil!3929) (Cons!3928 (h!4595 (_ BitVec 64)) (t!9014 List!3932)) )
))
(declare-fun arrayNoDuplicates!0 (array!12927 (_ BitVec 32) List!3932) Bool)

(assert (=> b!266970 (= lt!134580 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3929))))

(declare-fun b!266971 () Bool)

(declare-fun res!131263 () Bool)

(assert (=> b!266971 (=> (not res!131263) (not e!172646))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266971 (= res!131263 (and (= (size!6470 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6470 a!3436))))))

(declare-fun b!266972 () Bool)

(assert (=> b!266972 (= e!172646 e!172645)))

(declare-fun res!131266 () Bool)

(assert (=> b!266972 (=> (not res!131266) (not e!172645))))

(declare-datatypes ((SeekEntryResult!1309 0))(
  ( (MissingZero!1309 (index!7406 (_ BitVec 32))) (Found!1309 (index!7407 (_ BitVec 32))) (Intermediate!1309 (undefined!2121 Bool) (index!7408 (_ BitVec 32)) (x!25698 (_ BitVec 32))) (Undefined!1309) (MissingVacant!1309 (index!7409 (_ BitVec 32))) )
))
(declare-fun lt!134581 () SeekEntryResult!1309)

(assert (=> b!266972 (= res!131266 (or (= lt!134581 (MissingZero!1309 i!1355)) (= lt!134581 (MissingVacant!1309 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12927 (_ BitVec 32)) SeekEntryResult!1309)

(assert (=> b!266972 (= lt!134581 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(assert (= (and start!25748 res!131268) b!266971))

(assert (= (and b!266971 res!131263) b!266969))

(assert (= (and b!266969 res!131264) b!266967))

(assert (= (and b!266967 res!131265) b!266972))

(assert (= (and b!266972 res!131266) b!266968))

(assert (= (and b!266968 res!131267) b!266970))

(declare-fun m!283441 () Bool)

(assert (=> b!266970 m!283441))

(declare-fun m!283443 () Bool)

(assert (=> b!266967 m!283443))

(declare-fun m!283445 () Bool)

(assert (=> b!266968 m!283445))

(declare-fun m!283447 () Bool)

(assert (=> start!25748 m!283447))

(declare-fun m!283449 () Bool)

(assert (=> start!25748 m!283449))

(declare-fun m!283451 () Bool)

(assert (=> b!266969 m!283451))

(declare-fun m!283453 () Bool)

(assert (=> b!266972 m!283453))

(push 1)

(assert (not b!266969))

(assert (not b!266968))

(assert (not b!266972))

(assert (not b!266967))

(assert (not b!266970))

