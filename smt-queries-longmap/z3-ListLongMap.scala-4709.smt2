; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65442 () Bool)

(assert start!65442)

(declare-fun b!742545 () Bool)

(declare-fun res!499375 () Bool)

(declare-fun e!415099 () Bool)

(assert (=> b!742545 (=> (not res!499375) (not e!415099))))

(declare-fun e!415101 () Bool)

(assert (=> b!742545 (= res!499375 e!415101)))

(declare-fun c!81971 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742545 (= c!81971 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742546 () Bool)

(declare-fun res!499370 () Bool)

(assert (=> b!742546 (=> (not res!499370) (not e!415099))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41485 0))(
  ( (array!41486 (arr!19852 (Array (_ BitVec 32) (_ BitVec 64))) (size!20272 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41485)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742546 (= res!499370 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19852 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742547 () Bool)

(declare-fun e!415094 () Bool)

(assert (=> b!742547 (= e!415094 e!415099)))

(declare-fun res!499378 () Bool)

(assert (=> b!742547 (=> (not res!499378) (not e!415099))))

(declare-datatypes ((SeekEntryResult!7408 0))(
  ( (MissingZero!7408 (index!32000 (_ BitVec 32))) (Found!7408 (index!32001 (_ BitVec 32))) (Intermediate!7408 (undefined!8220 Bool) (index!32002 (_ BitVec 32)) (x!63138 (_ BitVec 32))) (Undefined!7408) (MissingVacant!7408 (index!32003 (_ BitVec 32))) )
))
(declare-fun lt!329872 () SeekEntryResult!7408)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41485 (_ BitVec 32)) SeekEntryResult!7408)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742547 (= res!499378 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19852 a!3186) j!159) mask!3328) (select (arr!19852 a!3186) j!159) a!3186 mask!3328) lt!329872))))

(assert (=> b!742547 (= lt!329872 (Intermediate!7408 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742548 () Bool)

(declare-fun res!499383 () Bool)

(declare-fun e!415098 () Bool)

(assert (=> b!742548 (=> (not res!499383) (not e!415098))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742548 (= res!499383 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742549 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41485 (_ BitVec 32)) SeekEntryResult!7408)

(assert (=> b!742549 (= e!415101 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19852 a!3186) j!159) a!3186 mask!3328) (Found!7408 j!159)))))

(declare-fun b!742550 () Bool)

(assert (=> b!742550 (= e!415098 e!415094)))

(declare-fun res!499376 () Bool)

(assert (=> b!742550 (=> (not res!499376) (not e!415094))))

(declare-fun lt!329868 () SeekEntryResult!7408)

(assert (=> b!742550 (= res!499376 (or (= lt!329868 (MissingZero!7408 i!1173)) (= lt!329868 (MissingVacant!7408 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41485 (_ BitVec 32)) SeekEntryResult!7408)

(assert (=> b!742550 (= lt!329868 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742551 () Bool)

(declare-fun res!499382 () Bool)

(assert (=> b!742551 (=> (not res!499382) (not e!415098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742551 (= res!499382 (validKeyInArray!0 (select (arr!19852 a!3186) j!159)))))

(declare-fun b!742552 () Bool)

(assert (=> b!742552 (= e!415101 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19852 a!3186) j!159) a!3186 mask!3328) lt!329872))))

(declare-fun res!499371 () Bool)

(assert (=> start!65442 (=> (not res!499371) (not e!415098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65442 (= res!499371 (validMask!0 mask!3328))))

(assert (=> start!65442 e!415098))

(assert (=> start!65442 true))

(declare-fun array_inv!15711 (array!41485) Bool)

(assert (=> start!65442 (array_inv!15711 a!3186)))

(declare-fun b!742553 () Bool)

(declare-fun res!499374 () Bool)

(assert (=> b!742553 (=> (not res!499374) (not e!415098))))

(assert (=> b!742553 (= res!499374 (and (= (size!20272 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20272 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20272 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742554 () Bool)

(declare-fun e!415096 () Bool)

(declare-fun e!415100 () Bool)

(assert (=> b!742554 (= e!415096 e!415100)))

(declare-fun res!499380 () Bool)

(assert (=> b!742554 (=> (not res!499380) (not e!415100))))

(declare-fun lt!329869 () SeekEntryResult!7408)

(assert (=> b!742554 (= res!499380 (= (seekEntryOrOpen!0 (select (arr!19852 a!3186) j!159) a!3186 mask!3328) lt!329869))))

(assert (=> b!742554 (= lt!329869 (Found!7408 j!159))))

(declare-fun b!742555 () Bool)

(assert (=> b!742555 (= e!415100 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19852 a!3186) j!159) a!3186 mask!3328) lt!329869))))

(declare-fun b!742556 () Bool)

(declare-fun res!499372 () Bool)

(assert (=> b!742556 (=> (not res!499372) (not e!415094))))

(declare-datatypes ((List!13761 0))(
  ( (Nil!13758) (Cons!13757 (h!14835 (_ BitVec 64)) (t!20068 List!13761)) )
))
(declare-fun arrayNoDuplicates!0 (array!41485 (_ BitVec 32) List!13761) Bool)

(assert (=> b!742556 (= res!499372 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13758))))

(declare-fun b!742557 () Bool)

(declare-fun res!499373 () Bool)

(assert (=> b!742557 (=> (not res!499373) (not e!415094))))

(assert (=> b!742557 (= res!499373 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20272 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20272 a!3186))))))

(declare-fun b!742558 () Bool)

(declare-fun e!415097 () Bool)

(assert (=> b!742558 (= e!415099 e!415097)))

(declare-fun res!499381 () Bool)

(assert (=> b!742558 (=> (not res!499381) (not e!415097))))

(declare-fun lt!329874 () SeekEntryResult!7408)

(declare-fun lt!329871 () SeekEntryResult!7408)

(assert (=> b!742558 (= res!499381 (= lt!329874 lt!329871))))

(declare-fun lt!329867 () array!41485)

(declare-fun lt!329870 () (_ BitVec 64))

(assert (=> b!742558 (= lt!329871 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329870 lt!329867 mask!3328))))

(assert (=> b!742558 (= lt!329874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329870 mask!3328) lt!329870 lt!329867 mask!3328))))

(assert (=> b!742558 (= lt!329870 (select (store (arr!19852 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742558 (= lt!329867 (array!41486 (store (arr!19852 a!3186) i!1173 k0!2102) (size!20272 a!3186)))))

(declare-fun b!742559 () Bool)

(get-info :version)

(assert (=> b!742559 (= e!415097 (not (or (not ((_ is Intermediate!7408) lt!329871)) (not (= x!1131 (x!63138 lt!329871))) (not (= index!1321 (index!32002 lt!329871))) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!742559 e!415096))

(declare-fun res!499379 () Bool)

(assert (=> b!742559 (=> (not res!499379) (not e!415096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41485 (_ BitVec 32)) Bool)

(assert (=> b!742559 (= res!499379 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25375 0))(
  ( (Unit!25376) )
))
(declare-fun lt!329873 () Unit!25375)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25375)

(assert (=> b!742559 (= lt!329873 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742560 () Bool)

(declare-fun res!499377 () Bool)

(assert (=> b!742560 (=> (not res!499377) (not e!415098))))

(assert (=> b!742560 (= res!499377 (validKeyInArray!0 k0!2102))))

(declare-fun b!742561 () Bool)

(declare-fun res!499384 () Bool)

(assert (=> b!742561 (=> (not res!499384) (not e!415094))))

(assert (=> b!742561 (= res!499384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65442 res!499371) b!742553))

(assert (= (and b!742553 res!499374) b!742551))

(assert (= (and b!742551 res!499382) b!742560))

(assert (= (and b!742560 res!499377) b!742548))

(assert (= (and b!742548 res!499383) b!742550))

(assert (= (and b!742550 res!499376) b!742561))

(assert (= (and b!742561 res!499384) b!742556))

(assert (= (and b!742556 res!499372) b!742557))

(assert (= (and b!742557 res!499373) b!742547))

(assert (= (and b!742547 res!499378) b!742546))

(assert (= (and b!742546 res!499370) b!742545))

(assert (= (and b!742545 c!81971) b!742552))

(assert (= (and b!742545 (not c!81971)) b!742549))

(assert (= (and b!742545 res!499375) b!742558))

(assert (= (and b!742558 res!499381) b!742559))

(assert (= (and b!742559 res!499379) b!742554))

(assert (= (and b!742554 res!499380) b!742555))

(declare-fun m!693897 () Bool)

(assert (=> b!742552 m!693897))

(assert (=> b!742552 m!693897))

(declare-fun m!693899 () Bool)

(assert (=> b!742552 m!693899))

(assert (=> b!742551 m!693897))

(assert (=> b!742551 m!693897))

(declare-fun m!693901 () Bool)

(assert (=> b!742551 m!693901))

(declare-fun m!693903 () Bool)

(assert (=> b!742561 m!693903))

(assert (=> b!742549 m!693897))

(assert (=> b!742549 m!693897))

(declare-fun m!693905 () Bool)

(assert (=> b!742549 m!693905))

(declare-fun m!693907 () Bool)

(assert (=> b!742550 m!693907))

(declare-fun m!693909 () Bool)

(assert (=> b!742559 m!693909))

(declare-fun m!693911 () Bool)

(assert (=> b!742559 m!693911))

(declare-fun m!693913 () Bool)

(assert (=> start!65442 m!693913))

(declare-fun m!693915 () Bool)

(assert (=> start!65442 m!693915))

(declare-fun m!693917 () Bool)

(assert (=> b!742558 m!693917))

(declare-fun m!693919 () Bool)

(assert (=> b!742558 m!693919))

(declare-fun m!693921 () Bool)

(assert (=> b!742558 m!693921))

(declare-fun m!693923 () Bool)

(assert (=> b!742558 m!693923))

(declare-fun m!693925 () Bool)

(assert (=> b!742558 m!693925))

(assert (=> b!742558 m!693921))

(declare-fun m!693927 () Bool)

(assert (=> b!742560 m!693927))

(assert (=> b!742555 m!693897))

(assert (=> b!742555 m!693897))

(declare-fun m!693929 () Bool)

(assert (=> b!742555 m!693929))

(assert (=> b!742547 m!693897))

(assert (=> b!742547 m!693897))

(declare-fun m!693931 () Bool)

(assert (=> b!742547 m!693931))

(assert (=> b!742547 m!693931))

(assert (=> b!742547 m!693897))

(declare-fun m!693933 () Bool)

(assert (=> b!742547 m!693933))

(assert (=> b!742554 m!693897))

(assert (=> b!742554 m!693897))

(declare-fun m!693935 () Bool)

(assert (=> b!742554 m!693935))

(declare-fun m!693937 () Bool)

(assert (=> b!742546 m!693937))

(declare-fun m!693939 () Bool)

(assert (=> b!742556 m!693939))

(declare-fun m!693941 () Bool)

(assert (=> b!742548 m!693941))

(check-sat (not b!742556) (not b!742550) (not b!742552) (not b!742555) (not b!742551) (not b!742548) (not start!65442) (not b!742561) (not b!742558) (not b!742559) (not b!742560) (not b!742547) (not b!742554) (not b!742549))
(check-sat)
