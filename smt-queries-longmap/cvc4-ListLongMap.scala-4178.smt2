; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56988 () Bool)

(assert start!56988)

(declare-fun res!407705 () Bool)

(declare-fun e!360641 () Bool)

(assert (=> start!56988 (=> (not res!407705) (not e!360641))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56988 (= res!407705 (validMask!0 mask!3053))))

(assert (=> start!56988 e!360641))

(assert (=> start!56988 true))

(declare-datatypes ((array!38064 0))(
  ( (array!38065 (arr!18266 (Array (_ BitVec 32) (_ BitVec 64))) (size!18630 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38064)

(declare-fun array_inv!14062 (array!38064) Bool)

(assert (=> start!56988 (array_inv!14062 a!2986)))

(declare-fun b!630697 () Bool)

(declare-fun e!360643 () Bool)

(assert (=> b!630697 (= e!360643 (not true))))

(declare-datatypes ((Unit!21158 0))(
  ( (Unit!21159) )
))
(declare-fun lt!291308 () Unit!21158)

(declare-fun e!360644 () Unit!21158)

(assert (=> b!630697 (= lt!291308 e!360644)))

(declare-fun lt!291310 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun c!71867 () Bool)

(declare-fun lt!291306 () array!38064)

(declare-datatypes ((SeekEntryResult!6706 0))(
  ( (MissingZero!6706 (index!29114 (_ BitVec 32))) (Found!6706 (index!29115 (_ BitVec 32))) (Intermediate!6706 (undefined!7518 Bool) (index!29116 (_ BitVec 32)) (x!57852 (_ BitVec 32))) (Undefined!6706) (MissingVacant!6706 (index!29117 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38064 (_ BitVec 32)) SeekEntryResult!6706)

(assert (=> b!630697 (= c!71867 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291310 lt!291306 mask!3053) Undefined!6706))))

(declare-fun e!360639 () Bool)

(assert (=> b!630697 e!360639))

(declare-fun res!407702 () Bool)

(assert (=> b!630697 (=> (not res!407702) (not e!360639))))

(declare-fun lt!291305 () SeekEntryResult!6706)

(declare-fun lt!291303 () (_ BitVec 32))

(assert (=> b!630697 (= res!407702 (= lt!291305 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291303 vacantSpotIndex!68 lt!291310 lt!291306 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!630697 (= lt!291305 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291303 vacantSpotIndex!68 (select (arr!18266 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!630697 (= lt!291310 (select (store (arr!18266 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291309 () Unit!21158)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38064 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21158)

(assert (=> b!630697 (= lt!291309 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291303 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630697 (= lt!291303 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630698 () Bool)

(declare-fun e!360645 () Bool)

(assert (=> b!630698 (= e!360641 e!360645)))

(declare-fun res!407698 () Bool)

(assert (=> b!630698 (=> (not res!407698) (not e!360645))))

(declare-fun lt!291307 () SeekEntryResult!6706)

(assert (=> b!630698 (= res!407698 (or (= lt!291307 (MissingZero!6706 i!1108)) (= lt!291307 (MissingVacant!6706 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38064 (_ BitVec 32)) SeekEntryResult!6706)

(assert (=> b!630698 (= lt!291307 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630699 () Bool)

(declare-fun Unit!21160 () Unit!21158)

(assert (=> b!630699 (= e!360644 Unit!21160)))

(assert (=> b!630699 false))

(declare-fun b!630700 () Bool)

(declare-fun res!407706 () Bool)

(assert (=> b!630700 (=> (not res!407706) (not e!360645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38064 (_ BitVec 32)) Bool)

(assert (=> b!630700 (= res!407706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630701 () Bool)

(declare-fun Unit!21161 () Unit!21158)

(assert (=> b!630701 (= e!360644 Unit!21161)))

(declare-fun b!630702 () Bool)

(declare-fun res!407697 () Bool)

(assert (=> b!630702 (=> (not res!407697) (not e!360645))))

(assert (=> b!630702 (= res!407697 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18266 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630703 () Bool)

(declare-fun lt!291304 () SeekEntryResult!6706)

(assert (=> b!630703 (= e!360639 (= lt!291304 lt!291305))))

(declare-fun b!630704 () Bool)

(declare-fun res!407704 () Bool)

(assert (=> b!630704 (=> (not res!407704) (not e!360641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630704 (= res!407704 (validKeyInArray!0 k!1786))))

(declare-fun b!630705 () Bool)

(declare-fun res!407701 () Bool)

(assert (=> b!630705 (=> (not res!407701) (not e!360641))))

(assert (=> b!630705 (= res!407701 (validKeyInArray!0 (select (arr!18266 a!2986) j!136)))))

(declare-fun b!630706 () Bool)

(declare-fun e!360640 () Bool)

(assert (=> b!630706 (= e!360640 e!360643)))

(declare-fun res!407700 () Bool)

(assert (=> b!630706 (=> (not res!407700) (not e!360643))))

(assert (=> b!630706 (= res!407700 (and (= lt!291304 (Found!6706 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18266 a!2986) index!984) (select (arr!18266 a!2986) j!136))) (not (= (select (arr!18266 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630706 (= lt!291304 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18266 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630707 () Bool)

(declare-fun res!407699 () Bool)

(assert (=> b!630707 (=> (not res!407699) (not e!360641))))

(assert (=> b!630707 (= res!407699 (and (= (size!18630 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18630 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18630 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630708 () Bool)

(assert (=> b!630708 (= e!360645 e!360640)))

(declare-fun res!407703 () Bool)

(assert (=> b!630708 (=> (not res!407703) (not e!360640))))

(assert (=> b!630708 (= res!407703 (= (select (store (arr!18266 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630708 (= lt!291306 (array!38065 (store (arr!18266 a!2986) i!1108 k!1786) (size!18630 a!2986)))))

(declare-fun b!630709 () Bool)

(declare-fun res!407707 () Bool)

(assert (=> b!630709 (=> (not res!407707) (not e!360645))))

(declare-datatypes ((List!12307 0))(
  ( (Nil!12304) (Cons!12303 (h!13348 (_ BitVec 64)) (t!18535 List!12307)) )
))
(declare-fun arrayNoDuplicates!0 (array!38064 (_ BitVec 32) List!12307) Bool)

(assert (=> b!630709 (= res!407707 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12304))))

(declare-fun b!630710 () Bool)

(declare-fun res!407708 () Bool)

(assert (=> b!630710 (=> (not res!407708) (not e!360641))))

(declare-fun arrayContainsKey!0 (array!38064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630710 (= res!407708 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56988 res!407705) b!630707))

(assert (= (and b!630707 res!407699) b!630705))

(assert (= (and b!630705 res!407701) b!630704))

(assert (= (and b!630704 res!407704) b!630710))

(assert (= (and b!630710 res!407708) b!630698))

(assert (= (and b!630698 res!407698) b!630700))

(assert (= (and b!630700 res!407706) b!630709))

(assert (= (and b!630709 res!407707) b!630702))

(assert (= (and b!630702 res!407697) b!630708))

(assert (= (and b!630708 res!407703) b!630706))

(assert (= (and b!630706 res!407700) b!630697))

(assert (= (and b!630697 res!407702) b!630703))

(assert (= (and b!630697 c!71867) b!630699))

(assert (= (and b!630697 (not c!71867)) b!630701))

(declare-fun m!605663 () Bool)

(assert (=> b!630704 m!605663))

(declare-fun m!605665 () Bool)

(assert (=> start!56988 m!605665))

(declare-fun m!605667 () Bool)

(assert (=> start!56988 m!605667))

(declare-fun m!605669 () Bool)

(assert (=> b!630710 m!605669))

(declare-fun m!605671 () Bool)

(assert (=> b!630702 m!605671))

(declare-fun m!605673 () Bool)

(assert (=> b!630709 m!605673))

(declare-fun m!605675 () Bool)

(assert (=> b!630705 m!605675))

(assert (=> b!630705 m!605675))

(declare-fun m!605677 () Bool)

(assert (=> b!630705 m!605677))

(declare-fun m!605679 () Bool)

(assert (=> b!630706 m!605679))

(assert (=> b!630706 m!605675))

(assert (=> b!630706 m!605675))

(declare-fun m!605681 () Bool)

(assert (=> b!630706 m!605681))

(declare-fun m!605683 () Bool)

(assert (=> b!630698 m!605683))

(declare-fun m!605685 () Bool)

(assert (=> b!630700 m!605685))

(declare-fun m!605687 () Bool)

(assert (=> b!630708 m!605687))

(declare-fun m!605689 () Bool)

(assert (=> b!630708 m!605689))

(declare-fun m!605691 () Bool)

(assert (=> b!630697 m!605691))

(assert (=> b!630697 m!605687))

(declare-fun m!605693 () Bool)

(assert (=> b!630697 m!605693))

(declare-fun m!605695 () Bool)

(assert (=> b!630697 m!605695))

(assert (=> b!630697 m!605675))

(declare-fun m!605697 () Bool)

(assert (=> b!630697 m!605697))

(declare-fun m!605699 () Bool)

(assert (=> b!630697 m!605699))

(declare-fun m!605701 () Bool)

(assert (=> b!630697 m!605701))

(assert (=> b!630697 m!605675))

(push 1)

