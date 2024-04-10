; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68344 () Bool)

(assert start!68344)

(declare-fun b!794059 () Bool)

(declare-fun res!538582 () Bool)

(declare-fun e!440980 () Bool)

(assert (=> b!794059 (=> (not res!538582) (not e!440980))))

(declare-datatypes ((array!43134 0))(
  ( (array!43135 (arr!20647 (Array (_ BitVec 32) (_ BitVec 64))) (size!21068 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43134)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794059 (= res!538582 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794061 () Bool)

(declare-fun res!538583 () Bool)

(assert (=> b!794061 (=> (not res!538583) (not e!440980))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794061 (= res!538583 (validKeyInArray!0 (select (arr!20647 a!3170) j!153)))))

(declare-fun b!794062 () Bool)

(declare-fun res!538585 () Bool)

(assert (=> b!794062 (=> (not res!538585) (not e!440980))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794062 (= res!538585 (and (= (size!21068 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21068 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21068 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794063 () Bool)

(declare-fun res!538586 () Bool)

(declare-fun e!440981 () Bool)

(assert (=> b!794063 (=> (not res!538586) (not e!440981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43134 (_ BitVec 32)) Bool)

(assert (=> b!794063 (= res!538586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794064 () Bool)

(declare-fun res!538579 () Bool)

(assert (=> b!794064 (=> (not res!538579) (not e!440981))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794064 (= res!538579 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21068 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20647 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21068 a!3170)) (= (select (arr!20647 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!538580 () Bool)

(assert (=> start!68344 (=> (not res!538580) (not e!440980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68344 (= res!538580 (validMask!0 mask!3266))))

(assert (=> start!68344 e!440980))

(assert (=> start!68344 true))

(declare-fun array_inv!16443 (array!43134) Bool)

(assert (=> start!68344 (array_inv!16443 a!3170)))

(declare-fun b!794060 () Bool)

(assert (=> b!794060 (= e!440981 false)))

(declare-fun lt!353973 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8238 0))(
  ( (MissingZero!8238 (index!35320 (_ BitVec 32))) (Found!8238 (index!35321 (_ BitVec 32))) (Intermediate!8238 (undefined!9050 Bool) (index!35322 (_ BitVec 32)) (x!66252 (_ BitVec 32))) (Undefined!8238) (MissingVacant!8238 (index!35323 (_ BitVec 32))) )
))
(declare-fun lt!353975 () SeekEntryResult!8238)

(declare-fun lt!353972 () array!43134)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43134 (_ BitVec 32)) SeekEntryResult!8238)

(assert (=> b!794060 (= lt!353975 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353973 lt!353972 mask!3266))))

(declare-fun lt!353971 () SeekEntryResult!8238)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43134 (_ BitVec 32)) SeekEntryResult!8238)

(assert (=> b!794060 (= lt!353971 (seekEntryOrOpen!0 lt!353973 lt!353972 mask!3266))))

(assert (=> b!794060 (= lt!353973 (select (store (arr!20647 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794060 (= lt!353972 (array!43135 (store (arr!20647 a!3170) i!1163 k0!2044) (size!21068 a!3170)))))

(declare-fun b!794065 () Bool)

(assert (=> b!794065 (= e!440980 e!440981)))

(declare-fun res!538578 () Bool)

(assert (=> b!794065 (=> (not res!538578) (not e!440981))))

(declare-fun lt!353974 () SeekEntryResult!8238)

(assert (=> b!794065 (= res!538578 (or (= lt!353974 (MissingZero!8238 i!1163)) (= lt!353974 (MissingVacant!8238 i!1163))))))

(assert (=> b!794065 (= lt!353974 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794066 () Bool)

(declare-fun res!538581 () Bool)

(assert (=> b!794066 (=> (not res!538581) (not e!440981))))

(declare-datatypes ((List!14610 0))(
  ( (Nil!14607) (Cons!14606 (h!15735 (_ BitVec 64)) (t!20925 List!14610)) )
))
(declare-fun arrayNoDuplicates!0 (array!43134 (_ BitVec 32) List!14610) Bool)

(assert (=> b!794066 (= res!538581 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14607))))

(declare-fun b!794067 () Bool)

(declare-fun res!538584 () Bool)

(assert (=> b!794067 (=> (not res!538584) (not e!440980))))

(assert (=> b!794067 (= res!538584 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68344 res!538580) b!794062))

(assert (= (and b!794062 res!538585) b!794061))

(assert (= (and b!794061 res!538583) b!794067))

(assert (= (and b!794067 res!538584) b!794059))

(assert (= (and b!794059 res!538582) b!794065))

(assert (= (and b!794065 res!538578) b!794063))

(assert (= (and b!794063 res!538586) b!794066))

(assert (= (and b!794066 res!538581) b!794064))

(assert (= (and b!794064 res!538579) b!794060))

(declare-fun m!734573 () Bool)

(assert (=> b!794060 m!734573))

(declare-fun m!734575 () Bool)

(assert (=> b!794060 m!734575))

(declare-fun m!734577 () Bool)

(assert (=> b!794060 m!734577))

(declare-fun m!734579 () Bool)

(assert (=> b!794060 m!734579))

(declare-fun m!734581 () Bool)

(assert (=> b!794067 m!734581))

(declare-fun m!734583 () Bool)

(assert (=> start!68344 m!734583))

(declare-fun m!734585 () Bool)

(assert (=> start!68344 m!734585))

(declare-fun m!734587 () Bool)

(assert (=> b!794059 m!734587))

(declare-fun m!734589 () Bool)

(assert (=> b!794066 m!734589))

(declare-fun m!734591 () Bool)

(assert (=> b!794064 m!734591))

(declare-fun m!734593 () Bool)

(assert (=> b!794064 m!734593))

(declare-fun m!734595 () Bool)

(assert (=> b!794065 m!734595))

(declare-fun m!734597 () Bool)

(assert (=> b!794063 m!734597))

(declare-fun m!734599 () Bool)

(assert (=> b!794061 m!734599))

(assert (=> b!794061 m!734599))

(declare-fun m!734601 () Bool)

(assert (=> b!794061 m!734601))

(check-sat (not b!794065) (not b!794063) (not b!794059) (not b!794061) (not b!794066) (not start!68344) (not b!794067) (not b!794060))
(check-sat)
