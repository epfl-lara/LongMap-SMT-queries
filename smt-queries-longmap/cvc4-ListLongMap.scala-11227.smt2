; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130998 () Bool)

(assert start!130998)

(declare-fun b!1536901 () Bool)

(declare-fun e!855393 () Bool)

(declare-fun e!855397 () Bool)

(assert (=> b!1536901 (= e!855393 e!855397)))

(declare-fun res!1053996 () Bool)

(assert (=> b!1536901 (=> (not res!1053996) (not e!855397))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102096 0))(
  ( (array!102097 (arr!49264 (Array (_ BitVec 32) (_ BitVec 64))) (size!49814 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102096)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13396 0))(
  ( (MissingZero!13396 (index!55979 (_ BitVec 32))) (Found!13396 (index!55980 (_ BitVec 32))) (Intermediate!13396 (undefined!14208 Bool) (index!55981 (_ BitVec 32)) (x!137710 (_ BitVec 32))) (Undefined!13396) (MissingVacant!13396 (index!55982 (_ BitVec 32))) )
))
(declare-fun lt!664522 () SeekEntryResult!13396)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102096 (_ BitVec 32)) SeekEntryResult!13396)

(assert (=> b!1536901 (= res!1053996 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49264 a!2792) j!64) a!2792 mask!2480) lt!664522))))

(assert (=> b!1536901 (= lt!664522 (Found!13396 j!64))))

(declare-fun b!1536902 () Bool)

(declare-fun res!1053994 () Bool)

(assert (=> b!1536902 (=> (not res!1053994) (not e!855393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102096 (_ BitVec 32)) Bool)

(assert (=> b!1536902 (= res!1053994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536903 () Bool)

(declare-fun res!1053995 () Bool)

(assert (=> b!1536903 (=> (not res!1053995) (not e!855393))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536903 (= res!1053995 (validKeyInArray!0 (select (arr!49264 a!2792) i!951)))))

(declare-fun b!1536904 () Bool)

(declare-fun res!1053997 () Bool)

(assert (=> b!1536904 (=> (not res!1053997) (not e!855393))))

(assert (=> b!1536904 (= res!1053997 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49814 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49814 a!2792)) (= (select (arr!49264 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536905 () Bool)

(declare-fun res!1053987 () Bool)

(assert (=> b!1536905 (=> (not res!1053987) (not e!855393))))

(assert (=> b!1536905 (= res!1053987 (and (= (size!49814 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49814 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49814 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536906 () Bool)

(declare-fun res!1053992 () Bool)

(assert (=> b!1536906 (=> (not res!1053992) (not e!855397))))

(assert (=> b!1536906 (= res!1053992 (not (= (select (arr!49264 a!2792) index!463) (select (arr!49264 a!2792) j!64))))))

(declare-fun b!1536907 () Bool)

(declare-fun res!1053990 () Bool)

(assert (=> b!1536907 (=> (not res!1053990) (not e!855393))))

(assert (=> b!1536907 (= res!1053990 (validKeyInArray!0 (select (arr!49264 a!2792) j!64)))))

(declare-fun res!1053989 () Bool)

(assert (=> start!130998 (=> (not res!1053989) (not e!855393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130998 (= res!1053989 (validMask!0 mask!2480))))

(assert (=> start!130998 e!855393))

(assert (=> start!130998 true))

(declare-fun array_inv!38292 (array!102096) Bool)

(assert (=> start!130998 (array_inv!38292 a!2792)))

(declare-fun b!1536908 () Bool)

(declare-fun e!855394 () Bool)

(assert (=> b!1536908 (= e!855397 e!855394)))

(declare-fun res!1053993 () Bool)

(assert (=> b!1536908 (=> (not res!1053993) (not e!855394))))

(declare-fun lt!664519 () (_ BitVec 32))

(assert (=> b!1536908 (= res!1053993 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664519 #b00000000000000000000000000000000) (bvslt lt!664519 (size!49814 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536908 (= lt!664519 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536909 () Bool)

(declare-fun res!1053991 () Bool)

(assert (=> b!1536909 (=> (not res!1053991) (not e!855393))))

(declare-datatypes ((List!35738 0))(
  ( (Nil!35735) (Cons!35734 (h!37179 (_ BitVec 64)) (t!50432 List!35738)) )
))
(declare-fun arrayNoDuplicates!0 (array!102096 (_ BitVec 32) List!35738) Bool)

(assert (=> b!1536909 (= res!1053991 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35735))))

(declare-fun b!1536910 () Bool)

(declare-fun e!855396 () Bool)

(assert (=> b!1536910 (= e!855394 e!855396)))

(declare-fun res!1053988 () Bool)

(assert (=> b!1536910 (=> (not res!1053988) (not e!855396))))

(declare-fun lt!664520 () SeekEntryResult!13396)

(assert (=> b!1536910 (= res!1053988 (= lt!664520 lt!664522))))

(assert (=> b!1536910 (= lt!664520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664519 vacantIndex!5 (select (arr!49264 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536911 () Bool)

(assert (=> b!1536911 (= e!855396 (not (bvsge mask!2480 #b00000000000000000000000000000000)))))

(assert (=> b!1536911 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664519 vacantIndex!5 (select (store (arr!49264 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102097 (store (arr!49264 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49814 a!2792)) mask!2480) lt!664520)))

(declare-datatypes ((Unit!51364 0))(
  ( (Unit!51365) )
))
(declare-fun lt!664521 () Unit!51364)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51364)

(assert (=> b!1536911 (= lt!664521 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664519 vacantIndex!5 mask!2480))))

(assert (= (and start!130998 res!1053989) b!1536905))

(assert (= (and b!1536905 res!1053987) b!1536903))

(assert (= (and b!1536903 res!1053995) b!1536907))

(assert (= (and b!1536907 res!1053990) b!1536902))

(assert (= (and b!1536902 res!1053994) b!1536909))

(assert (= (and b!1536909 res!1053991) b!1536904))

(assert (= (and b!1536904 res!1053997) b!1536901))

(assert (= (and b!1536901 res!1053996) b!1536906))

(assert (= (and b!1536906 res!1053992) b!1536908))

(assert (= (and b!1536908 res!1053993) b!1536910))

(assert (= (and b!1536910 res!1053988) b!1536911))

(declare-fun m!1419389 () Bool)

(assert (=> b!1536910 m!1419389))

(assert (=> b!1536910 m!1419389))

(declare-fun m!1419391 () Bool)

(assert (=> b!1536910 m!1419391))

(assert (=> b!1536907 m!1419389))

(assert (=> b!1536907 m!1419389))

(declare-fun m!1419393 () Bool)

(assert (=> b!1536907 m!1419393))

(declare-fun m!1419395 () Bool)

(assert (=> b!1536903 m!1419395))

(assert (=> b!1536903 m!1419395))

(declare-fun m!1419397 () Bool)

(assert (=> b!1536903 m!1419397))

(declare-fun m!1419399 () Bool)

(assert (=> b!1536908 m!1419399))

(declare-fun m!1419401 () Bool)

(assert (=> b!1536904 m!1419401))

(declare-fun m!1419403 () Bool)

(assert (=> start!130998 m!1419403))

(declare-fun m!1419405 () Bool)

(assert (=> start!130998 m!1419405))

(assert (=> b!1536901 m!1419389))

(assert (=> b!1536901 m!1419389))

(declare-fun m!1419407 () Bool)

(assert (=> b!1536901 m!1419407))

(declare-fun m!1419409 () Bool)

(assert (=> b!1536902 m!1419409))

(declare-fun m!1419411 () Bool)

(assert (=> b!1536906 m!1419411))

(assert (=> b!1536906 m!1419389))

(declare-fun m!1419413 () Bool)

(assert (=> b!1536909 m!1419413))

(declare-fun m!1419415 () Bool)

(assert (=> b!1536911 m!1419415))

(declare-fun m!1419417 () Bool)

(assert (=> b!1536911 m!1419417))

(assert (=> b!1536911 m!1419417))

(declare-fun m!1419419 () Bool)

(assert (=> b!1536911 m!1419419))

(declare-fun m!1419421 () Bool)

(assert (=> b!1536911 m!1419421))

(push 1)

(assert (not b!1536907))

(assert (not b!1536909))

(assert (not start!130998))

(assert (not b!1536908))

(assert (not b!1536901))

