; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50700 () Bool)

(assert start!50700)

(declare-fun res!346853 () Bool)

(declare-fun e!319694 () Bool)

(assert (=> start!50700 (=> (not res!346853) (not e!319694))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50700 (= res!346853 (validMask!0 mask!3119))))

(assert (=> start!50700 e!319694))

(assert (=> start!50700 true))

(declare-datatypes ((array!34925 0))(
  ( (array!34926 (arr!16772 (Array (_ BitVec 32) (_ BitVec 64))) (size!17136 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34925)

(declare-fun array_inv!12568 (array!34925) Bool)

(assert (=> start!50700 (array_inv!12568 a!3118)))

(declare-fun b!554432 () Bool)

(declare-fun res!346847 () Bool)

(declare-fun e!319692 () Bool)

(assert (=> b!554432 (=> (not res!346847) (not e!319692))))

(declare-datatypes ((List!10852 0))(
  ( (Nil!10849) (Cons!10848 (h!11833 (_ BitVec 64)) (t!17080 List!10852)) )
))
(declare-fun arrayNoDuplicates!0 (array!34925 (_ BitVec 32) List!10852) Bool)

(assert (=> b!554432 (= res!346847 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10849))))

(declare-fun b!554433 () Bool)

(declare-fun res!346849 () Bool)

(assert (=> b!554433 (=> (not res!346849) (not e!319694))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!554433 (= res!346849 (and (= (size!17136 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17136 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17136 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554434 () Bool)

(declare-fun res!346844 () Bool)

(assert (=> b!554434 (=> (not res!346844) (not e!319694))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554434 (= res!346844 (validKeyInArray!0 k!1914))))

(declare-fun b!554435 () Bool)

(assert (=> b!554435 (= e!319692 (not true))))

(declare-fun e!319695 () Bool)

(assert (=> b!554435 e!319695))

(declare-fun res!346852 () Bool)

(assert (=> b!554435 (=> (not res!346852) (not e!319695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34925 (_ BitVec 32)) Bool)

(assert (=> b!554435 (= res!346852 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17216 0))(
  ( (Unit!17217) )
))
(declare-fun lt!251791 () Unit!17216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17216)

(assert (=> b!554435 (= lt!251791 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554436 () Bool)

(declare-fun res!346850 () Bool)

(assert (=> b!554436 (=> (not res!346850) (not e!319694))))

(assert (=> b!554436 (= res!346850 (validKeyInArray!0 (select (arr!16772 a!3118) j!142)))))

(declare-fun b!554437 () Bool)

(declare-datatypes ((SeekEntryResult!5221 0))(
  ( (MissingZero!5221 (index!23111 (_ BitVec 32))) (Found!5221 (index!23112 (_ BitVec 32))) (Intermediate!5221 (undefined!6033 Bool) (index!23113 (_ BitVec 32)) (x!52023 (_ BitVec 32))) (Undefined!5221) (MissingVacant!5221 (index!23114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34925 (_ BitVec 32)) SeekEntryResult!5221)

(assert (=> b!554437 (= e!319695 (= (seekEntryOrOpen!0 (select (arr!16772 a!3118) j!142) a!3118 mask!3119) (Found!5221 j!142)))))

(declare-fun b!554438 () Bool)

(declare-fun res!346846 () Bool)

(assert (=> b!554438 (=> (not res!346846) (not e!319694))))

(declare-fun arrayContainsKey!0 (array!34925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554438 (= res!346846 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554439 () Bool)

(declare-fun res!346851 () Bool)

(assert (=> b!554439 (=> (not res!346851) (not e!319692))))

(assert (=> b!554439 (= res!346851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554440 () Bool)

(assert (=> b!554440 (= e!319694 e!319692)))

(declare-fun res!346845 () Bool)

(assert (=> b!554440 (=> (not res!346845) (not e!319692))))

(declare-fun lt!251790 () SeekEntryResult!5221)

(assert (=> b!554440 (= res!346845 (or (= lt!251790 (MissingZero!5221 i!1132)) (= lt!251790 (MissingVacant!5221 i!1132))))))

(assert (=> b!554440 (= lt!251790 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554441 () Bool)

(declare-fun res!346848 () Bool)

(assert (=> b!554441 (=> (not res!346848) (not e!319692))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34925 (_ BitVec 32)) SeekEntryResult!5221)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554441 (= res!346848 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16772 a!3118) j!142) mask!3119) (select (arr!16772 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16772 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16772 a!3118) i!1132 k!1914) j!142) (array!34926 (store (arr!16772 a!3118) i!1132 k!1914) (size!17136 a!3118)) mask!3119)))))

(assert (= (and start!50700 res!346853) b!554433))

(assert (= (and b!554433 res!346849) b!554436))

(assert (= (and b!554436 res!346850) b!554434))

(assert (= (and b!554434 res!346844) b!554438))

(assert (= (and b!554438 res!346846) b!554440))

(assert (= (and b!554440 res!346845) b!554439))

(assert (= (and b!554439 res!346851) b!554432))

(assert (= (and b!554432 res!346847) b!554441))

(assert (= (and b!554441 res!346848) b!554435))

(assert (= (and b!554435 res!346852) b!554437))

(declare-fun m!531729 () Bool)

(assert (=> b!554440 m!531729))

(declare-fun m!531731 () Bool)

(assert (=> b!554436 m!531731))

(assert (=> b!554436 m!531731))

(declare-fun m!531733 () Bool)

(assert (=> b!554436 m!531733))

(declare-fun m!531735 () Bool)

(assert (=> start!50700 m!531735))

(declare-fun m!531737 () Bool)

(assert (=> start!50700 m!531737))

(declare-fun m!531739 () Bool)

(assert (=> b!554435 m!531739))

(declare-fun m!531741 () Bool)

(assert (=> b!554435 m!531741))

(assert (=> b!554437 m!531731))

(assert (=> b!554437 m!531731))

(declare-fun m!531743 () Bool)

(assert (=> b!554437 m!531743))

(declare-fun m!531745 () Bool)

(assert (=> b!554438 m!531745))

(assert (=> b!554441 m!531731))

(declare-fun m!531747 () Bool)

(assert (=> b!554441 m!531747))

(assert (=> b!554441 m!531731))

(declare-fun m!531749 () Bool)

(assert (=> b!554441 m!531749))

(declare-fun m!531751 () Bool)

(assert (=> b!554441 m!531751))

(assert (=> b!554441 m!531749))

(declare-fun m!531753 () Bool)

(assert (=> b!554441 m!531753))

(assert (=> b!554441 m!531747))

(assert (=> b!554441 m!531731))

(declare-fun m!531755 () Bool)

(assert (=> b!554441 m!531755))

(declare-fun m!531757 () Bool)

(assert (=> b!554441 m!531757))

(assert (=> b!554441 m!531749))

(assert (=> b!554441 m!531751))

(declare-fun m!531759 () Bool)

(assert (=> b!554439 m!531759))

(declare-fun m!531761 () Bool)

(assert (=> b!554434 m!531761))

(declare-fun m!531763 () Bool)

(assert (=> b!554432 m!531763))

(push 1)

