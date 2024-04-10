; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53218 () Bool)

(assert start!53218)

(declare-fun b!578480 () Bool)

(declare-fun res!366296 () Bool)

(declare-fun e!332673 () Bool)

(assert (=> b!578480 (=> (not res!366296) (not e!332673))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36119 0))(
  ( (array!36120 (arr!17334 (Array (_ BitVec 32) (_ BitVec 64))) (size!17698 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36119)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578480 (= res!366296 (and (= (size!17698 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17698 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17698 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578481 () Bool)

(declare-fun e!332672 () Bool)

(assert (=> b!578481 (= e!332673 e!332672)))

(declare-fun res!366299 () Bool)

(assert (=> b!578481 (=> (not res!366299) (not e!332672))))

(declare-datatypes ((SeekEntryResult!5774 0))(
  ( (MissingZero!5774 (index!25323 (_ BitVec 32))) (Found!5774 (index!25324 (_ BitVec 32))) (Intermediate!5774 (undefined!6586 Bool) (index!25325 (_ BitVec 32)) (x!54227 (_ BitVec 32))) (Undefined!5774) (MissingVacant!5774 (index!25326 (_ BitVec 32))) )
))
(declare-fun lt!264273 () SeekEntryResult!5774)

(assert (=> b!578481 (= res!366299 (or (= lt!264273 (MissingZero!5774 i!1108)) (= lt!264273 (MissingVacant!5774 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36119 (_ BitVec 32)) SeekEntryResult!5774)

(assert (=> b!578481 (= lt!264273 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578482 () Bool)

(declare-fun res!366297 () Bool)

(assert (=> b!578482 (=> (not res!366297) (not e!332673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578482 (= res!366297 (validKeyInArray!0 k!1786))))

(declare-fun b!578483 () Bool)

(declare-fun res!366302 () Bool)

(assert (=> b!578483 (=> (not res!366302) (not e!332673))))

(assert (=> b!578483 (= res!366302 (validKeyInArray!0 (select (arr!17334 a!2986) j!136)))))

(declare-fun b!578484 () Bool)

(declare-fun res!366298 () Bool)

(assert (=> b!578484 (=> (not res!366298) (not e!332673))))

(declare-fun arrayContainsKey!0 (array!36119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578484 (= res!366298 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578485 () Bool)

(declare-fun res!366301 () Bool)

(assert (=> b!578485 (=> (not res!366301) (not e!332672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36119 (_ BitVec 32)) Bool)

(assert (=> b!578485 (= res!366301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578486 () Bool)

(assert (=> b!578486 (= e!332672 false)))

(declare-fun lt!264274 () Bool)

(declare-datatypes ((List!11375 0))(
  ( (Nil!11372) (Cons!11371 (h!12416 (_ BitVec 64)) (t!17603 List!11375)) )
))
(declare-fun arrayNoDuplicates!0 (array!36119 (_ BitVec 32) List!11375) Bool)

(assert (=> b!578486 (= lt!264274 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11372))))

(declare-fun res!366300 () Bool)

(assert (=> start!53218 (=> (not res!366300) (not e!332673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53218 (= res!366300 (validMask!0 mask!3053))))

(assert (=> start!53218 e!332673))

(assert (=> start!53218 true))

(declare-fun array_inv!13130 (array!36119) Bool)

(assert (=> start!53218 (array_inv!13130 a!2986)))

(assert (= (and start!53218 res!366300) b!578480))

(assert (= (and b!578480 res!366296) b!578483))

(assert (= (and b!578483 res!366302) b!578482))

(assert (= (and b!578482 res!366297) b!578484))

(assert (= (and b!578484 res!366298) b!578481))

(assert (= (and b!578481 res!366299) b!578485))

(assert (= (and b!578485 res!366301) b!578486))

(declare-fun m!557161 () Bool)

(assert (=> b!578484 m!557161))

(declare-fun m!557163 () Bool)

(assert (=> b!578483 m!557163))

(assert (=> b!578483 m!557163))

(declare-fun m!557165 () Bool)

(assert (=> b!578483 m!557165))

(declare-fun m!557167 () Bool)

(assert (=> b!578486 m!557167))

(declare-fun m!557169 () Bool)

(assert (=> start!53218 m!557169))

(declare-fun m!557171 () Bool)

(assert (=> start!53218 m!557171))

(declare-fun m!557173 () Bool)

(assert (=> b!578485 m!557173))

(declare-fun m!557175 () Bool)

(assert (=> b!578482 m!557175))

(declare-fun m!557177 () Bool)

(assert (=> b!578481 m!557177))

(push 1)

