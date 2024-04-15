; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48810 () Bool)

(assert start!48810)

(declare-fun b!537238 () Bool)

(declare-fun e!311652 () Bool)

(declare-fun e!311654 () Bool)

(assert (=> b!537238 (= e!311652 e!311654)))

(declare-fun res!332590 () Bool)

(assert (=> b!537238 (=> (not res!332590) (not e!311654))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((array!34032 0))(
  ( (array!34033 (arr!16355 (Array (_ BitVec 32) (_ BitVec 64))) (size!16720 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34032)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!246192 () (_ BitVec 32))

(assert (=> b!537238 (= res!332590 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246192 #b00000000000000000000000000000000) (bvslt lt!246192 (size!16720 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537238 (= lt!246192 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537239 () Bool)

(declare-fun res!332594 () Bool)

(declare-fun e!311651 () Bool)

(assert (=> b!537239 (=> (not res!332594) (not e!311651))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!537239 (= res!332594 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16720 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16720 a!3154)) (= (select (arr!16355 a!3154) resIndex!32) (select (arr!16355 a!3154) j!147))))))

(declare-fun b!537240 () Bool)

(declare-fun e!311653 () Bool)

(assert (=> b!537240 (= e!311653 e!311651)))

(declare-fun res!332593 () Bool)

(assert (=> b!537240 (=> (not res!332593) (not e!311651))))

(declare-datatypes ((SeekEntryResult!4810 0))(
  ( (MissingZero!4810 (index!21464 (_ BitVec 32))) (Found!4810 (index!21465 (_ BitVec 32))) (Intermediate!4810 (undefined!5622 Bool) (index!21466 (_ BitVec 32)) (x!50404 (_ BitVec 32))) (Undefined!4810) (MissingVacant!4810 (index!21467 (_ BitVec 32))) )
))
(declare-fun lt!246193 () SeekEntryResult!4810)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537240 (= res!332593 (or (= lt!246193 (MissingZero!4810 i!1153)) (= lt!246193 (MissingVacant!4810 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34032 (_ BitVec 32)) SeekEntryResult!4810)

(assert (=> b!537240 (= lt!246193 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537241 () Bool)

(declare-fun res!332591 () Bool)

(assert (=> b!537241 (=> (not res!332591) (not e!311652))))

(assert (=> b!537241 (= res!332591 (and (not (= (select (arr!16355 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16355 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16355 a!3154) index!1177) (select (arr!16355 a!3154) j!147)))))))

(declare-fun res!332587 () Bool)

(assert (=> start!48810 (=> (not res!332587) (not e!311653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48810 (= res!332587 (validMask!0 mask!3216))))

(assert (=> start!48810 e!311653))

(assert (=> start!48810 true))

(declare-fun array_inv!12238 (array!34032) Bool)

(assert (=> start!48810 (array_inv!12238 a!3154)))

(declare-fun b!537242 () Bool)

(declare-fun res!332592 () Bool)

(assert (=> b!537242 (=> (not res!332592) (not e!311653))))

(assert (=> b!537242 (= res!332592 (and (= (size!16720 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16720 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16720 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537243 () Bool)

(declare-fun res!332585 () Bool)

(assert (=> b!537243 (=> (not res!332585) (not e!311652))))

(declare-fun lt!246190 () SeekEntryResult!4810)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34032 (_ BitVec 32)) SeekEntryResult!4810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537243 (= res!332585 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16355 a!3154) j!147) mask!3216) (select (arr!16355 a!3154) j!147) a!3154 mask!3216) lt!246190))))

(declare-fun b!537244 () Bool)

(declare-fun res!332589 () Bool)

(assert (=> b!537244 (=> (not res!332589) (not e!311653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537244 (= res!332589 (validKeyInArray!0 k0!1998))))

(declare-fun b!537245 () Bool)

(declare-fun res!332596 () Bool)

(assert (=> b!537245 (=> (not res!332596) (not e!311653))))

(declare-fun arrayContainsKey!0 (array!34032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537245 (= res!332596 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537246 () Bool)

(declare-fun res!332588 () Bool)

(assert (=> b!537246 (=> (not res!332588) (not e!311651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34032 (_ BitVec 32)) Bool)

(assert (=> b!537246 (= res!332588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537247 () Bool)

(declare-fun res!332595 () Bool)

(assert (=> b!537247 (=> (not res!332595) (not e!311651))))

(declare-datatypes ((List!10513 0))(
  ( (Nil!10510) (Cons!10509 (h!11452 (_ BitVec 64)) (t!16732 List!10513)) )
))
(declare-fun arrayNoDuplicates!0 (array!34032 (_ BitVec 32) List!10513) Bool)

(assert (=> b!537247 (= res!332595 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10510))))

(declare-fun b!537248 () Bool)

(declare-fun res!332597 () Bool)

(assert (=> b!537248 (=> (not res!332597) (not e!311653))))

(assert (=> b!537248 (= res!332597 (validKeyInArray!0 (select (arr!16355 a!3154) j!147)))))

(declare-fun b!537249 () Bool)

(assert (=> b!537249 (= e!311651 e!311652)))

(declare-fun res!332586 () Bool)

(assert (=> b!537249 (=> (not res!332586) (not e!311652))))

(assert (=> b!537249 (= res!332586 (= lt!246190 (Intermediate!4810 false resIndex!32 resX!32)))))

(assert (=> b!537249 (= lt!246190 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16355 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537250 () Bool)

(assert (=> b!537250 (= e!311654 false)))

(declare-fun lt!246191 () SeekEntryResult!4810)

(assert (=> b!537250 (= lt!246191 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246192 (select (arr!16355 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48810 res!332587) b!537242))

(assert (= (and b!537242 res!332592) b!537248))

(assert (= (and b!537248 res!332597) b!537244))

(assert (= (and b!537244 res!332589) b!537245))

(assert (= (and b!537245 res!332596) b!537240))

(assert (= (and b!537240 res!332593) b!537246))

(assert (= (and b!537246 res!332588) b!537247))

(assert (= (and b!537247 res!332595) b!537239))

(assert (= (and b!537239 res!332594) b!537249))

(assert (= (and b!537249 res!332586) b!537243))

(assert (= (and b!537243 res!332585) b!537241))

(assert (= (and b!537241 res!332591) b!537238))

(assert (= (and b!537238 res!332590) b!537250))

(declare-fun m!515977 () Bool)

(assert (=> b!537241 m!515977))

(declare-fun m!515979 () Bool)

(assert (=> b!537241 m!515979))

(declare-fun m!515981 () Bool)

(assert (=> b!537246 m!515981))

(declare-fun m!515983 () Bool)

(assert (=> b!537245 m!515983))

(assert (=> b!537248 m!515979))

(assert (=> b!537248 m!515979))

(declare-fun m!515985 () Bool)

(assert (=> b!537248 m!515985))

(declare-fun m!515987 () Bool)

(assert (=> b!537244 m!515987))

(assert (=> b!537249 m!515979))

(assert (=> b!537249 m!515979))

(declare-fun m!515989 () Bool)

(assert (=> b!537249 m!515989))

(declare-fun m!515991 () Bool)

(assert (=> b!537239 m!515991))

(assert (=> b!537239 m!515979))

(declare-fun m!515993 () Bool)

(assert (=> b!537247 m!515993))

(declare-fun m!515995 () Bool)

(assert (=> b!537240 m!515995))

(declare-fun m!515997 () Bool)

(assert (=> b!537238 m!515997))

(assert (=> b!537250 m!515979))

(assert (=> b!537250 m!515979))

(declare-fun m!515999 () Bool)

(assert (=> b!537250 m!515999))

(declare-fun m!516001 () Bool)

(assert (=> start!48810 m!516001))

(declare-fun m!516003 () Bool)

(assert (=> start!48810 m!516003))

(assert (=> b!537243 m!515979))

(assert (=> b!537243 m!515979))

(declare-fun m!516005 () Bool)

(assert (=> b!537243 m!516005))

(assert (=> b!537243 m!516005))

(assert (=> b!537243 m!515979))

(declare-fun m!516007 () Bool)

(assert (=> b!537243 m!516007))

(check-sat (not b!537249) (not b!537248) (not start!48810) (not b!537240) (not b!537238) (not b!537244) (not b!537246) (not b!537243) (not b!537247) (not b!537245) (not b!537250))
(check-sat)
