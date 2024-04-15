; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55524 () Bool)

(assert start!55524)

(declare-fun b!606782 () Bool)

(declare-fun e!347460 () Bool)

(declare-fun e!347452 () Bool)

(assert (=> b!606782 (= e!347460 e!347452)))

(declare-fun res!389811 () Bool)

(assert (=> b!606782 (=> (not res!389811) (not e!347452))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37269 0))(
  ( (array!37270 (arr!17885 (Array (_ BitVec 32) (_ BitVec 64))) (size!18250 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37269)

(assert (=> b!606782 (= res!389811 (= (select (store (arr!17885 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!276856 () array!37269)

(assert (=> b!606782 (= lt!276856 (array!37270 (store (arr!17885 a!2986) i!1108 k0!1786) (size!18250 a!2986)))))

(declare-fun b!606783 () Bool)

(declare-fun e!347455 () Bool)

(declare-fun e!347461 () Bool)

(assert (=> b!606783 (= e!347455 e!347461)))

(declare-fun res!389808 () Bool)

(assert (=> b!606783 (=> res!389808 e!347461)))

(assert (=> b!606783 (= res!389808 (or (bvsge (size!18250 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18250 a!2986))))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!606783 (arrayContainsKey!0 lt!276856 (select (arr!17885 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!19314 0))(
  ( (Unit!19315) )
))
(declare-fun lt!276862 () Unit!19314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37269 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19314)

(assert (=> b!606783 (= lt!276862 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276856 (select (arr!17885 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!347457 () Bool)

(assert (=> b!606783 e!347457))

(declare-fun res!389809 () Bool)

(assert (=> b!606783 (=> (not res!389809) (not e!347457))))

(assert (=> b!606783 (= res!389809 (arrayContainsKey!0 lt!276856 (select (arr!17885 a!2986) j!136) j!136))))

(declare-fun b!606784 () Bool)

(declare-fun e!347450 () Bool)

(assert (=> b!606784 (= e!347450 e!347455)))

(declare-fun res!389807 () Bool)

(assert (=> b!606784 (=> res!389807 e!347455)))

(assert (=> b!606784 (= res!389807 (bvsge index!984 j!136))))

(declare-fun lt!276846 () Unit!19314)

(declare-fun e!347463 () Unit!19314)

(assert (=> b!606784 (= lt!276846 e!347463)))

(declare-fun c!68858 () Bool)

(assert (=> b!606784 (= c!68858 (bvslt j!136 index!984))))

(declare-fun b!606786 () Bool)

(declare-fun e!347451 () Bool)

(assert (=> b!606786 (= e!347451 e!347450)))

(declare-fun res!389805 () Bool)

(assert (=> b!606786 (=> res!389805 e!347450)))

(declare-fun lt!276853 () (_ BitVec 64))

(declare-fun lt!276860 () (_ BitVec 64))

(assert (=> b!606786 (= res!389805 (or (not (= (select (arr!17885 a!2986) j!136) lt!276853)) (not (= (select (arr!17885 a!2986) j!136) lt!276860))))))

(declare-fun e!347462 () Bool)

(assert (=> b!606786 e!347462))

(declare-fun res!389814 () Bool)

(assert (=> b!606786 (=> (not res!389814) (not e!347462))))

(assert (=> b!606786 (= res!389814 (= lt!276860 (select (arr!17885 a!2986) j!136)))))

(assert (=> b!606786 (= lt!276860 (select (store (arr!17885 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!606787 () Bool)

(declare-fun Unit!19316 () Unit!19314)

(assert (=> b!606787 (= e!347463 Unit!19316)))

(declare-fun b!606788 () Bool)

(declare-fun res!389802 () Bool)

(assert (=> b!606788 (=> (not res!389802) (not e!347460))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37269 (_ BitVec 32)) Bool)

(assert (=> b!606788 (= res!389802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!606789 () Bool)

(declare-fun e!347448 () Bool)

(declare-fun e!347459 () Bool)

(assert (=> b!606789 (= e!347448 e!347459)))

(declare-fun res!389800 () Bool)

(assert (=> b!606789 (=> (not res!389800) (not e!347459))))

(assert (=> b!606789 (= res!389800 (arrayContainsKey!0 lt!276856 (select (arr!17885 a!2986) j!136) j!136))))

(declare-fun b!606790 () Bool)

(declare-fun res!389804 () Bool)

(assert (=> b!606790 (=> res!389804 e!347461)))

(declare-datatypes ((List!11965 0))(
  ( (Nil!11962) (Cons!11961 (h!13006 (_ BitVec 64)) (t!18184 List!11965)) )
))
(declare-fun contains!2987 (List!11965 (_ BitVec 64)) Bool)

(assert (=> b!606790 (= res!389804 (contains!2987 Nil!11962 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!606791 () Bool)

(assert (=> b!606791 (= e!347461 true)))

(declare-fun lt!276855 () Bool)

(assert (=> b!606791 (= lt!276855 (contains!2987 Nil!11962 k0!1786))))

(declare-fun b!606792 () Bool)

(declare-fun e!347453 () Bool)

(declare-datatypes ((SeekEntryResult!6322 0))(
  ( (MissingZero!6322 (index!27563 (_ BitVec 32))) (Found!6322 (index!27564 (_ BitVec 32))) (Intermediate!6322 (undefined!7134 Bool) (index!27565 (_ BitVec 32)) (x!56386 (_ BitVec 32))) (Undefined!6322) (MissingVacant!6322 (index!27566 (_ BitVec 32))) )
))
(declare-fun lt!276847 () SeekEntryResult!6322)

(declare-fun lt!276851 () SeekEntryResult!6322)

(assert (=> b!606792 (= e!347453 (= lt!276847 lt!276851))))

(declare-fun b!606793 () Bool)

(assert (=> b!606793 (= e!347462 e!347448)))

(declare-fun res!389821 () Bool)

(assert (=> b!606793 (=> res!389821 e!347448)))

(assert (=> b!606793 (= res!389821 (or (not (= (select (arr!17885 a!2986) j!136) lt!276853)) (not (= (select (arr!17885 a!2986) j!136) lt!276860)) (bvsge j!136 index!984)))))

(declare-fun b!606794 () Bool)

(declare-fun res!389817 () Bool)

(declare-fun e!347458 () Bool)

(assert (=> b!606794 (=> (not res!389817) (not e!347458))))

(assert (=> b!606794 (= res!389817 (and (= (size!18250 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18250 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18250 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!606795 () Bool)

(declare-fun res!389822 () Bool)

(assert (=> b!606795 (=> (not res!389822) (not e!347460))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!606795 (= res!389822 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17885 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606796 () Bool)

(declare-fun res!389810 () Bool)

(assert (=> b!606796 (=> (not res!389810) (not e!347458))))

(assert (=> b!606796 (= res!389810 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!606797 () Bool)

(declare-fun res!389818 () Bool)

(assert (=> b!606797 (=> (not res!389818) (not e!347458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!606797 (= res!389818 (validKeyInArray!0 (select (arr!17885 a!2986) j!136)))))

(declare-fun b!606798 () Bool)

(declare-fun res!389820 () Bool)

(assert (=> b!606798 (=> res!389820 e!347461)))

(declare-fun noDuplicate!314 (List!11965) Bool)

(assert (=> b!606798 (= res!389820 (not (noDuplicate!314 Nil!11962)))))

(declare-fun b!606799 () Bool)

(declare-fun res!389819 () Bool)

(assert (=> b!606799 (=> (not res!389819) (not e!347458))))

(assert (=> b!606799 (= res!389819 (validKeyInArray!0 k0!1786))))

(declare-fun b!606800 () Bool)

(declare-fun e!347454 () Unit!19314)

(declare-fun Unit!19317 () Unit!19314)

(assert (=> b!606800 (= e!347454 Unit!19317)))

(assert (=> b!606800 false))

(declare-fun b!606801 () Bool)

(declare-fun res!389812 () Bool)

(assert (=> b!606801 (=> (not res!389812) (not e!347460))))

(declare-fun arrayNoDuplicates!0 (array!37269 (_ BitVec 32) List!11965) Bool)

(assert (=> b!606801 (= res!389812 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11962))))

(declare-fun b!606802 () Bool)

(assert (=> b!606802 (= e!347459 (arrayContainsKey!0 lt!276856 (select (arr!17885 a!2986) j!136) index!984))))

(declare-fun b!606785 () Bool)

(declare-fun e!347456 () Bool)

(assert (=> b!606785 (= e!347456 (not e!347451))))

(declare-fun res!389801 () Bool)

(assert (=> b!606785 (=> res!389801 e!347451)))

(declare-fun lt!276858 () SeekEntryResult!6322)

(assert (=> b!606785 (= res!389801 (not (= lt!276858 (Found!6322 index!984))))))

(declare-fun lt!276848 () Unit!19314)

(assert (=> b!606785 (= lt!276848 e!347454)))

(declare-fun c!68859 () Bool)

(assert (=> b!606785 (= c!68859 (= lt!276858 Undefined!6322))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37269 (_ BitVec 32)) SeekEntryResult!6322)

(assert (=> b!606785 (= lt!276858 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276853 lt!276856 mask!3053))))

(assert (=> b!606785 e!347453))

(declare-fun res!389813 () Bool)

(assert (=> b!606785 (=> (not res!389813) (not e!347453))))

(declare-fun lt!276859 () (_ BitVec 32))

(assert (=> b!606785 (= res!389813 (= lt!276851 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276859 vacantSpotIndex!68 lt!276853 lt!276856 mask!3053)))))

(assert (=> b!606785 (= lt!276851 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276859 vacantSpotIndex!68 (select (arr!17885 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!606785 (= lt!276853 (select (store (arr!17885 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!276850 () Unit!19314)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37269 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19314)

(assert (=> b!606785 (= lt!276850 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276859 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!606785 (= lt!276859 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!389815 () Bool)

(assert (=> start!55524 (=> (not res!389815) (not e!347458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55524 (= res!389815 (validMask!0 mask!3053))))

(assert (=> start!55524 e!347458))

(assert (=> start!55524 true))

(declare-fun array_inv!13768 (array!37269) Bool)

(assert (=> start!55524 (array_inv!13768 a!2986)))

(declare-fun b!606803 () Bool)

(declare-fun res!389803 () Bool)

(assert (=> b!606803 (=> res!389803 e!347461)))

(assert (=> b!606803 (= res!389803 (contains!2987 Nil!11962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!606804 () Bool)

(assert (=> b!606804 (= e!347457 (arrayContainsKey!0 lt!276856 (select (arr!17885 a!2986) j!136) index!984))))

(declare-fun b!606805 () Bool)

(declare-fun Unit!19318 () Unit!19314)

(assert (=> b!606805 (= e!347454 Unit!19318)))

(declare-fun b!606806 () Bool)

(assert (=> b!606806 (= e!347458 e!347460)))

(declare-fun res!389806 () Bool)

(assert (=> b!606806 (=> (not res!389806) (not e!347460))))

(declare-fun lt!276861 () SeekEntryResult!6322)

(assert (=> b!606806 (= res!389806 (or (= lt!276861 (MissingZero!6322 i!1108)) (= lt!276861 (MissingVacant!6322 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37269 (_ BitVec 32)) SeekEntryResult!6322)

(assert (=> b!606806 (= lt!276861 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!606807 () Bool)

(declare-fun Unit!19319 () Unit!19314)

(assert (=> b!606807 (= e!347463 Unit!19319)))

(declare-fun lt!276854 () Unit!19314)

(assert (=> b!606807 (= lt!276854 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276856 (select (arr!17885 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!606807 (arrayContainsKey!0 lt!276856 (select (arr!17885 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276857 () Unit!19314)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37269 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11965) Unit!19314)

(assert (=> b!606807 (= lt!276857 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11962))))

(assert (=> b!606807 (arrayNoDuplicates!0 lt!276856 #b00000000000000000000000000000000 Nil!11962)))

(declare-fun lt!276852 () Unit!19314)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37269 (_ BitVec 32) (_ BitVec 32)) Unit!19314)

(assert (=> b!606807 (= lt!276852 (lemmaNoDuplicateFromThenFromBigger!0 lt!276856 #b00000000000000000000000000000000 j!136))))

(assert (=> b!606807 (arrayNoDuplicates!0 lt!276856 j!136 Nil!11962)))

(declare-fun lt!276849 () Unit!19314)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37269 (_ BitVec 64) (_ BitVec 32) List!11965) Unit!19314)

(assert (=> b!606807 (= lt!276849 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276856 (select (arr!17885 a!2986) j!136) j!136 Nil!11962))))

(assert (=> b!606807 false))

(declare-fun b!606808 () Bool)

(assert (=> b!606808 (= e!347452 e!347456)))

(declare-fun res!389816 () Bool)

(assert (=> b!606808 (=> (not res!389816) (not e!347456))))

(assert (=> b!606808 (= res!389816 (and (= lt!276847 (Found!6322 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17885 a!2986) index!984) (select (arr!17885 a!2986) j!136))) (not (= (select (arr!17885 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!606808 (= lt!276847 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17885 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!55524 res!389815) b!606794))

(assert (= (and b!606794 res!389817) b!606797))

(assert (= (and b!606797 res!389818) b!606799))

(assert (= (and b!606799 res!389819) b!606796))

(assert (= (and b!606796 res!389810) b!606806))

(assert (= (and b!606806 res!389806) b!606788))

(assert (= (and b!606788 res!389802) b!606801))

(assert (= (and b!606801 res!389812) b!606795))

(assert (= (and b!606795 res!389822) b!606782))

(assert (= (and b!606782 res!389811) b!606808))

(assert (= (and b!606808 res!389816) b!606785))

(assert (= (and b!606785 res!389813) b!606792))

(assert (= (and b!606785 c!68859) b!606800))

(assert (= (and b!606785 (not c!68859)) b!606805))

(assert (= (and b!606785 (not res!389801)) b!606786))

(assert (= (and b!606786 res!389814) b!606793))

(assert (= (and b!606793 (not res!389821)) b!606789))

(assert (= (and b!606789 res!389800) b!606802))

(assert (= (and b!606786 (not res!389805)) b!606784))

(assert (= (and b!606784 c!68858) b!606807))

(assert (= (and b!606784 (not c!68858)) b!606787))

(assert (= (and b!606784 (not res!389807)) b!606783))

(assert (= (and b!606783 res!389809) b!606804))

(assert (= (and b!606783 (not res!389808)) b!606798))

(assert (= (and b!606798 (not res!389820)) b!606803))

(assert (= (and b!606803 (not res!389803)) b!606790))

(assert (= (and b!606790 (not res!389804)) b!606791))

(declare-fun m!583063 () Bool)

(assert (=> b!606807 m!583063))

(declare-fun m!583065 () Bool)

(assert (=> b!606807 m!583065))

(declare-fun m!583067 () Bool)

(assert (=> b!606807 m!583067))

(declare-fun m!583069 () Bool)

(assert (=> b!606807 m!583069))

(declare-fun m!583071 () Bool)

(assert (=> b!606807 m!583071))

(assert (=> b!606807 m!583065))

(declare-fun m!583073 () Bool)

(assert (=> b!606807 m!583073))

(declare-fun m!583075 () Bool)

(assert (=> b!606807 m!583075))

(assert (=> b!606807 m!583065))

(assert (=> b!606807 m!583065))

(declare-fun m!583077 () Bool)

(assert (=> b!606807 m!583077))

(declare-fun m!583079 () Bool)

(assert (=> b!606790 m!583079))

(declare-fun m!583081 () Bool)

(assert (=> start!55524 m!583081))

(declare-fun m!583083 () Bool)

(assert (=> start!55524 m!583083))

(assert (=> b!606802 m!583065))

(assert (=> b!606802 m!583065))

(declare-fun m!583085 () Bool)

(assert (=> b!606802 m!583085))

(assert (=> b!606804 m!583065))

(assert (=> b!606804 m!583065))

(assert (=> b!606804 m!583085))

(declare-fun m!583087 () Bool)

(assert (=> b!606795 m!583087))

(declare-fun m!583089 () Bool)

(assert (=> b!606782 m!583089))

(declare-fun m!583091 () Bool)

(assert (=> b!606782 m!583091))

(assert (=> b!606786 m!583065))

(assert (=> b!606786 m!583089))

(declare-fun m!583093 () Bool)

(assert (=> b!606786 m!583093))

(declare-fun m!583095 () Bool)

(assert (=> b!606808 m!583095))

(assert (=> b!606808 m!583065))

(assert (=> b!606808 m!583065))

(declare-fun m!583097 () Bool)

(assert (=> b!606808 m!583097))

(declare-fun m!583099 () Bool)

(assert (=> b!606806 m!583099))

(declare-fun m!583101 () Bool)

(assert (=> b!606785 m!583101))

(declare-fun m!583103 () Bool)

(assert (=> b!606785 m!583103))

(assert (=> b!606785 m!583065))

(assert (=> b!606785 m!583065))

(declare-fun m!583105 () Bool)

(assert (=> b!606785 m!583105))

(declare-fun m!583107 () Bool)

(assert (=> b!606785 m!583107))

(declare-fun m!583109 () Bool)

(assert (=> b!606785 m!583109))

(assert (=> b!606785 m!583089))

(declare-fun m!583111 () Bool)

(assert (=> b!606785 m!583111))

(declare-fun m!583113 () Bool)

(assert (=> b!606791 m!583113))

(assert (=> b!606783 m!583065))

(assert (=> b!606783 m!583065))

(declare-fun m!583115 () Bool)

(assert (=> b!606783 m!583115))

(assert (=> b!606783 m!583065))

(declare-fun m!583117 () Bool)

(assert (=> b!606783 m!583117))

(assert (=> b!606783 m!583065))

(declare-fun m!583119 () Bool)

(assert (=> b!606783 m!583119))

(assert (=> b!606797 m!583065))

(assert (=> b!606797 m!583065))

(declare-fun m!583121 () Bool)

(assert (=> b!606797 m!583121))

(declare-fun m!583123 () Bool)

(assert (=> b!606801 m!583123))

(assert (=> b!606789 m!583065))

(assert (=> b!606789 m!583065))

(assert (=> b!606789 m!583119))

(declare-fun m!583125 () Bool)

(assert (=> b!606803 m!583125))

(assert (=> b!606793 m!583065))

(declare-fun m!583127 () Bool)

(assert (=> b!606788 m!583127))

(declare-fun m!583129 () Bool)

(assert (=> b!606798 m!583129))

(declare-fun m!583131 () Bool)

(assert (=> b!606799 m!583131))

(declare-fun m!583133 () Bool)

(assert (=> b!606796 m!583133))

(check-sat (not b!606788) (not b!606790) (not b!606783) (not b!606801) (not b!606807) (not b!606797) (not b!606799) (not b!606802) (not b!606796) (not b!606789) (not b!606804) (not b!606791) (not b!606803) (not b!606798) (not b!606808) (not b!606785) (not b!606806) (not start!55524))
(check-sat)
