; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52130 () Bool)

(assert start!52130)

(declare-fun b!568914 () Bool)

(declare-fun res!358938 () Bool)

(declare-fun e!327346 () Bool)

(assert (=> b!568914 (=> (not res!358938) (not e!327346))))

(declare-datatypes ((array!35653 0))(
  ( (array!35654 (arr!17118 (Array (_ BitVec 32) (_ BitVec 64))) (size!17482 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35653)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35653 (_ BitVec 32)) Bool)

(assert (=> b!568914 (= res!358938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568915 () Bool)

(declare-fun res!358939 () Bool)

(assert (=> b!568915 (=> (not res!358939) (not e!327346))))

(declare-datatypes ((List!11198 0))(
  ( (Nil!11195) (Cons!11194 (h!12215 (_ BitVec 64)) (t!17426 List!11198)) )
))
(declare-fun arrayNoDuplicates!0 (array!35653 (_ BitVec 32) List!11198) Bool)

(assert (=> b!568915 (= res!358939 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11195))))

(declare-fun b!568916 () Bool)

(declare-fun e!327348 () Bool)

(assert (=> b!568916 (= e!327346 e!327348)))

(declare-fun res!358933 () Bool)

(assert (=> b!568916 (=> (not res!358933) (not e!327348))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!259198 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5567 0))(
  ( (MissingZero!5567 (index!24495 (_ BitVec 32))) (Found!5567 (index!24496 (_ BitVec 32))) (Intermediate!5567 (undefined!6379 Bool) (index!24497 (_ BitVec 32)) (x!53378 (_ BitVec 32))) (Undefined!5567) (MissingVacant!5567 (index!24498 (_ BitVec 32))) )
))
(declare-fun lt!259197 () SeekEntryResult!5567)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35653 (_ BitVec 32)) SeekEntryResult!5567)

(assert (=> b!568916 (= res!358933 (= lt!259197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259198 (select (store (arr!17118 a!3118) i!1132 k!1914) j!142) (array!35654 (store (arr!17118 a!3118) i!1132 k!1914) (size!17482 a!3118)) mask!3119)))))

(declare-fun lt!259195 () (_ BitVec 32))

(assert (=> b!568916 (= lt!259197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259195 (select (arr!17118 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568916 (= lt!259198 (toIndex!0 (select (store (arr!17118 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!568916 (= lt!259195 (toIndex!0 (select (arr!17118 a!3118) j!142) mask!3119))))

(declare-fun b!568917 () Bool)

(declare-fun res!358940 () Bool)

(declare-fun e!327347 () Bool)

(assert (=> b!568917 (=> (not res!358940) (not e!327347))))

(declare-fun arrayContainsKey!0 (array!35653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568917 (= res!358940 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568918 () Bool)

(declare-fun res!358932 () Bool)

(assert (=> b!568918 (=> (not res!358932) (not e!327347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568918 (= res!358932 (validKeyInArray!0 k!1914))))

(declare-fun b!568919 () Bool)

(assert (=> b!568919 (= e!327348 (not true))))

(declare-fun lt!259193 () SeekEntryResult!5567)

(assert (=> b!568919 (and (= lt!259193 (Found!5567 j!142)) (or (undefined!6379 lt!259197) (not (is-Intermediate!5567 lt!259197)) (= (select (arr!17118 a!3118) (index!24497 lt!259197)) (select (arr!17118 a!3118) j!142)) (not (= (select (arr!17118 a!3118) (index!24497 lt!259197)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259193 (MissingZero!5567 (index!24497 lt!259197)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35653 (_ BitVec 32)) SeekEntryResult!5567)

(assert (=> b!568919 (= lt!259193 (seekEntryOrOpen!0 (select (arr!17118 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!568919 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17836 0))(
  ( (Unit!17837) )
))
(declare-fun lt!259196 () Unit!17836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17836)

(assert (=> b!568919 (= lt!259196 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568920 () Bool)

(declare-fun res!358937 () Bool)

(assert (=> b!568920 (=> (not res!358937) (not e!327347))))

(assert (=> b!568920 (= res!358937 (and (= (size!17482 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17482 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17482 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568921 () Bool)

(declare-fun res!358936 () Bool)

(assert (=> b!568921 (=> (not res!358936) (not e!327347))))

(assert (=> b!568921 (= res!358936 (validKeyInArray!0 (select (arr!17118 a!3118) j!142)))))

(declare-fun b!568922 () Bool)

(assert (=> b!568922 (= e!327347 e!327346)))

(declare-fun res!358935 () Bool)

(assert (=> b!568922 (=> (not res!358935) (not e!327346))))

(declare-fun lt!259194 () SeekEntryResult!5567)

(assert (=> b!568922 (= res!358935 (or (= lt!259194 (MissingZero!5567 i!1132)) (= lt!259194 (MissingVacant!5567 i!1132))))))

(assert (=> b!568922 (= lt!259194 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!358934 () Bool)

(assert (=> start!52130 (=> (not res!358934) (not e!327347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52130 (= res!358934 (validMask!0 mask!3119))))

(assert (=> start!52130 e!327347))

(assert (=> start!52130 true))

(declare-fun array_inv!12914 (array!35653) Bool)

(assert (=> start!52130 (array_inv!12914 a!3118)))

(assert (= (and start!52130 res!358934) b!568920))

(assert (= (and b!568920 res!358937) b!568921))

(assert (= (and b!568921 res!358936) b!568918))

(assert (= (and b!568918 res!358932) b!568917))

(assert (= (and b!568917 res!358940) b!568922))

(assert (= (and b!568922 res!358935) b!568914))

(assert (= (and b!568914 res!358938) b!568915))

(assert (= (and b!568915 res!358939) b!568916))

(assert (= (and b!568916 res!358933) b!568919))

(declare-fun m!547431 () Bool)

(assert (=> start!52130 m!547431))

(declare-fun m!547433 () Bool)

(assert (=> start!52130 m!547433))

(declare-fun m!547435 () Bool)

(assert (=> b!568917 m!547435))

(declare-fun m!547437 () Bool)

(assert (=> b!568916 m!547437))

(declare-fun m!547439 () Bool)

(assert (=> b!568916 m!547439))

(declare-fun m!547441 () Bool)

(assert (=> b!568916 m!547441))

(assert (=> b!568916 m!547441))

(declare-fun m!547443 () Bool)

(assert (=> b!568916 m!547443))

(declare-fun m!547445 () Bool)

(assert (=> b!568916 m!547445))

(assert (=> b!568916 m!547441))

(declare-fun m!547447 () Bool)

(assert (=> b!568916 m!547447))

(assert (=> b!568916 m!547437))

(declare-fun m!547449 () Bool)

(assert (=> b!568916 m!547449))

(assert (=> b!568916 m!547437))

(declare-fun m!547451 () Bool)

(assert (=> b!568915 m!547451))

(declare-fun m!547453 () Bool)

(assert (=> b!568918 m!547453))

(declare-fun m!547455 () Bool)

(assert (=> b!568914 m!547455))

(assert (=> b!568921 m!547437))

(assert (=> b!568921 m!547437))

(declare-fun m!547457 () Bool)

(assert (=> b!568921 m!547457))

(declare-fun m!547459 () Bool)

(assert (=> b!568922 m!547459))

(assert (=> b!568919 m!547437))

(declare-fun m!547461 () Bool)

(assert (=> b!568919 m!547461))

(declare-fun m!547463 () Bool)

(assert (=> b!568919 m!547463))

(declare-fun m!547465 () Bool)

(assert (=> b!568919 m!547465))

(assert (=> b!568919 m!547437))

(declare-fun m!547467 () Bool)

(assert (=> b!568919 m!547467))

(push 1)

