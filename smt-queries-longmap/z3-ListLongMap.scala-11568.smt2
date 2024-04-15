; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134736 () Bool)

(assert start!134736)

(declare-fun res!1073703 () Bool)

(declare-fun e!876160 () Bool)

(assert (=> start!134736 (=> (not res!1073703) (not e!876160))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134736 (= res!1073703 (validMask!0 mask!889))))

(assert (=> start!134736 e!876160))

(assert (=> start!134736 true))

(declare-datatypes ((array!104832 0))(
  ( (array!104833 (arr!50588 (Array (_ BitVec 32) (_ BitVec 64))) (size!51140 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104832)

(declare-fun array_inv!39524 (array!104832) Bool)

(assert (=> start!134736 (array_inv!39524 _keys!600)))

(declare-fun b!1571403 () Bool)

(declare-fun res!1073702 () Bool)

(assert (=> b!1571403 (=> (not res!1073702) (not e!876160))))

(assert (=> b!1571403 (= res!1073702 (= (size!51140 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571404 () Bool)

(declare-fun res!1073701 () Bool)

(assert (=> b!1571404 (=> (not res!1073701) (not e!876160))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571404 (= res!1073701 (validKeyInArray!0 k0!754))))

(declare-fun b!1571405 () Bool)

(declare-fun lt!673413 () (_ BitVec 32))

(assert (=> b!1571405 (= e!876160 (and (bvsge mask!889 #b00000000000000000000000000000000) (or (bvslt lt!673413 #b00000000000000000000000000000000) (bvsge lt!673413 (bvadd #b00000000000000000000000000000001 mask!889)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571405 (= lt!673413 (toIndex!0 k0!754 mask!889))))

(assert (= (and start!134736 res!1073703) b!1571403))

(assert (= (and b!1571403 res!1073702) b!1571404))

(assert (= (and b!1571404 res!1073701) b!1571405))

(declare-fun m!1444707 () Bool)

(assert (=> start!134736 m!1444707))

(declare-fun m!1444709 () Bool)

(assert (=> start!134736 m!1444709))

(declare-fun m!1444711 () Bool)

(assert (=> b!1571404 m!1444711))

(declare-fun m!1444713 () Bool)

(assert (=> b!1571405 m!1444713))

(check-sat (not b!1571404) (not b!1571405) (not start!134736))
(check-sat)
(get-model)

(declare-fun d!164381 () Bool)

(assert (=> d!164381 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571404 d!164381))

(declare-fun d!164383 () Bool)

(declare-fun lt!673425 () (_ BitVec 32))

(declare-fun lt!673424 () (_ BitVec 32))

(assert (=> d!164383 (= lt!673425 (bvmul (bvxor lt!673424 (bvlshr lt!673424 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164383 (= lt!673424 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164383 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1073722 (let ((h!38249 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141317 (bvmul (bvxor h!38249 (bvlshr h!38249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141317 (bvlshr x!141317 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1073722 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1073722 #b00000000000000000000000000000000))))))

(assert (=> d!164383 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!673425 (bvlshr lt!673425 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1571405 d!164383))

(declare-fun d!164389 () Bool)

(assert (=> d!164389 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134736 d!164389))

(declare-fun d!164397 () Bool)

(assert (=> d!164397 (= (array_inv!39524 _keys!600) (bvsge (size!51140 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134736 d!164397))

(check-sat)
