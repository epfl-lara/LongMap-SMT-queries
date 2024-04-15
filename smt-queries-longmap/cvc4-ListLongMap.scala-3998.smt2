; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54164 () Bool)

(assert start!54164)

(declare-fun b!591985 () Bool)

(declare-datatypes ((Unit!18556 0))(
  ( (Unit!18557) )
))
(declare-fun e!338040 () Unit!18556)

(declare-fun Unit!18558 () Unit!18556)

(assert (=> b!591985 (= e!338040 Unit!18558)))

(declare-fun res!378981 () Bool)

(declare-fun e!338032 () Bool)

(assert (=> start!54164 (=> (not res!378981) (not e!338032))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54164 (= res!378981 (validMask!0 mask!3053))))

(assert (=> start!54164 e!338032))

(assert (=> start!54164 true))

(declare-datatypes ((array!36908 0))(
  ( (array!36909 (arr!17724 (Array (_ BitVec 32) (_ BitVec 64))) (size!18089 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36908)

(declare-fun array_inv!13607 (array!36908) Bool)

(assert (=> start!54164 (array_inv!13607 a!2986)))

(declare-fun b!591986 () Bool)

(declare-fun res!378995 () Bool)

(assert (=> b!591986 (=> (not res!378995) (not e!338032))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591986 (= res!378995 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591987 () Bool)

(declare-fun Unit!18559 () Unit!18556)

(assert (=> b!591987 (= e!338040 Unit!18559)))

(assert (=> b!591987 false))

(declare-fun b!591988 () Bool)

(declare-fun e!338037 () Bool)

(declare-fun e!338029 () Bool)

(assert (=> b!591988 (= e!338037 e!338029)))

(declare-fun res!378988 () Bool)

(assert (=> b!591988 (=> (not res!378988) (not e!338029))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6161 0))(
  ( (MissingZero!6161 (index!26880 (_ BitVec 32))) (Found!6161 (index!26881 (_ BitVec 32))) (Intermediate!6161 (undefined!6973 Bool) (index!26882 (_ BitVec 32)) (x!55676 (_ BitVec 32))) (Undefined!6161) (MissingVacant!6161 (index!26883 (_ BitVec 32))) )
))
(declare-fun lt!268600 () SeekEntryResult!6161)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591988 (= res!378988 (and (= lt!268600 (Found!6161 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17724 a!2986) index!984) (select (arr!17724 a!2986) j!136))) (not (= (select (arr!17724 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36908 (_ BitVec 32)) SeekEntryResult!6161)

(assert (=> b!591988 (= lt!268600 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17724 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591989 () Bool)

(declare-fun res!378983 () Bool)

(declare-fun e!338039 () Bool)

(assert (=> b!591989 (=> (not res!378983) (not e!338039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36908 (_ BitVec 32)) Bool)

(assert (=> b!591989 (= res!378983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591990 () Bool)

(assert (=> b!591990 (= e!338032 e!338039)))

(declare-fun res!378979 () Bool)

(assert (=> b!591990 (=> (not res!378979) (not e!338039))))

(declare-fun lt!268597 () SeekEntryResult!6161)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591990 (= res!378979 (or (= lt!268597 (MissingZero!6161 i!1108)) (= lt!268597 (MissingVacant!6161 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36908 (_ BitVec 32)) SeekEntryResult!6161)

(assert (=> b!591990 (= lt!268597 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!591991 () Bool)

(declare-fun e!338033 () Bool)

(declare-fun e!338031 () Bool)

(assert (=> b!591991 (= e!338033 e!338031)))

(declare-fun res!378984 () Bool)

(assert (=> b!591991 (=> res!378984 e!338031)))

(declare-fun lt!268595 () (_ BitVec 64))

(declare-fun lt!268602 () (_ BitVec 64))

(assert (=> b!591991 (= res!378984 (or (not (= (select (arr!17724 a!2986) j!136) lt!268595)) (not (= (select (arr!17724 a!2986) j!136) lt!268602)) (bvsge j!136 index!984)))))

(declare-fun b!591992 () Bool)

(declare-fun res!378980 () Bool)

(assert (=> b!591992 (=> (not res!378980) (not e!338032))))

(assert (=> b!591992 (= res!378980 (and (= (size!18089 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18089 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18089 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591993 () Bool)

(declare-fun res!378994 () Bool)

(assert (=> b!591993 (=> (not res!378994) (not e!338039))))

(assert (=> b!591993 (= res!378994 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17724 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591994 () Bool)

(declare-fun lt!268603 () array!36908)

(declare-fun e!338038 () Bool)

(assert (=> b!591994 (= e!338038 (arrayContainsKey!0 lt!268603 (select (arr!17724 a!2986) j!136) index!984))))

(declare-fun b!591995 () Bool)

(declare-fun res!378993 () Bool)

(assert (=> b!591995 (=> (not res!378993) (not e!338032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591995 (= res!378993 (validKeyInArray!0 (select (arr!17724 a!2986) j!136)))))

(declare-fun b!591996 () Bool)

(assert (=> b!591996 (= e!338031 e!338038)))

(declare-fun res!378991 () Bool)

(assert (=> b!591996 (=> (not res!378991) (not e!338038))))

(assert (=> b!591996 (= res!378991 (arrayContainsKey!0 lt!268603 (select (arr!17724 a!2986) j!136) j!136))))

(declare-fun b!591997 () Bool)

(declare-fun res!378982 () Bool)

(assert (=> b!591997 (=> (not res!378982) (not e!338039))))

(declare-datatypes ((List!11804 0))(
  ( (Nil!11801) (Cons!11800 (h!12845 (_ BitVec 64)) (t!18023 List!11804)) )
))
(declare-fun arrayNoDuplicates!0 (array!36908 (_ BitVec 32) List!11804) Bool)

(assert (=> b!591997 (= res!378982 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11801))))

(declare-fun b!591998 () Bool)

(declare-fun e!338035 () Bool)

(declare-fun lt!268596 () SeekEntryResult!6161)

(assert (=> b!591998 (= e!338035 (= lt!268600 lt!268596))))

(declare-fun b!591999 () Bool)

(declare-fun e!338036 () Bool)

(assert (=> b!591999 (= e!338036 (or (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 j!136) (size!18089 a!2986))))))

(assert (=> b!591999 (arrayContainsKey!0 lt!268603 (select (arr!17724 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268599 () Unit!18556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36908 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18556)

(assert (=> b!591999 (= lt!268599 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268603 (select (arr!17724 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592000 () Bool)

(declare-fun res!378989 () Bool)

(assert (=> b!592000 (=> (not res!378989) (not e!338032))))

(assert (=> b!592000 (= res!378989 (validKeyInArray!0 k!1786))))

(declare-fun b!592001 () Bool)

(declare-fun e!338030 () Bool)

(assert (=> b!592001 (= e!338030 e!338036)))

(declare-fun res!378992 () Bool)

(assert (=> b!592001 (=> res!378992 e!338036)))

(assert (=> b!592001 (= res!378992 (or (not (= (select (arr!17724 a!2986) j!136) lt!268595)) (not (= (select (arr!17724 a!2986) j!136) lt!268602)) (bvsge j!136 index!984)))))

(assert (=> b!592001 e!338033))

(declare-fun res!378986 () Bool)

(assert (=> b!592001 (=> (not res!378986) (not e!338033))))

(assert (=> b!592001 (= res!378986 (= lt!268602 (select (arr!17724 a!2986) j!136)))))

(assert (=> b!592001 (= lt!268602 (select (store (arr!17724 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!592002 () Bool)

(assert (=> b!592002 (= e!338029 (not e!338030))))

(declare-fun res!378985 () Bool)

(assert (=> b!592002 (=> res!378985 e!338030)))

(declare-fun lt!268593 () SeekEntryResult!6161)

(assert (=> b!592002 (= res!378985 (not (= lt!268593 (Found!6161 index!984))))))

(declare-fun lt!268598 () Unit!18556)

(assert (=> b!592002 (= lt!268598 e!338040)))

(declare-fun c!66870 () Bool)

(assert (=> b!592002 (= c!66870 (= lt!268593 Undefined!6161))))

(assert (=> b!592002 (= lt!268593 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268595 lt!268603 mask!3053))))

(assert (=> b!592002 e!338035))

(declare-fun res!378987 () Bool)

(assert (=> b!592002 (=> (not res!378987) (not e!338035))))

(declare-fun lt!268594 () (_ BitVec 32))

(assert (=> b!592002 (= res!378987 (= lt!268596 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268594 vacantSpotIndex!68 lt!268595 lt!268603 mask!3053)))))

(assert (=> b!592002 (= lt!268596 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268594 vacantSpotIndex!68 (select (arr!17724 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592002 (= lt!268595 (select (store (arr!17724 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268601 () Unit!18556)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36908 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18556)

(assert (=> b!592002 (= lt!268601 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268594 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592002 (= lt!268594 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592003 () Bool)

(assert (=> b!592003 (= e!338039 e!338037)))

(declare-fun res!378990 () Bool)

(assert (=> b!592003 (=> (not res!378990) (not e!338037))))

(assert (=> b!592003 (= res!378990 (= (select (store (arr!17724 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592003 (= lt!268603 (array!36909 (store (arr!17724 a!2986) i!1108 k!1786) (size!18089 a!2986)))))

(assert (= (and start!54164 res!378981) b!591992))

(assert (= (and b!591992 res!378980) b!591995))

(assert (= (and b!591995 res!378993) b!592000))

(assert (= (and b!592000 res!378989) b!591986))

(assert (= (and b!591986 res!378995) b!591990))

(assert (= (and b!591990 res!378979) b!591989))

(assert (= (and b!591989 res!378983) b!591997))

(assert (= (and b!591997 res!378982) b!591993))

(assert (= (and b!591993 res!378994) b!592003))

(assert (= (and b!592003 res!378990) b!591988))

(assert (= (and b!591988 res!378988) b!592002))

(assert (= (and b!592002 res!378987) b!591998))

(assert (= (and b!592002 c!66870) b!591987))

(assert (= (and b!592002 (not c!66870)) b!591985))

(assert (= (and b!592002 (not res!378985)) b!592001))

(assert (= (and b!592001 res!378986) b!591991))

(assert (= (and b!591991 (not res!378984)) b!591996))

(assert (= (and b!591996 res!378991) b!591994))

(assert (= (and b!592001 (not res!378992)) b!591999))

(declare-fun m!569601 () Bool)

(assert (=> b!591986 m!569601))

(declare-fun m!569603 () Bool)

(assert (=> b!591989 m!569603))

(declare-fun m!569605 () Bool)

(assert (=> b!592003 m!569605))

(declare-fun m!569607 () Bool)

(assert (=> b!592003 m!569607))

(declare-fun m!569609 () Bool)

(assert (=> b!592001 m!569609))

(assert (=> b!592001 m!569605))

(declare-fun m!569611 () Bool)

(assert (=> b!592001 m!569611))

(assert (=> b!591991 m!569609))

(declare-fun m!569613 () Bool)

(assert (=> start!54164 m!569613))

(declare-fun m!569615 () Bool)

(assert (=> start!54164 m!569615))

(assert (=> b!591999 m!569609))

(assert (=> b!591999 m!569609))

(declare-fun m!569617 () Bool)

(assert (=> b!591999 m!569617))

(assert (=> b!591999 m!569609))

(declare-fun m!569619 () Bool)

(assert (=> b!591999 m!569619))

(declare-fun m!569621 () Bool)

(assert (=> b!591997 m!569621))

(declare-fun m!569623 () Bool)

(assert (=> b!592002 m!569623))

(declare-fun m!569625 () Bool)

(assert (=> b!592002 m!569625))

(assert (=> b!592002 m!569609))

(assert (=> b!592002 m!569605))

(declare-fun m!569627 () Bool)

(assert (=> b!592002 m!569627))

(declare-fun m!569629 () Bool)

(assert (=> b!592002 m!569629))

(assert (=> b!592002 m!569609))

(declare-fun m!569631 () Bool)

(assert (=> b!592002 m!569631))

(declare-fun m!569633 () Bool)

(assert (=> b!592002 m!569633))

(declare-fun m!569635 () Bool)

(assert (=> b!591993 m!569635))

(assert (=> b!591996 m!569609))

(assert (=> b!591996 m!569609))

(declare-fun m!569637 () Bool)

(assert (=> b!591996 m!569637))

(declare-fun m!569639 () Bool)

(assert (=> b!592000 m!569639))

(declare-fun m!569641 () Bool)

(assert (=> b!591988 m!569641))

(assert (=> b!591988 m!569609))

(assert (=> b!591988 m!569609))

(declare-fun m!569643 () Bool)

(assert (=> b!591988 m!569643))

(declare-fun m!569645 () Bool)

(assert (=> b!591990 m!569645))

(assert (=> b!591994 m!569609))

(assert (=> b!591994 m!569609))

(declare-fun m!569647 () Bool)

(assert (=> b!591994 m!569647))

(assert (=> b!591995 m!569609))

(assert (=> b!591995 m!569609))

(declare-fun m!569649 () Bool)

(assert (=> b!591995 m!569649))

(push 1)

(assert (not b!591996))

(assert (not b!591995))

(assert (not start!54164))

(assert (not b!591994))

(assert (not b!591997))

(assert (not b!592000))

(assert (not b!591989))

(assert (not b!591999))

(assert (not b!591986))

(assert (not b!591990))

(assert (not b!591988))

(assert (not b!592002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

