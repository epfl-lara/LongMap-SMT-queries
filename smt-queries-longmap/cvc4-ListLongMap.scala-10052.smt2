; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118420 () Bool)

(assert start!118420)

(declare-fun b!1385198 () Bool)

(declare-fun res!926485 () Bool)

(declare-fun e!784853 () Bool)

(assert (=> b!1385198 (=> (not res!926485) (not e!784853))))

(declare-datatypes ((array!94723 0))(
  ( (array!94724 (arr!45739 (Array (_ BitVec 32) (_ BitVec 64))) (size!46289 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94723)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94723 (_ BitVec 32)) Bool)

(assert (=> b!1385198 (= res!926485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385199 () Bool)

(declare-fun res!926484 () Bool)

(assert (=> b!1385199 (=> (not res!926484) (not e!784853))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385199 (= res!926484 (and (= (size!46289 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46289 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46289 a!2938))))))

(declare-fun b!1385200 () Bool)

(assert (=> b!1385200 (= e!784853 (or (= (select (arr!45739 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!45739 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!926486 () Bool)

(assert (=> start!118420 (=> (not res!926486) (not e!784853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118420 (= res!926486 (validMask!0 mask!2987))))

(assert (=> start!118420 e!784853))

(assert (=> start!118420 true))

(declare-fun array_inv!34767 (array!94723) Bool)

(assert (=> start!118420 (array_inv!34767 a!2938)))

(declare-fun b!1385201 () Bool)

(declare-fun res!926487 () Bool)

(assert (=> b!1385201 (=> (not res!926487) (not e!784853))))

(declare-datatypes ((List!32267 0))(
  ( (Nil!32264) (Cons!32263 (h!33472 (_ BitVec 64)) (t!46961 List!32267)) )
))
(declare-fun arrayNoDuplicates!0 (array!94723 (_ BitVec 32) List!32267) Bool)

(assert (=> b!1385201 (= res!926487 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32264))))

(declare-fun b!1385202 () Bool)

(declare-fun res!926488 () Bool)

(assert (=> b!1385202 (=> (not res!926488) (not e!784853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385202 (= res!926488 (validKeyInArray!0 (select (arr!45739 a!2938) i!1065)))))

(assert (= (and start!118420 res!926486) b!1385199))

(assert (= (and b!1385199 res!926484) b!1385202))

(assert (= (and b!1385202 res!926488) b!1385201))

(assert (= (and b!1385201 res!926487) b!1385198))

(assert (= (and b!1385198 res!926485) b!1385200))

(declare-fun m!1270533 () Bool)

(assert (=> b!1385200 m!1270533))

(assert (=> b!1385202 m!1270533))

(assert (=> b!1385202 m!1270533))

(declare-fun m!1270535 () Bool)

(assert (=> b!1385202 m!1270535))

(declare-fun m!1270537 () Bool)

(assert (=> b!1385198 m!1270537))

(declare-fun m!1270539 () Bool)

(assert (=> start!118420 m!1270539))

(declare-fun m!1270541 () Bool)

(assert (=> start!118420 m!1270541))

(declare-fun m!1270543 () Bool)

(assert (=> b!1385201 m!1270543))

(push 1)

(assert (not b!1385202))

(assert (not b!1385201))

(assert (not b!1385198))

(assert (not start!118420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149363 () Bool)

(assert (=> d!149363 (= (validKeyInArray!0 (select (arr!45739 a!2938) i!1065)) (and (not (= (select (arr!45739 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45739 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1385202 d!149363))

(declare-fun b!1385223 () Bool)

(declare-fun e!784872 () Bool)

(declare-fun e!784873 () Bool)

(assert (=> b!1385223 (= e!784872 e!784873)))

(declare-fun c!128801 () Bool)

(assert (=> b!1385223 (= c!128801 (validKeyInArray!0 (select (arr!45739 a!2938) #b00000000000000000000000000000000)))))

(declare-fun bm!66537 () Bool)

(declare-fun call!66540 () Bool)

(assert (=> bm!66537 (= call!66540 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128801 (Cons!32263 (select (arr!45739 a!2938) #b00000000000000000000000000000000) Nil!32264) Nil!32264)))))

(declare-fun b!1385224 () Bool)

(assert (=> b!1385224 (= e!784873 call!66540)))

(declare-fun b!1385225 () Bool)

(declare-fun e!784871 () Bool)

(declare-fun contains!9743 (List!32267 (_ BitVec 64)) Bool)

(assert (=> b!1385225 (= e!784871 (contains!9743 Nil!32264 (select (arr!45739 a!2938) #b00000000000000000000000000000000)))))

(declare-fun d!149365 () Bool)

(declare-fun res!926501 () Bool)

(declare-fun e!784870 () Bool)

(assert (=> d!149365 (=> res!926501 e!784870)))

(assert (=> d!149365 (= res!926501 (bvsge #b00000000000000000000000000000000 (size!46289 a!2938)))))

(assert (=> d!149365 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32264) e!784870)))

(declare-fun b!1385226 () Bool)

(assert (=> b!1385226 (= e!784870 e!784872)))

(declare-fun res!926503 () Bool)

(assert (=> b!1385226 (=> (not res!926503) (not e!784872))))

(assert (=> b!1385226 (= res!926503 (not e!784871))))

(declare-fun res!926502 () Bool)

(assert (=> b!1385226 (=> (not res!926502) (not e!784871))))

(assert (=> b!1385226 (= res!926502 (validKeyInArray!0 (select (arr!45739 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1385227 () Bool)

(assert (=> b!1385227 (= e!784873 call!66540)))

(assert (= (and d!149365 (not res!926501)) b!1385226))

(assert (= (and b!1385226 res!926502) b!1385225))

(assert (= (and b!1385226 res!926503) b!1385223))

(assert (= (and b!1385223 c!128801) b!1385224))

(assert (= (and b!1385223 (not c!128801)) b!1385227))

(assert (= (or b!1385224 b!1385227) bm!66537))

(declare-fun m!1270545 () Bool)

(assert (=> b!1385223 m!1270545))

(assert (=> b!1385223 m!1270545))

(declare-fun m!1270547 () Bool)

(assert (=> b!1385223 m!1270547))

(assert (=> bm!66537 m!1270545))

(declare-fun m!1270549 () Bool)

(assert (=> bm!66537 m!1270549))

(assert (=> b!1385225 m!1270545))

(assert (=> b!1385225 m!1270545))

(declare-fun m!1270551 () Bool)

(assert (=> b!1385225 m!1270551))

(assert (=> b!1385226 m!1270545))

(assert (=> b!1385226 m!1270545))

(assert (=> b!1385226 m!1270547))

(assert (=> b!1385201 d!149365))

(declare-fun b!1385264 () Bool)

(declare-fun e!784904 () Bool)

(declare-fun call!66549 () Bool)

