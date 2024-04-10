; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86298 () Bool)

(assert start!86298)

(declare-fun b!998897 () Bool)

(declare-fun res!668539 () Bool)

(declare-fun e!563267 () Bool)

(assert (=> b!998897 (=> (not res!668539) (not e!563267))))

(declare-datatypes ((array!63150 0))(
  ( (array!63151 (arr!30402 (Array (_ BitVec 32) (_ BitVec 64))) (size!30904 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63150)

(declare-datatypes ((List!21078 0))(
  ( (Nil!21075) (Cons!21074 (h!22248 (_ BitVec 64)) (t!30079 List!21078)) )
))
(declare-fun arrayNoDuplicates!0 (array!63150 (_ BitVec 32) List!21078) Bool)

(assert (=> b!998897 (= res!668539 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21075))))

(declare-fun b!998898 () Bool)

(declare-fun res!668534 () Bool)

(declare-fun e!563269 () Bool)

(assert (=> b!998898 (=> (not res!668534) (not e!563269))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9334 0))(
  ( (MissingZero!9334 (index!39707 (_ BitVec 32))) (Found!9334 (index!39708 (_ BitVec 32))) (Intermediate!9334 (undefined!10146 Bool) (index!39709 (_ BitVec 32)) (x!87140 (_ BitVec 32))) (Undefined!9334) (MissingVacant!9334 (index!39710 (_ BitVec 32))) )
))
(declare-fun lt!441851 () SeekEntryResult!9334)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63150 (_ BitVec 32)) SeekEntryResult!9334)

(assert (=> b!998898 (= res!668534 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30402 a!3219) j!170) a!3219 mask!3464) lt!441851))))

(declare-fun b!998899 () Bool)

(declare-fun res!668541 () Bool)

(declare-fun e!563266 () Bool)

(assert (=> b!998899 (=> (not res!668541) (not e!563266))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998899 (= res!668541 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998901 () Bool)

(assert (=> b!998901 (= e!563267 e!563269)))

(declare-fun res!668542 () Bool)

(assert (=> b!998901 (=> (not res!668542) (not e!563269))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998901 (= res!668542 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30402 a!3219) j!170) mask!3464) (select (arr!30402 a!3219) j!170) a!3219 mask!3464) lt!441851))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998901 (= lt!441851 (Intermediate!9334 false resIndex!38 resX!38))))

(declare-fun b!998902 () Bool)

(declare-fun res!668538 () Bool)

(assert (=> b!998902 (=> (not res!668538) (not e!563267))))

(assert (=> b!998902 (= res!668538 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30904 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30904 a!3219))))))

(declare-fun b!998903 () Bool)

(assert (=> b!998903 (= e!563266 e!563267)))

(declare-fun res!668536 () Bool)

(assert (=> b!998903 (=> (not res!668536) (not e!563267))))

(declare-fun lt!441849 () SeekEntryResult!9334)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998903 (= res!668536 (or (= lt!441849 (MissingVacant!9334 i!1194)) (= lt!441849 (MissingZero!9334 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63150 (_ BitVec 32)) SeekEntryResult!9334)

(assert (=> b!998903 (= lt!441849 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998904 () Bool)

(declare-fun res!668544 () Bool)

(assert (=> b!998904 (=> (not res!668544) (not e!563266))))

(assert (=> b!998904 (= res!668544 (and (= (size!30904 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30904 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30904 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998905 () Bool)

(declare-fun res!668535 () Bool)

(assert (=> b!998905 (=> (not res!668535) (not e!563266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998905 (= res!668535 (validKeyInArray!0 (select (arr!30402 a!3219) j!170)))))

(declare-fun b!998906 () Bool)

(declare-fun res!668537 () Bool)

(assert (=> b!998906 (=> (not res!668537) (not e!563267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63150 (_ BitVec 32)) Bool)

(assert (=> b!998906 (= res!668537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998907 () Bool)

(declare-fun res!668543 () Bool)

(assert (=> b!998907 (=> (not res!668543) (not e!563266))))

(assert (=> b!998907 (= res!668543 (validKeyInArray!0 k!2224))))

(declare-fun res!668540 () Bool)

(assert (=> start!86298 (=> (not res!668540) (not e!563266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86298 (= res!668540 (validMask!0 mask!3464))))

(assert (=> start!86298 e!563266))

(declare-fun array_inv!23526 (array!63150) Bool)

(assert (=> start!86298 (array_inv!23526 a!3219)))

(assert (=> start!86298 true))

(declare-fun b!998900 () Bool)

(assert (=> b!998900 (= e!563269 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun lt!441850 () (_ BitVec 32))

(assert (=> b!998900 (= lt!441850 (toIndex!0 (select (store (arr!30402 a!3219) i!1194 k!2224) j!170) mask!3464))))

(assert (= (and start!86298 res!668540) b!998904))

(assert (= (and b!998904 res!668544) b!998905))

(assert (= (and b!998905 res!668535) b!998907))

(assert (= (and b!998907 res!668543) b!998899))

(assert (= (and b!998899 res!668541) b!998903))

(assert (= (and b!998903 res!668536) b!998906))

(assert (= (and b!998906 res!668537) b!998897))

(assert (= (and b!998897 res!668539) b!998902))

(assert (= (and b!998902 res!668538) b!998901))

(assert (= (and b!998901 res!668542) b!998898))

(assert (= (and b!998898 res!668534) b!998900))

(declare-fun m!925283 () Bool)

(assert (=> b!998899 m!925283))

(declare-fun m!925285 () Bool)

(assert (=> b!998898 m!925285))

(assert (=> b!998898 m!925285))

(declare-fun m!925287 () Bool)

(assert (=> b!998898 m!925287))

(assert (=> b!998901 m!925285))

(assert (=> b!998901 m!925285))

(declare-fun m!925289 () Bool)

(assert (=> b!998901 m!925289))

(assert (=> b!998901 m!925289))

(assert (=> b!998901 m!925285))

(declare-fun m!925291 () Bool)

(assert (=> b!998901 m!925291))

(declare-fun m!925293 () Bool)

(assert (=> b!998907 m!925293))

(declare-fun m!925295 () Bool)

(assert (=> b!998897 m!925295))

(declare-fun m!925297 () Bool)

(assert (=> b!998903 m!925297))

(declare-fun m!925299 () Bool)

(assert (=> b!998906 m!925299))

(declare-fun m!925301 () Bool)

(assert (=> start!86298 m!925301))

(declare-fun m!925303 () Bool)

(assert (=> start!86298 m!925303))

(assert (=> b!998905 m!925285))

(assert (=> b!998905 m!925285))

(declare-fun m!925305 () Bool)

(assert (=> b!998905 m!925305))

(declare-fun m!925307 () Bool)

(assert (=> b!998900 m!925307))

(declare-fun m!925309 () Bool)

(assert (=> b!998900 m!925309))

(assert (=> b!998900 m!925309))

(declare-fun m!925311 () Bool)

(assert (=> b!998900 m!925311))

(push 1)

(assert (not b!998905))

(assert (not b!998907))

(assert (not b!998903))

(assert (not b!998897))

(assert (not b!998898))

(assert (not start!86298))

(assert (not b!998899))

(assert (not b!998900))

(assert (not b!998901))

