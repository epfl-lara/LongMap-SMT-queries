; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69032 () Bool)

(assert start!69032)

(declare-fun res!547832 () Bool)

(declare-fun e!445536 () Bool)

(assert (=> start!69032 (=> (not res!547832) (not e!445536))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69032 (= res!547832 (validMask!0 mask!3266))))

(assert (=> start!69032 e!445536))

(assert (=> start!69032 true))

(declare-datatypes ((array!43654 0))(
  ( (array!43655 (arr!20902 (Array (_ BitVec 32) (_ BitVec 64))) (size!21322 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43654)

(declare-fun array_inv!16761 (array!43654) Bool)

(assert (=> start!69032 (array_inv!16761 a!3170)))

(declare-fun b!803854 () Bool)

(declare-fun res!547828 () Bool)

(assert (=> b!803854 (=> (not res!547828) (not e!445536))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803854 (= res!547828 (validKeyInArray!0 (select (arr!20902 a!3170) j!153)))))

(declare-fun b!803855 () Bool)

(declare-fun e!445535 () Bool)

(declare-fun e!445538 () Bool)

(assert (=> b!803855 (= e!445535 e!445538)))

(declare-fun res!547825 () Bool)

(assert (=> b!803855 (=> (not res!547825) (not e!445538))))

(declare-datatypes ((SeekEntryResult!8449 0))(
  ( (MissingZero!8449 (index!36164 (_ BitVec 32))) (Found!8449 (index!36165 (_ BitVec 32))) (Intermediate!8449 (undefined!9261 Bool) (index!36166 (_ BitVec 32)) (x!67173 (_ BitVec 32))) (Undefined!8449) (MissingVacant!8449 (index!36167 (_ BitVec 32))) )
))
(declare-fun lt!359596 () SeekEntryResult!8449)

(declare-fun lt!359589 () SeekEntryResult!8449)

(assert (=> b!803855 (= res!547825 (= lt!359596 lt!359589))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!359593 () array!43654)

(declare-fun lt!359591 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43654 (_ BitVec 32)) SeekEntryResult!8449)

(assert (=> b!803855 (= lt!359589 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359591 lt!359593 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43654 (_ BitVec 32)) SeekEntryResult!8449)

(assert (=> b!803855 (= lt!359596 (seekEntryOrOpen!0 lt!359591 lt!359593 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803855 (= lt!359591 (select (store (arr!20902 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803855 (= lt!359593 (array!43655 (store (arr!20902 a!3170) i!1163 k0!2044) (size!21322 a!3170)))))

(declare-fun b!803856 () Bool)

(declare-fun res!547835 () Bool)

(assert (=> b!803856 (=> (not res!547835) (not e!445535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43654 (_ BitVec 32)) Bool)

(assert (=> b!803856 (= res!547835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803857 () Bool)

(declare-fun res!547831 () Bool)

(assert (=> b!803857 (=> (not res!547831) (not e!445535))))

(declare-datatypes ((List!14772 0))(
  ( (Nil!14769) (Cons!14768 (h!15903 (_ BitVec 64)) (t!21079 List!14772)) )
))
(declare-fun arrayNoDuplicates!0 (array!43654 (_ BitVec 32) List!14772) Bool)

(assert (=> b!803857 (= res!547831 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14769))))

(declare-fun b!803858 () Bool)

(declare-fun res!547834 () Bool)

(assert (=> b!803858 (=> (not res!547834) (not e!445536))))

(assert (=> b!803858 (= res!547834 (validKeyInArray!0 k0!2044))))

(declare-fun b!803859 () Bool)

(declare-fun e!445540 () Bool)

(assert (=> b!803859 (= e!445538 e!445540)))

(declare-fun res!547826 () Bool)

(assert (=> b!803859 (=> (not res!547826) (not e!445540))))

(declare-fun lt!359592 () SeekEntryResult!8449)

(declare-fun lt!359588 () SeekEntryResult!8449)

(assert (=> b!803859 (= res!547826 (= lt!359592 lt!359588))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803859 (= lt!359588 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20902 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803859 (= lt!359592 (seekEntryOrOpen!0 (select (arr!20902 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803860 () Bool)

(assert (=> b!803860 (= e!445536 e!445535)))

(declare-fun res!547836 () Bool)

(assert (=> b!803860 (=> (not res!547836) (not e!445535))))

(declare-fun lt!359595 () SeekEntryResult!8449)

(assert (=> b!803860 (= res!547836 (or (= lt!359595 (MissingZero!8449 i!1163)) (= lt!359595 (MissingVacant!8449 i!1163))))))

(assert (=> b!803860 (= lt!359595 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803861 () Bool)

(declare-fun res!547829 () Bool)

(assert (=> b!803861 (=> (not res!547829) (not e!445536))))

(assert (=> b!803861 (= res!547829 (and (= (size!21322 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21322 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21322 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803862 () Bool)

(declare-fun e!445539 () Bool)

(assert (=> b!803862 (= e!445540 e!445539)))

(declare-fun res!547833 () Bool)

(assert (=> b!803862 (=> (not res!547833) (not e!445539))))

(declare-fun lt!359597 () SeekEntryResult!8449)

(assert (=> b!803862 (= res!547833 (and (= lt!359588 lt!359597) (not (= (select (arr!20902 a!3170) index!1236) (select (arr!20902 a!3170) j!153)))))))

(assert (=> b!803862 (= lt!359597 (Found!8449 j!153))))

(declare-fun b!803863 () Bool)

(declare-fun res!547827 () Bool)

(assert (=> b!803863 (=> (not res!547827) (not e!445535))))

(assert (=> b!803863 (= res!547827 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21322 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20902 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21322 a!3170)) (= (select (arr!20902 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803864 () Bool)

(assert (=> b!803864 (= e!445539 (not (or (not (= lt!359589 lt!359597)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!359590 () (_ BitVec 32))

(assert (=> b!803864 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359590 vacantAfter!23 lt!359591 lt!359593 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359590 vacantBefore!23 (select (arr!20902 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27523 0))(
  ( (Unit!27524) )
))
(declare-fun lt!359594 () Unit!27523)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43654 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27523)

(assert (=> b!803864 (= lt!359594 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359590 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803864 (= lt!359590 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!803865 () Bool)

(declare-fun res!547830 () Bool)

(assert (=> b!803865 (=> (not res!547830) (not e!445536))))

(declare-fun arrayContainsKey!0 (array!43654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803865 (= res!547830 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69032 res!547832) b!803861))

(assert (= (and b!803861 res!547829) b!803854))

(assert (= (and b!803854 res!547828) b!803858))

(assert (= (and b!803858 res!547834) b!803865))

(assert (= (and b!803865 res!547830) b!803860))

(assert (= (and b!803860 res!547836) b!803856))

(assert (= (and b!803856 res!547835) b!803857))

(assert (= (and b!803857 res!547831) b!803863))

(assert (= (and b!803863 res!547827) b!803855))

(assert (= (and b!803855 res!547825) b!803859))

(assert (= (and b!803859 res!547826) b!803862))

(assert (= (and b!803862 res!547833) b!803864))

(declare-fun m!745825 () Bool)

(assert (=> b!803854 m!745825))

(assert (=> b!803854 m!745825))

(declare-fun m!745827 () Bool)

(assert (=> b!803854 m!745827))

(declare-fun m!745829 () Bool)

(assert (=> b!803863 m!745829))

(declare-fun m!745831 () Bool)

(assert (=> b!803863 m!745831))

(declare-fun m!745833 () Bool)

(assert (=> b!803858 m!745833))

(declare-fun m!745835 () Bool)

(assert (=> b!803856 m!745835))

(assert (=> b!803859 m!745825))

(assert (=> b!803859 m!745825))

(declare-fun m!745837 () Bool)

(assert (=> b!803859 m!745837))

(assert (=> b!803859 m!745825))

(declare-fun m!745839 () Bool)

(assert (=> b!803859 m!745839))

(declare-fun m!745841 () Bool)

(assert (=> b!803862 m!745841))

(assert (=> b!803862 m!745825))

(declare-fun m!745843 () Bool)

(assert (=> b!803855 m!745843))

(declare-fun m!745845 () Bool)

(assert (=> b!803855 m!745845))

(declare-fun m!745847 () Bool)

(assert (=> b!803855 m!745847))

(declare-fun m!745849 () Bool)

(assert (=> b!803855 m!745849))

(declare-fun m!745851 () Bool)

(assert (=> b!803860 m!745851))

(declare-fun m!745853 () Bool)

(assert (=> b!803865 m!745853))

(declare-fun m!745855 () Bool)

(assert (=> b!803857 m!745855))

(declare-fun m!745857 () Bool)

(assert (=> start!69032 m!745857))

(declare-fun m!745859 () Bool)

(assert (=> start!69032 m!745859))

(declare-fun m!745861 () Bool)

(assert (=> b!803864 m!745861))

(declare-fun m!745863 () Bool)

(assert (=> b!803864 m!745863))

(assert (=> b!803864 m!745825))

(declare-fun m!745865 () Bool)

(assert (=> b!803864 m!745865))

(assert (=> b!803864 m!745825))

(declare-fun m!745867 () Bool)

(assert (=> b!803864 m!745867))

(check-sat (not b!803855) (not b!803859) (not b!803857) (not b!803854) (not b!803865) (not b!803856) (not b!803858) (not b!803860) (not start!69032) (not b!803864))
(check-sat)
