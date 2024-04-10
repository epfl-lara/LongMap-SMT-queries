; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6126 () Bool)

(assert start!6126)

(declare-fun res!25113 () Bool)

(declare-fun e!26686 () Bool)

(assert (=> start!6126 (=> (not res!25113) (not e!26686))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6126 (= res!25113 (validMask!0 mask!853))))

(assert (=> start!6126 e!26686))

(assert (=> start!6126 true))

(declare-fun b!42187 () Bool)

(assert (=> b!42187 (= e!26686 (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111))))

(assert (= (and start!6126 res!25113) b!42187))

(declare-fun m!35769 () Bool)

(assert (=> start!6126 m!35769))

(check-sat (not start!6126))
(check-sat)
(get-model)

(declare-fun d!7601 () Bool)

(assert (=> d!7601 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6126 d!7601))

(check-sat)
