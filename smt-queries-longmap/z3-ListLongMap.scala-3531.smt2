; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48802 () Bool)

(assert start!48802)

(declare-fun b!536422 () Bool)

(declare-fun res!331533 () Bool)

(declare-fun e!311459 () Bool)

(assert (=> b!536422 (=> (not res!331533) (not e!311459))))

(declare-datatypes ((array!33962 0))(
  ( (array!33963 (arr!16318 (Array (_ BitVec 32) (_ BitVec 64))) (size!16682 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33962)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536422 (= res!331533 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536423 () Bool)

(declare-fun res!331529 () Bool)

(declare-fun e!311462 () Bool)

(assert (=> b!536423 (=> (not res!331529) (not e!311462))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4732 0))(
  ( (MissingZero!4732 (index!21152 (_ BitVec 32))) (Found!4732 (index!21153 (_ BitVec 32))) (Intermediate!4732 (undefined!5544 Bool) (index!21154 (_ BitVec 32)) (x!50246 (_ BitVec 32))) (Undefined!4732) (MissingVacant!4732 (index!21155 (_ BitVec 32))) )
))
(declare-fun lt!246139 () SeekEntryResult!4732)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33962 (_ BitVec 32)) SeekEntryResult!4732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536423 (= res!331529 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16318 a!3154) j!147) mask!3216) (select (arr!16318 a!3154) j!147) a!3154 mask!3216) lt!246139))))

(declare-fun b!536424 () Bool)

(declare-fun e!311463 () Bool)

(assert (=> b!536424 (= e!311463 false)))

(declare-fun lt!246138 () SeekEntryResult!4732)

(declare-fun lt!246136 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!536424 (= lt!246138 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246136 (select (arr!16318 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!331528 () Bool)

(assert (=> start!48802 (=> (not res!331528) (not e!311459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48802 (= res!331528 (validMask!0 mask!3216))))

(assert (=> start!48802 e!311459))

(assert (=> start!48802 true))

(declare-fun array_inv!12177 (array!33962) Bool)

(assert (=> start!48802 (array_inv!12177 a!3154)))

(declare-fun b!536425 () Bool)

(declare-fun e!311461 () Bool)

(assert (=> b!536425 (= e!311459 e!311461)))

(declare-fun res!331523 () Bool)

(assert (=> b!536425 (=> (not res!331523) (not e!311461))))

(declare-fun lt!246137 () SeekEntryResult!4732)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536425 (= res!331523 (or (= lt!246137 (MissingZero!4732 i!1153)) (= lt!246137 (MissingVacant!4732 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33962 (_ BitVec 32)) SeekEntryResult!4732)

(assert (=> b!536425 (= lt!246137 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536426 () Bool)

(declare-fun res!331527 () Bool)

(assert (=> b!536426 (=> (not res!331527) (not e!311461))))

(declare-datatypes ((List!10344 0))(
  ( (Nil!10341) (Cons!10340 (h!11286 (_ BitVec 64)) (t!16564 List!10344)) )
))
(declare-fun arrayNoDuplicates!0 (array!33962 (_ BitVec 32) List!10344) Bool)

(assert (=> b!536426 (= res!331527 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10341))))

(declare-fun b!536427 () Bool)

(declare-fun res!331532 () Bool)

(assert (=> b!536427 (=> (not res!331532) (not e!311461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33962 (_ BitVec 32)) Bool)

(assert (=> b!536427 (= res!331532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536428 () Bool)

(declare-fun res!331531 () Bool)

(assert (=> b!536428 (=> (not res!331531) (not e!311459))))

(assert (=> b!536428 (= res!331531 (and (= (size!16682 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16682 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16682 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536429 () Bool)

(declare-fun res!331534 () Bool)

(assert (=> b!536429 (=> (not res!331534) (not e!311462))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536429 (= res!331534 (and (not (= (select (arr!16318 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16318 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16318 a!3154) index!1177) (select (arr!16318 a!3154) j!147)))))))

(declare-fun b!536430 () Bool)

(declare-fun res!331522 () Bool)

(assert (=> b!536430 (=> (not res!331522) (not e!311459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536430 (= res!331522 (validKeyInArray!0 k0!1998))))

(declare-fun b!536431 () Bool)

(declare-fun res!331526 () Bool)

(assert (=> b!536431 (=> (not res!331526) (not e!311461))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536431 (= res!331526 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16682 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16682 a!3154)) (= (select (arr!16318 a!3154) resIndex!32) (select (arr!16318 a!3154) j!147))))))

(declare-fun b!536432 () Bool)

(declare-fun res!331525 () Bool)

(assert (=> b!536432 (=> (not res!331525) (not e!311459))))

(assert (=> b!536432 (= res!331525 (validKeyInArray!0 (select (arr!16318 a!3154) j!147)))))

(declare-fun b!536433 () Bool)

(assert (=> b!536433 (= e!311461 e!311462)))

(declare-fun res!331524 () Bool)

(assert (=> b!536433 (=> (not res!331524) (not e!311462))))

(assert (=> b!536433 (= res!331524 (= lt!246139 (Intermediate!4732 false resIndex!32 resX!32)))))

(assert (=> b!536433 (= lt!246139 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16318 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536434 () Bool)

(assert (=> b!536434 (= e!311462 e!311463)))

(declare-fun res!331530 () Bool)

(assert (=> b!536434 (=> (not res!331530) (not e!311463))))

(assert (=> b!536434 (= res!331530 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246136 #b00000000000000000000000000000000) (bvslt lt!246136 (size!16682 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536434 (= lt!246136 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(assert (= (and start!48802 res!331528) b!536428))

(assert (= (and b!536428 res!331531) b!536432))

(assert (= (and b!536432 res!331525) b!536430))

(assert (= (and b!536430 res!331522) b!536422))

(assert (= (and b!536422 res!331533) b!536425))

(assert (= (and b!536425 res!331523) b!536427))

(assert (= (and b!536427 res!331532) b!536426))

(assert (= (and b!536426 res!331527) b!536431))

(assert (= (and b!536431 res!331526) b!536433))

(assert (= (and b!536433 res!331524) b!536423))

(assert (= (and b!536423 res!331529) b!536429))

(assert (= (and b!536429 res!331534) b!536434))

(assert (= (and b!536434 res!331530) b!536424))

(declare-fun m!515995 () Bool)

(assert (=> b!536431 m!515995))

(declare-fun m!515997 () Bool)

(assert (=> b!536431 m!515997))

(declare-fun m!515999 () Bool)

(assert (=> b!536426 m!515999))

(declare-fun m!516001 () Bool)

(assert (=> b!536430 m!516001))

(assert (=> b!536433 m!515997))

(assert (=> b!536433 m!515997))

(declare-fun m!516003 () Bool)

(assert (=> b!536433 m!516003))

(assert (=> b!536423 m!515997))

(assert (=> b!536423 m!515997))

(declare-fun m!516005 () Bool)

(assert (=> b!536423 m!516005))

(assert (=> b!536423 m!516005))

(assert (=> b!536423 m!515997))

(declare-fun m!516007 () Bool)

(assert (=> b!536423 m!516007))

(assert (=> b!536424 m!515997))

(assert (=> b!536424 m!515997))

(declare-fun m!516009 () Bool)

(assert (=> b!536424 m!516009))

(declare-fun m!516011 () Bool)

(assert (=> start!48802 m!516011))

(declare-fun m!516013 () Bool)

(assert (=> start!48802 m!516013))

(declare-fun m!516015 () Bool)

(assert (=> b!536425 m!516015))

(declare-fun m!516017 () Bool)

(assert (=> b!536429 m!516017))

(assert (=> b!536429 m!515997))

(declare-fun m!516019 () Bool)

(assert (=> b!536434 m!516019))

(declare-fun m!516021 () Bool)

(assert (=> b!536427 m!516021))

(declare-fun m!516023 () Bool)

(assert (=> b!536422 m!516023))

(assert (=> b!536432 m!515997))

(assert (=> b!536432 m!515997))

(declare-fun m!516025 () Bool)

(assert (=> b!536432 m!516025))

(check-sat (not b!536433) (not b!536425) (not b!536426) (not b!536434) (not b!536422) (not b!536430) (not b!536432) (not b!536423) (not b!536427) (not b!536424) (not start!48802))
(check-sat)
