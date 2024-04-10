; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25664 () Bool)

(assert start!25664)

(declare-fun b!266130 () Bool)

(declare-fun res!130426 () Bool)

(declare-fun e!172266 () Bool)

(assert (=> b!266130 (=> (not res!130426) (not e!172266))))

(declare-datatypes ((array!12843 0))(
  ( (array!12844 (arr!6076 (Array (_ BitVec 32) (_ BitVec 64))) (size!6428 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12843)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266130 (= res!130426 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266131 () Bool)

(declare-fun res!130431 () Bool)

(assert (=> b!266131 (=> (not res!130431) (not e!172266))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266131 (= res!130431 (and (= (size!6428 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6428 a!3436))))))

(declare-fun b!266132 () Bool)

(declare-fun e!172267 () Bool)

(assert (=> b!266132 (= e!172267 false)))

(declare-fun lt!134338 () Bool)

(declare-datatypes ((List!3890 0))(
  ( (Nil!3887) (Cons!3886 (h!4553 (_ BitVec 64)) (t!8972 List!3890)) )
))
(declare-fun arrayNoDuplicates!0 (array!12843 (_ BitVec 32) List!3890) Bool)

(assert (=> b!266132 (= lt!134338 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3887))))

(declare-fun b!266133 () Bool)

(assert (=> b!266133 (= e!172266 e!172267)))

(declare-fun res!130428 () Bool)

(assert (=> b!266133 (=> (not res!130428) (not e!172267))))

(declare-datatypes ((SeekEntryResult!1267 0))(
  ( (MissingZero!1267 (index!7238 (_ BitVec 32))) (Found!1267 (index!7239 (_ BitVec 32))) (Intermediate!1267 (undefined!2079 Bool) (index!7240 (_ BitVec 32)) (x!25544 (_ BitVec 32))) (Undefined!1267) (MissingVacant!1267 (index!7241 (_ BitVec 32))) )
))
(declare-fun lt!134337 () SeekEntryResult!1267)

(assert (=> b!266133 (= res!130428 (or (= lt!134337 (MissingZero!1267 i!1355)) (= lt!134337 (MissingVacant!1267 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12843 (_ BitVec 32)) SeekEntryResult!1267)

(assert (=> b!266133 (= lt!134337 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266134 () Bool)

(declare-fun res!130429 () Bool)

(assert (=> b!266134 (=> (not res!130429) (not e!172267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12843 (_ BitVec 32)) Bool)

(assert (=> b!266134 (= res!130429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130430 () Bool)

(assert (=> start!25664 (=> (not res!130430) (not e!172266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25664 (= res!130430 (validMask!0 mask!4002))))

(assert (=> start!25664 e!172266))

(assert (=> start!25664 true))

(declare-fun array_inv!4039 (array!12843) Bool)

(assert (=> start!25664 (array_inv!4039 a!3436)))

(declare-fun b!266135 () Bool)

(declare-fun res!130427 () Bool)

(assert (=> b!266135 (=> (not res!130427) (not e!172266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266135 (= res!130427 (validKeyInArray!0 k!2698))))

(assert (= (and start!25664 res!130430) b!266131))

(assert (= (and b!266131 res!130431) b!266135))

(assert (= (and b!266135 res!130427) b!266130))

(assert (= (and b!266130 res!130426) b!266133))

(assert (= (and b!266133 res!130428) b!266134))

(assert (= (and b!266134 res!130429) b!266132))

(declare-fun m!282781 () Bool)

(assert (=> start!25664 m!282781))

(declare-fun m!282783 () Bool)

(assert (=> start!25664 m!282783))

(declare-fun m!282785 () Bool)

(assert (=> b!266132 m!282785))

(declare-fun m!282787 () Bool)

(assert (=> b!266134 m!282787))

(declare-fun m!282789 () Bool)

(assert (=> b!266135 m!282789))

(declare-fun m!282791 () Bool)

(assert (=> b!266130 m!282791))

(declare-fun m!282793 () Bool)

(assert (=> b!266133 m!282793))

(push 1)

(assert (not b!266130))

(assert (not b!266132))

(assert (not b!266134))

(assert (not b!266133))

(assert (not b!266135))

(assert (not start!25664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

