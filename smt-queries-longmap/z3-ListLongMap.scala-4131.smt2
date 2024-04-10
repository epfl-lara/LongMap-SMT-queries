; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56334 () Bool)

(assert start!56334)

(declare-fun b!624677 () Bool)

(declare-fun res!402833 () Bool)

(declare-fun e!358168 () Bool)

(assert (=> b!624677 (=> (not res!402833) (not e!358168))))

(declare-datatypes ((array!37759 0))(
  ( (array!37760 (arr!18124 (Array (_ BitVec 32) (_ BitVec 64))) (size!18488 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37759)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624677 (= res!402833 (validKeyInArray!0 (select (arr!18124 a!2986) j!136)))))

(declare-fun b!624679 () Bool)

(declare-fun res!402829 () Bool)

(assert (=> b!624679 (=> (not res!402829) (not e!358168))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!624679 (= res!402829 (validKeyInArray!0 k0!1786))))

(declare-fun b!624680 () Bool)

(declare-fun res!402836 () Bool)

(assert (=> b!624680 (=> (not res!402836) (not e!358168))))

(declare-fun arrayContainsKey!0 (array!37759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624680 (= res!402836 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624681 () Bool)

(declare-fun e!358169 () Bool)

(assert (=> b!624681 (= e!358168 e!358169)))

(declare-fun res!402831 () Bool)

(assert (=> b!624681 (=> (not res!402831) (not e!358169))))

(declare-datatypes ((SeekEntryResult!6564 0))(
  ( (MissingZero!6564 (index!28540 (_ BitVec 32))) (Found!6564 (index!28541 (_ BitVec 32))) (Intermediate!6564 (undefined!7376 Bool) (index!28542 (_ BitVec 32)) (x!57295 (_ BitVec 32))) (Undefined!6564) (MissingVacant!6564 (index!28543 (_ BitVec 32))) )
))
(declare-fun lt!289645 () SeekEntryResult!6564)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624681 (= res!402831 (or (= lt!289645 (MissingZero!6564 i!1108)) (= lt!289645 (MissingVacant!6564 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37759 (_ BitVec 32)) SeekEntryResult!6564)

(assert (=> b!624681 (= lt!289645 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624682 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!624682 (= e!358169 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun b!624683 () Bool)

(declare-fun res!402835 () Bool)

(assert (=> b!624683 (=> (not res!402835) (not e!358168))))

(assert (=> b!624683 (= res!402835 (and (= (size!18488 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18488 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18488 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624684 () Bool)

(declare-fun res!402834 () Bool)

(assert (=> b!624684 (=> (not res!402834) (not e!358169))))

(declare-datatypes ((List!12165 0))(
  ( (Nil!12162) (Cons!12161 (h!13206 (_ BitVec 64)) (t!18393 List!12165)) )
))
(declare-fun arrayNoDuplicates!0 (array!37759 (_ BitVec 32) List!12165) Bool)

(assert (=> b!624684 (= res!402834 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12162))))

(declare-fun res!402832 () Bool)

(assert (=> start!56334 (=> (not res!402832) (not e!358168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56334 (= res!402832 (validMask!0 mask!3053))))

(assert (=> start!56334 e!358168))

(assert (=> start!56334 true))

(declare-fun array_inv!13920 (array!37759) Bool)

(assert (=> start!56334 (array_inv!13920 a!2986)))

(declare-fun b!624678 () Bool)

(declare-fun res!402830 () Bool)

(assert (=> b!624678 (=> (not res!402830) (not e!358169))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624678 (= res!402830 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18124 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18124 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624685 () Bool)

(declare-fun res!402827 () Bool)

(assert (=> b!624685 (=> (not res!402827) (not e!358169))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37759 (_ BitVec 32)) SeekEntryResult!6564)

(assert (=> b!624685 (= res!402827 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18124 a!2986) j!136) a!2986 mask!3053) (Found!6564 j!136)))))

(declare-fun b!624686 () Bool)

(declare-fun res!402828 () Bool)

(assert (=> b!624686 (=> (not res!402828) (not e!358169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37759 (_ BitVec 32)) Bool)

(assert (=> b!624686 (= res!402828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56334 res!402832) b!624683))

(assert (= (and b!624683 res!402835) b!624677))

(assert (= (and b!624677 res!402833) b!624679))

(assert (= (and b!624679 res!402829) b!624680))

(assert (= (and b!624680 res!402836) b!624681))

(assert (= (and b!624681 res!402831) b!624686))

(assert (= (and b!624686 res!402828) b!624684))

(assert (= (and b!624684 res!402834) b!624678))

(assert (= (and b!624678 res!402830) b!624685))

(assert (= (and b!624685 res!402827) b!624682))

(declare-fun m!600361 () Bool)

(assert (=> b!624685 m!600361))

(assert (=> b!624685 m!600361))

(declare-fun m!600363 () Bool)

(assert (=> b!624685 m!600363))

(declare-fun m!600365 () Bool)

(assert (=> b!624678 m!600365))

(declare-fun m!600367 () Bool)

(assert (=> b!624678 m!600367))

(declare-fun m!600369 () Bool)

(assert (=> b!624678 m!600369))

(declare-fun m!600371 () Bool)

(assert (=> b!624681 m!600371))

(declare-fun m!600373 () Bool)

(assert (=> b!624686 m!600373))

(declare-fun m!600375 () Bool)

(assert (=> b!624679 m!600375))

(declare-fun m!600377 () Bool)

(assert (=> b!624680 m!600377))

(declare-fun m!600379 () Bool)

(assert (=> start!56334 m!600379))

(declare-fun m!600381 () Bool)

(assert (=> start!56334 m!600381))

(declare-fun m!600383 () Bool)

(assert (=> b!624684 m!600383))

(assert (=> b!624677 m!600361))

(assert (=> b!624677 m!600361))

(declare-fun m!600385 () Bool)

(assert (=> b!624677 m!600385))

(check-sat (not b!624681) (not b!624680) (not b!624686) (not b!624677) (not b!624684) (not start!56334) (not b!624679) (not b!624685))
(check-sat)
(get-model)

(declare-fun b!624752 () Bool)

(declare-fun e!358205 () SeekEntryResult!6564)

(declare-fun lt!289661 () SeekEntryResult!6564)

(assert (=> b!624752 (= e!358205 (MissingZero!6564 (index!28542 lt!289661)))))

(declare-fun b!624753 () Bool)

(declare-fun e!358204 () SeekEntryResult!6564)

(assert (=> b!624753 (= e!358204 (Found!6564 (index!28542 lt!289661)))))

(declare-fun b!624754 () Bool)

(declare-fun e!358206 () SeekEntryResult!6564)

(assert (=> b!624754 (= e!358206 Undefined!6564)))

(declare-fun b!624755 () Bool)

(assert (=> b!624755 (= e!358205 (seekKeyOrZeroReturnVacant!0 (x!57295 lt!289661) (index!28542 lt!289661) (index!28542 lt!289661) k0!1786 a!2986 mask!3053))))

(declare-fun b!624756 () Bool)

(assert (=> b!624756 (= e!358206 e!358204)))

(declare-fun lt!289663 () (_ BitVec 64))

(assert (=> b!624756 (= lt!289663 (select (arr!18124 a!2986) (index!28542 lt!289661)))))

(declare-fun c!71305 () Bool)

(assert (=> b!624756 (= c!71305 (= lt!289663 k0!1786))))

(declare-fun b!624757 () Bool)

(declare-fun c!71304 () Bool)

(assert (=> b!624757 (= c!71304 (= lt!289663 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!624757 (= e!358204 e!358205)))

(declare-fun d!88757 () Bool)

(declare-fun lt!289662 () SeekEntryResult!6564)

(get-info :version)

(assert (=> d!88757 (and (or ((_ is Undefined!6564) lt!289662) (not ((_ is Found!6564) lt!289662)) (and (bvsge (index!28541 lt!289662) #b00000000000000000000000000000000) (bvslt (index!28541 lt!289662) (size!18488 a!2986)))) (or ((_ is Undefined!6564) lt!289662) ((_ is Found!6564) lt!289662) (not ((_ is MissingZero!6564) lt!289662)) (and (bvsge (index!28540 lt!289662) #b00000000000000000000000000000000) (bvslt (index!28540 lt!289662) (size!18488 a!2986)))) (or ((_ is Undefined!6564) lt!289662) ((_ is Found!6564) lt!289662) ((_ is MissingZero!6564) lt!289662) (not ((_ is MissingVacant!6564) lt!289662)) (and (bvsge (index!28543 lt!289662) #b00000000000000000000000000000000) (bvslt (index!28543 lt!289662) (size!18488 a!2986)))) (or ((_ is Undefined!6564) lt!289662) (ite ((_ is Found!6564) lt!289662) (= (select (arr!18124 a!2986) (index!28541 lt!289662)) k0!1786) (ite ((_ is MissingZero!6564) lt!289662) (= (select (arr!18124 a!2986) (index!28540 lt!289662)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6564) lt!289662) (= (select (arr!18124 a!2986) (index!28543 lt!289662)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88757 (= lt!289662 e!358206)))

(declare-fun c!71303 () Bool)

(assert (=> d!88757 (= c!71303 (and ((_ is Intermediate!6564) lt!289661) (undefined!7376 lt!289661)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37759 (_ BitVec 32)) SeekEntryResult!6564)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88757 (= lt!289661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88757 (validMask!0 mask!3053)))

(assert (=> d!88757 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!289662)))

(assert (= (and d!88757 c!71303) b!624754))

(assert (= (and d!88757 (not c!71303)) b!624756))

(assert (= (and b!624756 c!71305) b!624753))

(assert (= (and b!624756 (not c!71305)) b!624757))

(assert (= (and b!624757 c!71304) b!624752))

(assert (= (and b!624757 (not c!71304)) b!624755))

(declare-fun m!600421 () Bool)

(assert (=> b!624755 m!600421))

(declare-fun m!600423 () Bool)

(assert (=> b!624756 m!600423))

(declare-fun m!600425 () Bool)

(assert (=> d!88757 m!600425))

(declare-fun m!600427 () Bool)

(assert (=> d!88757 m!600427))

(declare-fun m!600429 () Bool)

(assert (=> d!88757 m!600429))

(declare-fun m!600431 () Bool)

(assert (=> d!88757 m!600431))

(declare-fun m!600433 () Bool)

(assert (=> d!88757 m!600433))

(assert (=> d!88757 m!600427))

(assert (=> d!88757 m!600379))

(assert (=> b!624681 d!88757))

(declare-fun b!624780 () Bool)

(declare-fun e!358224 () Bool)

(declare-fun e!358225 () Bool)

(assert (=> b!624780 (= e!358224 e!358225)))

(declare-fun lt!289674 () (_ BitVec 64))

(assert (=> b!624780 (= lt!289674 (select (arr!18124 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21088 0))(
  ( (Unit!21089) )
))
(declare-fun lt!289675 () Unit!21088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37759 (_ BitVec 64) (_ BitVec 32)) Unit!21088)

(assert (=> b!624780 (= lt!289675 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!289674 #b00000000000000000000000000000000))))

(assert (=> b!624780 (arrayContainsKey!0 a!2986 lt!289674 #b00000000000000000000000000000000)))

(declare-fun lt!289673 () Unit!21088)

(assert (=> b!624780 (= lt!289673 lt!289675)))

(declare-fun res!402893 () Bool)

(assert (=> b!624780 (= res!402893 (= (seekEntryOrOpen!0 (select (arr!18124 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6564 #b00000000000000000000000000000000)))))

(assert (=> b!624780 (=> (not res!402893) (not e!358225))))

(declare-fun d!88765 () Bool)

(declare-fun res!402892 () Bool)

(declare-fun e!358226 () Bool)

(assert (=> d!88765 (=> res!402892 e!358226)))

(assert (=> d!88765 (= res!402892 (bvsge #b00000000000000000000000000000000 (size!18488 a!2986)))))

(assert (=> d!88765 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!358226)))

(declare-fun b!624781 () Bool)

(assert (=> b!624781 (= e!358226 e!358224)))

(declare-fun c!71311 () Bool)

(assert (=> b!624781 (= c!71311 (validKeyInArray!0 (select (arr!18124 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!624782 () Bool)

(declare-fun call!33211 () Bool)

(assert (=> b!624782 (= e!358224 call!33211)))

(declare-fun b!624783 () Bool)

(assert (=> b!624783 (= e!358225 call!33211)))

(declare-fun bm!33208 () Bool)

(assert (=> bm!33208 (= call!33211 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!88765 (not res!402892)) b!624781))

(assert (= (and b!624781 c!71311) b!624780))

(assert (= (and b!624781 (not c!71311)) b!624782))

(assert (= (and b!624780 res!402893) b!624783))

(assert (= (or b!624783 b!624782) bm!33208))

(declare-fun m!600443 () Bool)

(assert (=> b!624780 m!600443))

(declare-fun m!600445 () Bool)

(assert (=> b!624780 m!600445))

(declare-fun m!600447 () Bool)

(assert (=> b!624780 m!600447))

(assert (=> b!624780 m!600443))

(declare-fun m!600449 () Bool)

(assert (=> b!624780 m!600449))

(assert (=> b!624781 m!600443))

(assert (=> b!624781 m!600443))

(declare-fun m!600451 () Bool)

(assert (=> b!624781 m!600451))

(declare-fun m!600453 () Bool)

(assert (=> bm!33208 m!600453))

(assert (=> b!624686 d!88765))

(declare-fun d!88771 () Bool)

(declare-fun res!402901 () Bool)

(declare-fun e!358241 () Bool)

(assert (=> d!88771 (=> res!402901 e!358241)))

(assert (=> d!88771 (= res!402901 (= (select (arr!18124 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88771 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!358241)))

(declare-fun b!624805 () Bool)

(declare-fun e!358242 () Bool)

(assert (=> b!624805 (= e!358241 e!358242)))

(declare-fun res!402902 () Bool)

(assert (=> b!624805 (=> (not res!402902) (not e!358242))))

(assert (=> b!624805 (= res!402902 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18488 a!2986)))))

(declare-fun b!624806 () Bool)

(assert (=> b!624806 (= e!358242 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88771 (not res!402901)) b!624805))

(assert (= (and b!624805 res!402902) b!624806))

(assert (=> d!88771 m!600443))

(declare-fun m!600463 () Bool)

(assert (=> b!624806 m!600463))

(assert (=> b!624680 d!88771))

(declare-fun b!624843 () Bool)

(declare-fun c!71338 () Bool)

(declare-fun lt!289693 () (_ BitVec 64))

(assert (=> b!624843 (= c!71338 (= lt!289693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358262 () SeekEntryResult!6564)

(declare-fun e!358263 () SeekEntryResult!6564)

(assert (=> b!624843 (= e!358262 e!358263)))

(declare-fun lt!289692 () SeekEntryResult!6564)

(declare-fun d!88775 () Bool)

(assert (=> d!88775 (and (or ((_ is Undefined!6564) lt!289692) (not ((_ is Found!6564) lt!289692)) (and (bvsge (index!28541 lt!289692) #b00000000000000000000000000000000) (bvslt (index!28541 lt!289692) (size!18488 a!2986)))) (or ((_ is Undefined!6564) lt!289692) ((_ is Found!6564) lt!289692) (not ((_ is MissingVacant!6564) lt!289692)) (not (= (index!28543 lt!289692) vacantSpotIndex!68)) (and (bvsge (index!28543 lt!289692) #b00000000000000000000000000000000) (bvslt (index!28543 lt!289692) (size!18488 a!2986)))) (or ((_ is Undefined!6564) lt!289692) (ite ((_ is Found!6564) lt!289692) (= (select (arr!18124 a!2986) (index!28541 lt!289692)) (select (arr!18124 a!2986) j!136)) (and ((_ is MissingVacant!6564) lt!289692) (= (index!28543 lt!289692) vacantSpotIndex!68) (= (select (arr!18124 a!2986) (index!28543 lt!289692)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!358261 () SeekEntryResult!6564)

(assert (=> d!88775 (= lt!289692 e!358261)))

(declare-fun c!71339 () Bool)

(assert (=> d!88775 (= c!71339 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88775 (= lt!289693 (select (arr!18124 a!2986) index!984))))

(assert (=> d!88775 (validMask!0 mask!3053)))

(assert (=> d!88775 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18124 a!2986) j!136) a!2986 mask!3053) lt!289692)))

(declare-fun b!624844 () Bool)

(assert (=> b!624844 (= e!358262 (Found!6564 index!984))))

(declare-fun b!624845 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!624845 (= e!358263 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18124 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624846 () Bool)

(assert (=> b!624846 (= e!358261 Undefined!6564)))

(declare-fun b!624847 () Bool)

(assert (=> b!624847 (= e!358263 (MissingVacant!6564 vacantSpotIndex!68))))

(declare-fun b!624848 () Bool)

(assert (=> b!624848 (= e!358261 e!358262)))

(declare-fun c!71337 () Bool)

(assert (=> b!624848 (= c!71337 (= lt!289693 (select (arr!18124 a!2986) j!136)))))

(assert (= (and d!88775 c!71339) b!624846))

(assert (= (and d!88775 (not c!71339)) b!624848))

(assert (= (and b!624848 c!71337) b!624844))

(assert (= (and b!624848 (not c!71337)) b!624843))

(assert (= (and b!624843 c!71338) b!624847))

(assert (= (and b!624843 (not c!71338)) b!624845))

(declare-fun m!600483 () Bool)

(assert (=> d!88775 m!600483))

(declare-fun m!600485 () Bool)

(assert (=> d!88775 m!600485))

(declare-fun m!600489 () Bool)

(assert (=> d!88775 m!600489))

(assert (=> d!88775 m!600379))

(declare-fun m!600491 () Bool)

(assert (=> b!624845 m!600491))

(assert (=> b!624845 m!600491))

(assert (=> b!624845 m!600361))

(declare-fun m!600493 () Bool)

(assert (=> b!624845 m!600493))

(assert (=> b!624685 d!88775))

(declare-fun d!88787 () Bool)

(assert (=> d!88787 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!624679 d!88787))

(declare-fun b!624865 () Bool)

(declare-fun e!358278 () Bool)

(declare-fun contains!3075 (List!12165 (_ BitVec 64)) Bool)

(assert (=> b!624865 (= e!358278 (contains!3075 Nil!12162 (select (arr!18124 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88793 () Bool)

(declare-fun res!402916 () Bool)

(declare-fun e!358281 () Bool)

(assert (=> d!88793 (=> res!402916 e!358281)))

(assert (=> d!88793 (= res!402916 (bvsge #b00000000000000000000000000000000 (size!18488 a!2986)))))

(assert (=> d!88793 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12162) e!358281)))

(declare-fun b!624866 () Bool)

(declare-fun e!358279 () Bool)

(assert (=> b!624866 (= e!358281 e!358279)))

(declare-fun res!402915 () Bool)

(assert (=> b!624866 (=> (not res!402915) (not e!358279))))

(assert (=> b!624866 (= res!402915 (not e!358278))))

(declare-fun res!402917 () Bool)

(assert (=> b!624866 (=> (not res!402917) (not e!358278))))

(assert (=> b!624866 (= res!402917 (validKeyInArray!0 (select (arr!18124 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!624867 () Bool)

(declare-fun e!358280 () Bool)

(declare-fun call!33215 () Bool)

(assert (=> b!624867 (= e!358280 call!33215)))

(declare-fun bm!33212 () Bool)

(declare-fun c!71342 () Bool)

(assert (=> bm!33212 (= call!33215 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71342 (Cons!12161 (select (arr!18124 a!2986) #b00000000000000000000000000000000) Nil!12162) Nil!12162)))))

(declare-fun b!624868 () Bool)

(assert (=> b!624868 (= e!358280 call!33215)))

(declare-fun b!624869 () Bool)

(assert (=> b!624869 (= e!358279 e!358280)))

(assert (=> b!624869 (= c!71342 (validKeyInArray!0 (select (arr!18124 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88793 (not res!402916)) b!624866))

(assert (= (and b!624866 res!402917) b!624865))

(assert (= (and b!624866 res!402915) b!624869))

(assert (= (and b!624869 c!71342) b!624867))

(assert (= (and b!624869 (not c!71342)) b!624868))

(assert (= (or b!624867 b!624868) bm!33212))

(assert (=> b!624865 m!600443))

(assert (=> b!624865 m!600443))

(declare-fun m!600497 () Bool)

(assert (=> b!624865 m!600497))

(assert (=> b!624866 m!600443))

(assert (=> b!624866 m!600443))

(assert (=> b!624866 m!600451))

(assert (=> bm!33212 m!600443))

(declare-fun m!600499 () Bool)

(assert (=> bm!33212 m!600499))

(assert (=> b!624869 m!600443))

(assert (=> b!624869 m!600443))

(assert (=> b!624869 m!600451))

(assert (=> b!624684 d!88793))

(declare-fun d!88797 () Bool)

(assert (=> d!88797 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56334 d!88797))

(declare-fun d!88803 () Bool)

(assert (=> d!88803 (= (array_inv!13920 a!2986) (bvsge (size!18488 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56334 d!88803))

(declare-fun d!88805 () Bool)

(assert (=> d!88805 (= (validKeyInArray!0 (select (arr!18124 a!2986) j!136)) (and (not (= (select (arr!18124 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18124 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!624677 d!88805))

(check-sat (not b!624780) (not b!624755) (not d!88775) (not bm!33208) (not b!624869) (not b!624845) (not b!624806) (not b!624865) (not b!624866) (not bm!33212) (not d!88757) (not b!624781))
(check-sat)
