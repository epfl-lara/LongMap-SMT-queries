; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50198 () Bool)

(assert start!50198)

(declare-fun b!549433 () Bool)

(declare-fun res!342580 () Bool)

(declare-fun e!317339 () Bool)

(assert (=> b!549433 (=> (not res!342580) (not e!317339))))

(declare-datatypes ((array!34651 0))(
  ( (array!34652 (arr!16641 (Array (_ BitVec 32) (_ BitVec 64))) (size!17005 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34651)

(declare-datatypes ((List!10721 0))(
  ( (Nil!10718) (Cons!10717 (h!11690 (_ BitVec 64)) (t!16949 List!10721)) )
))
(declare-fun arrayNoDuplicates!0 (array!34651 (_ BitVec 32) List!10721) Bool)

(assert (=> b!549433 (= res!342580 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10718))))

(declare-fun b!549434 () Bool)

(declare-fun res!342584 () Bool)

(declare-fun e!317338 () Bool)

(assert (=> b!549434 (=> (not res!342584) (not e!317338))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549434 (= res!342584 (validKeyInArray!0 k!1914))))

(declare-fun b!549435 () Bool)

(assert (=> b!549435 (= e!317339 false)))

(declare-datatypes ((SeekEntryResult!5090 0))(
  ( (MissingZero!5090 (index!22587 (_ BitVec 32))) (Found!5090 (index!22588 (_ BitVec 32))) (Intermediate!5090 (undefined!5902 Bool) (index!22589 (_ BitVec 32)) (x!51524 (_ BitVec 32))) (Undefined!5090) (MissingVacant!5090 (index!22590 (_ BitVec 32))) )
))
(declare-fun lt!250129 () SeekEntryResult!5090)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!250125 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34651 (_ BitVec 32)) SeekEntryResult!5090)

(assert (=> b!549435 (= lt!250129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250125 (select (store (arr!16641 a!3118) i!1132 k!1914) j!142) (array!34652 (store (arr!16641 a!3118) i!1132 k!1914) (size!17005 a!3118)) mask!3119))))

(declare-fun lt!250126 () (_ BitVec 32))

(declare-fun lt!250127 () SeekEntryResult!5090)

(assert (=> b!549435 (= lt!250127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250126 (select (arr!16641 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549435 (= lt!250125 (toIndex!0 (select (store (arr!16641 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!549435 (= lt!250126 (toIndex!0 (select (arr!16641 a!3118) j!142) mask!3119))))

(declare-fun res!342578 () Bool)

(assert (=> start!50198 (=> (not res!342578) (not e!317338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50198 (= res!342578 (validMask!0 mask!3119))))

(assert (=> start!50198 e!317338))

(assert (=> start!50198 true))

(declare-fun array_inv!12437 (array!34651) Bool)

(assert (=> start!50198 (array_inv!12437 a!3118)))

(declare-fun b!549436 () Bool)

(declare-fun res!342583 () Bool)

(assert (=> b!549436 (=> (not res!342583) (not e!317338))))

(assert (=> b!549436 (= res!342583 (validKeyInArray!0 (select (arr!16641 a!3118) j!142)))))

(declare-fun b!549437 () Bool)

(declare-fun res!342577 () Bool)

(assert (=> b!549437 (=> (not res!342577) (not e!317338))))

(declare-fun arrayContainsKey!0 (array!34651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549437 (= res!342577 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549438 () Bool)

(declare-fun res!342579 () Bool)

(assert (=> b!549438 (=> (not res!342579) (not e!317338))))

(assert (=> b!549438 (= res!342579 (and (= (size!17005 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17005 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17005 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549439 () Bool)

(declare-fun res!342581 () Bool)

(assert (=> b!549439 (=> (not res!342581) (not e!317339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34651 (_ BitVec 32)) Bool)

(assert (=> b!549439 (= res!342581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549440 () Bool)

(assert (=> b!549440 (= e!317338 e!317339)))

(declare-fun res!342582 () Bool)

(assert (=> b!549440 (=> (not res!342582) (not e!317339))))

(declare-fun lt!250128 () SeekEntryResult!5090)

(assert (=> b!549440 (= res!342582 (or (= lt!250128 (MissingZero!5090 i!1132)) (= lt!250128 (MissingVacant!5090 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34651 (_ BitVec 32)) SeekEntryResult!5090)

(assert (=> b!549440 (= lt!250128 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50198 res!342578) b!549438))

(assert (= (and b!549438 res!342579) b!549436))

(assert (= (and b!549436 res!342583) b!549434))

(assert (= (and b!549434 res!342584) b!549437))

(assert (= (and b!549437 res!342577) b!549440))

(assert (= (and b!549440 res!342582) b!549439))

(assert (= (and b!549439 res!342581) b!549433))

(assert (= (and b!549433 res!342580) b!549435))

(declare-fun m!526281 () Bool)

(assert (=> start!50198 m!526281))

(declare-fun m!526283 () Bool)

(assert (=> start!50198 m!526283))

(declare-fun m!526285 () Bool)

(assert (=> b!549436 m!526285))

(assert (=> b!549436 m!526285))

(declare-fun m!526287 () Bool)

(assert (=> b!549436 m!526287))

(declare-fun m!526289 () Bool)

(assert (=> b!549433 m!526289))

(declare-fun m!526291 () Bool)

(assert (=> b!549434 m!526291))

(declare-fun m!526293 () Bool)

(assert (=> b!549439 m!526293))

(declare-fun m!526295 () Bool)

(assert (=> b!549437 m!526295))

(declare-fun m!526297 () Bool)

(assert (=> b!549440 m!526297))

(assert (=> b!549435 m!526285))

(declare-fun m!526299 () Bool)

(assert (=> b!549435 m!526299))

(assert (=> b!549435 m!526285))

(declare-fun m!526301 () Bool)

(assert (=> b!549435 m!526301))

(assert (=> b!549435 m!526285))

(declare-fun m!526303 () Bool)

(assert (=> b!549435 m!526303))

(assert (=> b!549435 m!526301))

(declare-fun m!526305 () Bool)

(assert (=> b!549435 m!526305))

(declare-fun m!526307 () Bool)

(assert (=> b!549435 m!526307))

(assert (=> b!549435 m!526301))

(declare-fun m!526309 () Bool)

(assert (=> b!549435 m!526309))

(push 1)

