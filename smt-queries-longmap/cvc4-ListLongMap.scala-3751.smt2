; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51504 () Bool)

(assert start!51504)

(declare-fun b!563405 () Bool)

(declare-fun res!354565 () Bool)

(declare-fun e!324677 () Bool)

(assert (=> b!563405 (=> (not res!354565) (not e!324677))))

(declare-datatypes ((array!35369 0))(
  ( (array!35370 (arr!16985 (Array (_ BitVec 32) (_ BitVec 64))) (size!17349 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35369)

(declare-datatypes ((List!11065 0))(
  ( (Nil!11062) (Cons!11061 (h!12064 (_ BitVec 64)) (t!17293 List!11065)) )
))
(declare-fun arrayNoDuplicates!0 (array!35369 (_ BitVec 32) List!11065) Bool)

(assert (=> b!563405 (= res!354565 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11062))))

(declare-fun b!563406 () Bool)

(declare-fun e!324681 () Bool)

(assert (=> b!563406 (= e!324681 e!324677)))

(declare-fun res!354557 () Bool)

(assert (=> b!563406 (=> (not res!354557) (not e!324677))))

(declare-datatypes ((SeekEntryResult!5434 0))(
  ( (MissingZero!5434 (index!23963 (_ BitVec 32))) (Found!5434 (index!23964 (_ BitVec 32))) (Intermediate!5434 (undefined!6246 Bool) (index!23965 (_ BitVec 32)) (x!52849 (_ BitVec 32))) (Undefined!5434) (MissingVacant!5434 (index!23966 (_ BitVec 32))) )
))
(declare-fun lt!257222 () SeekEntryResult!5434)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563406 (= res!354557 (or (= lt!257222 (MissingZero!5434 i!1132)) (= lt!257222 (MissingVacant!5434 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35369 (_ BitVec 32)) SeekEntryResult!5434)

(assert (=> b!563406 (= lt!257222 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563407 () Bool)

(declare-fun res!354560 () Bool)

(assert (=> b!563407 (=> (not res!354560) (not e!324681))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!563407 (= res!354560 (and (= (size!17349 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17349 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17349 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!324678 () Bool)

(declare-fun b!563408 () Bool)

(assert (=> b!563408 (= e!324678 (= (seekEntryOrOpen!0 (select (arr!16985 a!3118) j!142) a!3118 mask!3119) (Found!5434 j!142)))))

(declare-fun b!563409 () Bool)

(declare-fun e!324679 () Bool)

(assert (=> b!563409 (= e!324677 e!324679)))

(declare-fun res!354561 () Bool)

(assert (=> b!563409 (=> (not res!354561) (not e!324679))))

(declare-fun lt!257225 () SeekEntryResult!5434)

(declare-fun lt!257223 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35369 (_ BitVec 32)) SeekEntryResult!5434)

(assert (=> b!563409 (= res!354561 (= lt!257225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257223 (select (store (arr!16985 a!3118) i!1132 k!1914) j!142) (array!35370 (store (arr!16985 a!3118) i!1132 k!1914) (size!17349 a!3118)) mask!3119)))))

(declare-fun lt!257227 () (_ BitVec 32))

(assert (=> b!563409 (= lt!257225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257227 (select (arr!16985 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563409 (= lt!257223 (toIndex!0 (select (store (arr!16985 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!563409 (= lt!257227 (toIndex!0 (select (arr!16985 a!3118) j!142) mask!3119))))

(declare-fun b!563411 () Bool)

(declare-fun res!354558 () Bool)

(assert (=> b!563411 (=> (not res!354558) (not e!324681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563411 (= res!354558 (validKeyInArray!0 (select (arr!16985 a!3118) j!142)))))

(declare-fun b!563412 () Bool)

(declare-fun res!354564 () Bool)

(assert (=> b!563412 (=> (not res!354564) (not e!324677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35369 (_ BitVec 32)) Bool)

(assert (=> b!563412 (= res!354564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563410 () Bool)

(declare-fun lt!257224 () Bool)

(assert (=> b!563410 (= e!324679 (not (or (and (not lt!257224) (undefined!6246 lt!257225)) (and (not lt!257224) (not (undefined!6246 lt!257225))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!563410 (= lt!257224 (not (is-Intermediate!5434 lt!257225)))))

(assert (=> b!563410 e!324678))

(declare-fun res!354563 () Bool)

(assert (=> b!563410 (=> (not res!354563) (not e!324678))))

(assert (=> b!563410 (= res!354563 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17642 0))(
  ( (Unit!17643) )
))
(declare-fun lt!257226 () Unit!17642)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35369 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17642)

(assert (=> b!563410 (= lt!257226 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!354559 () Bool)

(assert (=> start!51504 (=> (not res!354559) (not e!324681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51504 (= res!354559 (validMask!0 mask!3119))))

(assert (=> start!51504 e!324681))

(assert (=> start!51504 true))

(declare-fun array_inv!12781 (array!35369) Bool)

(assert (=> start!51504 (array_inv!12781 a!3118)))

(declare-fun b!563413 () Bool)

(declare-fun res!354566 () Bool)

(assert (=> b!563413 (=> (not res!354566) (not e!324681))))

(declare-fun arrayContainsKey!0 (array!35369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563413 (= res!354566 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563414 () Bool)

(declare-fun res!354562 () Bool)

(assert (=> b!563414 (=> (not res!354562) (not e!324681))))

(assert (=> b!563414 (= res!354562 (validKeyInArray!0 k!1914))))

(assert (= (and start!51504 res!354559) b!563407))

(assert (= (and b!563407 res!354560) b!563411))

(assert (= (and b!563411 res!354558) b!563414))

(assert (= (and b!563414 res!354562) b!563413))

(assert (= (and b!563413 res!354566) b!563406))

(assert (= (and b!563406 res!354557) b!563412))

(assert (= (and b!563412 res!354564) b!563405))

(assert (= (and b!563405 res!354565) b!563409))

(assert (= (and b!563409 res!354561) b!563410))

(assert (= (and b!563410 res!354563) b!563408))

(declare-fun m!541743 () Bool)

(assert (=> b!563410 m!541743))

(declare-fun m!541745 () Bool)

(assert (=> b!563410 m!541745))

(declare-fun m!541747 () Bool)

(assert (=> b!563413 m!541747))

(declare-fun m!541749 () Bool)

(assert (=> b!563405 m!541749))

(declare-fun m!541751 () Bool)

(assert (=> start!51504 m!541751))

(declare-fun m!541753 () Bool)

(assert (=> start!51504 m!541753))

(declare-fun m!541755 () Bool)

(assert (=> b!563412 m!541755))

(declare-fun m!541757 () Bool)

(assert (=> b!563408 m!541757))

(assert (=> b!563408 m!541757))

(declare-fun m!541759 () Bool)

(assert (=> b!563408 m!541759))

(declare-fun m!541761 () Bool)

(assert (=> b!563414 m!541761))

(assert (=> b!563409 m!541757))

(declare-fun m!541763 () Bool)

(assert (=> b!563409 m!541763))

(declare-fun m!541765 () Bool)

(assert (=> b!563409 m!541765))

(declare-fun m!541767 () Bool)

(assert (=> b!563409 m!541767))

(assert (=> b!563409 m!541757))

(assert (=> b!563409 m!541765))

(declare-fun m!541769 () Bool)

(assert (=> b!563409 m!541769))

(assert (=> b!563409 m!541757))

(declare-fun m!541771 () Bool)

(assert (=> b!563409 m!541771))

(assert (=> b!563409 m!541765))

(declare-fun m!541773 () Bool)

(assert (=> b!563409 m!541773))

(declare-fun m!541775 () Bool)

(assert (=> b!563406 m!541775))

(assert (=> b!563411 m!541757))

(assert (=> b!563411 m!541757))

(declare-fun m!541777 () Bool)

(assert (=> b!563411 m!541777))

(push 1)

