; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51722 () Bool)

(assert start!51722)

(declare-fun b!565823 () Bool)

(declare-fun res!356799 () Bool)

(declare-fun e!325713 () Bool)

(assert (=> b!565823 (=> (not res!356799) (not e!325713))))

(declare-datatypes ((array!35530 0))(
  ( (array!35531 (arr!17064 (Array (_ BitVec 32) (_ BitVec 64))) (size!17428 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35530)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565823 (= res!356799 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565824 () Bool)

(declare-fun e!325714 () Bool)

(assert (=> b!565824 (= e!325713 e!325714)))

(declare-fun res!356793 () Bool)

(assert (=> b!565824 (=> (not res!356793) (not e!325714))))

(declare-datatypes ((SeekEntryResult!5513 0))(
  ( (MissingZero!5513 (index!24279 (_ BitVec 32))) (Found!5513 (index!24280 (_ BitVec 32))) (Intermediate!5513 (undefined!6325 Bool) (index!24281 (_ BitVec 32)) (x!53150 (_ BitVec 32))) (Undefined!5513) (MissingVacant!5513 (index!24282 (_ BitVec 32))) )
))
(declare-fun lt!257964 () SeekEntryResult!5513)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565824 (= res!356793 (or (= lt!257964 (MissingZero!5513 i!1132)) (= lt!257964 (MissingVacant!5513 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35530 (_ BitVec 32)) SeekEntryResult!5513)

(assert (=> b!565824 (= lt!257964 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!565825 () Bool)

(declare-fun res!356792 () Bool)

(assert (=> b!565825 (=> (not res!356792) (not e!325713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565825 (= res!356792 (validKeyInArray!0 k!1914))))

(declare-fun b!565826 () Bool)

(declare-fun res!356800 () Bool)

(assert (=> b!565826 (=> (not res!356800) (not e!325713))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!565826 (= res!356800 (validKeyInArray!0 (select (arr!17064 a!3118) j!142)))))

(declare-fun b!565827 () Bool)

(assert (=> b!565827 (= e!325714 (not true))))

(declare-fun e!325715 () Bool)

(assert (=> b!565827 e!325715))

(declare-fun res!356795 () Bool)

(assert (=> b!565827 (=> (not res!356795) (not e!325715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35530 (_ BitVec 32)) Bool)

(assert (=> b!565827 (= res!356795 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17728 0))(
  ( (Unit!17729) )
))
(declare-fun lt!257965 () Unit!17728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17728)

(assert (=> b!565827 (= lt!257965 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565828 () Bool)

(declare-fun res!356797 () Bool)

(assert (=> b!565828 (=> (not res!356797) (not e!325713))))

(assert (=> b!565828 (= res!356797 (and (= (size!17428 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17428 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17428 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565830 () Bool)

(declare-fun res!356798 () Bool)

(assert (=> b!565830 (=> (not res!356798) (not e!325714))))

(declare-datatypes ((List!11144 0))(
  ( (Nil!11141) (Cons!11140 (h!12146 (_ BitVec 64)) (t!17372 List!11144)) )
))
(declare-fun arrayNoDuplicates!0 (array!35530 (_ BitVec 32) List!11144) Bool)

(assert (=> b!565830 (= res!356798 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11141))))

(declare-fun b!565831 () Bool)

(declare-fun res!356794 () Bool)

(assert (=> b!565831 (=> (not res!356794) (not e!325714))))

(assert (=> b!565831 (= res!356794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565832 () Bool)

(assert (=> b!565832 (= e!325715 (= (seekEntryOrOpen!0 (select (arr!17064 a!3118) j!142) a!3118 mask!3119) (Found!5513 j!142)))))

(declare-fun res!356796 () Bool)

(assert (=> start!51722 (=> (not res!356796) (not e!325713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51722 (= res!356796 (validMask!0 mask!3119))))

(assert (=> start!51722 e!325713))

(assert (=> start!51722 true))

(declare-fun array_inv!12860 (array!35530) Bool)

(assert (=> start!51722 (array_inv!12860 a!3118)))

(declare-fun b!565829 () Bool)

(declare-fun res!356801 () Bool)

(assert (=> b!565829 (=> (not res!356801) (not e!325714))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35530 (_ BitVec 32)) SeekEntryResult!5513)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565829 (= res!356801 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17064 a!3118) j!142) mask!3119) (select (arr!17064 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17064 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17064 a!3118) i!1132 k!1914) j!142) (array!35531 (store (arr!17064 a!3118) i!1132 k!1914) (size!17428 a!3118)) mask!3119)))))

(assert (= (and start!51722 res!356796) b!565828))

(assert (= (and b!565828 res!356797) b!565826))

(assert (= (and b!565826 res!356800) b!565825))

(assert (= (and b!565825 res!356792) b!565823))

(assert (= (and b!565823 res!356799) b!565824))

(assert (= (and b!565824 res!356793) b!565831))

(assert (= (and b!565831 res!356794) b!565830))

(assert (= (and b!565830 res!356798) b!565829))

(assert (= (and b!565829 res!356801) b!565827))

(assert (= (and b!565827 res!356795) b!565832))

(declare-fun m!544359 () Bool)

(assert (=> b!565829 m!544359))

(declare-fun m!544361 () Bool)

(assert (=> b!565829 m!544361))

(assert (=> b!565829 m!544359))

(declare-fun m!544363 () Bool)

(assert (=> b!565829 m!544363))

(declare-fun m!544365 () Bool)

(assert (=> b!565829 m!544365))

(assert (=> b!565829 m!544363))

(declare-fun m!544367 () Bool)

(assert (=> b!565829 m!544367))

(assert (=> b!565829 m!544361))

(assert (=> b!565829 m!544359))

(declare-fun m!544369 () Bool)

(assert (=> b!565829 m!544369))

(declare-fun m!544371 () Bool)

(assert (=> b!565829 m!544371))

(assert (=> b!565829 m!544363))

(assert (=> b!565829 m!544365))

(assert (=> b!565826 m!544359))

(assert (=> b!565826 m!544359))

(declare-fun m!544373 () Bool)

(assert (=> b!565826 m!544373))

(declare-fun m!544375 () Bool)

(assert (=> b!565831 m!544375))

(declare-fun m!544377 () Bool)

(assert (=> b!565823 m!544377))

(declare-fun m!544379 () Bool)

(assert (=> b!565827 m!544379))

(declare-fun m!544381 () Bool)

(assert (=> b!565827 m!544381))

(declare-fun m!544383 () Bool)

(assert (=> b!565825 m!544383))

(declare-fun m!544385 () Bool)

(assert (=> b!565824 m!544385))

(assert (=> b!565832 m!544359))

(assert (=> b!565832 m!544359))

(declare-fun m!544387 () Bool)

(assert (=> b!565832 m!544387))

(declare-fun m!544389 () Bool)

(assert (=> b!565830 m!544389))

(declare-fun m!544391 () Bool)

(assert (=> start!51722 m!544391))

(declare-fun m!544393 () Bool)

(assert (=> start!51722 m!544393))

(push 1)

