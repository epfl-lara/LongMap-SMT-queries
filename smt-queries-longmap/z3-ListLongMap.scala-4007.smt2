; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54498 () Bool)

(assert start!54498)

(declare-fun b!594831 () Bool)

(declare-fun e!339846 () Bool)

(declare-fun e!339849 () Bool)

(assert (=> b!594831 (= e!339846 e!339849)))

(declare-fun res!380891 () Bool)

(assert (=> b!594831 (=> (not res!380891) (not e!339849))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6187 0))(
  ( (MissingZero!6187 (index!26996 (_ BitVec 32))) (Found!6187 (index!26997 (_ BitVec 32))) (Intermediate!6187 (undefined!6999 Bool) (index!26998 (_ BitVec 32)) (x!55810 (_ BitVec 32))) (Undefined!6187) (MissingVacant!6187 (index!26999 (_ BitVec 32))) )
))
(declare-fun lt!269960 () SeekEntryResult!6187)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36972 0))(
  ( (array!36973 (arr!17750 (Array (_ BitVec 32) (_ BitVec 64))) (size!18115 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36972)

(assert (=> b!594831 (= res!380891 (and (= lt!269960 (Found!6187 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17750 a!2986) index!984) (select (arr!17750 a!2986) j!136))) (not (= (select (arr!17750 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36972 (_ BitVec 32)) SeekEntryResult!6187)

(assert (=> b!594831 (= lt!269960 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17750 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594832 () Bool)

(declare-fun e!339845 () Bool)

(declare-fun e!339844 () Bool)

(assert (=> b!594832 (= e!339845 e!339844)))

(declare-fun res!380893 () Bool)

(assert (=> b!594832 (=> res!380893 e!339844)))

(assert (=> b!594832 (= res!380893 (or (bvsge (size!18115 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18115 a!2986))))))

(declare-fun lt!269971 () array!36972)

(declare-fun arrayContainsKey!0 (array!36972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594832 (arrayContainsKey!0 lt!269971 (select (arr!17750 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18660 0))(
  ( (Unit!18661) )
))
(declare-fun lt!269961 () Unit!18660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36972 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18660)

(assert (=> b!594832 (= lt!269961 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269971 (select (arr!17750 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594833 () Bool)

(declare-fun e!339841 () Bool)

(declare-fun e!339843 () Bool)

(assert (=> b!594833 (= e!339841 e!339843)))

(declare-fun res!380883 () Bool)

(assert (=> b!594833 (=> (not res!380883) (not e!339843))))

(assert (=> b!594833 (= res!380883 (arrayContainsKey!0 lt!269971 (select (arr!17750 a!2986) j!136) j!136))))

(declare-fun b!594834 () Bool)

(declare-fun res!380895 () Bool)

(assert (=> b!594834 (=> res!380895 e!339844)))

(declare-datatypes ((List!11830 0))(
  ( (Nil!11827) (Cons!11826 (h!12871 (_ BitVec 64)) (t!18049 List!11830)) )
))
(declare-fun contains!2914 (List!11830 (_ BitVec 64)) Bool)

(assert (=> b!594834 (= res!380895 (contains!2914 Nil!11827 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594835 () Bool)

(declare-fun res!380878 () Bool)

(declare-fun e!339842 () Bool)

(assert (=> b!594835 (=> (not res!380878) (not e!339842))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594835 (= res!380878 (validKeyInArray!0 k0!1786))))

(declare-fun b!594836 () Bool)

(declare-fun e!339848 () Bool)

(assert (=> b!594836 (= e!339848 e!339846)))

(declare-fun res!380892 () Bool)

(assert (=> b!594836 (=> (not res!380892) (not e!339846))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594836 (= res!380892 (= (select (store (arr!17750 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594836 (= lt!269971 (array!36973 (store (arr!17750 a!2986) i!1108 k0!1786) (size!18115 a!2986)))))

(declare-fun b!594837 () Bool)

(assert (=> b!594837 (= e!339844 true)))

(declare-fun lt!269968 () Bool)

(assert (=> b!594837 (= lt!269968 (contains!2914 Nil!11827 k0!1786))))

(declare-fun b!594838 () Bool)

(declare-fun res!380879 () Bool)

(assert (=> b!594838 (=> (not res!380879) (not e!339848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36972 (_ BitVec 32)) Bool)

(assert (=> b!594838 (= res!380879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594839 () Bool)

(assert (=> b!594839 (= e!339843 (arrayContainsKey!0 lt!269971 (select (arr!17750 a!2986) j!136) index!984))))

(declare-fun b!594840 () Bool)

(declare-fun res!380884 () Bool)

(assert (=> b!594840 (=> (not res!380884) (not e!339842))))

(assert (=> b!594840 (= res!380884 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!380887 () Bool)

(assert (=> start!54498 (=> (not res!380887) (not e!339842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54498 (= res!380887 (validMask!0 mask!3053))))

(assert (=> start!54498 e!339842))

(assert (=> start!54498 true))

(declare-fun array_inv!13633 (array!36972) Bool)

(assert (=> start!54498 (array_inv!13633 a!2986)))

(declare-fun b!594841 () Bool)

(declare-fun res!380897 () Bool)

(assert (=> b!594841 (=> (not res!380897) (not e!339842))))

(assert (=> b!594841 (= res!380897 (validKeyInArray!0 (select (arr!17750 a!2986) j!136)))))

(declare-fun b!594842 () Bool)

(declare-fun e!339840 () Bool)

(assert (=> b!594842 (= e!339840 e!339841)))

(declare-fun res!380896 () Bool)

(assert (=> b!594842 (=> res!380896 e!339841)))

(declare-fun lt!269969 () (_ BitVec 64))

(declare-fun lt!269962 () (_ BitVec 64))

(assert (=> b!594842 (= res!380896 (or (not (= (select (arr!17750 a!2986) j!136) lt!269962)) (not (= (select (arr!17750 a!2986) j!136) lt!269969)) (bvsge j!136 index!984)))))

(declare-fun b!594843 () Bool)

(declare-fun res!380886 () Bool)

(assert (=> b!594843 (=> (not res!380886) (not e!339842))))

(assert (=> b!594843 (= res!380886 (and (= (size!18115 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18115 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18115 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594844 () Bool)

(declare-fun res!380888 () Bool)

(assert (=> b!594844 (=> res!380888 e!339844)))

(declare-fun noDuplicate!251 (List!11830) Bool)

(assert (=> b!594844 (= res!380888 (not (noDuplicate!251 Nil!11827)))))

(declare-fun b!594845 () Bool)

(declare-fun res!380881 () Bool)

(assert (=> b!594845 (=> res!380881 e!339844)))

(assert (=> b!594845 (= res!380881 (contains!2914 Nil!11827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594846 () Bool)

(declare-fun e!339838 () Bool)

(assert (=> b!594846 (= e!339849 (not e!339838))))

(declare-fun res!380877 () Bool)

(assert (=> b!594846 (=> res!380877 e!339838)))

(declare-fun lt!269964 () SeekEntryResult!6187)

(assert (=> b!594846 (= res!380877 (not (= lt!269964 (Found!6187 index!984))))))

(declare-fun lt!269967 () Unit!18660)

(declare-fun e!339847 () Unit!18660)

(assert (=> b!594846 (= lt!269967 e!339847)))

(declare-fun c!67344 () Bool)

(assert (=> b!594846 (= c!67344 (= lt!269964 Undefined!6187))))

(assert (=> b!594846 (= lt!269964 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269962 lt!269971 mask!3053))))

(declare-fun e!339839 () Bool)

(assert (=> b!594846 e!339839))

(declare-fun res!380889 () Bool)

(assert (=> b!594846 (=> (not res!380889) (not e!339839))))

(declare-fun lt!269965 () SeekEntryResult!6187)

(declare-fun lt!269970 () (_ BitVec 32))

(assert (=> b!594846 (= res!380889 (= lt!269965 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269970 vacantSpotIndex!68 lt!269962 lt!269971 mask!3053)))))

(assert (=> b!594846 (= lt!269965 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269970 vacantSpotIndex!68 (select (arr!17750 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594846 (= lt!269962 (select (store (arr!17750 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269963 () Unit!18660)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36972 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18660)

(assert (=> b!594846 (= lt!269963 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269970 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594846 (= lt!269970 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594847 () Bool)

(assert (=> b!594847 (= e!339842 e!339848)))

(declare-fun res!380882 () Bool)

(assert (=> b!594847 (=> (not res!380882) (not e!339848))))

(declare-fun lt!269966 () SeekEntryResult!6187)

(assert (=> b!594847 (= res!380882 (or (= lt!269966 (MissingZero!6187 i!1108)) (= lt!269966 (MissingVacant!6187 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36972 (_ BitVec 32)) SeekEntryResult!6187)

(assert (=> b!594847 (= lt!269966 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!594848 () Bool)

(declare-fun Unit!18662 () Unit!18660)

(assert (=> b!594848 (= e!339847 Unit!18662)))

(declare-fun b!594849 () Bool)

(assert (=> b!594849 (= e!339838 e!339845)))

(declare-fun res!380894 () Bool)

(assert (=> b!594849 (=> res!380894 e!339845)))

(assert (=> b!594849 (= res!380894 (or (not (= (select (arr!17750 a!2986) j!136) lt!269962)) (not (= (select (arr!17750 a!2986) j!136) lt!269969)) (bvsge j!136 index!984)))))

(assert (=> b!594849 e!339840))

(declare-fun res!380885 () Bool)

(assert (=> b!594849 (=> (not res!380885) (not e!339840))))

(assert (=> b!594849 (= res!380885 (= lt!269969 (select (arr!17750 a!2986) j!136)))))

(assert (=> b!594849 (= lt!269969 (select (store (arr!17750 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!594850 () Bool)

(declare-fun Unit!18663 () Unit!18660)

(assert (=> b!594850 (= e!339847 Unit!18663)))

(assert (=> b!594850 false))

(declare-fun b!594851 () Bool)

(declare-fun res!380890 () Bool)

(assert (=> b!594851 (=> (not res!380890) (not e!339848))))

(declare-fun arrayNoDuplicates!0 (array!36972 (_ BitVec 32) List!11830) Bool)

(assert (=> b!594851 (= res!380890 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11827))))

(declare-fun b!594852 () Bool)

(declare-fun res!380880 () Bool)

(assert (=> b!594852 (=> (not res!380880) (not e!339848))))

(assert (=> b!594852 (= res!380880 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17750 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594853 () Bool)

(assert (=> b!594853 (= e!339839 (= lt!269960 lt!269965))))

(assert (= (and start!54498 res!380887) b!594843))

(assert (= (and b!594843 res!380886) b!594841))

(assert (= (and b!594841 res!380897) b!594835))

(assert (= (and b!594835 res!380878) b!594840))

(assert (= (and b!594840 res!380884) b!594847))

(assert (= (and b!594847 res!380882) b!594838))

(assert (= (and b!594838 res!380879) b!594851))

(assert (= (and b!594851 res!380890) b!594852))

(assert (= (and b!594852 res!380880) b!594836))

(assert (= (and b!594836 res!380892) b!594831))

(assert (= (and b!594831 res!380891) b!594846))

(assert (= (and b!594846 res!380889) b!594853))

(assert (= (and b!594846 c!67344) b!594850))

(assert (= (and b!594846 (not c!67344)) b!594848))

(assert (= (and b!594846 (not res!380877)) b!594849))

(assert (= (and b!594849 res!380885) b!594842))

(assert (= (and b!594842 (not res!380896)) b!594833))

(assert (= (and b!594833 res!380883) b!594839))

(assert (= (and b!594849 (not res!380894)) b!594832))

(assert (= (and b!594832 (not res!380893)) b!594844))

(assert (= (and b!594844 (not res!380888)) b!594845))

(assert (= (and b!594845 (not res!380881)) b!594834))

(assert (= (and b!594834 (not res!380895)) b!594837))

(declare-fun m!572035 () Bool)

(assert (=> b!594835 m!572035))

(declare-fun m!572037 () Bool)

(assert (=> b!594834 m!572037))

(declare-fun m!572039 () Bool)

(assert (=> b!594838 m!572039))

(declare-fun m!572041 () Bool)

(assert (=> b!594842 m!572041))

(declare-fun m!572043 () Bool)

(assert (=> b!594844 m!572043))

(declare-fun m!572045 () Bool)

(assert (=> b!594847 m!572045))

(declare-fun m!572047 () Bool)

(assert (=> b!594836 m!572047))

(declare-fun m!572049 () Bool)

(assert (=> b!594836 m!572049))

(declare-fun m!572051 () Bool)

(assert (=> b!594845 m!572051))

(assert (=> b!594849 m!572041))

(assert (=> b!594849 m!572047))

(declare-fun m!572053 () Bool)

(assert (=> b!594849 m!572053))

(declare-fun m!572055 () Bool)

(assert (=> start!54498 m!572055))

(declare-fun m!572057 () Bool)

(assert (=> start!54498 m!572057))

(assert (=> b!594839 m!572041))

(assert (=> b!594839 m!572041))

(declare-fun m!572059 () Bool)

(assert (=> b!594839 m!572059))

(assert (=> b!594833 m!572041))

(assert (=> b!594833 m!572041))

(declare-fun m!572061 () Bool)

(assert (=> b!594833 m!572061))

(declare-fun m!572063 () Bool)

(assert (=> b!594840 m!572063))

(assert (=> b!594832 m!572041))

(assert (=> b!594832 m!572041))

(declare-fun m!572065 () Bool)

(assert (=> b!594832 m!572065))

(assert (=> b!594832 m!572041))

(declare-fun m!572067 () Bool)

(assert (=> b!594832 m!572067))

(declare-fun m!572069 () Bool)

(assert (=> b!594831 m!572069))

(assert (=> b!594831 m!572041))

(assert (=> b!594831 m!572041))

(declare-fun m!572071 () Bool)

(assert (=> b!594831 m!572071))

(declare-fun m!572073 () Bool)

(assert (=> b!594851 m!572073))

(declare-fun m!572075 () Bool)

(assert (=> b!594846 m!572075))

(declare-fun m!572077 () Bool)

(assert (=> b!594846 m!572077))

(assert (=> b!594846 m!572041))

(assert (=> b!594846 m!572047))

(declare-fun m!572079 () Bool)

(assert (=> b!594846 m!572079))

(assert (=> b!594846 m!572041))

(declare-fun m!572081 () Bool)

(assert (=> b!594846 m!572081))

(declare-fun m!572083 () Bool)

(assert (=> b!594846 m!572083))

(declare-fun m!572085 () Bool)

(assert (=> b!594846 m!572085))

(declare-fun m!572087 () Bool)

(assert (=> b!594852 m!572087))

(assert (=> b!594841 m!572041))

(assert (=> b!594841 m!572041))

(declare-fun m!572089 () Bool)

(assert (=> b!594841 m!572089))

(declare-fun m!572091 () Bool)

(assert (=> b!594837 m!572091))

(check-sat (not b!594833) (not start!54498) (not b!594837) (not b!594845) (not b!594851) (not b!594838) (not b!594841) (not b!594832) (not b!594839) (not b!594844) (not b!594847) (not b!594835) (not b!594834) (not b!594831) (not b!594840) (not b!594846))
(check-sat)
