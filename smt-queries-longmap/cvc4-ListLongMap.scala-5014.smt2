; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68598 () Bool)

(assert start!68598)

(declare-fun b!798143 () Bool)

(declare-fun e!442752 () Bool)

(declare-fun e!442750 () Bool)

(assert (=> b!798143 (= e!442752 e!442750)))

(declare-fun res!542663 () Bool)

(assert (=> b!798143 (=> (not res!542663) (not e!442750))))

(declare-datatypes ((SeekEntryResult!8365 0))(
  ( (MissingZero!8365 (index!35828 (_ BitVec 32))) (Found!8365 (index!35829 (_ BitVec 32))) (Intermediate!8365 (undefined!9177 Bool) (index!35830 (_ BitVec 32)) (x!66715 (_ BitVec 32))) (Undefined!8365) (MissingVacant!8365 (index!35831 (_ BitVec 32))) )
))
(declare-fun lt!356228 () SeekEntryResult!8365)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798143 (= res!542663 (or (= lt!356228 (MissingZero!8365 i!1163)) (= lt!356228 (MissingVacant!8365 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43388 0))(
  ( (array!43389 (arr!20774 (Array (_ BitVec 32) (_ BitVec 64))) (size!21195 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43388)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43388 (_ BitVec 32)) SeekEntryResult!8365)

(assert (=> b!798143 (= lt!356228 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798144 () Bool)

(declare-fun e!442754 () Bool)

(declare-fun e!442753 () Bool)

(assert (=> b!798144 (= e!442754 e!442753)))

(declare-fun res!542665 () Bool)

(assert (=> b!798144 (=> (not res!542665) (not e!442753))))

(declare-fun lt!356227 () SeekEntryResult!8365)

(declare-fun lt!356226 () SeekEntryResult!8365)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798144 (= res!542665 (and (= lt!356227 lt!356226) (= lt!356226 (Found!8365 j!153)) (= (select (arr!20774 a!3170) index!1236) (select (arr!20774 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43388 (_ BitVec 32)) SeekEntryResult!8365)

(assert (=> b!798144 (= lt!356226 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20774 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798144 (= lt!356227 (seekEntryOrOpen!0 (select (arr!20774 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798145 () Bool)

(declare-fun res!542668 () Bool)

(assert (=> b!798145 (=> (not res!542668) (not e!442752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798145 (= res!542668 (validKeyInArray!0 k!2044))))

(declare-fun b!798146 () Bool)

(declare-fun res!542662 () Bool)

(assert (=> b!798146 (=> (not res!542662) (not e!442752))))

(declare-fun arrayContainsKey!0 (array!43388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798146 (= res!542662 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798147 () Bool)

(assert (=> b!798147 (= e!442750 e!442754)))

(declare-fun res!542669 () Bool)

(assert (=> b!798147 (=> (not res!542669) (not e!442754))))

(declare-fun lt!356230 () SeekEntryResult!8365)

(declare-fun lt!356229 () SeekEntryResult!8365)

(assert (=> b!798147 (= res!542669 (= lt!356230 lt!356229))))

(declare-fun lt!356225 () array!43388)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356231 () (_ BitVec 64))

(assert (=> b!798147 (= lt!356229 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356231 lt!356225 mask!3266))))

(assert (=> b!798147 (= lt!356230 (seekEntryOrOpen!0 lt!356231 lt!356225 mask!3266))))

(assert (=> b!798147 (= lt!356231 (select (store (arr!20774 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798147 (= lt!356225 (array!43389 (store (arr!20774 a!3170) i!1163 k!2044) (size!21195 a!3170)))))

(declare-fun b!798148 () Bool)

(declare-fun res!542672 () Bool)

(assert (=> b!798148 (=> (not res!542672) (not e!442750))))

(assert (=> b!798148 (= res!542672 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21195 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20774 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21195 a!3170)) (= (select (arr!20774 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!542671 () Bool)

(assert (=> start!68598 (=> (not res!542671) (not e!442752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68598 (= res!542671 (validMask!0 mask!3266))))

(assert (=> start!68598 e!442752))

(assert (=> start!68598 true))

(declare-fun array_inv!16570 (array!43388) Bool)

(assert (=> start!68598 (array_inv!16570 a!3170)))

(declare-fun b!798149 () Bool)

(declare-fun res!542664 () Bool)

(assert (=> b!798149 (=> (not res!542664) (not e!442750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43388 (_ BitVec 32)) Bool)

(assert (=> b!798149 (= res!542664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798150 () Bool)

(assert (=> b!798150 (= e!442753 (not true))))

(assert (=> b!798150 (= lt!356229 (Found!8365 index!1236))))

(declare-fun b!798151 () Bool)

(declare-fun res!542667 () Bool)

(assert (=> b!798151 (=> (not res!542667) (not e!442752))))

(assert (=> b!798151 (= res!542667 (validKeyInArray!0 (select (arr!20774 a!3170) j!153)))))

(declare-fun b!798152 () Bool)

(declare-fun res!542670 () Bool)

(assert (=> b!798152 (=> (not res!542670) (not e!442750))))

(declare-datatypes ((List!14737 0))(
  ( (Nil!14734) (Cons!14733 (h!15862 (_ BitVec 64)) (t!21052 List!14737)) )
))
(declare-fun arrayNoDuplicates!0 (array!43388 (_ BitVec 32) List!14737) Bool)

(assert (=> b!798152 (= res!542670 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14734))))

(declare-fun b!798153 () Bool)

(declare-fun res!542666 () Bool)

(assert (=> b!798153 (=> (not res!542666) (not e!442752))))

(assert (=> b!798153 (= res!542666 (and (= (size!21195 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21195 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21195 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68598 res!542671) b!798153))

(assert (= (and b!798153 res!542666) b!798151))

(assert (= (and b!798151 res!542667) b!798145))

(assert (= (and b!798145 res!542668) b!798146))

(assert (= (and b!798146 res!542662) b!798143))

(assert (= (and b!798143 res!542663) b!798149))

(assert (= (and b!798149 res!542664) b!798152))

(assert (= (and b!798152 res!542670) b!798148))

(assert (= (and b!798148 res!542672) b!798147))

(assert (= (and b!798147 res!542669) b!798144))

(assert (= (and b!798144 res!542665) b!798150))

(declare-fun m!739031 () Bool)

(assert (=> start!68598 m!739031))

(declare-fun m!739033 () Bool)

(assert (=> start!68598 m!739033))

(declare-fun m!739035 () Bool)

(assert (=> b!798148 m!739035))

(declare-fun m!739037 () Bool)

(assert (=> b!798148 m!739037))

(declare-fun m!739039 () Bool)

(assert (=> b!798145 m!739039))

(declare-fun m!739041 () Bool)

(assert (=> b!798147 m!739041))

(declare-fun m!739043 () Bool)

(assert (=> b!798147 m!739043))

(declare-fun m!739045 () Bool)

(assert (=> b!798147 m!739045))

(declare-fun m!739047 () Bool)

(assert (=> b!798147 m!739047))

(declare-fun m!739049 () Bool)

(assert (=> b!798151 m!739049))

(assert (=> b!798151 m!739049))

(declare-fun m!739051 () Bool)

(assert (=> b!798151 m!739051))

(declare-fun m!739053 () Bool)

(assert (=> b!798152 m!739053))

(declare-fun m!739055 () Bool)

(assert (=> b!798144 m!739055))

(assert (=> b!798144 m!739049))

(assert (=> b!798144 m!739049))

(declare-fun m!739057 () Bool)

(assert (=> b!798144 m!739057))

(assert (=> b!798144 m!739049))

(declare-fun m!739059 () Bool)

(assert (=> b!798144 m!739059))

(declare-fun m!739061 () Bool)

(assert (=> b!798146 m!739061))

(declare-fun m!739063 () Bool)

(assert (=> b!798143 m!739063))

(declare-fun m!739065 () Bool)

(assert (=> b!798149 m!739065))

(push 1)

(assert (not b!798147))

(assert (not b!798143))

(assert (not b!798149))

(assert (not b!798146))

(assert (not b!798151))

(assert (not start!68598))

