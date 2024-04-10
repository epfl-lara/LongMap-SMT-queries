; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25460 () Bool)

(assert start!25460)

(declare-fun res!129521 () Bool)

(declare-fun e!171630 () Bool)

(assert (=> start!25460 (=> (not res!129521) (not e!171630))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25460 (= res!129521 (validMask!0 mask!4002))))

(assert (=> start!25460 e!171630))

(assert (=> start!25460 true))

(declare-datatypes ((array!12756 0))(
  ( (array!12757 (arr!6037 (Array (_ BitVec 32) (_ BitVec 64))) (size!6389 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12756)

(declare-fun array_inv!4000 (array!12756) Bool)

(assert (=> start!25460 (array_inv!4000 a!3436)))

(declare-fun b!265008 () Bool)

(declare-fun res!129522 () Bool)

(assert (=> b!265008 (=> (not res!129522) (not e!171630))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265008 (= res!129522 (and (= (size!6389 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6389 a!3436))))))

(declare-fun b!265009 () Bool)

(declare-fun e!171631 () Bool)

(assert (=> b!265009 (= e!171631 (bvsgt #b00000000000000000000000000000000 (size!6389 a!3436)))))

(declare-fun b!265010 () Bool)

(assert (=> b!265010 (= e!171630 e!171631)))

(declare-fun res!129525 () Bool)

(assert (=> b!265010 (=> (not res!129525) (not e!171631))))

(declare-datatypes ((SeekEntryResult!1228 0))(
  ( (MissingZero!1228 (index!7082 (_ BitVec 32))) (Found!1228 (index!7083 (_ BitVec 32))) (Intermediate!1228 (undefined!2040 Bool) (index!7084 (_ BitVec 32)) (x!25401 (_ BitVec 32))) (Undefined!1228) (MissingVacant!1228 (index!7085 (_ BitVec 32))) )
))
(declare-fun lt!133957 () SeekEntryResult!1228)

(assert (=> b!265010 (= res!129525 (or (= lt!133957 (MissingZero!1228 i!1355)) (= lt!133957 (MissingVacant!1228 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12756 (_ BitVec 32)) SeekEntryResult!1228)

(assert (=> b!265010 (= lt!133957 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265011 () Bool)

(declare-fun res!129520 () Bool)

(assert (=> b!265011 (=> (not res!129520) (not e!171631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12756 (_ BitVec 32)) Bool)

(assert (=> b!265011 (= res!129520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265012 () Bool)

(declare-fun res!129523 () Bool)

(assert (=> b!265012 (=> (not res!129523) (not e!171630))))

(declare-fun arrayContainsKey!0 (array!12756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265012 (= res!129523 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265013 () Bool)

(declare-fun res!129524 () Bool)

(assert (=> b!265013 (=> (not res!129524) (not e!171630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265013 (= res!129524 (validKeyInArray!0 k!2698))))

(assert (= (and start!25460 res!129521) b!265008))

(assert (= (and b!265008 res!129522) b!265013))

(assert (= (and b!265013 res!129524) b!265012))

(assert (= (and b!265012 res!129523) b!265010))

(assert (= (and b!265010 res!129525) b!265011))

(assert (= (and b!265011 res!129520) b!265009))

(declare-fun m!281949 () Bool)

(assert (=> b!265013 m!281949))

(declare-fun m!281951 () Bool)

(assert (=> b!265010 m!281951))

(declare-fun m!281953 () Bool)

(assert (=> start!25460 m!281953))

(declare-fun m!281955 () Bool)

(assert (=> start!25460 m!281955))

(declare-fun m!281957 () Bool)

(assert (=> b!265011 m!281957))

(declare-fun m!281959 () Bool)

(assert (=> b!265012 m!281959))

(push 1)

(assert (not b!265011))

(assert (not b!265013))

(assert (not start!25460))

(assert (not b!265010))

