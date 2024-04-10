; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54142 () Bool)

(assert start!54142)

(declare-fun b!591216 () Bool)

(declare-fun res!378185 () Bool)

(declare-fun e!337562 () Bool)

(assert (=> b!591216 (=> (not res!378185) (not e!337562))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591216 (= res!378185 (validKeyInArray!0 k!1786))))

(declare-fun b!591217 () Bool)

(declare-fun res!378182 () Bool)

(declare-fun e!337567 () Bool)

(assert (=> b!591217 (=> (not res!378182) (not e!337567))))

(declare-datatypes ((array!36872 0))(
  ( (array!36873 (arr!17706 (Array (_ BitVec 32) (_ BitVec 64))) (size!18070 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36872)

(declare-datatypes ((List!11747 0))(
  ( (Nil!11744) (Cons!11743 (h!12788 (_ BitVec 64)) (t!17975 List!11747)) )
))
(declare-fun arrayNoDuplicates!0 (array!36872 (_ BitVec 32) List!11747) Bool)

(assert (=> b!591217 (= res!378182 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11744))))

(declare-fun b!591218 () Bool)

(declare-fun e!337570 () Bool)

(declare-fun e!337563 () Bool)

(assert (=> b!591218 (= e!337570 e!337563)))

(declare-fun res!378189 () Bool)

(assert (=> b!591218 (=> res!378189 e!337563)))

(declare-fun lt!268245 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!268252 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591218 (= res!378189 (or (not (= (select (arr!17706 a!2986) j!136) lt!268245)) (not (= (select (arr!17706 a!2986) j!136) lt!268252)) (bvsge j!136 index!984)))))

(declare-fun b!591219 () Bool)

(declare-fun e!337569 () Bool)

(assert (=> b!591219 (= e!337567 e!337569)))

(declare-fun res!378192 () Bool)

(assert (=> b!591219 (=> (not res!378192) (not e!337569))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!591219 (= res!378192 (= (select (store (arr!17706 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268248 () array!36872)

(assert (=> b!591219 (= lt!268248 (array!36873 (store (arr!17706 a!2986) i!1108 k!1786) (size!18070 a!2986)))))

(declare-fun b!591220 () Bool)

(declare-fun res!378184 () Bool)

(assert (=> b!591220 (=> (not res!378184) (not e!337562))))

(declare-fun arrayContainsKey!0 (array!36872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591220 (= res!378184 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591221 () Bool)

(declare-fun res!378187 () Bool)

(assert (=> b!591221 (=> (not res!378187) (not e!337562))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!591221 (= res!378187 (and (= (size!18070 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18070 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18070 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591222 () Bool)

(declare-fun e!337566 () Bool)

(declare-fun e!337565 () Bool)

(assert (=> b!591222 (= e!337566 (not e!337565))))

(declare-fun res!378195 () Bool)

(assert (=> b!591222 (=> res!378195 e!337565)))

(declare-datatypes ((SeekEntryResult!6146 0))(
  ( (MissingZero!6146 (index!26820 (_ BitVec 32))) (Found!6146 (index!26821 (_ BitVec 32))) (Intermediate!6146 (undefined!6958 Bool) (index!26822 (_ BitVec 32)) (x!55618 (_ BitVec 32))) (Undefined!6146) (MissingVacant!6146 (index!26823 (_ BitVec 32))) )
))
(declare-fun lt!268244 () SeekEntryResult!6146)

(assert (=> b!591222 (= res!378195 (not (= lt!268244 (Found!6146 index!984))))))

(declare-datatypes ((Unit!18502 0))(
  ( (Unit!18503) )
))
(declare-fun lt!268247 () Unit!18502)

(declare-fun e!337572 () Unit!18502)

(assert (=> b!591222 (= lt!268247 e!337572)))

(declare-fun c!66884 () Bool)

(assert (=> b!591222 (= c!66884 (= lt!268244 Undefined!6146))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36872 (_ BitVec 32)) SeekEntryResult!6146)

(assert (=> b!591222 (= lt!268244 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268245 lt!268248 mask!3053))))

(declare-fun e!337571 () Bool)

(assert (=> b!591222 e!337571))

(declare-fun res!378191 () Bool)

(assert (=> b!591222 (=> (not res!378191) (not e!337571))))

(declare-fun lt!268243 () SeekEntryResult!6146)

(declare-fun lt!268250 () (_ BitVec 32))

(assert (=> b!591222 (= res!378191 (= lt!268243 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268250 vacantSpotIndex!68 lt!268245 lt!268248 mask!3053)))))

(assert (=> b!591222 (= lt!268243 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268250 vacantSpotIndex!68 (select (arr!17706 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591222 (= lt!268245 (select (store (arr!17706 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268249 () Unit!18502)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36872 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18502)

(assert (=> b!591222 (= lt!268249 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268250 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591222 (= lt!268250 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591223 () Bool)

(declare-fun Unit!18504 () Unit!18502)

(assert (=> b!591223 (= e!337572 Unit!18504)))

(assert (=> b!591223 false))

(declare-fun b!591224 () Bool)

(assert (=> b!591224 (= e!337562 e!337567)))

(declare-fun res!378197 () Bool)

(assert (=> b!591224 (=> (not res!378197) (not e!337567))))

(declare-fun lt!268251 () SeekEntryResult!6146)

(assert (=> b!591224 (= res!378197 (or (= lt!268251 (MissingZero!6146 i!1108)) (= lt!268251 (MissingVacant!6146 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36872 (_ BitVec 32)) SeekEntryResult!6146)

(assert (=> b!591224 (= lt!268251 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!378194 () Bool)

(assert (=> start!54142 (=> (not res!378194) (not e!337562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54142 (= res!378194 (validMask!0 mask!3053))))

(assert (=> start!54142 e!337562))

(assert (=> start!54142 true))

(declare-fun array_inv!13502 (array!36872) Bool)

(assert (=> start!54142 (array_inv!13502 a!2986)))

(declare-fun b!591225 () Bool)

(declare-fun Unit!18505 () Unit!18502)

(assert (=> b!591225 (= e!337572 Unit!18505)))

(declare-fun b!591226 () Bool)

(declare-fun res!378193 () Bool)

(assert (=> b!591226 (=> (not res!378193) (not e!337562))))

(assert (=> b!591226 (= res!378193 (validKeyInArray!0 (select (arr!17706 a!2986) j!136)))))

(declare-fun b!591227 () Bool)

(declare-fun e!337564 () Bool)

(assert (=> b!591227 (= e!337563 e!337564)))

(declare-fun res!378190 () Bool)

(assert (=> b!591227 (=> (not res!378190) (not e!337564))))

(assert (=> b!591227 (= res!378190 (arrayContainsKey!0 lt!268248 (select (arr!17706 a!2986) j!136) j!136))))

(declare-fun b!591228 () Bool)

(assert (=> b!591228 (= e!337564 (arrayContainsKey!0 lt!268248 (select (arr!17706 a!2986) j!136) index!984))))

(declare-fun b!591229 () Bool)

(declare-fun res!378188 () Bool)

(assert (=> b!591229 (=> (not res!378188) (not e!337567))))

(assert (=> b!591229 (= res!378188 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17706 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591230 () Bool)

(declare-fun res!378196 () Bool)

(assert (=> b!591230 (=> (not res!378196) (not e!337567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36872 (_ BitVec 32)) Bool)

(assert (=> b!591230 (= res!378196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591231 () Bool)

(declare-fun lt!268246 () SeekEntryResult!6146)

(assert (=> b!591231 (= e!337571 (= lt!268246 lt!268243))))

(declare-fun b!591232 () Bool)

(assert (=> b!591232 (= e!337565 true)))

(assert (=> b!591232 e!337570))

(declare-fun res!378183 () Bool)

(assert (=> b!591232 (=> (not res!378183) (not e!337570))))

(assert (=> b!591232 (= res!378183 (= lt!268252 (select (arr!17706 a!2986) j!136)))))

(assert (=> b!591232 (= lt!268252 (select (store (arr!17706 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!591233 () Bool)

(assert (=> b!591233 (= e!337569 e!337566)))

(declare-fun res!378186 () Bool)

(assert (=> b!591233 (=> (not res!378186) (not e!337566))))

(assert (=> b!591233 (= res!378186 (and (= lt!268246 (Found!6146 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17706 a!2986) index!984) (select (arr!17706 a!2986) j!136))) (not (= (select (arr!17706 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591233 (= lt!268246 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17706 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!54142 res!378194) b!591221))

(assert (= (and b!591221 res!378187) b!591226))

(assert (= (and b!591226 res!378193) b!591216))

(assert (= (and b!591216 res!378185) b!591220))

(assert (= (and b!591220 res!378184) b!591224))

(assert (= (and b!591224 res!378197) b!591230))

(assert (= (and b!591230 res!378196) b!591217))

(assert (= (and b!591217 res!378182) b!591229))

(assert (= (and b!591229 res!378188) b!591219))

(assert (= (and b!591219 res!378192) b!591233))

(assert (= (and b!591233 res!378186) b!591222))

(assert (= (and b!591222 res!378191) b!591231))

(assert (= (and b!591222 c!66884) b!591223))

(assert (= (and b!591222 (not c!66884)) b!591225))

(assert (= (and b!591222 (not res!378195)) b!591232))

(assert (= (and b!591232 res!378183) b!591218))

(assert (= (and b!591218 (not res!378189)) b!591227))

(assert (= (and b!591227 res!378190) b!591228))

(declare-fun m!569497 () Bool)

(assert (=> b!591220 m!569497))

(declare-fun m!569499 () Bool)

(assert (=> b!591226 m!569499))

(assert (=> b!591226 m!569499))

(declare-fun m!569501 () Bool)

(assert (=> b!591226 m!569501))

(assert (=> b!591227 m!569499))

(assert (=> b!591227 m!569499))

(declare-fun m!569503 () Bool)

(assert (=> b!591227 m!569503))

(declare-fun m!569505 () Bool)

(assert (=> b!591233 m!569505))

(assert (=> b!591233 m!569499))

(assert (=> b!591233 m!569499))

(declare-fun m!569507 () Bool)

(assert (=> b!591233 m!569507))

(declare-fun m!569509 () Bool)

(assert (=> start!54142 m!569509))

(declare-fun m!569511 () Bool)

(assert (=> start!54142 m!569511))

(assert (=> b!591218 m!569499))

(declare-fun m!569513 () Bool)

(assert (=> b!591224 m!569513))

(declare-fun m!569515 () Bool)

(assert (=> b!591219 m!569515))

(declare-fun m!569517 () Bool)

(assert (=> b!591219 m!569517))

(assert (=> b!591228 m!569499))

(assert (=> b!591228 m!569499))

(declare-fun m!569519 () Bool)

(assert (=> b!591228 m!569519))

(declare-fun m!569521 () Bool)

(assert (=> b!591230 m!569521))

(assert (=> b!591232 m!569499))

(assert (=> b!591232 m!569515))

(declare-fun m!569523 () Bool)

(assert (=> b!591232 m!569523))

(declare-fun m!569525 () Bool)

(assert (=> b!591217 m!569525))

(declare-fun m!569527 () Bool)

(assert (=> b!591222 m!569527))

(assert (=> b!591222 m!569515))

(declare-fun m!569529 () Bool)

(assert (=> b!591222 m!569529))

(declare-fun m!569531 () Bool)

(assert (=> b!591222 m!569531))

(declare-fun m!569533 () Bool)

(assert (=> b!591222 m!569533))

(declare-fun m!569535 () Bool)

(assert (=> b!591222 m!569535))

(assert (=> b!591222 m!569499))

(assert (=> b!591222 m!569499))

(declare-fun m!569537 () Bool)

(assert (=> b!591222 m!569537))

(declare-fun m!569539 () Bool)

(assert (=> b!591229 m!569539))

(declare-fun m!569541 () Bool)

(assert (=> b!591216 m!569541))

(push 1)

