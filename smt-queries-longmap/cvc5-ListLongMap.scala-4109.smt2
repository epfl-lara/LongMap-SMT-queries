; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56152 () Bool)

(assert start!56152)

(declare-fun res!400177 () Bool)

(declare-fun e!356176 () Bool)

(assert (=> start!56152 (=> (not res!400177) (not e!356176))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56152 (= res!400177 (validMask!0 mask!3053))))

(assert (=> start!56152 e!356176))

(assert (=> start!56152 true))

(declare-datatypes ((array!37622 0))(
  ( (array!37623 (arr!18057 (Array (_ BitVec 32) (_ BitVec 64))) (size!18421 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37622)

(declare-fun array_inv!13853 (array!37622) Bool)

(assert (=> start!56152 (array_inv!13853 a!2986)))

(declare-fun b!620985 () Bool)

(declare-fun e!356177 () Bool)

(assert (=> b!620985 (= e!356176 e!356177)))

(declare-fun res!400170 () Bool)

(assert (=> b!620985 (=> (not res!400170) (not e!356177))))

(declare-datatypes ((SeekEntryResult!6497 0))(
  ( (MissingZero!6497 (index!28272 (_ BitVec 32))) (Found!6497 (index!28273 (_ BitVec 32))) (Intermediate!6497 (undefined!7309 Bool) (index!28274 (_ BitVec 32)) (x!57049 (_ BitVec 32))) (Undefined!6497) (MissingVacant!6497 (index!28275 (_ BitVec 32))) )
))
(declare-fun lt!287184 () SeekEntryResult!6497)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!620985 (= res!400170 (or (= lt!287184 (MissingZero!6497 i!1108)) (= lt!287184 (MissingVacant!6497 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37622 (_ BitVec 32)) SeekEntryResult!6497)

(assert (=> b!620985 (= lt!287184 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!620986 () Bool)

(declare-datatypes ((Unit!20698 0))(
  ( (Unit!20699) )
))
(declare-fun e!356178 () Unit!20698)

(declare-fun Unit!20700 () Unit!20698)

(assert (=> b!620986 (= e!356178 Unit!20700)))

(declare-fun b!620987 () Bool)

(declare-fun e!356172 () Unit!20698)

(declare-fun Unit!20701 () Unit!20698)

(assert (=> b!620987 (= e!356172 Unit!20701)))

(assert (=> b!620987 false))

(declare-fun b!620988 () Bool)

(declare-fun e!356170 () Unit!20698)

(declare-fun Unit!20702 () Unit!20698)

(assert (=> b!620988 (= e!356170 Unit!20702)))

(declare-fun b!620989 () Bool)

(declare-fun res!400164 () Bool)

(assert (=> b!620989 (=> (not res!400164) (not e!356177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37622 (_ BitVec 32)) Bool)

(assert (=> b!620989 (= res!400164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620990 () Bool)

(declare-fun Unit!20703 () Unit!20698)

(assert (=> b!620990 (= e!356178 Unit!20703)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun res!400171 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!620990 (= res!400171 (= (select (store (arr!18057 a!2986) i!1108 k!1786) index!984) (select (arr!18057 a!2986) j!136)))))

(declare-fun e!356173 () Bool)

(assert (=> b!620990 (=> (not res!400171) (not e!356173))))

(assert (=> b!620990 e!356173))

(declare-fun c!70778 () Bool)

(assert (=> b!620990 (= c!70778 (bvslt j!136 index!984))))

(declare-fun lt!287190 () Unit!20698)

(assert (=> b!620990 (= lt!287190 e!356170)))

(declare-fun c!70781 () Bool)

(assert (=> b!620990 (= c!70781 (bvslt index!984 j!136))))

(declare-fun lt!287193 () Unit!20698)

(declare-fun e!356166 () Unit!20698)

(assert (=> b!620990 (= lt!287193 e!356166)))

(assert (=> b!620990 false))

(declare-fun b!620991 () Bool)

(declare-fun res!400166 () Bool)

(assert (=> b!620991 (=> (not res!400166) (not e!356176))))

(declare-fun arrayContainsKey!0 (array!37622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620991 (= res!400166 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620992 () Bool)

(assert (=> b!620992 false))

(declare-fun lt!287195 () Unit!20698)

(declare-fun lt!287194 () array!37622)

(declare-datatypes ((List!12098 0))(
  ( (Nil!12095) (Cons!12094 (h!13139 (_ BitVec 64)) (t!18326 List!12098)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37622 (_ BitVec 64) (_ BitVec 32) List!12098) Unit!20698)

(assert (=> b!620992 (= lt!287195 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287194 (select (arr!18057 a!2986) j!136) index!984 Nil!12095))))

(declare-fun arrayNoDuplicates!0 (array!37622 (_ BitVec 32) List!12098) Bool)

(assert (=> b!620992 (arrayNoDuplicates!0 lt!287194 index!984 Nil!12095)))

(declare-fun lt!287197 () Unit!20698)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37622 (_ BitVec 32) (_ BitVec 32)) Unit!20698)

(assert (=> b!620992 (= lt!287197 (lemmaNoDuplicateFromThenFromBigger!0 lt!287194 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620992 (arrayNoDuplicates!0 lt!287194 #b00000000000000000000000000000000 Nil!12095)))

(declare-fun lt!287180 () Unit!20698)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37622 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12098) Unit!20698)

(assert (=> b!620992 (= lt!287180 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12095))))

(assert (=> b!620992 (arrayContainsKey!0 lt!287194 (select (arr!18057 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287189 () Unit!20698)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37622 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20698)

(assert (=> b!620992 (= lt!287189 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287194 (select (arr!18057 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356175 () Bool)

(assert (=> b!620992 e!356175))

(declare-fun res!400174 () Bool)

(assert (=> b!620992 (=> (not res!400174) (not e!356175))))

(assert (=> b!620992 (= res!400174 (arrayContainsKey!0 lt!287194 (select (arr!18057 a!2986) j!136) j!136))))

(declare-fun Unit!20704 () Unit!20698)

(assert (=> b!620992 (= e!356166 Unit!20704)))

(declare-fun b!620993 () Bool)

(assert (=> b!620993 (= e!356175 (arrayContainsKey!0 lt!287194 (select (arr!18057 a!2986) j!136) index!984))))

(declare-fun b!620994 () Bool)

(declare-fun e!356169 () Bool)

(declare-fun e!356168 () Bool)

(assert (=> b!620994 (= e!356169 e!356168)))

(declare-fun res!400163 () Bool)

(assert (=> b!620994 (=> (not res!400163) (not e!356168))))

(declare-fun lt!287191 () SeekEntryResult!6497)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!620994 (= res!400163 (and (= lt!287191 (Found!6497 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18057 a!2986) index!984) (select (arr!18057 a!2986) j!136))) (not (= (select (arr!18057 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37622 (_ BitVec 32)) SeekEntryResult!6497)

(assert (=> b!620994 (= lt!287191 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18057 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620995 () Bool)

(declare-fun res!400169 () Bool)

(assert (=> b!620995 (=> (not res!400169) (not e!356176))))

(assert (=> b!620995 (= res!400169 (and (= (size!18421 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18421 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18421 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620996 () Bool)

(declare-fun res!400176 () Bool)

(assert (=> b!620996 (=> (not res!400176) (not e!356177))))

(assert (=> b!620996 (= res!400176 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18057 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620997 () Bool)

(declare-fun res!400168 () Bool)

(assert (=> b!620997 (=> (not res!400168) (not e!356177))))

(assert (=> b!620997 (= res!400168 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12095))))

(declare-fun b!620998 () Bool)

(assert (=> b!620998 (= e!356177 e!356169)))

(declare-fun res!400172 () Bool)

(assert (=> b!620998 (=> (not res!400172) (not e!356169))))

(assert (=> b!620998 (= res!400172 (= (select (store (arr!18057 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620998 (= lt!287194 (array!37623 (store (arr!18057 a!2986) i!1108 k!1786) (size!18421 a!2986)))))

(declare-fun b!620999 () Bool)

(declare-fun Unit!20705 () Unit!20698)

(assert (=> b!620999 (= e!356166 Unit!20705)))

(declare-fun e!356165 () Bool)

(declare-fun b!621000 () Bool)

(assert (=> b!621000 (= e!356165 (arrayContainsKey!0 lt!287194 (select (arr!18057 a!2986) j!136) index!984))))

(declare-fun b!621001 () Bool)

(assert (=> b!621001 (= e!356168 (not true))))

(declare-fun lt!287178 () Unit!20698)

(assert (=> b!621001 (= lt!287178 e!356178)))

(declare-fun c!70780 () Bool)

(declare-fun lt!287185 () SeekEntryResult!6497)

(assert (=> b!621001 (= c!70780 (= lt!287185 (Found!6497 index!984)))))

(declare-fun lt!287188 () Unit!20698)

(assert (=> b!621001 (= lt!287188 e!356172)))

(declare-fun c!70779 () Bool)

(assert (=> b!621001 (= c!70779 (= lt!287185 Undefined!6497))))

(declare-fun lt!287183 () (_ BitVec 64))

(assert (=> b!621001 (= lt!287185 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287183 lt!287194 mask!3053))))

(declare-fun e!356171 () Bool)

(assert (=> b!621001 e!356171))

(declare-fun res!400167 () Bool)

(assert (=> b!621001 (=> (not res!400167) (not e!356171))))

(declare-fun lt!287181 () SeekEntryResult!6497)

(declare-fun lt!287187 () (_ BitVec 32))

(assert (=> b!621001 (= res!400167 (= lt!287181 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287187 vacantSpotIndex!68 lt!287183 lt!287194 mask!3053)))))

(assert (=> b!621001 (= lt!287181 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287187 vacantSpotIndex!68 (select (arr!18057 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621001 (= lt!287183 (select (store (arr!18057 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!287196 () Unit!20698)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37622 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20698)

(assert (=> b!621001 (= lt!287196 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287187 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621001 (= lt!287187 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621002 () Bool)

(declare-fun res!400173 () Bool)

(assert (=> b!621002 (=> (not res!400173) (not e!356176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621002 (= res!400173 (validKeyInArray!0 k!1786))))

(declare-fun b!621003 () Bool)

(assert (=> b!621003 false))

(declare-fun lt!287182 () Unit!20698)

(assert (=> b!621003 (= lt!287182 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287194 (select (arr!18057 a!2986) j!136) j!136 Nil!12095))))

(assert (=> b!621003 (arrayNoDuplicates!0 lt!287194 j!136 Nil!12095)))

(declare-fun lt!287179 () Unit!20698)

(assert (=> b!621003 (= lt!287179 (lemmaNoDuplicateFromThenFromBigger!0 lt!287194 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621003 (arrayNoDuplicates!0 lt!287194 #b00000000000000000000000000000000 Nil!12095)))

(declare-fun lt!287186 () Unit!20698)

(assert (=> b!621003 (= lt!287186 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12095))))

(assert (=> b!621003 (arrayContainsKey!0 lt!287194 (select (arr!18057 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287192 () Unit!20698)

(assert (=> b!621003 (= lt!287192 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287194 (select (arr!18057 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20706 () Unit!20698)

(assert (=> b!621003 (= e!356170 Unit!20706)))

(declare-fun b!621004 () Bool)

(assert (=> b!621004 (= e!356171 (= lt!287191 lt!287181))))

(declare-fun res!400175 () Bool)

(declare-fun b!621005 () Bool)

(assert (=> b!621005 (= res!400175 (arrayContainsKey!0 lt!287194 (select (arr!18057 a!2986) j!136) j!136))))

(assert (=> b!621005 (=> (not res!400175) (not e!356165))))

(declare-fun e!356167 () Bool)

(assert (=> b!621005 (= e!356167 e!356165)))

(declare-fun b!621006 () Bool)

(declare-fun res!400165 () Bool)

(assert (=> b!621006 (= res!400165 (bvsge j!136 index!984))))

(assert (=> b!621006 (=> res!400165 e!356167)))

(assert (=> b!621006 (= e!356173 e!356167)))

(declare-fun b!621007 () Bool)

(declare-fun Unit!20707 () Unit!20698)

(assert (=> b!621007 (= e!356172 Unit!20707)))

(declare-fun b!621008 () Bool)

(declare-fun res!400178 () Bool)

(assert (=> b!621008 (=> (not res!400178) (not e!356176))))

(assert (=> b!621008 (= res!400178 (validKeyInArray!0 (select (arr!18057 a!2986) j!136)))))

(assert (= (and start!56152 res!400177) b!620995))

(assert (= (and b!620995 res!400169) b!621008))

(assert (= (and b!621008 res!400178) b!621002))

(assert (= (and b!621002 res!400173) b!620991))

(assert (= (and b!620991 res!400166) b!620985))

(assert (= (and b!620985 res!400170) b!620989))

(assert (= (and b!620989 res!400164) b!620997))

(assert (= (and b!620997 res!400168) b!620996))

(assert (= (and b!620996 res!400176) b!620998))

(assert (= (and b!620998 res!400172) b!620994))

(assert (= (and b!620994 res!400163) b!621001))

(assert (= (and b!621001 res!400167) b!621004))

(assert (= (and b!621001 c!70779) b!620987))

(assert (= (and b!621001 (not c!70779)) b!621007))

(assert (= (and b!621001 c!70780) b!620990))

(assert (= (and b!621001 (not c!70780)) b!620986))

(assert (= (and b!620990 res!400171) b!621006))

(assert (= (and b!621006 (not res!400165)) b!621005))

(assert (= (and b!621005 res!400175) b!621000))

(assert (= (and b!620990 c!70778) b!621003))

(assert (= (and b!620990 (not c!70778)) b!620988))

(assert (= (and b!620990 c!70781) b!620992))

(assert (= (and b!620990 (not c!70781)) b!620999))

(assert (= (and b!620992 res!400174) b!620993))

(declare-fun m!596891 () Bool)

(assert (=> b!621002 m!596891))

(declare-fun m!596893 () Bool)

(assert (=> b!620985 m!596893))

(declare-fun m!596895 () Bool)

(assert (=> b!620996 m!596895))

(declare-fun m!596897 () Bool)

(assert (=> b!621005 m!596897))

(assert (=> b!621005 m!596897))

(declare-fun m!596899 () Bool)

(assert (=> b!621005 m!596899))

(declare-fun m!596901 () Bool)

(assert (=> b!620994 m!596901))

(assert (=> b!620994 m!596897))

(assert (=> b!620994 m!596897))

(declare-fun m!596903 () Bool)

(assert (=> b!620994 m!596903))

(declare-fun m!596905 () Bool)

(assert (=> b!620997 m!596905))

(assert (=> b!621000 m!596897))

(assert (=> b!621000 m!596897))

(declare-fun m!596907 () Bool)

(assert (=> b!621000 m!596907))

(declare-fun m!596909 () Bool)

(assert (=> b!620992 m!596909))

(assert (=> b!620992 m!596897))

(declare-fun m!596911 () Bool)

(assert (=> b!620992 m!596911))

(assert (=> b!620992 m!596897))

(declare-fun m!596913 () Bool)

(assert (=> b!620992 m!596913))

(assert (=> b!620992 m!596897))

(assert (=> b!620992 m!596897))

(declare-fun m!596915 () Bool)

(assert (=> b!620992 m!596915))

(declare-fun m!596917 () Bool)

(assert (=> b!620992 m!596917))

(assert (=> b!620992 m!596897))

(assert (=> b!620992 m!596899))

(declare-fun m!596919 () Bool)

(assert (=> b!620992 m!596919))

(declare-fun m!596921 () Bool)

(assert (=> b!620992 m!596921))

(assert (=> b!620993 m!596897))

(assert (=> b!620993 m!596897))

(assert (=> b!620993 m!596907))

(declare-fun m!596923 () Bool)

(assert (=> b!620989 m!596923))

(assert (=> b!621008 m!596897))

(assert (=> b!621008 m!596897))

(declare-fun m!596925 () Bool)

(assert (=> b!621008 m!596925))

(declare-fun m!596927 () Bool)

(assert (=> start!56152 m!596927))

(declare-fun m!596929 () Bool)

(assert (=> start!56152 m!596929))

(declare-fun m!596931 () Bool)

(assert (=> b!621003 m!596931))

(assert (=> b!621003 m!596897))

(declare-fun m!596933 () Bool)

(assert (=> b!621003 m!596933))

(assert (=> b!621003 m!596897))

(assert (=> b!621003 m!596897))

(declare-fun m!596935 () Bool)

(assert (=> b!621003 m!596935))

(assert (=> b!621003 m!596897))

(declare-fun m!596937 () Bool)

(assert (=> b!621003 m!596937))

(declare-fun m!596939 () Bool)

(assert (=> b!621003 m!596939))

(assert (=> b!621003 m!596917))

(assert (=> b!621003 m!596921))

(declare-fun m!596941 () Bool)

(assert (=> b!621001 m!596941))

(declare-fun m!596943 () Bool)

(assert (=> b!621001 m!596943))

(assert (=> b!621001 m!596897))

(declare-fun m!596945 () Bool)

(assert (=> b!621001 m!596945))

(assert (=> b!621001 m!596897))

(declare-fun m!596947 () Bool)

(assert (=> b!621001 m!596947))

(declare-fun m!596949 () Bool)

(assert (=> b!621001 m!596949))

(declare-fun m!596951 () Bool)

(assert (=> b!621001 m!596951))

(declare-fun m!596953 () Bool)

(assert (=> b!621001 m!596953))

(assert (=> b!620990 m!596947))

(declare-fun m!596955 () Bool)

(assert (=> b!620990 m!596955))

(assert (=> b!620990 m!596897))

(declare-fun m!596957 () Bool)

(assert (=> b!620991 m!596957))

(assert (=> b!620998 m!596947))

(declare-fun m!596959 () Bool)

(assert (=> b!620998 m!596959))

(push 1)

