; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50714 () Bool)

(assert start!50714)

(declare-datatypes ((SeekEntryResult!5230 0))(
  ( (MissingZero!5230 (index!23147 (_ BitVec 32))) (Found!5230 (index!23148 (_ BitVec 32))) (Intermediate!5230 (undefined!6042 Bool) (index!23149 (_ BitVec 32)) (x!52067 (_ BitVec 32))) (Undefined!5230) (MissingVacant!5230 (index!23150 (_ BitVec 32))) )
))
(declare-fun lt!251750 () SeekEntryResult!5230)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!554522 () Bool)

(declare-fun e!319675 () Bool)

(declare-datatypes ((array!34948 0))(
  ( (array!34949 (arr!16784 (Array (_ BitVec 32) (_ BitVec 64))) (size!17149 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34948)

(get-info :version)

(assert (=> b!554522 (= e!319675 (not (or (undefined!6042 lt!251750) (not ((_ is Intermediate!5230) lt!251750)) (= (select (arr!16784 a!3118) (index!23149 lt!251750)) (select (arr!16784 a!3118) j!142)) (not (= (select (arr!16784 a!3118) (index!23149 lt!251750)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!17149 a!3118)))))))

(declare-fun lt!251753 () SeekEntryResult!5230)

(assert (=> b!554522 (and (= lt!251753 (Found!5230 j!142)) (or (undefined!6042 lt!251750) (not ((_ is Intermediate!5230) lt!251750)) (= (select (arr!16784 a!3118) (index!23149 lt!251750)) (select (arr!16784 a!3118) j!142)) (not (= (select (arr!16784 a!3118) (index!23149 lt!251750)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251753 (MissingZero!5230 (index!23149 lt!251750)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34948 (_ BitVec 32)) SeekEntryResult!5230)

(assert (=> b!554522 (= lt!251753 (seekEntryOrOpen!0 (select (arr!16784 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34948 (_ BitVec 32)) Bool)

(assert (=> b!554522 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17220 0))(
  ( (Unit!17221) )
))
(declare-fun lt!251752 () Unit!17220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17220)

(assert (=> b!554522 (= lt!251752 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554523 () Bool)

(declare-fun res!347076 () Bool)

(declare-fun e!319677 () Bool)

(assert (=> b!554523 (=> (not res!347076) (not e!319677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554523 (= res!347076 (validKeyInArray!0 (select (arr!16784 a!3118) j!142)))))

(declare-fun b!554524 () Bool)

(declare-fun res!347078 () Bool)

(assert (=> b!554524 (=> (not res!347078) (not e!319677))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554524 (= res!347078 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554525 () Bool)

(declare-fun res!347083 () Bool)

(declare-fun e!319676 () Bool)

(assert (=> b!554525 (=> (not res!347083) (not e!319676))))

(assert (=> b!554525 (= res!347083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554526 () Bool)

(declare-fun res!347077 () Bool)

(assert (=> b!554526 (=> (not res!347077) (not e!319676))))

(declare-datatypes ((List!10903 0))(
  ( (Nil!10900) (Cons!10899 (h!11884 (_ BitVec 64)) (t!17122 List!10903)) )
))
(declare-fun arrayNoDuplicates!0 (array!34948 (_ BitVec 32) List!10903) Bool)

(assert (=> b!554526 (= res!347077 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10900))))

(declare-fun b!554527 () Bool)

(assert (=> b!554527 (= e!319677 e!319676)))

(declare-fun res!347084 () Bool)

(assert (=> b!554527 (=> (not res!347084) (not e!319676))))

(declare-fun lt!251755 () SeekEntryResult!5230)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554527 (= res!347084 (or (= lt!251755 (MissingZero!5230 i!1132)) (= lt!251755 (MissingVacant!5230 i!1132))))))

(assert (=> b!554527 (= lt!251755 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554528 () Bool)

(declare-fun res!347079 () Bool)

(assert (=> b!554528 (=> (not res!347079) (not e!319677))))

(assert (=> b!554528 (= res!347079 (validKeyInArray!0 k0!1914))))

(declare-fun b!554530 () Bool)

(declare-fun res!347082 () Bool)

(assert (=> b!554530 (=> (not res!347082) (not e!319677))))

(assert (=> b!554530 (= res!347082 (and (= (size!17149 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17149 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17149 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!347080 () Bool)

(assert (=> start!50714 (=> (not res!347080) (not e!319677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50714 (= res!347080 (validMask!0 mask!3119))))

(assert (=> start!50714 e!319677))

(assert (=> start!50714 true))

(declare-fun array_inv!12667 (array!34948) Bool)

(assert (=> start!50714 (array_inv!12667 a!3118)))

(declare-fun b!554529 () Bool)

(assert (=> b!554529 (= e!319676 e!319675)))

(declare-fun res!347081 () Bool)

(assert (=> b!554529 (=> (not res!347081) (not e!319675))))

(declare-fun lt!251754 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34948 (_ BitVec 32)) SeekEntryResult!5230)

(assert (=> b!554529 (= res!347081 (= lt!251750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251754 (select (store (arr!16784 a!3118) i!1132 k0!1914) j!142) (array!34949 (store (arr!16784 a!3118) i!1132 k0!1914) (size!17149 a!3118)) mask!3119)))))

(declare-fun lt!251751 () (_ BitVec 32))

(assert (=> b!554529 (= lt!251750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251751 (select (arr!16784 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554529 (= lt!251754 (toIndex!0 (select (store (arr!16784 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554529 (= lt!251751 (toIndex!0 (select (arr!16784 a!3118) j!142) mask!3119))))

(assert (= (and start!50714 res!347080) b!554530))

(assert (= (and b!554530 res!347082) b!554523))

(assert (= (and b!554523 res!347076) b!554528))

(assert (= (and b!554528 res!347079) b!554524))

(assert (= (and b!554524 res!347078) b!554527))

(assert (= (and b!554527 res!347084) b!554525))

(assert (= (and b!554525 res!347083) b!554526))

(assert (= (and b!554526 res!347077) b!554529))

(assert (= (and b!554529 res!347081) b!554522))

(declare-fun m!531443 () Bool)

(assert (=> start!50714 m!531443))

(declare-fun m!531445 () Bool)

(assert (=> start!50714 m!531445))

(declare-fun m!531447 () Bool)

(assert (=> b!554522 m!531447))

(declare-fun m!531449 () Bool)

(assert (=> b!554522 m!531449))

(declare-fun m!531451 () Bool)

(assert (=> b!554522 m!531451))

(declare-fun m!531453 () Bool)

(assert (=> b!554522 m!531453))

(assert (=> b!554522 m!531447))

(declare-fun m!531455 () Bool)

(assert (=> b!554522 m!531455))

(declare-fun m!531457 () Bool)

(assert (=> b!554524 m!531457))

(declare-fun m!531459 () Bool)

(assert (=> b!554528 m!531459))

(declare-fun m!531461 () Bool)

(assert (=> b!554527 m!531461))

(declare-fun m!531463 () Bool)

(assert (=> b!554526 m!531463))

(assert (=> b!554523 m!531447))

(assert (=> b!554523 m!531447))

(declare-fun m!531465 () Bool)

(assert (=> b!554523 m!531465))

(declare-fun m!531467 () Bool)

(assert (=> b!554525 m!531467))

(assert (=> b!554529 m!531447))

(declare-fun m!531469 () Bool)

(assert (=> b!554529 m!531469))

(assert (=> b!554529 m!531447))

(declare-fun m!531471 () Bool)

(assert (=> b!554529 m!531471))

(assert (=> b!554529 m!531447))

(declare-fun m!531473 () Bool)

(assert (=> b!554529 m!531473))

(assert (=> b!554529 m!531471))

(declare-fun m!531475 () Bool)

(assert (=> b!554529 m!531475))

(declare-fun m!531477 () Bool)

(assert (=> b!554529 m!531477))

(assert (=> b!554529 m!531471))

(declare-fun m!531479 () Bool)

(assert (=> b!554529 m!531479))

(check-sat (not b!554526) (not b!554523) (not b!554525) (not start!50714) (not b!554529) (not b!554528) (not b!554522) (not b!554527) (not b!554524))
(check-sat)
