; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50720 () Bool)

(assert start!50720)

(declare-fun b!554603 () Bool)

(declare-fun res!347162 () Bool)

(declare-fun e!319712 () Bool)

(assert (=> b!554603 (=> (not res!347162) (not e!319712))))

(declare-datatypes ((array!34954 0))(
  ( (array!34955 (arr!16787 (Array (_ BitVec 32) (_ BitVec 64))) (size!17152 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34954)

(declare-datatypes ((List!10906 0))(
  ( (Nil!10903) (Cons!10902 (h!11887 (_ BitVec 64)) (t!17125 List!10906)) )
))
(declare-fun arrayNoDuplicates!0 (array!34954 (_ BitVec 32) List!10906) Bool)

(assert (=> b!554603 (= res!347162 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10903))))

(declare-fun b!554604 () Bool)

(declare-fun res!347158 () Bool)

(declare-fun e!319710 () Bool)

(assert (=> b!554604 (=> (not res!347158) (not e!319710))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554604 (= res!347158 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554605 () Bool)

(declare-fun res!347163 () Bool)

(assert (=> b!554605 (=> (not res!347163) (not e!319710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554605 (= res!347163 (validKeyInArray!0 k0!1914))))

(declare-fun b!554606 () Bool)

(declare-fun res!347165 () Bool)

(assert (=> b!554606 (=> (not res!347165) (not e!319710))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554606 (= res!347165 (and (= (size!17152 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17152 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17152 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!347164 () Bool)

(assert (=> start!50720 (=> (not res!347164) (not e!319710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50720 (= res!347164 (validMask!0 mask!3119))))

(assert (=> start!50720 e!319710))

(assert (=> start!50720 true))

(declare-fun array_inv!12670 (array!34954) Bool)

(assert (=> start!50720 (array_inv!12670 a!3118)))

(declare-fun b!554607 () Bool)

(declare-fun res!347157 () Bool)

(assert (=> b!554607 (=> (not res!347157) (not e!319712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34954 (_ BitVec 32)) Bool)

(assert (=> b!554607 (= res!347157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554608 () Bool)

(declare-fun e!319711 () Bool)

(assert (=> b!554608 (= e!319712 e!319711)))

(declare-fun res!347159 () Bool)

(assert (=> b!554608 (=> (not res!347159) (not e!319711))))

(declare-fun lt!251805 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5233 0))(
  ( (MissingZero!5233 (index!23159 (_ BitVec 32))) (Found!5233 (index!23160 (_ BitVec 32))) (Intermediate!5233 (undefined!6045 Bool) (index!23161 (_ BitVec 32)) (x!52078 (_ BitVec 32))) (Undefined!5233) (MissingVacant!5233 (index!23162 (_ BitVec 32))) )
))
(declare-fun lt!251804 () SeekEntryResult!5233)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34954 (_ BitVec 32)) SeekEntryResult!5233)

(assert (=> b!554608 (= res!347159 (= lt!251804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251805 (select (store (arr!16787 a!3118) i!1132 k0!1914) j!142) (array!34955 (store (arr!16787 a!3118) i!1132 k0!1914) (size!17152 a!3118)) mask!3119)))))

(declare-fun lt!251809 () (_ BitVec 32))

(assert (=> b!554608 (= lt!251804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251809 (select (arr!16787 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554608 (= lt!251805 (toIndex!0 (select (store (arr!16787 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554608 (= lt!251809 (toIndex!0 (select (arr!16787 a!3118) j!142) mask!3119))))

(declare-fun b!554609 () Bool)

(declare-fun res!347160 () Bool)

(assert (=> b!554609 (=> (not res!347160) (not e!319710))))

(assert (=> b!554609 (= res!347160 (validKeyInArray!0 (select (arr!16787 a!3118) j!142)))))

(declare-fun b!554610 () Bool)

(assert (=> b!554610 (= e!319710 e!319712)))

(declare-fun res!347161 () Bool)

(assert (=> b!554610 (=> (not res!347161) (not e!319712))))

(declare-fun lt!251806 () SeekEntryResult!5233)

(assert (=> b!554610 (= res!347161 (or (= lt!251806 (MissingZero!5233 i!1132)) (= lt!251806 (MissingVacant!5233 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34954 (_ BitVec 32)) SeekEntryResult!5233)

(assert (=> b!554610 (= lt!251806 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554611 () Bool)

(assert (=> b!554611 (= e!319711 (not true))))

(declare-fun lt!251807 () SeekEntryResult!5233)

(get-info :version)

(assert (=> b!554611 (and (= lt!251807 (Found!5233 j!142)) (or (undefined!6045 lt!251804) (not ((_ is Intermediate!5233) lt!251804)) (= (select (arr!16787 a!3118) (index!23161 lt!251804)) (select (arr!16787 a!3118) j!142)) (not (= (select (arr!16787 a!3118) (index!23161 lt!251804)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251807 (MissingZero!5233 (index!23161 lt!251804)))))))

(assert (=> b!554611 (= lt!251807 (seekEntryOrOpen!0 (select (arr!16787 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554611 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17226 0))(
  ( (Unit!17227) )
))
(declare-fun lt!251808 () Unit!17226)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17226)

(assert (=> b!554611 (= lt!251808 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50720 res!347164) b!554606))

(assert (= (and b!554606 res!347165) b!554609))

(assert (= (and b!554609 res!347160) b!554605))

(assert (= (and b!554605 res!347163) b!554604))

(assert (= (and b!554604 res!347158) b!554610))

(assert (= (and b!554610 res!347161) b!554607))

(assert (= (and b!554607 res!347157) b!554603))

(assert (= (and b!554603 res!347162) b!554608))

(assert (= (and b!554608 res!347159) b!554611))

(declare-fun m!531557 () Bool)

(assert (=> b!554605 m!531557))

(declare-fun m!531559 () Bool)

(assert (=> b!554608 m!531559))

(declare-fun m!531561 () Bool)

(assert (=> b!554608 m!531561))

(assert (=> b!554608 m!531559))

(declare-fun m!531563 () Bool)

(assert (=> b!554608 m!531563))

(declare-fun m!531565 () Bool)

(assert (=> b!554608 m!531565))

(assert (=> b!554608 m!531563))

(declare-fun m!531567 () Bool)

(assert (=> b!554608 m!531567))

(assert (=> b!554608 m!531559))

(declare-fun m!531569 () Bool)

(assert (=> b!554608 m!531569))

(assert (=> b!554608 m!531563))

(declare-fun m!531571 () Bool)

(assert (=> b!554608 m!531571))

(declare-fun m!531573 () Bool)

(assert (=> b!554603 m!531573))

(declare-fun m!531575 () Bool)

(assert (=> b!554604 m!531575))

(declare-fun m!531577 () Bool)

(assert (=> start!50720 m!531577))

(declare-fun m!531579 () Bool)

(assert (=> start!50720 m!531579))

(assert (=> b!554609 m!531559))

(assert (=> b!554609 m!531559))

(declare-fun m!531581 () Bool)

(assert (=> b!554609 m!531581))

(declare-fun m!531583 () Bool)

(assert (=> b!554607 m!531583))

(declare-fun m!531585 () Bool)

(assert (=> b!554611 m!531585))

(assert (=> b!554611 m!531559))

(declare-fun m!531587 () Bool)

(assert (=> b!554611 m!531587))

(declare-fun m!531589 () Bool)

(assert (=> b!554611 m!531589))

(assert (=> b!554611 m!531559))

(declare-fun m!531591 () Bool)

(assert (=> b!554611 m!531591))

(declare-fun m!531593 () Bool)

(assert (=> b!554610 m!531593))

(check-sat (not b!554607) (not b!554609) (not b!554611) (not b!554608) (not b!554604) (not start!50720) (not b!554605) (not b!554603) (not b!554610))
(check-sat)
