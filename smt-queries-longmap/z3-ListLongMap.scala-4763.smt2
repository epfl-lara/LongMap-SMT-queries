; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65766 () Bool)

(assert start!65766)

(declare-fun b!752176 () Bool)

(declare-fun e!419670 () Bool)

(declare-fun e!419663 () Bool)

(assert (=> b!752176 (= e!419670 e!419663)))

(declare-fun res!507624 () Bool)

(assert (=> b!752176 (=> res!507624 e!419663)))

(declare-fun lt!334499 () (_ BitVec 64))

(declare-fun lt!334492 () (_ BitVec 64))

(assert (=> b!752176 (= res!507624 (= lt!334499 lt!334492))))

(declare-datatypes ((array!41809 0))(
  ( (array!41810 (arr!20014 (Array (_ BitVec 32) (_ BitVec 64))) (size!20434 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41809)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752176 (= lt!334499 (select (store (arr!20014 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!419671 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7570 0))(
  ( (MissingZero!7570 (index!32648 (_ BitVec 32))) (Found!7570 (index!32649 (_ BitVec 32))) (Intermediate!7570 (undefined!8382 Bool) (index!32650 (_ BitVec 32)) (x!63732 (_ BitVec 32))) (Undefined!7570) (MissingVacant!7570 (index!32651 (_ BitVec 32))) )
))
(declare-fun lt!334491 () SeekEntryResult!7570)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!752177 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41809 (_ BitVec 32)) SeekEntryResult!7570)

(assert (=> b!752177 (= e!419671 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20014 a!3186) j!159) a!3186 mask!3328) lt!334491))))

(declare-fun b!752178 () Bool)

(declare-datatypes ((Unit!25837 0))(
  ( (Unit!25838) )
))
(declare-fun e!419666 () Unit!25837)

(declare-fun Unit!25839 () Unit!25837)

(assert (=> b!752178 (= e!419666 Unit!25839)))

(assert (=> b!752178 false))

(declare-fun b!752179 () Bool)

(declare-fun res!507621 () Bool)

(declare-fun e!419669 () Bool)

(assert (=> b!752179 (=> (not res!507621) (not e!419669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752179 (= res!507621 (validKeyInArray!0 (select (arr!20014 a!3186) j!159)))))

(declare-fun res!507611 () Bool)

(assert (=> start!65766 (=> (not res!507611) (not e!419669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65766 (= res!507611 (validMask!0 mask!3328))))

(assert (=> start!65766 e!419669))

(assert (=> start!65766 true))

(declare-fun array_inv!15873 (array!41809) Bool)

(assert (=> start!65766 (array_inv!15873 a!3186)))

(declare-fun lt!334494 () SeekEntryResult!7570)

(declare-fun e!419664 () Bool)

(declare-fun b!752180 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41809 (_ BitVec 32)) SeekEntryResult!7570)

(assert (=> b!752180 (= e!419664 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20014 a!3186) j!159) a!3186 mask!3328) lt!334494))))

(declare-fun b!752181 () Bool)

(declare-fun res!507612 () Bool)

(assert (=> b!752181 (=> (not res!507612) (not e!419669))))

(assert (=> b!752181 (= res!507612 (validKeyInArray!0 k0!2102))))

(declare-fun b!752182 () Bool)

(declare-fun res!507628 () Bool)

(assert (=> b!752182 (=> (not res!507628) (not e!419669))))

(declare-fun arrayContainsKey!0 (array!41809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752182 (= res!507628 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752183 () Bool)

(declare-fun res!507625 () Bool)

(declare-fun e!419665 () Bool)

(assert (=> b!752183 (=> (not res!507625) (not e!419665))))

(assert (=> b!752183 (= res!507625 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20014 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752184 () Bool)

(declare-fun Unit!25840 () Unit!25837)

(assert (=> b!752184 (= e!419666 Unit!25840)))

(declare-fun b!752185 () Bool)

(declare-fun e!419673 () Bool)

(assert (=> b!752185 (= e!419669 e!419673)))

(declare-fun res!507614 () Bool)

(assert (=> b!752185 (=> (not res!507614) (not e!419673))))

(declare-fun lt!334493 () SeekEntryResult!7570)

(assert (=> b!752185 (= res!507614 (or (= lt!334493 (MissingZero!7570 i!1173)) (= lt!334493 (MissingVacant!7570 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41809 (_ BitVec 32)) SeekEntryResult!7570)

(assert (=> b!752185 (= lt!334493 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752186 () Bool)

(declare-fun res!507626 () Bool)

(assert (=> b!752186 (=> (not res!507626) (not e!419665))))

(assert (=> b!752186 (= res!507626 e!419664)))

(declare-fun c!82666 () Bool)

(assert (=> b!752186 (= c!82666 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752187 () Bool)

(declare-fun res!507623 () Bool)

(assert (=> b!752187 (=> res!507623 e!419670)))

(assert (=> b!752187 (= res!507623 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20014 a!3186) j!159) a!3186 mask!3328) lt!334491)))))

(declare-fun b!752188 () Bool)

(declare-fun res!507627 () Bool)

(assert (=> b!752188 (=> (not res!507627) (not e!419673))))

(assert (=> b!752188 (= res!507627 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20434 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20434 a!3186))))))

(declare-fun b!752189 () Bool)

(declare-fun res!507618 () Bool)

(assert (=> b!752189 (=> (not res!507618) (not e!419673))))

(declare-datatypes ((List!13923 0))(
  ( (Nil!13920) (Cons!13919 (h!14997 (_ BitVec 64)) (t!20230 List!13923)) )
))
(declare-fun arrayNoDuplicates!0 (array!41809 (_ BitVec 32) List!13923) Bool)

(assert (=> b!752189 (= res!507618 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13920))))

(declare-fun e!419667 () Bool)

(declare-fun lt!334497 () array!41809)

(declare-fun b!752190 () Bool)

(assert (=> b!752190 (= e!419667 (= (seekEntryOrOpen!0 lt!334492 lt!334497 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334492 lt!334497 mask!3328)))))

(declare-fun b!752191 () Bool)

(assert (=> b!752191 (= e!419664 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20014 a!3186) j!159) a!3186 mask!3328) (Found!7570 j!159)))))

(declare-fun b!752192 () Bool)

(declare-fun e!419672 () Bool)

(assert (=> b!752192 (= e!419665 e!419672)))

(declare-fun res!507613 () Bool)

(assert (=> b!752192 (=> (not res!507613) (not e!419672))))

(declare-fun lt!334496 () SeekEntryResult!7570)

(declare-fun lt!334490 () SeekEntryResult!7570)

(assert (=> b!752192 (= res!507613 (= lt!334496 lt!334490))))

(assert (=> b!752192 (= lt!334490 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334492 lt!334497 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752192 (= lt!334496 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334492 mask!3328) lt!334492 lt!334497 mask!3328))))

(assert (=> b!752192 (= lt!334492 (select (store (arr!20014 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752192 (= lt!334497 (array!41810 (store (arr!20014 a!3186) i!1173 k0!2102) (size!20434 a!3186)))))

(declare-fun b!752193 () Bool)

(declare-fun res!507616 () Bool)

(assert (=> b!752193 (=> (not res!507616) (not e!419673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41809 (_ BitVec 32)) Bool)

(assert (=> b!752193 (= res!507616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752194 () Bool)

(assert (=> b!752194 (= e!419663 true)))

(assert (=> b!752194 e!419667))

(declare-fun res!507617 () Bool)

(assert (=> b!752194 (=> (not res!507617) (not e!419667))))

(assert (=> b!752194 (= res!507617 (= lt!334499 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334498 () Unit!25837)

(assert (=> b!752194 (= lt!334498 e!419666)))

(declare-fun c!82667 () Bool)

(assert (=> b!752194 (= c!82667 (= lt!334499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752195 () Bool)

(assert (=> b!752195 (= e!419672 (not e!419670))))

(declare-fun res!507622 () Bool)

(assert (=> b!752195 (=> res!507622 e!419670)))

(get-info :version)

(assert (=> b!752195 (= res!507622 (or (not ((_ is Intermediate!7570) lt!334490)) (bvslt x!1131 (x!63732 lt!334490)) (not (= x!1131 (x!63732 lt!334490))) (not (= index!1321 (index!32650 lt!334490)))))))

(assert (=> b!752195 e!419671))

(declare-fun res!507619 () Bool)

(assert (=> b!752195 (=> (not res!507619) (not e!419671))))

(declare-fun lt!334495 () SeekEntryResult!7570)

(assert (=> b!752195 (= res!507619 (= lt!334495 lt!334491))))

(assert (=> b!752195 (= lt!334491 (Found!7570 j!159))))

(assert (=> b!752195 (= lt!334495 (seekEntryOrOpen!0 (select (arr!20014 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752195 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334500 () Unit!25837)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25837)

(assert (=> b!752195 (= lt!334500 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752196 () Bool)

(declare-fun res!507620 () Bool)

(assert (=> b!752196 (=> (not res!507620) (not e!419669))))

(assert (=> b!752196 (= res!507620 (and (= (size!20434 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20434 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20434 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752197 () Bool)

(assert (=> b!752197 (= e!419673 e!419665)))

(declare-fun res!507615 () Bool)

(assert (=> b!752197 (=> (not res!507615) (not e!419665))))

(assert (=> b!752197 (= res!507615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20014 a!3186) j!159) mask!3328) (select (arr!20014 a!3186) j!159) a!3186 mask!3328) lt!334494))))

(assert (=> b!752197 (= lt!334494 (Intermediate!7570 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65766 res!507611) b!752196))

(assert (= (and b!752196 res!507620) b!752179))

(assert (= (and b!752179 res!507621) b!752181))

(assert (= (and b!752181 res!507612) b!752182))

(assert (= (and b!752182 res!507628) b!752185))

(assert (= (and b!752185 res!507614) b!752193))

(assert (= (and b!752193 res!507616) b!752189))

(assert (= (and b!752189 res!507618) b!752188))

(assert (= (and b!752188 res!507627) b!752197))

(assert (= (and b!752197 res!507615) b!752183))

(assert (= (and b!752183 res!507625) b!752186))

(assert (= (and b!752186 c!82666) b!752180))

(assert (= (and b!752186 (not c!82666)) b!752191))

(assert (= (and b!752186 res!507626) b!752192))

(assert (= (and b!752192 res!507613) b!752195))

(assert (= (and b!752195 res!507619) b!752177))

(assert (= (and b!752195 (not res!507622)) b!752187))

(assert (= (and b!752187 (not res!507623)) b!752176))

(assert (= (and b!752176 (not res!507624)) b!752194))

(assert (= (and b!752194 c!82667) b!752178))

(assert (= (and b!752194 (not c!82667)) b!752184))

(assert (= (and b!752194 res!507617) b!752190))

(declare-fun m!701775 () Bool)

(assert (=> b!752181 m!701775))

(declare-fun m!701777 () Bool)

(assert (=> b!752193 m!701777))

(declare-fun m!701779 () Bool)

(assert (=> b!752190 m!701779))

(declare-fun m!701781 () Bool)

(assert (=> b!752190 m!701781))

(declare-fun m!701783 () Bool)

(assert (=> b!752185 m!701783))

(declare-fun m!701785 () Bool)

(assert (=> b!752189 m!701785))

(declare-fun m!701787 () Bool)

(assert (=> start!65766 m!701787))

(declare-fun m!701789 () Bool)

(assert (=> start!65766 m!701789))

(declare-fun m!701791 () Bool)

(assert (=> b!752177 m!701791))

(assert (=> b!752177 m!701791))

(declare-fun m!701793 () Bool)

(assert (=> b!752177 m!701793))

(assert (=> b!752180 m!701791))

(assert (=> b!752180 m!701791))

(declare-fun m!701795 () Bool)

(assert (=> b!752180 m!701795))

(assert (=> b!752191 m!701791))

(assert (=> b!752191 m!701791))

(declare-fun m!701797 () Bool)

(assert (=> b!752191 m!701797))

(declare-fun m!701799 () Bool)

(assert (=> b!752192 m!701799))

(declare-fun m!701801 () Bool)

(assert (=> b!752192 m!701801))

(declare-fun m!701803 () Bool)

(assert (=> b!752192 m!701803))

(declare-fun m!701805 () Bool)

(assert (=> b!752192 m!701805))

(assert (=> b!752192 m!701799))

(declare-fun m!701807 () Bool)

(assert (=> b!752192 m!701807))

(declare-fun m!701809 () Bool)

(assert (=> b!752182 m!701809))

(assert (=> b!752187 m!701791))

(assert (=> b!752187 m!701791))

(assert (=> b!752187 m!701797))

(assert (=> b!752195 m!701791))

(assert (=> b!752195 m!701791))

(declare-fun m!701811 () Bool)

(assert (=> b!752195 m!701811))

(declare-fun m!701813 () Bool)

(assert (=> b!752195 m!701813))

(declare-fun m!701815 () Bool)

(assert (=> b!752195 m!701815))

(assert (=> b!752179 m!701791))

(assert (=> b!752179 m!701791))

(declare-fun m!701817 () Bool)

(assert (=> b!752179 m!701817))

(declare-fun m!701819 () Bool)

(assert (=> b!752183 m!701819))

(assert (=> b!752176 m!701805))

(declare-fun m!701821 () Bool)

(assert (=> b!752176 m!701821))

(assert (=> b!752197 m!701791))

(assert (=> b!752197 m!701791))

(declare-fun m!701823 () Bool)

(assert (=> b!752197 m!701823))

(assert (=> b!752197 m!701823))

(assert (=> b!752197 m!701791))

(declare-fun m!701825 () Bool)

(assert (=> b!752197 m!701825))

(check-sat (not b!752189) (not b!752191) (not b!752193) (not b!752179) (not b!752181) (not b!752185) (not b!752192) (not b!752195) (not b!752187) (not b!752177) (not b!752197) (not start!65766) (not b!752182) (not b!752180) (not b!752190))
(check-sat)
