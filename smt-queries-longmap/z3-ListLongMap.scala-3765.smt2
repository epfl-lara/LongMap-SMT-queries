; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51630 () Bool)

(assert start!51630)

(declare-fun res!355716 () Bool)

(declare-fun e!325258 () Bool)

(assert (=> start!51630 (=> (not res!355716) (not e!325258))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51630 (= res!355716 (validMask!0 mask!3119))))

(assert (=> start!51630 e!325258))

(assert (=> start!51630 true))

(declare-datatypes ((array!35442 0))(
  ( (array!35443 (arr!17020 (Array (_ BitVec 32) (_ BitVec 64))) (size!17384 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35442)

(declare-fun array_inv!12879 (array!35442) Bool)

(assert (=> start!51630 (array_inv!12879 a!3118)))

(declare-fun b!564666 () Bool)

(declare-fun res!355719 () Bool)

(assert (=> b!564666 (=> (not res!355719) (not e!325258))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564666 (= res!355719 (validKeyInArray!0 k0!1914))))

(declare-fun b!564667 () Bool)

(declare-fun e!325259 () Bool)

(assert (=> b!564667 (= e!325258 e!325259)))

(declare-fun res!355713 () Bool)

(assert (=> b!564667 (=> (not res!355713) (not e!325259))))

(declare-datatypes ((SeekEntryResult!5425 0))(
  ( (MissingZero!5425 (index!23927 (_ BitVec 32))) (Found!5425 (index!23928 (_ BitVec 32))) (Intermediate!5425 (undefined!6237 Bool) (index!23929 (_ BitVec 32)) (x!52955 (_ BitVec 32))) (Undefined!5425) (MissingVacant!5425 (index!23930 (_ BitVec 32))) )
))
(declare-fun lt!257650 () SeekEntryResult!5425)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564667 (= res!355713 (or (= lt!257650 (MissingZero!5425 i!1132)) (= lt!257650 (MissingVacant!5425 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35442 (_ BitVec 32)) SeekEntryResult!5425)

(assert (=> b!564667 (= lt!257650 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564668 () Bool)

(declare-fun res!355714 () Bool)

(assert (=> b!564668 (=> (not res!355714) (not e!325259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35442 (_ BitVec 32)) Bool)

(assert (=> b!564668 (= res!355714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564669 () Bool)

(declare-fun res!355717 () Bool)

(assert (=> b!564669 (=> (not res!355717) (not e!325258))))

(declare-fun arrayContainsKey!0 (array!35442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564669 (= res!355717 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564670 () Bool)

(declare-fun res!355720 () Bool)

(assert (=> b!564670 (=> (not res!355720) (not e!325259))))

(declare-datatypes ((List!11007 0))(
  ( (Nil!11004) (Cons!11003 (h!12009 (_ BitVec 64)) (t!17227 List!11007)) )
))
(declare-fun arrayNoDuplicates!0 (array!35442 (_ BitVec 32) List!11007) Bool)

(assert (=> b!564670 (= res!355720 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11004))))

(declare-fun b!564671 () Bool)

(declare-fun res!355715 () Bool)

(assert (=> b!564671 (=> (not res!355715) (not e!325258))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564671 (= res!355715 (validKeyInArray!0 (select (arr!17020 a!3118) j!142)))))

(declare-fun b!564672 () Bool)

(declare-fun res!355718 () Bool)

(assert (=> b!564672 (=> (not res!355718) (not e!325258))))

(assert (=> b!564672 (= res!355718 (and (= (size!17384 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17384 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17384 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564673 () Bool)

(assert (=> b!564673 (= e!325259 false)))

(declare-fun lt!257649 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564673 (= lt!257649 (toIndex!0 (select (store (arr!17020 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (= (and start!51630 res!355716) b!564672))

(assert (= (and b!564672 res!355718) b!564671))

(assert (= (and b!564671 res!355715) b!564666))

(assert (= (and b!564666 res!355719) b!564669))

(assert (= (and b!564669 res!355717) b!564667))

(assert (= (and b!564667 res!355713) b!564668))

(assert (= (and b!564668 res!355714) b!564670))

(assert (= (and b!564670 res!355720) b!564673))

(declare-fun m!543227 () Bool)

(assert (=> start!51630 m!543227))

(declare-fun m!543229 () Bool)

(assert (=> start!51630 m!543229))

(declare-fun m!543231 () Bool)

(assert (=> b!564671 m!543231))

(assert (=> b!564671 m!543231))

(declare-fun m!543233 () Bool)

(assert (=> b!564671 m!543233))

(declare-fun m!543235 () Bool)

(assert (=> b!564669 m!543235))

(declare-fun m!543237 () Bool)

(assert (=> b!564668 m!543237))

(declare-fun m!543239 () Bool)

(assert (=> b!564670 m!543239))

(declare-fun m!543241 () Bool)

(assert (=> b!564673 m!543241))

(declare-fun m!543243 () Bool)

(assert (=> b!564673 m!543243))

(assert (=> b!564673 m!543243))

(declare-fun m!543245 () Bool)

(assert (=> b!564673 m!543245))

(declare-fun m!543247 () Bool)

(assert (=> b!564667 m!543247))

(declare-fun m!543249 () Bool)

(assert (=> b!564666 m!543249))

(check-sat (not b!564668) (not b!564669) (not b!564673) (not b!564671) (not b!564667) (not b!564666) (not b!564670) (not start!51630))
(check-sat)
