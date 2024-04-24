; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25754 () Bool)

(assert start!25754)

(declare-fun b!267032 () Bool)

(declare-fun res!131306 () Bool)

(declare-fun e!172679 () Bool)

(assert (=> b!267032 (=> (not res!131306) (not e!172679))))

(declare-datatypes ((array!12928 0))(
  ( (array!12929 (arr!6118 (Array (_ BitVec 32) (_ BitVec 64))) (size!6470 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12928)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267032 (= res!131306 (and (= (size!6470 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6470 a!3436))))))

(declare-fun res!131302 () Bool)

(assert (=> start!25754 (=> (not res!131302) (not e!172679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25754 (= res!131302 (validMask!0 mask!4002))))

(assert (=> start!25754 e!172679))

(assert (=> start!25754 true))

(declare-fun array_inv!4068 (array!12928) Bool)

(assert (=> start!25754 (array_inv!4068 a!3436)))

(declare-fun b!267033 () Bool)

(declare-fun res!131304 () Bool)

(declare-fun e!172677 () Bool)

(assert (=> b!267033 (=> (not res!131304) (not e!172677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12928 (_ BitVec 32)) Bool)

(assert (=> b!267033 (= res!131304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267034 () Bool)

(assert (=> b!267034 (= e!172677 false)))

(declare-fun lt!134645 () Bool)

(declare-datatypes ((List!3845 0))(
  ( (Nil!3842) (Cons!3841 (h!4508 (_ BitVec 64)) (t!8919 List!3845)) )
))
(declare-fun arrayNoDuplicates!0 (array!12928 (_ BitVec 32) List!3845) Bool)

(assert (=> b!267034 (= lt!134645 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3842))))

(declare-fun b!267035 () Bool)

(declare-fun res!131305 () Bool)

(assert (=> b!267035 (=> (not res!131305) (not e!172679))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267035 (= res!131305 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267036 () Bool)

(assert (=> b!267036 (= e!172679 e!172677)))

(declare-fun res!131303 () Bool)

(assert (=> b!267036 (=> (not res!131303) (not e!172677))))

(declare-datatypes ((SeekEntryResult!1274 0))(
  ( (MissingZero!1274 (index!7266 (_ BitVec 32))) (Found!1274 (index!7267 (_ BitVec 32))) (Intermediate!1274 (undefined!2086 Bool) (index!7268 (_ BitVec 32)) (x!25671 (_ BitVec 32))) (Undefined!1274) (MissingVacant!1274 (index!7269 (_ BitVec 32))) )
))
(declare-fun lt!134646 () SeekEntryResult!1274)

(assert (=> b!267036 (= res!131303 (or (= lt!134646 (MissingZero!1274 i!1355)) (= lt!134646 (MissingVacant!1274 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12928 (_ BitVec 32)) SeekEntryResult!1274)

(assert (=> b!267036 (= lt!134646 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!267037 () Bool)

(declare-fun res!131307 () Bool)

(assert (=> b!267037 (=> (not res!131307) (not e!172679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267037 (= res!131307 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25754 res!131302) b!267032))

(assert (= (and b!267032 res!131306) b!267037))

(assert (= (and b!267037 res!131307) b!267035))

(assert (= (and b!267035 res!131305) b!267036))

(assert (= (and b!267036 res!131303) b!267033))

(assert (= (and b!267033 res!131304) b!267034))

(declare-fun m!283661 () Bool)

(assert (=> b!267033 m!283661))

(declare-fun m!283663 () Bool)

(assert (=> start!25754 m!283663))

(declare-fun m!283665 () Bool)

(assert (=> start!25754 m!283665))

(declare-fun m!283667 () Bool)

(assert (=> b!267036 m!283667))

(declare-fun m!283669 () Bool)

(assert (=> b!267035 m!283669))

(declare-fun m!283671 () Bool)

(assert (=> b!267037 m!283671))

(declare-fun m!283673 () Bool)

(assert (=> b!267034 m!283673))

(check-sat (not b!267033) (not b!267036) (not start!25754) (not b!267034) (not b!267037) (not b!267035))
(check-sat)
