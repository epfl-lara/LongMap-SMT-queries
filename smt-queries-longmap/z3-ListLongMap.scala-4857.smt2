; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66890 () Bool)

(assert start!66890)

(declare-fun b!771808 () Bool)

(declare-fun res!522107 () Bool)

(declare-fun e!429659 () Bool)

(assert (=> b!771808 (=> (not res!522107) (not e!429659))))

(declare-datatypes ((array!42402 0))(
  ( (array!42403 (arr!20300 (Array (_ BitVec 32) (_ BitVec 64))) (size!20721 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42402)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771808 (= res!522107 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771809 () Bool)

(declare-fun e!429653 () Bool)

(assert (=> b!771809 (= e!429659 e!429653)))

(declare-fun res!522111 () Bool)

(assert (=> b!771809 (=> (not res!522111) (not e!429653))))

(declare-datatypes ((SeekEntryResult!7897 0))(
  ( (MissingZero!7897 (index!33956 (_ BitVec 32))) (Found!7897 (index!33957 (_ BitVec 32))) (Intermediate!7897 (undefined!8709 Bool) (index!33958 (_ BitVec 32)) (x!64899 (_ BitVec 32))) (Undefined!7897) (MissingVacant!7897 (index!33959 (_ BitVec 32))) )
))
(declare-fun lt!343480 () SeekEntryResult!7897)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771809 (= res!522111 (or (= lt!343480 (MissingZero!7897 i!1173)) (= lt!343480 (MissingVacant!7897 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42402 (_ BitVec 32)) SeekEntryResult!7897)

(assert (=> b!771809 (= lt!343480 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!771810 () Bool)

(declare-fun res!522102 () Bool)

(assert (=> b!771810 (=> (not res!522102) (not e!429659))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!771810 (= res!522102 (and (= (size!20721 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20721 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20721 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771811 () Bool)

(declare-fun e!429652 () Bool)

(assert (=> b!771811 (= e!429652 true)))

(declare-datatypes ((Unit!26582 0))(
  ( (Unit!26583) )
))
(declare-fun lt!343485 () Unit!26582)

(declare-fun e!429657 () Unit!26582)

(assert (=> b!771811 (= lt!343485 e!429657)))

(declare-fun c!85251 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!771811 (= c!85251 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!343487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771811 (= lt!343487 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun lt!343483 () SeekEntryResult!7897)

(declare-fun b!771812 () Bool)

(declare-fun e!429656 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42402 (_ BitVec 32)) SeekEntryResult!7897)

(assert (=> b!771812 (= e!429656 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) lt!343483))))

(declare-fun b!771813 () Bool)

(declare-fun e!429654 () Bool)

(assert (=> b!771813 (= e!429653 e!429654)))

(declare-fun res!522105 () Bool)

(assert (=> b!771813 (=> (not res!522105) (not e!429654))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771813 (= res!522105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20300 a!3186) j!159) mask!3328) (select (arr!20300 a!3186) j!159) a!3186 mask!3328) lt!343483))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!771813 (= lt!343483 (Intermediate!7897 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771814 () Bool)

(declare-fun res!522108 () Bool)

(assert (=> b!771814 (=> (not res!522108) (not e!429653))))

(assert (=> b!771814 (= res!522108 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20721 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20721 a!3186))))))

(declare-fun b!771815 () Bool)

(declare-fun res!522117 () Bool)

(assert (=> b!771815 (=> (not res!522117) (not e!429654))))

(assert (=> b!771815 (= res!522117 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20300 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771816 () Bool)

(declare-fun Unit!26584 () Unit!26582)

(assert (=> b!771816 (= e!429657 Unit!26584)))

(declare-fun lt!343481 () SeekEntryResult!7897)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42402 (_ BitVec 32)) SeekEntryResult!7897)

(assert (=> b!771816 (= lt!343481 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20300 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!771816 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343487 resIntermediateIndex!5 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) (Found!7897 j!159))))

(declare-fun b!771817 () Bool)

(declare-fun res!522113 () Bool)

(assert (=> b!771817 (=> (not res!522113) (not e!429653))))

(declare-datatypes ((List!14341 0))(
  ( (Nil!14338) (Cons!14337 (h!15439 (_ BitVec 64)) (t!20647 List!14341)) )
))
(declare-fun arrayNoDuplicates!0 (array!42402 (_ BitVec 32) List!14341) Bool)

(assert (=> b!771817 (= res!522113 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14338))))

(declare-fun b!771818 () Bool)

(declare-fun Unit!26585 () Unit!26582)

(assert (=> b!771818 (= e!429657 Unit!26585)))

(assert (=> b!771818 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343487 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) lt!343483)))

(declare-fun b!771819 () Bool)

(declare-fun e!429655 () Bool)

(assert (=> b!771819 (= e!429655 (not e!429652))))

(declare-fun res!522106 () Bool)

(assert (=> b!771819 (=> res!522106 e!429652)))

(declare-fun lt!343478 () SeekEntryResult!7897)

(get-info :version)

(assert (=> b!771819 (= res!522106 (or (not ((_ is Intermediate!7897) lt!343478)) (bvsge x!1131 (x!64899 lt!343478))))))

(declare-fun e!429658 () Bool)

(assert (=> b!771819 e!429658))

(declare-fun res!522112 () Bool)

(assert (=> b!771819 (=> (not res!522112) (not e!429658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42402 (_ BitVec 32)) Bool)

(assert (=> b!771819 (= res!522112 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343482 () Unit!26582)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42402 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26582)

(assert (=> b!771819 (= lt!343482 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771820 () Bool)

(assert (=> b!771820 (= e!429656 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) (Found!7897 j!159)))))

(declare-fun b!771821 () Bool)

(declare-fun res!522109 () Bool)

(assert (=> b!771821 (=> (not res!522109) (not e!429659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771821 (= res!522109 (validKeyInArray!0 (select (arr!20300 a!3186) j!159)))))

(declare-fun res!522104 () Bool)

(assert (=> start!66890 (=> (not res!522104) (not e!429659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66890 (= res!522104 (validMask!0 mask!3328))))

(assert (=> start!66890 e!429659))

(assert (=> start!66890 true))

(declare-fun array_inv!16183 (array!42402) Bool)

(assert (=> start!66890 (array_inv!16183 a!3186)))

(declare-fun b!771822 () Bool)

(declare-fun res!522114 () Bool)

(assert (=> b!771822 (=> (not res!522114) (not e!429654))))

(assert (=> b!771822 (= res!522114 e!429656)))

(declare-fun c!85250 () Bool)

(assert (=> b!771822 (= c!85250 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771823 () Bool)

(assert (=> b!771823 (= e!429654 e!429655)))

(declare-fun res!522116 () Bool)

(assert (=> b!771823 (=> (not res!522116) (not e!429655))))

(declare-fun lt!343477 () SeekEntryResult!7897)

(assert (=> b!771823 (= res!522116 (= lt!343477 lt!343478))))

(declare-fun lt!343484 () (_ BitVec 64))

(declare-fun lt!343486 () array!42402)

(assert (=> b!771823 (= lt!343478 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343484 lt!343486 mask!3328))))

(assert (=> b!771823 (= lt!343477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343484 mask!3328) lt!343484 lt!343486 mask!3328))))

(assert (=> b!771823 (= lt!343484 (select (store (arr!20300 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!771823 (= lt!343486 (array!42403 (store (arr!20300 a!3186) i!1173 k0!2102) (size!20721 a!3186)))))

(declare-fun b!771824 () Bool)

(declare-fun res!522110 () Bool)

(assert (=> b!771824 (=> (not res!522110) (not e!429659))))

(assert (=> b!771824 (= res!522110 (validKeyInArray!0 k0!2102))))

(declare-fun e!429660 () Bool)

(declare-fun lt!343479 () SeekEntryResult!7897)

(declare-fun b!771825 () Bool)

(assert (=> b!771825 (= e!429660 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) lt!343479))))

(declare-fun b!771826 () Bool)

(assert (=> b!771826 (= e!429658 e!429660)))

(declare-fun res!522115 () Bool)

(assert (=> b!771826 (=> (not res!522115) (not e!429660))))

(assert (=> b!771826 (= res!522115 (= (seekEntryOrOpen!0 (select (arr!20300 a!3186) j!159) a!3186 mask!3328) lt!343479))))

(assert (=> b!771826 (= lt!343479 (Found!7897 j!159))))

(declare-fun b!771827 () Bool)

(declare-fun res!522103 () Bool)

(assert (=> b!771827 (=> (not res!522103) (not e!429653))))

(assert (=> b!771827 (= res!522103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66890 res!522104) b!771810))

(assert (= (and b!771810 res!522102) b!771821))

(assert (= (and b!771821 res!522109) b!771824))

(assert (= (and b!771824 res!522110) b!771808))

(assert (= (and b!771808 res!522107) b!771809))

(assert (= (and b!771809 res!522111) b!771827))

(assert (= (and b!771827 res!522103) b!771817))

(assert (= (and b!771817 res!522113) b!771814))

(assert (= (and b!771814 res!522108) b!771813))

(assert (= (and b!771813 res!522105) b!771815))

(assert (= (and b!771815 res!522117) b!771822))

(assert (= (and b!771822 c!85250) b!771812))

(assert (= (and b!771822 (not c!85250)) b!771820))

(assert (= (and b!771822 res!522114) b!771823))

(assert (= (and b!771823 res!522116) b!771819))

(assert (= (and b!771819 res!522112) b!771826))

(assert (= (and b!771826 res!522115) b!771825))

(assert (= (and b!771819 (not res!522106)) b!771811))

(assert (= (and b!771811 c!85251) b!771818))

(assert (= (and b!771811 (not c!85251)) b!771816))

(declare-fun m!716289 () Bool)

(assert (=> b!771819 m!716289))

(declare-fun m!716291 () Bool)

(assert (=> b!771819 m!716291))

(declare-fun m!716293 () Bool)

(assert (=> b!771811 m!716293))

(declare-fun m!716295 () Bool)

(assert (=> b!771827 m!716295))

(declare-fun m!716297 () Bool)

(assert (=> b!771817 m!716297))

(declare-fun m!716299 () Bool)

(assert (=> b!771821 m!716299))

(assert (=> b!771821 m!716299))

(declare-fun m!716301 () Bool)

(assert (=> b!771821 m!716301))

(assert (=> b!771820 m!716299))

(assert (=> b!771820 m!716299))

(declare-fun m!716303 () Bool)

(assert (=> b!771820 m!716303))

(declare-fun m!716305 () Bool)

(assert (=> b!771809 m!716305))

(declare-fun m!716307 () Bool)

(assert (=> b!771808 m!716307))

(assert (=> b!771826 m!716299))

(assert (=> b!771826 m!716299))

(declare-fun m!716309 () Bool)

(assert (=> b!771826 m!716309))

(declare-fun m!716311 () Bool)

(assert (=> start!66890 m!716311))

(declare-fun m!716313 () Bool)

(assert (=> start!66890 m!716313))

(assert (=> b!771816 m!716299))

(assert (=> b!771816 m!716299))

(assert (=> b!771816 m!716303))

(assert (=> b!771816 m!716299))

(declare-fun m!716315 () Bool)

(assert (=> b!771816 m!716315))

(assert (=> b!771812 m!716299))

(assert (=> b!771812 m!716299))

(declare-fun m!716317 () Bool)

(assert (=> b!771812 m!716317))

(assert (=> b!771818 m!716299))

(assert (=> b!771818 m!716299))

(declare-fun m!716319 () Bool)

(assert (=> b!771818 m!716319))

(declare-fun m!716321 () Bool)

(assert (=> b!771823 m!716321))

(declare-fun m!716323 () Bool)

(assert (=> b!771823 m!716323))

(declare-fun m!716325 () Bool)

(assert (=> b!771823 m!716325))

(declare-fun m!716327 () Bool)

(assert (=> b!771823 m!716327))

(declare-fun m!716329 () Bool)

(assert (=> b!771823 m!716329))

(assert (=> b!771823 m!716321))

(declare-fun m!716331 () Bool)

(assert (=> b!771815 m!716331))

(assert (=> b!771825 m!716299))

(assert (=> b!771825 m!716299))

(declare-fun m!716333 () Bool)

(assert (=> b!771825 m!716333))

(assert (=> b!771813 m!716299))

(assert (=> b!771813 m!716299))

(declare-fun m!716335 () Bool)

(assert (=> b!771813 m!716335))

(assert (=> b!771813 m!716335))

(assert (=> b!771813 m!716299))

(declare-fun m!716337 () Bool)

(assert (=> b!771813 m!716337))

(declare-fun m!716339 () Bool)

(assert (=> b!771824 m!716339))

(check-sat (not b!771827) (not b!771811) (not b!771821) (not b!771817) (not start!66890) (not b!771819) (not b!771808) (not b!771813) (not b!771826) (not b!771809) (not b!771824) (not b!771816) (not b!771818) (not b!771823) (not b!771820) (not b!771812) (not b!771825))
(check-sat)
