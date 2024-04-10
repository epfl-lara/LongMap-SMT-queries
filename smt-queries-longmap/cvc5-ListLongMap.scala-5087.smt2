; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69032 () Bool)

(assert start!69032)

(declare-fun b!805419 () Bool)

(declare-fun res!549939 () Bool)

(declare-fun e!446039 () Bool)

(assert (=> b!805419 (=> (not res!549939) (not e!446039))))

(declare-datatypes ((array!43822 0))(
  ( (array!43823 (arr!20991 (Array (_ BitVec 32) (_ BitVec 64))) (size!21412 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43822)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805419 (= res!549939 (validKeyInArray!0 (select (arr!20991 a!3170) j!153)))))

(declare-fun b!805420 () Bool)

(declare-fun res!549947 () Bool)

(assert (=> b!805420 (=> (not res!549947) (not e!446039))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805420 (= res!549947 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!8582 0))(
  ( (MissingZero!8582 (index!36696 (_ BitVec 32))) (Found!8582 (index!36697 (_ BitVec 32))) (Intermediate!8582 (undefined!9394 Bool) (index!36698 (_ BitVec 32)) (x!67516 (_ BitVec 32))) (Undefined!8582) (MissingVacant!8582 (index!36699 (_ BitVec 32))) )
))
(declare-fun lt!360625 () SeekEntryResult!8582)

(declare-fun b!805421 () Bool)

(declare-fun e!446042 () Bool)

(declare-fun lt!360622 () SeekEntryResult!8582)

(declare-fun lt!360621 () SeekEntryResult!8582)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805421 (= e!446042 (and (= lt!360625 lt!360621) (= lt!360621 (Found!8582 j!153)) (= (select (arr!20991 a!3170) index!1236) (select (arr!20991 a!3170) j!153)) (not (= lt!360622 (Found!8582 index!1236)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43822 (_ BitVec 32)) SeekEntryResult!8582)

(assert (=> b!805421 (= lt!360621 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20991 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43822 (_ BitVec 32)) SeekEntryResult!8582)

(assert (=> b!805421 (= lt!360625 (seekEntryOrOpen!0 (select (arr!20991 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!549941 () Bool)

(assert (=> start!69032 (=> (not res!549941) (not e!446039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69032 (= res!549941 (validMask!0 mask!3266))))

(assert (=> start!69032 e!446039))

(assert (=> start!69032 true))

(declare-fun array_inv!16787 (array!43822) Bool)

(assert (=> start!69032 (array_inv!16787 a!3170)))

(declare-fun b!805422 () Bool)

(declare-fun res!549945 () Bool)

(declare-fun e!446040 () Bool)

(assert (=> b!805422 (=> (not res!549945) (not e!446040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43822 (_ BitVec 32)) Bool)

(assert (=> b!805422 (= res!549945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805423 () Bool)

(assert (=> b!805423 (= e!446040 e!446042)))

(declare-fun res!549946 () Bool)

(assert (=> b!805423 (=> (not res!549946) (not e!446042))))

(declare-fun lt!360623 () SeekEntryResult!8582)

(assert (=> b!805423 (= res!549946 (= lt!360623 lt!360622))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360626 () (_ BitVec 64))

(declare-fun lt!360620 () array!43822)

(assert (=> b!805423 (= lt!360622 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360626 lt!360620 mask!3266))))

(assert (=> b!805423 (= lt!360623 (seekEntryOrOpen!0 lt!360626 lt!360620 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805423 (= lt!360626 (select (store (arr!20991 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805423 (= lt!360620 (array!43823 (store (arr!20991 a!3170) i!1163 k!2044) (size!21412 a!3170)))))

(declare-fun b!805424 () Bool)

(declare-fun res!549938 () Bool)

(assert (=> b!805424 (=> (not res!549938) (not e!446039))))

(assert (=> b!805424 (= res!549938 (and (= (size!21412 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21412 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21412 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805425 () Bool)

(assert (=> b!805425 (= e!446039 e!446040)))

(declare-fun res!549943 () Bool)

(assert (=> b!805425 (=> (not res!549943) (not e!446040))))

(declare-fun lt!360624 () SeekEntryResult!8582)

(assert (=> b!805425 (= res!549943 (or (= lt!360624 (MissingZero!8582 i!1163)) (= lt!360624 (MissingVacant!8582 i!1163))))))

(assert (=> b!805425 (= lt!360624 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805426 () Bool)

(declare-fun res!549940 () Bool)

(assert (=> b!805426 (=> (not res!549940) (not e!446040))))

(assert (=> b!805426 (= res!549940 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21412 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20991 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21412 a!3170)) (= (select (arr!20991 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805427 () Bool)

(declare-fun res!549944 () Bool)

(assert (=> b!805427 (=> (not res!549944) (not e!446040))))

(declare-datatypes ((List!14954 0))(
  ( (Nil!14951) (Cons!14950 (h!16079 (_ BitVec 64)) (t!21269 List!14954)) )
))
(declare-fun arrayNoDuplicates!0 (array!43822 (_ BitVec 32) List!14954) Bool)

(assert (=> b!805427 (= res!549944 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14951))))

(declare-fun b!805428 () Bool)

(declare-fun res!549942 () Bool)

(assert (=> b!805428 (=> (not res!549942) (not e!446039))))

(assert (=> b!805428 (= res!549942 (validKeyInArray!0 k!2044))))

(assert (= (and start!69032 res!549941) b!805424))

(assert (= (and b!805424 res!549938) b!805419))

(assert (= (and b!805419 res!549939) b!805428))

(assert (= (and b!805428 res!549942) b!805420))

(assert (= (and b!805420 res!549947) b!805425))

(assert (= (and b!805425 res!549943) b!805422))

(assert (= (and b!805422 res!549945) b!805427))

(assert (= (and b!805427 res!549944) b!805426))

(assert (= (and b!805426 res!549940) b!805423))

(assert (= (and b!805423 res!549946) b!805421))

(declare-fun m!747365 () Bool)

(assert (=> b!805421 m!747365))

(declare-fun m!747367 () Bool)

(assert (=> b!805421 m!747367))

(assert (=> b!805421 m!747367))

(declare-fun m!747369 () Bool)

(assert (=> b!805421 m!747369))

(assert (=> b!805421 m!747367))

(declare-fun m!747371 () Bool)

(assert (=> b!805421 m!747371))

(declare-fun m!747373 () Bool)

(assert (=> b!805420 m!747373))

(declare-fun m!747375 () Bool)

(assert (=> b!805428 m!747375))

(declare-fun m!747377 () Bool)

(assert (=> b!805422 m!747377))

(assert (=> b!805419 m!747367))

(assert (=> b!805419 m!747367))

(declare-fun m!747379 () Bool)

(assert (=> b!805419 m!747379))

(declare-fun m!747381 () Bool)

(assert (=> start!69032 m!747381))

(declare-fun m!747383 () Bool)

(assert (=> start!69032 m!747383))

(declare-fun m!747385 () Bool)

(assert (=> b!805427 m!747385))

(declare-fun m!747387 () Bool)

(assert (=> b!805425 m!747387))

(declare-fun m!747389 () Bool)

(assert (=> b!805423 m!747389))

(declare-fun m!747391 () Bool)

(assert (=> b!805423 m!747391))

(declare-fun m!747393 () Bool)

(assert (=> b!805423 m!747393))

(declare-fun m!747395 () Bool)

(assert (=> b!805423 m!747395))

(declare-fun m!747397 () Bool)

(assert (=> b!805426 m!747397))

(declare-fun m!747399 () Bool)

(assert (=> b!805426 m!747399))

(push 1)

(assert (not b!805419))

(assert (not b!805422))

(assert (not b!805428))

(assert (not b!805427))

(assert (not b!805421))

(assert (not start!69032))

(assert (not b!805420))

(assert (not b!805423))

(assert (not b!805425))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103563 () Bool)

(declare-fun res!550027 () Bool)

(declare-fun e!446089 () Bool)

(assert (=> d!103563 (=> res!550027 e!446089)))

(assert (=> d!103563 (= res!550027 (= (select (arr!20991 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!103563 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!446089)))

(declare-fun b!805514 () Bool)

(declare-fun e!446090 () Bool)

(assert (=> b!805514 (= e!446089 e!446090)))

(declare-fun res!550028 () Bool)

(assert (=> b!805514 (=> (not res!550028) (not e!446090))))

(assert (=> b!805514 (= res!550028 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21412 a!3170)))))

(declare-fun b!805515 () Bool)

(assert (=> b!805515 (= e!446090 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103563 (not res!550027)) b!805514))

(assert (= (and b!805514 res!550028) b!805515))

(declare-fun m!747483 () Bool)

(assert (=> d!103563 m!747483))

(declare-fun m!747485 () Bool)

(assert (=> b!805515 m!747485))

(assert (=> b!805420 d!103563))

(declare-fun b!805564 () Bool)

(declare-fun e!446116 () SeekEntryResult!8582)

(assert (=> b!805564 (= e!446116 Undefined!8582)))

(declare-fun d!103565 () Bool)

(declare-fun lt!360689 () SeekEntryResult!8582)

(assert (=> d!103565 (and (or (is-Undefined!8582 lt!360689) (not (is-Found!8582 lt!360689)) (and (bvsge (index!36697 lt!360689) #b00000000000000000000000000000000) (bvslt (index!36697 lt!360689) (size!21412 a!3170)))) (or (is-Undefined!8582 lt!360689) (is-Found!8582 lt!360689) (not (is-MissingZero!8582 lt!360689)) (and (bvsge (index!36696 lt!360689) #b00000000000000000000000000000000) (bvslt (index!36696 lt!360689) (size!21412 a!3170)))) (or (is-Undefined!8582 lt!360689) (is-Found!8582 lt!360689) (is-MissingZero!8582 lt!360689) (not (is-MissingVacant!8582 lt!360689)) (and (bvsge (index!36699 lt!360689) #b00000000000000000000000000000000) (bvslt (index!36699 lt!360689) (size!21412 a!3170)))) (or (is-Undefined!8582 lt!360689) (ite (is-Found!8582 lt!360689) (= (select (arr!20991 a!3170) (index!36697 lt!360689)) k!2044) (ite (is-MissingZero!8582 lt!360689) (= (select (arr!20991 a!3170) (index!36696 lt!360689)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8582 lt!360689) (= (select (arr!20991 a!3170) (index!36699 lt!360689)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103565 (= lt!360689 e!446116)))

(declare-fun c!88178 () Bool)

(declare-fun lt!360688 () SeekEntryResult!8582)

(assert (=> d!103565 (= c!88178 (and (is-Intermediate!8582 lt!360688) (undefined!9394 lt!360688)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43822 (_ BitVec 32)) SeekEntryResult!8582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103565 (= lt!360688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103565 (validMask!0 mask!3266)))

(assert (=> d!103565 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!360689)))

(declare-fun b!805565 () Bool)

(declare-fun e!446115 () SeekEntryResult!8582)

(assert (=> b!805565 (= e!446115 (MissingZero!8582 (index!36698 lt!360688)))))

(declare-fun b!805566 () Bool)

(declare-fun c!88180 () Bool)

(declare-fun lt!360687 () (_ BitVec 64))

(assert (=> b!805566 (= c!88180 (= lt!360687 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446117 () SeekEntryResult!8582)

(assert (=> b!805566 (= e!446117 e!446115)))

(declare-fun b!805567 () Bool)

(assert (=> b!805567 (= e!446115 (seekKeyOrZeroReturnVacant!0 (x!67516 lt!360688) (index!36698 lt!360688) (index!36698 lt!360688) k!2044 a!3170 mask!3266))))

(declare-fun b!805568 () Bool)

(assert (=> b!805568 (= e!446116 e!446117)))

(assert (=> b!805568 (= lt!360687 (select (arr!20991 a!3170) (index!36698 lt!360688)))))

(declare-fun c!88179 () Bool)

(assert (=> b!805568 (= c!88179 (= lt!360687 k!2044))))

(declare-fun b!805569 () Bool)

(assert (=> b!805569 (= e!446117 (Found!8582 (index!36698 lt!360688)))))

(assert (= (and d!103565 c!88178) b!805564))

(assert (= (and d!103565 (not c!88178)) b!805568))

(assert (= (and b!805568 c!88179) b!805569))

(assert (= (and b!805568 (not c!88179)) b!805566))

(assert (= (and b!805566 c!88180) b!805565))

(assert (= (and b!805566 (not c!88180)) b!805567))

(declare-fun m!747503 () Bool)

(assert (=> d!103565 m!747503))

(declare-fun m!747505 () Bool)

(assert (=> d!103565 m!747505))

(declare-fun m!747507 () Bool)

(assert (=> d!103565 m!747507))

(declare-fun m!747509 () Bool)

(assert (=> d!103565 m!747509))

(declare-fun m!747511 () Bool)

(assert (=> d!103565 m!747511))

(assert (=> d!103565 m!747381))

(assert (=> d!103565 m!747509))

(declare-fun m!747513 () Bool)

(assert (=> b!805567 m!747513))

(declare-fun m!747515 () Bool)

(assert (=> b!805568 m!747515))

(assert (=> b!805425 d!103565))

(declare-fun d!103575 () Bool)

(assert (=> d!103575 (= (validKeyInArray!0 (select (arr!20991 a!3170) j!153)) (and (not (= (select (arr!20991 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20991 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!805419 d!103575))

(declare-fun b!805612 () Bool)

(declare-fun c!88203 () Bool)

(declare-fun lt!360710 () (_ BitVec 64))

(assert (=> b!805612 (= c!88203 (= lt!360710 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446139 () SeekEntryResult!8582)

(declare-fun e!446141 () SeekEntryResult!8582)

(assert (=> b!805612 (= e!446139 e!446141)))

(declare-fun b!805613 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!805613 (= e!446141 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!360626 lt!360620 mask!3266))))

(declare-fun b!805614 () Bool)

(declare-fun e!446140 () SeekEntryResult!8582)

(assert (=> b!805614 (= e!446140 e!446139)))

(declare-fun c!88202 () Bool)

(assert (=> b!805614 (= c!88202 (= lt!360710 lt!360626))))

(declare-fun b!805615 () Bool)

(assert (=> b!805615 (= e!446140 Undefined!8582)))

(declare-fun b!805616 () Bool)

(assert (=> b!805616 (= e!446141 (MissingVacant!8582 vacantAfter!23))))

(declare-fun lt!360709 () SeekEntryResult!8582)

(declare-fun d!103577 () Bool)

(assert (=> d!103577 (and (or (is-Undefined!8582 lt!360709) (not (is-Found!8582 lt!360709)) (and (bvsge (index!36697 lt!360709) #b00000000000000000000000000000000) (bvslt (index!36697 lt!360709) (size!21412 lt!360620)))) (or (is-Undefined!8582 lt!360709) (is-Found!8582 lt!360709) (not (is-MissingVacant!8582 lt!360709)) (not (= (index!36699 lt!360709) vacantAfter!23)) (and (bvsge (index!36699 lt!360709) #b00000000000000000000000000000000) (bvslt (index!36699 lt!360709) (size!21412 lt!360620)))) (or (is-Undefined!8582 lt!360709) (ite (is-Found!8582 lt!360709) (= (select (arr!20991 lt!360620) (index!36697 lt!360709)) lt!360626) (and (is-MissingVacant!8582 lt!360709) (= (index!36699 lt!360709) vacantAfter!23) (= (select (arr!20991 lt!360620) (index!36699 lt!360709)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103577 (= lt!360709 e!446140)))

(declare-fun c!88204 () Bool)

(assert (=> d!103577 (= c!88204 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103577 (= lt!360710 (select (arr!20991 lt!360620) index!1236))))

(assert (=> d!103577 (validMask!0 mask!3266)))

(assert (=> d!103577 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360626 lt!360620 mask!3266) lt!360709)))

(declare-fun b!805617 () Bool)

(assert (=> b!805617 (= e!446139 (Found!8582 index!1236))))

(assert (= (and d!103577 c!88204) b!805615))

(assert (= (and d!103577 (not c!88204)) b!805614))

(assert (= (and b!805614 c!88202) b!805617))

(assert (= (and b!805614 (not c!88202)) b!805612))

(assert (= (and b!805612 c!88203) b!805616))

(assert (= (and b!805612 (not c!88203)) b!805613))

(declare-fun m!747531 () Bool)

(assert (=> b!805613 m!747531))

(assert (=> b!805613 m!747531))

(declare-fun m!747533 () Bool)

(assert (=> b!805613 m!747533))

(declare-fun m!747535 () Bool)

(assert (=> d!103577 m!747535))

(declare-fun m!747537 () Bool)

(assert (=> d!103577 m!747537))

(declare-fun m!747539 () Bool)

(assert (=> d!103577 m!747539))

(assert (=> d!103577 m!747381))

(assert (=> b!805423 d!103577))

(declare-fun b!805630 () Bool)

(declare-fun e!446152 () SeekEntryResult!8582)

(assert (=> b!805630 (= e!446152 Undefined!8582)))

(declare-fun d!103581 () Bool)

(declare-fun lt!360722 () SeekEntryResult!8582)

(assert (=> d!103581 (and (or (is-Undefined!8582 lt!360722) (not (is-Found!8582 lt!360722)) (and (bvsge (index!36697 lt!360722) #b00000000000000000000000000000000) (bvslt (index!36697 lt!360722) (size!21412 lt!360620)))) (or (is-Undefined!8582 lt!360722) (is-Found!8582 lt!360722) (not (is-MissingZero!8582 lt!360722)) (and (bvsge (index!36696 lt!360722) #b00000000000000000000000000000000) (bvslt (index!36696 lt!360722) (size!21412 lt!360620)))) (or (is-Undefined!8582 lt!360722) (is-Found!8582 lt!360722) (is-MissingZero!8582 lt!360722) (not (is-MissingVacant!8582 lt!360722)) (and (bvsge (index!36699 lt!360722) #b00000000000000000000000000000000) (bvslt (index!36699 lt!360722) (size!21412 lt!360620)))) (or (is-Undefined!8582 lt!360722) (ite (is-Found!8582 lt!360722) (= (select (arr!20991 lt!360620) (index!36697 lt!360722)) lt!360626) (ite (is-MissingZero!8582 lt!360722) (= (select (arr!20991 lt!360620) (index!36696 lt!360722)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8582 lt!360722) (= (select (arr!20991 lt!360620) (index!36699 lt!360722)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103581 (= lt!360722 e!446152)))

(declare-fun c!88210 () Bool)

(declare-fun lt!360721 () SeekEntryResult!8582)

(assert (=> d!103581 (= c!88210 (and (is-Intermediate!8582 lt!360721) (undefined!9394 lt!360721)))))

(assert (=> d!103581 (= lt!360721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!360626 mask!3266) lt!360626 lt!360620 mask!3266))))

(assert (=> d!103581 (validMask!0 mask!3266)))

(assert (=> d!103581 (= (seekEntryOrOpen!0 lt!360626 lt!360620 mask!3266) lt!360722)))

(declare-fun b!805631 () Bool)

(declare-fun e!446151 () SeekEntryResult!8582)

(assert (=> b!805631 (= e!446151 (MissingZero!8582 (index!36698 lt!360721)))))

(declare-fun b!805632 () Bool)

(declare-fun c!88212 () Bool)

(declare-fun lt!360720 () (_ BitVec 64))

(assert (=> b!805632 (= c!88212 (= lt!360720 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446153 () SeekEntryResult!8582)

(assert (=> b!805632 (= e!446153 e!446151)))

(declare-fun b!805633 () Bool)

(assert (=> b!805633 (= e!446151 (seekKeyOrZeroReturnVacant!0 (x!67516 lt!360721) (index!36698 lt!360721) (index!36698 lt!360721) lt!360626 lt!360620 mask!3266))))

(declare-fun b!805634 () Bool)

(assert (=> b!805634 (= e!446152 e!446153)))

(assert (=> b!805634 (= lt!360720 (select (arr!20991 lt!360620) (index!36698 lt!360721)))))

(declare-fun c!88211 () Bool)

(assert (=> b!805634 (= c!88211 (= lt!360720 lt!360626))))

(declare-fun b!805635 () Bool)

(assert (=> b!805635 (= e!446153 (Found!8582 (index!36698 lt!360721)))))

(assert (= (and d!103581 c!88210) b!805630))

(assert (= (and d!103581 (not c!88210)) b!805634))

(assert (= (and b!805634 c!88211) b!805635))

(assert (= (and b!805634 (not c!88211)) b!805632))

(assert (= (and b!805632 c!88212) b!805631))

(assert (= (and b!805632 (not c!88212)) b!805633))

(declare-fun m!747547 () Bool)

(assert (=> d!103581 m!747547))

(declare-fun m!747553 () Bool)

(assert (=> d!103581 m!747553))

(declare-fun m!747557 () Bool)

(assert (=> d!103581 m!747557))

(declare-fun m!747559 () Bool)

(assert (=> d!103581 m!747559))

(declare-fun m!747561 () Bool)

(assert (=> d!103581 m!747561))

(assert (=> d!103581 m!747381))

(assert (=> d!103581 m!747559))

(declare-fun m!747565 () Bool)

(assert (=> b!805633 m!747565))

(declare-fun m!747567 () Bool)

(assert (=> b!805634 m!747567))

(assert (=> b!805423 d!103581))

(declare-fun d!103585 () Bool)

(assert (=> d!103585 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!805428 d!103585))

(declare-fun bm!35352 () Bool)

(declare-fun call!35355 () Bool)

(assert (=> bm!35352 (= call!35355 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!805682 () Bool)

(declare-fun e!446185 () Bool)

(assert (=> b!805682 (= e!446185 call!35355)))

(declare-fun b!805683 () Bool)

(declare-fun e!446184 () Bool)

(declare-fun e!446186 () Bool)

(assert (=> b!805683 (= e!446184 e!446186)))

(declare-fun c!88227 () Bool)

(assert (=> b!805683 (= c!88227 (validKeyInArray!0 (select (arr!20991 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!805685 () Bool)

(assert (=> b!805685 (= e!446186 call!35355)))

(declare-fun b!805684 () Bool)

(assert (=> b!805684 (= e!446186 e!446185)))

(declare-fun lt!360747 () (_ BitVec 64))

(assert (=> b!805684 (= lt!360747 (select (arr!20991 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27604 0))(
  ( (Unit!27605) )
))
(declare-fun lt!360746 () Unit!27604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43822 (_ BitVec 64) (_ BitVec 32)) Unit!27604)

(assert (=> b!805684 (= lt!360746 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!360747 #b00000000000000000000000000000000))))

(assert (=> b!805684 (arrayContainsKey!0 a!3170 lt!360747 #b00000000000000000000000000000000)))

(declare-fun lt!360748 () Unit!27604)

(assert (=> b!805684 (= lt!360748 lt!360746)))

(declare-fun res!550050 () Bool)

(assert (=> b!805684 (= res!550050 (= (seekEntryOrOpen!0 (select (arr!20991 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8582 #b00000000000000000000000000000000)))))

(assert (=> b!805684 (=> (not res!550050) (not e!446185))))

(declare-fun d!103587 () Bool)

(declare-fun res!550049 () Bool)

(assert (=> d!103587 (=> res!550049 e!446184)))

(assert (=> d!103587 (= res!550049 (bvsge #b00000000000000000000000000000000 (size!21412 a!3170)))))

(assert (=> d!103587 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!446184)))

(assert (= (and d!103587 (not res!550049)) b!805683))

(assert (= (and b!805683 c!88227) b!805684))

(assert (= (and b!805683 (not c!88227)) b!805685))

(assert (= (and b!805684 res!550050) b!805682))

(assert (= (or b!805682 b!805685) bm!35352))

(declare-fun m!747617 () Bool)

(assert (=> bm!35352 m!747617))

(assert (=> b!805683 m!747483))

(assert (=> b!805683 m!747483))

(declare-fun m!747619 () Bool)

(assert (=> b!805683 m!747619))

(assert (=> b!805684 m!747483))

(declare-fun m!747621 () Bool)

(assert (=> b!805684 m!747621))

(declare-fun m!747623 () Bool)

(assert (=> b!805684 m!747623))

(assert (=> b!805684 m!747483))

(declare-fun m!747625 () Bool)

(assert (=> b!805684 m!747625))

(assert (=> b!805422 d!103587))

(declare-fun d!103599 () Bool)

(declare-fun res!550061 () Bool)

(declare-fun e!446206 () Bool)

(assert (=> d!103599 (=> res!550061 e!446206)))

(assert (=> d!103599 (= res!550061 (bvsge #b00000000000000000000000000000000 (size!21412 a!3170)))))

(assert (=> d!103599 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14951) e!446206)))

(declare-fun b!805712 () Bool)

(declare-fun e!446207 () Bool)

(declare-fun e!446204 () Bool)

(assert (=> b!805712 (= e!446207 e!446204)))

(declare-fun c!88237 () Bool)

(assert (=> b!805712 (= c!88237 (validKeyInArray!0 (select (arr!20991 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!805713 () Bool)

(declare-fun call!35361 () Bool)

(assert (=> b!805713 (= e!446204 call!35361)))

(declare-fun bm!35358 () Bool)

(assert (=> bm!35358 (= call!35361 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88237 (Cons!14950 (select (arr!20991 a!3170) #b00000000000000000000000000000000) Nil!14951) Nil!14951)))))

(declare-fun b!805714 () Bool)

(assert (=> b!805714 (= e!446206 e!446207)))

(declare-fun res!550060 () Bool)

(assert (=> b!805714 (=> (not res!550060) (not e!446207))))

(declare-fun e!446205 () Bool)

(assert (=> b!805714 (= res!550060 (not e!446205))))

(declare-fun res!550059 () Bool)

(assert (=> b!805714 (=> (not res!550059) (not e!446205))))

(assert (=> b!805714 (= res!550059 (validKeyInArray!0 (select (arr!20991 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!805715 () Bool)

(declare-fun contains!4122 (List!14954 (_ BitVec 64)) Bool)

(assert (=> b!805715 (= e!446205 (contains!4122 Nil!14951 (select (arr!20991 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!805716 () Bool)

(assert (=> b!805716 (= e!446204 call!35361)))

(assert (= (and d!103599 (not res!550061)) b!805714))

(assert (= (and b!805714 res!550059) b!805715))

(assert (= (and b!805714 res!550060) b!805712))

(assert (= (and b!805712 c!88237) b!805713))

(assert (= (and b!805712 (not c!88237)) b!805716))

(assert (= (or b!805713 b!805716) bm!35358))

(assert (=> b!805712 m!747483))

(assert (=> b!805712 m!747483))

(assert (=> b!805712 m!747619))

(assert (=> bm!35358 m!747483))

(declare-fun m!747659 () Bool)

(assert (=> bm!35358 m!747659))

(assert (=> b!805714 m!747483))

(assert (=> b!805714 m!747483))

(assert (=> b!805714 m!747619))

(assert (=> b!805715 m!747483))

(assert (=> b!805715 m!747483))

(declare-fun m!747661 () Bool)

(assert (=> b!805715 m!747661))

(assert (=> b!805427 d!103599))

(declare-fun b!805717 () Bool)

(declare-fun c!88239 () Bool)

(declare-fun lt!360758 () (_ BitVec 64))

(assert (=> b!805717 (= c!88239 (= lt!360758 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446208 () SeekEntryResult!8582)

(declare-fun e!446210 () SeekEntryResult!8582)

(assert (=> b!805717 (= e!446208 e!446210)))

(declare-fun b!805718 () Bool)

(assert (=> b!805718 (= e!446210 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!20991 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805719 () Bool)

(declare-fun e!446209 () SeekEntryResult!8582)

(assert (=> b!805719 (= e!446209 e!446208)))

(declare-fun c!88238 () Bool)

(assert (=> b!805719 (= c!88238 (= lt!360758 (select (arr!20991 a!3170) j!153)))))

(declare-fun b!805720 () Bool)

(assert (=> b!805720 (= e!446209 Undefined!8582)))

(declare-fun b!805721 () Bool)

(assert (=> b!805721 (= e!446210 (MissingVacant!8582 vacantBefore!23))))

(declare-fun lt!360757 () SeekEntryResult!8582)

(declare-fun d!103607 () Bool)

(assert (=> d!103607 (and (or (is-Undefined!8582 lt!360757) (not (is-Found!8582 lt!360757)) (and (bvsge (index!36697 lt!360757) #b00000000000000000000000000000000) (bvslt (index!36697 lt!360757) (size!21412 a!3170)))) (or (is-Undefined!8582 lt!360757) (is-Found!8582 lt!360757) (not (is-MissingVacant!8582 lt!360757)) (not (= (index!36699 lt!360757) vacantBefore!23)) (and (bvsge (index!36699 lt!360757) #b00000000000000000000000000000000) (bvslt (index!36699 lt!360757) (size!21412 a!3170)))) (or (is-Undefined!8582 lt!360757) (ite (is-Found!8582 lt!360757) (= (select (arr!20991 a!3170) (index!36697 lt!360757)) (select (arr!20991 a!3170) j!153)) (and (is-MissingVacant!8582 lt!360757) (= (index!36699 lt!360757) vacantBefore!23) (= (select (arr!20991 a!3170) (index!36699 lt!360757)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103607 (= lt!360757 e!446209)))

(declare-fun c!88240 () Bool)

(assert (=> d!103607 (= c!88240 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103607 (= lt!360758 (select (arr!20991 a!3170) index!1236))))

(assert (=> d!103607 (validMask!0 mask!3266)))

(assert (=> d!103607 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20991 a!3170) j!153) a!3170 mask!3266) lt!360757)))

(declare-fun b!805722 () Bool)

(assert (=> b!805722 (= e!446208 (Found!8582 index!1236))))

(assert (= (and d!103607 c!88240) b!805720))

(assert (= (and d!103607 (not c!88240)) b!805719))

(assert (= (and b!805719 c!88238) b!805722))

(assert (= (and b!805719 (not c!88238)) b!805717))

(assert (= (and b!805717 c!88239) b!805721))

(assert (= (and b!805717 (not c!88239)) b!805718))

(assert (=> b!805718 m!747531))

(assert (=> b!805718 m!747531))

(assert (=> b!805718 m!747367))

(declare-fun m!747663 () Bool)

(assert (=> b!805718 m!747663))

(declare-fun m!747665 () Bool)

(assert (=> d!103607 m!747665))

(declare-fun m!747667 () Bool)

(assert (=> d!103607 m!747667))

(assert (=> d!103607 m!747365))

(assert (=> d!103607 m!747381))

(assert (=> b!805421 d!103607))

(declare-fun b!805723 () Bool)

(declare-fun e!446212 () SeekEntryResult!8582)

(assert (=> b!805723 (= e!446212 Undefined!8582)))

(declare-fun d!103609 () Bool)

(declare-fun lt!360761 () SeekEntryResult!8582)

(assert (=> d!103609 (and (or (is-Undefined!8582 lt!360761) (not (is-Found!8582 lt!360761)) (and (bvsge (index!36697 lt!360761) #b00000000000000000000000000000000) (bvslt (index!36697 lt!360761) (size!21412 a!3170)))) (or (is-Undefined!8582 lt!360761) (is-Found!8582 lt!360761) (not (is-MissingZero!8582 lt!360761)) (and (bvsge (index!36696 lt!360761) #b00000000000000000000000000000000) (bvslt (index!36696 lt!360761) (size!21412 a!3170)))) (or (is-Undefined!8582 lt!360761) (is-Found!8582 lt!360761) (is-MissingZero!8582 lt!360761) (not (is-MissingVacant!8582 lt!360761)) (and (bvsge (index!36699 lt!360761) #b00000000000000000000000000000000) (bvslt (index!36699 lt!360761) (size!21412 a!3170)))) (or (is-Undefined!8582 lt!360761) (ite (is-Found!8582 lt!360761) (= (select (arr!20991 a!3170) (index!36697 lt!360761)) (select (arr!20991 a!3170) j!153)) (ite (is-MissingZero!8582 lt!360761) (= (select (arr!20991 a!3170) (index!36696 lt!360761)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8582 lt!360761) (= (select (arr!20991 a!3170) (index!36699 lt!360761)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103609 (= lt!360761 e!446212)))

(declare-fun c!88241 () Bool)

(declare-fun lt!360760 () SeekEntryResult!8582)

(assert (=> d!103609 (= c!88241 (and (is-Intermediate!8582 lt!360760) (undefined!9394 lt!360760)))))

(assert (=> d!103609 (= lt!360760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20991 a!3170) j!153) mask!3266) (select (arr!20991 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103609 (validMask!0 mask!3266)))

(assert (=> d!103609 (= (seekEntryOrOpen!0 (select (arr!20991 a!3170) j!153) a!3170 mask!3266) lt!360761)))

(declare-fun b!805724 () Bool)

(declare-fun e!446211 () SeekEntryResult!8582)

(assert (=> b!805724 (= e!446211 (MissingZero!8582 (index!36698 lt!360760)))))

(declare-fun b!805725 () Bool)

(declare-fun c!88243 () Bool)

(declare-fun lt!360759 () (_ BitVec 64))

(assert (=> b!805725 (= c!88243 (= lt!360759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446213 () SeekEntryResult!8582)

(assert (=> b!805725 (= e!446213 e!446211)))

(declare-fun b!805726 () Bool)

(assert (=> b!805726 (= e!446211 (seekKeyOrZeroReturnVacant!0 (x!67516 lt!360760) (index!36698 lt!360760) (index!36698 lt!360760) (select (arr!20991 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805727 () Bool)

(assert (=> b!805727 (= e!446212 e!446213)))

(assert (=> b!805727 (= lt!360759 (select (arr!20991 a!3170) (index!36698 lt!360760)))))

(declare-fun c!88242 () Bool)

(assert (=> b!805727 (= c!88242 (= lt!360759 (select (arr!20991 a!3170) j!153)))))

(declare-fun b!805728 () Bool)

(assert (=> b!805728 (= e!446213 (Found!8582 (index!36698 lt!360760)))))

(assert (= (and d!103609 c!88241) b!805723))

(assert (= (and d!103609 (not c!88241)) b!805727))

(assert (= (and b!805727 c!88242) b!805728))

(assert (= (and b!805727 (not c!88242)) b!805725))

(assert (= (and b!805725 c!88243) b!805724))

(assert (= (and b!805725 (not c!88243)) b!805726))

(declare-fun m!747669 () Bool)

(assert (=> d!103609 m!747669))

(declare-fun m!747671 () Bool)

(assert (=> d!103609 m!747671))

(declare-fun m!747673 () Bool)

(assert (=> d!103609 m!747673))

(declare-fun m!747675 () Bool)

(assert (=> d!103609 m!747675))

(assert (=> d!103609 m!747367))

(declare-fun m!747677 () Bool)

(assert (=> d!103609 m!747677))

(assert (=> d!103609 m!747381))

(assert (=> d!103609 m!747367))

(assert (=> d!103609 m!747675))

(assert (=> b!805726 m!747367))

(declare-fun m!747679 () Bool)

(assert (=> b!805726 m!747679))

(declare-fun m!747681 () Bool)

(assert (=> b!805727 m!747681))

(assert (=> b!805421 d!103609))

(declare-fun d!103611 () Bool)

(assert (=> d!103611 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69032 d!103611))

(declare-fun d!103621 () Bool)

(assert (=> d!103621 (= (array_inv!16787 a!3170) (bvsge (size!21412 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69032 d!103621))

(push 1)

