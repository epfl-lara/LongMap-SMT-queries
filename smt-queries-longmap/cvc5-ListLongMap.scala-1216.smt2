; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25762 () Bool)

(assert start!25762)

(declare-fun b!267093 () Bool)

(declare-fun res!131392 () Bool)

(declare-fun e!172707 () Bool)

(assert (=> b!267093 (=> (not res!131392) (not e!172707))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267093 (= res!131392 (validKeyInArray!0 k!2698))))

(declare-fun b!267094 () Bool)

(declare-fun e!172709 () Bool)

(assert (=> b!267094 (= e!172707 e!172709)))

(declare-fun res!131391 () Bool)

(assert (=> b!267094 (=> (not res!131391) (not e!172709))))

(declare-datatypes ((SeekEntryResult!1316 0))(
  ( (MissingZero!1316 (index!7434 (_ BitVec 32))) (Found!1316 (index!7435 (_ BitVec 32))) (Intermediate!1316 (undefined!2128 Bool) (index!7436 (_ BitVec 32)) (x!25729 (_ BitVec 32))) (Undefined!1316) (MissingVacant!1316 (index!7437 (_ BitVec 32))) )
))
(declare-fun lt!134622 () SeekEntryResult!1316)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267094 (= res!131391 (or (= lt!134622 (MissingZero!1316 i!1355)) (= lt!134622 (MissingVacant!1316 i!1355))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-datatypes ((array!12941 0))(
  ( (array!12942 (arr!6125 (Array (_ BitVec 32) (_ BitVec 64))) (size!6477 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12941)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12941 (_ BitVec 32)) SeekEntryResult!1316)

(assert (=> b!267094 (= lt!134622 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!267095 () Bool)

(declare-fun res!131390 () Bool)

(assert (=> b!267095 (=> (not res!131390) (not e!172709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12941 (_ BitVec 32)) Bool)

(assert (=> b!267095 (= res!131390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267097 () Bool)

(declare-fun res!131393 () Bool)

(assert (=> b!267097 (=> (not res!131393) (not e!172707))))

(assert (=> b!267097 (= res!131393 (and (= (size!6477 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6477 a!3436))))))

(declare-fun b!267098 () Bool)

(assert (=> b!267098 (= e!172709 false)))

(declare-fun lt!134623 () Bool)

(declare-datatypes ((List!3939 0))(
  ( (Nil!3936) (Cons!3935 (h!4602 (_ BitVec 64)) (t!9021 List!3939)) )
))
(declare-fun arrayNoDuplicates!0 (array!12941 (_ BitVec 32) List!3939) Bool)

(assert (=> b!267098 (= lt!134623 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3936))))

(declare-fun b!267096 () Bool)

(declare-fun res!131394 () Bool)

(assert (=> b!267096 (=> (not res!131394) (not e!172707))))

(declare-fun arrayContainsKey!0 (array!12941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267096 (= res!131394 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!131389 () Bool)

(assert (=> start!25762 (=> (not res!131389) (not e!172707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25762 (= res!131389 (validMask!0 mask!4002))))

(assert (=> start!25762 e!172707))

(assert (=> start!25762 true))

(declare-fun array_inv!4088 (array!12941) Bool)

(assert (=> start!25762 (array_inv!4088 a!3436)))

(assert (= (and start!25762 res!131389) b!267097))

(assert (= (and b!267097 res!131393) b!267093))

(assert (= (and b!267093 res!131392) b!267096))

(assert (= (and b!267096 res!131394) b!267094))

(assert (= (and b!267094 res!131391) b!267095))

(assert (= (and b!267095 res!131390) b!267098))

(declare-fun m!283539 () Bool)

(assert (=> b!267094 m!283539))

(declare-fun m!283541 () Bool)

(assert (=> b!267096 m!283541))

(declare-fun m!283543 () Bool)

(assert (=> b!267093 m!283543))

(declare-fun m!283545 () Bool)

(assert (=> b!267098 m!283545))

(declare-fun m!283547 () Bool)

(assert (=> b!267095 m!283547))

(declare-fun m!283549 () Bool)

(assert (=> start!25762 m!283549))

(declare-fun m!283551 () Bool)

(assert (=> start!25762 m!283551))

(push 1)

