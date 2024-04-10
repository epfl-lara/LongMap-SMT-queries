; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25950 () Bool)

(assert start!25950)

(declare-fun b!267864 () Bool)

(declare-fun res!132146 () Bool)

(declare-fun e!173134 () Bool)

(assert (=> b!267864 (=> (not res!132146) (not e!173134))))

(declare-datatypes ((array!13047 0))(
  ( (array!13048 (arr!6173 (Array (_ BitVec 32) (_ BitVec 64))) (size!6525 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13047)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267864 (= res!132146 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267865 () Bool)

(declare-fun res!132143 () Bool)

(assert (=> b!267865 (=> (not res!132143) (not e!173134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267865 (= res!132143 (validKeyInArray!0 k!2581))))

(declare-fun res!132144 () Bool)

(assert (=> start!25950 (=> (not res!132144) (not e!173134))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25950 (= res!132144 (validMask!0 mask!3868))))

(assert (=> start!25950 e!173134))

(declare-fun array_inv!4136 (array!13047) Bool)

(assert (=> start!25950 (array_inv!4136 a!3325)))

(assert (=> start!25950 true))

(declare-fun b!267866 () Bool)

(assert (=> b!267866 (= e!173134 (bvslt mask!3868 #b00000000000000000000000000000000))))

(declare-fun b!267867 () Bool)

(declare-fun res!132145 () Bool)

(assert (=> b!267867 (=> (not res!132145) (not e!173134))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1331 0))(
  ( (MissingZero!1331 (index!7494 (_ BitVec 32))) (Found!1331 (index!7495 (_ BitVec 32))) (Intermediate!1331 (undefined!2143 Bool) (index!7496 (_ BitVec 32)) (x!25872 (_ BitVec 32))) (Undefined!1331) (MissingVacant!1331 (index!7497 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13047 (_ BitVec 32)) SeekEntryResult!1331)

(assert (=> b!267867 (= res!132145 (not (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) (MissingZero!1331 i!1267))))))

(declare-fun b!267868 () Bool)

(declare-fun res!132142 () Bool)

(assert (=> b!267868 (=> (not res!132142) (not e!173134))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267868 (= res!132142 (and (= (size!6525 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6525 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6525 a!3325))))))

(declare-fun b!267869 () Bool)

(declare-fun res!132147 () Bool)

(assert (=> b!267869 (=> (not res!132147) (not e!173134))))

(declare-datatypes ((List!3981 0))(
  ( (Nil!3978) (Cons!3977 (h!4644 (_ BitVec 64)) (t!9063 List!3981)) )
))
(declare-fun arrayNoDuplicates!0 (array!13047 (_ BitVec 32) List!3981) Bool)

(assert (=> b!267869 (= res!132147 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3978))))

(assert (= (and start!25950 res!132144) b!267868))

(assert (= (and b!267868 res!132142) b!267865))

(assert (= (and b!267865 res!132143) b!267869))

(assert (= (and b!267869 res!132147) b!267864))

(assert (= (and b!267864 res!132146) b!267867))

(assert (= (and b!267867 res!132145) b!267866))

(declare-fun m!284127 () Bool)

(assert (=> b!267865 m!284127))

(declare-fun m!284129 () Bool)

(assert (=> b!267869 m!284129))

(declare-fun m!284131 () Bool)

(assert (=> start!25950 m!284131))

(declare-fun m!284133 () Bool)

(assert (=> start!25950 m!284133))

(declare-fun m!284135 () Bool)

(assert (=> b!267864 m!284135))

(declare-fun m!284137 () Bool)

(assert (=> b!267867 m!284137))

(push 1)

(assert (not start!25950))

(assert (not b!267869))

(assert (not b!267867))

(assert (not b!267864))

(assert (not b!267865))

(check-sat)

