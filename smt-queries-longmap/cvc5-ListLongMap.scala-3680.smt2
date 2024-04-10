; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50696 () Bool)

(assert start!50696)

(declare-fun b!554372 () Bool)

(declare-fun e!319668 () Bool)

(declare-fun e!319671 () Bool)

(assert (=> b!554372 (= e!319668 e!319671)))

(declare-fun res!346790 () Bool)

(assert (=> b!554372 (=> (not res!346790) (not e!319671))))

(declare-datatypes ((SeekEntryResult!5219 0))(
  ( (MissingZero!5219 (index!23103 (_ BitVec 32))) (Found!5219 (index!23104 (_ BitVec 32))) (Intermediate!5219 (undefined!6031 Bool) (index!23105 (_ BitVec 32)) (x!52021 (_ BitVec 32))) (Undefined!5219) (MissingVacant!5219 (index!23106 (_ BitVec 32))) )
))
(declare-fun lt!251779 () SeekEntryResult!5219)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554372 (= res!346790 (or (= lt!251779 (MissingZero!5219 i!1132)) (= lt!251779 (MissingVacant!5219 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34921 0))(
  ( (array!34922 (arr!16770 (Array (_ BitVec 32) (_ BitVec 64))) (size!17134 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34921)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34921 (_ BitVec 32)) SeekEntryResult!5219)

(assert (=> b!554372 (= lt!251779 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554373 () Bool)

(declare-fun res!346789 () Bool)

(assert (=> b!554373 (=> (not res!346789) (not e!319671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34921 (_ BitVec 32)) Bool)

(assert (=> b!554373 (= res!346789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!346791 () Bool)

(assert (=> start!50696 (=> (not res!346791) (not e!319668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50696 (= res!346791 (validMask!0 mask!3119))))

(assert (=> start!50696 e!319668))

(assert (=> start!50696 true))

(declare-fun array_inv!12566 (array!34921) Bool)

(assert (=> start!50696 (array_inv!12566 a!3118)))

(declare-fun b!554374 () Bool)

(declare-fun res!346784 () Bool)

(assert (=> b!554374 (=> (not res!346784) (not e!319668))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554374 (= res!346784 (validKeyInArray!0 (select (arr!16770 a!3118) j!142)))))

(declare-fun b!554375 () Bool)

(declare-fun res!346793 () Bool)

(assert (=> b!554375 (=> (not res!346793) (not e!319668))))

(assert (=> b!554375 (= res!346793 (validKeyInArray!0 k!1914))))

(declare-fun b!554376 () Bool)

(declare-fun res!346785 () Bool)

(assert (=> b!554376 (=> (not res!346785) (not e!319671))))

(declare-datatypes ((List!10850 0))(
  ( (Nil!10847) (Cons!10846 (h!11831 (_ BitVec 64)) (t!17078 List!10850)) )
))
(declare-fun arrayNoDuplicates!0 (array!34921 (_ BitVec 32) List!10850) Bool)

(assert (=> b!554376 (= res!346785 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10847))))

(declare-fun b!554377 () Bool)

(declare-fun res!346788 () Bool)

(assert (=> b!554377 (=> (not res!346788) (not e!319668))))

(assert (=> b!554377 (= res!346788 (and (= (size!17134 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17134 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17134 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!319670 () Bool)

(declare-fun b!554378 () Bool)

(assert (=> b!554378 (= e!319670 (= (seekEntryOrOpen!0 (select (arr!16770 a!3118) j!142) a!3118 mask!3119) (Found!5219 j!142)))))

(declare-fun b!554379 () Bool)

(declare-fun res!346786 () Bool)

(assert (=> b!554379 (=> (not res!346786) (not e!319671))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34921 (_ BitVec 32)) SeekEntryResult!5219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554379 (= res!346786 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16770 a!3118) j!142) mask!3119) (select (arr!16770 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16770 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16770 a!3118) i!1132 k!1914) j!142) (array!34922 (store (arr!16770 a!3118) i!1132 k!1914) (size!17134 a!3118)) mask!3119)))))

(declare-fun b!554380 () Bool)

(declare-fun res!346792 () Bool)

(assert (=> b!554380 (=> (not res!346792) (not e!319668))))

(declare-fun arrayContainsKey!0 (array!34921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554380 (= res!346792 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554381 () Bool)

(assert (=> b!554381 (= e!319671 (not true))))

(assert (=> b!554381 e!319670))

(declare-fun res!346787 () Bool)

(assert (=> b!554381 (=> (not res!346787) (not e!319670))))

(assert (=> b!554381 (= res!346787 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17212 0))(
  ( (Unit!17213) )
))
(declare-fun lt!251778 () Unit!17212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17212)

(assert (=> b!554381 (= lt!251778 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50696 res!346791) b!554377))

(assert (= (and b!554377 res!346788) b!554374))

(assert (= (and b!554374 res!346784) b!554375))

(assert (= (and b!554375 res!346793) b!554380))

(assert (= (and b!554380 res!346792) b!554372))

(assert (= (and b!554372 res!346790) b!554373))

(assert (= (and b!554373 res!346789) b!554376))

(assert (= (and b!554376 res!346785) b!554379))

(assert (= (and b!554379 res!346786) b!554381))

(assert (= (and b!554381 res!346787) b!554378))

(declare-fun m!531657 () Bool)

(assert (=> b!554380 m!531657))

(declare-fun m!531659 () Bool)

(assert (=> b!554381 m!531659))

(declare-fun m!531661 () Bool)

(assert (=> b!554381 m!531661))

(declare-fun m!531663 () Bool)

(assert (=> b!554376 m!531663))

(declare-fun m!531665 () Bool)

(assert (=> b!554378 m!531665))

(assert (=> b!554378 m!531665))

(declare-fun m!531667 () Bool)

(assert (=> b!554378 m!531667))

(declare-fun m!531669 () Bool)

(assert (=> start!50696 m!531669))

(declare-fun m!531671 () Bool)

(assert (=> start!50696 m!531671))

(declare-fun m!531673 () Bool)

(assert (=> b!554375 m!531673))

(assert (=> b!554374 m!531665))

(assert (=> b!554374 m!531665))

(declare-fun m!531675 () Bool)

(assert (=> b!554374 m!531675))

(declare-fun m!531677 () Bool)

(assert (=> b!554372 m!531677))

(assert (=> b!554379 m!531665))

(declare-fun m!531679 () Bool)

(assert (=> b!554379 m!531679))

(assert (=> b!554379 m!531665))

(declare-fun m!531681 () Bool)

(assert (=> b!554379 m!531681))

(declare-fun m!531683 () Bool)

(assert (=> b!554379 m!531683))

(assert (=> b!554379 m!531681))

(declare-fun m!531685 () Bool)

(assert (=> b!554379 m!531685))

(assert (=> b!554379 m!531679))

(assert (=> b!554379 m!531665))

(declare-fun m!531687 () Bool)

(assert (=> b!554379 m!531687))

(declare-fun m!531689 () Bool)

(assert (=> b!554379 m!531689))

(assert (=> b!554379 m!531681))

(assert (=> b!554379 m!531683))

(declare-fun m!531691 () Bool)

(assert (=> b!554373 m!531691))

(push 1)

