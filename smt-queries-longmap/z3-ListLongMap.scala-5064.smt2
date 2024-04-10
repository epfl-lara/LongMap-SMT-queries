; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68896 () Bool)

(assert start!68896)

(declare-fun b!803537 () Bool)

(declare-fun e!445250 () Bool)

(declare-fun e!445248 () Bool)

(assert (=> b!803537 (= e!445250 e!445248)))

(declare-fun res!548056 () Bool)

(assert (=> b!803537 (=> (not res!548056) (not e!445248))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359670 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43686 0))(
  ( (array!43687 (arr!20923 (Array (_ BitVec 32) (_ BitVec 64))) (size!21344 (_ BitVec 32))) )
))
(declare-fun lt!359672 () array!43686)

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8514 0))(
  ( (MissingZero!8514 (index!36424 (_ BitVec 32))) (Found!8514 (index!36425 (_ BitVec 32))) (Intermediate!8514 (undefined!9326 Bool) (index!36426 (_ BitVec 32)) (x!67264 (_ BitVec 32))) (Undefined!8514) (MissingVacant!8514 (index!36427 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43686 (_ BitVec 32)) SeekEntryResult!8514)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43686 (_ BitVec 32)) SeekEntryResult!8514)

(assert (=> b!803537 (= res!548056 (= (seekEntryOrOpen!0 lt!359670 lt!359672 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359670 lt!359672 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43686)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803537 (= lt!359670 (select (store (arr!20923 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803537 (= lt!359672 (array!43687 (store (arr!20923 a!3170) i!1163 k0!2044) (size!21344 a!3170)))))

(declare-fun b!803538 () Bool)

(declare-fun e!445249 () Bool)

(assert (=> b!803538 (= e!445249 (not true))))

(declare-fun lt!359675 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803538 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359675 vacantAfter!23 lt!359670 lt!359672 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359675 vacantBefore!23 (select (arr!20923 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27568 0))(
  ( (Unit!27569) )
))
(declare-fun lt!359669 () Unit!27568)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43686 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27568)

(assert (=> b!803538 (= lt!359669 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359675 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803538 (= lt!359675 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803539 () Bool)

(declare-fun res!548061 () Bool)

(assert (=> b!803539 (=> (not res!548061) (not e!445250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43686 (_ BitVec 32)) Bool)

(assert (=> b!803539 (= res!548061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!548059 () Bool)

(declare-fun e!445246 () Bool)

(assert (=> start!68896 (=> (not res!548059) (not e!445246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68896 (= res!548059 (validMask!0 mask!3266))))

(assert (=> start!68896 e!445246))

(assert (=> start!68896 true))

(declare-fun array_inv!16719 (array!43686) Bool)

(assert (=> start!68896 (array_inv!16719 a!3170)))

(declare-fun b!803540 () Bool)

(declare-fun res!548063 () Bool)

(assert (=> b!803540 (=> (not res!548063) (not e!445246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803540 (= res!548063 (validKeyInArray!0 k0!2044))))

(declare-fun b!803541 () Bool)

(declare-fun res!548066 () Bool)

(assert (=> b!803541 (=> (not res!548066) (not e!445246))))

(assert (=> b!803541 (= res!548066 (and (= (size!21344 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21344 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21344 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803542 () Bool)

(declare-fun res!548057 () Bool)

(assert (=> b!803542 (=> (not res!548057) (not e!445246))))

(assert (=> b!803542 (= res!548057 (validKeyInArray!0 (select (arr!20923 a!3170) j!153)))))

(declare-fun b!803543 () Bool)

(assert (=> b!803543 (= e!445246 e!445250)))

(declare-fun res!548064 () Bool)

(assert (=> b!803543 (=> (not res!548064) (not e!445250))))

(declare-fun lt!359674 () SeekEntryResult!8514)

(assert (=> b!803543 (= res!548064 (or (= lt!359674 (MissingZero!8514 i!1163)) (= lt!359674 (MissingVacant!8514 i!1163))))))

(assert (=> b!803543 (= lt!359674 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803544 () Bool)

(declare-fun res!548060 () Bool)

(assert (=> b!803544 (=> (not res!548060) (not e!445250))))

(declare-datatypes ((List!14886 0))(
  ( (Nil!14883) (Cons!14882 (h!16011 (_ BitVec 64)) (t!21201 List!14886)) )
))
(declare-fun arrayNoDuplicates!0 (array!43686 (_ BitVec 32) List!14886) Bool)

(assert (=> b!803544 (= res!548060 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14883))))

(declare-fun b!803545 () Bool)

(declare-fun res!548058 () Bool)

(assert (=> b!803545 (=> (not res!548058) (not e!445250))))

(assert (=> b!803545 (= res!548058 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21344 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20923 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21344 a!3170)) (= (select (arr!20923 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803546 () Bool)

(declare-fun res!548062 () Bool)

(assert (=> b!803546 (=> (not res!548062) (not e!445246))))

(declare-fun arrayContainsKey!0 (array!43686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803546 (= res!548062 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803547 () Bool)

(assert (=> b!803547 (= e!445248 e!445249)))

(declare-fun res!548065 () Bool)

(assert (=> b!803547 (=> (not res!548065) (not e!445249))))

(declare-fun lt!359671 () SeekEntryResult!8514)

(declare-fun lt!359673 () SeekEntryResult!8514)

(assert (=> b!803547 (= res!548065 (and (= lt!359671 lt!359673) (= lt!359673 (Found!8514 j!153)) (not (= (select (arr!20923 a!3170) index!1236) (select (arr!20923 a!3170) j!153)))))))

(assert (=> b!803547 (= lt!359673 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20923 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803547 (= lt!359671 (seekEntryOrOpen!0 (select (arr!20923 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68896 res!548059) b!803541))

(assert (= (and b!803541 res!548066) b!803542))

(assert (= (and b!803542 res!548057) b!803540))

(assert (= (and b!803540 res!548063) b!803546))

(assert (= (and b!803546 res!548062) b!803543))

(assert (= (and b!803543 res!548064) b!803539))

(assert (= (and b!803539 res!548061) b!803544))

(assert (= (and b!803544 res!548060) b!803545))

(assert (= (and b!803545 res!548058) b!803537))

(assert (= (and b!803537 res!548056) b!803547))

(assert (= (and b!803547 res!548065) b!803538))

(declare-fun m!745291 () Bool)

(assert (=> b!803537 m!745291))

(declare-fun m!745293 () Bool)

(assert (=> b!803537 m!745293))

(declare-fun m!745295 () Bool)

(assert (=> b!803537 m!745295))

(declare-fun m!745297 () Bool)

(assert (=> b!803537 m!745297))

(declare-fun m!745299 () Bool)

(assert (=> b!803544 m!745299))

(declare-fun m!745301 () Bool)

(assert (=> start!68896 m!745301))

(declare-fun m!745303 () Bool)

(assert (=> start!68896 m!745303))

(declare-fun m!745305 () Bool)

(assert (=> b!803545 m!745305))

(declare-fun m!745307 () Bool)

(assert (=> b!803545 m!745307))

(declare-fun m!745309 () Bool)

(assert (=> b!803538 m!745309))

(declare-fun m!745311 () Bool)

(assert (=> b!803538 m!745311))

(declare-fun m!745313 () Bool)

(assert (=> b!803538 m!745313))

(declare-fun m!745315 () Bool)

(assert (=> b!803538 m!745315))

(assert (=> b!803538 m!745309))

(declare-fun m!745317 () Bool)

(assert (=> b!803538 m!745317))

(declare-fun m!745319 () Bool)

(assert (=> b!803543 m!745319))

(declare-fun m!745321 () Bool)

(assert (=> b!803540 m!745321))

(declare-fun m!745323 () Bool)

(assert (=> b!803547 m!745323))

(assert (=> b!803547 m!745309))

(assert (=> b!803547 m!745309))

(declare-fun m!745325 () Bool)

(assert (=> b!803547 m!745325))

(assert (=> b!803547 m!745309))

(declare-fun m!745327 () Bool)

(assert (=> b!803547 m!745327))

(declare-fun m!745329 () Bool)

(assert (=> b!803539 m!745329))

(assert (=> b!803542 m!745309))

(assert (=> b!803542 m!745309))

(declare-fun m!745331 () Bool)

(assert (=> b!803542 m!745331))

(declare-fun m!745333 () Bool)

(assert (=> b!803546 m!745333))

(check-sat (not b!803543) (not b!803539) (not b!803544) (not start!68896) (not b!803546) (not b!803542) (not b!803538) (not b!803547) (not b!803537) (not b!803540))
(check-sat)
