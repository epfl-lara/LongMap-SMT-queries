; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54874 () Bool)

(assert start!54874)

(declare-fun b!600119 () Bool)

(declare-datatypes ((Unit!18934 0))(
  ( (Unit!18935) )
))
(declare-fun e!343108 () Unit!18934)

(declare-fun Unit!18936 () Unit!18934)

(assert (=> b!600119 (= e!343108 Unit!18936)))

(declare-fun b!600120 () Bool)

(declare-fun e!343107 () Bool)

(assert (=> b!600120 (= e!343107 true)))

(declare-fun lt!272940 () Bool)

(declare-datatypes ((List!11855 0))(
  ( (Nil!11852) (Cons!11851 (h!12896 (_ BitVec 64)) (t!18083 List!11855)) )
))
(declare-fun contains!2971 (List!11855 (_ BitVec 64)) Bool)

(assert (=> b!600120 (= lt!272940 (contains!2971 Nil!11852 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600121 () Bool)

(declare-fun e!343106 () Bool)

(declare-fun e!343110 () Bool)

(assert (=> b!600121 (= e!343106 e!343110)))

(declare-fun res!385046 () Bool)

(assert (=> b!600121 (=> (not res!385046) (not e!343110))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37109 0))(
  ( (array!37110 (arr!17814 (Array (_ BitVec 32) (_ BitVec 64))) (size!18178 (_ BitVec 32))) )
))
(declare-fun lt!272929 () array!37109)

(declare-fun a!2986 () array!37109)

(declare-fun arrayContainsKey!0 (array!37109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600121 (= res!385046 (arrayContainsKey!0 lt!272929 (select (arr!17814 a!2986) j!136) j!136))))

(declare-fun b!600122 () Bool)

(declare-fun res!385034 () Bool)

(declare-fun e!343113 () Bool)

(assert (=> b!600122 (=> (not res!385034) (not e!343113))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600122 (= res!385034 (validKeyInArray!0 k!1786))))

(declare-fun b!600123 () Bool)

(declare-fun res!385052 () Bool)

(declare-fun e!343105 () Bool)

(assert (=> b!600123 (=> (not res!385052) (not e!343105))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600123 (= res!385052 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17814 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600124 () Bool)

(declare-fun res!385048 () Bool)

(assert (=> b!600124 (=> (not res!385048) (not e!343105))))

(declare-fun arrayNoDuplicates!0 (array!37109 (_ BitVec 32) List!11855) Bool)

(assert (=> b!600124 (= res!385048 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11852))))

(declare-fun b!600125 () Bool)

(declare-fun e!343111 () Bool)

(declare-fun e!343109 () Bool)

(assert (=> b!600125 (= e!343111 (not e!343109))))

(declare-fun res!385044 () Bool)

(assert (=> b!600125 (=> res!385044 e!343109)))

(declare-datatypes ((SeekEntryResult!6254 0))(
  ( (MissingZero!6254 (index!27273 (_ BitVec 32))) (Found!6254 (index!27274 (_ BitVec 32))) (Intermediate!6254 (undefined!7066 Bool) (index!27275 (_ BitVec 32)) (x!56077 (_ BitVec 32))) (Undefined!6254) (MissingVacant!6254 (index!27276 (_ BitVec 32))) )
))
(declare-fun lt!272937 () SeekEntryResult!6254)

(assert (=> b!600125 (= res!385044 (not (= lt!272937 (Found!6254 index!984))))))

(declare-fun lt!272938 () Unit!18934)

(assert (=> b!600125 (= lt!272938 e!343108)))

(declare-fun c!67910 () Bool)

(assert (=> b!600125 (= c!67910 (= lt!272937 Undefined!6254))))

(declare-fun lt!272932 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37109 (_ BitVec 32)) SeekEntryResult!6254)

(assert (=> b!600125 (= lt!272937 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272932 lt!272929 mask!3053))))

(declare-fun e!343115 () Bool)

(assert (=> b!600125 e!343115))

(declare-fun res!385036 () Bool)

(assert (=> b!600125 (=> (not res!385036) (not e!343115))))

(declare-fun lt!272939 () SeekEntryResult!6254)

(declare-fun lt!272933 () (_ BitVec 32))

(assert (=> b!600125 (= res!385036 (= lt!272939 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272933 vacantSpotIndex!68 lt!272932 lt!272929 mask!3053)))))

(assert (=> b!600125 (= lt!272939 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272933 vacantSpotIndex!68 (select (arr!17814 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!600125 (= lt!272932 (select (store (arr!17814 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272934 () Unit!18934)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37109 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18934)

(assert (=> b!600125 (= lt!272934 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272933 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600125 (= lt!272933 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!385051 () Bool)

(assert (=> start!54874 (=> (not res!385051) (not e!343113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54874 (= res!385051 (validMask!0 mask!3053))))

(assert (=> start!54874 e!343113))

(assert (=> start!54874 true))

(declare-fun array_inv!13610 (array!37109) Bool)

(assert (=> start!54874 (array_inv!13610 a!2986)))

(declare-fun b!600126 () Bool)

(declare-fun res!385035 () Bool)

(assert (=> b!600126 (=> (not res!385035) (not e!343113))))

(assert (=> b!600126 (= res!385035 (and (= (size!18178 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18178 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18178 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600127 () Bool)

(declare-fun e!343104 () Bool)

(assert (=> b!600127 (= e!343104 e!343107)))

(declare-fun res!385047 () Bool)

(assert (=> b!600127 (=> res!385047 e!343107)))

(assert (=> b!600127 (= res!385047 (or (bvsge (size!18178 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18178 a!2986))))))

(assert (=> b!600127 (arrayNoDuplicates!0 lt!272929 j!136 Nil!11852)))

(declare-fun lt!272931 () Unit!18934)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37109 (_ BitVec 32) (_ BitVec 32)) Unit!18934)

(assert (=> b!600127 (= lt!272931 (lemmaNoDuplicateFromThenFromBigger!0 lt!272929 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600127 (arrayNoDuplicates!0 lt!272929 #b00000000000000000000000000000000 Nil!11852)))

(declare-fun lt!272930 () Unit!18934)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37109 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11855) Unit!18934)

(assert (=> b!600127 (= lt!272930 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11852))))

(assert (=> b!600127 (arrayContainsKey!0 lt!272929 (select (arr!17814 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272941 () Unit!18934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37109 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18934)

(assert (=> b!600127 (= lt!272941 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272929 (select (arr!17814 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600128 () Bool)

(assert (=> b!600128 (= e!343110 (arrayContainsKey!0 lt!272929 (select (arr!17814 a!2986) j!136) index!984))))

(declare-fun b!600129 () Bool)

(declare-fun e!343114 () Bool)

(assert (=> b!600129 (= e!343105 e!343114)))

(declare-fun res!385037 () Bool)

(assert (=> b!600129 (=> (not res!385037) (not e!343114))))

(assert (=> b!600129 (= res!385037 (= (select (store (arr!17814 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600129 (= lt!272929 (array!37110 (store (arr!17814 a!2986) i!1108 k!1786) (size!18178 a!2986)))))

(declare-fun b!600130 () Bool)

(declare-fun res!385033 () Bool)

(assert (=> b!600130 (=> (not res!385033) (not e!343113))))

(assert (=> b!600130 (= res!385033 (validKeyInArray!0 (select (arr!17814 a!2986) j!136)))))

(declare-fun b!600131 () Bool)

(declare-fun Unit!18937 () Unit!18934)

(assert (=> b!600131 (= e!343108 Unit!18937)))

(assert (=> b!600131 false))

(declare-fun b!600132 () Bool)

(assert (=> b!600132 (= e!343113 e!343105)))

(declare-fun res!385050 () Bool)

(assert (=> b!600132 (=> (not res!385050) (not e!343105))))

(declare-fun lt!272935 () SeekEntryResult!6254)

(assert (=> b!600132 (= res!385050 (or (= lt!272935 (MissingZero!6254 i!1108)) (= lt!272935 (MissingVacant!6254 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37109 (_ BitVec 32)) SeekEntryResult!6254)

(assert (=> b!600132 (= lt!272935 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!600133 () Bool)

(declare-fun res!385049 () Bool)

(assert (=> b!600133 (=> res!385049 e!343107)))

(declare-fun noDuplicate!288 (List!11855) Bool)

(assert (=> b!600133 (= res!385049 (not (noDuplicate!288 Nil!11852)))))

(declare-fun b!600134 () Bool)

(declare-fun e!343116 () Bool)

(assert (=> b!600134 (= e!343116 e!343106)))

(declare-fun res!385039 () Bool)

(assert (=> b!600134 (=> res!385039 e!343106)))

(declare-fun lt!272936 () (_ BitVec 64))

(assert (=> b!600134 (= res!385039 (or (not (= (select (arr!17814 a!2986) j!136) lt!272932)) (not (= (select (arr!17814 a!2986) j!136) lt!272936)) (bvsge j!136 index!984)))))

(declare-fun b!600135 () Bool)

(declare-fun res!385045 () Bool)

(assert (=> b!600135 (=> (not res!385045) (not e!343113))))

(assert (=> b!600135 (= res!385045 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600136 () Bool)

(declare-fun lt!272928 () SeekEntryResult!6254)

(assert (=> b!600136 (= e!343115 (= lt!272928 lt!272939))))

(declare-fun b!600137 () Bool)

(declare-fun res!385040 () Bool)

(assert (=> b!600137 (=> res!385040 e!343107)))

(assert (=> b!600137 (= res!385040 (contains!2971 Nil!11852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600138 () Bool)

(assert (=> b!600138 (= e!343109 e!343104)))

(declare-fun res!385043 () Bool)

(assert (=> b!600138 (=> res!385043 e!343104)))

(assert (=> b!600138 (= res!385043 (or (not (= (select (arr!17814 a!2986) j!136) lt!272932)) (not (= (select (arr!17814 a!2986) j!136) lt!272936)) (bvsge j!136 index!984)))))

(assert (=> b!600138 e!343116))

(declare-fun res!385041 () Bool)

(assert (=> b!600138 (=> (not res!385041) (not e!343116))))

(assert (=> b!600138 (= res!385041 (= lt!272936 (select (arr!17814 a!2986) j!136)))))

(assert (=> b!600138 (= lt!272936 (select (store (arr!17814 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!600139 () Bool)

(assert (=> b!600139 (= e!343114 e!343111)))

(declare-fun res!385042 () Bool)

(assert (=> b!600139 (=> (not res!385042) (not e!343111))))

(assert (=> b!600139 (= res!385042 (and (= lt!272928 (Found!6254 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17814 a!2986) index!984) (select (arr!17814 a!2986) j!136))) (not (= (select (arr!17814 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600139 (= lt!272928 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17814 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600140 () Bool)

(declare-fun res!385038 () Bool)

(assert (=> b!600140 (=> (not res!385038) (not e!343105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37109 (_ BitVec 32)) Bool)

(assert (=> b!600140 (= res!385038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!54874 res!385051) b!600126))

(assert (= (and b!600126 res!385035) b!600130))

(assert (= (and b!600130 res!385033) b!600122))

(assert (= (and b!600122 res!385034) b!600135))

(assert (= (and b!600135 res!385045) b!600132))

(assert (= (and b!600132 res!385050) b!600140))

(assert (= (and b!600140 res!385038) b!600124))

(assert (= (and b!600124 res!385048) b!600123))

(assert (= (and b!600123 res!385052) b!600129))

(assert (= (and b!600129 res!385037) b!600139))

(assert (= (and b!600139 res!385042) b!600125))

(assert (= (and b!600125 res!385036) b!600136))

(assert (= (and b!600125 c!67910) b!600131))

(assert (= (and b!600125 (not c!67910)) b!600119))

(assert (= (and b!600125 (not res!385044)) b!600138))

(assert (= (and b!600138 res!385041) b!600134))

(assert (= (and b!600134 (not res!385039)) b!600121))

(assert (= (and b!600121 res!385046) b!600128))

(assert (= (and b!600138 (not res!385043)) b!600127))

(assert (= (and b!600127 (not res!385047)) b!600133))

(assert (= (and b!600133 (not res!385049)) b!600137))

(assert (= (and b!600137 (not res!385040)) b!600120))

(declare-fun m!577349 () Bool)

(assert (=> b!600134 m!577349))

(assert (=> b!600130 m!577349))

(assert (=> b!600130 m!577349))

(declare-fun m!577351 () Bool)

(assert (=> b!600130 m!577351))

(declare-fun m!577353 () Bool)

(assert (=> b!600137 m!577353))

(assert (=> b!600128 m!577349))

(assert (=> b!600128 m!577349))

(declare-fun m!577355 () Bool)

(assert (=> b!600128 m!577355))

(assert (=> b!600121 m!577349))

(assert (=> b!600121 m!577349))

(declare-fun m!577357 () Bool)

(assert (=> b!600121 m!577357))

(declare-fun m!577359 () Bool)

(assert (=> b!600129 m!577359))

(declare-fun m!577361 () Bool)

(assert (=> b!600129 m!577361))

(declare-fun m!577363 () Bool)

(assert (=> start!54874 m!577363))

(declare-fun m!577365 () Bool)

(assert (=> start!54874 m!577365))

(declare-fun m!577367 () Bool)

(assert (=> b!600122 m!577367))

(declare-fun m!577369 () Bool)

(assert (=> b!600120 m!577369))

(declare-fun m!577371 () Bool)

(assert (=> b!600123 m!577371))

(declare-fun m!577373 () Bool)

(assert (=> b!600135 m!577373))

(assert (=> b!600138 m!577349))

(assert (=> b!600138 m!577359))

(declare-fun m!577375 () Bool)

(assert (=> b!600138 m!577375))

(declare-fun m!577377 () Bool)

(assert (=> b!600124 m!577377))

(declare-fun m!577379 () Bool)

(assert (=> b!600140 m!577379))

(declare-fun m!577381 () Bool)

(assert (=> b!600139 m!577381))

(assert (=> b!600139 m!577349))

(assert (=> b!600139 m!577349))

(declare-fun m!577383 () Bool)

(assert (=> b!600139 m!577383))

(declare-fun m!577385 () Bool)

(assert (=> b!600125 m!577385))

(declare-fun m!577387 () Bool)

(assert (=> b!600125 m!577387))

(assert (=> b!600125 m!577349))

(declare-fun m!577389 () Bool)

(assert (=> b!600125 m!577389))

(assert (=> b!600125 m!577359))

(assert (=> b!600125 m!577349))

(declare-fun m!577391 () Bool)

(assert (=> b!600125 m!577391))

(declare-fun m!577393 () Bool)

(assert (=> b!600125 m!577393))

(declare-fun m!577395 () Bool)

(assert (=> b!600125 m!577395))

(declare-fun m!577397 () Bool)

(assert (=> b!600133 m!577397))

(assert (=> b!600127 m!577349))

(declare-fun m!577399 () Bool)

(assert (=> b!600127 m!577399))

(declare-fun m!577401 () Bool)

(assert (=> b!600127 m!577401))

(declare-fun m!577403 () Bool)

(assert (=> b!600127 m!577403))

(assert (=> b!600127 m!577349))

(declare-fun m!577405 () Bool)

(assert (=> b!600127 m!577405))

(declare-fun m!577407 () Bool)

(assert (=> b!600127 m!577407))

(declare-fun m!577409 () Bool)

(assert (=> b!600127 m!577409))

(assert (=> b!600127 m!577349))

(declare-fun m!577411 () Bool)

(assert (=> b!600132 m!577411))

(push 1)

