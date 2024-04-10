; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54888 () Bool)

(assert start!54888)

(declare-fun b!600581 () Bool)

(declare-fun e!343377 () Bool)

(declare-fun e!343388 () Bool)

(assert (=> b!600581 (= e!343377 (not e!343388))))

(declare-fun res!385458 () Bool)

(assert (=> b!600581 (=> res!385458 e!343388)))

(declare-datatypes ((SeekEntryResult!6261 0))(
  ( (MissingZero!6261 (index!27301 (_ BitVec 32))) (Found!6261 (index!27302 (_ BitVec 32))) (Intermediate!6261 (undefined!7073 Bool) (index!27303 (_ BitVec 32)) (x!56100 (_ BitVec 32))) (Undefined!6261) (MissingVacant!6261 (index!27304 (_ BitVec 32))) )
))
(declare-fun lt!273233 () SeekEntryResult!6261)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600581 (= res!385458 (not (= lt!273233 (Found!6261 index!984))))))

(declare-datatypes ((Unit!18962 0))(
  ( (Unit!18963) )
))
(declare-fun lt!273234 () Unit!18962)

(declare-fun e!343386 () Unit!18962)

(assert (=> b!600581 (= lt!273234 e!343386)))

(declare-fun c!67931 () Bool)

(assert (=> b!600581 (= c!67931 (= lt!273233 Undefined!6261))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!273227 () (_ BitVec 64))

(declare-datatypes ((array!37123 0))(
  ( (array!37124 (arr!17821 (Array (_ BitVec 32) (_ BitVec 64))) (size!18185 (_ BitVec 32))) )
))
(declare-fun lt!273232 () array!37123)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37123 (_ BitVec 32)) SeekEntryResult!6261)

(assert (=> b!600581 (= lt!273233 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273227 lt!273232 mask!3053))))

(declare-fun e!343385 () Bool)

(assert (=> b!600581 e!343385))

(declare-fun res!385465 () Bool)

(assert (=> b!600581 (=> (not res!385465) (not e!343385))))

(declare-fun lt!273235 () SeekEntryResult!6261)

(declare-fun lt!273228 () (_ BitVec 32))

(assert (=> b!600581 (= res!385465 (= lt!273235 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273228 vacantSpotIndex!68 lt!273227 lt!273232 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37123)

(assert (=> b!600581 (= lt!273235 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273228 vacantSpotIndex!68 (select (arr!17821 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!600581 (= lt!273227 (select (store (arr!17821 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273229 () Unit!18962)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37123 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18962)

(assert (=> b!600581 (= lt!273229 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273228 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600581 (= lt!273228 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!385459 () Bool)

(declare-fun e!343381 () Bool)

(assert (=> start!54888 (=> (not res!385459) (not e!343381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54888 (= res!385459 (validMask!0 mask!3053))))

(assert (=> start!54888 e!343381))

(assert (=> start!54888 true))

(declare-fun array_inv!13617 (array!37123) Bool)

(assert (=> start!54888 (array_inv!13617 a!2986)))

(declare-fun b!600582 () Bool)

(declare-fun e!343382 () Bool)

(assert (=> b!600582 (= e!343381 e!343382)))

(declare-fun res!385471 () Bool)

(assert (=> b!600582 (=> (not res!385471) (not e!343382))))

(declare-fun lt!273224 () SeekEntryResult!6261)

(assert (=> b!600582 (= res!385471 (or (= lt!273224 (MissingZero!6261 i!1108)) (= lt!273224 (MissingVacant!6261 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37123 (_ BitVec 32)) SeekEntryResult!6261)

(assert (=> b!600582 (= lt!273224 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600583 () Bool)

(declare-fun res!385472 () Bool)

(assert (=> b!600583 (=> (not res!385472) (not e!343381))))

(declare-fun arrayContainsKey!0 (array!37123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600583 (= res!385472 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600584 () Bool)

(declare-fun res!385468 () Bool)

(declare-fun e!343387 () Bool)

(assert (=> b!600584 (=> res!385468 e!343387)))

(declare-datatypes ((List!11862 0))(
  ( (Nil!11859) (Cons!11858 (h!12903 (_ BitVec 64)) (t!18090 List!11862)) )
))
(declare-fun noDuplicate!295 (List!11862) Bool)

(assert (=> b!600584 (= res!385468 (not (noDuplicate!295 Nil!11859)))))

(declare-fun b!600585 () Bool)

(declare-fun res!385453 () Bool)

(assert (=> b!600585 (=> (not res!385453) (not e!343381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600585 (= res!385453 (validKeyInArray!0 k0!1786))))

(declare-fun b!600586 () Bool)

(declare-fun res!385461 () Bool)

(assert (=> b!600586 (=> res!385461 e!343387)))

(declare-fun contains!2978 (List!11862 (_ BitVec 64)) Bool)

(assert (=> b!600586 (= res!385461 (contains!2978 Nil!11859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600587 () Bool)

(declare-fun Unit!18964 () Unit!18962)

(assert (=> b!600587 (= e!343386 Unit!18964)))

(declare-fun b!600588 () Bool)

(declare-fun lt!273226 () SeekEntryResult!6261)

(assert (=> b!600588 (= e!343385 (= lt!273226 lt!273235))))

(declare-fun b!600589 () Bool)

(declare-fun e!343380 () Bool)

(assert (=> b!600589 (= e!343388 e!343380)))

(declare-fun res!385463 () Bool)

(assert (=> b!600589 (=> res!385463 e!343380)))

(declare-fun lt!273222 () (_ BitVec 64))

(assert (=> b!600589 (= res!385463 (or (not (= (select (arr!17821 a!2986) j!136) lt!273227)) (not (= (select (arr!17821 a!2986) j!136) lt!273222)) (bvsge j!136 index!984)))))

(declare-fun e!343378 () Bool)

(assert (=> b!600589 e!343378))

(declare-fun res!385456 () Bool)

(assert (=> b!600589 (=> (not res!385456) (not e!343378))))

(assert (=> b!600589 (= res!385456 (= lt!273222 (select (arr!17821 a!2986) j!136)))))

(assert (=> b!600589 (= lt!273222 (select (store (arr!17821 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600590 () Bool)

(declare-fun res!385466 () Bool)

(assert (=> b!600590 (=> (not res!385466) (not e!343382))))

(declare-fun arrayNoDuplicates!0 (array!37123 (_ BitVec 32) List!11862) Bool)

(assert (=> b!600590 (= res!385466 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11859))))

(declare-fun b!600591 () Bool)

(declare-fun Unit!18965 () Unit!18962)

(assert (=> b!600591 (= e!343386 Unit!18965)))

(assert (=> b!600591 false))

(declare-fun b!600592 () Bool)

(declare-fun res!385457 () Bool)

(assert (=> b!600592 (=> (not res!385457) (not e!343382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37123 (_ BitVec 32)) Bool)

(assert (=> b!600592 (= res!385457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600593 () Bool)

(declare-fun res!385470 () Bool)

(assert (=> b!600593 (=> (not res!385470) (not e!343381))))

(assert (=> b!600593 (= res!385470 (and (= (size!18185 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18185 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18185 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600594 () Bool)

(declare-fun e!343389 () Bool)

(assert (=> b!600594 (= e!343389 (arrayContainsKey!0 lt!273232 (select (arr!17821 a!2986) j!136) index!984))))

(declare-fun b!600595 () Bool)

(declare-fun e!343383 () Bool)

(assert (=> b!600595 (= e!343383 e!343377)))

(declare-fun res!385467 () Bool)

(assert (=> b!600595 (=> (not res!385467) (not e!343377))))

(assert (=> b!600595 (= res!385467 (and (= lt!273226 (Found!6261 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17821 a!2986) index!984) (select (arr!17821 a!2986) j!136))) (not (= (select (arr!17821 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600595 (= lt!273226 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17821 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600596 () Bool)

(declare-fun res!385455 () Bool)

(assert (=> b!600596 (=> (not res!385455) (not e!343382))))

(assert (=> b!600596 (= res!385455 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17821 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600597 () Bool)

(assert (=> b!600597 (= e!343387 true)))

(declare-fun lt!273223 () Bool)

(assert (=> b!600597 (= lt!273223 (contains!2978 Nil!11859 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600598 () Bool)

(declare-fun e!343384 () Bool)

(assert (=> b!600598 (= e!343378 e!343384)))

(declare-fun res!385460 () Bool)

(assert (=> b!600598 (=> res!385460 e!343384)))

(assert (=> b!600598 (= res!385460 (or (not (= (select (arr!17821 a!2986) j!136) lt!273227)) (not (= (select (arr!17821 a!2986) j!136) lt!273222)) (bvsge j!136 index!984)))))

(declare-fun b!600599 () Bool)

(declare-fun res!385464 () Bool)

(assert (=> b!600599 (=> (not res!385464) (not e!343381))))

(assert (=> b!600599 (= res!385464 (validKeyInArray!0 (select (arr!17821 a!2986) j!136)))))

(declare-fun b!600600 () Bool)

(assert (=> b!600600 (= e!343380 e!343387)))

(declare-fun res!385462 () Bool)

(assert (=> b!600600 (=> res!385462 e!343387)))

(assert (=> b!600600 (= res!385462 (or (bvsge (size!18185 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18185 a!2986))))))

(assert (=> b!600600 (arrayNoDuplicates!0 lt!273232 j!136 Nil!11859)))

(declare-fun lt!273225 () Unit!18962)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37123 (_ BitVec 32) (_ BitVec 32)) Unit!18962)

(assert (=> b!600600 (= lt!273225 (lemmaNoDuplicateFromThenFromBigger!0 lt!273232 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600600 (arrayNoDuplicates!0 lt!273232 #b00000000000000000000000000000000 Nil!11859)))

(declare-fun lt!273230 () Unit!18962)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37123 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11862) Unit!18962)

(assert (=> b!600600 (= lt!273230 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11859))))

(assert (=> b!600600 (arrayContainsKey!0 lt!273232 (select (arr!17821 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273231 () Unit!18962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37123 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18962)

(assert (=> b!600600 (= lt!273231 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273232 (select (arr!17821 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600601 () Bool)

(assert (=> b!600601 (= e!343384 e!343389)))

(declare-fun res!385454 () Bool)

(assert (=> b!600601 (=> (not res!385454) (not e!343389))))

(assert (=> b!600601 (= res!385454 (arrayContainsKey!0 lt!273232 (select (arr!17821 a!2986) j!136) j!136))))

(declare-fun b!600602 () Bool)

(assert (=> b!600602 (= e!343382 e!343383)))

(declare-fun res!385469 () Bool)

(assert (=> b!600602 (=> (not res!385469) (not e!343383))))

(assert (=> b!600602 (= res!385469 (= (select (store (arr!17821 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600602 (= lt!273232 (array!37124 (store (arr!17821 a!2986) i!1108 k0!1786) (size!18185 a!2986)))))

(assert (= (and start!54888 res!385459) b!600593))

(assert (= (and b!600593 res!385470) b!600599))

(assert (= (and b!600599 res!385464) b!600585))

(assert (= (and b!600585 res!385453) b!600583))

(assert (= (and b!600583 res!385472) b!600582))

(assert (= (and b!600582 res!385471) b!600592))

(assert (= (and b!600592 res!385457) b!600590))

(assert (= (and b!600590 res!385466) b!600596))

(assert (= (and b!600596 res!385455) b!600602))

(assert (= (and b!600602 res!385469) b!600595))

(assert (= (and b!600595 res!385467) b!600581))

(assert (= (and b!600581 res!385465) b!600588))

(assert (= (and b!600581 c!67931) b!600591))

(assert (= (and b!600581 (not c!67931)) b!600587))

(assert (= (and b!600581 (not res!385458)) b!600589))

(assert (= (and b!600589 res!385456) b!600598))

(assert (= (and b!600598 (not res!385460)) b!600601))

(assert (= (and b!600601 res!385454) b!600594))

(assert (= (and b!600589 (not res!385463)) b!600600))

(assert (= (and b!600600 (not res!385462)) b!600584))

(assert (= (and b!600584 (not res!385468)) b!600586))

(assert (= (and b!600586 (not res!385461)) b!600597))

(declare-fun m!577797 () Bool)

(assert (=> start!54888 m!577797))

(declare-fun m!577799 () Bool)

(assert (=> start!54888 m!577799))

(declare-fun m!577801 () Bool)

(assert (=> b!600596 m!577801))

(declare-fun m!577803 () Bool)

(assert (=> b!600585 m!577803))

(declare-fun m!577805 () Bool)

(assert (=> b!600600 m!577805))

(declare-fun m!577807 () Bool)

(assert (=> b!600600 m!577807))

(declare-fun m!577809 () Bool)

(assert (=> b!600600 m!577809))

(declare-fun m!577811 () Bool)

(assert (=> b!600600 m!577811))

(assert (=> b!600600 m!577805))

(declare-fun m!577813 () Bool)

(assert (=> b!600600 m!577813))

(declare-fun m!577815 () Bool)

(assert (=> b!600600 m!577815))

(assert (=> b!600600 m!577805))

(declare-fun m!577817 () Bool)

(assert (=> b!600600 m!577817))

(declare-fun m!577819 () Bool)

(assert (=> b!600581 m!577819))

(assert (=> b!600581 m!577805))

(declare-fun m!577821 () Bool)

(assert (=> b!600581 m!577821))

(declare-fun m!577823 () Bool)

(assert (=> b!600581 m!577823))

(declare-fun m!577825 () Bool)

(assert (=> b!600581 m!577825))

(assert (=> b!600581 m!577805))

(declare-fun m!577827 () Bool)

(assert (=> b!600581 m!577827))

(declare-fun m!577829 () Bool)

(assert (=> b!600581 m!577829))

(declare-fun m!577831 () Bool)

(assert (=> b!600581 m!577831))

(assert (=> b!600598 m!577805))

(assert (=> b!600599 m!577805))

(assert (=> b!600599 m!577805))

(declare-fun m!577833 () Bool)

(assert (=> b!600599 m!577833))

(assert (=> b!600589 m!577805))

(assert (=> b!600589 m!577831))

(declare-fun m!577835 () Bool)

(assert (=> b!600589 m!577835))

(assert (=> b!600602 m!577831))

(declare-fun m!577837 () Bool)

(assert (=> b!600602 m!577837))

(declare-fun m!577839 () Bool)

(assert (=> b!600592 m!577839))

(declare-fun m!577841 () Bool)

(assert (=> b!600595 m!577841))

(assert (=> b!600595 m!577805))

(assert (=> b!600595 m!577805))

(declare-fun m!577843 () Bool)

(assert (=> b!600595 m!577843))

(declare-fun m!577845 () Bool)

(assert (=> b!600586 m!577845))

(assert (=> b!600594 m!577805))

(assert (=> b!600594 m!577805))

(declare-fun m!577847 () Bool)

(assert (=> b!600594 m!577847))

(declare-fun m!577849 () Bool)

(assert (=> b!600582 m!577849))

(declare-fun m!577851 () Bool)

(assert (=> b!600584 m!577851))

(declare-fun m!577853 () Bool)

(assert (=> b!600597 m!577853))

(declare-fun m!577855 () Bool)

(assert (=> b!600583 m!577855))

(assert (=> b!600601 m!577805))

(assert (=> b!600601 m!577805))

(declare-fun m!577857 () Bool)

(assert (=> b!600601 m!577857))

(declare-fun m!577859 () Bool)

(assert (=> b!600590 m!577859))

(check-sat (not b!600597) (not b!600590) (not b!600599) (not b!600584) (not b!600586) (not b!600582) (not b!600583) (not b!600600) (not b!600595) (not b!600581) (not b!600592) (not b!600594) (not b!600601) (not start!54888) (not b!600585))
(check-sat)
