; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52396 () Bool)

(assert start!52396)

(declare-fun b!571685 () Bool)

(declare-fun e!328818 () Bool)

(declare-fun e!328815 () Bool)

(assert (=> b!571685 (= e!328818 e!328815)))

(declare-fun res!361201 () Bool)

(assert (=> b!571685 (=> res!361201 e!328815)))

(declare-fun lt!260718 () (_ BitVec 64))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35793 0))(
  ( (array!35794 (arr!17185 (Array (_ BitVec 32) (_ BitVec 64))) (size!17549 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35793)

(assert (=> b!571685 (= res!361201 (or (= lt!260718 (select (arr!17185 a!3118) j!142)) (= lt!260718 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5634 0))(
  ( (MissingZero!5634 (index!24763 (_ BitVec 32))) (Found!5634 (index!24764 (_ BitVec 32))) (Intermediate!5634 (undefined!6446 Bool) (index!24765 (_ BitVec 32)) (x!53639 (_ BitVec 32))) (Undefined!5634) (MissingVacant!5634 (index!24766 (_ BitVec 32))) )
))
(declare-fun lt!260720 () SeekEntryResult!5634)

(assert (=> b!571685 (= lt!260718 (select (arr!17185 a!3118) (index!24765 lt!260720)))))

(declare-fun b!571686 () Bool)

(declare-fun res!361199 () Bool)

(declare-fun e!328811 () Bool)

(assert (=> b!571686 (=> (not res!361199) (not e!328811))))

(declare-datatypes ((List!11265 0))(
  ( (Nil!11262) (Cons!11261 (h!12288 (_ BitVec 64)) (t!17493 List!11265)) )
))
(declare-fun arrayNoDuplicates!0 (array!35793 (_ BitVec 32) List!11265) Bool)

(assert (=> b!571686 (= res!361199 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11262))))

(declare-fun lt!260722 () (_ BitVec 64))

(declare-fun b!571687 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260715 () array!35793)

(declare-fun e!328813 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35793 (_ BitVec 32)) SeekEntryResult!5634)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35793 (_ BitVec 32)) SeekEntryResult!5634)

(assert (=> b!571687 (= e!328813 (= (seekEntryOrOpen!0 lt!260722 lt!260715 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53639 lt!260720) (index!24765 lt!260720) (index!24765 lt!260720) lt!260722 lt!260715 mask!3119)))))

(declare-fun b!571688 () Bool)

(declare-fun e!328817 () Bool)

(assert (=> b!571688 (= e!328817 e!328811)))

(declare-fun res!361196 () Bool)

(assert (=> b!571688 (=> (not res!361196) (not e!328811))))

(declare-fun lt!260717 () SeekEntryResult!5634)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571688 (= res!361196 (or (= lt!260717 (MissingZero!5634 i!1132)) (= lt!260717 (MissingVacant!5634 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!571688 (= lt!260717 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571690 () Bool)

(declare-fun e!328816 () Bool)

(assert (=> b!571690 (= e!328811 e!328816)))

(declare-fun res!361197 () Bool)

(assert (=> b!571690 (=> (not res!361197) (not e!328816))))

(declare-fun lt!260719 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35793 (_ BitVec 32)) SeekEntryResult!5634)

(assert (=> b!571690 (= res!361197 (= lt!260720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260719 lt!260722 lt!260715 mask!3119)))))

(declare-fun lt!260716 () (_ BitVec 32))

(assert (=> b!571690 (= lt!260720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260716 (select (arr!17185 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571690 (= lt!260719 (toIndex!0 lt!260722 mask!3119))))

(assert (=> b!571690 (= lt!260722 (select (store (arr!17185 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571690 (= lt!260716 (toIndex!0 (select (arr!17185 a!3118) j!142) mask!3119))))

(assert (=> b!571690 (= lt!260715 (array!35794 (store (arr!17185 a!3118) i!1132 k0!1914) (size!17549 a!3118)))))

(declare-fun b!571691 () Bool)

(assert (=> b!571691 (= e!328816 (not true))))

(declare-fun e!328814 () Bool)

(assert (=> b!571691 e!328814))

(declare-fun res!361193 () Bool)

(assert (=> b!571691 (=> (not res!361193) (not e!328814))))

(declare-fun lt!260721 () SeekEntryResult!5634)

(assert (=> b!571691 (= res!361193 (= lt!260721 (Found!5634 j!142)))))

(assert (=> b!571691 (= lt!260721 (seekEntryOrOpen!0 (select (arr!17185 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35793 (_ BitVec 32)) Bool)

(assert (=> b!571691 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17970 0))(
  ( (Unit!17971) )
))
(declare-fun lt!260714 () Unit!17970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17970)

(assert (=> b!571691 (= lt!260714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571692 () Bool)

(declare-fun res!361194 () Bool)

(assert (=> b!571692 (=> (not res!361194) (not e!328817))))

(assert (=> b!571692 (= res!361194 (and (= (size!17549 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17549 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17549 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571693 () Bool)

(declare-fun res!361195 () Bool)

(assert (=> b!571693 (=> (not res!361195) (not e!328817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571693 (= res!361195 (validKeyInArray!0 k0!1914))))

(declare-fun b!571694 () Bool)

(assert (=> b!571694 (= e!328815 e!328813)))

(declare-fun res!361202 () Bool)

(assert (=> b!571694 (=> (not res!361202) (not e!328813))))

(assert (=> b!571694 (= res!361202 (= lt!260721 (seekKeyOrZeroReturnVacant!0 (x!53639 lt!260720) (index!24765 lt!260720) (index!24765 lt!260720) (select (arr!17185 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571695 () Bool)

(declare-fun res!361200 () Bool)

(assert (=> b!571695 (=> (not res!361200) (not e!328817))))

(assert (=> b!571695 (= res!361200 (validKeyInArray!0 (select (arr!17185 a!3118) j!142)))))

(declare-fun res!361198 () Bool)

(assert (=> start!52396 (=> (not res!361198) (not e!328817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52396 (= res!361198 (validMask!0 mask!3119))))

(assert (=> start!52396 e!328817))

(assert (=> start!52396 true))

(declare-fun array_inv!12981 (array!35793) Bool)

(assert (=> start!52396 (array_inv!12981 a!3118)))

(declare-fun b!571689 () Bool)

(declare-fun res!361204 () Bool)

(assert (=> b!571689 (=> (not res!361204) (not e!328817))))

(declare-fun arrayContainsKey!0 (array!35793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571689 (= res!361204 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571696 () Bool)

(declare-fun res!361203 () Bool)

(assert (=> b!571696 (=> (not res!361203) (not e!328811))))

(assert (=> b!571696 (= res!361203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571697 () Bool)

(assert (=> b!571697 (= e!328814 e!328818)))

(declare-fun res!361205 () Bool)

(assert (=> b!571697 (=> res!361205 e!328818)))

(get-info :version)

(assert (=> b!571697 (= res!361205 (or (undefined!6446 lt!260720) (not ((_ is Intermediate!5634) lt!260720))))))

(assert (= (and start!52396 res!361198) b!571692))

(assert (= (and b!571692 res!361194) b!571695))

(assert (= (and b!571695 res!361200) b!571693))

(assert (= (and b!571693 res!361195) b!571689))

(assert (= (and b!571689 res!361204) b!571688))

(assert (= (and b!571688 res!361196) b!571696))

(assert (= (and b!571696 res!361203) b!571686))

(assert (= (and b!571686 res!361199) b!571690))

(assert (= (and b!571690 res!361197) b!571691))

(assert (= (and b!571691 res!361193) b!571697))

(assert (= (and b!571697 (not res!361205)) b!571685))

(assert (= (and b!571685 (not res!361201)) b!571694))

(assert (= (and b!571694 res!361202) b!571687))

(declare-fun m!550565 () Bool)

(assert (=> b!571695 m!550565))

(assert (=> b!571695 m!550565))

(declare-fun m!550567 () Bool)

(assert (=> b!571695 m!550567))

(declare-fun m!550569 () Bool)

(assert (=> b!571687 m!550569))

(declare-fun m!550571 () Bool)

(assert (=> b!571687 m!550571))

(declare-fun m!550573 () Bool)

(assert (=> start!52396 m!550573))

(declare-fun m!550575 () Bool)

(assert (=> start!52396 m!550575))

(declare-fun m!550577 () Bool)

(assert (=> b!571696 m!550577))

(declare-fun m!550579 () Bool)

(assert (=> b!571688 m!550579))

(declare-fun m!550581 () Bool)

(assert (=> b!571686 m!550581))

(declare-fun m!550583 () Bool)

(assert (=> b!571689 m!550583))

(declare-fun m!550585 () Bool)

(assert (=> b!571693 m!550585))

(assert (=> b!571694 m!550565))

(assert (=> b!571694 m!550565))

(declare-fun m!550587 () Bool)

(assert (=> b!571694 m!550587))

(assert (=> b!571691 m!550565))

(assert (=> b!571691 m!550565))

(declare-fun m!550589 () Bool)

(assert (=> b!571691 m!550589))

(declare-fun m!550591 () Bool)

(assert (=> b!571691 m!550591))

(declare-fun m!550593 () Bool)

(assert (=> b!571691 m!550593))

(declare-fun m!550595 () Bool)

(assert (=> b!571690 m!550595))

(assert (=> b!571690 m!550565))

(declare-fun m!550597 () Bool)

(assert (=> b!571690 m!550597))

(assert (=> b!571690 m!550565))

(declare-fun m!550599 () Bool)

(assert (=> b!571690 m!550599))

(declare-fun m!550601 () Bool)

(assert (=> b!571690 m!550601))

(declare-fun m!550603 () Bool)

(assert (=> b!571690 m!550603))

(assert (=> b!571690 m!550565))

(declare-fun m!550605 () Bool)

(assert (=> b!571690 m!550605))

(assert (=> b!571685 m!550565))

(declare-fun m!550607 () Bool)

(assert (=> b!571685 m!550607))

(check-sat (not b!571687) (not b!571689) (not b!571688) (not b!571690) (not b!571693) (not b!571691) (not b!571686) (not b!571694) (not b!571695) (not b!571696) (not start!52396))
(check-sat)
