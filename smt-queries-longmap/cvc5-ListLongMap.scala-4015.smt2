; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54562 () Bool)

(assert start!54562)

(declare-fun res!382513 () Bool)

(declare-fun e!340955 () Bool)

(assert (=> start!54562 (=> (not res!382513) (not e!340955))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54562 (= res!382513 (validMask!0 mask!3053))))

(assert (=> start!54562 e!340955))

(assert (=> start!54562 true))

(declare-datatypes ((array!37022 0))(
  ( (array!37023 (arr!17775 (Array (_ BitVec 32) (_ BitVec 64))) (size!18139 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37022)

(declare-fun array_inv!13571 (array!37022) Bool)

(assert (=> start!54562 (array_inv!13571 a!2986)))

(declare-fun b!596750 () Bool)

(declare-fun res!382516 () Bool)

(declare-fun e!340946 () Bool)

(assert (=> b!596750 (=> (not res!382516) (not e!340946))))

(declare-datatypes ((List!11816 0))(
  ( (Nil!11813) (Cons!11812 (h!12857 (_ BitVec 64)) (t!18044 List!11816)) )
))
(declare-fun arrayNoDuplicates!0 (array!37022 (_ BitVec 32) List!11816) Bool)

(assert (=> b!596750 (= res!382516 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11813))))

(declare-fun b!596751 () Bool)

(declare-fun e!340953 () Bool)

(declare-fun e!340945 () Bool)

(assert (=> b!596751 (= e!340953 e!340945)))

(declare-fun res!382518 () Bool)

(assert (=> b!596751 (=> (not res!382518) (not e!340945))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6215 0))(
  ( (MissingZero!6215 (index!27108 (_ BitVec 32))) (Found!6215 (index!27109 (_ BitVec 32))) (Intermediate!6215 (undefined!7027 Bool) (index!27110 (_ BitVec 32)) (x!55907 (_ BitVec 32))) (Undefined!6215) (MissingVacant!6215 (index!27111 (_ BitVec 32))) )
))
(declare-fun lt!271058 () SeekEntryResult!6215)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596751 (= res!382518 (and (= lt!271058 (Found!6215 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17775 a!2986) index!984) (select (arr!17775 a!2986) j!136))) (not (= (select (arr!17775 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37022 (_ BitVec 32)) SeekEntryResult!6215)

(assert (=> b!596751 (= lt!271058 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17775 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596752 () Bool)

(assert (=> b!596752 (= e!340955 e!340946)))

(declare-fun res!382515 () Bool)

(assert (=> b!596752 (=> (not res!382515) (not e!340946))))

(declare-fun lt!271069 () SeekEntryResult!6215)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596752 (= res!382515 (or (= lt!271069 (MissingZero!6215 i!1108)) (= lt!271069 (MissingVacant!6215 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37022 (_ BitVec 32)) SeekEntryResult!6215)

(assert (=> b!596752 (= lt!271069 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!596753 () Bool)

(declare-fun res!382525 () Bool)

(assert (=> b!596753 (=> (not res!382525) (not e!340955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596753 (= res!382525 (validKeyInArray!0 k!1786))))

(declare-fun b!596754 () Bool)

(declare-fun e!340956 () Bool)

(assert (=> b!596754 (= e!340956 (bvsle #b00000000000000000000000000000000 (size!18139 a!2986)))))

(declare-fun lt!271060 () array!37022)

(assert (=> b!596754 (arrayNoDuplicates!0 lt!271060 #b00000000000000000000000000000000 Nil!11813)))

(declare-datatypes ((Unit!18778 0))(
  ( (Unit!18779) )
))
(declare-fun lt!271068 () Unit!18778)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37022 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11816) Unit!18778)

(assert (=> b!596754 (= lt!271068 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11813))))

(declare-fun arrayContainsKey!0 (array!37022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596754 (arrayContainsKey!0 lt!271060 (select (arr!17775 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271061 () Unit!18778)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37022 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18778)

(assert (=> b!596754 (= lt!271061 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271060 (select (arr!17775 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596755 () Bool)

(declare-fun res!382517 () Bool)

(assert (=> b!596755 (=> (not res!382517) (not e!340946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37022 (_ BitVec 32)) Bool)

(assert (=> b!596755 (= res!382517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596756 () Bool)

(assert (=> b!596756 (= e!340946 e!340953)))

(declare-fun res!382523 () Bool)

(assert (=> b!596756 (=> (not res!382523) (not e!340953))))

(assert (=> b!596756 (= res!382523 (= (select (store (arr!17775 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596756 (= lt!271060 (array!37023 (store (arr!17775 a!2986) i!1108 k!1786) (size!18139 a!2986)))))

(declare-fun b!596757 () Bool)

(declare-fun e!340949 () Unit!18778)

(declare-fun Unit!18780 () Unit!18778)

(assert (=> b!596757 (= e!340949 Unit!18780)))

(declare-fun b!596758 () Bool)

(declare-fun Unit!18781 () Unit!18778)

(assert (=> b!596758 (= e!340949 Unit!18781)))

(assert (=> b!596758 false))

(declare-fun b!596759 () Bool)

(declare-fun res!382519 () Bool)

(assert (=> b!596759 (=> (not res!382519) (not e!340955))))

(assert (=> b!596759 (= res!382519 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun e!340954 () Bool)

(declare-fun b!596760 () Bool)

(assert (=> b!596760 (= e!340954 (arrayContainsKey!0 lt!271060 (select (arr!17775 a!2986) j!136) index!984))))

(declare-fun b!596761 () Bool)

(declare-fun e!340952 () Bool)

(assert (=> b!596761 (= e!340952 e!340954)))

(declare-fun res!382511 () Bool)

(assert (=> b!596761 (=> (not res!382511) (not e!340954))))

(assert (=> b!596761 (= res!382511 (arrayContainsKey!0 lt!271060 (select (arr!17775 a!2986) j!136) j!136))))

(declare-fun b!596762 () Bool)

(declare-fun res!382522 () Bool)

(assert (=> b!596762 (=> (not res!382522) (not e!340955))))

(assert (=> b!596762 (= res!382522 (and (= (size!18139 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18139 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18139 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596763 () Bool)

(declare-fun res!382520 () Bool)

(assert (=> b!596763 (=> (not res!382520) (not e!340946))))

(assert (=> b!596763 (= res!382520 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17775 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596764 () Bool)

(declare-fun e!340948 () Bool)

(declare-fun lt!271059 () SeekEntryResult!6215)

(assert (=> b!596764 (= e!340948 (= lt!271058 lt!271059))))

(declare-fun b!596765 () Bool)

(declare-fun res!382521 () Bool)

(assert (=> b!596765 (=> (not res!382521) (not e!340955))))

(assert (=> b!596765 (= res!382521 (validKeyInArray!0 (select (arr!17775 a!2986) j!136)))))

(declare-fun b!596766 () Bool)

(declare-fun e!340947 () Bool)

(assert (=> b!596766 (= e!340945 (not e!340947))))

(declare-fun res!382510 () Bool)

(assert (=> b!596766 (=> res!382510 e!340947)))

(declare-fun lt!271066 () SeekEntryResult!6215)

(assert (=> b!596766 (= res!382510 (not (= lt!271066 (Found!6215 index!984))))))

(declare-fun lt!271064 () Unit!18778)

(assert (=> b!596766 (= lt!271064 e!340949)))

(declare-fun c!67487 () Bool)

(assert (=> b!596766 (= c!67487 (= lt!271066 Undefined!6215))))

(declare-fun lt!271065 () (_ BitVec 64))

(assert (=> b!596766 (= lt!271066 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271065 lt!271060 mask!3053))))

(assert (=> b!596766 e!340948))

(declare-fun res!382526 () Bool)

(assert (=> b!596766 (=> (not res!382526) (not e!340948))))

(declare-fun lt!271063 () (_ BitVec 32))

(assert (=> b!596766 (= res!382526 (= lt!271059 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271063 vacantSpotIndex!68 lt!271065 lt!271060 mask!3053)))))

(assert (=> b!596766 (= lt!271059 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271063 vacantSpotIndex!68 (select (arr!17775 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596766 (= lt!271065 (select (store (arr!17775 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271067 () Unit!18778)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37022 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18778)

(assert (=> b!596766 (= lt!271067 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271063 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596766 (= lt!271063 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596767 () Bool)

(declare-fun e!340950 () Bool)

(assert (=> b!596767 (= e!340950 e!340952)))

(declare-fun res!382514 () Bool)

(assert (=> b!596767 (=> res!382514 e!340952)))

(declare-fun lt!271062 () (_ BitVec 64))

(assert (=> b!596767 (= res!382514 (or (not (= (select (arr!17775 a!2986) j!136) lt!271065)) (not (= (select (arr!17775 a!2986) j!136) lt!271062)) (bvsge j!136 index!984)))))

(declare-fun b!596768 () Bool)

(assert (=> b!596768 (= e!340947 e!340956)))

(declare-fun res!382524 () Bool)

(assert (=> b!596768 (=> res!382524 e!340956)))

(assert (=> b!596768 (= res!382524 (or (not (= (select (arr!17775 a!2986) j!136) lt!271065)) (not (= (select (arr!17775 a!2986) j!136) lt!271062)) (bvsge j!136 index!984)))))

(assert (=> b!596768 e!340950))

(declare-fun res!382512 () Bool)

(assert (=> b!596768 (=> (not res!382512) (not e!340950))))

(assert (=> b!596768 (= res!382512 (= lt!271062 (select (arr!17775 a!2986) j!136)))))

(assert (=> b!596768 (= lt!271062 (select (store (arr!17775 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!54562 res!382513) b!596762))

(assert (= (and b!596762 res!382522) b!596765))

(assert (= (and b!596765 res!382521) b!596753))

(assert (= (and b!596753 res!382525) b!596759))

(assert (= (and b!596759 res!382519) b!596752))

(assert (= (and b!596752 res!382515) b!596755))

(assert (= (and b!596755 res!382517) b!596750))

(assert (= (and b!596750 res!382516) b!596763))

(assert (= (and b!596763 res!382520) b!596756))

(assert (= (and b!596756 res!382523) b!596751))

(assert (= (and b!596751 res!382518) b!596766))

(assert (= (and b!596766 res!382526) b!596764))

(assert (= (and b!596766 c!67487) b!596758))

(assert (= (and b!596766 (not c!67487)) b!596757))

(assert (= (and b!596766 (not res!382510)) b!596768))

(assert (= (and b!596768 res!382512) b!596767))

(assert (= (and b!596767 (not res!382514)) b!596761))

(assert (= (and b!596761 res!382511) b!596760))

(assert (= (and b!596768 (not res!382524)) b!596754))

(declare-fun m!574199 () Bool)

(assert (=> b!596767 m!574199))

(declare-fun m!574201 () Bool)

(assert (=> b!596763 m!574201))

(declare-fun m!574203 () Bool)

(assert (=> b!596756 m!574203))

(declare-fun m!574205 () Bool)

(assert (=> b!596756 m!574205))

(declare-fun m!574207 () Bool)

(assert (=> start!54562 m!574207))

(declare-fun m!574209 () Bool)

(assert (=> start!54562 m!574209))

(declare-fun m!574211 () Bool)

(assert (=> b!596753 m!574211))

(assert (=> b!596768 m!574199))

(assert (=> b!596768 m!574203))

(declare-fun m!574213 () Bool)

(assert (=> b!596768 m!574213))

(declare-fun m!574215 () Bool)

(assert (=> b!596751 m!574215))

(assert (=> b!596751 m!574199))

(assert (=> b!596751 m!574199))

(declare-fun m!574217 () Bool)

(assert (=> b!596751 m!574217))

(declare-fun m!574219 () Bool)

(assert (=> b!596766 m!574219))

(declare-fun m!574221 () Bool)

(assert (=> b!596766 m!574221))

(assert (=> b!596766 m!574199))

(assert (=> b!596766 m!574203))

(declare-fun m!574223 () Bool)

(assert (=> b!596766 m!574223))

(declare-fun m!574225 () Bool)

(assert (=> b!596766 m!574225))

(assert (=> b!596766 m!574199))

(declare-fun m!574227 () Bool)

(assert (=> b!596766 m!574227))

(declare-fun m!574229 () Bool)

(assert (=> b!596766 m!574229))

(assert (=> b!596761 m!574199))

(assert (=> b!596761 m!574199))

(declare-fun m!574231 () Bool)

(assert (=> b!596761 m!574231))

(declare-fun m!574233 () Bool)

(assert (=> b!596755 m!574233))

(declare-fun m!574235 () Bool)

(assert (=> b!596759 m!574235))

(assert (=> b!596760 m!574199))

(assert (=> b!596760 m!574199))

(declare-fun m!574237 () Bool)

(assert (=> b!596760 m!574237))

(declare-fun m!574239 () Bool)

(assert (=> b!596750 m!574239))

(assert (=> b!596765 m!574199))

(assert (=> b!596765 m!574199))

(declare-fun m!574241 () Bool)

(assert (=> b!596765 m!574241))

(declare-fun m!574243 () Bool)

(assert (=> b!596752 m!574243))

(assert (=> b!596754 m!574199))

(assert (=> b!596754 m!574199))

(declare-fun m!574245 () Bool)

(assert (=> b!596754 m!574245))

(assert (=> b!596754 m!574199))

(declare-fun m!574247 () Bool)

(assert (=> b!596754 m!574247))

(declare-fun m!574249 () Bool)

(assert (=> b!596754 m!574249))

(declare-fun m!574251 () Bool)

(assert (=> b!596754 m!574251))

(push 1)

