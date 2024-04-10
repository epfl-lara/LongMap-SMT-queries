; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50804 () Bool)

(assert start!50804)

(declare-fun b!555846 () Bool)

(declare-fun res!348266 () Bool)

(declare-fun e!320318 () Bool)

(assert (=> b!555846 (=> (not res!348266) (not e!320318))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555846 (= res!348266 (validKeyInArray!0 k!1914))))

(declare-fun b!555847 () Bool)

(declare-fun res!348259 () Bool)

(declare-fun e!320317 () Bool)

(assert (=> b!555847 (=> (not res!348259) (not e!320317))))

(declare-datatypes ((array!35029 0))(
  ( (array!35030 (arr!16824 (Array (_ BitVec 32) (_ BitVec 64))) (size!17188 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35029)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35029 (_ BitVec 32)) Bool)

(assert (=> b!555847 (= res!348259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555848 () Bool)

(declare-fun e!320316 () Bool)

(assert (=> b!555848 (= e!320316 (not true))))

(declare-datatypes ((SeekEntryResult!5273 0))(
  ( (MissingZero!5273 (index!23319 (_ BitVec 32))) (Found!5273 (index!23320 (_ BitVec 32))) (Intermediate!5273 (undefined!6085 Bool) (index!23321 (_ BitVec 32)) (x!52219 (_ BitVec 32))) (Undefined!5273) (MissingVacant!5273 (index!23322 (_ BitVec 32))) )
))
(declare-fun lt!252686 () SeekEntryResult!5273)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252689 () SeekEntryResult!5273)

(assert (=> b!555848 (and (= lt!252689 (Found!5273 j!142)) (or (undefined!6085 lt!252686) (not (is-Intermediate!5273 lt!252686)) (= (select (arr!16824 a!3118) (index!23321 lt!252686)) (select (arr!16824 a!3118) j!142)) (not (= (select (arr!16824 a!3118) (index!23321 lt!252686)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252689 (MissingZero!5273 (index!23321 lt!252686)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35029 (_ BitVec 32)) SeekEntryResult!5273)

(assert (=> b!555848 (= lt!252689 (seekEntryOrOpen!0 (select (arr!16824 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555848 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17320 0))(
  ( (Unit!17321) )
))
(declare-fun lt!252691 () Unit!17320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35029 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17320)

(assert (=> b!555848 (= lt!252691 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555849 () Bool)

(declare-fun res!348263 () Bool)

(assert (=> b!555849 (=> (not res!348263) (not e!320318))))

(assert (=> b!555849 (= res!348263 (validKeyInArray!0 (select (arr!16824 a!3118) j!142)))))

(declare-fun b!555850 () Bool)

(declare-fun res!348258 () Bool)

(assert (=> b!555850 (=> (not res!348258) (not e!320318))))

(declare-fun arrayContainsKey!0 (array!35029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555850 (= res!348258 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!348264 () Bool)

(assert (=> start!50804 (=> (not res!348264) (not e!320318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50804 (= res!348264 (validMask!0 mask!3119))))

(assert (=> start!50804 e!320318))

(assert (=> start!50804 true))

(declare-fun array_inv!12620 (array!35029) Bool)

(assert (=> start!50804 (array_inv!12620 a!3118)))

(declare-fun b!555851 () Bool)

(declare-fun res!348265 () Bool)

(assert (=> b!555851 (=> (not res!348265) (not e!320317))))

(declare-datatypes ((List!10904 0))(
  ( (Nil!10901) (Cons!10900 (h!11885 (_ BitVec 64)) (t!17132 List!10904)) )
))
(declare-fun arrayNoDuplicates!0 (array!35029 (_ BitVec 32) List!10904) Bool)

(assert (=> b!555851 (= res!348265 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10901))))

(declare-fun b!555852 () Bool)

(assert (=> b!555852 (= e!320318 e!320317)))

(declare-fun res!348261 () Bool)

(assert (=> b!555852 (=> (not res!348261) (not e!320317))))

(declare-fun lt!252687 () SeekEntryResult!5273)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555852 (= res!348261 (or (= lt!252687 (MissingZero!5273 i!1132)) (= lt!252687 (MissingVacant!5273 i!1132))))))

(assert (=> b!555852 (= lt!252687 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555853 () Bool)

(assert (=> b!555853 (= e!320317 e!320316)))

(declare-fun res!348262 () Bool)

(assert (=> b!555853 (=> (not res!348262) (not e!320316))))

(declare-fun lt!252688 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35029 (_ BitVec 32)) SeekEntryResult!5273)

(assert (=> b!555853 (= res!348262 (= lt!252686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252688 (select (store (arr!16824 a!3118) i!1132 k!1914) j!142) (array!35030 (store (arr!16824 a!3118) i!1132 k!1914) (size!17188 a!3118)) mask!3119)))))

(declare-fun lt!252690 () (_ BitVec 32))

(assert (=> b!555853 (= lt!252686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252690 (select (arr!16824 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555853 (= lt!252688 (toIndex!0 (select (store (arr!16824 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555853 (= lt!252690 (toIndex!0 (select (arr!16824 a!3118) j!142) mask!3119))))

(declare-fun b!555854 () Bool)

(declare-fun res!348260 () Bool)

(assert (=> b!555854 (=> (not res!348260) (not e!320318))))

(assert (=> b!555854 (= res!348260 (and (= (size!17188 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17188 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17188 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50804 res!348264) b!555854))

(assert (= (and b!555854 res!348260) b!555849))

(assert (= (and b!555849 res!348263) b!555846))

(assert (= (and b!555846 res!348266) b!555850))

(assert (= (and b!555850 res!348258) b!555852))

(assert (= (and b!555852 res!348261) b!555847))

(assert (= (and b!555847 res!348259) b!555851))

(assert (= (and b!555851 res!348265) b!555853))

(assert (= (and b!555853 res!348262) b!555848))

(declare-fun m!533697 () Bool)

(assert (=> b!555851 m!533697))

(declare-fun m!533699 () Bool)

(assert (=> b!555846 m!533699))

(declare-fun m!533701 () Bool)

(assert (=> b!555850 m!533701))

(declare-fun m!533703 () Bool)

(assert (=> b!555853 m!533703))

(declare-fun m!533705 () Bool)

(assert (=> b!555853 m!533705))

(assert (=> b!555853 m!533703))

(declare-fun m!533707 () Bool)

(assert (=> b!555853 m!533707))

(declare-fun m!533709 () Bool)

(assert (=> b!555853 m!533709))

(assert (=> b!555853 m!533707))

(declare-fun m!533711 () Bool)

(assert (=> b!555853 m!533711))

(assert (=> b!555853 m!533707))

(declare-fun m!533713 () Bool)

(assert (=> b!555853 m!533713))

(assert (=> b!555853 m!533703))

(declare-fun m!533715 () Bool)

(assert (=> b!555853 m!533715))

(assert (=> b!555848 m!533703))

(declare-fun m!533717 () Bool)

(assert (=> b!555848 m!533717))

(declare-fun m!533719 () Bool)

(assert (=> b!555848 m!533719))

(declare-fun m!533721 () Bool)

(assert (=> b!555848 m!533721))

(assert (=> b!555848 m!533703))

(declare-fun m!533723 () Bool)

(assert (=> b!555848 m!533723))

(declare-fun m!533725 () Bool)

(assert (=> start!50804 m!533725))

(declare-fun m!533727 () Bool)

(assert (=> start!50804 m!533727))

(declare-fun m!533729 () Bool)

(assert (=> b!555852 m!533729))

(assert (=> b!555849 m!533703))

(assert (=> b!555849 m!533703))

(declare-fun m!533731 () Bool)

(assert (=> b!555849 m!533731))

(declare-fun m!533733 () Bool)

(assert (=> b!555847 m!533733))

(push 1)

