; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65590 () Bool)

(assert start!65590)

(declare-fun b!749847 () Bool)

(declare-fun res!506012 () Bool)

(declare-fun e!418394 () Bool)

(assert (=> b!749847 (=> (not res!506012) (not e!418394))))

(declare-datatypes ((array!41763 0))(
  ( (array!41764 (arr!19995 (Array (_ BitVec 32) (_ BitVec 64))) (size!20416 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41763)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749847 (= res!506012 (validKeyInArray!0 (select (arr!19995 a!3186) j!159)))))

(declare-fun b!749848 () Bool)

(declare-fun e!418393 () Bool)

(assert (=> b!749848 (= e!418394 e!418393)))

(declare-fun res!506010 () Bool)

(assert (=> b!749848 (=> (not res!506010) (not e!418393))))

(declare-datatypes ((SeekEntryResult!7595 0))(
  ( (MissingZero!7595 (index!32748 (_ BitVec 32))) (Found!7595 (index!32749 (_ BitVec 32))) (Intermediate!7595 (undefined!8407 Bool) (index!32750 (_ BitVec 32)) (x!63681 (_ BitVec 32))) (Undefined!7595) (MissingVacant!7595 (index!32751 (_ BitVec 32))) )
))
(declare-fun lt!333393 () SeekEntryResult!7595)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749848 (= res!506010 (or (= lt!333393 (MissingZero!7595 i!1173)) (= lt!333393 (MissingVacant!7595 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41763 (_ BitVec 32)) SeekEntryResult!7595)

(assert (=> b!749848 (= lt!333393 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!749849 () Bool)

(declare-fun res!506025 () Bool)

(assert (=> b!749849 (=> (not res!506025) (not e!418393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41763 (_ BitVec 32)) Bool)

(assert (=> b!749849 (= res!506025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749850 () Bool)

(declare-fun e!418396 () Bool)

(assert (=> b!749850 (= e!418393 e!418396)))

(declare-fun res!506019 () Bool)

(assert (=> b!749850 (=> (not res!506019) (not e!418396))))

(declare-fun lt!333386 () SeekEntryResult!7595)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41763 (_ BitVec 32)) SeekEntryResult!7595)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749850 (= res!506019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19995 a!3186) j!159) mask!3328) (select (arr!19995 a!3186) j!159) a!3186 mask!3328) lt!333386))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749850 (= lt!333386 (Intermediate!7595 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749851 () Bool)

(declare-fun res!506016 () Bool)

(assert (=> b!749851 (=> (not res!506016) (not e!418393))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!749851 (= res!506016 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20416 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20416 a!3186))))))

(declare-fun b!749852 () Bool)

(declare-fun e!418398 () Bool)

(assert (=> b!749852 (= e!418398 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19995 a!3186) j!159) a!3186 mask!3328) lt!333386))))

(declare-fun b!749853 () Bool)

(declare-fun res!506026 () Bool)

(assert (=> b!749853 (=> (not res!506026) (not e!418396))))

(assert (=> b!749853 (= res!506026 e!418398)))

(declare-fun c!82299 () Bool)

(assert (=> b!749853 (= c!82299 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749854 () Bool)

(declare-fun lt!333394 () array!41763)

(declare-fun e!418400 () Bool)

(declare-fun lt!333389 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41763 (_ BitVec 32)) SeekEntryResult!7595)

(assert (=> b!749854 (= e!418400 (= (seekEntryOrOpen!0 lt!333389 lt!333394 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333389 lt!333394 mask!3328)))))

(declare-fun b!749856 () Bool)

(declare-fun res!506024 () Bool)

(assert (=> b!749856 (=> (not res!506024) (not e!418393))))

(declare-datatypes ((List!13997 0))(
  ( (Nil!13994) (Cons!13993 (h!15065 (_ BitVec 64)) (t!20312 List!13997)) )
))
(declare-fun arrayNoDuplicates!0 (array!41763 (_ BitVec 32) List!13997) Bool)

(assert (=> b!749856 (= res!506024 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13994))))

(declare-fun b!749857 () Bool)

(declare-fun res!506015 () Bool)

(declare-fun e!418395 () Bool)

(assert (=> b!749857 (=> res!506015 e!418395)))

(declare-fun lt!333387 () SeekEntryResult!7595)

(assert (=> b!749857 (= res!506015 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19995 a!3186) j!159) a!3186 mask!3328) lt!333387)))))

(declare-fun b!749858 () Bool)

(declare-fun e!418403 () Bool)

(assert (=> b!749858 (= e!418395 e!418403)))

(declare-fun res!506017 () Bool)

(assert (=> b!749858 (=> res!506017 e!418403)))

(declare-fun lt!333391 () (_ BitVec 64))

(assert (=> b!749858 (= res!506017 (= lt!333391 lt!333389))))

(assert (=> b!749858 (= lt!333391 (select (store (arr!19995 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!749859 () Bool)

(declare-fun e!418402 () Bool)

(assert (=> b!749859 (= e!418396 e!418402)))

(declare-fun res!506022 () Bool)

(assert (=> b!749859 (=> (not res!506022) (not e!418402))))

(declare-fun lt!333385 () SeekEntryResult!7595)

(declare-fun lt!333388 () SeekEntryResult!7595)

(assert (=> b!749859 (= res!506022 (= lt!333385 lt!333388))))

(assert (=> b!749859 (= lt!333388 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333389 lt!333394 mask!3328))))

(assert (=> b!749859 (= lt!333385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333389 mask!3328) lt!333389 lt!333394 mask!3328))))

(assert (=> b!749859 (= lt!333389 (select (store (arr!19995 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!749859 (= lt!333394 (array!41764 (store (arr!19995 a!3186) i!1173 k!2102) (size!20416 a!3186)))))

(declare-fun b!749860 () Bool)

(declare-fun res!506023 () Bool)

(assert (=> b!749860 (=> (not res!506023) (not e!418394))))

(assert (=> b!749860 (= res!506023 (and (= (size!20416 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20416 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20416 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749861 () Bool)

(declare-fun res!506027 () Bool)

(assert (=> b!749861 (=> (not res!506027) (not e!418394))))

(assert (=> b!749861 (= res!506027 (validKeyInArray!0 k!2102))))

(declare-fun e!418399 () Bool)

(declare-fun b!749862 () Bool)

(assert (=> b!749862 (= e!418399 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19995 a!3186) j!159) a!3186 mask!3328) lt!333387))))

(declare-fun b!749863 () Bool)

(declare-datatypes ((Unit!25760 0))(
  ( (Unit!25761) )
))
(declare-fun e!418401 () Unit!25760)

(declare-fun Unit!25762 () Unit!25760)

(assert (=> b!749863 (= e!418401 Unit!25762)))

(declare-fun b!749864 () Bool)

(assert (=> b!749864 (= e!418398 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19995 a!3186) j!159) a!3186 mask!3328) (Found!7595 j!159)))))

(declare-fun b!749865 () Bool)

(declare-fun Unit!25763 () Unit!25760)

(assert (=> b!749865 (= e!418401 Unit!25763)))

(assert (=> b!749865 false))

(declare-fun b!749866 () Bool)

(declare-fun res!506011 () Bool)

(assert (=> b!749866 (=> (not res!506011) (not e!418394))))

(declare-fun arrayContainsKey!0 (array!41763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749866 (= res!506011 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749867 () Bool)

(assert (=> b!749867 (= e!418402 (not e!418395))))

(declare-fun res!506013 () Bool)

(assert (=> b!749867 (=> res!506013 e!418395)))

(assert (=> b!749867 (= res!506013 (or (not (is-Intermediate!7595 lt!333388)) (bvslt x!1131 (x!63681 lt!333388)) (not (= x!1131 (x!63681 lt!333388))) (not (= index!1321 (index!32750 lt!333388)))))))

(assert (=> b!749867 e!418399))

(declare-fun res!506021 () Bool)

(assert (=> b!749867 (=> (not res!506021) (not e!418399))))

(declare-fun lt!333392 () SeekEntryResult!7595)

(assert (=> b!749867 (= res!506021 (= lt!333392 lt!333387))))

(assert (=> b!749867 (= lt!333387 (Found!7595 j!159))))

(assert (=> b!749867 (= lt!333392 (seekEntryOrOpen!0 (select (arr!19995 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!749867 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333395 () Unit!25760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25760)

(assert (=> b!749867 (= lt!333395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749868 () Bool)

(declare-fun res!506020 () Bool)

(assert (=> b!749868 (=> (not res!506020) (not e!418396))))

(assert (=> b!749868 (= res!506020 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19995 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!506018 () Bool)

(assert (=> start!65590 (=> (not res!506018) (not e!418394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65590 (= res!506018 (validMask!0 mask!3328))))

(assert (=> start!65590 e!418394))

(assert (=> start!65590 true))

(declare-fun array_inv!15791 (array!41763) Bool)

(assert (=> start!65590 (array_inv!15791 a!3186)))

(declare-fun b!749855 () Bool)

(assert (=> b!749855 (= e!418403 true)))

(assert (=> b!749855 e!418400))

(declare-fun res!506014 () Bool)

(assert (=> b!749855 (=> (not res!506014) (not e!418400))))

(assert (=> b!749855 (= res!506014 (= lt!333391 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333390 () Unit!25760)

(assert (=> b!749855 (= lt!333390 e!418401)))

(declare-fun c!82300 () Bool)

(assert (=> b!749855 (= c!82300 (= lt!333391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65590 res!506018) b!749860))

(assert (= (and b!749860 res!506023) b!749847))

(assert (= (and b!749847 res!506012) b!749861))

(assert (= (and b!749861 res!506027) b!749866))

(assert (= (and b!749866 res!506011) b!749848))

(assert (= (and b!749848 res!506010) b!749849))

(assert (= (and b!749849 res!506025) b!749856))

(assert (= (and b!749856 res!506024) b!749851))

(assert (= (and b!749851 res!506016) b!749850))

(assert (= (and b!749850 res!506019) b!749868))

(assert (= (and b!749868 res!506020) b!749853))

(assert (= (and b!749853 c!82299) b!749852))

(assert (= (and b!749853 (not c!82299)) b!749864))

(assert (= (and b!749853 res!506026) b!749859))

(assert (= (and b!749859 res!506022) b!749867))

(assert (= (and b!749867 res!506021) b!749862))

(assert (= (and b!749867 (not res!506013)) b!749857))

(assert (= (and b!749857 (not res!506015)) b!749858))

(assert (= (and b!749858 (not res!506017)) b!749855))

(assert (= (and b!749855 c!82300) b!749865))

(assert (= (and b!749855 (not c!82300)) b!749863))

(assert (= (and b!749855 res!506014) b!749854))

(declare-fun m!699367 () Bool)

(assert (=> b!749852 m!699367))

(assert (=> b!749852 m!699367))

(declare-fun m!699369 () Bool)

(assert (=> b!749852 m!699369))

(declare-fun m!699371 () Bool)

(assert (=> b!749859 m!699371))

(declare-fun m!699373 () Bool)

(assert (=> b!749859 m!699373))

(declare-fun m!699375 () Bool)

(assert (=> b!749859 m!699375))

(assert (=> b!749859 m!699373))

(declare-fun m!699377 () Bool)

(assert (=> b!749859 m!699377))

(declare-fun m!699379 () Bool)

(assert (=> b!749859 m!699379))

(assert (=> b!749864 m!699367))

(assert (=> b!749864 m!699367))

(declare-fun m!699381 () Bool)

(assert (=> b!749864 m!699381))

(declare-fun m!699383 () Bool)

(assert (=> b!749848 m!699383))

(declare-fun m!699385 () Bool)

(assert (=> b!749854 m!699385))

(declare-fun m!699387 () Bool)

(assert (=> b!749854 m!699387))

(declare-fun m!699389 () Bool)

(assert (=> b!749868 m!699389))

(declare-fun m!699391 () Bool)

(assert (=> b!749856 m!699391))

(assert (=> b!749850 m!699367))

(assert (=> b!749850 m!699367))

(declare-fun m!699393 () Bool)

(assert (=> b!749850 m!699393))

(assert (=> b!749850 m!699393))

(assert (=> b!749850 m!699367))

(declare-fun m!699395 () Bool)

(assert (=> b!749850 m!699395))

(assert (=> b!749862 m!699367))

(assert (=> b!749862 m!699367))

(declare-fun m!699397 () Bool)

(assert (=> b!749862 m!699397))

(declare-fun m!699399 () Bool)

(assert (=> start!65590 m!699399))

(declare-fun m!699401 () Bool)

(assert (=> start!65590 m!699401))

(assert (=> b!749858 m!699377))

(declare-fun m!699403 () Bool)

(assert (=> b!749858 m!699403))

(assert (=> b!749847 m!699367))

(assert (=> b!749847 m!699367))

(declare-fun m!699405 () Bool)

(assert (=> b!749847 m!699405))

(declare-fun m!699407 () Bool)

(assert (=> b!749866 m!699407))

(assert (=> b!749867 m!699367))

(assert (=> b!749867 m!699367))

(declare-fun m!699409 () Bool)

(assert (=> b!749867 m!699409))

(declare-fun m!699411 () Bool)

(assert (=> b!749867 m!699411))

(declare-fun m!699413 () Bool)

(assert (=> b!749867 m!699413))

(declare-fun m!699415 () Bool)

(assert (=> b!749861 m!699415))

(declare-fun m!699417 () Bool)

(assert (=> b!749849 m!699417))

(assert (=> b!749857 m!699367))

(assert (=> b!749857 m!699367))

(assert (=> b!749857 m!699381))

(push 1)

