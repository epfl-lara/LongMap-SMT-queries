; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86026 () Bool)

(assert start!86026)

(declare-fun b!996424 () Bool)

(declare-fun res!666539 () Bool)

(declare-fun e!562197 () Bool)

(assert (=> b!996424 (=> (not res!666539) (not e!562197))))

(declare-datatypes ((array!63031 0))(
  ( (array!63032 (arr!30347 (Array (_ BitVec 32) (_ BitVec 64))) (size!30849 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63031)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996424 (= res!666539 (validKeyInArray!0 (select (arr!30347 a!3219) j!170)))))

(declare-fun res!666538 () Bool)

(assert (=> start!86026 (=> (not res!666538) (not e!562197))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86026 (= res!666538 (validMask!0 mask!3464))))

(assert (=> start!86026 e!562197))

(declare-fun array_inv!23471 (array!63031) Bool)

(assert (=> start!86026 (array_inv!23471 a!3219)))

(assert (=> start!86026 true))

(declare-fun b!996425 () Bool)

(declare-fun e!562196 () Bool)

(assert (=> b!996425 (= e!562196 false)))

(declare-fun lt!441233 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996425 (= lt!441233 (toIndex!0 (select (arr!30347 a!3219) j!170) mask!3464))))

(declare-fun b!996426 () Bool)

(declare-fun res!666542 () Bool)

(assert (=> b!996426 (=> (not res!666542) (not e!562197))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996426 (= res!666542 (and (= (size!30849 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30849 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30849 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996427 () Bool)

(declare-fun res!666543 () Bool)

(assert (=> b!996427 (=> (not res!666543) (not e!562196))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996427 (= res!666543 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30849 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30849 a!3219))))))

(declare-fun b!996428 () Bool)

(declare-fun res!666546 () Bool)

(assert (=> b!996428 (=> (not res!666546) (not e!562196))))

(declare-datatypes ((List!21023 0))(
  ( (Nil!21020) (Cons!21019 (h!22184 (_ BitVec 64)) (t!30024 List!21023)) )
))
(declare-fun arrayNoDuplicates!0 (array!63031 (_ BitVec 32) List!21023) Bool)

(assert (=> b!996428 (= res!666546 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21020))))

(declare-fun b!996429 () Bool)

(declare-fun res!666545 () Bool)

(assert (=> b!996429 (=> (not res!666545) (not e!562197))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!996429 (= res!666545 (validKeyInArray!0 k0!2224))))

(declare-fun b!996430 () Bool)

(declare-fun res!666540 () Bool)

(assert (=> b!996430 (=> (not res!666540) (not e!562197))))

(declare-fun arrayContainsKey!0 (array!63031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996430 (= res!666540 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996431 () Bool)

(assert (=> b!996431 (= e!562197 e!562196)))

(declare-fun res!666544 () Bool)

(assert (=> b!996431 (=> (not res!666544) (not e!562196))))

(declare-datatypes ((SeekEntryResult!9279 0))(
  ( (MissingZero!9279 (index!39487 (_ BitVec 32))) (Found!9279 (index!39488 (_ BitVec 32))) (Intermediate!9279 (undefined!10091 Bool) (index!39489 (_ BitVec 32)) (x!86923 (_ BitVec 32))) (Undefined!9279) (MissingVacant!9279 (index!39490 (_ BitVec 32))) )
))
(declare-fun lt!441232 () SeekEntryResult!9279)

(assert (=> b!996431 (= res!666544 (or (= lt!441232 (MissingVacant!9279 i!1194)) (= lt!441232 (MissingZero!9279 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63031 (_ BitVec 32)) SeekEntryResult!9279)

(assert (=> b!996431 (= lt!441232 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996432 () Bool)

(declare-fun res!666541 () Bool)

(assert (=> b!996432 (=> (not res!666541) (not e!562196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63031 (_ BitVec 32)) Bool)

(assert (=> b!996432 (= res!666541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86026 res!666538) b!996426))

(assert (= (and b!996426 res!666542) b!996424))

(assert (= (and b!996424 res!666539) b!996429))

(assert (= (and b!996429 res!666545) b!996430))

(assert (= (and b!996430 res!666540) b!996431))

(assert (= (and b!996431 res!666544) b!996432))

(assert (= (and b!996432 res!666541) b!996428))

(assert (= (and b!996428 res!666546) b!996427))

(assert (= (and b!996427 res!666543) b!996425))

(declare-fun m!923545 () Bool)

(assert (=> b!996428 m!923545))

(declare-fun m!923547 () Bool)

(assert (=> b!996425 m!923547))

(assert (=> b!996425 m!923547))

(declare-fun m!923549 () Bool)

(assert (=> b!996425 m!923549))

(declare-fun m!923551 () Bool)

(assert (=> b!996429 m!923551))

(declare-fun m!923553 () Bool)

(assert (=> b!996431 m!923553))

(declare-fun m!923555 () Bool)

(assert (=> start!86026 m!923555))

(declare-fun m!923557 () Bool)

(assert (=> start!86026 m!923557))

(declare-fun m!923559 () Bool)

(assert (=> b!996430 m!923559))

(assert (=> b!996424 m!923547))

(assert (=> b!996424 m!923547))

(declare-fun m!923561 () Bool)

(assert (=> b!996424 m!923561))

(declare-fun m!923563 () Bool)

(assert (=> b!996432 m!923563))

(check-sat (not b!996428) (not b!996432) (not b!996429) (not start!86026) (not b!996430) (not b!996425) (not b!996424) (not b!996431))
(check-sat)
