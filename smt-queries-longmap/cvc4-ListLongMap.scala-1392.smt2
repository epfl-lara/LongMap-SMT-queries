; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27208 () Bool)

(assert start!27208)

(declare-fun res!144705 () Bool)

(declare-fun e!178956 () Bool)

(assert (=> start!27208 (=> (not res!144705) (not e!178956))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27208 (= res!144705 (validMask!0 mask!3868))))

(assert (=> start!27208 e!178956))

(declare-datatypes ((array!14026 0))(
  ( (array!14027 (arr!6655 (Array (_ BitVec 32) (_ BitVec 64))) (size!7007 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14026)

(declare-fun array_inv!4618 (array!14026) Bool)

(assert (=> start!27208 (array_inv!4618 a!3325)))

(assert (=> start!27208 true))

(declare-fun b!281634 () Bool)

(declare-fun e!178957 () Bool)

(assert (=> b!281634 (= e!178957 (not true))))

(declare-fun lt!139129 () array!14026)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1813 0))(
  ( (MissingZero!1813 (index!9422 (_ BitVec 32))) (Found!1813 (index!9423 (_ BitVec 32))) (Intermediate!1813 (undefined!2625 Bool) (index!9424 (_ BitVec 32)) (x!27643 (_ BitVec 32))) (Undefined!1813) (MissingVacant!1813 (index!9425 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14026 (_ BitVec 32)) SeekEntryResult!1813)

(assert (=> b!281634 (= (seekEntryOrOpen!0 (select (arr!6655 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6655 a!3325) i!1267 k!2581) startIndex!26) lt!139129 mask!3868))))

(declare-datatypes ((Unit!8910 0))(
  ( (Unit!8911) )
))
(declare-fun lt!139128 () Unit!8910)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14026 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8910)

(assert (=> b!281634 (= lt!139128 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4463 0))(
  ( (Nil!4460) (Cons!4459 (h!5129 (_ BitVec 64)) (t!9545 List!4463)) )
))
(declare-fun arrayNoDuplicates!0 (array!14026 (_ BitVec 32) List!4463) Bool)

(assert (=> b!281634 (arrayNoDuplicates!0 lt!139129 #b00000000000000000000000000000000 Nil!4460)))

(declare-fun lt!139126 () Unit!8910)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14026 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4463) Unit!8910)

(assert (=> b!281634 (= lt!139126 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4460))))

(declare-fun b!281635 () Bool)

(declare-fun res!144706 () Bool)

(assert (=> b!281635 (=> (not res!144706) (not e!178956))))

(declare-fun arrayContainsKey!0 (array!14026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281635 (= res!144706 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281636 () Bool)

(declare-fun e!178955 () Bool)

(assert (=> b!281636 (= e!178955 e!178957)))

(declare-fun res!144708 () Bool)

(assert (=> b!281636 (=> (not res!144708) (not e!178957))))

(assert (=> b!281636 (= res!144708 (not (= startIndex!26 i!1267)))))

(assert (=> b!281636 (= lt!139129 (array!14027 (store (arr!6655 a!3325) i!1267 k!2581) (size!7007 a!3325)))))

(declare-fun b!281637 () Bool)

(declare-fun res!144710 () Bool)

(assert (=> b!281637 (=> (not res!144710) (not e!178956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281637 (= res!144710 (validKeyInArray!0 k!2581))))

(declare-fun b!281638 () Bool)

(declare-fun res!144711 () Bool)

(assert (=> b!281638 (=> (not res!144711) (not e!178957))))

(assert (=> b!281638 (= res!144711 (validKeyInArray!0 (select (arr!6655 a!3325) startIndex!26)))))

(declare-fun b!281639 () Bool)

(declare-fun res!144709 () Bool)

(assert (=> b!281639 (=> (not res!144709) (not e!178956))))

(assert (=> b!281639 (= res!144709 (and (= (size!7007 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7007 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7007 a!3325))))))

(declare-fun b!281640 () Bool)

(declare-fun res!144707 () Bool)

(assert (=> b!281640 (=> (not res!144707) (not e!178955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14026 (_ BitVec 32)) Bool)

(assert (=> b!281640 (= res!144707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281641 () Bool)

(declare-fun res!144703 () Bool)

(assert (=> b!281641 (=> (not res!144703) (not e!178956))))

(assert (=> b!281641 (= res!144703 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4460))))

(declare-fun b!281642 () Bool)

(assert (=> b!281642 (= e!178956 e!178955)))

(declare-fun res!144704 () Bool)

(assert (=> b!281642 (=> (not res!144704) (not e!178955))))

(declare-fun lt!139127 () SeekEntryResult!1813)

(assert (=> b!281642 (= res!144704 (or (= lt!139127 (MissingZero!1813 i!1267)) (= lt!139127 (MissingVacant!1813 i!1267))))))

(assert (=> b!281642 (= lt!139127 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27208 res!144705) b!281639))

(assert (= (and b!281639 res!144709) b!281637))

(assert (= (and b!281637 res!144710) b!281641))

(assert (= (and b!281641 res!144703) b!281635))

(assert (= (and b!281635 res!144706) b!281642))

(assert (= (and b!281642 res!144704) b!281640))

(assert (= (and b!281640 res!144707) b!281636))

(assert (= (and b!281636 res!144708) b!281638))

(assert (= (and b!281638 res!144711) b!281634))

(declare-fun m!295975 () Bool)

(assert (=> b!281637 m!295975))

(declare-fun m!295977 () Bool)

(assert (=> b!281642 m!295977))

(declare-fun m!295979 () Bool)

(assert (=> b!281640 m!295979))

(declare-fun m!295981 () Bool)

(assert (=> b!281634 m!295981))

(declare-fun m!295983 () Bool)

(assert (=> b!281634 m!295983))

(assert (=> b!281634 m!295983))

(declare-fun m!295985 () Bool)

(assert (=> b!281634 m!295985))

(declare-fun m!295987 () Bool)

(assert (=> b!281634 m!295987))

(declare-fun m!295989 () Bool)

(assert (=> b!281634 m!295989))

(declare-fun m!295991 () Bool)

(assert (=> b!281634 m!295991))

(declare-fun m!295993 () Bool)

(assert (=> b!281634 m!295993))

(assert (=> b!281634 m!295989))

(declare-fun m!295995 () Bool)

(assert (=> b!281634 m!295995))

(assert (=> b!281638 m!295989))

(assert (=> b!281638 m!295989))

(declare-fun m!295997 () Bool)

(assert (=> b!281638 m!295997))

(declare-fun m!295999 () Bool)

(assert (=> start!27208 m!295999))

(declare-fun m!296001 () Bool)

(assert (=> start!27208 m!296001))

(declare-fun m!296003 () Bool)

(assert (=> b!281635 m!296003))

(assert (=> b!281636 m!295987))

(declare-fun m!296005 () Bool)

(assert (=> b!281641 m!296005))

(push 1)

(assert (not b!281641))

(assert (not b!281640))

(assert (not b!281638))

(assert (not b!281635))

(assert (not b!281634))

(assert (not b!281637))

