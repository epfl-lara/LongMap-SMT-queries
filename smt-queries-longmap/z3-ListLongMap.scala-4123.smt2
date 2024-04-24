; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56334 () Bool)

(assert start!56334)

(declare-fun b!624164 () Bool)

(declare-fun e!357992 () Bool)

(declare-fun e!357999 () Bool)

(assert (=> b!624164 (= e!357992 e!357999)))

(declare-fun res!402252 () Bool)

(assert (=> b!624164 (=> (not res!402252) (not e!357999))))

(declare-datatypes ((SeekEntryResult!6490 0))(
  ( (MissingZero!6490 (index!28244 (_ BitVec 32))) (Found!6490 (index!28245 (_ BitVec 32))) (Intermediate!6490 (undefined!7302 Bool) (index!28246 (_ BitVec 32)) (x!57160 (_ BitVec 32))) (Undefined!6490) (MissingVacant!6490 (index!28247 (_ BitVec 32))) )
))
(declare-fun lt!289509 () SeekEntryResult!6490)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624164 (= res!402252 (or (= lt!289509 (MissingZero!6490 i!1108)) (= lt!289509 (MissingVacant!6490 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37704 0))(
  ( (array!37705 (arr!18094 (Array (_ BitVec 32) (_ BitVec 64))) (size!18458 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37704)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37704 (_ BitVec 32)) SeekEntryResult!6490)

(assert (=> b!624164 (= lt!289509 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624165 () Bool)

(declare-fun res!402246 () Bool)

(assert (=> b!624165 (=> (not res!402246) (not e!357992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624165 (= res!402246 (validKeyInArray!0 k0!1786))))

(declare-fun b!624166 () Bool)

(declare-datatypes ((Unit!21039 0))(
  ( (Unit!21040) )
))
(declare-fun e!357997 () Unit!21039)

(declare-fun Unit!21041 () Unit!21039)

(assert (=> b!624166 (= e!357997 Unit!21041)))

(declare-fun b!624167 () Bool)

(declare-fun res!402248 () Bool)

(assert (=> b!624167 (=> (not res!402248) (not e!357992))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624167 (= res!402248 (validKeyInArray!0 (select (arr!18094 a!2986) j!136)))))

(declare-fun e!357996 () Bool)

(declare-fun b!624168 () Bool)

(declare-fun lt!289516 () (_ BitVec 64))

(assert (=> b!624168 (= e!357996 (= (select (arr!18094 a!2986) j!136) lt!289516))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624168 (= (select (store (arr!18094 a!2986) i!1108 k0!1786) index!984) (select (arr!18094 a!2986) j!136))))

(declare-fun b!624169 () Bool)

(declare-fun res!402250 () Bool)

(assert (=> b!624169 (=> (not res!402250) (not e!357992))))

(assert (=> b!624169 (= res!402250 (and (= (size!18458 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18458 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18458 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!402253 () Bool)

(assert (=> start!56334 (=> (not res!402253) (not e!357992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56334 (= res!402253 (validMask!0 mask!3053))))

(assert (=> start!56334 e!357992))

(assert (=> start!56334 true))

(declare-fun array_inv!13953 (array!37704) Bool)

(assert (=> start!56334 (array_inv!13953 a!2986)))

(declare-fun b!624170 () Bool)

(declare-fun res!402249 () Bool)

(assert (=> b!624170 (=> (not res!402249) (not e!357992))))

(declare-fun arrayContainsKey!0 (array!37704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624170 (= res!402249 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624171 () Bool)

(declare-fun e!357995 () Bool)

(assert (=> b!624171 (= e!357995 (not e!357996))))

(declare-fun res!402243 () Bool)

(assert (=> b!624171 (=> res!402243 e!357996)))

(declare-fun lt!289508 () SeekEntryResult!6490)

(assert (=> b!624171 (= res!402243 (not (= lt!289508 (Found!6490 index!984))))))

(declare-fun lt!289515 () Unit!21039)

(assert (=> b!624171 (= lt!289515 e!357997)))

(declare-fun c!71330 () Bool)

(assert (=> b!624171 (= c!71330 (= lt!289508 Undefined!6490))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!289513 () array!37704)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37704 (_ BitVec 32)) SeekEntryResult!6490)

(assert (=> b!624171 (= lt!289508 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289516 lt!289513 mask!3053))))

(declare-fun e!357993 () Bool)

(assert (=> b!624171 e!357993))

(declare-fun res!402251 () Bool)

(assert (=> b!624171 (=> (not res!402251) (not e!357993))))

(declare-fun lt!289514 () (_ BitVec 32))

(declare-fun lt!289510 () SeekEntryResult!6490)

(assert (=> b!624171 (= res!402251 (= lt!289510 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289514 vacantSpotIndex!68 lt!289516 lt!289513 mask!3053)))))

(assert (=> b!624171 (= lt!289510 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289514 vacantSpotIndex!68 (select (arr!18094 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!624171 (= lt!289516 (select (store (arr!18094 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!289511 () Unit!21039)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37704 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21039)

(assert (=> b!624171 (= lt!289511 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289514 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!624171 (= lt!289514 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!624172 () Bool)

(declare-fun e!357998 () Bool)

(assert (=> b!624172 (= e!357998 e!357995)))

(declare-fun res!402241 () Bool)

(assert (=> b!624172 (=> (not res!402241) (not e!357995))))

(declare-fun lt!289512 () SeekEntryResult!6490)

(assert (=> b!624172 (= res!402241 (and (= lt!289512 (Found!6490 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18094 a!2986) index!984) (select (arr!18094 a!2986) j!136))) (not (= (select (arr!18094 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!624172 (= lt!289512 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18094 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624173 () Bool)

(declare-fun res!402242 () Bool)

(assert (=> b!624173 (=> (not res!402242) (not e!357999))))

(declare-datatypes ((List!12042 0))(
  ( (Nil!12039) (Cons!12038 (h!13086 (_ BitVec 64)) (t!18262 List!12042)) )
))
(declare-fun arrayNoDuplicates!0 (array!37704 (_ BitVec 32) List!12042) Bool)

(assert (=> b!624173 (= res!402242 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12039))))

(declare-fun b!624174 () Bool)

(declare-fun res!402244 () Bool)

(assert (=> b!624174 (=> (not res!402244) (not e!357999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37704 (_ BitVec 32)) Bool)

(assert (=> b!624174 (= res!402244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624175 () Bool)

(assert (=> b!624175 (= e!357993 (= lt!289512 lt!289510))))

(declare-fun b!624176 () Bool)

(declare-fun Unit!21042 () Unit!21039)

(assert (=> b!624176 (= e!357997 Unit!21042)))

(assert (=> b!624176 false))

(declare-fun b!624177 () Bool)

(assert (=> b!624177 (= e!357999 e!357998)))

(declare-fun res!402245 () Bool)

(assert (=> b!624177 (=> (not res!402245) (not e!357998))))

(assert (=> b!624177 (= res!402245 (= (select (store (arr!18094 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!624177 (= lt!289513 (array!37705 (store (arr!18094 a!2986) i!1108 k0!1786) (size!18458 a!2986)))))

(declare-fun b!624178 () Bool)

(declare-fun res!402247 () Bool)

(assert (=> b!624178 (=> (not res!402247) (not e!357999))))

(assert (=> b!624178 (= res!402247 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18094 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56334 res!402253) b!624169))

(assert (= (and b!624169 res!402250) b!624167))

(assert (= (and b!624167 res!402248) b!624165))

(assert (= (and b!624165 res!402246) b!624170))

(assert (= (and b!624170 res!402249) b!624164))

(assert (= (and b!624164 res!402252) b!624174))

(assert (= (and b!624174 res!402244) b!624173))

(assert (= (and b!624173 res!402242) b!624178))

(assert (= (and b!624178 res!402247) b!624177))

(assert (= (and b!624177 res!402245) b!624172))

(assert (= (and b!624172 res!402241) b!624171))

(assert (= (and b!624171 res!402251) b!624175))

(assert (= (and b!624171 c!71330) b!624176))

(assert (= (and b!624171 (not c!71330)) b!624166))

(assert (= (and b!624171 (not res!402243)) b!624168))

(declare-fun m!600187 () Bool)

(assert (=> start!56334 m!600187))

(declare-fun m!600189 () Bool)

(assert (=> start!56334 m!600189))

(declare-fun m!600191 () Bool)

(assert (=> b!624165 m!600191))

(declare-fun m!600193 () Bool)

(assert (=> b!624170 m!600193))

(declare-fun m!600195 () Bool)

(assert (=> b!624177 m!600195))

(declare-fun m!600197 () Bool)

(assert (=> b!624177 m!600197))

(declare-fun m!600199 () Bool)

(assert (=> b!624173 m!600199))

(declare-fun m!600201 () Bool)

(assert (=> b!624174 m!600201))

(declare-fun m!600203 () Bool)

(assert (=> b!624178 m!600203))

(declare-fun m!600205 () Bool)

(assert (=> b!624167 m!600205))

(assert (=> b!624167 m!600205))

(declare-fun m!600207 () Bool)

(assert (=> b!624167 m!600207))

(declare-fun m!600209 () Bool)

(assert (=> b!624172 m!600209))

(assert (=> b!624172 m!600205))

(assert (=> b!624172 m!600205))

(declare-fun m!600211 () Bool)

(assert (=> b!624172 m!600211))

(declare-fun m!600213 () Bool)

(assert (=> b!624164 m!600213))

(declare-fun m!600215 () Bool)

(assert (=> b!624171 m!600215))

(declare-fun m!600217 () Bool)

(assert (=> b!624171 m!600217))

(declare-fun m!600219 () Bool)

(assert (=> b!624171 m!600219))

(declare-fun m!600221 () Bool)

(assert (=> b!624171 m!600221))

(assert (=> b!624171 m!600205))

(assert (=> b!624171 m!600195))

(declare-fun m!600223 () Bool)

(assert (=> b!624171 m!600223))

(assert (=> b!624171 m!600205))

(declare-fun m!600225 () Bool)

(assert (=> b!624171 m!600225))

(assert (=> b!624168 m!600205))

(assert (=> b!624168 m!600195))

(declare-fun m!600227 () Bool)

(assert (=> b!624168 m!600227))

(check-sat (not b!624173) (not b!624171) (not b!624174) (not start!56334) (not b!624165) (not b!624167) (not b!624172) (not b!624164) (not b!624170))
(check-sat)
