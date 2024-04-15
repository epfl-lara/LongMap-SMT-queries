; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25928 () Bool)

(assert start!25928)

(declare-fun b!267571 () Bool)

(declare-fun res!131901 () Bool)

(declare-fun e!172961 () Bool)

(assert (=> b!267571 (=> (not res!131901) (not e!172961))))

(declare-datatypes ((array!13014 0))(
  ( (array!13015 (arr!6156 (Array (_ BitVec 32) (_ BitVec 64))) (size!6509 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13014)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267571 (= res!131901 (and (= (size!6509 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6509 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6509 a!3325))))))

(declare-fun res!131903 () Bool)

(assert (=> start!25928 (=> (not res!131903) (not e!172961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25928 (= res!131903 (validMask!0 mask!3868))))

(assert (=> start!25928 e!172961))

(declare-fun array_inv!4128 (array!13014) Bool)

(assert (=> start!25928 (array_inv!4128 a!3325)))

(assert (=> start!25928 true))

(declare-fun b!267572 () Bool)

(declare-fun res!131902 () Bool)

(assert (=> b!267572 (=> (not res!131902) (not e!172961))))

(declare-datatypes ((List!3937 0))(
  ( (Nil!3934) (Cons!3933 (h!4600 (_ BitVec 64)) (t!9010 List!3937)) )
))
(declare-fun arrayNoDuplicates!0 (array!13014 (_ BitVec 32) List!3937) Bool)

(assert (=> b!267572 (= res!131902 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3934))))

(declare-fun b!267573 () Bool)

(declare-fun res!131904 () Bool)

(assert (=> b!267573 (=> (not res!131904) (not e!172961))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267573 (= res!131904 (validKeyInArray!0 k0!2581))))

(declare-fun b!267574 () Bool)

(declare-fun res!131905 () Bool)

(assert (=> b!267574 (=> (not res!131905) (not e!172961))))

(declare-fun arrayContainsKey!0 (array!13014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267574 (= res!131905 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267575 () Bool)

(assert (=> b!267575 (= e!172961 (bvslt mask!3868 #b00000000000000000000000000000000))))

(assert (= (and start!25928 res!131903) b!267571))

(assert (= (and b!267571 res!131901) b!267573))

(assert (= (and b!267573 res!131904) b!267572))

(assert (= (and b!267572 res!131902) b!267574))

(assert (= (and b!267574 res!131905) b!267575))

(declare-fun m!283421 () Bool)

(assert (=> start!25928 m!283421))

(declare-fun m!283423 () Bool)

(assert (=> start!25928 m!283423))

(declare-fun m!283425 () Bool)

(assert (=> b!267572 m!283425))

(declare-fun m!283427 () Bool)

(assert (=> b!267573 m!283427))

(declare-fun m!283429 () Bool)

(assert (=> b!267574 m!283429))

(check-sat (not start!25928) (not b!267574) (not b!267573) (not b!267572))
(check-sat)
