; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69662 () Bool)

(assert start!69662)

(declare-fun b!811705 () Bool)

(declare-fun res!554751 () Bool)

(declare-fun e!449242 () Bool)

(assert (=> b!811705 (=> (not res!554751) (not e!449242))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44101 0))(
  ( (array!44102 (arr!21120 (Array (_ BitVec 32) (_ BitVec 64))) (size!21541 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44101)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!811705 (= res!554751 (and (= (size!21541 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21541 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21541 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811706 () Bool)

(declare-fun res!554758 () Bool)

(declare-fun e!449240 () Bool)

(assert (=> b!811706 (=> (not res!554758) (not e!449240))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!811706 (= res!554758 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21541 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21120 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21541 a!3170)) (= (select (arr!21120 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811707 () Bool)

(declare-fun res!554749 () Bool)

(assert (=> b!811707 (=> (not res!554749) (not e!449242))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811707 (= res!554749 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811708 () Bool)

(declare-fun res!554757 () Bool)

(assert (=> b!811708 (=> (not res!554757) (not e!449242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811708 (= res!554757 (validKeyInArray!0 k!2044))))

(declare-fun b!811709 () Bool)

(declare-fun e!449243 () Bool)

(assert (=> b!811709 (= e!449240 e!449243)))

(declare-fun res!554750 () Bool)

(assert (=> b!811709 (=> (not res!554750) (not e!449243))))

(declare-datatypes ((SeekEntryResult!8711 0))(
  ( (MissingZero!8711 (index!37215 (_ BitVec 32))) (Found!8711 (index!37216 (_ BitVec 32))) (Intermediate!8711 (undefined!9523 Bool) (index!37217 (_ BitVec 32)) (x!68028 (_ BitVec 32))) (Undefined!8711) (MissingVacant!8711 (index!37218 (_ BitVec 32))) )
))
(declare-fun lt!363987 () SeekEntryResult!8711)

(declare-fun lt!363983 () SeekEntryResult!8711)

(assert (=> b!811709 (= res!554750 (= lt!363987 lt!363983))))

(declare-fun lt!363991 () array!44101)

(declare-fun lt!363989 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44101 (_ BitVec 32)) SeekEntryResult!8711)

(assert (=> b!811709 (= lt!363983 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363989 lt!363991 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44101 (_ BitVec 32)) SeekEntryResult!8711)

(assert (=> b!811709 (= lt!363987 (seekEntryOrOpen!0 lt!363989 lt!363991 mask!3266))))

(assert (=> b!811709 (= lt!363989 (select (store (arr!21120 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!811709 (= lt!363991 (array!44102 (store (arr!21120 a!3170) i!1163 k!2044) (size!21541 a!3170)))))

(declare-fun b!811710 () Bool)

(declare-fun res!554759 () Bool)

(assert (=> b!811710 (=> (not res!554759) (not e!449242))))

(assert (=> b!811710 (= res!554759 (validKeyInArray!0 (select (arr!21120 a!3170) j!153)))))

(declare-fun b!811711 () Bool)

(declare-fun e!449239 () Bool)

(declare-fun e!449241 () Bool)

(assert (=> b!811711 (= e!449239 e!449241)))

(declare-fun res!554754 () Bool)

(assert (=> b!811711 (=> (not res!554754) (not e!449241))))

(declare-fun lt!363992 () SeekEntryResult!8711)

(declare-fun lt!363986 () SeekEntryResult!8711)

(assert (=> b!811711 (= res!554754 (and (= lt!363986 lt!363992) (not (= (select (arr!21120 a!3170) index!1236) (select (arr!21120 a!3170) j!153)))))))

(assert (=> b!811711 (= lt!363992 (Found!8711 j!153))))

(declare-fun b!811712 () Bool)

(assert (=> b!811712 (= e!449241 (not (or (not (= lt!363983 lt!363992)) (= lt!363983 lt!363986))))))

(declare-fun lt!363985 () (_ BitVec 32))

(assert (=> b!811712 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363985 vacantAfter!23 lt!363989 lt!363991 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363985 vacantBefore!23 (select (arr!21120 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27684 0))(
  ( (Unit!27685) )
))
(declare-fun lt!363984 () Unit!27684)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44101 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27684)

(assert (=> b!811712 (= lt!363984 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363985 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811712 (= lt!363985 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811713 () Bool)

(assert (=> b!811713 (= e!449243 e!449239)))

(declare-fun res!554753 () Bool)

(assert (=> b!811713 (=> (not res!554753) (not e!449239))))

(declare-fun lt!363988 () SeekEntryResult!8711)

(assert (=> b!811713 (= res!554753 (= lt!363988 lt!363986))))

(assert (=> b!811713 (= lt!363986 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21120 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811713 (= lt!363988 (seekEntryOrOpen!0 (select (arr!21120 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811714 () Bool)

(assert (=> b!811714 (= e!449242 e!449240)))

(declare-fun res!554756 () Bool)

(assert (=> b!811714 (=> (not res!554756) (not e!449240))))

(declare-fun lt!363990 () SeekEntryResult!8711)

(assert (=> b!811714 (= res!554756 (or (= lt!363990 (MissingZero!8711 i!1163)) (= lt!363990 (MissingVacant!8711 i!1163))))))

(assert (=> b!811714 (= lt!363990 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!554752 () Bool)

(assert (=> start!69662 (=> (not res!554752) (not e!449242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69662 (= res!554752 (validMask!0 mask!3266))))

(assert (=> start!69662 e!449242))

(assert (=> start!69662 true))

(declare-fun array_inv!16916 (array!44101) Bool)

(assert (=> start!69662 (array_inv!16916 a!3170)))

(declare-fun b!811715 () Bool)

(declare-fun res!554755 () Bool)

(assert (=> b!811715 (=> (not res!554755) (not e!449240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44101 (_ BitVec 32)) Bool)

(assert (=> b!811715 (= res!554755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811716 () Bool)

(declare-fun res!554748 () Bool)

(assert (=> b!811716 (=> (not res!554748) (not e!449240))))

(declare-datatypes ((List!15083 0))(
  ( (Nil!15080) (Cons!15079 (h!16208 (_ BitVec 64)) (t!21398 List!15083)) )
))
(declare-fun arrayNoDuplicates!0 (array!44101 (_ BitVec 32) List!15083) Bool)

(assert (=> b!811716 (= res!554748 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15080))))

(assert (= (and start!69662 res!554752) b!811705))

(assert (= (and b!811705 res!554751) b!811710))

(assert (= (and b!811710 res!554759) b!811708))

(assert (= (and b!811708 res!554757) b!811707))

(assert (= (and b!811707 res!554749) b!811714))

(assert (= (and b!811714 res!554756) b!811715))

(assert (= (and b!811715 res!554755) b!811716))

(assert (= (and b!811716 res!554748) b!811706))

(assert (= (and b!811706 res!554758) b!811709))

(assert (= (and b!811709 res!554750) b!811713))

(assert (= (and b!811713 res!554753) b!811711))

(assert (= (and b!811711 res!554754) b!811712))

(declare-fun m!754139 () Bool)

(assert (=> b!811716 m!754139))

(declare-fun m!754141 () Bool)

(assert (=> b!811715 m!754141))

(declare-fun m!754143 () Bool)

(assert (=> b!811711 m!754143))

(declare-fun m!754145 () Bool)

(assert (=> b!811711 m!754145))

(declare-fun m!754147 () Bool)

(assert (=> b!811706 m!754147))

(declare-fun m!754149 () Bool)

(assert (=> b!811706 m!754149))

(declare-fun m!754151 () Bool)

(assert (=> b!811708 m!754151))

(declare-fun m!754153 () Bool)

(assert (=> b!811712 m!754153))

(assert (=> b!811712 m!754145))

(declare-fun m!754155 () Bool)

(assert (=> b!811712 m!754155))

(declare-fun m!754157 () Bool)

(assert (=> b!811712 m!754157))

(declare-fun m!754159 () Bool)

(assert (=> b!811712 m!754159))

(assert (=> b!811712 m!754145))

(declare-fun m!754161 () Bool)

(assert (=> b!811707 m!754161))

(declare-fun m!754163 () Bool)

(assert (=> b!811714 m!754163))

(assert (=> b!811713 m!754145))

(assert (=> b!811713 m!754145))

(declare-fun m!754165 () Bool)

(assert (=> b!811713 m!754165))

(assert (=> b!811713 m!754145))

(declare-fun m!754167 () Bool)

(assert (=> b!811713 m!754167))

(declare-fun m!754169 () Bool)

(assert (=> b!811709 m!754169))

(declare-fun m!754171 () Bool)

(assert (=> b!811709 m!754171))

(declare-fun m!754173 () Bool)

(assert (=> b!811709 m!754173))

(declare-fun m!754175 () Bool)

(assert (=> b!811709 m!754175))

(assert (=> b!811710 m!754145))

(assert (=> b!811710 m!754145))

(declare-fun m!754177 () Bool)

(assert (=> b!811710 m!754177))

(declare-fun m!754179 () Bool)

(assert (=> start!69662 m!754179))

(declare-fun m!754181 () Bool)

(assert (=> start!69662 m!754181))

(push 1)

