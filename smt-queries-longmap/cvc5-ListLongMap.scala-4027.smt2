; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54868 () Bool)

(assert start!54868)

(declare-fun b!599921 () Bool)

(declare-fun e!342992 () Bool)

(declare-fun e!342997 () Bool)

(assert (=> b!599921 (= e!342992 e!342997)))

(declare-fun res!384866 () Bool)

(assert (=> b!599921 (=> res!384866 e!342997)))

(declare-fun lt!272807 () (_ BitVec 64))

(declare-fun lt!272815 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37103 0))(
  ( (array!37104 (arr!17811 (Array (_ BitVec 32) (_ BitVec 64))) (size!18175 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37103)

(assert (=> b!599921 (= res!384866 (or (not (= (select (arr!17811 a!2986) j!136) lt!272807)) (not (= (select (arr!17811 a!2986) j!136) lt!272815)) (bvsge j!136 index!984)))))

(declare-fun e!342991 () Bool)

(assert (=> b!599921 e!342991))

(declare-fun res!384868 () Bool)

(assert (=> b!599921 (=> (not res!384868) (not e!342991))))

(assert (=> b!599921 (= res!384868 (= lt!272815 (select (arr!17811 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!599921 (= lt!272815 (select (store (arr!17811 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!599922 () Bool)

(declare-fun res!384860 () Bool)

(declare-fun e!342996 () Bool)

(assert (=> b!599922 (=> (not res!384860) (not e!342996))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!599922 (= res!384860 (and (= (size!18175 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18175 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18175 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599923 () Bool)

(declare-fun res!384869 () Bool)

(declare-fun e!342993 () Bool)

(assert (=> b!599923 (=> (not res!384869) (not e!342993))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599923 (= res!384869 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17811 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599924 () Bool)

(declare-fun res!384872 () Bool)

(assert (=> b!599924 (=> (not res!384872) (not e!342996))))

(declare-fun arrayContainsKey!0 (array!37103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599924 (= res!384872 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599925 () Bool)

(declare-fun e!342987 () Bool)

(declare-datatypes ((SeekEntryResult!6251 0))(
  ( (MissingZero!6251 (index!27261 (_ BitVec 32))) (Found!6251 (index!27262 (_ BitVec 32))) (Intermediate!6251 (undefined!7063 Bool) (index!27263 (_ BitVec 32)) (x!56066 (_ BitVec 32))) (Undefined!6251) (MissingVacant!6251 (index!27264 (_ BitVec 32))) )
))
(declare-fun lt!272811 () SeekEntryResult!6251)

(declare-fun lt!272810 () SeekEntryResult!6251)

(assert (=> b!599925 (= e!342987 (= lt!272811 lt!272810))))

(declare-fun res!384862 () Bool)

(assert (=> start!54868 (=> (not res!384862) (not e!342996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54868 (= res!384862 (validMask!0 mask!3053))))

(assert (=> start!54868 e!342996))

(assert (=> start!54868 true))

(declare-fun array_inv!13607 (array!37103) Bool)

(assert (=> start!54868 (array_inv!13607 a!2986)))

(declare-fun b!599926 () Bool)

(declare-fun e!342998 () Bool)

(assert (=> b!599926 (= e!342991 e!342998)))

(declare-fun res!384854 () Bool)

(assert (=> b!599926 (=> res!384854 e!342998)))

(assert (=> b!599926 (= res!384854 (or (not (= (select (arr!17811 a!2986) j!136) lt!272807)) (not (= (select (arr!17811 a!2986) j!136) lt!272815)) (bvsge j!136 index!984)))))

(declare-fun e!342989 () Bool)

(declare-fun b!599927 () Bool)

(declare-fun lt!272808 () array!37103)

(assert (=> b!599927 (= e!342989 (arrayContainsKey!0 lt!272808 (select (arr!17811 a!2986) j!136) index!984))))

(declare-fun b!599928 () Bool)

(declare-datatypes ((Unit!18922 0))(
  ( (Unit!18923) )
))
(declare-fun e!342990 () Unit!18922)

(declare-fun Unit!18924 () Unit!18922)

(assert (=> b!599928 (= e!342990 Unit!18924)))

(assert (=> b!599928 false))

(declare-fun b!599929 () Bool)

(declare-fun e!342994 () Bool)

(assert (=> b!599929 (= e!342994 true)))

(declare-fun lt!272809 () Bool)

(declare-datatypes ((List!11852 0))(
  ( (Nil!11849) (Cons!11848 (h!12893 (_ BitVec 64)) (t!18080 List!11852)) )
))
(declare-fun contains!2968 (List!11852 (_ BitVec 64)) Bool)

(assert (=> b!599929 (= lt!272809 (contains!2968 Nil!11849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599930 () Bool)

(declare-fun e!342999 () Bool)

(declare-fun e!342988 () Bool)

(assert (=> b!599930 (= e!342999 e!342988)))

(declare-fun res!384863 () Bool)

(assert (=> b!599930 (=> (not res!384863) (not e!342988))))

(assert (=> b!599930 (= res!384863 (and (= lt!272811 (Found!6251 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17811 a!2986) index!984) (select (arr!17811 a!2986) j!136))) (not (= (select (arr!17811 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37103 (_ BitVec 32)) SeekEntryResult!6251)

(assert (=> b!599930 (= lt!272811 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17811 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599931 () Bool)

(declare-fun res!384871 () Bool)

(assert (=> b!599931 (=> res!384871 e!342994)))

(declare-fun noDuplicate!285 (List!11852) Bool)

(assert (=> b!599931 (= res!384871 (not (noDuplicate!285 Nil!11849)))))

(declare-fun b!599932 () Bool)

(assert (=> b!599932 (= e!342997 e!342994)))

(declare-fun res!384861 () Bool)

(assert (=> b!599932 (=> res!384861 e!342994)))

(assert (=> b!599932 (= res!384861 (or (bvsge (size!18175 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18175 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37103 (_ BitVec 32) List!11852) Bool)

(assert (=> b!599932 (arrayNoDuplicates!0 lt!272808 j!136 Nil!11849)))

(declare-fun lt!272812 () Unit!18922)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37103 (_ BitVec 32) (_ BitVec 32)) Unit!18922)

(assert (=> b!599932 (= lt!272812 (lemmaNoDuplicateFromThenFromBigger!0 lt!272808 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599932 (arrayNoDuplicates!0 lt!272808 #b00000000000000000000000000000000 Nil!11849)))

(declare-fun lt!272802 () Unit!18922)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37103 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11852) Unit!18922)

(assert (=> b!599932 (= lt!272802 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11849))))

(assert (=> b!599932 (arrayContainsKey!0 lt!272808 (select (arr!17811 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272814 () Unit!18922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37103 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18922)

(assert (=> b!599932 (= lt!272814 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272808 (select (arr!17811 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599933 () Bool)

(assert (=> b!599933 (= e!342988 (not e!342992))))

(declare-fun res!384856 () Bool)

(assert (=> b!599933 (=> res!384856 e!342992)))

(declare-fun lt!272813 () SeekEntryResult!6251)

(assert (=> b!599933 (= res!384856 (not (= lt!272813 (Found!6251 index!984))))))

(declare-fun lt!272806 () Unit!18922)

(assert (=> b!599933 (= lt!272806 e!342990)))

(declare-fun c!67901 () Bool)

(assert (=> b!599933 (= c!67901 (= lt!272813 Undefined!6251))))

(assert (=> b!599933 (= lt!272813 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272807 lt!272808 mask!3053))))

(assert (=> b!599933 e!342987))

(declare-fun res!384870 () Bool)

(assert (=> b!599933 (=> (not res!384870) (not e!342987))))

(declare-fun lt!272804 () (_ BitVec 32))

(assert (=> b!599933 (= res!384870 (= lt!272810 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272804 vacantSpotIndex!68 lt!272807 lt!272808 mask!3053)))))

(assert (=> b!599933 (= lt!272810 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272804 vacantSpotIndex!68 (select (arr!17811 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599933 (= lt!272807 (select (store (arr!17811 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272805 () Unit!18922)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37103 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18922)

(assert (=> b!599933 (= lt!272805 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272804 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599933 (= lt!272804 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599934 () Bool)

(assert (=> b!599934 (= e!342998 e!342989)))

(declare-fun res!384857 () Bool)

(assert (=> b!599934 (=> (not res!384857) (not e!342989))))

(assert (=> b!599934 (= res!384857 (arrayContainsKey!0 lt!272808 (select (arr!17811 a!2986) j!136) j!136))))

(declare-fun b!599935 () Bool)

(assert (=> b!599935 (= e!342993 e!342999)))

(declare-fun res!384853 () Bool)

(assert (=> b!599935 (=> (not res!384853) (not e!342999))))

(assert (=> b!599935 (= res!384853 (= (select (store (arr!17811 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599935 (= lt!272808 (array!37104 (store (arr!17811 a!2986) i!1108 k!1786) (size!18175 a!2986)))))

(declare-fun b!599936 () Bool)

(declare-fun Unit!18925 () Unit!18922)

(assert (=> b!599936 (= e!342990 Unit!18925)))

(declare-fun b!599937 () Bool)

(declare-fun res!384855 () Bool)

(assert (=> b!599937 (=> (not res!384855) (not e!342993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37103 (_ BitVec 32)) Bool)

(assert (=> b!599937 (= res!384855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599938 () Bool)

(declare-fun res!384864 () Bool)

(assert (=> b!599938 (=> (not res!384864) (not e!342996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599938 (= res!384864 (validKeyInArray!0 (select (arr!17811 a!2986) j!136)))))

(declare-fun b!599939 () Bool)

(assert (=> b!599939 (= e!342996 e!342993)))

(declare-fun res!384867 () Bool)

(assert (=> b!599939 (=> (not res!384867) (not e!342993))))

(declare-fun lt!272803 () SeekEntryResult!6251)

(assert (=> b!599939 (= res!384867 (or (= lt!272803 (MissingZero!6251 i!1108)) (= lt!272803 (MissingVacant!6251 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37103 (_ BitVec 32)) SeekEntryResult!6251)

(assert (=> b!599939 (= lt!272803 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!599940 () Bool)

(declare-fun res!384865 () Bool)

(assert (=> b!599940 (=> res!384865 e!342994)))

(assert (=> b!599940 (= res!384865 (contains!2968 Nil!11849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599941 () Bool)

(declare-fun res!384858 () Bool)

(assert (=> b!599941 (=> (not res!384858) (not e!342996))))

(assert (=> b!599941 (= res!384858 (validKeyInArray!0 k!1786))))

(declare-fun b!599942 () Bool)

(declare-fun res!384859 () Bool)

(assert (=> b!599942 (=> (not res!384859) (not e!342993))))

(assert (=> b!599942 (= res!384859 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11849))))

(assert (= (and start!54868 res!384862) b!599922))

(assert (= (and b!599922 res!384860) b!599938))

(assert (= (and b!599938 res!384864) b!599941))

(assert (= (and b!599941 res!384858) b!599924))

(assert (= (and b!599924 res!384872) b!599939))

(assert (= (and b!599939 res!384867) b!599937))

(assert (= (and b!599937 res!384855) b!599942))

(assert (= (and b!599942 res!384859) b!599923))

(assert (= (and b!599923 res!384869) b!599935))

(assert (= (and b!599935 res!384853) b!599930))

(assert (= (and b!599930 res!384863) b!599933))

(assert (= (and b!599933 res!384870) b!599925))

(assert (= (and b!599933 c!67901) b!599928))

(assert (= (and b!599933 (not c!67901)) b!599936))

(assert (= (and b!599933 (not res!384856)) b!599921))

(assert (= (and b!599921 res!384868) b!599926))

(assert (= (and b!599926 (not res!384854)) b!599934))

(assert (= (and b!599934 res!384857) b!599927))

(assert (= (and b!599921 (not res!384866)) b!599932))

(assert (= (and b!599932 (not res!384861)) b!599931))

(assert (= (and b!599931 (not res!384871)) b!599940))

(assert (= (and b!599940 (not res!384865)) b!599929))

(declare-fun m!577157 () Bool)

(assert (=> b!599932 m!577157))

(declare-fun m!577159 () Bool)

(assert (=> b!599932 m!577159))

(declare-fun m!577161 () Bool)

(assert (=> b!599932 m!577161))

(declare-fun m!577163 () Bool)

(assert (=> b!599932 m!577163))

(declare-fun m!577165 () Bool)

(assert (=> b!599932 m!577165))

(declare-fun m!577167 () Bool)

(assert (=> b!599932 m!577167))

(assert (=> b!599932 m!577163))

(assert (=> b!599932 m!577163))

(declare-fun m!577169 () Bool)

(assert (=> b!599932 m!577169))

(assert (=> b!599927 m!577163))

(assert (=> b!599927 m!577163))

(declare-fun m!577171 () Bool)

(assert (=> b!599927 m!577171))

(declare-fun m!577173 () Bool)

(assert (=> b!599923 m!577173))

(declare-fun m!577175 () Bool)

(assert (=> b!599939 m!577175))

(declare-fun m!577177 () Bool)

(assert (=> b!599930 m!577177))

(assert (=> b!599930 m!577163))

(assert (=> b!599930 m!577163))

(declare-fun m!577179 () Bool)

(assert (=> b!599930 m!577179))

(declare-fun m!577181 () Bool)

(assert (=> b!599937 m!577181))

(declare-fun m!577183 () Bool)

(assert (=> b!599941 m!577183))

(declare-fun m!577185 () Bool)

(assert (=> b!599940 m!577185))

(declare-fun m!577187 () Bool)

(assert (=> b!599929 m!577187))

(declare-fun m!577189 () Bool)

(assert (=> start!54868 m!577189))

(declare-fun m!577191 () Bool)

(assert (=> start!54868 m!577191))

(assert (=> b!599934 m!577163))

(assert (=> b!599934 m!577163))

(declare-fun m!577193 () Bool)

(assert (=> b!599934 m!577193))

(declare-fun m!577195 () Bool)

(assert (=> b!599933 m!577195))

(assert (=> b!599933 m!577163))

(declare-fun m!577197 () Bool)

(assert (=> b!599933 m!577197))

(declare-fun m!577199 () Bool)

(assert (=> b!599933 m!577199))

(declare-fun m!577201 () Bool)

(assert (=> b!599933 m!577201))

(declare-fun m!577203 () Bool)

(assert (=> b!599933 m!577203))

(assert (=> b!599933 m!577163))

(declare-fun m!577205 () Bool)

(assert (=> b!599933 m!577205))

(declare-fun m!577207 () Bool)

(assert (=> b!599933 m!577207))

(declare-fun m!577209 () Bool)

(assert (=> b!599931 m!577209))

(declare-fun m!577211 () Bool)

(assert (=> b!599924 m!577211))

(assert (=> b!599921 m!577163))

(assert (=> b!599921 m!577197))

(declare-fun m!577213 () Bool)

(assert (=> b!599921 m!577213))

(declare-fun m!577215 () Bool)

(assert (=> b!599942 m!577215))

(assert (=> b!599935 m!577197))

(declare-fun m!577217 () Bool)

(assert (=> b!599935 m!577217))

(assert (=> b!599926 m!577163))

(assert (=> b!599938 m!577163))

(assert (=> b!599938 m!577163))

(declare-fun m!577219 () Bool)

(assert (=> b!599938 m!577219))

(push 1)

