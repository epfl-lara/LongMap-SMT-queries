; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92880 () Bool)

(assert start!92880)

(declare-fun b!1054484 () Bool)

(declare-fun res!702772 () Bool)

(declare-fun e!598931 () Bool)

(assert (=> b!1054484 (=> (not res!702772) (not e!598931))))

(declare-datatypes ((array!66469 0))(
  ( (array!66470 (arr!31966 (Array (_ BitVec 32) (_ BitVec 64))) (size!32503 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66469)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054484 (= res!702772 (= (select (arr!31966 a!3488) i!1381) k0!2747))))

(declare-fun res!702770 () Bool)

(assert (=> start!92880 (=> (not res!702770) (not e!598931))))

(assert (=> start!92880 (= res!702770 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32503 a!3488)) (bvslt (size!32503 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92880 e!598931))

(assert (=> start!92880 true))

(declare-fun array_inv!24748 (array!66469) Bool)

(assert (=> start!92880 (array_inv!24748 a!3488)))

(declare-fun b!1054485 () Bool)

(declare-fun res!702769 () Bool)

(assert (=> b!1054485 (=> (not res!702769) (not e!598931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054485 (= res!702769 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054486 () Bool)

(declare-fun e!598932 () Bool)

(assert (=> b!1054486 (= e!598931 e!598932)))

(declare-fun res!702771 () Bool)

(assert (=> b!1054486 (=> (not res!702771) (not e!598932))))

(declare-fun lt!465602 () array!66469)

(declare-fun arrayContainsKey!0 (array!66469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054486 (= res!702771 (arrayContainsKey!0 lt!465602 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054486 (= lt!465602 (array!66470 (store (arr!31966 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32503 a!3488)))))

(declare-fun lt!465601 () (_ BitVec 32))

(declare-fun b!1054487 () Bool)

(assert (=> b!1054487 (= e!598932 (and (not (= lt!465601 i!1381)) (or (bvslt lt!465601 #b00000000000000000000000000000000) (bvsge lt!465601 (size!32503 a!3488)))))))

(declare-fun arrayScanForKey!0 (array!66469 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054487 (= lt!465601 (arrayScanForKey!0 lt!465602 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054488 () Bool)

(declare-fun res!702773 () Bool)

(assert (=> b!1054488 (=> (not res!702773) (not e!598931))))

(declare-datatypes ((List!22248 0))(
  ( (Nil!22245) (Cons!22244 (h!23462 (_ BitVec 64)) (t!31547 List!22248)) )
))
(declare-fun arrayNoDuplicates!0 (array!66469 (_ BitVec 32) List!22248) Bool)

(assert (=> b!1054488 (= res!702773 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22245))))

(assert (= (and start!92880 res!702770) b!1054488))

(assert (= (and b!1054488 res!702773) b!1054485))

(assert (= (and b!1054485 res!702769) b!1054484))

(assert (= (and b!1054484 res!702772) b!1054486))

(assert (= (and b!1054486 res!702771) b!1054487))

(declare-fun m!975197 () Bool)

(assert (=> b!1054488 m!975197))

(declare-fun m!975199 () Bool)

(assert (=> b!1054487 m!975199))

(declare-fun m!975201 () Bool)

(assert (=> start!92880 m!975201))

(declare-fun m!975203 () Bool)

(assert (=> b!1054486 m!975203))

(declare-fun m!975205 () Bool)

(assert (=> b!1054486 m!975205))

(declare-fun m!975207 () Bool)

(assert (=> b!1054484 m!975207))

(declare-fun m!975209 () Bool)

(assert (=> b!1054485 m!975209))

(check-sat (not b!1054485) (not b!1054488) (not start!92880) (not b!1054487) (not b!1054486))
(check-sat)
(get-model)

(declare-fun bm!44798 () Bool)

(declare-fun call!44801 () Bool)

(declare-fun c!107327 () Bool)

(assert (=> bm!44798 (= call!44801 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107327 (Cons!22244 (select (arr!31966 a!3488) #b00000000000000000000000000000000) Nil!22245) Nil!22245)))))

(declare-fun d!128301 () Bool)

(declare-fun res!702816 () Bool)

(declare-fun e!598966 () Bool)

(assert (=> d!128301 (=> res!702816 e!598966)))

(assert (=> d!128301 (= res!702816 (bvsge #b00000000000000000000000000000000 (size!32503 a!3488)))))

(assert (=> d!128301 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22245) e!598966)))

(declare-fun b!1054535 () Bool)

(declare-fun e!598967 () Bool)

(assert (=> b!1054535 (= e!598966 e!598967)))

(declare-fun res!702818 () Bool)

(assert (=> b!1054535 (=> (not res!702818) (not e!598967))))

(declare-fun e!598969 () Bool)

(assert (=> b!1054535 (= res!702818 (not e!598969))))

(declare-fun res!702817 () Bool)

(assert (=> b!1054535 (=> (not res!702817) (not e!598969))))

(assert (=> b!1054535 (= res!702817 (validKeyInArray!0 (select (arr!31966 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054536 () Bool)

(declare-fun e!598968 () Bool)

(assert (=> b!1054536 (= e!598968 call!44801)))

(declare-fun b!1054537 () Bool)

(declare-fun contains!6188 (List!22248 (_ BitVec 64)) Bool)

(assert (=> b!1054537 (= e!598969 (contains!6188 Nil!22245 (select (arr!31966 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054538 () Bool)

(assert (=> b!1054538 (= e!598968 call!44801)))

(declare-fun b!1054539 () Bool)

(assert (=> b!1054539 (= e!598967 e!598968)))

(assert (=> b!1054539 (= c!107327 (validKeyInArray!0 (select (arr!31966 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128301 (not res!702816)) b!1054535))

(assert (= (and b!1054535 res!702817) b!1054537))

(assert (= (and b!1054535 res!702818) b!1054539))

(assert (= (and b!1054539 c!107327) b!1054536))

(assert (= (and b!1054539 (not c!107327)) b!1054538))

(assert (= (or b!1054536 b!1054538) bm!44798))

(declare-fun m!975243 () Bool)

(assert (=> bm!44798 m!975243))

(declare-fun m!975245 () Bool)

(assert (=> bm!44798 m!975245))

(assert (=> b!1054535 m!975243))

(assert (=> b!1054535 m!975243))

(declare-fun m!975247 () Bool)

(assert (=> b!1054535 m!975247))

(assert (=> b!1054537 m!975243))

(assert (=> b!1054537 m!975243))

(declare-fun m!975249 () Bool)

(assert (=> b!1054537 m!975249))

(assert (=> b!1054539 m!975243))

(assert (=> b!1054539 m!975243))

(assert (=> b!1054539 m!975247))

(assert (=> b!1054488 d!128301))

(declare-fun d!128311 () Bool)

(declare-fun lt!465620 () (_ BitVec 32))

(assert (=> d!128311 (and (or (bvslt lt!465620 #b00000000000000000000000000000000) (bvsge lt!465620 (size!32503 lt!465602)) (and (bvsge lt!465620 #b00000000000000000000000000000000) (bvslt lt!465620 (size!32503 lt!465602)))) (bvsge lt!465620 #b00000000000000000000000000000000) (bvslt lt!465620 (size!32503 lt!465602)) (= (select (arr!31966 lt!465602) lt!465620) k0!2747))))

(declare-fun e!598993 () (_ BitVec 32))

(assert (=> d!128311 (= lt!465620 e!598993)))

(declare-fun c!107336 () Bool)

(assert (=> d!128311 (= c!107336 (= (select (arr!31966 lt!465602) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128311 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32503 lt!465602)) (bvslt (size!32503 lt!465602) #b01111111111111111111111111111111))))

(assert (=> d!128311 (= (arrayScanForKey!0 lt!465602 k0!2747 #b00000000000000000000000000000000) lt!465620)))

(declare-fun b!1054571 () Bool)

(assert (=> b!1054571 (= e!598993 #b00000000000000000000000000000000)))

(declare-fun b!1054572 () Bool)

(assert (=> b!1054572 (= e!598993 (arrayScanForKey!0 lt!465602 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128311 c!107336) b!1054571))

(assert (= (and d!128311 (not c!107336)) b!1054572))

(declare-fun m!975267 () Bool)

(assert (=> d!128311 m!975267))

(declare-fun m!975269 () Bool)

(assert (=> d!128311 m!975269))

(declare-fun m!975271 () Bool)

(assert (=> b!1054572 m!975271))

(assert (=> b!1054487 d!128311))

(declare-fun d!128321 () Bool)

(declare-fun res!702844 () Bool)

(declare-fun e!599006 () Bool)

(assert (=> d!128321 (=> res!702844 e!599006)))

(assert (=> d!128321 (= res!702844 (= (select (arr!31966 lt!465602) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128321 (= (arrayContainsKey!0 lt!465602 k0!2747 #b00000000000000000000000000000000) e!599006)))

(declare-fun b!1054587 () Bool)

(declare-fun e!599007 () Bool)

(assert (=> b!1054587 (= e!599006 e!599007)))

(declare-fun res!702845 () Bool)

(assert (=> b!1054587 (=> (not res!702845) (not e!599007))))

(assert (=> b!1054587 (= res!702845 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32503 lt!465602)))))

(declare-fun b!1054588 () Bool)

(assert (=> b!1054588 (= e!599007 (arrayContainsKey!0 lt!465602 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128321 (not res!702844)) b!1054587))

(assert (= (and b!1054587 res!702845) b!1054588))

(assert (=> d!128321 m!975269))

(declare-fun m!975273 () Bool)

(assert (=> b!1054588 m!975273))

(assert (=> b!1054486 d!128321))

(declare-fun d!128323 () Bool)

(assert (=> d!128323 (= (array_inv!24748 a!3488) (bvsge (size!32503 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92880 d!128323))

(declare-fun d!128325 () Bool)

(assert (=> d!128325 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054485 d!128325))

(check-sat (not b!1054539) (not b!1054537) (not b!1054572) (not bm!44798) (not b!1054588) (not b!1054535))
(check-sat)
