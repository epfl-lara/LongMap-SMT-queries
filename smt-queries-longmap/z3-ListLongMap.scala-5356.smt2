; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71702 () Bool)

(assert start!71702)

(declare-fun res!566929 () Bool)

(declare-fun e!465143 () Bool)

(assert (=> start!71702 (=> (not res!566929) (not e!465143))))

(declare-fun oldMask!5 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71702 (= res!566929 (validMask!0 oldMask!5))))

(assert (=> start!71702 e!465143))

(assert (=> start!71702 true))

(declare-fun m!52 () (_ BitVec 32))

(declare-fun b!833742 () Bool)

(declare-fun _vacant!10 () (_ BitVec 32))

(declare-fun _size!10 () (_ BitVec 32))

(assert (=> b!833742 (= e!465143 (and (bvsge _size!10 #b00000000000000000000000000000000) (bvsle _size!10 (bvadd #b00000000000000000000000000000001 oldMask!5)) (bvsge _vacant!10 #b00000000000000000000000000000000) (bvsgt m!52 #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 _size!10) m!52) (bvsge (bvadd #b00000000000000000000000000000001 (bvand (bvashr m!52 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) _size!10) (bvsgt (bvlshr m!52 #b00000000000000000000000000000001) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 _size!10) (bvlshr m!52 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 (bvand (bvashr (bvlshr m!52 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) _size!10) (bvsge (bvlshr m!52 #b00000000000000000000000000000001) m!52)))))

(assert (= (and start!71702 res!566929) b!833742))

(declare-fun m!778188 () Bool)

(assert (=> start!71702 m!778188))

(check-sat (not start!71702))
(check-sat)
