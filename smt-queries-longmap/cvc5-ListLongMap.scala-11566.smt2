; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134704 () Bool)

(assert start!134704)

(declare-fun res!1073664 () Bool)

(declare-fun e!876136 () Bool)

(assert (=> start!134704 (=> (not res!1073664) (not e!876136))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134704 (= res!1073664 (validMask!0 mask!889))))

(assert (=> start!134704 e!876136))

(assert (=> start!134704 true))

(declare-datatypes ((array!104821 0))(
  ( (array!104822 (arr!50584 (Array (_ BitVec 32) (_ BitVec 64))) (size!51136 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104821)

(declare-fun array_inv!39520 (array!104821) Bool)

(assert (=> start!134704 (array_inv!39520 _keys!600)))

(declare-fun b!1571367 () Bool)

(declare-fun res!1073663 () Bool)

(assert (=> b!1571367 (=> (not res!1073663) (not e!876136))))

(assert (=> b!1571367 (= res!1073663 (= (size!51136 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571368 () Bool)

(declare-fun res!1073662 () Bool)

(assert (=> b!1571368 (=> (not res!1073662) (not e!876136))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571368 (= res!1073662 (validKeyInArray!0 k!754))))

(declare-fun b!1571369 () Bool)

(assert (=> b!1571369 (= e!876136 (bvslt mask!889 #b00000000000000000000000000000000))))

(declare-fun lt!673383 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571369 (= lt!673383 (toIndex!0 k!754 mask!889))))

(assert (= (and start!134704 res!1073664) b!1571367))

(assert (= (and b!1571367 res!1073663) b!1571368))

(assert (= (and b!1571368 res!1073662) b!1571369))

(declare-fun m!1444675 () Bool)

(assert (=> start!134704 m!1444675))

(declare-fun m!1444677 () Bool)

(assert (=> start!134704 m!1444677))

(declare-fun m!1444679 () Bool)

(assert (=> b!1571368 m!1444679))

(declare-fun m!1444681 () Bool)

(assert (=> b!1571369 m!1444681))

(push 1)

(assert (not start!134704))

(assert (not b!1571369))

(assert (not b!1571368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164355 () Bool)

(assert (=> d!164355 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134704 d!164355))

(declare-fun d!164365 () Bool)

(assert (=> d!164365 (= (array_inv!39520 _keys!600) (bvsge (size!51136 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134704 d!164365))

(declare-fun d!164367 () Bool)

(declare-fun lt!673395 () (_ BitVec 32))

(declare-fun lt!673394 () (_ BitVec 32))

(assert (=> d!164367 (= lt!673395 (bvmul (bvxor lt!673394 (bvlshr lt!673394 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164367 (= lt!673394 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164367 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1073666 (let ((h!38247 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141299 (bvmul (bvxor h!38247 (bvlshr h!38247 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141299 (bvlshr x!141299 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1073666 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1073666 #b00000000000000000000000000000000))))))

(assert (=> d!164367 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!673395 (bvlshr lt!673395 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1571369 d!164367))

(declare-fun d!164375 () Bool)

(assert (=> d!164375 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571368 d!164375))

(push 1)

(check-sat)

(pop 1)

