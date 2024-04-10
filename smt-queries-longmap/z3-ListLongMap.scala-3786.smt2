; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51892 () Bool)

(assert start!51892)

(declare-fun b!567173 () Bool)

(declare-fun res!357759 () Bool)

(declare-fun e!326414 () Bool)

(assert (=> b!567173 (=> (not res!357759) (not e!326414))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567173 (= res!357759 (validKeyInArray!0 k0!1914))))

(declare-fun b!567174 () Bool)

(declare-fun e!326415 () Bool)

(assert (=> b!567174 (= e!326414 e!326415)))

(declare-fun res!357761 () Bool)

(assert (=> b!567174 (=> (not res!357761) (not e!326415))))

(declare-datatypes ((SeekEntryResult!5538 0))(
  ( (MissingZero!5538 (index!24379 (_ BitVec 32))) (Found!5538 (index!24380 (_ BitVec 32))) (Intermediate!5538 (undefined!6350 Bool) (index!24381 (_ BitVec 32)) (x!53251 (_ BitVec 32))) (Undefined!5538) (MissingVacant!5538 (index!24382 (_ BitVec 32))) )
))
(declare-fun lt!258462 () SeekEntryResult!5538)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567174 (= res!357761 (or (= lt!258462 (MissingZero!5538 i!1132)) (= lt!258462 (MissingVacant!5538 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35586 0))(
  ( (array!35587 (arr!17089 (Array (_ BitVec 32) (_ BitVec 64))) (size!17453 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35586)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35586 (_ BitVec 32)) SeekEntryResult!5538)

(assert (=> b!567174 (= lt!258462 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!357763 () Bool)

(assert (=> start!51892 (=> (not res!357763) (not e!326414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51892 (= res!357763 (validMask!0 mask!3119))))

(assert (=> start!51892 e!326414))

(assert (=> start!51892 true))

(declare-fun array_inv!12885 (array!35586) Bool)

(assert (=> start!51892 (array_inv!12885 a!3118)))

(declare-fun b!567175 () Bool)

(declare-fun res!357760 () Bool)

(assert (=> b!567175 (=> (not res!357760) (not e!326414))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!567175 (= res!357760 (and (= (size!17453 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17453 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17453 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567176 () Bool)

(declare-fun res!357765 () Bool)

(assert (=> b!567176 (=> (not res!357765) (not e!326415))))

(declare-datatypes ((List!11169 0))(
  ( (Nil!11166) (Cons!11165 (h!12177 (_ BitVec 64)) (t!17397 List!11169)) )
))
(declare-fun arrayNoDuplicates!0 (array!35586 (_ BitVec 32) List!11169) Bool)

(assert (=> b!567176 (= res!357765 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11166))))

(declare-fun b!567177 () Bool)

(declare-fun e!326413 () Bool)

(assert (=> b!567177 (= e!326413 (= (seekEntryOrOpen!0 (select (arr!17089 a!3118) j!142) a!3118 mask!3119) (Found!5538 j!142)))))

(declare-fun b!567178 () Bool)

(declare-fun res!357764 () Bool)

(assert (=> b!567178 (=> (not res!357764) (not e!326415))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35586 (_ BitVec 32)) SeekEntryResult!5538)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567178 (= res!357764 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17089 a!3118) j!142) mask!3119) (select (arr!17089 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17089 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17089 a!3118) i!1132 k0!1914) j!142) (array!35587 (store (arr!17089 a!3118) i!1132 k0!1914) (size!17453 a!3118)) mask!3119)))))

(declare-fun b!567179 () Bool)

(declare-fun res!357766 () Bool)

(assert (=> b!567179 (=> (not res!357766) (not e!326414))))

(declare-fun arrayContainsKey!0 (array!35586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567179 (= res!357766 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567180 () Bool)

(assert (=> b!567180 (= e!326415 (not true))))

(assert (=> b!567180 e!326413))

(declare-fun res!357767 () Bool)

(assert (=> b!567180 (=> (not res!357767) (not e!326413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35586 (_ BitVec 32)) Bool)

(assert (=> b!567180 (= res!357767 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17778 0))(
  ( (Unit!17779) )
))
(declare-fun lt!258463 () Unit!17778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17778)

(assert (=> b!567180 (= lt!258463 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567181 () Bool)

(declare-fun res!357758 () Bool)

(assert (=> b!567181 (=> (not res!357758) (not e!326414))))

(assert (=> b!567181 (= res!357758 (validKeyInArray!0 (select (arr!17089 a!3118) j!142)))))

(declare-fun b!567182 () Bool)

(declare-fun res!357762 () Bool)

(assert (=> b!567182 (=> (not res!357762) (not e!326415))))

(assert (=> b!567182 (= res!357762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51892 res!357763) b!567175))

(assert (= (and b!567175 res!357760) b!567181))

(assert (= (and b!567181 res!357758) b!567173))

(assert (= (and b!567173 res!357759) b!567179))

(assert (= (and b!567179 res!357766) b!567174))

(assert (= (and b!567174 res!357761) b!567182))

(assert (= (and b!567182 res!357762) b!567176))

(assert (= (and b!567176 res!357765) b!567178))

(assert (= (and b!567178 res!357764) b!567180))

(assert (= (and b!567180 res!357767) b!567177))

(declare-fun m!545709 () Bool)

(assert (=> b!567177 m!545709))

(assert (=> b!567177 m!545709))

(declare-fun m!545711 () Bool)

(assert (=> b!567177 m!545711))

(declare-fun m!545713 () Bool)

(assert (=> b!567176 m!545713))

(declare-fun m!545715 () Bool)

(assert (=> start!51892 m!545715))

(declare-fun m!545717 () Bool)

(assert (=> start!51892 m!545717))

(declare-fun m!545719 () Bool)

(assert (=> b!567173 m!545719))

(declare-fun m!545721 () Bool)

(assert (=> b!567174 m!545721))

(declare-fun m!545723 () Bool)

(assert (=> b!567182 m!545723))

(assert (=> b!567181 m!545709))

(assert (=> b!567181 m!545709))

(declare-fun m!545725 () Bool)

(assert (=> b!567181 m!545725))

(assert (=> b!567178 m!545709))

(declare-fun m!545727 () Bool)

(assert (=> b!567178 m!545727))

(assert (=> b!567178 m!545709))

(declare-fun m!545729 () Bool)

(assert (=> b!567178 m!545729))

(declare-fun m!545731 () Bool)

(assert (=> b!567178 m!545731))

(assert (=> b!567178 m!545729))

(declare-fun m!545733 () Bool)

(assert (=> b!567178 m!545733))

(assert (=> b!567178 m!545727))

(assert (=> b!567178 m!545709))

(declare-fun m!545735 () Bool)

(assert (=> b!567178 m!545735))

(declare-fun m!545737 () Bool)

(assert (=> b!567178 m!545737))

(assert (=> b!567178 m!545729))

(assert (=> b!567178 m!545731))

(declare-fun m!545739 () Bool)

(assert (=> b!567180 m!545739))

(declare-fun m!545741 () Bool)

(assert (=> b!567180 m!545741))

(declare-fun m!545743 () Bool)

(assert (=> b!567179 m!545743))

(check-sat (not b!567176) (not b!567173) (not start!51892) (not b!567182) (not b!567178) (not b!567181) (not b!567179) (not b!567177) (not b!567174) (not b!567180))
(check-sat)
