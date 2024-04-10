; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118416 () Bool)

(assert start!118416)

(declare-fun b!1385168 () Bool)

(declare-fun res!926454 () Bool)

(declare-fun e!784840 () Bool)

(assert (=> b!1385168 (=> (not res!926454) (not e!784840))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-datatypes ((array!94719 0))(
  ( (array!94720 (arr!45737 (Array (_ BitVec 32) (_ BitVec 64))) (size!46287 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94719)

(assert (=> b!1385168 (= res!926454 (and (= (size!46287 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46287 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46287 a!2938))))))

(declare-fun b!1385169 () Bool)

(assert (=> b!1385169 (= e!784840 (or (= (select (arr!45737 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!45737 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1385170 () Bool)

(declare-fun res!926456 () Bool)

(assert (=> b!1385170 (=> (not res!926456) (not e!784840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385170 (= res!926456 (validKeyInArray!0 (select (arr!45737 a!2938) i!1065)))))

(declare-fun res!926455 () Bool)

(assert (=> start!118416 (=> (not res!926455) (not e!784840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118416 (= res!926455 (validMask!0 mask!2987))))

(assert (=> start!118416 e!784840))

(assert (=> start!118416 true))

(declare-fun array_inv!34765 (array!94719) Bool)

(assert (=> start!118416 (array_inv!34765 a!2938)))

(declare-fun b!1385171 () Bool)

(declare-fun res!926457 () Bool)

(assert (=> b!1385171 (=> (not res!926457) (not e!784840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94719 (_ BitVec 32)) Bool)

(assert (=> b!1385171 (= res!926457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385172 () Bool)

(declare-fun res!926458 () Bool)

(assert (=> b!1385172 (=> (not res!926458) (not e!784840))))

(declare-datatypes ((List!32265 0))(
  ( (Nil!32262) (Cons!32261 (h!33470 (_ BitVec 64)) (t!46959 List!32265)) )
))
(declare-fun arrayNoDuplicates!0 (array!94719 (_ BitVec 32) List!32265) Bool)

(assert (=> b!1385172 (= res!926458 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32262))))

(assert (= (and start!118416 res!926455) b!1385168))

(assert (= (and b!1385168 res!926454) b!1385170))

(assert (= (and b!1385170 res!926456) b!1385172))

(assert (= (and b!1385172 res!926458) b!1385171))

(assert (= (and b!1385171 res!926457) b!1385169))

(declare-fun m!1270509 () Bool)

(assert (=> start!118416 m!1270509))

(declare-fun m!1270511 () Bool)

(assert (=> start!118416 m!1270511))

(declare-fun m!1270513 () Bool)

(assert (=> b!1385169 m!1270513))

(declare-fun m!1270515 () Bool)

(assert (=> b!1385171 m!1270515))

(assert (=> b!1385170 m!1270513))

(assert (=> b!1385170 m!1270513))

(declare-fun m!1270517 () Bool)

(assert (=> b!1385170 m!1270517))

(declare-fun m!1270519 () Bool)

(assert (=> b!1385172 m!1270519))

(push 1)

(assert (not b!1385170))

(assert (not start!118416))

(assert (not b!1385172))

(assert (not b!1385171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149359 () Bool)

(assert (=> d!149359 (= (validKeyInArray!0 (select (arr!45737 a!2938) i!1065)) (and (not (= (select (arr!45737 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45737 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1385170 d!149359))

(declare-fun d!149361 () Bool)

(assert (=> d!149361 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118416 d!149361))

(declare-fun d!149375 () Bool)

(assert (=> d!149375 (= (array_inv!34765 a!2938) (bvsge (size!46287 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118416 d!149375))

(declare-fun d!149379 () Bool)

(declare-fun res!926521 () Bool)

(declare-fun e!784899 () Bool)

(assert (=> d!149379 (=> res!926521 e!784899)))

(assert (=> d!149379 (= res!926521 (bvsge #b00000000000000000000000000000000 (size!46287 a!2938)))))

(assert (=> d!149379 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32262) e!784899)))

(declare-fun b!1385259 () Bool)

(declare-fun e!784901 () Bool)

(declare-fun call!66548 () Bool)

(assert (=> b!1385259 (= e!784901 call!66548)))

(declare-fun bm!66545 () Bool)

(declare-fun c!128809 () Bool)

(assert (=> bm!66545 (= call!66548 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128809 (Cons!32261 (select (arr!45737 a!2938) #b00000000000000000000000000000000) Nil!32262) Nil!32262)))))

(declare-fun b!1385260 () Bool)

(assert (=> b!1385260 (= e!784901 call!66548)))

(declare-fun b!1385261 () Bool)

(declare-fun e!784898 () Bool)

(assert (=> b!1385261 (= e!784899 e!784898)))

(declare-fun res!926522 () Bool)

(assert (=> b!1385261 (=> (not res!926522) (not e!784898))))

(declare-fun e!784900 () Bool)

(assert (=> b!1385261 (= res!926522 (not e!784900))))

(declare-fun res!926523 () Bool)

(assert (=> b!1385261 (=> (not res!926523) (not e!784900))))

(assert (=> b!1385261 (= res!926523 (validKeyInArray!0 (select (arr!45737 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1385262 () Bool)

(assert (=> b!1385262 (= e!784898 e!784901)))

(assert (=> b!1385262 (= c!128809 (validKeyInArray!0 (select (arr!45737 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1385263 () Bool)

(declare-fun contains!9744 (List!32265 (_ BitVec 64)) Bool)

(assert (=> b!1385263 (= e!784900 (contains!9744 Nil!32262 (select (arr!45737 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149379 (not res!926521)) b!1385261))

(assert (= (and b!1385261 res!926523) b!1385263))

(assert (= (and b!1385261 res!926522) b!1385262))

(assert (= (and b!1385262 c!128809) b!1385260))

(assert (= (and b!1385262 (not c!128809)) b!1385259))

(assert (= (or b!1385260 b!1385259) bm!66545))

(declare-fun m!1270561 () Bool)

(assert (=> bm!66545 m!1270561))

(declare-fun m!1270563 () Bool)

(assert (=> bm!66545 m!1270563))

(assert (=> b!1385261 m!1270561))

(assert (=> b!1385261 m!1270561))

(declare-fun m!1270565 () Bool)

(assert (=> b!1385261 m!1270565))

(assert (=> b!1385262 m!1270561))

(assert (=> b!1385262 m!1270561))

(assert (=> b!1385262 m!1270565))

(assert (=> b!1385263 m!1270561))

(assert (=> b!1385263 m!1270561))

(declare-fun m!1270567 () Bool)

(assert (=> b!1385263 m!1270567))

(assert (=> b!1385172 d!149379))

(declare-fun b!1385280 () Bool)

(declare-fun e!784915 () Bool)

(declare-fun e!784916 () Bool)

(assert (=> b!1385280 (= e!784915 e!784916)))

(declare-fun c!128814 () Bool)

(assert (=> b!1385280 (= c!128814 (validKeyInArray!0 (select (arr!45737 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1385281 () Bool)

(declare-fun call!66553 () Bool)

(assert (=> b!1385281 (= e!784916 call!66553)))

(declare-fun bm!66550 () Bool)

(assert (=> bm!66550 (= call!66553 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1385282 () Bool)

(declare-fun e!784914 () Bool)

(assert (=> b!1385282 (= e!784914 call!66553)))

(declare-fun d!149381 () Bool)

(declare-fun res!926532 () Bool)

(assert (=> d!149381 (=> res!926532 e!784915)))

(assert (=> d!149381 (= res!926532 (bvsge #b00000000000000000000000000000000 (size!46287 a!2938)))))

(assert (=> d!149381 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!784915)))

(declare-fun b!1385283 () Bool)

(assert (=> b!1385283 (= e!784916 e!784914)))

