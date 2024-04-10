; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25738 () Bool)

(assert start!25738)

(declare-fun b!266877 () Bool)

(declare-fun res!131173 () Bool)

(declare-fun e!172601 () Bool)

(assert (=> b!266877 (=> (not res!131173) (not e!172601))))

(declare-datatypes ((array!12917 0))(
  ( (array!12918 (arr!6113 (Array (_ BitVec 32) (_ BitVec 64))) (size!6465 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12917)

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun mask!4002 () (_ BitVec 32))

(assert (=> b!266877 (= res!131173 (and (= (size!6465 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6465 a!3436))))))

(declare-fun b!266878 () Bool)

(declare-fun res!131176 () Bool)

(assert (=> b!266878 (=> (not res!131176) (not e!172601))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266878 (= res!131176 (validKeyInArray!0 k!2698))))

(declare-fun b!266879 () Bool)

(declare-fun res!131174 () Bool)

(assert (=> b!266879 (=> (not res!131174) (not e!172601))))

(declare-fun arrayContainsKey!0 (array!12917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266879 (= res!131174 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266881 () Bool)

(declare-fun res!131178 () Bool)

(declare-fun e!172599 () Bool)

(assert (=> b!266881 (=> (not res!131178) (not e!172599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12917 (_ BitVec 32)) Bool)

(assert (=> b!266881 (= res!131178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266882 () Bool)

(assert (=> b!266882 (= e!172601 e!172599)))

(declare-fun res!131177 () Bool)

(assert (=> b!266882 (=> (not res!131177) (not e!172599))))

(declare-datatypes ((SeekEntryResult!1304 0))(
  ( (MissingZero!1304 (index!7386 (_ BitVec 32))) (Found!1304 (index!7387 (_ BitVec 32))) (Intermediate!1304 (undefined!2116 Bool) (index!7388 (_ BitVec 32)) (x!25685 (_ BitVec 32))) (Undefined!1304) (MissingVacant!1304 (index!7389 (_ BitVec 32))) )
))
(declare-fun lt!134551 () SeekEntryResult!1304)

(assert (=> b!266882 (= res!131177 (or (= lt!134551 (MissingZero!1304 i!1355)) (= lt!134551 (MissingVacant!1304 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12917 (_ BitVec 32)) SeekEntryResult!1304)

(assert (=> b!266882 (= lt!134551 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266880 () Bool)

(assert (=> b!266880 (= e!172599 false)))

(declare-fun lt!134550 () Bool)

(declare-datatypes ((List!3927 0))(
  ( (Nil!3924) (Cons!3923 (h!4590 (_ BitVec 64)) (t!9009 List!3927)) )
))
(declare-fun arrayNoDuplicates!0 (array!12917 (_ BitVec 32) List!3927) Bool)

(assert (=> b!266880 (= lt!134550 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3924))))

(declare-fun res!131175 () Bool)

(assert (=> start!25738 (=> (not res!131175) (not e!172601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25738 (= res!131175 (validMask!0 mask!4002))))

(assert (=> start!25738 e!172601))

(assert (=> start!25738 true))

(declare-fun array_inv!4076 (array!12917) Bool)

(assert (=> start!25738 (array_inv!4076 a!3436)))

(assert (= (and start!25738 res!131175) b!266877))

(assert (= (and b!266877 res!131173) b!266878))

(assert (= (and b!266878 res!131176) b!266879))

(assert (= (and b!266879 res!131174) b!266882))

(assert (= (and b!266882 res!131177) b!266881))

(assert (= (and b!266881 res!131178) b!266880))

(declare-fun m!283371 () Bool)

(assert (=> b!266879 m!283371))

(declare-fun m!283373 () Bool)

(assert (=> start!25738 m!283373))

(declare-fun m!283375 () Bool)

(assert (=> start!25738 m!283375))

(declare-fun m!283377 () Bool)

(assert (=> b!266882 m!283377))

(declare-fun m!283379 () Bool)

(assert (=> b!266878 m!283379))

(declare-fun m!283381 () Bool)

(assert (=> b!266881 m!283381))

(declare-fun m!283383 () Bool)

(assert (=> b!266880 m!283383))

(push 1)

