; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48404 () Bool)

(assert start!48404)

(declare-fun e!309760 () Bool)

(declare-fun b!531880 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33712 0))(
  ( (array!33713 (arr!16198 (Array (_ BitVec 32) (_ BitVec 64))) (size!16562 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33712)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!531880 (= e!309760 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16562 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16562 a!3154)) (= (select (arr!16198 a!3154) resIndex!32) (select (arr!16198 a!3154) j!147)) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!531881 () Bool)

(declare-fun res!327377 () Bool)

(declare-fun e!309761 () Bool)

(assert (=> b!531881 (=> (not res!327377) (not e!309761))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531881 (= res!327377 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!327376 () Bool)

(assert (=> start!48404 (=> (not res!327376) (not e!309761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48404 (= res!327376 (validMask!0 mask!3216))))

(assert (=> start!48404 e!309761))

(assert (=> start!48404 true))

(declare-fun array_inv!11994 (array!33712) Bool)

(assert (=> start!48404 (array_inv!11994 a!3154)))

(declare-fun b!531882 () Bool)

(declare-fun res!327375 () Bool)

(assert (=> b!531882 (=> (not res!327375) (not e!309760))))

(declare-datatypes ((List!10317 0))(
  ( (Nil!10314) (Cons!10313 (h!11253 (_ BitVec 64)) (t!16545 List!10317)) )
))
(declare-fun arrayNoDuplicates!0 (array!33712 (_ BitVec 32) List!10317) Bool)

(assert (=> b!531882 (= res!327375 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10314))))

(declare-fun b!531883 () Bool)

(assert (=> b!531883 (= e!309761 e!309760)))

(declare-fun res!327374 () Bool)

(assert (=> b!531883 (=> (not res!327374) (not e!309760))))

(declare-datatypes ((SeekEntryResult!4656 0))(
  ( (MissingZero!4656 (index!20848 (_ BitVec 32))) (Found!4656 (index!20849 (_ BitVec 32))) (Intermediate!4656 (undefined!5468 Bool) (index!20850 (_ BitVec 32)) (x!49822 (_ BitVec 32))) (Undefined!4656) (MissingVacant!4656 (index!20851 (_ BitVec 32))) )
))
(declare-fun lt!245089 () SeekEntryResult!4656)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531883 (= res!327374 (or (= lt!245089 (MissingZero!4656 i!1153)) (= lt!245089 (MissingVacant!4656 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33712 (_ BitVec 32)) SeekEntryResult!4656)

(assert (=> b!531883 (= lt!245089 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531884 () Bool)

(declare-fun res!327373 () Bool)

(assert (=> b!531884 (=> (not res!327373) (not e!309760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33712 (_ BitVec 32)) Bool)

(assert (=> b!531884 (= res!327373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531885 () Bool)

(declare-fun res!327372 () Bool)

(assert (=> b!531885 (=> (not res!327372) (not e!309761))))

(assert (=> b!531885 (= res!327372 (and (= (size!16562 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16562 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16562 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531886 () Bool)

(declare-fun res!327371 () Bool)

(assert (=> b!531886 (=> (not res!327371) (not e!309761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531886 (= res!327371 (validKeyInArray!0 (select (arr!16198 a!3154) j!147)))))

(declare-fun b!531887 () Bool)

(declare-fun res!327370 () Bool)

(assert (=> b!531887 (=> (not res!327370) (not e!309761))))

(assert (=> b!531887 (= res!327370 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48404 res!327376) b!531885))

(assert (= (and b!531885 res!327372) b!531886))

(assert (= (and b!531886 res!327371) b!531887))

(assert (= (and b!531887 res!327370) b!531881))

(assert (= (and b!531881 res!327377) b!531883))

(assert (= (and b!531883 res!327374) b!531884))

(assert (= (and b!531884 res!327373) b!531882))

(assert (= (and b!531882 res!327375) b!531880))

(declare-fun m!512219 () Bool)

(assert (=> b!531887 m!512219))

(declare-fun m!512221 () Bool)

(assert (=> b!531886 m!512221))

(assert (=> b!531886 m!512221))

(declare-fun m!512223 () Bool)

(assert (=> b!531886 m!512223))

(declare-fun m!512225 () Bool)

(assert (=> start!48404 m!512225))

(declare-fun m!512227 () Bool)

(assert (=> start!48404 m!512227))

(declare-fun m!512229 () Bool)

(assert (=> b!531882 m!512229))

(declare-fun m!512231 () Bool)

(assert (=> b!531884 m!512231))

(declare-fun m!512233 () Bool)

(assert (=> b!531880 m!512233))

(assert (=> b!531880 m!512221))

(declare-fun m!512235 () Bool)

(assert (=> b!531883 m!512235))

(declare-fun m!512237 () Bool)

(assert (=> b!531881 m!512237))

(check-sat (not b!531882) (not b!531883) (not b!531887) (not b!531886) (not b!531884) (not b!531881) (not start!48404))
(check-sat)
