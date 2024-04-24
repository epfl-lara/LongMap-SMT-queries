; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71888 () Bool)

(assert start!71888)

(declare-fun res!567381 () Bool)

(declare-fun e!465871 () Bool)

(assert (=> start!71888 (=> (not res!567381) (not e!465871))))

(declare-fun oldMask!5 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71888 (= res!567381 (validMask!0 oldMask!5))))

(assert (=> start!71888 e!465871))

(assert (=> start!71888 true))

(declare-fun m!52 () (_ BitVec 32))

(declare-fun b!834882 () Bool)

(declare-fun _vacant!10 () (_ BitVec 32))

(declare-fun _size!10 () (_ BitVec 32))

(assert (=> b!834882 (= e!465871 (and (bvsge _size!10 #b00000000000000000000000000000000) (bvsle _size!10 (bvadd #b00000000000000000000000000000001 oldMask!5)) (bvsge _vacant!10 #b00000000000000000000000000000000) (bvsgt m!52 #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 _size!10) m!52) (bvsge (bvadd #b00000000000000000000000000000001 (bvand (bvashr m!52 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) _size!10) (bvsgt (bvlshr m!52 #b00000000000000000000000000000001) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 _size!10) (bvlshr m!52 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 (bvand (bvashr (bvlshr m!52 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) _size!10) (bvsge (bvlshr m!52 #b00000000000000000000000000000001) m!52)))))

(assert (= (and start!71888 res!567381) b!834882))

(declare-fun m!780222 () Bool)

(assert (=> start!71888 m!780222))

(check-sat (not start!71888))
(check-sat)
