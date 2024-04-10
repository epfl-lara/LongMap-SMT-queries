; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65488 () Bool)

(assert start!65488)

(declare-fun b!746636 () Bool)

(declare-fun res!503381 () Bool)

(declare-fun e!416940 () Bool)

(assert (=> b!746636 (=> (not res!503381) (not e!416940))))

(declare-datatypes ((array!41661 0))(
  ( (array!41662 (arr!19944 (Array (_ BitVec 32) (_ BitVec 64))) (size!20365 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41661)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41661 (_ BitVec 32)) Bool)

(assert (=> b!746636 (= res!503381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746637 () Bool)

(declare-fun e!416942 () Bool)

(assert (=> b!746637 (= e!416942 true)))

(declare-datatypes ((SeekEntryResult!7544 0))(
  ( (MissingZero!7544 (index!32544 (_ BitVec 32))) (Found!7544 (index!32545 (_ BitVec 32))) (Intermediate!7544 (undefined!8356 Bool) (index!32546 (_ BitVec 32)) (x!63494 (_ BitVec 32))) (Undefined!7544) (MissingVacant!7544 (index!32547 (_ BitVec 32))) )
))
(declare-fun lt!331830 () SeekEntryResult!7544)

(declare-fun lt!331833 () SeekEntryResult!7544)

(assert (=> b!746637 (= lt!331830 lt!331833)))

(declare-fun b!746638 () Bool)

(declare-fun e!416945 () Bool)

(assert (=> b!746638 (= e!416945 e!416942)))

(declare-fun res!503385 () Bool)

(assert (=> b!746638 (=> res!503385 e!416942)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!331827 () SeekEntryResult!7544)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lt!331828 () (_ BitVec 64))

(assert (=> b!746638 (= res!503385 (or (not (= lt!331833 lt!331827)) (= (select (store (arr!19944 a!3186) i!1173 k!2102) index!1321) lt!331828) (not (= (select (store (arr!19944 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41661 (_ BitVec 32)) SeekEntryResult!7544)

(assert (=> b!746638 (= lt!331833 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19944 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746639 () Bool)

(declare-fun res!503387 () Bool)

(assert (=> b!746639 (=> (not res!503387) (not e!416940))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746639 (= res!503387 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20365 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20365 a!3186))))))

(declare-fun b!746640 () Bool)

(declare-fun e!416946 () Bool)

(assert (=> b!746640 (= e!416946 (not e!416945))))

(declare-fun res!503391 () Bool)

(assert (=> b!746640 (=> res!503391 e!416945)))

(declare-fun lt!331834 () SeekEntryResult!7544)

(assert (=> b!746640 (= res!503391 (or (not (is-Intermediate!7544 lt!331834)) (bvslt x!1131 (x!63494 lt!331834)) (not (= x!1131 (x!63494 lt!331834))) (not (= index!1321 (index!32546 lt!331834)))))))

(declare-fun e!416944 () Bool)

(assert (=> b!746640 e!416944))

(declare-fun res!503393 () Bool)

(assert (=> b!746640 (=> (not res!503393) (not e!416944))))

(assert (=> b!746640 (= res!503393 (= lt!331830 lt!331827))))

(assert (=> b!746640 (= lt!331827 (Found!7544 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41661 (_ BitVec 32)) SeekEntryResult!7544)

(assert (=> b!746640 (= lt!331830 (seekEntryOrOpen!0 (select (arr!19944 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746640 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25568 0))(
  ( (Unit!25569) )
))
(declare-fun lt!331831 () Unit!25568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25568)

(assert (=> b!746640 (= lt!331831 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746641 () Bool)

(declare-fun res!503392 () Bool)

(declare-fun e!416941 () Bool)

(assert (=> b!746641 (=> (not res!503392) (not e!416941))))

(declare-fun e!416948 () Bool)

(assert (=> b!746641 (= res!503392 e!416948)))

(declare-fun c!82009 () Bool)

(assert (=> b!746641 (= c!82009 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746642 () Bool)

(declare-fun res!503382 () Bool)

(declare-fun e!416943 () Bool)

(assert (=> b!746642 (=> (not res!503382) (not e!416943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746642 (= res!503382 (validKeyInArray!0 (select (arr!19944 a!3186) j!159)))))

(declare-fun b!746643 () Bool)

(assert (=> b!746643 (= e!416943 e!416940)))

(declare-fun res!503378 () Bool)

(assert (=> b!746643 (=> (not res!503378) (not e!416940))))

(declare-fun lt!331829 () SeekEntryResult!7544)

(assert (=> b!746643 (= res!503378 (or (= lt!331829 (MissingZero!7544 i!1173)) (= lt!331829 (MissingVacant!7544 i!1173))))))

(assert (=> b!746643 (= lt!331829 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!746644 () Bool)

(declare-fun res!503379 () Bool)

(assert (=> b!746644 (=> (not res!503379) (not e!416940))))

(declare-datatypes ((List!13946 0))(
  ( (Nil!13943) (Cons!13942 (h!15014 (_ BitVec 64)) (t!20261 List!13946)) )
))
(declare-fun arrayNoDuplicates!0 (array!41661 (_ BitVec 32) List!13946) Bool)

(assert (=> b!746644 (= res!503379 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13943))))

(declare-fun res!503380 () Bool)

(assert (=> start!65488 (=> (not res!503380) (not e!416943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65488 (= res!503380 (validMask!0 mask!3328))))

(assert (=> start!65488 e!416943))

(assert (=> start!65488 true))

(declare-fun array_inv!15740 (array!41661) Bool)

(assert (=> start!65488 (array_inv!15740 a!3186)))

(declare-fun b!746635 () Bool)

(declare-fun lt!331832 () SeekEntryResult!7544)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41661 (_ BitVec 32)) SeekEntryResult!7544)

(assert (=> b!746635 (= e!416948 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19944 a!3186) j!159) a!3186 mask!3328) lt!331832))))

(declare-fun b!746645 () Bool)

(assert (=> b!746645 (= e!416941 e!416946)))

(declare-fun res!503386 () Bool)

(assert (=> b!746645 (=> (not res!503386) (not e!416946))))

(declare-fun lt!331826 () SeekEntryResult!7544)

(assert (=> b!746645 (= res!503386 (= lt!331826 lt!331834))))

(declare-fun lt!331835 () array!41661)

(assert (=> b!746645 (= lt!331834 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331828 lt!331835 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746645 (= lt!331826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331828 mask!3328) lt!331828 lt!331835 mask!3328))))

(assert (=> b!746645 (= lt!331828 (select (store (arr!19944 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746645 (= lt!331835 (array!41662 (store (arr!19944 a!3186) i!1173 k!2102) (size!20365 a!3186)))))

(declare-fun b!746646 () Bool)

(declare-fun res!503389 () Bool)

(assert (=> b!746646 (=> (not res!503389) (not e!416943))))

(declare-fun arrayContainsKey!0 (array!41661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746646 (= res!503389 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746647 () Bool)

(declare-fun res!503383 () Bool)

(assert (=> b!746647 (=> (not res!503383) (not e!416943))))

(assert (=> b!746647 (= res!503383 (validKeyInArray!0 k!2102))))

(declare-fun b!746648 () Bool)

(assert (=> b!746648 (= e!416948 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19944 a!3186) j!159) a!3186 mask!3328) (Found!7544 j!159)))))

(declare-fun b!746649 () Bool)

(declare-fun res!503388 () Bool)

(assert (=> b!746649 (=> (not res!503388) (not e!416941))))

(assert (=> b!746649 (= res!503388 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19944 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746650 () Bool)

(assert (=> b!746650 (= e!416940 e!416941)))

(declare-fun res!503390 () Bool)

(assert (=> b!746650 (=> (not res!503390) (not e!416941))))

(assert (=> b!746650 (= res!503390 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19944 a!3186) j!159) mask!3328) (select (arr!19944 a!3186) j!159) a!3186 mask!3328) lt!331832))))

(assert (=> b!746650 (= lt!331832 (Intermediate!7544 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746651 () Bool)

(declare-fun res!503384 () Bool)

(assert (=> b!746651 (=> (not res!503384) (not e!416943))))

(assert (=> b!746651 (= res!503384 (and (= (size!20365 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20365 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20365 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746652 () Bool)

(assert (=> b!746652 (= e!416944 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19944 a!3186) j!159) a!3186 mask!3328) lt!331827))))

(assert (= (and start!65488 res!503380) b!746651))

(assert (= (and b!746651 res!503384) b!746642))

(assert (= (and b!746642 res!503382) b!746647))

(assert (= (and b!746647 res!503383) b!746646))

(assert (= (and b!746646 res!503389) b!746643))

(assert (= (and b!746643 res!503378) b!746636))

(assert (= (and b!746636 res!503381) b!746644))

(assert (= (and b!746644 res!503379) b!746639))

(assert (= (and b!746639 res!503387) b!746650))

(assert (= (and b!746650 res!503390) b!746649))

(assert (= (and b!746649 res!503388) b!746641))

(assert (= (and b!746641 c!82009) b!746635))

(assert (= (and b!746641 (not c!82009)) b!746648))

(assert (= (and b!746641 res!503392) b!746645))

(assert (= (and b!746645 res!503386) b!746640))

(assert (= (and b!746640 res!503393) b!746652))

(assert (= (and b!746640 (not res!503391)) b!746638))

(assert (= (and b!746638 (not res!503385)) b!746637))

(declare-fun m!696871 () Bool)

(assert (=> b!746645 m!696871))

(declare-fun m!696873 () Bool)

(assert (=> b!746645 m!696873))

(assert (=> b!746645 m!696871))

(declare-fun m!696875 () Bool)

(assert (=> b!746645 m!696875))

(declare-fun m!696877 () Bool)

(assert (=> b!746645 m!696877))

(declare-fun m!696879 () Bool)

(assert (=> b!746645 m!696879))

(declare-fun m!696881 () Bool)

(assert (=> start!65488 m!696881))

(declare-fun m!696883 () Bool)

(assert (=> start!65488 m!696883))

(declare-fun m!696885 () Bool)

(assert (=> b!746640 m!696885))

(assert (=> b!746640 m!696885))

(declare-fun m!696887 () Bool)

(assert (=> b!746640 m!696887))

(declare-fun m!696889 () Bool)

(assert (=> b!746640 m!696889))

(declare-fun m!696891 () Bool)

(assert (=> b!746640 m!696891))

(assert (=> b!746652 m!696885))

(assert (=> b!746652 m!696885))

(declare-fun m!696893 () Bool)

(assert (=> b!746652 m!696893))

(declare-fun m!696895 () Bool)

(assert (=> b!746636 m!696895))

(declare-fun m!696897 () Bool)

(assert (=> b!746644 m!696897))

(assert (=> b!746648 m!696885))

(assert (=> b!746648 m!696885))

(declare-fun m!696899 () Bool)

(assert (=> b!746648 m!696899))

(declare-fun m!696901 () Bool)

(assert (=> b!746649 m!696901))

(declare-fun m!696903 () Bool)

(assert (=> b!746647 m!696903))

(declare-fun m!696905 () Bool)

(assert (=> b!746643 m!696905))

(assert (=> b!746635 m!696885))

(assert (=> b!746635 m!696885))

(declare-fun m!696907 () Bool)

(assert (=> b!746635 m!696907))

(assert (=> b!746642 m!696885))

(assert (=> b!746642 m!696885))

(declare-fun m!696909 () Bool)

(assert (=> b!746642 m!696909))

(declare-fun m!696911 () Bool)

(assert (=> b!746646 m!696911))

(assert (=> b!746638 m!696875))

(declare-fun m!696913 () Bool)

(assert (=> b!746638 m!696913))

(assert (=> b!746638 m!696885))

(assert (=> b!746638 m!696885))

(assert (=> b!746638 m!696899))

(assert (=> b!746650 m!696885))

(assert (=> b!746650 m!696885))

(declare-fun m!696915 () Bool)

(assert (=> b!746650 m!696915))

(assert (=> b!746650 m!696915))

(assert (=> b!746650 m!696885))

(declare-fun m!696917 () Bool)

(assert (=> b!746650 m!696917))

(push 1)

