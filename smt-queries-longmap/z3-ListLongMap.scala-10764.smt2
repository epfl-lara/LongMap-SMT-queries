; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125872 () Bool)

(assert start!125872)

(declare-fun b!1473856 () Bool)

(declare-fun res!1001234 () Bool)

(declare-fun e!826994 () Bool)

(assert (=> b!1473856 (=> (not res!1001234) (not e!826994))))

(declare-datatypes ((array!99127 0))(
  ( (array!99128 (arr!47848 (Array (_ BitVec 32) (_ BitVec 64))) (size!48400 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99127)

(declare-datatypes ((List!34427 0))(
  ( (Nil!34424) (Cons!34423 (h!35782 (_ BitVec 64)) (t!49113 List!34427)) )
))
(declare-fun arrayNoDuplicates!0 (array!99127 (_ BitVec 32) List!34427) Bool)

(assert (=> b!1473856 (= res!1001234 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34424))))

(declare-fun b!1473857 () Bool)

(declare-fun res!1001223 () Bool)

(declare-fun e!826995 () Bool)

(assert (=> b!1473857 (=> (not res!1001223) (not e!826995))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12113 0))(
  ( (MissingZero!12113 (index!50844 (_ BitVec 32))) (Found!12113 (index!50845 (_ BitVec 32))) (Intermediate!12113 (undefined!12925 Bool) (index!50846 (_ BitVec 32)) (x!132424 (_ BitVec 32))) (Undefined!12113) (MissingVacant!12113 (index!50847 (_ BitVec 32))) )
))
(declare-fun lt!643899 () SeekEntryResult!12113)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99127 (_ BitVec 32)) SeekEntryResult!12113)

(assert (=> b!1473857 (= res!1001223 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47848 a!2862) j!93) a!2862 mask!2687) lt!643899))))

(declare-fun b!1473858 () Bool)

(declare-fun res!1001231 () Bool)

(assert (=> b!1473858 (=> (not res!1001231) (not e!826994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473858 (= res!1001231 (validKeyInArray!0 (select (arr!47848 a!2862) j!93)))))

(declare-fun lt!643900 () array!99127)

(declare-fun e!826996 () Bool)

(declare-fun lt!643897 () (_ BitVec 64))

(declare-fun lt!643902 () SeekEntryResult!12113)

(declare-fun b!1473859 () Bool)

(assert (=> b!1473859 (= e!826996 (= lt!643902 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643897 lt!643900 mask!2687)))))

(declare-fun b!1473860 () Bool)

(declare-fun e!826998 () Bool)

(assert (=> b!1473860 (= e!826995 e!826998)))

(declare-fun res!1001222 () Bool)

(assert (=> b!1473860 (=> (not res!1001222) (not e!826998))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1473860 (= res!1001222 (= lt!643902 (Intermediate!12113 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473860 (= lt!643902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643897 mask!2687) lt!643897 lt!643900 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473860 (= lt!643897 (select (store (arr!47848 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473861 () Bool)

(declare-fun res!1001227 () Bool)

(assert (=> b!1473861 (=> (not res!1001227) (not e!826994))))

(assert (=> b!1473861 (= res!1001227 (and (= (size!48400 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48400 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48400 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473862 () Bool)

(declare-fun res!1001224 () Bool)

(assert (=> b!1473862 (=> (not res!1001224) (not e!826994))))

(assert (=> b!1473862 (= res!1001224 (validKeyInArray!0 (select (arr!47848 a!2862) i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1473863 () Bool)

(declare-fun e!826997 () Bool)

(assert (=> b!1473863 (= e!826997 (or (= (select (arr!47848 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47848 a!2862) intermediateBeforeIndex!19) (select (arr!47848 a!2862) j!93))))))

(declare-fun res!1001233 () Bool)

(assert (=> start!125872 (=> (not res!1001233) (not e!826994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125872 (= res!1001233 (validMask!0 mask!2687))))

(assert (=> start!125872 e!826994))

(assert (=> start!125872 true))

(declare-fun array_inv!37081 (array!99127) Bool)

(assert (=> start!125872 (array_inv!37081 a!2862)))

(declare-fun b!1473864 () Bool)

(declare-fun res!1001228 () Bool)

(assert (=> b!1473864 (=> (not res!1001228) (not e!826997))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99127 (_ BitVec 32)) SeekEntryResult!12113)

(assert (=> b!1473864 (= res!1001228 (= (seekEntryOrOpen!0 (select (arr!47848 a!2862) j!93) a!2862 mask!2687) (Found!12113 j!93)))))

(declare-fun b!1473865 () Bool)

(declare-fun res!1001235 () Bool)

(assert (=> b!1473865 (=> (not res!1001235) (not e!826994))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473865 (= res!1001235 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48400 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48400 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48400 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473866 () Bool)

(declare-fun e!826991 () Bool)

(assert (=> b!1473866 (= e!826998 (not e!826991))))

(declare-fun res!1001236 () Bool)

(assert (=> b!1473866 (=> res!1001236 e!826991)))

(assert (=> b!1473866 (= res!1001236 (or (not (= (select (arr!47848 a!2862) index!646) (select (store (arr!47848 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47848 a!2862) index!646) (select (arr!47848 a!2862) j!93)))))))

(assert (=> b!1473866 e!826997))

(declare-fun res!1001226 () Bool)

(assert (=> b!1473866 (=> (not res!1001226) (not e!826997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99127 (_ BitVec 32)) Bool)

(assert (=> b!1473866 (= res!1001226 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49407 0))(
  ( (Unit!49408) )
))
(declare-fun lt!643901 () Unit!49407)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49407)

(assert (=> b!1473866 (= lt!643901 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473867 () Bool)

(declare-fun e!826993 () Bool)

(assert (=> b!1473867 (= e!826993 e!826995)))

(declare-fun res!1001225 () Bool)

(assert (=> b!1473867 (=> (not res!1001225) (not e!826995))))

(assert (=> b!1473867 (= res!1001225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47848 a!2862) j!93) mask!2687) (select (arr!47848 a!2862) j!93) a!2862 mask!2687) lt!643899))))

(assert (=> b!1473867 (= lt!643899 (Intermediate!12113 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473868 () Bool)

(assert (=> b!1473868 (= e!826991 true)))

(declare-fun lt!643898 () SeekEntryResult!12113)

(assert (=> b!1473868 (= lt!643898 (seekEntryOrOpen!0 lt!643897 lt!643900 mask!2687))))

(declare-fun b!1473869 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99127 (_ BitVec 32)) SeekEntryResult!12113)

(assert (=> b!1473869 (= e!826996 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643897 lt!643900 mask!2687) (seekEntryOrOpen!0 lt!643897 lt!643900 mask!2687)))))

(declare-fun b!1473870 () Bool)

(declare-fun res!1001229 () Bool)

(assert (=> b!1473870 (=> (not res!1001229) (not e!826998))))

(assert (=> b!1473870 (= res!1001229 e!826996)))

(declare-fun c!135835 () Bool)

(assert (=> b!1473870 (= c!135835 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473871 () Bool)

(declare-fun res!1001230 () Bool)

(assert (=> b!1473871 (=> (not res!1001230) (not e!826994))))

(assert (=> b!1473871 (= res!1001230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473872 () Bool)

(assert (=> b!1473872 (= e!826994 e!826993)))

(declare-fun res!1001221 () Bool)

(assert (=> b!1473872 (=> (not res!1001221) (not e!826993))))

(assert (=> b!1473872 (= res!1001221 (= (select (store (arr!47848 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473872 (= lt!643900 (array!99128 (store (arr!47848 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48400 a!2862)))))

(declare-fun b!1473873 () Bool)

(declare-fun res!1001232 () Bool)

(assert (=> b!1473873 (=> (not res!1001232) (not e!826998))))

(assert (=> b!1473873 (= res!1001232 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125872 res!1001233) b!1473861))

(assert (= (and b!1473861 res!1001227) b!1473862))

(assert (= (and b!1473862 res!1001224) b!1473858))

(assert (= (and b!1473858 res!1001231) b!1473871))

(assert (= (and b!1473871 res!1001230) b!1473856))

(assert (= (and b!1473856 res!1001234) b!1473865))

(assert (= (and b!1473865 res!1001235) b!1473872))

(assert (= (and b!1473872 res!1001221) b!1473867))

(assert (= (and b!1473867 res!1001225) b!1473857))

(assert (= (and b!1473857 res!1001223) b!1473860))

(assert (= (and b!1473860 res!1001222) b!1473870))

(assert (= (and b!1473870 c!135835) b!1473859))

(assert (= (and b!1473870 (not c!135835)) b!1473869))

(assert (= (and b!1473870 res!1001229) b!1473873))

(assert (= (and b!1473873 res!1001232) b!1473866))

(assert (= (and b!1473866 res!1001226) b!1473864))

(assert (= (and b!1473864 res!1001228) b!1473863))

(assert (= (and b!1473866 (not res!1001236)) b!1473868))

(declare-fun m!1359855 () Bool)

(assert (=> b!1473856 m!1359855))

(declare-fun m!1359857 () Bool)

(assert (=> b!1473859 m!1359857))

(declare-fun m!1359859 () Bool)

(assert (=> b!1473867 m!1359859))

(assert (=> b!1473867 m!1359859))

(declare-fun m!1359861 () Bool)

(assert (=> b!1473867 m!1359861))

(assert (=> b!1473867 m!1359861))

(assert (=> b!1473867 m!1359859))

(declare-fun m!1359863 () Bool)

(assert (=> b!1473867 m!1359863))

(declare-fun m!1359865 () Bool)

(assert (=> b!1473868 m!1359865))

(declare-fun m!1359867 () Bool)

(assert (=> b!1473860 m!1359867))

(assert (=> b!1473860 m!1359867))

(declare-fun m!1359869 () Bool)

(assert (=> b!1473860 m!1359869))

(declare-fun m!1359871 () Bool)

(assert (=> b!1473860 m!1359871))

(declare-fun m!1359873 () Bool)

(assert (=> b!1473860 m!1359873))

(declare-fun m!1359875 () Bool)

(assert (=> b!1473863 m!1359875))

(assert (=> b!1473863 m!1359859))

(assert (=> b!1473864 m!1359859))

(assert (=> b!1473864 m!1359859))

(declare-fun m!1359877 () Bool)

(assert (=> b!1473864 m!1359877))

(assert (=> b!1473857 m!1359859))

(assert (=> b!1473857 m!1359859))

(declare-fun m!1359879 () Bool)

(assert (=> b!1473857 m!1359879))

(declare-fun m!1359881 () Bool)

(assert (=> b!1473862 m!1359881))

(assert (=> b!1473862 m!1359881))

(declare-fun m!1359883 () Bool)

(assert (=> b!1473862 m!1359883))

(declare-fun m!1359885 () Bool)

(assert (=> b!1473869 m!1359885))

(assert (=> b!1473869 m!1359865))

(declare-fun m!1359887 () Bool)

(assert (=> b!1473866 m!1359887))

(assert (=> b!1473866 m!1359871))

(declare-fun m!1359889 () Bool)

(assert (=> b!1473866 m!1359889))

(declare-fun m!1359891 () Bool)

(assert (=> b!1473866 m!1359891))

(declare-fun m!1359893 () Bool)

(assert (=> b!1473866 m!1359893))

(assert (=> b!1473866 m!1359859))

(assert (=> b!1473858 m!1359859))

(assert (=> b!1473858 m!1359859))

(declare-fun m!1359895 () Bool)

(assert (=> b!1473858 m!1359895))

(declare-fun m!1359897 () Bool)

(assert (=> start!125872 m!1359897))

(declare-fun m!1359899 () Bool)

(assert (=> start!125872 m!1359899))

(assert (=> b!1473872 m!1359871))

(declare-fun m!1359901 () Bool)

(assert (=> b!1473872 m!1359901))

(declare-fun m!1359903 () Bool)

(assert (=> b!1473871 m!1359903))

(check-sat (not b!1473868) (not b!1473869) (not b!1473864) (not b!1473858) (not b!1473857) (not start!125872) (not b!1473871) (not b!1473856) (not b!1473860) (not b!1473867) (not b!1473862) (not b!1473859) (not b!1473866))
(check-sat)
