; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54126 () Bool)

(assert start!54126)

(declare-fun b!590945 () Bool)

(declare-fun res!378066 () Bool)

(declare-fun e!337389 () Bool)

(assert (=> b!590945 (=> (not res!378066) (not e!337389))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36870 0))(
  ( (array!36871 (arr!17705 (Array (_ BitVec 32) (_ BitVec 64))) (size!18070 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36870)

(assert (=> b!590945 (= res!378066 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17705 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590946 () Bool)

(declare-datatypes ((Unit!18480 0))(
  ( (Unit!18481) )
))
(declare-fun e!337393 () Unit!18480)

(declare-fun Unit!18482 () Unit!18480)

(assert (=> b!590946 (= e!337393 Unit!18482)))

(declare-fun b!590947 () Bool)

(declare-fun res!378063 () Bool)

(declare-fun e!337396 () Bool)

(assert (=> b!590947 (=> (not res!378063) (not e!337396))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590947 (= res!378063 (validKeyInArray!0 (select (arr!17705 a!2986) j!136)))))

(declare-fun b!590948 () Bool)

(declare-fun e!337388 () Bool)

(assert (=> b!590948 (= e!337388 true)))

(declare-fun e!337398 () Bool)

(assert (=> b!590948 e!337398))

(declare-fun res!378055 () Bool)

(assert (=> b!590948 (=> (not res!378055) (not e!337398))))

(declare-fun lt!268014 () (_ BitVec 64))

(assert (=> b!590948 (= res!378055 (= lt!268014 (select (arr!17705 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!590948 (= lt!268014 (select (store (arr!17705 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!590949 () Bool)

(declare-fun e!337395 () Bool)

(declare-fun lt!268016 () array!36870)

(declare-fun arrayContainsKey!0 (array!36870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590949 (= e!337395 (arrayContainsKey!0 lt!268016 (select (arr!17705 a!2986) j!136) index!984))))

(declare-fun b!590950 () Bool)

(declare-fun res!378067 () Bool)

(assert (=> b!590950 (=> (not res!378067) (not e!337396))))

(assert (=> b!590950 (= res!378067 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590952 () Bool)

(declare-fun res!378061 () Bool)

(assert (=> b!590952 (=> (not res!378061) (not e!337389))))

(declare-datatypes ((List!11785 0))(
  ( (Nil!11782) (Cons!11781 (h!12826 (_ BitVec 64)) (t!18004 List!11785)) )
))
(declare-fun arrayNoDuplicates!0 (array!36870 (_ BitVec 32) List!11785) Bool)

(assert (=> b!590952 (= res!378061 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11782))))

(declare-fun b!590953 () Bool)

(declare-fun e!337391 () Bool)

(assert (=> b!590953 (= e!337389 e!337391)))

(declare-fun res!378065 () Bool)

(assert (=> b!590953 (=> (not res!378065) (not e!337391))))

(assert (=> b!590953 (= res!378065 (= (select (store (arr!17705 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590953 (= lt!268016 (array!36871 (store (arr!17705 a!2986) i!1108 k0!1786) (size!18070 a!2986)))))

(declare-fun b!590954 () Bool)

(declare-fun e!337390 () Bool)

(assert (=> b!590954 (= e!337398 e!337390)))

(declare-fun res!378064 () Bool)

(assert (=> b!590954 (=> res!378064 e!337390)))

(declare-fun lt!268013 () (_ BitVec 64))

(assert (=> b!590954 (= res!378064 (or (not (= (select (arr!17705 a!2986) j!136) lt!268013)) (not (= (select (arr!17705 a!2986) j!136) lt!268014)) (bvsge j!136 index!984)))))

(declare-fun b!590955 () Bool)

(declare-fun e!337392 () Bool)

(assert (=> b!590955 (= e!337391 e!337392)))

(declare-fun res!378068 () Bool)

(assert (=> b!590955 (=> (not res!378068) (not e!337392))))

(declare-datatypes ((SeekEntryResult!6142 0))(
  ( (MissingZero!6142 (index!26804 (_ BitVec 32))) (Found!6142 (index!26805 (_ BitVec 32))) (Intermediate!6142 (undefined!6954 Bool) (index!26806 (_ BitVec 32)) (x!55609 (_ BitVec 32))) (Undefined!6142) (MissingVacant!6142 (index!26807 (_ BitVec 32))) )
))
(declare-fun lt!268011 () SeekEntryResult!6142)

(assert (=> b!590955 (= res!378068 (and (= lt!268011 (Found!6142 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17705 a!2986) index!984) (select (arr!17705 a!2986) j!136))) (not (= (select (arr!17705 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36870 (_ BitVec 32)) SeekEntryResult!6142)

(assert (=> b!590955 (= lt!268011 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17705 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590956 () Bool)

(assert (=> b!590956 (= e!337396 e!337389)))

(declare-fun res!378057 () Bool)

(assert (=> b!590956 (=> (not res!378057) (not e!337389))))

(declare-fun lt!268015 () SeekEntryResult!6142)

(assert (=> b!590956 (= res!378057 (or (= lt!268015 (MissingZero!6142 i!1108)) (= lt!268015 (MissingVacant!6142 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36870 (_ BitVec 32)) SeekEntryResult!6142)

(assert (=> b!590956 (= lt!268015 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!590957 () Bool)

(assert (=> b!590957 (= e!337390 e!337395)))

(declare-fun res!378059 () Bool)

(assert (=> b!590957 (=> (not res!378059) (not e!337395))))

(assert (=> b!590957 (= res!378059 (arrayContainsKey!0 lt!268016 (select (arr!17705 a!2986) j!136) j!136))))

(declare-fun b!590958 () Bool)

(declare-fun res!378056 () Bool)

(assert (=> b!590958 (=> (not res!378056) (not e!337389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36870 (_ BitVec 32)) Bool)

(assert (=> b!590958 (= res!378056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590959 () Bool)

(assert (=> b!590959 (= e!337392 (not e!337388))))

(declare-fun res!378054 () Bool)

(assert (=> b!590959 (=> res!378054 e!337388)))

(declare-fun lt!268017 () SeekEntryResult!6142)

(assert (=> b!590959 (= res!378054 (not (= lt!268017 (Found!6142 index!984))))))

(declare-fun lt!268018 () Unit!18480)

(assert (=> b!590959 (= lt!268018 e!337393)))

(declare-fun c!66813 () Bool)

(assert (=> b!590959 (= c!66813 (= lt!268017 Undefined!6142))))

(assert (=> b!590959 (= lt!268017 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268013 lt!268016 mask!3053))))

(declare-fun e!337397 () Bool)

(assert (=> b!590959 e!337397))

(declare-fun res!378058 () Bool)

(assert (=> b!590959 (=> (not res!378058) (not e!337397))))

(declare-fun lt!268009 () (_ BitVec 32))

(declare-fun lt!268012 () SeekEntryResult!6142)

(assert (=> b!590959 (= res!378058 (= lt!268012 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268009 vacantSpotIndex!68 lt!268013 lt!268016 mask!3053)))))

(assert (=> b!590959 (= lt!268012 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268009 vacantSpotIndex!68 (select (arr!17705 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590959 (= lt!268013 (select (store (arr!17705 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268010 () Unit!18480)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36870 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18480)

(assert (=> b!590959 (= lt!268010 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268009 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590959 (= lt!268009 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590960 () Bool)

(declare-fun Unit!18483 () Unit!18480)

(assert (=> b!590960 (= e!337393 Unit!18483)))

(assert (=> b!590960 false))

(declare-fun b!590961 () Bool)

(declare-fun res!378053 () Bool)

(assert (=> b!590961 (=> (not res!378053) (not e!337396))))

(assert (=> b!590961 (= res!378053 (validKeyInArray!0 k0!1786))))

(declare-fun b!590962 () Bool)

(assert (=> b!590962 (= e!337397 (= lt!268011 lt!268012))))

(declare-fun res!378062 () Bool)

(assert (=> start!54126 (=> (not res!378062) (not e!337396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54126 (= res!378062 (validMask!0 mask!3053))))

(assert (=> start!54126 e!337396))

(assert (=> start!54126 true))

(declare-fun array_inv!13588 (array!36870) Bool)

(assert (=> start!54126 (array_inv!13588 a!2986)))

(declare-fun b!590951 () Bool)

(declare-fun res!378060 () Bool)

(assert (=> b!590951 (=> (not res!378060) (not e!337396))))

(assert (=> b!590951 (= res!378060 (and (= (size!18070 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18070 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18070 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54126 res!378062) b!590951))

(assert (= (and b!590951 res!378060) b!590947))

(assert (= (and b!590947 res!378063) b!590961))

(assert (= (and b!590961 res!378053) b!590950))

(assert (= (and b!590950 res!378067) b!590956))

(assert (= (and b!590956 res!378057) b!590958))

(assert (= (and b!590958 res!378056) b!590952))

(assert (= (and b!590952 res!378061) b!590945))

(assert (= (and b!590945 res!378066) b!590953))

(assert (= (and b!590953 res!378065) b!590955))

(assert (= (and b!590955 res!378068) b!590959))

(assert (= (and b!590959 res!378058) b!590962))

(assert (= (and b!590959 c!66813) b!590960))

(assert (= (and b!590959 (not c!66813)) b!590946))

(assert (= (and b!590959 (not res!378054)) b!590948))

(assert (= (and b!590948 res!378055) b!590954))

(assert (= (and b!590954 (not res!378064)) b!590957))

(assert (= (and b!590957 res!378059) b!590949))

(declare-fun m!568711 () Bool)

(assert (=> b!590952 m!568711))

(declare-fun m!568713 () Bool)

(assert (=> b!590950 m!568713))

(declare-fun m!568715 () Bool)

(assert (=> start!54126 m!568715))

(declare-fun m!568717 () Bool)

(assert (=> start!54126 m!568717))

(declare-fun m!568719 () Bool)

(assert (=> b!590958 m!568719))

(declare-fun m!568721 () Bool)

(assert (=> b!590955 m!568721))

(declare-fun m!568723 () Bool)

(assert (=> b!590955 m!568723))

(assert (=> b!590955 m!568723))

(declare-fun m!568725 () Bool)

(assert (=> b!590955 m!568725))

(assert (=> b!590949 m!568723))

(assert (=> b!590949 m!568723))

(declare-fun m!568727 () Bool)

(assert (=> b!590949 m!568727))

(declare-fun m!568729 () Bool)

(assert (=> b!590953 m!568729))

(declare-fun m!568731 () Bool)

(assert (=> b!590953 m!568731))

(declare-fun m!568733 () Bool)

(assert (=> b!590959 m!568733))

(declare-fun m!568735 () Bool)

(assert (=> b!590959 m!568735))

(declare-fun m!568737 () Bool)

(assert (=> b!590959 m!568737))

(assert (=> b!590959 m!568723))

(assert (=> b!590959 m!568729))

(declare-fun m!568739 () Bool)

(assert (=> b!590959 m!568739))

(assert (=> b!590959 m!568723))

(declare-fun m!568741 () Bool)

(assert (=> b!590959 m!568741))

(declare-fun m!568743 () Bool)

(assert (=> b!590959 m!568743))

(declare-fun m!568745 () Bool)

(assert (=> b!590961 m!568745))

(assert (=> b!590947 m!568723))

(assert (=> b!590947 m!568723))

(declare-fun m!568747 () Bool)

(assert (=> b!590947 m!568747))

(assert (=> b!590957 m!568723))

(assert (=> b!590957 m!568723))

(declare-fun m!568749 () Bool)

(assert (=> b!590957 m!568749))

(assert (=> b!590954 m!568723))

(declare-fun m!568751 () Bool)

(assert (=> b!590945 m!568751))

(assert (=> b!590948 m!568723))

(assert (=> b!590948 m!568729))

(declare-fun m!568753 () Bool)

(assert (=> b!590948 m!568753))

(declare-fun m!568755 () Bool)

(assert (=> b!590956 m!568755))

(check-sat (not b!590956) (not b!590961) (not b!590949) (not b!590952) (not b!590950) (not b!590955) (not b!590957) (not b!590958) (not b!590959) (not b!590947) (not start!54126))
(check-sat)
