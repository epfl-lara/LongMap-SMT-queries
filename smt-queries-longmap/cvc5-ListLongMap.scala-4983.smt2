; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68536 () Bool)

(assert start!68536)

(declare-fun b!795725 () Bool)

(declare-fun res!539876 () Bool)

(declare-fun e!441780 () Bool)

(assert (=> b!795725 (=> (not res!539876) (not e!441780))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43200 0))(
  ( (array!43201 (arr!20676 (Array (_ BitVec 32) (_ BitVec 64))) (size!21096 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43200)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!795725 (= res!539876 (and (= (size!21096 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21096 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21096 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!539878 () Bool)

(assert (=> start!68536 (=> (not res!539878) (not e!441780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68536 (= res!539878 (validMask!0 mask!3266))))

(assert (=> start!68536 e!441780))

(assert (=> start!68536 true))

(declare-fun array_inv!16535 (array!43200) Bool)

(assert (=> start!68536 (array_inv!16535 a!3170)))

(declare-fun b!795726 () Bool)

(declare-fun res!539870 () Bool)

(assert (=> b!795726 (=> (not res!539870) (not e!441780))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795726 (= res!539870 (validKeyInArray!0 k!2044))))

(declare-fun b!795727 () Bool)

(declare-fun res!539873 () Bool)

(assert (=> b!795727 (=> (not res!539873) (not e!441780))))

(declare-fun arrayContainsKey!0 (array!43200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795727 (= res!539873 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795728 () Bool)

(declare-fun res!539872 () Bool)

(declare-fun e!441779 () Bool)

(assert (=> b!795728 (=> (not res!539872) (not e!441779))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8223 0))(
  ( (MissingZero!8223 (index!35260 (_ BitVec 32))) (Found!8223 (index!35261 (_ BitVec 32))) (Intermediate!8223 (undefined!9035 Bool) (index!35262 (_ BitVec 32)) (x!66336 (_ BitVec 32))) (Undefined!8223) (MissingVacant!8223 (index!35263 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43200 (_ BitVec 32)) SeekEntryResult!8223)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43200 (_ BitVec 32)) SeekEntryResult!8223)

(assert (=> b!795728 (= res!539872 (= (seekEntryOrOpen!0 (select (arr!20676 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20676 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!795729 () Bool)

(declare-fun res!539879 () Bool)

(declare-fun e!441778 () Bool)

(assert (=> b!795729 (=> (not res!539879) (not e!441778))))

(declare-datatypes ((List!14546 0))(
  ( (Nil!14543) (Cons!14542 (h!15677 (_ BitVec 64)) (t!20853 List!14546)) )
))
(declare-fun arrayNoDuplicates!0 (array!43200 (_ BitVec 32) List!14546) Bool)

(assert (=> b!795729 (= res!539879 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14543))))

(declare-fun b!795730 () Bool)

(assert (=> b!795730 (= e!441778 e!441779)))

(declare-fun res!539871 () Bool)

(assert (=> b!795730 (=> (not res!539871) (not e!441779))))

(declare-fun lt!354666 () (_ BitVec 64))

(declare-fun lt!354665 () array!43200)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!795730 (= res!539871 (= (seekEntryOrOpen!0 lt!354666 lt!354665 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354666 lt!354665 mask!3266)))))

(assert (=> b!795730 (= lt!354666 (select (store (arr!20676 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795730 (= lt!354665 (array!43201 (store (arr!20676 a!3170) i!1163 k!2044) (size!21096 a!3170)))))

(declare-fun b!795731 () Bool)

(assert (=> b!795731 (= e!441779 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun b!795732 () Bool)

(assert (=> b!795732 (= e!441780 e!441778)))

(declare-fun res!539874 () Bool)

(assert (=> b!795732 (=> (not res!539874) (not e!441778))))

(declare-fun lt!354667 () SeekEntryResult!8223)

(assert (=> b!795732 (= res!539874 (or (= lt!354667 (MissingZero!8223 i!1163)) (= lt!354667 (MissingVacant!8223 i!1163))))))

(assert (=> b!795732 (= lt!354667 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795733 () Bool)

(declare-fun res!539880 () Bool)

(assert (=> b!795733 (=> (not res!539880) (not e!441778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43200 (_ BitVec 32)) Bool)

(assert (=> b!795733 (= res!539880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795734 () Bool)

(declare-fun res!539875 () Bool)

(assert (=> b!795734 (=> (not res!539875) (not e!441780))))

(assert (=> b!795734 (= res!539875 (validKeyInArray!0 (select (arr!20676 a!3170) j!153)))))

(declare-fun b!795735 () Bool)

(declare-fun res!539877 () Bool)

(assert (=> b!795735 (=> (not res!539877) (not e!441778))))

(assert (=> b!795735 (= res!539877 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21096 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20676 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21096 a!3170)) (= (select (arr!20676 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68536 res!539878) b!795725))

(assert (= (and b!795725 res!539876) b!795734))

(assert (= (and b!795734 res!539875) b!795726))

(assert (= (and b!795726 res!539870) b!795727))

(assert (= (and b!795727 res!539873) b!795732))

(assert (= (and b!795732 res!539874) b!795733))

(assert (= (and b!795733 res!539880) b!795729))

(assert (= (and b!795729 res!539879) b!795735))

(assert (= (and b!795735 res!539877) b!795730))

(assert (= (and b!795730 res!539871) b!795728))

(assert (= (and b!795728 res!539872) b!795731))

(declare-fun m!736741 () Bool)

(assert (=> b!795733 m!736741))

(declare-fun m!736743 () Bool)

(assert (=> b!795730 m!736743))

(declare-fun m!736745 () Bool)

(assert (=> b!795730 m!736745))

(declare-fun m!736747 () Bool)

(assert (=> b!795730 m!736747))

(declare-fun m!736749 () Bool)

(assert (=> b!795730 m!736749))

(declare-fun m!736751 () Bool)

(assert (=> start!68536 m!736751))

(declare-fun m!736753 () Bool)

(assert (=> start!68536 m!736753))

(declare-fun m!736755 () Bool)

(assert (=> b!795726 m!736755))

(declare-fun m!736757 () Bool)

(assert (=> b!795735 m!736757))

(declare-fun m!736759 () Bool)

(assert (=> b!795735 m!736759))

(declare-fun m!736761 () Bool)

(assert (=> b!795729 m!736761))

(declare-fun m!736763 () Bool)

(assert (=> b!795727 m!736763))

(declare-fun m!736765 () Bool)

(assert (=> b!795734 m!736765))

(assert (=> b!795734 m!736765))

(declare-fun m!736767 () Bool)

(assert (=> b!795734 m!736767))

(assert (=> b!795728 m!736765))

(assert (=> b!795728 m!736765))

(declare-fun m!736769 () Bool)

(assert (=> b!795728 m!736769))

(assert (=> b!795728 m!736765))

(declare-fun m!736771 () Bool)

(assert (=> b!795728 m!736771))

(declare-fun m!736773 () Bool)

(assert (=> b!795732 m!736773))

(push 1)

(assert (not b!795733))

(assert (not b!795729))

(assert (not start!68536))

(assert (not b!795726))

(assert (not b!795734))

(assert (not b!795727))

(assert (not b!795728))

(assert (not b!795732))

(assert (not b!795730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

