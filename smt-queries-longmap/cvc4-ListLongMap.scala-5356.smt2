; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71726 () Bool)

(assert start!71726)

(declare-fun res!567041 () Bool)

(declare-fun e!465297 () Bool)

(assert (=> start!71726 (=> (not res!567041) (not e!465297))))

(declare-fun oldMask!5 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71726 (= res!567041 (validMask!0 oldMask!5))))

(assert (=> start!71726 e!465297))

(assert (=> start!71726 true))

(declare-fun b!833990 () Bool)

(declare-fun m!52 () (_ BitVec 32))

(declare-fun _vacant!10 () (_ BitVec 32))

(declare-fun _size!10 () (_ BitVec 32))

(assert (=> b!833990 (= e!465297 (and (bvsge _size!10 #b00000000000000000000000000000000) (bvsle _size!10 (bvadd #b00000000000000000000000000000001 oldMask!5)) (bvsge _vacant!10 #b00000000000000000000000000000000) (bvsgt m!52 #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 _size!10) m!52) (bvsge (bvadd #b00000000000000000000000000000001 (bvand (bvashr m!52 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) _size!10) (bvsgt (bvlshr m!52 #b00000000000000000000000000000001) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 _size!10) (bvlshr m!52 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 (bvand (bvashr (bvlshr m!52 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) _size!10) (bvsge (bvlshr m!52 #b00000000000000000000000000000001) m!52)))))

(assert (= (and start!71726 res!567041) b!833990))

(declare-fun m!778940 () Bool)

(assert (=> start!71726 m!778940))

(push 1)

(assert (not start!71726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

