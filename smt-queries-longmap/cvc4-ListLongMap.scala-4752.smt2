; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65576 () Bool)

(assert start!65576)

(declare-fun b!749385 () Bool)

(declare-fun e!418165 () Bool)

(assert (=> b!749385 (= e!418165 true)))

(declare-fun e!418163 () Bool)

(assert (=> b!749385 e!418163))

(declare-fun res!505632 () Bool)

(assert (=> b!749385 (=> (not res!505632) (not e!418163))))

(declare-fun lt!333156 () (_ BitVec 64))

(assert (=> b!749385 (= res!505632 (= lt!333156 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25732 0))(
  ( (Unit!25733) )
))
(declare-fun lt!333158 () Unit!25732)

(declare-fun e!418170 () Unit!25732)

(assert (=> b!749385 (= lt!333158 e!418170)))

(declare-fun c!82258 () Bool)

(assert (=> b!749385 (= c!82258 (= lt!333156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749386 () Bool)

(declare-fun res!505640 () Bool)

(declare-fun e!418162 () Bool)

(assert (=> b!749386 (=> res!505640 e!418162)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41749 0))(
  ( (array!41750 (arr!19988 (Array (_ BitVec 32) (_ BitVec 64))) (size!20409 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41749)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7588 0))(
  ( (MissingZero!7588 (index!32720 (_ BitVec 32))) (Found!7588 (index!32721 (_ BitVec 32))) (Intermediate!7588 (undefined!8400 Bool) (index!32722 (_ BitVec 32)) (x!63650 (_ BitVec 32))) (Undefined!7588) (MissingVacant!7588 (index!32723 (_ BitVec 32))) )
))
(declare-fun lt!333163 () SeekEntryResult!7588)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41749 (_ BitVec 32)) SeekEntryResult!7588)

(assert (=> b!749386 (= res!505640 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19988 a!3186) j!159) a!3186 mask!3328) lt!333163)))))

(declare-fun b!749387 () Bool)

(declare-fun Unit!25734 () Unit!25732)

(assert (=> b!749387 (= e!418170 Unit!25734)))

(declare-fun b!749388 () Bool)

(declare-fun e!418169 () Bool)

(declare-fun e!418171 () Bool)

(assert (=> b!749388 (= e!418169 e!418171)))

(declare-fun res!505638 () Bool)

(assert (=> b!749388 (=> (not res!505638) (not e!418171))))

(declare-fun lt!333159 () SeekEntryResult!7588)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749388 (= res!505638 (or (= lt!333159 (MissingZero!7588 i!1173)) (= lt!333159 (MissingVacant!7588 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41749 (_ BitVec 32)) SeekEntryResult!7588)

(assert (=> b!749388 (= lt!333159 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!749389 () Bool)

(declare-fun res!505642 () Bool)

(declare-fun e!418172 () Bool)

(assert (=> b!749389 (=> (not res!505642) (not e!418172))))

(assert (=> b!749389 (= res!505642 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19988 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749390 () Bool)

(declare-fun res!505643 () Bool)

(assert (=> b!749390 (=> (not res!505643) (not e!418172))))

(declare-fun e!418166 () Bool)

(assert (=> b!749390 (= res!505643 e!418166)))

(declare-fun c!82257 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749390 (= c!82257 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749391 () Bool)

(declare-fun res!505647 () Bool)

(assert (=> b!749391 (=> (not res!505647) (not e!418169))))

(assert (=> b!749391 (= res!505647 (and (= (size!20409 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20409 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20409 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749392 () Bool)

(declare-fun res!505637 () Bool)

(assert (=> b!749392 (=> (not res!505637) (not e!418171))))

(assert (=> b!749392 (= res!505637 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20409 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20409 a!3186))))))

(declare-fun b!749393 () Bool)

(declare-fun Unit!25735 () Unit!25732)

(assert (=> b!749393 (= e!418170 Unit!25735)))

(assert (=> b!749393 false))

(declare-fun b!749394 () Bool)

(declare-fun res!505636 () Bool)

(assert (=> b!749394 (=> (not res!505636) (not e!418171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41749 (_ BitVec 32)) Bool)

(assert (=> b!749394 (= res!505636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749395 () Bool)

(declare-fun res!505639 () Bool)

(assert (=> b!749395 (=> (not res!505639) (not e!418169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749395 (= res!505639 (validKeyInArray!0 (select (arr!19988 a!3186) j!159)))))

(declare-fun b!749396 () Bool)

(declare-fun res!505648 () Bool)

(assert (=> b!749396 (=> (not res!505648) (not e!418169))))

(assert (=> b!749396 (= res!505648 (validKeyInArray!0 k!2102))))

(declare-fun b!749397 () Bool)

(declare-fun e!418168 () Bool)

(assert (=> b!749397 (= e!418172 e!418168)))

(declare-fun res!505635 () Bool)

(assert (=> b!749397 (=> (not res!505635) (not e!418168))))

(declare-fun lt!333154 () SeekEntryResult!7588)

(declare-fun lt!333162 () SeekEntryResult!7588)

(assert (=> b!749397 (= res!505635 (= lt!333154 lt!333162))))

(declare-fun lt!333155 () array!41749)

(declare-fun lt!333161 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41749 (_ BitVec 32)) SeekEntryResult!7588)

(assert (=> b!749397 (= lt!333162 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333161 lt!333155 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749397 (= lt!333154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333161 mask!3328) lt!333161 lt!333155 mask!3328))))

(assert (=> b!749397 (= lt!333161 (select (store (arr!19988 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!749397 (= lt!333155 (array!41750 (store (arr!19988 a!3186) i!1173 k!2102) (size!20409 a!3186)))))

(declare-fun b!749398 () Bool)

(declare-fun res!505644 () Bool)

(assert (=> b!749398 (=> (not res!505644) (not e!418169))))

(declare-fun arrayContainsKey!0 (array!41749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749398 (= res!505644 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749399 () Bool)

(assert (=> b!749399 (= e!418166 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19988 a!3186) j!159) a!3186 mask!3328) (Found!7588 j!159)))))

(declare-fun e!418164 () Bool)

(declare-fun b!749400 () Bool)

(assert (=> b!749400 (= e!418164 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19988 a!3186) j!159) a!3186 mask!3328) lt!333163))))

(declare-fun res!505646 () Bool)

(assert (=> start!65576 (=> (not res!505646) (not e!418169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65576 (= res!505646 (validMask!0 mask!3328))))

(assert (=> start!65576 e!418169))

(assert (=> start!65576 true))

(declare-fun array_inv!15784 (array!41749) Bool)

(assert (=> start!65576 (array_inv!15784 a!3186)))

(declare-fun b!749401 () Bool)

(assert (=> b!749401 (= e!418162 e!418165)))

(declare-fun res!505633 () Bool)

(assert (=> b!749401 (=> res!505633 e!418165)))

(assert (=> b!749401 (= res!505633 (= lt!333156 lt!333161))))

(assert (=> b!749401 (= lt!333156 (select (store (arr!19988 a!3186) i!1173 k!2102) index!1321))))

(declare-fun lt!333164 () SeekEntryResult!7588)

(declare-fun b!749402 () Bool)

(assert (=> b!749402 (= e!418166 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19988 a!3186) j!159) a!3186 mask!3328) lt!333164))))

(declare-fun b!749403 () Bool)

(declare-fun res!505649 () Bool)

(assert (=> b!749403 (=> (not res!505649) (not e!418171))))

(declare-datatypes ((List!13990 0))(
  ( (Nil!13987) (Cons!13986 (h!15058 (_ BitVec 64)) (t!20305 List!13990)) )
))
(declare-fun arrayNoDuplicates!0 (array!41749 (_ BitVec 32) List!13990) Bool)

(assert (=> b!749403 (= res!505649 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13987))))

(declare-fun b!749404 () Bool)

(assert (=> b!749404 (= e!418163 (= (seekEntryOrOpen!0 lt!333161 lt!333155 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333161 lt!333155 mask!3328)))))

(declare-fun b!749405 () Bool)

(assert (=> b!749405 (= e!418168 (not e!418162))))

(declare-fun res!505641 () Bool)

(assert (=> b!749405 (=> res!505641 e!418162)))

(assert (=> b!749405 (= res!505641 (or (not (is-Intermediate!7588 lt!333162)) (bvslt x!1131 (x!63650 lt!333162)) (not (= x!1131 (x!63650 lt!333162))) (not (= index!1321 (index!32722 lt!333162)))))))

(assert (=> b!749405 e!418164))

(declare-fun res!505645 () Bool)

(assert (=> b!749405 (=> (not res!505645) (not e!418164))))

(declare-fun lt!333160 () SeekEntryResult!7588)

(assert (=> b!749405 (= res!505645 (= lt!333160 lt!333163))))

(assert (=> b!749405 (= lt!333163 (Found!7588 j!159))))

(assert (=> b!749405 (= lt!333160 (seekEntryOrOpen!0 (select (arr!19988 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!749405 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333157 () Unit!25732)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25732)

(assert (=> b!749405 (= lt!333157 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749406 () Bool)

(assert (=> b!749406 (= e!418171 e!418172)))

(declare-fun res!505634 () Bool)

(assert (=> b!749406 (=> (not res!505634) (not e!418172))))

(assert (=> b!749406 (= res!505634 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19988 a!3186) j!159) mask!3328) (select (arr!19988 a!3186) j!159) a!3186 mask!3328) lt!333164))))

(assert (=> b!749406 (= lt!333164 (Intermediate!7588 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65576 res!505646) b!749391))

(assert (= (and b!749391 res!505647) b!749395))

(assert (= (and b!749395 res!505639) b!749396))

(assert (= (and b!749396 res!505648) b!749398))

(assert (= (and b!749398 res!505644) b!749388))

(assert (= (and b!749388 res!505638) b!749394))

(assert (= (and b!749394 res!505636) b!749403))

(assert (= (and b!749403 res!505649) b!749392))

(assert (= (and b!749392 res!505637) b!749406))

(assert (= (and b!749406 res!505634) b!749389))

(assert (= (and b!749389 res!505642) b!749390))

(assert (= (and b!749390 c!82257) b!749402))

(assert (= (and b!749390 (not c!82257)) b!749399))

(assert (= (and b!749390 res!505643) b!749397))

(assert (= (and b!749397 res!505635) b!749405))

(assert (= (and b!749405 res!505645) b!749400))

(assert (= (and b!749405 (not res!505641)) b!749386))

(assert (= (and b!749386 (not res!505640)) b!749401))

(assert (= (and b!749401 (not res!505633)) b!749385))

(assert (= (and b!749385 c!82258) b!749393))

(assert (= (and b!749385 (not c!82258)) b!749387))

(assert (= (and b!749385 res!505632) b!749404))

(declare-fun m!699003 () Bool)

(assert (=> b!749403 m!699003))

(declare-fun m!699005 () Bool)

(assert (=> b!749389 m!699005))

(declare-fun m!699007 () Bool)

(assert (=> b!749406 m!699007))

(assert (=> b!749406 m!699007))

(declare-fun m!699009 () Bool)

(assert (=> b!749406 m!699009))

(assert (=> b!749406 m!699009))

(assert (=> b!749406 m!699007))

(declare-fun m!699011 () Bool)

(assert (=> b!749406 m!699011))

(declare-fun m!699013 () Bool)

(assert (=> b!749404 m!699013))

(declare-fun m!699015 () Bool)

(assert (=> b!749404 m!699015))

(declare-fun m!699017 () Bool)

(assert (=> start!65576 m!699017))

(declare-fun m!699019 () Bool)

(assert (=> start!65576 m!699019))

(assert (=> b!749402 m!699007))

(assert (=> b!749402 m!699007))

(declare-fun m!699021 () Bool)

(assert (=> b!749402 m!699021))

(declare-fun m!699023 () Bool)

(assert (=> b!749401 m!699023))

(declare-fun m!699025 () Bool)

(assert (=> b!749401 m!699025))

(assert (=> b!749400 m!699007))

(assert (=> b!749400 m!699007))

(declare-fun m!699027 () Bool)

(assert (=> b!749400 m!699027))

(declare-fun m!699029 () Bool)

(assert (=> b!749394 m!699029))

(declare-fun m!699031 () Bool)

(assert (=> b!749397 m!699031))

(assert (=> b!749397 m!699023))

(declare-fun m!699033 () Bool)

(assert (=> b!749397 m!699033))

(declare-fun m!699035 () Bool)

(assert (=> b!749397 m!699035))

(assert (=> b!749397 m!699031))

(declare-fun m!699037 () Bool)

(assert (=> b!749397 m!699037))

(declare-fun m!699039 () Bool)

(assert (=> b!749388 m!699039))

(assert (=> b!749395 m!699007))

(assert (=> b!749395 m!699007))

(declare-fun m!699041 () Bool)

(assert (=> b!749395 m!699041))

(assert (=> b!749386 m!699007))

(assert (=> b!749386 m!699007))

(declare-fun m!699043 () Bool)

(assert (=> b!749386 m!699043))

(declare-fun m!699045 () Bool)

(assert (=> b!749396 m!699045))

(assert (=> b!749399 m!699007))

(assert (=> b!749399 m!699007))

(assert (=> b!749399 m!699043))

(assert (=> b!749405 m!699007))

(assert (=> b!749405 m!699007))

(declare-fun m!699047 () Bool)

(assert (=> b!749405 m!699047))

(declare-fun m!699049 () Bool)

(assert (=> b!749405 m!699049))

(declare-fun m!699051 () Bool)

(assert (=> b!749405 m!699051))

(declare-fun m!699053 () Bool)

(assert (=> b!749398 m!699053))

(push 1)

