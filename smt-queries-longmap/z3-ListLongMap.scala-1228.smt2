; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25928 () Bool)

(assert start!25928)

(declare-fun b!267733 () Bool)

(declare-fun res!132012 () Bool)

(declare-fun e!173069 () Bool)

(assert (=> b!267733 (=> (not res!132012) (not e!173069))))

(declare-datatypes ((array!13025 0))(
  ( (array!13026 (arr!6162 (Array (_ BitVec 32) (_ BitVec 64))) (size!6514 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13025)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267733 (= res!132012 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267734 () Bool)

(declare-fun res!132013 () Bool)

(assert (=> b!267734 (=> (not res!132013) (not e!173069))))

(declare-datatypes ((List!3970 0))(
  ( (Nil!3967) (Cons!3966 (h!4633 (_ BitVec 64)) (t!9052 List!3970)) )
))
(declare-fun arrayNoDuplicates!0 (array!13025 (_ BitVec 32) List!3970) Bool)

(assert (=> b!267734 (= res!132013 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3967))))

(declare-fun b!267735 () Bool)

(declare-fun res!132015 () Bool)

(assert (=> b!267735 (=> (not res!132015) (not e!173069))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267735 (= res!132015 (and (= (size!6514 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6514 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6514 a!3325))))))

(declare-fun b!267736 () Bool)

(assert (=> b!267736 (= e!173069 (bvslt mask!3868 #b00000000000000000000000000000000))))

(declare-fun b!267737 () Bool)

(declare-fun res!132014 () Bool)

(assert (=> b!267737 (=> (not res!132014) (not e!173069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267737 (= res!132014 (validKeyInArray!0 k0!2581))))

(declare-fun res!132011 () Bool)

(assert (=> start!25928 (=> (not res!132011) (not e!173069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25928 (= res!132011 (validMask!0 mask!3868))))

(assert (=> start!25928 e!173069))

(declare-fun array_inv!4125 (array!13025) Bool)

(assert (=> start!25928 (array_inv!4125 a!3325)))

(assert (=> start!25928 true))

(assert (= (and start!25928 res!132011) b!267735))

(assert (= (and b!267735 res!132015) b!267737))

(assert (= (and b!267737 res!132014) b!267734))

(assert (= (and b!267734 res!132013) b!267733))

(assert (= (and b!267733 res!132012) b!267736))

(declare-fun m!284023 () Bool)

(assert (=> b!267733 m!284023))

(declare-fun m!284025 () Bool)

(assert (=> b!267734 m!284025))

(declare-fun m!284027 () Bool)

(assert (=> b!267737 m!284027))

(declare-fun m!284029 () Bool)

(assert (=> start!25928 m!284029))

(declare-fun m!284031 () Bool)

(assert (=> start!25928 m!284031))

(check-sat (not b!267737) (not b!267734) (not b!267733) (not start!25928))
(check-sat)
