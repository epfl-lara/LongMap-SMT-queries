; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25446 () Bool)

(assert start!25446)

(declare-fun b!264931 () Bool)

(declare-fun res!129420 () Bool)

(declare-fun e!171593 () Bool)

(assert (=> b!264931 (=> (not res!129420) (not e!171593))))

(declare-datatypes ((array!12737 0))(
  ( (array!12738 (arr!6027 (Array (_ BitVec 32) (_ BitVec 64))) (size!6379 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12737)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264931 (= res!129420 (and (= (size!6379 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6379 a!3436))))))

(declare-fun b!264934 () Bool)

(assert (=> b!264934 (= e!171593 false)))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1183 0))(
  ( (MissingZero!1183 (index!6902 (_ BitVec 32))) (Found!1183 (index!6903 (_ BitVec 32))) (Intermediate!1183 (undefined!1995 Bool) (index!6904 (_ BitVec 32)) (x!25332 (_ BitVec 32))) (Undefined!1183) (MissingVacant!1183 (index!6905 (_ BitVec 32))) )
))
(declare-fun lt!133989 () SeekEntryResult!1183)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12737 (_ BitVec 32)) SeekEntryResult!1183)

(assert (=> b!264934 (= lt!133989 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264933 () Bool)

(declare-fun res!129419 () Bool)

(assert (=> b!264933 (=> (not res!129419) (not e!171593))))

(declare-fun arrayContainsKey!0 (array!12737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264933 (= res!129419 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264932 () Bool)

(declare-fun res!129418 () Bool)

(assert (=> b!264932 (=> (not res!129418) (not e!171593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264932 (= res!129418 (validKeyInArray!0 k!2698))))

(declare-fun res!129417 () Bool)

(assert (=> start!25446 (=> (not res!129417) (not e!171593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25446 (= res!129417 (validMask!0 mask!4002))))

(assert (=> start!25446 e!171593))

(assert (=> start!25446 true))

(declare-fun array_inv!3977 (array!12737) Bool)

(assert (=> start!25446 (array_inv!3977 a!3436)))

(assert (= (and start!25446 res!129417) b!264931))

(assert (= (and b!264931 res!129420) b!264932))

(assert (= (and b!264932 res!129418) b!264933))

(assert (= (and b!264933 res!129419) b!264934))

(declare-fun m!282037 () Bool)

(assert (=> b!264934 m!282037))

(declare-fun m!282039 () Bool)

(assert (=> b!264933 m!282039))

(declare-fun m!282041 () Bool)

(assert (=> b!264932 m!282041))

(declare-fun m!282043 () Bool)

(assert (=> start!25446 m!282043))

(declare-fun m!282045 () Bool)

(assert (=> start!25446 m!282045))

(push 1)

(assert (not b!264934))

(assert (not b!264933))

(assert (not start!25446))

(assert (not b!264932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

