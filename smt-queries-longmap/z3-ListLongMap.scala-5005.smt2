; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68520 () Bool)

(assert start!68520)

(declare-fun b!796875 () Bool)

(declare-fun res!541544 () Bool)

(declare-fun e!442102 () Bool)

(assert (=> b!796875 (=> (not res!541544) (not e!442102))))

(declare-datatypes ((array!43327 0))(
  ( (array!43328 (arr!20744 (Array (_ BitVec 32) (_ BitVec 64))) (size!21165 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43327)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796875 (= res!541544 (validKeyInArray!0 (select (arr!20744 a!3170) j!153)))))

(declare-fun b!796876 () Bool)

(declare-fun e!442104 () Bool)

(assert (=> b!796876 (= e!442102 e!442104)))

(declare-fun res!541541 () Bool)

(assert (=> b!796876 (=> (not res!541541) (not e!442104))))

(declare-datatypes ((SeekEntryResult!8332 0))(
  ( (MissingZero!8332 (index!35696 (_ BitVec 32))) (Found!8332 (index!35697 (_ BitVec 32))) (Intermediate!8332 (undefined!9144 Bool) (index!35698 (_ BitVec 32)) (x!66605 (_ BitVec 32))) (Undefined!8332) (MissingVacant!8332 (index!35699 (_ BitVec 32))) )
))
(declare-fun lt!355327 () SeekEntryResult!8332)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796876 (= res!541541 (or (= lt!355327 (MissingZero!8332 i!1163)) (= lt!355327 (MissingVacant!8332 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43327 (_ BitVec 32)) SeekEntryResult!8332)

(assert (=> b!796876 (= lt!355327 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796877 () Bool)

(declare-fun res!541538 () Bool)

(assert (=> b!796877 (=> (not res!541538) (not e!442102))))

(declare-fun arrayContainsKey!0 (array!43327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796877 (= res!541538 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796878 () Bool)

(declare-fun res!541545 () Bool)

(assert (=> b!796878 (=> (not res!541545) (not e!442104))))

(declare-datatypes ((List!14746 0))(
  ( (Nil!14743) (Cons!14742 (h!15871 (_ BitVec 64)) (t!21052 List!14746)) )
))
(declare-fun arrayNoDuplicates!0 (array!43327 (_ BitVec 32) List!14746) Bool)

(assert (=> b!796878 (= res!541545 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14743))))

(declare-fun res!541542 () Bool)

(assert (=> start!68520 (=> (not res!541542) (not e!442102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68520 (= res!541542 (validMask!0 mask!3266))))

(assert (=> start!68520 e!442102))

(assert (=> start!68520 true))

(declare-fun array_inv!16627 (array!43327) Bool)

(assert (=> start!68520 (array_inv!16627 a!3170)))

(declare-fun b!796879 () Bool)

(declare-fun e!442100 () Bool)

(declare-fun e!442101 () Bool)

(assert (=> b!796879 (= e!442100 e!442101)))

(declare-fun res!541543 () Bool)

(assert (=> b!796879 (=> (not res!541543) (not e!442101))))

(declare-fun lt!355330 () SeekEntryResult!8332)

(declare-fun lt!355324 () SeekEntryResult!8332)

(assert (=> b!796879 (= res!541543 (= lt!355330 lt!355324))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43327 (_ BitVec 32)) SeekEntryResult!8332)

(assert (=> b!796879 (= lt!355324 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20744 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796879 (= lt!355330 (seekEntryOrOpen!0 (select (arr!20744 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796880 () Bool)

(declare-fun e!442103 () Bool)

(assert (=> b!796880 (= e!442101 e!442103)))

(declare-fun res!541536 () Bool)

(assert (=> b!796880 (=> (not res!541536) (not e!442103))))

(declare-fun lt!355326 () SeekEntryResult!8332)

(assert (=> b!796880 (= res!541536 (and (= lt!355324 lt!355326) (= (select (arr!20744 a!3170) index!1236) (select (arr!20744 a!3170) j!153))))))

(assert (=> b!796880 (= lt!355326 (Found!8332 j!153))))

(declare-fun b!796881 () Bool)

(assert (=> b!796881 (= e!442104 e!442100)))

(declare-fun res!541540 () Bool)

(assert (=> b!796881 (=> (not res!541540) (not e!442100))))

(declare-fun lt!355329 () SeekEntryResult!8332)

(declare-fun lt!355328 () SeekEntryResult!8332)

(assert (=> b!796881 (= res!541540 (= lt!355329 lt!355328))))

(declare-fun lt!355325 () array!43327)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355331 () (_ BitVec 64))

(assert (=> b!796881 (= lt!355328 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355331 lt!355325 mask!3266))))

(assert (=> b!796881 (= lt!355329 (seekEntryOrOpen!0 lt!355331 lt!355325 mask!3266))))

(assert (=> b!796881 (= lt!355331 (select (store (arr!20744 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796881 (= lt!355325 (array!43328 (store (arr!20744 a!3170) i!1163 k0!2044) (size!21165 a!3170)))))

(declare-fun b!796882 () Bool)

(assert (=> b!796882 (= e!442103 (not (or (not (= lt!355328 lt!355326)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!796882 (= lt!355328 (Found!8332 index!1236))))

(declare-fun b!796883 () Bool)

(declare-fun res!541535 () Bool)

(assert (=> b!796883 (=> (not res!541535) (not e!442102))))

(assert (=> b!796883 (= res!541535 (and (= (size!21165 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21165 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21165 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796884 () Bool)

(declare-fun res!541534 () Bool)

(assert (=> b!796884 (=> (not res!541534) (not e!442104))))

(assert (=> b!796884 (= res!541534 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21165 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20744 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21165 a!3170)) (= (select (arr!20744 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796885 () Bool)

(declare-fun res!541539 () Bool)

(assert (=> b!796885 (=> (not res!541539) (not e!442104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43327 (_ BitVec 32)) Bool)

(assert (=> b!796885 (= res!541539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796886 () Bool)

(declare-fun res!541537 () Bool)

(assert (=> b!796886 (=> (not res!541537) (not e!442102))))

(assert (=> b!796886 (= res!541537 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68520 res!541542) b!796883))

(assert (= (and b!796883 res!541535) b!796875))

(assert (= (and b!796875 res!541544) b!796886))

(assert (= (and b!796886 res!541537) b!796877))

(assert (= (and b!796877 res!541538) b!796876))

(assert (= (and b!796876 res!541541) b!796885))

(assert (= (and b!796885 res!541539) b!796878))

(assert (= (and b!796878 res!541545) b!796884))

(assert (= (and b!796884 res!541534) b!796881))

(assert (= (and b!796881 res!541540) b!796879))

(assert (= (and b!796879 res!541543) b!796880))

(assert (= (and b!796880 res!541536) b!796882))

(declare-fun m!737227 () Bool)

(assert (=> b!796879 m!737227))

(assert (=> b!796879 m!737227))

(declare-fun m!737229 () Bool)

(assert (=> b!796879 m!737229))

(assert (=> b!796879 m!737227))

(declare-fun m!737231 () Bool)

(assert (=> b!796879 m!737231))

(declare-fun m!737233 () Bool)

(assert (=> b!796886 m!737233))

(declare-fun m!737235 () Bool)

(assert (=> b!796885 m!737235))

(declare-fun m!737237 () Bool)

(assert (=> b!796881 m!737237))

(declare-fun m!737239 () Bool)

(assert (=> b!796881 m!737239))

(declare-fun m!737241 () Bool)

(assert (=> b!796881 m!737241))

(declare-fun m!737243 () Bool)

(assert (=> b!796881 m!737243))

(declare-fun m!737245 () Bool)

(assert (=> b!796876 m!737245))

(assert (=> b!796875 m!737227))

(assert (=> b!796875 m!737227))

(declare-fun m!737247 () Bool)

(assert (=> b!796875 m!737247))

(declare-fun m!737249 () Bool)

(assert (=> b!796878 m!737249))

(declare-fun m!737251 () Bool)

(assert (=> b!796877 m!737251))

(declare-fun m!737253 () Bool)

(assert (=> b!796880 m!737253))

(assert (=> b!796880 m!737227))

(declare-fun m!737255 () Bool)

(assert (=> b!796884 m!737255))

(declare-fun m!737257 () Bool)

(assert (=> b!796884 m!737257))

(declare-fun m!737259 () Bool)

(assert (=> start!68520 m!737259))

(declare-fun m!737261 () Bool)

(assert (=> start!68520 m!737261))

(check-sat (not b!796876) (not start!68520) (not b!796878) (not b!796875) (not b!796886) (not b!796885) (not b!796881) (not b!796877) (not b!796879))
(check-sat)
