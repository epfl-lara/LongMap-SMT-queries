; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57434 () Bool)

(assert start!57434)

(declare-fun b!635660 () Bool)

(declare-fun res!411238 () Bool)

(declare-fun e!363578 () Bool)

(assert (=> b!635660 (=> (not res!411238) (not e!363578))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38224 0))(
  ( (array!38225 (arr!18339 (Array (_ BitVec 32) (_ BitVec 64))) (size!18703 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38224)

(assert (=> b!635660 (= res!411238 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18339 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635661 () Bool)

(declare-datatypes ((Unit!21450 0))(
  ( (Unit!21451) )
))
(declare-fun e!363584 () Unit!21450)

(declare-fun Unit!21452 () Unit!21450)

(assert (=> b!635661 (= e!363584 Unit!21452)))

(declare-fun b!635662 () Bool)

(declare-fun res!411249 () Bool)

(assert (=> b!635662 (=> (not res!411249) (not e!363578))))

(declare-datatypes ((List!12380 0))(
  ( (Nil!12377) (Cons!12376 (h!13421 (_ BitVec 64)) (t!18608 List!12380)) )
))
(declare-fun arrayNoDuplicates!0 (array!38224 (_ BitVec 32) List!12380) Bool)

(assert (=> b!635662 (= res!411249 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12377))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!635663 () Bool)

(declare-fun lt!293931 () array!38224)

(declare-fun e!363582 () Bool)

(declare-fun arrayContainsKey!0 (array!38224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635663 (= e!363582 (arrayContainsKey!0 lt!293931 (select (arr!18339 a!2986) j!136) index!984))))

(declare-fun b!635664 () Bool)

(declare-fun e!363577 () Bool)

(declare-fun e!363588 () Bool)

(assert (=> b!635664 (= e!363577 (not e!363588))))

(declare-fun res!411251 () Bool)

(assert (=> b!635664 (=> res!411251 e!363588)))

(declare-datatypes ((SeekEntryResult!6779 0))(
  ( (MissingZero!6779 (index!29421 (_ BitVec 32))) (Found!6779 (index!29422 (_ BitVec 32))) (Intermediate!6779 (undefined!7591 Bool) (index!29423 (_ BitVec 32)) (x!58170 (_ BitVec 32))) (Undefined!6779) (MissingVacant!6779 (index!29424 (_ BitVec 32))) )
))
(declare-fun lt!293933 () SeekEntryResult!6779)

(assert (=> b!635664 (= res!411251 (not (= lt!293933 (Found!6779 index!984))))))

(declare-fun lt!293925 () Unit!21450)

(assert (=> b!635664 (= lt!293925 e!363584)))

(declare-fun c!72578 () Bool)

(assert (=> b!635664 (= c!72578 (= lt!293933 Undefined!6779))))

(declare-fun lt!293935 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38224 (_ BitVec 32)) SeekEntryResult!6779)

(assert (=> b!635664 (= lt!293933 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293935 lt!293931 mask!3053))))

(declare-fun e!363587 () Bool)

(assert (=> b!635664 e!363587))

(declare-fun res!411253 () Bool)

(assert (=> b!635664 (=> (not res!411253) (not e!363587))))

(declare-fun lt!293927 () (_ BitVec 32))

(declare-fun lt!293926 () SeekEntryResult!6779)

(assert (=> b!635664 (= res!411253 (= lt!293926 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293927 vacantSpotIndex!68 lt!293935 lt!293931 mask!3053)))))

(assert (=> b!635664 (= lt!293926 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293927 vacantSpotIndex!68 (select (arr!18339 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!635664 (= lt!293935 (select (store (arr!18339 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293934 () Unit!21450)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38224 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21450)

(assert (=> b!635664 (= lt!293934 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293927 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635664 (= lt!293927 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635665 () Bool)

(declare-fun res!411254 () Bool)

(assert (=> b!635665 (=> (not res!411254) (not e!363578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38224 (_ BitVec 32)) Bool)

(assert (=> b!635665 (= res!411254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635666 () Bool)

(declare-fun res!411250 () Bool)

(declare-fun e!363580 () Bool)

(assert (=> b!635666 (=> (not res!411250) (not e!363580))))

(assert (=> b!635666 (= res!411250 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635667 () Bool)

(declare-fun e!363581 () Bool)

(assert (=> b!635667 (= e!363581 e!363577)))

(declare-fun res!411252 () Bool)

(assert (=> b!635667 (=> (not res!411252) (not e!363577))))

(declare-fun lt!293930 () SeekEntryResult!6779)

(assert (=> b!635667 (= res!411252 (and (= lt!293930 (Found!6779 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18339 a!2986) index!984) (select (arr!18339 a!2986) j!136))) (not (= (select (arr!18339 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635667 (= lt!293930 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18339 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635668 () Bool)

(assert (=> b!635668 (= e!363587 (= lt!293930 lt!293926))))

(declare-fun b!635669 () Bool)

(declare-fun Unit!21453 () Unit!21450)

(assert (=> b!635669 (= e!363584 Unit!21453)))

(assert (=> b!635669 false))

(declare-fun b!635670 () Bool)

(declare-fun res!411247 () Bool)

(assert (=> b!635670 (=> (not res!411247) (not e!363580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635670 (= res!411247 (validKeyInArray!0 k!1786))))

(declare-fun b!635671 () Bool)

(assert (=> b!635671 (= e!363580 e!363578)))

(declare-fun res!411240 () Bool)

(assert (=> b!635671 (=> (not res!411240) (not e!363578))))

(declare-fun lt!293929 () SeekEntryResult!6779)

(assert (=> b!635671 (= res!411240 (or (= lt!293929 (MissingZero!6779 i!1108)) (= lt!293929 (MissingVacant!6779 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38224 (_ BitVec 32)) SeekEntryResult!6779)

(assert (=> b!635671 (= lt!293929 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!635672 () Bool)

(declare-fun e!363586 () Bool)

(assert (=> b!635672 (= e!363586 e!363582)))

(declare-fun res!411242 () Bool)

(assert (=> b!635672 (=> (not res!411242) (not e!363582))))

(assert (=> b!635672 (= res!411242 (arrayContainsKey!0 lt!293931 (select (arr!18339 a!2986) j!136) j!136))))

(declare-fun b!635673 () Bool)

(declare-fun res!411239 () Bool)

(assert (=> b!635673 (=> (not res!411239) (not e!363580))))

(assert (=> b!635673 (= res!411239 (and (= (size!18703 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18703 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18703 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635674 () Bool)

(declare-fun e!363585 () Bool)

(assert (=> b!635674 (= e!363585 e!363586)))

(declare-fun res!411245 () Bool)

(assert (=> b!635674 (=> res!411245 e!363586)))

(declare-fun lt!293928 () (_ BitVec 64))

(assert (=> b!635674 (= res!411245 (or (not (= (select (arr!18339 a!2986) j!136) lt!293935)) (not (= (select (arr!18339 a!2986) j!136) lt!293928)) (bvsge j!136 index!984)))))

(declare-fun res!411244 () Bool)

(assert (=> start!57434 (=> (not res!411244) (not e!363580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57434 (= res!411244 (validMask!0 mask!3053))))

(assert (=> start!57434 e!363580))

(assert (=> start!57434 true))

(declare-fun array_inv!14135 (array!38224) Bool)

(assert (=> start!57434 (array_inv!14135 a!2986)))

(declare-fun b!635675 () Bool)

(declare-fun e!363579 () Bool)

(assert (=> b!635675 (= e!363588 e!363579)))

(declare-fun res!411248 () Bool)

(assert (=> b!635675 (=> res!411248 e!363579)))

(assert (=> b!635675 (= res!411248 (or (not (= (select (arr!18339 a!2986) j!136) lt!293935)) (not (= (select (arr!18339 a!2986) j!136) lt!293928)) (bvsge j!136 index!984)))))

(assert (=> b!635675 e!363585))

(declare-fun res!411241 () Bool)

(assert (=> b!635675 (=> (not res!411241) (not e!363585))))

(assert (=> b!635675 (= res!411241 (= lt!293928 (select (arr!18339 a!2986) j!136)))))

(assert (=> b!635675 (= lt!293928 (select (store (arr!18339 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!635676 () Bool)

(declare-fun res!411243 () Bool)

(assert (=> b!635676 (=> (not res!411243) (not e!363580))))

(assert (=> b!635676 (= res!411243 (validKeyInArray!0 (select (arr!18339 a!2986) j!136)))))

(declare-fun b!635677 () Bool)

(assert (=> b!635677 (= e!363579 (or (bvsge (size!18703 a!2986) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!18703 a!2986))))))

(assert (=> b!635677 (arrayContainsKey!0 lt!293931 (select (arr!18339 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293932 () Unit!21450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38224 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21450)

(assert (=> b!635677 (= lt!293932 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293931 (select (arr!18339 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635678 () Bool)

(assert (=> b!635678 (= e!363578 e!363581)))

(declare-fun res!411246 () Bool)

(assert (=> b!635678 (=> (not res!411246) (not e!363581))))

(assert (=> b!635678 (= res!411246 (= (select (store (arr!18339 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635678 (= lt!293931 (array!38225 (store (arr!18339 a!2986) i!1108 k!1786) (size!18703 a!2986)))))

(assert (= (and start!57434 res!411244) b!635673))

(assert (= (and b!635673 res!411239) b!635676))

(assert (= (and b!635676 res!411243) b!635670))

(assert (= (and b!635670 res!411247) b!635666))

(assert (= (and b!635666 res!411250) b!635671))

(assert (= (and b!635671 res!411240) b!635665))

(assert (= (and b!635665 res!411254) b!635662))

(assert (= (and b!635662 res!411249) b!635660))

(assert (= (and b!635660 res!411238) b!635678))

(assert (= (and b!635678 res!411246) b!635667))

(assert (= (and b!635667 res!411252) b!635664))

(assert (= (and b!635664 res!411253) b!635668))

(assert (= (and b!635664 c!72578) b!635669))

(assert (= (and b!635664 (not c!72578)) b!635661))

(assert (= (and b!635664 (not res!411251)) b!635675))

(assert (= (and b!635675 res!411241) b!635674))

(assert (= (and b!635674 (not res!411245)) b!635672))

(assert (= (and b!635672 res!411242) b!635663))

(assert (= (and b!635675 (not res!411248)) b!635677))

(declare-fun m!609989 () Bool)

(assert (=> b!635662 m!609989))

(declare-fun m!609991 () Bool)

(assert (=> b!635663 m!609991))

(assert (=> b!635663 m!609991))

(declare-fun m!609993 () Bool)

(assert (=> b!635663 m!609993))

(assert (=> b!635674 m!609991))

(declare-fun m!609995 () Bool)

(assert (=> b!635678 m!609995))

(declare-fun m!609997 () Bool)

(assert (=> b!635678 m!609997))

(declare-fun m!609999 () Bool)

(assert (=> b!635666 m!609999))

(declare-fun m!610001 () Bool)

(assert (=> b!635670 m!610001))

(assert (=> b!635676 m!609991))

(assert (=> b!635676 m!609991))

(declare-fun m!610003 () Bool)

(assert (=> b!635676 m!610003))

(assert (=> b!635677 m!609991))

(assert (=> b!635677 m!609991))

(declare-fun m!610005 () Bool)

(assert (=> b!635677 m!610005))

(assert (=> b!635677 m!609991))

(declare-fun m!610007 () Bool)

(assert (=> b!635677 m!610007))

(declare-fun m!610009 () Bool)

(assert (=> b!635667 m!610009))

(assert (=> b!635667 m!609991))

(assert (=> b!635667 m!609991))

(declare-fun m!610011 () Bool)

(assert (=> b!635667 m!610011))

(declare-fun m!610013 () Bool)

(assert (=> b!635664 m!610013))

(declare-fun m!610015 () Bool)

(assert (=> b!635664 m!610015))

(declare-fun m!610017 () Bool)

(assert (=> b!635664 m!610017))

(assert (=> b!635664 m!609991))

(assert (=> b!635664 m!609995))

(declare-fun m!610019 () Bool)

(assert (=> b!635664 m!610019))

(declare-fun m!610021 () Bool)

(assert (=> b!635664 m!610021))

(assert (=> b!635664 m!609991))

(declare-fun m!610023 () Bool)

(assert (=> b!635664 m!610023))

(declare-fun m!610025 () Bool)

(assert (=> b!635660 m!610025))

(assert (=> b!635675 m!609991))

(assert (=> b!635675 m!609995))

(declare-fun m!610027 () Bool)

(assert (=> b!635675 m!610027))

(declare-fun m!610029 () Bool)

(assert (=> b!635671 m!610029))

(declare-fun m!610031 () Bool)

(assert (=> b!635665 m!610031))

(declare-fun m!610033 () Bool)

(assert (=> start!57434 m!610033))

(declare-fun m!610035 () Bool)

(assert (=> start!57434 m!610035))

(assert (=> b!635672 m!609991))

(assert (=> b!635672 m!609991))

(declare-fun m!610037 () Bool)

(assert (=> b!635672 m!610037))

(push 1)

