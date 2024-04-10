; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25648 () Bool)

(assert start!25648)

(declare-fun b!265986 () Bool)

(declare-fun res!130285 () Bool)

(declare-fun e!172194 () Bool)

(assert (=> b!265986 (=> (not res!130285) (not e!172194))))

(declare-datatypes ((array!12827 0))(
  ( (array!12828 (arr!6068 (Array (_ BitVec 32) (_ BitVec 64))) (size!6420 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12827)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265986 (= res!130285 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265988 () Bool)

(declare-fun e!172195 () Bool)

(assert (=> b!265988 (= e!172194 e!172195)))

(declare-fun res!130282 () Bool)

(assert (=> b!265988 (=> (not res!130282) (not e!172195))))

(declare-datatypes ((SeekEntryResult!1259 0))(
  ( (MissingZero!1259 (index!7206 (_ BitVec 32))) (Found!1259 (index!7207 (_ BitVec 32))) (Intermediate!1259 (undefined!2071 Bool) (index!7208 (_ BitVec 32)) (x!25520 (_ BitVec 32))) (Undefined!1259) (MissingVacant!1259 (index!7209 (_ BitVec 32))) )
))
(declare-fun lt!134290 () SeekEntryResult!1259)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265988 (= res!130282 (or (= lt!134290 (MissingZero!1259 i!1355)) (= lt!134290 (MissingVacant!1259 i!1355))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12827 (_ BitVec 32)) SeekEntryResult!1259)

(assert (=> b!265988 (= lt!134290 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265989 () Bool)

(declare-fun res!130283 () Bool)

(assert (=> b!265989 (=> (not res!130283) (not e!172194))))

(assert (=> b!265989 (= res!130283 (and (= (size!6420 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6420 a!3436))))))

(declare-fun b!265990 () Bool)

(declare-fun res!130287 () Bool)

(assert (=> b!265990 (=> (not res!130287) (not e!172195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12827 (_ BitVec 32)) Bool)

(assert (=> b!265990 (= res!130287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265991 () Bool)

(assert (=> b!265991 (= e!172195 false)))

(declare-fun lt!134289 () Bool)

(declare-datatypes ((List!3882 0))(
  ( (Nil!3879) (Cons!3878 (h!4545 (_ BitVec 64)) (t!8964 List!3882)) )
))
(declare-fun arrayNoDuplicates!0 (array!12827 (_ BitVec 32) List!3882) Bool)

(assert (=> b!265991 (= lt!134289 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3879))))

(declare-fun b!265987 () Bool)

(declare-fun res!130284 () Bool)

(assert (=> b!265987 (=> (not res!130284) (not e!172194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265987 (= res!130284 (validKeyInArray!0 k!2698))))

(declare-fun res!130286 () Bool)

(assert (=> start!25648 (=> (not res!130286) (not e!172194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25648 (= res!130286 (validMask!0 mask!4002))))

(assert (=> start!25648 e!172194))

(assert (=> start!25648 true))

(declare-fun array_inv!4031 (array!12827) Bool)

(assert (=> start!25648 (array_inv!4031 a!3436)))

(assert (= (and start!25648 res!130286) b!265989))

(assert (= (and b!265989 res!130283) b!265987))

(assert (= (and b!265987 res!130284) b!265986))

(assert (= (and b!265986 res!130285) b!265988))

(assert (= (and b!265988 res!130282) b!265990))

(assert (= (and b!265990 res!130287) b!265991))

(declare-fun m!282669 () Bool)

(assert (=> start!25648 m!282669))

(declare-fun m!282671 () Bool)

(assert (=> start!25648 m!282671))

(declare-fun m!282673 () Bool)

(assert (=> b!265988 m!282673))

(declare-fun m!282675 () Bool)

(assert (=> b!265991 m!282675))

(declare-fun m!282677 () Bool)

(assert (=> b!265990 m!282677))

(declare-fun m!282679 () Bool)

(assert (=> b!265986 m!282679))

(declare-fun m!282681 () Bool)

(assert (=> b!265987 m!282681))

(push 1)

