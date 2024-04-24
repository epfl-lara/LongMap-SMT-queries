; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71882 () Bool)

(assert start!71882)

(declare-fun res!567372 () Bool)

(declare-fun e!465862 () Bool)

(assert (=> start!71882 (=> (not res!567372) (not e!465862))))

(declare-fun oldMask!5 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71882 (= res!567372 (validMask!0 oldMask!5))))

(assert (=> start!71882 e!465862))

(assert (=> start!71882 true))

(declare-fun m!52 () (_ BitVec 32))

(declare-fun b!834873 () Bool)

(declare-fun _vacant!10 () (_ BitVec 32))

(declare-fun _size!10 () (_ BitVec 32))

(assert (=> b!834873 (= e!465862 (and (bvsge _size!10 #b00000000000000000000000000000000) (bvsle _size!10 (bvadd #b00000000000000000000000000000001 oldMask!5)) (bvsge _vacant!10 #b00000000000000000000000000000000) (bvsgt m!52 #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 _size!10) m!52) (bvsge (bvadd #b00000000000000000000000000000001 (bvand (bvashr m!52 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) _size!10) (bvslt m!52 #b00000000000000000000000000000000)))))

(assert (= (and start!71882 res!567372) b!834873))

(declare-fun m!780216 () Bool)

(assert (=> start!71882 m!780216))

(check-sat (not start!71882))
(check-sat)
