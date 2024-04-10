; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49992 () Bool)

(assert start!49992)

(declare-fun b!548149 () Bool)

(declare-fun e!316699 () Bool)

(assert (=> b!548149 (= e!316699 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!249735 () (_ BitVec 32))

(declare-datatypes ((array!34574 0))(
  ( (array!34575 (arr!16607 (Array (_ BitVec 32) (_ BitVec 64))) (size!16971 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34574)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548149 (= lt!249735 (toIndex!0 (select (arr!16607 a!3118) j!142) mask!3119))))

(declare-fun b!548150 () Bool)

(declare-fun res!341563 () Bool)

(assert (=> b!548150 (=> (not res!341563) (not e!316699))))

(declare-datatypes ((List!10687 0))(
  ( (Nil!10684) (Cons!10683 (h!11650 (_ BitVec 64)) (t!16915 List!10687)) )
))
(declare-fun arrayNoDuplicates!0 (array!34574 (_ BitVec 32) List!10687) Bool)

(assert (=> b!548150 (= res!341563 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10684))))

(declare-fun b!548151 () Bool)

(declare-fun res!341559 () Bool)

(declare-fun e!316701 () Bool)

(assert (=> b!548151 (=> (not res!341559) (not e!316701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548151 (= res!341559 (validKeyInArray!0 (select (arr!16607 a!3118) j!142)))))

(declare-fun b!548153 () Bool)

(declare-fun res!341561 () Bool)

(assert (=> b!548153 (=> (not res!341561) (not e!316701))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!548153 (= res!341561 (validKeyInArray!0 k!1914))))

(declare-fun b!548154 () Bool)

(assert (=> b!548154 (= e!316701 e!316699)))

(declare-fun res!341557 () Bool)

(assert (=> b!548154 (=> (not res!341557) (not e!316699))))

(declare-datatypes ((SeekEntryResult!5056 0))(
  ( (MissingZero!5056 (index!22451 (_ BitVec 32))) (Found!5056 (index!22452 (_ BitVec 32))) (Intermediate!5056 (undefined!5868 Bool) (index!22453 (_ BitVec 32)) (x!51388 (_ BitVec 32))) (Undefined!5056) (MissingVacant!5056 (index!22454 (_ BitVec 32))) )
))
(declare-fun lt!249736 () SeekEntryResult!5056)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548154 (= res!341557 (or (= lt!249736 (MissingZero!5056 i!1132)) (= lt!249736 (MissingVacant!5056 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34574 (_ BitVec 32)) SeekEntryResult!5056)

(assert (=> b!548154 (= lt!249736 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548155 () Bool)

(declare-fun res!341562 () Bool)

(assert (=> b!548155 (=> (not res!341562) (not e!316701))))

(assert (=> b!548155 (= res!341562 (and (= (size!16971 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16971 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16971 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548156 () Bool)

(declare-fun res!341564 () Bool)

(assert (=> b!548156 (=> (not res!341564) (not e!316699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34574 (_ BitVec 32)) Bool)

(assert (=> b!548156 (= res!341564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!341558 () Bool)

(assert (=> start!49992 (=> (not res!341558) (not e!316701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49992 (= res!341558 (validMask!0 mask!3119))))

(assert (=> start!49992 e!316701))

(assert (=> start!49992 true))

(declare-fun array_inv!12403 (array!34574) Bool)

(assert (=> start!49992 (array_inv!12403 a!3118)))

(declare-fun b!548152 () Bool)

(declare-fun res!341560 () Bool)

(assert (=> b!548152 (=> (not res!341560) (not e!316701))))

(declare-fun arrayContainsKey!0 (array!34574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548152 (= res!341560 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!49992 res!341558) b!548155))

(assert (= (and b!548155 res!341562) b!548151))

(assert (= (and b!548151 res!341559) b!548153))

(assert (= (and b!548153 res!341561) b!548152))

(assert (= (and b!548152 res!341560) b!548154))

(assert (= (and b!548154 res!341557) b!548156))

(assert (= (and b!548156 res!341564) b!548150))

(assert (= (and b!548150 res!341563) b!548149))

(declare-fun m!525247 () Bool)

(assert (=> start!49992 m!525247))

(declare-fun m!525249 () Bool)

(assert (=> start!49992 m!525249))

(declare-fun m!525251 () Bool)

(assert (=> b!548152 m!525251))

(declare-fun m!525253 () Bool)

(assert (=> b!548156 m!525253))

(declare-fun m!525255 () Bool)

(assert (=> b!548153 m!525255))

(declare-fun m!525257 () Bool)

(assert (=> b!548151 m!525257))

(assert (=> b!548151 m!525257))

(declare-fun m!525259 () Bool)

(assert (=> b!548151 m!525259))

(assert (=> b!548149 m!525257))

(assert (=> b!548149 m!525257))

(declare-fun m!525261 () Bool)

(assert (=> b!548149 m!525261))

(declare-fun m!525263 () Bool)

(assert (=> b!548154 m!525263))

(declare-fun m!525265 () Bool)

(assert (=> b!548150 m!525265))

(push 1)

(assert (not b!548156))

(assert (not b!548154))

(assert (not b!548151))

(assert (not b!548153))

(assert (not b!548152))

