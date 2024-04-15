; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66896 () Bool)

(assert start!66896)

(declare-fun b!771988 () Bool)

(declare-datatypes ((Unit!26594 0))(
  ( (Unit!26595) )
))
(declare-fun e!429744 () Unit!26594)

(declare-fun Unit!26596 () Unit!26594)

(assert (=> b!771988 (= e!429744 Unit!26596)))

(declare-datatypes ((array!42408 0))(
  ( (array!42409 (arr!20303 (Array (_ BitVec 32) (_ BitVec 64))) (size!20724 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42408)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7900 0))(
  ( (MissingZero!7900 (index!33968 (_ BitVec 32))) (Found!7900 (index!33969 (_ BitVec 32))) (Intermediate!7900 (undefined!8712 Bool) (index!33970 (_ BitVec 32)) (x!64910 (_ BitVec 32))) (Undefined!7900) (MissingVacant!7900 (index!33971 (_ BitVec 32))) )
))
(declare-fun lt!343580 () SeekEntryResult!7900)

(declare-fun lt!343583 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42408 (_ BitVec 32)) SeekEntryResult!7900)

(assert (=> b!771988 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343583 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343580)))

(declare-fun b!771989 () Bool)

(declare-fun e!429750 () Bool)

(declare-fun e!429748 () Bool)

(assert (=> b!771989 (= e!429750 e!429748)))

(declare-fun res!522256 () Bool)

(assert (=> b!771989 (=> (not res!522256) (not e!429748))))

(declare-fun lt!343585 () SeekEntryResult!7900)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771989 (= res!522256 (or (= lt!343585 (MissingZero!7900 i!1173)) (= lt!343585 (MissingVacant!7900 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42408 (_ BitVec 32)) SeekEntryResult!7900)

(assert (=> b!771989 (= lt!343585 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!429749 () Bool)

(declare-fun b!771990 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!771990 (= e!429749 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343580))))

(declare-fun b!771992 () Bool)

(declare-fun e!429742 () Bool)

(assert (=> b!771992 (= e!429742 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (and (bvsge lt!343583 #b00000000000000000000000000000000) (bvslt lt!343583 (size!20724 a!3186)))))))

(declare-fun lt!343578 () Unit!26594)

(assert (=> b!771992 (= lt!343578 e!429744)))

(declare-fun c!85269 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!771992 (= c!85269 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771992 (= lt!343583 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!771993 () Bool)

(declare-fun e!429743 () Bool)

(assert (=> b!771993 (= e!429743 (not e!429742))))

(declare-fun res!522259 () Bool)

(assert (=> b!771993 (=> res!522259 e!429742)))

(declare-fun lt!343582 () SeekEntryResult!7900)

(get-info :version)

(assert (=> b!771993 (= res!522259 (or (not ((_ is Intermediate!7900) lt!343582)) (bvsge x!1131 (x!64910 lt!343582))))))

(declare-fun e!429751 () Bool)

(assert (=> b!771993 e!429751))

(declare-fun res!522261 () Bool)

(assert (=> b!771993 (=> (not res!522261) (not e!429751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42408 (_ BitVec 32)) Bool)

(assert (=> b!771993 (= res!522261 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343577 () Unit!26594)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26594)

(assert (=> b!771993 (= lt!343577 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771994 () Bool)

(declare-fun res!522252 () Bool)

(declare-fun e!429745 () Bool)

(assert (=> b!771994 (=> (not res!522252) (not e!429745))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!771994 (= res!522252 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20303 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771995 () Bool)

(assert (=> b!771995 (= e!429748 e!429745)))

(declare-fun res!522253 () Bool)

(assert (=> b!771995 (=> (not res!522253) (not e!429745))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771995 (= res!522253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20303 a!3186) j!159) mask!3328) (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343580))))

(assert (=> b!771995 (= lt!343580 (Intermediate!7900 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771996 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42408 (_ BitVec 32)) SeekEntryResult!7900)

(assert (=> b!771996 (= e!429749 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) (Found!7900 j!159)))))

(declare-fun b!771997 () Bool)

(declare-fun res!522249 () Bool)

(assert (=> b!771997 (=> (not res!522249) (not e!429748))))

(assert (=> b!771997 (= res!522249 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20724 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20724 a!3186))))))

(declare-fun b!771998 () Bool)

(declare-fun Unit!26597 () Unit!26594)

(assert (=> b!771998 (= e!429744 Unit!26597)))

(declare-fun lt!343584 () SeekEntryResult!7900)

(assert (=> b!771998 (= lt!343584 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!771998 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343583 resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) (Found!7900 j!159))))

(declare-fun res!522257 () Bool)

(assert (=> start!66896 (=> (not res!522257) (not e!429750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66896 (= res!522257 (validMask!0 mask!3328))))

(assert (=> start!66896 e!429750))

(assert (=> start!66896 true))

(declare-fun array_inv!16186 (array!42408) Bool)

(assert (=> start!66896 (array_inv!16186 a!3186)))

(declare-fun b!771991 () Bool)

(declare-fun e!429746 () Bool)

(assert (=> b!771991 (= e!429751 e!429746)))

(declare-fun res!522247 () Bool)

(assert (=> b!771991 (=> (not res!522247) (not e!429746))))

(declare-fun lt!343581 () SeekEntryResult!7900)

(assert (=> b!771991 (= res!522247 (= (seekEntryOrOpen!0 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343581))))

(assert (=> b!771991 (= lt!343581 (Found!7900 j!159))))

(declare-fun b!771999 () Bool)

(declare-fun res!522250 () Bool)

(assert (=> b!771999 (=> (not res!522250) (not e!429750))))

(assert (=> b!771999 (= res!522250 (and (= (size!20724 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20724 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20724 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772000 () Bool)

(declare-fun res!522251 () Bool)

(assert (=> b!772000 (=> (not res!522251) (not e!429750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772000 (= res!522251 (validKeyInArray!0 (select (arr!20303 a!3186) j!159)))))

(declare-fun b!772001 () Bool)

(assert (=> b!772001 (= e!429745 e!429743)))

(declare-fun res!522260 () Bool)

(assert (=> b!772001 (=> (not res!522260) (not e!429743))))

(declare-fun lt!343586 () SeekEntryResult!7900)

(assert (=> b!772001 (= res!522260 (= lt!343586 lt!343582))))

(declare-fun lt!343579 () (_ BitVec 64))

(declare-fun lt!343576 () array!42408)

(assert (=> b!772001 (= lt!343582 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343579 lt!343576 mask!3328))))

(assert (=> b!772001 (= lt!343586 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343579 mask!3328) lt!343579 lt!343576 mask!3328))))

(assert (=> b!772001 (= lt!343579 (select (store (arr!20303 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!772001 (= lt!343576 (array!42409 (store (arr!20303 a!3186) i!1173 k0!2102) (size!20724 a!3186)))))

(declare-fun b!772002 () Bool)

(declare-fun res!522255 () Bool)

(assert (=> b!772002 (=> (not res!522255) (not e!429748))))

(assert (=> b!772002 (= res!522255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772003 () Bool)

(declare-fun res!522246 () Bool)

(assert (=> b!772003 (=> (not res!522246) (not e!429748))))

(declare-datatypes ((List!14344 0))(
  ( (Nil!14341) (Cons!14340 (h!15442 (_ BitVec 64)) (t!20650 List!14344)) )
))
(declare-fun arrayNoDuplicates!0 (array!42408 (_ BitVec 32) List!14344) Bool)

(assert (=> b!772003 (= res!522246 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14341))))

(declare-fun b!772004 () Bool)

(assert (=> b!772004 (= e!429746 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343581))))

(declare-fun b!772005 () Bool)

(declare-fun res!522248 () Bool)

(assert (=> b!772005 (=> (not res!522248) (not e!429750))))

(declare-fun arrayContainsKey!0 (array!42408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772005 (= res!522248 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772006 () Bool)

(declare-fun res!522258 () Bool)

(assert (=> b!772006 (=> (not res!522258) (not e!429750))))

(assert (=> b!772006 (= res!522258 (validKeyInArray!0 k0!2102))))

(declare-fun b!772007 () Bool)

(declare-fun res!522254 () Bool)

(assert (=> b!772007 (=> (not res!522254) (not e!429745))))

(assert (=> b!772007 (= res!522254 e!429749)))

(declare-fun c!85268 () Bool)

(assert (=> b!772007 (= c!85268 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66896 res!522257) b!771999))

(assert (= (and b!771999 res!522250) b!772000))

(assert (= (and b!772000 res!522251) b!772006))

(assert (= (and b!772006 res!522258) b!772005))

(assert (= (and b!772005 res!522248) b!771989))

(assert (= (and b!771989 res!522256) b!772002))

(assert (= (and b!772002 res!522255) b!772003))

(assert (= (and b!772003 res!522246) b!771997))

(assert (= (and b!771997 res!522249) b!771995))

(assert (= (and b!771995 res!522253) b!771994))

(assert (= (and b!771994 res!522252) b!772007))

(assert (= (and b!772007 c!85268) b!771990))

(assert (= (and b!772007 (not c!85268)) b!771996))

(assert (= (and b!772007 res!522254) b!772001))

(assert (= (and b!772001 res!522260) b!771993))

(assert (= (and b!771993 res!522261) b!771991))

(assert (= (and b!771991 res!522247) b!772004))

(assert (= (and b!771993 (not res!522259)) b!771992))

(assert (= (and b!771992 c!85269) b!771988))

(assert (= (and b!771992 (not c!85269)) b!771998))

(declare-fun m!716445 () Bool)

(assert (=> b!772001 m!716445))

(declare-fun m!716447 () Bool)

(assert (=> b!772001 m!716447))

(declare-fun m!716449 () Bool)

(assert (=> b!772001 m!716449))

(declare-fun m!716451 () Bool)

(assert (=> b!772001 m!716451))

(assert (=> b!772001 m!716451))

(declare-fun m!716453 () Bool)

(assert (=> b!772001 m!716453))

(declare-fun m!716455 () Bool)

(assert (=> b!771989 m!716455))

(declare-fun m!716457 () Bool)

(assert (=> b!771994 m!716457))

(declare-fun m!716459 () Bool)

(assert (=> b!772003 m!716459))

(declare-fun m!716461 () Bool)

(assert (=> b!771998 m!716461))

(assert (=> b!771998 m!716461))

(declare-fun m!716463 () Bool)

(assert (=> b!771998 m!716463))

(assert (=> b!771998 m!716461))

(declare-fun m!716465 () Bool)

(assert (=> b!771998 m!716465))

(assert (=> b!772004 m!716461))

(assert (=> b!772004 m!716461))

(declare-fun m!716467 () Bool)

(assert (=> b!772004 m!716467))

(declare-fun m!716469 () Bool)

(assert (=> b!772002 m!716469))

(declare-fun m!716471 () Bool)

(assert (=> b!772005 m!716471))

(assert (=> b!771996 m!716461))

(assert (=> b!771996 m!716461))

(assert (=> b!771996 m!716463))

(assert (=> b!771991 m!716461))

(assert (=> b!771991 m!716461))

(declare-fun m!716473 () Bool)

(assert (=> b!771991 m!716473))

(declare-fun m!716475 () Bool)

(assert (=> b!771992 m!716475))

(declare-fun m!716477 () Bool)

(assert (=> start!66896 m!716477))

(declare-fun m!716479 () Bool)

(assert (=> start!66896 m!716479))

(declare-fun m!716481 () Bool)

(assert (=> b!771993 m!716481))

(declare-fun m!716483 () Bool)

(assert (=> b!771993 m!716483))

(assert (=> b!771990 m!716461))

(assert (=> b!771990 m!716461))

(declare-fun m!716485 () Bool)

(assert (=> b!771990 m!716485))

(assert (=> b!771995 m!716461))

(assert (=> b!771995 m!716461))

(declare-fun m!716487 () Bool)

(assert (=> b!771995 m!716487))

(assert (=> b!771995 m!716487))

(assert (=> b!771995 m!716461))

(declare-fun m!716489 () Bool)

(assert (=> b!771995 m!716489))

(declare-fun m!716491 () Bool)

(assert (=> b!772006 m!716491))

(assert (=> b!772000 m!716461))

(assert (=> b!772000 m!716461))

(declare-fun m!716493 () Bool)

(assert (=> b!772000 m!716493))

(assert (=> b!771988 m!716461))

(assert (=> b!771988 m!716461))

(declare-fun m!716495 () Bool)

(assert (=> b!771988 m!716495))

(check-sat (not b!771993) (not b!772002) (not b!771996) (not b!771992) (not b!771988) (not b!772003) (not b!772001) (not b!772006) (not b!771995) (not b!771990) (not b!772005) (not b!771998) (not b!772000) (not b!771989) (not start!66896) (not b!772004) (not b!771991))
(check-sat)
(get-model)

(declare-fun b!772146 () Bool)

(declare-fun lt!343657 () SeekEntryResult!7900)

(assert (=> b!772146 (and (bvsge (index!33970 lt!343657) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343657) (size!20724 a!3186)))))

(declare-fun e!429825 () Bool)

(assert (=> b!772146 (= e!429825 (= (select (arr!20303 a!3186) (index!33970 lt!343657)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772147 () Bool)

(declare-fun e!429824 () SeekEntryResult!7900)

(assert (=> b!772147 (= e!429824 (Intermediate!7900 false index!1321 x!1131))))

(declare-fun d!101633 () Bool)

(declare-fun e!429826 () Bool)

(assert (=> d!101633 e!429826))

(declare-fun c!85290 () Bool)

(assert (=> d!101633 (= c!85290 (and ((_ is Intermediate!7900) lt!343657) (undefined!8712 lt!343657)))))

(declare-fun e!429823 () SeekEntryResult!7900)

(assert (=> d!101633 (= lt!343657 e!429823)))

(declare-fun c!85289 () Bool)

(assert (=> d!101633 (= c!85289 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343658 () (_ BitVec 64))

(assert (=> d!101633 (= lt!343658 (select (arr!20303 a!3186) index!1321))))

(assert (=> d!101633 (validMask!0 mask!3328)))

(assert (=> d!101633 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343657)))

(declare-fun b!772148 () Bool)

(assert (=> b!772148 (and (bvsge (index!33970 lt!343657) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343657) (size!20724 a!3186)))))

(declare-fun res!522366 () Bool)

(assert (=> b!772148 (= res!522366 (= (select (arr!20303 a!3186) (index!33970 lt!343657)) (select (arr!20303 a!3186) j!159)))))

(assert (=> b!772148 (=> res!522366 e!429825)))

(declare-fun e!429822 () Bool)

(assert (=> b!772148 (= e!429822 e!429825)))

(declare-fun b!772149 () Bool)

(assert (=> b!772149 (= e!429826 (bvsge (x!64910 lt!343657) #b01111111111111111111111111111110))))

(declare-fun b!772150 () Bool)

(assert (=> b!772150 (and (bvsge (index!33970 lt!343657) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343657) (size!20724 a!3186)))))

(declare-fun res!522365 () Bool)

(assert (=> b!772150 (= res!522365 (= (select (arr!20303 a!3186) (index!33970 lt!343657)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772150 (=> res!522365 e!429825)))

(declare-fun b!772151 () Bool)

(assert (=> b!772151 (= e!429826 e!429822)))

(declare-fun res!522364 () Bool)

(assert (=> b!772151 (= res!522364 (and ((_ is Intermediate!7900) lt!343657) (not (undefined!8712 lt!343657)) (bvslt (x!64910 lt!343657) #b01111111111111111111111111111110) (bvsge (x!64910 lt!343657) #b00000000000000000000000000000000) (bvsge (x!64910 lt!343657) x!1131)))))

(assert (=> b!772151 (=> (not res!522364) (not e!429822))))

(declare-fun b!772152 () Bool)

(assert (=> b!772152 (= e!429823 e!429824)))

(declare-fun c!85288 () Bool)

(assert (=> b!772152 (= c!85288 (or (= lt!343658 (select (arr!20303 a!3186) j!159)) (= (bvadd lt!343658 lt!343658) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772153 () Bool)

(assert (=> b!772153 (= e!429823 (Intermediate!7900 true index!1321 x!1131))))

(declare-fun b!772154 () Bool)

(assert (=> b!772154 (= e!429824 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20303 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101633 c!85289) b!772153))

(assert (= (and d!101633 (not c!85289)) b!772152))

(assert (= (and b!772152 c!85288) b!772147))

(assert (= (and b!772152 (not c!85288)) b!772154))

(assert (= (and d!101633 c!85290) b!772149))

(assert (= (and d!101633 (not c!85290)) b!772151))

(assert (= (and b!772151 res!522364) b!772148))

(assert (= (and b!772148 (not res!522366)) b!772150))

(assert (= (and b!772150 (not res!522365)) b!772146))

(declare-fun m!716601 () Bool)

(assert (=> d!101633 m!716601))

(assert (=> d!101633 m!716477))

(declare-fun m!716603 () Bool)

(assert (=> b!772150 m!716603))

(assert (=> b!772146 m!716603))

(assert (=> b!772154 m!716475))

(assert (=> b!772154 m!716475))

(assert (=> b!772154 m!716461))

(declare-fun m!716605 () Bool)

(assert (=> b!772154 m!716605))

(assert (=> b!772148 m!716603))

(assert (=> b!771990 d!101633))

(declare-fun b!772155 () Bool)

(declare-fun lt!343659 () SeekEntryResult!7900)

(assert (=> b!772155 (and (bvsge (index!33970 lt!343659) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343659) (size!20724 lt!343576)))))

(declare-fun e!429830 () Bool)

(assert (=> b!772155 (= e!429830 (= (select (arr!20303 lt!343576) (index!33970 lt!343659)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772156 () Bool)

(declare-fun e!429829 () SeekEntryResult!7900)

(assert (=> b!772156 (= e!429829 (Intermediate!7900 false index!1321 x!1131))))

(declare-fun d!101635 () Bool)

(declare-fun e!429831 () Bool)

(assert (=> d!101635 e!429831))

(declare-fun c!85293 () Bool)

(assert (=> d!101635 (= c!85293 (and ((_ is Intermediate!7900) lt!343659) (undefined!8712 lt!343659)))))

(declare-fun e!429828 () SeekEntryResult!7900)

(assert (=> d!101635 (= lt!343659 e!429828)))

(declare-fun c!85292 () Bool)

(assert (=> d!101635 (= c!85292 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343660 () (_ BitVec 64))

(assert (=> d!101635 (= lt!343660 (select (arr!20303 lt!343576) index!1321))))

(assert (=> d!101635 (validMask!0 mask!3328)))

(assert (=> d!101635 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343579 lt!343576 mask!3328) lt!343659)))

(declare-fun b!772157 () Bool)

(assert (=> b!772157 (and (bvsge (index!33970 lt!343659) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343659) (size!20724 lt!343576)))))

(declare-fun res!522369 () Bool)

(assert (=> b!772157 (= res!522369 (= (select (arr!20303 lt!343576) (index!33970 lt!343659)) lt!343579))))

(assert (=> b!772157 (=> res!522369 e!429830)))

(declare-fun e!429827 () Bool)

(assert (=> b!772157 (= e!429827 e!429830)))

(declare-fun b!772158 () Bool)

(assert (=> b!772158 (= e!429831 (bvsge (x!64910 lt!343659) #b01111111111111111111111111111110))))

(declare-fun b!772159 () Bool)

(assert (=> b!772159 (and (bvsge (index!33970 lt!343659) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343659) (size!20724 lt!343576)))))

(declare-fun res!522368 () Bool)

(assert (=> b!772159 (= res!522368 (= (select (arr!20303 lt!343576) (index!33970 lt!343659)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772159 (=> res!522368 e!429830)))

(declare-fun b!772160 () Bool)

(assert (=> b!772160 (= e!429831 e!429827)))

(declare-fun res!522367 () Bool)

(assert (=> b!772160 (= res!522367 (and ((_ is Intermediate!7900) lt!343659) (not (undefined!8712 lt!343659)) (bvslt (x!64910 lt!343659) #b01111111111111111111111111111110) (bvsge (x!64910 lt!343659) #b00000000000000000000000000000000) (bvsge (x!64910 lt!343659) x!1131)))))

(assert (=> b!772160 (=> (not res!522367) (not e!429827))))

(declare-fun b!772161 () Bool)

(assert (=> b!772161 (= e!429828 e!429829)))

(declare-fun c!85291 () Bool)

(assert (=> b!772161 (= c!85291 (or (= lt!343660 lt!343579) (= (bvadd lt!343660 lt!343660) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772162 () Bool)

(assert (=> b!772162 (= e!429828 (Intermediate!7900 true index!1321 x!1131))))

(declare-fun b!772163 () Bool)

(assert (=> b!772163 (= e!429829 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!343579 lt!343576 mask!3328))))

(assert (= (and d!101635 c!85292) b!772162))

(assert (= (and d!101635 (not c!85292)) b!772161))

(assert (= (and b!772161 c!85291) b!772156))

(assert (= (and b!772161 (not c!85291)) b!772163))

(assert (= (and d!101635 c!85293) b!772158))

(assert (= (and d!101635 (not c!85293)) b!772160))

(assert (= (and b!772160 res!522367) b!772157))

(assert (= (and b!772157 (not res!522369)) b!772159))

(assert (= (and b!772159 (not res!522368)) b!772155))

(declare-fun m!716607 () Bool)

(assert (=> d!101635 m!716607))

(assert (=> d!101635 m!716477))

(declare-fun m!716609 () Bool)

(assert (=> b!772159 m!716609))

(assert (=> b!772155 m!716609))

(assert (=> b!772163 m!716475))

(assert (=> b!772163 m!716475))

(declare-fun m!716611 () Bool)

(assert (=> b!772163 m!716611))

(assert (=> b!772157 m!716609))

(assert (=> b!772001 d!101635))

(declare-fun b!772164 () Bool)

(declare-fun lt!343661 () SeekEntryResult!7900)

(assert (=> b!772164 (and (bvsge (index!33970 lt!343661) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343661) (size!20724 lt!343576)))))

(declare-fun e!429835 () Bool)

(assert (=> b!772164 (= e!429835 (= (select (arr!20303 lt!343576) (index!33970 lt!343661)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772165 () Bool)

(declare-fun e!429834 () SeekEntryResult!7900)

(assert (=> b!772165 (= e!429834 (Intermediate!7900 false (toIndex!0 lt!343579 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101637 () Bool)

(declare-fun e!429836 () Bool)

(assert (=> d!101637 e!429836))

(declare-fun c!85296 () Bool)

(assert (=> d!101637 (= c!85296 (and ((_ is Intermediate!7900) lt!343661) (undefined!8712 lt!343661)))))

(declare-fun e!429833 () SeekEntryResult!7900)

(assert (=> d!101637 (= lt!343661 e!429833)))

(declare-fun c!85295 () Bool)

(assert (=> d!101637 (= c!85295 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!343662 () (_ BitVec 64))

(assert (=> d!101637 (= lt!343662 (select (arr!20303 lt!343576) (toIndex!0 lt!343579 mask!3328)))))

(assert (=> d!101637 (validMask!0 mask!3328)))

(assert (=> d!101637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343579 mask!3328) lt!343579 lt!343576 mask!3328) lt!343661)))

(declare-fun b!772166 () Bool)

(assert (=> b!772166 (and (bvsge (index!33970 lt!343661) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343661) (size!20724 lt!343576)))))

(declare-fun res!522372 () Bool)

(assert (=> b!772166 (= res!522372 (= (select (arr!20303 lt!343576) (index!33970 lt!343661)) lt!343579))))

(assert (=> b!772166 (=> res!522372 e!429835)))

(declare-fun e!429832 () Bool)

(assert (=> b!772166 (= e!429832 e!429835)))

(declare-fun b!772167 () Bool)

(assert (=> b!772167 (= e!429836 (bvsge (x!64910 lt!343661) #b01111111111111111111111111111110))))

(declare-fun b!772168 () Bool)

(assert (=> b!772168 (and (bvsge (index!33970 lt!343661) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343661) (size!20724 lt!343576)))))

(declare-fun res!522371 () Bool)

(assert (=> b!772168 (= res!522371 (= (select (arr!20303 lt!343576) (index!33970 lt!343661)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772168 (=> res!522371 e!429835)))

(declare-fun b!772169 () Bool)

(assert (=> b!772169 (= e!429836 e!429832)))

(declare-fun res!522370 () Bool)

(assert (=> b!772169 (= res!522370 (and ((_ is Intermediate!7900) lt!343661) (not (undefined!8712 lt!343661)) (bvslt (x!64910 lt!343661) #b01111111111111111111111111111110) (bvsge (x!64910 lt!343661) #b00000000000000000000000000000000) (bvsge (x!64910 lt!343661) #b00000000000000000000000000000000)))))

(assert (=> b!772169 (=> (not res!522370) (not e!429832))))

(declare-fun b!772170 () Bool)

(assert (=> b!772170 (= e!429833 e!429834)))

(declare-fun c!85294 () Bool)

(assert (=> b!772170 (= c!85294 (or (= lt!343662 lt!343579) (= (bvadd lt!343662 lt!343662) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772171 () Bool)

(assert (=> b!772171 (= e!429833 (Intermediate!7900 true (toIndex!0 lt!343579 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!772172 () Bool)

(assert (=> b!772172 (= e!429834 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!343579 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!343579 lt!343576 mask!3328))))

(assert (= (and d!101637 c!85295) b!772171))

(assert (= (and d!101637 (not c!85295)) b!772170))

(assert (= (and b!772170 c!85294) b!772165))

(assert (= (and b!772170 (not c!85294)) b!772172))

(assert (= (and d!101637 c!85296) b!772167))

(assert (= (and d!101637 (not c!85296)) b!772169))

(assert (= (and b!772169 res!522370) b!772166))

(assert (= (and b!772166 (not res!522372)) b!772168))

(assert (= (and b!772168 (not res!522371)) b!772164))

(assert (=> d!101637 m!716451))

(declare-fun m!716613 () Bool)

(assert (=> d!101637 m!716613))

(assert (=> d!101637 m!716477))

(declare-fun m!716615 () Bool)

(assert (=> b!772168 m!716615))

(assert (=> b!772164 m!716615))

(assert (=> b!772172 m!716451))

(declare-fun m!716617 () Bool)

(assert (=> b!772172 m!716617))

(assert (=> b!772172 m!716617))

(declare-fun m!716619 () Bool)

(assert (=> b!772172 m!716619))

(assert (=> b!772166 m!716615))

(assert (=> b!772001 d!101637))

(declare-fun d!101639 () Bool)

(declare-fun lt!343668 () (_ BitVec 32))

(declare-fun lt!343667 () (_ BitVec 32))

(assert (=> d!101639 (= lt!343668 (bvmul (bvxor lt!343667 (bvlshr lt!343667 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101639 (= lt!343667 ((_ extract 31 0) (bvand (bvxor lt!343579 (bvlshr lt!343579 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101639 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522373 (let ((h!15445 ((_ extract 31 0) (bvand (bvxor lt!343579 (bvlshr lt!343579 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64914 (bvmul (bvxor h!15445 (bvlshr h!15445 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64914 (bvlshr x!64914 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522373 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522373 #b00000000000000000000000000000000))))))

(assert (=> d!101639 (= (toIndex!0 lt!343579 mask!3328) (bvand (bvxor lt!343668 (bvlshr lt!343668 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!772001 d!101639))

(declare-fun b!772181 () Bool)

(declare-fun e!429845 () Bool)

(declare-fun e!429844 () Bool)

(assert (=> b!772181 (= e!429845 e!429844)))

(declare-fun c!85299 () Bool)

(assert (=> b!772181 (= c!85299 (validKeyInArray!0 (select (arr!20303 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35104 () Bool)

(declare-fun call!35107 () Bool)

(assert (=> bm!35104 (= call!35107 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!772182 () Bool)

(assert (=> b!772182 (= e!429844 call!35107)))

(declare-fun b!772183 () Bool)

(declare-fun e!429843 () Bool)

(assert (=> b!772183 (= e!429844 e!429843)))

(declare-fun lt!343677 () (_ BitVec 64))

(assert (=> b!772183 (= lt!343677 (select (arr!20303 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!343676 () Unit!26594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42408 (_ BitVec 64) (_ BitVec 32)) Unit!26594)

(assert (=> b!772183 (= lt!343676 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343677 #b00000000000000000000000000000000))))

(assert (=> b!772183 (arrayContainsKey!0 a!3186 lt!343677 #b00000000000000000000000000000000)))

(declare-fun lt!343675 () Unit!26594)

(assert (=> b!772183 (= lt!343675 lt!343676)))

(declare-fun res!522378 () Bool)

(assert (=> b!772183 (= res!522378 (= (seekEntryOrOpen!0 (select (arr!20303 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7900 #b00000000000000000000000000000000)))))

(assert (=> b!772183 (=> (not res!522378) (not e!429843))))

(declare-fun b!772184 () Bool)

(assert (=> b!772184 (= e!429843 call!35107)))

(declare-fun d!101641 () Bool)

(declare-fun res!522379 () Bool)

(assert (=> d!101641 (=> res!522379 e!429845)))

(assert (=> d!101641 (= res!522379 (bvsge #b00000000000000000000000000000000 (size!20724 a!3186)))))

(assert (=> d!101641 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!429845)))

(assert (= (and d!101641 (not res!522379)) b!772181))

(assert (= (and b!772181 c!85299) b!772183))

(assert (= (and b!772181 (not c!85299)) b!772182))

(assert (= (and b!772183 res!522378) b!772184))

(assert (= (or b!772184 b!772182) bm!35104))

(declare-fun m!716621 () Bool)

(assert (=> b!772181 m!716621))

(assert (=> b!772181 m!716621))

(declare-fun m!716623 () Bool)

(assert (=> b!772181 m!716623))

(declare-fun m!716625 () Bool)

(assert (=> bm!35104 m!716625))

(assert (=> b!772183 m!716621))

(declare-fun m!716627 () Bool)

(assert (=> b!772183 m!716627))

(declare-fun m!716629 () Bool)

(assert (=> b!772183 m!716629))

(assert (=> b!772183 m!716621))

(declare-fun m!716631 () Bool)

(assert (=> b!772183 m!716631))

(assert (=> b!772002 d!101641))

(declare-fun b!772197 () Bool)

(declare-fun c!85308 () Bool)

(declare-fun lt!343686 () (_ BitVec 64))

(assert (=> b!772197 (= c!85308 (= lt!343686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429853 () SeekEntryResult!7900)

(declare-fun e!429852 () SeekEntryResult!7900)

(assert (=> b!772197 (= e!429853 e!429852)))

(declare-fun b!772198 () Bool)

(declare-fun lt!343684 () SeekEntryResult!7900)

(assert (=> b!772198 (= e!429853 (Found!7900 (index!33970 lt!343684)))))

(declare-fun b!772199 () Bool)

(declare-fun e!429854 () SeekEntryResult!7900)

(assert (=> b!772199 (= e!429854 e!429853)))

(assert (=> b!772199 (= lt!343686 (select (arr!20303 a!3186) (index!33970 lt!343684)))))

(declare-fun c!85307 () Bool)

(assert (=> b!772199 (= c!85307 (= lt!343686 (select (arr!20303 a!3186) j!159)))))

(declare-fun b!772200 () Bool)

(assert (=> b!772200 (= e!429852 (seekKeyOrZeroReturnVacant!0 (x!64910 lt!343684) (index!33970 lt!343684) (index!33970 lt!343684) (select (arr!20303 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101643 () Bool)

(declare-fun lt!343685 () SeekEntryResult!7900)

(assert (=> d!101643 (and (or ((_ is Undefined!7900) lt!343685) (not ((_ is Found!7900) lt!343685)) (and (bvsge (index!33969 lt!343685) #b00000000000000000000000000000000) (bvslt (index!33969 lt!343685) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343685) ((_ is Found!7900) lt!343685) (not ((_ is MissingZero!7900) lt!343685)) (and (bvsge (index!33968 lt!343685) #b00000000000000000000000000000000) (bvslt (index!33968 lt!343685) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343685) ((_ is Found!7900) lt!343685) ((_ is MissingZero!7900) lt!343685) (not ((_ is MissingVacant!7900) lt!343685)) (and (bvsge (index!33971 lt!343685) #b00000000000000000000000000000000) (bvslt (index!33971 lt!343685) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343685) (ite ((_ is Found!7900) lt!343685) (= (select (arr!20303 a!3186) (index!33969 lt!343685)) (select (arr!20303 a!3186) j!159)) (ite ((_ is MissingZero!7900) lt!343685) (= (select (arr!20303 a!3186) (index!33968 lt!343685)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7900) lt!343685) (= (select (arr!20303 a!3186) (index!33971 lt!343685)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101643 (= lt!343685 e!429854)))

(declare-fun c!85306 () Bool)

(assert (=> d!101643 (= c!85306 (and ((_ is Intermediate!7900) lt!343684) (undefined!8712 lt!343684)))))

(assert (=> d!101643 (= lt!343684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20303 a!3186) j!159) mask!3328) (select (arr!20303 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101643 (validMask!0 mask!3328)))

(assert (=> d!101643 (= (seekEntryOrOpen!0 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343685)))

(declare-fun b!772201 () Bool)

(assert (=> b!772201 (= e!429854 Undefined!7900)))

(declare-fun b!772202 () Bool)

(assert (=> b!772202 (= e!429852 (MissingZero!7900 (index!33970 lt!343684)))))

(assert (= (and d!101643 c!85306) b!772201))

(assert (= (and d!101643 (not c!85306)) b!772199))

(assert (= (and b!772199 c!85307) b!772198))

(assert (= (and b!772199 (not c!85307)) b!772197))

(assert (= (and b!772197 c!85308) b!772202))

(assert (= (and b!772197 (not c!85308)) b!772200))

(declare-fun m!716633 () Bool)

(assert (=> b!772199 m!716633))

(assert (=> b!772200 m!716461))

(declare-fun m!716635 () Bool)

(assert (=> b!772200 m!716635))

(assert (=> d!101643 m!716461))

(assert (=> d!101643 m!716487))

(declare-fun m!716637 () Bool)

(assert (=> d!101643 m!716637))

(declare-fun m!716639 () Bool)

(assert (=> d!101643 m!716639))

(assert (=> d!101643 m!716487))

(assert (=> d!101643 m!716461))

(assert (=> d!101643 m!716489))

(assert (=> d!101643 m!716477))

(declare-fun m!716641 () Bool)

(assert (=> d!101643 m!716641))

(assert (=> b!771991 d!101643))

(declare-fun d!101647 () Bool)

(declare-fun lt!343689 () (_ BitVec 32))

(assert (=> d!101647 (and (bvsge lt!343689 #b00000000000000000000000000000000) (bvslt lt!343689 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101647 (= lt!343689 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101647 (validMask!0 mask!3328)))

(assert (=> d!101647 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!343689)))

(declare-fun bs!21573 () Bool)

(assert (= bs!21573 d!101647))

(declare-fun m!716643 () Bool)

(assert (=> bs!21573 m!716643))

(assert (=> bs!21573 m!716477))

(assert (=> b!771992 d!101647))

(declare-fun b!772225 () Bool)

(declare-fun e!429871 () Bool)

(declare-fun e!429870 () Bool)

(assert (=> b!772225 (= e!429871 e!429870)))

(declare-fun c!85317 () Bool)

(assert (=> b!772225 (= c!85317 (validKeyInArray!0 (select (arr!20303 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!772226 () Bool)

(declare-fun call!35110 () Bool)

(assert (=> b!772226 (= e!429870 call!35110)))

(declare-fun b!772227 () Bool)

(declare-fun e!429872 () Bool)

(declare-fun contains!4072 (List!14344 (_ BitVec 64)) Bool)

(assert (=> b!772227 (= e!429872 (contains!4072 Nil!14341 (select (arr!20303 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!772228 () Bool)

(declare-fun e!429869 () Bool)

(assert (=> b!772228 (= e!429869 e!429871)))

(declare-fun res!522386 () Bool)

(assert (=> b!772228 (=> (not res!522386) (not e!429871))))

(assert (=> b!772228 (= res!522386 (not e!429872))))

(declare-fun res!522388 () Bool)

(assert (=> b!772228 (=> (not res!522388) (not e!429872))))

(assert (=> b!772228 (= res!522388 (validKeyInArray!0 (select (arr!20303 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!772229 () Bool)

(assert (=> b!772229 (= e!429870 call!35110)))

(declare-fun bm!35107 () Bool)

(assert (=> bm!35107 (= call!35110 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85317 (Cons!14340 (select (arr!20303 a!3186) #b00000000000000000000000000000000) Nil!14341) Nil!14341)))))

(declare-fun d!101649 () Bool)

(declare-fun res!522387 () Bool)

(assert (=> d!101649 (=> res!522387 e!429869)))

(assert (=> d!101649 (= res!522387 (bvsge #b00000000000000000000000000000000 (size!20724 a!3186)))))

(assert (=> d!101649 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14341) e!429869)))

(assert (= (and d!101649 (not res!522387)) b!772228))

(assert (= (and b!772228 res!522388) b!772227))

(assert (= (and b!772228 res!522386) b!772225))

(assert (= (and b!772225 c!85317) b!772229))

(assert (= (and b!772225 (not c!85317)) b!772226))

(assert (= (or b!772229 b!772226) bm!35107))

(assert (=> b!772225 m!716621))

(assert (=> b!772225 m!716621))

(assert (=> b!772225 m!716623))

(assert (=> b!772227 m!716621))

(assert (=> b!772227 m!716621))

(declare-fun m!716645 () Bool)

(assert (=> b!772227 m!716645))

(assert (=> b!772228 m!716621))

(assert (=> b!772228 m!716621))

(assert (=> b!772228 m!716623))

(assert (=> bm!35107 m!716621))

(declare-fun m!716647 () Bool)

(assert (=> bm!35107 m!716647))

(assert (=> b!772003 d!101649))

(declare-fun b!772260 () Bool)

(declare-fun e!429893 () SeekEntryResult!7900)

(assert (=> b!772260 (= e!429893 (Found!7900 resIntermediateIndex!5))))

(declare-fun b!772261 () Bool)

(declare-fun e!429891 () SeekEntryResult!7900)

(assert (=> b!772261 (= e!429891 Undefined!7900)))

(declare-fun d!101651 () Bool)

(declare-fun lt!343713 () SeekEntryResult!7900)

(assert (=> d!101651 (and (or ((_ is Undefined!7900) lt!343713) (not ((_ is Found!7900) lt!343713)) (and (bvsge (index!33969 lt!343713) #b00000000000000000000000000000000) (bvslt (index!33969 lt!343713) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343713) ((_ is Found!7900) lt!343713) (not ((_ is MissingVacant!7900) lt!343713)) (not (= (index!33971 lt!343713) resIntermediateIndex!5)) (and (bvsge (index!33971 lt!343713) #b00000000000000000000000000000000) (bvslt (index!33971 lt!343713) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343713) (ite ((_ is Found!7900) lt!343713) (= (select (arr!20303 a!3186) (index!33969 lt!343713)) (select (arr!20303 a!3186) j!159)) (and ((_ is MissingVacant!7900) lt!343713) (= (index!33971 lt!343713) resIntermediateIndex!5) (= (select (arr!20303 a!3186) (index!33971 lt!343713)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101651 (= lt!343713 e!429891)))

(declare-fun c!85330 () Bool)

(assert (=> d!101651 (= c!85330 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!343712 () (_ BitVec 64))

(assert (=> d!101651 (= lt!343712 (select (arr!20303 a!3186) resIntermediateIndex!5))))

(assert (=> d!101651 (validMask!0 mask!3328)))

(assert (=> d!101651 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343713)))

(declare-fun b!772262 () Bool)

(assert (=> b!772262 (= e!429891 e!429893)))

(declare-fun c!85332 () Bool)

(assert (=> b!772262 (= c!85332 (= lt!343712 (select (arr!20303 a!3186) j!159)))))

(declare-fun b!772263 () Bool)

(declare-fun e!429892 () SeekEntryResult!7900)

(assert (=> b!772263 (= e!429892 (MissingVacant!7900 resIntermediateIndex!5))))

(declare-fun b!772264 () Bool)

(declare-fun c!85331 () Bool)

(assert (=> b!772264 (= c!85331 (= lt!343712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772264 (= e!429893 e!429892)))

(declare-fun b!772265 () Bool)

(assert (=> b!772265 (= e!429892 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101651 c!85330) b!772261))

(assert (= (and d!101651 (not c!85330)) b!772262))

(assert (= (and b!772262 c!85332) b!772260))

(assert (= (and b!772262 (not c!85332)) b!772264))

(assert (= (and b!772264 c!85331) b!772263))

(assert (= (and b!772264 (not c!85331)) b!772265))

(declare-fun m!716665 () Bool)

(assert (=> d!101651 m!716665))

(declare-fun m!716667 () Bool)

(assert (=> d!101651 m!716667))

(assert (=> d!101651 m!716457))

(assert (=> d!101651 m!716477))

(declare-fun m!716671 () Bool)

(assert (=> b!772265 m!716671))

(assert (=> b!772265 m!716671))

(assert (=> b!772265 m!716461))

(declare-fun m!716677 () Bool)

(assert (=> b!772265 m!716677))

(assert (=> b!772004 d!101651))

(declare-fun b!772270 () Bool)

(declare-fun e!429899 () Bool)

(declare-fun e!429898 () Bool)

(assert (=> b!772270 (= e!429899 e!429898)))

(declare-fun c!85334 () Bool)

(assert (=> b!772270 (= c!85334 (validKeyInArray!0 (select (arr!20303 a!3186) j!159)))))

(declare-fun bm!35112 () Bool)

(declare-fun call!35115 () Bool)

(assert (=> bm!35112 (= call!35115 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!772271 () Bool)

(assert (=> b!772271 (= e!429898 call!35115)))

(declare-fun b!772272 () Bool)

(declare-fun e!429897 () Bool)

(assert (=> b!772272 (= e!429898 e!429897)))

(declare-fun lt!343719 () (_ BitVec 64))

(assert (=> b!772272 (= lt!343719 (select (arr!20303 a!3186) j!159))))

(declare-fun lt!343718 () Unit!26594)

(assert (=> b!772272 (= lt!343718 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343719 j!159))))

(assert (=> b!772272 (arrayContainsKey!0 a!3186 lt!343719 #b00000000000000000000000000000000)))

(declare-fun lt!343717 () Unit!26594)

(assert (=> b!772272 (= lt!343717 lt!343718)))

(declare-fun res!522397 () Bool)

(assert (=> b!772272 (= res!522397 (= (seekEntryOrOpen!0 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) (Found!7900 j!159)))))

(assert (=> b!772272 (=> (not res!522397) (not e!429897))))

(declare-fun b!772273 () Bool)

(assert (=> b!772273 (= e!429897 call!35115)))

(declare-fun d!101661 () Bool)

(declare-fun res!522398 () Bool)

(assert (=> d!101661 (=> res!522398 e!429899)))

(assert (=> d!101661 (= res!522398 (bvsge j!159 (size!20724 a!3186)))))

(assert (=> d!101661 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!429899)))

(assert (= (and d!101661 (not res!522398)) b!772270))

(assert (= (and b!772270 c!85334) b!772272))

(assert (= (and b!772270 (not c!85334)) b!772271))

(assert (= (and b!772272 res!522397) b!772273))

(assert (= (or b!772273 b!772271) bm!35112))

(assert (=> b!772270 m!716461))

(assert (=> b!772270 m!716461))

(assert (=> b!772270 m!716493))

(declare-fun m!716685 () Bool)

(assert (=> bm!35112 m!716685))

(assert (=> b!772272 m!716461))

(declare-fun m!716687 () Bool)

(assert (=> b!772272 m!716687))

(declare-fun m!716689 () Bool)

(assert (=> b!772272 m!716689))

(assert (=> b!772272 m!716461))

(assert (=> b!772272 m!716473))

(assert (=> b!771993 d!101661))

(declare-fun d!101665 () Bool)

(assert (=> d!101665 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!343724 () Unit!26594)

(declare-fun choose!38 (array!42408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26594)

(assert (=> d!101665 (= lt!343724 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101665 (validMask!0 mask!3328)))

(assert (=> d!101665 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!343724)))

(declare-fun bs!21575 () Bool)

(assert (= bs!21575 d!101665))

(assert (=> bs!21575 m!716481))

(declare-fun m!716699 () Bool)

(assert (=> bs!21575 m!716699))

(assert (=> bs!21575 m!716477))

(assert (=> b!771993 d!101665))

(declare-fun d!101673 () Bool)

(declare-fun res!522403 () Bool)

(declare-fun e!429907 () Bool)

(assert (=> d!101673 (=> res!522403 e!429907)))

(assert (=> d!101673 (= res!522403 (= (select (arr!20303 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101673 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!429907)))

(declare-fun b!772284 () Bool)

(declare-fun e!429908 () Bool)

(assert (=> b!772284 (= e!429907 e!429908)))

(declare-fun res!522404 () Bool)

(assert (=> b!772284 (=> (not res!522404) (not e!429908))))

(assert (=> b!772284 (= res!522404 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20724 a!3186)))))

(declare-fun b!772285 () Bool)

(assert (=> b!772285 (= e!429908 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101673 (not res!522403)) b!772284))

(assert (= (and b!772284 res!522404) b!772285))

(assert (=> d!101673 m!716621))

(declare-fun m!716701 () Bool)

(assert (=> b!772285 m!716701))

(assert (=> b!772005 d!101673))

(declare-fun d!101675 () Bool)

(assert (=> d!101675 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!772006 d!101675))

(declare-fun b!772294 () Bool)

(declare-fun lt!343731 () SeekEntryResult!7900)

(assert (=> b!772294 (and (bvsge (index!33970 lt!343731) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343731) (size!20724 a!3186)))))

(declare-fun e!429916 () Bool)

(assert (=> b!772294 (= e!429916 (= (select (arr!20303 a!3186) (index!33970 lt!343731)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772295 () Bool)

(declare-fun e!429915 () SeekEntryResult!7900)

(assert (=> b!772295 (= e!429915 (Intermediate!7900 false (toIndex!0 (select (arr!20303 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101677 () Bool)

(declare-fun e!429917 () Bool)

(assert (=> d!101677 e!429917))

(declare-fun c!85344 () Bool)

(assert (=> d!101677 (= c!85344 (and ((_ is Intermediate!7900) lt!343731) (undefined!8712 lt!343731)))))

(declare-fun e!429914 () SeekEntryResult!7900)

(assert (=> d!101677 (= lt!343731 e!429914)))

(declare-fun c!85343 () Bool)

(assert (=> d!101677 (= c!85343 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!343732 () (_ BitVec 64))

(assert (=> d!101677 (= lt!343732 (select (arr!20303 a!3186) (toIndex!0 (select (arr!20303 a!3186) j!159) mask!3328)))))

(assert (=> d!101677 (validMask!0 mask!3328)))

(assert (=> d!101677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20303 a!3186) j!159) mask!3328) (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343731)))

(declare-fun b!772296 () Bool)

(assert (=> b!772296 (and (bvsge (index!33970 lt!343731) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343731) (size!20724 a!3186)))))

(declare-fun res!522407 () Bool)

(assert (=> b!772296 (= res!522407 (= (select (arr!20303 a!3186) (index!33970 lt!343731)) (select (arr!20303 a!3186) j!159)))))

(assert (=> b!772296 (=> res!522407 e!429916)))

(declare-fun e!429913 () Bool)

(assert (=> b!772296 (= e!429913 e!429916)))

(declare-fun b!772297 () Bool)

(assert (=> b!772297 (= e!429917 (bvsge (x!64910 lt!343731) #b01111111111111111111111111111110))))

(declare-fun b!772298 () Bool)

(assert (=> b!772298 (and (bvsge (index!33970 lt!343731) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343731) (size!20724 a!3186)))))

(declare-fun res!522406 () Bool)

(assert (=> b!772298 (= res!522406 (= (select (arr!20303 a!3186) (index!33970 lt!343731)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772298 (=> res!522406 e!429916)))

(declare-fun b!772299 () Bool)

(assert (=> b!772299 (= e!429917 e!429913)))

(declare-fun res!522405 () Bool)

(assert (=> b!772299 (= res!522405 (and ((_ is Intermediate!7900) lt!343731) (not (undefined!8712 lt!343731)) (bvslt (x!64910 lt!343731) #b01111111111111111111111111111110) (bvsge (x!64910 lt!343731) #b00000000000000000000000000000000) (bvsge (x!64910 lt!343731) #b00000000000000000000000000000000)))))

(assert (=> b!772299 (=> (not res!522405) (not e!429913))))

(declare-fun b!772300 () Bool)

(assert (=> b!772300 (= e!429914 e!429915)))

(declare-fun c!85342 () Bool)

(assert (=> b!772300 (= c!85342 (or (= lt!343732 (select (arr!20303 a!3186) j!159)) (= (bvadd lt!343732 lt!343732) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772301 () Bool)

(assert (=> b!772301 (= e!429914 (Intermediate!7900 true (toIndex!0 (select (arr!20303 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!772302 () Bool)

(assert (=> b!772302 (= e!429915 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20303 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20303 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101677 c!85343) b!772301))

(assert (= (and d!101677 (not c!85343)) b!772300))

(assert (= (and b!772300 c!85342) b!772295))

(assert (= (and b!772300 (not c!85342)) b!772302))

(assert (= (and d!101677 c!85344) b!772297))

(assert (= (and d!101677 (not c!85344)) b!772299))

(assert (= (and b!772299 res!522405) b!772296))

(assert (= (and b!772296 (not res!522407)) b!772298))

(assert (= (and b!772298 (not res!522406)) b!772294))

(assert (=> d!101677 m!716487))

(declare-fun m!716703 () Bool)

(assert (=> d!101677 m!716703))

(assert (=> d!101677 m!716477))

(declare-fun m!716705 () Bool)

(assert (=> b!772298 m!716705))

(assert (=> b!772294 m!716705))

(assert (=> b!772302 m!716487))

(declare-fun m!716707 () Bool)

(assert (=> b!772302 m!716707))

(assert (=> b!772302 m!716707))

(assert (=> b!772302 m!716461))

(declare-fun m!716709 () Bool)

(assert (=> b!772302 m!716709))

(assert (=> b!772296 m!716705))

(assert (=> b!771995 d!101677))

(declare-fun d!101679 () Bool)

(declare-fun lt!343734 () (_ BitVec 32))

(declare-fun lt!343733 () (_ BitVec 32))

(assert (=> d!101679 (= lt!343734 (bvmul (bvxor lt!343733 (bvlshr lt!343733 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101679 (= lt!343733 ((_ extract 31 0) (bvand (bvxor (select (arr!20303 a!3186) j!159) (bvlshr (select (arr!20303 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101679 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522373 (let ((h!15445 ((_ extract 31 0) (bvand (bvxor (select (arr!20303 a!3186) j!159) (bvlshr (select (arr!20303 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64914 (bvmul (bvxor h!15445 (bvlshr h!15445 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64914 (bvlshr x!64914 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522373 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522373 #b00000000000000000000000000000000))))))

(assert (=> d!101679 (= (toIndex!0 (select (arr!20303 a!3186) j!159) mask!3328) (bvand (bvxor lt!343734 (bvlshr lt!343734 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!771995 d!101679))

(declare-fun b!772307 () Bool)

(declare-fun e!429922 () SeekEntryResult!7900)

(assert (=> b!772307 (= e!429922 (Found!7900 index!1321))))

(declare-fun b!772308 () Bool)

(declare-fun e!429920 () SeekEntryResult!7900)

(assert (=> b!772308 (= e!429920 Undefined!7900)))

(declare-fun d!101681 () Bool)

(declare-fun lt!343736 () SeekEntryResult!7900)

(assert (=> d!101681 (and (or ((_ is Undefined!7900) lt!343736) (not ((_ is Found!7900) lt!343736)) (and (bvsge (index!33969 lt!343736) #b00000000000000000000000000000000) (bvslt (index!33969 lt!343736) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343736) ((_ is Found!7900) lt!343736) (not ((_ is MissingVacant!7900) lt!343736)) (not (= (index!33971 lt!343736) resIntermediateIndex!5)) (and (bvsge (index!33971 lt!343736) #b00000000000000000000000000000000) (bvslt (index!33971 lt!343736) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343736) (ite ((_ is Found!7900) lt!343736) (= (select (arr!20303 a!3186) (index!33969 lt!343736)) (select (arr!20303 a!3186) j!159)) (and ((_ is MissingVacant!7900) lt!343736) (= (index!33971 lt!343736) resIntermediateIndex!5) (= (select (arr!20303 a!3186) (index!33971 lt!343736)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101681 (= lt!343736 e!429920)))

(declare-fun c!85347 () Bool)

(assert (=> d!101681 (= c!85347 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343735 () (_ BitVec 64))

(assert (=> d!101681 (= lt!343735 (select (arr!20303 a!3186) index!1321))))

(assert (=> d!101681 (validMask!0 mask!3328)))

(assert (=> d!101681 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343736)))

(declare-fun b!772309 () Bool)

(assert (=> b!772309 (= e!429920 e!429922)))

(declare-fun c!85349 () Bool)

(assert (=> b!772309 (= c!85349 (= lt!343735 (select (arr!20303 a!3186) j!159)))))

(declare-fun b!772310 () Bool)

(declare-fun e!429921 () SeekEntryResult!7900)

(assert (=> b!772310 (= e!429921 (MissingVacant!7900 resIntermediateIndex!5))))

(declare-fun b!772311 () Bool)

(declare-fun c!85348 () Bool)

(assert (=> b!772311 (= c!85348 (= lt!343735 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772311 (= e!429922 e!429921)))

(declare-fun b!772312 () Bool)

(assert (=> b!772312 (= e!429921 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101681 c!85347) b!772308))

(assert (= (and d!101681 (not c!85347)) b!772309))

(assert (= (and b!772309 c!85349) b!772307))

(assert (= (and b!772309 (not c!85349)) b!772311))

(assert (= (and b!772311 c!85348) b!772310))

(assert (= (and b!772311 (not c!85348)) b!772312))

(declare-fun m!716711 () Bool)

(assert (=> d!101681 m!716711))

(declare-fun m!716713 () Bool)

(assert (=> d!101681 m!716713))

(assert (=> d!101681 m!716601))

(assert (=> d!101681 m!716477))

(assert (=> b!772312 m!716475))

(assert (=> b!772312 m!716475))

(assert (=> b!772312 m!716461))

(declare-fun m!716715 () Bool)

(assert (=> b!772312 m!716715))

(assert (=> b!771996 d!101681))

(assert (=> b!771998 d!101681))

(declare-fun b!772313 () Bool)

(declare-fun e!429925 () SeekEntryResult!7900)

(assert (=> b!772313 (= e!429925 (Found!7900 lt!343583))))

(declare-fun b!772314 () Bool)

(declare-fun e!429923 () SeekEntryResult!7900)

(assert (=> b!772314 (= e!429923 Undefined!7900)))

(declare-fun lt!343738 () SeekEntryResult!7900)

(declare-fun d!101683 () Bool)

(assert (=> d!101683 (and (or ((_ is Undefined!7900) lt!343738) (not ((_ is Found!7900) lt!343738)) (and (bvsge (index!33969 lt!343738) #b00000000000000000000000000000000) (bvslt (index!33969 lt!343738) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343738) ((_ is Found!7900) lt!343738) (not ((_ is MissingVacant!7900) lt!343738)) (not (= (index!33971 lt!343738) resIntermediateIndex!5)) (and (bvsge (index!33971 lt!343738) #b00000000000000000000000000000000) (bvslt (index!33971 lt!343738) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343738) (ite ((_ is Found!7900) lt!343738) (= (select (arr!20303 a!3186) (index!33969 lt!343738)) (select (arr!20303 a!3186) j!159)) (and ((_ is MissingVacant!7900) lt!343738) (= (index!33971 lt!343738) resIntermediateIndex!5) (= (select (arr!20303 a!3186) (index!33971 lt!343738)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101683 (= lt!343738 e!429923)))

(declare-fun c!85350 () Bool)

(assert (=> d!101683 (= c!85350 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343737 () (_ BitVec 64))

(assert (=> d!101683 (= lt!343737 (select (arr!20303 a!3186) lt!343583))))

(assert (=> d!101683 (validMask!0 mask!3328)))

(assert (=> d!101683 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343583 resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343738)))

(declare-fun b!772315 () Bool)

(assert (=> b!772315 (= e!429923 e!429925)))

(declare-fun c!85352 () Bool)

(assert (=> b!772315 (= c!85352 (= lt!343737 (select (arr!20303 a!3186) j!159)))))

(declare-fun b!772316 () Bool)

(declare-fun e!429924 () SeekEntryResult!7900)

(assert (=> b!772316 (= e!429924 (MissingVacant!7900 resIntermediateIndex!5))))

(declare-fun b!772317 () Bool)

(declare-fun c!85351 () Bool)

(assert (=> b!772317 (= c!85351 (= lt!343737 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772317 (= e!429925 e!429924)))

(declare-fun b!772318 () Bool)

(assert (=> b!772318 (= e!429924 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343583 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20303 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101683 c!85350) b!772314))

(assert (= (and d!101683 (not c!85350)) b!772315))

(assert (= (and b!772315 c!85352) b!772313))

(assert (= (and b!772315 (not c!85352)) b!772317))

(assert (= (and b!772317 c!85351) b!772316))

(assert (= (and b!772317 (not c!85351)) b!772318))

(declare-fun m!716717 () Bool)

(assert (=> d!101683 m!716717))

(declare-fun m!716719 () Bool)

(assert (=> d!101683 m!716719))

(declare-fun m!716721 () Bool)

(assert (=> d!101683 m!716721))

(assert (=> d!101683 m!716477))

(declare-fun m!716723 () Bool)

(assert (=> b!772318 m!716723))

(assert (=> b!772318 m!716723))

(assert (=> b!772318 m!716461))

(declare-fun m!716725 () Bool)

(assert (=> b!772318 m!716725))

(assert (=> b!771998 d!101683))

(declare-fun b!772319 () Bool)

(declare-fun lt!343739 () SeekEntryResult!7900)

(assert (=> b!772319 (and (bvsge (index!33970 lt!343739) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343739) (size!20724 a!3186)))))

(declare-fun e!429929 () Bool)

(assert (=> b!772319 (= e!429929 (= (select (arr!20303 a!3186) (index!33970 lt!343739)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772320 () Bool)

(declare-fun e!429928 () SeekEntryResult!7900)

(assert (=> b!772320 (= e!429928 (Intermediate!7900 false lt!343583 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun d!101687 () Bool)

(declare-fun e!429930 () Bool)

(assert (=> d!101687 e!429930))

(declare-fun c!85355 () Bool)

(assert (=> d!101687 (= c!85355 (and ((_ is Intermediate!7900) lt!343739) (undefined!8712 lt!343739)))))

(declare-fun e!429927 () SeekEntryResult!7900)

(assert (=> d!101687 (= lt!343739 e!429927)))

(declare-fun c!85354 () Bool)

(assert (=> d!101687 (= c!85354 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343740 () (_ BitVec 64))

(assert (=> d!101687 (= lt!343740 (select (arr!20303 a!3186) lt!343583))))

(assert (=> d!101687 (validMask!0 mask!3328)))

(assert (=> d!101687 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343583 (select (arr!20303 a!3186) j!159) a!3186 mask!3328) lt!343739)))

(declare-fun b!772321 () Bool)

(assert (=> b!772321 (and (bvsge (index!33970 lt!343739) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343739) (size!20724 a!3186)))))

(declare-fun res!522410 () Bool)

(assert (=> b!772321 (= res!522410 (= (select (arr!20303 a!3186) (index!33970 lt!343739)) (select (arr!20303 a!3186) j!159)))))

(assert (=> b!772321 (=> res!522410 e!429929)))

(declare-fun e!429926 () Bool)

(assert (=> b!772321 (= e!429926 e!429929)))

(declare-fun b!772322 () Bool)

(assert (=> b!772322 (= e!429930 (bvsge (x!64910 lt!343739) #b01111111111111111111111111111110))))

(declare-fun b!772323 () Bool)

(assert (=> b!772323 (and (bvsge (index!33970 lt!343739) #b00000000000000000000000000000000) (bvslt (index!33970 lt!343739) (size!20724 a!3186)))))

(declare-fun res!522409 () Bool)

(assert (=> b!772323 (= res!522409 (= (select (arr!20303 a!3186) (index!33970 lt!343739)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772323 (=> res!522409 e!429929)))

(declare-fun b!772324 () Bool)

(assert (=> b!772324 (= e!429930 e!429926)))

(declare-fun res!522408 () Bool)

(assert (=> b!772324 (= res!522408 (and ((_ is Intermediate!7900) lt!343739) (not (undefined!8712 lt!343739)) (bvslt (x!64910 lt!343739) #b01111111111111111111111111111110) (bvsge (x!64910 lt!343739) #b00000000000000000000000000000000) (bvsge (x!64910 lt!343739) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!772324 (=> (not res!522408) (not e!429926))))

(declare-fun b!772325 () Bool)

(assert (=> b!772325 (= e!429927 e!429928)))

(declare-fun c!85353 () Bool)

(assert (=> b!772325 (= c!85353 (or (= lt!343740 (select (arr!20303 a!3186) j!159)) (= (bvadd lt!343740 lt!343740) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772326 () Bool)

(assert (=> b!772326 (= e!429927 (Intermediate!7900 true lt!343583 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!772327 () Bool)

(assert (=> b!772327 (= e!429928 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343583 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20303 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101687 c!85354) b!772326))

(assert (= (and d!101687 (not c!85354)) b!772325))

(assert (= (and b!772325 c!85353) b!772320))

(assert (= (and b!772325 (not c!85353)) b!772327))

(assert (= (and d!101687 c!85355) b!772322))

(assert (= (and d!101687 (not c!85355)) b!772324))

(assert (= (and b!772324 res!522408) b!772321))

(assert (= (and b!772321 (not res!522410)) b!772323))

(assert (= (and b!772323 (not res!522409)) b!772319))

(assert (=> d!101687 m!716721))

(assert (=> d!101687 m!716477))

(declare-fun m!716727 () Bool)

(assert (=> b!772323 m!716727))

(assert (=> b!772319 m!716727))

(assert (=> b!772327 m!716723))

(assert (=> b!772327 m!716723))

(assert (=> b!772327 m!716461))

(declare-fun m!716729 () Bool)

(assert (=> b!772327 m!716729))

(assert (=> b!772321 m!716727))

(assert (=> b!771988 d!101687))

(declare-fun d!101691 () Bool)

(assert (=> d!101691 (= (validKeyInArray!0 (select (arr!20303 a!3186) j!159)) (and (not (= (select (arr!20303 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20303 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!772000 d!101691))

(declare-fun b!772328 () Bool)

(declare-fun c!85358 () Bool)

(declare-fun lt!343743 () (_ BitVec 64))

(assert (=> b!772328 (= c!85358 (= lt!343743 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429932 () SeekEntryResult!7900)

(declare-fun e!429931 () SeekEntryResult!7900)

(assert (=> b!772328 (= e!429932 e!429931)))

(declare-fun b!772329 () Bool)

(declare-fun lt!343741 () SeekEntryResult!7900)

(assert (=> b!772329 (= e!429932 (Found!7900 (index!33970 lt!343741)))))

(declare-fun b!772330 () Bool)

(declare-fun e!429933 () SeekEntryResult!7900)

(assert (=> b!772330 (= e!429933 e!429932)))

(assert (=> b!772330 (= lt!343743 (select (arr!20303 a!3186) (index!33970 lt!343741)))))

(declare-fun c!85357 () Bool)

(assert (=> b!772330 (= c!85357 (= lt!343743 k0!2102))))

(declare-fun b!772331 () Bool)

(assert (=> b!772331 (= e!429931 (seekKeyOrZeroReturnVacant!0 (x!64910 lt!343741) (index!33970 lt!343741) (index!33970 lt!343741) k0!2102 a!3186 mask!3328))))

(declare-fun d!101693 () Bool)

(declare-fun lt!343742 () SeekEntryResult!7900)

(assert (=> d!101693 (and (or ((_ is Undefined!7900) lt!343742) (not ((_ is Found!7900) lt!343742)) (and (bvsge (index!33969 lt!343742) #b00000000000000000000000000000000) (bvslt (index!33969 lt!343742) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343742) ((_ is Found!7900) lt!343742) (not ((_ is MissingZero!7900) lt!343742)) (and (bvsge (index!33968 lt!343742) #b00000000000000000000000000000000) (bvslt (index!33968 lt!343742) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343742) ((_ is Found!7900) lt!343742) ((_ is MissingZero!7900) lt!343742) (not ((_ is MissingVacant!7900) lt!343742)) (and (bvsge (index!33971 lt!343742) #b00000000000000000000000000000000) (bvslt (index!33971 lt!343742) (size!20724 a!3186)))) (or ((_ is Undefined!7900) lt!343742) (ite ((_ is Found!7900) lt!343742) (= (select (arr!20303 a!3186) (index!33969 lt!343742)) k0!2102) (ite ((_ is MissingZero!7900) lt!343742) (= (select (arr!20303 a!3186) (index!33968 lt!343742)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7900) lt!343742) (= (select (arr!20303 a!3186) (index!33971 lt!343742)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101693 (= lt!343742 e!429933)))

(declare-fun c!85356 () Bool)

(assert (=> d!101693 (= c!85356 (and ((_ is Intermediate!7900) lt!343741) (undefined!8712 lt!343741)))))

(assert (=> d!101693 (= lt!343741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101693 (validMask!0 mask!3328)))

(assert (=> d!101693 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!343742)))

(declare-fun b!772332 () Bool)

(assert (=> b!772332 (= e!429933 Undefined!7900)))

(declare-fun b!772333 () Bool)

(assert (=> b!772333 (= e!429931 (MissingZero!7900 (index!33970 lt!343741)))))

(assert (= (and d!101693 c!85356) b!772332))

(assert (= (and d!101693 (not c!85356)) b!772330))

(assert (= (and b!772330 c!85357) b!772329))

(assert (= (and b!772330 (not c!85357)) b!772328))

(assert (= (and b!772328 c!85358) b!772333))

(assert (= (and b!772328 (not c!85358)) b!772331))

(declare-fun m!716731 () Bool)

(assert (=> b!772330 m!716731))

(declare-fun m!716733 () Bool)

(assert (=> b!772331 m!716733))

(declare-fun m!716735 () Bool)

(assert (=> d!101693 m!716735))

(declare-fun m!716737 () Bool)

(assert (=> d!101693 m!716737))

(declare-fun m!716739 () Bool)

(assert (=> d!101693 m!716739))

(assert (=> d!101693 m!716735))

(declare-fun m!716741 () Bool)

(assert (=> d!101693 m!716741))

(assert (=> d!101693 m!716477))

(declare-fun m!716743 () Bool)

(assert (=> d!101693 m!716743))

(assert (=> b!771989 d!101693))

(declare-fun d!101695 () Bool)

(assert (=> d!101695 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66896 d!101695))

(declare-fun d!101701 () Bool)

(assert (=> d!101701 (= (array_inv!16186 a!3186) (bvsge (size!20724 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66896 d!101701))

(check-sat (not d!101635) (not b!772312) (not d!101651) (not b!772183) (not d!101687) (not b!772331) (not b!772285) (not b!772270) (not b!772318) (not b!772227) (not b!772163) (not d!101643) (not d!101681) (not b!772200) (not b!772154) (not bm!35104) (not b!772172) (not d!101693) (not b!772302) (not b!772265) (not d!101637) (not b!772225) (not bm!35107) (not b!772181) (not d!101647) (not b!772327) (not d!101677) (not d!101665) (not b!772228) (not bm!35112) (not b!772272) (not d!101683) (not d!101633))
(check-sat)
