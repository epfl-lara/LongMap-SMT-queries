; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86416 () Bool)

(assert start!86416)

(declare-fun b!1000250 () Bool)

(declare-fun res!669733 () Bool)

(declare-fun e!563827 () Bool)

(assert (=> b!1000250 (=> (not res!669733) (not e!563827))))

(declare-datatypes ((array!63217 0))(
  ( (array!63218 (arr!30434 (Array (_ BitVec 32) (_ BitVec 64))) (size!30936 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63217)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000250 (= res!669733 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000251 () Bool)

(declare-fun res!669731 () Bool)

(assert (=> b!1000251 (=> (not res!669731) (not e!563827))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000251 (= res!669731 (validKeyInArray!0 (select (arr!30434 a!3219) j!170)))))

(declare-fun b!1000252 () Bool)

(declare-fun res!669737 () Bool)

(declare-fun e!563829 () Bool)

(assert (=> b!1000252 (=> (not res!669737) (not e!563829))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63217 (_ BitVec 32)) Bool)

(assert (=> b!1000252 (= res!669737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000253 () Bool)

(declare-fun e!563830 () Bool)

(assert (=> b!1000253 (= e!563829 e!563830)))

(declare-fun res!669732 () Bool)

(assert (=> b!1000253 (=> (not res!669732) (not e!563830))))

(declare-datatypes ((SeekEntryResult!9366 0))(
  ( (MissingZero!9366 (index!39835 (_ BitVec 32))) (Found!9366 (index!39836 (_ BitVec 32))) (Intermediate!9366 (undefined!10178 Bool) (index!39837 (_ BitVec 32)) (x!87266 (_ BitVec 32))) (Undefined!9366) (MissingVacant!9366 (index!39838 (_ BitVec 32))) )
))
(declare-fun lt!442239 () SeekEntryResult!9366)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63217 (_ BitVec 32)) SeekEntryResult!9366)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000253 (= res!669732 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30434 a!3219) j!170) mask!3464) (select (arr!30434 a!3219) j!170) a!3219 mask!3464) lt!442239))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000253 (= lt!442239 (Intermediate!9366 false resIndex!38 resX!38))))

(declare-fun b!1000254 () Bool)

(assert (=> b!1000254 (= e!563827 e!563829)))

(declare-fun res!669729 () Bool)

(assert (=> b!1000254 (=> (not res!669729) (not e!563829))))

(declare-fun lt!442240 () SeekEntryResult!9366)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000254 (= res!669729 (or (= lt!442240 (MissingVacant!9366 i!1194)) (= lt!442240 (MissingZero!9366 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63217 (_ BitVec 32)) SeekEntryResult!9366)

(assert (=> b!1000254 (= lt!442240 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000255 () Bool)

(declare-fun res!669738 () Bool)

(assert (=> b!1000255 (=> (not res!669738) (not e!563827))))

(assert (=> b!1000255 (= res!669738 (and (= (size!30936 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30936 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30936 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!669735 () Bool)

(assert (=> start!86416 (=> (not res!669735) (not e!563827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86416 (= res!669735 (validMask!0 mask!3464))))

(assert (=> start!86416 e!563827))

(declare-fun array_inv!23558 (array!63217) Bool)

(assert (=> start!86416 (array_inv!23558 a!3219)))

(assert (=> start!86416 true))

(declare-fun b!1000256 () Bool)

(declare-fun res!669734 () Bool)

(assert (=> b!1000256 (=> (not res!669734) (not e!563829))))

(declare-datatypes ((List!21110 0))(
  ( (Nil!21107) (Cons!21106 (h!22283 (_ BitVec 64)) (t!30111 List!21110)) )
))
(declare-fun arrayNoDuplicates!0 (array!63217 (_ BitVec 32) List!21110) Bool)

(assert (=> b!1000256 (= res!669734 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21107))))

(declare-fun b!1000257 () Bool)

(declare-fun res!669730 () Bool)

(assert (=> b!1000257 (=> (not res!669730) (not e!563829))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000257 (= res!669730 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30936 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30936 a!3219))))))

(declare-fun b!1000258 () Bool)

(assert (=> b!1000258 (= e!563830 false)))

(declare-fun lt!442241 () SeekEntryResult!9366)

(assert (=> b!1000258 (= lt!442241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30434 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30434 a!3219) i!1194 k0!2224) j!170) (array!63218 (store (arr!30434 a!3219) i!1194 k0!2224) (size!30936 a!3219)) mask!3464))))

(declare-fun b!1000259 () Bool)

(declare-fun res!669728 () Bool)

(assert (=> b!1000259 (=> (not res!669728) (not e!563830))))

(assert (=> b!1000259 (= res!669728 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30434 a!3219) j!170) a!3219 mask!3464) lt!442239))))

(declare-fun b!1000260 () Bool)

(declare-fun res!669736 () Bool)

(assert (=> b!1000260 (=> (not res!669736) (not e!563827))))

(assert (=> b!1000260 (= res!669736 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86416 res!669735) b!1000255))

(assert (= (and b!1000255 res!669738) b!1000251))

(assert (= (and b!1000251 res!669731) b!1000260))

(assert (= (and b!1000260 res!669736) b!1000250))

(assert (= (and b!1000250 res!669733) b!1000254))

(assert (= (and b!1000254 res!669729) b!1000252))

(assert (= (and b!1000252 res!669737) b!1000256))

(assert (= (and b!1000256 res!669734) b!1000257))

(assert (= (and b!1000257 res!669730) b!1000253))

(assert (= (and b!1000253 res!669732) b!1000259))

(assert (= (and b!1000259 res!669728) b!1000258))

(declare-fun m!926431 () Bool)

(assert (=> b!1000253 m!926431))

(assert (=> b!1000253 m!926431))

(declare-fun m!926433 () Bool)

(assert (=> b!1000253 m!926433))

(assert (=> b!1000253 m!926433))

(assert (=> b!1000253 m!926431))

(declare-fun m!926435 () Bool)

(assert (=> b!1000253 m!926435))

(declare-fun m!926437 () Bool)

(assert (=> b!1000252 m!926437))

(declare-fun m!926439 () Bool)

(assert (=> b!1000254 m!926439))

(declare-fun m!926441 () Bool)

(assert (=> b!1000260 m!926441))

(assert (=> b!1000259 m!926431))

(assert (=> b!1000259 m!926431))

(declare-fun m!926443 () Bool)

(assert (=> b!1000259 m!926443))

(declare-fun m!926445 () Bool)

(assert (=> b!1000250 m!926445))

(declare-fun m!926447 () Bool)

(assert (=> start!86416 m!926447))

(declare-fun m!926449 () Bool)

(assert (=> start!86416 m!926449))

(assert (=> b!1000251 m!926431))

(assert (=> b!1000251 m!926431))

(declare-fun m!926451 () Bool)

(assert (=> b!1000251 m!926451))

(declare-fun m!926453 () Bool)

(assert (=> b!1000256 m!926453))

(declare-fun m!926455 () Bool)

(assert (=> b!1000258 m!926455))

(declare-fun m!926457 () Bool)

(assert (=> b!1000258 m!926457))

(assert (=> b!1000258 m!926457))

(declare-fun m!926459 () Bool)

(assert (=> b!1000258 m!926459))

(assert (=> b!1000258 m!926459))

(assert (=> b!1000258 m!926457))

(declare-fun m!926461 () Bool)

(assert (=> b!1000258 m!926461))

(check-sat (not start!86416) (not b!1000256) (not b!1000258) (not b!1000252) (not b!1000250) (not b!1000254) (not b!1000253) (not b!1000260) (not b!1000251) (not b!1000259))
(check-sat)
