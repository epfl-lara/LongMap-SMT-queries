; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86212 () Bool)

(assert start!86212)

(declare-fun b!997492 () Bool)

(declare-fun e!562846 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!997492 (= e!562846 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!997493 () Bool)

(declare-fun res!667046 () Bool)

(assert (=> b!997493 (=> (not res!667046) (not e!562846))))

(declare-datatypes ((array!63087 0))(
  ( (array!63088 (arr!30370 (Array (_ BitVec 32) (_ BitVec 64))) (size!30873 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63087)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997493 (= res!667046 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30873 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30873 a!3219))))))

(declare-fun b!997494 () Bool)

(declare-fun e!562848 () Bool)

(assert (=> b!997494 (= e!562848 e!562846)))

(declare-fun res!667047 () Bool)

(assert (=> b!997494 (=> (not res!667047) (not e!562846))))

(declare-datatypes ((SeekEntryResult!9238 0))(
  ( (MissingZero!9238 (index!39323 (_ BitVec 32))) (Found!9238 (index!39324 (_ BitVec 32))) (Intermediate!9238 (undefined!10050 Bool) (index!39325 (_ BitVec 32)) (x!86912 (_ BitVec 32))) (Undefined!9238) (MissingVacant!9238 (index!39326 (_ BitVec 32))) )
))
(declare-fun lt!441626 () SeekEntryResult!9238)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997494 (= res!667047 (or (= lt!441626 (MissingVacant!9238 i!1194)) (= lt!441626 (MissingZero!9238 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63087 (_ BitVec 32)) SeekEntryResult!9238)

(assert (=> b!997494 (= lt!441626 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997495 () Bool)

(declare-fun res!667048 () Bool)

(assert (=> b!997495 (=> (not res!667048) (not e!562848))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997495 (= res!667048 (validKeyInArray!0 (select (arr!30370 a!3219) j!170)))))

(declare-fun b!997497 () Bool)

(declare-fun res!667045 () Bool)

(assert (=> b!997497 (=> (not res!667045) (not e!562848))))

(declare-fun arrayContainsKey!0 (array!63087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997497 (= res!667045 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997498 () Bool)

(declare-fun res!667049 () Bool)

(assert (=> b!997498 (=> (not res!667049) (not e!562846))))

(declare-datatypes ((List!21017 0))(
  ( (Nil!21014) (Cons!21013 (h!22184 (_ BitVec 64)) (t!30010 List!21017)) )
))
(declare-fun arrayNoDuplicates!0 (array!63087 (_ BitVec 32) List!21017) Bool)

(assert (=> b!997498 (= res!667049 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21014))))

(declare-fun b!997499 () Bool)

(declare-fun res!667042 () Bool)

(assert (=> b!997499 (=> (not res!667042) (not e!562848))))

(assert (=> b!997499 (= res!667042 (validKeyInArray!0 k0!2224))))

(declare-fun b!997500 () Bool)

(declare-fun res!667040 () Bool)

(assert (=> b!997500 (=> (not res!667040) (not e!562846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63087 (_ BitVec 32)) Bool)

(assert (=> b!997500 (= res!667040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997501 () Bool)

(declare-fun res!667043 () Bool)

(assert (=> b!997501 (=> (not res!667043) (not e!562848))))

(assert (=> b!997501 (= res!667043 (and (= (size!30873 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30873 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30873 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997496 () Bool)

(declare-fun res!667044 () Bool)

(assert (=> b!997496 (=> (not res!667044) (not e!562846))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63087 (_ BitVec 32)) SeekEntryResult!9238)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997496 (= res!667044 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30370 a!3219) j!170) mask!3464) (select (arr!30370 a!3219) j!170) a!3219 mask!3464) (Intermediate!9238 false resIndex!38 resX!38)))))

(declare-fun res!667041 () Bool)

(assert (=> start!86212 (=> (not res!667041) (not e!562848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86212 (= res!667041 (validMask!0 mask!3464))))

(assert (=> start!86212 e!562848))

(declare-fun array_inv!23506 (array!63087) Bool)

(assert (=> start!86212 (array_inv!23506 a!3219)))

(assert (=> start!86212 true))

(assert (= (and start!86212 res!667041) b!997501))

(assert (= (and b!997501 res!667043) b!997495))

(assert (= (and b!997495 res!667048) b!997499))

(assert (= (and b!997499 res!667042) b!997497))

(assert (= (and b!997497 res!667045) b!997494))

(assert (= (and b!997494 res!667047) b!997500))

(assert (= (and b!997500 res!667040) b!997498))

(assert (= (and b!997498 res!667049) b!997493))

(assert (= (and b!997493 res!667046) b!997496))

(assert (= (and b!997496 res!667044) b!997492))

(declare-fun m!924989 () Bool)

(assert (=> b!997499 m!924989))

(declare-fun m!924991 () Bool)

(assert (=> b!997500 m!924991))

(declare-fun m!924993 () Bool)

(assert (=> b!997495 m!924993))

(assert (=> b!997495 m!924993))

(declare-fun m!924995 () Bool)

(assert (=> b!997495 m!924995))

(declare-fun m!924997 () Bool)

(assert (=> start!86212 m!924997))

(declare-fun m!924999 () Bool)

(assert (=> start!86212 m!924999))

(declare-fun m!925001 () Bool)

(assert (=> b!997494 m!925001))

(assert (=> b!997496 m!924993))

(assert (=> b!997496 m!924993))

(declare-fun m!925003 () Bool)

(assert (=> b!997496 m!925003))

(assert (=> b!997496 m!925003))

(assert (=> b!997496 m!924993))

(declare-fun m!925005 () Bool)

(assert (=> b!997496 m!925005))

(declare-fun m!925007 () Bool)

(assert (=> b!997497 m!925007))

(declare-fun m!925009 () Bool)

(assert (=> b!997498 m!925009))

(check-sat (not b!997500) (not b!997495) (not b!997496) (not b!997499) (not b!997497) (not b!997498) (not b!997494) (not start!86212))
(check-sat)
