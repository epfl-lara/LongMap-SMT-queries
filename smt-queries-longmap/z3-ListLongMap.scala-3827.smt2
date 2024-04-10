; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52450 () Bool)

(assert start!52450)

(declare-fun b!572738 () Bool)

(declare-fun e!329463 () Bool)

(declare-fun e!329465 () Bool)

(assert (=> b!572738 (= e!329463 e!329465)))

(declare-fun res!362253 () Bool)

(assert (=> b!572738 (=> (not res!362253) (not e!329465))))

(declare-datatypes ((SeekEntryResult!5661 0))(
  ( (MissingZero!5661 (index!24871 (_ BitVec 32))) (Found!5661 (index!24872 (_ BitVec 32))) (Intermediate!5661 (undefined!6473 Bool) (index!24873 (_ BitVec 32)) (x!53738 (_ BitVec 32))) (Undefined!5661) (MissingVacant!5661 (index!24874 (_ BitVec 32))) )
))
(declare-fun lt!261445 () SeekEntryResult!5661)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!261451 () SeekEntryResult!5661)

(declare-datatypes ((array!35847 0))(
  ( (array!35848 (arr!17212 (Array (_ BitVec 32) (_ BitVec 64))) (size!17576 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35847)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35847 (_ BitVec 32)) SeekEntryResult!5661)

(assert (=> b!572738 (= res!362253 (= lt!261451 (seekKeyOrZeroReturnVacant!0 (x!53738 lt!261445) (index!24873 lt!261445) (index!24873 lt!261445) (select (arr!17212 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572739 () Bool)

(declare-fun res!362247 () Bool)

(declare-fun e!329466 () Bool)

(assert (=> b!572739 (=> (not res!362247) (not e!329466))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572739 (= res!362247 (validKeyInArray!0 k0!1914))))

(declare-fun b!572740 () Bool)

(declare-fun e!329462 () Bool)

(assert (=> b!572740 (= e!329462 (not true))))

(declare-fun e!329459 () Bool)

(assert (=> b!572740 e!329459))

(declare-fun res!362258 () Bool)

(assert (=> b!572740 (=> (not res!362258) (not e!329459))))

(assert (=> b!572740 (= res!362258 (= lt!261451 (Found!5661 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35847 (_ BitVec 32)) SeekEntryResult!5661)

(assert (=> b!572740 (= lt!261451 (seekEntryOrOpen!0 (select (arr!17212 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35847 (_ BitVec 32)) Bool)

(assert (=> b!572740 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18024 0))(
  ( (Unit!18025) )
))
(declare-fun lt!261446 () Unit!18024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18024)

(assert (=> b!572740 (= lt!261446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572741 () Bool)

(declare-fun res!362252 () Bool)

(assert (=> b!572741 (=> (not res!362252) (not e!329466))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572741 (= res!362252 (and (= (size!17576 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17576 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17576 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572742 () Bool)

(declare-fun e!329461 () Bool)

(assert (=> b!572742 (= e!329461 e!329462)))

(declare-fun res!362246 () Bool)

(assert (=> b!572742 (=> (not res!362246) (not e!329462))))

(declare-fun lt!261444 () (_ BitVec 64))

(declare-fun lt!261443 () (_ BitVec 32))

(declare-fun lt!261448 () array!35847)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35847 (_ BitVec 32)) SeekEntryResult!5661)

(assert (=> b!572742 (= res!362246 (= lt!261445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261443 lt!261444 lt!261448 mask!3119)))))

(declare-fun lt!261450 () (_ BitVec 32))

(assert (=> b!572742 (= lt!261445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261450 (select (arr!17212 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572742 (= lt!261443 (toIndex!0 lt!261444 mask!3119))))

(assert (=> b!572742 (= lt!261444 (select (store (arr!17212 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572742 (= lt!261450 (toIndex!0 (select (arr!17212 a!3118) j!142) mask!3119))))

(assert (=> b!572742 (= lt!261448 (array!35848 (store (arr!17212 a!3118) i!1132 k0!1914) (size!17576 a!3118)))))

(declare-fun b!572743 () Bool)

(declare-fun res!362256 () Bool)

(assert (=> b!572743 (=> (not res!362256) (not e!329466))))

(assert (=> b!572743 (= res!362256 (validKeyInArray!0 (select (arr!17212 a!3118) j!142)))))

(declare-fun b!572744 () Bool)

(declare-fun e!329460 () Bool)

(assert (=> b!572744 (= e!329459 e!329460)))

(declare-fun res!362251 () Bool)

(assert (=> b!572744 (=> res!362251 e!329460)))

(get-info :version)

(assert (=> b!572744 (= res!362251 (or (undefined!6473 lt!261445) (not ((_ is Intermediate!5661) lt!261445))))))

(declare-fun b!572745 () Bool)

(assert (=> b!572745 (= e!329465 (= (seekEntryOrOpen!0 lt!261444 lt!261448 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53738 lt!261445) (index!24873 lt!261445) (index!24873 lt!261445) lt!261444 lt!261448 mask!3119)))))

(declare-fun b!572746 () Bool)

(declare-fun res!362255 () Bool)

(assert (=> b!572746 (=> (not res!362255) (not e!329461))))

(declare-datatypes ((List!11292 0))(
  ( (Nil!11289) (Cons!11288 (h!12315 (_ BitVec 64)) (t!17520 List!11292)) )
))
(declare-fun arrayNoDuplicates!0 (array!35847 (_ BitVec 32) List!11292) Bool)

(assert (=> b!572746 (= res!362255 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11289))))

(declare-fun b!572748 () Bool)

(assert (=> b!572748 (= e!329466 e!329461)))

(declare-fun res!362254 () Bool)

(assert (=> b!572748 (=> (not res!362254) (not e!329461))))

(declare-fun lt!261449 () SeekEntryResult!5661)

(assert (=> b!572748 (= res!362254 (or (= lt!261449 (MissingZero!5661 i!1132)) (= lt!261449 (MissingVacant!5661 i!1132))))))

(assert (=> b!572748 (= lt!261449 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572749 () Bool)

(declare-fun res!362248 () Bool)

(assert (=> b!572749 (=> (not res!362248) (not e!329466))))

(declare-fun arrayContainsKey!0 (array!35847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572749 (= res!362248 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572750 () Bool)

(assert (=> b!572750 (= e!329460 e!329463)))

(declare-fun res!362250 () Bool)

(assert (=> b!572750 (=> res!362250 e!329463)))

(declare-fun lt!261447 () (_ BitVec 64))

(assert (=> b!572750 (= res!362250 (or (= lt!261447 (select (arr!17212 a!3118) j!142)) (= lt!261447 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572750 (= lt!261447 (select (arr!17212 a!3118) (index!24873 lt!261445)))))

(declare-fun res!362257 () Bool)

(assert (=> start!52450 (=> (not res!362257) (not e!329466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52450 (= res!362257 (validMask!0 mask!3119))))

(assert (=> start!52450 e!329466))

(assert (=> start!52450 true))

(declare-fun array_inv!13008 (array!35847) Bool)

(assert (=> start!52450 (array_inv!13008 a!3118)))

(declare-fun b!572747 () Bool)

(declare-fun res!362249 () Bool)

(assert (=> b!572747 (=> (not res!362249) (not e!329461))))

(assert (=> b!572747 (= res!362249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52450 res!362257) b!572741))

(assert (= (and b!572741 res!362252) b!572743))

(assert (= (and b!572743 res!362256) b!572739))

(assert (= (and b!572739 res!362247) b!572749))

(assert (= (and b!572749 res!362248) b!572748))

(assert (= (and b!572748 res!362254) b!572747))

(assert (= (and b!572747 res!362249) b!572746))

(assert (= (and b!572746 res!362255) b!572742))

(assert (= (and b!572742 res!362246) b!572740))

(assert (= (and b!572740 res!362258) b!572744))

(assert (= (and b!572744 (not res!362251)) b!572750))

(assert (= (and b!572750 (not res!362250)) b!572738))

(assert (= (and b!572738 res!362253) b!572745))

(declare-fun m!551753 () Bool)

(assert (=> b!572742 m!551753))

(declare-fun m!551755 () Bool)

(assert (=> b!572742 m!551755))

(declare-fun m!551757 () Bool)

(assert (=> b!572742 m!551757))

(assert (=> b!572742 m!551753))

(declare-fun m!551759 () Bool)

(assert (=> b!572742 m!551759))

(declare-fun m!551761 () Bool)

(assert (=> b!572742 m!551761))

(assert (=> b!572742 m!551753))

(declare-fun m!551763 () Bool)

(assert (=> b!572742 m!551763))

(declare-fun m!551765 () Bool)

(assert (=> b!572742 m!551765))

(declare-fun m!551767 () Bool)

(assert (=> b!572739 m!551767))

(assert (=> b!572750 m!551753))

(declare-fun m!551769 () Bool)

(assert (=> b!572750 m!551769))

(declare-fun m!551771 () Bool)

(assert (=> b!572747 m!551771))

(declare-fun m!551773 () Bool)

(assert (=> b!572748 m!551773))

(declare-fun m!551775 () Bool)

(assert (=> b!572746 m!551775))

(declare-fun m!551777 () Bool)

(assert (=> b!572749 m!551777))

(assert (=> b!572740 m!551753))

(assert (=> b!572740 m!551753))

(declare-fun m!551779 () Bool)

(assert (=> b!572740 m!551779))

(declare-fun m!551781 () Bool)

(assert (=> b!572740 m!551781))

(declare-fun m!551783 () Bool)

(assert (=> b!572740 m!551783))

(assert (=> b!572743 m!551753))

(assert (=> b!572743 m!551753))

(declare-fun m!551785 () Bool)

(assert (=> b!572743 m!551785))

(assert (=> b!572738 m!551753))

(assert (=> b!572738 m!551753))

(declare-fun m!551787 () Bool)

(assert (=> b!572738 m!551787))

(declare-fun m!551789 () Bool)

(assert (=> start!52450 m!551789))

(declare-fun m!551791 () Bool)

(assert (=> start!52450 m!551791))

(declare-fun m!551793 () Bool)

(assert (=> b!572745 m!551793))

(declare-fun m!551795 () Bool)

(assert (=> b!572745 m!551795))

(check-sat (not b!572748) (not b!572749) (not start!52450) (not b!572747) (not b!572746) (not b!572745) (not b!572739) (not b!572743) (not b!572740) (not b!572742) (not b!572738))
(check-sat)
