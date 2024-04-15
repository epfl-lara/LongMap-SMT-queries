; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58430 () Bool)

(assert start!58430)

(declare-fun b!645140 () Bool)

(declare-fun res!418052 () Bool)

(declare-fun e!369693 () Bool)

(assert (=> b!645140 (=> (not res!418052) (not e!369693))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38457 0))(
  ( (array!38458 (arr!18440 (Array (_ BitVec 32) (_ BitVec 64))) (size!18805 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38457)

(assert (=> b!645140 (= res!418052 (and (= (size!18805 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18805 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18805 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645141 () Bool)

(declare-fun e!369699 () Bool)

(declare-fun e!369707 () Bool)

(assert (=> b!645141 (= e!369699 e!369707)))

(declare-fun res!418046 () Bool)

(assert (=> b!645141 (=> res!418046 e!369707)))

(declare-fun lt!299048 () (_ BitVec 64))

(declare-fun lt!299041 () (_ BitVec 64))

(assert (=> b!645141 (= res!418046 (or (not (= (select (arr!18440 a!2986) j!136) lt!299041)) (not (= (select (arr!18440 a!2986) j!136) lt!299048))))))

(declare-fun e!369696 () Bool)

(assert (=> b!645141 e!369696))

(declare-fun res!418049 () Bool)

(assert (=> b!645141 (=> (not res!418049) (not e!369696))))

(assert (=> b!645141 (= res!418049 (= lt!299048 (select (arr!18440 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!645141 (= lt!299048 (select (store (arr!18440 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!645142 () Bool)

(declare-fun res!418045 () Bool)

(assert (=> b!645142 (=> (not res!418045) (not e!369693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645142 (= res!418045 (validKeyInArray!0 (select (arr!18440 a!2986) j!136)))))

(declare-fun b!645143 () Bool)

(declare-fun res!418057 () Bool)

(declare-fun e!369702 () Bool)

(assert (=> b!645143 (=> (not res!418057) (not e!369702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38457 (_ BitVec 32)) Bool)

(assert (=> b!645143 (= res!418057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645144 () Bool)

(declare-fun res!418042 () Bool)

(assert (=> b!645144 (=> (not res!418042) (not e!369693))))

(declare-fun arrayContainsKey!0 (array!38457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645144 (= res!418042 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645146 () Bool)

(declare-fun e!369698 () Bool)

(assert (=> b!645146 (= e!369698 (not e!369699))))

(declare-fun res!418043 () Bool)

(assert (=> b!645146 (=> res!418043 e!369699)))

(declare-datatypes ((SeekEntryResult!6877 0))(
  ( (MissingZero!6877 (index!29843 (_ BitVec 32))) (Found!6877 (index!29844 (_ BitVec 32))) (Intermediate!6877 (undefined!7689 Bool) (index!29845 (_ BitVec 32)) (x!58625 (_ BitVec 32))) (Undefined!6877) (MissingVacant!6877 (index!29846 (_ BitVec 32))) )
))
(declare-fun lt!299050 () SeekEntryResult!6877)

(assert (=> b!645146 (= res!418043 (not (= lt!299050 (Found!6877 index!984))))))

(declare-datatypes ((Unit!21890 0))(
  ( (Unit!21891) )
))
(declare-fun lt!299044 () Unit!21890)

(declare-fun e!369704 () Unit!21890)

(assert (=> b!645146 (= lt!299044 e!369704)))

(declare-fun c!73917 () Bool)

(assert (=> b!645146 (= c!73917 (= lt!299050 Undefined!6877))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!299051 () array!38457)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38457 (_ BitVec 32)) SeekEntryResult!6877)

(assert (=> b!645146 (= lt!299050 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299041 lt!299051 mask!3053))))

(declare-fun e!369701 () Bool)

(assert (=> b!645146 e!369701))

(declare-fun res!418050 () Bool)

(assert (=> b!645146 (=> (not res!418050) (not e!369701))))

(declare-fun lt!299039 () (_ BitVec 32))

(declare-fun lt!299049 () SeekEntryResult!6877)

(assert (=> b!645146 (= res!418050 (= lt!299049 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299039 vacantSpotIndex!68 lt!299041 lt!299051 mask!3053)))))

(assert (=> b!645146 (= lt!299049 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299039 vacantSpotIndex!68 (select (arr!18440 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645146 (= lt!299041 (select (store (arr!18440 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299043 () Unit!21890)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21890)

(assert (=> b!645146 (= lt!299043 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299039 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645146 (= lt!299039 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645147 () Bool)

(declare-fun e!369706 () Bool)

(assert (=> b!645147 (= e!369707 e!369706)))

(declare-fun res!418056 () Bool)

(assert (=> b!645147 (=> res!418056 e!369706)))

(assert (=> b!645147 (= res!418056 (bvsge index!984 j!136))))

(declare-fun lt!299052 () Unit!21890)

(declare-fun e!369700 () Unit!21890)

(assert (=> b!645147 (= lt!299052 e!369700)))

(declare-fun c!73916 () Bool)

(assert (=> b!645147 (= c!73916 (bvslt j!136 index!984))))

(declare-fun b!645148 () Bool)

(declare-fun Unit!21892 () Unit!21890)

(assert (=> b!645148 (= e!369704 Unit!21892)))

(assert (=> b!645148 false))

(declare-fun b!645149 () Bool)

(declare-fun e!369697 () Bool)

(declare-fun e!369694 () Bool)

(assert (=> b!645149 (= e!369697 e!369694)))

(declare-fun res!418047 () Bool)

(assert (=> b!645149 (=> (not res!418047) (not e!369694))))

(assert (=> b!645149 (= res!418047 (arrayContainsKey!0 lt!299051 (select (arr!18440 a!2986) j!136) j!136))))

(declare-fun b!645150 () Bool)

(assert (=> b!645150 (= e!369694 (arrayContainsKey!0 lt!299051 (select (arr!18440 a!2986) j!136) index!984))))

(declare-fun b!645151 () Bool)

(assert (=> b!645151 (= e!369706 true)))

(assert (=> b!645151 (arrayContainsKey!0 lt!299051 (select (arr!18440 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299046 () Unit!21890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38457 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21890)

(assert (=> b!645151 (= lt!299046 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299051 (select (arr!18440 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!369695 () Bool)

(assert (=> b!645151 e!369695))

(declare-fun res!418053 () Bool)

(assert (=> b!645151 (=> (not res!418053) (not e!369695))))

(assert (=> b!645151 (= res!418053 (arrayContainsKey!0 lt!299051 (select (arr!18440 a!2986) j!136) j!136))))

(declare-fun b!645152 () Bool)

(declare-fun res!418048 () Bool)

(assert (=> b!645152 (=> (not res!418048) (not e!369693))))

(assert (=> b!645152 (= res!418048 (validKeyInArray!0 k0!1786))))

(declare-fun b!645153 () Bool)

(declare-fun e!369703 () Bool)

(assert (=> b!645153 (= e!369703 e!369698)))

(declare-fun res!418054 () Bool)

(assert (=> b!645153 (=> (not res!418054) (not e!369698))))

(declare-fun lt!299045 () SeekEntryResult!6877)

(assert (=> b!645153 (= res!418054 (and (= lt!299045 (Found!6877 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18440 a!2986) index!984) (select (arr!18440 a!2986) j!136))) (not (= (select (arr!18440 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645153 (= lt!299045 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18440 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645154 () Bool)

(assert (=> b!645154 (= e!369696 e!369697)))

(declare-fun res!418055 () Bool)

(assert (=> b!645154 (=> res!418055 e!369697)))

(assert (=> b!645154 (= res!418055 (or (not (= (select (arr!18440 a!2986) j!136) lt!299041)) (not (= (select (arr!18440 a!2986) j!136) lt!299048)) (bvsge j!136 index!984)))))

(declare-fun b!645155 () Bool)

(declare-fun Unit!21893 () Unit!21890)

(assert (=> b!645155 (= e!369700 Unit!21893)))

(declare-fun b!645156 () Bool)

(declare-fun res!418060 () Bool)

(assert (=> b!645156 (=> (not res!418060) (not e!369702))))

(assert (=> b!645156 (= res!418060 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18440 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645157 () Bool)

(assert (=> b!645157 (= e!369695 (arrayContainsKey!0 lt!299051 (select (arr!18440 a!2986) j!136) index!984))))

(declare-fun b!645158 () Bool)

(declare-fun Unit!21894 () Unit!21890)

(assert (=> b!645158 (= e!369704 Unit!21894)))

(declare-fun b!645145 () Bool)

(declare-fun Unit!21895 () Unit!21890)

(assert (=> b!645145 (= e!369700 Unit!21895)))

(declare-fun lt!299047 () Unit!21890)

(assert (=> b!645145 (= lt!299047 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299051 (select (arr!18440 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645145 (arrayContainsKey!0 lt!299051 (select (arr!18440 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299040 () Unit!21890)

(declare-datatypes ((List!12520 0))(
  ( (Nil!12517) (Cons!12516 (h!13561 (_ BitVec 64)) (t!18739 List!12520)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38457 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12520) Unit!21890)

(assert (=> b!645145 (= lt!299040 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12517))))

(declare-fun arrayNoDuplicates!0 (array!38457 (_ BitVec 32) List!12520) Bool)

(assert (=> b!645145 (arrayNoDuplicates!0 lt!299051 #b00000000000000000000000000000000 Nil!12517)))

(declare-fun lt!299042 () Unit!21890)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38457 (_ BitVec 32) (_ BitVec 32)) Unit!21890)

(assert (=> b!645145 (= lt!299042 (lemmaNoDuplicateFromThenFromBigger!0 lt!299051 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645145 (arrayNoDuplicates!0 lt!299051 j!136 Nil!12517)))

(declare-fun lt!299037 () Unit!21890)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38457 (_ BitVec 64) (_ BitVec 32) List!12520) Unit!21890)

(assert (=> b!645145 (= lt!299037 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299051 (select (arr!18440 a!2986) j!136) j!136 Nil!12517))))

(assert (=> b!645145 false))

(declare-fun res!418044 () Bool)

(assert (=> start!58430 (=> (not res!418044) (not e!369693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58430 (= res!418044 (validMask!0 mask!3053))))

(assert (=> start!58430 e!369693))

(assert (=> start!58430 true))

(declare-fun array_inv!14323 (array!38457) Bool)

(assert (=> start!58430 (array_inv!14323 a!2986)))

(declare-fun b!645159 () Bool)

(declare-fun res!418058 () Bool)

(assert (=> b!645159 (=> (not res!418058) (not e!369702))))

(assert (=> b!645159 (= res!418058 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12517))))

(declare-fun b!645160 () Bool)

(assert (=> b!645160 (= e!369702 e!369703)))

(declare-fun res!418051 () Bool)

(assert (=> b!645160 (=> (not res!418051) (not e!369703))))

(assert (=> b!645160 (= res!418051 (= (select (store (arr!18440 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645160 (= lt!299051 (array!38458 (store (arr!18440 a!2986) i!1108 k0!1786) (size!18805 a!2986)))))

(declare-fun b!645161 () Bool)

(assert (=> b!645161 (= e!369693 e!369702)))

(declare-fun res!418059 () Bool)

(assert (=> b!645161 (=> (not res!418059) (not e!369702))))

(declare-fun lt!299038 () SeekEntryResult!6877)

(assert (=> b!645161 (= res!418059 (or (= lt!299038 (MissingZero!6877 i!1108)) (= lt!299038 (MissingVacant!6877 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38457 (_ BitVec 32)) SeekEntryResult!6877)

(assert (=> b!645161 (= lt!299038 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!645162 () Bool)

(assert (=> b!645162 (= e!369701 (= lt!299045 lt!299049))))

(assert (= (and start!58430 res!418044) b!645140))

(assert (= (and b!645140 res!418052) b!645142))

(assert (= (and b!645142 res!418045) b!645152))

(assert (= (and b!645152 res!418048) b!645144))

(assert (= (and b!645144 res!418042) b!645161))

(assert (= (and b!645161 res!418059) b!645143))

(assert (= (and b!645143 res!418057) b!645159))

(assert (= (and b!645159 res!418058) b!645156))

(assert (= (and b!645156 res!418060) b!645160))

(assert (= (and b!645160 res!418051) b!645153))

(assert (= (and b!645153 res!418054) b!645146))

(assert (= (and b!645146 res!418050) b!645162))

(assert (= (and b!645146 c!73917) b!645148))

(assert (= (and b!645146 (not c!73917)) b!645158))

(assert (= (and b!645146 (not res!418043)) b!645141))

(assert (= (and b!645141 res!418049) b!645154))

(assert (= (and b!645154 (not res!418055)) b!645149))

(assert (= (and b!645149 res!418047) b!645150))

(assert (= (and b!645141 (not res!418046)) b!645147))

(assert (= (and b!645147 c!73916) b!645145))

(assert (= (and b!645147 (not c!73916)) b!645155))

(assert (= (and b!645147 (not res!418056)) b!645151))

(assert (= (and b!645151 res!418053) b!645157))

(declare-fun m!618171 () Bool)

(assert (=> b!645141 m!618171))

(declare-fun m!618173 () Bool)

(assert (=> b!645141 m!618173))

(declare-fun m!618175 () Bool)

(assert (=> b!645141 m!618175))

(declare-fun m!618177 () Bool)

(assert (=> start!58430 m!618177))

(declare-fun m!618179 () Bool)

(assert (=> start!58430 m!618179))

(assert (=> b!645145 m!618171))

(declare-fun m!618181 () Bool)

(assert (=> b!645145 m!618181))

(assert (=> b!645145 m!618171))

(assert (=> b!645145 m!618171))

(declare-fun m!618183 () Bool)

(assert (=> b!645145 m!618183))

(assert (=> b!645145 m!618171))

(declare-fun m!618185 () Bool)

(assert (=> b!645145 m!618185))

(declare-fun m!618187 () Bool)

(assert (=> b!645145 m!618187))

(declare-fun m!618189 () Bool)

(assert (=> b!645145 m!618189))

(declare-fun m!618191 () Bool)

(assert (=> b!645145 m!618191))

(declare-fun m!618193 () Bool)

(assert (=> b!645145 m!618193))

(assert (=> b!645150 m!618171))

(assert (=> b!645150 m!618171))

(declare-fun m!618195 () Bool)

(assert (=> b!645150 m!618195))

(declare-fun m!618197 () Bool)

(assert (=> b!645159 m!618197))

(declare-fun m!618199 () Bool)

(assert (=> b!645143 m!618199))

(assert (=> b!645151 m!618171))

(assert (=> b!645151 m!618171))

(declare-fun m!618201 () Bool)

(assert (=> b!645151 m!618201))

(assert (=> b!645151 m!618171))

(declare-fun m!618203 () Bool)

(assert (=> b!645151 m!618203))

(assert (=> b!645151 m!618171))

(declare-fun m!618205 () Bool)

(assert (=> b!645151 m!618205))

(assert (=> b!645142 m!618171))

(assert (=> b!645142 m!618171))

(declare-fun m!618207 () Bool)

(assert (=> b!645142 m!618207))

(assert (=> b!645154 m!618171))

(declare-fun m!618209 () Bool)

(assert (=> b!645156 m!618209))

(declare-fun m!618211 () Bool)

(assert (=> b!645144 m!618211))

(declare-fun m!618213 () Bool)

(assert (=> b!645161 m!618213))

(declare-fun m!618215 () Bool)

(assert (=> b!645152 m!618215))

(assert (=> b!645157 m!618171))

(assert (=> b!645157 m!618171))

(assert (=> b!645157 m!618195))

(assert (=> b!645149 m!618171))

(assert (=> b!645149 m!618171))

(assert (=> b!645149 m!618205))

(assert (=> b!645160 m!618173))

(declare-fun m!618217 () Bool)

(assert (=> b!645160 m!618217))

(declare-fun m!618219 () Bool)

(assert (=> b!645153 m!618219))

(assert (=> b!645153 m!618171))

(assert (=> b!645153 m!618171))

(declare-fun m!618221 () Bool)

(assert (=> b!645153 m!618221))

(declare-fun m!618223 () Bool)

(assert (=> b!645146 m!618223))

(declare-fun m!618225 () Bool)

(assert (=> b!645146 m!618225))

(assert (=> b!645146 m!618171))

(declare-fun m!618227 () Bool)

(assert (=> b!645146 m!618227))

(assert (=> b!645146 m!618173))

(assert (=> b!645146 m!618171))

(declare-fun m!618229 () Bool)

(assert (=> b!645146 m!618229))

(declare-fun m!618231 () Bool)

(assert (=> b!645146 m!618231))

(declare-fun m!618233 () Bool)

(assert (=> b!645146 m!618233))

(check-sat (not b!645150) (not start!58430) (not b!645159) (not b!645142) (not b!645143) (not b!645145) (not b!645149) (not b!645152) (not b!645153) (not b!645144) (not b!645157) (not b!645151) (not b!645161) (not b!645146))
(check-sat)
