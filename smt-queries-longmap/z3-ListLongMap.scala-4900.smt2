; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67580 () Bool)

(assert start!67580)

(declare-fun b!782581 () Bool)

(declare-datatypes ((Unit!27012 0))(
  ( (Unit!27013) )
))
(declare-fun e!435140 () Unit!27012)

(declare-fun Unit!27014 () Unit!27012)

(assert (=> b!782581 (= e!435140 Unit!27014)))

(assert (=> b!782581 false))

(declare-fun b!782583 () Bool)

(declare-fun e!435144 () Bool)

(declare-fun e!435143 () Bool)

(assert (=> b!782583 (= e!435144 e!435143)))

(declare-fun res!529565 () Bool)

(assert (=> b!782583 (=> res!529565 e!435143)))

(declare-fun lt!348776 () (_ BitVec 64))

(declare-fun lt!348778 () (_ BitVec 64))

(assert (=> b!782583 (= res!529565 (= lt!348776 lt!348778))))

(declare-datatypes ((array!42683 0))(
  ( (array!42684 (arr!20431 (Array (_ BitVec 32) (_ BitVec 64))) (size!20852 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42683)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!782583 (= lt!348776 (select (store (arr!20431 a!3186) i!1173 k0!2102) index!1321))))

(declare-datatypes ((SeekEntryResult!8031 0))(
  ( (MissingZero!8031 (index!34492 (_ BitVec 32))) (Found!8031 (index!34493 (_ BitVec 32))) (Intermediate!8031 (undefined!8843 Bool) (index!34494 (_ BitVec 32)) (x!65442 (_ BitVec 32))) (Undefined!8031) (MissingVacant!8031 (index!34495 (_ BitVec 32))) )
))
(declare-fun lt!348782 () SeekEntryResult!8031)

(declare-fun b!782584 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!435145 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42683 (_ BitVec 32)) SeekEntryResult!8031)

(assert (=> b!782584 (= e!435145 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!348782))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!435137 () Bool)

(declare-fun b!782585 () Bool)

(declare-fun lt!348783 () SeekEntryResult!8031)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42683 (_ BitVec 32)) SeekEntryResult!8031)

(assert (=> b!782585 (= e!435137 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!348783))))

(declare-fun b!782586 () Bool)

(declare-fun res!529562 () Bool)

(declare-fun e!435139 () Bool)

(assert (=> b!782586 (=> (not res!529562) (not e!435139))))

(assert (=> b!782586 (= res!529562 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20852 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20852 a!3186))))))

(declare-fun lt!348781 () array!42683)

(declare-fun b!782587 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42683 (_ BitVec 32)) SeekEntryResult!8031)

(assert (=> b!782587 (= e!435143 (= (seekEntryOrOpen!0 lt!348778 lt!348781 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!348778 lt!348781 mask!3328)))))

(assert (=> b!782587 (= lt!348776 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348784 () Unit!27012)

(assert (=> b!782587 (= lt!348784 e!435140)))

(declare-fun c!86920 () Bool)

(assert (=> b!782587 (= c!86920 (= lt!348776 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782588 () Bool)

(declare-fun res!529556 () Bool)

(assert (=> b!782588 (=> (not res!529556) (not e!435139))))

(declare-datatypes ((List!14433 0))(
  ( (Nil!14430) (Cons!14429 (h!15549 (_ BitVec 64)) (t!20748 List!14433)) )
))
(declare-fun arrayNoDuplicates!0 (array!42683 (_ BitVec 32) List!14433) Bool)

(assert (=> b!782588 (= res!529556 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14430))))

(declare-fun b!782589 () Bool)

(assert (=> b!782589 (= e!435145 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) (Found!8031 j!159)))))

(declare-fun b!782582 () Bool)

(declare-fun e!435138 () Bool)

(declare-fun e!435142 () Bool)

(assert (=> b!782582 (= e!435138 e!435142)))

(declare-fun res!529569 () Bool)

(assert (=> b!782582 (=> (not res!529569) (not e!435142))))

(declare-fun lt!348780 () SeekEntryResult!8031)

(declare-fun lt!348775 () SeekEntryResult!8031)

(assert (=> b!782582 (= res!529569 (= lt!348780 lt!348775))))

(assert (=> b!782582 (= lt!348775 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348778 lt!348781 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782582 (= lt!348780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348778 mask!3328) lt!348778 lt!348781 mask!3328))))

(assert (=> b!782582 (= lt!348778 (select (store (arr!20431 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782582 (= lt!348781 (array!42684 (store (arr!20431 a!3186) i!1173 k0!2102) (size!20852 a!3186)))))

(declare-fun res!529563 () Bool)

(declare-fun e!435146 () Bool)

(assert (=> start!67580 (=> (not res!529563) (not e!435146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67580 (= res!529563 (validMask!0 mask!3328))))

(assert (=> start!67580 e!435146))

(assert (=> start!67580 true))

(declare-fun array_inv!16227 (array!42683) Bool)

(assert (=> start!67580 (array_inv!16227 a!3186)))

(declare-fun b!782590 () Bool)

(assert (=> b!782590 (= e!435146 e!435139)))

(declare-fun res!529559 () Bool)

(assert (=> b!782590 (=> (not res!529559) (not e!435139))))

(declare-fun lt!348785 () SeekEntryResult!8031)

(assert (=> b!782590 (= res!529559 (or (= lt!348785 (MissingZero!8031 i!1173)) (= lt!348785 (MissingVacant!8031 i!1173))))))

(assert (=> b!782590 (= lt!348785 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!782591 () Bool)

(declare-fun res!529571 () Bool)

(assert (=> b!782591 (=> (not res!529571) (not e!435139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42683 (_ BitVec 32)) Bool)

(assert (=> b!782591 (= res!529571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782592 () Bool)

(declare-fun res!529555 () Bool)

(assert (=> b!782592 (=> (not res!529555) (not e!435146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782592 (= res!529555 (validKeyInArray!0 k0!2102))))

(declare-fun b!782593 () Bool)

(declare-fun res!529564 () Bool)

(assert (=> b!782593 (=> (not res!529564) (not e!435146))))

(assert (=> b!782593 (= res!529564 (and (= (size!20852 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20852 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20852 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782594 () Bool)

(declare-fun res!529561 () Bool)

(assert (=> b!782594 (=> (not res!529561) (not e!435138))))

(assert (=> b!782594 (= res!529561 e!435145)))

(declare-fun c!86919 () Bool)

(assert (=> b!782594 (= c!86919 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782595 () Bool)

(assert (=> b!782595 (= e!435142 (not e!435144))))

(declare-fun res!529558 () Bool)

(assert (=> b!782595 (=> res!529558 e!435144)))

(get-info :version)

(assert (=> b!782595 (= res!529558 (or (not ((_ is Intermediate!8031) lt!348775)) (bvslt x!1131 (x!65442 lt!348775)) (not (= x!1131 (x!65442 lt!348775))) (not (= index!1321 (index!34494 lt!348775)))))))

(assert (=> b!782595 e!435137))

(declare-fun res!529570 () Bool)

(assert (=> b!782595 (=> (not res!529570) (not e!435137))))

(declare-fun lt!348777 () SeekEntryResult!8031)

(assert (=> b!782595 (= res!529570 (= lt!348777 lt!348783))))

(assert (=> b!782595 (= lt!348783 (Found!8031 j!159))))

(assert (=> b!782595 (= lt!348777 (seekEntryOrOpen!0 (select (arr!20431 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782595 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348779 () Unit!27012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27012)

(assert (=> b!782595 (= lt!348779 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782596 () Bool)

(declare-fun Unit!27015 () Unit!27012)

(assert (=> b!782596 (= e!435140 Unit!27015)))

(declare-fun b!782597 () Bool)

(declare-fun res!529568 () Bool)

(assert (=> b!782597 (=> (not res!529568) (not e!435146))))

(declare-fun arrayContainsKey!0 (array!42683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782597 (= res!529568 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782598 () Bool)

(assert (=> b!782598 (= e!435139 e!435138)))

(declare-fun res!529567 () Bool)

(assert (=> b!782598 (=> (not res!529567) (not e!435138))))

(assert (=> b!782598 (= res!529567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20431 a!3186) j!159) mask!3328) (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!348782))))

(assert (=> b!782598 (= lt!348782 (Intermediate!8031 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782599 () Bool)

(declare-fun res!529566 () Bool)

(assert (=> b!782599 (=> (not res!529566) (not e!435138))))

(assert (=> b!782599 (= res!529566 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20431 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782600 () Bool)

(declare-fun res!529560 () Bool)

(assert (=> b!782600 (=> (not res!529560) (not e!435146))))

(assert (=> b!782600 (= res!529560 (validKeyInArray!0 (select (arr!20431 a!3186) j!159)))))

(declare-fun b!782601 () Bool)

(declare-fun res!529557 () Bool)

(assert (=> b!782601 (=> res!529557 e!435144)))

(assert (=> b!782601 (= res!529557 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!348783)))))

(assert (= (and start!67580 res!529563) b!782593))

(assert (= (and b!782593 res!529564) b!782600))

(assert (= (and b!782600 res!529560) b!782592))

(assert (= (and b!782592 res!529555) b!782597))

(assert (= (and b!782597 res!529568) b!782590))

(assert (= (and b!782590 res!529559) b!782591))

(assert (= (and b!782591 res!529571) b!782588))

(assert (= (and b!782588 res!529556) b!782586))

(assert (= (and b!782586 res!529562) b!782598))

(assert (= (and b!782598 res!529567) b!782599))

(assert (= (and b!782599 res!529566) b!782594))

(assert (= (and b!782594 c!86919) b!782584))

(assert (= (and b!782594 (not c!86919)) b!782589))

(assert (= (and b!782594 res!529561) b!782582))

(assert (= (and b!782582 res!529569) b!782595))

(assert (= (and b!782595 res!529570) b!782585))

(assert (= (and b!782595 (not res!529558)) b!782601))

(assert (= (and b!782601 (not res!529557)) b!782583))

(assert (= (and b!782583 (not res!529565)) b!782587))

(assert (= (and b!782587 c!86920) b!782581))

(assert (= (and b!782587 (not c!86920)) b!782596))

(declare-fun m!725343 () Bool)

(assert (=> b!782589 m!725343))

(assert (=> b!782589 m!725343))

(declare-fun m!725345 () Bool)

(assert (=> b!782589 m!725345))

(declare-fun m!725347 () Bool)

(assert (=> b!782597 m!725347))

(assert (=> b!782584 m!725343))

(assert (=> b!782584 m!725343))

(declare-fun m!725349 () Bool)

(assert (=> b!782584 m!725349))

(declare-fun m!725351 () Bool)

(assert (=> b!782583 m!725351))

(declare-fun m!725353 () Bool)

(assert (=> b!782583 m!725353))

(declare-fun m!725355 () Bool)

(assert (=> b!782590 m!725355))

(assert (=> b!782600 m!725343))

(assert (=> b!782600 m!725343))

(declare-fun m!725357 () Bool)

(assert (=> b!782600 m!725357))

(declare-fun m!725359 () Bool)

(assert (=> b!782599 m!725359))

(declare-fun m!725361 () Bool)

(assert (=> b!782582 m!725361))

(assert (=> b!782582 m!725351))

(assert (=> b!782582 m!725361))

(declare-fun m!725363 () Bool)

(assert (=> b!782582 m!725363))

(declare-fun m!725365 () Bool)

(assert (=> b!782582 m!725365))

(declare-fun m!725367 () Bool)

(assert (=> b!782582 m!725367))

(declare-fun m!725369 () Bool)

(assert (=> b!782592 m!725369))

(declare-fun m!725371 () Bool)

(assert (=> b!782591 m!725371))

(assert (=> b!782595 m!725343))

(assert (=> b!782595 m!725343))

(declare-fun m!725373 () Bool)

(assert (=> b!782595 m!725373))

(declare-fun m!725375 () Bool)

(assert (=> b!782595 m!725375))

(declare-fun m!725377 () Bool)

(assert (=> b!782595 m!725377))

(assert (=> b!782601 m!725343))

(assert (=> b!782601 m!725343))

(assert (=> b!782601 m!725345))

(assert (=> b!782598 m!725343))

(assert (=> b!782598 m!725343))

(declare-fun m!725379 () Bool)

(assert (=> b!782598 m!725379))

(assert (=> b!782598 m!725379))

(assert (=> b!782598 m!725343))

(declare-fun m!725381 () Bool)

(assert (=> b!782598 m!725381))

(assert (=> b!782585 m!725343))

(assert (=> b!782585 m!725343))

(declare-fun m!725383 () Bool)

(assert (=> b!782585 m!725383))

(declare-fun m!725385 () Bool)

(assert (=> start!67580 m!725385))

(declare-fun m!725387 () Bool)

(assert (=> start!67580 m!725387))

(declare-fun m!725389 () Bool)

(assert (=> b!782588 m!725389))

(declare-fun m!725391 () Bool)

(assert (=> b!782587 m!725391))

(declare-fun m!725393 () Bool)

(assert (=> b!782587 m!725393))

(check-sat (not b!782591) (not b!782601) (not b!782598) (not b!782590) (not b!782585) (not b!782587) (not b!782582) (not b!782588) (not b!782584) (not start!67580) (not b!782592) (not b!782597) (not b!782600) (not b!782589) (not b!782595))
(check-sat)
(get-model)

(declare-fun b!782683 () Bool)

(declare-fun lt!348824 () SeekEntryResult!8031)

(assert (=> b!782683 (and (bvsge (index!34494 lt!348824) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348824) (size!20852 lt!348781)))))

(declare-fun e!435191 () Bool)

(assert (=> b!782683 (= e!435191 (= (select (arr!20431 lt!348781) (index!34494 lt!348824)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782684 () Bool)

(declare-fun e!435187 () SeekEntryResult!8031)

(declare-fun e!435190 () SeekEntryResult!8031)

(assert (=> b!782684 (= e!435187 e!435190)))

(declare-fun c!86935 () Bool)

(declare-fun lt!348823 () (_ BitVec 64))

(assert (=> b!782684 (= c!86935 (or (= lt!348823 lt!348778) (= (bvadd lt!348823 lt!348823) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782685 () Bool)

(declare-fun e!435189 () Bool)

(declare-fun e!435188 () Bool)

(assert (=> b!782685 (= e!435189 e!435188)))

(declare-fun res!529631 () Bool)

(assert (=> b!782685 (= res!529631 (and ((_ is Intermediate!8031) lt!348824) (not (undefined!8843 lt!348824)) (bvslt (x!65442 lt!348824) #b01111111111111111111111111111110) (bvsge (x!65442 lt!348824) #b00000000000000000000000000000000) (bvsge (x!65442 lt!348824) x!1131)))))

(assert (=> b!782685 (=> (not res!529631) (not e!435188))))

(declare-fun d!102651 () Bool)

(assert (=> d!102651 e!435189))

(declare-fun c!86933 () Bool)

(assert (=> d!102651 (= c!86933 (and ((_ is Intermediate!8031) lt!348824) (undefined!8843 lt!348824)))))

(assert (=> d!102651 (= lt!348824 e!435187)))

(declare-fun c!86934 () Bool)

(assert (=> d!102651 (= c!86934 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102651 (= lt!348823 (select (arr!20431 lt!348781) index!1321))))

(assert (=> d!102651 (validMask!0 mask!3328)))

(assert (=> d!102651 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348778 lt!348781 mask!3328) lt!348824)))

(declare-fun b!782686 () Bool)

(assert (=> b!782686 (= e!435190 (Intermediate!8031 false index!1321 x!1131))))

(declare-fun b!782687 () Bool)

(assert (=> b!782687 (= e!435189 (bvsge (x!65442 lt!348824) #b01111111111111111111111111111110))))

(declare-fun b!782688 () Bool)

(assert (=> b!782688 (= e!435187 (Intermediate!8031 true index!1321 x!1131))))

(declare-fun b!782689 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782689 (= e!435190 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!348778 lt!348781 mask!3328))))

(declare-fun b!782690 () Bool)

(assert (=> b!782690 (and (bvsge (index!34494 lt!348824) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348824) (size!20852 lt!348781)))))

(declare-fun res!529629 () Bool)

(assert (=> b!782690 (= res!529629 (= (select (arr!20431 lt!348781) (index!34494 lt!348824)) lt!348778))))

(assert (=> b!782690 (=> res!529629 e!435191)))

(assert (=> b!782690 (= e!435188 e!435191)))

(declare-fun b!782691 () Bool)

(assert (=> b!782691 (and (bvsge (index!34494 lt!348824) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348824) (size!20852 lt!348781)))))

(declare-fun res!529630 () Bool)

(assert (=> b!782691 (= res!529630 (= (select (arr!20431 lt!348781) (index!34494 lt!348824)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782691 (=> res!529630 e!435191)))

(assert (= (and d!102651 c!86934) b!782688))

(assert (= (and d!102651 (not c!86934)) b!782684))

(assert (= (and b!782684 c!86935) b!782686))

(assert (= (and b!782684 (not c!86935)) b!782689))

(assert (= (and d!102651 c!86933) b!782687))

(assert (= (and d!102651 (not c!86933)) b!782685))

(assert (= (and b!782685 res!529631) b!782690))

(assert (= (and b!782690 (not res!529629)) b!782691))

(assert (= (and b!782691 (not res!529630)) b!782683))

(declare-fun m!725447 () Bool)

(assert (=> b!782691 m!725447))

(declare-fun m!725449 () Bool)

(assert (=> d!102651 m!725449))

(assert (=> d!102651 m!725385))

(assert (=> b!782683 m!725447))

(declare-fun m!725451 () Bool)

(assert (=> b!782689 m!725451))

(assert (=> b!782689 m!725451))

(declare-fun m!725453 () Bool)

(assert (=> b!782689 m!725453))

(assert (=> b!782690 m!725447))

(assert (=> b!782582 d!102651))

(declare-fun b!782692 () Bool)

(declare-fun lt!348826 () SeekEntryResult!8031)

(assert (=> b!782692 (and (bvsge (index!34494 lt!348826) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348826) (size!20852 lt!348781)))))

(declare-fun e!435196 () Bool)

(assert (=> b!782692 (= e!435196 (= (select (arr!20431 lt!348781) (index!34494 lt!348826)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782693 () Bool)

(declare-fun e!435192 () SeekEntryResult!8031)

(declare-fun e!435195 () SeekEntryResult!8031)

(assert (=> b!782693 (= e!435192 e!435195)))

(declare-fun c!86938 () Bool)

(declare-fun lt!348825 () (_ BitVec 64))

(assert (=> b!782693 (= c!86938 (or (= lt!348825 lt!348778) (= (bvadd lt!348825 lt!348825) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782694 () Bool)

(declare-fun e!435194 () Bool)

(declare-fun e!435193 () Bool)

(assert (=> b!782694 (= e!435194 e!435193)))

(declare-fun res!529634 () Bool)

(assert (=> b!782694 (= res!529634 (and ((_ is Intermediate!8031) lt!348826) (not (undefined!8843 lt!348826)) (bvslt (x!65442 lt!348826) #b01111111111111111111111111111110) (bvsge (x!65442 lt!348826) #b00000000000000000000000000000000) (bvsge (x!65442 lt!348826) #b00000000000000000000000000000000)))))

(assert (=> b!782694 (=> (not res!529634) (not e!435193))))

(declare-fun d!102653 () Bool)

(assert (=> d!102653 e!435194))

(declare-fun c!86936 () Bool)

(assert (=> d!102653 (= c!86936 (and ((_ is Intermediate!8031) lt!348826) (undefined!8843 lt!348826)))))

(assert (=> d!102653 (= lt!348826 e!435192)))

(declare-fun c!86937 () Bool)

(assert (=> d!102653 (= c!86937 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102653 (= lt!348825 (select (arr!20431 lt!348781) (toIndex!0 lt!348778 mask!3328)))))

(assert (=> d!102653 (validMask!0 mask!3328)))

(assert (=> d!102653 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348778 mask!3328) lt!348778 lt!348781 mask!3328) lt!348826)))

(declare-fun b!782695 () Bool)

(assert (=> b!782695 (= e!435195 (Intermediate!8031 false (toIndex!0 lt!348778 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!782696 () Bool)

(assert (=> b!782696 (= e!435194 (bvsge (x!65442 lt!348826) #b01111111111111111111111111111110))))

(declare-fun b!782697 () Bool)

(assert (=> b!782697 (= e!435192 (Intermediate!8031 true (toIndex!0 lt!348778 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!782698 () Bool)

(assert (=> b!782698 (= e!435195 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!348778 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!348778 lt!348781 mask!3328))))

(declare-fun b!782699 () Bool)

(assert (=> b!782699 (and (bvsge (index!34494 lt!348826) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348826) (size!20852 lt!348781)))))

(declare-fun res!529632 () Bool)

(assert (=> b!782699 (= res!529632 (= (select (arr!20431 lt!348781) (index!34494 lt!348826)) lt!348778))))

(assert (=> b!782699 (=> res!529632 e!435196)))

(assert (=> b!782699 (= e!435193 e!435196)))

(declare-fun b!782700 () Bool)

(assert (=> b!782700 (and (bvsge (index!34494 lt!348826) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348826) (size!20852 lt!348781)))))

(declare-fun res!529633 () Bool)

(assert (=> b!782700 (= res!529633 (= (select (arr!20431 lt!348781) (index!34494 lt!348826)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782700 (=> res!529633 e!435196)))

(assert (= (and d!102653 c!86937) b!782697))

(assert (= (and d!102653 (not c!86937)) b!782693))

(assert (= (and b!782693 c!86938) b!782695))

(assert (= (and b!782693 (not c!86938)) b!782698))

(assert (= (and d!102653 c!86936) b!782696))

(assert (= (and d!102653 (not c!86936)) b!782694))

(assert (= (and b!782694 res!529634) b!782699))

(assert (= (and b!782699 (not res!529632)) b!782700))

(assert (= (and b!782700 (not res!529633)) b!782692))

(declare-fun m!725455 () Bool)

(assert (=> b!782700 m!725455))

(assert (=> d!102653 m!725361))

(declare-fun m!725457 () Bool)

(assert (=> d!102653 m!725457))

(assert (=> d!102653 m!725385))

(assert (=> b!782692 m!725455))

(assert (=> b!782698 m!725361))

(declare-fun m!725459 () Bool)

(assert (=> b!782698 m!725459))

(assert (=> b!782698 m!725459))

(declare-fun m!725461 () Bool)

(assert (=> b!782698 m!725461))

(assert (=> b!782699 m!725455))

(assert (=> b!782582 d!102653))

(declare-fun d!102655 () Bool)

(declare-fun lt!348832 () (_ BitVec 32))

(declare-fun lt!348831 () (_ BitVec 32))

(assert (=> d!102655 (= lt!348832 (bvmul (bvxor lt!348831 (bvlshr lt!348831 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102655 (= lt!348831 ((_ extract 31 0) (bvand (bvxor lt!348778 (bvlshr lt!348778 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102655 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!529635 (let ((h!15551 ((_ extract 31 0) (bvand (bvxor lt!348778 (bvlshr lt!348778 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65445 (bvmul (bvxor h!15551 (bvlshr h!15551 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65445 (bvlshr x!65445 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!529635 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!529635 #b00000000000000000000000000000000))))))

(assert (=> d!102655 (= (toIndex!0 lt!348778 mask!3328) (bvand (bvxor lt!348832 (bvlshr lt!348832 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!782582 d!102655))

(declare-fun d!102657 () Bool)

(assert (=> d!102657 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!782592 d!102657))

(declare-fun b!782713 () Bool)

(declare-fun e!435204 () SeekEntryResult!8031)

(declare-fun lt!348840 () SeekEntryResult!8031)

(assert (=> b!782713 (= e!435204 (seekKeyOrZeroReturnVacant!0 (x!65442 lt!348840) (index!34494 lt!348840) (index!34494 lt!348840) (select (arr!20431 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782714 () Bool)

(assert (=> b!782714 (= e!435204 (MissingZero!8031 (index!34494 lt!348840)))))

(declare-fun b!782715 () Bool)

(declare-fun c!86946 () Bool)

(declare-fun lt!348841 () (_ BitVec 64))

(assert (=> b!782715 (= c!86946 (= lt!348841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435203 () SeekEntryResult!8031)

(assert (=> b!782715 (= e!435203 e!435204)))

(declare-fun b!782717 () Bool)

(declare-fun e!435205 () SeekEntryResult!8031)

(assert (=> b!782717 (= e!435205 e!435203)))

(assert (=> b!782717 (= lt!348841 (select (arr!20431 a!3186) (index!34494 lt!348840)))))

(declare-fun c!86947 () Bool)

(assert (=> b!782717 (= c!86947 (= lt!348841 (select (arr!20431 a!3186) j!159)))))

(declare-fun b!782718 () Bool)

(assert (=> b!782718 (= e!435205 Undefined!8031)))

(declare-fun d!102659 () Bool)

(declare-fun lt!348839 () SeekEntryResult!8031)

(assert (=> d!102659 (and (or ((_ is Undefined!8031) lt!348839) (not ((_ is Found!8031) lt!348839)) (and (bvsge (index!34493 lt!348839) #b00000000000000000000000000000000) (bvslt (index!34493 lt!348839) (size!20852 a!3186)))) (or ((_ is Undefined!8031) lt!348839) ((_ is Found!8031) lt!348839) (not ((_ is MissingZero!8031) lt!348839)) (and (bvsge (index!34492 lt!348839) #b00000000000000000000000000000000) (bvslt (index!34492 lt!348839) (size!20852 a!3186)))) (or ((_ is Undefined!8031) lt!348839) ((_ is Found!8031) lt!348839) ((_ is MissingZero!8031) lt!348839) (not ((_ is MissingVacant!8031) lt!348839)) (and (bvsge (index!34495 lt!348839) #b00000000000000000000000000000000) (bvslt (index!34495 lt!348839) (size!20852 a!3186)))) (or ((_ is Undefined!8031) lt!348839) (ite ((_ is Found!8031) lt!348839) (= (select (arr!20431 a!3186) (index!34493 lt!348839)) (select (arr!20431 a!3186) j!159)) (ite ((_ is MissingZero!8031) lt!348839) (= (select (arr!20431 a!3186) (index!34492 lt!348839)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8031) lt!348839) (= (select (arr!20431 a!3186) (index!34495 lt!348839)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102659 (= lt!348839 e!435205)))

(declare-fun c!86945 () Bool)

(assert (=> d!102659 (= c!86945 (and ((_ is Intermediate!8031) lt!348840) (undefined!8843 lt!348840)))))

(assert (=> d!102659 (= lt!348840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20431 a!3186) j!159) mask!3328) (select (arr!20431 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102659 (validMask!0 mask!3328)))

(assert (=> d!102659 (= (seekEntryOrOpen!0 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!348839)))

(declare-fun b!782716 () Bool)

(assert (=> b!782716 (= e!435203 (Found!8031 (index!34494 lt!348840)))))

(assert (= (and d!102659 c!86945) b!782718))

(assert (= (and d!102659 (not c!86945)) b!782717))

(assert (= (and b!782717 c!86947) b!782716))

(assert (= (and b!782717 (not c!86947)) b!782715))

(assert (= (and b!782715 c!86946) b!782714))

(assert (= (and b!782715 (not c!86946)) b!782713))

(assert (=> b!782713 m!725343))

(declare-fun m!725463 () Bool)

(assert (=> b!782713 m!725463))

(declare-fun m!725465 () Bool)

(assert (=> b!782717 m!725465))

(assert (=> d!102659 m!725343))

(assert (=> d!102659 m!725379))

(declare-fun m!725467 () Bool)

(assert (=> d!102659 m!725467))

(assert (=> d!102659 m!725385))

(assert (=> d!102659 m!725379))

(assert (=> d!102659 m!725343))

(assert (=> d!102659 m!725381))

(declare-fun m!725469 () Bool)

(assert (=> d!102659 m!725469))

(declare-fun m!725471 () Bool)

(assert (=> d!102659 m!725471))

(assert (=> b!782595 d!102659))

(declare-fun b!782727 () Bool)

(declare-fun e!435212 () Bool)

(declare-fun call!35259 () Bool)

(assert (=> b!782727 (= e!435212 call!35259)))

(declare-fun b!782728 () Bool)

(declare-fun e!435214 () Bool)

(declare-fun e!435213 () Bool)

(assert (=> b!782728 (= e!435214 e!435213)))

(declare-fun c!86950 () Bool)

(assert (=> b!782728 (= c!86950 (validKeyInArray!0 (select (arr!20431 a!3186) j!159)))))

(declare-fun b!782729 () Bool)

(assert (=> b!782729 (= e!435213 e!435212)))

(declare-fun lt!348848 () (_ BitVec 64))

(assert (=> b!782729 (= lt!348848 (select (arr!20431 a!3186) j!159))))

(declare-fun lt!348850 () Unit!27012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42683 (_ BitVec 64) (_ BitVec 32)) Unit!27012)

(assert (=> b!782729 (= lt!348850 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348848 j!159))))

(assert (=> b!782729 (arrayContainsKey!0 a!3186 lt!348848 #b00000000000000000000000000000000)))

(declare-fun lt!348849 () Unit!27012)

(assert (=> b!782729 (= lt!348849 lt!348850)))

(declare-fun res!529641 () Bool)

(assert (=> b!782729 (= res!529641 (= (seekEntryOrOpen!0 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) (Found!8031 j!159)))))

(assert (=> b!782729 (=> (not res!529641) (not e!435212))))

(declare-fun b!782730 () Bool)

(assert (=> b!782730 (= e!435213 call!35259)))

(declare-fun bm!35256 () Bool)

(assert (=> bm!35256 (= call!35259 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!102661 () Bool)

(declare-fun res!529640 () Bool)

(assert (=> d!102661 (=> res!529640 e!435214)))

(assert (=> d!102661 (= res!529640 (bvsge j!159 (size!20852 a!3186)))))

(assert (=> d!102661 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!435214)))

(assert (= (and d!102661 (not res!529640)) b!782728))

(assert (= (and b!782728 c!86950) b!782729))

(assert (= (and b!782728 (not c!86950)) b!782730))

(assert (= (and b!782729 res!529641) b!782727))

(assert (= (or b!782727 b!782730) bm!35256))

(assert (=> b!782728 m!725343))

(assert (=> b!782728 m!725343))

(assert (=> b!782728 m!725357))

(assert (=> b!782729 m!725343))

(declare-fun m!725473 () Bool)

(assert (=> b!782729 m!725473))

(declare-fun m!725475 () Bool)

(assert (=> b!782729 m!725475))

(assert (=> b!782729 m!725343))

(assert (=> b!782729 m!725373))

(declare-fun m!725477 () Bool)

(assert (=> bm!35256 m!725477))

(assert (=> b!782595 d!102661))

(declare-fun d!102665 () Bool)

(assert (=> d!102665 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348853 () Unit!27012)

(declare-fun choose!38 (array!42683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27012)

(assert (=> d!102665 (= lt!348853 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102665 (validMask!0 mask!3328)))

(assert (=> d!102665 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!348853)))

(declare-fun bs!21754 () Bool)

(assert (= bs!21754 d!102665))

(assert (=> bs!21754 m!725375))

(declare-fun m!725479 () Bool)

(assert (=> bs!21754 m!725479))

(assert (=> bs!21754 m!725385))

(assert (=> b!782595 d!102665))

(declare-fun b!782741 () Bool)

(declare-fun lt!348855 () SeekEntryResult!8031)

(assert (=> b!782741 (and (bvsge (index!34494 lt!348855) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348855) (size!20852 a!3186)))))

(declare-fun e!435227 () Bool)

(assert (=> b!782741 (= e!435227 (= (select (arr!20431 a!3186) (index!34494 lt!348855)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782742 () Bool)

(declare-fun e!435223 () SeekEntryResult!8031)

(declare-fun e!435226 () SeekEntryResult!8031)

(assert (=> b!782742 (= e!435223 e!435226)))

(declare-fun c!86955 () Bool)

(declare-fun lt!348854 () (_ BitVec 64))

(assert (=> b!782742 (= c!86955 (or (= lt!348854 (select (arr!20431 a!3186) j!159)) (= (bvadd lt!348854 lt!348854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782743 () Bool)

(declare-fun e!435225 () Bool)

(declare-fun e!435224 () Bool)

(assert (=> b!782743 (= e!435225 e!435224)))

(declare-fun res!529650 () Bool)

(assert (=> b!782743 (= res!529650 (and ((_ is Intermediate!8031) lt!348855) (not (undefined!8843 lt!348855)) (bvslt (x!65442 lt!348855) #b01111111111111111111111111111110) (bvsge (x!65442 lt!348855) #b00000000000000000000000000000000) (bvsge (x!65442 lt!348855) x!1131)))))

(assert (=> b!782743 (=> (not res!529650) (not e!435224))))

(declare-fun d!102669 () Bool)

(assert (=> d!102669 e!435225))

(declare-fun c!86953 () Bool)

(assert (=> d!102669 (= c!86953 (and ((_ is Intermediate!8031) lt!348855) (undefined!8843 lt!348855)))))

(assert (=> d!102669 (= lt!348855 e!435223)))

(declare-fun c!86954 () Bool)

(assert (=> d!102669 (= c!86954 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102669 (= lt!348854 (select (arr!20431 a!3186) index!1321))))

(assert (=> d!102669 (validMask!0 mask!3328)))

(assert (=> d!102669 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!348855)))

(declare-fun b!782744 () Bool)

(assert (=> b!782744 (= e!435226 (Intermediate!8031 false index!1321 x!1131))))

(declare-fun b!782745 () Bool)

(assert (=> b!782745 (= e!435225 (bvsge (x!65442 lt!348855) #b01111111111111111111111111111110))))

(declare-fun b!782746 () Bool)

(assert (=> b!782746 (= e!435223 (Intermediate!8031 true index!1321 x!1131))))

(declare-fun b!782747 () Bool)

(assert (=> b!782747 (= e!435226 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20431 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782748 () Bool)

(assert (=> b!782748 (and (bvsge (index!34494 lt!348855) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348855) (size!20852 a!3186)))))

(declare-fun res!529648 () Bool)

(assert (=> b!782748 (= res!529648 (= (select (arr!20431 a!3186) (index!34494 lt!348855)) (select (arr!20431 a!3186) j!159)))))

(assert (=> b!782748 (=> res!529648 e!435227)))

(assert (=> b!782748 (= e!435224 e!435227)))

(declare-fun b!782749 () Bool)

(assert (=> b!782749 (and (bvsge (index!34494 lt!348855) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348855) (size!20852 a!3186)))))

(declare-fun res!529649 () Bool)

(assert (=> b!782749 (= res!529649 (= (select (arr!20431 a!3186) (index!34494 lt!348855)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782749 (=> res!529649 e!435227)))

(assert (= (and d!102669 c!86954) b!782746))

(assert (= (and d!102669 (not c!86954)) b!782742))

(assert (= (and b!782742 c!86955) b!782744))

(assert (= (and b!782742 (not c!86955)) b!782747))

(assert (= (and d!102669 c!86953) b!782745))

(assert (= (and d!102669 (not c!86953)) b!782743))

(assert (= (and b!782743 res!529650) b!782748))

(assert (= (and b!782748 (not res!529648)) b!782749))

(assert (= (and b!782749 (not res!529649)) b!782741))

(declare-fun m!725481 () Bool)

(assert (=> b!782749 m!725481))

(declare-fun m!725483 () Bool)

(assert (=> d!102669 m!725483))

(assert (=> d!102669 m!725385))

(assert (=> b!782741 m!725481))

(assert (=> b!782747 m!725451))

(assert (=> b!782747 m!725451))

(assert (=> b!782747 m!725343))

(declare-fun m!725485 () Bool)

(assert (=> b!782747 m!725485))

(assert (=> b!782748 m!725481))

(assert (=> b!782584 d!102669))

(declare-fun b!782767 () Bool)

(declare-fun e!435240 () SeekEntryResult!8031)

(assert (=> b!782767 (= e!435240 (MissingVacant!8031 resIntermediateIndex!5))))

(declare-fun b!782768 () Bool)

(declare-fun c!86964 () Bool)

(declare-fun lt!348861 () (_ BitVec 64))

(assert (=> b!782768 (= c!86964 (= lt!348861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435238 () SeekEntryResult!8031)

(assert (=> b!782768 (= e!435238 e!435240)))

(declare-fun b!782769 () Bool)

(declare-fun e!435239 () SeekEntryResult!8031)

(assert (=> b!782769 (= e!435239 Undefined!8031)))

(declare-fun b!782770 () Bool)

(assert (=> b!782770 (= e!435238 (Found!8031 resIntermediateIndex!5))))

(declare-fun b!782771 () Bool)

(assert (=> b!782771 (= e!435239 e!435238)))

(declare-fun c!86965 () Bool)

(assert (=> b!782771 (= c!86965 (= lt!348861 (select (arr!20431 a!3186) j!159)))))

(declare-fun b!782772 () Bool)

(assert (=> b!782772 (= e!435240 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20431 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102671 () Bool)

(declare-fun lt!348860 () SeekEntryResult!8031)

(assert (=> d!102671 (and (or ((_ is Undefined!8031) lt!348860) (not ((_ is Found!8031) lt!348860)) (and (bvsge (index!34493 lt!348860) #b00000000000000000000000000000000) (bvslt (index!34493 lt!348860) (size!20852 a!3186)))) (or ((_ is Undefined!8031) lt!348860) ((_ is Found!8031) lt!348860) (not ((_ is MissingVacant!8031) lt!348860)) (not (= (index!34495 lt!348860) resIntermediateIndex!5)) (and (bvsge (index!34495 lt!348860) #b00000000000000000000000000000000) (bvslt (index!34495 lt!348860) (size!20852 a!3186)))) (or ((_ is Undefined!8031) lt!348860) (ite ((_ is Found!8031) lt!348860) (= (select (arr!20431 a!3186) (index!34493 lt!348860)) (select (arr!20431 a!3186) j!159)) (and ((_ is MissingVacant!8031) lt!348860) (= (index!34495 lt!348860) resIntermediateIndex!5) (= (select (arr!20431 a!3186) (index!34495 lt!348860)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102671 (= lt!348860 e!435239)))

(declare-fun c!86963 () Bool)

(assert (=> d!102671 (= c!86963 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102671 (= lt!348861 (select (arr!20431 a!3186) resIntermediateIndex!5))))

(assert (=> d!102671 (validMask!0 mask!3328)))

(assert (=> d!102671 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!348860)))

(assert (= (and d!102671 c!86963) b!782769))

(assert (= (and d!102671 (not c!86963)) b!782771))

(assert (= (and b!782771 c!86965) b!782770))

(assert (= (and b!782771 (not c!86965)) b!782768))

(assert (= (and b!782768 c!86964) b!782767))

(assert (= (and b!782768 (not c!86964)) b!782772))

(declare-fun m!725495 () Bool)

(assert (=> b!782772 m!725495))

(assert (=> b!782772 m!725495))

(assert (=> b!782772 m!725343))

(declare-fun m!725497 () Bool)

(assert (=> b!782772 m!725497))

(declare-fun m!725499 () Bool)

(assert (=> d!102671 m!725499))

(declare-fun m!725501 () Bool)

(assert (=> d!102671 m!725501))

(assert (=> d!102671 m!725359))

(assert (=> d!102671 m!725385))

(assert (=> b!782585 d!102671))

(declare-fun b!782773 () Bool)

(declare-fun e!435242 () SeekEntryResult!8031)

(declare-fun lt!348863 () SeekEntryResult!8031)

(assert (=> b!782773 (= e!435242 (seekKeyOrZeroReturnVacant!0 (x!65442 lt!348863) (index!34494 lt!348863) (index!34494 lt!348863) lt!348778 lt!348781 mask!3328))))

(declare-fun b!782774 () Bool)

(assert (=> b!782774 (= e!435242 (MissingZero!8031 (index!34494 lt!348863)))))

(declare-fun b!782775 () Bool)

(declare-fun c!86967 () Bool)

(declare-fun lt!348864 () (_ BitVec 64))

(assert (=> b!782775 (= c!86967 (= lt!348864 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435241 () SeekEntryResult!8031)

(assert (=> b!782775 (= e!435241 e!435242)))

(declare-fun b!782777 () Bool)

(declare-fun e!435243 () SeekEntryResult!8031)

(assert (=> b!782777 (= e!435243 e!435241)))

(assert (=> b!782777 (= lt!348864 (select (arr!20431 lt!348781) (index!34494 lt!348863)))))

(declare-fun c!86968 () Bool)

(assert (=> b!782777 (= c!86968 (= lt!348864 lt!348778))))

(declare-fun b!782778 () Bool)

(assert (=> b!782778 (= e!435243 Undefined!8031)))

(declare-fun d!102679 () Bool)

(declare-fun lt!348862 () SeekEntryResult!8031)

(assert (=> d!102679 (and (or ((_ is Undefined!8031) lt!348862) (not ((_ is Found!8031) lt!348862)) (and (bvsge (index!34493 lt!348862) #b00000000000000000000000000000000) (bvslt (index!34493 lt!348862) (size!20852 lt!348781)))) (or ((_ is Undefined!8031) lt!348862) ((_ is Found!8031) lt!348862) (not ((_ is MissingZero!8031) lt!348862)) (and (bvsge (index!34492 lt!348862) #b00000000000000000000000000000000) (bvslt (index!34492 lt!348862) (size!20852 lt!348781)))) (or ((_ is Undefined!8031) lt!348862) ((_ is Found!8031) lt!348862) ((_ is MissingZero!8031) lt!348862) (not ((_ is MissingVacant!8031) lt!348862)) (and (bvsge (index!34495 lt!348862) #b00000000000000000000000000000000) (bvslt (index!34495 lt!348862) (size!20852 lt!348781)))) (or ((_ is Undefined!8031) lt!348862) (ite ((_ is Found!8031) lt!348862) (= (select (arr!20431 lt!348781) (index!34493 lt!348862)) lt!348778) (ite ((_ is MissingZero!8031) lt!348862) (= (select (arr!20431 lt!348781) (index!34492 lt!348862)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8031) lt!348862) (= (select (arr!20431 lt!348781) (index!34495 lt!348862)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102679 (= lt!348862 e!435243)))

(declare-fun c!86966 () Bool)

(assert (=> d!102679 (= c!86966 (and ((_ is Intermediate!8031) lt!348863) (undefined!8843 lt!348863)))))

(assert (=> d!102679 (= lt!348863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348778 mask!3328) lt!348778 lt!348781 mask!3328))))

(assert (=> d!102679 (validMask!0 mask!3328)))

(assert (=> d!102679 (= (seekEntryOrOpen!0 lt!348778 lt!348781 mask!3328) lt!348862)))

(declare-fun b!782776 () Bool)

(assert (=> b!782776 (= e!435241 (Found!8031 (index!34494 lt!348863)))))

(assert (= (and d!102679 c!86966) b!782778))

(assert (= (and d!102679 (not c!86966)) b!782777))

(assert (= (and b!782777 c!86968) b!782776))

(assert (= (and b!782777 (not c!86968)) b!782775))

(assert (= (and b!782775 c!86967) b!782774))

(assert (= (and b!782775 (not c!86967)) b!782773))

(declare-fun m!725503 () Bool)

(assert (=> b!782773 m!725503))

(declare-fun m!725505 () Bool)

(assert (=> b!782777 m!725505))

(assert (=> d!102679 m!725361))

(declare-fun m!725507 () Bool)

(assert (=> d!102679 m!725507))

(assert (=> d!102679 m!725385))

(assert (=> d!102679 m!725361))

(assert (=> d!102679 m!725363))

(declare-fun m!725509 () Bool)

(assert (=> d!102679 m!725509))

(declare-fun m!725511 () Bool)

(assert (=> d!102679 m!725511))

(assert (=> b!782587 d!102679))

(declare-fun b!782779 () Bool)

(declare-fun e!435246 () SeekEntryResult!8031)

(assert (=> b!782779 (= e!435246 (MissingVacant!8031 index!1321))))

(declare-fun b!782780 () Bool)

(declare-fun c!86970 () Bool)

(declare-fun lt!348866 () (_ BitVec 64))

(assert (=> b!782780 (= c!86970 (= lt!348866 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435244 () SeekEntryResult!8031)

(assert (=> b!782780 (= e!435244 e!435246)))

(declare-fun b!782781 () Bool)

(declare-fun e!435245 () SeekEntryResult!8031)

(assert (=> b!782781 (= e!435245 Undefined!8031)))

(declare-fun b!782782 () Bool)

(assert (=> b!782782 (= e!435244 (Found!8031 index!1321))))

(declare-fun b!782783 () Bool)

(assert (=> b!782783 (= e!435245 e!435244)))

(declare-fun c!86971 () Bool)

(assert (=> b!782783 (= c!86971 (= lt!348866 lt!348778))))

(declare-fun b!782784 () Bool)

(assert (=> b!782784 (= e!435246 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) index!1321 lt!348778 lt!348781 mask!3328))))

(declare-fun d!102681 () Bool)

(declare-fun lt!348865 () SeekEntryResult!8031)

(assert (=> d!102681 (and (or ((_ is Undefined!8031) lt!348865) (not ((_ is Found!8031) lt!348865)) (and (bvsge (index!34493 lt!348865) #b00000000000000000000000000000000) (bvslt (index!34493 lt!348865) (size!20852 lt!348781)))) (or ((_ is Undefined!8031) lt!348865) ((_ is Found!8031) lt!348865) (not ((_ is MissingVacant!8031) lt!348865)) (not (= (index!34495 lt!348865) index!1321)) (and (bvsge (index!34495 lt!348865) #b00000000000000000000000000000000) (bvslt (index!34495 lt!348865) (size!20852 lt!348781)))) (or ((_ is Undefined!8031) lt!348865) (ite ((_ is Found!8031) lt!348865) (= (select (arr!20431 lt!348781) (index!34493 lt!348865)) lt!348778) (and ((_ is MissingVacant!8031) lt!348865) (= (index!34495 lt!348865) index!1321) (= (select (arr!20431 lt!348781) (index!34495 lt!348865)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102681 (= lt!348865 e!435245)))

(declare-fun c!86969 () Bool)

(assert (=> d!102681 (= c!86969 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102681 (= lt!348866 (select (arr!20431 lt!348781) index!1321))))

(assert (=> d!102681 (validMask!0 mask!3328)))

(assert (=> d!102681 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!348778 lt!348781 mask!3328) lt!348865)))

(assert (= (and d!102681 c!86969) b!782781))

(assert (= (and d!102681 (not c!86969)) b!782783))

(assert (= (and b!782783 c!86971) b!782782))

(assert (= (and b!782783 (not c!86971)) b!782780))

(assert (= (and b!782780 c!86970) b!782779))

(assert (= (and b!782780 (not c!86970)) b!782784))

(assert (=> b!782784 m!725451))

(assert (=> b!782784 m!725451))

(declare-fun m!725513 () Bool)

(assert (=> b!782784 m!725513))

(declare-fun m!725515 () Bool)

(assert (=> d!102681 m!725515))

(declare-fun m!725517 () Bool)

(assert (=> d!102681 m!725517))

(assert (=> d!102681 m!725449))

(assert (=> d!102681 m!725385))

(assert (=> b!782587 d!102681))

(declare-fun b!782785 () Bool)

(declare-fun lt!348868 () SeekEntryResult!8031)

(assert (=> b!782785 (and (bvsge (index!34494 lt!348868) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348868) (size!20852 a!3186)))))

(declare-fun e!435251 () Bool)

(assert (=> b!782785 (= e!435251 (= (select (arr!20431 a!3186) (index!34494 lt!348868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782786 () Bool)

(declare-fun e!435247 () SeekEntryResult!8031)

(declare-fun e!435250 () SeekEntryResult!8031)

(assert (=> b!782786 (= e!435247 e!435250)))

(declare-fun lt!348867 () (_ BitVec 64))

(declare-fun c!86974 () Bool)

(assert (=> b!782786 (= c!86974 (or (= lt!348867 (select (arr!20431 a!3186) j!159)) (= (bvadd lt!348867 lt!348867) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782787 () Bool)

(declare-fun e!435249 () Bool)

(declare-fun e!435248 () Bool)

(assert (=> b!782787 (= e!435249 e!435248)))

(declare-fun res!529656 () Bool)

(assert (=> b!782787 (= res!529656 (and ((_ is Intermediate!8031) lt!348868) (not (undefined!8843 lt!348868)) (bvslt (x!65442 lt!348868) #b01111111111111111111111111111110) (bvsge (x!65442 lt!348868) #b00000000000000000000000000000000) (bvsge (x!65442 lt!348868) #b00000000000000000000000000000000)))))

(assert (=> b!782787 (=> (not res!529656) (not e!435248))))

(declare-fun d!102683 () Bool)

(assert (=> d!102683 e!435249))

(declare-fun c!86972 () Bool)

(assert (=> d!102683 (= c!86972 (and ((_ is Intermediate!8031) lt!348868) (undefined!8843 lt!348868)))))

(assert (=> d!102683 (= lt!348868 e!435247)))

(declare-fun c!86973 () Bool)

(assert (=> d!102683 (= c!86973 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102683 (= lt!348867 (select (arr!20431 a!3186) (toIndex!0 (select (arr!20431 a!3186) j!159) mask!3328)))))

(assert (=> d!102683 (validMask!0 mask!3328)))

(assert (=> d!102683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20431 a!3186) j!159) mask!3328) (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!348868)))

(declare-fun b!782788 () Bool)

(assert (=> b!782788 (= e!435250 (Intermediate!8031 false (toIndex!0 (select (arr!20431 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!782789 () Bool)

(assert (=> b!782789 (= e!435249 (bvsge (x!65442 lt!348868) #b01111111111111111111111111111110))))

(declare-fun b!782790 () Bool)

(assert (=> b!782790 (= e!435247 (Intermediate!8031 true (toIndex!0 (select (arr!20431 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!782791 () Bool)

(assert (=> b!782791 (= e!435250 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20431 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20431 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782792 () Bool)

(assert (=> b!782792 (and (bvsge (index!34494 lt!348868) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348868) (size!20852 a!3186)))))

(declare-fun res!529654 () Bool)

(assert (=> b!782792 (= res!529654 (= (select (arr!20431 a!3186) (index!34494 lt!348868)) (select (arr!20431 a!3186) j!159)))))

(assert (=> b!782792 (=> res!529654 e!435251)))

(assert (=> b!782792 (= e!435248 e!435251)))

(declare-fun b!782793 () Bool)

(assert (=> b!782793 (and (bvsge (index!34494 lt!348868) #b00000000000000000000000000000000) (bvslt (index!34494 lt!348868) (size!20852 a!3186)))))

(declare-fun res!529655 () Bool)

(assert (=> b!782793 (= res!529655 (= (select (arr!20431 a!3186) (index!34494 lt!348868)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782793 (=> res!529655 e!435251)))

(assert (= (and d!102683 c!86973) b!782790))

(assert (= (and d!102683 (not c!86973)) b!782786))

(assert (= (and b!782786 c!86974) b!782788))

(assert (= (and b!782786 (not c!86974)) b!782791))

(assert (= (and d!102683 c!86972) b!782789))

(assert (= (and d!102683 (not c!86972)) b!782787))

(assert (= (and b!782787 res!529656) b!782792))

(assert (= (and b!782792 (not res!529654)) b!782793))

(assert (= (and b!782793 (not res!529655)) b!782785))

(declare-fun m!725519 () Bool)

(assert (=> b!782793 m!725519))

(assert (=> d!102683 m!725379))

(declare-fun m!725521 () Bool)

(assert (=> d!102683 m!725521))

(assert (=> d!102683 m!725385))

(assert (=> b!782785 m!725519))

(assert (=> b!782791 m!725379))

(declare-fun m!725523 () Bool)

(assert (=> b!782791 m!725523))

(assert (=> b!782791 m!725523))

(assert (=> b!782791 m!725343))

(declare-fun m!725525 () Bool)

(assert (=> b!782791 m!725525))

(assert (=> b!782792 m!725519))

(assert (=> b!782598 d!102683))

(declare-fun d!102685 () Bool)

(declare-fun lt!348870 () (_ BitVec 32))

(declare-fun lt!348869 () (_ BitVec 32))

(assert (=> d!102685 (= lt!348870 (bvmul (bvxor lt!348869 (bvlshr lt!348869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102685 (= lt!348869 ((_ extract 31 0) (bvand (bvxor (select (arr!20431 a!3186) j!159) (bvlshr (select (arr!20431 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102685 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!529635 (let ((h!15551 ((_ extract 31 0) (bvand (bvxor (select (arr!20431 a!3186) j!159) (bvlshr (select (arr!20431 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65445 (bvmul (bvxor h!15551 (bvlshr h!15551 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65445 (bvlshr x!65445 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!529635 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!529635 #b00000000000000000000000000000000))))))

(assert (=> d!102685 (= (toIndex!0 (select (arr!20431 a!3186) j!159) mask!3328) (bvand (bvxor lt!348870 (bvlshr lt!348870 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!782598 d!102685))

(declare-fun d!102687 () Bool)

(declare-fun res!529661 () Bool)

(declare-fun e!435256 () Bool)

(assert (=> d!102687 (=> res!529661 e!435256)))

(assert (=> d!102687 (= res!529661 (= (select (arr!20431 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102687 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!435256)))

(declare-fun b!782798 () Bool)

(declare-fun e!435257 () Bool)

(assert (=> b!782798 (= e!435256 e!435257)))

(declare-fun res!529662 () Bool)

(assert (=> b!782798 (=> (not res!529662) (not e!435257))))

(assert (=> b!782798 (= res!529662 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20852 a!3186)))))

(declare-fun b!782799 () Bool)

(assert (=> b!782799 (= e!435257 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102687 (not res!529661)) b!782798))

(assert (= (and b!782798 res!529662) b!782799))

(declare-fun m!725527 () Bool)

(assert (=> d!102687 m!725527))

(declare-fun m!725529 () Bool)

(assert (=> b!782799 m!725529))

(assert (=> b!782597 d!102687))

(declare-fun d!102689 () Bool)

(assert (=> d!102689 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67580 d!102689))

(declare-fun d!102693 () Bool)

(assert (=> d!102693 (= (array_inv!16227 a!3186) (bvsge (size!20852 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67580 d!102693))

(declare-fun b!782855 () Bool)

(declare-fun e!435292 () Bool)

(declare-fun e!435291 () Bool)

(assert (=> b!782855 (= e!435292 e!435291)))

(declare-fun c!86995 () Bool)

(assert (=> b!782855 (= c!86995 (validKeyInArray!0 (select (arr!20431 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!782856 () Bool)

(declare-fun e!435293 () Bool)

(declare-fun contains!4109 (List!14433 (_ BitVec 64)) Bool)

(assert (=> b!782856 (= e!435293 (contains!4109 Nil!14430 (select (arr!20431 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!782857 () Bool)

(declare-fun e!435290 () Bool)

(assert (=> b!782857 (= e!435290 e!435292)))

(declare-fun res!529680 () Bool)

(assert (=> b!782857 (=> (not res!529680) (not e!435292))))

(assert (=> b!782857 (= res!529680 (not e!435293))))

(declare-fun res!529681 () Bool)

(assert (=> b!782857 (=> (not res!529681) (not e!435293))))

(assert (=> b!782857 (= res!529681 (validKeyInArray!0 (select (arr!20431 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!782858 () Bool)

(declare-fun call!35265 () Bool)

(assert (=> b!782858 (= e!435291 call!35265)))

(declare-fun d!102697 () Bool)

(declare-fun res!529679 () Bool)

(assert (=> d!102697 (=> res!529679 e!435290)))

(assert (=> d!102697 (= res!529679 (bvsge #b00000000000000000000000000000000 (size!20852 a!3186)))))

(assert (=> d!102697 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14430) e!435290)))

(declare-fun b!782859 () Bool)

(assert (=> b!782859 (= e!435291 call!35265)))

(declare-fun bm!35262 () Bool)

(assert (=> bm!35262 (= call!35265 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86995 (Cons!14429 (select (arr!20431 a!3186) #b00000000000000000000000000000000) Nil!14430) Nil!14430)))))

(assert (= (and d!102697 (not res!529679)) b!782857))

(assert (= (and b!782857 res!529681) b!782856))

(assert (= (and b!782857 res!529680) b!782855))

(assert (= (and b!782855 c!86995) b!782859))

(assert (= (and b!782855 (not c!86995)) b!782858))

(assert (= (or b!782859 b!782858) bm!35262))

(assert (=> b!782855 m!725527))

(assert (=> b!782855 m!725527))

(declare-fun m!725549 () Bool)

(assert (=> b!782855 m!725549))

(assert (=> b!782856 m!725527))

(assert (=> b!782856 m!725527))

(declare-fun m!725551 () Bool)

(assert (=> b!782856 m!725551))

(assert (=> b!782857 m!725527))

(assert (=> b!782857 m!725527))

(assert (=> b!782857 m!725549))

(assert (=> bm!35262 m!725527))

(declare-fun m!725553 () Bool)

(assert (=> bm!35262 m!725553))

(assert (=> b!782588 d!102697))

(declare-fun b!782860 () Bool)

(declare-fun e!435295 () SeekEntryResult!8031)

(declare-fun lt!348890 () SeekEntryResult!8031)

(assert (=> b!782860 (= e!435295 (seekKeyOrZeroReturnVacant!0 (x!65442 lt!348890) (index!34494 lt!348890) (index!34494 lt!348890) k0!2102 a!3186 mask!3328))))

(declare-fun b!782861 () Bool)

(assert (=> b!782861 (= e!435295 (MissingZero!8031 (index!34494 lt!348890)))))

(declare-fun b!782862 () Bool)

(declare-fun c!86997 () Bool)

(declare-fun lt!348891 () (_ BitVec 64))

(assert (=> b!782862 (= c!86997 (= lt!348891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435294 () SeekEntryResult!8031)

(assert (=> b!782862 (= e!435294 e!435295)))

(declare-fun b!782864 () Bool)

(declare-fun e!435296 () SeekEntryResult!8031)

(assert (=> b!782864 (= e!435296 e!435294)))

(assert (=> b!782864 (= lt!348891 (select (arr!20431 a!3186) (index!34494 lt!348890)))))

(declare-fun c!86998 () Bool)

(assert (=> b!782864 (= c!86998 (= lt!348891 k0!2102))))

(declare-fun b!782865 () Bool)

(assert (=> b!782865 (= e!435296 Undefined!8031)))

(declare-fun d!102703 () Bool)

(declare-fun lt!348889 () SeekEntryResult!8031)

(assert (=> d!102703 (and (or ((_ is Undefined!8031) lt!348889) (not ((_ is Found!8031) lt!348889)) (and (bvsge (index!34493 lt!348889) #b00000000000000000000000000000000) (bvslt (index!34493 lt!348889) (size!20852 a!3186)))) (or ((_ is Undefined!8031) lt!348889) ((_ is Found!8031) lt!348889) (not ((_ is MissingZero!8031) lt!348889)) (and (bvsge (index!34492 lt!348889) #b00000000000000000000000000000000) (bvslt (index!34492 lt!348889) (size!20852 a!3186)))) (or ((_ is Undefined!8031) lt!348889) ((_ is Found!8031) lt!348889) ((_ is MissingZero!8031) lt!348889) (not ((_ is MissingVacant!8031) lt!348889)) (and (bvsge (index!34495 lt!348889) #b00000000000000000000000000000000) (bvslt (index!34495 lt!348889) (size!20852 a!3186)))) (or ((_ is Undefined!8031) lt!348889) (ite ((_ is Found!8031) lt!348889) (= (select (arr!20431 a!3186) (index!34493 lt!348889)) k0!2102) (ite ((_ is MissingZero!8031) lt!348889) (= (select (arr!20431 a!3186) (index!34492 lt!348889)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8031) lt!348889) (= (select (arr!20431 a!3186) (index!34495 lt!348889)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102703 (= lt!348889 e!435296)))

(declare-fun c!86996 () Bool)

(assert (=> d!102703 (= c!86996 (and ((_ is Intermediate!8031) lt!348890) (undefined!8843 lt!348890)))))

(assert (=> d!102703 (= lt!348890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102703 (validMask!0 mask!3328)))

(assert (=> d!102703 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!348889)))

(declare-fun b!782863 () Bool)

(assert (=> b!782863 (= e!435294 (Found!8031 (index!34494 lt!348890)))))

(assert (= (and d!102703 c!86996) b!782865))

(assert (= (and d!102703 (not c!86996)) b!782864))

(assert (= (and b!782864 c!86998) b!782863))

(assert (= (and b!782864 (not c!86998)) b!782862))

(assert (= (and b!782862 c!86997) b!782861))

(assert (= (and b!782862 (not c!86997)) b!782860))

(declare-fun m!725555 () Bool)

(assert (=> b!782860 m!725555))

(declare-fun m!725557 () Bool)

(assert (=> b!782864 m!725557))

(declare-fun m!725559 () Bool)

(assert (=> d!102703 m!725559))

(declare-fun m!725561 () Bool)

(assert (=> d!102703 m!725561))

(assert (=> d!102703 m!725385))

(assert (=> d!102703 m!725559))

(declare-fun m!725563 () Bool)

(assert (=> d!102703 m!725563))

(declare-fun m!725565 () Bool)

(assert (=> d!102703 m!725565))

(declare-fun m!725567 () Bool)

(assert (=> d!102703 m!725567))

(assert (=> b!782590 d!102703))

(declare-fun b!782866 () Bool)

(declare-fun e!435299 () SeekEntryResult!8031)

(assert (=> b!782866 (= e!435299 (MissingVacant!8031 resIntermediateIndex!5))))

(declare-fun b!782867 () Bool)

(declare-fun c!87000 () Bool)

(declare-fun lt!348893 () (_ BitVec 64))

(assert (=> b!782867 (= c!87000 (= lt!348893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435297 () SeekEntryResult!8031)

(assert (=> b!782867 (= e!435297 e!435299)))

(declare-fun b!782868 () Bool)

(declare-fun e!435298 () SeekEntryResult!8031)

(assert (=> b!782868 (= e!435298 Undefined!8031)))

(declare-fun b!782869 () Bool)

(assert (=> b!782869 (= e!435297 (Found!8031 index!1321))))

(declare-fun b!782870 () Bool)

(assert (=> b!782870 (= e!435298 e!435297)))

(declare-fun c!87001 () Bool)

(assert (=> b!782870 (= c!87001 (= lt!348893 (select (arr!20431 a!3186) j!159)))))

(declare-fun b!782871 () Bool)

(assert (=> b!782871 (= e!435299 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20431 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102705 () Bool)

(declare-fun lt!348892 () SeekEntryResult!8031)

(assert (=> d!102705 (and (or ((_ is Undefined!8031) lt!348892) (not ((_ is Found!8031) lt!348892)) (and (bvsge (index!34493 lt!348892) #b00000000000000000000000000000000) (bvslt (index!34493 lt!348892) (size!20852 a!3186)))) (or ((_ is Undefined!8031) lt!348892) ((_ is Found!8031) lt!348892) (not ((_ is MissingVacant!8031) lt!348892)) (not (= (index!34495 lt!348892) resIntermediateIndex!5)) (and (bvsge (index!34495 lt!348892) #b00000000000000000000000000000000) (bvslt (index!34495 lt!348892) (size!20852 a!3186)))) (or ((_ is Undefined!8031) lt!348892) (ite ((_ is Found!8031) lt!348892) (= (select (arr!20431 a!3186) (index!34493 lt!348892)) (select (arr!20431 a!3186) j!159)) (and ((_ is MissingVacant!8031) lt!348892) (= (index!34495 lt!348892) resIntermediateIndex!5) (= (select (arr!20431 a!3186) (index!34495 lt!348892)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102705 (= lt!348892 e!435298)))

(declare-fun c!86999 () Bool)

(assert (=> d!102705 (= c!86999 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102705 (= lt!348893 (select (arr!20431 a!3186) index!1321))))

(assert (=> d!102705 (validMask!0 mask!3328)))

(assert (=> d!102705 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!348892)))

(assert (= (and d!102705 c!86999) b!782868))

(assert (= (and d!102705 (not c!86999)) b!782870))

(assert (= (and b!782870 c!87001) b!782869))

(assert (= (and b!782870 (not c!87001)) b!782867))

(assert (= (and b!782867 c!87000) b!782866))

(assert (= (and b!782867 (not c!87000)) b!782871))

(assert (=> b!782871 m!725451))

(assert (=> b!782871 m!725451))

(assert (=> b!782871 m!725343))

(declare-fun m!725569 () Bool)

(assert (=> b!782871 m!725569))

(declare-fun m!725571 () Bool)

(assert (=> d!102705 m!725571))

(declare-fun m!725573 () Bool)

(assert (=> d!102705 m!725573))

(assert (=> d!102705 m!725483))

(assert (=> d!102705 m!725385))

(assert (=> b!782589 d!102705))

(declare-fun d!102707 () Bool)

(assert (=> d!102707 (= (validKeyInArray!0 (select (arr!20431 a!3186) j!159)) (and (not (= (select (arr!20431 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20431 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!782600 d!102707))

(declare-fun b!782872 () Bool)

(declare-fun e!435300 () Bool)

(declare-fun call!35266 () Bool)

(assert (=> b!782872 (= e!435300 call!35266)))

(declare-fun b!782873 () Bool)

(declare-fun e!435302 () Bool)

(declare-fun e!435301 () Bool)

(assert (=> b!782873 (= e!435302 e!435301)))

(declare-fun c!87002 () Bool)

(assert (=> b!782873 (= c!87002 (validKeyInArray!0 (select (arr!20431 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!782874 () Bool)

(assert (=> b!782874 (= e!435301 e!435300)))

(declare-fun lt!348894 () (_ BitVec 64))

(assert (=> b!782874 (= lt!348894 (select (arr!20431 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!348896 () Unit!27012)

(assert (=> b!782874 (= lt!348896 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348894 #b00000000000000000000000000000000))))

(assert (=> b!782874 (arrayContainsKey!0 a!3186 lt!348894 #b00000000000000000000000000000000)))

(declare-fun lt!348895 () Unit!27012)

(assert (=> b!782874 (= lt!348895 lt!348896)))

(declare-fun res!529683 () Bool)

(assert (=> b!782874 (= res!529683 (= (seekEntryOrOpen!0 (select (arr!20431 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8031 #b00000000000000000000000000000000)))))

(assert (=> b!782874 (=> (not res!529683) (not e!435300))))

(declare-fun b!782875 () Bool)

(assert (=> b!782875 (= e!435301 call!35266)))

(declare-fun bm!35263 () Bool)

(assert (=> bm!35263 (= call!35266 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!102709 () Bool)

(declare-fun res!529682 () Bool)

(assert (=> d!102709 (=> res!529682 e!435302)))

(assert (=> d!102709 (= res!529682 (bvsge #b00000000000000000000000000000000 (size!20852 a!3186)))))

(assert (=> d!102709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!435302)))

(assert (= (and d!102709 (not res!529682)) b!782873))

(assert (= (and b!782873 c!87002) b!782874))

(assert (= (and b!782873 (not c!87002)) b!782875))

(assert (= (and b!782874 res!529683) b!782872))

(assert (= (or b!782872 b!782875) bm!35263))

(assert (=> b!782873 m!725527))

(assert (=> b!782873 m!725527))

(assert (=> b!782873 m!725549))

(assert (=> b!782874 m!725527))

(declare-fun m!725575 () Bool)

(assert (=> b!782874 m!725575))

(declare-fun m!725577 () Bool)

(assert (=> b!782874 m!725577))

(assert (=> b!782874 m!725527))

(declare-fun m!725579 () Bool)

(assert (=> b!782874 m!725579))

(declare-fun m!725581 () Bool)

(assert (=> bm!35263 m!725581))

(assert (=> b!782591 d!102709))

(assert (=> b!782601 d!102705))

(check-sat (not b!782747) (not b!782799) (not d!102705) (not d!102683) (not bm!35262) (not b!782874) (not b!782773) (not b!782856) (not b!782728) (not d!102651) (not b!782713) (not b!782873) (not b!782860) (not d!102671) (not b!782855) (not b!782772) (not b!782698) (not d!102659) (not d!102653) (not b!782871) (not d!102703) (not b!782729) (not d!102665) (not b!782689) (not bm!35256) (not b!782791) (not b!782784) (not b!782857) (not bm!35263) (not d!102679) (not d!102669) (not d!102681))
(check-sat)
