; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65414 () Bool)

(assert start!65414)

(declare-fun b!744618 () Bool)

(declare-fun e!415941 () Bool)

(declare-fun e!415943 () Bool)

(assert (=> b!744618 (= e!415941 e!415943)))

(declare-fun res!501584 () Bool)

(assert (=> b!744618 (=> (not res!501584) (not e!415943))))

(declare-datatypes ((SeekEntryResult!7507 0))(
  ( (MissingZero!7507 (index!32396 (_ BitVec 32))) (Found!7507 (index!32397 (_ BitVec 32))) (Intermediate!7507 (undefined!8319 Bool) (index!32398 (_ BitVec 32)) (x!63353 (_ BitVec 32))) (Undefined!7507) (MissingVacant!7507 (index!32399 (_ BitVec 32))) )
))
(declare-fun lt!330793 () SeekEntryResult!7507)

(declare-fun lt!330794 () SeekEntryResult!7507)

(assert (=> b!744618 (= res!501584 (= lt!330793 lt!330794))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41587 0))(
  ( (array!41588 (arr!19907 (Array (_ BitVec 32) (_ BitVec 64))) (size!20328 (_ BitVec 32))) )
))
(declare-fun lt!330796 () array!41587)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!330797 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41587 (_ BitVec 32)) SeekEntryResult!7507)

(assert (=> b!744618 (= lt!330794 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330797 lt!330796 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744618 (= lt!330793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330797 mask!3328) lt!330797 lt!330796 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun a!3186 () array!41587)

(assert (=> b!744618 (= lt!330797 (select (store (arr!19907 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744618 (= lt!330796 (array!41588 (store (arr!19907 a!3186) i!1173 k!2102) (size!20328 a!3186)))))

(declare-fun b!744619 () Bool)

(declare-fun res!501587 () Bool)

(declare-fun e!415942 () Bool)

(assert (=> b!744619 (=> (not res!501587) (not e!415942))))

(declare-fun arrayContainsKey!0 (array!41587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744619 (= res!501587 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744620 () Bool)

(declare-fun res!501594 () Bool)

(assert (=> b!744620 (=> (not res!501594) (not e!415942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744620 (= res!501594 (validKeyInArray!0 k!2102))))

(declare-fun b!744621 () Bool)

(declare-fun res!501589 () Bool)

(assert (=> b!744621 (=> (not res!501589) (not e!415941))))

(declare-fun e!415948 () Bool)

(assert (=> b!744621 (= res!501589 e!415948)))

(declare-fun c!81898 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744621 (= c!81898 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!330792 () SeekEntryResult!7507)

(declare-fun b!744622 () Bool)

(assert (=> b!744622 (= e!415948 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19907 a!3186) j!159) a!3186 mask!3328) lt!330792))))

(declare-fun b!744623 () Bool)

(declare-fun res!501588 () Bool)

(declare-fun e!415946 () Bool)

(assert (=> b!744623 (=> (not res!501588) (not e!415946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41587 (_ BitVec 32)) Bool)

(assert (=> b!744623 (= res!501588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744624 () Bool)

(declare-fun e!415945 () Bool)

(assert (=> b!744624 (= e!415943 (not e!415945))))

(declare-fun res!501596 () Bool)

(assert (=> b!744624 (=> res!501596 e!415945)))

(assert (=> b!744624 (= res!501596 (or (not (is-Intermediate!7507 lt!330794)) (bvslt x!1131 (x!63353 lt!330794)) (not (= x!1131 (x!63353 lt!330794))) (not (= index!1321 (index!32398 lt!330794)))))))

(declare-fun e!415949 () Bool)

(assert (=> b!744624 e!415949))

(declare-fun res!501590 () Bool)

(assert (=> b!744624 (=> (not res!501590) (not e!415949))))

(assert (=> b!744624 (= res!501590 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25494 0))(
  ( (Unit!25495) )
))
(declare-fun lt!330791 () Unit!25494)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25494)

(assert (=> b!744624 (= lt!330791 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!415944 () Bool)

(declare-fun b!744625 () Bool)

(declare-fun lt!330795 () SeekEntryResult!7507)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41587 (_ BitVec 32)) SeekEntryResult!7507)

(assert (=> b!744625 (= e!415944 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19907 a!3186) j!159) a!3186 mask!3328) lt!330795))))

(declare-fun b!744626 () Bool)

(assert (=> b!744626 (= e!415946 e!415941)))

(declare-fun res!501583 () Bool)

(assert (=> b!744626 (=> (not res!501583) (not e!415941))))

(assert (=> b!744626 (= res!501583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19907 a!3186) j!159) mask!3328) (select (arr!19907 a!3186) j!159) a!3186 mask!3328) lt!330792))))

(assert (=> b!744626 (= lt!330792 (Intermediate!7507 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744627 () Bool)

(declare-fun res!501592 () Bool)

(assert (=> b!744627 (=> res!501592 e!415945)))

(assert (=> b!744627 (= res!501592 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19907 a!3186) j!159) a!3186 mask!3328) (Found!7507 j!159))))))

(declare-fun b!744628 () Bool)

(assert (=> b!744628 (= e!415948 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19907 a!3186) j!159) a!3186 mask!3328) (Found!7507 j!159)))))

(declare-fun b!744629 () Bool)

(assert (=> b!744629 (= e!415949 e!415944)))

(declare-fun res!501591 () Bool)

(assert (=> b!744629 (=> (not res!501591) (not e!415944))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41587 (_ BitVec 32)) SeekEntryResult!7507)

(assert (=> b!744629 (= res!501591 (= (seekEntryOrOpen!0 (select (arr!19907 a!3186) j!159) a!3186 mask!3328) lt!330795))))

(assert (=> b!744629 (= lt!330795 (Found!7507 j!159))))

(declare-fun b!744630 () Bool)

(assert (=> b!744630 (= e!415942 e!415946)))

(declare-fun res!501595 () Bool)

(assert (=> b!744630 (=> (not res!501595) (not e!415946))))

(declare-fun lt!330790 () SeekEntryResult!7507)

(assert (=> b!744630 (= res!501595 (or (= lt!330790 (MissingZero!7507 i!1173)) (= lt!330790 (MissingVacant!7507 i!1173))))))

(assert (=> b!744630 (= lt!330790 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!744631 () Bool)

(assert (=> b!744631 (= e!415945 (or (= (select (store (arr!19907 a!3186) i!1173 k!2102) index!1321) lt!330797) (not (= (select (store (arr!19907 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!744632 () Bool)

(declare-fun res!501593 () Bool)

(assert (=> b!744632 (=> (not res!501593) (not e!415942))))

(assert (=> b!744632 (= res!501593 (validKeyInArray!0 (select (arr!19907 a!3186) j!159)))))

(declare-fun b!744633 () Bool)

(declare-fun res!501598 () Bool)

(assert (=> b!744633 (=> (not res!501598) (not e!415946))))

(declare-datatypes ((List!13909 0))(
  ( (Nil!13906) (Cons!13905 (h!14977 (_ BitVec 64)) (t!20224 List!13909)) )
))
(declare-fun arrayNoDuplicates!0 (array!41587 (_ BitVec 32) List!13909) Bool)

(assert (=> b!744633 (= res!501598 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13906))))

(declare-fun b!744634 () Bool)

(declare-fun res!501586 () Bool)

(assert (=> b!744634 (=> (not res!501586) (not e!415941))))

(assert (=> b!744634 (= res!501586 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19907 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744635 () Bool)

(declare-fun res!501585 () Bool)

(assert (=> b!744635 (=> (not res!501585) (not e!415942))))

(assert (=> b!744635 (= res!501585 (and (= (size!20328 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20328 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20328 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744636 () Bool)

(declare-fun res!501597 () Bool)

(assert (=> b!744636 (=> (not res!501597) (not e!415946))))

(assert (=> b!744636 (= res!501597 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20328 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20328 a!3186))))))

(declare-fun res!501599 () Bool)

(assert (=> start!65414 (=> (not res!501599) (not e!415942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65414 (= res!501599 (validMask!0 mask!3328))))

(assert (=> start!65414 e!415942))

(assert (=> start!65414 true))

(declare-fun array_inv!15703 (array!41587) Bool)

(assert (=> start!65414 (array_inv!15703 a!3186)))

(assert (= (and start!65414 res!501599) b!744635))

(assert (= (and b!744635 res!501585) b!744632))

(assert (= (and b!744632 res!501593) b!744620))

(assert (= (and b!744620 res!501594) b!744619))

(assert (= (and b!744619 res!501587) b!744630))

(assert (= (and b!744630 res!501595) b!744623))

(assert (= (and b!744623 res!501588) b!744633))

(assert (= (and b!744633 res!501598) b!744636))

(assert (= (and b!744636 res!501597) b!744626))

(assert (= (and b!744626 res!501583) b!744634))

(assert (= (and b!744634 res!501586) b!744621))

(assert (= (and b!744621 c!81898) b!744622))

(assert (= (and b!744621 (not c!81898)) b!744628))

(assert (= (and b!744621 res!501589) b!744618))

(assert (= (and b!744618 res!501584) b!744624))

(assert (= (and b!744624 res!501590) b!744629))

(assert (= (and b!744629 res!501591) b!744625))

(assert (= (and b!744624 (not res!501596)) b!744627))

(assert (= (and b!744627 (not res!501592)) b!744631))

(declare-fun m!695119 () Bool)

(assert (=> b!744632 m!695119))

(assert (=> b!744632 m!695119))

(declare-fun m!695121 () Bool)

(assert (=> b!744632 m!695121))

(declare-fun m!695123 () Bool)

(assert (=> b!744624 m!695123))

(declare-fun m!695125 () Bool)

(assert (=> b!744624 m!695125))

(declare-fun m!695127 () Bool)

(assert (=> b!744634 m!695127))

(assert (=> b!744625 m!695119))

(assert (=> b!744625 m!695119))

(declare-fun m!695129 () Bool)

(assert (=> b!744625 m!695129))

(declare-fun m!695131 () Bool)

(assert (=> b!744630 m!695131))

(declare-fun m!695133 () Bool)

(assert (=> start!65414 m!695133))

(declare-fun m!695135 () Bool)

(assert (=> start!65414 m!695135))

(assert (=> b!744627 m!695119))

(assert (=> b!744627 m!695119))

(declare-fun m!695137 () Bool)

(assert (=> b!744627 m!695137))

(assert (=> b!744622 m!695119))

(assert (=> b!744622 m!695119))

(declare-fun m!695139 () Bool)

(assert (=> b!744622 m!695139))

(declare-fun m!695141 () Bool)

(assert (=> b!744631 m!695141))

(declare-fun m!695143 () Bool)

(assert (=> b!744631 m!695143))

(assert (=> b!744628 m!695119))

(assert (=> b!744628 m!695119))

(assert (=> b!744628 m!695137))

(declare-fun m!695145 () Bool)

(assert (=> b!744618 m!695145))

(declare-fun m!695147 () Bool)

(assert (=> b!744618 m!695147))

(declare-fun m!695149 () Bool)

(assert (=> b!744618 m!695149))

(assert (=> b!744618 m!695145))

(assert (=> b!744618 m!695141))

(declare-fun m!695151 () Bool)

(assert (=> b!744618 m!695151))

(assert (=> b!744626 m!695119))

(assert (=> b!744626 m!695119))

(declare-fun m!695153 () Bool)

(assert (=> b!744626 m!695153))

(assert (=> b!744626 m!695153))

(assert (=> b!744626 m!695119))

(declare-fun m!695155 () Bool)

(assert (=> b!744626 m!695155))

(assert (=> b!744629 m!695119))

(assert (=> b!744629 m!695119))

(declare-fun m!695157 () Bool)

(assert (=> b!744629 m!695157))

(declare-fun m!695159 () Bool)

(assert (=> b!744633 m!695159))

(declare-fun m!695161 () Bool)

(assert (=> b!744619 m!695161))

(declare-fun m!695163 () Bool)

(assert (=> b!744620 m!695163))

(declare-fun m!695165 () Bool)

(assert (=> b!744623 m!695165))

(push 1)

