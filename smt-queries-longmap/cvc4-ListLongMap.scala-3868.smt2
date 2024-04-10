; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53222 () Bool)

(assert start!53222)

(declare-fun b!578522 () Bool)

(declare-fun res!366342 () Bool)

(declare-fun e!332691 () Bool)

(assert (=> b!578522 (=> (not res!366342) (not e!332691))))

(declare-datatypes ((array!36123 0))(
  ( (array!36124 (arr!17336 (Array (_ BitVec 32) (_ BitVec 64))) (size!17700 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36123)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578522 (= res!366342 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!366340 () Bool)

(assert (=> start!53222 (=> (not res!366340) (not e!332691))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53222 (= res!366340 (validMask!0 mask!3053))))

(assert (=> start!53222 e!332691))

(assert (=> start!53222 true))

(declare-fun array_inv!13132 (array!36123) Bool)

(assert (=> start!53222 (array_inv!13132 a!2986)))

(declare-fun b!578523 () Bool)

(declare-fun res!366341 () Bool)

(assert (=> b!578523 (=> (not res!366341) (not e!332691))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578523 (= res!366341 (validKeyInArray!0 (select (arr!17336 a!2986) j!136)))))

(declare-fun b!578524 () Bool)

(declare-fun e!332690 () Bool)

(assert (=> b!578524 (= e!332691 e!332690)))

(declare-fun res!366339 () Bool)

(assert (=> b!578524 (=> (not res!366339) (not e!332690))))

(declare-datatypes ((SeekEntryResult!5776 0))(
  ( (MissingZero!5776 (index!25331 (_ BitVec 32))) (Found!5776 (index!25332 (_ BitVec 32))) (Intermediate!5776 (undefined!6588 Bool) (index!25333 (_ BitVec 32)) (x!54229 (_ BitVec 32))) (Undefined!5776) (MissingVacant!5776 (index!25334 (_ BitVec 32))) )
))
(declare-fun lt!264286 () SeekEntryResult!5776)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578524 (= res!366339 (or (= lt!264286 (MissingZero!5776 i!1108)) (= lt!264286 (MissingVacant!5776 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36123 (_ BitVec 32)) SeekEntryResult!5776)

(assert (=> b!578524 (= lt!264286 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578525 () Bool)

(declare-fun res!366338 () Bool)

(assert (=> b!578525 (=> (not res!366338) (not e!332690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36123 (_ BitVec 32)) Bool)

(assert (=> b!578525 (= res!366338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578526 () Bool)

(assert (=> b!578526 (= e!332690 false)))

(declare-fun lt!264285 () Bool)

(declare-datatypes ((List!11377 0))(
  ( (Nil!11374) (Cons!11373 (h!12418 (_ BitVec 64)) (t!17605 List!11377)) )
))
(declare-fun arrayNoDuplicates!0 (array!36123 (_ BitVec 32) List!11377) Bool)

(assert (=> b!578526 (= lt!264285 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11374))))

(declare-fun b!578527 () Bool)

(declare-fun res!366343 () Bool)

(assert (=> b!578527 (=> (not res!366343) (not e!332691))))

(assert (=> b!578527 (= res!366343 (and (= (size!17700 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17700 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17700 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578528 () Bool)

(declare-fun res!366344 () Bool)

(assert (=> b!578528 (=> (not res!366344) (not e!332691))))

(assert (=> b!578528 (= res!366344 (validKeyInArray!0 k!1786))))

(assert (= (and start!53222 res!366340) b!578527))

(assert (= (and b!578527 res!366343) b!578523))

(assert (= (and b!578523 res!366341) b!578528))

(assert (= (and b!578528 res!366344) b!578522))

(assert (= (and b!578522 res!366342) b!578524))

(assert (= (and b!578524 res!366339) b!578525))

(assert (= (and b!578525 res!366338) b!578526))

(declare-fun m!557197 () Bool)

(assert (=> b!578528 m!557197))

(declare-fun m!557199 () Bool)

(assert (=> b!578522 m!557199))

(declare-fun m!557201 () Bool)

(assert (=> b!578525 m!557201))

(declare-fun m!557203 () Bool)

(assert (=> b!578523 m!557203))

(assert (=> b!578523 m!557203))

(declare-fun m!557205 () Bool)

(assert (=> b!578523 m!557205))

(declare-fun m!557207 () Bool)

(assert (=> start!53222 m!557207))

(declare-fun m!557209 () Bool)

(assert (=> start!53222 m!557209))

(declare-fun m!557211 () Bool)

(assert (=> b!578524 m!557211))

(declare-fun m!557213 () Bool)

(assert (=> b!578526 m!557213))

(push 1)

(assert (not start!53222))

(assert (not b!578523))

(assert (not b!578522))

(assert (not b!578528))

(assert (not b!578525))

(assert (not b!578524))

(assert (not b!578526))

(check-sat)

(pop 1)

