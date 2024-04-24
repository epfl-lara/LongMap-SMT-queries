; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25884 () Bool)

(assert start!25884)

(declare-fun res!131892 () Bool)

(declare-fun e!172997 () Bool)

(assert (=> start!25884 (=> (not res!131892) (not e!172997))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25884 (= res!131892 (validMask!0 mask!3868))))

(assert (=> start!25884 e!172997))

(declare-datatypes ((array!13001 0))(
  ( (array!13002 (arr!6151 (Array (_ BitVec 32) (_ BitVec 64))) (size!6503 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13001)

(declare-fun array_inv!4101 (array!13001) Bool)

(assert (=> start!25884 (array_inv!4101 a!3325)))

(assert (=> start!25884 true))

(declare-fun b!267621 () Bool)

(declare-fun res!131890 () Bool)

(assert (=> b!267621 (=> (not res!131890) (not e!172997))))

(declare-datatypes ((List!3872 0))(
  ( (Nil!3869) (Cons!3868 (h!4535 (_ BitVec 64)) (t!8946 List!3872)) )
))
(declare-fun arrayNoDuplicates!0 (array!13001 (_ BitVec 32) List!3872) Bool)

(assert (=> b!267621 (= res!131890 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3869))))

(declare-fun b!267619 () Bool)

(declare-fun res!131889 () Bool)

(assert (=> b!267619 (=> (not res!131889) (not e!172997))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267619 (= res!131889 (and (= (size!6503 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6503 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6503 a!3325))))))

(declare-fun b!267620 () Bool)

(declare-fun res!131891 () Bool)

(assert (=> b!267620 (=> (not res!131891) (not e!172997))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267620 (= res!131891 (validKeyInArray!0 k0!2581))))

(declare-fun b!267622 () Bool)

(assert (=> b!267622 (= e!172997 (bvsge #b00000000000000000000000000000000 (size!6503 a!3325)))))

(assert (= (and start!25884 res!131892) b!267619))

(assert (= (and b!267619 res!131889) b!267620))

(assert (= (and b!267620 res!131891) b!267621))

(assert (= (and b!267621 res!131890) b!267622))

(declare-fun m!284123 () Bool)

(assert (=> start!25884 m!284123))

(declare-fun m!284125 () Bool)

(assert (=> start!25884 m!284125))

(declare-fun m!284127 () Bool)

(assert (=> b!267621 m!284127))

(declare-fun m!284129 () Bool)

(assert (=> b!267620 m!284129))

(check-sat (not b!267620) (not b!267621) (not start!25884))
(check-sat)
