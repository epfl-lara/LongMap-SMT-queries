; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25726 () Bool)

(assert start!25726)

(declare-fun b!266760 () Bool)

(declare-fun res!131060 () Bool)

(declare-fun e!172545 () Bool)

(assert (=> b!266760 (=> (not res!131060) (not e!172545))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266760 (= res!131060 (validKeyInArray!0 k!2698))))

(declare-fun b!266761 () Bool)

(declare-fun res!131061 () Bool)

(assert (=> b!266761 (=> (not res!131061) (not e!172545))))

(declare-datatypes ((array!12905 0))(
  ( (array!12906 (arr!6107 (Array (_ BitVec 32) (_ BitVec 64))) (size!6459 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12905)

(declare-fun arrayContainsKey!0 (array!12905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266761 (= res!131061 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!131056 () Bool)

(assert (=> start!25726 (=> (not res!131056) (not e!172545))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25726 (= res!131056 (validMask!0 mask!4002))))

(assert (=> start!25726 e!172545))

(assert (=> start!25726 true))

(declare-fun array_inv!4070 (array!12905) Bool)

(assert (=> start!25726 (array_inv!4070 a!3436)))

(declare-fun b!266762 () Bool)

(declare-fun res!131059 () Bool)

(declare-fun e!172546 () Bool)

(assert (=> b!266762 (=> (not res!131059) (not e!172546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12905 (_ BitVec 32)) Bool)

(assert (=> b!266762 (= res!131059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266763 () Bool)

(assert (=> b!266763 (= e!172546 false)))

(declare-fun lt!134524 () Bool)

(declare-datatypes ((List!3921 0))(
  ( (Nil!3918) (Cons!3917 (h!4584 (_ BitVec 64)) (t!9003 List!3921)) )
))
(declare-fun arrayNoDuplicates!0 (array!12905 (_ BitVec 32) List!3921) Bool)

(assert (=> b!266763 (= lt!134524 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3918))))

(declare-fun b!266764 () Bool)

(assert (=> b!266764 (= e!172545 e!172546)))

(declare-fun res!131057 () Bool)

(assert (=> b!266764 (=> (not res!131057) (not e!172546))))

(declare-datatypes ((SeekEntryResult!1298 0))(
  ( (MissingZero!1298 (index!7362 (_ BitVec 32))) (Found!1298 (index!7363 (_ BitVec 32))) (Intermediate!1298 (undefined!2110 Bool) (index!7364 (_ BitVec 32)) (x!25663 (_ BitVec 32))) (Undefined!1298) (MissingVacant!1298 (index!7365 (_ BitVec 32))) )
))
(declare-fun lt!134523 () SeekEntryResult!1298)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266764 (= res!131057 (or (= lt!134523 (MissingZero!1298 i!1355)) (= lt!134523 (MissingVacant!1298 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12905 (_ BitVec 32)) SeekEntryResult!1298)

(assert (=> b!266764 (= lt!134523 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266765 () Bool)

(declare-fun res!131058 () Bool)

(assert (=> b!266765 (=> (not res!131058) (not e!172545))))

(assert (=> b!266765 (= res!131058 (and (= (size!6459 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6459 a!3436))))))

(assert (= (and start!25726 res!131056) b!266765))

(assert (= (and b!266765 res!131058) b!266760))

(assert (= (and b!266760 res!131060) b!266761))

(assert (= (and b!266761 res!131061) b!266764))

(assert (= (and b!266764 res!131057) b!266762))

(assert (= (and b!266762 res!131059) b!266763))

(declare-fun m!283287 () Bool)

(assert (=> b!266764 m!283287))

(declare-fun m!283289 () Bool)

(assert (=> start!25726 m!283289))

(declare-fun m!283291 () Bool)

(assert (=> start!25726 m!283291))

(declare-fun m!283293 () Bool)

(assert (=> b!266763 m!283293))

(declare-fun m!283295 () Bool)

(assert (=> b!266762 m!283295))

(declare-fun m!283297 () Bool)

(assert (=> b!266761 m!283297))

(declare-fun m!283299 () Bool)

(assert (=> b!266760 m!283299))

(push 1)

