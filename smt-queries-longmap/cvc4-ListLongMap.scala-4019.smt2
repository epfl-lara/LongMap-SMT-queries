; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54824 () Bool)

(assert start!54824)

(declare-fun b!598580 () Bool)

(declare-fun res!383659 () Bool)

(declare-fun e!342173 () Bool)

(assert (=> b!598580 (=> (not res!383659) (not e!342173))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598580 (= res!383659 (validKeyInArray!0 k!1786))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37059 0))(
  ( (array!37060 (arr!17789 (Array (_ BitVec 32) (_ BitVec 64))) (size!18153 (_ BitVec 32))) )
))
(declare-fun lt!271961 () array!37059)

(declare-fun b!598581 () Bool)

(declare-fun e!342174 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37059)

(declare-fun arrayContainsKey!0 (array!37059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598581 (= e!342174 (arrayContainsKey!0 lt!271961 (select (arr!17789 a!2986) j!136) index!984))))

(declare-fun b!598582 () Bool)

(declare-fun res!383646 () Bool)

(declare-fun e!342168 () Bool)

(assert (=> b!598582 (=> (not res!383646) (not e!342168))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37059 (_ BitVec 32)) Bool)

(assert (=> b!598582 (= res!383646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598583 () Bool)

(declare-fun e!342176 () Bool)

(assert (=> b!598583 (= e!342176 e!342174)))

(declare-fun res!383649 () Bool)

(assert (=> b!598583 (=> (not res!383649) (not e!342174))))

(assert (=> b!598583 (= res!383649 (arrayContainsKey!0 lt!271961 (select (arr!17789 a!2986) j!136) j!136))))

(declare-fun b!598584 () Bool)

(declare-datatypes ((Unit!18834 0))(
  ( (Unit!18835) )
))
(declare-fun e!342166 () Unit!18834)

(declare-fun Unit!18836 () Unit!18834)

(assert (=> b!598584 (= e!342166 Unit!18836)))

(declare-fun b!598585 () Bool)

(declare-fun e!342171 () Bool)

(declare-fun e!342170 () Bool)

(assert (=> b!598585 (= e!342171 e!342170)))

(declare-fun res!383652 () Bool)

(assert (=> b!598585 (=> res!383652 e!342170)))

(declare-fun lt!271952 () (_ BitVec 64))

(declare-fun lt!271955 () (_ BitVec 64))

(assert (=> b!598585 (= res!383652 (or (not (= (select (arr!17789 a!2986) j!136) lt!271955)) (not (= (select (arr!17789 a!2986) j!136) lt!271952)) (bvsge j!136 index!984)))))

(declare-fun e!342169 () Bool)

(assert (=> b!598585 e!342169))

(declare-fun res!383644 () Bool)

(assert (=> b!598585 (=> (not res!383644) (not e!342169))))

(assert (=> b!598585 (= res!383644 (= lt!271952 (select (arr!17789 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!598585 (= lt!271952 (select (store (arr!17789 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!598586 () Bool)

(declare-fun res!383660 () Bool)

(assert (=> b!598586 (=> (not res!383660) (not e!342173))))

(assert (=> b!598586 (= res!383660 (validKeyInArray!0 (select (arr!17789 a!2986) j!136)))))

(declare-fun b!598587 () Bool)

(declare-fun e!342167 () Bool)

(declare-fun e!342175 () Bool)

(assert (=> b!598587 (= e!342167 e!342175)))

(declare-fun res!383655 () Bool)

(assert (=> b!598587 (=> (not res!383655) (not e!342175))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6229 0))(
  ( (MissingZero!6229 (index!27173 (_ BitVec 32))) (Found!6229 (index!27174 (_ BitVec 32))) (Intermediate!6229 (undefined!7041 Bool) (index!27175 (_ BitVec 32)) (x!55980 (_ BitVec 32))) (Undefined!6229) (MissingVacant!6229 (index!27176 (_ BitVec 32))) )
))
(declare-fun lt!271956 () SeekEntryResult!6229)

(assert (=> b!598587 (= res!383655 (and (= lt!271956 (Found!6229 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17789 a!2986) index!984) (select (arr!17789 a!2986) j!136))) (not (= (select (arr!17789 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37059 (_ BitVec 32)) SeekEntryResult!6229)

(assert (=> b!598587 (= lt!271956 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17789 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598588 () Bool)

(assert (=> b!598588 (= e!342170 true)))

(declare-datatypes ((List!11830 0))(
  ( (Nil!11827) (Cons!11826 (h!12871 (_ BitVec 64)) (t!18058 List!11830)) )
))
(declare-fun arrayNoDuplicates!0 (array!37059 (_ BitVec 32) List!11830) Bool)

(assert (=> b!598588 (arrayNoDuplicates!0 lt!271961 #b00000000000000000000000000000000 Nil!11827)))

(declare-fun lt!271958 () Unit!18834)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37059 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11830) Unit!18834)

(assert (=> b!598588 (= lt!271958 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11827))))

(assert (=> b!598588 (arrayContainsKey!0 lt!271961 (select (arr!17789 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271954 () Unit!18834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37059 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18834)

(assert (=> b!598588 (= lt!271954 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271961 (select (arr!17789 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598590 () Bool)

(declare-fun res!383650 () Bool)

(assert (=> b!598590 (=> (not res!383650) (not e!342173))))

(assert (=> b!598590 (= res!383650 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598591 () Bool)

(assert (=> b!598591 (= e!342173 e!342168)))

(declare-fun res!383658 () Bool)

(assert (=> b!598591 (=> (not res!383658) (not e!342168))))

(declare-fun lt!271953 () SeekEntryResult!6229)

(assert (=> b!598591 (= res!383658 (or (= lt!271953 (MissingZero!6229 i!1108)) (= lt!271953 (MissingVacant!6229 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37059 (_ BitVec 32)) SeekEntryResult!6229)

(assert (=> b!598591 (= lt!271953 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!598592 () Bool)

(declare-fun res!383656 () Bool)

(assert (=> b!598592 (=> (not res!383656) (not e!342168))))

(assert (=> b!598592 (= res!383656 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17789 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598593 () Bool)

(assert (=> b!598593 (= e!342169 e!342176)))

(declare-fun res!383657 () Bool)

(assert (=> b!598593 (=> res!383657 e!342176)))

(assert (=> b!598593 (= res!383657 (or (not (= (select (arr!17789 a!2986) j!136) lt!271955)) (not (= (select (arr!17789 a!2986) j!136) lt!271952)) (bvsge j!136 index!984)))))

(declare-fun b!598594 () Bool)

(declare-fun e!342172 () Bool)

(declare-fun lt!271962 () SeekEntryResult!6229)

(assert (=> b!598594 (= e!342172 (= lt!271956 lt!271962))))

(declare-fun b!598595 () Bool)

(assert (=> b!598595 (= e!342175 (not e!342171))))

(declare-fun res!383651 () Bool)

(assert (=> b!598595 (=> res!383651 e!342171)))

(declare-fun lt!271960 () SeekEntryResult!6229)

(assert (=> b!598595 (= res!383651 (not (= lt!271960 (Found!6229 index!984))))))

(declare-fun lt!271957 () Unit!18834)

(assert (=> b!598595 (= lt!271957 e!342166)))

(declare-fun c!67835 () Bool)

(assert (=> b!598595 (= c!67835 (= lt!271960 Undefined!6229))))

(assert (=> b!598595 (= lt!271960 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271955 lt!271961 mask!3053))))

(assert (=> b!598595 e!342172))

(declare-fun res!383647 () Bool)

(assert (=> b!598595 (=> (not res!383647) (not e!342172))))

(declare-fun lt!271963 () (_ BitVec 32))

(assert (=> b!598595 (= res!383647 (= lt!271962 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271963 vacantSpotIndex!68 lt!271955 lt!271961 mask!3053)))))

(assert (=> b!598595 (= lt!271962 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271963 vacantSpotIndex!68 (select (arr!17789 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598595 (= lt!271955 (select (store (arr!17789 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271959 () Unit!18834)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37059 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18834)

(assert (=> b!598595 (= lt!271959 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271963 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598595 (= lt!271963 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598596 () Bool)

(declare-fun res!383648 () Bool)

(assert (=> b!598596 (=> (not res!383648) (not e!342173))))

(assert (=> b!598596 (= res!383648 (and (= (size!18153 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18153 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18153 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598597 () Bool)

(assert (=> b!598597 (= e!342168 e!342167)))

(declare-fun res!383653 () Bool)

(assert (=> b!598597 (=> (not res!383653) (not e!342167))))

(assert (=> b!598597 (= res!383653 (= (select (store (arr!17789 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598597 (= lt!271961 (array!37060 (store (arr!17789 a!2986) i!1108 k!1786) (size!18153 a!2986)))))

(declare-fun b!598598 () Bool)

(declare-fun Unit!18837 () Unit!18834)

(assert (=> b!598598 (= e!342166 Unit!18837)))

(assert (=> b!598598 false))

(declare-fun b!598589 () Bool)

(declare-fun res!383654 () Bool)

(assert (=> b!598589 (=> (not res!383654) (not e!342168))))

(assert (=> b!598589 (= res!383654 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11827))))

(declare-fun res!383645 () Bool)

(assert (=> start!54824 (=> (not res!383645) (not e!342173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54824 (= res!383645 (validMask!0 mask!3053))))

(assert (=> start!54824 e!342173))

(assert (=> start!54824 true))

(declare-fun array_inv!13585 (array!37059) Bool)

(assert (=> start!54824 (array_inv!13585 a!2986)))

(assert (= (and start!54824 res!383645) b!598596))

(assert (= (and b!598596 res!383648) b!598586))

(assert (= (and b!598586 res!383660) b!598580))

(assert (= (and b!598580 res!383659) b!598590))

(assert (= (and b!598590 res!383650) b!598591))

(assert (= (and b!598591 res!383658) b!598582))

(assert (= (and b!598582 res!383646) b!598589))

(assert (= (and b!598589 res!383654) b!598592))

(assert (= (and b!598592 res!383656) b!598597))

(assert (= (and b!598597 res!383653) b!598587))

(assert (= (and b!598587 res!383655) b!598595))

(assert (= (and b!598595 res!383647) b!598594))

(assert (= (and b!598595 c!67835) b!598598))

(assert (= (and b!598595 (not c!67835)) b!598584))

(assert (= (and b!598595 (not res!383651)) b!598585))

(assert (= (and b!598585 res!383644) b!598593))

(assert (= (and b!598593 (not res!383657)) b!598583))

(assert (= (and b!598583 res!383649) b!598581))

(assert (= (and b!598585 (not res!383652)) b!598588))

(declare-fun m!575879 () Bool)

(assert (=> b!598586 m!575879))

(assert (=> b!598586 m!575879))

(declare-fun m!575881 () Bool)

(assert (=> b!598586 m!575881))

(assert (=> b!598588 m!575879))

(declare-fun m!575883 () Bool)

(assert (=> b!598588 m!575883))

(assert (=> b!598588 m!575879))

(declare-fun m!575885 () Bool)

(assert (=> b!598588 m!575885))

(assert (=> b!598588 m!575879))

(declare-fun m!575887 () Bool)

(assert (=> b!598588 m!575887))

(declare-fun m!575889 () Bool)

(assert (=> b!598588 m!575889))

(declare-fun m!575891 () Bool)

(assert (=> b!598580 m!575891))

(declare-fun m!575893 () Bool)

(assert (=> b!598591 m!575893))

(declare-fun m!575895 () Bool)

(assert (=> b!598589 m!575895))

(assert (=> b!598593 m!575879))

(declare-fun m!575897 () Bool)

(assert (=> b!598582 m!575897))

(declare-fun m!575899 () Bool)

(assert (=> b!598597 m!575899))

(declare-fun m!575901 () Bool)

(assert (=> b!598597 m!575901))

(assert (=> b!598585 m!575879))

(assert (=> b!598585 m!575899))

(declare-fun m!575903 () Bool)

(assert (=> b!598585 m!575903))

(declare-fun m!575905 () Bool)

(assert (=> start!54824 m!575905))

(declare-fun m!575907 () Bool)

(assert (=> start!54824 m!575907))

(declare-fun m!575909 () Bool)

(assert (=> b!598592 m!575909))

(declare-fun m!575911 () Bool)

(assert (=> b!598587 m!575911))

(assert (=> b!598587 m!575879))

(assert (=> b!598587 m!575879))

(declare-fun m!575913 () Bool)

(assert (=> b!598587 m!575913))

(assert (=> b!598581 m!575879))

(assert (=> b!598581 m!575879))

(declare-fun m!575915 () Bool)

(assert (=> b!598581 m!575915))

(declare-fun m!575917 () Bool)

(assert (=> b!598595 m!575917))

(assert (=> b!598595 m!575879))

(declare-fun m!575919 () Bool)

(assert (=> b!598595 m!575919))

(assert (=> b!598595 m!575899))

(declare-fun m!575921 () Bool)

(assert (=> b!598595 m!575921))

(declare-fun m!575923 () Bool)

(assert (=> b!598595 m!575923))

(assert (=> b!598595 m!575879))

(declare-fun m!575925 () Bool)

(assert (=> b!598595 m!575925))

(declare-fun m!575927 () Bool)

(assert (=> b!598595 m!575927))

(declare-fun m!575929 () Bool)

(assert (=> b!598590 m!575929))

(assert (=> b!598583 m!575879))

(assert (=> b!598583 m!575879))

(declare-fun m!575931 () Bool)

(assert (=> b!598583 m!575931))

(push 1)

