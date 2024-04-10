; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65450 () Bool)

(assert start!65450)

(declare-datatypes ((array!41623 0))(
  ( (array!41624 (arr!19925 (Array (_ BitVec 32) (_ BitVec 64))) (size!20346 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41623)

(declare-datatypes ((SeekEntryResult!7525 0))(
  ( (MissingZero!7525 (index!32468 (_ BitVec 32))) (Found!7525 (index!32469 (_ BitVec 32))) (Intermediate!7525 (undefined!8337 Bool) (index!32470 (_ BitVec 32)) (x!63419 (_ BitVec 32))) (Undefined!7525) (MissingVacant!7525 (index!32471 (_ BitVec 32))) )
))
(declare-fun lt!331262 () SeekEntryResult!7525)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!416427 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!745609 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41623 (_ BitVec 32)) SeekEntryResult!7525)

(assert (=> b!745609 (= e!416427 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19925 a!3186) j!159) a!3186 mask!3328) lt!331262))))

(declare-fun b!745610 () Bool)

(declare-fun res!502469 () Bool)

(declare-fun e!416429 () Bool)

(assert (=> b!745610 (=> (not res!502469) (not e!416429))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745610 (= res!502469 (validKeyInArray!0 k!2102))))

(declare-fun b!745611 () Bool)

(declare-fun res!502481 () Bool)

(declare-fun e!416431 () Bool)

(assert (=> b!745611 (=> (not res!502481) (not e!416431))))

(assert (=> b!745611 (= res!502481 e!416427)))

(declare-fun c!81952 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745611 (= c!81952 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745612 () Bool)

(declare-fun res!502479 () Bool)

(declare-fun e!416434 () Bool)

(assert (=> b!745612 (=> (not res!502479) (not e!416434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41623 (_ BitVec 32)) Bool)

(assert (=> b!745612 (= res!502479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745613 () Bool)

(declare-fun res!502478 () Bool)

(assert (=> b!745613 (=> (not res!502478) (not e!416429))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745613 (= res!502478 (and (= (size!20346 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20346 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20346 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!745614 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41623 (_ BitVec 32)) SeekEntryResult!7525)

(assert (=> b!745614 (= e!416427 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19925 a!3186) j!159) a!3186 mask!3328) (Found!7525 j!159)))))

(declare-fun b!745615 () Bool)

(assert (=> b!745615 (= e!416429 e!416434)))

(declare-fun res!502472 () Bool)

(assert (=> b!745615 (=> (not res!502472) (not e!416434))))

(declare-fun lt!331260 () SeekEntryResult!7525)

(assert (=> b!745615 (= res!502472 (or (= lt!331260 (MissingZero!7525 i!1173)) (= lt!331260 (MissingVacant!7525 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41623 (_ BitVec 32)) SeekEntryResult!7525)

(assert (=> b!745615 (= lt!331260 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!745616 () Bool)

(declare-fun e!416428 () Bool)

(assert (=> b!745616 (= e!416431 e!416428)))

(declare-fun res!502476 () Bool)

(assert (=> b!745616 (=> (not res!502476) (not e!416428))))

(declare-fun lt!331261 () SeekEntryResult!7525)

(declare-fun lt!331257 () SeekEntryResult!7525)

(assert (=> b!745616 (= res!502476 (= lt!331261 lt!331257))))

(declare-fun lt!331265 () array!41623)

(declare-fun lt!331264 () (_ BitVec 64))

(assert (=> b!745616 (= lt!331257 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331264 lt!331265 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745616 (= lt!331261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331264 mask!3328) lt!331264 lt!331265 mask!3328))))

(assert (=> b!745616 (= lt!331264 (select (store (arr!19925 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745616 (= lt!331265 (array!41624 (store (arr!19925 a!3186) i!1173 k!2102) (size!20346 a!3186)))))

(declare-fun b!745617 () Bool)

(declare-fun res!502468 () Bool)

(assert (=> b!745617 (=> (not res!502468) (not e!416429))))

(declare-fun arrayContainsKey!0 (array!41623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745617 (= res!502468 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!502466 () Bool)

(assert (=> start!65450 (=> (not res!502466) (not e!416429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65450 (= res!502466 (validMask!0 mask!3328))))

(assert (=> start!65450 e!416429))

(assert (=> start!65450 true))

(declare-fun array_inv!15721 (array!41623) Bool)

(assert (=> start!65450 (array_inv!15721 a!3186)))

(declare-fun b!745618 () Bool)

(declare-fun res!502467 () Bool)

(assert (=> b!745618 (=> (not res!502467) (not e!416434))))

(assert (=> b!745618 (= res!502467 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20346 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20346 a!3186))))))

(declare-fun b!745619 () Bool)

(declare-fun res!502471 () Bool)

(assert (=> b!745619 (=> (not res!502471) (not e!416431))))

(assert (=> b!745619 (= res!502471 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19925 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745620 () Bool)

(declare-fun e!416433 () Bool)

(declare-fun e!416435 () Bool)

(assert (=> b!745620 (= e!416433 e!416435)))

(declare-fun res!502475 () Bool)

(assert (=> b!745620 (=> (not res!502475) (not e!416435))))

(declare-fun lt!331263 () SeekEntryResult!7525)

(assert (=> b!745620 (= res!502475 (= (seekEntryOrOpen!0 (select (arr!19925 a!3186) j!159) a!3186 mask!3328) lt!331263))))

(assert (=> b!745620 (= lt!331263 (Found!7525 j!159))))

(declare-fun b!745621 () Bool)

(declare-fun res!502477 () Bool)

(assert (=> b!745621 (=> (not res!502477) (not e!416429))))

(assert (=> b!745621 (= res!502477 (validKeyInArray!0 (select (arr!19925 a!3186) j!159)))))

(declare-fun b!745622 () Bool)

(declare-fun e!416430 () Bool)

(assert (=> b!745622 (= e!416430 true)))

(declare-fun lt!331259 () SeekEntryResult!7525)

(assert (=> b!745622 (= lt!331259 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19925 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745623 () Bool)

(assert (=> b!745623 (= e!416428 (not e!416430))))

(declare-fun res!502473 () Bool)

(assert (=> b!745623 (=> res!502473 e!416430)))

(assert (=> b!745623 (= res!502473 (or (not (is-Intermediate!7525 lt!331257)) (bvslt x!1131 (x!63419 lt!331257)) (not (= x!1131 (x!63419 lt!331257))) (not (= index!1321 (index!32470 lt!331257)))))))

(assert (=> b!745623 e!416433))

(declare-fun res!502474 () Bool)

(assert (=> b!745623 (=> (not res!502474) (not e!416433))))

(assert (=> b!745623 (= res!502474 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25530 0))(
  ( (Unit!25531) )
))
(declare-fun lt!331258 () Unit!25530)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25530)

(assert (=> b!745623 (= lt!331258 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745624 () Bool)

(assert (=> b!745624 (= e!416435 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19925 a!3186) j!159) a!3186 mask!3328) lt!331263))))

(declare-fun b!745625 () Bool)

(declare-fun res!502470 () Bool)

(assert (=> b!745625 (=> (not res!502470) (not e!416434))))

(declare-datatypes ((List!13927 0))(
  ( (Nil!13924) (Cons!13923 (h!14995 (_ BitVec 64)) (t!20242 List!13927)) )
))
(declare-fun arrayNoDuplicates!0 (array!41623 (_ BitVec 32) List!13927) Bool)

(assert (=> b!745625 (= res!502470 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13924))))

(declare-fun b!745626 () Bool)

(assert (=> b!745626 (= e!416434 e!416431)))

(declare-fun res!502480 () Bool)

(assert (=> b!745626 (=> (not res!502480) (not e!416431))))

(assert (=> b!745626 (= res!502480 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19925 a!3186) j!159) mask!3328) (select (arr!19925 a!3186) j!159) a!3186 mask!3328) lt!331262))))

(assert (=> b!745626 (= lt!331262 (Intermediate!7525 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65450 res!502466) b!745613))

(assert (= (and b!745613 res!502478) b!745621))

(assert (= (and b!745621 res!502477) b!745610))

(assert (= (and b!745610 res!502469) b!745617))

(assert (= (and b!745617 res!502468) b!745615))

(assert (= (and b!745615 res!502472) b!745612))

(assert (= (and b!745612 res!502479) b!745625))

(assert (= (and b!745625 res!502470) b!745618))

(assert (= (and b!745618 res!502467) b!745626))

(assert (= (and b!745626 res!502480) b!745619))

(assert (= (and b!745619 res!502471) b!745611))

(assert (= (and b!745611 c!81952) b!745609))

(assert (= (and b!745611 (not c!81952)) b!745614))

(assert (= (and b!745611 res!502481) b!745616))

(assert (= (and b!745616 res!502476) b!745623))

(assert (= (and b!745623 res!502474) b!745620))

(assert (= (and b!745620 res!502475) b!745624))

(assert (= (and b!745623 (not res!502473)) b!745622))

(declare-fun m!695961 () Bool)

(assert (=> b!745615 m!695961))

(declare-fun m!695963 () Bool)

(assert (=> b!745624 m!695963))

(assert (=> b!745624 m!695963))

(declare-fun m!695965 () Bool)

(assert (=> b!745624 m!695965))

(declare-fun m!695967 () Bool)

(assert (=> start!65450 m!695967))

(declare-fun m!695969 () Bool)

(assert (=> start!65450 m!695969))

(declare-fun m!695971 () Bool)

(assert (=> b!745610 m!695971))

(assert (=> b!745614 m!695963))

(assert (=> b!745614 m!695963))

(declare-fun m!695973 () Bool)

(assert (=> b!745614 m!695973))

(declare-fun m!695975 () Bool)

(assert (=> b!745619 m!695975))

(declare-fun m!695977 () Bool)

(assert (=> b!745612 m!695977))

(declare-fun m!695979 () Bool)

(assert (=> b!745623 m!695979))

(declare-fun m!695981 () Bool)

(assert (=> b!745623 m!695981))

(assert (=> b!745622 m!695963))

(assert (=> b!745622 m!695963))

(assert (=> b!745622 m!695973))

(declare-fun m!695983 () Bool)

(assert (=> b!745616 m!695983))

(assert (=> b!745616 m!695983))

(declare-fun m!695985 () Bool)

(assert (=> b!745616 m!695985))

(declare-fun m!695987 () Bool)

(assert (=> b!745616 m!695987))

(declare-fun m!695989 () Bool)

(assert (=> b!745616 m!695989))

(declare-fun m!695991 () Bool)

(assert (=> b!745616 m!695991))

(assert (=> b!745609 m!695963))

(assert (=> b!745609 m!695963))

(declare-fun m!695993 () Bool)

(assert (=> b!745609 m!695993))

(assert (=> b!745626 m!695963))

(assert (=> b!745626 m!695963))

(declare-fun m!695995 () Bool)

(assert (=> b!745626 m!695995))

(assert (=> b!745626 m!695995))

(assert (=> b!745626 m!695963))

(declare-fun m!695997 () Bool)

(assert (=> b!745626 m!695997))

(assert (=> b!745621 m!695963))

(assert (=> b!745621 m!695963))

(declare-fun m!695999 () Bool)

(assert (=> b!745621 m!695999))

(declare-fun m!696001 () Bool)

(assert (=> b!745625 m!696001))

(assert (=> b!745620 m!695963))

(assert (=> b!745620 m!695963))

(declare-fun m!696003 () Bool)

(assert (=> b!745620 m!696003))

(declare-fun m!696005 () Bool)

(assert (=> b!745617 m!696005))

(push 1)

