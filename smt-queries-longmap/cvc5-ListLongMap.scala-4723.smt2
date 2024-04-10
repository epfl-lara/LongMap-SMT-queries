; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65398 () Bool)

(assert start!65398)

(declare-fun b!744178 () Bool)

(declare-fun res!501199 () Bool)

(declare-fun e!415726 () Bool)

(assert (=> b!744178 (=> (not res!501199) (not e!415726))))

(declare-datatypes ((array!41571 0))(
  ( (array!41572 (arr!19899 (Array (_ BitVec 32) (_ BitVec 64))) (size!20320 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41571)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41571 (_ BitVec 32)) Bool)

(assert (=> b!744178 (= res!501199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744179 () Bool)

(declare-fun e!415727 () Bool)

(assert (=> b!744179 (= e!415727 e!415726)))

(declare-fun res!501194 () Bool)

(assert (=> b!744179 (=> (not res!501194) (not e!415726))))

(declare-datatypes ((SeekEntryResult!7499 0))(
  ( (MissingZero!7499 (index!32364 (_ BitVec 32))) (Found!7499 (index!32365 (_ BitVec 32))) (Intermediate!7499 (undefined!8311 Bool) (index!32366 (_ BitVec 32)) (x!63329 (_ BitVec 32))) (Undefined!7499) (MissingVacant!7499 (index!32367 (_ BitVec 32))) )
))
(declare-fun lt!330587 () SeekEntryResult!7499)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744179 (= res!501194 (or (= lt!330587 (MissingZero!7499 i!1173)) (= lt!330587 (MissingVacant!7499 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41571 (_ BitVec 32)) SeekEntryResult!7499)

(assert (=> b!744179 (= lt!330587 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!744180 () Bool)

(declare-fun e!415729 () Bool)

(assert (=> b!744180 (= e!415726 e!415729)))

(declare-fun res!501197 () Bool)

(assert (=> b!744180 (=> (not res!501197) (not e!415729))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!330586 () SeekEntryResult!7499)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41571 (_ BitVec 32)) SeekEntryResult!7499)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744180 (= res!501197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19899 a!3186) j!159) mask!3328) (select (arr!19899 a!3186) j!159) a!3186 mask!3328) lt!330586))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744180 (= lt!330586 (Intermediate!7499 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744181 () Bool)

(declare-fun res!501206 () Bool)

(assert (=> b!744181 (=> (not res!501206) (not e!415729))))

(declare-fun e!415731 () Bool)

(assert (=> b!744181 (= res!501206 e!415731)))

(declare-fun c!81874 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!744181 (= c!81874 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744182 () Bool)

(declare-fun e!415728 () Bool)

(declare-fun e!415725 () Bool)

(assert (=> b!744182 (= e!415728 e!415725)))

(declare-fun res!501200 () Bool)

(assert (=> b!744182 (=> (not res!501200) (not e!415725))))

(declare-fun lt!330588 () SeekEntryResult!7499)

(assert (=> b!744182 (= res!501200 (= (seekEntryOrOpen!0 (select (arr!19899 a!3186) j!159) a!3186 mask!3328) lt!330588))))

(assert (=> b!744182 (= lt!330588 (Found!7499 j!159))))

(declare-fun b!744183 () Bool)

(declare-fun e!415733 () Bool)

(assert (=> b!744183 (= e!415729 e!415733)))

(declare-fun res!501204 () Bool)

(assert (=> b!744183 (=> (not res!501204) (not e!415733))))

(declare-fun lt!330585 () SeekEntryResult!7499)

(declare-fun lt!330582 () SeekEntryResult!7499)

(assert (=> b!744183 (= res!501204 (= lt!330585 lt!330582))))

(declare-fun lt!330583 () array!41571)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!330589 () (_ BitVec 64))

(assert (=> b!744183 (= lt!330582 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330589 lt!330583 mask!3328))))

(assert (=> b!744183 (= lt!330585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330589 mask!3328) lt!330589 lt!330583 mask!3328))))

(assert (=> b!744183 (= lt!330589 (select (store (arr!19899 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744183 (= lt!330583 (array!41572 (store (arr!19899 a!3186) i!1173 k!2102) (size!20320 a!3186)))))

(declare-fun b!744184 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41571 (_ BitVec 32)) SeekEntryResult!7499)

(assert (=> b!744184 (= e!415731 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19899 a!3186) j!159) a!3186 mask!3328) (Found!7499 j!159)))))

(declare-fun res!501191 () Bool)

(assert (=> start!65398 (=> (not res!501191) (not e!415727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65398 (= res!501191 (validMask!0 mask!3328))))

(assert (=> start!65398 e!415727))

(assert (=> start!65398 true))

(declare-fun array_inv!15695 (array!41571) Bool)

(assert (=> start!65398 (array_inv!15695 a!3186)))

(declare-fun b!744185 () Bool)

(assert (=> b!744185 (= e!415731 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19899 a!3186) j!159) a!3186 mask!3328) lt!330586))))

(declare-fun b!744186 () Bool)

(declare-fun res!501192 () Bool)

(assert (=> b!744186 (=> (not res!501192) (not e!415727))))

(assert (=> b!744186 (= res!501192 (and (= (size!20320 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20320 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20320 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744187 () Bool)

(declare-fun e!415732 () Bool)

(assert (=> b!744187 (= e!415733 (not e!415732))))

(declare-fun res!501205 () Bool)

(assert (=> b!744187 (=> res!501205 e!415732)))

(assert (=> b!744187 (= res!501205 (or (not (is-Intermediate!7499 lt!330582)) (bvslt x!1131 (x!63329 lt!330582)) (not (= x!1131 (x!63329 lt!330582))) (not (= index!1321 (index!32366 lt!330582)))))))

(assert (=> b!744187 e!415728))

(declare-fun res!501203 () Bool)

(assert (=> b!744187 (=> (not res!501203) (not e!415728))))

(assert (=> b!744187 (= res!501203 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25478 0))(
  ( (Unit!25479) )
))
(declare-fun lt!330584 () Unit!25478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25478)

(assert (=> b!744187 (= lt!330584 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744188 () Bool)

(declare-fun res!501196 () Bool)

(assert (=> b!744188 (=> (not res!501196) (not e!415726))))

(declare-datatypes ((List!13901 0))(
  ( (Nil!13898) (Cons!13897 (h!14969 (_ BitVec 64)) (t!20216 List!13901)) )
))
(declare-fun arrayNoDuplicates!0 (array!41571 (_ BitVec 32) List!13901) Bool)

(assert (=> b!744188 (= res!501196 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13898))))

(declare-fun b!744189 () Bool)

(assert (=> b!744189 (= e!415732 true)))

(declare-fun lt!330590 () SeekEntryResult!7499)

(assert (=> b!744189 (= lt!330590 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19899 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744190 () Bool)

(declare-fun res!501193 () Bool)

(assert (=> b!744190 (=> (not res!501193) (not e!415727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744190 (= res!501193 (validKeyInArray!0 (select (arr!19899 a!3186) j!159)))))

(declare-fun b!744191 () Bool)

(assert (=> b!744191 (= e!415725 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19899 a!3186) j!159) a!3186 mask!3328) lt!330588))))

(declare-fun b!744192 () Bool)

(declare-fun res!501201 () Bool)

(assert (=> b!744192 (=> (not res!501201) (not e!415727))))

(declare-fun arrayContainsKey!0 (array!41571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744192 (= res!501201 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744193 () Bool)

(declare-fun res!501202 () Bool)

(assert (=> b!744193 (=> (not res!501202) (not e!415729))))

(assert (=> b!744193 (= res!501202 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19899 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744194 () Bool)

(declare-fun res!501195 () Bool)

(assert (=> b!744194 (=> (not res!501195) (not e!415726))))

(assert (=> b!744194 (= res!501195 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20320 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20320 a!3186))))))

(declare-fun b!744195 () Bool)

(declare-fun res!501198 () Bool)

(assert (=> b!744195 (=> (not res!501198) (not e!415727))))

(assert (=> b!744195 (= res!501198 (validKeyInArray!0 k!2102))))

(assert (= (and start!65398 res!501191) b!744186))

(assert (= (and b!744186 res!501192) b!744190))

(assert (= (and b!744190 res!501193) b!744195))

(assert (= (and b!744195 res!501198) b!744192))

(assert (= (and b!744192 res!501201) b!744179))

(assert (= (and b!744179 res!501194) b!744178))

(assert (= (and b!744178 res!501199) b!744188))

(assert (= (and b!744188 res!501196) b!744194))

(assert (= (and b!744194 res!501195) b!744180))

(assert (= (and b!744180 res!501197) b!744193))

(assert (= (and b!744193 res!501202) b!744181))

(assert (= (and b!744181 c!81874) b!744185))

(assert (= (and b!744181 (not c!81874)) b!744184))

(assert (= (and b!744181 res!501206) b!744183))

(assert (= (and b!744183 res!501204) b!744187))

(assert (= (and b!744187 res!501203) b!744182))

(assert (= (and b!744182 res!501200) b!744191))

(assert (= (and b!744187 (not res!501205)) b!744189))

(declare-fun m!694747 () Bool)

(assert (=> b!744182 m!694747))

(assert (=> b!744182 m!694747))

(declare-fun m!694749 () Bool)

(assert (=> b!744182 m!694749))

(declare-fun m!694751 () Bool)

(assert (=> b!744187 m!694751))

(declare-fun m!694753 () Bool)

(assert (=> b!744187 m!694753))

(declare-fun m!694755 () Bool)

(assert (=> b!744193 m!694755))

(assert (=> b!744190 m!694747))

(assert (=> b!744190 m!694747))

(declare-fun m!694757 () Bool)

(assert (=> b!744190 m!694757))

(declare-fun m!694759 () Bool)

(assert (=> b!744183 m!694759))

(declare-fun m!694761 () Bool)

(assert (=> b!744183 m!694761))

(declare-fun m!694763 () Bool)

(assert (=> b!744183 m!694763))

(declare-fun m!694765 () Bool)

(assert (=> b!744183 m!694765))

(declare-fun m!694767 () Bool)

(assert (=> b!744183 m!694767))

(assert (=> b!744183 m!694759))

(assert (=> b!744191 m!694747))

(assert (=> b!744191 m!694747))

(declare-fun m!694769 () Bool)

(assert (=> b!744191 m!694769))

(assert (=> b!744184 m!694747))

(assert (=> b!744184 m!694747))

(declare-fun m!694771 () Bool)

(assert (=> b!744184 m!694771))

(declare-fun m!694773 () Bool)

(assert (=> start!65398 m!694773))

(declare-fun m!694775 () Bool)

(assert (=> start!65398 m!694775))

(assert (=> b!744185 m!694747))

(assert (=> b!744185 m!694747))

(declare-fun m!694777 () Bool)

(assert (=> b!744185 m!694777))

(assert (=> b!744189 m!694747))

(assert (=> b!744189 m!694747))

(assert (=> b!744189 m!694771))

(declare-fun m!694779 () Bool)

(assert (=> b!744192 m!694779))

(assert (=> b!744180 m!694747))

(assert (=> b!744180 m!694747))

(declare-fun m!694781 () Bool)

(assert (=> b!744180 m!694781))

(assert (=> b!744180 m!694781))

(assert (=> b!744180 m!694747))

(declare-fun m!694783 () Bool)

(assert (=> b!744180 m!694783))

(declare-fun m!694785 () Bool)

(assert (=> b!744195 m!694785))

(declare-fun m!694787 () Bool)

(assert (=> b!744188 m!694787))

(declare-fun m!694789 () Bool)

(assert (=> b!744178 m!694789))

(declare-fun m!694791 () Bool)

(assert (=> b!744179 m!694791))

(push 1)

