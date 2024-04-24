; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64404 () Bool)

(assert start!64404)

(declare-fun b!723530 () Bool)

(declare-fun e!405437 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!723530 (= e!405437 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((array!40918 0))(
  ( (array!40919 (arr!19579 (Array (_ BitVec 32) (_ BitVec 64))) (size!19999 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40918)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40918 (_ BitVec 32)) Bool)

(assert (=> b!723530 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24667 0))(
  ( (Unit!24668) )
))
(declare-fun lt!320721 () Unit!24667)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24667)

(assert (=> b!723530 (= lt!320721 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!723531 () Bool)

(declare-fun e!405435 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7135 0))(
  ( (MissingZero!7135 (index!30908 (_ BitVec 32))) (Found!7135 (index!30909 (_ BitVec 32))) (Intermediate!7135 (undefined!7947 Bool) (index!30910 (_ BitVec 32)) (x!62059 (_ BitVec 32))) (Undefined!7135) (MissingVacant!7135 (index!30911 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40918 (_ BitVec 32)) SeekEntryResult!7135)

(assert (=> b!723531 (= e!405435 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19579 a!3186) j!159) a!3186 mask!3328) (Found!7135 j!159)))))

(declare-fun b!723532 () Bool)

(declare-fun res!484996 () Bool)

(declare-fun e!405436 () Bool)

(assert (=> b!723532 (=> (not res!484996) (not e!405436))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723532 (= res!484996 (validKeyInArray!0 k0!2102))))

(declare-fun b!723533 () Bool)

(declare-fun e!405434 () Bool)

(declare-fun e!405433 () Bool)

(assert (=> b!723533 (= e!405434 e!405433)))

(declare-fun res!484992 () Bool)

(assert (=> b!723533 (=> (not res!484992) (not e!405433))))

(declare-fun lt!320724 () SeekEntryResult!7135)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40918 (_ BitVec 32)) SeekEntryResult!7135)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723533 (= res!484992 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19579 a!3186) j!159) mask!3328) (select (arr!19579 a!3186) j!159) a!3186 mask!3328) lt!320724))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723533 (= lt!320724 (Intermediate!7135 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723534 () Bool)

(declare-fun res!484994 () Bool)

(assert (=> b!723534 (=> (not res!484994) (not e!405436))))

(assert (=> b!723534 (= res!484994 (validKeyInArray!0 (select (arr!19579 a!3186) j!159)))))

(declare-fun b!723535 () Bool)

(assert (=> b!723535 (= e!405435 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19579 a!3186) j!159) a!3186 mask!3328) lt!320724))))

(declare-fun b!723536 () Bool)

(declare-fun res!484990 () Bool)

(assert (=> b!723536 (=> (not res!484990) (not e!405436))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723536 (= res!484990 (and (= (size!19999 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19999 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19999 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!484993 () Bool)

(assert (=> start!64404 (=> (not res!484993) (not e!405436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64404 (= res!484993 (validMask!0 mask!3328))))

(assert (=> start!64404 e!405436))

(assert (=> start!64404 true))

(declare-fun array_inv!15438 (array!40918) Bool)

(assert (=> start!64404 (array_inv!15438 a!3186)))

(declare-fun b!723537 () Bool)

(assert (=> b!723537 (= e!405433 e!405437)))

(declare-fun res!484984 () Bool)

(assert (=> b!723537 (=> (not res!484984) (not e!405437))))

(declare-fun lt!320722 () (_ BitVec 64))

(declare-fun lt!320723 () array!40918)

(assert (=> b!723537 (= res!484984 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320722 mask!3328) lt!320722 lt!320723 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320722 lt!320723 mask!3328)))))

(assert (=> b!723537 (= lt!320722 (select (store (arr!19579 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723537 (= lt!320723 (array!40919 (store (arr!19579 a!3186) i!1173 k0!2102) (size!19999 a!3186)))))

(declare-fun b!723538 () Bool)

(declare-fun res!484988 () Bool)

(assert (=> b!723538 (=> (not res!484988) (not e!405434))))

(assert (=> b!723538 (= res!484988 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19999 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19999 a!3186))))))

(declare-fun b!723539 () Bool)

(declare-fun res!484989 () Bool)

(assert (=> b!723539 (=> (not res!484989) (not e!405434))))

(declare-datatypes ((List!13488 0))(
  ( (Nil!13485) (Cons!13484 (h!14541 (_ BitVec 64)) (t!19795 List!13488)) )
))
(declare-fun arrayNoDuplicates!0 (array!40918 (_ BitVec 32) List!13488) Bool)

(assert (=> b!723539 (= res!484989 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13485))))

(declare-fun b!723540 () Bool)

(declare-fun res!484991 () Bool)

(assert (=> b!723540 (=> (not res!484991) (not e!405434))))

(assert (=> b!723540 (= res!484991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723541 () Bool)

(declare-fun res!484995 () Bool)

(assert (=> b!723541 (=> (not res!484995) (not e!405433))))

(assert (=> b!723541 (= res!484995 e!405435)))

(declare-fun c!79646 () Bool)

(assert (=> b!723541 (= c!79646 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723542 () Bool)

(declare-fun res!484985 () Bool)

(assert (=> b!723542 (=> (not res!484985) (not e!405433))))

(assert (=> b!723542 (= res!484985 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19579 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723543 () Bool)

(assert (=> b!723543 (= e!405436 e!405434)))

(declare-fun res!484986 () Bool)

(assert (=> b!723543 (=> (not res!484986) (not e!405434))))

(declare-fun lt!320720 () SeekEntryResult!7135)

(assert (=> b!723543 (= res!484986 (or (= lt!320720 (MissingZero!7135 i!1173)) (= lt!320720 (MissingVacant!7135 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40918 (_ BitVec 32)) SeekEntryResult!7135)

(assert (=> b!723543 (= lt!320720 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723544 () Bool)

(declare-fun res!484987 () Bool)

(assert (=> b!723544 (=> (not res!484987) (not e!405436))))

(declare-fun arrayContainsKey!0 (array!40918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723544 (= res!484987 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64404 res!484993) b!723536))

(assert (= (and b!723536 res!484990) b!723534))

(assert (= (and b!723534 res!484994) b!723532))

(assert (= (and b!723532 res!484996) b!723544))

(assert (= (and b!723544 res!484987) b!723543))

(assert (= (and b!723543 res!484986) b!723540))

(assert (= (and b!723540 res!484991) b!723539))

(assert (= (and b!723539 res!484989) b!723538))

(assert (= (and b!723538 res!484988) b!723533))

(assert (= (and b!723533 res!484992) b!723542))

(assert (= (and b!723542 res!484985) b!723541))

(assert (= (and b!723541 c!79646) b!723535))

(assert (= (and b!723541 (not c!79646)) b!723531))

(assert (= (and b!723541 res!484995) b!723537))

(assert (= (and b!723537 res!484984) b!723530))

(declare-fun m!678507 () Bool)

(assert (=> b!723531 m!678507))

(assert (=> b!723531 m!678507))

(declare-fun m!678509 () Bool)

(assert (=> b!723531 m!678509))

(declare-fun m!678511 () Bool)

(assert (=> b!723537 m!678511))

(declare-fun m!678513 () Bool)

(assert (=> b!723537 m!678513))

(declare-fun m!678515 () Bool)

(assert (=> b!723537 m!678515))

(declare-fun m!678517 () Bool)

(assert (=> b!723537 m!678517))

(assert (=> b!723537 m!678511))

(declare-fun m!678519 () Bool)

(assert (=> b!723537 m!678519))

(assert (=> b!723533 m!678507))

(assert (=> b!723533 m!678507))

(declare-fun m!678521 () Bool)

(assert (=> b!723533 m!678521))

(assert (=> b!723533 m!678521))

(assert (=> b!723533 m!678507))

(declare-fun m!678523 () Bool)

(assert (=> b!723533 m!678523))

(declare-fun m!678525 () Bool)

(assert (=> start!64404 m!678525))

(declare-fun m!678527 () Bool)

(assert (=> start!64404 m!678527))

(assert (=> b!723534 m!678507))

(assert (=> b!723534 m!678507))

(declare-fun m!678529 () Bool)

(assert (=> b!723534 m!678529))

(declare-fun m!678531 () Bool)

(assert (=> b!723544 m!678531))

(declare-fun m!678533 () Bool)

(assert (=> b!723539 m!678533))

(declare-fun m!678535 () Bool)

(assert (=> b!723542 m!678535))

(assert (=> b!723535 m!678507))

(assert (=> b!723535 m!678507))

(declare-fun m!678537 () Bool)

(assert (=> b!723535 m!678537))

(declare-fun m!678539 () Bool)

(assert (=> b!723532 m!678539))

(declare-fun m!678541 () Bool)

(assert (=> b!723530 m!678541))

(declare-fun m!678543 () Bool)

(assert (=> b!723530 m!678543))

(declare-fun m!678545 () Bool)

(assert (=> b!723540 m!678545))

(declare-fun m!678547 () Bool)

(assert (=> b!723543 m!678547))

(check-sat (not start!64404) (not b!723537) (not b!723540) (not b!723544) (not b!723539) (not b!723543) (not b!723534) (not b!723532) (not b!723530) (not b!723533) (not b!723531) (not b!723535))
(check-sat)
