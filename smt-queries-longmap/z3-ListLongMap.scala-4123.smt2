; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56268 () Bool)

(assert start!56268)

(declare-fun lt!289177 () (_ BitVec 64))

(declare-datatypes ((array!37707 0))(
  ( (array!37708 (arr!18098 (Array (_ BitVec 32) (_ BitVec 64))) (size!18463 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37707)

(declare-fun e!357693 () Bool)

(declare-fun b!623684 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!623684 (= e!357693 (= (select (arr!18098 a!2986) j!136) lt!289177))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623684 (= (select (store (arr!18098 a!2986) i!1108 k0!1786) index!984) (select (arr!18098 a!2986) j!136))))

(declare-fun b!623685 () Bool)

(declare-fun res!402012 () Bool)

(declare-fun e!357696 () Bool)

(assert (=> b!623685 (=> (not res!402012) (not e!357696))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!623685 (= res!402012 (and (= (size!18463 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18463 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18463 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623686 () Bool)

(declare-fun e!357691 () Bool)

(assert (=> b!623686 (= e!357691 (not e!357693))))

(declare-fun res!402009 () Bool)

(assert (=> b!623686 (=> res!402009 e!357693)))

(declare-datatypes ((SeekEntryResult!6535 0))(
  ( (MissingZero!6535 (index!28424 (_ BitVec 32))) (Found!6535 (index!28425 (_ BitVec 32))) (Intermediate!6535 (undefined!7347 Bool) (index!28426 (_ BitVec 32)) (x!57197 (_ BitVec 32))) (Undefined!6535) (MissingVacant!6535 (index!28427 (_ BitVec 32))) )
))
(declare-fun lt!289180 () SeekEntryResult!6535)

(assert (=> b!623686 (= res!402009 (not (= lt!289180 (Found!6535 index!984))))))

(declare-datatypes ((Unit!21040 0))(
  ( (Unit!21041) )
))
(declare-fun lt!289175 () Unit!21040)

(declare-fun e!357692 () Unit!21040)

(assert (=> b!623686 (= lt!289175 e!357692)))

(declare-fun c!71205 () Bool)

(assert (=> b!623686 (= c!71205 (= lt!289180 Undefined!6535))))

(declare-fun lt!289179 () array!37707)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37707 (_ BitVec 32)) SeekEntryResult!6535)

(assert (=> b!623686 (= lt!289180 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289177 lt!289179 mask!3053))))

(declare-fun e!357695 () Bool)

(assert (=> b!623686 e!357695))

(declare-fun res!402019 () Bool)

(assert (=> b!623686 (=> (not res!402019) (not e!357695))))

(declare-fun lt!289173 () SeekEntryResult!6535)

(declare-fun lt!289174 () (_ BitVec 32))

(assert (=> b!623686 (= res!402019 (= lt!289173 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289174 vacantSpotIndex!68 lt!289177 lt!289179 mask!3053)))))

(assert (=> b!623686 (= lt!289173 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289174 vacantSpotIndex!68 (select (arr!18098 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623686 (= lt!289177 (select (store (arr!18098 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!289172 () Unit!21040)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37707 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21040)

(assert (=> b!623686 (= lt!289172 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289174 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623686 (= lt!289174 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!623687 () Bool)

(declare-fun res!402018 () Bool)

(assert (=> b!623687 (=> (not res!402018) (not e!357696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623687 (= res!402018 (validKeyInArray!0 k0!1786))))

(declare-fun b!623688 () Bool)

(declare-fun res!402010 () Bool)

(declare-fun e!357689 () Bool)

(assert (=> b!623688 (=> (not res!402010) (not e!357689))))

(assert (=> b!623688 (= res!402010 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18098 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623689 () Bool)

(declare-fun lt!289176 () SeekEntryResult!6535)

(assert (=> b!623689 (= e!357695 (= lt!289176 lt!289173))))

(declare-fun b!623690 () Bool)

(assert (=> b!623690 (= e!357696 e!357689)))

(declare-fun res!402020 () Bool)

(assert (=> b!623690 (=> (not res!402020) (not e!357689))))

(declare-fun lt!289178 () SeekEntryResult!6535)

(assert (=> b!623690 (= res!402020 (or (= lt!289178 (MissingZero!6535 i!1108)) (= lt!289178 (MissingVacant!6535 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37707 (_ BitVec 32)) SeekEntryResult!6535)

(assert (=> b!623690 (= lt!289178 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!402015 () Bool)

(assert (=> start!56268 (=> (not res!402015) (not e!357696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56268 (= res!402015 (validMask!0 mask!3053))))

(assert (=> start!56268 e!357696))

(assert (=> start!56268 true))

(declare-fun array_inv!13981 (array!37707) Bool)

(assert (=> start!56268 (array_inv!13981 a!2986)))

(declare-fun b!623691 () Bool)

(declare-fun res!402013 () Bool)

(assert (=> b!623691 (=> (not res!402013) (not e!357689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37707 (_ BitVec 32)) Bool)

(assert (=> b!623691 (= res!402013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623692 () Bool)

(declare-fun res!402016 () Bool)

(assert (=> b!623692 (=> (not res!402016) (not e!357696))))

(assert (=> b!623692 (= res!402016 (validKeyInArray!0 (select (arr!18098 a!2986) j!136)))))

(declare-fun b!623693 () Bool)

(declare-fun Unit!21042 () Unit!21040)

(assert (=> b!623693 (= e!357692 Unit!21042)))

(declare-fun b!623694 () Bool)

(declare-fun e!357694 () Bool)

(assert (=> b!623694 (= e!357694 e!357691)))

(declare-fun res!402017 () Bool)

(assert (=> b!623694 (=> (not res!402017) (not e!357691))))

(assert (=> b!623694 (= res!402017 (and (= lt!289176 (Found!6535 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18098 a!2986) index!984) (select (arr!18098 a!2986) j!136))) (not (= (select (arr!18098 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!623694 (= lt!289176 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18098 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623695 () Bool)

(assert (=> b!623695 (= e!357689 e!357694)))

(declare-fun res!402008 () Bool)

(assert (=> b!623695 (=> (not res!402008) (not e!357694))))

(assert (=> b!623695 (= res!402008 (= (select (store (arr!18098 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623695 (= lt!289179 (array!37708 (store (arr!18098 a!2986) i!1108 k0!1786) (size!18463 a!2986)))))

(declare-fun b!623696 () Bool)

(declare-fun res!402014 () Bool)

(assert (=> b!623696 (=> (not res!402014) (not e!357696))))

(declare-fun arrayContainsKey!0 (array!37707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623696 (= res!402014 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623697 () Bool)

(declare-fun res!402011 () Bool)

(assert (=> b!623697 (=> (not res!402011) (not e!357689))))

(declare-datatypes ((List!12178 0))(
  ( (Nil!12175) (Cons!12174 (h!13219 (_ BitVec 64)) (t!18397 List!12178)) )
))
(declare-fun arrayNoDuplicates!0 (array!37707 (_ BitVec 32) List!12178) Bool)

(assert (=> b!623697 (= res!402011 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12175))))

(declare-fun b!623698 () Bool)

(declare-fun Unit!21043 () Unit!21040)

(assert (=> b!623698 (= e!357692 Unit!21043)))

(assert (=> b!623698 false))

(assert (= (and start!56268 res!402015) b!623685))

(assert (= (and b!623685 res!402012) b!623692))

(assert (= (and b!623692 res!402016) b!623687))

(assert (= (and b!623687 res!402018) b!623696))

(assert (= (and b!623696 res!402014) b!623690))

(assert (= (and b!623690 res!402020) b!623691))

(assert (= (and b!623691 res!402013) b!623697))

(assert (= (and b!623697 res!402011) b!623688))

(assert (= (and b!623688 res!402010) b!623695))

(assert (= (and b!623695 res!402008) b!623694))

(assert (= (and b!623694 res!402017) b!623686))

(assert (= (and b!623686 res!402019) b!623689))

(assert (= (and b!623686 c!71205) b!623698))

(assert (= (and b!623686 (not c!71205)) b!623693))

(assert (= (and b!623686 (not res!402009)) b!623684))

(declare-fun m!598933 () Bool)

(assert (=> b!623695 m!598933))

(declare-fun m!598935 () Bool)

(assert (=> b!623695 m!598935))

(declare-fun m!598937 () Bool)

(assert (=> b!623697 m!598937))

(declare-fun m!598939 () Bool)

(assert (=> b!623688 m!598939))

(declare-fun m!598941 () Bool)

(assert (=> b!623687 m!598941))

(declare-fun m!598943 () Bool)

(assert (=> b!623686 m!598943))

(declare-fun m!598945 () Bool)

(assert (=> b!623686 m!598945))

(assert (=> b!623686 m!598933))

(declare-fun m!598947 () Bool)

(assert (=> b!623686 m!598947))

(assert (=> b!623686 m!598945))

(declare-fun m!598949 () Bool)

(assert (=> b!623686 m!598949))

(declare-fun m!598951 () Bool)

(assert (=> b!623686 m!598951))

(declare-fun m!598953 () Bool)

(assert (=> b!623686 m!598953))

(declare-fun m!598955 () Bool)

(assert (=> b!623686 m!598955))

(declare-fun m!598957 () Bool)

(assert (=> b!623690 m!598957))

(assert (=> b!623692 m!598945))

(assert (=> b!623692 m!598945))

(declare-fun m!598959 () Bool)

(assert (=> b!623692 m!598959))

(declare-fun m!598961 () Bool)

(assert (=> b!623694 m!598961))

(assert (=> b!623694 m!598945))

(assert (=> b!623694 m!598945))

(declare-fun m!598963 () Bool)

(assert (=> b!623694 m!598963))

(assert (=> b!623684 m!598945))

(assert (=> b!623684 m!598933))

(declare-fun m!598965 () Bool)

(assert (=> b!623684 m!598965))

(declare-fun m!598967 () Bool)

(assert (=> b!623691 m!598967))

(declare-fun m!598969 () Bool)

(assert (=> start!56268 m!598969))

(declare-fun m!598971 () Bool)

(assert (=> start!56268 m!598971))

(declare-fun m!598973 () Bool)

(assert (=> b!623696 m!598973))

(check-sat (not b!623686) (not b!623687) (not b!623694) (not b!623696) (not b!623691) (not b!623690) (not start!56268) (not b!623697) (not b!623692))
(check-sat)
