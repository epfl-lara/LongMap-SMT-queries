; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25652 () Bool)

(assert start!25652)

(declare-fun b!266022 () Bool)

(declare-fun e!172212 () Bool)

(declare-fun e!172213 () Bool)

(assert (=> b!266022 (= e!172212 e!172213)))

(declare-fun res!130323 () Bool)

(assert (=> b!266022 (=> (not res!130323) (not e!172213))))

(declare-datatypes ((SeekEntryResult!1261 0))(
  ( (MissingZero!1261 (index!7214 (_ BitVec 32))) (Found!1261 (index!7215 (_ BitVec 32))) (Intermediate!1261 (undefined!2073 Bool) (index!7216 (_ BitVec 32)) (x!25522 (_ BitVec 32))) (Undefined!1261) (MissingVacant!1261 (index!7217 (_ BitVec 32))) )
))
(declare-fun lt!134301 () SeekEntryResult!1261)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266022 (= res!130323 (or (= lt!134301 (MissingZero!1261 i!1355)) (= lt!134301 (MissingVacant!1261 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12831 0))(
  ( (array!12832 (arr!6070 (Array (_ BitVec 32) (_ BitVec 64))) (size!6422 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12831)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12831 (_ BitVec 32)) SeekEntryResult!1261)

(assert (=> b!266022 (= lt!134301 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266023 () Bool)

(declare-fun res!130320 () Bool)

(assert (=> b!266023 (=> (not res!130320) (not e!172212))))

(assert (=> b!266023 (= res!130320 (and (= (size!6422 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6422 a!3436))))))

(declare-fun b!266024 () Bool)

(declare-fun res!130322 () Bool)

(assert (=> b!266024 (=> (not res!130322) (not e!172212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266024 (= res!130322 (validKeyInArray!0 k!2698))))

(declare-fun b!266025 () Bool)

(declare-fun res!130319 () Bool)

(assert (=> b!266025 (=> (not res!130319) (not e!172213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12831 (_ BitVec 32)) Bool)

(assert (=> b!266025 (= res!130319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130321 () Bool)

(assert (=> start!25652 (=> (not res!130321) (not e!172212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25652 (= res!130321 (validMask!0 mask!4002))))

(assert (=> start!25652 e!172212))

(assert (=> start!25652 true))

(declare-fun array_inv!4033 (array!12831) Bool)

(assert (=> start!25652 (array_inv!4033 a!3436)))

(declare-fun b!266026 () Bool)

(assert (=> b!266026 (= e!172213 false)))

(declare-fun lt!134302 () Bool)

(declare-datatypes ((List!3884 0))(
  ( (Nil!3881) (Cons!3880 (h!4547 (_ BitVec 64)) (t!8966 List!3884)) )
))
(declare-fun arrayNoDuplicates!0 (array!12831 (_ BitVec 32) List!3884) Bool)

(assert (=> b!266026 (= lt!134302 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3881))))

(declare-fun b!266027 () Bool)

(declare-fun res!130318 () Bool)

(assert (=> b!266027 (=> (not res!130318) (not e!172212))))

(declare-fun arrayContainsKey!0 (array!12831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266027 (= res!130318 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25652 res!130321) b!266023))

(assert (= (and b!266023 res!130320) b!266024))

(assert (= (and b!266024 res!130322) b!266027))

(assert (= (and b!266027 res!130318) b!266022))

(assert (= (and b!266022 res!130323) b!266025))

(assert (= (and b!266025 res!130319) b!266026))

(declare-fun m!282697 () Bool)

(assert (=> start!25652 m!282697))

(declare-fun m!282699 () Bool)

(assert (=> start!25652 m!282699))

(declare-fun m!282701 () Bool)

(assert (=> b!266024 m!282701))

(declare-fun m!282703 () Bool)

(assert (=> b!266026 m!282703))

(declare-fun m!282705 () Bool)

(assert (=> b!266025 m!282705))

(declare-fun m!282707 () Bool)

(assert (=> b!266027 m!282707))

(declare-fun m!282709 () Bool)

(assert (=> b!266022 m!282709))

(push 1)

