; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64274 () Bool)

(assert start!64274)

(declare-fun b!721931 () Bool)

(declare-fun e!404684 () Bool)

(declare-fun e!404685 () Bool)

(assert (=> b!721931 (= e!404684 e!404685)))

(declare-fun res!483826 () Bool)

(assert (=> b!721931 (=> (not res!483826) (not e!404685))))

(declare-datatypes ((SeekEntryResult!7156 0))(
  ( (MissingZero!7156 (index!30992 (_ BitVec 32))) (Found!7156 (index!30993 (_ BitVec 32))) (Intermediate!7156 (undefined!7968 Bool) (index!30994 (_ BitVec 32)) (x!62008 (_ BitVec 32))) (Undefined!7156) (MissingVacant!7156 (index!30995 (_ BitVec 32))) )
))
(declare-fun lt!319987 () SeekEntryResult!7156)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721931 (= res!483826 (or (= lt!319987 (MissingZero!7156 i!1173)) (= lt!319987 (MissingVacant!7156 i!1173))))))

(declare-datatypes ((array!40872 0))(
  ( (array!40873 (arr!19559 (Array (_ BitVec 32) (_ BitVec 64))) (size!19980 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40872)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40872 (_ BitVec 32)) SeekEntryResult!7156)

(assert (=> b!721931 (= lt!319987 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721932 () Bool)

(declare-fun res!483819 () Bool)

(assert (=> b!721932 (=> (not res!483819) (not e!404684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721932 (= res!483819 (validKeyInArray!0 k0!2102))))

(declare-fun b!721933 () Bool)

(declare-fun e!404682 () Bool)

(declare-fun lt!319986 () SeekEntryResult!7156)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40872 (_ BitVec 32)) SeekEntryResult!7156)

(assert (=> b!721933 (= e!404682 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19559 a!3186) j!159) a!3186 mask!3328) lt!319986)))))

(declare-fun b!721935 () Bool)

(declare-fun res!483818 () Bool)

(assert (=> b!721935 (=> (not res!483818) (not e!404684))))

(assert (=> b!721935 (= res!483818 (validKeyInArray!0 (select (arr!19559 a!3186) j!159)))))

(declare-fun b!721936 () Bool)

(declare-fun res!483828 () Bool)

(declare-fun e!404683 () Bool)

(assert (=> b!721936 (=> (not res!483828) (not e!404683))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!721936 (= res!483828 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19559 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721937 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40872 (_ BitVec 32)) SeekEntryResult!7156)

(assert (=> b!721937 (= e!404682 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19559 a!3186) j!159) a!3186 mask!3328) (Found!7156 j!159))))))

(declare-fun b!721938 () Bool)

(declare-fun res!483824 () Bool)

(assert (=> b!721938 (=> (not res!483824) (not e!404684))))

(assert (=> b!721938 (= res!483824 (and (= (size!19980 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19980 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19980 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721939 () Bool)

(declare-fun res!483822 () Bool)

(assert (=> b!721939 (=> (not res!483822) (not e!404684))))

(declare-fun arrayContainsKey!0 (array!40872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721939 (= res!483822 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721940 () Bool)

(declare-fun res!483825 () Bool)

(assert (=> b!721940 (=> (not res!483825) (not e!404685))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721940 (= res!483825 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19980 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19980 a!3186))))))

(declare-fun b!721941 () Bool)

(declare-fun res!483823 () Bool)

(assert (=> b!721941 (=> (not res!483823) (not e!404685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40872 (_ BitVec 32)) Bool)

(assert (=> b!721941 (= res!483823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721942 () Bool)

(assert (=> b!721942 (= e!404683 false)))

(declare-fun lt!319988 () Bool)

(assert (=> b!721942 (= lt!319988 e!404682)))

(declare-fun c!79428 () Bool)

(assert (=> b!721942 (= c!79428 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721943 () Bool)

(declare-fun res!483821 () Bool)

(assert (=> b!721943 (=> (not res!483821) (not e!404685))))

(declare-datatypes ((List!13600 0))(
  ( (Nil!13597) (Cons!13596 (h!14650 (_ BitVec 64)) (t!19906 List!13600)) )
))
(declare-fun arrayNoDuplicates!0 (array!40872 (_ BitVec 32) List!13600) Bool)

(assert (=> b!721943 (= res!483821 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13597))))

(declare-fun b!721934 () Bool)

(assert (=> b!721934 (= e!404685 e!404683)))

(declare-fun res!483820 () Bool)

(assert (=> b!721934 (=> (not res!483820) (not e!404683))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721934 (= res!483820 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19559 a!3186) j!159) mask!3328) (select (arr!19559 a!3186) j!159) a!3186 mask!3328) lt!319986))))

(assert (=> b!721934 (= lt!319986 (Intermediate!7156 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!483827 () Bool)

(assert (=> start!64274 (=> (not res!483827) (not e!404684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64274 (= res!483827 (validMask!0 mask!3328))))

(assert (=> start!64274 e!404684))

(assert (=> start!64274 true))

(declare-fun array_inv!15442 (array!40872) Bool)

(assert (=> start!64274 (array_inv!15442 a!3186)))

(assert (= (and start!64274 res!483827) b!721938))

(assert (= (and b!721938 res!483824) b!721935))

(assert (= (and b!721935 res!483818) b!721932))

(assert (= (and b!721932 res!483819) b!721939))

(assert (= (and b!721939 res!483822) b!721931))

(assert (= (and b!721931 res!483826) b!721941))

(assert (= (and b!721941 res!483823) b!721943))

(assert (= (and b!721943 res!483821) b!721940))

(assert (= (and b!721940 res!483825) b!721934))

(assert (= (and b!721934 res!483820) b!721936))

(assert (= (and b!721936 res!483828) b!721942))

(assert (= (and b!721942 c!79428) b!721933))

(assert (= (and b!721942 (not c!79428)) b!721937))

(declare-fun m!676019 () Bool)

(assert (=> b!721934 m!676019))

(assert (=> b!721934 m!676019))

(declare-fun m!676021 () Bool)

(assert (=> b!721934 m!676021))

(assert (=> b!721934 m!676021))

(assert (=> b!721934 m!676019))

(declare-fun m!676023 () Bool)

(assert (=> b!721934 m!676023))

(declare-fun m!676025 () Bool)

(assert (=> b!721941 m!676025))

(assert (=> b!721937 m!676019))

(assert (=> b!721937 m!676019))

(declare-fun m!676027 () Bool)

(assert (=> b!721937 m!676027))

(assert (=> b!721933 m!676019))

(assert (=> b!721933 m!676019))

(declare-fun m!676029 () Bool)

(assert (=> b!721933 m!676029))

(declare-fun m!676031 () Bool)

(assert (=> b!721931 m!676031))

(assert (=> b!721935 m!676019))

(assert (=> b!721935 m!676019))

(declare-fun m!676033 () Bool)

(assert (=> b!721935 m!676033))

(declare-fun m!676035 () Bool)

(assert (=> b!721932 m!676035))

(declare-fun m!676037 () Bool)

(assert (=> b!721939 m!676037))

(declare-fun m!676039 () Bool)

(assert (=> b!721943 m!676039))

(declare-fun m!676041 () Bool)

(assert (=> b!721936 m!676041))

(declare-fun m!676043 () Bool)

(assert (=> start!64274 m!676043))

(declare-fun m!676045 () Bool)

(assert (=> start!64274 m!676045))

(check-sat (not b!721941) (not b!721933) (not b!721939) (not b!721935) (not start!64274) (not b!721943) (not b!721931) (not b!721937) (not b!721932) (not b!721934))
(check-sat)
