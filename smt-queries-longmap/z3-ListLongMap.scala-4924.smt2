; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67766 () Bool)

(assert start!67766)

(declare-fun b!787648 () Bool)

(declare-fun e!437784 () Bool)

(declare-datatypes ((SeekEntryResult!8098 0))(
  ( (MissingZero!8098 (index!34760 (_ BitVec 32))) (Found!8098 (index!34761 (_ BitVec 32))) (Intermediate!8098 (undefined!8910 Bool) (index!34762 (_ BitVec 32)) (x!65705 (_ BitVec 32))) (Undefined!8098) (MissingVacant!8098 (index!34763 (_ BitVec 32))) )
))
(declare-fun lt!351253 () SeekEntryResult!8098)

(declare-fun lt!351257 () SeekEntryResult!8098)

(assert (=> b!787648 (= e!437784 (= lt!351253 lt!351257))))

(declare-fun b!787649 () Bool)

(declare-fun res!533595 () Bool)

(declare-fun e!437788 () Bool)

(assert (=> b!787649 (=> (not res!533595) (not e!437788))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42825 0))(
  ( (array!42826 (arr!20501 (Array (_ BitVec 32) (_ BitVec 64))) (size!20922 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42825)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787649 (= res!533595 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20922 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20922 a!3186))))))

(declare-fun b!787650 () Bool)

(declare-fun e!437786 () Bool)

(declare-fun e!437794 () Bool)

(assert (=> b!787650 (= e!437786 e!437794)))

(declare-fun res!533593 () Bool)

(assert (=> b!787650 (=> res!533593 e!437794)))

(declare-fun lt!351260 () (_ BitVec 64))

(declare-fun lt!351252 () (_ BitVec 64))

(assert (=> b!787650 (= res!533593 (= lt!351260 lt!351252))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!787650 (= lt!351260 (select (store (arr!20501 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787651 () Bool)

(declare-fun e!437790 () Bool)

(declare-fun e!437785 () Bool)

(assert (=> b!787651 (= e!437790 (not e!437785))))

(declare-fun res!533585 () Bool)

(assert (=> b!787651 (=> res!533585 e!437785)))

(declare-fun lt!351254 () SeekEntryResult!8098)

(get-info :version)

(assert (=> b!787651 (= res!533585 (or (not ((_ is Intermediate!8098) lt!351254)) (bvslt x!1131 (x!65705 lt!351254)) (not (= x!1131 (x!65705 lt!351254))) (not (= index!1321 (index!34762 lt!351254)))))))

(declare-fun e!437787 () Bool)

(assert (=> b!787651 e!437787))

(declare-fun res!533598 () Bool)

(assert (=> b!787651 (=> (not res!533598) (not e!437787))))

(declare-fun lt!351249 () SeekEntryResult!8098)

(assert (=> b!787651 (= res!533598 (= lt!351253 lt!351249))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!787651 (= lt!351249 (Found!8098 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42825 (_ BitVec 32)) SeekEntryResult!8098)

(assert (=> b!787651 (= lt!351253 (seekEntryOrOpen!0 (select (arr!20501 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42825 (_ BitVec 32)) Bool)

(assert (=> b!787651 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27260 0))(
  ( (Unit!27261) )
))
(declare-fun lt!351258 () Unit!27260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27260)

(assert (=> b!787651 (= lt!351258 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!351259 () SeekEntryResult!8098)

(declare-fun b!787652 () Bool)

(declare-fun e!437783 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42825 (_ BitVec 32)) SeekEntryResult!8098)

(assert (=> b!787652 (= e!437783 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20501 a!3186) j!159) a!3186 mask!3328) lt!351259))))

(declare-fun b!787653 () Bool)

(declare-fun e!437792 () Bool)

(assert (=> b!787653 (= e!437792 e!437788)))

(declare-fun res!533586 () Bool)

(assert (=> b!787653 (=> (not res!533586) (not e!437788))))

(declare-fun lt!351250 () SeekEntryResult!8098)

(assert (=> b!787653 (= res!533586 (or (= lt!351250 (MissingZero!8098 i!1173)) (= lt!351250 (MissingVacant!8098 i!1173))))))

(assert (=> b!787653 (= lt!351250 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787654 () Bool)

(declare-fun res!533583 () Bool)

(assert (=> b!787654 (=> (not res!533583) (not e!437792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787654 (= res!533583 (validKeyInArray!0 k0!2102))))

(declare-fun b!787655 () Bool)

(declare-fun e!437789 () Bool)

(assert (=> b!787655 (= e!437789 e!437790)))

(declare-fun res!533596 () Bool)

(assert (=> b!787655 (=> (not res!533596) (not e!437790))))

(declare-fun lt!351255 () SeekEntryResult!8098)

(assert (=> b!787655 (= res!533596 (= lt!351255 lt!351254))))

(declare-fun lt!351251 () array!42825)

(assert (=> b!787655 (= lt!351254 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351252 lt!351251 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787655 (= lt!351255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351252 mask!3328) lt!351252 lt!351251 mask!3328))))

(assert (=> b!787655 (= lt!351252 (select (store (arr!20501 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787655 (= lt!351251 (array!42826 (store (arr!20501 a!3186) i!1173 k0!2102) (size!20922 a!3186)))))

(declare-fun b!787656 () Bool)

(assert (=> b!787656 (= e!437788 e!437789)))

(declare-fun res!533592 () Bool)

(assert (=> b!787656 (=> (not res!533592) (not e!437789))))

(assert (=> b!787656 (= res!533592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20501 a!3186) j!159) mask!3328) (select (arr!20501 a!3186) j!159) a!3186 mask!3328) lt!351259))))

(assert (=> b!787656 (= lt!351259 (Intermediate!8098 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787657 () Bool)

(declare-fun res!533594 () Bool)

(assert (=> b!787657 (=> (not res!533594) (not e!437784))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42825 (_ BitVec 32)) SeekEntryResult!8098)

(assert (=> b!787657 (= res!533594 (= (seekEntryOrOpen!0 lt!351252 lt!351251 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351252 lt!351251 mask!3328)))))

(declare-fun b!787658 () Bool)

(assert (=> b!787658 (= e!437794 true)))

(assert (=> b!787658 e!437784))

(declare-fun res!533591 () Bool)

(assert (=> b!787658 (=> (not res!533591) (not e!437784))))

(assert (=> b!787658 (= res!533591 (= lt!351260 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351256 () Unit!27260)

(declare-fun e!437791 () Unit!27260)

(assert (=> b!787658 (= lt!351256 e!437791)))

(declare-fun c!87440 () Bool)

(assert (=> b!787658 (= c!87440 (= lt!351260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!533588 () Bool)

(assert (=> start!67766 (=> (not res!533588) (not e!437792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67766 (= res!533588 (validMask!0 mask!3328))))

(assert (=> start!67766 e!437792))

(assert (=> start!67766 true))

(declare-fun array_inv!16384 (array!42825) Bool)

(assert (=> start!67766 (array_inv!16384 a!3186)))

(declare-fun b!787659 () Bool)

(declare-fun res!533599 () Bool)

(assert (=> b!787659 (=> (not res!533599) (not e!437792))))

(assert (=> b!787659 (= res!533599 (and (= (size!20922 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20922 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20922 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787660 () Bool)

(declare-fun res!533597 () Bool)

(assert (=> b!787660 (=> (not res!533597) (not e!437792))))

(declare-fun arrayContainsKey!0 (array!42825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787660 (= res!533597 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787661 () Bool)

(declare-fun res!533587 () Bool)

(assert (=> b!787661 (=> (not res!533587) (not e!437788))))

(declare-datatypes ((List!14542 0))(
  ( (Nil!14539) (Cons!14538 (h!15661 (_ BitVec 64)) (t!20848 List!14542)) )
))
(declare-fun arrayNoDuplicates!0 (array!42825 (_ BitVec 32) List!14542) Bool)

(assert (=> b!787661 (= res!533587 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14539))))

(declare-fun b!787662 () Bool)

(declare-fun Unit!27262 () Unit!27260)

(assert (=> b!787662 (= e!437791 Unit!27262)))

(declare-fun b!787663 () Bool)

(declare-fun Unit!27263 () Unit!27260)

(assert (=> b!787663 (= e!437791 Unit!27263)))

(assert (=> b!787663 false))

(declare-fun b!787664 () Bool)

(assert (=> b!787664 (= e!437787 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20501 a!3186) j!159) a!3186 mask!3328) lt!351249))))

(declare-fun b!787665 () Bool)

(declare-fun res!533590 () Bool)

(assert (=> b!787665 (=> (not res!533590) (not e!437792))))

(assert (=> b!787665 (= res!533590 (validKeyInArray!0 (select (arr!20501 a!3186) j!159)))))

(declare-fun b!787666 () Bool)

(declare-fun res!533589 () Bool)

(assert (=> b!787666 (=> (not res!533589) (not e!437788))))

(assert (=> b!787666 (= res!533589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787667 () Bool)

(declare-fun res!533601 () Bool)

(assert (=> b!787667 (=> (not res!533601) (not e!437789))))

(assert (=> b!787667 (= res!533601 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20501 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787668 () Bool)

(assert (=> b!787668 (= e!437785 e!437786)))

(declare-fun res!533600 () Bool)

(assert (=> b!787668 (=> res!533600 e!437786)))

(assert (=> b!787668 (= res!533600 (not (= lt!351257 lt!351249)))))

(assert (=> b!787668 (= lt!351257 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20501 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787669 () Bool)

(assert (=> b!787669 (= e!437783 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20501 a!3186) j!159) a!3186 mask!3328) (Found!8098 j!159)))))

(declare-fun b!787670 () Bool)

(declare-fun res!533584 () Bool)

(assert (=> b!787670 (=> (not res!533584) (not e!437789))))

(assert (=> b!787670 (= res!533584 e!437783)))

(declare-fun c!87441 () Bool)

(assert (=> b!787670 (= c!87441 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67766 res!533588) b!787659))

(assert (= (and b!787659 res!533599) b!787665))

(assert (= (and b!787665 res!533590) b!787654))

(assert (= (and b!787654 res!533583) b!787660))

(assert (= (and b!787660 res!533597) b!787653))

(assert (= (and b!787653 res!533586) b!787666))

(assert (= (and b!787666 res!533589) b!787661))

(assert (= (and b!787661 res!533587) b!787649))

(assert (= (and b!787649 res!533595) b!787656))

(assert (= (and b!787656 res!533592) b!787667))

(assert (= (and b!787667 res!533601) b!787670))

(assert (= (and b!787670 c!87441) b!787652))

(assert (= (and b!787670 (not c!87441)) b!787669))

(assert (= (and b!787670 res!533584) b!787655))

(assert (= (and b!787655 res!533596) b!787651))

(assert (= (and b!787651 res!533598) b!787664))

(assert (= (and b!787651 (not res!533585)) b!787668))

(assert (= (and b!787668 (not res!533600)) b!787650))

(assert (= (and b!787650 (not res!533593)) b!787658))

(assert (= (and b!787658 c!87440) b!787663))

(assert (= (and b!787658 (not c!87440)) b!787662))

(assert (= (and b!787658 res!533591) b!787657))

(assert (= (and b!787657 res!533594) b!787648))

(declare-fun m!728607 () Bool)

(assert (=> b!787666 m!728607))

(declare-fun m!728609 () Bool)

(assert (=> b!787654 m!728609))

(declare-fun m!728611 () Bool)

(assert (=> start!67766 m!728611))

(declare-fun m!728613 () Bool)

(assert (=> start!67766 m!728613))

(declare-fun m!728615 () Bool)

(assert (=> b!787660 m!728615))

(declare-fun m!728617 () Bool)

(assert (=> b!787652 m!728617))

(assert (=> b!787652 m!728617))

(declare-fun m!728619 () Bool)

(assert (=> b!787652 m!728619))

(assert (=> b!787651 m!728617))

(assert (=> b!787651 m!728617))

(declare-fun m!728621 () Bool)

(assert (=> b!787651 m!728621))

(declare-fun m!728623 () Bool)

(assert (=> b!787651 m!728623))

(declare-fun m!728625 () Bool)

(assert (=> b!787651 m!728625))

(assert (=> b!787668 m!728617))

(assert (=> b!787668 m!728617))

(declare-fun m!728627 () Bool)

(assert (=> b!787668 m!728627))

(declare-fun m!728629 () Bool)

(assert (=> b!787653 m!728629))

(declare-fun m!728631 () Bool)

(assert (=> b!787661 m!728631))

(declare-fun m!728633 () Bool)

(assert (=> b!787667 m!728633))

(assert (=> b!787656 m!728617))

(assert (=> b!787656 m!728617))

(declare-fun m!728635 () Bool)

(assert (=> b!787656 m!728635))

(assert (=> b!787656 m!728635))

(assert (=> b!787656 m!728617))

(declare-fun m!728637 () Bool)

(assert (=> b!787656 m!728637))

(assert (=> b!787665 m!728617))

(assert (=> b!787665 m!728617))

(declare-fun m!728639 () Bool)

(assert (=> b!787665 m!728639))

(declare-fun m!728641 () Bool)

(assert (=> b!787655 m!728641))

(declare-fun m!728643 () Bool)

(assert (=> b!787655 m!728643))

(assert (=> b!787655 m!728641))

(declare-fun m!728645 () Bool)

(assert (=> b!787655 m!728645))

(declare-fun m!728647 () Bool)

(assert (=> b!787655 m!728647))

(declare-fun m!728649 () Bool)

(assert (=> b!787655 m!728649))

(declare-fun m!728651 () Bool)

(assert (=> b!787657 m!728651))

(declare-fun m!728653 () Bool)

(assert (=> b!787657 m!728653))

(assert (=> b!787650 m!728645))

(declare-fun m!728655 () Bool)

(assert (=> b!787650 m!728655))

(assert (=> b!787664 m!728617))

(assert (=> b!787664 m!728617))

(declare-fun m!728657 () Bool)

(assert (=> b!787664 m!728657))

(assert (=> b!787669 m!728617))

(assert (=> b!787669 m!728617))

(assert (=> b!787669 m!728627))

(check-sat (not b!787664) (not b!787655) (not start!67766) (not b!787666) (not b!787651) (not b!787668) (not b!787656) (not b!787657) (not b!787661) (not b!787652) (not b!787669) (not b!787653) (not b!787654) (not b!787660) (not b!787665))
(check-sat)
