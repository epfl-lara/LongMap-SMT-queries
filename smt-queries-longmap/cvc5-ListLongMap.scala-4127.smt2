; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56296 () Bool)

(assert start!56296)

(declare-fun b!624123 () Bool)

(declare-fun res!402418 () Bool)

(declare-fun e!357895 () Bool)

(assert (=> b!624123 (=> (not res!402418) (not e!357895))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37735 0))(
  ( (array!37736 (arr!18112 (Array (_ BitVec 32) (_ BitVec 64))) (size!18477 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37735)

(assert (=> b!624123 (= res!402418 (and (= (size!18477 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18477 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18477 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624124 () Bool)

(declare-fun e!357897 () Bool)

(assert (=> b!624124 (= e!357895 e!357897)))

(declare-fun res!402415 () Bool)

(assert (=> b!624124 (=> (not res!402415) (not e!357897))))

(declare-datatypes ((SeekEntryResult!6549 0))(
  ( (MissingZero!6549 (index!28480 (_ BitVec 32))) (Found!6549 (index!28481 (_ BitVec 32))) (Intermediate!6549 (undefined!7361 Bool) (index!28482 (_ BitVec 32)) (x!57243 (_ BitVec 32))) (Undefined!6549) (MissingVacant!6549 (index!28483 (_ BitVec 32))) )
))
(declare-fun lt!289351 () SeekEntryResult!6549)

(assert (=> b!624124 (= res!402415 (or (= lt!289351 (MissingZero!6549 i!1108)) (= lt!289351 (MissingVacant!6549 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37735 (_ BitVec 32)) SeekEntryResult!6549)

(assert (=> b!624124 (= lt!289351 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624125 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624125 (= e!357897 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18112 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantSpotIndex!68 (size!18477 a!2986))))))

(declare-fun b!624126 () Bool)

(declare-fun res!402417 () Bool)

(assert (=> b!624126 (=> (not res!402417) (not e!357895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624126 (= res!402417 (validKeyInArray!0 (select (arr!18112 a!2986) j!136)))))

(declare-fun b!624127 () Bool)

(declare-fun res!402422 () Bool)

(assert (=> b!624127 (=> (not res!402422) (not e!357895))))

(assert (=> b!624127 (= res!402422 (validKeyInArray!0 k!1786))))

(declare-fun b!624128 () Bool)

(declare-fun res!402421 () Bool)

(assert (=> b!624128 (=> (not res!402421) (not e!357895))))

(declare-fun arrayContainsKey!0 (array!37735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624128 (= res!402421 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624129 () Bool)

(declare-fun res!402420 () Bool)

(assert (=> b!624129 (=> (not res!402420) (not e!357897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37735 (_ BitVec 32)) Bool)

(assert (=> b!624129 (= res!402420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!402419 () Bool)

(assert (=> start!56296 (=> (not res!402419) (not e!357895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56296 (= res!402419 (validMask!0 mask!3053))))

(assert (=> start!56296 e!357895))

(assert (=> start!56296 true))

(declare-fun array_inv!13995 (array!37735) Bool)

(assert (=> start!56296 (array_inv!13995 a!2986)))

(declare-fun b!624130 () Bool)

(declare-fun res!402416 () Bool)

(assert (=> b!624130 (=> (not res!402416) (not e!357897))))

(declare-datatypes ((List!12192 0))(
  ( (Nil!12189) (Cons!12188 (h!13233 (_ BitVec 64)) (t!18411 List!12192)) )
))
(declare-fun arrayNoDuplicates!0 (array!37735 (_ BitVec 32) List!12192) Bool)

(assert (=> b!624130 (= res!402416 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12189))))

(assert (= (and start!56296 res!402419) b!624123))

(assert (= (and b!624123 res!402418) b!624126))

(assert (= (and b!624126 res!402417) b!624127))

(assert (= (and b!624127 res!402422) b!624128))

(assert (= (and b!624128 res!402421) b!624124))

(assert (= (and b!624124 res!402415) b!624129))

(assert (= (and b!624129 res!402420) b!624130))

(assert (= (and b!624130 res!402416) b!624125))

(declare-fun m!599333 () Bool)

(assert (=> b!624127 m!599333))

(declare-fun m!599335 () Bool)

(assert (=> b!624129 m!599335))

(declare-fun m!599337 () Bool)

(assert (=> b!624126 m!599337))

(assert (=> b!624126 m!599337))

(declare-fun m!599339 () Bool)

(assert (=> b!624126 m!599339))

(declare-fun m!599341 () Bool)

(assert (=> b!624124 m!599341))

(declare-fun m!599343 () Bool)

(assert (=> b!624130 m!599343))

(declare-fun m!599345 () Bool)

(assert (=> b!624128 m!599345))

(declare-fun m!599347 () Bool)

(assert (=> b!624125 m!599347))

(declare-fun m!599349 () Bool)

(assert (=> start!56296 m!599349))

(declare-fun m!599351 () Bool)

(assert (=> start!56296 m!599351))

(push 1)

(assert (not b!624129))

(assert (not b!624124))

(assert (not b!624128))

(assert (not start!56296))

(assert (not b!624130))

(assert (not b!624127))

(assert (not b!624126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

