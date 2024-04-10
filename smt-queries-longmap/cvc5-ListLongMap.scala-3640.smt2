; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50216 () Bool)

(assert start!50216)

(declare-fun b!549649 () Bool)

(declare-fun res!342799 () Bool)

(declare-fun e!317421 () Bool)

(assert (=> b!549649 (=> (not res!342799) (not e!317421))))

(declare-datatypes ((array!34669 0))(
  ( (array!34670 (arr!16650 (Array (_ BitVec 32) (_ BitVec 64))) (size!17014 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34669)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549649 (= res!342799 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549650 () Bool)

(declare-fun res!342797 () Bool)

(declare-fun e!317420 () Bool)

(assert (=> b!549650 (=> (not res!342797) (not e!317420))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34669 (_ BitVec 32)) Bool)

(assert (=> b!549650 (= res!342797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549652 () Bool)

(declare-fun res!342798 () Bool)

(assert (=> b!549652 (=> (not res!342798) (not e!317421))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549652 (= res!342798 (validKeyInArray!0 (select (arr!16650 a!3118) j!142)))))

(declare-fun b!549653 () Bool)

(declare-fun res!342793 () Bool)

(assert (=> b!549653 (=> (not res!342793) (not e!317421))))

(assert (=> b!549653 (= res!342793 (validKeyInArray!0 k!1914))))

(declare-fun b!549654 () Bool)

(declare-fun res!342800 () Bool)

(assert (=> b!549654 (=> (not res!342800) (not e!317421))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549654 (= res!342800 (and (= (size!17014 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17014 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17014 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!342796 () Bool)

(assert (=> start!50216 (=> (not res!342796) (not e!317421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50216 (= res!342796 (validMask!0 mask!3119))))

(assert (=> start!50216 e!317421))

(assert (=> start!50216 true))

(declare-fun array_inv!12446 (array!34669) Bool)

(assert (=> start!50216 (array_inv!12446 a!3118)))

(declare-fun b!549651 () Bool)

(assert (=> b!549651 (= e!317421 e!317420)))

(declare-fun res!342794 () Bool)

(assert (=> b!549651 (=> (not res!342794) (not e!317420))))

(declare-datatypes ((SeekEntryResult!5099 0))(
  ( (MissingZero!5099 (index!22623 (_ BitVec 32))) (Found!5099 (index!22624 (_ BitVec 32))) (Intermediate!5099 (undefined!5911 Bool) (index!22625 (_ BitVec 32)) (x!51557 (_ BitVec 32))) (Undefined!5099) (MissingVacant!5099 (index!22626 (_ BitVec 32))) )
))
(declare-fun lt!250261 () SeekEntryResult!5099)

(assert (=> b!549651 (= res!342794 (or (= lt!250261 (MissingZero!5099 i!1132)) (= lt!250261 (MissingVacant!5099 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34669 (_ BitVec 32)) SeekEntryResult!5099)

(assert (=> b!549651 (= lt!250261 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549655 () Bool)

(declare-fun res!342795 () Bool)

(assert (=> b!549655 (=> (not res!342795) (not e!317420))))

(declare-datatypes ((List!10730 0))(
  ( (Nil!10727) (Cons!10726 (h!11699 (_ BitVec 64)) (t!16958 List!10730)) )
))
(declare-fun arrayNoDuplicates!0 (array!34669 (_ BitVec 32) List!10730) Bool)

(assert (=> b!549655 (= res!342795 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10727))))

(declare-fun b!549656 () Bool)

(assert (=> b!549656 (= e!317420 false)))

(declare-fun lt!250263 () SeekEntryResult!5099)

(declare-fun lt!250264 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34669 (_ BitVec 32)) SeekEntryResult!5099)

(assert (=> b!549656 (= lt!250263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250264 (select (store (arr!16650 a!3118) i!1132 k!1914) j!142) (array!34670 (store (arr!16650 a!3118) i!1132 k!1914) (size!17014 a!3118)) mask!3119))))

(declare-fun lt!250260 () (_ BitVec 32))

(declare-fun lt!250262 () SeekEntryResult!5099)

(assert (=> b!549656 (= lt!250262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250260 (select (arr!16650 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549656 (= lt!250264 (toIndex!0 (select (store (arr!16650 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!549656 (= lt!250260 (toIndex!0 (select (arr!16650 a!3118) j!142) mask!3119))))

(assert (= (and start!50216 res!342796) b!549654))

(assert (= (and b!549654 res!342800) b!549652))

(assert (= (and b!549652 res!342798) b!549653))

(assert (= (and b!549653 res!342793) b!549649))

(assert (= (and b!549649 res!342799) b!549651))

(assert (= (and b!549651 res!342794) b!549650))

(assert (= (and b!549650 res!342797) b!549655))

(assert (= (and b!549655 res!342795) b!549656))

(declare-fun m!526551 () Bool)

(assert (=> b!549652 m!526551))

(assert (=> b!549652 m!526551))

(declare-fun m!526553 () Bool)

(assert (=> b!549652 m!526553))

(declare-fun m!526555 () Bool)

(assert (=> b!549653 m!526555))

(assert (=> b!549656 m!526551))

(declare-fun m!526557 () Bool)

(assert (=> b!549656 m!526557))

(assert (=> b!549656 m!526551))

(declare-fun m!526559 () Bool)

(assert (=> b!549656 m!526559))

(declare-fun m!526561 () Bool)

(assert (=> b!549656 m!526561))

(assert (=> b!549656 m!526559))

(declare-fun m!526563 () Bool)

(assert (=> b!549656 m!526563))

(assert (=> b!549656 m!526559))

(declare-fun m!526565 () Bool)

(assert (=> b!549656 m!526565))

(assert (=> b!549656 m!526551))

(declare-fun m!526567 () Bool)

(assert (=> b!549656 m!526567))

(declare-fun m!526569 () Bool)

(assert (=> b!549649 m!526569))

(declare-fun m!526571 () Bool)

(assert (=> b!549651 m!526571))

(declare-fun m!526573 () Bool)

(assert (=> b!549650 m!526573))

(declare-fun m!526575 () Bool)

(assert (=> start!50216 m!526575))

(declare-fun m!526577 () Bool)

(assert (=> start!50216 m!526577))

(declare-fun m!526579 () Bool)

(assert (=> b!549655 m!526579))

(push 1)

