; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65836 () Bool)

(assert start!65836)

(declare-fun b!758253 () Bool)

(declare-fun res!512952 () Bool)

(declare-fun e!422752 () Bool)

(assert (=> b!758253 (=> (not res!512952) (not e!422752))))

(declare-datatypes ((array!42009 0))(
  ( (array!42010 (arr!20118 (Array (_ BitVec 32) (_ BitVec 64))) (size!20539 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42009)

(declare-datatypes ((List!14120 0))(
  ( (Nil!14117) (Cons!14116 (h!15188 (_ BitVec 64)) (t!20435 List!14120)) )
))
(declare-fun arrayNoDuplicates!0 (array!42009 (_ BitVec 32) List!14120) Bool)

(assert (=> b!758253 (= res!512952 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14117))))

(declare-fun b!758254 () Bool)

(declare-fun e!422753 () Bool)

(declare-fun e!422742 () Bool)

(assert (=> b!758254 (= e!422753 e!422742)))

(declare-fun res!512945 () Bool)

(assert (=> b!758254 (=> res!512945 e!422742)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!758254 (= res!512945 (or (not (= (select (arr!20118 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-datatypes ((SeekEntryResult!7718 0))(
  ( (MissingZero!7718 (index!33240 (_ BitVec 32))) (Found!7718 (index!33241 (_ BitVec 32))) (Intermediate!7718 (undefined!8530 Bool) (index!33242 (_ BitVec 32)) (x!64132 (_ BitVec 32))) (Undefined!7718) (MissingVacant!7718 (index!33243 (_ BitVec 32))) )
))
(declare-fun lt!337747 () SeekEntryResult!7718)

(declare-fun lt!337754 () SeekEntryResult!7718)

(declare-fun lt!337740 () SeekEntryResult!7718)

(declare-fun lt!337751 () SeekEntryResult!7718)

(assert (=> b!758254 (and (= lt!337751 lt!337747) (= lt!337740 lt!337754))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!337749 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!337745 () array!42009)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42009 (_ BitVec 32)) SeekEntryResult!7718)

(assert (=> b!758254 (= lt!337747 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337749 lt!337745 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42009 (_ BitVec 32)) SeekEntryResult!7718)

(assert (=> b!758254 (= lt!337751 (seekEntryOrOpen!0 lt!337749 lt!337745 mask!3328))))

(declare-fun lt!337743 () (_ BitVec 64))

(assert (=> b!758254 (= lt!337743 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!26252 0))(
  ( (Unit!26253) )
))
(declare-fun lt!337741 () Unit!26252)

(declare-fun e!422744 () Unit!26252)

(assert (=> b!758254 (= lt!337741 e!422744)))

(declare-fun c!83038 () Bool)

(assert (=> b!758254 (= c!83038 (= lt!337743 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337746 () SeekEntryResult!7718)

(declare-fun b!758255 () Bool)

(declare-fun e!422749 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42009 (_ BitVec 32)) SeekEntryResult!7718)

(assert (=> b!758255 (= e!422749 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20118 a!3186) j!159) a!3186 mask!3328) lt!337746))))

(declare-fun b!758256 () Bool)

(declare-fun e!422746 () Bool)

(assert (=> b!758256 (= e!422746 e!422752)))

(declare-fun res!512941 () Bool)

(assert (=> b!758256 (=> (not res!512941) (not e!422752))))

(declare-fun lt!337752 () SeekEntryResult!7718)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758256 (= res!512941 (or (= lt!337752 (MissingZero!7718 i!1173)) (= lt!337752 (MissingVacant!7718 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!758256 (= lt!337752 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!758257 () Bool)

(declare-fun e!422748 () Bool)

(declare-fun e!422745 () Bool)

(assert (=> b!758257 (= e!422748 (not e!422745))))

(declare-fun res!512951 () Bool)

(assert (=> b!758257 (=> res!512951 e!422745)))

(declare-fun lt!337744 () SeekEntryResult!7718)

(assert (=> b!758257 (= res!512951 (or (not (is-Intermediate!7718 lt!337744)) (bvslt x!1131 (x!64132 lt!337744)) (not (= x!1131 (x!64132 lt!337744))) (not (= index!1321 (index!33242 lt!337744)))))))

(declare-fun e!422747 () Bool)

(assert (=> b!758257 e!422747))

(declare-fun res!512955 () Bool)

(assert (=> b!758257 (=> (not res!512955) (not e!422747))))

(declare-fun lt!337750 () SeekEntryResult!7718)

(assert (=> b!758257 (= res!512955 (= lt!337740 lt!337750))))

(assert (=> b!758257 (= lt!337750 (Found!7718 j!159))))

(assert (=> b!758257 (= lt!337740 (seekEntryOrOpen!0 (select (arr!20118 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42009 (_ BitVec 32)) Bool)

(assert (=> b!758257 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337742 () Unit!26252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42009 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26252)

(assert (=> b!758257 (= lt!337742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758258 () Bool)

(declare-fun e!422743 () Bool)

(assert (=> b!758258 (= e!422743 e!422748)))

(declare-fun res!512956 () Bool)

(assert (=> b!758258 (=> (not res!512956) (not e!422748))))

(declare-fun lt!337753 () SeekEntryResult!7718)

(assert (=> b!758258 (= res!512956 (= lt!337753 lt!337744))))

(assert (=> b!758258 (= lt!337744 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337749 lt!337745 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758258 (= lt!337753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337749 mask!3328) lt!337749 lt!337745 mask!3328))))

(assert (=> b!758258 (= lt!337749 (select (store (arr!20118 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!758258 (= lt!337745 (array!42010 (store (arr!20118 a!3186) i!1173 k!2102) (size!20539 a!3186)))))

(declare-fun b!758259 () Bool)

(declare-fun Unit!26254 () Unit!26252)

(assert (=> b!758259 (= e!422744 Unit!26254)))

(assert (=> b!758259 false))

(declare-fun b!758260 () Bool)

(declare-fun e!422751 () Bool)

(assert (=> b!758260 (= e!422751 e!422753)))

(declare-fun res!512942 () Bool)

(assert (=> b!758260 (=> res!512942 e!422753)))

(assert (=> b!758260 (= res!512942 (= lt!337743 lt!337749))))

(assert (=> b!758260 (= lt!337743 (select (store (arr!20118 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!758261 () Bool)

(assert (=> b!758261 (= e!422749 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20118 a!3186) j!159) a!3186 mask!3328) (Found!7718 j!159)))))

(declare-fun b!758262 () Bool)

(declare-fun res!512940 () Bool)

(assert (=> b!758262 (=> (not res!512940) (not e!422743))))

(assert (=> b!758262 (= res!512940 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20118 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758263 () Bool)

(declare-fun res!512953 () Bool)

(assert (=> b!758263 (=> (not res!512953) (not e!422752))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758263 (= res!512953 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20539 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20539 a!3186))))))

(declare-fun b!758264 () Bool)

(declare-fun res!512944 () Bool)

(assert (=> b!758264 (=> (not res!512944) (not e!422746))))

(assert (=> b!758264 (= res!512944 (and (= (size!20539 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20539 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20539 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758265 () Bool)

(declare-fun res!512954 () Bool)

(assert (=> b!758265 (=> (not res!512954) (not e!422746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758265 (= res!512954 (validKeyInArray!0 k!2102))))

(declare-fun res!512950 () Bool)

(assert (=> start!65836 (=> (not res!512950) (not e!422746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65836 (= res!512950 (validMask!0 mask!3328))))

(assert (=> start!65836 e!422746))

(assert (=> start!65836 true))

(declare-fun array_inv!15914 (array!42009) Bool)

(assert (=> start!65836 (array_inv!15914 a!3186)))

(declare-fun b!758266 () Bool)

(declare-fun res!512947 () Bool)

(assert (=> b!758266 (=> (not res!512947) (not e!422746))))

(assert (=> b!758266 (= res!512947 (validKeyInArray!0 (select (arr!20118 a!3186) j!159)))))

(declare-fun b!758267 () Bool)

(declare-fun res!512957 () Bool)

(assert (=> b!758267 (=> (not res!512957) (not e!422743))))

(assert (=> b!758267 (= res!512957 e!422749)))

(declare-fun c!83037 () Bool)

(assert (=> b!758267 (= c!83037 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758268 () Bool)

(assert (=> b!758268 (= e!422745 e!422751)))

(declare-fun res!512949 () Bool)

(assert (=> b!758268 (=> res!512949 e!422751)))

(assert (=> b!758268 (= res!512949 (not (= lt!337754 lt!337750)))))

(assert (=> b!758268 (= lt!337754 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20118 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758269 () Bool)

(declare-fun Unit!26255 () Unit!26252)

(assert (=> b!758269 (= e!422744 Unit!26255)))

(declare-fun b!758270 () Bool)

(declare-fun res!512943 () Bool)

(assert (=> b!758270 (=> (not res!512943) (not e!422752))))

(assert (=> b!758270 (= res!512943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758271 () Bool)

(assert (=> b!758271 (= e!422742 true)))

(assert (=> b!758271 (= lt!337747 lt!337754)))

(declare-fun lt!337748 () Unit!26252)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26252)

(assert (=> b!758271 (= lt!337748 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758272 () Bool)

(declare-fun res!512948 () Bool)

(assert (=> b!758272 (=> (not res!512948) (not e!422746))))

(declare-fun arrayContainsKey!0 (array!42009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758272 (= res!512948 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758273 () Bool)

(assert (=> b!758273 (= e!422752 e!422743)))

(declare-fun res!512946 () Bool)

(assert (=> b!758273 (=> (not res!512946) (not e!422743))))

(assert (=> b!758273 (= res!512946 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20118 a!3186) j!159) mask!3328) (select (arr!20118 a!3186) j!159) a!3186 mask!3328) lt!337746))))

(assert (=> b!758273 (= lt!337746 (Intermediate!7718 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758274 () Bool)

(assert (=> b!758274 (= e!422747 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20118 a!3186) j!159) a!3186 mask!3328) lt!337750))))

(assert (= (and start!65836 res!512950) b!758264))

(assert (= (and b!758264 res!512944) b!758266))

(assert (= (and b!758266 res!512947) b!758265))

(assert (= (and b!758265 res!512954) b!758272))

(assert (= (and b!758272 res!512948) b!758256))

(assert (= (and b!758256 res!512941) b!758270))

(assert (= (and b!758270 res!512943) b!758253))

(assert (= (and b!758253 res!512952) b!758263))

(assert (= (and b!758263 res!512953) b!758273))

(assert (= (and b!758273 res!512946) b!758262))

(assert (= (and b!758262 res!512940) b!758267))

(assert (= (and b!758267 c!83037) b!758255))

(assert (= (and b!758267 (not c!83037)) b!758261))

(assert (= (and b!758267 res!512957) b!758258))

(assert (= (and b!758258 res!512956) b!758257))

(assert (= (and b!758257 res!512955) b!758274))

(assert (= (and b!758257 (not res!512951)) b!758268))

(assert (= (and b!758268 (not res!512949)) b!758260))

(assert (= (and b!758260 (not res!512942)) b!758254))

(assert (= (and b!758254 c!83038) b!758259))

(assert (= (and b!758254 (not c!83038)) b!758269))

(assert (= (and b!758254 (not res!512945)) b!758271))

(declare-fun m!705763 () Bool)

(assert (=> b!758273 m!705763))

(assert (=> b!758273 m!705763))

(declare-fun m!705765 () Bool)

(assert (=> b!758273 m!705765))

(assert (=> b!758273 m!705765))

(assert (=> b!758273 m!705763))

(declare-fun m!705767 () Bool)

(assert (=> b!758273 m!705767))

(declare-fun m!705769 () Bool)

(assert (=> b!758254 m!705769))

(declare-fun m!705771 () Bool)

(assert (=> b!758254 m!705771))

(declare-fun m!705773 () Bool)

(assert (=> b!758254 m!705773))

(declare-fun m!705775 () Bool)

(assert (=> b!758256 m!705775))

(declare-fun m!705777 () Bool)

(assert (=> b!758260 m!705777))

(declare-fun m!705779 () Bool)

(assert (=> b!758260 m!705779))

(assert (=> b!758261 m!705763))

(assert (=> b!758261 m!705763))

(declare-fun m!705781 () Bool)

(assert (=> b!758261 m!705781))

(declare-fun m!705783 () Bool)

(assert (=> b!758262 m!705783))

(declare-fun m!705785 () Bool)

(assert (=> start!65836 m!705785))

(declare-fun m!705787 () Bool)

(assert (=> start!65836 m!705787))

(assert (=> b!758274 m!705763))

(assert (=> b!758274 m!705763))

(declare-fun m!705789 () Bool)

(assert (=> b!758274 m!705789))

(assert (=> b!758268 m!705763))

(assert (=> b!758268 m!705763))

(assert (=> b!758268 m!705781))

(declare-fun m!705791 () Bool)

(assert (=> b!758272 m!705791))

(assert (=> b!758257 m!705763))

(assert (=> b!758257 m!705763))

(declare-fun m!705793 () Bool)

(assert (=> b!758257 m!705793))

(declare-fun m!705795 () Bool)

(assert (=> b!758257 m!705795))

(declare-fun m!705797 () Bool)

(assert (=> b!758257 m!705797))

(declare-fun m!705799 () Bool)

(assert (=> b!758270 m!705799))

(declare-fun m!705801 () Bool)

(assert (=> b!758271 m!705801))

(assert (=> b!758255 m!705763))

(assert (=> b!758255 m!705763))

(declare-fun m!705803 () Bool)

(assert (=> b!758255 m!705803))

(assert (=> b!758266 m!705763))

(assert (=> b!758266 m!705763))

(declare-fun m!705805 () Bool)

(assert (=> b!758266 m!705805))

(declare-fun m!705807 () Bool)

(assert (=> b!758265 m!705807))

(declare-fun m!705809 () Bool)

(assert (=> b!758253 m!705809))

(declare-fun m!705811 () Bool)

(assert (=> b!758258 m!705811))

(declare-fun m!705813 () Bool)

(assert (=> b!758258 m!705813))

(declare-fun m!705815 () Bool)

(assert (=> b!758258 m!705815))

(assert (=> b!758258 m!705811))

(assert (=> b!758258 m!705777))

(declare-fun m!705817 () Bool)

(assert (=> b!758258 m!705817))

(push 1)

