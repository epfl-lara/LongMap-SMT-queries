; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58944 () Bool)

(assert start!58944)

(declare-fun b!650043 () Bool)

(declare-fun e!372883 () Bool)

(declare-fun e!372889 () Bool)

(assert (=> b!650043 (= e!372883 e!372889)))

(declare-fun res!421375 () Bool)

(assert (=> b!650043 (=> res!421375 e!372889)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!650043 (= res!421375 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22125 0))(
  ( (Unit!22126) )
))
(declare-fun lt!301953 () Unit!22125)

(declare-fun e!372880 () Unit!22125)

(assert (=> b!650043 (= lt!301953 e!372880)))

(declare-fun c!74708 () Bool)

(assert (=> b!650043 (= c!74708 (bvslt j!136 index!984))))

(declare-fun b!650044 () Bool)

(declare-fun Unit!22127 () Unit!22125)

(assert (=> b!650044 (= e!372880 Unit!22127)))

(declare-fun lt!301948 () Unit!22125)

(declare-datatypes ((array!38544 0))(
  ( (array!38545 (arr!18475 (Array (_ BitVec 32) (_ BitVec 64))) (size!18839 (_ BitVec 32))) )
))
(declare-fun lt!301942 () array!38544)

(declare-fun a!2986 () array!38544)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22125)

(assert (=> b!650044 (= lt!301948 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301942 (select (arr!18475 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650044 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!301939 () Unit!22125)

(declare-datatypes ((List!12423 0))(
  ( (Nil!12420) (Cons!12419 (h!13467 (_ BitVec 64)) (t!18643 List!12423)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12423) Unit!22125)

(assert (=> b!650044 (= lt!301939 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12420))))

(declare-fun arrayNoDuplicates!0 (array!38544 (_ BitVec 32) List!12423) Bool)

(assert (=> b!650044 (arrayNoDuplicates!0 lt!301942 #b00000000000000000000000000000000 Nil!12420)))

(declare-fun lt!301949 () Unit!22125)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38544 (_ BitVec 32) (_ BitVec 32)) Unit!22125)

(assert (=> b!650044 (= lt!301949 (lemmaNoDuplicateFromThenFromBigger!0 lt!301942 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650044 (arrayNoDuplicates!0 lt!301942 j!136 Nil!12420)))

(declare-fun lt!301943 () Unit!22125)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38544 (_ BitVec 64) (_ BitVec 32) List!12423) Unit!22125)

(assert (=> b!650044 (= lt!301943 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301942 (select (arr!18475 a!2986) j!136) j!136 Nil!12420))))

(assert (=> b!650044 false))

(declare-fun b!650045 () Bool)

(declare-fun e!372881 () Bool)

(assert (=> b!650045 (= e!372881 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) index!984))))

(declare-fun res!421374 () Bool)

(declare-fun e!372892 () Bool)

(assert (=> start!58944 (=> (not res!421374) (not e!372892))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58944 (= res!421374 (validMask!0 mask!3053))))

(assert (=> start!58944 e!372892))

(assert (=> start!58944 true))

(declare-fun array_inv!14334 (array!38544) Bool)

(assert (=> start!58944 (array_inv!14334 a!2986)))

(declare-fun b!650046 () Bool)

(declare-fun res!421371 () Bool)

(assert (=> b!650046 (=> (not res!421371) (not e!372892))))

(assert (=> b!650046 (= res!421371 (and (= (size!18839 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18839 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18839 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!372884 () Bool)

(declare-fun b!650047 () Bool)

(assert (=> b!650047 (= e!372884 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) index!984))))

(declare-fun b!650048 () Bool)

(declare-fun res!421368 () Bool)

(declare-fun e!372882 () Bool)

(assert (=> b!650048 (=> (not res!421368) (not e!372882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38544 (_ BitVec 32)) Bool)

(assert (=> b!650048 (= res!421368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650049 () Bool)

(assert (=> b!650049 (= e!372892 e!372882)))

(declare-fun res!421380 () Bool)

(assert (=> b!650049 (=> (not res!421380) (not e!372882))))

(declare-datatypes ((SeekEntryResult!6871 0))(
  ( (MissingZero!6871 (index!29831 (_ BitVec 32))) (Found!6871 (index!29832 (_ BitVec 32))) (Intermediate!6871 (undefined!7683 Bool) (index!29833 (_ BitVec 32)) (x!58767 (_ BitVec 32))) (Undefined!6871) (MissingVacant!6871 (index!29834 (_ BitVec 32))) )
))
(declare-fun lt!301944 () SeekEntryResult!6871)

(assert (=> b!650049 (= res!421380 (or (= lt!301944 (MissingZero!6871 i!1108)) (= lt!301944 (MissingVacant!6871 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38544 (_ BitVec 32)) SeekEntryResult!6871)

(assert (=> b!650049 (= lt!301944 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!650050 () Bool)

(assert (=> b!650050 (= e!372889 (bvslt (size!18839 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!650050 (arrayNoDuplicates!0 lt!301942 #b00000000000000000000000000000000 Nil!12420)))

(declare-fun lt!301938 () Unit!22125)

(assert (=> b!650050 (= lt!301938 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12420))))

(assert (=> b!650050 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301954 () Unit!22125)

(assert (=> b!650050 (= lt!301954 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301942 (select (arr!18475 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!650050 e!372881))

(declare-fun res!421367 () Bool)

(assert (=> b!650050 (=> (not res!421367) (not e!372881))))

(assert (=> b!650050 (= res!421367 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) j!136))))

(declare-fun b!650051 () Bool)

(declare-fun e!372890 () Unit!22125)

(declare-fun Unit!22128 () Unit!22125)

(assert (=> b!650051 (= e!372890 Unit!22128)))

(assert (=> b!650051 false))

(declare-fun b!650052 () Bool)

(declare-fun res!421373 () Bool)

(assert (=> b!650052 (=> (not res!421373) (not e!372892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650052 (= res!421373 (validKeyInArray!0 k0!1786))))

(declare-fun b!650053 () Bool)

(declare-fun e!372891 () Bool)

(assert (=> b!650053 (= e!372891 e!372884)))

(declare-fun res!421378 () Bool)

(assert (=> b!650053 (=> (not res!421378) (not e!372884))))

(assert (=> b!650053 (= res!421378 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) j!136))))

(declare-fun b!650054 () Bool)

(declare-fun e!372885 () Bool)

(declare-fun e!372888 () Bool)

(assert (=> b!650054 (= e!372885 (not e!372888))))

(declare-fun res!421366 () Bool)

(assert (=> b!650054 (=> res!421366 e!372888)))

(declare-fun lt!301946 () SeekEntryResult!6871)

(assert (=> b!650054 (= res!421366 (not (= lt!301946 (Found!6871 index!984))))))

(declare-fun lt!301941 () Unit!22125)

(assert (=> b!650054 (= lt!301941 e!372890)))

(declare-fun c!74707 () Bool)

(assert (=> b!650054 (= c!74707 (= lt!301946 Undefined!6871))))

(declare-fun lt!301940 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38544 (_ BitVec 32)) SeekEntryResult!6871)

(assert (=> b!650054 (= lt!301946 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301940 lt!301942 mask!3053))))

(declare-fun e!372893 () Bool)

(assert (=> b!650054 e!372893))

(declare-fun res!421383 () Bool)

(assert (=> b!650054 (=> (not res!421383) (not e!372893))))

(declare-fun lt!301951 () SeekEntryResult!6871)

(declare-fun lt!301952 () (_ BitVec 32))

(assert (=> b!650054 (= res!421383 (= lt!301951 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 lt!301940 lt!301942 mask!3053)))))

(assert (=> b!650054 (= lt!301951 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 (select (arr!18475 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650054 (= lt!301940 (select (store (arr!18475 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301945 () Unit!22125)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38544 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22125)

(assert (=> b!650054 (= lt!301945 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650054 (= lt!301952 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!650055 () Bool)

(assert (=> b!650055 (= e!372888 e!372883)))

(declare-fun res!421381 () Bool)

(assert (=> b!650055 (=> res!421381 e!372883)))

(declare-fun lt!301950 () (_ BitVec 64))

(assert (=> b!650055 (= res!421381 (or (not (= (select (arr!18475 a!2986) j!136) lt!301940)) (not (= (select (arr!18475 a!2986) j!136) lt!301950))))))

(declare-fun e!372894 () Bool)

(assert (=> b!650055 e!372894))

(declare-fun res!421377 () Bool)

(assert (=> b!650055 (=> (not res!421377) (not e!372894))))

(assert (=> b!650055 (= res!421377 (= lt!301950 (select (arr!18475 a!2986) j!136)))))

(assert (=> b!650055 (= lt!301950 (select (store (arr!18475 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!650056 () Bool)

(declare-fun res!421376 () Bool)

(assert (=> b!650056 (=> (not res!421376) (not e!372882))))

(assert (=> b!650056 (= res!421376 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18475 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650057 () Bool)

(declare-fun res!421370 () Bool)

(assert (=> b!650057 (=> (not res!421370) (not e!372892))))

(assert (=> b!650057 (= res!421370 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650058 () Bool)

(declare-fun Unit!22129 () Unit!22125)

(assert (=> b!650058 (= e!372890 Unit!22129)))

(declare-fun b!650059 () Bool)

(declare-fun e!372886 () Bool)

(assert (=> b!650059 (= e!372882 e!372886)))

(declare-fun res!421379 () Bool)

(assert (=> b!650059 (=> (not res!421379) (not e!372886))))

(assert (=> b!650059 (= res!421379 (= (select (store (arr!18475 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650059 (= lt!301942 (array!38545 (store (arr!18475 a!2986) i!1108 k0!1786) (size!18839 a!2986)))))

(declare-fun b!650060 () Bool)

(declare-fun Unit!22130 () Unit!22125)

(assert (=> b!650060 (= e!372880 Unit!22130)))

(declare-fun b!650061 () Bool)

(declare-fun lt!301947 () SeekEntryResult!6871)

(assert (=> b!650061 (= e!372893 (= lt!301947 lt!301951))))

(declare-fun b!650062 () Bool)

(declare-fun res!421372 () Bool)

(assert (=> b!650062 (=> (not res!421372) (not e!372882))))

(assert (=> b!650062 (= res!421372 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12420))))

(declare-fun b!650063 () Bool)

(assert (=> b!650063 (= e!372894 e!372891)))

(declare-fun res!421369 () Bool)

(assert (=> b!650063 (=> res!421369 e!372891)))

(assert (=> b!650063 (= res!421369 (or (not (= (select (arr!18475 a!2986) j!136) lt!301940)) (not (= (select (arr!18475 a!2986) j!136) lt!301950)) (bvsge j!136 index!984)))))

(declare-fun b!650064 () Bool)

(assert (=> b!650064 (= e!372886 e!372885)))

(declare-fun res!421382 () Bool)

(assert (=> b!650064 (=> (not res!421382) (not e!372885))))

(assert (=> b!650064 (= res!421382 (and (= lt!301947 (Found!6871 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18475 a!2986) index!984) (select (arr!18475 a!2986) j!136))) (not (= (select (arr!18475 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650064 (= lt!301947 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18475 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650065 () Bool)

(declare-fun res!421384 () Bool)

(assert (=> b!650065 (=> (not res!421384) (not e!372892))))

(assert (=> b!650065 (= res!421384 (validKeyInArray!0 (select (arr!18475 a!2986) j!136)))))

(assert (= (and start!58944 res!421374) b!650046))

(assert (= (and b!650046 res!421371) b!650065))

(assert (= (and b!650065 res!421384) b!650052))

(assert (= (and b!650052 res!421373) b!650057))

(assert (= (and b!650057 res!421370) b!650049))

(assert (= (and b!650049 res!421380) b!650048))

(assert (= (and b!650048 res!421368) b!650062))

(assert (= (and b!650062 res!421372) b!650056))

(assert (= (and b!650056 res!421376) b!650059))

(assert (= (and b!650059 res!421379) b!650064))

(assert (= (and b!650064 res!421382) b!650054))

(assert (= (and b!650054 res!421383) b!650061))

(assert (= (and b!650054 c!74707) b!650051))

(assert (= (and b!650054 (not c!74707)) b!650058))

(assert (= (and b!650054 (not res!421366)) b!650055))

(assert (= (and b!650055 res!421377) b!650063))

(assert (= (and b!650063 (not res!421369)) b!650053))

(assert (= (and b!650053 res!421378) b!650047))

(assert (= (and b!650055 (not res!421381)) b!650043))

(assert (= (and b!650043 c!74708) b!650044))

(assert (= (and b!650043 (not c!74708)) b!650060))

(assert (= (and b!650043 (not res!421375)) b!650050))

(assert (= (and b!650050 res!421367) b!650045))

(declare-fun m!623701 () Bool)

(assert (=> b!650053 m!623701))

(assert (=> b!650053 m!623701))

(declare-fun m!623703 () Bool)

(assert (=> b!650053 m!623703))

(declare-fun m!623705 () Bool)

(assert (=> b!650059 m!623705))

(declare-fun m!623707 () Bool)

(assert (=> b!650059 m!623707))

(assert (=> b!650065 m!623701))

(assert (=> b!650065 m!623701))

(declare-fun m!623709 () Bool)

(assert (=> b!650065 m!623709))

(declare-fun m!623711 () Bool)

(assert (=> b!650048 m!623711))

(assert (=> b!650050 m!623701))

(declare-fun m!623713 () Bool)

(assert (=> b!650050 m!623713))

(declare-fun m!623715 () Bool)

(assert (=> b!650050 m!623715))

(assert (=> b!650050 m!623701))

(declare-fun m!623717 () Bool)

(assert (=> b!650050 m!623717))

(declare-fun m!623719 () Bool)

(assert (=> b!650050 m!623719))

(assert (=> b!650050 m!623701))

(assert (=> b!650050 m!623701))

(assert (=> b!650050 m!623703))

(declare-fun m!623721 () Bool)

(assert (=> b!650056 m!623721))

(declare-fun m!623723 () Bool)

(assert (=> b!650062 m!623723))

(assert (=> b!650055 m!623701))

(assert (=> b!650055 m!623705))

(declare-fun m!623725 () Bool)

(assert (=> b!650055 m!623725))

(declare-fun m!623727 () Bool)

(assert (=> b!650054 m!623727))

(declare-fun m!623729 () Bool)

(assert (=> b!650054 m!623729))

(assert (=> b!650054 m!623701))

(declare-fun m!623731 () Bool)

(assert (=> b!650054 m!623731))

(assert (=> b!650054 m!623705))

(declare-fun m!623733 () Bool)

(assert (=> b!650054 m!623733))

(assert (=> b!650054 m!623701))

(declare-fun m!623735 () Bool)

(assert (=> b!650054 m!623735))

(declare-fun m!623737 () Bool)

(assert (=> b!650054 m!623737))

(declare-fun m!623739 () Bool)

(assert (=> b!650064 m!623739))

(assert (=> b!650064 m!623701))

(assert (=> b!650064 m!623701))

(declare-fun m!623741 () Bool)

(assert (=> b!650064 m!623741))

(assert (=> b!650047 m!623701))

(assert (=> b!650047 m!623701))

(declare-fun m!623743 () Bool)

(assert (=> b!650047 m!623743))

(assert (=> b!650063 m!623701))

(declare-fun m!623745 () Bool)

(assert (=> b!650052 m!623745))

(assert (=> b!650045 m!623701))

(assert (=> b!650045 m!623701))

(assert (=> b!650045 m!623743))

(declare-fun m!623747 () Bool)

(assert (=> start!58944 m!623747))

(declare-fun m!623749 () Bool)

(assert (=> start!58944 m!623749))

(assert (=> b!650044 m!623701))

(declare-fun m!623751 () Bool)

(assert (=> b!650044 m!623751))

(declare-fun m!623753 () Bool)

(assert (=> b!650044 m!623753))

(assert (=> b!650044 m!623715))

(assert (=> b!650044 m!623701))

(declare-fun m!623755 () Bool)

(assert (=> b!650044 m!623755))

(assert (=> b!650044 m!623701))

(declare-fun m!623757 () Bool)

(assert (=> b!650044 m!623757))

(assert (=> b!650044 m!623719))

(assert (=> b!650044 m!623701))

(declare-fun m!623759 () Bool)

(assert (=> b!650044 m!623759))

(declare-fun m!623761 () Bool)

(assert (=> b!650049 m!623761))

(declare-fun m!623763 () Bool)

(assert (=> b!650057 m!623763))

(check-sat (not start!58944) (not b!650065) (not b!650057) (not b!650045) (not b!650044) (not b!650050) (not b!650048) (not b!650064) (not b!650062) (not b!650052) (not b!650054) (not b!650049) (not b!650053) (not b!650047))
(check-sat)
(get-model)

(declare-fun e!372992 () SeekEntryResult!6871)

(declare-fun b!650216 () Bool)

(assert (=> b!650216 (= e!372992 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18475 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650217 () Bool)

(declare-fun e!372991 () SeekEntryResult!6871)

(assert (=> b!650217 (= e!372991 Undefined!6871)))

(declare-fun b!650218 () Bool)

(declare-fun e!372993 () SeekEntryResult!6871)

(assert (=> b!650218 (= e!372993 (Found!6871 index!984))))

(declare-fun d!92011 () Bool)

(declare-fun lt!302061 () SeekEntryResult!6871)

(get-info :version)

(assert (=> d!92011 (and (or ((_ is Undefined!6871) lt!302061) (not ((_ is Found!6871) lt!302061)) (and (bvsge (index!29832 lt!302061) #b00000000000000000000000000000000) (bvslt (index!29832 lt!302061) (size!18839 a!2986)))) (or ((_ is Undefined!6871) lt!302061) ((_ is Found!6871) lt!302061) (not ((_ is MissingVacant!6871) lt!302061)) (not (= (index!29834 lt!302061) vacantSpotIndex!68)) (and (bvsge (index!29834 lt!302061) #b00000000000000000000000000000000) (bvslt (index!29834 lt!302061) (size!18839 a!2986)))) (or ((_ is Undefined!6871) lt!302061) (ite ((_ is Found!6871) lt!302061) (= (select (arr!18475 a!2986) (index!29832 lt!302061)) (select (arr!18475 a!2986) j!136)) (and ((_ is MissingVacant!6871) lt!302061) (= (index!29834 lt!302061) vacantSpotIndex!68) (= (select (arr!18475 a!2986) (index!29834 lt!302061)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92011 (= lt!302061 e!372991)))

(declare-fun c!74728 () Bool)

(assert (=> d!92011 (= c!74728 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!302062 () (_ BitVec 64))

(assert (=> d!92011 (= lt!302062 (select (arr!18475 a!2986) index!984))))

(assert (=> d!92011 (validMask!0 mask!3053)))

(assert (=> d!92011 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18475 a!2986) j!136) a!2986 mask!3053) lt!302061)))

(declare-fun b!650219 () Bool)

(assert (=> b!650219 (= e!372992 (MissingVacant!6871 vacantSpotIndex!68))))

(declare-fun b!650220 () Bool)

(declare-fun c!74727 () Bool)

(assert (=> b!650220 (= c!74727 (= lt!302062 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650220 (= e!372993 e!372992)))

(declare-fun b!650221 () Bool)

(assert (=> b!650221 (= e!372991 e!372993)))

(declare-fun c!74729 () Bool)

(assert (=> b!650221 (= c!74729 (= lt!302062 (select (arr!18475 a!2986) j!136)))))

(assert (= (and d!92011 c!74728) b!650217))

(assert (= (and d!92011 (not c!74728)) b!650221))

(assert (= (and b!650221 c!74729) b!650218))

(assert (= (and b!650221 (not c!74729)) b!650220))

(assert (= (and b!650220 c!74727) b!650219))

(assert (= (and b!650220 (not c!74727)) b!650216))

(declare-fun m!623893 () Bool)

(assert (=> b!650216 m!623893))

(assert (=> b!650216 m!623893))

(assert (=> b!650216 m!623701))

(declare-fun m!623895 () Bool)

(assert (=> b!650216 m!623895))

(declare-fun m!623897 () Bool)

(assert (=> d!92011 m!623897))

(declare-fun m!623899 () Bool)

(assert (=> d!92011 m!623899))

(assert (=> d!92011 m!623739))

(assert (=> d!92011 m!623747))

(assert (=> b!650064 d!92011))

(declare-fun d!92013 () Bool)

(declare-fun res!421503 () Bool)

(declare-fun e!372998 () Bool)

(assert (=> d!92013 (=> res!421503 e!372998)))

(assert (=> d!92013 (= res!421503 (= (select (arr!18475 lt!301942) j!136) (select (arr!18475 a!2986) j!136)))))

(assert (=> d!92013 (= (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) j!136) e!372998)))

(declare-fun b!650226 () Bool)

(declare-fun e!372999 () Bool)

(assert (=> b!650226 (= e!372998 e!372999)))

(declare-fun res!421504 () Bool)

(assert (=> b!650226 (=> (not res!421504) (not e!372999))))

(assert (=> b!650226 (= res!421504 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18839 lt!301942)))))

(declare-fun b!650227 () Bool)

(assert (=> b!650227 (= e!372999 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92013 (not res!421503)) b!650226))

(assert (= (and b!650226 res!421504) b!650227))

(declare-fun m!623901 () Bool)

(assert (=> d!92013 m!623901))

(assert (=> b!650227 m!623701))

(declare-fun m!623903 () Bool)

(assert (=> b!650227 m!623903))

(assert (=> b!650053 d!92013))

(declare-fun d!92015 () Bool)

(assert (=> d!92015 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302065 () Unit!22125)

(declare-fun choose!114 (array!38544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22125)

(assert (=> d!92015 (= lt!302065 (choose!114 lt!301942 (select (arr!18475 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92015 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92015 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301942 (select (arr!18475 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!302065)))

(declare-fun bs!19409 () Bool)

(assert (= bs!19409 d!92015))

(assert (=> bs!19409 m!623701))

(assert (=> bs!19409 m!623755))

(assert (=> bs!19409 m!623701))

(declare-fun m!623905 () Bool)

(assert (=> bs!19409 m!623905))

(assert (=> b!650044 d!92015))

(declare-fun d!92017 () Bool)

(declare-fun res!421505 () Bool)

(declare-fun e!373000 () Bool)

(assert (=> d!92017 (=> res!421505 e!373000)))

(assert (=> d!92017 (= res!421505 (= (select (arr!18475 lt!301942) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18475 a!2986) j!136)))))

(assert (=> d!92017 (= (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!373000)))

(declare-fun b!650228 () Bool)

(declare-fun e!373001 () Bool)

(assert (=> b!650228 (= e!373000 e!373001)))

(declare-fun res!421506 () Bool)

(assert (=> b!650228 (=> (not res!421506) (not e!373001))))

(assert (=> b!650228 (= res!421506 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18839 lt!301942)))))

(declare-fun b!650229 () Bool)

(assert (=> b!650229 (= e!373001 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92017 (not res!421505)) b!650228))

(assert (= (and b!650228 res!421506) b!650229))

(declare-fun m!623907 () Bool)

(assert (=> d!92017 m!623907))

(assert (=> b!650229 m!623701))

(declare-fun m!623909 () Bool)

(assert (=> b!650229 m!623909))

(assert (=> b!650044 d!92017))

(declare-fun b!650240 () Bool)

(declare-fun e!373011 () Bool)

(declare-fun e!373013 () Bool)

(assert (=> b!650240 (= e!373011 e!373013)))

(declare-fun res!421513 () Bool)

(assert (=> b!650240 (=> (not res!421513) (not e!373013))))

(declare-fun e!373010 () Bool)

(assert (=> b!650240 (= res!421513 (not e!373010))))

(declare-fun res!421515 () Bool)

(assert (=> b!650240 (=> (not res!421515) (not e!373010))))

(assert (=> b!650240 (= res!421515 (validKeyInArray!0 (select (arr!18475 lt!301942) j!136)))))

(declare-fun d!92019 () Bool)

(declare-fun res!421514 () Bool)

(assert (=> d!92019 (=> res!421514 e!373011)))

(assert (=> d!92019 (= res!421514 (bvsge j!136 (size!18839 lt!301942)))))

(assert (=> d!92019 (= (arrayNoDuplicates!0 lt!301942 j!136 Nil!12420) e!373011)))

(declare-fun bm!33735 () Bool)

(declare-fun call!33738 () Bool)

(declare-fun c!74732 () Bool)

(assert (=> bm!33735 (= call!33738 (arrayNoDuplicates!0 lt!301942 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74732 (Cons!12419 (select (arr!18475 lt!301942) j!136) Nil!12420) Nil!12420)))))

(declare-fun b!650241 () Bool)

(declare-fun e!373012 () Bool)

(assert (=> b!650241 (= e!373012 call!33738)))

(declare-fun b!650242 () Bool)

(assert (=> b!650242 (= e!373012 call!33738)))

(declare-fun b!650243 () Bool)

(assert (=> b!650243 (= e!373013 e!373012)))

(assert (=> b!650243 (= c!74732 (validKeyInArray!0 (select (arr!18475 lt!301942) j!136)))))

(declare-fun b!650244 () Bool)

(declare-fun contains!3152 (List!12423 (_ BitVec 64)) Bool)

(assert (=> b!650244 (= e!373010 (contains!3152 Nil!12420 (select (arr!18475 lt!301942) j!136)))))

(assert (= (and d!92019 (not res!421514)) b!650240))

(assert (= (and b!650240 res!421515) b!650244))

(assert (= (and b!650240 res!421513) b!650243))

(assert (= (and b!650243 c!74732) b!650241))

(assert (= (and b!650243 (not c!74732)) b!650242))

(assert (= (or b!650241 b!650242) bm!33735))

(assert (=> b!650240 m!623901))

(assert (=> b!650240 m!623901))

(declare-fun m!623911 () Bool)

(assert (=> b!650240 m!623911))

(assert (=> bm!33735 m!623901))

(declare-fun m!623913 () Bool)

(assert (=> bm!33735 m!623913))

(assert (=> b!650243 m!623901))

(assert (=> b!650243 m!623901))

(assert (=> b!650243 m!623911))

(assert (=> b!650244 m!623901))

(assert (=> b!650244 m!623901))

(declare-fun m!623915 () Bool)

(assert (=> b!650244 m!623915))

(assert (=> b!650044 d!92019))

(declare-fun b!650245 () Bool)

(declare-fun e!373015 () Bool)

(declare-fun e!373017 () Bool)

(assert (=> b!650245 (= e!373015 e!373017)))

(declare-fun res!421516 () Bool)

(assert (=> b!650245 (=> (not res!421516) (not e!373017))))

(declare-fun e!373014 () Bool)

(assert (=> b!650245 (= res!421516 (not e!373014))))

(declare-fun res!421518 () Bool)

(assert (=> b!650245 (=> (not res!421518) (not e!373014))))

(assert (=> b!650245 (= res!421518 (validKeyInArray!0 (select (arr!18475 lt!301942) #b00000000000000000000000000000000)))))

(declare-fun d!92021 () Bool)

(declare-fun res!421517 () Bool)

(assert (=> d!92021 (=> res!421517 e!373015)))

(assert (=> d!92021 (= res!421517 (bvsge #b00000000000000000000000000000000 (size!18839 lt!301942)))))

(assert (=> d!92021 (= (arrayNoDuplicates!0 lt!301942 #b00000000000000000000000000000000 Nil!12420) e!373015)))

(declare-fun bm!33736 () Bool)

(declare-fun call!33739 () Bool)

(declare-fun c!74733 () Bool)

(assert (=> bm!33736 (= call!33739 (arrayNoDuplicates!0 lt!301942 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74733 (Cons!12419 (select (arr!18475 lt!301942) #b00000000000000000000000000000000) Nil!12420) Nil!12420)))))

(declare-fun b!650246 () Bool)

(declare-fun e!373016 () Bool)

(assert (=> b!650246 (= e!373016 call!33739)))

(declare-fun b!650247 () Bool)

(assert (=> b!650247 (= e!373016 call!33739)))

(declare-fun b!650248 () Bool)

(assert (=> b!650248 (= e!373017 e!373016)))

(assert (=> b!650248 (= c!74733 (validKeyInArray!0 (select (arr!18475 lt!301942) #b00000000000000000000000000000000)))))

(declare-fun b!650249 () Bool)

(assert (=> b!650249 (= e!373014 (contains!3152 Nil!12420 (select (arr!18475 lt!301942) #b00000000000000000000000000000000)))))

(assert (= (and d!92021 (not res!421517)) b!650245))

(assert (= (and b!650245 res!421518) b!650249))

(assert (= (and b!650245 res!421516) b!650248))

(assert (= (and b!650248 c!74733) b!650246))

(assert (= (and b!650248 (not c!74733)) b!650247))

(assert (= (or b!650246 b!650247) bm!33736))

(declare-fun m!623917 () Bool)

(assert (=> b!650245 m!623917))

(assert (=> b!650245 m!623917))

(declare-fun m!623919 () Bool)

(assert (=> b!650245 m!623919))

(assert (=> bm!33736 m!623917))

(declare-fun m!623921 () Bool)

(assert (=> bm!33736 m!623921))

(assert (=> b!650248 m!623917))

(assert (=> b!650248 m!623917))

(assert (=> b!650248 m!623919))

(assert (=> b!650249 m!623917))

(assert (=> b!650249 m!623917))

(declare-fun m!623923 () Bool)

(assert (=> b!650249 m!623923))

(assert (=> b!650044 d!92021))

(declare-fun d!92023 () Bool)

(declare-fun e!373020 () Bool)

(assert (=> d!92023 e!373020))

(declare-fun res!421521 () Bool)

(assert (=> d!92023 (=> (not res!421521) (not e!373020))))

(assert (=> d!92023 (= res!421521 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18839 a!2986))))))

(declare-fun lt!302068 () Unit!22125)

(declare-fun choose!41 (array!38544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12423) Unit!22125)

(assert (=> d!92023 (= lt!302068 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12420))))

(assert (=> d!92023 (bvslt (size!18839 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92023 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12420) lt!302068)))

(declare-fun b!650252 () Bool)

(assert (=> b!650252 (= e!373020 (arrayNoDuplicates!0 (array!38545 (store (arr!18475 a!2986) i!1108 k0!1786) (size!18839 a!2986)) #b00000000000000000000000000000000 Nil!12420))))

(assert (= (and d!92023 res!421521) b!650252))

(declare-fun m!623925 () Bool)

(assert (=> d!92023 m!623925))

(assert (=> b!650252 m!623705))

(declare-fun m!623927 () Bool)

(assert (=> b!650252 m!623927))

(assert (=> b!650044 d!92023))

(declare-fun d!92025 () Bool)

(assert (=> d!92025 (arrayNoDuplicates!0 lt!301942 j!136 Nil!12420)))

(declare-fun lt!302071 () Unit!22125)

(declare-fun choose!39 (array!38544 (_ BitVec 32) (_ BitVec 32)) Unit!22125)

(assert (=> d!92025 (= lt!302071 (choose!39 lt!301942 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92025 (bvslt (size!18839 lt!301942) #b01111111111111111111111111111111)))

(assert (=> d!92025 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!301942 #b00000000000000000000000000000000 j!136) lt!302071)))

(declare-fun bs!19410 () Bool)

(assert (= bs!19410 d!92025))

(assert (=> bs!19410 m!623759))

(declare-fun m!623929 () Bool)

(assert (=> bs!19410 m!623929))

(assert (=> b!650044 d!92025))

(declare-fun d!92027 () Bool)

(assert (=> d!92027 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18839 lt!301942)) (not (= (select (arr!18475 lt!301942) j!136) (select (arr!18475 a!2986) j!136))))))

(declare-fun lt!302074 () Unit!22125)

(declare-fun choose!21 (array!38544 (_ BitVec 64) (_ BitVec 32) List!12423) Unit!22125)

(assert (=> d!92027 (= lt!302074 (choose!21 lt!301942 (select (arr!18475 a!2986) j!136) j!136 Nil!12420))))

(assert (=> d!92027 (bvslt (size!18839 lt!301942) #b01111111111111111111111111111111)))

(assert (=> d!92027 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301942 (select (arr!18475 a!2986) j!136) j!136 Nil!12420) lt!302074)))

(declare-fun bs!19411 () Bool)

(assert (= bs!19411 d!92027))

(assert (=> bs!19411 m!623901))

(assert (=> bs!19411 m!623701))

(declare-fun m!623931 () Bool)

(assert (=> bs!19411 m!623931))

(assert (=> b!650044 d!92027))

(declare-fun d!92029 () Bool)

(assert (=> d!92029 (= (validKeyInArray!0 (select (arr!18475 a!2986) j!136)) (and (not (= (select (arr!18475 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18475 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!650065 d!92029))

(declare-fun b!650253 () Bool)

(declare-fun e!373022 () SeekEntryResult!6871)

(assert (=> b!650253 (= e!373022 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!301940 lt!301942 mask!3053))))

(declare-fun b!650254 () Bool)

(declare-fun e!373021 () SeekEntryResult!6871)

(assert (=> b!650254 (= e!373021 Undefined!6871)))

(declare-fun b!650255 () Bool)

(declare-fun e!373023 () SeekEntryResult!6871)

(assert (=> b!650255 (= e!373023 (Found!6871 index!984))))

(declare-fun d!92031 () Bool)

(declare-fun lt!302075 () SeekEntryResult!6871)

(assert (=> d!92031 (and (or ((_ is Undefined!6871) lt!302075) (not ((_ is Found!6871) lt!302075)) (and (bvsge (index!29832 lt!302075) #b00000000000000000000000000000000) (bvslt (index!29832 lt!302075) (size!18839 lt!301942)))) (or ((_ is Undefined!6871) lt!302075) ((_ is Found!6871) lt!302075) (not ((_ is MissingVacant!6871) lt!302075)) (not (= (index!29834 lt!302075) vacantSpotIndex!68)) (and (bvsge (index!29834 lt!302075) #b00000000000000000000000000000000) (bvslt (index!29834 lt!302075) (size!18839 lt!301942)))) (or ((_ is Undefined!6871) lt!302075) (ite ((_ is Found!6871) lt!302075) (= (select (arr!18475 lt!301942) (index!29832 lt!302075)) lt!301940) (and ((_ is MissingVacant!6871) lt!302075) (= (index!29834 lt!302075) vacantSpotIndex!68) (= (select (arr!18475 lt!301942) (index!29834 lt!302075)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92031 (= lt!302075 e!373021)))

(declare-fun c!74735 () Bool)

(assert (=> d!92031 (= c!74735 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!302076 () (_ BitVec 64))

(assert (=> d!92031 (= lt!302076 (select (arr!18475 lt!301942) index!984))))

(assert (=> d!92031 (validMask!0 mask!3053)))

(assert (=> d!92031 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301940 lt!301942 mask!3053) lt!302075)))

(declare-fun b!650256 () Bool)

(assert (=> b!650256 (= e!373022 (MissingVacant!6871 vacantSpotIndex!68))))

(declare-fun b!650257 () Bool)

(declare-fun c!74734 () Bool)

(assert (=> b!650257 (= c!74734 (= lt!302076 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650257 (= e!373023 e!373022)))

(declare-fun b!650258 () Bool)

(assert (=> b!650258 (= e!373021 e!373023)))

(declare-fun c!74736 () Bool)

(assert (=> b!650258 (= c!74736 (= lt!302076 lt!301940))))

(assert (= (and d!92031 c!74735) b!650254))

(assert (= (and d!92031 (not c!74735)) b!650258))

(assert (= (and b!650258 c!74736) b!650255))

(assert (= (and b!650258 (not c!74736)) b!650257))

(assert (= (and b!650257 c!74734) b!650256))

(assert (= (and b!650257 (not c!74734)) b!650253))

(assert (=> b!650253 m!623893))

(assert (=> b!650253 m!623893))

(declare-fun m!623933 () Bool)

(assert (=> b!650253 m!623933))

(declare-fun m!623935 () Bool)

(assert (=> d!92031 m!623935))

(declare-fun m!623937 () Bool)

(assert (=> d!92031 m!623937))

(declare-fun m!623939 () Bool)

(assert (=> d!92031 m!623939))

(assert (=> d!92031 m!623747))

(assert (=> b!650054 d!92031))

(declare-fun b!650259 () Bool)

(declare-fun e!373025 () SeekEntryResult!6871)

(assert (=> b!650259 (= e!373025 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!301952 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18475 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650260 () Bool)

(declare-fun e!373024 () SeekEntryResult!6871)

(assert (=> b!650260 (= e!373024 Undefined!6871)))

(declare-fun b!650261 () Bool)

(declare-fun e!373026 () SeekEntryResult!6871)

(assert (=> b!650261 (= e!373026 (Found!6871 lt!301952))))

(declare-fun d!92033 () Bool)

(declare-fun lt!302077 () SeekEntryResult!6871)

(assert (=> d!92033 (and (or ((_ is Undefined!6871) lt!302077) (not ((_ is Found!6871) lt!302077)) (and (bvsge (index!29832 lt!302077) #b00000000000000000000000000000000) (bvslt (index!29832 lt!302077) (size!18839 a!2986)))) (or ((_ is Undefined!6871) lt!302077) ((_ is Found!6871) lt!302077) (not ((_ is MissingVacant!6871) lt!302077)) (not (= (index!29834 lt!302077) vacantSpotIndex!68)) (and (bvsge (index!29834 lt!302077) #b00000000000000000000000000000000) (bvslt (index!29834 lt!302077) (size!18839 a!2986)))) (or ((_ is Undefined!6871) lt!302077) (ite ((_ is Found!6871) lt!302077) (= (select (arr!18475 a!2986) (index!29832 lt!302077)) (select (arr!18475 a!2986) j!136)) (and ((_ is MissingVacant!6871) lt!302077) (= (index!29834 lt!302077) vacantSpotIndex!68) (= (select (arr!18475 a!2986) (index!29834 lt!302077)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92033 (= lt!302077 e!373024)))

(declare-fun c!74738 () Bool)

(assert (=> d!92033 (= c!74738 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!302078 () (_ BitVec 64))

(assert (=> d!92033 (= lt!302078 (select (arr!18475 a!2986) lt!301952))))

(assert (=> d!92033 (validMask!0 mask!3053)))

(assert (=> d!92033 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 (select (arr!18475 a!2986) j!136) a!2986 mask!3053) lt!302077)))

(declare-fun b!650262 () Bool)

(assert (=> b!650262 (= e!373025 (MissingVacant!6871 vacantSpotIndex!68))))

(declare-fun b!650263 () Bool)

(declare-fun c!74737 () Bool)

(assert (=> b!650263 (= c!74737 (= lt!302078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650263 (= e!373026 e!373025)))

(declare-fun b!650264 () Bool)

(assert (=> b!650264 (= e!373024 e!373026)))

(declare-fun c!74739 () Bool)

(assert (=> b!650264 (= c!74739 (= lt!302078 (select (arr!18475 a!2986) j!136)))))

(assert (= (and d!92033 c!74738) b!650260))

(assert (= (and d!92033 (not c!74738)) b!650264))

(assert (= (and b!650264 c!74739) b!650261))

(assert (= (and b!650264 (not c!74739)) b!650263))

(assert (= (and b!650263 c!74737) b!650262))

(assert (= (and b!650263 (not c!74737)) b!650259))

(declare-fun m!623941 () Bool)

(assert (=> b!650259 m!623941))

(assert (=> b!650259 m!623941))

(assert (=> b!650259 m!623701))

(declare-fun m!623943 () Bool)

(assert (=> b!650259 m!623943))

(declare-fun m!623945 () Bool)

(assert (=> d!92033 m!623945))

(declare-fun m!623947 () Bool)

(assert (=> d!92033 m!623947))

(declare-fun m!623949 () Bool)

(assert (=> d!92033 m!623949))

(assert (=> d!92033 m!623747))

(assert (=> b!650054 d!92033))

(declare-fun b!650265 () Bool)

(declare-fun e!373028 () SeekEntryResult!6871)

(assert (=> b!650265 (= e!373028 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!301952 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!301940 lt!301942 mask!3053))))

(declare-fun b!650266 () Bool)

(declare-fun e!373027 () SeekEntryResult!6871)

(assert (=> b!650266 (= e!373027 Undefined!6871)))

(declare-fun b!650267 () Bool)

(declare-fun e!373029 () SeekEntryResult!6871)

(assert (=> b!650267 (= e!373029 (Found!6871 lt!301952))))

(declare-fun lt!302079 () SeekEntryResult!6871)

(declare-fun d!92035 () Bool)

(assert (=> d!92035 (and (or ((_ is Undefined!6871) lt!302079) (not ((_ is Found!6871) lt!302079)) (and (bvsge (index!29832 lt!302079) #b00000000000000000000000000000000) (bvslt (index!29832 lt!302079) (size!18839 lt!301942)))) (or ((_ is Undefined!6871) lt!302079) ((_ is Found!6871) lt!302079) (not ((_ is MissingVacant!6871) lt!302079)) (not (= (index!29834 lt!302079) vacantSpotIndex!68)) (and (bvsge (index!29834 lt!302079) #b00000000000000000000000000000000) (bvslt (index!29834 lt!302079) (size!18839 lt!301942)))) (or ((_ is Undefined!6871) lt!302079) (ite ((_ is Found!6871) lt!302079) (= (select (arr!18475 lt!301942) (index!29832 lt!302079)) lt!301940) (and ((_ is MissingVacant!6871) lt!302079) (= (index!29834 lt!302079) vacantSpotIndex!68) (= (select (arr!18475 lt!301942) (index!29834 lt!302079)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92035 (= lt!302079 e!373027)))

(declare-fun c!74741 () Bool)

(assert (=> d!92035 (= c!74741 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!302080 () (_ BitVec 64))

(assert (=> d!92035 (= lt!302080 (select (arr!18475 lt!301942) lt!301952))))

(assert (=> d!92035 (validMask!0 mask!3053)))

(assert (=> d!92035 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 lt!301940 lt!301942 mask!3053) lt!302079)))

(declare-fun b!650268 () Bool)

(assert (=> b!650268 (= e!373028 (MissingVacant!6871 vacantSpotIndex!68))))

(declare-fun b!650269 () Bool)

(declare-fun c!74740 () Bool)

(assert (=> b!650269 (= c!74740 (= lt!302080 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650269 (= e!373029 e!373028)))

(declare-fun b!650270 () Bool)

(assert (=> b!650270 (= e!373027 e!373029)))

(declare-fun c!74742 () Bool)

(assert (=> b!650270 (= c!74742 (= lt!302080 lt!301940))))

(assert (= (and d!92035 c!74741) b!650266))

(assert (= (and d!92035 (not c!74741)) b!650270))

(assert (= (and b!650270 c!74742) b!650267))

(assert (= (and b!650270 (not c!74742)) b!650269))

(assert (= (and b!650269 c!74740) b!650268))

(assert (= (and b!650269 (not c!74740)) b!650265))

(assert (=> b!650265 m!623941))

(assert (=> b!650265 m!623941))

(declare-fun m!623951 () Bool)

(assert (=> b!650265 m!623951))

(declare-fun m!623953 () Bool)

(assert (=> d!92035 m!623953))

(declare-fun m!623955 () Bool)

(assert (=> d!92035 m!623955))

(declare-fun m!623957 () Bool)

(assert (=> d!92035 m!623957))

(assert (=> d!92035 m!623747))

(assert (=> b!650054 d!92035))

(declare-fun d!92037 () Bool)

(declare-fun lt!302083 () (_ BitVec 32))

(assert (=> d!92037 (and (bvsge lt!302083 #b00000000000000000000000000000000) (bvslt lt!302083 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92037 (= lt!302083 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!92037 (validMask!0 mask!3053)))

(assert (=> d!92037 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!302083)))

(declare-fun bs!19412 () Bool)

(assert (= bs!19412 d!92037))

(declare-fun m!623959 () Bool)

(assert (=> bs!19412 m!623959))

(assert (=> bs!19412 m!623747))

(assert (=> b!650054 d!92037))

(declare-fun d!92039 () Bool)

(declare-fun e!373038 () Bool)

(assert (=> d!92039 e!373038))

(declare-fun res!421530 () Bool)

(assert (=> d!92039 (=> (not res!421530) (not e!373038))))

(assert (=> d!92039 (= res!421530 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18839 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18839 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18839 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18839 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18839 a!2986))))))

(declare-fun lt!302086 () Unit!22125)

(declare-fun choose!9 (array!38544 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22125)

(assert (=> d!92039 (= lt!302086 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92039 (validMask!0 mask!3053)))

(assert (=> d!92039 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 mask!3053) lt!302086)))

(declare-fun b!650279 () Bool)

(assert (=> b!650279 (= e!373038 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 (select (arr!18475 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 (select (store (arr!18475 a!2986) i!1108 k0!1786) j!136) (array!38545 (store (arr!18475 a!2986) i!1108 k0!1786) (size!18839 a!2986)) mask!3053)))))

(assert (= (and d!92039 res!421530) b!650279))

(declare-fun m!623965 () Bool)

(assert (=> d!92039 m!623965))

(assert (=> d!92039 m!623747))

(assert (=> b!650279 m!623729))

(assert (=> b!650279 m!623729))

(declare-fun m!623967 () Bool)

(assert (=> b!650279 m!623967))

(assert (=> b!650279 m!623701))

(assert (=> b!650279 m!623705))

(assert (=> b!650279 m!623701))

(assert (=> b!650279 m!623735))

(assert (=> b!650054 d!92039))

(declare-fun d!92047 () Bool)

(assert (=> d!92047 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58944 d!92047))

(declare-fun d!92053 () Bool)

(assert (=> d!92053 (= (array_inv!14334 a!2986) (bvsge (size!18839 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58944 d!92053))

(declare-fun d!92055 () Bool)

(declare-fun res!421531 () Bool)

(declare-fun e!373045 () Bool)

(assert (=> d!92055 (=> res!421531 e!373045)))

(assert (=> d!92055 (= res!421531 (= (select (arr!18475 lt!301942) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18475 a!2986) j!136)))))

(assert (=> d!92055 (= (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!373045)))

(declare-fun b!650292 () Bool)

(declare-fun e!373046 () Bool)

(assert (=> b!650292 (= e!373045 e!373046)))

(declare-fun res!421532 () Bool)

(assert (=> b!650292 (=> (not res!421532) (not e!373046))))

(assert (=> b!650292 (= res!421532 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18839 lt!301942)))))

(declare-fun b!650293 () Bool)

(assert (=> b!650293 (= e!373046 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92055 (not res!421531)) b!650292))

(assert (= (and b!650292 res!421532) b!650293))

(declare-fun m!623969 () Bool)

(assert (=> d!92055 m!623969))

(assert (=> b!650293 m!623701))

(declare-fun m!623971 () Bool)

(assert (=> b!650293 m!623971))

(assert (=> b!650050 d!92055))

(assert (=> b!650050 d!92013))

(assert (=> b!650050 d!92023))

(declare-fun d!92057 () Bool)

(assert (=> d!92057 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302091 () Unit!22125)

(assert (=> d!92057 (= lt!302091 (choose!114 lt!301942 (select (arr!18475 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92057 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92057 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301942 (select (arr!18475 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!302091)))

(declare-fun bs!19413 () Bool)

(assert (= bs!19413 d!92057))

(assert (=> bs!19413 m!623701))

(assert (=> bs!19413 m!623713))

(assert (=> bs!19413 m!623701))

(declare-fun m!623973 () Bool)

(assert (=> bs!19413 m!623973))

(assert (=> b!650050 d!92057))

(assert (=> b!650050 d!92021))

(declare-fun d!92059 () Bool)

(assert (=> d!92059 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!650052 d!92059))

(declare-fun b!650300 () Bool)

(declare-fun e!373051 () Bool)

(declare-fun e!373053 () Bool)

(assert (=> b!650300 (= e!373051 e!373053)))

(declare-fun res!421533 () Bool)

(assert (=> b!650300 (=> (not res!421533) (not e!373053))))

(declare-fun e!373050 () Bool)

(assert (=> b!650300 (= res!421533 (not e!373050))))

(declare-fun res!421535 () Bool)

(assert (=> b!650300 (=> (not res!421535) (not e!373050))))

(assert (=> b!650300 (= res!421535 (validKeyInArray!0 (select (arr!18475 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92061 () Bool)

(declare-fun res!421534 () Bool)

(assert (=> d!92061 (=> res!421534 e!373051)))

(assert (=> d!92061 (= res!421534 (bvsge #b00000000000000000000000000000000 (size!18839 a!2986)))))

(assert (=> d!92061 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12420) e!373051)))

(declare-fun bm!33737 () Bool)

(declare-fun call!33740 () Bool)

(declare-fun c!74752 () Bool)

(assert (=> bm!33737 (= call!33740 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74752 (Cons!12419 (select (arr!18475 a!2986) #b00000000000000000000000000000000) Nil!12420) Nil!12420)))))

(declare-fun b!650301 () Bool)

(declare-fun e!373052 () Bool)

(assert (=> b!650301 (= e!373052 call!33740)))

(declare-fun b!650302 () Bool)

(assert (=> b!650302 (= e!373052 call!33740)))

(declare-fun b!650303 () Bool)

(assert (=> b!650303 (= e!373053 e!373052)))

(assert (=> b!650303 (= c!74752 (validKeyInArray!0 (select (arr!18475 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!650304 () Bool)

(assert (=> b!650304 (= e!373050 (contains!3152 Nil!12420 (select (arr!18475 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92061 (not res!421534)) b!650300))

(assert (= (and b!650300 res!421535) b!650304))

(assert (= (and b!650300 res!421533) b!650303))

(assert (= (and b!650303 c!74752) b!650301))

(assert (= (and b!650303 (not c!74752)) b!650302))

(assert (= (or b!650301 b!650302) bm!33737))

(declare-fun m!623977 () Bool)

(assert (=> b!650300 m!623977))

(assert (=> b!650300 m!623977))

(declare-fun m!623979 () Bool)

(assert (=> b!650300 m!623979))

(assert (=> bm!33737 m!623977))

(declare-fun m!623989 () Bool)

(assert (=> bm!33737 m!623989))

(assert (=> b!650303 m!623977))

(assert (=> b!650303 m!623977))

(assert (=> b!650303 m!623979))

(assert (=> b!650304 m!623977))

(assert (=> b!650304 m!623977))

(declare-fun m!623991 () Bool)

(assert (=> b!650304 m!623991))

(assert (=> b!650062 d!92061))

(declare-fun bm!33740 () Bool)

(declare-fun call!33743 () Bool)

(assert (=> bm!33740 (= call!33743 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!650331 () Bool)

(declare-fun e!373071 () Bool)

(assert (=> b!650331 (= e!373071 call!33743)))

(declare-fun d!92065 () Bool)

(declare-fun res!421541 () Bool)

(declare-fun e!373069 () Bool)

(assert (=> d!92065 (=> res!421541 e!373069)))

(assert (=> d!92065 (= res!421541 (bvsge #b00000000000000000000000000000000 (size!18839 a!2986)))))

(assert (=> d!92065 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!373069)))

(declare-fun b!650332 () Bool)

(declare-fun e!373070 () Bool)

(assert (=> b!650332 (= e!373070 call!33743)))

(declare-fun b!650333 () Bool)

(assert (=> b!650333 (= e!373069 e!373070)))

(declare-fun c!74764 () Bool)

(assert (=> b!650333 (= c!74764 (validKeyInArray!0 (select (arr!18475 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!650334 () Bool)

(assert (=> b!650334 (= e!373070 e!373071)))

(declare-fun lt!302107 () (_ BitVec 64))

(assert (=> b!650334 (= lt!302107 (select (arr!18475 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!302106 () Unit!22125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38544 (_ BitVec 64) (_ BitVec 32)) Unit!22125)

(assert (=> b!650334 (= lt!302106 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!302107 #b00000000000000000000000000000000))))

(assert (=> b!650334 (arrayContainsKey!0 a!2986 lt!302107 #b00000000000000000000000000000000)))

(declare-fun lt!302108 () Unit!22125)

(assert (=> b!650334 (= lt!302108 lt!302106)))

(declare-fun res!421540 () Bool)

(assert (=> b!650334 (= res!421540 (= (seekEntryOrOpen!0 (select (arr!18475 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6871 #b00000000000000000000000000000000)))))

(assert (=> b!650334 (=> (not res!421540) (not e!373071))))

(assert (= (and d!92065 (not res!421541)) b!650333))

(assert (= (and b!650333 c!74764) b!650334))

(assert (= (and b!650333 (not c!74764)) b!650332))

(assert (= (and b!650334 res!421540) b!650331))

(assert (= (or b!650331 b!650332) bm!33740))

(declare-fun m!624001 () Bool)

(assert (=> bm!33740 m!624001))

(assert (=> b!650333 m!623977))

(assert (=> b!650333 m!623977))

(assert (=> b!650333 m!623979))

(assert (=> b!650334 m!623977))

(declare-fun m!624003 () Bool)

(assert (=> b!650334 m!624003))

(declare-fun m!624005 () Bool)

(assert (=> b!650334 m!624005))

(assert (=> b!650334 m!623977))

(declare-fun m!624007 () Bool)

(assert (=> b!650334 m!624007))

(assert (=> b!650048 d!92065))

(declare-fun d!92069 () Bool)

(declare-fun res!421546 () Bool)

(declare-fun e!373076 () Bool)

(assert (=> d!92069 (=> res!421546 e!373076)))

(assert (=> d!92069 (= res!421546 (= (select (arr!18475 lt!301942) index!984) (select (arr!18475 a!2986) j!136)))))

(assert (=> d!92069 (= (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) index!984) e!373076)))

(declare-fun b!650339 () Bool)

(declare-fun e!373077 () Bool)

(assert (=> b!650339 (= e!373076 e!373077)))

(declare-fun res!421547 () Bool)

(assert (=> b!650339 (=> (not res!421547) (not e!373077))))

(assert (=> b!650339 (= res!421547 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18839 lt!301942)))))

(declare-fun b!650340 () Bool)

(assert (=> b!650340 (= e!373077 (arrayContainsKey!0 lt!301942 (select (arr!18475 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92069 (not res!421546)) b!650339))

(assert (= (and b!650339 res!421547) b!650340))

(assert (=> d!92069 m!623939))

(assert (=> b!650340 m!623701))

(declare-fun m!624009 () Bool)

(assert (=> b!650340 m!624009))

(assert (=> b!650047 d!92069))

(declare-fun b!650395 () Bool)

(declare-fun e!373118 () SeekEntryResult!6871)

(declare-fun e!373116 () SeekEntryResult!6871)

(assert (=> b!650395 (= e!373118 e!373116)))

(declare-fun lt!302131 () (_ BitVec 64))

(declare-fun lt!302132 () SeekEntryResult!6871)

(assert (=> b!650395 (= lt!302131 (select (arr!18475 a!2986) (index!29833 lt!302132)))))

(declare-fun c!74782 () Bool)

(assert (=> b!650395 (= c!74782 (= lt!302131 k0!1786))))

(declare-fun e!373117 () SeekEntryResult!6871)

(declare-fun b!650396 () Bool)

(assert (=> b!650396 (= e!373117 (seekKeyOrZeroReturnVacant!0 (x!58767 lt!302132) (index!29833 lt!302132) (index!29833 lt!302132) k0!1786 a!2986 mask!3053))))

(declare-fun b!650397 () Bool)

(assert (=> b!650397 (= e!373116 (Found!6871 (index!29833 lt!302132)))))

(declare-fun b!650398 () Bool)

(assert (=> b!650398 (= e!373117 (MissingZero!6871 (index!29833 lt!302132)))))

(declare-fun b!650399 () Bool)

(declare-fun c!74781 () Bool)

(assert (=> b!650399 (= c!74781 (= lt!302131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650399 (= e!373116 e!373117)))

(declare-fun b!650400 () Bool)

(assert (=> b!650400 (= e!373118 Undefined!6871)))

(declare-fun d!92071 () Bool)

(declare-fun lt!302133 () SeekEntryResult!6871)

(assert (=> d!92071 (and (or ((_ is Undefined!6871) lt!302133) (not ((_ is Found!6871) lt!302133)) (and (bvsge (index!29832 lt!302133) #b00000000000000000000000000000000) (bvslt (index!29832 lt!302133) (size!18839 a!2986)))) (or ((_ is Undefined!6871) lt!302133) ((_ is Found!6871) lt!302133) (not ((_ is MissingZero!6871) lt!302133)) (and (bvsge (index!29831 lt!302133) #b00000000000000000000000000000000) (bvslt (index!29831 lt!302133) (size!18839 a!2986)))) (or ((_ is Undefined!6871) lt!302133) ((_ is Found!6871) lt!302133) ((_ is MissingZero!6871) lt!302133) (not ((_ is MissingVacant!6871) lt!302133)) (and (bvsge (index!29834 lt!302133) #b00000000000000000000000000000000) (bvslt (index!29834 lt!302133) (size!18839 a!2986)))) (or ((_ is Undefined!6871) lt!302133) (ite ((_ is Found!6871) lt!302133) (= (select (arr!18475 a!2986) (index!29832 lt!302133)) k0!1786) (ite ((_ is MissingZero!6871) lt!302133) (= (select (arr!18475 a!2986) (index!29831 lt!302133)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6871) lt!302133) (= (select (arr!18475 a!2986) (index!29834 lt!302133)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92071 (= lt!302133 e!373118)))

(declare-fun c!74783 () Bool)

(assert (=> d!92071 (= c!74783 (and ((_ is Intermediate!6871) lt!302132) (undefined!7683 lt!302132)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38544 (_ BitVec 32)) SeekEntryResult!6871)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92071 (= lt!302132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92071 (validMask!0 mask!3053)))

(assert (=> d!92071 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!302133)))

(assert (= (and d!92071 c!74783) b!650400))

(assert (= (and d!92071 (not c!74783)) b!650395))

(assert (= (and b!650395 c!74782) b!650397))

(assert (= (and b!650395 (not c!74782)) b!650399))

(assert (= (and b!650399 c!74781) b!650398))

(assert (= (and b!650399 (not c!74781)) b!650396))

(declare-fun m!624065 () Bool)

(assert (=> b!650395 m!624065))

(declare-fun m!624067 () Bool)

(assert (=> b!650396 m!624067))

(declare-fun m!624069 () Bool)

(assert (=> d!92071 m!624069))

(declare-fun m!624071 () Bool)

(assert (=> d!92071 m!624071))

(declare-fun m!624073 () Bool)

(assert (=> d!92071 m!624073))

(declare-fun m!624075 () Bool)

(assert (=> d!92071 m!624075))

(declare-fun m!624077 () Bool)

(assert (=> d!92071 m!624077))

(assert (=> d!92071 m!624071))

(assert (=> d!92071 m!623747))

(assert (=> b!650049 d!92071))

(assert (=> b!650045 d!92069))

(declare-fun d!92097 () Bool)

(declare-fun res!421570 () Bool)

(declare-fun e!373119 () Bool)

(assert (=> d!92097 (=> res!421570 e!373119)))

(assert (=> d!92097 (= res!421570 (= (select (arr!18475 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92097 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!373119)))

(declare-fun b!650401 () Bool)

(declare-fun e!373120 () Bool)

(assert (=> b!650401 (= e!373119 e!373120)))

(declare-fun res!421571 () Bool)

(assert (=> b!650401 (=> (not res!421571) (not e!373120))))

(assert (=> b!650401 (= res!421571 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18839 a!2986)))))

(declare-fun b!650402 () Bool)

(assert (=> b!650402 (= e!373120 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92097 (not res!421570)) b!650401))

(assert (= (and b!650401 res!421571) b!650402))

(assert (=> d!92097 m!623977))

(declare-fun m!624079 () Bool)

(assert (=> b!650402 m!624079))

(assert (=> b!650057 d!92097))

(check-sat (not b!650259) (not b!650245) (not b!650396) (not d!92039) (not b!650333) (not b!650303) (not b!650340) (not b!650402) (not d!92035) (not b!650244) (not b!650300) (not b!650293) (not b!650240) (not b!650265) (not b!650243) (not b!650279) (not d!92031) (not d!92015) (not b!650252) (not bm!33737) (not b!650227) (not b!650253) (not d!92037) (not b!650304) (not bm!33736) (not bm!33740) (not d!92057) (not d!92011) (not b!650229) (not b!650216) (not d!92071) (not d!92025) (not d!92027) (not b!650249) (not d!92033) (not d!92023) (not b!650334) (not bm!33735) (not b!650248))
(check-sat)
