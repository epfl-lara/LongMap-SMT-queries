; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69562 () Bool)

(assert start!69562)

(declare-fun b!810728 () Bool)

(declare-fun res!554008 () Bool)

(declare-fun e!448740 () Bool)

(assert (=> b!810728 (=> (not res!554008) (not e!448740))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44058 0))(
  ( (array!44059 (arr!21100 (Array (_ BitVec 32) (_ BitVec 64))) (size!21521 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44058)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810728 (= res!554008 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21521 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21100 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21521 a!3170)) (= (select (arr!21100 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810729 () Bool)

(declare-fun res!554013 () Bool)

(declare-fun e!448741 () Bool)

(assert (=> b!810729 (=> (not res!554013) (not e!448741))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!810729 (= res!554013 (and (= (size!21521 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21521 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21521 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810730 () Bool)

(assert (=> b!810730 (= e!448741 e!448740)))

(declare-fun res!554012 () Bool)

(assert (=> b!810730 (=> (not res!554012) (not e!448740))))

(declare-datatypes ((SeekEntryResult!8691 0))(
  ( (MissingZero!8691 (index!37132 (_ BitVec 32))) (Found!8691 (index!37133 (_ BitVec 32))) (Intermediate!8691 (undefined!9503 Bool) (index!37134 (_ BitVec 32)) (x!67943 (_ BitVec 32))) (Undefined!8691) (MissingVacant!8691 (index!37135 (_ BitVec 32))) )
))
(declare-fun lt!363405 () SeekEntryResult!8691)

(assert (=> b!810730 (= res!554012 (or (= lt!363405 (MissingZero!8691 i!1163)) (= lt!363405 (MissingVacant!8691 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44058 (_ BitVec 32)) SeekEntryResult!8691)

(assert (=> b!810730 (= lt!363405 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810731 () Bool)

(declare-fun res!554011 () Bool)

(assert (=> b!810731 (=> (not res!554011) (not e!448740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44058 (_ BitVec 32)) Bool)

(assert (=> b!810731 (= res!554011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!554015 () Bool)

(assert (=> start!69562 (=> (not res!554015) (not e!448741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69562 (= res!554015 (validMask!0 mask!3266))))

(assert (=> start!69562 e!448741))

(assert (=> start!69562 true))

(declare-fun array_inv!16896 (array!44058) Bool)

(assert (=> start!69562 (array_inv!16896 a!3170)))

(declare-fun b!810732 () Bool)

(declare-fun e!448742 () Bool)

(assert (=> b!810732 (= e!448740 e!448742)))

(declare-fun res!554010 () Bool)

(assert (=> b!810732 (=> (not res!554010) (not e!448742))))

(declare-fun lt!363407 () (_ BitVec 64))

(declare-fun lt!363409 () array!44058)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44058 (_ BitVec 32)) SeekEntryResult!8691)

(assert (=> b!810732 (= res!554010 (= (seekEntryOrOpen!0 lt!363407 lt!363409 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363407 lt!363409 mask!3266)))))

(assert (=> b!810732 (= lt!363407 (select (store (arr!21100 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810732 (= lt!363409 (array!44059 (store (arr!21100 a!3170) i!1163 k0!2044) (size!21521 a!3170)))))

(declare-fun b!810733 () Bool)

(declare-fun e!448738 () Bool)

(assert (=> b!810733 (= e!448738 (not true))))

(declare-fun lt!363404 () (_ BitVec 32))

(assert (=> b!810733 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363404 vacantAfter!23 lt!363407 lt!363409 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363404 vacantBefore!23 (select (arr!21100 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27644 0))(
  ( (Unit!27645) )
))
(declare-fun lt!363408 () Unit!27644)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44058 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27644)

(assert (=> b!810733 (= lt!363408 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363404 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810733 (= lt!363404 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810734 () Bool)

(declare-fun res!554005 () Bool)

(assert (=> b!810734 (=> (not res!554005) (not e!448741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810734 (= res!554005 (validKeyInArray!0 k0!2044))))

(declare-fun b!810735 () Bool)

(declare-fun res!554007 () Bool)

(assert (=> b!810735 (=> (not res!554007) (not e!448740))))

(declare-datatypes ((List!15063 0))(
  ( (Nil!15060) (Cons!15059 (h!16188 (_ BitVec 64)) (t!21378 List!15063)) )
))
(declare-fun arrayNoDuplicates!0 (array!44058 (_ BitVec 32) List!15063) Bool)

(assert (=> b!810735 (= res!554007 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15060))))

(declare-fun b!810736 () Bool)

(declare-fun res!554014 () Bool)

(assert (=> b!810736 (=> (not res!554014) (not e!448741))))

(assert (=> b!810736 (= res!554014 (validKeyInArray!0 (select (arr!21100 a!3170) j!153)))))

(declare-fun b!810737 () Bool)

(declare-fun res!554006 () Bool)

(assert (=> b!810737 (=> (not res!554006) (not e!448741))))

(declare-fun arrayContainsKey!0 (array!44058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810737 (= res!554006 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810738 () Bool)

(assert (=> b!810738 (= e!448742 e!448738)))

(declare-fun res!554009 () Bool)

(assert (=> b!810738 (=> (not res!554009) (not e!448738))))

(declare-fun lt!363406 () SeekEntryResult!8691)

(declare-fun lt!363410 () SeekEntryResult!8691)

(assert (=> b!810738 (= res!554009 (and (= lt!363406 lt!363410) (= lt!363410 (Found!8691 j!153)) (not (= (select (arr!21100 a!3170) index!1236) (select (arr!21100 a!3170) j!153)))))))

(assert (=> b!810738 (= lt!363410 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21100 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810738 (= lt!363406 (seekEntryOrOpen!0 (select (arr!21100 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69562 res!554015) b!810729))

(assert (= (and b!810729 res!554013) b!810736))

(assert (= (and b!810736 res!554014) b!810734))

(assert (= (and b!810734 res!554005) b!810737))

(assert (= (and b!810737 res!554006) b!810730))

(assert (= (and b!810730 res!554012) b!810731))

(assert (= (and b!810731 res!554011) b!810735))

(assert (= (and b!810735 res!554007) b!810728))

(assert (= (and b!810728 res!554008) b!810732))

(assert (= (and b!810732 res!554010) b!810738))

(assert (= (and b!810738 res!554009) b!810733))

(declare-fun m!752965 () Bool)

(assert (=> b!810737 m!752965))

(declare-fun m!752967 () Bool)

(assert (=> b!810738 m!752967))

(declare-fun m!752969 () Bool)

(assert (=> b!810738 m!752969))

(assert (=> b!810738 m!752969))

(declare-fun m!752971 () Bool)

(assert (=> b!810738 m!752971))

(assert (=> b!810738 m!752969))

(declare-fun m!752973 () Bool)

(assert (=> b!810738 m!752973))

(declare-fun m!752975 () Bool)

(assert (=> start!69562 m!752975))

(declare-fun m!752977 () Bool)

(assert (=> start!69562 m!752977))

(declare-fun m!752979 () Bool)

(assert (=> b!810732 m!752979))

(declare-fun m!752981 () Bool)

(assert (=> b!810732 m!752981))

(declare-fun m!752983 () Bool)

(assert (=> b!810732 m!752983))

(declare-fun m!752985 () Bool)

(assert (=> b!810732 m!752985))

(declare-fun m!752987 () Bool)

(assert (=> b!810731 m!752987))

(declare-fun m!752989 () Bool)

(assert (=> b!810730 m!752989))

(declare-fun m!752991 () Bool)

(assert (=> b!810735 m!752991))

(declare-fun m!752993 () Bool)

(assert (=> b!810734 m!752993))

(declare-fun m!752995 () Bool)

(assert (=> b!810728 m!752995))

(declare-fun m!752997 () Bool)

(assert (=> b!810728 m!752997))

(assert (=> b!810736 m!752969))

(assert (=> b!810736 m!752969))

(declare-fun m!752999 () Bool)

(assert (=> b!810736 m!752999))

(assert (=> b!810733 m!752969))

(assert (=> b!810733 m!752969))

(declare-fun m!753001 () Bool)

(assert (=> b!810733 m!753001))

(declare-fun m!753003 () Bool)

(assert (=> b!810733 m!753003))

(declare-fun m!753005 () Bool)

(assert (=> b!810733 m!753005))

(declare-fun m!753007 () Bool)

(assert (=> b!810733 m!753007))

(check-sat (not b!810732) (not start!69562) (not b!810733) (not b!810735) (not b!810734) (not b!810730) (not b!810737) (not b!810738) (not b!810736) (not b!810731))
(check-sat)
