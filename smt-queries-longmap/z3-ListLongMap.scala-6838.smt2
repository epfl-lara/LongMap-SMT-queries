; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86242 () Bool)

(assert start!86242)

(declare-fun b!997926 () Bool)

(declare-fun res!667475 () Bool)

(declare-fun e!562983 () Bool)

(assert (=> b!997926 (=> (not res!667475) (not e!562983))))

(declare-datatypes ((array!63117 0))(
  ( (array!63118 (arr!30385 (Array (_ BitVec 32) (_ BitVec 64))) (size!30888 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63117)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63117 (_ BitVec 32)) Bool)

(assert (=> b!997926 (= res!667475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997927 () Bool)

(declare-fun res!667482 () Bool)

(declare-fun e!562986 () Bool)

(assert (=> b!997927 (=> (not res!667482) (not e!562986))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997927 (= res!667482 (validKeyInArray!0 (select (arr!30385 a!3219) j!170)))))

(declare-fun b!997928 () Bool)

(declare-fun res!667474 () Bool)

(declare-fun e!562985 () Bool)

(assert (=> b!997928 (=> (not res!667474) (not e!562985))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9253 0))(
  ( (MissingZero!9253 (index!39383 (_ BitVec 32))) (Found!9253 (index!39384 (_ BitVec 32))) (Intermediate!9253 (undefined!10065 Bool) (index!39385 (_ BitVec 32)) (x!86967 (_ BitVec 32))) (Undefined!9253) (MissingVacant!9253 (index!39386 (_ BitVec 32))) )
))
(declare-fun lt!441691 () SeekEntryResult!9253)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63117 (_ BitVec 32)) SeekEntryResult!9253)

(assert (=> b!997928 (= res!667474 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30385 a!3219) j!170) a!3219 mask!3464) lt!441691))))

(declare-fun b!997929 () Bool)

(assert (=> b!997929 (= e!562983 e!562985)))

(declare-fun res!667483 () Bool)

(assert (=> b!997929 (=> (not res!667483) (not e!562985))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997929 (= res!667483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30385 a!3219) j!170) mask!3464) (select (arr!30385 a!3219) j!170) a!3219 mask!3464) lt!441691))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997929 (= lt!441691 (Intermediate!9253 false resIndex!38 resX!38))))

(declare-fun b!997930 () Bool)

(declare-fun res!667477 () Bool)

(assert (=> b!997930 (=> (not res!667477) (not e!562986))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!997930 (= res!667477 (validKeyInArray!0 k0!2224))))

(declare-fun res!667480 () Bool)

(assert (=> start!86242 (=> (not res!667480) (not e!562986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86242 (= res!667480 (validMask!0 mask!3464))))

(assert (=> start!86242 e!562986))

(declare-fun array_inv!23521 (array!63117) Bool)

(assert (=> start!86242 (array_inv!23521 a!3219)))

(assert (=> start!86242 true))

(declare-fun b!997931 () Bool)

(declare-fun res!667479 () Bool)

(assert (=> b!997931 (=> (not res!667479) (not e!562986))))

(declare-fun arrayContainsKey!0 (array!63117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997931 (= res!667479 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997932 () Bool)

(declare-fun res!667484 () Bool)

(assert (=> b!997932 (=> (not res!667484) (not e!562986))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997932 (= res!667484 (and (= (size!30888 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30888 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30888 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997933 () Bool)

(assert (=> b!997933 (= e!562986 e!562983)))

(declare-fun res!667478 () Bool)

(assert (=> b!997933 (=> (not res!667478) (not e!562983))))

(declare-fun lt!441692 () SeekEntryResult!9253)

(assert (=> b!997933 (= res!667478 (or (= lt!441692 (MissingVacant!9253 i!1194)) (= lt!441692 (MissingZero!9253 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63117 (_ BitVec 32)) SeekEntryResult!9253)

(assert (=> b!997933 (= lt!441692 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997934 () Bool)

(declare-fun res!667476 () Bool)

(assert (=> b!997934 (=> (not res!667476) (not e!562983))))

(declare-datatypes ((List!21032 0))(
  ( (Nil!21029) (Cons!21028 (h!22199 (_ BitVec 64)) (t!30025 List!21032)) )
))
(declare-fun arrayNoDuplicates!0 (array!63117 (_ BitVec 32) List!21032) Bool)

(assert (=> b!997934 (= res!667476 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21029))))

(declare-fun b!997935 () Bool)

(declare-fun res!667481 () Bool)

(assert (=> b!997935 (=> (not res!667481) (not e!562983))))

(assert (=> b!997935 (= res!667481 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30888 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30888 a!3219))))))

(declare-fun b!997936 () Bool)

(assert (=> b!997936 (= e!562985 (bvslt mask!3464 #b00000000000000000000000000000000))))

(assert (= (and start!86242 res!667480) b!997932))

(assert (= (and b!997932 res!667484) b!997927))

(assert (= (and b!997927 res!667482) b!997930))

(assert (= (and b!997930 res!667477) b!997931))

(assert (= (and b!997931 res!667479) b!997933))

(assert (= (and b!997933 res!667478) b!997926))

(assert (= (and b!997926 res!667475) b!997934))

(assert (= (and b!997934 res!667476) b!997935))

(assert (= (and b!997935 res!667481) b!997929))

(assert (= (and b!997929 res!667483) b!997928))

(assert (= (and b!997928 res!667474) b!997936))

(declare-fun m!925319 () Bool)

(assert (=> b!997934 m!925319))

(declare-fun m!925321 () Bool)

(assert (=> b!997926 m!925321))

(declare-fun m!925323 () Bool)

(assert (=> b!997933 m!925323))

(declare-fun m!925325 () Bool)

(assert (=> b!997931 m!925325))

(declare-fun m!925327 () Bool)

(assert (=> start!86242 m!925327))

(declare-fun m!925329 () Bool)

(assert (=> start!86242 m!925329))

(declare-fun m!925331 () Bool)

(assert (=> b!997929 m!925331))

(assert (=> b!997929 m!925331))

(declare-fun m!925333 () Bool)

(assert (=> b!997929 m!925333))

(assert (=> b!997929 m!925333))

(assert (=> b!997929 m!925331))

(declare-fun m!925335 () Bool)

(assert (=> b!997929 m!925335))

(assert (=> b!997928 m!925331))

(assert (=> b!997928 m!925331))

(declare-fun m!925337 () Bool)

(assert (=> b!997928 m!925337))

(assert (=> b!997927 m!925331))

(assert (=> b!997927 m!925331))

(declare-fun m!925339 () Bool)

(assert (=> b!997927 m!925339))

(declare-fun m!925341 () Bool)

(assert (=> b!997930 m!925341))

(check-sat (not b!997934) (not b!997933) (not b!997931) (not start!86242) (not b!997929) (not b!997927) (not b!997928) (not b!997926) (not b!997930))
(check-sat)
