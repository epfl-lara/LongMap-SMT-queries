; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53208 () Bool)

(assert start!53208)

(declare-fun b!578272 () Bool)

(declare-fun res!366232 () Bool)

(declare-fun e!332526 () Bool)

(assert (=> b!578272 (=> (not res!366232) (not e!332526))))

(declare-datatypes ((array!36123 0))(
  ( (array!36124 (arr!17336 (Array (_ BitVec 32) (_ BitVec 64))) (size!17701 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36123)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578272 (= res!366232 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578273 () Bool)

(declare-fun res!366236 () Bool)

(assert (=> b!578273 (=> (not res!366236) (not e!332526))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578273 (= res!366236 (validKeyInArray!0 (select (arr!17336 a!2986) j!136)))))

(declare-fun b!578274 () Bool)

(declare-fun res!366234 () Bool)

(assert (=> b!578274 (=> (not res!366234) (not e!332526))))

(assert (=> b!578274 (= res!366234 (validKeyInArray!0 k0!1786))))

(declare-fun b!578275 () Bool)

(declare-fun res!366231 () Bool)

(declare-fun e!332524 () Bool)

(assert (=> b!578275 (=> (not res!366231) (not e!332524))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36123 (_ BitVec 32)) Bool)

(assert (=> b!578275 (= res!366231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578276 () Bool)

(assert (=> b!578276 (= e!332526 e!332524)))

(declare-fun res!366235 () Bool)

(assert (=> b!578276 (=> (not res!366235) (not e!332524))))

(declare-datatypes ((SeekEntryResult!5773 0))(
  ( (MissingZero!5773 (index!25319 (_ BitVec 32))) (Found!5773 (index!25320 (_ BitVec 32))) (Intermediate!5773 (undefined!6585 Bool) (index!25321 (_ BitVec 32)) (x!54229 (_ BitVec 32))) (Undefined!5773) (MissingVacant!5773 (index!25322 (_ BitVec 32))) )
))
(declare-fun lt!264058 () SeekEntryResult!5773)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578276 (= res!366235 (or (= lt!264058 (MissingZero!5773 i!1108)) (= lt!264058 (MissingVacant!5773 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36123 (_ BitVec 32)) SeekEntryResult!5773)

(assert (=> b!578276 (= lt!264058 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578277 () Bool)

(declare-fun res!366233 () Bool)

(assert (=> b!578277 (=> (not res!366233) (not e!332526))))

(assert (=> b!578277 (= res!366233 (and (= (size!17701 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17701 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17701 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!366230 () Bool)

(assert (=> start!53208 (=> (not res!366230) (not e!332526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53208 (= res!366230 (validMask!0 mask!3053))))

(assert (=> start!53208 e!332526))

(assert (=> start!53208 true))

(declare-fun array_inv!13219 (array!36123) Bool)

(assert (=> start!53208 (array_inv!13219 a!2986)))

(declare-fun b!578278 () Bool)

(assert (=> b!578278 (= e!332524 false)))

(declare-fun lt!264057 () Bool)

(declare-datatypes ((List!11416 0))(
  ( (Nil!11413) (Cons!11412 (h!12457 (_ BitVec 64)) (t!17635 List!11416)) )
))
(declare-fun arrayNoDuplicates!0 (array!36123 (_ BitVec 32) List!11416) Bool)

(assert (=> b!578278 (= lt!264057 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11413))))

(assert (= (and start!53208 res!366230) b!578277))

(assert (= (and b!578277 res!366233) b!578273))

(assert (= (and b!578273 res!366236) b!578274))

(assert (= (and b!578274 res!366234) b!578272))

(assert (= (and b!578272 res!366232) b!578276))

(assert (= (and b!578276 res!366235) b!578275))

(assert (= (and b!578275 res!366231) b!578278))

(declare-fun m!556429 () Bool)

(assert (=> start!53208 m!556429))

(declare-fun m!556431 () Bool)

(assert (=> start!53208 m!556431))

(declare-fun m!556433 () Bool)

(assert (=> b!578273 m!556433))

(assert (=> b!578273 m!556433))

(declare-fun m!556435 () Bool)

(assert (=> b!578273 m!556435))

(declare-fun m!556437 () Bool)

(assert (=> b!578278 m!556437))

(declare-fun m!556439 () Bool)

(assert (=> b!578276 m!556439))

(declare-fun m!556441 () Bool)

(assert (=> b!578272 m!556441))

(declare-fun m!556443 () Bool)

(assert (=> b!578274 m!556443))

(declare-fun m!556445 () Bool)

(assert (=> b!578275 m!556445))

(check-sat (not b!578273) (not b!578272) (not b!578276) (not b!578275) (not b!578274) (not b!578278) (not start!53208))
(check-sat)
