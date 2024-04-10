; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65308 () Bool)

(assert start!65308)

(declare-fun b!741647 () Bool)

(declare-fun res!498944 () Bool)

(declare-fun e!414551 () Bool)

(assert (=> b!741647 (=> (not res!498944) (not e!414551))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41481 0))(
  ( (array!41482 (arr!19854 (Array (_ BitVec 32) (_ BitVec 64))) (size!20275 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41481)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741647 (= res!498944 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20275 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20275 a!3186))))))

(declare-fun e!414546 () Bool)

(declare-fun b!741648 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7454 0))(
  ( (MissingZero!7454 (index!32184 (_ BitVec 32))) (Found!7454 (index!32185 (_ BitVec 32))) (Intermediate!7454 (undefined!8266 Bool) (index!32186 (_ BitVec 32)) (x!63164 (_ BitVec 32))) (Undefined!7454) (MissingVacant!7454 (index!32187 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41481 (_ BitVec 32)) SeekEntryResult!7454)

(assert (=> b!741648 (= e!414546 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19854 a!3186) j!159) a!3186 mask!3328) (Found!7454 j!159)))))

(declare-fun b!741649 () Bool)

(declare-fun res!498942 () Bool)

(assert (=> b!741649 (=> (not res!498942) (not e!414551))))

(declare-datatypes ((List!13856 0))(
  ( (Nil!13853) (Cons!13852 (h!14924 (_ BitVec 64)) (t!20171 List!13856)) )
))
(declare-fun arrayNoDuplicates!0 (array!41481 (_ BitVec 32) List!13856) Bool)

(assert (=> b!741649 (= res!498942 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13853))))

(declare-fun b!741650 () Bool)

(declare-fun res!498933 () Bool)

(assert (=> b!741650 (=> (not res!498933) (not e!414551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41481 (_ BitVec 32)) Bool)

(assert (=> b!741650 (= res!498933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741651 () Bool)

(declare-fun res!498930 () Bool)

(declare-fun e!414548 () Bool)

(assert (=> b!741651 (=> (not res!498930) (not e!414548))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741651 (= res!498930 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741652 () Bool)

(declare-fun e!414544 () Bool)

(assert (=> b!741652 (= e!414551 e!414544)))

(declare-fun res!498934 () Bool)

(assert (=> b!741652 (=> (not res!498934) (not e!414544))))

(declare-fun lt!329496 () SeekEntryResult!7454)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41481 (_ BitVec 32)) SeekEntryResult!7454)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741652 (= res!498934 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19854 a!3186) j!159) mask!3328) (select (arr!19854 a!3186) j!159) a!3186 mask!3328) lt!329496))))

(assert (=> b!741652 (= lt!329496 (Intermediate!7454 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741653 () Bool)

(declare-fun e!414550 () Bool)

(assert (=> b!741653 (= e!414550 (not true))))

(declare-fun e!414549 () Bool)

(assert (=> b!741653 e!414549))

(declare-fun res!498939 () Bool)

(assert (=> b!741653 (=> (not res!498939) (not e!414549))))

(assert (=> b!741653 (= res!498939 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25388 0))(
  ( (Unit!25389) )
))
(declare-fun lt!329498 () Unit!25388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25388)

(assert (=> b!741653 (= lt!329498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741654 () Bool)

(declare-fun res!498937 () Bool)

(assert (=> b!741654 (=> (not res!498937) (not e!414548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741654 (= res!498937 (validKeyInArray!0 k!2102))))

(declare-fun b!741655 () Bool)

(declare-fun res!498936 () Bool)

(assert (=> b!741655 (=> (not res!498936) (not e!414548))))

(assert (=> b!741655 (= res!498936 (validKeyInArray!0 (select (arr!19854 a!3186) j!159)))))

(declare-fun res!498941 () Bool)

(assert (=> start!65308 (=> (not res!498941) (not e!414548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65308 (= res!498941 (validMask!0 mask!3328))))

(assert (=> start!65308 e!414548))

(assert (=> start!65308 true))

(declare-fun array_inv!15650 (array!41481) Bool)

(assert (=> start!65308 (array_inv!15650 a!3186)))

(declare-fun b!741656 () Bool)

(assert (=> b!741656 (= e!414546 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19854 a!3186) j!159) a!3186 mask!3328) lt!329496))))

(declare-fun b!741657 () Bool)

(declare-fun e!414545 () Bool)

(assert (=> b!741657 (= e!414549 e!414545)))

(declare-fun res!498938 () Bool)

(assert (=> b!741657 (=> (not res!498938) (not e!414545))))

(declare-fun lt!329500 () SeekEntryResult!7454)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41481 (_ BitVec 32)) SeekEntryResult!7454)

(assert (=> b!741657 (= res!498938 (= (seekEntryOrOpen!0 (select (arr!19854 a!3186) j!159) a!3186 mask!3328) lt!329500))))

(assert (=> b!741657 (= lt!329500 (Found!7454 j!159))))

(declare-fun b!741658 () Bool)

(declare-fun res!498931 () Bool)

(assert (=> b!741658 (=> (not res!498931) (not e!414548))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741658 (= res!498931 (and (= (size!20275 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20275 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20275 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741659 () Bool)

(declare-fun res!498940 () Bool)

(assert (=> b!741659 (=> (not res!498940) (not e!414544))))

(assert (=> b!741659 (= res!498940 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19854 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741660 () Bool)

(declare-fun res!498935 () Bool)

(assert (=> b!741660 (=> (not res!498935) (not e!414544))))

(assert (=> b!741660 (= res!498935 e!414546)))

(declare-fun c!81739 () Bool)

(assert (=> b!741660 (= c!81739 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741661 () Bool)

(assert (=> b!741661 (= e!414545 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19854 a!3186) j!159) a!3186 mask!3328) lt!329500))))

(declare-fun b!741662 () Bool)

(assert (=> b!741662 (= e!414544 e!414550)))

(declare-fun res!498943 () Bool)

(assert (=> b!741662 (=> (not res!498943) (not e!414550))))

(declare-fun lt!329501 () array!41481)

(declare-fun lt!329497 () (_ BitVec 64))

(assert (=> b!741662 (= res!498943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329497 mask!3328) lt!329497 lt!329501 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329497 lt!329501 mask!3328)))))

(assert (=> b!741662 (= lt!329497 (select (store (arr!19854 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741662 (= lt!329501 (array!41482 (store (arr!19854 a!3186) i!1173 k!2102) (size!20275 a!3186)))))

(declare-fun b!741663 () Bool)

(assert (=> b!741663 (= e!414548 e!414551)))

(declare-fun res!498932 () Bool)

(assert (=> b!741663 (=> (not res!498932) (not e!414551))))

(declare-fun lt!329499 () SeekEntryResult!7454)

(assert (=> b!741663 (= res!498932 (or (= lt!329499 (MissingZero!7454 i!1173)) (= lt!329499 (MissingVacant!7454 i!1173))))))

(assert (=> b!741663 (= lt!329499 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65308 res!498941) b!741658))

(assert (= (and b!741658 res!498931) b!741655))

(assert (= (and b!741655 res!498936) b!741654))

(assert (= (and b!741654 res!498937) b!741651))

(assert (= (and b!741651 res!498930) b!741663))

(assert (= (and b!741663 res!498932) b!741650))

(assert (= (and b!741650 res!498933) b!741649))

(assert (= (and b!741649 res!498942) b!741647))

(assert (= (and b!741647 res!498944) b!741652))

(assert (= (and b!741652 res!498934) b!741659))

(assert (= (and b!741659 res!498940) b!741660))

(assert (= (and b!741660 c!81739) b!741656))

(assert (= (and b!741660 (not c!81739)) b!741648))

(assert (= (and b!741660 res!498935) b!741662))

(assert (= (and b!741662 res!498943) b!741653))

(assert (= (and b!741653 res!498939) b!741657))

(assert (= (and b!741657 res!498938) b!741661))

(declare-fun m!692599 () Bool)

(assert (=> b!741651 m!692599))

(declare-fun m!692601 () Bool)

(assert (=> b!741662 m!692601))

(declare-fun m!692603 () Bool)

(assert (=> b!741662 m!692603))

(declare-fun m!692605 () Bool)

(assert (=> b!741662 m!692605))

(assert (=> b!741662 m!692603))

(declare-fun m!692607 () Bool)

(assert (=> b!741662 m!692607))

(declare-fun m!692609 () Bool)

(assert (=> b!741662 m!692609))

(declare-fun m!692611 () Bool)

(assert (=> b!741652 m!692611))

(assert (=> b!741652 m!692611))

(declare-fun m!692613 () Bool)

(assert (=> b!741652 m!692613))

(assert (=> b!741652 m!692613))

(assert (=> b!741652 m!692611))

(declare-fun m!692615 () Bool)

(assert (=> b!741652 m!692615))

(assert (=> b!741655 m!692611))

(assert (=> b!741655 m!692611))

(declare-fun m!692617 () Bool)

(assert (=> b!741655 m!692617))

(assert (=> b!741661 m!692611))

(assert (=> b!741661 m!692611))

(declare-fun m!692619 () Bool)

(assert (=> b!741661 m!692619))

(declare-fun m!692621 () Bool)

(assert (=> b!741663 m!692621))

(declare-fun m!692623 () Bool)

(assert (=> start!65308 m!692623))

(declare-fun m!692625 () Bool)

(assert (=> start!65308 m!692625))

(assert (=> b!741648 m!692611))

(assert (=> b!741648 m!692611))

(declare-fun m!692627 () Bool)

(assert (=> b!741648 m!692627))

(declare-fun m!692629 () Bool)

(assert (=> b!741650 m!692629))

(declare-fun m!692631 () Bool)

(assert (=> b!741653 m!692631))

(declare-fun m!692633 () Bool)

(assert (=> b!741653 m!692633))

(declare-fun m!692635 () Bool)

(assert (=> b!741659 m!692635))

(assert (=> b!741657 m!692611))

(assert (=> b!741657 m!692611))

(declare-fun m!692637 () Bool)

(assert (=> b!741657 m!692637))

(assert (=> b!741656 m!692611))

(assert (=> b!741656 m!692611))

(declare-fun m!692639 () Bool)

(assert (=> b!741656 m!692639))

(declare-fun m!692641 () Bool)

(assert (=> b!741649 m!692641))

(declare-fun m!692643 () Bool)

(assert (=> b!741654 m!692643))

(push 1)

