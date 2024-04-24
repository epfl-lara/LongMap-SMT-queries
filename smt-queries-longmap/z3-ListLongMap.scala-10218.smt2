; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120548 () Bool)

(assert start!120548)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95879 0))(
  ( (array!95880 (arr!46288 (Array (_ BitVec 32) (_ BitVec 64))) (size!46839 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95879)

(declare-fun lt!616972 () (_ BitVec 64))

(declare-fun b!1402088 () Bool)

(declare-fun e!793959 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10508 0))(
  ( (MissingZero!10508 (index!44409 (_ BitVec 32))) (Found!10508 (index!44410 (_ BitVec 32))) (Intermediate!10508 (undefined!11320 Bool) (index!44411 (_ BitVec 32)) (x!126202 (_ BitVec 32))) (Undefined!10508) (MissingVacant!10508 (index!44412 (_ BitVec 32))) )
))
(declare-fun lt!616979 () SeekEntryResult!10508)

(declare-fun lt!616974 () array!95879)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95879 (_ BitVec 32)) SeekEntryResult!10508)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95879 (_ BitVec 32)) SeekEntryResult!10508)

(assert (=> b!1402088 (= e!793959 (= (seekEntryOrOpen!0 lt!616972 lt!616974 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126202 lt!616979) (index!44411 lt!616979) (index!44411 lt!616979) (select (arr!46288 a!2901) j!112) lt!616974 mask!2840)))))

(declare-fun b!1402089 () Bool)

(declare-fun e!793961 () Bool)

(declare-fun e!793963 () Bool)

(assert (=> b!1402089 (= e!793961 (not e!793963))))

(declare-fun res!939925 () Bool)

(assert (=> b!1402089 (=> res!939925 e!793963)))

(declare-fun lt!616976 () SeekEntryResult!10508)

(get-info :version)

(assert (=> b!1402089 (= res!939925 (or (not ((_ is Intermediate!10508) lt!616976)) (undefined!11320 lt!616976)))))

(declare-fun e!793960 () Bool)

(assert (=> b!1402089 e!793960))

(declare-fun res!939916 () Bool)

(assert (=> b!1402089 (=> (not res!939916) (not e!793960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95879 (_ BitVec 32)) Bool)

(assert (=> b!1402089 (= res!939916 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47047 0))(
  ( (Unit!47048) )
))
(declare-fun lt!616975 () Unit!47047)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47047)

(assert (=> b!1402089 (= lt!616975 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616973 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95879 (_ BitVec 32)) SeekEntryResult!10508)

(assert (=> b!1402089 (= lt!616976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616973 (select (arr!46288 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402089 (= lt!616973 (toIndex!0 (select (arr!46288 a!2901) j!112) mask!2840))))

(declare-fun b!1402091 () Bool)

(declare-fun res!939915 () Bool)

(assert (=> b!1402091 (=> (not res!939915) (not e!793961))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402091 (= res!939915 (validKeyInArray!0 (select (arr!46288 a!2901) i!1037)))))

(declare-fun b!1402092 () Bool)

(declare-fun e!793962 () Bool)

(assert (=> b!1402092 (= e!793963 e!793962)))

(declare-fun res!939920 () Bool)

(assert (=> b!1402092 (=> res!939920 e!793962)))

(assert (=> b!1402092 (= res!939920 (or (= lt!616976 lt!616979) (not ((_ is Intermediate!10508) lt!616979))))))

(assert (=> b!1402092 (= lt!616979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616972 mask!2840) lt!616972 lt!616974 mask!2840))))

(assert (=> b!1402092 (= lt!616972 (select (store (arr!46288 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402092 (= lt!616974 (array!95880 (store (arr!46288 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46839 a!2901)))))

(declare-fun b!1402093 () Bool)

(declare-fun res!939924 () Bool)

(assert (=> b!1402093 (=> (not res!939924) (not e!793961))))

(assert (=> b!1402093 (= res!939924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402094 () Bool)

(assert (=> b!1402094 (= e!793960 (= (seekEntryOrOpen!0 (select (arr!46288 a!2901) j!112) a!2901 mask!2840) (Found!10508 j!112)))))

(declare-fun b!1402095 () Bool)

(declare-fun res!939921 () Bool)

(assert (=> b!1402095 (=> (not res!939921) (not e!793961))))

(declare-datatypes ((List!32794 0))(
  ( (Nil!32791) (Cons!32790 (h!34046 (_ BitVec 64)) (t!47480 List!32794)) )
))
(declare-fun arrayNoDuplicates!0 (array!95879 (_ BitVec 32) List!32794) Bool)

(assert (=> b!1402095 (= res!939921 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32791))))

(declare-fun b!1402096 () Bool)

(declare-fun e!793958 () Bool)

(assert (=> b!1402096 (= e!793962 e!793958)))

(declare-fun res!939923 () Bool)

(assert (=> b!1402096 (=> res!939923 e!793958)))

(assert (=> b!1402096 (= res!939923 (or (bvslt (x!126202 lt!616976) #b00000000000000000000000000000000) (bvsgt (x!126202 lt!616976) #b01111111111111111111111111111110) (bvslt (x!126202 lt!616979) #b00000000000000000000000000000000) (bvsgt (x!126202 lt!616979) #b01111111111111111111111111111110) (bvslt lt!616973 #b00000000000000000000000000000000) (bvsge lt!616973 (size!46839 a!2901)) (bvslt (index!44411 lt!616976) #b00000000000000000000000000000000) (bvsge (index!44411 lt!616976) (size!46839 a!2901)) (bvslt (index!44411 lt!616979) #b00000000000000000000000000000000) (bvsge (index!44411 lt!616979) (size!46839 a!2901)) (not (= lt!616976 (Intermediate!10508 false (index!44411 lt!616976) (x!126202 lt!616976)))) (not (= lt!616979 (Intermediate!10508 false (index!44411 lt!616979) (x!126202 lt!616979))))))))

(assert (=> b!1402096 e!793959))

(declare-fun res!939919 () Bool)

(assert (=> b!1402096 (=> (not res!939919) (not e!793959))))

(assert (=> b!1402096 (= res!939919 (and (not (undefined!11320 lt!616979)) (= (index!44411 lt!616979) i!1037) (bvslt (x!126202 lt!616979) (x!126202 lt!616976)) (= (select (store (arr!46288 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44411 lt!616979)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616977 () Unit!47047)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47047)

(assert (=> b!1402096 (= lt!616977 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616973 (x!126202 lt!616976) (index!44411 lt!616976) (x!126202 lt!616979) (index!44411 lt!616979) (undefined!11320 lt!616979) mask!2840))))

(declare-fun b!1402097 () Bool)

(declare-fun res!939917 () Bool)

(assert (=> b!1402097 (=> (not res!939917) (not e!793961))))

(assert (=> b!1402097 (= res!939917 (and (= (size!46839 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46839 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46839 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402098 () Bool)

(assert (=> b!1402098 (= e!793958 true)))

(declare-fun lt!616978 () SeekEntryResult!10508)

(assert (=> b!1402098 (= lt!616978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616973 lt!616972 lt!616974 mask!2840))))

(declare-fun res!939922 () Bool)

(assert (=> start!120548 (=> (not res!939922) (not e!793961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120548 (= res!939922 (validMask!0 mask!2840))))

(assert (=> start!120548 e!793961))

(assert (=> start!120548 true))

(declare-fun array_inv!35569 (array!95879) Bool)

(assert (=> start!120548 (array_inv!35569 a!2901)))

(declare-fun b!1402090 () Bool)

(declare-fun res!939918 () Bool)

(assert (=> b!1402090 (=> (not res!939918) (not e!793961))))

(assert (=> b!1402090 (= res!939918 (validKeyInArray!0 (select (arr!46288 a!2901) j!112)))))

(assert (= (and start!120548 res!939922) b!1402097))

(assert (= (and b!1402097 res!939917) b!1402091))

(assert (= (and b!1402091 res!939915) b!1402090))

(assert (= (and b!1402090 res!939918) b!1402093))

(assert (= (and b!1402093 res!939924) b!1402095))

(assert (= (and b!1402095 res!939921) b!1402089))

(assert (= (and b!1402089 res!939916) b!1402094))

(assert (= (and b!1402089 (not res!939925)) b!1402092))

(assert (= (and b!1402092 (not res!939920)) b!1402096))

(assert (= (and b!1402096 res!939919) b!1402088))

(assert (= (and b!1402096 (not res!939923)) b!1402098))

(declare-fun m!1289941 () Bool)

(assert (=> b!1402095 m!1289941))

(declare-fun m!1289943 () Bool)

(assert (=> b!1402096 m!1289943))

(declare-fun m!1289945 () Bool)

(assert (=> b!1402096 m!1289945))

(declare-fun m!1289947 () Bool)

(assert (=> b!1402096 m!1289947))

(declare-fun m!1289949 () Bool)

(assert (=> b!1402088 m!1289949))

(declare-fun m!1289951 () Bool)

(assert (=> b!1402088 m!1289951))

(assert (=> b!1402088 m!1289951))

(declare-fun m!1289953 () Bool)

(assert (=> b!1402088 m!1289953))

(assert (=> b!1402089 m!1289951))

(declare-fun m!1289955 () Bool)

(assert (=> b!1402089 m!1289955))

(assert (=> b!1402089 m!1289951))

(declare-fun m!1289957 () Bool)

(assert (=> b!1402089 m!1289957))

(assert (=> b!1402089 m!1289951))

(declare-fun m!1289959 () Bool)

(assert (=> b!1402089 m!1289959))

(declare-fun m!1289961 () Bool)

(assert (=> b!1402089 m!1289961))

(assert (=> b!1402094 m!1289951))

(assert (=> b!1402094 m!1289951))

(declare-fun m!1289963 () Bool)

(assert (=> b!1402094 m!1289963))

(declare-fun m!1289965 () Bool)

(assert (=> start!120548 m!1289965))

(declare-fun m!1289967 () Bool)

(assert (=> start!120548 m!1289967))

(declare-fun m!1289969 () Bool)

(assert (=> b!1402092 m!1289969))

(assert (=> b!1402092 m!1289969))

(declare-fun m!1289971 () Bool)

(assert (=> b!1402092 m!1289971))

(assert (=> b!1402092 m!1289943))

(declare-fun m!1289973 () Bool)

(assert (=> b!1402092 m!1289973))

(declare-fun m!1289975 () Bool)

(assert (=> b!1402091 m!1289975))

(assert (=> b!1402091 m!1289975))

(declare-fun m!1289977 () Bool)

(assert (=> b!1402091 m!1289977))

(assert (=> b!1402090 m!1289951))

(assert (=> b!1402090 m!1289951))

(declare-fun m!1289979 () Bool)

(assert (=> b!1402090 m!1289979))

(declare-fun m!1289981 () Bool)

(assert (=> b!1402098 m!1289981))

(declare-fun m!1289983 () Bool)

(assert (=> b!1402093 m!1289983))

(check-sat (not b!1402088) (not b!1402091) (not b!1402096) (not b!1402092) (not b!1402094) (not b!1402089) (not b!1402093) (not b!1402095) (not b!1402098) (not b!1402090) (not start!120548))
(check-sat)
