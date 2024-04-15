; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32522 () Bool)

(assert start!32522)

(declare-fun b!325218 () Bool)

(declare-fun res!178700 () Bool)

(declare-fun e!200419 () Bool)

(assert (=> b!325218 (=> (not res!178700) (not e!200419))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-datatypes ((array!16665 0))(
  ( (array!16666 (arr!7890 (Array (_ BitVec 32) (_ BitVec 64))) (size!8243 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16665)

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!325218 (= res!178700 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7890 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325219 () Bool)

(declare-fun e!200420 () Bool)

(assert (=> b!325219 (= e!200420 e!200419)))

(declare-fun res!178703 () Bool)

(assert (=> b!325219 (=> (not res!178703) (not e!200419))))

(declare-datatypes ((SeekEntryResult!3020 0))(
  ( (MissingZero!3020 (index!14256 (_ BitVec 32))) (Found!3020 (index!14257 (_ BitVec 32))) (Intermediate!3020 (undefined!3832 Bool) (index!14258 (_ BitVec 32)) (x!32507 (_ BitVec 32))) (Undefined!3020) (MissingVacant!3020 (index!14259 (_ BitVec 32))) )
))
(declare-fun lt!156779 () SeekEntryResult!3020)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16665 (_ BitVec 32)) SeekEntryResult!3020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325219 (= res!178703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156779))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325219 (= lt!156779 (Intermediate!3020 false resIndex!58 resX!58))))

(declare-fun b!325220 () Bool)

(declare-fun res!178702 () Bool)

(assert (=> b!325220 (=> (not res!178702) (not e!200419))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325220 (= res!178702 (and (= (select (arr!7890 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8243 a!3305))))))

(declare-fun b!325221 () Bool)

(declare-fun res!178701 () Bool)

(assert (=> b!325221 (=> (not res!178701) (not e!200419))))

(assert (=> b!325221 (= res!178701 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156779))))

(declare-fun res!178697 () Bool)

(assert (=> start!32522 (=> (not res!178697) (not e!200420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32522 (= res!178697 (validMask!0 mask!3777))))

(assert (=> start!32522 e!200420))

(declare-fun array_inv!5862 (array!16665) Bool)

(assert (=> start!32522 (array_inv!5862 a!3305)))

(assert (=> start!32522 true))

(declare-fun b!325222 () Bool)

(declare-fun res!178698 () Bool)

(assert (=> b!325222 (=> (not res!178698) (not e!200420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325222 (= res!178698 (validKeyInArray!0 k0!2497))))

(declare-fun b!325223 () Bool)

(declare-fun res!178695 () Bool)

(assert (=> b!325223 (=> (not res!178695) (not e!200420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16665 (_ BitVec 32)) Bool)

(assert (=> b!325223 (= res!178695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325224 () Bool)

(declare-fun res!178699 () Bool)

(assert (=> b!325224 (=> (not res!178699) (not e!200420))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16665 (_ BitVec 32)) SeekEntryResult!3020)

(assert (=> b!325224 (= res!178699 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3020 i!1250)))))

(declare-fun b!325225 () Bool)

(declare-fun res!178696 () Bool)

(assert (=> b!325225 (=> (not res!178696) (not e!200420))))

(declare-fun arrayContainsKey!0 (array!16665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325225 (= res!178696 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325226 () Bool)

(declare-fun lt!156778 () (_ BitVec 32))

(assert (=> b!325226 (= e!200419 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000) (or (bvslt lt!156778 #b00000000000000000000000000000000) (bvsge lt!156778 (size!8243 a!3305)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325226 (= lt!156778 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325227 () Bool)

(declare-fun res!178704 () Bool)

(assert (=> b!325227 (=> (not res!178704) (not e!200420))))

(assert (=> b!325227 (= res!178704 (and (= (size!8243 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8243 a!3305))))))

(assert (= (and start!32522 res!178697) b!325227))

(assert (= (and b!325227 res!178704) b!325222))

(assert (= (and b!325222 res!178698) b!325225))

(assert (= (and b!325225 res!178696) b!325224))

(assert (= (and b!325224 res!178699) b!325223))

(assert (= (and b!325223 res!178695) b!325219))

(assert (= (and b!325219 res!178703) b!325220))

(assert (= (and b!325220 res!178702) b!325221))

(assert (= (and b!325221 res!178701) b!325218))

(assert (= (and b!325218 res!178700) b!325226))

(declare-fun m!331597 () Bool)

(assert (=> start!32522 m!331597))

(declare-fun m!331599 () Bool)

(assert (=> start!32522 m!331599))

(declare-fun m!331601 () Bool)

(assert (=> b!325225 m!331601))

(declare-fun m!331603 () Bool)

(assert (=> b!325221 m!331603))

(declare-fun m!331605 () Bool)

(assert (=> b!325223 m!331605))

(declare-fun m!331607 () Bool)

(assert (=> b!325220 m!331607))

(declare-fun m!331609 () Bool)

(assert (=> b!325218 m!331609))

(declare-fun m!331611 () Bool)

(assert (=> b!325226 m!331611))

(declare-fun m!331613 () Bool)

(assert (=> b!325222 m!331613))

(declare-fun m!331615 () Bool)

(assert (=> b!325224 m!331615))

(declare-fun m!331617 () Bool)

(assert (=> b!325219 m!331617))

(assert (=> b!325219 m!331617))

(declare-fun m!331619 () Bool)

(assert (=> b!325219 m!331619))

(check-sat (not b!325223) (not b!325219) (not b!325221) (not b!325224) (not b!325225) (not b!325226) (not b!325222) (not start!32522))
(check-sat)
(get-model)

(declare-fun d!69441 () Bool)

(declare-fun res!178769 () Bool)

(declare-fun e!200443 () Bool)

(assert (=> d!69441 (=> res!178769 e!200443)))

(assert (=> d!69441 (= res!178769 (= (select (arr!7890 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69441 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!200443)))

(declare-fun b!325292 () Bool)

(declare-fun e!200444 () Bool)

(assert (=> b!325292 (= e!200443 e!200444)))

(declare-fun res!178770 () Bool)

(assert (=> b!325292 (=> (not res!178770) (not e!200444))))

(assert (=> b!325292 (= res!178770 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8243 a!3305)))))

(declare-fun b!325293 () Bool)

(assert (=> b!325293 (= e!200444 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69441 (not res!178769)) b!325292))

(assert (= (and b!325292 res!178770) b!325293))

(declare-fun m!331669 () Bool)

(assert (=> d!69441 m!331669))

(declare-fun m!331671 () Bool)

(assert (=> b!325293 m!331671))

(assert (=> b!325225 d!69441))

(declare-fun d!69443 () Bool)

(declare-fun lt!156794 () (_ BitVec 32))

(assert (=> d!69443 (and (bvsge lt!156794 #b00000000000000000000000000000000) (bvslt lt!156794 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69443 (= lt!156794 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69443 (validMask!0 mask!3777)))

(assert (=> d!69443 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!156794)))

(declare-fun bs!11297 () Bool)

(assert (= bs!11297 d!69443))

(declare-fun m!331673 () Bool)

(assert (=> bs!11297 m!331673))

(assert (=> bs!11297 m!331597))

(assert (=> b!325226 d!69443))

(declare-fun b!325324 () Bool)

(declare-fun e!200464 () Bool)

(declare-fun lt!156808 () SeekEntryResult!3020)

(assert (=> b!325324 (= e!200464 (bvsge (x!32507 lt!156808) #b01111111111111111111111111111110))))

(declare-fun b!325325 () Bool)

(assert (=> b!325325 (and (bvsge (index!14258 lt!156808) #b00000000000000000000000000000000) (bvslt (index!14258 lt!156808) (size!8243 a!3305)))))

(declare-fun res!178783 () Bool)

(assert (=> b!325325 (= res!178783 (= (select (arr!7890 a!3305) (index!14258 lt!156808)) k0!2497))))

(declare-fun e!200465 () Bool)

(assert (=> b!325325 (=> res!178783 e!200465)))

(declare-fun e!200468 () Bool)

(assert (=> b!325325 (= e!200468 e!200465)))

(declare-fun b!325326 () Bool)

(declare-fun e!200466 () SeekEntryResult!3020)

(assert (=> b!325326 (= e!200466 (Intermediate!3020 false index!1840 x!1490))))

(declare-fun b!325327 () Bool)

(assert (=> b!325327 (and (bvsge (index!14258 lt!156808) #b00000000000000000000000000000000) (bvslt (index!14258 lt!156808) (size!8243 a!3305)))))

(declare-fun res!178785 () Bool)

(assert (=> b!325327 (= res!178785 (= (select (arr!7890 a!3305) (index!14258 lt!156808)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325327 (=> res!178785 e!200465)))

(declare-fun b!325329 () Bool)

(assert (=> b!325329 (and (bvsge (index!14258 lt!156808) #b00000000000000000000000000000000) (bvslt (index!14258 lt!156808) (size!8243 a!3305)))))

(assert (=> b!325329 (= e!200465 (= (select (arr!7890 a!3305) (index!14258 lt!156808)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325330 () Bool)

(assert (=> b!325330 (= e!200466 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325331 () Bool)

(declare-fun e!200467 () SeekEntryResult!3020)

(assert (=> b!325331 (= e!200467 (Intermediate!3020 true index!1840 x!1490))))

(declare-fun b!325332 () Bool)

(assert (=> b!325332 (= e!200467 e!200466)))

(declare-fun c!50898 () Bool)

(declare-fun lt!156809 () (_ BitVec 64))

(assert (=> b!325332 (= c!50898 (or (= lt!156809 k0!2497) (= (bvadd lt!156809 lt!156809) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325328 () Bool)

(assert (=> b!325328 (= e!200464 e!200468)))

(declare-fun res!178784 () Bool)

(get-info :version)

(assert (=> b!325328 (= res!178784 (and ((_ is Intermediate!3020) lt!156808) (not (undefined!3832 lt!156808)) (bvslt (x!32507 lt!156808) #b01111111111111111111111111111110) (bvsge (x!32507 lt!156808) #b00000000000000000000000000000000) (bvsge (x!32507 lt!156808) x!1490)))))

(assert (=> b!325328 (=> (not res!178784) (not e!200468))))

(declare-fun d!69445 () Bool)

(assert (=> d!69445 e!200464))

(declare-fun c!50900 () Bool)

(assert (=> d!69445 (= c!50900 (and ((_ is Intermediate!3020) lt!156808) (undefined!3832 lt!156808)))))

(assert (=> d!69445 (= lt!156808 e!200467)))

(declare-fun c!50899 () Bool)

(assert (=> d!69445 (= c!50899 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69445 (= lt!156809 (select (arr!7890 a!3305) index!1840))))

(assert (=> d!69445 (validMask!0 mask!3777)))

(assert (=> d!69445 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156808)))

(assert (= (and d!69445 c!50899) b!325331))

(assert (= (and d!69445 (not c!50899)) b!325332))

(assert (= (and b!325332 c!50898) b!325326))

(assert (= (and b!325332 (not c!50898)) b!325330))

(assert (= (and d!69445 c!50900) b!325324))

(assert (= (and d!69445 (not c!50900)) b!325328))

(assert (= (and b!325328 res!178784) b!325325))

(assert (= (and b!325325 (not res!178783)) b!325327))

(assert (= (and b!325327 (not res!178785)) b!325329))

(assert (=> d!69445 m!331609))

(assert (=> d!69445 m!331597))

(declare-fun m!331687 () Bool)

(assert (=> b!325329 m!331687))

(assert (=> b!325330 m!331611))

(assert (=> b!325330 m!331611))

(declare-fun m!331689 () Bool)

(assert (=> b!325330 m!331689))

(assert (=> b!325327 m!331687))

(assert (=> b!325325 m!331687))

(assert (=> b!325221 d!69445))

(declare-fun d!69455 () Bool)

(assert (=> d!69455 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32522 d!69455))

(declare-fun d!69457 () Bool)

(assert (=> d!69457 (= (array_inv!5862 a!3305) (bvsge (size!8243 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32522 d!69457))

(declare-fun d!69459 () Bool)

(assert (=> d!69459 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325222 d!69459))

(declare-fun bm!26048 () Bool)

(declare-fun call!26051 () Bool)

(assert (=> bm!26048 (= call!26051 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!325395 () Bool)

(declare-fun e!200507 () Bool)

(declare-fun e!200506 () Bool)

(assert (=> b!325395 (= e!200507 e!200506)))

(declare-fun lt!156834 () (_ BitVec 64))

(assert (=> b!325395 (= lt!156834 (select (arr!7890 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10054 0))(
  ( (Unit!10055) )
))
(declare-fun lt!156835 () Unit!10054)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16665 (_ BitVec 64) (_ BitVec 32)) Unit!10054)

(assert (=> b!325395 (= lt!156835 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!156834 #b00000000000000000000000000000000))))

(assert (=> b!325395 (arrayContainsKey!0 a!3305 lt!156834 #b00000000000000000000000000000000)))

(declare-fun lt!156836 () Unit!10054)

(assert (=> b!325395 (= lt!156836 lt!156835)))

(declare-fun res!178810 () Bool)

(assert (=> b!325395 (= res!178810 (= (seekEntryOrOpen!0 (select (arr!7890 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3020 #b00000000000000000000000000000000)))))

(assert (=> b!325395 (=> (not res!178810) (not e!200506))))

(declare-fun d!69461 () Bool)

(declare-fun res!178811 () Bool)

(declare-fun e!200505 () Bool)

(assert (=> d!69461 (=> res!178811 e!200505)))

(assert (=> d!69461 (= res!178811 (bvsge #b00000000000000000000000000000000 (size!8243 a!3305)))))

(assert (=> d!69461 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!200505)))

(declare-fun b!325396 () Bool)

(assert (=> b!325396 (= e!200507 call!26051)))

(declare-fun b!325397 () Bool)

(assert (=> b!325397 (= e!200506 call!26051)))

(declare-fun b!325398 () Bool)

(assert (=> b!325398 (= e!200505 e!200507)))

(declare-fun c!50921 () Bool)

(assert (=> b!325398 (= c!50921 (validKeyInArray!0 (select (arr!7890 a!3305) #b00000000000000000000000000000000)))))

(assert (= (and d!69461 (not res!178811)) b!325398))

(assert (= (and b!325398 c!50921) b!325395))

(assert (= (and b!325398 (not c!50921)) b!325396))

(assert (= (and b!325395 res!178810) b!325397))

(assert (= (or b!325397 b!325396) bm!26048))

(declare-fun m!331707 () Bool)

(assert (=> bm!26048 m!331707))

(assert (=> b!325395 m!331669))

(declare-fun m!331709 () Bool)

(assert (=> b!325395 m!331709))

(declare-fun m!331711 () Bool)

(assert (=> b!325395 m!331711))

(assert (=> b!325395 m!331669))

(declare-fun m!331713 () Bool)

(assert (=> b!325395 m!331713))

(assert (=> b!325398 m!331669))

(assert (=> b!325398 m!331669))

(declare-fun m!331715 () Bool)

(assert (=> b!325398 m!331715))

(assert (=> b!325223 d!69461))

(declare-fun d!69469 () Bool)

(declare-fun lt!156860 () SeekEntryResult!3020)

(assert (=> d!69469 (and (or ((_ is Undefined!3020) lt!156860) (not ((_ is Found!3020) lt!156860)) (and (bvsge (index!14257 lt!156860) #b00000000000000000000000000000000) (bvslt (index!14257 lt!156860) (size!8243 a!3305)))) (or ((_ is Undefined!3020) lt!156860) ((_ is Found!3020) lt!156860) (not ((_ is MissingZero!3020) lt!156860)) (and (bvsge (index!14256 lt!156860) #b00000000000000000000000000000000) (bvslt (index!14256 lt!156860) (size!8243 a!3305)))) (or ((_ is Undefined!3020) lt!156860) ((_ is Found!3020) lt!156860) ((_ is MissingZero!3020) lt!156860) (not ((_ is MissingVacant!3020) lt!156860)) (and (bvsge (index!14259 lt!156860) #b00000000000000000000000000000000) (bvslt (index!14259 lt!156860) (size!8243 a!3305)))) (or ((_ is Undefined!3020) lt!156860) (ite ((_ is Found!3020) lt!156860) (= (select (arr!7890 a!3305) (index!14257 lt!156860)) k0!2497) (ite ((_ is MissingZero!3020) lt!156860) (= (select (arr!7890 a!3305) (index!14256 lt!156860)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3020) lt!156860) (= (select (arr!7890 a!3305) (index!14259 lt!156860)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!200536 () SeekEntryResult!3020)

(assert (=> d!69469 (= lt!156860 e!200536)))

(declare-fun c!50941 () Bool)

(declare-fun lt!156861 () SeekEntryResult!3020)

(assert (=> d!69469 (= c!50941 (and ((_ is Intermediate!3020) lt!156861) (undefined!3832 lt!156861)))))

(assert (=> d!69469 (= lt!156861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69469 (validMask!0 mask!3777)))

(assert (=> d!69469 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!156860)))

(declare-fun b!325444 () Bool)

(declare-fun c!50942 () Bool)

(declare-fun lt!156862 () (_ BitVec 64))

(assert (=> b!325444 (= c!50942 (= lt!156862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200534 () SeekEntryResult!3020)

(declare-fun e!200535 () SeekEntryResult!3020)

(assert (=> b!325444 (= e!200534 e!200535)))

(declare-fun b!325445 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16665 (_ BitVec 32)) SeekEntryResult!3020)

(assert (=> b!325445 (= e!200535 (seekKeyOrZeroReturnVacant!0 (x!32507 lt!156861) (index!14258 lt!156861) (index!14258 lt!156861) k0!2497 a!3305 mask!3777))))

(declare-fun b!325446 () Bool)

(assert (=> b!325446 (= e!200536 e!200534)))

(assert (=> b!325446 (= lt!156862 (select (arr!7890 a!3305) (index!14258 lt!156861)))))

(declare-fun c!50940 () Bool)

(assert (=> b!325446 (= c!50940 (= lt!156862 k0!2497))))

(declare-fun b!325447 () Bool)

(assert (=> b!325447 (= e!200535 (MissingZero!3020 (index!14258 lt!156861)))))

(declare-fun b!325448 () Bool)

(assert (=> b!325448 (= e!200534 (Found!3020 (index!14258 lt!156861)))))

(declare-fun b!325449 () Bool)

(assert (=> b!325449 (= e!200536 Undefined!3020)))

(assert (= (and d!69469 c!50941) b!325449))

(assert (= (and d!69469 (not c!50941)) b!325446))

(assert (= (and b!325446 c!50940) b!325448))

(assert (= (and b!325446 (not c!50940)) b!325444))

(assert (= (and b!325444 c!50942) b!325447))

(assert (= (and b!325444 (not c!50942)) b!325445))

(assert (=> d!69469 m!331597))

(declare-fun m!331735 () Bool)

(assert (=> d!69469 m!331735))

(declare-fun m!331737 () Bool)

(assert (=> d!69469 m!331737))

(declare-fun m!331739 () Bool)

(assert (=> d!69469 m!331739))

(assert (=> d!69469 m!331617))

(assert (=> d!69469 m!331617))

(assert (=> d!69469 m!331619))

(declare-fun m!331743 () Bool)

(assert (=> b!325445 m!331743))

(declare-fun m!331745 () Bool)

(assert (=> b!325446 m!331745))

(assert (=> b!325224 d!69469))

(declare-fun b!325459 () Bool)

(declare-fun e!200542 () Bool)

(declare-fun lt!156865 () SeekEntryResult!3020)

(assert (=> b!325459 (= e!200542 (bvsge (x!32507 lt!156865) #b01111111111111111111111111111110))))

(declare-fun b!325460 () Bool)

(assert (=> b!325460 (and (bvsge (index!14258 lt!156865) #b00000000000000000000000000000000) (bvslt (index!14258 lt!156865) (size!8243 a!3305)))))

(declare-fun res!178824 () Bool)

(assert (=> b!325460 (= res!178824 (= (select (arr!7890 a!3305) (index!14258 lt!156865)) k0!2497))))

(declare-fun e!200543 () Bool)

(assert (=> b!325460 (=> res!178824 e!200543)))

(declare-fun e!200546 () Bool)

(assert (=> b!325460 (= e!200546 e!200543)))

(declare-fun b!325461 () Bool)

(declare-fun e!200544 () SeekEntryResult!3020)

(assert (=> b!325461 (= e!200544 (Intermediate!3020 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325462 () Bool)

(assert (=> b!325462 (and (bvsge (index!14258 lt!156865) #b00000000000000000000000000000000) (bvslt (index!14258 lt!156865) (size!8243 a!3305)))))

(declare-fun res!178826 () Bool)

(assert (=> b!325462 (= res!178826 (= (select (arr!7890 a!3305) (index!14258 lt!156865)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325462 (=> res!178826 e!200543)))

(declare-fun b!325464 () Bool)

(assert (=> b!325464 (and (bvsge (index!14258 lt!156865) #b00000000000000000000000000000000) (bvslt (index!14258 lt!156865) (size!8243 a!3305)))))

(assert (=> b!325464 (= e!200543 (= (select (arr!7890 a!3305) (index!14258 lt!156865)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325465 () Bool)

(assert (=> b!325465 (= e!200544 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325466 () Bool)

(declare-fun e!200545 () SeekEntryResult!3020)

(assert (=> b!325466 (= e!200545 (Intermediate!3020 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325467 () Bool)

(assert (=> b!325467 (= e!200545 e!200544)))

(declare-fun c!50946 () Bool)

(declare-fun lt!156866 () (_ BitVec 64))

(assert (=> b!325467 (= c!50946 (or (= lt!156866 k0!2497) (= (bvadd lt!156866 lt!156866) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325463 () Bool)

(assert (=> b!325463 (= e!200542 e!200546)))

(declare-fun res!178825 () Bool)

(assert (=> b!325463 (= res!178825 (and ((_ is Intermediate!3020) lt!156865) (not (undefined!3832 lt!156865)) (bvslt (x!32507 lt!156865) #b01111111111111111111111111111110) (bvsge (x!32507 lt!156865) #b00000000000000000000000000000000) (bvsge (x!32507 lt!156865) #b00000000000000000000000000000000)))))

(assert (=> b!325463 (=> (not res!178825) (not e!200546))))

(declare-fun d!69483 () Bool)

(assert (=> d!69483 e!200542))

(declare-fun c!50948 () Bool)

(assert (=> d!69483 (= c!50948 (and ((_ is Intermediate!3020) lt!156865) (undefined!3832 lt!156865)))))

(assert (=> d!69483 (= lt!156865 e!200545)))

(declare-fun c!50947 () Bool)

(assert (=> d!69483 (= c!50947 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69483 (= lt!156866 (select (arr!7890 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69483 (validMask!0 mask!3777)))

(assert (=> d!69483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156865)))

(assert (= (and d!69483 c!50947) b!325466))

(assert (= (and d!69483 (not c!50947)) b!325467))

(assert (= (and b!325467 c!50946) b!325461))

(assert (= (and b!325467 (not c!50946)) b!325465))

(assert (= (and d!69483 c!50948) b!325459))

(assert (= (and d!69483 (not c!50948)) b!325463))

(assert (= (and b!325463 res!178825) b!325460))

(assert (= (and b!325460 (not res!178824)) b!325462))

(assert (= (and b!325462 (not res!178826)) b!325464))

(assert (=> d!69483 m!331617))

(declare-fun m!331749 () Bool)

(assert (=> d!69483 m!331749))

(assert (=> d!69483 m!331597))

(declare-fun m!331751 () Bool)

(assert (=> b!325464 m!331751))

(assert (=> b!325465 m!331617))

(declare-fun m!331753 () Bool)

(assert (=> b!325465 m!331753))

(assert (=> b!325465 m!331753))

(declare-fun m!331755 () Bool)

(assert (=> b!325465 m!331755))

(assert (=> b!325462 m!331751))

(assert (=> b!325460 m!331751))

(assert (=> b!325219 d!69483))

(declare-fun d!69487 () Bool)

(declare-fun lt!156872 () (_ BitVec 32))

(declare-fun lt!156871 () (_ BitVec 32))

(assert (=> d!69487 (= lt!156872 (bvmul (bvxor lt!156871 (bvlshr lt!156871 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69487 (= lt!156871 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69487 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!178827 (let ((h!5361 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32516 (bvmul (bvxor h!5361 (bvlshr h!5361 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32516 (bvlshr x!32516 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!178827 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!178827 #b00000000000000000000000000000000))))))

(assert (=> d!69487 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!156872 (bvlshr lt!156872 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!325219 d!69487))

(check-sat (not b!325395) (not b!325398) (not b!325465) (not d!69469) (not d!69443) (not d!69483) (not d!69445) (not b!325293) (not b!325445) (not bm!26048) (not b!325330))
(check-sat)
