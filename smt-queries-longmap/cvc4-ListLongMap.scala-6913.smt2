; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86898 () Bool)

(assert start!86898)

(declare-fun b!1007633 () Bool)

(declare-fun e!567069 () Bool)

(declare-fun e!567071 () Bool)

(assert (=> b!1007633 (= e!567069 e!567071)))

(declare-fun res!676530 () Bool)

(assert (=> b!1007633 (=> (not res!676530) (not e!567071))))

(declare-datatypes ((SeekEntryResult!9526 0))(
  ( (MissingZero!9526 (index!40475 (_ BitVec 32))) (Found!9526 (index!40476 (_ BitVec 32))) (Intermediate!9526 (undefined!10338 Bool) (index!40477 (_ BitVec 32)) (x!87868 (_ BitVec 32))) (Undefined!9526) (MissingVacant!9526 (index!40478 (_ BitVec 32))) )
))
(declare-fun lt!445301 () SeekEntryResult!9526)

(declare-fun lt!445300 () SeekEntryResult!9526)

(assert (=> b!1007633 (= res!676530 (= lt!445301 lt!445300))))

(declare-datatypes ((array!63546 0))(
  ( (array!63547 (arr!30594 (Array (_ BitVec 32) (_ BitVec 64))) (size!31096 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63546)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63546 (_ BitVec 32)) SeekEntryResult!9526)

(assert (=> b!1007633 (= lt!445301 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30594 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007634 () Bool)

(declare-fun res!676527 () Bool)

(declare-fun e!567072 () Bool)

(assert (=> b!1007634 (=> (not res!676527) (not e!567072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007634 (= res!676527 (validKeyInArray!0 (select (arr!30594 a!3219) j!170)))))

(declare-fun b!1007635 () Bool)

(declare-fun res!676539 () Bool)

(declare-fun e!567070 () Bool)

(assert (=> b!1007635 (=> (not res!676539) (not e!567070))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007635 (= res!676539 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007636 () Bool)

(declare-fun res!676526 () Bool)

(assert (=> b!1007636 (=> (not res!676526) (not e!567072))))

(assert (=> b!1007636 (= res!676526 (and (= (size!31096 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31096 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31096 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007637 () Bool)

(declare-fun res!676532 () Bool)

(declare-fun e!567073 () Bool)

(assert (=> b!1007637 (=> (not res!676532) (not e!567073))))

(declare-datatypes ((List!21270 0))(
  ( (Nil!21267) (Cons!21266 (h!22452 (_ BitVec 64)) (t!30271 List!21270)) )
))
(declare-fun arrayNoDuplicates!0 (array!63546 (_ BitVec 32) List!21270) Bool)

(assert (=> b!1007637 (= res!676532 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21267))))

(declare-fun b!1007638 () Bool)

(declare-fun res!676535 () Bool)

(assert (=> b!1007638 (=> (not res!676535) (not e!567072))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007638 (= res!676535 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!676533 () Bool)

(assert (=> start!86898 (=> (not res!676533) (not e!567072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86898 (= res!676533 (validMask!0 mask!3464))))

(assert (=> start!86898 e!567072))

(declare-fun array_inv!23718 (array!63546) Bool)

(assert (=> start!86898 (array_inv!23718 a!3219)))

(assert (=> start!86898 true))

(declare-fun b!1007639 () Bool)

(declare-fun res!676536 () Bool)

(assert (=> b!1007639 (=> (not res!676536) (not e!567073))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007639 (= res!676536 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31096 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31096 a!3219))))))

(declare-fun b!1007640 () Bool)

(declare-fun res!676538 () Bool)

(assert (=> b!1007640 (=> (not res!676538) (not e!567070))))

(declare-fun lt!445299 () array!63546)

(declare-fun lt!445296 () (_ BitVec 64))

(assert (=> b!1007640 (= res!676538 (not (= lt!445301 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445296 lt!445299 mask!3464))))))

(declare-fun b!1007641 () Bool)

(assert (=> b!1007641 (= e!567071 e!567070)))

(declare-fun res!676537 () Bool)

(assert (=> b!1007641 (=> (not res!676537) (not e!567070))))

(declare-fun lt!445298 () SeekEntryResult!9526)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007641 (= res!676537 (not (= lt!445298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445296 mask!3464) lt!445296 lt!445299 mask!3464))))))

(assert (=> b!1007641 (= lt!445296 (select (store (arr!30594 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007641 (= lt!445299 (array!63547 (store (arr!30594 a!3219) i!1194 k!2224) (size!31096 a!3219)))))

(declare-fun b!1007642 () Bool)

(declare-fun res!676534 () Bool)

(assert (=> b!1007642 (=> (not res!676534) (not e!567073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63546 (_ BitVec 32)) Bool)

(assert (=> b!1007642 (= res!676534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007643 () Bool)

(assert (=> b!1007643 (= e!567072 e!567073)))

(declare-fun res!676531 () Bool)

(assert (=> b!1007643 (=> (not res!676531) (not e!567073))))

(declare-fun lt!445297 () SeekEntryResult!9526)

(assert (=> b!1007643 (= res!676531 (or (= lt!445297 (MissingVacant!9526 i!1194)) (= lt!445297 (MissingZero!9526 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63546 (_ BitVec 32)) SeekEntryResult!9526)

(assert (=> b!1007643 (= lt!445297 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007644 () Bool)

(assert (=> b!1007644 (= e!567073 e!567069)))

(declare-fun res!676528 () Bool)

(assert (=> b!1007644 (=> (not res!676528) (not e!567069))))

(assert (=> b!1007644 (= res!676528 (= lt!445298 lt!445300))))

(assert (=> b!1007644 (= lt!445300 (Intermediate!9526 false resIndex!38 resX!38))))

(assert (=> b!1007644 (= lt!445298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30594 a!3219) j!170) mask!3464) (select (arr!30594 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007645 () Bool)

(declare-fun res!676529 () Bool)

(assert (=> b!1007645 (=> (not res!676529) (not e!567072))))

(assert (=> b!1007645 (= res!676529 (validKeyInArray!0 k!2224))))

(declare-fun b!1007646 () Bool)

(assert (=> b!1007646 (= e!567070 false)))

(declare-fun lt!445295 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007646 (= lt!445295 (nextIndex!0 index!1507 x!1245 mask!3464))))

(assert (= (and start!86898 res!676533) b!1007636))

(assert (= (and b!1007636 res!676526) b!1007634))

(assert (= (and b!1007634 res!676527) b!1007645))

(assert (= (and b!1007645 res!676529) b!1007638))

(assert (= (and b!1007638 res!676535) b!1007643))

(assert (= (and b!1007643 res!676531) b!1007642))

(assert (= (and b!1007642 res!676534) b!1007637))

(assert (= (and b!1007637 res!676532) b!1007639))

(assert (= (and b!1007639 res!676536) b!1007644))

(assert (= (and b!1007644 res!676528) b!1007633))

(assert (= (and b!1007633 res!676530) b!1007641))

(assert (= (and b!1007641 res!676537) b!1007640))

(assert (= (and b!1007640 res!676538) b!1007635))

(assert (= (and b!1007635 res!676539) b!1007646))

(declare-fun m!932495 () Bool)

(assert (=> b!1007641 m!932495))

(assert (=> b!1007641 m!932495))

(declare-fun m!932497 () Bool)

(assert (=> b!1007641 m!932497))

(declare-fun m!932499 () Bool)

(assert (=> b!1007641 m!932499))

(declare-fun m!932501 () Bool)

(assert (=> b!1007641 m!932501))

(declare-fun m!932503 () Bool)

(assert (=> b!1007644 m!932503))

(assert (=> b!1007644 m!932503))

(declare-fun m!932505 () Bool)

(assert (=> b!1007644 m!932505))

(assert (=> b!1007644 m!932505))

(assert (=> b!1007644 m!932503))

(declare-fun m!932507 () Bool)

(assert (=> b!1007644 m!932507))

(declare-fun m!932509 () Bool)

(assert (=> b!1007646 m!932509))

(declare-fun m!932511 () Bool)

(assert (=> b!1007638 m!932511))

(declare-fun m!932513 () Bool)

(assert (=> b!1007642 m!932513))

(declare-fun m!932515 () Bool)

(assert (=> start!86898 m!932515))

(declare-fun m!932517 () Bool)

(assert (=> start!86898 m!932517))

(assert (=> b!1007634 m!932503))

(assert (=> b!1007634 m!932503))

(declare-fun m!932519 () Bool)

(assert (=> b!1007634 m!932519))

(assert (=> b!1007633 m!932503))

(assert (=> b!1007633 m!932503))

(declare-fun m!932521 () Bool)

(assert (=> b!1007633 m!932521))

(declare-fun m!932523 () Bool)

(assert (=> b!1007637 m!932523))

(declare-fun m!932525 () Bool)

(assert (=> b!1007640 m!932525))

(declare-fun m!932527 () Bool)

(assert (=> b!1007645 m!932527))

(declare-fun m!932529 () Bool)

(assert (=> b!1007643 m!932529))

(push 1)

