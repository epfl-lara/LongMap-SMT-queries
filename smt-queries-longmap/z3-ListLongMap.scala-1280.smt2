; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26240 () Bool)

(assert start!26240)

(declare-fun b!271607 () Bool)

(declare-fun res!135606 () Bool)

(declare-fun e!174595 () Bool)

(assert (=> b!271607 (=> (not res!135606) (not e!174595))))

(declare-datatypes ((array!13337 0))(
  ( (array!13338 (arr!6318 (Array (_ BitVec 32) (_ BitVec 64))) (size!6670 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13337)

(assert (=> b!271607 (= res!135606 (and (bvslt (size!6670 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6670 a!3325))))))

(declare-fun b!271608 () Bool)

(declare-fun res!135608 () Bool)

(assert (=> b!271608 (=> (not res!135608) (not e!174595))))

(declare-datatypes ((List!4126 0))(
  ( (Nil!4123) (Cons!4122 (h!4789 (_ BitVec 64)) (t!9208 List!4126)) )
))
(declare-fun contains!1956 (List!4126 (_ BitVec 64)) Bool)

(assert (=> b!271608 (= res!135608 (not (contains!1956 Nil!4123 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271609 () Bool)

(declare-fun res!135607 () Bool)

(declare-fun e!174596 () Bool)

(assert (=> b!271609 (=> (not res!135607) (not e!174596))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271609 (= res!135607 (and (= (size!6670 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6670 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6670 a!3325))))))

(declare-fun b!271610 () Bool)

(declare-fun res!135597 () Bool)

(assert (=> b!271610 (=> (not res!135597) (not e!174595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271610 (= res!135597 (validKeyInArray!0 (select (arr!6318 a!3325) startIndex!26)))))

(declare-fun b!271611 () Bool)

(declare-fun res!135605 () Bool)

(assert (=> b!271611 (=> (not res!135605) (not e!174595))))

(assert (=> b!271611 (= res!135605 (not (= startIndex!26 i!1267)))))

(declare-fun b!271612 () Bool)

(declare-fun res!135602 () Bool)

(assert (=> b!271612 (=> (not res!135602) (not e!174596))))

(declare-fun arrayNoDuplicates!0 (array!13337 (_ BitVec 32) List!4126) Bool)

(assert (=> b!271612 (= res!135602 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4123))))

(declare-fun b!271613 () Bool)

(assert (=> b!271613 (= e!174596 e!174595)))

(declare-fun res!135609 () Bool)

(assert (=> b!271613 (=> (not res!135609) (not e!174595))))

(declare-datatypes ((SeekEntryResult!1476 0))(
  ( (MissingZero!1476 (index!8074 (_ BitVec 32))) (Found!1476 (index!8075 (_ BitVec 32))) (Intermediate!1476 (undefined!2288 Bool) (index!8076 (_ BitVec 32)) (x!26401 (_ BitVec 32))) (Undefined!1476) (MissingVacant!1476 (index!8077 (_ BitVec 32))) )
))
(declare-fun lt!135828 () SeekEntryResult!1476)

(assert (=> b!271613 (= res!135609 (or (= lt!135828 (MissingZero!1476 i!1267)) (= lt!135828 (MissingVacant!1476 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13337 (_ BitVec 32)) SeekEntryResult!1476)

(assert (=> b!271613 (= lt!135828 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271614 () Bool)

(declare-fun res!135599 () Bool)

(assert (=> b!271614 (=> (not res!135599) (not e!174596))))

(declare-fun arrayContainsKey!0 (array!13337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271614 (= res!135599 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271615 () Bool)

(declare-fun res!135604 () Bool)

(assert (=> b!271615 (=> (not res!135604) (not e!174595))))

(assert (=> b!271615 (= res!135604 (not (contains!1956 Nil!4123 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271616 () Bool)

(declare-fun res!135600 () Bool)

(assert (=> b!271616 (=> (not res!135600) (not e!174596))))

(assert (=> b!271616 (= res!135600 (validKeyInArray!0 k0!2581))))

(declare-fun res!135601 () Bool)

(assert (=> start!26240 (=> (not res!135601) (not e!174596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26240 (= res!135601 (validMask!0 mask!3868))))

(assert (=> start!26240 e!174596))

(declare-fun array_inv!4281 (array!13337) Bool)

(assert (=> start!26240 (array_inv!4281 a!3325)))

(assert (=> start!26240 true))

(declare-fun b!271617 () Bool)

(assert (=> b!271617 (= e!174595 false)))

(declare-fun lt!135829 () Bool)

(assert (=> b!271617 (= lt!135829 (contains!1956 Nil!4123 k0!2581))))

(declare-fun b!271618 () Bool)

(declare-fun res!135598 () Bool)

(assert (=> b!271618 (=> (not res!135598) (not e!174595))))

(declare-fun noDuplicate!144 (List!4126) Bool)

(assert (=> b!271618 (= res!135598 (noDuplicate!144 Nil!4123))))

(declare-fun b!271619 () Bool)

(declare-fun res!135603 () Bool)

(assert (=> b!271619 (=> (not res!135603) (not e!174595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13337 (_ BitVec 32)) Bool)

(assert (=> b!271619 (= res!135603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26240 res!135601) b!271609))

(assert (= (and b!271609 res!135607) b!271616))

(assert (= (and b!271616 res!135600) b!271612))

(assert (= (and b!271612 res!135602) b!271614))

(assert (= (and b!271614 res!135599) b!271613))

(assert (= (and b!271613 res!135609) b!271619))

(assert (= (and b!271619 res!135603) b!271611))

(assert (= (and b!271611 res!135605) b!271610))

(assert (= (and b!271610 res!135597) b!271607))

(assert (= (and b!271607 res!135606) b!271618))

(assert (= (and b!271618 res!135598) b!271608))

(assert (= (and b!271608 res!135608) b!271615))

(assert (= (and b!271615 res!135604) b!271617))

(declare-fun m!286835 () Bool)

(assert (=> b!271612 m!286835))

(declare-fun m!286837 () Bool)

(assert (=> start!26240 m!286837))

(declare-fun m!286839 () Bool)

(assert (=> start!26240 m!286839))

(declare-fun m!286841 () Bool)

(assert (=> b!271615 m!286841))

(declare-fun m!286843 () Bool)

(assert (=> b!271608 m!286843))

(declare-fun m!286845 () Bool)

(assert (=> b!271614 m!286845))

(declare-fun m!286847 () Bool)

(assert (=> b!271618 m!286847))

(declare-fun m!286849 () Bool)

(assert (=> b!271613 m!286849))

(declare-fun m!286851 () Bool)

(assert (=> b!271610 m!286851))

(assert (=> b!271610 m!286851))

(declare-fun m!286853 () Bool)

(assert (=> b!271610 m!286853))

(declare-fun m!286855 () Bool)

(assert (=> b!271619 m!286855))

(declare-fun m!286857 () Bool)

(assert (=> b!271617 m!286857))

(declare-fun m!286859 () Bool)

(assert (=> b!271616 m!286859))

(check-sat (not b!271616) (not b!271614) (not b!271608) (not b!271612) (not b!271619) (not b!271618) (not start!26240) (not b!271610) (not b!271617) (not b!271615) (not b!271613))
(check-sat)
