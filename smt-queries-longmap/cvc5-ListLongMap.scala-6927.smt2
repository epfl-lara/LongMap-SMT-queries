; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87114 () Bool)

(assert start!87114)

(declare-fun b!1010119 () Bool)

(declare-fun e!568293 () Bool)

(declare-fun e!568292 () Bool)

(assert (=> b!1010119 (= e!568293 e!568292)))

(declare-fun res!678515 () Bool)

(assert (=> b!1010119 (=> (not res!678515) (not e!568292))))

(declare-datatypes ((SeekEntryResult!9566 0))(
  ( (MissingZero!9566 (index!40635 (_ BitVec 32))) (Found!9566 (index!40636 (_ BitVec 32))) (Intermediate!9566 (undefined!10378 Bool) (index!40637 (_ BitVec 32)) (x!88042 (_ BitVec 32))) (Undefined!9566) (MissingVacant!9566 (index!40638 (_ BitVec 32))) )
))
(declare-fun lt!446447 () SeekEntryResult!9566)

(declare-fun lt!446448 () SeekEntryResult!9566)

(assert (=> b!1010119 (= res!678515 (= lt!446447 lt!446448))))

(declare-datatypes ((array!63632 0))(
  ( (array!63633 (arr!30634 (Array (_ BitVec 32) (_ BitVec 64))) (size!31136 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63632)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63632 (_ BitVec 32)) SeekEntryResult!9566)

(assert (=> b!1010119 (= lt!446447 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30634 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010120 () Bool)

(declare-fun res!678524 () Bool)

(declare-fun e!568296 () Bool)

(assert (=> b!1010120 (=> (not res!678524) (not e!568296))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010120 (= res!678524 (and (= (size!31136 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31136 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31136 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!678518 () Bool)

(assert (=> start!87114 (=> (not res!678518) (not e!568296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87114 (= res!678518 (validMask!0 mask!3464))))

(assert (=> start!87114 e!568296))

(declare-fun array_inv!23758 (array!63632) Bool)

(assert (=> start!87114 (array_inv!23758 a!3219)))

(assert (=> start!87114 true))

(declare-fun b!1010121 () Bool)

(declare-fun e!568295 () Bool)

(assert (=> b!1010121 (= e!568292 e!568295)))

(declare-fun res!678514 () Bool)

(assert (=> b!1010121 (=> (not res!678514) (not e!568295))))

(declare-fun lt!446446 () array!63632)

(declare-fun lt!446445 () SeekEntryResult!9566)

(declare-fun lt!446450 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010121 (= res!678514 (not (= lt!446445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446450 mask!3464) lt!446450 lt!446446 mask!3464))))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1010121 (= lt!446450 (select (store (arr!30634 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1010121 (= lt!446446 (array!63633 (store (arr!30634 a!3219) i!1194 k!2224) (size!31136 a!3219)))))

(declare-fun b!1010122 () Bool)

(declare-fun e!568294 () Bool)

(assert (=> b!1010122 (= e!568294 e!568293)))

(declare-fun res!678516 () Bool)

(assert (=> b!1010122 (=> (not res!678516) (not e!568293))))

(assert (=> b!1010122 (= res!678516 (= lt!446445 lt!446448))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010122 (= lt!446448 (Intermediate!9566 false resIndex!38 resX!38))))

(assert (=> b!1010122 (= lt!446445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30634 a!3219) j!170) mask!3464) (select (arr!30634 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010123 () Bool)

(declare-fun res!678521 () Bool)

(assert (=> b!1010123 (=> (not res!678521) (not e!568294))))

(declare-datatypes ((List!21310 0))(
  ( (Nil!21307) (Cons!21306 (h!22498 (_ BitVec 64)) (t!30311 List!21310)) )
))
(declare-fun arrayNoDuplicates!0 (array!63632 (_ BitVec 32) List!21310) Bool)

(assert (=> b!1010123 (= res!678521 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21307))))

(declare-fun b!1010124 () Bool)

(declare-fun res!678519 () Bool)

(assert (=> b!1010124 (=> (not res!678519) (not e!568295))))

(assert (=> b!1010124 (= res!678519 (not (= lt!446447 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446450 lt!446446 mask!3464))))))

(declare-fun b!1010125 () Bool)

(assert (=> b!1010125 (= e!568296 e!568294)))

(declare-fun res!678522 () Bool)

(assert (=> b!1010125 (=> (not res!678522) (not e!568294))))

(declare-fun lt!446451 () SeekEntryResult!9566)

(assert (=> b!1010125 (= res!678522 (or (= lt!446451 (MissingVacant!9566 i!1194)) (= lt!446451 (MissingZero!9566 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63632 (_ BitVec 32)) SeekEntryResult!9566)

(assert (=> b!1010125 (= lt!446451 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1010126 () Bool)

(declare-fun res!678525 () Bool)

(assert (=> b!1010126 (=> (not res!678525) (not e!568294))))

(assert (=> b!1010126 (= res!678525 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31136 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31136 a!3219))))))

(declare-fun b!1010127 () Bool)

(declare-fun res!678523 () Bool)

(assert (=> b!1010127 (=> (not res!678523) (not e!568296))))

(declare-fun arrayContainsKey!0 (array!63632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010127 (= res!678523 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010128 () Bool)

(declare-fun res!678513 () Bool)

(assert (=> b!1010128 (=> (not res!678513) (not e!568296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010128 (= res!678513 (validKeyInArray!0 k!2224))))

(declare-fun b!1010129 () Bool)

(declare-fun res!678512 () Bool)

(assert (=> b!1010129 (=> (not res!678512) (not e!568294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63632 (_ BitVec 32)) Bool)

(assert (=> b!1010129 (= res!678512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010130 () Bool)

(declare-fun res!678517 () Bool)

(assert (=> b!1010130 (=> (not res!678517) (not e!568295))))

(assert (=> b!1010130 (= res!678517 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010131 () Bool)

(declare-fun res!678520 () Bool)

(assert (=> b!1010131 (=> (not res!678520) (not e!568296))))

(assert (=> b!1010131 (= res!678520 (validKeyInArray!0 (select (arr!30634 a!3219) j!170)))))

(declare-fun b!1010132 () Bool)

(assert (=> b!1010132 (= e!568295 false)))

(declare-fun lt!446449 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010132 (= lt!446449 (nextIndex!0 index!1507 x!1245 mask!3464))))

(assert (= (and start!87114 res!678518) b!1010120))

(assert (= (and b!1010120 res!678524) b!1010131))

(assert (= (and b!1010131 res!678520) b!1010128))

(assert (= (and b!1010128 res!678513) b!1010127))

(assert (= (and b!1010127 res!678523) b!1010125))

(assert (= (and b!1010125 res!678522) b!1010129))

(assert (= (and b!1010129 res!678512) b!1010123))

(assert (= (and b!1010123 res!678521) b!1010126))

(assert (= (and b!1010126 res!678525) b!1010122))

(assert (= (and b!1010122 res!678516) b!1010119))

(assert (= (and b!1010119 res!678515) b!1010121))

(assert (= (and b!1010121 res!678514) b!1010124))

(assert (= (and b!1010124 res!678519) b!1010130))

(assert (= (and b!1010130 res!678517) b!1010132))

(declare-fun m!934491 () Bool)

(assert (=> b!1010121 m!934491))

(assert (=> b!1010121 m!934491))

(declare-fun m!934493 () Bool)

(assert (=> b!1010121 m!934493))

(declare-fun m!934495 () Bool)

(assert (=> b!1010121 m!934495))

(declare-fun m!934497 () Bool)

(assert (=> b!1010121 m!934497))

(declare-fun m!934499 () Bool)

(assert (=> b!1010124 m!934499))

(declare-fun m!934501 () Bool)

(assert (=> b!1010125 m!934501))

(declare-fun m!934503 () Bool)

(assert (=> b!1010131 m!934503))

(assert (=> b!1010131 m!934503))

(declare-fun m!934505 () Bool)

(assert (=> b!1010131 m!934505))

(declare-fun m!934507 () Bool)

(assert (=> b!1010132 m!934507))

(assert (=> b!1010122 m!934503))

(assert (=> b!1010122 m!934503))

(declare-fun m!934509 () Bool)

(assert (=> b!1010122 m!934509))

(assert (=> b!1010122 m!934509))

(assert (=> b!1010122 m!934503))

(declare-fun m!934511 () Bool)

(assert (=> b!1010122 m!934511))

(declare-fun m!934513 () Bool)

(assert (=> start!87114 m!934513))

(declare-fun m!934515 () Bool)

(assert (=> start!87114 m!934515))

(assert (=> b!1010119 m!934503))

(assert (=> b!1010119 m!934503))

(declare-fun m!934517 () Bool)

(assert (=> b!1010119 m!934517))

(declare-fun m!934519 () Bool)

(assert (=> b!1010127 m!934519))

(declare-fun m!934521 () Bool)

(assert (=> b!1010123 m!934521))

(declare-fun m!934523 () Bool)

(assert (=> b!1010128 m!934523))

(declare-fun m!934525 () Bool)

(assert (=> b!1010129 m!934525))

(push 1)

