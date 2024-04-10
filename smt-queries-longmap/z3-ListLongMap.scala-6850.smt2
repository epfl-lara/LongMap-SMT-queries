; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86302 () Bool)

(assert start!86302)

(declare-fun b!998963 () Bool)

(declare-fun res!668609 () Bool)

(declare-fun e!563291 () Bool)

(assert (=> b!998963 (=> (not res!668609) (not e!563291))))

(declare-datatypes ((array!63154 0))(
  ( (array!63155 (arr!30404 (Array (_ BitVec 32) (_ BitVec 64))) (size!30906 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63154)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9336 0))(
  ( (MissingZero!9336 (index!39715 (_ BitVec 32))) (Found!9336 (index!39716 (_ BitVec 32))) (Intermediate!9336 (undefined!10148 Bool) (index!39717 (_ BitVec 32)) (x!87150 (_ BitVec 32))) (Undefined!9336) (MissingVacant!9336 (index!39718 (_ BitVec 32))) )
))
(declare-fun lt!441868 () SeekEntryResult!9336)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63154 (_ BitVec 32)) SeekEntryResult!9336)

(assert (=> b!998963 (= res!668609 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30404 a!3219) j!170) a!3219 mask!3464) lt!441868))))

(declare-fun res!668606 () Bool)

(declare-fun e!563292 () Bool)

(assert (=> start!86302 (=> (not res!668606) (not e!563292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86302 (= res!668606 (validMask!0 mask!3464))))

(assert (=> start!86302 e!563292))

(declare-fun array_inv!23528 (array!63154) Bool)

(assert (=> start!86302 (array_inv!23528 a!3219)))

(assert (=> start!86302 true))

(declare-fun b!998964 () Bool)

(assert (=> b!998964 (= e!563291 false)))

(declare-fun lt!441869 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998964 (= lt!441869 (toIndex!0 (select (store (arr!30404 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!998965 () Bool)

(declare-fun res!668607 () Bool)

(assert (=> b!998965 (=> (not res!668607) (not e!563292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998965 (= res!668607 (validKeyInArray!0 (select (arr!30404 a!3219) j!170)))))

(declare-fun b!998966 () Bool)

(declare-fun res!668604 () Bool)

(assert (=> b!998966 (=> (not res!668604) (not e!563292))))

(declare-fun arrayContainsKey!0 (array!63154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998966 (= res!668604 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998967 () Bool)

(declare-fun res!668601 () Bool)

(assert (=> b!998967 (=> (not res!668601) (not e!563292))))

(assert (=> b!998967 (= res!668601 (validKeyInArray!0 k0!2224))))

(declare-fun b!998968 () Bool)

(declare-fun e!563293 () Bool)

(assert (=> b!998968 (= e!563292 e!563293)))

(declare-fun res!668602 () Bool)

(assert (=> b!998968 (=> (not res!668602) (not e!563293))))

(declare-fun lt!441867 () SeekEntryResult!9336)

(assert (=> b!998968 (= res!668602 (or (= lt!441867 (MissingVacant!9336 i!1194)) (= lt!441867 (MissingZero!9336 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63154 (_ BitVec 32)) SeekEntryResult!9336)

(assert (=> b!998968 (= lt!441867 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998969 () Bool)

(assert (=> b!998969 (= e!563293 e!563291)))

(declare-fun res!668603 () Bool)

(assert (=> b!998969 (=> (not res!668603) (not e!563291))))

(assert (=> b!998969 (= res!668603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30404 a!3219) j!170) mask!3464) (select (arr!30404 a!3219) j!170) a!3219 mask!3464) lt!441868))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998969 (= lt!441868 (Intermediate!9336 false resIndex!38 resX!38))))

(declare-fun b!998970 () Bool)

(declare-fun res!668608 () Bool)

(assert (=> b!998970 (=> (not res!668608) (not e!563293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63154 (_ BitVec 32)) Bool)

(assert (=> b!998970 (= res!668608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998971 () Bool)

(declare-fun res!668600 () Bool)

(assert (=> b!998971 (=> (not res!668600) (not e!563293))))

(declare-datatypes ((List!21080 0))(
  ( (Nil!21077) (Cons!21076 (h!22250 (_ BitVec 64)) (t!30081 List!21080)) )
))
(declare-fun arrayNoDuplicates!0 (array!63154 (_ BitVec 32) List!21080) Bool)

(assert (=> b!998971 (= res!668600 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21077))))

(declare-fun b!998972 () Bool)

(declare-fun res!668605 () Bool)

(assert (=> b!998972 (=> (not res!668605) (not e!563293))))

(assert (=> b!998972 (= res!668605 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30906 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30906 a!3219))))))

(declare-fun b!998973 () Bool)

(declare-fun res!668610 () Bool)

(assert (=> b!998973 (=> (not res!668610) (not e!563292))))

(assert (=> b!998973 (= res!668610 (and (= (size!30906 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30906 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30906 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86302 res!668606) b!998973))

(assert (= (and b!998973 res!668610) b!998965))

(assert (= (and b!998965 res!668607) b!998967))

(assert (= (and b!998967 res!668601) b!998966))

(assert (= (and b!998966 res!668604) b!998968))

(assert (= (and b!998968 res!668602) b!998970))

(assert (= (and b!998970 res!668608) b!998971))

(assert (= (and b!998971 res!668600) b!998972))

(assert (= (and b!998972 res!668605) b!998969))

(assert (= (and b!998969 res!668603) b!998963))

(assert (= (and b!998963 res!668609) b!998964))

(declare-fun m!925343 () Bool)

(assert (=> b!998967 m!925343))

(declare-fun m!925345 () Bool)

(assert (=> b!998964 m!925345))

(declare-fun m!925347 () Bool)

(assert (=> b!998964 m!925347))

(assert (=> b!998964 m!925347))

(declare-fun m!925349 () Bool)

(assert (=> b!998964 m!925349))

(declare-fun m!925351 () Bool)

(assert (=> b!998971 m!925351))

(declare-fun m!925353 () Bool)

(assert (=> b!998970 m!925353))

(declare-fun m!925355 () Bool)

(assert (=> start!86302 m!925355))

(declare-fun m!925357 () Bool)

(assert (=> start!86302 m!925357))

(declare-fun m!925359 () Bool)

(assert (=> b!998969 m!925359))

(assert (=> b!998969 m!925359))

(declare-fun m!925361 () Bool)

(assert (=> b!998969 m!925361))

(assert (=> b!998969 m!925361))

(assert (=> b!998969 m!925359))

(declare-fun m!925363 () Bool)

(assert (=> b!998969 m!925363))

(declare-fun m!925365 () Bool)

(assert (=> b!998968 m!925365))

(assert (=> b!998963 m!925359))

(assert (=> b!998963 m!925359))

(declare-fun m!925367 () Bool)

(assert (=> b!998963 m!925367))

(assert (=> b!998965 m!925359))

(assert (=> b!998965 m!925359))

(declare-fun m!925369 () Bool)

(assert (=> b!998965 m!925369))

(declare-fun m!925371 () Bool)

(assert (=> b!998966 m!925371))

(check-sat (not start!86302) (not b!998970) (not b!998964) (not b!998966) (not b!998971) (not b!998968) (not b!998965) (not b!998963) (not b!998969) (not b!998967))
