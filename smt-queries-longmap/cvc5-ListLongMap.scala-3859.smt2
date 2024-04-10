; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53038 () Bool)

(assert start!53038)

(declare-fun b!577484 () Bool)

(declare-fun e!332143 () Bool)

(declare-datatypes ((array!36056 0))(
  ( (array!36057 (arr!17307 (Array (_ BitVec 32) (_ BitVec 64))) (size!17671 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36056)

(assert (=> b!577484 (= e!332143 (and (bvsle #b00000000000000000000000000000000 (size!17671 a!2986)) (bvsge (size!17671 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!577485 () Bool)

(declare-fun res!365520 () Bool)

(assert (=> b!577485 (=> (not res!365520) (not e!332143))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36056 (_ BitVec 32)) Bool)

(assert (=> b!577485 (= res!365520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577486 () Bool)

(declare-fun e!332145 () Bool)

(assert (=> b!577486 (= e!332145 e!332143)))

(declare-fun res!365519 () Bool)

(assert (=> b!577486 (=> (not res!365519) (not e!332143))))

(declare-datatypes ((SeekEntryResult!5747 0))(
  ( (MissingZero!5747 (index!25215 (_ BitVec 32))) (Found!5747 (index!25216 (_ BitVec 32))) (Intermediate!5747 (undefined!6559 Bool) (index!25217 (_ BitVec 32)) (x!54128 (_ BitVec 32))) (Undefined!5747) (MissingVacant!5747 (index!25218 (_ BitVec 32))) )
))
(declare-fun lt!263971 () SeekEntryResult!5747)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577486 (= res!365519 (or (= lt!263971 (MissingZero!5747 i!1108)) (= lt!263971 (MissingVacant!5747 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36056 (_ BitVec 32)) SeekEntryResult!5747)

(assert (=> b!577486 (= lt!263971 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!365516 () Bool)

(assert (=> start!53038 (=> (not res!365516) (not e!332145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53038 (= res!365516 (validMask!0 mask!3053))))

(assert (=> start!53038 e!332145))

(assert (=> start!53038 true))

(declare-fun array_inv!13103 (array!36056) Bool)

(assert (=> start!53038 (array_inv!13103 a!2986)))

(declare-fun b!577487 () Bool)

(declare-fun res!365521 () Bool)

(assert (=> b!577487 (=> (not res!365521) (not e!332145))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577487 (= res!365521 (validKeyInArray!0 (select (arr!17307 a!2986) j!136)))))

(declare-fun b!577488 () Bool)

(declare-fun res!365518 () Bool)

(assert (=> b!577488 (=> (not res!365518) (not e!332145))))

(assert (=> b!577488 (= res!365518 (validKeyInArray!0 k!1786))))

(declare-fun b!577489 () Bool)

(declare-fun res!365517 () Bool)

(assert (=> b!577489 (=> (not res!365517) (not e!332145))))

(declare-fun arrayContainsKey!0 (array!36056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577489 (= res!365517 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577490 () Bool)

(declare-fun res!365522 () Bool)

(assert (=> b!577490 (=> (not res!365522) (not e!332145))))

(assert (=> b!577490 (= res!365522 (and (= (size!17671 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17671 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17671 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53038 res!365516) b!577490))

(assert (= (and b!577490 res!365522) b!577487))

(assert (= (and b!577487 res!365521) b!577488))

(assert (= (and b!577488 res!365518) b!577489))

(assert (= (and b!577489 res!365517) b!577486))

(assert (= (and b!577486 res!365519) b!577485))

(assert (= (and b!577485 res!365520) b!577484))

(declare-fun m!556359 () Bool)

(assert (=> b!577487 m!556359))

(assert (=> b!577487 m!556359))

(declare-fun m!556361 () Bool)

(assert (=> b!577487 m!556361))

(declare-fun m!556363 () Bool)

(assert (=> b!577488 m!556363))

(declare-fun m!556365 () Bool)

(assert (=> b!577486 m!556365))

(declare-fun m!556367 () Bool)

(assert (=> start!53038 m!556367))

(declare-fun m!556369 () Bool)

(assert (=> start!53038 m!556369))

(declare-fun m!556371 () Bool)

(assert (=> b!577485 m!556371))

(declare-fun m!556373 () Bool)

(assert (=> b!577489 m!556373))

(push 1)

(assert (not b!577487))

(assert (not b!577486))

(assert (not b!577489))

(assert (not start!53038))

(assert (not b!577488))

(assert (not b!577485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!577553 () Bool)

(declare-fun e!332181 () Bool)

(declare-fun e!332179 () Bool)

(assert (=> b!577553 (= e!332181 e!332179)))

(declare-fun lt!263994 () (_ BitVec 64))

(assert (=> b!577553 (= lt!263994 (select (arr!17307 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18144 0))(
  ( (Unit!18145) )
))
(declare-fun lt!263993 () Unit!18144)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36056 (_ BitVec 64) (_ BitVec 32)) Unit!18144)

(assert (=> b!577553 (= lt!263993 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!263994 #b00000000000000000000000000000000))))

(assert (=> b!577553 (arrayContainsKey!0 a!2986 lt!263994 #b00000000000000000000000000000000)))

(declare-fun lt!263995 () Unit!18144)

(assert (=> b!577553 (= lt!263995 lt!263993)))

(declare-fun res!365575 () Bool)

(assert (=> b!577553 (= res!365575 (= (seekEntryOrOpen!0 (select (arr!17307 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!5747 #b00000000000000000000000000000000)))))

(assert (=> b!577553 (=> (not res!365575) (not e!332179))))

(declare-fun b!577554 () Bool)

(declare-fun call!32756 () Bool)

