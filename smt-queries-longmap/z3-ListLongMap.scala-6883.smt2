; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86554 () Bool)

(assert start!86554)

(declare-fun res!672732 () Bool)

(declare-fun e!565090 () Bool)

(assert (=> start!86554 (=> (not res!672732) (not e!565090))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86554 (= res!672732 (validMask!0 mask!3464))))

(assert (=> start!86554 e!565090))

(declare-datatypes ((array!63355 0))(
  ( (array!63356 (arr!30503 (Array (_ BitVec 32) (_ BitVec 64))) (size!31005 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63355)

(declare-fun array_inv!23627 (array!63355) Bool)

(assert (=> start!86554 (array_inv!23627 a!3219)))

(assert (=> start!86554 true))

(declare-fun b!1003245 () Bool)

(declare-fun res!672724 () Bool)

(assert (=> b!1003245 (=> (not res!672724) (not e!565090))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003245 (= res!672724 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003246 () Bool)

(declare-fun res!672737 () Bool)

(assert (=> b!1003246 (=> (not res!672737) (not e!565090))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003246 (= res!672737 (validKeyInArray!0 (select (arr!30503 a!3219) j!170)))))

(declare-fun b!1003247 () Bool)

(declare-fun res!672727 () Bool)

(declare-fun e!565089 () Bool)

(assert (=> b!1003247 (=> (not res!672727) (not e!565089))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003247 (= res!672727 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003248 () Bool)

(declare-fun res!672729 () Bool)

(declare-fun e!565084 () Bool)

(assert (=> b!1003248 (=> (not res!672729) (not e!565084))))

(declare-datatypes ((List!21179 0))(
  ( (Nil!21176) (Cons!21175 (h!22352 (_ BitVec 64)) (t!30180 List!21179)) )
))
(declare-fun arrayNoDuplicates!0 (array!63355 (_ BitVec 32) List!21179) Bool)

(assert (=> b!1003248 (= res!672729 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21176))))

(declare-fun b!1003249 () Bool)

(declare-fun res!672734 () Bool)

(assert (=> b!1003249 (=> (not res!672734) (not e!565089))))

(declare-fun lt!443579 () array!63355)

(declare-datatypes ((SeekEntryResult!9435 0))(
  ( (MissingZero!9435 (index!40111 (_ BitVec 32))) (Found!9435 (index!40112 (_ BitVec 32))) (Intermediate!9435 (undefined!10247 Bool) (index!40113 (_ BitVec 32)) (x!87519 (_ BitVec 32))) (Undefined!9435) (MissingVacant!9435 (index!40114 (_ BitVec 32))) )
))
(declare-fun lt!443580 () SeekEntryResult!9435)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!443585 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63355 (_ BitVec 32)) SeekEntryResult!9435)

(assert (=> b!1003249 (= res!672734 (not (= lt!443580 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443585 lt!443579 mask!3464))))))

(declare-fun b!1003250 () Bool)

(assert (=> b!1003250 (= e!565090 e!565084)))

(declare-fun res!672725 () Bool)

(assert (=> b!1003250 (=> (not res!672725) (not e!565084))))

(declare-fun lt!443583 () SeekEntryResult!9435)

(assert (=> b!1003250 (= res!672725 (or (= lt!443583 (MissingVacant!9435 i!1194)) (= lt!443583 (MissingZero!9435 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63355 (_ BitVec 32)) SeekEntryResult!9435)

(assert (=> b!1003250 (= lt!443583 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003251 () Bool)

(declare-fun e!565086 () Bool)

(assert (=> b!1003251 (= e!565084 e!565086)))

(declare-fun res!672730 () Bool)

(assert (=> b!1003251 (=> (not res!672730) (not e!565086))))

(declare-fun lt!443582 () SeekEntryResult!9435)

(declare-fun lt!443581 () SeekEntryResult!9435)

(assert (=> b!1003251 (= res!672730 (= lt!443582 lt!443581))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003251 (= lt!443581 (Intermediate!9435 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003251 (= lt!443582 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30503 a!3219) j!170) mask!3464) (select (arr!30503 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003252 () Bool)

(declare-fun res!672736 () Bool)

(assert (=> b!1003252 (=> (not res!672736) (not e!565090))))

(assert (=> b!1003252 (= res!672736 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003253 () Bool)

(declare-fun e!565088 () Bool)

(assert (=> b!1003253 (= e!565086 e!565088)))

(declare-fun res!672738 () Bool)

(assert (=> b!1003253 (=> (not res!672738) (not e!565088))))

(assert (=> b!1003253 (= res!672738 (= lt!443580 lt!443581))))

(assert (=> b!1003253 (= lt!443580 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30503 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003254 () Bool)

(declare-fun res!672733 () Bool)

(assert (=> b!1003254 (=> (not res!672733) (not e!565084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63355 (_ BitVec 32)) Bool)

(assert (=> b!1003254 (= res!672733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003255 () Bool)

(declare-fun res!672726 () Bool)

(assert (=> b!1003255 (=> (not res!672726) (not e!565084))))

(assert (=> b!1003255 (= res!672726 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31005 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31005 a!3219))))))

(declare-fun b!1003256 () Bool)

(declare-fun e!565085 () Bool)

(assert (=> b!1003256 (= e!565089 e!565085)))

(declare-fun res!672735 () Bool)

(assert (=> b!1003256 (=> (not res!672735) (not e!565085))))

(declare-fun lt!443578 () (_ BitVec 32))

(assert (=> b!1003256 (= res!672735 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443578 #b00000000000000000000000000000000) (bvslt lt!443578 (size!31005 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003256 (= lt!443578 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003257 () Bool)

(declare-fun res!672731 () Bool)

(assert (=> b!1003257 (=> (not res!672731) (not e!565085))))

(assert (=> b!1003257 (= res!672731 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443578 (select (arr!30503 a!3219) j!170) a!3219 mask!3464) lt!443581))))

(declare-fun b!1003258 () Bool)

(assert (=> b!1003258 (= e!565085 false)))

(declare-fun lt!443584 () SeekEntryResult!9435)

(assert (=> b!1003258 (= lt!443584 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443578 lt!443585 lt!443579 mask!3464))))

(declare-fun b!1003259 () Bool)

(assert (=> b!1003259 (= e!565088 e!565089)))

(declare-fun res!672723 () Bool)

(assert (=> b!1003259 (=> (not res!672723) (not e!565089))))

(assert (=> b!1003259 (= res!672723 (not (= lt!443582 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443585 mask!3464) lt!443585 lt!443579 mask!3464))))))

(assert (=> b!1003259 (= lt!443585 (select (store (arr!30503 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003259 (= lt!443579 (array!63356 (store (arr!30503 a!3219) i!1194 k0!2224) (size!31005 a!3219)))))

(declare-fun b!1003260 () Bool)

(declare-fun res!672728 () Bool)

(assert (=> b!1003260 (=> (not res!672728) (not e!565090))))

(assert (=> b!1003260 (= res!672728 (and (= (size!31005 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31005 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31005 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86554 res!672732) b!1003260))

(assert (= (and b!1003260 res!672728) b!1003246))

(assert (= (and b!1003246 res!672737) b!1003252))

(assert (= (and b!1003252 res!672736) b!1003245))

(assert (= (and b!1003245 res!672724) b!1003250))

(assert (= (and b!1003250 res!672725) b!1003254))

(assert (= (and b!1003254 res!672733) b!1003248))

(assert (= (and b!1003248 res!672729) b!1003255))

(assert (= (and b!1003255 res!672726) b!1003251))

(assert (= (and b!1003251 res!672730) b!1003253))

(assert (= (and b!1003253 res!672738) b!1003259))

(assert (= (and b!1003259 res!672723) b!1003249))

(assert (= (and b!1003249 res!672734) b!1003247))

(assert (= (and b!1003247 res!672727) b!1003256))

(assert (= (and b!1003256 res!672735) b!1003257))

(assert (= (and b!1003257 res!672731) b!1003258))

(declare-fun m!928989 () Bool)

(assert (=> b!1003257 m!928989))

(assert (=> b!1003257 m!928989))

(declare-fun m!928991 () Bool)

(assert (=> b!1003257 m!928991))

(assert (=> b!1003251 m!928989))

(assert (=> b!1003251 m!928989))

(declare-fun m!928993 () Bool)

(assert (=> b!1003251 m!928993))

(assert (=> b!1003251 m!928993))

(assert (=> b!1003251 m!928989))

(declare-fun m!928995 () Bool)

(assert (=> b!1003251 m!928995))

(declare-fun m!928997 () Bool)

(assert (=> b!1003249 m!928997))

(assert (=> b!1003253 m!928989))

(assert (=> b!1003253 m!928989))

(declare-fun m!928999 () Bool)

(assert (=> b!1003253 m!928999))

(declare-fun m!929001 () Bool)

(assert (=> b!1003259 m!929001))

(assert (=> b!1003259 m!929001))

(declare-fun m!929003 () Bool)

(assert (=> b!1003259 m!929003))

(declare-fun m!929005 () Bool)

(assert (=> b!1003259 m!929005))

(declare-fun m!929007 () Bool)

(assert (=> b!1003259 m!929007))

(declare-fun m!929009 () Bool)

(assert (=> b!1003250 m!929009))

(declare-fun m!929011 () Bool)

(assert (=> b!1003248 m!929011))

(declare-fun m!929013 () Bool)

(assert (=> b!1003254 m!929013))

(declare-fun m!929015 () Bool)

(assert (=> start!86554 m!929015))

(declare-fun m!929017 () Bool)

(assert (=> start!86554 m!929017))

(declare-fun m!929019 () Bool)

(assert (=> b!1003252 m!929019))

(declare-fun m!929021 () Bool)

(assert (=> b!1003256 m!929021))

(assert (=> b!1003246 m!928989))

(assert (=> b!1003246 m!928989))

(declare-fun m!929023 () Bool)

(assert (=> b!1003246 m!929023))

(declare-fun m!929025 () Bool)

(assert (=> b!1003258 m!929025))

(declare-fun m!929027 () Bool)

(assert (=> b!1003245 m!929027))

(check-sat (not b!1003258) (not b!1003246) (not b!1003256) (not b!1003259) (not b!1003257) (not b!1003253) (not b!1003254) (not b!1003252) (not b!1003248) (not b!1003250) (not b!1003251) (not b!1003249) (not b!1003245) (not start!86554))
(check-sat)
