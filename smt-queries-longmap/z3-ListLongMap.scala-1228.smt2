; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25926 () Bool)

(assert start!25926)

(declare-fun b!267765 () Bool)

(declare-fun e!173087 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267765 (= e!173087 (bvslt mask!3868 #b00000000000000000000000000000000))))

(declare-fun b!267766 () Bool)

(declare-fun res!132017 () Bool)

(assert (=> b!267766 (=> (not res!132017) (not e!173087))))

(declare-datatypes ((array!13022 0))(
  ( (array!13023 (arr!6160 (Array (_ BitVec 32) (_ BitVec 64))) (size!6512 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13022)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267766 (= res!132017 (and (= (size!6512 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6512 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6512 a!3325))))))

(declare-fun b!267767 () Bool)

(declare-fun res!132018 () Bool)

(assert (=> b!267767 (=> (not res!132018) (not e!173087))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267767 (= res!132018 (validKeyInArray!0 k0!2581))))

(declare-fun b!267768 () Bool)

(declare-fun res!132019 () Bool)

(assert (=> b!267768 (=> (not res!132019) (not e!173087))))

(declare-fun arrayContainsKey!0 (array!13022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267768 (= res!132019 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132021 () Bool)

(assert (=> start!25926 (=> (not res!132021) (not e!173087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25926 (= res!132021 (validMask!0 mask!3868))))

(assert (=> start!25926 e!173087))

(declare-fun array_inv!4110 (array!13022) Bool)

(assert (=> start!25926 (array_inv!4110 a!3325)))

(assert (=> start!25926 true))

(declare-fun b!267769 () Bool)

(declare-fun res!132020 () Bool)

(assert (=> b!267769 (=> (not res!132020) (not e!173087))))

(declare-datatypes ((List!3881 0))(
  ( (Nil!3878) (Cons!3877 (h!4544 (_ BitVec 64)) (t!8955 List!3881)) )
))
(declare-fun arrayNoDuplicates!0 (array!13022 (_ BitVec 32) List!3881) Bool)

(assert (=> b!267769 (= res!132020 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3878))))

(assert (= (and start!25926 res!132021) b!267766))

(assert (= (and b!267766 res!132017) b!267767))

(assert (= (and b!267767 res!132018) b!267769))

(assert (= (and b!267769 res!132020) b!267768))

(assert (= (and b!267768 res!132019) b!267765))

(declare-fun m!284219 () Bool)

(assert (=> b!267767 m!284219))

(declare-fun m!284221 () Bool)

(assert (=> b!267768 m!284221))

(declare-fun m!284223 () Bool)

(assert (=> start!25926 m!284223))

(declare-fun m!284225 () Bool)

(assert (=> start!25926 m!284225))

(declare-fun m!284227 () Bool)

(assert (=> b!267769 m!284227))

(check-sat (not b!267767) (not start!25926) (not b!267769) (not b!267768))
(check-sat)
