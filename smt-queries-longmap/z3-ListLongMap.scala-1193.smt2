; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25626 () Bool)

(assert start!25626)

(declare-fun b!265788 () Bool)

(declare-fun e!172095 () Bool)

(assert (=> b!265788 (= e!172095 false)))

(declare-fun lt!134223 () Bool)

(declare-datatypes ((array!12805 0))(
  ( (array!12806 (arr!6057 (Array (_ BitVec 32) (_ BitVec 64))) (size!6409 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12805)

(declare-datatypes ((List!3871 0))(
  ( (Nil!3868) (Cons!3867 (h!4534 (_ BitVec 64)) (t!8953 List!3871)) )
))
(declare-fun arrayNoDuplicates!0 (array!12805 (_ BitVec 32) List!3871) Bool)

(assert (=> b!265788 (= lt!134223 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3868))))

(declare-fun b!265790 () Bool)

(declare-fun res!130089 () Bool)

(declare-fun e!172096 () Bool)

(assert (=> b!265790 (=> (not res!130089) (not e!172096))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265790 (= res!130089 (and (= (size!6409 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6409 a!3436))))))

(declare-fun b!265791 () Bool)

(declare-fun res!130085 () Bool)

(assert (=> b!265791 (=> (not res!130085) (not e!172096))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265791 (= res!130085 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265792 () Bool)

(assert (=> b!265792 (= e!172096 e!172095)))

(declare-fun res!130086 () Bool)

(assert (=> b!265792 (=> (not res!130086) (not e!172095))))

(declare-datatypes ((SeekEntryResult!1248 0))(
  ( (MissingZero!1248 (index!7162 (_ BitVec 32))) (Found!1248 (index!7163 (_ BitVec 32))) (Intermediate!1248 (undefined!2060 Bool) (index!7164 (_ BitVec 32)) (x!25477 (_ BitVec 32))) (Undefined!1248) (MissingVacant!1248 (index!7165 (_ BitVec 32))) )
))
(declare-fun lt!134224 () SeekEntryResult!1248)

(assert (=> b!265792 (= res!130086 (or (= lt!134224 (MissingZero!1248 i!1355)) (= lt!134224 (MissingVacant!1248 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12805 (_ BitVec 32)) SeekEntryResult!1248)

(assert (=> b!265792 (= lt!134224 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265793 () Bool)

(declare-fun res!130084 () Bool)

(assert (=> b!265793 (=> (not res!130084) (not e!172096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265793 (= res!130084 (validKeyInArray!0 k0!2698))))

(declare-fun res!130088 () Bool)

(assert (=> start!25626 (=> (not res!130088) (not e!172096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25626 (= res!130088 (validMask!0 mask!4002))))

(assert (=> start!25626 e!172096))

(assert (=> start!25626 true))

(declare-fun array_inv!4020 (array!12805) Bool)

(assert (=> start!25626 (array_inv!4020 a!3436)))

(declare-fun b!265789 () Bool)

(declare-fun res!130087 () Bool)

(assert (=> b!265789 (=> (not res!130087) (not e!172095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12805 (_ BitVec 32)) Bool)

(assert (=> b!265789 (= res!130087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25626 res!130088) b!265790))

(assert (= (and b!265790 res!130089) b!265793))

(assert (= (and b!265793 res!130084) b!265791))

(assert (= (and b!265791 res!130085) b!265792))

(assert (= (and b!265792 res!130086) b!265789))

(assert (= (and b!265789 res!130087) b!265788))

(declare-fun m!282515 () Bool)

(assert (=> b!265788 m!282515))

(declare-fun m!282517 () Bool)

(assert (=> b!265793 m!282517))

(declare-fun m!282519 () Bool)

(assert (=> b!265791 m!282519))

(declare-fun m!282521 () Bool)

(assert (=> start!25626 m!282521))

(declare-fun m!282523 () Bool)

(assert (=> start!25626 m!282523))

(declare-fun m!282525 () Bool)

(assert (=> b!265789 m!282525))

(declare-fun m!282527 () Bool)

(assert (=> b!265792 m!282527))

(check-sat (not b!265788) (not b!265789) (not b!265791) (not b!265793) (not b!265792) (not start!25626))
