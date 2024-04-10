; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68358 () Bool)

(assert start!68358)

(declare-fun b!794257 () Bool)

(declare-fun res!538780 () Bool)

(declare-fun e!441052 () Bool)

(assert (=> b!794257 (=> (not res!538780) (not e!441052))))

(declare-datatypes ((array!43148 0))(
  ( (array!43149 (arr!20654 (Array (_ BitVec 32) (_ BitVec 64))) (size!21075 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43148)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794257 (= res!538780 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794258 () Bool)

(declare-fun res!538777 () Bool)

(declare-fun e!441053 () Bool)

(assert (=> b!794258 (=> (not res!538777) (not e!441053))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794258 (= res!538777 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21075 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20654 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21075 a!3170)) (= (select (arr!20654 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794259 () Bool)

(declare-fun res!538776 () Bool)

(assert (=> b!794259 (=> (not res!538776) (not e!441053))))

(declare-datatypes ((List!14617 0))(
  ( (Nil!14614) (Cons!14613 (h!15742 (_ BitVec 64)) (t!20932 List!14617)) )
))
(declare-fun arrayNoDuplicates!0 (array!43148 (_ BitVec 32) List!14617) Bool)

(assert (=> b!794259 (= res!538776 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14614))))

(declare-fun b!794260 () Bool)

(assert (=> b!794260 (= e!441053 false)))

(declare-fun lt!354058 () array!43148)

(declare-fun lt!354060 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8245 0))(
  ( (MissingZero!8245 (index!35348 (_ BitVec 32))) (Found!8245 (index!35349 (_ BitVec 32))) (Intermediate!8245 (undefined!9057 Bool) (index!35350 (_ BitVec 32)) (x!66275 (_ BitVec 32))) (Undefined!8245) (MissingVacant!8245 (index!35351 (_ BitVec 32))) )
))
(declare-fun lt!354062 () SeekEntryResult!8245)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43148 (_ BitVec 32)) SeekEntryResult!8245)

(assert (=> b!794260 (= lt!354062 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354060 lt!354058 mask!3266))))

(declare-fun lt!354061 () SeekEntryResult!8245)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43148 (_ BitVec 32)) SeekEntryResult!8245)

(assert (=> b!794260 (= lt!354061 (seekEntryOrOpen!0 lt!354060 lt!354058 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794260 (= lt!354060 (select (store (arr!20654 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794260 (= lt!354058 (array!43149 (store (arr!20654 a!3170) i!1163 k!2044) (size!21075 a!3170)))))

(declare-fun b!794261 () Bool)

(assert (=> b!794261 (= e!441052 e!441053)))

(declare-fun res!538782 () Bool)

(assert (=> b!794261 (=> (not res!538782) (not e!441053))))

(declare-fun lt!354059 () SeekEntryResult!8245)

(assert (=> b!794261 (= res!538782 (or (= lt!354059 (MissingZero!8245 i!1163)) (= lt!354059 (MissingVacant!8245 i!1163))))))

(assert (=> b!794261 (= lt!354059 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794262 () Bool)

(declare-fun res!538779 () Bool)

(assert (=> b!794262 (=> (not res!538779) (not e!441053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43148 (_ BitVec 32)) Bool)

(assert (=> b!794262 (= res!538779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!538783 () Bool)

(assert (=> start!68358 (=> (not res!538783) (not e!441052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68358 (= res!538783 (validMask!0 mask!3266))))

(assert (=> start!68358 e!441052))

(assert (=> start!68358 true))

(declare-fun array_inv!16450 (array!43148) Bool)

(assert (=> start!68358 (array_inv!16450 a!3170)))

(declare-fun b!794263 () Bool)

(declare-fun res!538778 () Bool)

(assert (=> b!794263 (=> (not res!538778) (not e!441052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794263 (= res!538778 (validKeyInArray!0 k!2044))))

(declare-fun b!794264 () Bool)

(declare-fun res!538781 () Bool)

(assert (=> b!794264 (=> (not res!538781) (not e!441052))))

(assert (=> b!794264 (= res!538781 (validKeyInArray!0 (select (arr!20654 a!3170) j!153)))))

(declare-fun b!794265 () Bool)

(declare-fun res!538784 () Bool)

(assert (=> b!794265 (=> (not res!538784) (not e!441052))))

(assert (=> b!794265 (= res!538784 (and (= (size!21075 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21075 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21075 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68358 res!538783) b!794265))

(assert (= (and b!794265 res!538784) b!794264))

(assert (= (and b!794264 res!538781) b!794263))

(assert (= (and b!794263 res!538778) b!794257))

(assert (= (and b!794257 res!538780) b!794261))

(assert (= (and b!794261 res!538782) b!794262))

(assert (= (and b!794262 res!538779) b!794259))

(assert (= (and b!794259 res!538776) b!794258))

(assert (= (and b!794258 res!538777) b!794260))

(declare-fun m!734783 () Bool)

(assert (=> start!68358 m!734783))

(declare-fun m!734785 () Bool)

(assert (=> start!68358 m!734785))

(declare-fun m!734787 () Bool)

(assert (=> b!794257 m!734787))

(declare-fun m!734789 () Bool)

(assert (=> b!794259 m!734789))

(declare-fun m!734791 () Bool)

(assert (=> b!794261 m!734791))

(declare-fun m!734793 () Bool)

(assert (=> b!794264 m!734793))

(assert (=> b!794264 m!734793))

(declare-fun m!734795 () Bool)

(assert (=> b!794264 m!734795))

(declare-fun m!734797 () Bool)

(assert (=> b!794263 m!734797))

(declare-fun m!734799 () Bool)

(assert (=> b!794262 m!734799))

(declare-fun m!734801 () Bool)

(assert (=> b!794260 m!734801))

(declare-fun m!734803 () Bool)

(assert (=> b!794260 m!734803))

(declare-fun m!734805 () Bool)

(assert (=> b!794260 m!734805))

(declare-fun m!734807 () Bool)

(assert (=> b!794260 m!734807))

(declare-fun m!734809 () Bool)

(assert (=> b!794258 m!734809))

(declare-fun m!734811 () Bool)

(assert (=> b!794258 m!734811))

(push 1)

(assert (not b!794264))

(assert (not b!794257))

(assert (not start!68358))

(assert (not b!794260))

