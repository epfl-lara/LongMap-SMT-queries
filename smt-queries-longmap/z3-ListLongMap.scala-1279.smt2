; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26232 () Bool)

(assert start!26232)

(declare-fun b!271498 () Bool)

(declare-fun e!174582 () Bool)

(assert (=> b!271498 (= e!174582 false)))

(declare-fun lt!135864 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4034 0))(
  ( (Nil!4031) (Cons!4030 (h!4697 (_ BitVec 64)) (t!9108 List!4034)) )
))
(declare-fun contains!1927 (List!4034 (_ BitVec 64)) Bool)

(assert (=> b!271498 (= lt!135864 (contains!1927 Nil!4031 k0!2581))))

(declare-fun res!135471 () Bool)

(declare-fun e!174583 () Bool)

(assert (=> start!26232 (=> (not res!135471) (not e!174583))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26232 (= res!135471 (validMask!0 mask!3868))))

(assert (=> start!26232 e!174583))

(declare-datatypes ((array!13328 0))(
  ( (array!13329 (arr!6313 (Array (_ BitVec 32) (_ BitVec 64))) (size!6665 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13328)

(declare-fun array_inv!4263 (array!13328) Bool)

(assert (=> start!26232 (array_inv!4263 a!3325)))

(assert (=> start!26232 true))

(declare-fun b!271499 () Bool)

(declare-fun res!135468 () Bool)

(assert (=> b!271499 (=> (not res!135468) (not e!174583))))

(declare-fun arrayContainsKey!0 (array!13328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271499 (= res!135468 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271500 () Bool)

(declare-fun res!135463 () Bool)

(assert (=> b!271500 (=> (not res!135463) (not e!174583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271500 (= res!135463 (validKeyInArray!0 k0!2581))))

(declare-fun b!271501 () Bool)

(declare-fun res!135466 () Bool)

(assert (=> b!271501 (=> (not res!135466) (not e!174582))))

(assert (=> b!271501 (= res!135466 (not (contains!1927 Nil!4031 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271502 () Bool)

(assert (=> b!271502 (= e!174583 e!174582)))

(declare-fun res!135470 () Bool)

(assert (=> b!271502 (=> (not res!135470) (not e!174582))))

(declare-datatypes ((SeekEntryResult!1436 0))(
  ( (MissingZero!1436 (index!7914 (_ BitVec 32))) (Found!1436 (index!7915 (_ BitVec 32))) (Intermediate!1436 (undefined!2248 Bool) (index!7916 (_ BitVec 32)) (x!26353 (_ BitVec 32))) (Undefined!1436) (MissingVacant!1436 (index!7917 (_ BitVec 32))) )
))
(declare-fun lt!135863 () SeekEntryResult!1436)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271502 (= res!135470 (or (= lt!135863 (MissingZero!1436 i!1267)) (= lt!135863 (MissingVacant!1436 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13328 (_ BitVec 32)) SeekEntryResult!1436)

(assert (=> b!271502 (= lt!135863 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271503 () Bool)

(declare-fun res!135464 () Bool)

(assert (=> b!271503 (=> (not res!135464) (not e!174582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13328 (_ BitVec 32)) Bool)

(assert (=> b!271503 (= res!135464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271504 () Bool)

(declare-fun res!135467 () Bool)

(assert (=> b!271504 (=> (not res!135467) (not e!174582))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!271504 (= res!135467 (validKeyInArray!0 (select (arr!6313 a!3325) startIndex!26)))))

(declare-fun b!271505 () Bool)

(declare-fun res!135473 () Bool)

(assert (=> b!271505 (=> (not res!135473) (not e!174583))))

(declare-fun arrayNoDuplicates!0 (array!13328 (_ BitVec 32) List!4034) Bool)

(assert (=> b!271505 (= res!135473 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4031))))

(declare-fun b!271506 () Bool)

(declare-fun res!135469 () Bool)

(assert (=> b!271506 (=> (not res!135469) (not e!174582))))

(assert (=> b!271506 (= res!135469 (not (contains!1927 Nil!4031 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271507 () Bool)

(declare-fun res!135472 () Bool)

(assert (=> b!271507 (=> (not res!135472) (not e!174582))))

(declare-fun noDuplicate!143 (List!4034) Bool)

(assert (=> b!271507 (= res!135472 (noDuplicate!143 Nil!4031))))

(declare-fun b!271508 () Bool)

(declare-fun res!135474 () Bool)

(assert (=> b!271508 (=> (not res!135474) (not e!174582))))

(assert (=> b!271508 (= res!135474 (not (= startIndex!26 i!1267)))))

(declare-fun b!271509 () Bool)

(declare-fun res!135465 () Bool)

(assert (=> b!271509 (=> (not res!135465) (not e!174582))))

(assert (=> b!271509 (= res!135465 (and (bvslt (size!6665 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6665 a!3325))))))

(declare-fun b!271510 () Bool)

(declare-fun res!135462 () Bool)

(assert (=> b!271510 (=> (not res!135462) (not e!174583))))

(assert (=> b!271510 (= res!135462 (and (= (size!6665 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6665 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6665 a!3325))))))

(assert (= (and start!26232 res!135471) b!271510))

(assert (= (and b!271510 res!135462) b!271500))

(assert (= (and b!271500 res!135463) b!271505))

(assert (= (and b!271505 res!135473) b!271499))

(assert (= (and b!271499 res!135468) b!271502))

(assert (= (and b!271502 res!135470) b!271503))

(assert (= (and b!271503 res!135464) b!271508))

(assert (= (and b!271508 res!135474) b!271504))

(assert (= (and b!271504 res!135467) b!271509))

(assert (= (and b!271509 res!135465) b!271507))

(assert (= (and b!271507 res!135472) b!271506))

(assert (= (and b!271506 res!135469) b!271501))

(assert (= (and b!271501 res!135466) b!271498))

(declare-fun m!286937 () Bool)

(assert (=> b!271503 m!286937))

(declare-fun m!286939 () Bool)

(assert (=> b!271501 m!286939))

(declare-fun m!286941 () Bool)

(assert (=> b!271500 m!286941))

(declare-fun m!286943 () Bool)

(assert (=> b!271506 m!286943))

(declare-fun m!286945 () Bool)

(assert (=> b!271505 m!286945))

(declare-fun m!286947 () Bool)

(assert (=> start!26232 m!286947))

(declare-fun m!286949 () Bool)

(assert (=> start!26232 m!286949))

(declare-fun m!286951 () Bool)

(assert (=> b!271507 m!286951))

(declare-fun m!286953 () Bool)

(assert (=> b!271504 m!286953))

(assert (=> b!271504 m!286953))

(declare-fun m!286955 () Bool)

(assert (=> b!271504 m!286955))

(declare-fun m!286957 () Bool)

(assert (=> b!271499 m!286957))

(declare-fun m!286959 () Bool)

(assert (=> b!271498 m!286959))

(declare-fun m!286961 () Bool)

(assert (=> b!271502 m!286961))

(check-sat (not start!26232) (not b!271507) (not b!271504) (not b!271499) (not b!271506) (not b!271503) (not b!271501) (not b!271500) (not b!271502) (not b!271505) (not b!271498))
(check-sat)
