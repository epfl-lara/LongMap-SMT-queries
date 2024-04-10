; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66458 () Bool)

(assert start!66458)

(declare-fun res!517873 () Bool)

(declare-fun e!426413 () Bool)

(assert (=> start!66458 (=> (not res!517873) (not e!426413))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66458 (= res!517873 (validMask!0 mask!3328))))

(assert (=> start!66458 e!426413))

(assert (=> start!66458 true))

(declare-datatypes ((array!42237 0))(
  ( (array!42238 (arr!20223 (Array (_ BitVec 32) (_ BitVec 64))) (size!20644 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42237)

(declare-fun array_inv!16019 (array!42237) Bool)

(assert (=> start!66458 (array_inv!16019 a!3186)))

(declare-fun b!765652 () Bool)

(declare-fun res!517877 () Bool)

(declare-fun e!426420 () Bool)

(assert (=> b!765652 (=> (not res!517877) (not e!426420))))

(declare-datatypes ((List!14225 0))(
  ( (Nil!14222) (Cons!14221 (h!15311 (_ BitVec 64)) (t!20540 List!14225)) )
))
(declare-fun arrayNoDuplicates!0 (array!42237 (_ BitVec 32) List!14225) Bool)

(assert (=> b!765652 (= res!517877 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14222))))

(declare-fun b!765653 () Bool)

(declare-fun e!426419 () Bool)

(assert (=> b!765653 (= e!426420 e!426419)))

(declare-fun res!517879 () Bool)

(assert (=> b!765653 (=> (not res!517879) (not e!426419))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7823 0))(
  ( (MissingZero!7823 (index!33660 (_ BitVec 32))) (Found!7823 (index!33661 (_ BitVec 32))) (Intermediate!7823 (undefined!8635 Bool) (index!33662 (_ BitVec 32)) (x!64573 (_ BitVec 32))) (Undefined!7823) (MissingVacant!7823 (index!33663 (_ BitVec 32))) )
))
(declare-fun lt!340613 () SeekEntryResult!7823)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42237 (_ BitVec 32)) SeekEntryResult!7823)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765653 (= res!517879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20223 a!3186) j!159) mask!3328) (select (arr!20223 a!3186) j!159) a!3186 mask!3328) lt!340613))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765653 (= lt!340613 (Intermediate!7823 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!340609 () SeekEntryResult!7823)

(declare-fun e!426414 () Bool)

(declare-fun b!765654 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42237 (_ BitVec 32)) SeekEntryResult!7823)

(assert (=> b!765654 (= e!426414 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20223 a!3186) j!159) a!3186 mask!3328) lt!340609))))

(declare-fun b!765655 () Bool)

(declare-fun res!517878 () Bool)

(assert (=> b!765655 (=> (not res!517878) (not e!426419))))

(declare-fun e!426417 () Bool)

(assert (=> b!765655 (= res!517878 e!426417)))

(declare-fun c!84280 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!765655 (= c!84280 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765656 () Bool)

(declare-fun res!517875 () Bool)

(assert (=> b!765656 (=> (not res!517875) (not e!426419))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765656 (= res!517875 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20223 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765657 () Bool)

(declare-fun res!517874 () Bool)

(assert (=> b!765657 (=> (not res!517874) (not e!426413))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765657 (= res!517874 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765658 () Bool)

(declare-fun e!426415 () Bool)

(assert (=> b!765658 (= e!426415 (not true))))

(declare-fun e!426418 () Bool)

(assert (=> b!765658 e!426418))

(declare-fun res!517885 () Bool)

(assert (=> b!765658 (=> (not res!517885) (not e!426418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42237 (_ BitVec 32)) Bool)

(assert (=> b!765658 (= res!517885 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26372 0))(
  ( (Unit!26373) )
))
(declare-fun lt!340610 () Unit!26372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26372)

(assert (=> b!765658 (= lt!340610 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765659 () Bool)

(assert (=> b!765659 (= e!426413 e!426420)))

(declare-fun res!517880 () Bool)

(assert (=> b!765659 (=> (not res!517880) (not e!426420))))

(declare-fun lt!340611 () SeekEntryResult!7823)

(assert (=> b!765659 (= res!517880 (or (= lt!340611 (MissingZero!7823 i!1173)) (= lt!340611 (MissingVacant!7823 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42237 (_ BitVec 32)) SeekEntryResult!7823)

(assert (=> b!765659 (= lt!340611 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!765660 () Bool)

(assert (=> b!765660 (= e!426418 e!426414)))

(declare-fun res!517872 () Bool)

(assert (=> b!765660 (=> (not res!517872) (not e!426414))))

(assert (=> b!765660 (= res!517872 (= (seekEntryOrOpen!0 (select (arr!20223 a!3186) j!159) a!3186 mask!3328) lt!340609))))

(assert (=> b!765660 (= lt!340609 (Found!7823 j!159))))

(declare-fun b!765661 () Bool)

(declare-fun res!517881 () Bool)

(assert (=> b!765661 (=> (not res!517881) (not e!426413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765661 (= res!517881 (validKeyInArray!0 (select (arr!20223 a!3186) j!159)))))

(declare-fun b!765662 () Bool)

(declare-fun res!517882 () Bool)

(assert (=> b!765662 (=> (not res!517882) (not e!426413))))

(assert (=> b!765662 (= res!517882 (validKeyInArray!0 k!2102))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!765663 () Bool)

(assert (=> b!765663 (= e!426417 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20223 a!3186) j!159) a!3186 mask!3328) (Found!7823 j!159)))))

(declare-fun b!765664 () Bool)

(declare-fun res!517871 () Bool)

(assert (=> b!765664 (=> (not res!517871) (not e!426413))))

(assert (=> b!765664 (= res!517871 (and (= (size!20644 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20644 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20644 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765665 () Bool)

(assert (=> b!765665 (= e!426419 e!426415)))

(declare-fun res!517883 () Bool)

(assert (=> b!765665 (=> (not res!517883) (not e!426415))))

(declare-fun lt!340608 () (_ BitVec 64))

(declare-fun lt!340612 () array!42237)

(assert (=> b!765665 (= res!517883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340608 mask!3328) lt!340608 lt!340612 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340608 lt!340612 mask!3328)))))

(assert (=> b!765665 (= lt!340608 (select (store (arr!20223 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!765665 (= lt!340612 (array!42238 (store (arr!20223 a!3186) i!1173 k!2102) (size!20644 a!3186)))))

(declare-fun b!765666 () Bool)

(declare-fun res!517876 () Bool)

(assert (=> b!765666 (=> (not res!517876) (not e!426420))))

(assert (=> b!765666 (= res!517876 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20644 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20644 a!3186))))))

(declare-fun b!765667 () Bool)

(declare-fun res!517884 () Bool)

(assert (=> b!765667 (=> (not res!517884) (not e!426420))))

(assert (=> b!765667 (= res!517884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765668 () Bool)

(assert (=> b!765668 (= e!426417 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20223 a!3186) j!159) a!3186 mask!3328) lt!340613))))

(assert (= (and start!66458 res!517873) b!765664))

(assert (= (and b!765664 res!517871) b!765661))

(assert (= (and b!765661 res!517881) b!765662))

(assert (= (and b!765662 res!517882) b!765657))

(assert (= (and b!765657 res!517874) b!765659))

(assert (= (and b!765659 res!517880) b!765667))

(assert (= (and b!765667 res!517884) b!765652))

(assert (= (and b!765652 res!517877) b!765666))

(assert (= (and b!765666 res!517876) b!765653))

(assert (= (and b!765653 res!517879) b!765656))

(assert (= (and b!765656 res!517875) b!765655))

(assert (= (and b!765655 c!84280) b!765668))

(assert (= (and b!765655 (not c!84280)) b!765663))

(assert (= (and b!765655 res!517878) b!765665))

(assert (= (and b!765665 res!517883) b!765658))

(assert (= (and b!765658 res!517885) b!765660))

(assert (= (and b!765660 res!517872) b!765654))

(declare-fun m!711723 () Bool)

(assert (=> b!765657 m!711723))

(declare-fun m!711725 () Bool)

(assert (=> b!765659 m!711725))

(declare-fun m!711727 () Bool)

(assert (=> b!765667 m!711727))

(declare-fun m!711729 () Bool)

(assert (=> b!765663 m!711729))

(assert (=> b!765663 m!711729))

(declare-fun m!711731 () Bool)

(assert (=> b!765663 m!711731))

(declare-fun m!711733 () Bool)

(assert (=> b!765665 m!711733))

(declare-fun m!711735 () Bool)

(assert (=> b!765665 m!711735))

(declare-fun m!711737 () Bool)

(assert (=> b!765665 m!711737))

(assert (=> b!765665 m!711733))

(declare-fun m!711739 () Bool)

(assert (=> b!765665 m!711739))

(declare-fun m!711741 () Bool)

(assert (=> b!765665 m!711741))

(assert (=> b!765660 m!711729))

(assert (=> b!765660 m!711729))

(declare-fun m!711743 () Bool)

(assert (=> b!765660 m!711743))

(declare-fun m!711745 () Bool)

(assert (=> b!765652 m!711745))

(declare-fun m!711747 () Bool)

(assert (=> start!66458 m!711747))

(declare-fun m!711749 () Bool)

(assert (=> start!66458 m!711749))

(assert (=> b!765661 m!711729))

(assert (=> b!765661 m!711729))

(declare-fun m!711751 () Bool)

(assert (=> b!765661 m!711751))

(assert (=> b!765668 m!711729))

(assert (=> b!765668 m!711729))

(declare-fun m!711753 () Bool)

(assert (=> b!765668 m!711753))

(declare-fun m!711755 () Bool)

(assert (=> b!765658 m!711755))

(declare-fun m!711757 () Bool)

(assert (=> b!765658 m!711757))

(assert (=> b!765653 m!711729))

(assert (=> b!765653 m!711729))

(declare-fun m!711759 () Bool)

(assert (=> b!765653 m!711759))

(assert (=> b!765653 m!711759))

(assert (=> b!765653 m!711729))

(declare-fun m!711761 () Bool)

(assert (=> b!765653 m!711761))

(declare-fun m!711763 () Bool)

(assert (=> b!765656 m!711763))

(declare-fun m!711765 () Bool)

(assert (=> b!765662 m!711765))

(assert (=> b!765654 m!711729))

(assert (=> b!765654 m!711729))

(declare-fun m!711767 () Bool)

(assert (=> b!765654 m!711767))

(push 1)

