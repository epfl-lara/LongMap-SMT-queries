; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25466 () Bool)

(assert start!25466)

(declare-fun b!265062 () Bool)

(declare-fun res!129578 () Bool)

(declare-fun e!171657 () Bool)

(assert (=> b!265062 (=> (not res!129578) (not e!171657))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265062 (= res!129578 (validKeyInArray!0 k!2698))))

(declare-fun b!265064 () Bool)

(declare-fun res!129579 () Bool)

(assert (=> b!265064 (=> (not res!129579) (not e!171657))))

(declare-datatypes ((array!12762 0))(
  ( (array!12763 (arr!6040 (Array (_ BitVec 32) (_ BitVec 64))) (size!6392 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12762)

(declare-fun arrayContainsKey!0 (array!12762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265064 (= res!129579 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265065 () Bool)

(declare-fun e!171658 () Bool)

(assert (=> b!265065 (= e!171657 e!171658)))

(declare-fun res!129574 () Bool)

(assert (=> b!265065 (=> (not res!129574) (not e!171658))))

(declare-datatypes ((SeekEntryResult!1231 0))(
  ( (MissingZero!1231 (index!7094 (_ BitVec 32))) (Found!1231 (index!7095 (_ BitVec 32))) (Intermediate!1231 (undefined!2043 Bool) (index!7096 (_ BitVec 32)) (x!25412 (_ BitVec 32))) (Undefined!1231) (MissingVacant!1231 (index!7097 (_ BitVec 32))) )
))
(declare-fun lt!133966 () SeekEntryResult!1231)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265065 (= res!129574 (or (= lt!133966 (MissingZero!1231 i!1355)) (= lt!133966 (MissingVacant!1231 i!1355))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12762 (_ BitVec 32)) SeekEntryResult!1231)

(assert (=> b!265065 (= lt!133966 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265063 () Bool)

(declare-fun res!129577 () Bool)

(assert (=> b!265063 (=> (not res!129577) (not e!171658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12762 (_ BitVec 32)) Bool)

(assert (=> b!265063 (= res!129577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!129576 () Bool)

(assert (=> start!25466 (=> (not res!129576) (not e!171657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25466 (= res!129576 (validMask!0 mask!4002))))

(assert (=> start!25466 e!171657))

(assert (=> start!25466 true))

(declare-fun array_inv!4003 (array!12762) Bool)

(assert (=> start!25466 (array_inv!4003 a!3436)))

(declare-fun b!265066 () Bool)

(declare-fun res!129575 () Bool)

(assert (=> b!265066 (=> (not res!129575) (not e!171657))))

(assert (=> b!265066 (= res!129575 (and (= (size!6392 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6392 a!3436))))))

(declare-fun b!265067 () Bool)

(assert (=> b!265067 (= e!171658 (and (bvsle #b00000000000000000000000000000000 (size!6392 a!3436)) (bvsge (size!6392 a!3436) #b01111111111111111111111111111111)))))

(assert (= (and start!25466 res!129576) b!265066))

(assert (= (and b!265066 res!129575) b!265062))

(assert (= (and b!265062 res!129578) b!265064))

(assert (= (and b!265064 res!129579) b!265065))

(assert (= (and b!265065 res!129574) b!265063))

(assert (= (and b!265063 res!129577) b!265067))

(declare-fun m!281985 () Bool)

(assert (=> b!265063 m!281985))

(declare-fun m!281987 () Bool)

(assert (=> start!25466 m!281987))

(declare-fun m!281989 () Bool)

(assert (=> start!25466 m!281989))

(declare-fun m!281991 () Bool)

(assert (=> b!265062 m!281991))

(declare-fun m!281993 () Bool)

(assert (=> b!265065 m!281993))

(declare-fun m!281995 () Bool)

(assert (=> b!265064 m!281995))

(push 1)

(assert (not b!265063))

(assert (not start!25466))

(assert (not b!265065))

(assert (not b!265064))

(assert (not b!265062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

