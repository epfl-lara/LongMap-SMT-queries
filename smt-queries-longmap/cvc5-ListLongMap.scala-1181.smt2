; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25434 () Bool)

(assert start!25434)

(declare-fun res!129229 () Bool)

(declare-fun e!171432 () Bool)

(assert (=> start!25434 (=> (not res!129229) (not e!171432))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25434 (= res!129229 (validMask!0 mask!4002))))

(assert (=> start!25434 e!171432))

(assert (=> start!25434 true))

(declare-datatypes ((array!12718 0))(
  ( (array!12719 (arr!6017 (Array (_ BitVec 32) (_ BitVec 64))) (size!6370 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12718)

(declare-fun array_inv!3989 (array!12718) Bool)

(assert (=> start!25434 (array_inv!3989 a!3436)))

(declare-fun b!264666 () Bool)

(declare-fun res!129231 () Bool)

(assert (=> b!264666 (=> (not res!129231) (not e!171432))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264666 (= res!129231 (validKeyInArray!0 k!2698))))

(declare-fun b!264665 () Bool)

(declare-fun res!129232 () Bool)

(assert (=> b!264665 (=> (not res!129232) (not e!171432))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264665 (= res!129232 (and (= (size!6370 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6370 a!3436))))))

(declare-fun b!264668 () Bool)

(assert (=> b!264668 (= e!171432 false)))

(declare-datatypes ((SeekEntryResult!1207 0))(
  ( (MissingZero!1207 (index!6998 (_ BitVec 32))) (Found!1207 (index!6999 (_ BitVec 32))) (Intermediate!1207 (undefined!2019 Bool) (index!7000 (_ BitVec 32)) (x!25339 (_ BitVec 32))) (Undefined!1207) (MissingVacant!1207 (index!7001 (_ BitVec 32))) )
))
(declare-fun lt!133731 () SeekEntryResult!1207)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12718 (_ BitVec 32)) SeekEntryResult!1207)

(assert (=> b!264668 (= lt!133731 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264667 () Bool)

(declare-fun res!129230 () Bool)

(assert (=> b!264667 (=> (not res!129230) (not e!171432))))

(declare-fun arrayContainsKey!0 (array!12718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264667 (= res!129230 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25434 res!129229) b!264665))

(assert (= (and b!264665 res!129232) b!264666))

(assert (= (and b!264666 res!129231) b!264667))

(assert (= (and b!264667 res!129230) b!264668))

(declare-fun m!281179 () Bool)

(assert (=> start!25434 m!281179))

(declare-fun m!281181 () Bool)

(assert (=> start!25434 m!281181))

(declare-fun m!281183 () Bool)

(assert (=> b!264666 m!281183))

(declare-fun m!281185 () Bool)

(assert (=> b!264668 m!281185))

(declare-fun m!281187 () Bool)

(assert (=> b!264667 m!281187))

(push 1)

(assert (not b!264667))

(assert (not start!25434))

(assert (not b!264668))

(assert (not b!264666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

