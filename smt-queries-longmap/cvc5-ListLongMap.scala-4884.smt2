; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67350 () Bool)

(assert start!67350)

(declare-fun b!778852 () Bool)

(declare-fun e!433316 () Bool)

(assert (=> b!778852 (= e!433316 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42579 0))(
  ( (array!42580 (arr!20382 (Array (_ BitVec 32) (_ BitVec 64))) (size!20803 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42579)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7982 0))(
  ( (MissingZero!7982 (index!34296 (_ BitVec 32))) (Found!7982 (index!34297 (_ BitVec 32))) (Intermediate!7982 (undefined!8794 Bool) (index!34298 (_ BitVec 32)) (x!65247 (_ BitVec 32))) (Undefined!7982) (MissingVacant!7982 (index!34299 (_ BitVec 32))) )
))
(declare-fun lt!347001 () SeekEntryResult!7982)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42579 (_ BitVec 32)) SeekEntryResult!7982)

(assert (=> b!778852 (= lt!347001 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20382 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778853 () Bool)

(declare-fun res!526876 () Bool)

(declare-fun e!433320 () Bool)

(assert (=> b!778853 (=> (not res!526876) (not e!433320))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778853 (= res!526876 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20803 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20803 a!3186))))))

(declare-fun b!778854 () Bool)

(declare-fun res!526874 () Bool)

(declare-fun e!433318 () Bool)

(assert (=> b!778854 (=> (not res!526874) (not e!433318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778854 (= res!526874 (validKeyInArray!0 (select (arr!20382 a!3186) j!159)))))

(declare-fun b!778855 () Bool)

(declare-fun e!433319 () Bool)

(assert (=> b!778855 (= e!433319 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20382 a!3186) j!159) a!3186 mask!3328) (Found!7982 j!159)))))

(declare-fun b!778857 () Bool)

(declare-fun res!526875 () Bool)

(assert (=> b!778857 (=> (not res!526875) (not e!433318))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!778857 (= res!526875 (validKeyInArray!0 k!2102))))

(declare-fun b!778858 () Bool)

(assert (=> b!778858 (= e!433318 e!433320)))

(declare-fun res!526877 () Bool)

(assert (=> b!778858 (=> (not res!526877) (not e!433320))))

(declare-fun lt!346998 () SeekEntryResult!7982)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778858 (= res!526877 (or (= lt!346998 (MissingZero!7982 i!1173)) (= lt!346998 (MissingVacant!7982 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42579 (_ BitVec 32)) SeekEntryResult!7982)

(assert (=> b!778858 (= lt!346998 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!778859 () Bool)

(declare-fun res!526886 () Bool)

(assert (=> b!778859 (=> (not res!526886) (not e!433318))))

(declare-fun arrayContainsKey!0 (array!42579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778859 (= res!526886 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778860 () Bool)

(declare-fun res!526883 () Bool)

(assert (=> b!778860 (=> (not res!526883) (not e!433318))))

(assert (=> b!778860 (= res!526883 (and (= (size!20803 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20803 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20803 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778861 () Bool)

(declare-fun e!433317 () Bool)

(assert (=> b!778861 (= e!433320 e!433317)))

(declare-fun res!526885 () Bool)

(assert (=> b!778861 (=> (not res!526885) (not e!433317))))

(declare-fun lt!346996 () SeekEntryResult!7982)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42579 (_ BitVec 32)) SeekEntryResult!7982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778861 (= res!526885 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20382 a!3186) j!159) mask!3328) (select (arr!20382 a!3186) j!159) a!3186 mask!3328) lt!346996))))

(assert (=> b!778861 (= lt!346996 (Intermediate!7982 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778862 () Bool)

(assert (=> b!778862 (= e!433319 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20382 a!3186) j!159) a!3186 mask!3328) lt!346996))))

(declare-fun res!526880 () Bool)

(assert (=> start!67350 (=> (not res!526880) (not e!433318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67350 (= res!526880 (validMask!0 mask!3328))))

(assert (=> start!67350 e!433318))

(assert (=> start!67350 true))

(declare-fun array_inv!16178 (array!42579) Bool)

(assert (=> start!67350 (array_inv!16178 a!3186)))

(declare-fun lt!346997 () SeekEntryResult!7982)

(declare-fun b!778856 () Bool)

(declare-fun e!433322 () Bool)

(assert (=> b!778856 (= e!433322 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20382 a!3186) j!159) a!3186 mask!3328) lt!346997))))

(declare-fun b!778863 () Bool)

(declare-fun e!433315 () Bool)

(assert (=> b!778863 (= e!433315 e!433322)))

(declare-fun res!526881 () Bool)

(assert (=> b!778863 (=> (not res!526881) (not e!433322))))

(assert (=> b!778863 (= res!526881 (= (seekEntryOrOpen!0 (select (arr!20382 a!3186) j!159) a!3186 mask!3328) lt!346997))))

(assert (=> b!778863 (= lt!346997 (Found!7982 j!159))))

(declare-fun b!778864 () Bool)

(declare-fun res!526884 () Bool)

(assert (=> b!778864 (=> (not res!526884) (not e!433317))))

(assert (=> b!778864 (= res!526884 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20382 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778865 () Bool)

(declare-fun res!526879 () Bool)

(assert (=> b!778865 (=> (not res!526879) (not e!433320))))

(declare-datatypes ((List!14384 0))(
  ( (Nil!14381) (Cons!14380 (h!15494 (_ BitVec 64)) (t!20699 List!14384)) )
))
(declare-fun arrayNoDuplicates!0 (array!42579 (_ BitVec 32) List!14384) Bool)

(assert (=> b!778865 (= res!526879 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14381))))

(declare-fun b!778866 () Bool)

(declare-fun e!433314 () Bool)

(assert (=> b!778866 (= e!433314 (not e!433316))))

(declare-fun res!526878 () Bool)

(assert (=> b!778866 (=> res!526878 e!433316)))

(declare-fun lt!346995 () SeekEntryResult!7982)

(assert (=> b!778866 (= res!526878 (or (not (is-Intermediate!7982 lt!346995)) (bvslt x!1131 (x!65247 lt!346995)) (not (= x!1131 (x!65247 lt!346995))) (not (= index!1321 (index!34298 lt!346995)))))))

(assert (=> b!778866 e!433315))

(declare-fun res!526889 () Bool)

(assert (=> b!778866 (=> (not res!526889) (not e!433315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42579 (_ BitVec 32)) Bool)

(assert (=> b!778866 (= res!526889 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26858 0))(
  ( (Unit!26859) )
))
(declare-fun lt!346999 () Unit!26858)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26858)

(assert (=> b!778866 (= lt!346999 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778867 () Bool)

(assert (=> b!778867 (= e!433317 e!433314)))

(declare-fun res!526887 () Bool)

(assert (=> b!778867 (=> (not res!526887) (not e!433314))))

(declare-fun lt!347000 () SeekEntryResult!7982)

(assert (=> b!778867 (= res!526887 (= lt!347000 lt!346995))))

(declare-fun lt!347003 () array!42579)

(declare-fun lt!347002 () (_ BitVec 64))

(assert (=> b!778867 (= lt!346995 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347002 lt!347003 mask!3328))))

(assert (=> b!778867 (= lt!347000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347002 mask!3328) lt!347002 lt!347003 mask!3328))))

(assert (=> b!778867 (= lt!347002 (select (store (arr!20382 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!778867 (= lt!347003 (array!42580 (store (arr!20382 a!3186) i!1173 k!2102) (size!20803 a!3186)))))

(declare-fun b!778868 () Bool)

(declare-fun res!526888 () Bool)

(assert (=> b!778868 (=> (not res!526888) (not e!433320))))

(assert (=> b!778868 (= res!526888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778869 () Bool)

(declare-fun res!526882 () Bool)

(assert (=> b!778869 (=> (not res!526882) (not e!433317))))

(assert (=> b!778869 (= res!526882 e!433319)))

(declare-fun c!86392 () Bool)

(assert (=> b!778869 (= c!86392 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67350 res!526880) b!778860))

(assert (= (and b!778860 res!526883) b!778854))

(assert (= (and b!778854 res!526874) b!778857))

(assert (= (and b!778857 res!526875) b!778859))

(assert (= (and b!778859 res!526886) b!778858))

(assert (= (and b!778858 res!526877) b!778868))

(assert (= (and b!778868 res!526888) b!778865))

(assert (= (and b!778865 res!526879) b!778853))

(assert (= (and b!778853 res!526876) b!778861))

(assert (= (and b!778861 res!526885) b!778864))

(assert (= (and b!778864 res!526884) b!778869))

(assert (= (and b!778869 c!86392) b!778862))

(assert (= (and b!778869 (not c!86392)) b!778855))

(assert (= (and b!778869 res!526882) b!778867))

(assert (= (and b!778867 res!526887) b!778866))

(assert (= (and b!778866 res!526889) b!778863))

(assert (= (and b!778863 res!526881) b!778856))

(assert (= (and b!778866 (not res!526878)) b!778852))

(declare-fun m!722441 () Bool)

(assert (=> b!778863 m!722441))

(assert (=> b!778863 m!722441))

(declare-fun m!722443 () Bool)

(assert (=> b!778863 m!722443))

(assert (=> b!778854 m!722441))

(assert (=> b!778854 m!722441))

(declare-fun m!722445 () Bool)

(assert (=> b!778854 m!722445))

(declare-fun m!722447 () Bool)

(assert (=> b!778864 m!722447))

(declare-fun m!722449 () Bool)

(assert (=> b!778868 m!722449))

(declare-fun m!722451 () Bool)

(assert (=> b!778865 m!722451))

(assert (=> b!778856 m!722441))

(assert (=> b!778856 m!722441))

(declare-fun m!722453 () Bool)

(assert (=> b!778856 m!722453))

(assert (=> b!778861 m!722441))

(assert (=> b!778861 m!722441))

(declare-fun m!722455 () Bool)

(assert (=> b!778861 m!722455))

(assert (=> b!778861 m!722455))

(assert (=> b!778861 m!722441))

(declare-fun m!722457 () Bool)

(assert (=> b!778861 m!722457))

(declare-fun m!722459 () Bool)

(assert (=> b!778857 m!722459))

(assert (=> b!778852 m!722441))

(assert (=> b!778852 m!722441))

(declare-fun m!722461 () Bool)

(assert (=> b!778852 m!722461))

(declare-fun m!722463 () Bool)

(assert (=> b!778858 m!722463))

(declare-fun m!722465 () Bool)

(assert (=> b!778866 m!722465))

(declare-fun m!722467 () Bool)

(assert (=> b!778866 m!722467))

(assert (=> b!778862 m!722441))

(assert (=> b!778862 m!722441))

(declare-fun m!722469 () Bool)

(assert (=> b!778862 m!722469))

(assert (=> b!778855 m!722441))

(assert (=> b!778855 m!722441))

(assert (=> b!778855 m!722461))

(declare-fun m!722471 () Bool)

(assert (=> start!67350 m!722471))

(declare-fun m!722473 () Bool)

(assert (=> start!67350 m!722473))

(declare-fun m!722475 () Bool)

(assert (=> b!778859 m!722475))

(declare-fun m!722477 () Bool)

(assert (=> b!778867 m!722477))

(declare-fun m!722479 () Bool)

(assert (=> b!778867 m!722479))

(declare-fun m!722481 () Bool)

(assert (=> b!778867 m!722481))

(declare-fun m!722483 () Bool)

(assert (=> b!778867 m!722483))

(declare-fun m!722485 () Bool)

(assert (=> b!778867 m!722485))

(assert (=> b!778867 m!722483))

(push 1)

