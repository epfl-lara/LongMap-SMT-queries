; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68988 () Bool)

(assert start!68988)

(declare-fun b!804760 () Bool)

(declare-fun res!549286 () Bool)

(declare-fun e!445777 () Bool)

(assert (=> b!804760 (=> (not res!549286) (not e!445777))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43778 0))(
  ( (array!43779 (arr!20969 (Array (_ BitVec 32) (_ BitVec 64))) (size!21390 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43778)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804760 (= res!549286 (and (= (size!21390 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21390 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21390 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804761 () Bool)

(declare-fun res!549281 () Bool)

(declare-fun e!445778 () Bool)

(assert (=> b!804761 (=> (not res!549281) (not e!445778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43778 (_ BitVec 32)) Bool)

(assert (=> b!804761 (= res!549281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804762 () Bool)

(declare-fun res!549280 () Bool)

(assert (=> b!804762 (=> (not res!549280) (not e!445778))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804762 (= res!549280 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21390 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20969 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21390 a!3170)) (= (select (arr!20969 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804763 () Bool)

(assert (=> b!804763 (= e!445778 false)))

(declare-datatypes ((SeekEntryResult!8560 0))(
  ( (MissingZero!8560 (index!36608 (_ BitVec 32))) (Found!8560 (index!36609 (_ BitVec 32))) (Intermediate!8560 (undefined!9372 Bool) (index!36610 (_ BitVec 32)) (x!67430 (_ BitVec 32))) (Undefined!8560) (MissingVacant!8560 (index!36611 (_ BitVec 32))) )
))
(declare-fun lt!360289 () SeekEntryResult!8560)

(declare-fun lt!360290 () (_ BitVec 64))

(declare-fun lt!360286 () array!43778)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43778 (_ BitVec 32)) SeekEntryResult!8560)

(assert (=> b!804763 (= lt!360289 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360290 lt!360286 mask!3266))))

(declare-fun lt!360288 () SeekEntryResult!8560)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43778 (_ BitVec 32)) SeekEntryResult!8560)

(assert (=> b!804763 (= lt!360288 (seekEntryOrOpen!0 lt!360290 lt!360286 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!804763 (= lt!360290 (select (store (arr!20969 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!804763 (= lt!360286 (array!43779 (store (arr!20969 a!3170) i!1163 k!2044) (size!21390 a!3170)))))

(declare-fun res!549279 () Bool)

(assert (=> start!68988 (=> (not res!549279) (not e!445777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68988 (= res!549279 (validMask!0 mask!3266))))

(assert (=> start!68988 e!445777))

(assert (=> start!68988 true))

(declare-fun array_inv!16765 (array!43778) Bool)

(assert (=> start!68988 (array_inv!16765 a!3170)))

(declare-fun b!804764 () Bool)

(declare-fun res!549285 () Bool)

(assert (=> b!804764 (=> (not res!549285) (not e!445777))))

(declare-fun arrayContainsKey!0 (array!43778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804764 (= res!549285 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804765 () Bool)

(declare-fun res!549283 () Bool)

(assert (=> b!804765 (=> (not res!549283) (not e!445777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804765 (= res!549283 (validKeyInArray!0 k!2044))))

(declare-fun b!804766 () Bool)

(assert (=> b!804766 (= e!445777 e!445778)))

(declare-fun res!549282 () Bool)

(assert (=> b!804766 (=> (not res!549282) (not e!445778))))

(declare-fun lt!360287 () SeekEntryResult!8560)

(assert (=> b!804766 (= res!549282 (or (= lt!360287 (MissingZero!8560 i!1163)) (= lt!360287 (MissingVacant!8560 i!1163))))))

(assert (=> b!804766 (= lt!360287 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804767 () Bool)

(declare-fun res!549284 () Bool)

(assert (=> b!804767 (=> (not res!549284) (not e!445778))))

(declare-datatypes ((List!14932 0))(
  ( (Nil!14929) (Cons!14928 (h!16057 (_ BitVec 64)) (t!21247 List!14932)) )
))
(declare-fun arrayNoDuplicates!0 (array!43778 (_ BitVec 32) List!14932) Bool)

(assert (=> b!804767 (= res!549284 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14929))))

(declare-fun b!804768 () Bool)

(declare-fun res!549287 () Bool)

(assert (=> b!804768 (=> (not res!549287) (not e!445777))))

(assert (=> b!804768 (= res!549287 (validKeyInArray!0 (select (arr!20969 a!3170) j!153)))))

(assert (= (and start!68988 res!549279) b!804760))

(assert (= (and b!804760 res!549286) b!804768))

(assert (= (and b!804768 res!549287) b!804765))

(assert (= (and b!804765 res!549283) b!804764))

(assert (= (and b!804764 res!549285) b!804766))

(assert (= (and b!804766 res!549282) b!804761))

(assert (= (and b!804761 res!549281) b!804767))

(assert (= (and b!804767 res!549284) b!804762))

(assert (= (and b!804762 res!549280) b!804763))

(declare-fun m!746621 () Bool)

(assert (=> b!804764 m!746621))

(declare-fun m!746623 () Bool)

(assert (=> b!804761 m!746623))

(declare-fun m!746625 () Bool)

(assert (=> b!804767 m!746625))

(declare-fun m!746627 () Bool)

(assert (=> b!804768 m!746627))

(assert (=> b!804768 m!746627))

(declare-fun m!746629 () Bool)

(assert (=> b!804768 m!746629))

(declare-fun m!746631 () Bool)

(assert (=> b!804763 m!746631))

(declare-fun m!746633 () Bool)

(assert (=> b!804763 m!746633))

(declare-fun m!746635 () Bool)

(assert (=> b!804763 m!746635))

(declare-fun m!746637 () Bool)

(assert (=> b!804763 m!746637))

(declare-fun m!746639 () Bool)

(assert (=> b!804762 m!746639))

(declare-fun m!746641 () Bool)

(assert (=> b!804762 m!746641))

(declare-fun m!746643 () Bool)

(assert (=> b!804766 m!746643))

(declare-fun m!746645 () Bool)

(assert (=> b!804765 m!746645))

(declare-fun m!746647 () Bool)

(assert (=> start!68988 m!746647))

(declare-fun m!746649 () Bool)

(assert (=> start!68988 m!746649))

(push 1)

(assert (not start!68988))

(assert (not b!804765))

(assert (not b!804764))

(assert (not b!804763))

(assert (not b!804766))

(assert (not b!804768))

