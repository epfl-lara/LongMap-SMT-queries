; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32138 () Bool)

(assert start!32138)

(declare-fun b!320385 () Bool)

(declare-fun res!174684 () Bool)

(declare-fun e!198779 () Bool)

(assert (=> b!320385 (=> (not res!174684) (not e!198779))))

(declare-datatypes ((array!16386 0))(
  ( (array!16387 (arr!7753 (Array (_ BitVec 32) (_ BitVec 64))) (size!8105 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16386)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320385 (= res!174684 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320386 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!320386 (= e!198779 (and (= (select (arr!7753 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8105 a!3305)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!320387 () Bool)

(declare-fun res!174683 () Bool)

(assert (=> b!320387 (=> (not res!174683) (not e!198779))))

(declare-datatypes ((SeekEntryResult!2849 0))(
  ( (MissingZero!2849 (index!13572 (_ BitVec 32))) (Found!2849 (index!13573 (_ BitVec 32))) (Intermediate!2849 (undefined!3661 Bool) (index!13574 (_ BitVec 32)) (x!31947 (_ BitVec 32))) (Undefined!2849) (MissingVacant!2849 (index!13575 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16386 (_ BitVec 32)) SeekEntryResult!2849)

(assert (=> b!320387 (= res!174683 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2849 i!1250)))))

(declare-fun b!320388 () Bool)

(declare-fun res!174679 () Bool)

(assert (=> b!320388 (=> (not res!174679) (not e!198779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320388 (= res!174679 (validKeyInArray!0 k0!2497))))

(declare-fun b!320389 () Bool)

(declare-fun res!174680 () Bool)

(assert (=> b!320389 (=> (not res!174680) (not e!198779))))

(assert (=> b!320389 (= res!174680 (and (= (size!8105 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8105 a!3305))))))

(declare-fun b!320390 () Bool)

(declare-fun res!174678 () Bool)

(assert (=> b!320390 (=> (not res!174678) (not e!198779))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16386 (_ BitVec 32)) SeekEntryResult!2849)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320390 (= res!174678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2849 false resIndex!58 resX!58)))))

(declare-fun res!174682 () Bool)

(assert (=> start!32138 (=> (not res!174682) (not e!198779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32138 (= res!174682 (validMask!0 mask!3777))))

(assert (=> start!32138 e!198779))

(declare-fun array_inv!5703 (array!16386) Bool)

(assert (=> start!32138 (array_inv!5703 a!3305)))

(assert (=> start!32138 true))

(declare-fun b!320391 () Bool)

(declare-fun res!174681 () Bool)

(assert (=> b!320391 (=> (not res!174681) (not e!198779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16386 (_ BitVec 32)) Bool)

(assert (=> b!320391 (= res!174681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32138 res!174682) b!320389))

(assert (= (and b!320389 res!174680) b!320388))

(assert (= (and b!320388 res!174679) b!320385))

(assert (= (and b!320385 res!174684) b!320387))

(assert (= (and b!320387 res!174683) b!320391))

(assert (= (and b!320391 res!174681) b!320390))

(assert (= (and b!320390 res!174678) b!320386))

(declare-fun m!328993 () Bool)

(assert (=> b!320387 m!328993))

(declare-fun m!328995 () Bool)

(assert (=> b!320386 m!328995))

(declare-fun m!328997 () Bool)

(assert (=> b!320390 m!328997))

(assert (=> b!320390 m!328997))

(declare-fun m!328999 () Bool)

(assert (=> b!320390 m!328999))

(declare-fun m!329001 () Bool)

(assert (=> b!320391 m!329001))

(declare-fun m!329003 () Bool)

(assert (=> start!32138 m!329003))

(declare-fun m!329005 () Bool)

(assert (=> start!32138 m!329005))

(declare-fun m!329007 () Bool)

(assert (=> b!320385 m!329007))

(declare-fun m!329009 () Bool)

(assert (=> b!320388 m!329009))

(check-sat (not b!320390) (not b!320387) (not b!320391) (not start!32138) (not b!320385) (not b!320388))
(check-sat)
(get-model)

(declare-fun d!69473 () Bool)

(assert (=> d!69473 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32138 d!69473))

(declare-fun d!69479 () Bool)

(assert (=> d!69479 (= (array_inv!5703 a!3305) (bvsge (size!8105 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32138 d!69479))

(declare-fun b!320442 () Bool)

(declare-fun e!198800 () Bool)

(declare-fun e!198799 () Bool)

(assert (=> b!320442 (= e!198800 e!198799)))

(declare-fun lt!156038 () (_ BitVec 64))

(assert (=> b!320442 (= lt!156038 (select (arr!7753 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9786 0))(
  ( (Unit!9787) )
))
(declare-fun lt!156039 () Unit!9786)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16386 (_ BitVec 64) (_ BitVec 32)) Unit!9786)

(assert (=> b!320442 (= lt!156039 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!156038 #b00000000000000000000000000000000))))

(assert (=> b!320442 (arrayContainsKey!0 a!3305 lt!156038 #b00000000000000000000000000000000)))

(declare-fun lt!156037 () Unit!9786)

(assert (=> b!320442 (= lt!156037 lt!156039)))

(declare-fun res!174731 () Bool)

(assert (=> b!320442 (= res!174731 (= (seekEntryOrOpen!0 (select (arr!7753 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2849 #b00000000000000000000000000000000)))))

(assert (=> b!320442 (=> (not res!174731) (not e!198799))))

(declare-fun b!320443 () Bool)

(declare-fun call!26042 () Bool)

(assert (=> b!320443 (= e!198800 call!26042)))

(declare-fun d!69481 () Bool)

(declare-fun res!174732 () Bool)

(declare-fun e!198801 () Bool)

(assert (=> d!69481 (=> res!174732 e!198801)))

(assert (=> d!69481 (= res!174732 (bvsge #b00000000000000000000000000000000 (size!8105 a!3305)))))

(assert (=> d!69481 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198801)))

(declare-fun b!320444 () Bool)

(assert (=> b!320444 (= e!198801 e!198800)))

(declare-fun c!50480 () Bool)

(assert (=> b!320444 (= c!50480 (validKeyInArray!0 (select (arr!7753 a!3305) #b00000000000000000000000000000000)))))

(declare-fun bm!26039 () Bool)

(assert (=> bm!26039 (= call!26042 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!320445 () Bool)

(assert (=> b!320445 (= e!198799 call!26042)))

(assert (= (and d!69481 (not res!174732)) b!320444))

(assert (= (and b!320444 c!50480) b!320442))

(assert (= (and b!320444 (not c!50480)) b!320443))

(assert (= (and b!320442 res!174731) b!320445))

(assert (= (or b!320445 b!320443) bm!26039))

(declare-fun m!329047 () Bool)

(assert (=> b!320442 m!329047))

(declare-fun m!329049 () Bool)

(assert (=> b!320442 m!329049))

(declare-fun m!329051 () Bool)

(assert (=> b!320442 m!329051))

(assert (=> b!320442 m!329047))

(declare-fun m!329053 () Bool)

(assert (=> b!320442 m!329053))

(assert (=> b!320444 m!329047))

(assert (=> b!320444 m!329047))

(declare-fun m!329055 () Bool)

(assert (=> b!320444 m!329055))

(declare-fun m!329057 () Bool)

(assert (=> bm!26039 m!329057))

(assert (=> b!320391 d!69481))

(declare-fun d!69485 () Bool)

(declare-fun res!174737 () Bool)

(declare-fun e!198806 () Bool)

(assert (=> d!69485 (=> res!174737 e!198806)))

(assert (=> d!69485 (= res!174737 (= (select (arr!7753 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69485 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!198806)))

(declare-fun b!320450 () Bool)

(declare-fun e!198807 () Bool)

(assert (=> b!320450 (= e!198806 e!198807)))

(declare-fun res!174738 () Bool)

(assert (=> b!320450 (=> (not res!174738) (not e!198807))))

(assert (=> b!320450 (= res!174738 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8105 a!3305)))))

(declare-fun b!320451 () Bool)

(assert (=> b!320451 (= e!198807 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69485 (not res!174737)) b!320450))

(assert (= (and b!320450 res!174738) b!320451))

(assert (=> d!69485 m!329047))

(declare-fun m!329059 () Bool)

(assert (=> b!320451 m!329059))

(assert (=> b!320385 d!69485))

(declare-fun b!320533 () Bool)

(declare-fun lt!156075 () SeekEntryResult!2849)

(assert (=> b!320533 (and (bvsge (index!13574 lt!156075) #b00000000000000000000000000000000) (bvslt (index!13574 lt!156075) (size!8105 a!3305)))))

(declare-fun res!174769 () Bool)

(assert (=> b!320533 (= res!174769 (= (select (arr!7753 a!3305) (index!13574 lt!156075)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198860 () Bool)

(assert (=> b!320533 (=> res!174769 e!198860)))

(declare-fun d!69487 () Bool)

(declare-fun e!198859 () Bool)

(assert (=> d!69487 e!198859))

(declare-fun c!50508 () Bool)

(get-info :version)

(assert (=> d!69487 (= c!50508 (and ((_ is Intermediate!2849) lt!156075) (undefined!3661 lt!156075)))))

(declare-fun e!198861 () SeekEntryResult!2849)

(assert (=> d!69487 (= lt!156075 e!198861)))

(declare-fun c!50510 () Bool)

(assert (=> d!69487 (= c!50510 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!156074 () (_ BitVec 64))

(assert (=> d!69487 (= lt!156074 (select (arr!7753 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69487 (validMask!0 mask!3777)))

(assert (=> d!69487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156075)))

(declare-fun b!320534 () Bool)

(assert (=> b!320534 (and (bvsge (index!13574 lt!156075) #b00000000000000000000000000000000) (bvslt (index!13574 lt!156075) (size!8105 a!3305)))))

(assert (=> b!320534 (= e!198860 (= (select (arr!7753 a!3305) (index!13574 lt!156075)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320535 () Bool)

(declare-fun e!198857 () SeekEntryResult!2849)

(assert (=> b!320535 (= e!198857 (Intermediate!2849 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!320536 () Bool)

(assert (=> b!320536 (= e!198861 e!198857)))

(declare-fun c!50509 () Bool)

(assert (=> b!320536 (= c!50509 (or (= lt!156074 k0!2497) (= (bvadd lt!156074 lt!156074) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320537 () Bool)

(assert (=> b!320537 (and (bvsge (index!13574 lt!156075) #b00000000000000000000000000000000) (bvslt (index!13574 lt!156075) (size!8105 a!3305)))))

(declare-fun res!174767 () Bool)

(assert (=> b!320537 (= res!174767 (= (select (arr!7753 a!3305) (index!13574 lt!156075)) k0!2497))))

(assert (=> b!320537 (=> res!174767 e!198860)))

(declare-fun e!198858 () Bool)

(assert (=> b!320537 (= e!198858 e!198860)))

(declare-fun b!320538 () Bool)

(assert (=> b!320538 (= e!198859 e!198858)))

(declare-fun res!174768 () Bool)

(assert (=> b!320538 (= res!174768 (and ((_ is Intermediate!2849) lt!156075) (not (undefined!3661 lt!156075)) (bvslt (x!31947 lt!156075) #b01111111111111111111111111111110) (bvsge (x!31947 lt!156075) #b00000000000000000000000000000000) (bvsge (x!31947 lt!156075) #b00000000000000000000000000000000)))))

(assert (=> b!320538 (=> (not res!174768) (not e!198858))))

(declare-fun b!320539 () Bool)

(assert (=> b!320539 (= e!198859 (bvsge (x!31947 lt!156075) #b01111111111111111111111111111110))))

(declare-fun b!320540 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320540 (= e!198857 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!320541 () Bool)

(assert (=> b!320541 (= e!198861 (Intermediate!2849 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!69487 c!50510) b!320541))

(assert (= (and d!69487 (not c!50510)) b!320536))

(assert (= (and b!320536 c!50509) b!320535))

(assert (= (and b!320536 (not c!50509)) b!320540))

(assert (= (and d!69487 c!50508) b!320539))

(assert (= (and d!69487 (not c!50508)) b!320538))

(assert (= (and b!320538 res!174768) b!320537))

(assert (= (and b!320537 (not res!174767)) b!320533))

(assert (= (and b!320533 (not res!174769)) b!320534))

(declare-fun m!329095 () Bool)

(assert (=> b!320534 m!329095))

(assert (=> b!320537 m!329095))

(assert (=> b!320533 m!329095))

(assert (=> d!69487 m!328997))

(declare-fun m!329097 () Bool)

(assert (=> d!69487 m!329097))

(assert (=> d!69487 m!329003))

(assert (=> b!320540 m!328997))

(declare-fun m!329099 () Bool)

(assert (=> b!320540 m!329099))

(assert (=> b!320540 m!329099))

(declare-fun m!329101 () Bool)

(assert (=> b!320540 m!329101))

(assert (=> b!320390 d!69487))

(declare-fun d!69499 () Bool)

(declare-fun lt!156081 () (_ BitVec 32))

(declare-fun lt!156080 () (_ BitVec 32))

(assert (=> d!69499 (= lt!156081 (bvmul (bvxor lt!156080 (bvlshr lt!156080 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69499 (= lt!156080 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69499 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!174770 (let ((h!5298 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31953 (bvmul (bvxor h!5298 (bvlshr h!5298 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31953 (bvlshr x!31953 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!174770 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!174770 #b00000000000000000000000000000000))))))

(assert (=> d!69499 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!156081 (bvlshr lt!156081 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!320390 d!69499))

(declare-fun d!69505 () Bool)

(assert (=> d!69505 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!320388 d!69505))

(declare-fun b!320586 () Bool)

(declare-fun lt!156103 () SeekEntryResult!2849)

(declare-fun e!198889 () SeekEntryResult!2849)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16386 (_ BitVec 32)) SeekEntryResult!2849)

(assert (=> b!320586 (= e!198889 (seekKeyOrZeroReturnVacant!0 (x!31947 lt!156103) (index!13574 lt!156103) (index!13574 lt!156103) k0!2497 a!3305 mask!3777))))

(declare-fun b!320587 () Bool)

(declare-fun e!198887 () SeekEntryResult!2849)

(assert (=> b!320587 (= e!198887 (Found!2849 (index!13574 lt!156103)))))

(declare-fun b!320588 () Bool)

(assert (=> b!320588 (= e!198889 (MissingZero!2849 (index!13574 lt!156103)))))

(declare-fun b!320589 () Bool)

(declare-fun e!198888 () SeekEntryResult!2849)

(assert (=> b!320589 (= e!198888 e!198887)))

(declare-fun lt!156102 () (_ BitVec 64))

(assert (=> b!320589 (= lt!156102 (select (arr!7753 a!3305) (index!13574 lt!156103)))))

(declare-fun c!50531 () Bool)

(assert (=> b!320589 (= c!50531 (= lt!156102 k0!2497))))

(declare-fun b!320590 () Bool)

(assert (=> b!320590 (= e!198888 Undefined!2849)))

(declare-fun d!69507 () Bool)

(declare-fun lt!156101 () SeekEntryResult!2849)

(assert (=> d!69507 (and (or ((_ is Undefined!2849) lt!156101) (not ((_ is Found!2849) lt!156101)) (and (bvsge (index!13573 lt!156101) #b00000000000000000000000000000000) (bvslt (index!13573 lt!156101) (size!8105 a!3305)))) (or ((_ is Undefined!2849) lt!156101) ((_ is Found!2849) lt!156101) (not ((_ is MissingZero!2849) lt!156101)) (and (bvsge (index!13572 lt!156101) #b00000000000000000000000000000000) (bvslt (index!13572 lt!156101) (size!8105 a!3305)))) (or ((_ is Undefined!2849) lt!156101) ((_ is Found!2849) lt!156101) ((_ is MissingZero!2849) lt!156101) (not ((_ is MissingVacant!2849) lt!156101)) (and (bvsge (index!13575 lt!156101) #b00000000000000000000000000000000) (bvslt (index!13575 lt!156101) (size!8105 a!3305)))) (or ((_ is Undefined!2849) lt!156101) (ite ((_ is Found!2849) lt!156101) (= (select (arr!7753 a!3305) (index!13573 lt!156101)) k0!2497) (ite ((_ is MissingZero!2849) lt!156101) (= (select (arr!7753 a!3305) (index!13572 lt!156101)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2849) lt!156101) (= (select (arr!7753 a!3305) (index!13575 lt!156101)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69507 (= lt!156101 e!198888)))

(declare-fun c!50532 () Bool)

(assert (=> d!69507 (= c!50532 (and ((_ is Intermediate!2849) lt!156103) (undefined!3661 lt!156103)))))

(assert (=> d!69507 (= lt!156103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69507 (validMask!0 mask!3777)))

(assert (=> d!69507 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!156101)))

(declare-fun b!320591 () Bool)

(declare-fun c!50530 () Bool)

(assert (=> b!320591 (= c!50530 (= lt!156102 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!320591 (= e!198887 e!198889)))

(assert (= (and d!69507 c!50532) b!320590))

(assert (= (and d!69507 (not c!50532)) b!320589))

(assert (= (and b!320589 c!50531) b!320587))

(assert (= (and b!320589 (not c!50531)) b!320591))

(assert (= (and b!320591 c!50530) b!320588))

(assert (= (and b!320591 (not c!50530)) b!320586))

(declare-fun m!329115 () Bool)

(assert (=> b!320586 m!329115))

(declare-fun m!329117 () Bool)

(assert (=> b!320589 m!329117))

(assert (=> d!69507 m!329003))

(declare-fun m!329119 () Bool)

(assert (=> d!69507 m!329119))

(assert (=> d!69507 m!328997))

(assert (=> d!69507 m!328997))

(assert (=> d!69507 m!328999))

(declare-fun m!329121 () Bool)

(assert (=> d!69507 m!329121))

(declare-fun m!329123 () Bool)

(assert (=> d!69507 m!329123))

(assert (=> b!320387 d!69507))

(check-sat (not b!320586) (not bm!26039) (not b!320451) (not d!69487) (not b!320540) (not d!69507) (not b!320444) (not b!320442))
(check-sat)
