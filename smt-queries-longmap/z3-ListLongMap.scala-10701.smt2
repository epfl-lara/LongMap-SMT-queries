; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125346 () Bool)

(assert start!125346)

(declare-fun b!1464891 () Bool)

(declare-fun res!993890 () Bool)

(declare-fun e!823187 () Bool)

(assert (=> b!1464891 (=> (not res!993890) (not e!823187))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98794 0))(
  ( (array!98795 (arr!47685 (Array (_ BitVec 32) (_ BitVec 64))) (size!48235 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98794)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464891 (= res!993890 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48235 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48235 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48235 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464892 () Bool)

(declare-fun e!823189 () Bool)

(declare-fun e!823182 () Bool)

(assert (=> b!1464892 (= e!823189 e!823182)))

(declare-fun res!993892 () Bool)

(assert (=> b!1464892 (=> (not res!993892) (not e!823182))))

(declare-datatypes ((SeekEntryResult!11937 0))(
  ( (MissingZero!11937 (index!50140 (_ BitVec 32))) (Found!11937 (index!50141 (_ BitVec 32))) (Intermediate!11937 (undefined!12749 Bool) (index!50142 (_ BitVec 32)) (x!131722 (_ BitVec 32))) (Undefined!11937) (MissingVacant!11937 (index!50143 (_ BitVec 32))) )
))
(declare-fun lt!641233 () SeekEntryResult!11937)

(assert (=> b!1464892 (= res!993892 (= lt!641233 (Intermediate!11937 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!641231 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!641229 () array!98794)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98794 (_ BitVec 32)) SeekEntryResult!11937)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464892 (= lt!641233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641231 mask!2687) lt!641231 lt!641229 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464892 (= lt!641231 (select (store (arr!47685 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464893 () Bool)

(declare-fun res!993883 () Bool)

(assert (=> b!1464893 (=> (not res!993883) (not e!823187))))

(assert (=> b!1464893 (= res!993883 (and (= (size!48235 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48235 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48235 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464894 () Bool)

(declare-fun e!823188 () Bool)

(assert (=> b!1464894 (= e!823187 e!823188)))

(declare-fun res!993886 () Bool)

(assert (=> b!1464894 (=> (not res!993886) (not e!823188))))

(assert (=> b!1464894 (= res!993886 (= (select (store (arr!47685 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464894 (= lt!641229 (array!98795 (store (arr!47685 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48235 a!2862)))))

(declare-fun b!1464895 () Bool)

(declare-fun e!823184 () Bool)

(assert (=> b!1464895 (= e!823182 (not e!823184))))

(declare-fun res!993880 () Bool)

(assert (=> b!1464895 (=> res!993880 e!823184)))

(assert (=> b!1464895 (= res!993880 (or (and (= (select (arr!47685 a!2862) index!646) (select (store (arr!47685 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47685 a!2862) index!646) (select (arr!47685 a!2862) j!93))) (= (select (arr!47685 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823185 () Bool)

(assert (=> b!1464895 e!823185))

(declare-fun res!993895 () Bool)

(assert (=> b!1464895 (=> (not res!993895) (not e!823185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98794 (_ BitVec 32)) Bool)

(assert (=> b!1464895 (= res!993895 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49370 0))(
  ( (Unit!49371) )
))
(declare-fun lt!641235 () Unit!49370)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49370)

(assert (=> b!1464895 (= lt!641235 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464897 () Bool)

(declare-fun res!993894 () Bool)

(assert (=> b!1464897 (=> (not res!993894) (not e!823185))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98794 (_ BitVec 32)) SeekEntryResult!11937)

(assert (=> b!1464897 (= res!993894 (= (seekEntryOrOpen!0 (select (arr!47685 a!2862) j!93) a!2862 mask!2687) (Found!11937 j!93)))))

(declare-fun lt!641234 () (_ BitVec 32))

(declare-fun e!823181 () Bool)

(declare-fun b!1464898 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98794 (_ BitVec 32)) SeekEntryResult!11937)

(assert (=> b!1464898 (= e!823181 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641234 intermediateAfterIndex!19 lt!641231 lt!641229 mask!2687) (seekEntryOrOpen!0 lt!641231 lt!641229 mask!2687))))))

(declare-fun b!1464899 () Bool)

(assert (=> b!1464899 (= e!823181 (not (= lt!641233 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641234 lt!641231 lt!641229 mask!2687))))))

(declare-fun b!1464900 () Bool)

(declare-fun e!823186 () Bool)

(assert (=> b!1464900 (= e!823186 (= lt!641233 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641231 lt!641229 mask!2687)))))

(declare-fun b!1464901 () Bool)

(declare-fun e!823183 () Bool)

(assert (=> b!1464901 (= e!823183 true)))

(declare-fun lt!641232 () Bool)

(assert (=> b!1464901 (= lt!641232 e!823181)))

(declare-fun c!135018 () Bool)

(assert (=> b!1464901 (= c!135018 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464902 () Bool)

(declare-fun res!993878 () Bool)

(assert (=> b!1464902 (=> (not res!993878) (not e!823187))))

(declare-datatypes ((List!34186 0))(
  ( (Nil!34183) (Cons!34182 (h!35532 (_ BitVec 64)) (t!48880 List!34186)) )
))
(declare-fun arrayNoDuplicates!0 (array!98794 (_ BitVec 32) List!34186) Bool)

(assert (=> b!1464902 (= res!993878 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34183))))

(declare-fun b!1464903 () Bool)

(declare-fun res!993893 () Bool)

(assert (=> b!1464903 (=> (not res!993893) (not e!823182))))

(assert (=> b!1464903 (= res!993893 e!823186)))

(declare-fun c!135017 () Bool)

(assert (=> b!1464903 (= c!135017 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!993888 () Bool)

(assert (=> start!125346 (=> (not res!993888) (not e!823187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125346 (= res!993888 (validMask!0 mask!2687))))

(assert (=> start!125346 e!823187))

(assert (=> start!125346 true))

(declare-fun array_inv!36713 (array!98794) Bool)

(assert (=> start!125346 (array_inv!36713 a!2862)))

(declare-fun b!1464896 () Bool)

(declare-fun res!993885 () Bool)

(assert (=> b!1464896 (=> (not res!993885) (not e!823187))))

(assert (=> b!1464896 (= res!993885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464904 () Bool)

(assert (=> b!1464904 (= e!823184 e!823183)))

(declare-fun res!993884 () Bool)

(assert (=> b!1464904 (=> res!993884 e!823183)))

(assert (=> b!1464904 (= res!993884 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641234 #b00000000000000000000000000000000) (bvsge lt!641234 (size!48235 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464904 (= lt!641234 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464905 () Bool)

(assert (=> b!1464905 (= e!823188 e!823189)))

(declare-fun res!993889 () Bool)

(assert (=> b!1464905 (=> (not res!993889) (not e!823189))))

(declare-fun lt!641230 () SeekEntryResult!11937)

(assert (=> b!1464905 (= res!993889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47685 a!2862) j!93) mask!2687) (select (arr!47685 a!2862) j!93) a!2862 mask!2687) lt!641230))))

(assert (=> b!1464905 (= lt!641230 (Intermediate!11937 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464906 () Bool)

(declare-fun res!993891 () Bool)

(assert (=> b!1464906 (=> res!993891 e!823183)))

(assert (=> b!1464906 (= res!993891 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641234 (select (arr!47685 a!2862) j!93) a!2862 mask!2687) lt!641230)))))

(declare-fun b!1464907 () Bool)

(declare-fun res!993882 () Bool)

(assert (=> b!1464907 (=> (not res!993882) (not e!823187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464907 (= res!993882 (validKeyInArray!0 (select (arr!47685 a!2862) i!1006)))))

(declare-fun b!1464908 () Bool)

(declare-fun res!993887 () Bool)

(assert (=> b!1464908 (=> (not res!993887) (not e!823189))))

(assert (=> b!1464908 (= res!993887 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47685 a!2862) j!93) a!2862 mask!2687) lt!641230))))

(declare-fun b!1464909 () Bool)

(assert (=> b!1464909 (= e!823185 (or (= (select (arr!47685 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47685 a!2862) intermediateBeforeIndex!19) (select (arr!47685 a!2862) j!93))))))

(declare-fun b!1464910 () Bool)

(declare-fun res!993879 () Bool)

(assert (=> b!1464910 (=> (not res!993879) (not e!823187))))

(assert (=> b!1464910 (= res!993879 (validKeyInArray!0 (select (arr!47685 a!2862) j!93)))))

(declare-fun b!1464911 () Bool)

(declare-fun res!993881 () Bool)

(assert (=> b!1464911 (=> (not res!993881) (not e!823182))))

(assert (=> b!1464911 (= res!993881 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464912 () Bool)

(assert (=> b!1464912 (= e!823186 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641231 lt!641229 mask!2687) (seekEntryOrOpen!0 lt!641231 lt!641229 mask!2687)))))

(assert (= (and start!125346 res!993888) b!1464893))

(assert (= (and b!1464893 res!993883) b!1464907))

(assert (= (and b!1464907 res!993882) b!1464910))

(assert (= (and b!1464910 res!993879) b!1464896))

(assert (= (and b!1464896 res!993885) b!1464902))

(assert (= (and b!1464902 res!993878) b!1464891))

(assert (= (and b!1464891 res!993890) b!1464894))

(assert (= (and b!1464894 res!993886) b!1464905))

(assert (= (and b!1464905 res!993889) b!1464908))

(assert (= (and b!1464908 res!993887) b!1464892))

(assert (= (and b!1464892 res!993892) b!1464903))

(assert (= (and b!1464903 c!135017) b!1464900))

(assert (= (and b!1464903 (not c!135017)) b!1464912))

(assert (= (and b!1464903 res!993893) b!1464911))

(assert (= (and b!1464911 res!993881) b!1464895))

(assert (= (and b!1464895 res!993895) b!1464897))

(assert (= (and b!1464897 res!993894) b!1464909))

(assert (= (and b!1464895 (not res!993880)) b!1464904))

(assert (= (and b!1464904 (not res!993884)) b!1464906))

(assert (= (and b!1464906 (not res!993891)) b!1464901))

(assert (= (and b!1464901 c!135018) b!1464899))

(assert (= (and b!1464901 (not c!135018)) b!1464898))

(declare-fun m!1352051 () Bool)

(assert (=> b!1464896 m!1352051))

(declare-fun m!1352053 () Bool)

(assert (=> b!1464894 m!1352053))

(declare-fun m!1352055 () Bool)

(assert (=> b!1464894 m!1352055))

(declare-fun m!1352057 () Bool)

(assert (=> b!1464898 m!1352057))

(declare-fun m!1352059 () Bool)

(assert (=> b!1464898 m!1352059))

(declare-fun m!1352061 () Bool)

(assert (=> b!1464899 m!1352061))

(declare-fun m!1352063 () Bool)

(assert (=> b!1464910 m!1352063))

(assert (=> b!1464910 m!1352063))

(declare-fun m!1352065 () Bool)

(assert (=> b!1464910 m!1352065))

(declare-fun m!1352067 () Bool)

(assert (=> b!1464900 m!1352067))

(declare-fun m!1352069 () Bool)

(assert (=> b!1464902 m!1352069))

(declare-fun m!1352071 () Bool)

(assert (=> b!1464895 m!1352071))

(assert (=> b!1464895 m!1352053))

(declare-fun m!1352073 () Bool)

(assert (=> b!1464895 m!1352073))

(declare-fun m!1352075 () Bool)

(assert (=> b!1464895 m!1352075))

(declare-fun m!1352077 () Bool)

(assert (=> b!1464895 m!1352077))

(assert (=> b!1464895 m!1352063))

(assert (=> b!1464897 m!1352063))

(assert (=> b!1464897 m!1352063))

(declare-fun m!1352079 () Bool)

(assert (=> b!1464897 m!1352079))

(declare-fun m!1352081 () Bool)

(assert (=> b!1464907 m!1352081))

(assert (=> b!1464907 m!1352081))

(declare-fun m!1352083 () Bool)

(assert (=> b!1464907 m!1352083))

(assert (=> b!1464905 m!1352063))

(assert (=> b!1464905 m!1352063))

(declare-fun m!1352085 () Bool)

(assert (=> b!1464905 m!1352085))

(assert (=> b!1464905 m!1352085))

(assert (=> b!1464905 m!1352063))

(declare-fun m!1352087 () Bool)

(assert (=> b!1464905 m!1352087))

(declare-fun m!1352089 () Bool)

(assert (=> b!1464892 m!1352089))

(assert (=> b!1464892 m!1352089))

(declare-fun m!1352091 () Bool)

(assert (=> b!1464892 m!1352091))

(assert (=> b!1464892 m!1352053))

(declare-fun m!1352093 () Bool)

(assert (=> b!1464892 m!1352093))

(declare-fun m!1352095 () Bool)

(assert (=> start!125346 m!1352095))

(declare-fun m!1352097 () Bool)

(assert (=> start!125346 m!1352097))

(assert (=> b!1464908 m!1352063))

(assert (=> b!1464908 m!1352063))

(declare-fun m!1352099 () Bool)

(assert (=> b!1464908 m!1352099))

(declare-fun m!1352101 () Bool)

(assert (=> b!1464909 m!1352101))

(assert (=> b!1464909 m!1352063))

(assert (=> b!1464906 m!1352063))

(assert (=> b!1464906 m!1352063))

(declare-fun m!1352103 () Bool)

(assert (=> b!1464906 m!1352103))

(declare-fun m!1352105 () Bool)

(assert (=> b!1464912 m!1352105))

(assert (=> b!1464912 m!1352059))

(declare-fun m!1352107 () Bool)

(assert (=> b!1464904 m!1352107))

(check-sat (not b!1464899) (not b!1464910) (not b!1464892) (not b!1464895) (not b!1464912) (not b!1464897) (not b!1464906) (not start!125346) (not b!1464902) (not b!1464904) (not b!1464900) (not b!1464898) (not b!1464908) (not b!1464907) (not b!1464905) (not b!1464896))
(check-sat)
