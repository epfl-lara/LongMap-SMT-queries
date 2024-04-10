; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69652 () Bool)

(assert start!69652)

(declare-fun b!811538 () Bool)

(declare-fun e!449162 () Bool)

(declare-fun e!449165 () Bool)

(assert (=> b!811538 (= e!449162 e!449165)))

(declare-fun res!554590 () Bool)

(assert (=> b!811538 (=> (not res!554590) (not e!449165))))

(declare-datatypes ((array!44091 0))(
  ( (array!44092 (arr!21115 (Array (_ BitVec 32) (_ BitVec 64))) (size!21536 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44091)

(declare-datatypes ((SeekEntryResult!8706 0))(
  ( (MissingZero!8706 (index!37195 (_ BitVec 32))) (Found!8706 (index!37196 (_ BitVec 32))) (Intermediate!8706 (undefined!9518 Bool) (index!37197 (_ BitVec 32)) (x!68007 (_ BitVec 32))) (Undefined!8706) (MissingVacant!8706 (index!37198 (_ BitVec 32))) )
))
(declare-fun lt!363874 () SeekEntryResult!8706)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!363873 () SeekEntryResult!8706)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!811538 (= res!554590 (and (= lt!363874 lt!363873) (= lt!363873 (Found!8706 j!153)) (not (= (select (arr!21115 a!3170) index!1236) (select (arr!21115 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44091 (_ BitVec 32)) SeekEntryResult!8706)

(assert (=> b!811538 (= lt!363873 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21115 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44091 (_ BitVec 32)) SeekEntryResult!8706)

(assert (=> b!811538 (= lt!363874 (seekEntryOrOpen!0 (select (arr!21115 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811539 () Bool)

(declare-fun res!554588 () Bool)

(declare-fun e!449164 () Bool)

(assert (=> b!811539 (=> (not res!554588) (not e!449164))))

(declare-datatypes ((List!15078 0))(
  ( (Nil!15075) (Cons!15074 (h!16203 (_ BitVec 64)) (t!21393 List!15078)) )
))
(declare-fun arrayNoDuplicates!0 (array!44091 (_ BitVec 32) List!15078) Bool)

(assert (=> b!811539 (= res!554588 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15075))))

(declare-fun b!811541 () Bool)

(declare-fun res!554586 () Bool)

(assert (=> b!811541 (=> (not res!554586) (not e!449164))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!811541 (= res!554586 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21536 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21115 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21536 a!3170)) (= (select (arr!21115 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811542 () Bool)

(declare-fun res!554582 () Bool)

(declare-fun e!449161 () Bool)

(assert (=> b!811542 (=> (not res!554582) (not e!449161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811542 (= res!554582 (validKeyInArray!0 (select (arr!21115 a!3170) j!153)))))

(declare-fun b!811543 () Bool)

(declare-fun res!554591 () Bool)

(assert (=> b!811543 (=> (not res!554591) (not e!449161))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811543 (= res!554591 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811544 () Bool)

(assert (=> b!811544 (= e!449161 e!449164)))

(declare-fun res!554581 () Bool)

(assert (=> b!811544 (=> (not res!554581) (not e!449164))))

(declare-fun lt!363876 () SeekEntryResult!8706)

(assert (=> b!811544 (= res!554581 (or (= lt!363876 (MissingZero!8706 i!1163)) (= lt!363876 (MissingVacant!8706 i!1163))))))

(assert (=> b!811544 (= lt!363876 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811545 () Bool)

(declare-fun res!554589 () Bool)

(assert (=> b!811545 (=> (not res!554589) (not e!449164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44091 (_ BitVec 32)) Bool)

(assert (=> b!811545 (= res!554589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811546 () Bool)

(declare-fun res!554583 () Bool)

(assert (=> b!811546 (=> (not res!554583) (not e!449161))))

(assert (=> b!811546 (= res!554583 (validKeyInArray!0 k0!2044))))

(declare-fun b!811547 () Bool)

(assert (=> b!811547 (= e!449165 (not true))))

(declare-fun lt!363877 () (_ BitVec 32))

(declare-fun lt!363878 () (_ BitVec 64))

(declare-fun lt!363872 () array!44091)

(assert (=> b!811547 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363877 vacantAfter!23 lt!363878 lt!363872 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363877 vacantBefore!23 (select (arr!21115 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27674 0))(
  ( (Unit!27675) )
))
(declare-fun lt!363875 () Unit!27674)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44091 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27674)

(assert (=> b!811547 (= lt!363875 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363877 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811547 (= lt!363877 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811548 () Bool)

(assert (=> b!811548 (= e!449164 e!449162)))

(declare-fun res!554584 () Bool)

(assert (=> b!811548 (=> (not res!554584) (not e!449162))))

(assert (=> b!811548 (= res!554584 (= (seekEntryOrOpen!0 lt!363878 lt!363872 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363878 lt!363872 mask!3266)))))

(assert (=> b!811548 (= lt!363878 (select (store (arr!21115 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811548 (= lt!363872 (array!44092 (store (arr!21115 a!3170) i!1163 k0!2044) (size!21536 a!3170)))))

(declare-fun b!811540 () Bool)

(declare-fun res!554587 () Bool)

(assert (=> b!811540 (=> (not res!554587) (not e!449161))))

(assert (=> b!811540 (= res!554587 (and (= (size!21536 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21536 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21536 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!554585 () Bool)

(assert (=> start!69652 (=> (not res!554585) (not e!449161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69652 (= res!554585 (validMask!0 mask!3266))))

(assert (=> start!69652 e!449161))

(assert (=> start!69652 true))

(declare-fun array_inv!16911 (array!44091) Bool)

(assert (=> start!69652 (array_inv!16911 a!3170)))

(assert (= (and start!69652 res!554585) b!811540))

(assert (= (and b!811540 res!554587) b!811542))

(assert (= (and b!811542 res!554582) b!811546))

(assert (= (and b!811546 res!554583) b!811543))

(assert (= (and b!811543 res!554591) b!811544))

(assert (= (and b!811544 res!554581) b!811545))

(assert (= (and b!811545 res!554589) b!811539))

(assert (= (and b!811539 res!554588) b!811541))

(assert (= (and b!811541 res!554586) b!811548))

(assert (= (and b!811548 res!554584) b!811538))

(assert (= (and b!811538 res!554590) b!811547))

(declare-fun m!753919 () Bool)

(assert (=> b!811538 m!753919))

(declare-fun m!753921 () Bool)

(assert (=> b!811538 m!753921))

(assert (=> b!811538 m!753921))

(declare-fun m!753923 () Bool)

(assert (=> b!811538 m!753923))

(assert (=> b!811538 m!753921))

(declare-fun m!753925 () Bool)

(assert (=> b!811538 m!753925))

(declare-fun m!753927 () Bool)

(assert (=> b!811544 m!753927))

(assert (=> b!811547 m!753921))

(assert (=> b!811547 m!753921))

(declare-fun m!753929 () Bool)

(assert (=> b!811547 m!753929))

(declare-fun m!753931 () Bool)

(assert (=> b!811547 m!753931))

(declare-fun m!753933 () Bool)

(assert (=> b!811547 m!753933))

(declare-fun m!753935 () Bool)

(assert (=> b!811547 m!753935))

(declare-fun m!753937 () Bool)

(assert (=> b!811548 m!753937))

(declare-fun m!753939 () Bool)

(assert (=> b!811548 m!753939))

(declare-fun m!753941 () Bool)

(assert (=> b!811548 m!753941))

(declare-fun m!753943 () Bool)

(assert (=> b!811548 m!753943))

(declare-fun m!753945 () Bool)

(assert (=> b!811543 m!753945))

(assert (=> b!811542 m!753921))

(assert (=> b!811542 m!753921))

(declare-fun m!753947 () Bool)

(assert (=> b!811542 m!753947))

(declare-fun m!753949 () Bool)

(assert (=> b!811545 m!753949))

(declare-fun m!753951 () Bool)

(assert (=> b!811541 m!753951))

(declare-fun m!753953 () Bool)

(assert (=> b!811541 m!753953))

(declare-fun m!753955 () Bool)

(assert (=> b!811546 m!753955))

(declare-fun m!753957 () Bool)

(assert (=> start!69652 m!753957))

(declare-fun m!753959 () Bool)

(assert (=> start!69652 m!753959))

(declare-fun m!753961 () Bool)

(assert (=> b!811539 m!753961))

(check-sat (not b!811546) (not b!811539) (not b!811542) (not b!811547) (not b!811545) (not b!811544) (not b!811538) (not start!69652) (not b!811543) (not b!811548))
(check-sat)
