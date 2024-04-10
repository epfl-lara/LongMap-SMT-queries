; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65472 () Bool)

(assert start!65472)

(declare-fun b!746203 () Bool)

(declare-fun res!502994 () Bool)

(declare-fun e!416727 () Bool)

(assert (=> b!746203 (=> (not res!502994) (not e!416727))))

(declare-datatypes ((array!41645 0))(
  ( (array!41646 (arr!19936 (Array (_ BitVec 32) (_ BitVec 64))) (size!20357 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41645)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746203 (= res!502994 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746204 () Bool)

(declare-fun res!503003 () Bool)

(declare-fun e!416729 () Bool)

(assert (=> b!746204 (=> (not res!503003) (not e!416729))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41645 (_ BitVec 32)) Bool)

(assert (=> b!746204 (= res!503003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!416724 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7536 0))(
  ( (MissingZero!7536 (index!32512 (_ BitVec 32))) (Found!7536 (index!32513 (_ BitVec 32))) (Intermediate!7536 (undefined!8348 Bool) (index!32514 (_ BitVec 32)) (x!63462 (_ BitVec 32))) (Undefined!7536) (MissingVacant!7536 (index!32515 (_ BitVec 32))) )
))
(declare-fun lt!331586 () SeekEntryResult!7536)

(declare-fun b!746205 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41645 (_ BitVec 32)) SeekEntryResult!7536)

(assert (=> b!746205 (= e!416724 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19936 a!3186) j!159) a!3186 mask!3328) lt!331586))))

(declare-fun b!746206 () Bool)

(declare-fun e!416726 () Bool)

(declare-fun e!416731 () Bool)

(assert (=> b!746206 (= e!416726 (not e!416731))))

(declare-fun res!503009 () Bool)

(assert (=> b!746206 (=> res!503009 e!416731)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!331590 () SeekEntryResult!7536)

(get-info :version)

(assert (=> b!746206 (= res!503009 (or (not ((_ is Intermediate!7536) lt!331590)) (bvslt x!1131 (x!63462 lt!331590)) (not (= x!1131 (x!63462 lt!331590))) (not (= index!1321 (index!32514 lt!331590)))))))

(assert (=> b!746206 e!416724))

(declare-fun res!503006 () Bool)

(assert (=> b!746206 (=> (not res!503006) (not e!416724))))

(declare-fun lt!331594 () SeekEntryResult!7536)

(assert (=> b!746206 (= res!503006 (= lt!331594 lt!331586))))

(assert (=> b!746206 (= lt!331586 (Found!7536 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41645 (_ BitVec 32)) SeekEntryResult!7536)

(assert (=> b!746206 (= lt!331594 (seekEntryOrOpen!0 (select (arr!19936 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746206 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25552 0))(
  ( (Unit!25553) )
))
(declare-fun lt!331589 () Unit!25552)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25552)

(assert (=> b!746206 (= lt!331589 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746207 () Bool)

(declare-fun res!502996 () Bool)

(assert (=> b!746207 (=> (not res!502996) (not e!416727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746207 (= res!502996 (validKeyInArray!0 k0!2102))))

(declare-fun lt!331591 () SeekEntryResult!7536)

(declare-fun e!416730 () Bool)

(declare-fun b!746208 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41645 (_ BitVec 32)) SeekEntryResult!7536)

(assert (=> b!746208 (= e!416730 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19936 a!3186) j!159) a!3186 mask!3328) lt!331591))))

(declare-fun b!746209 () Bool)

(declare-fun res!502998 () Bool)

(assert (=> b!746209 (=> (not res!502998) (not e!416727))))

(assert (=> b!746209 (= res!502998 (validKeyInArray!0 (select (arr!19936 a!3186) j!159)))))

(declare-fun b!746210 () Bool)

(declare-fun res!503001 () Bool)

(declare-fun e!416732 () Bool)

(assert (=> b!746210 (=> (not res!503001) (not e!416732))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746210 (= res!503001 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19936 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746211 () Bool)

(assert (=> b!746211 (= e!416729 e!416732)))

(declare-fun res!502999 () Bool)

(assert (=> b!746211 (=> (not res!502999) (not e!416732))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746211 (= res!502999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19936 a!3186) j!159) mask!3328) (select (arr!19936 a!3186) j!159) a!3186 mask!3328) lt!331591))))

(assert (=> b!746211 (= lt!331591 (Intermediate!7536 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746212 () Bool)

(declare-fun e!416725 () Bool)

(assert (=> b!746212 (= e!416731 e!416725)))

(declare-fun res!503000 () Bool)

(assert (=> b!746212 (=> res!503000 e!416725)))

(declare-fun lt!331595 () (_ BitVec 64))

(declare-fun lt!331588 () SeekEntryResult!7536)

(assert (=> b!746212 (= res!503000 (or (not (= lt!331588 lt!331586)) (= (select (store (arr!19936 a!3186) i!1173 k0!2102) index!1321) lt!331595) (not (= (select (store (arr!19936 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746212 (= lt!331588 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19936 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746213 () Bool)

(assert (=> b!746213 (= e!416732 e!416726)))

(declare-fun res!503005 () Bool)

(assert (=> b!746213 (=> (not res!503005) (not e!416726))))

(declare-fun lt!331593 () SeekEntryResult!7536)

(assert (=> b!746213 (= res!503005 (= lt!331593 lt!331590))))

(declare-fun lt!331592 () array!41645)

(assert (=> b!746213 (= lt!331590 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331595 lt!331592 mask!3328))))

(assert (=> b!746213 (= lt!331593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331595 mask!3328) lt!331595 lt!331592 mask!3328))))

(assert (=> b!746213 (= lt!331595 (select (store (arr!19936 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746213 (= lt!331592 (array!41646 (store (arr!19936 a!3186) i!1173 k0!2102) (size!20357 a!3186)))))

(declare-fun b!746214 () Bool)

(assert (=> b!746214 (= e!416725 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!746214 (= lt!331594 lt!331588)))

(declare-fun b!746215 () Bool)

(assert (=> b!746215 (= e!416730 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19936 a!3186) j!159) a!3186 mask!3328) (Found!7536 j!159)))))

(declare-fun b!746216 () Bool)

(declare-fun res!502995 () Bool)

(assert (=> b!746216 (=> (not res!502995) (not e!416727))))

(assert (=> b!746216 (= res!502995 (and (= (size!20357 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20357 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20357 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746218 () Bool)

(declare-fun res!503002 () Bool)

(assert (=> b!746218 (=> (not res!503002) (not e!416729))))

(declare-datatypes ((List!13938 0))(
  ( (Nil!13935) (Cons!13934 (h!15006 (_ BitVec 64)) (t!20253 List!13938)) )
))
(declare-fun arrayNoDuplicates!0 (array!41645 (_ BitVec 32) List!13938) Bool)

(assert (=> b!746218 (= res!503002 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13935))))

(declare-fun b!746219 () Bool)

(declare-fun res!503008 () Bool)

(assert (=> b!746219 (=> (not res!503008) (not e!416729))))

(assert (=> b!746219 (= res!503008 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20357 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20357 a!3186))))))

(declare-fun b!746220 () Bool)

(assert (=> b!746220 (= e!416727 e!416729)))

(declare-fun res!502997 () Bool)

(assert (=> b!746220 (=> (not res!502997) (not e!416729))))

(declare-fun lt!331587 () SeekEntryResult!7536)

(assert (=> b!746220 (= res!502997 (or (= lt!331587 (MissingZero!7536 i!1173)) (= lt!331587 (MissingVacant!7536 i!1173))))))

(assert (=> b!746220 (= lt!331587 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!503004 () Bool)

(assert (=> start!65472 (=> (not res!503004) (not e!416727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65472 (= res!503004 (validMask!0 mask!3328))))

(assert (=> start!65472 e!416727))

(assert (=> start!65472 true))

(declare-fun array_inv!15732 (array!41645) Bool)

(assert (=> start!65472 (array_inv!15732 a!3186)))

(declare-fun b!746217 () Bool)

(declare-fun res!503007 () Bool)

(assert (=> b!746217 (=> (not res!503007) (not e!416732))))

(assert (=> b!746217 (= res!503007 e!416730)))

(declare-fun c!81985 () Bool)

(assert (=> b!746217 (= c!81985 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65472 res!503004) b!746216))

(assert (= (and b!746216 res!502995) b!746209))

(assert (= (and b!746209 res!502998) b!746207))

(assert (= (and b!746207 res!502996) b!746203))

(assert (= (and b!746203 res!502994) b!746220))

(assert (= (and b!746220 res!502997) b!746204))

(assert (= (and b!746204 res!503003) b!746218))

(assert (= (and b!746218 res!503002) b!746219))

(assert (= (and b!746219 res!503008) b!746211))

(assert (= (and b!746211 res!502999) b!746210))

(assert (= (and b!746210 res!503001) b!746217))

(assert (= (and b!746217 c!81985) b!746208))

(assert (= (and b!746217 (not c!81985)) b!746215))

(assert (= (and b!746217 res!503007) b!746213))

(assert (= (and b!746213 res!503005) b!746206))

(assert (= (and b!746206 res!503006) b!746205))

(assert (= (and b!746206 (not res!503009)) b!746212))

(assert (= (and b!746212 (not res!503000)) b!746214))

(declare-fun m!696487 () Bool)

(assert (=> b!746208 m!696487))

(assert (=> b!746208 m!696487))

(declare-fun m!696489 () Bool)

(assert (=> b!746208 m!696489))

(declare-fun m!696491 () Bool)

(assert (=> b!746203 m!696491))

(assert (=> b!746206 m!696487))

(assert (=> b!746206 m!696487))

(declare-fun m!696493 () Bool)

(assert (=> b!746206 m!696493))

(declare-fun m!696495 () Bool)

(assert (=> b!746206 m!696495))

(declare-fun m!696497 () Bool)

(assert (=> b!746206 m!696497))

(declare-fun m!696499 () Bool)

(assert (=> b!746207 m!696499))

(declare-fun m!696501 () Bool)

(assert (=> b!746212 m!696501))

(declare-fun m!696503 () Bool)

(assert (=> b!746212 m!696503))

(assert (=> b!746212 m!696487))

(assert (=> b!746212 m!696487))

(declare-fun m!696505 () Bool)

(assert (=> b!746212 m!696505))

(assert (=> b!746211 m!696487))

(assert (=> b!746211 m!696487))

(declare-fun m!696507 () Bool)

(assert (=> b!746211 m!696507))

(assert (=> b!746211 m!696507))

(assert (=> b!746211 m!696487))

(declare-fun m!696509 () Bool)

(assert (=> b!746211 m!696509))

(declare-fun m!696511 () Bool)

(assert (=> b!746220 m!696511))

(declare-fun m!696513 () Bool)

(assert (=> b!746218 m!696513))

(declare-fun m!696515 () Bool)

(assert (=> start!65472 m!696515))

(declare-fun m!696517 () Bool)

(assert (=> start!65472 m!696517))

(assert (=> b!746205 m!696487))

(assert (=> b!746205 m!696487))

(declare-fun m!696519 () Bool)

(assert (=> b!746205 m!696519))

(assert (=> b!746215 m!696487))

(assert (=> b!746215 m!696487))

(assert (=> b!746215 m!696505))

(assert (=> b!746209 m!696487))

(assert (=> b!746209 m!696487))

(declare-fun m!696521 () Bool)

(assert (=> b!746209 m!696521))

(declare-fun m!696523 () Bool)

(assert (=> b!746213 m!696523))

(declare-fun m!696525 () Bool)

(assert (=> b!746213 m!696525))

(assert (=> b!746213 m!696501))

(declare-fun m!696527 () Bool)

(assert (=> b!746213 m!696527))

(assert (=> b!746213 m!696525))

(declare-fun m!696529 () Bool)

(assert (=> b!746213 m!696529))

(declare-fun m!696531 () Bool)

(assert (=> b!746210 m!696531))

(declare-fun m!696533 () Bool)

(assert (=> b!746204 m!696533))

(check-sat (not b!746212) (not b!746208) (not b!746203) (not b!746213) (not b!746204) (not b!746207) (not start!65472) (not b!746218) (not b!746205) (not b!746215) (not b!746209) (not b!746206) (not b!746220) (not b!746211))
(check-sat)
