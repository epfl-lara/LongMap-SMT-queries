; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120200 () Bool)

(assert start!120200)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95625 0))(
  ( (array!95626 (arr!46165 (Array (_ BitVec 32) (_ BitVec 64))) (size!46717 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95625)

(declare-fun b!1399087 () Bool)

(declare-fun e!792074 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10508 0))(
  ( (MissingZero!10508 (index!44406 (_ BitVec 32))) (Found!10508 (index!44407 (_ BitVec 32))) (Intermediate!10508 (undefined!11320 Bool) (index!44408 (_ BitVec 32)) (x!126048 (_ BitVec 32))) (Undefined!10508) (MissingVacant!10508 (index!44409 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95625 (_ BitVec 32)) SeekEntryResult!10508)

(assert (=> b!1399087 (= e!792074 (= (seekEntryOrOpen!0 (select (arr!46165 a!2901) j!112) a!2901 mask!2840) (Found!10508 j!112)))))

(declare-fun b!1399088 () Bool)

(declare-fun res!937890 () Bool)

(declare-fun e!792073 () Bool)

(assert (=> b!1399088 (=> (not res!937890) (not e!792073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95625 (_ BitVec 32)) Bool)

(assert (=> b!1399088 (= res!937890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399089 () Bool)

(declare-fun res!937892 () Bool)

(assert (=> b!1399089 (=> (not res!937892) (not e!792073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399089 (= res!937892 (validKeyInArray!0 (select (arr!46165 a!2901) j!112)))))

(declare-fun b!1399090 () Bool)

(declare-fun res!937886 () Bool)

(assert (=> b!1399090 (=> (not res!937886) (not e!792073))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399090 (= res!937886 (and (= (size!46717 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46717 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46717 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399091 () Bool)

(declare-fun e!792077 () Bool)

(assert (=> b!1399091 (= e!792077 true)))

(declare-fun lt!615185 () SeekEntryResult!10508)

(declare-fun lt!615182 () SeekEntryResult!10508)

(assert (=> b!1399091 (and (not (undefined!11320 lt!615185)) (= (index!44408 lt!615185) i!1037) (bvslt (x!126048 lt!615185) (x!126048 lt!615182)) (= (select (store (arr!46165 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44408 lt!615185)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615181 () (_ BitVec 32))

(declare-datatypes ((Unit!46863 0))(
  ( (Unit!46864) )
))
(declare-fun lt!615180 () Unit!46863)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46863)

(assert (=> b!1399091 (= lt!615180 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615181 (x!126048 lt!615182) (index!44408 lt!615182) (x!126048 lt!615185) (index!44408 lt!615185) (undefined!11320 lt!615185) mask!2840))))

(declare-fun b!1399092 () Bool)

(declare-fun e!792076 () Bool)

(assert (=> b!1399092 (= e!792076 e!792077)))

(declare-fun res!937894 () Bool)

(assert (=> b!1399092 (=> res!937894 e!792077)))

(get-info :version)

(assert (=> b!1399092 (= res!937894 (or (= lt!615182 lt!615185) (not ((_ is Intermediate!10508) lt!615185))))))

(declare-fun lt!615184 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95625 (_ BitVec 32)) SeekEntryResult!10508)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399092 (= lt!615185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615184 mask!2840) lt!615184 (array!95626 (store (arr!46165 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46717 a!2901)) mask!2840))))

(assert (=> b!1399092 (= lt!615184 (select (store (arr!46165 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399093 () Bool)

(declare-fun res!937889 () Bool)

(assert (=> b!1399093 (=> (not res!937889) (not e!792073))))

(assert (=> b!1399093 (= res!937889 (validKeyInArray!0 (select (arr!46165 a!2901) i!1037)))))

(declare-fun res!937893 () Bool)

(assert (=> start!120200 (=> (not res!937893) (not e!792073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120200 (= res!937893 (validMask!0 mask!2840))))

(assert (=> start!120200 e!792073))

(assert (=> start!120200 true))

(declare-fun array_inv!35398 (array!95625) Bool)

(assert (=> start!120200 (array_inv!35398 a!2901)))

(declare-fun b!1399094 () Bool)

(assert (=> b!1399094 (= e!792073 (not e!792076))))

(declare-fun res!937891 () Bool)

(assert (=> b!1399094 (=> res!937891 e!792076)))

(assert (=> b!1399094 (= res!937891 (or (not ((_ is Intermediate!10508) lt!615182)) (undefined!11320 lt!615182)))))

(assert (=> b!1399094 e!792074))

(declare-fun res!937888 () Bool)

(assert (=> b!1399094 (=> (not res!937888) (not e!792074))))

(assert (=> b!1399094 (= res!937888 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615183 () Unit!46863)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46863)

(assert (=> b!1399094 (= lt!615183 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399094 (= lt!615182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615181 (select (arr!46165 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399094 (= lt!615181 (toIndex!0 (select (arr!46165 a!2901) j!112) mask!2840))))

(declare-fun b!1399095 () Bool)

(declare-fun res!937887 () Bool)

(assert (=> b!1399095 (=> (not res!937887) (not e!792073))))

(declare-datatypes ((List!32762 0))(
  ( (Nil!32759) (Cons!32758 (h!34003 (_ BitVec 64)) (t!47448 List!32762)) )
))
(declare-fun arrayNoDuplicates!0 (array!95625 (_ BitVec 32) List!32762) Bool)

(assert (=> b!1399095 (= res!937887 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32759))))

(assert (= (and start!120200 res!937893) b!1399090))

(assert (= (and b!1399090 res!937886) b!1399093))

(assert (= (and b!1399093 res!937889) b!1399089))

(assert (= (and b!1399089 res!937892) b!1399088))

(assert (= (and b!1399088 res!937890) b!1399095))

(assert (= (and b!1399095 res!937887) b!1399094))

(assert (= (and b!1399094 res!937888) b!1399087))

(assert (= (and b!1399094 (not res!937891)) b!1399092))

(assert (= (and b!1399092 (not res!937894)) b!1399091))

(declare-fun m!1285861 () Bool)

(assert (=> b!1399094 m!1285861))

(declare-fun m!1285863 () Bool)

(assert (=> b!1399094 m!1285863))

(declare-fun m!1285865 () Bool)

(assert (=> b!1399094 m!1285865))

(assert (=> b!1399094 m!1285861))

(declare-fun m!1285867 () Bool)

(assert (=> b!1399094 m!1285867))

(assert (=> b!1399094 m!1285861))

(declare-fun m!1285869 () Bool)

(assert (=> b!1399094 m!1285869))

(declare-fun m!1285871 () Bool)

(assert (=> b!1399091 m!1285871))

(declare-fun m!1285873 () Bool)

(assert (=> b!1399091 m!1285873))

(declare-fun m!1285875 () Bool)

(assert (=> b!1399091 m!1285875))

(assert (=> b!1399087 m!1285861))

(assert (=> b!1399087 m!1285861))

(declare-fun m!1285877 () Bool)

(assert (=> b!1399087 m!1285877))

(declare-fun m!1285879 () Bool)

(assert (=> b!1399088 m!1285879))

(declare-fun m!1285881 () Bool)

(assert (=> start!120200 m!1285881))

(declare-fun m!1285883 () Bool)

(assert (=> start!120200 m!1285883))

(declare-fun m!1285885 () Bool)

(assert (=> b!1399092 m!1285885))

(assert (=> b!1399092 m!1285871))

(assert (=> b!1399092 m!1285885))

(declare-fun m!1285887 () Bool)

(assert (=> b!1399092 m!1285887))

(declare-fun m!1285889 () Bool)

(assert (=> b!1399092 m!1285889))

(declare-fun m!1285891 () Bool)

(assert (=> b!1399095 m!1285891))

(declare-fun m!1285893 () Bool)

(assert (=> b!1399093 m!1285893))

(assert (=> b!1399093 m!1285893))

(declare-fun m!1285895 () Bool)

(assert (=> b!1399093 m!1285895))

(assert (=> b!1399089 m!1285861))

(assert (=> b!1399089 m!1285861))

(declare-fun m!1285897 () Bool)

(assert (=> b!1399089 m!1285897))

(check-sat (not b!1399087) (not b!1399091) (not b!1399092) (not b!1399089) (not start!120200) (not b!1399093) (not b!1399088) (not b!1399095) (not b!1399094))
(check-sat)
