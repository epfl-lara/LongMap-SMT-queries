; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25694 () Bool)

(assert start!25694)

(declare-fun b!266452 () Bool)

(declare-fun res!130754 () Bool)

(declare-fun e!172402 () Bool)

(assert (=> b!266452 (=> (not res!130754) (not e!172402))))

(declare-datatypes ((array!12873 0))(
  ( (array!12874 (arr!6091 (Array (_ BitVec 32) (_ BitVec 64))) (size!6443 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12873)

(declare-datatypes ((List!3905 0))(
  ( (Nil!3902) (Cons!3901 (h!4568 (_ BitVec 64)) (t!8987 List!3905)) )
))
(declare-fun arrayNoDuplicates!0 (array!12873 (_ BitVec 32) List!3905) Bool)

(assert (=> b!266452 (= res!130754 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3902))))

(declare-fun b!266453 () Bool)

(declare-fun res!130751 () Bool)

(assert (=> b!266453 (=> (not res!130751) (not e!172402))))

(assert (=> b!266453 (= res!130751 (bvslt #b00000000000000000000000000000000 (size!6443 a!3436)))))

(declare-fun b!266454 () Bool)

(assert (=> b!266454 (= e!172402 (not true))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12873 (_ BitVec 32)) Bool)

(assert (=> b!266454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12874 (store (arr!6091 a!3436) i!1355 k!2698) (size!6443 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8285 0))(
  ( (Unit!8286) )
))
(declare-fun lt!134427 () Unit!8285)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8285)

(assert (=> b!266454 (= lt!134427 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266455 () Bool)

(declare-fun e!172403 () Bool)

(assert (=> b!266455 (= e!172403 e!172402)))

(declare-fun res!130752 () Bool)

(assert (=> b!266455 (=> (not res!130752) (not e!172402))))

(declare-datatypes ((SeekEntryResult!1282 0))(
  ( (MissingZero!1282 (index!7298 (_ BitVec 32))) (Found!1282 (index!7299 (_ BitVec 32))) (Intermediate!1282 (undefined!2094 Bool) (index!7300 (_ BitVec 32)) (x!25599 (_ BitVec 32))) (Undefined!1282) (MissingVacant!1282 (index!7301 (_ BitVec 32))) )
))
(declare-fun lt!134428 () SeekEntryResult!1282)

(assert (=> b!266455 (= res!130752 (or (= lt!134428 (MissingZero!1282 i!1355)) (= lt!134428 (MissingVacant!1282 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12873 (_ BitVec 32)) SeekEntryResult!1282)

(assert (=> b!266455 (= lt!134428 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266456 () Bool)

(declare-fun res!130750 () Bool)

(assert (=> b!266456 (=> (not res!130750) (not e!172402))))

(assert (=> b!266456 (= res!130750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266457 () Bool)

(declare-fun res!130753 () Bool)

(assert (=> b!266457 (=> (not res!130753) (not e!172403))))

(assert (=> b!266457 (= res!130753 (and (= (size!6443 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6443 a!3436))))))

(declare-fun b!266458 () Bool)

(declare-fun res!130748 () Bool)

(assert (=> b!266458 (=> (not res!130748) (not e!172403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266458 (= res!130748 (validKeyInArray!0 k!2698))))

(declare-fun res!130749 () Bool)

(assert (=> start!25694 (=> (not res!130749) (not e!172403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25694 (= res!130749 (validMask!0 mask!4002))))

(assert (=> start!25694 e!172403))

(assert (=> start!25694 true))

(declare-fun array_inv!4054 (array!12873) Bool)

(assert (=> start!25694 (array_inv!4054 a!3436)))

(declare-fun b!266459 () Bool)

(declare-fun res!130755 () Bool)

(assert (=> b!266459 (=> (not res!130755) (not e!172403))))

(declare-fun arrayContainsKey!0 (array!12873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266459 (= res!130755 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25694 res!130749) b!266457))

(assert (= (and b!266457 res!130753) b!266458))

(assert (= (and b!266458 res!130748) b!266459))

(assert (= (and b!266459 res!130755) b!266455))

(assert (= (and b!266455 res!130752) b!266456))

(assert (= (and b!266456 res!130750) b!266452))

(assert (= (and b!266452 res!130754) b!266453))

(assert (= (and b!266453 res!130751) b!266454))

(declare-fun m!283039 () Bool)

(assert (=> start!25694 m!283039))

(declare-fun m!283041 () Bool)

(assert (=> start!25694 m!283041))

(declare-fun m!283043 () Bool)

(assert (=> b!266455 m!283043))

(declare-fun m!283045 () Bool)

(assert (=> b!266458 m!283045))

(declare-fun m!283047 () Bool)

(assert (=> b!266452 m!283047))

(declare-fun m!283049 () Bool)

(assert (=> b!266459 m!283049))

(declare-fun m!283051 () Bool)

(assert (=> b!266456 m!283051))

(declare-fun m!283053 () Bool)

(assert (=> b!266454 m!283053))

(declare-fun m!283055 () Bool)

(assert (=> b!266454 m!283055))

(declare-fun m!283057 () Bool)

(assert (=> b!266454 m!283057))

(push 1)

(assert (not b!266455))

(assert (not b!266452))

(assert (not b!266458))

(assert (not start!25694))

(assert (not b!266454))

(assert (not b!266459))

(assert (not b!266456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

