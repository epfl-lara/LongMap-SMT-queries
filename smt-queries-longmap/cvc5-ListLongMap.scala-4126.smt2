; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56302 () Bool)

(assert start!56302)

(declare-fun b!624281 () Bool)

(declare-fun res!402431 () Bool)

(declare-fun e!358025 () Bool)

(assert (=> b!624281 (=> (not res!402431) (not e!358025))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624281 (= res!402431 (validKeyInArray!0 k!1786))))

(declare-fun b!624282 () Bool)

(declare-fun res!402433 () Bool)

(assert (=> b!624282 (=> (not res!402433) (not e!358025))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37727 0))(
  ( (array!37728 (arr!18108 (Array (_ BitVec 32) (_ BitVec 64))) (size!18472 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37727)

(assert (=> b!624282 (= res!402433 (and (= (size!18472 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18472 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18472 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624283 () Bool)

(declare-fun e!358026 () Bool)

(assert (=> b!624283 (= e!358026 false)))

(declare-fun lt!289564 () Bool)

(declare-datatypes ((List!12149 0))(
  ( (Nil!12146) (Cons!12145 (h!13190 (_ BitVec 64)) (t!18377 List!12149)) )
))
(declare-fun arrayNoDuplicates!0 (array!37727 (_ BitVec 32) List!12149) Bool)

(assert (=> b!624283 (= lt!289564 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12146))))

(declare-fun res!402437 () Bool)

(assert (=> start!56302 (=> (not res!402437) (not e!358025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56302 (= res!402437 (validMask!0 mask!3053))))

(assert (=> start!56302 e!358025))

(assert (=> start!56302 true))

(declare-fun array_inv!13904 (array!37727) Bool)

(assert (=> start!56302 (array_inv!13904 a!2986)))

(declare-fun b!624284 () Bool)

(declare-fun res!402435 () Bool)

(assert (=> b!624284 (=> (not res!402435) (not e!358026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37727 (_ BitVec 32)) Bool)

(assert (=> b!624284 (= res!402435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624285 () Bool)

(declare-fun res!402434 () Bool)

(assert (=> b!624285 (=> (not res!402434) (not e!358025))))

(declare-fun arrayContainsKey!0 (array!37727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624285 (= res!402434 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624286 () Bool)

(declare-fun res!402436 () Bool)

(assert (=> b!624286 (=> (not res!402436) (not e!358025))))

(assert (=> b!624286 (= res!402436 (validKeyInArray!0 (select (arr!18108 a!2986) j!136)))))

(declare-fun b!624287 () Bool)

(assert (=> b!624287 (= e!358025 e!358026)))

(declare-fun res!402432 () Bool)

(assert (=> b!624287 (=> (not res!402432) (not e!358026))))

(declare-datatypes ((SeekEntryResult!6548 0))(
  ( (MissingZero!6548 (index!28476 (_ BitVec 32))) (Found!6548 (index!28477 (_ BitVec 32))) (Intermediate!6548 (undefined!7360 Bool) (index!28478 (_ BitVec 32)) (x!57239 (_ BitVec 32))) (Undefined!6548) (MissingVacant!6548 (index!28479 (_ BitVec 32))) )
))
(declare-fun lt!289563 () SeekEntryResult!6548)

(assert (=> b!624287 (= res!402432 (or (= lt!289563 (MissingZero!6548 i!1108)) (= lt!289563 (MissingVacant!6548 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37727 (_ BitVec 32)) SeekEntryResult!6548)

(assert (=> b!624287 (= lt!289563 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56302 res!402437) b!624282))

(assert (= (and b!624282 res!402433) b!624286))

(assert (= (and b!624286 res!402436) b!624281))

(assert (= (and b!624281 res!402431) b!624285))

(assert (= (and b!624285 res!402434) b!624287))

(assert (= (and b!624287 res!402432) b!624284))

(assert (= (and b!624284 res!402435) b!624283))

(declare-fun m!600011 () Bool)

(assert (=> b!624286 m!600011))

(assert (=> b!624286 m!600011))

(declare-fun m!600013 () Bool)

(assert (=> b!624286 m!600013))

(declare-fun m!600015 () Bool)

(assert (=> b!624285 m!600015))

(declare-fun m!600017 () Bool)

(assert (=> start!56302 m!600017))

(declare-fun m!600019 () Bool)

(assert (=> start!56302 m!600019))

(declare-fun m!600021 () Bool)

(assert (=> b!624283 m!600021))

(declare-fun m!600023 () Bool)

(assert (=> b!624287 m!600023))

(declare-fun m!600025 () Bool)

(assert (=> b!624281 m!600025))

(declare-fun m!600027 () Bool)

(assert (=> b!624284 m!600027))

(push 1)

