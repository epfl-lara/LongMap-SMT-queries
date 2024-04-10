; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27648 () Bool)

(assert start!27648)

(declare-fun b!285407 () Bool)

(declare-fun res!147816 () Bool)

(declare-fun e!180914 () Bool)

(assert (=> b!285407 (=> (not res!147816) (not e!180914))))

(declare-datatypes ((array!14253 0))(
  ( (array!14254 (arr!6764 (Array (_ BitVec 32) (_ BitVec 64))) (size!7116 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14253)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14253 (_ BitVec 32)) Bool)

(assert (=> b!285407 (= res!147816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!285408 () Bool)

(declare-fun res!147819 () Bool)

(assert (=> b!285408 (=> (not res!147819) (not e!180914))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!285408 (= res!147819 (bvsge startIndex!26 (bvsub (size!7116 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!285409 () Bool)

(declare-fun res!147822 () Bool)

(assert (=> b!285409 (=> (not res!147822) (not e!180914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285409 (= res!147822 (not (validKeyInArray!0 (select (arr!6764 a!3325) startIndex!26))))))

(declare-fun b!285410 () Bool)

(declare-fun res!147814 () Bool)

(declare-fun e!180912 () Bool)

(assert (=> b!285410 (=> (not res!147814) (not e!180912))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!285410 (= res!147814 (and (= (size!7116 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7116 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7116 a!3325))))))

(declare-fun b!285411 () Bool)

(assert (=> b!285411 (= e!180912 e!180914)))

(declare-fun res!147820 () Bool)

(assert (=> b!285411 (=> (not res!147820) (not e!180914))))

(declare-datatypes ((SeekEntryResult!1922 0))(
  ( (MissingZero!1922 (index!9858 (_ BitVec 32))) (Found!1922 (index!9859 (_ BitVec 32))) (Intermediate!1922 (undefined!2734 Bool) (index!9860 (_ BitVec 32)) (x!28057 (_ BitVec 32))) (Undefined!1922) (MissingVacant!1922 (index!9861 (_ BitVec 32))) )
))
(declare-fun lt!140806 () SeekEntryResult!1922)

(assert (=> b!285411 (= res!147820 (or (= lt!140806 (MissingZero!1922 i!1267)) (= lt!140806 (MissingVacant!1922 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14253 (_ BitVec 32)) SeekEntryResult!1922)

(assert (=> b!285411 (= lt!140806 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!285412 () Bool)

(declare-fun res!147817 () Bool)

(assert (=> b!285412 (=> (not res!147817) (not e!180914))))

(assert (=> b!285412 (= res!147817 (not (= startIndex!26 i!1267)))))

(declare-fun res!147813 () Bool)

(assert (=> start!27648 (=> (not res!147813) (not e!180912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27648 (= res!147813 (validMask!0 mask!3868))))

(assert (=> start!27648 e!180912))

(declare-fun array_inv!4727 (array!14253) Bool)

(assert (=> start!27648 (array_inv!4727 a!3325)))

(assert (=> start!27648 true))

(declare-fun b!285413 () Bool)

(declare-fun res!147821 () Bool)

(assert (=> b!285413 (=> (not res!147821) (not e!180912))))

(declare-datatypes ((List!4572 0))(
  ( (Nil!4569) (Cons!4568 (h!5241 (_ BitVec 64)) (t!9654 List!4572)) )
))
(declare-fun arrayNoDuplicates!0 (array!14253 (_ BitVec 32) List!4572) Bool)

(assert (=> b!285413 (= res!147821 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4569))))

(declare-fun b!285414 () Bool)

(declare-fun res!147815 () Bool)

(assert (=> b!285414 (=> (not res!147815) (not e!180912))))

(declare-fun arrayContainsKey!0 (array!14253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285414 (= res!147815 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285415 () Bool)

(assert (=> b!285415 (= e!180914 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) mask!3868)))))

(declare-fun b!285416 () Bool)

(declare-fun res!147818 () Bool)

(assert (=> b!285416 (=> (not res!147818) (not e!180912))))

(assert (=> b!285416 (= res!147818 (validKeyInArray!0 k!2581))))

(assert (= (and start!27648 res!147813) b!285410))

(assert (= (and b!285410 res!147814) b!285416))

(assert (= (and b!285416 res!147818) b!285413))

(assert (= (and b!285413 res!147821) b!285414))

(assert (= (and b!285414 res!147815) b!285411))

(assert (= (and b!285411 res!147820) b!285407))

(assert (= (and b!285407 res!147816) b!285412))

(assert (= (and b!285412 res!147817) b!285409))

(assert (= (and b!285409 res!147822) b!285408))

(assert (= (and b!285408 res!147819) b!285415))

(declare-fun m!300237 () Bool)

(assert (=> b!285416 m!300237))

(declare-fun m!300239 () Bool)

(assert (=> b!285414 m!300239))

(declare-fun m!300241 () Bool)

(assert (=> b!285413 m!300241))

(declare-fun m!300243 () Bool)

(assert (=> start!27648 m!300243))

(declare-fun m!300245 () Bool)

(assert (=> start!27648 m!300245))

(declare-fun m!300247 () Bool)

(assert (=> b!285409 m!300247))

(assert (=> b!285409 m!300247))

(declare-fun m!300249 () Bool)

(assert (=> b!285409 m!300249))

(declare-fun m!300251 () Bool)

(assert (=> b!285411 m!300251))

(declare-fun m!300253 () Bool)

(assert (=> b!285415 m!300253))

(declare-fun m!300255 () Bool)

(assert (=> b!285415 m!300255))

(declare-fun m!300257 () Bool)

(assert (=> b!285407 m!300257))

(push 1)

(assert (not b!285413))

(assert (not b!285415))

(assert (not b!285409))

(assert (not start!27648))

(assert (not b!285407))

(assert (not b!285414))

(assert (not b!285411))

(assert (not b!285416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65763 () Bool)

(declare-fun res!147905 () Bool)

(declare-fun e!180965 () Bool)

(assert (=> d!65763 (=> res!147905 e!180965)))

(assert (=> d!65763 (= res!147905 (bvsge #b00000000000000000000000000000000 (size!7116 a!3325)))))

(assert (=> d!65763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!180965)))

(declare-fun bm!25565 () Bool)

(declare-fun call!25568 () Bool)

(assert (=> bm!25565 (= call!25568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!285516 () Bool)

(declare-fun e!180963 () Bool)

(assert (=> b!285516 (= e!180963 call!25568)))

(declare-fun b!285517 () Bool)

(declare-fun e!180964 () Bool)

(assert (=> b!285517 (= e!180964 call!25568)))

(declare-fun b!285518 () Bool)

(assert (=> b!285518 (= e!180963 e!180964)))

(declare-fun lt!140832 () (_ BitVec 64))

(assert (=> b!285518 (= lt!140832 (select (arr!6764 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9046 0))(
  ( (Unit!9047) )
))
(declare-fun lt!140831 () Unit!9046)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14253 (_ BitVec 64) (_ BitVec 32)) Unit!9046)

(assert (=> b!285518 (= lt!140831 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140832 #b00000000000000000000000000000000))))

(assert (=> b!285518 (arrayContainsKey!0 a!3325 lt!140832 #b00000000000000000000000000000000)))

(declare-fun lt!140833 () Unit!9046)

(assert (=> b!285518 (= lt!140833 lt!140831)))

(declare-fun res!147904 () Bool)

(assert (=> b!285518 (= res!147904 (= (seekEntryOrOpen!0 (select (arr!6764 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1922 #b00000000000000000000000000000000)))))

(assert (=> b!285518 (=> (not res!147904) (not e!180964))))

(declare-fun b!285519 () Bool)

(assert (=> b!285519 (= e!180965 e!180963)))

(declare-fun c!46360 () Bool)

(assert (=> b!285519 (= c!46360 (validKeyInArray!0 (select (arr!6764 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65763 (not res!147905)) b!285519))

(assert (= (and b!285519 c!46360) b!285518))

(assert (= (and b!285519 (not c!46360)) b!285516))

(assert (= (and b!285518 res!147904) b!285517))

(assert (= (or b!285517 b!285516) bm!25565))

(declare-fun m!300331 () Bool)

(assert (=> bm!25565 m!300331))

(declare-fun m!300333 () Bool)

(assert (=> b!285518 m!300333))

(declare-fun m!300335 () Bool)

(assert (=> b!285518 m!300335))

(declare-fun m!300337 () Bool)

(assert (=> b!285518 m!300337))

(assert (=> b!285518 m!300333))

(declare-fun m!300339 () Bool)

(assert (=> b!285518 m!300339))

(assert (=> b!285519 m!300333))

(assert (=> b!285519 m!300333))

(declare-fun m!300341 () Bool)

(assert (=> b!285519 m!300341))

(assert (=> b!285407 d!65763))

(declare-fun d!65777 () Bool)

(assert (=> d!65777 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285416 d!65777))

(declare-fun b!285586 () Bool)

(declare-fun e!181009 () SeekEntryResult!1922)

(declare-fun lt!140869 () SeekEntryResult!1922)

(assert (=> b!285586 (= e!181009 (Found!1922 (index!9860 lt!140869)))))

(declare-fun b!285587 () Bool)

(declare-fun e!181007 () SeekEntryResult!1922)

(assert (=> b!285587 (= e!181007 Undefined!1922)))

(declare-fun e!181008 () SeekEntryResult!1922)

(declare-fun b!285588 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14253 (_ BitVec 32)) SeekEntryResult!1922)

(assert (=> b!285588 (= e!181008 (seekKeyOrZeroReturnVacant!0 (x!28057 lt!140869) (index!9860 lt!140869) (index!9860 lt!140869) k!2581 a!3325 mask!3868))))

(declare-fun b!285589 () Bool)

(assert (=> b!285589 (= e!181007 e!181009)))

(declare-fun lt!140868 () (_ BitVec 64))

(assert (=> b!285589 (= lt!140868 (select (arr!6764 a!3325) (index!9860 lt!140869)))))

(declare-fun c!46390 () Bool)

(assert (=> b!285589 (= c!46390 (= lt!140868 k!2581))))

(declare-fun d!65779 () Bool)

(declare-fun lt!140867 () SeekEntryResult!1922)

(assert (=> d!65779 (and (or (is-Undefined!1922 lt!140867) (not (is-Found!1922 lt!140867)) (and (bvsge (index!9859 lt!140867) #b00000000000000000000000000000000) (bvslt (index!9859 lt!140867) (size!7116 a!3325)))) (or (is-Undefined!1922 lt!140867) (is-Found!1922 lt!140867) (not (is-MissingZero!1922 lt!140867)) (and (bvsge (index!9858 lt!140867) #b00000000000000000000000000000000) (bvslt (index!9858 lt!140867) (size!7116 a!3325)))) (or (is-Undefined!1922 lt!140867) (is-Found!1922 lt!140867) (is-MissingZero!1922 lt!140867) (not (is-MissingVacant!1922 lt!140867)) (and (bvsge (index!9861 lt!140867) #b00000000000000000000000000000000) (bvslt (index!9861 lt!140867) (size!7116 a!3325)))) (or (is-Undefined!1922 lt!140867) (ite (is-Found!1922 lt!140867) (= (select (arr!6764 a!3325) (index!9859 lt!140867)) k!2581) (ite (is-MissingZero!1922 lt!140867) (= (select (arr!6764 a!3325) (index!9858 lt!140867)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1922 lt!140867) (= (select (arr!6764 a!3325) (index!9861 lt!140867)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65779 (= lt!140867 e!181007)))

(declare-fun c!46388 () Bool)

(assert (=> d!65779 (= c!46388 (and (is-Intermediate!1922 lt!140869) (undefined!2734 lt!140869)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14253 (_ BitVec 32)) SeekEntryResult!1922)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65779 (= lt!140869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!65779 (validMask!0 mask!3868)))

(assert (=> d!65779 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!140867)))

(declare-fun b!285590 () Bool)

(declare-fun c!46389 () Bool)

(assert (=> b!285590 (= c!46389 (= lt!140868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!285590 (= e!181009 e!181008)))

(declare-fun b!285591 () Bool)

(assert (=> b!285591 (= e!181008 (MissingZero!1922 (index!9860 lt!140869)))))

(assert (= (and d!65779 c!46388) b!285587))

(assert (= (and d!65779 (not c!46388)) b!285589))

(assert (= (and b!285589 c!46390) b!285586))

(assert (= (and b!285589 (not c!46390)) b!285590))

(assert (= (and b!285590 c!46389) b!285591))

(assert (= (and b!285590 (not c!46389)) b!285588))

(declare-fun m!300385 () Bool)

(assert (=> b!285588 m!300385))

(declare-fun m!300387 () Bool)

(assert (=> b!285589 m!300387))

(declare-fun m!300389 () Bool)

(assert (=> d!65779 m!300389))

(declare-fun m!300391 () Bool)

(assert (=> d!65779 m!300391))

(declare-fun m!300393 () Bool)

(assert (=> d!65779 m!300393))

(declare-fun m!300395 () Bool)

(assert (=> d!65779 m!300395))

(assert (=> d!65779 m!300395))

(declare-fun m!300397 () Bool)

(assert (=> d!65779 m!300397))

(assert (=> d!65779 m!300243))

(assert (=> b!285411 d!65779))

(declare-fun d!65789 () Bool)

(assert (=> d!65789 (= (validKeyInArray!0 (select (arr!6764 a!3325) startIndex!26)) (and (not (= (select (arr!6764 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6764 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285409 d!65789))

(declare-fun d!65791 () Bool)

(declare-fun res!147925 () Bool)

(declare-fun e!181016 () Bool)

(assert (=> d!65791 (=> res!147925 e!181016)))

(assert (=> d!65791 (= res!147925 (bvsge startIndex!26 (size!7116 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)))))))

(assert (=> d!65791 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) mask!3868) e!181016)))

(declare-fun call!25572 () Bool)

(declare-fun bm!25569 () Bool)

(assert (=> bm!25569 (= call!25572 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) mask!3868))))

(declare-fun b!285598 () Bool)

(declare-fun e!181014 () Bool)

(assert (=> b!285598 (= e!181014 call!25572)))

(declare-fun b!285599 () Bool)

(declare-fun e!181015 () Bool)

(assert (=> b!285599 (= e!181015 call!25572)))

(declare-fun b!285600 () Bool)

(assert (=> b!285600 (= e!181014 e!181015)))

(declare-fun lt!140871 () (_ BitVec 64))

(assert (=> b!285600 (= lt!140871 (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26))))

(declare-fun lt!140870 () Unit!9046)

(assert (=> b!285600 (= lt!140870 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) lt!140871 startIndex!26))))

(assert (=> b!285600 (arrayContainsKey!0 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) lt!140871 #b00000000000000000000000000000000)))

(declare-fun lt!140872 () Unit!9046)

(assert (=> b!285600 (= lt!140872 lt!140870)))

(declare-fun res!147924 () Bool)

(assert (=> b!285600 (= res!147924 (= (seekEntryOrOpen!0 (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26) (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) mask!3868) (Found!1922 startIndex!26)))))

(assert (=> b!285600 (=> (not res!147924) (not e!181015))))

(declare-fun b!285601 () Bool)

(assert (=> b!285601 (= e!181016 e!181014)))

(declare-fun c!46391 () Bool)

(assert (=> b!285601 (= c!46391 (validKeyInArray!0 (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26)))))

(assert (= (and d!65791 (not res!147925)) b!285601))

(assert (= (and b!285601 c!46391) b!285600))

(assert (= (and b!285601 (not c!46391)) b!285598))

(assert (= (and b!285600 res!147924) b!285599))

(assert (= (or b!285599 b!285598) bm!25569))

(declare-fun m!300401 () Bool)

(assert (=> bm!25569 m!300401))

(declare-fun m!300403 () Bool)

(assert (=> b!285600 m!300403))

(declare-fun m!300405 () Bool)

(assert (=> b!285600 m!300405))

(declare-fun m!300407 () Bool)

(assert (=> b!285600 m!300407))

(assert (=> b!285600 m!300403))

(declare-fun m!300409 () Bool)

(assert (=> b!285600 m!300409))

(assert (=> b!285601 m!300403))

(assert (=> b!285601 m!300403))

(declare-fun m!300411 () Bool)

(assert (=> b!285601 m!300411))

(assert (=> b!285415 d!65791))

(declare-fun b!285616 () Bool)

(declare-fun e!181030 () Bool)

(declare-fun contains!1998 (List!4572 (_ BitVec 64)) Bool)

(assert (=> b!285616 (= e!181030 (contains!1998 Nil!4569 (select (arr!6764 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285618 () Bool)

(declare-fun e!181031 () Bool)

(declare-fun e!181028 () Bool)

(assert (=> b!285618 (= e!181031 e!181028)))

(declare-fun res!147934 () Bool)

(assert (=> b!285618 (=> (not res!147934) (not e!181028))))

(assert (=> b!285618 (= res!147934 (not e!181030))))

(declare-fun res!147936 () Bool)

(assert (=> b!285618 (=> (not res!147936) (not e!181030))))

(assert (=> b!285618 (= res!147936 (validKeyInArray!0 (select (arr!6764 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285619 () Bool)

(declare-fun e!181029 () Bool)

(declare-fun call!25576 () Bool)

(assert (=> b!285619 (= e!181029 call!25576)))

(declare-fun b!285620 () Bool)

(assert (=> b!285620 (= e!181029 call!25576)))

(declare-fun bm!25573 () Bool)

(declare-fun c!46395 () Bool)

(assert (=> bm!25573 (= call!25576 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46395 (Cons!4568 (select (arr!6764 a!3325) #b00000000000000000000000000000000) Nil!4569) Nil!4569)))))

(declare-fun b!285617 () Bool)

(assert (=> b!285617 (= e!181028 e!181029)))

(assert (=> b!285617 (= c!46395 (validKeyInArray!0 (select (arr!6764 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65797 () Bool)

(declare-fun res!147935 () Bool)

(assert (=> d!65797 (=> res!147935 e!181031)))

(assert (=> d!65797 (= res!147935 (bvsge #b00000000000000000000000000000000 (size!7116 a!3325)))))

(assert (=> d!65797 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4569) e!181031)))

(assert (= (and d!65797 (not res!147935)) b!285618))

(assert (= (and b!285618 res!147936) b!285616))

(assert (= (and b!285618 res!147934) b!285617))

(assert (= (and b!285617 c!46395) b!285619))

(assert (= (and b!285617 (not c!46395)) b!285620))

(assert (= (or b!285619 b!285620) bm!25573))

(assert (=> b!285616 m!300333))

(assert (=> b!285616 m!300333))

(declare-fun m!300425 () Bool)

(assert (=> b!285616 m!300425))

(assert (=> b!285618 m!300333))

(assert (=> b!285618 m!300333))

(assert (=> b!285618 m!300341))

(assert (=> bm!25573 m!300333))

(declare-fun m!300427 () Bool)

(assert (=> bm!25573 m!300427))

(assert (=> b!285617 m!300333))

(assert (=> b!285617 m!300333))

(assert (=> b!285617 m!300341))

(assert (=> b!285413 d!65797))

(declare-fun d!65803 () Bool)

(assert (=> d!65803 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27648 d!65803))

(declare-fun d!65811 () Bool)

(assert (=> d!65811 (= (array_inv!4727 a!3325) (bvsge (size!7116 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27648 d!65811))

(declare-fun d!65813 () Bool)

(declare-fun res!147950 () Bool)

(declare-fun e!181048 () Bool)

(assert (=> d!65813 (=> res!147950 e!181048)))

(assert (=> d!65813 (= res!147950 (= (select (arr!6764 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!65813 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!181048)))

(declare-fun b!285640 () Bool)

(declare-fun e!181049 () Bool)

(assert (=> b!285640 (= e!181048 e!181049)))

(declare-fun res!147951 () Bool)

(assert (=> b!285640 (=> (not res!147951) (not e!181049))))

(assert (=> b!285640 (= res!147951 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7116 a!3325)))))

(declare-fun b!285641 () Bool)

(assert (=> b!285641 (= e!181049 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65813 (not res!147950)) b!285640))

(assert (= (and b!285640 res!147951) b!285641))

(assert (=> d!65813 m!300333))

(declare-fun m!300433 () Bool)

(assert (=> b!285641 m!300433))

(assert (=> b!285414 d!65813))

(push 1)

(assert (not b!285588))

(assert (not b!285518))

(assert (not b!285600))

(assert (not b!285618))

(assert (not bm!25565))

(assert (not bm!25573))

(assert (not b!285519))

(assert (not b!285616))

(assert (not b!285641))

(assert (not b!285601))

(assert (not bm!25569))

(assert (not b!285617))

(assert (not d!65779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!285724 () Bool)

(declare-fun e!181104 () Bool)

(assert (=> b!285724 (= e!181104 (contains!1998 (ite c!46395 (Cons!4568 (select (arr!6764 a!3325) #b00000000000000000000000000000000) Nil!4569) Nil!4569) (select (arr!6764 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!285726 () Bool)

(declare-fun e!181105 () Bool)

(declare-fun e!181102 () Bool)

(assert (=> b!285726 (= e!181105 e!181102)))

(declare-fun res!147981 () Bool)

(assert (=> b!285726 (=> (not res!147981) (not e!181102))))

(assert (=> b!285726 (= res!147981 (not e!181104))))

(declare-fun res!147983 () Bool)

(assert (=> b!285726 (=> (not res!147983) (not e!181104))))

(assert (=> b!285726 (= res!147983 (validKeyInArray!0 (select (arr!6764 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!285727 () Bool)

(declare-fun e!181103 () Bool)

(declare-fun call!25583 () Bool)

(assert (=> b!285727 (= e!181103 call!25583)))

(declare-fun b!285728 () Bool)

(assert (=> b!285728 (= e!181103 call!25583)))

(declare-fun c!46426 () Bool)

(declare-fun bm!25580 () Bool)

(assert (=> bm!25580 (= call!25583 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46426 (Cons!4568 (select (arr!6764 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46395 (Cons!4568 (select (arr!6764 a!3325) #b00000000000000000000000000000000) Nil!4569) Nil!4569)) (ite c!46395 (Cons!4568 (select (arr!6764 a!3325) #b00000000000000000000000000000000) Nil!4569) Nil!4569))))))

(declare-fun b!285725 () Bool)

(assert (=> b!285725 (= e!181102 e!181103)))

(assert (=> b!285725 (= c!46426 (validKeyInArray!0 (select (arr!6764 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!65847 () Bool)

(declare-fun res!147982 () Bool)

(assert (=> d!65847 (=> res!147982 e!181105)))

(assert (=> d!65847 (= res!147982 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7116 a!3325)))))

(assert (=> d!65847 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46395 (Cons!4568 (select (arr!6764 a!3325) #b00000000000000000000000000000000) Nil!4569) Nil!4569)) e!181105)))

(assert (= (and d!65847 (not res!147982)) b!285726))

(assert (= (and b!285726 res!147983) b!285724))

(assert (= (and b!285726 res!147981) b!285725))

(assert (= (and b!285725 c!46426) b!285727))

(assert (= (and b!285725 (not c!46426)) b!285728))

(assert (= (or b!285727 b!285728) bm!25580))

(declare-fun m!300525 () Bool)

(assert (=> b!285724 m!300525))

(assert (=> b!285724 m!300525))

(declare-fun m!300527 () Bool)

(assert (=> b!285724 m!300527))

(assert (=> b!285726 m!300525))

(assert (=> b!285726 m!300525))

(declare-fun m!300529 () Bool)

(assert (=> b!285726 m!300529))

(assert (=> bm!25580 m!300525))

(declare-fun m!300531 () Bool)

(assert (=> bm!25580 m!300531))

(assert (=> b!285725 m!300525))

(assert (=> b!285725 m!300525))

(assert (=> b!285725 m!300529))

(assert (=> bm!25573 d!65847))

(declare-fun d!65849 () Bool)

(declare-fun res!147984 () Bool)

(declare-fun e!181106 () Bool)

(assert (=> d!65849 (=> res!147984 e!181106)))

(assert (=> d!65849 (= res!147984 (= (select (arr!6764 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2581))))

(assert (=> d!65849 (= (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!181106)))

(declare-fun b!285729 () Bool)

(declare-fun e!181107 () Bool)

(assert (=> b!285729 (= e!181106 e!181107)))

(declare-fun res!147985 () Bool)

(assert (=> b!285729 (=> (not res!147985) (not e!181107))))

(assert (=> b!285729 (= res!147985 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7116 a!3325)))))

(declare-fun b!285730 () Bool)

(assert (=> b!285730 (= e!181107 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!65849 (not res!147984)) b!285729))

(assert (= (and b!285729 res!147985) b!285730))

(assert (=> d!65849 m!300525))

(declare-fun m!300533 () Bool)

(assert (=> b!285730 m!300533))

(assert (=> b!285641 d!65849))

(declare-fun d!65851 () Bool)

(assert (=> d!65851 (= (validKeyInArray!0 (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26)) (and (not (= (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285601 d!65851))

(declare-fun d!65853 () Bool)

(declare-fun res!147987 () Bool)

(declare-fun e!181110 () Bool)

(assert (=> d!65853 (=> res!147987 e!181110)))

(assert (=> d!65853 (= res!147987 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7116 a!3325)))))

(assert (=> d!65853 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868) e!181110)))

(declare-fun bm!25581 () Bool)

(declare-fun call!25584 () Bool)

(assert (=> bm!25581 (= call!25584 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!285731 () Bool)

(declare-fun e!181108 () Bool)

(assert (=> b!285731 (= e!181108 call!25584)))

(declare-fun b!285732 () Bool)

(declare-fun e!181109 () Bool)

(assert (=> b!285732 (= e!181109 call!25584)))

(declare-fun b!285733 () Bool)

(assert (=> b!285733 (= e!181108 e!181109)))

(declare-fun lt!140914 () (_ BitVec 64))

(assert (=> b!285733 (= lt!140914 (select (arr!6764 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!140913 () Unit!9046)

(assert (=> b!285733 (= lt!140913 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!285733 (arrayContainsKey!0 a!3325 lt!140914 #b00000000000000000000000000000000)))

(declare-fun lt!140915 () Unit!9046)

(assert (=> b!285733 (= lt!140915 lt!140913)))

(declare-fun res!147986 () Bool)

(assert (=> b!285733 (= res!147986 (= (seekEntryOrOpen!0 (select (arr!6764 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1922 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!285733 (=> (not res!147986) (not e!181109))))

(declare-fun b!285734 () Bool)

(assert (=> b!285734 (= e!181110 e!181108)))

(declare-fun c!46427 () Bool)

(assert (=> b!285734 (= c!46427 (validKeyInArray!0 (select (arr!6764 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!65853 (not res!147987)) b!285734))

(assert (= (and b!285734 c!46427) b!285733))

(assert (= (and b!285734 (not c!46427)) b!285731))

(assert (= (and b!285733 res!147986) b!285732))

(assert (= (or b!285732 b!285731) bm!25581))

(declare-fun m!300535 () Bool)

(assert (=> bm!25581 m!300535))

(assert (=> b!285733 m!300525))

(declare-fun m!300537 () Bool)

(assert (=> b!285733 m!300537))

(declare-fun m!300539 () Bool)

(assert (=> b!285733 m!300539))

(assert (=> b!285733 m!300525))

(declare-fun m!300541 () Bool)

(assert (=> b!285733 m!300541))

(assert (=> b!285734 m!300525))

(assert (=> b!285734 m!300525))

(assert (=> b!285734 m!300529))

(assert (=> bm!25565 d!65853))

(declare-fun d!65855 () Bool)

(assert (=> d!65855 (arrayContainsKey!0 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) lt!140871 #b00000000000000000000000000000000)))

(declare-fun lt!140918 () Unit!9046)

(declare-fun choose!13 (array!14253 (_ BitVec 64) (_ BitVec 32)) Unit!9046)

(assert (=> d!65855 (= lt!140918 (choose!13 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) lt!140871 startIndex!26))))

(assert (=> d!65855 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!65855 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) lt!140871 startIndex!26) lt!140918)))

(declare-fun bs!10145 () Bool)

(assert (= bs!10145 d!65855))

(assert (=> bs!10145 m!300407))

(declare-fun m!300543 () Bool)

(assert (=> bs!10145 m!300543))

(assert (=> b!285600 d!65855))

(declare-fun d!65857 () Bool)

(declare-fun res!147988 () Bool)

(declare-fun e!181111 () Bool)

(assert (=> d!65857 (=> res!147988 e!181111)))

(assert (=> d!65857 (= res!147988 (= (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) #b00000000000000000000000000000000) lt!140871))))

(assert (=> d!65857 (= (arrayContainsKey!0 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) lt!140871 #b00000000000000000000000000000000) e!181111)))

(declare-fun b!285735 () Bool)

(declare-fun e!181112 () Bool)

(assert (=> b!285735 (= e!181111 e!181112)))

(declare-fun res!147989 () Bool)

(assert (=> b!285735 (=> (not res!147989) (not e!181112))))

(assert (=> b!285735 (= res!147989 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7116 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)))))))

(declare-fun b!285736 () Bool)

(assert (=> b!285736 (= e!181112 (arrayContainsKey!0 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) lt!140871 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65857 (not res!147988)) b!285735))

(assert (= (and b!285735 res!147989) b!285736))

(declare-fun m!300545 () Bool)

(assert (=> d!65857 m!300545))

(declare-fun m!300547 () Bool)

(assert (=> b!285736 m!300547))

(assert (=> b!285600 d!65857))

(declare-fun b!285737 () Bool)

(declare-fun e!181115 () SeekEntryResult!1922)

(declare-fun lt!140921 () SeekEntryResult!1922)

(assert (=> b!285737 (= e!181115 (Found!1922 (index!9860 lt!140921)))))

(declare-fun b!285738 () Bool)

(declare-fun e!181113 () SeekEntryResult!1922)

(assert (=> b!285738 (= e!181113 Undefined!1922)))

(declare-fun b!285739 () Bool)

(declare-fun e!181114 () SeekEntryResult!1922)

(assert (=> b!285739 (= e!181114 (seekKeyOrZeroReturnVacant!0 (x!28057 lt!140921) (index!9860 lt!140921) (index!9860 lt!140921) (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26) (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) mask!3868))))

(declare-fun b!285740 () Bool)

(assert (=> b!285740 (= e!181113 e!181115)))

(declare-fun lt!140920 () (_ BitVec 64))

(assert (=> b!285740 (= lt!140920 (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) (index!9860 lt!140921)))))

(declare-fun c!46430 () Bool)

(assert (=> b!285740 (= c!46430 (= lt!140920 (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26)))))

(declare-fun d!65859 () Bool)

(declare-fun lt!140919 () SeekEntryResult!1922)

(assert (=> d!65859 (and (or (is-Undefined!1922 lt!140919) (not (is-Found!1922 lt!140919)) (and (bvsge (index!9859 lt!140919) #b00000000000000000000000000000000) (bvslt (index!9859 lt!140919) (size!7116 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)))))) (or (is-Undefined!1922 lt!140919) (is-Found!1922 lt!140919) (not (is-MissingZero!1922 lt!140919)) (and (bvsge (index!9858 lt!140919) #b00000000000000000000000000000000) (bvslt (index!9858 lt!140919) (size!7116 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)))))) (or (is-Undefined!1922 lt!140919) (is-Found!1922 lt!140919) (is-MissingZero!1922 lt!140919) (not (is-MissingVacant!1922 lt!140919)) (and (bvsge (index!9861 lt!140919) #b00000000000000000000000000000000) (bvslt (index!9861 lt!140919) (size!7116 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)))))) (or (is-Undefined!1922 lt!140919) (ite (is-Found!1922 lt!140919) (= (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) (index!9859 lt!140919)) (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26)) (ite (is-MissingZero!1922 lt!140919) (= (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) (index!9858 lt!140919)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1922 lt!140919) (= (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) (index!9861 lt!140919)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65859 (= lt!140919 e!181113)))

(declare-fun c!46428 () Bool)

(assert (=> d!65859 (= c!46428 (and (is-Intermediate!1922 lt!140921) (undefined!2734 lt!140921)))))

(assert (=> d!65859 (= lt!140921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26) mask!3868) (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26) (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) mask!3868))))

(assert (=> d!65859 (validMask!0 mask!3868)))

(assert (=> d!65859 (= (seekEntryOrOpen!0 (select (arr!6764 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325))) startIndex!26) (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) mask!3868) lt!140919)))

(declare-fun b!285741 () Bool)

(declare-fun c!46429 () Bool)

(assert (=> b!285741 (= c!46429 (= lt!140920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!285741 (= e!181115 e!181114)))

(declare-fun b!285742 () Bool)

(assert (=> b!285742 (= e!181114 (MissingZero!1922 (index!9860 lt!140921)))))

(assert (= (and d!65859 c!46428) b!285738))

(assert (= (and d!65859 (not c!46428)) b!285740))

(assert (= (and b!285740 c!46430) b!285737))

(assert (= (and b!285740 (not c!46430)) b!285741))

(assert (= (and b!285741 c!46429) b!285742))

(assert (= (and b!285741 (not c!46429)) b!285739))

(assert (=> b!285739 m!300403))

(declare-fun m!300549 () Bool)

(assert (=> b!285739 m!300549))

(declare-fun m!300551 () Bool)

(assert (=> b!285740 m!300551))

(declare-fun m!300553 () Bool)

(assert (=> d!65859 m!300553))

(declare-fun m!300555 () Bool)

(assert (=> d!65859 m!300555))

(declare-fun m!300557 () Bool)

(assert (=> d!65859 m!300557))

(assert (=> d!65859 m!300403))

(declare-fun m!300559 () Bool)

(assert (=> d!65859 m!300559))

(assert (=> d!65859 m!300559))

(assert (=> d!65859 m!300403))

(declare-fun m!300561 () Bool)

(assert (=> d!65859 m!300561))

(assert (=> d!65859 m!300243))

(assert (=> b!285600 d!65859))

(declare-fun e!181126 () SeekEntryResult!1922)

(declare-fun b!285759 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!285759 (= e!181126 (seekKeyOrZeroReturnVacant!0 (bvadd (x!28057 lt!140869) #b00000000000000000000000000000001) (nextIndex!0 (index!9860 lt!140869) (x!28057 lt!140869) mask!3868) (index!9860 lt!140869) k!2581 a!3325 mask!3868))))

(declare-fun lt!140930 () SeekEntryResult!1922)

(declare-fun d!65861 () Bool)

(assert (=> d!65861 (and (or (is-Undefined!1922 lt!140930) (not (is-Found!1922 lt!140930)) (and (bvsge (index!9859 lt!140930) #b00000000000000000000000000000000) (bvslt (index!9859 lt!140930) (size!7116 a!3325)))) (or (is-Undefined!1922 lt!140930) (is-Found!1922 lt!140930) (not (is-MissingVacant!1922 lt!140930)) (not (= (index!9861 lt!140930) (index!9860 lt!140869))) (and (bvsge (index!9861 lt!140930) #b00000000000000000000000000000000) (bvslt (index!9861 lt!140930) (size!7116 a!3325)))) (or (is-Undefined!1922 lt!140930) (ite (is-Found!1922 lt!140930) (= (select (arr!6764 a!3325) (index!9859 lt!140930)) k!2581) (and (is-MissingVacant!1922 lt!140930) (= (index!9861 lt!140930) (index!9860 lt!140869)) (= (select (arr!6764 a!3325) (index!9861 lt!140930)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!181127 () SeekEntryResult!1922)

(assert (=> d!65861 (= lt!140930 e!181127)))

(declare-fun c!46439 () Bool)

(assert (=> d!65861 (= c!46439 (bvsge (x!28057 lt!140869) #b01111111111111111111111111111110))))

(declare-fun lt!140929 () (_ BitVec 64))

(assert (=> d!65861 (= lt!140929 (select (arr!6764 a!3325) (index!9860 lt!140869)))))

(assert (=> d!65861 (validMask!0 mask!3868)))

(assert (=> d!65861 (= (seekKeyOrZeroReturnVacant!0 (x!28057 lt!140869) (index!9860 lt!140869) (index!9860 lt!140869) k!2581 a!3325 mask!3868) lt!140930)))

(declare-fun b!285760 () Bool)

(declare-fun c!46438 () Bool)

(assert (=> b!285760 (= c!46438 (= lt!140929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!181125 () SeekEntryResult!1922)

(assert (=> b!285760 (= e!181125 e!181126)))

(declare-fun b!285761 () Bool)

(assert (=> b!285761 (= e!181127 Undefined!1922)))

(declare-fun b!285762 () Bool)

(assert (=> b!285762 (= e!181127 e!181125)))

(declare-fun c!46440 () Bool)

(assert (=> b!285762 (= c!46440 (= lt!140929 k!2581))))

(declare-fun b!285763 () Bool)

(assert (=> b!285763 (= e!181126 (MissingVacant!1922 (index!9860 lt!140869)))))

(declare-fun b!285764 () Bool)

(assert (=> b!285764 (= e!181125 (Found!1922 (index!9860 lt!140869)))))

(assert (= (and d!65861 c!46439) b!285761))

(assert (= (and d!65861 (not c!46439)) b!285762))

(assert (= (and b!285762 c!46440) b!285764))

(assert (= (and b!285762 (not c!46440)) b!285760))

(assert (= (and b!285760 c!46438) b!285763))

(assert (= (and b!285760 (not c!46438)) b!285759))

(declare-fun m!300575 () Bool)

(assert (=> b!285759 m!300575))

(assert (=> b!285759 m!300575))

(declare-fun m!300577 () Bool)

(assert (=> b!285759 m!300577))

(declare-fun m!300579 () Bool)

(assert (=> d!65861 m!300579))

(declare-fun m!300581 () Bool)

(assert (=> d!65861 m!300581))

(assert (=> d!65861 m!300387))

(assert (=> d!65861 m!300243))

(assert (=> b!285588 d!65861))

(declare-fun d!65867 () Bool)

(assert (=> d!65867 (= (validKeyInArray!0 (select (arr!6764 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6764 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6764 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285617 d!65867))

(assert (=> b!285618 d!65867))

(declare-fun d!65869 () Bool)

(declare-fun res!147996 () Bool)

(declare-fun e!181134 () Bool)

(assert (=> d!65869 (=> res!147996 e!181134)))

(assert (=> d!65869 (= res!147996 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7116 (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)))))))

(assert (=> d!65869 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) (array!14254 (store (arr!6764 a!3325) i!1267 k!2581) (size!7116 a!3325)) mask!3868) e!181134)))

(declare-fun call!25587 () Bool)

(declare-fun bm!25584 () Bool)

