; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68714 () Bool)

(assert start!68714)

(declare-fun b!800250 () Bool)

(declare-fun res!544774 () Bool)

(declare-fun e!443704 () Bool)

(assert (=> b!800250 (=> (not res!544774) (not e!443704))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43504 0))(
  ( (array!43505 (arr!20832 (Array (_ BitVec 32) (_ BitVec 64))) (size!21253 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43504)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800250 (= res!544774 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21253 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20832 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21253 a!3170)) (= (select (arr!20832 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800251 () Bool)

(declare-fun res!544780 () Bool)

(declare-fun e!443708 () Bool)

(assert (=> b!800251 (=> (not res!544780) (not e!443708))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!800251 (= res!544780 (and (= (size!21253 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21253 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21253 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800252 () Bool)

(declare-fun res!544772 () Bool)

(assert (=> b!800252 (=> (not res!544772) (not e!443708))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800252 (= res!544772 (validKeyInArray!0 k!2044))))

(declare-fun b!800253 () Bool)

(declare-fun res!544769 () Bool)

(declare-fun e!443703 () Bool)

(assert (=> b!800253 (=> (not res!544769) (not e!443703))))

(declare-fun lt!357492 () array!43504)

(declare-fun lt!357495 () (_ BitVec 64))

(declare-fun lt!357496 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8423 0))(
  ( (MissingZero!8423 (index!36060 (_ BitVec 32))) (Found!8423 (index!36061 (_ BitVec 32))) (Intermediate!8423 (undefined!9235 Bool) (index!36062 (_ BitVec 32)) (x!66933 (_ BitVec 32))) (Undefined!8423) (MissingVacant!8423 (index!36063 (_ BitVec 32))) )
))
(declare-fun lt!357497 () SeekEntryResult!8423)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43504 (_ BitVec 32)) SeekEntryResult!8423)

(assert (=> b!800253 (= res!544769 (= lt!357497 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357496 vacantAfter!23 lt!357495 lt!357492 mask!3266)))))

(declare-fun b!800254 () Bool)

(declare-fun res!544771 () Bool)

(assert (=> b!800254 (=> (not res!544771) (not e!443708))))

(declare-fun arrayContainsKey!0 (array!43504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800254 (= res!544771 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800255 () Bool)

(declare-fun e!443707 () Bool)

(assert (=> b!800255 (= e!443707 e!443703)))

(declare-fun res!544777 () Bool)

(assert (=> b!800255 (=> (not res!544777) (not e!443703))))

(assert (=> b!800255 (= res!544777 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357496 #b00000000000000000000000000000000) (bvslt lt!357496 (size!21253 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800255 (= lt!357496 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!544775 () Bool)

(assert (=> start!68714 (=> (not res!544775) (not e!443708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68714 (= res!544775 (validMask!0 mask!3266))))

(assert (=> start!68714 e!443708))

(assert (=> start!68714 true))

(declare-fun array_inv!16628 (array!43504) Bool)

(assert (=> start!68714 (array_inv!16628 a!3170)))

(declare-fun b!800256 () Bool)

(declare-fun e!443705 () Bool)

(assert (=> b!800256 (= e!443705 e!443707)))

(declare-fun res!544779 () Bool)

(assert (=> b!800256 (=> (not res!544779) (not e!443707))))

(declare-fun lt!357491 () SeekEntryResult!8423)

(declare-fun lt!357494 () SeekEntryResult!8423)

(assert (=> b!800256 (= res!544779 (and (= lt!357494 lt!357491) (= lt!357491 (Found!8423 j!153)) (not (= (select (arr!20832 a!3170) index!1236) (select (arr!20832 a!3170) j!153)))))))

(assert (=> b!800256 (= lt!357491 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20832 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43504 (_ BitVec 32)) SeekEntryResult!8423)

(assert (=> b!800256 (= lt!357494 (seekEntryOrOpen!0 (select (arr!20832 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800257 () Bool)

(assert (=> b!800257 (= e!443703 false)))

(declare-fun lt!357493 () SeekEntryResult!8423)

(assert (=> b!800257 (= lt!357493 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357496 vacantBefore!23 (select (arr!20832 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800258 () Bool)

(declare-fun res!544776 () Bool)

(assert (=> b!800258 (=> (not res!544776) (not e!443704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43504 (_ BitVec 32)) Bool)

(assert (=> b!800258 (= res!544776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800259 () Bool)

(assert (=> b!800259 (= e!443704 e!443705)))

(declare-fun res!544778 () Bool)

(assert (=> b!800259 (=> (not res!544778) (not e!443705))))

(assert (=> b!800259 (= res!544778 (= lt!357497 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357495 lt!357492 mask!3266)))))

(assert (=> b!800259 (= lt!357497 (seekEntryOrOpen!0 lt!357495 lt!357492 mask!3266))))

(assert (=> b!800259 (= lt!357495 (select (store (arr!20832 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800259 (= lt!357492 (array!43505 (store (arr!20832 a!3170) i!1163 k!2044) (size!21253 a!3170)))))

(declare-fun b!800260 () Bool)

(assert (=> b!800260 (= e!443708 e!443704)))

(declare-fun res!544781 () Bool)

(assert (=> b!800260 (=> (not res!544781) (not e!443704))))

(declare-fun lt!357490 () SeekEntryResult!8423)

(assert (=> b!800260 (= res!544781 (or (= lt!357490 (MissingZero!8423 i!1163)) (= lt!357490 (MissingVacant!8423 i!1163))))))

(assert (=> b!800260 (= lt!357490 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800261 () Bool)

(declare-fun res!544770 () Bool)

(assert (=> b!800261 (=> (not res!544770) (not e!443704))))

(declare-datatypes ((List!14795 0))(
  ( (Nil!14792) (Cons!14791 (h!15920 (_ BitVec 64)) (t!21110 List!14795)) )
))
(declare-fun arrayNoDuplicates!0 (array!43504 (_ BitVec 32) List!14795) Bool)

(assert (=> b!800261 (= res!544770 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14792))))

(declare-fun b!800262 () Bool)

(declare-fun res!544773 () Bool)

(assert (=> b!800262 (=> (not res!544773) (not e!443708))))

(assert (=> b!800262 (= res!544773 (validKeyInArray!0 (select (arr!20832 a!3170) j!153)))))

(assert (= (and start!68714 res!544775) b!800251))

(assert (= (and b!800251 res!544780) b!800262))

(assert (= (and b!800262 res!544773) b!800252))

(assert (= (and b!800252 res!544772) b!800254))

(assert (= (and b!800254 res!544771) b!800260))

(assert (= (and b!800260 res!544781) b!800258))

(assert (= (and b!800258 res!544776) b!800261))

(assert (= (and b!800261 res!544770) b!800250))

(assert (= (and b!800250 res!544774) b!800259))

(assert (= (and b!800259 res!544778) b!800256))

(assert (= (and b!800256 res!544779) b!800255))

(assert (= (and b!800255 res!544777) b!800253))

(assert (= (and b!800253 res!544769) b!800257))

(declare-fun m!741323 () Bool)

(assert (=> b!800258 m!741323))

(declare-fun m!741325 () Bool)

(assert (=> b!800262 m!741325))

(assert (=> b!800262 m!741325))

(declare-fun m!741327 () Bool)

(assert (=> b!800262 m!741327))

(declare-fun m!741329 () Bool)

(assert (=> b!800252 m!741329))

(declare-fun m!741331 () Bool)

(assert (=> b!800256 m!741331))

(assert (=> b!800256 m!741325))

(assert (=> b!800256 m!741325))

(declare-fun m!741333 () Bool)

(assert (=> b!800256 m!741333))

(assert (=> b!800256 m!741325))

(declare-fun m!741335 () Bool)

(assert (=> b!800256 m!741335))

(declare-fun m!741337 () Bool)

(assert (=> b!800260 m!741337))

(declare-fun m!741339 () Bool)

(assert (=> b!800250 m!741339))

(declare-fun m!741341 () Bool)

(assert (=> b!800250 m!741341))

(declare-fun m!741343 () Bool)

(assert (=> start!68714 m!741343))

(declare-fun m!741345 () Bool)

(assert (=> start!68714 m!741345))

(assert (=> b!800257 m!741325))

(assert (=> b!800257 m!741325))

(declare-fun m!741347 () Bool)

(assert (=> b!800257 m!741347))

(declare-fun m!741349 () Bool)

(assert (=> b!800253 m!741349))

(declare-fun m!741351 () Bool)

(assert (=> b!800255 m!741351))

(declare-fun m!741353 () Bool)

(assert (=> b!800254 m!741353))

(declare-fun m!741355 () Bool)

(assert (=> b!800259 m!741355))

(declare-fun m!741357 () Bool)

(assert (=> b!800259 m!741357))

(declare-fun m!741359 () Bool)

(assert (=> b!800259 m!741359))

(declare-fun m!741361 () Bool)

(assert (=> b!800259 m!741361))

(declare-fun m!741363 () Bool)

(assert (=> b!800261 m!741363))

(push 1)

