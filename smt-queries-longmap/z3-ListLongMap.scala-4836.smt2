; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66608 () Bool)

(assert start!66608)

(declare-fun res!518852 () Bool)

(declare-fun e!427216 () Bool)

(assert (=> start!66608 (=> (not res!518852) (not e!427216))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66608 (= res!518852 (validMask!0 mask!3328))))

(assert (=> start!66608 e!427216))

(assert (=> start!66608 true))

(declare-datatypes ((array!42265 0))(
  ( (array!42266 (arr!20233 (Array (_ BitVec 32) (_ BitVec 64))) (size!20653 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42265)

(declare-fun array_inv!16092 (array!42265) Bool)

(assert (=> start!66608 (array_inv!16092 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!767084 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!427220 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7789 0))(
  ( (MissingZero!7789 (index!33524 (_ BitVec 32))) (Found!7789 (index!33525 (_ BitVec 32))) (Intermediate!7789 (undefined!8601 Bool) (index!33526 (_ BitVec 32)) (x!64590 (_ BitVec 32))) (Undefined!7789) (MissingVacant!7789 (index!33527 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42265 (_ BitVec 32)) SeekEntryResult!7789)

(assert (=> b!767084 (= e!427220 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) (Found!7789 j!159)))))

(declare-fun b!767085 () Bool)

(declare-fun e!427215 () Bool)

(assert (=> b!767085 (= e!427216 e!427215)))

(declare-fun res!518853 () Bool)

(assert (=> b!767085 (=> (not res!518853) (not e!427215))))

(declare-fun lt!341212 () SeekEntryResult!7789)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767085 (= res!518853 (or (= lt!341212 (MissingZero!7789 i!1173)) (= lt!341212 (MissingVacant!7789 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42265 (_ BitVec 32)) SeekEntryResult!7789)

(assert (=> b!767085 (= lt!341212 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!767086 () Bool)

(declare-fun res!518843 () Bool)

(assert (=> b!767086 (=> (not res!518843) (not e!427215))))

(declare-datatypes ((List!14142 0))(
  ( (Nil!14139) (Cons!14138 (h!15234 (_ BitVec 64)) (t!20449 List!14142)) )
))
(declare-fun arrayNoDuplicates!0 (array!42265 (_ BitVec 32) List!14142) Bool)

(assert (=> b!767086 (= res!518843 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14139))))

(declare-fun b!767087 () Bool)

(declare-fun res!518855 () Bool)

(assert (=> b!767087 (=> (not res!518855) (not e!427215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42265 (_ BitVec 32)) Bool)

(assert (=> b!767087 (= res!518855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!427218 () Bool)

(declare-fun lt!341210 () SeekEntryResult!7789)

(declare-fun b!767088 () Bool)

(assert (=> b!767088 (= e!427218 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!341210))))

(declare-fun b!767089 () Bool)

(declare-fun res!518845 () Bool)

(assert (=> b!767089 (=> (not res!518845) (not e!427215))))

(assert (=> b!767089 (= res!518845 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20653 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20653 a!3186))))))

(declare-fun lt!341209 () SeekEntryResult!7789)

(declare-fun b!767090 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42265 (_ BitVec 32)) SeekEntryResult!7789)

(assert (=> b!767090 (= e!427220 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!341209))))

(declare-fun e!427213 () Bool)

(declare-fun b!767091 () Bool)

(declare-fun lt!341211 () (_ BitVec 32))

(assert (=> b!767091 (= e!427213 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341211 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!341209))))

(declare-fun b!767092 () Bool)

(declare-fun e!427219 () Bool)

(declare-fun e!427214 () Bool)

(assert (=> b!767092 (= e!427219 e!427214)))

(declare-fun res!518854 () Bool)

(assert (=> b!767092 (=> (not res!518854) (not e!427214))))

(declare-fun lt!341214 () SeekEntryResult!7789)

(declare-fun lt!341213 () SeekEntryResult!7789)

(assert (=> b!767092 (= res!518854 (= lt!341214 lt!341213))))

(declare-fun lt!341217 () array!42265)

(declare-fun lt!341216 () (_ BitVec 64))

(assert (=> b!767092 (= lt!341213 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341216 lt!341217 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767092 (= lt!341214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341216 mask!3328) lt!341216 lt!341217 mask!3328))))

(assert (=> b!767092 (= lt!341216 (select (store (arr!20233 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!767092 (= lt!341217 (array!42266 (store (arr!20233 a!3186) i!1173 k0!2102) (size!20653 a!3186)))))

(declare-fun b!767093 () Bool)

(declare-fun res!518841 () Bool)

(assert (=> b!767093 (=> (not res!518841) (not e!427219))))

(assert (=> b!767093 (= res!518841 e!427220)))

(declare-fun c!84515 () Bool)

(assert (=> b!767093 (= c!84515 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767094 () Bool)

(declare-fun e!427212 () Bool)

(assert (=> b!767094 (= e!427212 e!427218)))

(declare-fun res!518840 () Bool)

(assert (=> b!767094 (=> (not res!518840) (not e!427218))))

(assert (=> b!767094 (= res!518840 (= (seekEntryOrOpen!0 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!341210))))

(assert (=> b!767094 (= lt!341210 (Found!7789 j!159))))

(declare-fun b!767095 () Bool)

(declare-fun res!518846 () Bool)

(assert (=> b!767095 (=> (not res!518846) (not e!427216))))

(assert (=> b!767095 (= res!518846 (and (= (size!20653 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20653 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20653 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767096 () Bool)

(assert (=> b!767096 (= e!427215 e!427219)))

(declare-fun res!518847 () Bool)

(assert (=> b!767096 (=> (not res!518847) (not e!427219))))

(assert (=> b!767096 (= res!518847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20233 a!3186) j!159) mask!3328) (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!341209))))

(assert (=> b!767096 (= lt!341209 (Intermediate!7789 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767097 () Bool)

(declare-fun res!518849 () Bool)

(assert (=> b!767097 (=> (not res!518849) (not e!427216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767097 (= res!518849 (validKeyInArray!0 (select (arr!20233 a!3186) j!159)))))

(declare-fun b!767098 () Bool)

(declare-fun res!518844 () Bool)

(assert (=> b!767098 (=> (not res!518844) (not e!427216))))

(assert (=> b!767098 (= res!518844 (validKeyInArray!0 k0!2102))))

(declare-fun b!767099 () Bool)

(declare-fun e!427217 () Bool)

(assert (=> b!767099 (= e!427214 (not e!427217))))

(declare-fun res!518839 () Bool)

(assert (=> b!767099 (=> res!518839 e!427217)))

(get-info :version)

(assert (=> b!767099 (= res!518839 (or (not ((_ is Intermediate!7789) lt!341213)) (bvsge x!1131 (x!64590 lt!341213))))))

(assert (=> b!767099 e!427212))

(declare-fun res!518848 () Bool)

(assert (=> b!767099 (=> (not res!518848) (not e!427212))))

(assert (=> b!767099 (= res!518848 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26383 0))(
  ( (Unit!26384) )
))
(declare-fun lt!341215 () Unit!26383)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26383)

(assert (=> b!767099 (= lt!341215 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!767100 () Bool)

(assert (=> b!767100 (= e!427217 e!427213)))

(declare-fun res!518851 () Bool)

(assert (=> b!767100 (=> res!518851 e!427213)))

(assert (=> b!767100 (= res!518851 (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767100 (= lt!341211 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!767101 () Bool)

(declare-fun res!518842 () Bool)

(assert (=> b!767101 (=> (not res!518842) (not e!427219))))

(assert (=> b!767101 (= res!518842 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20233 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767102 () Bool)

(declare-fun res!518850 () Bool)

(assert (=> b!767102 (=> (not res!518850) (not e!427216))))

(declare-fun arrayContainsKey!0 (array!42265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767102 (= res!518850 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66608 res!518852) b!767095))

(assert (= (and b!767095 res!518846) b!767097))

(assert (= (and b!767097 res!518849) b!767098))

(assert (= (and b!767098 res!518844) b!767102))

(assert (= (and b!767102 res!518850) b!767085))

(assert (= (and b!767085 res!518853) b!767087))

(assert (= (and b!767087 res!518855) b!767086))

(assert (= (and b!767086 res!518843) b!767089))

(assert (= (and b!767089 res!518845) b!767096))

(assert (= (and b!767096 res!518847) b!767101))

(assert (= (and b!767101 res!518842) b!767093))

(assert (= (and b!767093 c!84515) b!767090))

(assert (= (and b!767093 (not c!84515)) b!767084))

(assert (= (and b!767093 res!518841) b!767092))

(assert (= (and b!767092 res!518854) b!767099))

(assert (= (and b!767099 res!518848) b!767094))

(assert (= (and b!767094 res!518840) b!767088))

(assert (= (and b!767099 (not res!518839)) b!767100))

(assert (= (and b!767100 (not res!518851)) b!767091))

(declare-fun m!713449 () Bool)

(assert (=> b!767096 m!713449))

(assert (=> b!767096 m!713449))

(declare-fun m!713451 () Bool)

(assert (=> b!767096 m!713451))

(assert (=> b!767096 m!713451))

(assert (=> b!767096 m!713449))

(declare-fun m!713453 () Bool)

(assert (=> b!767096 m!713453))

(assert (=> b!767097 m!713449))

(assert (=> b!767097 m!713449))

(declare-fun m!713455 () Bool)

(assert (=> b!767097 m!713455))

(declare-fun m!713457 () Bool)

(assert (=> b!767098 m!713457))

(declare-fun m!713459 () Bool)

(assert (=> b!767100 m!713459))

(declare-fun m!713461 () Bool)

(assert (=> b!767102 m!713461))

(declare-fun m!713463 () Bool)

(assert (=> b!767086 m!713463))

(assert (=> b!767090 m!713449))

(assert (=> b!767090 m!713449))

(declare-fun m!713465 () Bool)

(assert (=> b!767090 m!713465))

(assert (=> b!767084 m!713449))

(assert (=> b!767084 m!713449))

(declare-fun m!713467 () Bool)

(assert (=> b!767084 m!713467))

(declare-fun m!713469 () Bool)

(assert (=> b!767092 m!713469))

(declare-fun m!713471 () Bool)

(assert (=> b!767092 m!713471))

(declare-fun m!713473 () Bool)

(assert (=> b!767092 m!713473))

(declare-fun m!713475 () Bool)

(assert (=> b!767092 m!713475))

(assert (=> b!767092 m!713473))

(declare-fun m!713477 () Bool)

(assert (=> b!767092 m!713477))

(assert (=> b!767091 m!713449))

(assert (=> b!767091 m!713449))

(declare-fun m!713479 () Bool)

(assert (=> b!767091 m!713479))

(declare-fun m!713481 () Bool)

(assert (=> b!767099 m!713481))

(declare-fun m!713483 () Bool)

(assert (=> b!767099 m!713483))

(declare-fun m!713485 () Bool)

(assert (=> b!767085 m!713485))

(assert (=> b!767094 m!713449))

(assert (=> b!767094 m!713449))

(declare-fun m!713487 () Bool)

(assert (=> b!767094 m!713487))

(declare-fun m!713489 () Bool)

(assert (=> b!767087 m!713489))

(assert (=> b!767088 m!713449))

(assert (=> b!767088 m!713449))

(declare-fun m!713491 () Bool)

(assert (=> b!767088 m!713491))

(declare-fun m!713493 () Bool)

(assert (=> b!767101 m!713493))

(declare-fun m!713495 () Bool)

(assert (=> start!66608 m!713495))

(declare-fun m!713497 () Bool)

(assert (=> start!66608 m!713497))

(check-sat (not b!767087) (not b!767085) (not b!767096) (not start!66608) (not b!767098) (not b!767092) (not b!767102) (not b!767094) (not b!767088) (not b!767097) (not b!767091) (not b!767100) (not b!767086) (not b!767099) (not b!767084) (not b!767090))
(check-sat)
(get-model)

(declare-fun d!101471 () Bool)

(declare-fun lt!341274 () (_ BitVec 32))

(assert (=> d!101471 (and (bvsge lt!341274 #b00000000000000000000000000000000) (bvslt lt!341274 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101471 (= lt!341274 (choose!52 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(assert (=> d!101471 (validMask!0 mask!3328)))

(assert (=> d!101471 (= (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!341274)))

(declare-fun bs!21522 () Bool)

(assert (= bs!21522 d!101471))

(declare-fun m!713599 () Bool)

(assert (=> bs!21522 m!713599))

(assert (=> bs!21522 m!713495))

(assert (=> b!767100 d!101471))

(declare-fun b!767235 () Bool)

(declare-fun lt!341280 () SeekEntryResult!7789)

(assert (=> b!767235 (and (bvsge (index!33526 lt!341280) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341280) (size!20653 a!3186)))))

(declare-fun res!518966 () Bool)

(assert (=> b!767235 (= res!518966 (= (select (arr!20233 a!3186) (index!33526 lt!341280)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427293 () Bool)

(assert (=> b!767235 (=> res!518966 e!427293)))

(declare-fun b!767236 () Bool)

(declare-fun e!427291 () SeekEntryResult!7789)

(declare-fun e!427292 () SeekEntryResult!7789)

(assert (=> b!767236 (= e!427291 e!427292)))

(declare-fun c!84529 () Bool)

(declare-fun lt!341279 () (_ BitVec 64))

(assert (=> b!767236 (= c!84529 (or (= lt!341279 (select (arr!20233 a!3186) j!159)) (= (bvadd lt!341279 lt!341279) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767237 () Bool)

(assert (=> b!767237 (and (bvsge (index!33526 lt!341280) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341280) (size!20653 a!3186)))))

(assert (=> b!767237 (= e!427293 (= (select (arr!20233 a!3186) (index!33526 lt!341280)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767238 () Bool)

(assert (=> b!767238 (and (bvsge (index!33526 lt!341280) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341280) (size!20653 a!3186)))))

(declare-fun res!518965 () Bool)

(assert (=> b!767238 (= res!518965 (= (select (arr!20233 a!3186) (index!33526 lt!341280)) (select (arr!20233 a!3186) j!159)))))

(assert (=> b!767238 (=> res!518965 e!427293)))

(declare-fun e!427295 () Bool)

(assert (=> b!767238 (= e!427295 e!427293)))

(declare-fun b!767239 () Bool)

(assert (=> b!767239 (= e!427292 (Intermediate!7789 false index!1321 x!1131))))

(declare-fun b!767240 () Bool)

(assert (=> b!767240 (= e!427291 (Intermediate!7789 true index!1321 x!1131))))

(declare-fun b!767241 () Bool)

(assert (=> b!767241 (= e!427292 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20233 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101473 () Bool)

(declare-fun e!427294 () Bool)

(assert (=> d!101473 e!427294))

(declare-fun c!84530 () Bool)

(assert (=> d!101473 (= c!84530 (and ((_ is Intermediate!7789) lt!341280) (undefined!8601 lt!341280)))))

(assert (=> d!101473 (= lt!341280 e!427291)))

(declare-fun c!84528 () Bool)

(assert (=> d!101473 (= c!84528 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101473 (= lt!341279 (select (arr!20233 a!3186) index!1321))))

(assert (=> d!101473 (validMask!0 mask!3328)))

(assert (=> d!101473 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!341280)))

(declare-fun b!767242 () Bool)

(assert (=> b!767242 (= e!427294 (bvsge (x!64590 lt!341280) #b01111111111111111111111111111110))))

(declare-fun b!767243 () Bool)

(assert (=> b!767243 (= e!427294 e!427295)))

(declare-fun res!518964 () Bool)

(assert (=> b!767243 (= res!518964 (and ((_ is Intermediate!7789) lt!341280) (not (undefined!8601 lt!341280)) (bvslt (x!64590 lt!341280) #b01111111111111111111111111111110) (bvsge (x!64590 lt!341280) #b00000000000000000000000000000000) (bvsge (x!64590 lt!341280) x!1131)))))

(assert (=> b!767243 (=> (not res!518964) (not e!427295))))

(assert (= (and d!101473 c!84528) b!767240))

(assert (= (and d!101473 (not c!84528)) b!767236))

(assert (= (and b!767236 c!84529) b!767239))

(assert (= (and b!767236 (not c!84529)) b!767241))

(assert (= (and d!101473 c!84530) b!767242))

(assert (= (and d!101473 (not c!84530)) b!767243))

(assert (= (and b!767243 res!518964) b!767238))

(assert (= (and b!767238 (not res!518965)) b!767235))

(assert (= (and b!767235 (not res!518966)) b!767237))

(declare-fun m!713601 () Bool)

(assert (=> b!767241 m!713601))

(assert (=> b!767241 m!713601))

(assert (=> b!767241 m!713449))

(declare-fun m!713603 () Bool)

(assert (=> b!767241 m!713603))

(declare-fun m!713605 () Bool)

(assert (=> b!767237 m!713605))

(declare-fun m!713607 () Bool)

(assert (=> d!101473 m!713607))

(assert (=> d!101473 m!713495))

(assert (=> b!767238 m!713605))

(assert (=> b!767235 m!713605))

(assert (=> b!767090 d!101473))

(declare-fun b!767244 () Bool)

(declare-fun lt!341282 () SeekEntryResult!7789)

(assert (=> b!767244 (and (bvsge (index!33526 lt!341282) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341282) (size!20653 a!3186)))))

(declare-fun res!518969 () Bool)

(assert (=> b!767244 (= res!518969 (= (select (arr!20233 a!3186) (index!33526 lt!341282)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427298 () Bool)

(assert (=> b!767244 (=> res!518969 e!427298)))

(declare-fun b!767245 () Bool)

(declare-fun e!427296 () SeekEntryResult!7789)

(declare-fun e!427297 () SeekEntryResult!7789)

(assert (=> b!767245 (= e!427296 e!427297)))

(declare-fun lt!341281 () (_ BitVec 64))

(declare-fun c!84532 () Bool)

(assert (=> b!767245 (= c!84532 (or (= lt!341281 (select (arr!20233 a!3186) j!159)) (= (bvadd lt!341281 lt!341281) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767246 () Bool)

(assert (=> b!767246 (and (bvsge (index!33526 lt!341282) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341282) (size!20653 a!3186)))))

(assert (=> b!767246 (= e!427298 (= (select (arr!20233 a!3186) (index!33526 lt!341282)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767247 () Bool)

(assert (=> b!767247 (and (bvsge (index!33526 lt!341282) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341282) (size!20653 a!3186)))))

(declare-fun res!518968 () Bool)

(assert (=> b!767247 (= res!518968 (= (select (arr!20233 a!3186) (index!33526 lt!341282)) (select (arr!20233 a!3186) j!159)))))

(assert (=> b!767247 (=> res!518968 e!427298)))

(declare-fun e!427300 () Bool)

(assert (=> b!767247 (= e!427300 e!427298)))

(declare-fun b!767248 () Bool)

(assert (=> b!767248 (= e!427297 (Intermediate!7789 false lt!341211 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!767249 () Bool)

(assert (=> b!767249 (= e!427296 (Intermediate!7789 true lt!341211 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!767250 () Bool)

(assert (=> b!767250 (= e!427297 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341211 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20233 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101475 () Bool)

(declare-fun e!427299 () Bool)

(assert (=> d!101475 e!427299))

(declare-fun c!84533 () Bool)

(assert (=> d!101475 (= c!84533 (and ((_ is Intermediate!7789) lt!341282) (undefined!8601 lt!341282)))))

(assert (=> d!101475 (= lt!341282 e!427296)))

(declare-fun c!84531 () Bool)

(assert (=> d!101475 (= c!84531 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101475 (= lt!341281 (select (arr!20233 a!3186) lt!341211))))

(assert (=> d!101475 (validMask!0 mask!3328)))

(assert (=> d!101475 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341211 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!341282)))

(declare-fun b!767251 () Bool)

(assert (=> b!767251 (= e!427299 (bvsge (x!64590 lt!341282) #b01111111111111111111111111111110))))

(declare-fun b!767252 () Bool)

(assert (=> b!767252 (= e!427299 e!427300)))

(declare-fun res!518967 () Bool)

(assert (=> b!767252 (= res!518967 (and ((_ is Intermediate!7789) lt!341282) (not (undefined!8601 lt!341282)) (bvslt (x!64590 lt!341282) #b01111111111111111111111111111110) (bvsge (x!64590 lt!341282) #b00000000000000000000000000000000) (bvsge (x!64590 lt!341282) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!767252 (=> (not res!518967) (not e!427300))))

(assert (= (and d!101475 c!84531) b!767249))

(assert (= (and d!101475 (not c!84531)) b!767245))

(assert (= (and b!767245 c!84532) b!767248))

(assert (= (and b!767245 (not c!84532)) b!767250))

(assert (= (and d!101475 c!84533) b!767251))

(assert (= (and d!101475 (not c!84533)) b!767252))

(assert (= (and b!767252 res!518967) b!767247))

(assert (= (and b!767247 (not res!518968)) b!767244))

(assert (= (and b!767244 (not res!518969)) b!767246))

(declare-fun m!713609 () Bool)

(assert (=> b!767250 m!713609))

(assert (=> b!767250 m!713609))

(assert (=> b!767250 m!713449))

(declare-fun m!713611 () Bool)

(assert (=> b!767250 m!713611))

(declare-fun m!713613 () Bool)

(assert (=> b!767246 m!713613))

(declare-fun m!713615 () Bool)

(assert (=> d!101475 m!713615))

(assert (=> d!101475 m!713495))

(assert (=> b!767247 m!713613))

(assert (=> b!767244 m!713613))

(assert (=> b!767091 d!101475))

(declare-fun b!767263 () Bool)

(declare-fun e!427309 () Bool)

(declare-fun contains!4060 (List!14142 (_ BitVec 64)) Bool)

(assert (=> b!767263 (= e!427309 (contains!4060 Nil!14139 (select (arr!20233 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!767264 () Bool)

(declare-fun e!427312 () Bool)

(declare-fun e!427311 () Bool)

(assert (=> b!767264 (= e!427312 e!427311)))

(declare-fun res!518976 () Bool)

(assert (=> b!767264 (=> (not res!518976) (not e!427311))))

(assert (=> b!767264 (= res!518976 (not e!427309))))

(declare-fun res!518978 () Bool)

(assert (=> b!767264 (=> (not res!518978) (not e!427309))))

(assert (=> b!767264 (= res!518978 (validKeyInArray!0 (select (arr!20233 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!767265 () Bool)

(declare-fun e!427310 () Bool)

(declare-fun call!35073 () Bool)

(assert (=> b!767265 (= e!427310 call!35073)))

(declare-fun b!767266 () Bool)

(assert (=> b!767266 (= e!427310 call!35073)))

(declare-fun d!101477 () Bool)

(declare-fun res!518977 () Bool)

(assert (=> d!101477 (=> res!518977 e!427312)))

(assert (=> d!101477 (= res!518977 (bvsge #b00000000000000000000000000000000 (size!20653 a!3186)))))

(assert (=> d!101477 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14139) e!427312)))

(declare-fun b!767267 () Bool)

(assert (=> b!767267 (= e!427311 e!427310)))

(declare-fun c!84536 () Bool)

(assert (=> b!767267 (= c!84536 (validKeyInArray!0 (select (arr!20233 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35070 () Bool)

(assert (=> bm!35070 (= call!35073 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84536 (Cons!14138 (select (arr!20233 a!3186) #b00000000000000000000000000000000) Nil!14139) Nil!14139)))))

(assert (= (and d!101477 (not res!518977)) b!767264))

(assert (= (and b!767264 res!518978) b!767263))

(assert (= (and b!767264 res!518976) b!767267))

(assert (= (and b!767267 c!84536) b!767266))

(assert (= (and b!767267 (not c!84536)) b!767265))

(assert (= (or b!767266 b!767265) bm!35070))

(declare-fun m!713617 () Bool)

(assert (=> b!767263 m!713617))

(assert (=> b!767263 m!713617))

(declare-fun m!713619 () Bool)

(assert (=> b!767263 m!713619))

(assert (=> b!767264 m!713617))

(assert (=> b!767264 m!713617))

(declare-fun m!713621 () Bool)

(assert (=> b!767264 m!713621))

(assert (=> b!767267 m!713617))

(assert (=> b!767267 m!713617))

(assert (=> b!767267 m!713621))

(assert (=> bm!35070 m!713617))

(declare-fun m!713623 () Bool)

(assert (=> bm!35070 m!713623))

(assert (=> b!767086 d!101477))

(declare-fun d!101479 () Bool)

(assert (=> d!101479 (= (validKeyInArray!0 (select (arr!20233 a!3186) j!159)) (and (not (= (select (arr!20233 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20233 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767097 d!101479))

(declare-fun bm!35073 () Bool)

(declare-fun call!35076 () Bool)

(assert (=> bm!35073 (= call!35076 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101481 () Bool)

(declare-fun res!518984 () Bool)

(declare-fun e!427320 () Bool)

(assert (=> d!101481 (=> res!518984 e!427320)))

(assert (=> d!101481 (= res!518984 (bvsge #b00000000000000000000000000000000 (size!20653 a!3186)))))

(assert (=> d!101481 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!427320)))

(declare-fun b!767276 () Bool)

(declare-fun e!427321 () Bool)

(assert (=> b!767276 (= e!427321 call!35076)))

(declare-fun b!767277 () Bool)

(declare-fun e!427319 () Bool)

(assert (=> b!767277 (= e!427319 call!35076)))

(declare-fun b!767278 () Bool)

(assert (=> b!767278 (= e!427321 e!427319)))

(declare-fun lt!341290 () (_ BitVec 64))

(assert (=> b!767278 (= lt!341290 (select (arr!20233 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341291 () Unit!26383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42265 (_ BitVec 64) (_ BitVec 32)) Unit!26383)

(assert (=> b!767278 (= lt!341291 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341290 #b00000000000000000000000000000000))))

(assert (=> b!767278 (arrayContainsKey!0 a!3186 lt!341290 #b00000000000000000000000000000000)))

(declare-fun lt!341289 () Unit!26383)

(assert (=> b!767278 (= lt!341289 lt!341291)))

(declare-fun res!518983 () Bool)

(assert (=> b!767278 (= res!518983 (= (seekEntryOrOpen!0 (select (arr!20233 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7789 #b00000000000000000000000000000000)))))

(assert (=> b!767278 (=> (not res!518983) (not e!427319))))

(declare-fun b!767279 () Bool)

(assert (=> b!767279 (= e!427320 e!427321)))

(declare-fun c!84539 () Bool)

(assert (=> b!767279 (= c!84539 (validKeyInArray!0 (select (arr!20233 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101481 (not res!518984)) b!767279))

(assert (= (and b!767279 c!84539) b!767278))

(assert (= (and b!767279 (not c!84539)) b!767276))

(assert (= (and b!767278 res!518983) b!767277))

(assert (= (or b!767277 b!767276) bm!35073))

(declare-fun m!713625 () Bool)

(assert (=> bm!35073 m!713625))

(assert (=> b!767278 m!713617))

(declare-fun m!713627 () Bool)

(assert (=> b!767278 m!713627))

(declare-fun m!713629 () Bool)

(assert (=> b!767278 m!713629))

(assert (=> b!767278 m!713617))

(declare-fun m!713631 () Bool)

(assert (=> b!767278 m!713631))

(assert (=> b!767279 m!713617))

(assert (=> b!767279 m!713617))

(assert (=> b!767279 m!713621))

(assert (=> b!767087 d!101481))

(declare-fun d!101487 () Bool)

(assert (=> d!101487 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767098 d!101487))

(declare-fun b!767328 () Bool)

(declare-fun e!427348 () SeekEntryResult!7789)

(assert (=> b!767328 (= e!427348 (MissingVacant!7789 resIntermediateIndex!5))))

(declare-fun b!767329 () Bool)

(declare-fun c!84566 () Bool)

(declare-fun lt!341308 () (_ BitVec 64))

(assert (=> b!767329 (= c!84566 (= lt!341308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427347 () SeekEntryResult!7789)

(assert (=> b!767329 (= e!427347 e!427348)))

(declare-fun b!767331 () Bool)

(assert (=> b!767331 (= e!427347 (Found!7789 resIntermediateIndex!5))))

(declare-fun b!767332 () Bool)

(assert (=> b!767332 (= e!427348 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20233 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767333 () Bool)

(declare-fun e!427346 () SeekEntryResult!7789)

(assert (=> b!767333 (= e!427346 e!427347)))

(declare-fun c!84565 () Bool)

(assert (=> b!767333 (= c!84565 (= lt!341308 (select (arr!20233 a!3186) j!159)))))

(declare-fun d!101489 () Bool)

(declare-fun lt!341309 () SeekEntryResult!7789)

(assert (=> d!101489 (and (or ((_ is Undefined!7789) lt!341309) (not ((_ is Found!7789) lt!341309)) (and (bvsge (index!33525 lt!341309) #b00000000000000000000000000000000) (bvslt (index!33525 lt!341309) (size!20653 a!3186)))) (or ((_ is Undefined!7789) lt!341309) ((_ is Found!7789) lt!341309) (not ((_ is MissingVacant!7789) lt!341309)) (not (= (index!33527 lt!341309) resIntermediateIndex!5)) (and (bvsge (index!33527 lt!341309) #b00000000000000000000000000000000) (bvslt (index!33527 lt!341309) (size!20653 a!3186)))) (or ((_ is Undefined!7789) lt!341309) (ite ((_ is Found!7789) lt!341309) (= (select (arr!20233 a!3186) (index!33525 lt!341309)) (select (arr!20233 a!3186) j!159)) (and ((_ is MissingVacant!7789) lt!341309) (= (index!33527 lt!341309) resIntermediateIndex!5) (= (select (arr!20233 a!3186) (index!33527 lt!341309)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101489 (= lt!341309 e!427346)))

(declare-fun c!84564 () Bool)

(assert (=> d!101489 (= c!84564 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101489 (= lt!341308 (select (arr!20233 a!3186) resIntermediateIndex!5))))

(assert (=> d!101489 (validMask!0 mask!3328)))

(assert (=> d!101489 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!341309)))

(declare-fun b!767330 () Bool)

(assert (=> b!767330 (= e!427346 Undefined!7789)))

(assert (= (and d!101489 c!84564) b!767330))

(assert (= (and d!101489 (not c!84564)) b!767333))

(assert (= (and b!767333 c!84565) b!767331))

(assert (= (and b!767333 (not c!84565)) b!767329))

(assert (= (and b!767329 c!84566) b!767328))

(assert (= (and b!767329 (not c!84566)) b!767332))

(declare-fun m!713653 () Bool)

(assert (=> b!767332 m!713653))

(assert (=> b!767332 m!713653))

(assert (=> b!767332 m!713449))

(declare-fun m!713655 () Bool)

(assert (=> b!767332 m!713655))

(declare-fun m!713657 () Bool)

(assert (=> d!101489 m!713657))

(declare-fun m!713659 () Bool)

(assert (=> d!101489 m!713659))

(assert (=> d!101489 m!713493))

(assert (=> d!101489 m!713495))

(assert (=> b!767088 d!101489))

(declare-fun call!35077 () Bool)

(declare-fun bm!35074 () Bool)

(assert (=> bm!35074 (= call!35077 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101495 () Bool)

(declare-fun res!518986 () Bool)

(declare-fun e!427350 () Bool)

(assert (=> d!101495 (=> res!518986 e!427350)))

(assert (=> d!101495 (= res!518986 (bvsge j!159 (size!20653 a!3186)))))

(assert (=> d!101495 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!427350)))

(declare-fun b!767334 () Bool)

(declare-fun e!427351 () Bool)

(assert (=> b!767334 (= e!427351 call!35077)))

(declare-fun b!767335 () Bool)

(declare-fun e!427349 () Bool)

(assert (=> b!767335 (= e!427349 call!35077)))

(declare-fun b!767336 () Bool)

(assert (=> b!767336 (= e!427351 e!427349)))

(declare-fun lt!341311 () (_ BitVec 64))

(assert (=> b!767336 (= lt!341311 (select (arr!20233 a!3186) j!159))))

(declare-fun lt!341312 () Unit!26383)

(assert (=> b!767336 (= lt!341312 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341311 j!159))))

(assert (=> b!767336 (arrayContainsKey!0 a!3186 lt!341311 #b00000000000000000000000000000000)))

(declare-fun lt!341310 () Unit!26383)

(assert (=> b!767336 (= lt!341310 lt!341312)))

(declare-fun res!518985 () Bool)

(assert (=> b!767336 (= res!518985 (= (seekEntryOrOpen!0 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) (Found!7789 j!159)))))

(assert (=> b!767336 (=> (not res!518985) (not e!427349))))

(declare-fun b!767337 () Bool)

(assert (=> b!767337 (= e!427350 e!427351)))

(declare-fun c!84567 () Bool)

(assert (=> b!767337 (= c!84567 (validKeyInArray!0 (select (arr!20233 a!3186) j!159)))))

(assert (= (and d!101495 (not res!518986)) b!767337))

(assert (= (and b!767337 c!84567) b!767336))

(assert (= (and b!767337 (not c!84567)) b!767334))

(assert (= (and b!767336 res!518985) b!767335))

(assert (= (or b!767335 b!767334) bm!35074))

(declare-fun m!713661 () Bool)

(assert (=> bm!35074 m!713661))

(assert (=> b!767336 m!713449))

(declare-fun m!713663 () Bool)

(assert (=> b!767336 m!713663))

(declare-fun m!713665 () Bool)

(assert (=> b!767336 m!713665))

(assert (=> b!767336 m!713449))

(assert (=> b!767336 m!713487))

(assert (=> b!767337 m!713449))

(assert (=> b!767337 m!713449))

(assert (=> b!767337 m!713455))

(assert (=> b!767099 d!101495))

(declare-fun d!101497 () Bool)

(assert (=> d!101497 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341321 () Unit!26383)

(declare-fun choose!38 (array!42265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26383)

(assert (=> d!101497 (= lt!341321 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101497 (validMask!0 mask!3328)))

(assert (=> d!101497 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341321)))

(declare-fun bs!21523 () Bool)

(assert (= bs!21523 d!101497))

(assert (=> bs!21523 m!713481))

(declare-fun m!713667 () Bool)

(assert (=> bs!21523 m!713667))

(assert (=> bs!21523 m!713495))

(assert (=> b!767099 d!101497))

(declare-fun b!767442 () Bool)

(declare-fun e!427415 () SeekEntryResult!7789)

(declare-fun e!427414 () SeekEntryResult!7789)

(assert (=> b!767442 (= e!427415 e!427414)))

(declare-fun lt!341353 () (_ BitVec 64))

(declare-fun lt!341352 () SeekEntryResult!7789)

(assert (=> b!767442 (= lt!341353 (select (arr!20233 a!3186) (index!33526 lt!341352)))))

(declare-fun c!84608 () Bool)

(assert (=> b!767442 (= c!84608 (= lt!341353 (select (arr!20233 a!3186) j!159)))))

(declare-fun b!767443 () Bool)

(assert (=> b!767443 (= e!427414 (Found!7789 (index!33526 lt!341352)))))

(declare-fun d!101499 () Bool)

(declare-fun lt!341354 () SeekEntryResult!7789)

(assert (=> d!101499 (and (or ((_ is Undefined!7789) lt!341354) (not ((_ is Found!7789) lt!341354)) (and (bvsge (index!33525 lt!341354) #b00000000000000000000000000000000) (bvslt (index!33525 lt!341354) (size!20653 a!3186)))) (or ((_ is Undefined!7789) lt!341354) ((_ is Found!7789) lt!341354) (not ((_ is MissingZero!7789) lt!341354)) (and (bvsge (index!33524 lt!341354) #b00000000000000000000000000000000) (bvslt (index!33524 lt!341354) (size!20653 a!3186)))) (or ((_ is Undefined!7789) lt!341354) ((_ is Found!7789) lt!341354) ((_ is MissingZero!7789) lt!341354) (not ((_ is MissingVacant!7789) lt!341354)) (and (bvsge (index!33527 lt!341354) #b00000000000000000000000000000000) (bvslt (index!33527 lt!341354) (size!20653 a!3186)))) (or ((_ is Undefined!7789) lt!341354) (ite ((_ is Found!7789) lt!341354) (= (select (arr!20233 a!3186) (index!33525 lt!341354)) (select (arr!20233 a!3186) j!159)) (ite ((_ is MissingZero!7789) lt!341354) (= (select (arr!20233 a!3186) (index!33524 lt!341354)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7789) lt!341354) (= (select (arr!20233 a!3186) (index!33527 lt!341354)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101499 (= lt!341354 e!427415)))

(declare-fun c!84607 () Bool)

(assert (=> d!101499 (= c!84607 (and ((_ is Intermediate!7789) lt!341352) (undefined!8601 lt!341352)))))

(assert (=> d!101499 (= lt!341352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20233 a!3186) j!159) mask!3328) (select (arr!20233 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101499 (validMask!0 mask!3328)))

(assert (=> d!101499 (= (seekEntryOrOpen!0 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!341354)))

(declare-fun b!767444 () Bool)

(declare-fun e!427413 () SeekEntryResult!7789)

(assert (=> b!767444 (= e!427413 (MissingZero!7789 (index!33526 lt!341352)))))

(declare-fun b!767445 () Bool)

(declare-fun c!84606 () Bool)

(assert (=> b!767445 (= c!84606 (= lt!341353 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767445 (= e!427414 e!427413)))

(declare-fun b!767446 () Bool)

(assert (=> b!767446 (= e!427413 (seekKeyOrZeroReturnVacant!0 (x!64590 lt!341352) (index!33526 lt!341352) (index!33526 lt!341352) (select (arr!20233 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767447 () Bool)

(assert (=> b!767447 (= e!427415 Undefined!7789)))

(assert (= (and d!101499 c!84607) b!767447))

(assert (= (and d!101499 (not c!84607)) b!767442))

(assert (= (and b!767442 c!84608) b!767443))

(assert (= (and b!767442 (not c!84608)) b!767445))

(assert (= (and b!767445 c!84606) b!767444))

(assert (= (and b!767445 (not c!84606)) b!767446))

(declare-fun m!713705 () Bool)

(assert (=> b!767442 m!713705))

(assert (=> d!101499 m!713449))

(assert (=> d!101499 m!713451))

(declare-fun m!713707 () Bool)

(assert (=> d!101499 m!713707))

(assert (=> d!101499 m!713451))

(assert (=> d!101499 m!713449))

(assert (=> d!101499 m!713453))

(assert (=> d!101499 m!713495))

(declare-fun m!713709 () Bool)

(assert (=> d!101499 m!713709))

(declare-fun m!713711 () Bool)

(assert (=> d!101499 m!713711))

(assert (=> b!767446 m!713449))

(declare-fun m!713713 () Bool)

(assert (=> b!767446 m!713713))

(assert (=> b!767094 d!101499))

(declare-fun b!767448 () Bool)

(declare-fun e!427418 () SeekEntryResult!7789)

(assert (=> b!767448 (= e!427418 (MissingVacant!7789 resIntermediateIndex!5))))

(declare-fun b!767449 () Bool)

(declare-fun c!84611 () Bool)

(declare-fun lt!341355 () (_ BitVec 64))

(assert (=> b!767449 (= c!84611 (= lt!341355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427417 () SeekEntryResult!7789)

(assert (=> b!767449 (= e!427417 e!427418)))

(declare-fun b!767451 () Bool)

(assert (=> b!767451 (= e!427417 (Found!7789 index!1321))))

(declare-fun b!767452 () Bool)

(assert (=> b!767452 (= e!427418 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20233 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767453 () Bool)

(declare-fun e!427416 () SeekEntryResult!7789)

(assert (=> b!767453 (= e!427416 e!427417)))

(declare-fun c!84610 () Bool)

(assert (=> b!767453 (= c!84610 (= lt!341355 (select (arr!20233 a!3186) j!159)))))

(declare-fun d!101513 () Bool)

(declare-fun lt!341356 () SeekEntryResult!7789)

(assert (=> d!101513 (and (or ((_ is Undefined!7789) lt!341356) (not ((_ is Found!7789) lt!341356)) (and (bvsge (index!33525 lt!341356) #b00000000000000000000000000000000) (bvslt (index!33525 lt!341356) (size!20653 a!3186)))) (or ((_ is Undefined!7789) lt!341356) ((_ is Found!7789) lt!341356) (not ((_ is MissingVacant!7789) lt!341356)) (not (= (index!33527 lt!341356) resIntermediateIndex!5)) (and (bvsge (index!33527 lt!341356) #b00000000000000000000000000000000) (bvslt (index!33527 lt!341356) (size!20653 a!3186)))) (or ((_ is Undefined!7789) lt!341356) (ite ((_ is Found!7789) lt!341356) (= (select (arr!20233 a!3186) (index!33525 lt!341356)) (select (arr!20233 a!3186) j!159)) (and ((_ is MissingVacant!7789) lt!341356) (= (index!33527 lt!341356) resIntermediateIndex!5) (= (select (arr!20233 a!3186) (index!33527 lt!341356)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101513 (= lt!341356 e!427416)))

(declare-fun c!84609 () Bool)

(assert (=> d!101513 (= c!84609 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101513 (= lt!341355 (select (arr!20233 a!3186) index!1321))))

(assert (=> d!101513 (validMask!0 mask!3328)))

(assert (=> d!101513 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!341356)))

(declare-fun b!767450 () Bool)

(assert (=> b!767450 (= e!427416 Undefined!7789)))

(assert (= (and d!101513 c!84609) b!767450))

(assert (= (and d!101513 (not c!84609)) b!767453))

(assert (= (and b!767453 c!84610) b!767451))

(assert (= (and b!767453 (not c!84610)) b!767449))

(assert (= (and b!767449 c!84611) b!767448))

(assert (= (and b!767449 (not c!84611)) b!767452))

(assert (=> b!767452 m!713601))

(assert (=> b!767452 m!713601))

(assert (=> b!767452 m!713449))

(declare-fun m!713717 () Bool)

(assert (=> b!767452 m!713717))

(declare-fun m!713723 () Bool)

(assert (=> d!101513 m!713723))

(declare-fun m!713725 () Bool)

(assert (=> d!101513 m!713725))

(assert (=> d!101513 m!713607))

(assert (=> d!101513 m!713495))

(assert (=> b!767084 d!101513))

(declare-fun b!767467 () Bool)

(declare-fun e!427429 () SeekEntryResult!7789)

(declare-fun e!427428 () SeekEntryResult!7789)

(assert (=> b!767467 (= e!427429 e!427428)))

(declare-fun lt!341363 () (_ BitVec 64))

(declare-fun lt!341362 () SeekEntryResult!7789)

(assert (=> b!767467 (= lt!341363 (select (arr!20233 a!3186) (index!33526 lt!341362)))))

(declare-fun c!84618 () Bool)

(assert (=> b!767467 (= c!84618 (= lt!341363 k0!2102))))

(declare-fun b!767468 () Bool)

(assert (=> b!767468 (= e!427428 (Found!7789 (index!33526 lt!341362)))))

(declare-fun d!101517 () Bool)

(declare-fun lt!341364 () SeekEntryResult!7789)

(assert (=> d!101517 (and (or ((_ is Undefined!7789) lt!341364) (not ((_ is Found!7789) lt!341364)) (and (bvsge (index!33525 lt!341364) #b00000000000000000000000000000000) (bvslt (index!33525 lt!341364) (size!20653 a!3186)))) (or ((_ is Undefined!7789) lt!341364) ((_ is Found!7789) lt!341364) (not ((_ is MissingZero!7789) lt!341364)) (and (bvsge (index!33524 lt!341364) #b00000000000000000000000000000000) (bvslt (index!33524 lt!341364) (size!20653 a!3186)))) (or ((_ is Undefined!7789) lt!341364) ((_ is Found!7789) lt!341364) ((_ is MissingZero!7789) lt!341364) (not ((_ is MissingVacant!7789) lt!341364)) (and (bvsge (index!33527 lt!341364) #b00000000000000000000000000000000) (bvslt (index!33527 lt!341364) (size!20653 a!3186)))) (or ((_ is Undefined!7789) lt!341364) (ite ((_ is Found!7789) lt!341364) (= (select (arr!20233 a!3186) (index!33525 lt!341364)) k0!2102) (ite ((_ is MissingZero!7789) lt!341364) (= (select (arr!20233 a!3186) (index!33524 lt!341364)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7789) lt!341364) (= (select (arr!20233 a!3186) (index!33527 lt!341364)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101517 (= lt!341364 e!427429)))

(declare-fun c!84617 () Bool)

(assert (=> d!101517 (= c!84617 (and ((_ is Intermediate!7789) lt!341362) (undefined!8601 lt!341362)))))

(assert (=> d!101517 (= lt!341362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101517 (validMask!0 mask!3328)))

(assert (=> d!101517 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!341364)))

(declare-fun b!767469 () Bool)

(declare-fun e!427427 () SeekEntryResult!7789)

(assert (=> b!767469 (= e!427427 (MissingZero!7789 (index!33526 lt!341362)))))

(declare-fun b!767470 () Bool)

(declare-fun c!84616 () Bool)

(assert (=> b!767470 (= c!84616 (= lt!341363 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767470 (= e!427428 e!427427)))

(declare-fun b!767471 () Bool)

(assert (=> b!767471 (= e!427427 (seekKeyOrZeroReturnVacant!0 (x!64590 lt!341362) (index!33526 lt!341362) (index!33526 lt!341362) k0!2102 a!3186 mask!3328))))

(declare-fun b!767472 () Bool)

(assert (=> b!767472 (= e!427429 Undefined!7789)))

(assert (= (and d!101517 c!84617) b!767472))

(assert (= (and d!101517 (not c!84617)) b!767467))

(assert (= (and b!767467 c!84618) b!767468))

(assert (= (and b!767467 (not c!84618)) b!767470))

(assert (= (and b!767470 c!84616) b!767469))

(assert (= (and b!767470 (not c!84616)) b!767471))

(declare-fun m!713735 () Bool)

(assert (=> b!767467 m!713735))

(declare-fun m!713737 () Bool)

(assert (=> d!101517 m!713737))

(declare-fun m!713739 () Bool)

(assert (=> d!101517 m!713739))

(assert (=> d!101517 m!713737))

(declare-fun m!713741 () Bool)

(assert (=> d!101517 m!713741))

(assert (=> d!101517 m!713495))

(declare-fun m!713743 () Bool)

(assert (=> d!101517 m!713743))

(declare-fun m!713745 () Bool)

(assert (=> d!101517 m!713745))

(declare-fun m!713747 () Bool)

(assert (=> b!767471 m!713747))

(assert (=> b!767085 d!101517))

(declare-fun b!767473 () Bool)

(declare-fun lt!341366 () SeekEntryResult!7789)

(assert (=> b!767473 (and (bvsge (index!33526 lt!341366) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341366) (size!20653 a!3186)))))

(declare-fun res!519023 () Bool)

(assert (=> b!767473 (= res!519023 (= (select (arr!20233 a!3186) (index!33526 lt!341366)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427432 () Bool)

(assert (=> b!767473 (=> res!519023 e!427432)))

(declare-fun b!767474 () Bool)

(declare-fun e!427430 () SeekEntryResult!7789)

(declare-fun e!427431 () SeekEntryResult!7789)

(assert (=> b!767474 (= e!427430 e!427431)))

(declare-fun c!84620 () Bool)

(declare-fun lt!341365 () (_ BitVec 64))

(assert (=> b!767474 (= c!84620 (or (= lt!341365 (select (arr!20233 a!3186) j!159)) (= (bvadd lt!341365 lt!341365) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767475 () Bool)

(assert (=> b!767475 (and (bvsge (index!33526 lt!341366) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341366) (size!20653 a!3186)))))

(assert (=> b!767475 (= e!427432 (= (select (arr!20233 a!3186) (index!33526 lt!341366)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767476 () Bool)

(assert (=> b!767476 (and (bvsge (index!33526 lt!341366) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341366) (size!20653 a!3186)))))

(declare-fun res!519022 () Bool)

(assert (=> b!767476 (= res!519022 (= (select (arr!20233 a!3186) (index!33526 lt!341366)) (select (arr!20233 a!3186) j!159)))))

(assert (=> b!767476 (=> res!519022 e!427432)))

(declare-fun e!427434 () Bool)

(assert (=> b!767476 (= e!427434 e!427432)))

(declare-fun b!767477 () Bool)

(assert (=> b!767477 (= e!427431 (Intermediate!7789 false (toIndex!0 (select (arr!20233 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767478 () Bool)

(assert (=> b!767478 (= e!427430 (Intermediate!7789 true (toIndex!0 (select (arr!20233 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767479 () Bool)

(assert (=> b!767479 (= e!427431 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20233 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20233 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101521 () Bool)

(declare-fun e!427433 () Bool)

(assert (=> d!101521 e!427433))

(declare-fun c!84621 () Bool)

(assert (=> d!101521 (= c!84621 (and ((_ is Intermediate!7789) lt!341366) (undefined!8601 lt!341366)))))

(assert (=> d!101521 (= lt!341366 e!427430)))

(declare-fun c!84619 () Bool)

(assert (=> d!101521 (= c!84619 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101521 (= lt!341365 (select (arr!20233 a!3186) (toIndex!0 (select (arr!20233 a!3186) j!159) mask!3328)))))

(assert (=> d!101521 (validMask!0 mask!3328)))

(assert (=> d!101521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20233 a!3186) j!159) mask!3328) (select (arr!20233 a!3186) j!159) a!3186 mask!3328) lt!341366)))

(declare-fun b!767480 () Bool)

(assert (=> b!767480 (= e!427433 (bvsge (x!64590 lt!341366) #b01111111111111111111111111111110))))

(declare-fun b!767481 () Bool)

(assert (=> b!767481 (= e!427433 e!427434)))

(declare-fun res!519021 () Bool)

(assert (=> b!767481 (= res!519021 (and ((_ is Intermediate!7789) lt!341366) (not (undefined!8601 lt!341366)) (bvslt (x!64590 lt!341366) #b01111111111111111111111111111110) (bvsge (x!64590 lt!341366) #b00000000000000000000000000000000) (bvsge (x!64590 lt!341366) #b00000000000000000000000000000000)))))

(assert (=> b!767481 (=> (not res!519021) (not e!427434))))

(assert (= (and d!101521 c!84619) b!767478))

(assert (= (and d!101521 (not c!84619)) b!767474))

(assert (= (and b!767474 c!84620) b!767477))

(assert (= (and b!767474 (not c!84620)) b!767479))

(assert (= (and d!101521 c!84621) b!767480))

(assert (= (and d!101521 (not c!84621)) b!767481))

(assert (= (and b!767481 res!519021) b!767476))

(assert (= (and b!767476 (not res!519022)) b!767473))

(assert (= (and b!767473 (not res!519023)) b!767475))

(assert (=> b!767479 m!713451))

(declare-fun m!713749 () Bool)

(assert (=> b!767479 m!713749))

(assert (=> b!767479 m!713749))

(assert (=> b!767479 m!713449))

(declare-fun m!713751 () Bool)

(assert (=> b!767479 m!713751))

(declare-fun m!713753 () Bool)

(assert (=> b!767475 m!713753))

(assert (=> d!101521 m!713451))

(declare-fun m!713755 () Bool)

(assert (=> d!101521 m!713755))

(assert (=> d!101521 m!713495))

(assert (=> b!767476 m!713753))

(assert (=> b!767473 m!713753))

(assert (=> b!767096 d!101521))

(declare-fun d!101523 () Bool)

(declare-fun lt!341383 () (_ BitVec 32))

(declare-fun lt!341382 () (_ BitVec 32))

(assert (=> d!101523 (= lt!341383 (bvmul (bvxor lt!341382 (bvlshr lt!341382 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101523 (= lt!341382 ((_ extract 31 0) (bvand (bvxor (select (arr!20233 a!3186) j!159) (bvlshr (select (arr!20233 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101523 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519024 (let ((h!15238 ((_ extract 31 0) (bvand (bvxor (select (arr!20233 a!3186) j!159) (bvlshr (select (arr!20233 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64602 (bvmul (bvxor h!15238 (bvlshr h!15238 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64602 (bvlshr x!64602 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519024 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519024 #b00000000000000000000000000000000))))))

(assert (=> d!101523 (= (toIndex!0 (select (arr!20233 a!3186) j!159) mask!3328) (bvand (bvxor lt!341383 (bvlshr lt!341383 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767096 d!101523))

(declare-fun d!101533 () Bool)

(declare-fun res!519039 () Bool)

(declare-fun e!427454 () Bool)

(assert (=> d!101533 (=> res!519039 e!427454)))

(assert (=> d!101533 (= res!519039 (= (select (arr!20233 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101533 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!427454)))

(declare-fun b!767506 () Bool)

(declare-fun e!427455 () Bool)

(assert (=> b!767506 (= e!427454 e!427455)))

(declare-fun res!519040 () Bool)

(assert (=> b!767506 (=> (not res!519040) (not e!427455))))

(assert (=> b!767506 (= res!519040 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20653 a!3186)))))

(declare-fun b!767507 () Bool)

(assert (=> b!767507 (= e!427455 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101533 (not res!519039)) b!767506))

(assert (= (and b!767506 res!519040) b!767507))

(assert (=> d!101533 m!713617))

(declare-fun m!713771 () Bool)

(assert (=> b!767507 m!713771))

(assert (=> b!767102 d!101533))

(declare-fun b!767508 () Bool)

(declare-fun lt!341394 () SeekEntryResult!7789)

(assert (=> b!767508 (and (bvsge (index!33526 lt!341394) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341394) (size!20653 lt!341217)))))

(declare-fun res!519043 () Bool)

(assert (=> b!767508 (= res!519043 (= (select (arr!20233 lt!341217) (index!33526 lt!341394)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427458 () Bool)

(assert (=> b!767508 (=> res!519043 e!427458)))

(declare-fun b!767509 () Bool)

(declare-fun e!427456 () SeekEntryResult!7789)

(declare-fun e!427457 () SeekEntryResult!7789)

(assert (=> b!767509 (= e!427456 e!427457)))

(declare-fun c!84628 () Bool)

(declare-fun lt!341393 () (_ BitVec 64))

(assert (=> b!767509 (= c!84628 (or (= lt!341393 lt!341216) (= (bvadd lt!341393 lt!341393) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767510 () Bool)

(assert (=> b!767510 (and (bvsge (index!33526 lt!341394) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341394) (size!20653 lt!341217)))))

(assert (=> b!767510 (= e!427458 (= (select (arr!20233 lt!341217) (index!33526 lt!341394)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767511 () Bool)

(assert (=> b!767511 (and (bvsge (index!33526 lt!341394) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341394) (size!20653 lt!341217)))))

(declare-fun res!519042 () Bool)

(assert (=> b!767511 (= res!519042 (= (select (arr!20233 lt!341217) (index!33526 lt!341394)) lt!341216))))

(assert (=> b!767511 (=> res!519042 e!427458)))

(declare-fun e!427460 () Bool)

(assert (=> b!767511 (= e!427460 e!427458)))

(declare-fun b!767512 () Bool)

(assert (=> b!767512 (= e!427457 (Intermediate!7789 false index!1321 x!1131))))

(declare-fun b!767513 () Bool)

(assert (=> b!767513 (= e!427456 (Intermediate!7789 true index!1321 x!1131))))

(declare-fun b!767514 () Bool)

(assert (=> b!767514 (= e!427457 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!341216 lt!341217 mask!3328))))

(declare-fun d!101539 () Bool)

(declare-fun e!427459 () Bool)

(assert (=> d!101539 e!427459))

(declare-fun c!84629 () Bool)

(assert (=> d!101539 (= c!84629 (and ((_ is Intermediate!7789) lt!341394) (undefined!8601 lt!341394)))))

(assert (=> d!101539 (= lt!341394 e!427456)))

(declare-fun c!84627 () Bool)

(assert (=> d!101539 (= c!84627 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101539 (= lt!341393 (select (arr!20233 lt!341217) index!1321))))

(assert (=> d!101539 (validMask!0 mask!3328)))

(assert (=> d!101539 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341216 lt!341217 mask!3328) lt!341394)))

(declare-fun b!767515 () Bool)

(assert (=> b!767515 (= e!427459 (bvsge (x!64590 lt!341394) #b01111111111111111111111111111110))))

(declare-fun b!767516 () Bool)

(assert (=> b!767516 (= e!427459 e!427460)))

(declare-fun res!519041 () Bool)

(assert (=> b!767516 (= res!519041 (and ((_ is Intermediate!7789) lt!341394) (not (undefined!8601 lt!341394)) (bvslt (x!64590 lt!341394) #b01111111111111111111111111111110) (bvsge (x!64590 lt!341394) #b00000000000000000000000000000000) (bvsge (x!64590 lt!341394) x!1131)))))

(assert (=> b!767516 (=> (not res!519041) (not e!427460))))

(assert (= (and d!101539 c!84627) b!767513))

(assert (= (and d!101539 (not c!84627)) b!767509))

(assert (= (and b!767509 c!84628) b!767512))

(assert (= (and b!767509 (not c!84628)) b!767514))

(assert (= (and d!101539 c!84629) b!767515))

(assert (= (and d!101539 (not c!84629)) b!767516))

(assert (= (and b!767516 res!519041) b!767511))

(assert (= (and b!767511 (not res!519042)) b!767508))

(assert (= (and b!767508 (not res!519043)) b!767510))

(assert (=> b!767514 m!713601))

(assert (=> b!767514 m!713601))

(declare-fun m!713773 () Bool)

(assert (=> b!767514 m!713773))

(declare-fun m!713775 () Bool)

(assert (=> b!767510 m!713775))

(declare-fun m!713777 () Bool)

(assert (=> d!101539 m!713777))

(assert (=> d!101539 m!713495))

(assert (=> b!767511 m!713775))

(assert (=> b!767508 m!713775))

(assert (=> b!767092 d!101539))

(declare-fun b!767521 () Bool)

(declare-fun lt!341399 () SeekEntryResult!7789)

(assert (=> b!767521 (and (bvsge (index!33526 lt!341399) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341399) (size!20653 lt!341217)))))

(declare-fun res!519048 () Bool)

(assert (=> b!767521 (= res!519048 (= (select (arr!20233 lt!341217) (index!33526 lt!341399)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427466 () Bool)

(assert (=> b!767521 (=> res!519048 e!427466)))

(declare-fun b!767522 () Bool)

(declare-fun e!427464 () SeekEntryResult!7789)

(declare-fun e!427465 () SeekEntryResult!7789)

(assert (=> b!767522 (= e!427464 e!427465)))

(declare-fun c!84632 () Bool)

(declare-fun lt!341398 () (_ BitVec 64))

(assert (=> b!767522 (= c!84632 (or (= lt!341398 lt!341216) (= (bvadd lt!341398 lt!341398) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767523 () Bool)

(assert (=> b!767523 (and (bvsge (index!33526 lt!341399) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341399) (size!20653 lt!341217)))))

(assert (=> b!767523 (= e!427466 (= (select (arr!20233 lt!341217) (index!33526 lt!341399)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767524 () Bool)

(assert (=> b!767524 (and (bvsge (index!33526 lt!341399) #b00000000000000000000000000000000) (bvslt (index!33526 lt!341399) (size!20653 lt!341217)))))

(declare-fun res!519047 () Bool)

(assert (=> b!767524 (= res!519047 (= (select (arr!20233 lt!341217) (index!33526 lt!341399)) lt!341216))))

(assert (=> b!767524 (=> res!519047 e!427466)))

(declare-fun e!427468 () Bool)

(assert (=> b!767524 (= e!427468 e!427466)))

(declare-fun b!767525 () Bool)

(assert (=> b!767525 (= e!427465 (Intermediate!7789 false (toIndex!0 lt!341216 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767526 () Bool)

(assert (=> b!767526 (= e!427464 (Intermediate!7789 true (toIndex!0 lt!341216 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767527 () Bool)

(assert (=> b!767527 (= e!427465 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341216 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!341216 lt!341217 mask!3328))))

(declare-fun d!101541 () Bool)

(declare-fun e!427467 () Bool)

(assert (=> d!101541 e!427467))

(declare-fun c!84633 () Bool)

(assert (=> d!101541 (= c!84633 (and ((_ is Intermediate!7789) lt!341399) (undefined!8601 lt!341399)))))

(assert (=> d!101541 (= lt!341399 e!427464)))

(declare-fun c!84631 () Bool)

(assert (=> d!101541 (= c!84631 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101541 (= lt!341398 (select (arr!20233 lt!341217) (toIndex!0 lt!341216 mask!3328)))))

(assert (=> d!101541 (validMask!0 mask!3328)))

(assert (=> d!101541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341216 mask!3328) lt!341216 lt!341217 mask!3328) lt!341399)))

(declare-fun b!767528 () Bool)

(assert (=> b!767528 (= e!427467 (bvsge (x!64590 lt!341399) #b01111111111111111111111111111110))))

(declare-fun b!767529 () Bool)

(assert (=> b!767529 (= e!427467 e!427468)))

(declare-fun res!519046 () Bool)

(assert (=> b!767529 (= res!519046 (and ((_ is Intermediate!7789) lt!341399) (not (undefined!8601 lt!341399)) (bvslt (x!64590 lt!341399) #b01111111111111111111111111111110) (bvsge (x!64590 lt!341399) #b00000000000000000000000000000000) (bvsge (x!64590 lt!341399) #b00000000000000000000000000000000)))))

(assert (=> b!767529 (=> (not res!519046) (not e!427468))))

(assert (= (and d!101541 c!84631) b!767526))

(assert (= (and d!101541 (not c!84631)) b!767522))

(assert (= (and b!767522 c!84632) b!767525))

(assert (= (and b!767522 (not c!84632)) b!767527))

(assert (= (and d!101541 c!84633) b!767528))

(assert (= (and d!101541 (not c!84633)) b!767529))

(assert (= (and b!767529 res!519046) b!767524))

(assert (= (and b!767524 (not res!519047)) b!767521))

(assert (= (and b!767521 (not res!519048)) b!767523))

(assert (=> b!767527 m!713473))

(declare-fun m!713785 () Bool)

(assert (=> b!767527 m!713785))

(assert (=> b!767527 m!713785))

(declare-fun m!713787 () Bool)

(assert (=> b!767527 m!713787))

(declare-fun m!713789 () Bool)

(assert (=> b!767523 m!713789))

(assert (=> d!101541 m!713473))

(declare-fun m!713791 () Bool)

(assert (=> d!101541 m!713791))

(assert (=> d!101541 m!713495))

(assert (=> b!767524 m!713789))

(assert (=> b!767521 m!713789))

(assert (=> b!767092 d!101541))

(declare-fun d!101545 () Bool)

(declare-fun lt!341401 () (_ BitVec 32))

(declare-fun lt!341400 () (_ BitVec 32))

(assert (=> d!101545 (= lt!341401 (bvmul (bvxor lt!341400 (bvlshr lt!341400 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101545 (= lt!341400 ((_ extract 31 0) (bvand (bvxor lt!341216 (bvlshr lt!341216 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101545 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519024 (let ((h!15238 ((_ extract 31 0) (bvand (bvxor lt!341216 (bvlshr lt!341216 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64602 (bvmul (bvxor h!15238 (bvlshr h!15238 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64602 (bvlshr x!64602 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519024 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519024 #b00000000000000000000000000000000))))))

(assert (=> d!101545 (= (toIndex!0 lt!341216 mask!3328) (bvand (bvxor lt!341401 (bvlshr lt!341401 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767092 d!101545))

(declare-fun d!101547 () Bool)

(assert (=> d!101547 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66608 d!101547))

(declare-fun d!101567 () Bool)

(assert (=> d!101567 (= (array_inv!16092 a!3186) (bvsge (size!20653 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66608 d!101567))

(check-sat (not d!101517) (not d!101539) (not b!767267) (not d!101475) (not d!101497) (not b!767250) (not b!767241) (not d!101471) (not b!767337) (not bm!35074) (not bm!35070) (not b!767336) (not b!767507) (not b!767479) (not b!767452) (not d!101473) (not d!101541) (not bm!35073) (not b!767278) (not b!767471) (not b!767279) (not b!767264) (not b!767332) (not d!101513) (not d!101521) (not d!101499) (not d!101489) (not b!767514) (not b!767263) (not b!767446) (not b!767527))
(check-sat)
