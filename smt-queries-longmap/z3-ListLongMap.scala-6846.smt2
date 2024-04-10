; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86224 () Bool)

(assert start!86224)

(declare-fun b!998306 () Bool)

(declare-fun res!668107 () Bool)

(declare-fun e!562981 () Bool)

(assert (=> b!998306 (=> (not res!668107) (not e!562981))))

(declare-datatypes ((array!63127 0))(
  ( (array!63128 (arr!30392 (Array (_ BitVec 32) (_ BitVec 64))) (size!30894 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63127)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63127 (_ BitVec 32)) Bool)

(assert (=> b!998306 (= res!668107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998307 () Bool)

(declare-fun res!668106 () Bool)

(declare-fun e!562980 () Bool)

(assert (=> b!998307 (=> (not res!668106) (not e!562980))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998307 (= res!668106 (validKeyInArray!0 (select (arr!30392 a!3219) j!170)))))

(declare-fun res!668102 () Bool)

(assert (=> start!86224 (=> (not res!668102) (not e!562980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86224 (= res!668102 (validMask!0 mask!3464))))

(assert (=> start!86224 e!562980))

(declare-fun array_inv!23516 (array!63127) Bool)

(assert (=> start!86224 (array_inv!23516 a!3219)))

(assert (=> start!86224 true))

(declare-fun b!998308 () Bool)

(declare-fun res!668110 () Bool)

(assert (=> b!998308 (=> (not res!668110) (not e!562980))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998308 (= res!668110 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998309 () Bool)

(declare-fun res!668109 () Bool)

(assert (=> b!998309 (=> (not res!668109) (not e!562980))))

(assert (=> b!998309 (= res!668109 (validKeyInArray!0 k0!2224))))

(declare-fun b!998310 () Bool)

(declare-fun res!668111 () Bool)

(assert (=> b!998310 (=> (not res!668111) (not e!562981))))

(declare-datatypes ((List!21068 0))(
  ( (Nil!21065) (Cons!21064 (h!22235 (_ BitVec 64)) (t!30069 List!21068)) )
))
(declare-fun arrayNoDuplicates!0 (array!63127 (_ BitVec 32) List!21068) Bool)

(assert (=> b!998310 (= res!668111 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21065))))

(declare-fun b!998311 () Bool)

(declare-fun e!562979 () Bool)

(assert (=> b!998311 (= e!562979 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!998312 () Bool)

(assert (=> b!998312 (= e!562980 e!562981)))

(declare-fun res!668105 () Bool)

(assert (=> b!998312 (=> (not res!668105) (not e!562981))))

(declare-datatypes ((SeekEntryResult!9324 0))(
  ( (MissingZero!9324 (index!39667 (_ BitVec 32))) (Found!9324 (index!39668 (_ BitVec 32))) (Intermediate!9324 (undefined!10136 Bool) (index!39669 (_ BitVec 32)) (x!87100 (_ BitVec 32))) (Undefined!9324) (MissingVacant!9324 (index!39670 (_ BitVec 32))) )
))
(declare-fun lt!441677 () SeekEntryResult!9324)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998312 (= res!668105 (or (= lt!441677 (MissingVacant!9324 i!1194)) (= lt!441677 (MissingZero!9324 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63127 (_ BitVec 32)) SeekEntryResult!9324)

(assert (=> b!998312 (= lt!441677 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998313 () Bool)

(declare-fun res!668108 () Bool)

(assert (=> b!998313 (=> (not res!668108) (not e!562980))))

(assert (=> b!998313 (= res!668108 (and (= (size!30894 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30894 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30894 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998314 () Bool)

(assert (=> b!998314 (= e!562981 e!562979)))

(declare-fun res!668104 () Bool)

(assert (=> b!998314 (=> (not res!668104) (not e!562979))))

(declare-fun lt!441676 () SeekEntryResult!9324)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63127 (_ BitVec 32)) SeekEntryResult!9324)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998314 (= res!668104 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30392 a!3219) j!170) mask!3464) (select (arr!30392 a!3219) j!170) a!3219 mask!3464) lt!441676))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998314 (= lt!441676 (Intermediate!9324 false resIndex!38 resX!38))))

(declare-fun b!998315 () Bool)

(declare-fun res!668112 () Bool)

(assert (=> b!998315 (=> (not res!668112) (not e!562981))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!998315 (= res!668112 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30894 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30894 a!3219))))))

(declare-fun b!998316 () Bool)

(declare-fun res!668103 () Bool)

(assert (=> b!998316 (=> (not res!668103) (not e!562979))))

(assert (=> b!998316 (= res!668103 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30392 a!3219) j!170) a!3219 mask!3464) lt!441676))))

(assert (= (and start!86224 res!668102) b!998313))

(assert (= (and b!998313 res!668108) b!998307))

(assert (= (and b!998307 res!668106) b!998309))

(assert (= (and b!998309 res!668109) b!998308))

(assert (= (and b!998308 res!668110) b!998312))

(assert (= (and b!998312 res!668105) b!998306))

(assert (= (and b!998306 res!668107) b!998310))

(assert (= (and b!998310 res!668111) b!998315))

(assert (= (and b!998315 res!668112) b!998314))

(assert (= (and b!998314 res!668104) b!998316))

(assert (= (and b!998316 res!668103) b!998311))

(declare-fun m!924869 () Bool)

(assert (=> b!998312 m!924869))

(declare-fun m!924871 () Bool)

(assert (=> b!998308 m!924871))

(declare-fun m!924873 () Bool)

(assert (=> b!998307 m!924873))

(assert (=> b!998307 m!924873))

(declare-fun m!924875 () Bool)

(assert (=> b!998307 m!924875))

(assert (=> b!998316 m!924873))

(assert (=> b!998316 m!924873))

(declare-fun m!924877 () Bool)

(assert (=> b!998316 m!924877))

(declare-fun m!924879 () Bool)

(assert (=> start!86224 m!924879))

(declare-fun m!924881 () Bool)

(assert (=> start!86224 m!924881))

(declare-fun m!924883 () Bool)

(assert (=> b!998310 m!924883))

(declare-fun m!924885 () Bool)

(assert (=> b!998306 m!924885))

(declare-fun m!924887 () Bool)

(assert (=> b!998309 m!924887))

(assert (=> b!998314 m!924873))

(assert (=> b!998314 m!924873))

(declare-fun m!924889 () Bool)

(assert (=> b!998314 m!924889))

(assert (=> b!998314 m!924889))

(assert (=> b!998314 m!924873))

(declare-fun m!924891 () Bool)

(assert (=> b!998314 m!924891))

(check-sat (not b!998316) (not b!998307) (not b!998314) (not b!998309) (not b!998312) (not b!998308) (not b!998310) (not start!86224) (not b!998306))
(check-sat)
