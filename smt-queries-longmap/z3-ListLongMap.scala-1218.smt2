; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25778 () Bool)

(assert start!25778)

(declare-fun b!267058 () Bool)

(declare-fun e!172660 () Bool)

(declare-fun e!172661 () Bool)

(assert (=> b!267058 (= e!172660 e!172661)))

(declare-fun res!131410 () Bool)

(assert (=> b!267058 (=> (not res!131410) (not e!172661))))

(declare-datatypes ((SeekEntryResult!1316 0))(
  ( (MissingZero!1316 (index!7434 (_ BitVec 32))) (Found!1316 (index!7435 (_ BitVec 32))) (Intermediate!1316 (undefined!2128 Bool) (index!7436 (_ BitVec 32)) (x!25744 (_ BitVec 32))) (Undefined!1316) (MissingVacant!1316 (index!7437 (_ BitVec 32))) )
))
(declare-fun lt!134478 () SeekEntryResult!1316)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267058 (= res!131410 (or (= lt!134478 (MissingZero!1316 i!1355)) (= lt!134478 (MissingVacant!1316 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12945 0))(
  ( (array!12946 (arr!6126 (Array (_ BitVec 32) (_ BitVec 64))) (size!6479 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12945)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12945 (_ BitVec 32)) SeekEntryResult!1316)

(assert (=> b!267058 (= lt!134478 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!131409 () Bool)

(assert (=> start!25778 (=> (not res!131409) (not e!172660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25778 (= res!131409 (validMask!0 mask!4002))))

(assert (=> start!25778 e!172660))

(assert (=> start!25778 true))

(declare-fun array_inv!4098 (array!12945) Bool)

(assert (=> start!25778 (array_inv!4098 a!3436)))

(declare-fun b!267059 () Bool)

(declare-fun res!131407 () Bool)

(assert (=> b!267059 (=> (not res!131407) (not e!172660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267059 (= res!131407 (validKeyInArray!0 k0!2698))))

(declare-fun b!267060 () Bool)

(declare-fun res!131412 () Bool)

(assert (=> b!267060 (=> (not res!131412) (not e!172660))))

(declare-fun arrayContainsKey!0 (array!12945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267060 (= res!131412 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267061 () Bool)

(declare-fun res!131411 () Bool)

(assert (=> b!267061 (=> (not res!131411) (not e!172661))))

(declare-datatypes ((List!3913 0))(
  ( (Nil!3910) (Cons!3909 (h!4576 (_ BitVec 64)) (t!8986 List!3913)) )
))
(declare-fun arrayNoDuplicates!0 (array!12945 (_ BitVec 32) List!3913) Bool)

(assert (=> b!267061 (= res!131411 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3910))))

(declare-fun b!267062 () Bool)

(declare-fun res!131408 () Bool)

(assert (=> b!267062 (=> (not res!131408) (not e!172661))))

(assert (=> b!267062 (= res!131408 (bvslt #b00000000000000000000000000000000 (size!6479 a!3436)))))

(declare-fun b!267063 () Bool)

(declare-fun res!131413 () Bool)

(assert (=> b!267063 (=> (not res!131413) (not e!172661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12945 (_ BitVec 32)) Bool)

(assert (=> b!267063 (= res!131413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267064 () Bool)

(assert (=> b!267064 (= e!172661 (not true))))

(assert (=> b!267064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12946 (store (arr!6126 a!3436) i!1355 k0!2698) (size!6479 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8247 0))(
  ( (Unit!8248) )
))
(declare-fun lt!134477 () Unit!8247)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8247)

(assert (=> b!267064 (= lt!134477 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!267065 () Bool)

(declare-fun res!131406 () Bool)

(assert (=> b!267065 (=> (not res!131406) (not e!172660))))

(assert (=> b!267065 (= res!131406 (and (= (size!6479 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6479 a!3436))))))

(assert (= (and start!25778 res!131409) b!267065))

(assert (= (and b!267065 res!131406) b!267059))

(assert (= (and b!267059 res!131407) b!267060))

(assert (= (and b!267060 res!131412) b!267058))

(assert (= (and b!267058 res!131410) b!267063))

(assert (= (and b!267063 res!131413) b!267061))

(assert (= (and b!267061 res!131411) b!267062))

(assert (= (and b!267062 res!131408) b!267064))

(declare-fun m!283031 () Bool)

(assert (=> b!267061 m!283031))

(declare-fun m!283033 () Bool)

(assert (=> b!267060 m!283033))

(declare-fun m!283035 () Bool)

(assert (=> b!267064 m!283035))

(declare-fun m!283037 () Bool)

(assert (=> b!267064 m!283037))

(declare-fun m!283039 () Bool)

(assert (=> b!267064 m!283039))

(declare-fun m!283041 () Bool)

(assert (=> b!267058 m!283041))

(declare-fun m!283043 () Bool)

(assert (=> b!267063 m!283043))

(declare-fun m!283045 () Bool)

(assert (=> start!25778 m!283045))

(declare-fun m!283047 () Bool)

(assert (=> start!25778 m!283047))

(declare-fun m!283049 () Bool)

(assert (=> b!267059 m!283049))

(check-sat (not b!267063) (not b!267058) (not b!267060) (not b!267064) (not b!267061) (not b!267059) (not start!25778))
(check-sat)
