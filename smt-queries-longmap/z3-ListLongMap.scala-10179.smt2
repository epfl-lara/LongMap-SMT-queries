; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120188 () Bool)

(assert start!120188)

(declare-fun b!1398100 () Bool)

(declare-fun res!936334 () Bool)

(declare-fun e!791605 () Bool)

(assert (=> b!1398100 (=> (not res!936334) (not e!791605))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95639 0))(
  ( (array!95640 (arr!46171 (Array (_ BitVec 32) (_ BitVec 64))) (size!46722 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95639)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398100 (= res!936334 (and (= (size!46722 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46722 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46722 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398101 () Bool)

(declare-fun e!791603 () Bool)

(declare-datatypes ((SeekEntryResult!10391 0))(
  ( (MissingZero!10391 (index!43935 (_ BitVec 32))) (Found!10391 (index!43936 (_ BitVec 32))) (Intermediate!10391 (undefined!11203 Bool) (index!43937 (_ BitVec 32)) (x!125752 (_ BitVec 32))) (Undefined!10391) (MissingVacant!10391 (index!43938 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95639 (_ BitVec 32)) SeekEntryResult!10391)

(assert (=> b!1398101 (= e!791603 (= (seekEntryOrOpen!0 (select (arr!46171 a!2901) j!112) a!2901 mask!2840) (Found!10391 j!112)))))

(declare-fun b!1398103 () Bool)

(declare-fun res!936331 () Bool)

(assert (=> b!1398103 (=> (not res!936331) (not e!791605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398103 (= res!936331 (validKeyInArray!0 (select (arr!46171 a!2901) i!1037)))))

(declare-fun b!1398104 () Bool)

(declare-fun e!791604 () Bool)

(assert (=> b!1398104 (= e!791605 (not e!791604))))

(declare-fun res!936337 () Bool)

(assert (=> b!1398104 (=> res!936337 e!791604)))

(declare-fun lt!614228 () SeekEntryResult!10391)

(get-info :version)

(assert (=> b!1398104 (= res!936337 (or (not ((_ is Intermediate!10391) lt!614228)) (undefined!11203 lt!614228)))))

(assert (=> b!1398104 e!791603))

(declare-fun res!936333 () Bool)

(assert (=> b!1398104 (=> (not res!936333) (not e!791603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95639 (_ BitVec 32)) Bool)

(assert (=> b!1398104 (= res!936333 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46813 0))(
  ( (Unit!46814) )
))
(declare-fun lt!614231 () Unit!46813)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46813)

(assert (=> b!1398104 (= lt!614231 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614234 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95639 (_ BitVec 32)) SeekEntryResult!10391)

(assert (=> b!1398104 (= lt!614228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614234 (select (arr!46171 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398104 (= lt!614234 (toIndex!0 (select (arr!46171 a!2901) j!112) mask!2840))))

(declare-fun b!1398105 () Bool)

(declare-fun e!791602 () Bool)

(assert (=> b!1398105 (= e!791602 true)))

(declare-fun lt!614232 () (_ BitVec 64))

(declare-fun lt!614233 () SeekEntryResult!10391)

(declare-fun lt!614230 () array!95639)

(assert (=> b!1398105 (= lt!614233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614234 lt!614232 lt!614230 mask!2840))))

(declare-fun b!1398106 () Bool)

(declare-fun res!936329 () Bool)

(assert (=> b!1398106 (=> (not res!936329) (not e!791605))))

(assert (=> b!1398106 (= res!936329 (validKeyInArray!0 (select (arr!46171 a!2901) j!112)))))

(declare-fun b!1398107 () Bool)

(assert (=> b!1398107 (= e!791604 e!791602)))

(declare-fun res!936330 () Bool)

(assert (=> b!1398107 (=> res!936330 e!791602)))

(declare-fun lt!614229 () SeekEntryResult!10391)

(assert (=> b!1398107 (= res!936330 (or (= lt!614228 lt!614229) (not ((_ is Intermediate!10391) lt!614229)) (bvslt (x!125752 lt!614228) #b00000000000000000000000000000000) (bvsgt (x!125752 lt!614228) #b01111111111111111111111111111110) (bvslt lt!614234 #b00000000000000000000000000000000) (bvsge lt!614234 (size!46722 a!2901)) (bvslt (index!43937 lt!614228) #b00000000000000000000000000000000) (bvsge (index!43937 lt!614228) (size!46722 a!2901)) (not (= lt!614228 (Intermediate!10391 false (index!43937 lt!614228) (x!125752 lt!614228)))) (not (= lt!614229 (Intermediate!10391 (undefined!11203 lt!614229) (index!43937 lt!614229) (x!125752 lt!614229))))))))

(assert (=> b!1398107 (= lt!614229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614232 mask!2840) lt!614232 lt!614230 mask!2840))))

(assert (=> b!1398107 (= lt!614232 (select (store (arr!46171 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398107 (= lt!614230 (array!95640 (store (arr!46171 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46722 a!2901)))))

(declare-fun b!1398108 () Bool)

(declare-fun res!936335 () Bool)

(assert (=> b!1398108 (=> (not res!936335) (not e!791605))))

(declare-datatypes ((List!32677 0))(
  ( (Nil!32674) (Cons!32673 (h!33923 (_ BitVec 64)) (t!47363 List!32677)) )
))
(declare-fun arrayNoDuplicates!0 (array!95639 (_ BitVec 32) List!32677) Bool)

(assert (=> b!1398108 (= res!936335 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32674))))

(declare-fun res!936332 () Bool)

(assert (=> start!120188 (=> (not res!936332) (not e!791605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120188 (= res!936332 (validMask!0 mask!2840))))

(assert (=> start!120188 e!791605))

(assert (=> start!120188 true))

(declare-fun array_inv!35452 (array!95639) Bool)

(assert (=> start!120188 (array_inv!35452 a!2901)))

(declare-fun b!1398102 () Bool)

(declare-fun res!936336 () Bool)

(assert (=> b!1398102 (=> (not res!936336) (not e!791605))))

(assert (=> b!1398102 (= res!936336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120188 res!936332) b!1398100))

(assert (= (and b!1398100 res!936334) b!1398103))

(assert (= (and b!1398103 res!936331) b!1398106))

(assert (= (and b!1398106 res!936329) b!1398102))

(assert (= (and b!1398102 res!936336) b!1398108))

(assert (= (and b!1398108 res!936335) b!1398104))

(assert (= (and b!1398104 res!936333) b!1398101))

(assert (= (and b!1398104 (not res!936337)) b!1398107))

(assert (= (and b!1398107 (not res!936330)) b!1398105))

(declare-fun m!1284943 () Bool)

(assert (=> b!1398101 m!1284943))

(assert (=> b!1398101 m!1284943))

(declare-fun m!1284945 () Bool)

(assert (=> b!1398101 m!1284945))

(declare-fun m!1284947 () Bool)

(assert (=> start!120188 m!1284947))

(declare-fun m!1284949 () Bool)

(assert (=> start!120188 m!1284949))

(declare-fun m!1284951 () Bool)

(assert (=> b!1398103 m!1284951))

(assert (=> b!1398103 m!1284951))

(declare-fun m!1284953 () Bool)

(assert (=> b!1398103 m!1284953))

(declare-fun m!1284955 () Bool)

(assert (=> b!1398107 m!1284955))

(assert (=> b!1398107 m!1284955))

(declare-fun m!1284957 () Bool)

(assert (=> b!1398107 m!1284957))

(declare-fun m!1284959 () Bool)

(assert (=> b!1398107 m!1284959))

(declare-fun m!1284961 () Bool)

(assert (=> b!1398107 m!1284961))

(declare-fun m!1284963 () Bool)

(assert (=> b!1398108 m!1284963))

(assert (=> b!1398106 m!1284943))

(assert (=> b!1398106 m!1284943))

(declare-fun m!1284965 () Bool)

(assert (=> b!1398106 m!1284965))

(declare-fun m!1284967 () Bool)

(assert (=> b!1398105 m!1284967))

(assert (=> b!1398104 m!1284943))

(declare-fun m!1284969 () Bool)

(assert (=> b!1398104 m!1284969))

(assert (=> b!1398104 m!1284943))

(assert (=> b!1398104 m!1284943))

(declare-fun m!1284971 () Bool)

(assert (=> b!1398104 m!1284971))

(declare-fun m!1284973 () Bool)

(assert (=> b!1398104 m!1284973))

(declare-fun m!1284975 () Bool)

(assert (=> b!1398104 m!1284975))

(declare-fun m!1284977 () Bool)

(assert (=> b!1398102 m!1284977))

(check-sat (not b!1398103) (not b!1398102) (not b!1398105) (not b!1398106) (not b!1398107) (not b!1398101) (not b!1398108) (not b!1398104) (not start!120188))
(check-sat)
