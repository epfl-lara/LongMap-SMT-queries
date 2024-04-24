; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86236 () Bool)

(assert start!86236)

(declare-fun b!997841 () Bool)

(declare-fun res!667397 () Bool)

(declare-fun e!562955 () Bool)

(assert (=> b!997841 (=> (not res!667397) (not e!562955))))

(declare-datatypes ((array!63111 0))(
  ( (array!63112 (arr!30382 (Array (_ BitVec 32) (_ BitVec 64))) (size!30885 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63111)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997841 (= res!667397 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997842 () Bool)

(declare-fun res!667389 () Bool)

(declare-fun e!562956 () Bool)

(assert (=> b!997842 (=> (not res!667389) (not e!562956))))

(declare-datatypes ((List!21029 0))(
  ( (Nil!21026) (Cons!21025 (h!22196 (_ BitVec 64)) (t!30022 List!21029)) )
))
(declare-fun arrayNoDuplicates!0 (array!63111 (_ BitVec 32) List!21029) Bool)

(assert (=> b!997842 (= res!667389 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21026))))

(declare-fun b!997843 () Bool)

(declare-fun res!667395 () Bool)

(assert (=> b!997843 (=> (not res!667395) (not e!562956))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!997843 (= res!667395 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30885 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30885 a!3219))))))

(declare-fun b!997844 () Bool)

(assert (=> b!997844 (= e!562955 e!562956)))

(declare-fun res!667392 () Bool)

(assert (=> b!997844 (=> (not res!667392) (not e!562956))))

(declare-datatypes ((SeekEntryResult!9250 0))(
  ( (MissingZero!9250 (index!39371 (_ BitVec 32))) (Found!9250 (index!39372 (_ BitVec 32))) (Intermediate!9250 (undefined!10062 Bool) (index!39373 (_ BitVec 32)) (x!86956 (_ BitVec 32))) (Undefined!9250) (MissingVacant!9250 (index!39374 (_ BitVec 32))) )
))
(declare-fun lt!441674 () SeekEntryResult!9250)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997844 (= res!667392 (or (= lt!441674 (MissingVacant!9250 i!1194)) (= lt!441674 (MissingZero!9250 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63111 (_ BitVec 32)) SeekEntryResult!9250)

(assert (=> b!997844 (= lt!441674 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997846 () Bool)

(assert (=> b!997846 (= e!562956 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441673 () SeekEntryResult!9250)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63111 (_ BitVec 32)) SeekEntryResult!9250)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997846 (= lt!441673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30382 a!3219) j!170) mask!3464) (select (arr!30382 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997847 () Bool)

(declare-fun res!667393 () Bool)

(assert (=> b!997847 (=> (not res!667393) (not e!562955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997847 (= res!667393 (validKeyInArray!0 k0!2224))))

(declare-fun b!997848 () Bool)

(declare-fun res!667390 () Bool)

(assert (=> b!997848 (=> (not res!667390) (not e!562956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63111 (_ BitVec 32)) Bool)

(assert (=> b!997848 (= res!667390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997849 () Bool)

(declare-fun res!667396 () Bool)

(assert (=> b!997849 (=> (not res!667396) (not e!562955))))

(assert (=> b!997849 (= res!667396 (and (= (size!30885 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30885 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30885 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!667394 () Bool)

(assert (=> start!86236 (=> (not res!667394) (not e!562955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86236 (= res!667394 (validMask!0 mask!3464))))

(assert (=> start!86236 e!562955))

(declare-fun array_inv!23518 (array!63111) Bool)

(assert (=> start!86236 (array_inv!23518 a!3219)))

(assert (=> start!86236 true))

(declare-fun b!997845 () Bool)

(declare-fun res!667391 () Bool)

(assert (=> b!997845 (=> (not res!667391) (not e!562955))))

(assert (=> b!997845 (= res!667391 (validKeyInArray!0 (select (arr!30382 a!3219) j!170)))))

(assert (= (and start!86236 res!667394) b!997849))

(assert (= (and b!997849 res!667396) b!997845))

(assert (= (and b!997845 res!667391) b!997847))

(assert (= (and b!997847 res!667393) b!997841))

(assert (= (and b!997841 res!667397) b!997844))

(assert (= (and b!997844 res!667392) b!997848))

(assert (= (and b!997848 res!667390) b!997842))

(assert (= (and b!997842 res!667389) b!997843))

(assert (= (and b!997843 res!667395) b!997846))

(declare-fun m!925253 () Bool)

(assert (=> b!997845 m!925253))

(assert (=> b!997845 m!925253))

(declare-fun m!925255 () Bool)

(assert (=> b!997845 m!925255))

(declare-fun m!925257 () Bool)

(assert (=> b!997848 m!925257))

(assert (=> b!997846 m!925253))

(assert (=> b!997846 m!925253))

(declare-fun m!925259 () Bool)

(assert (=> b!997846 m!925259))

(assert (=> b!997846 m!925259))

(assert (=> b!997846 m!925253))

(declare-fun m!925261 () Bool)

(assert (=> b!997846 m!925261))

(declare-fun m!925263 () Bool)

(assert (=> b!997847 m!925263))

(declare-fun m!925265 () Bool)

(assert (=> start!86236 m!925265))

(declare-fun m!925267 () Bool)

(assert (=> start!86236 m!925267))

(declare-fun m!925269 () Bool)

(assert (=> b!997841 m!925269))

(declare-fun m!925271 () Bool)

(assert (=> b!997842 m!925271))

(declare-fun m!925273 () Bool)

(assert (=> b!997844 m!925273))

(check-sat (not b!997846) (not b!997844) (not b!997845) (not b!997848) (not b!997841) (not start!86236) (not b!997842) (not b!997847))
(check-sat)
