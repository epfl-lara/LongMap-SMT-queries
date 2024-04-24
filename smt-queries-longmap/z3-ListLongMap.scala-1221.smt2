; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25796 () Bool)

(assert start!25796)

(declare-fun res!131685 () Bool)

(declare-fun e!172856 () Bool)

(assert (=> start!25796 (=> (not res!131685) (not e!172856))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25796 (= res!131685 (validMask!0 mask!3868))))

(assert (=> start!25796 e!172856))

(declare-datatypes ((array!12970 0))(
  ( (array!12971 (arr!6139 (Array (_ BitVec 32) (_ BitVec 64))) (size!6491 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12970)

(declare-fun array_inv!4089 (array!12970) Bool)

(assert (=> start!25796 (array_inv!4089 a!3325)))

(assert (=> start!25796 true))

(declare-fun b!267413 () Bool)

(declare-fun res!131683 () Bool)

(assert (=> b!267413 (=> (not res!131683) (not e!172856))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267413 (= res!131683 (and (= (size!6491 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6491 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6491 a!3325))))))

(declare-fun b!267414 () Bool)

(declare-fun res!131684 () Bool)

(assert (=> b!267414 (=> (not res!131684) (not e!172856))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267414 (= res!131684 (validKeyInArray!0 k0!2581))))

(declare-fun b!267415 () Bool)

(assert (=> b!267415 (= e!172856 (and (bvsle #b00000000000000000000000000000000 (size!6491 a!3325)) (bvsge (size!6491 a!3325) #b01111111111111111111111111111111)))))

(assert (= (and start!25796 res!131685) b!267413))

(assert (= (and b!267413 res!131683) b!267414))

(assert (= (and b!267414 res!131684) b!267415))

(declare-fun m!283967 () Bool)

(assert (=> start!25796 m!283967))

(declare-fun m!283969 () Bool)

(assert (=> start!25796 m!283969))

(declare-fun m!283971 () Bool)

(assert (=> b!267414 m!283971))

(check-sat (not start!25796) (not b!267414))
(check-sat)
(get-model)

(declare-fun d!64379 () Bool)

(assert (=> d!64379 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25796 d!64379))

(declare-fun d!64385 () Bool)

(assert (=> d!64385 (= (array_inv!4089 a!3325) (bvsge (size!6491 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!25796 d!64385))

(declare-fun d!64387 () Bool)

(assert (=> d!64387 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!267414 d!64387))

(check-sat)
