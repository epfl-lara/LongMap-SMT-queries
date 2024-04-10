; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68908 () Bool)

(assert start!68908)

(declare-fun b!803744 () Bool)

(declare-fun res!548264 () Bool)

(declare-fun e!445348 () Bool)

(assert (=> b!803744 (=> (not res!548264) (not e!445348))))

(declare-datatypes ((array!43698 0))(
  ( (array!43699 (arr!20929 (Array (_ BitVec 32) (_ BitVec 64))) (size!21350 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43698)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803744 (= res!548264 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803745 () Bool)

(declare-fun e!445346 () Bool)

(assert (=> b!803745 (= e!445346 (not true))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359828 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!359822 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!359823 () array!43698)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8520 0))(
  ( (MissingZero!8520 (index!36448 (_ BitVec 32))) (Found!8520 (index!36449 (_ BitVec 32))) (Intermediate!8520 (undefined!9332 Bool) (index!36450 (_ BitVec 32)) (x!67286 (_ BitVec 32))) (Undefined!8520) (MissingVacant!8520 (index!36451 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43698 (_ BitVec 32)) SeekEntryResult!8520)

(assert (=> b!803745 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359828 vacantAfter!23 lt!359822 lt!359823 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359828 vacantBefore!23 (select (arr!20929 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27580 0))(
  ( (Unit!27581) )
))
(declare-fun lt!359827 () Unit!27580)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43698 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27580)

(assert (=> b!803745 (= lt!359827 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359828 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803745 (= lt!359828 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!548273 () Bool)

(assert (=> start!68908 (=> (not res!548273) (not e!445348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68908 (= res!548273 (validMask!0 mask!3266))))

(assert (=> start!68908 e!445348))

(assert (=> start!68908 true))

(declare-fun array_inv!16725 (array!43698) Bool)

(assert (=> start!68908 (array_inv!16725 a!3170)))

(declare-fun b!803746 () Bool)

(declare-fun e!445347 () Bool)

(declare-fun e!445349 () Bool)

(assert (=> b!803746 (= e!445347 e!445349)))

(declare-fun res!548268 () Bool)

(assert (=> b!803746 (=> (not res!548268) (not e!445349))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43698 (_ BitVec 32)) SeekEntryResult!8520)

(assert (=> b!803746 (= res!548268 (= (seekEntryOrOpen!0 lt!359822 lt!359823 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359822 lt!359823 mask!3266)))))

(assert (=> b!803746 (= lt!359822 (select (store (arr!20929 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803746 (= lt!359823 (array!43699 (store (arr!20929 a!3170) i!1163 k0!2044) (size!21350 a!3170)))))

(declare-fun b!803747 () Bool)

(declare-fun res!548270 () Bool)

(assert (=> b!803747 (=> (not res!548270) (not e!445347))))

(assert (=> b!803747 (= res!548270 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21350 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20929 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21350 a!3170)) (= (select (arr!20929 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803748 () Bool)

(declare-fun res!548267 () Bool)

(assert (=> b!803748 (=> (not res!548267) (not e!445348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803748 (= res!548267 (validKeyInArray!0 k0!2044))))

(declare-fun b!803749 () Bool)

(declare-fun res!548272 () Bool)

(assert (=> b!803749 (=> (not res!548272) (not e!445348))))

(assert (=> b!803749 (= res!548272 (validKeyInArray!0 (select (arr!20929 a!3170) j!153)))))

(declare-fun b!803750 () Bool)

(declare-fun res!548266 () Bool)

(assert (=> b!803750 (=> (not res!548266) (not e!445348))))

(assert (=> b!803750 (= res!548266 (and (= (size!21350 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21350 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21350 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803751 () Bool)

(declare-fun res!548263 () Bool)

(assert (=> b!803751 (=> (not res!548263) (not e!445347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43698 (_ BitVec 32)) Bool)

(assert (=> b!803751 (= res!548263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803752 () Bool)

(assert (=> b!803752 (= e!445349 e!445346)))

(declare-fun res!548269 () Bool)

(assert (=> b!803752 (=> (not res!548269) (not e!445346))))

(declare-fun lt!359824 () SeekEntryResult!8520)

(declare-fun lt!359825 () SeekEntryResult!8520)

(assert (=> b!803752 (= res!548269 (and (= lt!359825 lt!359824) (= lt!359824 (Found!8520 j!153)) (not (= (select (arr!20929 a!3170) index!1236) (select (arr!20929 a!3170) j!153)))))))

(assert (=> b!803752 (= lt!359824 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20929 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803752 (= lt!359825 (seekEntryOrOpen!0 (select (arr!20929 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803753 () Bool)

(assert (=> b!803753 (= e!445348 e!445347)))

(declare-fun res!548265 () Bool)

(assert (=> b!803753 (=> (not res!548265) (not e!445347))))

(declare-fun lt!359826 () SeekEntryResult!8520)

(assert (=> b!803753 (= res!548265 (or (= lt!359826 (MissingZero!8520 i!1163)) (= lt!359826 (MissingVacant!8520 i!1163))))))

(assert (=> b!803753 (= lt!359826 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803754 () Bool)

(declare-fun res!548271 () Bool)

(assert (=> b!803754 (=> (not res!548271) (not e!445347))))

(declare-datatypes ((List!14892 0))(
  ( (Nil!14889) (Cons!14888 (h!16017 (_ BitVec 64)) (t!21207 List!14892)) )
))
(declare-fun arrayNoDuplicates!0 (array!43698 (_ BitVec 32) List!14892) Bool)

(assert (=> b!803754 (= res!548271 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14889))))

(assert (= (and start!68908 res!548273) b!803750))

(assert (= (and b!803750 res!548266) b!803749))

(assert (= (and b!803749 res!548272) b!803748))

(assert (= (and b!803748 res!548267) b!803744))

(assert (= (and b!803744 res!548264) b!803753))

(assert (= (and b!803753 res!548265) b!803751))

(assert (= (and b!803751 res!548263) b!803754))

(assert (= (and b!803754 res!548271) b!803747))

(assert (= (and b!803747 res!548270) b!803746))

(assert (= (and b!803746 res!548268) b!803752))

(assert (= (and b!803752 res!548269) b!803745))

(declare-fun m!745555 () Bool)

(assert (=> b!803749 m!745555))

(assert (=> b!803749 m!745555))

(declare-fun m!745557 () Bool)

(assert (=> b!803749 m!745557))

(declare-fun m!745559 () Bool)

(assert (=> start!68908 m!745559))

(declare-fun m!745561 () Bool)

(assert (=> start!68908 m!745561))

(declare-fun m!745563 () Bool)

(assert (=> b!803752 m!745563))

(assert (=> b!803752 m!745555))

(assert (=> b!803752 m!745555))

(declare-fun m!745565 () Bool)

(assert (=> b!803752 m!745565))

(assert (=> b!803752 m!745555))

(declare-fun m!745567 () Bool)

(assert (=> b!803752 m!745567))

(declare-fun m!745569 () Bool)

(assert (=> b!803751 m!745569))

(declare-fun m!745571 () Bool)

(assert (=> b!803746 m!745571))

(declare-fun m!745573 () Bool)

(assert (=> b!803746 m!745573))

(declare-fun m!745575 () Bool)

(assert (=> b!803746 m!745575))

(declare-fun m!745577 () Bool)

(assert (=> b!803746 m!745577))

(declare-fun m!745579 () Bool)

(assert (=> b!803754 m!745579))

(declare-fun m!745581 () Bool)

(assert (=> b!803748 m!745581))

(declare-fun m!745583 () Bool)

(assert (=> b!803744 m!745583))

(assert (=> b!803745 m!745555))

(declare-fun m!745585 () Bool)

(assert (=> b!803745 m!745585))

(assert (=> b!803745 m!745555))

(declare-fun m!745587 () Bool)

(assert (=> b!803745 m!745587))

(declare-fun m!745589 () Bool)

(assert (=> b!803745 m!745589))

(declare-fun m!745591 () Bool)

(assert (=> b!803745 m!745591))

(declare-fun m!745593 () Bool)

(assert (=> b!803753 m!745593))

(declare-fun m!745595 () Bool)

(assert (=> b!803747 m!745595))

(declare-fun m!745597 () Bool)

(assert (=> b!803747 m!745597))

(check-sat (not b!803744) (not b!803751) (not b!803754) (not b!803745) (not b!803752) (not b!803748) (not b!803746) (not b!803749) (not start!68908) (not b!803753))
(check-sat)
