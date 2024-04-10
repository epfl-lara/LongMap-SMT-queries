; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53200 () Bool)

(assert start!53200)

(declare-fun b!578291 () Bool)

(declare-fun res!366109 () Bool)

(declare-fun e!332592 () Bool)

(assert (=> b!578291 (=> (not res!366109) (not e!332592))))

(declare-datatypes ((array!36101 0))(
  ( (array!36102 (arr!17325 (Array (_ BitVec 32) (_ BitVec 64))) (size!17689 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36101)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36101 (_ BitVec 32)) Bool)

(assert (=> b!578291 (= res!366109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!366112 () Bool)

(declare-fun e!332590 () Bool)

(assert (=> start!53200 (=> (not res!366112) (not e!332590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53200 (= res!366112 (validMask!0 mask!3053))))

(assert (=> start!53200 e!332590))

(assert (=> start!53200 true))

(declare-fun array_inv!13121 (array!36101) Bool)

(assert (=> start!53200 (array_inv!13121 a!2986)))

(declare-fun b!578292 () Bool)

(declare-fun res!366108 () Bool)

(assert (=> b!578292 (=> (not res!366108) (not e!332590))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578292 (= res!366108 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578293 () Bool)

(declare-fun res!366107 () Bool)

(assert (=> b!578293 (=> (not res!366107) (not e!332590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578293 (= res!366107 (validKeyInArray!0 k!1786))))

(declare-fun b!578294 () Bool)

(assert (=> b!578294 (= e!332592 false)))

(declare-fun lt!264220 () Bool)

(declare-datatypes ((List!11366 0))(
  ( (Nil!11363) (Cons!11362 (h!12407 (_ BitVec 64)) (t!17594 List!11366)) )
))
(declare-fun arrayNoDuplicates!0 (array!36101 (_ BitVec 32) List!11366) Bool)

(assert (=> b!578294 (= lt!264220 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11363))))

(declare-fun b!578295 () Bool)

(declare-fun res!366110 () Bool)

(assert (=> b!578295 (=> (not res!366110) (not e!332590))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578295 (= res!366110 (and (= (size!17689 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17689 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17689 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578296 () Bool)

(declare-fun res!366111 () Bool)

(assert (=> b!578296 (=> (not res!366111) (not e!332590))))

(assert (=> b!578296 (= res!366111 (validKeyInArray!0 (select (arr!17325 a!2986) j!136)))))

(declare-fun b!578297 () Bool)

(assert (=> b!578297 (= e!332590 e!332592)))

(declare-fun res!366113 () Bool)

(assert (=> b!578297 (=> (not res!366113) (not e!332592))))

(declare-datatypes ((SeekEntryResult!5765 0))(
  ( (MissingZero!5765 (index!25287 (_ BitVec 32))) (Found!5765 (index!25288 (_ BitVec 32))) (Intermediate!5765 (undefined!6577 Bool) (index!25289 (_ BitVec 32)) (x!54194 (_ BitVec 32))) (Undefined!5765) (MissingVacant!5765 (index!25290 (_ BitVec 32))) )
))
(declare-fun lt!264219 () SeekEntryResult!5765)

(assert (=> b!578297 (= res!366113 (or (= lt!264219 (MissingZero!5765 i!1108)) (= lt!264219 (MissingVacant!5765 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36101 (_ BitVec 32)) SeekEntryResult!5765)

(assert (=> b!578297 (= lt!264219 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53200 res!366112) b!578295))

(assert (= (and b!578295 res!366110) b!578296))

(assert (= (and b!578296 res!366111) b!578293))

(assert (= (and b!578293 res!366107) b!578292))

(assert (= (and b!578292 res!366108) b!578297))

(assert (= (and b!578297 res!366113) b!578291))

(assert (= (and b!578291 res!366109) b!578294))

(declare-fun m!556999 () Bool)

(assert (=> b!578296 m!556999))

(assert (=> b!578296 m!556999))

(declare-fun m!557001 () Bool)

(assert (=> b!578296 m!557001))

(declare-fun m!557003 () Bool)

(assert (=> b!578294 m!557003))

(declare-fun m!557005 () Bool)

(assert (=> start!53200 m!557005))

(declare-fun m!557007 () Bool)

(assert (=> start!53200 m!557007))

(declare-fun m!557009 () Bool)

(assert (=> b!578297 m!557009))

(declare-fun m!557011 () Bool)

(assert (=> b!578293 m!557011))

(declare-fun m!557013 () Bool)

(assert (=> b!578291 m!557013))

(declare-fun m!557015 () Bool)

(assert (=> b!578292 m!557015))

(push 1)

