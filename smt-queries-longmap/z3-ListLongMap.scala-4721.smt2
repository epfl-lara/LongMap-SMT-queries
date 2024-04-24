; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65514 () Bool)

(assert start!65514)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41557 0))(
  ( (array!41558 (arr!19888 (Array (_ BitVec 32) (_ BitVec 64))) (size!20308 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41557)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7444 0))(
  ( (MissingZero!7444 (index!32144 (_ BitVec 32))) (Found!7444 (index!32145 (_ BitVec 32))) (Intermediate!7444 (undefined!8256 Bool) (index!32146 (_ BitVec 32)) (x!63270 (_ BitVec 32))) (Undefined!7444) (MissingVacant!7444 (index!32147 (_ BitVec 32))) )
))
(declare-fun lt!330744 () SeekEntryResult!7444)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!744592 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!416048 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41557 (_ BitVec 32)) SeekEntryResult!7444)

(assert (=> b!744592 (= e!416048 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19888 a!3186) j!159) a!3186 mask!3328) lt!330744))))

(declare-fun b!744593 () Bool)

(declare-fun res!501210 () Bool)

(declare-fun e!416044 () Bool)

(assert (=> b!744593 (=> (not res!501210) (not e!416044))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744593 (= res!501210 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744594 () Bool)

(declare-fun res!501214 () Bool)

(assert (=> b!744594 (=> (not res!501214) (not e!416044))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744594 (= res!501214 (and (= (size!20308 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20308 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20308 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744595 () Bool)

(declare-fun e!416043 () Bool)

(assert (=> b!744595 (= e!416043 e!416048)))

(declare-fun res!501215 () Bool)

(assert (=> b!744595 (=> (not res!501215) (not e!416048))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41557 (_ BitVec 32)) SeekEntryResult!7444)

(assert (=> b!744595 (= res!501215 (= (seekEntryOrOpen!0 (select (arr!19888 a!3186) j!159) a!3186 mask!3328) lt!330744))))

(assert (=> b!744595 (= lt!330744 (Found!7444 j!159))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!744596 () Bool)

(declare-fun e!416047 () Bool)

(declare-fun lt!330740 () (_ BitVec 64))

(assert (=> b!744596 (= e!416047 (or (= (select (store (arr!19888 a!3186) i!1173 k0!2102) index!1321) lt!330740) (not (= (select (store (arr!19888 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun lt!330743 () SeekEntryResult!7444)

(declare-fun b!744597 () Bool)

(declare-fun e!416049 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41557 (_ BitVec 32)) SeekEntryResult!7444)

(assert (=> b!744597 (= e!416049 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19888 a!3186) j!159) a!3186 mask!3328) lt!330743))))

(declare-fun b!744598 () Bool)

(declare-fun res!501213 () Bool)

(declare-fun e!416046 () Bool)

(assert (=> b!744598 (=> (not res!501213) (not e!416046))))

(assert (=> b!744598 (= res!501213 e!416049)))

(declare-fun c!82079 () Bool)

(assert (=> b!744598 (= c!82079 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744599 () Bool)

(declare-fun res!501212 () Bool)

(assert (=> b!744599 (=> res!501212 e!416047)))

(assert (=> b!744599 (= res!501212 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19888 a!3186) j!159) a!3186 mask!3328) (Found!7444 j!159))))))

(declare-fun b!744600 () Bool)

(declare-fun res!501206 () Bool)

(declare-fun e!416041 () Bool)

(assert (=> b!744600 (=> (not res!501206) (not e!416041))))

(declare-datatypes ((List!13797 0))(
  ( (Nil!13794) (Cons!13793 (h!14871 (_ BitVec 64)) (t!20104 List!13797)) )
))
(declare-fun arrayNoDuplicates!0 (array!41557 (_ BitVec 32) List!13797) Bool)

(assert (=> b!744600 (= res!501206 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13794))))

(declare-fun b!744601 () Bool)

(declare-fun e!416045 () Bool)

(assert (=> b!744601 (= e!416046 e!416045)))

(declare-fun res!501217 () Bool)

(assert (=> b!744601 (=> (not res!501217) (not e!416045))))

(declare-fun lt!330746 () SeekEntryResult!7444)

(declare-fun lt!330745 () SeekEntryResult!7444)

(assert (=> b!744601 (= res!501217 (= lt!330746 lt!330745))))

(declare-fun lt!330742 () array!41557)

(assert (=> b!744601 (= lt!330745 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330740 lt!330742 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744601 (= lt!330746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330740 mask!3328) lt!330740 lt!330742 mask!3328))))

(assert (=> b!744601 (= lt!330740 (select (store (arr!19888 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744601 (= lt!330742 (array!41558 (store (arr!19888 a!3186) i!1173 k0!2102) (size!20308 a!3186)))))

(declare-fun b!744603 () Bool)

(declare-fun res!501205 () Bool)

(assert (=> b!744603 (=> (not res!501205) (not e!416044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744603 (= res!501205 (validKeyInArray!0 k0!2102))))

(declare-fun b!744604 () Bool)

(declare-fun res!501216 () Bool)

(assert (=> b!744604 (=> (not res!501216) (not e!416041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41557 (_ BitVec 32)) Bool)

(assert (=> b!744604 (= res!501216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744605 () Bool)

(declare-fun res!501211 () Bool)

(assert (=> b!744605 (=> (not res!501211) (not e!416041))))

(assert (=> b!744605 (= res!501211 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20308 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20308 a!3186))))))

(declare-fun b!744606 () Bool)

(assert (=> b!744606 (= e!416044 e!416041)))

(declare-fun res!501201 () Bool)

(assert (=> b!744606 (=> (not res!501201) (not e!416041))))

(declare-fun lt!330747 () SeekEntryResult!7444)

(assert (=> b!744606 (= res!501201 (or (= lt!330747 (MissingZero!7444 i!1173)) (= lt!330747 (MissingVacant!7444 i!1173))))))

(assert (=> b!744606 (= lt!330747 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744607 () Bool)

(assert (=> b!744607 (= e!416049 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19888 a!3186) j!159) a!3186 mask!3328) (Found!7444 j!159)))))

(declare-fun b!744608 () Bool)

(declare-fun res!501203 () Bool)

(assert (=> b!744608 (=> (not res!501203) (not e!416044))))

(assert (=> b!744608 (= res!501203 (validKeyInArray!0 (select (arr!19888 a!3186) j!159)))))

(declare-fun b!744609 () Bool)

(assert (=> b!744609 (= e!416041 e!416046)))

(declare-fun res!501204 () Bool)

(assert (=> b!744609 (=> (not res!501204) (not e!416046))))

(assert (=> b!744609 (= res!501204 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19888 a!3186) j!159) mask!3328) (select (arr!19888 a!3186) j!159) a!3186 mask!3328) lt!330743))))

(assert (=> b!744609 (= lt!330743 (Intermediate!7444 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744610 () Bool)

(assert (=> b!744610 (= e!416045 (not e!416047))))

(declare-fun res!501209 () Bool)

(assert (=> b!744610 (=> res!501209 e!416047)))

(get-info :version)

(assert (=> b!744610 (= res!501209 (or (not ((_ is Intermediate!7444) lt!330745)) (bvslt x!1131 (x!63270 lt!330745)) (not (= x!1131 (x!63270 lt!330745))) (not (= index!1321 (index!32146 lt!330745)))))))

(assert (=> b!744610 e!416043))

(declare-fun res!501207 () Bool)

(assert (=> b!744610 (=> (not res!501207) (not e!416043))))

(assert (=> b!744610 (= res!501207 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25447 0))(
  ( (Unit!25448) )
))
(declare-fun lt!330741 () Unit!25447)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25447)

(assert (=> b!744610 (= lt!330741 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744602 () Bool)

(declare-fun res!501208 () Bool)

(assert (=> b!744602 (=> (not res!501208) (not e!416046))))

(assert (=> b!744602 (= res!501208 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19888 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!501202 () Bool)

(assert (=> start!65514 (=> (not res!501202) (not e!416044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65514 (= res!501202 (validMask!0 mask!3328))))

(assert (=> start!65514 e!416044))

(assert (=> start!65514 true))

(declare-fun array_inv!15747 (array!41557) Bool)

(assert (=> start!65514 (array_inv!15747 a!3186)))

(assert (= (and start!65514 res!501202) b!744594))

(assert (= (and b!744594 res!501214) b!744608))

(assert (= (and b!744608 res!501203) b!744603))

(assert (= (and b!744603 res!501205) b!744593))

(assert (= (and b!744593 res!501210) b!744606))

(assert (= (and b!744606 res!501201) b!744604))

(assert (= (and b!744604 res!501216) b!744600))

(assert (= (and b!744600 res!501206) b!744605))

(assert (= (and b!744605 res!501211) b!744609))

(assert (= (and b!744609 res!501204) b!744602))

(assert (= (and b!744602 res!501208) b!744598))

(assert (= (and b!744598 c!82079) b!744597))

(assert (= (and b!744598 (not c!82079)) b!744607))

(assert (= (and b!744598 res!501213) b!744601))

(assert (= (and b!744601 res!501217) b!744610))

(assert (= (and b!744610 res!501207) b!744595))

(assert (= (and b!744595 res!501215) b!744592))

(assert (= (and b!744610 (not res!501209)) b!744599))

(assert (= (and b!744599 (not res!501212)) b!744596))

(declare-fun m!695625 () Bool)

(assert (=> b!744610 m!695625))

(declare-fun m!695627 () Bool)

(assert (=> b!744610 m!695627))

(declare-fun m!695629 () Bool)

(assert (=> b!744603 m!695629))

(declare-fun m!695631 () Bool)

(assert (=> b!744597 m!695631))

(assert (=> b!744597 m!695631))

(declare-fun m!695633 () Bool)

(assert (=> b!744597 m!695633))

(assert (=> b!744592 m!695631))

(assert (=> b!744592 m!695631))

(declare-fun m!695635 () Bool)

(assert (=> b!744592 m!695635))

(declare-fun m!695637 () Bool)

(assert (=> b!744600 m!695637))

(assert (=> b!744608 m!695631))

(assert (=> b!744608 m!695631))

(declare-fun m!695639 () Bool)

(assert (=> b!744608 m!695639))

(assert (=> b!744599 m!695631))

(assert (=> b!744599 m!695631))

(declare-fun m!695641 () Bool)

(assert (=> b!744599 m!695641))

(declare-fun m!695643 () Bool)

(assert (=> b!744596 m!695643))

(declare-fun m!695645 () Bool)

(assert (=> b!744596 m!695645))

(declare-fun m!695647 () Bool)

(assert (=> b!744593 m!695647))

(assert (=> b!744595 m!695631))

(assert (=> b!744595 m!695631))

(declare-fun m!695649 () Bool)

(assert (=> b!744595 m!695649))

(assert (=> b!744607 m!695631))

(assert (=> b!744607 m!695631))

(assert (=> b!744607 m!695641))

(declare-fun m!695651 () Bool)

(assert (=> b!744606 m!695651))

(declare-fun m!695653 () Bool)

(assert (=> b!744604 m!695653))

(assert (=> b!744609 m!695631))

(assert (=> b!744609 m!695631))

(declare-fun m!695655 () Bool)

(assert (=> b!744609 m!695655))

(assert (=> b!744609 m!695655))

(assert (=> b!744609 m!695631))

(declare-fun m!695657 () Bool)

(assert (=> b!744609 m!695657))

(declare-fun m!695659 () Bool)

(assert (=> start!65514 m!695659))

(declare-fun m!695661 () Bool)

(assert (=> start!65514 m!695661))

(declare-fun m!695663 () Bool)

(assert (=> b!744602 m!695663))

(declare-fun m!695665 () Bool)

(assert (=> b!744601 m!695665))

(assert (=> b!744601 m!695643))

(declare-fun m!695667 () Bool)

(assert (=> b!744601 m!695667))

(declare-fun m!695669 () Bool)

(assert (=> b!744601 m!695669))

(assert (=> b!744601 m!695665))

(declare-fun m!695671 () Bool)

(assert (=> b!744601 m!695671))

(check-sat (not b!744608) (not b!744597) (not b!744604) (not start!65514) (not b!744592) (not b!744595) (not b!744606) (not b!744609) (not b!744593) (not b!744601) (not b!744603) (not b!744607) (not b!744610) (not b!744600) (not b!744599))
(check-sat)
