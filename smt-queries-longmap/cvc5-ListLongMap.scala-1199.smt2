; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25660 () Bool)

(assert start!25660)

(declare-fun b!266094 () Bool)

(declare-fun e!172249 () Bool)

(declare-fun e!172248 () Bool)

(assert (=> b!266094 (= e!172249 e!172248)))

(declare-fun res!130392 () Bool)

(assert (=> b!266094 (=> (not res!130392) (not e!172248))))

(declare-datatypes ((SeekEntryResult!1265 0))(
  ( (MissingZero!1265 (index!7230 (_ BitVec 32))) (Found!1265 (index!7231 (_ BitVec 32))) (Intermediate!1265 (undefined!2077 Bool) (index!7232 (_ BitVec 32)) (x!25542 (_ BitVec 32))) (Undefined!1265) (MissingVacant!1265 (index!7233 (_ BitVec 32))) )
))
(declare-fun lt!134325 () SeekEntryResult!1265)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266094 (= res!130392 (or (= lt!134325 (MissingZero!1265 i!1355)) (= lt!134325 (MissingVacant!1265 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12839 0))(
  ( (array!12840 (arr!6074 (Array (_ BitVec 32) (_ BitVec 64))) (size!6426 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12839)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12839 (_ BitVec 32)) SeekEntryResult!1265)

(assert (=> b!266094 (= lt!134325 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266095 () Bool)

(declare-fun res!130390 () Bool)

(assert (=> b!266095 (=> (not res!130390) (not e!172248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12839 (_ BitVec 32)) Bool)

(assert (=> b!266095 (= res!130390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130394 () Bool)

(assert (=> start!25660 (=> (not res!130394) (not e!172249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25660 (= res!130394 (validMask!0 mask!4002))))

(assert (=> start!25660 e!172249))

(assert (=> start!25660 true))

(declare-fun array_inv!4037 (array!12839) Bool)

(assert (=> start!25660 (array_inv!4037 a!3436)))

(declare-fun b!266096 () Bool)

(declare-fun res!130395 () Bool)

(assert (=> b!266096 (=> (not res!130395) (not e!172249))))

(assert (=> b!266096 (= res!130395 (and (= (size!6426 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6426 a!3436))))))

(declare-fun b!266097 () Bool)

(declare-fun res!130393 () Bool)

(assert (=> b!266097 (=> (not res!130393) (not e!172249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266097 (= res!130393 (validKeyInArray!0 k!2698))))

(declare-fun b!266098 () Bool)

(assert (=> b!266098 (= e!172248 false)))

(declare-fun lt!134326 () Bool)

(declare-datatypes ((List!3888 0))(
  ( (Nil!3885) (Cons!3884 (h!4551 (_ BitVec 64)) (t!8970 List!3888)) )
))
(declare-fun arrayNoDuplicates!0 (array!12839 (_ BitVec 32) List!3888) Bool)

(assert (=> b!266098 (= lt!134326 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3885))))

(declare-fun b!266099 () Bool)

(declare-fun res!130391 () Bool)

(assert (=> b!266099 (=> (not res!130391) (not e!172249))))

(declare-fun arrayContainsKey!0 (array!12839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266099 (= res!130391 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25660 res!130394) b!266096))

(assert (= (and b!266096 res!130395) b!266097))

(assert (= (and b!266097 res!130393) b!266099))

(assert (= (and b!266099 res!130391) b!266094))

(assert (= (and b!266094 res!130392) b!266095))

(assert (= (and b!266095 res!130390) b!266098))

(declare-fun m!282753 () Bool)

(assert (=> b!266095 m!282753))

(declare-fun m!282755 () Bool)

(assert (=> start!25660 m!282755))

(declare-fun m!282757 () Bool)

(assert (=> start!25660 m!282757))

(declare-fun m!282759 () Bool)

(assert (=> b!266097 m!282759))

(declare-fun m!282761 () Bool)

(assert (=> b!266099 m!282761))

(declare-fun m!282763 () Bool)

(assert (=> b!266098 m!282763))

(declare-fun m!282765 () Bool)

(assert (=> b!266094 m!282765))

(push 1)

(assert (not start!25660))

(assert (not b!266097))

(assert (not b!266099))

(assert (not b!266095))

(assert (not b!266094))

(assert (not b!266098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

