; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71696 () Bool)

(assert start!71696)

(declare-fun res!566920 () Bool)

(declare-fun e!465134 () Bool)

(assert (=> start!71696 (=> (not res!566920) (not e!465134))))

(declare-fun oldMask!5 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71696 (= res!566920 (validMask!0 oldMask!5))))

(assert (=> start!71696 e!465134))

(assert (=> start!71696 true))

(declare-fun m!52 () (_ BitVec 32))

(declare-fun b!833733 () Bool)

(declare-fun _vacant!10 () (_ BitVec 32))

(declare-fun _size!10 () (_ BitVec 32))

(assert (=> b!833733 (= e!465134 (and (bvsge _size!10 #b00000000000000000000000000000000) (bvsle _size!10 (bvadd #b00000000000000000000000000000001 oldMask!5)) (bvsge _vacant!10 #b00000000000000000000000000000000) (bvsgt m!52 #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 _size!10) m!52) (bvsge (bvadd #b00000000000000000000000000000001 (bvand (bvashr m!52 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) _size!10) (bvslt m!52 #b00000000000000000000000000000000)))))

(assert (= (and start!71696 res!566920) b!833733))

(declare-fun m!778182 () Bool)

(assert (=> start!71696 m!778182))

(check-sat (not start!71696))
(check-sat)
