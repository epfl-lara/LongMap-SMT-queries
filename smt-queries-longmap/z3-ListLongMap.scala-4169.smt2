; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56742 () Bool)

(assert start!56742)

(declare-fun b!628673 () Bool)

(declare-fun res!406378 () Bool)

(declare-fun e!359574 () Bool)

(assert (=> b!628673 (=> (not res!406378) (not e!359574))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37995 0))(
  ( (array!37996 (arr!18236 (Array (_ BitVec 32) (_ BitVec 64))) (size!18601 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37995)

(assert (=> b!628673 (= res!406378 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18236 a!2986) index!984) (select (arr!18236 a!2986) j!136))) (not (= (select (arr!18236 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628674 () Bool)

(declare-fun e!359573 () Bool)

(declare-fun e!359575 () Bool)

(assert (=> b!628674 (= e!359573 e!359575)))

(declare-fun res!406377 () Bool)

(assert (=> b!628674 (=> (not res!406377) (not e!359575))))

(declare-datatypes ((SeekEntryResult!6673 0))(
  ( (MissingZero!6673 (index!28976 (_ BitVec 32))) (Found!6673 (index!28977 (_ BitVec 32))) (Intermediate!6673 (undefined!7485 Bool) (index!28978 (_ BitVec 32)) (x!57718 (_ BitVec 32))) (Undefined!6673) (MissingVacant!6673 (index!28979 (_ BitVec 32))) )
))
(declare-fun lt!290364 () SeekEntryResult!6673)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628674 (= res!406377 (or (= lt!290364 (MissingZero!6673 i!1108)) (= lt!290364 (MissingVacant!6673 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37995 (_ BitVec 32)) SeekEntryResult!6673)

(assert (=> b!628674 (= lt!290364 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!406376 () Bool)

(assert (=> start!56742 (=> (not res!406376) (not e!359573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56742 (= res!406376 (validMask!0 mask!3053))))

(assert (=> start!56742 e!359573))

(assert (=> start!56742 true))

(declare-fun array_inv!14119 (array!37995) Bool)

(assert (=> start!56742 (array_inv!14119 a!2986)))

(declare-fun b!628675 () Bool)

(declare-fun res!406372 () Bool)

(assert (=> b!628675 (=> (not res!406372) (not e!359575))))

(declare-datatypes ((List!12316 0))(
  ( (Nil!12313) (Cons!12312 (h!13357 (_ BitVec 64)) (t!18535 List!12316)) )
))
(declare-fun arrayNoDuplicates!0 (array!37995 (_ BitVec 32) List!12316) Bool)

(assert (=> b!628675 (= res!406372 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12313))))

(declare-fun b!628676 () Bool)

(declare-fun res!406382 () Bool)

(assert (=> b!628676 (=> (not res!406382) (not e!359575))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!628676 (= res!406382 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18236 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18236 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628677 () Bool)

(declare-fun res!406374 () Bool)

(assert (=> b!628677 (=> (not res!406374) (not e!359573))))

(declare-fun arrayContainsKey!0 (array!37995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628677 (= res!406374 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628678 () Bool)

(declare-fun res!406373 () Bool)

(assert (=> b!628678 (=> (not res!406373) (not e!359575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37995 (_ BitVec 32)) Bool)

(assert (=> b!628678 (= res!406373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628679 () Bool)

(declare-fun res!406380 () Bool)

(assert (=> b!628679 (=> (not res!406380) (not e!359573))))

(assert (=> b!628679 (= res!406380 (and (= (size!18601 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18601 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18601 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!290365 () (_ BitVec 32))

(declare-fun b!628680 () Bool)

(declare-fun lt!290363 () SeekEntryResult!6673)

(declare-fun e!359577 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37995 (_ BitVec 32)) SeekEntryResult!6673)

(assert (=> b!628680 (= e!359577 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290365 vacantSpotIndex!68 (select (arr!18236 a!2986) j!136) a!2986 mask!3053) lt!290363)))))

(declare-fun b!628681 () Bool)

(assert (=> b!628681 (= e!359575 e!359574)))

(declare-fun res!406379 () Bool)

(assert (=> b!628681 (=> (not res!406379) (not e!359574))))

(assert (=> b!628681 (= res!406379 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18236 a!2986) j!136) a!2986 mask!3053) lt!290363))))

(assert (=> b!628681 (= lt!290363 (Found!6673 j!136))))

(declare-fun b!628682 () Bool)

(assert (=> b!628682 (= e!359574 e!359577)))

(declare-fun res!406381 () Bool)

(assert (=> b!628682 (=> (not res!406381) (not e!359577))))

(assert (=> b!628682 (= res!406381 (and (bvsge lt!290365 #b00000000000000000000000000000000) (bvslt lt!290365 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628682 (= lt!290365 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628683 () Bool)

(declare-fun res!406371 () Bool)

(assert (=> b!628683 (=> (not res!406371) (not e!359573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628683 (= res!406371 (validKeyInArray!0 (select (arr!18236 a!2986) j!136)))))

(declare-fun b!628684 () Bool)

(declare-fun res!406375 () Bool)

(assert (=> b!628684 (=> (not res!406375) (not e!359573))))

(assert (=> b!628684 (= res!406375 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56742 res!406376) b!628679))

(assert (= (and b!628679 res!406380) b!628683))

(assert (= (and b!628683 res!406371) b!628684))

(assert (= (and b!628684 res!406375) b!628677))

(assert (= (and b!628677 res!406374) b!628674))

(assert (= (and b!628674 res!406377) b!628678))

(assert (= (and b!628678 res!406373) b!628675))

(assert (= (and b!628675 res!406372) b!628676))

(assert (= (and b!628676 res!406382) b!628681))

(assert (= (and b!628681 res!406379) b!628673))

(assert (= (and b!628673 res!406378) b!628682))

(assert (= (and b!628682 res!406381) b!628680))

(declare-fun m!603283 () Bool)

(assert (=> b!628676 m!603283))

(declare-fun m!603285 () Bool)

(assert (=> b!628676 m!603285))

(declare-fun m!603287 () Bool)

(assert (=> b!628676 m!603287))

(declare-fun m!603289 () Bool)

(assert (=> b!628673 m!603289))

(declare-fun m!603291 () Bool)

(assert (=> b!628673 m!603291))

(declare-fun m!603293 () Bool)

(assert (=> b!628675 m!603293))

(declare-fun m!603295 () Bool)

(assert (=> b!628684 m!603295))

(assert (=> b!628683 m!603291))

(assert (=> b!628683 m!603291))

(declare-fun m!603297 () Bool)

(assert (=> b!628683 m!603297))

(declare-fun m!603299 () Bool)

(assert (=> b!628677 m!603299))

(assert (=> b!628681 m!603291))

(assert (=> b!628681 m!603291))

(declare-fun m!603301 () Bool)

(assert (=> b!628681 m!603301))

(declare-fun m!603303 () Bool)

(assert (=> b!628682 m!603303))

(declare-fun m!603305 () Bool)

(assert (=> start!56742 m!603305))

(declare-fun m!603307 () Bool)

(assert (=> start!56742 m!603307))

(assert (=> b!628680 m!603291))

(assert (=> b!628680 m!603291))

(declare-fun m!603309 () Bool)

(assert (=> b!628680 m!603309))

(declare-fun m!603311 () Bool)

(assert (=> b!628674 m!603311))

(declare-fun m!603313 () Bool)

(assert (=> b!628678 m!603313))

(check-sat (not start!56742) (not b!628683) (not b!628682) (not b!628680) (not b!628684) (not b!628681) (not b!628674) (not b!628678) (not b!628677) (not b!628675))
(check-sat)
(get-model)

(declare-fun bm!33247 () Bool)

(declare-fun call!33250 () Bool)

(declare-fun c!71520 () Bool)

(assert (=> bm!33247 (= call!33250 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71520 (Cons!12312 (select (arr!18236 a!2986) #b00000000000000000000000000000000) Nil!12313) Nil!12313)))))

(declare-fun b!628767 () Bool)

(declare-fun e!359619 () Bool)

(declare-fun contains!3068 (List!12316 (_ BitVec 64)) Bool)

(assert (=> b!628767 (= e!359619 (contains!3068 Nil!12313 (select (arr!18236 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628768 () Bool)

(declare-fun e!359617 () Bool)

(assert (=> b!628768 (= e!359617 call!33250)))

(declare-fun b!628769 () Bool)

(declare-fun e!359618 () Bool)

(assert (=> b!628769 (= e!359618 e!359617)))

(assert (=> b!628769 (= c!71520 (validKeyInArray!0 (select (arr!18236 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88847 () Bool)

(declare-fun res!406462 () Bool)

(declare-fun e!359616 () Bool)

(assert (=> d!88847 (=> res!406462 e!359616)))

(assert (=> d!88847 (= res!406462 (bvsge #b00000000000000000000000000000000 (size!18601 a!2986)))))

(assert (=> d!88847 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12313) e!359616)))

(declare-fun b!628770 () Bool)

(assert (=> b!628770 (= e!359617 call!33250)))

(declare-fun b!628771 () Bool)

(assert (=> b!628771 (= e!359616 e!359618)))

(declare-fun res!406463 () Bool)

(assert (=> b!628771 (=> (not res!406463) (not e!359618))))

(assert (=> b!628771 (= res!406463 (not e!359619))))

(declare-fun res!406461 () Bool)

(assert (=> b!628771 (=> (not res!406461) (not e!359619))))

(assert (=> b!628771 (= res!406461 (validKeyInArray!0 (select (arr!18236 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88847 (not res!406462)) b!628771))

(assert (= (and b!628771 res!406461) b!628767))

(assert (= (and b!628771 res!406463) b!628769))

(assert (= (and b!628769 c!71520) b!628768))

(assert (= (and b!628769 (not c!71520)) b!628770))

(assert (= (or b!628768 b!628770) bm!33247))

(declare-fun m!603379 () Bool)

(assert (=> bm!33247 m!603379))

(declare-fun m!603381 () Bool)

(assert (=> bm!33247 m!603381))

(assert (=> b!628767 m!603379))

(assert (=> b!628767 m!603379))

(declare-fun m!603383 () Bool)

(assert (=> b!628767 m!603383))

(assert (=> b!628769 m!603379))

(assert (=> b!628769 m!603379))

(declare-fun m!603385 () Bool)

(assert (=> b!628769 m!603385))

(assert (=> b!628771 m!603379))

(assert (=> b!628771 m!603379))

(assert (=> b!628771 m!603385))

(assert (=> b!628675 d!88847))

(declare-fun d!88849 () Bool)

(declare-fun lt!290389 () SeekEntryResult!6673)

(get-info :version)

(assert (=> d!88849 (and (or ((_ is Undefined!6673) lt!290389) (not ((_ is Found!6673) lt!290389)) (and (bvsge (index!28977 lt!290389) #b00000000000000000000000000000000) (bvslt (index!28977 lt!290389) (size!18601 a!2986)))) (or ((_ is Undefined!6673) lt!290389) ((_ is Found!6673) lt!290389) (not ((_ is MissingVacant!6673) lt!290389)) (not (= (index!28979 lt!290389) vacantSpotIndex!68)) (and (bvsge (index!28979 lt!290389) #b00000000000000000000000000000000) (bvslt (index!28979 lt!290389) (size!18601 a!2986)))) (or ((_ is Undefined!6673) lt!290389) (ite ((_ is Found!6673) lt!290389) (= (select (arr!18236 a!2986) (index!28977 lt!290389)) (select (arr!18236 a!2986) j!136)) (and ((_ is MissingVacant!6673) lt!290389) (= (index!28979 lt!290389) vacantSpotIndex!68) (= (select (arr!18236 a!2986) (index!28979 lt!290389)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!359627 () SeekEntryResult!6673)

(assert (=> d!88849 (= lt!290389 e!359627)))

(declare-fun c!71528 () Bool)

(assert (=> d!88849 (= c!71528 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!290388 () (_ BitVec 64))

(assert (=> d!88849 (= lt!290388 (select (arr!18236 a!2986) lt!290365))))

(assert (=> d!88849 (validMask!0 mask!3053)))

(assert (=> d!88849 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290365 vacantSpotIndex!68 (select (arr!18236 a!2986) j!136) a!2986 mask!3053) lt!290389)))

(declare-fun b!628784 () Bool)

(declare-fun e!359628 () SeekEntryResult!6673)

(assert (=> b!628784 (= e!359628 (Found!6673 lt!290365))))

(declare-fun b!628785 () Bool)

(assert (=> b!628785 (= e!359627 e!359628)))

(declare-fun c!71529 () Bool)

(assert (=> b!628785 (= c!71529 (= lt!290388 (select (arr!18236 a!2986) j!136)))))

(declare-fun b!628786 () Bool)

(declare-fun e!359626 () SeekEntryResult!6673)

(assert (=> b!628786 (= e!359626 (MissingVacant!6673 vacantSpotIndex!68))))

(declare-fun b!628787 () Bool)

(declare-fun c!71527 () Bool)

(assert (=> b!628787 (= c!71527 (= lt!290388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!628787 (= e!359628 e!359626)))

(declare-fun b!628788 () Bool)

(assert (=> b!628788 (= e!359626 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290365 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18236 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!628789 () Bool)

(assert (=> b!628789 (= e!359627 Undefined!6673)))

(assert (= (and d!88849 c!71528) b!628789))

(assert (= (and d!88849 (not c!71528)) b!628785))

(assert (= (and b!628785 c!71529) b!628784))

(assert (= (and b!628785 (not c!71529)) b!628787))

(assert (= (and b!628787 c!71527) b!628786))

(assert (= (and b!628787 (not c!71527)) b!628788))

(declare-fun m!603387 () Bool)

(assert (=> d!88849 m!603387))

(declare-fun m!603389 () Bool)

(assert (=> d!88849 m!603389))

(declare-fun m!603391 () Bool)

(assert (=> d!88849 m!603391))

(assert (=> d!88849 m!603305))

(declare-fun m!603393 () Bool)

(assert (=> b!628788 m!603393))

(assert (=> b!628788 m!603393))

(assert (=> b!628788 m!603291))

(declare-fun m!603395 () Bool)

(assert (=> b!628788 m!603395))

(assert (=> b!628680 d!88849))

(declare-fun d!88853 () Bool)

(declare-fun lt!290392 () (_ BitVec 32))

(assert (=> d!88853 (and (bvsge lt!290392 #b00000000000000000000000000000000) (bvslt lt!290392 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88853 (= lt!290392 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88853 (validMask!0 mask!3053)))

(assert (=> d!88853 (= (nextIndex!0 index!984 x!910 mask!3053) lt!290392)))

(declare-fun bs!18943 () Bool)

(assert (= bs!18943 d!88853))

(declare-fun m!603397 () Bool)

(assert (=> bs!18943 m!603397))

(assert (=> bs!18943 m!603305))

(assert (=> b!628682 d!88853))

(declare-fun lt!290394 () SeekEntryResult!6673)

(declare-fun d!88855 () Bool)

(assert (=> d!88855 (and (or ((_ is Undefined!6673) lt!290394) (not ((_ is Found!6673) lt!290394)) (and (bvsge (index!28977 lt!290394) #b00000000000000000000000000000000) (bvslt (index!28977 lt!290394) (size!18601 a!2986)))) (or ((_ is Undefined!6673) lt!290394) ((_ is Found!6673) lt!290394) (not ((_ is MissingVacant!6673) lt!290394)) (not (= (index!28979 lt!290394) vacantSpotIndex!68)) (and (bvsge (index!28979 lt!290394) #b00000000000000000000000000000000) (bvslt (index!28979 lt!290394) (size!18601 a!2986)))) (or ((_ is Undefined!6673) lt!290394) (ite ((_ is Found!6673) lt!290394) (= (select (arr!18236 a!2986) (index!28977 lt!290394)) (select (arr!18236 a!2986) j!136)) (and ((_ is MissingVacant!6673) lt!290394) (= (index!28979 lt!290394) vacantSpotIndex!68) (= (select (arr!18236 a!2986) (index!28979 lt!290394)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!359630 () SeekEntryResult!6673)

(assert (=> d!88855 (= lt!290394 e!359630)))

(declare-fun c!71531 () Bool)

(assert (=> d!88855 (= c!71531 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!290393 () (_ BitVec 64))

(assert (=> d!88855 (= lt!290393 (select (arr!18236 a!2986) index!984))))

(assert (=> d!88855 (validMask!0 mask!3053)))

(assert (=> d!88855 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18236 a!2986) j!136) a!2986 mask!3053) lt!290394)))

(declare-fun b!628790 () Bool)

(declare-fun e!359631 () SeekEntryResult!6673)

(assert (=> b!628790 (= e!359631 (Found!6673 index!984))))

(declare-fun b!628791 () Bool)

(assert (=> b!628791 (= e!359630 e!359631)))

(declare-fun c!71532 () Bool)

(assert (=> b!628791 (= c!71532 (= lt!290393 (select (arr!18236 a!2986) j!136)))))

(declare-fun b!628792 () Bool)

(declare-fun e!359629 () SeekEntryResult!6673)

(assert (=> b!628792 (= e!359629 (MissingVacant!6673 vacantSpotIndex!68))))

(declare-fun b!628793 () Bool)

(declare-fun c!71530 () Bool)

(assert (=> b!628793 (= c!71530 (= lt!290393 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!628793 (= e!359631 e!359629)))

(declare-fun b!628794 () Bool)

(assert (=> b!628794 (= e!359629 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18236 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!628795 () Bool)

(assert (=> b!628795 (= e!359630 Undefined!6673)))

(assert (= (and d!88855 c!71531) b!628795))

(assert (= (and d!88855 (not c!71531)) b!628791))

(assert (= (and b!628791 c!71532) b!628790))

(assert (= (and b!628791 (not c!71532)) b!628793))

(assert (= (and b!628793 c!71530) b!628792))

(assert (= (and b!628793 (not c!71530)) b!628794))

(declare-fun m!603399 () Bool)

(assert (=> d!88855 m!603399))

(declare-fun m!603401 () Bool)

(assert (=> d!88855 m!603401))

(assert (=> d!88855 m!603289))

(assert (=> d!88855 m!603305))

(assert (=> b!628794 m!603303))

(assert (=> b!628794 m!603303))

(assert (=> b!628794 m!603291))

(declare-fun m!603403 () Bool)

(assert (=> b!628794 m!603403))

(assert (=> b!628681 d!88855))

(declare-fun d!88857 () Bool)

(assert (=> d!88857 (= (validKeyInArray!0 (select (arr!18236 a!2986) j!136)) (and (not (= (select (arr!18236 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18236 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628683 d!88857))

(declare-fun b!628816 () Bool)

(declare-fun e!359645 () Bool)

(declare-fun call!33253 () Bool)

(assert (=> b!628816 (= e!359645 call!33253)))

(declare-fun b!628817 () Bool)

(declare-fun e!359646 () Bool)

(assert (=> b!628817 (= e!359646 e!359645)))

(declare-fun c!71541 () Bool)

(assert (=> b!628817 (= c!71541 (validKeyInArray!0 (select (arr!18236 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628818 () Bool)

(declare-fun e!359644 () Bool)

(assert (=> b!628818 (= e!359644 call!33253)))

(declare-fun bm!33250 () Bool)

(assert (=> bm!33250 (= call!33253 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!628819 () Bool)

(assert (=> b!628819 (= e!359645 e!359644)))

(declare-fun lt!290407 () (_ BitVec 64))

(assert (=> b!628819 (= lt!290407 (select (arr!18236 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21084 0))(
  ( (Unit!21085) )
))
(declare-fun lt!290406 () Unit!21084)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37995 (_ BitVec 64) (_ BitVec 32)) Unit!21084)

(assert (=> b!628819 (= lt!290406 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290407 #b00000000000000000000000000000000))))

(assert (=> b!628819 (arrayContainsKey!0 a!2986 lt!290407 #b00000000000000000000000000000000)))

(declare-fun lt!290405 () Unit!21084)

(assert (=> b!628819 (= lt!290405 lt!290406)))

(declare-fun res!406469 () Bool)

(assert (=> b!628819 (= res!406469 (= (seekEntryOrOpen!0 (select (arr!18236 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6673 #b00000000000000000000000000000000)))))

(assert (=> b!628819 (=> (not res!406469) (not e!359644))))

(declare-fun d!88859 () Bool)

(declare-fun res!406468 () Bool)

(assert (=> d!88859 (=> res!406468 e!359646)))

(assert (=> d!88859 (= res!406468 (bvsge #b00000000000000000000000000000000 (size!18601 a!2986)))))

(assert (=> d!88859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!359646)))

(assert (= (and d!88859 (not res!406468)) b!628817))

(assert (= (and b!628817 c!71541) b!628819))

(assert (= (and b!628817 (not c!71541)) b!628816))

(assert (= (and b!628819 res!406469) b!628818))

(assert (= (or b!628818 b!628816) bm!33250))

(assert (=> b!628817 m!603379))

(assert (=> b!628817 m!603379))

(assert (=> b!628817 m!603385))

(declare-fun m!603405 () Bool)

(assert (=> bm!33250 m!603405))

(assert (=> b!628819 m!603379))

(declare-fun m!603407 () Bool)

(assert (=> b!628819 m!603407))

(declare-fun m!603409 () Bool)

(assert (=> b!628819 m!603409))

(assert (=> b!628819 m!603379))

(declare-fun m!603411 () Bool)

(assert (=> b!628819 m!603411))

(assert (=> b!628678 d!88859))

(declare-fun d!88863 () Bool)

(declare-fun res!406474 () Bool)

(declare-fun e!359660 () Bool)

(assert (=> d!88863 (=> res!406474 e!359660)))

(assert (=> d!88863 (= res!406474 (= (select (arr!18236 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88863 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!359660)))

(declare-fun b!628842 () Bool)

(declare-fun e!359661 () Bool)

(assert (=> b!628842 (= e!359660 e!359661)))

(declare-fun res!406475 () Bool)

(assert (=> b!628842 (=> (not res!406475) (not e!359661))))

(assert (=> b!628842 (= res!406475 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18601 a!2986)))))

(declare-fun b!628843 () Bool)

(assert (=> b!628843 (= e!359661 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88863 (not res!406474)) b!628842))

(assert (= (and b!628842 res!406475) b!628843))

(assert (=> d!88863 m!603379))

(declare-fun m!603419 () Bool)

(assert (=> b!628843 m!603419))

(assert (=> b!628677 d!88863))

(declare-fun e!359699 () SeekEntryResult!6673)

(declare-fun lt!290445 () SeekEntryResult!6673)

(declare-fun b!628904 () Bool)

(assert (=> b!628904 (= e!359699 (seekKeyOrZeroReturnVacant!0 (x!57718 lt!290445) (index!28978 lt!290445) (index!28978 lt!290445) k0!1786 a!2986 mask!3053))))

(declare-fun b!628905 () Bool)

(declare-fun e!359698 () SeekEntryResult!6673)

(declare-fun e!359700 () SeekEntryResult!6673)

(assert (=> b!628905 (= e!359698 e!359700)))

(declare-fun lt!290446 () (_ BitVec 64))

(assert (=> b!628905 (= lt!290446 (select (arr!18236 a!2986) (index!28978 lt!290445)))))

(declare-fun c!71575 () Bool)

(assert (=> b!628905 (= c!71575 (= lt!290446 k0!1786))))

(declare-fun b!628906 () Bool)

(assert (=> b!628906 (= e!359699 (MissingZero!6673 (index!28978 lt!290445)))))

(declare-fun d!88867 () Bool)

(declare-fun lt!290447 () SeekEntryResult!6673)

(assert (=> d!88867 (and (or ((_ is Undefined!6673) lt!290447) (not ((_ is Found!6673) lt!290447)) (and (bvsge (index!28977 lt!290447) #b00000000000000000000000000000000) (bvslt (index!28977 lt!290447) (size!18601 a!2986)))) (or ((_ is Undefined!6673) lt!290447) ((_ is Found!6673) lt!290447) (not ((_ is MissingZero!6673) lt!290447)) (and (bvsge (index!28976 lt!290447) #b00000000000000000000000000000000) (bvslt (index!28976 lt!290447) (size!18601 a!2986)))) (or ((_ is Undefined!6673) lt!290447) ((_ is Found!6673) lt!290447) ((_ is MissingZero!6673) lt!290447) (not ((_ is MissingVacant!6673) lt!290447)) (and (bvsge (index!28979 lt!290447) #b00000000000000000000000000000000) (bvslt (index!28979 lt!290447) (size!18601 a!2986)))) (or ((_ is Undefined!6673) lt!290447) (ite ((_ is Found!6673) lt!290447) (= (select (arr!18236 a!2986) (index!28977 lt!290447)) k0!1786) (ite ((_ is MissingZero!6673) lt!290447) (= (select (arr!18236 a!2986) (index!28976 lt!290447)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6673) lt!290447) (= (select (arr!18236 a!2986) (index!28979 lt!290447)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88867 (= lt!290447 e!359698)))

(declare-fun c!71577 () Bool)

(assert (=> d!88867 (= c!71577 (and ((_ is Intermediate!6673) lt!290445) (undefined!7485 lt!290445)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37995 (_ BitVec 32)) SeekEntryResult!6673)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88867 (= lt!290445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88867 (validMask!0 mask!3053)))

(assert (=> d!88867 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!290447)))

(declare-fun b!628907 () Bool)

(assert (=> b!628907 (= e!359698 Undefined!6673)))

(declare-fun b!628908 () Bool)

(assert (=> b!628908 (= e!359700 (Found!6673 (index!28978 lt!290445)))))

(declare-fun b!628909 () Bool)

(declare-fun c!71576 () Bool)

(assert (=> b!628909 (= c!71576 (= lt!290446 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!628909 (= e!359700 e!359699)))

(assert (= (and d!88867 c!71577) b!628907))

(assert (= (and d!88867 (not c!71577)) b!628905))

(assert (= (and b!628905 c!71575) b!628908))

(assert (= (and b!628905 (not c!71575)) b!628909))

(assert (= (and b!628909 c!71576) b!628906))

(assert (= (and b!628909 (not c!71576)) b!628904))

(declare-fun m!603459 () Bool)

(assert (=> b!628904 m!603459))

(declare-fun m!603463 () Bool)

(assert (=> b!628905 m!603463))

(declare-fun m!603467 () Bool)

(assert (=> d!88867 m!603467))

(declare-fun m!603469 () Bool)

(assert (=> d!88867 m!603469))

(declare-fun m!603473 () Bool)

(assert (=> d!88867 m!603473))

(assert (=> d!88867 m!603467))

(declare-fun m!603477 () Bool)

(assert (=> d!88867 m!603477))

(assert (=> d!88867 m!603305))

(declare-fun m!603479 () Bool)

(assert (=> d!88867 m!603479))

(assert (=> b!628674 d!88867))

(declare-fun d!88889 () Bool)

(assert (=> d!88889 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56742 d!88889))

(declare-fun d!88901 () Bool)

(assert (=> d!88901 (= (array_inv!14119 a!2986) (bvsge (size!18601 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56742 d!88901))

(declare-fun d!88905 () Bool)

(assert (=> d!88905 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628684 d!88905))

(check-sat (not b!628794) (not d!88849) (not b!628817) (not b!628767) (not d!88867) (not b!628904) (not d!88855) (not b!628843) (not b!628771) (not d!88853) (not bm!33250) (not b!628788) (not b!628769) (not bm!33247) (not b!628819))
(check-sat)
