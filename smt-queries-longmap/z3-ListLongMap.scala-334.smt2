; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6118 () Bool)

(assert start!6118)

(declare-fun res!25084 () Bool)

(declare-fun e!26630 () Bool)

(assert (=> start!6118 (=> (not res!25084) (not e!26630))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6118 (= res!25084 (validMask!0 mask!853))))

(assert (=> start!6118 e!26630))

(assert (=> start!6118 true))

(declare-fun b!42104 () Bool)

(assert (=> b!42104 (= e!26630 (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111))))

(assert (= (and start!6118 res!25084) b!42104))

(declare-fun m!35669 () Bool)

(assert (=> start!6118 m!35669))

(check-sat (not start!6118))
(check-sat)
(get-model)

(declare-fun d!7561 () Bool)

(assert (=> d!7561 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6118 d!7561))

(check-sat)
