; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51696 () Bool)

(assert start!51696)

(declare-fun b!565433 () Bool)

(declare-fun res!356403 () Bool)

(declare-fun e!325558 () Bool)

(assert (=> b!565433 (=> (not res!356403) (not e!325558))))

(declare-datatypes ((array!35504 0))(
  ( (array!35505 (arr!17051 (Array (_ BitVec 32) (_ BitVec 64))) (size!17415 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35504)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565433 (= res!356403 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!565434 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!325560 () Bool)

(declare-datatypes ((SeekEntryResult!5500 0))(
  ( (MissingZero!5500 (index!24227 (_ BitVec 32))) (Found!5500 (index!24228 (_ BitVec 32))) (Intermediate!5500 (undefined!6312 Bool) (index!24229 (_ BitVec 32)) (x!53097 (_ BitVec 32))) (Undefined!5500) (MissingVacant!5500 (index!24230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35504 (_ BitVec 32)) SeekEntryResult!5500)

(assert (=> b!565434 (= e!325560 (= (seekEntryOrOpen!0 (select (arr!17051 a!3118) j!142) a!3118 mask!3119) (Found!5500 j!142)))))

(declare-fun b!565435 () Bool)

(declare-fun res!356404 () Bool)

(assert (=> b!565435 (=> (not res!356404) (not e!325558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565435 (= res!356404 (validKeyInArray!0 (select (arr!17051 a!3118) j!142)))))

(declare-fun res!356409 () Bool)

(assert (=> start!51696 (=> (not res!356409) (not e!325558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51696 (= res!356409 (validMask!0 mask!3119))))

(assert (=> start!51696 e!325558))

(assert (=> start!51696 true))

(declare-fun array_inv!12847 (array!35504) Bool)

(assert (=> start!51696 (array_inv!12847 a!3118)))

(declare-fun b!565436 () Bool)

(declare-fun res!356407 () Bool)

(declare-fun e!325559 () Bool)

(assert (=> b!565436 (=> (not res!356407) (not e!325559))))

(declare-datatypes ((List!11131 0))(
  ( (Nil!11128) (Cons!11127 (h!12133 (_ BitVec 64)) (t!17359 List!11131)) )
))
(declare-fun arrayNoDuplicates!0 (array!35504 (_ BitVec 32) List!11131) Bool)

(assert (=> b!565436 (= res!356407 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11128))))

(declare-fun b!565437 () Bool)

(assert (=> b!565437 (= e!325559 (not true))))

(assert (=> b!565437 e!325560))

(declare-fun res!356411 () Bool)

(assert (=> b!565437 (=> (not res!356411) (not e!325560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35504 (_ BitVec 32)) Bool)

(assert (=> b!565437 (= res!356411 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17702 0))(
  ( (Unit!17703) )
))
(declare-fun lt!257886 () Unit!17702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17702)

(assert (=> b!565437 (= lt!257886 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565438 () Bool)

(declare-fun res!356410 () Bool)

(assert (=> b!565438 (=> (not res!356410) (not e!325559))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35504 (_ BitVec 32)) SeekEntryResult!5500)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565438 (= res!356410 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17051 a!3118) j!142) mask!3119) (select (arr!17051 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17051 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17051 a!3118) i!1132 k!1914) j!142) (array!35505 (store (arr!17051 a!3118) i!1132 k!1914) (size!17415 a!3118)) mask!3119)))))

(declare-fun b!565439 () Bool)

(declare-fun res!356402 () Bool)

(assert (=> b!565439 (=> (not res!356402) (not e!325558))))

(assert (=> b!565439 (= res!356402 (and (= (size!17415 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17415 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17415 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565440 () Bool)

(declare-fun res!356405 () Bool)

(assert (=> b!565440 (=> (not res!356405) (not e!325558))))

(assert (=> b!565440 (= res!356405 (validKeyInArray!0 k!1914))))

(declare-fun b!565441 () Bool)

(declare-fun res!356406 () Bool)

(assert (=> b!565441 (=> (not res!356406) (not e!325559))))

(assert (=> b!565441 (= res!356406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565442 () Bool)

(assert (=> b!565442 (= e!325558 e!325559)))

(declare-fun res!356408 () Bool)

(assert (=> b!565442 (=> (not res!356408) (not e!325559))))

(declare-fun lt!257887 () SeekEntryResult!5500)

(assert (=> b!565442 (= res!356408 (or (= lt!257887 (MissingZero!5500 i!1132)) (= lt!257887 (MissingVacant!5500 i!1132))))))

(assert (=> b!565442 (= lt!257887 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51696 res!356409) b!565439))

(assert (= (and b!565439 res!356402) b!565435))

(assert (= (and b!565435 res!356404) b!565440))

(assert (= (and b!565440 res!356405) b!565433))

(assert (= (and b!565433 res!356403) b!565442))

(assert (= (and b!565442 res!356408) b!565441))

(assert (= (and b!565441 res!356406) b!565436))

(assert (= (and b!565436 res!356407) b!565438))

(assert (= (and b!565438 res!356410) b!565437))

(assert (= (and b!565437 res!356411) b!565434))

(declare-fun m!543891 () Bool)

(assert (=> b!565440 m!543891))

(declare-fun m!543893 () Bool)

(assert (=> b!565437 m!543893))

(declare-fun m!543895 () Bool)

(assert (=> b!565437 m!543895))

(declare-fun m!543897 () Bool)

(assert (=> b!565436 m!543897))

(declare-fun m!543899 () Bool)

(assert (=> b!565433 m!543899))

(declare-fun m!543901 () Bool)

(assert (=> b!565435 m!543901))

(assert (=> b!565435 m!543901))

(declare-fun m!543903 () Bool)

(assert (=> b!565435 m!543903))

(declare-fun m!543905 () Bool)

(assert (=> b!565442 m!543905))

(declare-fun m!543907 () Bool)

(assert (=> b!565441 m!543907))

(declare-fun m!543909 () Bool)

(assert (=> start!51696 m!543909))

(declare-fun m!543911 () Bool)

(assert (=> start!51696 m!543911))

(assert (=> b!565434 m!543901))

(assert (=> b!565434 m!543901))

(declare-fun m!543913 () Bool)

(assert (=> b!565434 m!543913))

(assert (=> b!565438 m!543901))

(declare-fun m!543915 () Bool)

(assert (=> b!565438 m!543915))

(assert (=> b!565438 m!543901))

(declare-fun m!543917 () Bool)

(assert (=> b!565438 m!543917))

(declare-fun m!543919 () Bool)

(assert (=> b!565438 m!543919))

(assert (=> b!565438 m!543917))

(declare-fun m!543921 () Bool)

(assert (=> b!565438 m!543921))

(assert (=> b!565438 m!543915))

(assert (=> b!565438 m!543901))

(declare-fun m!543923 () Bool)

(assert (=> b!565438 m!543923))

(declare-fun m!543925 () Bool)

(assert (=> b!565438 m!543925))

(assert (=> b!565438 m!543917))

(assert (=> b!565438 m!543919))

(push 1)

