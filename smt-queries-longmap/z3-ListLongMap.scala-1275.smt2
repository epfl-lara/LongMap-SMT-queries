; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26210 () Bool)

(assert start!26210)

(declare-fun b!271022 () Bool)

(declare-fun res!135021 () Bool)

(declare-fun e!174461 () Bool)

(assert (=> b!271022 (=> (not res!135021) (not e!174461))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271022 (= res!135021 (validKeyInArray!0 k0!2581))))

(declare-fun b!271023 () Bool)

(declare-fun res!135017 () Bool)

(declare-fun e!174460 () Bool)

(assert (=> b!271023 (=> (not res!135017) (not e!174460))))

(declare-datatypes ((array!13307 0))(
  ( (array!13308 (arr!6303 (Array (_ BitVec 32) (_ BitVec 64))) (size!6655 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13307)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13307 (_ BitVec 32)) Bool)

(assert (=> b!271023 (= res!135017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271024 () Bool)

(declare-fun res!135023 () Bool)

(assert (=> b!271024 (=> (not res!135023) (not e!174461))))

(declare-fun arrayContainsKey!0 (array!13307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271024 (= res!135023 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271025 () Bool)

(declare-fun res!135020 () Bool)

(assert (=> b!271025 (=> (not res!135020) (not e!174460))))

(declare-datatypes ((List!4111 0))(
  ( (Nil!4108) (Cons!4107 (h!4774 (_ BitVec 64)) (t!9193 List!4111)) )
))
(declare-fun noDuplicate!129 (List!4111) Bool)

(assert (=> b!271025 (= res!135020 (noDuplicate!129 Nil!4108))))

(declare-fun b!271026 () Bool)

(declare-fun res!135014 () Bool)

(assert (=> b!271026 (=> (not res!135014) (not e!174460))))

(declare-fun contains!1941 (List!4111 (_ BitVec 64)) Bool)

(assert (=> b!271026 (= res!135014 (not (contains!1941 Nil!4108 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271027 () Bool)

(declare-fun res!135016 () Bool)

(assert (=> b!271027 (=> (not res!135016) (not e!174461))))

(declare-fun arrayNoDuplicates!0 (array!13307 (_ BitVec 32) List!4111) Bool)

(assert (=> b!271027 (= res!135016 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4108))))

(declare-fun b!271028 () Bool)

(declare-fun res!135022 () Bool)

(assert (=> b!271028 (=> (not res!135022) (not e!174460))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271028 (= res!135022 (not (= startIndex!26 i!1267)))))

(declare-fun b!271029 () Bool)

(declare-fun res!135019 () Bool)

(assert (=> b!271029 (=> (not res!135019) (not e!174460))))

(assert (=> b!271029 (= res!135019 (validKeyInArray!0 (select (arr!6303 a!3325) startIndex!26)))))

(declare-fun b!271030 () Bool)

(assert (=> b!271030 (= e!174460 false)))

(declare-fun lt!135739 () Bool)

(assert (=> b!271030 (= lt!135739 (contains!1941 Nil!4108 k0!2581))))

(declare-fun b!271031 () Bool)

(declare-fun res!135015 () Bool)

(assert (=> b!271031 (=> (not res!135015) (not e!174461))))

(assert (=> b!271031 (= res!135015 (and (= (size!6655 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6655 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6655 a!3325))))))

(declare-fun res!135018 () Bool)

(assert (=> start!26210 (=> (not res!135018) (not e!174461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26210 (= res!135018 (validMask!0 mask!3868))))

(assert (=> start!26210 e!174461))

(declare-fun array_inv!4266 (array!13307) Bool)

(assert (=> start!26210 (array_inv!4266 a!3325)))

(assert (=> start!26210 true))

(declare-fun b!271032 () Bool)

(declare-fun res!135013 () Bool)

(assert (=> b!271032 (=> (not res!135013) (not e!174460))))

(assert (=> b!271032 (= res!135013 (and (bvslt (size!6655 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6655 a!3325))))))

(declare-fun b!271033 () Bool)

(declare-fun res!135012 () Bool)

(assert (=> b!271033 (=> (not res!135012) (not e!174460))))

(assert (=> b!271033 (= res!135012 (not (contains!1941 Nil!4108 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271034 () Bool)

(assert (=> b!271034 (= e!174461 e!174460)))

(declare-fun res!135024 () Bool)

(assert (=> b!271034 (=> (not res!135024) (not e!174460))))

(declare-datatypes ((SeekEntryResult!1461 0))(
  ( (MissingZero!1461 (index!8014 (_ BitVec 32))) (Found!1461 (index!8015 (_ BitVec 32))) (Intermediate!1461 (undefined!2273 Bool) (index!8016 (_ BitVec 32)) (x!26346 (_ BitVec 32))) (Undefined!1461) (MissingVacant!1461 (index!8017 (_ BitVec 32))) )
))
(declare-fun lt!135738 () SeekEntryResult!1461)

(assert (=> b!271034 (= res!135024 (or (= lt!135738 (MissingZero!1461 i!1267)) (= lt!135738 (MissingVacant!1461 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13307 (_ BitVec 32)) SeekEntryResult!1461)

(assert (=> b!271034 (= lt!135738 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26210 res!135018) b!271031))

(assert (= (and b!271031 res!135015) b!271022))

(assert (= (and b!271022 res!135021) b!271027))

(assert (= (and b!271027 res!135016) b!271024))

(assert (= (and b!271024 res!135023) b!271034))

(assert (= (and b!271034 res!135024) b!271023))

(assert (= (and b!271023 res!135017) b!271028))

(assert (= (and b!271028 res!135022) b!271029))

(assert (= (and b!271029 res!135019) b!271032))

(assert (= (and b!271032 res!135013) b!271025))

(assert (= (and b!271025 res!135020) b!271026))

(assert (= (and b!271026 res!135014) b!271033))

(assert (= (and b!271033 res!135012) b!271030))

(declare-fun m!286445 () Bool)

(assert (=> b!271029 m!286445))

(assert (=> b!271029 m!286445))

(declare-fun m!286447 () Bool)

(assert (=> b!271029 m!286447))

(declare-fun m!286449 () Bool)

(assert (=> b!271033 m!286449))

(declare-fun m!286451 () Bool)

(assert (=> start!26210 m!286451))

(declare-fun m!286453 () Bool)

(assert (=> start!26210 m!286453))

(declare-fun m!286455 () Bool)

(assert (=> b!271023 m!286455))

(declare-fun m!286457 () Bool)

(assert (=> b!271034 m!286457))

(declare-fun m!286459 () Bool)

(assert (=> b!271025 m!286459))

(declare-fun m!286461 () Bool)

(assert (=> b!271022 m!286461))

(declare-fun m!286463 () Bool)

(assert (=> b!271024 m!286463))

(declare-fun m!286465 () Bool)

(assert (=> b!271030 m!286465))

(declare-fun m!286467 () Bool)

(assert (=> b!271027 m!286467))

(declare-fun m!286469 () Bool)

(assert (=> b!271026 m!286469))

(check-sat (not b!271022) (not b!271030) (not start!26210) (not b!271033) (not b!271025) (not b!271024) (not b!271026) (not b!271034) (not b!271023) (not b!271027) (not b!271029))
(check-sat)
