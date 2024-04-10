; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117738 () Bool)

(assert start!117738)

(declare-fun res!922791 () Bool)

(declare-fun e!782840 () Bool)

(assert (=> start!117738 (=> (not res!922791) (not e!782840))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94220 0))(
  ( (array!94221 (arr!45500 (Array (_ BitVec 32) (_ BitVec 64))) (size!46050 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94220)

(assert (=> start!117738 (= res!922791 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46050 a!3464)) (bvslt (size!46050 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117738 e!782840))

(assert (=> start!117738 true))

(declare-fun array_inv!34528 (array!94220) Bool)

(assert (=> start!117738 (array_inv!34528 a!3464)))

(declare-fun b!1381091 () Bool)

(declare-fun res!922792 () Bool)

(assert (=> b!1381091 (=> (not res!922792) (not e!782840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381091 (= res!922792 (validKeyInArray!0 (select (arr!45500 a!3464) from!2839)))))

(declare-fun lt!608151 () (_ BitVec 32))

(declare-fun b!1381092 () Bool)

(assert (=> b!1381092 (= e!782840 (or (bvslt lt!608151 #b00000000000000000000000000000000) (bvsgt lt!608151 (bvsub (size!46050 a!3464) from!2839))))))

(declare-fun arrayCountValidKeys!0 (array!94220 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1381092 (= lt!608151 (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94)))))

(assert (= (and start!117738 res!922791) b!1381091))

(assert (= (and b!1381091 res!922792) b!1381092))

(declare-fun m!1266327 () Bool)

(assert (=> start!117738 m!1266327))

(declare-fun m!1266329 () Bool)

(assert (=> b!1381091 m!1266329))

(assert (=> b!1381091 m!1266329))

(declare-fun m!1266331 () Bool)

(assert (=> b!1381091 m!1266331))

(declare-fun m!1266333 () Bool)

(assert (=> b!1381092 m!1266333))

(push 1)

(assert (not b!1381091))

(assert (not b!1381092))

(assert (not start!117738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148987 () Bool)

(assert (=> d!148987 (= (validKeyInArray!0 (select (arr!45500 a!3464) from!2839)) (and (not (= (select (arr!45500 a!3464) from!2839) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45500 a!3464) from!2839) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381091 d!148987))

(declare-fun b!1381125 () Bool)

(declare-fun e!782863 () (_ BitVec 32))

(assert (=> b!1381125 (= e!782863 #b00000000000000000000000000000000)))

(declare-fun call!66505 () (_ BitVec 32))

(declare-fun bm!66502 () Bool)

(assert (=> bm!66502 (= call!66505 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839 #b00000000000000000000000000000001) to!94))))

(declare-fun b!1381126 () Bool)

(declare-fun e!782864 () (_ BitVec 32))

(assert (=> b!1381126 (= e!782863 e!782864)))

(declare-fun c!128600 () Bool)

(assert (=> b!1381126 (= c!128600 (validKeyInArray!0 (select (arr!45500 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun b!1381127 () Bool)

(assert (=> b!1381127 (= e!782864 call!66505)))

(declare-fun b!1381128 () Bool)

(assert (=> b!1381128 (= e!782864 (bvadd #b00000000000000000000000000000001 call!66505))))

(declare-fun d!148989 () Bool)

(declare-fun lt!608163 () (_ BitVec 32))

(assert (=> d!148989 (and (bvsge lt!608163 #b00000000000000000000000000000000) (bvsle lt!608163 (bvsub (size!46050 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(assert (=> d!148989 (= lt!608163 e!782863)))

(declare-fun c!128601 () Bool)

(assert (=> d!148989 (= c!128601 (bvsge (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (=> d!148989 (and (bvsle (bvadd #b00000000000000000000000000000001 from!2839) to!94) (bvsge (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000) (bvsle to!94 (size!46050 a!3464)))))

(assert (=> d!148989 (= (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94) lt!608163)))

(assert (= (and d!148989 c!128601) b!1381125))

(assert (= (and d!148989 (not c!128601)) b!1381126))

(assert (= (and b!1381126 c!128600) b!1381128))

(assert (= (and b!1381126 (not c!128600)) b!1381127))

(assert (= (or b!1381128 b!1381127) bm!66502))

(declare-fun m!1266357 () Bool)

(assert (=> bm!66502 m!1266357))

(declare-fun m!1266359 () Bool)

(assert (=> b!1381126 m!1266359))

(assert (=> b!1381126 m!1266359))

(declare-fun m!1266361 () Bool)

(assert (=> b!1381126 m!1266361))

(assert (=> b!1381092 d!148989))

(declare-fun d!148997 () Bool)

(assert (=> d!148997 (= (array_inv!34528 a!3464) (bvsge (size!46050 a!3464) #b00000000000000000000000000000000))))

(assert (=> start!117738 d!148997))

(push 1)

(assert (not bm!66502))

(assert (not b!1381126))

(check-sat)

