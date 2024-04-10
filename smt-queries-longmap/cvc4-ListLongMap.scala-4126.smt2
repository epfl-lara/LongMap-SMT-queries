; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56306 () Bool)

(assert start!56306)

(declare-fun b!624323 () Bool)

(declare-fun res!402479 () Bool)

(declare-fun e!358044 () Bool)

(assert (=> b!624323 (=> (not res!402479) (not e!358044))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37731 0))(
  ( (array!37732 (arr!18110 (Array (_ BitVec 32) (_ BitVec 64))) (size!18474 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37731)

(assert (=> b!624323 (= res!402479 (and (= (size!18474 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18474 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18474 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!402477 () Bool)

(assert (=> start!56306 (=> (not res!402477) (not e!358044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56306 (= res!402477 (validMask!0 mask!3053))))

(assert (=> start!56306 e!358044))

(assert (=> start!56306 true))

(declare-fun array_inv!13906 (array!37731) Bool)

(assert (=> start!56306 (array_inv!13906 a!2986)))

(declare-fun b!624324 () Bool)

(declare-fun e!358042 () Bool)

(assert (=> b!624324 (= e!358044 e!358042)))

(declare-fun res!402474 () Bool)

(assert (=> b!624324 (=> (not res!402474) (not e!358042))))

(declare-datatypes ((SeekEntryResult!6550 0))(
  ( (MissingZero!6550 (index!28484 (_ BitVec 32))) (Found!6550 (index!28485 (_ BitVec 32))) (Intermediate!6550 (undefined!7362 Bool) (index!28486 (_ BitVec 32)) (x!57241 (_ BitVec 32))) (Undefined!6550) (MissingVacant!6550 (index!28487 (_ BitVec 32))) )
))
(declare-fun lt!289575 () SeekEntryResult!6550)

(assert (=> b!624324 (= res!402474 (or (= lt!289575 (MissingZero!6550 i!1108)) (= lt!289575 (MissingVacant!6550 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37731 (_ BitVec 32)) SeekEntryResult!6550)

(assert (=> b!624324 (= lt!289575 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624325 () Bool)

(declare-fun res!402473 () Bool)

(assert (=> b!624325 (=> (not res!402473) (not e!358044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624325 (= res!402473 (validKeyInArray!0 k!1786))))

(declare-fun b!624326 () Bool)

(declare-fun res!402478 () Bool)

(assert (=> b!624326 (=> (not res!402478) (not e!358044))))

(assert (=> b!624326 (= res!402478 (validKeyInArray!0 (select (arr!18110 a!2986) j!136)))))

(declare-fun b!624327 () Bool)

(declare-fun res!402476 () Bool)

(assert (=> b!624327 (=> (not res!402476) (not e!358044))))

(declare-fun arrayContainsKey!0 (array!37731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624327 (= res!402476 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624328 () Bool)

(declare-fun res!402475 () Bool)

(assert (=> b!624328 (=> (not res!402475) (not e!358042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37731 (_ BitVec 32)) Bool)

(assert (=> b!624328 (= res!402475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624329 () Bool)

(assert (=> b!624329 (= e!358042 false)))

(declare-fun lt!289576 () Bool)

(declare-datatypes ((List!12151 0))(
  ( (Nil!12148) (Cons!12147 (h!13192 (_ BitVec 64)) (t!18379 List!12151)) )
))
(declare-fun arrayNoDuplicates!0 (array!37731 (_ BitVec 32) List!12151) Bool)

(assert (=> b!624329 (= lt!289576 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12148))))

(assert (= (and start!56306 res!402477) b!624323))

(assert (= (and b!624323 res!402479) b!624326))

(assert (= (and b!624326 res!402478) b!624325))

(assert (= (and b!624325 res!402473) b!624327))

(assert (= (and b!624327 res!402476) b!624324))

(assert (= (and b!624324 res!402474) b!624328))

(assert (= (and b!624328 res!402475) b!624329))

(declare-fun m!600047 () Bool)

(assert (=> b!624329 m!600047))

(declare-fun m!600049 () Bool)

(assert (=> b!624328 m!600049))

(declare-fun m!600051 () Bool)

(assert (=> b!624325 m!600051))

(declare-fun m!600053 () Bool)

(assert (=> b!624324 m!600053))

(declare-fun m!600055 () Bool)

(assert (=> b!624327 m!600055))

(declare-fun m!600057 () Bool)

(assert (=> b!624326 m!600057))

(assert (=> b!624326 m!600057))

(declare-fun m!600059 () Bool)

(assert (=> b!624326 m!600059))

(declare-fun m!600061 () Bool)

(assert (=> start!56306 m!600061))

(declare-fun m!600063 () Bool)

(assert (=> start!56306 m!600063))

(push 1)

(assert (not b!624326))

