; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123450 () Bool)

(assert start!123450)

(declare-fun b!1431128 () Bool)

(declare-fun e!807988 () Bool)

(declare-fun e!807989 () Bool)

(assert (=> b!1431128 (= e!807988 e!807989)))

(declare-fun res!965198 () Bool)

(assert (=> b!1431128 (=> (not res!965198) (not e!807989))))

(declare-datatypes ((SeekEntryResult!11324 0))(
  ( (MissingZero!11324 (index!47688 (_ BitVec 32))) (Found!11324 (index!47689 (_ BitVec 32))) (Intermediate!11324 (undefined!12136 Bool) (index!47690 (_ BitVec 32)) (x!129336 (_ BitVec 32))) (Undefined!11324) (MissingVacant!11324 (index!47691 (_ BitVec 32))) )
))
(declare-fun lt!630041 () SeekEntryResult!11324)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97473 0))(
  ( (array!97474 (arr!47045 (Array (_ BitVec 32) (_ BitVec 64))) (size!47595 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97473)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97473 (_ BitVec 32)) SeekEntryResult!11324)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431128 (= res!965198 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47045 a!2831) j!81) mask!2608) (select (arr!47045 a!2831) j!81) a!2831 mask!2608) lt!630041))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1431128 (= lt!630041 (Intermediate!11324 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431129 () Bool)

(declare-fun res!965205 () Bool)

(declare-fun e!807990 () Bool)

(assert (=> b!1431129 (=> (not res!965205) (not e!807990))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1431129 (= res!965205 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47045 a!2831) j!81) a!2831 mask!2608) lt!630041))))

(declare-fun b!1431130 () Bool)

(declare-fun res!965203 () Bool)

(assert (=> b!1431130 (=> (not res!965203) (not e!807990))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431130 (= res!965203 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431131 () Bool)

(declare-fun res!965195 () Bool)

(assert (=> b!1431131 (=> (not res!965195) (not e!807988))))

(declare-datatypes ((List!33555 0))(
  ( (Nil!33552) (Cons!33551 (h!34871 (_ BitVec 64)) (t!48249 List!33555)) )
))
(declare-fun arrayNoDuplicates!0 (array!97473 (_ BitVec 32) List!33555) Bool)

(assert (=> b!1431131 (= res!965195 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33552))))

(declare-fun b!1431132 () Bool)

(declare-fun res!965202 () Bool)

(assert (=> b!1431132 (=> (not res!965202) (not e!807988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97473 (_ BitVec 32)) Bool)

(assert (=> b!1431132 (= res!965202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!965200 () Bool)

(assert (=> start!123450 (=> (not res!965200) (not e!807988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123450 (= res!965200 (validMask!0 mask!2608))))

(assert (=> start!123450 e!807988))

(assert (=> start!123450 true))

(declare-fun array_inv!36073 (array!97473) Bool)

(assert (=> start!123450 (array_inv!36073 a!2831)))

(declare-fun b!1431133 () Bool)

(declare-fun res!965204 () Bool)

(declare-fun e!807992 () Bool)

(assert (=> b!1431133 (=> (not res!965204) (not e!807992))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97473 (_ BitVec 32)) SeekEntryResult!11324)

(assert (=> b!1431133 (= res!965204 (= (seekEntryOrOpen!0 (select (arr!47045 a!2831) j!81) a!2831 mask!2608) (Found!11324 j!81)))))

(declare-fun b!1431134 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431134 (= e!807992 (or (= (select (arr!47045 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47045 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47045 a!2831) index!585) (select (arr!47045 a!2831) j!81)) (not (= (select (store (arr!47045 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (= index!585 intermediateAfterIndex!13) (= intermediateAfterIndex!13 i!982))))))

(declare-fun b!1431135 () Bool)

(declare-fun res!965193 () Bool)

(assert (=> b!1431135 (=> (not res!965193) (not e!807990))))

(declare-fun lt!630039 () SeekEntryResult!11324)

(declare-fun lt!630042 () array!97473)

(declare-fun lt!630038 () (_ BitVec 64))

(assert (=> b!1431135 (= res!965193 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630038 lt!630042 mask!2608) lt!630039))))

(declare-fun b!1431136 () Bool)

(assert (=> b!1431136 (= e!807990 (not (or (= (select (arr!47045 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47045 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47045 a!2831) index!585) (select (arr!47045 a!2831) j!81)) (not (= (select (store (arr!47045 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge intermediateAfterX!13 intermediateBeforeX!13) (not undefinedAfter!5))))))

(assert (=> b!1431136 e!807992))

(declare-fun res!965199 () Bool)

(assert (=> b!1431136 (=> (not res!965199) (not e!807992))))

(assert (=> b!1431136 (= res!965199 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48394 0))(
  ( (Unit!48395) )
))
(declare-fun lt!630040 () Unit!48394)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48394)

(assert (=> b!1431136 (= lt!630040 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431137 () Bool)

(declare-fun res!965194 () Bool)

(assert (=> b!1431137 (=> (not res!965194) (not e!807988))))

(assert (=> b!1431137 (= res!965194 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47595 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47595 a!2831))))))

(declare-fun b!1431138 () Bool)

(declare-fun res!965201 () Bool)

(assert (=> b!1431138 (=> (not res!965201) (not e!807988))))

(assert (=> b!1431138 (= res!965201 (and (= (size!47595 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47595 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47595 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431139 () Bool)

(declare-fun res!965206 () Bool)

(assert (=> b!1431139 (=> (not res!965206) (not e!807988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431139 (= res!965206 (validKeyInArray!0 (select (arr!47045 a!2831) i!982)))))

(declare-fun b!1431140 () Bool)

(assert (=> b!1431140 (= e!807989 e!807990)))

(declare-fun res!965197 () Bool)

(assert (=> b!1431140 (=> (not res!965197) (not e!807990))))

(assert (=> b!1431140 (= res!965197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630038 mask!2608) lt!630038 lt!630042 mask!2608) lt!630039))))

(assert (=> b!1431140 (= lt!630039 (Intermediate!11324 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431140 (= lt!630038 (select (store (arr!47045 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431140 (= lt!630042 (array!97474 (store (arr!47045 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47595 a!2831)))))

(declare-fun b!1431141 () Bool)

(declare-fun res!965196 () Bool)

(assert (=> b!1431141 (=> (not res!965196) (not e!807988))))

(assert (=> b!1431141 (= res!965196 (validKeyInArray!0 (select (arr!47045 a!2831) j!81)))))

(assert (= (and start!123450 res!965200) b!1431138))

(assert (= (and b!1431138 res!965201) b!1431139))

(assert (= (and b!1431139 res!965206) b!1431141))

(assert (= (and b!1431141 res!965196) b!1431132))

(assert (= (and b!1431132 res!965202) b!1431131))

(assert (= (and b!1431131 res!965195) b!1431137))

(assert (= (and b!1431137 res!965194) b!1431128))

(assert (= (and b!1431128 res!965198) b!1431140))

(assert (= (and b!1431140 res!965197) b!1431129))

(assert (= (and b!1431129 res!965205) b!1431135))

(assert (= (and b!1431135 res!965193) b!1431130))

(assert (= (and b!1431130 res!965203) b!1431136))

(assert (= (and b!1431136 res!965199) b!1431133))

(assert (= (and b!1431133 res!965204) b!1431134))

(declare-fun m!1321017 () Bool)

(assert (=> b!1431132 m!1321017))

(declare-fun m!1321019 () Bool)

(assert (=> start!123450 m!1321019))

(declare-fun m!1321021 () Bool)

(assert (=> start!123450 m!1321021))

(declare-fun m!1321023 () Bool)

(assert (=> b!1431141 m!1321023))

(assert (=> b!1431141 m!1321023))

(declare-fun m!1321025 () Bool)

(assert (=> b!1431141 m!1321025))

(declare-fun m!1321027 () Bool)

(assert (=> b!1431136 m!1321027))

(declare-fun m!1321029 () Bool)

(assert (=> b!1431136 m!1321029))

(declare-fun m!1321031 () Bool)

(assert (=> b!1431136 m!1321031))

(declare-fun m!1321033 () Bool)

(assert (=> b!1431136 m!1321033))

(assert (=> b!1431136 m!1321023))

(declare-fun m!1321035 () Bool)

(assert (=> b!1431136 m!1321035))

(assert (=> b!1431133 m!1321023))

(assert (=> b!1431133 m!1321023))

(declare-fun m!1321037 () Bool)

(assert (=> b!1431133 m!1321037))

(declare-fun m!1321039 () Bool)

(assert (=> b!1431140 m!1321039))

(assert (=> b!1431140 m!1321039))

(declare-fun m!1321041 () Bool)

(assert (=> b!1431140 m!1321041))

(assert (=> b!1431140 m!1321027))

(declare-fun m!1321043 () Bool)

(assert (=> b!1431140 m!1321043))

(assert (=> b!1431129 m!1321023))

(assert (=> b!1431129 m!1321023))

(declare-fun m!1321045 () Bool)

(assert (=> b!1431129 m!1321045))

(assert (=> b!1431128 m!1321023))

(assert (=> b!1431128 m!1321023))

(declare-fun m!1321047 () Bool)

(assert (=> b!1431128 m!1321047))

(assert (=> b!1431128 m!1321047))

(assert (=> b!1431128 m!1321023))

(declare-fun m!1321049 () Bool)

(assert (=> b!1431128 m!1321049))

(assert (=> b!1431134 m!1321031))

(assert (=> b!1431134 m!1321023))

(assert (=> b!1431134 m!1321027))

(assert (=> b!1431134 m!1321029))

(declare-fun m!1321051 () Bool)

(assert (=> b!1431139 m!1321051))

(assert (=> b!1431139 m!1321051))

(declare-fun m!1321053 () Bool)

(assert (=> b!1431139 m!1321053))

(declare-fun m!1321055 () Bool)

(assert (=> b!1431131 m!1321055))

(declare-fun m!1321057 () Bool)

(assert (=> b!1431135 m!1321057))

(push 1)

(assert (not b!1431135))

(assert (not b!1431129))

(assert (not b!1431139))

(assert (not start!123450))

(assert (not b!1431133))

(assert (not b!1431140))

(assert (not b!1431128))

(assert (not b!1431132))

(assert (not b!1431141))

(assert (not b!1431131))

(assert (not b!1431136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!153877 () Bool)

(assert (=> d!153877 (= (validKeyInArray!0 (select (arr!47045 a!2831) i!982)) (and (not (= (select (arr!47045 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47045 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1431139 d!153877))

(declare-fun e!808076 () SeekEntryResult!11324)

(declare-fun b!1431313 () Bool)

(assert (=> b!1431313 (= e!808076 (Intermediate!11324 false (toIndex!0 (select (arr!47045 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431314 () Bool)

(declare-fun e!808077 () Bool)

(declare-fun e!808079 () Bool)

(assert (=> b!1431314 (= e!808077 e!808079)))

(declare-fun res!965326 () Bool)

(declare-fun lt!630098 () SeekEntryResult!11324)

(assert (=> b!1431314 (= res!965326 (and (is-Intermediate!11324 lt!630098) (not (undefined!12136 lt!630098)) (bvslt (x!129336 lt!630098) #b01111111111111111111111111111110) (bvsge (x!129336 lt!630098) #b00000000000000000000000000000000) (bvsge (x!129336 lt!630098) #b00000000000000000000000000000000)))))

(assert (=> b!1431314 (=> (not res!965326) (not e!808079))))

(declare-fun d!153879 () Bool)

(assert (=> d!153879 e!808077))

(declare-fun c!132491 () Bool)

(assert (=> d!153879 (= c!132491 (and (is-Intermediate!11324 lt!630098) (undefined!12136 lt!630098)))))

(declare-fun e!808078 () SeekEntryResult!11324)

(assert (=> d!153879 (= lt!630098 e!808078)))

(declare-fun c!132492 () Bool)

(assert (=> d!153879 (= c!132492 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!630097 () (_ BitVec 64))

(assert (=> d!153879 (= lt!630097 (select (arr!47045 a!2831) (toIndex!0 (select (arr!47045 a!2831) j!81) mask!2608)))))

(assert (=> d!153879 (validMask!0 mask!2608)))

(assert (=> d!153879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47045 a!2831) j!81) mask!2608) (select (arr!47045 a!2831) j!81) a!2831 mask!2608) lt!630098)))

(declare-fun b!1431315 () Bool)

(assert (=> b!1431315 (= e!808078 (Intermediate!11324 true (toIndex!0 (select (arr!47045 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431316 () Bool)

(assert (=> b!1431316 (and (bvsge (index!47690 lt!630098) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630098) (size!47595 a!2831)))))

(declare-fun res!965325 () Bool)

(assert (=> b!1431316 (= res!965325 (= (select (arr!47045 a!2831) (index!47690 lt!630098)) (select (arr!47045 a!2831) j!81)))))

(declare-fun e!808075 () Bool)

(assert (=> b!1431316 (=> res!965325 e!808075)))

(assert (=> b!1431316 (= e!808079 e!808075)))

(declare-fun b!1431317 () Bool)

(assert (=> b!1431317 (and (bvsge (index!47690 lt!630098) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630098) (size!47595 a!2831)))))

(declare-fun res!965327 () Bool)

(assert (=> b!1431317 (= res!965327 (= (select (arr!47045 a!2831) (index!47690 lt!630098)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431317 (=> res!965327 e!808075)))

(declare-fun b!1431318 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431318 (= e!808076 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47045 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47045 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431319 () Bool)

(assert (=> b!1431319 (= e!808077 (bvsge (x!129336 lt!630098) #b01111111111111111111111111111110))))

(declare-fun b!1431320 () Bool)

(assert (=> b!1431320 (= e!808078 e!808076)))

(declare-fun c!132490 () Bool)

(assert (=> b!1431320 (= c!132490 (or (= lt!630097 (select (arr!47045 a!2831) j!81)) (= (bvadd lt!630097 lt!630097) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431321 () Bool)

(assert (=> b!1431321 (and (bvsge (index!47690 lt!630098) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630098) (size!47595 a!2831)))))

(assert (=> b!1431321 (= e!808075 (= (select (arr!47045 a!2831) (index!47690 lt!630098)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153879 c!132492) b!1431315))

(assert (= (and d!153879 (not c!132492)) b!1431320))

(assert (= (and b!1431320 c!132490) b!1431313))

(assert (= (and b!1431320 (not c!132490)) b!1431318))

(assert (= (and d!153879 c!132491) b!1431319))

(assert (= (and d!153879 (not c!132491)) b!1431314))

(assert (= (and b!1431314 res!965326) b!1431316))

(assert (= (and b!1431316 (not res!965325)) b!1431317))

(assert (= (and b!1431317 (not res!965327)) b!1431321))

(declare-fun m!1321179 () Bool)

(assert (=> b!1431317 m!1321179))

(assert (=> b!1431316 m!1321179))

(assert (=> d!153879 m!1321047))

(declare-fun m!1321181 () Bool)

(assert (=> d!153879 m!1321181))

(assert (=> d!153879 m!1321019))

(assert (=> b!1431321 m!1321179))

(assert (=> b!1431318 m!1321047))

(declare-fun m!1321183 () Bool)

(assert (=> b!1431318 m!1321183))

(assert (=> b!1431318 m!1321183))

(assert (=> b!1431318 m!1321023))

(declare-fun m!1321185 () Bool)

(assert (=> b!1431318 m!1321185))

(assert (=> b!1431128 d!153879))

(declare-fun d!153895 () Bool)

(declare-fun lt!630108 () (_ BitVec 32))

(declare-fun lt!630107 () (_ BitVec 32))

(assert (=> d!153895 (= lt!630108 (bvmul (bvxor lt!630107 (bvlshr lt!630107 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153895 (= lt!630107 ((_ extract 31 0) (bvand (bvxor (select (arr!47045 a!2831) j!81) (bvlshr (select (arr!47045 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153895 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965328 (let ((h!34875 ((_ extract 31 0) (bvand (bvxor (select (arr!47045 a!2831) j!81) (bvlshr (select (arr!47045 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129343 (bvmul (bvxor h!34875 (bvlshr h!34875 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129343 (bvlshr x!129343 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965328 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965328 #b00000000000000000000000000000000))))))

(assert (=> d!153895 (= (toIndex!0 (select (arr!47045 a!2831) j!81) mask!2608) (bvand (bvxor lt!630108 (bvlshr lt!630108 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1431128 d!153895))

(declare-fun b!1431375 () Bool)

(declare-fun e!808112 () Bool)

(declare-fun e!808110 () Bool)

(assert (=> b!1431375 (= e!808112 e!808110)))

(declare-fun c!132513 () Bool)

(assert (=> b!1431375 (= c!132513 (validKeyInArray!0 (select (arr!47045 a!2831) j!81)))))

(declare-fun b!1431376 () Bool)

(declare-fun call!67462 () Bool)

(assert (=> b!1431376 (= e!808110 call!67462)))

(declare-fun d!153897 () Bool)

(declare-fun res!965343 () Bool)

(assert (=> d!153897 (=> res!965343 e!808112)))

(assert (=> d!153897 (= res!965343 (bvsge j!81 (size!47595 a!2831)))))

(assert (=> d!153897 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!808112)))

(declare-fun b!1431377 () Bool)

(declare-fun e!808111 () Bool)

(assert (=> b!1431377 (= e!808111 call!67462)))

(declare-fun b!1431378 () Bool)

(assert (=> b!1431378 (= e!808110 e!808111)))

(declare-fun lt!630132 () (_ BitVec 64))

(assert (=> b!1431378 (= lt!630132 (select (arr!47045 a!2831) j!81))))

(declare-fun lt!630134 () Unit!48394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97473 (_ BitVec 64) (_ BitVec 32)) Unit!48394)

(assert (=> b!1431378 (= lt!630134 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630132 j!81))))

(declare-fun arrayContainsKey!0 (array!97473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1431378 (arrayContainsKey!0 a!2831 lt!630132 #b00000000000000000000000000000000)))

(declare-fun lt!630133 () Unit!48394)

(assert (=> b!1431378 (= lt!630133 lt!630134)))

(declare-fun res!965344 () Bool)

(assert (=> b!1431378 (= res!965344 (= (seekEntryOrOpen!0 (select (arr!47045 a!2831) j!81) a!2831 mask!2608) (Found!11324 j!81)))))

(assert (=> b!1431378 (=> (not res!965344) (not e!808111))))

(declare-fun bm!67459 () Bool)

(assert (=> bm!67459 (= call!67462 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153897 (not res!965343)) b!1431375))

(assert (= (and b!1431375 c!132513) b!1431378))

(assert (= (and b!1431375 (not c!132513)) b!1431376))

(assert (= (and b!1431378 res!965344) b!1431377))

(assert (= (or b!1431377 b!1431376) bm!67459))

(assert (=> b!1431375 m!1321023))

(assert (=> b!1431375 m!1321023))

(assert (=> b!1431375 m!1321025))

(assert (=> b!1431378 m!1321023))

(declare-fun m!1321205 () Bool)

(assert (=> b!1431378 m!1321205))

(declare-fun m!1321207 () Bool)

(assert (=> b!1431378 m!1321207))

(assert (=> b!1431378 m!1321023))

(assert (=> b!1431378 m!1321037))

(declare-fun m!1321209 () Bool)

(assert (=> bm!67459 m!1321209))

(assert (=> b!1431136 d!153897))

(declare-fun d!153907 () Bool)

(assert (=> d!153907 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!630149 () Unit!48394)

(declare-fun choose!38 (array!97473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48394)

(assert (=> d!153907 (= lt!630149 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153907 (validMask!0 mask!2608)))

(assert (=> d!153907 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!630149)))

(declare-fun bs!41693 () Bool)

(assert (= bs!41693 d!153907))

(assert (=> bs!41693 m!1321033))

(declare-fun m!1321211 () Bool)

(assert (=> bs!41693 m!1321211))

(assert (=> bs!41693 m!1321019))

(assert (=> b!1431136 d!153907))

(declare-fun b!1431395 () Bool)

(declare-fun e!808126 () SeekEntryResult!11324)

(assert (=> b!1431395 (= e!808126 (Intermediate!11324 false index!585 x!605))))

(declare-fun b!1431396 () Bool)

(declare-fun e!808127 () Bool)

(declare-fun e!808129 () Bool)

(assert (=> b!1431396 (= e!808127 e!808129)))

(declare-fun res!965354 () Bool)

(declare-fun lt!630151 () SeekEntryResult!11324)

(assert (=> b!1431396 (= res!965354 (and (is-Intermediate!11324 lt!630151) (not (undefined!12136 lt!630151)) (bvslt (x!129336 lt!630151) #b01111111111111111111111111111110) (bvsge (x!129336 lt!630151) #b00000000000000000000000000000000) (bvsge (x!129336 lt!630151) x!605)))))

(assert (=> b!1431396 (=> (not res!965354) (not e!808129))))

(declare-fun d!153909 () Bool)

(assert (=> d!153909 e!808127))

(declare-fun c!132519 () Bool)

(assert (=> d!153909 (= c!132519 (and (is-Intermediate!11324 lt!630151) (undefined!12136 lt!630151)))))

(declare-fun e!808128 () SeekEntryResult!11324)

(assert (=> d!153909 (= lt!630151 e!808128)))

(declare-fun c!132520 () Bool)

(assert (=> d!153909 (= c!132520 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!630150 () (_ BitVec 64))

(assert (=> d!153909 (= lt!630150 (select (arr!47045 lt!630042) index!585))))

(assert (=> d!153909 (validMask!0 mask!2608)))

(assert (=> d!153909 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630038 lt!630042 mask!2608) lt!630151)))

(declare-fun b!1431397 () Bool)

(assert (=> b!1431397 (= e!808128 (Intermediate!11324 true index!585 x!605))))

(declare-fun b!1431398 () Bool)

(assert (=> b!1431398 (and (bvsge (index!47690 lt!630151) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630151) (size!47595 lt!630042)))))

(declare-fun res!965353 () Bool)

(assert (=> b!1431398 (= res!965353 (= (select (arr!47045 lt!630042) (index!47690 lt!630151)) lt!630038))))

(declare-fun e!808125 () Bool)

(assert (=> b!1431398 (=> res!965353 e!808125)))

(assert (=> b!1431398 (= e!808129 e!808125)))

(declare-fun b!1431399 () Bool)

(assert (=> b!1431399 (and (bvsge (index!47690 lt!630151) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630151) (size!47595 lt!630042)))))

(declare-fun res!965355 () Bool)

(assert (=> b!1431399 (= res!965355 (= (select (arr!47045 lt!630042) (index!47690 lt!630151)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431399 (=> res!965355 e!808125)))

(declare-fun b!1431400 () Bool)

(assert (=> b!1431400 (= e!808126 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!630038 lt!630042 mask!2608))))

(declare-fun b!1431401 () Bool)

(assert (=> b!1431401 (= e!808127 (bvsge (x!129336 lt!630151) #b01111111111111111111111111111110))))

(declare-fun b!1431402 () Bool)

(assert (=> b!1431402 (= e!808128 e!808126)))

(declare-fun c!132518 () Bool)

(assert (=> b!1431402 (= c!132518 (or (= lt!630150 lt!630038) (= (bvadd lt!630150 lt!630150) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431403 () Bool)

(assert (=> b!1431403 (and (bvsge (index!47690 lt!630151) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630151) (size!47595 lt!630042)))))

(assert (=> b!1431403 (= e!808125 (= (select (arr!47045 lt!630042) (index!47690 lt!630151)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153909 c!132520) b!1431397))

(assert (= (and d!153909 (not c!132520)) b!1431402))

(assert (= (and b!1431402 c!132518) b!1431395))

(assert (= (and b!1431402 (not c!132518)) b!1431400))

(assert (= (and d!153909 c!132519) b!1431401))

(assert (= (and d!153909 (not c!132519)) b!1431396))

(assert (= (and b!1431396 res!965354) b!1431398))

(assert (= (and b!1431398 (not res!965353)) b!1431399))

(assert (= (and b!1431399 (not res!965355)) b!1431403))

(declare-fun m!1321213 () Bool)

(assert (=> b!1431399 m!1321213))

(assert (=> b!1431398 m!1321213))

(declare-fun m!1321215 () Bool)

(assert (=> d!153909 m!1321215))

(assert (=> d!153909 m!1321019))

(assert (=> b!1431403 m!1321213))

(declare-fun m!1321217 () Bool)

(assert (=> b!1431400 m!1321217))

(assert (=> b!1431400 m!1321217))

(declare-fun m!1321219 () Bool)

(assert (=> b!1431400 m!1321219))

(assert (=> b!1431135 d!153909))

(declare-fun d!153911 () Bool)

(assert (=> d!153911 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123450 d!153911))

(declare-fun d!153929 () Bool)

(assert (=> d!153929 (= (array_inv!36073 a!2831) (bvsge (size!47595 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123450 d!153929))

(declare-fun b!1431473 () Bool)

(declare-fun e!808175 () SeekEntryResult!11324)

(declare-fun lt!630185 () SeekEntryResult!11324)

(assert (=> b!1431473 (= e!808175 (MissingZero!11324 (index!47690 lt!630185)))))

(declare-fun b!1431474 () Bool)

(declare-fun c!132546 () Bool)

(declare-fun lt!630187 () (_ BitVec 64))

(assert (=> b!1431474 (= c!132546 (= lt!630187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808173 () SeekEntryResult!11324)

(assert (=> b!1431474 (= e!808173 e!808175)))

(declare-fun b!1431475 () Bool)

(declare-fun e!808174 () SeekEntryResult!11324)

(assert (=> b!1431475 (= e!808174 Undefined!11324)))

(declare-fun d!153931 () Bool)

(declare-fun lt!630186 () SeekEntryResult!11324)

(assert (=> d!153931 (and (or (is-Undefined!11324 lt!630186) (not (is-Found!11324 lt!630186)) (and (bvsge (index!47689 lt!630186) #b00000000000000000000000000000000) (bvslt (index!47689 lt!630186) (size!47595 a!2831)))) (or (is-Undefined!11324 lt!630186) (is-Found!11324 lt!630186) (not (is-MissingZero!11324 lt!630186)) (and (bvsge (index!47688 lt!630186) #b00000000000000000000000000000000) (bvslt (index!47688 lt!630186) (size!47595 a!2831)))) (or (is-Undefined!11324 lt!630186) (is-Found!11324 lt!630186) (is-MissingZero!11324 lt!630186) (not (is-MissingVacant!11324 lt!630186)) (and (bvsge (index!47691 lt!630186) #b00000000000000000000000000000000) (bvslt (index!47691 lt!630186) (size!47595 a!2831)))) (or (is-Undefined!11324 lt!630186) (ite (is-Found!11324 lt!630186) (= (select (arr!47045 a!2831) (index!47689 lt!630186)) (select (arr!47045 a!2831) j!81)) (ite (is-MissingZero!11324 lt!630186) (= (select (arr!47045 a!2831) (index!47688 lt!630186)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11324 lt!630186) (= (select (arr!47045 a!2831) (index!47691 lt!630186)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153931 (= lt!630186 e!808174)))

(declare-fun c!132547 () Bool)

(assert (=> d!153931 (= c!132547 (and (is-Intermediate!11324 lt!630185) (undefined!12136 lt!630185)))))

(assert (=> d!153931 (= lt!630185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47045 a!2831) j!81) mask!2608) (select (arr!47045 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153931 (validMask!0 mask!2608)))

(assert (=> d!153931 (= (seekEntryOrOpen!0 (select (arr!47045 a!2831) j!81) a!2831 mask!2608) lt!630186)))

(declare-fun b!1431476 () Bool)

(assert (=> b!1431476 (= e!808174 e!808173)))

(assert (=> b!1431476 (= lt!630187 (select (arr!47045 a!2831) (index!47690 lt!630185)))))

(declare-fun c!132545 () Bool)

(assert (=> b!1431476 (= c!132545 (= lt!630187 (select (arr!47045 a!2831) j!81)))))

(declare-fun b!1431477 () Bool)

(assert (=> b!1431477 (= e!808173 (Found!11324 (index!47690 lt!630185)))))

(declare-fun b!1431478 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97473 (_ BitVec 32)) SeekEntryResult!11324)

(assert (=> b!1431478 (= e!808175 (seekKeyOrZeroReturnVacant!0 (x!129336 lt!630185) (index!47690 lt!630185) (index!47690 lt!630185) (select (arr!47045 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!153931 c!132547) b!1431475))

(assert (= (and d!153931 (not c!132547)) b!1431476))

(assert (= (and b!1431476 c!132545) b!1431477))

(assert (= (and b!1431476 (not c!132545)) b!1431474))

(assert (= (and b!1431474 c!132546) b!1431473))

(assert (= (and b!1431474 (not c!132546)) b!1431478))

(assert (=> d!153931 m!1321047))

(assert (=> d!153931 m!1321023))

(assert (=> d!153931 m!1321049))

(declare-fun m!1321267 () Bool)

(assert (=> d!153931 m!1321267))

(assert (=> d!153931 m!1321023))

(assert (=> d!153931 m!1321047))

(declare-fun m!1321269 () Bool)

(assert (=> d!153931 m!1321269))

(declare-fun m!1321271 () Bool)

(assert (=> d!153931 m!1321271))

(assert (=> d!153931 m!1321019))

(declare-fun m!1321273 () Bool)

(assert (=> b!1431476 m!1321273))

(assert (=> b!1431478 m!1321023))

(declare-fun m!1321275 () Bool)

(assert (=> b!1431478 m!1321275))

(assert (=> b!1431133 d!153931))

(declare-fun b!1431479 () Bool)

(declare-fun e!808178 () Bool)

(declare-fun e!808176 () Bool)

(assert (=> b!1431479 (= e!808178 e!808176)))

(declare-fun c!132548 () Bool)

(assert (=> b!1431479 (= c!132548 (validKeyInArray!0 (select (arr!47045 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1431480 () Bool)

(declare-fun call!67473 () Bool)

(assert (=> b!1431480 (= e!808176 call!67473)))

(declare-fun d!153937 () Bool)

(declare-fun res!965377 () Bool)

(assert (=> d!153937 (=> res!965377 e!808178)))

(assert (=> d!153937 (= res!965377 (bvsge #b00000000000000000000000000000000 (size!47595 a!2831)))))

(assert (=> d!153937 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!808178)))

(declare-fun b!1431481 () Bool)

(declare-fun e!808177 () Bool)

(assert (=> b!1431481 (= e!808177 call!67473)))

(declare-fun b!1431482 () Bool)

(assert (=> b!1431482 (= e!808176 e!808177)))

(declare-fun lt!630188 () (_ BitVec 64))

(assert (=> b!1431482 (= lt!630188 (select (arr!47045 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!630190 () Unit!48394)

(assert (=> b!1431482 (= lt!630190 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630188 #b00000000000000000000000000000000))))

(assert (=> b!1431482 (arrayContainsKey!0 a!2831 lt!630188 #b00000000000000000000000000000000)))

(declare-fun lt!630189 () Unit!48394)

(assert (=> b!1431482 (= lt!630189 lt!630190)))

(declare-fun res!965378 () Bool)

(assert (=> b!1431482 (= res!965378 (= (seekEntryOrOpen!0 (select (arr!47045 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11324 #b00000000000000000000000000000000)))))

(assert (=> b!1431482 (=> (not res!965378) (not e!808177))))

(declare-fun bm!67470 () Bool)

(assert (=> bm!67470 (= call!67473 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153937 (not res!965377)) b!1431479))

(assert (= (and b!1431479 c!132548) b!1431482))

(assert (= (and b!1431479 (not c!132548)) b!1431480))

(assert (= (and b!1431482 res!965378) b!1431481))

(assert (= (or b!1431481 b!1431480) bm!67470))

(declare-fun m!1321277 () Bool)

(assert (=> b!1431479 m!1321277))

(assert (=> b!1431479 m!1321277))

(declare-fun m!1321279 () Bool)

(assert (=> b!1431479 m!1321279))

(assert (=> b!1431482 m!1321277))

(declare-fun m!1321281 () Bool)

(assert (=> b!1431482 m!1321281))

(declare-fun m!1321283 () Bool)

(assert (=> b!1431482 m!1321283))

(assert (=> b!1431482 m!1321277))

(declare-fun m!1321285 () Bool)

(assert (=> b!1431482 m!1321285))

(declare-fun m!1321287 () Bool)

(assert (=> bm!67470 m!1321287))

(assert (=> b!1431132 d!153937))

(declare-fun b!1431509 () Bool)

(declare-fun e!808198 () Bool)

(declare-fun call!67476 () Bool)

(assert (=> b!1431509 (= e!808198 call!67476)))

(declare-fun b!1431510 () Bool)

(declare-fun e!808195 () Bool)

(declare-fun e!808197 () Bool)

(assert (=> b!1431510 (= e!808195 e!808197)))

(declare-fun res!965390 () Bool)

(assert (=> b!1431510 (=> (not res!965390) (not e!808197))))

(declare-fun e!808196 () Bool)

(assert (=> b!1431510 (= res!965390 (not e!808196))))

(declare-fun res!965389 () Bool)

(assert (=> b!1431510 (=> (not res!965389) (not e!808196))))

(assert (=> b!1431510 (= res!965389 (validKeyInArray!0 (select (arr!47045 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1431511 () Bool)

(declare-fun contains!9865 (List!33555 (_ BitVec 64)) Bool)

(assert (=> b!1431511 (= e!808196 (contains!9865 Nil!33552 (select (arr!47045 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1431508 () Bool)

(assert (=> b!1431508 (= e!808197 e!808198)))

(declare-fun c!132557 () Bool)

(assert (=> b!1431508 (= c!132557 (validKeyInArray!0 (select (arr!47045 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153939 () Bool)

(declare-fun res!965388 () Bool)

(assert (=> d!153939 (=> res!965388 e!808195)))

(assert (=> d!153939 (= res!965388 (bvsge #b00000000000000000000000000000000 (size!47595 a!2831)))))

(assert (=> d!153939 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33552) e!808195)))

(declare-fun bm!67473 () Bool)

(assert (=> bm!67473 (= call!67476 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132557 (Cons!33551 (select (arr!47045 a!2831) #b00000000000000000000000000000000) Nil!33552) Nil!33552)))))

(declare-fun b!1431512 () Bool)

(assert (=> b!1431512 (= e!808198 call!67476)))

(assert (= (and d!153939 (not res!965388)) b!1431510))

(assert (= (and b!1431510 res!965389) b!1431511))

(assert (= (and b!1431510 res!965390) b!1431508))

(assert (= (and b!1431508 c!132557) b!1431509))

(assert (= (and b!1431508 (not c!132557)) b!1431512))

(assert (= (or b!1431509 b!1431512) bm!67473))

(assert (=> b!1431510 m!1321277))

(assert (=> b!1431510 m!1321277))

(assert (=> b!1431510 m!1321279))

(assert (=> b!1431511 m!1321277))

(assert (=> b!1431511 m!1321277))

(declare-fun m!1321305 () Bool)

(assert (=> b!1431511 m!1321305))

(assert (=> b!1431508 m!1321277))

(assert (=> b!1431508 m!1321277))

(assert (=> b!1431508 m!1321279))

(assert (=> bm!67473 m!1321277))

(declare-fun m!1321307 () Bool)

(assert (=> bm!67473 m!1321307))

(assert (=> b!1431131 d!153939))

(declare-fun d!153947 () Bool)

(assert (=> d!153947 (= (validKeyInArray!0 (select (arr!47045 a!2831) j!81)) (and (not (= (select (arr!47045 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47045 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1431141 d!153947))

(declare-fun b!1431513 () Bool)

(declare-fun e!808200 () SeekEntryResult!11324)

(assert (=> b!1431513 (= e!808200 (Intermediate!11324 false (toIndex!0 lt!630038 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431514 () Bool)

(declare-fun e!808201 () Bool)

(declare-fun e!808203 () Bool)

(assert (=> b!1431514 (= e!808201 e!808203)))

(declare-fun res!965392 () Bool)

(declare-fun lt!630197 () SeekEntryResult!11324)

(assert (=> b!1431514 (= res!965392 (and (is-Intermediate!11324 lt!630197) (not (undefined!12136 lt!630197)) (bvslt (x!129336 lt!630197) #b01111111111111111111111111111110) (bvsge (x!129336 lt!630197) #b00000000000000000000000000000000) (bvsge (x!129336 lt!630197) #b00000000000000000000000000000000)))))

(assert (=> b!1431514 (=> (not res!965392) (not e!808203))))

(declare-fun d!153949 () Bool)

(assert (=> d!153949 e!808201))

(declare-fun c!132559 () Bool)

(assert (=> d!153949 (= c!132559 (and (is-Intermediate!11324 lt!630197) (undefined!12136 lt!630197)))))

(declare-fun e!808202 () SeekEntryResult!11324)

(assert (=> d!153949 (= lt!630197 e!808202)))

(declare-fun c!132560 () Bool)

(assert (=> d!153949 (= c!132560 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!630196 () (_ BitVec 64))

(assert (=> d!153949 (= lt!630196 (select (arr!47045 lt!630042) (toIndex!0 lt!630038 mask!2608)))))

(assert (=> d!153949 (validMask!0 mask!2608)))

(assert (=> d!153949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630038 mask!2608) lt!630038 lt!630042 mask!2608) lt!630197)))

(declare-fun b!1431515 () Bool)

(assert (=> b!1431515 (= e!808202 (Intermediate!11324 true (toIndex!0 lt!630038 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431516 () Bool)

(assert (=> b!1431516 (and (bvsge (index!47690 lt!630197) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630197) (size!47595 lt!630042)))))

(declare-fun res!965391 () Bool)

(assert (=> b!1431516 (= res!965391 (= (select (arr!47045 lt!630042) (index!47690 lt!630197)) lt!630038))))

(declare-fun e!808199 () Bool)

(assert (=> b!1431516 (=> res!965391 e!808199)))

(assert (=> b!1431516 (= e!808203 e!808199)))

(declare-fun b!1431517 () Bool)

(assert (=> b!1431517 (and (bvsge (index!47690 lt!630197) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630197) (size!47595 lt!630042)))))

(declare-fun res!965393 () Bool)

(assert (=> b!1431517 (= res!965393 (= (select (arr!47045 lt!630042) (index!47690 lt!630197)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431517 (=> res!965393 e!808199)))

(declare-fun b!1431518 () Bool)

(assert (=> b!1431518 (= e!808200 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630038 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!630038 lt!630042 mask!2608))))

(declare-fun b!1431519 () Bool)

(assert (=> b!1431519 (= e!808201 (bvsge (x!129336 lt!630197) #b01111111111111111111111111111110))))

(declare-fun b!1431520 () Bool)

(assert (=> b!1431520 (= e!808202 e!808200)))

(declare-fun c!132558 () Bool)

(assert (=> b!1431520 (= c!132558 (or (= lt!630196 lt!630038) (= (bvadd lt!630196 lt!630196) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431521 () Bool)

(assert (=> b!1431521 (and (bvsge (index!47690 lt!630197) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630197) (size!47595 lt!630042)))))

(assert (=> b!1431521 (= e!808199 (= (select (arr!47045 lt!630042) (index!47690 lt!630197)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153949 c!132560) b!1431515))

(assert (= (and d!153949 (not c!132560)) b!1431520))

(assert (= (and b!1431520 c!132558) b!1431513))

(assert (= (and b!1431520 (not c!132558)) b!1431518))

(assert (= (and d!153949 c!132559) b!1431519))

(assert (= (and d!153949 (not c!132559)) b!1431514))

(assert (= (and b!1431514 res!965392) b!1431516))

(assert (= (and b!1431516 (not res!965391)) b!1431517))

(assert (= (and b!1431517 (not res!965393)) b!1431521))

(declare-fun m!1321309 () Bool)

(assert (=> b!1431517 m!1321309))

(assert (=> b!1431516 m!1321309))

(assert (=> d!153949 m!1321039))

(declare-fun m!1321311 () Bool)

(assert (=> d!153949 m!1321311))

(assert (=> d!153949 m!1321019))

(assert (=> b!1431521 m!1321309))

(assert (=> b!1431518 m!1321039))

(declare-fun m!1321313 () Bool)

(assert (=> b!1431518 m!1321313))

(assert (=> b!1431518 m!1321313))

(declare-fun m!1321315 () Bool)

(assert (=> b!1431518 m!1321315))

(assert (=> b!1431140 d!153949))

(declare-fun d!153951 () Bool)

(declare-fun lt!630199 () (_ BitVec 32))

(declare-fun lt!630198 () (_ BitVec 32))

(assert (=> d!153951 (= lt!630199 (bvmul (bvxor lt!630198 (bvlshr lt!630198 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153951 (= lt!630198 ((_ extract 31 0) (bvand (bvxor lt!630038 (bvlshr lt!630038 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153951 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965328 (let ((h!34875 ((_ extract 31 0) (bvand (bvxor lt!630038 (bvlshr lt!630038 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129343 (bvmul (bvxor h!34875 (bvlshr h!34875 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129343 (bvlshr x!129343 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965328 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965328 #b00000000000000000000000000000000))))))

(assert (=> d!153951 (= (toIndex!0 lt!630038 mask!2608) (bvand (bvxor lt!630199 (bvlshr lt!630199 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1431140 d!153951))

(declare-fun b!1431522 () Bool)

(declare-fun e!808205 () SeekEntryResult!11324)

(assert (=> b!1431522 (= e!808205 (Intermediate!11324 false index!585 x!605))))

(declare-fun b!1431523 () Bool)

(declare-fun e!808206 () Bool)

(declare-fun e!808208 () Bool)

(assert (=> b!1431523 (= e!808206 e!808208)))

(declare-fun res!965395 () Bool)

(declare-fun lt!630201 () SeekEntryResult!11324)

(assert (=> b!1431523 (= res!965395 (and (is-Intermediate!11324 lt!630201) (not (undefined!12136 lt!630201)) (bvslt (x!129336 lt!630201) #b01111111111111111111111111111110) (bvsge (x!129336 lt!630201) #b00000000000000000000000000000000) (bvsge (x!129336 lt!630201) x!605)))))

(assert (=> b!1431523 (=> (not res!965395) (not e!808208))))

(declare-fun d!153953 () Bool)

(assert (=> d!153953 e!808206))

(declare-fun c!132562 () Bool)

(assert (=> d!153953 (= c!132562 (and (is-Intermediate!11324 lt!630201) (undefined!12136 lt!630201)))))

(declare-fun e!808207 () SeekEntryResult!11324)

(assert (=> d!153953 (= lt!630201 e!808207)))

(declare-fun c!132563 () Bool)

(assert (=> d!153953 (= c!132563 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!630200 () (_ BitVec 64))

(assert (=> d!153953 (= lt!630200 (select (arr!47045 a!2831) index!585))))

(assert (=> d!153953 (validMask!0 mask!2608)))

(assert (=> d!153953 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47045 a!2831) j!81) a!2831 mask!2608) lt!630201)))

(declare-fun b!1431524 () Bool)

(assert (=> b!1431524 (= e!808207 (Intermediate!11324 true index!585 x!605))))

(declare-fun b!1431525 () Bool)

(assert (=> b!1431525 (and (bvsge (index!47690 lt!630201) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630201) (size!47595 a!2831)))))

(declare-fun res!965394 () Bool)

(assert (=> b!1431525 (= res!965394 (= (select (arr!47045 a!2831) (index!47690 lt!630201)) (select (arr!47045 a!2831) j!81)))))

(declare-fun e!808204 () Bool)

(assert (=> b!1431525 (=> res!965394 e!808204)))

(assert (=> b!1431525 (= e!808208 e!808204)))

(declare-fun b!1431526 () Bool)

(assert (=> b!1431526 (and (bvsge (index!47690 lt!630201) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630201) (size!47595 a!2831)))))

(declare-fun res!965396 () Bool)

(assert (=> b!1431526 (= res!965396 (= (select (arr!47045 a!2831) (index!47690 lt!630201)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431526 (=> res!965396 e!808204)))

(declare-fun b!1431527 () Bool)

(assert (=> b!1431527 (= e!808205 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47045 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431528 () Bool)

(assert (=> b!1431528 (= e!808206 (bvsge (x!129336 lt!630201) #b01111111111111111111111111111110))))

(declare-fun b!1431529 () Bool)

(assert (=> b!1431529 (= e!808207 e!808205)))

(declare-fun c!132561 () Bool)

(assert (=> b!1431529 (= c!132561 (or (= lt!630200 (select (arr!47045 a!2831) j!81)) (= (bvadd lt!630200 lt!630200) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431530 () Bool)

(assert (=> b!1431530 (and (bvsge (index!47690 lt!630201) #b00000000000000000000000000000000) (bvslt (index!47690 lt!630201) (size!47595 a!2831)))))

(assert (=> b!1431530 (= e!808204 (= (select (arr!47045 a!2831) (index!47690 lt!630201)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153953 c!132563) b!1431524))

(assert (= (and d!153953 (not c!132563)) b!1431529))

(assert (= (and b!1431529 c!132561) b!1431522))

(assert (= (and b!1431529 (not c!132561)) b!1431527))

(assert (= (and d!153953 c!132562) b!1431528))

(assert (= (and d!153953 (not c!132562)) b!1431523))

(assert (= (and b!1431523 res!965395) b!1431525))

(assert (= (and b!1431525 (not res!965394)) b!1431526))

(assert (= (and b!1431526 (not res!965396)) b!1431530))

(declare-fun m!1321317 () Bool)

(assert (=> b!1431526 m!1321317))

(assert (=> b!1431525 m!1321317))

(assert (=> d!153953 m!1321031))

(assert (=> d!153953 m!1321019))

(assert (=> b!1431530 m!1321317))

(assert (=> b!1431527 m!1321217))

(assert (=> b!1431527 m!1321217))

(assert (=> b!1431527 m!1321023))

(declare-fun m!1321319 () Bool)

(assert (=> b!1431527 m!1321319))

(assert (=> b!1431129 d!153953))

(push 1)

