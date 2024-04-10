; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68312 () Bool)

(assert start!68312)

(declare-fun b!793611 () Bool)

(declare-fun res!538137 () Bool)

(declare-fun e!440819 () Bool)

(assert (=> b!793611 (=> (not res!538137) (not e!440819))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43102 0))(
  ( (array!43103 (arr!20631 (Array (_ BitVec 32) (_ BitVec 64))) (size!21052 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43102)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793611 (= res!538137 (and (= (size!21052 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21052 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21052 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793612 () Bool)

(declare-fun e!440820 () Bool)

(declare-fun e!440822 () Bool)

(assert (=> b!793612 (= e!440820 e!440822)))

(declare-fun res!538132 () Bool)

(assert (=> b!793612 (=> (not res!538132) (not e!440822))))

(declare-fun lt!353764 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!353763 () array!43102)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8222 0))(
  ( (MissingZero!8222 (index!35256 (_ BitVec 32))) (Found!8222 (index!35257 (_ BitVec 32))) (Intermediate!8222 (undefined!9034 Bool) (index!35258 (_ BitVec 32)) (x!66196 (_ BitVec 32))) (Undefined!8222) (MissingVacant!8222 (index!35259 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43102 (_ BitVec 32)) SeekEntryResult!8222)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43102 (_ BitVec 32)) SeekEntryResult!8222)

(assert (=> b!793612 (= res!538132 (= (seekEntryOrOpen!0 lt!353764 lt!353763 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353764 lt!353763 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!793612 (= lt!353764 (select (store (arr!20631 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793612 (= lt!353763 (array!43103 (store (arr!20631 a!3170) i!1163 k!2044) (size!21052 a!3170)))))

(declare-fun b!793613 () Bool)

(declare-fun res!538138 () Bool)

(assert (=> b!793613 (=> (not res!538138) (not e!440819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793613 (= res!538138 (validKeyInArray!0 k!2044))))

(declare-fun b!793614 () Bool)

(declare-fun res!538134 () Bool)

(assert (=> b!793614 (=> (not res!538134) (not e!440819))))

(assert (=> b!793614 (= res!538134 (validKeyInArray!0 (select (arr!20631 a!3170) j!153)))))

(declare-fun res!538139 () Bool)

(assert (=> start!68312 (=> (not res!538139) (not e!440819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68312 (= res!538139 (validMask!0 mask!3266))))

(assert (=> start!68312 e!440819))

(assert (=> start!68312 true))

(declare-fun array_inv!16427 (array!43102) Bool)

(assert (=> start!68312 (array_inv!16427 a!3170)))

(declare-fun b!793615 () Bool)

(assert (=> b!793615 (= e!440819 e!440820)))

(declare-fun res!538130 () Bool)

(assert (=> b!793615 (=> (not res!538130) (not e!440820))))

(declare-fun lt!353765 () SeekEntryResult!8222)

(assert (=> b!793615 (= res!538130 (or (= lt!353765 (MissingZero!8222 i!1163)) (= lt!353765 (MissingVacant!8222 i!1163))))))

(assert (=> b!793615 (= lt!353765 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793616 () Bool)

(declare-fun res!538135 () Bool)

(assert (=> b!793616 (=> (not res!538135) (not e!440820))))

(declare-datatypes ((List!14594 0))(
  ( (Nil!14591) (Cons!14590 (h!15719 (_ BitVec 64)) (t!20909 List!14594)) )
))
(declare-fun arrayNoDuplicates!0 (array!43102 (_ BitVec 32) List!14594) Bool)

(assert (=> b!793616 (= res!538135 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14591))))

(declare-fun b!793617 () Bool)

(declare-fun res!538133 () Bool)

(assert (=> b!793617 (=> (not res!538133) (not e!440820))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!793617 (= res!538133 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21052 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20631 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21052 a!3170)) (= (select (arr!20631 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793618 () Bool)

(declare-fun res!538136 () Bool)

(assert (=> b!793618 (=> (not res!538136) (not e!440819))))

(declare-fun arrayContainsKey!0 (array!43102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793618 (= res!538136 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793619 () Bool)

(assert (=> b!793619 (= e!440822 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!793620 () Bool)

(declare-fun res!538131 () Bool)

(assert (=> b!793620 (=> (not res!538131) (not e!440820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43102 (_ BitVec 32)) Bool)

(assert (=> b!793620 (= res!538131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68312 res!538139) b!793611))

(assert (= (and b!793611 res!538137) b!793614))

(assert (= (and b!793614 res!538134) b!793613))

(assert (= (and b!793613 res!538138) b!793618))

(assert (= (and b!793618 res!538136) b!793615))

(assert (= (and b!793615 res!538130) b!793620))

(assert (= (and b!793620 res!538131) b!793616))

(assert (= (and b!793616 res!538135) b!793617))

(assert (= (and b!793617 res!538133) b!793612))

(assert (= (and b!793612 res!538132) b!793619))

(declare-fun m!734093 () Bool)

(assert (=> b!793615 m!734093))

(declare-fun m!734095 () Bool)

(assert (=> b!793613 m!734095))

(declare-fun m!734097 () Bool)

(assert (=> b!793618 m!734097))

(declare-fun m!734099 () Bool)

(assert (=> start!68312 m!734099))

(declare-fun m!734101 () Bool)

(assert (=> start!68312 m!734101))

(declare-fun m!734103 () Bool)

(assert (=> b!793617 m!734103))

(declare-fun m!734105 () Bool)

(assert (=> b!793617 m!734105))

(declare-fun m!734107 () Bool)

(assert (=> b!793620 m!734107))

(declare-fun m!734109 () Bool)

(assert (=> b!793614 m!734109))

(assert (=> b!793614 m!734109))

(declare-fun m!734111 () Bool)

(assert (=> b!793614 m!734111))

(declare-fun m!734113 () Bool)

(assert (=> b!793616 m!734113))

(declare-fun m!734115 () Bool)

(assert (=> b!793612 m!734115))

(declare-fun m!734117 () Bool)

(assert (=> b!793612 m!734117))

(declare-fun m!734119 () Bool)

(assert (=> b!793612 m!734119))

(declare-fun m!734121 () Bool)

(assert (=> b!793612 m!734121))

(push 1)

(assert (not b!793612))

(assert (not b!793615))

