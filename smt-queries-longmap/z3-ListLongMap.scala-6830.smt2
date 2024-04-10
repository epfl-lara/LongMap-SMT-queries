; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86020 () Bool)

(assert start!86020)

(declare-fun b!996343 () Bool)

(declare-fun res!666459 () Bool)

(declare-fun e!562171 () Bool)

(assert (=> b!996343 (=> (not res!666459) (not e!562171))))

(declare-datatypes ((array!63025 0))(
  ( (array!63026 (arr!30344 (Array (_ BitVec 32) (_ BitVec 64))) (size!30846 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63025)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996343 (= res!666459 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30846 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30846 a!3219))))))

(declare-fun res!666457 () Bool)

(declare-fun e!562169 () Bool)

(assert (=> start!86020 (=> (not res!666457) (not e!562169))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86020 (= res!666457 (validMask!0 mask!3464))))

(assert (=> start!86020 e!562169))

(declare-fun array_inv!23468 (array!63025) Bool)

(assert (=> start!86020 (array_inv!23468 a!3219)))

(assert (=> start!86020 true))

(declare-fun b!996344 () Bool)

(declare-fun res!666463 () Bool)

(assert (=> b!996344 (=> (not res!666463) (not e!562169))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996344 (= res!666463 (and (= (size!30846 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30846 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30846 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996345 () Bool)

(assert (=> b!996345 (= e!562171 false)))

(declare-fun lt!441214 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996345 (= lt!441214 (toIndex!0 (select (arr!30344 a!3219) j!170) mask!3464))))

(declare-fun b!996346 () Bool)

(declare-fun res!666461 () Bool)

(assert (=> b!996346 (=> (not res!666461) (not e!562171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63025 (_ BitVec 32)) Bool)

(assert (=> b!996346 (= res!666461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996347 () Bool)

(declare-fun res!666465 () Bool)

(assert (=> b!996347 (=> (not res!666465) (not e!562169))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996347 (= res!666465 (validKeyInArray!0 k0!2224))))

(declare-fun b!996348 () Bool)

(declare-fun res!666460 () Bool)

(assert (=> b!996348 (=> (not res!666460) (not e!562171))))

(declare-datatypes ((List!21020 0))(
  ( (Nil!21017) (Cons!21016 (h!22181 (_ BitVec 64)) (t!30021 List!21020)) )
))
(declare-fun arrayNoDuplicates!0 (array!63025 (_ BitVec 32) List!21020) Bool)

(assert (=> b!996348 (= res!666460 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21017))))

(declare-fun b!996349 () Bool)

(declare-fun res!666462 () Bool)

(assert (=> b!996349 (=> (not res!666462) (not e!562169))))

(assert (=> b!996349 (= res!666462 (validKeyInArray!0 (select (arr!30344 a!3219) j!170)))))

(declare-fun b!996350 () Bool)

(declare-fun res!666458 () Bool)

(assert (=> b!996350 (=> (not res!666458) (not e!562169))))

(declare-fun arrayContainsKey!0 (array!63025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996350 (= res!666458 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996351 () Bool)

(assert (=> b!996351 (= e!562169 e!562171)))

(declare-fun res!666464 () Bool)

(assert (=> b!996351 (=> (not res!666464) (not e!562171))))

(declare-datatypes ((SeekEntryResult!9276 0))(
  ( (MissingZero!9276 (index!39475 (_ BitVec 32))) (Found!9276 (index!39476 (_ BitVec 32))) (Intermediate!9276 (undefined!10088 Bool) (index!39477 (_ BitVec 32)) (x!86912 (_ BitVec 32))) (Undefined!9276) (MissingVacant!9276 (index!39478 (_ BitVec 32))) )
))
(declare-fun lt!441215 () SeekEntryResult!9276)

(assert (=> b!996351 (= res!666464 (or (= lt!441215 (MissingVacant!9276 i!1194)) (= lt!441215 (MissingZero!9276 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63025 (_ BitVec 32)) SeekEntryResult!9276)

(assert (=> b!996351 (= lt!441215 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86020 res!666457) b!996344))

(assert (= (and b!996344 res!666463) b!996349))

(assert (= (and b!996349 res!666462) b!996347))

(assert (= (and b!996347 res!666465) b!996350))

(assert (= (and b!996350 res!666458) b!996351))

(assert (= (and b!996351 res!666464) b!996346))

(assert (= (and b!996346 res!666461) b!996348))

(assert (= (and b!996348 res!666460) b!996343))

(assert (= (and b!996343 res!666459) b!996345))

(declare-fun m!923485 () Bool)

(assert (=> b!996350 m!923485))

(declare-fun m!923487 () Bool)

(assert (=> start!86020 m!923487))

(declare-fun m!923489 () Bool)

(assert (=> start!86020 m!923489))

(declare-fun m!923491 () Bool)

(assert (=> b!996347 m!923491))

(declare-fun m!923493 () Bool)

(assert (=> b!996351 m!923493))

(declare-fun m!923495 () Bool)

(assert (=> b!996349 m!923495))

(assert (=> b!996349 m!923495))

(declare-fun m!923497 () Bool)

(assert (=> b!996349 m!923497))

(declare-fun m!923499 () Bool)

(assert (=> b!996346 m!923499))

(assert (=> b!996345 m!923495))

(assert (=> b!996345 m!923495))

(declare-fun m!923501 () Bool)

(assert (=> b!996345 m!923501))

(declare-fun m!923503 () Bool)

(assert (=> b!996348 m!923503))

(check-sat (not b!996349) (not b!996345) (not b!996347) (not b!996351) (not b!996350) (not b!996348) (not start!86020) (not b!996346))
(check-sat)
