; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65852 () Bool)

(assert start!65852)

(declare-fun b!758781 () Bool)

(declare-fun res!513377 () Bool)

(declare-fun e!423039 () Bool)

(assert (=> b!758781 (=> (not res!513377) (not e!423039))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42025 0))(
  ( (array!42026 (arr!20126 (Array (_ BitVec 32) (_ BitVec 64))) (size!20547 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42025)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758781 (= res!513377 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20547 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20547 a!3186))))))

(declare-fun b!758782 () Bool)

(declare-fun res!513385 () Bool)

(declare-fun e!423030 () Bool)

(assert (=> b!758782 (=> (not res!513385) (not e!423030))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758782 (= res!513385 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20126 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758783 () Bool)

(declare-fun e!423035 () Bool)

(assert (=> b!758783 (= e!423030 e!423035)))

(declare-fun res!513383 () Bool)

(assert (=> b!758783 (=> (not res!513383) (not e!423035))))

(declare-datatypes ((SeekEntryResult!7726 0))(
  ( (MissingZero!7726 (index!33272 (_ BitVec 32))) (Found!7726 (index!33273 (_ BitVec 32))) (Intermediate!7726 (undefined!8538 Bool) (index!33274 (_ BitVec 32)) (x!64156 (_ BitVec 32))) (Undefined!7726) (MissingVacant!7726 (index!33275 (_ BitVec 32))) )
))
(declare-fun lt!338106 () SeekEntryResult!7726)

(declare-fun lt!338110 () SeekEntryResult!7726)

(assert (=> b!758783 (= res!513383 (= lt!338106 lt!338110))))

(declare-fun lt!338103 () (_ BitVec 64))

(declare-fun lt!338111 () array!42025)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42025 (_ BitVec 32)) SeekEntryResult!7726)

(assert (=> b!758783 (= lt!338110 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338103 lt!338111 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758783 (= lt!338106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338103 mask!3328) lt!338103 lt!338111 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!758783 (= lt!338103 (select (store (arr!20126 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!758783 (= lt!338111 (array!42026 (store (arr!20126 a!3186) i!1173 k!2102) (size!20547 a!3186)))))

(declare-fun b!758784 () Bool)

(declare-fun res!513386 () Bool)

(declare-fun e!423040 () Bool)

(assert (=> b!758784 (=> (not res!513386) (not e!423040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758784 (= res!513386 (validKeyInArray!0 k!2102))))

(declare-fun b!758785 () Bool)

(declare-fun e!423034 () Bool)

(declare-fun e!423033 () Bool)

(assert (=> b!758785 (= e!423034 e!423033)))

(declare-fun res!513382 () Bool)

(assert (=> b!758785 (=> res!513382 e!423033)))

(declare-fun lt!338114 () (_ BitVec 64))

(assert (=> b!758785 (= res!513382 (= lt!338114 lt!338103))))

(assert (=> b!758785 (= lt!338114 (select (store (arr!20126 a!3186) i!1173 k!2102) index!1321))))

(declare-fun e!423036 () Bool)

(declare-fun b!758786 () Bool)

(declare-fun lt!338108 () SeekEntryResult!7726)

(assert (=> b!758786 (= e!423036 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20126 a!3186) j!159) a!3186 mask!3328) lt!338108))))

(declare-fun b!758787 () Bool)

(declare-fun e!423038 () Bool)

(assert (=> b!758787 (= e!423035 (not e!423038))))

(declare-fun res!513372 () Bool)

(assert (=> b!758787 (=> res!513372 e!423038)))

(assert (=> b!758787 (= res!513372 (or (not (is-Intermediate!7726 lt!338110)) (bvslt x!1131 (x!64156 lt!338110)) (not (= x!1131 (x!64156 lt!338110))) (not (= index!1321 (index!33274 lt!338110)))))))

(declare-fun e!423041 () Bool)

(assert (=> b!758787 e!423041))

(declare-fun res!513387 () Bool)

(assert (=> b!758787 (=> (not res!513387) (not e!423041))))

(declare-fun lt!338112 () SeekEntryResult!7726)

(declare-fun lt!338109 () SeekEntryResult!7726)

(assert (=> b!758787 (= res!513387 (= lt!338112 lt!338109))))

(assert (=> b!758787 (= lt!338109 (Found!7726 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42025 (_ BitVec 32)) SeekEntryResult!7726)

(assert (=> b!758787 (= lt!338112 (seekEntryOrOpen!0 (select (arr!20126 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42025 (_ BitVec 32)) Bool)

(assert (=> b!758787 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26284 0))(
  ( (Unit!26285) )
))
(declare-fun lt!338104 () Unit!26284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42025 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26284)

(assert (=> b!758787 (= lt!338104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758788 () Bool)

(declare-fun e!423031 () Bool)

(assert (=> b!758788 (= e!423033 e!423031)))

(declare-fun res!513389 () Bool)

(assert (=> b!758788 (=> res!513389 e!423031)))

(assert (=> b!758788 (= res!513389 (or (not (= (select (arr!20126 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!338101 () SeekEntryResult!7726)

(declare-fun lt!338105 () SeekEntryResult!7726)

(declare-fun lt!338102 () SeekEntryResult!7726)

(assert (=> b!758788 (and (= lt!338102 lt!338105) (= lt!338112 lt!338101))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42025 (_ BitVec 32)) SeekEntryResult!7726)

(assert (=> b!758788 (= lt!338105 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!338103 lt!338111 mask!3328))))

(assert (=> b!758788 (= lt!338102 (seekEntryOrOpen!0 lt!338103 lt!338111 mask!3328))))

(assert (=> b!758788 (= lt!338114 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!338107 () Unit!26284)

(declare-fun e!423037 () Unit!26284)

(assert (=> b!758788 (= lt!338107 e!423037)))

(declare-fun c!83086 () Bool)

(assert (=> b!758788 (= c!83086 (= lt!338114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758789 () Bool)

(assert (=> b!758789 (= e!423038 e!423034)))

(declare-fun res!513374 () Bool)

(assert (=> b!758789 (=> res!513374 e!423034)))

(assert (=> b!758789 (= res!513374 (not (= lt!338101 lt!338109)))))

(assert (=> b!758789 (= lt!338101 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20126 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758790 () Bool)

(declare-fun res!513380 () Bool)

(assert (=> b!758790 (=> (not res!513380) (not e!423040))))

(assert (=> b!758790 (= res!513380 (validKeyInArray!0 (select (arr!20126 a!3186) j!159)))))

(declare-fun res!513379 () Bool)

(assert (=> start!65852 (=> (not res!513379) (not e!423040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65852 (= res!513379 (validMask!0 mask!3328))))

(assert (=> start!65852 e!423040))

(assert (=> start!65852 true))

(declare-fun array_inv!15922 (array!42025) Bool)

(assert (=> start!65852 (array_inv!15922 a!3186)))

(declare-fun b!758791 () Bool)

(declare-fun res!513378 () Bool)

(assert (=> b!758791 (=> (not res!513378) (not e!423039))))

(declare-datatypes ((List!14128 0))(
  ( (Nil!14125) (Cons!14124 (h!15196 (_ BitVec 64)) (t!20443 List!14128)) )
))
(declare-fun arrayNoDuplicates!0 (array!42025 (_ BitVec 32) List!14128) Bool)

(assert (=> b!758791 (= res!513378 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14125))))

(declare-fun b!758792 () Bool)

(declare-fun Unit!26286 () Unit!26284)

(assert (=> b!758792 (= e!423037 Unit!26286)))

(assert (=> b!758792 false))

(declare-fun b!758793 () Bool)

(declare-fun res!513373 () Bool)

(assert (=> b!758793 (=> (not res!513373) (not e!423040))))

(declare-fun arrayContainsKey!0 (array!42025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758793 (= res!513373 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758794 () Bool)

(assert (=> b!758794 (= e!423040 e!423039)))

(declare-fun res!513375 () Bool)

(assert (=> b!758794 (=> (not res!513375) (not e!423039))))

(declare-fun lt!338113 () SeekEntryResult!7726)

(assert (=> b!758794 (= res!513375 (or (= lt!338113 (MissingZero!7726 i!1173)) (= lt!338113 (MissingVacant!7726 i!1173))))))

(assert (=> b!758794 (= lt!338113 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!758795 () Bool)

(assert (=> b!758795 (= e!423036 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20126 a!3186) j!159) a!3186 mask!3328) (Found!7726 j!159)))))

(declare-fun b!758796 () Bool)

(assert (=> b!758796 (= e!423039 e!423030)))

(declare-fun res!513388 () Bool)

(assert (=> b!758796 (=> (not res!513388) (not e!423030))))

(assert (=> b!758796 (= res!513388 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20126 a!3186) j!159) mask!3328) (select (arr!20126 a!3186) j!159) a!3186 mask!3328) lt!338108))))

(assert (=> b!758796 (= lt!338108 (Intermediate!7726 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758797 () Bool)

(declare-fun res!513376 () Bool)

(assert (=> b!758797 (=> (not res!513376) (not e!423040))))

(assert (=> b!758797 (= res!513376 (and (= (size!20547 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20547 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20547 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758798 () Bool)

(assert (=> b!758798 (= e!423041 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20126 a!3186) j!159) a!3186 mask!3328) lt!338109))))

(declare-fun b!758799 () Bool)

(assert (=> b!758799 (= e!423031 true)))

(assert (=> b!758799 (= lt!338105 lt!338101)))

(declare-fun lt!338100 () Unit!26284)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26284)

(assert (=> b!758799 (= lt!338100 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758800 () Bool)

(declare-fun Unit!26287 () Unit!26284)

(assert (=> b!758800 (= e!423037 Unit!26287)))

(declare-fun b!758801 () Bool)

(declare-fun res!513384 () Bool)

(assert (=> b!758801 (=> (not res!513384) (not e!423039))))

(assert (=> b!758801 (= res!513384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758802 () Bool)

(declare-fun res!513381 () Bool)

(assert (=> b!758802 (=> (not res!513381) (not e!423030))))

(assert (=> b!758802 (= res!513381 e!423036)))

(declare-fun c!83085 () Bool)

(assert (=> b!758802 (= c!83085 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65852 res!513379) b!758797))

(assert (= (and b!758797 res!513376) b!758790))

(assert (= (and b!758790 res!513380) b!758784))

(assert (= (and b!758784 res!513386) b!758793))

(assert (= (and b!758793 res!513373) b!758794))

(assert (= (and b!758794 res!513375) b!758801))

(assert (= (and b!758801 res!513384) b!758791))

(assert (= (and b!758791 res!513378) b!758781))

(assert (= (and b!758781 res!513377) b!758796))

(assert (= (and b!758796 res!513388) b!758782))

(assert (= (and b!758782 res!513385) b!758802))

(assert (= (and b!758802 c!83085) b!758786))

(assert (= (and b!758802 (not c!83085)) b!758795))

(assert (= (and b!758802 res!513381) b!758783))

(assert (= (and b!758783 res!513383) b!758787))

(assert (= (and b!758787 res!513387) b!758798))

(assert (= (and b!758787 (not res!513372)) b!758789))

(assert (= (and b!758789 (not res!513374)) b!758785))

(assert (= (and b!758785 (not res!513382)) b!758788))

(assert (= (and b!758788 c!83086) b!758792))

(assert (= (and b!758788 (not c!83086)) b!758800))

(assert (= (and b!758788 (not res!513389)) b!758799))

(declare-fun m!706211 () Bool)

(assert (=> b!758785 m!706211))

(declare-fun m!706213 () Bool)

(assert (=> b!758785 m!706213))

(declare-fun m!706215 () Bool)

(assert (=> b!758799 m!706215))

(declare-fun m!706217 () Bool)

(assert (=> b!758782 m!706217))

(declare-fun m!706219 () Bool)

(assert (=> b!758784 m!706219))

(declare-fun m!706221 () Bool)

(assert (=> b!758793 m!706221))

(declare-fun m!706223 () Bool)

(assert (=> b!758783 m!706223))

(declare-fun m!706225 () Bool)

(assert (=> b!758783 m!706225))

(declare-fun m!706227 () Bool)

(assert (=> b!758783 m!706227))

(assert (=> b!758783 m!706211))

(declare-fun m!706229 () Bool)

(assert (=> b!758783 m!706229))

(assert (=> b!758783 m!706223))

(declare-fun m!706231 () Bool)

(assert (=> b!758788 m!706231))

(declare-fun m!706233 () Bool)

(assert (=> b!758788 m!706233))

(declare-fun m!706235 () Bool)

(assert (=> b!758788 m!706235))

(declare-fun m!706237 () Bool)

(assert (=> b!758796 m!706237))

(assert (=> b!758796 m!706237))

(declare-fun m!706239 () Bool)

(assert (=> b!758796 m!706239))

(assert (=> b!758796 m!706239))

(assert (=> b!758796 m!706237))

(declare-fun m!706241 () Bool)

(assert (=> b!758796 m!706241))

(assert (=> b!758789 m!706237))

(assert (=> b!758789 m!706237))

(declare-fun m!706243 () Bool)

(assert (=> b!758789 m!706243))

(declare-fun m!706245 () Bool)

(assert (=> b!758801 m!706245))

(assert (=> b!758786 m!706237))

(assert (=> b!758786 m!706237))

(declare-fun m!706247 () Bool)

(assert (=> b!758786 m!706247))

(declare-fun m!706249 () Bool)

(assert (=> b!758791 m!706249))

(assert (=> b!758790 m!706237))

(assert (=> b!758790 m!706237))

(declare-fun m!706251 () Bool)

(assert (=> b!758790 m!706251))

(assert (=> b!758787 m!706237))

(assert (=> b!758787 m!706237))

(declare-fun m!706253 () Bool)

(assert (=> b!758787 m!706253))

(declare-fun m!706255 () Bool)

(assert (=> b!758787 m!706255))

(declare-fun m!706257 () Bool)

(assert (=> b!758787 m!706257))

(assert (=> b!758798 m!706237))

(assert (=> b!758798 m!706237))

(declare-fun m!706259 () Bool)

(assert (=> b!758798 m!706259))

(declare-fun m!706261 () Bool)

(assert (=> b!758794 m!706261))

(assert (=> b!758795 m!706237))

(assert (=> b!758795 m!706237))

(assert (=> b!758795 m!706243))

(declare-fun m!706263 () Bool)

(assert (=> start!65852 m!706263))

(declare-fun m!706265 () Bool)

(assert (=> start!65852 m!706265))

(push 1)

