; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52362 () Bool)

(assert start!52362)

(declare-fun b!571224 () Bool)

(declare-fun e!328536 () Bool)

(declare-fun e!328537 () Bool)

(assert (=> b!571224 (= e!328536 e!328537)))

(declare-fun res!360911 () Bool)

(assert (=> b!571224 (=> res!360911 e!328537)))

(declare-fun lt!260470 () (_ BitVec 64))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35769 0))(
  ( (array!35770 (arr!17173 (Array (_ BitVec 32) (_ BitVec 64))) (size!17537 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35769)

(assert (=> b!571224 (= res!360911 (or (= lt!260470 (select (arr!17173 a!3118) j!142)) (= lt!260470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5578 0))(
  ( (MissingZero!5578 (index!24539 (_ BitVec 32))) (Found!5578 (index!24540 (_ BitVec 32))) (Intermediate!5578 (undefined!6390 Bool) (index!24541 (_ BitVec 32)) (x!53561 (_ BitVec 32))) (Undefined!5578) (MissingVacant!5578 (index!24542 (_ BitVec 32))) )
))
(declare-fun lt!260474 () SeekEntryResult!5578)

(assert (=> b!571224 (= lt!260470 (select (arr!17173 a!3118) (index!24541 lt!260474)))))

(declare-fun b!571225 () Bool)

(declare-fun e!328540 () Bool)

(assert (=> b!571225 (= e!328540 e!328536)))

(declare-fun res!360906 () Bool)

(assert (=> b!571225 (=> res!360906 e!328536)))

(get-info :version)

(assert (=> b!571225 (= res!360906 (or (undefined!6390 lt!260474) (not ((_ is Intermediate!5578) lt!260474))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260472 () SeekEntryResult!5578)

(declare-fun b!571226 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35769 (_ BitVec 32)) SeekEntryResult!5578)

(assert (=> b!571226 (= e!328537 (= lt!260472 (seekKeyOrZeroReturnVacant!0 (x!53561 lt!260474) (index!24541 lt!260474) (index!24541 lt!260474) (select (arr!17173 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571228 () Bool)

(declare-fun res!360905 () Bool)

(declare-fun e!328539 () Bool)

(assert (=> b!571228 (=> (not res!360905) (not e!328539))))

(declare-datatypes ((List!11160 0))(
  ( (Nil!11157) (Cons!11156 (h!12183 (_ BitVec 64)) (t!17380 List!11160)) )
))
(declare-fun arrayNoDuplicates!0 (array!35769 (_ BitVec 32) List!11160) Bool)

(assert (=> b!571228 (= res!360905 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11157))))

(declare-fun b!571229 () Bool)

(declare-fun res!360912 () Bool)

(declare-fun e!328541 () Bool)

(assert (=> b!571229 (=> (not res!360912) (not e!328541))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571229 (= res!360912 (validKeyInArray!0 k0!1914))))

(declare-fun b!571230 () Bool)

(declare-fun res!360902 () Bool)

(assert (=> b!571230 (=> (not res!360902) (not e!328541))))

(assert (=> b!571230 (= res!360902 (validKeyInArray!0 (select (arr!17173 a!3118) j!142)))))

(declare-fun b!571231 () Bool)

(declare-fun e!328538 () Bool)

(declare-fun e!328542 () Bool)

(assert (=> b!571231 (= e!328538 e!328542)))

(declare-fun res!360913 () Bool)

(assert (=> b!571231 (=> res!360913 e!328542)))

(declare-fun lt!260473 () (_ BitVec 64))

(assert (=> b!571231 (= res!360913 (or (= lt!260473 (select (arr!17173 a!3118) j!142)) (= lt!260473 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571231 (= lt!260473 (select (arr!17173 a!3118) (index!24541 lt!260474)))))

(declare-fun b!571232 () Bool)

(declare-fun e!328534 () Bool)

(assert (=> b!571232 (= e!328539 e!328534)))

(declare-fun res!360903 () Bool)

(assert (=> b!571232 (=> (not res!360903) (not e!328534))))

(declare-fun lt!260468 () array!35769)

(declare-fun lt!260476 () (_ BitVec 32))

(declare-fun lt!260475 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35769 (_ BitVec 32)) SeekEntryResult!5578)

(assert (=> b!571232 (= res!360903 (= lt!260474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260476 lt!260475 lt!260468 mask!3119)))))

(declare-fun lt!260467 () (_ BitVec 32))

(assert (=> b!571232 (= lt!260474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260467 (select (arr!17173 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571232 (= lt!260476 (toIndex!0 lt!260475 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571232 (= lt!260475 (select (store (arr!17173 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571232 (= lt!260467 (toIndex!0 (select (arr!17173 a!3118) j!142) mask!3119))))

(assert (=> b!571232 (= lt!260468 (array!35770 (store (arr!17173 a!3118) i!1132 k0!1914) (size!17537 a!3118)))))

(declare-fun b!571233 () Bool)

(assert (=> b!571233 (= e!328541 e!328539)))

(declare-fun res!360901 () Bool)

(assert (=> b!571233 (=> (not res!360901) (not e!328539))))

(declare-fun lt!260471 () SeekEntryResult!5578)

(assert (=> b!571233 (= res!360901 (or (= lt!260471 (MissingZero!5578 i!1132)) (= lt!260471 (MissingVacant!5578 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35769 (_ BitVec 32)) SeekEntryResult!5578)

(assert (=> b!571233 (= lt!260471 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571234 () Bool)

(declare-fun res!360907 () Bool)

(assert (=> b!571234 (=> (not res!360907) (not e!328541))))

(assert (=> b!571234 (= res!360907 (and (= (size!17537 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17537 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17537 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571235 () Bool)

(assert (=> b!571235 (= e!328534 (not e!328538))))

(declare-fun res!360908 () Bool)

(assert (=> b!571235 (=> res!360908 e!328538)))

(assert (=> b!571235 (= res!360908 (or (undefined!6390 lt!260474) (not ((_ is Intermediate!5578) lt!260474))))))

(assert (=> b!571235 e!328540))

(declare-fun res!360900 () Bool)

(assert (=> b!571235 (=> (not res!360900) (not e!328540))))

(assert (=> b!571235 (= res!360900 (= lt!260472 (Found!5578 j!142)))))

(assert (=> b!571235 (= lt!260472 (seekEntryOrOpen!0 (select (arr!17173 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35769 (_ BitVec 32)) Bool)

(assert (=> b!571235 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17929 0))(
  ( (Unit!17930) )
))
(declare-fun lt!260469 () Unit!17929)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17929)

(assert (=> b!571235 (= lt!260469 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571227 () Bool)

(assert (=> b!571227 (= e!328542 (= (seekEntryOrOpen!0 lt!260475 lt!260468 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53561 lt!260474) (index!24541 lt!260474) (index!24541 lt!260474) lt!260475 lt!260468 mask!3119)))))

(declare-fun res!360904 () Bool)

(assert (=> start!52362 (=> (not res!360904) (not e!328541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52362 (= res!360904 (validMask!0 mask!3119))))

(assert (=> start!52362 e!328541))

(assert (=> start!52362 true))

(declare-fun array_inv!13032 (array!35769) Bool)

(assert (=> start!52362 (array_inv!13032 a!3118)))

(declare-fun b!571236 () Bool)

(declare-fun res!360910 () Bool)

(assert (=> b!571236 (=> (not res!360910) (not e!328541))))

(declare-fun arrayContainsKey!0 (array!35769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571236 (= res!360910 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571237 () Bool)

(declare-fun res!360909 () Bool)

(assert (=> b!571237 (=> (not res!360909) (not e!328539))))

(assert (=> b!571237 (= res!360909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52362 res!360904) b!571234))

(assert (= (and b!571234 res!360907) b!571230))

(assert (= (and b!571230 res!360902) b!571229))

(assert (= (and b!571229 res!360912) b!571236))

(assert (= (and b!571236 res!360910) b!571233))

(assert (= (and b!571233 res!360901) b!571237))

(assert (= (and b!571237 res!360909) b!571228))

(assert (= (and b!571228 res!360905) b!571232))

(assert (= (and b!571232 res!360903) b!571235))

(assert (= (and b!571235 res!360900) b!571225))

(assert (= (and b!571225 (not res!360906)) b!571224))

(assert (= (and b!571224 (not res!360911)) b!571226))

(assert (= (and b!571235 (not res!360908)) b!571231))

(assert (= (and b!571231 (not res!360913)) b!571227))

(declare-fun m!550307 () Bool)

(assert (=> b!571236 m!550307))

(declare-fun m!550309 () Bool)

(assert (=> start!52362 m!550309))

(declare-fun m!550311 () Bool)

(assert (=> start!52362 m!550311))

(declare-fun m!550313 () Bool)

(assert (=> b!571237 m!550313))

(declare-fun m!550315 () Bool)

(assert (=> b!571227 m!550315))

(declare-fun m!550317 () Bool)

(assert (=> b!571227 m!550317))

(declare-fun m!550319 () Bool)

(assert (=> b!571229 m!550319))

(declare-fun m!550321 () Bool)

(assert (=> b!571224 m!550321))

(declare-fun m!550323 () Bool)

(assert (=> b!571224 m!550323))

(declare-fun m!550325 () Bool)

(assert (=> b!571233 m!550325))

(assert (=> b!571231 m!550321))

(assert (=> b!571231 m!550323))

(declare-fun m!550327 () Bool)

(assert (=> b!571228 m!550327))

(assert (=> b!571230 m!550321))

(assert (=> b!571230 m!550321))

(declare-fun m!550329 () Bool)

(assert (=> b!571230 m!550329))

(assert (=> b!571235 m!550321))

(assert (=> b!571235 m!550321))

(declare-fun m!550331 () Bool)

(assert (=> b!571235 m!550331))

(declare-fun m!550333 () Bool)

(assert (=> b!571235 m!550333))

(declare-fun m!550335 () Bool)

(assert (=> b!571235 m!550335))

(assert (=> b!571226 m!550321))

(assert (=> b!571226 m!550321))

(declare-fun m!550337 () Bool)

(assert (=> b!571226 m!550337))

(assert (=> b!571232 m!550321))

(declare-fun m!550339 () Bool)

(assert (=> b!571232 m!550339))

(assert (=> b!571232 m!550321))

(declare-fun m!550341 () Bool)

(assert (=> b!571232 m!550341))

(declare-fun m!550343 () Bool)

(assert (=> b!571232 m!550343))

(declare-fun m!550345 () Bool)

(assert (=> b!571232 m!550345))

(declare-fun m!550347 () Bool)

(assert (=> b!571232 m!550347))

(assert (=> b!571232 m!550321))

(declare-fun m!550349 () Bool)

(assert (=> b!571232 m!550349))

(check-sat (not start!52362) (not b!571226) (not b!571237) (not b!571235) (not b!571229) (not b!571232) (not b!571230) (not b!571227) (not b!571228) (not b!571236) (not b!571233))
(check-sat)
(get-model)

(declare-fun d!84823 () Bool)

(declare-fun res!361002 () Bool)

(declare-fun e!328601 () Bool)

(assert (=> d!84823 (=> res!361002 e!328601)))

(assert (=> d!84823 (= res!361002 (= (select (arr!17173 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84823 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!328601)))

(declare-fun b!571326 () Bool)

(declare-fun e!328602 () Bool)

(assert (=> b!571326 (= e!328601 e!328602)))

(declare-fun res!361003 () Bool)

(assert (=> b!571326 (=> (not res!361003) (not e!328602))))

(assert (=> b!571326 (= res!361003 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17537 a!3118)))))

(declare-fun b!571327 () Bool)

(assert (=> b!571327 (= e!328602 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84823 (not res!361002)) b!571326))

(assert (= (and b!571326 res!361003) b!571327))

(declare-fun m!550439 () Bool)

(assert (=> d!84823 m!550439))

(declare-fun m!550441 () Bool)

(assert (=> b!571327 m!550441))

(assert (=> b!571236 d!84823))

(declare-fun b!571340 () Bool)

(declare-fun e!328611 () SeekEntryResult!5578)

(declare-fun e!328610 () SeekEntryResult!5578)

(assert (=> b!571340 (= e!328611 e!328610)))

(declare-fun lt!260541 () (_ BitVec 64))

(declare-fun c!65527 () Bool)

(assert (=> b!571340 (= c!65527 (= lt!260541 (select (arr!17173 a!3118) j!142)))))

(declare-fun b!571341 () Bool)

(declare-fun e!328609 () SeekEntryResult!5578)

(assert (=> b!571341 (= e!328609 (MissingVacant!5578 (index!24541 lt!260474)))))

(declare-fun b!571342 () Bool)

(declare-fun c!65528 () Bool)

(assert (=> b!571342 (= c!65528 (= lt!260541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571342 (= e!328610 e!328609)))

(declare-fun lt!260542 () SeekEntryResult!5578)

(declare-fun d!84825 () Bool)

(assert (=> d!84825 (and (or ((_ is Undefined!5578) lt!260542) (not ((_ is Found!5578) lt!260542)) (and (bvsge (index!24540 lt!260542) #b00000000000000000000000000000000) (bvslt (index!24540 lt!260542) (size!17537 a!3118)))) (or ((_ is Undefined!5578) lt!260542) ((_ is Found!5578) lt!260542) (not ((_ is MissingVacant!5578) lt!260542)) (not (= (index!24542 lt!260542) (index!24541 lt!260474))) (and (bvsge (index!24542 lt!260542) #b00000000000000000000000000000000) (bvslt (index!24542 lt!260542) (size!17537 a!3118)))) (or ((_ is Undefined!5578) lt!260542) (ite ((_ is Found!5578) lt!260542) (= (select (arr!17173 a!3118) (index!24540 lt!260542)) (select (arr!17173 a!3118) j!142)) (and ((_ is MissingVacant!5578) lt!260542) (= (index!24542 lt!260542) (index!24541 lt!260474)) (= (select (arr!17173 a!3118) (index!24542 lt!260542)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84825 (= lt!260542 e!328611)))

(declare-fun c!65526 () Bool)

(assert (=> d!84825 (= c!65526 (bvsge (x!53561 lt!260474) #b01111111111111111111111111111110))))

(assert (=> d!84825 (= lt!260541 (select (arr!17173 a!3118) (index!24541 lt!260474)))))

(assert (=> d!84825 (validMask!0 mask!3119)))

(assert (=> d!84825 (= (seekKeyOrZeroReturnVacant!0 (x!53561 lt!260474) (index!24541 lt!260474) (index!24541 lt!260474) (select (arr!17173 a!3118) j!142) a!3118 mask!3119) lt!260542)))

(declare-fun b!571343 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571343 (= e!328609 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53561 lt!260474) #b00000000000000000000000000000001) (nextIndex!0 (index!24541 lt!260474) (bvadd (x!53561 lt!260474) #b00000000000000000000000000000001) mask!3119) (index!24541 lt!260474) (select (arr!17173 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!571344 () Bool)

(assert (=> b!571344 (= e!328611 Undefined!5578)))

(declare-fun b!571345 () Bool)

(assert (=> b!571345 (= e!328610 (Found!5578 (index!24541 lt!260474)))))

(assert (= (and d!84825 c!65526) b!571344))

(assert (= (and d!84825 (not c!65526)) b!571340))

(assert (= (and b!571340 c!65527) b!571345))

(assert (= (and b!571340 (not c!65527)) b!571342))

(assert (= (and b!571342 c!65528) b!571341))

(assert (= (and b!571342 (not c!65528)) b!571343))

(declare-fun m!550443 () Bool)

(assert (=> d!84825 m!550443))

(declare-fun m!550445 () Bool)

(assert (=> d!84825 m!550445))

(assert (=> d!84825 m!550323))

(assert (=> d!84825 m!550309))

(declare-fun m!550447 () Bool)

(assert (=> b!571343 m!550447))

(assert (=> b!571343 m!550447))

(assert (=> b!571343 m!550321))

(declare-fun m!550449 () Bool)

(assert (=> b!571343 m!550449))

(assert (=> b!571226 d!84825))

(declare-fun b!571382 () Bool)

(declare-fun e!328641 () SeekEntryResult!5578)

(assert (=> b!571382 (= e!328641 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!260476 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) lt!260475 lt!260468 mask!3119))))

(declare-fun b!571383 () Bool)

(declare-fun e!328640 () Bool)

(declare-fun lt!260557 () SeekEntryResult!5578)

(assert (=> b!571383 (= e!328640 (bvsge (x!53561 lt!260557) #b01111111111111111111111111111110))))

(declare-fun b!571384 () Bool)

(assert (=> b!571384 (and (bvsge (index!24541 lt!260557) #b00000000000000000000000000000000) (bvslt (index!24541 lt!260557) (size!17537 lt!260468)))))

(declare-fun e!328639 () Bool)

(assert (=> b!571384 (= e!328639 (= (select (arr!17173 lt!260468) (index!24541 lt!260557)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!571385 () Bool)

(declare-fun e!328637 () Bool)

(assert (=> b!571385 (= e!328640 e!328637)))

(declare-fun res!361023 () Bool)

(assert (=> b!571385 (= res!361023 (and ((_ is Intermediate!5578) lt!260557) (not (undefined!6390 lt!260557)) (bvslt (x!53561 lt!260557) #b01111111111111111111111111111110) (bvsge (x!53561 lt!260557) #b00000000000000000000000000000000) (bvsge (x!53561 lt!260557) #b00000000000000000000000000000000)))))

(assert (=> b!571385 (=> (not res!361023) (not e!328637))))

(declare-fun b!571386 () Bool)

(assert (=> b!571386 (= e!328641 (Intermediate!5578 false lt!260476 #b00000000000000000000000000000000))))

(declare-fun b!571387 () Bool)

(declare-fun e!328638 () SeekEntryResult!5578)

(assert (=> b!571387 (= e!328638 (Intermediate!5578 true lt!260476 #b00000000000000000000000000000000))))

(declare-fun b!571388 () Bool)

(assert (=> b!571388 (and (bvsge (index!24541 lt!260557) #b00000000000000000000000000000000) (bvslt (index!24541 lt!260557) (size!17537 lt!260468)))))

(declare-fun res!361022 () Bool)

(assert (=> b!571388 (= res!361022 (= (select (arr!17173 lt!260468) (index!24541 lt!260557)) lt!260475))))

(assert (=> b!571388 (=> res!361022 e!328639)))

(assert (=> b!571388 (= e!328637 e!328639)))

(declare-fun b!571389 () Bool)

(assert (=> b!571389 (and (bvsge (index!24541 lt!260557) #b00000000000000000000000000000000) (bvslt (index!24541 lt!260557) (size!17537 lt!260468)))))

(declare-fun res!361024 () Bool)

(assert (=> b!571389 (= res!361024 (= (select (arr!17173 lt!260468) (index!24541 lt!260557)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571389 (=> res!361024 e!328639)))

(declare-fun b!571390 () Bool)

(assert (=> b!571390 (= e!328638 e!328641)))

(declare-fun c!65540 () Bool)

(declare-fun lt!260556 () (_ BitVec 64))

(assert (=> b!571390 (= c!65540 (or (= lt!260556 lt!260475) (= (bvadd lt!260556 lt!260556) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84827 () Bool)

(assert (=> d!84827 e!328640))

(declare-fun c!65538 () Bool)

(assert (=> d!84827 (= c!65538 (and ((_ is Intermediate!5578) lt!260557) (undefined!6390 lt!260557)))))

(assert (=> d!84827 (= lt!260557 e!328638)))

(declare-fun c!65539 () Bool)

(assert (=> d!84827 (= c!65539 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84827 (= lt!260556 (select (arr!17173 lt!260468) lt!260476))))

(assert (=> d!84827 (validMask!0 mask!3119)))

(assert (=> d!84827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260476 lt!260475 lt!260468 mask!3119) lt!260557)))

(assert (= (and d!84827 c!65539) b!571387))

(assert (= (and d!84827 (not c!65539)) b!571390))

(assert (= (and b!571390 c!65540) b!571386))

(assert (= (and b!571390 (not c!65540)) b!571382))

(assert (= (and d!84827 c!65538) b!571383))

(assert (= (and d!84827 (not c!65538)) b!571385))

(assert (= (and b!571385 res!361023) b!571388))

(assert (= (and b!571388 (not res!361022)) b!571389))

(assert (= (and b!571389 (not res!361024)) b!571384))

(declare-fun m!550467 () Bool)

(assert (=> b!571382 m!550467))

(assert (=> b!571382 m!550467))

(declare-fun m!550469 () Bool)

(assert (=> b!571382 m!550469))

(declare-fun m!550471 () Bool)

(assert (=> b!571389 m!550471))

(declare-fun m!550473 () Bool)

(assert (=> d!84827 m!550473))

(assert (=> d!84827 m!550309))

(assert (=> b!571384 m!550471))

(assert (=> b!571388 m!550471))

(assert (=> b!571232 d!84827))

(declare-fun e!328646 () SeekEntryResult!5578)

(declare-fun b!571391 () Bool)

(assert (=> b!571391 (= e!328646 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!260467 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17173 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!571392 () Bool)

(declare-fun e!328645 () Bool)

(declare-fun lt!260559 () SeekEntryResult!5578)

(assert (=> b!571392 (= e!328645 (bvsge (x!53561 lt!260559) #b01111111111111111111111111111110))))

(declare-fun b!571393 () Bool)

(assert (=> b!571393 (and (bvsge (index!24541 lt!260559) #b00000000000000000000000000000000) (bvslt (index!24541 lt!260559) (size!17537 a!3118)))))

(declare-fun e!328644 () Bool)

(assert (=> b!571393 (= e!328644 (= (select (arr!17173 a!3118) (index!24541 lt!260559)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!571394 () Bool)

(declare-fun e!328642 () Bool)

(assert (=> b!571394 (= e!328645 e!328642)))

(declare-fun res!361026 () Bool)

(assert (=> b!571394 (= res!361026 (and ((_ is Intermediate!5578) lt!260559) (not (undefined!6390 lt!260559)) (bvslt (x!53561 lt!260559) #b01111111111111111111111111111110) (bvsge (x!53561 lt!260559) #b00000000000000000000000000000000) (bvsge (x!53561 lt!260559) #b00000000000000000000000000000000)))))

(assert (=> b!571394 (=> (not res!361026) (not e!328642))))

(declare-fun b!571395 () Bool)

(assert (=> b!571395 (= e!328646 (Intermediate!5578 false lt!260467 #b00000000000000000000000000000000))))

(declare-fun b!571396 () Bool)

(declare-fun e!328643 () SeekEntryResult!5578)

(assert (=> b!571396 (= e!328643 (Intermediate!5578 true lt!260467 #b00000000000000000000000000000000))))

(declare-fun b!571397 () Bool)

(assert (=> b!571397 (and (bvsge (index!24541 lt!260559) #b00000000000000000000000000000000) (bvslt (index!24541 lt!260559) (size!17537 a!3118)))))

(declare-fun res!361025 () Bool)

(assert (=> b!571397 (= res!361025 (= (select (arr!17173 a!3118) (index!24541 lt!260559)) (select (arr!17173 a!3118) j!142)))))

(assert (=> b!571397 (=> res!361025 e!328644)))

(assert (=> b!571397 (= e!328642 e!328644)))

(declare-fun b!571398 () Bool)

(assert (=> b!571398 (and (bvsge (index!24541 lt!260559) #b00000000000000000000000000000000) (bvslt (index!24541 lt!260559) (size!17537 a!3118)))))

(declare-fun res!361027 () Bool)

(assert (=> b!571398 (= res!361027 (= (select (arr!17173 a!3118) (index!24541 lt!260559)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571398 (=> res!361027 e!328644)))

(declare-fun b!571399 () Bool)

(assert (=> b!571399 (= e!328643 e!328646)))

(declare-fun lt!260558 () (_ BitVec 64))

(declare-fun c!65543 () Bool)

(assert (=> b!571399 (= c!65543 (or (= lt!260558 (select (arr!17173 a!3118) j!142)) (= (bvadd lt!260558 lt!260558) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84837 () Bool)

(assert (=> d!84837 e!328645))

(declare-fun c!65541 () Bool)

(assert (=> d!84837 (= c!65541 (and ((_ is Intermediate!5578) lt!260559) (undefined!6390 lt!260559)))))

(assert (=> d!84837 (= lt!260559 e!328643)))

(declare-fun c!65542 () Bool)

(assert (=> d!84837 (= c!65542 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84837 (= lt!260558 (select (arr!17173 a!3118) lt!260467))))

(assert (=> d!84837 (validMask!0 mask!3119)))

(assert (=> d!84837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260467 (select (arr!17173 a!3118) j!142) a!3118 mask!3119) lt!260559)))

(assert (= (and d!84837 c!65542) b!571396))

(assert (= (and d!84837 (not c!65542)) b!571399))

(assert (= (and b!571399 c!65543) b!571395))

(assert (= (and b!571399 (not c!65543)) b!571391))

(assert (= (and d!84837 c!65541) b!571392))

(assert (= (and d!84837 (not c!65541)) b!571394))

(assert (= (and b!571394 res!361026) b!571397))

(assert (= (and b!571397 (not res!361025)) b!571398))

(assert (= (and b!571398 (not res!361027)) b!571393))

(declare-fun m!550475 () Bool)

(assert (=> b!571391 m!550475))

(assert (=> b!571391 m!550475))

(assert (=> b!571391 m!550321))

(declare-fun m!550477 () Bool)

(assert (=> b!571391 m!550477))

(declare-fun m!550479 () Bool)

(assert (=> b!571398 m!550479))

(declare-fun m!550481 () Bool)

(assert (=> d!84837 m!550481))

(assert (=> d!84837 m!550309))

(assert (=> b!571393 m!550479))

(assert (=> b!571397 m!550479))

(assert (=> b!571232 d!84837))

(declare-fun d!84839 () Bool)

(declare-fun lt!260565 () (_ BitVec 32))

(declare-fun lt!260564 () (_ BitVec 32))

(assert (=> d!84839 (= lt!260565 (bvmul (bvxor lt!260564 (bvlshr lt!260564 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84839 (= lt!260564 ((_ extract 31 0) (bvand (bvxor lt!260475 (bvlshr lt!260475 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84839 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!361028 (let ((h!12186 ((_ extract 31 0) (bvand (bvxor lt!260475 (bvlshr lt!260475 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53566 (bvmul (bvxor h!12186 (bvlshr h!12186 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53566 (bvlshr x!53566 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!361028 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!361028 #b00000000000000000000000000000000))))))

(assert (=> d!84839 (= (toIndex!0 lt!260475 mask!3119) (bvand (bvxor lt!260565 (bvlshr lt!260565 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!571232 d!84839))

(declare-fun d!84841 () Bool)

(declare-fun lt!260567 () (_ BitVec 32))

(declare-fun lt!260566 () (_ BitVec 32))

(assert (=> d!84841 (= lt!260567 (bvmul (bvxor lt!260566 (bvlshr lt!260566 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84841 (= lt!260566 ((_ extract 31 0) (bvand (bvxor (select (arr!17173 a!3118) j!142) (bvlshr (select (arr!17173 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84841 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!361028 (let ((h!12186 ((_ extract 31 0) (bvand (bvxor (select (arr!17173 a!3118) j!142) (bvlshr (select (arr!17173 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53566 (bvmul (bvxor h!12186 (bvlshr h!12186 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53566 (bvlshr x!53566 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!361028 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!361028 #b00000000000000000000000000000000))))))

(assert (=> d!84841 (= (toIndex!0 (select (arr!17173 a!3118) j!142) mask!3119) (bvand (bvxor lt!260567 (bvlshr lt!260567 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!571232 d!84841))

(declare-fun b!571438 () Bool)

(declare-fun e!328670 () Bool)

(declare-fun call!32613 () Bool)

(assert (=> b!571438 (= e!328670 call!32613)))

(declare-fun bm!32610 () Bool)

(assert (=> bm!32610 (= call!32613 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!571439 () Bool)

(declare-fun e!328669 () Bool)

(assert (=> b!571439 (= e!328669 e!328670)))

(declare-fun lt!260590 () (_ BitVec 64))

(assert (=> b!571439 (= lt!260590 (select (arr!17173 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!260591 () Unit!17929)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35769 (_ BitVec 64) (_ BitVec 32)) Unit!17929)

(assert (=> b!571439 (= lt!260591 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!260590 #b00000000000000000000000000000000))))

(assert (=> b!571439 (arrayContainsKey!0 a!3118 lt!260590 #b00000000000000000000000000000000)))

(declare-fun lt!260589 () Unit!17929)

(assert (=> b!571439 (= lt!260589 lt!260591)))

(declare-fun res!361033 () Bool)

(assert (=> b!571439 (= res!361033 (= (seekEntryOrOpen!0 (select (arr!17173 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5578 #b00000000000000000000000000000000)))))

(assert (=> b!571439 (=> (not res!361033) (not e!328670))))

(declare-fun b!571440 () Bool)

(assert (=> b!571440 (= e!328669 call!32613)))

(declare-fun d!84843 () Bool)

(declare-fun res!361034 () Bool)

(declare-fun e!328668 () Bool)

(assert (=> d!84843 (=> res!361034 e!328668)))

(assert (=> d!84843 (= res!361034 (bvsge #b00000000000000000000000000000000 (size!17537 a!3118)))))

(assert (=> d!84843 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!328668)))

(declare-fun b!571441 () Bool)

(assert (=> b!571441 (= e!328668 e!328669)))

(declare-fun c!65561 () Bool)

(assert (=> b!571441 (= c!65561 (validKeyInArray!0 (select (arr!17173 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84843 (not res!361034)) b!571441))

(assert (= (and b!571441 c!65561) b!571439))

(assert (= (and b!571441 (not c!65561)) b!571440))

(assert (= (and b!571439 res!361033) b!571438))

(assert (= (or b!571438 b!571440) bm!32610))

(declare-fun m!550483 () Bool)

(assert (=> bm!32610 m!550483))

(assert (=> b!571439 m!550439))

(declare-fun m!550485 () Bool)

(assert (=> b!571439 m!550485))

(declare-fun m!550487 () Bool)

(assert (=> b!571439 m!550487))

(assert (=> b!571439 m!550439))

(declare-fun m!550489 () Bool)

(assert (=> b!571439 m!550489))

(assert (=> b!571441 m!550439))

(assert (=> b!571441 m!550439))

(declare-fun m!550493 () Bool)

(assert (=> b!571441 m!550493))

(assert (=> b!571237 d!84843))

(declare-fun d!84845 () Bool)

(assert (=> d!84845 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52362 d!84845))

(declare-fun d!84853 () Bool)

(assert (=> d!84853 (= (array_inv!13032 a!3118) (bvsge (size!17537 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52362 d!84853))

(declare-fun b!571512 () Bool)

(declare-fun e!328707 () SeekEntryResult!5578)

(declare-fun lt!260626 () SeekEntryResult!5578)

(assert (=> b!571512 (= e!328707 (Found!5578 (index!24541 lt!260626)))))

(declare-fun e!328709 () SeekEntryResult!5578)

(declare-fun b!571513 () Bool)

(assert (=> b!571513 (= e!328709 (seekKeyOrZeroReturnVacant!0 (x!53561 lt!260626) (index!24541 lt!260626) (index!24541 lt!260626) lt!260475 lt!260468 mask!3119))))

(declare-fun b!571514 () Bool)

(declare-fun e!328708 () SeekEntryResult!5578)

(assert (=> b!571514 (= e!328708 e!328707)))

(declare-fun lt!260627 () (_ BitVec 64))

(assert (=> b!571514 (= lt!260627 (select (arr!17173 lt!260468) (index!24541 lt!260626)))))

(declare-fun c!65597 () Bool)

(assert (=> b!571514 (= c!65597 (= lt!260627 lt!260475))))

(declare-fun b!571515 () Bool)

(declare-fun c!65598 () Bool)

(assert (=> b!571515 (= c!65598 (= lt!260627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571515 (= e!328707 e!328709)))

(declare-fun b!571516 () Bool)

(assert (=> b!571516 (= e!328709 (MissingZero!5578 (index!24541 lt!260626)))))

(declare-fun d!84855 () Bool)

(declare-fun lt!260625 () SeekEntryResult!5578)

(assert (=> d!84855 (and (or ((_ is Undefined!5578) lt!260625) (not ((_ is Found!5578) lt!260625)) (and (bvsge (index!24540 lt!260625) #b00000000000000000000000000000000) (bvslt (index!24540 lt!260625) (size!17537 lt!260468)))) (or ((_ is Undefined!5578) lt!260625) ((_ is Found!5578) lt!260625) (not ((_ is MissingZero!5578) lt!260625)) (and (bvsge (index!24539 lt!260625) #b00000000000000000000000000000000) (bvslt (index!24539 lt!260625) (size!17537 lt!260468)))) (or ((_ is Undefined!5578) lt!260625) ((_ is Found!5578) lt!260625) ((_ is MissingZero!5578) lt!260625) (not ((_ is MissingVacant!5578) lt!260625)) (and (bvsge (index!24542 lt!260625) #b00000000000000000000000000000000) (bvslt (index!24542 lt!260625) (size!17537 lt!260468)))) (or ((_ is Undefined!5578) lt!260625) (ite ((_ is Found!5578) lt!260625) (= (select (arr!17173 lt!260468) (index!24540 lt!260625)) lt!260475) (ite ((_ is MissingZero!5578) lt!260625) (= (select (arr!17173 lt!260468) (index!24539 lt!260625)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5578) lt!260625) (= (select (arr!17173 lt!260468) (index!24542 lt!260625)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84855 (= lt!260625 e!328708)))

(declare-fun c!65596 () Bool)

(assert (=> d!84855 (= c!65596 (and ((_ is Intermediate!5578) lt!260626) (undefined!6390 lt!260626)))))

(assert (=> d!84855 (= lt!260626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!260475 mask!3119) lt!260475 lt!260468 mask!3119))))

(assert (=> d!84855 (validMask!0 mask!3119)))

(assert (=> d!84855 (= (seekEntryOrOpen!0 lt!260475 lt!260468 mask!3119) lt!260625)))

(declare-fun b!571517 () Bool)

(assert (=> b!571517 (= e!328708 Undefined!5578)))

(assert (= (and d!84855 c!65596) b!571517))

(assert (= (and d!84855 (not c!65596)) b!571514))

(assert (= (and b!571514 c!65597) b!571512))

(assert (= (and b!571514 (not c!65597)) b!571515))

(assert (= (and b!571515 c!65598) b!571516))

(assert (= (and b!571515 (not c!65598)) b!571513))

(declare-fun m!550567 () Bool)

(assert (=> b!571513 m!550567))

(declare-fun m!550569 () Bool)

(assert (=> b!571514 m!550569))

(assert (=> d!84855 m!550309))

(declare-fun m!550571 () Bool)

(assert (=> d!84855 m!550571))

(declare-fun m!550573 () Bool)

(assert (=> d!84855 m!550573))

(assert (=> d!84855 m!550347))

(declare-fun m!550575 () Bool)

(assert (=> d!84855 m!550575))

(assert (=> d!84855 m!550347))

(declare-fun m!550577 () Bool)

(assert (=> d!84855 m!550577))

(assert (=> b!571227 d!84855))

(declare-fun b!571518 () Bool)

(declare-fun e!328712 () SeekEntryResult!5578)

(declare-fun e!328711 () SeekEntryResult!5578)

(assert (=> b!571518 (= e!328712 e!328711)))

(declare-fun c!65600 () Bool)

(declare-fun lt!260628 () (_ BitVec 64))

(assert (=> b!571518 (= c!65600 (= lt!260628 lt!260475))))

(declare-fun b!571519 () Bool)

(declare-fun e!328710 () SeekEntryResult!5578)

(assert (=> b!571519 (= e!328710 (MissingVacant!5578 (index!24541 lt!260474)))))

(declare-fun b!571520 () Bool)

(declare-fun c!65601 () Bool)

(assert (=> b!571520 (= c!65601 (= lt!260628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571520 (= e!328711 e!328710)))

(declare-fun d!84873 () Bool)

(declare-fun lt!260629 () SeekEntryResult!5578)

(assert (=> d!84873 (and (or ((_ is Undefined!5578) lt!260629) (not ((_ is Found!5578) lt!260629)) (and (bvsge (index!24540 lt!260629) #b00000000000000000000000000000000) (bvslt (index!24540 lt!260629) (size!17537 lt!260468)))) (or ((_ is Undefined!5578) lt!260629) ((_ is Found!5578) lt!260629) (not ((_ is MissingVacant!5578) lt!260629)) (not (= (index!24542 lt!260629) (index!24541 lt!260474))) (and (bvsge (index!24542 lt!260629) #b00000000000000000000000000000000) (bvslt (index!24542 lt!260629) (size!17537 lt!260468)))) (or ((_ is Undefined!5578) lt!260629) (ite ((_ is Found!5578) lt!260629) (= (select (arr!17173 lt!260468) (index!24540 lt!260629)) lt!260475) (and ((_ is MissingVacant!5578) lt!260629) (= (index!24542 lt!260629) (index!24541 lt!260474)) (= (select (arr!17173 lt!260468) (index!24542 lt!260629)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84873 (= lt!260629 e!328712)))

(declare-fun c!65599 () Bool)

(assert (=> d!84873 (= c!65599 (bvsge (x!53561 lt!260474) #b01111111111111111111111111111110))))

(assert (=> d!84873 (= lt!260628 (select (arr!17173 lt!260468) (index!24541 lt!260474)))))

(assert (=> d!84873 (validMask!0 mask!3119)))

(assert (=> d!84873 (= (seekKeyOrZeroReturnVacant!0 (x!53561 lt!260474) (index!24541 lt!260474) (index!24541 lt!260474) lt!260475 lt!260468 mask!3119) lt!260629)))

(declare-fun b!571521 () Bool)

(assert (=> b!571521 (= e!328710 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53561 lt!260474) #b00000000000000000000000000000001) (nextIndex!0 (index!24541 lt!260474) (bvadd (x!53561 lt!260474) #b00000000000000000000000000000001) mask!3119) (index!24541 lt!260474) lt!260475 lt!260468 mask!3119))))

(declare-fun b!571522 () Bool)

(assert (=> b!571522 (= e!328712 Undefined!5578)))

(declare-fun b!571523 () Bool)

(assert (=> b!571523 (= e!328711 (Found!5578 (index!24541 lt!260474)))))

(assert (= (and d!84873 c!65599) b!571522))

(assert (= (and d!84873 (not c!65599)) b!571518))

(assert (= (and b!571518 c!65600) b!571523))

(assert (= (and b!571518 (not c!65600)) b!571520))

(assert (= (and b!571520 c!65601) b!571519))

(assert (= (and b!571520 (not c!65601)) b!571521))

(declare-fun m!550579 () Bool)

(assert (=> d!84873 m!550579))

(declare-fun m!550581 () Bool)

(assert (=> d!84873 m!550581))

(declare-fun m!550583 () Bool)

(assert (=> d!84873 m!550583))

(assert (=> d!84873 m!550309))

(assert (=> b!571521 m!550447))

(assert (=> b!571521 m!550447))

(declare-fun m!550585 () Bool)

(assert (=> b!571521 m!550585))

(assert (=> b!571227 d!84873))

(declare-fun b!571550 () Bool)

(declare-fun e!328732 () Bool)

(declare-fun e!328733 () Bool)

(assert (=> b!571550 (= e!328732 e!328733)))

(declare-fun c!65609 () Bool)

(assert (=> b!571550 (= c!65609 (validKeyInArray!0 (select (arr!17173 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32616 () Bool)

(declare-fun call!32619 () Bool)

(assert (=> bm!32616 (= call!32619 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65609 (Cons!11156 (select (arr!17173 a!3118) #b00000000000000000000000000000000) Nil!11157) Nil!11157)))))

(declare-fun d!84875 () Bool)

(declare-fun res!361049 () Bool)

(declare-fun e!328735 () Bool)

(assert (=> d!84875 (=> res!361049 e!328735)))

(assert (=> d!84875 (= res!361049 (bvsge #b00000000000000000000000000000000 (size!17537 a!3118)))))

(assert (=> d!84875 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11157) e!328735)))

(declare-fun b!571551 () Bool)

(assert (=> b!571551 (= e!328733 call!32619)))

(declare-fun b!571552 () Bool)

(declare-fun e!328734 () Bool)

(declare-fun contains!2852 (List!11160 (_ BitVec 64)) Bool)

(assert (=> b!571552 (= e!328734 (contains!2852 Nil!11157 (select (arr!17173 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!571553 () Bool)

(assert (=> b!571553 (= e!328735 e!328732)))

(declare-fun res!361051 () Bool)

(assert (=> b!571553 (=> (not res!361051) (not e!328732))))

(assert (=> b!571553 (= res!361051 (not e!328734))))

(declare-fun res!361050 () Bool)

(assert (=> b!571553 (=> (not res!361050) (not e!328734))))

(assert (=> b!571553 (= res!361050 (validKeyInArray!0 (select (arr!17173 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!571554 () Bool)

(assert (=> b!571554 (= e!328733 call!32619)))

(assert (= (and d!84875 (not res!361049)) b!571553))

(assert (= (and b!571553 res!361050) b!571552))

(assert (= (and b!571553 res!361051) b!571550))

(assert (= (and b!571550 c!65609) b!571554))

(assert (= (and b!571550 (not c!65609)) b!571551))

(assert (= (or b!571554 b!571551) bm!32616))

(assert (=> b!571550 m!550439))

(assert (=> b!571550 m!550439))

(assert (=> b!571550 m!550493))

(assert (=> bm!32616 m!550439))

(declare-fun m!550597 () Bool)

(assert (=> bm!32616 m!550597))

(assert (=> b!571552 m!550439))

(assert (=> b!571552 m!550439))

(declare-fun m!550599 () Bool)

(assert (=> b!571552 m!550599))

(assert (=> b!571553 m!550439))

(assert (=> b!571553 m!550439))

(assert (=> b!571553 m!550493))

(assert (=> b!571228 d!84875))

(declare-fun b!571555 () Bool)

(declare-fun e!328736 () SeekEntryResult!5578)

(declare-fun lt!260633 () SeekEntryResult!5578)

(assert (=> b!571555 (= e!328736 (Found!5578 (index!24541 lt!260633)))))

(declare-fun e!328738 () SeekEntryResult!5578)

(declare-fun b!571556 () Bool)

(assert (=> b!571556 (= e!328738 (seekKeyOrZeroReturnVacant!0 (x!53561 lt!260633) (index!24541 lt!260633) (index!24541 lt!260633) k0!1914 a!3118 mask!3119))))

(declare-fun b!571557 () Bool)

(declare-fun e!328737 () SeekEntryResult!5578)

(assert (=> b!571557 (= e!328737 e!328736)))

(declare-fun lt!260634 () (_ BitVec 64))

(assert (=> b!571557 (= lt!260634 (select (arr!17173 a!3118) (index!24541 lt!260633)))))

(declare-fun c!65611 () Bool)

(assert (=> b!571557 (= c!65611 (= lt!260634 k0!1914))))

(declare-fun b!571558 () Bool)

(declare-fun c!65612 () Bool)

(assert (=> b!571558 (= c!65612 (= lt!260634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571558 (= e!328736 e!328738)))

(declare-fun b!571559 () Bool)

(assert (=> b!571559 (= e!328738 (MissingZero!5578 (index!24541 lt!260633)))))

(declare-fun d!84881 () Bool)

(declare-fun lt!260632 () SeekEntryResult!5578)

(assert (=> d!84881 (and (or ((_ is Undefined!5578) lt!260632) (not ((_ is Found!5578) lt!260632)) (and (bvsge (index!24540 lt!260632) #b00000000000000000000000000000000) (bvslt (index!24540 lt!260632) (size!17537 a!3118)))) (or ((_ is Undefined!5578) lt!260632) ((_ is Found!5578) lt!260632) (not ((_ is MissingZero!5578) lt!260632)) (and (bvsge (index!24539 lt!260632) #b00000000000000000000000000000000) (bvslt (index!24539 lt!260632) (size!17537 a!3118)))) (or ((_ is Undefined!5578) lt!260632) ((_ is Found!5578) lt!260632) ((_ is MissingZero!5578) lt!260632) (not ((_ is MissingVacant!5578) lt!260632)) (and (bvsge (index!24542 lt!260632) #b00000000000000000000000000000000) (bvslt (index!24542 lt!260632) (size!17537 a!3118)))) (or ((_ is Undefined!5578) lt!260632) (ite ((_ is Found!5578) lt!260632) (= (select (arr!17173 a!3118) (index!24540 lt!260632)) k0!1914) (ite ((_ is MissingZero!5578) lt!260632) (= (select (arr!17173 a!3118) (index!24539 lt!260632)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5578) lt!260632) (= (select (arr!17173 a!3118) (index!24542 lt!260632)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84881 (= lt!260632 e!328737)))

(declare-fun c!65610 () Bool)

(assert (=> d!84881 (= c!65610 (and ((_ is Intermediate!5578) lt!260633) (undefined!6390 lt!260633)))))

(assert (=> d!84881 (= lt!260633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84881 (validMask!0 mask!3119)))

(assert (=> d!84881 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!260632)))

(declare-fun b!571560 () Bool)

(assert (=> b!571560 (= e!328737 Undefined!5578)))

(assert (= (and d!84881 c!65610) b!571560))

(assert (= (and d!84881 (not c!65610)) b!571557))

(assert (= (and b!571557 c!65611) b!571555))

(assert (= (and b!571557 (not c!65611)) b!571558))

(assert (= (and b!571558 c!65612) b!571559))

(assert (= (and b!571558 (not c!65612)) b!571556))

(declare-fun m!550601 () Bool)

(assert (=> b!571556 m!550601))

(declare-fun m!550603 () Bool)

(assert (=> b!571557 m!550603))

(assert (=> d!84881 m!550309))

(declare-fun m!550605 () Bool)

(assert (=> d!84881 m!550605))

(declare-fun m!550607 () Bool)

(assert (=> d!84881 m!550607))

(declare-fun m!550609 () Bool)

(assert (=> d!84881 m!550609))

(declare-fun m!550611 () Bool)

(assert (=> d!84881 m!550611))

(assert (=> d!84881 m!550609))

(declare-fun m!550613 () Bool)

(assert (=> d!84881 m!550613))

(assert (=> b!571233 d!84881))

(declare-fun d!84883 () Bool)

(assert (=> d!84883 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!571229 d!84883))

(declare-fun d!84887 () Bool)

(assert (=> d!84887 (= (validKeyInArray!0 (select (arr!17173 a!3118) j!142)) (and (not (= (select (arr!17173 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17173 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!571230 d!84887))

(declare-fun b!571572 () Bool)

(declare-fun e!328746 () SeekEntryResult!5578)

(declare-fun lt!260638 () SeekEntryResult!5578)

(assert (=> b!571572 (= e!328746 (Found!5578 (index!24541 lt!260638)))))

(declare-fun b!571573 () Bool)

(declare-fun e!328748 () SeekEntryResult!5578)

(assert (=> b!571573 (= e!328748 (seekKeyOrZeroReturnVacant!0 (x!53561 lt!260638) (index!24541 lt!260638) (index!24541 lt!260638) (select (arr!17173 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!571574 () Bool)

(declare-fun e!328747 () SeekEntryResult!5578)

(assert (=> b!571574 (= e!328747 e!328746)))

(declare-fun lt!260639 () (_ BitVec 64))

(assert (=> b!571574 (= lt!260639 (select (arr!17173 a!3118) (index!24541 lt!260638)))))

(declare-fun c!65618 () Bool)

(assert (=> b!571574 (= c!65618 (= lt!260639 (select (arr!17173 a!3118) j!142)))))

(declare-fun b!571575 () Bool)

(declare-fun c!65619 () Bool)

(assert (=> b!571575 (= c!65619 (= lt!260639 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571575 (= e!328746 e!328748)))

(declare-fun b!571576 () Bool)

(assert (=> b!571576 (= e!328748 (MissingZero!5578 (index!24541 lt!260638)))))

(declare-fun d!84889 () Bool)

(declare-fun lt!260637 () SeekEntryResult!5578)

(assert (=> d!84889 (and (or ((_ is Undefined!5578) lt!260637) (not ((_ is Found!5578) lt!260637)) (and (bvsge (index!24540 lt!260637) #b00000000000000000000000000000000) (bvslt (index!24540 lt!260637) (size!17537 a!3118)))) (or ((_ is Undefined!5578) lt!260637) ((_ is Found!5578) lt!260637) (not ((_ is MissingZero!5578) lt!260637)) (and (bvsge (index!24539 lt!260637) #b00000000000000000000000000000000) (bvslt (index!24539 lt!260637) (size!17537 a!3118)))) (or ((_ is Undefined!5578) lt!260637) ((_ is Found!5578) lt!260637) ((_ is MissingZero!5578) lt!260637) (not ((_ is MissingVacant!5578) lt!260637)) (and (bvsge (index!24542 lt!260637) #b00000000000000000000000000000000) (bvslt (index!24542 lt!260637) (size!17537 a!3118)))) (or ((_ is Undefined!5578) lt!260637) (ite ((_ is Found!5578) lt!260637) (= (select (arr!17173 a!3118) (index!24540 lt!260637)) (select (arr!17173 a!3118) j!142)) (ite ((_ is MissingZero!5578) lt!260637) (= (select (arr!17173 a!3118) (index!24539 lt!260637)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5578) lt!260637) (= (select (arr!17173 a!3118) (index!24542 lt!260637)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84889 (= lt!260637 e!328747)))

(declare-fun c!65617 () Bool)

(assert (=> d!84889 (= c!65617 (and ((_ is Intermediate!5578) lt!260638) (undefined!6390 lt!260638)))))

(assert (=> d!84889 (= lt!260638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17173 a!3118) j!142) mask!3119) (select (arr!17173 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84889 (validMask!0 mask!3119)))

(assert (=> d!84889 (= (seekEntryOrOpen!0 (select (arr!17173 a!3118) j!142) a!3118 mask!3119) lt!260637)))

(declare-fun b!571577 () Bool)

(assert (=> b!571577 (= e!328747 Undefined!5578)))

(assert (= (and d!84889 c!65617) b!571577))

(assert (= (and d!84889 (not c!65617)) b!571574))

(assert (= (and b!571574 c!65618) b!571572))

(assert (= (and b!571574 (not c!65618)) b!571575))

(assert (= (and b!571575 c!65619) b!571576))

(assert (= (and b!571575 (not c!65619)) b!571573))

(assert (=> b!571573 m!550321))

(declare-fun m!550627 () Bool)

(assert (=> b!571573 m!550627))

(declare-fun m!550629 () Bool)

(assert (=> b!571574 m!550629))

(assert (=> d!84889 m!550309))

(declare-fun m!550631 () Bool)

(assert (=> d!84889 m!550631))

(declare-fun m!550633 () Bool)

(assert (=> d!84889 m!550633))

(assert (=> d!84889 m!550339))

(assert (=> d!84889 m!550321))

(declare-fun m!550635 () Bool)

(assert (=> d!84889 m!550635))

(assert (=> d!84889 m!550321))

(assert (=> d!84889 m!550339))

(declare-fun m!550637 () Bool)

(assert (=> d!84889 m!550637))

(assert (=> b!571235 d!84889))

(declare-fun b!571586 () Bool)

(declare-fun e!328755 () Bool)

(declare-fun call!32621 () Bool)

(assert (=> b!571586 (= e!328755 call!32621)))

(declare-fun bm!32618 () Bool)

(assert (=> bm!32618 (= call!32621 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!571587 () Bool)

(declare-fun e!328754 () Bool)

(assert (=> b!571587 (= e!328754 e!328755)))

(declare-fun lt!260645 () (_ BitVec 64))

(assert (=> b!571587 (= lt!260645 (select (arr!17173 a!3118) j!142))))

(declare-fun lt!260646 () Unit!17929)

(assert (=> b!571587 (= lt!260646 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!260645 j!142))))

(assert (=> b!571587 (arrayContainsKey!0 a!3118 lt!260645 #b00000000000000000000000000000000)))

(declare-fun lt!260644 () Unit!17929)

(assert (=> b!571587 (= lt!260644 lt!260646)))

(declare-fun res!361055 () Bool)

(assert (=> b!571587 (= res!361055 (= (seekEntryOrOpen!0 (select (arr!17173 a!3118) j!142) a!3118 mask!3119) (Found!5578 j!142)))))

(assert (=> b!571587 (=> (not res!361055) (not e!328755))))

(declare-fun b!571588 () Bool)

(assert (=> b!571588 (= e!328754 call!32621)))

(declare-fun d!84893 () Bool)

(declare-fun res!361056 () Bool)

(declare-fun e!328753 () Bool)

(assert (=> d!84893 (=> res!361056 e!328753)))

(assert (=> d!84893 (= res!361056 (bvsge j!142 (size!17537 a!3118)))))

(assert (=> d!84893 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!328753)))

(declare-fun b!571589 () Bool)

(assert (=> b!571589 (= e!328753 e!328754)))

(declare-fun c!65624 () Bool)

(assert (=> b!571589 (= c!65624 (validKeyInArray!0 (select (arr!17173 a!3118) j!142)))))

(assert (= (and d!84893 (not res!361056)) b!571589))

(assert (= (and b!571589 c!65624) b!571587))

(assert (= (and b!571589 (not c!65624)) b!571588))

(assert (= (and b!571587 res!361055) b!571586))

(assert (= (or b!571586 b!571588) bm!32618))

(declare-fun m!550639 () Bool)

(assert (=> bm!32618 m!550639))

(assert (=> b!571587 m!550321))

(declare-fun m!550641 () Bool)

(assert (=> b!571587 m!550641))

(declare-fun m!550643 () Bool)

(assert (=> b!571587 m!550643))

(assert (=> b!571587 m!550321))

(assert (=> b!571587 m!550331))

(assert (=> b!571589 m!550321))

(assert (=> b!571589 m!550321))

(assert (=> b!571589 m!550329))

(assert (=> b!571235 d!84893))

(declare-fun d!84895 () Bool)

(assert (=> d!84895 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!260651 () Unit!17929)

(declare-fun choose!38 (array!35769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17929)

(assert (=> d!84895 (= lt!260651 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84895 (validMask!0 mask!3119)))

(assert (=> d!84895 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!260651)))

(declare-fun bs!17730 () Bool)

(assert (= bs!17730 d!84895))

(assert (=> bs!17730 m!550333))

(declare-fun m!550645 () Bool)

(assert (=> bs!17730 m!550645))

(assert (=> bs!17730 m!550309))

(assert (=> b!571235 d!84895))

(check-sat (not b!571521) (not d!84895) (not bm!32618) (not b!571327) (not d!84837) (not d!84873) (not d!84881) (not b!571552) (not bm!32616) (not d!84889) (not b!571550) (not d!84827) (not b!571587) (not b!571556) (not d!84825) (not b!571441) (not bm!32610) (not b!571513) (not b!571391) (not d!84855) (not b!571439) (not b!571589) (not b!571343) (not b!571382) (not b!571553) (not b!571573))
(check-sat)
