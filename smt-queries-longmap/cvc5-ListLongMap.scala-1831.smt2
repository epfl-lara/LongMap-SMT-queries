; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33142 () Bool)

(assert start!33142)

(declare-fun b!329619 () Bool)

(declare-fun res!181643 () Bool)

(declare-fun e!202473 () Bool)

(assert (=> b!329619 (=> (not res!181643) (not e!202473))))

(declare-datatypes ((array!16852 0))(
  ( (array!16853 (arr!7970 (Array (_ BitVec 32) (_ BitVec 64))) (size!8322 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16852)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16852 (_ BitVec 32)) Bool)

(assert (=> b!329619 (= res!181643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329620 () Bool)

(declare-fun e!202471 () Bool)

(assert (=> b!329620 (= e!202471 true)))

(declare-datatypes ((Unit!10206 0))(
  ( (Unit!10207) )
))
(declare-fun lt!158294 () Unit!10206)

(declare-fun e!202474 () Unit!10206)

(assert (=> b!329620 (= lt!158294 e!202474)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun c!51630 () Bool)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3101 0))(
  ( (MissingZero!3101 (index!14580 (_ BitVec 32))) (Found!3101 (index!14581 (_ BitVec 32))) (Intermediate!3101 (undefined!3913 Bool) (index!14582 (_ BitVec 32)) (x!32859 (_ BitVec 32))) (Undefined!3101) (MissingVacant!3101 (index!14583 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16852 (_ BitVec 32)) SeekEntryResult!3101)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329620 (= c!51630 (is-Intermediate!3101 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun b!329621 () Bool)

(declare-fun res!181644 () Bool)

(assert (=> b!329621 (=> (not res!181644) (not e!202473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329621 (= res!181644 (validKeyInArray!0 k!2497))))

(declare-fun b!329622 () Bool)

(declare-fun Unit!10208 () Unit!10206)

(assert (=> b!329622 (= e!202474 Unit!10208)))

(assert (=> b!329622 false))

(declare-fun b!329623 () Bool)

(declare-fun res!181646 () Bool)

(assert (=> b!329623 (=> (not res!181646) (not e!202473))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329623 (= res!181646 (and (= (size!8322 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8322 a!3305))))))

(declare-fun b!329624 () Bool)

(assert (=> b!329624 (= e!202473 e!202471)))

(declare-fun res!181650 () Bool)

(assert (=> b!329624 (=> (not res!181650) (not e!202471))))

(declare-fun lt!158295 () SeekEntryResult!3101)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329624 (= res!181650 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158295))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!329624 (= lt!158295 (Intermediate!3101 false resIndex!58 resX!58))))

(declare-fun b!329625 () Bool)

(declare-fun res!181649 () Bool)

(assert (=> b!329625 (=> (not res!181649) (not e!202473))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16852 (_ BitVec 32)) SeekEntryResult!3101)

(assert (=> b!329625 (= res!181649 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3101 i!1250)))))

(declare-fun b!329626 () Bool)

(declare-fun res!181647 () Bool)

(assert (=> b!329626 (=> (not res!181647) (not e!202471))))

(assert (=> b!329626 (= res!181647 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158295))))

(declare-fun b!329627 () Bool)

(declare-fun res!181645 () Bool)

(assert (=> b!329627 (=> (not res!181645) (not e!202471))))

(assert (=> b!329627 (= res!181645 (and (= (select (arr!7970 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8322 a!3305))))))

(declare-fun b!329628 () Bool)

(declare-fun res!181648 () Bool)

(assert (=> b!329628 (=> (not res!181648) (not e!202473))))

(declare-fun arrayContainsKey!0 (array!16852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329628 (= res!181648 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!181641 () Bool)

(assert (=> start!33142 (=> (not res!181641) (not e!202473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33142 (= res!181641 (validMask!0 mask!3777))))

(assert (=> start!33142 e!202473))

(declare-fun array_inv!5933 (array!16852) Bool)

(assert (=> start!33142 (array_inv!5933 a!3305)))

(assert (=> start!33142 true))

(declare-fun b!329629 () Bool)

(declare-fun res!181642 () Bool)

(assert (=> b!329629 (=> (not res!181642) (not e!202471))))

(assert (=> b!329629 (= res!181642 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7970 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7970 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7970 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!329630 () Bool)

(declare-fun Unit!10209 () Unit!10206)

(assert (=> b!329630 (= e!202474 Unit!10209)))

(assert (= (and start!33142 res!181641) b!329623))

(assert (= (and b!329623 res!181646) b!329621))

(assert (= (and b!329621 res!181644) b!329628))

(assert (= (and b!329628 res!181648) b!329625))

(assert (= (and b!329625 res!181649) b!329619))

(assert (= (and b!329619 res!181643) b!329624))

(assert (= (and b!329624 res!181650) b!329627))

(assert (= (and b!329627 res!181645) b!329626))

(assert (= (and b!329626 res!181647) b!329629))

(assert (= (and b!329629 res!181642) b!329620))

(assert (= (and b!329620 c!51630) b!329630))

(assert (= (and b!329620 (not c!51630)) b!329622))

(declare-fun m!335207 () Bool)

(assert (=> b!329621 m!335207))

(declare-fun m!335209 () Bool)

(assert (=> b!329625 m!335209))

(declare-fun m!335211 () Bool)

(assert (=> b!329624 m!335211))

(assert (=> b!329624 m!335211))

(declare-fun m!335213 () Bool)

(assert (=> b!329624 m!335213))

(declare-fun m!335215 () Bool)

(assert (=> b!329629 m!335215))

(declare-fun m!335217 () Bool)

(assert (=> start!33142 m!335217))

(declare-fun m!335219 () Bool)

(assert (=> start!33142 m!335219))

(declare-fun m!335221 () Bool)

(assert (=> b!329627 m!335221))

(declare-fun m!335223 () Bool)

(assert (=> b!329626 m!335223))

(declare-fun m!335225 () Bool)

(assert (=> b!329628 m!335225))

(declare-fun m!335227 () Bool)

(assert (=> b!329619 m!335227))

(declare-fun m!335229 () Bool)

(assert (=> b!329620 m!335229))

(assert (=> b!329620 m!335229))

(declare-fun m!335231 () Bool)

(assert (=> b!329620 m!335231))

(push 1)

(assert (not b!329621))

(assert (not b!329619))

(assert (not b!329628))

(assert (not b!329625))

(assert (not b!329620))

(assert (not b!329626))

(assert (not b!329624))

(assert (not start!33142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!329766 () Bool)

(declare-fun e!202542 () SeekEntryResult!3101)

(assert (=> b!329766 (= e!202542 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun d!70223 () Bool)

(declare-fun e!202541 () Bool)

(assert (=> d!70223 e!202541))

(declare-fun c!51657 () Bool)

(declare-fun lt!158328 () SeekEntryResult!3101)

(assert (=> d!70223 (= c!51657 (and (is-Intermediate!3101 lt!158328) (undefined!3913 lt!158328)))))

(declare-fun e!202540 () SeekEntryResult!3101)

(assert (=> d!70223 (= lt!158328 e!202540)))

(declare-fun c!51655 () Bool)

(assert (=> d!70223 (= c!51655 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!158327 () (_ BitVec 64))

(assert (=> d!70223 (= lt!158327 (select (arr!7970 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!70223 (validMask!0 mask!3777)))

(assert (=> d!70223 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777) lt!158328)))

(declare-fun b!329767 () Bool)

(assert (=> b!329767 (and (bvsge (index!14582 lt!158328) #b00000000000000000000000000000000) (bvslt (index!14582 lt!158328) (size!8322 a!3305)))))

(declare-fun e!202539 () Bool)

(assert (=> b!329767 (= e!202539 (= (select (arr!7970 a!3305) (index!14582 lt!158328)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329768 () Bool)

(assert (=> b!329768 (= e!202541 (bvsge (x!32859 lt!158328) #b01111111111111111111111111111110))))

(declare-fun b!329769 () Bool)

(assert (=> b!329769 (and (bvsge (index!14582 lt!158328) #b00000000000000000000000000000000) (bvslt (index!14582 lt!158328) (size!8322 a!3305)))))

(declare-fun res!181739 () Bool)

(assert (=> b!329769 (= res!181739 (= (select (arr!7970 a!3305) (index!14582 lt!158328)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329769 (=> res!181739 e!202539)))

(declare-fun b!329770 () Bool)

(declare-fun e!202543 () Bool)

(assert (=> b!329770 (= e!202541 e!202543)))

(declare-fun res!181738 () Bool)

(assert (=> b!329770 (= res!181738 (and (is-Intermediate!3101 lt!158328) (not (undefined!3913 lt!158328)) (bvslt (x!32859 lt!158328) #b01111111111111111111111111111110) (bvsge (x!32859 lt!158328) #b00000000000000000000000000000000) (bvsge (x!32859 lt!158328) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!329770 (=> (not res!181738) (not e!202543))))

(declare-fun b!329771 () Bool)

(assert (=> b!329771 (= e!202540 e!202542)))

(declare-fun c!51656 () Bool)

(assert (=> b!329771 (= c!51656 (or (= lt!158327 k!2497) (= (bvadd lt!158327 lt!158327) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329772 () Bool)

(assert (=> b!329772 (= e!202540 (Intermediate!3101 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329773 () Bool)

(assert (=> b!329773 (and (bvsge (index!14582 lt!158328) #b00000000000000000000000000000000) (bvslt (index!14582 lt!158328) (size!8322 a!3305)))))

(declare-fun res!181740 () Bool)

(assert (=> b!329773 (= res!181740 (= (select (arr!7970 a!3305) (index!14582 lt!158328)) k!2497))))

(assert (=> b!329773 (=> res!181740 e!202539)))

(assert (=> b!329773 (= e!202543 e!202539)))

(declare-fun b!329774 () Bool)

(assert (=> b!329774 (= e!202542 (Intermediate!3101 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(assert (= (and d!70223 c!51655) b!329772))

(assert (= (and d!70223 (not c!51655)) b!329771))

(assert (= (and b!329771 c!51656) b!329774))

(assert (= (and b!329771 (not c!51656)) b!329766))

(assert (= (and d!70223 c!51657) b!329768))

(assert (= (and d!70223 (not c!51657)) b!329770))

(assert (= (and b!329770 res!181738) b!329773))

(assert (= (and b!329773 (not res!181740)) b!329769))

(assert (= (and b!329769 (not res!181739)) b!329767))

(declare-fun m!335305 () Bool)

(assert (=> b!329773 m!335305))

(assert (=> b!329769 m!335305))

(assert (=> b!329766 m!335229))

(declare-fun m!335307 () Bool)

(assert (=> b!329766 m!335307))

(assert (=> b!329766 m!335307))

(declare-fun m!335309 () Bool)

(assert (=> b!329766 m!335309))

(assert (=> d!70223 m!335229))

(declare-fun m!335311 () Bool)

(assert (=> d!70223 m!335311))

(assert (=> d!70223 m!335217))

(assert (=> b!329767 m!335305))

(assert (=> b!329620 d!70223))

(declare-fun d!70235 () Bool)

(declare-fun lt!158331 () (_ BitVec 32))

(assert (=> d!70235 (and (bvsge lt!158331 #b00000000000000000000000000000000) (bvslt lt!158331 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70235 (= lt!158331 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70235 (validMask!0 mask!3777)))

(assert (=> d!70235 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158331)))

(declare-fun bs!11414 () Bool)

(assert (= bs!11414 d!70235))

(declare-fun m!335313 () Bool)

(assert (=> bs!11414 m!335313))

(assert (=> bs!11414 m!335217))

(assert (=> b!329620 d!70235))

(declare-fun b!329826 () Bool)

(declare-fun e!202571 () SeekEntryResult!3101)

(declare-fun lt!158352 () SeekEntryResult!3101)

(assert (=> b!329826 (= e!202571 (MissingZero!3101 (index!14582 lt!158352)))))

(declare-fun d!70237 () Bool)

(declare-fun lt!158350 () SeekEntryResult!3101)

(assert (=> d!70237 (and (or (is-Undefined!3101 lt!158350) (not (is-Found!3101 lt!158350)) (and (bvsge (index!14581 lt!158350) #b00000000000000000000000000000000) (bvslt (index!14581 lt!158350) (size!8322 a!3305)))) (or (is-Undefined!3101 lt!158350) (is-Found!3101 lt!158350) (not (is-MissingZero!3101 lt!158350)) (and (bvsge (index!14580 lt!158350) #b00000000000000000000000000000000) (bvslt (index!14580 lt!158350) (size!8322 a!3305)))) (or (is-Undefined!3101 lt!158350) (is-Found!3101 lt!158350) (is-MissingZero!3101 lt!158350) (not (is-MissingVacant!3101 lt!158350)) (and (bvsge (index!14583 lt!158350) #b00000000000000000000000000000000) (bvslt (index!14583 lt!158350) (size!8322 a!3305)))) (or (is-Undefined!3101 lt!158350) (ite (is-Found!3101 lt!158350) (= (select (arr!7970 a!3305) (index!14581 lt!158350)) k!2497) (ite (is-MissingZero!3101 lt!158350) (= (select (arr!7970 a!3305) (index!14580 lt!158350)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3101 lt!158350) (= (select (arr!7970 a!3305) (index!14583 lt!158350)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!202573 () SeekEntryResult!3101)

(assert (=> d!70237 (= lt!158350 e!202573)))

(declare-fun c!51681 () Bool)

(assert (=> d!70237 (= c!51681 (and (is-Intermediate!3101 lt!158352) (undefined!3913 lt!158352)))))

(assert (=> d!70237 (= lt!158352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70237 (validMask!0 mask!3777)))

(assert (=> d!70237 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!158350)))

(declare-fun b!329827 () Bool)

(declare-fun e!202572 () SeekEntryResult!3101)

(assert (=> b!329827 (= e!202573 e!202572)))

(declare-fun lt!158351 () (_ BitVec 64))

(assert (=> b!329827 (= lt!158351 (select (arr!7970 a!3305) (index!14582 lt!158352)))))

(declare-fun c!51680 () Bool)

(assert (=> b!329827 (= c!51680 (= lt!158351 k!2497))))

(declare-fun b!329828 () Bool)

(assert (=> b!329828 (= e!202572 (Found!3101 (index!14582 lt!158352)))))

(declare-fun b!329829 () Bool)

(declare-fun c!51679 () Bool)

(assert (=> b!329829 (= c!51679 (= lt!158351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329829 (= e!202572 e!202571)))

(declare-fun b!329830 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16852 (_ BitVec 32)) SeekEntryResult!3101)

(assert (=> b!329830 (= e!202571 (seekKeyOrZeroReturnVacant!0 (x!32859 lt!158352) (index!14582 lt!158352) (index!14582 lt!158352) k!2497 a!3305 mask!3777))))

(declare-fun b!329831 () Bool)

(assert (=> b!329831 (= e!202573 Undefined!3101)))

(assert (= (and d!70237 c!51681) b!329831))

(assert (= (and d!70237 (not c!51681)) b!329827))

(assert (= (and b!329827 c!51680) b!329828))

(assert (= (and b!329827 (not c!51680)) b!329829))

(assert (= (and b!329829 c!51679) b!329826))

(assert (= (and b!329829 (not c!51679)) b!329830))

(assert (=> d!70237 m!335217))

(assert (=> d!70237 m!335211))

(declare-fun m!335319 () Bool)

(assert (=> d!70237 m!335319))

(assert (=> d!70237 m!335211))

(assert (=> d!70237 m!335213))

(declare-fun m!335321 () Bool)

(assert (=> d!70237 m!335321))

(declare-fun m!335323 () Bool)

(assert (=> d!70237 m!335323))

(declare-fun m!335325 () Bool)

(assert (=> b!329827 m!335325))

(declare-fun m!335327 () Bool)

(assert (=> b!329830 m!335327))

(assert (=> b!329625 d!70237))

(declare-fun d!70245 () Bool)

(assert (=> d!70245 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!329621 d!70245))

(declare-fun e!202577 () SeekEntryResult!3101)

(declare-fun b!329832 () Bool)

(assert (=> b!329832 (= e!202577 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun d!70247 () Bool)

(declare-fun e!202576 () Bool)

(assert (=> d!70247 e!202576))

(declare-fun c!51684 () Bool)

(declare-fun lt!158354 () SeekEntryResult!3101)

(assert (=> d!70247 (= c!51684 (and (is-Intermediate!3101 lt!158354) (undefined!3913 lt!158354)))))

(declare-fun e!202575 () SeekEntryResult!3101)

(assert (=> d!70247 (= lt!158354 e!202575)))

(declare-fun c!51682 () Bool)

(assert (=> d!70247 (= c!51682 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158353 () (_ BitVec 64))

(assert (=> d!70247 (= lt!158353 (select (arr!7970 a!3305) index!1840))))

(assert (=> d!70247 (validMask!0 mask!3777)))

(assert (=> d!70247 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158354)))

(declare-fun b!329833 () Bool)

(assert (=> b!329833 (and (bvsge (index!14582 lt!158354) #b00000000000000000000000000000000) (bvslt (index!14582 lt!158354) (size!8322 a!3305)))))

(declare-fun e!202574 () Bool)

(assert (=> b!329833 (= e!202574 (= (select (arr!7970 a!3305) (index!14582 lt!158354)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329834 () Bool)

(assert (=> b!329834 (= e!202576 (bvsge (x!32859 lt!158354) #b01111111111111111111111111111110))))

(declare-fun b!329835 () Bool)

(assert (=> b!329835 (and (bvsge (index!14582 lt!158354) #b00000000000000000000000000000000) (bvslt (index!14582 lt!158354) (size!8322 a!3305)))))

(declare-fun res!181751 () Bool)

(assert (=> b!329835 (= res!181751 (= (select (arr!7970 a!3305) (index!14582 lt!158354)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329835 (=> res!181751 e!202574)))

(declare-fun b!329836 () Bool)

(declare-fun e!202578 () Bool)

(assert (=> b!329836 (= e!202576 e!202578)))

(declare-fun res!181750 () Bool)

(assert (=> b!329836 (= res!181750 (and (is-Intermediate!3101 lt!158354) (not (undefined!3913 lt!158354)) (bvslt (x!32859 lt!158354) #b01111111111111111111111111111110) (bvsge (x!32859 lt!158354) #b00000000000000000000000000000000) (bvsge (x!32859 lt!158354) x!1490)))))

(assert (=> b!329836 (=> (not res!181750) (not e!202578))))

(declare-fun b!329837 () Bool)

(assert (=> b!329837 (= e!202575 e!202577)))

(declare-fun c!51683 () Bool)

(assert (=> b!329837 (= c!51683 (or (= lt!158353 k!2497) (= (bvadd lt!158353 lt!158353) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329838 () Bool)

(assert (=> b!329838 (= e!202575 (Intermediate!3101 true index!1840 x!1490))))

(declare-fun b!329839 () Bool)

(assert (=> b!329839 (and (bvsge (index!14582 lt!158354) #b00000000000000000000000000000000) (bvslt (index!14582 lt!158354) (size!8322 a!3305)))))

(declare-fun res!181752 () Bool)

(assert (=> b!329839 (= res!181752 (= (select (arr!7970 a!3305) (index!14582 lt!158354)) k!2497))))

(assert (=> b!329839 (=> res!181752 e!202574)))

(assert (=> b!329839 (= e!202578 e!202574)))

(declare-fun b!329840 () Bool)

(assert (=> b!329840 (= e!202577 (Intermediate!3101 false index!1840 x!1490))))

(assert (= (and d!70247 c!51682) b!329838))

(assert (= (and d!70247 (not c!51682)) b!329837))

(assert (= (and b!329837 c!51683) b!329840))

(assert (= (and b!329837 (not c!51683)) b!329832))

(assert (= (and d!70247 c!51684) b!329834))

(assert (= (and d!70247 (not c!51684)) b!329836))

(assert (= (and b!329836 res!181750) b!329839))

(assert (= (and b!329839 (not res!181752)) b!329835))

(assert (= (and b!329835 (not res!181751)) b!329833))

(declare-fun m!335329 () Bool)

(assert (=> b!329839 m!335329))

(assert (=> b!329835 m!335329))

(assert (=> b!329832 m!335229))

(assert (=> b!329832 m!335229))

(declare-fun m!335331 () Bool)

(assert (=> b!329832 m!335331))

(assert (=> d!70247 m!335215))

(assert (=> d!70247 m!335217))

(assert (=> b!329833 m!335329))

(assert (=> b!329626 d!70247))

(declare-fun d!70249 () Bool)

(assert (=> d!70249 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33142 d!70249))

(declare-fun d!70261 () Bool)

(assert (=> d!70261 (= (array_inv!5933 a!3305) (bvsge (size!8322 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33142 d!70261))

(declare-fun d!70265 () Bool)

(declare-fun res!181770 () Bool)

(declare-fun e!202608 () Bool)

(assert (=> d!70265 (=> res!181770 e!202608)))

(assert (=> d!70265 (= res!181770 (= (select (arr!7970 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70265 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!202608)))

(declare-fun b!329887 () Bool)

(declare-fun e!202609 () Bool)

(assert (=> b!329887 (= e!202608 e!202609)))

(declare-fun res!181771 () Bool)

(assert (=> b!329887 (=> (not res!181771) (not e!202609))))

(assert (=> b!329887 (= res!181771 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8322 a!3305)))))

(declare-fun b!329888 () Bool)

(assert (=> b!329888 (= e!202609 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70265 (not res!181770)) b!329887))

(assert (= (and b!329887 res!181771) b!329888))

(declare-fun m!335363 () Bool)

(assert (=> d!70265 m!335363))

(declare-fun m!335365 () Bool)

(assert (=> b!329888 m!335365))

(assert (=> b!329628 d!70265))

(declare-fun b!329911 () Bool)

(declare-fun e!202626 () Bool)

(declare-fun call!26160 () Bool)

(assert (=> b!329911 (= e!202626 call!26160)))

(declare-fun b!329912 () Bool)

(declare-fun e!202625 () Bool)

(declare-fun e!202627 () Bool)

(assert (=> b!329912 (= e!202625 e!202627)))

(declare-fun c!51707 () Bool)

(assert (=> b!329912 (= c!51707 (validKeyInArray!0 (select (arr!7970 a!3305) #b00000000000000000000000000000000)))))

(declare-fun bm!26157 () Bool)

(assert (=> bm!26157 (= call!26160 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!329913 () Bool)

(assert (=> b!329913 (= e!202627 call!26160)))

(declare-fun d!70267 () Bool)

(declare-fun res!181781 () Bool)

(assert (=> d!70267 (=> res!181781 e!202625)))

(assert (=> d!70267 (= res!181781 (bvsge #b00000000000000000000000000000000 (size!8322 a!3305)))))

(assert (=> d!70267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202625)))

(declare-fun b!329914 () Bool)

(assert (=> b!329914 (= e!202627 e!202626)))

(declare-fun lt!158394 () (_ BitVec 64))

(assert (=> b!329914 (= lt!158394 (select (arr!7970 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158393 () Unit!10206)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16852 (_ BitVec 64) (_ BitVec 32)) Unit!10206)

(assert (=> b!329914 (= lt!158393 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158394 #b00000000000000000000000000000000))))

(assert (=> b!329914 (arrayContainsKey!0 a!3305 lt!158394 #b00000000000000000000000000000000)))

(declare-fun lt!158392 () Unit!10206)

(assert (=> b!329914 (= lt!158392 lt!158393)))

(declare-fun res!181780 () Bool)

(assert (=> b!329914 (= res!181780 (= (seekEntryOrOpen!0 (select (arr!7970 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3101 #b00000000000000000000000000000000)))))

(assert (=> b!329914 (=> (not res!181780) (not e!202626))))

(assert (= (and d!70267 (not res!181781)) b!329912))

(assert (= (and b!329912 c!51707) b!329914))

(assert (= (and b!329912 (not c!51707)) b!329913))

(assert (= (and b!329914 res!181780) b!329911))

(assert (= (or b!329911 b!329913) bm!26157))

(assert (=> b!329912 m!335363))

(assert (=> b!329912 m!335363))

(declare-fun m!335377 () Bool)

(assert (=> b!329912 m!335377))

(declare-fun m!335379 () Bool)

(assert (=> bm!26157 m!335379))

(assert (=> b!329914 m!335363))

(declare-fun m!335381 () Bool)

(assert (=> b!329914 m!335381))

(declare-fun m!335383 () Bool)

(assert (=> b!329914 m!335383))

(assert (=> b!329914 m!335363))

(declare-fun m!335385 () Bool)

(assert (=> b!329914 m!335385))

(assert (=> b!329619 d!70267))

(declare-fun b!329919 () Bool)

(declare-fun e!202634 () SeekEntryResult!3101)

(assert (=> b!329919 (= e!202634 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun d!70271 () Bool)

(declare-fun e!202633 () Bool)

(assert (=> d!70271 e!202633))

(declare-fun c!51711 () Bool)

(declare-fun lt!158399 () SeekEntryResult!3101)

(assert (=> d!70271 (= c!51711 (and (is-Intermediate!3101 lt!158399) (undefined!3913 lt!158399)))))

(declare-fun e!202632 () SeekEntryResult!3101)

(assert (=> d!70271 (= lt!158399 e!202632)))

(declare-fun c!51709 () Bool)

(assert (=> d!70271 (= c!51709 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!158398 () (_ BitVec 64))

(assert (=> d!70271 (= lt!158398 (select (arr!7970 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70271 (validMask!0 mask!3777)))

(assert (=> d!70271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158399)))

(declare-fun b!329920 () Bool)

(assert (=> b!329920 (and (bvsge (index!14582 lt!158399) #b00000000000000000000000000000000) (bvslt (index!14582 lt!158399) (size!8322 a!3305)))))

(declare-fun e!202631 () Bool)

(assert (=> b!329920 (= e!202631 (= (select (arr!7970 a!3305) (index!14582 lt!158399)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329921 () Bool)

(assert (=> b!329921 (= e!202633 (bvsge (x!32859 lt!158399) #b01111111111111111111111111111110))))

(declare-fun b!329922 () Bool)

(assert (=> b!329922 (and (bvsge (index!14582 lt!158399) #b00000000000000000000000000000000) (bvslt (index!14582 lt!158399) (size!8322 a!3305)))))

(declare-fun res!181785 () Bool)

(assert (=> b!329922 (= res!181785 (= (select (arr!7970 a!3305) (index!14582 lt!158399)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329922 (=> res!181785 e!202631)))

(declare-fun b!329923 () Bool)

(declare-fun e!202635 () Bool)

(assert (=> b!329923 (= e!202633 e!202635)))

(declare-fun res!181784 () Bool)

(assert (=> b!329923 (= res!181784 (and (is-Intermediate!3101 lt!158399) (not (undefined!3913 lt!158399)) (bvslt (x!32859 lt!158399) #b01111111111111111111111111111110) (bvsge (x!32859 lt!158399) #b00000000000000000000000000000000) (bvsge (x!32859 lt!158399) #b00000000000000000000000000000000)))))

(assert (=> b!329923 (=> (not res!181784) (not e!202635))))

(declare-fun b!329924 () Bool)

(assert (=> b!329924 (= e!202632 e!202634)))

(declare-fun c!51710 () Bool)

(assert (=> b!329924 (= c!51710 (or (= lt!158398 k!2497) (= (bvadd lt!158398 lt!158398) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329925 () Bool)

(assert (=> b!329925 (= e!202632 (Intermediate!3101 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329926 () Bool)

(assert (=> b!329926 (and (bvsge (index!14582 lt!158399) #b00000000000000000000000000000000) (bvslt (index!14582 lt!158399) (size!8322 a!3305)))))

(declare-fun res!181786 () Bool)

(assert (=> b!329926 (= res!181786 (= (select (arr!7970 a!3305) (index!14582 lt!158399)) k!2497))))

(assert (=> b!329926 (=> res!181786 e!202631)))

(assert (=> b!329926 (= e!202635 e!202631)))

(declare-fun b!329927 () Bool)

(assert (=> b!329927 (= e!202634 (Intermediate!3101 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!70271 c!51709) b!329925))

(assert (= (and d!70271 (not c!51709)) b!329924))

(assert (= (and b!329924 c!51710) b!329927))

(assert (= (and b!329924 (not c!51710)) b!329919))

(assert (= (and d!70271 c!51711) b!329921))

(assert (= (and d!70271 (not c!51711)) b!329923))

(assert (= (and b!329923 res!181784) b!329926))

(assert (= (and b!329926 (not res!181786)) b!329922))

(assert (= (and b!329922 (not res!181785)) b!329920))

(declare-fun m!335397 () Bool)

(assert (=> b!329926 m!335397))

(assert (=> b!329922 m!335397))

(assert (=> b!329919 m!335211))

(declare-fun m!335399 () Bool)

(assert (=> b!329919 m!335399))

(assert (=> b!329919 m!335399))

(declare-fun m!335401 () Bool)

(assert (=> b!329919 m!335401))

(assert (=> d!70271 m!335211))

(declare-fun m!335403 () Bool)

(assert (=> d!70271 m!335403))

(assert (=> d!70271 m!335217))

(assert (=> b!329920 m!335397))

(assert (=> b!329624 d!70271))

(declare-fun d!70275 () Bool)

(declare-fun lt!158411 () (_ BitVec 32))

(declare-fun lt!158410 () (_ BitVec 32))

(assert (=> d!70275 (= lt!158411 (bvmul (bvxor lt!158410 (bvlshr lt!158410 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70275 (= lt!158410 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70275 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181790 (let ((h!5419 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32868 (bvmul (bvxor h!5419 (bvlshr h!5419 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32868 (bvlshr x!32868 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181790 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181790 #b00000000000000000000000000000000))))))

(assert (=> d!70275 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!158411 (bvlshr lt!158411 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!329624 d!70275))

(push 1)

