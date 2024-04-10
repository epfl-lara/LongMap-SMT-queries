; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25406 () Bool)

(assert start!25406)

(declare-fun b!264662 () Bool)

(declare-fun e!171461 () Bool)

(declare-fun mask!4002 () (_ BitVec 32))

(assert (=> b!264662 (= e!171461 (bvslt mask!4002 #b00000000000000000000000000000000))))

(declare-fun b!264660 () Bool)

(declare-fun res!129174 () Bool)

(assert (=> b!264660 (=> (not res!129174) (not e!171461))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264660 (= res!129174 (validKeyInArray!0 k!2698))))

(declare-fun b!264661 () Bool)

(declare-fun res!129172 () Bool)

(assert (=> b!264661 (=> (not res!129172) (not e!171461))))

(declare-datatypes ((array!12702 0))(
  ( (array!12703 (arr!6010 (Array (_ BitVec 32) (_ BitVec 64))) (size!6362 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12702)

(declare-fun arrayContainsKey!0 (array!12702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264661 (= res!129172 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!129173 () Bool)

(assert (=> start!25406 (=> (not res!129173) (not e!171461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25406 (= res!129173 (validMask!0 mask!4002))))

(assert (=> start!25406 e!171461))

(assert (=> start!25406 true))

(declare-fun array_inv!3973 (array!12702) Bool)

(assert (=> start!25406 (array_inv!3973 a!3436)))

(declare-fun b!264659 () Bool)

(declare-fun res!129171 () Bool)

(assert (=> b!264659 (=> (not res!129171) (not e!171461))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264659 (= res!129171 (and (= (size!6362 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6362 a!3436))))))

(assert (= (and start!25406 res!129173) b!264659))

(assert (= (and b!264659 res!129171) b!264660))

(assert (= (and b!264660 res!129174) b!264661))

(assert (= (and b!264661 res!129172) b!264662))

(declare-fun m!281677 () Bool)

(assert (=> b!264660 m!281677))

(declare-fun m!281679 () Bool)

(assert (=> b!264661 m!281679))

(declare-fun m!281681 () Bool)

(assert (=> start!25406 m!281681))

(declare-fun m!281683 () Bool)

(assert (=> start!25406 m!281683))

(push 1)

(assert (not b!264660))

(assert (not b!264661))

(assert (not start!25406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

