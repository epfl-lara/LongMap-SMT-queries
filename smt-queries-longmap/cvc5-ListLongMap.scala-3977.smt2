; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53932 () Bool)

(assert start!53932)

(declare-fun b!588619 () Bool)

(declare-fun res!376254 () Bool)

(declare-fun e!336113 () Bool)

(assert (=> b!588619 (=> (not res!376254) (not e!336113))))

(declare-datatypes ((array!36776 0))(
  ( (array!36777 (arr!17661 (Array (_ BitVec 32) (_ BitVec 64))) (size!18025 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36776)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588619 (= res!376254 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588620 () Bool)

(declare-fun res!376260 () Bool)

(assert (=> b!588620 (=> (not res!376260) (not e!336113))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588620 (= res!376260 (and (= (size!18025 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18025 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18025 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588621 () Bool)

(declare-fun e!336112 () Bool)

(assert (=> b!588621 (= e!336113 e!336112)))

(declare-fun res!376256 () Bool)

(assert (=> b!588621 (=> (not res!376256) (not e!336112))))

(declare-datatypes ((SeekEntryResult!6101 0))(
  ( (MissingZero!6101 (index!26634 (_ BitVec 32))) (Found!6101 (index!26635 (_ BitVec 32))) (Intermediate!6101 (undefined!6913 Bool) (index!26636 (_ BitVec 32)) (x!55435 (_ BitVec 32))) (Undefined!6101) (MissingVacant!6101 (index!26637 (_ BitVec 32))) )
))
(declare-fun lt!266871 () SeekEntryResult!6101)

(assert (=> b!588621 (= res!376256 (or (= lt!266871 (MissingZero!6101 i!1108)) (= lt!266871 (MissingVacant!6101 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36776 (_ BitVec 32)) SeekEntryResult!6101)

(assert (=> b!588621 (= lt!266871 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588622 () Bool)

(declare-fun e!336109 () Bool)

(assert (=> b!588622 (= e!336112 e!336109)))

(declare-fun res!376261 () Bool)

(assert (=> b!588622 (=> (not res!376261) (not e!336109))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!588622 (= res!376261 (= (select (store (arr!17661 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!266875 () array!36776)

(assert (=> b!588622 (= lt!266875 (array!36777 (store (arr!17661 a!2986) i!1108 k!1786) (size!18025 a!2986)))))

(declare-fun b!588623 () Bool)

(declare-fun res!376258 () Bool)

(assert (=> b!588623 (=> (not res!376258) (not e!336113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588623 (= res!376258 (validKeyInArray!0 (select (arr!17661 a!2986) j!136)))))

(declare-fun res!376252 () Bool)

(assert (=> start!53932 (=> (not res!376252) (not e!336113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53932 (= res!376252 (validMask!0 mask!3053))))

(assert (=> start!53932 e!336113))

(assert (=> start!53932 true))

(declare-fun array_inv!13457 (array!36776) Bool)

(assert (=> start!53932 (array_inv!13457 a!2986)))

(declare-fun b!588624 () Bool)

(declare-datatypes ((Unit!18322 0))(
  ( (Unit!18323) )
))
(declare-fun e!336108 () Unit!18322)

(declare-fun Unit!18324 () Unit!18322)

(assert (=> b!588624 (= e!336108 Unit!18324)))

(declare-fun b!588625 () Bool)

(declare-fun e!336110 () Bool)

(assert (=> b!588625 (= e!336110 (not true))))

(declare-fun lt!266876 () Unit!18322)

(assert (=> b!588625 (= lt!266876 e!336108)))

(declare-fun lt!266877 () (_ BitVec 64))

(declare-fun c!66551 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36776 (_ BitVec 32)) SeekEntryResult!6101)

(assert (=> b!588625 (= c!66551 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266877 lt!266875 mask!3053) Undefined!6101))))

(declare-fun e!336111 () Bool)

(assert (=> b!588625 e!336111))

(declare-fun res!376255 () Bool)

(assert (=> b!588625 (=> (not res!376255) (not e!336111))))

(declare-fun lt!266874 () SeekEntryResult!6101)

(declare-fun lt!266872 () (_ BitVec 32))

(assert (=> b!588625 (= res!376255 (= lt!266874 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266872 vacantSpotIndex!68 lt!266877 lt!266875 mask!3053)))))

(assert (=> b!588625 (= lt!266874 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266872 vacantSpotIndex!68 (select (arr!17661 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!588625 (= lt!266877 (select (store (arr!17661 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!266873 () Unit!18322)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36776 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18322)

(assert (=> b!588625 (= lt!266873 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266872 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588625 (= lt!266872 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588626 () Bool)

(declare-fun res!376251 () Bool)

(assert (=> b!588626 (=> (not res!376251) (not e!336113))))

(assert (=> b!588626 (= res!376251 (validKeyInArray!0 k!1786))))

(declare-fun b!588627 () Bool)

(assert (=> b!588627 (= e!336109 e!336110)))

(declare-fun res!376253 () Bool)

(assert (=> b!588627 (=> (not res!376253) (not e!336110))))

(declare-fun lt!266878 () SeekEntryResult!6101)

(assert (=> b!588627 (= res!376253 (and (= lt!266878 (Found!6101 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17661 a!2986) index!984) (select (arr!17661 a!2986) j!136))) (not (= (select (arr!17661 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588627 (= lt!266878 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17661 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588628 () Bool)

(declare-fun res!376262 () Bool)

(assert (=> b!588628 (=> (not res!376262) (not e!336112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36776 (_ BitVec 32)) Bool)

(assert (=> b!588628 (= res!376262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588629 () Bool)

(declare-fun res!376259 () Bool)

(assert (=> b!588629 (=> (not res!376259) (not e!336112))))

(assert (=> b!588629 (= res!376259 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17661 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588630 () Bool)

(declare-fun Unit!18325 () Unit!18322)

(assert (=> b!588630 (= e!336108 Unit!18325)))

(assert (=> b!588630 false))

(declare-fun b!588631 () Bool)

(assert (=> b!588631 (= e!336111 (= lt!266878 lt!266874))))

(declare-fun b!588632 () Bool)

(declare-fun res!376257 () Bool)

(assert (=> b!588632 (=> (not res!376257) (not e!336112))))

(declare-datatypes ((List!11702 0))(
  ( (Nil!11699) (Cons!11698 (h!12743 (_ BitVec 64)) (t!17930 List!11702)) )
))
(declare-fun arrayNoDuplicates!0 (array!36776 (_ BitVec 32) List!11702) Bool)

(assert (=> b!588632 (= res!376257 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11699))))

(assert (= (and start!53932 res!376252) b!588620))

(assert (= (and b!588620 res!376260) b!588623))

(assert (= (and b!588623 res!376258) b!588626))

(assert (= (and b!588626 res!376251) b!588619))

(assert (= (and b!588619 res!376254) b!588621))

(assert (= (and b!588621 res!376256) b!588628))

(assert (= (and b!588628 res!376262) b!588632))

(assert (= (and b!588632 res!376257) b!588629))

(assert (= (and b!588629 res!376259) b!588622))

(assert (= (and b!588622 res!376261) b!588627))

(assert (= (and b!588627 res!376253) b!588625))

(assert (= (and b!588625 res!376255) b!588631))

(assert (= (and b!588625 c!66551) b!588630))

(assert (= (and b!588625 (not c!66551)) b!588624))

(declare-fun m!567187 () Bool)

(assert (=> b!588626 m!567187))

(declare-fun m!567189 () Bool)

(assert (=> b!588632 m!567189))

(declare-fun m!567191 () Bool)

(assert (=> b!588621 m!567191))

(declare-fun m!567193 () Bool)

(assert (=> b!588627 m!567193))

(declare-fun m!567195 () Bool)

(assert (=> b!588627 m!567195))

(assert (=> b!588627 m!567195))

(declare-fun m!567197 () Bool)

(assert (=> b!588627 m!567197))

(declare-fun m!567199 () Bool)

(assert (=> b!588619 m!567199))

(assert (=> b!588623 m!567195))

(assert (=> b!588623 m!567195))

(declare-fun m!567201 () Bool)

(assert (=> b!588623 m!567201))

(declare-fun m!567203 () Bool)

(assert (=> b!588625 m!567203))

(declare-fun m!567205 () Bool)

(assert (=> b!588625 m!567205))

(assert (=> b!588625 m!567195))

(declare-fun m!567207 () Bool)

(assert (=> b!588625 m!567207))

(declare-fun m!567209 () Bool)

(assert (=> b!588625 m!567209))

(declare-fun m!567211 () Bool)

(assert (=> b!588625 m!567211))

(assert (=> b!588625 m!567195))

(declare-fun m!567213 () Bool)

(assert (=> b!588625 m!567213))

(declare-fun m!567215 () Bool)

(assert (=> b!588625 m!567215))

(declare-fun m!567217 () Bool)

(assert (=> start!53932 m!567217))

(declare-fun m!567219 () Bool)

(assert (=> start!53932 m!567219))

(assert (=> b!588622 m!567207))

(declare-fun m!567221 () Bool)

(assert (=> b!588622 m!567221))

(declare-fun m!567223 () Bool)

(assert (=> b!588628 m!567223))

(declare-fun m!567225 () Bool)

(assert (=> b!588629 m!567225))

(push 1)

