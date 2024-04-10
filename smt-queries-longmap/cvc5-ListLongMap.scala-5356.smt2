; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71722 () Bool)

(assert start!71722)

(declare-fun res!567035 () Bool)

(declare-fun e!465291 () Bool)

(assert (=> start!71722 (=> (not res!567035) (not e!465291))))

(declare-fun oldMask!5 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71722 (= res!567035 (validMask!0 oldMask!5))))

(assert (=> start!71722 e!465291))

(assert (=> start!71722 true))

(declare-fun b!833984 () Bool)

(declare-fun m!52 () (_ BitVec 32))

(declare-fun _vacant!10 () (_ BitVec 32))

(declare-fun _size!10 () (_ BitVec 32))

(assert (=> b!833984 (= e!465291 (and (bvsge _size!10 #b00000000000000000000000000000000) (bvsle _size!10 (bvadd #b00000000000000000000000000000001 oldMask!5)) (bvsge _vacant!10 #b00000000000000000000000000000000) (bvsgt m!52 #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 _size!10) m!52) (bvsge (bvadd #b00000000000000000000000000000001 (bvand (bvashr m!52 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) _size!10) (bvsgt (bvlshr m!52 #b00000000000000000000000000000001) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 _size!10) (bvlshr m!52 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 (bvand (bvashr (bvlshr m!52 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) _size!10) (bvsge (bvlshr m!52 #b00000000000000000000000000000001) m!52)))))

(assert (= (and start!71722 res!567035) b!833984))

(declare-fun m!778936 () Bool)

(assert (=> start!71722 m!778936))

(push 1)

(assert (not start!71722))

(check-sat)

(pop 1)

(push 1)

(check-sat)
