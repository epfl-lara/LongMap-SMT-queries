; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56296 () Bool)

(assert start!56296)

(declare-fun b!624211 () Bool)

(declare-fun res!402362 () Bool)

(declare-fun e!357999 () Bool)

(assert (=> b!624211 (=> (not res!402362) (not e!357999))))

(declare-datatypes ((array!37721 0))(
  ( (array!37722 (arr!18105 (Array (_ BitVec 32) (_ BitVec 64))) (size!18469 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37721)

(declare-datatypes ((List!12146 0))(
  ( (Nil!12143) (Cons!12142 (h!13187 (_ BitVec 64)) (t!18374 List!12146)) )
))
(declare-fun arrayNoDuplicates!0 (array!37721 (_ BitVec 32) List!12146) Bool)

(assert (=> b!624211 (= res!402362 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12143))))

(declare-fun b!624212 () Bool)

(declare-fun res!402366 () Bool)

(declare-fun e!357998 () Bool)

(assert (=> b!624212 (=> (not res!402366) (not e!357998))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624212 (= res!402366 (and (= (size!18469 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18469 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18469 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624213 () Bool)

(assert (=> b!624213 (= e!357998 e!357999)))

(declare-fun res!402363 () Bool)

(assert (=> b!624213 (=> (not res!402363) (not e!357999))))

(declare-datatypes ((SeekEntryResult!6545 0))(
  ( (MissingZero!6545 (index!28464 (_ BitVec 32))) (Found!6545 (index!28465 (_ BitVec 32))) (Intermediate!6545 (undefined!7357 Bool) (index!28466 (_ BitVec 32)) (x!57228 (_ BitVec 32))) (Undefined!6545) (MissingVacant!6545 (index!28467 (_ BitVec 32))) )
))
(declare-fun lt!289552 () SeekEntryResult!6545)

(assert (=> b!624213 (= res!402363 (or (= lt!289552 (MissingZero!6545 i!1108)) (= lt!289552 (MissingVacant!6545 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37721 (_ BitVec 32)) SeekEntryResult!6545)

(assert (=> b!624213 (= lt!289552 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!402367 () Bool)

(assert (=> start!56296 (=> (not res!402367) (not e!357998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56296 (= res!402367 (validMask!0 mask!3053))))

(assert (=> start!56296 e!357998))

(assert (=> start!56296 true))

(declare-fun array_inv!13901 (array!37721) Bool)

(assert (=> start!56296 (array_inv!13901 a!2986)))

(declare-fun b!624214 () Bool)

(declare-fun res!402365 () Bool)

(assert (=> b!624214 (=> (not res!402365) (not e!357998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624214 (= res!402365 (validKeyInArray!0 k!1786))))

(declare-fun b!624215 () Bool)

(declare-fun res!402364 () Bool)

(assert (=> b!624215 (=> (not res!402364) (not e!357998))))

(assert (=> b!624215 (= res!402364 (validKeyInArray!0 (select (arr!18105 a!2986) j!136)))))

(declare-fun b!624216 () Bool)

(declare-fun res!402361 () Bool)

(assert (=> b!624216 (=> (not res!402361) (not e!357999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37721 (_ BitVec 32)) Bool)

(assert (=> b!624216 (= res!402361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624217 () Bool)

(declare-fun res!402368 () Bool)

(assert (=> b!624217 (=> (not res!402368) (not e!357998))))

(declare-fun arrayContainsKey!0 (array!37721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624217 (= res!402368 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun b!624218 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624218 (= e!357999 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge vacantSpotIndex!68 (size!18469 a!2986))))))

(assert (= (and start!56296 res!402367) b!624212))

(assert (= (and b!624212 res!402366) b!624215))

(assert (= (and b!624215 res!402364) b!624214))

(assert (= (and b!624214 res!402365) b!624217))

(assert (= (and b!624217 res!402368) b!624213))

(assert (= (and b!624213 res!402363) b!624216))

(assert (= (and b!624216 res!402361) b!624211))

(assert (= (and b!624211 res!402362) b!624218))

(declare-fun m!599957 () Bool)

(assert (=> b!624213 m!599957))

(declare-fun m!599959 () Bool)

(assert (=> b!624214 m!599959))

(declare-fun m!599961 () Bool)

(assert (=> b!624215 m!599961))

(assert (=> b!624215 m!599961))

(declare-fun m!599963 () Bool)

(assert (=> b!624215 m!599963))

(declare-fun m!599965 () Bool)

(assert (=> start!56296 m!599965))

(declare-fun m!599967 () Bool)

(assert (=> start!56296 m!599967))

(declare-fun m!599969 () Bool)

(assert (=> b!624217 m!599969))

(declare-fun m!599971 () Bool)

(assert (=> b!624216 m!599971))

(declare-fun m!599973 () Bool)

(assert (=> b!624211 m!599973))

(push 1)

(assert (not b!624214))

(assert (not b!624215))

(assert (not b!624217))

(assert (not start!56296))

(assert (not b!624211))

(assert (not b!624216))

(assert (not b!624213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

