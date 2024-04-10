; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67354 () Bool)

(assert start!67354)

(declare-fun b!778960 () Bool)

(declare-fun e!433371 () Bool)

(declare-fun e!433372 () Bool)

(assert (=> b!778960 (= e!433371 e!433372)))

(declare-fun res!526980 () Bool)

(assert (=> b!778960 (=> (not res!526980) (not e!433372))))

(declare-datatypes ((array!42583 0))(
  ( (array!42584 (arr!20384 (Array (_ BitVec 32) (_ BitVec 64))) (size!20805 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42583)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7984 0))(
  ( (MissingZero!7984 (index!34304 (_ BitVec 32))) (Found!7984 (index!34305 (_ BitVec 32))) (Intermediate!7984 (undefined!8796 Bool) (index!34306 (_ BitVec 32)) (x!65249 (_ BitVec 32))) (Undefined!7984) (MissingVacant!7984 (index!34307 (_ BitVec 32))) )
))
(declare-fun lt!347052 () SeekEntryResult!7984)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42583 (_ BitVec 32)) SeekEntryResult!7984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778960 (= res!526980 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20384 a!3186) j!159) mask!3328) (select (arr!20384 a!3186) j!159) a!3186 mask!3328) lt!347052))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778960 (= lt!347052 (Intermediate!7984 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778961 () Bool)

(declare-fun res!526981 () Bool)

(declare-fun e!433369 () Bool)

(assert (=> b!778961 (=> (not res!526981) (not e!433369))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778961 (= res!526981 (and (= (size!20805 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20805 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20805 a!3186)) (not (= i!1173 j!159))))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!778962 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!433374 () Bool)

(assert (=> b!778962 (= e!433374 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20384 a!3186) j!159) a!3186 mask!3328) lt!347052))))

(declare-fun b!778963 () Bool)

(declare-fun e!433370 () Bool)

(assert (=> b!778963 (= e!433372 e!433370)))

(declare-fun res!526976 () Bool)

(assert (=> b!778963 (=> (not res!526976) (not e!433370))))

(declare-fun lt!347057 () SeekEntryResult!7984)

(declare-fun lt!347050 () SeekEntryResult!7984)

(assert (=> b!778963 (= res!526976 (= lt!347057 lt!347050))))

(declare-fun lt!347054 () (_ BitVec 64))

(declare-fun lt!347049 () array!42583)

(assert (=> b!778963 (= lt!347050 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347054 lt!347049 mask!3328))))

(assert (=> b!778963 (= lt!347057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347054 mask!3328) lt!347054 lt!347049 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!778963 (= lt!347054 (select (store (arr!20384 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!778963 (= lt!347049 (array!42584 (store (arr!20384 a!3186) i!1173 k!2102) (size!20805 a!3186)))))

(declare-fun b!778964 () Bool)

(declare-fun res!526974 () Bool)

(assert (=> b!778964 (=> (not res!526974) (not e!433371))))

(assert (=> b!778964 (= res!526974 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20805 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20805 a!3186))))))

(declare-fun b!778965 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42583 (_ BitVec 32)) SeekEntryResult!7984)

(assert (=> b!778965 (= e!433374 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20384 a!3186) j!159) a!3186 mask!3328) (Found!7984 j!159)))))

(declare-fun b!778967 () Bool)

(declare-fun res!526984 () Bool)

(assert (=> b!778967 (=> (not res!526984) (not e!433372))))

(assert (=> b!778967 (= res!526984 e!433374)))

(declare-fun c!86398 () Bool)

(assert (=> b!778967 (= c!86398 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778968 () Bool)

(declare-fun res!526973 () Bool)

(assert (=> b!778968 (=> (not res!526973) (not e!433369))))

(declare-fun arrayContainsKey!0 (array!42583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778968 (= res!526973 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778969 () Bool)

(assert (=> b!778969 (= e!433369 e!433371)))

(declare-fun res!526985 () Bool)

(assert (=> b!778969 (=> (not res!526985) (not e!433371))))

(declare-fun lt!347055 () SeekEntryResult!7984)

(assert (=> b!778969 (= res!526985 (or (= lt!347055 (MissingZero!7984 i!1173)) (= lt!347055 (MissingVacant!7984 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42583 (_ BitVec 32)) SeekEntryResult!7984)

(assert (=> b!778969 (= lt!347055 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!778970 () Bool)

(declare-fun res!526975 () Bool)

(assert (=> b!778970 (=> (not res!526975) (not e!433369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778970 (= res!526975 (validKeyInArray!0 (select (arr!20384 a!3186) j!159)))))

(declare-fun b!778971 () Bool)

(declare-fun res!526972 () Bool)

(assert (=> b!778971 (=> (not res!526972) (not e!433371))))

(declare-datatypes ((List!14386 0))(
  ( (Nil!14383) (Cons!14382 (h!15496 (_ BitVec 64)) (t!20701 List!14386)) )
))
(declare-fun arrayNoDuplicates!0 (array!42583 (_ BitVec 32) List!14386) Bool)

(assert (=> b!778971 (= res!526972 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14383))))

(declare-fun b!778972 () Bool)

(declare-fun e!433375 () Bool)

(assert (=> b!778972 (= e!433370 (not e!433375))))

(declare-fun res!526979 () Bool)

(assert (=> b!778972 (=> res!526979 e!433375)))

(assert (=> b!778972 (= res!526979 (or (not (is-Intermediate!7984 lt!347050)) (bvslt x!1131 (x!65249 lt!347050)) (not (= x!1131 (x!65249 lt!347050))) (not (= index!1321 (index!34306 lt!347050)))))))

(declare-fun e!433368 () Bool)

(assert (=> b!778972 e!433368))

(declare-fun res!526971 () Bool)

(assert (=> b!778972 (=> (not res!526971) (not e!433368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42583 (_ BitVec 32)) Bool)

(assert (=> b!778972 (= res!526971 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26862 0))(
  ( (Unit!26863) )
))
(declare-fun lt!347053 () Unit!26862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26862)

(assert (=> b!778972 (= lt!347053 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778973 () Bool)

(declare-fun res!526970 () Bool)

(assert (=> b!778973 (=> (not res!526970) (not e!433369))))

(assert (=> b!778973 (= res!526970 (validKeyInArray!0 k!2102))))

(declare-fun b!778974 () Bool)

(declare-fun res!526978 () Bool)

(assert (=> b!778974 (=> (not res!526978) (not e!433371))))

(assert (=> b!778974 (= res!526978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778975 () Bool)

(declare-fun e!433376 () Bool)

(assert (=> b!778975 (= e!433368 e!433376)))

(declare-fun res!526977 () Bool)

(assert (=> b!778975 (=> (not res!526977) (not e!433376))))

(declare-fun lt!347056 () SeekEntryResult!7984)

(assert (=> b!778975 (= res!526977 (= (seekEntryOrOpen!0 (select (arr!20384 a!3186) j!159) a!3186 mask!3328) lt!347056))))

(assert (=> b!778975 (= lt!347056 (Found!7984 j!159))))

(declare-fun b!778976 () Bool)

(declare-fun res!526982 () Bool)

(assert (=> b!778976 (=> (not res!526982) (not e!433372))))

(assert (=> b!778976 (= res!526982 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20384 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778977 () Bool)

(assert (=> b!778977 (= e!433376 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20384 a!3186) j!159) a!3186 mask!3328) lt!347056))))

(declare-fun res!526983 () Bool)

(assert (=> start!67354 (=> (not res!526983) (not e!433369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67354 (= res!526983 (validMask!0 mask!3328))))

(assert (=> start!67354 e!433369))

(assert (=> start!67354 true))

(declare-fun array_inv!16180 (array!42583) Bool)

(assert (=> start!67354 (array_inv!16180 a!3186)))

(declare-fun b!778966 () Bool)

(assert (=> b!778966 (= e!433375 true)))

(declare-fun lt!347051 () SeekEntryResult!7984)

(assert (=> b!778966 (= lt!347051 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20384 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!67354 res!526983) b!778961))

(assert (= (and b!778961 res!526981) b!778970))

(assert (= (and b!778970 res!526975) b!778973))

(assert (= (and b!778973 res!526970) b!778968))

(assert (= (and b!778968 res!526973) b!778969))

(assert (= (and b!778969 res!526985) b!778974))

(assert (= (and b!778974 res!526978) b!778971))

(assert (= (and b!778971 res!526972) b!778964))

(assert (= (and b!778964 res!526974) b!778960))

(assert (= (and b!778960 res!526980) b!778976))

(assert (= (and b!778976 res!526982) b!778967))

(assert (= (and b!778967 c!86398) b!778962))

(assert (= (and b!778967 (not c!86398)) b!778965))

(assert (= (and b!778967 res!526984) b!778963))

(assert (= (and b!778963 res!526976) b!778972))

(assert (= (and b!778972 res!526971) b!778975))

(assert (= (and b!778975 res!526977) b!778977))

(assert (= (and b!778972 (not res!526979)) b!778966))

(declare-fun m!722533 () Bool)

(assert (=> b!778962 m!722533))

(assert (=> b!778962 m!722533))

(declare-fun m!722535 () Bool)

(assert (=> b!778962 m!722535))

(declare-fun m!722537 () Bool)

(assert (=> b!778974 m!722537))

(assert (=> b!778970 m!722533))

(assert (=> b!778970 m!722533))

(declare-fun m!722539 () Bool)

(assert (=> b!778970 m!722539))

(assert (=> b!778960 m!722533))

(assert (=> b!778960 m!722533))

(declare-fun m!722541 () Bool)

(assert (=> b!778960 m!722541))

(assert (=> b!778960 m!722541))

(assert (=> b!778960 m!722533))

(declare-fun m!722543 () Bool)

(assert (=> b!778960 m!722543))

(declare-fun m!722545 () Bool)

(assert (=> b!778976 m!722545))

(declare-fun m!722547 () Bool)

(assert (=> b!778963 m!722547))

(declare-fun m!722549 () Bool)

(assert (=> b!778963 m!722549))

(declare-fun m!722551 () Bool)

(assert (=> b!778963 m!722551))

(declare-fun m!722553 () Bool)

(assert (=> b!778963 m!722553))

(assert (=> b!778963 m!722551))

(declare-fun m!722555 () Bool)

(assert (=> b!778963 m!722555))

(declare-fun m!722557 () Bool)

(assert (=> b!778972 m!722557))

(declare-fun m!722559 () Bool)

(assert (=> b!778972 m!722559))

(declare-fun m!722561 () Bool)

(assert (=> b!778971 m!722561))

(declare-fun m!722563 () Bool)

(assert (=> b!778973 m!722563))

(declare-fun m!722565 () Bool)

(assert (=> b!778969 m!722565))

(declare-fun m!722567 () Bool)

(assert (=> b!778968 m!722567))

(assert (=> b!778966 m!722533))

(assert (=> b!778966 m!722533))

(declare-fun m!722569 () Bool)

(assert (=> b!778966 m!722569))

(assert (=> b!778965 m!722533))

(assert (=> b!778965 m!722533))

(assert (=> b!778965 m!722569))

(declare-fun m!722571 () Bool)

(assert (=> start!67354 m!722571))

(declare-fun m!722573 () Bool)

(assert (=> start!67354 m!722573))

(assert (=> b!778977 m!722533))

(assert (=> b!778977 m!722533))

(declare-fun m!722575 () Bool)

(assert (=> b!778977 m!722575))

(assert (=> b!778975 m!722533))

(assert (=> b!778975 m!722533))

(declare-fun m!722577 () Bool)

(assert (=> b!778975 m!722577))

(push 1)

