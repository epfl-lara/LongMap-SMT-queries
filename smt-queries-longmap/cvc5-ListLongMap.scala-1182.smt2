; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25440 () Bool)

(assert start!25440)

(declare-fun b!264701 () Bool)

(declare-fun res!129267 () Bool)

(declare-fun e!171450 () Bool)

(assert (=> b!264701 (=> (not res!129267) (not e!171450))))

(declare-datatypes ((array!12724 0))(
  ( (array!12725 (arr!6020 (Array (_ BitVec 32) (_ BitVec 64))) (size!6373 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12724)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264701 (= res!129267 (and (= (size!6373 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6373 a!3436))))))

(declare-fun b!264704 () Bool)

(assert (=> b!264704 (= e!171450 false)))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1210 0))(
  ( (MissingZero!1210 (index!7010 (_ BitVec 32))) (Found!1210 (index!7011 (_ BitVec 32))) (Intermediate!1210 (undefined!2022 Bool) (index!7012 (_ BitVec 32)) (x!25350 (_ BitVec 32))) (Undefined!1210) (MissingVacant!1210 (index!7013 (_ BitVec 32))) )
))
(declare-fun lt!133740 () SeekEntryResult!1210)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12724 (_ BitVec 32)) SeekEntryResult!1210)

(assert (=> b!264704 (= lt!133740 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264702 () Bool)

(declare-fun res!129266 () Bool)

(assert (=> b!264702 (=> (not res!129266) (not e!171450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264702 (= res!129266 (validKeyInArray!0 k!2698))))

(declare-fun res!129265 () Bool)

(assert (=> start!25440 (=> (not res!129265) (not e!171450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25440 (= res!129265 (validMask!0 mask!4002))))

(assert (=> start!25440 e!171450))

(assert (=> start!25440 true))

(declare-fun array_inv!3992 (array!12724) Bool)

(assert (=> start!25440 (array_inv!3992 a!3436)))

(declare-fun b!264703 () Bool)

(declare-fun res!129268 () Bool)

(assert (=> b!264703 (=> (not res!129268) (not e!171450))))

(declare-fun arrayContainsKey!0 (array!12724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264703 (= res!129268 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25440 res!129265) b!264701))

(assert (= (and b!264701 res!129267) b!264702))

(assert (= (and b!264702 res!129266) b!264703))

(assert (= (and b!264703 res!129268) b!264704))

(declare-fun m!281209 () Bool)

(assert (=> b!264704 m!281209))

(declare-fun m!281211 () Bool)

(assert (=> b!264702 m!281211))

(declare-fun m!281213 () Bool)

(assert (=> start!25440 m!281213))

(declare-fun m!281215 () Bool)

(assert (=> start!25440 m!281215))

(declare-fun m!281217 () Bool)

(assert (=> b!264703 m!281217))

(push 1)

(assert (not start!25440))

(assert (not b!264703))

(assert (not b!264704))

(assert (not b!264702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

