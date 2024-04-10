; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86586 () Bool)

(assert start!86586)

(declare-fun b!1004013 () Bool)

(declare-fun res!673501 () Bool)

(declare-fun e!565424 () Bool)

(assert (=> b!1004013 (=> (not res!673501) (not e!565424))))

(declare-datatypes ((array!63387 0))(
  ( (array!63388 (arr!30519 (Array (_ BitVec 32) (_ BitVec 64))) (size!31021 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63387)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004013 (= res!673501 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31021 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31021 a!3219))))))

(declare-fun b!1004014 () Bool)

(declare-fun res!673496 () Bool)

(declare-fun e!565421 () Bool)

(assert (=> b!1004014 (=> (not res!673496) (not e!565421))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004014 (= res!673496 (validKeyInArray!0 k!2224))))

(declare-fun b!1004015 () Bool)

(assert (=> b!1004015 (= e!565421 e!565424)))

(declare-fun res!673505 () Bool)

(assert (=> b!1004015 (=> (not res!673505) (not e!565424))))

(declare-datatypes ((SeekEntryResult!9451 0))(
  ( (MissingZero!9451 (index!40175 (_ BitVec 32))) (Found!9451 (index!40176 (_ BitVec 32))) (Intermediate!9451 (undefined!10263 Bool) (index!40177 (_ BitVec 32)) (x!87575 (_ BitVec 32))) (Undefined!9451) (MissingVacant!9451 (index!40178 (_ BitVec 32))) )
))
(declare-fun lt!443962 () SeekEntryResult!9451)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004015 (= res!673505 (or (= lt!443962 (MissingVacant!9451 i!1194)) (= lt!443962 (MissingZero!9451 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63387 (_ BitVec 32)) SeekEntryResult!9451)

(assert (=> b!1004015 (= lt!443962 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!673499 () Bool)

(assert (=> start!86586 (=> (not res!673499) (not e!565421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86586 (= res!673499 (validMask!0 mask!3464))))

(assert (=> start!86586 e!565421))

(declare-fun array_inv!23643 (array!63387) Bool)

(assert (=> start!86586 (array_inv!23643 a!3219)))

(assert (=> start!86586 true))

(declare-fun b!1004016 () Bool)

(declare-fun e!565426 () Bool)

(declare-fun e!565423 () Bool)

(assert (=> b!1004016 (= e!565426 e!565423)))

(declare-fun res!673497 () Bool)

(assert (=> b!1004016 (=> (not res!673497) (not e!565423))))

(declare-fun lt!443969 () SeekEntryResult!9451)

(declare-fun lt!443964 () SeekEntryResult!9451)

(assert (=> b!1004016 (= res!673497 (= lt!443969 lt!443964))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63387 (_ BitVec 32)) SeekEntryResult!9451)

(assert (=> b!1004016 (= lt!443969 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30519 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004017 () Bool)

(declare-fun e!565425 () Bool)

(assert (=> b!1004017 (= e!565423 e!565425)))

(declare-fun res!673493 () Bool)

(assert (=> b!1004017 (=> (not res!673493) (not e!565425))))

(declare-fun lt!443968 () SeekEntryResult!9451)

(declare-fun lt!443963 () array!63387)

(declare-fun lt!443965 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004017 (= res!673493 (not (= lt!443968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443965 mask!3464) lt!443965 lt!443963 mask!3464))))))

(assert (=> b!1004017 (= lt!443965 (select (store (arr!30519 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1004017 (= lt!443963 (array!63388 (store (arr!30519 a!3219) i!1194 k!2224) (size!31021 a!3219)))))

(declare-fun b!1004018 () Bool)

(declare-fun res!673506 () Bool)

(assert (=> b!1004018 (=> (not res!673506) (not e!565421))))

(declare-fun arrayContainsKey!0 (array!63387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004018 (= res!673506 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004019 () Bool)

(assert (=> b!1004019 (= e!565424 e!565426)))

(declare-fun res!673503 () Bool)

(assert (=> b!1004019 (=> (not res!673503) (not e!565426))))

(assert (=> b!1004019 (= res!673503 (= lt!443968 lt!443964))))

(assert (=> b!1004019 (= lt!443964 (Intermediate!9451 false resIndex!38 resX!38))))

(assert (=> b!1004019 (= lt!443968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30519 a!3219) j!170) mask!3464) (select (arr!30519 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004020 () Bool)

(declare-fun res!673504 () Bool)

(assert (=> b!1004020 (=> (not res!673504) (not e!565421))))

(assert (=> b!1004020 (= res!673504 (validKeyInArray!0 (select (arr!30519 a!3219) j!170)))))

(declare-fun b!1004021 () Bool)

(declare-fun res!673492 () Bool)

(assert (=> b!1004021 (=> (not res!673492) (not e!565425))))

(assert (=> b!1004021 (= res!673492 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004022 () Bool)

(declare-fun res!673495 () Bool)

(declare-fun e!565422 () Bool)

(assert (=> b!1004022 (=> (not res!673495) (not e!565422))))

(declare-fun lt!443967 () (_ BitVec 32))

(assert (=> b!1004022 (= res!673495 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443967 (select (arr!30519 a!3219) j!170) a!3219 mask!3464) lt!443964))))

(declare-fun b!1004023 () Bool)

(declare-fun res!673491 () Bool)

(assert (=> b!1004023 (=> (not res!673491) (not e!565424))))

(declare-datatypes ((List!21195 0))(
  ( (Nil!21192) (Cons!21191 (h!22368 (_ BitVec 64)) (t!30196 List!21195)) )
))
(declare-fun arrayNoDuplicates!0 (array!63387 (_ BitVec 32) List!21195) Bool)

(assert (=> b!1004023 (= res!673491 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21192))))

(declare-fun b!1004024 () Bool)

(declare-fun res!673500 () Bool)

(assert (=> b!1004024 (=> (not res!673500) (not e!565424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63387 (_ BitVec 32)) Bool)

(assert (=> b!1004024 (= res!673500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004025 () Bool)

(declare-fun res!673502 () Bool)

(assert (=> b!1004025 (=> (not res!673502) (not e!565421))))

(assert (=> b!1004025 (= res!673502 (and (= (size!31021 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31021 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31021 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004026 () Bool)

(declare-fun res!673494 () Bool)

(assert (=> b!1004026 (=> (not res!673494) (not e!565425))))

(assert (=> b!1004026 (= res!673494 (not (= lt!443969 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443965 lt!443963 mask!3464))))))

(declare-fun b!1004027 () Bool)

(assert (=> b!1004027 (= e!565425 e!565422)))

(declare-fun res!673498 () Bool)

(assert (=> b!1004027 (=> (not res!673498) (not e!565422))))

(assert (=> b!1004027 (= res!673498 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443967 #b00000000000000000000000000000000) (bvslt lt!443967 (size!31021 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004027 (= lt!443967 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1004028 () Bool)

(assert (=> b!1004028 (= e!565422 false)))

(declare-fun lt!443966 () SeekEntryResult!9451)

(assert (=> b!1004028 (= lt!443966 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443967 lt!443965 lt!443963 mask!3464))))

(assert (= (and start!86586 res!673499) b!1004025))

(assert (= (and b!1004025 res!673502) b!1004020))

(assert (= (and b!1004020 res!673504) b!1004014))

(assert (= (and b!1004014 res!673496) b!1004018))

(assert (= (and b!1004018 res!673506) b!1004015))

(assert (= (and b!1004015 res!673505) b!1004024))

(assert (= (and b!1004024 res!673500) b!1004023))

(assert (= (and b!1004023 res!673491) b!1004013))

(assert (= (and b!1004013 res!673501) b!1004019))

(assert (= (and b!1004019 res!673503) b!1004016))

(assert (= (and b!1004016 res!673497) b!1004017))

(assert (= (and b!1004017 res!673493) b!1004026))

(assert (= (and b!1004026 res!673494) b!1004021))

(assert (= (and b!1004021 res!673492) b!1004027))

(assert (= (and b!1004027 res!673498) b!1004022))

(assert (= (and b!1004022 res!673495) b!1004028))

(declare-fun m!929629 () Bool)

(assert (=> b!1004026 m!929629))

(declare-fun m!929631 () Bool)

(assert (=> b!1004028 m!929631))

(declare-fun m!929633 () Bool)

(assert (=> b!1004020 m!929633))

(assert (=> b!1004020 m!929633))

(declare-fun m!929635 () Bool)

(assert (=> b!1004020 m!929635))

(declare-fun m!929637 () Bool)

(assert (=> b!1004017 m!929637))

(assert (=> b!1004017 m!929637))

(declare-fun m!929639 () Bool)

(assert (=> b!1004017 m!929639))

(declare-fun m!929641 () Bool)

(assert (=> b!1004017 m!929641))

(declare-fun m!929643 () Bool)

(assert (=> b!1004017 m!929643))

(assert (=> b!1004016 m!929633))

(assert (=> b!1004016 m!929633))

(declare-fun m!929645 () Bool)

(assert (=> b!1004016 m!929645))

(declare-fun m!929647 () Bool)

(assert (=> b!1004023 m!929647))

(declare-fun m!929649 () Bool)

(assert (=> start!86586 m!929649))

(declare-fun m!929651 () Bool)

(assert (=> start!86586 m!929651))

(declare-fun m!929653 () Bool)

(assert (=> b!1004014 m!929653))

(declare-fun m!929655 () Bool)

(assert (=> b!1004015 m!929655))

(assert (=> b!1004022 m!929633))

(assert (=> b!1004022 m!929633))

(declare-fun m!929657 () Bool)

(assert (=> b!1004022 m!929657))

(declare-fun m!929659 () Bool)

(assert (=> b!1004018 m!929659))

(declare-fun m!929661 () Bool)

(assert (=> b!1004024 m!929661))

(assert (=> b!1004019 m!929633))

(assert (=> b!1004019 m!929633))

(declare-fun m!929663 () Bool)

(assert (=> b!1004019 m!929663))

(assert (=> b!1004019 m!929663))

(assert (=> b!1004019 m!929633))

(declare-fun m!929665 () Bool)

(assert (=> b!1004019 m!929665))

(declare-fun m!929667 () Bool)

(assert (=> b!1004027 m!929667))

(push 1)

(assert (not b!1004022))

(assert (not b!1004023))

(assert (not start!86586))

