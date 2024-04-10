; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86892 () Bool)

(assert start!86892)

(declare-fun b!1007507 () Bool)

(declare-fun res!676400 () Bool)

(declare-fun e!567017 () Bool)

(assert (=> b!1007507 (=> (not res!676400) (not e!567017))))

(declare-datatypes ((array!63540 0))(
  ( (array!63541 (arr!30591 (Array (_ BitVec 32) (_ BitVec 64))) (size!31093 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63540)

(declare-datatypes ((List!21267 0))(
  ( (Nil!21264) (Cons!21263 (h!22449 (_ BitVec 64)) (t!30268 List!21267)) )
))
(declare-fun arrayNoDuplicates!0 (array!63540 (_ BitVec 32) List!21267) Bool)

(assert (=> b!1007507 (= res!676400 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21264))))

(declare-fun b!1007508 () Bool)

(declare-fun e!567015 () Bool)

(assert (=> b!1007508 (= e!567017 e!567015)))

(declare-fun res!676403 () Bool)

(assert (=> b!1007508 (=> (not res!676403) (not e!567015))))

(declare-datatypes ((SeekEntryResult!9523 0))(
  ( (MissingZero!9523 (index!40463 (_ BitVec 32))) (Found!9523 (index!40464 (_ BitVec 32))) (Intermediate!9523 (undefined!10335 Bool) (index!40465 (_ BitVec 32)) (x!87857 (_ BitVec 32))) (Undefined!9523) (MissingVacant!9523 (index!40466 (_ BitVec 32))) )
))
(declare-fun lt!445234 () SeekEntryResult!9523)

(declare-fun lt!445235 () SeekEntryResult!9523)

(assert (=> b!1007508 (= res!676403 (= lt!445234 lt!445235))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007508 (= lt!445235 (Intermediate!9523 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63540 (_ BitVec 32)) SeekEntryResult!9523)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007508 (= lt!445234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30591 a!3219) j!170) mask!3464) (select (arr!30591 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007509 () Bool)

(declare-fun res!676401 () Bool)

(declare-fun e!567018 () Bool)

(assert (=> b!1007509 (=> (not res!676401) (not e!567018))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007509 (= res!676401 (and (= (size!31093 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31093 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31093 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007510 () Bool)

(declare-fun res!676410 () Bool)

(declare-fun e!567014 () Bool)

(assert (=> b!1007510 (=> (not res!676410) (not e!567014))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1007510 (= res!676410 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007511 () Bool)

(declare-fun res!676404 () Bool)

(assert (=> b!1007511 (=> (not res!676404) (not e!567017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63540 (_ BitVec 32)) Bool)

(assert (=> b!1007511 (= res!676404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007512 () Bool)

(declare-fun res!676405 () Bool)

(assert (=> b!1007512 (=> (not res!676405) (not e!567018))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007512 (= res!676405 (validKeyInArray!0 k!2224))))

(declare-fun b!1007513 () Bool)

(declare-fun res!676407 () Bool)

(assert (=> b!1007513 (=> (not res!676407) (not e!567018))))

(declare-fun arrayContainsKey!0 (array!63540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007513 (= res!676407 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!676406 () Bool)

(assert (=> start!86892 (=> (not res!676406) (not e!567018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86892 (= res!676406 (validMask!0 mask!3464))))

(assert (=> start!86892 e!567018))

(declare-fun array_inv!23715 (array!63540) Bool)

(assert (=> start!86892 (array_inv!23715 a!3219)))

(assert (=> start!86892 true))

(declare-fun b!1007514 () Bool)

(declare-fun res!676409 () Bool)

(assert (=> b!1007514 (=> (not res!676409) (not e!567017))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1007514 (= res!676409 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31093 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31093 a!3219))))))

(declare-fun b!1007515 () Bool)

(declare-fun res!676412 () Bool)

(assert (=> b!1007515 (=> (not res!676412) (not e!567014))))

(declare-fun lt!445233 () array!63540)

(declare-fun lt!445232 () SeekEntryResult!9523)

(declare-fun lt!445237 () (_ BitVec 64))

(assert (=> b!1007515 (= res!676412 (not (= lt!445232 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445237 lt!445233 mask!3464))))))

(declare-fun b!1007516 () Bool)

(assert (=> b!1007516 (= e!567018 e!567017)))

(declare-fun res!676408 () Bool)

(assert (=> b!1007516 (=> (not res!676408) (not e!567017))))

(declare-fun lt!445238 () SeekEntryResult!9523)

(assert (=> b!1007516 (= res!676408 (or (= lt!445238 (MissingVacant!9523 i!1194)) (= lt!445238 (MissingZero!9523 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63540 (_ BitVec 32)) SeekEntryResult!9523)

(assert (=> b!1007516 (= lt!445238 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007517 () Bool)

(declare-fun e!567019 () Bool)

(assert (=> b!1007517 (= e!567015 e!567019)))

(declare-fun res!676402 () Bool)

(assert (=> b!1007517 (=> (not res!676402) (not e!567019))))

(assert (=> b!1007517 (= res!676402 (= lt!445232 lt!445235))))

(assert (=> b!1007517 (= lt!445232 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30591 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007518 () Bool)

(declare-fun res!676413 () Bool)

(assert (=> b!1007518 (=> (not res!676413) (not e!567018))))

(assert (=> b!1007518 (= res!676413 (validKeyInArray!0 (select (arr!30591 a!3219) j!170)))))

(declare-fun b!1007519 () Bool)

(assert (=> b!1007519 (= e!567014 false)))

(declare-fun lt!445236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007519 (= lt!445236 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007520 () Bool)

(assert (=> b!1007520 (= e!567019 e!567014)))

(declare-fun res!676411 () Bool)

(assert (=> b!1007520 (=> (not res!676411) (not e!567014))))

(assert (=> b!1007520 (= res!676411 (not (= lt!445234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445237 mask!3464) lt!445237 lt!445233 mask!3464))))))

(assert (=> b!1007520 (= lt!445237 (select (store (arr!30591 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007520 (= lt!445233 (array!63541 (store (arr!30591 a!3219) i!1194 k!2224) (size!31093 a!3219)))))

(assert (= (and start!86892 res!676406) b!1007509))

(assert (= (and b!1007509 res!676401) b!1007518))

(assert (= (and b!1007518 res!676413) b!1007512))

(assert (= (and b!1007512 res!676405) b!1007513))

(assert (= (and b!1007513 res!676407) b!1007516))

(assert (= (and b!1007516 res!676408) b!1007511))

(assert (= (and b!1007511 res!676404) b!1007507))

(assert (= (and b!1007507 res!676400) b!1007514))

(assert (= (and b!1007514 res!676409) b!1007508))

(assert (= (and b!1007508 res!676403) b!1007517))

(assert (= (and b!1007517 res!676402) b!1007520))

(assert (= (and b!1007520 res!676411) b!1007515))

(assert (= (and b!1007515 res!676412) b!1007510))

(assert (= (and b!1007510 res!676410) b!1007519))

(declare-fun m!932387 () Bool)

(assert (=> b!1007511 m!932387))

(declare-fun m!932389 () Bool)

(assert (=> b!1007520 m!932389))

(assert (=> b!1007520 m!932389))

(declare-fun m!932391 () Bool)

(assert (=> b!1007520 m!932391))

(declare-fun m!932393 () Bool)

(assert (=> b!1007520 m!932393))

(declare-fun m!932395 () Bool)

(assert (=> b!1007520 m!932395))

(declare-fun m!932397 () Bool)

(assert (=> b!1007519 m!932397))

(declare-fun m!932399 () Bool)

(assert (=> b!1007515 m!932399))

(declare-fun m!932401 () Bool)

(assert (=> b!1007512 m!932401))

(declare-fun m!932403 () Bool)

(assert (=> b!1007507 m!932403))

(declare-fun m!932405 () Bool)

(assert (=> b!1007513 m!932405))

(declare-fun m!932407 () Bool)

(assert (=> b!1007508 m!932407))

(assert (=> b!1007508 m!932407))

(declare-fun m!932409 () Bool)

(assert (=> b!1007508 m!932409))

(assert (=> b!1007508 m!932409))

(assert (=> b!1007508 m!932407))

(declare-fun m!932411 () Bool)

(assert (=> b!1007508 m!932411))

(declare-fun m!932413 () Bool)

(assert (=> start!86892 m!932413))

(declare-fun m!932415 () Bool)

(assert (=> start!86892 m!932415))

(declare-fun m!932417 () Bool)

(assert (=> b!1007516 m!932417))

(assert (=> b!1007517 m!932407))

(assert (=> b!1007517 m!932407))

(declare-fun m!932419 () Bool)

(assert (=> b!1007517 m!932419))

(assert (=> b!1007518 m!932407))

(assert (=> b!1007518 m!932407))

(declare-fun m!932421 () Bool)

(assert (=> b!1007518 m!932421))

(push 1)

