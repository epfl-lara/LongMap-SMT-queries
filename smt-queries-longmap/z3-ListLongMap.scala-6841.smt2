; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86140 () Bool)

(assert start!86140)

(declare-fun b!997577 () Bool)

(declare-fun e!562659 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!997577 (= e!562659 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!997578 () Bool)

(declare-fun res!667536 () Bool)

(declare-fun e!562658 () Bool)

(assert (=> b!997578 (=> (not res!667536) (not e!562658))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997578 (= res!667536 (validKeyInArray!0 k0!2224))))

(declare-fun b!997579 () Bool)

(declare-fun res!667542 () Bool)

(assert (=> b!997579 (=> (not res!667542) (not e!562658))))

(declare-datatypes ((array!63094 0))(
  ( (array!63095 (arr!30377 (Array (_ BitVec 32) (_ BitVec 64))) (size!30879 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63094)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997579 (= res!667542 (and (= (size!30879 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30879 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30879 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!667532 () Bool)

(assert (=> start!86140 (=> (not res!667532) (not e!562658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86140 (= res!667532 (validMask!0 mask!3464))))

(assert (=> start!86140 e!562658))

(declare-fun array_inv!23501 (array!63094) Bool)

(assert (=> start!86140 (array_inv!23501 a!3219)))

(assert (=> start!86140 true))

(declare-fun b!997580 () Bool)

(declare-fun e!562660 () Bool)

(assert (=> b!997580 (= e!562658 e!562660)))

(declare-fun res!667535 () Bool)

(assert (=> b!997580 (=> (not res!667535) (not e!562660))))

(declare-datatypes ((SeekEntryResult!9309 0))(
  ( (MissingZero!9309 (index!39607 (_ BitVec 32))) (Found!9309 (index!39608 (_ BitVec 32))) (Intermediate!9309 (undefined!10121 Bool) (index!39609 (_ BitVec 32)) (x!87039 (_ BitVec 32))) (Undefined!9309) (MissingVacant!9309 (index!39610 (_ BitVec 32))) )
))
(declare-fun lt!441481 () SeekEntryResult!9309)

(assert (=> b!997580 (= res!667535 (or (= lt!441481 (MissingVacant!9309 i!1194)) (= lt!441481 (MissingZero!9309 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63094 (_ BitVec 32)) SeekEntryResult!9309)

(assert (=> b!997580 (= lt!441481 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997581 () Bool)

(declare-fun res!667540 () Bool)

(assert (=> b!997581 (=> (not res!667540) (not e!562660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63094 (_ BitVec 32)) Bool)

(assert (=> b!997581 (= res!667540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997582 () Bool)

(declare-fun res!667541 () Bool)

(assert (=> b!997582 (=> (not res!667541) (not e!562658))))

(declare-fun arrayContainsKey!0 (array!63094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997582 (= res!667541 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997583 () Bool)

(declare-fun res!667537 () Bool)

(assert (=> b!997583 (=> (not res!667537) (not e!562660))))

(declare-datatypes ((List!21053 0))(
  ( (Nil!21050) (Cons!21049 (h!22217 (_ BitVec 64)) (t!30054 List!21053)) )
))
(declare-fun arrayNoDuplicates!0 (array!63094 (_ BitVec 32) List!21053) Bool)

(assert (=> b!997583 (= res!667537 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21050))))

(declare-fun b!997584 () Bool)

(declare-fun res!667539 () Bool)

(assert (=> b!997584 (=> (not res!667539) (not e!562659))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!441482 () SeekEntryResult!9309)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63094 (_ BitVec 32)) SeekEntryResult!9309)

(assert (=> b!997584 (= res!667539 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30377 a!3219) j!170) a!3219 mask!3464) lt!441482))))

(declare-fun b!997585 () Bool)

(assert (=> b!997585 (= e!562660 e!562659)))

(declare-fun res!667534 () Bool)

(assert (=> b!997585 (=> (not res!667534) (not e!562659))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997585 (= res!667534 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30377 a!3219) j!170) mask!3464) (select (arr!30377 a!3219) j!170) a!3219 mask!3464) lt!441482))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997585 (= lt!441482 (Intermediate!9309 false resIndex!38 resX!38))))

(declare-fun b!997586 () Bool)

(declare-fun res!667538 () Bool)

(assert (=> b!997586 (=> (not res!667538) (not e!562658))))

(assert (=> b!997586 (= res!667538 (validKeyInArray!0 (select (arr!30377 a!3219) j!170)))))

(declare-fun b!997587 () Bool)

(declare-fun res!667533 () Bool)

(assert (=> b!997587 (=> (not res!667533) (not e!562660))))

(assert (=> b!997587 (= res!667533 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30879 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30879 a!3219))))))

(assert (= (and start!86140 res!667532) b!997579))

(assert (= (and b!997579 res!667542) b!997586))

(assert (= (and b!997586 res!667538) b!997578))

(assert (= (and b!997578 res!667536) b!997582))

(assert (= (and b!997582 res!667541) b!997580))

(assert (= (and b!997580 res!667535) b!997581))

(assert (= (and b!997581 res!667540) b!997583))

(assert (= (and b!997583 res!667537) b!997587))

(assert (= (and b!997587 res!667533) b!997585))

(assert (= (and b!997585 res!667534) b!997584))

(assert (= (and b!997584 res!667539) b!997577))

(declare-fun m!924365 () Bool)

(assert (=> b!997580 m!924365))

(declare-fun m!924367 () Bool)

(assert (=> b!997586 m!924367))

(assert (=> b!997586 m!924367))

(declare-fun m!924369 () Bool)

(assert (=> b!997586 m!924369))

(assert (=> b!997585 m!924367))

(assert (=> b!997585 m!924367))

(declare-fun m!924371 () Bool)

(assert (=> b!997585 m!924371))

(assert (=> b!997585 m!924371))

(assert (=> b!997585 m!924367))

(declare-fun m!924373 () Bool)

(assert (=> b!997585 m!924373))

(declare-fun m!924375 () Bool)

(assert (=> b!997582 m!924375))

(declare-fun m!924377 () Bool)

(assert (=> b!997578 m!924377))

(declare-fun m!924379 () Bool)

(assert (=> b!997583 m!924379))

(declare-fun m!924381 () Bool)

(assert (=> b!997581 m!924381))

(declare-fun m!924383 () Bool)

(assert (=> start!86140 m!924383))

(declare-fun m!924385 () Bool)

(assert (=> start!86140 m!924385))

(assert (=> b!997584 m!924367))

(assert (=> b!997584 m!924367))

(declare-fun m!924387 () Bool)

(assert (=> b!997584 m!924387))

(check-sat (not b!997586) (not b!997583) (not b!997580) (not b!997582) (not b!997584) (not b!997585) (not b!997581) (not b!997578) (not start!86140))
(check-sat)
