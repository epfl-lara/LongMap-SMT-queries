; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86424 () Bool)

(assert start!86424)

(declare-fun b!1000307 () Bool)

(declare-fun res!669919 () Bool)

(declare-fun e!563793 () Bool)

(assert (=> b!1000307 (=> (not res!669919) (not e!563793))))

(declare-datatypes ((array!63172 0))(
  ( (array!63173 (arr!30411 (Array (_ BitVec 32) (_ BitVec 64))) (size!30915 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63172)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63172 (_ BitVec 32)) Bool)

(assert (=> b!1000307 (= res!669919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000308 () Bool)

(declare-fun res!669913 () Bool)

(assert (=> b!1000308 (=> (not res!669913) (not e!563793))))

(declare-datatypes ((List!21153 0))(
  ( (Nil!21150) (Cons!21149 (h!22326 (_ BitVec 64)) (t!30145 List!21153)) )
))
(declare-fun arrayNoDuplicates!0 (array!63172 (_ BitVec 32) List!21153) Bool)

(assert (=> b!1000308 (= res!669913 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21150))))

(declare-fun b!1000309 () Bool)

(declare-fun res!669920 () Bool)

(assert (=> b!1000309 (=> (not res!669920) (not e!563793))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000309 (= res!669920 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30915 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30915 a!3219))))))

(declare-fun b!1000310 () Bool)

(declare-fun res!669917 () Bool)

(declare-fun e!563794 () Bool)

(assert (=> b!1000310 (=> (not res!669917) (not e!563794))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9368 0))(
  ( (MissingZero!9368 (index!39843 (_ BitVec 32))) (Found!9368 (index!39844 (_ BitVec 32))) (Intermediate!9368 (undefined!10180 Bool) (index!39845 (_ BitVec 32)) (x!87287 (_ BitVec 32))) (Undefined!9368) (MissingVacant!9368 (index!39846 (_ BitVec 32))) )
))
(declare-fun lt!442079 () SeekEntryResult!9368)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63172 (_ BitVec 32)) SeekEntryResult!9368)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000310 (= res!669917 (not (= lt!442079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30411 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30411 a!3219) i!1194 k0!2224) j!170) (array!63173 (store (arr!30411 a!3219) i!1194 k0!2224) (size!30915 a!3219)) mask!3464))))))

(declare-fun b!1000311 () Bool)

(declare-fun res!669915 () Bool)

(declare-fun e!563795 () Bool)

(assert (=> b!1000311 (=> (not res!669915) (not e!563795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000311 (= res!669915 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000313 () Bool)

(declare-fun res!669916 () Bool)

(assert (=> b!1000313 (=> (not res!669916) (not e!563794))))

(declare-fun lt!442081 () SeekEntryResult!9368)

(assert (=> b!1000313 (= res!669916 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30411 a!3219) j!170) a!3219 mask!3464) lt!442081))))

(declare-fun b!1000314 () Bool)

(declare-fun res!669909 () Bool)

(assert (=> b!1000314 (=> (not res!669909) (not e!563795))))

(assert (=> b!1000314 (= res!669909 (validKeyInArray!0 (select (arr!30411 a!3219) j!170)))))

(declare-fun b!1000315 () Bool)

(assert (=> b!1000315 (= e!563795 e!563793)))

(declare-fun res!669911 () Bool)

(assert (=> b!1000315 (=> (not res!669911) (not e!563793))))

(declare-fun lt!442080 () SeekEntryResult!9368)

(assert (=> b!1000315 (= res!669911 (or (= lt!442080 (MissingVacant!9368 i!1194)) (= lt!442080 (MissingZero!9368 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63172 (_ BitVec 32)) SeekEntryResult!9368)

(assert (=> b!1000315 (= lt!442080 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000316 () Bool)

(assert (=> b!1000316 (= e!563793 e!563794)))

(declare-fun res!669914 () Bool)

(assert (=> b!1000316 (=> (not res!669914) (not e!563794))))

(assert (=> b!1000316 (= res!669914 (= lt!442079 lt!442081))))

(assert (=> b!1000316 (= lt!442081 (Intermediate!9368 false resIndex!38 resX!38))))

(assert (=> b!1000316 (= lt!442079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30411 a!3219) j!170) mask!3464) (select (arr!30411 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000317 () Bool)

(declare-fun res!669918 () Bool)

(assert (=> b!1000317 (=> (not res!669918) (not e!563795))))

(assert (=> b!1000317 (= res!669918 (and (= (size!30915 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30915 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30915 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000318 () Bool)

(assert (=> b!1000318 (= e!563794 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!1000312 () Bool)

(declare-fun res!669910 () Bool)

(assert (=> b!1000312 (=> (not res!669910) (not e!563795))))

(declare-fun arrayContainsKey!0 (array!63172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000312 (= res!669910 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!669912 () Bool)

(assert (=> start!86424 (=> (not res!669912) (not e!563795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86424 (= res!669912 (validMask!0 mask!3464))))

(assert (=> start!86424 e!563795))

(declare-fun array_inv!23554 (array!63172) Bool)

(assert (=> start!86424 (array_inv!23554 a!3219)))

(assert (=> start!86424 true))

(assert (= (and start!86424 res!669912) b!1000317))

(assert (= (and b!1000317 res!669918) b!1000314))

(assert (= (and b!1000314 res!669909) b!1000311))

(assert (= (and b!1000311 res!669915) b!1000312))

(assert (= (and b!1000312 res!669910) b!1000315))

(assert (= (and b!1000315 res!669911) b!1000307))

(assert (= (and b!1000307 res!669919) b!1000308))

(assert (= (and b!1000308 res!669913) b!1000309))

(assert (= (and b!1000309 res!669920) b!1000316))

(assert (= (and b!1000316 res!669914) b!1000313))

(assert (= (and b!1000313 res!669916) b!1000310))

(assert (= (and b!1000310 res!669917) b!1000318))

(declare-fun m!925957 () Bool)

(assert (=> b!1000313 m!925957))

(assert (=> b!1000313 m!925957))

(declare-fun m!925959 () Bool)

(assert (=> b!1000313 m!925959))

(declare-fun m!925961 () Bool)

(assert (=> b!1000307 m!925961))

(declare-fun m!925963 () Bool)

(assert (=> b!1000315 m!925963))

(declare-fun m!925965 () Bool)

(assert (=> b!1000308 m!925965))

(assert (=> b!1000314 m!925957))

(assert (=> b!1000314 m!925957))

(declare-fun m!925967 () Bool)

(assert (=> b!1000314 m!925967))

(declare-fun m!925969 () Bool)

(assert (=> b!1000311 m!925969))

(declare-fun m!925971 () Bool)

(assert (=> start!86424 m!925971))

(declare-fun m!925973 () Bool)

(assert (=> start!86424 m!925973))

(declare-fun m!925975 () Bool)

(assert (=> b!1000312 m!925975))

(declare-fun m!925977 () Bool)

(assert (=> b!1000310 m!925977))

(declare-fun m!925979 () Bool)

(assert (=> b!1000310 m!925979))

(assert (=> b!1000310 m!925979))

(declare-fun m!925981 () Bool)

(assert (=> b!1000310 m!925981))

(assert (=> b!1000310 m!925981))

(assert (=> b!1000310 m!925979))

(declare-fun m!925983 () Bool)

(assert (=> b!1000310 m!925983))

(assert (=> b!1000316 m!925957))

(assert (=> b!1000316 m!925957))

(declare-fun m!925985 () Bool)

(assert (=> b!1000316 m!925985))

(assert (=> b!1000316 m!925985))

(assert (=> b!1000316 m!925957))

(declare-fun m!925987 () Bool)

(assert (=> b!1000316 m!925987))

(check-sat (not b!1000313) (not start!86424) (not b!1000312) (not b!1000310) (not b!1000307) (not b!1000314) (not b!1000308) (not b!1000315) (not b!1000311) (not b!1000316))
(check-sat)
