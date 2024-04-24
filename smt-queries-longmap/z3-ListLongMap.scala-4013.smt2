; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54600 () Bool)

(assert start!54600)

(declare-fun res!382250 () Bool)

(declare-fun e!340843 () Bool)

(assert (=> start!54600 (=> (not res!382250) (not e!340843))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54600 (= res!382250 (validMask!0 mask!3053))))

(assert (=> start!54600 e!340843))

(assert (=> start!54600 true))

(declare-datatypes ((array!37005 0))(
  ( (array!37006 (arr!17764 (Array (_ BitVec 32) (_ BitVec 64))) (size!18128 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37005)

(declare-fun array_inv!13623 (array!37005) Bool)

(assert (=> start!54600 (array_inv!13623 a!2986)))

(declare-fun b!596553 () Bool)

(declare-fun res!382249 () Bool)

(assert (=> b!596553 (=> (not res!382249) (not e!340843))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596553 (= res!382249 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596554 () Bool)

(declare-fun e!340853 () Bool)

(declare-fun e!340849 () Bool)

(assert (=> b!596554 (= e!340853 e!340849)))

(declare-fun res!382254 () Bool)

(assert (=> b!596554 (=> res!382254 e!340849)))

(assert (=> b!596554 (= res!382254 (or (bvsge (size!18128 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18128 a!2986))))))

(declare-fun lt!270947 () array!37005)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!596554 (arrayContainsKey!0 lt!270947 (select (arr!17764 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18733 0))(
  ( (Unit!18734) )
))
(declare-fun lt!270951 () Unit!18733)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37005 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18733)

(assert (=> b!596554 (= lt!270951 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270947 (select (arr!17764 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596555 () Bool)

(declare-fun res!382264 () Bool)

(declare-fun e!340845 () Bool)

(assert (=> b!596555 (=> (not res!382264) (not e!340845))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!596555 (= res!382264 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17764 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596556 () Bool)

(declare-fun res!382262 () Bool)

(assert (=> b!596556 (=> res!382262 e!340849)))

(declare-datatypes ((List!11712 0))(
  ( (Nil!11709) (Cons!11708 (h!12756 (_ BitVec 64)) (t!17932 List!11712)) )
))
(declare-fun contains!2921 (List!11712 (_ BitVec 64)) Bool)

(assert (=> b!596556 (= res!382262 (contains!2921 Nil!11709 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596557 () Bool)

(declare-fun e!340844 () Bool)

(declare-fun e!340847 () Bool)

(assert (=> b!596557 (= e!340844 e!340847)))

(declare-fun res!382251 () Bool)

(assert (=> b!596557 (=> res!382251 e!340847)))

(declare-fun lt!270945 () (_ BitVec 64))

(declare-fun lt!270948 () (_ BitVec 64))

(assert (=> b!596557 (= res!382251 (or (not (= (select (arr!17764 a!2986) j!136) lt!270945)) (not (= (select (arr!17764 a!2986) j!136) lt!270948)) (bvsge j!136 index!984)))))

(declare-fun b!596558 () Bool)

(declare-fun e!340851 () Bool)

(assert (=> b!596558 (= e!340851 e!340853)))

(declare-fun res!382247 () Bool)

(assert (=> b!596558 (=> res!382247 e!340853)))

(assert (=> b!596558 (= res!382247 (or (not (= (select (arr!17764 a!2986) j!136) lt!270945)) (not (= (select (arr!17764 a!2986) j!136) lt!270948)) (bvsge j!136 index!984)))))

(assert (=> b!596558 e!340844))

(declare-fun res!382258 () Bool)

(assert (=> b!596558 (=> (not res!382258) (not e!340844))))

(assert (=> b!596558 (= res!382258 (= lt!270948 (select (arr!17764 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596558 (= lt!270948 (select (store (arr!17764 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596559 () Bool)

(assert (=> b!596559 (= e!340843 e!340845)))

(declare-fun res!382257 () Bool)

(assert (=> b!596559 (=> (not res!382257) (not e!340845))))

(declare-datatypes ((SeekEntryResult!6160 0))(
  ( (MissingZero!6160 (index!26888 (_ BitVec 32))) (Found!6160 (index!26889 (_ BitVec 32))) (Intermediate!6160 (undefined!6972 Bool) (index!26890 (_ BitVec 32)) (x!55839 (_ BitVec 32))) (Undefined!6160) (MissingVacant!6160 (index!26891 (_ BitVec 32))) )
))
(declare-fun lt!270949 () SeekEntryResult!6160)

(assert (=> b!596559 (= res!382257 (or (= lt!270949 (MissingZero!6160 i!1108)) (= lt!270949 (MissingVacant!6160 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37005 (_ BitVec 32)) SeekEntryResult!6160)

(assert (=> b!596559 (= lt!270949 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun e!340850 () Bool)

(declare-fun b!596560 () Bool)

(assert (=> b!596560 (= e!340850 (arrayContainsKey!0 lt!270947 (select (arr!17764 a!2986) j!136) index!984))))

(declare-fun b!596561 () Bool)

(declare-fun e!340852 () Bool)

(assert (=> b!596561 (= e!340845 e!340852)))

(declare-fun res!382261 () Bool)

(assert (=> b!596561 (=> (not res!382261) (not e!340852))))

(assert (=> b!596561 (= res!382261 (= (select (store (arr!17764 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596561 (= lt!270947 (array!37006 (store (arr!17764 a!2986) i!1108 k0!1786) (size!18128 a!2986)))))

(declare-fun b!596562 () Bool)

(declare-fun res!382260 () Bool)

(assert (=> b!596562 (=> (not res!382260) (not e!340845))))

(declare-fun arrayNoDuplicates!0 (array!37005 (_ BitVec 32) List!11712) Bool)

(assert (=> b!596562 (= res!382260 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11709))))

(declare-fun b!596563 () Bool)

(declare-fun res!382253 () Bool)

(assert (=> b!596563 (=> (not res!382253) (not e!340843))))

(assert (=> b!596563 (= res!382253 (and (= (size!18128 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18128 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18128 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596564 () Bool)

(declare-fun res!382255 () Bool)

(assert (=> b!596564 (=> (not res!382255) (not e!340843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596564 (= res!382255 (validKeyInArray!0 k0!1786))))

(declare-fun b!596565 () Bool)

(declare-fun e!340842 () Unit!18733)

(declare-fun Unit!18735 () Unit!18733)

(assert (=> b!596565 (= e!340842 Unit!18735)))

(assert (=> b!596565 false))

(declare-fun b!596566 () Bool)

(declare-fun e!340854 () Bool)

(assert (=> b!596566 (= e!340854 (not e!340851))))

(declare-fun res!382256 () Bool)

(assert (=> b!596566 (=> res!382256 e!340851)))

(declare-fun lt!270946 () SeekEntryResult!6160)

(assert (=> b!596566 (= res!382256 (not (= lt!270946 (Found!6160 index!984))))))

(declare-fun lt!270954 () Unit!18733)

(assert (=> b!596566 (= lt!270954 e!340842)))

(declare-fun c!67523 () Bool)

(assert (=> b!596566 (= c!67523 (= lt!270946 Undefined!6160))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37005 (_ BitVec 32)) SeekEntryResult!6160)

(assert (=> b!596566 (= lt!270946 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270945 lt!270947 mask!3053))))

(declare-fun e!340846 () Bool)

(assert (=> b!596566 e!340846))

(declare-fun res!382259 () Bool)

(assert (=> b!596566 (=> (not res!382259) (not e!340846))))

(declare-fun lt!270944 () SeekEntryResult!6160)

(declare-fun lt!270955 () (_ BitVec 32))

(assert (=> b!596566 (= res!382259 (= lt!270944 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270955 vacantSpotIndex!68 lt!270945 lt!270947 mask!3053)))))

(assert (=> b!596566 (= lt!270944 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270955 vacantSpotIndex!68 (select (arr!17764 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596566 (= lt!270945 (select (store (arr!17764 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270952 () Unit!18733)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37005 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18733)

(assert (=> b!596566 (= lt!270952 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270955 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596566 (= lt!270955 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!596567 () Bool)

(assert (=> b!596567 (= e!340847 e!340850)))

(declare-fun res!382263 () Bool)

(assert (=> b!596567 (=> (not res!382263) (not e!340850))))

(assert (=> b!596567 (= res!382263 (arrayContainsKey!0 lt!270947 (select (arr!17764 a!2986) j!136) j!136))))

(declare-fun b!596568 () Bool)

(declare-fun res!382244 () Bool)

(assert (=> b!596568 (=> res!382244 e!340849)))

(assert (=> b!596568 (= res!382244 (contains!2921 Nil!11709 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596569 () Bool)

(declare-fun res!382245 () Bool)

(assert (=> b!596569 (=> (not res!382245) (not e!340845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37005 (_ BitVec 32)) Bool)

(assert (=> b!596569 (= res!382245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596570 () Bool)

(declare-fun Unit!18736 () Unit!18733)

(assert (=> b!596570 (= e!340842 Unit!18736)))

(declare-fun b!596571 () Bool)

(assert (=> b!596571 (= e!340852 e!340854)))

(declare-fun res!382246 () Bool)

(assert (=> b!596571 (=> (not res!382246) (not e!340854))))

(declare-fun lt!270953 () SeekEntryResult!6160)

(assert (=> b!596571 (= res!382246 (and (= lt!270953 (Found!6160 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17764 a!2986) index!984) (select (arr!17764 a!2986) j!136))) (not (= (select (arr!17764 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596571 (= lt!270953 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17764 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596572 () Bool)

(declare-fun res!382252 () Bool)

(assert (=> b!596572 (=> res!382252 e!340849)))

(declare-fun noDuplicate!268 (List!11712) Bool)

(assert (=> b!596572 (= res!382252 (not (noDuplicate!268 Nil!11709)))))

(declare-fun b!596573 () Bool)

(declare-fun res!382248 () Bool)

(assert (=> b!596573 (=> (not res!382248) (not e!340843))))

(assert (=> b!596573 (= res!382248 (validKeyInArray!0 (select (arr!17764 a!2986) j!136)))))

(declare-fun b!596574 () Bool)

(assert (=> b!596574 (= e!340846 (= lt!270953 lt!270944))))

(declare-fun b!596575 () Bool)

(assert (=> b!596575 (= e!340849 true)))

(declare-fun lt!270950 () Bool)

(assert (=> b!596575 (= lt!270950 (contains!2921 Nil!11709 k0!1786))))

(assert (= (and start!54600 res!382250) b!596563))

(assert (= (and b!596563 res!382253) b!596573))

(assert (= (and b!596573 res!382248) b!596564))

(assert (= (and b!596564 res!382255) b!596553))

(assert (= (and b!596553 res!382249) b!596559))

(assert (= (and b!596559 res!382257) b!596569))

(assert (= (and b!596569 res!382245) b!596562))

(assert (= (and b!596562 res!382260) b!596555))

(assert (= (and b!596555 res!382264) b!596561))

(assert (= (and b!596561 res!382261) b!596571))

(assert (= (and b!596571 res!382246) b!596566))

(assert (= (and b!596566 res!382259) b!596574))

(assert (= (and b!596566 c!67523) b!596565))

(assert (= (and b!596566 (not c!67523)) b!596570))

(assert (= (and b!596566 (not res!382256)) b!596558))

(assert (= (and b!596558 res!382258) b!596557))

(assert (= (and b!596557 (not res!382251)) b!596567))

(assert (= (and b!596567 res!382263) b!596560))

(assert (= (and b!596558 (not res!382247)) b!596554))

(assert (= (and b!596554 (not res!382254)) b!596572))

(assert (= (and b!596572 (not res!382252)) b!596556))

(assert (= (and b!596556 (not res!382262)) b!596568))

(assert (= (and b!596568 (not res!382244)) b!596575))

(declare-fun m!574265 () Bool)

(assert (=> b!596573 m!574265))

(assert (=> b!596573 m!574265))

(declare-fun m!574267 () Bool)

(assert (=> b!596573 m!574267))

(declare-fun m!574269 () Bool)

(assert (=> b!596553 m!574269))

(declare-fun m!574271 () Bool)

(assert (=> b!596555 m!574271))

(declare-fun m!574273 () Bool)

(assert (=> b!596568 m!574273))

(declare-fun m!574275 () Bool)

(assert (=> b!596564 m!574275))

(assert (=> b!596567 m!574265))

(assert (=> b!596567 m!574265))

(declare-fun m!574277 () Bool)

(assert (=> b!596567 m!574277))

(declare-fun m!574279 () Bool)

(assert (=> b!596569 m!574279))

(declare-fun m!574281 () Bool)

(assert (=> start!54600 m!574281))

(declare-fun m!574283 () Bool)

(assert (=> start!54600 m!574283))

(declare-fun m!574285 () Bool)

(assert (=> b!596572 m!574285))

(assert (=> b!596557 m!574265))

(declare-fun m!574287 () Bool)

(assert (=> b!596561 m!574287))

(declare-fun m!574289 () Bool)

(assert (=> b!596561 m!574289))

(declare-fun m!574291 () Bool)

(assert (=> b!596571 m!574291))

(assert (=> b!596571 m!574265))

(assert (=> b!596571 m!574265))

(declare-fun m!574293 () Bool)

(assert (=> b!596571 m!574293))

(declare-fun m!574295 () Bool)

(assert (=> b!596566 m!574295))

(declare-fun m!574297 () Bool)

(assert (=> b!596566 m!574297))

(assert (=> b!596566 m!574265))

(assert (=> b!596566 m!574287))

(assert (=> b!596566 m!574265))

(declare-fun m!574299 () Bool)

(assert (=> b!596566 m!574299))

(declare-fun m!574301 () Bool)

(assert (=> b!596566 m!574301))

(declare-fun m!574303 () Bool)

(assert (=> b!596566 m!574303))

(declare-fun m!574305 () Bool)

(assert (=> b!596566 m!574305))

(assert (=> b!596558 m!574265))

(assert (=> b!596558 m!574287))

(declare-fun m!574307 () Bool)

(assert (=> b!596558 m!574307))

(assert (=> b!596554 m!574265))

(assert (=> b!596554 m!574265))

(declare-fun m!574309 () Bool)

(assert (=> b!596554 m!574309))

(assert (=> b!596554 m!574265))

(declare-fun m!574311 () Bool)

(assert (=> b!596554 m!574311))

(assert (=> b!596560 m!574265))

(assert (=> b!596560 m!574265))

(declare-fun m!574313 () Bool)

(assert (=> b!596560 m!574313))

(declare-fun m!574315 () Bool)

(assert (=> b!596575 m!574315))

(declare-fun m!574317 () Bool)

(assert (=> b!596562 m!574317))

(declare-fun m!574319 () Bool)

(assert (=> b!596556 m!574319))

(declare-fun m!574321 () Bool)

(assert (=> b!596559 m!574321))

(check-sat (not b!596562) (not b!596566) (not b!596556) (not start!54600) (not b!596553) (not b!596568) (not b!596575) (not b!596559) (not b!596567) (not b!596572) (not b!596569) (not b!596571) (not b!596564) (not b!596560) (not b!596573) (not b!596554))
(check-sat)
