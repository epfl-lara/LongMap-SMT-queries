; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65104 () Bool)

(assert start!65104)

(declare-fun b!734642 () Bool)

(declare-fun res!493519 () Bool)

(declare-fun e!411067 () Bool)

(assert (=> b!734642 (=> (not res!493519) (not e!411067))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734642 (= res!493519 (validKeyInArray!0 k!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!325590 () (_ BitVec 32))

(declare-fun e!411073 () Bool)

(declare-fun b!734643 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!734643 (= e!411073 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!325590 #b00000000000000000000000000000000) (bvsge lt!325590 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!734644 () Bool)

(declare-fun res!493524 () Bool)

(assert (=> b!734644 (=> res!493524 e!411073)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41277 0))(
  ( (array!41278 (arr!19752 (Array (_ BitVec 32) (_ BitVec 64))) (size!20173 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41277)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7352 0))(
  ( (MissingZero!7352 (index!31776 (_ BitVec 32))) (Found!7352 (index!31777 (_ BitVec 32))) (Intermediate!7352 (undefined!8164 Bool) (index!31778 (_ BitVec 32)) (x!62790 (_ BitVec 32))) (Undefined!7352) (MissingVacant!7352 (index!31779 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41277 (_ BitVec 32)) SeekEntryResult!7352)

(assert (=> b!734644 (= res!493524 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19752 a!3186) j!159) a!3186 mask!3328) (Found!7352 j!159)))))

(declare-fun b!734645 () Bool)

(declare-fun res!493515 () Bool)

(declare-fun e!411069 () Bool)

(assert (=> b!734645 (=> (not res!493515) (not e!411069))))

(declare-datatypes ((List!13754 0))(
  ( (Nil!13751) (Cons!13750 (h!14822 (_ BitVec 64)) (t!20069 List!13754)) )
))
(declare-fun arrayNoDuplicates!0 (array!41277 (_ BitVec 32) List!13754) Bool)

(assert (=> b!734645 (= res!493515 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13751))))

(declare-fun b!734646 () Bool)

(declare-fun res!493511 () Bool)

(assert (=> b!734646 (=> (not res!493511) (not e!411067))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!734646 (= res!493511 (and (= (size!20173 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20173 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20173 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734647 () Bool)

(declare-fun e!411065 () Bool)

(declare-fun e!411068 () Bool)

(assert (=> b!734647 (= e!411065 e!411068)))

(declare-fun res!493512 () Bool)

(assert (=> b!734647 (=> (not res!493512) (not e!411068))))

(declare-fun lt!325593 () SeekEntryResult!7352)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41277 (_ BitVec 32)) SeekEntryResult!7352)

(assert (=> b!734647 (= res!493512 (= (seekEntryOrOpen!0 (select (arr!19752 a!3186) j!159) a!3186 mask!3328) lt!325593))))

(assert (=> b!734647 (= lt!325593 (Found!7352 j!159))))

(declare-fun e!411066 () Bool)

(declare-fun b!734648 () Bool)

(assert (=> b!734648 (= e!411066 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19752 a!3186) j!159) a!3186 mask!3328) (Found!7352 j!159)))))

(declare-fun b!734649 () Bool)

(declare-fun e!411071 () Bool)

(assert (=> b!734649 (= e!411069 e!411071)))

(declare-fun res!493509 () Bool)

(assert (=> b!734649 (=> (not res!493509) (not e!411071))))

(declare-fun lt!325592 () SeekEntryResult!7352)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41277 (_ BitVec 32)) SeekEntryResult!7352)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734649 (= res!493509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19752 a!3186) j!159) mask!3328) (select (arr!19752 a!3186) j!159) a!3186 mask!3328) lt!325592))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734649 (= lt!325592 (Intermediate!7352 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734650 () Bool)

(declare-fun e!411072 () Bool)

(declare-fun e!411070 () Bool)

(assert (=> b!734650 (= e!411072 (not e!411070))))

(declare-fun res!493510 () Bool)

(assert (=> b!734650 (=> res!493510 e!411070)))

(declare-fun lt!325588 () SeekEntryResult!7352)

(assert (=> b!734650 (= res!493510 (or (not (is-Intermediate!7352 lt!325588)) (bvsge x!1131 (x!62790 lt!325588))))))

(assert (=> b!734650 e!411065))

(declare-fun res!493522 () Bool)

(assert (=> b!734650 (=> (not res!493522) (not e!411065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41277 (_ BitVec 32)) Bool)

(assert (=> b!734650 (= res!493522 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25022 0))(
  ( (Unit!25023) )
))
(declare-fun lt!325595 () Unit!25022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25022)

(assert (=> b!734650 (= lt!325595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734651 () Bool)

(declare-fun res!493518 () Bool)

(assert (=> b!734651 (=> (not res!493518) (not e!411069))))

(assert (=> b!734651 (= res!493518 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20173 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20173 a!3186))))))

(declare-fun b!734652 () Bool)

(assert (=> b!734652 (= e!411066 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19752 a!3186) j!159) a!3186 mask!3328) lt!325592))))

(declare-fun b!734653 () Bool)

(assert (=> b!734653 (= e!411068 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19752 a!3186) j!159) a!3186 mask!3328) lt!325593))))

(declare-fun b!734654 () Bool)

(assert (=> b!734654 (= e!411071 e!411072)))

(declare-fun res!493516 () Bool)

(assert (=> b!734654 (=> (not res!493516) (not e!411072))))

(declare-fun lt!325587 () SeekEntryResult!7352)

(assert (=> b!734654 (= res!493516 (= lt!325587 lt!325588))))

(declare-fun lt!325589 () array!41277)

(declare-fun lt!325591 () (_ BitVec 64))

(assert (=> b!734654 (= lt!325588 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325591 lt!325589 mask!3328))))

(assert (=> b!734654 (= lt!325587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325591 mask!3328) lt!325591 lt!325589 mask!3328))))

(assert (=> b!734654 (= lt!325591 (select (store (arr!19752 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!734654 (= lt!325589 (array!41278 (store (arr!19752 a!3186) i!1173 k!2102) (size!20173 a!3186)))))

(declare-fun b!734655 () Bool)

(assert (=> b!734655 (= e!411070 e!411073)))

(declare-fun res!493513 () Bool)

(assert (=> b!734655 (=> res!493513 e!411073)))

(assert (=> b!734655 (= res!493513 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734655 (= lt!325590 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!734656 () Bool)

(assert (=> b!734656 (= e!411067 e!411069)))

(declare-fun res!493523 () Bool)

(assert (=> b!734656 (=> (not res!493523) (not e!411069))))

(declare-fun lt!325594 () SeekEntryResult!7352)

(assert (=> b!734656 (= res!493523 (or (= lt!325594 (MissingZero!7352 i!1173)) (= lt!325594 (MissingVacant!7352 i!1173))))))

(assert (=> b!734656 (= lt!325594 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!734657 () Bool)

(declare-fun res!493517 () Bool)

(assert (=> b!734657 (=> (not res!493517) (not e!411067))))

(assert (=> b!734657 (= res!493517 (validKeyInArray!0 (select (arr!19752 a!3186) j!159)))))

(declare-fun b!734658 () Bool)

(declare-fun res!493525 () Bool)

(assert (=> b!734658 (=> (not res!493525) (not e!411071))))

(assert (=> b!734658 (= res!493525 e!411066)))

(declare-fun c!80947 () Bool)

(assert (=> b!734658 (= c!80947 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734659 () Bool)

(declare-fun res!493520 () Bool)

(assert (=> b!734659 (=> (not res!493520) (not e!411067))))

(declare-fun arrayContainsKey!0 (array!41277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734659 (= res!493520 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734660 () Bool)

(declare-fun res!493521 () Bool)

(assert (=> b!734660 (=> (not res!493521) (not e!411071))))

(assert (=> b!734660 (= res!493521 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19752 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734661 () Bool)

(declare-fun res!493526 () Bool)

(assert (=> b!734661 (=> (not res!493526) (not e!411069))))

(assert (=> b!734661 (= res!493526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!493514 () Bool)

(assert (=> start!65104 (=> (not res!493514) (not e!411067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65104 (= res!493514 (validMask!0 mask!3328))))

(assert (=> start!65104 e!411067))

(assert (=> start!65104 true))

(declare-fun array_inv!15548 (array!41277) Bool)

(assert (=> start!65104 (array_inv!15548 a!3186)))

(assert (= (and start!65104 res!493514) b!734646))

(assert (= (and b!734646 res!493511) b!734657))

(assert (= (and b!734657 res!493517) b!734642))

(assert (= (and b!734642 res!493519) b!734659))

(assert (= (and b!734659 res!493520) b!734656))

(assert (= (and b!734656 res!493523) b!734661))

(assert (= (and b!734661 res!493526) b!734645))

(assert (= (and b!734645 res!493515) b!734651))

(assert (= (and b!734651 res!493518) b!734649))

(assert (= (and b!734649 res!493509) b!734660))

(assert (= (and b!734660 res!493521) b!734658))

(assert (= (and b!734658 c!80947) b!734652))

(assert (= (and b!734658 (not c!80947)) b!734648))

(assert (= (and b!734658 res!493525) b!734654))

(assert (= (and b!734654 res!493516) b!734650))

(assert (= (and b!734650 res!493522) b!734647))

(assert (= (and b!734647 res!493512) b!734653))

(assert (= (and b!734650 (not res!493510)) b!734655))

(assert (= (and b!734655 (not res!493513)) b!734644))

(assert (= (and b!734644 (not res!493524)) b!734643))

(declare-fun m!687187 () Bool)

(assert (=> b!734647 m!687187))

(assert (=> b!734647 m!687187))

(declare-fun m!687189 () Bool)

(assert (=> b!734647 m!687189))

(assert (=> b!734649 m!687187))

(assert (=> b!734649 m!687187))

(declare-fun m!687191 () Bool)

(assert (=> b!734649 m!687191))

(assert (=> b!734649 m!687191))

(assert (=> b!734649 m!687187))

(declare-fun m!687193 () Bool)

(assert (=> b!734649 m!687193))

(declare-fun m!687195 () Bool)

(assert (=> b!734659 m!687195))

(assert (=> b!734644 m!687187))

(assert (=> b!734644 m!687187))

(declare-fun m!687197 () Bool)

(assert (=> b!734644 m!687197))

(assert (=> b!734657 m!687187))

(assert (=> b!734657 m!687187))

(declare-fun m!687199 () Bool)

(assert (=> b!734657 m!687199))

(assert (=> b!734653 m!687187))

(assert (=> b!734653 m!687187))

(declare-fun m!687201 () Bool)

(assert (=> b!734653 m!687201))

(declare-fun m!687203 () Bool)

(assert (=> b!734645 m!687203))

(declare-fun m!687205 () Bool)

(assert (=> b!734642 m!687205))

(assert (=> b!734652 m!687187))

(assert (=> b!734652 m!687187))

(declare-fun m!687207 () Bool)

(assert (=> b!734652 m!687207))

(assert (=> b!734648 m!687187))

(assert (=> b!734648 m!687187))

(assert (=> b!734648 m!687197))

(declare-fun m!687209 () Bool)

(assert (=> b!734654 m!687209))

(declare-fun m!687211 () Bool)

(assert (=> b!734654 m!687211))

(declare-fun m!687213 () Bool)

(assert (=> b!734654 m!687213))

(declare-fun m!687215 () Bool)

(assert (=> b!734654 m!687215))

(declare-fun m!687217 () Bool)

(assert (=> b!734654 m!687217))

(assert (=> b!734654 m!687211))

(declare-fun m!687219 () Bool)

(assert (=> b!734650 m!687219))

(declare-fun m!687221 () Bool)

(assert (=> b!734650 m!687221))

(declare-fun m!687223 () Bool)

(assert (=> b!734655 m!687223))

(declare-fun m!687225 () Bool)

(assert (=> b!734660 m!687225))

(declare-fun m!687227 () Bool)

(assert (=> b!734656 m!687227))

(declare-fun m!687229 () Bool)

(assert (=> start!65104 m!687229))

(declare-fun m!687231 () Bool)

(assert (=> start!65104 m!687231))

(declare-fun m!687233 () Bool)

(assert (=> b!734661 m!687233))

(push 1)

(assert (not b!734657))

(assert (not b!734645))

(assert (not b!734647))

(assert (not b!734642))

(assert (not b!734661))

(assert (not b!734648))

(assert (not b!734656))

(assert (not b!734650))

(assert (not b!734659))

(assert (not b!734654))

(assert (not b!734644))

(assert (not b!734653))

(assert (not b!734649))

(assert (not b!734655))

(assert (not start!65104))

(assert (not b!734652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

