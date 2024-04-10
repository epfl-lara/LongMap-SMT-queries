; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27652 () Bool)

(assert start!27652)

(declare-fun b!285467 () Bool)

(declare-fun res!147874 () Bool)

(declare-fun e!180930 () Bool)

(assert (=> b!285467 (=> (not res!147874) (not e!180930))))

(declare-datatypes ((array!14257 0))(
  ( (array!14258 (arr!6766 (Array (_ BitVec 32) (_ BitVec 64))) (size!7118 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14257)

(declare-datatypes ((List!4574 0))(
  ( (Nil!4571) (Cons!4570 (h!5243 (_ BitVec 64)) (t!9656 List!4574)) )
))
(declare-fun arrayNoDuplicates!0 (array!14257 (_ BitVec 32) List!4574) Bool)

(assert (=> b!285467 (= res!147874 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4571))))

(declare-fun b!285468 () Bool)

(declare-fun e!180932 () Bool)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14257 (_ BitVec 32)) Bool)

(assert (=> b!285468 (= e!180932 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)) mask!3868)))))

(declare-fun b!285469 () Bool)

(declare-fun res!147880 () Bool)

(assert (=> b!285469 (=> (not res!147880) (not e!180932))))

(assert (=> b!285469 (= res!147880 (not (= startIndex!26 i!1267)))))

(declare-fun b!285470 () Bool)

(declare-fun res!147878 () Bool)

(assert (=> b!285470 (=> (not res!147878) (not e!180930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285470 (= res!147878 (validKeyInArray!0 k!2581))))

(declare-fun b!285471 () Bool)

(declare-fun res!147882 () Bool)

(assert (=> b!285471 (=> (not res!147882) (not e!180932))))

(assert (=> b!285471 (= res!147882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!285472 () Bool)

(declare-fun res!147879 () Bool)

(assert (=> b!285472 (=> (not res!147879) (not e!180932))))

(assert (=> b!285472 (= res!147879 (not (validKeyInArray!0 (select (arr!6766 a!3325) startIndex!26))))))

(declare-fun b!285473 () Bool)

(declare-fun res!147875 () Bool)

(assert (=> b!285473 (=> (not res!147875) (not e!180932))))

(assert (=> b!285473 (= res!147875 (bvsge startIndex!26 (bvsub (size!7118 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!285474 () Bool)

(declare-fun res!147881 () Bool)

(assert (=> b!285474 (=> (not res!147881) (not e!180930))))

(assert (=> b!285474 (= res!147881 (and (= (size!7118 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7118 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7118 a!3325))))))

(declare-fun res!147877 () Bool)

(assert (=> start!27652 (=> (not res!147877) (not e!180930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27652 (= res!147877 (validMask!0 mask!3868))))

(assert (=> start!27652 e!180930))

(declare-fun array_inv!4729 (array!14257) Bool)

(assert (=> start!27652 (array_inv!4729 a!3325)))

(assert (=> start!27652 true))

(declare-fun b!285475 () Bool)

(declare-fun res!147873 () Bool)

(assert (=> b!285475 (=> (not res!147873) (not e!180930))))

(declare-fun arrayContainsKey!0 (array!14257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285475 (= res!147873 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285476 () Bool)

(assert (=> b!285476 (= e!180930 e!180932)))

(declare-fun res!147876 () Bool)

(assert (=> b!285476 (=> (not res!147876) (not e!180932))))

(declare-datatypes ((SeekEntryResult!1924 0))(
  ( (MissingZero!1924 (index!9866 (_ BitVec 32))) (Found!1924 (index!9867 (_ BitVec 32))) (Intermediate!1924 (undefined!2736 Bool) (index!9868 (_ BitVec 32)) (x!28059 (_ BitVec 32))) (Undefined!1924) (MissingVacant!1924 (index!9869 (_ BitVec 32))) )
))
(declare-fun lt!140812 () SeekEntryResult!1924)

(assert (=> b!285476 (= res!147876 (or (= lt!140812 (MissingZero!1924 i!1267)) (= lt!140812 (MissingVacant!1924 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14257 (_ BitVec 32)) SeekEntryResult!1924)

(assert (=> b!285476 (= lt!140812 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27652 res!147877) b!285474))

(assert (= (and b!285474 res!147881) b!285470))

(assert (= (and b!285470 res!147878) b!285467))

(assert (= (and b!285467 res!147874) b!285475))

(assert (= (and b!285475 res!147873) b!285476))

(assert (= (and b!285476 res!147876) b!285471))

(assert (= (and b!285471 res!147882) b!285469))

(assert (= (and b!285469 res!147880) b!285472))

(assert (= (and b!285472 res!147879) b!285473))

(assert (= (and b!285473 res!147875) b!285468))

(declare-fun m!300281 () Bool)

(assert (=> b!285476 m!300281))

(declare-fun m!300283 () Bool)

(assert (=> b!285468 m!300283))

(declare-fun m!300285 () Bool)

(assert (=> b!285468 m!300285))

(declare-fun m!300287 () Bool)

(assert (=> b!285475 m!300287))

(declare-fun m!300289 () Bool)

(assert (=> b!285467 m!300289))

(declare-fun m!300291 () Bool)

(assert (=> b!285471 m!300291))

(declare-fun m!300293 () Bool)

(assert (=> b!285472 m!300293))

(assert (=> b!285472 m!300293))

(declare-fun m!300295 () Bool)

(assert (=> b!285472 m!300295))

(declare-fun m!300297 () Bool)

(assert (=> start!27652 m!300297))

(declare-fun m!300299 () Bool)

(assert (=> start!27652 m!300299))

(declare-fun m!300301 () Bool)

(assert (=> b!285470 m!300301))

(push 1)

(assert (not b!285468))

(assert (not b!285467))

(assert (not b!285476))

(assert (not b!285472))

(assert (not b!285471))

(assert (not start!27652))

(assert (not b!285475))

(assert (not b!285470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!285544 () Bool)

(declare-fun e!180978 () SeekEntryResult!1924)

(declare-fun lt!140847 () SeekEntryResult!1924)

(assert (=> b!285544 (= e!180978 (Found!1924 (index!9868 lt!140847)))))

(declare-fun b!285545 () Bool)

(declare-fun e!180980 () SeekEntryResult!1924)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14257 (_ BitVec 32)) SeekEntryResult!1924)

(assert (=> b!285545 (= e!180980 (seekKeyOrZeroReturnVacant!0 (x!28059 lt!140847) (index!9868 lt!140847) (index!9868 lt!140847) k!2581 a!3325 mask!3868))))

(declare-fun d!65767 () Bool)

(declare-fun lt!140848 () SeekEntryResult!1924)

(assert (=> d!65767 (and (or (is-Undefined!1924 lt!140848) (not (is-Found!1924 lt!140848)) (and (bvsge (index!9867 lt!140848) #b00000000000000000000000000000000) (bvslt (index!9867 lt!140848) (size!7118 a!3325)))) (or (is-Undefined!1924 lt!140848) (is-Found!1924 lt!140848) (not (is-MissingZero!1924 lt!140848)) (and (bvsge (index!9866 lt!140848) #b00000000000000000000000000000000) (bvslt (index!9866 lt!140848) (size!7118 a!3325)))) (or (is-Undefined!1924 lt!140848) (is-Found!1924 lt!140848) (is-MissingZero!1924 lt!140848) (not (is-MissingVacant!1924 lt!140848)) (and (bvsge (index!9869 lt!140848) #b00000000000000000000000000000000) (bvslt (index!9869 lt!140848) (size!7118 a!3325)))) (or (is-Undefined!1924 lt!140848) (ite (is-Found!1924 lt!140848) (= (select (arr!6766 a!3325) (index!9867 lt!140848)) k!2581) (ite (is-MissingZero!1924 lt!140848) (= (select (arr!6766 a!3325) (index!9866 lt!140848)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1924 lt!140848) (= (select (arr!6766 a!3325) (index!9869 lt!140848)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!180979 () SeekEntryResult!1924)

(assert (=> d!65767 (= lt!140848 e!180979)))

(declare-fun c!46374 () Bool)

(assert (=> d!65767 (= c!46374 (and (is-Intermediate!1924 lt!140847) (undefined!2736 lt!140847)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14257 (_ BitVec 32)) SeekEntryResult!1924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65767 (= lt!140847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!65767 (validMask!0 mask!3868)))

(assert (=> d!65767 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!140848)))

(declare-fun b!285546 () Bool)

(assert (=> b!285546 (= e!180979 Undefined!1924)))

(declare-fun b!285547 () Bool)

(assert (=> b!285547 (= e!180979 e!180978)))

(declare-fun lt!140846 () (_ BitVec 64))

(assert (=> b!285547 (= lt!140846 (select (arr!6766 a!3325) (index!9868 lt!140847)))))

(declare-fun c!46375 () Bool)

(assert (=> b!285547 (= c!46375 (= lt!140846 k!2581))))

(declare-fun b!285548 () Bool)

(assert (=> b!285548 (= e!180980 (MissingZero!1924 (index!9868 lt!140847)))))

(declare-fun b!285549 () Bool)

(declare-fun c!46373 () Bool)

(assert (=> b!285549 (= c!46373 (= lt!140846 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!285549 (= e!180978 e!180980)))

(assert (= (and d!65767 c!46374) b!285546))

(assert (= (and d!65767 (not c!46374)) b!285547))

(assert (= (and b!285547 c!46375) b!285544))

(assert (= (and b!285547 (not c!46375)) b!285549))

(assert (= (and b!285549 c!46373) b!285548))

(assert (= (and b!285549 (not c!46373)) b!285545))

(declare-fun m!300343 () Bool)

(assert (=> b!285545 m!300343))

(declare-fun m!300345 () Bool)

(assert (=> d!65767 m!300345))

(declare-fun m!300347 () Bool)

(assert (=> d!65767 m!300347))

(declare-fun m!300349 () Bool)

(assert (=> d!65767 m!300349))

(assert (=> d!65767 m!300349))

(declare-fun m!300351 () Bool)

(assert (=> d!65767 m!300351))

(declare-fun m!300353 () Bool)

(assert (=> d!65767 m!300353))

(assert (=> d!65767 m!300297))

(declare-fun m!300355 () Bool)

(assert (=> b!285547 m!300355))

(assert (=> b!285476 d!65767))

(declare-fun b!285582 () Bool)

(declare-fun e!181002 () Bool)

(declare-fun call!25571 () Bool)

(assert (=> b!285582 (= e!181002 call!25571)))

(declare-fun bm!25568 () Bool)

(assert (=> bm!25568 (= call!25571 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65781 () Bool)

(declare-fun res!147916 () Bool)

(declare-fun e!181003 () Bool)

(assert (=> d!65781 (=> res!147916 e!181003)))

(assert (=> d!65781 (= res!147916 (bvsge #b00000000000000000000000000000000 (size!7118 a!3325)))))

(assert (=> d!65781 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!181003)))

(declare-fun b!285583 () Bool)

(declare-fun e!181004 () Bool)

(assert (=> b!285583 (= e!181004 call!25571)))

(declare-fun b!285584 () Bool)

(assert (=> b!285584 (= e!181004 e!181002)))

(declare-fun lt!140865 () (_ BitVec 64))

(assert (=> b!285584 (= lt!140865 (select (arr!6766 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9048 0))(
  ( (Unit!9049) )
))
(declare-fun lt!140864 () Unit!9048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14257 (_ BitVec 64) (_ BitVec 32)) Unit!9048)

(assert (=> b!285584 (= lt!140864 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140865 #b00000000000000000000000000000000))))

(assert (=> b!285584 (arrayContainsKey!0 a!3325 lt!140865 #b00000000000000000000000000000000)))

(declare-fun lt!140866 () Unit!9048)

(assert (=> b!285584 (= lt!140866 lt!140864)))

(declare-fun res!147917 () Bool)

(assert (=> b!285584 (= res!147917 (= (seekEntryOrOpen!0 (select (arr!6766 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1924 #b00000000000000000000000000000000)))))

(assert (=> b!285584 (=> (not res!147917) (not e!181002))))

(declare-fun b!285585 () Bool)

(assert (=> b!285585 (= e!181003 e!181004)))

(declare-fun c!46387 () Bool)

(assert (=> b!285585 (= c!46387 (validKeyInArray!0 (select (arr!6766 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65781 (not res!147916)) b!285585))

(assert (= (and b!285585 c!46387) b!285584))

(assert (= (and b!285585 (not c!46387)) b!285583))

(assert (= (and b!285584 res!147917) b!285582))

(assert (= (or b!285582 b!285583) bm!25568))

(declare-fun m!300373 () Bool)

(assert (=> bm!25568 m!300373))

(declare-fun m!300375 () Bool)

(assert (=> b!285584 m!300375))

(declare-fun m!300377 () Bool)

(assert (=> b!285584 m!300377))

(declare-fun m!300379 () Bool)

(assert (=> b!285584 m!300379))

(assert (=> b!285584 m!300375))

(declare-fun m!300381 () Bool)

(assert (=> b!285584 m!300381))

(assert (=> b!285585 m!300375))

(assert (=> b!285585 m!300375))

(declare-fun m!300383 () Bool)

(assert (=> b!285585 m!300383))

(assert (=> b!285471 d!65781))

(declare-fun d!65787 () Bool)

(declare-fun res!147922 () Bool)

(declare-fun e!181012 () Bool)

(assert (=> d!65787 (=> res!147922 e!181012)))

(assert (=> d!65787 (= res!147922 (= (select (arr!6766 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!65787 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!181012)))

(declare-fun b!285596 () Bool)

(declare-fun e!181013 () Bool)

(assert (=> b!285596 (= e!181012 e!181013)))

(declare-fun res!147923 () Bool)

(assert (=> b!285596 (=> (not res!147923) (not e!181013))))

(assert (=> b!285596 (= res!147923 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7118 a!3325)))))

(declare-fun b!285597 () Bool)

(assert (=> b!285597 (= e!181013 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65787 (not res!147922)) b!285596))

(assert (= (and b!285596 res!147923) b!285597))

(assert (=> d!65787 m!300375))

(declare-fun m!300399 () Bool)

(assert (=> b!285597 m!300399))

(assert (=> b!285475 d!65787))

(declare-fun d!65793 () Bool)

(assert (=> d!65793 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285470 d!65793))

(declare-fun b!285602 () Bool)

(declare-fun e!181017 () Bool)

(declare-fun call!25573 () Bool)

(assert (=> b!285602 (= e!181017 call!25573)))

(declare-fun bm!25570 () Bool)

(assert (=> bm!25570 (= call!25573 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)) mask!3868))))

(declare-fun d!65795 () Bool)

(declare-fun res!147926 () Bool)

(declare-fun e!181018 () Bool)

(assert (=> d!65795 (=> res!147926 e!181018)))

(assert (=> d!65795 (= res!147926 (bvsge startIndex!26 (size!7118 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)))))))

(assert (=> d!65795 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)) mask!3868) e!181018)))

(declare-fun b!285603 () Bool)

(declare-fun e!181019 () Bool)

(assert (=> b!285603 (= e!181019 call!25573)))

(declare-fun b!285604 () Bool)

(assert (=> b!285604 (= e!181019 e!181017)))

(declare-fun lt!140874 () (_ BitVec 64))

(assert (=> b!285604 (= lt!140874 (select (arr!6766 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325))) startIndex!26))))

(declare-fun lt!140873 () Unit!9048)

(assert (=> b!285604 (= lt!140873 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)) lt!140874 startIndex!26))))

(assert (=> b!285604 (arrayContainsKey!0 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)) lt!140874 #b00000000000000000000000000000000)))

(declare-fun lt!140875 () Unit!9048)

(assert (=> b!285604 (= lt!140875 lt!140873)))

(declare-fun res!147927 () Bool)

(assert (=> b!285604 (= res!147927 (= (seekEntryOrOpen!0 (select (arr!6766 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325))) startIndex!26) (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)) mask!3868) (Found!1924 startIndex!26)))))

(assert (=> b!285604 (=> (not res!147927) (not e!181017))))

(declare-fun b!285605 () Bool)

(assert (=> b!285605 (= e!181018 e!181019)))

(declare-fun c!46392 () Bool)

(assert (=> b!285605 (= c!46392 (validKeyInArray!0 (select (arr!6766 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325))) startIndex!26)))))

(assert (= (and d!65795 (not res!147926)) b!285605))

(assert (= (and b!285605 c!46392) b!285604))

(assert (= (and b!285605 (not c!46392)) b!285603))

(assert (= (and b!285604 res!147927) b!285602))

(assert (= (or b!285602 b!285603) bm!25570))

(declare-fun m!300413 () Bool)

(assert (=> bm!25570 m!300413))

(declare-fun m!300415 () Bool)

(assert (=> b!285604 m!300415))

(declare-fun m!300417 () Bool)

(assert (=> b!285604 m!300417))

(declare-fun m!300419 () Bool)

(assert (=> b!285604 m!300419))

(assert (=> b!285604 m!300415))

(declare-fun m!300421 () Bool)

(assert (=> b!285604 m!300421))

(assert (=> b!285605 m!300415))

(assert (=> b!285605 m!300415))

(declare-fun m!300423 () Bool)

(assert (=> b!285605 m!300423))

(assert (=> b!285468 d!65795))

(declare-fun d!65799 () Bool)

(assert (=> d!65799 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27652 d!65799))

(declare-fun d!65805 () Bool)

(assert (=> d!65805 (= (array_inv!4729 a!3325) (bvsge (size!7118 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27652 d!65805))

(declare-fun d!65807 () Bool)

(assert (=> d!65807 (= (validKeyInArray!0 (select (arr!6766 a!3325) startIndex!26)) (and (not (= (select (arr!6766 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6766 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285472 d!65807))

(declare-fun b!285632 () Bool)

(declare-fun e!181040 () Bool)

(declare-fun e!181042 () Bool)

(assert (=> b!285632 (= e!181040 e!181042)))

(declare-fun res!147945 () Bool)

(assert (=> b!285632 (=> (not res!147945) (not e!181042))))

(declare-fun e!181043 () Bool)

(assert (=> b!285632 (= res!147945 (not e!181043))))

(declare-fun res!147944 () Bool)

(assert (=> b!285632 (=> (not res!147944) (not e!181043))))

(assert (=> b!285632 (= res!147944 (validKeyInArray!0 (select (arr!6766 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285633 () Bool)

(declare-fun contains!1999 (List!4574 (_ BitVec 64)) Bool)

(assert (=> b!285633 (= e!181043 (contains!1999 Nil!4571 (select (arr!6766 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285634 () Bool)

(declare-fun e!181041 () Bool)

(assert (=> b!285634 (= e!181042 e!181041)))

(declare-fun c!46398 () Bool)

(assert (=> b!285634 (= c!46398 (validKeyInArray!0 (select (arr!6766 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25576 () Bool)

(declare-fun call!25579 () Bool)

(assert (=> bm!25576 (= call!25579 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46398 (Cons!4570 (select (arr!6766 a!3325) #b00000000000000000000000000000000) Nil!4571) Nil!4571)))))

(declare-fun b!285635 () Bool)

(assert (=> b!285635 (= e!181041 call!25579)))

(declare-fun b!285631 () Bool)

(assert (=> b!285631 (= e!181041 call!25579)))

(declare-fun d!65809 () Bool)

(declare-fun res!147943 () Bool)

(assert (=> d!65809 (=> res!147943 e!181040)))

(assert (=> d!65809 (= res!147943 (bvsge #b00000000000000000000000000000000 (size!7118 a!3325)))))

(assert (=> d!65809 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4571) e!181040)))

(assert (= (and d!65809 (not res!147943)) b!285632))

(assert (= (and b!285632 res!147944) b!285633))

(assert (= (and b!285632 res!147945) b!285634))

(assert (= (and b!285634 c!46398) b!285631))

(assert (= (and b!285634 (not c!46398)) b!285635))

(assert (= (or b!285631 b!285635) bm!25576))

(assert (=> b!285632 m!300375))

(assert (=> b!285632 m!300375))

(assert (=> b!285632 m!300383))

(assert (=> b!285633 m!300375))

(assert (=> b!285633 m!300375))

(declare-fun m!300429 () Bool)

(assert (=> b!285633 m!300429))

(assert (=> b!285634 m!300375))

(assert (=> b!285634 m!300375))

(assert (=> b!285634 m!300383))

(assert (=> bm!25576 m!300375))

(declare-fun m!300431 () Bool)

(assert (=> bm!25576 m!300431))

(assert (=> b!285467 d!65809))

(push 1)

(assert (not bm!25576))

(assert (not d!65767))

(assert (not b!285584))

(assert (not b!285597))

(assert (not bm!25568))

(assert (not b!285604))

(assert (not b!285605))

(assert (not b!285633))

(assert (not b!285632))

(assert (not b!285585))

(assert (not b!285634))

(assert (not b!285545))

(assert (not bm!25570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!285755 () Bool)

(declare-fun e!181122 () Bool)

(declare-fun call!25585 () Bool)

(assert (=> b!285755 (= e!181122 call!25585)))

(declare-fun bm!25582 () Bool)

(assert (=> bm!25582 (= call!25585 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)) mask!3868))))

(declare-fun d!65863 () Bool)

(declare-fun res!147990 () Bool)

(declare-fun e!181123 () Bool)

(assert (=> d!65863 (=> res!147990 e!181123)))

(assert (=> d!65863 (= res!147990 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7118 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)))))))

(assert (=> d!65863 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)) mask!3868) e!181123)))

(declare-fun b!285756 () Bool)

(declare-fun e!181124 () Bool)

(assert (=> b!285756 (= e!181124 call!25585)))

(declare-fun b!285757 () Bool)

(assert (=> b!285757 (= e!181124 e!181122)))

(declare-fun lt!140927 () (_ BitVec 64))

(assert (=> b!285757 (= lt!140927 (select (arr!6766 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325))) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!140926 () Unit!9048)

(assert (=> b!285757 (= lt!140926 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)) lt!140927 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!285757 (arrayContainsKey!0 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)) lt!140927 #b00000000000000000000000000000000)))

(declare-fun lt!140928 () Unit!9048)

(assert (=> b!285757 (= lt!140928 lt!140926)))

(declare-fun res!147991 () Bool)

(assert (=> b!285757 (= res!147991 (= (seekEntryOrOpen!0 (select (arr!6766 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325))) (bvadd startIndex!26 #b00000000000000000000000000000001)) (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325)) mask!3868) (Found!1924 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!285757 (=> (not res!147991) (not e!181122))))

(declare-fun b!285758 () Bool)

(assert (=> b!285758 (= e!181123 e!181124)))

(declare-fun c!46437 () Bool)

(assert (=> b!285758 (= c!46437 (validKeyInArray!0 (select (arr!6766 (array!14258 (store (arr!6766 a!3325) i!1267 k!2581) (size!7118 a!3325))) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (= (and d!65863 (not res!147990)) b!285758))

(assert (= (and b!285758 c!46437) b!285757))

(assert (= (and b!285758 (not c!46437)) b!285756))

(assert (= (and b!285757 res!147991) b!285755))

(assert (= (or b!285755 b!285756) bm!25582))

(declare-fun m!300563 () Bool)

(assert (=> bm!25582 m!300563))

(declare-fun m!300565 () Bool)

(assert (=> b!285757 m!300565))

(declare-fun m!300567 () Bool)

(assert (=> b!285757 m!300567))

(declare-fun m!300569 () Bool)

(assert (=> b!285757 m!300569))

(assert (=> b!285757 m!300565))

(declare-fun m!300571 () Bool)

(assert (=> b!285757 m!300571))

(assert (=> b!285758 m!300565))

(assert (=> b!285758 m!300565))

(declare-fun m!300573 () Bool)

(assert (=> b!285758 m!300573))

(assert (=> bm!25570 d!65863))

(declare-fun b!285766 () Bool)

(declare-fun e!181128 () Bool)

(declare-fun e!181130 () Bool)

(assert (=> b!285766 (= e!181128 e!181130)))

(declare-fun res!147994 () Bool)

(assert (=> b!285766 (=> (not res!147994) (not e!181130))))

(declare-fun e!181131 () Bool)

(assert (=> b!285766 (= res!147994 (not e!181131))))

(declare-fun res!147993 () Bool)

(assert (=> b!285766 (=> (not res!147993) (not e!181131))))

(assert (=> b!285766 (= res!147993 (validKeyInArray!0 (select (arr!6766 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!285767 () Bool)

(assert (=> b!285767 (= e!181131 (contains!1999 (ite c!46398 (Cons!4570 (select (arr!6766 a!3325) #b00000000000000000000000000000000) Nil!4571) Nil!4571) (select (arr!6766 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!285768 () Bool)

(declare-fun e!181129 () Bool)

(assert (=> b!285768 (= e!181130 e!181129)))

(declare-fun c!46441 () Bool)

(assert (=> b!285768 (= c!46441 (validKeyInArray!0 (select (arr!6766 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25583 () Bool)

(declare-fun call!25586 () Bool)

(assert (=> bm!25583 (= call!25586 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46441 (Cons!4570 (select (arr!6766 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46398 (Cons!4570 (select (arr!6766 a!3325) #b00000000000000000000000000000000) Nil!4571) Nil!4571)) (ite c!46398 (Cons!4570 (select (arr!6766 a!3325) #b00000000000000000000000000000000) Nil!4571) Nil!4571))))))

(declare-fun b!285769 () Bool)

(assert (=> b!285769 (= e!181129 call!25586)))

(declare-fun b!285765 () Bool)

(assert (=> b!285765 (= e!181129 call!25586)))

(declare-fun d!65865 () Bool)

(declare-fun res!147992 () Bool)

(assert (=> d!65865 (=> res!147992 e!181128)))

(assert (=> d!65865 (= res!147992 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7118 a!3325)))))

(assert (=> d!65865 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46398 (Cons!4570 (select (arr!6766 a!3325) #b00000000000000000000000000000000) Nil!4571) Nil!4571)) e!181128)))

(assert (= (and d!65865 (not res!147992)) b!285766))

(assert (= (and b!285766 res!147993) b!285767))

(assert (= (and b!285766 res!147994) b!285768))

(assert (= (and b!285768 c!46441) b!285765))

(assert (= (and b!285768 (not c!46441)) b!285769))

(assert (= (or b!285765 b!285769) bm!25583))

(declare-fun m!300583 () Bool)

(assert (=> b!285766 m!300583))

(assert (=> b!285766 m!300583))

(declare-fun m!300585 () Bool)

(assert (=> b!285766 m!300585))

(assert (=> b!285767 m!300583))

(assert (=> b!285767 m!300583))

(declare-fun m!300587 () Bool)

(assert (=> b!285767 m!300587))

(assert (=> b!285768 m!300583))

(assert (=> b!285768 m!300583))

(assert (=> b!285768 m!300585))

(assert (=> bm!25583 m!300583))

(declare-fun m!300593 () Bool)

(assert (=> bm!25583 m!300593))

(assert (=> bm!25576 d!65865))

(declare-fun d!65871 () Bool)

(declare-fun res!147997 () Bool)

(declare-fun e!181135 () Bool)

(assert (=> d!65871 (=> res!147997 e!181135)))

(assert (=> d!65871 (= res!147997 (= (select (arr!6766 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2581))))

(assert (=> d!65871 (= (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!181135)))

(declare-fun b!285774 () Bool)

(declare-fun e!181136 () Bool)

(assert (=> b!285774 (= e!181135 e!181136)))

(declare-fun res!147998 () Bool)

(assert (=> b!285774 (=> (not res!147998) (not e!181136))))

(assert (=> b!285774 (= res!147998 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7118 a!3325)))))

(declare-fun b!285775 () Bool)

(assert (=> b!285775 (= e!181136 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!65871 (not res!147997)) b!285774))

(assert (= (and b!285774 res!147998) b!285775))

(assert (=> d!65871 m!300583))

(declare-fun m!300603 () Bool)

(assert (=> b!285775 m!300603))

(assert (=> b!285597 d!65871))

(declare-fun d!65875 () Bool)

(declare-fun lt!140939 () Bool)

(declare-fun content!195 (List!4574) (Set (_ BitVec 64)))

(assert (=> d!65875 (= lt!140939 (member (select (arr!6766 a!3325) #b00000000000000000000000000000000) (content!195 Nil!4571)))))

(declare-fun e!181147 () Bool)

(assert (=> d!65875 (= lt!140939 e!181147)))

(declare-fun res!148010 () Bool)

(assert (=> d!65875 (=> (not res!148010) (not e!181147))))

(assert (=> d!65875 (= res!148010 (is-Cons!4570 Nil!4571))))

(assert (=> d!65875 (= (contains!1999 Nil!4571 (select (arr!6766 a!3325) #b00000000000000000000000000000000)) lt!140939)))

(declare-fun b!285786 () Bool)

(declare-fun e!181148 () Bool)

(assert (=> b!285786 (= e!181147 e!181148)))

(declare-fun res!148009 () Bool)

(assert (=> b!285786 (=> res!148009 e!181148)))

(assert (=> b!285786 (= res!148009 (= (h!5243 Nil!4571) (select (arr!6766 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285787 () Bool)

(assert (=> b!285787 (= e!181148 (contains!1999 (t!9656 Nil!4571) (select (arr!6766 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65875 res!148010) b!285786))

(assert (= (and b!285786 (not res!148009)) b!285787))

(declare-fun m!300609 () Bool)

(assert (=> d!65875 m!300609))

(assert (=> d!65875 m!300375))

(declare-fun m!300613 () Bool)

(assert (=> d!65875 m!300613))

(assert (=> b!285787 m!300375))

(declare-fun m!300615 () Bool)

(assert (=> b!285787 m!300615))

(assert (=> b!285633 d!65875))

