; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25882 () Bool)

(assert start!25882)

(declare-fun res!131880 () Bool)

(declare-fun e!172991 () Bool)

(assert (=> start!25882 (=> (not res!131880) (not e!172991))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25882 (= res!131880 (validMask!0 mask!3868))))

(assert (=> start!25882 e!172991))

(declare-datatypes ((array!12999 0))(
  ( (array!13000 (arr!6150 (Array (_ BitVec 32) (_ BitVec 64))) (size!6502 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12999)

(declare-fun array_inv!4100 (array!12999) Bool)

(assert (=> start!25882 (array_inv!4100 a!3325)))

(assert (=> start!25882 true))

(declare-fun b!267608 () Bool)

(declare-fun res!131878 () Bool)

(assert (=> b!267608 (=> (not res!131878) (not e!172991))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267608 (= res!131878 (and (= (size!6502 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6502 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6502 a!3325))))))

(declare-fun b!267609 () Bool)

(declare-fun res!131879 () Bool)

(assert (=> b!267609 (=> (not res!131879) (not e!172991))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267609 (= res!131879 (validKeyInArray!0 k!2581))))

(declare-fun b!267610 () Bool)

(assert (=> b!267610 (= e!172991 false)))

(declare-fun lt!134769 () Bool)

(declare-datatypes ((List!3871 0))(
  ( (Nil!3868) (Cons!3867 (h!4534 (_ BitVec 64)) (t!8945 List!3871)) )
))
(declare-fun arrayNoDuplicates!0 (array!12999 (_ BitVec 32) List!3871) Bool)

(assert (=> b!267610 (= lt!134769 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3868))))

(assert (= (and start!25882 res!131880) b!267608))

(assert (= (and b!267608 res!131878) b!267609))

(assert (= (and b!267609 res!131879) b!267610))

(declare-fun m!284115 () Bool)

(assert (=> start!25882 m!284115))

(declare-fun m!284117 () Bool)

(assert (=> start!25882 m!284117))

(declare-fun m!284119 () Bool)

(assert (=> b!267609 m!284119))

(declare-fun m!284121 () Bool)

(assert (=> b!267610 m!284121))

(push 1)

(assert (not b!267610))

(assert (not start!25882))

(assert (not b!267609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

