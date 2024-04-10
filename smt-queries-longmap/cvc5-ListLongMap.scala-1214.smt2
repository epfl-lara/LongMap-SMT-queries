; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25750 () Bool)

(assert start!25750)

(declare-fun b!266986 () Bool)

(declare-fun e!172655 () Bool)

(declare-fun e!172654 () Bool)

(assert (=> b!266986 (= e!172655 e!172654)))

(declare-fun res!131285 () Bool)

(assert (=> b!266986 (=> (not res!131285) (not e!172654))))

(declare-datatypes ((SeekEntryResult!1310 0))(
  ( (MissingZero!1310 (index!7410 (_ BitVec 32))) (Found!1310 (index!7411 (_ BitVec 32))) (Intermediate!1310 (undefined!2122 Bool) (index!7412 (_ BitVec 32)) (x!25707 (_ BitVec 32))) (Undefined!1310) (MissingVacant!1310 (index!7413 (_ BitVec 32))) )
))
(declare-fun lt!134586 () SeekEntryResult!1310)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266986 (= res!131285 (or (= lt!134586 (MissingZero!1310 i!1355)) (= lt!134586 (MissingVacant!1310 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12929 0))(
  ( (array!12930 (arr!6119 (Array (_ BitVec 32) (_ BitVec 64))) (size!6471 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12929)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12929 (_ BitVec 32)) SeekEntryResult!1310)

(assert (=> b!266986 (= lt!134586 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266987 () Bool)

(declare-fun res!131282 () Bool)

(assert (=> b!266987 (=> (not res!131282) (not e!172655))))

(declare-fun arrayContainsKey!0 (array!12929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266987 (= res!131282 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266988 () Bool)

(declare-fun res!131283 () Bool)

(assert (=> b!266988 (=> (not res!131283) (not e!172655))))

(assert (=> b!266988 (= res!131283 (and (= (size!6471 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6471 a!3436))))))

(declare-fun b!266985 () Bool)

(assert (=> b!266985 (= e!172654 false)))

(declare-fun lt!134587 () Bool)

(declare-datatypes ((List!3933 0))(
  ( (Nil!3930) (Cons!3929 (h!4596 (_ BitVec 64)) (t!9015 List!3933)) )
))
(declare-fun arrayNoDuplicates!0 (array!12929 (_ BitVec 32) List!3933) Bool)

(assert (=> b!266985 (= lt!134587 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3930))))

(declare-fun res!131284 () Bool)

(assert (=> start!25750 (=> (not res!131284) (not e!172655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25750 (= res!131284 (validMask!0 mask!4002))))

(assert (=> start!25750 e!172655))

(assert (=> start!25750 true))

(declare-fun array_inv!4082 (array!12929) Bool)

(assert (=> start!25750 (array_inv!4082 a!3436)))

(declare-fun b!266989 () Bool)

(declare-fun res!131286 () Bool)

(assert (=> b!266989 (=> (not res!131286) (not e!172654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12929 (_ BitVec 32)) Bool)

(assert (=> b!266989 (= res!131286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266990 () Bool)

(declare-fun res!131281 () Bool)

(assert (=> b!266990 (=> (not res!131281) (not e!172655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266990 (= res!131281 (validKeyInArray!0 k!2698))))

(assert (= (and start!25750 res!131284) b!266988))

(assert (= (and b!266988 res!131283) b!266990))

(assert (= (and b!266990 res!131281) b!266987))

(assert (= (and b!266987 res!131282) b!266986))

(assert (= (and b!266986 res!131285) b!266989))

(assert (= (and b!266989 res!131286) b!266985))

(declare-fun m!283455 () Bool)

(assert (=> b!266989 m!283455))

(declare-fun m!283457 () Bool)

(assert (=> b!266987 m!283457))

(declare-fun m!283459 () Bool)

(assert (=> b!266990 m!283459))

(declare-fun m!283461 () Bool)

(assert (=> b!266986 m!283461))

(declare-fun m!283463 () Bool)

(assert (=> start!25750 m!283463))

(declare-fun m!283465 () Bool)

(assert (=> start!25750 m!283465))

(declare-fun m!283467 () Bool)

(assert (=> b!266985 m!283467))

(push 1)

(assert (not b!266985))

