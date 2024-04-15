; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134892 () Bool)

(assert start!134892)

(declare-fun res!1074090 () Bool)

(declare-fun e!876467 () Bool)

(assert (=> start!134892 (=> (not res!1074090) (not e!876467))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134892 (= res!1074090 (validMask!0 mask!889))))

(assert (=> start!134892 e!876467))

(assert (=> start!134892 true))

(declare-datatypes ((array!104913 0))(
  ( (array!104914 (arr!50624 (Array (_ BitVec 32) (_ BitVec 64))) (size!51176 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104913)

(declare-fun array_inv!39560 (array!104913) Bool)

(assert (=> start!134892 (array_inv!39560 _keys!600)))

(declare-fun b!1571889 () Bool)

(declare-fun res!1074088 () Bool)

(assert (=> b!1571889 (=> (not res!1074088) (not e!876467))))

(assert (=> b!1571889 (= res!1074088 (= (size!51176 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571890 () Bool)

(declare-fun res!1074089 () Bool)

(assert (=> b!1571890 (=> (not res!1074089) (not e!876467))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571890 (= res!1074089 (validKeyInArray!0 k0!754))))

(declare-fun b!1571891 () Bool)

(declare-datatypes ((SeekEntryResult!13572 0))(
  ( (MissingZero!13572 (index!56686 (_ BitVec 32))) (Found!13572 (index!56687 (_ BitVec 32))) (Intermediate!13572 (undefined!14384 Bool) (index!56688 (_ BitVec 32)) (x!141455 (_ BitVec 32))) (Undefined!13572) (MissingVacant!13572 (index!56689 (_ BitVec 32))) )
))
(declare-fun lt!673611 () SeekEntryResult!13572)

(get-info :version)

(assert (=> b!1571891 (= e!876467 (and ((_ is Intermediate!13572) lt!673611) (not (undefined!14384 lt!673611)) (not (= (select (arr!50624 _keys!600) (index!56688 lt!673611)) k0!754)) (not (= (select (arr!50624 _keys!600) (index!56688 lt!673611)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50624 _keys!600) (index!56688 lt!673611)) #b1000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!56688 lt!673611) #b00000000000000000000000000000000) (bvsge (index!56688 lt!673611) (bvadd #b00000000000000000000000000000001 mask!889)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104913 (_ BitVec 32)) SeekEntryResult!13572)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571891 (= lt!673611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134892 res!1074090) b!1571889))

(assert (= (and b!1571889 res!1074088) b!1571890))

(assert (= (and b!1571890 res!1074089) b!1571891))

(declare-fun m!1445115 () Bool)

(assert (=> start!134892 m!1445115))

(declare-fun m!1445117 () Bool)

(assert (=> start!134892 m!1445117))

(declare-fun m!1445119 () Bool)

(assert (=> b!1571890 m!1445119))

(declare-fun m!1445121 () Bool)

(assert (=> b!1571891 m!1445121))

(declare-fun m!1445123 () Bool)

(assert (=> b!1571891 m!1445123))

(assert (=> b!1571891 m!1445123))

(declare-fun m!1445125 () Bool)

(assert (=> b!1571891 m!1445125))

(check-sat (not b!1571890) (not b!1571891) (not start!134892))
(check-sat)
(get-model)

(declare-fun d!164489 () Bool)

(assert (=> d!164489 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571890 d!164489))

(declare-fun b!1571955 () Bool)

(declare-fun lt!673628 () SeekEntryResult!13572)

(assert (=> b!1571955 (and (bvsge (index!56688 lt!673628) #b00000000000000000000000000000000) (bvslt (index!56688 lt!673628) (size!51176 _keys!600)))))

(declare-fun res!1074125 () Bool)

(assert (=> b!1571955 (= res!1074125 (= (select (arr!50624 _keys!600) (index!56688 lt!673628)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!876506 () Bool)

(assert (=> b!1571955 (=> res!1074125 e!876506)))

(declare-fun d!164491 () Bool)

(declare-fun e!876505 () Bool)

(assert (=> d!164491 e!876505))

(declare-fun c!145161 () Bool)

(assert (=> d!164491 (= c!145161 (and ((_ is Intermediate!13572) lt!673628) (undefined!14384 lt!673628)))))

(declare-fun e!876507 () SeekEntryResult!13572)

(assert (=> d!164491 (= lt!673628 e!876507)))

(declare-fun c!145162 () Bool)

(assert (=> d!164491 (= c!145162 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!673629 () (_ BitVec 64))

(assert (=> d!164491 (= lt!673629 (select (arr!50624 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164491 (validMask!0 mask!889)))

(assert (=> d!164491 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!673628)))

(declare-fun b!1571956 () Bool)

(assert (=> b!1571956 (and (bvsge (index!56688 lt!673628) #b00000000000000000000000000000000) (bvslt (index!56688 lt!673628) (size!51176 _keys!600)))))

(assert (=> b!1571956 (= e!876506 (= (select (arr!50624 _keys!600) (index!56688 lt!673628)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1571957 () Bool)

(declare-fun e!876508 () SeekEntryResult!13572)

(assert (=> b!1571957 (= e!876507 e!876508)))

(declare-fun c!145160 () Bool)

(assert (=> b!1571957 (= c!145160 (or (= lt!673629 k0!754) (= (bvadd lt!673629 lt!673629) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1571958 () Bool)

(assert (=> b!1571958 (= e!876508 (Intermediate!13572 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1571959 () Bool)

(declare-fun e!876509 () Bool)

(assert (=> b!1571959 (= e!876505 e!876509)))

(declare-fun res!1074127 () Bool)

(assert (=> b!1571959 (= res!1074127 (and ((_ is Intermediate!13572) lt!673628) (not (undefined!14384 lt!673628)) (bvslt (x!141455 lt!673628) #b01111111111111111111111111111110) (bvsge (x!141455 lt!673628) #b00000000000000000000000000000000) (bvsge (x!141455 lt!673628) #b00000000000000000000000000000000)))))

(assert (=> b!1571959 (=> (not res!1074127) (not e!876509))))

(declare-fun b!1571960 () Bool)

(assert (=> b!1571960 (= e!876507 (Intermediate!13572 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1571961 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571961 (= e!876508 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1571962 () Bool)

(assert (=> b!1571962 (= e!876505 (bvsge (x!141455 lt!673628) #b01111111111111111111111111111110))))

(declare-fun b!1571963 () Bool)

(assert (=> b!1571963 (and (bvsge (index!56688 lt!673628) #b00000000000000000000000000000000) (bvslt (index!56688 lt!673628) (size!51176 _keys!600)))))

(declare-fun res!1074126 () Bool)

(assert (=> b!1571963 (= res!1074126 (= (select (arr!50624 _keys!600) (index!56688 lt!673628)) k0!754))))

(assert (=> b!1571963 (=> res!1074126 e!876506)))

(assert (=> b!1571963 (= e!876509 e!876506)))

(assert (= (and d!164491 c!145162) b!1571960))

(assert (= (and d!164491 (not c!145162)) b!1571957))

(assert (= (and b!1571957 c!145160) b!1571958))

(assert (= (and b!1571957 (not c!145160)) b!1571961))

(assert (= (and d!164491 c!145161) b!1571962))

(assert (= (and d!164491 (not c!145161)) b!1571959))

(assert (= (and b!1571959 res!1074127) b!1571963))

(assert (= (and b!1571963 (not res!1074126)) b!1571955))

(assert (= (and b!1571955 (not res!1074125)) b!1571956))

(declare-fun m!1445159 () Bool)

(assert (=> b!1571963 m!1445159))

(assert (=> d!164491 m!1445123))

(declare-fun m!1445161 () Bool)

(assert (=> d!164491 m!1445161))

(assert (=> d!164491 m!1445115))

(assert (=> b!1571955 m!1445159))

(assert (=> b!1571961 m!1445123))

(declare-fun m!1445163 () Bool)

(assert (=> b!1571961 m!1445163))

(assert (=> b!1571961 m!1445163))

(declare-fun m!1445165 () Bool)

(assert (=> b!1571961 m!1445165))

(assert (=> b!1571956 m!1445159))

(assert (=> b!1571891 d!164491))

(declare-fun d!164503 () Bool)

(declare-fun lt!673645 () (_ BitVec 32))

(declare-fun lt!673644 () (_ BitVec 32))

(assert (=> d!164503 (= lt!673645 (bvmul (bvxor lt!673644 (bvlshr lt!673644 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164503 (= lt!673644 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164503 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074128 (let ((h!38259 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141461 (bvmul (bvxor h!38259 (bvlshr h!38259 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141461 (bvlshr x!141461 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074128 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074128 #b00000000000000000000000000000000))))))

(assert (=> d!164503 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!673645 (bvlshr lt!673645 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1571891 d!164503))

(declare-fun d!164507 () Bool)

(assert (=> d!164507 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134892 d!164507))

(declare-fun d!164513 () Bool)

(assert (=> d!164513 (= (array_inv!39560 _keys!600) (bvsge (size!51176 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134892 d!164513))

(check-sat (not b!1571961) (not d!164491))
(check-sat)
