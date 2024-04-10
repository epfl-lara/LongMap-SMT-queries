; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65866 () Bool)

(assert start!65866)

(declare-fun b!759197 () Bool)

(declare-fun res!513736 () Bool)

(declare-fun e!423249 () Bool)

(assert (=> b!759197 (=> (not res!513736) (not e!423249))))

(declare-datatypes ((array!42039 0))(
  ( (array!42040 (arr!20133 (Array (_ BitVec 32) (_ BitVec 64))) (size!20554 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42039)

(declare-datatypes ((List!14135 0))(
  ( (Nil!14132) (Cons!14131 (h!15203 (_ BitVec 64)) (t!20450 List!14135)) )
))
(declare-fun arrayNoDuplicates!0 (array!42039 (_ BitVec 32) List!14135) Bool)

(assert (=> b!759197 (= res!513736 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14132))))

(declare-fun b!759198 () Bool)

(declare-fun res!513729 () Bool)

(declare-fun e!423254 () Bool)

(assert (=> b!759198 (=> (not res!513729) (not e!423254))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759198 (= res!513729 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20133 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759199 () Bool)

(declare-fun res!513730 () Bool)

(declare-fun e!423252 () Bool)

(assert (=> b!759199 (=> (not res!513730) (not e!423252))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759199 (= res!513730 (validKeyInArray!0 (select (arr!20133 a!3186) j!159)))))

(declare-fun b!759200 () Bool)

(declare-fun res!513738 () Bool)

(assert (=> b!759200 (=> (not res!513738) (not e!423254))))

(declare-fun e!423248 () Bool)

(assert (=> b!759200 (= res!513738 e!423248)))

(declare-fun c!83116 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759200 (= c!83116 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759201 () Bool)

(declare-fun res!513731 () Bool)

(assert (=> b!759201 (=> (not res!513731) (not e!423249))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!759201 (= res!513731 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20554 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20554 a!3186))))))

(declare-fun b!759202 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7733 0))(
  ( (MissingZero!7733 (index!33300 (_ BitVec 32))) (Found!7733 (index!33301 (_ BitVec 32))) (Intermediate!7733 (undefined!8545 Bool) (index!33302 (_ BitVec 32)) (x!64187 (_ BitVec 32))) (Undefined!7733) (MissingVacant!7733 (index!33303 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42039 (_ BitVec 32)) SeekEntryResult!7733)

(assert (=> b!759202 (= e!423248 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20133 a!3186) j!159) a!3186 mask!3328) (Found!7733 j!159)))))

(declare-fun b!759203 () Bool)

(declare-fun res!513737 () Bool)

(assert (=> b!759203 (=> (not res!513737) (not e!423249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42039 (_ BitVec 32)) Bool)

(assert (=> b!759203 (= res!513737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759204 () Bool)

(assert (=> b!759204 (= e!423249 e!423254)))

(declare-fun res!513734 () Bool)

(assert (=> b!759204 (=> (not res!513734) (not e!423254))))

(declare-fun lt!338317 () SeekEntryResult!7733)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42039 (_ BitVec 32)) SeekEntryResult!7733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759204 (= res!513734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20133 a!3186) j!159) mask!3328) (select (arr!20133 a!3186) j!159) a!3186 mask!3328) lt!338317))))

(assert (=> b!759204 (= lt!338317 (Intermediate!7733 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759205 () Bool)

(assert (=> b!759205 (= e!423252 e!423249)))

(declare-fun res!513740 () Bool)

(assert (=> b!759205 (=> (not res!513740) (not e!423249))))

(declare-fun lt!338319 () SeekEntryResult!7733)

(assert (=> b!759205 (= res!513740 (or (= lt!338319 (MissingZero!7733 i!1173)) (= lt!338319 (MissingVacant!7733 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42039 (_ BitVec 32)) SeekEntryResult!7733)

(assert (=> b!759205 (= lt!338319 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!338318 () SeekEntryResult!7733)

(declare-fun e!423250 () Bool)

(declare-fun b!759206 () Bool)

(assert (=> b!759206 (= e!423250 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20133 a!3186) j!159) a!3186 mask!3328) lt!338318))))

(declare-fun b!759207 () Bool)

(declare-fun e!423251 () Bool)

(assert (=> b!759207 (= e!423251 e!423250)))

(declare-fun res!513726 () Bool)

(assert (=> b!759207 (=> (not res!513726) (not e!423250))))

(assert (=> b!759207 (= res!513726 (= (seekEntryOrOpen!0 (select (arr!20133 a!3186) j!159) a!3186 mask!3328) lt!338318))))

(assert (=> b!759207 (= lt!338318 (Found!7733 j!159))))

(declare-fun b!759208 () Bool)

(declare-fun res!513732 () Bool)

(assert (=> b!759208 (=> (not res!513732) (not e!423252))))

(assert (=> b!759208 (= res!513732 (and (= (size!20554 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20554 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20554 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759209 () Bool)

(declare-fun e!423247 () Bool)

(assert (=> b!759209 (= e!423247 (not true))))

(assert (=> b!759209 e!423251))

(declare-fun res!513728 () Bool)

(assert (=> b!759209 (=> (not res!513728) (not e!423251))))

(assert (=> b!759209 (= res!513728 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26306 0))(
  ( (Unit!26307) )
))
(declare-fun lt!338320 () Unit!26306)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26306)

(assert (=> b!759209 (= lt!338320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759210 () Bool)

(assert (=> b!759210 (= e!423248 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20133 a!3186) j!159) a!3186 mask!3328) lt!338317))))

(declare-fun res!513727 () Bool)

(assert (=> start!65866 (=> (not res!513727) (not e!423252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65866 (= res!513727 (validMask!0 mask!3328))))

(assert (=> start!65866 e!423252))

(assert (=> start!65866 true))

(declare-fun array_inv!15929 (array!42039) Bool)

(assert (=> start!65866 (array_inv!15929 a!3186)))

(declare-fun b!759211 () Bool)

(assert (=> b!759211 (= e!423254 e!423247)))

(declare-fun res!513739 () Bool)

(assert (=> b!759211 (=> (not res!513739) (not e!423247))))

(declare-fun lt!338316 () (_ BitVec 64))

(declare-fun lt!338321 () array!42039)

(assert (=> b!759211 (= res!513739 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338316 mask!3328) lt!338316 lt!338321 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338316 lt!338321 mask!3328)))))

(assert (=> b!759211 (= lt!338316 (select (store (arr!20133 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!759211 (= lt!338321 (array!42040 (store (arr!20133 a!3186) i!1173 k!2102) (size!20554 a!3186)))))

(declare-fun b!759212 () Bool)

(declare-fun res!513735 () Bool)

(assert (=> b!759212 (=> (not res!513735) (not e!423252))))

(assert (=> b!759212 (= res!513735 (validKeyInArray!0 k!2102))))

(declare-fun b!759213 () Bool)

(declare-fun res!513733 () Bool)

(assert (=> b!759213 (=> (not res!513733) (not e!423252))))

(declare-fun arrayContainsKey!0 (array!42039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759213 (= res!513733 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65866 res!513727) b!759208))

(assert (= (and b!759208 res!513732) b!759199))

(assert (= (and b!759199 res!513730) b!759212))

(assert (= (and b!759212 res!513735) b!759213))

(assert (= (and b!759213 res!513733) b!759205))

(assert (= (and b!759205 res!513740) b!759203))

(assert (= (and b!759203 res!513737) b!759197))

(assert (= (and b!759197 res!513736) b!759201))

(assert (= (and b!759201 res!513731) b!759204))

(assert (= (and b!759204 res!513734) b!759198))

(assert (= (and b!759198 res!513729) b!759200))

(assert (= (and b!759200 c!83116) b!759210))

(assert (= (and b!759200 (not c!83116)) b!759202))

(assert (= (and b!759200 res!513738) b!759211))

(assert (= (and b!759211 res!513739) b!759209))

(assert (= (and b!759209 res!513728) b!759207))

(assert (= (and b!759207 res!513726) b!759206))

(declare-fun m!706579 () Bool)

(assert (=> b!759212 m!706579))

(declare-fun m!706581 () Bool)

(assert (=> b!759206 m!706581))

(assert (=> b!759206 m!706581))

(declare-fun m!706583 () Bool)

(assert (=> b!759206 m!706583))

(assert (=> b!759210 m!706581))

(assert (=> b!759210 m!706581))

(declare-fun m!706585 () Bool)

(assert (=> b!759210 m!706585))

(declare-fun m!706587 () Bool)

(assert (=> b!759209 m!706587))

(declare-fun m!706589 () Bool)

(assert (=> b!759209 m!706589))

(declare-fun m!706591 () Bool)

(assert (=> b!759213 m!706591))

(declare-fun m!706593 () Bool)

(assert (=> b!759198 m!706593))

(declare-fun m!706595 () Bool)

(assert (=> b!759205 m!706595))

(assert (=> b!759204 m!706581))

(assert (=> b!759204 m!706581))

(declare-fun m!706597 () Bool)

(assert (=> b!759204 m!706597))

(assert (=> b!759204 m!706597))

(assert (=> b!759204 m!706581))

(declare-fun m!706599 () Bool)

(assert (=> b!759204 m!706599))

(declare-fun m!706601 () Bool)

(assert (=> start!65866 m!706601))

(declare-fun m!706603 () Bool)

(assert (=> start!65866 m!706603))

(declare-fun m!706605 () Bool)

(assert (=> b!759197 m!706605))

(assert (=> b!759207 m!706581))

(assert (=> b!759207 m!706581))

(declare-fun m!706607 () Bool)

(assert (=> b!759207 m!706607))

(declare-fun m!706609 () Bool)

(assert (=> b!759203 m!706609))

(declare-fun m!706611 () Bool)

(assert (=> b!759211 m!706611))

(declare-fun m!706613 () Bool)

(assert (=> b!759211 m!706613))

(declare-fun m!706615 () Bool)

(assert (=> b!759211 m!706615))

(declare-fun m!706617 () Bool)

(assert (=> b!759211 m!706617))

(declare-fun m!706619 () Bool)

(assert (=> b!759211 m!706619))

(assert (=> b!759211 m!706611))

(assert (=> b!759199 m!706581))

(assert (=> b!759199 m!706581))

(declare-fun m!706621 () Bool)

(assert (=> b!759199 m!706621))

(assert (=> b!759202 m!706581))

(assert (=> b!759202 m!706581))

(declare-fun m!706623 () Bool)

(assert (=> b!759202 m!706623))

(push 1)

