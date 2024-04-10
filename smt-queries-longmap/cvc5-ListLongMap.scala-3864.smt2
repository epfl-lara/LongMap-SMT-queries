; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53194 () Bool)

(assert start!53194)

(declare-fun b!578228 () Bool)

(declare-fun e!332563 () Bool)

(declare-fun e!332564 () Bool)

(assert (=> b!578228 (= e!332563 e!332564)))

(declare-fun res!366046 () Bool)

(assert (=> b!578228 (=> (not res!366046) (not e!332564))))

(declare-datatypes ((SeekEntryResult!5762 0))(
  ( (MissingZero!5762 (index!25275 (_ BitVec 32))) (Found!5762 (index!25276 (_ BitVec 32))) (Intermediate!5762 (undefined!6574 Bool) (index!25277 (_ BitVec 32)) (x!54183 (_ BitVec 32))) (Undefined!5762) (MissingVacant!5762 (index!25278 (_ BitVec 32))) )
))
(declare-fun lt!264202 () SeekEntryResult!5762)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578228 (= res!366046 (or (= lt!264202 (MissingZero!5762 i!1108)) (= lt!264202 (MissingVacant!5762 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36095 0))(
  ( (array!36096 (arr!17322 (Array (_ BitVec 32) (_ BitVec 64))) (size!17686 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36095)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36095 (_ BitVec 32)) SeekEntryResult!5762)

(assert (=> b!578228 (= lt!264202 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578229 () Bool)

(declare-fun res!366050 () Bool)

(assert (=> b!578229 (=> (not res!366050) (not e!332563))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578229 (= res!366050 (and (= (size!17686 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17686 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17686 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578230 () Bool)

(declare-fun res!366045 () Bool)

(assert (=> b!578230 (=> (not res!366045) (not e!332563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578230 (= res!366045 (validKeyInArray!0 k!1786))))

(declare-fun b!578232 () Bool)

(declare-fun res!366048 () Bool)

(assert (=> b!578232 (=> (not res!366048) (not e!332563))))

(declare-fun arrayContainsKey!0 (array!36095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578232 (= res!366048 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578233 () Bool)

(assert (=> b!578233 (= e!332564 false)))

(declare-fun lt!264201 () Bool)

(declare-datatypes ((List!11363 0))(
  ( (Nil!11360) (Cons!11359 (h!12404 (_ BitVec 64)) (t!17591 List!11363)) )
))
(declare-fun arrayNoDuplicates!0 (array!36095 (_ BitVec 32) List!11363) Bool)

(assert (=> b!578233 (= lt!264201 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11360))))

(declare-fun b!578234 () Bool)

(declare-fun res!366047 () Bool)

(assert (=> b!578234 (=> (not res!366047) (not e!332563))))

(assert (=> b!578234 (= res!366047 (validKeyInArray!0 (select (arr!17322 a!2986) j!136)))))

(declare-fun b!578231 () Bool)

(declare-fun res!366049 () Bool)

(assert (=> b!578231 (=> (not res!366049) (not e!332564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36095 (_ BitVec 32)) Bool)

(assert (=> b!578231 (= res!366049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!366044 () Bool)

(assert (=> start!53194 (=> (not res!366044) (not e!332563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53194 (= res!366044 (validMask!0 mask!3053))))

(assert (=> start!53194 e!332563))

(assert (=> start!53194 true))

(declare-fun array_inv!13118 (array!36095) Bool)

(assert (=> start!53194 (array_inv!13118 a!2986)))

(assert (= (and start!53194 res!366044) b!578229))

(assert (= (and b!578229 res!366050) b!578234))

(assert (= (and b!578234 res!366047) b!578230))

(assert (= (and b!578230 res!366045) b!578232))

(assert (= (and b!578232 res!366048) b!578228))

(assert (= (and b!578228 res!366046) b!578231))

(assert (= (and b!578231 res!366049) b!578233))

(declare-fun m!556945 () Bool)

(assert (=> start!53194 m!556945))

(declare-fun m!556947 () Bool)

(assert (=> start!53194 m!556947))

(declare-fun m!556949 () Bool)

(assert (=> b!578232 m!556949))

(declare-fun m!556951 () Bool)

(assert (=> b!578234 m!556951))

(assert (=> b!578234 m!556951))

(declare-fun m!556953 () Bool)

(assert (=> b!578234 m!556953))

(declare-fun m!556955 () Bool)

(assert (=> b!578233 m!556955))

(declare-fun m!556957 () Bool)

(assert (=> b!578228 m!556957))

(declare-fun m!556959 () Bool)

(assert (=> b!578230 m!556959))

(declare-fun m!556961 () Bool)

(assert (=> b!578231 m!556961))

(push 1)

