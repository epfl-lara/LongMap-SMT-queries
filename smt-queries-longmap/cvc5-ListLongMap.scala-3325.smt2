; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45894 () Bool)

(assert start!45894)

(declare-fun b!508339 () Bool)

(declare-fun e!297393 () Bool)

(declare-fun e!297391 () Bool)

(assert (=> b!508339 (= e!297393 e!297391)))

(declare-fun res!309299 () Bool)

(assert (=> b!508339 (=> (not res!309299) (not e!297391))))

(declare-datatypes ((SeekEntryResult!4172 0))(
  ( (MissingZero!4172 (index!18876 (_ BitVec 32))) (Found!4172 (index!18877 (_ BitVec 32))) (Intermediate!4172 (undefined!4984 Bool) (index!18878 (_ BitVec 32)) (x!47861 (_ BitVec 32))) (Undefined!4172) (MissingVacant!4172 (index!18879 (_ BitVec 32))) )
))
(declare-fun lt!232209 () SeekEntryResult!4172)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508339 (= res!309299 (or (= lt!232209 (MissingZero!4172 i!1204)) (= lt!232209 (MissingVacant!4172 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32650 0))(
  ( (array!32651 (arr!15705 (Array (_ BitVec 32) (_ BitVec 64))) (size!16069 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32650)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32650 (_ BitVec 32)) SeekEntryResult!4172)

(assert (=> b!508339 (= lt!232209 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508340 () Bool)

(declare-fun res!309301 () Bool)

(assert (=> b!508340 (=> (not res!309301) (not e!297393))))

(declare-fun arrayContainsKey!0 (array!32650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508340 (= res!309301 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!309298 () Bool)

(assert (=> start!45894 (=> (not res!309298) (not e!297393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45894 (= res!309298 (validMask!0 mask!3524))))

(assert (=> start!45894 e!297393))

(assert (=> start!45894 true))

(declare-fun array_inv!11501 (array!32650) Bool)

(assert (=> start!45894 (array_inv!11501 a!3235)))

(declare-fun b!508341 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508341 (= e!297391 (not (= (seekEntryOrOpen!0 (select (arr!15705 a!3235) j!176) a!3235 mask!3524) (Found!4172 j!176))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32650 (_ BitVec 32)) Bool)

(assert (=> b!508341 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15602 0))(
  ( (Unit!15603) )
))
(declare-fun lt!232210 () Unit!15602)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15602)

(assert (=> b!508341 (= lt!232210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508342 () Bool)

(declare-fun res!309303 () Bool)

(assert (=> b!508342 (=> (not res!309303) (not e!297393))))

(assert (=> b!508342 (= res!309303 (and (= (size!16069 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16069 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16069 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508343 () Bool)

(declare-fun res!309305 () Bool)

(assert (=> b!508343 (=> (not res!309305) (not e!297393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508343 (= res!309305 (validKeyInArray!0 (select (arr!15705 a!3235) j!176)))))

(declare-fun b!508344 () Bool)

(declare-fun res!309302 () Bool)

(assert (=> b!508344 (=> (not res!309302) (not e!297391))))

(assert (=> b!508344 (= res!309302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508345 () Bool)

(declare-fun res!309300 () Bool)

(assert (=> b!508345 (=> (not res!309300) (not e!297391))))

(declare-datatypes ((List!9863 0))(
  ( (Nil!9860) (Cons!9859 (h!10736 (_ BitVec 64)) (t!16091 List!9863)) )
))
(declare-fun arrayNoDuplicates!0 (array!32650 (_ BitVec 32) List!9863) Bool)

(assert (=> b!508345 (= res!309300 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9860))))

(declare-fun b!508346 () Bool)

(declare-fun res!309304 () Bool)

(assert (=> b!508346 (=> (not res!309304) (not e!297393))))

(assert (=> b!508346 (= res!309304 (validKeyInArray!0 k!2280))))

(assert (= (and start!45894 res!309298) b!508342))

(assert (= (and b!508342 res!309303) b!508343))

(assert (= (and b!508343 res!309305) b!508346))

(assert (= (and b!508346 res!309304) b!508340))

(assert (= (and b!508340 res!309301) b!508339))

(assert (= (and b!508339 res!309299) b!508344))

(assert (= (and b!508344 res!309302) b!508345))

(assert (= (and b!508345 res!309300) b!508341))

(declare-fun m!489123 () Bool)

(assert (=> b!508345 m!489123))

(declare-fun m!489125 () Bool)

(assert (=> b!508346 m!489125))

(declare-fun m!489127 () Bool)

(assert (=> b!508339 m!489127))

(declare-fun m!489129 () Bool)

(assert (=> b!508340 m!489129))

(declare-fun m!489131 () Bool)

(assert (=> b!508341 m!489131))

(assert (=> b!508341 m!489131))

(declare-fun m!489133 () Bool)

(assert (=> b!508341 m!489133))

(declare-fun m!489135 () Bool)

(assert (=> b!508341 m!489135))

(declare-fun m!489137 () Bool)

(assert (=> b!508341 m!489137))

(declare-fun m!489139 () Bool)

(assert (=> b!508344 m!489139))

(assert (=> b!508343 m!489131))

(assert (=> b!508343 m!489131))

(declare-fun m!489141 () Bool)

(assert (=> b!508343 m!489141))

(declare-fun m!489143 () Bool)

(assert (=> start!45894 m!489143))

(declare-fun m!489145 () Bool)

(assert (=> start!45894 m!489145))

(push 1)

(assert (not b!508341))

(assert (not b!508340))

(assert (not b!508339))

(assert (not b!508343))

(assert (not b!508345))

(assert (not b!508346))

(assert (not start!45894))

(assert (not b!508344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!31475 () Bool)

(declare-fun call!31478 () Bool)

(assert (=> bm!31475 (= call!31478 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!78743 () Bool)

(declare-fun res!309368 () Bool)

(declare-fun e!297439 () Bool)

(assert (=> d!78743 (=> res!309368 e!297439)))

(assert (=> d!78743 (= res!309368 (bvsge #b00000000000000000000000000000000 (size!16069 a!3235)))))

(assert (=> d!78743 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!297439)))

(declare-fun b!508436 () Bool)

(declare-fun e!297440 () Bool)

(declare-fun e!297441 () Bool)

(assert (=> b!508436 (= e!297440 e!297441)))

(declare-fun lt!232238 () (_ BitVec 64))

(assert (=> b!508436 (= lt!232238 (select (arr!15705 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!232239 () Unit!15602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32650 (_ BitVec 64) (_ BitVec 32)) Unit!15602)

(assert (=> b!508436 (= lt!232239 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!232238 #b00000000000000000000000000000000))))

(assert (=> b!508436 (arrayContainsKey!0 a!3235 lt!232238 #b00000000000000000000000000000000)))

(declare-fun lt!232240 () Unit!15602)

(assert (=> b!508436 (= lt!232240 lt!232239)))

(declare-fun res!309367 () Bool)

(assert (=> b!508436 (= res!309367 (= (seekEntryOrOpen!0 (select (arr!15705 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4172 #b00000000000000000000000000000000)))))

(assert (=> b!508436 (=> (not res!309367) (not e!297441))))

(declare-fun b!508437 () Bool)

(assert (=> b!508437 (= e!297439 e!297440)))

(declare-fun c!59813 () Bool)

(assert (=> b!508437 (= c!59813 (validKeyInArray!0 (select (arr!15705 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!508438 () Bool)

(assert (=> b!508438 (= e!297441 call!31478)))

(declare-fun b!508439 () Bool)

(assert (=> b!508439 (= e!297440 call!31478)))

(assert (= (and d!78743 (not res!309368)) b!508437))

(assert (= (and b!508437 c!59813) b!508436))

(assert (= (and b!508437 (not c!59813)) b!508439))

(assert (= (and b!508436 res!309367) b!508438))

(assert (= (or b!508438 b!508439) bm!31475))

(declare-fun m!489213 () Bool)

(assert (=> bm!31475 m!489213))

(declare-fun m!489217 () Bool)

(assert (=> b!508436 m!489217))

(declare-fun m!489219 () Bool)

(assert (=> b!508436 m!489219))

(declare-fun m!489223 () Bool)

(assert (=> b!508436 m!489223))

(assert (=> b!508436 m!489217))

(declare-fun m!489225 () Bool)

(assert (=> b!508436 m!489225))

(assert (=> b!508437 m!489217))

(assert (=> b!508437 m!489217))

(declare-fun m!489227 () Bool)

(assert (=> b!508437 m!489227))

(assert (=> b!508344 d!78743))

(declare-fun b!508482 () Bool)

(declare-fun c!59827 () Bool)

(declare-fun lt!232268 () (_ BitVec 64))

(assert (=> b!508482 (= c!59827 (= lt!232268 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!297473 () SeekEntryResult!4172)

(declare-fun e!297474 () SeekEntryResult!4172)

(assert (=> b!508482 (= e!297473 e!297474)))

(declare-fun lt!232270 () SeekEntryResult!4172)

(declare-fun b!508483 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32650 (_ BitVec 32)) SeekEntryResult!4172)

(assert (=> b!508483 (= e!297474 (seekKeyOrZeroReturnVacant!0 (x!47861 lt!232270) (index!18878 lt!232270) (index!18878 lt!232270) k!2280 a!3235 mask!3524))))

(declare-fun d!78751 () Bool)

(declare-fun lt!232269 () SeekEntryResult!4172)

(assert (=> d!78751 (and (or (is-Undefined!4172 lt!232269) (not (is-Found!4172 lt!232269)) (and (bvsge (index!18877 lt!232269) #b00000000000000000000000000000000) (bvslt (index!18877 lt!232269) (size!16069 a!3235)))) (or (is-Undefined!4172 lt!232269) (is-Found!4172 lt!232269) (not (is-MissingZero!4172 lt!232269)) (and (bvsge (index!18876 lt!232269) #b00000000000000000000000000000000) (bvslt (index!18876 lt!232269) (size!16069 a!3235)))) (or (is-Undefined!4172 lt!232269) (is-Found!4172 lt!232269) (is-MissingZero!4172 lt!232269) (not (is-MissingVacant!4172 lt!232269)) (and (bvsge (index!18879 lt!232269) #b00000000000000000000000000000000) (bvslt (index!18879 lt!232269) (size!16069 a!3235)))) (or (is-Undefined!4172 lt!232269) (ite (is-Found!4172 lt!232269) (= (select (arr!15705 a!3235) (index!18877 lt!232269)) k!2280) (ite (is-MissingZero!4172 lt!232269) (= (select (arr!15705 a!3235) (index!18876 lt!232269)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4172 lt!232269) (= (select (arr!15705 a!3235) (index!18879 lt!232269)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!297472 () SeekEntryResult!4172)

(assert (=> d!78751 (= lt!232269 e!297472)))

(declare-fun c!59828 () Bool)

(assert (=> d!78751 (= c!59828 (and (is-Intermediate!4172 lt!232270) (undefined!4984 lt!232270)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32650 (_ BitVec 32)) SeekEntryResult!4172)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!78751 (= lt!232270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78751 (validMask!0 mask!3524)))

(assert (=> d!78751 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!232269)))

(declare-fun b!508484 () Bool)

(assert (=> b!508484 (= e!297474 (MissingZero!4172 (index!18878 lt!232270)))))

(declare-fun b!508485 () Bool)

(assert (=> b!508485 (= e!297473 (Found!4172 (index!18878 lt!232270)))))

(declare-fun b!508486 () Bool)

(assert (=> b!508486 (= e!297472 Undefined!4172)))

(declare-fun b!508487 () Bool)

(assert (=> b!508487 (= e!297472 e!297473)))

(assert (=> b!508487 (= lt!232268 (select (arr!15705 a!3235) (index!18878 lt!232270)))))

(declare-fun c!59826 () Bool)

(assert (=> b!508487 (= c!59826 (= lt!232268 k!2280))))

(assert (= (and d!78751 c!59828) b!508486))

(assert (= (and d!78751 (not c!59828)) b!508487))

(assert (= (and b!508487 c!59826) b!508485))

(assert (= (and b!508487 (not c!59826)) b!508482))

(assert (= (and b!508482 c!59827) b!508484))

(assert (= (and b!508482 (not c!59827)) b!508483))

(declare-fun m!489249 () Bool)

(assert (=> b!508483 m!489249))

(declare-fun m!489251 () Bool)

(assert (=> d!78751 m!489251))

(declare-fun m!489253 () Bool)

(assert (=> d!78751 m!489253))

(assert (=> d!78751 m!489143))

(assert (=> d!78751 m!489251))

(declare-fun m!489255 () Bool)

(assert (=> d!78751 m!489255))

(declare-fun m!489257 () Bool)

(assert (=> d!78751 m!489257))

(declare-fun m!489259 () Bool)

(assert (=> d!78751 m!489259))

(declare-fun m!489261 () Bool)

(assert (=> b!508487 m!489261))

(assert (=> b!508339 d!78751))

(declare-fun d!78763 () Bool)

(assert (=> d!78763 (= (validKeyInArray!0 (select (arr!15705 a!3235) j!176)) (and (not (= (select (arr!15705 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15705 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!508343 d!78763))

(declare-fun d!78765 () Bool)

(assert (=> d!78765 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!508346 d!78765))

(declare-fun b!508488 () Bool)

(declare-fun c!59830 () Bool)

(declare-fun lt!232271 () (_ BitVec 64))

(assert (=> b!508488 (= c!59830 (= lt!232271 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!297476 () SeekEntryResult!4172)

(declare-fun e!297477 () SeekEntryResult!4172)

(assert (=> b!508488 (= e!297476 e!297477)))

(declare-fun lt!232273 () SeekEntryResult!4172)

(declare-fun b!508489 () Bool)

(assert (=> b!508489 (= e!297477 (seekKeyOrZeroReturnVacant!0 (x!47861 lt!232273) (index!18878 lt!232273) (index!18878 lt!232273) (select (arr!15705 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!78767 () Bool)

(declare-fun lt!232272 () SeekEntryResult!4172)

(assert (=> d!78767 (and (or (is-Undefined!4172 lt!232272) (not (is-Found!4172 lt!232272)) (and (bvsge (index!18877 lt!232272) #b00000000000000000000000000000000) (bvslt (index!18877 lt!232272) (size!16069 a!3235)))) (or (is-Undefined!4172 lt!232272) (is-Found!4172 lt!232272) (not (is-MissingZero!4172 lt!232272)) (and (bvsge (index!18876 lt!232272) #b00000000000000000000000000000000) (bvslt (index!18876 lt!232272) (size!16069 a!3235)))) (or (is-Undefined!4172 lt!232272) (is-Found!4172 lt!232272) (is-MissingZero!4172 lt!232272) (not (is-MissingVacant!4172 lt!232272)) (and (bvsge (index!18879 lt!232272) #b00000000000000000000000000000000) (bvslt (index!18879 lt!232272) (size!16069 a!3235)))) (or (is-Undefined!4172 lt!232272) (ite (is-Found!4172 lt!232272) (= (select (arr!15705 a!3235) (index!18877 lt!232272)) (select (arr!15705 a!3235) j!176)) (ite (is-MissingZero!4172 lt!232272) (= (select (arr!15705 a!3235) (index!18876 lt!232272)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4172 lt!232272) (= (select (arr!15705 a!3235) (index!18879 lt!232272)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!297475 () SeekEntryResult!4172)

(assert (=> d!78767 (= lt!232272 e!297475)))

(declare-fun c!59831 () Bool)

(assert (=> d!78767 (= c!59831 (and (is-Intermediate!4172 lt!232273) (undefined!4984 lt!232273)))))

(assert (=> d!78767 (= lt!232273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15705 a!3235) j!176) mask!3524) (select (arr!15705 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78767 (validMask!0 mask!3524)))

(assert (=> d!78767 (= (seekEntryOrOpen!0 (select (arr!15705 a!3235) j!176) a!3235 mask!3524) lt!232272)))

(declare-fun b!508490 () Bool)

(assert (=> b!508490 (= e!297477 (MissingZero!4172 (index!18878 lt!232273)))))

(declare-fun b!508491 () Bool)

(assert (=> b!508491 (= e!297476 (Found!4172 (index!18878 lt!232273)))))

(declare-fun b!508492 () Bool)

(assert (=> b!508492 (= e!297475 Undefined!4172)))

(declare-fun b!508493 () Bool)

(assert (=> b!508493 (= e!297475 e!297476)))

(assert (=> b!508493 (= lt!232271 (select (arr!15705 a!3235) (index!18878 lt!232273)))))

(declare-fun c!59829 () Bool)

(assert (=> b!508493 (= c!59829 (= lt!232271 (select (arr!15705 a!3235) j!176)))))

(assert (= (and d!78767 c!59831) b!508492))

(assert (= (and d!78767 (not c!59831)) b!508493))

(assert (= (and b!508493 c!59829) b!508491))

(assert (= (and b!508493 (not c!59829)) b!508488))

(assert (= (and b!508488 c!59830) b!508490))

(assert (= (and b!508488 (not c!59830)) b!508489))

(assert (=> b!508489 m!489131))

(declare-fun m!489263 () Bool)

(assert (=> b!508489 m!489263))

(assert (=> d!78767 m!489131))

(declare-fun m!489265 () Bool)

(assert (=> d!78767 m!489265))

(declare-fun m!489267 () Bool)

(assert (=> d!78767 m!489267))

(assert (=> d!78767 m!489143))

(assert (=> d!78767 m!489265))

(assert (=> d!78767 m!489131))

(declare-fun m!489269 () Bool)

(assert (=> d!78767 m!489269))

(declare-fun m!489271 () Bool)

(assert (=> d!78767 m!489271))

(declare-fun m!489273 () Bool)

(assert (=> d!78767 m!489273))

(declare-fun m!489275 () Bool)

(assert (=> b!508493 m!489275))

(assert (=> b!508341 d!78767))

(declare-fun bm!31482 () Bool)

(declare-fun call!31485 () Bool)

(assert (=> bm!31482 (= call!31485 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!78769 () Bool)

(declare-fun res!309388 () Bool)

(declare-fun e!297478 () Bool)

(assert (=> d!78769 (=> res!309388 e!297478)))

(assert (=> d!78769 (= res!309388 (bvsge j!176 (size!16069 a!3235)))))

(assert (=> d!78769 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!297478)))

(declare-fun b!508494 () Bool)

(declare-fun e!297479 () Bool)

(declare-fun e!297480 () Bool)

(assert (=> b!508494 (= e!297479 e!297480)))

(declare-fun lt!232274 () (_ BitVec 64))

(assert (=> b!508494 (= lt!232274 (select (arr!15705 a!3235) j!176))))

(declare-fun lt!232275 () Unit!15602)

(assert (=> b!508494 (= lt!232275 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!232274 j!176))))

(assert (=> b!508494 (arrayContainsKey!0 a!3235 lt!232274 #b00000000000000000000000000000000)))

(declare-fun lt!232276 () Unit!15602)

(assert (=> b!508494 (= lt!232276 lt!232275)))

(declare-fun res!309387 () Bool)

(assert (=> b!508494 (= res!309387 (= (seekEntryOrOpen!0 (select (arr!15705 a!3235) j!176) a!3235 mask!3524) (Found!4172 j!176)))))

(assert (=> b!508494 (=> (not res!309387) (not e!297480))))

(declare-fun b!508495 () Bool)

(assert (=> b!508495 (= e!297478 e!297479)))

(declare-fun c!59832 () Bool)

(assert (=> b!508495 (= c!59832 (validKeyInArray!0 (select (arr!15705 a!3235) j!176)))))

(declare-fun b!508496 () Bool)

(assert (=> b!508496 (= e!297480 call!31485)))

(declare-fun b!508497 () Bool)

(assert (=> b!508497 (= e!297479 call!31485)))

(assert (= (and d!78769 (not res!309388)) b!508495))

(assert (= (and b!508495 c!59832) b!508494))

(assert (= (and b!508495 (not c!59832)) b!508497))

(assert (= (and b!508494 res!309387) b!508496))

(assert (= (or b!508496 b!508497) bm!31482))

(declare-fun m!489277 () Bool)

(assert (=> bm!31482 m!489277))

(assert (=> b!508494 m!489131))

(declare-fun m!489279 () Bool)

(assert (=> b!508494 m!489279))

(declare-fun m!489281 () Bool)

(assert (=> b!508494 m!489281))

(assert (=> b!508494 m!489131))

(assert (=> b!508494 m!489133))

(assert (=> b!508495 m!489131))

(assert (=> b!508495 m!489131))

(assert (=> b!508495 m!489141))

(assert (=> b!508341 d!78769))

(declare-fun d!78771 () Bool)

(assert (=> d!78771 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!232285 () Unit!15602)

(declare-fun choose!38 (array!32650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15602)

(assert (=> d!78771 (= lt!232285 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78771 (validMask!0 mask!3524)))

(assert (=> d!78771 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!232285)))

(declare-fun bs!16097 () Bool)

(assert (= bs!16097 d!78771))

(assert (=> bs!16097 m!489135))

(declare-fun m!489283 () Bool)

(assert (=> bs!16097 m!489283))

(assert (=> bs!16097 m!489143))

(assert (=> b!508341 d!78771))

(declare-fun d!78777 () Bool)

(assert (=> d!78777 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45894 d!78777))

(declare-fun d!78793 () Bool)

(assert (=> d!78793 (= (array_inv!11501 a!3235) (bvsge (size!16069 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45894 d!78793))

(declare-fun bm!31490 () Bool)

(declare-fun call!31493 () Bool)

(declare-fun c!59852 () Bool)

(assert (=> bm!31490 (= call!31493 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59852 (Cons!9859 (select (arr!15705 a!3235) #b00000000000000000000000000000000) Nil!9860) Nil!9860)))))

(declare-fun b!508555 () Bool)

(declare-fun e!297520 () Bool)

(declare-fun e!297522 () Bool)

(assert (=> b!508555 (= e!297520 e!297522)))

(declare-fun res!309409 () Bool)

(assert (=> b!508555 (=> (not res!309409) (not e!297522))))

(declare-fun e!297521 () Bool)

(assert (=> b!508555 (= res!309409 (not e!297521))))

(declare-fun res!309408 () Bool)

(assert (=> b!508555 (=> (not res!309408) (not e!297521))))

(assert (=> b!508555 (= res!309408 (validKeyInArray!0 (select (arr!15705 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!508556 () Bool)

(declare-fun e!297519 () Bool)

(assert (=> b!508556 (= e!297519 call!31493)))

(declare-fun d!78795 () Bool)

(declare-fun res!309410 () Bool)

(assert (=> d!78795 (=> res!309410 e!297520)))

(assert (=> d!78795 (= res!309410 (bvsge #b00000000000000000000000000000000 (size!16069 a!3235)))))

(assert (=> d!78795 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9860) e!297520)))

(declare-fun b!508557 () Bool)

(declare-fun contains!2721 (List!9863 (_ BitVec 64)) Bool)

(assert (=> b!508557 (= e!297521 (contains!2721 Nil!9860 (select (arr!15705 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!508558 () Bool)

(assert (=> b!508558 (= e!297519 call!31493)))

(declare-fun b!508559 () Bool)

(assert (=> b!508559 (= e!297522 e!297519)))

(assert (=> b!508559 (= c!59852 (validKeyInArray!0 (select (arr!15705 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78795 (not res!309410)) b!508555))

(assert (= (and b!508555 res!309408) b!508557))

(assert (= (and b!508555 res!309409) b!508559))

(assert (= (and b!508559 c!59852) b!508556))

(assert (= (and b!508559 (not c!59852)) b!508558))

