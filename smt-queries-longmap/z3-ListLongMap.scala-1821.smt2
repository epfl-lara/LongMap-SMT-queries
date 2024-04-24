; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32768 () Bool)

(assert start!32768)

(declare-datatypes ((array!16773 0))(
  ( (array!16774 (arr!7939 (Array (_ BitVec 32) (_ BitVec 64))) (size!8291 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16773)

(declare-fun b!327463 () Bool)

(declare-fun e!201385 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!327463 (= e!201385 (and (bvslt resX!58 #b01111111111111111111111111111110) (= (select (arr!7939 a!3305) index!1840) k0!2497)))))

(declare-fun b!327464 () Bool)

(declare-fun e!201387 () Bool)

(assert (=> b!327464 (= e!201387 e!201385)))

(declare-fun res!180410 () Bool)

(assert (=> b!327464 (=> (not res!180410) (not e!201385))))

(declare-datatypes ((SeekEntryResult!3035 0))(
  ( (MissingZero!3035 (index!14316 (_ BitVec 32))) (Found!3035 (index!14317 (_ BitVec 32))) (Intermediate!3035 (undefined!3847 Bool) (index!14318 (_ BitVec 32)) (x!32668 (_ BitVec 32))) (Undefined!3035) (MissingVacant!3035 (index!14319 (_ BitVec 32))) )
))
(declare-fun lt!157602 () SeekEntryResult!3035)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16773 (_ BitVec 32)) SeekEntryResult!3035)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327464 (= res!180410 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157602))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!327464 (= lt!157602 (Intermediate!3035 false resIndex!58 resX!58))))

(declare-fun b!327465 () Bool)

(declare-fun res!180409 () Bool)

(assert (=> b!327465 (=> (not res!180409) (not e!201387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16773 (_ BitVec 32)) Bool)

(assert (=> b!327465 (= res!180409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327466 () Bool)

(declare-fun res!180404 () Bool)

(assert (=> b!327466 (=> (not res!180404) (not e!201385))))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!327466 (= res!180404 (and (= (select (arr!7939 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8291 a!3305))))))

(declare-fun res!180403 () Bool)

(assert (=> start!32768 (=> (not res!180403) (not e!201387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32768 (= res!180403 (validMask!0 mask!3777))))

(assert (=> start!32768 e!201387))

(declare-fun array_inv!5889 (array!16773) Bool)

(assert (=> start!32768 (array_inv!5889 a!3305)))

(assert (=> start!32768 true))

(declare-fun b!327467 () Bool)

(declare-fun res!180406 () Bool)

(assert (=> b!327467 (=> (not res!180406) (not e!201387))))

(assert (=> b!327467 (= res!180406 (and (= (size!8291 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8291 a!3305))))))

(declare-fun b!327468 () Bool)

(declare-fun res!180407 () Bool)

(assert (=> b!327468 (=> (not res!180407) (not e!201385))))

(assert (=> b!327468 (= res!180407 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157602))))

(declare-fun b!327469 () Bool)

(declare-fun res!180411 () Bool)

(assert (=> b!327469 (=> (not res!180411) (not e!201387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327469 (= res!180411 (validKeyInArray!0 k0!2497))))

(declare-fun b!327470 () Bool)

(declare-fun res!180405 () Bool)

(assert (=> b!327470 (=> (not res!180405) (not e!201387))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16773 (_ BitVec 32)) SeekEntryResult!3035)

(assert (=> b!327470 (= res!180405 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3035 i!1250)))))

(declare-fun b!327471 () Bool)

(declare-fun res!180408 () Bool)

(assert (=> b!327471 (=> (not res!180408) (not e!201387))))

(declare-fun arrayContainsKey!0 (array!16773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327471 (= res!180408 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32768 res!180403) b!327467))

(assert (= (and b!327467 res!180406) b!327469))

(assert (= (and b!327469 res!180411) b!327471))

(assert (= (and b!327471 res!180408) b!327470))

(assert (= (and b!327470 res!180405) b!327465))

(assert (= (and b!327465 res!180409) b!327464))

(assert (= (and b!327464 res!180410) b!327466))

(assert (= (and b!327466 res!180404) b!327468))

(assert (= (and b!327468 res!180407) b!327463))

(declare-fun m!334039 () Bool)

(assert (=> b!327469 m!334039))

(declare-fun m!334041 () Bool)

(assert (=> b!327464 m!334041))

(assert (=> b!327464 m!334041))

(declare-fun m!334043 () Bool)

(assert (=> b!327464 m!334043))

(declare-fun m!334045 () Bool)

(assert (=> b!327465 m!334045))

(declare-fun m!334047 () Bool)

(assert (=> b!327463 m!334047))

(declare-fun m!334049 () Bool)

(assert (=> b!327466 m!334049))

(declare-fun m!334051 () Bool)

(assert (=> start!32768 m!334051))

(declare-fun m!334053 () Bool)

(assert (=> start!32768 m!334053))

(declare-fun m!334055 () Bool)

(assert (=> b!327468 m!334055))

(declare-fun m!334057 () Bool)

(assert (=> b!327471 m!334057))

(declare-fun m!334059 () Bool)

(assert (=> b!327470 m!334059))

(check-sat (not b!327471) (not b!327469) (not b!327468) (not start!32768) (not b!327465) (not b!327470) (not b!327464))
(check-sat)
(get-model)

(declare-fun b!327557 () Bool)

(declare-fun e!201428 () SeekEntryResult!3035)

(assert (=> b!327557 (= e!201428 (Intermediate!3035 true index!1840 x!1490))))

(declare-fun b!327559 () Bool)

(declare-fun e!201427 () SeekEntryResult!3035)

(assert (=> b!327559 (= e!201427 (Intermediate!3035 false index!1840 x!1490))))

(declare-fun b!327560 () Bool)

(declare-fun e!201430 () Bool)

(declare-fun e!201429 () Bool)

(assert (=> b!327560 (= e!201430 e!201429)))

(declare-fun res!180480 () Bool)

(declare-fun lt!157623 () SeekEntryResult!3035)

(get-info :version)

(assert (=> b!327560 (= res!180480 (and ((_ is Intermediate!3035) lt!157623) (not (undefined!3847 lt!157623)) (bvslt (x!32668 lt!157623) #b01111111111111111111111111111110) (bvsge (x!32668 lt!157623) #b00000000000000000000000000000000) (bvsge (x!32668 lt!157623) x!1490)))))

(assert (=> b!327560 (=> (not res!180480) (not e!201429))))

(declare-fun b!327561 () Bool)

(assert (=> b!327561 (and (bvsge (index!14318 lt!157623) #b00000000000000000000000000000000) (bvslt (index!14318 lt!157623) (size!8291 a!3305)))))

(declare-fun res!180481 () Bool)

(assert (=> b!327561 (= res!180481 (= (select (arr!7939 a!3305) (index!14318 lt!157623)) k0!2497))))

(declare-fun e!201431 () Bool)

(assert (=> b!327561 (=> res!180481 e!201431)))

(assert (=> b!327561 (= e!201429 e!201431)))

(declare-fun b!327562 () Bool)

(assert (=> b!327562 (= e!201430 (bvsge (x!32668 lt!157623) #b01111111111111111111111111111110))))

(declare-fun d!69885 () Bool)

(assert (=> d!69885 e!201430))

(declare-fun c!51171 () Bool)

(assert (=> d!69885 (= c!51171 (and ((_ is Intermediate!3035) lt!157623) (undefined!3847 lt!157623)))))

(assert (=> d!69885 (= lt!157623 e!201428)))

(declare-fun c!51173 () Bool)

(assert (=> d!69885 (= c!51173 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157622 () (_ BitVec 64))

(assert (=> d!69885 (= lt!157622 (select (arr!7939 a!3305) index!1840))))

(assert (=> d!69885 (validMask!0 mask!3777)))

(assert (=> d!69885 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157623)))

(declare-fun b!327563 () Bool)

(assert (=> b!327563 (and (bvsge (index!14318 lt!157623) #b00000000000000000000000000000000) (bvslt (index!14318 lt!157623) (size!8291 a!3305)))))

(assert (=> b!327563 (= e!201431 (= (select (arr!7939 a!3305) (index!14318 lt!157623)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327564 () Bool)

(assert (=> b!327564 (and (bvsge (index!14318 lt!157623) #b00000000000000000000000000000000) (bvslt (index!14318 lt!157623) (size!8291 a!3305)))))

(declare-fun res!180482 () Bool)

(assert (=> b!327564 (= res!180482 (= (select (arr!7939 a!3305) (index!14318 lt!157623)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327564 (=> res!180482 e!201431)))

(declare-fun b!327565 () Bool)

(assert (=> b!327565 (= e!201428 e!201427)))

(declare-fun c!51172 () Bool)

(assert (=> b!327565 (= c!51172 (or (= lt!157622 k0!2497) (= (bvadd lt!157622 lt!157622) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327566 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327566 (= e!201427 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(assert (= (and d!69885 c!51173) b!327557))

(assert (= (and d!69885 (not c!51173)) b!327565))

(assert (= (and b!327565 c!51172) b!327559))

(assert (= (and b!327565 (not c!51172)) b!327566))

(assert (= (and d!69885 c!51171) b!327562))

(assert (= (and d!69885 (not c!51171)) b!327560))

(assert (= (and b!327560 res!180480) b!327561))

(assert (= (and b!327561 (not res!180481)) b!327564))

(assert (= (and b!327564 (not res!180482)) b!327563))

(declare-fun m!334117 () Bool)

(assert (=> b!327566 m!334117))

(assert (=> b!327566 m!334117))

(declare-fun m!334119 () Bool)

(assert (=> b!327566 m!334119))

(assert (=> d!69885 m!334047))

(assert (=> d!69885 m!334051))

(declare-fun m!334121 () Bool)

(assert (=> b!327561 m!334121))

(assert (=> b!327564 m!334121))

(assert (=> b!327563 m!334121))

(assert (=> b!327468 d!69885))

(declare-fun d!69895 () Bool)

(declare-fun res!180497 () Bool)

(declare-fun e!201449 () Bool)

(assert (=> d!69895 (=> res!180497 e!201449)))

(assert (=> d!69895 (= res!180497 (= (select (arr!7939 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69895 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201449)))

(declare-fun b!327587 () Bool)

(declare-fun e!201450 () Bool)

(assert (=> b!327587 (= e!201449 e!201450)))

(declare-fun res!180498 () Bool)

(assert (=> b!327587 (=> (not res!180498) (not e!201450))))

(assert (=> b!327587 (= res!180498 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8291 a!3305)))))

(declare-fun b!327588 () Bool)

(assert (=> b!327588 (= e!201450 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69895 (not res!180497)) b!327587))

(assert (= (and b!327587 res!180498) b!327588))

(declare-fun m!334127 () Bool)

(assert (=> d!69895 m!334127))

(declare-fun m!334133 () Bool)

(assert (=> b!327588 m!334133))

(assert (=> b!327471 d!69895))

(declare-fun b!327619 () Bool)

(declare-fun c!51189 () Bool)

(declare-fun lt!157645 () (_ BitVec 64))

(assert (=> b!327619 (= c!51189 (= lt!157645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201469 () SeekEntryResult!3035)

(declare-fun e!201470 () SeekEntryResult!3035)

(assert (=> b!327619 (= e!201469 e!201470)))

(declare-fun b!327620 () Bool)

(declare-fun lt!157646 () SeekEntryResult!3035)

(assert (=> b!327620 (= e!201469 (Found!3035 (index!14318 lt!157646)))))

(declare-fun b!327621 () Bool)

(declare-fun e!201471 () SeekEntryResult!3035)

(assert (=> b!327621 (= e!201471 e!201469)))

(assert (=> b!327621 (= lt!157645 (select (arr!7939 a!3305) (index!14318 lt!157646)))))

(declare-fun c!51191 () Bool)

(assert (=> b!327621 (= c!51191 (= lt!157645 k0!2497))))

(declare-fun b!327622 () Bool)

(assert (=> b!327622 (= e!201471 Undefined!3035)))

(declare-fun d!69899 () Bool)

(declare-fun lt!157647 () SeekEntryResult!3035)

(assert (=> d!69899 (and (or ((_ is Undefined!3035) lt!157647) (not ((_ is Found!3035) lt!157647)) (and (bvsge (index!14317 lt!157647) #b00000000000000000000000000000000) (bvslt (index!14317 lt!157647) (size!8291 a!3305)))) (or ((_ is Undefined!3035) lt!157647) ((_ is Found!3035) lt!157647) (not ((_ is MissingZero!3035) lt!157647)) (and (bvsge (index!14316 lt!157647) #b00000000000000000000000000000000) (bvslt (index!14316 lt!157647) (size!8291 a!3305)))) (or ((_ is Undefined!3035) lt!157647) ((_ is Found!3035) lt!157647) ((_ is MissingZero!3035) lt!157647) (not ((_ is MissingVacant!3035) lt!157647)) (and (bvsge (index!14319 lt!157647) #b00000000000000000000000000000000) (bvslt (index!14319 lt!157647) (size!8291 a!3305)))) (or ((_ is Undefined!3035) lt!157647) (ite ((_ is Found!3035) lt!157647) (= (select (arr!7939 a!3305) (index!14317 lt!157647)) k0!2497) (ite ((_ is MissingZero!3035) lt!157647) (= (select (arr!7939 a!3305) (index!14316 lt!157647)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3035) lt!157647) (= (select (arr!7939 a!3305) (index!14319 lt!157647)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69899 (= lt!157647 e!201471)))

(declare-fun c!51190 () Bool)

(assert (=> d!69899 (= c!51190 (and ((_ is Intermediate!3035) lt!157646) (undefined!3847 lt!157646)))))

(assert (=> d!69899 (= lt!157646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69899 (validMask!0 mask!3777)))

(assert (=> d!69899 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157647)))

(declare-fun b!327623 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16773 (_ BitVec 32)) SeekEntryResult!3035)

(assert (=> b!327623 (= e!201470 (seekKeyOrZeroReturnVacant!0 (x!32668 lt!157646) (index!14318 lt!157646) (index!14318 lt!157646) k0!2497 a!3305 mask!3777))))

(declare-fun b!327624 () Bool)

(assert (=> b!327624 (= e!201470 (MissingZero!3035 (index!14318 lt!157646)))))

(assert (= (and d!69899 c!51190) b!327622))

(assert (= (and d!69899 (not c!51190)) b!327621))

(assert (= (and b!327621 c!51191) b!327620))

(assert (= (and b!327621 (not c!51191)) b!327619))

(assert (= (and b!327619 c!51189) b!327624))

(assert (= (and b!327619 (not c!51189)) b!327623))

(declare-fun m!334143 () Bool)

(assert (=> b!327621 m!334143))

(declare-fun m!334145 () Bool)

(assert (=> d!69899 m!334145))

(assert (=> d!69899 m!334051))

(assert (=> d!69899 m!334041))

(assert (=> d!69899 m!334043))

(declare-fun m!334147 () Bool)

(assert (=> d!69899 m!334147))

(assert (=> d!69899 m!334041))

(declare-fun m!334149 () Bool)

(assert (=> d!69899 m!334149))

(declare-fun m!334151 () Bool)

(assert (=> b!327623 m!334151))

(assert (=> b!327470 d!69899))

(declare-fun d!69909 () Bool)

(declare-fun res!180509 () Bool)

(declare-fun e!201490 () Bool)

(assert (=> d!69909 (=> res!180509 e!201490)))

(assert (=> d!69909 (= res!180509 (bvsge #b00000000000000000000000000000000 (size!8291 a!3305)))))

(assert (=> d!69909 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201490)))

(declare-fun b!327657 () Bool)

(declare-fun e!201492 () Bool)

(declare-fun e!201491 () Bool)

(assert (=> b!327657 (= e!201492 e!201491)))

(declare-fun lt!157667 () (_ BitVec 64))

(assert (=> b!327657 (= lt!157667 (select (arr!7939 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10142 0))(
  ( (Unit!10143) )
))
(declare-fun lt!157666 () Unit!10142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16773 (_ BitVec 64) (_ BitVec 32)) Unit!10142)

(assert (=> b!327657 (= lt!157666 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157667 #b00000000000000000000000000000000))))

(assert (=> b!327657 (arrayContainsKey!0 a!3305 lt!157667 #b00000000000000000000000000000000)))

(declare-fun lt!157668 () Unit!10142)

(assert (=> b!327657 (= lt!157668 lt!157666)))

(declare-fun res!180510 () Bool)

(assert (=> b!327657 (= res!180510 (= (seekEntryOrOpen!0 (select (arr!7939 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3035 #b00000000000000000000000000000000)))))

(assert (=> b!327657 (=> (not res!180510) (not e!201491))))

(declare-fun b!327658 () Bool)

(assert (=> b!327658 (= e!201490 e!201492)))

(declare-fun c!51206 () Bool)

(assert (=> b!327658 (= c!51206 (validKeyInArray!0 (select (arr!7939 a!3305) #b00000000000000000000000000000000)))))

(declare-fun bm!26090 () Bool)

(declare-fun call!26093 () Bool)

(assert (=> bm!26090 (= call!26093 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!327659 () Bool)

(assert (=> b!327659 (= e!201492 call!26093)))

(declare-fun b!327660 () Bool)

(assert (=> b!327660 (= e!201491 call!26093)))

(assert (= (and d!69909 (not res!180509)) b!327658))

(assert (= (and b!327658 c!51206) b!327657))

(assert (= (and b!327658 (not c!51206)) b!327659))

(assert (= (and b!327657 res!180510) b!327660))

(assert (= (or b!327660 b!327659) bm!26090))

(assert (=> b!327657 m!334127))

(declare-fun m!334173 () Bool)

(assert (=> b!327657 m!334173))

(declare-fun m!334175 () Bool)

(assert (=> b!327657 m!334175))

(assert (=> b!327657 m!334127))

(declare-fun m!334177 () Bool)

(assert (=> b!327657 m!334177))

(assert (=> b!327658 m!334127))

(assert (=> b!327658 m!334127))

(declare-fun m!334179 () Bool)

(assert (=> b!327658 m!334179))

(declare-fun m!334181 () Bool)

(assert (=> bm!26090 m!334181))

(assert (=> b!327465 d!69909))

(declare-fun b!327661 () Bool)

(declare-fun e!201494 () SeekEntryResult!3035)

(assert (=> b!327661 (= e!201494 (Intermediate!3035 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327662 () Bool)

(declare-fun e!201493 () SeekEntryResult!3035)

(assert (=> b!327662 (= e!201493 (Intermediate!3035 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327663 () Bool)

(declare-fun e!201496 () Bool)

(declare-fun e!201495 () Bool)

(assert (=> b!327663 (= e!201496 e!201495)))

(declare-fun res!180511 () Bool)

(declare-fun lt!157670 () SeekEntryResult!3035)

(assert (=> b!327663 (= res!180511 (and ((_ is Intermediate!3035) lt!157670) (not (undefined!3847 lt!157670)) (bvslt (x!32668 lt!157670) #b01111111111111111111111111111110) (bvsge (x!32668 lt!157670) #b00000000000000000000000000000000) (bvsge (x!32668 lt!157670) #b00000000000000000000000000000000)))))

(assert (=> b!327663 (=> (not res!180511) (not e!201495))))

(declare-fun b!327664 () Bool)

(assert (=> b!327664 (and (bvsge (index!14318 lt!157670) #b00000000000000000000000000000000) (bvslt (index!14318 lt!157670) (size!8291 a!3305)))))

(declare-fun res!180512 () Bool)

(assert (=> b!327664 (= res!180512 (= (select (arr!7939 a!3305) (index!14318 lt!157670)) k0!2497))))

(declare-fun e!201497 () Bool)

(assert (=> b!327664 (=> res!180512 e!201497)))

(assert (=> b!327664 (= e!201495 e!201497)))

(declare-fun b!327665 () Bool)

(assert (=> b!327665 (= e!201496 (bvsge (x!32668 lt!157670) #b01111111111111111111111111111110))))

(declare-fun d!69915 () Bool)

(assert (=> d!69915 e!201496))

(declare-fun c!51207 () Bool)

(assert (=> d!69915 (= c!51207 (and ((_ is Intermediate!3035) lt!157670) (undefined!3847 lt!157670)))))

(assert (=> d!69915 (= lt!157670 e!201494)))

(declare-fun c!51209 () Bool)

(assert (=> d!69915 (= c!51209 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157669 () (_ BitVec 64))

(assert (=> d!69915 (= lt!157669 (select (arr!7939 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69915 (validMask!0 mask!3777)))

(assert (=> d!69915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157670)))

(declare-fun b!327666 () Bool)

(assert (=> b!327666 (and (bvsge (index!14318 lt!157670) #b00000000000000000000000000000000) (bvslt (index!14318 lt!157670) (size!8291 a!3305)))))

(assert (=> b!327666 (= e!201497 (= (select (arr!7939 a!3305) (index!14318 lt!157670)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327667 () Bool)

(assert (=> b!327667 (and (bvsge (index!14318 lt!157670) #b00000000000000000000000000000000) (bvslt (index!14318 lt!157670) (size!8291 a!3305)))))

(declare-fun res!180513 () Bool)

(assert (=> b!327667 (= res!180513 (= (select (arr!7939 a!3305) (index!14318 lt!157670)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327667 (=> res!180513 e!201497)))

(declare-fun b!327668 () Bool)

(assert (=> b!327668 (= e!201494 e!201493)))

(declare-fun c!51208 () Bool)

(assert (=> b!327668 (= c!51208 (or (= lt!157669 k0!2497) (= (bvadd lt!157669 lt!157669) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327669 () Bool)

(assert (=> b!327669 (= e!201493 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(assert (= (and d!69915 c!51209) b!327661))

(assert (= (and d!69915 (not c!51209)) b!327668))

(assert (= (and b!327668 c!51208) b!327662))

(assert (= (and b!327668 (not c!51208)) b!327669))

(assert (= (and d!69915 c!51207) b!327665))

(assert (= (and d!69915 (not c!51207)) b!327663))

(assert (= (and b!327663 res!180511) b!327664))

(assert (= (and b!327664 (not res!180512)) b!327667))

(assert (= (and b!327667 (not res!180513)) b!327666))

(assert (=> b!327669 m!334041))

(declare-fun m!334183 () Bool)

(assert (=> b!327669 m!334183))

(assert (=> b!327669 m!334183))

(declare-fun m!334185 () Bool)

(assert (=> b!327669 m!334185))

(assert (=> d!69915 m!334041))

(declare-fun m!334187 () Bool)

(assert (=> d!69915 m!334187))

(assert (=> d!69915 m!334051))

(declare-fun m!334189 () Bool)

(assert (=> b!327664 m!334189))

(assert (=> b!327667 m!334189))

(assert (=> b!327666 m!334189))

(assert (=> b!327464 d!69915))

(declare-fun d!69917 () Bool)

(declare-fun lt!157676 () (_ BitVec 32))

(declare-fun lt!157675 () (_ BitVec 32))

(assert (=> d!69917 (= lt!157676 (bvmul (bvxor lt!157675 (bvlshr lt!157675 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69917 (= lt!157675 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69917 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180514 (let ((h!5312 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32672 (bvmul (bvxor h!5312 (bvlshr h!5312 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32672 (bvlshr x!32672 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180514 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180514 #b00000000000000000000000000000000))))))

(assert (=> d!69917 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157676 (bvlshr lt!157676 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327464 d!69917))

(declare-fun d!69919 () Bool)

(assert (=> d!69919 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32768 d!69919))

(declare-fun d!69923 () Bool)

(assert (=> d!69923 (= (array_inv!5889 a!3305) (bvsge (size!8291 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32768 d!69923))

(declare-fun d!69925 () Bool)

(assert (=> d!69925 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327469 d!69925))

(check-sat (not b!327623) (not d!69885) (not b!327657) (not b!327588) (not b!327566) (not b!327658) (not b!327669) (not bm!26090) (not d!69915) (not d!69899))
(check-sat)
