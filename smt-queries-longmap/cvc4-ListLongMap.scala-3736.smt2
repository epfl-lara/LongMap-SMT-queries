; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51414 () Bool)

(assert start!51414)

(declare-fun b!561764 () Bool)

(declare-fun e!323722 () Bool)

(assert (=> b!561764 (= e!323722 (not true))))

(declare-fun e!323724 () Bool)

(assert (=> b!561764 e!323724))

(declare-fun res!352924 () Bool)

(assert (=> b!561764 (=> (not res!352924) (not e!323724))))

(declare-datatypes ((SeekEntryResult!5389 0))(
  ( (MissingZero!5389 (index!23783 (_ BitVec 32))) (Found!5389 (index!23784 (_ BitVec 32))) (Intermediate!5389 (undefined!6201 Bool) (index!23785 (_ BitVec 32)) (x!52684 (_ BitVec 32))) (Undefined!5389) (MissingVacant!5389 (index!23786 (_ BitVec 32))) )
))
(declare-fun lt!255736 () SeekEntryResult!5389)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!561764 (= res!352924 (= lt!255736 (Found!5389 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35279 0))(
  ( (array!35280 (arr!16940 (Array (_ BitVec 32) (_ BitVec 64))) (size!17304 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35279)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35279 (_ BitVec 32)) SeekEntryResult!5389)

(assert (=> b!561764 (= lt!255736 (seekEntryOrOpen!0 (select (arr!16940 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35279 (_ BitVec 32)) Bool)

(assert (=> b!561764 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17552 0))(
  ( (Unit!17553) )
))
(declare-fun lt!255741 () Unit!17552)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35279 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17552)

(assert (=> b!561764 (= lt!255741 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561765 () Bool)

(declare-fun e!323725 () Bool)

(assert (=> b!561765 (= e!323724 e!323725)))

(declare-fun res!352917 () Bool)

(assert (=> b!561765 (=> res!352917 e!323725)))

(declare-fun lt!255739 () SeekEntryResult!5389)

(assert (=> b!561765 (= res!352917 (or (undefined!6201 lt!255739) (not (is-Intermediate!5389 lt!255739))))))

(declare-fun b!561766 () Bool)

(declare-fun e!323720 () Bool)

(assert (=> b!561766 (= e!323725 e!323720)))

(declare-fun res!352926 () Bool)

(assert (=> b!561766 (=> res!352926 e!323720)))

(declare-fun lt!255734 () (_ BitVec 64))

(assert (=> b!561766 (= res!352926 (or (= lt!255734 (select (arr!16940 a!3118) j!142)) (= lt!255734 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561766 (= lt!255734 (select (arr!16940 a!3118) (index!23785 lt!255739)))))

(declare-fun b!561767 () Bool)

(declare-fun res!352919 () Bool)

(declare-fun e!323726 () Bool)

(assert (=> b!561767 (=> (not res!352919) (not e!323726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561767 (= res!352919 (validKeyInArray!0 (select (arr!16940 a!3118) j!142)))))

(declare-fun b!561768 () Bool)

(declare-fun res!352927 () Bool)

(assert (=> b!561768 (=> (not res!352927) (not e!323726))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561768 (= res!352927 (and (= (size!17304 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17304 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17304 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561769 () Bool)

(declare-fun res!352928 () Bool)

(assert (=> b!561769 (=> (not res!352928) (not e!323726))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!561769 (= res!352928 (validKeyInArray!0 k!1914))))

(declare-fun b!561770 () Bool)

(declare-fun res!352918 () Bool)

(declare-fun e!323721 () Bool)

(assert (=> b!561770 (=> (not res!352918) (not e!323721))))

(declare-datatypes ((List!11020 0))(
  ( (Nil!11017) (Cons!11016 (h!12019 (_ BitVec 64)) (t!17248 List!11020)) )
))
(declare-fun arrayNoDuplicates!0 (array!35279 (_ BitVec 32) List!11020) Bool)

(assert (=> b!561770 (= res!352918 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11017))))

(declare-fun b!561771 () Bool)

(declare-fun e!323723 () Bool)

(assert (=> b!561771 (= e!323720 e!323723)))

(declare-fun res!352923 () Bool)

(assert (=> b!561771 (=> (not res!352923) (not e!323723))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35279 (_ BitVec 32)) SeekEntryResult!5389)

(assert (=> b!561771 (= res!352923 (= lt!255736 (seekKeyOrZeroReturnVacant!0 (x!52684 lt!255739) (index!23785 lt!255739) (index!23785 lt!255739) (select (arr!16940 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561772 () Bool)

(assert (=> b!561772 (= e!323721 e!323722)))

(declare-fun res!352920 () Bool)

(assert (=> b!561772 (=> (not res!352920) (not e!323722))))

(declare-fun lt!255740 () (_ BitVec 64))

(declare-fun lt!255742 () (_ BitVec 32))

(declare-fun lt!255735 () array!35279)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35279 (_ BitVec 32)) SeekEntryResult!5389)

(assert (=> b!561772 (= res!352920 (= lt!255739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255742 lt!255740 lt!255735 mask!3119)))))

(declare-fun lt!255738 () (_ BitVec 32))

(assert (=> b!561772 (= lt!255739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255738 (select (arr!16940 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561772 (= lt!255742 (toIndex!0 lt!255740 mask!3119))))

(assert (=> b!561772 (= lt!255740 (select (store (arr!16940 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561772 (= lt!255738 (toIndex!0 (select (arr!16940 a!3118) j!142) mask!3119))))

(assert (=> b!561772 (= lt!255735 (array!35280 (store (arr!16940 a!3118) i!1132 k!1914) (size!17304 a!3118)))))

(declare-fun b!561773 () Bool)

(assert (=> b!561773 (= e!323726 e!323721)))

(declare-fun res!352925 () Bool)

(assert (=> b!561773 (=> (not res!352925) (not e!323721))))

(declare-fun lt!255737 () SeekEntryResult!5389)

(assert (=> b!561773 (= res!352925 (or (= lt!255737 (MissingZero!5389 i!1132)) (= lt!255737 (MissingVacant!5389 i!1132))))))

(assert (=> b!561773 (= lt!255737 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561774 () Bool)

(declare-fun res!352922 () Bool)

(assert (=> b!561774 (=> (not res!352922) (not e!323726))))

(declare-fun arrayContainsKey!0 (array!35279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561774 (= res!352922 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!352921 () Bool)

(assert (=> start!51414 (=> (not res!352921) (not e!323726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51414 (= res!352921 (validMask!0 mask!3119))))

(assert (=> start!51414 e!323726))

(assert (=> start!51414 true))

(declare-fun array_inv!12736 (array!35279) Bool)

(assert (=> start!51414 (array_inv!12736 a!3118)))

(declare-fun b!561775 () Bool)

(declare-fun res!352916 () Bool)

(assert (=> b!561775 (=> (not res!352916) (not e!323721))))

(assert (=> b!561775 (= res!352916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561776 () Bool)

(assert (=> b!561776 (= e!323723 (= (seekEntryOrOpen!0 lt!255740 lt!255735 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52684 lt!255739) (index!23785 lt!255739) (index!23785 lt!255739) lt!255740 lt!255735 mask!3119)))))

(assert (= (and start!51414 res!352921) b!561768))

(assert (= (and b!561768 res!352927) b!561767))

(assert (= (and b!561767 res!352919) b!561769))

(assert (= (and b!561769 res!352928) b!561774))

(assert (= (and b!561774 res!352922) b!561773))

(assert (= (and b!561773 res!352925) b!561775))

(assert (= (and b!561775 res!352916) b!561770))

(assert (= (and b!561770 res!352918) b!561772))

(assert (= (and b!561772 res!352920) b!561764))

(assert (= (and b!561764 res!352924) b!561765))

(assert (= (and b!561765 (not res!352917)) b!561766))

(assert (= (and b!561766 (not res!352926)) b!561771))

(assert (= (and b!561771 res!352923) b!561776))

(declare-fun m!539701 () Bool)

(assert (=> b!561770 m!539701))

(declare-fun m!539703 () Bool)

(assert (=> b!561766 m!539703))

(declare-fun m!539705 () Bool)

(assert (=> b!561766 m!539705))

(declare-fun m!539707 () Bool)

(assert (=> b!561775 m!539707))

(declare-fun m!539709 () Bool)

(assert (=> b!561773 m!539709))

(declare-fun m!539711 () Bool)

(assert (=> start!51414 m!539711))

(declare-fun m!539713 () Bool)

(assert (=> start!51414 m!539713))

(declare-fun m!539715 () Bool)

(assert (=> b!561776 m!539715))

(declare-fun m!539717 () Bool)

(assert (=> b!561776 m!539717))

(declare-fun m!539719 () Bool)

(assert (=> b!561774 m!539719))

(assert (=> b!561767 m!539703))

(assert (=> b!561767 m!539703))

(declare-fun m!539721 () Bool)

(assert (=> b!561767 m!539721))

(assert (=> b!561764 m!539703))

(assert (=> b!561764 m!539703))

(declare-fun m!539723 () Bool)

(assert (=> b!561764 m!539723))

(declare-fun m!539725 () Bool)

(assert (=> b!561764 m!539725))

(declare-fun m!539727 () Bool)

(assert (=> b!561764 m!539727))

(declare-fun m!539729 () Bool)

(assert (=> b!561769 m!539729))

(assert (=> b!561772 m!539703))

(declare-fun m!539731 () Bool)

(assert (=> b!561772 m!539731))

(declare-fun m!539733 () Bool)

(assert (=> b!561772 m!539733))

(assert (=> b!561772 m!539703))

(declare-fun m!539735 () Bool)

(assert (=> b!561772 m!539735))

(assert (=> b!561772 m!539703))

(declare-fun m!539737 () Bool)

(assert (=> b!561772 m!539737))

(declare-fun m!539739 () Bool)

(assert (=> b!561772 m!539739))

(declare-fun m!539741 () Bool)

(assert (=> b!561772 m!539741))

(assert (=> b!561771 m!539703))

(assert (=> b!561771 m!539703))

(declare-fun m!539743 () Bool)

(assert (=> b!561771 m!539743))

(push 1)

