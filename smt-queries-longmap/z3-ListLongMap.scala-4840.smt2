; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66776 () Bool)

(assert start!66776)

(declare-fun b!768647 () Bool)

(declare-fun res!519724 () Bool)

(declare-fun e!428092 () Bool)

(assert (=> b!768647 (=> (not res!519724) (not e!428092))))

(declare-fun e!428095 () Bool)

(assert (=> b!768647 (= res!519724 e!428095)))

(declare-fun c!84863 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!768647 (= c!84863 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!768648 () Bool)

(declare-fun res!519718 () Bool)

(declare-fun e!428097 () Bool)

(assert (=> b!768648 (=> (not res!519718) (not e!428097))))

(declare-datatypes ((array!42295 0))(
  ( (array!42296 (arr!20245 (Array (_ BitVec 32) (_ BitVec 64))) (size!20665 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42295)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768648 (= res!519718 (validKeyInArray!0 (select (arr!20245 a!3186) j!159)))))

(declare-fun b!768649 () Bool)

(declare-fun res!519723 () Bool)

(assert (=> b!768649 (=> (not res!519723) (not e!428097))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!768649 (= res!519723 (validKeyInArray!0 k0!2102))))

(declare-fun b!768650 () Bool)

(declare-fun res!519717 () Bool)

(declare-fun e!428091 () Bool)

(assert (=> b!768650 (=> (not res!519717) (not e!428091))))

(declare-datatypes ((List!14154 0))(
  ( (Nil!14151) (Cons!14150 (h!15252 (_ BitVec 64)) (t!20461 List!14154)) )
))
(declare-fun arrayNoDuplicates!0 (array!42295 (_ BitVec 32) List!14154) Bool)

(assert (=> b!768650 (= res!519717 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14151))))

(declare-fun b!768652 () Bool)

(declare-fun e!428090 () Bool)

(declare-fun e!428094 () Bool)

(assert (=> b!768652 (= e!428090 e!428094)))

(declare-fun res!519716 () Bool)

(assert (=> b!768652 (=> (not res!519716) (not e!428094))))

(declare-datatypes ((SeekEntryResult!7801 0))(
  ( (MissingZero!7801 (index!33572 (_ BitVec 32))) (Found!7801 (index!33573 (_ BitVec 32))) (Intermediate!7801 (undefined!8613 Bool) (index!33574 (_ BitVec 32)) (x!64658 (_ BitVec 32))) (Undefined!7801) (MissingVacant!7801 (index!33575 (_ BitVec 32))) )
))
(declare-fun lt!341922 () SeekEntryResult!7801)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42295 (_ BitVec 32)) SeekEntryResult!7801)

(assert (=> b!768652 (= res!519716 (= (seekEntryOrOpen!0 (select (arr!20245 a!3186) j!159) a!3186 mask!3328) lt!341922))))

(assert (=> b!768652 (= lt!341922 (Found!7801 j!159))))

(declare-fun b!768653 () Bool)

(declare-fun res!519713 () Bool)

(assert (=> b!768653 (=> (not res!519713) (not e!428092))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!768653 (= res!519713 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20245 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768654 () Bool)

(declare-fun e!428093 () Bool)

(assert (=> b!768654 (= e!428093 true)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!341917 () SeekEntryResult!7801)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42295 (_ BitVec 32)) SeekEntryResult!7801)

(assert (=> b!768654 (= lt!341917 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20245 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768655 () Bool)

(assert (=> b!768655 (= e!428095 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20245 a!3186) j!159) a!3186 mask!3328) (Found!7801 j!159)))))

(declare-fun b!768656 () Bool)

(assert (=> b!768656 (= e!428091 e!428092)))

(declare-fun res!519722 () Bool)

(assert (=> b!768656 (=> (not res!519722) (not e!428092))))

(declare-fun lt!341913 () SeekEntryResult!7801)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42295 (_ BitVec 32)) SeekEntryResult!7801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768656 (= res!519722 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20245 a!3186) j!159) mask!3328) (select (arr!20245 a!3186) j!159) a!3186 mask!3328) lt!341913))))

(assert (=> b!768656 (= lt!341913 (Intermediate!7801 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!768657 () Bool)

(assert (=> b!768657 (= e!428094 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20245 a!3186) j!159) a!3186 mask!3328) lt!341922))))

(declare-fun b!768658 () Bool)

(declare-fun res!519712 () Bool)

(assert (=> b!768658 (=> (not res!519712) (not e!428097))))

(assert (=> b!768658 (= res!519712 (and (= (size!20665 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20665 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20665 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!519714 () Bool)

(assert (=> start!66776 (=> (not res!519714) (not e!428097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66776 (= res!519714 (validMask!0 mask!3328))))

(assert (=> start!66776 e!428097))

(assert (=> start!66776 true))

(declare-fun array_inv!16104 (array!42295) Bool)

(assert (=> start!66776 (array_inv!16104 a!3186)))

(declare-fun b!768651 () Bool)

(declare-fun e!428099 () Bool)

(declare-fun e!428098 () Bool)

(assert (=> b!768651 (= e!428099 (not e!428098))))

(declare-fun res!519728 () Bool)

(assert (=> b!768651 (=> res!519728 e!428098)))

(declare-fun lt!341920 () SeekEntryResult!7801)

(get-info :version)

(assert (=> b!768651 (= res!519728 (or (not ((_ is Intermediate!7801) lt!341920)) (bvsge x!1131 (x!64658 lt!341920))))))

(assert (=> b!768651 e!428090))

(declare-fun res!519725 () Bool)

(assert (=> b!768651 (=> (not res!519725) (not e!428090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42295 (_ BitVec 32)) Bool)

(assert (=> b!768651 (= res!519725 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26407 0))(
  ( (Unit!26408) )
))
(declare-fun lt!341916 () Unit!26407)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26407)

(assert (=> b!768651 (= lt!341916 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!768659 () Bool)

(declare-fun res!519726 () Bool)

(assert (=> b!768659 (=> (not res!519726) (not e!428091))))

(assert (=> b!768659 (= res!519726 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20665 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20665 a!3186))))))

(declare-fun b!768660 () Bool)

(declare-fun res!519715 () Bool)

(assert (=> b!768660 (=> (not res!519715) (not e!428091))))

(assert (=> b!768660 (= res!519715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!768661 () Bool)

(assert (=> b!768661 (= e!428097 e!428091)))

(declare-fun res!519719 () Bool)

(assert (=> b!768661 (=> (not res!519719) (not e!428091))))

(declare-fun lt!341918 () SeekEntryResult!7801)

(assert (=> b!768661 (= res!519719 (or (= lt!341918 (MissingZero!7801 i!1173)) (= lt!341918 (MissingVacant!7801 i!1173))))))

(assert (=> b!768661 (= lt!341918 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!768662 () Bool)

(assert (=> b!768662 (= e!428092 e!428099)))

(declare-fun res!519721 () Bool)

(assert (=> b!768662 (=> (not res!519721) (not e!428099))))

(declare-fun lt!341919 () SeekEntryResult!7801)

(assert (=> b!768662 (= res!519721 (= lt!341919 lt!341920))))

(declare-fun lt!341915 () (_ BitVec 64))

(declare-fun lt!341921 () array!42295)

(assert (=> b!768662 (= lt!341920 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341915 lt!341921 mask!3328))))

(assert (=> b!768662 (= lt!341919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341915 mask!3328) lt!341915 lt!341921 mask!3328))))

(assert (=> b!768662 (= lt!341915 (select (store (arr!20245 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!768662 (= lt!341921 (array!42296 (store (arr!20245 a!3186) i!1173 k0!2102) (size!20665 a!3186)))))

(declare-fun b!768663 () Bool)

(assert (=> b!768663 (= e!428095 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20245 a!3186) j!159) a!3186 mask!3328) lt!341913))))

(declare-fun b!768664 () Bool)

(assert (=> b!768664 (= e!428098 e!428093)))

(declare-fun res!519727 () Bool)

(assert (=> b!768664 (=> res!519727 e!428093)))

(assert (=> b!768664 (= res!519727 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341914 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768664 (= lt!341914 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!768665 () Bool)

(declare-fun res!519720 () Bool)

(assert (=> b!768665 (=> (not res!519720) (not e!428097))))

(declare-fun arrayContainsKey!0 (array!42295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768665 (= res!519720 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66776 res!519714) b!768658))

(assert (= (and b!768658 res!519712) b!768648))

(assert (= (and b!768648 res!519718) b!768649))

(assert (= (and b!768649 res!519723) b!768665))

(assert (= (and b!768665 res!519720) b!768661))

(assert (= (and b!768661 res!519719) b!768660))

(assert (= (and b!768660 res!519715) b!768650))

(assert (= (and b!768650 res!519717) b!768659))

(assert (= (and b!768659 res!519726) b!768656))

(assert (= (and b!768656 res!519722) b!768653))

(assert (= (and b!768653 res!519713) b!768647))

(assert (= (and b!768647 c!84863) b!768663))

(assert (= (and b!768647 (not c!84863)) b!768655))

(assert (= (and b!768647 res!519724) b!768662))

(assert (= (and b!768662 res!519721) b!768651))

(assert (= (and b!768651 res!519725) b!768652))

(assert (= (and b!768652 res!519716) b!768657))

(assert (= (and b!768651 (not res!519728)) b!768664))

(assert (= (and b!768664 (not res!519727)) b!768654))

(declare-fun m!714667 () Bool)

(assert (=> b!768664 m!714667))

(declare-fun m!714669 () Bool)

(assert (=> b!768660 m!714669))

(declare-fun m!714671 () Bool)

(assert (=> b!768663 m!714671))

(assert (=> b!768663 m!714671))

(declare-fun m!714673 () Bool)

(assert (=> b!768663 m!714673))

(assert (=> b!768652 m!714671))

(assert (=> b!768652 m!714671))

(declare-fun m!714675 () Bool)

(assert (=> b!768652 m!714675))

(declare-fun m!714677 () Bool)

(assert (=> b!768650 m!714677))

(assert (=> b!768655 m!714671))

(assert (=> b!768655 m!714671))

(declare-fun m!714679 () Bool)

(assert (=> b!768655 m!714679))

(assert (=> b!768656 m!714671))

(assert (=> b!768656 m!714671))

(declare-fun m!714681 () Bool)

(assert (=> b!768656 m!714681))

(assert (=> b!768656 m!714681))

(assert (=> b!768656 m!714671))

(declare-fun m!714683 () Bool)

(assert (=> b!768656 m!714683))

(declare-fun m!714685 () Bool)

(assert (=> b!768649 m!714685))

(declare-fun m!714687 () Bool)

(assert (=> start!66776 m!714687))

(declare-fun m!714689 () Bool)

(assert (=> start!66776 m!714689))

(declare-fun m!714691 () Bool)

(assert (=> b!768651 m!714691))

(declare-fun m!714693 () Bool)

(assert (=> b!768651 m!714693))

(assert (=> b!768657 m!714671))

(assert (=> b!768657 m!714671))

(declare-fun m!714695 () Bool)

(assert (=> b!768657 m!714695))

(assert (=> b!768654 m!714671))

(assert (=> b!768654 m!714671))

(assert (=> b!768654 m!714679))

(declare-fun m!714697 () Bool)

(assert (=> b!768662 m!714697))

(declare-fun m!714699 () Bool)

(assert (=> b!768662 m!714699))

(declare-fun m!714701 () Bool)

(assert (=> b!768662 m!714701))

(assert (=> b!768662 m!714701))

(declare-fun m!714703 () Bool)

(assert (=> b!768662 m!714703))

(declare-fun m!714705 () Bool)

(assert (=> b!768662 m!714705))

(assert (=> b!768648 m!714671))

(assert (=> b!768648 m!714671))

(declare-fun m!714707 () Bool)

(assert (=> b!768648 m!714707))

(declare-fun m!714709 () Bool)

(assert (=> b!768665 m!714709))

(declare-fun m!714711 () Bool)

(assert (=> b!768653 m!714711))

(declare-fun m!714713 () Bool)

(assert (=> b!768661 m!714713))

(check-sat (not b!768648) (not b!768665) (not b!768651) (not b!768660) (not b!768663) (not b!768650) (not b!768649) (not start!66776) (not b!768655) (not b!768662) (not b!768657) (not b!768654) (not b!768656) (not b!768652) (not b!768661) (not b!768664))
(check-sat)
