; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122688 () Bool)

(assert start!122688)

(declare-fun b!1421323 () Bool)

(declare-fun res!956756 () Bool)

(declare-fun e!803699 () Bool)

(assert (=> b!1421323 (=> (not res!956756) (not e!803699))))

(declare-datatypes ((array!97053 0))(
  ( (array!97054 (arr!46844 (Array (_ BitVec 32) (_ BitVec 64))) (size!47394 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97053)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421323 (= res!956756 (validKeyInArray!0 (select (arr!46844 a!2831) i!982)))))

(declare-fun b!1421324 () Bool)

(declare-fun e!803697 () Bool)

(declare-fun e!803696 () Bool)

(assert (=> b!1421324 (= e!803697 e!803696)))

(declare-fun res!956764 () Bool)

(assert (=> b!1421324 (=> (not res!956764) (not e!803696))))

(declare-fun lt!626216 () array!97053)

(declare-fun lt!626220 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11129 0))(
  ( (MissingZero!11129 (index!46908 (_ BitVec 32))) (Found!11129 (index!46909 (_ BitVec 32))) (Intermediate!11129 (undefined!11941 Bool) (index!46910 (_ BitVec 32)) (x!128563 (_ BitVec 32))) (Undefined!11129) (MissingVacant!11129 (index!46911 (_ BitVec 32))) )
))
(declare-fun lt!626219 () SeekEntryResult!11129)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97053 (_ BitVec 32)) SeekEntryResult!11129)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421324 (= res!956764 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626220 mask!2608) lt!626220 lt!626216 mask!2608) lt!626219))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421324 (= lt!626219 (Intermediate!11129 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1421324 (= lt!626220 (select (store (arr!46844 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421324 (= lt!626216 (array!97054 (store (arr!46844 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47394 a!2831)))))

(declare-fun b!1421325 () Bool)

(declare-fun res!956765 () Bool)

(assert (=> b!1421325 (=> (not res!956765) (not e!803699))))

(declare-datatypes ((List!33354 0))(
  ( (Nil!33351) (Cons!33350 (h!34652 (_ BitVec 64)) (t!48048 List!33354)) )
))
(declare-fun arrayNoDuplicates!0 (array!97053 (_ BitVec 32) List!33354) Bool)

(assert (=> b!1421325 (= res!956765 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33351))))

(declare-fun b!1421326 () Bool)

(declare-fun res!956761 () Bool)

(assert (=> b!1421326 (=> (not res!956761) (not e!803699))))

(assert (=> b!1421326 (= res!956761 (validKeyInArray!0 (select (arr!46844 a!2831) j!81)))))

(declare-fun b!1421327 () Bool)

(declare-fun res!956758 () Bool)

(assert (=> b!1421327 (=> (not res!956758) (not e!803699))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1421327 (= res!956758 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47394 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47394 a!2831))))))

(declare-fun b!1421328 () Bool)

(declare-fun res!956759 () Bool)

(assert (=> b!1421328 (=> (not res!956759) (not e!803696))))

(assert (=> b!1421328 (= res!956759 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626220 lt!626216 mask!2608) lt!626219))))

(declare-fun b!1421329 () Bool)

(declare-fun res!956763 () Bool)

(assert (=> b!1421329 (=> (not res!956763) (not e!803696))))

(assert (=> b!1421329 (= res!956763 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421330 () Bool)

(declare-fun res!956757 () Bool)

(assert (=> b!1421330 (=> (not res!956757) (not e!803696))))

(declare-fun lt!626218 () SeekEntryResult!11129)

(assert (=> b!1421330 (= res!956757 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46844 a!2831) j!81) a!2831 mask!2608) lt!626218))))

(declare-fun b!1421331 () Bool)

(assert (=> b!1421331 (= e!803699 e!803697)))

(declare-fun res!956760 () Bool)

(assert (=> b!1421331 (=> (not res!956760) (not e!803697))))

(assert (=> b!1421331 (= res!956760 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46844 a!2831) j!81) mask!2608) (select (arr!46844 a!2831) j!81) a!2831 mask!2608) lt!626218))))

(assert (=> b!1421331 (= lt!626218 (Intermediate!11129 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421332 () Bool)

(assert (=> b!1421332 (= e!803696 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97053 (_ BitVec 32)) Bool)

(assert (=> b!1421332 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48094 0))(
  ( (Unit!48095) )
))
(declare-fun lt!626217 () Unit!48094)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97053 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48094)

(assert (=> b!1421332 (= lt!626217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421333 () Bool)

(declare-fun res!956766 () Bool)

(assert (=> b!1421333 (=> (not res!956766) (not e!803699))))

(assert (=> b!1421333 (= res!956766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!956767 () Bool)

(assert (=> start!122688 (=> (not res!956767) (not e!803699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122688 (= res!956767 (validMask!0 mask!2608))))

(assert (=> start!122688 e!803699))

(assert (=> start!122688 true))

(declare-fun array_inv!35872 (array!97053) Bool)

(assert (=> start!122688 (array_inv!35872 a!2831)))

(declare-fun b!1421334 () Bool)

(declare-fun res!956762 () Bool)

(assert (=> b!1421334 (=> (not res!956762) (not e!803699))))

(assert (=> b!1421334 (= res!956762 (and (= (size!47394 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47394 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47394 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122688 res!956767) b!1421334))

(assert (= (and b!1421334 res!956762) b!1421323))

(assert (= (and b!1421323 res!956756) b!1421326))

(assert (= (and b!1421326 res!956761) b!1421333))

(assert (= (and b!1421333 res!956766) b!1421325))

(assert (= (and b!1421325 res!956765) b!1421327))

(assert (= (and b!1421327 res!956758) b!1421331))

(assert (= (and b!1421331 res!956760) b!1421324))

(assert (= (and b!1421324 res!956764) b!1421330))

(assert (= (and b!1421330 res!956757) b!1421328))

(assert (= (and b!1421328 res!956759) b!1421329))

(assert (= (and b!1421329 res!956763) b!1421332))

(declare-fun m!1311867 () Bool)

(assert (=> b!1421333 m!1311867))

(declare-fun m!1311869 () Bool)

(assert (=> b!1421330 m!1311869))

(assert (=> b!1421330 m!1311869))

(declare-fun m!1311871 () Bool)

(assert (=> b!1421330 m!1311871))

(declare-fun m!1311873 () Bool)

(assert (=> b!1421324 m!1311873))

(assert (=> b!1421324 m!1311873))

(declare-fun m!1311875 () Bool)

(assert (=> b!1421324 m!1311875))

(declare-fun m!1311877 () Bool)

(assert (=> b!1421324 m!1311877))

(declare-fun m!1311879 () Bool)

(assert (=> b!1421324 m!1311879))

(assert (=> b!1421326 m!1311869))

(assert (=> b!1421326 m!1311869))

(declare-fun m!1311881 () Bool)

(assert (=> b!1421326 m!1311881))

(declare-fun m!1311883 () Bool)

(assert (=> b!1421325 m!1311883))

(declare-fun m!1311885 () Bool)

(assert (=> start!122688 m!1311885))

(declare-fun m!1311887 () Bool)

(assert (=> start!122688 m!1311887))

(declare-fun m!1311889 () Bool)

(assert (=> b!1421323 m!1311889))

(assert (=> b!1421323 m!1311889))

(declare-fun m!1311891 () Bool)

(assert (=> b!1421323 m!1311891))

(declare-fun m!1311893 () Bool)

(assert (=> b!1421332 m!1311893))

(declare-fun m!1311895 () Bool)

(assert (=> b!1421332 m!1311895))

(assert (=> b!1421331 m!1311869))

(assert (=> b!1421331 m!1311869))

(declare-fun m!1311897 () Bool)

(assert (=> b!1421331 m!1311897))

(assert (=> b!1421331 m!1311897))

(assert (=> b!1421331 m!1311869))

(declare-fun m!1311899 () Bool)

(assert (=> b!1421331 m!1311899))

(declare-fun m!1311901 () Bool)

(assert (=> b!1421328 m!1311901))

(push 1)

