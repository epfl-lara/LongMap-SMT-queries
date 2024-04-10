; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51726 () Bool)

(assert start!51726)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!325740 () Bool)

(declare-fun b!565883 () Bool)

(declare-datatypes ((array!35534 0))(
  ( (array!35535 (arr!17066 (Array (_ BitVec 32) (_ BitVec 64))) (size!17430 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35534)

(declare-datatypes ((SeekEntryResult!5515 0))(
  ( (MissingZero!5515 (index!24287 (_ BitVec 32))) (Found!5515 (index!24288 (_ BitVec 32))) (Intermediate!5515 (undefined!6327 Bool) (index!24289 (_ BitVec 32)) (x!53152 (_ BitVec 32))) (Undefined!5515) (MissingVacant!5515 (index!24290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35534 (_ BitVec 32)) SeekEntryResult!5515)

(assert (=> b!565883 (= e!325740 (= (seekEntryOrOpen!0 (select (arr!17066 a!3118) j!142) a!3118 mask!3119) (Found!5515 j!142)))))

(declare-fun b!565884 () Bool)

(declare-fun res!356856 () Bool)

(declare-fun e!325738 () Bool)

(assert (=> b!565884 (=> (not res!356856) (not e!325738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35534 (_ BitVec 32)) Bool)

(assert (=> b!565884 (= res!356856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565885 () Bool)

(declare-fun res!356852 () Bool)

(declare-fun e!325737 () Bool)

(assert (=> b!565885 (=> (not res!356852) (not e!325737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565885 (= res!356852 (validKeyInArray!0 (select (arr!17066 a!3118) j!142)))))

(declare-fun b!565886 () Bool)

(declare-fun res!356858 () Bool)

(assert (=> b!565886 (=> (not res!356858) (not e!325738))))

(declare-datatypes ((List!11146 0))(
  ( (Nil!11143) (Cons!11142 (h!12148 (_ BitVec 64)) (t!17374 List!11146)) )
))
(declare-fun arrayNoDuplicates!0 (array!35534 (_ BitVec 32) List!11146) Bool)

(assert (=> b!565886 (= res!356858 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11143))))

(declare-fun b!565887 () Bool)

(declare-fun res!356860 () Bool)

(assert (=> b!565887 (=> (not res!356860) (not e!325738))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35534 (_ BitVec 32)) SeekEntryResult!5515)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565887 (= res!356860 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17066 a!3118) j!142) mask!3119) (select (arr!17066 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17066 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17066 a!3118) i!1132 k!1914) j!142) (array!35535 (store (arr!17066 a!3118) i!1132 k!1914) (size!17430 a!3118)) mask!3119)))))

(declare-fun b!565888 () Bool)

(declare-fun res!356857 () Bool)

(assert (=> b!565888 (=> (not res!356857) (not e!325737))))

(assert (=> b!565888 (= res!356857 (and (= (size!17430 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17430 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17430 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565889 () Bool)

(assert (=> b!565889 (= e!325738 (not true))))

(assert (=> b!565889 e!325740))

(declare-fun res!356861 () Bool)

(assert (=> b!565889 (=> (not res!356861) (not e!325740))))

(assert (=> b!565889 (= res!356861 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17732 0))(
  ( (Unit!17733) )
))
(declare-fun lt!257977 () Unit!17732)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17732)

(assert (=> b!565889 (= lt!257977 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565891 () Bool)

(declare-fun res!356859 () Bool)

(assert (=> b!565891 (=> (not res!356859) (not e!325737))))

(assert (=> b!565891 (= res!356859 (validKeyInArray!0 k!1914))))

(declare-fun b!565892 () Bool)

(assert (=> b!565892 (= e!325737 e!325738)))

(declare-fun res!356853 () Bool)

(assert (=> b!565892 (=> (not res!356853) (not e!325738))))

(declare-fun lt!257976 () SeekEntryResult!5515)

(assert (=> b!565892 (= res!356853 (or (= lt!257976 (MissingZero!5515 i!1132)) (= lt!257976 (MissingVacant!5515 i!1132))))))

(assert (=> b!565892 (= lt!257976 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!356855 () Bool)

(assert (=> start!51726 (=> (not res!356855) (not e!325737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51726 (= res!356855 (validMask!0 mask!3119))))

(assert (=> start!51726 e!325737))

(assert (=> start!51726 true))

(declare-fun array_inv!12862 (array!35534) Bool)

(assert (=> start!51726 (array_inv!12862 a!3118)))

(declare-fun b!565890 () Bool)

(declare-fun res!356854 () Bool)

(assert (=> b!565890 (=> (not res!356854) (not e!325737))))

(declare-fun arrayContainsKey!0 (array!35534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565890 (= res!356854 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51726 res!356855) b!565888))

(assert (= (and b!565888 res!356857) b!565885))

(assert (= (and b!565885 res!356852) b!565891))

(assert (= (and b!565891 res!356859) b!565890))

(assert (= (and b!565890 res!356854) b!565892))

(assert (= (and b!565892 res!356853) b!565884))

(assert (= (and b!565884 res!356856) b!565886))

(assert (= (and b!565886 res!356858) b!565887))

(assert (= (and b!565887 res!356860) b!565889))

(assert (= (and b!565889 res!356861) b!565883))

(declare-fun m!544431 () Bool)

(assert (=> b!565887 m!544431))

(declare-fun m!544433 () Bool)

(assert (=> b!565887 m!544433))

(assert (=> b!565887 m!544431))

(declare-fun m!544435 () Bool)

(assert (=> b!565887 m!544435))

(declare-fun m!544437 () Bool)

(assert (=> b!565887 m!544437))

(assert (=> b!565887 m!544435))

(declare-fun m!544439 () Bool)

(assert (=> b!565887 m!544439))

(assert (=> b!565887 m!544433))

(assert (=> b!565887 m!544431))

(declare-fun m!544441 () Bool)

(assert (=> b!565887 m!544441))

(declare-fun m!544443 () Bool)

(assert (=> b!565887 m!544443))

(assert (=> b!565887 m!544435))

(assert (=> b!565887 m!544437))

(declare-fun m!544445 () Bool)

(assert (=> b!565890 m!544445))

(declare-fun m!544447 () Bool)

(assert (=> b!565892 m!544447))

(assert (=> b!565883 m!544431))

(assert (=> b!565883 m!544431))

(declare-fun m!544449 () Bool)

(assert (=> b!565883 m!544449))

(declare-fun m!544451 () Bool)

(assert (=> b!565891 m!544451))

(declare-fun m!544453 () Bool)

(assert (=> b!565884 m!544453))

(declare-fun m!544455 () Bool)

(assert (=> start!51726 m!544455))

(declare-fun m!544457 () Bool)

(assert (=> start!51726 m!544457))

(declare-fun m!544459 () Bool)

(assert (=> b!565889 m!544459))

(declare-fun m!544461 () Bool)

(assert (=> b!565889 m!544461))

(assert (=> b!565885 m!544431))

(assert (=> b!565885 m!544431))

(declare-fun m!544463 () Bool)

(assert (=> b!565885 m!544463))

(declare-fun m!544465 () Bool)

(assert (=> b!565886 m!544465))

(push 1)

(assert (not b!565885))

(assert (not start!51726))

(assert (not b!565884))

(assert (not b!565890))

(assert (not b!565883))

(assert (not b!565892))

(assert (not b!565887))

(assert (not b!565886))

(assert (not b!565889))

(assert (not b!565891))

(check-sat)

