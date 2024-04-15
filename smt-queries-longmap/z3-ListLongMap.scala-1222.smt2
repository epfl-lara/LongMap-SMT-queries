; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25816 () Bool)

(assert start!25816)

(declare-fun b!267250 () Bool)

(declare-fun res!131599 () Bool)

(declare-fun e!172749 () Bool)

(assert (=> b!267250 (=> (not res!131599) (not e!172749))))

(declare-datatypes ((array!12970 0))(
  ( (array!12971 (arr!6138 (Array (_ BitVec 32) (_ BitVec 64))) (size!6491 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12970)

(assert (=> b!267250 (= res!131599 (and (bvsle #b00000000000000000000000000000000 (size!6491 a!3325)) (bvslt (size!6491 a!3325) #b01111111111111111111111111111111)))))

(declare-fun b!267251 () Bool)

(declare-datatypes ((List!3919 0))(
  ( (Nil!3916) (Cons!3915 (h!4582 (_ BitVec 64)) (t!8992 List!3919)) )
))
(declare-fun noDuplicate!112 (List!3919) Bool)

(assert (=> b!267251 (= e!172749 (not (noDuplicate!112 Nil!3916)))))

(declare-fun b!267248 () Bool)

(declare-fun res!131597 () Bool)

(assert (=> b!267248 (=> (not res!131597) (not e!172749))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267248 (= res!131597 (and (= (size!6491 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6491 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6491 a!3325))))))

(declare-fun b!267249 () Bool)

(declare-fun res!131596 () Bool)

(assert (=> b!267249 (=> (not res!131596) (not e!172749))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267249 (= res!131596 (validKeyInArray!0 k0!2581))))

(declare-fun res!131598 () Bool)

(assert (=> start!25816 (=> (not res!131598) (not e!172749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25816 (= res!131598 (validMask!0 mask!3868))))

(assert (=> start!25816 e!172749))

(declare-fun array_inv!4110 (array!12970) Bool)

(assert (=> start!25816 (array_inv!4110 a!3325)))

(assert (=> start!25816 true))

(assert (= (and start!25816 res!131598) b!267248))

(assert (= (and b!267248 res!131597) b!267249))

(assert (= (and b!267249 res!131596) b!267250))

(assert (= (and b!267250 res!131599) b!267251))

(declare-fun m!283187 () Bool)

(assert (=> b!267251 m!283187))

(declare-fun m!283189 () Bool)

(assert (=> b!267249 m!283189))

(declare-fun m!283191 () Bool)

(assert (=> start!25816 m!283191))

(declare-fun m!283193 () Bool)

(assert (=> start!25816 m!283193))

(check-sat (not start!25816) (not b!267249) (not b!267251))
(check-sat)
(get-model)

(declare-fun d!64173 () Bool)

(assert (=> d!64173 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25816 d!64173))

(declare-fun d!64181 () Bool)

(assert (=> d!64181 (= (array_inv!4110 a!3325) (bvsge (size!6491 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!25816 d!64181))

(declare-fun d!64183 () Bool)

(assert (=> d!64183 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!267249 d!64183))

(declare-fun d!64185 () Bool)

(declare-fun res!131634 () Bool)

(declare-fun e!172772 () Bool)

(assert (=> d!64185 (=> res!131634 e!172772)))

(get-info :version)

(assert (=> d!64185 (= res!131634 ((_ is Nil!3916) Nil!3916))))

(assert (=> d!64185 (= (noDuplicate!112 Nil!3916) e!172772)))

(declare-fun b!267286 () Bool)

(declare-fun e!172773 () Bool)

(assert (=> b!267286 (= e!172772 e!172773)))

(declare-fun res!131635 () Bool)

(assert (=> b!267286 (=> (not res!131635) (not e!172773))))

(declare-fun contains!1899 (List!3919 (_ BitVec 64)) Bool)

(assert (=> b!267286 (= res!131635 (not (contains!1899 (t!8992 Nil!3916) (h!4582 Nil!3916))))))

(declare-fun b!267287 () Bool)

(assert (=> b!267287 (= e!172773 (noDuplicate!112 (t!8992 Nil!3916)))))

(assert (= (and d!64185 (not res!131634)) b!267286))

(assert (= (and b!267286 res!131635) b!267287))

(declare-fun m!283215 () Bool)

(assert (=> b!267286 m!283215))

(declare-fun m!283217 () Bool)

(assert (=> b!267287 m!283217))

(assert (=> b!267251 d!64185))

(check-sat (not b!267286) (not b!267287))
(check-sat)
