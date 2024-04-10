; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71718 () Bool)

(assert start!71718)

(declare-fun res!567029 () Bool)

(declare-fun e!465285 () Bool)

(assert (=> start!71718 (=> (not res!567029) (not e!465285))))

(declare-fun oldMask!5 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71718 (= res!567029 (validMask!0 oldMask!5))))

(assert (=> start!71718 e!465285))

(assert (=> start!71718 true))

(declare-fun _vacant!10 () (_ BitVec 32))

(declare-fun _size!10 () (_ BitVec 32))

(declare-fun b!833978 () Bool)

(declare-fun m!52 () (_ BitVec 32))

(assert (=> b!833978 (= e!465285 (and (bvsge _size!10 #b00000000000000000000000000000000) (bvsle _size!10 (bvadd #b00000000000000000000000000000001 oldMask!5)) (bvsge _vacant!10 #b00000000000000000000000000000000) (bvsgt m!52 #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 _size!10) m!52) (bvsge (bvadd #b00000000000000000000000000000001 (bvand (bvashr m!52 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) _size!10) (bvslt m!52 #b00000000000000000000000000000000)))))

(assert (= (and start!71718 res!567029) b!833978))

(declare-fun m!778932 () Bool)

(assert (=> start!71718 m!778932))

(check-sat (not start!71718))
(check-sat)
