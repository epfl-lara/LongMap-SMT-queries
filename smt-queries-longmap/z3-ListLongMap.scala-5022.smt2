; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68622 () Bool)

(assert start!68622)

(declare-fun b!798596 () Bool)

(declare-fun res!543259 () Bool)

(declare-fun e!442902 () Bool)

(assert (=> b!798596 (=> (not res!543259) (not e!442902))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43429 0))(
  ( (array!43430 (arr!20795 (Array (_ BitVec 32) (_ BitVec 64))) (size!21216 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43429)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!798596 (= res!543259 (and (= (size!21216 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21216 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21216 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798597 () Bool)

(declare-fun res!543264 () Bool)

(declare-fun e!442904 () Bool)

(assert (=> b!798597 (=> (not res!543264) (not e!442904))))

(declare-fun lt!356391 () array!43429)

(declare-fun lt!356389 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8383 0))(
  ( (MissingZero!8383 (index!35900 (_ BitVec 32))) (Found!8383 (index!35901 (_ BitVec 32))) (Intermediate!8383 (undefined!9195 Bool) (index!35902 (_ BitVec 32)) (x!66792 (_ BitVec 32))) (Undefined!8383) (MissingVacant!8383 (index!35903 (_ BitVec 32))) )
))
(declare-fun lt!356386 () SeekEntryResult!8383)

(declare-fun lt!356392 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43429 (_ BitVec 32)) SeekEntryResult!8383)

(assert (=> b!798597 (= res!543264 (= lt!356386 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356392 vacantAfter!23 lt!356389 lt!356391 mask!3266)))))

(declare-fun b!798598 () Bool)

(declare-fun res!543260 () Bool)

(assert (=> b!798598 (=> (not res!543260) (not e!442902))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798598 (= res!543260 (validKeyInArray!0 k0!2044))))

(declare-fun b!798599 () Bool)

(assert (=> b!798599 (= e!442904 false)))

(declare-fun lt!356388 () SeekEntryResult!8383)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798599 (= lt!356388 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356392 vacantBefore!23 (select (arr!20795 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!543258 () Bool)

(assert (=> start!68622 (=> (not res!543258) (not e!442902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68622 (= res!543258 (validMask!0 mask!3266))))

(assert (=> start!68622 e!442902))

(assert (=> start!68622 true))

(declare-fun array_inv!16678 (array!43429) Bool)

(assert (=> start!68622 (array_inv!16678 a!3170)))

(declare-fun b!798600 () Bool)

(declare-fun e!442905 () Bool)

(declare-fun e!442903 () Bool)

(assert (=> b!798600 (= e!442905 e!442903)))

(declare-fun res!543255 () Bool)

(assert (=> b!798600 (=> (not res!543255) (not e!442903))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798600 (= res!543255 (= lt!356386 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356389 lt!356391 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43429 (_ BitVec 32)) SeekEntryResult!8383)

(assert (=> b!798600 (= lt!356386 (seekEntryOrOpen!0 lt!356389 lt!356391 mask!3266))))

(assert (=> b!798600 (= lt!356389 (select (store (arr!20795 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798600 (= lt!356391 (array!43430 (store (arr!20795 a!3170) i!1163 k0!2044) (size!21216 a!3170)))))

(declare-fun b!798601 () Bool)

(declare-fun res!543257 () Bool)

(assert (=> b!798601 (=> (not res!543257) (not e!442905))))

(declare-datatypes ((List!14797 0))(
  ( (Nil!14794) (Cons!14793 (h!15922 (_ BitVec 64)) (t!21103 List!14797)) )
))
(declare-fun arrayNoDuplicates!0 (array!43429 (_ BitVec 32) List!14797) Bool)

(assert (=> b!798601 (= res!543257 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14794))))

(declare-fun b!798602 () Bool)

(declare-fun res!543263 () Bool)

(assert (=> b!798602 (=> (not res!543263) (not e!442905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43429 (_ BitVec 32)) Bool)

(assert (=> b!798602 (= res!543263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798603 () Bool)

(declare-fun res!543266 () Bool)

(assert (=> b!798603 (=> (not res!543266) (not e!442905))))

(assert (=> b!798603 (= res!543266 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21216 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20795 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21216 a!3170)) (= (select (arr!20795 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798604 () Bool)

(assert (=> b!798604 (= e!442902 e!442905)))

(declare-fun res!543262 () Bool)

(assert (=> b!798604 (=> (not res!543262) (not e!442905))))

(declare-fun lt!356387 () SeekEntryResult!8383)

(assert (=> b!798604 (= res!543262 (or (= lt!356387 (MissingZero!8383 i!1163)) (= lt!356387 (MissingVacant!8383 i!1163))))))

(assert (=> b!798604 (= lt!356387 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798605 () Bool)

(declare-fun e!442901 () Bool)

(assert (=> b!798605 (= e!442901 e!442904)))

(declare-fun res!543261 () Bool)

(assert (=> b!798605 (=> (not res!543261) (not e!442904))))

(assert (=> b!798605 (= res!543261 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356392 #b00000000000000000000000000000000) (bvslt lt!356392 (size!21216 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!798605 (= lt!356392 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!798606 () Bool)

(assert (=> b!798606 (= e!442903 e!442901)))

(declare-fun res!543267 () Bool)

(assert (=> b!798606 (=> (not res!543267) (not e!442901))))

(declare-fun lt!356390 () SeekEntryResult!8383)

(declare-fun lt!356393 () SeekEntryResult!8383)

(assert (=> b!798606 (= res!543267 (and (= lt!356390 lt!356393) (= lt!356393 (Found!8383 j!153)) (not (= (select (arr!20795 a!3170) index!1236) (select (arr!20795 a!3170) j!153)))))))

(assert (=> b!798606 (= lt!356393 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20795 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798606 (= lt!356390 (seekEntryOrOpen!0 (select (arr!20795 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798607 () Bool)

(declare-fun res!543256 () Bool)

(assert (=> b!798607 (=> (not res!543256) (not e!442902))))

(assert (=> b!798607 (= res!543256 (validKeyInArray!0 (select (arr!20795 a!3170) j!153)))))

(declare-fun b!798608 () Bool)

(declare-fun res!543265 () Bool)

(assert (=> b!798608 (=> (not res!543265) (not e!442902))))

(declare-fun arrayContainsKey!0 (array!43429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798608 (= res!543265 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68622 res!543258) b!798596))

(assert (= (and b!798596 res!543259) b!798607))

(assert (= (and b!798607 res!543256) b!798598))

(assert (= (and b!798598 res!543260) b!798608))

(assert (= (and b!798608 res!543265) b!798604))

(assert (= (and b!798604 res!543262) b!798602))

(assert (= (and b!798602 res!543263) b!798601))

(assert (= (and b!798601 res!543257) b!798603))

(assert (= (and b!798603 res!543266) b!798600))

(assert (= (and b!798600 res!543255) b!798606))

(assert (= (and b!798606 res!543267) b!798605))

(assert (= (and b!798605 res!543261) b!798597))

(assert (= (and b!798597 res!543264) b!798599))

(declare-fun m!739069 () Bool)

(assert (=> b!798597 m!739069))

(declare-fun m!739071 () Bool)

(assert (=> b!798606 m!739071))

(declare-fun m!739073 () Bool)

(assert (=> b!798606 m!739073))

(assert (=> b!798606 m!739073))

(declare-fun m!739075 () Bool)

(assert (=> b!798606 m!739075))

(assert (=> b!798606 m!739073))

(declare-fun m!739077 () Bool)

(assert (=> b!798606 m!739077))

(assert (=> b!798599 m!739073))

(assert (=> b!798599 m!739073))

(declare-fun m!739079 () Bool)

(assert (=> b!798599 m!739079))

(declare-fun m!739081 () Bool)

(assert (=> start!68622 m!739081))

(declare-fun m!739083 () Bool)

(assert (=> start!68622 m!739083))

(declare-fun m!739085 () Bool)

(assert (=> b!798605 m!739085))

(declare-fun m!739087 () Bool)

(assert (=> b!798608 m!739087))

(declare-fun m!739089 () Bool)

(assert (=> b!798600 m!739089))

(declare-fun m!739091 () Bool)

(assert (=> b!798600 m!739091))

(declare-fun m!739093 () Bool)

(assert (=> b!798600 m!739093))

(declare-fun m!739095 () Bool)

(assert (=> b!798600 m!739095))

(declare-fun m!739097 () Bool)

(assert (=> b!798603 m!739097))

(declare-fun m!739099 () Bool)

(assert (=> b!798603 m!739099))

(declare-fun m!739101 () Bool)

(assert (=> b!798598 m!739101))

(assert (=> b!798607 m!739073))

(assert (=> b!798607 m!739073))

(declare-fun m!739103 () Bool)

(assert (=> b!798607 m!739103))

(declare-fun m!739105 () Bool)

(assert (=> b!798602 m!739105))

(declare-fun m!739107 () Bool)

(assert (=> b!798604 m!739107))

(declare-fun m!739109 () Bool)

(assert (=> b!798601 m!739109))

(check-sat (not b!798606) (not b!798600) (not b!798601) (not b!798607) (not b!798604) (not b!798597) (not b!798608) (not start!68622) (not b!798602) (not b!798598) (not b!798599) (not b!798605))
(check-sat)
