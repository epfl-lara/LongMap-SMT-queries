; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25412 () Bool)

(assert start!25412)

(declare-fun b!264698 () Bool)

(declare-fun e!171479 () Bool)

(assert (=> b!264698 (= e!171479 false)))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12708 0))(
  ( (array!12709 (arr!6013 (Array (_ BitVec 32) (_ BitVec 64))) (size!6365 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12708)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1204 0))(
  ( (MissingZero!1204 (index!6986 (_ BitVec 32))) (Found!1204 (index!6987 (_ BitVec 32))) (Intermediate!1204 (undefined!2016 Bool) (index!6988 (_ BitVec 32)) (x!25313 (_ BitVec 32))) (Undefined!1204) (MissingVacant!1204 (index!6989 (_ BitVec 32))) )
))
(declare-fun lt!133894 () SeekEntryResult!1204)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12708 (_ BitVec 32)) SeekEntryResult!1204)

(assert (=> b!264698 (= lt!133894 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264697 () Bool)

(declare-fun res!129209 () Bool)

(assert (=> b!264697 (=> (not res!129209) (not e!171479))))

(declare-fun arrayContainsKey!0 (array!12708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264697 (= res!129209 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!129207 () Bool)

(assert (=> start!25412 (=> (not res!129207) (not e!171479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25412 (= res!129207 (validMask!0 mask!4002))))

(assert (=> start!25412 e!171479))

(assert (=> start!25412 true))

(declare-fun array_inv!3976 (array!12708) Bool)

(assert (=> start!25412 (array_inv!3976 a!3436)))

(declare-fun b!264695 () Bool)

(declare-fun res!129210 () Bool)

(assert (=> b!264695 (=> (not res!129210) (not e!171479))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264695 (= res!129210 (and (= (size!6365 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6365 a!3436))))))

(declare-fun b!264696 () Bool)

(declare-fun res!129208 () Bool)

(assert (=> b!264696 (=> (not res!129208) (not e!171479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264696 (= res!129208 (validKeyInArray!0 k!2698))))

(assert (= (and start!25412 res!129207) b!264695))

(assert (= (and b!264695 res!129210) b!264696))

(assert (= (and b!264696 res!129208) b!264697))

(assert (= (and b!264697 res!129209) b!264698))

(declare-fun m!281705 () Bool)

(assert (=> b!264698 m!281705))

(declare-fun m!281707 () Bool)

(assert (=> b!264697 m!281707))

(declare-fun m!281709 () Bool)

(assert (=> start!25412 m!281709))

(declare-fun m!281711 () Bool)

(assert (=> start!25412 m!281711))

(declare-fun m!281713 () Bool)

(assert (=> b!264696 m!281713))

(push 1)

(assert (not b!264696))

(assert (not b!264697))

(assert (not start!25412))

(assert (not b!264698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

