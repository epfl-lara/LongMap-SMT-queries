; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68244 () Bool)

(assert start!68244)

(declare-fun b!792781 () Bool)

(declare-fun res!537442 () Bool)

(declare-fun e!440449 () Bool)

(assert (=> b!792781 (=> (not res!537442) (not e!440449))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792781 (= res!537442 (validKeyInArray!0 k0!2044))))

(declare-fun b!792782 () Bool)

(declare-fun res!537441 () Bool)

(assert (=> b!792782 (=> (not res!537441) (not e!440449))))

(declare-datatypes ((array!43051 0))(
  ( (array!43052 (arr!20606 (Array (_ BitVec 32) (_ BitVec 64))) (size!21027 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43051)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792782 (= res!537441 (validKeyInArray!0 (select (arr!20606 a!3170) j!153)))))

(declare-fun res!537446 () Bool)

(assert (=> start!68244 (=> (not res!537446) (not e!440449))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68244 (= res!537446 (validMask!0 mask!3266))))

(assert (=> start!68244 e!440449))

(assert (=> start!68244 true))

(declare-fun array_inv!16489 (array!43051) Bool)

(assert (=> start!68244 (array_inv!16489 a!3170)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!792783 () Bool)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun e!440448 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!792783 (= e!440448 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21027 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20606 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21027 a!3170)) (= (select (arr!20606 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!792784 () Bool)

(declare-fun res!537440 () Bool)

(assert (=> b!792784 (=> (not res!537440) (not e!440449))))

(declare-fun arrayContainsKey!0 (array!43051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792784 (= res!537440 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792785 () Bool)

(declare-fun res!537447 () Bool)

(assert (=> b!792785 (=> (not res!537447) (not e!440449))))

(assert (=> b!792785 (= res!537447 (and (= (size!21027 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21027 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21027 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792786 () Bool)

(assert (=> b!792786 (= e!440449 e!440448)))

(declare-fun res!537443 () Bool)

(assert (=> b!792786 (=> (not res!537443) (not e!440448))))

(declare-datatypes ((SeekEntryResult!8194 0))(
  ( (MissingZero!8194 (index!35144 (_ BitVec 32))) (Found!8194 (index!35145 (_ BitVec 32))) (Intermediate!8194 (undefined!9006 Bool) (index!35146 (_ BitVec 32)) (x!66099 (_ BitVec 32))) (Undefined!8194) (MissingVacant!8194 (index!35147 (_ BitVec 32))) )
))
(declare-fun lt!353393 () SeekEntryResult!8194)

(assert (=> b!792786 (= res!537443 (or (= lt!353393 (MissingZero!8194 i!1163)) (= lt!353393 (MissingVacant!8194 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43051 (_ BitVec 32)) SeekEntryResult!8194)

(assert (=> b!792786 (= lt!353393 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792787 () Bool)

(declare-fun res!537445 () Bool)

(assert (=> b!792787 (=> (not res!537445) (not e!440448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43051 (_ BitVec 32)) Bool)

(assert (=> b!792787 (= res!537445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792788 () Bool)

(declare-fun res!537444 () Bool)

(assert (=> b!792788 (=> (not res!537444) (not e!440448))))

(declare-datatypes ((List!14608 0))(
  ( (Nil!14605) (Cons!14604 (h!15733 (_ BitVec 64)) (t!20914 List!14608)) )
))
(declare-fun arrayNoDuplicates!0 (array!43051 (_ BitVec 32) List!14608) Bool)

(assert (=> b!792788 (= res!537444 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14605))))

(assert (= (and start!68244 res!537446) b!792785))

(assert (= (and b!792785 res!537447) b!792782))

(assert (= (and b!792782 res!537441) b!792781))

(assert (= (and b!792781 res!537442) b!792784))

(assert (= (and b!792784 res!537440) b!792786))

(assert (= (and b!792786 res!537443) b!792787))

(assert (= (and b!792787 res!537445) b!792788))

(assert (= (and b!792788 res!537444) b!792783))

(declare-fun m!732787 () Bool)

(assert (=> start!68244 m!732787))

(declare-fun m!732789 () Bool)

(assert (=> start!68244 m!732789))

(declare-fun m!732791 () Bool)

(assert (=> b!792782 m!732791))

(assert (=> b!792782 m!732791))

(declare-fun m!732793 () Bool)

(assert (=> b!792782 m!732793))

(declare-fun m!732795 () Bool)

(assert (=> b!792781 m!732795))

(declare-fun m!732797 () Bool)

(assert (=> b!792787 m!732797))

(declare-fun m!732799 () Bool)

(assert (=> b!792788 m!732799))

(declare-fun m!732801 () Bool)

(assert (=> b!792786 m!732801))

(declare-fun m!732803 () Bool)

(assert (=> b!792784 m!732803))

(declare-fun m!732805 () Bool)

(assert (=> b!792783 m!732805))

(declare-fun m!732807 () Bool)

(assert (=> b!792783 m!732807))

(check-sat (not b!792781) (not b!792788) (not b!792786) (not b!792787) (not start!68244) (not b!792782) (not b!792784))
(check-sat)
