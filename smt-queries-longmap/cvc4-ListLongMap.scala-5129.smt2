; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69660 () Bool)

(assert start!69660)

(declare-fun b!811670 () Bool)

(declare-fun res!554719 () Bool)

(declare-fun e!449223 () Bool)

(assert (=> b!811670 (=> (not res!554719) (not e!449223))))

(declare-datatypes ((array!44099 0))(
  ( (array!44100 (arr!21119 (Array (_ BitVec 32) (_ BitVec 64))) (size!21540 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44099)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811670 (= res!554719 (validKeyInArray!0 (select (arr!21119 a!3170) j!153)))))

(declare-fun b!811671 () Bool)

(declare-fun res!554714 () Bool)

(assert (=> b!811671 (=> (not res!554714) (not e!449223))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811671 (= res!554714 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811672 () Bool)

(declare-fun e!449221 () Bool)

(declare-fun e!449222 () Bool)

(assert (=> b!811672 (= e!449221 e!449222)))

(declare-fun res!554723 () Bool)

(assert (=> b!811672 (=> (not res!554723) (not e!449222))))

(declare-datatypes ((SeekEntryResult!8710 0))(
  ( (MissingZero!8710 (index!37211 (_ BitVec 32))) (Found!8710 (index!37212 (_ BitVec 32))) (Intermediate!8710 (undefined!9522 Bool) (index!37213 (_ BitVec 32)) (x!68019 (_ BitVec 32))) (Undefined!8710) (MissingVacant!8710 (index!37214 (_ BitVec 32))) )
))
(declare-fun lt!363960 () SeekEntryResult!8710)

(declare-fun lt!363959 () SeekEntryResult!8710)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!811672 (= res!554723 (and (= lt!363960 lt!363959) (= lt!363959 (Found!8710 j!153)) (not (= (select (arr!21119 a!3170) index!1236) (select (arr!21119 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44099 (_ BitVec 32)) SeekEntryResult!8710)

(assert (=> b!811672 (= lt!363959 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21119 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44099 (_ BitVec 32)) SeekEntryResult!8710)

(assert (=> b!811672 (= lt!363960 (seekEntryOrOpen!0 (select (arr!21119 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811673 () Bool)

(declare-fun res!554718 () Bool)

(assert (=> b!811673 (=> (not res!554718) (not e!449223))))

(assert (=> b!811673 (= res!554718 (validKeyInArray!0 k!2044))))

(declare-fun b!811674 () Bool)

(declare-fun e!449224 () Bool)

(assert (=> b!811674 (= e!449224 e!449221)))

(declare-fun res!554721 () Bool)

(assert (=> b!811674 (=> (not res!554721) (not e!449221))))

(declare-fun lt!363962 () array!44099)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363958 () (_ BitVec 64))

(assert (=> b!811674 (= res!554721 (= (seekEntryOrOpen!0 lt!363958 lt!363962 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363958 lt!363962 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!811674 (= lt!363958 (select (store (arr!21119 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!811674 (= lt!363962 (array!44100 (store (arr!21119 a!3170) i!1163 k!2044) (size!21540 a!3170)))))

(declare-fun b!811675 () Bool)

(declare-fun res!554713 () Bool)

(assert (=> b!811675 (=> (not res!554713) (not e!449224))))

(declare-datatypes ((List!15082 0))(
  ( (Nil!15079) (Cons!15078 (h!16207 (_ BitVec 64)) (t!21397 List!15082)) )
))
(declare-fun arrayNoDuplicates!0 (array!44099 (_ BitVec 32) List!15082) Bool)

(assert (=> b!811675 (= res!554713 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15079))))

(declare-fun b!811676 () Bool)

(assert (=> b!811676 (= e!449222 (not true))))

(declare-fun lt!363961 () (_ BitVec 32))

(assert (=> b!811676 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363961 vacantAfter!23 lt!363958 lt!363962 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363961 vacantBefore!23 (select (arr!21119 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27682 0))(
  ( (Unit!27683) )
))
(declare-fun lt!363956 () Unit!27682)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44099 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27682)

(assert (=> b!811676 (= lt!363956 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363961 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811676 (= lt!363961 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!554715 () Bool)

(assert (=> start!69660 (=> (not res!554715) (not e!449223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69660 (= res!554715 (validMask!0 mask!3266))))

(assert (=> start!69660 e!449223))

(assert (=> start!69660 true))

(declare-fun array_inv!16915 (array!44099) Bool)

(assert (=> start!69660 (array_inv!16915 a!3170)))

(declare-fun b!811677 () Bool)

(assert (=> b!811677 (= e!449223 e!449224)))

(declare-fun res!554722 () Bool)

(assert (=> b!811677 (=> (not res!554722) (not e!449224))))

(declare-fun lt!363957 () SeekEntryResult!8710)

(assert (=> b!811677 (= res!554722 (or (= lt!363957 (MissingZero!8710 i!1163)) (= lt!363957 (MissingVacant!8710 i!1163))))))

(assert (=> b!811677 (= lt!363957 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!811678 () Bool)

(declare-fun res!554717 () Bool)

(assert (=> b!811678 (=> (not res!554717) (not e!449223))))

(assert (=> b!811678 (= res!554717 (and (= (size!21540 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21540 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21540 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811679 () Bool)

(declare-fun res!554720 () Bool)

(assert (=> b!811679 (=> (not res!554720) (not e!449224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44099 (_ BitVec 32)) Bool)

(assert (=> b!811679 (= res!554720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811680 () Bool)

(declare-fun res!554716 () Bool)

(assert (=> b!811680 (=> (not res!554716) (not e!449224))))

(assert (=> b!811680 (= res!554716 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21540 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21119 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21540 a!3170)) (= (select (arr!21119 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69660 res!554715) b!811678))

(assert (= (and b!811678 res!554717) b!811670))

(assert (= (and b!811670 res!554719) b!811673))

(assert (= (and b!811673 res!554718) b!811671))

(assert (= (and b!811671 res!554714) b!811677))

(assert (= (and b!811677 res!554722) b!811679))

(assert (= (and b!811679 res!554720) b!811675))

(assert (= (and b!811675 res!554713) b!811680))

(assert (= (and b!811680 res!554716) b!811674))

(assert (= (and b!811674 res!554721) b!811672))

(assert (= (and b!811672 res!554723) b!811676))

(declare-fun m!754095 () Bool)

(assert (=> b!811671 m!754095))

(declare-fun m!754097 () Bool)

(assert (=> b!811676 m!754097))

(assert (=> b!811676 m!754097))

(declare-fun m!754099 () Bool)

(assert (=> b!811676 m!754099))

(declare-fun m!754101 () Bool)

(assert (=> b!811676 m!754101))

(declare-fun m!754103 () Bool)

(assert (=> b!811676 m!754103))

(declare-fun m!754105 () Bool)

(assert (=> b!811676 m!754105))

(declare-fun m!754107 () Bool)

(assert (=> b!811674 m!754107))

(declare-fun m!754109 () Bool)

(assert (=> b!811674 m!754109))

(declare-fun m!754111 () Bool)

(assert (=> b!811674 m!754111))

(declare-fun m!754113 () Bool)

(assert (=> b!811674 m!754113))

(declare-fun m!754115 () Bool)

(assert (=> b!811675 m!754115))

(assert (=> b!811670 m!754097))

(assert (=> b!811670 m!754097))

(declare-fun m!754117 () Bool)

(assert (=> b!811670 m!754117))

(declare-fun m!754119 () Bool)

(assert (=> b!811672 m!754119))

(assert (=> b!811672 m!754097))

(assert (=> b!811672 m!754097))

(declare-fun m!754121 () Bool)

(assert (=> b!811672 m!754121))

(assert (=> b!811672 m!754097))

(declare-fun m!754123 () Bool)

(assert (=> b!811672 m!754123))

(declare-fun m!754125 () Bool)

(assert (=> b!811680 m!754125))

(declare-fun m!754127 () Bool)

(assert (=> b!811680 m!754127))

(declare-fun m!754129 () Bool)

(assert (=> b!811677 m!754129))

(declare-fun m!754131 () Bool)

(assert (=> b!811673 m!754131))

(declare-fun m!754133 () Bool)

(assert (=> b!811679 m!754133))

(declare-fun m!754135 () Bool)

(assert (=> start!69660 m!754135))

(declare-fun m!754137 () Bool)

(assert (=> start!69660 m!754137))

(push 1)

