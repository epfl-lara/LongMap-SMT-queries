; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69568 () Bool)

(assert start!69568)

(declare-fun b!810827 () Bool)

(declare-fun e!448784 () Bool)

(assert (=> b!810827 (= e!448784 (not true))))

(declare-datatypes ((array!44064 0))(
  ( (array!44065 (arr!21103 (Array (_ BitVec 32) (_ BitVec 64))) (size!21524 (_ BitVec 32))) )
))
(declare-fun lt!363470 () array!44064)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun a!3170 () array!44064)

(declare-fun lt!363467 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!363473 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8694 0))(
  ( (MissingZero!8694 (index!37144 (_ BitVec 32))) (Found!8694 (index!37145 (_ BitVec 32))) (Intermediate!8694 (undefined!9506 Bool) (index!37146 (_ BitVec 32)) (x!67954 (_ BitVec 32))) (Undefined!8694) (MissingVacant!8694 (index!37147 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44064 (_ BitVec 32)) SeekEntryResult!8694)

(assert (=> b!810827 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363467 vacantAfter!23 lt!363473 lt!363470 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363467 vacantBefore!23 (select (arr!21103 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27650 0))(
  ( (Unit!27651) )
))
(declare-fun lt!363471 () Unit!27650)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44064 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27650)

(assert (=> b!810827 (= lt!363471 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363467 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810827 (= lt!363467 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810828 () Bool)

(declare-fun res!554105 () Bool)

(declare-fun e!448786 () Bool)

(assert (=> b!810828 (=> (not res!554105) (not e!448786))))

(declare-fun arrayContainsKey!0 (array!44064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810828 (= res!554105 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810829 () Bool)

(declare-fun res!554106 () Bool)

(assert (=> b!810829 (=> (not res!554106) (not e!448786))))

(assert (=> b!810829 (= res!554106 (and (= (size!21524 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21524 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21524 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810830 () Bool)

(declare-fun res!554112 () Bool)

(declare-fun e!448783 () Bool)

(assert (=> b!810830 (=> (not res!554112) (not e!448783))))

(assert (=> b!810830 (= res!554112 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21524 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21103 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21524 a!3170)) (= (select (arr!21103 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810831 () Bool)

(declare-fun e!448785 () Bool)

(assert (=> b!810831 (= e!448785 e!448784)))

(declare-fun res!554111 () Bool)

(assert (=> b!810831 (=> (not res!554111) (not e!448784))))

(declare-fun lt!363469 () SeekEntryResult!8694)

(declare-fun lt!363468 () SeekEntryResult!8694)

(assert (=> b!810831 (= res!554111 (and (= lt!363468 lt!363469) (= lt!363469 (Found!8694 j!153)) (not (= (select (arr!21103 a!3170) index!1236) (select (arr!21103 a!3170) j!153)))))))

(assert (=> b!810831 (= lt!363469 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21103 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44064 (_ BitVec 32)) SeekEntryResult!8694)

(assert (=> b!810831 (= lt!363468 (seekEntryOrOpen!0 (select (arr!21103 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810832 () Bool)

(declare-fun res!554108 () Bool)

(assert (=> b!810832 (=> (not res!554108) (not e!448783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44064 (_ BitVec 32)) Bool)

(assert (=> b!810832 (= res!554108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!554110 () Bool)

(assert (=> start!69568 (=> (not res!554110) (not e!448786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69568 (= res!554110 (validMask!0 mask!3266))))

(assert (=> start!69568 e!448786))

(assert (=> start!69568 true))

(declare-fun array_inv!16899 (array!44064) Bool)

(assert (=> start!69568 (array_inv!16899 a!3170)))

(declare-fun b!810833 () Bool)

(declare-fun res!554114 () Bool)

(assert (=> b!810833 (=> (not res!554114) (not e!448786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810833 (= res!554114 (validKeyInArray!0 (select (arr!21103 a!3170) j!153)))))

(declare-fun b!810834 () Bool)

(assert (=> b!810834 (= e!448786 e!448783)))

(declare-fun res!554113 () Bool)

(assert (=> b!810834 (=> (not res!554113) (not e!448783))))

(declare-fun lt!363472 () SeekEntryResult!8694)

(assert (=> b!810834 (= res!554113 (or (= lt!363472 (MissingZero!8694 i!1163)) (= lt!363472 (MissingVacant!8694 i!1163))))))

(assert (=> b!810834 (= lt!363472 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810835 () Bool)

(declare-fun res!554109 () Bool)

(assert (=> b!810835 (=> (not res!554109) (not e!448786))))

(assert (=> b!810835 (= res!554109 (validKeyInArray!0 k0!2044))))

(declare-fun b!810836 () Bool)

(declare-fun res!554107 () Bool)

(assert (=> b!810836 (=> (not res!554107) (not e!448783))))

(declare-datatypes ((List!15066 0))(
  ( (Nil!15063) (Cons!15062 (h!16191 (_ BitVec 64)) (t!21381 List!15066)) )
))
(declare-fun arrayNoDuplicates!0 (array!44064 (_ BitVec 32) List!15066) Bool)

(assert (=> b!810836 (= res!554107 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15063))))

(declare-fun b!810837 () Bool)

(assert (=> b!810837 (= e!448783 e!448785)))

(declare-fun res!554104 () Bool)

(assert (=> b!810837 (=> (not res!554104) (not e!448785))))

(assert (=> b!810837 (= res!554104 (= (seekEntryOrOpen!0 lt!363473 lt!363470 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363473 lt!363470 mask!3266)))))

(assert (=> b!810837 (= lt!363473 (select (store (arr!21103 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810837 (= lt!363470 (array!44065 (store (arr!21103 a!3170) i!1163 k0!2044) (size!21524 a!3170)))))

(assert (= (and start!69568 res!554110) b!810829))

(assert (= (and b!810829 res!554106) b!810833))

(assert (= (and b!810833 res!554114) b!810835))

(assert (= (and b!810835 res!554109) b!810828))

(assert (= (and b!810828 res!554105) b!810834))

(assert (= (and b!810834 res!554113) b!810832))

(assert (= (and b!810832 res!554108) b!810836))

(assert (= (and b!810836 res!554107) b!810830))

(assert (= (and b!810830 res!554112) b!810837))

(assert (= (and b!810837 res!554104) b!810831))

(assert (= (and b!810831 res!554111) b!810827))

(declare-fun m!753097 () Bool)

(assert (=> b!810834 m!753097))

(declare-fun m!753099 () Bool)

(assert (=> b!810831 m!753099))

(declare-fun m!753101 () Bool)

(assert (=> b!810831 m!753101))

(assert (=> b!810831 m!753101))

(declare-fun m!753103 () Bool)

(assert (=> b!810831 m!753103))

(assert (=> b!810831 m!753101))

(declare-fun m!753105 () Bool)

(assert (=> b!810831 m!753105))

(declare-fun m!753107 () Bool)

(assert (=> b!810828 m!753107))

(assert (=> b!810827 m!753101))

(declare-fun m!753109 () Bool)

(assert (=> b!810827 m!753109))

(declare-fun m!753111 () Bool)

(assert (=> b!810827 m!753111))

(declare-fun m!753113 () Bool)

(assert (=> b!810827 m!753113))

(assert (=> b!810827 m!753101))

(declare-fun m!753115 () Bool)

(assert (=> b!810827 m!753115))

(declare-fun m!753117 () Bool)

(assert (=> b!810835 m!753117))

(declare-fun m!753119 () Bool)

(assert (=> b!810830 m!753119))

(declare-fun m!753121 () Bool)

(assert (=> b!810830 m!753121))

(assert (=> b!810833 m!753101))

(assert (=> b!810833 m!753101))

(declare-fun m!753123 () Bool)

(assert (=> b!810833 m!753123))

(declare-fun m!753125 () Bool)

(assert (=> b!810837 m!753125))

(declare-fun m!753127 () Bool)

(assert (=> b!810837 m!753127))

(declare-fun m!753129 () Bool)

(assert (=> b!810837 m!753129))

(declare-fun m!753131 () Bool)

(assert (=> b!810837 m!753131))

(declare-fun m!753133 () Bool)

(assert (=> b!810832 m!753133))

(declare-fun m!753135 () Bool)

(assert (=> b!810836 m!753135))

(declare-fun m!753137 () Bool)

(assert (=> start!69568 m!753137))

(declare-fun m!753139 () Bool)

(assert (=> start!69568 m!753139))

(check-sat (not b!810832) (not b!810828) (not start!69568) (not b!810833) (not b!810836) (not b!810831) (not b!810834) (not b!810827) (not b!810835) (not b!810837))
(check-sat)
