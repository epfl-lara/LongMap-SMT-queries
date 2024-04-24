; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57306 () Bool)

(assert start!57306)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!633656 () Bool)

(declare-datatypes ((array!38154 0))(
  ( (array!38155 (arr!18304 (Array (_ BitVec 32) (_ BitVec 64))) (size!18668 (_ BitVec 32))) )
))
(declare-fun lt!292866 () array!38154)

(declare-fun e!362328 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38154)

(declare-fun arrayContainsKey!0 (array!38154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633656 (= e!362328 (arrayContainsKey!0 lt!292866 (select (arr!18304 a!2986) j!136) index!984))))

(declare-fun b!633657 () Bool)

(declare-fun res!409714 () Bool)

(declare-fun e!362318 () Bool)

(assert (=> b!633657 (=> (not res!409714) (not e!362318))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633657 (= res!409714 (and (= (size!18668 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18668 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18668 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633658 () Bool)

(declare-fun e!362320 () Bool)

(declare-fun e!362324 () Bool)

(assert (=> b!633658 (= e!362320 (not e!362324))))

(declare-fun res!409700 () Bool)

(assert (=> b!633658 (=> res!409700 e!362324)))

(declare-datatypes ((SeekEntryResult!6700 0))(
  ( (MissingZero!6700 (index!29099 (_ BitVec 32))) (Found!6700 (index!29100 (_ BitVec 32))) (Intermediate!6700 (undefined!7512 Bool) (index!29101 (_ BitVec 32)) (x!57996 (_ BitVec 32))) (Undefined!6700) (MissingVacant!6700 (index!29102 (_ BitVec 32))) )
))
(declare-fun lt!292871 () SeekEntryResult!6700)

(assert (=> b!633658 (= res!409700 (not (= lt!292871 (Found!6700 index!984))))))

(declare-datatypes ((Unit!21309 0))(
  ( (Unit!21310) )
))
(declare-fun lt!292870 () Unit!21309)

(declare-fun e!362322 () Unit!21309)

(assert (=> b!633658 (= lt!292870 e!362322)))

(declare-fun c!72347 () Bool)

(assert (=> b!633658 (= c!72347 (= lt!292871 Undefined!6700))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!292872 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38154 (_ BitVec 32)) SeekEntryResult!6700)

(assert (=> b!633658 (= lt!292871 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292872 lt!292866 mask!3053))))

(declare-fun e!362327 () Bool)

(assert (=> b!633658 e!362327))

(declare-fun res!409711 () Bool)

(assert (=> b!633658 (=> (not res!409711) (not e!362327))))

(declare-fun lt!292865 () (_ BitVec 32))

(declare-fun lt!292868 () SeekEntryResult!6700)

(assert (=> b!633658 (= res!409711 (= lt!292868 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292865 vacantSpotIndex!68 lt!292872 lt!292866 mask!3053)))))

(assert (=> b!633658 (= lt!292868 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292865 vacantSpotIndex!68 (select (arr!18304 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!633658 (= lt!292872 (select (store (arr!18304 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292867 () Unit!21309)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38154 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21309)

(assert (=> b!633658 (= lt!292867 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292865 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633658 (= lt!292865 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!633659 () Bool)

(assert (=> b!633659 (= e!362324 true)))

(declare-fun e!362319 () Bool)

(assert (=> b!633659 e!362319))

(declare-fun res!409701 () Bool)

(assert (=> b!633659 (=> (not res!409701) (not e!362319))))

(declare-fun lt!292869 () (_ BitVec 64))

(assert (=> b!633659 (= res!409701 (= lt!292869 (select (arr!18304 a!2986) j!136)))))

(assert (=> b!633659 (= lt!292869 (select (store (arr!18304 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633660 () Bool)

(declare-fun e!362323 () Bool)

(declare-fun e!362321 () Bool)

(assert (=> b!633660 (= e!362323 e!362321)))

(declare-fun res!409712 () Bool)

(assert (=> b!633660 (=> (not res!409712) (not e!362321))))

(assert (=> b!633660 (= res!409712 (= (select (store (arr!18304 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633660 (= lt!292866 (array!38155 (store (arr!18304 a!2986) i!1108 k0!1786) (size!18668 a!2986)))))

(declare-fun b!633661 () Bool)

(declare-fun res!409706 () Bool)

(assert (=> b!633661 (=> (not res!409706) (not e!362323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38154 (_ BitVec 32)) Bool)

(assert (=> b!633661 (= res!409706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633662 () Bool)

(declare-fun res!409704 () Bool)

(assert (=> b!633662 (=> (not res!409704) (not e!362323))))

(declare-datatypes ((List!12252 0))(
  ( (Nil!12249) (Cons!12248 (h!13296 (_ BitVec 64)) (t!18472 List!12252)) )
))
(declare-fun arrayNoDuplicates!0 (array!38154 (_ BitVec 32) List!12252) Bool)

(assert (=> b!633662 (= res!409704 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12249))))

(declare-fun b!633663 () Bool)

(declare-fun res!409703 () Bool)

(assert (=> b!633663 (=> (not res!409703) (not e!362318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633663 (= res!409703 (validKeyInArray!0 (select (arr!18304 a!2986) j!136)))))

(declare-fun b!633664 () Bool)

(assert (=> b!633664 (= e!362318 e!362323)))

(declare-fun res!409713 () Bool)

(assert (=> b!633664 (=> (not res!409713) (not e!362323))))

(declare-fun lt!292864 () SeekEntryResult!6700)

(assert (=> b!633664 (= res!409713 (or (= lt!292864 (MissingZero!6700 i!1108)) (= lt!292864 (MissingVacant!6700 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38154 (_ BitVec 32)) SeekEntryResult!6700)

(assert (=> b!633664 (= lt!292864 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!409710 () Bool)

(assert (=> start!57306 (=> (not res!409710) (not e!362318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57306 (= res!409710 (validMask!0 mask!3053))))

(assert (=> start!57306 e!362318))

(assert (=> start!57306 true))

(declare-fun array_inv!14163 (array!38154) Bool)

(assert (=> start!57306 (array_inv!14163 a!2986)))

(declare-fun b!633665 () Bool)

(declare-fun Unit!21311 () Unit!21309)

(assert (=> b!633665 (= e!362322 Unit!21311)))

(declare-fun b!633666 () Bool)

(declare-fun res!409705 () Bool)

(assert (=> b!633666 (=> (not res!409705) (not e!362318))))

(assert (=> b!633666 (= res!409705 (validKeyInArray!0 k0!1786))))

(declare-fun b!633667 () Bool)

(declare-fun res!409708 () Bool)

(assert (=> b!633667 (=> (not res!409708) (not e!362318))))

(assert (=> b!633667 (= res!409708 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633668 () Bool)

(assert (=> b!633668 (= e!362321 e!362320)))

(declare-fun res!409707 () Bool)

(assert (=> b!633668 (=> (not res!409707) (not e!362320))))

(declare-fun lt!292873 () SeekEntryResult!6700)

(assert (=> b!633668 (= res!409707 (and (= lt!292873 (Found!6700 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18304 a!2986) index!984) (select (arr!18304 a!2986) j!136))) (not (= (select (arr!18304 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!633668 (= lt!292873 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18304 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633669 () Bool)

(declare-fun e!362326 () Bool)

(assert (=> b!633669 (= e!362326 e!362328)))

(declare-fun res!409709 () Bool)

(assert (=> b!633669 (=> (not res!409709) (not e!362328))))

(assert (=> b!633669 (= res!409709 (arrayContainsKey!0 lt!292866 (select (arr!18304 a!2986) j!136) j!136))))

(declare-fun b!633670 () Bool)

(assert (=> b!633670 (= e!362319 e!362326)))

(declare-fun res!409702 () Bool)

(assert (=> b!633670 (=> res!409702 e!362326)))

(assert (=> b!633670 (= res!409702 (or (not (= (select (arr!18304 a!2986) j!136) lt!292872)) (not (= (select (arr!18304 a!2986) j!136) lt!292869)) (bvsge j!136 index!984)))))

(declare-fun b!633671 () Bool)

(declare-fun res!409699 () Bool)

(assert (=> b!633671 (=> (not res!409699) (not e!362323))))

(assert (=> b!633671 (= res!409699 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18304 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633672 () Bool)

(assert (=> b!633672 (= e!362327 (= lt!292873 lt!292868))))

(declare-fun b!633673 () Bool)

(declare-fun Unit!21312 () Unit!21309)

(assert (=> b!633673 (= e!362322 Unit!21312)))

(assert (=> b!633673 false))

(assert (= (and start!57306 res!409710) b!633657))

(assert (= (and b!633657 res!409714) b!633663))

(assert (= (and b!633663 res!409703) b!633666))

(assert (= (and b!633666 res!409705) b!633667))

(assert (= (and b!633667 res!409708) b!633664))

(assert (= (and b!633664 res!409713) b!633661))

(assert (= (and b!633661 res!409706) b!633662))

(assert (= (and b!633662 res!409704) b!633671))

(assert (= (and b!633671 res!409699) b!633660))

(assert (= (and b!633660 res!409712) b!633668))

(assert (= (and b!633668 res!409707) b!633658))

(assert (= (and b!633658 res!409711) b!633672))

(assert (= (and b!633658 c!72347) b!633673))

(assert (= (and b!633658 (not c!72347)) b!633665))

(assert (= (and b!633658 (not res!409700)) b!633659))

(assert (= (and b!633659 res!409701) b!633670))

(assert (= (and b!633670 (not res!409702)) b!633669))

(assert (= (and b!633669 res!409709) b!633656))

(declare-fun m!608647 () Bool)

(assert (=> b!633664 m!608647))

(declare-fun m!608649 () Bool)

(assert (=> b!633660 m!608649))

(declare-fun m!608651 () Bool)

(assert (=> b!633660 m!608651))

(declare-fun m!608653 () Bool)

(assert (=> b!633667 m!608653))

(declare-fun m!608655 () Bool)

(assert (=> b!633662 m!608655))

(declare-fun m!608657 () Bool)

(assert (=> b!633669 m!608657))

(assert (=> b!633669 m!608657))

(declare-fun m!608659 () Bool)

(assert (=> b!633669 m!608659))

(assert (=> b!633659 m!608657))

(assert (=> b!633659 m!608649))

(declare-fun m!608661 () Bool)

(assert (=> b!633659 m!608661))

(declare-fun m!608663 () Bool)

(assert (=> b!633668 m!608663))

(assert (=> b!633668 m!608657))

(assert (=> b!633668 m!608657))

(declare-fun m!608665 () Bool)

(assert (=> b!633668 m!608665))

(declare-fun m!608667 () Bool)

(assert (=> b!633661 m!608667))

(assert (=> b!633656 m!608657))

(assert (=> b!633656 m!608657))

(declare-fun m!608669 () Bool)

(assert (=> b!633656 m!608669))

(declare-fun m!608671 () Bool)

(assert (=> b!633671 m!608671))

(declare-fun m!608673 () Bool)

(assert (=> b!633666 m!608673))

(declare-fun m!608675 () Bool)

(assert (=> b!633658 m!608675))

(declare-fun m!608677 () Bool)

(assert (=> b!633658 m!608677))

(declare-fun m!608679 () Bool)

(assert (=> b!633658 m!608679))

(assert (=> b!633658 m!608657))

(assert (=> b!633658 m!608649))

(declare-fun m!608681 () Bool)

(assert (=> b!633658 m!608681))

(declare-fun m!608683 () Bool)

(assert (=> b!633658 m!608683))

(assert (=> b!633658 m!608657))

(declare-fun m!608685 () Bool)

(assert (=> b!633658 m!608685))

(assert (=> b!633670 m!608657))

(assert (=> b!633663 m!608657))

(assert (=> b!633663 m!608657))

(declare-fun m!608687 () Bool)

(assert (=> b!633663 m!608687))

(declare-fun m!608689 () Bool)

(assert (=> start!57306 m!608689))

(declare-fun m!608691 () Bool)

(assert (=> start!57306 m!608691))

(check-sat (not b!633664) (not b!633656) (not b!633666) (not b!633663) (not b!633668) (not b!633669) (not start!57306) (not b!633661) (not b!633662) (not b!633667) (not b!633658))
(check-sat)
