; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57354 () Bool)

(assert start!57354)

(declare-fun b!634973 () Bool)

(declare-fun res!410803 () Bool)

(declare-fun e!363143 () Bool)

(assert (=> b!634973 (=> (not res!410803) (not e!363143))))

(declare-datatypes ((array!38207 0))(
  ( (array!38208 (arr!18332 (Array (_ BitVec 32) (_ BitVec 64))) (size!18696 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38207)

(declare-datatypes ((List!12373 0))(
  ( (Nil!12370) (Cons!12369 (h!13414 (_ BitVec 64)) (t!18601 List!12373)) )
))
(declare-fun arrayNoDuplicates!0 (array!38207 (_ BitVec 32) List!12373) Bool)

(assert (=> b!634973 (= res!410803 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12370))))

(declare-fun b!634974 () Bool)

(declare-fun e!363140 () Bool)

(declare-datatypes ((SeekEntryResult!6772 0))(
  ( (MissingZero!6772 (index!29390 (_ BitVec 32))) (Found!6772 (index!29391 (_ BitVec 32))) (Intermediate!6772 (undefined!7584 Bool) (index!29392 (_ BitVec 32)) (x!58130 (_ BitVec 32))) (Undefined!6772) (MissingVacant!6772 (index!29393 (_ BitVec 32))) )
))
(declare-fun lt!293585 () SeekEntryResult!6772)

(declare-fun lt!293578 () SeekEntryResult!6772)

(assert (=> b!634974 (= e!363140 (= lt!293585 lt!293578))))

(declare-fun b!634975 () Bool)

(declare-fun e!363146 () Bool)

(declare-fun e!363144 () Bool)

(assert (=> b!634975 (= e!363146 e!363144)))

(declare-fun res!410798 () Bool)

(assert (=> b!634975 (=> (not res!410798) (not e!363144))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!293586 () array!38207)

(declare-fun arrayContainsKey!0 (array!38207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634975 (= res!410798 (arrayContainsKey!0 lt!293586 (select (arr!18332 a!2986) j!136) j!136))))

(declare-fun b!634976 () Bool)

(declare-datatypes ((Unit!21422 0))(
  ( (Unit!21423) )
))
(declare-fun e!363138 () Unit!21422)

(declare-fun Unit!21424 () Unit!21422)

(assert (=> b!634976 (= e!363138 Unit!21424)))

(declare-fun b!634977 () Bool)

(declare-fun res!410796 () Bool)

(assert (=> b!634977 (=> (not res!410796) (not e!363143))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634977 (= res!410796 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18332 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634978 () Bool)

(declare-fun res!410792 () Bool)

(declare-fun e!363142 () Bool)

(assert (=> b!634978 (=> (not res!410792) (not e!363142))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!634978 (= res!410792 (and (= (size!18696 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18696 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18696 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634979 () Bool)

(declare-fun res!410800 () Bool)

(assert (=> b!634979 (=> (not res!410800) (not e!363142))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!634979 (= res!410800 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634980 () Bool)

(assert (=> b!634980 (= e!363144 (arrayContainsKey!0 lt!293586 (select (arr!18332 a!2986) j!136) index!984))))

(declare-fun b!634981 () Bool)

(declare-fun e!363141 () Bool)

(declare-fun e!363137 () Bool)

(assert (=> b!634981 (= e!363141 e!363137)))

(declare-fun res!410806 () Bool)

(assert (=> b!634981 (=> (not res!410806) (not e!363137))))

(assert (=> b!634981 (= res!410806 (and (= lt!293585 (Found!6772 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18332 a!2986) index!984) (select (arr!18332 a!2986) j!136))) (not (= (select (arr!18332 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38207 (_ BitVec 32)) SeekEntryResult!6772)

(assert (=> b!634981 (= lt!293585 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18332 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!410807 () Bool)

(assert (=> start!57354 (=> (not res!410807) (not e!363142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57354 (= res!410807 (validMask!0 mask!3053))))

(assert (=> start!57354 e!363142))

(assert (=> start!57354 true))

(declare-fun array_inv!14128 (array!38207) Bool)

(assert (=> start!57354 (array_inv!14128 a!2986)))

(declare-fun b!634982 () Bool)

(declare-fun e!363136 () Bool)

(declare-fun e!363139 () Bool)

(assert (=> b!634982 (= e!363136 e!363139)))

(declare-fun res!410795 () Bool)

(assert (=> b!634982 (=> res!410795 e!363139)))

(declare-fun lt!293587 () (_ BitVec 64))

(declare-fun lt!293583 () (_ BitVec 64))

(assert (=> b!634982 (= res!410795 (or (not (= (select (arr!18332 a!2986) j!136) lt!293587)) (not (= (select (arr!18332 a!2986) j!136) lt!293583)) (bvsge j!136 index!984)))))

(declare-fun e!363147 () Bool)

(assert (=> b!634982 e!363147))

(declare-fun res!410802 () Bool)

(assert (=> b!634982 (=> (not res!410802) (not e!363147))))

(assert (=> b!634982 (= res!410802 (= lt!293583 (select (arr!18332 a!2986) j!136)))))

(assert (=> b!634982 (= lt!293583 (select (store (arr!18332 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!634983 () Bool)

(declare-fun Unit!21425 () Unit!21422)

(assert (=> b!634983 (= e!363138 Unit!21425)))

(assert (=> b!634983 false))

(declare-fun b!634984 () Bool)

(declare-fun res!410799 () Bool)

(assert (=> b!634984 (=> (not res!410799) (not e!363142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634984 (= res!410799 (validKeyInArray!0 k!1786))))

(declare-fun b!634985 () Bool)

(declare-fun res!410794 () Bool)

(assert (=> b!634985 (=> (not res!410794) (not e!363143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38207 (_ BitVec 32)) Bool)

(assert (=> b!634985 (= res!410794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634986 () Bool)

(declare-fun res!410797 () Bool)

(assert (=> b!634986 (=> (not res!410797) (not e!363142))))

(assert (=> b!634986 (= res!410797 (validKeyInArray!0 (select (arr!18332 a!2986) j!136)))))

(declare-fun b!634987 () Bool)

(assert (=> b!634987 (= e!363139 true)))

(assert (=> b!634987 (arrayContainsKey!0 lt!293586 (select (arr!18332 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293582 () Unit!21422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38207 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21422)

(assert (=> b!634987 (= lt!293582 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293586 (select (arr!18332 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!634988 () Bool)

(assert (=> b!634988 (= e!363143 e!363141)))

(declare-fun res!410793 () Bool)

(assert (=> b!634988 (=> (not res!410793) (not e!363141))))

(assert (=> b!634988 (= res!410793 (= (select (store (arr!18332 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634988 (= lt!293586 (array!38208 (store (arr!18332 a!2986) i!1108 k!1786) (size!18696 a!2986)))))

(declare-fun b!634989 () Bool)

(assert (=> b!634989 (= e!363142 e!363143)))

(declare-fun res!410801 () Bool)

(assert (=> b!634989 (=> (not res!410801) (not e!363143))))

(declare-fun lt!293577 () SeekEntryResult!6772)

(assert (=> b!634989 (= res!410801 (or (= lt!293577 (MissingZero!6772 i!1108)) (= lt!293577 (MissingVacant!6772 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38207 (_ BitVec 32)) SeekEntryResult!6772)

(assert (=> b!634989 (= lt!293577 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!634990 () Bool)

(assert (=> b!634990 (= e!363137 (not e!363136))))

(declare-fun res!410804 () Bool)

(assert (=> b!634990 (=> res!410804 e!363136)))

(declare-fun lt!293579 () SeekEntryResult!6772)

(assert (=> b!634990 (= res!410804 (not (= lt!293579 (Found!6772 index!984))))))

(declare-fun lt!293581 () Unit!21422)

(assert (=> b!634990 (= lt!293581 e!363138)))

(declare-fun c!72458 () Bool)

(assert (=> b!634990 (= c!72458 (= lt!293579 Undefined!6772))))

(assert (=> b!634990 (= lt!293579 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293587 lt!293586 mask!3053))))

(assert (=> b!634990 e!363140))

(declare-fun res!410791 () Bool)

(assert (=> b!634990 (=> (not res!410791) (not e!363140))))

(declare-fun lt!293580 () (_ BitVec 32))

(assert (=> b!634990 (= res!410791 (= lt!293578 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293580 vacantSpotIndex!68 lt!293587 lt!293586 mask!3053)))))

(assert (=> b!634990 (= lt!293578 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293580 vacantSpotIndex!68 (select (arr!18332 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634990 (= lt!293587 (select (store (arr!18332 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293584 () Unit!21422)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38207 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21422)

(assert (=> b!634990 (= lt!293584 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293580 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634990 (= lt!293580 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634991 () Bool)

(assert (=> b!634991 (= e!363147 e!363146)))

(declare-fun res!410805 () Bool)

(assert (=> b!634991 (=> res!410805 e!363146)))

(assert (=> b!634991 (= res!410805 (or (not (= (select (arr!18332 a!2986) j!136) lt!293587)) (not (= (select (arr!18332 a!2986) j!136) lt!293583)) (bvsge j!136 index!984)))))

(assert (= (and start!57354 res!410807) b!634978))

(assert (= (and b!634978 res!410792) b!634986))

(assert (= (and b!634986 res!410797) b!634984))

(assert (= (and b!634984 res!410799) b!634979))

(assert (= (and b!634979 res!410800) b!634989))

(assert (= (and b!634989 res!410801) b!634985))

(assert (= (and b!634985 res!410794) b!634973))

(assert (= (and b!634973 res!410803) b!634977))

(assert (= (and b!634977 res!410796) b!634988))

(assert (= (and b!634988 res!410793) b!634981))

(assert (= (and b!634981 res!410806) b!634990))

(assert (= (and b!634990 res!410791) b!634974))

(assert (= (and b!634990 c!72458) b!634983))

(assert (= (and b!634990 (not c!72458)) b!634976))

(assert (= (and b!634990 (not res!410804)) b!634982))

(assert (= (and b!634982 res!410802) b!634991))

(assert (= (and b!634991 (not res!410805)) b!634975))

(assert (= (and b!634975 res!410798) b!634980))

(assert (= (and b!634982 (not res!410795)) b!634987))

(declare-fun m!609393 () Bool)

(assert (=> b!634980 m!609393))

(assert (=> b!634980 m!609393))

(declare-fun m!609395 () Bool)

(assert (=> b!634980 m!609395))

(declare-fun m!609397 () Bool)

(assert (=> b!634977 m!609397))

(assert (=> b!634982 m!609393))

(declare-fun m!609399 () Bool)

(assert (=> b!634982 m!609399))

(declare-fun m!609401 () Bool)

(assert (=> b!634982 m!609401))

(declare-fun m!609403 () Bool)

(assert (=> start!57354 m!609403))

(declare-fun m!609405 () Bool)

(assert (=> start!57354 m!609405))

(declare-fun m!609407 () Bool)

(assert (=> b!634989 m!609407))

(declare-fun m!609409 () Bool)

(assert (=> b!634990 m!609409))

(declare-fun m!609411 () Bool)

(assert (=> b!634990 m!609411))

(assert (=> b!634990 m!609393))

(assert (=> b!634990 m!609399))

(declare-fun m!609413 () Bool)

(assert (=> b!634990 m!609413))

(declare-fun m!609415 () Bool)

(assert (=> b!634990 m!609415))

(assert (=> b!634990 m!609393))

(declare-fun m!609417 () Bool)

(assert (=> b!634990 m!609417))

(declare-fun m!609419 () Bool)

(assert (=> b!634990 m!609419))

(declare-fun m!609421 () Bool)

(assert (=> b!634981 m!609421))

(assert (=> b!634981 m!609393))

(assert (=> b!634981 m!609393))

(declare-fun m!609423 () Bool)

(assert (=> b!634981 m!609423))

(assert (=> b!634975 m!609393))

(assert (=> b!634975 m!609393))

(declare-fun m!609425 () Bool)

(assert (=> b!634975 m!609425))

(assert (=> b!634991 m!609393))

(declare-fun m!609427 () Bool)

(assert (=> b!634985 m!609427))

(assert (=> b!634986 m!609393))

(assert (=> b!634986 m!609393))

(declare-fun m!609429 () Bool)

(assert (=> b!634986 m!609429))

(assert (=> b!634988 m!609399))

(declare-fun m!609431 () Bool)

(assert (=> b!634988 m!609431))

(declare-fun m!609433 () Bool)

(assert (=> b!634979 m!609433))

(declare-fun m!609435 () Bool)

(assert (=> b!634984 m!609435))

(assert (=> b!634987 m!609393))

(assert (=> b!634987 m!609393))

(declare-fun m!609437 () Bool)

(assert (=> b!634987 m!609437))

(assert (=> b!634987 m!609393))

(declare-fun m!609439 () Bool)

(assert (=> b!634987 m!609439))

(declare-fun m!609441 () Bool)

(assert (=> b!634973 m!609441))

(push 1)

(assert (not b!634990))

(assert (not b!634987))

(assert (not b!634980))

(assert (not b!634985))

(assert (not b!634979))

(assert (not b!634975))

(assert (not b!634981))

(assert (not b!634973))

(assert (not b!634989))

(assert (not b!634984))

(assert (not b!634986))

(assert (not start!57354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

