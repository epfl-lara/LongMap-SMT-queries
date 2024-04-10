; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68796 () Bool)

(assert start!68796)

(declare-fun b!801815 () Bool)

(declare-fun e!444426 () Bool)

(declare-fun e!444424 () Bool)

(assert (=> b!801815 (= e!444426 e!444424)))

(declare-fun res!546341 () Bool)

(assert (=> b!801815 (=> (not res!546341) (not e!444424))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43586 0))(
  ( (array!43587 (arr!20873 (Array (_ BitVec 32) (_ BitVec 64))) (size!21294 (_ BitVec 32))) )
))
(declare-fun lt!358457 () array!43586)

(declare-fun lt!358462 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8464 0))(
  ( (MissingZero!8464 (index!36224 (_ BitVec 32))) (Found!8464 (index!36225 (_ BitVec 32))) (Intermediate!8464 (undefined!9276 Bool) (index!36226 (_ BitVec 32)) (x!67078 (_ BitVec 32))) (Undefined!8464) (MissingVacant!8464 (index!36227 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43586 (_ BitVec 32)) SeekEntryResult!8464)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43586 (_ BitVec 32)) SeekEntryResult!8464)

(assert (=> b!801815 (= res!546341 (= (seekEntryOrOpen!0 lt!358462 lt!358457 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358462 lt!358457 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun a!3170 () array!43586)

(assert (=> b!801815 (= lt!358462 (select (store (arr!20873 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801815 (= lt!358457 (array!43587 (store (arr!20873 a!3170) i!1163 k!2044) (size!21294 a!3170)))))

(declare-fun b!801816 () Bool)

(declare-fun res!546339 () Bool)

(assert (=> b!801816 (=> (not res!546339) (not e!444426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43586 (_ BitVec 32)) Bool)

(assert (=> b!801816 (= res!546339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!546337 () Bool)

(declare-fun e!444428 () Bool)

(assert (=> start!68796 (=> (not res!546337) (not e!444428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68796 (= res!546337 (validMask!0 mask!3266))))

(assert (=> start!68796 e!444428))

(assert (=> start!68796 true))

(declare-fun array_inv!16669 (array!43586) Bool)

(assert (=> start!68796 (array_inv!16669 a!3170)))

(declare-fun b!801817 () Bool)

(declare-fun res!546342 () Bool)

(assert (=> b!801817 (=> (not res!546342) (not e!444428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801817 (= res!546342 (validKeyInArray!0 k!2044))))

(declare-fun b!801818 () Bool)

(declare-fun e!444427 () Bool)

(assert (=> b!801818 (= e!444427 (not (bvsge mask!3266 #b00000000000000000000000000000000)))))

(declare-fun lt!358459 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801818 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358459 vacantAfter!23 lt!358462 lt!358457 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358459 vacantBefore!23 (select (arr!20873 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27468 0))(
  ( (Unit!27469) )
))
(declare-fun lt!358463 () Unit!27468)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43586 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27468)

(assert (=> b!801818 (= lt!358463 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358459 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801818 (= lt!358459 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801819 () Bool)

(declare-fun res!546338 () Bool)

(assert (=> b!801819 (=> (not res!546338) (not e!444426))))

(declare-datatypes ((List!14836 0))(
  ( (Nil!14833) (Cons!14832 (h!15961 (_ BitVec 64)) (t!21151 List!14836)) )
))
(declare-fun arrayNoDuplicates!0 (array!43586 (_ BitVec 32) List!14836) Bool)

(assert (=> b!801819 (= res!546338 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14833))))

(declare-fun b!801820 () Bool)

(declare-fun res!546334 () Bool)

(assert (=> b!801820 (=> (not res!546334) (not e!444426))))

(assert (=> b!801820 (= res!546334 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21294 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20873 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21294 a!3170)) (= (select (arr!20873 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801821 () Bool)

(declare-fun res!546340 () Bool)

(assert (=> b!801821 (=> (not res!546340) (not e!444428))))

(declare-fun arrayContainsKey!0 (array!43586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801821 (= res!546340 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801822 () Bool)

(declare-fun res!546344 () Bool)

(assert (=> b!801822 (=> (not res!546344) (not e!444428))))

(assert (=> b!801822 (= res!546344 (and (= (size!21294 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21294 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21294 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801823 () Bool)

(assert (=> b!801823 (= e!444428 e!444426)))

(declare-fun res!546343 () Bool)

(assert (=> b!801823 (=> (not res!546343) (not e!444426))))

(declare-fun lt!358461 () SeekEntryResult!8464)

(assert (=> b!801823 (= res!546343 (or (= lt!358461 (MissingZero!8464 i!1163)) (= lt!358461 (MissingVacant!8464 i!1163))))))

(assert (=> b!801823 (= lt!358461 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801824 () Bool)

(assert (=> b!801824 (= e!444424 e!444427)))

(declare-fun res!546335 () Bool)

(assert (=> b!801824 (=> (not res!546335) (not e!444427))))

(declare-fun lt!358460 () SeekEntryResult!8464)

(declare-fun lt!358458 () SeekEntryResult!8464)

(assert (=> b!801824 (= res!546335 (and (= lt!358458 lt!358460) (= lt!358460 (Found!8464 j!153)) (not (= (select (arr!20873 a!3170) index!1236) (select (arr!20873 a!3170) j!153)))))))

(assert (=> b!801824 (= lt!358460 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20873 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801824 (= lt!358458 (seekEntryOrOpen!0 (select (arr!20873 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801825 () Bool)

(declare-fun res!546336 () Bool)

(assert (=> b!801825 (=> (not res!546336) (not e!444428))))

(assert (=> b!801825 (= res!546336 (validKeyInArray!0 (select (arr!20873 a!3170) j!153)))))

(assert (= (and start!68796 res!546337) b!801822))

(assert (= (and b!801822 res!546344) b!801825))

(assert (= (and b!801825 res!546336) b!801817))

(assert (= (and b!801817 res!546342) b!801821))

(assert (= (and b!801821 res!546340) b!801823))

(assert (= (and b!801823 res!546343) b!801816))

(assert (= (and b!801816 res!546339) b!801819))

(assert (= (and b!801819 res!546338) b!801820))

(assert (= (and b!801820 res!546334) b!801815))

(assert (= (and b!801815 res!546341) b!801824))

(assert (= (and b!801824 res!546335) b!801818))

(declare-fun m!743055 () Bool)

(assert (=> b!801817 m!743055))

(declare-fun m!743057 () Bool)

(assert (=> b!801821 m!743057))

(declare-fun m!743059 () Bool)

(assert (=> b!801819 m!743059))

(declare-fun m!743061 () Bool)

(assert (=> b!801818 m!743061))

(assert (=> b!801818 m!743061))

(declare-fun m!743063 () Bool)

(assert (=> b!801818 m!743063))

(declare-fun m!743065 () Bool)

(assert (=> b!801818 m!743065))

(declare-fun m!743067 () Bool)

(assert (=> b!801818 m!743067))

(declare-fun m!743069 () Bool)

(assert (=> b!801818 m!743069))

(declare-fun m!743071 () Bool)

(assert (=> b!801824 m!743071))

(assert (=> b!801824 m!743061))

(assert (=> b!801824 m!743061))

(declare-fun m!743073 () Bool)

(assert (=> b!801824 m!743073))

(assert (=> b!801824 m!743061))

(declare-fun m!743075 () Bool)

(assert (=> b!801824 m!743075))

(declare-fun m!743077 () Bool)

(assert (=> b!801815 m!743077))

(declare-fun m!743079 () Bool)

(assert (=> b!801815 m!743079))

(declare-fun m!743081 () Bool)

(assert (=> b!801815 m!743081))

(declare-fun m!743083 () Bool)

(assert (=> b!801815 m!743083))

(declare-fun m!743085 () Bool)

(assert (=> b!801823 m!743085))

(declare-fun m!743087 () Bool)

(assert (=> b!801820 m!743087))

(declare-fun m!743089 () Bool)

(assert (=> b!801820 m!743089))

(declare-fun m!743091 () Bool)

(assert (=> start!68796 m!743091))

(declare-fun m!743093 () Bool)

(assert (=> start!68796 m!743093))

(assert (=> b!801825 m!743061))

(assert (=> b!801825 m!743061))

(declare-fun m!743095 () Bool)

(assert (=> b!801825 m!743095))

(declare-fun m!743097 () Bool)

(assert (=> b!801816 m!743097))

(push 1)

(assert (not b!801825))

(assert (not start!68796))

(assert (not b!801824))

(assert (not b!801816))

(assert (not b!801823))

(assert (not b!801818))

(assert (not b!801821))

(assert (not b!801817))

(assert (not b!801815))

(assert (not b!801819))

(check-sat)

(pop 1)

