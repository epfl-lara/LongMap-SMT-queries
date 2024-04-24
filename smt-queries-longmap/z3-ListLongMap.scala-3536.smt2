; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48832 () Bool)

(assert start!48832)

(declare-fun b!537007 () Bool)

(declare-fun res!332117 () Bool)

(declare-fun e!311686 () Bool)

(assert (=> b!537007 (=> (not res!332117) (not e!311686))))

(declare-datatypes ((array!33992 0))(
  ( (array!33993 (arr!16333 (Array (_ BitVec 32) (_ BitVec 64))) (size!16697 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33992)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537007 (= res!332117 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537008 () Bool)

(declare-fun e!311688 () Bool)

(declare-fun e!311687 () Bool)

(assert (=> b!537008 (= e!311688 e!311687)))

(declare-fun res!332114 () Bool)

(assert (=> b!537008 (=> (not res!332114) (not e!311687))))

(declare-fun lt!246319 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537008 (= res!332114 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246319 #b00000000000000000000000000000000) (bvslt lt!246319 (size!16697 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537008 (= lt!246319 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!537009 () Bool)

(declare-fun e!311684 () Bool)

(assert (=> b!537009 (= e!311686 e!311684)))

(declare-fun res!332119 () Bool)

(assert (=> b!537009 (=> (not res!332119) (not e!311684))))

(declare-datatypes ((SeekEntryResult!4747 0))(
  ( (MissingZero!4747 (index!21212 (_ BitVec 32))) (Found!4747 (index!21213 (_ BitVec 32))) (Intermediate!4747 (undefined!5559 Bool) (index!21214 (_ BitVec 32)) (x!50301 (_ BitVec 32))) (Undefined!4747) (MissingVacant!4747 (index!21215 (_ BitVec 32))) )
))
(declare-fun lt!246316 () SeekEntryResult!4747)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537009 (= res!332119 (or (= lt!246316 (MissingZero!4747 i!1153)) (= lt!246316 (MissingVacant!4747 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33992 (_ BitVec 32)) SeekEntryResult!4747)

(assert (=> b!537009 (= lt!246316 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537010 () Bool)

(declare-fun res!332110 () Bool)

(assert (=> b!537010 (=> (not res!332110) (not e!311688))))

(declare-fun lt!246317 () SeekEntryResult!4747)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33992 (_ BitVec 32)) SeekEntryResult!4747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537010 (= res!332110 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16333 a!3154) j!147) mask!3216) (select (arr!16333 a!3154) j!147) a!3154 mask!3216) lt!246317))))

(declare-fun b!537011 () Bool)

(declare-fun res!332108 () Bool)

(assert (=> b!537011 (=> (not res!332108) (not e!311684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33992 (_ BitVec 32)) Bool)

(assert (=> b!537011 (= res!332108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537012 () Bool)

(assert (=> b!537012 (= e!311687 false)))

(declare-fun lt!246318 () SeekEntryResult!4747)

(assert (=> b!537012 (= lt!246318 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246319 (select (arr!16333 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537013 () Bool)

(declare-fun res!332116 () Bool)

(assert (=> b!537013 (=> (not res!332116) (not e!311684))))

(declare-datatypes ((List!10359 0))(
  ( (Nil!10356) (Cons!10355 (h!11301 (_ BitVec 64)) (t!16579 List!10359)) )
))
(declare-fun arrayNoDuplicates!0 (array!33992 (_ BitVec 32) List!10359) Bool)

(assert (=> b!537013 (= res!332116 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10356))))

(declare-fun b!537014 () Bool)

(declare-fun res!332112 () Bool)

(assert (=> b!537014 (=> (not res!332112) (not e!311686))))

(assert (=> b!537014 (= res!332112 (and (= (size!16697 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16697 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16697 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537015 () Bool)

(declare-fun res!332107 () Bool)

(assert (=> b!537015 (=> (not res!332107) (not e!311686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537015 (= res!332107 (validKeyInArray!0 (select (arr!16333 a!3154) j!147)))))

(declare-fun b!537016 () Bool)

(assert (=> b!537016 (= e!311684 e!311688)))

(declare-fun res!332111 () Bool)

(assert (=> b!537016 (=> (not res!332111) (not e!311688))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537016 (= res!332111 (= lt!246317 (Intermediate!4747 false resIndex!32 resX!32)))))

(assert (=> b!537016 (= lt!246317 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16333 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537017 () Bool)

(declare-fun res!332113 () Bool)

(assert (=> b!537017 (=> (not res!332113) (not e!311688))))

(assert (=> b!537017 (= res!332113 (and (not (= (select (arr!16333 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16333 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16333 a!3154) index!1177) (select (arr!16333 a!3154) j!147)))))))

(declare-fun b!537018 () Bool)

(declare-fun res!332118 () Bool)

(assert (=> b!537018 (=> (not res!332118) (not e!311684))))

(assert (=> b!537018 (= res!332118 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16697 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16697 a!3154)) (= (select (arr!16333 a!3154) resIndex!32) (select (arr!16333 a!3154) j!147))))))

(declare-fun res!332115 () Bool)

(assert (=> start!48832 (=> (not res!332115) (not e!311686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48832 (= res!332115 (validMask!0 mask!3216))))

(assert (=> start!48832 e!311686))

(assert (=> start!48832 true))

(declare-fun array_inv!12192 (array!33992) Bool)

(assert (=> start!48832 (array_inv!12192 a!3154)))

(declare-fun b!537019 () Bool)

(declare-fun res!332109 () Bool)

(assert (=> b!537019 (=> (not res!332109) (not e!311686))))

(assert (=> b!537019 (= res!332109 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48832 res!332115) b!537014))

(assert (= (and b!537014 res!332112) b!537015))

(assert (= (and b!537015 res!332107) b!537019))

(assert (= (and b!537019 res!332109) b!537007))

(assert (= (and b!537007 res!332117) b!537009))

(assert (= (and b!537009 res!332119) b!537011))

(assert (= (and b!537011 res!332108) b!537013))

(assert (= (and b!537013 res!332116) b!537018))

(assert (= (and b!537018 res!332118) b!537016))

(assert (= (and b!537016 res!332111) b!537010))

(assert (= (and b!537010 res!332110) b!537017))

(assert (= (and b!537017 res!332113) b!537008))

(assert (= (and b!537008 res!332114) b!537012))

(declare-fun m!516475 () Bool)

(assert (=> b!537015 m!516475))

(assert (=> b!537015 m!516475))

(declare-fun m!516477 () Bool)

(assert (=> b!537015 m!516477))

(declare-fun m!516479 () Bool)

(assert (=> start!48832 m!516479))

(declare-fun m!516481 () Bool)

(assert (=> start!48832 m!516481))

(declare-fun m!516483 () Bool)

(assert (=> b!537017 m!516483))

(assert (=> b!537017 m!516475))

(declare-fun m!516485 () Bool)

(assert (=> b!537008 m!516485))

(declare-fun m!516487 () Bool)

(assert (=> b!537019 m!516487))

(declare-fun m!516489 () Bool)

(assert (=> b!537009 m!516489))

(declare-fun m!516491 () Bool)

(assert (=> b!537013 m!516491))

(declare-fun m!516493 () Bool)

(assert (=> b!537018 m!516493))

(assert (=> b!537018 m!516475))

(declare-fun m!516495 () Bool)

(assert (=> b!537011 m!516495))

(assert (=> b!537012 m!516475))

(assert (=> b!537012 m!516475))

(declare-fun m!516497 () Bool)

(assert (=> b!537012 m!516497))

(assert (=> b!537010 m!516475))

(assert (=> b!537010 m!516475))

(declare-fun m!516499 () Bool)

(assert (=> b!537010 m!516499))

(assert (=> b!537010 m!516499))

(assert (=> b!537010 m!516475))

(declare-fun m!516501 () Bool)

(assert (=> b!537010 m!516501))

(assert (=> b!537016 m!516475))

(assert (=> b!537016 m!516475))

(declare-fun m!516503 () Bool)

(assert (=> b!537016 m!516503))

(declare-fun m!516505 () Bool)

(assert (=> b!537007 m!516505))

(check-sat (not b!537019) (not b!537013) (not b!537012) (not b!537008) (not b!537015) (not b!537007) (not b!537009) (not b!537010) (not b!537011) (not start!48832) (not b!537016))
(check-sat)
