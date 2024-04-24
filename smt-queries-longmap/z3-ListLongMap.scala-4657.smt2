; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64842 () Bool)

(assert start!64842)

(declare-fun b!730781 () Bool)

(declare-fun res!490690 () Bool)

(declare-fun e!409041 () Bool)

(assert (=> b!730781 (=> (not res!490690) (not e!409041))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41161 0))(
  ( (array!41162 (arr!19696 (Array (_ BitVec 32) (_ BitVec 64))) (size!20116 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41161)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730781 (= res!490690 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20116 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20116 a!3186))))))

(declare-fun b!730783 () Bool)

(declare-fun e!409039 () Bool)

(declare-fun e!409045 () Bool)

(assert (=> b!730783 (= e!409039 e!409045)))

(declare-fun res!490689 () Bool)

(assert (=> b!730783 (=> (not res!490689) (not e!409045))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7252 0))(
  ( (MissingZero!7252 (index!31376 (_ BitVec 32))) (Found!7252 (index!31377 (_ BitVec 32))) (Intermediate!7252 (undefined!8064 Bool) (index!31378 (_ BitVec 32)) (x!62518 (_ BitVec 32))) (Undefined!7252) (MissingVacant!7252 (index!31379 (_ BitVec 32))) )
))
(declare-fun lt!323777 () SeekEntryResult!7252)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41161 (_ BitVec 32)) SeekEntryResult!7252)

(assert (=> b!730783 (= res!490689 (= (seekEntryOrOpen!0 (select (arr!19696 a!3186) j!159) a!3186 mask!3328) lt!323777))))

(assert (=> b!730783 (= lt!323777 (Found!7252 j!159))))

(declare-fun b!730784 () Bool)

(declare-fun e!409043 () Bool)

(declare-fun e!409044 () Bool)

(assert (=> b!730784 (= e!409043 (not e!409044))))

(declare-fun res!490681 () Bool)

(assert (=> b!730784 (=> res!490681 e!409044)))

(declare-fun lt!323776 () SeekEntryResult!7252)

(get-info :version)

(assert (=> b!730784 (= res!490681 (or (not ((_ is Intermediate!7252) lt!323776)) (bvsge x!1131 (x!62518 lt!323776))))))

(assert (=> b!730784 e!409039))

(declare-fun res!490693 () Bool)

(assert (=> b!730784 (=> (not res!490693) (not e!409039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41161 (_ BitVec 32)) Bool)

(assert (=> b!730784 (= res!490693 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24901 0))(
  ( (Unit!24902) )
))
(declare-fun lt!323779 () Unit!24901)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24901)

(assert (=> b!730784 (= lt!323779 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730785 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41161 (_ BitVec 32)) SeekEntryResult!7252)

(assert (=> b!730785 (= e!409045 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19696 a!3186) j!159) a!3186 mask!3328) lt!323777))))

(declare-fun b!730786 () Bool)

(declare-fun res!490692 () Bool)

(declare-fun e!409046 () Bool)

(assert (=> b!730786 (=> (not res!490692) (not e!409046))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730786 (= res!490692 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19696 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730787 () Bool)

(declare-fun res!490678 () Bool)

(assert (=> b!730787 (=> (not res!490678) (not e!409046))))

(declare-fun e!409040 () Bool)

(assert (=> b!730787 (= res!490678 e!409040)))

(declare-fun c!80429 () Bool)

(assert (=> b!730787 (= c!80429 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730788 () Bool)

(declare-fun res!490680 () Bool)

(declare-fun e!409047 () Bool)

(assert (=> b!730788 (=> (not res!490680) (not e!409047))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730788 (= res!490680 (validKeyInArray!0 k0!2102))))

(declare-fun b!730789 () Bool)

(assert (=> b!730789 (= e!409040 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19696 a!3186) j!159) a!3186 mask!3328) (Found!7252 j!159)))))

(declare-fun b!730790 () Bool)

(assert (=> b!730790 (= e!409046 e!409043)))

(declare-fun res!490684 () Bool)

(assert (=> b!730790 (=> (not res!490684) (not e!409043))))

(declare-fun lt!323773 () SeekEntryResult!7252)

(assert (=> b!730790 (= res!490684 (= lt!323773 lt!323776))))

(declare-fun lt!323780 () (_ BitVec 64))

(declare-fun lt!323778 () array!41161)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41161 (_ BitVec 32)) SeekEntryResult!7252)

(assert (=> b!730790 (= lt!323776 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323780 lt!323778 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730790 (= lt!323773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323780 mask!3328) lt!323780 lt!323778 mask!3328))))

(assert (=> b!730790 (= lt!323780 (select (store (arr!19696 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730790 (= lt!323778 (array!41162 (store (arr!19696 a!3186) i!1173 k0!2102) (size!20116 a!3186)))))

(declare-fun b!730791 () Bool)

(declare-fun res!490682 () Bool)

(assert (=> b!730791 (=> (not res!490682) (not e!409041))))

(declare-datatypes ((List!13605 0))(
  ( (Nil!13602) (Cons!13601 (h!14667 (_ BitVec 64)) (t!19912 List!13605)) )
))
(declare-fun arrayNoDuplicates!0 (array!41161 (_ BitVec 32) List!13605) Bool)

(assert (=> b!730791 (= res!490682 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13602))))

(declare-fun b!730792 () Bool)

(declare-fun res!490679 () Bool)

(assert (=> b!730792 (=> (not res!490679) (not e!409041))))

(assert (=> b!730792 (= res!490679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730782 () Bool)

(assert (=> b!730782 (= e!409044 true)))

(declare-fun lt!323774 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730782 (= lt!323774 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun res!490688 () Bool)

(assert (=> start!64842 (=> (not res!490688) (not e!409047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64842 (= res!490688 (validMask!0 mask!3328))))

(assert (=> start!64842 e!409047))

(assert (=> start!64842 true))

(declare-fun array_inv!15555 (array!41161) Bool)

(assert (=> start!64842 (array_inv!15555 a!3186)))

(declare-fun b!730793 () Bool)

(declare-fun res!490687 () Bool)

(assert (=> b!730793 (=> (not res!490687) (not e!409047))))

(assert (=> b!730793 (= res!490687 (and (= (size!20116 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20116 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20116 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730794 () Bool)

(assert (=> b!730794 (= e!409047 e!409041)))

(declare-fun res!490686 () Bool)

(assert (=> b!730794 (=> (not res!490686) (not e!409041))))

(declare-fun lt!323781 () SeekEntryResult!7252)

(assert (=> b!730794 (= res!490686 (or (= lt!323781 (MissingZero!7252 i!1173)) (= lt!323781 (MissingVacant!7252 i!1173))))))

(assert (=> b!730794 (= lt!323781 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730795 () Bool)

(declare-fun res!490685 () Bool)

(assert (=> b!730795 (=> (not res!490685) (not e!409047))))

(declare-fun arrayContainsKey!0 (array!41161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730795 (= res!490685 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730796 () Bool)

(assert (=> b!730796 (= e!409041 e!409046)))

(declare-fun res!490691 () Bool)

(assert (=> b!730796 (=> (not res!490691) (not e!409046))))

(declare-fun lt!323775 () SeekEntryResult!7252)

(assert (=> b!730796 (= res!490691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19696 a!3186) j!159) mask!3328) (select (arr!19696 a!3186) j!159) a!3186 mask!3328) lt!323775))))

(assert (=> b!730796 (= lt!323775 (Intermediate!7252 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730797 () Bool)

(declare-fun res!490683 () Bool)

(assert (=> b!730797 (=> (not res!490683) (not e!409047))))

(assert (=> b!730797 (= res!490683 (validKeyInArray!0 (select (arr!19696 a!3186) j!159)))))

(declare-fun b!730798 () Bool)

(assert (=> b!730798 (= e!409040 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19696 a!3186) j!159) a!3186 mask!3328) lt!323775))))

(assert (= (and start!64842 res!490688) b!730793))

(assert (= (and b!730793 res!490687) b!730797))

(assert (= (and b!730797 res!490683) b!730788))

(assert (= (and b!730788 res!490680) b!730795))

(assert (= (and b!730795 res!490685) b!730794))

(assert (= (and b!730794 res!490686) b!730792))

(assert (= (and b!730792 res!490679) b!730791))

(assert (= (and b!730791 res!490682) b!730781))

(assert (= (and b!730781 res!490690) b!730796))

(assert (= (and b!730796 res!490691) b!730786))

(assert (= (and b!730786 res!490692) b!730787))

(assert (= (and b!730787 c!80429) b!730798))

(assert (= (and b!730787 (not c!80429)) b!730789))

(assert (= (and b!730787 res!490678) b!730790))

(assert (= (and b!730790 res!490684) b!730784))

(assert (= (and b!730784 res!490693) b!730783))

(assert (= (and b!730783 res!490689) b!730785))

(assert (= (and b!730784 (not res!490681)) b!730782))

(declare-fun m!684747 () Bool)

(assert (=> b!730795 m!684747))

(declare-fun m!684749 () Bool)

(assert (=> b!730782 m!684749))

(declare-fun m!684751 () Bool)

(assert (=> b!730786 m!684751))

(declare-fun m!684753 () Bool)

(assert (=> b!730794 m!684753))

(declare-fun m!684755 () Bool)

(assert (=> b!730792 m!684755))

(declare-fun m!684757 () Bool)

(assert (=> b!730789 m!684757))

(assert (=> b!730789 m!684757))

(declare-fun m!684759 () Bool)

(assert (=> b!730789 m!684759))

(assert (=> b!730797 m!684757))

(assert (=> b!730797 m!684757))

(declare-fun m!684761 () Bool)

(assert (=> b!730797 m!684761))

(assert (=> b!730785 m!684757))

(assert (=> b!730785 m!684757))

(declare-fun m!684763 () Bool)

(assert (=> b!730785 m!684763))

(assert (=> b!730796 m!684757))

(assert (=> b!730796 m!684757))

(declare-fun m!684765 () Bool)

(assert (=> b!730796 m!684765))

(assert (=> b!730796 m!684765))

(assert (=> b!730796 m!684757))

(declare-fun m!684767 () Bool)

(assert (=> b!730796 m!684767))

(declare-fun m!684769 () Bool)

(assert (=> start!64842 m!684769))

(declare-fun m!684771 () Bool)

(assert (=> start!64842 m!684771))

(assert (=> b!730783 m!684757))

(assert (=> b!730783 m!684757))

(declare-fun m!684773 () Bool)

(assert (=> b!730783 m!684773))

(declare-fun m!684775 () Bool)

(assert (=> b!730790 m!684775))

(declare-fun m!684777 () Bool)

(assert (=> b!730790 m!684777))

(declare-fun m!684779 () Bool)

(assert (=> b!730790 m!684779))

(declare-fun m!684781 () Bool)

(assert (=> b!730790 m!684781))

(declare-fun m!684783 () Bool)

(assert (=> b!730790 m!684783))

(assert (=> b!730790 m!684779))

(declare-fun m!684785 () Bool)

(assert (=> b!730784 m!684785))

(declare-fun m!684787 () Bool)

(assert (=> b!730784 m!684787))

(declare-fun m!684789 () Bool)

(assert (=> b!730788 m!684789))

(declare-fun m!684791 () Bool)

(assert (=> b!730791 m!684791))

(assert (=> b!730798 m!684757))

(assert (=> b!730798 m!684757))

(declare-fun m!684793 () Bool)

(assert (=> b!730798 m!684793))

(check-sat (not b!730796) (not b!730792) (not b!730783) (not b!730785) (not b!730789) (not b!730794) (not b!730795) (not b!730782) (not b!730791) (not start!64842) (not b!730788) (not b!730790) (not b!730784) (not b!730798) (not b!730797))
(check-sat)
