; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50336 () Bool)

(assert start!50336)

(declare-fun b!550772 () Bool)

(declare-fun res!343738 () Bool)

(declare-fun e!317916 () Bool)

(assert (=> b!550772 (=> (not res!343738) (not e!317916))))

(declare-datatypes ((array!34732 0))(
  ( (array!34733 (arr!16680 (Array (_ BitVec 32) (_ BitVec 64))) (size!17044 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34732)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550772 (= res!343738 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550773 () Bool)

(declare-fun e!317915 () Bool)

(assert (=> b!550773 (= e!317916 e!317915)))

(declare-fun res!343740 () Bool)

(assert (=> b!550773 (=> (not res!343740) (not e!317915))))

(declare-datatypes ((SeekEntryResult!5129 0))(
  ( (MissingZero!5129 (index!22743 (_ BitVec 32))) (Found!5129 (index!22744 (_ BitVec 32))) (Intermediate!5129 (undefined!5941 Bool) (index!22745 (_ BitVec 32)) (x!51673 (_ BitVec 32))) (Undefined!5129) (MissingVacant!5129 (index!22746 (_ BitVec 32))) )
))
(declare-fun lt!250617 () SeekEntryResult!5129)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550773 (= res!343740 (or (= lt!250617 (MissingZero!5129 i!1132)) (= lt!250617 (MissingVacant!5129 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34732 (_ BitVec 32)) SeekEntryResult!5129)

(assert (=> b!550773 (= lt!250617 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!550774 () Bool)

(declare-fun res!343736 () Bool)

(assert (=> b!550774 (=> (not res!343736) (not e!317916))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550774 (= res!343736 (validKeyInArray!0 (select (arr!16680 a!3118) j!142)))))

(declare-fun b!550775 () Bool)

(declare-fun res!343741 () Bool)

(assert (=> b!550775 (=> (not res!343741) (not e!317915))))

(declare-datatypes ((List!10760 0))(
  ( (Nil!10757) (Cons!10756 (h!11732 (_ BitVec 64)) (t!16988 List!10760)) )
))
(declare-fun arrayNoDuplicates!0 (array!34732 (_ BitVec 32) List!10760) Bool)

(assert (=> b!550775 (= res!343741 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10757))))

(declare-fun b!550776 () Bool)

(declare-fun res!343733 () Bool)

(assert (=> b!550776 (=> (not res!343733) (not e!317916))))

(assert (=> b!550776 (= res!343733 (and (= (size!17044 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17044 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17044 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550777 () Bool)

(declare-fun e!317914 () Bool)

(assert (=> b!550777 (= e!317914 (= (seekEntryOrOpen!0 (select (arr!16680 a!3118) j!142) a!3118 mask!3119) (Found!5129 j!142)))))

(declare-fun res!343737 () Bool)

(assert (=> start!50336 (=> (not res!343737) (not e!317916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50336 (= res!343737 (validMask!0 mask!3119))))

(assert (=> start!50336 e!317916))

(assert (=> start!50336 true))

(declare-fun array_inv!12476 (array!34732) Bool)

(assert (=> start!50336 (array_inv!12476 a!3118)))

(declare-fun b!550778 () Bool)

(declare-fun res!343739 () Bool)

(assert (=> b!550778 (=> (not res!343739) (not e!317916))))

(assert (=> b!550778 (= res!343739 (validKeyInArray!0 k!1914))))

(declare-fun b!550779 () Bool)

(assert (=> b!550779 (= e!317915 (not true))))

(assert (=> b!550779 e!317914))

(declare-fun res!343742 () Bool)

(assert (=> b!550779 (=> (not res!343742) (not e!317914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34732 (_ BitVec 32)) Bool)

(assert (=> b!550779 (= res!343742 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17032 0))(
  ( (Unit!17033) )
))
(declare-fun lt!250618 () Unit!17032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17032)

(assert (=> b!550779 (= lt!250618 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550780 () Bool)

(declare-fun res!343735 () Bool)

(assert (=> b!550780 (=> (not res!343735) (not e!317915))))

(assert (=> b!550780 (= res!343735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550781 () Bool)

(declare-fun res!343734 () Bool)

(assert (=> b!550781 (=> (not res!343734) (not e!317915))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34732 (_ BitVec 32)) SeekEntryResult!5129)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550781 (= res!343734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16680 a!3118) j!142) mask!3119) (select (arr!16680 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16680 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16680 a!3118) i!1132 k!1914) j!142) (array!34733 (store (arr!16680 a!3118) i!1132 k!1914) (size!17044 a!3118)) mask!3119)))))

(assert (= (and start!50336 res!343737) b!550776))

(assert (= (and b!550776 res!343733) b!550774))

(assert (= (and b!550774 res!343736) b!550778))

(assert (= (and b!550778 res!343739) b!550772))

(assert (= (and b!550772 res!343738) b!550773))

(assert (= (and b!550773 res!343740) b!550780))

(assert (= (and b!550780 res!343735) b!550775))

(assert (= (and b!550775 res!343741) b!550781))

(assert (= (and b!550781 res!343734) b!550779))

(assert (= (and b!550779 res!343742) b!550777))

(declare-fun m!527769 () Bool)

(assert (=> start!50336 m!527769))

(declare-fun m!527771 () Bool)

(assert (=> start!50336 m!527771))

(declare-fun m!527773 () Bool)

(assert (=> b!550772 m!527773))

(declare-fun m!527775 () Bool)

(assert (=> b!550779 m!527775))

(declare-fun m!527777 () Bool)

(assert (=> b!550779 m!527777))

(declare-fun m!527779 () Bool)

(assert (=> b!550777 m!527779))

(assert (=> b!550777 m!527779))

(declare-fun m!527781 () Bool)

(assert (=> b!550777 m!527781))

(declare-fun m!527783 () Bool)

(assert (=> b!550775 m!527783))

(assert (=> b!550781 m!527779))

(declare-fun m!527785 () Bool)

(assert (=> b!550781 m!527785))

(assert (=> b!550781 m!527779))

(declare-fun m!527787 () Bool)

(assert (=> b!550781 m!527787))

(declare-fun m!527789 () Bool)

(assert (=> b!550781 m!527789))

(assert (=> b!550781 m!527787))

(declare-fun m!527791 () Bool)

(assert (=> b!550781 m!527791))

(assert (=> b!550781 m!527785))

(assert (=> b!550781 m!527779))

(declare-fun m!527793 () Bool)

(assert (=> b!550781 m!527793))

(declare-fun m!527795 () Bool)

(assert (=> b!550781 m!527795))

(assert (=> b!550781 m!527787))

(assert (=> b!550781 m!527789))

(declare-fun m!527797 () Bool)

(assert (=> b!550780 m!527797))

(declare-fun m!527799 () Bool)

(assert (=> b!550778 m!527799))

(assert (=> b!550774 m!527779))

(assert (=> b!550774 m!527779))

(declare-fun m!527801 () Bool)

(assert (=> b!550774 m!527801))

(declare-fun m!527803 () Bool)

(assert (=> b!550773 m!527803))

(push 1)

