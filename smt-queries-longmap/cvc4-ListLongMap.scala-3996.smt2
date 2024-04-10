; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54170 () Bool)

(assert start!54170)

(declare-fun b!591972 () Bool)

(declare-fun res!378855 () Bool)

(declare-fun e!338031 () Bool)

(assert (=> b!591972 (=> (not res!378855) (not e!338031))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36900 0))(
  ( (array!36901 (arr!17720 (Array (_ BitVec 32) (_ BitVec 64))) (size!18084 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36900)

(assert (=> b!591972 (= res!378855 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17720 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591973 () Bool)

(declare-fun e!338033 () Bool)

(declare-fun e!338027 () Bool)

(assert (=> b!591973 (= e!338033 e!338027)))

(declare-fun res!378862 () Bool)

(assert (=> b!591973 (=> (not res!378862) (not e!338027))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6160 0))(
  ( (MissingZero!6160 (index!26876 (_ BitVec 32))) (Found!6160 (index!26877 (_ BitVec 32))) (Intermediate!6160 (undefined!6972 Bool) (index!26878 (_ BitVec 32)) (x!55664 (_ BitVec 32))) (Undefined!6160) (MissingVacant!6160 (index!26879 (_ BitVec 32))) )
))
(declare-fun lt!268665 () SeekEntryResult!6160)

(assert (=> b!591973 (= res!378862 (and (= lt!268665 (Found!6160 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17720 a!2986) index!984) (select (arr!17720 a!2986) j!136))) (not (= (select (arr!17720 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36900 (_ BitVec 32)) SeekEntryResult!6160)

(assert (=> b!591973 (= lt!268665 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17720 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!268670 () array!36900)

(declare-fun e!338029 () Bool)

(declare-fun b!591974 () Bool)

(declare-fun arrayContainsKey!0 (array!36900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591974 (= e!338029 (arrayContainsKey!0 lt!268670 (select (arr!17720 a!2986) j!136) index!984))))

(declare-fun b!591975 () Bool)

(declare-fun res!378857 () Bool)

(assert (=> b!591975 (=> (not res!378857) (not e!338031))))

(declare-datatypes ((List!11761 0))(
  ( (Nil!11758) (Cons!11757 (h!12802 (_ BitVec 64)) (t!17989 List!11761)) )
))
(declare-fun arrayNoDuplicates!0 (array!36900 (_ BitVec 32) List!11761) Bool)

(assert (=> b!591975 (= res!378857 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11758))))

(declare-fun b!591976 () Bool)

(declare-fun res!378868 () Bool)

(declare-fun e!338032 () Bool)

(assert (=> b!591976 (=> (not res!378868) (not e!338032))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591976 (= res!378868 (and (= (size!18084 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18084 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18084 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591977 () Bool)

(declare-fun e!338025 () Bool)

(assert (=> b!591977 (= e!338027 (not e!338025))))

(declare-fun res!378861 () Bool)

(assert (=> b!591977 (=> res!378861 e!338025)))

(declare-fun lt!268672 () SeekEntryResult!6160)

(assert (=> b!591977 (= res!378861 (not (= lt!268672 (Found!6160 index!984))))))

(declare-datatypes ((Unit!18558 0))(
  ( (Unit!18559) )
))
(declare-fun lt!268664 () Unit!18558)

(declare-fun e!338030 () Unit!18558)

(assert (=> b!591977 (= lt!268664 e!338030)))

(declare-fun c!66926 () Bool)

(assert (=> b!591977 (= c!66926 (= lt!268672 Undefined!6160))))

(declare-fun lt!268668 () (_ BitVec 64))

(assert (=> b!591977 (= lt!268672 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268668 lt!268670 mask!3053))))

(declare-fun e!338028 () Bool)

(assert (=> b!591977 e!338028))

(declare-fun res!378867 () Bool)

(assert (=> b!591977 (=> (not res!378867) (not e!338028))))

(declare-fun lt!268667 () SeekEntryResult!6160)

(declare-fun lt!268669 () (_ BitVec 32))

(assert (=> b!591977 (= res!378867 (= lt!268667 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268669 vacantSpotIndex!68 lt!268668 lt!268670 mask!3053)))))

(assert (=> b!591977 (= lt!268667 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268669 vacantSpotIndex!68 (select (arr!17720 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!591977 (= lt!268668 (select (store (arr!17720 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268663 () Unit!18558)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36900 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18558)

(assert (=> b!591977 (= lt!268663 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268669 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591977 (= lt!268669 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591978 () Bool)

(declare-fun res!378858 () Bool)

(assert (=> b!591978 (=> (not res!378858) (not e!338032))))

(assert (=> b!591978 (= res!378858 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591979 () Bool)

(declare-fun res!378854 () Bool)

(assert (=> b!591979 (=> (not res!378854) (not e!338031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36900 (_ BitVec 32)) Bool)

(assert (=> b!591979 (= res!378854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591981 () Bool)

(declare-fun Unit!18560 () Unit!18558)

(assert (=> b!591981 (= e!338030 Unit!18560)))

(declare-fun b!591982 () Bool)

(assert (=> b!591982 (= e!338032 e!338031)))

(declare-fun res!378866 () Bool)

(assert (=> b!591982 (=> (not res!378866) (not e!338031))))

(declare-fun lt!268671 () SeekEntryResult!6160)

(assert (=> b!591982 (= res!378866 (or (= lt!268671 (MissingZero!6160 i!1108)) (= lt!268671 (MissingVacant!6160 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36900 (_ BitVec 32)) SeekEntryResult!6160)

(assert (=> b!591982 (= lt!268671 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!591983 () Bool)

(assert (=> b!591983 (= e!338025 true)))

(declare-fun e!338024 () Bool)

(assert (=> b!591983 e!338024))

(declare-fun res!378865 () Bool)

(assert (=> b!591983 (=> (not res!378865) (not e!338024))))

(declare-fun lt!268666 () (_ BitVec 64))

(assert (=> b!591983 (= res!378865 (= lt!268666 (select (arr!17720 a!2986) j!136)))))

(assert (=> b!591983 (= lt!268666 (select (store (arr!17720 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!591984 () Bool)

(assert (=> b!591984 (= e!338031 e!338033)))

(declare-fun res!378856 () Bool)

(assert (=> b!591984 (=> (not res!378856) (not e!338033))))

(assert (=> b!591984 (= res!378856 (= (select (store (arr!17720 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591984 (= lt!268670 (array!36901 (store (arr!17720 a!2986) i!1108 k!1786) (size!18084 a!2986)))))

(declare-fun b!591985 () Bool)

(declare-fun res!378859 () Bool)

(assert (=> b!591985 (=> (not res!378859) (not e!338032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591985 (= res!378859 (validKeyInArray!0 k!1786))))

(declare-fun b!591986 () Bool)

(declare-fun e!338034 () Bool)

(assert (=> b!591986 (= e!338024 e!338034)))

(declare-fun res!378869 () Bool)

(assert (=> b!591986 (=> res!378869 e!338034)))

(assert (=> b!591986 (= res!378869 (or (not (= (select (arr!17720 a!2986) j!136) lt!268668)) (not (= (select (arr!17720 a!2986) j!136) lt!268666)) (bvsge j!136 index!984)))))

(declare-fun b!591987 () Bool)

(assert (=> b!591987 (= e!338034 e!338029)))

(declare-fun res!378864 () Bool)

(assert (=> b!591987 (=> (not res!378864) (not e!338029))))

(assert (=> b!591987 (= res!378864 (arrayContainsKey!0 lt!268670 (select (arr!17720 a!2986) j!136) j!136))))

(declare-fun b!591988 () Bool)

(declare-fun res!378860 () Bool)

(assert (=> b!591988 (=> (not res!378860) (not e!338032))))

(assert (=> b!591988 (= res!378860 (validKeyInArray!0 (select (arr!17720 a!2986) j!136)))))

(declare-fun b!591989 () Bool)

(declare-fun Unit!18561 () Unit!18558)

(assert (=> b!591989 (= e!338030 Unit!18561)))

(assert (=> b!591989 false))

(declare-fun b!591980 () Bool)

(assert (=> b!591980 (= e!338028 (= lt!268665 lt!268667))))

(declare-fun res!378863 () Bool)

(assert (=> start!54170 (=> (not res!378863) (not e!338032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54170 (= res!378863 (validMask!0 mask!3053))))

(assert (=> start!54170 e!338032))

(assert (=> start!54170 true))

(declare-fun array_inv!13516 (array!36900) Bool)

(assert (=> start!54170 (array_inv!13516 a!2986)))

(assert (= (and start!54170 res!378863) b!591976))

(assert (= (and b!591976 res!378868) b!591988))

(assert (= (and b!591988 res!378860) b!591985))

(assert (= (and b!591985 res!378859) b!591978))

(assert (= (and b!591978 res!378858) b!591982))

(assert (= (and b!591982 res!378866) b!591979))

(assert (= (and b!591979 res!378854) b!591975))

(assert (= (and b!591975 res!378857) b!591972))

(assert (= (and b!591972 res!378855) b!591984))

(assert (= (and b!591984 res!378856) b!591973))

(assert (= (and b!591973 res!378862) b!591977))

(assert (= (and b!591977 res!378867) b!591980))

(assert (= (and b!591977 c!66926) b!591989))

(assert (= (and b!591977 (not c!66926)) b!591981))

(assert (= (and b!591977 (not res!378861)) b!591983))

(assert (= (and b!591983 res!378865) b!591986))

(assert (= (and b!591986 (not res!378869)) b!591987))

(assert (= (and b!591987 res!378864) b!591974))

(declare-fun m!570141 () Bool)

(assert (=> b!591977 m!570141))

(declare-fun m!570143 () Bool)

(assert (=> b!591977 m!570143))

(declare-fun m!570145 () Bool)

(assert (=> b!591977 m!570145))

(declare-fun m!570147 () Bool)

(assert (=> b!591977 m!570147))

(assert (=> b!591977 m!570145))

(declare-fun m!570149 () Bool)

(assert (=> b!591977 m!570149))

(declare-fun m!570151 () Bool)

(assert (=> b!591977 m!570151))

(declare-fun m!570153 () Bool)

(assert (=> b!591977 m!570153))

(declare-fun m!570155 () Bool)

(assert (=> b!591977 m!570155))

(declare-fun m!570157 () Bool)

(assert (=> b!591978 m!570157))

(declare-fun m!570159 () Bool)

(assert (=> b!591972 m!570159))

(assert (=> b!591986 m!570145))

(declare-fun m!570161 () Bool)

(assert (=> b!591979 m!570161))

(declare-fun m!570163 () Bool)

(assert (=> b!591982 m!570163))

(assert (=> b!591988 m!570145))

(assert (=> b!591988 m!570145))

(declare-fun m!570165 () Bool)

(assert (=> b!591988 m!570165))

(assert (=> b!591984 m!570147))

(declare-fun m!570167 () Bool)

(assert (=> b!591984 m!570167))

(declare-fun m!570169 () Bool)

(assert (=> b!591973 m!570169))

(assert (=> b!591973 m!570145))

(assert (=> b!591973 m!570145))

(declare-fun m!570171 () Bool)

(assert (=> b!591973 m!570171))

(assert (=> b!591983 m!570145))

(assert (=> b!591983 m!570147))

(declare-fun m!570173 () Bool)

(assert (=> b!591983 m!570173))

(declare-fun m!570175 () Bool)

(assert (=> b!591985 m!570175))

(assert (=> b!591987 m!570145))

(assert (=> b!591987 m!570145))

(declare-fun m!570177 () Bool)

(assert (=> b!591987 m!570177))

(assert (=> b!591974 m!570145))

(assert (=> b!591974 m!570145))

(declare-fun m!570179 () Bool)

(assert (=> b!591974 m!570179))

(declare-fun m!570181 () Bool)

(assert (=> b!591975 m!570181))

(declare-fun m!570183 () Bool)

(assert (=> start!54170 m!570183))

(declare-fun m!570185 () Bool)

(assert (=> start!54170 m!570185))

(push 1)

