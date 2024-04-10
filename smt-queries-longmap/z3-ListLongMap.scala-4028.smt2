; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54876 () Bool)

(assert start!54876)

(declare-fun b!600185 () Bool)

(declare-fun res!385106 () Bool)

(declare-fun e!343148 () Bool)

(assert (=> b!600185 (=> (not res!385106) (not e!343148))))

(declare-datatypes ((array!37111 0))(
  ( (array!37112 (arr!17815 (Array (_ BitVec 32) (_ BitVec 64))) (size!18179 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37111)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600185 (= res!385106 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600186 () Bool)

(declare-fun e!343147 () Bool)

(declare-fun e!343144 () Bool)

(assert (=> b!600186 (= e!343147 e!343144)))

(declare-fun res!385099 () Bool)

(assert (=> b!600186 (=> (not res!385099) (not e!343144))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6255 0))(
  ( (MissingZero!6255 (index!27277 (_ BitVec 32))) (Found!6255 (index!27278 (_ BitVec 32))) (Intermediate!6255 (undefined!7067 Bool) (index!27279 (_ BitVec 32)) (x!56078 (_ BitVec 32))) (Undefined!6255) (MissingVacant!6255 (index!27280 (_ BitVec 32))) )
))
(declare-fun lt!272971 () SeekEntryResult!6255)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600186 (= res!385099 (and (= lt!272971 (Found!6255 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17815 a!2986) index!984) (select (arr!17815 a!2986) j!136))) (not (= (select (arr!17815 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37111 (_ BitVec 32)) SeekEntryResult!6255)

(assert (=> b!600186 (= lt!272971 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17815 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600187 () Bool)

(declare-fun e!343154 () Bool)

(assert (=> b!600187 (= e!343154 true)))

(declare-fun lt!272983 () Bool)

(declare-datatypes ((List!11856 0))(
  ( (Nil!11853) (Cons!11852 (h!12897 (_ BitVec 64)) (t!18084 List!11856)) )
))
(declare-fun contains!2972 (List!11856 (_ BitVec 64)) Bool)

(assert (=> b!600187 (= lt!272983 (contains!2972 Nil!11853 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!385110 () Bool)

(assert (=> start!54876 (=> (not res!385110) (not e!343148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54876 (= res!385110 (validMask!0 mask!3053))))

(assert (=> start!54876 e!343148))

(assert (=> start!54876 true))

(declare-fun array_inv!13611 (array!37111) Bool)

(assert (=> start!54876 (array_inv!13611 a!2986)))

(declare-fun b!600188 () Bool)

(declare-fun res!385111 () Bool)

(declare-fun e!343151 () Bool)

(assert (=> b!600188 (=> (not res!385111) (not e!343151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37111 (_ BitVec 32)) Bool)

(assert (=> b!600188 (= res!385111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600189 () Bool)

(declare-fun e!343149 () Bool)

(declare-fun e!343155 () Bool)

(assert (=> b!600189 (= e!343149 e!343155)))

(declare-fun res!385104 () Bool)

(assert (=> b!600189 (=> (not res!385104) (not e!343155))))

(declare-fun lt!272972 () array!37111)

(assert (=> b!600189 (= res!385104 (arrayContainsKey!0 lt!272972 (select (arr!17815 a!2986) j!136) j!136))))

(declare-fun b!600190 () Bool)

(declare-fun e!343152 () Bool)

(declare-fun e!343146 () Bool)

(assert (=> b!600190 (= e!343152 e!343146)))

(declare-fun res!385095 () Bool)

(assert (=> b!600190 (=> res!385095 e!343146)))

(declare-fun lt!272976 () (_ BitVec 64))

(declare-fun lt!272981 () (_ BitVec 64))

(assert (=> b!600190 (= res!385095 (or (not (= (select (arr!17815 a!2986) j!136) lt!272981)) (not (= (select (arr!17815 a!2986) j!136) lt!272976)) (bvsge j!136 index!984)))))

(declare-fun e!343145 () Bool)

(assert (=> b!600190 e!343145))

(declare-fun res!385109 () Bool)

(assert (=> b!600190 (=> (not res!385109) (not e!343145))))

(assert (=> b!600190 (= res!385109 (= lt!272976 (select (arr!17815 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!600190 (= lt!272976 (select (store (arr!17815 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600191 () Bool)

(declare-datatypes ((Unit!18938 0))(
  ( (Unit!18939) )
))
(declare-fun e!343150 () Unit!18938)

(declare-fun Unit!18940 () Unit!18938)

(assert (=> b!600191 (= e!343150 Unit!18940)))

(assert (=> b!600191 false))

(declare-fun b!600192 () Bool)

(declare-fun res!385112 () Bool)

(assert (=> b!600192 (=> (not res!385112) (not e!343148))))

(assert (=> b!600192 (= res!385112 (and (= (size!18179 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18179 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18179 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600193 () Bool)

(assert (=> b!600193 (= e!343155 (arrayContainsKey!0 lt!272972 (select (arr!17815 a!2986) j!136) index!984))))

(declare-fun b!600194 () Bool)

(declare-fun res!385105 () Bool)

(assert (=> b!600194 (=> (not res!385105) (not e!343151))))

(assert (=> b!600194 (= res!385105 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17815 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600195 () Bool)

(assert (=> b!600195 (= e!343146 e!343154)))

(declare-fun res!385093 () Bool)

(assert (=> b!600195 (=> res!385093 e!343154)))

(assert (=> b!600195 (= res!385093 (or (bvsge (size!18179 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18179 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37111 (_ BitVec 32) List!11856) Bool)

(assert (=> b!600195 (arrayNoDuplicates!0 lt!272972 j!136 Nil!11853)))

(declare-fun lt!272980 () Unit!18938)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37111 (_ BitVec 32) (_ BitVec 32)) Unit!18938)

(assert (=> b!600195 (= lt!272980 (lemmaNoDuplicateFromThenFromBigger!0 lt!272972 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600195 (arrayNoDuplicates!0 lt!272972 #b00000000000000000000000000000000 Nil!11853)))

(declare-fun lt!272979 () Unit!18938)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37111 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11856) Unit!18938)

(assert (=> b!600195 (= lt!272979 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11853))))

(assert (=> b!600195 (arrayContainsKey!0 lt!272972 (select (arr!17815 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272973 () Unit!18938)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37111 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18938)

(assert (=> b!600195 (= lt!272973 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272972 (select (arr!17815 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600196 () Bool)

(declare-fun Unit!18941 () Unit!18938)

(assert (=> b!600196 (= e!343150 Unit!18941)))

(declare-fun b!600197 () Bool)

(declare-fun res!385096 () Bool)

(assert (=> b!600197 (=> (not res!385096) (not e!343148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600197 (= res!385096 (validKeyInArray!0 (select (arr!17815 a!2986) j!136)))))

(declare-fun b!600198 () Bool)

(declare-fun res!385098 () Bool)

(assert (=> b!600198 (=> res!385098 e!343154)))

(declare-fun noDuplicate!289 (List!11856) Bool)

(assert (=> b!600198 (= res!385098 (not (noDuplicate!289 Nil!11853)))))

(declare-fun b!600199 () Bool)

(assert (=> b!600199 (= e!343148 e!343151)))

(declare-fun res!385101 () Bool)

(assert (=> b!600199 (=> (not res!385101) (not e!343151))))

(declare-fun lt!272974 () SeekEntryResult!6255)

(assert (=> b!600199 (= res!385101 (or (= lt!272974 (MissingZero!6255 i!1108)) (= lt!272974 (MissingVacant!6255 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37111 (_ BitVec 32)) SeekEntryResult!6255)

(assert (=> b!600199 (= lt!272974 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600200 () Bool)

(declare-fun e!343143 () Bool)

(declare-fun lt!272975 () SeekEntryResult!6255)

(assert (=> b!600200 (= e!343143 (= lt!272971 lt!272975))))

(declare-fun b!600201 () Bool)

(assert (=> b!600201 (= e!343144 (not e!343152))))

(declare-fun res!385100 () Bool)

(assert (=> b!600201 (=> res!385100 e!343152)))

(declare-fun lt!272970 () SeekEntryResult!6255)

(assert (=> b!600201 (= res!385100 (not (= lt!272970 (Found!6255 index!984))))))

(declare-fun lt!272977 () Unit!18938)

(assert (=> b!600201 (= lt!272977 e!343150)))

(declare-fun c!67913 () Bool)

(assert (=> b!600201 (= c!67913 (= lt!272970 Undefined!6255))))

(assert (=> b!600201 (= lt!272970 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272981 lt!272972 mask!3053))))

(assert (=> b!600201 e!343143))

(declare-fun res!385102 () Bool)

(assert (=> b!600201 (=> (not res!385102) (not e!343143))))

(declare-fun lt!272978 () (_ BitVec 32))

(assert (=> b!600201 (= res!385102 (= lt!272975 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272978 vacantSpotIndex!68 lt!272981 lt!272972 mask!3053)))))

(assert (=> b!600201 (= lt!272975 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272978 vacantSpotIndex!68 (select (arr!17815 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600201 (= lt!272981 (select (store (arr!17815 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272982 () Unit!18938)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37111 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18938)

(assert (=> b!600201 (= lt!272982 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272978 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600201 (= lt!272978 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600202 () Bool)

(assert (=> b!600202 (= e!343151 e!343147)))

(declare-fun res!385094 () Bool)

(assert (=> b!600202 (=> (not res!385094) (not e!343147))))

(assert (=> b!600202 (= res!385094 (= (select (store (arr!17815 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600202 (= lt!272972 (array!37112 (store (arr!17815 a!2986) i!1108 k0!1786) (size!18179 a!2986)))))

(declare-fun b!600203 () Bool)

(declare-fun res!385097 () Bool)

(assert (=> b!600203 (=> (not res!385097) (not e!343151))))

(assert (=> b!600203 (= res!385097 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11853))))

(declare-fun b!600204 () Bool)

(assert (=> b!600204 (= e!343145 e!343149)))

(declare-fun res!385108 () Bool)

(assert (=> b!600204 (=> res!385108 e!343149)))

(assert (=> b!600204 (= res!385108 (or (not (= (select (arr!17815 a!2986) j!136) lt!272981)) (not (= (select (arr!17815 a!2986) j!136) lt!272976)) (bvsge j!136 index!984)))))

(declare-fun b!600205 () Bool)

(declare-fun res!385107 () Bool)

(assert (=> b!600205 (=> (not res!385107) (not e!343148))))

(assert (=> b!600205 (= res!385107 (validKeyInArray!0 k0!1786))))

(declare-fun b!600206 () Bool)

(declare-fun res!385103 () Bool)

(assert (=> b!600206 (=> res!385103 e!343154)))

(assert (=> b!600206 (= res!385103 (contains!2972 Nil!11853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!54876 res!385110) b!600192))

(assert (= (and b!600192 res!385112) b!600197))

(assert (= (and b!600197 res!385096) b!600205))

(assert (= (and b!600205 res!385107) b!600185))

(assert (= (and b!600185 res!385106) b!600199))

(assert (= (and b!600199 res!385101) b!600188))

(assert (= (and b!600188 res!385111) b!600203))

(assert (= (and b!600203 res!385097) b!600194))

(assert (= (and b!600194 res!385105) b!600202))

(assert (= (and b!600202 res!385094) b!600186))

(assert (= (and b!600186 res!385099) b!600201))

(assert (= (and b!600201 res!385102) b!600200))

(assert (= (and b!600201 c!67913) b!600191))

(assert (= (and b!600201 (not c!67913)) b!600196))

(assert (= (and b!600201 (not res!385100)) b!600190))

(assert (= (and b!600190 res!385109) b!600204))

(assert (= (and b!600204 (not res!385108)) b!600189))

(assert (= (and b!600189 res!385104) b!600193))

(assert (= (and b!600190 (not res!385095)) b!600195))

(assert (= (and b!600195 (not res!385093)) b!600198))

(assert (= (and b!600198 (not res!385098)) b!600206))

(assert (= (and b!600206 (not res!385103)) b!600187))

(declare-fun m!577413 () Bool)

(assert (=> b!600201 m!577413))

(declare-fun m!577415 () Bool)

(assert (=> b!600201 m!577415))

(declare-fun m!577417 () Bool)

(assert (=> b!600201 m!577417))

(assert (=> b!600201 m!577417))

(declare-fun m!577419 () Bool)

(assert (=> b!600201 m!577419))

(declare-fun m!577421 () Bool)

(assert (=> b!600201 m!577421))

(declare-fun m!577423 () Bool)

(assert (=> b!600201 m!577423))

(declare-fun m!577425 () Bool)

(assert (=> b!600201 m!577425))

(declare-fun m!577427 () Bool)

(assert (=> b!600201 m!577427))

(declare-fun m!577429 () Bool)

(assert (=> b!600188 m!577429))

(assert (=> b!600190 m!577417))

(assert (=> b!600190 m!577425))

(declare-fun m!577431 () Bool)

(assert (=> b!600190 m!577431))

(declare-fun m!577433 () Bool)

(assert (=> b!600185 m!577433))

(declare-fun m!577435 () Bool)

(assert (=> b!600205 m!577435))

(assert (=> b!600202 m!577425))

(declare-fun m!577437 () Bool)

(assert (=> b!600202 m!577437))

(declare-fun m!577439 () Bool)

(assert (=> b!600203 m!577439))

(assert (=> b!600204 m!577417))

(assert (=> b!600197 m!577417))

(assert (=> b!600197 m!577417))

(declare-fun m!577441 () Bool)

(assert (=> b!600197 m!577441))

(declare-fun m!577443 () Bool)

(assert (=> b!600187 m!577443))

(declare-fun m!577445 () Bool)

(assert (=> b!600194 m!577445))

(declare-fun m!577447 () Bool)

(assert (=> start!54876 m!577447))

(declare-fun m!577449 () Bool)

(assert (=> start!54876 m!577449))

(declare-fun m!577451 () Bool)

(assert (=> b!600198 m!577451))

(declare-fun m!577453 () Bool)

(assert (=> b!600186 m!577453))

(assert (=> b!600186 m!577417))

(assert (=> b!600186 m!577417))

(declare-fun m!577455 () Bool)

(assert (=> b!600186 m!577455))

(assert (=> b!600193 m!577417))

(assert (=> b!600193 m!577417))

(declare-fun m!577457 () Bool)

(assert (=> b!600193 m!577457))

(assert (=> b!600189 m!577417))

(assert (=> b!600189 m!577417))

(declare-fun m!577459 () Bool)

(assert (=> b!600189 m!577459))

(declare-fun m!577461 () Bool)

(assert (=> b!600199 m!577461))

(declare-fun m!577463 () Bool)

(assert (=> b!600206 m!577463))

(declare-fun m!577465 () Bool)

(assert (=> b!600195 m!577465))

(assert (=> b!600195 m!577417))

(declare-fun m!577467 () Bool)

(assert (=> b!600195 m!577467))

(assert (=> b!600195 m!577417))

(declare-fun m!577469 () Bool)

(assert (=> b!600195 m!577469))

(assert (=> b!600195 m!577417))

(declare-fun m!577471 () Bool)

(assert (=> b!600195 m!577471))

(declare-fun m!577473 () Bool)

(assert (=> b!600195 m!577473))

(declare-fun m!577475 () Bool)

(assert (=> b!600195 m!577475))

(check-sat (not b!600198) (not start!54876) (not b!600206) (not b!600205) (not b!600203) (not b!600187) (not b!600193) (not b!600189) (not b!600186) (not b!600201) (not b!600188) (not b!600195) (not b!600197) (not b!600199) (not b!600185))
(check-sat)
