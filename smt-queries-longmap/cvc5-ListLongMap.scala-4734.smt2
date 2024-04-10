; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65464 () Bool)

(assert start!65464)

(declare-fun b!745988 () Bool)

(declare-fun e!416618 () Bool)

(declare-fun e!416624 () Bool)

(assert (=> b!745988 (= e!416618 e!416624)))

(declare-fun res!502805 () Bool)

(assert (=> b!745988 (=> (not res!502805) (not e!416624))))

(declare-datatypes ((SeekEntryResult!7532 0))(
  ( (MissingZero!7532 (index!32496 (_ BitVec 32))) (Found!7532 (index!32497 (_ BitVec 32))) (Intermediate!7532 (undefined!8344 Bool) (index!32498 (_ BitVec 32)) (x!63450 (_ BitVec 32))) (Undefined!7532) (MissingVacant!7532 (index!32499 (_ BitVec 32))) )
))
(declare-fun lt!331468 () SeekEntryResult!7532)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745988 (= res!502805 (or (= lt!331468 (MissingZero!7532 i!1173)) (= lt!331468 (MissingVacant!7532 i!1173))))))

(declare-datatypes ((array!41637 0))(
  ( (array!41638 (arr!19932 (Array (_ BitVec 32) (_ BitVec 64))) (size!20353 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41637)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41637 (_ BitVec 32)) SeekEntryResult!7532)

(assert (=> b!745988 (= lt!331468 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!745989 () Bool)

(declare-fun res!502806 () Bool)

(assert (=> b!745989 (=> (not res!502806) (not e!416618))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745989 (= res!502806 (validKeyInArray!0 (select (arr!19932 a!3186) j!159)))))

(declare-fun b!745990 () Bool)

(declare-fun res!502811 () Bool)

(declare-fun e!416616 () Bool)

(assert (=> b!745990 (=> (not res!502811) (not e!416616))))

(declare-fun e!416619 () Bool)

(assert (=> b!745990 (= res!502811 e!416619)))

(declare-fun c!81973 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745990 (= c!81973 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!745991 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41637 (_ BitVec 32)) SeekEntryResult!7532)

(assert (=> b!745991 (= e!416619 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19932 a!3186) j!159) a!3186 mask!3328) (Found!7532 j!159)))))

(declare-fun b!745992 () Bool)

(declare-fun res!502807 () Bool)

(assert (=> b!745992 (=> (not res!502807) (not e!416618))))

(declare-fun arrayContainsKey!0 (array!41637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745992 (= res!502807 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745993 () Bool)

(declare-fun e!416622 () Bool)

(assert (=> b!745993 (= e!416622 true)))

(declare-fun lt!331470 () SeekEntryResult!7532)

(declare-fun lt!331471 () SeekEntryResult!7532)

(assert (=> b!745993 (= lt!331470 lt!331471)))

(declare-fun lt!331475 () SeekEntryResult!7532)

(declare-fun b!745994 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41637 (_ BitVec 32)) SeekEntryResult!7532)

(assert (=> b!745994 (= e!416619 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19932 a!3186) j!159) a!3186 mask!3328) lt!331475))))

(declare-fun b!745995 () Bool)

(declare-fun res!502812 () Bool)

(assert (=> b!745995 (=> (not res!502812) (not e!416624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41637 (_ BitVec 32)) Bool)

(assert (=> b!745995 (= res!502812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745996 () Bool)

(declare-fun res!502803 () Bool)

(assert (=> b!745996 (=> (not res!502803) (not e!416616))))

(assert (=> b!745996 (= res!502803 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19932 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745997 () Bool)

(assert (=> b!745997 (= e!416624 e!416616)))

(declare-fun res!502810 () Bool)

(assert (=> b!745997 (=> (not res!502810) (not e!416616))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745997 (= res!502810 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19932 a!3186) j!159) mask!3328) (select (arr!19932 a!3186) j!159) a!3186 mask!3328) lt!331475))))

(assert (=> b!745997 (= lt!331475 (Intermediate!7532 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745998 () Bool)

(declare-fun res!502815 () Bool)

(assert (=> b!745998 (=> (not res!502815) (not e!416624))))

(assert (=> b!745998 (= res!502815 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20353 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20353 a!3186))))))

(declare-fun b!745999 () Bool)

(declare-fun res!502804 () Bool)

(assert (=> b!745999 (=> (not res!502804) (not e!416618))))

(assert (=> b!745999 (= res!502804 (validKeyInArray!0 k!2102))))

(declare-fun b!746000 () Bool)

(declare-fun e!416623 () Bool)

(declare-fun e!416621 () Bool)

(assert (=> b!746000 (= e!416623 (not e!416621))))

(declare-fun res!502809 () Bool)

(assert (=> b!746000 (=> res!502809 e!416621)))

(declare-fun lt!331473 () SeekEntryResult!7532)

(assert (=> b!746000 (= res!502809 (or (not (is-Intermediate!7532 lt!331473)) (bvslt x!1131 (x!63450 lt!331473)) (not (= x!1131 (x!63450 lt!331473))) (not (= index!1321 (index!32498 lt!331473)))))))

(declare-fun e!416617 () Bool)

(assert (=> b!746000 e!416617))

(declare-fun res!502814 () Bool)

(assert (=> b!746000 (=> (not res!502814) (not e!416617))))

(declare-fun lt!331467 () SeekEntryResult!7532)

(assert (=> b!746000 (= res!502814 (= lt!331470 lt!331467))))

(assert (=> b!746000 (= lt!331467 (Found!7532 j!159))))

(assert (=> b!746000 (= lt!331470 (seekEntryOrOpen!0 (select (arr!19932 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746000 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25544 0))(
  ( (Unit!25545) )
))
(declare-fun lt!331474 () Unit!25544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25544)

(assert (=> b!746000 (= lt!331474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!502816 () Bool)

(assert (=> start!65464 (=> (not res!502816) (not e!416618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65464 (= res!502816 (validMask!0 mask!3328))))

(assert (=> start!65464 e!416618))

(assert (=> start!65464 true))

(declare-fun array_inv!15728 (array!41637) Bool)

(assert (=> start!65464 (array_inv!15728 a!3186)))

(declare-fun b!745987 () Bool)

(assert (=> b!745987 (= e!416616 e!416623)))

(declare-fun res!502802 () Bool)

(assert (=> b!745987 (=> (not res!502802) (not e!416623))))

(declare-fun lt!331472 () SeekEntryResult!7532)

(assert (=> b!745987 (= res!502802 (= lt!331472 lt!331473))))

(declare-fun lt!331466 () array!41637)

(declare-fun lt!331469 () (_ BitVec 64))

(assert (=> b!745987 (= lt!331473 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331469 lt!331466 mask!3328))))

(assert (=> b!745987 (= lt!331472 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331469 mask!3328) lt!331469 lt!331466 mask!3328))))

(assert (=> b!745987 (= lt!331469 (select (store (arr!19932 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745987 (= lt!331466 (array!41638 (store (arr!19932 a!3186) i!1173 k!2102) (size!20353 a!3186)))))

(declare-fun b!746001 () Bool)

(declare-fun res!502808 () Bool)

(assert (=> b!746001 (=> (not res!502808) (not e!416624))))

(declare-datatypes ((List!13934 0))(
  ( (Nil!13931) (Cons!13930 (h!15002 (_ BitVec 64)) (t!20249 List!13934)) )
))
(declare-fun arrayNoDuplicates!0 (array!41637 (_ BitVec 32) List!13934) Bool)

(assert (=> b!746001 (= res!502808 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13931))))

(declare-fun b!746002 () Bool)

(assert (=> b!746002 (= e!416617 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19932 a!3186) j!159) a!3186 mask!3328) lt!331467))))

(declare-fun b!746003 () Bool)

(declare-fun res!502813 () Bool)

(assert (=> b!746003 (=> (not res!502813) (not e!416618))))

(assert (=> b!746003 (= res!502813 (and (= (size!20353 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20353 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20353 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746004 () Bool)

(assert (=> b!746004 (= e!416621 e!416622)))

(declare-fun res!502817 () Bool)

(assert (=> b!746004 (=> res!502817 e!416622)))

(assert (=> b!746004 (= res!502817 (or (not (= lt!331471 lt!331467)) (= (select (store (arr!19932 a!3186) i!1173 k!2102) index!1321) lt!331469) (not (= (select (store (arr!19932 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746004 (= lt!331471 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19932 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65464 res!502816) b!746003))

(assert (= (and b!746003 res!502813) b!745989))

(assert (= (and b!745989 res!502806) b!745999))

(assert (= (and b!745999 res!502804) b!745992))

(assert (= (and b!745992 res!502807) b!745988))

(assert (= (and b!745988 res!502805) b!745995))

(assert (= (and b!745995 res!502812) b!746001))

(assert (= (and b!746001 res!502808) b!745998))

(assert (= (and b!745998 res!502815) b!745997))

(assert (= (and b!745997 res!502810) b!745996))

(assert (= (and b!745996 res!502803) b!745990))

(assert (= (and b!745990 c!81973) b!745994))

(assert (= (and b!745990 (not c!81973)) b!745991))

(assert (= (and b!745990 res!502811) b!745987))

(assert (= (and b!745987 res!502802) b!746000))

(assert (= (and b!746000 res!502814) b!746002))

(assert (= (and b!746000 (not res!502809)) b!746004))

(assert (= (and b!746004 (not res!502817)) b!745993))

(declare-fun m!696295 () Bool)

(assert (=> b!745999 m!696295))

(declare-fun m!696297 () Bool)

(assert (=> start!65464 m!696297))

(declare-fun m!696299 () Bool)

(assert (=> start!65464 m!696299))

(declare-fun m!696301 () Bool)

(assert (=> b!745987 m!696301))

(assert (=> b!745987 m!696301))

(declare-fun m!696303 () Bool)

(assert (=> b!745987 m!696303))

(declare-fun m!696305 () Bool)

(assert (=> b!745987 m!696305))

(declare-fun m!696307 () Bool)

(assert (=> b!745987 m!696307))

(declare-fun m!696309 () Bool)

(assert (=> b!745987 m!696309))

(declare-fun m!696311 () Bool)

(assert (=> b!745992 m!696311))

(assert (=> b!746004 m!696305))

(declare-fun m!696313 () Bool)

(assert (=> b!746004 m!696313))

(declare-fun m!696315 () Bool)

(assert (=> b!746004 m!696315))

(assert (=> b!746004 m!696315))

(declare-fun m!696317 () Bool)

(assert (=> b!746004 m!696317))

(declare-fun m!696319 () Bool)

(assert (=> b!746001 m!696319))

(assert (=> b!746002 m!696315))

(assert (=> b!746002 m!696315))

(declare-fun m!696321 () Bool)

(assert (=> b!746002 m!696321))

(assert (=> b!745997 m!696315))

(assert (=> b!745997 m!696315))

(declare-fun m!696323 () Bool)

(assert (=> b!745997 m!696323))

(assert (=> b!745997 m!696323))

(assert (=> b!745997 m!696315))

(declare-fun m!696325 () Bool)

(assert (=> b!745997 m!696325))

(declare-fun m!696327 () Bool)

(assert (=> b!745996 m!696327))

(assert (=> b!745989 m!696315))

(assert (=> b!745989 m!696315))

(declare-fun m!696329 () Bool)

(assert (=> b!745989 m!696329))

(declare-fun m!696331 () Bool)

(assert (=> b!745988 m!696331))

(declare-fun m!696333 () Bool)

(assert (=> b!745995 m!696333))

(assert (=> b!746000 m!696315))

(assert (=> b!746000 m!696315))

(declare-fun m!696335 () Bool)

(assert (=> b!746000 m!696335))

(declare-fun m!696337 () Bool)

(assert (=> b!746000 m!696337))

(declare-fun m!696339 () Bool)

(assert (=> b!746000 m!696339))

(assert (=> b!745991 m!696315))

(assert (=> b!745991 m!696315))

(assert (=> b!745991 m!696317))

(assert (=> b!745994 m!696315))

(assert (=> b!745994 m!696315))

(declare-fun m!696341 () Bool)

(assert (=> b!745994 m!696341))

(push 1)

