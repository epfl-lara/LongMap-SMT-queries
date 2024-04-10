; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68416 () Bool)

(assert start!68416)

(declare-fun b!795135 () Bool)

(declare-fun res!539657 () Bool)

(declare-fun e!441380 () Bool)

(assert (=> b!795135 (=> (not res!539657) (not e!441380))))

(declare-datatypes ((array!43206 0))(
  ( (array!43207 (arr!20683 (Array (_ BitVec 32) (_ BitVec 64))) (size!21104 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43206)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795135 (= res!539657 (and (= (size!21104 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21104 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21104 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795136 () Bool)

(declare-fun res!539654 () Bool)

(assert (=> b!795136 (=> (not res!539654) (not e!441380))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795136 (= res!539654 (validKeyInArray!0 k0!2044))))

(declare-fun b!795137 () Bool)

(declare-fun e!441382 () Bool)

(declare-fun e!441381 () Bool)

(assert (=> b!795137 (= e!441382 e!441381)))

(declare-fun res!539655 () Bool)

(assert (=> b!795137 (=> (not res!539655) (not e!441381))))

(declare-fun lt!354424 () array!43206)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354423 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8274 0))(
  ( (MissingZero!8274 (index!35464 (_ BitVec 32))) (Found!8274 (index!35465 (_ BitVec 32))) (Intermediate!8274 (undefined!9086 Bool) (index!35466 (_ BitVec 32)) (x!66384 (_ BitVec 32))) (Undefined!8274) (MissingVacant!8274 (index!35467 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43206 (_ BitVec 32)) SeekEntryResult!8274)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43206 (_ BitVec 32)) SeekEntryResult!8274)

(assert (=> b!795137 (= res!539655 (= (seekEntryOrOpen!0 lt!354423 lt!354424 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354423 lt!354424 mask!3266)))))

(assert (=> b!795137 (= lt!354423 (select (store (arr!20683 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795137 (= lt!354424 (array!43207 (store (arr!20683 a!3170) i!1163 k0!2044) (size!21104 a!3170)))))

(declare-fun b!795138 () Bool)

(declare-fun res!539660 () Bool)

(assert (=> b!795138 (=> (not res!539660) (not e!441380))))

(assert (=> b!795138 (= res!539660 (validKeyInArray!0 (select (arr!20683 a!3170) j!153)))))

(declare-fun b!795140 () Bool)

(declare-fun res!539656 () Bool)

(assert (=> b!795140 (=> (not res!539656) (not e!441382))))

(declare-datatypes ((List!14646 0))(
  ( (Nil!14643) (Cons!14642 (h!15771 (_ BitVec 64)) (t!20961 List!14646)) )
))
(declare-fun arrayNoDuplicates!0 (array!43206 (_ BitVec 32) List!14646) Bool)

(assert (=> b!795140 (= res!539656 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14643))))

(declare-fun b!795141 () Bool)

(assert (=> b!795141 (= e!441380 e!441382)))

(declare-fun res!539663 () Bool)

(assert (=> b!795141 (=> (not res!539663) (not e!441382))))

(declare-fun lt!354425 () SeekEntryResult!8274)

(assert (=> b!795141 (= res!539663 (or (= lt!354425 (MissingZero!8274 i!1163)) (= lt!354425 (MissingVacant!8274 i!1163))))))

(assert (=> b!795141 (= lt!354425 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795142 () Bool)

(assert (=> b!795142 (= e!441381 false)))

(declare-fun lt!354422 () SeekEntryResult!8274)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795142 (= lt!354422 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20683 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354421 () SeekEntryResult!8274)

(assert (=> b!795142 (= lt!354421 (seekEntryOrOpen!0 (select (arr!20683 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795143 () Bool)

(declare-fun res!539661 () Bool)

(assert (=> b!795143 (=> (not res!539661) (not e!441380))))

(declare-fun arrayContainsKey!0 (array!43206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795143 (= res!539661 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795144 () Bool)

(declare-fun res!539659 () Bool)

(assert (=> b!795144 (=> (not res!539659) (not e!441382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43206 (_ BitVec 32)) Bool)

(assert (=> b!795144 (= res!539659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795139 () Bool)

(declare-fun res!539658 () Bool)

(assert (=> b!795139 (=> (not res!539658) (not e!441382))))

(assert (=> b!795139 (= res!539658 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21104 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20683 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21104 a!3170)) (= (select (arr!20683 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!539662 () Bool)

(assert (=> start!68416 (=> (not res!539662) (not e!441380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68416 (= res!539662 (validMask!0 mask!3266))))

(assert (=> start!68416 e!441380))

(assert (=> start!68416 true))

(declare-fun array_inv!16479 (array!43206) Bool)

(assert (=> start!68416 (array_inv!16479 a!3170)))

(assert (= (and start!68416 res!539662) b!795135))

(assert (= (and b!795135 res!539657) b!795138))

(assert (= (and b!795138 res!539660) b!795136))

(assert (= (and b!795136 res!539654) b!795143))

(assert (= (and b!795143 res!539661) b!795141))

(assert (= (and b!795141 res!539663) b!795144))

(assert (= (and b!795144 res!539659) b!795140))

(assert (= (and b!795140 res!539656) b!795139))

(assert (= (and b!795139 res!539658) b!795137))

(assert (= (and b!795137 res!539655) b!795142))

(declare-fun m!735729 () Bool)

(assert (=> b!795138 m!735729))

(assert (=> b!795138 m!735729))

(declare-fun m!735731 () Bool)

(assert (=> b!795138 m!735731))

(declare-fun m!735733 () Bool)

(assert (=> b!795136 m!735733))

(declare-fun m!735735 () Bool)

(assert (=> b!795137 m!735735))

(declare-fun m!735737 () Bool)

(assert (=> b!795137 m!735737))

(declare-fun m!735739 () Bool)

(assert (=> b!795137 m!735739))

(declare-fun m!735741 () Bool)

(assert (=> b!795137 m!735741))

(declare-fun m!735743 () Bool)

(assert (=> b!795139 m!735743))

(declare-fun m!735745 () Bool)

(assert (=> b!795139 m!735745))

(declare-fun m!735747 () Bool)

(assert (=> start!68416 m!735747))

(declare-fun m!735749 () Bool)

(assert (=> start!68416 m!735749))

(declare-fun m!735751 () Bool)

(assert (=> b!795140 m!735751))

(declare-fun m!735753 () Bool)

(assert (=> b!795141 m!735753))

(declare-fun m!735755 () Bool)

(assert (=> b!795143 m!735755))

(declare-fun m!735757 () Bool)

(assert (=> b!795144 m!735757))

(assert (=> b!795142 m!735729))

(assert (=> b!795142 m!735729))

(declare-fun m!735759 () Bool)

(assert (=> b!795142 m!735759))

(assert (=> b!795142 m!735729))

(declare-fun m!735761 () Bool)

(assert (=> b!795142 m!735761))

(check-sat (not b!795137) (not b!795144) (not b!795136) (not b!795140) (not b!795143) (not b!795142) (not b!795138) (not b!795141) (not start!68416))
(check-sat)
