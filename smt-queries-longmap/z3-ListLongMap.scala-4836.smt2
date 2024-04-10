; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66490 () Bool)

(assert start!66490)

(declare-fun b!766496 () Bool)

(declare-fun res!518630 () Bool)

(declare-fun e!426825 () Bool)

(assert (=> b!766496 (=> (not res!518630) (not e!426825))))

(declare-datatypes ((array!42269 0))(
  ( (array!42270 (arr!20239 (Array (_ BitVec 32) (_ BitVec 64))) (size!20660 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42269)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!766496 (= res!518630 (and (= (size!20660 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20660 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20660 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766497 () Bool)

(declare-fun res!518629 () Bool)

(declare-fun e!426829 () Bool)

(assert (=> b!766497 (=> (not res!518629) (not e!426829))))

(declare-fun e!426833 () Bool)

(assert (=> b!766497 (= res!518629 e!426833)))

(declare-fun c!84328 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766497 (= c!84328 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766498 () Bool)

(declare-fun res!518633 () Bool)

(assert (=> b!766498 (=> (not res!518633) (not e!426829))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!766498 (= res!518633 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20239 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766499 () Bool)

(declare-fun e!426826 () Bool)

(assert (=> b!766499 (= e!426826 e!426829)))

(declare-fun res!518628 () Bool)

(assert (=> b!766499 (=> (not res!518628) (not e!426829))))

(declare-datatypes ((SeekEntryResult!7839 0))(
  ( (MissingZero!7839 (index!33724 (_ BitVec 32))) (Found!7839 (index!33725 (_ BitVec 32))) (Intermediate!7839 (undefined!8651 Bool) (index!33726 (_ BitVec 32)) (x!64629 (_ BitVec 32))) (Undefined!7839) (MissingVacant!7839 (index!33727 (_ BitVec 32))) )
))
(declare-fun lt!340972 () SeekEntryResult!7839)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42269 (_ BitVec 32)) SeekEntryResult!7839)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766499 (= res!518628 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20239 a!3186) j!159) mask!3328) (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!340972))))

(assert (=> b!766499 (= lt!340972 (Intermediate!7839 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766500 () Bool)

(declare-fun res!518619 () Bool)

(assert (=> b!766500 (=> (not res!518619) (not e!426826))))

(declare-datatypes ((List!14241 0))(
  ( (Nil!14238) (Cons!14237 (h!15327 (_ BitVec 64)) (t!20556 List!14241)) )
))
(declare-fun arrayNoDuplicates!0 (array!42269 (_ BitVec 32) List!14241) Bool)

(assert (=> b!766500 (= res!518619 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14238))))

(declare-fun b!766501 () Bool)

(declare-fun res!518621 () Bool)

(assert (=> b!766501 (=> (not res!518621) (not e!426826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42269 (_ BitVec 32)) Bool)

(assert (=> b!766501 (= res!518621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766502 () Bool)

(declare-fun e!426828 () Bool)

(declare-fun e!426834 () Bool)

(assert (=> b!766502 (= e!426828 e!426834)))

(declare-fun res!518626 () Bool)

(assert (=> b!766502 (=> res!518626 e!426834)))

(assert (=> b!766502 (= res!518626 (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!340969 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766502 (= lt!340969 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun lt!340971 () SeekEntryResult!7839)

(declare-fun e!426831 () Bool)

(declare-fun b!766503 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42269 (_ BitVec 32)) SeekEntryResult!7839)

(assert (=> b!766503 (= e!426831 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!340971))))

(declare-fun b!766504 () Bool)

(assert (=> b!766504 (= e!426825 e!426826)))

(declare-fun res!518622 () Bool)

(assert (=> b!766504 (=> (not res!518622) (not e!426826))))

(declare-fun lt!340968 () SeekEntryResult!7839)

(assert (=> b!766504 (= res!518622 (or (= lt!340968 (MissingZero!7839 i!1173)) (= lt!340968 (MissingVacant!7839 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42269 (_ BitVec 32)) SeekEntryResult!7839)

(assert (=> b!766504 (= lt!340968 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!766505 () Bool)

(declare-fun res!518627 () Bool)

(assert (=> b!766505 (=> (not res!518627) (not e!426825))))

(declare-fun arrayContainsKey!0 (array!42269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766505 (= res!518627 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766507 () Bool)

(declare-fun e!426832 () Bool)

(assert (=> b!766507 (= e!426832 e!426831)))

(declare-fun res!518623 () Bool)

(assert (=> b!766507 (=> (not res!518623) (not e!426831))))

(assert (=> b!766507 (= res!518623 (= (seekEntryOrOpen!0 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!340971))))

(assert (=> b!766507 (= lt!340971 (Found!7839 j!159))))

(declare-fun b!766508 () Bool)

(declare-fun res!518624 () Bool)

(assert (=> b!766508 (=> (not res!518624) (not e!426825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766508 (= res!518624 (validKeyInArray!0 k0!2102))))

(declare-fun b!766509 () Bool)

(declare-fun res!518620 () Bool)

(assert (=> b!766509 (=> (not res!518620) (not e!426825))))

(assert (=> b!766509 (= res!518620 (validKeyInArray!0 (select (arr!20239 a!3186) j!159)))))

(declare-fun b!766510 () Bool)

(declare-fun e!426830 () Bool)

(assert (=> b!766510 (= e!426829 e!426830)))

(declare-fun res!518631 () Bool)

(assert (=> b!766510 (=> (not res!518631) (not e!426830))))

(declare-fun lt!340967 () SeekEntryResult!7839)

(declare-fun lt!340966 () SeekEntryResult!7839)

(assert (=> b!766510 (= res!518631 (= lt!340967 lt!340966))))

(declare-fun lt!340965 () array!42269)

(declare-fun lt!340970 () (_ BitVec 64))

(assert (=> b!766510 (= lt!340966 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340970 lt!340965 mask!3328))))

(assert (=> b!766510 (= lt!340967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340970 mask!3328) lt!340970 lt!340965 mask!3328))))

(assert (=> b!766510 (= lt!340970 (select (store (arr!20239 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766510 (= lt!340965 (array!42270 (store (arr!20239 a!3186) i!1173 k0!2102) (size!20660 a!3186)))))

(declare-fun b!766511 () Bool)

(assert (=> b!766511 (= e!426834 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!340969 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!340972))))

(declare-fun b!766512 () Bool)

(declare-fun res!518625 () Bool)

(assert (=> b!766512 (=> (not res!518625) (not e!426826))))

(assert (=> b!766512 (= res!518625 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20660 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20660 a!3186))))))

(declare-fun b!766513 () Bool)

(assert (=> b!766513 (= e!426833 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!340972))))

(declare-fun b!766514 () Bool)

(assert (=> b!766514 (= e!426830 (not e!426828))))

(declare-fun res!518632 () Bool)

(assert (=> b!766514 (=> res!518632 e!426828)))

(get-info :version)

(assert (=> b!766514 (= res!518632 (or (not ((_ is Intermediate!7839) lt!340966)) (bvsge x!1131 (x!64629 lt!340966))))))

(assert (=> b!766514 e!426832))

(declare-fun res!518634 () Bool)

(assert (=> b!766514 (=> (not res!518634) (not e!426832))))

(assert (=> b!766514 (= res!518634 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26404 0))(
  ( (Unit!26405) )
))
(declare-fun lt!340973 () Unit!26404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26404)

(assert (=> b!766514 (= lt!340973 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766506 () Bool)

(assert (=> b!766506 (= e!426833 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) (Found!7839 j!159)))))

(declare-fun res!518635 () Bool)

(assert (=> start!66490 (=> (not res!518635) (not e!426825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66490 (= res!518635 (validMask!0 mask!3328))))

(assert (=> start!66490 e!426825))

(assert (=> start!66490 true))

(declare-fun array_inv!16035 (array!42269) Bool)

(assert (=> start!66490 (array_inv!16035 a!3186)))

(assert (= (and start!66490 res!518635) b!766496))

(assert (= (and b!766496 res!518630) b!766509))

(assert (= (and b!766509 res!518620) b!766508))

(assert (= (and b!766508 res!518624) b!766505))

(assert (= (and b!766505 res!518627) b!766504))

(assert (= (and b!766504 res!518622) b!766501))

(assert (= (and b!766501 res!518621) b!766500))

(assert (= (and b!766500 res!518619) b!766512))

(assert (= (and b!766512 res!518625) b!766499))

(assert (= (and b!766499 res!518628) b!766498))

(assert (= (and b!766498 res!518633) b!766497))

(assert (= (and b!766497 c!84328) b!766513))

(assert (= (and b!766497 (not c!84328)) b!766506))

(assert (= (and b!766497 res!518629) b!766510))

(assert (= (and b!766510 res!518631) b!766514))

(assert (= (and b!766514 res!518634) b!766507))

(assert (= (and b!766507 res!518623) b!766503))

(assert (= (and b!766514 (not res!518632)) b!766502))

(assert (= (and b!766502 (not res!518626)) b!766511))

(declare-fun m!712475 () Bool)

(assert (=> b!766508 m!712475))

(declare-fun m!712477 () Bool)

(assert (=> b!766506 m!712477))

(assert (=> b!766506 m!712477))

(declare-fun m!712479 () Bool)

(assert (=> b!766506 m!712479))

(assert (=> b!766503 m!712477))

(assert (=> b!766503 m!712477))

(declare-fun m!712481 () Bool)

(assert (=> b!766503 m!712481))

(declare-fun m!712483 () Bool)

(assert (=> b!766514 m!712483))

(declare-fun m!712485 () Bool)

(assert (=> b!766514 m!712485))

(declare-fun m!712487 () Bool)

(assert (=> b!766502 m!712487))

(declare-fun m!712489 () Bool)

(assert (=> b!766500 m!712489))

(assert (=> b!766511 m!712477))

(assert (=> b!766511 m!712477))

(declare-fun m!712491 () Bool)

(assert (=> b!766511 m!712491))

(declare-fun m!712493 () Bool)

(assert (=> b!766504 m!712493))

(assert (=> b!766499 m!712477))

(assert (=> b!766499 m!712477))

(declare-fun m!712495 () Bool)

(assert (=> b!766499 m!712495))

(assert (=> b!766499 m!712495))

(assert (=> b!766499 m!712477))

(declare-fun m!712497 () Bool)

(assert (=> b!766499 m!712497))

(declare-fun m!712499 () Bool)

(assert (=> b!766510 m!712499))

(declare-fun m!712501 () Bool)

(assert (=> b!766510 m!712501))

(declare-fun m!712503 () Bool)

(assert (=> b!766510 m!712503))

(declare-fun m!712505 () Bool)

(assert (=> b!766510 m!712505))

(declare-fun m!712507 () Bool)

(assert (=> b!766510 m!712507))

(assert (=> b!766510 m!712505))

(declare-fun m!712509 () Bool)

(assert (=> b!766498 m!712509))

(declare-fun m!712511 () Bool)

(assert (=> b!766501 m!712511))

(assert (=> b!766509 m!712477))

(assert (=> b!766509 m!712477))

(declare-fun m!712513 () Bool)

(assert (=> b!766509 m!712513))

(declare-fun m!712515 () Bool)

(assert (=> start!66490 m!712515))

(declare-fun m!712517 () Bool)

(assert (=> start!66490 m!712517))

(assert (=> b!766513 m!712477))

(assert (=> b!766513 m!712477))

(declare-fun m!712519 () Bool)

(assert (=> b!766513 m!712519))

(declare-fun m!712521 () Bool)

(assert (=> b!766505 m!712521))

(assert (=> b!766507 m!712477))

(assert (=> b!766507 m!712477))

(declare-fun m!712523 () Bool)

(assert (=> b!766507 m!712523))

(check-sat (not b!766503) (not b!766501) (not b!766510) (not b!766509) (not start!66490) (not b!766507) (not b!766513) (not b!766502) (not b!766500) (not b!766505) (not b!766508) (not b!766511) (not b!766514) (not b!766504) (not b!766506) (not b!766499))
(check-sat)
(get-model)

(declare-fun d!101217 () Bool)

(declare-fun res!518691 () Bool)

(declare-fun e!426869 () Bool)

(assert (=> d!101217 (=> res!518691 e!426869)))

(assert (=> d!101217 (= res!518691 (= (select (arr!20239 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101217 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!426869)))

(declare-fun b!766576 () Bool)

(declare-fun e!426870 () Bool)

(assert (=> b!766576 (= e!426869 e!426870)))

(declare-fun res!518692 () Bool)

(assert (=> b!766576 (=> (not res!518692) (not e!426870))))

(assert (=> b!766576 (= res!518692 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20660 a!3186)))))

(declare-fun b!766577 () Bool)

(assert (=> b!766577 (= e!426870 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101217 (not res!518691)) b!766576))

(assert (= (and b!766576 res!518692) b!766577))

(declare-fun m!712575 () Bool)

(assert (=> d!101217 m!712575))

(declare-fun m!712577 () Bool)

(assert (=> b!766577 m!712577))

(assert (=> b!766505 d!101217))

(declare-fun d!101219 () Bool)

(assert (=> d!101219 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66490 d!101219))

(declare-fun d!101221 () Bool)

(assert (=> d!101221 (= (array_inv!16035 a!3186) (bvsge (size!20660 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66490 d!101221))

(declare-fun b!766590 () Bool)

(declare-fun c!84339 () Bool)

(declare-fun lt!341006 () (_ BitVec 64))

(assert (=> b!766590 (= c!84339 (= lt!341006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426877 () SeekEntryResult!7839)

(declare-fun e!426879 () SeekEntryResult!7839)

(assert (=> b!766590 (= e!426877 e!426879)))

(declare-fun b!766591 () Bool)

(declare-fun e!426878 () SeekEntryResult!7839)

(assert (=> b!766591 (= e!426878 Undefined!7839)))

(declare-fun b!766592 () Bool)

(assert (=> b!766592 (= e!426877 (Found!7839 index!1321))))

(declare-fun lt!341005 () SeekEntryResult!7839)

(declare-fun d!101223 () Bool)

(assert (=> d!101223 (and (or ((_ is Undefined!7839) lt!341005) (not ((_ is Found!7839) lt!341005)) (and (bvsge (index!33725 lt!341005) #b00000000000000000000000000000000) (bvslt (index!33725 lt!341005) (size!20660 a!3186)))) (or ((_ is Undefined!7839) lt!341005) ((_ is Found!7839) lt!341005) (not ((_ is MissingVacant!7839) lt!341005)) (not (= (index!33727 lt!341005) resIntermediateIndex!5)) (and (bvsge (index!33727 lt!341005) #b00000000000000000000000000000000) (bvslt (index!33727 lt!341005) (size!20660 a!3186)))) (or ((_ is Undefined!7839) lt!341005) (ite ((_ is Found!7839) lt!341005) (= (select (arr!20239 a!3186) (index!33725 lt!341005)) (select (arr!20239 a!3186) j!159)) (and ((_ is MissingVacant!7839) lt!341005) (= (index!33727 lt!341005) resIntermediateIndex!5) (= (select (arr!20239 a!3186) (index!33727 lt!341005)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101223 (= lt!341005 e!426878)))

(declare-fun c!84338 () Bool)

(assert (=> d!101223 (= c!84338 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101223 (= lt!341006 (select (arr!20239 a!3186) index!1321))))

(assert (=> d!101223 (validMask!0 mask!3328)))

(assert (=> d!101223 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!341005)))

(declare-fun b!766593 () Bool)

(assert (=> b!766593 (= e!426878 e!426877)))

(declare-fun c!84340 () Bool)

(assert (=> b!766593 (= c!84340 (= lt!341006 (select (arr!20239 a!3186) j!159)))))

(declare-fun b!766594 () Bool)

(assert (=> b!766594 (= e!426879 (MissingVacant!7839 resIntermediateIndex!5))))

(declare-fun b!766595 () Bool)

(assert (=> b!766595 (= e!426879 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20239 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101223 c!84338) b!766591))

(assert (= (and d!101223 (not c!84338)) b!766593))

(assert (= (and b!766593 c!84340) b!766592))

(assert (= (and b!766593 (not c!84340)) b!766590))

(assert (= (and b!766590 c!84339) b!766594))

(assert (= (and b!766590 (not c!84339)) b!766595))

(declare-fun m!712579 () Bool)

(assert (=> d!101223 m!712579))

(declare-fun m!712581 () Bool)

(assert (=> d!101223 m!712581))

(declare-fun m!712583 () Bool)

(assert (=> d!101223 m!712583))

(assert (=> d!101223 m!712515))

(assert (=> b!766595 m!712487))

(assert (=> b!766595 m!712487))

(assert (=> b!766595 m!712477))

(declare-fun m!712585 () Bool)

(assert (=> b!766595 m!712585))

(assert (=> b!766506 d!101223))

(declare-fun b!766614 () Bool)

(declare-fun lt!341012 () SeekEntryResult!7839)

(assert (=> b!766614 (and (bvsge (index!33726 lt!341012) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341012) (size!20660 a!3186)))))

(declare-fun res!518699 () Bool)

(assert (=> b!766614 (= res!518699 (= (select (arr!20239 a!3186) (index!33726 lt!341012)) (select (arr!20239 a!3186) j!159)))))

(declare-fun e!426890 () Bool)

(assert (=> b!766614 (=> res!518699 e!426890)))

(declare-fun e!426894 () Bool)

(assert (=> b!766614 (= e!426894 e!426890)))

(declare-fun b!766615 () Bool)

(assert (=> b!766615 (and (bvsge (index!33726 lt!341012) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341012) (size!20660 a!3186)))))

(assert (=> b!766615 (= e!426890 (= (select (arr!20239 a!3186) (index!33726 lt!341012)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766616 () Bool)

(declare-fun e!426893 () Bool)

(assert (=> b!766616 (= e!426893 (bvsge (x!64629 lt!341012) #b01111111111111111111111111111110))))

(declare-fun d!101225 () Bool)

(assert (=> d!101225 e!426893))

(declare-fun c!84347 () Bool)

(assert (=> d!101225 (= c!84347 (and ((_ is Intermediate!7839) lt!341012) (undefined!8651 lt!341012)))))

(declare-fun e!426892 () SeekEntryResult!7839)

(assert (=> d!101225 (= lt!341012 e!426892)))

(declare-fun c!84348 () Bool)

(assert (=> d!101225 (= c!84348 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341011 () (_ BitVec 64))

(assert (=> d!101225 (= lt!341011 (select (arr!20239 a!3186) index!1321))))

(assert (=> d!101225 (validMask!0 mask!3328)))

(assert (=> d!101225 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!341012)))

(declare-fun b!766617 () Bool)

(assert (=> b!766617 (and (bvsge (index!33726 lt!341012) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341012) (size!20660 a!3186)))))

(declare-fun res!518700 () Bool)

(assert (=> b!766617 (= res!518700 (= (select (arr!20239 a!3186) (index!33726 lt!341012)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766617 (=> res!518700 e!426890)))

(declare-fun b!766618 () Bool)

(assert (=> b!766618 (= e!426893 e!426894)))

(declare-fun res!518701 () Bool)

(assert (=> b!766618 (= res!518701 (and ((_ is Intermediate!7839) lt!341012) (not (undefined!8651 lt!341012)) (bvslt (x!64629 lt!341012) #b01111111111111111111111111111110) (bvsge (x!64629 lt!341012) #b00000000000000000000000000000000) (bvsge (x!64629 lt!341012) x!1131)))))

(assert (=> b!766618 (=> (not res!518701) (not e!426894))))

(declare-fun b!766619 () Bool)

(declare-fun e!426891 () SeekEntryResult!7839)

(assert (=> b!766619 (= e!426892 e!426891)))

(declare-fun c!84349 () Bool)

(assert (=> b!766619 (= c!84349 (or (= lt!341011 (select (arr!20239 a!3186) j!159)) (= (bvadd lt!341011 lt!341011) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766620 () Bool)

(assert (=> b!766620 (= e!426891 (Intermediate!7839 false index!1321 x!1131))))

(declare-fun b!766621 () Bool)

(assert (=> b!766621 (= e!426892 (Intermediate!7839 true index!1321 x!1131))))

(declare-fun b!766622 () Bool)

(assert (=> b!766622 (= e!426891 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20239 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101225 c!84348) b!766621))

(assert (= (and d!101225 (not c!84348)) b!766619))

(assert (= (and b!766619 c!84349) b!766620))

(assert (= (and b!766619 (not c!84349)) b!766622))

(assert (= (and d!101225 c!84347) b!766616))

(assert (= (and d!101225 (not c!84347)) b!766618))

(assert (= (and b!766618 res!518701) b!766614))

(assert (= (and b!766614 (not res!518699)) b!766617))

(assert (= (and b!766617 (not res!518700)) b!766615))

(declare-fun m!712587 () Bool)

(assert (=> b!766615 m!712587))

(assert (=> b!766622 m!712487))

(assert (=> b!766622 m!712487))

(assert (=> b!766622 m!712477))

(declare-fun m!712589 () Bool)

(assert (=> b!766622 m!712589))

(assert (=> d!101225 m!712583))

(assert (=> d!101225 m!712515))

(assert (=> b!766617 m!712587))

(assert (=> b!766614 m!712587))

(assert (=> b!766513 d!101225))

(declare-fun d!101239 () Bool)

(declare-fun lt!341015 () (_ BitVec 32))

(assert (=> d!101239 (and (bvsge lt!341015 #b00000000000000000000000000000000) (bvslt lt!341015 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101239 (= lt!341015 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101239 (validMask!0 mask!3328)))

(assert (=> d!101239 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!341015)))

(declare-fun bs!21507 () Bool)

(assert (= bs!21507 d!101239))

(declare-fun m!712591 () Bool)

(assert (=> bs!21507 m!712591))

(assert (=> bs!21507 m!712515))

(assert (=> b!766502 d!101239))

(declare-fun b!766674 () Bool)

(declare-fun e!426930 () SeekEntryResult!7839)

(declare-fun lt!341031 () SeekEntryResult!7839)

(assert (=> b!766674 (= e!426930 (MissingZero!7839 (index!33726 lt!341031)))))

(declare-fun b!766675 () Bool)

(declare-fun e!426929 () SeekEntryResult!7839)

(declare-fun e!426928 () SeekEntryResult!7839)

(assert (=> b!766675 (= e!426929 e!426928)))

(declare-fun lt!341032 () (_ BitVec 64))

(assert (=> b!766675 (= lt!341032 (select (arr!20239 a!3186) (index!33726 lt!341031)))))

(declare-fun c!84370 () Bool)

(assert (=> b!766675 (= c!84370 (= lt!341032 k0!2102))))

(declare-fun b!766676 () Bool)

(assert (=> b!766676 (= e!426928 (Found!7839 (index!33726 lt!341031)))))

(declare-fun d!101241 () Bool)

(declare-fun lt!341033 () SeekEntryResult!7839)

(assert (=> d!101241 (and (or ((_ is Undefined!7839) lt!341033) (not ((_ is Found!7839) lt!341033)) (and (bvsge (index!33725 lt!341033) #b00000000000000000000000000000000) (bvslt (index!33725 lt!341033) (size!20660 a!3186)))) (or ((_ is Undefined!7839) lt!341033) ((_ is Found!7839) lt!341033) (not ((_ is MissingZero!7839) lt!341033)) (and (bvsge (index!33724 lt!341033) #b00000000000000000000000000000000) (bvslt (index!33724 lt!341033) (size!20660 a!3186)))) (or ((_ is Undefined!7839) lt!341033) ((_ is Found!7839) lt!341033) ((_ is MissingZero!7839) lt!341033) (not ((_ is MissingVacant!7839) lt!341033)) (and (bvsge (index!33727 lt!341033) #b00000000000000000000000000000000) (bvslt (index!33727 lt!341033) (size!20660 a!3186)))) (or ((_ is Undefined!7839) lt!341033) (ite ((_ is Found!7839) lt!341033) (= (select (arr!20239 a!3186) (index!33725 lt!341033)) k0!2102) (ite ((_ is MissingZero!7839) lt!341033) (= (select (arr!20239 a!3186) (index!33724 lt!341033)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7839) lt!341033) (= (select (arr!20239 a!3186) (index!33727 lt!341033)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101241 (= lt!341033 e!426929)))

(declare-fun c!84369 () Bool)

(assert (=> d!101241 (= c!84369 (and ((_ is Intermediate!7839) lt!341031) (undefined!8651 lt!341031)))))

(assert (=> d!101241 (= lt!341031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101241 (validMask!0 mask!3328)))

(assert (=> d!101241 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!341033)))

(declare-fun b!766677 () Bool)

(assert (=> b!766677 (= e!426930 (seekKeyOrZeroReturnVacant!0 (x!64629 lt!341031) (index!33726 lt!341031) (index!33726 lt!341031) k0!2102 a!3186 mask!3328))))

(declare-fun b!766678 () Bool)

(assert (=> b!766678 (= e!426929 Undefined!7839)))

(declare-fun b!766679 () Bool)

(declare-fun c!84368 () Bool)

(assert (=> b!766679 (= c!84368 (= lt!341032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766679 (= e!426928 e!426930)))

(assert (= (and d!101241 c!84369) b!766678))

(assert (= (and d!101241 (not c!84369)) b!766675))

(assert (= (and b!766675 c!84370) b!766676))

(assert (= (and b!766675 (not c!84370)) b!766679))

(assert (= (and b!766679 c!84368) b!766674))

(assert (= (and b!766679 (not c!84368)) b!766677))

(declare-fun m!712613 () Bool)

(assert (=> b!766675 m!712613))

(declare-fun m!712615 () Bool)

(assert (=> d!101241 m!712615))

(declare-fun m!712617 () Bool)

(assert (=> d!101241 m!712617))

(declare-fun m!712619 () Bool)

(assert (=> d!101241 m!712619))

(declare-fun m!712621 () Bool)

(assert (=> d!101241 m!712621))

(assert (=> d!101241 m!712615))

(declare-fun m!712623 () Bool)

(assert (=> d!101241 m!712623))

(assert (=> d!101241 m!712515))

(declare-fun m!712625 () Bool)

(assert (=> b!766677 m!712625))

(assert (=> b!766504 d!101241))

(declare-fun b!766684 () Bool)

(declare-fun c!84373 () Bool)

(declare-fun lt!341039 () (_ BitVec 64))

(assert (=> b!766684 (= c!84373 (= lt!341039 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426931 () SeekEntryResult!7839)

(declare-fun e!426934 () SeekEntryResult!7839)

(assert (=> b!766684 (= e!426931 e!426934)))

(declare-fun b!766685 () Bool)

(declare-fun e!426933 () SeekEntryResult!7839)

(assert (=> b!766685 (= e!426933 Undefined!7839)))

(declare-fun b!766686 () Bool)

(assert (=> b!766686 (= e!426931 (Found!7839 resIntermediateIndex!5))))

(declare-fun d!101249 () Bool)

(declare-fun lt!341038 () SeekEntryResult!7839)

(assert (=> d!101249 (and (or ((_ is Undefined!7839) lt!341038) (not ((_ is Found!7839) lt!341038)) (and (bvsge (index!33725 lt!341038) #b00000000000000000000000000000000) (bvslt (index!33725 lt!341038) (size!20660 a!3186)))) (or ((_ is Undefined!7839) lt!341038) ((_ is Found!7839) lt!341038) (not ((_ is MissingVacant!7839) lt!341038)) (not (= (index!33727 lt!341038) resIntermediateIndex!5)) (and (bvsge (index!33727 lt!341038) #b00000000000000000000000000000000) (bvslt (index!33727 lt!341038) (size!20660 a!3186)))) (or ((_ is Undefined!7839) lt!341038) (ite ((_ is Found!7839) lt!341038) (= (select (arr!20239 a!3186) (index!33725 lt!341038)) (select (arr!20239 a!3186) j!159)) (and ((_ is MissingVacant!7839) lt!341038) (= (index!33727 lt!341038) resIntermediateIndex!5) (= (select (arr!20239 a!3186) (index!33727 lt!341038)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101249 (= lt!341038 e!426933)))

(declare-fun c!84371 () Bool)

(assert (=> d!101249 (= c!84371 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101249 (= lt!341039 (select (arr!20239 a!3186) resIntermediateIndex!5))))

(assert (=> d!101249 (validMask!0 mask!3328)))

(assert (=> d!101249 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!341038)))

(declare-fun b!766687 () Bool)

(assert (=> b!766687 (= e!426933 e!426931)))

(declare-fun c!84374 () Bool)

(assert (=> b!766687 (= c!84374 (= lt!341039 (select (arr!20239 a!3186) j!159)))))

(declare-fun b!766688 () Bool)

(assert (=> b!766688 (= e!426934 (MissingVacant!7839 resIntermediateIndex!5))))

(declare-fun b!766689 () Bool)

(assert (=> b!766689 (= e!426934 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20239 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101249 c!84371) b!766685))

(assert (= (and d!101249 (not c!84371)) b!766687))

(assert (= (and b!766687 c!84374) b!766686))

(assert (= (and b!766687 (not c!84374)) b!766684))

(assert (= (and b!766684 c!84373) b!766688))

(assert (= (and b!766684 (not c!84373)) b!766689))

(declare-fun m!712627 () Bool)

(assert (=> d!101249 m!712627))

(declare-fun m!712629 () Bool)

(assert (=> d!101249 m!712629))

(assert (=> d!101249 m!712509))

(assert (=> d!101249 m!712515))

(declare-fun m!712631 () Bool)

(assert (=> b!766689 m!712631))

(assert (=> b!766689 m!712631))

(assert (=> b!766689 m!712477))

(declare-fun m!712633 () Bool)

(assert (=> b!766689 m!712633))

(assert (=> b!766503 d!101249))

(declare-fun bm!35046 () Bool)

(declare-fun call!35049 () Bool)

(assert (=> bm!35046 (= call!35049 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!766756 () Bool)

(declare-fun e!426977 () Bool)

(declare-fun e!426975 () Bool)

(assert (=> b!766756 (= e!426977 e!426975)))

(declare-fun lt!341058 () (_ BitVec 64))

(assert (=> b!766756 (= lt!341058 (select (arr!20239 a!3186) j!159))))

(declare-fun lt!341056 () Unit!26404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42269 (_ BitVec 64) (_ BitVec 32)) Unit!26404)

(assert (=> b!766756 (= lt!341056 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341058 j!159))))

(assert (=> b!766756 (arrayContainsKey!0 a!3186 lt!341058 #b00000000000000000000000000000000)))

(declare-fun lt!341057 () Unit!26404)

(assert (=> b!766756 (= lt!341057 lt!341056)))

(declare-fun res!518741 () Bool)

(assert (=> b!766756 (= res!518741 (= (seekEntryOrOpen!0 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) (Found!7839 j!159)))))

(assert (=> b!766756 (=> (not res!518741) (not e!426975))))

(declare-fun d!101251 () Bool)

(declare-fun res!518740 () Bool)

(declare-fun e!426976 () Bool)

(assert (=> d!101251 (=> res!518740 e!426976)))

(assert (=> d!101251 (= res!518740 (bvsge j!159 (size!20660 a!3186)))))

(assert (=> d!101251 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!426976)))

(declare-fun b!766757 () Bool)

(assert (=> b!766757 (= e!426977 call!35049)))

(declare-fun b!766759 () Bool)

(assert (=> b!766759 (= e!426975 call!35049)))

(declare-fun b!766760 () Bool)

(assert (=> b!766760 (= e!426976 e!426977)))

(declare-fun c!84397 () Bool)

(assert (=> b!766760 (= c!84397 (validKeyInArray!0 (select (arr!20239 a!3186) j!159)))))

(assert (= (and d!101251 (not res!518740)) b!766760))

(assert (= (and b!766760 c!84397) b!766756))

(assert (= (and b!766760 (not c!84397)) b!766757))

(assert (= (and b!766756 res!518741) b!766759))

(assert (= (or b!766759 b!766757) bm!35046))

(declare-fun m!712657 () Bool)

(assert (=> bm!35046 m!712657))

(assert (=> b!766756 m!712477))

(declare-fun m!712659 () Bool)

(assert (=> b!766756 m!712659))

(declare-fun m!712661 () Bool)

(assert (=> b!766756 m!712661))

(assert (=> b!766756 m!712477))

(assert (=> b!766756 m!712523))

(assert (=> b!766760 m!712477))

(assert (=> b!766760 m!712477))

(assert (=> b!766760 m!712513))

(assert (=> b!766514 d!101251))

(declare-fun d!101261 () Bool)

(assert (=> d!101261 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341067 () Unit!26404)

(declare-fun choose!38 (array!42269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26404)

(assert (=> d!101261 (= lt!341067 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101261 (validMask!0 mask!3328)))

(assert (=> d!101261 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341067)))

(declare-fun bs!21508 () Bool)

(assert (= bs!21508 d!101261))

(assert (=> bs!21508 m!712483))

(declare-fun m!712671 () Bool)

(assert (=> bs!21508 m!712671))

(assert (=> bs!21508 m!712515))

(assert (=> b!766514 d!101261))

(declare-fun b!766777 () Bool)

(declare-fun e!426994 () Bool)

(declare-fun e!426992 () Bool)

(assert (=> b!766777 (= e!426994 e!426992)))

(declare-fun c!84403 () Bool)

(assert (=> b!766777 (= c!84403 (validKeyInArray!0 (select (arr!20239 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!766778 () Bool)

(declare-fun e!426995 () Bool)

(assert (=> b!766778 (= e!426995 e!426994)))

(declare-fun res!518752 () Bool)

(assert (=> b!766778 (=> (not res!518752) (not e!426994))))

(declare-fun e!426993 () Bool)

(assert (=> b!766778 (= res!518752 (not e!426993))))

(declare-fun res!518753 () Bool)

(assert (=> b!766778 (=> (not res!518753) (not e!426993))))

(assert (=> b!766778 (= res!518753 (validKeyInArray!0 (select (arr!20239 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35052 () Bool)

(declare-fun call!35055 () Bool)

(assert (=> bm!35052 (= call!35055 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84403 (Cons!14237 (select (arr!20239 a!3186) #b00000000000000000000000000000000) Nil!14238) Nil!14238)))))

(declare-fun b!766780 () Bool)

(declare-fun contains!4081 (List!14241 (_ BitVec 64)) Bool)

(assert (=> b!766780 (= e!426993 (contains!4081 Nil!14238 (select (arr!20239 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!766781 () Bool)

(assert (=> b!766781 (= e!426992 call!35055)))

(declare-fun b!766779 () Bool)

(assert (=> b!766779 (= e!426992 call!35055)))

(declare-fun d!101267 () Bool)

(declare-fun res!518751 () Bool)

(assert (=> d!101267 (=> res!518751 e!426995)))

(assert (=> d!101267 (= res!518751 (bvsge #b00000000000000000000000000000000 (size!20660 a!3186)))))

(assert (=> d!101267 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14238) e!426995)))

(assert (= (and d!101267 (not res!518751)) b!766778))

(assert (= (and b!766778 res!518753) b!766780))

(assert (= (and b!766778 res!518752) b!766777))

(assert (= (and b!766777 c!84403) b!766779))

(assert (= (and b!766777 (not c!84403)) b!766781))

(assert (= (or b!766779 b!766781) bm!35052))

(assert (=> b!766777 m!712575))

(assert (=> b!766777 m!712575))

(declare-fun m!712675 () Bool)

(assert (=> b!766777 m!712675))

(assert (=> b!766778 m!712575))

(assert (=> b!766778 m!712575))

(assert (=> b!766778 m!712675))

(assert (=> bm!35052 m!712575))

(declare-fun m!712677 () Bool)

(assert (=> bm!35052 m!712677))

(assert (=> b!766780 m!712575))

(assert (=> b!766780 m!712575))

(declare-fun m!712679 () Bool)

(assert (=> b!766780 m!712679))

(assert (=> b!766500 d!101267))

(declare-fun b!766782 () Bool)

(declare-fun lt!341072 () SeekEntryResult!7839)

(assert (=> b!766782 (and (bvsge (index!33726 lt!341072) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341072) (size!20660 a!3186)))))

(declare-fun res!518754 () Bool)

(assert (=> b!766782 (= res!518754 (= (select (arr!20239 a!3186) (index!33726 lt!341072)) (select (arr!20239 a!3186) j!159)))))

(declare-fun e!426996 () Bool)

(assert (=> b!766782 (=> res!518754 e!426996)))

(declare-fun e!427000 () Bool)

(assert (=> b!766782 (= e!427000 e!426996)))

(declare-fun b!766783 () Bool)

(assert (=> b!766783 (and (bvsge (index!33726 lt!341072) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341072) (size!20660 a!3186)))))

(assert (=> b!766783 (= e!426996 (= (select (arr!20239 a!3186) (index!33726 lt!341072)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766784 () Bool)

(declare-fun e!426999 () Bool)

(assert (=> b!766784 (= e!426999 (bvsge (x!64629 lt!341072) #b01111111111111111111111111111110))))

(declare-fun d!101273 () Bool)

(assert (=> d!101273 e!426999))

(declare-fun c!84404 () Bool)

(assert (=> d!101273 (= c!84404 (and ((_ is Intermediate!7839) lt!341072) (undefined!8651 lt!341072)))))

(declare-fun e!426998 () SeekEntryResult!7839)

(assert (=> d!101273 (= lt!341072 e!426998)))

(declare-fun c!84405 () Bool)

(assert (=> d!101273 (= c!84405 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341071 () (_ BitVec 64))

(assert (=> d!101273 (= lt!341071 (select (arr!20239 a!3186) (toIndex!0 (select (arr!20239 a!3186) j!159) mask!3328)))))

(assert (=> d!101273 (validMask!0 mask!3328)))

(assert (=> d!101273 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20239 a!3186) j!159) mask!3328) (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!341072)))

(declare-fun b!766785 () Bool)

(assert (=> b!766785 (and (bvsge (index!33726 lt!341072) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341072) (size!20660 a!3186)))))

(declare-fun res!518755 () Bool)

(assert (=> b!766785 (= res!518755 (= (select (arr!20239 a!3186) (index!33726 lt!341072)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766785 (=> res!518755 e!426996)))

(declare-fun b!766786 () Bool)

(assert (=> b!766786 (= e!426999 e!427000)))

(declare-fun res!518756 () Bool)

(assert (=> b!766786 (= res!518756 (and ((_ is Intermediate!7839) lt!341072) (not (undefined!8651 lt!341072)) (bvslt (x!64629 lt!341072) #b01111111111111111111111111111110) (bvsge (x!64629 lt!341072) #b00000000000000000000000000000000) (bvsge (x!64629 lt!341072) #b00000000000000000000000000000000)))))

(assert (=> b!766786 (=> (not res!518756) (not e!427000))))

(declare-fun b!766787 () Bool)

(declare-fun e!426997 () SeekEntryResult!7839)

(assert (=> b!766787 (= e!426998 e!426997)))

(declare-fun c!84406 () Bool)

(assert (=> b!766787 (= c!84406 (or (= lt!341071 (select (arr!20239 a!3186) j!159)) (= (bvadd lt!341071 lt!341071) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766788 () Bool)

(assert (=> b!766788 (= e!426997 (Intermediate!7839 false (toIndex!0 (select (arr!20239 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766789 () Bool)

(assert (=> b!766789 (= e!426998 (Intermediate!7839 true (toIndex!0 (select (arr!20239 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766790 () Bool)

(assert (=> b!766790 (= e!426997 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20239 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20239 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101273 c!84405) b!766789))

(assert (= (and d!101273 (not c!84405)) b!766787))

(assert (= (and b!766787 c!84406) b!766788))

(assert (= (and b!766787 (not c!84406)) b!766790))

(assert (= (and d!101273 c!84404) b!766784))

(assert (= (and d!101273 (not c!84404)) b!766786))

(assert (= (and b!766786 res!518756) b!766782))

(assert (= (and b!766782 (not res!518754)) b!766785))

(assert (= (and b!766785 (not res!518755)) b!766783))

(declare-fun m!712681 () Bool)

(assert (=> b!766783 m!712681))

(assert (=> b!766790 m!712495))

(declare-fun m!712683 () Bool)

(assert (=> b!766790 m!712683))

(assert (=> b!766790 m!712683))

(assert (=> b!766790 m!712477))

(declare-fun m!712685 () Bool)

(assert (=> b!766790 m!712685))

(assert (=> d!101273 m!712495))

(declare-fun m!712687 () Bool)

(assert (=> d!101273 m!712687))

(assert (=> d!101273 m!712515))

(assert (=> b!766785 m!712681))

(assert (=> b!766782 m!712681))

(assert (=> b!766499 d!101273))

(declare-fun d!101275 () Bool)

(declare-fun lt!341082 () (_ BitVec 32))

(declare-fun lt!341081 () (_ BitVec 32))

(assert (=> d!101275 (= lt!341082 (bvmul (bvxor lt!341081 (bvlshr lt!341081 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101275 (= lt!341081 ((_ extract 31 0) (bvand (bvxor (select (arr!20239 a!3186) j!159) (bvlshr (select (arr!20239 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101275 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!518757 (let ((h!15330 ((_ extract 31 0) (bvand (bvxor (select (arr!20239 a!3186) j!159) (bvlshr (select (arr!20239 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64638 (bvmul (bvxor h!15330 (bvlshr h!15330 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64638 (bvlshr x!64638 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!518757 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!518757 #b00000000000000000000000000000000))))))

(assert (=> d!101275 (= (toIndex!0 (select (arr!20239 a!3186) j!159) mask!3328) (bvand (bvxor lt!341082 (bvlshr lt!341082 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!766499 d!101275))

(declare-fun b!766803 () Bool)

(declare-fun lt!341086 () SeekEntryResult!7839)

(assert (=> b!766803 (and (bvsge (index!33726 lt!341086) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341086) (size!20660 lt!340965)))))

(declare-fun res!518758 () Bool)

(assert (=> b!766803 (= res!518758 (= (select (arr!20239 lt!340965) (index!33726 lt!341086)) lt!340970))))

(declare-fun e!427005 () Bool)

(assert (=> b!766803 (=> res!518758 e!427005)))

(declare-fun e!427011 () Bool)

(assert (=> b!766803 (= e!427011 e!427005)))

(declare-fun b!766804 () Bool)

(assert (=> b!766804 (and (bvsge (index!33726 lt!341086) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341086) (size!20660 lt!340965)))))

(assert (=> b!766804 (= e!427005 (= (select (arr!20239 lt!340965) (index!33726 lt!341086)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766805 () Bool)

(declare-fun e!427009 () Bool)

(assert (=> b!766805 (= e!427009 (bvsge (x!64629 lt!341086) #b01111111111111111111111111111110))))

(declare-fun d!101277 () Bool)

(assert (=> d!101277 e!427009))

(declare-fun c!84411 () Bool)

(assert (=> d!101277 (= c!84411 (and ((_ is Intermediate!7839) lt!341086) (undefined!8651 lt!341086)))))

(declare-fun e!427008 () SeekEntryResult!7839)

(assert (=> d!101277 (= lt!341086 e!427008)))

(declare-fun c!84413 () Bool)

(assert (=> d!101277 (= c!84413 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341085 () (_ BitVec 64))

(assert (=> d!101277 (= lt!341085 (select (arr!20239 lt!340965) index!1321))))

(assert (=> d!101277 (validMask!0 mask!3328)))

(assert (=> d!101277 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340970 lt!340965 mask!3328) lt!341086)))

(declare-fun b!766806 () Bool)

(assert (=> b!766806 (and (bvsge (index!33726 lt!341086) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341086) (size!20660 lt!340965)))))

(declare-fun res!518759 () Bool)

(assert (=> b!766806 (= res!518759 (= (select (arr!20239 lt!340965) (index!33726 lt!341086)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766806 (=> res!518759 e!427005)))

(declare-fun b!766807 () Bool)

(assert (=> b!766807 (= e!427009 e!427011)))

(declare-fun res!518760 () Bool)

(assert (=> b!766807 (= res!518760 (and ((_ is Intermediate!7839) lt!341086) (not (undefined!8651 lt!341086)) (bvslt (x!64629 lt!341086) #b01111111111111111111111111111110) (bvsge (x!64629 lt!341086) #b00000000000000000000000000000000) (bvsge (x!64629 lt!341086) x!1131)))))

(assert (=> b!766807 (=> (not res!518760) (not e!427011))))

(declare-fun b!766808 () Bool)

(declare-fun e!427007 () SeekEntryResult!7839)

(assert (=> b!766808 (= e!427008 e!427007)))

(declare-fun c!84415 () Bool)

(assert (=> b!766808 (= c!84415 (or (= lt!341085 lt!340970) (= (bvadd lt!341085 lt!341085) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766809 () Bool)

(assert (=> b!766809 (= e!427007 (Intermediate!7839 false index!1321 x!1131))))

(declare-fun b!766810 () Bool)

(assert (=> b!766810 (= e!427008 (Intermediate!7839 true index!1321 x!1131))))

(declare-fun b!766811 () Bool)

(assert (=> b!766811 (= e!427007 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!340970 lt!340965 mask!3328))))

(assert (= (and d!101277 c!84413) b!766810))

(assert (= (and d!101277 (not c!84413)) b!766808))

(assert (= (and b!766808 c!84415) b!766809))

(assert (= (and b!766808 (not c!84415)) b!766811))

(assert (= (and d!101277 c!84411) b!766805))

(assert (= (and d!101277 (not c!84411)) b!766807))

(assert (= (and b!766807 res!518760) b!766803))

(assert (= (and b!766803 (not res!518758)) b!766806))

(assert (= (and b!766806 (not res!518759)) b!766804))

(declare-fun m!712689 () Bool)

(assert (=> b!766804 m!712689))

(assert (=> b!766811 m!712487))

(assert (=> b!766811 m!712487))

(declare-fun m!712691 () Bool)

(assert (=> b!766811 m!712691))

(declare-fun m!712693 () Bool)

(assert (=> d!101277 m!712693))

(assert (=> d!101277 m!712515))

(assert (=> b!766806 m!712689))

(assert (=> b!766803 m!712689))

(assert (=> b!766510 d!101277))

(declare-fun b!766812 () Bool)

(declare-fun lt!341088 () SeekEntryResult!7839)

(assert (=> b!766812 (and (bvsge (index!33726 lt!341088) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341088) (size!20660 lt!340965)))))

(declare-fun res!518761 () Bool)

(assert (=> b!766812 (= res!518761 (= (select (arr!20239 lt!340965) (index!33726 lt!341088)) lt!340970))))

(declare-fun e!427012 () Bool)

(assert (=> b!766812 (=> res!518761 e!427012)))

(declare-fun e!427016 () Bool)

(assert (=> b!766812 (= e!427016 e!427012)))

(declare-fun b!766813 () Bool)

(assert (=> b!766813 (and (bvsge (index!33726 lt!341088) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341088) (size!20660 lt!340965)))))

(assert (=> b!766813 (= e!427012 (= (select (arr!20239 lt!340965) (index!33726 lt!341088)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766814 () Bool)

(declare-fun e!427015 () Bool)

(assert (=> b!766814 (= e!427015 (bvsge (x!64629 lt!341088) #b01111111111111111111111111111110))))

(declare-fun d!101279 () Bool)

(assert (=> d!101279 e!427015))

(declare-fun c!84416 () Bool)

(assert (=> d!101279 (= c!84416 (and ((_ is Intermediate!7839) lt!341088) (undefined!8651 lt!341088)))))

(declare-fun e!427014 () SeekEntryResult!7839)

(assert (=> d!101279 (= lt!341088 e!427014)))

(declare-fun c!84417 () Bool)

(assert (=> d!101279 (= c!84417 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341087 () (_ BitVec 64))

(assert (=> d!101279 (= lt!341087 (select (arr!20239 lt!340965) (toIndex!0 lt!340970 mask!3328)))))

(assert (=> d!101279 (validMask!0 mask!3328)))

(assert (=> d!101279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340970 mask!3328) lt!340970 lt!340965 mask!3328) lt!341088)))

(declare-fun b!766815 () Bool)

(assert (=> b!766815 (and (bvsge (index!33726 lt!341088) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341088) (size!20660 lt!340965)))))

(declare-fun res!518762 () Bool)

(assert (=> b!766815 (= res!518762 (= (select (arr!20239 lt!340965) (index!33726 lt!341088)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766815 (=> res!518762 e!427012)))

(declare-fun b!766816 () Bool)

(assert (=> b!766816 (= e!427015 e!427016)))

(declare-fun res!518763 () Bool)

(assert (=> b!766816 (= res!518763 (and ((_ is Intermediate!7839) lt!341088) (not (undefined!8651 lt!341088)) (bvslt (x!64629 lt!341088) #b01111111111111111111111111111110) (bvsge (x!64629 lt!341088) #b00000000000000000000000000000000) (bvsge (x!64629 lt!341088) #b00000000000000000000000000000000)))))

(assert (=> b!766816 (=> (not res!518763) (not e!427016))))

(declare-fun b!766817 () Bool)

(declare-fun e!427013 () SeekEntryResult!7839)

(assert (=> b!766817 (= e!427014 e!427013)))

(declare-fun c!84418 () Bool)

(assert (=> b!766817 (= c!84418 (or (= lt!341087 lt!340970) (= (bvadd lt!341087 lt!341087) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766818 () Bool)

(assert (=> b!766818 (= e!427013 (Intermediate!7839 false (toIndex!0 lt!340970 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766819 () Bool)

(assert (=> b!766819 (= e!427014 (Intermediate!7839 true (toIndex!0 lt!340970 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766820 () Bool)

(assert (=> b!766820 (= e!427013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!340970 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!340970 lt!340965 mask!3328))))

(assert (= (and d!101279 c!84417) b!766819))

(assert (= (and d!101279 (not c!84417)) b!766817))

(assert (= (and b!766817 c!84418) b!766818))

(assert (= (and b!766817 (not c!84418)) b!766820))

(assert (= (and d!101279 c!84416) b!766814))

(assert (= (and d!101279 (not c!84416)) b!766816))

(assert (= (and b!766816 res!518763) b!766812))

(assert (= (and b!766812 (not res!518761)) b!766815))

(assert (= (and b!766815 (not res!518762)) b!766813))

(declare-fun m!712695 () Bool)

(assert (=> b!766813 m!712695))

(assert (=> b!766820 m!712505))

(declare-fun m!712697 () Bool)

(assert (=> b!766820 m!712697))

(assert (=> b!766820 m!712697))

(declare-fun m!712699 () Bool)

(assert (=> b!766820 m!712699))

(assert (=> d!101279 m!712505))

(declare-fun m!712701 () Bool)

(assert (=> d!101279 m!712701))

(assert (=> d!101279 m!712515))

(assert (=> b!766815 m!712695))

(assert (=> b!766812 m!712695))

(assert (=> b!766510 d!101279))

(declare-fun d!101281 () Bool)

(declare-fun lt!341094 () (_ BitVec 32))

(declare-fun lt!341093 () (_ BitVec 32))

(assert (=> d!101281 (= lt!341094 (bvmul (bvxor lt!341093 (bvlshr lt!341093 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101281 (= lt!341093 ((_ extract 31 0) (bvand (bvxor lt!340970 (bvlshr lt!340970 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101281 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!518757 (let ((h!15330 ((_ extract 31 0) (bvand (bvxor lt!340970 (bvlshr lt!340970 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64638 (bvmul (bvxor h!15330 (bvlshr h!15330 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64638 (bvlshr x!64638 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!518757 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!518757 #b00000000000000000000000000000000))))))

(assert (=> d!101281 (= (toIndex!0 lt!340970 mask!3328) (bvand (bvxor lt!341094 (bvlshr lt!341094 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!766510 d!101281))

(declare-fun bm!35053 () Bool)

(declare-fun call!35056 () Bool)

(assert (=> bm!35053 (= call!35056 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!766829 () Bool)

(declare-fun e!427023 () Bool)

(declare-fun e!427021 () Bool)

(assert (=> b!766829 (= e!427023 e!427021)))

(declare-fun lt!341097 () (_ BitVec 64))

(assert (=> b!766829 (= lt!341097 (select (arr!20239 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341095 () Unit!26404)

(assert (=> b!766829 (= lt!341095 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341097 #b00000000000000000000000000000000))))

(assert (=> b!766829 (arrayContainsKey!0 a!3186 lt!341097 #b00000000000000000000000000000000)))

(declare-fun lt!341096 () Unit!26404)

(assert (=> b!766829 (= lt!341096 lt!341095)))

(declare-fun res!518765 () Bool)

(assert (=> b!766829 (= res!518765 (= (seekEntryOrOpen!0 (select (arr!20239 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7839 #b00000000000000000000000000000000)))))

(assert (=> b!766829 (=> (not res!518765) (not e!427021))))

(declare-fun d!101283 () Bool)

(declare-fun res!518764 () Bool)

(declare-fun e!427022 () Bool)

(assert (=> d!101283 (=> res!518764 e!427022)))

(assert (=> d!101283 (= res!518764 (bvsge #b00000000000000000000000000000000 (size!20660 a!3186)))))

(assert (=> d!101283 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!427022)))

(declare-fun b!766830 () Bool)

(assert (=> b!766830 (= e!427023 call!35056)))

(declare-fun b!766831 () Bool)

(assert (=> b!766831 (= e!427021 call!35056)))

(declare-fun b!766832 () Bool)

(assert (=> b!766832 (= e!427022 e!427023)))

(declare-fun c!84423 () Bool)

(assert (=> b!766832 (= c!84423 (validKeyInArray!0 (select (arr!20239 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101283 (not res!518764)) b!766832))

(assert (= (and b!766832 c!84423) b!766829))

(assert (= (and b!766832 (not c!84423)) b!766830))

(assert (= (and b!766829 res!518765) b!766831))

(assert (= (or b!766831 b!766830) bm!35053))

(declare-fun m!712703 () Bool)

(assert (=> bm!35053 m!712703))

(assert (=> b!766829 m!712575))

(declare-fun m!712705 () Bool)

(assert (=> b!766829 m!712705))

(declare-fun m!712707 () Bool)

(assert (=> b!766829 m!712707))

(assert (=> b!766829 m!712575))

(declare-fun m!712709 () Bool)

(assert (=> b!766829 m!712709))

(assert (=> b!766832 m!712575))

(assert (=> b!766832 m!712575))

(assert (=> b!766832 m!712675))

(assert (=> b!766501 d!101283))

(declare-fun b!766837 () Bool)

(declare-fun lt!341099 () SeekEntryResult!7839)

(assert (=> b!766837 (and (bvsge (index!33726 lt!341099) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341099) (size!20660 a!3186)))))

(declare-fun res!518768 () Bool)

(assert (=> b!766837 (= res!518768 (= (select (arr!20239 a!3186) (index!33726 lt!341099)) (select (arr!20239 a!3186) j!159)))))

(declare-fun e!427028 () Bool)

(assert (=> b!766837 (=> res!518768 e!427028)))

(declare-fun e!427032 () Bool)

(assert (=> b!766837 (= e!427032 e!427028)))

(declare-fun b!766838 () Bool)

(assert (=> b!766838 (and (bvsge (index!33726 lt!341099) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341099) (size!20660 a!3186)))))

(assert (=> b!766838 (= e!427028 (= (select (arr!20239 a!3186) (index!33726 lt!341099)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766839 () Bool)

(declare-fun e!427031 () Bool)

(assert (=> b!766839 (= e!427031 (bvsge (x!64629 lt!341099) #b01111111111111111111111111111110))))

(declare-fun d!101285 () Bool)

(assert (=> d!101285 e!427031))

(declare-fun c!84426 () Bool)

(assert (=> d!101285 (= c!84426 (and ((_ is Intermediate!7839) lt!341099) (undefined!8651 lt!341099)))))

(declare-fun e!427030 () SeekEntryResult!7839)

(assert (=> d!101285 (= lt!341099 e!427030)))

(declare-fun c!84427 () Bool)

(assert (=> d!101285 (= c!84427 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!341098 () (_ BitVec 64))

(assert (=> d!101285 (= lt!341098 (select (arr!20239 a!3186) lt!340969))))

(assert (=> d!101285 (validMask!0 mask!3328)))

(assert (=> d!101285 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!340969 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!341099)))

(declare-fun b!766840 () Bool)

(assert (=> b!766840 (and (bvsge (index!33726 lt!341099) #b00000000000000000000000000000000) (bvslt (index!33726 lt!341099) (size!20660 a!3186)))))

(declare-fun res!518769 () Bool)

(assert (=> b!766840 (= res!518769 (= (select (arr!20239 a!3186) (index!33726 lt!341099)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766840 (=> res!518769 e!427028)))

(declare-fun b!766841 () Bool)

(assert (=> b!766841 (= e!427031 e!427032)))

(declare-fun res!518770 () Bool)

(assert (=> b!766841 (= res!518770 (and ((_ is Intermediate!7839) lt!341099) (not (undefined!8651 lt!341099)) (bvslt (x!64629 lt!341099) #b01111111111111111111111111111110) (bvsge (x!64629 lt!341099) #b00000000000000000000000000000000) (bvsge (x!64629 lt!341099) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!766841 (=> (not res!518770) (not e!427032))))

(declare-fun b!766843 () Bool)

(declare-fun e!427029 () SeekEntryResult!7839)

(assert (=> b!766843 (= e!427030 e!427029)))

(declare-fun c!84428 () Bool)

(assert (=> b!766843 (= c!84428 (or (= lt!341098 (select (arr!20239 a!3186) j!159)) (= (bvadd lt!341098 lt!341098) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766845 () Bool)

(assert (=> b!766845 (= e!427029 (Intermediate!7839 false lt!340969 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!766846 () Bool)

(assert (=> b!766846 (= e!427030 (Intermediate!7839 true lt!340969 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!766847 () Bool)

(assert (=> b!766847 (= e!427029 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!340969 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20239 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101285 c!84427) b!766846))

(assert (= (and d!101285 (not c!84427)) b!766843))

(assert (= (and b!766843 c!84428) b!766845))

(assert (= (and b!766843 (not c!84428)) b!766847))

(assert (= (and d!101285 c!84426) b!766839))

(assert (= (and d!101285 (not c!84426)) b!766841))

(assert (= (and b!766841 res!518770) b!766837))

(assert (= (and b!766837 (not res!518768)) b!766840))

(assert (= (and b!766840 (not res!518769)) b!766838))

(declare-fun m!712711 () Bool)

(assert (=> b!766838 m!712711))

(declare-fun m!712713 () Bool)

(assert (=> b!766847 m!712713))

(assert (=> b!766847 m!712713))

(assert (=> b!766847 m!712477))

(declare-fun m!712715 () Bool)

(assert (=> b!766847 m!712715))

(declare-fun m!712717 () Bool)

(assert (=> d!101285 m!712717))

(assert (=> d!101285 m!712515))

(assert (=> b!766840 m!712711))

(assert (=> b!766837 m!712711))

(assert (=> b!766511 d!101285))

(declare-fun d!101287 () Bool)

(assert (=> d!101287 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!766508 d!101287))

(declare-fun b!766858 () Bool)

(declare-fun e!427040 () SeekEntryResult!7839)

(declare-fun lt!341103 () SeekEntryResult!7839)

(assert (=> b!766858 (= e!427040 (MissingZero!7839 (index!33726 lt!341103)))))

(declare-fun b!766859 () Bool)

(declare-fun e!427039 () SeekEntryResult!7839)

(declare-fun e!427038 () SeekEntryResult!7839)

(assert (=> b!766859 (= e!427039 e!427038)))

(declare-fun lt!341104 () (_ BitVec 64))

(assert (=> b!766859 (= lt!341104 (select (arr!20239 a!3186) (index!33726 lt!341103)))))

(declare-fun c!84434 () Bool)

(assert (=> b!766859 (= c!84434 (= lt!341104 (select (arr!20239 a!3186) j!159)))))

(declare-fun b!766860 () Bool)

(assert (=> b!766860 (= e!427038 (Found!7839 (index!33726 lt!341103)))))

(declare-fun d!101291 () Bool)

(declare-fun lt!341105 () SeekEntryResult!7839)

(assert (=> d!101291 (and (or ((_ is Undefined!7839) lt!341105) (not ((_ is Found!7839) lt!341105)) (and (bvsge (index!33725 lt!341105) #b00000000000000000000000000000000) (bvslt (index!33725 lt!341105) (size!20660 a!3186)))) (or ((_ is Undefined!7839) lt!341105) ((_ is Found!7839) lt!341105) (not ((_ is MissingZero!7839) lt!341105)) (and (bvsge (index!33724 lt!341105) #b00000000000000000000000000000000) (bvslt (index!33724 lt!341105) (size!20660 a!3186)))) (or ((_ is Undefined!7839) lt!341105) ((_ is Found!7839) lt!341105) ((_ is MissingZero!7839) lt!341105) (not ((_ is MissingVacant!7839) lt!341105)) (and (bvsge (index!33727 lt!341105) #b00000000000000000000000000000000) (bvslt (index!33727 lt!341105) (size!20660 a!3186)))) (or ((_ is Undefined!7839) lt!341105) (ite ((_ is Found!7839) lt!341105) (= (select (arr!20239 a!3186) (index!33725 lt!341105)) (select (arr!20239 a!3186) j!159)) (ite ((_ is MissingZero!7839) lt!341105) (= (select (arr!20239 a!3186) (index!33724 lt!341105)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7839) lt!341105) (= (select (arr!20239 a!3186) (index!33727 lt!341105)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101291 (= lt!341105 e!427039)))

(declare-fun c!84433 () Bool)

(assert (=> d!101291 (= c!84433 (and ((_ is Intermediate!7839) lt!341103) (undefined!8651 lt!341103)))))

(assert (=> d!101291 (= lt!341103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20239 a!3186) j!159) mask!3328) (select (arr!20239 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101291 (validMask!0 mask!3328)))

(assert (=> d!101291 (= (seekEntryOrOpen!0 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!341105)))

(declare-fun b!766861 () Bool)

(assert (=> b!766861 (= e!427040 (seekKeyOrZeroReturnVacant!0 (x!64629 lt!341103) (index!33726 lt!341103) (index!33726 lt!341103) (select (arr!20239 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!766862 () Bool)

(assert (=> b!766862 (= e!427039 Undefined!7839)))

(declare-fun b!766863 () Bool)

(declare-fun c!84432 () Bool)

(assert (=> b!766863 (= c!84432 (= lt!341104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766863 (= e!427038 e!427040)))

(assert (= (and d!101291 c!84433) b!766862))

(assert (= (and d!101291 (not c!84433)) b!766859))

(assert (= (and b!766859 c!84434) b!766860))

(assert (= (and b!766859 (not c!84434)) b!766863))

(assert (= (and b!766863 c!84432) b!766858))

(assert (= (and b!766863 (not c!84432)) b!766861))

(declare-fun m!712729 () Bool)

(assert (=> b!766859 m!712729))

(assert (=> d!101291 m!712495))

(assert (=> d!101291 m!712477))

(assert (=> d!101291 m!712497))

(declare-fun m!712731 () Bool)

(assert (=> d!101291 m!712731))

(declare-fun m!712733 () Bool)

(assert (=> d!101291 m!712733))

(assert (=> d!101291 m!712477))

(assert (=> d!101291 m!712495))

(declare-fun m!712735 () Bool)

(assert (=> d!101291 m!712735))

(assert (=> d!101291 m!712515))

(assert (=> b!766861 m!712477))

(declare-fun m!712737 () Bool)

(assert (=> b!766861 m!712737))

(assert (=> b!766507 d!101291))

(declare-fun d!101293 () Bool)

(assert (=> d!101293 (= (validKeyInArray!0 (select (arr!20239 a!3186) j!159)) (and (not (= (select (arr!20239 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20239 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!766509 d!101293))

(check-sat (not d!101225) (not b!766820) (not b!766595) (not b!766577) (not d!101291) (not b!766861) (not b!766829) (not bm!35053) (not d!101261) (not d!101223) (not d!101241) (not b!766756) (not bm!35052) (not d!101249) (not d!101239) (not b!766832) (not b!766677) (not b!766790) (not b!766778) (not b!766847) (not bm!35046) (not b!766811) (not d!101285) (not b!766760) (not d!101277) (not b!766777) (not b!766780) (not d!101279) (not d!101273) (not b!766622) (not b!766689))
(check-sat)
