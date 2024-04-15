; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69624 () Bool)

(assert start!69624)

(declare-fun b!811156 () Bool)

(declare-fun e!448951 () Bool)

(declare-fun e!448950 () Bool)

(assert (=> b!811156 (= e!448951 e!448950)))

(declare-fun res!554342 () Bool)

(assert (=> b!811156 (=> (not res!554342) (not e!448950))))

(declare-fun lt!363550 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!44080 0))(
  ( (array!44081 (arr!21110 (Array (_ BitVec 32) (_ BitVec 64))) (size!21531 (_ BitVec 32))) )
))
(declare-fun lt!363549 () array!44080)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8698 0))(
  ( (MissingZero!8698 (index!37163 (_ BitVec 32))) (Found!8698 (index!37164 (_ BitVec 32))) (Intermediate!8698 (undefined!9510 Bool) (index!37165 (_ BitVec 32)) (x!67986 (_ BitVec 32))) (Undefined!8698) (MissingVacant!8698 (index!37166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44080 (_ BitVec 32)) SeekEntryResult!8698)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44080 (_ BitVec 32)) SeekEntryResult!8698)

(assert (=> b!811156 (= res!554342 (= (seekEntryOrOpen!0 lt!363550 lt!363549 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363550 lt!363549 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!44080)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!811156 (= lt!363550 (select (store (arr!21110 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811156 (= lt!363549 (array!44081 (store (arr!21110 a!3170) i!1163 k0!2044) (size!21531 a!3170)))))

(declare-fun b!811157 () Bool)

(declare-fun e!448948 () Bool)

(assert (=> b!811157 (= e!448950 e!448948)))

(declare-fun res!554340 () Bool)

(assert (=> b!811157 (=> (not res!554340) (not e!448948))))

(declare-fun lt!363548 () SeekEntryResult!8698)

(declare-fun lt!363551 () SeekEntryResult!8698)

(assert (=> b!811157 (= res!554340 (and (= lt!363551 lt!363548) (= lt!363548 (Found!8698 j!153)) (not (= (select (arr!21110 a!3170) index!1236) (select (arr!21110 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!811157 (= lt!363548 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21110 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811157 (= lt!363551 (seekEntryOrOpen!0 (select (arr!21110 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811158 () Bool)

(declare-fun res!554343 () Bool)

(assert (=> b!811158 (=> (not res!554343) (not e!448951))))

(assert (=> b!811158 (= res!554343 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21531 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21110 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21531 a!3170)) (= (select (arr!21110 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811160 () Bool)

(assert (=> b!811160 (= e!448948 (not true))))

(declare-fun lt!363553 () (_ BitVec 32))

(assert (=> b!811160 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363553 vacantAfter!23 lt!363550 lt!363549 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363553 vacantBefore!23 (select (arr!21110 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27624 0))(
  ( (Unit!27625) )
))
(declare-fun lt!363552 () Unit!27624)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44080 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27624)

(assert (=> b!811160 (= lt!363552 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363553 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811160 (= lt!363553 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811161 () Bool)

(declare-fun res!554344 () Bool)

(declare-fun e!448949 () Bool)

(assert (=> b!811161 (=> (not res!554344) (not e!448949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811161 (= res!554344 (validKeyInArray!0 (select (arr!21110 a!3170) j!153)))))

(declare-fun b!811162 () Bool)

(declare-fun res!554345 () Bool)

(assert (=> b!811162 (=> (not res!554345) (not e!448951))))

(declare-datatypes ((List!15112 0))(
  ( (Nil!15109) (Cons!15108 (h!16237 (_ BitVec 64)) (t!21418 List!15112)) )
))
(declare-fun arrayNoDuplicates!0 (array!44080 (_ BitVec 32) List!15112) Bool)

(assert (=> b!811162 (= res!554345 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15109))))

(declare-fun b!811163 () Bool)

(declare-fun res!554341 () Bool)

(assert (=> b!811163 (=> (not res!554341) (not e!448949))))

(assert (=> b!811163 (= res!554341 (validKeyInArray!0 k0!2044))))

(declare-fun b!811164 () Bool)

(declare-fun res!554346 () Bool)

(assert (=> b!811164 (=> (not res!554346) (not e!448951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44080 (_ BitVec 32)) Bool)

(assert (=> b!811164 (= res!554346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811165 () Bool)

(declare-fun res!554348 () Bool)

(assert (=> b!811165 (=> (not res!554348) (not e!448949))))

(assert (=> b!811165 (= res!554348 (and (= (size!21531 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21531 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21531 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811166 () Bool)

(assert (=> b!811166 (= e!448949 e!448951)))

(declare-fun res!554339 () Bool)

(assert (=> b!811166 (=> (not res!554339) (not e!448951))))

(declare-fun lt!363554 () SeekEntryResult!8698)

(assert (=> b!811166 (= res!554339 (or (= lt!363554 (MissingZero!8698 i!1163)) (= lt!363554 (MissingVacant!8698 i!1163))))))

(assert (=> b!811166 (= lt!363554 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811159 () Bool)

(declare-fun res!554349 () Bool)

(assert (=> b!811159 (=> (not res!554349) (not e!448949))))

(declare-fun arrayContainsKey!0 (array!44080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811159 (= res!554349 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!554347 () Bool)

(assert (=> start!69624 (=> (not res!554347) (not e!448949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69624 (= res!554347 (validMask!0 mask!3266))))

(assert (=> start!69624 e!448949))

(assert (=> start!69624 true))

(declare-fun array_inv!16993 (array!44080) Bool)

(assert (=> start!69624 (array_inv!16993 a!3170)))

(assert (= (and start!69624 res!554347) b!811165))

(assert (= (and b!811165 res!554348) b!811161))

(assert (= (and b!811161 res!554344) b!811163))

(assert (= (and b!811163 res!554341) b!811159))

(assert (= (and b!811159 res!554349) b!811166))

(assert (= (and b!811166 res!554339) b!811164))

(assert (= (and b!811164 res!554346) b!811162))

(assert (= (and b!811162 res!554345) b!811158))

(assert (= (and b!811158 res!554343) b!811156))

(assert (= (and b!811156 res!554342) b!811157))

(assert (= (and b!811157 res!554340) b!811160))

(declare-fun m!753001 () Bool)

(assert (=> b!811164 m!753001))

(declare-fun m!753003 () Bool)

(assert (=> start!69624 m!753003))

(declare-fun m!753005 () Bool)

(assert (=> start!69624 m!753005))

(declare-fun m!753007 () Bool)

(assert (=> b!811162 m!753007))

(declare-fun m!753009 () Bool)

(assert (=> b!811161 m!753009))

(assert (=> b!811161 m!753009))

(declare-fun m!753011 () Bool)

(assert (=> b!811161 m!753011))

(declare-fun m!753013 () Bool)

(assert (=> b!811158 m!753013))

(declare-fun m!753015 () Bool)

(assert (=> b!811158 m!753015))

(declare-fun m!753017 () Bool)

(assert (=> b!811159 m!753017))

(declare-fun m!753019 () Bool)

(assert (=> b!811163 m!753019))

(declare-fun m!753021 () Bool)

(assert (=> b!811157 m!753021))

(assert (=> b!811157 m!753009))

(assert (=> b!811157 m!753009))

(declare-fun m!753023 () Bool)

(assert (=> b!811157 m!753023))

(assert (=> b!811157 m!753009))

(declare-fun m!753025 () Bool)

(assert (=> b!811157 m!753025))

(declare-fun m!753027 () Bool)

(assert (=> b!811156 m!753027))

(declare-fun m!753029 () Bool)

(assert (=> b!811156 m!753029))

(declare-fun m!753031 () Bool)

(assert (=> b!811156 m!753031))

(declare-fun m!753033 () Bool)

(assert (=> b!811156 m!753033))

(assert (=> b!811160 m!753009))

(declare-fun m!753035 () Bool)

(assert (=> b!811160 m!753035))

(declare-fun m!753037 () Bool)

(assert (=> b!811160 m!753037))

(assert (=> b!811160 m!753009))

(declare-fun m!753039 () Bool)

(assert (=> b!811160 m!753039))

(declare-fun m!753041 () Bool)

(assert (=> b!811160 m!753041))

(declare-fun m!753043 () Bool)

(assert (=> b!811166 m!753043))

(check-sat (not b!811163) (not b!811160) (not b!811156) (not b!811166) (not b!811159) (not b!811161) (not start!69624) (not b!811157) (not b!811162) (not b!811164))
(check-sat)
