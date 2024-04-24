; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56350 () Bool)

(assert start!56350)

(declare-fun b!624468 () Bool)

(declare-fun res!402513 () Bool)

(declare-fun e!358145 () Bool)

(assert (=> b!624468 (=> (not res!402513) (not e!358145))))

(declare-datatypes ((array!37720 0))(
  ( (array!37721 (arr!18102 (Array (_ BitVec 32) (_ BitVec 64))) (size!18466 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37720)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624468 (= res!402513 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624469 () Bool)

(declare-fun res!402520 () Bool)

(assert (=> b!624469 (=> (not res!402520) (not e!358145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624469 (= res!402520 (validKeyInArray!0 k!1786))))

(declare-fun b!624470 () Bool)

(declare-fun res!402514 () Bool)

(assert (=> b!624470 (=> (not res!402514) (not e!358145))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624470 (= res!402514 (validKeyInArray!0 (select (arr!18102 a!2986) j!136)))))

(declare-fun b!624471 () Bool)

(declare-fun res!402515 () Bool)

(declare-fun e!358144 () Bool)

(assert (=> b!624471 (=> (not res!402515) (not e!358144))))

(declare-datatypes ((List!12050 0))(
  ( (Nil!12047) (Cons!12046 (h!13094 (_ BitVec 64)) (t!18270 List!12050)) )
))
(declare-fun arrayNoDuplicates!0 (array!37720 (_ BitVec 32) List!12050) Bool)

(assert (=> b!624471 (= res!402515 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12047))))

(declare-fun b!624472 () Bool)

(declare-fun res!402517 () Bool)

(assert (=> b!624472 (=> (not res!402517) (not e!358144))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37720 (_ BitVec 32)) Bool)

(assert (=> b!624472 (= res!402517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624474 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624474 (= e!358144 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge vacantSpotIndex!68 (size!18466 a!2986))))))

(declare-fun b!624475 () Bool)

(assert (=> b!624475 (= e!358145 e!358144)))

(declare-fun res!402516 () Bool)

(assert (=> b!624475 (=> (not res!402516) (not e!358144))))

(declare-datatypes ((SeekEntryResult!6498 0))(
  ( (MissingZero!6498 (index!28276 (_ BitVec 32))) (Found!6498 (index!28277 (_ BitVec 32))) (Intermediate!6498 (undefined!7310 Bool) (index!28278 (_ BitVec 32)) (x!57184 (_ BitVec 32))) (Undefined!6498) (MissingVacant!6498 (index!28279 (_ BitVec 32))) )
))
(declare-fun lt!289660 () SeekEntryResult!6498)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624475 (= res!402516 (or (= lt!289660 (MissingZero!6498 i!1108)) (= lt!289660 (MissingVacant!6498 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37720 (_ BitVec 32)) SeekEntryResult!6498)

(assert (=> b!624475 (= lt!289660 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624473 () Bool)

(declare-fun res!402519 () Bool)

(assert (=> b!624473 (=> (not res!402519) (not e!358145))))

(assert (=> b!624473 (= res!402519 (and (= (size!18466 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18466 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18466 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!402518 () Bool)

(assert (=> start!56350 (=> (not res!402518) (not e!358145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56350 (= res!402518 (validMask!0 mask!3053))))

(assert (=> start!56350 e!358145))

(assert (=> start!56350 true))

(declare-fun array_inv!13961 (array!37720) Bool)

(assert (=> start!56350 (array_inv!13961 a!2986)))

(assert (= (and start!56350 res!402518) b!624473))

(assert (= (and b!624473 res!402519) b!624470))

(assert (= (and b!624470 res!402514) b!624469))

(assert (= (and b!624469 res!402520) b!624468))

(assert (= (and b!624468 res!402513) b!624475))

(assert (= (and b!624475 res!402516) b!624472))

(assert (= (and b!624472 res!402517) b!624471))

(assert (= (and b!624471 res!402515) b!624474))

(declare-fun m!600475 () Bool)

(assert (=> b!624469 m!600475))

(declare-fun m!600477 () Bool)

(assert (=> b!624475 m!600477))

(declare-fun m!600479 () Bool)

(assert (=> b!624472 m!600479))

(declare-fun m!600481 () Bool)

(assert (=> b!624470 m!600481))

(assert (=> b!624470 m!600481))

(declare-fun m!600483 () Bool)

(assert (=> b!624470 m!600483))

(declare-fun m!600485 () Bool)

(assert (=> b!624471 m!600485))

(declare-fun m!600487 () Bool)

(assert (=> b!624468 m!600487))

(declare-fun m!600489 () Bool)

(assert (=> start!56350 m!600489))

(declare-fun m!600491 () Bool)

(assert (=> start!56350 m!600491))

(push 1)

(assert (not b!624472))

(assert (not b!624475))

(assert (not b!624469))

(assert (not b!624471))

(assert (not start!56350))

(assert (not b!624468))

(assert (not b!624470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

