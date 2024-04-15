; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25724 () Bool)

(assert start!25724)

(declare-fun b!266559 () Bool)

(declare-fun e!172417 () Bool)

(declare-fun e!172418 () Bool)

(assert (=> b!266559 (= e!172417 e!172418)))

(declare-fun res!130910 () Bool)

(assert (=> b!266559 (=> (not res!130910) (not e!172418))))

(declare-datatypes ((SeekEntryResult!1289 0))(
  ( (MissingZero!1289 (index!7326 (_ BitVec 32))) (Found!1289 (index!7327 (_ BitVec 32))) (Intermediate!1289 (undefined!2101 Bool) (index!7328 (_ BitVec 32)) (x!25645 (_ BitVec 32))) (Undefined!1289) (MissingVacant!1289 (index!7329 (_ BitVec 32))) )
))
(declare-fun lt!134325 () SeekEntryResult!1289)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266559 (= res!130910 (or (= lt!134325 (MissingZero!1289 i!1355)) (= lt!134325 (MissingVacant!1289 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12891 0))(
  ( (array!12892 (arr!6099 (Array (_ BitVec 32) (_ BitVec 64))) (size!6452 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12891)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12891 (_ BitVec 32)) SeekEntryResult!1289)

(assert (=> b!266559 (= lt!134325 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266560 () Bool)

(declare-fun res!130907 () Bool)

(assert (=> b!266560 (=> (not res!130907) (not e!172418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12891 (_ BitVec 32)) Bool)

(assert (=> b!266560 (= res!130907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130911 () Bool)

(assert (=> start!25724 (=> (not res!130911) (not e!172417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25724 (= res!130911 (validMask!0 mask!4002))))

(assert (=> start!25724 e!172417))

(assert (=> start!25724 true))

(declare-fun array_inv!4071 (array!12891) Bool)

(assert (=> start!25724 (array_inv!4071 a!3436)))

(declare-fun b!266561 () Bool)

(declare-fun res!130908 () Bool)

(assert (=> b!266561 (=> (not res!130908) (not e!172417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266561 (= res!130908 (validKeyInArray!0 k0!2698))))

(declare-fun b!266562 () Bool)

(assert (=> b!266562 (= e!172418 false)))

(declare-fun lt!134324 () Bool)

(declare-datatypes ((List!3886 0))(
  ( (Nil!3883) (Cons!3882 (h!4549 (_ BitVec 64)) (t!8959 List!3886)) )
))
(declare-fun arrayNoDuplicates!0 (array!12891 (_ BitVec 32) List!3886) Bool)

(assert (=> b!266562 (= lt!134324 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3883))))

(declare-fun b!266563 () Bool)

(declare-fun res!130909 () Bool)

(assert (=> b!266563 (=> (not res!130909) (not e!172417))))

(declare-fun arrayContainsKey!0 (array!12891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266563 (= res!130909 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266564 () Bool)

(declare-fun res!130912 () Bool)

(assert (=> b!266564 (=> (not res!130912) (not e!172417))))

(assert (=> b!266564 (= res!130912 (and (= (size!6452 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6452 a!3436))))))

(assert (= (and start!25724 res!130911) b!266564))

(assert (= (and b!266564 res!130912) b!266561))

(assert (= (and b!266561 res!130908) b!266563))

(assert (= (and b!266563 res!130909) b!266559))

(assert (= (and b!266559 res!130910) b!266560))

(assert (= (and b!266560 res!130907) b!266562))

(declare-fun m!282653 () Bool)

(assert (=> b!266561 m!282653))

(declare-fun m!282655 () Bool)

(assert (=> b!266560 m!282655))

(declare-fun m!282657 () Bool)

(assert (=> b!266562 m!282657))

(declare-fun m!282659 () Bool)

(assert (=> b!266563 m!282659))

(declare-fun m!282661 () Bool)

(assert (=> start!25724 m!282661))

(declare-fun m!282663 () Bool)

(assert (=> start!25724 m!282663))

(declare-fun m!282665 () Bool)

(assert (=> b!266559 m!282665))

(check-sat (not b!266563) (not start!25724) (not b!266559) (not b!266561) (not b!266560) (not b!266562))
(check-sat)
