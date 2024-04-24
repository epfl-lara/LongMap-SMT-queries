; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86824 () Bool)

(assert start!86824)

(declare-fun b!1005452 () Bool)

(declare-fun res!674172 () Bool)

(declare-fun e!566307 () Bool)

(assert (=> b!1005452 (=> (not res!674172) (not e!566307))))

(declare-datatypes ((array!63444 0))(
  ( (array!63445 (arr!30541 (Array (_ BitVec 32) (_ BitVec 64))) (size!31044 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63444)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005452 (= res!674172 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005453 () Bool)

(declare-fun res!674169 () Bool)

(assert (=> b!1005453 (=> (not res!674169) (not e!566307))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005453 (= res!674169 (and (= (size!31044 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31044 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31044 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005454 () Bool)

(declare-fun res!674178 () Bool)

(assert (=> b!1005454 (=> (not res!674178) (not e!566307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005454 (= res!674178 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005455 () Bool)

(declare-fun e!566308 () Bool)

(declare-fun e!566313 () Bool)

(assert (=> b!1005455 (= e!566308 e!566313)))

(declare-fun res!674182 () Bool)

(assert (=> b!1005455 (=> (not res!674182) (not e!566313))))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!444540 () (_ BitVec 32))

(assert (=> b!1005455 (= res!674182 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444540 #b00000000000000000000000000000000) (bvslt lt!444540 (size!31044 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005455 (= lt!444540 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1005456 () Bool)

(declare-fun e!566312 () Bool)

(declare-fun e!566309 () Bool)

(assert (=> b!1005456 (= e!566312 e!566309)))

(declare-fun res!674181 () Bool)

(assert (=> b!1005456 (=> (not res!674181) (not e!566309))))

(declare-datatypes ((SeekEntryResult!9409 0))(
  ( (MissingZero!9409 (index!40007 (_ BitVec 32))) (Found!9409 (index!40008 (_ BitVec 32))) (Intermediate!9409 (undefined!10221 Bool) (index!40009 (_ BitVec 32)) (x!87569 (_ BitVec 32))) (Undefined!9409) (MissingVacant!9409 (index!40010 (_ BitVec 32))) )
))
(declare-fun lt!444538 () SeekEntryResult!9409)

(declare-fun lt!444542 () SeekEntryResult!9409)

(assert (=> b!1005456 (= res!674181 (= lt!444538 lt!444542))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1005456 (= lt!444542 (Intermediate!9409 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63444 (_ BitVec 32)) SeekEntryResult!9409)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005456 (= lt!444538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30541 a!3219) j!170) mask!3464) (select (arr!30541 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005457 () Bool)

(declare-fun res!674183 () Bool)

(assert (=> b!1005457 (=> (not res!674183) (not e!566308))))

(declare-fun lt!444539 () SeekEntryResult!9409)

(declare-fun lt!444544 () (_ BitVec 64))

(declare-fun lt!444545 () array!63444)

(assert (=> b!1005457 (= res!674183 (not (= lt!444539 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444544 lt!444545 mask!3464))))))

(declare-fun b!1005458 () Bool)

(declare-fun res!674175 () Bool)

(assert (=> b!1005458 (=> (not res!674175) (not e!566307))))

(assert (=> b!1005458 (= res!674175 (validKeyInArray!0 (select (arr!30541 a!3219) j!170)))))

(declare-fun b!1005459 () Bool)

(assert (=> b!1005459 (= e!566313 false)))

(declare-fun lt!444541 () SeekEntryResult!9409)

(assert (=> b!1005459 (= lt!444541 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444540 lt!444544 lt!444545 mask!3464))))

(declare-fun b!1005460 () Bool)

(declare-fun res!674176 () Bool)

(assert (=> b!1005460 (=> (not res!674176) (not e!566312))))

(declare-datatypes ((List!21188 0))(
  ( (Nil!21185) (Cons!21184 (h!22370 (_ BitVec 64)) (t!30181 List!21188)) )
))
(declare-fun arrayNoDuplicates!0 (array!63444 (_ BitVec 32) List!21188) Bool)

(assert (=> b!1005460 (= res!674176 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21185))))

(declare-fun res!674168 () Bool)

(assert (=> start!86824 (=> (not res!674168) (not e!566307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86824 (= res!674168 (validMask!0 mask!3464))))

(assert (=> start!86824 e!566307))

(declare-fun array_inv!23677 (array!63444) Bool)

(assert (=> start!86824 (array_inv!23677 a!3219)))

(assert (=> start!86824 true))

(declare-fun b!1005451 () Bool)

(assert (=> b!1005451 (= e!566307 e!566312)))

(declare-fun res!674171 () Bool)

(assert (=> b!1005451 (=> (not res!674171) (not e!566312))))

(declare-fun lt!444543 () SeekEntryResult!9409)

(assert (=> b!1005451 (= res!674171 (or (= lt!444543 (MissingVacant!9409 i!1194)) (= lt!444543 (MissingZero!9409 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63444 (_ BitVec 32)) SeekEntryResult!9409)

(assert (=> b!1005451 (= lt!444543 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005461 () Bool)

(declare-fun res!674180 () Bool)

(assert (=> b!1005461 (=> (not res!674180) (not e!566312))))

(assert (=> b!1005461 (= res!674180 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31044 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31044 a!3219))))))

(declare-fun b!1005462 () Bool)

(declare-fun res!674170 () Bool)

(assert (=> b!1005462 (=> (not res!674170) (not e!566308))))

(assert (=> b!1005462 (= res!674170 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1005463 () Bool)

(declare-fun res!674174 () Bool)

(assert (=> b!1005463 (=> (not res!674174) (not e!566313))))

(assert (=> b!1005463 (= res!674174 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444540 (select (arr!30541 a!3219) j!170) a!3219 mask!3464) lt!444542))))

(declare-fun b!1005464 () Bool)

(declare-fun e!566310 () Bool)

(assert (=> b!1005464 (= e!566309 e!566310)))

(declare-fun res!674173 () Bool)

(assert (=> b!1005464 (=> (not res!674173) (not e!566310))))

(assert (=> b!1005464 (= res!674173 (= lt!444539 lt!444542))))

(assert (=> b!1005464 (= lt!444539 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30541 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005465 () Bool)

(declare-fun res!674177 () Bool)

(assert (=> b!1005465 (=> (not res!674177) (not e!566312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63444 (_ BitVec 32)) Bool)

(assert (=> b!1005465 (= res!674177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005466 () Bool)

(assert (=> b!1005466 (= e!566310 e!566308)))

(declare-fun res!674179 () Bool)

(assert (=> b!1005466 (=> (not res!674179) (not e!566308))))

(assert (=> b!1005466 (= res!674179 (not (= lt!444538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444544 mask!3464) lt!444544 lt!444545 mask!3464))))))

(assert (=> b!1005466 (= lt!444544 (select (store (arr!30541 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1005466 (= lt!444545 (array!63445 (store (arr!30541 a!3219) i!1194 k0!2224) (size!31044 a!3219)))))

(assert (= (and start!86824 res!674168) b!1005453))

(assert (= (and b!1005453 res!674169) b!1005458))

(assert (= (and b!1005458 res!674175) b!1005454))

(assert (= (and b!1005454 res!674178) b!1005452))

(assert (= (and b!1005452 res!674172) b!1005451))

(assert (= (and b!1005451 res!674171) b!1005465))

(assert (= (and b!1005465 res!674177) b!1005460))

(assert (= (and b!1005460 res!674176) b!1005461))

(assert (= (and b!1005461 res!674180) b!1005456))

(assert (= (and b!1005456 res!674181) b!1005464))

(assert (= (and b!1005464 res!674173) b!1005466))

(assert (= (and b!1005466 res!674179) b!1005457))

(assert (= (and b!1005457 res!674183) b!1005462))

(assert (= (and b!1005462 res!674170) b!1005455))

(assert (= (and b!1005455 res!674182) b!1005463))

(assert (= (and b!1005463 res!674174) b!1005459))

(declare-fun m!931313 () Bool)

(assert (=> b!1005455 m!931313))

(declare-fun m!931315 () Bool)

(assert (=> b!1005457 m!931315))

(declare-fun m!931317 () Bool)

(assert (=> b!1005452 m!931317))

(declare-fun m!931319 () Bool)

(assert (=> b!1005451 m!931319))

(declare-fun m!931321 () Bool)

(assert (=> b!1005460 m!931321))

(declare-fun m!931323 () Bool)

(assert (=> b!1005459 m!931323))

(declare-fun m!931325 () Bool)

(assert (=> b!1005454 m!931325))

(declare-fun m!931327 () Bool)

(assert (=> b!1005456 m!931327))

(assert (=> b!1005456 m!931327))

(declare-fun m!931329 () Bool)

(assert (=> b!1005456 m!931329))

(assert (=> b!1005456 m!931329))

(assert (=> b!1005456 m!931327))

(declare-fun m!931331 () Bool)

(assert (=> b!1005456 m!931331))

(declare-fun m!931333 () Bool)

(assert (=> b!1005465 m!931333))

(declare-fun m!931335 () Bool)

(assert (=> b!1005466 m!931335))

(assert (=> b!1005466 m!931335))

(declare-fun m!931337 () Bool)

(assert (=> b!1005466 m!931337))

(declare-fun m!931339 () Bool)

(assert (=> b!1005466 m!931339))

(declare-fun m!931341 () Bool)

(assert (=> b!1005466 m!931341))

(declare-fun m!931343 () Bool)

(assert (=> start!86824 m!931343))

(declare-fun m!931345 () Bool)

(assert (=> start!86824 m!931345))

(assert (=> b!1005458 m!931327))

(assert (=> b!1005458 m!931327))

(declare-fun m!931347 () Bool)

(assert (=> b!1005458 m!931347))

(assert (=> b!1005464 m!931327))

(assert (=> b!1005464 m!931327))

(declare-fun m!931349 () Bool)

(assert (=> b!1005464 m!931349))

(assert (=> b!1005463 m!931327))

(assert (=> b!1005463 m!931327))

(declare-fun m!931351 () Bool)

(assert (=> b!1005463 m!931351))

(check-sat (not start!86824) (not b!1005459) (not b!1005460) (not b!1005463) (not b!1005456) (not b!1005457) (not b!1005458) (not b!1005465) (not b!1005466) (not b!1005455) (not b!1005451) (not b!1005454) (not b!1005464) (not b!1005452))
(check-sat)
