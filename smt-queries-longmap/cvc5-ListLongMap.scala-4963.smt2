; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68272 () Bool)

(assert start!68272)

(declare-fun b!793099 () Bool)

(declare-fun res!537763 () Bool)

(declare-fun e!440574 () Bool)

(assert (=> b!793099 (=> (not res!537763) (not e!440574))))

(declare-datatypes ((array!43079 0))(
  ( (array!43080 (arr!20620 (Array (_ BitVec 32) (_ BitVec 64))) (size!21041 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43079)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793099 (= res!537763 (validKeyInArray!0 (select (arr!20620 a!3170) j!153)))))

(declare-fun b!793100 () Bool)

(declare-fun res!537758 () Bool)

(assert (=> b!793100 (=> (not res!537758) (not e!440574))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793100 (= res!537758 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793101 () Bool)

(declare-fun res!537762 () Bool)

(declare-fun e!440573 () Bool)

(assert (=> b!793101 (=> (not res!537762) (not e!440573))))

(declare-datatypes ((List!14622 0))(
  ( (Nil!14619) (Cons!14618 (h!15747 (_ BitVec 64)) (t!20928 List!14622)) )
))
(declare-fun arrayNoDuplicates!0 (array!43079 (_ BitVec 32) List!14622) Bool)

(assert (=> b!793101 (= res!537762 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14619))))

(declare-fun b!793102 () Bool)

(declare-fun res!537759 () Bool)

(assert (=> b!793102 (=> (not res!537759) (not e!440574))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793102 (= res!537759 (and (= (size!21041 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21041 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21041 a!3170)) (not (= i!1163 j!153))))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!793103 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793103 (= e!440573 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21041 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20620 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21041 a!3170)) (= (select (arr!20620 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!793104 () Bool)

(declare-fun res!537765 () Bool)

(assert (=> b!793104 (=> (not res!537765) (not e!440574))))

(assert (=> b!793104 (= res!537765 (validKeyInArray!0 k!2044))))

(declare-fun b!793105 () Bool)

(declare-fun res!537760 () Bool)

(assert (=> b!793105 (=> (not res!537760) (not e!440573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43079 (_ BitVec 32)) Bool)

(assert (=> b!793105 (= res!537760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!537764 () Bool)

(assert (=> start!68272 (=> (not res!537764) (not e!440574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68272 (= res!537764 (validMask!0 mask!3266))))

(assert (=> start!68272 e!440574))

(assert (=> start!68272 true))

(declare-fun array_inv!16503 (array!43079) Bool)

(assert (=> start!68272 (array_inv!16503 a!3170)))

(declare-fun b!793106 () Bool)

(assert (=> b!793106 (= e!440574 e!440573)))

(declare-fun res!537761 () Bool)

(assert (=> b!793106 (=> (not res!537761) (not e!440573))))

(declare-datatypes ((SeekEntryResult!8208 0))(
  ( (MissingZero!8208 (index!35200 (_ BitVec 32))) (Found!8208 (index!35201 (_ BitVec 32))) (Intermediate!8208 (undefined!9020 Bool) (index!35202 (_ BitVec 32)) (x!66145 (_ BitVec 32))) (Undefined!8208) (MissingVacant!8208 (index!35203 (_ BitVec 32))) )
))
(declare-fun lt!353453 () SeekEntryResult!8208)

(assert (=> b!793106 (= res!537761 (or (= lt!353453 (MissingZero!8208 i!1163)) (= lt!353453 (MissingVacant!8208 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43079 (_ BitVec 32)) SeekEntryResult!8208)

(assert (=> b!793106 (= lt!353453 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68272 res!537764) b!793102))

(assert (= (and b!793102 res!537759) b!793099))

(assert (= (and b!793099 res!537763) b!793104))

(assert (= (and b!793104 res!537765) b!793100))

(assert (= (and b!793100 res!537758) b!793106))

(assert (= (and b!793106 res!537761) b!793105))

(assert (= (and b!793105 res!537760) b!793101))

(assert (= (and b!793101 res!537762) b!793103))

(declare-fun m!733071 () Bool)

(assert (=> b!793103 m!733071))

(declare-fun m!733073 () Bool)

(assert (=> b!793103 m!733073))

(declare-fun m!733075 () Bool)

(assert (=> b!793105 m!733075))

(declare-fun m!733077 () Bool)

(assert (=> start!68272 m!733077))

(declare-fun m!733079 () Bool)

(assert (=> start!68272 m!733079))

(declare-fun m!733081 () Bool)

(assert (=> b!793100 m!733081))

(declare-fun m!733083 () Bool)

(assert (=> b!793104 m!733083))

(declare-fun m!733085 () Bool)

(assert (=> b!793106 m!733085))

(declare-fun m!733087 () Bool)

(assert (=> b!793099 m!733087))

(assert (=> b!793099 m!733087))

(declare-fun m!733089 () Bool)

(assert (=> b!793099 m!733089))

(declare-fun m!733091 () Bool)

(assert (=> b!793101 m!733091))

(push 1)

(assert (not b!793100))

(assert (not b!793105))

(assert (not b!793106))

(assert (not start!68272))

(assert (not b!793104))

(assert (not b!793101))

(assert (not b!793099))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

