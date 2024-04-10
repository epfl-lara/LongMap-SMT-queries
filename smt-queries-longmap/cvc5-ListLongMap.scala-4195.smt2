; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57260 () Bool)

(assert start!57260)

(declare-fun b!633756 () Bool)

(declare-fun e!362382 () Bool)

(declare-fun e!362384 () Bool)

(assert (=> b!633756 (= e!362382 e!362384)))

(declare-fun res!409883 () Bool)

(assert (=> b!633756 (=> (not res!409883) (not e!362384))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38170 0))(
  ( (array!38171 (arr!18315 (Array (_ BitVec 32) (_ BitVec 64))) (size!18679 (_ BitVec 32))) )
))
(declare-fun lt!292943 () array!38170)

(declare-fun a!2986 () array!38170)

(declare-fun arrayContainsKey!0 (array!38170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633756 (= res!409883 (arrayContainsKey!0 lt!292943 (select (arr!18315 a!2986) j!136) j!136))))

(declare-fun b!633757 () Bool)

(declare-fun res!409882 () Bool)

(declare-fun e!362376 () Bool)

(assert (=> b!633757 (=> (not res!409882) (not e!362376))))

(declare-datatypes ((List!12356 0))(
  ( (Nil!12353) (Cons!12352 (h!13397 (_ BitVec 64)) (t!18584 List!12356)) )
))
(declare-fun arrayNoDuplicates!0 (array!38170 (_ BitVec 32) List!12356) Bool)

(assert (=> b!633757 (= res!409882 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12353))))

(declare-fun b!633758 () Bool)

(declare-fun e!362385 () Bool)

(declare-datatypes ((SeekEntryResult!6755 0))(
  ( (MissingZero!6755 (index!29319 (_ BitVec 32))) (Found!6755 (index!29320 (_ BitVec 32))) (Intermediate!6755 (undefined!7567 Bool) (index!29321 (_ BitVec 32)) (x!58064 (_ BitVec 32))) (Undefined!6755) (MissingVacant!6755 (index!29322 (_ BitVec 32))) )
))
(declare-fun lt!292948 () SeekEntryResult!6755)

(declare-fun lt!292947 () SeekEntryResult!6755)

(assert (=> b!633758 (= e!362385 (= lt!292948 lt!292947))))

(declare-fun b!633759 () Bool)

(declare-datatypes ((Unit!21354 0))(
  ( (Unit!21355) )
))
(declare-fun e!362375 () Unit!21354)

(declare-fun Unit!21356 () Unit!21354)

(assert (=> b!633759 (= e!362375 Unit!21356)))

(assert (=> b!633759 false))

(declare-fun b!633760 () Bool)

(declare-fun res!409876 () Bool)

(assert (=> b!633760 (=> (not res!409876) (not e!362376))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38170 (_ BitVec 32)) Bool)

(assert (=> b!633760 (= res!409876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633761 () Bool)

(declare-fun e!362380 () Bool)

(assert (=> b!633761 (= e!362376 e!362380)))

(declare-fun res!409887 () Bool)

(assert (=> b!633761 (=> (not res!409887) (not e!362380))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!633761 (= res!409887 (= (select (store (arr!18315 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633761 (= lt!292943 (array!38171 (store (arr!18315 a!2986) i!1108 k!1786) (size!18679 a!2986)))))

(declare-fun res!409880 () Bool)

(declare-fun e!362379 () Bool)

(assert (=> start!57260 (=> (not res!409880) (not e!362379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57260 (= res!409880 (validMask!0 mask!3053))))

(assert (=> start!57260 e!362379))

(assert (=> start!57260 true))

(declare-fun array_inv!14111 (array!38170) Bool)

(assert (=> start!57260 (array_inv!14111 a!2986)))

(declare-fun b!633762 () Bool)

(declare-fun Unit!21357 () Unit!21354)

(assert (=> b!633762 (= e!362375 Unit!21357)))

(declare-fun b!633763 () Bool)

(declare-fun e!362378 () Bool)

(assert (=> b!633763 (= e!362378 e!362382)))

(declare-fun res!409875 () Bool)

(assert (=> b!633763 (=> res!409875 e!362382)))

(declare-fun lt!292949 () (_ BitVec 64))

(declare-fun lt!292944 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633763 (= res!409875 (or (not (= (select (arr!18315 a!2986) j!136) lt!292944)) (not (= (select (arr!18315 a!2986) j!136) lt!292949)) (bvsge j!136 index!984)))))

(declare-fun b!633764 () Bool)

(declare-fun res!409889 () Bool)

(assert (=> b!633764 (=> (not res!409889) (not e!362379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633764 (= res!409889 (validKeyInArray!0 (select (arr!18315 a!2986) j!136)))))

(declare-fun b!633765 () Bool)

(declare-fun res!409886 () Bool)

(assert (=> b!633765 (=> (not res!409886) (not e!362379))))

(assert (=> b!633765 (= res!409886 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633766 () Bool)

(assert (=> b!633766 (= e!362384 (arrayContainsKey!0 lt!292943 (select (arr!18315 a!2986) j!136) index!984))))

(declare-fun b!633767 () Bool)

(assert (=> b!633767 (= e!362379 e!362376)))

(declare-fun res!409878 () Bool)

(assert (=> b!633767 (=> (not res!409878) (not e!362376))))

(declare-fun lt!292951 () SeekEntryResult!6755)

(assert (=> b!633767 (= res!409878 (or (= lt!292951 (MissingZero!6755 i!1108)) (= lt!292951 (MissingVacant!6755 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38170 (_ BitVec 32)) SeekEntryResult!6755)

(assert (=> b!633767 (= lt!292951 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!633768 () Bool)

(declare-fun res!409881 () Bool)

(assert (=> b!633768 (=> (not res!409881) (not e!362379))))

(assert (=> b!633768 (= res!409881 (validKeyInArray!0 k!1786))))

(declare-fun b!633769 () Bool)

(declare-fun res!409877 () Bool)

(assert (=> b!633769 (=> (not res!409877) (not e!362379))))

(assert (=> b!633769 (= res!409877 (and (= (size!18679 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18679 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18679 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633770 () Bool)

(declare-fun e!362383 () Bool)

(assert (=> b!633770 (= e!362383 (or (not (= (select (arr!18315 a!2986) j!136) lt!292944)) (not (= (select (arr!18315 a!2986) j!136) lt!292949)) (bvsge j!136 index!984) (bvsge index!984 (size!18679 a!2986)) (bvsge (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000)))))

(assert (=> b!633770 e!362378))

(declare-fun res!409885 () Bool)

(assert (=> b!633770 (=> (not res!409885) (not e!362378))))

(assert (=> b!633770 (= res!409885 (= lt!292949 (select (arr!18315 a!2986) j!136)))))

(assert (=> b!633770 (= lt!292949 (select (store (arr!18315 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!633771 () Bool)

(declare-fun res!409884 () Bool)

(assert (=> b!633771 (=> (not res!409884) (not e!362376))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!633771 (= res!409884 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18315 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633772 () Bool)

(declare-fun e!362381 () Bool)

(assert (=> b!633772 (= e!362380 e!362381)))

(declare-fun res!409874 () Bool)

(assert (=> b!633772 (=> (not res!409874) (not e!362381))))

(assert (=> b!633772 (= res!409874 (and (= lt!292948 (Found!6755 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18315 a!2986) index!984) (select (arr!18315 a!2986) j!136))) (not (= (select (arr!18315 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38170 (_ BitVec 32)) SeekEntryResult!6755)

(assert (=> b!633772 (= lt!292948 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18315 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633773 () Bool)

(assert (=> b!633773 (= e!362381 (not e!362383))))

(declare-fun res!409888 () Bool)

(assert (=> b!633773 (=> res!409888 e!362383)))

(declare-fun lt!292945 () SeekEntryResult!6755)

(assert (=> b!633773 (= res!409888 (not (= lt!292945 (Found!6755 index!984))))))

(declare-fun lt!292942 () Unit!21354)

(assert (=> b!633773 (= lt!292942 e!362375)))

(declare-fun c!72308 () Bool)

(assert (=> b!633773 (= c!72308 (= lt!292945 Undefined!6755))))

(assert (=> b!633773 (= lt!292945 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292944 lt!292943 mask!3053))))

(assert (=> b!633773 e!362385))

(declare-fun res!409879 () Bool)

(assert (=> b!633773 (=> (not res!409879) (not e!362385))))

(declare-fun lt!292950 () (_ BitVec 32))

(assert (=> b!633773 (= res!409879 (= lt!292947 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292950 vacantSpotIndex!68 lt!292944 lt!292943 mask!3053)))))

(assert (=> b!633773 (= lt!292947 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292950 vacantSpotIndex!68 (select (arr!18315 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633773 (= lt!292944 (select (store (arr!18315 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292946 () Unit!21354)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38170 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21354)

(assert (=> b!633773 (= lt!292946 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292950 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633773 (= lt!292950 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!57260 res!409880) b!633769))

(assert (= (and b!633769 res!409877) b!633764))

(assert (= (and b!633764 res!409889) b!633768))

(assert (= (and b!633768 res!409881) b!633765))

(assert (= (and b!633765 res!409886) b!633767))

(assert (= (and b!633767 res!409878) b!633760))

(assert (= (and b!633760 res!409876) b!633757))

(assert (= (and b!633757 res!409882) b!633771))

(assert (= (and b!633771 res!409884) b!633761))

(assert (= (and b!633761 res!409887) b!633772))

(assert (= (and b!633772 res!409874) b!633773))

(assert (= (and b!633773 res!409879) b!633758))

(assert (= (and b!633773 c!72308) b!633759))

(assert (= (and b!633773 (not c!72308)) b!633762))

(assert (= (and b!633773 (not res!409888)) b!633770))

(assert (= (and b!633770 res!409885) b!633763))

(assert (= (and b!633763 (not res!409875)) b!633756))

(assert (= (and b!633756 res!409883) b!633766))

(declare-fun m!608363 () Bool)

(assert (=> b!633772 m!608363))

(declare-fun m!608365 () Bool)

(assert (=> b!633772 m!608365))

(assert (=> b!633772 m!608365))

(declare-fun m!608367 () Bool)

(assert (=> b!633772 m!608367))

(assert (=> b!633766 m!608365))

(assert (=> b!633766 m!608365))

(declare-fun m!608369 () Bool)

(assert (=> b!633766 m!608369))

(declare-fun m!608371 () Bool)

(assert (=> b!633771 m!608371))

(declare-fun m!608373 () Bool)

(assert (=> b!633757 m!608373))

(assert (=> b!633770 m!608365))

(declare-fun m!608375 () Bool)

(assert (=> b!633770 m!608375))

(declare-fun m!608377 () Bool)

(assert (=> b!633770 m!608377))

(assert (=> b!633764 m!608365))

(assert (=> b!633764 m!608365))

(declare-fun m!608379 () Bool)

(assert (=> b!633764 m!608379))

(assert (=> b!633756 m!608365))

(assert (=> b!633756 m!608365))

(declare-fun m!608381 () Bool)

(assert (=> b!633756 m!608381))

(declare-fun m!608383 () Bool)

(assert (=> b!633765 m!608383))

(declare-fun m!608385 () Bool)

(assert (=> start!57260 m!608385))

(declare-fun m!608387 () Bool)

(assert (=> start!57260 m!608387))

(declare-fun m!608389 () Bool)

(assert (=> b!633773 m!608389))

(declare-fun m!608391 () Bool)

(assert (=> b!633773 m!608391))

(assert (=> b!633773 m!608375))

(assert (=> b!633773 m!608365))

(declare-fun m!608393 () Bool)

(assert (=> b!633773 m!608393))

(declare-fun m!608395 () Bool)

(assert (=> b!633773 m!608395))

(assert (=> b!633773 m!608365))

(declare-fun m!608397 () Bool)

(assert (=> b!633773 m!608397))

(declare-fun m!608399 () Bool)

(assert (=> b!633773 m!608399))

(declare-fun m!608401 () Bool)

(assert (=> b!633767 m!608401))

(declare-fun m!608403 () Bool)

(assert (=> b!633768 m!608403))

(declare-fun m!608405 () Bool)

(assert (=> b!633760 m!608405))

(assert (=> b!633761 m!608375))

(declare-fun m!608407 () Bool)

(assert (=> b!633761 m!608407))

(assert (=> b!633763 m!608365))

(push 1)

