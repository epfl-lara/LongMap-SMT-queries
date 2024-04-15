; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86886 () Bool)

(assert start!86886)

(declare-fun b!1007331 () Bool)

(declare-fun res!676353 () Bool)

(declare-fun e!566904 () Bool)

(assert (=> b!1007331 (=> (not res!676353) (not e!566904))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007331 (= res!676353 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007332 () Bool)

(declare-fun e!566903 () Bool)

(declare-fun e!566901 () Bool)

(assert (=> b!1007332 (= e!566903 e!566901)))

(declare-fun res!676354 () Bool)

(assert (=> b!1007332 (=> (not res!676354) (not e!566901))))

(declare-datatypes ((SeekEntryResult!9518 0))(
  ( (MissingZero!9518 (index!40443 (_ BitVec 32))) (Found!9518 (index!40444 (_ BitVec 32))) (Intermediate!9518 (undefined!10330 Bool) (index!40445 (_ BitVec 32)) (x!87855 (_ BitVec 32))) (Undefined!9518) (MissingVacant!9518 (index!40446 (_ BitVec 32))) )
))
(declare-fun lt!445021 () SeekEntryResult!9518)

(declare-fun lt!445023 () SeekEntryResult!9518)

(assert (=> b!1007332 (= res!676354 (= lt!445021 lt!445023))))

(declare-datatypes ((array!63481 0))(
  ( (array!63482 (arr!30561 (Array (_ BitVec 32) (_ BitVec 64))) (size!31065 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63481)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63481 (_ BitVec 32)) SeekEntryResult!9518)

(assert (=> b!1007332 (= lt!445021 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30561 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007333 () Bool)

(declare-fun res!676358 () Bool)

(declare-fun e!566905 () Bool)

(assert (=> b!1007333 (=> (not res!676358) (not e!566905))))

(declare-fun lt!445026 () (_ BitVec 64))

(declare-fun lt!445027 () array!63481)

(assert (=> b!1007333 (= res!676358 (not (= lt!445021 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445026 lt!445027 mask!3464))))))

(declare-fun b!1007334 () Bool)

(declare-fun e!566902 () Bool)

(assert (=> b!1007334 (= e!566902 e!566903)))

(declare-fun res!676350 () Bool)

(assert (=> b!1007334 (=> (not res!676350) (not e!566903))))

(declare-fun lt!445024 () SeekEntryResult!9518)

(assert (=> b!1007334 (= res!676350 (= lt!445024 lt!445023))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007334 (= lt!445023 (Intermediate!9518 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007334 (= lt!445024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30561 a!3219) j!170) mask!3464) (select (arr!30561 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007335 () Bool)

(assert (=> b!1007335 (= e!566905 false)))

(declare-fun lt!445022 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007335 (= lt!445022 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!676352 () Bool)

(assert (=> start!86886 (=> (not res!676352) (not e!566904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86886 (= res!676352 (validMask!0 mask!3464))))

(assert (=> start!86886 e!566904))

(declare-fun array_inv!23704 (array!63481) Bool)

(assert (=> start!86886 (array_inv!23704 a!3219)))

(assert (=> start!86886 true))

(declare-fun b!1007336 () Bool)

(assert (=> b!1007336 (= e!566904 e!566902)))

(declare-fun res!676349 () Bool)

(assert (=> b!1007336 (=> (not res!676349) (not e!566902))))

(declare-fun lt!445025 () SeekEntryResult!9518)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007336 (= res!676349 (or (= lt!445025 (MissingVacant!9518 i!1194)) (= lt!445025 (MissingZero!9518 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63481 (_ BitVec 32)) SeekEntryResult!9518)

(assert (=> b!1007336 (= lt!445025 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007337 () Bool)

(declare-fun res!676351 () Bool)

(assert (=> b!1007337 (=> (not res!676351) (not e!566902))))

(declare-datatypes ((List!21303 0))(
  ( (Nil!21300) (Cons!21299 (h!22485 (_ BitVec 64)) (t!30295 List!21303)) )
))
(declare-fun arrayNoDuplicates!0 (array!63481 (_ BitVec 32) List!21303) Bool)

(assert (=> b!1007337 (= res!676351 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21300))))

(declare-fun b!1007338 () Bool)

(declare-fun res!676356 () Bool)

(assert (=> b!1007338 (=> (not res!676356) (not e!566904))))

(assert (=> b!1007338 (= res!676356 (and (= (size!31065 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31065 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31065 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007339 () Bool)

(declare-fun res!676361 () Bool)

(assert (=> b!1007339 (=> (not res!676361) (not e!566905))))

(assert (=> b!1007339 (= res!676361 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007340 () Bool)

(declare-fun res!676360 () Bool)

(assert (=> b!1007340 (=> (not res!676360) (not e!566904))))

(assert (=> b!1007340 (= res!676360 (validKeyInArray!0 (select (arr!30561 a!3219) j!170)))))

(declare-fun b!1007341 () Bool)

(declare-fun res!676357 () Bool)

(assert (=> b!1007341 (=> (not res!676357) (not e!566904))))

(declare-fun arrayContainsKey!0 (array!63481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007341 (= res!676357 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007342 () Bool)

(declare-fun res!676348 () Bool)

(assert (=> b!1007342 (=> (not res!676348) (not e!566902))))

(assert (=> b!1007342 (= res!676348 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31065 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31065 a!3219))))))

(declare-fun b!1007343 () Bool)

(declare-fun res!676355 () Bool)

(assert (=> b!1007343 (=> (not res!676355) (not e!566902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63481 (_ BitVec 32)) Bool)

(assert (=> b!1007343 (= res!676355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007344 () Bool)

(assert (=> b!1007344 (= e!566901 e!566905)))

(declare-fun res!676359 () Bool)

(assert (=> b!1007344 (=> (not res!676359) (not e!566905))))

(assert (=> b!1007344 (= res!676359 (not (= lt!445024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445026 mask!3464) lt!445026 lt!445027 mask!3464))))))

(assert (=> b!1007344 (= lt!445026 (select (store (arr!30561 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007344 (= lt!445027 (array!63482 (store (arr!30561 a!3219) i!1194 k0!2224) (size!31065 a!3219)))))

(assert (= (and start!86886 res!676352) b!1007338))

(assert (= (and b!1007338 res!676356) b!1007340))

(assert (= (and b!1007340 res!676360) b!1007331))

(assert (= (and b!1007331 res!676353) b!1007341))

(assert (= (and b!1007341 res!676357) b!1007336))

(assert (= (and b!1007336 res!676349) b!1007343))

(assert (= (and b!1007343 res!676355) b!1007337))

(assert (= (and b!1007337 res!676351) b!1007342))

(assert (= (and b!1007342 res!676348) b!1007334))

(assert (= (and b!1007334 res!676350) b!1007332))

(assert (= (and b!1007332 res!676354) b!1007344))

(assert (= (and b!1007344 res!676359) b!1007333))

(assert (= (and b!1007333 res!676358) b!1007339))

(assert (= (and b!1007339 res!676361) b!1007335))

(declare-fun m!931693 () Bool)

(assert (=> b!1007336 m!931693))

(declare-fun m!931695 () Bool)

(assert (=> b!1007334 m!931695))

(assert (=> b!1007334 m!931695))

(declare-fun m!931697 () Bool)

(assert (=> b!1007334 m!931697))

(assert (=> b!1007334 m!931697))

(assert (=> b!1007334 m!931695))

(declare-fun m!931699 () Bool)

(assert (=> b!1007334 m!931699))

(assert (=> b!1007332 m!931695))

(assert (=> b!1007332 m!931695))

(declare-fun m!931701 () Bool)

(assert (=> b!1007332 m!931701))

(declare-fun m!931703 () Bool)

(assert (=> b!1007335 m!931703))

(declare-fun m!931705 () Bool)

(assert (=> b!1007344 m!931705))

(assert (=> b!1007344 m!931705))

(declare-fun m!931707 () Bool)

(assert (=> b!1007344 m!931707))

(declare-fun m!931709 () Bool)

(assert (=> b!1007344 m!931709))

(declare-fun m!931711 () Bool)

(assert (=> b!1007344 m!931711))

(declare-fun m!931713 () Bool)

(assert (=> b!1007341 m!931713))

(declare-fun m!931715 () Bool)

(assert (=> b!1007343 m!931715))

(declare-fun m!931717 () Bool)

(assert (=> b!1007337 m!931717))

(declare-fun m!931719 () Bool)

(assert (=> b!1007333 m!931719))

(declare-fun m!931721 () Bool)

(assert (=> start!86886 m!931721))

(declare-fun m!931723 () Bool)

(assert (=> start!86886 m!931723))

(assert (=> b!1007340 m!931695))

(assert (=> b!1007340 m!931695))

(declare-fun m!931725 () Bool)

(assert (=> b!1007340 m!931725))

(declare-fun m!931727 () Bool)

(assert (=> b!1007331 m!931727))

(check-sat (not b!1007333) (not b!1007344) (not b!1007341) (not b!1007331) (not b!1007332) (not b!1007337) (not start!86886) (not b!1007343) (not b!1007334) (not b!1007335) (not b!1007340) (not b!1007336))
(check-sat)
