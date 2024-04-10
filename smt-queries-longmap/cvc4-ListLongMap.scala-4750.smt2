; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65564 () Bool)

(assert start!65564)

(declare-fun b!748990 () Bool)

(declare-fun res!505315 () Bool)

(declare-fun e!417975 () Bool)

(assert (=> b!748990 (=> res!505315 e!417975)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lt!332975 () (_ BitVec 64))

(declare-datatypes ((array!41737 0))(
  ( (array!41738 (arr!19982 (Array (_ BitVec 32) (_ BitVec 64))) (size!20403 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41737)

(assert (=> b!748990 (= res!505315 (= (select (store (arr!19982 a!3186) i!1173 k!2102) index!1321) lt!332975))))

(declare-fun b!748991 () Bool)

(assert (=> b!748991 (= e!417975 true)))

(assert (=> b!748991 (= (select (store (arr!19982 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25708 0))(
  ( (Unit!25709) )
))
(declare-fun lt!332970 () Unit!25708)

(declare-fun e!417976 () Unit!25708)

(assert (=> b!748991 (= lt!332970 e!417976)))

(declare-fun c!82221 () Bool)

(assert (=> b!748991 (= c!82221 (= (select (store (arr!19982 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!417981 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7582 0))(
  ( (MissingZero!7582 (index!32696 (_ BitVec 32))) (Found!7582 (index!32697 (_ BitVec 32))) (Intermediate!7582 (undefined!8394 Bool) (index!32698 (_ BitVec 32)) (x!63628 (_ BitVec 32))) (Undefined!7582) (MissingVacant!7582 (index!32699 (_ BitVec 32))) )
))
(declare-fun lt!332972 () SeekEntryResult!7582)

(declare-fun b!748992 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41737 (_ BitVec 32)) SeekEntryResult!7582)

(assert (=> b!748992 (= e!417981 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19982 a!3186) j!159) a!3186 mask!3328) lt!332972))))

(declare-fun b!748993 () Bool)

(declare-fun e!417983 () Bool)

(declare-fun e!417978 () Bool)

(assert (=> b!748993 (= e!417983 e!417978)))

(declare-fun res!505319 () Bool)

(assert (=> b!748993 (=> (not res!505319) (not e!417978))))

(declare-fun lt!332974 () SeekEntryResult!7582)

(declare-fun lt!332969 () SeekEntryResult!7582)

(assert (=> b!748993 (= res!505319 (= lt!332974 lt!332969))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!332973 () array!41737)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41737 (_ BitVec 32)) SeekEntryResult!7582)

(assert (=> b!748993 (= lt!332969 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332975 lt!332973 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748993 (= lt!332974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332975 mask!3328) lt!332975 lt!332973 mask!3328))))

(assert (=> b!748993 (= lt!332975 (select (store (arr!19982 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!748993 (= lt!332973 (array!41738 (store (arr!19982 a!3186) i!1173 k!2102) (size!20403 a!3186)))))

(declare-fun b!748994 () Bool)

(declare-fun res!505324 () Bool)

(assert (=> b!748994 (=> res!505324 e!417975)))

(assert (=> b!748994 (= res!505324 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19982 a!3186) j!159) a!3186 mask!3328) lt!332972)))))

(declare-fun b!748995 () Bool)

(declare-fun Unit!25710 () Unit!25708)

(assert (=> b!748995 (= e!417976 Unit!25710)))

(declare-fun b!748996 () Bool)

(declare-fun res!505309 () Bool)

(assert (=> b!748996 (=> (not res!505309) (not e!417983))))

(declare-fun e!417977 () Bool)

(assert (=> b!748996 (= res!505309 e!417977)))

(declare-fun c!82222 () Bool)

(assert (=> b!748996 (= c!82222 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748997 () Bool)

(declare-fun e!417982 () Bool)

(assert (=> b!748997 (= e!417982 e!417983)))

(declare-fun res!505322 () Bool)

(assert (=> b!748997 (=> (not res!505322) (not e!417983))))

(declare-fun lt!332967 () SeekEntryResult!7582)

(assert (=> b!748997 (= res!505322 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19982 a!3186) j!159) mask!3328) (select (arr!19982 a!3186) j!159) a!3186 mask!3328) lt!332967))))

(assert (=> b!748997 (= lt!332967 (Intermediate!7582 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748998 () Bool)

(declare-fun res!505312 () Bool)

(declare-fun e!417979 () Bool)

(assert (=> b!748998 (=> (not res!505312) (not e!417979))))

(assert (=> b!748998 (= res!505312 (and (= (size!20403 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20403 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20403 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748999 () Bool)

(assert (=> b!748999 (= e!417978 (not e!417975))))

(declare-fun res!505323 () Bool)

(assert (=> b!748999 (=> res!505323 e!417975)))

(assert (=> b!748999 (= res!505323 (or (not (is-Intermediate!7582 lt!332969)) (bvslt x!1131 (x!63628 lt!332969)) (not (= x!1131 (x!63628 lt!332969))) (not (= index!1321 (index!32698 lt!332969)))))))

(assert (=> b!748999 e!417981))

(declare-fun res!505316 () Bool)

(assert (=> b!748999 (=> (not res!505316) (not e!417981))))

(declare-fun lt!332966 () SeekEntryResult!7582)

(assert (=> b!748999 (= res!505316 (= lt!332966 lt!332972))))

(assert (=> b!748999 (= lt!332972 (Found!7582 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41737 (_ BitVec 32)) SeekEntryResult!7582)

(assert (=> b!748999 (= lt!332966 (seekEntryOrOpen!0 (select (arr!19982 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41737 (_ BitVec 32)) Bool)

(assert (=> b!748999 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332968 () Unit!25708)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25708)

(assert (=> b!748999 (= lt!332968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749000 () Bool)

(assert (=> b!749000 (= e!417977 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19982 a!3186) j!159) a!3186 mask!3328) (Found!7582 j!159)))))

(declare-fun b!749001 () Bool)

(declare-fun res!505313 () Bool)

(assert (=> b!749001 (=> (not res!505313) (not e!417982))))

(assert (=> b!749001 (= res!505313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749002 () Bool)

(declare-fun res!505321 () Bool)

(assert (=> b!749002 (=> (not res!505321) (not e!417979))))

(declare-fun arrayContainsKey!0 (array!41737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749002 (= res!505321 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749003 () Bool)

(assert (=> b!749003 (= e!417977 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19982 a!3186) j!159) a!3186 mask!3328) lt!332967))))

(declare-fun res!505318 () Bool)

(assert (=> start!65564 (=> (not res!505318) (not e!417979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65564 (= res!505318 (validMask!0 mask!3328))))

(assert (=> start!65564 e!417979))

(assert (=> start!65564 true))

(declare-fun array_inv!15778 (array!41737) Bool)

(assert (=> start!65564 (array_inv!15778 a!3186)))

(declare-fun b!749004 () Bool)

(assert (=> b!749004 (= e!417979 e!417982)))

(declare-fun res!505310 () Bool)

(assert (=> b!749004 (=> (not res!505310) (not e!417982))))

(declare-fun lt!332971 () SeekEntryResult!7582)

(assert (=> b!749004 (= res!505310 (or (= lt!332971 (MissingZero!7582 i!1173)) (= lt!332971 (MissingVacant!7582 i!1173))))))

(assert (=> b!749004 (= lt!332971 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!749005 () Bool)

(declare-fun res!505314 () Bool)

(assert (=> b!749005 (=> (not res!505314) (not e!417982))))

(declare-datatypes ((List!13984 0))(
  ( (Nil!13981) (Cons!13980 (h!15052 (_ BitVec 64)) (t!20299 List!13984)) )
))
(declare-fun arrayNoDuplicates!0 (array!41737 (_ BitVec 32) List!13984) Bool)

(assert (=> b!749005 (= res!505314 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13981))))

(declare-fun b!749006 () Bool)

(declare-fun res!505311 () Bool)

(assert (=> b!749006 (=> (not res!505311) (not e!417983))))

(assert (=> b!749006 (= res!505311 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19982 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749007 () Bool)

(declare-fun res!505317 () Bool)

(assert (=> b!749007 (=> (not res!505317) (not e!417979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749007 (= res!505317 (validKeyInArray!0 k!2102))))

(declare-fun b!749008 () Bool)

(declare-fun res!505325 () Bool)

(assert (=> b!749008 (=> (not res!505325) (not e!417979))))

(assert (=> b!749008 (= res!505325 (validKeyInArray!0 (select (arr!19982 a!3186) j!159)))))

(declare-fun b!749009 () Bool)

(declare-fun Unit!25711 () Unit!25708)

(assert (=> b!749009 (= e!417976 Unit!25711)))

(assert (=> b!749009 false))

(declare-fun b!749010 () Bool)

(declare-fun res!505320 () Bool)

(assert (=> b!749010 (=> (not res!505320) (not e!417982))))

(assert (=> b!749010 (= res!505320 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20403 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20403 a!3186))))))

(assert (= (and start!65564 res!505318) b!748998))

(assert (= (and b!748998 res!505312) b!749008))

(assert (= (and b!749008 res!505325) b!749007))

(assert (= (and b!749007 res!505317) b!749002))

(assert (= (and b!749002 res!505321) b!749004))

(assert (= (and b!749004 res!505310) b!749001))

(assert (= (and b!749001 res!505313) b!749005))

(assert (= (and b!749005 res!505314) b!749010))

(assert (= (and b!749010 res!505320) b!748997))

(assert (= (and b!748997 res!505322) b!749006))

(assert (= (and b!749006 res!505311) b!748996))

(assert (= (and b!748996 c!82222) b!749003))

(assert (= (and b!748996 (not c!82222)) b!749000))

(assert (= (and b!748996 res!505309) b!748993))

(assert (= (and b!748993 res!505319) b!748999))

(assert (= (and b!748999 res!505316) b!748992))

(assert (= (and b!748999 (not res!505323)) b!748994))

(assert (= (and b!748994 (not res!505324)) b!748990))

(assert (= (and b!748990 (not res!505315)) b!748991))

(assert (= (and b!748991 c!82221) b!749009))

(assert (= (and b!748991 (not c!82221)) b!748995))

(declare-fun m!698701 () Bool)

(assert (=> b!748999 m!698701))

(assert (=> b!748999 m!698701))

(declare-fun m!698703 () Bool)

(assert (=> b!748999 m!698703))

(declare-fun m!698705 () Bool)

(assert (=> b!748999 m!698705))

(declare-fun m!698707 () Bool)

(assert (=> b!748999 m!698707))

(assert (=> b!748997 m!698701))

(assert (=> b!748997 m!698701))

(declare-fun m!698709 () Bool)

(assert (=> b!748997 m!698709))

(assert (=> b!748997 m!698709))

(assert (=> b!748997 m!698701))

(declare-fun m!698711 () Bool)

(assert (=> b!748997 m!698711))

(declare-fun m!698713 () Bool)

(assert (=> start!65564 m!698713))

(declare-fun m!698715 () Bool)

(assert (=> start!65564 m!698715))

(assert (=> b!749003 m!698701))

(assert (=> b!749003 m!698701))

(declare-fun m!698717 () Bool)

(assert (=> b!749003 m!698717))

(declare-fun m!698719 () Bool)

(assert (=> b!749006 m!698719))

(declare-fun m!698721 () Bool)

(assert (=> b!749001 m!698721))

(assert (=> b!749008 m!698701))

(assert (=> b!749008 m!698701))

(declare-fun m!698723 () Bool)

(assert (=> b!749008 m!698723))

(assert (=> b!748994 m!698701))

(assert (=> b!748994 m!698701))

(declare-fun m!698725 () Bool)

(assert (=> b!748994 m!698725))

(declare-fun m!698727 () Bool)

(assert (=> b!749007 m!698727))

(assert (=> b!749000 m!698701))

(assert (=> b!749000 m!698701))

(assert (=> b!749000 m!698725))

(declare-fun m!698729 () Bool)

(assert (=> b!749002 m!698729))

(declare-fun m!698731 () Bool)

(assert (=> b!748990 m!698731))

(declare-fun m!698733 () Bool)

(assert (=> b!748990 m!698733))

(declare-fun m!698735 () Bool)

(assert (=> b!749004 m!698735))

(declare-fun m!698737 () Bool)

(assert (=> b!749005 m!698737))

(assert (=> b!748991 m!698731))

(assert (=> b!748991 m!698733))

(declare-fun m!698739 () Bool)

(assert (=> b!748993 m!698739))

(declare-fun m!698741 () Bool)

(assert (=> b!748993 m!698741))

(assert (=> b!748993 m!698731))

(assert (=> b!748993 m!698741))

(declare-fun m!698743 () Bool)

(assert (=> b!748993 m!698743))

(declare-fun m!698745 () Bool)

(assert (=> b!748993 m!698745))

(assert (=> b!748992 m!698701))

(assert (=> b!748992 m!698701))

(declare-fun m!698747 () Bool)

(assert (=> b!748992 m!698747))

(push 1)

