; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65718 () Bool)

(assert start!65718)

(declare-fun b!750592 () Bool)

(declare-fun res!506331 () Bool)

(declare-fun e!418880 () Bool)

(assert (=> b!750592 (=> (not res!506331) (not e!418880))))

(declare-datatypes ((array!41761 0))(
  ( (array!41762 (arr!19990 (Array (_ BitVec 32) (_ BitVec 64))) (size!20410 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41761)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750592 (= res!506331 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750593 () Bool)

(declare-fun e!418877 () Bool)

(assert (=> b!750593 (= e!418877 true)))

(declare-fun e!418871 () Bool)

(assert (=> b!750593 e!418871))

(declare-fun res!506317 () Bool)

(assert (=> b!750593 (=> (not res!506317) (not e!418871))))

(declare-fun lt!333698 () (_ BitVec 64))

(assert (=> b!750593 (= res!506317 (= lt!333698 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25741 0))(
  ( (Unit!25742) )
))
(declare-fun lt!333701 () Unit!25741)

(declare-fun e!418879 () Unit!25741)

(assert (=> b!750593 (= lt!333701 e!418879)))

(declare-fun c!82523 () Bool)

(assert (=> b!750593 (= c!82523 (= lt!333698 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750594 () Bool)

(declare-fun res!506324 () Bool)

(assert (=> b!750594 (=> (not res!506324) (not e!418880))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!750594 (= res!506324 (and (= (size!20410 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20410 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20410 a!3186)) (not (= i!1173 j!159))))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!750595 () Bool)

(declare-fun lt!333699 () (_ BitVec 64))

(declare-fun lt!333708 () array!41761)

(declare-datatypes ((SeekEntryResult!7546 0))(
  ( (MissingZero!7546 (index!32552 (_ BitVec 32))) (Found!7546 (index!32553 (_ BitVec 32))) (Intermediate!7546 (undefined!8358 Bool) (index!32554 (_ BitVec 32)) (x!63644 (_ BitVec 32))) (Undefined!7546) (MissingVacant!7546 (index!32555 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41761 (_ BitVec 32)) SeekEntryResult!7546)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41761 (_ BitVec 32)) SeekEntryResult!7546)

(assert (=> b!750595 (= e!418871 (= (seekEntryOrOpen!0 lt!333699 lt!333708 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333699 lt!333708 mask!3328)))))

(declare-fun res!506320 () Bool)

(assert (=> start!65718 (=> (not res!506320) (not e!418880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65718 (= res!506320 (validMask!0 mask!3328))))

(assert (=> start!65718 e!418880))

(assert (=> start!65718 true))

(declare-fun array_inv!15849 (array!41761) Bool)

(assert (=> start!65718 (array_inv!15849 a!3186)))

(declare-fun b!750596 () Bool)

(declare-fun e!418873 () Bool)

(assert (=> b!750596 (= e!418873 e!418877)))

(declare-fun res!506332 () Bool)

(assert (=> b!750596 (=> res!506332 e!418877)))

(assert (=> b!750596 (= res!506332 (= lt!333698 lt!333699))))

(assert (=> b!750596 (= lt!333698 (select (store (arr!19990 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750597 () Bool)

(declare-fun e!418876 () Bool)

(assert (=> b!750597 (= e!418876 (not e!418873))))

(declare-fun res!506316 () Bool)

(assert (=> b!750597 (=> res!506316 e!418873)))

(declare-fun lt!333700 () SeekEntryResult!7546)

(get-info :version)

(assert (=> b!750597 (= res!506316 (or (not ((_ is Intermediate!7546) lt!333700)) (bvslt x!1131 (x!63644 lt!333700)) (not (= x!1131 (x!63644 lt!333700))) (not (= index!1321 (index!32554 lt!333700)))))))

(declare-fun e!418878 () Bool)

(assert (=> b!750597 e!418878))

(declare-fun res!506319 () Bool)

(assert (=> b!750597 (=> (not res!506319) (not e!418878))))

(declare-fun lt!333705 () SeekEntryResult!7546)

(declare-fun lt!333704 () SeekEntryResult!7546)

(assert (=> b!750597 (= res!506319 (= lt!333705 lt!333704))))

(assert (=> b!750597 (= lt!333704 (Found!7546 j!159))))

(assert (=> b!750597 (= lt!333705 (seekEntryOrOpen!0 (select (arr!19990 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41761 (_ BitVec 32)) Bool)

(assert (=> b!750597 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333702 () Unit!25741)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25741)

(assert (=> b!750597 (= lt!333702 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750598 () Bool)

(declare-fun Unit!25743 () Unit!25741)

(assert (=> b!750598 (= e!418879 Unit!25743)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!750599 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!750599 (= e!418878 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19990 a!3186) j!159) a!3186 mask!3328) lt!333704))))

(declare-fun b!750600 () Bool)

(declare-fun e!418881 () Bool)

(assert (=> b!750600 (= e!418881 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19990 a!3186) j!159) a!3186 mask!3328) (Found!7546 j!159)))))

(declare-fun b!750601 () Bool)

(declare-fun res!506325 () Bool)

(declare-fun e!418872 () Bool)

(assert (=> b!750601 (=> (not res!506325) (not e!418872))))

(assert (=> b!750601 (= res!506325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750602 () Bool)

(declare-fun e!418874 () Bool)

(assert (=> b!750602 (= e!418872 e!418874)))

(declare-fun res!506329 () Bool)

(assert (=> b!750602 (=> (not res!506329) (not e!418874))))

(declare-fun lt!333703 () SeekEntryResult!7546)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41761 (_ BitVec 32)) SeekEntryResult!7546)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750602 (= res!506329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19990 a!3186) j!159) mask!3328) (select (arr!19990 a!3186) j!159) a!3186 mask!3328) lt!333703))))

(assert (=> b!750602 (= lt!333703 (Intermediate!7546 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750603 () Bool)

(declare-fun res!506326 () Bool)

(assert (=> b!750603 (=> (not res!506326) (not e!418874))))

(assert (=> b!750603 (= res!506326 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19990 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750604 () Bool)

(assert (=> b!750604 (= e!418880 e!418872)))

(declare-fun res!506327 () Bool)

(assert (=> b!750604 (=> (not res!506327) (not e!418872))))

(declare-fun lt!333706 () SeekEntryResult!7546)

(assert (=> b!750604 (= res!506327 (or (= lt!333706 (MissingZero!7546 i!1173)) (= lt!333706 (MissingVacant!7546 i!1173))))))

(assert (=> b!750604 (= lt!333706 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750605 () Bool)

(assert (=> b!750605 (= e!418874 e!418876)))

(declare-fun res!506321 () Bool)

(assert (=> b!750605 (=> (not res!506321) (not e!418876))))

(declare-fun lt!333707 () SeekEntryResult!7546)

(assert (=> b!750605 (= res!506321 (= lt!333707 lt!333700))))

(assert (=> b!750605 (= lt!333700 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333699 lt!333708 mask!3328))))

(assert (=> b!750605 (= lt!333707 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333699 mask!3328) lt!333699 lt!333708 mask!3328))))

(assert (=> b!750605 (= lt!333699 (select (store (arr!19990 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750605 (= lt!333708 (array!41762 (store (arr!19990 a!3186) i!1173 k0!2102) (size!20410 a!3186)))))

(declare-fun b!750606 () Bool)

(declare-fun res!506318 () Bool)

(assert (=> b!750606 (=> res!506318 e!418873)))

(assert (=> b!750606 (= res!506318 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19990 a!3186) j!159) a!3186 mask!3328) lt!333704)))))

(declare-fun b!750607 () Bool)

(declare-fun Unit!25744 () Unit!25741)

(assert (=> b!750607 (= e!418879 Unit!25744)))

(assert (=> b!750607 false))

(declare-fun b!750608 () Bool)

(declare-fun res!506330 () Bool)

(assert (=> b!750608 (=> (not res!506330) (not e!418874))))

(assert (=> b!750608 (= res!506330 e!418881)))

(declare-fun c!82522 () Bool)

(assert (=> b!750608 (= c!82522 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750609 () Bool)

(assert (=> b!750609 (= e!418881 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19990 a!3186) j!159) a!3186 mask!3328) lt!333703))))

(declare-fun b!750610 () Bool)

(declare-fun res!506315 () Bool)

(assert (=> b!750610 (=> (not res!506315) (not e!418872))))

(assert (=> b!750610 (= res!506315 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20410 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20410 a!3186))))))

(declare-fun b!750611 () Bool)

(declare-fun res!506328 () Bool)

(assert (=> b!750611 (=> (not res!506328) (not e!418880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750611 (= res!506328 (validKeyInArray!0 (select (arr!19990 a!3186) j!159)))))

(declare-fun b!750612 () Bool)

(declare-fun res!506322 () Bool)

(assert (=> b!750612 (=> (not res!506322) (not e!418880))))

(assert (=> b!750612 (= res!506322 (validKeyInArray!0 k0!2102))))

(declare-fun b!750613 () Bool)

(declare-fun res!506323 () Bool)

(assert (=> b!750613 (=> (not res!506323) (not e!418872))))

(declare-datatypes ((List!13899 0))(
  ( (Nil!13896) (Cons!13895 (h!14973 (_ BitVec 64)) (t!20206 List!13899)) )
))
(declare-fun arrayNoDuplicates!0 (array!41761 (_ BitVec 32) List!13899) Bool)

(assert (=> b!750613 (= res!506323 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13896))))

(assert (= (and start!65718 res!506320) b!750594))

(assert (= (and b!750594 res!506324) b!750611))

(assert (= (and b!750611 res!506328) b!750612))

(assert (= (and b!750612 res!506322) b!750592))

(assert (= (and b!750592 res!506331) b!750604))

(assert (= (and b!750604 res!506327) b!750601))

(assert (= (and b!750601 res!506325) b!750613))

(assert (= (and b!750613 res!506323) b!750610))

(assert (= (and b!750610 res!506315) b!750602))

(assert (= (and b!750602 res!506329) b!750603))

(assert (= (and b!750603 res!506326) b!750608))

(assert (= (and b!750608 c!82522) b!750609))

(assert (= (and b!750608 (not c!82522)) b!750600))

(assert (= (and b!750608 res!506330) b!750605))

(assert (= (and b!750605 res!506321) b!750597))

(assert (= (and b!750597 res!506319) b!750599))

(assert (= (and b!750597 (not res!506316)) b!750606))

(assert (= (and b!750606 (not res!506318)) b!750596))

(assert (= (and b!750596 (not res!506332)) b!750593))

(assert (= (and b!750593 c!82523) b!750607))

(assert (= (and b!750593 (not c!82523)) b!750598))

(assert (= (and b!750593 res!506317) b!750595))

(declare-fun m!700527 () Bool)

(assert (=> start!65718 m!700527))

(declare-fun m!700529 () Bool)

(assert (=> start!65718 m!700529))

(declare-fun m!700531 () Bool)

(assert (=> b!750599 m!700531))

(assert (=> b!750599 m!700531))

(declare-fun m!700533 () Bool)

(assert (=> b!750599 m!700533))

(declare-fun m!700535 () Bool)

(assert (=> b!750604 m!700535))

(assert (=> b!750597 m!700531))

(assert (=> b!750597 m!700531))

(declare-fun m!700537 () Bool)

(assert (=> b!750597 m!700537))

(declare-fun m!700539 () Bool)

(assert (=> b!750597 m!700539))

(declare-fun m!700541 () Bool)

(assert (=> b!750597 m!700541))

(assert (=> b!750600 m!700531))

(assert (=> b!750600 m!700531))

(declare-fun m!700543 () Bool)

(assert (=> b!750600 m!700543))

(declare-fun m!700545 () Bool)

(assert (=> b!750605 m!700545))

(declare-fun m!700547 () Bool)

(assert (=> b!750605 m!700547))

(declare-fun m!700549 () Bool)

(assert (=> b!750605 m!700549))

(assert (=> b!750605 m!700545))

(declare-fun m!700551 () Bool)

(assert (=> b!750605 m!700551))

(declare-fun m!700553 () Bool)

(assert (=> b!750605 m!700553))

(declare-fun m!700555 () Bool)

(assert (=> b!750603 m!700555))

(declare-fun m!700557 () Bool)

(assert (=> b!750612 m!700557))

(assert (=> b!750611 m!700531))

(assert (=> b!750611 m!700531))

(declare-fun m!700559 () Bool)

(assert (=> b!750611 m!700559))

(assert (=> b!750596 m!700549))

(declare-fun m!700561 () Bool)

(assert (=> b!750596 m!700561))

(assert (=> b!750609 m!700531))

(assert (=> b!750609 m!700531))

(declare-fun m!700563 () Bool)

(assert (=> b!750609 m!700563))

(declare-fun m!700565 () Bool)

(assert (=> b!750592 m!700565))

(assert (=> b!750602 m!700531))

(assert (=> b!750602 m!700531))

(declare-fun m!700567 () Bool)

(assert (=> b!750602 m!700567))

(assert (=> b!750602 m!700567))

(assert (=> b!750602 m!700531))

(declare-fun m!700569 () Bool)

(assert (=> b!750602 m!700569))

(declare-fun m!700571 () Bool)

(assert (=> b!750595 m!700571))

(declare-fun m!700573 () Bool)

(assert (=> b!750595 m!700573))

(declare-fun m!700575 () Bool)

(assert (=> b!750613 m!700575))

(declare-fun m!700577 () Bool)

(assert (=> b!750601 m!700577))

(assert (=> b!750606 m!700531))

(assert (=> b!750606 m!700531))

(assert (=> b!750606 m!700543))

(check-sat (not b!750601) (not b!750595) (not b!750609) (not b!750606) (not b!750611) (not b!750592) (not b!750612) (not b!750602) (not start!65718) (not b!750613) (not b!750600) (not b!750599) (not b!750605) (not b!750604) (not b!750597))
(check-sat)
