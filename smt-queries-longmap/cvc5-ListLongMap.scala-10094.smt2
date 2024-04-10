; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118992 () Bool)

(assert start!118992)

(declare-fun b!1388965 () Bool)

(declare-fun res!929199 () Bool)

(declare-fun e!786811 () Bool)

(assert (=> b!1388965 (=> (not res!929199) (not e!786811))))

(declare-datatypes ((array!94989 0))(
  ( (array!94990 (arr!45863 (Array (_ BitVec 32) (_ BitVec 64))) (size!46413 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94989)

(declare-datatypes ((List!32382 0))(
  ( (Nil!32379) (Cons!32378 (h!33593 (_ BitVec 64)) (t!47076 List!32382)) )
))
(declare-fun arrayNoDuplicates!0 (array!94989 (_ BitVec 32) List!32382) Bool)

(assert (=> b!1388965 (= res!929199 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32379))))

(declare-fun b!1388966 () Bool)

(declare-fun res!929200 () Bool)

(assert (=> b!1388966 (=> (not res!929200) (not e!786811))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94989 (_ BitVec 32)) Bool)

(assert (=> b!1388966 (= res!929200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388967 () Bool)

(declare-fun res!929196 () Bool)

(assert (=> b!1388967 (=> (not res!929196) (not e!786811))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388967 (= res!929196 (and (= (size!46413 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46413 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46413 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!929195 () Bool)

(assert (=> start!118992 (=> (not res!929195) (not e!786811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118992 (= res!929195 (validMask!0 mask!2840))))

(assert (=> start!118992 e!786811))

(assert (=> start!118992 true))

(declare-fun array_inv!34891 (array!94989) Bool)

(assert (=> start!118992 (array_inv!34891 a!2901)))

(declare-fun b!1388968 () Bool)

(declare-fun res!929198 () Bool)

(assert (=> b!1388968 (=> (not res!929198) (not e!786811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388968 (= res!929198 (validKeyInArray!0 (select (arr!45863 a!2901) j!112)))))

(declare-fun b!1388969 () Bool)

(assert (=> b!1388969 (= e!786811 (and (bvsge mask!2840 #b00000000000000000000000000000000) (bvsgt mask!2840 #b00111111111111111111111111111111)))))

(declare-fun b!1388970 () Bool)

(declare-fun res!929197 () Bool)

(assert (=> b!1388970 (=> (not res!929197) (not e!786811))))

(assert (=> b!1388970 (= res!929197 (validKeyInArray!0 (select (arr!45863 a!2901) i!1037)))))

(assert (= (and start!118992 res!929195) b!1388967))

(assert (= (and b!1388967 res!929196) b!1388970))

(assert (= (and b!1388970 res!929197) b!1388968))

(assert (= (and b!1388968 res!929198) b!1388966))

(assert (= (and b!1388966 res!929200) b!1388965))

(assert (= (and b!1388965 res!929199) b!1388969))

(declare-fun m!1274679 () Bool)

(assert (=> b!1388966 m!1274679))

(declare-fun m!1274681 () Bool)

(assert (=> b!1388965 m!1274681))

(declare-fun m!1274683 () Bool)

(assert (=> b!1388968 m!1274683))

(assert (=> b!1388968 m!1274683))

(declare-fun m!1274685 () Bool)

(assert (=> b!1388968 m!1274685))

(declare-fun m!1274687 () Bool)

(assert (=> start!118992 m!1274687))

(declare-fun m!1274689 () Bool)

(assert (=> start!118992 m!1274689))

(declare-fun m!1274691 () Bool)

(assert (=> b!1388970 m!1274691))

(assert (=> b!1388970 m!1274691))

(declare-fun m!1274693 () Bool)

(assert (=> b!1388970 m!1274693))

(push 1)

(assert (not start!118992))

(assert (not b!1388968))

(assert (not b!1388965))

(assert (not b!1388966))

(assert (not b!1388970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1389040 () Bool)

(declare-fun e!786853 () Bool)

(declare-fun e!786852 () Bool)

(assert (=> b!1389040 (= e!786853 e!786852)))

(declare-fun lt!610458 () (_ BitVec 64))

(assert (=> b!1389040 (= lt!610458 (select (arr!45863 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46424 0))(
  ( (Unit!46425) )
))
(declare-fun lt!610457 () Unit!46424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94989 (_ BitVec 64) (_ BitVec 32)) Unit!46424)

(assert (=> b!1389040 (= lt!610457 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610458 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1389040 (arrayContainsKey!0 a!2901 lt!610458 #b00000000000000000000000000000000)))

(declare-fun lt!610456 () Unit!46424)

(assert (=> b!1389040 (= lt!610456 lt!610457)))

(declare-fun res!929257 () Bool)

(declare-datatypes ((SeekEntryResult!10195 0))(
  ( (MissingZero!10195 (index!43151 (_ BitVec 32))) (Found!10195 (index!43152 (_ BitVec 32))) (Intermediate!10195 (undefined!11007 Bool) (index!43153 (_ BitVec 32)) (x!124806 (_ BitVec 32))) (Undefined!10195) (MissingVacant!10195 (index!43154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94989 (_ BitVec 32)) SeekEntryResult!10195)

(assert (=> b!1389040 (= res!929257 (= (seekEntryOrOpen!0 (select (arr!45863 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10195 #b00000000000000000000000000000000)))))

(assert (=> b!1389040 (=> (not res!929257) (not e!786852))))

(declare-fun b!1389041 () Bool)

(declare-fun e!786851 () Bool)

(assert (=> b!1389041 (= e!786851 e!786853)))

(declare-fun c!129335 () Bool)

(assert (=> b!1389041 (= c!129335 (validKeyInArray!0 (select (arr!45863 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150075 () Bool)

(declare-fun res!929256 () Bool)

(assert (=> d!150075 (=> res!929256 e!786851)))

(assert (=> d!150075 (= res!929256 (bvsge #b00000000000000000000000000000000 (size!46413 a!2901)))))

(assert (=> d!150075 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786851)))

(declare-fun bm!66666 () Bool)

(declare-fun call!66669 () Bool)

(assert (=> bm!66666 (= call!66669 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1389042 () Bool)

(assert (=> b!1389042 (= e!786853 call!66669)))

(declare-fun b!1389043 () Bool)

(assert (=> b!1389043 (= e!786852 call!66669)))

(assert (= (and d!150075 (not res!929256)) b!1389041))

(assert (= (and b!1389041 c!129335) b!1389040))

(assert (= (and b!1389041 (not c!129335)) b!1389042))

(assert (= (and b!1389040 res!929257) b!1389043))

(assert (= (or b!1389043 b!1389042) bm!66666))

(declare-fun m!1274735 () Bool)

(assert (=> b!1389040 m!1274735))

(declare-fun m!1274737 () Bool)

(assert (=> b!1389040 m!1274737))

(declare-fun m!1274739 () Bool)

(assert (=> b!1389040 m!1274739))

(assert (=> b!1389040 m!1274735))

(declare-fun m!1274741 () Bool)

(assert (=> b!1389040 m!1274741))

(assert (=> b!1389041 m!1274735))

(assert (=> b!1389041 m!1274735))

(declare-fun m!1274743 () Bool)

(assert (=> b!1389041 m!1274743))

(declare-fun m!1274745 () Bool)

(assert (=> bm!66666 m!1274745))

(assert (=> b!1388966 d!150075))

(declare-fun b!1389067 () Bool)

(declare-fun e!786872 () Bool)

(declare-fun e!786873 () Bool)

(assert (=> b!1389067 (= e!786872 e!786873)))

(declare-fun c!129341 () Bool)

(assert (=> b!1389067 (= c!129341 (validKeyInArray!0 (select (arr!45863 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66672 () Bool)

(declare-fun call!66675 () Bool)

(assert (=> bm!66672 (= call!66675 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129341 (Cons!32378 (select (arr!45863 a!2901) #b00000000000000000000000000000000) Nil!32379) Nil!32379)))))

(declare-fun b!1389068 () Bool)

(declare-fun e!786875 () Bool)

(assert (=> b!1389068 (= e!786875 e!786872)))

(declare-fun res!929271 () Bool)

(assert (=> b!1389068 (=> (not res!929271) (not e!786872))))

(declare-fun e!786874 () Bool)

(assert (=> b!1389068 (= res!929271 (not e!786874))))

(declare-fun res!929273 () Bool)

(assert (=> b!1389068 (=> (not res!929273) (not e!786874))))

(assert (=> b!1389068 (= res!929273 (validKeyInArray!0 (select (arr!45863 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389069 () Bool)

(assert (=> b!1389069 (= e!786873 call!66675)))

(declare-fun b!1389071 () Bool)

(declare-fun contains!9758 (List!32382 (_ BitVec 64)) Bool)

(assert (=> b!1389071 (= e!786874 (contains!9758 Nil!32379 (select (arr!45863 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150087 () Bool)

(declare-fun res!929272 () Bool)

(assert (=> d!150087 (=> res!929272 e!786875)))

(assert (=> d!150087 (= res!929272 (bvsge #b00000000000000000000000000000000 (size!46413 a!2901)))))

(assert (=> d!150087 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32379) e!786875)))

(declare-fun b!1389070 () Bool)

