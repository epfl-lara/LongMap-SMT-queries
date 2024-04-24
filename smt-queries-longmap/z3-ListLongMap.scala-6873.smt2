; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86722 () Bool)

(assert start!86722)

(declare-fun b!1003003 () Bool)

(declare-fun res!671735 () Bool)

(declare-fun e!565238 () Bool)

(assert (=> b!1003003 (=> (not res!671735) (not e!565238))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9358 0))(
  ( (MissingZero!9358 (index!39803 (_ BitVec 32))) (Found!9358 (index!39804 (_ BitVec 32))) (Intermediate!9358 (undefined!10170 Bool) (index!39805 (_ BitVec 32)) (x!87382 (_ BitVec 32))) (Undefined!9358) (MissingVacant!9358 (index!39806 (_ BitVec 32))) )
))
(declare-fun lt!443315 () SeekEntryResult!9358)

(declare-fun lt!443319 () (_ BitVec 64))

(declare-datatypes ((array!63342 0))(
  ( (array!63343 (arr!30490 (Array (_ BitVec 32) (_ BitVec 64))) (size!30993 (_ BitVec 32))) )
))
(declare-fun lt!443316 () array!63342)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63342 (_ BitVec 32)) SeekEntryResult!9358)

(assert (=> b!1003003 (= res!671735 (not (= lt!443315 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443319 lt!443316 mask!3464))))))

(declare-fun b!1003004 () Bool)

(declare-fun res!671728 () Bool)

(declare-fun e!565241 () Bool)

(assert (=> b!1003004 (=> (not res!671728) (not e!565241))))

(declare-fun a!3219 () array!63342)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003004 (= res!671728 (and (= (size!30993 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30993 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30993 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003005 () Bool)

(declare-fun res!671722 () Bool)

(declare-fun e!565236 () Bool)

(assert (=> b!1003005 (=> (not res!671722) (not e!565236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63342 (_ BitVec 32)) Bool)

(assert (=> b!1003005 (= res!671722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003006 () Bool)

(assert (=> b!1003006 (= e!565241 e!565236)))

(declare-fun res!671729 () Bool)

(assert (=> b!1003006 (=> (not res!671729) (not e!565236))))

(declare-fun lt!443320 () SeekEntryResult!9358)

(assert (=> b!1003006 (= res!671729 (or (= lt!443320 (MissingVacant!9358 i!1194)) (= lt!443320 (MissingZero!9358 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63342 (_ BitVec 32)) SeekEntryResult!9358)

(assert (=> b!1003006 (= lt!443320 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003007 () Bool)

(declare-fun e!565240 () Bool)

(assert (=> b!1003007 (= e!565236 e!565240)))

(declare-fun res!671720 () Bool)

(assert (=> b!1003007 (=> (not res!671720) (not e!565240))))

(declare-fun lt!443318 () SeekEntryResult!9358)

(declare-fun lt!443317 () SeekEntryResult!9358)

(assert (=> b!1003007 (= res!671720 (= lt!443318 lt!443317))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003007 (= lt!443317 (Intermediate!9358 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003007 (= lt!443318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30490 a!3219) j!170) mask!3464) (select (arr!30490 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003008 () Bool)

(declare-fun e!565242 () Bool)

(assert (=> b!1003008 (= e!565242 false)))

(declare-fun lt!443314 () (_ BitVec 32))

(declare-fun lt!443321 () SeekEntryResult!9358)

(assert (=> b!1003008 (= lt!443321 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443314 lt!443319 lt!443316 mask!3464))))

(declare-fun b!1003010 () Bool)

(declare-fun e!565239 () Bool)

(assert (=> b!1003010 (= e!565239 e!565238)))

(declare-fun res!671724 () Bool)

(assert (=> b!1003010 (=> (not res!671724) (not e!565238))))

(assert (=> b!1003010 (= res!671724 (not (= lt!443318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443319 mask!3464) lt!443319 lt!443316 mask!3464))))))

(assert (=> b!1003010 (= lt!443319 (select (store (arr!30490 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003010 (= lt!443316 (array!63343 (store (arr!30490 a!3219) i!1194 k0!2224) (size!30993 a!3219)))))

(declare-fun b!1003011 () Bool)

(assert (=> b!1003011 (= e!565240 e!565239)))

(declare-fun res!671723 () Bool)

(assert (=> b!1003011 (=> (not res!671723) (not e!565239))))

(assert (=> b!1003011 (= res!671723 (= lt!443315 lt!443317))))

(assert (=> b!1003011 (= lt!443315 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30490 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003012 () Bool)

(declare-fun res!671732 () Bool)

(assert (=> b!1003012 (=> (not res!671732) (not e!565238))))

(assert (=> b!1003012 (= res!671732 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003013 () Bool)

(declare-fun res!671725 () Bool)

(assert (=> b!1003013 (=> (not res!671725) (not e!565236))))

(declare-datatypes ((List!21137 0))(
  ( (Nil!21134) (Cons!21133 (h!22319 (_ BitVec 64)) (t!30130 List!21137)) )
))
(declare-fun arrayNoDuplicates!0 (array!63342 (_ BitVec 32) List!21137) Bool)

(assert (=> b!1003013 (= res!671725 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21134))))

(declare-fun b!1003014 () Bool)

(declare-fun res!671726 () Bool)

(assert (=> b!1003014 (=> (not res!671726) (not e!565241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003014 (= res!671726 (validKeyInArray!0 (select (arr!30490 a!3219) j!170)))))

(declare-fun b!1003015 () Bool)

(declare-fun res!671733 () Bool)

(assert (=> b!1003015 (=> (not res!671733) (not e!565236))))

(assert (=> b!1003015 (= res!671733 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30993 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30993 a!3219))))))

(declare-fun b!1003016 () Bool)

(declare-fun res!671721 () Bool)

(assert (=> b!1003016 (=> (not res!671721) (not e!565241))))

(declare-fun arrayContainsKey!0 (array!63342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003016 (= res!671721 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003017 () Bool)

(assert (=> b!1003017 (= e!565238 e!565242)))

(declare-fun res!671734 () Bool)

(assert (=> b!1003017 (=> (not res!671734) (not e!565242))))

(assert (=> b!1003017 (= res!671734 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443314 #b00000000000000000000000000000000) (bvslt lt!443314 (size!30993 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003017 (= lt!443314 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1003018 () Bool)

(declare-fun res!671731 () Bool)

(assert (=> b!1003018 (=> (not res!671731) (not e!565242))))

(assert (=> b!1003018 (= res!671731 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443314 (select (arr!30490 a!3219) j!170) a!3219 mask!3464) lt!443317))))

(declare-fun res!671727 () Bool)

(assert (=> start!86722 (=> (not res!671727) (not e!565241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86722 (= res!671727 (validMask!0 mask!3464))))

(assert (=> start!86722 e!565241))

(declare-fun array_inv!23626 (array!63342) Bool)

(assert (=> start!86722 (array_inv!23626 a!3219)))

(assert (=> start!86722 true))

(declare-fun b!1003009 () Bool)

(declare-fun res!671730 () Bool)

(assert (=> b!1003009 (=> (not res!671730) (not e!565241))))

(assert (=> b!1003009 (= res!671730 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86722 res!671727) b!1003004))

(assert (= (and b!1003004 res!671728) b!1003014))

(assert (= (and b!1003014 res!671726) b!1003009))

(assert (= (and b!1003009 res!671730) b!1003016))

(assert (= (and b!1003016 res!671721) b!1003006))

(assert (= (and b!1003006 res!671729) b!1003005))

(assert (= (and b!1003005 res!671722) b!1003013))

(assert (= (and b!1003013 res!671725) b!1003015))

(assert (= (and b!1003015 res!671733) b!1003007))

(assert (= (and b!1003007 res!671720) b!1003011))

(assert (= (and b!1003011 res!671723) b!1003010))

(assert (= (and b!1003010 res!671724) b!1003003))

(assert (= (and b!1003003 res!671735) b!1003012))

(assert (= (and b!1003012 res!671732) b!1003017))

(assert (= (and b!1003017 res!671734) b!1003018))

(assert (= (and b!1003018 res!671731) b!1003008))

(declare-fun m!929273 () Bool)

(assert (=> b!1003007 m!929273))

(assert (=> b!1003007 m!929273))

(declare-fun m!929275 () Bool)

(assert (=> b!1003007 m!929275))

(assert (=> b!1003007 m!929275))

(assert (=> b!1003007 m!929273))

(declare-fun m!929277 () Bool)

(assert (=> b!1003007 m!929277))

(declare-fun m!929279 () Bool)

(assert (=> b!1003017 m!929279))

(declare-fun m!929281 () Bool)

(assert (=> b!1003003 m!929281))

(assert (=> b!1003018 m!929273))

(assert (=> b!1003018 m!929273))

(declare-fun m!929283 () Bool)

(assert (=> b!1003018 m!929283))

(declare-fun m!929285 () Bool)

(assert (=> b!1003009 m!929285))

(declare-fun m!929287 () Bool)

(assert (=> b!1003016 m!929287))

(declare-fun m!929289 () Bool)

(assert (=> b!1003006 m!929289))

(declare-fun m!929291 () Bool)

(assert (=> b!1003008 m!929291))

(declare-fun m!929293 () Bool)

(assert (=> b!1003010 m!929293))

(assert (=> b!1003010 m!929293))

(declare-fun m!929295 () Bool)

(assert (=> b!1003010 m!929295))

(declare-fun m!929297 () Bool)

(assert (=> b!1003010 m!929297))

(declare-fun m!929299 () Bool)

(assert (=> b!1003010 m!929299))

(declare-fun m!929301 () Bool)

(assert (=> start!86722 m!929301))

(declare-fun m!929303 () Bool)

(assert (=> start!86722 m!929303))

(assert (=> b!1003014 m!929273))

(assert (=> b!1003014 m!929273))

(declare-fun m!929305 () Bool)

(assert (=> b!1003014 m!929305))

(declare-fun m!929307 () Bool)

(assert (=> b!1003013 m!929307))

(assert (=> b!1003011 m!929273))

(assert (=> b!1003011 m!929273))

(declare-fun m!929309 () Bool)

(assert (=> b!1003011 m!929309))

(declare-fun m!929311 () Bool)

(assert (=> b!1003005 m!929311))

(check-sat (not b!1003003) (not b!1003011) (not b!1003006) (not b!1003018) (not b!1003010) (not b!1003014) (not b!1003007) (not b!1003013) (not start!86722) (not b!1003016) (not b!1003008) (not b!1003005) (not b!1003009) (not b!1003017))
(check-sat)
