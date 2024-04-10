; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66758 () Bool)

(assert start!66758)

(declare-fun b!769136 () Bool)

(declare-fun e!428308 () Bool)

(declare-fun e!428303 () Bool)

(assert (=> b!769136 (= e!428308 e!428303)))

(declare-fun res!520123 () Bool)

(assert (=> b!769136 (=> (not res!520123) (not e!428303))))

(declare-datatypes ((SeekEntryResult!7860 0))(
  ( (MissingZero!7860 (index!33808 (_ BitVec 32))) (Found!7860 (index!33809 (_ BitVec 32))) (Intermediate!7860 (undefined!8672 Bool) (index!33810 (_ BitVec 32)) (x!64743 (_ BitVec 32))) (Undefined!7860) (MissingVacant!7860 (index!33811 (_ BitVec 32))) )
))
(declare-fun lt!342184 () SeekEntryResult!7860)

(declare-fun lt!342181 () SeekEntryResult!7860)

(assert (=> b!769136 (= res!520123 (= lt!342184 lt!342181))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42320 0))(
  ( (array!42321 (arr!20260 (Array (_ BitVec 32) (_ BitVec 64))) (size!20681 (_ BitVec 32))) )
))
(declare-fun lt!342179 () array!42320)

(declare-fun lt!342185 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42320 (_ BitVec 32)) SeekEntryResult!7860)

(assert (=> b!769136 (= lt!342181 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342185 lt!342179 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769136 (= lt!342184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342185 mask!3328) lt!342185 lt!342179 mask!3328))))

(declare-fun a!3186 () array!42320)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!769136 (= lt!342185 (select (store (arr!20260 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769136 (= lt!342179 (array!42321 (store (arr!20260 a!3186) i!1173 k0!2102) (size!20681 a!3186)))))

(declare-fun b!769137 () Bool)

(declare-fun res!520118 () Bool)

(declare-fun e!428300 () Bool)

(assert (=> b!769137 (=> (not res!520118) (not e!428300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769137 (= res!520118 (validKeyInArray!0 k0!2102))))

(declare-fun b!769138 () Bool)

(declare-datatypes ((Unit!26454 0))(
  ( (Unit!26455) )
))
(declare-fun e!428302 () Unit!26454)

(declare-fun Unit!26456 () Unit!26454)

(assert (=> b!769138 (= e!428302 Unit!26456)))

(declare-fun lt!342178 () (_ BitVec 32))

(declare-fun lt!342182 () SeekEntryResult!7860)

(assert (=> b!769138 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342178 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) lt!342182)))

(declare-fun e!428301 () Bool)

(declare-fun b!769139 () Bool)

(assert (=> b!769139 (= e!428301 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) lt!342182))))

(declare-fun b!769140 () Bool)

(declare-fun e!428304 () Bool)

(assert (=> b!769140 (= e!428304 true)))

(declare-fun lt!342187 () Unit!26454)

(assert (=> b!769140 (= lt!342187 e!428302)))

(declare-fun c!84910 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769140 (= c!84910 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769140 (= lt!342178 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769141 () Bool)

(assert (=> b!769141 (= e!428303 (not e!428304))))

(declare-fun res!520112 () Bool)

(assert (=> b!769141 (=> res!520112 e!428304)))

(get-info :version)

(assert (=> b!769141 (= res!520112 (or (not ((_ is Intermediate!7860) lt!342181)) (bvsge x!1131 (x!64743 lt!342181))))))

(declare-fun e!428305 () Bool)

(assert (=> b!769141 e!428305))

(declare-fun res!520109 () Bool)

(assert (=> b!769141 (=> (not res!520109) (not e!428305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42320 (_ BitVec 32)) Bool)

(assert (=> b!769141 (= res!520109 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342180 () Unit!26454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26454)

(assert (=> b!769141 (= lt!342180 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769142 () Bool)

(declare-fun res!520113 () Bool)

(assert (=> b!769142 (=> (not res!520113) (not e!428308))))

(assert (=> b!769142 (= res!520113 e!428301)))

(declare-fun c!84909 () Bool)

(assert (=> b!769142 (= c!84909 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769143 () Bool)

(declare-fun res!520121 () Bool)

(assert (=> b!769143 (=> (not res!520121) (not e!428300))))

(assert (=> b!769143 (= res!520121 (validKeyInArray!0 (select (arr!20260 a!3186) j!159)))))

(declare-fun b!769144 () Bool)

(declare-fun e!428309 () Bool)

(assert (=> b!769144 (= e!428305 e!428309)))

(declare-fun res!520124 () Bool)

(assert (=> b!769144 (=> (not res!520124) (not e!428309))))

(declare-fun lt!342188 () SeekEntryResult!7860)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42320 (_ BitVec 32)) SeekEntryResult!7860)

(assert (=> b!769144 (= res!520124 (= (seekEntryOrOpen!0 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) lt!342188))))

(assert (=> b!769144 (= lt!342188 (Found!7860 j!159))))

(declare-fun b!769145 () Bool)

(declare-fun Unit!26457 () Unit!26454)

(assert (=> b!769145 (= e!428302 Unit!26457)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!342183 () SeekEntryResult!7860)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42320 (_ BitVec 32)) SeekEntryResult!7860)

(assert (=> b!769145 (= lt!342183 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20260 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769145 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342178 resIntermediateIndex!5 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) (Found!7860 j!159))))

(declare-fun b!769146 () Bool)

(declare-fun e!428306 () Bool)

(assert (=> b!769146 (= e!428306 e!428308)))

(declare-fun res!520120 () Bool)

(assert (=> b!769146 (=> (not res!520120) (not e!428308))))

(assert (=> b!769146 (= res!520120 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20260 a!3186) j!159) mask!3328) (select (arr!20260 a!3186) j!159) a!3186 mask!3328) lt!342182))))

(assert (=> b!769146 (= lt!342182 (Intermediate!7860 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769147 () Bool)

(declare-fun res!520122 () Bool)

(assert (=> b!769147 (=> (not res!520122) (not e!428300))))

(assert (=> b!769147 (= res!520122 (and (= (size!20681 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20681 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20681 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769148 () Bool)

(declare-fun res!520110 () Bool)

(assert (=> b!769148 (=> (not res!520110) (not e!428306))))

(assert (=> b!769148 (= res!520110 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20681 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20681 a!3186))))))

(declare-fun b!769149 () Bool)

(declare-fun res!520111 () Bool)

(assert (=> b!769149 (=> (not res!520111) (not e!428306))))

(declare-datatypes ((List!14262 0))(
  ( (Nil!14259) (Cons!14258 (h!15357 (_ BitVec 64)) (t!20577 List!14262)) )
))
(declare-fun arrayNoDuplicates!0 (array!42320 (_ BitVec 32) List!14262) Bool)

(assert (=> b!769149 (= res!520111 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14259))))

(declare-fun b!769150 () Bool)

(assert (=> b!769150 (= e!428300 e!428306)))

(declare-fun res!520117 () Bool)

(assert (=> b!769150 (=> (not res!520117) (not e!428306))))

(declare-fun lt!342186 () SeekEntryResult!7860)

(assert (=> b!769150 (= res!520117 (or (= lt!342186 (MissingZero!7860 i!1173)) (= lt!342186 (MissingVacant!7860 i!1173))))))

(assert (=> b!769150 (= lt!342186 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769151 () Bool)

(declare-fun res!520114 () Bool)

(assert (=> b!769151 (=> (not res!520114) (not e!428306))))

(assert (=> b!769151 (= res!520114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!520119 () Bool)

(assert (=> start!66758 (=> (not res!520119) (not e!428300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66758 (= res!520119 (validMask!0 mask!3328))))

(assert (=> start!66758 e!428300))

(assert (=> start!66758 true))

(declare-fun array_inv!16056 (array!42320) Bool)

(assert (=> start!66758 (array_inv!16056 a!3186)))

(declare-fun b!769152 () Bool)

(assert (=> b!769152 (= e!428309 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) lt!342188))))

(declare-fun b!769153 () Bool)

(declare-fun res!520116 () Bool)

(assert (=> b!769153 (=> (not res!520116) (not e!428308))))

(assert (=> b!769153 (= res!520116 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20260 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769154 () Bool)

(declare-fun res!520115 () Bool)

(assert (=> b!769154 (=> (not res!520115) (not e!428300))))

(declare-fun arrayContainsKey!0 (array!42320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769154 (= res!520115 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769155 () Bool)

(assert (=> b!769155 (= e!428301 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20260 a!3186) j!159) a!3186 mask!3328) (Found!7860 j!159)))))

(assert (= (and start!66758 res!520119) b!769147))

(assert (= (and b!769147 res!520122) b!769143))

(assert (= (and b!769143 res!520121) b!769137))

(assert (= (and b!769137 res!520118) b!769154))

(assert (= (and b!769154 res!520115) b!769150))

(assert (= (and b!769150 res!520117) b!769151))

(assert (= (and b!769151 res!520114) b!769149))

(assert (= (and b!769149 res!520111) b!769148))

(assert (= (and b!769148 res!520110) b!769146))

(assert (= (and b!769146 res!520120) b!769153))

(assert (= (and b!769153 res!520116) b!769142))

(assert (= (and b!769142 c!84909) b!769139))

(assert (= (and b!769142 (not c!84909)) b!769155))

(assert (= (and b!769142 res!520113) b!769136))

(assert (= (and b!769136 res!520123) b!769141))

(assert (= (and b!769141 res!520109) b!769144))

(assert (= (and b!769144 res!520124) b!769152))

(assert (= (and b!769141 (not res!520112)) b!769140))

(assert (= (and b!769140 c!84910) b!769138))

(assert (= (and b!769140 (not c!84910)) b!769145))

(declare-fun m!714591 () Bool)

(assert (=> b!769140 m!714591))

(declare-fun m!714593 () Bool)

(assert (=> b!769154 m!714593))

(declare-fun m!714595 () Bool)

(assert (=> b!769143 m!714595))

(assert (=> b!769143 m!714595))

(declare-fun m!714597 () Bool)

(assert (=> b!769143 m!714597))

(declare-fun m!714599 () Bool)

(assert (=> b!769149 m!714599))

(assert (=> b!769146 m!714595))

(assert (=> b!769146 m!714595))

(declare-fun m!714601 () Bool)

(assert (=> b!769146 m!714601))

(assert (=> b!769146 m!714601))

(assert (=> b!769146 m!714595))

(declare-fun m!714603 () Bool)

(assert (=> b!769146 m!714603))

(declare-fun m!714605 () Bool)

(assert (=> b!769141 m!714605))

(declare-fun m!714607 () Bool)

(assert (=> b!769141 m!714607))

(assert (=> b!769155 m!714595))

(assert (=> b!769155 m!714595))

(declare-fun m!714609 () Bool)

(assert (=> b!769155 m!714609))

(declare-fun m!714611 () Bool)

(assert (=> b!769153 m!714611))

(declare-fun m!714613 () Bool)

(assert (=> b!769137 m!714613))

(declare-fun m!714615 () Bool)

(assert (=> b!769136 m!714615))

(declare-fun m!714617 () Bool)

(assert (=> b!769136 m!714617))

(declare-fun m!714619 () Bool)

(assert (=> b!769136 m!714619))

(declare-fun m!714621 () Bool)

(assert (=> b!769136 m!714621))

(declare-fun m!714623 () Bool)

(assert (=> b!769136 m!714623))

(assert (=> b!769136 m!714615))

(declare-fun m!714625 () Bool)

(assert (=> start!66758 m!714625))

(declare-fun m!714627 () Bool)

(assert (=> start!66758 m!714627))

(declare-fun m!714629 () Bool)

(assert (=> b!769150 m!714629))

(assert (=> b!769139 m!714595))

(assert (=> b!769139 m!714595))

(declare-fun m!714631 () Bool)

(assert (=> b!769139 m!714631))

(assert (=> b!769138 m!714595))

(assert (=> b!769138 m!714595))

(declare-fun m!714633 () Bool)

(assert (=> b!769138 m!714633))

(assert (=> b!769152 m!714595))

(assert (=> b!769152 m!714595))

(declare-fun m!714635 () Bool)

(assert (=> b!769152 m!714635))

(assert (=> b!769144 m!714595))

(assert (=> b!769144 m!714595))

(declare-fun m!714637 () Bool)

(assert (=> b!769144 m!714637))

(assert (=> b!769145 m!714595))

(assert (=> b!769145 m!714595))

(assert (=> b!769145 m!714609))

(assert (=> b!769145 m!714595))

(declare-fun m!714639 () Bool)

(assert (=> b!769145 m!714639))

(declare-fun m!714641 () Bool)

(assert (=> b!769151 m!714641))

(check-sat (not b!769144) (not b!769149) (not b!769141) (not b!769145) (not b!769154) (not b!769140) (not start!66758) (not b!769151) (not b!769155) (not b!769136) (not b!769150) (not b!769143) (not b!769152) (not b!769137) (not b!769146) (not b!769139) (not b!769138))
(check-sat)
