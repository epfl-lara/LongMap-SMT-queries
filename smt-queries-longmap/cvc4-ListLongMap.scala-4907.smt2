; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67690 () Bool)

(assert start!67690)

(declare-fun b!784517 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42730 0))(
  ( (array!42731 (arr!20453 (Array (_ BitVec 32) (_ BitVec 64))) (size!20874 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42730)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!436182 () Bool)

(declare-datatypes ((SeekEntryResult!8053 0))(
  ( (MissingZero!8053 (index!34580 (_ BitVec 32))) (Found!8053 (index!34581 (_ BitVec 32))) (Intermediate!8053 (undefined!8865 Bool) (index!34582 (_ BitVec 32)) (x!65529 (_ BitVec 32))) (Undefined!8053) (MissingVacant!8053 (index!34583 (_ BitVec 32))) )
))
(declare-fun lt!349729 () SeekEntryResult!8053)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42730 (_ BitVec 32)) SeekEntryResult!8053)

(assert (=> b!784517 (= e!436182 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20453 a!3186) j!159) a!3186 mask!3328) lt!349729))))

(declare-fun b!784518 () Bool)

(declare-fun res!530902 () Bool)

(declare-fun e!436178 () Bool)

(assert (=> b!784518 (=> (not res!530902) (not e!436178))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784518 (= res!530902 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!436179 () Bool)

(declare-fun b!784519 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!784519 (= e!436179 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20453 a!3186) j!159) a!3186 mask!3328) (Found!8053 j!159)))))

(declare-fun b!784520 () Bool)

(declare-fun res!530907 () Bool)

(declare-fun e!436174 () Bool)

(assert (=> b!784520 (=> (not res!530907) (not e!436174))))

(declare-fun lt!349725 () (_ BitVec 64))

(declare-fun lt!349732 () array!42730)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42730 (_ BitVec 32)) SeekEntryResult!8053)

(assert (=> b!784520 (= res!530907 (= (seekEntryOrOpen!0 lt!349725 lt!349732 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349725 lt!349732 mask!3328)))))

(declare-fun b!784521 () Bool)

(declare-datatypes ((Unit!27100 0))(
  ( (Unit!27101) )
))
(declare-fun e!436173 () Unit!27100)

(declare-fun Unit!27102 () Unit!27100)

(assert (=> b!784521 (= e!436173 Unit!27102)))

(declare-fun b!784522 () Bool)

(declare-fun res!530909 () Bool)

(declare-fun e!436177 () Bool)

(assert (=> b!784522 (=> (not res!530909) (not e!436177))))

(declare-datatypes ((List!14455 0))(
  ( (Nil!14452) (Cons!14451 (h!15574 (_ BitVec 64)) (t!20770 List!14455)) )
))
(declare-fun arrayNoDuplicates!0 (array!42730 (_ BitVec 32) List!14455) Bool)

(assert (=> b!784522 (= res!530909 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14452))))

(declare-fun b!784523 () Bool)

(declare-fun res!530916 () Bool)

(assert (=> b!784523 (=> (not res!530916) (not e!436178))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784523 (= res!530916 (and (= (size!20874 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20874 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20874 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784524 () Bool)

(declare-fun e!436184 () Bool)

(declare-fun e!436180 () Bool)

(assert (=> b!784524 (= e!436184 (not e!436180))))

(declare-fun res!530918 () Bool)

(assert (=> b!784524 (=> res!530918 e!436180)))

(declare-fun lt!349726 () SeekEntryResult!8053)

(assert (=> b!784524 (= res!530918 (or (not (is-Intermediate!8053 lt!349726)) (bvslt x!1131 (x!65529 lt!349726)) (not (= x!1131 (x!65529 lt!349726))) (not (= index!1321 (index!34582 lt!349726)))))))

(assert (=> b!784524 e!436182))

(declare-fun res!530904 () Bool)

(assert (=> b!784524 (=> (not res!530904) (not e!436182))))

(declare-fun lt!349736 () SeekEntryResult!8053)

(assert (=> b!784524 (= res!530904 (= lt!349736 lt!349729))))

(assert (=> b!784524 (= lt!349729 (Found!8053 j!159))))

(assert (=> b!784524 (= lt!349736 (seekEntryOrOpen!0 (select (arr!20453 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42730 (_ BitVec 32)) Bool)

(assert (=> b!784524 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349735 () Unit!27100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27100)

(assert (=> b!784524 (= lt!349735 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784525 () Bool)

(declare-fun Unit!27103 () Unit!27100)

(assert (=> b!784525 (= e!436173 Unit!27103)))

(assert (=> b!784525 false))

(declare-fun b!784526 () Bool)

(declare-fun e!436181 () Bool)

(assert (=> b!784526 (= e!436181 true)))

(assert (=> b!784526 e!436174))

(declare-fun res!530908 () Bool)

(assert (=> b!784526 (=> (not res!530908) (not e!436174))))

(declare-fun lt!349728 () (_ BitVec 64))

(assert (=> b!784526 (= res!530908 (= lt!349728 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349734 () Unit!27100)

(assert (=> b!784526 (= lt!349734 e!436173)))

(declare-fun c!87217 () Bool)

(assert (=> b!784526 (= c!87217 (= lt!349728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784527 () Bool)

(assert (=> b!784527 (= e!436178 e!436177)))

(declare-fun res!530912 () Bool)

(assert (=> b!784527 (=> (not res!530912) (not e!436177))))

(declare-fun lt!349731 () SeekEntryResult!8053)

(assert (=> b!784527 (= res!530912 (or (= lt!349731 (MissingZero!8053 i!1173)) (= lt!349731 (MissingVacant!8053 i!1173))))))

(assert (=> b!784527 (= lt!349731 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!784528 () Bool)

(declare-fun res!530901 () Bool)

(assert (=> b!784528 (=> (not res!530901) (not e!436178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784528 (= res!530901 (validKeyInArray!0 (select (arr!20453 a!3186) j!159)))))

(declare-fun b!784529 () Bool)

(declare-fun e!436176 () Bool)

(assert (=> b!784529 (= e!436176 e!436184)))

(declare-fun res!530906 () Bool)

(assert (=> b!784529 (=> (not res!530906) (not e!436184))))

(declare-fun lt!349733 () SeekEntryResult!8053)

(assert (=> b!784529 (= res!530906 (= lt!349733 lt!349726))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42730 (_ BitVec 32)) SeekEntryResult!8053)

(assert (=> b!784529 (= lt!349726 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349725 lt!349732 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784529 (= lt!349733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349725 mask!3328) lt!349725 lt!349732 mask!3328))))

(assert (=> b!784529 (= lt!349725 (select (store (arr!20453 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!784529 (= lt!349732 (array!42731 (store (arr!20453 a!3186) i!1173 k!2102) (size!20874 a!3186)))))

(declare-fun b!784530 () Bool)

(declare-fun res!530910 () Bool)

(assert (=> b!784530 (=> (not res!530910) (not e!436177))))

(assert (=> b!784530 (= res!530910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!530914 () Bool)

(assert (=> start!67690 (=> (not res!530914) (not e!436178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67690 (= res!530914 (validMask!0 mask!3328))))

(assert (=> start!67690 e!436178))

(assert (=> start!67690 true))

(declare-fun array_inv!16249 (array!42730) Bool)

(assert (=> start!67690 (array_inv!16249 a!3186)))

(declare-fun lt!349727 () SeekEntryResult!8053)

(declare-fun b!784531 () Bool)

(assert (=> b!784531 (= e!436179 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20453 a!3186) j!159) a!3186 mask!3328) lt!349727))))

(declare-fun b!784532 () Bool)

(declare-fun res!530903 () Bool)

(assert (=> b!784532 (=> (not res!530903) (not e!436176))))

(assert (=> b!784532 (= res!530903 e!436179)))

(declare-fun c!87216 () Bool)

(assert (=> b!784532 (= c!87216 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784533 () Bool)

(declare-fun res!530915 () Bool)

(assert (=> b!784533 (=> (not res!530915) (not e!436178))))

(assert (=> b!784533 (= res!530915 (validKeyInArray!0 k!2102))))

(declare-fun b!784534 () Bool)

(declare-fun res!530905 () Bool)

(assert (=> b!784534 (=> (not res!530905) (not e!436176))))

(assert (=> b!784534 (= res!530905 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20453 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784535 () Bool)

(declare-fun e!436183 () Bool)

(assert (=> b!784535 (= e!436180 e!436183)))

(declare-fun res!530917 () Bool)

(assert (=> b!784535 (=> res!530917 e!436183)))

(declare-fun lt!349730 () SeekEntryResult!8053)

(assert (=> b!784535 (= res!530917 (not (= lt!349730 lt!349729)))))

(assert (=> b!784535 (= lt!349730 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20453 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784536 () Bool)

(assert (=> b!784536 (= e!436183 e!436181)))

(declare-fun res!530913 () Bool)

(assert (=> b!784536 (=> res!530913 e!436181)))

(assert (=> b!784536 (= res!530913 (= lt!349728 lt!349725))))

(assert (=> b!784536 (= lt!349728 (select (store (arr!20453 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!784537 () Bool)

(declare-fun res!530911 () Bool)

(assert (=> b!784537 (=> (not res!530911) (not e!436177))))

(assert (=> b!784537 (= res!530911 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20874 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20874 a!3186))))))

(declare-fun b!784538 () Bool)

(assert (=> b!784538 (= e!436177 e!436176)))

(declare-fun res!530900 () Bool)

(assert (=> b!784538 (=> (not res!530900) (not e!436176))))

(assert (=> b!784538 (= res!530900 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20453 a!3186) j!159) mask!3328) (select (arr!20453 a!3186) j!159) a!3186 mask!3328) lt!349727))))

(assert (=> b!784538 (= lt!349727 (Intermediate!8053 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784539 () Bool)

(assert (=> b!784539 (= e!436174 (= lt!349736 lt!349730))))

(assert (= (and start!67690 res!530914) b!784523))

(assert (= (and b!784523 res!530916) b!784528))

(assert (= (and b!784528 res!530901) b!784533))

(assert (= (and b!784533 res!530915) b!784518))

(assert (= (and b!784518 res!530902) b!784527))

(assert (= (and b!784527 res!530912) b!784530))

(assert (= (and b!784530 res!530910) b!784522))

(assert (= (and b!784522 res!530909) b!784537))

(assert (= (and b!784537 res!530911) b!784538))

(assert (= (and b!784538 res!530900) b!784534))

(assert (= (and b!784534 res!530905) b!784532))

(assert (= (and b!784532 c!87216) b!784531))

(assert (= (and b!784532 (not c!87216)) b!784519))

(assert (= (and b!784532 res!530903) b!784529))

(assert (= (and b!784529 res!530906) b!784524))

(assert (= (and b!784524 res!530904) b!784517))

(assert (= (and b!784524 (not res!530918)) b!784535))

(assert (= (and b!784535 (not res!530917)) b!784536))

(assert (= (and b!784536 (not res!530913)) b!784526))

(assert (= (and b!784526 c!87217) b!784525))

(assert (= (and b!784526 (not c!87217)) b!784521))

(assert (= (and b!784526 res!530908) b!784520))

(assert (= (and b!784520 res!530907) b!784539))

(declare-fun m!726817 () Bool)

(assert (=> b!784518 m!726817))

(declare-fun m!726819 () Bool)

(assert (=> b!784531 m!726819))

(assert (=> b!784531 m!726819))

(declare-fun m!726821 () Bool)

(assert (=> b!784531 m!726821))

(assert (=> b!784519 m!726819))

(assert (=> b!784519 m!726819))

(declare-fun m!726823 () Bool)

(assert (=> b!784519 m!726823))

(declare-fun m!726825 () Bool)

(assert (=> b!784527 m!726825))

(assert (=> b!784528 m!726819))

(assert (=> b!784528 m!726819))

(declare-fun m!726827 () Bool)

(assert (=> b!784528 m!726827))

(declare-fun m!726829 () Bool)

(assert (=> b!784534 m!726829))

(declare-fun m!726831 () Bool)

(assert (=> b!784522 m!726831))

(declare-fun m!726833 () Bool)

(assert (=> b!784533 m!726833))

(assert (=> b!784535 m!726819))

(assert (=> b!784535 m!726819))

(assert (=> b!784535 m!726823))

(declare-fun m!726835 () Bool)

(assert (=> b!784530 m!726835))

(declare-fun m!726837 () Bool)

(assert (=> b!784536 m!726837))

(declare-fun m!726839 () Bool)

(assert (=> b!784536 m!726839))

(assert (=> b!784517 m!726819))

(assert (=> b!784517 m!726819))

(declare-fun m!726841 () Bool)

(assert (=> b!784517 m!726841))

(declare-fun m!726843 () Bool)

(assert (=> start!67690 m!726843))

(declare-fun m!726845 () Bool)

(assert (=> start!67690 m!726845))

(declare-fun m!726847 () Bool)

(assert (=> b!784520 m!726847))

(declare-fun m!726849 () Bool)

(assert (=> b!784520 m!726849))

(assert (=> b!784538 m!726819))

(assert (=> b!784538 m!726819))

(declare-fun m!726851 () Bool)

(assert (=> b!784538 m!726851))

(assert (=> b!784538 m!726851))

(assert (=> b!784538 m!726819))

(declare-fun m!726853 () Bool)

(assert (=> b!784538 m!726853))

(assert (=> b!784524 m!726819))

(assert (=> b!784524 m!726819))

(declare-fun m!726855 () Bool)

(assert (=> b!784524 m!726855))

(declare-fun m!726857 () Bool)

(assert (=> b!784524 m!726857))

(declare-fun m!726859 () Bool)

(assert (=> b!784524 m!726859))

(declare-fun m!726861 () Bool)

(assert (=> b!784529 m!726861))

(declare-fun m!726863 () Bool)

(assert (=> b!784529 m!726863))

(assert (=> b!784529 m!726837))

(declare-fun m!726865 () Bool)

(assert (=> b!784529 m!726865))

(declare-fun m!726867 () Bool)

(assert (=> b!784529 m!726867))

(assert (=> b!784529 m!726861))

(push 1)

