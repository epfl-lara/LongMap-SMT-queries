; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86218 () Bool)

(assert start!86218)

(declare-fun b!997580 () Bool)

(declare-fun res!667135 () Bool)

(declare-fun e!562874 () Bool)

(assert (=> b!997580 (=> (not res!667135) (not e!562874))))

(declare-datatypes ((array!63093 0))(
  ( (array!63094 (arr!30373 (Array (_ BitVec 32) (_ BitVec 64))) (size!30876 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63093)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997580 (= res!667135 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997581 () Bool)

(declare-fun res!667129 () Bool)

(declare-fun e!562875 () Bool)

(assert (=> b!997581 (=> (not res!667129) (not e!562875))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63093 (_ BitVec 32)) Bool)

(assert (=> b!997581 (= res!667129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997583 () Bool)

(declare-fun res!667136 () Bool)

(assert (=> b!997583 (=> (not res!667136) (not e!562875))))

(declare-datatypes ((List!21020 0))(
  ( (Nil!21017) (Cons!21016 (h!22187 (_ BitVec 64)) (t!30013 List!21020)) )
))
(declare-fun arrayNoDuplicates!0 (array!63093 (_ BitVec 32) List!21020) Bool)

(assert (=> b!997583 (= res!667136 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21017))))

(declare-fun b!997584 () Bool)

(declare-fun res!667128 () Bool)

(assert (=> b!997584 (=> (not res!667128) (not e!562874))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997584 (= res!667128 (validKeyInArray!0 (select (arr!30373 a!3219) j!170)))))

(declare-fun b!997585 () Bool)

(assert (=> b!997585 (= e!562875 false)))

(declare-datatypes ((SeekEntryResult!9241 0))(
  ( (MissingZero!9241 (index!39335 (_ BitVec 32))) (Found!9241 (index!39336 (_ BitVec 32))) (Intermediate!9241 (undefined!10053 Bool) (index!39337 (_ BitVec 32)) (x!86923 (_ BitVec 32))) (Undefined!9241) (MissingVacant!9241 (index!39338 (_ BitVec 32))) )
))
(declare-fun lt!441637 () SeekEntryResult!9241)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63093 (_ BitVec 32)) SeekEntryResult!9241)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997585 (= lt!441637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30373 a!3219) j!170) mask!3464) (select (arr!30373 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997586 () Bool)

(declare-fun res!667131 () Bool)

(assert (=> b!997586 (=> (not res!667131) (not e!562874))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997586 (= res!667131 (and (= (size!30876 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30876 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30876 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!667132 () Bool)

(assert (=> start!86218 (=> (not res!667132) (not e!562874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86218 (= res!667132 (validMask!0 mask!3464))))

(assert (=> start!86218 e!562874))

(declare-fun array_inv!23509 (array!63093) Bool)

(assert (=> start!86218 (array_inv!23509 a!3219)))

(assert (=> start!86218 true))

(declare-fun b!997582 () Bool)

(declare-fun res!667134 () Bool)

(assert (=> b!997582 (=> (not res!667134) (not e!562874))))

(assert (=> b!997582 (= res!667134 (validKeyInArray!0 k0!2224))))

(declare-fun b!997587 () Bool)

(assert (=> b!997587 (= e!562874 e!562875)))

(declare-fun res!667133 () Bool)

(assert (=> b!997587 (=> (not res!667133) (not e!562875))))

(declare-fun lt!441638 () SeekEntryResult!9241)

(assert (=> b!997587 (= res!667133 (or (= lt!441638 (MissingVacant!9241 i!1194)) (= lt!441638 (MissingZero!9241 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63093 (_ BitVec 32)) SeekEntryResult!9241)

(assert (=> b!997587 (= lt!441638 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997588 () Bool)

(declare-fun res!667130 () Bool)

(assert (=> b!997588 (=> (not res!667130) (not e!562875))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!997588 (= res!667130 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30876 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30876 a!3219))))))

(assert (= (and start!86218 res!667132) b!997586))

(assert (= (and b!997586 res!667131) b!997584))

(assert (= (and b!997584 res!667128) b!997582))

(assert (= (and b!997582 res!667134) b!997580))

(assert (= (and b!997580 res!667135) b!997587))

(assert (= (and b!997587 res!667133) b!997581))

(assert (= (and b!997581 res!667129) b!997583))

(assert (= (and b!997583 res!667136) b!997588))

(assert (= (and b!997588 res!667130) b!997585))

(declare-fun m!925055 () Bool)

(assert (=> b!997584 m!925055))

(assert (=> b!997584 m!925055))

(declare-fun m!925057 () Bool)

(assert (=> b!997584 m!925057))

(declare-fun m!925059 () Bool)

(assert (=> b!997580 m!925059))

(declare-fun m!925061 () Bool)

(assert (=> b!997587 m!925061))

(declare-fun m!925063 () Bool)

(assert (=> b!997582 m!925063))

(declare-fun m!925065 () Bool)

(assert (=> b!997581 m!925065))

(declare-fun m!925067 () Bool)

(assert (=> start!86218 m!925067))

(declare-fun m!925069 () Bool)

(assert (=> start!86218 m!925069))

(declare-fun m!925071 () Bool)

(assert (=> b!997583 m!925071))

(assert (=> b!997585 m!925055))

(assert (=> b!997585 m!925055))

(declare-fun m!925073 () Bool)

(assert (=> b!997585 m!925073))

(assert (=> b!997585 m!925073))

(assert (=> b!997585 m!925055))

(declare-fun m!925075 () Bool)

(assert (=> b!997585 m!925075))

(check-sat (not b!997585) (not b!997580) (not b!997584) (not b!997583) (not b!997581) (not b!997587) (not start!86218) (not b!997582))
(check-sat)
