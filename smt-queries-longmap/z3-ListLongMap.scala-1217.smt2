; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25770 () Bool)

(assert start!25770)

(declare-fun b!267165 () Bool)

(declare-fun res!131464 () Bool)

(declare-fun e!172745 () Bool)

(assert (=> b!267165 (=> (not res!131464) (not e!172745))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267165 (= res!131464 (validKeyInArray!0 k0!2698))))

(declare-fun res!131466 () Bool)

(assert (=> start!25770 (=> (not res!131466) (not e!172745))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25770 (= res!131466 (validMask!0 mask!4002))))

(assert (=> start!25770 e!172745))

(assert (=> start!25770 true))

(declare-datatypes ((array!12949 0))(
  ( (array!12950 (arr!6129 (Array (_ BitVec 32) (_ BitVec 64))) (size!6481 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12949)

(declare-fun array_inv!4092 (array!12949) Bool)

(assert (=> start!25770 (array_inv!4092 a!3436)))

(declare-fun b!267166 () Bool)

(declare-fun res!131462 () Bool)

(assert (=> b!267166 (=> (not res!131462) (not e!172745))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267166 (= res!131462 (and (= (size!6481 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6481 a!3436))))))

(declare-fun b!267167 () Bool)

(declare-fun res!131461 () Bool)

(assert (=> b!267167 (=> (not res!131461) (not e!172745))))

(declare-fun arrayContainsKey!0 (array!12949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267167 (= res!131461 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267168 () Bool)

(declare-fun res!131465 () Bool)

(declare-fun e!172743 () Bool)

(assert (=> b!267168 (=> (not res!131465) (not e!172743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12949 (_ BitVec 32)) Bool)

(assert (=> b!267168 (= res!131465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267169 () Bool)

(assert (=> b!267169 (= e!172743 false)))

(declare-fun lt!134646 () Bool)

(declare-datatypes ((List!3943 0))(
  ( (Nil!3940) (Cons!3939 (h!4606 (_ BitVec 64)) (t!9025 List!3943)) )
))
(declare-fun arrayNoDuplicates!0 (array!12949 (_ BitVec 32) List!3943) Bool)

(assert (=> b!267169 (= lt!134646 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3940))))

(declare-fun b!267170 () Bool)

(assert (=> b!267170 (= e!172745 e!172743)))

(declare-fun res!131463 () Bool)

(assert (=> b!267170 (=> (not res!131463) (not e!172743))))

(declare-datatypes ((SeekEntryResult!1320 0))(
  ( (MissingZero!1320 (index!7450 (_ BitVec 32))) (Found!1320 (index!7451 (_ BitVec 32))) (Intermediate!1320 (undefined!2132 Bool) (index!7452 (_ BitVec 32)) (x!25741 (_ BitVec 32))) (Undefined!1320) (MissingVacant!1320 (index!7453 (_ BitVec 32))) )
))
(declare-fun lt!134647 () SeekEntryResult!1320)

(assert (=> b!267170 (= res!131463 (or (= lt!134647 (MissingZero!1320 i!1355)) (= lt!134647 (MissingVacant!1320 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12949 (_ BitVec 32)) SeekEntryResult!1320)

(assert (=> b!267170 (= lt!134647 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(assert (= (and start!25770 res!131466) b!267166))

(assert (= (and b!267166 res!131462) b!267165))

(assert (= (and b!267165 res!131464) b!267167))

(assert (= (and b!267167 res!131461) b!267170))

(assert (= (and b!267170 res!131463) b!267168))

(assert (= (and b!267168 res!131465) b!267169))

(declare-fun m!283595 () Bool)

(assert (=> b!267167 m!283595))

(declare-fun m!283597 () Bool)

(assert (=> b!267170 m!283597))

(declare-fun m!283599 () Bool)

(assert (=> b!267168 m!283599))

(declare-fun m!283601 () Bool)

(assert (=> b!267169 m!283601))

(declare-fun m!283603 () Bool)

(assert (=> start!25770 m!283603))

(declare-fun m!283605 () Bool)

(assert (=> start!25770 m!283605))

(declare-fun m!283607 () Bool)

(assert (=> b!267165 m!283607))

(check-sat (not b!267165) (not start!25770) (not b!267169) (not b!267167) (not b!267170) (not b!267168))
(check-sat)
