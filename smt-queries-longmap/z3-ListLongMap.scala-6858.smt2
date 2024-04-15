; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86394 () Bool)

(assert start!86394)

(declare-fun b!999794 () Bool)

(declare-fun res!669405 () Bool)

(declare-fun e!563612 () Bool)

(assert (=> b!999794 (=> (not res!669405) (not e!563612))))

(declare-datatypes ((array!63142 0))(
  ( (array!63143 (arr!30396 (Array (_ BitVec 32) (_ BitVec 64))) (size!30900 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63142)

(declare-datatypes ((List!21138 0))(
  ( (Nil!21135) (Cons!21134 (h!22311 (_ BitVec 64)) (t!30130 List!21138)) )
))
(declare-fun arrayNoDuplicates!0 (array!63142 (_ BitVec 32) List!21138) Bool)

(assert (=> b!999794 (= res!669405 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21135))))

(declare-fun b!999795 () Bool)

(declare-fun res!669396 () Bool)

(declare-fun e!563613 () Bool)

(assert (=> b!999795 (=> (not res!669396) (not e!563613))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999795 (= res!669396 (validKeyInArray!0 (select (arr!30396 a!3219) j!170)))))

(declare-fun b!999796 () Bool)

(declare-fun res!669401 () Bool)

(assert (=> b!999796 (=> (not res!669401) (not e!563612))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63142 (_ BitVec 32)) Bool)

(assert (=> b!999796 (= res!669401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999797 () Bool)

(assert (=> b!999797 (= e!563613 e!563612)))

(declare-fun res!669406 () Bool)

(assert (=> b!999797 (=> (not res!669406) (not e!563612))))

(declare-datatypes ((SeekEntryResult!9353 0))(
  ( (MissingZero!9353 (index!39783 (_ BitVec 32))) (Found!9353 (index!39784 (_ BitVec 32))) (Intermediate!9353 (undefined!10165 Bool) (index!39785 (_ BitVec 32)) (x!87232 (_ BitVec 32))) (Undefined!9353) (MissingVacant!9353 (index!39786 (_ BitVec 32))) )
))
(declare-fun lt!441946 () SeekEntryResult!9353)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999797 (= res!669406 (or (= lt!441946 (MissingVacant!9353 i!1194)) (= lt!441946 (MissingZero!9353 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63142 (_ BitVec 32)) SeekEntryResult!9353)

(assert (=> b!999797 (= lt!441946 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999798 () Bool)

(declare-fun res!669407 () Bool)

(declare-fun e!563614 () Bool)

(assert (=> b!999798 (=> (not res!669407) (not e!563614))))

(declare-fun lt!441945 () SeekEntryResult!9353)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63142 (_ BitVec 32)) SeekEntryResult!9353)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999798 (= res!669407 (not (= lt!441945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30396 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30396 a!3219) i!1194 k0!2224) j!170) (array!63143 (store (arr!30396 a!3219) i!1194 k0!2224) (size!30900 a!3219)) mask!3464))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun b!999799 () Bool)

(assert (=> b!999799 (= e!563614 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!999800 () Bool)

(declare-fun res!669404 () Bool)

(assert (=> b!999800 (=> (not res!669404) (not e!563613))))

(assert (=> b!999800 (= res!669404 (validKeyInArray!0 k0!2224))))

(declare-fun b!999801 () Bool)

(assert (=> b!999801 (= e!563612 e!563614)))

(declare-fun res!669398 () Bool)

(assert (=> b!999801 (=> (not res!669398) (not e!563614))))

(declare-fun lt!441944 () SeekEntryResult!9353)

(assert (=> b!999801 (= res!669398 (= lt!441945 lt!441944))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999801 (= lt!441944 (Intermediate!9353 false resIndex!38 resX!38))))

(assert (=> b!999801 (= lt!441945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30396 a!3219) j!170) mask!3464) (select (arr!30396 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999802 () Bool)

(declare-fun res!669397 () Bool)

(assert (=> b!999802 (=> (not res!669397) (not e!563612))))

(assert (=> b!999802 (= res!669397 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30900 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30900 a!3219))))))

(declare-fun b!999803 () Bool)

(declare-fun res!669402 () Bool)

(assert (=> b!999803 (=> (not res!669402) (not e!563613))))

(declare-fun arrayContainsKey!0 (array!63142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999803 (= res!669402 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!669400 () Bool)

(assert (=> start!86394 (=> (not res!669400) (not e!563613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86394 (= res!669400 (validMask!0 mask!3464))))

(assert (=> start!86394 e!563613))

(declare-fun array_inv!23539 (array!63142) Bool)

(assert (=> start!86394 (array_inv!23539 a!3219)))

(assert (=> start!86394 true))

(declare-fun b!999804 () Bool)

(declare-fun res!669399 () Bool)

(assert (=> b!999804 (=> (not res!669399) (not e!563614))))

(assert (=> b!999804 (= res!669399 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30396 a!3219) j!170) a!3219 mask!3464) lt!441944))))

(declare-fun b!999805 () Bool)

(declare-fun res!669403 () Bool)

(assert (=> b!999805 (=> (not res!669403) (not e!563613))))

(assert (=> b!999805 (= res!669403 (and (= (size!30900 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30900 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30900 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86394 res!669400) b!999805))

(assert (= (and b!999805 res!669403) b!999795))

(assert (= (and b!999795 res!669396) b!999800))

(assert (= (and b!999800 res!669404) b!999803))

(assert (= (and b!999803 res!669402) b!999797))

(assert (= (and b!999797 res!669406) b!999796))

(assert (= (and b!999796 res!669401) b!999794))

(assert (= (and b!999794 res!669405) b!999802))

(assert (= (and b!999802 res!669397) b!999801))

(assert (= (and b!999801 res!669398) b!999804))

(assert (= (and b!999804 res!669399) b!999798))

(assert (= (and b!999798 res!669407) b!999799))

(declare-fun m!925477 () Bool)

(assert (=> b!999800 m!925477))

(declare-fun m!925479 () Bool)

(assert (=> b!999804 m!925479))

(assert (=> b!999804 m!925479))

(declare-fun m!925481 () Bool)

(assert (=> b!999804 m!925481))

(declare-fun m!925483 () Bool)

(assert (=> b!999803 m!925483))

(declare-fun m!925485 () Bool)

(assert (=> b!999796 m!925485))

(assert (=> b!999801 m!925479))

(assert (=> b!999801 m!925479))

(declare-fun m!925487 () Bool)

(assert (=> b!999801 m!925487))

(assert (=> b!999801 m!925487))

(assert (=> b!999801 m!925479))

(declare-fun m!925489 () Bool)

(assert (=> b!999801 m!925489))

(declare-fun m!925491 () Bool)

(assert (=> b!999797 m!925491))

(declare-fun m!925493 () Bool)

(assert (=> b!999794 m!925493))

(assert (=> b!999795 m!925479))

(assert (=> b!999795 m!925479))

(declare-fun m!925495 () Bool)

(assert (=> b!999795 m!925495))

(declare-fun m!925497 () Bool)

(assert (=> start!86394 m!925497))

(declare-fun m!925499 () Bool)

(assert (=> start!86394 m!925499))

(declare-fun m!925501 () Bool)

(assert (=> b!999798 m!925501))

(declare-fun m!925503 () Bool)

(assert (=> b!999798 m!925503))

(assert (=> b!999798 m!925503))

(declare-fun m!925505 () Bool)

(assert (=> b!999798 m!925505))

(assert (=> b!999798 m!925505))

(assert (=> b!999798 m!925503))

(declare-fun m!925507 () Bool)

(assert (=> b!999798 m!925507))

(check-sat (not b!999797) (not b!999798) (not b!999803) (not b!999796) (not b!999795) (not start!86394) (not b!999794) (not b!999804) (not b!999801) (not b!999800))
(check-sat)
