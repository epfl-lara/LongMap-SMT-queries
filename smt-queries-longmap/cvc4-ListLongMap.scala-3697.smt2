; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50802 () Bool)

(assert start!50802)

(declare-fun b!555819 () Bool)

(declare-fun res!348234 () Bool)

(declare-fun e!320304 () Bool)

(assert (=> b!555819 (=> (not res!348234) (not e!320304))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555819 (= res!348234 (validKeyInArray!0 k!1914))))

(declare-fun b!555820 () Bool)

(declare-fun res!348233 () Bool)

(assert (=> b!555820 (=> (not res!348233) (not e!320304))))

(declare-datatypes ((array!35027 0))(
  ( (array!35028 (arr!16823 (Array (_ BitVec 32) (_ BitVec 64))) (size!17187 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35027)

(declare-fun arrayContainsKey!0 (array!35027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555820 (= res!348233 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555821 () Bool)

(declare-fun e!320307 () Bool)

(assert (=> b!555821 (= e!320304 e!320307)))

(declare-fun res!348232 () Bool)

(assert (=> b!555821 (=> (not res!348232) (not e!320307))))

(declare-datatypes ((SeekEntryResult!5272 0))(
  ( (MissingZero!5272 (index!23315 (_ BitVec 32))) (Found!5272 (index!23316 (_ BitVec 32))) (Intermediate!5272 (undefined!6084 Bool) (index!23317 (_ BitVec 32)) (x!52210 (_ BitVec 32))) (Undefined!5272) (MissingVacant!5272 (index!23318 (_ BitVec 32))) )
))
(declare-fun lt!252669 () SeekEntryResult!5272)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555821 (= res!348232 (or (= lt!252669 (MissingZero!5272 i!1132)) (= lt!252669 (MissingVacant!5272 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35027 (_ BitVec 32)) SeekEntryResult!5272)

(assert (=> b!555821 (= lt!252669 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555822 () Bool)

(declare-fun e!320306 () Bool)

(assert (=> b!555822 (= e!320306 (not true))))

(declare-fun lt!252673 () SeekEntryResult!5272)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252672 () SeekEntryResult!5272)

(assert (=> b!555822 (and (= lt!252672 (Found!5272 j!142)) (or (undefined!6084 lt!252673) (not (is-Intermediate!5272 lt!252673)) (= (select (arr!16823 a!3118) (index!23317 lt!252673)) (select (arr!16823 a!3118) j!142)) (not (= (select (arr!16823 a!3118) (index!23317 lt!252673)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252672 (MissingZero!5272 (index!23317 lt!252673)))))))

(assert (=> b!555822 (= lt!252672 (seekEntryOrOpen!0 (select (arr!16823 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35027 (_ BitVec 32)) Bool)

(assert (=> b!555822 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17318 0))(
  ( (Unit!17319) )
))
(declare-fun lt!252668 () Unit!17318)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17318)

(assert (=> b!555822 (= lt!252668 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555823 () Bool)

(declare-fun res!348236 () Bool)

(assert (=> b!555823 (=> (not res!348236) (not e!320307))))

(declare-datatypes ((List!10903 0))(
  ( (Nil!10900) (Cons!10899 (h!11884 (_ BitVec 64)) (t!17131 List!10903)) )
))
(declare-fun arrayNoDuplicates!0 (array!35027 (_ BitVec 32) List!10903) Bool)

(assert (=> b!555823 (= res!348236 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10900))))

(declare-fun b!555824 () Bool)

(declare-fun res!348231 () Bool)

(assert (=> b!555824 (=> (not res!348231) (not e!320304))))

(assert (=> b!555824 (= res!348231 (validKeyInArray!0 (select (arr!16823 a!3118) j!142)))))

(declare-fun res!348238 () Bool)

(assert (=> start!50802 (=> (not res!348238) (not e!320304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50802 (= res!348238 (validMask!0 mask!3119))))

(assert (=> start!50802 e!320304))

(assert (=> start!50802 true))

(declare-fun array_inv!12619 (array!35027) Bool)

(assert (=> start!50802 (array_inv!12619 a!3118)))

(declare-fun b!555825 () Bool)

(assert (=> b!555825 (= e!320307 e!320306)))

(declare-fun res!348237 () Bool)

(assert (=> b!555825 (=> (not res!348237) (not e!320306))))

(declare-fun lt!252671 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35027 (_ BitVec 32)) SeekEntryResult!5272)

(assert (=> b!555825 (= res!348237 (= lt!252673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252671 (select (store (arr!16823 a!3118) i!1132 k!1914) j!142) (array!35028 (store (arr!16823 a!3118) i!1132 k!1914) (size!17187 a!3118)) mask!3119)))))

(declare-fun lt!252670 () (_ BitVec 32))

(assert (=> b!555825 (= lt!252673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252670 (select (arr!16823 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555825 (= lt!252671 (toIndex!0 (select (store (arr!16823 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555825 (= lt!252670 (toIndex!0 (select (arr!16823 a!3118) j!142) mask!3119))))

(declare-fun b!555826 () Bool)

(declare-fun res!348239 () Bool)

(assert (=> b!555826 (=> (not res!348239) (not e!320307))))

(assert (=> b!555826 (= res!348239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555827 () Bool)

(declare-fun res!348235 () Bool)

(assert (=> b!555827 (=> (not res!348235) (not e!320304))))

(assert (=> b!555827 (= res!348235 (and (= (size!17187 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17187 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17187 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50802 res!348238) b!555827))

(assert (= (and b!555827 res!348235) b!555824))

(assert (= (and b!555824 res!348231) b!555819))

(assert (= (and b!555819 res!348234) b!555820))

(assert (= (and b!555820 res!348233) b!555821))

(assert (= (and b!555821 res!348232) b!555826))

(assert (= (and b!555826 res!348239) b!555823))

(assert (= (and b!555823 res!348236) b!555825))

(assert (= (and b!555825 res!348237) b!555822))

(declare-fun m!533659 () Bool)

(assert (=> b!555825 m!533659))

(declare-fun m!533661 () Bool)

(assert (=> b!555825 m!533661))

(assert (=> b!555825 m!533659))

(declare-fun m!533663 () Bool)

(assert (=> b!555825 m!533663))

(declare-fun m!533665 () Bool)

(assert (=> b!555825 m!533665))

(assert (=> b!555825 m!533661))

(declare-fun m!533667 () Bool)

(assert (=> b!555825 m!533667))

(assert (=> b!555825 m!533659))

(declare-fun m!533669 () Bool)

(assert (=> b!555825 m!533669))

(assert (=> b!555825 m!533661))

(declare-fun m!533671 () Bool)

(assert (=> b!555825 m!533671))

(assert (=> b!555824 m!533659))

(assert (=> b!555824 m!533659))

(declare-fun m!533673 () Bool)

(assert (=> b!555824 m!533673))

(declare-fun m!533675 () Bool)

(assert (=> b!555819 m!533675))

(declare-fun m!533677 () Bool)

(assert (=> b!555823 m!533677))

(assert (=> b!555822 m!533659))

(declare-fun m!533679 () Bool)

(assert (=> b!555822 m!533679))

(declare-fun m!533681 () Bool)

(assert (=> b!555822 m!533681))

(declare-fun m!533683 () Bool)

(assert (=> b!555822 m!533683))

(assert (=> b!555822 m!533659))

(declare-fun m!533685 () Bool)

(assert (=> b!555822 m!533685))

(declare-fun m!533687 () Bool)

(assert (=> b!555821 m!533687))

(declare-fun m!533689 () Bool)

(assert (=> b!555826 m!533689))

(declare-fun m!533691 () Bool)

(assert (=> b!555820 m!533691))

(declare-fun m!533693 () Bool)

(assert (=> start!50802 m!533693))

(declare-fun m!533695 () Bool)

(assert (=> start!50802 m!533695))

(push 1)

