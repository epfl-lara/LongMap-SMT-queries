; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25620 () Bool)

(assert start!25620)

(declare-fun b!265734 () Bool)

(declare-fun res!130030 () Bool)

(declare-fun e!172068 () Bool)

(assert (=> b!265734 (=> (not res!130030) (not e!172068))))

(declare-datatypes ((array!12799 0))(
  ( (array!12800 (arr!6054 (Array (_ BitVec 32) (_ BitVec 64))) (size!6406 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12799)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265734 (= res!130030 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun res!130031 () Bool)

(assert (=> start!25620 (=> (not res!130031) (not e!172068))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25620 (= res!130031 (validMask!0 mask!4002))))

(assert (=> start!25620 e!172068))

(assert (=> start!25620 true))

(declare-fun array_inv!4017 (array!12799) Bool)

(assert (=> start!25620 (array_inv!4017 a!3436)))

(declare-fun b!265735 () Bool)

(declare-fun e!172070 () Bool)

(assert (=> b!265735 (= e!172070 false)))

(declare-fun lt!134206 () Bool)

(declare-datatypes ((List!3868 0))(
  ( (Nil!3865) (Cons!3864 (h!4531 (_ BitVec 64)) (t!8950 List!3868)) )
))
(declare-fun arrayNoDuplicates!0 (array!12799 (_ BitVec 32) List!3868) Bool)

(assert (=> b!265735 (= lt!134206 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3865))))

(declare-fun b!265736 () Bool)

(declare-fun res!130032 () Bool)

(assert (=> b!265736 (=> (not res!130032) (not e!172068))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265736 (= res!130032 (and (= (size!6406 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6406 a!3436))))))

(declare-fun b!265737 () Bool)

(assert (=> b!265737 (= e!172068 e!172070)))

(declare-fun res!130034 () Bool)

(assert (=> b!265737 (=> (not res!130034) (not e!172070))))

(declare-datatypes ((SeekEntryResult!1245 0))(
  ( (MissingZero!1245 (index!7150 (_ BitVec 32))) (Found!1245 (index!7151 (_ BitVec 32))) (Intermediate!1245 (undefined!2057 Bool) (index!7152 (_ BitVec 32)) (x!25466 (_ BitVec 32))) (Undefined!1245) (MissingVacant!1245 (index!7153 (_ BitVec 32))) )
))
(declare-fun lt!134205 () SeekEntryResult!1245)

(assert (=> b!265737 (= res!130034 (or (= lt!134205 (MissingZero!1245 i!1355)) (= lt!134205 (MissingVacant!1245 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12799 (_ BitVec 32)) SeekEntryResult!1245)

(assert (=> b!265737 (= lt!134205 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265738 () Bool)

(declare-fun res!130035 () Bool)

(assert (=> b!265738 (=> (not res!130035) (not e!172070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12799 (_ BitVec 32)) Bool)

(assert (=> b!265738 (= res!130035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265739 () Bool)

(declare-fun res!130033 () Bool)

(assert (=> b!265739 (=> (not res!130033) (not e!172068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265739 (= res!130033 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25620 res!130031) b!265736))

(assert (= (and b!265736 res!130032) b!265739))

(assert (= (and b!265739 res!130033) b!265734))

(assert (= (and b!265734 res!130030) b!265737))

(assert (= (and b!265737 res!130034) b!265738))

(assert (= (and b!265738 res!130035) b!265735))

(declare-fun m!282473 () Bool)

(assert (=> b!265737 m!282473))

(declare-fun m!282475 () Bool)

(assert (=> b!265735 m!282475))

(declare-fun m!282477 () Bool)

(assert (=> b!265734 m!282477))

(declare-fun m!282479 () Bool)

(assert (=> start!25620 m!282479))

(declare-fun m!282481 () Bool)

(assert (=> start!25620 m!282481))

(declare-fun m!282483 () Bool)

(assert (=> b!265739 m!282483))

(declare-fun m!282485 () Bool)

(assert (=> b!265738 m!282485))

(check-sat (not b!265734) (not b!265738) (not b!265739) (not b!265737) (not start!25620) (not b!265735))
(check-sat)
