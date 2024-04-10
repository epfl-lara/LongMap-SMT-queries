; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25780 () Bool)

(assert start!25780)

(declare-fun b!267277 () Bool)

(declare-fun e!172789 () Bool)

(assert (=> b!267277 (= e!172789 (not true))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12959 0))(
  ( (array!12960 (arr!6134 (Array (_ BitVec 32) (_ BitVec 64))) (size!6486 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12959)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12959 (_ BitVec 32)) Bool)

(assert (=> b!267277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12960 (store (arr!6134 a!3436) i!1355 k!2698) (size!6486 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8299 0))(
  ( (Unit!8300) )
))
(declare-fun lt!134677 () Unit!8299)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12959 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8299)

(assert (=> b!267277 (= lt!134677 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!267278 () Bool)

(declare-fun res!131574 () Bool)

(assert (=> b!267278 (=> (not res!131574) (not e!172789))))

(declare-datatypes ((List!3948 0))(
  ( (Nil!3945) (Cons!3944 (h!4611 (_ BitVec 64)) (t!9030 List!3948)) )
))
(declare-fun arrayNoDuplicates!0 (array!12959 (_ BitVec 32) List!3948) Bool)

(assert (=> b!267278 (= res!131574 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3945))))

(declare-fun b!267279 () Bool)

(declare-fun res!131580 () Bool)

(declare-fun e!172788 () Bool)

(assert (=> b!267279 (=> (not res!131580) (not e!172788))))

(declare-fun arrayContainsKey!0 (array!12959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267279 (= res!131580 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!131579 () Bool)

(assert (=> start!25780 (=> (not res!131579) (not e!172788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25780 (= res!131579 (validMask!0 mask!4002))))

(assert (=> start!25780 e!172788))

(assert (=> start!25780 true))

(declare-fun array_inv!4097 (array!12959) Bool)

(assert (=> start!25780 (array_inv!4097 a!3436)))

(declare-fun b!267280 () Bool)

(declare-fun res!131575 () Bool)

(assert (=> b!267280 (=> (not res!131575) (not e!172788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267280 (= res!131575 (validKeyInArray!0 k!2698))))

(declare-fun b!267281 () Bool)

(declare-fun res!131576 () Bool)

(assert (=> b!267281 (=> (not res!131576) (not e!172789))))

(assert (=> b!267281 (= res!131576 (bvslt #b00000000000000000000000000000000 (size!6486 a!3436)))))

(declare-fun b!267282 () Bool)

(assert (=> b!267282 (= e!172788 e!172789)))

(declare-fun res!131577 () Bool)

(assert (=> b!267282 (=> (not res!131577) (not e!172789))))

(declare-datatypes ((SeekEntryResult!1325 0))(
  ( (MissingZero!1325 (index!7470 (_ BitVec 32))) (Found!1325 (index!7471 (_ BitVec 32))) (Intermediate!1325 (undefined!2137 Bool) (index!7472 (_ BitVec 32)) (x!25762 (_ BitVec 32))) (Undefined!1325) (MissingVacant!1325 (index!7473 (_ BitVec 32))) )
))
(declare-fun lt!134676 () SeekEntryResult!1325)

(assert (=> b!267282 (= res!131577 (or (= lt!134676 (MissingZero!1325 i!1355)) (= lt!134676 (MissingVacant!1325 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12959 (_ BitVec 32)) SeekEntryResult!1325)

(assert (=> b!267282 (= lt!134676 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!267283 () Bool)

(declare-fun res!131573 () Bool)

(assert (=> b!267283 (=> (not res!131573) (not e!172788))))

(assert (=> b!267283 (= res!131573 (and (= (size!6486 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6486 a!3436))))))

(declare-fun b!267284 () Bool)

(declare-fun res!131578 () Bool)

(assert (=> b!267284 (=> (not res!131578) (not e!172789))))

(assert (=> b!267284 (= res!131578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25780 res!131579) b!267283))

(assert (= (and b!267283 res!131573) b!267280))

(assert (= (and b!267280 res!131575) b!267279))

(assert (= (and b!267279 res!131580) b!267282))

(assert (= (and b!267282 res!131577) b!267284))

(assert (= (and b!267284 res!131578) b!267278))

(assert (= (and b!267278 res!131574) b!267281))

(assert (= (and b!267281 res!131576) b!267277))

(declare-fun m!283683 () Bool)

(assert (=> b!267280 m!283683))

(declare-fun m!283685 () Bool)

(assert (=> start!25780 m!283685))

(declare-fun m!283687 () Bool)

(assert (=> start!25780 m!283687))

(declare-fun m!283689 () Bool)

(assert (=> b!267279 m!283689))

(declare-fun m!283691 () Bool)

(assert (=> b!267282 m!283691))

(declare-fun m!283693 () Bool)

(assert (=> b!267277 m!283693))

(declare-fun m!283695 () Bool)

(assert (=> b!267277 m!283695))

(declare-fun m!283697 () Bool)

(assert (=> b!267277 m!283697))

(declare-fun m!283699 () Bool)

(assert (=> b!267284 m!283699))

(declare-fun m!283701 () Bool)

(assert (=> b!267278 m!283701))

(push 1)

