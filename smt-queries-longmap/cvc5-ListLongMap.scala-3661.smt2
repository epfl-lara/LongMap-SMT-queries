; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50582 () Bool)

(assert start!50582)

(declare-fun b!552637 () Bool)

(declare-fun res!345054 () Bool)

(declare-fun e!318889 () Bool)

(assert (=> b!552637 (=> (not res!345054) (not e!318889))))

(declare-datatypes ((array!34807 0))(
  ( (array!34808 (arr!16713 (Array (_ BitVec 32) (_ BitVec 64))) (size!17077 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34807)

(declare-datatypes ((List!10793 0))(
  ( (Nil!10790) (Cons!10789 (h!11774 (_ BitVec 64)) (t!17021 List!10793)) )
))
(declare-fun arrayNoDuplicates!0 (array!34807 (_ BitVec 32) List!10793) Bool)

(assert (=> b!552637 (= res!345054 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10790))))

(declare-fun b!552638 () Bool)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun e!318892 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552638 (= e!318892 (validKeyInArray!0 (select (store (arr!16713 a!3118) i!1132 k!1914) j!142)))))

(declare-fun b!552639 () Bool)

(declare-fun res!345052 () Bool)

(assert (=> b!552639 (=> (not res!345052) (not e!318889))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34807 (_ BitVec 32)) Bool)

(assert (=> b!552639 (= res!345052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!345055 () Bool)

(declare-fun e!318891 () Bool)

(assert (=> start!50582 (=> (not res!345055) (not e!318891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50582 (= res!345055 (validMask!0 mask!3119))))

(assert (=> start!50582 e!318891))

(assert (=> start!50582 true))

(declare-fun array_inv!12509 (array!34807) Bool)

(assert (=> start!50582 (array_inv!12509 a!3118)))

(declare-fun b!552640 () Bool)

(declare-fun e!318893 () Bool)

(assert (=> b!552640 (= e!318889 e!318893)))

(declare-fun res!345051 () Bool)

(assert (=> b!552640 (=> (not res!345051) (not e!318893))))

(declare-fun lt!251236 () (_ BitVec 32))

(declare-fun lt!251233 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5162 0))(
  ( (MissingZero!5162 (index!22875 (_ BitVec 32))) (Found!5162 (index!22876 (_ BitVec 32))) (Intermediate!5162 (undefined!5974 Bool) (index!22877 (_ BitVec 32)) (x!51812 (_ BitVec 32))) (Undefined!5162) (MissingVacant!5162 (index!22878 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34807 (_ BitVec 32)) SeekEntryResult!5162)

(assert (=> b!552640 (= res!345051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251236 (select (arr!16713 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251233 (select (store (arr!16713 a!3118) i!1132 k!1914) j!142) (array!34808 (store (arr!16713 a!3118) i!1132 k!1914) (size!17077 a!3118)) mask!3119)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552640 (= lt!251233 (toIndex!0 (select (store (arr!16713 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!552640 (= lt!251236 (toIndex!0 (select (arr!16713 a!3118) j!142) mask!3119))))

(declare-fun b!552641 () Bool)

(declare-fun res!345053 () Bool)

(assert (=> b!552641 (=> (not res!345053) (not e!318891))))

(assert (=> b!552641 (= res!345053 (and (= (size!17077 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17077 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17077 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552642 () Bool)

(declare-fun res!345057 () Bool)

(assert (=> b!552642 (=> (not res!345057) (not e!318891))))

(assert (=> b!552642 (= res!345057 (validKeyInArray!0 k!1914))))

(declare-fun b!552643 () Bool)

(assert (=> b!552643 (= e!318893 (not e!318892))))

(declare-fun res!345056 () Bool)

(assert (=> b!552643 (=> res!345056 e!318892)))

(assert (=> b!552643 (= res!345056 (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt lt!251233 #b00000000000000000000000000000000) (bvsge lt!251233 (bvadd #b00000000000000000000000000000001 mask!3119))))))

(declare-fun e!318894 () Bool)

(assert (=> b!552643 e!318894))

(declare-fun res!345058 () Bool)

(assert (=> b!552643 (=> (not res!345058) (not e!318894))))

(assert (=> b!552643 (= res!345058 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17098 0))(
  ( (Unit!17099) )
))
(declare-fun lt!251234 () Unit!17098)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17098)

(assert (=> b!552643 (= lt!251234 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552644 () Bool)

(declare-fun res!345049 () Bool)

(assert (=> b!552644 (=> (not res!345049) (not e!318891))))

(assert (=> b!552644 (= res!345049 (validKeyInArray!0 (select (arr!16713 a!3118) j!142)))))

(declare-fun b!552645 () Bool)

(declare-fun res!345059 () Bool)

(assert (=> b!552645 (=> (not res!345059) (not e!318891))))

(declare-fun arrayContainsKey!0 (array!34807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552645 (= res!345059 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552646 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34807 (_ BitVec 32)) SeekEntryResult!5162)

(assert (=> b!552646 (= e!318894 (= (seekEntryOrOpen!0 (select (arr!16713 a!3118) j!142) a!3118 mask!3119) (Found!5162 j!142)))))

(declare-fun b!552647 () Bool)

(assert (=> b!552647 (= e!318891 e!318889)))

(declare-fun res!345050 () Bool)

(assert (=> b!552647 (=> (not res!345050) (not e!318889))))

(declare-fun lt!251235 () SeekEntryResult!5162)

(assert (=> b!552647 (= res!345050 (or (= lt!251235 (MissingZero!5162 i!1132)) (= lt!251235 (MissingVacant!5162 i!1132))))))

(assert (=> b!552647 (= lt!251235 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50582 res!345055) b!552641))

(assert (= (and b!552641 res!345053) b!552644))

(assert (= (and b!552644 res!345049) b!552642))

(assert (= (and b!552642 res!345057) b!552645))

(assert (= (and b!552645 res!345059) b!552647))

(assert (= (and b!552647 res!345050) b!552639))

(assert (= (and b!552639 res!345052) b!552637))

(assert (= (and b!552637 res!345054) b!552640))

(assert (= (and b!552640 res!345051) b!552643))

(assert (= (and b!552643 res!345058) b!552646))

(assert (= (and b!552643 (not res!345056)) b!552638))

(declare-fun m!529563 () Bool)

(assert (=> b!552638 m!529563))

(declare-fun m!529565 () Bool)

(assert (=> b!552638 m!529565))

(assert (=> b!552638 m!529565))

(declare-fun m!529567 () Bool)

(assert (=> b!552638 m!529567))

(declare-fun m!529569 () Bool)

(assert (=> start!50582 m!529569))

(declare-fun m!529571 () Bool)

(assert (=> start!50582 m!529571))

(declare-fun m!529573 () Bool)

(assert (=> b!552647 m!529573))

(declare-fun m!529575 () Bool)

(assert (=> b!552644 m!529575))

(assert (=> b!552644 m!529575))

(declare-fun m!529577 () Bool)

(assert (=> b!552644 m!529577))

(declare-fun m!529579 () Bool)

(assert (=> b!552639 m!529579))

(declare-fun m!529581 () Bool)

(assert (=> b!552637 m!529581))

(assert (=> b!552640 m!529575))

(assert (=> b!552640 m!529565))

(declare-fun m!529583 () Bool)

(assert (=> b!552640 m!529583))

(assert (=> b!552640 m!529565))

(assert (=> b!552640 m!529563))

(assert (=> b!552640 m!529565))

(declare-fun m!529585 () Bool)

(assert (=> b!552640 m!529585))

(assert (=> b!552640 m!529575))

(declare-fun m!529587 () Bool)

(assert (=> b!552640 m!529587))

(assert (=> b!552640 m!529575))

(declare-fun m!529589 () Bool)

(assert (=> b!552640 m!529589))

(declare-fun m!529591 () Bool)

(assert (=> b!552643 m!529591))

(declare-fun m!529593 () Bool)

(assert (=> b!552643 m!529593))

(declare-fun m!529595 () Bool)

(assert (=> b!552642 m!529595))

(declare-fun m!529597 () Bool)

(assert (=> b!552645 m!529597))

(assert (=> b!552646 m!529575))

(assert (=> b!552646 m!529575))

(declare-fun m!529599 () Bool)

(assert (=> b!552646 m!529599))

(push 1)

