; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65346 () Bool)

(assert start!65346)

(declare-fun res!499826 () Bool)

(declare-fun e!415027 () Bool)

(assert (=> start!65346 (=> (not res!499826) (not e!415027))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65346 (= res!499826 (validMask!0 mask!3328))))

(assert (=> start!65346 e!415027))

(assert (=> start!65346 true))

(declare-datatypes ((array!41519 0))(
  ( (array!41520 (arr!19873 (Array (_ BitVec 32) (_ BitVec 64))) (size!20294 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41519)

(declare-fun array_inv!15669 (array!41519) Bool)

(assert (=> start!65346 (array_inv!15669 a!3186)))

(declare-fun e!415024 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!742648 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7473 0))(
  ( (MissingZero!7473 (index!32260 (_ BitVec 32))) (Found!7473 (index!32261 (_ BitVec 32))) (Intermediate!7473 (undefined!8285 Bool) (index!32262 (_ BitVec 32)) (x!63231 (_ BitVec 32))) (Undefined!7473) (MissingVacant!7473 (index!32263 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41519 (_ BitVec 32)) SeekEntryResult!7473)

(assert (=> b!742648 (= e!415024 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19873 a!3186) j!159) a!3186 mask!3328) (Found!7473 j!159)))))

(declare-fun lt!329919 () SeekEntryResult!7473)

(declare-fun b!742649 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41519 (_ BitVec 32)) SeekEntryResult!7473)

(assert (=> b!742649 (= e!415024 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19873 a!3186) j!159) a!3186 mask!3328) lt!329919))))

(declare-fun b!742650 () Bool)

(declare-fun e!415028 () Bool)

(assert (=> b!742650 (= e!415028 true)))

(declare-fun lt!329921 () SeekEntryResult!7473)

(assert (=> b!742650 (= lt!329921 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19873 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!742651 () Bool)

(declare-fun res!499827 () Bool)

(declare-fun e!415026 () Bool)

(assert (=> b!742651 (=> (not res!499827) (not e!415026))))

(assert (=> b!742651 (= res!499827 e!415024)))

(declare-fun c!81796 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742651 (= c!81796 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742652 () Bool)

(declare-fun res!499818 () Bool)

(declare-fun e!415023 () Bool)

(assert (=> b!742652 (=> (not res!499818) (not e!415023))))

(declare-datatypes ((List!13875 0))(
  ( (Nil!13872) (Cons!13871 (h!14943 (_ BitVec 64)) (t!20190 List!13875)) )
))
(declare-fun arrayNoDuplicates!0 (array!41519 (_ BitVec 32) List!13875) Bool)

(assert (=> b!742652 (= res!499818 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13872))))

(declare-fun b!742653 () Bool)

(declare-fun res!499832 () Bool)

(assert (=> b!742653 (=> (not res!499832) (not e!415027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742653 (= res!499832 (validKeyInArray!0 (select (arr!19873 a!3186) j!159)))))

(declare-fun b!742654 () Bool)

(declare-fun res!499831 () Bool)

(assert (=> b!742654 (=> (not res!499831) (not e!415026))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742654 (= res!499831 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19873 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742655 () Bool)

(declare-fun e!415025 () Bool)

(assert (=> b!742655 (= e!415025 (not e!415028))))

(declare-fun res!499825 () Bool)

(assert (=> b!742655 (=> res!499825 e!415028)))

(declare-fun lt!329916 () SeekEntryResult!7473)

(get-info :version)

(assert (=> b!742655 (= res!499825 (or (not ((_ is Intermediate!7473) lt!329916)) (bvslt x!1131 (x!63231 lt!329916)) (not (= x!1131 (x!63231 lt!329916))) (not (= index!1321 (index!32262 lt!329916)))))))

(declare-fun e!415029 () Bool)

(assert (=> b!742655 e!415029))

(declare-fun res!499820 () Bool)

(assert (=> b!742655 (=> (not res!499820) (not e!415029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41519 (_ BitVec 32)) Bool)

(assert (=> b!742655 (= res!499820 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25426 0))(
  ( (Unit!25427) )
))
(declare-fun lt!329918 () Unit!25426)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25426)

(assert (=> b!742655 (= lt!329918 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742656 () Bool)

(declare-fun res!499817 () Bool)

(assert (=> b!742656 (=> (not res!499817) (not e!415023))))

(assert (=> b!742656 (= res!499817 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20294 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20294 a!3186))))))

(declare-fun b!742657 () Bool)

(declare-fun res!499823 () Bool)

(assert (=> b!742657 (=> (not res!499823) (not e!415027))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742657 (= res!499823 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742658 () Bool)

(declare-fun e!415031 () Bool)

(assert (=> b!742658 (= e!415029 e!415031)))

(declare-fun res!499828 () Bool)

(assert (=> b!742658 (=> (not res!499828) (not e!415031))))

(declare-fun lt!329922 () SeekEntryResult!7473)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41519 (_ BitVec 32)) SeekEntryResult!7473)

(assert (=> b!742658 (= res!499828 (= (seekEntryOrOpen!0 (select (arr!19873 a!3186) j!159) a!3186 mask!3328) lt!329922))))

(assert (=> b!742658 (= lt!329922 (Found!7473 j!159))))

(declare-fun b!742659 () Bool)

(declare-fun res!499824 () Bool)

(assert (=> b!742659 (=> (not res!499824) (not e!415023))))

(assert (=> b!742659 (= res!499824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742660 () Bool)

(assert (=> b!742660 (= e!415027 e!415023)))

(declare-fun res!499829 () Bool)

(assert (=> b!742660 (=> (not res!499829) (not e!415023))))

(declare-fun lt!329920 () SeekEntryResult!7473)

(assert (=> b!742660 (= res!499829 (or (= lt!329920 (MissingZero!7473 i!1173)) (= lt!329920 (MissingVacant!7473 i!1173))))))

(assert (=> b!742660 (= lt!329920 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742661 () Bool)

(declare-fun res!499830 () Bool)

(assert (=> b!742661 (=> (not res!499830) (not e!415027))))

(assert (=> b!742661 (= res!499830 (validKeyInArray!0 k0!2102))))

(declare-fun b!742662 () Bool)

(assert (=> b!742662 (= e!415023 e!415026)))

(declare-fun res!499822 () Bool)

(assert (=> b!742662 (=> (not res!499822) (not e!415026))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742662 (= res!499822 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19873 a!3186) j!159) mask!3328) (select (arr!19873 a!3186) j!159) a!3186 mask!3328) lt!329919))))

(assert (=> b!742662 (= lt!329919 (Intermediate!7473 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742663 () Bool)

(assert (=> b!742663 (= e!415031 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19873 a!3186) j!159) a!3186 mask!3328) lt!329922))))

(declare-fun b!742664 () Bool)

(assert (=> b!742664 (= e!415026 e!415025)))

(declare-fun res!499819 () Bool)

(assert (=> b!742664 (=> (not res!499819) (not e!415025))))

(declare-fun lt!329923 () SeekEntryResult!7473)

(assert (=> b!742664 (= res!499819 (= lt!329923 lt!329916))))

(declare-fun lt!329924 () array!41519)

(declare-fun lt!329917 () (_ BitVec 64))

(assert (=> b!742664 (= lt!329916 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329917 lt!329924 mask!3328))))

(assert (=> b!742664 (= lt!329923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329917 mask!3328) lt!329917 lt!329924 mask!3328))))

(assert (=> b!742664 (= lt!329917 (select (store (arr!19873 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742664 (= lt!329924 (array!41520 (store (arr!19873 a!3186) i!1173 k0!2102) (size!20294 a!3186)))))

(declare-fun b!742665 () Bool)

(declare-fun res!499821 () Bool)

(assert (=> b!742665 (=> (not res!499821) (not e!415027))))

(assert (=> b!742665 (= res!499821 (and (= (size!20294 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20294 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20294 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65346 res!499826) b!742665))

(assert (= (and b!742665 res!499821) b!742653))

(assert (= (and b!742653 res!499832) b!742661))

(assert (= (and b!742661 res!499830) b!742657))

(assert (= (and b!742657 res!499823) b!742660))

(assert (= (and b!742660 res!499829) b!742659))

(assert (= (and b!742659 res!499824) b!742652))

(assert (= (and b!742652 res!499818) b!742656))

(assert (= (and b!742656 res!499817) b!742662))

(assert (= (and b!742662 res!499822) b!742654))

(assert (= (and b!742654 res!499831) b!742651))

(assert (= (and b!742651 c!81796) b!742649))

(assert (= (and b!742651 (not c!81796)) b!742648))

(assert (= (and b!742651 res!499827) b!742664))

(assert (= (and b!742664 res!499819) b!742655))

(assert (= (and b!742655 res!499820) b!742658))

(assert (= (and b!742658 res!499828) b!742663))

(assert (= (and b!742655 (not res!499825)) b!742650))

(declare-fun m!693479 () Bool)

(assert (=> b!742652 m!693479))

(declare-fun m!693481 () Bool)

(assert (=> b!742661 m!693481))

(declare-fun m!693483 () Bool)

(assert (=> b!742648 m!693483))

(assert (=> b!742648 m!693483))

(declare-fun m!693485 () Bool)

(assert (=> b!742648 m!693485))

(assert (=> b!742650 m!693483))

(assert (=> b!742650 m!693483))

(assert (=> b!742650 m!693485))

(declare-fun m!693487 () Bool)

(assert (=> start!65346 m!693487))

(declare-fun m!693489 () Bool)

(assert (=> start!65346 m!693489))

(declare-fun m!693491 () Bool)

(assert (=> b!742655 m!693491))

(declare-fun m!693493 () Bool)

(assert (=> b!742655 m!693493))

(declare-fun m!693495 () Bool)

(assert (=> b!742660 m!693495))

(declare-fun m!693497 () Bool)

(assert (=> b!742664 m!693497))

(declare-fun m!693499 () Bool)

(assert (=> b!742664 m!693499))

(declare-fun m!693501 () Bool)

(assert (=> b!742664 m!693501))

(declare-fun m!693503 () Bool)

(assert (=> b!742664 m!693503))

(assert (=> b!742664 m!693497))

(declare-fun m!693505 () Bool)

(assert (=> b!742664 m!693505))

(declare-fun m!693507 () Bool)

(assert (=> b!742657 m!693507))

(declare-fun m!693509 () Bool)

(assert (=> b!742654 m!693509))

(declare-fun m!693511 () Bool)

(assert (=> b!742659 m!693511))

(assert (=> b!742658 m!693483))

(assert (=> b!742658 m!693483))

(declare-fun m!693513 () Bool)

(assert (=> b!742658 m!693513))

(assert (=> b!742649 m!693483))

(assert (=> b!742649 m!693483))

(declare-fun m!693515 () Bool)

(assert (=> b!742649 m!693515))

(assert (=> b!742653 m!693483))

(assert (=> b!742653 m!693483))

(declare-fun m!693517 () Bool)

(assert (=> b!742653 m!693517))

(assert (=> b!742663 m!693483))

(assert (=> b!742663 m!693483))

(declare-fun m!693519 () Bool)

(assert (=> b!742663 m!693519))

(assert (=> b!742662 m!693483))

(assert (=> b!742662 m!693483))

(declare-fun m!693521 () Bool)

(assert (=> b!742662 m!693521))

(assert (=> b!742662 m!693521))

(assert (=> b!742662 m!693483))

(declare-fun m!693523 () Bool)

(assert (=> b!742662 m!693523))

(check-sat (not start!65346) (not b!742664) (not b!742660) (not b!742661) (not b!742657) (not b!742653) (not b!742655) (not b!742649) (not b!742650) (not b!742662) (not b!742663) (not b!742652) (not b!742648) (not b!742658) (not b!742659))
(check-sat)
