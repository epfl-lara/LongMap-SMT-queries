; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46686 () Bool)

(assert start!46686)

(declare-fun b!515182 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32998 0))(
  ( (array!32999 (arr!15867 (Array (_ BitVec 32) (_ BitVec 64))) (size!16231 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32998)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!300832 () Bool)

(declare-datatypes ((SeekEntryResult!4334 0))(
  ( (MissingZero!4334 (index!19524 (_ BitVec 32))) (Found!4334 (index!19525 (_ BitVec 32))) (Intermediate!4334 (undefined!5146 Bool) (index!19526 (_ BitVec 32)) (x!48497 (_ BitVec 32))) (Undefined!4334) (MissingVacant!4334 (index!19527 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32998 (_ BitVec 32)) SeekEntryResult!4334)

(assert (=> b!515182 (= e!300832 (= (seekEntryOrOpen!0 (select (arr!15867 a!3235) j!176) a!3235 mask!3524) (Found!4334 j!176)))))

(declare-fun b!515183 () Bool)

(declare-fun e!300833 () Bool)

(declare-fun e!300834 () Bool)

(assert (=> b!515183 (= e!300833 (not e!300834))))

(declare-fun res!314751 () Bool)

(assert (=> b!515183 (=> res!314751 e!300834)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!235847 () SeekEntryResult!4334)

(declare-fun lt!235846 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32998 (_ BitVec 32)) SeekEntryResult!4334)

(assert (=> b!515183 (= res!314751 (= lt!235847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235846 (select (store (arr!15867 a!3235) i!1204 k!2280) j!176) (array!32999 (store (arr!15867 a!3235) i!1204 k!2280) (size!16231 a!3235)) mask!3524)))))

(declare-fun lt!235849 () (_ BitVec 32))

(assert (=> b!515183 (= lt!235847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235849 (select (arr!15867 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515183 (= lt!235846 (toIndex!0 (select (store (arr!15867 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515183 (= lt!235849 (toIndex!0 (select (arr!15867 a!3235) j!176) mask!3524))))

(assert (=> b!515183 e!300832))

(declare-fun res!314755 () Bool)

(assert (=> b!515183 (=> (not res!314755) (not e!300832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32998 (_ BitVec 32)) Bool)

(assert (=> b!515183 (= res!314755 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15926 0))(
  ( (Unit!15927) )
))
(declare-fun lt!235845 () Unit!15926)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15926)

(assert (=> b!515183 (= lt!235845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515184 () Bool)

(declare-fun res!314750 () Bool)

(assert (=> b!515184 (=> (not res!314750) (not e!300833))))

(assert (=> b!515184 (= res!314750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515185 () Bool)

(declare-fun res!314749 () Bool)

(declare-fun e!300830 () Bool)

(assert (=> b!515185 (=> (not res!314749) (not e!300830))))

(assert (=> b!515185 (= res!314749 (and (= (size!16231 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16231 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16231 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515186 () Bool)

(declare-fun res!314752 () Bool)

(assert (=> b!515186 (=> (not res!314752) (not e!300830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515186 (= res!314752 (validKeyInArray!0 (select (arr!15867 a!3235) j!176)))))

(declare-fun b!515187 () Bool)

(assert (=> b!515187 (= e!300834 true)))

(assert (=> b!515187 (and (bvslt (x!48497 lt!235847) #b01111111111111111111111111111110) (or (= (select (arr!15867 a!3235) (index!19526 lt!235847)) (select (arr!15867 a!3235) j!176)) (= (select (arr!15867 a!3235) (index!19526 lt!235847)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15867 a!3235) (index!19526 lt!235847)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515188 () Bool)

(assert (=> b!515188 (= e!300830 e!300833)))

(declare-fun res!314756 () Bool)

(assert (=> b!515188 (=> (not res!314756) (not e!300833))))

(declare-fun lt!235848 () SeekEntryResult!4334)

(assert (=> b!515188 (= res!314756 (or (= lt!235848 (MissingZero!4334 i!1204)) (= lt!235848 (MissingVacant!4334 i!1204))))))

(assert (=> b!515188 (= lt!235848 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515189 () Bool)

(declare-fun res!314746 () Bool)

(assert (=> b!515189 (=> res!314746 e!300834)))

(assert (=> b!515189 (= res!314746 (or (undefined!5146 lt!235847) (not (is-Intermediate!4334 lt!235847))))))

(declare-fun res!314748 () Bool)

(assert (=> start!46686 (=> (not res!314748) (not e!300830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46686 (= res!314748 (validMask!0 mask!3524))))

(assert (=> start!46686 e!300830))

(assert (=> start!46686 true))

(declare-fun array_inv!11663 (array!32998) Bool)

(assert (=> start!46686 (array_inv!11663 a!3235)))

(declare-fun b!515190 () Bool)

(declare-fun res!314753 () Bool)

(assert (=> b!515190 (=> (not res!314753) (not e!300830))))

(declare-fun arrayContainsKey!0 (array!32998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515190 (= res!314753 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515191 () Bool)

(declare-fun res!314747 () Bool)

(assert (=> b!515191 (=> (not res!314747) (not e!300833))))

(declare-datatypes ((List!10025 0))(
  ( (Nil!10022) (Cons!10021 (h!10919 (_ BitVec 64)) (t!16253 List!10025)) )
))
(declare-fun arrayNoDuplicates!0 (array!32998 (_ BitVec 32) List!10025) Bool)

(assert (=> b!515191 (= res!314747 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10022))))

(declare-fun b!515192 () Bool)

(declare-fun res!314754 () Bool)

(assert (=> b!515192 (=> (not res!314754) (not e!300830))))

(assert (=> b!515192 (= res!314754 (validKeyInArray!0 k!2280))))

(assert (= (and start!46686 res!314748) b!515185))

(assert (= (and b!515185 res!314749) b!515186))

(assert (= (and b!515186 res!314752) b!515192))

(assert (= (and b!515192 res!314754) b!515190))

(assert (= (and b!515190 res!314753) b!515188))

(assert (= (and b!515188 res!314756) b!515184))

(assert (= (and b!515184 res!314750) b!515191))

(assert (= (and b!515191 res!314747) b!515183))

(assert (= (and b!515183 res!314755) b!515182))

(assert (= (and b!515183 (not res!314751)) b!515189))

(assert (= (and b!515189 (not res!314746)) b!515187))

(declare-fun m!496479 () Bool)

(assert (=> b!515183 m!496479))

(declare-fun m!496481 () Bool)

(assert (=> b!515183 m!496481))

(declare-fun m!496483 () Bool)

(assert (=> b!515183 m!496483))

(declare-fun m!496485 () Bool)

(assert (=> b!515183 m!496485))

(declare-fun m!496487 () Bool)

(assert (=> b!515183 m!496487))

(assert (=> b!515183 m!496485))

(assert (=> b!515183 m!496483))

(declare-fun m!496489 () Bool)

(assert (=> b!515183 m!496489))

(declare-fun m!496491 () Bool)

(assert (=> b!515183 m!496491))

(assert (=> b!515183 m!496483))

(declare-fun m!496493 () Bool)

(assert (=> b!515183 m!496493))

(assert (=> b!515183 m!496485))

(declare-fun m!496495 () Bool)

(assert (=> b!515183 m!496495))

(declare-fun m!496497 () Bool)

(assert (=> b!515187 m!496497))

(assert (=> b!515187 m!496485))

(declare-fun m!496499 () Bool)

(assert (=> b!515190 m!496499))

(declare-fun m!496501 () Bool)

(assert (=> b!515192 m!496501))

(assert (=> b!515186 m!496485))

(assert (=> b!515186 m!496485))

(declare-fun m!496503 () Bool)

(assert (=> b!515186 m!496503))

(declare-fun m!496505 () Bool)

(assert (=> b!515188 m!496505))

(declare-fun m!496507 () Bool)

(assert (=> b!515191 m!496507))

(declare-fun m!496509 () Bool)

(assert (=> start!46686 m!496509))

(declare-fun m!496511 () Bool)

(assert (=> start!46686 m!496511))

(declare-fun m!496513 () Bool)

(assert (=> b!515184 m!496513))

(assert (=> b!515182 m!496485))

(assert (=> b!515182 m!496485))

(declare-fun m!496515 () Bool)

(assert (=> b!515182 m!496515))

(push 1)

