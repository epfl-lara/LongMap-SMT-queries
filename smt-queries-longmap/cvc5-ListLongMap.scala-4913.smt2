; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67722 () Bool)

(assert start!67722)

(declare-fun b!785621 () Bool)

(declare-fun e!436756 () Bool)

(declare-fun e!436754 () Bool)

(assert (=> b!785621 (= e!436756 e!436754)))

(declare-fun res!531812 () Bool)

(assert (=> b!785621 (=> (not res!531812) (not e!436754))))

(declare-datatypes ((array!42762 0))(
  ( (array!42763 (arr!20469 (Array (_ BitVec 32) (_ BitVec 64))) (size!20890 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42762)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8069 0))(
  ( (MissingZero!8069 (index!34644 (_ BitVec 32))) (Found!8069 (index!34645 (_ BitVec 32))) (Intermediate!8069 (undefined!8881 Bool) (index!34646 (_ BitVec 32)) (x!65593 (_ BitVec 32))) (Undefined!8069) (MissingVacant!8069 (index!34647 (_ BitVec 32))) )
))
(declare-fun lt!350311 () SeekEntryResult!8069)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42762 (_ BitVec 32)) SeekEntryResult!8069)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785621 (= res!531812 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20469 a!3186) j!159) mask!3328) (select (arr!20469 a!3186) j!159) a!3186 mask!3328) lt!350311))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785621 (= lt!350311 (Intermediate!8069 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785622 () Bool)

(declare-datatypes ((Unit!27164 0))(
  ( (Unit!27165) )
))
(declare-fun e!436758 () Unit!27164)

(declare-fun Unit!27166 () Unit!27164)

(assert (=> b!785622 (= e!436758 Unit!27166)))

(assert (=> b!785622 false))

(declare-fun b!785623 () Bool)

(declare-fun e!436755 () Bool)

(declare-fun e!436759 () Bool)

(assert (=> b!785623 (= e!436755 e!436759)))

(declare-fun res!531820 () Bool)

(assert (=> b!785623 (=> res!531820 e!436759)))

(declare-fun lt!350312 () SeekEntryResult!8069)

(declare-fun lt!350306 () SeekEntryResult!8069)

(assert (=> b!785623 (= res!531820 (not (= lt!350312 lt!350306)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42762 (_ BitVec 32)) SeekEntryResult!8069)

(assert (=> b!785623 (= lt!350312 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20469 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785624 () Bool)

(declare-fun res!531826 () Bool)

(assert (=> b!785624 (=> (not res!531826) (not e!436756))))

(declare-datatypes ((List!14471 0))(
  ( (Nil!14468) (Cons!14467 (h!15590 (_ BitVec 64)) (t!20786 List!14471)) )
))
(declare-fun arrayNoDuplicates!0 (array!42762 (_ BitVec 32) List!14471) Bool)

(assert (=> b!785624 (= res!531826 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14468))))

(declare-fun res!531821 () Bool)

(declare-fun e!436760 () Bool)

(assert (=> start!67722 (=> (not res!531821) (not e!436760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67722 (= res!531821 (validMask!0 mask!3328))))

(assert (=> start!67722 e!436760))

(assert (=> start!67722 true))

(declare-fun array_inv!16265 (array!42762) Bool)

(assert (=> start!67722 (array_inv!16265 a!3186)))

(declare-fun b!785625 () Bool)

(declare-fun e!436750 () Bool)

(assert (=> b!785625 (= e!436759 e!436750)))

(declare-fun res!531827 () Bool)

(assert (=> b!785625 (=> res!531827 e!436750)))

(declare-fun lt!350310 () (_ BitVec 64))

(declare-fun lt!350301 () (_ BitVec 64))

(assert (=> b!785625 (= res!531827 (= lt!350310 lt!350301))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!785625 (= lt!350310 (select (store (arr!20469 a!3186) i!1173 k!2102) index!1321))))

(declare-fun e!436749 () Bool)

(declare-fun b!785626 () Bool)

(assert (=> b!785626 (= e!436749 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20469 a!3186) j!159) a!3186 mask!3328) lt!350306))))

(declare-fun b!785627 () Bool)

(declare-fun res!531830 () Bool)

(assert (=> b!785627 (=> (not res!531830) (not e!436760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785627 (= res!531830 (validKeyInArray!0 k!2102))))

(declare-fun b!785628 () Bool)

(assert (=> b!785628 (= e!436750 true)))

(declare-fun e!436757 () Bool)

(assert (=> b!785628 e!436757))

(declare-fun res!531825 () Bool)

(assert (=> b!785628 (=> (not res!531825) (not e!436757))))

(assert (=> b!785628 (= res!531825 (= lt!350310 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350307 () Unit!27164)

(assert (=> b!785628 (= lt!350307 e!436758)))

(declare-fun c!87312 () Bool)

(assert (=> b!785628 (= c!87312 (= lt!350310 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785629 () Bool)

(declare-fun lt!350309 () SeekEntryResult!8069)

(assert (=> b!785629 (= e!436757 (= lt!350309 lt!350312))))

(declare-fun b!785630 () Bool)

(declare-fun res!531824 () Bool)

(assert (=> b!785630 (=> (not res!531824) (not e!436760))))

(assert (=> b!785630 (= res!531824 (and (= (size!20890 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20890 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20890 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785631 () Bool)

(declare-fun e!436752 () Bool)

(assert (=> b!785631 (= e!436752 (not e!436755))))

(declare-fun res!531815 () Bool)

(assert (=> b!785631 (=> res!531815 e!436755)))

(declare-fun lt!350302 () SeekEntryResult!8069)

(assert (=> b!785631 (= res!531815 (or (not (is-Intermediate!8069 lt!350302)) (bvslt x!1131 (x!65593 lt!350302)) (not (= x!1131 (x!65593 lt!350302))) (not (= index!1321 (index!34646 lt!350302)))))))

(assert (=> b!785631 e!436749))

(declare-fun res!531819 () Bool)

(assert (=> b!785631 (=> (not res!531819) (not e!436749))))

(assert (=> b!785631 (= res!531819 (= lt!350309 lt!350306))))

(assert (=> b!785631 (= lt!350306 (Found!8069 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42762 (_ BitVec 32)) SeekEntryResult!8069)

(assert (=> b!785631 (= lt!350309 (seekEntryOrOpen!0 (select (arr!20469 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42762 (_ BitVec 32)) Bool)

(assert (=> b!785631 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350305 () Unit!27164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27164)

(assert (=> b!785631 (= lt!350305 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785632 () Bool)

(declare-fun e!436751 () Bool)

(assert (=> b!785632 (= e!436751 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20469 a!3186) j!159) a!3186 mask!3328) (Found!8069 j!159)))))

(declare-fun b!785633 () Bool)

(declare-fun res!531822 () Bool)

(assert (=> b!785633 (=> (not res!531822) (not e!436756))))

(assert (=> b!785633 (= res!531822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785634 () Bool)

(assert (=> b!785634 (= e!436760 e!436756)))

(declare-fun res!531818 () Bool)

(assert (=> b!785634 (=> (not res!531818) (not e!436756))))

(declare-fun lt!350308 () SeekEntryResult!8069)

(assert (=> b!785634 (= res!531818 (or (= lt!350308 (MissingZero!8069 i!1173)) (= lt!350308 (MissingVacant!8069 i!1173))))))

(assert (=> b!785634 (= lt!350308 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!785635 () Bool)

(declare-fun res!531817 () Bool)

(assert (=> b!785635 (=> (not res!531817) (not e!436760))))

(assert (=> b!785635 (= res!531817 (validKeyInArray!0 (select (arr!20469 a!3186) j!159)))))

(declare-fun b!785636 () Bool)

(assert (=> b!785636 (= e!436751 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20469 a!3186) j!159) a!3186 mask!3328) lt!350311))))

(declare-fun b!785637 () Bool)

(assert (=> b!785637 (= e!436754 e!436752)))

(declare-fun res!531828 () Bool)

(assert (=> b!785637 (=> (not res!531828) (not e!436752))))

(declare-fun lt!350304 () SeekEntryResult!8069)

(assert (=> b!785637 (= res!531828 (= lt!350304 lt!350302))))

(declare-fun lt!350303 () array!42762)

(assert (=> b!785637 (= lt!350302 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350301 lt!350303 mask!3328))))

(assert (=> b!785637 (= lt!350304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350301 mask!3328) lt!350301 lt!350303 mask!3328))))

(assert (=> b!785637 (= lt!350301 (select (store (arr!20469 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!785637 (= lt!350303 (array!42763 (store (arr!20469 a!3186) i!1173 k!2102) (size!20890 a!3186)))))

(declare-fun b!785638 () Bool)

(declare-fun res!531813 () Bool)

(assert (=> b!785638 (=> (not res!531813) (not e!436754))))

(assert (=> b!785638 (= res!531813 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20469 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785639 () Bool)

(declare-fun Unit!27167 () Unit!27164)

(assert (=> b!785639 (= e!436758 Unit!27167)))

(declare-fun b!785640 () Bool)

(declare-fun res!531816 () Bool)

(assert (=> b!785640 (=> (not res!531816) (not e!436754))))

(assert (=> b!785640 (= res!531816 e!436751)))

(declare-fun c!87313 () Bool)

(assert (=> b!785640 (= c!87313 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785641 () Bool)

(declare-fun res!531814 () Bool)

(assert (=> b!785641 (=> (not res!531814) (not e!436756))))

(assert (=> b!785641 (= res!531814 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20890 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20890 a!3186))))))

(declare-fun b!785642 () Bool)

(declare-fun res!531829 () Bool)

(assert (=> b!785642 (=> (not res!531829) (not e!436760))))

(declare-fun arrayContainsKey!0 (array!42762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785642 (= res!531829 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785643 () Bool)

(declare-fun res!531823 () Bool)

(assert (=> b!785643 (=> (not res!531823) (not e!436757))))

(assert (=> b!785643 (= res!531823 (= (seekEntryOrOpen!0 lt!350301 lt!350303 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350301 lt!350303 mask!3328)))))

(assert (= (and start!67722 res!531821) b!785630))

(assert (= (and b!785630 res!531824) b!785635))

(assert (= (and b!785635 res!531817) b!785627))

(assert (= (and b!785627 res!531830) b!785642))

(assert (= (and b!785642 res!531829) b!785634))

(assert (= (and b!785634 res!531818) b!785633))

(assert (= (and b!785633 res!531822) b!785624))

(assert (= (and b!785624 res!531826) b!785641))

(assert (= (and b!785641 res!531814) b!785621))

(assert (= (and b!785621 res!531812) b!785638))

(assert (= (and b!785638 res!531813) b!785640))

(assert (= (and b!785640 c!87313) b!785636))

(assert (= (and b!785640 (not c!87313)) b!785632))

(assert (= (and b!785640 res!531816) b!785637))

(assert (= (and b!785637 res!531828) b!785631))

(assert (= (and b!785631 res!531819) b!785626))

(assert (= (and b!785631 (not res!531815)) b!785623))

(assert (= (and b!785623 (not res!531820)) b!785625))

(assert (= (and b!785625 (not res!531827)) b!785628))

(assert (= (and b!785628 c!87312) b!785622))

(assert (= (and b!785628 (not c!87312)) b!785639))

(assert (= (and b!785628 res!531825) b!785643))

(assert (= (and b!785643 res!531823) b!785629))

(declare-fun m!727649 () Bool)

(assert (=> b!785631 m!727649))

(assert (=> b!785631 m!727649))

(declare-fun m!727651 () Bool)

(assert (=> b!785631 m!727651))

(declare-fun m!727653 () Bool)

(assert (=> b!785631 m!727653))

(declare-fun m!727655 () Bool)

(assert (=> b!785631 m!727655))

(declare-fun m!727657 () Bool)

(assert (=> b!785638 m!727657))

(assert (=> b!785621 m!727649))

(assert (=> b!785621 m!727649))

(declare-fun m!727659 () Bool)

(assert (=> b!785621 m!727659))

(assert (=> b!785621 m!727659))

(assert (=> b!785621 m!727649))

(declare-fun m!727661 () Bool)

(assert (=> b!785621 m!727661))

(declare-fun m!727663 () Bool)

(assert (=> b!785637 m!727663))

(declare-fun m!727665 () Bool)

(assert (=> b!785637 m!727665))

(declare-fun m!727667 () Bool)

(assert (=> b!785637 m!727667))

(declare-fun m!727669 () Bool)

(assert (=> b!785637 m!727669))

(assert (=> b!785637 m!727669))

(declare-fun m!727671 () Bool)

(assert (=> b!785637 m!727671))

(declare-fun m!727673 () Bool)

(assert (=> b!785627 m!727673))

(declare-fun m!727675 () Bool)

(assert (=> b!785643 m!727675))

(declare-fun m!727677 () Bool)

(assert (=> b!785643 m!727677))

(declare-fun m!727679 () Bool)

(assert (=> b!785642 m!727679))

(assert (=> b!785623 m!727649))

(assert (=> b!785623 m!727649))

(declare-fun m!727681 () Bool)

(assert (=> b!785623 m!727681))

(assert (=> b!785632 m!727649))

(assert (=> b!785632 m!727649))

(assert (=> b!785632 m!727681))

(assert (=> b!785625 m!727663))

(declare-fun m!727683 () Bool)

(assert (=> b!785625 m!727683))

(declare-fun m!727685 () Bool)

(assert (=> b!785634 m!727685))

(assert (=> b!785636 m!727649))

(assert (=> b!785636 m!727649))

(declare-fun m!727687 () Bool)

(assert (=> b!785636 m!727687))

(assert (=> b!785635 m!727649))

(assert (=> b!785635 m!727649))

(declare-fun m!727689 () Bool)

(assert (=> b!785635 m!727689))

(declare-fun m!727691 () Bool)

(assert (=> b!785624 m!727691))

(declare-fun m!727693 () Bool)

(assert (=> start!67722 m!727693))

(declare-fun m!727695 () Bool)

(assert (=> start!67722 m!727695))

(declare-fun m!727697 () Bool)

(assert (=> b!785633 m!727697))

(assert (=> b!785626 m!727649))

(assert (=> b!785626 m!727649))

(declare-fun m!727699 () Bool)

(assert (=> b!785626 m!727699))

(push 1)

