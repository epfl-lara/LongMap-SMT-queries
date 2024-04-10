; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25678 () Bool)

(assert start!25678)

(declare-fun b!266260 () Bool)

(declare-fun res!130557 () Bool)

(declare-fun e!172331 () Bool)

(assert (=> b!266260 (=> (not res!130557) (not e!172331))))

(declare-datatypes ((array!12857 0))(
  ( (array!12858 (arr!6083 (Array (_ BitVec 32) (_ BitVec 64))) (size!6435 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12857)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266260 (= res!130557 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266261 () Bool)

(declare-fun res!130556 () Bool)

(assert (=> b!266261 (=> (not res!130556) (not e!172331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266261 (= res!130556 (validKeyInArray!0 k!2698))))

(declare-fun b!266262 () Bool)

(declare-fun res!130562 () Bool)

(declare-fun e!172330 () Bool)

(assert (=> b!266262 (=> (not res!130562) (not e!172330))))

(declare-datatypes ((List!3897 0))(
  ( (Nil!3894) (Cons!3893 (h!4560 (_ BitVec 64)) (t!8979 List!3897)) )
))
(declare-fun arrayNoDuplicates!0 (array!12857 (_ BitVec 32) List!3897) Bool)

(assert (=> b!266262 (= res!130562 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3894))))

(declare-fun b!266263 () Bool)

(declare-fun res!130563 () Bool)

(assert (=> b!266263 (=> (not res!130563) (not e!172331))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266263 (= res!130563 (and (= (size!6435 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6435 a!3436))))))

(declare-fun res!130559 () Bool)

(assert (=> start!25678 (=> (not res!130559) (not e!172331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25678 (= res!130559 (validMask!0 mask!4002))))

(assert (=> start!25678 e!172331))

(assert (=> start!25678 true))

(declare-fun array_inv!4046 (array!12857) Bool)

(assert (=> start!25678 (array_inv!4046 a!3436)))

(declare-fun b!266264 () Bool)

(declare-fun res!130558 () Bool)

(assert (=> b!266264 (=> (not res!130558) (not e!172330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12857 (_ BitVec 32)) Bool)

(assert (=> b!266264 (= res!130558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266265 () Bool)

(assert (=> b!266265 (= e!172330 (not true))))

(assert (=> b!266265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12858 (store (arr!6083 a!3436) i!1355 k!2698) (size!6435 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8269 0))(
  ( (Unit!8270) )
))
(declare-fun lt!134380 () Unit!8269)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8269)

(assert (=> b!266265 (= lt!134380 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266266 () Bool)

(declare-fun res!130560 () Bool)

(assert (=> b!266266 (=> (not res!130560) (not e!172330))))

(assert (=> b!266266 (= res!130560 (bvslt #b00000000000000000000000000000000 (size!6435 a!3436)))))

(declare-fun b!266267 () Bool)

(assert (=> b!266267 (= e!172331 e!172330)))

(declare-fun res!130561 () Bool)

(assert (=> b!266267 (=> (not res!130561) (not e!172330))))

(declare-datatypes ((SeekEntryResult!1274 0))(
  ( (MissingZero!1274 (index!7266 (_ BitVec 32))) (Found!1274 (index!7267 (_ BitVec 32))) (Intermediate!1274 (undefined!2086 Bool) (index!7268 (_ BitVec 32)) (x!25575 (_ BitVec 32))) (Undefined!1274) (MissingVacant!1274 (index!7269 (_ BitVec 32))) )
))
(declare-fun lt!134379 () SeekEntryResult!1274)

(assert (=> b!266267 (= res!130561 (or (= lt!134379 (MissingZero!1274 i!1355)) (= lt!134379 (MissingVacant!1274 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12857 (_ BitVec 32)) SeekEntryResult!1274)

(assert (=> b!266267 (= lt!134379 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(assert (= (and start!25678 res!130559) b!266263))

(assert (= (and b!266263 res!130563) b!266261))

(assert (= (and b!266261 res!130556) b!266260))

(assert (= (and b!266260 res!130557) b!266267))

(assert (= (and b!266267 res!130561) b!266264))

(assert (= (and b!266264 res!130558) b!266262))

(assert (= (and b!266262 res!130562) b!266266))

(assert (= (and b!266266 res!130560) b!266265))

(declare-fun m!282879 () Bool)

(assert (=> b!266267 m!282879))

(declare-fun m!282881 () Bool)

(assert (=> start!25678 m!282881))

(declare-fun m!282883 () Bool)

(assert (=> start!25678 m!282883))

(declare-fun m!282885 () Bool)

(assert (=> b!266264 m!282885))

(declare-fun m!282887 () Bool)

(assert (=> b!266261 m!282887))

(declare-fun m!282889 () Bool)

(assert (=> b!266265 m!282889))

(declare-fun m!282891 () Bool)

(assert (=> b!266265 m!282891))

(declare-fun m!282893 () Bool)

(assert (=> b!266265 m!282893))

(declare-fun m!282895 () Bool)

(assert (=> b!266262 m!282895))

(declare-fun m!282897 () Bool)

(assert (=> b!266260 m!282897))

(push 1)

(assert (not start!25678))

(assert (not b!266261))

(assert (not b!266267))

(assert (not b!266264))

(assert (not b!266260))

(assert (not b!266265))

(assert (not b!266262))

(check-sat)

