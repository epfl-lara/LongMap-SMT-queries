; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25458 () Bool)

(assert start!25458)

(declare-fun b!264990 () Bool)

(declare-fun e!171622 () Bool)

(declare-fun e!171623 () Bool)

(assert (=> b!264990 (= e!171622 e!171623)))

(declare-fun res!129504 () Bool)

(assert (=> b!264990 (=> (not res!129504) (not e!171623))))

(declare-datatypes ((SeekEntryResult!1227 0))(
  ( (MissingZero!1227 (index!7078 (_ BitVec 32))) (Found!1227 (index!7079 (_ BitVec 32))) (Intermediate!1227 (undefined!2039 Bool) (index!7080 (_ BitVec 32)) (x!25400 (_ BitVec 32))) (Undefined!1227) (MissingVacant!1227 (index!7081 (_ BitVec 32))) )
))
(declare-fun lt!133954 () SeekEntryResult!1227)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264990 (= res!129504 (or (= lt!133954 (MissingZero!1227 i!1355)) (= lt!133954 (MissingVacant!1227 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12754 0))(
  ( (array!12755 (arr!6036 (Array (_ BitVec 32) (_ BitVec 64))) (size!6388 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12754)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12754 (_ BitVec 32)) SeekEntryResult!1227)

(assert (=> b!264990 (= lt!133954 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!264991 () Bool)

(declare-fun res!129507 () Bool)

(assert (=> b!264991 (=> (not res!129507) (not e!171622))))

(declare-fun arrayContainsKey!0 (array!12754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264991 (= res!129507 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun res!129505 () Bool)

(assert (=> start!25458 (=> (not res!129505) (not e!171622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25458 (= res!129505 (validMask!0 mask!4002))))

(assert (=> start!25458 e!171622))

(assert (=> start!25458 true))

(declare-fun array_inv!3999 (array!12754) Bool)

(assert (=> start!25458 (array_inv!3999 a!3436)))

(declare-fun b!264992 () Bool)

(assert (=> b!264992 (= e!171623 (bvsgt #b00000000000000000000000000000000 (size!6388 a!3436)))))

(declare-fun b!264993 () Bool)

(declare-fun res!129503 () Bool)

(assert (=> b!264993 (=> (not res!129503) (not e!171623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12754 (_ BitVec 32)) Bool)

(assert (=> b!264993 (= res!129503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!264994 () Bool)

(declare-fun res!129506 () Bool)

(assert (=> b!264994 (=> (not res!129506) (not e!171622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264994 (= res!129506 (validKeyInArray!0 k0!2698))))

(declare-fun b!264995 () Bool)

(declare-fun res!129502 () Bool)

(assert (=> b!264995 (=> (not res!129502) (not e!171622))))

(assert (=> b!264995 (= res!129502 (and (= (size!6388 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6388 a!3436))))))

(assert (= (and start!25458 res!129505) b!264995))

(assert (= (and b!264995 res!129502) b!264994))

(assert (= (and b!264994 res!129506) b!264991))

(assert (= (and b!264991 res!129507) b!264990))

(assert (= (and b!264990 res!129504) b!264993))

(assert (= (and b!264993 res!129503) b!264992))

(declare-fun m!281937 () Bool)

(assert (=> b!264994 m!281937))

(declare-fun m!281939 () Bool)

(assert (=> b!264991 m!281939))

(declare-fun m!281941 () Bool)

(assert (=> b!264993 m!281941))

(declare-fun m!281943 () Bool)

(assert (=> start!25458 m!281943))

(declare-fun m!281945 () Bool)

(assert (=> start!25458 m!281945))

(declare-fun m!281947 () Bool)

(assert (=> b!264990 m!281947))

(check-sat (not b!264993) (not b!264994) (not start!25458) (not b!264991) (not b!264990))
(check-sat)
