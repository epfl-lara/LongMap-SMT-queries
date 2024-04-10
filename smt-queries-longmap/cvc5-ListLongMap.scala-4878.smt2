; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67182 () Bool)

(assert start!67182)

(declare-fun b!776924 () Bool)

(declare-fun e!432308 () Bool)

(declare-fun e!432312 () Bool)

(assert (=> b!776924 (= e!432308 e!432312)))

(declare-fun res!525687 () Bool)

(assert (=> b!776924 (=> (not res!525687) (not e!432312))))

(declare-datatypes ((SeekEntryResult!7964 0))(
  ( (MissingZero!7964 (index!34224 (_ BitVec 32))) (Found!7964 (index!34225 (_ BitVec 32))) (Intermediate!7964 (undefined!8776 Bool) (index!34226 (_ BitVec 32)) (x!65163 (_ BitVec 32))) (Undefined!7964) (MissingVacant!7964 (index!34227 (_ BitVec 32))) )
))
(declare-fun lt!346162 () SeekEntryResult!7964)

(declare-fun lt!346161 () SeekEntryResult!7964)

(assert (=> b!776924 (= res!525687 (= lt!346162 lt!346161))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!346166 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42537 0))(
  ( (array!42538 (arr!20364 (Array (_ BitVec 32) (_ BitVec 64))) (size!20785 (_ BitVec 32))) )
))
(declare-fun lt!346160 () array!42537)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42537 (_ BitVec 32)) SeekEntryResult!7964)

(assert (=> b!776924 (= lt!346161 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346166 lt!346160 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776924 (= lt!346162 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346166 mask!3328) lt!346166 lt!346160 mask!3328))))

(declare-fun a!3186 () array!42537)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!776924 (= lt!346166 (select (store (arr!20364 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776924 (= lt!346160 (array!42538 (store (arr!20364 a!3186) i!1173 k!2102) (size!20785 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!432307 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!346163 () SeekEntryResult!7964)

(declare-fun b!776925 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42537 (_ BitVec 32)) SeekEntryResult!7964)

(assert (=> b!776925 (= e!432307 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20364 a!3186) j!159) a!3186 mask!3328) lt!346163))))

(declare-fun b!776926 () Bool)

(declare-fun e!432310 () Bool)

(assert (=> b!776926 (= e!432310 e!432308)))

(declare-fun res!525678 () Bool)

(assert (=> b!776926 (=> (not res!525678) (not e!432308))))

(declare-fun lt!346165 () SeekEntryResult!7964)

(assert (=> b!776926 (= res!525678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20364 a!3186) j!159) mask!3328) (select (arr!20364 a!3186) j!159) a!3186 mask!3328) lt!346165))))

(assert (=> b!776926 (= lt!346165 (Intermediate!7964 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776927 () Bool)

(declare-fun res!525673 () Bool)

(declare-fun e!432313 () Bool)

(assert (=> b!776927 (=> (not res!525673) (not e!432313))))

(assert (=> b!776927 (= res!525673 (and (= (size!20785 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20785 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20785 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776928 () Bool)

(declare-fun res!525677 () Bool)

(assert (=> b!776928 (=> (not res!525677) (not e!432310))))

(assert (=> b!776928 (= res!525677 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20785 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20785 a!3186))))))

(declare-fun b!776929 () Bool)

(declare-fun res!525683 () Bool)

(assert (=> b!776929 (=> (not res!525683) (not e!432308))))

(declare-fun e!432309 () Bool)

(assert (=> b!776929 (= res!525683 e!432309)))

(declare-fun c!86026 () Bool)

(assert (=> b!776929 (= c!86026 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776930 () Bool)

(assert (=> b!776930 (= e!432309 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20364 a!3186) j!159) a!3186 mask!3328) lt!346165))))

(declare-fun b!776931 () Bool)

(declare-fun res!525675 () Bool)

(assert (=> b!776931 (=> (not res!525675) (not e!432313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776931 (= res!525675 (validKeyInArray!0 (select (arr!20364 a!3186) j!159)))))

(declare-fun b!776932 () Bool)

(declare-fun e!432314 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42537 (_ BitVec 32)) SeekEntryResult!7964)

(assert (=> b!776932 (= e!432314 (= (seekEntryOrOpen!0 lt!346166 lt!346160 mask!3328) (Found!7964 index!1321)))))

(declare-fun b!776933 () Bool)

(assert (=> b!776933 (= e!432309 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20364 a!3186) j!159) a!3186 mask!3328) (Found!7964 j!159)))))

(declare-fun b!776935 () Bool)

(declare-fun res!525689 () Bool)

(assert (=> b!776935 (=> (not res!525689) (not e!432313))))

(declare-fun arrayContainsKey!0 (array!42537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776935 (= res!525689 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776936 () Bool)

(declare-fun res!525681 () Bool)

(assert (=> b!776936 (=> (not res!525681) (not e!432308))))

(assert (=> b!776936 (= res!525681 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20364 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776937 () Bool)

(assert (=> b!776937 (= e!432312 (not e!432314))))

(declare-fun res!525686 () Bool)

(assert (=> b!776937 (=> res!525686 e!432314)))

(assert (=> b!776937 (= res!525686 (or (not (is-Intermediate!7964 lt!346161)) (bvslt x!1131 (x!65163 lt!346161)) (not (= x!1131 (x!65163 lt!346161))) (not (= index!1321 (index!34226 lt!346161)))))))

(declare-fun e!432311 () Bool)

(assert (=> b!776937 e!432311))

(declare-fun res!525674 () Bool)

(assert (=> b!776937 (=> (not res!525674) (not e!432311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42537 (_ BitVec 32)) Bool)

(assert (=> b!776937 (= res!525674 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26822 0))(
  ( (Unit!26823) )
))
(declare-fun lt!346159 () Unit!26822)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26822)

(assert (=> b!776937 (= lt!346159 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776938 () Bool)

(declare-fun res!525685 () Bool)

(assert (=> b!776938 (=> (not res!525685) (not e!432310))))

(assert (=> b!776938 (= res!525685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776939 () Bool)

(declare-fun res!525676 () Bool)

(assert (=> b!776939 (=> res!525676 e!432314)))

(assert (=> b!776939 (= res!525676 (or (not (= (select (store (arr!20364 a!3186) i!1173 k!2102) index!1321) lt!346166)) (undefined!8776 lt!346161)))))

(declare-fun b!776940 () Bool)

(assert (=> b!776940 (= e!432311 e!432307)))

(declare-fun res!525684 () Bool)

(assert (=> b!776940 (=> (not res!525684) (not e!432307))))

(assert (=> b!776940 (= res!525684 (= (seekEntryOrOpen!0 (select (arr!20364 a!3186) j!159) a!3186 mask!3328) lt!346163))))

(assert (=> b!776940 (= lt!346163 (Found!7964 j!159))))

(declare-fun b!776941 () Bool)

(declare-fun res!525688 () Bool)

(assert (=> b!776941 (=> (not res!525688) (not e!432310))))

(declare-datatypes ((List!14366 0))(
  ( (Nil!14363) (Cons!14362 (h!15470 (_ BitVec 64)) (t!20681 List!14366)) )
))
(declare-fun arrayNoDuplicates!0 (array!42537 (_ BitVec 32) List!14366) Bool)

(assert (=> b!776941 (= res!525688 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14363))))

(declare-fun res!525680 () Bool)

(assert (=> start!67182 (=> (not res!525680) (not e!432313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67182 (= res!525680 (validMask!0 mask!3328))))

(assert (=> start!67182 e!432313))

(assert (=> start!67182 true))

(declare-fun array_inv!16160 (array!42537) Bool)

(assert (=> start!67182 (array_inv!16160 a!3186)))

(declare-fun b!776934 () Bool)

(declare-fun res!525679 () Bool)

(assert (=> b!776934 (=> (not res!525679) (not e!432313))))

(assert (=> b!776934 (= res!525679 (validKeyInArray!0 k!2102))))

(declare-fun b!776942 () Bool)

(declare-fun res!525682 () Bool)

(assert (=> b!776942 (=> res!525682 e!432314)))

(assert (=> b!776942 (= res!525682 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20364 a!3186) j!159) a!3186 mask!3328) (Found!7964 j!159))))))

(declare-fun b!776943 () Bool)

(assert (=> b!776943 (= e!432313 e!432310)))

(declare-fun res!525672 () Bool)

(assert (=> b!776943 (=> (not res!525672) (not e!432310))))

(declare-fun lt!346164 () SeekEntryResult!7964)

(assert (=> b!776943 (= res!525672 (or (= lt!346164 (MissingZero!7964 i!1173)) (= lt!346164 (MissingVacant!7964 i!1173))))))

(assert (=> b!776943 (= lt!346164 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!67182 res!525680) b!776927))

(assert (= (and b!776927 res!525673) b!776931))

(assert (= (and b!776931 res!525675) b!776934))

(assert (= (and b!776934 res!525679) b!776935))

(assert (= (and b!776935 res!525689) b!776943))

(assert (= (and b!776943 res!525672) b!776938))

(assert (= (and b!776938 res!525685) b!776941))

(assert (= (and b!776941 res!525688) b!776928))

(assert (= (and b!776928 res!525677) b!776926))

(assert (= (and b!776926 res!525678) b!776936))

(assert (= (and b!776936 res!525681) b!776929))

(assert (= (and b!776929 c!86026) b!776930))

(assert (= (and b!776929 (not c!86026)) b!776933))

(assert (= (and b!776929 res!525683) b!776924))

(assert (= (and b!776924 res!525687) b!776937))

(assert (= (and b!776937 res!525674) b!776940))

(assert (= (and b!776940 res!525684) b!776925))

(assert (= (and b!776937 (not res!525686)) b!776942))

(assert (= (and b!776942 (not res!525682)) b!776939))

(assert (= (and b!776939 (not res!525676)) b!776932))

(declare-fun m!720929 () Bool)

(assert (=> b!776936 m!720929))

(declare-fun m!720931 () Bool)

(assert (=> b!776931 m!720931))

(assert (=> b!776931 m!720931))

(declare-fun m!720933 () Bool)

(assert (=> b!776931 m!720933))

(assert (=> b!776942 m!720931))

(assert (=> b!776942 m!720931))

(declare-fun m!720935 () Bool)

(assert (=> b!776942 m!720935))

(declare-fun m!720937 () Bool)

(assert (=> b!776934 m!720937))

(declare-fun m!720939 () Bool)

(assert (=> b!776932 m!720939))

(assert (=> b!776925 m!720931))

(assert (=> b!776925 m!720931))

(declare-fun m!720941 () Bool)

(assert (=> b!776925 m!720941))

(assert (=> b!776940 m!720931))

(assert (=> b!776940 m!720931))

(declare-fun m!720943 () Bool)

(assert (=> b!776940 m!720943))

(declare-fun m!720945 () Bool)

(assert (=> b!776935 m!720945))

(assert (=> b!776930 m!720931))

(assert (=> b!776930 m!720931))

(declare-fun m!720947 () Bool)

(assert (=> b!776930 m!720947))

(assert (=> b!776926 m!720931))

(assert (=> b!776926 m!720931))

(declare-fun m!720949 () Bool)

(assert (=> b!776926 m!720949))

(assert (=> b!776926 m!720949))

(assert (=> b!776926 m!720931))

(declare-fun m!720951 () Bool)

(assert (=> b!776926 m!720951))

(declare-fun m!720953 () Bool)

(assert (=> b!776941 m!720953))

(declare-fun m!720955 () Bool)

(assert (=> b!776943 m!720955))

(declare-fun m!720957 () Bool)

(assert (=> b!776924 m!720957))

(declare-fun m!720959 () Bool)

(assert (=> b!776924 m!720959))

(assert (=> b!776924 m!720957))

(declare-fun m!720961 () Bool)

(assert (=> b!776924 m!720961))

(declare-fun m!720963 () Bool)

(assert (=> b!776924 m!720963))

(declare-fun m!720965 () Bool)

(assert (=> b!776924 m!720965))

(declare-fun m!720967 () Bool)

(assert (=> start!67182 m!720967))

(declare-fun m!720969 () Bool)

(assert (=> start!67182 m!720969))

(assert (=> b!776933 m!720931))

(assert (=> b!776933 m!720931))

(assert (=> b!776933 m!720935))

(assert (=> b!776939 m!720961))

(declare-fun m!720971 () Bool)

(assert (=> b!776939 m!720971))

(declare-fun m!720973 () Bool)

(assert (=> b!776938 m!720973))

(declare-fun m!720975 () Bool)

(assert (=> b!776937 m!720975))

(declare-fun m!720977 () Bool)

(assert (=> b!776937 m!720977))

(push 1)

(assert (not b!776933))

(assert (not b!776931))

(assert (not b!776926))

(assert (not b!776941))

(assert (not b!776930))

(assert (not b!776932))

(assert (not start!67182))

(assert (not b!776934))

(assert (not b!776938))

(assert (not b!776935))

(assert (not b!776925))

(assert (not b!776942))

(assert (not b!776924))

(assert (not b!776943))

(assert (not b!776937))

(assert (not b!776940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!777124 () Bool)

(declare-fun c!86058 () Bool)

(declare-fun lt!346245 () (_ BitVec 64))

(assert (=> b!777124 (= c!86058 (= lt!346245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432407 () SeekEntryResult!7964)

(declare-fun e!432405 () SeekEntryResult!7964)

(assert (=> b!777124 (= e!432407 e!432405)))

(declare-fun b!777125 () Bool)

(assert (=> b!777125 (= e!432407 (Found!7964 resIntermediateIndex!5))))

(declare-fun b!777127 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777127 (= e!432405 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20364 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777128 () Bool)

(declare-fun e!432406 () SeekEntryResult!7964)

(assert (=> b!777128 (= e!432406 e!432407)))

(declare-fun c!86059 () Bool)

(assert (=> b!777128 (= c!86059 (= lt!346245 (select (arr!20364 a!3186) j!159)))))

(declare-fun b!777129 () Bool)

(assert (=> b!777129 (= e!432405 (MissingVacant!7964 resIntermediateIndex!5))))

(declare-fun lt!346244 () SeekEntryResult!7964)

(declare-fun d!102147 () Bool)

(assert (=> d!102147 (and (or (is-Undefined!7964 lt!346244) (not (is-Found!7964 lt!346244)) (and (bvsge (index!34225 lt!346244) #b00000000000000000000000000000000) (bvslt (index!34225 lt!346244) (size!20785 a!3186)))) (or (is-Undefined!7964 lt!346244) (is-Found!7964 lt!346244) (not (is-MissingVacant!7964 lt!346244)) (not (= (index!34227 lt!346244) resIntermediateIndex!5)) (and (bvsge (index!34227 lt!346244) #b00000000000000000000000000000000) (bvslt (index!34227 lt!346244) (size!20785 a!3186)))) (or (is-Undefined!7964 lt!346244) (ite (is-Found!7964 lt!346244) (= (select (arr!20364 a!3186) (index!34225 lt!346244)) (select (arr!20364 a!3186) j!159)) (and (is-MissingVacant!7964 lt!346244) (= (index!34227 lt!346244) resIntermediateIndex!5) (= (select (arr!20364 a!3186) (index!34227 lt!346244)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102147 (= lt!346244 e!432406)))

(declare-fun c!86057 () Bool)

(assert (=> d!102147 (= c!86057 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102147 (= lt!346245 (select (arr!20364 a!3186) resIntermediateIndex!5))))

(assert (=> d!102147 (validMask!0 mask!3328)))

(assert (=> d!102147 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20364 a!3186) j!159) a!3186 mask!3328) lt!346244)))

(declare-fun b!777126 () Bool)

(assert (=> b!777126 (= e!432406 Undefined!7964)))

(assert (= (and d!102147 c!86057) b!777126))

(assert (= (and d!102147 (not c!86057)) b!777128))

(assert (= (and b!777128 c!86059) b!777125))

(assert (= (and b!777128 (not c!86059)) b!777124))

(assert (= (and b!777124 c!86058) b!777129))

(assert (= (and b!777124 (not c!86058)) b!777127))

(declare-fun m!721101 () Bool)

(assert (=> b!777127 m!721101))

(assert (=> b!777127 m!721101))

(assert (=> b!777127 m!720931))

(declare-fun m!721103 () Bool)

(assert (=> b!777127 m!721103))

(declare-fun m!721105 () Bool)

(assert (=> d!102147 m!721105))

(declare-fun m!721107 () Bool)

(assert (=> d!102147 m!721107))

(assert (=> d!102147 m!720929))

(assert (=> d!102147 m!720967))

(assert (=> b!776925 d!102147))

(declare-fun d!102155 () Bool)

(declare-fun res!525814 () Bool)

(declare-fun e!432418 () Bool)

(assert (=> d!102155 (=> res!525814 e!432418)))

(assert (=> d!102155 (= res!525814 (= (select (arr!20364 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!102155 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!432418)))

(declare-fun b!777146 () Bool)

(declare-fun e!432419 () Bool)

(assert (=> b!777146 (= e!432418 e!432419)))

(declare-fun res!525815 () Bool)

(assert (=> b!777146 (=> (not res!525815) (not e!432419))))

(assert (=> b!777146 (= res!525815 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20785 a!3186)))))

(declare-fun b!777147 () Bool)

(assert (=> b!777147 (= e!432419 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102155 (not res!525814)) b!777146))

(assert (= (and b!777146 res!525815) b!777147))

(declare-fun m!721121 () Bool)

(assert (=> d!102155 m!721121))

(declare-fun m!721125 () Bool)

(assert (=> b!777147 m!721125))

(assert (=> b!776935 d!102155))

(declare-fun b!777200 () Bool)

(declare-fun lt!346270 () SeekEntryResult!7964)

(assert (=> b!777200 (and (bvsge (index!34226 lt!346270) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346270) (size!20785 lt!346160)))))

(declare-fun res!525832 () Bool)

(assert (=> b!777200 (= res!525832 (= (select (arr!20364 lt!346160) (index!34226 lt!346270)) lt!346166))))

(declare-fun e!432454 () Bool)

(assert (=> b!777200 (=> res!525832 e!432454)))

(declare-fun e!432451 () Bool)

(assert (=> b!777200 (= e!432451 e!432454)))

(declare-fun b!777201 () Bool)

(declare-fun e!432453 () Bool)

(assert (=> b!777201 (= e!432453 (bvsge (x!65163 lt!346270) #b01111111111111111111111111111110))))

(declare-fun b!777202 () Bool)

(declare-fun e!432452 () SeekEntryResult!7964)

(declare-fun e!432455 () SeekEntryResult!7964)

(assert (=> b!777202 (= e!432452 e!432455)))

(declare-fun c!86086 () Bool)

(declare-fun lt!346271 () (_ BitVec 64))

(assert (=> b!777202 (= c!86086 (or (= lt!346271 lt!346166) (= (bvadd lt!346271 lt!346271) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102159 () Bool)

(assert (=> d!102159 e!432453))

(declare-fun c!86087 () Bool)

(assert (=> d!102159 (= c!86087 (and (is-Intermediate!7964 lt!346270) (undefined!8776 lt!346270)))))

(assert (=> d!102159 (= lt!346270 e!432452)))

(declare-fun c!86085 () Bool)

(assert (=> d!102159 (= c!86085 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102159 (= lt!346271 (select (arr!20364 lt!346160) index!1321))))

(assert (=> d!102159 (validMask!0 mask!3328)))

(assert (=> d!102159 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346166 lt!346160 mask!3328) lt!346270)))

(declare-fun b!777203 () Bool)

(assert (=> b!777203 (and (bvsge (index!34226 lt!346270) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346270) (size!20785 lt!346160)))))

(declare-fun res!525831 () Bool)

(assert (=> b!777203 (= res!525831 (= (select (arr!20364 lt!346160) (index!34226 lt!346270)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777203 (=> res!525831 e!432454)))

(declare-fun b!777204 () Bool)

(assert (=> b!777204 (= e!432453 e!432451)))

(declare-fun res!525830 () Bool)

(assert (=> b!777204 (= res!525830 (and (is-Intermediate!7964 lt!346270) (not (undefined!8776 lt!346270)) (bvslt (x!65163 lt!346270) #b01111111111111111111111111111110) (bvsge (x!65163 lt!346270) #b00000000000000000000000000000000) (bvsge (x!65163 lt!346270) x!1131)))))

(assert (=> b!777204 (=> (not res!525830) (not e!432451))))

(declare-fun b!777205 () Bool)

(assert (=> b!777205 (= e!432455 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!346166 lt!346160 mask!3328))))

(declare-fun b!777206 () Bool)

(assert (=> b!777206 (= e!432452 (Intermediate!7964 true index!1321 x!1131))))

(declare-fun b!777207 () Bool)

(assert (=> b!777207 (and (bvsge (index!34226 lt!346270) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346270) (size!20785 lt!346160)))))

(assert (=> b!777207 (= e!432454 (= (select (arr!20364 lt!346160) (index!34226 lt!346270)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777208 () Bool)

(assert (=> b!777208 (= e!432455 (Intermediate!7964 false index!1321 x!1131))))

(assert (= (and d!102159 c!86085) b!777206))

(assert (= (and d!102159 (not c!86085)) b!777202))

(assert (= (and b!777202 c!86086) b!777208))

(assert (= (and b!777202 (not c!86086)) b!777205))

(assert (= (and d!102159 c!86087) b!777201))

(assert (= (and d!102159 (not c!86087)) b!777204))

(assert (= (and b!777204 res!525830) b!777200))

(assert (= (and b!777200 (not res!525832)) b!777203))

(assert (= (and b!777203 (not res!525831)) b!777207))

(declare-fun m!721175 () Bool)

(assert (=> b!777207 m!721175))

(assert (=> b!777203 m!721175))

(assert (=> b!777200 m!721175))

(declare-fun m!721177 () Bool)

(assert (=> b!777205 m!721177))

(assert (=> b!777205 m!721177))

(declare-fun m!721179 () Bool)

(assert (=> b!777205 m!721179))

(declare-fun m!721181 () Bool)

(assert (=> d!102159 m!721181))

(assert (=> d!102159 m!720967))

(assert (=> b!776924 d!102159))

(declare-fun b!777215 () Bool)

(declare-fun lt!346278 () SeekEntryResult!7964)

(assert (=> b!777215 (and (bvsge (index!34226 lt!346278) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346278) (size!20785 lt!346160)))))

(declare-fun res!525837 () Bool)

(assert (=> b!777215 (= res!525837 (= (select (arr!20364 lt!346160) (index!34226 lt!346278)) lt!346166))))

(declare-fun e!432463 () Bool)

(assert (=> b!777215 (=> res!525837 e!432463)))

(declare-fun e!432460 () Bool)

(assert (=> b!777215 (= e!432460 e!432463)))

(declare-fun b!777216 () Bool)

(declare-fun e!432462 () Bool)

(assert (=> b!777216 (= e!432462 (bvsge (x!65163 lt!346278) #b01111111111111111111111111111110))))

(declare-fun b!777217 () Bool)

(declare-fun e!432461 () SeekEntryResult!7964)

(declare-fun e!432464 () SeekEntryResult!7964)

(assert (=> b!777217 (= e!432461 e!432464)))

(declare-fun c!86091 () Bool)

(declare-fun lt!346279 () (_ BitVec 64))

(assert (=> b!777217 (= c!86091 (or (= lt!346279 lt!346166) (= (bvadd lt!346279 lt!346279) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102179 () Bool)

(assert (=> d!102179 e!432462))

(declare-fun c!86092 () Bool)

(assert (=> d!102179 (= c!86092 (and (is-Intermediate!7964 lt!346278) (undefined!8776 lt!346278)))))

(assert (=> d!102179 (= lt!346278 e!432461)))

(declare-fun c!86090 () Bool)

(assert (=> d!102179 (= c!86090 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102179 (= lt!346279 (select (arr!20364 lt!346160) (toIndex!0 lt!346166 mask!3328)))))

(assert (=> d!102179 (validMask!0 mask!3328)))

(assert (=> d!102179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346166 mask!3328) lt!346166 lt!346160 mask!3328) lt!346278)))

(declare-fun b!777218 () Bool)

(assert (=> b!777218 (and (bvsge (index!34226 lt!346278) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346278) (size!20785 lt!346160)))))

(declare-fun res!525836 () Bool)

(assert (=> b!777218 (= res!525836 (= (select (arr!20364 lt!346160) (index!34226 lt!346278)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777218 (=> res!525836 e!432463)))

(declare-fun b!777219 () Bool)

(assert (=> b!777219 (= e!432462 e!432460)))

(declare-fun res!525835 () Bool)

(assert (=> b!777219 (= res!525835 (and (is-Intermediate!7964 lt!346278) (not (undefined!8776 lt!346278)) (bvslt (x!65163 lt!346278) #b01111111111111111111111111111110) (bvsge (x!65163 lt!346278) #b00000000000000000000000000000000) (bvsge (x!65163 lt!346278) #b00000000000000000000000000000000)))))

(assert (=> b!777219 (=> (not res!525835) (not e!432460))))

(declare-fun b!777220 () Bool)

(assert (=> b!777220 (= e!432464 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!346166 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!346166 lt!346160 mask!3328))))

(declare-fun b!777221 () Bool)

(assert (=> b!777221 (= e!432461 (Intermediate!7964 true (toIndex!0 lt!346166 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!777222 () Bool)

(assert (=> b!777222 (and (bvsge (index!34226 lt!346278) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346278) (size!20785 lt!346160)))))

(assert (=> b!777222 (= e!432463 (= (select (arr!20364 lt!346160) (index!34226 lt!346278)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777223 () Bool)

(assert (=> b!777223 (= e!432464 (Intermediate!7964 false (toIndex!0 lt!346166 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102179 c!86090) b!777221))

(assert (= (and d!102179 (not c!86090)) b!777217))

(assert (= (and b!777217 c!86091) b!777223))

(assert (= (and b!777217 (not c!86091)) b!777220))

(assert (= (and d!102179 c!86092) b!777216))

(assert (= (and d!102179 (not c!86092)) b!777219))

(assert (= (and b!777219 res!525835) b!777215))

(assert (= (and b!777215 (not res!525837)) b!777218))

(assert (= (and b!777218 (not res!525836)) b!777222))

(declare-fun m!721183 () Bool)

(assert (=> b!777222 m!721183))

(assert (=> b!777218 m!721183))

(assert (=> b!777215 m!721183))

(assert (=> b!777220 m!720957))

(declare-fun m!721185 () Bool)

(assert (=> b!777220 m!721185))

(assert (=> b!777220 m!721185))

(declare-fun m!721187 () Bool)

(assert (=> b!777220 m!721187))

(assert (=> d!102179 m!720957))

(declare-fun m!721189 () Bool)

(assert (=> d!102179 m!721189))

(assert (=> d!102179 m!720967))

(assert (=> b!776924 d!102179))

(declare-fun d!102181 () Bool)

(declare-fun lt!346292 () (_ BitVec 32))

(declare-fun lt!346291 () (_ BitVec 32))

(assert (=> d!102181 (= lt!346292 (bvmul (bvxor lt!346291 (bvlshr lt!346291 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102181 (= lt!346291 ((_ extract 31 0) (bvand (bvxor lt!346166 (bvlshr lt!346166 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102181 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!525840 (let ((h!15473 ((_ extract 31 0) (bvand (bvxor lt!346166 (bvlshr lt!346166 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65169 (bvmul (bvxor h!15473 (bvlshr h!15473 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65169 (bvlshr x!65169 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!525840 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!525840 #b00000000000000000000000000000000))))))

(assert (=> d!102181 (= (toIndex!0 lt!346166 mask!3328) (bvand (bvxor lt!346292 (bvlshr lt!346292 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!776924 d!102181))

(declare-fun b!777265 () Bool)

(declare-fun e!432492 () Bool)

(declare-fun call!35182 () Bool)

(assert (=> b!777265 (= e!432492 call!35182)))

(declare-fun b!777266 () Bool)

(declare-fun e!432491 () Bool)

(assert (=> b!777266 (= e!432491 call!35182)))

(declare-fun b!777267 () Bool)

(assert (=> b!777267 (= e!432492 e!432491)))

(declare-fun lt!346305 () (_ BitVec 64))

(assert (=> b!777267 (= lt!346305 (select (arr!20364 a!3186) j!159))))

(declare-fun lt!346306 () Unit!26822)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42537 (_ BitVec 64) (_ BitVec 32)) Unit!26822)

(assert (=> b!777267 (= lt!346306 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346305 j!159))))

(assert (=> b!777267 (arrayContainsKey!0 a!3186 lt!346305 #b00000000000000000000000000000000)))

(declare-fun lt!346307 () Unit!26822)

(assert (=> b!777267 (= lt!346307 lt!346306)))

(declare-fun res!525857 () Bool)

(assert (=> b!777267 (= res!525857 (= (seekEntryOrOpen!0 (select (arr!20364 a!3186) j!159) a!3186 mask!3328) (Found!7964 j!159)))))

(assert (=> b!777267 (=> (not res!525857) (not e!432491))))

(declare-fun b!777268 () Bool)

(declare-fun e!432493 () Bool)

(assert (=> b!777268 (= e!432493 e!432492)))

(declare-fun c!86105 () Bool)

(assert (=> b!777268 (= c!86105 (validKeyInArray!0 (select (arr!20364 a!3186) j!159)))))

(declare-fun d!102187 () Bool)

(declare-fun res!525858 () Bool)

(assert (=> d!102187 (=> res!525858 e!432493)))

(assert (=> d!102187 (= res!525858 (bvsge j!159 (size!20785 a!3186)))))

(assert (=> d!102187 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!432493)))

(declare-fun bm!35179 () Bool)

(assert (=> bm!35179 (= call!35182 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102187 (not res!525858)) b!777268))

(assert (= (and b!777268 c!86105) b!777267))

(assert (= (and b!777268 (not c!86105)) b!777265))

(assert (= (and b!777267 res!525857) b!777266))

(assert (= (or b!777266 b!777265) bm!35179))

(assert (=> b!777267 m!720931))

(declare-fun m!721209 () Bool)

(assert (=> b!777267 m!721209))

(declare-fun m!721211 () Bool)

(assert (=> b!777267 m!721211))

(assert (=> b!777267 m!720931))

(assert (=> b!777267 m!720943))

(assert (=> b!777268 m!720931))

(assert (=> b!777268 m!720931))

(assert (=> b!777268 m!720933))

(declare-fun m!721213 () Bool)

(assert (=> bm!35179 m!721213))

(assert (=> b!776937 d!102187))

(declare-fun d!102193 () Bool)

(assert (=> d!102193 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!346324 () Unit!26822)

(declare-fun choose!38 (array!42537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26822)

(assert (=> d!102193 (= lt!346324 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102193 (validMask!0 mask!3328)))

(assert (=> d!102193 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!346324)))

(declare-fun bs!21677 () Bool)

(assert (= bs!21677 d!102193))

(assert (=> bs!21677 m!720975))

(declare-fun m!721241 () Bool)

(assert (=> bs!21677 m!721241))

(assert (=> bs!21677 m!720967))

(assert (=> b!776937 d!102193))

(declare-fun b!777320 () Bool)

(declare-fun lt!346327 () SeekEntryResult!7964)

(assert (=> b!777320 (and (bvsge (index!34226 lt!346327) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346327) (size!20785 a!3186)))))

(declare-fun res!525876 () Bool)

(assert (=> b!777320 (= res!525876 (= (select (arr!20364 a!3186) (index!34226 lt!346327)) (select (arr!20364 a!3186) j!159)))))

(declare-fun e!432525 () Bool)

(assert (=> b!777320 (=> res!525876 e!432525)))

(declare-fun e!432522 () Bool)

(assert (=> b!777320 (= e!432522 e!432525)))

(declare-fun b!777321 () Bool)

(declare-fun e!432524 () Bool)

(assert (=> b!777321 (= e!432524 (bvsge (x!65163 lt!346327) #b01111111111111111111111111111110))))

(declare-fun b!777322 () Bool)

(declare-fun e!432523 () SeekEntryResult!7964)

(declare-fun e!432526 () SeekEntryResult!7964)

(assert (=> b!777322 (= e!432523 e!432526)))

(declare-fun c!86125 () Bool)

(declare-fun lt!346328 () (_ BitVec 64))

(assert (=> b!777322 (= c!86125 (or (= lt!346328 (select (arr!20364 a!3186) j!159)) (= (bvadd lt!346328 lt!346328) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102203 () Bool)

(assert (=> d!102203 e!432524))

(declare-fun c!86126 () Bool)

(assert (=> d!102203 (= c!86126 (and (is-Intermediate!7964 lt!346327) (undefined!8776 lt!346327)))))

(assert (=> d!102203 (= lt!346327 e!432523)))

(declare-fun c!86124 () Bool)

(assert (=> d!102203 (= c!86124 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102203 (= lt!346328 (select (arr!20364 a!3186) (toIndex!0 (select (arr!20364 a!3186) j!159) mask!3328)))))

(assert (=> d!102203 (validMask!0 mask!3328)))

(assert (=> d!102203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20364 a!3186) j!159) mask!3328) (select (arr!20364 a!3186) j!159) a!3186 mask!3328) lt!346327)))

(declare-fun b!777323 () Bool)

(assert (=> b!777323 (and (bvsge (index!34226 lt!346327) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346327) (size!20785 a!3186)))))

(declare-fun res!525875 () Bool)

(assert (=> b!777323 (= res!525875 (= (select (arr!20364 a!3186) (index!34226 lt!346327)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777323 (=> res!525875 e!432525)))

(declare-fun b!777324 () Bool)

(assert (=> b!777324 (= e!432524 e!432522)))

(declare-fun res!525874 () Bool)

(assert (=> b!777324 (= res!525874 (and (is-Intermediate!7964 lt!346327) (not (undefined!8776 lt!346327)) (bvslt (x!65163 lt!346327) #b01111111111111111111111111111110) (bvsge (x!65163 lt!346327) #b00000000000000000000000000000000) (bvsge (x!65163 lt!346327) #b00000000000000000000000000000000)))))

(assert (=> b!777324 (=> (not res!525874) (not e!432522))))

(declare-fun b!777325 () Bool)

(assert (=> b!777325 (= e!432526 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20364 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20364 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777326 () Bool)

(assert (=> b!777326 (= e!432523 (Intermediate!7964 true (toIndex!0 (select (arr!20364 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!777327 () Bool)

(assert (=> b!777327 (and (bvsge (index!34226 lt!346327) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346327) (size!20785 a!3186)))))

(assert (=> b!777327 (= e!432525 (= (select (arr!20364 a!3186) (index!34226 lt!346327)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777328 () Bool)

(assert (=> b!777328 (= e!432526 (Intermediate!7964 false (toIndex!0 (select (arr!20364 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102203 c!86124) b!777326))

(assert (= (and d!102203 (not c!86124)) b!777322))

(assert (= (and b!777322 c!86125) b!777328))

(assert (= (and b!777322 (not c!86125)) b!777325))

(assert (= (and d!102203 c!86126) b!777321))

(assert (= (and d!102203 (not c!86126)) b!777324))

(assert (= (and b!777324 res!525874) b!777320))

(assert (= (and b!777320 (not res!525876)) b!777323))

(assert (= (and b!777323 (not res!525875)) b!777327))

(declare-fun m!721243 () Bool)

(assert (=> b!777327 m!721243))

(assert (=> b!777323 m!721243))

(assert (=> b!777320 m!721243))

(assert (=> b!777325 m!720949))

(declare-fun m!721245 () Bool)

(assert (=> b!777325 m!721245))

(assert (=> b!777325 m!721245))

(assert (=> b!777325 m!720931))

(declare-fun m!721247 () Bool)

(assert (=> b!777325 m!721247))

(assert (=> d!102203 m!720949))

(declare-fun m!721249 () Bool)

(assert (=> d!102203 m!721249))

(assert (=> d!102203 m!720967))

(assert (=> b!776926 d!102203))

(declare-fun d!102207 () Bool)

(declare-fun lt!346330 () (_ BitVec 32))

(declare-fun lt!346329 () (_ BitVec 32))

(assert (=> d!102207 (= lt!346330 (bvmul (bvxor lt!346329 (bvlshr lt!346329 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102207 (= lt!346329 ((_ extract 31 0) (bvand (bvxor (select (arr!20364 a!3186) j!159) (bvlshr (select (arr!20364 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102207 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!525840 (let ((h!15473 ((_ extract 31 0) (bvand (bvxor (select (arr!20364 a!3186) j!159) (bvlshr (select (arr!20364 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65169 (bvmul (bvxor h!15473 (bvlshr h!15473 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65169 (bvlshr x!65169 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!525840 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!525840 #b00000000000000000000000000000000))))))

(assert (=> d!102207 (= (toIndex!0 (select (arr!20364 a!3186) j!159) mask!3328) (bvand (bvxor lt!346330 (bvlshr lt!346330 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!776926 d!102207))

(declare-fun b!777329 () Bool)

(declare-fun c!86128 () Bool)

(declare-fun lt!346332 () (_ BitVec 64))

(assert (=> b!777329 (= c!86128 (= lt!346332 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432529 () SeekEntryResult!7964)

(declare-fun e!432527 () SeekEntryResult!7964)

(assert (=> b!777329 (= e!432529 e!432527)))

(declare-fun b!777330 () Bool)

(assert (=> b!777330 (= e!432529 (Found!7964 index!1321))))

(declare-fun b!777332 () Bool)

(assert (=> b!777332 (= e!432527 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20364 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777333 () Bool)

(declare-fun e!432528 () SeekEntryResult!7964)

(assert (=> b!777333 (= e!432528 e!432529)))

(declare-fun c!86129 () Bool)

(assert (=> b!777333 (= c!86129 (= lt!346332 (select (arr!20364 a!3186) j!159)))))

(declare-fun b!777334 () Bool)

(assert (=> b!777334 (= e!432527 (MissingVacant!7964 resIntermediateIndex!5))))

(declare-fun d!102209 () Bool)

(declare-fun lt!346331 () SeekEntryResult!7964)

(assert (=> d!102209 (and (or (is-Undefined!7964 lt!346331) (not (is-Found!7964 lt!346331)) (and (bvsge (index!34225 lt!346331) #b00000000000000000000000000000000) (bvslt (index!34225 lt!346331) (size!20785 a!3186)))) (or (is-Undefined!7964 lt!346331) (is-Found!7964 lt!346331) (not (is-MissingVacant!7964 lt!346331)) (not (= (index!34227 lt!346331) resIntermediateIndex!5)) (and (bvsge (index!34227 lt!346331) #b00000000000000000000000000000000) (bvslt (index!34227 lt!346331) (size!20785 a!3186)))) (or (is-Undefined!7964 lt!346331) (ite (is-Found!7964 lt!346331) (= (select (arr!20364 a!3186) (index!34225 lt!346331)) (select (arr!20364 a!3186) j!159)) (and (is-MissingVacant!7964 lt!346331) (= (index!34227 lt!346331) resIntermediateIndex!5) (= (select (arr!20364 a!3186) (index!34227 lt!346331)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102209 (= lt!346331 e!432528)))

(declare-fun c!86127 () Bool)

(assert (=> d!102209 (= c!86127 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102209 (= lt!346332 (select (arr!20364 a!3186) index!1321))))

(assert (=> d!102209 (validMask!0 mask!3328)))

(assert (=> d!102209 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20364 a!3186) j!159) a!3186 mask!3328) lt!346331)))

(declare-fun b!777331 () Bool)

(assert (=> b!777331 (= e!432528 Undefined!7964)))

(assert (= (and d!102209 c!86127) b!777331))

(assert (= (and d!102209 (not c!86127)) b!777333))

(assert (= (and b!777333 c!86129) b!777330))

(assert (= (and b!777333 (not c!86129)) b!777329))

(assert (= (and b!777329 c!86128) b!777334))

(assert (= (and b!777329 (not c!86128)) b!777332))

(assert (=> b!777332 m!721177))

(assert (=> b!777332 m!721177))

(assert (=> b!777332 m!720931))

(declare-fun m!721251 () Bool)

(assert (=> b!777332 m!721251))

(declare-fun m!721253 () Bool)

(assert (=> d!102209 m!721253))

(declare-fun m!721255 () Bool)

(assert (=> d!102209 m!721255))

(declare-fun m!721257 () Bool)

(assert (=> d!102209 m!721257))

(assert (=> d!102209 m!720967))

(assert (=> b!776933 d!102209))

(declare-fun b!777390 () Bool)

(declare-fun e!432564 () SeekEntryResult!7964)

(declare-fun lt!346356 () SeekEntryResult!7964)

(assert (=> b!777390 (= e!432564 (MissingZero!7964 (index!34226 lt!346356)))))

(declare-fun d!102211 () Bool)

(declare-fun lt!346357 () SeekEntryResult!7964)

(assert (=> d!102211 (and (or (is-Undefined!7964 lt!346357) (not (is-Found!7964 lt!346357)) (and (bvsge (index!34225 lt!346357) #b00000000000000000000000000000000) (bvslt (index!34225 lt!346357) (size!20785 a!3186)))) (or (is-Undefined!7964 lt!346357) (is-Found!7964 lt!346357) (not (is-MissingZero!7964 lt!346357)) (and (bvsge (index!34224 lt!346357) #b00000000000000000000000000000000) (bvslt (index!34224 lt!346357) (size!20785 a!3186)))) (or (is-Undefined!7964 lt!346357) (is-Found!7964 lt!346357) (is-MissingZero!7964 lt!346357) (not (is-MissingVacant!7964 lt!346357)) (and (bvsge (index!34227 lt!346357) #b00000000000000000000000000000000) (bvslt (index!34227 lt!346357) (size!20785 a!3186)))) (or (is-Undefined!7964 lt!346357) (ite (is-Found!7964 lt!346357) (= (select (arr!20364 a!3186) (index!34225 lt!346357)) k!2102) (ite (is-MissingZero!7964 lt!346357) (= (select (arr!20364 a!3186) (index!34224 lt!346357)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7964 lt!346357) (= (select (arr!20364 a!3186) (index!34227 lt!346357)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!432566 () SeekEntryResult!7964)

(assert (=> d!102211 (= lt!346357 e!432566)))

(declare-fun c!86149 () Bool)

(assert (=> d!102211 (= c!86149 (and (is-Intermediate!7964 lt!346356) (undefined!8776 lt!346356)))))

(assert (=> d!102211 (= lt!346356 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102211 (validMask!0 mask!3328)))

(assert (=> d!102211 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!346357)))

(declare-fun b!777391 () Bool)

(declare-fun e!432565 () SeekEntryResult!7964)

(assert (=> b!777391 (= e!432566 e!432565)))

(declare-fun lt!346355 () (_ BitVec 64))

(assert (=> b!777391 (= lt!346355 (select (arr!20364 a!3186) (index!34226 lt!346356)))))

(declare-fun c!86151 () Bool)

(assert (=> b!777391 (= c!86151 (= lt!346355 k!2102))))

(declare-fun b!777392 () Bool)

(declare-fun c!86150 () Bool)

(assert (=> b!777392 (= c!86150 (= lt!346355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777392 (= e!432565 e!432564)))

(declare-fun b!777393 () Bool)

(assert (=> b!777393 (= e!432564 (seekKeyOrZeroReturnVacant!0 (x!65163 lt!346356) (index!34226 lt!346356) (index!34226 lt!346356) k!2102 a!3186 mask!3328))))

(declare-fun b!777394 () Bool)

(assert (=> b!777394 (= e!432565 (Found!7964 (index!34226 lt!346356)))))

(declare-fun b!777395 () Bool)

(assert (=> b!777395 (= e!432566 Undefined!7964)))

(assert (= (and d!102211 c!86149) b!777395))

(assert (= (and d!102211 (not c!86149)) b!777391))

(assert (= (and b!777391 c!86151) b!777394))

(assert (= (and b!777391 (not c!86151)) b!777392))

(assert (= (and b!777392 c!86150) b!777390))

(assert (= (and b!777392 (not c!86150)) b!777393))

(declare-fun m!721295 () Bool)

(assert (=> d!102211 m!721295))

(declare-fun m!721297 () Bool)

(assert (=> d!102211 m!721297))

(declare-fun m!721299 () Bool)

(assert (=> d!102211 m!721299))

(assert (=> d!102211 m!721297))

(declare-fun m!721301 () Bool)

(assert (=> d!102211 m!721301))

(assert (=> d!102211 m!720967))

(declare-fun m!721303 () Bool)

(assert (=> d!102211 m!721303))

(declare-fun m!721305 () Bool)

(assert (=> b!777391 m!721305))

(declare-fun m!721307 () Bool)

(assert (=> b!777393 m!721307))

(assert (=> b!776943 d!102211))

(declare-fun b!777396 () Bool)

(declare-fun e!432567 () SeekEntryResult!7964)

(declare-fun lt!346359 () SeekEntryResult!7964)

(assert (=> b!777396 (= e!432567 (MissingZero!7964 (index!34226 lt!346359)))))

(declare-fun d!102227 () Bool)

(declare-fun lt!346360 () SeekEntryResult!7964)

(assert (=> d!102227 (and (or (is-Undefined!7964 lt!346360) (not (is-Found!7964 lt!346360)) (and (bvsge (index!34225 lt!346360) #b00000000000000000000000000000000) (bvslt (index!34225 lt!346360) (size!20785 lt!346160)))) (or (is-Undefined!7964 lt!346360) (is-Found!7964 lt!346360) (not (is-MissingZero!7964 lt!346360)) (and (bvsge (index!34224 lt!346360) #b00000000000000000000000000000000) (bvslt (index!34224 lt!346360) (size!20785 lt!346160)))) (or (is-Undefined!7964 lt!346360) (is-Found!7964 lt!346360) (is-MissingZero!7964 lt!346360) (not (is-MissingVacant!7964 lt!346360)) (and (bvsge (index!34227 lt!346360) #b00000000000000000000000000000000) (bvslt (index!34227 lt!346360) (size!20785 lt!346160)))) (or (is-Undefined!7964 lt!346360) (ite (is-Found!7964 lt!346360) (= (select (arr!20364 lt!346160) (index!34225 lt!346360)) lt!346166) (ite (is-MissingZero!7964 lt!346360) (= (select (arr!20364 lt!346160) (index!34224 lt!346360)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7964 lt!346360) (= (select (arr!20364 lt!346160) (index!34227 lt!346360)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!432569 () SeekEntryResult!7964)

(assert (=> d!102227 (= lt!346360 e!432569)))

(declare-fun c!86152 () Bool)

(assert (=> d!102227 (= c!86152 (and (is-Intermediate!7964 lt!346359) (undefined!8776 lt!346359)))))

(assert (=> d!102227 (= lt!346359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346166 mask!3328) lt!346166 lt!346160 mask!3328))))

(assert (=> d!102227 (validMask!0 mask!3328)))

(assert (=> d!102227 (= (seekEntryOrOpen!0 lt!346166 lt!346160 mask!3328) lt!346360)))

(declare-fun b!777397 () Bool)

(declare-fun e!432568 () SeekEntryResult!7964)

(assert (=> b!777397 (= e!432569 e!432568)))

(declare-fun lt!346358 () (_ BitVec 64))

(assert (=> b!777397 (= lt!346358 (select (arr!20364 lt!346160) (index!34226 lt!346359)))))

(declare-fun c!86154 () Bool)

(assert (=> b!777397 (= c!86154 (= lt!346358 lt!346166))))

(declare-fun b!777398 () Bool)

(declare-fun c!86153 () Bool)

(assert (=> b!777398 (= c!86153 (= lt!346358 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777398 (= e!432568 e!432567)))

(declare-fun b!777399 () Bool)

(assert (=> b!777399 (= e!432567 (seekKeyOrZeroReturnVacant!0 (x!65163 lt!346359) (index!34226 lt!346359) (index!34226 lt!346359) lt!346166 lt!346160 mask!3328))))

(declare-fun b!777400 () Bool)

(assert (=> b!777400 (= e!432568 (Found!7964 (index!34226 lt!346359)))))

(declare-fun b!777401 () Bool)

(assert (=> b!777401 (= e!432569 Undefined!7964)))

(assert (= (and d!102227 c!86152) b!777401))

(assert (= (and d!102227 (not c!86152)) b!777397))

(assert (= (and b!777397 c!86154) b!777400))

(assert (= (and b!777397 (not c!86154)) b!777398))

(assert (= (and b!777398 c!86153) b!777396))

(assert (= (and b!777398 (not c!86153)) b!777399))

(declare-fun m!721309 () Bool)

(assert (=> d!102227 m!721309))

(assert (=> d!102227 m!720957))

(declare-fun m!721311 () Bool)

(assert (=> d!102227 m!721311))

(assert (=> d!102227 m!720957))

(assert (=> d!102227 m!720959))

(assert (=> d!102227 m!720967))

(declare-fun m!721313 () Bool)

(assert (=> d!102227 m!721313))

(declare-fun m!721315 () Bool)

(assert (=> b!777397 m!721315))

(declare-fun m!721317 () Bool)

(assert (=> b!777399 m!721317))

(assert (=> b!776932 d!102227))

(declare-fun d!102229 () Bool)

(assert (=> d!102229 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!776934 d!102229))

(declare-fun d!102231 () Bool)

(assert (=> d!102231 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67182 d!102231))

(declare-fun d!102235 () Bool)

(assert (=> d!102235 (= (array_inv!16160 a!3186) (bvsge (size!20785 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67182 d!102235))

(declare-fun b!777424 () Bool)

(declare-fun e!432586 () Bool)

(declare-fun call!35189 () Bool)

(assert (=> b!777424 (= e!432586 call!35189)))

(declare-fun b!777425 () Bool)

(declare-fun e!432584 () Bool)

(declare-fun e!432585 () Bool)

(assert (=> b!777425 (= e!432584 e!432585)))

(declare-fun res!525902 () Bool)

(assert (=> b!777425 (=> (not res!525902) (not e!432585))))

(declare-fun e!432587 () Bool)

(assert (=> b!777425 (= res!525902 (not e!432587))))

(declare-fun res!525901 () Bool)

(assert (=> b!777425 (=> (not res!525901) (not e!432587))))

(assert (=> b!777425 (= res!525901 (validKeyInArray!0 (select (arr!20364 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!777426 () Bool)

(assert (=> b!777426 (= e!432585 e!432586)))

(declare-fun c!86163 () Bool)

(assert (=> b!777426 (= c!86163 (validKeyInArray!0 (select (arr!20364 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102237 () Bool)

(declare-fun res!525903 () Bool)

(assert (=> d!102237 (=> res!525903 e!432584)))

(assert (=> d!102237 (= res!525903 (bvsge #b00000000000000000000000000000000 (size!20785 a!3186)))))

(assert (=> d!102237 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14363) e!432584)))

(declare-fun b!777427 () Bool)

(assert (=> b!777427 (= e!432586 call!35189)))

(declare-fun bm!35186 () Bool)

(assert (=> bm!35186 (= call!35189 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86163 (Cons!14362 (select (arr!20364 a!3186) #b00000000000000000000000000000000) Nil!14363) Nil!14363)))))

(declare-fun b!777428 () Bool)

(declare-fun contains!4098 (List!14366 (_ BitVec 64)) Bool)

(assert (=> b!777428 (= e!432587 (contains!4098 Nil!14363 (select (arr!20364 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102237 (not res!525903)) b!777425))

(assert (= (and b!777425 res!525901) b!777428))

(assert (= (and b!777425 res!525902) b!777426))

(assert (= (and b!777426 c!86163) b!777427))

(assert (= (and b!777426 (not c!86163)) b!777424))

(assert (= (or b!777427 b!777424) bm!35186))

(assert (=> b!777425 m!721121))

(assert (=> b!777425 m!721121))

(declare-fun m!721321 () Bool)

(assert (=> b!777425 m!721321))

(assert (=> b!777426 m!721121))

(assert (=> b!777426 m!721121))

(assert (=> b!777426 m!721321))

(assert (=> bm!35186 m!721121))

(declare-fun m!721323 () Bool)

(assert (=> bm!35186 m!721323))

(assert (=> b!777428 m!721121))

(assert (=> b!777428 m!721121))

(declare-fun m!721325 () Bool)

(assert (=> b!777428 m!721325))

(assert (=> b!776941 d!102237))

(declare-fun b!777435 () Bool)

(declare-fun lt!346370 () SeekEntryResult!7964)

(assert (=> b!777435 (and (bvsge (index!34226 lt!346370) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346370) (size!20785 a!3186)))))

(declare-fun res!525906 () Bool)

(assert (=> b!777435 (= res!525906 (= (select (arr!20364 a!3186) (index!34226 lt!346370)) (select (arr!20364 a!3186) j!159)))))

(declare-fun e!432594 () Bool)

(assert (=> b!777435 (=> res!525906 e!432594)))

(declare-fun e!432591 () Bool)

(assert (=> b!777435 (= e!432591 e!432594)))

(declare-fun b!777436 () Bool)

(declare-fun e!432593 () Bool)

(assert (=> b!777436 (= e!432593 (bvsge (x!65163 lt!346370) #b01111111111111111111111111111110))))

(declare-fun b!777437 () Bool)

(declare-fun e!432592 () SeekEntryResult!7964)

(declare-fun e!432595 () SeekEntryResult!7964)

(assert (=> b!777437 (= e!432592 e!432595)))

(declare-fun lt!346371 () (_ BitVec 64))

(declare-fun c!86168 () Bool)

(assert (=> b!777437 (= c!86168 (or (= lt!346371 (select (arr!20364 a!3186) j!159)) (= (bvadd lt!346371 lt!346371) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102239 () Bool)

(assert (=> d!102239 e!432593))

(declare-fun c!86169 () Bool)

(assert (=> d!102239 (= c!86169 (and (is-Intermediate!7964 lt!346370) (undefined!8776 lt!346370)))))

(assert (=> d!102239 (= lt!346370 e!432592)))

(declare-fun c!86167 () Bool)

(assert (=> d!102239 (= c!86167 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102239 (= lt!346371 (select (arr!20364 a!3186) index!1321))))

(assert (=> d!102239 (validMask!0 mask!3328)))

(assert (=> d!102239 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20364 a!3186) j!159) a!3186 mask!3328) lt!346370)))

(declare-fun b!777438 () Bool)

(assert (=> b!777438 (and (bvsge (index!34226 lt!346370) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346370) (size!20785 a!3186)))))

(declare-fun res!525905 () Bool)

(assert (=> b!777438 (= res!525905 (= (select (arr!20364 a!3186) (index!34226 lt!346370)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777438 (=> res!525905 e!432594)))

(declare-fun b!777439 () Bool)

(assert (=> b!777439 (= e!432593 e!432591)))

(declare-fun res!525904 () Bool)

(assert (=> b!777439 (= res!525904 (and (is-Intermediate!7964 lt!346370) (not (undefined!8776 lt!346370)) (bvslt (x!65163 lt!346370) #b01111111111111111111111111111110) (bvsge (x!65163 lt!346370) #b00000000000000000000000000000000) (bvsge (x!65163 lt!346370) x!1131)))))

(assert (=> b!777439 (=> (not res!525904) (not e!432591))))

(declare-fun b!777440 () Bool)

(assert (=> b!777440 (= e!432595 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20364 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777441 () Bool)

(assert (=> b!777441 (= e!432592 (Intermediate!7964 true index!1321 x!1131))))

(declare-fun b!777442 () Bool)

(assert (=> b!777442 (and (bvsge (index!34226 lt!346370) #b00000000000000000000000000000000) (bvslt (index!34226 lt!346370) (size!20785 a!3186)))))

(assert (=> b!777442 (= e!432594 (= (select (arr!20364 a!3186) (index!34226 lt!346370)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777443 () Bool)

(assert (=> b!777443 (= e!432595 (Intermediate!7964 false index!1321 x!1131))))

(assert (= (and d!102239 c!86167) b!777441))

(assert (= (and d!102239 (not c!86167)) b!777437))

(assert (= (and b!777437 c!86168) b!777443))

(assert (= (and b!777437 (not c!86168)) b!777440))

(assert (= (and d!102239 c!86169) b!777436))

(assert (= (and d!102239 (not c!86169)) b!777439))

(assert (= (and b!777439 res!525904) b!777435))

(assert (= (and b!777435 (not res!525906)) b!777438))

(assert (= (and b!777438 (not res!525905)) b!777442))

(declare-fun m!721335 () Bool)

(assert (=> b!777442 m!721335))

(assert (=> b!777438 m!721335))

(assert (=> b!777435 m!721335))

(assert (=> b!777440 m!721177))

(assert (=> b!777440 m!721177))

(assert (=> b!777440 m!720931))

(declare-fun m!721337 () Bool)

(assert (=> b!777440 m!721337))

(assert (=> d!102239 m!721257))

(assert (=> d!102239 m!720967))

(assert (=> b!776930 d!102239))

(declare-fun b!777453 () Bool)

(declare-fun e!432601 () SeekEntryResult!7964)

(declare-fun lt!346375 () SeekEntryResult!7964)

(assert (=> b!777453 (= e!432601 (MissingZero!7964 (index!34226 lt!346375)))))

