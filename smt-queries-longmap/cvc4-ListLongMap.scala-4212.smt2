; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57720 () Bool)

(assert start!57720)

(declare-fun e!365378 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38291 0))(
  ( (array!38292 (arr!18368 (Array (_ BitVec 32) (_ BitVec 64))) (size!18732 (_ BitVec 32))) )
))
(declare-fun lt!295314 () array!38291)

(declare-fun b!638537 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38291)

(declare-fun arrayContainsKey!0 (array!38291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638537 (= e!365378 (arrayContainsKey!0 lt!295314 (select (arr!18368 a!2986) j!136) index!984))))

(declare-fun b!638538 () Bool)

(declare-fun e!365386 () Bool)

(declare-fun e!365387 () Bool)

(assert (=> b!638538 (= e!365386 e!365387)))

(declare-fun res!413359 () Bool)

(assert (=> b!638538 (=> res!413359 e!365387)))

(declare-fun lt!295313 () (_ BitVec 64))

(declare-fun lt!295318 () (_ BitVec 64))

(assert (=> b!638538 (= res!413359 (or (not (= (select (arr!18368 a!2986) j!136) lt!295313)) (not (= (select (arr!18368 a!2986) j!136) lt!295318)) (bvsge j!136 index!984)))))

(declare-fun b!638539 () Bool)

(declare-fun res!413357 () Bool)

(declare-fun e!365384 () Bool)

(assert (=> b!638539 (=> (not res!413357) (not e!365384))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638539 (= res!413357 (validKeyInArray!0 k!1786))))

(declare-fun b!638541 () Bool)

(declare-fun e!365381 () Bool)

(declare-fun e!365383 () Bool)

(assert (=> b!638541 (= e!365381 e!365383)))

(declare-fun res!413354 () Bool)

(assert (=> b!638541 (=> res!413354 e!365383)))

(assert (=> b!638541 (= res!413354 (or (not (= (select (arr!18368 a!2986) j!136) lt!295313)) (not (= (select (arr!18368 a!2986) j!136) lt!295318)) (bvsge j!136 index!984)))))

(assert (=> b!638541 e!365386))

(declare-fun res!413356 () Bool)

(assert (=> b!638541 (=> (not res!413356) (not e!365386))))

(assert (=> b!638541 (= res!413356 (= lt!295318 (select (arr!18368 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!638541 (= lt!295318 (select (store (arr!18368 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!638542 () Bool)

(declare-datatypes ((Unit!21566 0))(
  ( (Unit!21567) )
))
(declare-fun e!365380 () Unit!21566)

(declare-fun Unit!21568 () Unit!21566)

(assert (=> b!638542 (= e!365380 Unit!21568)))

(declare-fun b!638543 () Bool)

(declare-fun e!365388 () Bool)

(declare-fun e!365382 () Bool)

(assert (=> b!638543 (= e!365388 e!365382)))

(declare-fun res!413349 () Bool)

(assert (=> b!638543 (=> (not res!413349) (not e!365382))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!638543 (= res!413349 (= (select (store (arr!18368 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638543 (= lt!295314 (array!38292 (store (arr!18368 a!2986) i!1108 k!1786) (size!18732 a!2986)))))

(declare-fun b!638544 () Bool)

(declare-fun e!365377 () Bool)

(declare-datatypes ((SeekEntryResult!6808 0))(
  ( (MissingZero!6808 (index!29546 (_ BitVec 32))) (Found!6808 (index!29547 (_ BitVec 32))) (Intermediate!6808 (undefined!7620 Bool) (index!29548 (_ BitVec 32)) (x!58298 (_ BitVec 32))) (Undefined!6808) (MissingVacant!6808 (index!29549 (_ BitVec 32))) )
))
(declare-fun lt!295317 () SeekEntryResult!6808)

(declare-fun lt!295320 () SeekEntryResult!6808)

(assert (=> b!638544 (= e!365377 (= lt!295317 lt!295320))))

(declare-fun b!638545 () Bool)

(declare-fun Unit!21569 () Unit!21566)

(assert (=> b!638545 (= e!365380 Unit!21569)))

(assert (=> b!638545 false))

(declare-fun b!638546 () Bool)

(declare-fun e!365379 () Bool)

(assert (=> b!638546 (= e!365382 e!365379)))

(declare-fun res!413362 () Bool)

(assert (=> b!638546 (=> (not res!413362) (not e!365379))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!638546 (= res!413362 (and (= lt!295317 (Found!6808 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18368 a!2986) index!984) (select (arr!18368 a!2986) j!136))) (not (= (select (arr!18368 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38291 (_ BitVec 32)) SeekEntryResult!6808)

(assert (=> b!638546 (= lt!295317 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18368 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638547 () Bool)

(declare-fun res!413352 () Bool)

(assert (=> b!638547 (=> (not res!413352) (not e!365388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38291 (_ BitVec 32)) Bool)

(assert (=> b!638547 (= res!413352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638548 () Bool)

(declare-fun res!413347 () Bool)

(assert (=> b!638548 (=> (not res!413347) (not e!365384))))

(assert (=> b!638548 (= res!413347 (and (= (size!18732 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18732 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18732 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638549 () Bool)

(declare-fun res!413350 () Bool)

(assert (=> b!638549 (=> (not res!413350) (not e!365384))))

(assert (=> b!638549 (= res!413350 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638550 () Bool)

(assert (=> b!638550 (= e!365384 e!365388)))

(declare-fun res!413355 () Bool)

(assert (=> b!638550 (=> (not res!413355) (not e!365388))))

(declare-fun lt!295324 () SeekEntryResult!6808)

(assert (=> b!638550 (= res!413355 (or (= lt!295324 (MissingZero!6808 i!1108)) (= lt!295324 (MissingVacant!6808 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38291 (_ BitVec 32)) SeekEntryResult!6808)

(assert (=> b!638550 (= lt!295324 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!638551 () Bool)

(declare-fun res!413363 () Bool)

(assert (=> b!638551 (=> (not res!413363) (not e!365388))))

(declare-datatypes ((List!12409 0))(
  ( (Nil!12406) (Cons!12405 (h!13450 (_ BitVec 64)) (t!18637 List!12409)) )
))
(declare-fun arrayNoDuplicates!0 (array!38291 (_ BitVec 32) List!12409) Bool)

(assert (=> b!638551 (= res!413363 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12406))))

(declare-fun b!638552 () Bool)

(declare-fun res!413351 () Bool)

(assert (=> b!638552 (=> (not res!413351) (not e!365388))))

(assert (=> b!638552 (= res!413351 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18368 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638553 () Bool)

(declare-fun res!413353 () Bool)

(assert (=> b!638553 (=> (not res!413353) (not e!365384))))

(assert (=> b!638553 (= res!413353 (validKeyInArray!0 (select (arr!18368 a!2986) j!136)))))

(declare-fun b!638540 () Bool)

(assert (=> b!638540 (= e!365383 true)))

(assert (=> b!638540 (arrayNoDuplicates!0 lt!295314 #b00000000000000000000000000000000 Nil!12406)))

(declare-fun lt!295321 () Unit!21566)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38291 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12409) Unit!21566)

(assert (=> b!638540 (= lt!295321 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12406))))

(assert (=> b!638540 (arrayContainsKey!0 lt!295314 (select (arr!18368 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295323 () Unit!21566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38291 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21566)

(assert (=> b!638540 (= lt!295323 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295314 (select (arr!18368 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!413348 () Bool)

(assert (=> start!57720 (=> (not res!413348) (not e!365384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57720 (= res!413348 (validMask!0 mask!3053))))

(assert (=> start!57720 e!365384))

(assert (=> start!57720 true))

(declare-fun array_inv!14164 (array!38291) Bool)

(assert (=> start!57720 (array_inv!14164 a!2986)))

(declare-fun b!638554 () Bool)

(assert (=> b!638554 (= e!365379 (not e!365381))))

(declare-fun res!413361 () Bool)

(assert (=> b!638554 (=> res!413361 e!365381)))

(declare-fun lt!295319 () SeekEntryResult!6808)

(assert (=> b!638554 (= res!413361 (not (= lt!295319 (Found!6808 index!984))))))

(declare-fun lt!295316 () Unit!21566)

(assert (=> b!638554 (= lt!295316 e!365380)))

(declare-fun c!72962 () Bool)

(assert (=> b!638554 (= c!72962 (= lt!295319 Undefined!6808))))

(assert (=> b!638554 (= lt!295319 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295313 lt!295314 mask!3053))))

(assert (=> b!638554 e!365377))

(declare-fun res!413358 () Bool)

(assert (=> b!638554 (=> (not res!413358) (not e!365377))))

(declare-fun lt!295322 () (_ BitVec 32))

(assert (=> b!638554 (= res!413358 (= lt!295320 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295322 vacantSpotIndex!68 lt!295313 lt!295314 mask!3053)))))

(assert (=> b!638554 (= lt!295320 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295322 vacantSpotIndex!68 (select (arr!18368 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638554 (= lt!295313 (select (store (arr!18368 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295315 () Unit!21566)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38291 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21566)

(assert (=> b!638554 (= lt!295315 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295322 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638554 (= lt!295322 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638555 () Bool)

(assert (=> b!638555 (= e!365387 e!365378)))

(declare-fun res!413360 () Bool)

(assert (=> b!638555 (=> (not res!413360) (not e!365378))))

(assert (=> b!638555 (= res!413360 (arrayContainsKey!0 lt!295314 (select (arr!18368 a!2986) j!136) j!136))))

(assert (= (and start!57720 res!413348) b!638548))

(assert (= (and b!638548 res!413347) b!638553))

(assert (= (and b!638553 res!413353) b!638539))

(assert (= (and b!638539 res!413357) b!638549))

(assert (= (and b!638549 res!413350) b!638550))

(assert (= (and b!638550 res!413355) b!638547))

(assert (= (and b!638547 res!413352) b!638551))

(assert (= (and b!638551 res!413363) b!638552))

(assert (= (and b!638552 res!413351) b!638543))

(assert (= (and b!638543 res!413349) b!638546))

(assert (= (and b!638546 res!413362) b!638554))

(assert (= (and b!638554 res!413358) b!638544))

(assert (= (and b!638554 c!72962) b!638545))

(assert (= (and b!638554 (not c!72962)) b!638542))

(assert (= (and b!638554 (not res!413361)) b!638541))

(assert (= (and b!638541 res!413356) b!638538))

(assert (= (and b!638538 (not res!413359)) b!638555))

(assert (= (and b!638555 res!413360) b!638537))

(assert (= (and b!638541 (not res!413354)) b!638540))

(declare-fun m!612461 () Bool)

(assert (=> b!638549 m!612461))

(declare-fun m!612463 () Bool)

(assert (=> b!638547 m!612463))

(declare-fun m!612465 () Bool)

(assert (=> b!638540 m!612465))

(assert (=> b!638540 m!612465))

(declare-fun m!612467 () Bool)

(assert (=> b!638540 m!612467))

(assert (=> b!638540 m!612465))

(declare-fun m!612469 () Bool)

(assert (=> b!638540 m!612469))

(declare-fun m!612471 () Bool)

(assert (=> b!638540 m!612471))

(declare-fun m!612473 () Bool)

(assert (=> b!638540 m!612473))

(declare-fun m!612475 () Bool)

(assert (=> b!638552 m!612475))

(declare-fun m!612477 () Bool)

(assert (=> b!638543 m!612477))

(declare-fun m!612479 () Bool)

(assert (=> b!638543 m!612479))

(assert (=> b!638537 m!612465))

(assert (=> b!638537 m!612465))

(declare-fun m!612481 () Bool)

(assert (=> b!638537 m!612481))

(declare-fun m!612483 () Bool)

(assert (=> b!638554 m!612483))

(declare-fun m!612485 () Bool)

(assert (=> b!638554 m!612485))

(declare-fun m!612487 () Bool)

(assert (=> b!638554 m!612487))

(declare-fun m!612489 () Bool)

(assert (=> b!638554 m!612489))

(assert (=> b!638554 m!612465))

(assert (=> b!638554 m!612477))

(declare-fun m!612491 () Bool)

(assert (=> b!638554 m!612491))

(assert (=> b!638554 m!612465))

(declare-fun m!612493 () Bool)

(assert (=> b!638554 m!612493))

(declare-fun m!612495 () Bool)

(assert (=> b!638550 m!612495))

(assert (=> b!638541 m!612465))

(assert (=> b!638541 m!612477))

(declare-fun m!612497 () Bool)

(assert (=> b!638541 m!612497))

(assert (=> b!638555 m!612465))

(assert (=> b!638555 m!612465))

(declare-fun m!612499 () Bool)

(assert (=> b!638555 m!612499))

(assert (=> b!638553 m!612465))

(assert (=> b!638553 m!612465))

(declare-fun m!612501 () Bool)

(assert (=> b!638553 m!612501))

(assert (=> b!638538 m!612465))

(declare-fun m!612503 () Bool)

(assert (=> start!57720 m!612503))

(declare-fun m!612505 () Bool)

(assert (=> start!57720 m!612505))

(declare-fun m!612507 () Bool)

(assert (=> b!638539 m!612507))

(declare-fun m!612509 () Bool)

(assert (=> b!638546 m!612509))

(assert (=> b!638546 m!612465))

(assert (=> b!638546 m!612465))

(declare-fun m!612511 () Bool)

(assert (=> b!638546 m!612511))

(declare-fun m!612513 () Bool)

(assert (=> b!638551 m!612513))

(push 1)

(assert (not b!638540))

(assert (not b!638555))

(assert (not b!638554))

(assert (not b!638537))

(assert (not b!638553))

(assert (not b!638551))

(assert (not b!638547))

(assert (not b!638546))

(assert (not b!638550))

(assert (not start!57720))

(assert (not b!638539))

(assert (not b!638549))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

