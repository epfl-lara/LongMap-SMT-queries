; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25610 () Bool)

(assert start!25610)

(declare-fun b!265644 () Bool)

(declare-fun res!129944 () Bool)

(declare-fun e!172024 () Bool)

(assert (=> b!265644 (=> (not res!129944) (not e!172024))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265644 (= res!129944 (validKeyInArray!0 k!2698))))

(declare-fun b!265645 () Bool)

(declare-fun res!129942 () Bool)

(assert (=> b!265645 (=> (not res!129942) (not e!172024))))

(declare-datatypes ((array!12789 0))(
  ( (array!12790 (arr!6049 (Array (_ BitVec 32) (_ BitVec 64))) (size!6401 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12789)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265645 (= res!129942 (and (= (size!6401 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6401 a!3436))))))

(declare-fun b!265646 () Bool)

(declare-fun res!129943 () Bool)

(declare-fun e!172025 () Bool)

(assert (=> b!265646 (=> (not res!129943) (not e!172025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12789 (_ BitVec 32)) Bool)

(assert (=> b!265646 (= res!129943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265647 () Bool)

(assert (=> b!265647 (= e!172024 e!172025)))

(declare-fun res!129940 () Bool)

(assert (=> b!265647 (=> (not res!129940) (not e!172025))))

(declare-datatypes ((SeekEntryResult!1240 0))(
  ( (MissingZero!1240 (index!7130 (_ BitVec 32))) (Found!1240 (index!7131 (_ BitVec 32))) (Intermediate!1240 (undefined!2052 Bool) (index!7132 (_ BitVec 32)) (x!25445 (_ BitVec 32))) (Undefined!1240) (MissingVacant!1240 (index!7133 (_ BitVec 32))) )
))
(declare-fun lt!134175 () SeekEntryResult!1240)

(assert (=> b!265647 (= res!129940 (or (= lt!134175 (MissingZero!1240 i!1355)) (= lt!134175 (MissingVacant!1240 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12789 (_ BitVec 32)) SeekEntryResult!1240)

(assert (=> b!265647 (= lt!134175 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265649 () Bool)

(declare-fun res!129941 () Bool)

(assert (=> b!265649 (=> (not res!129941) (not e!172024))))

(declare-fun arrayContainsKey!0 (array!12789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265649 (= res!129941 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!129945 () Bool)

(assert (=> start!25610 (=> (not res!129945) (not e!172024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25610 (= res!129945 (validMask!0 mask!4002))))

(assert (=> start!25610 e!172024))

(assert (=> start!25610 true))

(declare-fun array_inv!4012 (array!12789) Bool)

(assert (=> start!25610 (array_inv!4012 a!3436)))

(declare-fun b!265648 () Bool)

(assert (=> b!265648 (= e!172025 false)))

(declare-fun lt!134176 () Bool)

(declare-datatypes ((List!3863 0))(
  ( (Nil!3860) (Cons!3859 (h!4526 (_ BitVec 64)) (t!8945 List!3863)) )
))
(declare-fun arrayNoDuplicates!0 (array!12789 (_ BitVec 32) List!3863) Bool)

(assert (=> b!265648 (= lt!134176 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3860))))

(assert (= (and start!25610 res!129945) b!265645))

(assert (= (and b!265645 res!129942) b!265644))

(assert (= (and b!265644 res!129944) b!265649))

(assert (= (and b!265649 res!129941) b!265647))

(assert (= (and b!265647 res!129940) b!265646))

(assert (= (and b!265646 res!129943) b!265648))

(declare-fun m!282403 () Bool)

(assert (=> b!265647 m!282403))

(declare-fun m!282405 () Bool)

(assert (=> b!265648 m!282405))

(declare-fun m!282407 () Bool)

(assert (=> b!265646 m!282407))

(declare-fun m!282409 () Bool)

(assert (=> b!265649 m!282409))

(declare-fun m!282411 () Bool)

(assert (=> start!25610 m!282411))

(declare-fun m!282413 () Bool)

(assert (=> start!25610 m!282413))

(declare-fun m!282415 () Bool)

(assert (=> b!265644 m!282415))

(push 1)

(assert (not b!265649))

(assert (not b!265644))

(assert (not b!265647))

(assert (not b!265646))

(assert (not start!25610))

(assert (not b!265648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

