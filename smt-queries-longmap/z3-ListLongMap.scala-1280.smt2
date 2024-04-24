; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26238 () Bool)

(assert start!26238)

(declare-fun b!271615 () Bool)

(declare-fun res!135580 () Bool)

(declare-fun e!174609 () Bool)

(assert (=> b!271615 (=> (not res!135580) (not e!174609))))

(declare-datatypes ((array!13334 0))(
  ( (array!13335 (arr!6316 (Array (_ BitVec 32) (_ BitVec 64))) (size!6668 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13334)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271615 (= res!135580 (validKeyInArray!0 (select (arr!6316 a!3325) startIndex!26)))))

(declare-fun res!135591 () Bool)

(declare-fun e!174610 () Bool)

(assert (=> start!26238 (=> (not res!135591) (not e!174610))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26238 (= res!135591 (validMask!0 mask!3868))))

(assert (=> start!26238 e!174610))

(declare-fun array_inv!4266 (array!13334) Bool)

(assert (=> start!26238 (array_inv!4266 a!3325)))

(assert (=> start!26238 true))

(declare-fun b!271616 () Bool)

(declare-fun res!135584 () Bool)

(assert (=> b!271616 (=> (not res!135584) (not e!174610))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271616 (= res!135584 (and (= (size!6668 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6668 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6668 a!3325))))))

(declare-fun b!271617 () Bool)

(declare-fun res!135590 () Bool)

(assert (=> b!271617 (=> (not res!135590) (not e!174609))))

(assert (=> b!271617 (= res!135590 (not (= startIndex!26 i!1267)))))

(declare-fun b!271618 () Bool)

(declare-fun res!135589 () Bool)

(assert (=> b!271618 (=> (not res!135589) (not e!174609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13334 (_ BitVec 32)) Bool)

(assert (=> b!271618 (= res!135589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271619 () Bool)

(declare-fun res!135588 () Bool)

(assert (=> b!271619 (=> (not res!135588) (not e!174610))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!271619 (= res!135588 (validKeyInArray!0 k0!2581))))

(declare-fun b!271620 () Bool)

(declare-fun res!135586 () Bool)

(assert (=> b!271620 (=> (not res!135586) (not e!174610))))

(declare-fun arrayContainsKey!0 (array!13334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271620 (= res!135586 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271621 () Bool)

(assert (=> b!271621 (= e!174609 false)))

(declare-fun lt!135881 () Bool)

(declare-datatypes ((List!4037 0))(
  ( (Nil!4034) (Cons!4033 (h!4700 (_ BitVec 64)) (t!9111 List!4037)) )
))
(declare-fun contains!1930 (List!4037 (_ BitVec 64)) Bool)

(assert (=> b!271621 (= lt!135881 (contains!1930 Nil!4034 k0!2581))))

(declare-fun b!271622 () Bool)

(declare-fun res!135583 () Bool)

(assert (=> b!271622 (=> (not res!135583) (not e!174610))))

(declare-fun arrayNoDuplicates!0 (array!13334 (_ BitVec 32) List!4037) Bool)

(assert (=> b!271622 (= res!135583 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4034))))

(declare-fun b!271623 () Bool)

(declare-fun res!135587 () Bool)

(assert (=> b!271623 (=> (not res!135587) (not e!174609))))

(assert (=> b!271623 (= res!135587 (and (bvslt (size!6668 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6668 a!3325))))))

(declare-fun b!271624 () Bool)

(declare-fun res!135585 () Bool)

(assert (=> b!271624 (=> (not res!135585) (not e!174609))))

(assert (=> b!271624 (= res!135585 (not (contains!1930 Nil!4034 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271625 () Bool)

(assert (=> b!271625 (= e!174610 e!174609)))

(declare-fun res!135582 () Bool)

(assert (=> b!271625 (=> (not res!135582) (not e!174609))))

(declare-datatypes ((SeekEntryResult!1439 0))(
  ( (MissingZero!1439 (index!7926 (_ BitVec 32))) (Found!1439 (index!7927 (_ BitVec 32))) (Intermediate!1439 (undefined!2251 Bool) (index!7928 (_ BitVec 32)) (x!26364 (_ BitVec 32))) (Undefined!1439) (MissingVacant!1439 (index!7929 (_ BitVec 32))) )
))
(declare-fun lt!135882 () SeekEntryResult!1439)

(assert (=> b!271625 (= res!135582 (or (= lt!135882 (MissingZero!1439 i!1267)) (= lt!135882 (MissingVacant!1439 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13334 (_ BitVec 32)) SeekEntryResult!1439)

(assert (=> b!271625 (= lt!135882 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271626 () Bool)

(declare-fun res!135579 () Bool)

(assert (=> b!271626 (=> (not res!135579) (not e!174609))))

(assert (=> b!271626 (= res!135579 (not (contains!1930 Nil!4034 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271627 () Bool)

(declare-fun res!135581 () Bool)

(assert (=> b!271627 (=> (not res!135581) (not e!174609))))

(declare-fun noDuplicate!146 (List!4037) Bool)

(assert (=> b!271627 (= res!135581 (noDuplicate!146 Nil!4034))))

(assert (= (and start!26238 res!135591) b!271616))

(assert (= (and b!271616 res!135584) b!271619))

(assert (= (and b!271619 res!135588) b!271622))

(assert (= (and b!271622 res!135583) b!271620))

(assert (= (and b!271620 res!135586) b!271625))

(assert (= (and b!271625 res!135582) b!271618))

(assert (= (and b!271618 res!135589) b!271617))

(assert (= (and b!271617 res!135590) b!271615))

(assert (= (and b!271615 res!135580) b!271623))

(assert (= (and b!271623 res!135587) b!271627))

(assert (= (and b!271627 res!135581) b!271624))

(assert (= (and b!271624 res!135585) b!271626))

(assert (= (and b!271626 res!135579) b!271621))

(declare-fun m!287015 () Bool)

(assert (=> b!271615 m!287015))

(assert (=> b!271615 m!287015))

(declare-fun m!287017 () Bool)

(assert (=> b!271615 m!287017))

(declare-fun m!287019 () Bool)

(assert (=> b!271627 m!287019))

(declare-fun m!287021 () Bool)

(assert (=> b!271626 m!287021))

(declare-fun m!287023 () Bool)

(assert (=> b!271620 m!287023))

(declare-fun m!287025 () Bool)

(assert (=> b!271621 m!287025))

(declare-fun m!287027 () Bool)

(assert (=> start!26238 m!287027))

(declare-fun m!287029 () Bool)

(assert (=> start!26238 m!287029))

(declare-fun m!287031 () Bool)

(assert (=> b!271619 m!287031))

(declare-fun m!287033 () Bool)

(assert (=> b!271622 m!287033))

(declare-fun m!287035 () Bool)

(assert (=> b!271624 m!287035))

(declare-fun m!287037 () Bool)

(assert (=> b!271618 m!287037))

(declare-fun m!287039 () Bool)

(assert (=> b!271625 m!287039))

(check-sat (not b!271620) (not b!271615) (not b!271624) (not b!271627) (not b!271626) (not start!26238) (not b!271622) (not b!271619) (not b!271621) (not b!271618) (not b!271625))
(check-sat)
