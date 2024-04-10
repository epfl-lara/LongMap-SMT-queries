; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25774 () Bool)

(assert start!25774)

(declare-fun b!267205 () Bool)

(declare-fun res!131503 () Bool)

(declare-fun e!172761 () Bool)

(assert (=> b!267205 (=> (not res!131503) (not e!172761))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267205 (= res!131503 (validKeyInArray!0 k!2698))))

(declare-fun b!267206 () Bool)

(declare-fun e!172762 () Bool)

(assert (=> b!267206 (= e!172762 (not true))))

(declare-datatypes ((array!12953 0))(
  ( (array!12954 (arr!6131 (Array (_ BitVec 32) (_ BitVec 64))) (size!6483 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12953)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12953 (_ BitVec 32)) Bool)

(assert (=> b!267206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12954 (store (arr!6131 a!3436) i!1355 k!2698) (size!6483 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8293 0))(
  ( (Unit!8294) )
))
(declare-fun lt!134659 () Unit!8293)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8293)

(assert (=> b!267206 (= lt!134659 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!267207 () Bool)

(declare-fun res!131502 () Bool)

(assert (=> b!267207 (=> (not res!131502) (not e!172762))))

(assert (=> b!267207 (= res!131502 (bvslt #b00000000000000000000000000000000 (size!6483 a!3436)))))

(declare-fun res!131508 () Bool)

(assert (=> start!25774 (=> (not res!131508) (not e!172761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25774 (= res!131508 (validMask!0 mask!4002))))

(assert (=> start!25774 e!172761))

(assert (=> start!25774 true))

(declare-fun array_inv!4094 (array!12953) Bool)

(assert (=> start!25774 (array_inv!4094 a!3436)))

(declare-fun b!267208 () Bool)

(declare-fun res!131505 () Bool)

(assert (=> b!267208 (=> (not res!131505) (not e!172762))))

(assert (=> b!267208 (= res!131505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267209 () Bool)

(declare-fun res!131507 () Bool)

(assert (=> b!267209 (=> (not res!131507) (not e!172761))))

(declare-fun arrayContainsKey!0 (array!12953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267209 (= res!131507 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267210 () Bool)

(declare-fun res!131504 () Bool)

(assert (=> b!267210 (=> (not res!131504) (not e!172761))))

(assert (=> b!267210 (= res!131504 (and (= (size!6483 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6483 a!3436))))))

(declare-fun b!267211 () Bool)

(declare-fun res!131506 () Bool)

(assert (=> b!267211 (=> (not res!131506) (not e!172762))))

(declare-datatypes ((List!3945 0))(
  ( (Nil!3942) (Cons!3941 (h!4608 (_ BitVec 64)) (t!9027 List!3945)) )
))
(declare-fun arrayNoDuplicates!0 (array!12953 (_ BitVec 32) List!3945) Bool)

(assert (=> b!267211 (= res!131506 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3942))))

(declare-fun b!267212 () Bool)

(assert (=> b!267212 (= e!172761 e!172762)))

(declare-fun res!131501 () Bool)

(assert (=> b!267212 (=> (not res!131501) (not e!172762))))

(declare-datatypes ((SeekEntryResult!1322 0))(
  ( (MissingZero!1322 (index!7458 (_ BitVec 32))) (Found!1322 (index!7459 (_ BitVec 32))) (Intermediate!1322 (undefined!2134 Bool) (index!7460 (_ BitVec 32)) (x!25751 (_ BitVec 32))) (Undefined!1322) (MissingVacant!1322 (index!7461 (_ BitVec 32))) )
))
(declare-fun lt!134658 () SeekEntryResult!1322)

(assert (=> b!267212 (= res!131501 (or (= lt!134658 (MissingZero!1322 i!1355)) (= lt!134658 (MissingVacant!1322 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12953 (_ BitVec 32)) SeekEntryResult!1322)

(assert (=> b!267212 (= lt!134658 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(assert (= (and start!25774 res!131508) b!267210))

(assert (= (and b!267210 res!131504) b!267205))

(assert (= (and b!267205 res!131503) b!267209))

(assert (= (and b!267209 res!131507) b!267212))

(assert (= (and b!267212 res!131501) b!267208))

(assert (= (and b!267208 res!131505) b!267211))

(assert (= (and b!267211 res!131506) b!267207))

(assert (= (and b!267207 res!131502) b!267206))

(declare-fun m!283623 () Bool)

(assert (=> b!267211 m!283623))

(declare-fun m!283625 () Bool)

(assert (=> b!267208 m!283625))

(declare-fun m!283627 () Bool)

(assert (=> b!267205 m!283627))

(declare-fun m!283629 () Bool)

(assert (=> b!267206 m!283629))

(declare-fun m!283631 () Bool)

(assert (=> b!267206 m!283631))

(declare-fun m!283633 () Bool)

(assert (=> b!267206 m!283633))

(declare-fun m!283635 () Bool)

(assert (=> start!25774 m!283635))

(declare-fun m!283637 () Bool)

(assert (=> start!25774 m!283637))

(declare-fun m!283639 () Bool)

(assert (=> b!267209 m!283639))

(declare-fun m!283641 () Bool)

(assert (=> b!267212 m!283641))

(push 1)

