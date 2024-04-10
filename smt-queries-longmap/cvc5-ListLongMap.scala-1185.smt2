; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25450 () Bool)

(assert start!25450)

(declare-fun res!129445 () Bool)

(declare-fun e!171592 () Bool)

(assert (=> start!25450 (=> (not res!129445) (not e!171592))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25450 (= res!129445 (validMask!0 mask!4002))))

(assert (=> start!25450 e!171592))

(assert (=> start!25450 true))

(declare-datatypes ((array!12746 0))(
  ( (array!12747 (arr!6032 (Array (_ BitVec 32) (_ BitVec 64))) (size!6384 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12746)

(declare-fun array_inv!3995 (array!12746) Bool)

(assert (=> start!25450 (array_inv!3995 a!3436)))

(declare-fun b!264933 () Bool)

(declare-fun res!129446 () Bool)

(assert (=> b!264933 (=> (not res!129446) (not e!171592))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264933 (= res!129446 (validKeyInArray!0 k!2698))))

(declare-fun b!264932 () Bool)

(declare-fun res!129444 () Bool)

(assert (=> b!264932 (=> (not res!129444) (not e!171592))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264932 (= res!129444 (and (= (size!6384 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6384 a!3436))))))

(declare-fun b!264934 () Bool)

(declare-fun res!129447 () Bool)

(assert (=> b!264934 (=> (not res!129447) (not e!171592))))

(declare-fun arrayContainsKey!0 (array!12746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264934 (= res!129447 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264935 () Bool)

(declare-datatypes ((SeekEntryResult!1223 0))(
  ( (MissingZero!1223 (index!7062 (_ BitVec 32))) (Found!1223 (index!7063 (_ BitVec 32))) (Intermediate!1223 (undefined!2035 Bool) (index!7064 (_ BitVec 32)) (x!25388 (_ BitVec 32))) (Undefined!1223) (MissingVacant!1223 (index!7065 (_ BitVec 32))) )
))
(declare-fun lt!133942 () SeekEntryResult!1223)

(assert (=> b!264935 (= e!171592 (and (or (= lt!133942 (MissingZero!1223 i!1355)) (= lt!133942 (MissingVacant!1223 i!1355))) (bvsgt #b00000000000000000000000000000000 (size!6384 a!3436))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12746 (_ BitVec 32)) SeekEntryResult!1223)

(assert (=> b!264935 (= lt!133942 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(assert (= (and start!25450 res!129445) b!264932))

(assert (= (and b!264932 res!129444) b!264933))

(assert (= (and b!264933 res!129446) b!264934))

(assert (= (and b!264934 res!129447) b!264935))

(declare-fun m!281895 () Bool)

(assert (=> start!25450 m!281895))

(declare-fun m!281897 () Bool)

(assert (=> start!25450 m!281897))

(declare-fun m!281899 () Bool)

(assert (=> b!264933 m!281899))

(declare-fun m!281901 () Bool)

(assert (=> b!264934 m!281901))

(declare-fun m!281903 () Bool)

(assert (=> b!264935 m!281903))

(push 1)

(assert (not b!264935))

(assert (not b!264934))

(assert (not start!25450))

(assert (not b!264933))

(check-sat)

(pop 1)

