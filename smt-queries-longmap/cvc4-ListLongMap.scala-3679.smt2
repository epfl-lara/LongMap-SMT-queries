; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50694 () Bool)

(assert start!50694)

(declare-fun b!554343 () Bool)

(declare-fun res!346754 () Bool)

(declare-fun e!319656 () Bool)

(assert (=> b!554343 (=> (not res!346754) (not e!319656))))

(declare-datatypes ((array!34919 0))(
  ( (array!34920 (arr!16769 (Array (_ BitVec 32) (_ BitVec 64))) (size!17133 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34919)

(declare-datatypes ((List!10849 0))(
  ( (Nil!10846) (Cons!10845 (h!11830 (_ BitVec 64)) (t!17077 List!10849)) )
))
(declare-fun arrayNoDuplicates!0 (array!34919 (_ BitVec 32) List!10849) Bool)

(assert (=> b!554343 (= res!346754 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10846))))

(declare-fun b!554344 () Bool)

(declare-fun res!346762 () Bool)

(declare-fun e!319657 () Bool)

(assert (=> b!554344 (=> (not res!346762) (not e!319657))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554344 (= res!346762 (validKeyInArray!0 k!1914))))

(declare-fun b!554345 () Bool)

(assert (=> b!554345 (= e!319657 e!319656)))

(declare-fun res!346756 () Bool)

(assert (=> b!554345 (=> (not res!346756) (not e!319656))))

(declare-datatypes ((SeekEntryResult!5218 0))(
  ( (MissingZero!5218 (index!23099 (_ BitVec 32))) (Found!5218 (index!23100 (_ BitVec 32))) (Intermediate!5218 (undefined!6030 Bool) (index!23101 (_ BitVec 32)) (x!52012 (_ BitVec 32))) (Undefined!5218) (MissingVacant!5218 (index!23102 (_ BitVec 32))) )
))
(declare-fun lt!251773 () SeekEntryResult!5218)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554345 (= res!346756 (or (= lt!251773 (MissingZero!5218 i!1132)) (= lt!251773 (MissingVacant!5218 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34919 (_ BitVec 32)) SeekEntryResult!5218)

(assert (=> b!554345 (= lt!251773 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554346 () Bool)

(declare-fun lt!251770 () SeekEntryResult!5218)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!319659 () Bool)

(assert (=> b!554346 (= e!319659 (not (or (not (is-Intermediate!5218 lt!251770)) (undefined!6030 lt!251770) (= (select (arr!16769 a!3118) (index!23101 lt!251770)) (select (arr!16769 a!3118) j!142)) (not (= (select (arr!16769 a!3118) (index!23101 lt!251770)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319658 () Bool)

(assert (=> b!554346 e!319658))

(declare-fun res!346761 () Bool)

(assert (=> b!554346 (=> (not res!346761) (not e!319658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34919 (_ BitVec 32)) Bool)

(assert (=> b!554346 (= res!346761 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17210 0))(
  ( (Unit!17211) )
))
(declare-fun lt!251769 () Unit!17210)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17210)

(assert (=> b!554346 (= lt!251769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554347 () Bool)

(declare-fun res!346760 () Bool)

(assert (=> b!554347 (=> (not res!346760) (not e!319657))))

(declare-fun arrayContainsKey!0 (array!34919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554347 (= res!346760 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554348 () Bool)

(declare-fun res!346763 () Bool)

(assert (=> b!554348 (=> (not res!346763) (not e!319657))))

(assert (=> b!554348 (= res!346763 (and (= (size!17133 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17133 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17133 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554349 () Bool)

(declare-fun res!346755 () Bool)

(assert (=> b!554349 (=> (not res!346755) (not e!319656))))

(assert (=> b!554349 (= res!346755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554342 () Bool)

(declare-fun res!346758 () Bool)

(assert (=> b!554342 (=> (not res!346758) (not e!319657))))

(assert (=> b!554342 (= res!346758 (validKeyInArray!0 (select (arr!16769 a!3118) j!142)))))

(declare-fun res!346759 () Bool)

(assert (=> start!50694 (=> (not res!346759) (not e!319657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50694 (= res!346759 (validMask!0 mask!3119))))

(assert (=> start!50694 e!319657))

(assert (=> start!50694 true))

(declare-fun array_inv!12565 (array!34919) Bool)

(assert (=> start!50694 (array_inv!12565 a!3118)))

(declare-fun b!554350 () Bool)

(assert (=> b!554350 (= e!319658 (= (seekEntryOrOpen!0 (select (arr!16769 a!3118) j!142) a!3118 mask!3119) (Found!5218 j!142)))))

(declare-fun b!554351 () Bool)

(assert (=> b!554351 (= e!319656 e!319659)))

(declare-fun res!346757 () Bool)

(assert (=> b!554351 (=> (not res!346757) (not e!319659))))

(declare-fun lt!251771 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34919 (_ BitVec 32)) SeekEntryResult!5218)

(assert (=> b!554351 (= res!346757 (= lt!251770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251771 (select (store (arr!16769 a!3118) i!1132 k!1914) j!142) (array!34920 (store (arr!16769 a!3118) i!1132 k!1914) (size!17133 a!3118)) mask!3119)))))

(declare-fun lt!251772 () (_ BitVec 32))

(assert (=> b!554351 (= lt!251770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251772 (select (arr!16769 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554351 (= lt!251771 (toIndex!0 (select (store (arr!16769 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554351 (= lt!251772 (toIndex!0 (select (arr!16769 a!3118) j!142) mask!3119))))

(assert (= (and start!50694 res!346759) b!554348))

(assert (= (and b!554348 res!346763) b!554342))

(assert (= (and b!554342 res!346758) b!554344))

(assert (= (and b!554344 res!346762) b!554347))

(assert (= (and b!554347 res!346760) b!554345))

(assert (= (and b!554345 res!346756) b!554349))

(assert (= (and b!554349 res!346755) b!554343))

(assert (= (and b!554343 res!346754) b!554351))

(assert (= (and b!554351 res!346757) b!554346))

(assert (= (and b!554346 res!346761) b!554350))

(declare-fun m!531619 () Bool)

(assert (=> b!554347 m!531619))

(declare-fun m!531621 () Bool)

(assert (=> start!50694 m!531621))

(declare-fun m!531623 () Bool)

(assert (=> start!50694 m!531623))

(declare-fun m!531625 () Bool)

(assert (=> b!554349 m!531625))

(declare-fun m!531627 () Bool)

(assert (=> b!554343 m!531627))

(declare-fun m!531629 () Bool)

(assert (=> b!554350 m!531629))

(assert (=> b!554350 m!531629))

(declare-fun m!531631 () Bool)

(assert (=> b!554350 m!531631))

(assert (=> b!554342 m!531629))

(assert (=> b!554342 m!531629))

(declare-fun m!531633 () Bool)

(assert (=> b!554342 m!531633))

(declare-fun m!531635 () Bool)

(assert (=> b!554346 m!531635))

(assert (=> b!554346 m!531629))

(declare-fun m!531637 () Bool)

(assert (=> b!554346 m!531637))

(declare-fun m!531639 () Bool)

(assert (=> b!554346 m!531639))

(declare-fun m!531641 () Bool)

(assert (=> b!554345 m!531641))

(assert (=> b!554351 m!531629))

(declare-fun m!531643 () Bool)

(assert (=> b!554351 m!531643))

(assert (=> b!554351 m!531629))

(declare-fun m!531645 () Bool)

(assert (=> b!554351 m!531645))

(declare-fun m!531647 () Bool)

(assert (=> b!554351 m!531647))

(assert (=> b!554351 m!531629))

(declare-fun m!531649 () Bool)

(assert (=> b!554351 m!531649))

(assert (=> b!554351 m!531645))

(declare-fun m!531651 () Bool)

(assert (=> b!554351 m!531651))

(assert (=> b!554351 m!531645))

(declare-fun m!531653 () Bool)

(assert (=> b!554351 m!531653))

(declare-fun m!531655 () Bool)

(assert (=> b!554344 m!531655))

(push 1)

(assert (not b!554344))

