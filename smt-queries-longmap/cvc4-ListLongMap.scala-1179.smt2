; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25418 () Bool)

(assert start!25418)

(declare-fun b!264739 () Bool)

(declare-fun e!171496 () Bool)

(declare-fun mask!4002 () (_ BitVec 32))

(assert (=> b!264739 (= e!171496 (bvslt mask!4002 #b00000000000000000000000000000000))))

(declare-fun res!129251 () Bool)

(assert (=> start!25418 (=> (not res!129251) (not e!171496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25418 (= res!129251 (validMask!0 mask!4002))))

(assert (=> start!25418 e!171496))

(assert (=> start!25418 true))

(declare-datatypes ((array!12714 0))(
  ( (array!12715 (arr!6016 (Array (_ BitVec 32) (_ BitVec 64))) (size!6368 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12714)

(declare-fun array_inv!3979 (array!12714) Bool)

(assert (=> start!25418 (array_inv!3979 a!3436)))

(declare-fun b!264740 () Bool)

(declare-fun res!129255 () Bool)

(assert (=> b!264740 (=> (not res!129255) (not e!171496))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun i!1355 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1207 0))(
  ( (MissingZero!1207 (index!6998 (_ BitVec 32))) (Found!1207 (index!6999 (_ BitVec 32))) (Intermediate!1207 (undefined!2019 Bool) (index!7000 (_ BitVec 32)) (x!25324 (_ BitVec 32))) (Undefined!1207) (MissingVacant!1207 (index!7001 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12714 (_ BitVec 32)) SeekEntryResult!1207)

(assert (=> b!264740 (= res!129255 (not (= (seekEntryOrOpen!0 k!2698 a!3436 mask!4002) (MissingZero!1207 i!1355))))))

(declare-fun b!264741 () Bool)

(declare-fun res!129254 () Bool)

(assert (=> b!264741 (=> (not res!129254) (not e!171496))))

(declare-fun arrayContainsKey!0 (array!12714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264741 (= res!129254 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264742 () Bool)

(declare-fun res!129252 () Bool)

(assert (=> b!264742 (=> (not res!129252) (not e!171496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264742 (= res!129252 (validKeyInArray!0 k!2698))))

(declare-fun b!264743 () Bool)

(declare-fun res!129253 () Bool)

(assert (=> b!264743 (=> (not res!129253) (not e!171496))))

(assert (=> b!264743 (= res!129253 (and (= (size!6368 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6368 a!3436))))))

(assert (= (and start!25418 res!129251) b!264743))

(assert (= (and b!264743 res!129253) b!264742))

(assert (= (and b!264742 res!129252) b!264741))

(assert (= (and b!264741 res!129254) b!264740))

(assert (= (and b!264740 res!129255) b!264739))

(declare-fun m!281735 () Bool)

(assert (=> start!25418 m!281735))

(declare-fun m!281737 () Bool)

(assert (=> start!25418 m!281737))

(declare-fun m!281739 () Bool)

(assert (=> b!264740 m!281739))

(declare-fun m!281741 () Bool)

(assert (=> b!264741 m!281741))

(declare-fun m!281743 () Bool)

(assert (=> b!264742 m!281743))

(push 1)

(assert (not b!264741))

(assert (not b!264740))

(assert (not start!25418))

(assert (not b!264742))

(check-sat)

(pop 1)

(push 1)

