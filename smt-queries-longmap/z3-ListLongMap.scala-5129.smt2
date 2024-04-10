; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69658 () Bool)

(assert start!69658)

(declare-fun res!554689 () Bool)

(declare-fun e!449209 () Bool)

(assert (=> start!69658 (=> (not res!554689) (not e!449209))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69658 (= res!554689 (validMask!0 mask!3266))))

(assert (=> start!69658 e!449209))

(assert (=> start!69658 true))

(declare-datatypes ((array!44097 0))(
  ( (array!44098 (arr!21118 (Array (_ BitVec 32) (_ BitVec 64))) (size!21539 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44097)

(declare-fun array_inv!16914 (array!44097) Bool)

(assert (=> start!69658 (array_inv!16914 a!3170)))

(declare-fun b!811637 () Bool)

(declare-fun e!449207 () Bool)

(declare-fun e!449210 () Bool)

(assert (=> b!811637 (= e!449207 e!449210)))

(declare-fun res!554686 () Bool)

(assert (=> b!811637 (=> (not res!554686) (not e!449210))))

(declare-datatypes ((SeekEntryResult!8709 0))(
  ( (MissingZero!8709 (index!37207 (_ BitVec 32))) (Found!8709 (index!37208 (_ BitVec 32))) (Intermediate!8709 (undefined!9521 Bool) (index!37209 (_ BitVec 32)) (x!68018 (_ BitVec 32))) (Undefined!8709) (MissingVacant!8709 (index!37210 (_ BitVec 32))) )
))
(declare-fun lt!363941 () SeekEntryResult!8709)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!363936 () SeekEntryResult!8709)

(assert (=> b!811637 (= res!554686 (and (= lt!363941 lt!363936) (= lt!363936 (Found!8709 j!153)) (not (= (select (arr!21118 a!3170) index!1236) (select (arr!21118 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44097 (_ BitVec 32)) SeekEntryResult!8709)

(assert (=> b!811637 (= lt!363936 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21118 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44097 (_ BitVec 32)) SeekEntryResult!8709)

(assert (=> b!811637 (= lt!363941 (seekEntryOrOpen!0 (select (arr!21118 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811638 () Bool)

(declare-fun e!449206 () Bool)

(assert (=> b!811638 (= e!449206 e!449207)))

(declare-fun res!554681 () Bool)

(assert (=> b!811638 (=> (not res!554681) (not e!449207))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363939 () (_ BitVec 64))

(declare-fun lt!363935 () array!44097)

(assert (=> b!811638 (= res!554681 (= (seekEntryOrOpen!0 lt!363939 lt!363935 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363939 lt!363935 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!811638 (= lt!363939 (select (store (arr!21118 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811638 (= lt!363935 (array!44098 (store (arr!21118 a!3170) i!1163 k0!2044) (size!21539 a!3170)))))

(declare-fun b!811639 () Bool)

(declare-fun res!554690 () Bool)

(assert (=> b!811639 (=> (not res!554690) (not e!449209))))

(declare-fun arrayContainsKey!0 (array!44097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811639 (= res!554690 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811640 () Bool)

(assert (=> b!811640 (= e!449209 e!449206)))

(declare-fun res!554684 () Bool)

(assert (=> b!811640 (=> (not res!554684) (not e!449206))))

(declare-fun lt!363938 () SeekEntryResult!8709)

(assert (=> b!811640 (= res!554684 (or (= lt!363938 (MissingZero!8709 i!1163)) (= lt!363938 (MissingVacant!8709 i!1163))))))

(assert (=> b!811640 (= lt!363938 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811641 () Bool)

(declare-fun res!554682 () Bool)

(assert (=> b!811641 (=> (not res!554682) (not e!449206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44097 (_ BitVec 32)) Bool)

(assert (=> b!811641 (= res!554682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811642 () Bool)

(declare-fun res!554685 () Bool)

(assert (=> b!811642 (=> (not res!554685) (not e!449209))))

(assert (=> b!811642 (= res!554685 (and (= (size!21539 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21539 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21539 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811643 () Bool)

(declare-fun res!554680 () Bool)

(assert (=> b!811643 (=> (not res!554680) (not e!449206))))

(assert (=> b!811643 (= res!554680 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21539 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21118 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21539 a!3170)) (= (select (arr!21118 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811644 () Bool)

(declare-fun res!554683 () Bool)

(assert (=> b!811644 (=> (not res!554683) (not e!449209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811644 (= res!554683 (validKeyInArray!0 k0!2044))))

(declare-fun b!811645 () Bool)

(declare-fun res!554688 () Bool)

(assert (=> b!811645 (=> (not res!554688) (not e!449209))))

(assert (=> b!811645 (= res!554688 (validKeyInArray!0 (select (arr!21118 a!3170) j!153)))))

(declare-fun b!811646 () Bool)

(assert (=> b!811646 (= e!449210 (not true))))

(declare-fun lt!363940 () (_ BitVec 32))

(assert (=> b!811646 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363940 vacantAfter!23 lt!363939 lt!363935 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363940 vacantBefore!23 (select (arr!21118 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27680 0))(
  ( (Unit!27681) )
))
(declare-fun lt!363937 () Unit!27680)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27680)

(assert (=> b!811646 (= lt!363937 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363940 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811646 (= lt!363940 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811647 () Bool)

(declare-fun res!554687 () Bool)

(assert (=> b!811647 (=> (not res!554687) (not e!449206))))

(declare-datatypes ((List!15081 0))(
  ( (Nil!15078) (Cons!15077 (h!16206 (_ BitVec 64)) (t!21396 List!15081)) )
))
(declare-fun arrayNoDuplicates!0 (array!44097 (_ BitVec 32) List!15081) Bool)

(assert (=> b!811647 (= res!554687 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15078))))

(assert (= (and start!69658 res!554689) b!811642))

(assert (= (and b!811642 res!554685) b!811645))

(assert (= (and b!811645 res!554688) b!811644))

(assert (= (and b!811644 res!554683) b!811639))

(assert (= (and b!811639 res!554690) b!811640))

(assert (= (and b!811640 res!554684) b!811641))

(assert (= (and b!811641 res!554682) b!811647))

(assert (= (and b!811647 res!554687) b!811643))

(assert (= (and b!811643 res!554680) b!811638))

(assert (= (and b!811638 res!554681) b!811637))

(assert (= (and b!811637 res!554686) b!811646))

(declare-fun m!754051 () Bool)

(assert (=> b!811644 m!754051))

(declare-fun m!754053 () Bool)

(assert (=> b!811647 m!754053))

(declare-fun m!754055 () Bool)

(assert (=> b!811637 m!754055))

(declare-fun m!754057 () Bool)

(assert (=> b!811637 m!754057))

(assert (=> b!811637 m!754057))

(declare-fun m!754059 () Bool)

(assert (=> b!811637 m!754059))

(assert (=> b!811637 m!754057))

(declare-fun m!754061 () Bool)

(assert (=> b!811637 m!754061))

(declare-fun m!754063 () Bool)

(assert (=> b!811640 m!754063))

(declare-fun m!754065 () Bool)

(assert (=> start!69658 m!754065))

(declare-fun m!754067 () Bool)

(assert (=> start!69658 m!754067))

(assert (=> b!811646 m!754057))

(declare-fun m!754069 () Bool)

(assert (=> b!811646 m!754069))

(declare-fun m!754071 () Bool)

(assert (=> b!811646 m!754071))

(declare-fun m!754073 () Bool)

(assert (=> b!811646 m!754073))

(assert (=> b!811646 m!754057))

(declare-fun m!754075 () Bool)

(assert (=> b!811646 m!754075))

(declare-fun m!754077 () Bool)

(assert (=> b!811638 m!754077))

(declare-fun m!754079 () Bool)

(assert (=> b!811638 m!754079))

(declare-fun m!754081 () Bool)

(assert (=> b!811638 m!754081))

(declare-fun m!754083 () Bool)

(assert (=> b!811638 m!754083))

(declare-fun m!754085 () Bool)

(assert (=> b!811639 m!754085))

(assert (=> b!811645 m!754057))

(assert (=> b!811645 m!754057))

(declare-fun m!754087 () Bool)

(assert (=> b!811645 m!754087))

(declare-fun m!754089 () Bool)

(assert (=> b!811641 m!754089))

(declare-fun m!754091 () Bool)

(assert (=> b!811643 m!754091))

(declare-fun m!754093 () Bool)

(assert (=> b!811643 m!754093))

(check-sat (not b!811639) (not b!811641) (not start!69658) (not b!811644) (not b!811646) (not b!811645) (not b!811638) (not b!811640) (not b!811647) (not b!811637))
(check-sat)
