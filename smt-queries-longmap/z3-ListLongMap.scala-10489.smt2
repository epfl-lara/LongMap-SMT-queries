; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123742 () Bool)

(assert start!123742)

(declare-fun b!1432934 () Bool)

(declare-fun e!809104 () Bool)

(declare-fun e!809105 () Bool)

(assert (=> b!1432934 (= e!809104 e!809105)))

(declare-fun res!965968 () Bool)

(assert (=> b!1432934 (=> (not res!965968) (not e!809105))))

(declare-datatypes ((SeekEntryResult!11282 0))(
  ( (MissingZero!11282 (index!47520 (_ BitVec 32))) (Found!11282 (index!47521 (_ BitVec 32))) (Intermediate!11282 (undefined!12094 Bool) (index!47522 (_ BitVec 32)) (x!129332 (_ BitVec 32))) (Undefined!11282) (MissingVacant!11282 (index!47523 (_ BitVec 32))) )
))
(declare-fun lt!630718 () SeekEntryResult!11282)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97595 0))(
  ( (array!97596 (arr!47101 (Array (_ BitVec 32) (_ BitVec 64))) (size!47652 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97595)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97595 (_ BitVec 32)) SeekEntryResult!11282)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432934 (= res!965968 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47101 a!2831) j!81) mask!2608) (select (arr!47101 a!2831) j!81) a!2831 mask!2608) lt!630718))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432934 (= lt!630718 (Intermediate!11282 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432935 () Bool)

(declare-fun res!965961 () Bool)

(declare-fun e!809100 () Bool)

(assert (=> b!1432935 (=> (not res!965961) (not e!809100))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432935 (= res!965961 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432936 () Bool)

(declare-fun res!965970 () Bool)

(assert (=> b!1432936 (=> (not res!965970) (not e!809100))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1432936 (= res!965970 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47101 a!2831) j!81) a!2831 mask!2608) lt!630718))))

(declare-fun b!1432937 () Bool)

(declare-fun res!965973 () Bool)

(assert (=> b!1432937 (=> (not res!965973) (not e!809104))))

(declare-datatypes ((List!33598 0))(
  ( (Nil!33595) (Cons!33594 (h!34928 (_ BitVec 64)) (t!48284 List!33598)) )
))
(declare-fun arrayNoDuplicates!0 (array!97595 (_ BitVec 32) List!33598) Bool)

(assert (=> b!1432937 (= res!965973 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33595))))

(declare-fun b!1432938 () Bool)

(declare-fun res!965964 () Bool)

(assert (=> b!1432938 (=> (not res!965964) (not e!809104))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432938 (= res!965964 (validKeyInArray!0 (select (arr!47101 a!2831) i!982)))))

(declare-fun b!1432939 () Bool)

(declare-fun res!965967 () Bool)

(assert (=> b!1432939 (=> (not res!965967) (not e!809100))))

(declare-fun lt!630717 () array!97595)

(declare-fun lt!630722 () (_ BitVec 64))

(declare-fun lt!630720 () SeekEntryResult!11282)

(assert (=> b!1432939 (= res!965967 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630722 lt!630717 mask!2608) lt!630720))))

(declare-fun b!1432940 () Bool)

(declare-fun res!965969 () Bool)

(assert (=> b!1432940 (=> (not res!965969) (not e!809104))))

(assert (=> b!1432940 (= res!965969 (and (= (size!47652 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47652 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47652 a!2831)) (not (= i!982 j!81))))))

(declare-fun e!809102 () Bool)

(declare-fun b!1432942 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97595 (_ BitVec 32)) SeekEntryResult!11282)

(assert (=> b!1432942 (= e!809102 (= (seekEntryOrOpen!0 (select (arr!47101 a!2831) j!81) a!2831 mask!2608) (Found!11282 j!81)))))

(declare-fun b!1432943 () Bool)

(declare-fun res!965974 () Bool)

(assert (=> b!1432943 (=> (not res!965974) (not e!809104))))

(assert (=> b!1432943 (= res!965974 (validKeyInArray!0 (select (arr!47101 a!2831) j!81)))))

(declare-fun b!1432944 () Bool)

(declare-fun e!809101 () Bool)

(assert (=> b!1432944 (= e!809100 (not e!809101))))

(declare-fun res!965963 () Bool)

(assert (=> b!1432944 (=> res!965963 e!809101)))

(assert (=> b!1432944 (= res!965963 (or (= (select (arr!47101 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47101 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47101 a!2831) index!585) (select (arr!47101 a!2831) j!81)) (= (select (store (arr!47101 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432944 e!809102))

(declare-fun res!965972 () Bool)

(assert (=> b!1432944 (=> (not res!965972) (not e!809102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97595 (_ BitVec 32)) Bool)

(assert (=> b!1432944 (= res!965972 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48341 0))(
  ( (Unit!48342) )
))
(declare-fun lt!630719 () Unit!48341)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48341)

(assert (=> b!1432944 (= lt!630719 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432945 () Bool)

(declare-fun res!965966 () Bool)

(assert (=> b!1432945 (=> (not res!965966) (not e!809104))))

(assert (=> b!1432945 (= res!965966 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47652 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47652 a!2831))))))

(declare-fun b!1432941 () Bool)

(declare-fun res!965965 () Bool)

(assert (=> b!1432941 (=> (not res!965965) (not e!809104))))

(assert (=> b!1432941 (= res!965965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!965962 () Bool)

(assert (=> start!123742 (=> (not res!965962) (not e!809104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123742 (= res!965962 (validMask!0 mask!2608))))

(assert (=> start!123742 e!809104))

(assert (=> start!123742 true))

(declare-fun array_inv!36382 (array!97595) Bool)

(assert (=> start!123742 (array_inv!36382 a!2831)))

(declare-fun b!1432946 () Bool)

(assert (=> b!1432946 (= e!809105 e!809100)))

(declare-fun res!965971 () Bool)

(assert (=> b!1432946 (=> (not res!965971) (not e!809100))))

(assert (=> b!1432946 (= res!965971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630722 mask!2608) lt!630722 lt!630717 mask!2608) lt!630720))))

(assert (=> b!1432946 (= lt!630720 (Intermediate!11282 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432946 (= lt!630722 (select (store (arr!47101 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432946 (= lt!630717 (array!97596 (store (arr!47101 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47652 a!2831)))))

(declare-fun b!1432947 () Bool)

(assert (=> b!1432947 (= e!809101 true)))

(declare-fun lt!630721 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432947 (= lt!630721 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(assert (= (and start!123742 res!965962) b!1432940))

(assert (= (and b!1432940 res!965969) b!1432938))

(assert (= (and b!1432938 res!965964) b!1432943))

(assert (= (and b!1432943 res!965974) b!1432941))

(assert (= (and b!1432941 res!965965) b!1432937))

(assert (= (and b!1432937 res!965973) b!1432945))

(assert (= (and b!1432945 res!965966) b!1432934))

(assert (= (and b!1432934 res!965968) b!1432946))

(assert (= (and b!1432946 res!965971) b!1432936))

(assert (= (and b!1432936 res!965970) b!1432939))

(assert (= (and b!1432939 res!965967) b!1432935))

(assert (= (and b!1432935 res!965961) b!1432944))

(assert (= (and b!1432944 res!965972) b!1432942))

(assert (= (and b!1432944 (not res!965963)) b!1432947))

(declare-fun m!1322803 () Bool)

(assert (=> b!1432934 m!1322803))

(assert (=> b!1432934 m!1322803))

(declare-fun m!1322805 () Bool)

(assert (=> b!1432934 m!1322805))

(assert (=> b!1432934 m!1322805))

(assert (=> b!1432934 m!1322803))

(declare-fun m!1322807 () Bool)

(assert (=> b!1432934 m!1322807))

(declare-fun m!1322809 () Bool)

(assert (=> start!123742 m!1322809))

(declare-fun m!1322811 () Bool)

(assert (=> start!123742 m!1322811))

(declare-fun m!1322813 () Bool)

(assert (=> b!1432938 m!1322813))

(assert (=> b!1432938 m!1322813))

(declare-fun m!1322815 () Bool)

(assert (=> b!1432938 m!1322815))

(declare-fun m!1322817 () Bool)

(assert (=> b!1432944 m!1322817))

(declare-fun m!1322819 () Bool)

(assert (=> b!1432944 m!1322819))

(declare-fun m!1322821 () Bool)

(assert (=> b!1432944 m!1322821))

(declare-fun m!1322823 () Bool)

(assert (=> b!1432944 m!1322823))

(assert (=> b!1432944 m!1322803))

(declare-fun m!1322825 () Bool)

(assert (=> b!1432944 m!1322825))

(assert (=> b!1432942 m!1322803))

(assert (=> b!1432942 m!1322803))

(declare-fun m!1322827 () Bool)

(assert (=> b!1432942 m!1322827))

(declare-fun m!1322829 () Bool)

(assert (=> b!1432939 m!1322829))

(declare-fun m!1322831 () Bool)

(assert (=> b!1432947 m!1322831))

(declare-fun m!1322833 () Bool)

(assert (=> b!1432937 m!1322833))

(declare-fun m!1322835 () Bool)

(assert (=> b!1432946 m!1322835))

(assert (=> b!1432946 m!1322835))

(declare-fun m!1322837 () Bool)

(assert (=> b!1432946 m!1322837))

(assert (=> b!1432946 m!1322817))

(declare-fun m!1322839 () Bool)

(assert (=> b!1432946 m!1322839))

(assert (=> b!1432936 m!1322803))

(assert (=> b!1432936 m!1322803))

(declare-fun m!1322841 () Bool)

(assert (=> b!1432936 m!1322841))

(assert (=> b!1432943 m!1322803))

(assert (=> b!1432943 m!1322803))

(declare-fun m!1322843 () Bool)

(assert (=> b!1432943 m!1322843))

(declare-fun m!1322845 () Bool)

(assert (=> b!1432941 m!1322845))

(check-sat (not b!1432937) (not b!1432936) (not b!1432943) (not b!1432939) (not b!1432934) (not b!1432942) (not b!1432941) (not b!1432946) (not b!1432944) (not b!1432947) (not b!1432938) (not start!123742))
(check-sat)
