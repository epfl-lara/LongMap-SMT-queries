; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55194 () Bool)

(assert start!55194)

(declare-fun b!604377 () Bool)

(declare-fun res!388249 () Bool)

(declare-fun e!345807 () Bool)

(assert (=> b!604377 (=> (not res!388249) (not e!345807))))

(declare-datatypes ((array!37212 0))(
  ( (array!37213 (arr!17860 (Array (_ BitVec 32) (_ BitVec 64))) (size!18224 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37212)

(declare-datatypes ((List!11808 0))(
  ( (Nil!11805) (Cons!11804 (h!12852 (_ BitVec 64)) (t!18028 List!11808)) )
))
(declare-fun arrayNoDuplicates!0 (array!37212 (_ BitVec 32) List!11808) Bool)

(assert (=> b!604377 (= res!388249 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11805))))

(declare-fun b!604378 () Bool)

(declare-datatypes ((Unit!19189 0))(
  ( (Unit!19190) )
))
(declare-fun e!345806 () Unit!19189)

(declare-fun Unit!19191 () Unit!19189)

(assert (=> b!604378 (= e!345806 Unit!19191)))

(assert (=> b!604378 false))

(declare-fun b!604379 () Bool)

(declare-fun e!345814 () Bool)

(declare-fun e!345808 () Bool)

(assert (=> b!604379 (= e!345814 (not e!345808))))

(declare-fun res!388257 () Bool)

(assert (=> b!604379 (=> res!388257 e!345808)))

(declare-datatypes ((SeekEntryResult!6256 0))(
  ( (MissingZero!6256 (index!27287 (_ BitVec 32))) (Found!6256 (index!27288 (_ BitVec 32))) (Intermediate!6256 (undefined!7068 Bool) (index!27289 (_ BitVec 32)) (x!56236 (_ BitVec 32))) (Undefined!6256) (MissingVacant!6256 (index!27290 (_ BitVec 32))) )
))
(declare-fun lt!275581 () SeekEntryResult!6256)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!604379 (= res!388257 (not (= lt!275581 (Found!6256 index!984))))))

(declare-fun lt!275574 () Unit!19189)

(assert (=> b!604379 (= lt!275574 e!345806)))

(declare-fun c!68437 () Bool)

(assert (=> b!604379 (= c!68437 (= lt!275581 Undefined!6256))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!275585 () array!37212)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!275584 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37212 (_ BitVec 32)) SeekEntryResult!6256)

(assert (=> b!604379 (= lt!275581 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275584 lt!275585 mask!3053))))

(declare-fun e!345812 () Bool)

(assert (=> b!604379 e!345812))

(declare-fun res!388255 () Bool)

(assert (=> b!604379 (=> (not res!388255) (not e!345812))))

(declare-fun lt!275573 () SeekEntryResult!6256)

(declare-fun lt!275580 () (_ BitVec 32))

(assert (=> b!604379 (= res!388255 (= lt!275573 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275580 vacantSpotIndex!68 lt!275584 lt!275585 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!604379 (= lt!275573 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275580 vacantSpotIndex!68 (select (arr!17860 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!604379 (= lt!275584 (select (store (arr!17860 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275579 () Unit!19189)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37212 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19189)

(assert (=> b!604379 (= lt!275579 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275580 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604379 (= lt!275580 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!604380 () Bool)

(declare-fun e!345816 () Bool)

(assert (=> b!604380 (= e!345816 e!345807)))

(declare-fun res!388242 () Bool)

(assert (=> b!604380 (=> (not res!388242) (not e!345807))))

(declare-fun lt!275586 () SeekEntryResult!6256)

(assert (=> b!604380 (= res!388242 (or (= lt!275586 (MissingZero!6256 i!1108)) (= lt!275586 (MissingVacant!6256 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37212 (_ BitVec 32)) SeekEntryResult!6256)

(assert (=> b!604380 (= lt!275586 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!604382 () Bool)

(declare-fun res!388251 () Bool)

(assert (=> b!604382 (=> (not res!388251) (not e!345816))))

(assert (=> b!604382 (= res!388251 (and (= (size!18224 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18224 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18224 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604383 () Bool)

(declare-fun e!345811 () Bool)

(declare-fun e!345815 () Bool)

(assert (=> b!604383 (= e!345811 e!345815)))

(declare-fun res!388253 () Bool)

(assert (=> b!604383 (=> res!388253 e!345815)))

(declare-fun lt!275582 () (_ BitVec 64))

(assert (=> b!604383 (= res!388253 (or (not (= (select (arr!17860 a!2986) j!136) lt!275584)) (not (= (select (arr!17860 a!2986) j!136) lt!275582)) (bvsge j!136 index!984)))))

(declare-fun b!604384 () Bool)

(declare-fun e!345810 () Bool)

(assert (=> b!604384 (= e!345808 e!345810)))

(declare-fun res!388256 () Bool)

(assert (=> b!604384 (=> res!388256 e!345810)))

(assert (=> b!604384 (= res!388256 (or (not (= (select (arr!17860 a!2986) j!136) lt!275584)) (not (= (select (arr!17860 a!2986) j!136) lt!275582))))))

(assert (=> b!604384 e!345811))

(declare-fun res!388241 () Bool)

(assert (=> b!604384 (=> (not res!388241) (not e!345811))))

(assert (=> b!604384 (= res!388241 (= lt!275582 (select (arr!17860 a!2986) j!136)))))

(assert (=> b!604384 (= lt!275582 (select (store (arr!17860 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!604385 () Bool)

(declare-fun e!345813 () Unit!19189)

(declare-fun Unit!19192 () Unit!19189)

(assert (=> b!604385 (= e!345813 Unit!19192)))

(declare-fun lt!275575 () Unit!19189)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37212 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19189)

(assert (=> b!604385 (= lt!275575 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275585 (select (arr!17860 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604385 (arrayContainsKey!0 lt!275585 (select (arr!17860 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275587 () Unit!19189)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37212 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11808) Unit!19189)

(assert (=> b!604385 (= lt!275587 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11805))))

(assert (=> b!604385 (arrayNoDuplicates!0 lt!275585 #b00000000000000000000000000000000 Nil!11805)))

(declare-fun lt!275578 () Unit!19189)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37212 (_ BitVec 32) (_ BitVec 32)) Unit!19189)

(assert (=> b!604385 (= lt!275578 (lemmaNoDuplicateFromThenFromBigger!0 lt!275585 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604385 (arrayNoDuplicates!0 lt!275585 j!136 Nil!11805)))

(declare-fun lt!275583 () Unit!19189)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37212 (_ BitVec 64) (_ BitVec 32) List!11808) Unit!19189)

(assert (=> b!604385 (= lt!275583 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275585 (select (arr!17860 a!2986) j!136) j!136 Nil!11805))))

(assert (=> b!604385 false))

(declare-fun b!604386 () Bool)

(declare-fun e!345805 () Bool)

(assert (=> b!604386 (= e!345805 (bvsge (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000))))

(assert (=> b!604386 (arrayContainsKey!0 lt!275585 (select (arr!17860 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275577 () Unit!19189)

(assert (=> b!604386 (= lt!275577 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275585 (select (arr!17860 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!345817 () Bool)

(assert (=> b!604386 e!345817))

(declare-fun res!388252 () Bool)

(assert (=> b!604386 (=> (not res!388252) (not e!345817))))

(assert (=> b!604386 (= res!388252 (arrayContainsKey!0 lt!275585 (select (arr!17860 a!2986) j!136) j!136))))

(declare-fun b!604387 () Bool)

(declare-fun e!345819 () Bool)

(assert (=> b!604387 (= e!345819 e!345814)))

(declare-fun res!388244 () Bool)

(assert (=> b!604387 (=> (not res!388244) (not e!345814))))

(declare-fun lt!275576 () SeekEntryResult!6256)

(assert (=> b!604387 (= res!388244 (and (= lt!275576 (Found!6256 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17860 a!2986) index!984) (select (arr!17860 a!2986) j!136))) (not (= (select (arr!17860 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!604387 (= lt!275576 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17860 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604388 () Bool)

(declare-fun e!345809 () Bool)

(assert (=> b!604388 (= e!345809 (arrayContainsKey!0 lt!275585 (select (arr!17860 a!2986) j!136) index!984))))

(declare-fun b!604389 () Bool)

(assert (=> b!604389 (= e!345817 (arrayContainsKey!0 lt!275585 (select (arr!17860 a!2986) j!136) index!984))))

(declare-fun b!604390 () Bool)

(declare-fun res!388243 () Bool)

(assert (=> b!604390 (=> (not res!388243) (not e!345816))))

(assert (=> b!604390 (= res!388243 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604391 () Bool)

(declare-fun Unit!19193 () Unit!19189)

(assert (=> b!604391 (= e!345813 Unit!19193)))

(declare-fun b!604392 () Bool)

(declare-fun res!388254 () Bool)

(assert (=> b!604392 (=> (not res!388254) (not e!345816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604392 (= res!388254 (validKeyInArray!0 (select (arr!17860 a!2986) j!136)))))

(declare-fun b!604393 () Bool)

(assert (=> b!604393 (= e!345812 (= lt!275576 lt!275573))))

(declare-fun b!604394 () Bool)

(assert (=> b!604394 (= e!345807 e!345819)))

(declare-fun res!388245 () Bool)

(assert (=> b!604394 (=> (not res!388245) (not e!345819))))

(assert (=> b!604394 (= res!388245 (= (select (store (arr!17860 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604394 (= lt!275585 (array!37213 (store (arr!17860 a!2986) i!1108 k0!1786) (size!18224 a!2986)))))

(declare-fun b!604395 () Bool)

(declare-fun res!388240 () Bool)

(assert (=> b!604395 (=> (not res!388240) (not e!345816))))

(assert (=> b!604395 (= res!388240 (validKeyInArray!0 k0!1786))))

(declare-fun b!604396 () Bool)

(assert (=> b!604396 (= e!345815 e!345809)))

(declare-fun res!388258 () Bool)

(assert (=> b!604396 (=> (not res!388258) (not e!345809))))

(assert (=> b!604396 (= res!388258 (arrayContainsKey!0 lt!275585 (select (arr!17860 a!2986) j!136) j!136))))

(declare-fun b!604397 () Bool)

(assert (=> b!604397 (= e!345810 e!345805)))

(declare-fun res!388248 () Bool)

(assert (=> b!604397 (=> res!388248 e!345805)))

(assert (=> b!604397 (= res!388248 (bvsge index!984 j!136))))

(declare-fun lt!275572 () Unit!19189)

(assert (=> b!604397 (= lt!275572 e!345813)))

(declare-fun c!68438 () Bool)

(assert (=> b!604397 (= c!68438 (bvslt j!136 index!984))))

(declare-fun res!388247 () Bool)

(assert (=> start!55194 (=> (not res!388247) (not e!345816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55194 (= res!388247 (validMask!0 mask!3053))))

(assert (=> start!55194 e!345816))

(assert (=> start!55194 true))

(declare-fun array_inv!13719 (array!37212) Bool)

(assert (=> start!55194 (array_inv!13719 a!2986)))

(declare-fun b!604381 () Bool)

(declare-fun Unit!19194 () Unit!19189)

(assert (=> b!604381 (= e!345806 Unit!19194)))

(declare-fun b!604398 () Bool)

(declare-fun res!388250 () Bool)

(assert (=> b!604398 (=> (not res!388250) (not e!345807))))

(assert (=> b!604398 (= res!388250 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17860 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604399 () Bool)

(declare-fun res!388246 () Bool)

(assert (=> b!604399 (=> (not res!388246) (not e!345807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37212 (_ BitVec 32)) Bool)

(assert (=> b!604399 (= res!388246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!55194 res!388247) b!604382))

(assert (= (and b!604382 res!388251) b!604392))

(assert (= (and b!604392 res!388254) b!604395))

(assert (= (and b!604395 res!388240) b!604390))

(assert (= (and b!604390 res!388243) b!604380))

(assert (= (and b!604380 res!388242) b!604399))

(assert (= (and b!604399 res!388246) b!604377))

(assert (= (and b!604377 res!388249) b!604398))

(assert (= (and b!604398 res!388250) b!604394))

(assert (= (and b!604394 res!388245) b!604387))

(assert (= (and b!604387 res!388244) b!604379))

(assert (= (and b!604379 res!388255) b!604393))

(assert (= (and b!604379 c!68437) b!604378))

(assert (= (and b!604379 (not c!68437)) b!604381))

(assert (= (and b!604379 (not res!388257)) b!604384))

(assert (= (and b!604384 res!388241) b!604383))

(assert (= (and b!604383 (not res!388253)) b!604396))

(assert (= (and b!604396 res!388258) b!604388))

(assert (= (and b!604384 (not res!388256)) b!604397))

(assert (= (and b!604397 c!68438) b!604385))

(assert (= (and b!604397 (not c!68438)) b!604391))

(assert (= (and b!604397 (not res!388248)) b!604386))

(assert (= (and b!604386 res!388252) b!604389))

(declare-fun m!581537 () Bool)

(assert (=> b!604384 m!581537))

(declare-fun m!581539 () Bool)

(assert (=> b!604384 m!581539))

(declare-fun m!581541 () Bool)

(assert (=> b!604384 m!581541))

(declare-fun m!581543 () Bool)

(assert (=> b!604398 m!581543))

(declare-fun m!581545 () Bool)

(assert (=> b!604399 m!581545))

(assert (=> b!604386 m!581537))

(assert (=> b!604386 m!581537))

(declare-fun m!581547 () Bool)

(assert (=> b!604386 m!581547))

(assert (=> b!604386 m!581537))

(declare-fun m!581549 () Bool)

(assert (=> b!604386 m!581549))

(assert (=> b!604386 m!581537))

(declare-fun m!581551 () Bool)

(assert (=> b!604386 m!581551))

(declare-fun m!581553 () Bool)

(assert (=> b!604390 m!581553))

(assert (=> b!604396 m!581537))

(assert (=> b!604396 m!581537))

(assert (=> b!604396 m!581551))

(assert (=> b!604385 m!581537))

(declare-fun m!581555 () Bool)

(assert (=> b!604385 m!581555))

(assert (=> b!604385 m!581537))

(declare-fun m!581557 () Bool)

(assert (=> b!604385 m!581557))

(declare-fun m!581559 () Bool)

(assert (=> b!604385 m!581559))

(assert (=> b!604385 m!581537))

(declare-fun m!581561 () Bool)

(assert (=> b!604385 m!581561))

(declare-fun m!581563 () Bool)

(assert (=> b!604385 m!581563))

(assert (=> b!604385 m!581537))

(declare-fun m!581565 () Bool)

(assert (=> b!604385 m!581565))

(declare-fun m!581567 () Bool)

(assert (=> b!604385 m!581567))

(assert (=> b!604392 m!581537))

(assert (=> b!604392 m!581537))

(declare-fun m!581569 () Bool)

(assert (=> b!604392 m!581569))

(declare-fun m!581571 () Bool)

(assert (=> b!604379 m!581571))

(declare-fun m!581573 () Bool)

(assert (=> b!604379 m!581573))

(assert (=> b!604379 m!581537))

(declare-fun m!581575 () Bool)

(assert (=> b!604379 m!581575))

(assert (=> b!604379 m!581539))

(declare-fun m!581577 () Bool)

(assert (=> b!604379 m!581577))

(assert (=> b!604379 m!581537))

(declare-fun m!581579 () Bool)

(assert (=> b!604379 m!581579))

(declare-fun m!581581 () Bool)

(assert (=> b!604379 m!581581))

(assert (=> b!604383 m!581537))

(assert (=> b!604388 m!581537))

(assert (=> b!604388 m!581537))

(declare-fun m!581583 () Bool)

(assert (=> b!604388 m!581583))

(declare-fun m!581585 () Bool)

(assert (=> start!55194 m!581585))

(declare-fun m!581587 () Bool)

(assert (=> start!55194 m!581587))

(assert (=> b!604394 m!581539))

(declare-fun m!581589 () Bool)

(assert (=> b!604394 m!581589))

(declare-fun m!581591 () Bool)

(assert (=> b!604380 m!581591))

(declare-fun m!581593 () Bool)

(assert (=> b!604377 m!581593))

(assert (=> b!604389 m!581537))

(assert (=> b!604389 m!581537))

(assert (=> b!604389 m!581583))

(declare-fun m!581595 () Bool)

(assert (=> b!604387 m!581595))

(assert (=> b!604387 m!581537))

(assert (=> b!604387 m!581537))

(declare-fun m!581597 () Bool)

(assert (=> b!604387 m!581597))

(declare-fun m!581599 () Bool)

(assert (=> b!604395 m!581599))

(check-sat (not b!604380) (not b!604399) (not b!604390) (not b!604388) (not b!604379) (not b!604385) (not b!604389) (not b!604377) (not b!604387) (not b!604392) (not start!55194) (not b!604396) (not b!604395) (not b!604386))
(check-sat)
