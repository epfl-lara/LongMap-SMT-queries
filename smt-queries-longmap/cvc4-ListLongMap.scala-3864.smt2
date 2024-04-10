; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53198 () Bool)

(assert start!53198)

(declare-fun res!366088 () Bool)

(declare-fun e!332582 () Bool)

(assert (=> start!53198 (=> (not res!366088) (not e!332582))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53198 (= res!366088 (validMask!0 mask!3053))))

(assert (=> start!53198 e!332582))

(assert (=> start!53198 true))

(declare-datatypes ((array!36099 0))(
  ( (array!36100 (arr!17324 (Array (_ BitVec 32) (_ BitVec 64))) (size!17688 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36099)

(declare-fun array_inv!13120 (array!36099) Bool)

(assert (=> start!53198 (array_inv!13120 a!2986)))

(declare-fun b!578270 () Bool)

(declare-fun e!332581 () Bool)

(assert (=> b!578270 (= e!332581 false)))

(declare-fun lt!264213 () Bool)

(declare-datatypes ((List!11365 0))(
  ( (Nil!11362) (Cons!11361 (h!12406 (_ BitVec 64)) (t!17593 List!11365)) )
))
(declare-fun arrayNoDuplicates!0 (array!36099 (_ BitVec 32) List!11365) Bool)

(assert (=> b!578270 (= lt!264213 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11362))))

(declare-fun b!578271 () Bool)

(declare-fun res!366089 () Bool)

(assert (=> b!578271 (=> (not res!366089) (not e!332582))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578271 (= res!366089 (validKeyInArray!0 k!1786))))

(declare-fun b!578272 () Bool)

(declare-fun res!366087 () Bool)

(assert (=> b!578272 (=> (not res!366087) (not e!332582))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578272 (= res!366087 (validKeyInArray!0 (select (arr!17324 a!2986) j!136)))))

(declare-fun b!578273 () Bool)

(declare-fun res!366090 () Bool)

(assert (=> b!578273 (=> (not res!366090) (not e!332582))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578273 (= res!366090 (and (= (size!17688 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17688 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17688 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578274 () Bool)

(declare-fun res!366092 () Bool)

(assert (=> b!578274 (=> (not res!366092) (not e!332582))))

(declare-fun arrayContainsKey!0 (array!36099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578274 (= res!366092 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578275 () Bool)

(assert (=> b!578275 (= e!332582 e!332581)))

(declare-fun res!366086 () Bool)

(assert (=> b!578275 (=> (not res!366086) (not e!332581))))

(declare-datatypes ((SeekEntryResult!5764 0))(
  ( (MissingZero!5764 (index!25283 (_ BitVec 32))) (Found!5764 (index!25284 (_ BitVec 32))) (Intermediate!5764 (undefined!6576 Bool) (index!25285 (_ BitVec 32)) (x!54185 (_ BitVec 32))) (Undefined!5764) (MissingVacant!5764 (index!25286 (_ BitVec 32))) )
))
(declare-fun lt!264214 () SeekEntryResult!5764)

(assert (=> b!578275 (= res!366086 (or (= lt!264214 (MissingZero!5764 i!1108)) (= lt!264214 (MissingVacant!5764 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36099 (_ BitVec 32)) SeekEntryResult!5764)

(assert (=> b!578275 (= lt!264214 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578276 () Bool)

(declare-fun res!366091 () Bool)

(assert (=> b!578276 (=> (not res!366091) (not e!332581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36099 (_ BitVec 32)) Bool)

(assert (=> b!578276 (= res!366091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53198 res!366088) b!578273))

(assert (= (and b!578273 res!366090) b!578272))

(assert (= (and b!578272 res!366087) b!578271))

(assert (= (and b!578271 res!366089) b!578274))

(assert (= (and b!578274 res!366092) b!578275))

(assert (= (and b!578275 res!366086) b!578276))

(assert (= (and b!578276 res!366091) b!578270))

(declare-fun m!556981 () Bool)

(assert (=> b!578274 m!556981))

(declare-fun m!556983 () Bool)

(assert (=> start!53198 m!556983))

(declare-fun m!556985 () Bool)

(assert (=> start!53198 m!556985))

(declare-fun m!556987 () Bool)

(assert (=> b!578271 m!556987))

(declare-fun m!556989 () Bool)

(assert (=> b!578272 m!556989))

(assert (=> b!578272 m!556989))

(declare-fun m!556991 () Bool)

(assert (=> b!578272 m!556991))

(declare-fun m!556993 () Bool)

(assert (=> b!578275 m!556993))

(declare-fun m!556995 () Bool)

(assert (=> b!578276 m!556995))

(declare-fun m!556997 () Bool)

(assert (=> b!578270 m!556997))

(push 1)

(assert (not b!578271))

(assert (not b!578275))

(assert (not b!578272))

(assert (not start!53198))

(assert (not b!578276))

(assert (not b!578274))

(assert (not b!578270))

(check-sat)

(pop 1)

