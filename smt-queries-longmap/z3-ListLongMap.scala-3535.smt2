; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48768 () Bool)

(assert start!48768)

(declare-fun b!536419 () Bool)

(declare-fun res!331767 () Bool)

(declare-fun e!311337 () Bool)

(assert (=> b!536419 (=> (not res!331767) (not e!311337))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33990 0))(
  ( (array!33991 (arr!16334 (Array (_ BitVec 32) (_ BitVec 64))) (size!16699 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33990)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536419 (= res!331767 (and (= (size!16699 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16699 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16699 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536420 () Bool)

(declare-fun res!331775 () Bool)

(assert (=> b!536420 (=> (not res!331775) (not e!311337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536420 (= res!331775 (validKeyInArray!0 (select (arr!16334 a!3154) j!147)))))

(declare-fun b!536421 () Bool)

(declare-fun e!311339 () Bool)

(assert (=> b!536421 (= e!311337 e!311339)))

(declare-fun res!331774 () Bool)

(assert (=> b!536421 (=> (not res!331774) (not e!311339))))

(declare-datatypes ((SeekEntryResult!4789 0))(
  ( (MissingZero!4789 (index!21380 (_ BitVec 32))) (Found!4789 (index!21381 (_ BitVec 32))) (Intermediate!4789 (undefined!5601 Bool) (index!21382 (_ BitVec 32)) (x!50327 (_ BitVec 32))) (Undefined!4789) (MissingVacant!4789 (index!21383 (_ BitVec 32))) )
))
(declare-fun lt!245940 () SeekEntryResult!4789)

(assert (=> b!536421 (= res!331774 (or (= lt!245940 (MissingZero!4789 i!1153)) (= lt!245940 (MissingVacant!4789 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33990 (_ BitVec 32)) SeekEntryResult!4789)

(assert (=> b!536421 (= lt!245940 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536422 () Bool)

(declare-fun res!331776 () Bool)

(assert (=> b!536422 (=> (not res!331776) (not e!311339))))

(declare-datatypes ((List!10492 0))(
  ( (Nil!10489) (Cons!10488 (h!11431 (_ BitVec 64)) (t!16711 List!10492)) )
))
(declare-fun arrayNoDuplicates!0 (array!33990 (_ BitVec 32) List!10492) Bool)

(assert (=> b!536422 (= res!331776 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10489))))

(declare-fun b!536423 () Bool)

(declare-fun e!311336 () Bool)

(declare-fun e!311338 () Bool)

(assert (=> b!536423 (= e!311336 e!311338)))

(declare-fun res!331771 () Bool)

(assert (=> b!536423 (=> (not res!331771) (not e!311338))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!245938 () (_ BitVec 32))

(assert (=> b!536423 (= res!331771 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245938 #b00000000000000000000000000000000) (bvslt lt!245938 (size!16699 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536423 (= lt!245938 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536424 () Bool)

(declare-fun res!331772 () Bool)

(assert (=> b!536424 (=> (not res!331772) (not e!311337))))

(declare-fun arrayContainsKey!0 (array!33990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536424 (= res!331772 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536425 () Bool)

(declare-fun res!331778 () Bool)

(assert (=> b!536425 (=> (not res!331778) (not e!311337))))

(assert (=> b!536425 (= res!331778 (validKeyInArray!0 k0!1998))))

(declare-fun b!536426 () Bool)

(declare-fun res!331766 () Bool)

(assert (=> b!536426 (=> (not res!331766) (not e!311339))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!536426 (= res!331766 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16699 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16699 a!3154)) (= (select (arr!16334 a!3154) resIndex!32) (select (arr!16334 a!3154) j!147))))))

(declare-fun res!331773 () Bool)

(assert (=> start!48768 (=> (not res!331773) (not e!311337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48768 (= res!331773 (validMask!0 mask!3216))))

(assert (=> start!48768 e!311337))

(assert (=> start!48768 true))

(declare-fun array_inv!12217 (array!33990) Bool)

(assert (=> start!48768 (array_inv!12217 a!3154)))

(declare-fun b!536427 () Bool)

(declare-fun res!331770 () Bool)

(assert (=> b!536427 (=> (not res!331770) (not e!311339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33990 (_ BitVec 32)) Bool)

(assert (=> b!536427 (= res!331770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536428 () Bool)

(declare-fun res!331769 () Bool)

(assert (=> b!536428 (=> (not res!331769) (not e!311336))))

(declare-fun lt!245941 () SeekEntryResult!4789)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33990 (_ BitVec 32)) SeekEntryResult!4789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536428 (= res!331769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16334 a!3154) j!147) mask!3216) (select (arr!16334 a!3154) j!147) a!3154 mask!3216) lt!245941))))

(declare-fun b!536429 () Bool)

(declare-fun res!331777 () Bool)

(assert (=> b!536429 (=> (not res!331777) (not e!311336))))

(assert (=> b!536429 (= res!331777 (and (not (= (select (arr!16334 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16334 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16334 a!3154) index!1177) (select (arr!16334 a!3154) j!147)))))))

(declare-fun b!536430 () Bool)

(assert (=> b!536430 (= e!311338 false)))

(declare-fun lt!245939 () SeekEntryResult!4789)

(assert (=> b!536430 (= lt!245939 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245938 (select (arr!16334 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536431 () Bool)

(assert (=> b!536431 (= e!311339 e!311336)))

(declare-fun res!331768 () Bool)

(assert (=> b!536431 (=> (not res!331768) (not e!311336))))

(assert (=> b!536431 (= res!331768 (= lt!245941 (Intermediate!4789 false resIndex!32 resX!32)))))

(assert (=> b!536431 (= lt!245941 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16334 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48768 res!331773) b!536419))

(assert (= (and b!536419 res!331767) b!536420))

(assert (= (and b!536420 res!331775) b!536425))

(assert (= (and b!536425 res!331778) b!536424))

(assert (= (and b!536424 res!331772) b!536421))

(assert (= (and b!536421 res!331774) b!536427))

(assert (= (and b!536427 res!331770) b!536422))

(assert (= (and b!536422 res!331776) b!536426))

(assert (= (and b!536426 res!331766) b!536431))

(assert (= (and b!536431 res!331768) b!536428))

(assert (= (and b!536428 res!331769) b!536429))

(assert (= (and b!536429 res!331777) b!536423))

(assert (= (and b!536423 res!331771) b!536430))

(declare-fun m!515305 () Bool)

(assert (=> start!48768 m!515305))

(declare-fun m!515307 () Bool)

(assert (=> start!48768 m!515307))

(declare-fun m!515309 () Bool)

(assert (=> b!536421 m!515309))

(declare-fun m!515311 () Bool)

(assert (=> b!536425 m!515311))

(declare-fun m!515313 () Bool)

(assert (=> b!536422 m!515313))

(declare-fun m!515315 () Bool)

(assert (=> b!536423 m!515315))

(declare-fun m!515317 () Bool)

(assert (=> b!536427 m!515317))

(declare-fun m!515319 () Bool)

(assert (=> b!536424 m!515319))

(declare-fun m!515321 () Bool)

(assert (=> b!536428 m!515321))

(assert (=> b!536428 m!515321))

(declare-fun m!515323 () Bool)

(assert (=> b!536428 m!515323))

(assert (=> b!536428 m!515323))

(assert (=> b!536428 m!515321))

(declare-fun m!515325 () Bool)

(assert (=> b!536428 m!515325))

(assert (=> b!536420 m!515321))

(assert (=> b!536420 m!515321))

(declare-fun m!515327 () Bool)

(assert (=> b!536420 m!515327))

(assert (=> b!536431 m!515321))

(assert (=> b!536431 m!515321))

(declare-fun m!515329 () Bool)

(assert (=> b!536431 m!515329))

(declare-fun m!515331 () Bool)

(assert (=> b!536426 m!515331))

(assert (=> b!536426 m!515321))

(declare-fun m!515333 () Bool)

(assert (=> b!536429 m!515333))

(assert (=> b!536429 m!515321))

(assert (=> b!536430 m!515321))

(assert (=> b!536430 m!515321))

(declare-fun m!515335 () Bool)

(assert (=> b!536430 m!515335))

(check-sat (not b!536424) (not start!48768) (not b!536422) (not b!536430) (not b!536428) (not b!536425) (not b!536427) (not b!536420) (not b!536421) (not b!536431) (not b!536423))
(check-sat)
