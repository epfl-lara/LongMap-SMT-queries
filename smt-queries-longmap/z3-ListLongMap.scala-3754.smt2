; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51564 () Bool)

(assert start!51564)

(declare-fun res!354868 () Bool)

(declare-fun e!324891 () Bool)

(assert (=> start!51564 (=> (not res!354868) (not e!324891))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51564 (= res!354868 (validMask!0 mask!3119))))

(assert (=> start!51564 e!324891))

(assert (=> start!51564 true))

(declare-datatypes ((array!35376 0))(
  ( (array!35377 (arr!16987 (Array (_ BitVec 32) (_ BitVec 64))) (size!17351 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35376)

(declare-fun array_inv!12846 (array!35376) Bool)

(assert (=> start!51564 (array_inv!12846 a!3118)))

(declare-fun b!563815 () Bool)

(declare-fun res!354867 () Bool)

(assert (=> b!563815 (=> (not res!354867) (not e!324891))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563815 (= res!354867 (validKeyInArray!0 (select (arr!16987 a!3118) j!142)))))

(declare-fun b!563816 () Bool)

(declare-fun res!354865 () Bool)

(declare-fun e!324894 () Bool)

(assert (=> b!563816 (=> (not res!354865) (not e!324894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35376 (_ BitVec 32)) Bool)

(assert (=> b!563816 (= res!354865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563817 () Bool)

(assert (=> b!563817 (= e!324891 e!324894)))

(declare-fun res!354864 () Bool)

(assert (=> b!563817 (=> (not res!354864) (not e!324894))))

(declare-datatypes ((SeekEntryResult!5392 0))(
  ( (MissingZero!5392 (index!23795 (_ BitVec 32))) (Found!5392 (index!23796 (_ BitVec 32))) (Intermediate!5392 (undefined!6204 Bool) (index!23797 (_ BitVec 32)) (x!52834 (_ BitVec 32))) (Undefined!5392) (MissingVacant!5392 (index!23798 (_ BitVec 32))) )
))
(declare-fun lt!257380 () SeekEntryResult!5392)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563817 (= res!354864 (or (= lt!257380 (MissingZero!5392 i!1132)) (= lt!257380 (MissingVacant!5392 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35376 (_ BitVec 32)) SeekEntryResult!5392)

(assert (=> b!563817 (= lt!257380 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563818 () Bool)

(declare-fun res!354862 () Bool)

(assert (=> b!563818 (=> (not res!354862) (not e!324891))))

(assert (=> b!563818 (= res!354862 (validKeyInArray!0 k0!1914))))

(declare-fun b!563819 () Bool)

(declare-fun res!354866 () Bool)

(assert (=> b!563819 (=> (not res!354866) (not e!324894))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35376 (_ BitVec 32)) SeekEntryResult!5392)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563819 (= res!354866 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16987 a!3118) j!142) mask!3119) (select (arr!16987 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16987 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16987 a!3118) i!1132 k0!1914) j!142) (array!35377 (store (arr!16987 a!3118) i!1132 k0!1914) (size!17351 a!3118)) mask!3119)))))

(declare-fun e!324893 () Bool)

(declare-fun b!563820 () Bool)

(assert (=> b!563820 (= e!324893 (= (seekEntryOrOpen!0 (select (arr!16987 a!3118) j!142) a!3118 mask!3119) (Found!5392 j!142)))))

(declare-fun b!563821 () Bool)

(assert (=> b!563821 (= e!324894 (not true))))

(assert (=> b!563821 e!324893))

(declare-fun res!354870 () Bool)

(assert (=> b!563821 (=> (not res!354870) (not e!324893))))

(assert (=> b!563821 (= res!354870 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17629 0))(
  ( (Unit!17630) )
))
(declare-fun lt!257379 () Unit!17629)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17629)

(assert (=> b!563821 (= lt!257379 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563822 () Bool)

(declare-fun res!354869 () Bool)

(assert (=> b!563822 (=> (not res!354869) (not e!324894))))

(declare-datatypes ((List!10974 0))(
  ( (Nil!10971) (Cons!10970 (h!11976 (_ BitVec 64)) (t!17194 List!10974)) )
))
(declare-fun arrayNoDuplicates!0 (array!35376 (_ BitVec 32) List!10974) Bool)

(assert (=> b!563822 (= res!354869 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10971))))

(declare-fun b!563823 () Bool)

(declare-fun res!354871 () Bool)

(assert (=> b!563823 (=> (not res!354871) (not e!324891))))

(assert (=> b!563823 (= res!354871 (and (= (size!17351 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17351 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17351 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563824 () Bool)

(declare-fun res!354863 () Bool)

(assert (=> b!563824 (=> (not res!354863) (not e!324891))))

(declare-fun arrayContainsKey!0 (array!35376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563824 (= res!354863 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51564 res!354868) b!563823))

(assert (= (and b!563823 res!354871) b!563815))

(assert (= (and b!563815 res!354867) b!563818))

(assert (= (and b!563818 res!354862) b!563824))

(assert (= (and b!563824 res!354863) b!563817))

(assert (= (and b!563817 res!354864) b!563816))

(assert (= (and b!563816 res!354865) b!563822))

(assert (= (and b!563822 res!354869) b!563819))

(assert (= (and b!563819 res!354866) b!563821))

(assert (= (and b!563821 res!354870) b!563820))

(declare-fun m!542333 () Bool)

(assert (=> b!563820 m!542333))

(assert (=> b!563820 m!542333))

(declare-fun m!542335 () Bool)

(assert (=> b!563820 m!542335))

(declare-fun m!542337 () Bool)

(assert (=> start!51564 m!542337))

(declare-fun m!542339 () Bool)

(assert (=> start!51564 m!542339))

(declare-fun m!542341 () Bool)

(assert (=> b!563822 m!542341))

(declare-fun m!542343 () Bool)

(assert (=> b!563818 m!542343))

(declare-fun m!542345 () Bool)

(assert (=> b!563817 m!542345))

(assert (=> b!563815 m!542333))

(assert (=> b!563815 m!542333))

(declare-fun m!542347 () Bool)

(assert (=> b!563815 m!542347))

(declare-fun m!542349 () Bool)

(assert (=> b!563816 m!542349))

(declare-fun m!542351 () Bool)

(assert (=> b!563824 m!542351))

(declare-fun m!542353 () Bool)

(assert (=> b!563821 m!542353))

(declare-fun m!542355 () Bool)

(assert (=> b!563821 m!542355))

(assert (=> b!563819 m!542333))

(declare-fun m!542357 () Bool)

(assert (=> b!563819 m!542357))

(assert (=> b!563819 m!542333))

(declare-fun m!542359 () Bool)

(assert (=> b!563819 m!542359))

(declare-fun m!542361 () Bool)

(assert (=> b!563819 m!542361))

(assert (=> b!563819 m!542359))

(declare-fun m!542363 () Bool)

(assert (=> b!563819 m!542363))

(assert (=> b!563819 m!542357))

(assert (=> b!563819 m!542333))

(declare-fun m!542365 () Bool)

(assert (=> b!563819 m!542365))

(declare-fun m!542367 () Bool)

(assert (=> b!563819 m!542367))

(assert (=> b!563819 m!542359))

(assert (=> b!563819 m!542361))

(check-sat (not b!563819) (not b!563821) (not b!563818) (not start!51564) (not b!563820) (not b!563815) (not b!563824) (not b!563816) (not b!563822) (not b!563817))
(check-sat)
