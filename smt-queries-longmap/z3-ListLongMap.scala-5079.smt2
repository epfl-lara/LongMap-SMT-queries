; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68986 () Bool)

(assert start!68986)

(declare-fun b!804733 () Bool)

(declare-fun res!549257 () Bool)

(declare-fun e!445767 () Bool)

(assert (=> b!804733 (=> (not res!549257) (not e!445767))))

(declare-datatypes ((array!43776 0))(
  ( (array!43777 (arr!20968 (Array (_ BitVec 32) (_ BitVec 64))) (size!21389 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43776)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43776 (_ BitVec 32)) Bool)

(assert (=> b!804733 (= res!549257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804734 () Bool)

(declare-fun res!549258 () Bool)

(declare-fun e!445769 () Bool)

(assert (=> b!804734 (=> (not res!549258) (not e!445769))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804734 (= res!549258 (validKeyInArray!0 k0!2044))))

(declare-fun b!804735 () Bool)

(declare-fun res!549252 () Bool)

(assert (=> b!804735 (=> (not res!549252) (not e!445769))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804735 (= res!549252 (validKeyInArray!0 (select (arr!20968 a!3170) j!153)))))

(declare-fun b!804736 () Bool)

(assert (=> b!804736 (= e!445767 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360271 () array!43776)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!360274 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8559 0))(
  ( (MissingZero!8559 (index!36604 (_ BitVec 32))) (Found!8559 (index!36605 (_ BitVec 32))) (Intermediate!8559 (undefined!9371 Bool) (index!36606 (_ BitVec 32)) (x!67429 (_ BitVec 32))) (Undefined!8559) (MissingVacant!8559 (index!36607 (_ BitVec 32))) )
))
(declare-fun lt!360273 () SeekEntryResult!8559)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43776 (_ BitVec 32)) SeekEntryResult!8559)

(assert (=> b!804736 (= lt!360273 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360274 lt!360271 mask!3266))))

(declare-fun lt!360275 () SeekEntryResult!8559)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43776 (_ BitVec 32)) SeekEntryResult!8559)

(assert (=> b!804736 (= lt!360275 (seekEntryOrOpen!0 lt!360274 lt!360271 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804736 (= lt!360274 (select (store (arr!20968 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804736 (= lt!360271 (array!43777 (store (arr!20968 a!3170) i!1163 k0!2044) (size!21389 a!3170)))))

(declare-fun res!549254 () Bool)

(assert (=> start!68986 (=> (not res!549254) (not e!445769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68986 (= res!549254 (validMask!0 mask!3266))))

(assert (=> start!68986 e!445769))

(assert (=> start!68986 true))

(declare-fun array_inv!16764 (array!43776) Bool)

(assert (=> start!68986 (array_inv!16764 a!3170)))

(declare-fun b!804737 () Bool)

(declare-fun res!549255 () Bool)

(assert (=> b!804737 (=> (not res!549255) (not e!445767))))

(declare-datatypes ((List!14931 0))(
  ( (Nil!14928) (Cons!14927 (h!16056 (_ BitVec 64)) (t!21246 List!14931)) )
))
(declare-fun arrayNoDuplicates!0 (array!43776 (_ BitVec 32) List!14931) Bool)

(assert (=> b!804737 (= res!549255 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14928))))

(declare-fun b!804738 () Bool)

(assert (=> b!804738 (= e!445769 e!445767)))

(declare-fun res!549260 () Bool)

(assert (=> b!804738 (=> (not res!549260) (not e!445767))))

(declare-fun lt!360272 () SeekEntryResult!8559)

(assert (=> b!804738 (= res!549260 (or (= lt!360272 (MissingZero!8559 i!1163)) (= lt!360272 (MissingVacant!8559 i!1163))))))

(assert (=> b!804738 (= lt!360272 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804739 () Bool)

(declare-fun res!549253 () Bool)

(assert (=> b!804739 (=> (not res!549253) (not e!445769))))

(assert (=> b!804739 (= res!549253 (and (= (size!21389 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21389 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21389 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804740 () Bool)

(declare-fun res!549256 () Bool)

(assert (=> b!804740 (=> (not res!549256) (not e!445769))))

(declare-fun arrayContainsKey!0 (array!43776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804740 (= res!549256 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804741 () Bool)

(declare-fun res!549259 () Bool)

(assert (=> b!804741 (=> (not res!549259) (not e!445767))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!804741 (= res!549259 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21389 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20968 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21389 a!3170)) (= (select (arr!20968 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68986 res!549254) b!804739))

(assert (= (and b!804739 res!549253) b!804735))

(assert (= (and b!804735 res!549252) b!804734))

(assert (= (and b!804734 res!549258) b!804740))

(assert (= (and b!804740 res!549256) b!804738))

(assert (= (and b!804738 res!549260) b!804733))

(assert (= (and b!804733 res!549257) b!804737))

(assert (= (and b!804737 res!549255) b!804741))

(assert (= (and b!804741 res!549259) b!804736))

(declare-fun m!746591 () Bool)

(assert (=> b!804734 m!746591))

(declare-fun m!746593 () Bool)

(assert (=> b!804736 m!746593))

(declare-fun m!746595 () Bool)

(assert (=> b!804736 m!746595))

(declare-fun m!746597 () Bool)

(assert (=> b!804736 m!746597))

(declare-fun m!746599 () Bool)

(assert (=> b!804736 m!746599))

(declare-fun m!746601 () Bool)

(assert (=> b!804735 m!746601))

(assert (=> b!804735 m!746601))

(declare-fun m!746603 () Bool)

(assert (=> b!804735 m!746603))

(declare-fun m!746605 () Bool)

(assert (=> b!804733 m!746605))

(declare-fun m!746607 () Bool)

(assert (=> b!804740 m!746607))

(declare-fun m!746609 () Bool)

(assert (=> start!68986 m!746609))

(declare-fun m!746611 () Bool)

(assert (=> start!68986 m!746611))

(declare-fun m!746613 () Bool)

(assert (=> b!804741 m!746613))

(declare-fun m!746615 () Bool)

(assert (=> b!804741 m!746615))

(declare-fun m!746617 () Bool)

(assert (=> b!804737 m!746617))

(declare-fun m!746619 () Bool)

(assert (=> b!804738 m!746619))

(check-sat (not b!804738) (not b!804734) (not b!804733) (not b!804736) (not b!804740) (not b!804735) (not b!804737) (not start!68986))
(check-sat)
