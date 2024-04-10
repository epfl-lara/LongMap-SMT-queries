; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25442 () Bool)

(assert start!25442)

(declare-fun b!264885 () Bool)

(declare-fun res!129399 () Bool)

(declare-fun e!171569 () Bool)

(assert (=> b!264885 (=> (not res!129399) (not e!171569))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264885 (= res!129399 (validKeyInArray!0 k!2698))))

(declare-fun b!264884 () Bool)

(declare-fun res!129397 () Bool)

(assert (=> b!264884 (=> (not res!129397) (not e!171569))))

(declare-datatypes ((array!12738 0))(
  ( (array!12739 (arr!6028 (Array (_ BitVec 32) (_ BitVec 64))) (size!6380 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12738)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264884 (= res!129397 (and (= (size!6380 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6380 a!3436))))))

(declare-fun b!264887 () Bool)

(assert (=> b!264887 (= e!171569 false)))

(declare-datatypes ((SeekEntryResult!1219 0))(
  ( (MissingZero!1219 (index!7046 (_ BitVec 32))) (Found!1219 (index!7047 (_ BitVec 32))) (Intermediate!1219 (undefined!2031 Bool) (index!7048 (_ BitVec 32)) (x!25368 (_ BitVec 32))) (Undefined!1219) (MissingVacant!1219 (index!7049 (_ BitVec 32))) )
))
(declare-fun lt!133930 () SeekEntryResult!1219)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12738 (_ BitVec 32)) SeekEntryResult!1219)

(assert (=> b!264887 (= lt!133930 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun res!129396 () Bool)

(assert (=> start!25442 (=> (not res!129396) (not e!171569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25442 (= res!129396 (validMask!0 mask!4002))))

(assert (=> start!25442 e!171569))

(assert (=> start!25442 true))

(declare-fun array_inv!3991 (array!12738) Bool)

(assert (=> start!25442 (array_inv!3991 a!3436)))

(declare-fun b!264886 () Bool)

(declare-fun res!129398 () Bool)

(assert (=> b!264886 (=> (not res!129398) (not e!171569))))

(declare-fun arrayContainsKey!0 (array!12738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264886 (= res!129398 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25442 res!129396) b!264884))

(assert (= (and b!264884 res!129397) b!264885))

(assert (= (and b!264885 res!129399) b!264886))

(assert (= (and b!264886 res!129398) b!264887))

(declare-fun m!281855 () Bool)

(assert (=> b!264885 m!281855))

(declare-fun m!281857 () Bool)

(assert (=> b!264887 m!281857))

(declare-fun m!281859 () Bool)

(assert (=> start!25442 m!281859))

(declare-fun m!281861 () Bool)

(assert (=> start!25442 m!281861))

(declare-fun m!281863 () Bool)

(assert (=> b!264886 m!281863))

(push 1)

(assert (not b!264886))

(assert (not start!25442))

(assert (not b!264885))

(assert (not b!264887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

