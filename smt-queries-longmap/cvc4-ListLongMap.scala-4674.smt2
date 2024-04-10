; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65108 () Bool)

(assert start!65108)

(declare-fun b!734762 () Bool)

(declare-fun e!411130 () Bool)

(declare-fun e!411126 () Bool)

(assert (=> b!734762 (= e!411130 e!411126)))

(declare-fun res!493634 () Bool)

(assert (=> b!734762 (=> (not res!493634) (not e!411126))))

(declare-datatypes ((SeekEntryResult!7354 0))(
  ( (MissingZero!7354 (index!31784 (_ BitVec 32))) (Found!7354 (index!31785 (_ BitVec 32))) (Intermediate!7354 (undefined!8166 Bool) (index!31786 (_ BitVec 32)) (x!62792 (_ BitVec 32))) (Undefined!7354) (MissingVacant!7354 (index!31787 (_ BitVec 32))) )
))
(declare-fun lt!325644 () SeekEntryResult!7354)

(declare-fun lt!325641 () SeekEntryResult!7354)

(assert (=> b!734762 (= res!493634 (= lt!325644 lt!325641))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41281 0))(
  ( (array!41282 (arr!19754 (Array (_ BitVec 32) (_ BitVec 64))) (size!20175 (_ BitVec 32))) )
))
(declare-fun lt!325648 () array!41281)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!325649 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41281 (_ BitVec 32)) SeekEntryResult!7354)

(assert (=> b!734762 (= lt!325641 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325649 lt!325648 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734762 (= lt!325644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325649 mask!3328) lt!325649 lt!325648 mask!3328))))

(declare-fun a!3186 () array!41281)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!734762 (= lt!325649 (select (store (arr!19754 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!734762 (= lt!325648 (array!41282 (store (arr!19754 a!3186) i!1173 k!2102) (size!20175 a!3186)))))

(declare-fun b!734763 () Bool)

(declare-fun e!411125 () Bool)

(declare-fun e!411133 () Bool)

(assert (=> b!734763 (= e!411125 e!411133)))

(declare-fun res!493632 () Bool)

(assert (=> b!734763 (=> res!493632 e!411133)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734763 (= res!493632 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734763 (= lt!325647 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!734764 () Bool)

(declare-fun res!493622 () Bool)

(assert (=> b!734764 (=> res!493622 e!411133)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41281 (_ BitVec 32)) SeekEntryResult!7354)

(assert (=> b!734764 (= res!493622 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19754 a!3186) j!159) a!3186 mask!3328) (Found!7354 j!159)))))

(declare-fun b!734765 () Bool)

(declare-fun res!493621 () Bool)

(declare-fun e!411132 () Bool)

(assert (=> b!734765 (=> (not res!493621) (not e!411132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734765 (= res!493621 (validKeyInArray!0 (select (arr!19754 a!3186) j!159)))))

(declare-fun res!493631 () Bool)

(assert (=> start!65108 (=> (not res!493631) (not e!411132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65108 (= res!493631 (validMask!0 mask!3328))))

(assert (=> start!65108 e!411132))

(assert (=> start!65108 true))

(declare-fun array_inv!15550 (array!41281) Bool)

(assert (=> start!65108 (array_inv!15550 a!3186)))

(declare-fun b!734766 () Bool)

(assert (=> b!734766 (= e!411126 (not e!411125))))

(declare-fun res!493620 () Bool)

(assert (=> b!734766 (=> res!493620 e!411125)))

(assert (=> b!734766 (= res!493620 (or (not (is-Intermediate!7354 lt!325641)) (bvsge x!1131 (x!62792 lt!325641))))))

(declare-fun e!411131 () Bool)

(assert (=> b!734766 e!411131))

(declare-fun res!493619 () Bool)

(assert (=> b!734766 (=> (not res!493619) (not e!411131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41281 (_ BitVec 32)) Bool)

(assert (=> b!734766 (= res!493619 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25026 0))(
  ( (Unit!25027) )
))
(declare-fun lt!325646 () Unit!25026)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25026)

(assert (=> b!734766 (= lt!325646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734767 () Bool)

(declare-fun e!411127 () Bool)

(assert (=> b!734767 (= e!411132 e!411127)))

(declare-fun res!493617 () Bool)

(assert (=> b!734767 (=> (not res!493617) (not e!411127))))

(declare-fun lt!325642 () SeekEntryResult!7354)

(assert (=> b!734767 (= res!493617 (or (= lt!325642 (MissingZero!7354 i!1173)) (= lt!325642 (MissingVacant!7354 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41281 (_ BitVec 32)) SeekEntryResult!7354)

(assert (=> b!734767 (= lt!325642 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!734768 () Bool)

(declare-fun e!411129 () Bool)

(assert (=> b!734768 (= e!411131 e!411129)))

(declare-fun res!493629 () Bool)

(assert (=> b!734768 (=> (not res!493629) (not e!411129))))

(declare-fun lt!325645 () SeekEntryResult!7354)

(assert (=> b!734768 (= res!493629 (= (seekEntryOrOpen!0 (select (arr!19754 a!3186) j!159) a!3186 mask!3328) lt!325645))))

(assert (=> b!734768 (= lt!325645 (Found!7354 j!159))))

(declare-fun b!734769 () Bool)

(declare-fun res!493628 () Bool)

(assert (=> b!734769 (=> (not res!493628) (not e!411127))))

(assert (=> b!734769 (= res!493628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!325643 () SeekEntryResult!7354)

(declare-fun e!411134 () Bool)

(declare-fun b!734770 () Bool)

(assert (=> b!734770 (= e!411134 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19754 a!3186) j!159) a!3186 mask!3328) lt!325643))))

(declare-fun b!734771 () Bool)

(declare-fun res!493625 () Bool)

(assert (=> b!734771 (=> (not res!493625) (not e!411130))))

(assert (=> b!734771 (= res!493625 e!411134)))

(declare-fun c!80953 () Bool)

(assert (=> b!734771 (= c!80953 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734772 () Bool)

(assert (=> b!734772 (= e!411133 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!325647 #b00000000000000000000000000000000) (bvsge lt!325647 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!734773 () Bool)

(declare-fun res!493633 () Bool)

(assert (=> b!734773 (=> (not res!493633) (not e!411130))))

(assert (=> b!734773 (= res!493633 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19754 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734774 () Bool)

(declare-fun res!493630 () Bool)

(assert (=> b!734774 (=> (not res!493630) (not e!411132))))

(assert (=> b!734774 (= res!493630 (validKeyInArray!0 k!2102))))

(declare-fun b!734775 () Bool)

(declare-fun res!493618 () Bool)

(assert (=> b!734775 (=> (not res!493618) (not e!411132))))

(assert (=> b!734775 (= res!493618 (and (= (size!20175 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20175 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20175 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734776 () Bool)

(assert (=> b!734776 (= e!411127 e!411130)))

(declare-fun res!493627 () Bool)

(assert (=> b!734776 (=> (not res!493627) (not e!411130))))

(assert (=> b!734776 (= res!493627 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19754 a!3186) j!159) mask!3328) (select (arr!19754 a!3186) j!159) a!3186 mask!3328) lt!325643))))

(assert (=> b!734776 (= lt!325643 (Intermediate!7354 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734777 () Bool)

(declare-fun res!493624 () Bool)

(assert (=> b!734777 (=> (not res!493624) (not e!411127))))

(declare-datatypes ((List!13756 0))(
  ( (Nil!13753) (Cons!13752 (h!14824 (_ BitVec 64)) (t!20071 List!13756)) )
))
(declare-fun arrayNoDuplicates!0 (array!41281 (_ BitVec 32) List!13756) Bool)

(assert (=> b!734777 (= res!493624 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13753))))

(declare-fun b!734778 () Bool)

(declare-fun res!493626 () Bool)

(assert (=> b!734778 (=> (not res!493626) (not e!411127))))

(assert (=> b!734778 (= res!493626 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20175 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20175 a!3186))))))

(declare-fun b!734779 () Bool)

(assert (=> b!734779 (= e!411129 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19754 a!3186) j!159) a!3186 mask!3328) lt!325645))))

(declare-fun b!734780 () Bool)

(declare-fun res!493623 () Bool)

(assert (=> b!734780 (=> (not res!493623) (not e!411132))))

(declare-fun arrayContainsKey!0 (array!41281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734780 (= res!493623 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734781 () Bool)

(assert (=> b!734781 (= e!411134 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19754 a!3186) j!159) a!3186 mask!3328) (Found!7354 j!159)))))

(assert (= (and start!65108 res!493631) b!734775))

(assert (= (and b!734775 res!493618) b!734765))

(assert (= (and b!734765 res!493621) b!734774))

(assert (= (and b!734774 res!493630) b!734780))

(assert (= (and b!734780 res!493623) b!734767))

(assert (= (and b!734767 res!493617) b!734769))

(assert (= (and b!734769 res!493628) b!734777))

(assert (= (and b!734777 res!493624) b!734778))

(assert (= (and b!734778 res!493626) b!734776))

(assert (= (and b!734776 res!493627) b!734773))

(assert (= (and b!734773 res!493633) b!734771))

(assert (= (and b!734771 c!80953) b!734770))

(assert (= (and b!734771 (not c!80953)) b!734781))

(assert (= (and b!734771 res!493625) b!734762))

(assert (= (and b!734762 res!493634) b!734766))

(assert (= (and b!734766 res!493619) b!734768))

(assert (= (and b!734768 res!493629) b!734779))

(assert (= (and b!734766 (not res!493620)) b!734763))

(assert (= (and b!734763 (not res!493632)) b!734764))

(assert (= (and b!734764 (not res!493622)) b!734772))

(declare-fun m!687283 () Bool)

(assert (=> b!734769 m!687283))

(declare-fun m!687285 () Bool)

(assert (=> b!734763 m!687285))

(declare-fun m!687287 () Bool)

(assert (=> b!734768 m!687287))

(assert (=> b!734768 m!687287))

(declare-fun m!687289 () Bool)

(assert (=> b!734768 m!687289))

(assert (=> b!734781 m!687287))

(assert (=> b!734781 m!687287))

(declare-fun m!687291 () Bool)

(assert (=> b!734781 m!687291))

(declare-fun m!687293 () Bool)

(assert (=> b!734777 m!687293))

(declare-fun m!687295 () Bool)

(assert (=> b!734780 m!687295))

(assert (=> b!734776 m!687287))

(assert (=> b!734776 m!687287))

(declare-fun m!687297 () Bool)

(assert (=> b!734776 m!687297))

(assert (=> b!734776 m!687297))

(assert (=> b!734776 m!687287))

(declare-fun m!687299 () Bool)

(assert (=> b!734776 m!687299))

(assert (=> b!734765 m!687287))

(assert (=> b!734765 m!687287))

(declare-fun m!687301 () Bool)

(assert (=> b!734765 m!687301))

(declare-fun m!687303 () Bool)

(assert (=> b!734774 m!687303))

(declare-fun m!687305 () Bool)

(assert (=> start!65108 m!687305))

(declare-fun m!687307 () Bool)

(assert (=> start!65108 m!687307))

(assert (=> b!734770 m!687287))

(assert (=> b!734770 m!687287))

(declare-fun m!687309 () Bool)

(assert (=> b!734770 m!687309))

(declare-fun m!687311 () Bool)

(assert (=> b!734766 m!687311))

(declare-fun m!687313 () Bool)

(assert (=> b!734766 m!687313))

(assert (=> b!734764 m!687287))

(assert (=> b!734764 m!687287))

(assert (=> b!734764 m!687291))

(declare-fun m!687315 () Bool)

(assert (=> b!734762 m!687315))

(declare-fun m!687317 () Bool)

(assert (=> b!734762 m!687317))

(declare-fun m!687319 () Bool)

(assert (=> b!734762 m!687319))

(declare-fun m!687321 () Bool)

(assert (=> b!734762 m!687321))

(declare-fun m!687323 () Bool)

(assert (=> b!734762 m!687323))

(assert (=> b!734762 m!687319))

(declare-fun m!687325 () Bool)

(assert (=> b!734767 m!687325))

(assert (=> b!734779 m!687287))

(assert (=> b!734779 m!687287))

(declare-fun m!687327 () Bool)

(assert (=> b!734779 m!687327))

(declare-fun m!687329 () Bool)

(assert (=> b!734773 m!687329))

(push 1)

(assert (not b!734780))

(assert (not b!734768))

(assert (not b!734766))

(assert (not b!734767))

(assert (not b!734763))

(assert (not b!734769))

(assert (not b!734779))

(assert (not b!734770))

(assert (not b!734764))

(assert (not b!734774))

(assert (not b!734781))

(assert (not b!734762))

(assert (not b!734777))

(assert (not b!734765))

(assert (not start!65108))

(assert (not b!734776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

