; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65650 () Bool)

(assert start!65650)

(declare-fun b!751838 () Bool)

(declare-fun e!419395 () Bool)

(declare-fun e!419397 () Bool)

(assert (=> b!751838 (= e!419395 (not e!419397))))

(declare-fun res!507646 () Bool)

(assert (=> b!751838 (=> res!507646 e!419397)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7625 0))(
  ( (MissingZero!7625 (index!32868 (_ BitVec 32))) (Found!7625 (index!32869 (_ BitVec 32))) (Intermediate!7625 (undefined!8437 Bool) (index!32870 (_ BitVec 32)) (x!63791 (_ BitVec 32))) (Undefined!7625) (MissingVacant!7625 (index!32871 (_ BitVec 32))) )
))
(declare-fun lt!334396 () SeekEntryResult!7625)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!751838 (= res!507646 (or (not (is-Intermediate!7625 lt!334396)) (bvslt x!1131 (x!63791 lt!334396)) (not (= x!1131 (x!63791 lt!334396))) (not (= index!1321 (index!32870 lt!334396)))))))

(declare-fun e!419401 () Bool)

(assert (=> b!751838 e!419401))

(declare-fun res!507653 () Bool)

(assert (=> b!751838 (=> (not res!507653) (not e!419401))))

(declare-fun lt!334389 () SeekEntryResult!7625)

(declare-fun lt!334388 () SeekEntryResult!7625)

(assert (=> b!751838 (= res!507653 (= lt!334389 lt!334388))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!751838 (= lt!334388 (Found!7625 j!159))))

(declare-datatypes ((array!41823 0))(
  ( (array!41824 (arr!20025 (Array (_ BitVec 32) (_ BitVec 64))) (size!20446 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41823)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41823 (_ BitVec 32)) SeekEntryResult!7625)

(assert (=> b!751838 (= lt!334389 (seekEntryOrOpen!0 (select (arr!20025 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41823 (_ BitVec 32)) Bool)

(assert (=> b!751838 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25880 0))(
  ( (Unit!25881) )
))
(declare-fun lt!334392 () Unit!25880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25880)

(assert (=> b!751838 (= lt!334392 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751839 () Bool)

(declare-fun res!507641 () Bool)

(declare-fun e!419394 () Bool)

(assert (=> b!751839 (=> (not res!507641) (not e!419394))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751839 (= res!507641 (and (= (size!20446 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20446 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20446 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751840 () Bool)

(declare-fun res!507659 () Bool)

(declare-fun e!419405 () Bool)

(assert (=> b!751840 (=> (not res!507659) (not e!419405))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751840 (= res!507659 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20446 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20446 a!3186))))))

(declare-fun b!751841 () Bool)

(declare-fun e!419402 () Bool)

(assert (=> b!751841 (= e!419397 e!419402)))

(declare-fun res!507658 () Bool)

(assert (=> b!751841 (=> res!507658 e!419402)))

(declare-fun lt!334395 () SeekEntryResult!7625)

(assert (=> b!751841 (= res!507658 (not (= lt!334395 lt!334388)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41823 (_ BitVec 32)) SeekEntryResult!7625)

(assert (=> b!751841 (= lt!334395 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20025 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!751842 () Bool)

(assert (=> b!751842 (= e!419394 e!419405)))

(declare-fun res!507656 () Bool)

(assert (=> b!751842 (=> (not res!507656) (not e!419405))))

(declare-fun lt!334391 () SeekEntryResult!7625)

(assert (=> b!751842 (= res!507656 (or (= lt!334391 (MissingZero!7625 i!1173)) (= lt!334391 (MissingVacant!7625 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!751842 (= lt!334391 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!751843 () Bool)

(declare-fun res!507650 () Bool)

(declare-fun e!419403 () Bool)

(assert (=> b!751843 (=> (not res!507650) (not e!419403))))

(assert (=> b!751843 (= res!507650 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20025 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!507654 () Bool)

(assert (=> start!65650 (=> (not res!507654) (not e!419394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65650 (= res!507654 (validMask!0 mask!3328))))

(assert (=> start!65650 e!419394))

(assert (=> start!65650 true))

(declare-fun array_inv!15821 (array!41823) Bool)

(assert (=> start!65650 (array_inv!15821 a!3186)))

(declare-fun b!751844 () Bool)

(declare-fun e!419399 () Bool)

(assert (=> b!751844 (= e!419399 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun e!419400 () Bool)

(assert (=> b!751844 e!419400))

(declare-fun res!507642 () Bool)

(assert (=> b!751844 (=> (not res!507642) (not e!419400))))

(declare-fun lt!334386 () (_ BitVec 64))

(assert (=> b!751844 (= res!507642 (= lt!334386 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334390 () Unit!25880)

(declare-fun e!419396 () Unit!25880)

(assert (=> b!751844 (= lt!334390 e!419396)))

(declare-fun c!82479 () Bool)

(assert (=> b!751844 (= c!82479 (= lt!334386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751845 () Bool)

(assert (=> b!751845 (= e!419403 e!419395)))

(declare-fun res!507647 () Bool)

(assert (=> b!751845 (=> (not res!507647) (not e!419395))))

(declare-fun lt!334394 () SeekEntryResult!7625)

(assert (=> b!751845 (= res!507647 (= lt!334394 lt!334396))))

(declare-fun lt!334393 () (_ BitVec 64))

(declare-fun lt!334387 () array!41823)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41823 (_ BitVec 32)) SeekEntryResult!7625)

(assert (=> b!751845 (= lt!334396 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334393 lt!334387 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751845 (= lt!334394 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334393 mask!3328) lt!334393 lt!334387 mask!3328))))

(assert (=> b!751845 (= lt!334393 (select (store (arr!20025 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!751845 (= lt!334387 (array!41824 (store (arr!20025 a!3186) i!1173 k!2102) (size!20446 a!3186)))))

(declare-fun e!419398 () Bool)

(declare-fun b!751846 () Bool)

(declare-fun lt!334397 () SeekEntryResult!7625)

(assert (=> b!751846 (= e!419398 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20025 a!3186) j!159) a!3186 mask!3328) lt!334397))))

(declare-fun b!751847 () Bool)

(declare-fun res!507655 () Bool)

(assert (=> b!751847 (=> (not res!507655) (not e!419394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751847 (= res!507655 (validKeyInArray!0 (select (arr!20025 a!3186) j!159)))))

(declare-fun b!751848 () Bool)

(declare-fun res!507652 () Bool)

(assert (=> b!751848 (=> (not res!507652) (not e!419394))))

(assert (=> b!751848 (= res!507652 (validKeyInArray!0 k!2102))))

(declare-fun b!751849 () Bool)

(declare-fun res!507649 () Bool)

(assert (=> b!751849 (=> (not res!507649) (not e!419403))))

(assert (=> b!751849 (= res!507649 e!419398)))

(declare-fun c!82480 () Bool)

(assert (=> b!751849 (= c!82480 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751850 () Bool)

(declare-fun res!507651 () Bool)

(assert (=> b!751850 (=> (not res!507651) (not e!419400))))

(assert (=> b!751850 (= res!507651 (= (seekEntryOrOpen!0 lt!334393 lt!334387 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334393 lt!334387 mask!3328)))))

(declare-fun b!751851 () Bool)

(assert (=> b!751851 (= e!419405 e!419403)))

(declare-fun res!507648 () Bool)

(assert (=> b!751851 (=> (not res!507648) (not e!419403))))

(assert (=> b!751851 (= res!507648 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20025 a!3186) j!159) mask!3328) (select (arr!20025 a!3186) j!159) a!3186 mask!3328) lt!334397))))

(assert (=> b!751851 (= lt!334397 (Intermediate!7625 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751852 () Bool)

(declare-fun res!507657 () Bool)

(assert (=> b!751852 (=> (not res!507657) (not e!419405))))

(assert (=> b!751852 (= res!507657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751853 () Bool)

(assert (=> b!751853 (= e!419398 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20025 a!3186) j!159) a!3186 mask!3328) (Found!7625 j!159)))))

(declare-fun b!751854 () Bool)

(declare-fun res!507644 () Bool)

(assert (=> b!751854 (=> (not res!507644) (not e!419394))))

(declare-fun arrayContainsKey!0 (array!41823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751854 (= res!507644 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751855 () Bool)

(declare-fun res!507643 () Bool)

(assert (=> b!751855 (=> (not res!507643) (not e!419405))))

(declare-datatypes ((List!14027 0))(
  ( (Nil!14024) (Cons!14023 (h!15095 (_ BitVec 64)) (t!20342 List!14027)) )
))
(declare-fun arrayNoDuplicates!0 (array!41823 (_ BitVec 32) List!14027) Bool)

(assert (=> b!751855 (= res!507643 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14024))))

(declare-fun b!751856 () Bool)

(declare-fun Unit!25882 () Unit!25880)

(assert (=> b!751856 (= e!419396 Unit!25882)))

(declare-fun b!751857 () Bool)

(assert (=> b!751857 (= e!419402 e!419399)))

(declare-fun res!507645 () Bool)

(assert (=> b!751857 (=> res!507645 e!419399)))

(assert (=> b!751857 (= res!507645 (= lt!334386 lt!334393))))

(assert (=> b!751857 (= lt!334386 (select (store (arr!20025 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!751858 () Bool)

(assert (=> b!751858 (= e!419401 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20025 a!3186) j!159) a!3186 mask!3328) lt!334388))))

(declare-fun b!751859 () Bool)

(assert (=> b!751859 (= e!419400 (= lt!334389 lt!334395))))

(declare-fun b!751860 () Bool)

(declare-fun Unit!25883 () Unit!25880)

(assert (=> b!751860 (= e!419396 Unit!25883)))

(assert (=> b!751860 false))

(assert (= (and start!65650 res!507654) b!751839))

(assert (= (and b!751839 res!507641) b!751847))

(assert (= (and b!751847 res!507655) b!751848))

(assert (= (and b!751848 res!507652) b!751854))

(assert (= (and b!751854 res!507644) b!751842))

(assert (= (and b!751842 res!507656) b!751852))

(assert (= (and b!751852 res!507657) b!751855))

(assert (= (and b!751855 res!507643) b!751840))

(assert (= (and b!751840 res!507659) b!751851))

(assert (= (and b!751851 res!507648) b!751843))

(assert (= (and b!751843 res!507650) b!751849))

(assert (= (and b!751849 c!82480) b!751846))

(assert (= (and b!751849 (not c!82480)) b!751853))

(assert (= (and b!751849 res!507649) b!751845))

(assert (= (and b!751845 res!507647) b!751838))

(assert (= (and b!751838 res!507653) b!751858))

(assert (= (and b!751838 (not res!507646)) b!751841))

(assert (= (and b!751841 (not res!507658)) b!751857))

(assert (= (and b!751857 (not res!507645)) b!751844))

(assert (= (and b!751844 c!82479) b!751860))

(assert (= (and b!751844 (not c!82479)) b!751856))

(assert (= (and b!751844 res!507642) b!751850))

(assert (= (and b!751850 res!507651) b!751859))

(declare-fun m!700927 () Bool)

(assert (=> b!751850 m!700927))

(declare-fun m!700929 () Bool)

(assert (=> b!751850 m!700929))

(declare-fun m!700931 () Bool)

(assert (=> b!751845 m!700931))

(declare-fun m!700933 () Bool)

(assert (=> b!751845 m!700933))

(declare-fun m!700935 () Bool)

(assert (=> b!751845 m!700935))

(assert (=> b!751845 m!700933))

(declare-fun m!700937 () Bool)

(assert (=> b!751845 m!700937))

(declare-fun m!700939 () Bool)

(assert (=> b!751845 m!700939))

(declare-fun m!700941 () Bool)

(assert (=> b!751853 m!700941))

(assert (=> b!751853 m!700941))

(declare-fun m!700943 () Bool)

(assert (=> b!751853 m!700943))

(declare-fun m!700945 () Bool)

(assert (=> b!751842 m!700945))

(assert (=> b!751851 m!700941))

(assert (=> b!751851 m!700941))

(declare-fun m!700947 () Bool)

(assert (=> b!751851 m!700947))

(assert (=> b!751851 m!700947))

(assert (=> b!751851 m!700941))

(declare-fun m!700949 () Bool)

(assert (=> b!751851 m!700949))

(declare-fun m!700951 () Bool)

(assert (=> b!751854 m!700951))

(assert (=> b!751857 m!700937))

(declare-fun m!700953 () Bool)

(assert (=> b!751857 m!700953))

(assert (=> b!751838 m!700941))

(assert (=> b!751838 m!700941))

(declare-fun m!700955 () Bool)

(assert (=> b!751838 m!700955))

(declare-fun m!700957 () Bool)

(assert (=> b!751838 m!700957))

(declare-fun m!700959 () Bool)

(assert (=> b!751838 m!700959))

(assert (=> b!751847 m!700941))

(assert (=> b!751847 m!700941))

(declare-fun m!700961 () Bool)

(assert (=> b!751847 m!700961))

(assert (=> b!751841 m!700941))

(assert (=> b!751841 m!700941))

(assert (=> b!751841 m!700943))

(assert (=> b!751846 m!700941))

(assert (=> b!751846 m!700941))

(declare-fun m!700963 () Bool)

(assert (=> b!751846 m!700963))

(declare-fun m!700965 () Bool)

(assert (=> b!751855 m!700965))

(declare-fun m!700967 () Bool)

(assert (=> b!751843 m!700967))

(assert (=> b!751858 m!700941))

(assert (=> b!751858 m!700941))

(declare-fun m!700969 () Bool)

(assert (=> b!751858 m!700969))

(declare-fun m!700971 () Bool)

(assert (=> b!751848 m!700971))

(declare-fun m!700973 () Bool)

(assert (=> start!65650 m!700973))

(declare-fun m!700975 () Bool)

(assert (=> start!65650 m!700975))

(declare-fun m!700977 () Bool)

(assert (=> b!751852 m!700977))

(push 1)

