; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53206 () Bool)

(assert start!53206)

(declare-fun b!578354 () Bool)

(declare-fun e!332619 () Bool)

(declare-fun e!332617 () Bool)

(assert (=> b!578354 (= e!332619 e!332617)))

(declare-fun res!366172 () Bool)

(assert (=> b!578354 (=> (not res!366172) (not e!332617))))

(declare-datatypes ((SeekEntryResult!5768 0))(
  ( (MissingZero!5768 (index!25299 (_ BitVec 32))) (Found!5768 (index!25300 (_ BitVec 32))) (Intermediate!5768 (undefined!6580 Bool) (index!25301 (_ BitVec 32)) (x!54205 (_ BitVec 32))) (Undefined!5768) (MissingVacant!5768 (index!25302 (_ BitVec 32))) )
))
(declare-fun lt!264238 () SeekEntryResult!5768)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578354 (= res!366172 (or (= lt!264238 (MissingZero!5768 i!1108)) (= lt!264238 (MissingVacant!5768 i!1108))))))

(declare-datatypes ((array!36107 0))(
  ( (array!36108 (arr!17328 (Array (_ BitVec 32) (_ BitVec 64))) (size!17692 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36107)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36107 (_ BitVec 32)) SeekEntryResult!5768)

(assert (=> b!578354 (= lt!264238 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578355 () Bool)

(declare-fun res!366176 () Bool)

(assert (=> b!578355 (=> (not res!366176) (not e!332619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578355 (= res!366176 (validKeyInArray!0 k!1786))))

(declare-fun b!578357 () Bool)

(declare-fun res!366171 () Bool)

(assert (=> b!578357 (=> (not res!366171) (not e!332619))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578357 (= res!366171 (validKeyInArray!0 (select (arr!17328 a!2986) j!136)))))

(declare-fun b!578358 () Bool)

(declare-fun res!366170 () Bool)

(assert (=> b!578358 (=> (not res!366170) (not e!332619))))

(assert (=> b!578358 (= res!366170 (and (= (size!17692 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17692 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17692 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578359 () Bool)

(declare-fun res!366175 () Bool)

(assert (=> b!578359 (=> (not res!366175) (not e!332617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36107 (_ BitVec 32)) Bool)

(assert (=> b!578359 (= res!366175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578360 () Bool)

(declare-fun res!366173 () Bool)

(assert (=> b!578360 (=> (not res!366173) (not e!332619))))

(declare-fun arrayContainsKey!0 (array!36107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578360 (= res!366173 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578356 () Bool)

(assert (=> b!578356 (= e!332617 false)))

(declare-fun lt!264237 () Bool)

(declare-datatypes ((List!11369 0))(
  ( (Nil!11366) (Cons!11365 (h!12410 (_ BitVec 64)) (t!17597 List!11369)) )
))
(declare-fun arrayNoDuplicates!0 (array!36107 (_ BitVec 32) List!11369) Bool)

(assert (=> b!578356 (= lt!264237 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11366))))

(declare-fun res!366174 () Bool)

(assert (=> start!53206 (=> (not res!366174) (not e!332619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53206 (= res!366174 (validMask!0 mask!3053))))

(assert (=> start!53206 e!332619))

(assert (=> start!53206 true))

(declare-fun array_inv!13124 (array!36107) Bool)

(assert (=> start!53206 (array_inv!13124 a!2986)))

(assert (= (and start!53206 res!366174) b!578358))

(assert (= (and b!578358 res!366170) b!578357))

(assert (= (and b!578357 res!366171) b!578355))

(assert (= (and b!578355 res!366176) b!578360))

(assert (= (and b!578360 res!366173) b!578354))

(assert (= (and b!578354 res!366172) b!578359))

(assert (= (and b!578359 res!366175) b!578356))

(declare-fun m!557053 () Bool)

(assert (=> b!578360 m!557053))

(declare-fun m!557055 () Bool)

(assert (=> b!578356 m!557055))

(declare-fun m!557057 () Bool)

(assert (=> b!578355 m!557057))

(declare-fun m!557059 () Bool)

(assert (=> b!578354 m!557059))

(declare-fun m!557061 () Bool)

(assert (=> b!578359 m!557061))

(declare-fun m!557063 () Bool)

(assert (=> b!578357 m!557063))

(assert (=> b!578357 m!557063))

(declare-fun m!557065 () Bool)

(assert (=> b!578357 m!557065))

(declare-fun m!557067 () Bool)

(assert (=> start!53206 m!557067))

(declare-fun m!557069 () Bool)

(assert (=> start!53206 m!557069))

(push 1)

(assert (not b!578357))

(assert (not b!578359))

(assert (not b!578356))

(assert (not start!53206))

(assert (not b!578360))

(assert (not b!578354))

