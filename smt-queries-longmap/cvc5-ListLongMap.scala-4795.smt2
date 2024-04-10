; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65830 () Bool)

(assert start!65830)

(declare-fun b!758048 () Bool)

(declare-fun res!512777 () Bool)

(declare-fun e!422634 () Bool)

(assert (=> b!758048 (=> (not res!512777) (not e!422634))))

(declare-fun e!422643 () Bool)

(assert (=> b!758048 (= res!512777 e!422643)))

(declare-fun c!83020 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758048 (= c!83020 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758049 () Bool)

(declare-datatypes ((Unit!26240 0))(
  ( (Unit!26241) )
))
(declare-fun e!422645 () Unit!26240)

(declare-fun Unit!26242 () Unit!26240)

(assert (=> b!758049 (= e!422645 Unit!26242)))

(declare-fun b!758050 () Bool)

(declare-fun e!422637 () Bool)

(assert (=> b!758050 (= e!422637 e!422634)))

(declare-fun res!512774 () Bool)

(assert (=> b!758050 (=> (not res!512774) (not e!422634))))

(declare-datatypes ((array!42003 0))(
  ( (array!42004 (arr!20115 (Array (_ BitVec 32) (_ BitVec 64))) (size!20536 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42003)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7715 0))(
  ( (MissingZero!7715 (index!33228 (_ BitVec 32))) (Found!7715 (index!33229 (_ BitVec 32))) (Intermediate!7715 (undefined!8527 Bool) (index!33230 (_ BitVec 32)) (x!64121 (_ BitVec 32))) (Undefined!7715) (MissingVacant!7715 (index!33231 (_ BitVec 32))) )
))
(declare-fun lt!337629 () SeekEntryResult!7715)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42003 (_ BitVec 32)) SeekEntryResult!7715)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758050 (= res!512774 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20115 a!3186) j!159) mask!3328) (select (arr!20115 a!3186) j!159) a!3186 mask!3328) lt!337629))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!758050 (= lt!337629 (Intermediate!7715 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!422642 () Bool)

(declare-fun lt!337627 () SeekEntryResult!7715)

(declare-fun b!758051 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42003 (_ BitVec 32)) SeekEntryResult!7715)

(assert (=> b!758051 (= e!422642 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20115 a!3186) j!159) a!3186 mask!3328) lt!337627))))

(declare-fun b!758052 () Bool)

(declare-fun res!512772 () Bool)

(declare-fun e!422644 () Bool)

(assert (=> b!758052 (=> (not res!512772) (not e!422644))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758052 (= res!512772 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758053 () Bool)

(declare-fun e!422635 () Bool)

(declare-fun e!422639 () Bool)

(assert (=> b!758053 (= e!422635 (not e!422639))))

(declare-fun res!512788 () Bool)

(assert (=> b!758053 (=> res!512788 e!422639)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!337628 () SeekEntryResult!7715)

(assert (=> b!758053 (= res!512788 (or (not (is-Intermediate!7715 lt!337628)) (bvslt x!1131 (x!64121 lt!337628)) (not (= x!1131 (x!64121 lt!337628))) (not (= index!1321 (index!33230 lt!337628)))))))

(assert (=> b!758053 e!422642))

(declare-fun res!512778 () Bool)

(assert (=> b!758053 (=> (not res!512778) (not e!422642))))

(declare-fun lt!337631 () SeekEntryResult!7715)

(assert (=> b!758053 (= res!512778 (= lt!337631 lt!337627))))

(assert (=> b!758053 (= lt!337627 (Found!7715 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42003 (_ BitVec 32)) SeekEntryResult!7715)

(assert (=> b!758053 (= lt!337631 (seekEntryOrOpen!0 (select (arr!20115 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42003 (_ BitVec 32)) Bool)

(assert (=> b!758053 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337637 () Unit!26240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42003 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26240)

(assert (=> b!758053 (= lt!337637 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758054 () Bool)

(declare-fun res!512771 () Bool)

(declare-fun e!422640 () Bool)

(assert (=> b!758054 (=> (not res!512771) (not e!422640))))

(declare-fun lt!337626 () (_ BitVec 64))

(declare-fun lt!337636 () array!42003)

(assert (=> b!758054 (= res!512771 (= (seekEntryOrOpen!0 lt!337626 lt!337636 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337626 lt!337636 mask!3328)))))

(declare-fun b!758055 () Bool)

(assert (=> b!758055 (= e!422643 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20115 a!3186) j!159) a!3186 mask!3328) (Found!7715 j!159)))))

(declare-fun b!758056 () Bool)

(declare-fun res!512779 () Bool)

(assert (=> b!758056 (=> (not res!512779) (not e!422644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758056 (= res!512779 (validKeyInArray!0 (select (arr!20115 a!3186) j!159)))))

(declare-fun b!758057 () Bool)

(declare-fun e!422638 () Bool)

(assert (=> b!758057 (= e!422639 e!422638)))

(declare-fun res!512775 () Bool)

(assert (=> b!758057 (=> res!512775 e!422638)))

(declare-fun lt!337634 () SeekEntryResult!7715)

(assert (=> b!758057 (= res!512775 (not (= lt!337634 lt!337627)))))

(assert (=> b!758057 (= lt!337634 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20115 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758058 () Bool)

(assert (=> b!758058 (= e!422634 e!422635)))

(declare-fun res!512781 () Bool)

(assert (=> b!758058 (=> (not res!512781) (not e!422635))))

(declare-fun lt!337632 () SeekEntryResult!7715)

(assert (=> b!758058 (= res!512781 (= lt!337632 lt!337628))))

(assert (=> b!758058 (= lt!337628 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337626 lt!337636 mask!3328))))

(assert (=> b!758058 (= lt!337632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337626 mask!3328) lt!337626 lt!337636 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758058 (= lt!337626 (select (store (arr!20115 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!758058 (= lt!337636 (array!42004 (store (arr!20115 a!3186) i!1173 k!2102) (size!20536 a!3186)))))

(declare-fun res!512783 () Bool)

(assert (=> start!65830 (=> (not res!512783) (not e!422644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65830 (= res!512783 (validMask!0 mask!3328))))

(assert (=> start!65830 e!422644))

(assert (=> start!65830 true))

(declare-fun array_inv!15911 (array!42003) Bool)

(assert (=> start!65830 (array_inv!15911 a!3186)))

(declare-fun b!758059 () Bool)

(assert (=> b!758059 (= e!422644 e!422637)))

(declare-fun res!512773 () Bool)

(assert (=> b!758059 (=> (not res!512773) (not e!422637))))

(declare-fun lt!337633 () SeekEntryResult!7715)

(assert (=> b!758059 (= res!512773 (or (= lt!337633 (MissingZero!7715 i!1173)) (= lt!337633 (MissingVacant!7715 i!1173))))))

(assert (=> b!758059 (= lt!337633 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!758060 () Bool)

(assert (=> b!758060 (= e!422643 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20115 a!3186) j!159) a!3186 mask!3328) lt!337629))))

(declare-fun b!758061 () Bool)

(declare-fun res!512787 () Bool)

(assert (=> b!758061 (=> (not res!512787) (not e!422644))))

(assert (=> b!758061 (= res!512787 (validKeyInArray!0 k!2102))))

(declare-fun b!758062 () Bool)

(declare-fun res!512784 () Bool)

(assert (=> b!758062 (=> (not res!512784) (not e!422637))))

(assert (=> b!758062 (= res!512784 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20536 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20536 a!3186))))))

(declare-fun b!758063 () Bool)

(declare-fun res!512782 () Bool)

(assert (=> b!758063 (=> (not res!512782) (not e!422634))))

(assert (=> b!758063 (= res!512782 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20115 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758064 () Bool)

(declare-fun res!512786 () Bool)

(assert (=> b!758064 (=> (not res!512786) (not e!422644))))

(assert (=> b!758064 (= res!512786 (and (= (size!20536 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20536 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20536 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758065 () Bool)

(assert (=> b!758065 (= e!422640 (= lt!337631 lt!337634))))

(declare-fun b!758066 () Bool)

(declare-fun e!422641 () Bool)

(assert (=> b!758066 (= e!422638 e!422641)))

(declare-fun res!512789 () Bool)

(assert (=> b!758066 (=> res!512789 e!422641)))

(declare-fun lt!337635 () (_ BitVec 64))

(assert (=> b!758066 (= res!512789 (= lt!337635 lt!337626))))

(assert (=> b!758066 (= lt!337635 (select (store (arr!20115 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!758067 () Bool)

(declare-fun res!512780 () Bool)

(assert (=> b!758067 (=> (not res!512780) (not e!422637))))

(assert (=> b!758067 (= res!512780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758068 () Bool)

(declare-fun Unit!26243 () Unit!26240)

(assert (=> b!758068 (= e!422645 Unit!26243)))

(assert (=> b!758068 false))

(declare-fun b!758069 () Bool)

(assert (=> b!758069 (= e!422641 true)))

(assert (=> b!758069 e!422640))

(declare-fun res!512776 () Bool)

(assert (=> b!758069 (=> (not res!512776) (not e!422640))))

(assert (=> b!758069 (= res!512776 (= lt!337635 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337630 () Unit!26240)

(assert (=> b!758069 (= lt!337630 e!422645)))

(declare-fun c!83019 () Bool)

(assert (=> b!758069 (= c!83019 (= lt!337635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758070 () Bool)

(declare-fun res!512785 () Bool)

(assert (=> b!758070 (=> (not res!512785) (not e!422637))))

(declare-datatypes ((List!14117 0))(
  ( (Nil!14114) (Cons!14113 (h!15185 (_ BitVec 64)) (t!20432 List!14117)) )
))
(declare-fun arrayNoDuplicates!0 (array!42003 (_ BitVec 32) List!14117) Bool)

(assert (=> b!758070 (= res!512785 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14114))))

(assert (= (and start!65830 res!512783) b!758064))

(assert (= (and b!758064 res!512786) b!758056))

(assert (= (and b!758056 res!512779) b!758061))

(assert (= (and b!758061 res!512787) b!758052))

(assert (= (and b!758052 res!512772) b!758059))

(assert (= (and b!758059 res!512773) b!758067))

(assert (= (and b!758067 res!512780) b!758070))

(assert (= (and b!758070 res!512785) b!758062))

(assert (= (and b!758062 res!512784) b!758050))

(assert (= (and b!758050 res!512774) b!758063))

(assert (= (and b!758063 res!512782) b!758048))

(assert (= (and b!758048 c!83020) b!758060))

(assert (= (and b!758048 (not c!83020)) b!758055))

(assert (= (and b!758048 res!512777) b!758058))

(assert (= (and b!758058 res!512781) b!758053))

(assert (= (and b!758053 res!512778) b!758051))

(assert (= (and b!758053 (not res!512788)) b!758057))

(assert (= (and b!758057 (not res!512775)) b!758066))

(assert (= (and b!758066 (not res!512789)) b!758069))

(assert (= (and b!758069 c!83019) b!758068))

(assert (= (and b!758069 (not c!83019)) b!758049))

(assert (= (and b!758069 res!512776) b!758054))

(assert (= (and b!758054 res!512771) b!758065))

(declare-fun m!705607 () Bool)

(assert (=> b!758056 m!705607))

(assert (=> b!758056 m!705607))

(declare-fun m!705609 () Bool)

(assert (=> b!758056 m!705609))

(declare-fun m!705611 () Bool)

(assert (=> b!758063 m!705611))

(declare-fun m!705613 () Bool)

(assert (=> b!758059 m!705613))

(assert (=> b!758055 m!705607))

(assert (=> b!758055 m!705607))

(declare-fun m!705615 () Bool)

(assert (=> b!758055 m!705615))

(assert (=> b!758057 m!705607))

(assert (=> b!758057 m!705607))

(assert (=> b!758057 m!705615))

(declare-fun m!705617 () Bool)

(assert (=> start!65830 m!705617))

(declare-fun m!705619 () Bool)

(assert (=> start!65830 m!705619))

(declare-fun m!705621 () Bool)

(assert (=> b!758054 m!705621))

(declare-fun m!705623 () Bool)

(assert (=> b!758054 m!705623))

(declare-fun m!705625 () Bool)

(assert (=> b!758067 m!705625))

(assert (=> b!758053 m!705607))

(assert (=> b!758053 m!705607))

(declare-fun m!705627 () Bool)

(assert (=> b!758053 m!705627))

(declare-fun m!705629 () Bool)

(assert (=> b!758053 m!705629))

(declare-fun m!705631 () Bool)

(assert (=> b!758053 m!705631))

(assert (=> b!758051 m!705607))

(assert (=> b!758051 m!705607))

(declare-fun m!705633 () Bool)

(assert (=> b!758051 m!705633))

(declare-fun m!705635 () Bool)

(assert (=> b!758052 m!705635))

(assert (=> b!758060 m!705607))

(assert (=> b!758060 m!705607))

(declare-fun m!705637 () Bool)

(assert (=> b!758060 m!705637))

(declare-fun m!705639 () Bool)

(assert (=> b!758066 m!705639))

(declare-fun m!705641 () Bool)

(assert (=> b!758066 m!705641))

(declare-fun m!705643 () Bool)

(assert (=> b!758061 m!705643))

(declare-fun m!705645 () Bool)

(assert (=> b!758058 m!705645))

(declare-fun m!705647 () Bool)

(assert (=> b!758058 m!705647))

(declare-fun m!705649 () Bool)

(assert (=> b!758058 m!705649))

(assert (=> b!758058 m!705639))

(declare-fun m!705651 () Bool)

(assert (=> b!758058 m!705651))

(assert (=> b!758058 m!705647))

(assert (=> b!758050 m!705607))

(assert (=> b!758050 m!705607))

(declare-fun m!705653 () Bool)

(assert (=> b!758050 m!705653))

(assert (=> b!758050 m!705653))

(assert (=> b!758050 m!705607))

(declare-fun m!705655 () Bool)

(assert (=> b!758050 m!705655))

(declare-fun m!705657 () Bool)

(assert (=> b!758070 m!705657))

(push 1)

