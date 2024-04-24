; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51666 () Bool)

(assert start!51666)

(declare-fun b!565118 () Bool)

(declare-fun res!356168 () Bool)

(declare-fun e!325420 () Bool)

(assert (=> b!565118 (=> (not res!356168) (not e!325420))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35478 0))(
  ( (array!35479 (arr!17038 (Array (_ BitVec 32) (_ BitVec 64))) (size!17402 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35478)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5443 0))(
  ( (MissingZero!5443 (index!23999 (_ BitVec 32))) (Found!5443 (index!24000 (_ BitVec 32))) (Intermediate!5443 (undefined!6255 Bool) (index!24001 (_ BitVec 32)) (x!53021 (_ BitVec 32))) (Undefined!5443) (MissingVacant!5443 (index!24002 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35478 (_ BitVec 32)) SeekEntryResult!5443)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565118 (= res!356168 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17038 a!3118) j!142) mask!3119) (select (arr!17038 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17038 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17038 a!3118) i!1132 k0!1914) j!142) (array!35479 (store (arr!17038 a!3118) i!1132 k0!1914) (size!17402 a!3118)) mask!3119)))))

(declare-fun b!565119 () Bool)

(declare-fun res!356169 () Bool)

(declare-fun e!325422 () Bool)

(assert (=> b!565119 (=> (not res!356169) (not e!325422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565119 (= res!356169 (validKeyInArray!0 (select (arr!17038 a!3118) j!142)))))

(declare-fun res!356171 () Bool)

(assert (=> start!51666 (=> (not res!356171) (not e!325422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51666 (= res!356171 (validMask!0 mask!3119))))

(assert (=> start!51666 e!325422))

(assert (=> start!51666 true))

(declare-fun array_inv!12897 (array!35478) Bool)

(assert (=> start!51666 (array_inv!12897 a!3118)))

(declare-fun b!565120 () Bool)

(assert (=> b!565120 (= e!325420 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35478 (_ BitVec 32)) Bool)

(assert (=> b!565120 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17659 0))(
  ( (Unit!17660) )
))
(declare-fun lt!257820 () Unit!17659)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17659)

(assert (=> b!565120 (= lt!257820 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565121 () Bool)

(declare-fun res!356166 () Bool)

(assert (=> b!565121 (=> (not res!356166) (not e!325422))))

(assert (=> b!565121 (= res!356166 (and (= (size!17402 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17402 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17402 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565122 () Bool)

(declare-fun res!356167 () Bool)

(assert (=> b!565122 (=> (not res!356167) (not e!325420))))

(assert (=> b!565122 (= res!356167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565123 () Bool)

(declare-fun res!356172 () Bool)

(assert (=> b!565123 (=> (not res!356172) (not e!325422))))

(assert (=> b!565123 (= res!356172 (validKeyInArray!0 k0!1914))))

(declare-fun b!565124 () Bool)

(declare-fun res!356170 () Bool)

(assert (=> b!565124 (=> (not res!356170) (not e!325422))))

(declare-fun arrayContainsKey!0 (array!35478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565124 (= res!356170 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565125 () Bool)

(declare-fun res!356173 () Bool)

(assert (=> b!565125 (=> (not res!356173) (not e!325420))))

(declare-datatypes ((List!11025 0))(
  ( (Nil!11022) (Cons!11021 (h!12027 (_ BitVec 64)) (t!17245 List!11025)) )
))
(declare-fun arrayNoDuplicates!0 (array!35478 (_ BitVec 32) List!11025) Bool)

(assert (=> b!565125 (= res!356173 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11022))))

(declare-fun b!565126 () Bool)

(assert (=> b!565126 (= e!325422 e!325420)))

(declare-fun res!356165 () Bool)

(assert (=> b!565126 (=> (not res!356165) (not e!325420))))

(declare-fun lt!257821 () SeekEntryResult!5443)

(assert (=> b!565126 (= res!356165 (or (= lt!257821 (MissingZero!5443 i!1132)) (= lt!257821 (MissingVacant!5443 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35478 (_ BitVec 32)) SeekEntryResult!5443)

(assert (=> b!565126 (= lt!257821 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51666 res!356171) b!565121))

(assert (= (and b!565121 res!356166) b!565119))

(assert (= (and b!565119 res!356169) b!565123))

(assert (= (and b!565123 res!356172) b!565124))

(assert (= (and b!565124 res!356170) b!565126))

(assert (= (and b!565126 res!356165) b!565122))

(assert (= (and b!565122 res!356167) b!565125))

(assert (= (and b!565125 res!356173) b!565118))

(assert (= (and b!565118 res!356168) b!565120))

(declare-fun m!543749 () Bool)

(assert (=> b!565125 m!543749))

(declare-fun m!543751 () Bool)

(assert (=> b!565122 m!543751))

(declare-fun m!543753 () Bool)

(assert (=> b!565124 m!543753))

(declare-fun m!543755 () Bool)

(assert (=> b!565120 m!543755))

(declare-fun m!543757 () Bool)

(assert (=> b!565120 m!543757))

(declare-fun m!543759 () Bool)

(assert (=> b!565123 m!543759))

(declare-fun m!543761 () Bool)

(assert (=> b!565119 m!543761))

(assert (=> b!565119 m!543761))

(declare-fun m!543763 () Bool)

(assert (=> b!565119 m!543763))

(assert (=> b!565118 m!543761))

(declare-fun m!543765 () Bool)

(assert (=> b!565118 m!543765))

(assert (=> b!565118 m!543761))

(declare-fun m!543767 () Bool)

(assert (=> b!565118 m!543767))

(declare-fun m!543769 () Bool)

(assert (=> b!565118 m!543769))

(assert (=> b!565118 m!543767))

(declare-fun m!543771 () Bool)

(assert (=> b!565118 m!543771))

(assert (=> b!565118 m!543765))

(assert (=> b!565118 m!543761))

(declare-fun m!543773 () Bool)

(assert (=> b!565118 m!543773))

(declare-fun m!543775 () Bool)

(assert (=> b!565118 m!543775))

(assert (=> b!565118 m!543767))

(assert (=> b!565118 m!543769))

(declare-fun m!543777 () Bool)

(assert (=> b!565126 m!543777))

(declare-fun m!543779 () Bool)

(assert (=> start!51666 m!543779))

(declare-fun m!543781 () Bool)

(assert (=> start!51666 m!543781))

(check-sat (not b!565126) (not b!565122) (not b!565124) (not b!565119) (not b!565123) (not b!565120) (not start!51666) (not b!565125) (not b!565118))
(check-sat)
