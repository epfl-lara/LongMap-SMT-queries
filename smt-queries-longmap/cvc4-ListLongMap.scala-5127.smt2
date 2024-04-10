; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69648 () Bool)

(assert start!69648)

(declare-fun b!811473 () Bool)

(declare-fun e!449134 () Bool)

(declare-fun e!449131 () Bool)

(assert (=> b!811473 (= e!449134 e!449131)))

(declare-fun res!554522 () Bool)

(assert (=> b!811473 (=> (not res!554522) (not e!449131))))

(declare-fun lt!363834 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!44087 0))(
  ( (array!44088 (arr!21113 (Array (_ BitVec 32) (_ BitVec 64))) (size!21534 (_ BitVec 32))) )
))
(declare-fun lt!363835 () array!44087)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8704 0))(
  ( (MissingZero!8704 (index!37187 (_ BitVec 32))) (Found!8704 (index!37188 (_ BitVec 32))) (Intermediate!8704 (undefined!9516 Bool) (index!37189 (_ BitVec 32)) (x!67997 (_ BitVec 32))) (Undefined!8704) (MissingVacant!8704 (index!37190 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44087 (_ BitVec 32)) SeekEntryResult!8704)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44087 (_ BitVec 32)) SeekEntryResult!8704)

(assert (=> b!811473 (= res!554522 (= (seekEntryOrOpen!0 lt!363834 lt!363835 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363834 lt!363835 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!44087)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!811473 (= lt!363834 (select (store (arr!21113 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!811473 (= lt!363835 (array!44088 (store (arr!21113 a!3170) i!1163 k!2044) (size!21534 a!3170)))))

(declare-fun b!811474 () Bool)

(declare-fun res!554524 () Bool)

(declare-fun e!449132 () Bool)

(assert (=> b!811474 (=> (not res!554524) (not e!449132))))

(declare-fun arrayContainsKey!0 (array!44087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811474 (= res!554524 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811475 () Bool)

(assert (=> b!811475 (= e!449132 e!449134)))

(declare-fun res!554517 () Bool)

(assert (=> b!811475 (=> (not res!554517) (not e!449134))))

(declare-fun lt!363831 () SeekEntryResult!8704)

(assert (=> b!811475 (= res!554517 (or (= lt!363831 (MissingZero!8704 i!1163)) (= lt!363831 (MissingVacant!8704 i!1163))))))

(assert (=> b!811475 (= lt!363831 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!811476 () Bool)

(declare-fun e!449133 () Bool)

(assert (=> b!811476 (= e!449133 (not true))))

(declare-fun lt!363833 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!811476 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363833 vacantAfter!23 lt!363834 lt!363835 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363833 vacantBefore!23 (select (arr!21113 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27670 0))(
  ( (Unit!27671) )
))
(declare-fun lt!363830 () Unit!27670)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44087 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27670)

(assert (=> b!811476 (= lt!363830 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363833 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811476 (= lt!363833 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811477 () Bool)

(assert (=> b!811477 (= e!449131 e!449133)))

(declare-fun res!554515 () Bool)

(assert (=> b!811477 (=> (not res!554515) (not e!449133))))

(declare-fun lt!363832 () SeekEntryResult!8704)

(declare-fun lt!363836 () SeekEntryResult!8704)

(assert (=> b!811477 (= res!554515 (and (= lt!363836 lt!363832) (= lt!363832 (Found!8704 j!153)) (not (= (select (arr!21113 a!3170) index!1236) (select (arr!21113 a!3170) j!153)))))))

(assert (=> b!811477 (= lt!363832 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21113 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811477 (= lt!363836 (seekEntryOrOpen!0 (select (arr!21113 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811478 () Bool)

(declare-fun res!554518 () Bool)

(assert (=> b!811478 (=> (not res!554518) (not e!449132))))

(assert (=> b!811478 (= res!554518 (and (= (size!21534 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21534 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21534 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!554520 () Bool)

(assert (=> start!69648 (=> (not res!554520) (not e!449132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69648 (= res!554520 (validMask!0 mask!3266))))

(assert (=> start!69648 e!449132))

(assert (=> start!69648 true))

(declare-fun array_inv!16909 (array!44087) Bool)

(assert (=> start!69648 (array_inv!16909 a!3170)))

(declare-fun b!811472 () Bool)

(declare-fun res!554523 () Bool)

(assert (=> b!811472 (=> (not res!554523) (not e!449134))))

(declare-datatypes ((List!15076 0))(
  ( (Nil!15073) (Cons!15072 (h!16201 (_ BitVec 64)) (t!21391 List!15076)) )
))
(declare-fun arrayNoDuplicates!0 (array!44087 (_ BitVec 32) List!15076) Bool)

(assert (=> b!811472 (= res!554523 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15073))))

(declare-fun b!811479 () Bool)

(declare-fun res!554516 () Bool)

(assert (=> b!811479 (=> (not res!554516) (not e!449132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811479 (= res!554516 (validKeyInArray!0 k!2044))))

(declare-fun b!811480 () Bool)

(declare-fun res!554519 () Bool)

(assert (=> b!811480 (=> (not res!554519) (not e!449134))))

(assert (=> b!811480 (= res!554519 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21534 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21113 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21534 a!3170)) (= (select (arr!21113 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811481 () Bool)

(declare-fun res!554525 () Bool)

(assert (=> b!811481 (=> (not res!554525) (not e!449134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44087 (_ BitVec 32)) Bool)

(assert (=> b!811481 (= res!554525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811482 () Bool)

(declare-fun res!554521 () Bool)

(assert (=> b!811482 (=> (not res!554521) (not e!449132))))

(assert (=> b!811482 (= res!554521 (validKeyInArray!0 (select (arr!21113 a!3170) j!153)))))

(assert (= (and start!69648 res!554520) b!811478))

(assert (= (and b!811478 res!554518) b!811482))

(assert (= (and b!811482 res!554521) b!811479))

(assert (= (and b!811479 res!554516) b!811474))

(assert (= (and b!811474 res!554524) b!811475))

(assert (= (and b!811475 res!554517) b!811481))

(assert (= (and b!811481 res!554525) b!811472))

(assert (= (and b!811472 res!554523) b!811480))

(assert (= (and b!811480 res!554519) b!811473))

(assert (= (and b!811473 res!554522) b!811477))

(assert (= (and b!811477 res!554515) b!811476))

(declare-fun m!753831 () Bool)

(assert (=> start!69648 m!753831))

(declare-fun m!753833 () Bool)

(assert (=> start!69648 m!753833))

(declare-fun m!753835 () Bool)

(assert (=> b!811477 m!753835))

(declare-fun m!753837 () Bool)

(assert (=> b!811477 m!753837))

(assert (=> b!811477 m!753837))

(declare-fun m!753839 () Bool)

(assert (=> b!811477 m!753839))

(assert (=> b!811477 m!753837))

(declare-fun m!753841 () Bool)

(assert (=> b!811477 m!753841))

(declare-fun m!753843 () Bool)

(assert (=> b!811473 m!753843))

(declare-fun m!753845 () Bool)

(assert (=> b!811473 m!753845))

(declare-fun m!753847 () Bool)

(assert (=> b!811473 m!753847))

(declare-fun m!753849 () Bool)

(assert (=> b!811473 m!753849))

(declare-fun m!753851 () Bool)

(assert (=> b!811474 m!753851))

(declare-fun m!753853 () Bool)

(assert (=> b!811481 m!753853))

(declare-fun m!753855 () Bool)

(assert (=> b!811479 m!753855))

(assert (=> b!811482 m!753837))

(assert (=> b!811482 m!753837))

(declare-fun m!753857 () Bool)

(assert (=> b!811482 m!753857))

(declare-fun m!753859 () Bool)

(assert (=> b!811480 m!753859))

(declare-fun m!753861 () Bool)

(assert (=> b!811480 m!753861))

(declare-fun m!753863 () Bool)

(assert (=> b!811472 m!753863))

(assert (=> b!811476 m!753837))

(declare-fun m!753865 () Bool)

(assert (=> b!811476 m!753865))

(declare-fun m!753867 () Bool)

(assert (=> b!811476 m!753867))

(declare-fun m!753869 () Bool)

(assert (=> b!811476 m!753869))

(assert (=> b!811476 m!753837))

(declare-fun m!753871 () Bool)

(assert (=> b!811476 m!753871))

(declare-fun m!753873 () Bool)

(assert (=> b!811475 m!753873))

(push 1)

