; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54872 () Bool)

(assert start!54872)

(declare-fun b!600053 () Bool)

(declare-fun res!384991 () Bool)

(declare-fun e!343068 () Bool)

(assert (=> b!600053 (=> (not res!384991) (not e!343068))))

(declare-datatypes ((array!37107 0))(
  ( (array!37108 (arr!17813 (Array (_ BitVec 32) (_ BitVec 64))) (size!18177 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37107)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37107 (_ BitVec 32)) Bool)

(assert (=> b!600053 (= res!384991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600054 () Bool)

(declare-fun e!343074 () Bool)

(declare-datatypes ((SeekEntryResult!6253 0))(
  ( (MissingZero!6253 (index!27269 (_ BitVec 32))) (Found!6253 (index!27270 (_ BitVec 32))) (Intermediate!6253 (undefined!7065 Bool) (index!27271 (_ BitVec 32)) (x!56068 (_ BitVec 32))) (Undefined!6253) (MissingVacant!6253 (index!27272 (_ BitVec 32))) )
))
(declare-fun lt!272892 () SeekEntryResult!6253)

(declare-fun lt!272887 () SeekEntryResult!6253)

(assert (=> b!600054 (= e!343074 (= lt!272892 lt!272887))))

(declare-fun b!600055 () Bool)

(declare-datatypes ((Unit!18930 0))(
  ( (Unit!18931) )
))
(declare-fun e!343076 () Unit!18930)

(declare-fun Unit!18932 () Unit!18930)

(assert (=> b!600055 (= e!343076 Unit!18932)))

(assert (=> b!600055 false))

(declare-fun b!600056 () Bool)

(declare-fun e!343070 () Bool)

(declare-fun e!343073 () Bool)

(assert (=> b!600056 (= e!343070 (not e!343073))))

(declare-fun res!384986 () Bool)

(assert (=> b!600056 (=> res!384986 e!343073)))

(declare-fun lt!272893 () SeekEntryResult!6253)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600056 (= res!384986 (not (= lt!272893 (Found!6253 index!984))))))

(declare-fun lt!272896 () Unit!18930)

(assert (=> b!600056 (= lt!272896 e!343076)))

(declare-fun c!67907 () Bool)

(assert (=> b!600056 (= c!67907 (= lt!272893 Undefined!6253))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!272899 () array!37107)

(declare-fun lt!272894 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37107 (_ BitVec 32)) SeekEntryResult!6253)

(assert (=> b!600056 (= lt!272893 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272894 lt!272899 mask!3053))))

(assert (=> b!600056 e!343074))

(declare-fun res!384980 () Bool)

(assert (=> b!600056 (=> (not res!384980) (not e!343074))))

(declare-fun lt!272889 () (_ BitVec 32))

(assert (=> b!600056 (= res!384980 (= lt!272887 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272889 vacantSpotIndex!68 lt!272894 lt!272899 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!600056 (= lt!272887 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272889 vacantSpotIndex!68 (select (arr!17813 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!600056 (= lt!272894 (select (store (arr!17813 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272897 () Unit!18930)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37107 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18930)

(assert (=> b!600056 (= lt!272897 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272889 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600056 (= lt!272889 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600057 () Bool)

(declare-fun e!343075 () Bool)

(declare-fun e!343065 () Bool)

(assert (=> b!600057 (= e!343075 e!343065)))

(declare-fun res!384979 () Bool)

(assert (=> b!600057 (=> res!384979 e!343065)))

(declare-fun lt!272895 () (_ BitVec 64))

(assert (=> b!600057 (= res!384979 (or (not (= (select (arr!17813 a!2986) j!136) lt!272894)) (not (= (select (arr!17813 a!2986) j!136) lt!272895)) (bvsge j!136 index!984)))))

(declare-fun b!600058 () Bool)

(declare-fun res!384989 () Bool)

(declare-fun e!343077 () Bool)

(assert (=> b!600058 (=> res!384989 e!343077)))

(declare-datatypes ((List!11854 0))(
  ( (Nil!11851) (Cons!11850 (h!12895 (_ BitVec 64)) (t!18082 List!11854)) )
))
(declare-fun noDuplicate!287 (List!11854) Bool)

(assert (=> b!600058 (= res!384989 (not (noDuplicate!287 Nil!11851)))))

(declare-fun b!600059 () Bool)

(declare-fun res!384976 () Bool)

(assert (=> b!600059 (=> (not res!384976) (not e!343068))))

(declare-fun arrayNoDuplicates!0 (array!37107 (_ BitVec 32) List!11854) Bool)

(assert (=> b!600059 (= res!384976 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11851))))

(declare-fun b!600060 () Bool)

(assert (=> b!600060 (= e!343077 true)))

(declare-fun lt!272890 () Bool)

(declare-fun contains!2970 (List!11854 (_ BitVec 64)) Bool)

(assert (=> b!600060 (= lt!272890 (contains!2970 Nil!11851 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600061 () Bool)

(declare-fun e!343072 () Bool)

(assert (=> b!600061 (= e!343072 e!343070)))

(declare-fun res!384982 () Bool)

(assert (=> b!600061 (=> (not res!384982) (not e!343070))))

(assert (=> b!600061 (= res!384982 (and (= lt!272892 (Found!6253 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17813 a!2986) index!984) (select (arr!17813 a!2986) j!136))) (not (= (select (arr!17813 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600061 (= lt!272892 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17813 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600062 () Bool)

(declare-fun Unit!18933 () Unit!18930)

(assert (=> b!600062 (= e!343076 Unit!18933)))

(declare-fun b!600063 () Bool)

(declare-fun res!384978 () Bool)

(declare-fun e!343066 () Bool)

(assert (=> b!600063 (=> (not res!384978) (not e!343066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600063 (= res!384978 (validKeyInArray!0 (select (arr!17813 a!2986) j!136)))))

(declare-fun b!600064 () Bool)

(declare-fun e!343067 () Bool)

(assert (=> b!600064 (= e!343073 e!343067)))

(declare-fun res!384975 () Bool)

(assert (=> b!600064 (=> res!384975 e!343067)))

(assert (=> b!600064 (= res!384975 (or (not (= (select (arr!17813 a!2986) j!136) lt!272894)) (not (= (select (arr!17813 a!2986) j!136) lt!272895)) (bvsge j!136 index!984)))))

(assert (=> b!600064 e!343075))

(declare-fun res!384977 () Bool)

(assert (=> b!600064 (=> (not res!384977) (not e!343075))))

(assert (=> b!600064 (= res!384977 (= lt!272895 (select (arr!17813 a!2986) j!136)))))

(assert (=> b!600064 (= lt!272895 (select (store (arr!17813 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!600065 () Bool)

(assert (=> b!600065 (= e!343066 e!343068)))

(declare-fun res!384981 () Bool)

(assert (=> b!600065 (=> (not res!384981) (not e!343068))))

(declare-fun lt!272898 () SeekEntryResult!6253)

(assert (=> b!600065 (= res!384981 (or (= lt!272898 (MissingZero!6253 i!1108)) (= lt!272898 (MissingVacant!6253 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37107 (_ BitVec 32)) SeekEntryResult!6253)

(assert (=> b!600065 (= lt!272898 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!600066 () Bool)

(declare-fun e!343071 () Bool)

(assert (=> b!600066 (= e!343065 e!343071)))

(declare-fun res!384990 () Bool)

(assert (=> b!600066 (=> (not res!384990) (not e!343071))))

(declare-fun arrayContainsKey!0 (array!37107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600066 (= res!384990 (arrayContainsKey!0 lt!272899 (select (arr!17813 a!2986) j!136) j!136))))

(declare-fun res!384974 () Bool)

(assert (=> start!54872 (=> (not res!384974) (not e!343066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54872 (= res!384974 (validMask!0 mask!3053))))

(assert (=> start!54872 e!343066))

(assert (=> start!54872 true))

(declare-fun array_inv!13609 (array!37107) Bool)

(assert (=> start!54872 (array_inv!13609 a!2986)))

(declare-fun b!600067 () Bool)

(assert (=> b!600067 (= e!343067 e!343077)))

(declare-fun res!384984 () Bool)

(assert (=> b!600067 (=> res!384984 e!343077)))

(assert (=> b!600067 (= res!384984 (or (bvsge (size!18177 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18177 a!2986))))))

(assert (=> b!600067 (arrayNoDuplicates!0 lt!272899 j!136 Nil!11851)))

(declare-fun lt!272888 () Unit!18930)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37107 (_ BitVec 32) (_ BitVec 32)) Unit!18930)

(assert (=> b!600067 (= lt!272888 (lemmaNoDuplicateFromThenFromBigger!0 lt!272899 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600067 (arrayNoDuplicates!0 lt!272899 #b00000000000000000000000000000000 Nil!11851)))

(declare-fun lt!272886 () Unit!18930)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37107 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11854) Unit!18930)

(assert (=> b!600067 (= lt!272886 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11851))))

(assert (=> b!600067 (arrayContainsKey!0 lt!272899 (select (arr!17813 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272891 () Unit!18930)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37107 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18930)

(assert (=> b!600067 (= lt!272891 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272899 (select (arr!17813 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600068 () Bool)

(declare-fun res!384983 () Bool)

(assert (=> b!600068 (=> (not res!384983) (not e!343066))))

(assert (=> b!600068 (= res!384983 (validKeyInArray!0 k!1786))))

(declare-fun b!600069 () Bool)

(assert (=> b!600069 (= e!343071 (arrayContainsKey!0 lt!272899 (select (arr!17813 a!2986) j!136) index!984))))

(declare-fun b!600070 () Bool)

(declare-fun res!384987 () Bool)

(assert (=> b!600070 (=> res!384987 e!343077)))

(assert (=> b!600070 (= res!384987 (contains!2970 Nil!11851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600071 () Bool)

(declare-fun res!384985 () Bool)

(assert (=> b!600071 (=> (not res!384985) (not e!343068))))

(assert (=> b!600071 (= res!384985 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17813 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600072 () Bool)

(declare-fun res!384973 () Bool)

(assert (=> b!600072 (=> (not res!384973) (not e!343066))))

(assert (=> b!600072 (= res!384973 (and (= (size!18177 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18177 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18177 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600073 () Bool)

(assert (=> b!600073 (= e!343068 e!343072)))

(declare-fun res!384992 () Bool)

(assert (=> b!600073 (=> (not res!384992) (not e!343072))))

(assert (=> b!600073 (= res!384992 (= (select (store (arr!17813 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600073 (= lt!272899 (array!37108 (store (arr!17813 a!2986) i!1108 k!1786) (size!18177 a!2986)))))

(declare-fun b!600074 () Bool)

(declare-fun res!384988 () Bool)

(assert (=> b!600074 (=> (not res!384988) (not e!343066))))

(assert (=> b!600074 (= res!384988 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!54872 res!384974) b!600072))

(assert (= (and b!600072 res!384973) b!600063))

(assert (= (and b!600063 res!384978) b!600068))

(assert (= (and b!600068 res!384983) b!600074))

(assert (= (and b!600074 res!384988) b!600065))

(assert (= (and b!600065 res!384981) b!600053))

(assert (= (and b!600053 res!384991) b!600059))

(assert (= (and b!600059 res!384976) b!600071))

(assert (= (and b!600071 res!384985) b!600073))

(assert (= (and b!600073 res!384992) b!600061))

(assert (= (and b!600061 res!384982) b!600056))

(assert (= (and b!600056 res!384980) b!600054))

(assert (= (and b!600056 c!67907) b!600055))

(assert (= (and b!600056 (not c!67907)) b!600062))

(assert (= (and b!600056 (not res!384986)) b!600064))

(assert (= (and b!600064 res!384977) b!600057))

(assert (= (and b!600057 (not res!384979)) b!600066))

(assert (= (and b!600066 res!384990) b!600069))

(assert (= (and b!600064 (not res!384975)) b!600067))

(assert (= (and b!600067 (not res!384984)) b!600058))

(assert (= (and b!600058 (not res!384989)) b!600070))

(assert (= (and b!600070 (not res!384987)) b!600060))

(declare-fun m!577285 () Bool)

(assert (=> b!600070 m!577285))

(declare-fun m!577287 () Bool)

(assert (=> b!600056 m!577287))

(declare-fun m!577289 () Bool)

(assert (=> b!600056 m!577289))

(declare-fun m!577291 () Bool)

(assert (=> b!600056 m!577291))

(declare-fun m!577293 () Bool)

(assert (=> b!600056 m!577293))

(declare-fun m!577295 () Bool)

(assert (=> b!600056 m!577295))

(assert (=> b!600056 m!577293))

(declare-fun m!577297 () Bool)

(assert (=> b!600056 m!577297))

(declare-fun m!577299 () Bool)

(assert (=> b!600056 m!577299))

(declare-fun m!577301 () Bool)

(assert (=> b!600056 m!577301))

(assert (=> b!600067 m!577293))

(declare-fun m!577303 () Bool)

(assert (=> b!600067 m!577303))

(assert (=> b!600067 m!577293))

(declare-fun m!577305 () Bool)

(assert (=> b!600067 m!577305))

(assert (=> b!600067 m!577293))

(declare-fun m!577307 () Bool)

(assert (=> b!600067 m!577307))

(declare-fun m!577309 () Bool)

(assert (=> b!600067 m!577309))

(declare-fun m!577311 () Bool)

(assert (=> b!600067 m!577311))

(declare-fun m!577313 () Bool)

(assert (=> b!600067 m!577313))

(declare-fun m!577315 () Bool)

(assert (=> b!600053 m!577315))

(declare-fun m!577317 () Bool)

(assert (=> b!600068 m!577317))

(assert (=> b!600064 m!577293))

(assert (=> b!600064 m!577301))

(declare-fun m!577319 () Bool)

(assert (=> b!600064 m!577319))

(assert (=> b!600066 m!577293))

(assert (=> b!600066 m!577293))

(declare-fun m!577321 () Bool)

(assert (=> b!600066 m!577321))

(assert (=> b!600057 m!577293))

(declare-fun m!577323 () Bool)

(assert (=> b!600074 m!577323))

(declare-fun m!577325 () Bool)

(assert (=> b!600060 m!577325))

(declare-fun m!577327 () Bool)

(assert (=> b!600061 m!577327))

(assert (=> b!600061 m!577293))

(assert (=> b!600061 m!577293))

(declare-fun m!577329 () Bool)

(assert (=> b!600061 m!577329))

(assert (=> b!600063 m!577293))

(assert (=> b!600063 m!577293))

(declare-fun m!577331 () Bool)

(assert (=> b!600063 m!577331))

(declare-fun m!577333 () Bool)

(assert (=> b!600065 m!577333))

(declare-fun m!577335 () Bool)

(assert (=> b!600059 m!577335))

(declare-fun m!577337 () Bool)

(assert (=> b!600058 m!577337))

(declare-fun m!577339 () Bool)

(assert (=> start!54872 m!577339))

(declare-fun m!577341 () Bool)

(assert (=> start!54872 m!577341))

(declare-fun m!577343 () Bool)

(assert (=> b!600071 m!577343))

(assert (=> b!600073 m!577301))

(declare-fun m!577345 () Bool)

(assert (=> b!600073 m!577345))

(assert (=> b!600069 m!577293))

(assert (=> b!600069 m!577293))

(declare-fun m!577347 () Bool)

(assert (=> b!600069 m!577347))

(push 1)

(assert (not b!600074))

(assert (not b!600069))

(assert (not b!600053))

(assert (not start!54872))

(assert (not b!600058))

(assert (not b!600059))

(assert (not b!600063))

(assert (not b!600066))

(assert (not b!600065))

(assert (not b!600067))

(assert (not b!600070))

(assert (not b!600060))

(assert (not b!600061))

(assert (not b!600056))

(assert (not b!600068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

