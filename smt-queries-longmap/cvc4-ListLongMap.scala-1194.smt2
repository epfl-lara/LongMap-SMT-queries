; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25634 () Bool)

(assert start!25634)

(declare-fun b!265860 () Bool)

(declare-fun e!172133 () Bool)

(assert (=> b!265860 (= e!172133 false)))

(declare-fun lt!134247 () Bool)

(declare-datatypes ((array!12813 0))(
  ( (array!12814 (arr!6061 (Array (_ BitVec 32) (_ BitVec 64))) (size!6413 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12813)

(declare-datatypes ((List!3875 0))(
  ( (Nil!3872) (Cons!3871 (h!4538 (_ BitVec 64)) (t!8957 List!3875)) )
))
(declare-fun arrayNoDuplicates!0 (array!12813 (_ BitVec 32) List!3875) Bool)

(assert (=> b!265860 (= lt!134247 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3872))))

(declare-fun b!265861 () Bool)

(declare-fun res!130158 () Bool)

(declare-fun e!172131 () Bool)

(assert (=> b!265861 (=> (not res!130158) (not e!172131))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265861 (= res!130158 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!130156 () Bool)

(assert (=> start!25634 (=> (not res!130156) (not e!172131))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25634 (= res!130156 (validMask!0 mask!4002))))

(assert (=> start!25634 e!172131))

(assert (=> start!25634 true))

(declare-fun array_inv!4024 (array!12813) Bool)

(assert (=> start!25634 (array_inv!4024 a!3436)))

(declare-fun b!265862 () Bool)

(declare-fun res!130159 () Bool)

(assert (=> b!265862 (=> (not res!130159) (not e!172133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12813 (_ BitVec 32)) Bool)

(assert (=> b!265862 (= res!130159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265863 () Bool)

(assert (=> b!265863 (= e!172131 e!172133)))

(declare-fun res!130161 () Bool)

(assert (=> b!265863 (=> (not res!130161) (not e!172133))))

(declare-datatypes ((SeekEntryResult!1252 0))(
  ( (MissingZero!1252 (index!7178 (_ BitVec 32))) (Found!1252 (index!7179 (_ BitVec 32))) (Intermediate!1252 (undefined!2064 Bool) (index!7180 (_ BitVec 32)) (x!25489 (_ BitVec 32))) (Undefined!1252) (MissingVacant!1252 (index!7181 (_ BitVec 32))) )
))
(declare-fun lt!134248 () SeekEntryResult!1252)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265863 (= res!130161 (or (= lt!134248 (MissingZero!1252 i!1355)) (= lt!134248 (MissingVacant!1252 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12813 (_ BitVec 32)) SeekEntryResult!1252)

(assert (=> b!265863 (= lt!134248 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265864 () Bool)

(declare-fun res!130160 () Bool)

(assert (=> b!265864 (=> (not res!130160) (not e!172131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265864 (= res!130160 (validKeyInArray!0 k!2698))))

(declare-fun b!265865 () Bool)

(declare-fun res!130157 () Bool)

(assert (=> b!265865 (=> (not res!130157) (not e!172131))))

(assert (=> b!265865 (= res!130157 (and (= (size!6413 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6413 a!3436))))))

(assert (= (and start!25634 res!130156) b!265865))

(assert (= (and b!265865 res!130157) b!265864))

(assert (= (and b!265864 res!130160) b!265861))

(assert (= (and b!265861 res!130158) b!265863))

(assert (= (and b!265863 res!130161) b!265862))

(assert (= (and b!265862 res!130159) b!265860))

(declare-fun m!282571 () Bool)

(assert (=> b!265864 m!282571))

(declare-fun m!282573 () Bool)

(assert (=> b!265863 m!282573))

(declare-fun m!282575 () Bool)

(assert (=> b!265861 m!282575))

(declare-fun m!282577 () Bool)

(assert (=> start!25634 m!282577))

(declare-fun m!282579 () Bool)

(assert (=> start!25634 m!282579))

(declare-fun m!282581 () Bool)

(assert (=> b!265862 m!282581))

(declare-fun m!282583 () Bool)

(assert (=> b!265860 m!282583))

(push 1)

(assert (not b!265860))

(assert (not b!265863))

(assert (not b!265861))

(assert (not b!265864))

(assert (not start!25634))

(assert (not b!265862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

