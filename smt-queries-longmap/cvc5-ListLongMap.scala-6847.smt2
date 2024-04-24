; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86408 () Bool)

(assert start!86408)

(declare-fun b!999369 () Bool)

(declare-fun res!668599 () Bool)

(declare-fun e!563633 () Bool)

(assert (=> b!999369 (=> (not res!668599) (not e!563633))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999369 (= res!668599 (validKeyInArray!0 k!2224))))

(declare-fun b!999371 () Bool)

(declare-fun e!563632 () Bool)

(declare-fun e!563631 () Bool)

(assert (=> b!999371 (= e!563632 e!563631)))

(declare-fun res!668601 () Bool)

(assert (=> b!999371 (=> (not res!668601) (not e!563631))))

(declare-datatypes ((array!63181 0))(
  ( (array!63182 (arr!30414 (Array (_ BitVec 32) (_ BitVec 64))) (size!30917 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63181)

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9282 0))(
  ( (MissingZero!9282 (index!39499 (_ BitVec 32))) (Found!9282 (index!39500 (_ BitVec 32))) (Intermediate!9282 (undefined!10094 Bool) (index!39501 (_ BitVec 32)) (x!87080 (_ BitVec 32))) (Undefined!9282) (MissingVacant!9282 (index!39502 (_ BitVec 32))) )
))
(declare-fun lt!442067 () SeekEntryResult!9282)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63181 (_ BitVec 32)) SeekEntryResult!9282)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999371 (= res!668601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30414 a!3219) j!170) mask!3464) (select (arr!30414 a!3219) j!170) a!3219 mask!3464) lt!442067))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999371 (= lt!442067 (Intermediate!9282 false resIndex!38 resX!38))))

(declare-fun b!999372 () Bool)

(declare-fun res!668606 () Bool)

(assert (=> b!999372 (=> (not res!668606) (not e!563633))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999372 (= res!668606 (and (= (size!30917 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30917 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30917 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999373 () Bool)

(assert (=> b!999373 (= e!563631 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!999374 () Bool)

(declare-fun res!668605 () Bool)

(assert (=> b!999374 (=> (not res!668605) (not e!563633))))

(assert (=> b!999374 (= res!668605 (validKeyInArray!0 (select (arr!30414 a!3219) j!170)))))

(declare-fun b!999375 () Bool)

(declare-fun res!668607 () Bool)

(assert (=> b!999375 (=> (not res!668607) (not e!563632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63181 (_ BitVec 32)) Bool)

(assert (=> b!999375 (= res!668607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999376 () Bool)

(assert (=> b!999376 (= e!563633 e!563632)))

(declare-fun res!668603 () Bool)

(assert (=> b!999376 (=> (not res!668603) (not e!563632))))

(declare-fun lt!442066 () SeekEntryResult!9282)

(assert (=> b!999376 (= res!668603 (or (= lt!442066 (MissingVacant!9282 i!1194)) (= lt!442066 (MissingZero!9282 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63181 (_ BitVec 32)) SeekEntryResult!9282)

(assert (=> b!999376 (= lt!442066 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999370 () Bool)

(declare-fun res!668602 () Bool)

(assert (=> b!999370 (=> (not res!668602) (not e!563632))))

(declare-datatypes ((List!21061 0))(
  ( (Nil!21058) (Cons!21057 (h!22234 (_ BitVec 64)) (t!30054 List!21061)) )
))
(declare-fun arrayNoDuplicates!0 (array!63181 (_ BitVec 32) List!21061) Bool)

(assert (=> b!999370 (= res!668602 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21058))))

(declare-fun res!668608 () Bool)

(assert (=> start!86408 (=> (not res!668608) (not e!563633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86408 (= res!668608 (validMask!0 mask!3464))))

(assert (=> start!86408 e!563633))

(declare-fun array_inv!23550 (array!63181) Bool)

(assert (=> start!86408 (array_inv!23550 a!3219)))

(assert (=> start!86408 true))

(declare-fun b!999377 () Bool)

(declare-fun res!668600 () Bool)

(assert (=> b!999377 (=> (not res!668600) (not e!563632))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!999377 (= res!668600 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30917 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30917 a!3219))))))

(declare-fun b!999378 () Bool)

(declare-fun res!668604 () Bool)

(assert (=> b!999378 (=> (not res!668604) (not e!563633))))

(declare-fun arrayContainsKey!0 (array!63181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999378 (= res!668604 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999379 () Bool)

(declare-fun res!668609 () Bool)

(assert (=> b!999379 (=> (not res!668609) (not e!563631))))

(assert (=> b!999379 (= res!668609 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30414 a!3219) j!170) a!3219 mask!3464) lt!442067))))

(assert (= (and start!86408 res!668608) b!999372))

(assert (= (and b!999372 res!668606) b!999374))

(assert (= (and b!999374 res!668605) b!999369))

(assert (= (and b!999369 res!668599) b!999378))

(assert (= (and b!999378 res!668604) b!999376))

(assert (= (and b!999376 res!668603) b!999375))

(assert (= (and b!999375 res!668607) b!999370))

(assert (= (and b!999370 res!668602) b!999377))

(assert (= (and b!999377 res!668600) b!999371))

(assert (= (and b!999371 res!668601) b!999379))

(assert (= (and b!999379 res!668609) b!999373))

(declare-fun m!926303 () Bool)

(assert (=> b!999376 m!926303))

(declare-fun m!926305 () Bool)

(assert (=> b!999374 m!926305))

(assert (=> b!999374 m!926305))

(declare-fun m!926307 () Bool)

(assert (=> b!999374 m!926307))

(declare-fun m!926309 () Bool)

(assert (=> b!999369 m!926309))

(declare-fun m!926311 () Bool)

(assert (=> b!999375 m!926311))

(assert (=> b!999371 m!926305))

(assert (=> b!999371 m!926305))

(declare-fun m!926313 () Bool)

(assert (=> b!999371 m!926313))

(assert (=> b!999371 m!926313))

(assert (=> b!999371 m!926305))

(declare-fun m!926315 () Bool)

(assert (=> b!999371 m!926315))

(declare-fun m!926317 () Bool)

(assert (=> b!999370 m!926317))

(assert (=> b!999379 m!926305))

(assert (=> b!999379 m!926305))

(declare-fun m!926319 () Bool)

(assert (=> b!999379 m!926319))

(declare-fun m!926321 () Bool)

(assert (=> start!86408 m!926321))

(declare-fun m!926323 () Bool)

(assert (=> start!86408 m!926323))

(declare-fun m!926325 () Bool)

(assert (=> b!999378 m!926325))

(push 1)

(assert (not b!999376))

(assert (not b!999374))

(assert (not b!999369))

(assert (not b!999375))

(assert (not b!999378))

(assert (not b!999371))

(assert (not b!999370))

(assert (not b!999379))

(assert (not start!86408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!119533 () Bool)

(declare-fun lt!442084 () SeekEntryResult!9282)

(assert (=> d!119533 (and (or (is-Undefined!9282 lt!442084) (not (is-Found!9282 lt!442084)) (and (bvsge (index!39500 lt!442084) #b00000000000000000000000000000000) (bvslt (index!39500 lt!442084) (size!30917 a!3219)))) (or (is-Undefined!9282 lt!442084) (is-Found!9282 lt!442084) (not (is-MissingZero!9282 lt!442084)) (and (bvsge (index!39499 lt!442084) #b00000000000000000000000000000000) (bvslt (index!39499 lt!442084) (size!30917 a!3219)))) (or (is-Undefined!9282 lt!442084) (is-Found!9282 lt!442084) (is-MissingZero!9282 lt!442084) (not (is-MissingVacant!9282 lt!442084)) (and (bvsge (index!39502 lt!442084) #b00000000000000000000000000000000) (bvslt (index!39502 lt!442084) (size!30917 a!3219)))) (or (is-Undefined!9282 lt!442084) (ite (is-Found!9282 lt!442084) (= (select (arr!30414 a!3219) (index!39500 lt!442084)) k!2224) (ite (is-MissingZero!9282 lt!442084) (= (select (arr!30414 a!3219) (index!39499 lt!442084)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9282 lt!442084) (= (select (arr!30414 a!3219) (index!39502 lt!442084)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!563669 () SeekEntryResult!9282)

(assert (=> d!119533 (= lt!442084 e!563669)))

(declare-fun c!101552 () Bool)

(declare-fun lt!442083 () SeekEntryResult!9282)

(assert (=> d!119533 (= c!101552 (and (is-Intermediate!9282 lt!442083) (undefined!10094 lt!442083)))))

(assert (=> d!119533 (= lt!442083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119533 (validMask!0 mask!3464)))

(assert (=> d!119533 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!442084)))

(declare-fun b!999434 () Bool)

(declare-fun e!563667 () SeekEntryResult!9282)

(assert (=> b!999434 (= e!563669 e!563667)))

(declare-fun lt!442082 () (_ BitVec 64))

(assert (=> b!999434 (= lt!442082 (select (arr!30414 a!3219) (index!39501 lt!442083)))))

(declare-fun c!101553 () Bool)

(assert (=> b!999434 (= c!101553 (= lt!442082 k!2224))))

(declare-fun b!999435 () Bool)

(assert (=> b!999435 (= e!563667 (Found!9282 (index!39501 lt!442083)))))

(declare-fun e!563668 () SeekEntryResult!9282)

(declare-fun b!999436 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63181 (_ BitVec 32)) SeekEntryResult!9282)

(assert (=> b!999436 (= e!563668 (seekKeyOrZeroReturnVacant!0 (x!87080 lt!442083) (index!39501 lt!442083) (index!39501 lt!442083) k!2224 a!3219 mask!3464))))

(declare-fun b!999437 () Bool)

(assert (=> b!999437 (= e!563668 (MissingZero!9282 (index!39501 lt!442083)))))

(declare-fun b!999438 () Bool)

(declare-fun c!101554 () Bool)

(assert (=> b!999438 (= c!101554 (= lt!442082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!999438 (= e!563667 e!563668)))

(declare-fun b!999439 () Bool)

(assert (=> b!999439 (= e!563669 Undefined!9282)))

(assert (= (and d!119533 c!101552) b!999439))

(assert (= (and d!119533 (not c!101552)) b!999434))

(assert (= (and b!999434 c!101553) b!999435))

(assert (= (and b!999434 (not c!101553)) b!999438))

(assert (= (and b!999438 c!101554) b!999437))

(assert (= (and b!999438 (not c!101554)) b!999436))

(declare-fun m!926347 () Bool)

(assert (=> d!119533 m!926347))

(declare-fun m!926349 () Bool)

(assert (=> d!119533 m!926349))

(declare-fun m!926351 () Bool)

(assert (=> d!119533 m!926351))

(assert (=> d!119533 m!926321))

(assert (=> d!119533 m!926351))

(declare-fun m!926353 () Bool)

(assert (=> d!119533 m!926353))

(declare-fun m!926355 () Bool)

(assert (=> d!119533 m!926355))

(declare-fun m!926357 () Bool)

(assert (=> b!999434 m!926357))

(declare-fun m!926359 () Bool)

(assert (=> b!999436 m!926359))

(assert (=> b!999376 d!119533))

(declare-fun b!999458 () Bool)

(declare-fun e!563684 () SeekEntryResult!9282)

(assert (=> b!999458 (= e!563684 (Intermediate!9282 true (toIndex!0 (select (arr!30414 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun e!563680 () SeekEntryResult!9282)

(declare-fun b!999459 () Bool)

(assert (=> b!999459 (= e!563680 (Intermediate!9282 false (toIndex!0 (select (arr!30414 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!999460 () Bool)

(declare-fun e!563683 () Bool)

(declare-fun e!563682 () Bool)

(assert (=> b!999460 (= e!563683 e!563682)))

(declare-fun res!668635 () Bool)

(declare-fun lt!442095 () SeekEntryResult!9282)

(assert (=> b!999460 (= res!668635 (and (is-Intermediate!9282 lt!442095) (not (undefined!10094 lt!442095)) (bvslt (x!87080 lt!442095) #b01111111111111111111111111111110) (bvsge (x!87080 lt!442095) #b00000000000000000000000000000000) (bvsge (x!87080 lt!442095) #b00000000000000000000000000000000)))))

(assert (=> b!999460 (=> (not res!668635) (not e!563682))))

(declare-fun d!119543 () Bool)

(assert (=> d!119543 e!563683))

(declare-fun c!101562 () Bool)

(assert (=> d!119543 (= c!101562 (and (is-Intermediate!9282 lt!442095) (undefined!10094 lt!442095)))))

(assert (=> d!119543 (= lt!442095 e!563684)))

(declare-fun c!101561 () Bool)

(assert (=> d!119543 (= c!101561 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!442096 () (_ BitVec 64))

(assert (=> d!119543 (= lt!442096 (select (arr!30414 a!3219) (toIndex!0 (select (arr!30414 a!3219) j!170) mask!3464)))))

(assert (=> d!119543 (validMask!0 mask!3464)))

(assert (=> d!119543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30414 a!3219) j!170) mask!3464) (select (arr!30414 a!3219) j!170) a!3219 mask!3464) lt!442095)))

(declare-fun b!999461 () Bool)

(assert (=> b!999461 (and (bvsge (index!39501 lt!442095) #b00000000000000000000000000000000) (bvslt (index!39501 lt!442095) (size!30917 a!3219)))))

(declare-fun res!668637 () Bool)

(assert (=> b!999461 (= res!668637 (= (select (arr!30414 a!3219) (index!39501 lt!442095)) (select (arr!30414 a!3219) j!170)))))

(declare-fun e!563681 () Bool)

(assert (=> b!999461 (=> res!668637 e!563681)))

(assert (=> b!999461 (= e!563682 e!563681)))

(declare-fun b!999462 () Bool)

(assert (=> b!999462 (and (bvsge (index!39501 lt!442095) #b00000000000000000000000000000000) (bvslt (index!39501 lt!442095) (size!30917 a!3219)))))

(assert (=> b!999462 (= e!563681 (= (select (arr!30414 a!3219) (index!39501 lt!442095)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!999463 () Bool)

(assert (=> b!999463 (= e!563683 (bvsge (x!87080 lt!442095) #b01111111111111111111111111111110))))

(declare-fun b!999464 () Bool)

(assert (=> b!999464 (and (bvsge (index!39501 lt!442095) #b00000000000000000000000000000000) (bvslt (index!39501 lt!442095) (size!30917 a!3219)))))

(declare-fun res!668636 () Bool)

(assert (=> b!999464 (= res!668636 (= (select (arr!30414 a!3219) (index!39501 lt!442095)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!999464 (=> res!668636 e!563681)))

(declare-fun b!999465 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999465 (= e!563680 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30414 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30414 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999466 () Bool)

(assert (=> b!999466 (= e!563684 e!563680)))

(declare-fun c!101563 () Bool)

(assert (=> b!999466 (= c!101563 (or (= lt!442096 (select (arr!30414 a!3219) j!170)) (= (bvadd lt!442096 lt!442096) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!119543 c!101561) b!999458))

(assert (= (and d!119543 (not c!101561)) b!999466))

(assert (= (and b!999466 c!101563) b!999459))

(assert (= (and b!999466 (not c!101563)) b!999465))

(assert (= (and d!119543 c!101562) b!999463))

(assert (= (and d!119543 (not c!101562)) b!999460))

(assert (= (and b!999460 res!668635) b!999461))

(assert (= (and b!999461 (not res!668637)) b!999464))

(assert (= (and b!999464 (not res!668636)) b!999462))

(declare-fun m!926361 () Bool)

(assert (=> b!999461 m!926361))

(assert (=> d!119543 m!926313))

(declare-fun m!926363 () Bool)

(assert (=> d!119543 m!926363))

(assert (=> d!119543 m!926321))

(assert (=> b!999462 m!926361))

(assert (=> b!999464 m!926361))

(assert (=> b!999465 m!926313))

(declare-fun m!926365 () Bool)

(assert (=> b!999465 m!926365))

(assert (=> b!999465 m!926365))

(assert (=> b!999465 m!926305))

(declare-fun m!926367 () Bool)

(assert (=> b!999465 m!926367))

(assert (=> b!999371 d!119543))

(declare-fun d!119555 () Bool)

(declare-fun lt!442106 () (_ BitVec 32))

(declare-fun lt!442105 () (_ BitVec 32))

(assert (=> d!119555 (= lt!442106 (bvmul (bvxor lt!442105 (bvlshr lt!442105 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119555 (= lt!442105 ((_ extract 31 0) (bvand (bvxor (select (arr!30414 a!3219) j!170) (bvlshr (select (arr!30414 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119555 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668638 (let ((h!22236 ((_ extract 31 0) (bvand (bvxor (select (arr!30414 a!3219) j!170) (bvlshr (select (arr!30414 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87084 (bvmul (bvxor h!22236 (bvlshr h!22236 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87084 (bvlshr x!87084 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668638 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668638 #b00000000000000000000000000000000))))))

(assert (=> d!119555 (= (toIndex!0 (select (arr!30414 a!3219) j!170) mask!3464) (bvand (bvxor lt!442106 (bvlshr lt!442106 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!999371 d!119555))

(declare-fun b!999514 () Bool)

(declare-fun e!563712 () Bool)

(declare-fun e!563713 () Bool)

(assert (=> b!999514 (= e!563712 e!563713)))

(declare-fun lt!442122 () (_ BitVec 64))

(assert (=> b!999514 (= lt!442122 (select (arr!30414 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32971 0))(
  ( (Unit!32972) )
))
(declare-fun lt!442123 () Unit!32971)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63181 (_ BitVec 64) (_ BitVec 32)) Unit!32971)

(assert (=> b!999514 (= lt!442123 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!442122 #b00000000000000000000000000000000))))

(assert (=> b!999514 (arrayContainsKey!0 a!3219 lt!442122 #b00000000000000000000000000000000)))

(declare-fun lt!442121 () Unit!32971)

(assert (=> b!999514 (= lt!442121 lt!442123)))

(declare-fun res!668652 () Bool)

(assert (=> b!999514 (= res!668652 (= (seekEntryOrOpen!0 (select (arr!30414 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9282 #b00000000000000000000000000000000)))))

(assert (=> b!999514 (=> (not res!668652) (not e!563713))))

(declare-fun b!999515 () Bool)

(declare-fun e!563714 () Bool)

(assert (=> b!999515 (= e!563714 e!563712)))

(declare-fun c!101581 () Bool)

(assert (=> b!999515 (= c!101581 (validKeyInArray!0 (select (arr!30414 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!999516 () Bool)

(declare-fun call!42325 () Bool)

(assert (=> b!999516 (= e!563713 call!42325)))

(declare-fun d!119557 () Bool)

(declare-fun res!668653 () Bool)

(assert (=> d!119557 (=> res!668653 e!563714)))

(assert (=> d!119557 (= res!668653 (bvsge #b00000000000000000000000000000000 (size!30917 a!3219)))))

(assert (=> d!119557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!563714)))

(declare-fun b!999517 () Bool)

(assert (=> b!999517 (= e!563712 call!42325)))

(declare-fun bm!42322 () Bool)

(assert (=> bm!42322 (= call!42325 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119557 (not res!668653)) b!999515))

(assert (= (and b!999515 c!101581) b!999514))

(assert (= (and b!999515 (not c!101581)) b!999517))

(assert (= (and b!999514 res!668652) b!999516))

(assert (= (or b!999516 b!999517) bm!42322))

(declare-fun m!926375 () Bool)

(assert (=> b!999514 m!926375))

(declare-fun m!926377 () Bool)

(assert (=> b!999514 m!926377))

(declare-fun m!926379 () Bool)

(assert (=> b!999514 m!926379))

(assert (=> b!999514 m!926375))

(declare-fun m!926383 () Bool)

(assert (=> b!999514 m!926383))

(assert (=> b!999515 m!926375))

(assert (=> b!999515 m!926375))

(declare-fun m!926385 () Bool)

(assert (=> b!999515 m!926385))

(declare-fun m!926387 () Bool)

(assert (=> bm!42322 m!926387))

(assert (=> b!999375 d!119557))

(declare-fun d!119561 () Bool)

(assert (=> d!119561 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86408 d!119561))

(declare-fun d!119569 () Bool)

(assert (=> d!119569 (= (array_inv!23550 a!3219) (bvsge (size!30917 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86408 d!119569))

(declare-fun b!999557 () Bool)

(declare-fun e!563746 () Bool)

(declare-fun contains!5892 (List!21061 (_ BitVec 64)) Bool)

(assert (=> b!999557 (= e!563746 (contains!5892 Nil!21058 (select (arr!30414 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119571 () Bool)

(declare-fun res!668674 () Bool)

(declare-fun e!563745 () Bool)

(assert (=> d!119571 (=> res!668674 e!563745)))

(assert (=> d!119571 (= res!668674 (bvsge #b00000000000000000000000000000000 (size!30917 a!3219)))))

(assert (=> d!119571 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21058) e!563745)))

(declare-fun b!999558 () Bool)

(declare-fun e!563744 () Bool)

(declare-fun call!42328 () Bool)

(assert (=> b!999558 (= e!563744 call!42328)))

(declare-fun b!999559 () Bool)

(declare-fun e!563743 () Bool)

(assert (=> b!999559 (= e!563743 e!563744)))

(declare-fun c!101592 () Bool)

(assert (=> b!999559 (= c!101592 (validKeyInArray!0 (select (arr!30414 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!999560 () Bool)

(assert (=> b!999560 (= e!563745 e!563743)))

(declare-fun res!668675 () Bool)

(assert (=> b!999560 (=> (not res!668675) (not e!563743))))

(assert (=> b!999560 (= res!668675 (not e!563746))))

(declare-fun res!668676 () Bool)

(assert (=> b!999560 (=> (not res!668676) (not e!563746))))

(assert (=> b!999560 (= res!668676 (validKeyInArray!0 (select (arr!30414 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42325 () Bool)

(assert (=> bm!42325 (= call!42328 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101592 (Cons!21057 (select (arr!30414 a!3219) #b00000000000000000000000000000000) Nil!21058) Nil!21058)))))

(declare-fun b!999561 () Bool)

(assert (=> b!999561 (= e!563744 call!42328)))

(assert (= (and d!119571 (not res!668674)) b!999560))

(assert (= (and b!999560 res!668676) b!999557))

(assert (= (and b!999560 res!668675) b!999559))

(assert (= (and b!999559 c!101592) b!999558))

(assert (= (and b!999559 (not c!101592)) b!999561))

(assert (= (or b!999558 b!999561) bm!42325))

(assert (=> b!999557 m!926375))

(assert (=> b!999557 m!926375))

(declare-fun m!926415 () Bool)

(assert (=> b!999557 m!926415))

(assert (=> b!999559 m!926375))

(assert (=> b!999559 m!926375))

(assert (=> b!999559 m!926385))

(assert (=> b!999560 m!926375))

(assert (=> b!999560 m!926375))

(assert (=> b!999560 m!926385))

(assert (=> bm!42325 m!926375))

(declare-fun m!926417 () Bool)

(assert (=> bm!42325 m!926417))

(assert (=> b!999370 d!119571))

(declare-fun b!999562 () Bool)

(declare-fun e!563751 () SeekEntryResult!9282)

(assert (=> b!999562 (= e!563751 (Intermediate!9282 true index!1507 x!1245))))

(declare-fun b!999563 () Bool)

(declare-fun e!563747 () SeekEntryResult!9282)

(assert (=> b!999563 (= e!563747 (Intermediate!9282 false index!1507 x!1245))))

(declare-fun b!999564 () Bool)

(declare-fun e!563750 () Bool)

(declare-fun e!563749 () Bool)

(assert (=> b!999564 (= e!563750 e!563749)))

(declare-fun res!668677 () Bool)

(declare-fun lt!442141 () SeekEntryResult!9282)

(assert (=> b!999564 (= res!668677 (and (is-Intermediate!9282 lt!442141) (not (undefined!10094 lt!442141)) (bvslt (x!87080 lt!442141) #b01111111111111111111111111111110) (bvsge (x!87080 lt!442141) #b00000000000000000000000000000000) (bvsge (x!87080 lt!442141) x!1245)))))

(assert (=> b!999564 (=> (not res!668677) (not e!563749))))

(declare-fun d!119575 () Bool)

(assert (=> d!119575 e!563750))

(declare-fun c!101594 () Bool)

(assert (=> d!119575 (= c!101594 (and (is-Intermediate!9282 lt!442141) (undefined!10094 lt!442141)))))

(assert (=> d!119575 (= lt!442141 e!563751)))

(declare-fun c!101593 () Bool)

(assert (=> d!119575 (= c!101593 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!442142 () (_ BitVec 64))

(assert (=> d!119575 (= lt!442142 (select (arr!30414 a!3219) index!1507))))

(assert (=> d!119575 (validMask!0 mask!3464)))

(assert (=> d!119575 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30414 a!3219) j!170) a!3219 mask!3464) lt!442141)))

(declare-fun b!999565 () Bool)

(assert (=> b!999565 (and (bvsge (index!39501 lt!442141) #b00000000000000000000000000000000) (bvslt (index!39501 lt!442141) (size!30917 a!3219)))))

(declare-fun res!668679 () Bool)

(assert (=> b!999565 (= res!668679 (= (select (arr!30414 a!3219) (index!39501 lt!442141)) (select (arr!30414 a!3219) j!170)))))

(declare-fun e!563748 () Bool)

(assert (=> b!999565 (=> res!668679 e!563748)))

(assert (=> b!999565 (= e!563749 e!563748)))

(declare-fun b!999566 () Bool)

(assert (=> b!999566 (and (bvsge (index!39501 lt!442141) #b00000000000000000000000000000000) (bvslt (index!39501 lt!442141) (size!30917 a!3219)))))

(assert (=> b!999566 (= e!563748 (= (select (arr!30414 a!3219) (index!39501 lt!442141)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!999567 () Bool)

(assert (=> b!999567 (= e!563750 (bvsge (x!87080 lt!442141) #b01111111111111111111111111111110))))

(declare-fun b!999568 () Bool)

(assert (=> b!999568 (and (bvsge (index!39501 lt!442141) #b00000000000000000000000000000000) (bvslt (index!39501 lt!442141) (size!30917 a!3219)))))

(declare-fun res!668678 () Bool)

(assert (=> b!999568 (= res!668678 (= (select (arr!30414 a!3219) (index!39501 lt!442141)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!999568 (=> res!668678 e!563748)))

(declare-fun b!999569 () Bool)

(assert (=> b!999569 (= e!563747 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30414 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999570 () Bool)

(assert (=> b!999570 (= e!563751 e!563747)))

(declare-fun c!101595 () Bool)

(assert (=> b!999570 (= c!101595 (or (= lt!442142 (select (arr!30414 a!3219) j!170)) (= (bvadd lt!442142 lt!442142) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!119575 c!101593) b!999562))

(assert (= (and d!119575 (not c!101593)) b!999570))

(assert (= (and b!999570 c!101595) b!999563))

(assert (= (and b!999570 (not c!101595)) b!999569))

(assert (= (and d!119575 c!101594) b!999567))

(assert (= (and d!119575 (not c!101594)) b!999564))

(assert (= (and b!999564 res!668677) b!999565))

(assert (= (and b!999565 (not res!668679)) b!999568))

(assert (= (and b!999568 (not res!668678)) b!999566))

(declare-fun m!926419 () Bool)

(assert (=> b!999565 m!926419))

(declare-fun m!926421 () Bool)

(assert (=> d!119575 m!926421))

(assert (=> d!119575 m!926321))

(assert (=> b!999566 m!926419))

(assert (=> b!999568 m!926419))

(declare-fun m!926423 () Bool)

(assert (=> b!999569 m!926423))

(assert (=> b!999569 m!926423))

(assert (=> b!999569 m!926305))

(declare-fun m!926425 () Bool)

(assert (=> b!999569 m!926425))

(assert (=> b!999379 d!119575))

(declare-fun d!119577 () Bool)

(assert (=> d!119577 (= (validKeyInArray!0 (select (arr!30414 a!3219) j!170)) (and (not (= (select (arr!30414 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30414 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!999374 d!119577))

(declare-fun d!119579 () Bool)

(assert (=> d!119579 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!999369 d!119579))

(declare-fun d!119581 () Bool)

(declare-fun res!668686 () Bool)

(declare-fun e!563759 () Bool)

(assert (=> d!119581 (=> res!668686 e!563759)))

(assert (=> d!119581 (= res!668686 (= (select (arr!30414 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119581 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!563759)))

(declare-fun b!999579 () Bool)

(declare-fun e!563760 () Bool)

(assert (=> b!999579 (= e!563759 e!563760)))

(declare-fun res!668687 () Bool)

(assert (=> b!999579 (=> (not res!668687) (not e!563760))))

(assert (=> b!999579 (= res!668687 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30917 a!3219)))))

(declare-fun b!999580 () Bool)

(assert (=> b!999580 (= e!563760 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119581 (not res!668686)) b!999579))

(assert (= (and b!999579 res!668687) b!999580))

(assert (=> d!119581 m!926375))

(declare-fun m!926437 () Bool)

(assert (=> b!999580 m!926437))

(assert (=> b!999378 d!119581))

(push 1)

(assert (not b!999569))

(assert (not bm!42325))

(assert (not b!999465))

(assert (not d!119533))

(assert (not b!999514))

(assert (not b!999559))

(assert (not b!999557))

(assert (not d!119543))

(assert (not d!119575))

(assert (not bm!42322))

(assert (not b!999560))

(assert (not b!999580))

(assert (not b!999515))

(assert (not b!999436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

