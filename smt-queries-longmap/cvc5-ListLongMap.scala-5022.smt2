; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68642 () Bool)

(assert start!68642)

(declare-fun b!798846 () Bool)

(declare-fun res!543370 () Bool)

(declare-fun e!443058 () Bool)

(assert (=> b!798846 (=> (not res!543370) (not e!443058))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43432 0))(
  ( (array!43433 (arr!20796 (Array (_ BitVec 32) (_ BitVec 64))) (size!21217 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43432)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798846 (= res!543370 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21217 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20796 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21217 a!3170)) (= (select (arr!20796 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798847 () Bool)

(declare-fun e!443057 () Bool)

(assert (=> b!798847 (= e!443057 false)))

(declare-datatypes ((SeekEntryResult!8387 0))(
  ( (MissingZero!8387 (index!35916 (_ BitVec 32))) (Found!8387 (index!35917 (_ BitVec 32))) (Intermediate!8387 (undefined!9199 Bool) (index!35918 (_ BitVec 32)) (x!66801 (_ BitVec 32))) (Undefined!8387) (MissingVacant!8387 (index!35919 (_ BitVec 32))) )
))
(declare-fun lt!356626 () SeekEntryResult!8387)

(declare-fun lt!356631 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43432 (_ BitVec 32)) SeekEntryResult!8387)

(assert (=> b!798847 (= lt!356626 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356631 vacantBefore!23 (select (arr!20796 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!543369 () Bool)

(declare-fun e!443060 () Bool)

(assert (=> start!68642 (=> (not res!543369) (not e!443060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68642 (= res!543369 (validMask!0 mask!3266))))

(assert (=> start!68642 e!443060))

(assert (=> start!68642 true))

(declare-fun array_inv!16592 (array!43432) Bool)

(assert (=> start!68642 (array_inv!16592 a!3170)))

(declare-fun b!798848 () Bool)

(declare-fun e!443056 () Bool)

(assert (=> b!798848 (= e!443056 e!443057)))

(declare-fun res!543373 () Bool)

(assert (=> b!798848 (=> (not res!543373) (not e!443057))))

(assert (=> b!798848 (= res!543373 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356631 #b00000000000000000000000000000000) (bvslt lt!356631 (size!21217 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!798848 (= lt!356631 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!798849 () Bool)

(declare-fun res!543368 () Bool)

(assert (=> b!798849 (=> (not res!543368) (not e!443060))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798849 (= res!543368 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798850 () Bool)

(declare-fun res!543367 () Bool)

(assert (=> b!798850 (=> (not res!543367) (not e!443058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43432 (_ BitVec 32)) Bool)

(assert (=> b!798850 (= res!543367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798851 () Bool)

(declare-fun res!543366 () Bool)

(assert (=> b!798851 (=> (not res!543366) (not e!443058))))

(declare-datatypes ((List!14759 0))(
  ( (Nil!14756) (Cons!14755 (h!15884 (_ BitVec 64)) (t!21074 List!14759)) )
))
(declare-fun arrayNoDuplicates!0 (array!43432 (_ BitVec 32) List!14759) Bool)

(assert (=> b!798851 (= res!543366 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14756))))

(declare-fun b!798852 () Bool)

(declare-fun res!543374 () Bool)

(assert (=> b!798852 (=> (not res!543374) (not e!443060))))

(assert (=> b!798852 (= res!543374 (and (= (size!21217 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21217 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21217 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798853 () Bool)

(declare-fun e!443055 () Bool)

(assert (=> b!798853 (= e!443055 e!443056)))

(declare-fun res!543377 () Bool)

(assert (=> b!798853 (=> (not res!543377) (not e!443056))))

(declare-fun lt!356627 () SeekEntryResult!8387)

(declare-fun lt!356632 () SeekEntryResult!8387)

(assert (=> b!798853 (= res!543377 (and (= lt!356632 lt!356627) (= lt!356627 (Found!8387 j!153)) (not (= (select (arr!20796 a!3170) index!1236) (select (arr!20796 a!3170) j!153)))))))

(assert (=> b!798853 (= lt!356627 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20796 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43432 (_ BitVec 32)) SeekEntryResult!8387)

(assert (=> b!798853 (= lt!356632 (seekEntryOrOpen!0 (select (arr!20796 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798854 () Bool)

(assert (=> b!798854 (= e!443058 e!443055)))

(declare-fun res!543376 () Bool)

(assert (=> b!798854 (=> (not res!543376) (not e!443055))))

(declare-fun lt!356630 () SeekEntryResult!8387)

(declare-fun lt!356633 () array!43432)

(declare-fun lt!356628 () (_ BitVec 64))

(assert (=> b!798854 (= res!543376 (= lt!356630 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356628 lt!356633 mask!3266)))))

(assert (=> b!798854 (= lt!356630 (seekEntryOrOpen!0 lt!356628 lt!356633 mask!3266))))

(assert (=> b!798854 (= lt!356628 (select (store (arr!20796 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798854 (= lt!356633 (array!43433 (store (arr!20796 a!3170) i!1163 k!2044) (size!21217 a!3170)))))

(declare-fun b!798855 () Bool)

(assert (=> b!798855 (= e!443060 e!443058)))

(declare-fun res!543372 () Bool)

(assert (=> b!798855 (=> (not res!543372) (not e!443058))))

(declare-fun lt!356629 () SeekEntryResult!8387)

(assert (=> b!798855 (= res!543372 (or (= lt!356629 (MissingZero!8387 i!1163)) (= lt!356629 (MissingVacant!8387 i!1163))))))

(assert (=> b!798855 (= lt!356629 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798856 () Bool)

(declare-fun res!543365 () Bool)

(assert (=> b!798856 (=> (not res!543365) (not e!443057))))

(assert (=> b!798856 (= res!543365 (= lt!356630 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356631 vacantAfter!23 lt!356628 lt!356633 mask!3266)))))

(declare-fun b!798857 () Bool)

(declare-fun res!543371 () Bool)

(assert (=> b!798857 (=> (not res!543371) (not e!443060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798857 (= res!543371 (validKeyInArray!0 (select (arr!20796 a!3170) j!153)))))

(declare-fun b!798858 () Bool)

(declare-fun res!543375 () Bool)

(assert (=> b!798858 (=> (not res!543375) (not e!443060))))

(assert (=> b!798858 (= res!543375 (validKeyInArray!0 k!2044))))

(assert (= (and start!68642 res!543369) b!798852))

(assert (= (and b!798852 res!543374) b!798857))

(assert (= (and b!798857 res!543371) b!798858))

(assert (= (and b!798858 res!543375) b!798849))

(assert (= (and b!798849 res!543368) b!798855))

(assert (= (and b!798855 res!543372) b!798850))

(assert (= (and b!798850 res!543367) b!798851))

(assert (= (and b!798851 res!543366) b!798846))

(assert (= (and b!798846 res!543370) b!798854))

(assert (= (and b!798854 res!543376) b!798853))

(assert (= (and b!798853 res!543377) b!798848))

(assert (= (and b!798848 res!543373) b!798856))

(assert (= (and b!798856 res!543365) b!798847))

(declare-fun m!739811 () Bool)

(assert (=> b!798846 m!739811))

(declare-fun m!739813 () Bool)

(assert (=> b!798846 m!739813))

(declare-fun m!739815 () Bool)

(assert (=> b!798855 m!739815))

(declare-fun m!739817 () Bool)

(assert (=> b!798850 m!739817))

(declare-fun m!739819 () Bool)

(assert (=> b!798857 m!739819))

(assert (=> b!798857 m!739819))

(declare-fun m!739821 () Bool)

(assert (=> b!798857 m!739821))

(declare-fun m!739823 () Bool)

(assert (=> b!798858 m!739823))

(declare-fun m!739825 () Bool)

(assert (=> start!68642 m!739825))

(declare-fun m!739827 () Bool)

(assert (=> start!68642 m!739827))

(assert (=> b!798847 m!739819))

(assert (=> b!798847 m!739819))

(declare-fun m!739829 () Bool)

(assert (=> b!798847 m!739829))

(declare-fun m!739831 () Bool)

(assert (=> b!798849 m!739831))

(declare-fun m!739833 () Bool)

(assert (=> b!798856 m!739833))

(declare-fun m!739835 () Bool)

(assert (=> b!798853 m!739835))

(assert (=> b!798853 m!739819))

(assert (=> b!798853 m!739819))

(declare-fun m!739837 () Bool)

(assert (=> b!798853 m!739837))

(assert (=> b!798853 m!739819))

(declare-fun m!739839 () Bool)

(assert (=> b!798853 m!739839))

(declare-fun m!739841 () Bool)

(assert (=> b!798848 m!739841))

(declare-fun m!739843 () Bool)

(assert (=> b!798854 m!739843))

(declare-fun m!739845 () Bool)

(assert (=> b!798854 m!739845))

(declare-fun m!739847 () Bool)

(assert (=> b!798854 m!739847))

(declare-fun m!739849 () Bool)

(assert (=> b!798854 m!739849))

(declare-fun m!739851 () Bool)

(assert (=> b!798851 m!739851))

(push 1)

