; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68634 () Bool)

(assert start!68634)

(declare-fun b!798830 () Bool)

(declare-fun e!443012 () Bool)

(declare-fun e!443014 () Bool)

(assert (=> b!798830 (= e!443012 e!443014)))

(declare-fun res!543501 () Bool)

(assert (=> b!798830 (=> (not res!543501) (not e!443014))))

(declare-datatypes ((SeekEntryResult!8389 0))(
  ( (MissingZero!8389 (index!35924 (_ BitVec 32))) (Found!8389 (index!35925 (_ BitVec 32))) (Intermediate!8389 (undefined!9201 Bool) (index!35926 (_ BitVec 32)) (x!66814 (_ BitVec 32))) (Undefined!8389) (MissingVacant!8389 (index!35927 (_ BitVec 32))) )
))
(declare-fun lt!356530 () SeekEntryResult!8389)

(declare-datatypes ((array!43441 0))(
  ( (array!43442 (arr!20801 (Array (_ BitVec 32) (_ BitVec 64))) (size!21222 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43441)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!356534 () SeekEntryResult!8389)

(assert (=> b!798830 (= res!543501 (and (= lt!356534 lt!356530) (= lt!356530 (Found!8389 j!153)) (not (= (select (arr!20801 a!3170) index!1236) (select (arr!20801 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43441 (_ BitVec 32)) SeekEntryResult!8389)

(assert (=> b!798830 (= lt!356530 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20801 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43441 (_ BitVec 32)) SeekEntryResult!8389)

(assert (=> b!798830 (= lt!356534 (seekEntryOrOpen!0 (select (arr!20801 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798832 () Bool)

(declare-fun e!443009 () Bool)

(declare-fun e!443010 () Bool)

(assert (=> b!798832 (= e!443009 e!443010)))

(declare-fun res!543498 () Bool)

(assert (=> b!798832 (=> (not res!543498) (not e!443010))))

(declare-fun lt!356535 () SeekEntryResult!8389)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798832 (= res!543498 (or (= lt!356535 (MissingZero!8389 i!1163)) (= lt!356535 (MissingVacant!8389 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!798832 (= lt!356535 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798833 () Bool)

(declare-fun res!543489 () Bool)

(assert (=> b!798833 (=> (not res!543489) (not e!443010))))

(declare-datatypes ((List!14803 0))(
  ( (Nil!14800) (Cons!14799 (h!15928 (_ BitVec 64)) (t!21109 List!14803)) )
))
(declare-fun arrayNoDuplicates!0 (array!43441 (_ BitVec 32) List!14803) Bool)

(assert (=> b!798833 (= res!543489 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14800))))

(declare-fun b!798834 () Bool)

(declare-fun res!543490 () Bool)

(assert (=> b!798834 (=> (not res!543490) (not e!443009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798834 (= res!543490 (validKeyInArray!0 k0!2044))))

(declare-fun b!798835 () Bool)

(assert (=> b!798835 (= e!443010 e!443012)))

(declare-fun res!543497 () Bool)

(assert (=> b!798835 (=> (not res!543497) (not e!443012))))

(declare-fun lt!356533 () SeekEntryResult!8389)

(declare-fun lt!356537 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356536 () array!43441)

(assert (=> b!798835 (= res!543497 (= lt!356533 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356537 lt!356536 mask!3266)))))

(assert (=> b!798835 (= lt!356533 (seekEntryOrOpen!0 lt!356537 lt!356536 mask!3266))))

(assert (=> b!798835 (= lt!356537 (select (store (arr!20801 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798835 (= lt!356536 (array!43442 (store (arr!20801 a!3170) i!1163 k0!2044) (size!21222 a!3170)))))

(declare-fun b!798836 () Bool)

(declare-fun res!543491 () Bool)

(assert (=> b!798836 (=> (not res!543491) (not e!443010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43441 (_ BitVec 32)) Bool)

(assert (=> b!798836 (= res!543491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798837 () Bool)

(declare-fun res!543493 () Bool)

(assert (=> b!798837 (=> (not res!543493) (not e!443010))))

(assert (=> b!798837 (= res!543493 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21222 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20801 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21222 a!3170)) (= (select (arr!20801 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798838 () Bool)

(declare-fun e!443011 () Bool)

(assert (=> b!798838 (= e!443011 false)))

(declare-fun lt!356531 () (_ BitVec 32))

(declare-fun lt!356532 () SeekEntryResult!8389)

(assert (=> b!798838 (= lt!356532 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356531 vacantBefore!23 (select (arr!20801 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798839 () Bool)

(declare-fun res!543496 () Bool)

(assert (=> b!798839 (=> (not res!543496) (not e!443011))))

(assert (=> b!798839 (= res!543496 (= lt!356533 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356531 vacantAfter!23 lt!356537 lt!356536 mask!3266)))))

(declare-fun b!798840 () Bool)

(declare-fun res!543494 () Bool)

(assert (=> b!798840 (=> (not res!543494) (not e!443009))))

(assert (=> b!798840 (= res!543494 (validKeyInArray!0 (select (arr!20801 a!3170) j!153)))))

(declare-fun b!798841 () Bool)

(declare-fun res!543500 () Bool)

(assert (=> b!798841 (=> (not res!543500) (not e!443009))))

(assert (=> b!798841 (= res!543500 (and (= (size!21222 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21222 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21222 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798842 () Bool)

(assert (=> b!798842 (= e!443014 e!443011)))

(declare-fun res!543492 () Bool)

(assert (=> b!798842 (=> (not res!543492) (not e!443011))))

(assert (=> b!798842 (= res!543492 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356531 #b00000000000000000000000000000000) (bvslt lt!356531 (size!21222 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!798842 (= lt!356531 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!543499 () Bool)

(assert (=> start!68634 (=> (not res!543499) (not e!443009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68634 (= res!543499 (validMask!0 mask!3266))))

(assert (=> start!68634 e!443009))

(assert (=> start!68634 true))

(declare-fun array_inv!16684 (array!43441) Bool)

(assert (=> start!68634 (array_inv!16684 a!3170)))

(declare-fun b!798831 () Bool)

(declare-fun res!543495 () Bool)

(assert (=> b!798831 (=> (not res!543495) (not e!443009))))

(declare-fun arrayContainsKey!0 (array!43441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798831 (= res!543495 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68634 res!543499) b!798841))

(assert (= (and b!798841 res!543500) b!798840))

(assert (= (and b!798840 res!543494) b!798834))

(assert (= (and b!798834 res!543490) b!798831))

(assert (= (and b!798831 res!543495) b!798832))

(assert (= (and b!798832 res!543498) b!798836))

(assert (= (and b!798836 res!543491) b!798833))

(assert (= (and b!798833 res!543489) b!798837))

(assert (= (and b!798837 res!543493) b!798835))

(assert (= (and b!798835 res!543497) b!798830))

(assert (= (and b!798830 res!543501) b!798842))

(assert (= (and b!798842 res!543492) b!798839))

(assert (= (and b!798839 res!543496) b!798838))

(declare-fun m!739321 () Bool)

(assert (=> b!798838 m!739321))

(assert (=> b!798838 m!739321))

(declare-fun m!739323 () Bool)

(assert (=> b!798838 m!739323))

(assert (=> b!798840 m!739321))

(assert (=> b!798840 m!739321))

(declare-fun m!739325 () Bool)

(assert (=> b!798840 m!739325))

(declare-fun m!739327 () Bool)

(assert (=> b!798831 m!739327))

(declare-fun m!739329 () Bool)

(assert (=> b!798832 m!739329))

(declare-fun m!739331 () Bool)

(assert (=> b!798835 m!739331))

(declare-fun m!739333 () Bool)

(assert (=> b!798835 m!739333))

(declare-fun m!739335 () Bool)

(assert (=> b!798835 m!739335))

(declare-fun m!739337 () Bool)

(assert (=> b!798835 m!739337))

(declare-fun m!739339 () Bool)

(assert (=> b!798836 m!739339))

(declare-fun m!739341 () Bool)

(assert (=> b!798839 m!739341))

(declare-fun m!739343 () Bool)

(assert (=> b!798837 m!739343))

(declare-fun m!739345 () Bool)

(assert (=> b!798837 m!739345))

(declare-fun m!739347 () Bool)

(assert (=> start!68634 m!739347))

(declare-fun m!739349 () Bool)

(assert (=> start!68634 m!739349))

(declare-fun m!739351 () Bool)

(assert (=> b!798842 m!739351))

(declare-fun m!739353 () Bool)

(assert (=> b!798830 m!739353))

(assert (=> b!798830 m!739321))

(assert (=> b!798830 m!739321))

(declare-fun m!739355 () Bool)

(assert (=> b!798830 m!739355))

(assert (=> b!798830 m!739321))

(declare-fun m!739357 () Bool)

(assert (=> b!798830 m!739357))

(declare-fun m!739359 () Bool)

(assert (=> b!798833 m!739359))

(declare-fun m!739361 () Bool)

(assert (=> b!798834 m!739361))

(check-sat (not b!798833) (not b!798840) (not b!798842) (not b!798839) (not b!798838) (not b!798832) (not b!798834) (not b!798830) (not start!68634) (not b!798831) (not b!798835) (not b!798836))
(check-sat)
