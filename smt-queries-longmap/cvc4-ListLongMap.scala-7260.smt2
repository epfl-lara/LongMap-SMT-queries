; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92686 () Bool)

(assert start!92686)

(declare-fun b!1053325 () Bool)

(declare-fun res!702379 () Bool)

(declare-fun e!598198 () Bool)

(assert (=> b!1053325 (=> (not res!702379) (not e!598198))))

(declare-datatypes ((array!66433 0))(
  ( (array!66434 (arr!31953 (Array (_ BitVec 32) (_ BitVec 64))) (size!32489 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66433)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053325 (= res!702379 (= (select (arr!31953 a!3488) i!1381) k!2747))))

(declare-fun b!1053326 () Bool)

(declare-fun res!702382 () Bool)

(assert (=> b!1053326 (=> (not res!702382) (not e!598198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053326 (= res!702382 (validKeyInArray!0 k!2747))))

(declare-fun res!702380 () Bool)

(assert (=> start!92686 (=> (not res!702380) (not e!598198))))

(assert (=> start!92686 (= res!702380 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32489 a!3488)) (bvslt (size!32489 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92686 e!598198))

(assert (=> start!92686 true))

(declare-fun array_inv!24733 (array!66433) Bool)

(assert (=> start!92686 (array_inv!24733 a!3488)))

(declare-fun lt!465125 () (_ BitVec 32))

(declare-fun e!598196 () Bool)

(declare-fun b!1053327 () Bool)

(assert (=> b!1053327 (= e!598196 (and (not (= lt!465125 i!1381)) (not (= (select (store (arr!31953 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465125) k!2747))))))

(declare-fun lt!465126 () array!66433)

(declare-fun arrayScanForKey!0 (array!66433 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053327 (= lt!465125 (arrayScanForKey!0 lt!465126 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053328 () Bool)

(assert (=> b!1053328 (= e!598198 e!598196)))

(declare-fun res!702381 () Bool)

(assert (=> b!1053328 (=> (not res!702381) (not e!598196))))

(declare-fun arrayContainsKey!0 (array!66433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053328 (= res!702381 (arrayContainsKey!0 lt!465126 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053328 (= lt!465126 (array!66434 (store (arr!31953 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32489 a!3488)))))

(declare-fun b!1053329 () Bool)

(declare-fun res!702383 () Bool)

(assert (=> b!1053329 (=> (not res!702383) (not e!598198))))

(declare-datatypes ((List!22265 0))(
  ( (Nil!22262) (Cons!22261 (h!23470 (_ BitVec 64)) (t!31572 List!22265)) )
))
(declare-fun arrayNoDuplicates!0 (array!66433 (_ BitVec 32) List!22265) Bool)

(assert (=> b!1053329 (= res!702383 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22262))))

(assert (= (and start!92686 res!702380) b!1053329))

(assert (= (and b!1053329 res!702383) b!1053326))

(assert (= (and b!1053326 res!702382) b!1053325))

(assert (= (and b!1053325 res!702379) b!1053328))

(assert (= (and b!1053328 res!702381) b!1053327))

(declare-fun m!973651 () Bool)

(assert (=> b!1053326 m!973651))

(declare-fun m!973653 () Bool)

(assert (=> b!1053327 m!973653))

(declare-fun m!973655 () Bool)

(assert (=> b!1053327 m!973655))

(declare-fun m!973657 () Bool)

(assert (=> b!1053327 m!973657))

(declare-fun m!973659 () Bool)

(assert (=> b!1053328 m!973659))

(assert (=> b!1053328 m!973653))

(declare-fun m!973661 () Bool)

(assert (=> b!1053325 m!973661))

(declare-fun m!973663 () Bool)

(assert (=> start!92686 m!973663))

(declare-fun m!973665 () Bool)

(assert (=> b!1053329 m!973665))

(push 1)

(assert (not b!1053327))

(assert (not b!1053326))

(assert (not start!92686))

(assert (not b!1053328))

(assert (not b!1053329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127873 () Bool)

(assert (=> d!127873 (= (array_inv!24733 a!3488) (bvsge (size!32489 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92686 d!127873))

(declare-fun d!127875 () Bool)

(declare-fun lt!465129 () (_ BitVec 32))

(assert (=> d!127875 (and (or (bvslt lt!465129 #b00000000000000000000000000000000) (bvsge lt!465129 (size!32489 lt!465126)) (and (bvsge lt!465129 #b00000000000000000000000000000000) (bvslt lt!465129 (size!32489 lt!465126)))) (bvsge lt!465129 #b00000000000000000000000000000000) (bvslt lt!465129 (size!32489 lt!465126)) (= (select (arr!31953 lt!465126) lt!465129) k!2747))))

(declare-fun e!598213 () (_ BitVec 32))

(assert (=> d!127875 (= lt!465129 e!598213)))

(declare-fun c!106938 () Bool)

(assert (=> d!127875 (= c!106938 (= (select (arr!31953 lt!465126) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127875 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32489 lt!465126)) (bvslt (size!32489 lt!465126) #b01111111111111111111111111111111))))

(assert (=> d!127875 (= (arrayScanForKey!0 lt!465126 k!2747 #b00000000000000000000000000000000) lt!465129)))

(declare-fun b!1053349 () Bool)

(assert (=> b!1053349 (= e!598213 #b00000000000000000000000000000000)))

(declare-fun b!1053350 () Bool)

(assert (=> b!1053350 (= e!598213 (arrayScanForKey!0 lt!465126 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127875 c!106938) b!1053349))

(assert (= (and d!127875 (not c!106938)) b!1053350))

(declare-fun m!973675 () Bool)

(assert (=> d!127875 m!973675))

(declare-fun m!973677 () Bool)

(assert (=> d!127875 m!973677))

(declare-fun m!973679 () Bool)

(assert (=> b!1053350 m!973679))

(assert (=> b!1053327 d!127875))

(declare-fun d!127887 () Bool)

(assert (=> d!127887 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053326 d!127887))

(declare-fun d!127889 () Bool)

(declare-fun res!702397 () Bool)

(declare-fun e!598221 () Bool)

(assert (=> d!127889 (=> res!702397 e!598221)))

(assert (=> d!127889 (= res!702397 (= (select (arr!31953 lt!465126) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127889 (= (arrayContainsKey!0 lt!465126 k!2747 #b00000000000000000000000000000000) e!598221)))

(declare-fun b!1053361 () Bool)

(declare-fun e!598222 () Bool)

(assert (=> b!1053361 (= e!598221 e!598222)))

(declare-fun res!702398 () Bool)

(assert (=> b!1053361 (=> (not res!702398) (not e!598222))))

(assert (=> b!1053361 (= res!702398 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32489 lt!465126)))))

(declare-fun b!1053362 () Bool)

(assert (=> b!1053362 (= e!598222 (arrayContainsKey!0 lt!465126 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127889 (not res!702397)) b!1053361))

(assert (= (and b!1053361 res!702398) b!1053362))

(assert (=> d!127889 m!973677))

(declare-fun m!973687 () Bool)

(assert (=> b!1053362 m!973687))

(assert (=> b!1053328 d!127889))

(declare-fun b!1053389 () Bool)

(declare-fun e!598245 () Bool)

(declare-fun call!44748 () Bool)

(assert (=> b!1053389 (= e!598245 call!44748)))

(declare-fun b!1053390 () Bool)

(declare-fun e!598247 () Bool)

(declare-fun contains!6166 (List!22265 (_ BitVec 64)) Bool)

(assert (=> b!1053390 (= e!598247 (contains!6166 Nil!22262 (select (arr!31953 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053391 () Bool)

(declare-fun e!598248 () Bool)

(declare-fun e!598246 () Bool)

(assert (=> b!1053391 (= e!598248 e!598246)))

(declare-fun res!702417 () Bool)

(assert (=> b!1053391 (=> (not res!702417) (not e!598246))))

(assert (=> b!1053391 (= res!702417 (not e!598247))))

(declare-fun res!702418 () Bool)

(assert (=> b!1053391 (=> (not res!702418) (not e!598247))))

