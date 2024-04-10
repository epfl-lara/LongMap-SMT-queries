; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65530 () Bool)

(assert start!65530)

(declare-fun b!747919 () Bool)

(declare-fun res!504445 () Bool)

(declare-fun e!417516 () Bool)

(assert (=> b!747919 (=> (not res!504445) (not e!417516))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747919 (= res!504445 (validKeyInArray!0 k!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41703 0))(
  ( (array!41704 (arr!19965 (Array (_ BitVec 32) (_ BitVec 64))) (size!20386 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41703)

(declare-fun b!747920 () Bool)

(declare-fun e!417520 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7565 0))(
  ( (MissingZero!7565 (index!32628 (_ BitVec 32))) (Found!7565 (index!32629 (_ BitVec 32))) (Intermediate!7565 (undefined!8377 Bool) (index!32630 (_ BitVec 32)) (x!63571 (_ BitVec 32))) (Undefined!7565) (MissingVacant!7565 (index!32631 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41703 (_ BitVec 32)) SeekEntryResult!7565)

(assert (=> b!747920 (= e!417520 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19965 a!3186) j!159) a!3186 mask!3328) (Found!7565 j!159)))))

(declare-fun b!747921 () Bool)

(declare-fun res!504446 () Bool)

(assert (=> b!747921 (=> (not res!504446) (not e!417516))))

(assert (=> b!747921 (= res!504446 (validKeyInArray!0 (select (arr!19965 a!3186) j!159)))))

(declare-fun b!747922 () Bool)

(declare-fun res!504452 () Bool)

(declare-fun e!417518 () Bool)

(assert (=> b!747922 (=> (not res!504452) (not e!417518))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747922 (= res!504452 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19965 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747923 () Bool)

(declare-fun e!417523 () Bool)

(assert (=> b!747923 (= e!417523 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!747923 (= (select (store (arr!19965 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25640 0))(
  ( (Unit!25641) )
))
(declare-fun lt!332459 () Unit!25640)

(declare-fun e!417521 () Unit!25640)

(assert (=> b!747923 (= lt!332459 e!417521)))

(declare-fun c!82119 () Bool)

(assert (=> b!747923 (= c!82119 (= (select (store (arr!19965 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747924 () Bool)

(declare-fun res!504447 () Bool)

(declare-fun e!417524 () Bool)

(assert (=> b!747924 (=> (not res!504447) (not e!417524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41703 (_ BitVec 32)) Bool)

(assert (=> b!747924 (= res!504447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747925 () Bool)

(declare-fun e!417519 () Bool)

(assert (=> b!747925 (= e!417518 e!417519)))

(declare-fun res!504451 () Bool)

(assert (=> b!747925 (=> (not res!504451) (not e!417519))))

(declare-fun lt!332461 () SeekEntryResult!7565)

(declare-fun lt!332456 () SeekEntryResult!7565)

(assert (=> b!747925 (= res!504451 (= lt!332461 lt!332456))))

(declare-fun lt!332463 () (_ BitVec 64))

(declare-fun lt!332464 () array!41703)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41703 (_ BitVec 32)) SeekEntryResult!7565)

(assert (=> b!747925 (= lt!332456 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332463 lt!332464 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747925 (= lt!332461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332463 mask!3328) lt!332463 lt!332464 mask!3328))))

(assert (=> b!747925 (= lt!332463 (select (store (arr!19965 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!747925 (= lt!332464 (array!41704 (store (arr!19965 a!3186) i!1173 k!2102) (size!20386 a!3186)))))

(declare-fun res!504456 () Bool)

(assert (=> start!65530 (=> (not res!504456) (not e!417516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65530 (= res!504456 (validMask!0 mask!3328))))

(assert (=> start!65530 e!417516))

(assert (=> start!65530 true))

(declare-fun array_inv!15761 (array!41703) Bool)

(assert (=> start!65530 (array_inv!15761 a!3186)))

(declare-fun b!747926 () Bool)

(assert (=> b!747926 (= e!417516 e!417524)))

(declare-fun res!504448 () Bool)

(assert (=> b!747926 (=> (not res!504448) (not e!417524))))

(declare-fun lt!332462 () SeekEntryResult!7565)

(assert (=> b!747926 (= res!504448 (or (= lt!332462 (MissingZero!7565 i!1173)) (= lt!332462 (MissingVacant!7565 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41703 (_ BitVec 32)) SeekEntryResult!7565)

(assert (=> b!747926 (= lt!332462 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!747927 () Bool)

(declare-fun lt!332460 () SeekEntryResult!7565)

(assert (=> b!747927 (= e!417520 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19965 a!3186) j!159) a!3186 mask!3328) lt!332460))))

(declare-fun b!747928 () Bool)

(declare-fun res!504457 () Bool)

(assert (=> b!747928 (=> (not res!504457) (not e!417516))))

(assert (=> b!747928 (= res!504457 (and (= (size!20386 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20386 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20386 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747929 () Bool)

(declare-fun Unit!25642 () Unit!25640)

(assert (=> b!747929 (= e!417521 Unit!25642)))

(declare-fun b!747930 () Bool)

(declare-fun res!504458 () Bool)

(assert (=> b!747930 (=> res!504458 e!417523)))

(declare-fun lt!332465 () SeekEntryResult!7565)

(assert (=> b!747930 (= res!504458 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19965 a!3186) j!159) a!3186 mask!3328) lt!332465)))))

(declare-fun b!747931 () Bool)

(declare-fun res!504454 () Bool)

(assert (=> b!747931 (=> (not res!504454) (not e!417524))))

(declare-datatypes ((List!13967 0))(
  ( (Nil!13964) (Cons!13963 (h!15035 (_ BitVec 64)) (t!20282 List!13967)) )
))
(declare-fun arrayNoDuplicates!0 (array!41703 (_ BitVec 32) List!13967) Bool)

(assert (=> b!747931 (= res!504454 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13964))))

(declare-fun b!747932 () Bool)

(assert (=> b!747932 (= e!417519 (not e!417523))))

(declare-fun res!504443 () Bool)

(assert (=> b!747932 (=> res!504443 e!417523)))

(assert (=> b!747932 (= res!504443 (or (not (is-Intermediate!7565 lt!332456)) (bvslt x!1131 (x!63571 lt!332456)) (not (= x!1131 (x!63571 lt!332456))) (not (= index!1321 (index!32630 lt!332456)))))))

(declare-fun e!417517 () Bool)

(assert (=> b!747932 e!417517))

(declare-fun res!504450 () Bool)

(assert (=> b!747932 (=> (not res!504450) (not e!417517))))

(declare-fun lt!332457 () SeekEntryResult!7565)

(assert (=> b!747932 (= res!504450 (= lt!332457 lt!332465))))

(assert (=> b!747932 (= lt!332465 (Found!7565 j!159))))

(assert (=> b!747932 (= lt!332457 (seekEntryOrOpen!0 (select (arr!19965 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!747932 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332458 () Unit!25640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25640)

(assert (=> b!747932 (= lt!332458 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747933 () Bool)

(declare-fun res!504455 () Bool)

(assert (=> b!747933 (=> (not res!504455) (not e!417524))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747933 (= res!504455 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20386 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20386 a!3186))))))

(declare-fun b!747934 () Bool)

(declare-fun Unit!25643 () Unit!25640)

(assert (=> b!747934 (= e!417521 Unit!25643)))

(assert (=> b!747934 false))

(declare-fun b!747935 () Bool)

(declare-fun res!504449 () Bool)

(assert (=> b!747935 (=> (not res!504449) (not e!417518))))

(assert (=> b!747935 (= res!504449 e!417520)))

(declare-fun c!82120 () Bool)

(assert (=> b!747935 (= c!82120 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747936 () Bool)

(assert (=> b!747936 (= e!417517 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19965 a!3186) j!159) a!3186 mask!3328) lt!332465))))

(declare-fun b!747937 () Bool)

(declare-fun res!504442 () Bool)

(assert (=> b!747937 (=> (not res!504442) (not e!417516))))

(declare-fun arrayContainsKey!0 (array!41703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747937 (= res!504442 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747938 () Bool)

(assert (=> b!747938 (= e!417524 e!417518)))

(declare-fun res!504453 () Bool)

(assert (=> b!747938 (=> (not res!504453) (not e!417518))))

(assert (=> b!747938 (= res!504453 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19965 a!3186) j!159) mask!3328) (select (arr!19965 a!3186) j!159) a!3186 mask!3328) lt!332460))))

(assert (=> b!747938 (= lt!332460 (Intermediate!7565 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747939 () Bool)

(declare-fun res!504444 () Bool)

(assert (=> b!747939 (=> res!504444 e!417523)))

(assert (=> b!747939 (= res!504444 (= (select (store (arr!19965 a!3186) i!1173 k!2102) index!1321) lt!332463))))

(assert (= (and start!65530 res!504456) b!747928))

(assert (= (and b!747928 res!504457) b!747921))

(assert (= (and b!747921 res!504446) b!747919))

(assert (= (and b!747919 res!504445) b!747937))

(assert (= (and b!747937 res!504442) b!747926))

(assert (= (and b!747926 res!504448) b!747924))

(assert (= (and b!747924 res!504447) b!747931))

(assert (= (and b!747931 res!504454) b!747933))

(assert (= (and b!747933 res!504455) b!747938))

(assert (= (and b!747938 res!504453) b!747922))

(assert (= (and b!747922 res!504452) b!747935))

(assert (= (and b!747935 c!82120) b!747927))

(assert (= (and b!747935 (not c!82120)) b!747920))

(assert (= (and b!747935 res!504449) b!747925))

(assert (= (and b!747925 res!504451) b!747932))

(assert (= (and b!747932 res!504450) b!747936))

(assert (= (and b!747932 (not res!504443)) b!747930))

(assert (= (and b!747930 (not res!504458)) b!747939))

(assert (= (and b!747939 (not res!504444)) b!747923))

(assert (= (and b!747923 c!82119) b!747934))

(assert (= (and b!747923 (not c!82119)) b!747929))

(declare-fun m!697885 () Bool)

(assert (=> b!747930 m!697885))

(assert (=> b!747930 m!697885))

(declare-fun m!697887 () Bool)

(assert (=> b!747930 m!697887))

(assert (=> b!747938 m!697885))

(assert (=> b!747938 m!697885))

(declare-fun m!697889 () Bool)

(assert (=> b!747938 m!697889))

(assert (=> b!747938 m!697889))

(assert (=> b!747938 m!697885))

(declare-fun m!697891 () Bool)

(assert (=> b!747938 m!697891))

(declare-fun m!697893 () Bool)

(assert (=> b!747923 m!697893))

(declare-fun m!697895 () Bool)

(assert (=> b!747923 m!697895))

(declare-fun m!697897 () Bool)

(assert (=> b!747931 m!697897))

(assert (=> b!747920 m!697885))

(assert (=> b!747920 m!697885))

(assert (=> b!747920 m!697887))

(assert (=> b!747921 m!697885))

(assert (=> b!747921 m!697885))

(declare-fun m!697899 () Bool)

(assert (=> b!747921 m!697899))

(assert (=> b!747927 m!697885))

(assert (=> b!747927 m!697885))

(declare-fun m!697901 () Bool)

(assert (=> b!747927 m!697901))

(assert (=> b!747939 m!697893))

(assert (=> b!747939 m!697895))

(declare-fun m!697903 () Bool)

(assert (=> b!747924 m!697903))

(declare-fun m!697905 () Bool)

(assert (=> b!747926 m!697905))

(declare-fun m!697907 () Bool)

(assert (=> b!747925 m!697907))

(declare-fun m!697909 () Bool)

(assert (=> b!747925 m!697909))

(assert (=> b!747925 m!697893))

(declare-fun m!697911 () Bool)

(assert (=> b!747925 m!697911))

(declare-fun m!697913 () Bool)

(assert (=> b!747925 m!697913))

(assert (=> b!747925 m!697907))

(assert (=> b!747936 m!697885))

(assert (=> b!747936 m!697885))

(declare-fun m!697915 () Bool)

(assert (=> b!747936 m!697915))

(declare-fun m!697917 () Bool)

(assert (=> b!747922 m!697917))

(assert (=> b!747932 m!697885))

(assert (=> b!747932 m!697885))

(declare-fun m!697919 () Bool)

(assert (=> b!747932 m!697919))

(declare-fun m!697921 () Bool)

(assert (=> b!747932 m!697921))

(declare-fun m!697923 () Bool)

(assert (=> b!747932 m!697923))

(declare-fun m!697925 () Bool)

(assert (=> b!747919 m!697925))

(declare-fun m!697927 () Bool)

(assert (=> b!747937 m!697927))

(declare-fun m!697929 () Bool)

(assert (=> start!65530 m!697929))

(declare-fun m!697931 () Bool)

(assert (=> start!65530 m!697931))

(push 1)

(assert (not b!747936))

(assert (not b!747925))

(assert (not b!747937))

