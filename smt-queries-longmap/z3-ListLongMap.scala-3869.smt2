; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53274 () Bool)

(assert start!53274)

(declare-fun b!578743 () Bool)

(declare-fun res!366456 () Bool)

(declare-fun e!332827 () Bool)

(assert (=> b!578743 (=> (not res!366456) (not e!332827))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578743 (= res!366456 (validKeyInArray!0 k0!1786))))

(declare-fun b!578744 () Bool)

(declare-fun res!366457 () Bool)

(assert (=> b!578744 (=> (not res!366457) (not e!332827))))

(declare-datatypes ((array!36120 0))(
  ( (array!36121 (arr!17332 (Array (_ BitVec 32) (_ BitVec 64))) (size!17696 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36120)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578744 (= res!366457 (validKeyInArray!0 (select (arr!17332 a!2986) j!136)))))

(declare-fun res!366455 () Bool)

(assert (=> start!53274 (=> (not res!366455) (not e!332827))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53274 (= res!366455 (validMask!0 mask!3053))))

(assert (=> start!53274 e!332827))

(assert (=> start!53274 true))

(declare-fun array_inv!13191 (array!36120) Bool)

(assert (=> start!53274 (array_inv!13191 a!2986)))

(declare-fun b!578745 () Bool)

(declare-fun e!332828 () Bool)

(assert (=> b!578745 (= e!332827 e!332828)))

(declare-fun res!366459 () Bool)

(assert (=> b!578745 (=> (not res!366459) (not e!332828))))

(declare-datatypes ((SeekEntryResult!5728 0))(
  ( (MissingZero!5728 (index!25139 (_ BitVec 32))) (Found!5728 (index!25140 (_ BitVec 32))) (Intermediate!5728 (undefined!6540 Bool) (index!25141 (_ BitVec 32)) (x!54192 (_ BitVec 32))) (Undefined!5728) (MissingVacant!5728 (index!25142 (_ BitVec 32))) )
))
(declare-fun lt!264402 () SeekEntryResult!5728)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578745 (= res!366459 (or (= lt!264402 (MissingZero!5728 i!1108)) (= lt!264402 (MissingVacant!5728 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36120 (_ BitVec 32)) SeekEntryResult!5728)

(assert (=> b!578745 (= lt!264402 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578746 () Bool)

(declare-fun res!366454 () Bool)

(assert (=> b!578746 (=> (not res!366454) (not e!332828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36120 (_ BitVec 32)) Bool)

(assert (=> b!578746 (= res!366454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578747 () Bool)

(declare-fun res!366460 () Bool)

(assert (=> b!578747 (=> (not res!366460) (not e!332827))))

(assert (=> b!578747 (= res!366460 (and (= (size!17696 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17696 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17696 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578748 () Bool)

(declare-fun res!366458 () Bool)

(assert (=> b!578748 (=> (not res!366458) (not e!332827))))

(declare-fun arrayContainsKey!0 (array!36120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578748 (= res!366458 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578749 () Bool)

(assert (=> b!578749 (= e!332828 false)))

(declare-fun lt!264403 () Bool)

(declare-datatypes ((List!11280 0))(
  ( (Nil!11277) (Cons!11276 (h!12324 (_ BitVec 64)) (t!17500 List!11280)) )
))
(declare-fun arrayNoDuplicates!0 (array!36120 (_ BitVec 32) List!11280) Bool)

(assert (=> b!578749 (= lt!264403 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11277))))

(assert (= (and start!53274 res!366455) b!578747))

(assert (= (and b!578747 res!366460) b!578744))

(assert (= (and b!578744 res!366457) b!578743))

(assert (= (and b!578743 res!366456) b!578748))

(assert (= (and b!578748 res!366458) b!578745))

(assert (= (and b!578745 res!366459) b!578746))

(assert (= (and b!578746 res!366454) b!578749))

(declare-fun m!557567 () Bool)

(assert (=> b!578746 m!557567))

(declare-fun m!557569 () Bool)

(assert (=> b!578744 m!557569))

(assert (=> b!578744 m!557569))

(declare-fun m!557571 () Bool)

(assert (=> b!578744 m!557571))

(declare-fun m!557573 () Bool)

(assert (=> b!578749 m!557573))

(declare-fun m!557575 () Bool)

(assert (=> b!578748 m!557575))

(declare-fun m!557577 () Bool)

(assert (=> start!53274 m!557577))

(declare-fun m!557579 () Bool)

(assert (=> start!53274 m!557579))

(declare-fun m!557581 () Bool)

(assert (=> b!578745 m!557581))

(declare-fun m!557583 () Bool)

(assert (=> b!578743 m!557583))

(check-sat (not b!578748) (not b!578743) (not b!578746) (not start!53274) (not b!578749) (not b!578745) (not b!578744))
(check-sat)
