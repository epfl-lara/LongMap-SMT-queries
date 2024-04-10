; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25632 () Bool)

(assert start!25632)

(declare-fun b!265842 () Bool)

(declare-fun e!172124 () Bool)

(declare-fun e!172122 () Bool)

(assert (=> b!265842 (= e!172124 e!172122)))

(declare-fun res!130142 () Bool)

(assert (=> b!265842 (=> (not res!130142) (not e!172122))))

(declare-datatypes ((SeekEntryResult!1251 0))(
  ( (MissingZero!1251 (index!7174 (_ BitVec 32))) (Found!1251 (index!7175 (_ BitVec 32))) (Intermediate!1251 (undefined!2063 Bool) (index!7176 (_ BitVec 32)) (x!25488 (_ BitVec 32))) (Undefined!1251) (MissingVacant!1251 (index!7177 (_ BitVec 32))) )
))
(declare-fun lt!134242 () SeekEntryResult!1251)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265842 (= res!130142 (or (= lt!134242 (MissingZero!1251 i!1355)) (= lt!134242 (MissingVacant!1251 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12811 0))(
  ( (array!12812 (arr!6060 (Array (_ BitVec 32) (_ BitVec 64))) (size!6412 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12811)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12811 (_ BitVec 32)) SeekEntryResult!1251)

(assert (=> b!265842 (= lt!134242 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265843 () Bool)

(declare-fun res!130143 () Bool)

(assert (=> b!265843 (=> (not res!130143) (not e!172124))))

(assert (=> b!265843 (= res!130143 (and (= (size!6412 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6412 a!3436))))))

(declare-fun res!130139 () Bool)

(assert (=> start!25632 (=> (not res!130139) (not e!172124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25632 (= res!130139 (validMask!0 mask!4002))))

(assert (=> start!25632 e!172124))

(assert (=> start!25632 true))

(declare-fun array_inv!4023 (array!12811) Bool)

(assert (=> start!25632 (array_inv!4023 a!3436)))

(declare-fun b!265844 () Bool)

(assert (=> b!265844 (= e!172122 false)))

(declare-fun lt!134241 () Bool)

(declare-datatypes ((List!3874 0))(
  ( (Nil!3871) (Cons!3870 (h!4537 (_ BitVec 64)) (t!8956 List!3874)) )
))
(declare-fun arrayNoDuplicates!0 (array!12811 (_ BitVec 32) List!3874) Bool)

(assert (=> b!265844 (= lt!134241 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3871))))

(declare-fun b!265845 () Bool)

(declare-fun res!130140 () Bool)

(assert (=> b!265845 (=> (not res!130140) (not e!172124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265845 (= res!130140 (validKeyInArray!0 k0!2698))))

(declare-fun b!265846 () Bool)

(declare-fun res!130141 () Bool)

(assert (=> b!265846 (=> (not res!130141) (not e!172124))))

(declare-fun arrayContainsKey!0 (array!12811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265846 (= res!130141 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265847 () Bool)

(declare-fun res!130138 () Bool)

(assert (=> b!265847 (=> (not res!130138) (not e!172122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12811 (_ BitVec 32)) Bool)

(assert (=> b!265847 (= res!130138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25632 res!130139) b!265843))

(assert (= (and b!265843 res!130143) b!265845))

(assert (= (and b!265845 res!130140) b!265846))

(assert (= (and b!265846 res!130141) b!265842))

(assert (= (and b!265842 res!130142) b!265847))

(assert (= (and b!265847 res!130138) b!265844))

(declare-fun m!282557 () Bool)

(assert (=> start!25632 m!282557))

(declare-fun m!282559 () Bool)

(assert (=> start!25632 m!282559))

(declare-fun m!282561 () Bool)

(assert (=> b!265845 m!282561))

(declare-fun m!282563 () Bool)

(assert (=> b!265842 m!282563))

(declare-fun m!282565 () Bool)

(assert (=> b!265846 m!282565))

(declare-fun m!282567 () Bool)

(assert (=> b!265847 m!282567))

(declare-fun m!282569 () Bool)

(assert (=> b!265844 m!282569))

(check-sat (not b!265845) (not b!265844) (not start!25632) (not b!265846) (not b!265847) (not b!265842))
