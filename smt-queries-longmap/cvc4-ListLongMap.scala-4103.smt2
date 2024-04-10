; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56120 () Bool)

(assert start!56120)

(declare-fun b!619823 () Bool)

(declare-fun e!355489 () Bool)

(assert (=> b!619823 (= e!355489 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37590 0))(
  ( (array!37591 (arr!18041 (Array (_ BitVec 32) (_ BitVec 64))) (size!18405 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37590)

(assert (=> b!619823 (= (select (store (arr!18041 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619824 () Bool)

(declare-fun res!399389 () Bool)

(declare-fun e!355495 () Bool)

(assert (=> b!619824 (=> (not res!399389) (not e!355495))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619824 (= res!399389 (validKeyInArray!0 (select (arr!18041 a!2986) j!136)))))

(declare-fun b!619825 () Bool)

(declare-fun res!399385 () Bool)

(assert (=> b!619825 (=> (not res!399385) (not e!355495))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!619825 (= res!399385 (and (= (size!18405 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18405 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18405 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619826 () Bool)

(declare-datatypes ((Unit!20538 0))(
  ( (Unit!20539) )
))
(declare-fun e!355483 () Unit!20538)

(declare-fun Unit!20540 () Unit!20538)

(assert (=> b!619826 (= e!355483 Unit!20540)))

(declare-fun b!619827 () Bool)

(declare-fun e!355492 () Bool)

(declare-fun e!355491 () Bool)

(assert (=> b!619827 (= e!355492 e!355491)))

(declare-fun res!399399 () Bool)

(assert (=> b!619827 (=> (not res!399399) (not e!355491))))

(declare-datatypes ((SeekEntryResult!6481 0))(
  ( (MissingZero!6481 (index!28208 (_ BitVec 32))) (Found!6481 (index!28209 (_ BitVec 32))) (Intermediate!6481 (undefined!7293 Bool) (index!28210 (_ BitVec 32)) (x!56985 (_ BitVec 32))) (Undefined!6481) (MissingVacant!6481 (index!28211 (_ BitVec 32))) )
))
(declare-fun lt!286233 () SeekEntryResult!6481)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!619827 (= res!399399 (and (= lt!286233 (Found!6481 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18041 a!2986) index!984) (select (arr!18041 a!2986) j!136))) (not (= (select (arr!18041 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37590 (_ BitVec 32)) SeekEntryResult!6481)

(assert (=> b!619827 (= lt!286233 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18041 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619828 () Bool)

(declare-fun Unit!20541 () Unit!20538)

(assert (=> b!619828 (= e!355483 Unit!20541)))

(declare-fun res!399388 () Bool)

(assert (=> b!619828 (= res!399388 (= (select (store (arr!18041 a!2986) i!1108 k!1786) index!984) (select (arr!18041 a!2986) j!136)))))

(declare-fun e!355485 () Bool)

(assert (=> b!619828 (=> (not res!399388) (not e!355485))))

(assert (=> b!619828 e!355485))

(declare-fun c!70588 () Bool)

(assert (=> b!619828 (= c!70588 (bvslt j!136 index!984))))

(declare-fun lt!286232 () Unit!20538)

(declare-fun e!355488 () Unit!20538)

(assert (=> b!619828 (= lt!286232 e!355488)))

(declare-fun c!70589 () Bool)

(assert (=> b!619828 (= c!70589 (bvslt index!984 j!136))))

(declare-fun lt!286228 () Unit!20538)

(declare-fun e!355497 () Unit!20538)

(assert (=> b!619828 (= lt!286228 e!355497)))

(assert (=> b!619828 false))

(declare-fun b!619829 () Bool)

(declare-fun e!355484 () Bool)

(assert (=> b!619829 (= e!355495 e!355484)))

(declare-fun res!399391 () Bool)

(assert (=> b!619829 (=> (not res!399391) (not e!355484))))

(declare-fun lt!286225 () SeekEntryResult!6481)

(assert (=> b!619829 (= res!399391 (or (= lt!286225 (MissingZero!6481 i!1108)) (= lt!286225 (MissingVacant!6481 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37590 (_ BitVec 32)) SeekEntryResult!6481)

(assert (=> b!619829 (= lt!286225 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!619830 () Bool)

(declare-fun res!399397 () Bool)

(assert (=> b!619830 (=> (not res!399397) (not e!355495))))

(declare-fun arrayContainsKey!0 (array!37590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619830 (= res!399397 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619831 () Bool)

(declare-fun lt!286235 () array!37590)

(declare-fun res!399395 () Bool)

(assert (=> b!619831 (= res!399395 (arrayContainsKey!0 lt!286235 (select (arr!18041 a!2986) j!136) j!136))))

(declare-fun e!355490 () Bool)

(assert (=> b!619831 (=> (not res!399395) (not e!355490))))

(declare-fun e!355496 () Bool)

(assert (=> b!619831 (= e!355496 e!355490)))

(declare-fun b!619832 () Bool)

(assert (=> b!619832 (= e!355484 e!355492)))

(declare-fun res!399396 () Bool)

(assert (=> b!619832 (=> (not res!399396) (not e!355492))))

(assert (=> b!619832 (= res!399396 (= (select (store (arr!18041 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619832 (= lt!286235 (array!37591 (store (arr!18041 a!2986) i!1108 k!1786) (size!18405 a!2986)))))

(declare-fun b!619833 () Bool)

(declare-fun Unit!20542 () Unit!20538)

(assert (=> b!619833 (= e!355497 Unit!20542)))

(declare-fun b!619834 () Bool)

(assert (=> b!619834 (= e!355491 (not e!355489))))

(declare-fun res!399386 () Bool)

(assert (=> b!619834 (=> res!399386 e!355489)))

(declare-fun lt!286230 () SeekEntryResult!6481)

(assert (=> b!619834 (= res!399386 (not (= lt!286230 (MissingVacant!6481 vacantSpotIndex!68))))))

(declare-fun lt!286224 () Unit!20538)

(assert (=> b!619834 (= lt!286224 e!355483)))

(declare-fun c!70586 () Bool)

(assert (=> b!619834 (= c!70586 (= lt!286230 (Found!6481 index!984)))))

(declare-fun lt!286223 () Unit!20538)

(declare-fun e!355486 () Unit!20538)

(assert (=> b!619834 (= lt!286223 e!355486)))

(declare-fun c!70587 () Bool)

(assert (=> b!619834 (= c!70587 (= lt!286230 Undefined!6481))))

(declare-fun lt!286221 () (_ BitVec 64))

(assert (=> b!619834 (= lt!286230 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286221 lt!286235 mask!3053))))

(declare-fun e!355487 () Bool)

(assert (=> b!619834 e!355487))

(declare-fun res!399394 () Bool)

(assert (=> b!619834 (=> (not res!399394) (not e!355487))))

(declare-fun lt!286229 () (_ BitVec 32))

(declare-fun lt!286227 () SeekEntryResult!6481)

(assert (=> b!619834 (= res!399394 (= lt!286227 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286229 vacantSpotIndex!68 lt!286221 lt!286235 mask!3053)))))

(assert (=> b!619834 (= lt!286227 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286229 vacantSpotIndex!68 (select (arr!18041 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619834 (= lt!286221 (select (store (arr!18041 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!286218 () Unit!20538)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37590 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20538)

(assert (=> b!619834 (= lt!286218 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286229 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619834 (= lt!286229 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619835 () Bool)

(declare-fun Unit!20543 () Unit!20538)

(assert (=> b!619835 (= e!355486 Unit!20543)))

(assert (=> b!619835 false))

(declare-fun b!619836 () Bool)

(declare-fun res!399393 () Bool)

(assert (=> b!619836 (= res!399393 (bvsge j!136 index!984))))

(assert (=> b!619836 (=> res!399393 e!355496)))

(assert (=> b!619836 (= e!355485 e!355496)))

(declare-fun b!619837 () Bool)

(assert (=> b!619837 (= e!355487 (= lt!286233 lt!286227))))

(declare-fun b!619838 () Bool)

(assert (=> b!619838 false))

(declare-fun lt!286219 () Unit!20538)

(declare-datatypes ((List!12082 0))(
  ( (Nil!12079) (Cons!12078 (h!13123 (_ BitVec 64)) (t!18310 List!12082)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37590 (_ BitVec 64) (_ BitVec 32) List!12082) Unit!20538)

(assert (=> b!619838 (= lt!286219 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286235 (select (arr!18041 a!2986) j!136) j!136 Nil!12079))))

(declare-fun arrayNoDuplicates!0 (array!37590 (_ BitVec 32) List!12082) Bool)

(assert (=> b!619838 (arrayNoDuplicates!0 lt!286235 j!136 Nil!12079)))

(declare-fun lt!286231 () Unit!20538)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37590 (_ BitVec 32) (_ BitVec 32)) Unit!20538)

(assert (=> b!619838 (= lt!286231 (lemmaNoDuplicateFromThenFromBigger!0 lt!286235 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619838 (arrayNoDuplicates!0 lt!286235 #b00000000000000000000000000000000 Nil!12079)))

(declare-fun lt!286220 () Unit!20538)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37590 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12082) Unit!20538)

(assert (=> b!619838 (= lt!286220 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12079))))

(assert (=> b!619838 (arrayContainsKey!0 lt!286235 (select (arr!18041 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286226 () Unit!20538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37590 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20538)

(assert (=> b!619838 (= lt!286226 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286235 (select (arr!18041 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20544 () Unit!20538)

(assert (=> b!619838 (= e!355488 Unit!20544)))

(declare-fun b!619839 () Bool)

(declare-fun res!399400 () Bool)

(assert (=> b!619839 (=> (not res!399400) (not e!355495))))

(assert (=> b!619839 (= res!399400 (validKeyInArray!0 k!1786))))

(declare-fun b!619840 () Bool)

(declare-fun Unit!20545 () Unit!20538)

(assert (=> b!619840 (= e!355486 Unit!20545)))

(declare-fun b!619841 () Bool)

(declare-fun res!399401 () Bool)

(assert (=> b!619841 (=> (not res!399401) (not e!355484))))

(assert (=> b!619841 (= res!399401 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12079))))

(declare-fun b!619842 () Bool)

(declare-fun Unit!20546 () Unit!20538)

(assert (=> b!619842 (= e!355488 Unit!20546)))

(declare-fun b!619843 () Bool)

(declare-fun res!399398 () Bool)

(assert (=> b!619843 (=> (not res!399398) (not e!355484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37590 (_ BitVec 32)) Bool)

(assert (=> b!619843 (= res!399398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619844 () Bool)

(declare-fun e!355493 () Bool)

(assert (=> b!619844 (= e!355493 (arrayContainsKey!0 lt!286235 (select (arr!18041 a!2986) j!136) index!984))))

(declare-fun res!399387 () Bool)

(assert (=> start!56120 (=> (not res!399387) (not e!355495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56120 (= res!399387 (validMask!0 mask!3053))))

(assert (=> start!56120 e!355495))

(assert (=> start!56120 true))

(declare-fun array_inv!13837 (array!37590) Bool)

(assert (=> start!56120 (array_inv!13837 a!2986)))

(declare-fun b!619845 () Bool)

(declare-fun res!399390 () Bool)

(assert (=> b!619845 (=> (not res!399390) (not e!355484))))

(assert (=> b!619845 (= res!399390 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18041 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619846 () Bool)

(assert (=> b!619846 false))

(declare-fun lt!286234 () Unit!20538)

(assert (=> b!619846 (= lt!286234 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286235 (select (arr!18041 a!2986) j!136) index!984 Nil!12079))))

(assert (=> b!619846 (arrayNoDuplicates!0 lt!286235 index!984 Nil!12079)))

(declare-fun lt!286222 () Unit!20538)

(assert (=> b!619846 (= lt!286222 (lemmaNoDuplicateFromThenFromBigger!0 lt!286235 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619846 (arrayNoDuplicates!0 lt!286235 #b00000000000000000000000000000000 Nil!12079)))

(declare-fun lt!286237 () Unit!20538)

(assert (=> b!619846 (= lt!286237 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12079))))

(assert (=> b!619846 (arrayContainsKey!0 lt!286235 (select (arr!18041 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286236 () Unit!20538)

(assert (=> b!619846 (= lt!286236 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286235 (select (arr!18041 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619846 e!355493))

(declare-fun res!399392 () Bool)

(assert (=> b!619846 (=> (not res!399392) (not e!355493))))

(assert (=> b!619846 (= res!399392 (arrayContainsKey!0 lt!286235 (select (arr!18041 a!2986) j!136) j!136))))

(declare-fun Unit!20547 () Unit!20538)

(assert (=> b!619846 (= e!355497 Unit!20547)))

(declare-fun b!619847 () Bool)

(assert (=> b!619847 (= e!355490 (arrayContainsKey!0 lt!286235 (select (arr!18041 a!2986) j!136) index!984))))

(assert (= (and start!56120 res!399387) b!619825))

(assert (= (and b!619825 res!399385) b!619824))

(assert (= (and b!619824 res!399389) b!619839))

(assert (= (and b!619839 res!399400) b!619830))

(assert (= (and b!619830 res!399397) b!619829))

(assert (= (and b!619829 res!399391) b!619843))

(assert (= (and b!619843 res!399398) b!619841))

(assert (= (and b!619841 res!399401) b!619845))

(assert (= (and b!619845 res!399390) b!619832))

(assert (= (and b!619832 res!399396) b!619827))

(assert (= (and b!619827 res!399399) b!619834))

(assert (= (and b!619834 res!399394) b!619837))

(assert (= (and b!619834 c!70587) b!619835))

(assert (= (and b!619834 (not c!70587)) b!619840))

(assert (= (and b!619834 c!70586) b!619828))

(assert (= (and b!619834 (not c!70586)) b!619826))

(assert (= (and b!619828 res!399388) b!619836))

(assert (= (and b!619836 (not res!399393)) b!619831))

(assert (= (and b!619831 res!399395) b!619847))

(assert (= (and b!619828 c!70588) b!619838))

(assert (= (and b!619828 (not c!70588)) b!619842))

(assert (= (and b!619828 c!70589) b!619846))

(assert (= (and b!619828 (not c!70589)) b!619833))

(assert (= (and b!619846 res!399392) b!619844))

(assert (= (and b!619834 (not res!399386)) b!619823))

(declare-fun m!595771 () Bool)

(assert (=> b!619841 m!595771))

(declare-fun m!595773 () Bool)

(assert (=> b!619845 m!595773))

(declare-fun m!595775 () Bool)

(assert (=> b!619828 m!595775))

(declare-fun m!595777 () Bool)

(assert (=> b!619828 m!595777))

(declare-fun m!595779 () Bool)

(assert (=> b!619828 m!595779))

(assert (=> b!619832 m!595775))

(declare-fun m!595781 () Bool)

(assert (=> b!619832 m!595781))

(assert (=> b!619846 m!595779))

(declare-fun m!595783 () Bool)

(assert (=> b!619846 m!595783))

(assert (=> b!619846 m!595779))

(declare-fun m!595785 () Bool)

(assert (=> b!619846 m!595785))

(declare-fun m!595787 () Bool)

(assert (=> b!619846 m!595787))

(assert (=> b!619846 m!595779))

(declare-fun m!595789 () Bool)

(assert (=> b!619846 m!595789))

(assert (=> b!619846 m!595779))

(declare-fun m!595791 () Bool)

(assert (=> b!619846 m!595791))

(declare-fun m!595793 () Bool)

(assert (=> b!619846 m!595793))

(declare-fun m!595795 () Bool)

(assert (=> b!619846 m!595795))

(assert (=> b!619846 m!595779))

(declare-fun m!595797 () Bool)

(assert (=> b!619846 m!595797))

(assert (=> b!619831 m!595779))

(assert (=> b!619831 m!595779))

(assert (=> b!619831 m!595789))

(declare-fun m!595799 () Bool)

(assert (=> b!619843 m!595799))

(declare-fun m!595801 () Bool)

(assert (=> b!619830 m!595801))

(assert (=> b!619847 m!595779))

(assert (=> b!619847 m!595779))

(declare-fun m!595803 () Bool)

(assert (=> b!619847 m!595803))

(assert (=> b!619844 m!595779))

(assert (=> b!619844 m!595779))

(assert (=> b!619844 m!595803))

(declare-fun m!595805 () Bool)

(assert (=> b!619829 m!595805))

(declare-fun m!595807 () Bool)

(assert (=> b!619839 m!595807))

(assert (=> b!619823 m!595775))

(assert (=> b!619823 m!595777))

(declare-fun m!595809 () Bool)

(assert (=> b!619827 m!595809))

(assert (=> b!619827 m!595779))

(assert (=> b!619827 m!595779))

(declare-fun m!595811 () Bool)

(assert (=> b!619827 m!595811))

(declare-fun m!595813 () Bool)

(assert (=> start!56120 m!595813))

(declare-fun m!595815 () Bool)

(assert (=> start!56120 m!595815))

(assert (=> b!619838 m!595779))

(assert (=> b!619838 m!595779))

(declare-fun m!595817 () Bool)

(assert (=> b!619838 m!595817))

(assert (=> b!619838 m!595779))

(declare-fun m!595819 () Bool)

(assert (=> b!619838 m!595819))

(declare-fun m!595821 () Bool)

(assert (=> b!619838 m!595821))

(assert (=> b!619838 m!595779))

(declare-fun m!595823 () Bool)

(assert (=> b!619838 m!595823))

(assert (=> b!619838 m!595795))

(declare-fun m!595825 () Bool)

(assert (=> b!619838 m!595825))

(assert (=> b!619838 m!595793))

(assert (=> b!619824 m!595779))

(assert (=> b!619824 m!595779))

(declare-fun m!595827 () Bool)

(assert (=> b!619824 m!595827))

(declare-fun m!595829 () Bool)

(assert (=> b!619834 m!595829))

(declare-fun m!595831 () Bool)

(assert (=> b!619834 m!595831))

(declare-fun m!595833 () Bool)

(assert (=> b!619834 m!595833))

(assert (=> b!619834 m!595779))

(assert (=> b!619834 m!595775))

(declare-fun m!595835 () Bool)

(assert (=> b!619834 m!595835))

(declare-fun m!595837 () Bool)

(assert (=> b!619834 m!595837))

(assert (=> b!619834 m!595779))

(declare-fun m!595839 () Bool)

(assert (=> b!619834 m!595839))

(push 1)

