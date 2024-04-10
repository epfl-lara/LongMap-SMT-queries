; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6166 () Bool)

(assert start!6166)

(declare-fun res!25155 () Bool)

(declare-fun e!26728 () Bool)

(assert (=> start!6166 (=> (not res!25155) (not e!26728))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6166 (= res!25155 (validMask!0 mask!853))))

(assert (=> start!6166 e!26728))

(assert (=> start!6166 true))

(declare-fun b!42229 () Bool)

(assert (=> b!42229 (= e!26728 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2789 0))(
  ( (array!2790 (arr!1338 (Array (_ BitVec 32) (_ BitVec 64))) (size!1502 (_ BitVec 32))) )
))
(declare-fun lt!17410 () array!2789)

(declare-fun arrayCountValidKeys!0 (array!2789 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42229 (= (arrayCountValidKeys!0 lt!17410 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1107 0))(
  ( (Unit!1108) )
))
(declare-fun lt!17411 () Unit!1107)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2789 (_ BitVec 32) (_ BitVec 32)) Unit!1107)

(assert (=> b!42229 (= lt!17411 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17410 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42229 (= lt!17410 (array!2790 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6166 res!25155) b!42229))

(declare-fun m!35833 () Bool)

(assert (=> start!6166 m!35833))

(declare-fun m!35835 () Bool)

(assert (=> b!42229 m!35835))

(declare-fun m!35837 () Bool)

(assert (=> b!42229 m!35837))

(push 1)

(assert (not b!42229))

(assert (not start!6166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!3287 () Bool)

(declare-fun call!3290 () (_ BitVec 32))

(assert (=> bm!3287 (= call!3290 (arrayCountValidKeys!0 lt!17410 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!7623 () Bool)

(declare-fun lt!17426 () (_ BitVec 32))

(assert (=> d!7623 (and (bvsge lt!17426 #b00000000000000000000000000000000) (bvsle lt!17426 (bvsub (size!1502 lt!17410) #b00000000000000000000000000000000)))))

(declare-fun e!26740 () (_ BitVec 32))

(assert (=> d!7623 (= lt!17426 e!26740)))

(declare-fun c!5291 () Bool)

(assert (=> d!7623 (= c!5291 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7623 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1502 lt!17410)))))

(assert (=> d!7623 (= (arrayCountValidKeys!0 lt!17410 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17426)))

(declare-fun b!42244 () Bool)

(assert (=> b!42244 (= e!26740 #b00000000000000000000000000000000)))

(declare-fun b!42245 () Bool)

(declare-fun e!26739 () (_ BitVec 32))

(assert (=> b!42245 (= e!26740 e!26739)))

(declare-fun c!5290 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42245 (= c!5290 (validKeyInArray!0 (select (arr!1338 lt!17410) #b00000000000000000000000000000000)))))

(declare-fun b!42246 () Bool)

(assert (=> b!42246 (= e!26739 call!3290)))

(declare-fun b!42247 () Bool)

(assert (=> b!42247 (= e!26739 (bvadd #b00000000000000000000000000000001 call!3290))))

(assert (= (and d!7623 c!5291) b!42244))

(assert (= (and d!7623 (not c!5291)) b!42245))

(assert (= (and b!42245 c!5290) b!42247))

(assert (= (and b!42245 (not c!5290)) b!42246))

(assert (= (or b!42247 b!42246) bm!3287))

(declare-fun m!35851 () Bool)

(assert (=> bm!3287 m!35851))

(declare-fun m!35853 () Bool)

(assert (=> b!42245 m!35853))

(assert (=> b!42245 m!35853))

(declare-fun m!35855 () Bool)

(assert (=> b!42245 m!35855))

(assert (=> b!42229 d!7623))

(declare-fun d!7625 () Bool)

(assert (=> d!7625 (= (arrayCountValidKeys!0 lt!17410 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17429 () Unit!1107)

(declare-fun choose!59 (array!2789 (_ BitVec 32) (_ BitVec 32)) Unit!1107)

(assert (=> d!7625 (= lt!17429 (choose!59 lt!17410 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7625 (bvslt (size!1502 lt!17410) #b01111111111111111111111111111111)))

(assert (=> d!7625 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17410 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17429)))

(declare-fun bs!1846 () Bool)

(assert (= bs!1846 d!7625))

(assert (=> bs!1846 m!35835))

(declare-fun m!35857 () Bool)

(assert (=> bs!1846 m!35857))

(assert (=> b!42229 d!7625))

(declare-fun d!7631 () Bool)

(assert (=> d!7631 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6166 d!7631))

(push 1)

(assert (not bm!3287))

(assert (not d!7625))

(assert (not b!42245))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

