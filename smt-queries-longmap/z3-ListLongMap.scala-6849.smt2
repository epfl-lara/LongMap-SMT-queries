; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86296 () Bool)

(assert start!86296)

(declare-fun b!998864 () Bool)

(declare-fun res!668503 () Bool)

(declare-fun e!563256 () Bool)

(assert (=> b!998864 (=> (not res!668503) (not e!563256))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998864 (= res!668503 (validKeyInArray!0 k0!2224))))

(declare-fun b!998865 () Bool)

(declare-fun res!668505 () Bool)

(assert (=> b!998865 (=> (not res!668505) (not e!563256))))

(declare-datatypes ((array!63148 0))(
  ( (array!63149 (arr!30401 (Array (_ BitVec 32) (_ BitVec 64))) (size!30903 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63148)

(declare-fun arrayContainsKey!0 (array!63148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998865 (= res!668505 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998866 () Bool)

(declare-fun res!668506 () Bool)

(declare-fun e!563255 () Bool)

(assert (=> b!998866 (=> (not res!668506) (not e!563255))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998866 (= res!668506 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30903 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30903 a!3219))))))

(declare-fun b!998867 () Bool)

(declare-fun res!668510 () Bool)

(assert (=> b!998867 (=> (not res!668510) (not e!563256))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998867 (= res!668510 (and (= (size!30903 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30903 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30903 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998868 () Bool)

(declare-fun res!668509 () Bool)

(declare-fun e!563257 () Bool)

(assert (=> b!998868 (=> (not res!668509) (not e!563257))))

(declare-datatypes ((SeekEntryResult!9333 0))(
  ( (MissingZero!9333 (index!39703 (_ BitVec 32))) (Found!9333 (index!39704 (_ BitVec 32))) (Intermediate!9333 (undefined!10145 Bool) (index!39705 (_ BitVec 32)) (x!87139 (_ BitVec 32))) (Undefined!9333) (MissingVacant!9333 (index!39706 (_ BitVec 32))) )
))
(declare-fun lt!441841 () SeekEntryResult!9333)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63148 (_ BitVec 32)) SeekEntryResult!9333)

(assert (=> b!998868 (= res!668509 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30401 a!3219) j!170) a!3219 mask!3464) lt!441841))))

(declare-fun res!668507 () Bool)

(assert (=> start!86296 (=> (not res!668507) (not e!563256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86296 (= res!668507 (validMask!0 mask!3464))))

(assert (=> start!86296 e!563256))

(declare-fun array_inv!23525 (array!63148) Bool)

(assert (=> start!86296 (array_inv!23525 a!3219)))

(assert (=> start!86296 true))

(declare-fun b!998869 () Bool)

(assert (=> b!998869 (= e!563256 e!563255)))

(declare-fun res!668508 () Bool)

(assert (=> b!998869 (=> (not res!668508) (not e!563255))))

(declare-fun lt!441840 () SeekEntryResult!9333)

(assert (=> b!998869 (= res!668508 (or (= lt!441840 (MissingVacant!9333 i!1194)) (= lt!441840 (MissingZero!9333 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63148 (_ BitVec 32)) SeekEntryResult!9333)

(assert (=> b!998869 (= lt!441840 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998870 () Bool)

(assert (=> b!998870 (= e!563257 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun lt!441842 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998870 (= lt!441842 (toIndex!0 (select (store (arr!30401 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!998871 () Bool)

(declare-fun res!668511 () Bool)

(assert (=> b!998871 (=> (not res!668511) (not e!563255))))

(declare-datatypes ((List!21077 0))(
  ( (Nil!21074) (Cons!21073 (h!22247 (_ BitVec 64)) (t!30078 List!21077)) )
))
(declare-fun arrayNoDuplicates!0 (array!63148 (_ BitVec 32) List!21077) Bool)

(assert (=> b!998871 (= res!668511 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21074))))

(declare-fun b!998872 () Bool)

(declare-fun res!668504 () Bool)

(assert (=> b!998872 (=> (not res!668504) (not e!563256))))

(assert (=> b!998872 (= res!668504 (validKeyInArray!0 (select (arr!30401 a!3219) j!170)))))

(declare-fun b!998873 () Bool)

(declare-fun res!668501 () Bool)

(assert (=> b!998873 (=> (not res!668501) (not e!563255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63148 (_ BitVec 32)) Bool)

(assert (=> b!998873 (= res!668501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998874 () Bool)

(assert (=> b!998874 (= e!563255 e!563257)))

(declare-fun res!668502 () Bool)

(assert (=> b!998874 (=> (not res!668502) (not e!563257))))

(assert (=> b!998874 (= res!668502 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30401 a!3219) j!170) mask!3464) (select (arr!30401 a!3219) j!170) a!3219 mask!3464) lt!441841))))

(assert (=> b!998874 (= lt!441841 (Intermediate!9333 false resIndex!38 resX!38))))

(assert (= (and start!86296 res!668507) b!998867))

(assert (= (and b!998867 res!668510) b!998872))

(assert (= (and b!998872 res!668504) b!998864))

(assert (= (and b!998864 res!668503) b!998865))

(assert (= (and b!998865 res!668505) b!998869))

(assert (= (and b!998869 res!668508) b!998873))

(assert (= (and b!998873 res!668501) b!998871))

(assert (= (and b!998871 res!668511) b!998866))

(assert (= (and b!998866 res!668506) b!998874))

(assert (= (and b!998874 res!668502) b!998868))

(assert (= (and b!998868 res!668509) b!998870))

(declare-fun m!925253 () Bool)

(assert (=> b!998872 m!925253))

(assert (=> b!998872 m!925253))

(declare-fun m!925255 () Bool)

(assert (=> b!998872 m!925255))

(declare-fun m!925257 () Bool)

(assert (=> b!998873 m!925257))

(declare-fun m!925259 () Bool)

(assert (=> b!998871 m!925259))

(declare-fun m!925261 () Bool)

(assert (=> b!998870 m!925261))

(declare-fun m!925263 () Bool)

(assert (=> b!998870 m!925263))

(assert (=> b!998870 m!925263))

(declare-fun m!925265 () Bool)

(assert (=> b!998870 m!925265))

(assert (=> b!998868 m!925253))

(assert (=> b!998868 m!925253))

(declare-fun m!925267 () Bool)

(assert (=> b!998868 m!925267))

(declare-fun m!925269 () Bool)

(assert (=> start!86296 m!925269))

(declare-fun m!925271 () Bool)

(assert (=> start!86296 m!925271))

(declare-fun m!925273 () Bool)

(assert (=> b!998864 m!925273))

(declare-fun m!925275 () Bool)

(assert (=> b!998865 m!925275))

(assert (=> b!998874 m!925253))

(assert (=> b!998874 m!925253))

(declare-fun m!925277 () Bool)

(assert (=> b!998874 m!925277))

(assert (=> b!998874 m!925277))

(assert (=> b!998874 m!925253))

(declare-fun m!925279 () Bool)

(assert (=> b!998874 m!925279))

(declare-fun m!925281 () Bool)

(assert (=> b!998869 m!925281))

(check-sat (not b!998871) (not b!998869) (not start!86296) (not b!998864) (not b!998868) (not b!998873) (not b!998870) (not b!998865) (not b!998874) (not b!998872))
(check-sat)
