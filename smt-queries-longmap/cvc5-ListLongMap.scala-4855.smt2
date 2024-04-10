; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66828 () Bool)

(assert start!66828)

(declare-fun b!771236 () Bool)

(declare-fun e!429355 () Bool)

(declare-fun e!429356 () Bool)

(assert (=> b!771236 (= e!429355 e!429356)))

(declare-fun res!521796 () Bool)

(assert (=> b!771236 (=> (not res!521796) (not e!429356))))

(declare-datatypes ((SeekEntryResult!7895 0))(
  ( (MissingZero!7895 (index!33948 (_ BitVec 32))) (Found!7895 (index!33949 (_ BitVec 32))) (Intermediate!7895 (undefined!8707 Bool) (index!33950 (_ BitVec 32)) (x!64874 (_ BitVec 32))) (Undefined!7895) (MissingVacant!7895 (index!33951 (_ BitVec 32))) )
))
(declare-fun lt!343334 () SeekEntryResult!7895)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771236 (= res!521796 (or (= lt!343334 (MissingZero!7895 i!1173)) (= lt!343334 (MissingVacant!7895 i!1173))))))

(declare-datatypes ((array!42390 0))(
  ( (array!42391 (arr!20295 (Array (_ BitVec 32) (_ BitVec 64))) (size!20716 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42390)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42390 (_ BitVec 32)) SeekEntryResult!7895)

(assert (=> b!771236 (= lt!343334 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!771237 () Bool)

(declare-fun res!521799 () Bool)

(assert (=> b!771237 (=> (not res!521799) (not e!429356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42390 (_ BitVec 32)) Bool)

(assert (=> b!771237 (= res!521799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771238 () Bool)

(declare-fun res!521791 () Bool)

(assert (=> b!771238 (=> (not res!521791) (not e!429356))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!771238 (= res!521791 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20716 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20716 a!3186))))))

(declare-fun b!771239 () Bool)

(declare-datatypes ((Unit!26594 0))(
  ( (Unit!26595) )
))
(declare-fun e!429358 () Unit!26594)

(declare-fun Unit!26596 () Unit!26594)

(assert (=> b!771239 (= e!429358 Unit!26596)))

(declare-fun lt!343336 () SeekEntryResult!7895)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42390 (_ BitVec 32)) SeekEntryResult!7895)

(assert (=> b!771239 (= lt!343336 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20295 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343333 () (_ BitVec 32))

(assert (=> b!771239 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343333 resIntermediateIndex!5 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) (Found!7895 j!159))))

(declare-fun b!771241 () Bool)

(declare-fun res!521790 () Bool)

(assert (=> b!771241 (=> (not res!521790) (not e!429356))))

(declare-datatypes ((List!14297 0))(
  ( (Nil!14294) (Cons!14293 (h!15392 (_ BitVec 64)) (t!20612 List!14297)) )
))
(declare-fun arrayNoDuplicates!0 (array!42390 (_ BitVec 32) List!14297) Bool)

(assert (=> b!771241 (= res!521790 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14294))))

(declare-fun b!771242 () Bool)

(declare-fun e!429357 () Bool)

(assert (=> b!771242 (= e!429357 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343338 () Unit!26594)

(assert (=> b!771242 (= lt!343338 e!429358)))

(declare-fun c!85120 () Bool)

(assert (=> b!771242 (= c!85120 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771242 (= lt!343333 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!771243 () Bool)

(declare-fun res!521803 () Bool)

(declare-fun e!429359 () Bool)

(assert (=> b!771243 (=> (not res!521803) (not e!429359))))

(declare-fun e!429353 () Bool)

(assert (=> b!771243 (= res!521803 e!429353)))

(declare-fun c!85119 () Bool)

(assert (=> b!771243 (= c!85119 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771244 () Bool)

(declare-fun res!521795 () Bool)

(assert (=> b!771244 (=> (not res!521795) (not e!429355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771244 (= res!521795 (validKeyInArray!0 k!2102))))

(declare-fun b!771245 () Bool)

(declare-fun e!429354 () Bool)

(declare-fun e!429351 () Bool)

(assert (=> b!771245 (= e!429354 e!429351)))

(declare-fun res!521792 () Bool)

(assert (=> b!771245 (=> (not res!521792) (not e!429351))))

(declare-fun lt!343335 () SeekEntryResult!7895)

(assert (=> b!771245 (= res!521792 (= (seekEntryOrOpen!0 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343335))))

(assert (=> b!771245 (= lt!343335 (Found!7895 j!159))))

(declare-fun b!771246 () Bool)

(declare-fun res!521794 () Bool)

(assert (=> b!771246 (=> (not res!521794) (not e!429355))))

(declare-fun arrayContainsKey!0 (array!42390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771246 (= res!521794 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771247 () Bool)

(declare-fun res!521789 () Bool)

(assert (=> b!771247 (=> (not res!521789) (not e!429355))))

(assert (=> b!771247 (= res!521789 (and (= (size!20716 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20716 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20716 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!521798 () Bool)

(assert (=> start!66828 (=> (not res!521798) (not e!429355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66828 (= res!521798 (validMask!0 mask!3328))))

(assert (=> start!66828 e!429355))

(assert (=> start!66828 true))

(declare-fun array_inv!16091 (array!42390) Bool)

(assert (=> start!66828 (array_inv!16091 a!3186)))

(declare-fun b!771240 () Bool)

(assert (=> b!771240 (= e!429351 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343335))))

(declare-fun b!771248 () Bool)

(declare-fun e!429352 () Bool)

(assert (=> b!771248 (= e!429352 (not e!429357))))

(declare-fun res!521802 () Bool)

(assert (=> b!771248 (=> res!521802 e!429357)))

(declare-fun lt!343339 () SeekEntryResult!7895)

(assert (=> b!771248 (= res!521802 (or (not (is-Intermediate!7895 lt!343339)) (bvsge x!1131 (x!64874 lt!343339))))))

(assert (=> b!771248 e!429354))

(declare-fun res!521800 () Bool)

(assert (=> b!771248 (=> (not res!521800) (not e!429354))))

(assert (=> b!771248 (= res!521800 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343337 () Unit!26594)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26594)

(assert (=> b!771248 (= lt!343337 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771249 () Bool)

(declare-fun Unit!26597 () Unit!26594)

(assert (=> b!771249 (= e!429358 Unit!26597)))

(declare-fun lt!343340 () SeekEntryResult!7895)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42390 (_ BitVec 32)) SeekEntryResult!7895)

(assert (=> b!771249 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343333 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343340)))

(declare-fun b!771250 () Bool)

(assert (=> b!771250 (= e!429353 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) (Found!7895 j!159)))))

(declare-fun b!771251 () Bool)

(assert (=> b!771251 (= e!429356 e!429359)))

(declare-fun res!521801 () Bool)

(assert (=> b!771251 (=> (not res!521801) (not e!429359))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771251 (= res!521801 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20295 a!3186) j!159) mask!3328) (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343340))))

(assert (=> b!771251 (= lt!343340 (Intermediate!7895 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771252 () Bool)

(assert (=> b!771252 (= e!429353 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343340))))

(declare-fun b!771253 () Bool)

(declare-fun res!521793 () Bool)

(assert (=> b!771253 (=> (not res!521793) (not e!429359))))

(assert (=> b!771253 (= res!521793 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20295 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771254 () Bool)

(declare-fun res!521797 () Bool)

(assert (=> b!771254 (=> (not res!521797) (not e!429355))))

(assert (=> b!771254 (= res!521797 (validKeyInArray!0 (select (arr!20295 a!3186) j!159)))))

(declare-fun b!771255 () Bool)

(assert (=> b!771255 (= e!429359 e!429352)))

(declare-fun res!521804 () Bool)

(assert (=> b!771255 (=> (not res!521804) (not e!429352))))

(declare-fun lt!343341 () SeekEntryResult!7895)

(assert (=> b!771255 (= res!521804 (= lt!343341 lt!343339))))

(declare-fun lt!343342 () array!42390)

(declare-fun lt!343343 () (_ BitVec 64))

(assert (=> b!771255 (= lt!343339 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343343 lt!343342 mask!3328))))

(assert (=> b!771255 (= lt!343341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343343 mask!3328) lt!343343 lt!343342 mask!3328))))

(assert (=> b!771255 (= lt!343343 (select (store (arr!20295 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!771255 (= lt!343342 (array!42391 (store (arr!20295 a!3186) i!1173 k!2102) (size!20716 a!3186)))))

(assert (= (and start!66828 res!521798) b!771247))

(assert (= (and b!771247 res!521789) b!771254))

(assert (= (and b!771254 res!521797) b!771244))

(assert (= (and b!771244 res!521795) b!771246))

(assert (= (and b!771246 res!521794) b!771236))

(assert (= (and b!771236 res!521796) b!771237))

(assert (= (and b!771237 res!521799) b!771241))

(assert (= (and b!771241 res!521790) b!771238))

(assert (= (and b!771238 res!521791) b!771251))

(assert (= (and b!771251 res!521801) b!771253))

(assert (= (and b!771253 res!521793) b!771243))

(assert (= (and b!771243 c!85119) b!771252))

(assert (= (and b!771243 (not c!85119)) b!771250))

(assert (= (and b!771243 res!521803) b!771255))

(assert (= (and b!771255 res!521804) b!771248))

(assert (= (and b!771248 res!521800) b!771245))

(assert (= (and b!771245 res!521792) b!771240))

(assert (= (and b!771248 (not res!521802)) b!771242))

(assert (= (and b!771242 c!85120) b!771249))

(assert (= (and b!771242 (not c!85120)) b!771239))

(declare-fun m!716411 () Bool)

(assert (=> b!771246 m!716411))

(declare-fun m!716413 () Bool)

(assert (=> b!771242 m!716413))

(declare-fun m!716415 () Bool)

(assert (=> start!66828 m!716415))

(declare-fun m!716417 () Bool)

(assert (=> start!66828 m!716417))

(declare-fun m!716419 () Bool)

(assert (=> b!771249 m!716419))

(assert (=> b!771249 m!716419))

(declare-fun m!716421 () Bool)

(assert (=> b!771249 m!716421))

(declare-fun m!716423 () Bool)

(assert (=> b!771253 m!716423))

(assert (=> b!771245 m!716419))

(assert (=> b!771245 m!716419))

(declare-fun m!716425 () Bool)

(assert (=> b!771245 m!716425))

(declare-fun m!716427 () Bool)

(assert (=> b!771236 m!716427))

(assert (=> b!771252 m!716419))

(assert (=> b!771252 m!716419))

(declare-fun m!716429 () Bool)

(assert (=> b!771252 m!716429))

(assert (=> b!771251 m!716419))

(assert (=> b!771251 m!716419))

(declare-fun m!716431 () Bool)

(assert (=> b!771251 m!716431))

(assert (=> b!771251 m!716431))

(assert (=> b!771251 m!716419))

(declare-fun m!716433 () Bool)

(assert (=> b!771251 m!716433))

(assert (=> b!771254 m!716419))

(assert (=> b!771254 m!716419))

(declare-fun m!716435 () Bool)

(assert (=> b!771254 m!716435))

(declare-fun m!716437 () Bool)

(assert (=> b!771237 m!716437))

(declare-fun m!716439 () Bool)

(assert (=> b!771244 m!716439))

(declare-fun m!716441 () Bool)

(assert (=> b!771241 m!716441))

(declare-fun m!716443 () Bool)

(assert (=> b!771248 m!716443))

(declare-fun m!716445 () Bool)

(assert (=> b!771248 m!716445))

(assert (=> b!771239 m!716419))

(assert (=> b!771239 m!716419))

(declare-fun m!716447 () Bool)

(assert (=> b!771239 m!716447))

(assert (=> b!771239 m!716419))

(declare-fun m!716449 () Bool)

(assert (=> b!771239 m!716449))

(assert (=> b!771250 m!716419))

(assert (=> b!771250 m!716419))

(assert (=> b!771250 m!716447))

(declare-fun m!716451 () Bool)

(assert (=> b!771255 m!716451))

(declare-fun m!716453 () Bool)

(assert (=> b!771255 m!716453))

(declare-fun m!716455 () Bool)

(assert (=> b!771255 m!716455))

(declare-fun m!716457 () Bool)

(assert (=> b!771255 m!716457))

(assert (=> b!771255 m!716457))

(declare-fun m!716459 () Bool)

(assert (=> b!771255 m!716459))

(assert (=> b!771240 m!716419))

(assert (=> b!771240 m!716419))

(declare-fun m!716461 () Bool)

(assert (=> b!771240 m!716461))

(push 1)

(assert (not b!771236))

(assert (not b!771244))

(assert (not b!771241))

(assert (not b!771242))

(assert (not b!771255))

(assert (not b!771252))

(assert (not b!771248))

(assert (not b!771251))

(assert (not b!771250))

(assert (not b!771240))

(assert (not b!771254))

(assert (not start!66828))

(assert (not b!771245))

(assert (not b!771239))

(assert (not b!771237))

(assert (not b!771249))

(assert (not b!771246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101695 () Bool)

(assert (=> d!101695 (= (validKeyInArray!0 (select (arr!20295 a!3186) j!159)) (and (not (= (select (arr!20295 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20295 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!771254 d!101695))

(declare-fun b!771422 () Bool)

(declare-fun e!429450 () Bool)

(declare-fun e!429448 () Bool)

(assert (=> b!771422 (= e!429450 e!429448)))

(declare-fun res!521922 () Bool)

(assert (=> b!771422 (=> (not res!521922) (not e!429448))))

(declare-fun e!429449 () Bool)

(assert (=> b!771422 (= res!521922 (not e!429449))))

(declare-fun res!521920 () Bool)

(assert (=> b!771422 (=> (not res!521920) (not e!429449))))

(assert (=> b!771422 (= res!521920 (validKeyInArray!0 (select (arr!20295 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101697 () Bool)

(declare-fun res!521921 () Bool)

(assert (=> d!101697 (=> res!521921 e!429450)))

(assert (=> d!101697 (= res!521921 (bvsge #b00000000000000000000000000000000 (size!20716 a!3186)))))

(assert (=> d!101697 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14294) e!429450)))

(declare-fun b!771423 () Bool)

(declare-fun e!429451 () Bool)

(declare-fun call!35112 () Bool)

(assert (=> b!771423 (= e!429451 call!35112)))

(declare-fun b!771424 () Bool)

(assert (=> b!771424 (= e!429451 call!35112)))

(declare-fun b!771425 () Bool)

(assert (=> b!771425 (= e!429448 e!429451)))

(declare-fun c!85147 () Bool)

(assert (=> b!771425 (= c!85147 (validKeyInArray!0 (select (arr!20295 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35109 () Bool)

(assert (=> bm!35109 (= call!35112 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85147 (Cons!14293 (select (arr!20295 a!3186) #b00000000000000000000000000000000) Nil!14294) Nil!14294)))))

(declare-fun b!771426 () Bool)

(declare-fun contains!4089 (List!14297 (_ BitVec 64)) Bool)

(assert (=> b!771426 (= e!429449 (contains!4089 Nil!14294 (select (arr!20295 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101697 (not res!521921)) b!771422))

(assert (= (and b!771422 res!521920) b!771426))

(assert (= (and b!771422 res!521922) b!771425))

(assert (= (and b!771425 c!85147) b!771424))

(assert (= (and b!771425 (not c!85147)) b!771423))

(assert (= (or b!771424 b!771423) bm!35109))

(declare-fun m!716581 () Bool)

(assert (=> b!771422 m!716581))

(assert (=> b!771422 m!716581))

(declare-fun m!716583 () Bool)

(assert (=> b!771422 m!716583))

(assert (=> b!771425 m!716581))

(assert (=> b!771425 m!716581))

(assert (=> b!771425 m!716583))

(assert (=> bm!35109 m!716581))

(declare-fun m!716585 () Bool)

(assert (=> bm!35109 m!716585))

(assert (=> b!771426 m!716581))

(assert (=> b!771426 m!716581))

(declare-fun m!716587 () Bool)

(assert (=> b!771426 m!716587))

(assert (=> b!771241 d!101697))

(declare-fun b!771490 () Bool)

(declare-fun e!429488 () SeekEntryResult!7895)

(assert (=> b!771490 (= e!429488 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20295 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771491 () Bool)

(declare-fun lt!343445 () SeekEntryResult!7895)

(assert (=> b!771491 (and (bvsge (index!33950 lt!343445) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343445) (size!20716 a!3186)))))

(declare-fun res!521940 () Bool)

(assert (=> b!771491 (= res!521940 (= (select (arr!20295 a!3186) (index!33950 lt!343445)) (select (arr!20295 a!3186) j!159)))))

(declare-fun e!429487 () Bool)

(assert (=> b!771491 (=> res!521940 e!429487)))

(declare-fun e!429490 () Bool)

(assert (=> b!771491 (= e!429490 e!429487)))

(declare-fun d!101705 () Bool)

(declare-fun e!429486 () Bool)

(assert (=> d!101705 e!429486))

(declare-fun c!85174 () Bool)

(assert (=> d!101705 (= c!85174 (and (is-Intermediate!7895 lt!343445) (undefined!8707 lt!343445)))))

(declare-fun e!429489 () SeekEntryResult!7895)

(assert (=> d!101705 (= lt!343445 e!429489)))

(declare-fun c!85173 () Bool)

(assert (=> d!101705 (= c!85173 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343446 () (_ BitVec 64))

(assert (=> d!101705 (= lt!343446 (select (arr!20295 a!3186) index!1321))))

(assert (=> d!101705 (validMask!0 mask!3328)))

(assert (=> d!101705 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343445)))

(declare-fun b!771492 () Bool)

(assert (=> b!771492 (and (bvsge (index!33950 lt!343445) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343445) (size!20716 a!3186)))))

(assert (=> b!771492 (= e!429487 (= (select (arr!20295 a!3186) (index!33950 lt!343445)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771493 () Bool)

(assert (=> b!771493 (and (bvsge (index!33950 lt!343445) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343445) (size!20716 a!3186)))))

(declare-fun res!521938 () Bool)

(assert (=> b!771493 (= res!521938 (= (select (arr!20295 a!3186) (index!33950 lt!343445)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771493 (=> res!521938 e!429487)))

(declare-fun b!771494 () Bool)

(assert (=> b!771494 (= e!429489 e!429488)))

(declare-fun c!85172 () Bool)

(assert (=> b!771494 (= c!85172 (or (= lt!343446 (select (arr!20295 a!3186) j!159)) (= (bvadd lt!343446 lt!343446) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771495 () Bool)

(assert (=> b!771495 (= e!429488 (Intermediate!7895 false index!1321 x!1131))))

(declare-fun b!771496 () Bool)

(assert (=> b!771496 (= e!429486 e!429490)))

(declare-fun res!521939 () Bool)

(assert (=> b!771496 (= res!521939 (and (is-Intermediate!7895 lt!343445) (not (undefined!8707 lt!343445)) (bvslt (x!64874 lt!343445) #b01111111111111111111111111111110) (bvsge (x!64874 lt!343445) #b00000000000000000000000000000000) (bvsge (x!64874 lt!343445) x!1131)))))

(assert (=> b!771496 (=> (not res!521939) (not e!429490))))

(declare-fun b!771497 () Bool)

(assert (=> b!771497 (= e!429489 (Intermediate!7895 true index!1321 x!1131))))

(declare-fun b!771498 () Bool)

(assert (=> b!771498 (= e!429486 (bvsge (x!64874 lt!343445) #b01111111111111111111111111111110))))

(assert (= (and d!101705 c!85173) b!771497))

(assert (= (and d!101705 (not c!85173)) b!771494))

(assert (= (and b!771494 c!85172) b!771495))

(assert (= (and b!771494 (not c!85172)) b!771490))

(assert (= (and d!101705 c!85174) b!771498))

(assert (= (and d!101705 (not c!85174)) b!771496))

(assert (= (and b!771496 res!521939) b!771491))

(assert (= (and b!771491 (not res!521940)) b!771493))

(assert (= (and b!771493 (not res!521938)) b!771492))

(declare-fun m!716625 () Bool)

(assert (=> b!771493 m!716625))

(declare-fun m!716627 () Bool)

(assert (=> d!101705 m!716627))

(assert (=> d!101705 m!716415))

(assert (=> b!771491 m!716625))

(assert (=> b!771492 m!716625))

(assert (=> b!771490 m!716413))

(assert (=> b!771490 m!716413))

(assert (=> b!771490 m!716419))

(declare-fun m!716629 () Bool)

(assert (=> b!771490 m!716629))

(assert (=> b!771252 d!101705))

(declare-fun d!101721 () Bool)

(declare-fun lt!343449 () (_ BitVec 32))

(assert (=> d!101721 (and (bvsge lt!343449 #b00000000000000000000000000000000) (bvslt lt!343449 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101721 (= lt!343449 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101721 (validMask!0 mask!3328)))

(assert (=> d!101721 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!343449)))

(declare-fun bs!21589 () Bool)

(assert (= bs!21589 d!101721))

(declare-fun m!716631 () Bool)

(assert (=> bs!21589 m!716631))

(assert (=> bs!21589 m!716415))

(assert (=> b!771242 d!101721))

(declare-fun b!771571 () Bool)

(declare-fun e!429527 () SeekEntryResult!7895)

(declare-fun lt!343476 () SeekEntryResult!7895)

(assert (=> b!771571 (= e!429527 (Found!7895 (index!33950 lt!343476)))))

(declare-fun b!771572 () Bool)

(declare-fun e!429529 () SeekEntryResult!7895)

(assert (=> b!771572 (= e!429529 Undefined!7895)))

(declare-fun b!771573 () Bool)

(declare-fun c!85212 () Bool)

(declare-fun lt!343477 () (_ BitVec 64))

(assert (=> b!771573 (= c!85212 (= lt!343477 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429528 () SeekEntryResult!7895)

(assert (=> b!771573 (= e!429527 e!429528)))

(declare-fun b!771574 () Bool)

(assert (=> b!771574 (= e!429528 (seekKeyOrZeroReturnVacant!0 (x!64874 lt!343476) (index!33950 lt!343476) (index!33950 lt!343476) (select (arr!20295 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771575 () Bool)

(assert (=> b!771575 (= e!429528 (MissingZero!7895 (index!33950 lt!343476)))))

(declare-fun b!771576 () Bool)

(assert (=> b!771576 (= e!429529 e!429527)))

(assert (=> b!771576 (= lt!343477 (select (arr!20295 a!3186) (index!33950 lt!343476)))))

(declare-fun c!85211 () Bool)

(assert (=> b!771576 (= c!85211 (= lt!343477 (select (arr!20295 a!3186) j!159)))))

(declare-fun d!101723 () Bool)

(declare-fun lt!343478 () SeekEntryResult!7895)

(assert (=> d!101723 (and (or (is-Undefined!7895 lt!343478) (not (is-Found!7895 lt!343478)) (and (bvsge (index!33949 lt!343478) #b00000000000000000000000000000000) (bvslt (index!33949 lt!343478) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343478) (is-Found!7895 lt!343478) (not (is-MissingZero!7895 lt!343478)) (and (bvsge (index!33948 lt!343478) #b00000000000000000000000000000000) (bvslt (index!33948 lt!343478) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343478) (is-Found!7895 lt!343478) (is-MissingZero!7895 lt!343478) (not (is-MissingVacant!7895 lt!343478)) (and (bvsge (index!33951 lt!343478) #b00000000000000000000000000000000) (bvslt (index!33951 lt!343478) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343478) (ite (is-Found!7895 lt!343478) (= (select (arr!20295 a!3186) (index!33949 lt!343478)) (select (arr!20295 a!3186) j!159)) (ite (is-MissingZero!7895 lt!343478) (= (select (arr!20295 a!3186) (index!33948 lt!343478)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7895 lt!343478) (= (select (arr!20295 a!3186) (index!33951 lt!343478)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101723 (= lt!343478 e!429529)))

(declare-fun c!85213 () Bool)

(assert (=> d!101723 (= c!85213 (and (is-Intermediate!7895 lt!343476) (undefined!8707 lt!343476)))))

(assert (=> d!101723 (= lt!343476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20295 a!3186) j!159) mask!3328) (select (arr!20295 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101723 (validMask!0 mask!3328)))

(assert (=> d!101723 (= (seekEntryOrOpen!0 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343478)))

(assert (= (and d!101723 c!85213) b!771572))

(assert (= (and d!101723 (not c!85213)) b!771576))

(assert (= (and b!771576 c!85211) b!771571))

(assert (= (and b!771576 (not c!85211)) b!771573))

(assert (= (and b!771573 c!85212) b!771575))

(assert (= (and b!771573 (not c!85212)) b!771574))

(assert (=> b!771574 m!716419))

(declare-fun m!716679 () Bool)

(assert (=> b!771574 m!716679))

(declare-fun m!716681 () Bool)

(assert (=> b!771576 m!716681))

(assert (=> d!101723 m!716415))

(declare-fun m!716683 () Bool)

(assert (=> d!101723 m!716683))

(assert (=> d!101723 m!716419))

(assert (=> d!101723 m!716431))

(declare-fun m!716685 () Bool)

(assert (=> d!101723 m!716685))

(assert (=> d!101723 m!716431))

(assert (=> d!101723 m!716419))

(assert (=> d!101723 m!716433))

(declare-fun m!716687 () Bool)

(assert (=> d!101723 m!716687))

(assert (=> b!771245 d!101723))

(declare-fun d!101743 () Bool)

(declare-fun res!521949 () Bool)

(declare-fun e!429540 () Bool)

(assert (=> d!101743 (=> res!521949 e!429540)))

(assert (=> d!101743 (= res!521949 (= (select (arr!20295 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101743 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!429540)))

(declare-fun b!771589 () Bool)

(declare-fun e!429541 () Bool)

(assert (=> b!771589 (= e!429540 e!429541)))

(declare-fun res!521950 () Bool)

(assert (=> b!771589 (=> (not res!521950) (not e!429541))))

(assert (=> b!771589 (= res!521950 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20716 a!3186)))))

(declare-fun b!771590 () Bool)

(assert (=> b!771590 (= e!429541 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101743 (not res!521949)) b!771589))

(assert (= (and b!771589 res!521950) b!771590))

(assert (=> d!101743 m!716581))

(declare-fun m!716691 () Bool)

(assert (=> b!771590 m!716691))

(assert (=> b!771246 d!101743))

(declare-fun d!101747 () Bool)

(assert (=> d!101747 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!771244 d!101747))

(declare-fun e!429547 () SeekEntryResult!7895)

(declare-fun b!771595 () Bool)

(assert (=> b!771595 (= e!429547 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!343343 lt!343342 mask!3328))))

(declare-fun b!771596 () Bool)

(declare-fun lt!343491 () SeekEntryResult!7895)

(assert (=> b!771596 (and (bvsge (index!33950 lt!343491) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343491) (size!20716 lt!343342)))))

(declare-fun res!521955 () Bool)

(assert (=> b!771596 (= res!521955 (= (select (arr!20295 lt!343342) (index!33950 lt!343491)) lt!343343))))

(declare-fun e!429546 () Bool)

(assert (=> b!771596 (=> res!521955 e!429546)))

(declare-fun e!429549 () Bool)

(assert (=> b!771596 (= e!429549 e!429546)))

(declare-fun d!101749 () Bool)

(declare-fun e!429545 () Bool)

(assert (=> d!101749 e!429545))

(declare-fun c!85219 () Bool)

(assert (=> d!101749 (= c!85219 (and (is-Intermediate!7895 lt!343491) (undefined!8707 lt!343491)))))

(declare-fun e!429548 () SeekEntryResult!7895)

(assert (=> d!101749 (= lt!343491 e!429548)))

(declare-fun c!85218 () Bool)

(assert (=> d!101749 (= c!85218 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343492 () (_ BitVec 64))

(assert (=> d!101749 (= lt!343492 (select (arr!20295 lt!343342) index!1321))))

(assert (=> d!101749 (validMask!0 mask!3328)))

(assert (=> d!101749 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343343 lt!343342 mask!3328) lt!343491)))

(declare-fun b!771597 () Bool)

(assert (=> b!771597 (and (bvsge (index!33950 lt!343491) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343491) (size!20716 lt!343342)))))

(assert (=> b!771597 (= e!429546 (= (select (arr!20295 lt!343342) (index!33950 lt!343491)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771598 () Bool)

(assert (=> b!771598 (and (bvsge (index!33950 lt!343491) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343491) (size!20716 lt!343342)))))

(declare-fun res!521953 () Bool)

(assert (=> b!771598 (= res!521953 (= (select (arr!20295 lt!343342) (index!33950 lt!343491)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771598 (=> res!521953 e!429546)))

(declare-fun b!771599 () Bool)

(assert (=> b!771599 (= e!429548 e!429547)))

(declare-fun c!85217 () Bool)

(assert (=> b!771599 (= c!85217 (or (= lt!343492 lt!343343) (= (bvadd lt!343492 lt!343492) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771600 () Bool)

(assert (=> b!771600 (= e!429547 (Intermediate!7895 false index!1321 x!1131))))

(declare-fun b!771601 () Bool)

(assert (=> b!771601 (= e!429545 e!429549)))

(declare-fun res!521954 () Bool)

(assert (=> b!771601 (= res!521954 (and (is-Intermediate!7895 lt!343491) (not (undefined!8707 lt!343491)) (bvslt (x!64874 lt!343491) #b01111111111111111111111111111110) (bvsge (x!64874 lt!343491) #b00000000000000000000000000000000) (bvsge (x!64874 lt!343491) x!1131)))))

(assert (=> b!771601 (=> (not res!521954) (not e!429549))))

(declare-fun b!771602 () Bool)

(assert (=> b!771602 (= e!429548 (Intermediate!7895 true index!1321 x!1131))))

(declare-fun b!771603 () Bool)

(assert (=> b!771603 (= e!429545 (bvsge (x!64874 lt!343491) #b01111111111111111111111111111110))))

(assert (= (and d!101749 c!85218) b!771602))

(assert (= (and d!101749 (not c!85218)) b!771599))

(assert (= (and b!771599 c!85217) b!771600))

(assert (= (and b!771599 (not c!85217)) b!771595))

(assert (= (and d!101749 c!85219) b!771603))

(assert (= (and d!101749 (not c!85219)) b!771601))

(assert (= (and b!771601 res!521954) b!771596))

(assert (= (and b!771596 (not res!521955)) b!771598))

(assert (= (and b!771598 (not res!521953)) b!771597))

(declare-fun m!716705 () Bool)

(assert (=> b!771598 m!716705))

(declare-fun m!716707 () Bool)

(assert (=> d!101749 m!716707))

(assert (=> d!101749 m!716415))

(assert (=> b!771596 m!716705))

(assert (=> b!771597 m!716705))

(assert (=> b!771595 m!716413))

(assert (=> b!771595 m!716413))

(declare-fun m!716709 () Bool)

(assert (=> b!771595 m!716709))

(assert (=> b!771255 d!101749))

(declare-fun e!429552 () SeekEntryResult!7895)

(declare-fun b!771604 () Bool)

(assert (=> b!771604 (= e!429552 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!343343 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!343343 lt!343342 mask!3328))))

(declare-fun b!771605 () Bool)

(declare-fun lt!343493 () SeekEntryResult!7895)

(assert (=> b!771605 (and (bvsge (index!33950 lt!343493) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343493) (size!20716 lt!343342)))))

(declare-fun res!521958 () Bool)

(assert (=> b!771605 (= res!521958 (= (select (arr!20295 lt!343342) (index!33950 lt!343493)) lt!343343))))

(declare-fun e!429551 () Bool)

(assert (=> b!771605 (=> res!521958 e!429551)))

(declare-fun e!429554 () Bool)

(assert (=> b!771605 (= e!429554 e!429551)))

(declare-fun d!101753 () Bool)

(declare-fun e!429550 () Bool)

(assert (=> d!101753 e!429550))

(declare-fun c!85222 () Bool)

(assert (=> d!101753 (= c!85222 (and (is-Intermediate!7895 lt!343493) (undefined!8707 lt!343493)))))

(declare-fun e!429553 () SeekEntryResult!7895)

(assert (=> d!101753 (= lt!343493 e!429553)))

(declare-fun c!85221 () Bool)

(assert (=> d!101753 (= c!85221 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!343494 () (_ BitVec 64))

(assert (=> d!101753 (= lt!343494 (select (arr!20295 lt!343342) (toIndex!0 lt!343343 mask!3328)))))

(assert (=> d!101753 (validMask!0 mask!3328)))

(assert (=> d!101753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343343 mask!3328) lt!343343 lt!343342 mask!3328) lt!343493)))

(declare-fun b!771606 () Bool)

(assert (=> b!771606 (and (bvsge (index!33950 lt!343493) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343493) (size!20716 lt!343342)))))

(assert (=> b!771606 (= e!429551 (= (select (arr!20295 lt!343342) (index!33950 lt!343493)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771607 () Bool)

(assert (=> b!771607 (and (bvsge (index!33950 lt!343493) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343493) (size!20716 lt!343342)))))

(declare-fun res!521956 () Bool)

(assert (=> b!771607 (= res!521956 (= (select (arr!20295 lt!343342) (index!33950 lt!343493)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771607 (=> res!521956 e!429551)))

(declare-fun b!771608 () Bool)

(assert (=> b!771608 (= e!429553 e!429552)))

(declare-fun c!85220 () Bool)

(assert (=> b!771608 (= c!85220 (or (= lt!343494 lt!343343) (= (bvadd lt!343494 lt!343494) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771609 () Bool)

(assert (=> b!771609 (= e!429552 (Intermediate!7895 false (toIndex!0 lt!343343 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771610 () Bool)

(assert (=> b!771610 (= e!429550 e!429554)))

(declare-fun res!521957 () Bool)

(assert (=> b!771610 (= res!521957 (and (is-Intermediate!7895 lt!343493) (not (undefined!8707 lt!343493)) (bvslt (x!64874 lt!343493) #b01111111111111111111111111111110) (bvsge (x!64874 lt!343493) #b00000000000000000000000000000000) (bvsge (x!64874 lt!343493) #b00000000000000000000000000000000)))))

(assert (=> b!771610 (=> (not res!521957) (not e!429554))))

(declare-fun b!771611 () Bool)

(assert (=> b!771611 (= e!429553 (Intermediate!7895 true (toIndex!0 lt!343343 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771612 () Bool)

(assert (=> b!771612 (= e!429550 (bvsge (x!64874 lt!343493) #b01111111111111111111111111111110))))

(assert (= (and d!101753 c!85221) b!771611))

(assert (= (and d!101753 (not c!85221)) b!771608))

(assert (= (and b!771608 c!85220) b!771609))

(assert (= (and b!771608 (not c!85220)) b!771604))

(assert (= (and d!101753 c!85222) b!771612))

(assert (= (and d!101753 (not c!85222)) b!771610))

(assert (= (and b!771610 res!521957) b!771605))

(assert (= (and b!771605 (not res!521958)) b!771607))

(assert (= (and b!771607 (not res!521956)) b!771606))

(declare-fun m!716711 () Bool)

(assert (=> b!771607 m!716711))

(assert (=> d!101753 m!716457))

(declare-fun m!716713 () Bool)

(assert (=> d!101753 m!716713))

(assert (=> d!101753 m!716415))

(assert (=> b!771605 m!716711))

(assert (=> b!771606 m!716711))

(assert (=> b!771604 m!716457))

(declare-fun m!716715 () Bool)

(assert (=> b!771604 m!716715))

(assert (=> b!771604 m!716715))

(declare-fun m!716717 () Bool)

(assert (=> b!771604 m!716717))

(assert (=> b!771255 d!101753))

(declare-fun d!101755 () Bool)

(declare-fun lt!343500 () (_ BitVec 32))

(declare-fun lt!343499 () (_ BitVec 32))

(assert (=> d!101755 (= lt!343500 (bvmul (bvxor lt!343499 (bvlshr lt!343499 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101755 (= lt!343499 ((_ extract 31 0) (bvand (bvxor lt!343343 (bvlshr lt!343343 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101755 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!521963 (let ((h!15396 ((_ extract 31 0) (bvand (bvxor lt!343343 (bvlshr lt!343343 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64884 (bvmul (bvxor h!15396 (bvlshr h!15396 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64884 (bvlshr x!64884 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!521963 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!521963 #b00000000000000000000000000000000))))))

(assert (=> d!101755 (= (toIndex!0 lt!343343 mask!3328) (bvand (bvxor lt!343500 (bvlshr lt!343500 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!771255 d!101755))

(declare-fun b!771664 () Bool)

(declare-fun e!429594 () Bool)

(declare-fun e!429593 () Bool)

(assert (=> b!771664 (= e!429594 e!429593)))

(declare-fun c!85235 () Bool)

(assert (=> b!771664 (= c!85235 (validKeyInArray!0 (select (arr!20295 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101759 () Bool)

(declare-fun res!521987 () Bool)

(assert (=> d!101759 (=> res!521987 e!429594)))

(assert (=> d!101759 (= res!521987 (bvsge #b00000000000000000000000000000000 (size!20716 a!3186)))))

(assert (=> d!101759 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!429594)))

(declare-fun b!771665 () Bool)

(declare-fun call!35122 () Bool)

(assert (=> b!771665 (= e!429593 call!35122)))

(declare-fun b!771666 () Bool)

(declare-fun e!429592 () Bool)

(assert (=> b!771666 (= e!429593 e!429592)))

(declare-fun lt!343519 () (_ BitVec 64))

(assert (=> b!771666 (= lt!343519 (select (arr!20295 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!343517 () Unit!26594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42390 (_ BitVec 64) (_ BitVec 32)) Unit!26594)

(assert (=> b!771666 (= lt!343517 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343519 #b00000000000000000000000000000000))))

(assert (=> b!771666 (arrayContainsKey!0 a!3186 lt!343519 #b00000000000000000000000000000000)))

(declare-fun lt!343518 () Unit!26594)

(assert (=> b!771666 (= lt!343518 lt!343517)))

(declare-fun res!521988 () Bool)

(assert (=> b!771666 (= res!521988 (= (seekEntryOrOpen!0 (select (arr!20295 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7895 #b00000000000000000000000000000000)))))

(assert (=> b!771666 (=> (not res!521988) (not e!429592))))

(declare-fun bm!35119 () Bool)

(assert (=> bm!35119 (= call!35122 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!771667 () Bool)

(assert (=> b!771667 (= e!429592 call!35122)))

(assert (= (and d!101759 (not res!521987)) b!771664))

(assert (= (and b!771664 c!85235) b!771666))

(assert (= (and b!771664 (not c!85235)) b!771665))

(assert (= (and b!771666 res!521988) b!771667))

(assert (= (or b!771667 b!771665) bm!35119))

(assert (=> b!771664 m!716581))

(assert (=> b!771664 m!716581))

(assert (=> b!771664 m!716583))

(assert (=> b!771666 m!716581))

(declare-fun m!716733 () Bool)

(assert (=> b!771666 m!716733))

(declare-fun m!716735 () Bool)

(assert (=> b!771666 m!716735))

(assert (=> b!771666 m!716581))

(declare-fun m!716737 () Bool)

(assert (=> b!771666 m!716737))

(declare-fun m!716739 () Bool)

(assert (=> bm!35119 m!716739))

(assert (=> b!771237 d!101759))

(declare-fun d!101767 () Bool)

(assert (=> d!101767 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66828 d!101767))

(declare-fun d!101775 () Bool)

(assert (=> d!101775 (= (array_inv!16091 a!3186) (bvsge (size!20716 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66828 d!101775))

(declare-fun b!771677 () Bool)

(declare-fun e!429602 () Bool)

(declare-fun e!429601 () Bool)

(assert (=> b!771677 (= e!429602 e!429601)))

(declare-fun c!85239 () Bool)

(assert (=> b!771677 (= c!85239 (validKeyInArray!0 (select (arr!20295 a!3186) j!159)))))

(declare-fun d!101777 () Bool)

(declare-fun res!521993 () Bool)

(assert (=> d!101777 (=> res!521993 e!429602)))

(assert (=> d!101777 (= res!521993 (bvsge j!159 (size!20716 a!3186)))))

(assert (=> d!101777 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!429602)))

(declare-fun b!771678 () Bool)

(declare-fun call!35123 () Bool)

(assert (=> b!771678 (= e!429601 call!35123)))

(declare-fun b!771679 () Bool)

(declare-fun e!429600 () Bool)

(assert (=> b!771679 (= e!429601 e!429600)))

(declare-fun lt!343533 () (_ BitVec 64))

(assert (=> b!771679 (= lt!343533 (select (arr!20295 a!3186) j!159))))

(declare-fun lt!343531 () Unit!26594)

(assert (=> b!771679 (= lt!343531 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343533 j!159))))

(assert (=> b!771679 (arrayContainsKey!0 a!3186 lt!343533 #b00000000000000000000000000000000)))

(declare-fun lt!343532 () Unit!26594)

(assert (=> b!771679 (= lt!343532 lt!343531)))

(declare-fun res!521994 () Bool)

(assert (=> b!771679 (= res!521994 (= (seekEntryOrOpen!0 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) (Found!7895 j!159)))))

(assert (=> b!771679 (=> (not res!521994) (not e!429600))))

(declare-fun bm!35120 () Bool)

(assert (=> bm!35120 (= call!35123 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!771680 () Bool)

(assert (=> b!771680 (= e!429600 call!35123)))

(assert (= (and d!101777 (not res!521993)) b!771677))

(assert (= (and b!771677 c!85239) b!771679))

(assert (= (and b!771677 (not c!85239)) b!771678))

(assert (= (and b!771679 res!521994) b!771680))

(assert (= (or b!771680 b!771678) bm!35120))

(assert (=> b!771677 m!716419))

(assert (=> b!771677 m!716419))

(assert (=> b!771677 m!716435))

(assert (=> b!771679 m!716419))

(declare-fun m!716751 () Bool)

(assert (=> b!771679 m!716751))

(declare-fun m!716753 () Bool)

(assert (=> b!771679 m!716753))

(assert (=> b!771679 m!716419))

(assert (=> b!771679 m!716425))

(declare-fun m!716755 () Bool)

(assert (=> bm!35120 m!716755))

(assert (=> b!771248 d!101777))

(declare-fun d!101779 () Bool)

(assert (=> d!101779 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!343545 () Unit!26594)

(declare-fun choose!38 (array!42390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26594)

(assert (=> d!101779 (= lt!343545 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101779 (validMask!0 mask!3328)))

(assert (=> d!101779 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!343545)))

(declare-fun bs!21593 () Bool)

(assert (= bs!21593 d!101779))

(assert (=> bs!21593 m!716443))

(declare-fun m!716767 () Bool)

(assert (=> bs!21593 m!716767))

(assert (=> bs!21593 m!716415))

(assert (=> b!771248 d!101779))

(declare-fun b!771695 () Bool)

(declare-fun e!429612 () SeekEntryResult!7895)

(declare-fun lt!343546 () SeekEntryResult!7895)

(assert (=> b!771695 (= e!429612 (Found!7895 (index!33950 lt!343546)))))

(declare-fun b!771696 () Bool)

(declare-fun e!429614 () SeekEntryResult!7895)

(assert (=> b!771696 (= e!429614 Undefined!7895)))

(declare-fun b!771697 () Bool)

(declare-fun c!85246 () Bool)

(declare-fun lt!343547 () (_ BitVec 64))

(assert (=> b!771697 (= c!85246 (= lt!343547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429613 () SeekEntryResult!7895)

(assert (=> b!771697 (= e!429612 e!429613)))

(declare-fun b!771698 () Bool)

(assert (=> b!771698 (= e!429613 (seekKeyOrZeroReturnVacant!0 (x!64874 lt!343546) (index!33950 lt!343546) (index!33950 lt!343546) k!2102 a!3186 mask!3328))))

(declare-fun b!771699 () Bool)

(assert (=> b!771699 (= e!429613 (MissingZero!7895 (index!33950 lt!343546)))))

(declare-fun b!771700 () Bool)

(assert (=> b!771700 (= e!429614 e!429612)))

(assert (=> b!771700 (= lt!343547 (select (arr!20295 a!3186) (index!33950 lt!343546)))))

(declare-fun c!85245 () Bool)

(assert (=> b!771700 (= c!85245 (= lt!343547 k!2102))))

(declare-fun d!101785 () Bool)

(declare-fun lt!343548 () SeekEntryResult!7895)

(assert (=> d!101785 (and (or (is-Undefined!7895 lt!343548) (not (is-Found!7895 lt!343548)) (and (bvsge (index!33949 lt!343548) #b00000000000000000000000000000000) (bvslt (index!33949 lt!343548) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343548) (is-Found!7895 lt!343548) (not (is-MissingZero!7895 lt!343548)) (and (bvsge (index!33948 lt!343548) #b00000000000000000000000000000000) (bvslt (index!33948 lt!343548) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343548) (is-Found!7895 lt!343548) (is-MissingZero!7895 lt!343548) (not (is-MissingVacant!7895 lt!343548)) (and (bvsge (index!33951 lt!343548) #b00000000000000000000000000000000) (bvslt (index!33951 lt!343548) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343548) (ite (is-Found!7895 lt!343548) (= (select (arr!20295 a!3186) (index!33949 lt!343548)) k!2102) (ite (is-MissingZero!7895 lt!343548) (= (select (arr!20295 a!3186) (index!33948 lt!343548)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7895 lt!343548) (= (select (arr!20295 a!3186) (index!33951 lt!343548)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101785 (= lt!343548 e!429614)))

(declare-fun c!85247 () Bool)

(assert (=> d!101785 (= c!85247 (and (is-Intermediate!7895 lt!343546) (undefined!8707 lt!343546)))))

(assert (=> d!101785 (= lt!343546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101785 (validMask!0 mask!3328)))

(assert (=> d!101785 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!343548)))

(assert (= (and d!101785 c!85247) b!771696))

(assert (= (and d!101785 (not c!85247)) b!771700))

(assert (= (and b!771700 c!85245) b!771695))

(assert (= (and b!771700 (not c!85245)) b!771697))

(assert (= (and b!771697 c!85246) b!771699))

(assert (= (and b!771697 (not c!85246)) b!771698))

(declare-fun m!716769 () Bool)

(assert (=> b!771698 m!716769))

(declare-fun m!716771 () Bool)

(assert (=> b!771700 m!716771))

(assert (=> d!101785 m!716415))

(declare-fun m!716773 () Bool)

(assert (=> d!101785 m!716773))

(declare-fun m!716775 () Bool)

(assert (=> d!101785 m!716775))

(declare-fun m!716777 () Bool)

(assert (=> d!101785 m!716777))

(assert (=> d!101785 m!716775))

(declare-fun m!716779 () Bool)

(assert (=> d!101785 m!716779))

(declare-fun m!716781 () Bool)

(assert (=> d!101785 m!716781))

(assert (=> b!771236 d!101785))

(declare-fun b!771754 () Bool)

(declare-fun e!429648 () SeekEntryResult!7895)

(assert (=> b!771754 (= e!429648 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20295 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771755 () Bool)

(declare-fun e!429649 () SeekEntryResult!7895)

(assert (=> b!771755 (= e!429649 (Found!7895 resIntermediateIndex!5))))

(declare-fun b!771756 () Bool)

(declare-fun e!429650 () SeekEntryResult!7895)

(assert (=> b!771756 (= e!429650 Undefined!7895)))

(declare-fun b!771757 () Bool)

(assert (=> b!771757 (= e!429650 e!429649)))

(declare-fun c!85267 () Bool)

(declare-fun lt!343570 () (_ BitVec 64))

(assert (=> b!771757 (= c!85267 (= lt!343570 (select (arr!20295 a!3186) j!159)))))

(declare-fun d!101787 () Bool)

(declare-fun lt!343571 () SeekEntryResult!7895)

(assert (=> d!101787 (and (or (is-Undefined!7895 lt!343571) (not (is-Found!7895 lt!343571)) (and (bvsge (index!33949 lt!343571) #b00000000000000000000000000000000) (bvslt (index!33949 lt!343571) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343571) (is-Found!7895 lt!343571) (not (is-MissingVacant!7895 lt!343571)) (not (= (index!33951 lt!343571) resIntermediateIndex!5)) (and (bvsge (index!33951 lt!343571) #b00000000000000000000000000000000) (bvslt (index!33951 lt!343571) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343571) (ite (is-Found!7895 lt!343571) (= (select (arr!20295 a!3186) (index!33949 lt!343571)) (select (arr!20295 a!3186) j!159)) (and (is-MissingVacant!7895 lt!343571) (= (index!33951 lt!343571) resIntermediateIndex!5) (= (select (arr!20295 a!3186) (index!33951 lt!343571)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101787 (= lt!343571 e!429650)))

(declare-fun c!85265 () Bool)

(assert (=> d!101787 (= c!85265 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101787 (= lt!343570 (select (arr!20295 a!3186) resIntermediateIndex!5))))

(assert (=> d!101787 (validMask!0 mask!3328)))

(assert (=> d!101787 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343571)))

(declare-fun b!771758 () Bool)

(assert (=> b!771758 (= e!429648 (MissingVacant!7895 resIntermediateIndex!5))))

(declare-fun b!771759 () Bool)

(declare-fun c!85266 () Bool)

(assert (=> b!771759 (= c!85266 (= lt!343570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771759 (= e!429649 e!429648)))

(assert (= (and d!101787 c!85265) b!771756))

(assert (= (and d!101787 (not c!85265)) b!771757))

(assert (= (and b!771757 c!85267) b!771755))

(assert (= (and b!771757 (not c!85267)) b!771759))

(assert (= (and b!771759 c!85266) b!771758))

(assert (= (and b!771759 (not c!85266)) b!771754))

(declare-fun m!716823 () Bool)

(assert (=> b!771754 m!716823))

(assert (=> b!771754 m!716823))

(assert (=> b!771754 m!716419))

(declare-fun m!716825 () Bool)

(assert (=> b!771754 m!716825))

(declare-fun m!716827 () Bool)

(assert (=> d!101787 m!716827))

(declare-fun m!716829 () Bool)

(assert (=> d!101787 m!716829))

(assert (=> d!101787 m!716423))

(assert (=> d!101787 m!716415))

(assert (=> b!771240 d!101787))

(declare-fun b!771760 () Bool)

(declare-fun e!429653 () SeekEntryResult!7895)

(assert (=> b!771760 (= e!429653 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20295 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20295 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771761 () Bool)

(declare-fun lt!343572 () SeekEntryResult!7895)

(assert (=> b!771761 (and (bvsge (index!33950 lt!343572) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343572) (size!20716 a!3186)))))

(declare-fun res!522020 () Bool)

(assert (=> b!771761 (= res!522020 (= (select (arr!20295 a!3186) (index!33950 lt!343572)) (select (arr!20295 a!3186) j!159)))))

(declare-fun e!429652 () Bool)

(assert (=> b!771761 (=> res!522020 e!429652)))

(declare-fun e!429655 () Bool)

(assert (=> b!771761 (= e!429655 e!429652)))

(declare-fun d!101807 () Bool)

(declare-fun e!429651 () Bool)

(assert (=> d!101807 e!429651))

(declare-fun c!85270 () Bool)

(assert (=> d!101807 (= c!85270 (and (is-Intermediate!7895 lt!343572) (undefined!8707 lt!343572)))))

(declare-fun e!429654 () SeekEntryResult!7895)

(assert (=> d!101807 (= lt!343572 e!429654)))

(declare-fun c!85269 () Bool)

(assert (=> d!101807 (= c!85269 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!343573 () (_ BitVec 64))

(assert (=> d!101807 (= lt!343573 (select (arr!20295 a!3186) (toIndex!0 (select (arr!20295 a!3186) j!159) mask!3328)))))

(assert (=> d!101807 (validMask!0 mask!3328)))

(assert (=> d!101807 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20295 a!3186) j!159) mask!3328) (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343572)))

(declare-fun b!771762 () Bool)

(assert (=> b!771762 (and (bvsge (index!33950 lt!343572) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343572) (size!20716 a!3186)))))

(assert (=> b!771762 (= e!429652 (= (select (arr!20295 a!3186) (index!33950 lt!343572)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771763 () Bool)

(assert (=> b!771763 (and (bvsge (index!33950 lt!343572) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343572) (size!20716 a!3186)))))

(declare-fun res!522018 () Bool)

(assert (=> b!771763 (= res!522018 (= (select (arr!20295 a!3186) (index!33950 lt!343572)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771763 (=> res!522018 e!429652)))

(declare-fun b!771764 () Bool)

(assert (=> b!771764 (= e!429654 e!429653)))

(declare-fun c!85268 () Bool)

(assert (=> b!771764 (= c!85268 (or (= lt!343573 (select (arr!20295 a!3186) j!159)) (= (bvadd lt!343573 lt!343573) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771765 () Bool)

(assert (=> b!771765 (= e!429653 (Intermediate!7895 false (toIndex!0 (select (arr!20295 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771766 () Bool)

(assert (=> b!771766 (= e!429651 e!429655)))

(declare-fun res!522019 () Bool)

(assert (=> b!771766 (= res!522019 (and (is-Intermediate!7895 lt!343572) (not (undefined!8707 lt!343572)) (bvslt (x!64874 lt!343572) #b01111111111111111111111111111110) (bvsge (x!64874 lt!343572) #b00000000000000000000000000000000) (bvsge (x!64874 lt!343572) #b00000000000000000000000000000000)))))

(assert (=> b!771766 (=> (not res!522019) (not e!429655))))

(declare-fun b!771767 () Bool)

(assert (=> b!771767 (= e!429654 (Intermediate!7895 true (toIndex!0 (select (arr!20295 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771768 () Bool)

(assert (=> b!771768 (= e!429651 (bvsge (x!64874 lt!343572) #b01111111111111111111111111111110))))

(assert (= (and d!101807 c!85269) b!771767))

(assert (= (and d!101807 (not c!85269)) b!771764))

(assert (= (and b!771764 c!85268) b!771765))

(assert (= (and b!771764 (not c!85268)) b!771760))

(assert (= (and d!101807 c!85270) b!771768))

(assert (= (and d!101807 (not c!85270)) b!771766))

(assert (= (and b!771766 res!522019) b!771761))

(assert (= (and b!771761 (not res!522020)) b!771763))

(assert (= (and b!771763 (not res!522018)) b!771762))

(declare-fun m!716831 () Bool)

(assert (=> b!771763 m!716831))

(assert (=> d!101807 m!716431))

(declare-fun m!716833 () Bool)

(assert (=> d!101807 m!716833))

(assert (=> d!101807 m!716415))

(assert (=> b!771761 m!716831))

(assert (=> b!771762 m!716831))

(assert (=> b!771760 m!716431))

(declare-fun m!716835 () Bool)

(assert (=> b!771760 m!716835))

(assert (=> b!771760 m!716835))

(assert (=> b!771760 m!716419))

(declare-fun m!716837 () Bool)

(assert (=> b!771760 m!716837))

(assert (=> b!771251 d!101807))

(declare-fun d!101809 () Bool)

(declare-fun lt!343575 () (_ BitVec 32))

(declare-fun lt!343574 () (_ BitVec 32))

(assert (=> d!101809 (= lt!343575 (bvmul (bvxor lt!343574 (bvlshr lt!343574 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101809 (= lt!343574 ((_ extract 31 0) (bvand (bvxor (select (arr!20295 a!3186) j!159) (bvlshr (select (arr!20295 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101809 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!521963 (let ((h!15396 ((_ extract 31 0) (bvand (bvxor (select (arr!20295 a!3186) j!159) (bvlshr (select (arr!20295 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64884 (bvmul (bvxor h!15396 (bvlshr h!15396 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64884 (bvlshr x!64884 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!521963 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!521963 #b00000000000000000000000000000000))))))

(assert (=> d!101809 (= (toIndex!0 (select (arr!20295 a!3186) j!159) mask!3328) (bvand (bvxor lt!343575 (bvlshr lt!343575 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!771251 d!101809))

(declare-fun e!429658 () SeekEntryResult!7895)

(declare-fun b!771769 () Bool)

(assert (=> b!771769 (= e!429658 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343333 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20295 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771770 () Bool)

(declare-fun lt!343576 () SeekEntryResult!7895)

(assert (=> b!771770 (and (bvsge (index!33950 lt!343576) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343576) (size!20716 a!3186)))))

(declare-fun res!522023 () Bool)

(assert (=> b!771770 (= res!522023 (= (select (arr!20295 a!3186) (index!33950 lt!343576)) (select (arr!20295 a!3186) j!159)))))

(declare-fun e!429657 () Bool)

(assert (=> b!771770 (=> res!522023 e!429657)))

(declare-fun e!429660 () Bool)

(assert (=> b!771770 (= e!429660 e!429657)))

(declare-fun d!101811 () Bool)

(declare-fun e!429656 () Bool)

(assert (=> d!101811 e!429656))

(declare-fun c!85273 () Bool)

(assert (=> d!101811 (= c!85273 (and (is-Intermediate!7895 lt!343576) (undefined!8707 lt!343576)))))

(declare-fun e!429659 () SeekEntryResult!7895)

(assert (=> d!101811 (= lt!343576 e!429659)))

(declare-fun c!85272 () Bool)

(assert (=> d!101811 (= c!85272 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343577 () (_ BitVec 64))

(assert (=> d!101811 (= lt!343577 (select (arr!20295 a!3186) lt!343333))))

(assert (=> d!101811 (validMask!0 mask!3328)))

(assert (=> d!101811 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343333 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343576)))

(declare-fun b!771771 () Bool)

(assert (=> b!771771 (and (bvsge (index!33950 lt!343576) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343576) (size!20716 a!3186)))))

(assert (=> b!771771 (= e!429657 (= (select (arr!20295 a!3186) (index!33950 lt!343576)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771772 () Bool)

(assert (=> b!771772 (and (bvsge (index!33950 lt!343576) #b00000000000000000000000000000000) (bvslt (index!33950 lt!343576) (size!20716 a!3186)))))

(declare-fun res!522021 () Bool)

(assert (=> b!771772 (= res!522021 (= (select (arr!20295 a!3186) (index!33950 lt!343576)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771772 (=> res!522021 e!429657)))

(declare-fun b!771773 () Bool)

(assert (=> b!771773 (= e!429659 e!429658)))

(declare-fun c!85271 () Bool)

(assert (=> b!771773 (= c!85271 (or (= lt!343577 (select (arr!20295 a!3186) j!159)) (= (bvadd lt!343577 lt!343577) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771774 () Bool)

(assert (=> b!771774 (= e!429658 (Intermediate!7895 false lt!343333 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!771775 () Bool)

(assert (=> b!771775 (= e!429656 e!429660)))

(declare-fun res!522022 () Bool)

(assert (=> b!771775 (= res!522022 (and (is-Intermediate!7895 lt!343576) (not (undefined!8707 lt!343576)) (bvslt (x!64874 lt!343576) #b01111111111111111111111111111110) (bvsge (x!64874 lt!343576) #b00000000000000000000000000000000) (bvsge (x!64874 lt!343576) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!771775 (=> (not res!522022) (not e!429660))))

(declare-fun b!771776 () Bool)

(assert (=> b!771776 (= e!429659 (Intermediate!7895 true lt!343333 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!771777 () Bool)

(assert (=> b!771777 (= e!429656 (bvsge (x!64874 lt!343576) #b01111111111111111111111111111110))))

(assert (= (and d!101811 c!85272) b!771776))

(assert (= (and d!101811 (not c!85272)) b!771773))

(assert (= (and b!771773 c!85271) b!771774))

(assert (= (and b!771773 (not c!85271)) b!771769))

(assert (= (and d!101811 c!85273) b!771777))

(assert (= (and d!101811 (not c!85273)) b!771775))

(assert (= (and b!771775 res!522022) b!771770))

(assert (= (and b!771770 (not res!522023)) b!771772))

(assert (= (and b!771772 (not res!522021)) b!771771))

(declare-fun m!716839 () Bool)

(assert (=> b!771772 m!716839))

(declare-fun m!716841 () Bool)

(assert (=> d!101811 m!716841))

(assert (=> d!101811 m!716415))

(assert (=> b!771770 m!716839))

(assert (=> b!771771 m!716839))

(declare-fun m!716843 () Bool)

(assert (=> b!771769 m!716843))

(assert (=> b!771769 m!716843))

(assert (=> b!771769 m!716419))

(declare-fun m!716845 () Bool)

(assert (=> b!771769 m!716845))

(assert (=> b!771249 d!101811))

(declare-fun b!771778 () Bool)

(declare-fun e!429661 () SeekEntryResult!7895)

(assert (=> b!771778 (= e!429661 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20295 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771779 () Bool)

(declare-fun e!429662 () SeekEntryResult!7895)

(assert (=> b!771779 (= e!429662 (Found!7895 index!1321))))

(declare-fun b!771780 () Bool)

(declare-fun e!429663 () SeekEntryResult!7895)

(assert (=> b!771780 (= e!429663 Undefined!7895)))

(declare-fun b!771781 () Bool)

(assert (=> b!771781 (= e!429663 e!429662)))

(declare-fun c!85276 () Bool)

(declare-fun lt!343578 () (_ BitVec 64))

(assert (=> b!771781 (= c!85276 (= lt!343578 (select (arr!20295 a!3186) j!159)))))

(declare-fun lt!343579 () SeekEntryResult!7895)

(declare-fun d!101813 () Bool)

(assert (=> d!101813 (and (or (is-Undefined!7895 lt!343579) (not (is-Found!7895 lt!343579)) (and (bvsge (index!33949 lt!343579) #b00000000000000000000000000000000) (bvslt (index!33949 lt!343579) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343579) (is-Found!7895 lt!343579) (not (is-MissingVacant!7895 lt!343579)) (not (= (index!33951 lt!343579) resIntermediateIndex!5)) (and (bvsge (index!33951 lt!343579) #b00000000000000000000000000000000) (bvslt (index!33951 lt!343579) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343579) (ite (is-Found!7895 lt!343579) (= (select (arr!20295 a!3186) (index!33949 lt!343579)) (select (arr!20295 a!3186) j!159)) (and (is-MissingVacant!7895 lt!343579) (= (index!33951 lt!343579) resIntermediateIndex!5) (= (select (arr!20295 a!3186) (index!33951 lt!343579)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101813 (= lt!343579 e!429663)))

(declare-fun c!85274 () Bool)

(assert (=> d!101813 (= c!85274 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101813 (= lt!343578 (select (arr!20295 a!3186) index!1321))))

(assert (=> d!101813 (validMask!0 mask!3328)))

(assert (=> d!101813 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343579)))

(declare-fun b!771782 () Bool)

(assert (=> b!771782 (= e!429661 (MissingVacant!7895 resIntermediateIndex!5))))

(declare-fun b!771783 () Bool)

(declare-fun c!85275 () Bool)

(assert (=> b!771783 (= c!85275 (= lt!343578 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771783 (= e!429662 e!429661)))

(assert (= (and d!101813 c!85274) b!771780))

(assert (= (and d!101813 (not c!85274)) b!771781))

(assert (= (and b!771781 c!85276) b!771779))

(assert (= (and b!771781 (not c!85276)) b!771783))

(assert (= (and b!771783 c!85275) b!771782))

(assert (= (and b!771783 (not c!85275)) b!771778))

(assert (=> b!771778 m!716413))

(assert (=> b!771778 m!716413))

(assert (=> b!771778 m!716419))

(declare-fun m!716847 () Bool)

(assert (=> b!771778 m!716847))

(declare-fun m!716849 () Bool)

(assert (=> d!101813 m!716849))

(declare-fun m!716851 () Bool)

(assert (=> d!101813 m!716851))

(assert (=> d!101813 m!716627))

(assert (=> d!101813 m!716415))

(assert (=> b!771239 d!101813))

(declare-fun e!429664 () SeekEntryResult!7895)

(declare-fun b!771784 () Bool)

(assert (=> b!771784 (= e!429664 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343333 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20295 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771785 () Bool)

(declare-fun e!429665 () SeekEntryResult!7895)

(assert (=> b!771785 (= e!429665 (Found!7895 lt!343333))))

(declare-fun b!771786 () Bool)

(declare-fun e!429666 () SeekEntryResult!7895)

(assert (=> b!771786 (= e!429666 Undefined!7895)))

(declare-fun b!771787 () Bool)

(assert (=> b!771787 (= e!429666 e!429665)))

(declare-fun c!85279 () Bool)

(declare-fun lt!343580 () (_ BitVec 64))

(assert (=> b!771787 (= c!85279 (= lt!343580 (select (arr!20295 a!3186) j!159)))))

(declare-fun lt!343581 () SeekEntryResult!7895)

(declare-fun d!101815 () Bool)

(assert (=> d!101815 (and (or (is-Undefined!7895 lt!343581) (not (is-Found!7895 lt!343581)) (and (bvsge (index!33949 lt!343581) #b00000000000000000000000000000000) (bvslt (index!33949 lt!343581) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343581) (is-Found!7895 lt!343581) (not (is-MissingVacant!7895 lt!343581)) (not (= (index!33951 lt!343581) resIntermediateIndex!5)) (and (bvsge (index!33951 lt!343581) #b00000000000000000000000000000000) (bvslt (index!33951 lt!343581) (size!20716 a!3186)))) (or (is-Undefined!7895 lt!343581) (ite (is-Found!7895 lt!343581) (= (select (arr!20295 a!3186) (index!33949 lt!343581)) (select (arr!20295 a!3186) j!159)) (and (is-MissingVacant!7895 lt!343581) (= (index!33951 lt!343581) resIntermediateIndex!5) (= (select (arr!20295 a!3186) (index!33951 lt!343581)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101815 (= lt!343581 e!429666)))

(declare-fun c!85277 () Bool)

(assert (=> d!101815 (= c!85277 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101815 (= lt!343580 (select (arr!20295 a!3186) lt!343333))))

(assert (=> d!101815 (validMask!0 mask!3328)))

(assert (=> d!101815 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343333 resIntermediateIndex!5 (select (arr!20295 a!3186) j!159) a!3186 mask!3328) lt!343581)))

(declare-fun b!771788 () Bool)

(assert (=> b!771788 (= e!429664 (MissingVacant!7895 resIntermediateIndex!5))))

(declare-fun b!771789 () Bool)

(declare-fun c!85278 () Bool)

(assert (=> b!771789 (= c!85278 (= lt!343580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771789 (= e!429665 e!429664)))

(assert (= (and d!101815 c!85277) b!771786))

(assert (= (and d!101815 (not c!85277)) b!771787))

(assert (= (and b!771787 c!85279) b!771785))

(assert (= (and b!771787 (not c!85279)) b!771789))

(assert (= (and b!771789 c!85278) b!771788))

(assert (= (and b!771789 (not c!85278)) b!771784))

(assert (=> b!771784 m!716843))

(assert (=> b!771784 m!716843))

(assert (=> b!771784 m!716419))

(declare-fun m!716853 () Bool)

(assert (=> b!771784 m!716853))

(declare-fun m!716855 () Bool)

(assert (=> d!101815 m!716855))

(declare-fun m!716857 () Bool)

(assert (=> d!101815 m!716857))

(assert (=> d!101815 m!716841))

(assert (=> d!101815 m!716415))

(assert (=> b!771239 d!101815))

(assert (=> b!771250 d!101813))

(push 1)

(assert (not d!101787))

(assert (not d!101721))

(assert (not b!771666))

(assert (not b!771677))

(assert (not b!771698))

(assert (not d!101749))

(assert (not b!771754))

(assert (not d!101811))

(assert (not b!771426))

(assert (not d!101815))

(assert (not b!771784))

(assert (not b!771760))

(assert (not b!771679))

(assert (not b!771425))

(assert (not d!101813))

(assert (not d!101779))

(assert (not bm!35119))

(assert (not b!771422))

(assert (not b!771490))

(assert (not bm!35120))

(assert (not b!771595))

(assert (not b!771604))

(assert (not d!101723))

(assert (not b!771574))

(assert (not bm!35109))

(assert (not b!771590))

(assert (not b!771769))

(assert (not d!101807))

(assert (not b!771664))

(assert (not d!101785))

(assert (not d!101705))

(assert (not d!101753))

(assert (not b!771778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

