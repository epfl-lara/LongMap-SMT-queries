; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69220 () Bool)

(assert start!69220)

(declare-fun b!807471 () Bool)

(declare-fun res!551598 () Bool)

(declare-fun e!447066 () Bool)

(assert (=> b!807471 (=> (not res!551598) (not e!447066))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43920 0))(
  ( (array!43921 (arr!21037 (Array (_ BitVec 32) (_ BitVec 64))) (size!21458 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43920)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!807471 (= res!551598 (and (= (size!21458 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21458 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21458 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807472 () Bool)

(declare-fun e!447068 () Bool)

(declare-fun e!447065 () Bool)

(assert (=> b!807472 (= e!447068 e!447065)))

(declare-fun res!551595 () Bool)

(assert (=> b!807472 (=> (not res!551595) (not e!447065))))

(declare-fun lt!361747 () array!43920)

(declare-fun lt!361750 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8628 0))(
  ( (MissingZero!8628 (index!36880 (_ BitVec 32))) (Found!8628 (index!36881 (_ BitVec 32))) (Intermediate!8628 (undefined!9440 Bool) (index!36882 (_ BitVec 32)) (x!67688 (_ BitVec 32))) (Undefined!8628) (MissingVacant!8628 (index!36883 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43920 (_ BitVec 32)) SeekEntryResult!8628)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43920 (_ BitVec 32)) SeekEntryResult!8628)

(assert (=> b!807472 (= res!551595 (= (seekEntryOrOpen!0 lt!361750 lt!361747 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361750 lt!361747 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!807472 (= lt!361750 (select (store (arr!21037 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807472 (= lt!361747 (array!43921 (store (arr!21037 a!3170) i!1163 k0!2044) (size!21458 a!3170)))))

(declare-fun b!807473 () Bool)

(declare-fun e!447064 () Bool)

(assert (=> b!807473 (= e!447065 e!447064)))

(declare-fun res!551603 () Bool)

(assert (=> b!807473 (=> (not res!551603) (not e!447064))))

(declare-fun lt!361748 () SeekEntryResult!8628)

(declare-fun lt!361749 () SeekEntryResult!8628)

(assert (=> b!807473 (= res!551603 (and (= lt!361749 lt!361748) (= lt!361748 (Found!8628 j!153)) (not (= (select (arr!21037 a!3170) index!1236) (select (arr!21037 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807473 (= lt!361748 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21037 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807473 (= lt!361749 (seekEntryOrOpen!0 (select (arr!21037 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807474 () Bool)

(declare-fun res!551599 () Bool)

(assert (=> b!807474 (=> (not res!551599) (not e!447066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807474 (= res!551599 (validKeyInArray!0 (select (arr!21037 a!3170) j!153)))))

(declare-fun b!807475 () Bool)

(declare-fun res!551602 () Bool)

(assert (=> b!807475 (=> (not res!551602) (not e!447068))))

(declare-datatypes ((List!15000 0))(
  ( (Nil!14997) (Cons!14996 (h!16125 (_ BitVec 64)) (t!21315 List!15000)) )
))
(declare-fun arrayNoDuplicates!0 (array!43920 (_ BitVec 32) List!15000) Bool)

(assert (=> b!807475 (= res!551602 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14997))))

(declare-fun b!807476 () Bool)

(declare-fun res!551596 () Bool)

(assert (=> b!807476 (=> (not res!551596) (not e!447066))))

(declare-fun arrayContainsKey!0 (array!43920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807476 (= res!551596 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807477 () Bool)

(assert (=> b!807477 (= e!447064 false)))

(declare-fun lt!361751 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807477 (= lt!361751 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807478 () Bool)

(assert (=> b!807478 (= e!447066 e!447068)))

(declare-fun res!551593 () Bool)

(assert (=> b!807478 (=> (not res!551593) (not e!447068))))

(declare-fun lt!361746 () SeekEntryResult!8628)

(assert (=> b!807478 (= res!551593 (or (= lt!361746 (MissingZero!8628 i!1163)) (= lt!361746 (MissingVacant!8628 i!1163))))))

(assert (=> b!807478 (= lt!361746 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807470 () Bool)

(declare-fun res!551594 () Bool)

(assert (=> b!807470 (=> (not res!551594) (not e!447068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43920 (_ BitVec 32)) Bool)

(assert (=> b!807470 (= res!551594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!551601 () Bool)

(assert (=> start!69220 (=> (not res!551601) (not e!447066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69220 (= res!551601 (validMask!0 mask!3266))))

(assert (=> start!69220 e!447066))

(assert (=> start!69220 true))

(declare-fun array_inv!16833 (array!43920) Bool)

(assert (=> start!69220 (array_inv!16833 a!3170)))

(declare-fun b!807479 () Bool)

(declare-fun res!551600 () Bool)

(assert (=> b!807479 (=> (not res!551600) (not e!447068))))

(assert (=> b!807479 (= res!551600 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21458 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21037 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21458 a!3170)) (= (select (arr!21037 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807480 () Bool)

(declare-fun res!551597 () Bool)

(assert (=> b!807480 (=> (not res!551597) (not e!447066))))

(assert (=> b!807480 (= res!551597 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69220 res!551601) b!807471))

(assert (= (and b!807471 res!551598) b!807474))

(assert (= (and b!807474 res!551599) b!807480))

(assert (= (and b!807480 res!551597) b!807476))

(assert (= (and b!807476 res!551596) b!807478))

(assert (= (and b!807478 res!551593) b!807470))

(assert (= (and b!807470 res!551594) b!807475))

(assert (= (and b!807475 res!551602) b!807479))

(assert (= (and b!807479 res!551600) b!807472))

(assert (= (and b!807472 res!551595) b!807473))

(assert (= (and b!807473 res!551603) b!807477))

(declare-fun m!749509 () Bool)

(assert (=> start!69220 m!749509))

(declare-fun m!749511 () Bool)

(assert (=> start!69220 m!749511))

(declare-fun m!749513 () Bool)

(assert (=> b!807474 m!749513))

(assert (=> b!807474 m!749513))

(declare-fun m!749515 () Bool)

(assert (=> b!807474 m!749515))

(declare-fun m!749517 () Bool)

(assert (=> b!807470 m!749517))

(declare-fun m!749519 () Bool)

(assert (=> b!807475 m!749519))

(declare-fun m!749521 () Bool)

(assert (=> b!807478 m!749521))

(declare-fun m!749523 () Bool)

(assert (=> b!807480 m!749523))

(declare-fun m!749525 () Bool)

(assert (=> b!807479 m!749525))

(declare-fun m!749527 () Bool)

(assert (=> b!807479 m!749527))

(declare-fun m!749529 () Bool)

(assert (=> b!807477 m!749529))

(declare-fun m!749531 () Bool)

(assert (=> b!807476 m!749531))

(declare-fun m!749533 () Bool)

(assert (=> b!807473 m!749533))

(assert (=> b!807473 m!749513))

(assert (=> b!807473 m!749513))

(declare-fun m!749535 () Bool)

(assert (=> b!807473 m!749535))

(assert (=> b!807473 m!749513))

(declare-fun m!749537 () Bool)

(assert (=> b!807473 m!749537))

(declare-fun m!749539 () Bool)

(assert (=> b!807472 m!749539))

(declare-fun m!749541 () Bool)

(assert (=> b!807472 m!749541))

(declare-fun m!749543 () Bool)

(assert (=> b!807472 m!749543))

(declare-fun m!749545 () Bool)

(assert (=> b!807472 m!749545))

(check-sat (not b!807475) (not b!807472) (not b!807477) (not b!807478) (not start!69220) (not b!807480) (not b!807474) (not b!807470) (not b!807476) (not b!807473))
(check-sat)
