; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68914 () Bool)

(assert start!68914)

(declare-fun b!803848 () Bool)

(declare-fun e!445395 () Bool)

(declare-fun e!445396 () Bool)

(assert (=> b!803848 (= e!445395 e!445396)))

(declare-fun res!548369 () Bool)

(assert (=> b!803848 (=> (not res!548369) (not e!445396))))

(declare-datatypes ((SeekEntryResult!8523 0))(
  ( (MissingZero!8523 (index!36460 (_ BitVec 32))) (Found!8523 (index!36461 (_ BitVec 32))) (Intermediate!8523 (undefined!9335 Bool) (index!36462 (_ BitVec 32)) (x!67297 (_ BitVec 32))) (Undefined!8523) (MissingVacant!8523 (index!36463 (_ BitVec 32))) )
))
(declare-fun lt!359900 () SeekEntryResult!8523)

(declare-fun lt!359906 () SeekEntryResult!8523)

(declare-datatypes ((array!43704 0))(
  ( (array!43705 (arr!20932 (Array (_ BitVec 32) (_ BitVec 64))) (size!21353 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43704)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803848 (= res!548369 (and (= lt!359900 lt!359906) (not (= (select (arr!20932 a!3170) index!1236) (select (arr!20932 a!3170) j!153)))))))

(assert (=> b!803848 (= lt!359906 (Found!8523 j!153))))

(declare-fun b!803849 () Bool)

(declare-fun res!548376 () Bool)

(declare-fun e!445398 () Bool)

(assert (=> b!803849 (=> (not res!548376) (not e!445398))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803849 (= res!548376 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803850 () Bool)

(declare-fun res!548373 () Bool)

(declare-fun e!445399 () Bool)

(assert (=> b!803850 (=> (not res!548373) (not e!445399))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43704 (_ BitVec 32)) Bool)

(assert (=> b!803850 (= res!548373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803851 () Bool)

(declare-fun e!445400 () Bool)

(assert (=> b!803851 (= e!445400 e!445395)))

(declare-fun res!548378 () Bool)

(assert (=> b!803851 (=> (not res!548378) (not e!445395))))

(declare-fun lt!359903 () SeekEntryResult!8523)

(assert (=> b!803851 (= res!548378 (= lt!359903 lt!359900))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43704 (_ BitVec 32)) SeekEntryResult!8523)

(assert (=> b!803851 (= lt!359900 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20932 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43704 (_ BitVec 32)) SeekEntryResult!8523)

(assert (=> b!803851 (= lt!359903 (seekEntryOrOpen!0 (select (arr!20932 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803852 () Bool)

(assert (=> b!803852 (= e!445398 e!445399)))

(declare-fun res!548375 () Bool)

(assert (=> b!803852 (=> (not res!548375) (not e!445399))))

(declare-fun lt!359909 () SeekEntryResult!8523)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803852 (= res!548375 (or (= lt!359909 (MissingZero!8523 i!1163)) (= lt!359909 (MissingVacant!8523 i!1163))))))

(assert (=> b!803852 (= lt!359909 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803853 () Bool)

(declare-fun res!548372 () Bool)

(assert (=> b!803853 (=> (not res!548372) (not e!445398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803853 (= res!548372 (validKeyInArray!0 k0!2044))))

(declare-fun b!803854 () Bool)

(declare-fun res!548377 () Bool)

(assert (=> b!803854 (=> (not res!548377) (not e!445399))))

(declare-datatypes ((List!14895 0))(
  ( (Nil!14892) (Cons!14891 (h!16020 (_ BitVec 64)) (t!21210 List!14895)) )
))
(declare-fun arrayNoDuplicates!0 (array!43704 (_ BitVec 32) List!14895) Bool)

(assert (=> b!803854 (= res!548377 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14892))))

(declare-fun b!803855 () Bool)

(declare-fun res!548374 () Bool)

(assert (=> b!803855 (=> (not res!548374) (not e!445399))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!803855 (= res!548374 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21353 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20932 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21353 a!3170)) (= (select (arr!20932 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803856 () Bool)

(declare-fun res!548367 () Bool)

(assert (=> b!803856 (=> (not res!548367) (not e!445398))))

(assert (=> b!803856 (= res!548367 (validKeyInArray!0 (select (arr!20932 a!3170) j!153)))))

(declare-fun b!803857 () Bool)

(declare-fun res!548368 () Bool)

(assert (=> b!803857 (=> (not res!548368) (not e!445398))))

(assert (=> b!803857 (= res!548368 (and (= (size!21353 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21353 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21353 a!3170)) (not (= i!1163 j!153))))))

(declare-fun lt!359907 () SeekEntryResult!8523)

(declare-fun b!803858 () Bool)

(assert (=> b!803858 (= e!445396 (not (or (not (= lt!359907 lt!359906)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (and (bvsge vacantBefore!23 #b00000000000000000000000000000000) (bvslt vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))))

(declare-fun lt!359905 () (_ BitVec 64))

(declare-fun lt!359904 () (_ BitVec 32))

(declare-fun lt!359908 () array!43704)

(assert (=> b!803858 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359904 vacantAfter!23 lt!359905 lt!359908 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359904 vacantBefore!23 (select (arr!20932 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27586 0))(
  ( (Unit!27587) )
))
(declare-fun lt!359902 () Unit!27586)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43704 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27586)

(assert (=> b!803858 (= lt!359902 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359904 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803858 (= lt!359904 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803859 () Bool)

(assert (=> b!803859 (= e!445399 e!445400)))

(declare-fun res!548371 () Bool)

(assert (=> b!803859 (=> (not res!548371) (not e!445400))))

(declare-fun lt!359901 () SeekEntryResult!8523)

(assert (=> b!803859 (= res!548371 (= lt!359901 lt!359907))))

(assert (=> b!803859 (= lt!359907 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359905 lt!359908 mask!3266))))

(assert (=> b!803859 (= lt!359901 (seekEntryOrOpen!0 lt!359905 lt!359908 mask!3266))))

(assert (=> b!803859 (= lt!359905 (select (store (arr!20932 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803859 (= lt!359908 (array!43705 (store (arr!20932 a!3170) i!1163 k0!2044) (size!21353 a!3170)))))

(declare-fun res!548370 () Bool)

(assert (=> start!68914 (=> (not res!548370) (not e!445398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68914 (= res!548370 (validMask!0 mask!3266))))

(assert (=> start!68914 e!445398))

(assert (=> start!68914 true))

(declare-fun array_inv!16728 (array!43704) Bool)

(assert (=> start!68914 (array_inv!16728 a!3170)))

(assert (= (and start!68914 res!548370) b!803857))

(assert (= (and b!803857 res!548368) b!803856))

(assert (= (and b!803856 res!548367) b!803853))

(assert (= (and b!803853 res!548372) b!803849))

(assert (= (and b!803849 res!548376) b!803852))

(assert (= (and b!803852 res!548375) b!803850))

(assert (= (and b!803850 res!548373) b!803854))

(assert (= (and b!803854 res!548377) b!803855))

(assert (= (and b!803855 res!548374) b!803859))

(assert (= (and b!803859 res!548371) b!803851))

(assert (= (and b!803851 res!548378) b!803848))

(assert (= (and b!803848 res!548369) b!803858))

(declare-fun m!745687 () Bool)

(assert (=> start!68914 m!745687))

(declare-fun m!745689 () Bool)

(assert (=> start!68914 m!745689))

(declare-fun m!745691 () Bool)

(assert (=> b!803854 m!745691))

(declare-fun m!745693 () Bool)

(assert (=> b!803858 m!745693))

(declare-fun m!745695 () Bool)

(assert (=> b!803858 m!745695))

(declare-fun m!745697 () Bool)

(assert (=> b!803858 m!745697))

(declare-fun m!745699 () Bool)

(assert (=> b!803858 m!745699))

(declare-fun m!745701 () Bool)

(assert (=> b!803858 m!745701))

(assert (=> b!803858 m!745699))

(declare-fun m!745703 () Bool)

(assert (=> b!803859 m!745703))

(declare-fun m!745705 () Bool)

(assert (=> b!803859 m!745705))

(declare-fun m!745707 () Bool)

(assert (=> b!803859 m!745707))

(declare-fun m!745709 () Bool)

(assert (=> b!803859 m!745709))

(assert (=> b!803851 m!745699))

(assert (=> b!803851 m!745699))

(declare-fun m!745711 () Bool)

(assert (=> b!803851 m!745711))

(assert (=> b!803851 m!745699))

(declare-fun m!745713 () Bool)

(assert (=> b!803851 m!745713))

(assert (=> b!803856 m!745699))

(assert (=> b!803856 m!745699))

(declare-fun m!745715 () Bool)

(assert (=> b!803856 m!745715))

(declare-fun m!745717 () Bool)

(assert (=> b!803855 m!745717))

(declare-fun m!745719 () Bool)

(assert (=> b!803855 m!745719))

(declare-fun m!745721 () Bool)

(assert (=> b!803849 m!745721))

(declare-fun m!745723 () Bool)

(assert (=> b!803850 m!745723))

(declare-fun m!745725 () Bool)

(assert (=> b!803852 m!745725))

(declare-fun m!745727 () Bool)

(assert (=> b!803848 m!745727))

(assert (=> b!803848 m!745699))

(declare-fun m!745729 () Bool)

(assert (=> b!803853 m!745729))

(check-sat (not b!803854) (not start!68914) (not b!803851) (not b!803849) (not b!803853) (not b!803856) (not b!803858) (not b!803859) (not b!803852) (not b!803850))
(check-sat)
