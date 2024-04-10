; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47376 () Bool)

(assert start!47376)

(declare-fun b!520864 () Bool)

(declare-fun e!303930 () Bool)

(assert (=> b!520864 (= e!303930 true)))

(declare-datatypes ((array!33202 0))(
  ( (array!33203 (arr!15957 (Array (_ BitVec 32) (_ BitVec 64))) (size!16321 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33202)

(declare-datatypes ((SeekEntryResult!4424 0))(
  ( (MissingZero!4424 (index!19899 (_ BitVec 32))) (Found!4424 (index!19900 (_ BitVec 32))) (Intermediate!4424 (undefined!5236 Bool) (index!19901 (_ BitVec 32)) (x!48890 (_ BitVec 32))) (Undefined!4424) (MissingVacant!4424 (index!19902 (_ BitVec 32))) )
))
(declare-fun lt!238592 () SeekEntryResult!4424)

(assert (=> b!520864 (and (or (= (select (arr!15957 a!3235) (index!19901 lt!238592)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15957 a!3235) (index!19901 lt!238592)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15957 a!3235) (index!19901 lt!238592)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15957 a!3235) (index!19901 lt!238592)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16148 0))(
  ( (Unit!16149) )
))
(declare-fun lt!238590 () Unit!16148)

(declare-fun e!303927 () Unit!16148)

(assert (=> b!520864 (= lt!238590 e!303927)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!61361 () Bool)

(assert (=> b!520864 (= c!61361 (= (select (arr!15957 a!3235) (index!19901 lt!238592)) (select (arr!15957 a!3235) j!176)))))

(assert (=> b!520864 (and (bvslt (x!48890 lt!238592) #b01111111111111111111111111111110) (or (= (select (arr!15957 a!3235) (index!19901 lt!238592)) (select (arr!15957 a!3235) j!176)) (= (select (arr!15957 a!3235) (index!19901 lt!238592)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15957 a!3235) (index!19901 lt!238592)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520865 () Bool)

(declare-fun res!318752 () Bool)

(declare-fun e!303933 () Bool)

(assert (=> b!520865 (=> (not res!318752) (not e!303933))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520865 (= res!318752 (and (= (size!16321 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16321 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16321 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520866 () Bool)

(declare-fun res!318750 () Bool)

(assert (=> b!520866 (=> (not res!318750) (not e!303933))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520866 (= res!318750 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!318745 () Bool)

(assert (=> start!47376 (=> (not res!318745) (not e!303933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47376 (= res!318745 (validMask!0 mask!3524))))

(assert (=> start!47376 e!303933))

(assert (=> start!47376 true))

(declare-fun array_inv!11753 (array!33202) Bool)

(assert (=> start!47376 (array_inv!11753 a!3235)))

(declare-fun b!520867 () Bool)

(declare-fun res!318744 () Bool)

(declare-fun e!303931 () Bool)

(assert (=> b!520867 (=> (not res!318744) (not e!303931))))

(declare-datatypes ((List!10115 0))(
  ( (Nil!10112) (Cons!10111 (h!11033 (_ BitVec 64)) (t!16343 List!10115)) )
))
(declare-fun arrayNoDuplicates!0 (array!33202 (_ BitVec 32) List!10115) Bool)

(assert (=> b!520867 (= res!318744 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10112))))

(declare-fun b!520868 () Bool)

(declare-fun res!318755 () Bool)

(assert (=> b!520868 (=> (not res!318755) (not e!303933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520868 (= res!318755 (validKeyInArray!0 k!2280))))

(declare-fun b!520869 () Bool)

(assert (=> b!520869 (= e!303931 (not e!303930))))

(declare-fun res!318749 () Bool)

(assert (=> b!520869 (=> res!318749 e!303930)))

(declare-fun lt!238595 () (_ BitVec 32))

(declare-fun lt!238594 () array!33202)

(declare-fun lt!238596 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33202 (_ BitVec 32)) SeekEntryResult!4424)

(assert (=> b!520869 (= res!318749 (= lt!238592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238595 lt!238596 lt!238594 mask!3524)))))

(declare-fun lt!238593 () (_ BitVec 32))

(assert (=> b!520869 (= lt!238592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238593 (select (arr!15957 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520869 (= lt!238595 (toIndex!0 lt!238596 mask!3524))))

(assert (=> b!520869 (= lt!238596 (select (store (arr!15957 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!520869 (= lt!238593 (toIndex!0 (select (arr!15957 a!3235) j!176) mask!3524))))

(assert (=> b!520869 (= lt!238594 (array!33203 (store (arr!15957 a!3235) i!1204 k!2280) (size!16321 a!3235)))))

(declare-fun e!303932 () Bool)

(assert (=> b!520869 e!303932))

(declare-fun res!318748 () Bool)

(assert (=> b!520869 (=> (not res!318748) (not e!303932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33202 (_ BitVec 32)) Bool)

(assert (=> b!520869 (= res!318748 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238589 () Unit!16148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16148)

(assert (=> b!520869 (= lt!238589 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520870 () Bool)

(declare-fun res!318754 () Bool)

(assert (=> b!520870 (=> res!318754 e!303930)))

(assert (=> b!520870 (= res!318754 (or (undefined!5236 lt!238592) (not (is-Intermediate!4424 lt!238592))))))

(declare-fun b!520871 () Bool)

(assert (=> b!520871 (= e!303933 e!303931)))

(declare-fun res!318751 () Bool)

(assert (=> b!520871 (=> (not res!318751) (not e!303931))))

(declare-fun lt!238591 () SeekEntryResult!4424)

(assert (=> b!520871 (= res!318751 (or (= lt!238591 (MissingZero!4424 i!1204)) (= lt!238591 (MissingVacant!4424 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33202 (_ BitVec 32)) SeekEntryResult!4424)

(assert (=> b!520871 (= lt!238591 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!520872 () Bool)

(declare-fun Unit!16150 () Unit!16148)

(assert (=> b!520872 (= e!303927 Unit!16150)))

(declare-fun lt!238597 () Unit!16148)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33202 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16148)

(assert (=> b!520872 (= lt!238597 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238593 #b00000000000000000000000000000000 (index!19901 lt!238592) (x!48890 lt!238592) mask!3524))))

(declare-fun res!318753 () Bool)

(assert (=> b!520872 (= res!318753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238593 lt!238596 lt!238594 mask!3524) (Intermediate!4424 false (index!19901 lt!238592) (x!48890 lt!238592))))))

(declare-fun e!303929 () Bool)

(assert (=> b!520872 (=> (not res!318753) (not e!303929))))

(assert (=> b!520872 e!303929))

(declare-fun b!520873 () Bool)

(declare-fun res!318747 () Bool)

(assert (=> b!520873 (=> (not res!318747) (not e!303933))))

(assert (=> b!520873 (= res!318747 (validKeyInArray!0 (select (arr!15957 a!3235) j!176)))))

(declare-fun b!520874 () Bool)

(declare-fun res!318746 () Bool)

(assert (=> b!520874 (=> (not res!318746) (not e!303931))))

(assert (=> b!520874 (= res!318746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520875 () Bool)

(assert (=> b!520875 (= e!303929 false)))

(declare-fun b!520876 () Bool)

(assert (=> b!520876 (= e!303932 (= (seekEntryOrOpen!0 (select (arr!15957 a!3235) j!176) a!3235 mask!3524) (Found!4424 j!176)))))

(declare-fun b!520877 () Bool)

(declare-fun Unit!16151 () Unit!16148)

(assert (=> b!520877 (= e!303927 Unit!16151)))

(assert (= (and start!47376 res!318745) b!520865))

(assert (= (and b!520865 res!318752) b!520873))

(assert (= (and b!520873 res!318747) b!520868))

(assert (= (and b!520868 res!318755) b!520866))

(assert (= (and b!520866 res!318750) b!520871))

(assert (= (and b!520871 res!318751) b!520874))

(assert (= (and b!520874 res!318746) b!520867))

(assert (= (and b!520867 res!318744) b!520869))

(assert (= (and b!520869 res!318748) b!520876))

(assert (= (and b!520869 (not res!318749)) b!520870))

(assert (= (and b!520870 (not res!318754)) b!520864))

(assert (= (and b!520864 c!61361) b!520872))

(assert (= (and b!520864 (not c!61361)) b!520877))

(assert (= (and b!520872 res!318753) b!520875))

(declare-fun m!501777 () Bool)

(assert (=> b!520876 m!501777))

(assert (=> b!520876 m!501777))

(declare-fun m!501779 () Bool)

(assert (=> b!520876 m!501779))

(declare-fun m!501781 () Bool)

(assert (=> b!520874 m!501781))

(declare-fun m!501783 () Bool)

(assert (=> b!520871 m!501783))

(assert (=> b!520873 m!501777))

(assert (=> b!520873 m!501777))

(declare-fun m!501785 () Bool)

(assert (=> b!520873 m!501785))

(declare-fun m!501787 () Bool)

(assert (=> b!520866 m!501787))

(declare-fun m!501789 () Bool)

(assert (=> start!47376 m!501789))

(declare-fun m!501791 () Bool)

(assert (=> start!47376 m!501791))

(declare-fun m!501793 () Bool)

(assert (=> b!520868 m!501793))

(declare-fun m!501795 () Bool)

(assert (=> b!520872 m!501795))

(declare-fun m!501797 () Bool)

(assert (=> b!520872 m!501797))

(declare-fun m!501799 () Bool)

(assert (=> b!520869 m!501799))

(declare-fun m!501801 () Bool)

(assert (=> b!520869 m!501801))

(assert (=> b!520869 m!501777))

(declare-fun m!501803 () Bool)

(assert (=> b!520869 m!501803))

(declare-fun m!501805 () Bool)

(assert (=> b!520869 m!501805))

(declare-fun m!501807 () Bool)

(assert (=> b!520869 m!501807))

(assert (=> b!520869 m!501777))

(declare-fun m!501809 () Bool)

(assert (=> b!520869 m!501809))

(assert (=> b!520869 m!501777))

(declare-fun m!501811 () Bool)

(assert (=> b!520869 m!501811))

(declare-fun m!501813 () Bool)

(assert (=> b!520869 m!501813))

(declare-fun m!501815 () Bool)

(assert (=> b!520867 m!501815))

(declare-fun m!501817 () Bool)

(assert (=> b!520864 m!501817))

(assert (=> b!520864 m!501777))

(push 1)

