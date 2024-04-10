; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65164 () Bool)

(assert start!65164)

(declare-fun b!736684 () Bool)

(declare-fun res!495112 () Bool)

(declare-fun e!412096 () Bool)

(assert (=> b!736684 (=> (not res!495112) (not e!412096))))

(declare-datatypes ((array!41337 0))(
  ( (array!41338 (arr!19782 (Array (_ BitVec 32) (_ BitVec 64))) (size!20203 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41337)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736684 (= res!495112 (validKeyInArray!0 (select (arr!19782 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7382 0))(
  ( (MissingZero!7382 (index!31896 (_ BitVec 32))) (Found!7382 (index!31897 (_ BitVec 32))) (Intermediate!7382 (undefined!8194 Bool) (index!31898 (_ BitVec 32)) (x!62900 (_ BitVec 32))) (Undefined!7382) (MissingVacant!7382 (index!31899 (_ BitVec 32))) )
))
(declare-fun lt!326742 () SeekEntryResult!7382)

(declare-fun e!412099 () Bool)

(declare-fun b!736685 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41337 (_ BitVec 32)) SeekEntryResult!7382)

(assert (=> b!736685 (= e!412099 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19782 a!3186) j!159) a!3186 mask!3328) lt!326742))))

(declare-fun b!736686 () Bool)

(declare-fun e!412104 () Bool)

(assert (=> b!736686 (= e!412104 true)))

(declare-fun lt!326747 () array!41337)

(declare-fun lt!326748 () SeekEntryResult!7382)

(declare-fun lt!326749 () (_ BitVec 64))

(declare-fun lt!326752 () (_ BitVec 32))

(assert (=> b!736686 (= lt!326748 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326752 lt!326749 lt!326747 mask!3328))))

(declare-fun b!736687 () Bool)

(declare-fun res!495123 () Bool)

(declare-fun e!412105 () Bool)

(assert (=> b!736687 (=> (not res!495123) (not e!412105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41337 (_ BitVec 32)) Bool)

(assert (=> b!736687 (= res!495123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736688 () Bool)

(declare-fun e!412100 () Bool)

(assert (=> b!736688 (= e!412100 e!412104)))

(declare-fun res!495116 () Bool)

(assert (=> b!736688 (=> res!495116 e!412104)))

(assert (=> b!736688 (= res!495116 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326752 #b00000000000000000000000000000000) (bvsge lt!326752 (size!20203 a!3186))))))

(declare-datatypes ((Unit!25124 0))(
  ( (Unit!25125) )
))
(declare-fun lt!326746 () Unit!25124)

(declare-fun e!412101 () Unit!25124)

(assert (=> b!736688 (= lt!326746 e!412101)))

(declare-fun c!81168 () Bool)

(declare-fun lt!326743 () Bool)

(assert (=> b!736688 (= c!81168 lt!326743)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736688 (= lt!326743 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736688 (= lt!326752 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736689 () Bool)

(declare-fun e!412103 () Bool)

(assert (=> b!736689 (= e!412103 (not e!412100))))

(declare-fun res!495113 () Bool)

(assert (=> b!736689 (=> res!495113 e!412100)))

(declare-fun lt!326740 () SeekEntryResult!7382)

(assert (=> b!736689 (= res!495113 (or (not (is-Intermediate!7382 lt!326740)) (bvsge x!1131 (x!62900 lt!326740))))))

(declare-fun lt!326745 () SeekEntryResult!7382)

(assert (=> b!736689 (= lt!326745 (Found!7382 j!159))))

(declare-fun e!412097 () Bool)

(assert (=> b!736689 e!412097))

(declare-fun res!495120 () Bool)

(assert (=> b!736689 (=> (not res!495120) (not e!412097))))

(assert (=> b!736689 (= res!495120 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326741 () Unit!25124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25124)

(assert (=> b!736689 (= lt!326741 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736690 () Bool)

(declare-fun res!495115 () Bool)

(assert (=> b!736690 (=> (not res!495115) (not e!412096))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!736690 (= res!495115 (validKeyInArray!0 k!2102))))

(declare-fun b!736691 () Bool)

(declare-fun Unit!25126 () Unit!25124)

(assert (=> b!736691 (= e!412101 Unit!25126)))

(assert (=> b!736691 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326752 (select (arr!19782 a!3186) j!159) a!3186 mask!3328) lt!326742)))

(declare-fun b!736692 () Bool)

(declare-fun e!412102 () Bool)

(assert (=> b!736692 (= e!412097 e!412102)))

(declare-fun res!495117 () Bool)

(assert (=> b!736692 (=> (not res!495117) (not e!412102))))

(declare-fun lt!326753 () SeekEntryResult!7382)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41337 (_ BitVec 32)) SeekEntryResult!7382)

(assert (=> b!736692 (= res!495117 (= (seekEntryOrOpen!0 (select (arr!19782 a!3186) j!159) a!3186 mask!3328) lt!326753))))

(assert (=> b!736692 (= lt!326753 (Found!7382 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!736693 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41337 (_ BitVec 32)) SeekEntryResult!7382)

(assert (=> b!736693 (= e!412099 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19782 a!3186) j!159) a!3186 mask!3328) (Found!7382 j!159)))))

(declare-fun b!736694 () Bool)

(declare-fun res!495127 () Bool)

(assert (=> b!736694 (=> (not res!495127) (not e!412105))))

(declare-datatypes ((List!13784 0))(
  ( (Nil!13781) (Cons!13780 (h!14852 (_ BitVec 64)) (t!20099 List!13784)) )
))
(declare-fun arrayNoDuplicates!0 (array!41337 (_ BitVec 32) List!13784) Bool)

(assert (=> b!736694 (= res!495127 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13781))))

(declare-fun b!736695 () Bool)

(declare-fun res!495114 () Bool)

(assert (=> b!736695 (=> res!495114 e!412104)))

(declare-fun e!412095 () Bool)

(assert (=> b!736695 (= res!495114 e!412095)))

(declare-fun c!81167 () Bool)

(assert (=> b!736695 (= c!81167 lt!326743)))

(declare-fun b!736696 () Bool)

(declare-fun e!412098 () Bool)

(assert (=> b!736696 (= e!412098 e!412103)))

(declare-fun res!495128 () Bool)

(assert (=> b!736696 (=> (not res!495128) (not e!412103))))

(declare-fun lt!326744 () SeekEntryResult!7382)

(assert (=> b!736696 (= res!495128 (= lt!326744 lt!326740))))

(assert (=> b!736696 (= lt!326740 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326749 lt!326747 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736696 (= lt!326744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326749 mask!3328) lt!326749 lt!326747 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736696 (= lt!326749 (select (store (arr!19782 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!736696 (= lt!326747 (array!41338 (store (arr!19782 a!3186) i!1173 k!2102) (size!20203 a!3186)))))

(declare-fun b!736697 () Bool)

(assert (=> b!736697 (= e!412102 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19782 a!3186) j!159) a!3186 mask!3328) lt!326753))))

(declare-fun b!736698 () Bool)

(declare-fun Unit!25127 () Unit!25124)

(assert (=> b!736698 (= e!412101 Unit!25127)))

(declare-fun lt!326751 () SeekEntryResult!7382)

(assert (=> b!736698 (= lt!326751 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19782 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736698 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326752 resIntermediateIndex!5 (select (arr!19782 a!3186) j!159) a!3186 mask!3328) lt!326745)))

(declare-fun b!736699 () Bool)

(declare-fun res!495111 () Bool)

(assert (=> b!736699 (=> (not res!495111) (not e!412105))))

(assert (=> b!736699 (= res!495111 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20203 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20203 a!3186))))))

(declare-fun b!736700 () Bool)

(assert (=> b!736700 (= e!412095 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326752 (select (arr!19782 a!3186) j!159) a!3186 mask!3328) lt!326742)))))

(declare-fun b!736701 () Bool)

(declare-fun res!495122 () Bool)

(assert (=> b!736701 (=> (not res!495122) (not e!412096))))

(assert (=> b!736701 (= res!495122 (and (= (size!20203 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20203 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20203 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736702 () Bool)

(declare-fun res!495118 () Bool)

(assert (=> b!736702 (=> (not res!495118) (not e!412096))))

(declare-fun arrayContainsKey!0 (array!41337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736702 (= res!495118 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736703 () Bool)

(assert (=> b!736703 (= e!412095 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326752 resIntermediateIndex!5 (select (arr!19782 a!3186) j!159) a!3186 mask!3328) lt!326745)))))

(declare-fun res!495126 () Bool)

(assert (=> start!65164 (=> (not res!495126) (not e!412096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65164 (= res!495126 (validMask!0 mask!3328))))

(assert (=> start!65164 e!412096))

(assert (=> start!65164 true))

(declare-fun array_inv!15578 (array!41337) Bool)

(assert (=> start!65164 (array_inv!15578 a!3186)))

(declare-fun b!736704 () Bool)

(declare-fun res!495121 () Bool)

(assert (=> b!736704 (=> (not res!495121) (not e!412098))))

(assert (=> b!736704 (= res!495121 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19782 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736705 () Bool)

(assert (=> b!736705 (= e!412096 e!412105)))

(declare-fun res!495125 () Bool)

(assert (=> b!736705 (=> (not res!495125) (not e!412105))))

(declare-fun lt!326750 () SeekEntryResult!7382)

(assert (=> b!736705 (= res!495125 (or (= lt!326750 (MissingZero!7382 i!1173)) (= lt!326750 (MissingVacant!7382 i!1173))))))

(assert (=> b!736705 (= lt!326750 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!736706 () Bool)

(assert (=> b!736706 (= e!412105 e!412098)))

(declare-fun res!495124 () Bool)

(assert (=> b!736706 (=> (not res!495124) (not e!412098))))

(assert (=> b!736706 (= res!495124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19782 a!3186) j!159) mask!3328) (select (arr!19782 a!3186) j!159) a!3186 mask!3328) lt!326742))))

(assert (=> b!736706 (= lt!326742 (Intermediate!7382 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736707 () Bool)

(declare-fun res!495119 () Bool)

(assert (=> b!736707 (=> (not res!495119) (not e!412098))))

(assert (=> b!736707 (= res!495119 e!412099)))

(declare-fun c!81169 () Bool)

(assert (=> b!736707 (= c!81169 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65164 res!495126) b!736701))

(assert (= (and b!736701 res!495122) b!736684))

(assert (= (and b!736684 res!495112) b!736690))

(assert (= (and b!736690 res!495115) b!736702))

(assert (= (and b!736702 res!495118) b!736705))

(assert (= (and b!736705 res!495125) b!736687))

(assert (= (and b!736687 res!495123) b!736694))

(assert (= (and b!736694 res!495127) b!736699))

(assert (= (and b!736699 res!495111) b!736706))

(assert (= (and b!736706 res!495124) b!736704))

(assert (= (and b!736704 res!495121) b!736707))

(assert (= (and b!736707 c!81169) b!736685))

(assert (= (and b!736707 (not c!81169)) b!736693))

(assert (= (and b!736707 res!495119) b!736696))

(assert (= (and b!736696 res!495128) b!736689))

(assert (= (and b!736689 res!495120) b!736692))

(assert (= (and b!736692 res!495117) b!736697))

(assert (= (and b!736689 (not res!495113)) b!736688))

(assert (= (and b!736688 c!81168) b!736691))

(assert (= (and b!736688 (not c!81168)) b!736698))

(assert (= (and b!736688 (not res!495116)) b!736695))

(assert (= (and b!736695 c!81167) b!736700))

(assert (= (and b!736695 (not c!81167)) b!736703))

(assert (= (and b!736695 (not res!495114)) b!736686))

(declare-fun m!688753 () Bool)

(assert (=> start!65164 m!688753))

(declare-fun m!688755 () Bool)

(assert (=> start!65164 m!688755))

(declare-fun m!688757 () Bool)

(assert (=> b!736704 m!688757))

(declare-fun m!688759 () Bool)

(assert (=> b!736700 m!688759))

(assert (=> b!736700 m!688759))

(declare-fun m!688761 () Bool)

(assert (=> b!736700 m!688761))

(declare-fun m!688763 () Bool)

(assert (=> b!736702 m!688763))

(declare-fun m!688765 () Bool)

(assert (=> b!736696 m!688765))

(declare-fun m!688767 () Bool)

(assert (=> b!736696 m!688767))

(declare-fun m!688769 () Bool)

(assert (=> b!736696 m!688769))

(assert (=> b!736696 m!688769))

(declare-fun m!688771 () Bool)

(assert (=> b!736696 m!688771))

(declare-fun m!688773 () Bool)

(assert (=> b!736696 m!688773))

(declare-fun m!688775 () Bool)

(assert (=> b!736688 m!688775))

(assert (=> b!736697 m!688759))

(assert (=> b!736697 m!688759))

(declare-fun m!688777 () Bool)

(assert (=> b!736697 m!688777))

(assert (=> b!736693 m!688759))

(assert (=> b!736693 m!688759))

(declare-fun m!688779 () Bool)

(assert (=> b!736693 m!688779))

(assert (=> b!736684 m!688759))

(assert (=> b!736684 m!688759))

(declare-fun m!688781 () Bool)

(assert (=> b!736684 m!688781))

(assert (=> b!736692 m!688759))

(assert (=> b!736692 m!688759))

(declare-fun m!688783 () Bool)

(assert (=> b!736692 m!688783))

(assert (=> b!736703 m!688759))

(assert (=> b!736703 m!688759))

(declare-fun m!688785 () Bool)

(assert (=> b!736703 m!688785))

(declare-fun m!688787 () Bool)

(assert (=> b!736694 m!688787))

(assert (=> b!736698 m!688759))

(assert (=> b!736698 m!688759))

(assert (=> b!736698 m!688779))

(assert (=> b!736698 m!688759))

(assert (=> b!736698 m!688785))

(assert (=> b!736706 m!688759))

(assert (=> b!736706 m!688759))

(declare-fun m!688789 () Bool)

(assert (=> b!736706 m!688789))

(assert (=> b!736706 m!688789))

(assert (=> b!736706 m!688759))

(declare-fun m!688791 () Bool)

(assert (=> b!736706 m!688791))

(assert (=> b!736685 m!688759))

(assert (=> b!736685 m!688759))

(declare-fun m!688793 () Bool)

(assert (=> b!736685 m!688793))

(declare-fun m!688795 () Bool)

(assert (=> b!736687 m!688795))

(declare-fun m!688797 () Bool)

(assert (=> b!736705 m!688797))

(declare-fun m!688799 () Bool)

(assert (=> b!736689 m!688799))

(declare-fun m!688801 () Bool)

(assert (=> b!736689 m!688801))

(declare-fun m!688803 () Bool)

(assert (=> b!736690 m!688803))

(declare-fun m!688805 () Bool)

(assert (=> b!736686 m!688805))

(assert (=> b!736691 m!688759))

(assert (=> b!736691 m!688759))

(assert (=> b!736691 m!688761))

(push 1)

