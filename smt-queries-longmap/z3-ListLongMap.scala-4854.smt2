; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66800 () Bool)

(assert start!66800)

(declare-fun b!770806 () Bool)

(declare-fun e!429108 () Bool)

(declare-fun e!429114 () Bool)

(assert (=> b!770806 (= e!429108 e!429114)))

(declare-fun res!521550 () Bool)

(assert (=> b!770806 (=> (not res!521550) (not e!429114))))

(declare-datatypes ((array!42381 0))(
  ( (array!42382 (arr!20291 (Array (_ BitVec 32) (_ BitVec 64))) (size!20712 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42381)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7888 0))(
  ( (MissingZero!7888 (index!33920 (_ BitVec 32))) (Found!7888 (index!33921 (_ BitVec 32))) (Intermediate!7888 (undefined!8700 Bool) (index!33922 (_ BitVec 32)) (x!64854 (_ BitVec 32))) (Undefined!7888) (MissingVacant!7888 (index!33923 (_ BitVec 32))) )
))
(declare-fun lt!343000 () SeekEntryResult!7888)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42381 (_ BitVec 32)) SeekEntryResult!7888)

(assert (=> b!770806 (= res!521550 (= (seekEntryOrOpen!0 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) lt!343000))))

(assert (=> b!770806 (= lt!343000 (Found!7888 j!159))))

(declare-fun b!770807 () Bool)

(declare-fun res!521539 () Bool)

(declare-fun e!429112 () Bool)

(assert (=> b!770807 (=> (not res!521539) (not e!429112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770807 (= res!521539 (validKeyInArray!0 (select (arr!20291 a!3186) j!159)))))

(declare-fun b!770808 () Bool)

(declare-fun e!429115 () Bool)

(declare-fun e!429107 () Bool)

(assert (=> b!770808 (= e!429115 e!429107)))

(declare-fun res!521544 () Bool)

(assert (=> b!770808 (=> (not res!521544) (not e!429107))))

(declare-fun lt!342998 () SeekEntryResult!7888)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42381 (_ BitVec 32)) SeekEntryResult!7888)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770808 (= res!521544 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20291 a!3186) j!159) mask!3328) (select (arr!20291 a!3186) j!159) a!3186 mask!3328) lt!342998))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770808 (= lt!342998 (Intermediate!7888 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770809 () Bool)

(declare-fun e!429113 () Bool)

(declare-fun e!429110 () Bool)

(assert (=> b!770809 (= e!429113 (not e!429110))))

(declare-fun res!521549 () Bool)

(assert (=> b!770809 (=> res!521549 e!429110)))

(declare-fun lt!343003 () SeekEntryResult!7888)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!770809 (= res!521549 (or (not ((_ is Intermediate!7888) lt!343003)) (bvsge x!1131 (x!64854 lt!343003))))))

(assert (=> b!770809 e!429108))

(declare-fun res!521540 () Bool)

(assert (=> b!770809 (=> (not res!521540) (not e!429108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42381 (_ BitVec 32)) Bool)

(assert (=> b!770809 (= res!521540 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26546 0))(
  ( (Unit!26547) )
))
(declare-fun lt!342996 () Unit!26546)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26546)

(assert (=> b!770809 (= lt!342996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770810 () Bool)

(assert (=> b!770810 (= e!429107 e!429113)))

(declare-fun res!521537 () Bool)

(assert (=> b!770810 (=> (not res!521537) (not e!429113))))

(declare-fun lt!342995 () SeekEntryResult!7888)

(assert (=> b!770810 (= res!521537 (= lt!342995 lt!343003))))

(declare-fun lt!342999 () array!42381)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!343001 () (_ BitVec 64))

(assert (=> b!770810 (= lt!343003 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343001 lt!342999 mask!3328))))

(assert (=> b!770810 (= lt!342995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343001 mask!3328) lt!343001 lt!342999 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!770810 (= lt!343001 (select (store (arr!20291 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770810 (= lt!342999 (array!42382 (store (arr!20291 a!3186) i!1173 k0!2102) (size!20712 a!3186)))))

(declare-fun b!770811 () Bool)

(declare-fun res!521546 () Bool)

(assert (=> b!770811 (=> (not res!521546) (not e!429112))))

(assert (=> b!770811 (= res!521546 (validKeyInArray!0 k0!2102))))

(declare-fun b!770812 () Bool)

(declare-fun res!521545 () Bool)

(assert (=> b!770812 (=> (not res!521545) (not e!429115))))

(assert (=> b!770812 (= res!521545 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20712 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20712 a!3186))))))

(declare-fun b!770814 () Bool)

(declare-fun res!521538 () Bool)

(assert (=> b!770814 (=> (not res!521538) (not e!429112))))

(assert (=> b!770814 (= res!521538 (and (= (size!20712 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20712 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20712 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770815 () Bool)

(declare-fun e!429106 () Unit!26546)

(declare-fun Unit!26548 () Unit!26546)

(assert (=> b!770815 (= e!429106 Unit!26548)))

(declare-fun lt!343002 () SeekEntryResult!7888)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42381 (_ BitVec 32)) SeekEntryResult!7888)

(assert (=> b!770815 (= lt!343002 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20291 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342994 () (_ BitVec 32))

(assert (=> b!770815 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342994 resIntermediateIndex!5 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) (Found!7888 j!159))))

(declare-fun e!429109 () Bool)

(declare-fun b!770816 () Bool)

(assert (=> b!770816 (= e!429109 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) lt!342998))))

(declare-fun b!770817 () Bool)

(declare-fun res!521536 () Bool)

(assert (=> b!770817 (=> (not res!521536) (not e!429107))))

(assert (=> b!770817 (= res!521536 e!429109)))

(declare-fun c!85031 () Bool)

(assert (=> b!770817 (= c!85031 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770818 () Bool)

(assert (=> b!770818 (= e!429114 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) lt!343000))))

(declare-fun b!770819 () Bool)

(assert (=> b!770819 (= e!429112 e!429115)))

(declare-fun res!521547 () Bool)

(assert (=> b!770819 (=> (not res!521547) (not e!429115))))

(declare-fun lt!343004 () SeekEntryResult!7888)

(assert (=> b!770819 (= res!521547 (or (= lt!343004 (MissingZero!7888 i!1173)) (= lt!343004 (MissingVacant!7888 i!1173))))))

(assert (=> b!770819 (= lt!343004 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770820 () Bool)

(assert (=> b!770820 (= e!429109 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) (Found!7888 j!159)))))

(declare-fun b!770821 () Bool)

(declare-fun res!521541 () Bool)

(assert (=> b!770821 (=> (not res!521541) (not e!429115))))

(assert (=> b!770821 (= res!521541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770822 () Bool)

(declare-fun res!521548 () Bool)

(assert (=> b!770822 (=> (not res!521548) (not e!429112))))

(declare-fun arrayContainsKey!0 (array!42381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770822 (= res!521548 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770823 () Bool)

(assert (=> b!770823 (= e!429110 true)))

(declare-fun lt!342997 () Unit!26546)

(assert (=> b!770823 (= lt!342997 e!429106)))

(declare-fun c!85032 () Bool)

(assert (=> b!770823 (= c!85032 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770823 (= lt!342994 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770813 () Bool)

(declare-fun res!521543 () Bool)

(assert (=> b!770813 (=> (not res!521543) (not e!429115))))

(declare-datatypes ((List!14332 0))(
  ( (Nil!14329) (Cons!14328 (h!15427 (_ BitVec 64)) (t!20638 List!14332)) )
))
(declare-fun arrayNoDuplicates!0 (array!42381 (_ BitVec 32) List!14332) Bool)

(assert (=> b!770813 (= res!521543 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14329))))

(declare-fun res!521535 () Bool)

(assert (=> start!66800 (=> (not res!521535) (not e!429112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66800 (= res!521535 (validMask!0 mask!3328))))

(assert (=> start!66800 e!429112))

(assert (=> start!66800 true))

(declare-fun array_inv!16174 (array!42381) Bool)

(assert (=> start!66800 (array_inv!16174 a!3186)))

(declare-fun b!770824 () Bool)

(declare-fun res!521542 () Bool)

(assert (=> b!770824 (=> (not res!521542) (not e!429107))))

(assert (=> b!770824 (= res!521542 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20291 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770825 () Bool)

(declare-fun Unit!26549 () Unit!26546)

(assert (=> b!770825 (= e!429106 Unit!26549)))

(assert (=> b!770825 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342994 (select (arr!20291 a!3186) j!159) a!3186 mask!3328) lt!342998)))

(assert (= (and start!66800 res!521535) b!770814))

(assert (= (and b!770814 res!521538) b!770807))

(assert (= (and b!770807 res!521539) b!770811))

(assert (= (and b!770811 res!521546) b!770822))

(assert (= (and b!770822 res!521548) b!770819))

(assert (= (and b!770819 res!521547) b!770821))

(assert (= (and b!770821 res!521541) b!770813))

(assert (= (and b!770813 res!521543) b!770812))

(assert (= (and b!770812 res!521545) b!770808))

(assert (= (and b!770808 res!521544) b!770824))

(assert (= (and b!770824 res!521542) b!770817))

(assert (= (and b!770817 c!85031) b!770816))

(assert (= (and b!770817 (not c!85031)) b!770820))

(assert (= (and b!770817 res!521536) b!770810))

(assert (= (and b!770810 res!521537) b!770809))

(assert (= (and b!770809 res!521540) b!770806))

(assert (= (and b!770806 res!521550) b!770818))

(assert (= (and b!770809 (not res!521549)) b!770823))

(assert (= (and b!770823 c!85032) b!770825))

(assert (= (and b!770823 (not c!85032)) b!770815))

(declare-fun m!715497 () Bool)

(assert (=> b!770819 m!715497))

(declare-fun m!715499 () Bool)

(assert (=> b!770813 m!715499))

(declare-fun m!715501 () Bool)

(assert (=> start!66800 m!715501))

(declare-fun m!715503 () Bool)

(assert (=> start!66800 m!715503))

(declare-fun m!715505 () Bool)

(assert (=> b!770824 m!715505))

(declare-fun m!715507 () Bool)

(assert (=> b!770823 m!715507))

(declare-fun m!715509 () Bool)

(assert (=> b!770816 m!715509))

(assert (=> b!770816 m!715509))

(declare-fun m!715511 () Bool)

(assert (=> b!770816 m!715511))

(assert (=> b!770818 m!715509))

(assert (=> b!770818 m!715509))

(declare-fun m!715513 () Bool)

(assert (=> b!770818 m!715513))

(assert (=> b!770808 m!715509))

(assert (=> b!770808 m!715509))

(declare-fun m!715515 () Bool)

(assert (=> b!770808 m!715515))

(assert (=> b!770808 m!715515))

(assert (=> b!770808 m!715509))

(declare-fun m!715517 () Bool)

(assert (=> b!770808 m!715517))

(declare-fun m!715519 () Bool)

(assert (=> b!770811 m!715519))

(assert (=> b!770807 m!715509))

(assert (=> b!770807 m!715509))

(declare-fun m!715521 () Bool)

(assert (=> b!770807 m!715521))

(assert (=> b!770815 m!715509))

(assert (=> b!770815 m!715509))

(declare-fun m!715523 () Bool)

(assert (=> b!770815 m!715523))

(assert (=> b!770815 m!715509))

(declare-fun m!715525 () Bool)

(assert (=> b!770815 m!715525))

(assert (=> b!770820 m!715509))

(assert (=> b!770820 m!715509))

(assert (=> b!770820 m!715523))

(declare-fun m!715527 () Bool)

(assert (=> b!770810 m!715527))

(declare-fun m!715529 () Bool)

(assert (=> b!770810 m!715529))

(declare-fun m!715531 () Bool)

(assert (=> b!770810 m!715531))

(assert (=> b!770810 m!715529))

(declare-fun m!715533 () Bool)

(assert (=> b!770810 m!715533))

(declare-fun m!715535 () Bool)

(assert (=> b!770810 m!715535))

(declare-fun m!715537 () Bool)

(assert (=> b!770809 m!715537))

(declare-fun m!715539 () Bool)

(assert (=> b!770809 m!715539))

(assert (=> b!770825 m!715509))

(assert (=> b!770825 m!715509))

(declare-fun m!715541 () Bool)

(assert (=> b!770825 m!715541))

(declare-fun m!715543 () Bool)

(assert (=> b!770821 m!715543))

(assert (=> b!770806 m!715509))

(assert (=> b!770806 m!715509))

(declare-fun m!715545 () Bool)

(assert (=> b!770806 m!715545))

(declare-fun m!715547 () Bool)

(assert (=> b!770822 m!715547))

(check-sat (not b!770813) (not b!770822) (not b!770816) (not b!770808) (not b!770821) (not b!770819) (not b!770809) (not b!770825) (not b!770810) (not start!66800) (not b!770820) (not b!770815) (not b!770811) (not b!770823) (not b!770806) (not b!770818) (not b!770807))
(check-sat)
