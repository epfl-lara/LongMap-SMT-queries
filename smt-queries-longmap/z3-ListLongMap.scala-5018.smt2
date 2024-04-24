; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68742 () Bool)

(assert start!68742)

(declare-fun b!799131 () Bool)

(declare-fun res!543280 () Bool)

(declare-fun e!443331 () Bool)

(assert (=> b!799131 (=> (not res!543280) (not e!443331))))

(declare-datatypes ((array!43406 0))(
  ( (array!43407 (arr!20779 (Array (_ BitVec 32) (_ BitVec 64))) (size!21199 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43406)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799131 (= res!543280 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799132 () Bool)

(declare-fun res!543277 () Bool)

(assert (=> b!799132 (=> (not res!543277) (not e!443331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799132 (= res!543277 (validKeyInArray!0 k0!2044))))

(declare-fun b!799133 () Bool)

(declare-fun res!543283 () Bool)

(declare-fun e!443329 () Bool)

(assert (=> b!799133 (=> (not res!543283) (not e!443329))))

(declare-datatypes ((List!14649 0))(
  ( (Nil!14646) (Cons!14645 (h!15780 (_ BitVec 64)) (t!20956 List!14649)) )
))
(declare-fun arrayNoDuplicates!0 (array!43406 (_ BitVec 32) List!14649) Bool)

(assert (=> b!799133 (= res!543283 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14646))))

(declare-fun b!799134 () Bool)

(declare-fun res!543279 () Bool)

(assert (=> b!799134 (=> (not res!543279) (not e!443331))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799134 (= res!543279 (validKeyInArray!0 (select (arr!20779 a!3170) j!153)))))

(declare-fun b!799135 () Bool)

(declare-fun res!543282 () Bool)

(assert (=> b!799135 (=> (not res!543282) (not e!443331))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!799135 (= res!543282 (and (= (size!21199 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21199 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21199 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799136 () Bool)

(declare-fun res!543284 () Bool)

(assert (=> b!799136 (=> (not res!543284) (not e!443329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43406 (_ BitVec 32)) Bool)

(assert (=> b!799136 (= res!543284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799137 () Bool)

(declare-fun res!543276 () Bool)

(assert (=> b!799137 (=> (not res!543276) (not e!443329))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799137 (= res!543276 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21199 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20779 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21199 a!3170)) (= (select (arr!20779 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799138 () Bool)

(declare-fun e!443332 () Bool)

(assert (=> b!799138 (= e!443332 false)))

(declare-datatypes ((SeekEntryResult!8326 0))(
  ( (MissingZero!8326 (index!35672 (_ BitVec 32))) (Found!8326 (index!35673 (_ BitVec 32))) (Intermediate!8326 (undefined!9138 Bool) (index!35674 (_ BitVec 32)) (x!66719 (_ BitVec 32))) (Undefined!8326) (MissingVacant!8326 (index!35675 (_ BitVec 32))) )
))
(declare-fun lt!356713 () SeekEntryResult!8326)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43406 (_ BitVec 32)) SeekEntryResult!8326)

(assert (=> b!799138 (= lt!356713 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20779 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!356716 () SeekEntryResult!8326)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43406 (_ BitVec 32)) SeekEntryResult!8326)

(assert (=> b!799138 (= lt!356716 (seekEntryOrOpen!0 (select (arr!20779 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799139 () Bool)

(assert (=> b!799139 (= e!443331 e!443329)))

(declare-fun res!543281 () Bool)

(assert (=> b!799139 (=> (not res!543281) (not e!443329))))

(declare-fun lt!356715 () SeekEntryResult!8326)

(assert (=> b!799139 (= res!543281 (or (= lt!356715 (MissingZero!8326 i!1163)) (= lt!356715 (MissingVacant!8326 i!1163))))))

(assert (=> b!799139 (= lt!356715 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!543285 () Bool)

(assert (=> start!68742 (=> (not res!543285) (not e!443331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68742 (= res!543285 (validMask!0 mask!3266))))

(assert (=> start!68742 e!443331))

(assert (=> start!68742 true))

(declare-fun array_inv!16638 (array!43406) Bool)

(assert (=> start!68742 (array_inv!16638 a!3170)))

(declare-fun b!799140 () Bool)

(assert (=> b!799140 (= e!443329 e!443332)))

(declare-fun res!543278 () Bool)

(assert (=> b!799140 (=> (not res!543278) (not e!443332))))

(declare-fun lt!356712 () array!43406)

(declare-fun lt!356714 () (_ BitVec 64))

(assert (=> b!799140 (= res!543278 (= (seekEntryOrOpen!0 lt!356714 lt!356712 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356714 lt!356712 mask!3266)))))

(assert (=> b!799140 (= lt!356714 (select (store (arr!20779 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799140 (= lt!356712 (array!43407 (store (arr!20779 a!3170) i!1163 k0!2044) (size!21199 a!3170)))))

(assert (= (and start!68742 res!543285) b!799135))

(assert (= (and b!799135 res!543282) b!799134))

(assert (= (and b!799134 res!543279) b!799132))

(assert (= (and b!799132 res!543277) b!799131))

(assert (= (and b!799131 res!543280) b!799139))

(assert (= (and b!799139 res!543281) b!799136))

(assert (= (and b!799136 res!543284) b!799133))

(assert (= (and b!799133 res!543283) b!799137))

(assert (= (and b!799137 res!543276) b!799140))

(assert (= (and b!799140 res!543278) b!799138))

(declare-fun m!740471 () Bool)

(assert (=> b!799138 m!740471))

(assert (=> b!799138 m!740471))

(declare-fun m!740473 () Bool)

(assert (=> b!799138 m!740473))

(assert (=> b!799138 m!740471))

(declare-fun m!740475 () Bool)

(assert (=> b!799138 m!740475))

(assert (=> b!799134 m!740471))

(assert (=> b!799134 m!740471))

(declare-fun m!740477 () Bool)

(assert (=> b!799134 m!740477))

(declare-fun m!740479 () Bool)

(assert (=> start!68742 m!740479))

(declare-fun m!740481 () Bool)

(assert (=> start!68742 m!740481))

(declare-fun m!740483 () Bool)

(assert (=> b!799132 m!740483))

(declare-fun m!740485 () Bool)

(assert (=> b!799137 m!740485))

(declare-fun m!740487 () Bool)

(assert (=> b!799137 m!740487))

(declare-fun m!740489 () Bool)

(assert (=> b!799131 m!740489))

(declare-fun m!740491 () Bool)

(assert (=> b!799140 m!740491))

(declare-fun m!740493 () Bool)

(assert (=> b!799140 m!740493))

(declare-fun m!740495 () Bool)

(assert (=> b!799140 m!740495))

(declare-fun m!740497 () Bool)

(assert (=> b!799140 m!740497))

(declare-fun m!740499 () Bool)

(assert (=> b!799136 m!740499))

(declare-fun m!740501 () Bool)

(assert (=> b!799133 m!740501))

(declare-fun m!740503 () Bool)

(assert (=> b!799139 m!740503))

(check-sat (not b!799136) (not b!799134) (not b!799131) (not b!799140) (not b!799139) (not start!68742) (not b!799132) (not b!799133) (not b!799138))
(check-sat)
