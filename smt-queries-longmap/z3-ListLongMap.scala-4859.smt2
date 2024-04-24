; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67114 () Bool)

(assert start!67114)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42418 0))(
  ( (array!42419 (arr!20302 (Array (_ BitVec 32) (_ BitVec 64))) (size!20722 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42418)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!430687 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!773525 () Bool)

(declare-datatypes ((SeekEntryResult!7858 0))(
  ( (MissingZero!7858 (index!33800 (_ BitVec 32))) (Found!7858 (index!33801 (_ BitVec 32))) (Intermediate!7858 (undefined!8670 Bool) (index!33802 (_ BitVec 32)) (x!64904 (_ BitVec 32))) (Undefined!7858) (MissingVacant!7858 (index!33803 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42418 (_ BitVec 32)) SeekEntryResult!7858)

(assert (=> b!773525 (= e!430687 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) (Found!7858 j!159)))))

(declare-fun b!773526 () Bool)

(declare-fun e!430686 () Bool)

(declare-fun e!430682 () Bool)

(assert (=> b!773526 (= e!430686 e!430682)))

(declare-fun res!522916 () Bool)

(assert (=> b!773526 (=> (not res!522916) (not e!430682))))

(declare-fun lt!344377 () SeekEntryResult!7858)

(declare-fun lt!344383 () SeekEntryResult!7858)

(assert (=> b!773526 (= res!522916 (= lt!344377 lt!344383))))

(declare-fun lt!344379 () array!42418)

(declare-fun lt!344381 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42418 (_ BitVec 32)) SeekEntryResult!7858)

(assert (=> b!773526 (= lt!344383 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344381 lt!344379 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773526 (= lt!344377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344381 mask!3328) lt!344381 lt!344379 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!773526 (= lt!344381 (select (store (arr!20302 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!773526 (= lt!344379 (array!42419 (store (arr!20302 a!3186) i!1173 k0!2102) (size!20722 a!3186)))))

(declare-fun b!773527 () Bool)

(declare-fun e!430680 () Bool)

(assert (=> b!773527 (= e!430680 e!430686)))

(declare-fun res!522921 () Bool)

(assert (=> b!773527 (=> (not res!522921) (not e!430686))))

(declare-fun lt!344378 () SeekEntryResult!7858)

(assert (=> b!773527 (= res!522921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20302 a!3186) j!159) mask!3328) (select (arr!20302 a!3186) j!159) a!3186 mask!3328) lt!344378))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773527 (= lt!344378 (Intermediate!7858 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773529 () Bool)

(declare-fun e!430685 () Bool)

(declare-fun e!430678 () Bool)

(assert (=> b!773529 (= e!430685 e!430678)))

(declare-fun res!522917 () Bool)

(assert (=> b!773529 (=> (not res!522917) (not e!430678))))

(declare-fun lt!344374 () SeekEntryResult!7858)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42418 (_ BitVec 32)) SeekEntryResult!7858)

(assert (=> b!773529 (= res!522917 (= (seekEntryOrOpen!0 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) lt!344374))))

(assert (=> b!773529 (= lt!344374 (Found!7858 j!159))))

(declare-fun b!773530 () Bool)

(declare-fun res!522912 () Bool)

(declare-fun e!430683 () Bool)

(assert (=> b!773530 (=> (not res!522912) (not e!430683))))

(declare-fun arrayContainsKey!0 (array!42418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773530 (= res!522912 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773531 () Bool)

(assert (=> b!773531 (= e!430678 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) lt!344374))))

(declare-fun b!773532 () Bool)

(declare-datatypes ((Unit!26623 0))(
  ( (Unit!26624) )
))
(declare-fun e!430679 () Unit!26623)

(declare-fun Unit!26625 () Unit!26623)

(assert (=> b!773532 (= e!430679 Unit!26625)))

(declare-fun lt!344382 () SeekEntryResult!7858)

(assert (=> b!773532 (= lt!344382 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20302 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!344375 () (_ BitVec 32))

(assert (=> b!773532 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344375 resIntermediateIndex!5 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) (Found!7858 j!159))))

(declare-fun b!773533 () Bool)

(declare-fun res!522913 () Bool)

(assert (=> b!773533 (=> (not res!522913) (not e!430680))))

(declare-datatypes ((List!14211 0))(
  ( (Nil!14208) (Cons!14207 (h!15318 (_ BitVec 64)) (t!20518 List!14211)) )
))
(declare-fun arrayNoDuplicates!0 (array!42418 (_ BitVec 32) List!14211) Bool)

(assert (=> b!773533 (= res!522913 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14208))))

(declare-fun b!773534 () Bool)

(declare-fun e!430681 () Bool)

(assert (=> b!773534 (= e!430682 (not e!430681))))

(declare-fun res!522915 () Bool)

(assert (=> b!773534 (=> res!522915 e!430681)))

(get-info :version)

(assert (=> b!773534 (= res!522915 (or (not ((_ is Intermediate!7858) lt!344383)) (bvsge x!1131 (x!64904 lt!344383))))))

(assert (=> b!773534 e!430685))

(declare-fun res!522911 () Bool)

(assert (=> b!773534 (=> (not res!522911) (not e!430685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42418 (_ BitVec 32)) Bool)

(assert (=> b!773534 (= res!522911 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344373 () Unit!26623)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26623)

(assert (=> b!773534 (= lt!344373 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773535 () Bool)

(declare-fun res!522919 () Bool)

(assert (=> b!773535 (=> (not res!522919) (not e!430683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773535 (= res!522919 (validKeyInArray!0 k0!2102))))

(declare-fun b!773536 () Bool)

(declare-fun res!522914 () Bool)

(assert (=> b!773536 (=> (not res!522914) (not e!430683))))

(assert (=> b!773536 (= res!522914 (and (= (size!20722 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20722 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20722 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773537 () Bool)

(assert (=> b!773537 (= e!430681 true)))

(declare-fun lt!344380 () Unit!26623)

(assert (=> b!773537 (= lt!344380 e!430679)))

(declare-fun c!85711 () Bool)

(assert (=> b!773537 (= c!85711 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773537 (= lt!344375 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!773538 () Bool)

(declare-fun res!522918 () Bool)

(assert (=> b!773538 (=> (not res!522918) (not e!430680))))

(assert (=> b!773538 (= res!522918 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20722 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20722 a!3186))))))

(declare-fun b!773528 () Bool)

(declare-fun res!522909 () Bool)

(assert (=> b!773528 (=> (not res!522909) (not e!430680))))

(assert (=> b!773528 (= res!522909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!522908 () Bool)

(assert (=> start!67114 (=> (not res!522908) (not e!430683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67114 (= res!522908 (validMask!0 mask!3328))))

(assert (=> start!67114 e!430683))

(assert (=> start!67114 true))

(declare-fun array_inv!16161 (array!42418) Bool)

(assert (=> start!67114 (array_inv!16161 a!3186)))

(declare-fun b!773539 () Bool)

(declare-fun res!522910 () Bool)

(assert (=> b!773539 (=> (not res!522910) (not e!430686))))

(assert (=> b!773539 (= res!522910 e!430687)))

(declare-fun c!85712 () Bool)

(assert (=> b!773539 (= c!85712 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773540 () Bool)

(assert (=> b!773540 (= e!430683 e!430680)))

(declare-fun res!522920 () Bool)

(assert (=> b!773540 (=> (not res!522920) (not e!430680))))

(declare-fun lt!344376 () SeekEntryResult!7858)

(assert (=> b!773540 (= res!522920 (or (= lt!344376 (MissingZero!7858 i!1173)) (= lt!344376 (MissingVacant!7858 i!1173))))))

(assert (=> b!773540 (= lt!344376 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!773541 () Bool)

(assert (=> b!773541 (= e!430687 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) lt!344378))))

(declare-fun b!773542 () Bool)

(declare-fun res!522907 () Bool)

(assert (=> b!773542 (=> (not res!522907) (not e!430686))))

(assert (=> b!773542 (= res!522907 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20302 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773543 () Bool)

(declare-fun Unit!26626 () Unit!26623)

(assert (=> b!773543 (= e!430679 Unit!26626)))

(assert (=> b!773543 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344375 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) lt!344378)))

(declare-fun b!773544 () Bool)

(declare-fun res!522906 () Bool)

(assert (=> b!773544 (=> (not res!522906) (not e!430683))))

(assert (=> b!773544 (= res!522906 (validKeyInArray!0 (select (arr!20302 a!3186) j!159)))))

(assert (= (and start!67114 res!522908) b!773536))

(assert (= (and b!773536 res!522914) b!773544))

(assert (= (and b!773544 res!522906) b!773535))

(assert (= (and b!773535 res!522919) b!773530))

(assert (= (and b!773530 res!522912) b!773540))

(assert (= (and b!773540 res!522920) b!773528))

(assert (= (and b!773528 res!522909) b!773533))

(assert (= (and b!773533 res!522913) b!773538))

(assert (= (and b!773538 res!522918) b!773527))

(assert (= (and b!773527 res!522921) b!773542))

(assert (= (and b!773542 res!522907) b!773539))

(assert (= (and b!773539 c!85712) b!773541))

(assert (= (and b!773539 (not c!85712)) b!773525))

(assert (= (and b!773539 res!522910) b!773526))

(assert (= (and b!773526 res!522916) b!773534))

(assert (= (and b!773534 res!522911) b!773529))

(assert (= (and b!773529 res!522917) b!773531))

(assert (= (and b!773534 (not res!522915)) b!773537))

(assert (= (and b!773537 c!85711) b!773543))

(assert (= (and b!773537 (not c!85711)) b!773532))

(declare-fun m!718739 () Bool)

(assert (=> b!773544 m!718739))

(assert (=> b!773544 m!718739))

(declare-fun m!718741 () Bool)

(assert (=> b!773544 m!718741))

(declare-fun m!718743 () Bool)

(assert (=> b!773528 m!718743))

(declare-fun m!718745 () Bool)

(assert (=> b!773533 m!718745))

(assert (=> b!773529 m!718739))

(assert (=> b!773529 m!718739))

(declare-fun m!718747 () Bool)

(assert (=> b!773529 m!718747))

(assert (=> b!773525 m!718739))

(assert (=> b!773525 m!718739))

(declare-fun m!718749 () Bool)

(assert (=> b!773525 m!718749))

(declare-fun m!718751 () Bool)

(assert (=> b!773534 m!718751))

(declare-fun m!718753 () Bool)

(assert (=> b!773534 m!718753))

(assert (=> b!773527 m!718739))

(assert (=> b!773527 m!718739))

(declare-fun m!718755 () Bool)

(assert (=> b!773527 m!718755))

(assert (=> b!773527 m!718755))

(assert (=> b!773527 m!718739))

(declare-fun m!718757 () Bool)

(assert (=> b!773527 m!718757))

(declare-fun m!718759 () Bool)

(assert (=> b!773535 m!718759))

(declare-fun m!718761 () Bool)

(assert (=> b!773537 m!718761))

(assert (=> b!773532 m!718739))

(assert (=> b!773532 m!718739))

(assert (=> b!773532 m!718749))

(assert (=> b!773532 m!718739))

(declare-fun m!718763 () Bool)

(assert (=> b!773532 m!718763))

(assert (=> b!773531 m!718739))

(assert (=> b!773531 m!718739))

(declare-fun m!718765 () Bool)

(assert (=> b!773531 m!718765))

(assert (=> b!773541 m!718739))

(assert (=> b!773541 m!718739))

(declare-fun m!718767 () Bool)

(assert (=> b!773541 m!718767))

(declare-fun m!718769 () Bool)

(assert (=> b!773526 m!718769))

(declare-fun m!718771 () Bool)

(assert (=> b!773526 m!718771))

(declare-fun m!718773 () Bool)

(assert (=> b!773526 m!718773))

(declare-fun m!718775 () Bool)

(assert (=> b!773526 m!718775))

(assert (=> b!773526 m!718773))

(declare-fun m!718777 () Bool)

(assert (=> b!773526 m!718777))

(declare-fun m!718779 () Bool)

(assert (=> b!773530 m!718779))

(assert (=> b!773543 m!718739))

(assert (=> b!773543 m!718739))

(declare-fun m!718781 () Bool)

(assert (=> b!773543 m!718781))

(declare-fun m!718783 () Bool)

(assert (=> start!67114 m!718783))

(declare-fun m!718785 () Bool)

(assert (=> start!67114 m!718785))

(declare-fun m!718787 () Bool)

(assert (=> b!773540 m!718787))

(declare-fun m!718789 () Bool)

(assert (=> b!773542 m!718789))

(check-sat (not b!773534) (not b!773533) (not b!773525) (not start!67114) (not b!773528) (not b!773526) (not b!773544) (not b!773537) (not b!773543) (not b!773540) (not b!773532) (not b!773535) (not b!773541) (not b!773531) (not b!773529) (not b!773530) (not b!773527))
(check-sat)
