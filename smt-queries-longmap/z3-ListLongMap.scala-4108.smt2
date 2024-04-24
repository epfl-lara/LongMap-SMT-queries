; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56196 () Bool)

(assert start!56196)

(declare-fun b!620978 () Bool)

(declare-datatypes ((Unit!20647 0))(
  ( (Unit!20648) )
))
(declare-fun e!356177 () Unit!20647)

(declare-fun Unit!20649 () Unit!20647)

(assert (=> b!620978 (= e!356177 Unit!20649)))

(assert (=> b!620978 false))

(declare-fun b!620979 () Bool)

(declare-fun res!400136 () Bool)

(declare-fun e!356175 () Bool)

(assert (=> b!620979 (=> (not res!400136) (not e!356175))))

(declare-datatypes ((array!37611 0))(
  ( (array!37612 (arr!18049 (Array (_ BitVec 32) (_ BitVec 64))) (size!18413 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37611)

(declare-datatypes ((List!11997 0))(
  ( (Nil!11994) (Cons!11993 (h!13041 (_ BitVec 64)) (t!18217 List!11997)) )
))
(declare-fun arrayNoDuplicates!0 (array!37611 (_ BitVec 32) List!11997) Bool)

(assert (=> b!620979 (= res!400136 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11994))))

(declare-fun b!620980 () Bool)

(assert (=> b!620980 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!287106 () Unit!20647)

(declare-fun lt!287100 () array!37611)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37611 (_ BitVec 64) (_ BitVec 32) List!11997) Unit!20647)

(assert (=> b!620980 (= lt!287106 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287100 (select (arr!18049 a!2986) j!136) j!136 Nil!11994))))

(assert (=> b!620980 (arrayNoDuplicates!0 lt!287100 j!136 Nil!11994)))

(declare-fun lt!287116 () Unit!20647)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37611 (_ BitVec 32) (_ BitVec 32)) Unit!20647)

(assert (=> b!620980 (= lt!287116 (lemmaNoDuplicateFromThenFromBigger!0 lt!287100 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620980 (arrayNoDuplicates!0 lt!287100 #b00000000000000000000000000000000 Nil!11994)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!287110 () Unit!20647)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37611 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11997) Unit!20647)

(assert (=> b!620980 (= lt!287110 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11994))))

(declare-fun arrayContainsKey!0 (array!37611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620980 (arrayContainsKey!0 lt!287100 (select (arr!18049 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287117 () Unit!20647)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37611 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20647)

(assert (=> b!620980 (= lt!287117 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287100 (select (arr!18049 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356171 () Unit!20647)

(declare-fun Unit!20650 () Unit!20647)

(assert (=> b!620980 (= e!356171 Unit!20650)))

(declare-fun b!620981 () Bool)

(declare-fun res!400126 () Bool)

(assert (=> b!620981 (=> (not res!400126) (not e!356175))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!620981 (= res!400126 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18049 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620982 () Bool)

(declare-fun res!400132 () Bool)

(assert (=> b!620982 (=> (not res!400132) (not e!356175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37611 (_ BitVec 32)) Bool)

(assert (=> b!620982 (= res!400132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620984 () Bool)

(declare-fun Unit!20651 () Unit!20647)

(assert (=> b!620984 (= e!356171 Unit!20651)))

(declare-fun b!620985 () Bool)

(declare-fun Unit!20652 () Unit!20647)

(assert (=> b!620985 (= e!356177 Unit!20652)))

(declare-fun b!620986 () Bool)

(declare-fun res!400133 () Bool)

(declare-fun e!356176 () Bool)

(assert (=> b!620986 (=> (not res!400133) (not e!356176))))

(assert (=> b!620986 (= res!400133 (and (= (size!18413 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18413 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18413 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620987 () Bool)

(declare-fun e!356181 () Unit!20647)

(declare-fun Unit!20653 () Unit!20647)

(assert (=> b!620987 (= e!356181 Unit!20653)))

(declare-fun b!620988 () Bool)

(declare-fun res!400129 () Bool)

(assert (=> b!620988 (= res!400129 (bvsge j!136 index!984))))

(declare-fun e!356180 () Bool)

(assert (=> b!620988 (=> res!400129 e!356180)))

(declare-fun e!356178 () Bool)

(assert (=> b!620988 (= e!356178 e!356180)))

(declare-fun b!620989 () Bool)

(assert (=> b!620989 false))

(declare-fun lt!287102 () Unit!20647)

(assert (=> b!620989 (= lt!287102 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287100 (select (arr!18049 a!2986) j!136) index!984 Nil!11994))))

(assert (=> b!620989 (arrayNoDuplicates!0 lt!287100 index!984 Nil!11994)))

(declare-fun lt!287104 () Unit!20647)

(assert (=> b!620989 (= lt!287104 (lemmaNoDuplicateFromThenFromBigger!0 lt!287100 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620989 (arrayNoDuplicates!0 lt!287100 #b00000000000000000000000000000000 Nil!11994)))

(declare-fun lt!287114 () Unit!20647)

(assert (=> b!620989 (= lt!287114 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11994))))

(assert (=> b!620989 (arrayContainsKey!0 lt!287100 (select (arr!18049 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287119 () Unit!20647)

(assert (=> b!620989 (= lt!287119 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287100 (select (arr!18049 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356173 () Bool)

(assert (=> b!620989 e!356173))

(declare-fun res!400137 () Bool)

(assert (=> b!620989 (=> (not res!400137) (not e!356173))))

(assert (=> b!620989 (= res!400137 (arrayContainsKey!0 lt!287100 (select (arr!18049 a!2986) j!136) j!136))))

(declare-fun e!356174 () Unit!20647)

(declare-fun Unit!20654 () Unit!20647)

(assert (=> b!620989 (= e!356174 Unit!20654)))

(declare-fun b!620990 () Bool)

(declare-fun Unit!20655 () Unit!20647)

(assert (=> b!620990 (= e!356174 Unit!20655)))

(declare-fun b!620991 () Bool)

(declare-fun res!400123 () Bool)

(assert (=> b!620991 (=> (not res!400123) (not e!356176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620991 (= res!400123 (validKeyInArray!0 (select (arr!18049 a!2986) j!136)))))

(declare-fun b!620992 () Bool)

(assert (=> b!620992 (= e!356176 e!356175)))

(declare-fun res!400128 () Bool)

(assert (=> b!620992 (=> (not res!400128) (not e!356175))))

(declare-datatypes ((SeekEntryResult!6445 0))(
  ( (MissingZero!6445 (index!28064 (_ BitVec 32))) (Found!6445 (index!28065 (_ BitVec 32))) (Intermediate!6445 (undefined!7257 Bool) (index!28066 (_ BitVec 32)) (x!56992 (_ BitVec 32))) (Undefined!6445) (MissingVacant!6445 (index!28067 (_ BitVec 32))) )
))
(declare-fun lt!287118 () SeekEntryResult!6445)

(assert (=> b!620992 (= res!400128 (or (= lt!287118 (MissingZero!6445 i!1108)) (= lt!287118 (MissingVacant!6445 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37611 (_ BitVec 32)) SeekEntryResult!6445)

(assert (=> b!620992 (= lt!287118 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620993 () Bool)

(declare-fun e!356169 () Bool)

(assert (=> b!620993 (= e!356169 (not true))))

(declare-fun lt!287101 () Unit!20647)

(assert (=> b!620993 (= lt!287101 e!356181)))

(declare-fun c!70798 () Bool)

(declare-fun lt!287108 () SeekEntryResult!6445)

(assert (=> b!620993 (= c!70798 (= lt!287108 (Found!6445 index!984)))))

(declare-fun lt!287115 () Unit!20647)

(assert (=> b!620993 (= lt!287115 e!356177)))

(declare-fun c!70796 () Bool)

(assert (=> b!620993 (= c!70796 (= lt!287108 Undefined!6445))))

(declare-fun lt!287107 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37611 (_ BitVec 32)) SeekEntryResult!6445)

(assert (=> b!620993 (= lt!287108 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287107 lt!287100 mask!3053))))

(declare-fun e!356172 () Bool)

(assert (=> b!620993 e!356172))

(declare-fun res!400127 () Bool)

(assert (=> b!620993 (=> (not res!400127) (not e!356172))))

(declare-fun lt!287103 () (_ BitVec 32))

(declare-fun lt!287113 () SeekEntryResult!6445)

(assert (=> b!620993 (= res!400127 (= lt!287113 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287103 vacantSpotIndex!68 lt!287107 lt!287100 mask!3053)))))

(assert (=> b!620993 (= lt!287113 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287103 vacantSpotIndex!68 (select (arr!18049 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620993 (= lt!287107 (select (store (arr!18049 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287105 () Unit!20647)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37611 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20647)

(assert (=> b!620993 (= lt!287105 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287103 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620993 (= lt!287103 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!400125 () Bool)

(declare-fun b!620994 () Bool)

(assert (=> b!620994 (= res!400125 (arrayContainsKey!0 lt!287100 (select (arr!18049 a!2986) j!136) j!136))))

(declare-fun e!356170 () Bool)

(assert (=> b!620994 (=> (not res!400125) (not e!356170))))

(assert (=> b!620994 (= e!356180 e!356170)))

(declare-fun b!620995 () Bool)

(assert (=> b!620995 (= e!356170 (arrayContainsKey!0 lt!287100 (select (arr!18049 a!2986) j!136) index!984))))

(declare-fun b!620996 () Bool)

(declare-fun e!356179 () Bool)

(assert (=> b!620996 (= e!356179 e!356169)))

(declare-fun res!400134 () Bool)

(assert (=> b!620996 (=> (not res!400134) (not e!356169))))

(declare-fun lt!287112 () SeekEntryResult!6445)

(assert (=> b!620996 (= res!400134 (and (= lt!287112 (Found!6445 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18049 a!2986) index!984) (select (arr!18049 a!2986) j!136))) (not (= (select (arr!18049 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!620996 (= lt!287112 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18049 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620997 () Bool)

(declare-fun res!400124 () Bool)

(assert (=> b!620997 (=> (not res!400124) (not e!356176))))

(assert (=> b!620997 (= res!400124 (validKeyInArray!0 k0!1786))))

(declare-fun b!620983 () Bool)

(declare-fun res!400131 () Bool)

(assert (=> b!620983 (=> (not res!400131) (not e!356176))))

(assert (=> b!620983 (= res!400131 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!400138 () Bool)

(assert (=> start!56196 (=> (not res!400138) (not e!356176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56196 (= res!400138 (validMask!0 mask!3053))))

(assert (=> start!56196 e!356176))

(assert (=> start!56196 true))

(declare-fun array_inv!13908 (array!37611) Bool)

(assert (=> start!56196 (array_inv!13908 a!2986)))

(declare-fun b!620998 () Bool)

(assert (=> b!620998 (= e!356172 (= lt!287112 lt!287113))))

(declare-fun b!620999 () Bool)

(assert (=> b!620999 (= e!356175 e!356179)))

(declare-fun res!400135 () Bool)

(assert (=> b!620999 (=> (not res!400135) (not e!356179))))

(assert (=> b!620999 (= res!400135 (= (select (store (arr!18049 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620999 (= lt!287100 (array!37612 (store (arr!18049 a!2986) i!1108 k0!1786) (size!18413 a!2986)))))

(declare-fun b!621000 () Bool)

(declare-fun Unit!20656 () Unit!20647)

(assert (=> b!621000 (= e!356181 Unit!20656)))

(declare-fun res!400130 () Bool)

(assert (=> b!621000 (= res!400130 (= (select (store (arr!18049 a!2986) i!1108 k0!1786) index!984) (select (arr!18049 a!2986) j!136)))))

(assert (=> b!621000 (=> (not res!400130) (not e!356178))))

(assert (=> b!621000 e!356178))

(declare-fun c!70797 () Bool)

(assert (=> b!621000 (= c!70797 (bvslt j!136 index!984))))

(declare-fun lt!287111 () Unit!20647)

(assert (=> b!621000 (= lt!287111 e!356171)))

(declare-fun c!70799 () Bool)

(assert (=> b!621000 (= c!70799 (bvslt index!984 j!136))))

(declare-fun lt!287109 () Unit!20647)

(assert (=> b!621000 (= lt!287109 e!356174)))

(assert (=> b!621000 false))

(declare-fun b!621001 () Bool)

(assert (=> b!621001 (= e!356173 (arrayContainsKey!0 lt!287100 (select (arr!18049 a!2986) j!136) index!984))))

(assert (= (and start!56196 res!400138) b!620986))

(assert (= (and b!620986 res!400133) b!620991))

(assert (= (and b!620991 res!400123) b!620997))

(assert (= (and b!620997 res!400124) b!620983))

(assert (= (and b!620983 res!400131) b!620992))

(assert (= (and b!620992 res!400128) b!620982))

(assert (= (and b!620982 res!400132) b!620979))

(assert (= (and b!620979 res!400136) b!620981))

(assert (= (and b!620981 res!400126) b!620999))

(assert (= (and b!620999 res!400135) b!620996))

(assert (= (and b!620996 res!400134) b!620993))

(assert (= (and b!620993 res!400127) b!620998))

(assert (= (and b!620993 c!70796) b!620978))

(assert (= (and b!620993 (not c!70796)) b!620985))

(assert (= (and b!620993 c!70798) b!621000))

(assert (= (and b!620993 (not c!70798)) b!620987))

(assert (= (and b!621000 res!400130) b!620988))

(assert (= (and b!620988 (not res!400129)) b!620994))

(assert (= (and b!620994 res!400125) b!620995))

(assert (= (and b!621000 c!70797) b!620980))

(assert (= (and b!621000 (not c!70797)) b!620984))

(assert (= (and b!621000 c!70799) b!620989))

(assert (= (and b!621000 (not c!70799)) b!620990))

(assert (= (and b!620989 res!400137) b!621001))

(declare-fun m!597167 () Bool)

(assert (=> b!620980 m!597167))

(declare-fun m!597169 () Bool)

(assert (=> b!620980 m!597169))

(declare-fun m!597171 () Bool)

(assert (=> b!620980 m!597171))

(assert (=> b!620980 m!597167))

(declare-fun m!597173 () Bool)

(assert (=> b!620980 m!597173))

(assert (=> b!620980 m!597167))

(declare-fun m!597175 () Bool)

(assert (=> b!620980 m!597175))

(declare-fun m!597177 () Bool)

(assert (=> b!620980 m!597177))

(declare-fun m!597179 () Bool)

(assert (=> b!620980 m!597179))

(assert (=> b!620980 m!597167))

(declare-fun m!597181 () Bool)

(assert (=> b!620980 m!597181))

(declare-fun m!597183 () Bool)

(assert (=> b!620996 m!597183))

(assert (=> b!620996 m!597167))

(assert (=> b!620996 m!597167))

(declare-fun m!597185 () Bool)

(assert (=> b!620996 m!597185))

(assert (=> b!620989 m!597167))

(declare-fun m!597187 () Bool)

(assert (=> b!620989 m!597187))

(assert (=> b!620989 m!597167))

(declare-fun m!597189 () Bool)

(assert (=> b!620989 m!597189))

(assert (=> b!620989 m!597167))

(declare-fun m!597191 () Bool)

(assert (=> b!620989 m!597191))

(assert (=> b!620989 m!597167))

(declare-fun m!597193 () Bool)

(assert (=> b!620989 m!597193))

(assert (=> b!620989 m!597171))

(declare-fun m!597195 () Bool)

(assert (=> b!620989 m!597195))

(assert (=> b!620989 m!597167))

(declare-fun m!597197 () Bool)

(assert (=> b!620989 m!597197))

(assert (=> b!620989 m!597177))

(declare-fun m!597199 () Bool)

(assert (=> b!620997 m!597199))

(assert (=> b!620991 m!597167))

(assert (=> b!620991 m!597167))

(declare-fun m!597201 () Bool)

(assert (=> b!620991 m!597201))

(declare-fun m!597203 () Bool)

(assert (=> b!620982 m!597203))

(declare-fun m!597205 () Bool)

(assert (=> b!620979 m!597205))

(declare-fun m!597207 () Bool)

(assert (=> b!620983 m!597207))

(assert (=> b!621001 m!597167))

(assert (=> b!621001 m!597167))

(declare-fun m!597209 () Bool)

(assert (=> b!621001 m!597209))

(assert (=> b!620994 m!597167))

(assert (=> b!620994 m!597167))

(assert (=> b!620994 m!597187))

(declare-fun m!597211 () Bool)

(assert (=> b!620999 m!597211))

(declare-fun m!597213 () Bool)

(assert (=> b!620999 m!597213))

(assert (=> b!620995 m!597167))

(assert (=> b!620995 m!597167))

(assert (=> b!620995 m!597209))

(declare-fun m!597215 () Bool)

(assert (=> b!620981 m!597215))

(declare-fun m!597217 () Bool)

(assert (=> b!620992 m!597217))

(assert (=> b!621000 m!597211))

(declare-fun m!597219 () Bool)

(assert (=> b!621000 m!597219))

(assert (=> b!621000 m!597167))

(declare-fun m!597221 () Bool)

(assert (=> start!56196 m!597221))

(declare-fun m!597223 () Bool)

(assert (=> start!56196 m!597223))

(declare-fun m!597225 () Bool)

(assert (=> b!620993 m!597225))

(declare-fun m!597227 () Bool)

(assert (=> b!620993 m!597227))

(assert (=> b!620993 m!597167))

(assert (=> b!620993 m!597211))

(declare-fun m!597229 () Bool)

(assert (=> b!620993 m!597229))

(declare-fun m!597231 () Bool)

(assert (=> b!620993 m!597231))

(declare-fun m!597233 () Bool)

(assert (=> b!620993 m!597233))

(assert (=> b!620993 m!597167))

(declare-fun m!597235 () Bool)

(assert (=> b!620993 m!597235))

(check-sat (not b!620994) (not b!620982) (not b!620979) (not b!620993) (not b!620997) (not b!620989) (not b!621001) (not b!620992) (not b!620983) (not b!620995) (not b!620996) (not start!56196) (not b!620991) (not b!620980))
(check-sat)
