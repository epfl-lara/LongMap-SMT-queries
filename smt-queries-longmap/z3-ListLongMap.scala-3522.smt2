; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48704 () Bool)

(assert start!48704)

(declare-fun b!535293 () Bool)

(declare-fun res!330500 () Bool)

(declare-fun e!310992 () Bool)

(assert (=> b!535293 (=> (not res!330500) (not e!310992))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33916 0))(
  ( (array!33917 (arr!16297 (Array (_ BitVec 32) (_ BitVec 64))) (size!16661 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33916)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535293 (= res!330500 (and (= (size!16661 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16661 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16661 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!330508 () Bool)

(assert (=> start!48704 (=> (not res!330508) (not e!310992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48704 (= res!330508 (validMask!0 mask!3216))))

(assert (=> start!48704 e!310992))

(assert (=> start!48704 true))

(declare-fun array_inv!12093 (array!33916) Bool)

(assert (=> start!48704 (array_inv!12093 a!3154)))

(declare-fun b!535294 () Bool)

(declare-fun res!330501 () Bool)

(declare-fun e!310991 () Bool)

(assert (=> b!535294 (=> (not res!330501) (not e!310991))))

(declare-datatypes ((SeekEntryResult!4755 0))(
  ( (MissingZero!4755 (index!21244 (_ BitVec 32))) (Found!4755 (index!21245 (_ BitVec 32))) (Intermediate!4755 (undefined!5567 Bool) (index!21246 (_ BitVec 32)) (x!50194 (_ BitVec 32))) (Undefined!4755) (MissingVacant!4755 (index!21247 (_ BitVec 32))) )
))
(declare-fun lt!245796 () SeekEntryResult!4755)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33916 (_ BitVec 32)) SeekEntryResult!4755)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535294 (= res!330501 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16297 a!3154) j!147) mask!3216) (select (arr!16297 a!3154) j!147) a!3154 mask!3216) lt!245796))))

(declare-fun b!535295 () Bool)

(declare-fun res!330505 () Bool)

(assert (=> b!535295 (=> (not res!330505) (not e!310992))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535295 (= res!330505 (validKeyInArray!0 k0!1998))))

(declare-fun b!535296 () Bool)

(declare-fun res!330503 () Bool)

(assert (=> b!535296 (=> (not res!330503) (not e!310992))))

(declare-fun arrayContainsKey!0 (array!33916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535296 (= res!330503 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535297 () Bool)

(declare-fun res!330498 () Bool)

(declare-fun e!310990 () Bool)

(assert (=> b!535297 (=> (not res!330498) (not e!310990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33916 (_ BitVec 32)) Bool)

(assert (=> b!535297 (= res!330498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535298 () Bool)

(assert (=> b!535298 (= e!310990 e!310991)))

(declare-fun res!330506 () Bool)

(assert (=> b!535298 (=> (not res!330506) (not e!310991))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535298 (= res!330506 (= lt!245796 (Intermediate!4755 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!535298 (= lt!245796 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16297 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535299 () Bool)

(declare-fun res!330499 () Bool)

(assert (=> b!535299 (=> (not res!330499) (not e!310991))))

(assert (=> b!535299 (= res!330499 (and (not (= (select (arr!16297 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16297 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16297 a!3154) index!1177) (select (arr!16297 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsle x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!535300 () Bool)

(declare-fun res!330502 () Bool)

(assert (=> b!535300 (=> (not res!330502) (not e!310990))))

(declare-datatypes ((List!10416 0))(
  ( (Nil!10413) (Cons!10412 (h!11355 (_ BitVec 64)) (t!16644 List!10416)) )
))
(declare-fun arrayNoDuplicates!0 (array!33916 (_ BitVec 32) List!10416) Bool)

(assert (=> b!535300 (= res!330502 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10413))))

(declare-fun b!535301 () Bool)

(assert (=> b!535301 (= e!310992 e!310990)))

(declare-fun res!330504 () Bool)

(assert (=> b!535301 (=> (not res!330504) (not e!310990))))

(declare-fun lt!245797 () SeekEntryResult!4755)

(assert (=> b!535301 (= res!330504 (or (= lt!245797 (MissingZero!4755 i!1153)) (= lt!245797 (MissingVacant!4755 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33916 (_ BitVec 32)) SeekEntryResult!4755)

(assert (=> b!535301 (= lt!245797 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535302 () Bool)

(declare-fun res!330509 () Bool)

(assert (=> b!535302 (=> (not res!330509) (not e!310992))))

(assert (=> b!535302 (= res!330509 (validKeyInArray!0 (select (arr!16297 a!3154) j!147)))))

(declare-fun b!535303 () Bool)

(declare-fun res!330507 () Bool)

(assert (=> b!535303 (=> (not res!330507) (not e!310990))))

(assert (=> b!535303 (= res!330507 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16661 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16661 a!3154)) (= (select (arr!16297 a!3154) resIndex!32) (select (arr!16297 a!3154) j!147))))))

(declare-fun b!535304 () Bool)

(assert (=> b!535304 (= e!310991 (not (validKeyInArray!0 (select (store (arr!16297 a!3154) i!1153 k0!1998) j!147))))))

(assert (= (and start!48704 res!330508) b!535293))

(assert (= (and b!535293 res!330500) b!535302))

(assert (= (and b!535302 res!330509) b!535295))

(assert (= (and b!535295 res!330505) b!535296))

(assert (= (and b!535296 res!330503) b!535301))

(assert (= (and b!535301 res!330504) b!535297))

(assert (= (and b!535297 res!330498) b!535300))

(assert (= (and b!535300 res!330502) b!535303))

(assert (= (and b!535303 res!330507) b!535298))

(assert (= (and b!535298 res!330506) b!535294))

(assert (= (and b!535294 res!330501) b!535299))

(assert (= (and b!535299 res!330499) b!535304))

(declare-fun m!514891 () Bool)

(assert (=> b!535300 m!514891))

(declare-fun m!514893 () Bool)

(assert (=> b!535303 m!514893))

(declare-fun m!514895 () Bool)

(assert (=> b!535303 m!514895))

(declare-fun m!514897 () Bool)

(assert (=> b!535304 m!514897))

(declare-fun m!514899 () Bool)

(assert (=> b!535304 m!514899))

(assert (=> b!535304 m!514899))

(declare-fun m!514901 () Bool)

(assert (=> b!535304 m!514901))

(assert (=> b!535294 m!514895))

(assert (=> b!535294 m!514895))

(declare-fun m!514903 () Bool)

(assert (=> b!535294 m!514903))

(assert (=> b!535294 m!514903))

(assert (=> b!535294 m!514895))

(declare-fun m!514905 () Bool)

(assert (=> b!535294 m!514905))

(declare-fun m!514907 () Bool)

(assert (=> b!535301 m!514907))

(declare-fun m!514909 () Bool)

(assert (=> b!535297 m!514909))

(assert (=> b!535302 m!514895))

(assert (=> b!535302 m!514895))

(declare-fun m!514911 () Bool)

(assert (=> b!535302 m!514911))

(declare-fun m!514913 () Bool)

(assert (=> b!535299 m!514913))

(assert (=> b!535299 m!514895))

(declare-fun m!514915 () Bool)

(assert (=> start!48704 m!514915))

(declare-fun m!514917 () Bool)

(assert (=> start!48704 m!514917))

(assert (=> b!535298 m!514895))

(assert (=> b!535298 m!514895))

(declare-fun m!514919 () Bool)

(assert (=> b!535298 m!514919))

(declare-fun m!514921 () Bool)

(assert (=> b!535295 m!514921))

(declare-fun m!514923 () Bool)

(assert (=> b!535296 m!514923))

(check-sat (not b!535296) (not b!535295) (not b!535298) (not b!535297) (not b!535300) (not b!535304) (not b!535294) (not start!48704) (not b!535301) (not b!535302))
(check-sat)
