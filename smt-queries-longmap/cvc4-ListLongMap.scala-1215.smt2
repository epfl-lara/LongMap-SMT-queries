; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25760 () Bool)

(assert start!25760)

(declare-fun b!267075 () Bool)

(declare-fun res!131372 () Bool)

(declare-fun e!172700 () Bool)

(assert (=> b!267075 (=> (not res!131372) (not e!172700))))

(declare-datatypes ((array!12939 0))(
  ( (array!12940 (arr!6124 (Array (_ BitVec 32) (_ BitVec 64))) (size!6476 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12939)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267075 (= res!131372 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267076 () Bool)

(declare-fun res!131371 () Bool)

(assert (=> b!267076 (=> (not res!131371) (not e!172700))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267076 (= res!131371 (and (= (size!6476 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6476 a!3436))))))

(declare-fun b!267077 () Bool)

(declare-fun e!172698 () Bool)

(assert (=> b!267077 (= e!172698 false)))

(declare-fun lt!134616 () Bool)

(declare-datatypes ((List!3938 0))(
  ( (Nil!3935) (Cons!3934 (h!4601 (_ BitVec 64)) (t!9020 List!3938)) )
))
(declare-fun arrayNoDuplicates!0 (array!12939 (_ BitVec 32) List!3938) Bool)

(assert (=> b!267077 (= lt!134616 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3935))))

(declare-fun b!267078 () Bool)

(declare-fun res!131373 () Bool)

(assert (=> b!267078 (=> (not res!131373) (not e!172700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267078 (= res!131373 (validKeyInArray!0 k!2698))))

(declare-fun b!267079 () Bool)

(declare-fun res!131375 () Bool)

(assert (=> b!267079 (=> (not res!131375) (not e!172698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12939 (_ BitVec 32)) Bool)

(assert (=> b!267079 (= res!131375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267080 () Bool)

(assert (=> b!267080 (= e!172700 e!172698)))

(declare-fun res!131376 () Bool)

(assert (=> b!267080 (=> (not res!131376) (not e!172698))))

(declare-datatypes ((SeekEntryResult!1315 0))(
  ( (MissingZero!1315 (index!7430 (_ BitVec 32))) (Found!1315 (index!7431 (_ BitVec 32))) (Intermediate!1315 (undefined!2127 Bool) (index!7432 (_ BitVec 32)) (x!25720 (_ BitVec 32))) (Undefined!1315) (MissingVacant!1315 (index!7433 (_ BitVec 32))) )
))
(declare-fun lt!134617 () SeekEntryResult!1315)

(assert (=> b!267080 (= res!131376 (or (= lt!134617 (MissingZero!1315 i!1355)) (= lt!134617 (MissingVacant!1315 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12939 (_ BitVec 32)) SeekEntryResult!1315)

(assert (=> b!267080 (= lt!134617 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun res!131374 () Bool)

(assert (=> start!25760 (=> (not res!131374) (not e!172700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25760 (= res!131374 (validMask!0 mask!4002))))

(assert (=> start!25760 e!172700))

(assert (=> start!25760 true))

(declare-fun array_inv!4087 (array!12939) Bool)

(assert (=> start!25760 (array_inv!4087 a!3436)))

(assert (= (and start!25760 res!131374) b!267076))

(assert (= (and b!267076 res!131371) b!267078))

(assert (= (and b!267078 res!131373) b!267075))

(assert (= (and b!267075 res!131372) b!267080))

(assert (= (and b!267080 res!131376) b!267079))

(assert (= (and b!267079 res!131375) b!267077))

(declare-fun m!283525 () Bool)

(assert (=> b!267079 m!283525))

(declare-fun m!283527 () Bool)

(assert (=> b!267080 m!283527))

(declare-fun m!283529 () Bool)

(assert (=> start!25760 m!283529))

(declare-fun m!283531 () Bool)

(assert (=> start!25760 m!283531))

(declare-fun m!283533 () Bool)

(assert (=> b!267078 m!283533))

(declare-fun m!283535 () Bool)

(assert (=> b!267075 m!283535))

(declare-fun m!283537 () Bool)

(assert (=> b!267077 m!283537))

(push 1)

(assert (not b!267078))

(assert (not b!267077))

(assert (not b!267080))

(assert (not start!25760))

(assert (not b!267075))

