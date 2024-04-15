; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6160 () Bool)

(assert start!6160)

(declare-fun res!25129 () Bool)

(declare-fun e!26675 () Bool)

(assert (=> start!6160 (=> (not res!25129) (not e!26675))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6160 (= res!25129 (validMask!0 mask!853))))

(assert (=> start!6160 e!26675))

(assert (=> start!6160 true))

(declare-fun b!42149 () Bool)

(assert (=> b!42149 (= e!26675 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2763 0))(
  ( (array!2764 (arr!1325 (Array (_ BitVec 32) (_ BitVec 64))) (size!1489 (_ BitVec 32))) )
))
(declare-fun lt!17392 () array!2763)

(declare-fun arrayCountValidKeys!0 (array!2763 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42149 (= (arrayCountValidKeys!0 lt!17392 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1114 0))(
  ( (Unit!1115) )
))
(declare-fun lt!17393 () Unit!1114)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2763 (_ BitVec 32) (_ BitVec 32)) Unit!1114)

(assert (=> b!42149 (= lt!17393 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17392 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42149 (= lt!17392 (array!2764 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6160 res!25129) b!42149))

(declare-fun m!35735 () Bool)

(assert (=> start!6160 m!35735))

(declare-fun m!35737 () Bool)

(assert (=> b!42149 m!35737))

(declare-fun m!35739 () Bool)

(assert (=> b!42149 m!35739))

(check-sat (not b!42149) (not start!6160))
(check-sat)
(get-model)

(declare-fun b!42180 () Bool)

(declare-fun e!26695 () (_ BitVec 32))

(declare-fun e!26697 () (_ BitVec 32))

(assert (=> b!42180 (= e!26695 e!26697)))

(declare-fun c!5273 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42180 (= c!5273 (validKeyInArray!0 (select (arr!1325 lt!17392) #b00000000000000000000000000000000)))))

(declare-fun b!42181 () Bool)

(declare-fun call!3292 () (_ BitVec 32))

(assert (=> b!42181 (= e!26697 (bvadd #b00000000000000000000000000000001 call!3292))))

(declare-fun b!42182 () Bool)

(assert (=> b!42182 (= e!26695 #b00000000000000000000000000000000)))

(declare-fun d!7583 () Bool)

(declare-fun lt!17412 () (_ BitVec 32))

(assert (=> d!7583 (and (bvsge lt!17412 #b00000000000000000000000000000000) (bvsle lt!17412 (bvsub (size!1489 lt!17392) #b00000000000000000000000000000000)))))

(assert (=> d!7583 (= lt!17412 e!26695)))

(declare-fun c!5271 () Bool)

(assert (=> d!7583 (= c!5271 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7583 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1489 lt!17392)))))

(assert (=> d!7583 (= (arrayCountValidKeys!0 lt!17392 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17412)))

(declare-fun bm!3288 () Bool)

(assert (=> bm!3288 (= call!3292 (arrayCountValidKeys!0 lt!17392 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42183 () Bool)

(assert (=> b!42183 (= e!26697 call!3292)))

(assert (= (and d!7583 c!5271) b!42182))

(assert (= (and d!7583 (not c!5271)) b!42180))

(assert (= (and b!42180 c!5273) b!42181))

(assert (= (and b!42180 (not c!5273)) b!42183))

(assert (= (or b!42181 b!42183) bm!3288))

(declare-fun m!35754 () Bool)

(assert (=> b!42180 m!35754))

(assert (=> b!42180 m!35754))

(declare-fun m!35762 () Bool)

(assert (=> b!42180 m!35762))

(declare-fun m!35767 () Bool)

(assert (=> bm!3288 m!35767))

(assert (=> b!42149 d!7583))

(declare-fun d!7591 () Bool)

(assert (=> d!7591 (= (arrayCountValidKeys!0 lt!17392 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17423 () Unit!1114)

(declare-fun choose!59 (array!2763 (_ BitVec 32) (_ BitVec 32)) Unit!1114)

(assert (=> d!7591 (= lt!17423 (choose!59 lt!17392 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7591 (bvslt (size!1489 lt!17392) #b01111111111111111111111111111111)))

(assert (=> d!7591 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17392 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17423)))

(declare-fun bs!1844 () Bool)

(assert (= bs!1844 d!7591))

(assert (=> bs!1844 m!35737))

(declare-fun m!35771 () Bool)

(assert (=> bs!1844 m!35771))

(assert (=> b!42149 d!7591))

(declare-fun d!7595 () Bool)

(assert (=> d!7595 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6160 d!7595))

(check-sat (not d!7591) (not b!42180) (not bm!3288))
(check-sat)
