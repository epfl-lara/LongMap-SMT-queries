; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33086 () Bool)

(assert start!33086)

(declare-fun b!329342 () Bool)

(declare-fun res!181527 () Bool)

(declare-fun e!202314 () Bool)

(assert (=> b!329342 (=> (not res!181527) (not e!202314))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329342 (= res!181527 (validKeyInArray!0 k!2497))))

(declare-fun b!329343 () Bool)

(declare-fun res!181530 () Bool)

(declare-fun e!202313 () Bool)

(assert (=> b!329343 (=> (not res!181530) (not e!202313))))

(declare-datatypes ((array!16847 0))(
  ( (array!16848 (arr!7969 (Array (_ BitVec 32) (_ BitVec 64))) (size!8321 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16847)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!329343 (= res!181530 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7969 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7969 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7969 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!329344 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3100 0))(
  ( (MissingZero!3100 (index!14576 (_ BitVec 32))) (Found!3100 (index!14577 (_ BitVec 32))) (Intermediate!3100 (undefined!3912 Bool) (index!14578 (_ BitVec 32)) (x!32841 (_ BitVec 32))) (Undefined!3100) (MissingVacant!3100 (index!14579 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16847 (_ BitVec 32)) SeekEntryResult!3100)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329344 (= e!202313 (not (is-Intermediate!3100 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))))

(declare-fun b!329345 () Bool)

(declare-fun res!181534 () Bool)

(assert (=> b!329345 (=> (not res!181534) (not e!202314))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329345 (= res!181534 (and (= (size!8321 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8321 a!3305))))))

(declare-fun b!329346 () Bool)

(declare-fun res!181535 () Bool)

(assert (=> b!329346 (=> (not res!181535) (not e!202314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16847 (_ BitVec 32)) Bool)

(assert (=> b!329346 (= res!181535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329347 () Bool)

(declare-fun res!181528 () Bool)

(assert (=> b!329347 (=> (not res!181528) (not e!202314))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16847 (_ BitVec 32)) SeekEntryResult!3100)

(assert (=> b!329347 (= res!181528 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3100 i!1250)))))

(declare-fun b!329348 () Bool)

(declare-fun res!181529 () Bool)

(assert (=> b!329348 (=> (not res!181529) (not e!202313))))

(declare-fun lt!158178 () SeekEntryResult!3100)

(assert (=> b!329348 (= res!181529 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158178))))

(declare-fun res!181531 () Bool)

(assert (=> start!33086 (=> (not res!181531) (not e!202314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33086 (= res!181531 (validMask!0 mask!3777))))

(assert (=> start!33086 e!202314))

(declare-fun array_inv!5932 (array!16847) Bool)

(assert (=> start!33086 (array_inv!5932 a!3305)))

(assert (=> start!33086 true))

(declare-fun b!329349 () Bool)

(assert (=> b!329349 (= e!202314 e!202313)))

(declare-fun res!181532 () Bool)

(assert (=> b!329349 (=> (not res!181532) (not e!202313))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329349 (= res!181532 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158178))))

(assert (=> b!329349 (= lt!158178 (Intermediate!3100 false resIndex!58 resX!58))))

(declare-fun b!329350 () Bool)

(declare-fun res!181533 () Bool)

(assert (=> b!329350 (=> (not res!181533) (not e!202314))))

(declare-fun arrayContainsKey!0 (array!16847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329350 (= res!181533 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329351 () Bool)

(declare-fun res!181536 () Bool)

(assert (=> b!329351 (=> (not res!181536) (not e!202313))))

(assert (=> b!329351 (= res!181536 (and (= (select (arr!7969 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8321 a!3305))))))

(assert (= (and start!33086 res!181531) b!329345))

(assert (= (and b!329345 res!181534) b!329342))

(assert (= (and b!329342 res!181527) b!329350))

(assert (= (and b!329350 res!181533) b!329347))

(assert (= (and b!329347 res!181528) b!329346))

(assert (= (and b!329346 res!181535) b!329349))

(assert (= (and b!329349 res!181532) b!329351))

(assert (= (and b!329351 res!181536) b!329348))

(assert (= (and b!329348 res!181529) b!329343))

(assert (= (and b!329343 res!181530) b!329344))

(declare-fun m!335043 () Bool)

(assert (=> start!33086 m!335043))

(declare-fun m!335045 () Bool)

(assert (=> start!33086 m!335045))

(declare-fun m!335047 () Bool)

(assert (=> b!329351 m!335047))

(declare-fun m!335049 () Bool)

(assert (=> b!329348 m!335049))

(declare-fun m!335051 () Bool)

(assert (=> b!329347 m!335051))

(declare-fun m!335053 () Bool)

(assert (=> b!329350 m!335053))

(declare-fun m!335055 () Bool)

(assert (=> b!329342 m!335055))

(declare-fun m!335057 () Bool)

(assert (=> b!329349 m!335057))

(assert (=> b!329349 m!335057))

(declare-fun m!335059 () Bool)

(assert (=> b!329349 m!335059))

(declare-fun m!335061 () Bool)

(assert (=> b!329343 m!335061))

(declare-fun m!335063 () Bool)

(assert (=> b!329344 m!335063))

(assert (=> b!329344 m!335063))

(declare-fun m!335065 () Bool)

(assert (=> b!329344 m!335065))

(declare-fun m!335067 () Bool)

(assert (=> b!329346 m!335067))

(push 1)

(assert (not b!329350))

(assert (not b!329342))

(assert (not start!33086))

(assert (not b!329344))

(assert (not b!329349))

(assert (not b!329347))

(assert (not b!329346))

(assert (not b!329348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70155 () Bool)

(declare-fun res!181541 () Bool)

(declare-fun e!202326 () Bool)

(assert (=> d!70155 (=> res!181541 e!202326)))

(assert (=> d!70155 (= res!181541 (= (select (arr!7969 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70155 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!202326)))

(declare-fun b!329368 () Bool)

(declare-fun e!202327 () Bool)

(assert (=> b!329368 (= e!202326 e!202327)))

(declare-fun res!181542 () Bool)

(assert (=> b!329368 (=> (not res!181542) (not e!202327))))

(assert (=> b!329368 (= res!181542 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8321 a!3305)))))

(declare-fun b!329369 () Bool)

(assert (=> b!329369 (= e!202327 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70155 (not res!181541)) b!329368))

(assert (= (and b!329368 res!181542) b!329369))

(declare-fun m!335069 () Bool)

(assert (=> d!70155 m!335069))

(declare-fun m!335071 () Bool)

(assert (=> b!329369 m!335071))

(assert (=> b!329350 d!70155))

(declare-fun d!70157 () Bool)

(assert (=> d!70157 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33086 d!70157))

(declare-fun d!70161 () Bool)

(assert (=> d!70161 (= (array_inv!5932 a!3305) (bvsge (size!8321 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33086 d!70161))

(declare-fun b!329464 () Bool)

(declare-fun e!202383 () SeekEntryResult!3100)

(assert (=> b!329464 (= e!202383 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329465 () Bool)

(declare-fun e!202382 () SeekEntryResult!3100)

(assert (=> b!329465 (= e!202382 e!202383)))

(declare-fun c!51583 () Bool)

(declare-fun lt!158213 () (_ BitVec 64))

(assert (=> b!329465 (= c!51583 (or (= lt!158213 k!2497) (= (bvadd lt!158213 lt!158213) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329466 () Bool)

(declare-fun e!202384 () Bool)

(declare-fun e!202385 () Bool)

(assert (=> b!329466 (= e!202384 e!202385)))

(declare-fun res!181576 () Bool)

(declare-fun lt!158212 () SeekEntryResult!3100)

(assert (=> b!329466 (= res!181576 (and (is-Intermediate!3100 lt!158212) (not (undefined!3912 lt!158212)) (bvslt (x!32841 lt!158212) #b01111111111111111111111111111110) (bvsge (x!32841 lt!158212) #b00000000000000000000000000000000) (bvsge (x!32841 lt!158212) #b00000000000000000000000000000000)))))

(assert (=> b!329466 (=> (not res!181576) (not e!202385))))

(declare-fun b!329467 () Bool)

(assert (=> b!329467 (= e!202382 (Intermediate!3100 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329468 () Bool)

(assert (=> b!329468 (= e!202383 (Intermediate!3100 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329469 () Bool)

(assert (=> b!329469 (and (bvsge (index!14578 lt!158212) #b00000000000000000000000000000000) (bvslt (index!14578 lt!158212) (size!8321 a!3305)))))

(declare-fun res!181577 () Bool)

(assert (=> b!329469 (= res!181577 (= (select (arr!7969 a!3305) (index!14578 lt!158212)) k!2497))))

(declare-fun e!202386 () Bool)

(assert (=> b!329469 (=> res!181577 e!202386)))

(assert (=> b!329469 (= e!202385 e!202386)))

(declare-fun b!329470 () Bool)

(assert (=> b!329470 (= e!202384 (bvsge (x!32841 lt!158212) #b01111111111111111111111111111110))))

(declare-fun b!329471 () Bool)

(assert (=> b!329471 (and (bvsge (index!14578 lt!158212) #b00000000000000000000000000000000) (bvslt (index!14578 lt!158212) (size!8321 a!3305)))))

(declare-fun res!181578 () Bool)

(assert (=> b!329471 (= res!181578 (= (select (arr!7969 a!3305) (index!14578 lt!158212)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329471 (=> res!181578 e!202386)))

(declare-fun b!329463 () Bool)

(assert (=> b!329463 (and (bvsge (index!14578 lt!158212) #b00000000000000000000000000000000) (bvslt (index!14578 lt!158212) (size!8321 a!3305)))))

(assert (=> b!329463 (= e!202386 (= (select (arr!7969 a!3305) (index!14578 lt!158212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!70163 () Bool)

(assert (=> d!70163 e!202384))

(declare-fun c!51585 () Bool)

(assert (=> d!70163 (= c!51585 (and (is-Intermediate!3100 lt!158212) (undefined!3912 lt!158212)))))

(assert (=> d!70163 (= lt!158212 e!202382)))

(declare-fun c!51584 () Bool)

(assert (=> d!70163 (= c!51584 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70163 (= lt!158213 (select (arr!7969 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70163 (validMask!0 mask!3777)))

(assert (=> d!70163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158212)))

(assert (= (and d!70163 c!51584) b!329467))

(assert (= (and d!70163 (not c!51584)) b!329465))

(assert (= (and b!329465 c!51583) b!329468))

(assert (= (and b!329465 (not c!51583)) b!329464))

(assert (= (and d!70163 c!51585) b!329470))

(assert (= (and d!70163 (not c!51585)) b!329466))

(assert (= (and b!329466 res!181576) b!329469))

(assert (= (and b!329469 (not res!181577)) b!329471))

(assert (= (and b!329471 (not res!181578)) b!329463))

(assert (=> d!70163 m!335057))

(declare-fun m!335111 () Bool)

(assert (=> d!70163 m!335111))

(assert (=> d!70163 m!335043))

(declare-fun m!335113 () Bool)

(assert (=> b!329471 m!335113))

(assert (=> b!329469 m!335113))

(assert (=> b!329464 m!335057))

(declare-fun m!335115 () Bool)

(assert (=> b!329464 m!335115))

(assert (=> b!329464 m!335115))

(declare-fun m!335117 () Bool)

(assert (=> b!329464 m!335117))

(assert (=> b!329463 m!335113))

(assert (=> b!329349 d!70163))

(declare-fun d!70177 () Bool)

(declare-fun lt!158219 () (_ BitVec 32))

(declare-fun lt!158218 () (_ BitVec 32))

(assert (=> d!70177 (= lt!158219 (bvmul (bvxor lt!158218 (bvlshr lt!158218 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70177 (= lt!158218 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70177 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181579 (let ((h!5415 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32847 (bvmul (bvxor h!5415 (bvlshr h!5415 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32847 (bvlshr x!32847 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181579 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181579 #b00000000000000000000000000000000))))))

(assert (=> d!70177 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!158219 (bvlshr lt!158219 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!329349 d!70177))

(declare-fun b!329473 () Bool)

(declare-fun e!202388 () SeekEntryResult!3100)

(assert (=> b!329473 (= e!202388 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329474 () Bool)

(declare-fun e!202387 () SeekEntryResult!3100)

(assert (=> b!329474 (= e!202387 e!202388)))

(declare-fun c!51586 () Bool)

(declare-fun lt!158221 () (_ BitVec 64))

(assert (=> b!329474 (= c!51586 (or (= lt!158221 k!2497) (= (bvadd lt!158221 lt!158221) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329475 () Bool)

(declare-fun e!202389 () Bool)

(declare-fun e!202390 () Bool)

(assert (=> b!329475 (= e!202389 e!202390)))

(declare-fun res!181580 () Bool)

(declare-fun lt!158220 () SeekEntryResult!3100)

(assert (=> b!329475 (= res!181580 (and (is-Intermediate!3100 lt!158220) (not (undefined!3912 lt!158220)) (bvslt (x!32841 lt!158220) #b01111111111111111111111111111110) (bvsge (x!32841 lt!158220) #b00000000000000000000000000000000) (bvsge (x!32841 lt!158220) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!329475 (=> (not res!181580) (not e!202390))))

(declare-fun b!329476 () Bool)

(assert (=> b!329476 (= e!202387 (Intermediate!3100 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329477 () Bool)

(assert (=> b!329477 (= e!202388 (Intermediate!3100 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329478 () Bool)

(assert (=> b!329478 (and (bvsge (index!14578 lt!158220) #b00000000000000000000000000000000) (bvslt (index!14578 lt!158220) (size!8321 a!3305)))))

(declare-fun res!181581 () Bool)

(assert (=> b!329478 (= res!181581 (= (select (arr!7969 a!3305) (index!14578 lt!158220)) k!2497))))

(declare-fun e!202391 () Bool)

(assert (=> b!329478 (=> res!181581 e!202391)))

(assert (=> b!329478 (= e!202390 e!202391)))

(declare-fun b!329479 () Bool)

(assert (=> b!329479 (= e!202389 (bvsge (x!32841 lt!158220) #b01111111111111111111111111111110))))

(declare-fun b!329480 () Bool)

(assert (=> b!329480 (and (bvsge (index!14578 lt!158220) #b00000000000000000000000000000000) (bvslt (index!14578 lt!158220) (size!8321 a!3305)))))

(declare-fun res!181582 () Bool)

(assert (=> b!329480 (= res!181582 (= (select (arr!7969 a!3305) (index!14578 lt!158220)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329480 (=> res!181582 e!202391)))

(declare-fun b!329472 () Bool)

(assert (=> b!329472 (and (bvsge (index!14578 lt!158220) #b00000000000000000000000000000000) (bvslt (index!14578 lt!158220) (size!8321 a!3305)))))

(assert (=> b!329472 (= e!202391 (= (select (arr!7969 a!3305) (index!14578 lt!158220)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!70179 () Bool)

(assert (=> d!70179 e!202389))

(declare-fun c!51588 () Bool)

(assert (=> d!70179 (= c!51588 (and (is-Intermediate!3100 lt!158220) (undefined!3912 lt!158220)))))

(assert (=> d!70179 (= lt!158220 e!202387)))

(declare-fun c!51587 () Bool)

(assert (=> d!70179 (= c!51587 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(assert (=> d!70179 (= lt!158221 (select (arr!7969 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!70179 (validMask!0 mask!3777)))

(assert (=> d!70179 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777) lt!158220)))

(assert (= (and d!70179 c!51587) b!329476))

(assert (= (and d!70179 (not c!51587)) b!329474))

(assert (= (and b!329474 c!51586) b!329477))

(assert (= (and b!329474 (not c!51586)) b!329473))

(assert (= (and d!70179 c!51588) b!329479))

(assert (= (and d!70179 (not c!51588)) b!329475))

(assert (= (and b!329475 res!181580) b!329478))

(assert (= (and b!329478 (not res!181581)) b!329480))

(assert (= (and b!329480 (not res!181582)) b!329472))

(assert (=> d!70179 m!335063))

(declare-fun m!335119 () Bool)

(assert (=> d!70179 m!335119))

(assert (=> d!70179 m!335043))

(declare-fun m!335121 () Bool)

(assert (=> b!329480 m!335121))

(assert (=> b!329478 m!335121))

(assert (=> b!329473 m!335063))

(declare-fun m!335123 () Bool)

(assert (=> b!329473 m!335123))

(assert (=> b!329473 m!335123))

(declare-fun m!335125 () Bool)

(assert (=> b!329473 m!335125))

(assert (=> b!329472 m!335121))

(assert (=> b!329344 d!70179))

(declare-fun d!70181 () Bool)

(declare-fun lt!158224 () (_ BitVec 32))

(assert (=> d!70181 (and (bvsge lt!158224 #b00000000000000000000000000000000) (bvslt lt!158224 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70181 (= lt!158224 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70181 (validMask!0 mask!3777)))

(assert (=> d!70181 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158224)))

(declare-fun bs!11410 () Bool)

(assert (= bs!11410 d!70181))

(declare-fun m!335127 () Bool)

(assert (=> bs!11410 m!335127))

(assert (=> bs!11410 m!335043))

(assert (=> b!329344 d!70181))

(declare-fun d!70187 () Bool)

(declare-fun lt!158250 () SeekEntryResult!3100)

(assert (=> d!70187 (and (or (is-Undefined!3100 lt!158250) (not (is-Found!3100 lt!158250)) (and (bvsge (index!14577 lt!158250) #b00000000000000000000000000000000) (bvslt (index!14577 lt!158250) (size!8321 a!3305)))) (or (is-Undefined!3100 lt!158250) (is-Found!3100 lt!158250) (not (is-MissingZero!3100 lt!158250)) (and (bvsge (index!14576 lt!158250) #b00000000000000000000000000000000) (bvslt (index!14576 lt!158250) (size!8321 a!3305)))) (or (is-Undefined!3100 lt!158250) (is-Found!3100 lt!158250) (is-MissingZero!3100 lt!158250) (not (is-MissingVacant!3100 lt!158250)) (and (bvsge (index!14579 lt!158250) #b00000000000000000000000000000000) (bvslt (index!14579 lt!158250) (size!8321 a!3305)))) (or (is-Undefined!3100 lt!158250) (ite (is-Found!3100 lt!158250) (= (select (arr!7969 a!3305) (index!14577 lt!158250)) k!2497) (ite (is-MissingZero!3100 lt!158250) (= (select (arr!7969 a!3305) (index!14576 lt!158250)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3100 lt!158250) (= (select (arr!7969 a!3305) (index!14579 lt!158250)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!202420 () SeekEntryResult!3100)

(assert (=> d!70187 (= lt!158250 e!202420)))

(declare-fun c!51602 () Bool)

(declare-fun lt!158248 () SeekEntryResult!3100)

(assert (=> d!70187 (= c!51602 (and (is-Intermediate!3100 lt!158248) (undefined!3912 lt!158248)))))

(assert (=> d!70187 (= lt!158248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70187 (validMask!0 mask!3777)))

(assert (=> d!70187 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!158250)))

(declare-fun b!329520 () Bool)

(assert (=> b!329520 (= e!202420 Undefined!3100)))

(declare-fun b!329521 () Bool)

(declare-fun e!202418 () SeekEntryResult!3100)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16847 (_ BitVec 32)) SeekEntryResult!3100)

(assert (=> b!329521 (= e!202418 (seekKeyOrZeroReturnVacant!0 (x!32841 lt!158248) (index!14578 lt!158248) (index!14578 lt!158248) k!2497 a!3305 mask!3777))))

(declare-fun b!329522 () Bool)

(declare-fun e!202419 () SeekEntryResult!3100)

(assert (=> b!329522 (= e!202419 (Found!3100 (index!14578 lt!158248)))))

(declare-fun b!329523 () Bool)

(declare-fun c!51603 () Bool)

(declare-fun lt!158249 () (_ BitVec 64))

(assert (=> b!329523 (= c!51603 (= lt!158249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329523 (= e!202419 e!202418)))

(declare-fun b!329524 () Bool)

(assert (=> b!329524 (= e!202420 e!202419)))

(assert (=> b!329524 (= lt!158249 (select (arr!7969 a!3305) (index!14578 lt!158248)))))

(declare-fun c!51601 () Bool)

(assert (=> b!329524 (= c!51601 (= lt!158249 k!2497))))

(declare-fun b!329525 () Bool)

(assert (=> b!329525 (= e!202418 (MissingZero!3100 (index!14578 lt!158248)))))

(assert (= (and d!70187 c!51602) b!329520))

(assert (= (and d!70187 (not c!51602)) b!329524))

(assert (= (and b!329524 c!51601) b!329522))

(assert (= (and b!329524 (not c!51601)) b!329523))

(assert (= (and b!329523 c!51603) b!329525))

(assert (= (and b!329523 (not c!51603)) b!329521))

(assert (=> d!70187 m!335057))

(assert (=> d!70187 m!335059))

(assert (=> d!70187 m!335057))

(declare-fun m!335151 () Bool)

(assert (=> d!70187 m!335151))

(declare-fun m!335153 () Bool)

(assert (=> d!70187 m!335153))

(declare-fun m!335155 () Bool)

(assert (=> d!70187 m!335155))

(assert (=> d!70187 m!335043))

(declare-fun m!335157 () Bool)

(assert (=> b!329521 m!335157))

(declare-fun m!335159 () Bool)

(assert (=> b!329524 m!335159))

(assert (=> b!329347 d!70187))

(declare-fun d!70201 () Bool)

(assert (=> d!70201 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!329342 d!70201))

(declare-fun b!329527 () Bool)

(declare-fun e!202422 () SeekEntryResult!3100)

(assert (=> b!329527 (= e!202422 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329528 () Bool)

(declare-fun e!202421 () SeekEntryResult!3100)

(assert (=> b!329528 (= e!202421 e!202422)))

(declare-fun c!51604 () Bool)

(declare-fun lt!158252 () (_ BitVec 64))

(assert (=> b!329528 (= c!51604 (or (= lt!158252 k!2497) (= (bvadd lt!158252 lt!158252) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329529 () Bool)

(declare-fun e!202423 () Bool)

(declare-fun e!202424 () Bool)

(assert (=> b!329529 (= e!202423 e!202424)))

(declare-fun res!181599 () Bool)

(declare-fun lt!158251 () SeekEntryResult!3100)

(assert (=> b!329529 (= res!181599 (and (is-Intermediate!3100 lt!158251) (not (undefined!3912 lt!158251)) (bvslt (x!32841 lt!158251) #b01111111111111111111111111111110) (bvsge (x!32841 lt!158251) #b00000000000000000000000000000000) (bvsge (x!32841 lt!158251) x!1490)))))

(assert (=> b!329529 (=> (not res!181599) (not e!202424))))

(declare-fun b!329530 () Bool)

(assert (=> b!329530 (= e!202421 (Intermediate!3100 true index!1840 x!1490))))

(declare-fun b!329531 () Bool)

(assert (=> b!329531 (= e!202422 (Intermediate!3100 false index!1840 x!1490))))

(declare-fun b!329532 () Bool)

(assert (=> b!329532 (and (bvsge (index!14578 lt!158251) #b00000000000000000000000000000000) (bvslt (index!14578 lt!158251) (size!8321 a!3305)))))

(declare-fun res!181600 () Bool)

(assert (=> b!329532 (= res!181600 (= (select (arr!7969 a!3305) (index!14578 lt!158251)) k!2497))))

(declare-fun e!202425 () Bool)

(assert (=> b!329532 (=> res!181600 e!202425)))

(assert (=> b!329532 (= e!202424 e!202425)))

(declare-fun b!329533 () Bool)

(assert (=> b!329533 (= e!202423 (bvsge (x!32841 lt!158251) #b01111111111111111111111111111110))))

(declare-fun b!329534 () Bool)

(assert (=> b!329534 (and (bvsge (index!14578 lt!158251) #b00000000000000000000000000000000) (bvslt (index!14578 lt!158251) (size!8321 a!3305)))))

(declare-fun res!181601 () Bool)

(assert (=> b!329534 (= res!181601 (= (select (arr!7969 a!3305) (index!14578 lt!158251)) #b0000000000000000000000000000000000000000000000000000000000000000))))

