; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68630 () Bool)

(assert start!68630)

(declare-fun b!798660 () Bool)

(declare-fun res!543183 () Bool)

(declare-fun e!442980 () Bool)

(assert (=> b!798660 (=> (not res!543183) (not e!442980))))

(declare-datatypes ((array!43420 0))(
  ( (array!43421 (arr!20790 (Array (_ BitVec 32) (_ BitVec 64))) (size!21211 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43420)

(declare-datatypes ((List!14753 0))(
  ( (Nil!14750) (Cons!14749 (h!15878 (_ BitVec 64)) (t!21068 List!14753)) )
))
(declare-fun arrayNoDuplicates!0 (array!43420 (_ BitVec 32) List!14753) Bool)

(assert (=> b!798660 (= res!543183 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14750))))

(declare-fun b!798661 () Bool)

(declare-fun res!543180 () Bool)

(assert (=> b!798661 (=> (not res!543180) (not e!442980))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798661 (= res!543180 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21211 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20790 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21211 a!3170)) (= (select (arr!20790 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798663 () Bool)

(declare-fun e!442979 () Bool)

(declare-datatypes ((SeekEntryResult!8381 0))(
  ( (MissingZero!8381 (index!35892 (_ BitVec 32))) (Found!8381 (index!35893 (_ BitVec 32))) (Intermediate!8381 (undefined!9193 Bool) (index!35894 (_ BitVec 32)) (x!66779 (_ BitVec 32))) (Undefined!8381) (MissingVacant!8381 (index!35895 (_ BitVec 32))) )
))
(declare-fun lt!356534 () SeekEntryResult!8381)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!356531 () SeekEntryResult!8381)

(assert (=> b!798663 (= e!442979 (and (= lt!356534 lt!356531) (= lt!356531 (Found!8381 j!153)) (not (= (select (arr!20790 a!3170) index!1236) (select (arr!20790 a!3170) j!153))) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43420 (_ BitVec 32)) SeekEntryResult!8381)

(assert (=> b!798663 (= lt!356531 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20790 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43420 (_ BitVec 32)) SeekEntryResult!8381)

(assert (=> b!798663 (= lt!356534 (seekEntryOrOpen!0 (select (arr!20790 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798664 () Bool)

(declare-fun res!543187 () Bool)

(declare-fun e!442981 () Bool)

(assert (=> b!798664 (=> (not res!543187) (not e!442981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798664 (= res!543187 (validKeyInArray!0 (select (arr!20790 a!3170) j!153)))))

(declare-fun b!798665 () Bool)

(assert (=> b!798665 (= e!442980 e!442979)))

(declare-fun res!543184 () Bool)

(assert (=> b!798665 (=> (not res!543184) (not e!442979))))

(declare-fun lt!356532 () array!43420)

(declare-fun lt!356530 () (_ BitVec 64))

(assert (=> b!798665 (= res!543184 (= (seekEntryOrOpen!0 lt!356530 lt!356532 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356530 lt!356532 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!798665 (= lt!356530 (select (store (arr!20790 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798665 (= lt!356532 (array!43421 (store (arr!20790 a!3170) i!1163 k!2044) (size!21211 a!3170)))))

(declare-fun b!798662 () Bool)

(assert (=> b!798662 (= e!442981 e!442980)))

(declare-fun res!543188 () Bool)

(assert (=> b!798662 (=> (not res!543188) (not e!442980))))

(declare-fun lt!356533 () SeekEntryResult!8381)

(assert (=> b!798662 (= res!543188 (or (= lt!356533 (MissingZero!8381 i!1163)) (= lt!356533 (MissingVacant!8381 i!1163))))))

(assert (=> b!798662 (= lt!356533 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!543182 () Bool)

(assert (=> start!68630 (=> (not res!543182) (not e!442981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68630 (= res!543182 (validMask!0 mask!3266))))

(assert (=> start!68630 e!442981))

(assert (=> start!68630 true))

(declare-fun array_inv!16586 (array!43420) Bool)

(assert (=> start!68630 (array_inv!16586 a!3170)))

(declare-fun b!798666 () Bool)

(declare-fun res!543181 () Bool)

(assert (=> b!798666 (=> (not res!543181) (not e!442981))))

(assert (=> b!798666 (= res!543181 (and (= (size!21211 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21211 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21211 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798667 () Bool)

(declare-fun res!543179 () Bool)

(assert (=> b!798667 (=> (not res!543179) (not e!442981))))

(assert (=> b!798667 (= res!543179 (validKeyInArray!0 k!2044))))

(declare-fun b!798668 () Bool)

(declare-fun res!543186 () Bool)

(assert (=> b!798668 (=> (not res!543186) (not e!442980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43420 (_ BitVec 32)) Bool)

(assert (=> b!798668 (= res!543186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798669 () Bool)

(declare-fun res!543185 () Bool)

(assert (=> b!798669 (=> (not res!543185) (not e!442981))))

(declare-fun arrayContainsKey!0 (array!43420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798669 (= res!543185 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68630 res!543182) b!798666))

(assert (= (and b!798666 res!543181) b!798664))

(assert (= (and b!798664 res!543187) b!798667))

(assert (= (and b!798667 res!543179) b!798669))

(assert (= (and b!798669 res!543185) b!798662))

(assert (= (and b!798662 res!543188) b!798668))

(assert (= (and b!798668 res!543186) b!798660))

(assert (= (and b!798660 res!543183) b!798661))

(assert (= (and b!798661 res!543180) b!798665))

(assert (= (and b!798665 res!543184) b!798663))

(declare-fun m!739601 () Bool)

(assert (=> b!798669 m!739601))

(declare-fun m!739603 () Bool)

(assert (=> b!798661 m!739603))

(declare-fun m!739605 () Bool)

(assert (=> b!798661 m!739605))

(declare-fun m!739607 () Bool)

(assert (=> b!798667 m!739607))

(declare-fun m!739609 () Bool)

(assert (=> b!798663 m!739609))

(declare-fun m!739611 () Bool)

(assert (=> b!798663 m!739611))

(assert (=> b!798663 m!739611))

(declare-fun m!739613 () Bool)

(assert (=> b!798663 m!739613))

(assert (=> b!798663 m!739611))

(declare-fun m!739615 () Bool)

(assert (=> b!798663 m!739615))

(declare-fun m!739617 () Bool)

(assert (=> start!68630 m!739617))

(declare-fun m!739619 () Bool)

(assert (=> start!68630 m!739619))

(declare-fun m!739621 () Bool)

(assert (=> b!798662 m!739621))

(declare-fun m!739623 () Bool)

(assert (=> b!798660 m!739623))

(declare-fun m!739625 () Bool)

(assert (=> b!798668 m!739625))

(declare-fun m!739627 () Bool)

(assert (=> b!798665 m!739627))

(declare-fun m!739629 () Bool)

(assert (=> b!798665 m!739629))

(declare-fun m!739631 () Bool)

(assert (=> b!798665 m!739631))

(declare-fun m!739633 () Bool)

(assert (=> b!798665 m!739633))

(assert (=> b!798664 m!739611))

(assert (=> b!798664 m!739611))

(declare-fun m!739635 () Bool)

(assert (=> b!798664 m!739635))

(push 1)

(assert (not b!798660))

(assert (not b!798664))

(assert (not b!798667))

(assert (not b!798663))

(assert (not b!798669))

(assert (not b!798668))

(assert (not b!798665))

(assert (not b!798662))

(assert (not start!68630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

