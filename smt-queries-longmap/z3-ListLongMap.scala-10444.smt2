; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123068 () Bool)

(assert start!123068)

(declare-fun res!960470 () Bool)

(declare-fun e!805952 () Bool)

(assert (=> start!123068 (=> (not res!960470) (not e!805952))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123068 (= res!960470 (validMask!0 mask!2608))))

(assert (=> start!123068 e!805952))

(assert (=> start!123068 true))

(declare-datatypes ((array!97304 0))(
  ( (array!97305 (arr!46966 (Array (_ BitVec 32) (_ BitVec 64))) (size!47517 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97304)

(declare-fun array_inv!36247 (array!97304) Bool)

(assert (=> start!123068 (array_inv!36247 a!2831)))

(declare-fun b!1425912 () Bool)

(declare-fun res!960468 () Bool)

(assert (=> b!1425912 (=> (not res!960468) (not e!805952))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425912 (= res!960468 (validKeyInArray!0 (select (arr!46966 a!2831) j!81)))))

(declare-fun b!1425913 () Bool)

(declare-fun e!805954 () Bool)

(declare-fun e!805956 () Bool)

(assert (=> b!1425913 (= e!805954 e!805956)))

(declare-fun res!960467 () Bool)

(assert (=> b!1425913 (=> (not res!960467) (not e!805956))))

(declare-datatypes ((SeekEntryResult!11153 0))(
  ( (MissingZero!11153 (index!47004 (_ BitVec 32))) (Found!11153 (index!47005 (_ BitVec 32))) (Intermediate!11153 (undefined!11965 Bool) (index!47006 (_ BitVec 32)) (x!128796 (_ BitVec 32))) (Undefined!11153) (MissingVacant!11153 (index!47007 (_ BitVec 32))) )
))
(declare-fun lt!628096 () SeekEntryResult!11153)

(declare-fun lt!628093 () (_ BitVec 64))

(declare-fun lt!628097 () array!97304)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97304 (_ BitVec 32)) SeekEntryResult!11153)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425913 (= res!960467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628093 mask!2608) lt!628093 lt!628097 mask!2608) lt!628096))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425913 (= lt!628096 (Intermediate!11153 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425913 (= lt!628093 (select (store (arr!46966 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425913 (= lt!628097 (array!97305 (store (arr!46966 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47517 a!2831)))))

(declare-fun b!1425914 () Bool)

(declare-fun res!960463 () Bool)

(assert (=> b!1425914 (=> (not res!960463) (not e!805952))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1425914 (= res!960463 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47517 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47517 a!2831))))))

(declare-fun b!1425915 () Bool)

(declare-fun res!960466 () Bool)

(assert (=> b!1425915 (=> (not res!960466) (not e!805956))))

(assert (=> b!1425915 (= res!960466 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628093 lt!628097 mask!2608) lt!628096))))

(declare-fun b!1425916 () Bool)

(declare-fun e!805958 () Bool)

(assert (=> b!1425916 (= e!805958 true)))

(declare-fun lt!628094 () SeekEntryResult!11153)

(declare-fun lt!628095 () (_ BitVec 32))

(assert (=> b!1425916 (= lt!628094 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!628095 lt!628093 lt!628097 mask!2608))))

(declare-fun b!1425917 () Bool)

(declare-fun res!960471 () Bool)

(assert (=> b!1425917 (=> (not res!960471) (not e!805952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97304 (_ BitVec 32)) Bool)

(assert (=> b!1425917 (= res!960471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425918 () Bool)

(declare-fun res!960472 () Bool)

(assert (=> b!1425918 (=> (not res!960472) (not e!805952))))

(assert (=> b!1425918 (= res!960472 (and (= (size!47517 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47517 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47517 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425919 () Bool)

(declare-fun e!805955 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97304 (_ BitVec 32)) SeekEntryResult!11153)

(assert (=> b!1425919 (= e!805955 (= (seekEntryOrOpen!0 (select (arr!46966 a!2831) j!81) a!2831 mask!2608) (Found!11153 j!81)))))

(declare-fun b!1425920 () Bool)

(declare-fun res!960465 () Bool)

(assert (=> b!1425920 (=> res!960465 e!805958)))

(declare-fun lt!628092 () SeekEntryResult!11153)

(assert (=> b!1425920 (= res!960465 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!628095 (select (arr!46966 a!2831) j!81) a!2831 mask!2608) lt!628092)))))

(declare-fun b!1425921 () Bool)

(declare-fun e!805957 () Bool)

(assert (=> b!1425921 (= e!805956 (not e!805957))))

(declare-fun res!960462 () Bool)

(assert (=> b!1425921 (=> res!960462 e!805957)))

(assert (=> b!1425921 (= res!960462 (or (= (select (arr!46966 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46966 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46966 a!2831) index!585) (select (arr!46966 a!2831) j!81)) (= (select (store (arr!46966 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1425921 e!805955))

(declare-fun res!960461 () Bool)

(assert (=> b!1425921 (=> (not res!960461) (not e!805955))))

(assert (=> b!1425921 (= res!960461 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48173 0))(
  ( (Unit!48174) )
))
(declare-fun lt!628091 () Unit!48173)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48173)

(assert (=> b!1425921 (= lt!628091 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1425922 () Bool)

(assert (=> b!1425922 (= e!805952 e!805954)))

(declare-fun res!960460 () Bool)

(assert (=> b!1425922 (=> (not res!960460) (not e!805954))))

(assert (=> b!1425922 (= res!960460 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46966 a!2831) j!81) mask!2608) (select (arr!46966 a!2831) j!81) a!2831 mask!2608) lt!628092))))

(assert (=> b!1425922 (= lt!628092 (Intermediate!11153 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425923 () Bool)

(assert (=> b!1425923 (= e!805957 e!805958)))

(declare-fun res!960475 () Bool)

(assert (=> b!1425923 (=> res!960475 e!805958)))

(assert (=> b!1425923 (= res!960475 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!628095 #b00000000000000000000000000000000) (bvsge lt!628095 (size!47517 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425923 (= lt!628095 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1425924 () Bool)

(declare-fun res!960474 () Bool)

(assert (=> b!1425924 (=> (not res!960474) (not e!805956))))

(assert (=> b!1425924 (= res!960474 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1425925 () Bool)

(declare-fun res!960473 () Bool)

(assert (=> b!1425925 (=> (not res!960473) (not e!805956))))

(assert (=> b!1425925 (= res!960473 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46966 a!2831) j!81) a!2831 mask!2608) lt!628092))))

(declare-fun b!1425926 () Bool)

(declare-fun res!960464 () Bool)

(assert (=> b!1425926 (=> (not res!960464) (not e!805952))))

(assert (=> b!1425926 (= res!960464 (validKeyInArray!0 (select (arr!46966 a!2831) i!982)))))

(declare-fun b!1425927 () Bool)

(declare-fun res!960469 () Bool)

(assert (=> b!1425927 (=> (not res!960469) (not e!805952))))

(declare-datatypes ((List!33463 0))(
  ( (Nil!33460) (Cons!33459 (h!34772 (_ BitVec 64)) (t!48149 List!33463)) )
))
(declare-fun arrayNoDuplicates!0 (array!97304 (_ BitVec 32) List!33463) Bool)

(assert (=> b!1425927 (= res!960469 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33460))))

(assert (= (and start!123068 res!960470) b!1425918))

(assert (= (and b!1425918 res!960472) b!1425926))

(assert (= (and b!1425926 res!960464) b!1425912))

(assert (= (and b!1425912 res!960468) b!1425917))

(assert (= (and b!1425917 res!960471) b!1425927))

(assert (= (and b!1425927 res!960469) b!1425914))

(assert (= (and b!1425914 res!960463) b!1425922))

(assert (= (and b!1425922 res!960460) b!1425913))

(assert (= (and b!1425913 res!960467) b!1425925))

(assert (= (and b!1425925 res!960473) b!1425915))

(assert (= (and b!1425915 res!960466) b!1425924))

(assert (= (and b!1425924 res!960474) b!1425921))

(assert (= (and b!1425921 res!960461) b!1425919))

(assert (= (and b!1425921 (not res!960462)) b!1425923))

(assert (= (and b!1425923 (not res!960475)) b!1425920))

(assert (= (and b!1425920 (not res!960465)) b!1425916))

(declare-fun m!1316577 () Bool)

(assert (=> b!1425912 m!1316577))

(assert (=> b!1425912 m!1316577))

(declare-fun m!1316579 () Bool)

(assert (=> b!1425912 m!1316579))

(declare-fun m!1316581 () Bool)

(assert (=> b!1425927 m!1316581))

(declare-fun m!1316583 () Bool)

(assert (=> b!1425921 m!1316583))

(declare-fun m!1316585 () Bool)

(assert (=> b!1425921 m!1316585))

(declare-fun m!1316587 () Bool)

(assert (=> b!1425921 m!1316587))

(declare-fun m!1316589 () Bool)

(assert (=> b!1425921 m!1316589))

(assert (=> b!1425921 m!1316577))

(declare-fun m!1316591 () Bool)

(assert (=> b!1425921 m!1316591))

(declare-fun m!1316593 () Bool)

(assert (=> b!1425923 m!1316593))

(declare-fun m!1316595 () Bool)

(assert (=> start!123068 m!1316595))

(declare-fun m!1316597 () Bool)

(assert (=> start!123068 m!1316597))

(assert (=> b!1425922 m!1316577))

(assert (=> b!1425922 m!1316577))

(declare-fun m!1316599 () Bool)

(assert (=> b!1425922 m!1316599))

(assert (=> b!1425922 m!1316599))

(assert (=> b!1425922 m!1316577))

(declare-fun m!1316601 () Bool)

(assert (=> b!1425922 m!1316601))

(declare-fun m!1316603 () Bool)

(assert (=> b!1425916 m!1316603))

(declare-fun m!1316605 () Bool)

(assert (=> b!1425915 m!1316605))

(assert (=> b!1425920 m!1316577))

(assert (=> b!1425920 m!1316577))

(declare-fun m!1316607 () Bool)

(assert (=> b!1425920 m!1316607))

(assert (=> b!1425925 m!1316577))

(assert (=> b!1425925 m!1316577))

(declare-fun m!1316609 () Bool)

(assert (=> b!1425925 m!1316609))

(declare-fun m!1316611 () Bool)

(assert (=> b!1425917 m!1316611))

(declare-fun m!1316613 () Bool)

(assert (=> b!1425913 m!1316613))

(assert (=> b!1425913 m!1316613))

(declare-fun m!1316615 () Bool)

(assert (=> b!1425913 m!1316615))

(assert (=> b!1425913 m!1316583))

(declare-fun m!1316617 () Bool)

(assert (=> b!1425913 m!1316617))

(declare-fun m!1316619 () Bool)

(assert (=> b!1425926 m!1316619))

(assert (=> b!1425926 m!1316619))

(declare-fun m!1316621 () Bool)

(assert (=> b!1425926 m!1316621))

(assert (=> b!1425919 m!1316577))

(assert (=> b!1425919 m!1316577))

(declare-fun m!1316623 () Bool)

(assert (=> b!1425919 m!1316623))

(check-sat (not b!1425913) (not start!123068) (not b!1425916) (not b!1425925) (not b!1425921) (not b!1425917) (not b!1425923) (not b!1425915) (not b!1425919) (not b!1425912) (not b!1425920) (not b!1425922) (not b!1425926) (not b!1425927))
(check-sat)
