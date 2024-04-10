; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68276 () Bool)

(assert start!68276)

(declare-fun b!793166 () Bool)

(declare-fun res!537691 () Bool)

(declare-fun e!440657 () Bool)

(assert (=> b!793166 (=> (not res!537691) (not e!440657))))

(declare-datatypes ((array!43066 0))(
  ( (array!43067 (arr!20613 (Array (_ BitVec 32) (_ BitVec 64))) (size!21034 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43066)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793166 (= res!537691 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793168 () Bool)

(declare-fun res!537692 () Bool)

(declare-fun e!440655 () Bool)

(assert (=> b!793168 (=> (not res!537692) (not e!440655))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43066 (_ BitVec 32)) Bool)

(assert (=> b!793168 (= res!537692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793169 () Bool)

(declare-fun res!537685 () Bool)

(assert (=> b!793169 (=> (not res!537685) (not e!440657))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793169 (= res!537685 (and (= (size!21034 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21034 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21034 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793170 () Bool)

(assert (=> b!793170 (= e!440657 e!440655)))

(declare-fun res!537690 () Bool)

(assert (=> b!793170 (=> (not res!537690) (not e!440655))))

(declare-datatypes ((SeekEntryResult!8204 0))(
  ( (MissingZero!8204 (index!35184 (_ BitVec 32))) (Found!8204 (index!35185 (_ BitVec 32))) (Intermediate!8204 (undefined!9016 Bool) (index!35186 (_ BitVec 32)) (x!66130 (_ BitVec 32))) (Undefined!8204) (MissingVacant!8204 (index!35187 (_ BitVec 32))) )
))
(declare-fun lt!353660 () SeekEntryResult!8204)

(assert (=> b!793170 (= res!537690 (or (= lt!353660 (MissingZero!8204 i!1163)) (= lt!353660 (MissingVacant!8204 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43066 (_ BitVec 32)) SeekEntryResult!8204)

(assert (=> b!793170 (= lt!353660 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793171 () Bool)

(declare-fun res!537687 () Bool)

(assert (=> b!793171 (=> (not res!537687) (not e!440657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793171 (= res!537687 (validKeyInArray!0 k!2044))))

(declare-fun b!793167 () Bool)

(declare-fun res!537688 () Bool)

(assert (=> b!793167 (=> (not res!537688) (not e!440655))))

(declare-datatypes ((List!14576 0))(
  ( (Nil!14573) (Cons!14572 (h!15701 (_ BitVec 64)) (t!20891 List!14576)) )
))
(declare-fun arrayNoDuplicates!0 (array!43066 (_ BitVec 32) List!14576) Bool)

(assert (=> b!793167 (= res!537688 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14573))))

(declare-fun res!537689 () Bool)

(assert (=> start!68276 (=> (not res!537689) (not e!440657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68276 (= res!537689 (validMask!0 mask!3266))))

(assert (=> start!68276 e!440657))

(assert (=> start!68276 true))

(declare-fun array_inv!16409 (array!43066) Bool)

(assert (=> start!68276 (array_inv!16409 a!3170)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!793172 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793172 (= e!440655 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21034 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20613 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21034 a!3170)) (= (select (arr!20613 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!793173 () Bool)

(declare-fun res!537686 () Bool)

(assert (=> b!793173 (=> (not res!537686) (not e!440657))))

(assert (=> b!793173 (= res!537686 (validKeyInArray!0 (select (arr!20613 a!3170) j!153)))))

(assert (= (and start!68276 res!537689) b!793169))

(assert (= (and b!793169 res!537685) b!793173))

(assert (= (and b!793173 res!537686) b!793171))

(assert (= (and b!793171 res!537687) b!793166))

(assert (= (and b!793166 res!537691) b!793170))

(assert (= (and b!793170 res!537690) b!793168))

(assert (= (and b!793168 res!537692) b!793167))

(assert (= (and b!793167 res!537688) b!793172))

(declare-fun m!733649 () Bool)

(assert (=> b!793170 m!733649))

(declare-fun m!733651 () Bool)

(assert (=> b!793171 m!733651))

(declare-fun m!733653 () Bool)

(assert (=> start!68276 m!733653))

(declare-fun m!733655 () Bool)

(assert (=> start!68276 m!733655))

(declare-fun m!733657 () Bool)

(assert (=> b!793166 m!733657))

(declare-fun m!733659 () Bool)

(assert (=> b!793167 m!733659))

(declare-fun m!733661 () Bool)

(assert (=> b!793172 m!733661))

(declare-fun m!733663 () Bool)

(assert (=> b!793172 m!733663))

(declare-fun m!733665 () Bool)

(assert (=> b!793173 m!733665))

(assert (=> b!793173 m!733665))

(declare-fun m!733667 () Bool)

(assert (=> b!793173 m!733667))

(declare-fun m!733669 () Bool)

(assert (=> b!793168 m!733669))

(push 1)

(assert (not b!793167))

(assert (not start!68276))

(assert (not b!793171))

(assert (not b!793166))

(assert (not b!793173))

(assert (not b!793170))

(assert (not b!793168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

