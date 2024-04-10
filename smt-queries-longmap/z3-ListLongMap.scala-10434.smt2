; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122768 () Bool)

(assert start!122768)

(declare-fun b!1423071 () Bool)

(declare-fun e!804416 () Bool)

(declare-fun e!804419 () Bool)

(assert (=> b!1423071 (= e!804416 e!804419)))

(declare-fun res!958510 () Bool)

(assert (=> b!1423071 (=> res!958510 e!804419)))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97133 0))(
  ( (array!97134 (arr!46884 (Array (_ BitVec 32) (_ BitVec 64))) (size!47434 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97133)

(declare-fun lt!626954 () (_ BitVec 32))

(assert (=> b!1423071 (= res!958510 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626954 #b00000000000000000000000000000000) (bvsge lt!626954 (size!47434 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423071 (= lt!626954 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!958504 () Bool)

(declare-fun e!804421 () Bool)

(assert (=> start!122768 (=> (not res!958504) (not e!804421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122768 (= res!958504 (validMask!0 mask!2608))))

(assert (=> start!122768 e!804421))

(assert (=> start!122768 true))

(declare-fun array_inv!35912 (array!97133) Bool)

(assert (=> start!122768 (array_inv!35912 a!2831)))

(declare-fun b!1423072 () Bool)

(declare-fun e!804420 () Bool)

(assert (=> b!1423072 (= e!804420 (not e!804416))))

(declare-fun res!958509 () Bool)

(assert (=> b!1423072 (=> res!958509 e!804416)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423072 (= res!958509 (or (= (select (arr!46884 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46884 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46884 a!2831) index!585) (select (arr!46884 a!2831) j!81)) (= (select (store (arr!46884 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804422 () Bool)

(assert (=> b!1423072 e!804422))

(declare-fun res!958514 () Bool)

(assert (=> b!1423072 (=> (not res!958514) (not e!804422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97133 (_ BitVec 32)) Bool)

(assert (=> b!1423072 (= res!958514 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48174 0))(
  ( (Unit!48175) )
))
(declare-fun lt!626953 () Unit!48174)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48174)

(assert (=> b!1423072 (= lt!626953 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423073 () Bool)

(declare-fun e!804417 () Bool)

(assert (=> b!1423073 (= e!804421 e!804417)))

(declare-fun res!958506 () Bool)

(assert (=> b!1423073 (=> (not res!958506) (not e!804417))))

(declare-datatypes ((SeekEntryResult!11169 0))(
  ( (MissingZero!11169 (index!47068 (_ BitVec 32))) (Found!11169 (index!47069 (_ BitVec 32))) (Intermediate!11169 (undefined!11981 Bool) (index!47070 (_ BitVec 32)) (x!128707 (_ BitVec 32))) (Undefined!11169) (MissingVacant!11169 (index!47071 (_ BitVec 32))) )
))
(declare-fun lt!626957 () SeekEntryResult!11169)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97133 (_ BitVec 32)) SeekEntryResult!11169)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423073 (= res!958506 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46884 a!2831) j!81) mask!2608) (select (arr!46884 a!2831) j!81) a!2831 mask!2608) lt!626957))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1423073 (= lt!626957 (Intermediate!11169 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423074 () Bool)

(declare-fun res!958518 () Bool)

(assert (=> b!1423074 (=> (not res!958518) (not e!804420))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423074 (= res!958518 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423075 () Bool)

(declare-fun res!958513 () Bool)

(assert (=> b!1423075 (=> (not res!958513) (not e!804421))))

(assert (=> b!1423075 (= res!958513 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47434 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47434 a!2831))))))

(declare-fun b!1423076 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97133 (_ BitVec 32)) SeekEntryResult!11169)

(assert (=> b!1423076 (= e!804422 (= (seekEntryOrOpen!0 (select (arr!46884 a!2831) j!81) a!2831 mask!2608) (Found!11169 j!81)))))

(declare-fun b!1423077 () Bool)

(assert (=> b!1423077 (= e!804417 e!804420)))

(declare-fun res!958516 () Bool)

(assert (=> b!1423077 (=> (not res!958516) (not e!804420))))

(declare-fun lt!626955 () (_ BitVec 64))

(declare-fun lt!626958 () SeekEntryResult!11169)

(declare-fun lt!626952 () array!97133)

(assert (=> b!1423077 (= res!958516 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626955 mask!2608) lt!626955 lt!626952 mask!2608) lt!626958))))

(assert (=> b!1423077 (= lt!626958 (Intermediate!11169 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423077 (= lt!626955 (select (store (arr!46884 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423077 (= lt!626952 (array!97134 (store (arr!46884 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47434 a!2831)))))

(declare-fun b!1423078 () Bool)

(declare-fun res!958519 () Bool)

(assert (=> b!1423078 (=> (not res!958519) (not e!804421))))

(assert (=> b!1423078 (= res!958519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423079 () Bool)

(declare-fun res!958512 () Bool)

(assert (=> b!1423079 (=> res!958512 e!804419)))

(assert (=> b!1423079 (= res!958512 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626954 (select (arr!46884 a!2831) j!81) a!2831 mask!2608) lt!626957)))))

(declare-fun b!1423080 () Bool)

(declare-fun res!958505 () Bool)

(assert (=> b!1423080 (=> (not res!958505) (not e!804421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423080 (= res!958505 (validKeyInArray!0 (select (arr!46884 a!2831) i!982)))))

(declare-fun b!1423081 () Bool)

(declare-fun res!958511 () Bool)

(assert (=> b!1423081 (=> (not res!958511) (not e!804421))))

(assert (=> b!1423081 (= res!958511 (and (= (size!47434 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47434 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47434 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423082 () Bool)

(declare-fun res!958515 () Bool)

(assert (=> b!1423082 (=> (not res!958515) (not e!804421))))

(declare-datatypes ((List!33394 0))(
  ( (Nil!33391) (Cons!33390 (h!34692 (_ BitVec 64)) (t!48088 List!33394)) )
))
(declare-fun arrayNoDuplicates!0 (array!97133 (_ BitVec 32) List!33394) Bool)

(assert (=> b!1423082 (= res!958515 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33391))))

(declare-fun b!1423083 () Bool)

(declare-fun res!958508 () Bool)

(assert (=> b!1423083 (=> (not res!958508) (not e!804420))))

(assert (=> b!1423083 (= res!958508 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46884 a!2831) j!81) a!2831 mask!2608) lt!626957))))

(declare-fun b!1423084 () Bool)

(assert (=> b!1423084 (= e!804419 true)))

(declare-fun lt!626956 () SeekEntryResult!11169)

(assert (=> b!1423084 (= lt!626956 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626954 lt!626955 lt!626952 mask!2608))))

(declare-fun b!1423085 () Bool)

(declare-fun res!958517 () Bool)

(assert (=> b!1423085 (=> (not res!958517) (not e!804420))))

(assert (=> b!1423085 (= res!958517 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626955 lt!626952 mask!2608) lt!626958))))

(declare-fun b!1423086 () Bool)

(declare-fun res!958507 () Bool)

(assert (=> b!1423086 (=> (not res!958507) (not e!804421))))

(assert (=> b!1423086 (= res!958507 (validKeyInArray!0 (select (arr!46884 a!2831) j!81)))))

(assert (= (and start!122768 res!958504) b!1423081))

(assert (= (and b!1423081 res!958511) b!1423080))

(assert (= (and b!1423080 res!958505) b!1423086))

(assert (= (and b!1423086 res!958507) b!1423078))

(assert (= (and b!1423078 res!958519) b!1423082))

(assert (= (and b!1423082 res!958515) b!1423075))

(assert (= (and b!1423075 res!958513) b!1423073))

(assert (= (and b!1423073 res!958506) b!1423077))

(assert (= (and b!1423077 res!958516) b!1423083))

(assert (= (and b!1423083 res!958508) b!1423085))

(assert (= (and b!1423085 res!958517) b!1423074))

(assert (= (and b!1423074 res!958518) b!1423072))

(assert (= (and b!1423072 res!958514) b!1423076))

(assert (= (and b!1423072 (not res!958509)) b!1423071))

(assert (= (and b!1423071 (not res!958510)) b!1423079))

(assert (= (and b!1423079 (not res!958512)) b!1423084))

(declare-fun m!1313619 () Bool)

(assert (=> b!1423072 m!1313619))

(declare-fun m!1313621 () Bool)

(assert (=> b!1423072 m!1313621))

(declare-fun m!1313623 () Bool)

(assert (=> b!1423072 m!1313623))

(declare-fun m!1313625 () Bool)

(assert (=> b!1423072 m!1313625))

(declare-fun m!1313627 () Bool)

(assert (=> b!1423072 m!1313627))

(declare-fun m!1313629 () Bool)

(assert (=> b!1423072 m!1313629))

(declare-fun m!1313631 () Bool)

(assert (=> b!1423084 m!1313631))

(declare-fun m!1313633 () Bool)

(assert (=> start!122768 m!1313633))

(declare-fun m!1313635 () Bool)

(assert (=> start!122768 m!1313635))

(assert (=> b!1423073 m!1313627))

(assert (=> b!1423073 m!1313627))

(declare-fun m!1313637 () Bool)

(assert (=> b!1423073 m!1313637))

(assert (=> b!1423073 m!1313637))

(assert (=> b!1423073 m!1313627))

(declare-fun m!1313639 () Bool)

(assert (=> b!1423073 m!1313639))

(assert (=> b!1423076 m!1313627))

(assert (=> b!1423076 m!1313627))

(declare-fun m!1313641 () Bool)

(assert (=> b!1423076 m!1313641))

(assert (=> b!1423083 m!1313627))

(assert (=> b!1423083 m!1313627))

(declare-fun m!1313643 () Bool)

(assert (=> b!1423083 m!1313643))

(declare-fun m!1313645 () Bool)

(assert (=> b!1423085 m!1313645))

(declare-fun m!1313647 () Bool)

(assert (=> b!1423078 m!1313647))

(assert (=> b!1423079 m!1313627))

(assert (=> b!1423079 m!1313627))

(declare-fun m!1313649 () Bool)

(assert (=> b!1423079 m!1313649))

(declare-fun m!1313651 () Bool)

(assert (=> b!1423082 m!1313651))

(assert (=> b!1423086 m!1313627))

(assert (=> b!1423086 m!1313627))

(declare-fun m!1313653 () Bool)

(assert (=> b!1423086 m!1313653))

(declare-fun m!1313655 () Bool)

(assert (=> b!1423071 m!1313655))

(declare-fun m!1313657 () Bool)

(assert (=> b!1423077 m!1313657))

(assert (=> b!1423077 m!1313657))

(declare-fun m!1313659 () Bool)

(assert (=> b!1423077 m!1313659))

(assert (=> b!1423077 m!1313619))

(declare-fun m!1313661 () Bool)

(assert (=> b!1423077 m!1313661))

(declare-fun m!1313663 () Bool)

(assert (=> b!1423080 m!1313663))

(assert (=> b!1423080 m!1313663))

(declare-fun m!1313665 () Bool)

(assert (=> b!1423080 m!1313665))

(check-sat (not b!1423083) (not b!1423082) (not b!1423078) (not b!1423076) (not b!1423085) (not b!1423086) (not b!1423077) (not b!1423079) (not b!1423071) (not b!1423072) (not b!1423080) (not b!1423084) (not start!122768) (not b!1423073))
(check-sat)
