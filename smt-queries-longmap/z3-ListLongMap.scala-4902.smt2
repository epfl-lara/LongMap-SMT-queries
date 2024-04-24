; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67774 () Bool)

(assert start!67774)

(declare-fun b!784006 () Bool)

(declare-fun e!435992 () Bool)

(assert (=> b!784006 (= e!435992 true)))

(declare-fun e!435991 () Bool)

(assert (=> b!784006 e!435991))

(declare-fun res!530230 () Bool)

(assert (=> b!784006 (=> (not res!530230) (not e!435991))))

(declare-fun lt!349396 () (_ BitVec 64))

(assert (=> b!784006 (= res!530230 (= lt!349396 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27013 0))(
  ( (Unit!27014) )
))
(declare-fun lt!349393 () Unit!27013)

(declare-fun e!435986 () Unit!27013)

(assert (=> b!784006 (= lt!349393 e!435986)))

(declare-fun c!87304 () Bool)

(assert (=> b!784006 (= c!87304 (= lt!349396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784007 () Bool)

(declare-fun res!530224 () Bool)

(declare-fun e!435994 () Bool)

(assert (=> b!784007 (=> (not res!530224) (not e!435994))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42694 0))(
  ( (array!42695 (arr!20431 (Array (_ BitVec 32) (_ BitVec 64))) (size!20851 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42694)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784007 (= res!530224 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20431 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784008 () Bool)

(declare-fun res!530227 () Bool)

(declare-fun e!435993 () Bool)

(assert (=> b!784008 (=> res!530227 e!435993)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7987 0))(
  ( (MissingZero!7987 (index!34316 (_ BitVec 32))) (Found!7987 (index!34317 (_ BitVec 32))) (Intermediate!7987 (undefined!8799 Bool) (index!34318 (_ BitVec 32)) (x!65434 (_ BitVec 32))) (Undefined!7987) (MissingVacant!7987 (index!34319 (_ BitVec 32))) )
))
(declare-fun lt!349399 () SeekEntryResult!7987)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42694 (_ BitVec 32)) SeekEntryResult!7987)

(assert (=> b!784008 (= res!530227 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!349399)))))

(declare-fun b!784009 () Bool)

(declare-fun Unit!27015 () Unit!27013)

(assert (=> b!784009 (= e!435986 Unit!27015)))

(declare-fun lt!349398 () (_ BitVec 64))

(declare-fun lt!349397 () array!42694)

(declare-fun b!784010 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42694 (_ BitVec 32)) SeekEntryResult!7987)

(assert (=> b!784010 (= e!435991 (= (seekEntryOrOpen!0 lt!349398 lt!349397 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349398 lt!349397 mask!3328)))))

(declare-fun b!784011 () Bool)

(declare-fun res!530223 () Bool)

(declare-fun e!435990 () Bool)

(assert (=> b!784011 (=> (not res!530223) (not e!435990))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784011 (= res!530223 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20851 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20851 a!3186))))))

(declare-fun b!784012 () Bool)

(declare-fun res!530231 () Bool)

(declare-fun e!435989 () Bool)

(assert (=> b!784012 (=> (not res!530231) (not e!435989))))

(assert (=> b!784012 (= res!530231 (and (= (size!20851 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20851 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20851 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!435985 () Bool)

(declare-fun b!784013 () Bool)

(declare-fun lt!349402 () SeekEntryResult!7987)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42694 (_ BitVec 32)) SeekEntryResult!7987)

(assert (=> b!784013 (= e!435985 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!349402))))

(declare-fun b!784014 () Bool)

(declare-fun res!530221 () Bool)

(assert (=> b!784014 (=> (not res!530221) (not e!435989))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784014 (= res!530221 (validKeyInArray!0 k0!2102))))

(declare-fun b!784015 () Bool)

(declare-fun Unit!27016 () Unit!27013)

(assert (=> b!784015 (= e!435986 Unit!27016)))

(assert (=> b!784015 false))

(declare-fun b!784016 () Bool)

(declare-fun res!530218 () Bool)

(assert (=> b!784016 (=> (not res!530218) (not e!435990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42694 (_ BitVec 32)) Bool)

(assert (=> b!784016 (= res!530218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!435984 () Bool)

(declare-fun b!784005 () Bool)

(assert (=> b!784005 (= e!435984 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!349399))))

(declare-fun res!530220 () Bool)

(assert (=> start!67774 (=> (not res!530220) (not e!435989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67774 (= res!530220 (validMask!0 mask!3328))))

(assert (=> start!67774 e!435989))

(assert (=> start!67774 true))

(declare-fun array_inv!16290 (array!42694) Bool)

(assert (=> start!67774 (array_inv!16290 a!3186)))

(declare-fun b!784017 () Bool)

(assert (=> b!784017 (= e!435990 e!435994)))

(declare-fun res!530233 () Bool)

(assert (=> b!784017 (=> (not res!530233) (not e!435994))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784017 (= res!530233 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20431 a!3186) j!159) mask!3328) (select (arr!20431 a!3186) j!159) a!3186 mask!3328) lt!349402))))

(assert (=> b!784017 (= lt!349402 (Intermediate!7987 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784018 () Bool)

(declare-fun res!530228 () Bool)

(assert (=> b!784018 (=> (not res!530228) (not e!435990))))

(declare-datatypes ((List!14340 0))(
  ( (Nil!14337) (Cons!14336 (h!15465 (_ BitVec 64)) (t!20647 List!14340)) )
))
(declare-fun arrayNoDuplicates!0 (array!42694 (_ BitVec 32) List!14340) Bool)

(assert (=> b!784018 (= res!530228 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14337))))

(declare-fun b!784019 () Bool)

(declare-fun res!530225 () Bool)

(assert (=> b!784019 (=> (not res!530225) (not e!435989))))

(assert (=> b!784019 (= res!530225 (validKeyInArray!0 (select (arr!20431 a!3186) j!159)))))

(declare-fun b!784020 () Bool)

(assert (=> b!784020 (= e!435993 e!435992)))

(declare-fun res!530226 () Bool)

(assert (=> b!784020 (=> res!530226 e!435992)))

(assert (=> b!784020 (= res!530226 (= lt!349396 lt!349398))))

(assert (=> b!784020 (= lt!349396 (select (store (arr!20431 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784021 () Bool)

(declare-fun e!435987 () Bool)

(assert (=> b!784021 (= e!435987 (not e!435993))))

(declare-fun res!530222 () Bool)

(assert (=> b!784021 (=> res!530222 e!435993)))

(declare-fun lt!349392 () SeekEntryResult!7987)

(get-info :version)

(assert (=> b!784021 (= res!530222 (or (not ((_ is Intermediate!7987) lt!349392)) (bvslt x!1131 (x!65434 lt!349392)) (not (= x!1131 (x!65434 lt!349392))) (not (= index!1321 (index!34318 lt!349392)))))))

(assert (=> b!784021 e!435984))

(declare-fun res!530235 () Bool)

(assert (=> b!784021 (=> (not res!530235) (not e!435984))))

(declare-fun lt!349400 () SeekEntryResult!7987)

(assert (=> b!784021 (= res!530235 (= lt!349400 lt!349399))))

(assert (=> b!784021 (= lt!349399 (Found!7987 j!159))))

(assert (=> b!784021 (= lt!349400 (seekEntryOrOpen!0 (select (arr!20431 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784021 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349401 () Unit!27013)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27013)

(assert (=> b!784021 (= lt!349401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784022 () Bool)

(assert (=> b!784022 (= e!435994 e!435987)))

(declare-fun res!530232 () Bool)

(assert (=> b!784022 (=> (not res!530232) (not e!435987))))

(declare-fun lt!349395 () SeekEntryResult!7987)

(assert (=> b!784022 (= res!530232 (= lt!349395 lt!349392))))

(assert (=> b!784022 (= lt!349392 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349398 lt!349397 mask!3328))))

(assert (=> b!784022 (= lt!349395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349398 mask!3328) lt!349398 lt!349397 mask!3328))))

(assert (=> b!784022 (= lt!349398 (select (store (arr!20431 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784022 (= lt!349397 (array!42695 (store (arr!20431 a!3186) i!1173 k0!2102) (size!20851 a!3186)))))

(declare-fun b!784023 () Bool)

(declare-fun res!530219 () Bool)

(assert (=> b!784023 (=> (not res!530219) (not e!435989))))

(declare-fun arrayContainsKey!0 (array!42694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784023 (= res!530219 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784024 () Bool)

(assert (=> b!784024 (= e!435985 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20431 a!3186) j!159) a!3186 mask!3328) (Found!7987 j!159)))))

(declare-fun b!784025 () Bool)

(declare-fun res!530229 () Bool)

(assert (=> b!784025 (=> (not res!530229) (not e!435994))))

(assert (=> b!784025 (= res!530229 e!435985)))

(declare-fun c!87305 () Bool)

(assert (=> b!784025 (= c!87305 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784026 () Bool)

(assert (=> b!784026 (= e!435989 e!435990)))

(declare-fun res!530234 () Bool)

(assert (=> b!784026 (=> (not res!530234) (not e!435990))))

(declare-fun lt!349394 () SeekEntryResult!7987)

(assert (=> b!784026 (= res!530234 (or (= lt!349394 (MissingZero!7987 i!1173)) (= lt!349394 (MissingVacant!7987 i!1173))))))

(assert (=> b!784026 (= lt!349394 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!67774 res!530220) b!784012))

(assert (= (and b!784012 res!530231) b!784019))

(assert (= (and b!784019 res!530225) b!784014))

(assert (= (and b!784014 res!530221) b!784023))

(assert (= (and b!784023 res!530219) b!784026))

(assert (= (and b!784026 res!530234) b!784016))

(assert (= (and b!784016 res!530218) b!784018))

(assert (= (and b!784018 res!530228) b!784011))

(assert (= (and b!784011 res!530223) b!784017))

(assert (= (and b!784017 res!530233) b!784007))

(assert (= (and b!784007 res!530224) b!784025))

(assert (= (and b!784025 c!87305) b!784013))

(assert (= (and b!784025 (not c!87305)) b!784024))

(assert (= (and b!784025 res!530229) b!784022))

(assert (= (and b!784022 res!530232) b!784021))

(assert (= (and b!784021 res!530235) b!784005))

(assert (= (and b!784021 (not res!530222)) b!784008))

(assert (= (and b!784008 (not res!530227)) b!784020))

(assert (= (and b!784020 (not res!530226)) b!784006))

(assert (= (and b!784006 c!87304) b!784015))

(assert (= (and b!784006 (not c!87304)) b!784009))

(assert (= (and b!784006 res!530230) b!784010))

(declare-fun m!726995 () Bool)

(assert (=> b!784013 m!726995))

(assert (=> b!784013 m!726995))

(declare-fun m!726997 () Bool)

(assert (=> b!784013 m!726997))

(assert (=> b!784021 m!726995))

(assert (=> b!784021 m!726995))

(declare-fun m!726999 () Bool)

(assert (=> b!784021 m!726999))

(declare-fun m!727001 () Bool)

(assert (=> b!784021 m!727001))

(declare-fun m!727003 () Bool)

(assert (=> b!784021 m!727003))

(assert (=> b!784017 m!726995))

(assert (=> b!784017 m!726995))

(declare-fun m!727005 () Bool)

(assert (=> b!784017 m!727005))

(assert (=> b!784017 m!727005))

(assert (=> b!784017 m!726995))

(declare-fun m!727007 () Bool)

(assert (=> b!784017 m!727007))

(declare-fun m!727009 () Bool)

(assert (=> b!784023 m!727009))

(declare-fun m!727011 () Bool)

(assert (=> b!784026 m!727011))

(declare-fun m!727013 () Bool)

(assert (=> start!67774 m!727013))

(declare-fun m!727015 () Bool)

(assert (=> start!67774 m!727015))

(declare-fun m!727017 () Bool)

(assert (=> b!784022 m!727017))

(declare-fun m!727019 () Bool)

(assert (=> b!784022 m!727019))

(declare-fun m!727021 () Bool)

(assert (=> b!784022 m!727021))

(declare-fun m!727023 () Bool)

(assert (=> b!784022 m!727023))

(declare-fun m!727025 () Bool)

(assert (=> b!784022 m!727025))

(assert (=> b!784022 m!727017))

(declare-fun m!727027 () Bool)

(assert (=> b!784010 m!727027))

(declare-fun m!727029 () Bool)

(assert (=> b!784010 m!727029))

(assert (=> b!784008 m!726995))

(assert (=> b!784008 m!726995))

(declare-fun m!727031 () Bool)

(assert (=> b!784008 m!727031))

(assert (=> b!784019 m!726995))

(assert (=> b!784019 m!726995))

(declare-fun m!727033 () Bool)

(assert (=> b!784019 m!727033))

(assert (=> b!784020 m!727021))

(declare-fun m!727035 () Bool)

(assert (=> b!784020 m!727035))

(declare-fun m!727037 () Bool)

(assert (=> b!784016 m!727037))

(declare-fun m!727039 () Bool)

(assert (=> b!784007 m!727039))

(assert (=> b!784005 m!726995))

(assert (=> b!784005 m!726995))

(declare-fun m!727041 () Bool)

(assert (=> b!784005 m!727041))

(assert (=> b!784024 m!726995))

(assert (=> b!784024 m!726995))

(assert (=> b!784024 m!727031))

(declare-fun m!727043 () Bool)

(assert (=> b!784018 m!727043))

(declare-fun m!727045 () Bool)

(assert (=> b!784014 m!727045))

(check-sat (not b!784013) (not b!784023) (not b!784019) (not b!784021) (not b!784018) (not b!784005) (not b!784010) (not b!784022) (not b!784014) (not b!784026) (not b!784016) (not b!784024) (not b!784017) (not start!67774) (not b!784008))
(check-sat)
