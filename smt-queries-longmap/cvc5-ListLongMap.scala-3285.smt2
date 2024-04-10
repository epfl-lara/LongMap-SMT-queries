; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45654 () Bool)

(assert start!45654)

(declare-fun b!503605 () Bool)

(declare-fun e!294916 () Bool)

(declare-fun e!294917 () Bool)

(assert (=> b!503605 (= e!294916 (not e!294917))))

(declare-fun res!304895 () Bool)

(assert (=> b!503605 (=> res!304895 e!294917)))

(declare-datatypes ((SeekEntryResult!4052 0))(
  ( (MissingZero!4052 (index!18396 (_ BitVec 32))) (Found!4052 (index!18397 (_ BitVec 32))) (Intermediate!4052 (undefined!4864 Bool) (index!18398 (_ BitVec 32)) (x!47421 (_ BitVec 32))) (Undefined!4052) (MissingVacant!4052 (index!18399 (_ BitVec 32))) )
))
(declare-fun lt!229139 () SeekEntryResult!4052)

(declare-datatypes ((array!32410 0))(
  ( (array!32411 (arr!15585 (Array (_ BitVec 32) (_ BitVec 64))) (size!15949 (_ BitVec 32))) )
))
(declare-fun lt!229137 () array!32410)

(declare-fun lt!229132 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!229138 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32410 (_ BitVec 32)) SeekEntryResult!4052)

(assert (=> b!503605 (= res!304895 (= lt!229139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229138 lt!229132 lt!229137 mask!3524)))))

(declare-fun lt!229141 () (_ BitVec 32))

(declare-fun a!3235 () array!32410)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!503605 (= lt!229139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229141 (select (arr!15585 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503605 (= lt!229138 (toIndex!0 lt!229132 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503605 (= lt!229132 (select (store (arr!15585 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503605 (= lt!229141 (toIndex!0 (select (arr!15585 a!3235) j!176) mask!3524))))

(assert (=> b!503605 (= lt!229137 (array!32411 (store (arr!15585 a!3235) i!1204 k!2280) (size!15949 a!3235)))))

(declare-fun e!294910 () Bool)

(assert (=> b!503605 e!294910))

(declare-fun res!304884 () Bool)

(assert (=> b!503605 (=> (not res!304884) (not e!294910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32410 (_ BitVec 32)) Bool)

(assert (=> b!503605 (= res!304884 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15284 0))(
  ( (Unit!15285) )
))
(declare-fun lt!229135 () Unit!15284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15284)

(assert (=> b!503605 (= lt!229135 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503606 () Bool)

(declare-fun res!304890 () Bool)

(assert (=> b!503606 (=> (not res!304890) (not e!294916))))

(declare-datatypes ((List!9743 0))(
  ( (Nil!9740) (Cons!9739 (h!10616 (_ BitVec 64)) (t!15971 List!9743)) )
))
(declare-fun arrayNoDuplicates!0 (array!32410 (_ BitVec 32) List!9743) Bool)

(assert (=> b!503606 (= res!304890 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9740))))

(declare-fun b!503607 () Bool)

(declare-fun res!304897 () Bool)

(assert (=> b!503607 (=> (not res!304897) (not e!294916))))

(assert (=> b!503607 (= res!304897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503608 () Bool)

(declare-fun e!294915 () Unit!15284)

(declare-fun Unit!15286 () Unit!15284)

(assert (=> b!503608 (= e!294915 Unit!15286)))

(declare-fun b!503609 () Bool)

(declare-fun res!304898 () Bool)

(assert (=> b!503609 (=> res!304898 e!294917)))

(assert (=> b!503609 (= res!304898 (or (undefined!4864 lt!229139) (not (is-Intermediate!4052 lt!229139))))))

(declare-fun b!503610 () Bool)

(declare-fun res!304887 () Bool)

(declare-fun e!294913 () Bool)

(assert (=> b!503610 (=> (not res!304887) (not e!294913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503610 (= res!304887 (validKeyInArray!0 k!2280))))

(declare-fun b!503611 () Bool)

(declare-fun res!304892 () Bool)

(assert (=> b!503611 (=> (not res!304892) (not e!294913))))

(declare-fun arrayContainsKey!0 (array!32410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503611 (= res!304892 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503612 () Bool)

(declare-fun res!304888 () Bool)

(assert (=> b!503612 (=> (not res!304888) (not e!294913))))

(assert (=> b!503612 (= res!304888 (and (= (size!15949 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15949 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15949 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503613 () Bool)

(declare-fun res!304891 () Bool)

(declare-fun e!294918 () Bool)

(assert (=> b!503613 (=> res!304891 e!294918)))

(declare-fun e!294911 () Bool)

(assert (=> b!503613 (= res!304891 e!294911)))

(declare-fun res!304896 () Bool)

(assert (=> b!503613 (=> (not res!304896) (not e!294911))))

(assert (=> b!503613 (= res!304896 (bvsgt #b00000000000000000000000000000000 (x!47421 lt!229139)))))

(declare-fun b!503614 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32410 (_ BitVec 32)) SeekEntryResult!4052)

(assert (=> b!503614 (= e!294910 (= (seekEntryOrOpen!0 (select (arr!15585 a!3235) j!176) a!3235 mask!3524) (Found!4052 j!176)))))

(declare-fun b!503615 () Bool)

(declare-fun Unit!15287 () Unit!15284)

(assert (=> b!503615 (= e!294915 Unit!15287)))

(declare-fun lt!229136 () Unit!15284)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32410 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15284)

(assert (=> b!503615 (= lt!229136 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229141 #b00000000000000000000000000000000 (index!18398 lt!229139) (x!47421 lt!229139) mask!3524))))

(declare-fun res!304889 () Bool)

(assert (=> b!503615 (= res!304889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229141 lt!229132 lt!229137 mask!3524) (Intermediate!4052 false (index!18398 lt!229139) (x!47421 lt!229139))))))

(declare-fun e!294912 () Bool)

(assert (=> b!503615 (=> (not res!304889) (not e!294912))))

(assert (=> b!503615 e!294912))

(declare-fun b!503617 () Bool)

(declare-fun res!304885 () Bool)

(assert (=> b!503617 (=> (not res!304885) (not e!294913))))

(assert (=> b!503617 (= res!304885 (validKeyInArray!0 (select (arr!15585 a!3235) j!176)))))

(declare-fun b!503618 () Bool)

(assert (=> b!503618 (= e!294917 e!294918)))

(declare-fun res!304894 () Bool)

(assert (=> b!503618 (=> res!304894 e!294918)))

(assert (=> b!503618 (= res!304894 (or (bvsgt (x!47421 lt!229139) #b01111111111111111111111111111110) (bvslt lt!229141 #b00000000000000000000000000000000) (bvsge lt!229141 (size!15949 a!3235)) (bvslt (index!18398 lt!229139) #b00000000000000000000000000000000) (bvsge (index!18398 lt!229139) (size!15949 a!3235)) (not (= lt!229139 (Intermediate!4052 false (index!18398 lt!229139) (x!47421 lt!229139))))))))

(assert (=> b!503618 (= (index!18398 lt!229139) i!1204)))

(declare-fun lt!229140 () Unit!15284)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32410 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15284)

(assert (=> b!503618 (= lt!229140 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229141 #b00000000000000000000000000000000 (index!18398 lt!229139) (x!47421 lt!229139) mask!3524))))

(assert (=> b!503618 (and (or (= (select (arr!15585 a!3235) (index!18398 lt!229139)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15585 a!3235) (index!18398 lt!229139)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15585 a!3235) (index!18398 lt!229139)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15585 a!3235) (index!18398 lt!229139)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229134 () Unit!15284)

(assert (=> b!503618 (= lt!229134 e!294915)))

(declare-fun c!59639 () Bool)

(assert (=> b!503618 (= c!59639 (= (select (arr!15585 a!3235) (index!18398 lt!229139)) (select (arr!15585 a!3235) j!176)))))

(assert (=> b!503618 (and (bvslt (x!47421 lt!229139) #b01111111111111111111111111111110) (or (= (select (arr!15585 a!3235) (index!18398 lt!229139)) (select (arr!15585 a!3235) j!176)) (= (select (arr!15585 a!3235) (index!18398 lt!229139)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15585 a!3235) (index!18398 lt!229139)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503619 () Bool)

(assert (=> b!503619 (= e!294912 false)))

(declare-fun b!503620 () Bool)

(assert (=> b!503620 (= e!294913 e!294916)))

(declare-fun res!304886 () Bool)

(assert (=> b!503620 (=> (not res!304886) (not e!294916))))

(declare-fun lt!229131 () SeekEntryResult!4052)

(assert (=> b!503620 (= res!304886 (or (= lt!229131 (MissingZero!4052 i!1204)) (= lt!229131 (MissingVacant!4052 i!1204))))))

(assert (=> b!503620 (= lt!229131 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503621 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32410 (_ BitVec 32)) SeekEntryResult!4052)

(assert (=> b!503621 (= e!294911 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229141 (index!18398 lt!229139) (select (arr!15585 a!3235) j!176) a!3235 mask!3524) (Found!4052 j!176))))))

(declare-fun res!304893 () Bool)

(assert (=> start!45654 (=> (not res!304893) (not e!294913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45654 (= res!304893 (validMask!0 mask!3524))))

(assert (=> start!45654 e!294913))

(assert (=> start!45654 true))

(declare-fun array_inv!11381 (array!32410) Bool)

(assert (=> start!45654 (array_inv!11381 a!3235)))

(declare-fun b!503616 () Bool)

(assert (=> b!503616 (= e!294918 true)))

(declare-fun lt!229133 () SeekEntryResult!4052)

(assert (=> b!503616 (= lt!229133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229141 lt!229132 lt!229137 mask!3524))))

(assert (= (and start!45654 res!304893) b!503612))

(assert (= (and b!503612 res!304888) b!503617))

(assert (= (and b!503617 res!304885) b!503610))

(assert (= (and b!503610 res!304887) b!503611))

(assert (= (and b!503611 res!304892) b!503620))

(assert (= (and b!503620 res!304886) b!503607))

(assert (= (and b!503607 res!304897) b!503606))

(assert (= (and b!503606 res!304890) b!503605))

(assert (= (and b!503605 res!304884) b!503614))

(assert (= (and b!503605 (not res!304895)) b!503609))

(assert (= (and b!503609 (not res!304898)) b!503618))

(assert (= (and b!503618 c!59639) b!503615))

(assert (= (and b!503618 (not c!59639)) b!503608))

(assert (= (and b!503615 res!304889) b!503619))

(assert (= (and b!503618 (not res!304894)) b!503613))

(assert (= (and b!503613 res!304896) b!503621))

(assert (= (and b!503613 (not res!304891)) b!503616))

(declare-fun m!484425 () Bool)

(assert (=> b!503610 m!484425))

(declare-fun m!484427 () Bool)

(assert (=> b!503620 m!484427))

(declare-fun m!484429 () Bool)

(assert (=> b!503616 m!484429))

(declare-fun m!484431 () Bool)

(assert (=> b!503617 m!484431))

(assert (=> b!503617 m!484431))

(declare-fun m!484433 () Bool)

(assert (=> b!503617 m!484433))

(assert (=> b!503621 m!484431))

(assert (=> b!503621 m!484431))

(declare-fun m!484435 () Bool)

(assert (=> b!503621 m!484435))

(declare-fun m!484437 () Bool)

(assert (=> b!503611 m!484437))

(declare-fun m!484439 () Bool)

(assert (=> b!503615 m!484439))

(assert (=> b!503615 m!484429))

(assert (=> b!503614 m!484431))

(assert (=> b!503614 m!484431))

(declare-fun m!484441 () Bool)

(assert (=> b!503614 m!484441))

(declare-fun m!484443 () Bool)

(assert (=> b!503618 m!484443))

(declare-fun m!484445 () Bool)

(assert (=> b!503618 m!484445))

(assert (=> b!503618 m!484431))

(declare-fun m!484447 () Bool)

(assert (=> b!503605 m!484447))

(declare-fun m!484449 () Bool)

(assert (=> b!503605 m!484449))

(declare-fun m!484451 () Bool)

(assert (=> b!503605 m!484451))

(assert (=> b!503605 m!484431))

(declare-fun m!484453 () Bool)

(assert (=> b!503605 m!484453))

(assert (=> b!503605 m!484431))

(declare-fun m!484455 () Bool)

(assert (=> b!503605 m!484455))

(assert (=> b!503605 m!484431))

(declare-fun m!484457 () Bool)

(assert (=> b!503605 m!484457))

(declare-fun m!484459 () Bool)

(assert (=> b!503605 m!484459))

(declare-fun m!484461 () Bool)

(assert (=> b!503605 m!484461))

(declare-fun m!484463 () Bool)

(assert (=> b!503607 m!484463))

(declare-fun m!484465 () Bool)

(assert (=> start!45654 m!484465))

(declare-fun m!484467 () Bool)

(assert (=> start!45654 m!484467))

(declare-fun m!484469 () Bool)

(assert (=> b!503606 m!484469))

(push 1)

