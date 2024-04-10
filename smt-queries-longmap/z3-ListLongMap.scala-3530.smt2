; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48752 () Bool)

(assert start!48752)

(declare-fun b!536144 () Bool)

(declare-fun res!331352 () Bool)

(declare-fun e!311300 () Bool)

(assert (=> b!536144 (=> (not res!331352) (not e!311300))))

(declare-datatypes ((array!33964 0))(
  ( (array!33965 (arr!16321 (Array (_ BitVec 32) (_ BitVec 64))) (size!16685 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33964)

(declare-datatypes ((List!10440 0))(
  ( (Nil!10437) (Cons!10436 (h!11379 (_ BitVec 64)) (t!16668 List!10440)) )
))
(declare-fun arrayNoDuplicates!0 (array!33964 (_ BitVec 32) List!10440) Bool)

(assert (=> b!536144 (= res!331352 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10437))))

(declare-fun b!536145 () Bool)

(declare-fun res!331349 () Bool)

(assert (=> b!536145 (=> (not res!331349) (not e!311300))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536145 (= res!331349 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16685 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16685 a!3154)) (= (select (arr!16321 a!3154) resIndex!32) (select (arr!16321 a!3154) j!147))))))

(declare-fun b!536146 () Bool)

(declare-fun e!311304 () Bool)

(assert (=> b!536146 (= e!311304 false)))

(declare-datatypes ((SeekEntryResult!4779 0))(
  ( (MissingZero!4779 (index!21340 (_ BitVec 32))) (Found!4779 (index!21341 (_ BitVec 32))) (Intermediate!4779 (undefined!5591 Bool) (index!21342 (_ BitVec 32)) (x!50282 (_ BitVec 32))) (Undefined!4779) (MissingVacant!4779 (index!21343 (_ BitVec 32))) )
))
(declare-fun lt!246004 () SeekEntryResult!4779)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!246006 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33964 (_ BitVec 32)) SeekEntryResult!4779)

(assert (=> b!536146 (= lt!246004 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246006 (select (arr!16321 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!331351 () Bool)

(declare-fun e!311302 () Bool)

(assert (=> start!48752 (=> (not res!331351) (not e!311302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48752 (= res!331351 (validMask!0 mask!3216))))

(assert (=> start!48752 e!311302))

(assert (=> start!48752 true))

(declare-fun array_inv!12117 (array!33964) Bool)

(assert (=> start!48752 (array_inv!12117 a!3154)))

(declare-fun b!536147 () Bool)

(assert (=> b!536147 (= e!311302 e!311300)))

(declare-fun res!331361 () Bool)

(assert (=> b!536147 (=> (not res!331361) (not e!311300))))

(declare-fun lt!246007 () SeekEntryResult!4779)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536147 (= res!331361 (or (= lt!246007 (MissingZero!4779 i!1153)) (= lt!246007 (MissingVacant!4779 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33964 (_ BitVec 32)) SeekEntryResult!4779)

(assert (=> b!536147 (= lt!246007 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536148 () Bool)

(declare-fun res!331358 () Bool)

(declare-fun e!311303 () Bool)

(assert (=> b!536148 (=> (not res!331358) (not e!311303))))

(assert (=> b!536148 (= res!331358 (and (not (= (select (arr!16321 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16321 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16321 a!3154) index!1177) (select (arr!16321 a!3154) j!147)))))))

(declare-fun b!536149 () Bool)

(declare-fun res!331359 () Bool)

(assert (=> b!536149 (=> (not res!331359) (not e!311302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536149 (= res!331359 (validKeyInArray!0 k0!1998))))

(declare-fun b!536150 () Bool)

(assert (=> b!536150 (= e!311303 e!311304)))

(declare-fun res!331350 () Bool)

(assert (=> b!536150 (=> (not res!331350) (not e!311304))))

(assert (=> b!536150 (= res!331350 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246006 #b00000000000000000000000000000000) (bvslt lt!246006 (size!16685 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536150 (= lt!246006 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536151 () Bool)

(assert (=> b!536151 (= e!311300 e!311303)))

(declare-fun res!331353 () Bool)

(assert (=> b!536151 (=> (not res!331353) (not e!311303))))

(declare-fun lt!246005 () SeekEntryResult!4779)

(assert (=> b!536151 (= res!331353 (= lt!246005 (Intermediate!4779 false resIndex!32 resX!32)))))

(assert (=> b!536151 (= lt!246005 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16321 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536152 () Bool)

(declare-fun res!331356 () Bool)

(assert (=> b!536152 (=> (not res!331356) (not e!311303))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536152 (= res!331356 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16321 a!3154) j!147) mask!3216) (select (arr!16321 a!3154) j!147) a!3154 mask!3216) lt!246005))))

(declare-fun b!536153 () Bool)

(declare-fun res!331360 () Bool)

(assert (=> b!536153 (=> (not res!331360) (not e!311302))))

(assert (=> b!536153 (= res!331360 (validKeyInArray!0 (select (arr!16321 a!3154) j!147)))))

(declare-fun b!536154 () Bool)

(declare-fun res!331357 () Bool)

(assert (=> b!536154 (=> (not res!331357) (not e!311302))))

(declare-fun arrayContainsKey!0 (array!33964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536154 (= res!331357 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536155 () Bool)

(declare-fun res!331354 () Bool)

(assert (=> b!536155 (=> (not res!331354) (not e!311302))))

(assert (=> b!536155 (= res!331354 (and (= (size!16685 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16685 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16685 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536156 () Bool)

(declare-fun res!331355 () Bool)

(assert (=> b!536156 (=> (not res!331355) (not e!311300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33964 (_ BitVec 32)) Bool)

(assert (=> b!536156 (= res!331355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48752 res!331351) b!536155))

(assert (= (and b!536155 res!331354) b!536153))

(assert (= (and b!536153 res!331360) b!536149))

(assert (= (and b!536149 res!331359) b!536154))

(assert (= (and b!536154 res!331357) b!536147))

(assert (= (and b!536147 res!331361) b!536156))

(assert (= (and b!536156 res!331355) b!536144))

(assert (= (and b!536144 res!331352) b!536145))

(assert (= (and b!536145 res!331349) b!536151))

(assert (= (and b!536151 res!331353) b!536152))

(assert (= (and b!536152 res!331356) b!536148))

(assert (= (and b!536148 res!331358) b!536150))

(assert (= (and b!536150 res!331350) b!536146))

(declare-fun m!515609 () Bool)

(assert (=> b!536146 m!515609))

(assert (=> b!536146 m!515609))

(declare-fun m!515611 () Bool)

(assert (=> b!536146 m!515611))

(declare-fun m!515613 () Bool)

(assert (=> b!536149 m!515613))

(assert (=> b!536152 m!515609))

(assert (=> b!536152 m!515609))

(declare-fun m!515615 () Bool)

(assert (=> b!536152 m!515615))

(assert (=> b!536152 m!515615))

(assert (=> b!536152 m!515609))

(declare-fun m!515617 () Bool)

(assert (=> b!536152 m!515617))

(declare-fun m!515619 () Bool)

(assert (=> b!536156 m!515619))

(declare-fun m!515621 () Bool)

(assert (=> b!536154 m!515621))

(declare-fun m!515623 () Bool)

(assert (=> b!536145 m!515623))

(assert (=> b!536145 m!515609))

(declare-fun m!515625 () Bool)

(assert (=> b!536148 m!515625))

(assert (=> b!536148 m!515609))

(declare-fun m!515627 () Bool)

(assert (=> start!48752 m!515627))

(declare-fun m!515629 () Bool)

(assert (=> start!48752 m!515629))

(assert (=> b!536153 m!515609))

(assert (=> b!536153 m!515609))

(declare-fun m!515631 () Bool)

(assert (=> b!536153 m!515631))

(declare-fun m!515633 () Bool)

(assert (=> b!536144 m!515633))

(declare-fun m!515635 () Bool)

(assert (=> b!536147 m!515635))

(assert (=> b!536151 m!515609))

(assert (=> b!536151 m!515609))

(declare-fun m!515637 () Bool)

(assert (=> b!536151 m!515637))

(declare-fun m!515639 () Bool)

(assert (=> b!536150 m!515639))

(check-sat (not start!48752) (not b!536147) (not b!536151) (not b!536154) (not b!536152) (not b!536144) (not b!536153) (not b!536149) (not b!536156) (not b!536150) (not b!536146))
(check-sat)
