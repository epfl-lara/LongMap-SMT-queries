; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50684 () Bool)

(assert start!50684)

(declare-fun b!554192 () Bool)

(declare-fun res!346605 () Bool)

(declare-fun e!319587 () Bool)

(assert (=> b!554192 (=> (not res!346605) (not e!319587))))

(declare-datatypes ((array!34909 0))(
  ( (array!34910 (arr!16764 (Array (_ BitVec 32) (_ BitVec 64))) (size!17128 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34909)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34909 (_ BitVec 32)) Bool)

(assert (=> b!554192 (= res!346605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554193 () Bool)

(declare-fun e!319589 () Bool)

(assert (=> b!554193 (= e!319589 e!319587)))

(declare-fun res!346608 () Bool)

(assert (=> b!554193 (=> (not res!346608) (not e!319587))))

(declare-datatypes ((SeekEntryResult!5213 0))(
  ( (MissingZero!5213 (index!23079 (_ BitVec 32))) (Found!5213 (index!23080 (_ BitVec 32))) (Intermediate!5213 (undefined!6025 Bool) (index!23081 (_ BitVec 32)) (x!51999 (_ BitVec 32))) (Undefined!5213) (MissingVacant!5213 (index!23082 (_ BitVec 32))) )
))
(declare-fun lt!251715 () SeekEntryResult!5213)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554193 (= res!346608 (or (= lt!251715 (MissingZero!5213 i!1132)) (= lt!251715 (MissingVacant!5213 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34909 (_ BitVec 32)) SeekEntryResult!5213)

(assert (=> b!554193 (= lt!251715 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554194 () Bool)

(declare-fun res!346610 () Bool)

(assert (=> b!554194 (=> (not res!346610) (not e!319589))))

(declare-fun arrayContainsKey!0 (array!34909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554194 (= res!346610 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!346613 () Bool)

(assert (=> start!50684 (=> (not res!346613) (not e!319589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50684 (= res!346613 (validMask!0 mask!3119))))

(assert (=> start!50684 e!319589))

(assert (=> start!50684 true))

(declare-fun array_inv!12560 (array!34909) Bool)

(assert (=> start!50684 (array_inv!12560 a!3118)))

(declare-fun b!554195 () Bool)

(declare-fun res!346607 () Bool)

(assert (=> b!554195 (=> (not res!346607) (not e!319589))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!554195 (= res!346607 (and (= (size!17128 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17128 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17128 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554196 () Bool)

(declare-fun res!346604 () Bool)

(assert (=> b!554196 (=> (not res!346604) (not e!319589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554196 (= res!346604 (validKeyInArray!0 k!1914))))

(declare-fun b!554197 () Bool)

(declare-fun res!346612 () Bool)

(assert (=> b!554197 (=> (not res!346612) (not e!319589))))

(assert (=> b!554197 (= res!346612 (validKeyInArray!0 (select (arr!16764 a!3118) j!142)))))

(declare-fun b!554198 () Bool)

(declare-fun res!346606 () Bool)

(assert (=> b!554198 (=> (not res!346606) (not e!319587))))

(declare-datatypes ((List!10844 0))(
  ( (Nil!10841) (Cons!10840 (h!11825 (_ BitVec 64)) (t!17072 List!10844)) )
))
(declare-fun arrayNoDuplicates!0 (array!34909 (_ BitVec 32) List!10844) Bool)

(assert (=> b!554198 (= res!346606 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10841))))

(declare-fun b!554199 () Bool)

(assert (=> b!554199 (= e!319587 (not true))))

(declare-fun e!319590 () Bool)

(assert (=> b!554199 e!319590))

(declare-fun res!346611 () Bool)

(assert (=> b!554199 (=> (not res!346611) (not e!319590))))

(assert (=> b!554199 (= res!346611 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17200 0))(
  ( (Unit!17201) )
))
(declare-fun lt!251716 () Unit!17200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17200)

(assert (=> b!554199 (= lt!251716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554200 () Bool)

(assert (=> b!554200 (= e!319590 (= (seekEntryOrOpen!0 (select (arr!16764 a!3118) j!142) a!3118 mask!3119) (Found!5213 j!142)))))

(declare-fun b!554201 () Bool)

(declare-fun res!346609 () Bool)

(assert (=> b!554201 (=> (not res!346609) (not e!319587))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34909 (_ BitVec 32)) SeekEntryResult!5213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554201 (= res!346609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16764 a!3118) j!142) mask!3119) (select (arr!16764 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16764 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16764 a!3118) i!1132 k!1914) j!142) (array!34910 (store (arr!16764 a!3118) i!1132 k!1914) (size!17128 a!3118)) mask!3119)))))

(assert (= (and start!50684 res!346613) b!554195))

(assert (= (and b!554195 res!346607) b!554197))

(assert (= (and b!554197 res!346612) b!554196))

(assert (= (and b!554196 res!346604) b!554194))

(assert (= (and b!554194 res!346610) b!554193))

(assert (= (and b!554193 res!346608) b!554192))

(assert (= (and b!554192 res!346605) b!554198))

(assert (= (and b!554198 res!346606) b!554201))

(assert (= (and b!554201 res!346609) b!554199))

(assert (= (and b!554199 res!346611) b!554200))

(declare-fun m!531435 () Bool)

(assert (=> start!50684 m!531435))

(declare-fun m!531437 () Bool)

(assert (=> start!50684 m!531437))

(declare-fun m!531439 () Bool)

(assert (=> b!554192 m!531439))

(declare-fun m!531441 () Bool)

(assert (=> b!554199 m!531441))

(declare-fun m!531443 () Bool)

(assert (=> b!554199 m!531443))

(declare-fun m!531445 () Bool)

(assert (=> b!554198 m!531445))

(declare-fun m!531447 () Bool)

(assert (=> b!554201 m!531447))

(declare-fun m!531449 () Bool)

(assert (=> b!554201 m!531449))

(assert (=> b!554201 m!531447))

(declare-fun m!531451 () Bool)

(assert (=> b!554201 m!531451))

(declare-fun m!531453 () Bool)

(assert (=> b!554201 m!531453))

(assert (=> b!554201 m!531451))

(declare-fun m!531455 () Bool)

(assert (=> b!554201 m!531455))

(assert (=> b!554201 m!531449))

(assert (=> b!554201 m!531447))

(declare-fun m!531457 () Bool)

(assert (=> b!554201 m!531457))

(declare-fun m!531459 () Bool)

(assert (=> b!554201 m!531459))

(assert (=> b!554201 m!531451))

(assert (=> b!554201 m!531453))

(declare-fun m!531461 () Bool)

(assert (=> b!554193 m!531461))

(declare-fun m!531463 () Bool)

(assert (=> b!554194 m!531463))

(assert (=> b!554197 m!531447))

(assert (=> b!554197 m!531447))

(declare-fun m!531465 () Bool)

(assert (=> b!554197 m!531465))

(declare-fun m!531467 () Bool)

(assert (=> b!554196 m!531467))

(assert (=> b!554200 m!531447))

(assert (=> b!554200 m!531447))

(declare-fun m!531469 () Bool)

(assert (=> b!554200 m!531469))

(push 1)

