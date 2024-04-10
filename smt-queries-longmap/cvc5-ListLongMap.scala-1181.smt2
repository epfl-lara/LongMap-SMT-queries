; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25426 () Bool)

(assert start!25426)

(declare-fun b!264788 () Bool)

(declare-fun res!129301 () Bool)

(declare-fun e!171521 () Bool)

(assert (=> b!264788 (=> (not res!129301) (not e!171521))))

(declare-datatypes ((array!12722 0))(
  ( (array!12723 (arr!6020 (Array (_ BitVec 32) (_ BitVec 64))) (size!6372 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12722)

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun mask!4002 () (_ BitVec 32))

(assert (=> b!264788 (= res!129301 (and (= (size!6372 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6372 a!3436))))))

(declare-fun b!264790 () Bool)

(declare-fun res!129303 () Bool)

(assert (=> b!264790 (=> (not res!129303) (not e!171521))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264790 (= res!129303 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264789 () Bool)

(declare-fun res!129300 () Bool)

(assert (=> b!264789 (=> (not res!129300) (not e!171521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264789 (= res!129300 (validKeyInArray!0 k!2698))))

(declare-fun b!264791 () Bool)

(assert (=> b!264791 (= e!171521 false)))

(declare-datatypes ((SeekEntryResult!1211 0))(
  ( (MissingZero!1211 (index!7014 (_ BitVec 32))) (Found!1211 (index!7015 (_ BitVec 32))) (Intermediate!1211 (undefined!2023 Bool) (index!7016 (_ BitVec 32)) (x!25344 (_ BitVec 32))) (Undefined!1211) (MissingVacant!1211 (index!7017 (_ BitVec 32))) )
))
(declare-fun lt!133906 () SeekEntryResult!1211)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12722 (_ BitVec 32)) SeekEntryResult!1211)

(assert (=> b!264791 (= lt!133906 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun res!129302 () Bool)

(assert (=> start!25426 (=> (not res!129302) (not e!171521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25426 (= res!129302 (validMask!0 mask!4002))))

(assert (=> start!25426 e!171521))

(assert (=> start!25426 true))

(declare-fun array_inv!3983 (array!12722) Bool)

(assert (=> start!25426 (array_inv!3983 a!3436)))

(assert (= (and start!25426 res!129302) b!264788))

(assert (= (and b!264788 res!129301) b!264789))

(assert (= (and b!264789 res!129300) b!264790))

(assert (= (and b!264790 res!129303) b!264791))

(declare-fun m!281775 () Bool)

(assert (=> b!264790 m!281775))

(declare-fun m!281777 () Bool)

(assert (=> b!264789 m!281777))

(declare-fun m!281779 () Bool)

(assert (=> b!264791 m!281779))

(declare-fun m!281781 () Bool)

(assert (=> start!25426 m!281781))

(declare-fun m!281783 () Bool)

(assert (=> start!25426 m!281783))

(push 1)

(assert (not b!264791))

(assert (not start!25426))

(assert (not b!264790))

(assert (not b!264789))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

