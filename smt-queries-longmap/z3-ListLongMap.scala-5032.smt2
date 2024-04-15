; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68682 () Bool)

(assert start!68682)

(declare-fun res!544427 () Bool)

(declare-fun e!443445 () Bool)

(assert (=> start!68682 (=> (not res!544427) (not e!443445))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68682 (= res!544427 (validMask!0 mask!3266))))

(assert (=> start!68682 e!443445))

(assert (=> start!68682 true))

(declare-datatypes ((array!43489 0))(
  ( (array!43490 (arr!20825 (Array (_ BitVec 32) (_ BitVec 64))) (size!21246 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43489)

(declare-fun array_inv!16708 (array!43489) Bool)

(assert (=> start!68682 (array_inv!16708 a!3170)))

(declare-fun b!799766 () Bool)

(declare-fun e!443444 () Bool)

(assert (=> b!799766 (= e!443444 false)))

(declare-fun lt!357112 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8413 0))(
  ( (MissingZero!8413 (index!36020 (_ BitVec 32))) (Found!8413 (index!36021 (_ BitVec 32))) (Intermediate!8413 (undefined!9225 Bool) (index!36022 (_ BitVec 32)) (x!66902 (_ BitVec 32))) (Undefined!8413) (MissingVacant!8413 (index!36023 (_ BitVec 32))) )
))
(declare-fun lt!357108 () SeekEntryResult!8413)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43489 (_ BitVec 32)) SeekEntryResult!8413)

(assert (=> b!799766 (= lt!357108 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357112 vacantBefore!23 (select (arr!20825 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799767 () Bool)

(declare-fun res!544428 () Bool)

(declare-fun e!443446 () Bool)

(assert (=> b!799767 (=> (not res!544428) (not e!443446))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799767 (= res!544428 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21246 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20825 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21246 a!3170)) (= (select (arr!20825 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799768 () Bool)

(declare-fun res!544434 () Bool)

(assert (=> b!799768 (=> (not res!544434) (not e!443445))))

(assert (=> b!799768 (= res!544434 (and (= (size!21246 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21246 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21246 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799769 () Bool)

(declare-fun e!443442 () Bool)

(assert (=> b!799769 (= e!443446 e!443442)))

(declare-fun res!544436 () Bool)

(assert (=> b!799769 (=> (not res!544436) (not e!443442))))

(declare-fun lt!357109 () SeekEntryResult!8413)

(declare-fun lt!357110 () (_ BitVec 64))

(declare-fun lt!357106 () array!43489)

(assert (=> b!799769 (= res!544436 (= lt!357109 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357110 lt!357106 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43489 (_ BitVec 32)) SeekEntryResult!8413)

(assert (=> b!799769 (= lt!357109 (seekEntryOrOpen!0 lt!357110 lt!357106 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!799769 (= lt!357110 (select (store (arr!20825 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799769 (= lt!357106 (array!43490 (store (arr!20825 a!3170) i!1163 k0!2044) (size!21246 a!3170)))))

(declare-fun b!799770 () Bool)

(declare-fun res!544435 () Bool)

(assert (=> b!799770 (=> (not res!544435) (not e!443445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799770 (= res!544435 (validKeyInArray!0 k0!2044))))

(declare-fun b!799771 () Bool)

(declare-fun res!544437 () Bool)

(assert (=> b!799771 (=> (not res!544437) (not e!443444))))

(assert (=> b!799771 (= res!544437 (= lt!357109 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357112 vacantAfter!23 lt!357110 lt!357106 mask!3266)))))

(declare-fun b!799772 () Bool)

(declare-fun e!443441 () Bool)

(assert (=> b!799772 (= e!443442 e!443441)))

(declare-fun res!544433 () Bool)

(assert (=> b!799772 (=> (not res!544433) (not e!443441))))

(declare-fun lt!357113 () SeekEntryResult!8413)

(declare-fun lt!357111 () SeekEntryResult!8413)

(assert (=> b!799772 (= res!544433 (and (= lt!357111 lt!357113) (= lt!357113 (Found!8413 j!153)) (not (= (select (arr!20825 a!3170) index!1236) (select (arr!20825 a!3170) j!153)))))))

(assert (=> b!799772 (= lt!357113 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20825 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799772 (= lt!357111 (seekEntryOrOpen!0 (select (arr!20825 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799773 () Bool)

(declare-fun res!544432 () Bool)

(assert (=> b!799773 (=> (not res!544432) (not e!443445))))

(assert (=> b!799773 (= res!544432 (validKeyInArray!0 (select (arr!20825 a!3170) j!153)))))

(declare-fun b!799774 () Bool)

(declare-fun res!544431 () Bool)

(assert (=> b!799774 (=> (not res!544431) (not e!443445))))

(declare-fun arrayContainsKey!0 (array!43489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799774 (= res!544431 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799775 () Bool)

(declare-fun res!544426 () Bool)

(assert (=> b!799775 (=> (not res!544426) (not e!443446))))

(declare-datatypes ((List!14827 0))(
  ( (Nil!14824) (Cons!14823 (h!15952 (_ BitVec 64)) (t!21133 List!14827)) )
))
(declare-fun arrayNoDuplicates!0 (array!43489 (_ BitVec 32) List!14827) Bool)

(assert (=> b!799775 (= res!544426 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14824))))

(declare-fun b!799776 () Bool)

(assert (=> b!799776 (= e!443445 e!443446)))

(declare-fun res!544430 () Bool)

(assert (=> b!799776 (=> (not res!544430) (not e!443446))))

(declare-fun lt!357107 () SeekEntryResult!8413)

(assert (=> b!799776 (= res!544430 (or (= lt!357107 (MissingZero!8413 i!1163)) (= lt!357107 (MissingVacant!8413 i!1163))))))

(assert (=> b!799776 (= lt!357107 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799777 () Bool)

(declare-fun res!544425 () Bool)

(assert (=> b!799777 (=> (not res!544425) (not e!443446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43489 (_ BitVec 32)) Bool)

(assert (=> b!799777 (= res!544425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799778 () Bool)

(assert (=> b!799778 (= e!443441 e!443444)))

(declare-fun res!544429 () Bool)

(assert (=> b!799778 (=> (not res!544429) (not e!443444))))

(assert (=> b!799778 (= res!544429 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357112 #b00000000000000000000000000000000) (bvslt lt!357112 (size!21246 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799778 (= lt!357112 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68682 res!544427) b!799768))

(assert (= (and b!799768 res!544434) b!799773))

(assert (= (and b!799773 res!544432) b!799770))

(assert (= (and b!799770 res!544435) b!799774))

(assert (= (and b!799774 res!544431) b!799776))

(assert (= (and b!799776 res!544430) b!799777))

(assert (= (and b!799777 res!544425) b!799775))

(assert (= (and b!799775 res!544426) b!799767))

(assert (= (and b!799767 res!544428) b!799769))

(assert (= (and b!799769 res!544436) b!799772))

(assert (= (and b!799772 res!544433) b!799778))

(assert (= (and b!799778 res!544429) b!799771))

(assert (= (and b!799771 res!544437) b!799766))

(declare-fun m!740329 () Bool)

(assert (=> b!799775 m!740329))

(declare-fun m!740331 () Bool)

(assert (=> b!799777 m!740331))

(declare-fun m!740333 () Bool)

(assert (=> b!799774 m!740333))

(declare-fun m!740335 () Bool)

(assert (=> b!799771 m!740335))

(declare-fun m!740337 () Bool)

(assert (=> b!799767 m!740337))

(declare-fun m!740339 () Bool)

(assert (=> b!799767 m!740339))

(declare-fun m!740341 () Bool)

(assert (=> b!799776 m!740341))

(declare-fun m!740343 () Bool)

(assert (=> b!799766 m!740343))

(assert (=> b!799766 m!740343))

(declare-fun m!740345 () Bool)

(assert (=> b!799766 m!740345))

(declare-fun m!740347 () Bool)

(assert (=> b!799772 m!740347))

(assert (=> b!799772 m!740343))

(assert (=> b!799772 m!740343))

(declare-fun m!740349 () Bool)

(assert (=> b!799772 m!740349))

(assert (=> b!799772 m!740343))

(declare-fun m!740351 () Bool)

(assert (=> b!799772 m!740351))

(declare-fun m!740353 () Bool)

(assert (=> b!799770 m!740353))

(declare-fun m!740355 () Bool)

(assert (=> b!799778 m!740355))

(declare-fun m!740357 () Bool)

(assert (=> b!799769 m!740357))

(declare-fun m!740359 () Bool)

(assert (=> b!799769 m!740359))

(declare-fun m!740361 () Bool)

(assert (=> b!799769 m!740361))

(declare-fun m!740363 () Bool)

(assert (=> b!799769 m!740363))

(assert (=> b!799773 m!740343))

(assert (=> b!799773 m!740343))

(declare-fun m!740365 () Bool)

(assert (=> b!799773 m!740365))

(declare-fun m!740367 () Bool)

(assert (=> start!68682 m!740367))

(declare-fun m!740369 () Bool)

(assert (=> start!68682 m!740369))

(check-sat (not b!799769) (not b!799772) (not b!799771) (not b!799777) (not b!799770) (not b!799774) (not start!68682) (not b!799778) (not b!799766) (not b!799775) (not b!799773) (not b!799776))
(check-sat)
