; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6170 () Bool)

(assert start!6170)

(declare-fun res!25130 () Bool)

(declare-fun e!26691 () Bool)

(assert (=> start!6170 (=> (not res!25130) (not e!26691))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6170 (= res!25130 (validMask!0 mask!853))))

(assert (=> start!6170 e!26691))

(assert (=> start!6170 true))

(declare-fun b!42172 () Bool)

(assert (=> b!42172 (= e!26691 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2775 0))(
  ( (array!2776 (arr!1331 (Array (_ BitVec 32) (_ BitVec 64))) (size!1495 (_ BitVec 32))) )
))
(declare-fun lt!17367 () array!2775)

(declare-fun arrayCountValidKeys!0 (array!2775 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42172 (= (arrayCountValidKeys!0 lt!17367 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1119 0))(
  ( (Unit!1120) )
))
(declare-fun lt!17368 () Unit!1119)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2775 (_ BitVec 32) (_ BitVec 32)) Unit!1119)

(assert (=> b!42172 (= lt!17368 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17367 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42172 (= lt!17367 (array!2776 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6170 res!25130) b!42172))

(declare-fun m!35707 () Bool)

(assert (=> start!6170 m!35707))

(declare-fun m!35709 () Bool)

(assert (=> b!42172 m!35709))

(declare-fun m!35711 () Bool)

(assert (=> b!42172 m!35711))

(check-sat (not start!6170) (not b!42172))
(check-sat)
(get-model)

(declare-fun d!7609 () Bool)

(assert (=> d!7609 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6170 d!7609))

(declare-fun d!7617 () Bool)

(declare-fun lt!17391 () (_ BitVec 32))

(assert (=> d!7617 (and (bvsge lt!17391 #b00000000000000000000000000000000) (bvsle lt!17391 (bvsub (size!1495 lt!17367) #b00000000000000000000000000000000)))))

(declare-fun e!26713 () (_ BitVec 32))

(assert (=> d!7617 (= lt!17391 e!26713)))

(declare-fun c!5285 () Bool)

(assert (=> d!7617 (= c!5285 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7617 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1495 lt!17367)))))

(assert (=> d!7617 (= (arrayCountValidKeys!0 lt!17367 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17391)))

(declare-fun b!42207 () Bool)

(declare-fun e!26712 () (_ BitVec 32))

(assert (=> b!42207 (= e!26713 e!26712)))

(declare-fun c!5284 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42207 (= c!5284 (validKeyInArray!0 (select (arr!1331 lt!17367) #b00000000000000000000000000000000)))))

(declare-fun b!42208 () Bool)

(declare-fun call!3279 () (_ BitVec 32))

(assert (=> b!42208 (= e!26712 call!3279)))

(declare-fun b!42209 () Bool)

(assert (=> b!42209 (= e!26713 #b00000000000000000000000000000000)))

(declare-fun bm!3276 () Bool)

(assert (=> bm!3276 (= call!3279 (arrayCountValidKeys!0 lt!17367 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42210 () Bool)

(assert (=> b!42210 (= e!26712 (bvadd #b00000000000000000000000000000001 call!3279))))

(assert (= (and d!7617 c!5285) b!42209))

(assert (= (and d!7617 (not c!5285)) b!42207))

(assert (= (and b!42207 c!5284) b!42210))

(assert (= (and b!42207 (not c!5284)) b!42208))

(assert (= (or b!42210 b!42208) bm!3276))

(declare-fun m!35733 () Bool)

(assert (=> b!42207 m!35733))

(assert (=> b!42207 m!35733))

(declare-fun m!35735 () Bool)

(assert (=> b!42207 m!35735))

(declare-fun m!35737 () Bool)

(assert (=> bm!3276 m!35737))

(assert (=> b!42172 d!7617))

(declare-fun d!7623 () Bool)

(assert (=> d!7623 (= (arrayCountValidKeys!0 lt!17367 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17395 () Unit!1119)

(declare-fun choose!59 (array!2775 (_ BitVec 32) (_ BitVec 32)) Unit!1119)

(assert (=> d!7623 (= lt!17395 (choose!59 lt!17367 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7623 (bvslt (size!1495 lt!17367) #b01111111111111111111111111111111)))

(assert (=> d!7623 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17367 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17395)))

(declare-fun bs!1846 () Bool)

(assert (= bs!1846 d!7623))

(assert (=> bs!1846 m!35709))

(declare-fun m!35743 () Bool)

(assert (=> bs!1846 m!35743))

(assert (=> b!42172 d!7623))

(check-sat (not bm!3276) (not b!42207) (not d!7623))
(check-sat)
