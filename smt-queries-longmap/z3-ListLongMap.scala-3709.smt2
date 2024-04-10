; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50992 () Bool)

(assert start!50992)

(declare-fun b!557441 () Bool)

(declare-fun res!349489 () Bool)

(declare-fun e!321138 () Bool)

(assert (=> b!557441 (=> (not res!349489) (not e!321138))))

(declare-datatypes ((array!35103 0))(
  ( (array!35104 (arr!16858 (Array (_ BitVec 32) (_ BitVec 64))) (size!17222 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35103)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35103 (_ BitVec 32)) Bool)

(assert (=> b!557441 (= res!349489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557442 () Bool)

(declare-fun res!349491 () Bool)

(declare-fun e!321137 () Bool)

(assert (=> b!557442 (=> (not res!349491) (not e!321137))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557442 (= res!349491 (and (= (size!17222 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17222 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17222 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557443 () Bool)

(declare-datatypes ((SeekEntryResult!5307 0))(
  ( (MissingZero!5307 (index!23455 (_ BitVec 32))) (Found!5307 (index!23456 (_ BitVec 32))) (Intermediate!5307 (undefined!6119 Bool) (index!23457 (_ BitVec 32)) (x!52353 (_ BitVec 32))) (Undefined!5307) (MissingVacant!5307 (index!23458 (_ BitVec 32))) )
))
(declare-fun lt!253299 () SeekEntryResult!5307)

(declare-fun e!321141 () Bool)

(get-info :version)

(assert (=> b!557443 (= e!321141 (not (or (not ((_ is Intermediate!5307) lt!253299)) (undefined!6119 lt!253299) (= (select (arr!16858 a!3118) (index!23457 lt!253299)) (select (arr!16858 a!3118) j!142)) (= (select (arr!16858 a!3118) (index!23457 lt!253299)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23457 lt!253299) #b00000000000000000000000000000000) (bvsge (index!23457 lt!253299) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52353 lt!253299) #b01111111111111111111111111111110) (bvslt (x!52353 lt!253299) #b00000000000000000000000000000000) (= (select (arr!16858 a!3118) (index!23457 lt!253299)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!321140 () Bool)

(assert (=> b!557443 e!321140))

(declare-fun res!349492 () Bool)

(assert (=> b!557443 (=> (not res!349492) (not e!321140))))

(assert (=> b!557443 (= res!349492 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17388 0))(
  ( (Unit!17389) )
))
(declare-fun lt!253303 () Unit!17388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17388)

(assert (=> b!557443 (= lt!253303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557444 () Bool)

(declare-fun res!349494 () Bool)

(assert (=> b!557444 (=> (not res!349494) (not e!321137))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557444 (= res!349494 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!349487 () Bool)

(assert (=> start!50992 (=> (not res!349487) (not e!321137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50992 (= res!349487 (validMask!0 mask!3119))))

(assert (=> start!50992 e!321137))

(assert (=> start!50992 true))

(declare-fun array_inv!12654 (array!35103) Bool)

(assert (=> start!50992 (array_inv!12654 a!3118)))

(declare-fun b!557445 () Bool)

(assert (=> b!557445 (= e!321137 e!321138)))

(declare-fun res!349493 () Bool)

(assert (=> b!557445 (=> (not res!349493) (not e!321138))))

(declare-fun lt!253302 () SeekEntryResult!5307)

(assert (=> b!557445 (= res!349493 (or (= lt!253302 (MissingZero!5307 i!1132)) (= lt!253302 (MissingVacant!5307 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35103 (_ BitVec 32)) SeekEntryResult!5307)

(assert (=> b!557445 (= lt!253302 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557446 () Bool)

(assert (=> b!557446 (= e!321138 e!321141)))

(declare-fun res!349490 () Bool)

(assert (=> b!557446 (=> (not res!349490) (not e!321141))))

(declare-fun lt!253301 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35103 (_ BitVec 32)) SeekEntryResult!5307)

(assert (=> b!557446 (= res!349490 (= lt!253299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253301 (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142) (array!35104 (store (arr!16858 a!3118) i!1132 k0!1914) (size!17222 a!3118)) mask!3119)))))

(declare-fun lt!253300 () (_ BitVec 32))

(assert (=> b!557446 (= lt!253299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253300 (select (arr!16858 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557446 (= lt!253301 (toIndex!0 (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!557446 (= lt!253300 (toIndex!0 (select (arr!16858 a!3118) j!142) mask!3119))))

(declare-fun b!557447 () Bool)

(declare-fun res!349495 () Bool)

(assert (=> b!557447 (=> (not res!349495) (not e!321138))))

(declare-datatypes ((List!10938 0))(
  ( (Nil!10935) (Cons!10934 (h!11925 (_ BitVec 64)) (t!17166 List!10938)) )
))
(declare-fun arrayNoDuplicates!0 (array!35103 (_ BitVec 32) List!10938) Bool)

(assert (=> b!557447 (= res!349495 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10935))))

(declare-fun b!557448 () Bool)

(declare-fun res!349496 () Bool)

(assert (=> b!557448 (=> (not res!349496) (not e!321137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557448 (= res!349496 (validKeyInArray!0 (select (arr!16858 a!3118) j!142)))))

(declare-fun b!557449 () Bool)

(assert (=> b!557449 (= e!321140 (= (seekEntryOrOpen!0 (select (arr!16858 a!3118) j!142) a!3118 mask!3119) (Found!5307 j!142)))))

(declare-fun b!557450 () Bool)

(declare-fun res!349488 () Bool)

(assert (=> b!557450 (=> (not res!349488) (not e!321137))))

(assert (=> b!557450 (= res!349488 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50992 res!349487) b!557442))

(assert (= (and b!557442 res!349491) b!557448))

(assert (= (and b!557448 res!349496) b!557450))

(assert (= (and b!557450 res!349488) b!557444))

(assert (= (and b!557444 res!349494) b!557445))

(assert (= (and b!557445 res!349493) b!557441))

(assert (= (and b!557441 res!349489) b!557447))

(assert (= (and b!557447 res!349495) b!557446))

(assert (= (and b!557446 res!349490) b!557443))

(assert (= (and b!557443 res!349492) b!557449))

(declare-fun m!535361 () Bool)

(assert (=> b!557449 m!535361))

(assert (=> b!557449 m!535361))

(declare-fun m!535363 () Bool)

(assert (=> b!557449 m!535363))

(declare-fun m!535365 () Bool)

(assert (=> b!557450 m!535365))

(declare-fun m!535367 () Bool)

(assert (=> b!557441 m!535367))

(assert (=> b!557448 m!535361))

(assert (=> b!557448 m!535361))

(declare-fun m!535369 () Bool)

(assert (=> b!557448 m!535369))

(declare-fun m!535371 () Bool)

(assert (=> b!557444 m!535371))

(declare-fun m!535373 () Bool)

(assert (=> b!557443 m!535373))

(assert (=> b!557443 m!535361))

(declare-fun m!535375 () Bool)

(assert (=> b!557443 m!535375))

(declare-fun m!535377 () Bool)

(assert (=> b!557443 m!535377))

(assert (=> b!557446 m!535361))

(declare-fun m!535379 () Bool)

(assert (=> b!557446 m!535379))

(declare-fun m!535381 () Bool)

(assert (=> b!557446 m!535381))

(declare-fun m!535383 () Bool)

(assert (=> b!557446 m!535383))

(assert (=> b!557446 m!535361))

(declare-fun m!535385 () Bool)

(assert (=> b!557446 m!535385))

(assert (=> b!557446 m!535361))

(assert (=> b!557446 m!535381))

(declare-fun m!535387 () Bool)

(assert (=> b!557446 m!535387))

(assert (=> b!557446 m!535381))

(declare-fun m!535389 () Bool)

(assert (=> b!557446 m!535389))

(declare-fun m!535391 () Bool)

(assert (=> start!50992 m!535391))

(declare-fun m!535393 () Bool)

(assert (=> start!50992 m!535393))

(declare-fun m!535395 () Bool)

(assert (=> b!557447 m!535395))

(declare-fun m!535397 () Bool)

(assert (=> b!557445 m!535397))

(check-sat (not b!557448) (not b!557446) (not b!557447) (not b!557444) (not b!557450) (not start!50992) (not b!557445) (not b!557441) (not b!557449) (not b!557443))
(check-sat)
(get-model)

(declare-fun b!557491 () Bool)

(declare-fun e!321168 () Bool)

(declare-fun e!321166 () Bool)

(assert (=> b!557491 (= e!321168 e!321166)))

(declare-fun c!64319 () Bool)

(assert (=> b!557491 (= c!64319 (validKeyInArray!0 (select (arr!16858 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557492 () Bool)

(declare-fun call!32375 () Bool)

(assert (=> b!557492 (= e!321166 call!32375)))

(declare-fun b!557493 () Bool)

(assert (=> b!557493 (= e!321166 call!32375)))

(declare-fun b!557494 () Bool)

(declare-fun e!321167 () Bool)

(assert (=> b!557494 (= e!321167 e!321168)))

(declare-fun res!349533 () Bool)

(assert (=> b!557494 (=> (not res!349533) (not e!321168))))

(declare-fun e!321165 () Bool)

(assert (=> b!557494 (= res!349533 (not e!321165))))

(declare-fun res!349534 () Bool)

(assert (=> b!557494 (=> (not res!349534) (not e!321165))))

(assert (=> b!557494 (= res!349534 (validKeyInArray!0 (select (arr!16858 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557495 () Bool)

(declare-fun contains!2851 (List!10938 (_ BitVec 64)) Bool)

(assert (=> b!557495 (= e!321165 (contains!2851 Nil!10935 (select (arr!16858 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32372 () Bool)

(assert (=> bm!32372 (= call!32375 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64319 (Cons!10934 (select (arr!16858 a!3118) #b00000000000000000000000000000000) Nil!10935) Nil!10935)))))

(declare-fun d!83473 () Bool)

(declare-fun res!349535 () Bool)

(assert (=> d!83473 (=> res!349535 e!321167)))

(assert (=> d!83473 (= res!349535 (bvsge #b00000000000000000000000000000000 (size!17222 a!3118)))))

(assert (=> d!83473 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10935) e!321167)))

(assert (= (and d!83473 (not res!349535)) b!557494))

(assert (= (and b!557494 res!349534) b!557495))

(assert (= (and b!557494 res!349533) b!557491))

(assert (= (and b!557491 c!64319) b!557493))

(assert (= (and b!557491 (not c!64319)) b!557492))

(assert (= (or b!557493 b!557492) bm!32372))

(declare-fun m!535437 () Bool)

(assert (=> b!557491 m!535437))

(assert (=> b!557491 m!535437))

(declare-fun m!535439 () Bool)

(assert (=> b!557491 m!535439))

(assert (=> b!557494 m!535437))

(assert (=> b!557494 m!535437))

(assert (=> b!557494 m!535439))

(assert (=> b!557495 m!535437))

(assert (=> b!557495 m!535437))

(declare-fun m!535441 () Bool)

(assert (=> b!557495 m!535441))

(assert (=> bm!32372 m!535437))

(declare-fun m!535443 () Bool)

(assert (=> bm!32372 m!535443))

(assert (=> b!557447 d!83473))

(declare-fun d!83475 () Bool)

(assert (=> d!83475 (= (validKeyInArray!0 (select (arr!16858 a!3118) j!142)) (and (not (= (select (arr!16858 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16858 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557448 d!83475))

(declare-fun b!557526 () Bool)

(declare-fun e!321188 () SeekEntryResult!5307)

(assert (=> b!557526 (= e!321188 (Intermediate!5307 false lt!253301 #b00000000000000000000000000000000))))

(declare-fun b!557527 () Bool)

(declare-fun e!321190 () Bool)

(declare-fun lt!253333 () SeekEntryResult!5307)

(assert (=> b!557527 (= e!321190 (bvsge (x!52353 lt!253333) #b01111111111111111111111111111110))))

(declare-fun b!557528 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557528 (= e!321188 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253301 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142) (array!35104 (store (arr!16858 a!3118) i!1132 k0!1914) (size!17222 a!3118)) mask!3119))))

(declare-fun b!557529 () Bool)

(assert (=> b!557529 (and (bvsge (index!23457 lt!253333) #b00000000000000000000000000000000) (bvslt (index!23457 lt!253333) (size!17222 (array!35104 (store (arr!16858 a!3118) i!1132 k0!1914) (size!17222 a!3118)))))))

(declare-fun e!321192 () Bool)

(assert (=> b!557529 (= e!321192 (= (select (arr!16858 (array!35104 (store (arr!16858 a!3118) i!1132 k0!1914) (size!17222 a!3118))) (index!23457 lt!253333)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557530 () Bool)

(declare-fun e!321191 () SeekEntryResult!5307)

(assert (=> b!557530 (= e!321191 (Intermediate!5307 true lt!253301 #b00000000000000000000000000000000))))

(declare-fun d!83477 () Bool)

(assert (=> d!83477 e!321190))

(declare-fun c!64331 () Bool)

(assert (=> d!83477 (= c!64331 (and ((_ is Intermediate!5307) lt!253333) (undefined!6119 lt!253333)))))

(assert (=> d!83477 (= lt!253333 e!321191)))

(declare-fun c!64329 () Bool)

(assert (=> d!83477 (= c!64329 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253332 () (_ BitVec 64))

(assert (=> d!83477 (= lt!253332 (select (arr!16858 (array!35104 (store (arr!16858 a!3118) i!1132 k0!1914) (size!17222 a!3118))) lt!253301))))

(assert (=> d!83477 (validMask!0 mask!3119)))

(assert (=> d!83477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253301 (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142) (array!35104 (store (arr!16858 a!3118) i!1132 k0!1914) (size!17222 a!3118)) mask!3119) lt!253333)))

(declare-fun b!557531 () Bool)

(assert (=> b!557531 (= e!321191 e!321188)))

(declare-fun c!64330 () Bool)

(assert (=> b!557531 (= c!64330 (or (= lt!253332 (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!253332 lt!253332) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557532 () Bool)

(assert (=> b!557532 (and (bvsge (index!23457 lt!253333) #b00000000000000000000000000000000) (bvslt (index!23457 lt!253333) (size!17222 (array!35104 (store (arr!16858 a!3118) i!1132 k0!1914) (size!17222 a!3118)))))))

(declare-fun res!349549 () Bool)

(assert (=> b!557532 (= res!349549 (= (select (arr!16858 (array!35104 (store (arr!16858 a!3118) i!1132 k0!1914) (size!17222 a!3118))) (index!23457 lt!253333)) (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!557532 (=> res!349549 e!321192)))

(declare-fun e!321189 () Bool)

(assert (=> b!557532 (= e!321189 e!321192)))

(declare-fun b!557533 () Bool)

(assert (=> b!557533 (and (bvsge (index!23457 lt!253333) #b00000000000000000000000000000000) (bvslt (index!23457 lt!253333) (size!17222 (array!35104 (store (arr!16858 a!3118) i!1132 k0!1914) (size!17222 a!3118)))))))

(declare-fun res!349550 () Bool)

(assert (=> b!557533 (= res!349550 (= (select (arr!16858 (array!35104 (store (arr!16858 a!3118) i!1132 k0!1914) (size!17222 a!3118))) (index!23457 lt!253333)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557533 (=> res!349550 e!321192)))

(declare-fun b!557534 () Bool)

(assert (=> b!557534 (= e!321190 e!321189)))

(declare-fun res!349548 () Bool)

(assert (=> b!557534 (= res!349548 (and ((_ is Intermediate!5307) lt!253333) (not (undefined!6119 lt!253333)) (bvslt (x!52353 lt!253333) #b01111111111111111111111111111110) (bvsge (x!52353 lt!253333) #b00000000000000000000000000000000) (bvsge (x!52353 lt!253333) #b00000000000000000000000000000000)))))

(assert (=> b!557534 (=> (not res!349548) (not e!321189))))

(assert (= (and d!83477 c!64329) b!557530))

(assert (= (and d!83477 (not c!64329)) b!557531))

(assert (= (and b!557531 c!64330) b!557526))

(assert (= (and b!557531 (not c!64330)) b!557528))

(assert (= (and d!83477 c!64331) b!557527))

(assert (= (and d!83477 (not c!64331)) b!557534))

(assert (= (and b!557534 res!349548) b!557532))

(assert (= (and b!557532 (not res!349549)) b!557533))

(assert (= (and b!557533 (not res!349550)) b!557529))

(declare-fun m!535451 () Bool)

(assert (=> b!557529 m!535451))

(declare-fun m!535453 () Bool)

(assert (=> b!557528 m!535453))

(assert (=> b!557528 m!535453))

(assert (=> b!557528 m!535381))

(declare-fun m!535455 () Bool)

(assert (=> b!557528 m!535455))

(declare-fun m!535457 () Bool)

(assert (=> d!83477 m!535457))

(assert (=> d!83477 m!535391))

(assert (=> b!557533 m!535451))

(assert (=> b!557532 m!535451))

(assert (=> b!557446 d!83477))

(declare-fun b!557535 () Bool)

(declare-fun e!321193 () SeekEntryResult!5307)

(assert (=> b!557535 (= e!321193 (Intermediate!5307 false lt!253300 #b00000000000000000000000000000000))))

(declare-fun b!557536 () Bool)

(declare-fun e!321195 () Bool)

(declare-fun lt!253335 () SeekEntryResult!5307)

(assert (=> b!557536 (= e!321195 (bvsge (x!52353 lt!253335) #b01111111111111111111111111111110))))

(declare-fun b!557537 () Bool)

(assert (=> b!557537 (= e!321193 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253300 #b00000000000000000000000000000000 mask!3119) (select (arr!16858 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557538 () Bool)

(assert (=> b!557538 (and (bvsge (index!23457 lt!253335) #b00000000000000000000000000000000) (bvslt (index!23457 lt!253335) (size!17222 a!3118)))))

(declare-fun e!321197 () Bool)

(assert (=> b!557538 (= e!321197 (= (select (arr!16858 a!3118) (index!23457 lt!253335)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557539 () Bool)

(declare-fun e!321196 () SeekEntryResult!5307)

(assert (=> b!557539 (= e!321196 (Intermediate!5307 true lt!253300 #b00000000000000000000000000000000))))

(declare-fun d!83483 () Bool)

(assert (=> d!83483 e!321195))

(declare-fun c!64334 () Bool)

(assert (=> d!83483 (= c!64334 (and ((_ is Intermediate!5307) lt!253335) (undefined!6119 lt!253335)))))

(assert (=> d!83483 (= lt!253335 e!321196)))

(declare-fun c!64332 () Bool)

(assert (=> d!83483 (= c!64332 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253334 () (_ BitVec 64))

(assert (=> d!83483 (= lt!253334 (select (arr!16858 a!3118) lt!253300))))

(assert (=> d!83483 (validMask!0 mask!3119)))

(assert (=> d!83483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253300 (select (arr!16858 a!3118) j!142) a!3118 mask!3119) lt!253335)))

(declare-fun b!557540 () Bool)

(assert (=> b!557540 (= e!321196 e!321193)))

(declare-fun c!64333 () Bool)

(assert (=> b!557540 (= c!64333 (or (= lt!253334 (select (arr!16858 a!3118) j!142)) (= (bvadd lt!253334 lt!253334) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557541 () Bool)

(assert (=> b!557541 (and (bvsge (index!23457 lt!253335) #b00000000000000000000000000000000) (bvslt (index!23457 lt!253335) (size!17222 a!3118)))))

(declare-fun res!349552 () Bool)

(assert (=> b!557541 (= res!349552 (= (select (arr!16858 a!3118) (index!23457 lt!253335)) (select (arr!16858 a!3118) j!142)))))

(assert (=> b!557541 (=> res!349552 e!321197)))

(declare-fun e!321194 () Bool)

(assert (=> b!557541 (= e!321194 e!321197)))

(declare-fun b!557542 () Bool)

(assert (=> b!557542 (and (bvsge (index!23457 lt!253335) #b00000000000000000000000000000000) (bvslt (index!23457 lt!253335) (size!17222 a!3118)))))

(declare-fun res!349553 () Bool)

(assert (=> b!557542 (= res!349553 (= (select (arr!16858 a!3118) (index!23457 lt!253335)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557542 (=> res!349553 e!321197)))

(declare-fun b!557543 () Bool)

(assert (=> b!557543 (= e!321195 e!321194)))

(declare-fun res!349551 () Bool)

(assert (=> b!557543 (= res!349551 (and ((_ is Intermediate!5307) lt!253335) (not (undefined!6119 lt!253335)) (bvslt (x!52353 lt!253335) #b01111111111111111111111111111110) (bvsge (x!52353 lt!253335) #b00000000000000000000000000000000) (bvsge (x!52353 lt!253335) #b00000000000000000000000000000000)))))

(assert (=> b!557543 (=> (not res!349551) (not e!321194))))

(assert (= (and d!83483 c!64332) b!557539))

(assert (= (and d!83483 (not c!64332)) b!557540))

(assert (= (and b!557540 c!64333) b!557535))

(assert (= (and b!557540 (not c!64333)) b!557537))

(assert (= (and d!83483 c!64334) b!557536))

(assert (= (and d!83483 (not c!64334)) b!557543))

(assert (= (and b!557543 res!349551) b!557541))

(assert (= (and b!557541 (not res!349552)) b!557542))

(assert (= (and b!557542 (not res!349553)) b!557538))

(declare-fun m!535459 () Bool)

(assert (=> b!557538 m!535459))

(declare-fun m!535461 () Bool)

(assert (=> b!557537 m!535461))

(assert (=> b!557537 m!535461))

(assert (=> b!557537 m!535361))

(declare-fun m!535463 () Bool)

(assert (=> b!557537 m!535463))

(declare-fun m!535465 () Bool)

(assert (=> d!83483 m!535465))

(assert (=> d!83483 m!535391))

(assert (=> b!557542 m!535459))

(assert (=> b!557541 m!535459))

(assert (=> b!557446 d!83483))

(declare-fun d!83485 () Bool)

(declare-fun lt!253344 () (_ BitVec 32))

(declare-fun lt!253343 () (_ BitVec 32))

(assert (=> d!83485 (= lt!253344 (bvmul (bvxor lt!253343 (bvlshr lt!253343 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83485 (= lt!253343 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83485 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349554 (let ((h!11927 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52356 (bvmul (bvxor h!11927 (bvlshr h!11927 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52356 (bvlshr x!52356 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349554 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349554 #b00000000000000000000000000000000))))))

(assert (=> d!83485 (= (toIndex!0 (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!253344 (bvlshr lt!253344 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557446 d!83485))

(declare-fun d!83491 () Bool)

(declare-fun lt!253346 () (_ BitVec 32))

(declare-fun lt!253345 () (_ BitVec 32))

(assert (=> d!83491 (= lt!253346 (bvmul (bvxor lt!253345 (bvlshr lt!253345 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83491 (= lt!253345 ((_ extract 31 0) (bvand (bvxor (select (arr!16858 a!3118) j!142) (bvlshr (select (arr!16858 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83491 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349554 (let ((h!11927 ((_ extract 31 0) (bvand (bvxor (select (arr!16858 a!3118) j!142) (bvlshr (select (arr!16858 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52356 (bvmul (bvxor h!11927 (bvlshr h!11927 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52356 (bvlshr x!52356 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349554 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349554 #b00000000000000000000000000000000))))))

(assert (=> d!83491 (= (toIndex!0 (select (arr!16858 a!3118) j!142) mask!3119) (bvand (bvxor lt!253346 (bvlshr lt!253346 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557446 d!83491))

(declare-fun b!557564 () Bool)

(declare-fun e!321215 () Bool)

(declare-fun e!321213 () Bool)

(assert (=> b!557564 (= e!321215 e!321213)))

(declare-fun lt!253362 () (_ BitVec 64))

(assert (=> b!557564 (= lt!253362 (select (arr!16858 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253364 () Unit!17388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35103 (_ BitVec 64) (_ BitVec 32)) Unit!17388)

(assert (=> b!557564 (= lt!253364 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253362 #b00000000000000000000000000000000))))

(assert (=> b!557564 (arrayContainsKey!0 a!3118 lt!253362 #b00000000000000000000000000000000)))

(declare-fun lt!253363 () Unit!17388)

(assert (=> b!557564 (= lt!253363 lt!253364)))

(declare-fun res!349565 () Bool)

(assert (=> b!557564 (= res!349565 (= (seekEntryOrOpen!0 (select (arr!16858 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5307 #b00000000000000000000000000000000)))))

(assert (=> b!557564 (=> (not res!349565) (not e!321213))))

(declare-fun b!557565 () Bool)

(declare-fun call!32384 () Bool)

(assert (=> b!557565 (= e!321215 call!32384)))

(declare-fun bm!32381 () Bool)

(assert (=> bm!32381 (= call!32384 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557566 () Bool)

(declare-fun e!321214 () Bool)

(assert (=> b!557566 (= e!321214 e!321215)))

(declare-fun c!64340 () Bool)

(assert (=> b!557566 (= c!64340 (validKeyInArray!0 (select (arr!16858 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557567 () Bool)

(assert (=> b!557567 (= e!321213 call!32384)))

(declare-fun d!83493 () Bool)

(declare-fun res!349566 () Bool)

(assert (=> d!83493 (=> res!349566 e!321214)))

(assert (=> d!83493 (= res!349566 (bvsge #b00000000000000000000000000000000 (size!17222 a!3118)))))

(assert (=> d!83493 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!321214)))

(assert (= (and d!83493 (not res!349566)) b!557566))

(assert (= (and b!557566 c!64340) b!557564))

(assert (= (and b!557566 (not c!64340)) b!557565))

(assert (= (and b!557564 res!349565) b!557567))

(assert (= (or b!557567 b!557565) bm!32381))

(assert (=> b!557564 m!535437))

(declare-fun m!535481 () Bool)

(assert (=> b!557564 m!535481))

(declare-fun m!535483 () Bool)

(assert (=> b!557564 m!535483))

(assert (=> b!557564 m!535437))

(declare-fun m!535485 () Bool)

(assert (=> b!557564 m!535485))

(declare-fun m!535487 () Bool)

(assert (=> bm!32381 m!535487))

(assert (=> b!557566 m!535437))

(assert (=> b!557566 m!535437))

(assert (=> b!557566 m!535439))

(assert (=> b!557441 d!83493))

(declare-fun d!83497 () Bool)

(assert (=> d!83497 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557450 d!83497))

(declare-fun d!83499 () Bool)

(assert (=> d!83499 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50992 d!83499))

(declare-fun d!83505 () Bool)

(assert (=> d!83505 (= (array_inv!12654 a!3118) (bvsge (size!17222 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50992 d!83505))

(declare-fun b!557647 () Bool)

(declare-fun e!321264 () SeekEntryResult!5307)

(declare-fun e!321265 () SeekEntryResult!5307)

(assert (=> b!557647 (= e!321264 e!321265)))

(declare-fun lt!253395 () (_ BitVec 64))

(declare-fun lt!253397 () SeekEntryResult!5307)

(assert (=> b!557647 (= lt!253395 (select (arr!16858 a!3118) (index!23457 lt!253397)))))

(declare-fun c!64373 () Bool)

(assert (=> b!557647 (= c!64373 (= lt!253395 k0!1914))))

(declare-fun b!557648 () Bool)

(declare-fun e!321266 () SeekEntryResult!5307)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35103 (_ BitVec 32)) SeekEntryResult!5307)

(assert (=> b!557648 (= e!321266 (seekKeyOrZeroReturnVacant!0 (x!52353 lt!253397) (index!23457 lt!253397) (index!23457 lt!253397) k0!1914 a!3118 mask!3119))))

(declare-fun b!557649 () Bool)

(assert (=> b!557649 (= e!321264 Undefined!5307)))

(declare-fun d!83507 () Bool)

(declare-fun lt!253396 () SeekEntryResult!5307)

(assert (=> d!83507 (and (or ((_ is Undefined!5307) lt!253396) (not ((_ is Found!5307) lt!253396)) (and (bvsge (index!23456 lt!253396) #b00000000000000000000000000000000) (bvslt (index!23456 lt!253396) (size!17222 a!3118)))) (or ((_ is Undefined!5307) lt!253396) ((_ is Found!5307) lt!253396) (not ((_ is MissingZero!5307) lt!253396)) (and (bvsge (index!23455 lt!253396) #b00000000000000000000000000000000) (bvslt (index!23455 lt!253396) (size!17222 a!3118)))) (or ((_ is Undefined!5307) lt!253396) ((_ is Found!5307) lt!253396) ((_ is MissingZero!5307) lt!253396) (not ((_ is MissingVacant!5307) lt!253396)) (and (bvsge (index!23458 lt!253396) #b00000000000000000000000000000000) (bvslt (index!23458 lt!253396) (size!17222 a!3118)))) (or ((_ is Undefined!5307) lt!253396) (ite ((_ is Found!5307) lt!253396) (= (select (arr!16858 a!3118) (index!23456 lt!253396)) k0!1914) (ite ((_ is MissingZero!5307) lt!253396) (= (select (arr!16858 a!3118) (index!23455 lt!253396)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5307) lt!253396) (= (select (arr!16858 a!3118) (index!23458 lt!253396)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83507 (= lt!253396 e!321264)))

(declare-fun c!64374 () Bool)

(assert (=> d!83507 (= c!64374 (and ((_ is Intermediate!5307) lt!253397) (undefined!6119 lt!253397)))))

(assert (=> d!83507 (= lt!253397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83507 (validMask!0 mask!3119)))

(assert (=> d!83507 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!253396)))

(declare-fun b!557650 () Bool)

(assert (=> b!557650 (= e!321266 (MissingZero!5307 (index!23457 lt!253397)))))

(declare-fun b!557651 () Bool)

(declare-fun c!64372 () Bool)

(assert (=> b!557651 (= c!64372 (= lt!253395 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557651 (= e!321265 e!321266)))

(declare-fun b!557652 () Bool)

(assert (=> b!557652 (= e!321265 (Found!5307 (index!23457 lt!253397)))))

(assert (= (and d!83507 c!64374) b!557649))

(assert (= (and d!83507 (not c!64374)) b!557647))

(assert (= (and b!557647 c!64373) b!557652))

(assert (= (and b!557647 (not c!64373)) b!557651))

(assert (= (and b!557651 c!64372) b!557650))

(assert (= (and b!557651 (not c!64372)) b!557648))

(declare-fun m!535545 () Bool)

(assert (=> b!557647 m!535545))

(declare-fun m!535547 () Bool)

(assert (=> b!557648 m!535547))

(declare-fun m!535549 () Bool)

(assert (=> d!83507 m!535549))

(declare-fun m!535551 () Bool)

(assert (=> d!83507 m!535551))

(declare-fun m!535553 () Bool)

(assert (=> d!83507 m!535553))

(declare-fun m!535555 () Bool)

(assert (=> d!83507 m!535555))

(assert (=> d!83507 m!535551))

(declare-fun m!535557 () Bool)

(assert (=> d!83507 m!535557))

(assert (=> d!83507 m!535391))

(assert (=> b!557445 d!83507))

(declare-fun b!557653 () Bool)

(declare-fun e!321269 () Bool)

(declare-fun e!321267 () Bool)

(assert (=> b!557653 (= e!321269 e!321267)))

(declare-fun lt!253398 () (_ BitVec 64))

(assert (=> b!557653 (= lt!253398 (select (arr!16858 a!3118) j!142))))

(declare-fun lt!253400 () Unit!17388)

(assert (=> b!557653 (= lt!253400 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253398 j!142))))

(assert (=> b!557653 (arrayContainsKey!0 a!3118 lt!253398 #b00000000000000000000000000000000)))

(declare-fun lt!253399 () Unit!17388)

(assert (=> b!557653 (= lt!253399 lt!253400)))

(declare-fun res!349584 () Bool)

(assert (=> b!557653 (= res!349584 (= (seekEntryOrOpen!0 (select (arr!16858 a!3118) j!142) a!3118 mask!3119) (Found!5307 j!142)))))

(assert (=> b!557653 (=> (not res!349584) (not e!321267))))

(declare-fun b!557654 () Bool)

(declare-fun call!32389 () Bool)

(assert (=> b!557654 (= e!321269 call!32389)))

(declare-fun bm!32386 () Bool)

(assert (=> bm!32386 (= call!32389 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557655 () Bool)

(declare-fun e!321268 () Bool)

(assert (=> b!557655 (= e!321268 e!321269)))

(declare-fun c!64375 () Bool)

(assert (=> b!557655 (= c!64375 (validKeyInArray!0 (select (arr!16858 a!3118) j!142)))))

(declare-fun b!557656 () Bool)

(assert (=> b!557656 (= e!321267 call!32389)))

(declare-fun d!83525 () Bool)

(declare-fun res!349585 () Bool)

(assert (=> d!83525 (=> res!349585 e!321268)))

(assert (=> d!83525 (= res!349585 (bvsge j!142 (size!17222 a!3118)))))

(assert (=> d!83525 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!321268)))

(assert (= (and d!83525 (not res!349585)) b!557655))

(assert (= (and b!557655 c!64375) b!557653))

(assert (= (and b!557655 (not c!64375)) b!557654))

(assert (= (and b!557653 res!349584) b!557656))

(assert (= (or b!557656 b!557654) bm!32386))

(assert (=> b!557653 m!535361))

(declare-fun m!535559 () Bool)

(assert (=> b!557653 m!535559))

(declare-fun m!535561 () Bool)

(assert (=> b!557653 m!535561))

(assert (=> b!557653 m!535361))

(assert (=> b!557653 m!535363))

(declare-fun m!535563 () Bool)

(assert (=> bm!32386 m!535563))

(assert (=> b!557655 m!535361))

(assert (=> b!557655 m!535361))

(assert (=> b!557655 m!535369))

(assert (=> b!557443 d!83525))

(declare-fun d!83527 () Bool)

(assert (=> d!83527 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253407 () Unit!17388)

(declare-fun choose!38 (array!35103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17388)

(assert (=> d!83527 (= lt!253407 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83527 (validMask!0 mask!3119)))

(assert (=> d!83527 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253407)))

(declare-fun bs!17357 () Bool)

(assert (= bs!17357 d!83527))

(assert (=> bs!17357 m!535375))

(declare-fun m!535565 () Bool)

(assert (=> bs!17357 m!535565))

(assert (=> bs!17357 m!535391))

(assert (=> b!557443 d!83527))

(declare-fun d!83531 () Bool)

(declare-fun res!349596 () Bool)

(declare-fun e!321284 () Bool)

(assert (=> d!83531 (=> res!349596 e!321284)))

(assert (=> d!83531 (= res!349596 (= (select (arr!16858 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83531 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!321284)))

(declare-fun b!557679 () Bool)

(declare-fun e!321285 () Bool)

(assert (=> b!557679 (= e!321284 e!321285)))

(declare-fun res!349597 () Bool)

(assert (=> b!557679 (=> (not res!349597) (not e!321285))))

(assert (=> b!557679 (= res!349597 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17222 a!3118)))))

(declare-fun b!557680 () Bool)

(assert (=> b!557680 (= e!321285 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83531 (not res!349596)) b!557679))

(assert (= (and b!557679 res!349597) b!557680))

(assert (=> d!83531 m!535437))

(declare-fun m!535567 () Bool)

(assert (=> b!557680 m!535567))

(assert (=> b!557444 d!83531))

(declare-fun b!557681 () Bool)

(declare-fun e!321286 () SeekEntryResult!5307)

(declare-fun e!321287 () SeekEntryResult!5307)

(assert (=> b!557681 (= e!321286 e!321287)))

(declare-fun lt!253408 () (_ BitVec 64))

(declare-fun lt!253410 () SeekEntryResult!5307)

(assert (=> b!557681 (= lt!253408 (select (arr!16858 a!3118) (index!23457 lt!253410)))))

(declare-fun c!64383 () Bool)

(assert (=> b!557681 (= c!64383 (= lt!253408 (select (arr!16858 a!3118) j!142)))))

(declare-fun b!557682 () Bool)

(declare-fun e!321288 () SeekEntryResult!5307)

(assert (=> b!557682 (= e!321288 (seekKeyOrZeroReturnVacant!0 (x!52353 lt!253410) (index!23457 lt!253410) (index!23457 lt!253410) (select (arr!16858 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557683 () Bool)

(assert (=> b!557683 (= e!321286 Undefined!5307)))

(declare-fun d!83537 () Bool)

(declare-fun lt!253409 () SeekEntryResult!5307)

(assert (=> d!83537 (and (or ((_ is Undefined!5307) lt!253409) (not ((_ is Found!5307) lt!253409)) (and (bvsge (index!23456 lt!253409) #b00000000000000000000000000000000) (bvslt (index!23456 lt!253409) (size!17222 a!3118)))) (or ((_ is Undefined!5307) lt!253409) ((_ is Found!5307) lt!253409) (not ((_ is MissingZero!5307) lt!253409)) (and (bvsge (index!23455 lt!253409) #b00000000000000000000000000000000) (bvslt (index!23455 lt!253409) (size!17222 a!3118)))) (or ((_ is Undefined!5307) lt!253409) ((_ is Found!5307) lt!253409) ((_ is MissingZero!5307) lt!253409) (not ((_ is MissingVacant!5307) lt!253409)) (and (bvsge (index!23458 lt!253409) #b00000000000000000000000000000000) (bvslt (index!23458 lt!253409) (size!17222 a!3118)))) (or ((_ is Undefined!5307) lt!253409) (ite ((_ is Found!5307) lt!253409) (= (select (arr!16858 a!3118) (index!23456 lt!253409)) (select (arr!16858 a!3118) j!142)) (ite ((_ is MissingZero!5307) lt!253409) (= (select (arr!16858 a!3118) (index!23455 lt!253409)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5307) lt!253409) (= (select (arr!16858 a!3118) (index!23458 lt!253409)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83537 (= lt!253409 e!321286)))

(declare-fun c!64384 () Bool)

(assert (=> d!83537 (= c!64384 (and ((_ is Intermediate!5307) lt!253410) (undefined!6119 lt!253410)))))

(assert (=> d!83537 (= lt!253410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16858 a!3118) j!142) mask!3119) (select (arr!16858 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83537 (validMask!0 mask!3119)))

(assert (=> d!83537 (= (seekEntryOrOpen!0 (select (arr!16858 a!3118) j!142) a!3118 mask!3119) lt!253409)))

(declare-fun b!557684 () Bool)

(assert (=> b!557684 (= e!321288 (MissingZero!5307 (index!23457 lt!253410)))))

(declare-fun b!557685 () Bool)

(declare-fun c!64382 () Bool)

(assert (=> b!557685 (= c!64382 (= lt!253408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557685 (= e!321287 e!321288)))

(declare-fun b!557686 () Bool)

(assert (=> b!557686 (= e!321287 (Found!5307 (index!23457 lt!253410)))))

(assert (= (and d!83537 c!64384) b!557683))

(assert (= (and d!83537 (not c!64384)) b!557681))

(assert (= (and b!557681 c!64383) b!557686))

(assert (= (and b!557681 (not c!64383)) b!557685))

(assert (= (and b!557685 c!64382) b!557684))

(assert (= (and b!557685 (not c!64382)) b!557682))

(declare-fun m!535569 () Bool)

(assert (=> b!557681 m!535569))

(assert (=> b!557682 m!535361))

(declare-fun m!535571 () Bool)

(assert (=> b!557682 m!535571))

(declare-fun m!535573 () Bool)

(assert (=> d!83537 m!535573))

(assert (=> d!83537 m!535379))

(assert (=> d!83537 m!535361))

(declare-fun m!535575 () Bool)

(assert (=> d!83537 m!535575))

(declare-fun m!535577 () Bool)

(assert (=> d!83537 m!535577))

(assert (=> d!83537 m!535361))

(assert (=> d!83537 m!535379))

(declare-fun m!535579 () Bool)

(assert (=> d!83537 m!535579))

(assert (=> d!83537 m!535391))

(assert (=> b!557449 d!83537))

(check-sat (not bm!32372) (not bm!32386) (not b!557566) (not b!557653) (not b!557494) (not b!557528) (not d!83477) (not b!557564) (not bm!32381) (not b!557682) (not b!557655) (not b!557680) (not b!557648) (not b!557491) (not b!557537) (not b!557495) (not d!83483) (not d!83527) (not d!83507) (not d!83537))
(check-sat)
