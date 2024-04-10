; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86480 () Bool)

(assert start!86480)

(declare-fun b!1001469 () Bool)

(declare-fun e!564312 () Bool)

(declare-fun e!564308 () Bool)

(assert (=> b!1001469 (= e!564312 e!564308)))

(declare-fun res!670954 () Bool)

(assert (=> b!1001469 (=> (not res!670954) (not e!564308))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((array!63281 0))(
  ( (array!63282 (arr!30466 (Array (_ BitVec 32) (_ BitVec 64))) (size!30968 (_ BitVec 32))) )
))
(declare-fun lt!442690 () array!63281)

(declare-fun lt!442693 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9398 0))(
  ( (MissingZero!9398 (index!39963 (_ BitVec 32))) (Found!9398 (index!39964 (_ BitVec 32))) (Intermediate!9398 (undefined!10210 Bool) (index!39965 (_ BitVec 32)) (x!87386 (_ BitVec 32))) (Undefined!9398) (MissingVacant!9398 (index!39966 (_ BitVec 32))) )
))
(declare-fun lt!442696 () SeekEntryResult!9398)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63281 (_ BitVec 32)) SeekEntryResult!9398)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001469 (= res!670954 (not (= lt!442696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442693 mask!3464) lt!442693 lt!442690 mask!3464))))))

(declare-fun a!3219 () array!63281)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1001469 (= lt!442693 (select (store (arr!30466 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001469 (= lt!442690 (array!63282 (store (arr!30466 a!3219) i!1194 k!2224) (size!30968 a!3219)))))

(declare-fun b!1001470 () Bool)

(declare-fun e!564311 () Bool)

(declare-fun e!564309 () Bool)

(assert (=> b!1001470 (= e!564311 e!564309)))

(declare-fun res!670951 () Bool)

(assert (=> b!1001470 (=> (not res!670951) (not e!564309))))

(declare-fun lt!442692 () SeekEntryResult!9398)

(assert (=> b!1001470 (= res!670951 (= lt!442696 lt!442692))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001470 (= lt!442692 (Intermediate!9398 false resIndex!38 resX!38))))

(assert (=> b!1001470 (= lt!442696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30466 a!3219) j!170) mask!3464) (select (arr!30466 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001471 () Bool)

(declare-fun e!564310 () Bool)

(assert (=> b!1001471 (= e!564310 false)))

(declare-fun lt!442695 () (_ BitVec 32))

(declare-fun lt!442694 () SeekEntryResult!9398)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1001471 (= lt!442694 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442695 lt!442693 lt!442690 mask!3464))))

(declare-fun b!1001472 () Bool)

(declare-fun res!670950 () Bool)

(declare-fun e!564313 () Bool)

(assert (=> b!1001472 (=> (not res!670950) (not e!564313))))

(assert (=> b!1001472 (= res!670950 (and (= (size!30968 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30968 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30968 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001473 () Bool)

(declare-fun res!670961 () Bool)

(assert (=> b!1001473 (=> (not res!670961) (not e!564313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001473 (= res!670961 (validKeyInArray!0 (select (arr!30466 a!3219) j!170)))))

(declare-fun b!1001474 () Bool)

(declare-fun res!670959 () Bool)

(assert (=> b!1001474 (=> (not res!670959) (not e!564311))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1001474 (= res!670959 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30968 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30968 a!3219))))))

(declare-fun b!1001475 () Bool)

(declare-fun res!670957 () Bool)

(assert (=> b!1001475 (=> (not res!670957) (not e!564308))))

(assert (=> b!1001475 (= res!670957 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001476 () Bool)

(declare-fun res!670949 () Bool)

(assert (=> b!1001476 (=> (not res!670949) (not e!564310))))

(assert (=> b!1001476 (= res!670949 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442695 (select (arr!30466 a!3219) j!170) a!3219 mask!3464) lt!442692))))

(declare-fun b!1001477 () Bool)

(declare-fun res!670956 () Bool)

(assert (=> b!1001477 (=> (not res!670956) (not e!564313))))

(declare-fun arrayContainsKey!0 (array!63281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001477 (= res!670956 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001478 () Bool)

(assert (=> b!1001478 (= e!564308 e!564310)))

(declare-fun res!670955 () Bool)

(assert (=> b!1001478 (=> (not res!670955) (not e!564310))))

(assert (=> b!1001478 (= res!670955 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442695 #b00000000000000000000000000000000) (bvslt lt!442695 (size!30968 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001478 (= lt!442695 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001479 () Bool)

(assert (=> b!1001479 (= e!564313 e!564311)))

(declare-fun res!670953 () Bool)

(assert (=> b!1001479 (=> (not res!670953) (not e!564311))))

(declare-fun lt!442697 () SeekEntryResult!9398)

(assert (=> b!1001479 (= res!670953 (or (= lt!442697 (MissingVacant!9398 i!1194)) (= lt!442697 (MissingZero!9398 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63281 (_ BitVec 32)) SeekEntryResult!9398)

(assert (=> b!1001479 (= lt!442697 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001480 () Bool)

(declare-fun res!670948 () Bool)

(assert (=> b!1001480 (=> (not res!670948) (not e!564311))))

(declare-datatypes ((List!21142 0))(
  ( (Nil!21139) (Cons!21138 (h!22315 (_ BitVec 64)) (t!30143 List!21142)) )
))
(declare-fun arrayNoDuplicates!0 (array!63281 (_ BitVec 32) List!21142) Bool)

(assert (=> b!1001480 (= res!670948 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21139))))

(declare-fun b!1001481 () Bool)

(declare-fun res!670958 () Bool)

(assert (=> b!1001481 (=> (not res!670958) (not e!564311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63281 (_ BitVec 32)) Bool)

(assert (=> b!1001481 (= res!670958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001482 () Bool)

(declare-fun res!670947 () Bool)

(assert (=> b!1001482 (=> (not res!670947) (not e!564313))))

(assert (=> b!1001482 (= res!670947 (validKeyInArray!0 k!2224))))

(declare-fun res!670952 () Bool)

(assert (=> start!86480 (=> (not res!670952) (not e!564313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86480 (= res!670952 (validMask!0 mask!3464))))

(assert (=> start!86480 e!564313))

(declare-fun array_inv!23590 (array!63281) Bool)

(assert (=> start!86480 (array_inv!23590 a!3219)))

(assert (=> start!86480 true))

(declare-fun b!1001483 () Bool)

(assert (=> b!1001483 (= e!564309 e!564312)))

(declare-fun res!670962 () Bool)

(assert (=> b!1001483 (=> (not res!670962) (not e!564312))))

(declare-fun lt!442691 () SeekEntryResult!9398)

(assert (=> b!1001483 (= res!670962 (= lt!442691 lt!442692))))

(assert (=> b!1001483 (= lt!442691 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30466 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001484 () Bool)

(declare-fun res!670960 () Bool)

(assert (=> b!1001484 (=> (not res!670960) (not e!564308))))

(assert (=> b!1001484 (= res!670960 (not (= lt!442691 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442693 lt!442690 mask!3464))))))

(assert (= (and start!86480 res!670952) b!1001472))

(assert (= (and b!1001472 res!670950) b!1001473))

(assert (= (and b!1001473 res!670961) b!1001482))

(assert (= (and b!1001482 res!670947) b!1001477))

(assert (= (and b!1001477 res!670956) b!1001479))

(assert (= (and b!1001479 res!670953) b!1001481))

(assert (= (and b!1001481 res!670958) b!1001480))

(assert (= (and b!1001480 res!670948) b!1001474))

(assert (= (and b!1001474 res!670959) b!1001470))

(assert (= (and b!1001470 res!670951) b!1001483))

(assert (= (and b!1001483 res!670962) b!1001469))

(assert (= (and b!1001469 res!670954) b!1001484))

(assert (= (and b!1001484 res!670960) b!1001475))

(assert (= (and b!1001475 res!670957) b!1001478))

(assert (= (and b!1001478 res!670955) b!1001476))

(assert (= (and b!1001476 res!670949) b!1001471))

(declare-fun m!927509 () Bool)

(assert (=> b!1001477 m!927509))

(declare-fun m!927511 () Bool)

(assert (=> start!86480 m!927511))

(declare-fun m!927513 () Bool)

(assert (=> start!86480 m!927513))

(declare-fun m!927515 () Bool)

(assert (=> b!1001470 m!927515))

(assert (=> b!1001470 m!927515))

(declare-fun m!927517 () Bool)

(assert (=> b!1001470 m!927517))

(assert (=> b!1001470 m!927517))

(assert (=> b!1001470 m!927515))

(declare-fun m!927519 () Bool)

(assert (=> b!1001470 m!927519))

(declare-fun m!927521 () Bool)

(assert (=> b!1001471 m!927521))

(declare-fun m!927523 () Bool)

(assert (=> b!1001484 m!927523))

(declare-fun m!927525 () Bool)

(assert (=> b!1001479 m!927525))

(declare-fun m!927527 () Bool)

(assert (=> b!1001469 m!927527))

(assert (=> b!1001469 m!927527))

(declare-fun m!927529 () Bool)

(assert (=> b!1001469 m!927529))

(declare-fun m!927531 () Bool)

(assert (=> b!1001469 m!927531))

(declare-fun m!927533 () Bool)

(assert (=> b!1001469 m!927533))

(assert (=> b!1001483 m!927515))

(assert (=> b!1001483 m!927515))

(declare-fun m!927535 () Bool)

(assert (=> b!1001483 m!927535))

(declare-fun m!927537 () Bool)

(assert (=> b!1001481 m!927537))

(assert (=> b!1001473 m!927515))

(assert (=> b!1001473 m!927515))

(declare-fun m!927539 () Bool)

(assert (=> b!1001473 m!927539))

(declare-fun m!927541 () Bool)

(assert (=> b!1001482 m!927541))

(declare-fun m!927543 () Bool)

(assert (=> b!1001480 m!927543))

(assert (=> b!1001476 m!927515))

(assert (=> b!1001476 m!927515))

(declare-fun m!927545 () Bool)

(assert (=> b!1001476 m!927545))

(declare-fun m!927547 () Bool)

(assert (=> b!1001478 m!927547))

(push 1)

