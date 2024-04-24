; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86230 () Bool)

(assert start!86230)

(declare-fun b!997753 () Bool)

(declare-fun res!667309 () Bool)

(declare-fun e!562927 () Bool)

(assert (=> b!997753 (=> (not res!667309) (not e!562927))))

(declare-datatypes ((array!63105 0))(
  ( (array!63106 (arr!30379 (Array (_ BitVec 32) (_ BitVec 64))) (size!30882 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63105)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997753 (= res!667309 (validKeyInArray!0 (select (arr!30379 a!3219) j!170)))))

(declare-fun b!997754 () Bool)

(declare-fun res!667302 () Bool)

(declare-fun e!562928 () Bool)

(assert (=> b!997754 (=> (not res!667302) (not e!562928))))

(declare-datatypes ((List!21026 0))(
  ( (Nil!21023) (Cons!21022 (h!22193 (_ BitVec 64)) (t!30019 List!21026)) )
))
(declare-fun arrayNoDuplicates!0 (array!63105 (_ BitVec 32) List!21026) Bool)

(assert (=> b!997754 (= res!667302 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21023))))

(declare-fun b!997755 () Bool)

(assert (=> b!997755 (= e!562927 e!562928)))

(declare-fun res!667301 () Bool)

(assert (=> b!997755 (=> (not res!667301) (not e!562928))))

(declare-datatypes ((SeekEntryResult!9247 0))(
  ( (MissingZero!9247 (index!39359 (_ BitVec 32))) (Found!9247 (index!39360 (_ BitVec 32))) (Intermediate!9247 (undefined!10059 Bool) (index!39361 (_ BitVec 32)) (x!86945 (_ BitVec 32))) (Undefined!9247) (MissingVacant!9247 (index!39362 (_ BitVec 32))) )
))
(declare-fun lt!441662 () SeekEntryResult!9247)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997755 (= res!667301 (or (= lt!441662 (MissingVacant!9247 i!1194)) (= lt!441662 (MissingZero!9247 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63105 (_ BitVec 32)) SeekEntryResult!9247)

(assert (=> b!997755 (= lt!441662 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!667307 () Bool)

(assert (=> start!86230 (=> (not res!667307) (not e!562927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86230 (= res!667307 (validMask!0 mask!3464))))

(assert (=> start!86230 e!562927))

(declare-fun array_inv!23515 (array!63105) Bool)

(assert (=> start!86230 (array_inv!23515 a!3219)))

(assert (=> start!86230 true))

(declare-fun b!997756 () Bool)

(declare-fun res!667310 () Bool)

(assert (=> b!997756 (=> (not res!667310) (not e!562927))))

(declare-fun arrayContainsKey!0 (array!63105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997756 (= res!667310 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997757 () Bool)

(declare-fun res!667303 () Bool)

(assert (=> b!997757 (=> (not res!667303) (not e!562928))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997757 (= res!667303 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30882 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30882 a!3219))))))

(declare-fun b!997758 () Bool)

(declare-fun res!667306 () Bool)

(assert (=> b!997758 (=> (not res!667306) (not e!562927))))

(assert (=> b!997758 (= res!667306 (validKeyInArray!0 k0!2224))))

(declare-fun b!997759 () Bool)

(declare-fun res!667304 () Bool)

(assert (=> b!997759 (=> (not res!667304) (not e!562928))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63105 (_ BitVec 32)) SeekEntryResult!9247)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997759 (= res!667304 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30379 a!3219) j!170) mask!3464) (select (arr!30379 a!3219) j!170) a!3219 mask!3464) (Intermediate!9247 false resIndex!38 resX!38)))))

(declare-fun b!997760 () Bool)

(declare-fun res!667305 () Bool)

(assert (=> b!997760 (=> (not res!667305) (not e!562928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63105 (_ BitVec 32)) Bool)

(assert (=> b!997760 (= res!667305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997761 () Bool)

(assert (=> b!997761 (= e!562928 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!997762 () Bool)

(declare-fun res!667308 () Bool)

(assert (=> b!997762 (=> (not res!667308) (not e!562927))))

(assert (=> b!997762 (= res!667308 (and (= (size!30882 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30882 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30882 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86230 res!667307) b!997762))

(assert (= (and b!997762 res!667308) b!997753))

(assert (= (and b!997753 res!667309) b!997758))

(assert (= (and b!997758 res!667306) b!997756))

(assert (= (and b!997756 res!667310) b!997755))

(assert (= (and b!997755 res!667301) b!997760))

(assert (= (and b!997760 res!667305) b!997754))

(assert (= (and b!997754 res!667302) b!997757))

(assert (= (and b!997757 res!667303) b!997759))

(assert (= (and b!997759 res!667304) b!997761))

(declare-fun m!925187 () Bool)

(assert (=> b!997756 m!925187))

(declare-fun m!925189 () Bool)

(assert (=> b!997758 m!925189))

(declare-fun m!925191 () Bool)

(assert (=> b!997753 m!925191))

(assert (=> b!997753 m!925191))

(declare-fun m!925193 () Bool)

(assert (=> b!997753 m!925193))

(declare-fun m!925195 () Bool)

(assert (=> b!997755 m!925195))

(assert (=> b!997759 m!925191))

(assert (=> b!997759 m!925191))

(declare-fun m!925197 () Bool)

(assert (=> b!997759 m!925197))

(assert (=> b!997759 m!925197))

(assert (=> b!997759 m!925191))

(declare-fun m!925199 () Bool)

(assert (=> b!997759 m!925199))

(declare-fun m!925201 () Bool)

(assert (=> start!86230 m!925201))

(declare-fun m!925203 () Bool)

(assert (=> start!86230 m!925203))

(declare-fun m!925205 () Bool)

(assert (=> b!997760 m!925205))

(declare-fun m!925207 () Bool)

(assert (=> b!997754 m!925207))

(check-sat (not b!997759) (not b!997756) (not start!86230) (not b!997753) (not b!997760) (not b!997754) (not b!997758) (not b!997755))
(check-sat)
