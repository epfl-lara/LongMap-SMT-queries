; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54898 () Bool)

(assert start!54898)

(declare-fun b!600911 () Bool)

(declare-fun e!343584 () Bool)

(declare-fun e!343575 () Bool)

(assert (=> b!600911 (= e!343584 e!343575)))

(declare-fun res!385756 () Bool)

(assert (=> b!600911 (=> res!385756 e!343575)))

(declare-datatypes ((array!37133 0))(
  ( (array!37134 (arr!17826 (Array (_ BitVec 32) (_ BitVec 64))) (size!18190 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37133)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!600911 (= res!385756 (or (bvsge (size!18190 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18190 a!2986))))))

(declare-fun lt!273433 () array!37133)

(declare-datatypes ((List!11867 0))(
  ( (Nil!11864) (Cons!11863 (h!12908 (_ BitVec 64)) (t!18095 List!11867)) )
))
(declare-fun arrayNoDuplicates!0 (array!37133 (_ BitVec 32) List!11867) Bool)

(assert (=> b!600911 (arrayNoDuplicates!0 lt!273433 j!136 Nil!11864)))

(declare-datatypes ((Unit!18982 0))(
  ( (Unit!18983) )
))
(declare-fun lt!273439 () Unit!18982)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37133 (_ BitVec 32) (_ BitVec 32)) Unit!18982)

(assert (=> b!600911 (= lt!273439 (lemmaNoDuplicateFromThenFromBigger!0 lt!273433 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600911 (arrayNoDuplicates!0 lt!273433 #b00000000000000000000000000000000 Nil!11864)))

(declare-fun lt!273437 () Unit!18982)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37133 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11867) Unit!18982)

(assert (=> b!600911 (= lt!273437 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11864))))

(declare-fun arrayContainsKey!0 (array!37133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600911 (arrayContainsKey!0 lt!273433 (select (arr!17826 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273441 () Unit!18982)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37133 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18982)

(assert (=> b!600911 (= lt!273441 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273433 (select (arr!17826 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!385762 () Bool)

(declare-fun e!343576 () Bool)

(assert (=> start!54898 (=> (not res!385762) (not e!343576))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54898 (= res!385762 (validMask!0 mask!3053))))

(assert (=> start!54898 e!343576))

(assert (=> start!54898 true))

(declare-fun array_inv!13622 (array!37133) Bool)

(assert (=> start!54898 (array_inv!13622 a!2986)))

(declare-fun b!600912 () Bool)

(declare-fun e!343574 () Bool)

(declare-fun e!343579 () Bool)

(assert (=> b!600912 (= e!343574 (not e!343579))))

(declare-fun res!385759 () Bool)

(assert (=> b!600912 (=> res!385759 e!343579)))

(declare-datatypes ((SeekEntryResult!6266 0))(
  ( (MissingZero!6266 (index!27321 (_ BitVec 32))) (Found!6266 (index!27322 (_ BitVec 32))) (Intermediate!6266 (undefined!7078 Bool) (index!27323 (_ BitVec 32)) (x!56121 (_ BitVec 32))) (Undefined!6266) (MissingVacant!6266 (index!27324 (_ BitVec 32))) )
))
(declare-fun lt!273436 () SeekEntryResult!6266)

(assert (=> b!600912 (= res!385759 (not (= lt!273436 (Found!6266 index!984))))))

(declare-fun lt!273443 () Unit!18982)

(declare-fun e!343577 () Unit!18982)

(assert (=> b!600912 (= lt!273443 e!343577)))

(declare-fun c!67946 () Bool)

(assert (=> b!600912 (= c!67946 (= lt!273436 Undefined!6266))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!273434 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37133 (_ BitVec 32)) SeekEntryResult!6266)

(assert (=> b!600912 (= lt!273436 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273434 lt!273433 mask!3053))))

(declare-fun e!343581 () Bool)

(assert (=> b!600912 e!343581))

(declare-fun res!385764 () Bool)

(assert (=> b!600912 (=> (not res!385764) (not e!343581))))

(declare-fun lt!273438 () SeekEntryResult!6266)

(declare-fun lt!273442 () (_ BitVec 32))

(assert (=> b!600912 (= res!385764 (= lt!273438 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273442 vacantSpotIndex!68 lt!273434 lt!273433 mask!3053)))))

(assert (=> b!600912 (= lt!273438 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273442 vacantSpotIndex!68 (select (arr!17826 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600912 (= lt!273434 (select (store (arr!17826 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273445 () Unit!18982)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37133 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18982)

(assert (=> b!600912 (= lt!273445 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273442 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600912 (= lt!273442 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600913 () Bool)

(declare-fun res!385763 () Bool)

(assert (=> b!600913 (=> (not res!385763) (not e!343576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600913 (= res!385763 (validKeyInArray!0 (select (arr!17826 a!2986) j!136)))))

(declare-fun b!600914 () Bool)

(declare-fun e!343583 () Bool)

(declare-fun e!343580 () Bool)

(assert (=> b!600914 (= e!343583 e!343580)))

(declare-fun res!385754 () Bool)

(assert (=> b!600914 (=> (not res!385754) (not e!343580))))

(assert (=> b!600914 (= res!385754 (arrayContainsKey!0 lt!273433 (select (arr!17826 a!2986) j!136) j!136))))

(declare-fun b!600915 () Bool)

(declare-fun res!385755 () Bool)

(declare-fun e!343573 () Bool)

(assert (=> b!600915 (=> (not res!385755) (not e!343573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37133 (_ BitVec 32)) Bool)

(assert (=> b!600915 (= res!385755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600916 () Bool)

(declare-fun res!385761 () Bool)

(assert (=> b!600916 (=> (not res!385761) (not e!343573))))

(assert (=> b!600916 (= res!385761 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17826 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600917 () Bool)

(declare-fun e!343578 () Bool)

(assert (=> b!600917 (= e!343573 e!343578)))

(declare-fun res!385753 () Bool)

(assert (=> b!600917 (=> (not res!385753) (not e!343578))))

(assert (=> b!600917 (= res!385753 (= (select (store (arr!17826 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600917 (= lt!273433 (array!37134 (store (arr!17826 a!2986) i!1108 k!1786) (size!18190 a!2986)))))

(declare-fun b!600918 () Bool)

(assert (=> b!600918 (= e!343579 e!343584)))

(declare-fun res!385766 () Bool)

(assert (=> b!600918 (=> res!385766 e!343584)))

(declare-fun lt!273435 () (_ BitVec 64))

(assert (=> b!600918 (= res!385766 (or (not (= (select (arr!17826 a!2986) j!136) lt!273434)) (not (= (select (arr!17826 a!2986) j!136) lt!273435)) (bvsge j!136 index!984)))))

(declare-fun e!343572 () Bool)

(assert (=> b!600918 e!343572))

(declare-fun res!385758 () Bool)

(assert (=> b!600918 (=> (not res!385758) (not e!343572))))

(assert (=> b!600918 (= res!385758 (= lt!273435 (select (arr!17826 a!2986) j!136)))))

(assert (=> b!600918 (= lt!273435 (select (store (arr!17826 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!600919 () Bool)

(declare-fun res!385757 () Bool)

(assert (=> b!600919 (=> res!385757 e!343575)))

(declare-fun contains!2983 (List!11867 (_ BitVec 64)) Bool)

(assert (=> b!600919 (= res!385757 (contains!2983 Nil!11864 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600920 () Bool)

(declare-fun res!385769 () Bool)

(assert (=> b!600920 (=> res!385769 e!343575)))

(declare-fun noDuplicate!300 (List!11867) Bool)

(assert (=> b!600920 (= res!385769 (not (noDuplicate!300 Nil!11864)))))

(declare-fun b!600921 () Bool)

(assert (=> b!600921 (= e!343580 (arrayContainsKey!0 lt!273433 (select (arr!17826 a!2986) j!136) index!984))))

(declare-fun b!600922 () Bool)

(declare-fun Unit!18984 () Unit!18982)

(assert (=> b!600922 (= e!343577 Unit!18984)))

(assert (=> b!600922 false))

(declare-fun b!600923 () Bool)

(declare-fun res!385770 () Bool)

(assert (=> b!600923 (=> (not res!385770) (not e!343573))))

(assert (=> b!600923 (= res!385770 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11864))))

(declare-fun b!600924 () Bool)

(declare-fun res!385772 () Bool)

(assert (=> b!600924 (=> (not res!385772) (not e!343576))))

(assert (=> b!600924 (= res!385772 (validKeyInArray!0 k!1786))))

(declare-fun b!600925 () Bool)

(declare-fun lt!273440 () SeekEntryResult!6266)

(assert (=> b!600925 (= e!343581 (= lt!273440 lt!273438))))

(declare-fun b!600926 () Bool)

(declare-fun res!385771 () Bool)

(assert (=> b!600926 (=> (not res!385771) (not e!343576))))

(assert (=> b!600926 (= res!385771 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600927 () Bool)

(declare-fun Unit!18985 () Unit!18982)

(assert (=> b!600927 (= e!343577 Unit!18985)))

(declare-fun b!600928 () Bool)

(assert (=> b!600928 (= e!343578 e!343574)))

(declare-fun res!385765 () Bool)

(assert (=> b!600928 (=> (not res!385765) (not e!343574))))

(assert (=> b!600928 (= res!385765 (and (= lt!273440 (Found!6266 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17826 a!2986) index!984) (select (arr!17826 a!2986) j!136))) (not (= (select (arr!17826 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600928 (= lt!273440 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17826 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600929 () Bool)

(assert (=> b!600929 (= e!343572 e!343583)))

(declare-fun res!385767 () Bool)

(assert (=> b!600929 (=> res!385767 e!343583)))

(assert (=> b!600929 (= res!385767 (or (not (= (select (arr!17826 a!2986) j!136) lt!273434)) (not (= (select (arr!17826 a!2986) j!136) lt!273435)) (bvsge j!136 index!984)))))

(declare-fun b!600930 () Bool)

(declare-fun res!385768 () Bool)

(assert (=> b!600930 (=> (not res!385768) (not e!343576))))

(assert (=> b!600930 (= res!385768 (and (= (size!18190 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18190 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18190 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600931 () Bool)

(assert (=> b!600931 (= e!343576 e!343573)))

(declare-fun res!385760 () Bool)

(assert (=> b!600931 (=> (not res!385760) (not e!343573))))

(declare-fun lt!273444 () SeekEntryResult!6266)

(assert (=> b!600931 (= res!385760 (or (= lt!273444 (MissingZero!6266 i!1108)) (= lt!273444 (MissingVacant!6266 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37133 (_ BitVec 32)) SeekEntryResult!6266)

(assert (=> b!600931 (= lt!273444 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!600932 () Bool)

(assert (=> b!600932 (= e!343575 true)))

(declare-fun lt!273432 () Bool)

(assert (=> b!600932 (= lt!273432 (contains!2983 Nil!11864 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!54898 res!385762) b!600930))

(assert (= (and b!600930 res!385768) b!600913))

(assert (= (and b!600913 res!385763) b!600924))

(assert (= (and b!600924 res!385772) b!600926))

(assert (= (and b!600926 res!385771) b!600931))

(assert (= (and b!600931 res!385760) b!600915))

(assert (= (and b!600915 res!385755) b!600923))

(assert (= (and b!600923 res!385770) b!600916))

(assert (= (and b!600916 res!385761) b!600917))

(assert (= (and b!600917 res!385753) b!600928))

(assert (= (and b!600928 res!385765) b!600912))

(assert (= (and b!600912 res!385764) b!600925))

(assert (= (and b!600912 c!67946) b!600922))

(assert (= (and b!600912 (not c!67946)) b!600927))

(assert (= (and b!600912 (not res!385759)) b!600918))

(assert (= (and b!600918 res!385758) b!600929))

(assert (= (and b!600929 (not res!385767)) b!600914))

(assert (= (and b!600914 res!385754) b!600921))

(assert (= (and b!600918 (not res!385766)) b!600911))

(assert (= (and b!600911 (not res!385756)) b!600920))

(assert (= (and b!600920 (not res!385769)) b!600919))

(assert (= (and b!600919 (not res!385757)) b!600932))

(declare-fun m!578117 () Bool)

(assert (=> b!600916 m!578117))

(declare-fun m!578119 () Bool)

(assert (=> b!600931 m!578119))

(declare-fun m!578121 () Bool)

(assert (=> b!600912 m!578121))

(declare-fun m!578123 () Bool)

(assert (=> b!600912 m!578123))

(declare-fun m!578125 () Bool)

(assert (=> b!600912 m!578125))

(declare-fun m!578127 () Bool)

(assert (=> b!600912 m!578127))

(declare-fun m!578129 () Bool)

(assert (=> b!600912 m!578129))

(declare-fun m!578131 () Bool)

(assert (=> b!600912 m!578131))

(assert (=> b!600912 m!578125))

(declare-fun m!578133 () Bool)

(assert (=> b!600912 m!578133))

(declare-fun m!578135 () Bool)

(assert (=> b!600912 m!578135))

(assert (=> b!600917 m!578129))

(declare-fun m!578137 () Bool)

(assert (=> b!600917 m!578137))

(assert (=> b!600913 m!578125))

(assert (=> b!600913 m!578125))

(declare-fun m!578139 () Bool)

(assert (=> b!600913 m!578139))

(declare-fun m!578141 () Bool)

(assert (=> b!600920 m!578141))

(declare-fun m!578143 () Bool)

(assert (=> start!54898 m!578143))

(declare-fun m!578145 () Bool)

(assert (=> start!54898 m!578145))

(declare-fun m!578147 () Bool)

(assert (=> b!600928 m!578147))

(assert (=> b!600928 m!578125))

(assert (=> b!600928 m!578125))

(declare-fun m!578149 () Bool)

(assert (=> b!600928 m!578149))

(assert (=> b!600918 m!578125))

(assert (=> b!600918 m!578129))

(declare-fun m!578151 () Bool)

(assert (=> b!600918 m!578151))

(declare-fun m!578153 () Bool)

(assert (=> b!600932 m!578153))

(assert (=> b!600911 m!578125))

(declare-fun m!578155 () Bool)

(assert (=> b!600911 m!578155))

(assert (=> b!600911 m!578125))

(declare-fun m!578157 () Bool)

(assert (=> b!600911 m!578157))

(declare-fun m!578159 () Bool)

(assert (=> b!600911 m!578159))

(declare-fun m!578161 () Bool)

(assert (=> b!600911 m!578161))

(declare-fun m!578163 () Bool)

(assert (=> b!600911 m!578163))

(assert (=> b!600911 m!578125))

(declare-fun m!578165 () Bool)

(assert (=> b!600911 m!578165))

(assert (=> b!600921 m!578125))

(assert (=> b!600921 m!578125))

(declare-fun m!578167 () Bool)

(assert (=> b!600921 m!578167))

(declare-fun m!578169 () Bool)

(assert (=> b!600924 m!578169))

(assert (=> b!600929 m!578125))

(assert (=> b!600914 m!578125))

(assert (=> b!600914 m!578125))

(declare-fun m!578171 () Bool)

(assert (=> b!600914 m!578171))

(declare-fun m!578173 () Bool)

(assert (=> b!600926 m!578173))

(declare-fun m!578175 () Bool)

(assert (=> b!600923 m!578175))

(declare-fun m!578177 () Bool)

(assert (=> b!600915 m!578177))

(declare-fun m!578179 () Bool)

(assert (=> b!600919 m!578179))

(push 1)

