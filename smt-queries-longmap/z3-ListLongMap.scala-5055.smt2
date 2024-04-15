; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68820 () Bool)

(assert start!68820)

(declare-fun b!802302 () Bool)

(declare-fun res!546966 () Bool)

(declare-fun e!444613 () Bool)

(assert (=> b!802302 (=> (not res!546966) (not e!444613))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43627 0))(
  ( (array!43628 (arr!20894 (Array (_ BitVec 32) (_ BitVec 64))) (size!21315 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43627)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802302 (= res!546966 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21315 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20894 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21315 a!3170)) (= (select (arr!20894 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802303 () Bool)

(declare-fun e!444611 () Bool)

(assert (=> b!802303 (= e!444613 e!444611)))

(declare-fun res!546964 () Bool)

(assert (=> b!802303 (=> (not res!546964) (not e!444611))))

(declare-datatypes ((SeekEntryResult!8482 0))(
  ( (MissingZero!8482 (index!36296 (_ BitVec 32))) (Found!8482 (index!36297 (_ BitVec 32))) (Intermediate!8482 (undefined!9294 Bool) (index!36298 (_ BitVec 32)) (x!67155 (_ BitVec 32))) (Undefined!8482) (MissingVacant!8482 (index!36299 (_ BitVec 32))) )
))
(declare-fun lt!358694 () SeekEntryResult!8482)

(declare-fun lt!358689 () SeekEntryResult!8482)

(assert (=> b!802303 (= res!546964 (= lt!358694 lt!358689))))

(declare-fun lt!358685 () array!43627)

(declare-fun lt!358692 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43627 (_ BitVec 32)) SeekEntryResult!8482)

(assert (=> b!802303 (= lt!358689 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358692 lt!358685 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43627 (_ BitVec 32)) SeekEntryResult!8482)

(assert (=> b!802303 (= lt!358694 (seekEntryOrOpen!0 lt!358692 lt!358685 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802303 (= lt!358692 (select (store (arr!20894 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802303 (= lt!358685 (array!43628 (store (arr!20894 a!3170) i!1163 k0!2044) (size!21315 a!3170)))))

(declare-fun b!802304 () Bool)

(declare-fun res!546963 () Bool)

(assert (=> b!802304 (=> (not res!546963) (not e!444613))))

(declare-datatypes ((List!14896 0))(
  ( (Nil!14893) (Cons!14892 (h!16021 (_ BitVec 64)) (t!21202 List!14896)) )
))
(declare-fun arrayNoDuplicates!0 (array!43627 (_ BitVec 32) List!14896) Bool)

(assert (=> b!802304 (= res!546963 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14893))))

(declare-fun b!802305 () Bool)

(declare-fun res!546971 () Bool)

(declare-fun e!444614 () Bool)

(assert (=> b!802305 (=> (not res!546971) (not e!444614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802305 (= res!546971 (validKeyInArray!0 k0!2044))))

(declare-fun b!802306 () Bool)

(declare-fun res!546967 () Bool)

(assert (=> b!802306 (=> (not res!546967) (not e!444614))))

(assert (=> b!802306 (= res!546967 (and (= (size!21315 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21315 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21315 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802307 () Bool)

(declare-fun res!546970 () Bool)

(assert (=> b!802307 (=> (not res!546970) (not e!444614))))

(assert (=> b!802307 (= res!546970 (validKeyInArray!0 (select (arr!20894 a!3170) j!153)))))

(declare-fun b!802308 () Bool)

(declare-fun res!546965 () Bool)

(assert (=> b!802308 (=> (not res!546965) (not e!444613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43627 (_ BitVec 32)) Bool)

(assert (=> b!802308 (= res!546965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802309 () Bool)

(declare-fun e!444612 () Bool)

(assert (=> b!802309 (= e!444611 e!444612)))

(declare-fun res!546962 () Bool)

(assert (=> b!802309 (=> (not res!546962) (not e!444612))))

(declare-fun lt!358693 () SeekEntryResult!8482)

(declare-fun lt!358690 () SeekEntryResult!8482)

(assert (=> b!802309 (= res!546962 (= lt!358693 lt!358690))))

(assert (=> b!802309 (= lt!358690 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20894 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802309 (= lt!358693 (seekEntryOrOpen!0 (select (arr!20894 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802310 () Bool)

(declare-fun res!546969 () Bool)

(assert (=> b!802310 (=> (not res!546969) (not e!444614))))

(declare-fun arrayContainsKey!0 (array!43627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802310 (= res!546969 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!546972 () Bool)

(assert (=> start!68820 (=> (not res!546972) (not e!444614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68820 (= res!546972 (validMask!0 mask!3266))))

(assert (=> start!68820 e!444614))

(assert (=> start!68820 true))

(declare-fun array_inv!16777 (array!43627) Bool)

(assert (=> start!68820 (array_inv!16777 a!3170)))

(declare-fun b!802311 () Bool)

(declare-fun e!444616 () Bool)

(assert (=> b!802311 (= e!444612 e!444616)))

(declare-fun res!546961 () Bool)

(assert (=> b!802311 (=> (not res!546961) (not e!444616))))

(declare-fun lt!358688 () SeekEntryResult!8482)

(assert (=> b!802311 (= res!546961 (and (= lt!358690 lt!358688) (not (= (select (arr!20894 a!3170) index!1236) (select (arr!20894 a!3170) j!153)))))))

(assert (=> b!802311 (= lt!358688 (Found!8482 j!153))))

(declare-fun b!802312 () Bool)

(assert (=> b!802312 (= e!444616 (not (or (not (= lt!358689 lt!358688)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun lt!358691 () (_ BitVec 32))

(assert (=> b!802312 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358691 vacantAfter!23 lt!358692 lt!358685 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358691 vacantBefore!23 (select (arr!20894 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27478 0))(
  ( (Unit!27479) )
))
(declare-fun lt!358686 () Unit!27478)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43627 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27478)

(assert (=> b!802312 (= lt!358686 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358691 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802312 (= lt!358691 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802313 () Bool)

(assert (=> b!802313 (= e!444614 e!444613)))

(declare-fun res!546968 () Bool)

(assert (=> b!802313 (=> (not res!546968) (not e!444613))))

(declare-fun lt!358687 () SeekEntryResult!8482)

(assert (=> b!802313 (= res!546968 (or (= lt!358687 (MissingZero!8482 i!1163)) (= lt!358687 (MissingVacant!8482 i!1163))))))

(assert (=> b!802313 (= lt!358687 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68820 res!546972) b!802306))

(assert (= (and b!802306 res!546967) b!802307))

(assert (= (and b!802307 res!546970) b!802305))

(assert (= (and b!802305 res!546971) b!802310))

(assert (= (and b!802310 res!546969) b!802313))

(assert (= (and b!802313 res!546968) b!802308))

(assert (= (and b!802308 res!546965) b!802304))

(assert (= (and b!802304 res!546963) b!802302))

(assert (= (and b!802302 res!546966) b!802303))

(assert (= (and b!802303 res!546964) b!802309))

(assert (= (and b!802309 res!546962) b!802311))

(assert (= (and b!802311 res!546961) b!802312))

(declare-fun m!743299 () Bool)

(assert (=> b!802302 m!743299))

(declare-fun m!743301 () Bool)

(assert (=> b!802302 m!743301))

(declare-fun m!743303 () Bool)

(assert (=> b!802304 m!743303))

(declare-fun m!743305 () Bool)

(assert (=> b!802305 m!743305))

(declare-fun m!743307 () Bool)

(assert (=> b!802310 m!743307))

(declare-fun m!743309 () Bool)

(assert (=> b!802303 m!743309))

(declare-fun m!743311 () Bool)

(assert (=> b!802303 m!743311))

(declare-fun m!743313 () Bool)

(assert (=> b!802303 m!743313))

(declare-fun m!743315 () Bool)

(assert (=> b!802303 m!743315))

(declare-fun m!743317 () Bool)

(assert (=> b!802313 m!743317))

(declare-fun m!743319 () Bool)

(assert (=> b!802308 m!743319))

(declare-fun m!743321 () Bool)

(assert (=> b!802311 m!743321))

(declare-fun m!743323 () Bool)

(assert (=> b!802311 m!743323))

(assert (=> b!802307 m!743323))

(assert (=> b!802307 m!743323))

(declare-fun m!743325 () Bool)

(assert (=> b!802307 m!743325))

(assert (=> b!802309 m!743323))

(assert (=> b!802309 m!743323))

(declare-fun m!743327 () Bool)

(assert (=> b!802309 m!743327))

(assert (=> b!802309 m!743323))

(declare-fun m!743329 () Bool)

(assert (=> b!802309 m!743329))

(assert (=> b!802312 m!743323))

(declare-fun m!743331 () Bool)

(assert (=> b!802312 m!743331))

(declare-fun m!743333 () Bool)

(assert (=> b!802312 m!743333))

(declare-fun m!743335 () Bool)

(assert (=> b!802312 m!743335))

(assert (=> b!802312 m!743323))

(declare-fun m!743337 () Bool)

(assert (=> b!802312 m!743337))

(declare-fun m!743339 () Bool)

(assert (=> start!68820 m!743339))

(declare-fun m!743341 () Bool)

(assert (=> start!68820 m!743341))

(check-sat (not b!802305) (not b!802310) (not b!802309) (not b!802313) (not start!68820) (not b!802312) (not b!802307) (not b!802304) (not b!802303) (not b!802308))
(check-sat)
