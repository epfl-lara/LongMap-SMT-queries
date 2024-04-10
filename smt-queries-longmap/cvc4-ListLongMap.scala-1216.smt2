; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25766 () Bool)

(assert start!25766)

(declare-fun b!267130 () Bool)

(declare-fun res!131426 () Bool)

(declare-fun e!172727 () Bool)

(assert (=> b!267130 (=> (not res!131426) (not e!172727))))

(declare-datatypes ((array!12945 0))(
  ( (array!12946 (arr!6127 (Array (_ BitVec 32) (_ BitVec 64))) (size!6479 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12945)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12945 (_ BitVec 32)) Bool)

(assert (=> b!267130 (= res!131426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267131 () Bool)

(declare-fun e!172726 () Bool)

(assert (=> b!267131 (= e!172726 e!172727)))

(declare-fun res!131428 () Bool)

(assert (=> b!267131 (=> (not res!131428) (not e!172727))))

(declare-datatypes ((SeekEntryResult!1318 0))(
  ( (MissingZero!1318 (index!7442 (_ BitVec 32))) (Found!1318 (index!7443 (_ BitVec 32))) (Intermediate!1318 (undefined!2130 Bool) (index!7444 (_ BitVec 32)) (x!25731 (_ BitVec 32))) (Undefined!1318) (MissingVacant!1318 (index!7445 (_ BitVec 32))) )
))
(declare-fun lt!134634 () SeekEntryResult!1318)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267131 (= res!131428 (or (= lt!134634 (MissingZero!1318 i!1355)) (= lt!134634 (MissingVacant!1318 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12945 (_ BitVec 32)) SeekEntryResult!1318)

(assert (=> b!267131 (= lt!134634 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!267132 () Bool)

(declare-fun res!131430 () Bool)

(assert (=> b!267132 (=> (not res!131430) (not e!172726))))

(declare-fun arrayContainsKey!0 (array!12945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267132 (= res!131430 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267133 () Bool)

(declare-fun res!131429 () Bool)

(assert (=> b!267133 (=> (not res!131429) (not e!172726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267133 (= res!131429 (validKeyInArray!0 k!2698))))

(declare-fun b!267134 () Bool)

(assert (=> b!267134 (= e!172727 false)))

(declare-fun lt!134635 () Bool)

(declare-datatypes ((List!3941 0))(
  ( (Nil!3938) (Cons!3937 (h!4604 (_ BitVec 64)) (t!9023 List!3941)) )
))
(declare-fun arrayNoDuplicates!0 (array!12945 (_ BitVec 32) List!3941) Bool)

(assert (=> b!267134 (= lt!134635 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3938))))

(declare-fun res!131427 () Bool)

(assert (=> start!25766 (=> (not res!131427) (not e!172726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25766 (= res!131427 (validMask!0 mask!4002))))

(assert (=> start!25766 e!172726))

(assert (=> start!25766 true))

(declare-fun array_inv!4090 (array!12945) Bool)

(assert (=> start!25766 (array_inv!4090 a!3436)))

(declare-fun b!267129 () Bool)

(declare-fun res!131425 () Bool)

(assert (=> b!267129 (=> (not res!131425) (not e!172726))))

(assert (=> b!267129 (= res!131425 (and (= (size!6479 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6479 a!3436))))))

(assert (= (and start!25766 res!131427) b!267129))

(assert (= (and b!267129 res!131425) b!267133))

(assert (= (and b!267133 res!131429) b!267132))

(assert (= (and b!267132 res!131430) b!267131))

(assert (= (and b!267131 res!131428) b!267130))

(assert (= (and b!267130 res!131426) b!267134))

(declare-fun m!283567 () Bool)

(assert (=> b!267131 m!283567))

(declare-fun m!283569 () Bool)

(assert (=> b!267133 m!283569))

(declare-fun m!283571 () Bool)

(assert (=> start!25766 m!283571))

(declare-fun m!283573 () Bool)

(assert (=> start!25766 m!283573))

(declare-fun m!283575 () Bool)

(assert (=> b!267132 m!283575))

(declare-fun m!283577 () Bool)

(assert (=> b!267134 m!283577))

(declare-fun m!283579 () Bool)

(assert (=> b!267130 m!283579))

(push 1)

(assert (not start!25766))

(assert (not b!267131))

(assert (not b!267132))

(assert (not b!267130))

