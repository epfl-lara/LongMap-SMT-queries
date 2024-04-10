; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69646 () Bool)

(assert start!69646)

(declare-fun b!811439 () Bool)

(declare-fun res!554486 () Bool)

(declare-fun e!449118 () Bool)

(assert (=> b!811439 (=> (not res!554486) (not e!449118))))

(declare-datatypes ((array!44085 0))(
  ( (array!44086 (arr!21112 (Array (_ BitVec 32) (_ BitVec 64))) (size!21533 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44085)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811439 (= res!554486 (validKeyInArray!0 (select (arr!21112 a!3170) j!153)))))

(declare-fun res!554492 () Bool)

(assert (=> start!69646 (=> (not res!554492) (not e!449118))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69646 (= res!554492 (validMask!0 mask!3266))))

(assert (=> start!69646 e!449118))

(assert (=> start!69646 true))

(declare-fun array_inv!16908 (array!44085) Bool)

(assert (=> start!69646 (array_inv!16908 a!3170)))

(declare-fun b!811440 () Bool)

(declare-fun e!449116 () Bool)

(assert (=> b!811440 (= e!449118 e!449116)))

(declare-fun res!554488 () Bool)

(assert (=> b!811440 (=> (not res!554488) (not e!449116))))

(declare-datatypes ((SeekEntryResult!8703 0))(
  ( (MissingZero!8703 (index!37183 (_ BitVec 32))) (Found!8703 (index!37184 (_ BitVec 32))) (Intermediate!8703 (undefined!9515 Bool) (index!37185 (_ BitVec 32)) (x!67996 (_ BitVec 32))) (Undefined!8703) (MissingVacant!8703 (index!37186 (_ BitVec 32))) )
))
(declare-fun lt!363811 () SeekEntryResult!8703)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!811440 (= res!554488 (or (= lt!363811 (MissingZero!8703 i!1163)) (= lt!363811 (MissingVacant!8703 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44085 (_ BitVec 32)) SeekEntryResult!8703)

(assert (=> b!811440 (= lt!363811 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811441 () Bool)

(declare-fun e!449117 () Bool)

(declare-fun e!449119 () Bool)

(assert (=> b!811441 (= e!449117 e!449119)))

(declare-fun res!554485 () Bool)

(assert (=> b!811441 (=> (not res!554485) (not e!449119))))

(declare-fun lt!363812 () SeekEntryResult!8703)

(declare-fun lt!363813 () SeekEntryResult!8703)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!811441 (= res!554485 (and (= lt!363812 lt!363813) (= lt!363813 (Found!8703 j!153)) (not (= (select (arr!21112 a!3170) index!1236) (select (arr!21112 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44085 (_ BitVec 32)) SeekEntryResult!8703)

(assert (=> b!811441 (= lt!363813 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21112 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811441 (= lt!363812 (seekEntryOrOpen!0 (select (arr!21112 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811442 () Bool)

(declare-fun res!554483 () Bool)

(assert (=> b!811442 (=> (not res!554483) (not e!449118))))

(assert (=> b!811442 (= res!554483 (and (= (size!21533 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21533 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21533 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811443 () Bool)

(declare-fun res!554491 () Bool)

(assert (=> b!811443 (=> (not res!554491) (not e!449118))))

(declare-fun arrayContainsKey!0 (array!44085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811443 (= res!554491 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811444 () Bool)

(declare-fun res!554489 () Bool)

(assert (=> b!811444 (=> (not res!554489) (not e!449116))))

(declare-datatypes ((List!15075 0))(
  ( (Nil!15072) (Cons!15071 (h!16200 (_ BitVec 64)) (t!21390 List!15075)) )
))
(declare-fun arrayNoDuplicates!0 (array!44085 (_ BitVec 32) List!15075) Bool)

(assert (=> b!811444 (= res!554489 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15072))))

(declare-fun b!811445 () Bool)

(declare-fun res!554490 () Bool)

(assert (=> b!811445 (=> (not res!554490) (not e!449118))))

(assert (=> b!811445 (= res!554490 (validKeyInArray!0 k0!2044))))

(declare-fun b!811446 () Bool)

(declare-fun res!554484 () Bool)

(assert (=> b!811446 (=> (not res!554484) (not e!449116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44085 (_ BitVec 32)) Bool)

(assert (=> b!811446 (= res!554484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811447 () Bool)

(assert (=> b!811447 (= e!449119 (not true))))

(declare-fun lt!363810 () array!44085)

(declare-fun lt!363809 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363815 () (_ BitVec 64))

(assert (=> b!811447 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363809 vacantAfter!23 lt!363815 lt!363810 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363809 vacantBefore!23 (select (arr!21112 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27668 0))(
  ( (Unit!27669) )
))
(declare-fun lt!363814 () Unit!27668)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44085 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27668)

(assert (=> b!811447 (= lt!363814 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363809 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811447 (= lt!363809 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811448 () Bool)

(assert (=> b!811448 (= e!449116 e!449117)))

(declare-fun res!554487 () Bool)

(assert (=> b!811448 (=> (not res!554487) (not e!449117))))

(assert (=> b!811448 (= res!554487 (= (seekEntryOrOpen!0 lt!363815 lt!363810 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363815 lt!363810 mask!3266)))))

(assert (=> b!811448 (= lt!363815 (select (store (arr!21112 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811448 (= lt!363810 (array!44086 (store (arr!21112 a!3170) i!1163 k0!2044) (size!21533 a!3170)))))

(declare-fun b!811449 () Bool)

(declare-fun res!554482 () Bool)

(assert (=> b!811449 (=> (not res!554482) (not e!449116))))

(assert (=> b!811449 (= res!554482 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21533 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21112 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21533 a!3170)) (= (select (arr!21112 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69646 res!554492) b!811442))

(assert (= (and b!811442 res!554483) b!811439))

(assert (= (and b!811439 res!554486) b!811445))

(assert (= (and b!811445 res!554490) b!811443))

(assert (= (and b!811443 res!554491) b!811440))

(assert (= (and b!811440 res!554488) b!811446))

(assert (= (and b!811446 res!554484) b!811444))

(assert (= (and b!811444 res!554489) b!811449))

(assert (= (and b!811449 res!554482) b!811448))

(assert (= (and b!811448 res!554487) b!811441))

(assert (= (and b!811441 res!554485) b!811447))

(declare-fun m!753787 () Bool)

(assert (=> b!811444 m!753787))

(declare-fun m!753789 () Bool)

(assert (=> b!811440 m!753789))

(declare-fun m!753791 () Bool)

(assert (=> b!811439 m!753791))

(assert (=> b!811439 m!753791))

(declare-fun m!753793 () Bool)

(assert (=> b!811439 m!753793))

(declare-fun m!753795 () Bool)

(assert (=> b!811448 m!753795))

(declare-fun m!753797 () Bool)

(assert (=> b!811448 m!753797))

(declare-fun m!753799 () Bool)

(assert (=> b!811448 m!753799))

(declare-fun m!753801 () Bool)

(assert (=> b!811448 m!753801))

(declare-fun m!753803 () Bool)

(assert (=> b!811447 m!753803))

(assert (=> b!811447 m!753791))

(declare-fun m!753805 () Bool)

(assert (=> b!811447 m!753805))

(declare-fun m!753807 () Bool)

(assert (=> b!811447 m!753807))

(assert (=> b!811447 m!753791))

(declare-fun m!753809 () Bool)

(assert (=> b!811447 m!753809))

(declare-fun m!753811 () Bool)

(assert (=> b!811449 m!753811))

(declare-fun m!753813 () Bool)

(assert (=> b!811449 m!753813))

(declare-fun m!753815 () Bool)

(assert (=> start!69646 m!753815))

(declare-fun m!753817 () Bool)

(assert (=> start!69646 m!753817))

(declare-fun m!753819 () Bool)

(assert (=> b!811443 m!753819))

(declare-fun m!753821 () Bool)

(assert (=> b!811445 m!753821))

(declare-fun m!753823 () Bool)

(assert (=> b!811441 m!753823))

(assert (=> b!811441 m!753791))

(assert (=> b!811441 m!753791))

(declare-fun m!753825 () Bool)

(assert (=> b!811441 m!753825))

(assert (=> b!811441 m!753791))

(declare-fun m!753827 () Bool)

(assert (=> b!811441 m!753827))

(declare-fun m!753829 () Bool)

(assert (=> b!811446 m!753829))

(check-sat (not start!69646) (not b!811445) (not b!811447) (not b!811444) (not b!811439) (not b!811441) (not b!811446) (not b!811443) (not b!811448) (not b!811440))
(check-sat)
