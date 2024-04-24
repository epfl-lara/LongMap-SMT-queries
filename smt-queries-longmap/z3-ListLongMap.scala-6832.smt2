; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86206 () Bool)

(assert start!86206)

(declare-fun b!997409 () Bool)

(declare-fun res!666964 () Bool)

(declare-fun e!562819 () Bool)

(assert (=> b!997409 (=> (not res!666964) (not e!562819))))

(declare-datatypes ((array!63081 0))(
  ( (array!63082 (arr!30367 (Array (_ BitVec 32) (_ BitVec 64))) (size!30870 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63081)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997409 (= res!666964 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30870 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30870 a!3219))))))

(declare-fun b!997410 () Bool)

(declare-fun res!666963 () Bool)

(declare-fun e!562820 () Bool)

(assert (=> b!997410 (=> (not res!666963) (not e!562820))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997410 (= res!666963 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997411 () Bool)

(declare-fun res!666959 () Bool)

(assert (=> b!997411 (=> (not res!666959) (not e!562820))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997411 (= res!666959 (and (= (size!30870 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30870 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30870 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997412 () Bool)

(declare-fun res!666965 () Bool)

(assert (=> b!997412 (=> (not res!666965) (not e!562819))))

(declare-datatypes ((List!21014 0))(
  ( (Nil!21011) (Cons!21010 (h!22181 (_ BitVec 64)) (t!30007 List!21014)) )
))
(declare-fun arrayNoDuplicates!0 (array!63081 (_ BitVec 32) List!21014) Bool)

(assert (=> b!997412 (= res!666965 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21011))))

(declare-fun b!997413 () Bool)

(declare-fun res!666961 () Bool)

(assert (=> b!997413 (=> (not res!666961) (not e!562819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63081 (_ BitVec 32)) Bool)

(assert (=> b!997413 (= res!666961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997415 () Bool)

(declare-fun res!666962 () Bool)

(assert (=> b!997415 (=> (not res!666962) (not e!562820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997415 (= res!666962 (validKeyInArray!0 k0!2224))))

(declare-fun b!997416 () Bool)

(assert (=> b!997416 (= e!562820 e!562819)))

(declare-fun res!666958 () Bool)

(assert (=> b!997416 (=> (not res!666958) (not e!562819))))

(declare-datatypes ((SeekEntryResult!9235 0))(
  ( (MissingZero!9235 (index!39311 (_ BitVec 32))) (Found!9235 (index!39312 (_ BitVec 32))) (Intermediate!9235 (undefined!10047 Bool) (index!39313 (_ BitVec 32)) (x!86901 (_ BitVec 32))) (Undefined!9235) (MissingVacant!9235 (index!39314 (_ BitVec 32))) )
))
(declare-fun lt!441611 () SeekEntryResult!9235)

(assert (=> b!997416 (= res!666958 (or (= lt!441611 (MissingVacant!9235 i!1194)) (= lt!441611 (MissingZero!9235 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63081 (_ BitVec 32)) SeekEntryResult!9235)

(assert (=> b!997416 (= lt!441611 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997417 () Bool)

(assert (=> b!997417 (= e!562819 false)))

(declare-fun lt!441610 () SeekEntryResult!9235)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63081 (_ BitVec 32)) SeekEntryResult!9235)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997417 (= lt!441610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30367 a!3219) j!170) mask!3464) (select (arr!30367 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!666957 () Bool)

(assert (=> start!86206 (=> (not res!666957) (not e!562820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86206 (= res!666957 (validMask!0 mask!3464))))

(assert (=> start!86206 e!562820))

(declare-fun array_inv!23503 (array!63081) Bool)

(assert (=> start!86206 (array_inv!23503 a!3219)))

(assert (=> start!86206 true))

(declare-fun b!997414 () Bool)

(declare-fun res!666960 () Bool)

(assert (=> b!997414 (=> (not res!666960) (not e!562820))))

(assert (=> b!997414 (= res!666960 (validKeyInArray!0 (select (arr!30367 a!3219) j!170)))))

(assert (= (and start!86206 res!666957) b!997411))

(assert (= (and b!997411 res!666959) b!997414))

(assert (= (and b!997414 res!666960) b!997415))

(assert (= (and b!997415 res!666962) b!997410))

(assert (= (and b!997410 res!666963) b!997416))

(assert (= (and b!997416 res!666958) b!997413))

(assert (= (and b!997413 res!666961) b!997412))

(assert (= (and b!997412 res!666965) b!997409))

(assert (= (and b!997409 res!666964) b!997417))

(declare-fun m!924923 () Bool)

(assert (=> b!997417 m!924923))

(assert (=> b!997417 m!924923))

(declare-fun m!924925 () Bool)

(assert (=> b!997417 m!924925))

(assert (=> b!997417 m!924925))

(assert (=> b!997417 m!924923))

(declare-fun m!924927 () Bool)

(assert (=> b!997417 m!924927))

(declare-fun m!924929 () Bool)

(assert (=> b!997410 m!924929))

(declare-fun m!924931 () Bool)

(assert (=> b!997416 m!924931))

(declare-fun m!924933 () Bool)

(assert (=> start!86206 m!924933))

(declare-fun m!924935 () Bool)

(assert (=> start!86206 m!924935))

(declare-fun m!924937 () Bool)

(assert (=> b!997413 m!924937))

(declare-fun m!924939 () Bool)

(assert (=> b!997415 m!924939))

(assert (=> b!997414 m!924923))

(assert (=> b!997414 m!924923))

(declare-fun m!924941 () Bool)

(assert (=> b!997414 m!924941))

(declare-fun m!924943 () Bool)

(assert (=> b!997412 m!924943))

(check-sat (not b!997413) (not b!997410) (not b!997414) (not b!997416) (not start!86206) (not b!997417) (not b!997412) (not b!997415))
(check-sat)
