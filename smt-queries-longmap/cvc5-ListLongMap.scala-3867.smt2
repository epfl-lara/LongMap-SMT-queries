; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53212 () Bool)

(assert start!53212)

(declare-fun res!366234 () Bool)

(declare-fun e!332645 () Bool)

(assert (=> start!53212 (=> (not res!366234) (not e!332645))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53212 (= res!366234 (validMask!0 mask!3053))))

(assert (=> start!53212 e!332645))

(assert (=> start!53212 true))

(declare-datatypes ((array!36113 0))(
  ( (array!36114 (arr!17331 (Array (_ BitVec 32) (_ BitVec 64))) (size!17695 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36113)

(declare-fun array_inv!13127 (array!36113) Bool)

(assert (=> start!53212 (array_inv!13127 a!2986)))

(declare-fun b!578417 () Bool)

(declare-fun res!366236 () Bool)

(assert (=> b!578417 (=> (not res!366236) (not e!332645))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578417 (= res!366236 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578418 () Bool)

(declare-fun res!366238 () Bool)

(assert (=> b!578418 (=> (not res!366238) (not e!332645))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578418 (= res!366238 (validKeyInArray!0 (select (arr!17331 a!2986) j!136)))))

(declare-fun b!578419 () Bool)

(declare-fun res!366237 () Bool)

(declare-fun e!332644 () Bool)

(assert (=> b!578419 (=> (not res!366237) (not e!332644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36113 (_ BitVec 32)) Bool)

(assert (=> b!578419 (= res!366237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578420 () Bool)

(declare-fun res!366235 () Bool)

(assert (=> b!578420 (=> (not res!366235) (not e!332645))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578420 (= res!366235 (and (= (size!17695 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17695 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17695 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578421 () Bool)

(declare-fun res!366239 () Bool)

(assert (=> b!578421 (=> (not res!366239) (not e!332645))))

(assert (=> b!578421 (= res!366239 (validKeyInArray!0 k!1786))))

(declare-fun b!578422 () Bool)

(assert (=> b!578422 (= e!332645 e!332644)))

(declare-fun res!366233 () Bool)

(assert (=> b!578422 (=> (not res!366233) (not e!332644))))

(declare-datatypes ((SeekEntryResult!5771 0))(
  ( (MissingZero!5771 (index!25311 (_ BitVec 32))) (Found!5771 (index!25312 (_ BitVec 32))) (Intermediate!5771 (undefined!6583 Bool) (index!25313 (_ BitVec 32)) (x!54216 (_ BitVec 32))) (Undefined!5771) (MissingVacant!5771 (index!25314 (_ BitVec 32))) )
))
(declare-fun lt!264255 () SeekEntryResult!5771)

(assert (=> b!578422 (= res!366233 (or (= lt!264255 (MissingZero!5771 i!1108)) (= lt!264255 (MissingVacant!5771 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36113 (_ BitVec 32)) SeekEntryResult!5771)

(assert (=> b!578422 (= lt!264255 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578423 () Bool)

(assert (=> b!578423 (= e!332644 false)))

(declare-fun lt!264256 () Bool)

(declare-datatypes ((List!11372 0))(
  ( (Nil!11369) (Cons!11368 (h!12413 (_ BitVec 64)) (t!17600 List!11372)) )
))
(declare-fun arrayNoDuplicates!0 (array!36113 (_ BitVec 32) List!11372) Bool)

(assert (=> b!578423 (= lt!264256 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11369))))

(assert (= (and start!53212 res!366234) b!578420))

(assert (= (and b!578420 res!366235) b!578418))

(assert (= (and b!578418 res!366238) b!578421))

(assert (= (and b!578421 res!366239) b!578417))

(assert (= (and b!578417 res!366236) b!578422))

(assert (= (and b!578422 res!366233) b!578419))

(assert (= (and b!578419 res!366237) b!578423))

(declare-fun m!557107 () Bool)

(assert (=> b!578418 m!557107))

(assert (=> b!578418 m!557107))

(declare-fun m!557109 () Bool)

(assert (=> b!578418 m!557109))

(declare-fun m!557111 () Bool)

(assert (=> b!578422 m!557111))

(declare-fun m!557113 () Bool)

(assert (=> start!53212 m!557113))

(declare-fun m!557115 () Bool)

(assert (=> start!53212 m!557115))

(declare-fun m!557117 () Bool)

(assert (=> b!578421 m!557117))

(declare-fun m!557119 () Bool)

(assert (=> b!578419 m!557119))

(declare-fun m!557121 () Bool)

(assert (=> b!578423 m!557121))

(declare-fun m!557123 () Bool)

(assert (=> b!578417 m!557123))

(push 1)

