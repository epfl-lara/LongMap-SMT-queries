; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86224 () Bool)

(assert start!86224)

(declare-fun b!997663 () Bool)

(declare-fun res!667216 () Bool)

(declare-fun e!562900 () Bool)

(assert (=> b!997663 (=> (not res!667216) (not e!562900))))

(declare-datatypes ((array!63099 0))(
  ( (array!63100 (arr!30376 (Array (_ BitVec 32) (_ BitVec 64))) (size!30879 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63099)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997663 (= res!667216 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30879 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30879 a!3219))))))

(declare-fun b!997664 () Bool)

(declare-fun res!667215 () Bool)

(assert (=> b!997664 (=> (not res!667215) (not e!562900))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63099 (_ BitVec 32)) Bool)

(assert (=> b!997664 (= res!667215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!667213 () Bool)

(declare-fun e!562901 () Bool)

(assert (=> start!86224 (=> (not res!667213) (not e!562901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86224 (= res!667213 (validMask!0 mask!3464))))

(assert (=> start!86224 e!562901))

(declare-fun array_inv!23512 (array!63099) Bool)

(assert (=> start!86224 (array_inv!23512 a!3219)))

(assert (=> start!86224 true))

(declare-fun b!997665 () Bool)

(declare-fun res!667211 () Bool)

(assert (=> b!997665 (=> (not res!667211) (not e!562901))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997665 (= res!667211 (validKeyInArray!0 k0!2224))))

(declare-fun b!997666 () Bool)

(declare-fun res!667214 () Bool)

(assert (=> b!997666 (=> (not res!667214) (not e!562901))))

(declare-fun arrayContainsKey!0 (array!63099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997666 (= res!667214 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997667 () Bool)

(declare-fun res!667217 () Bool)

(assert (=> b!997667 (=> (not res!667217) (not e!562901))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!997667 (= res!667217 (validKeyInArray!0 (select (arr!30376 a!3219) j!170)))))

(declare-fun b!997668 () Bool)

(assert (=> b!997668 (= e!562901 e!562900)))

(declare-fun res!667212 () Bool)

(assert (=> b!997668 (=> (not res!667212) (not e!562900))))

(declare-datatypes ((SeekEntryResult!9244 0))(
  ( (MissingZero!9244 (index!39347 (_ BitVec 32))) (Found!9244 (index!39348 (_ BitVec 32))) (Intermediate!9244 (undefined!10056 Bool) (index!39349 (_ BitVec 32)) (x!86934 (_ BitVec 32))) (Undefined!9244) (MissingVacant!9244 (index!39350 (_ BitVec 32))) )
))
(declare-fun lt!441653 () SeekEntryResult!9244)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997668 (= res!667212 (or (= lt!441653 (MissingVacant!9244 i!1194)) (= lt!441653 (MissingZero!9244 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63099 (_ BitVec 32)) SeekEntryResult!9244)

(assert (=> b!997668 (= lt!441653 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997669 () Bool)

(declare-fun res!667219 () Bool)

(assert (=> b!997669 (=> (not res!667219) (not e!562901))))

(assert (=> b!997669 (= res!667219 (and (= (size!30879 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30879 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30879 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997670 () Bool)

(declare-fun res!667218 () Bool)

(assert (=> b!997670 (=> (not res!667218) (not e!562900))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63099 (_ BitVec 32)) SeekEntryResult!9244)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997670 (= res!667218 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30376 a!3219) j!170) mask!3464) (select (arr!30376 a!3219) j!170) a!3219 mask!3464) (Intermediate!9244 false resIndex!38 resX!38)))))

(declare-fun b!997671 () Bool)

(assert (=> b!997671 (= e!562900 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!997672 () Bool)

(declare-fun res!667220 () Bool)

(assert (=> b!997672 (=> (not res!667220) (not e!562900))))

(declare-datatypes ((List!21023 0))(
  ( (Nil!21020) (Cons!21019 (h!22190 (_ BitVec 64)) (t!30016 List!21023)) )
))
(declare-fun arrayNoDuplicates!0 (array!63099 (_ BitVec 32) List!21023) Bool)

(assert (=> b!997672 (= res!667220 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21020))))

(assert (= (and start!86224 res!667213) b!997669))

(assert (= (and b!997669 res!667219) b!997667))

(assert (= (and b!997667 res!667217) b!997665))

(assert (= (and b!997665 res!667211) b!997666))

(assert (= (and b!997666 res!667214) b!997668))

(assert (= (and b!997668 res!667212) b!997664))

(assert (= (and b!997664 res!667215) b!997672))

(assert (= (and b!997672 res!667220) b!997663))

(assert (= (and b!997663 res!667216) b!997670))

(assert (= (and b!997670 res!667218) b!997671))

(declare-fun m!925121 () Bool)

(assert (=> start!86224 m!925121))

(declare-fun m!925123 () Bool)

(assert (=> start!86224 m!925123))

(declare-fun m!925125 () Bool)

(assert (=> b!997664 m!925125))

(declare-fun m!925127 () Bool)

(assert (=> b!997668 m!925127))

(declare-fun m!925129 () Bool)

(assert (=> b!997670 m!925129))

(assert (=> b!997670 m!925129))

(declare-fun m!925131 () Bool)

(assert (=> b!997670 m!925131))

(assert (=> b!997670 m!925131))

(assert (=> b!997670 m!925129))

(declare-fun m!925133 () Bool)

(assert (=> b!997670 m!925133))

(assert (=> b!997667 m!925129))

(assert (=> b!997667 m!925129))

(declare-fun m!925135 () Bool)

(assert (=> b!997667 m!925135))

(declare-fun m!925137 () Bool)

(assert (=> b!997665 m!925137))

(declare-fun m!925139 () Bool)

(assert (=> b!997672 m!925139))

(declare-fun m!925141 () Bool)

(assert (=> b!997666 m!925141))

(check-sat (not b!997672) (not b!997670) (not b!997665) (not b!997668) (not start!86224) (not b!997666) (not b!997667) (not b!997664))
(check-sat)
