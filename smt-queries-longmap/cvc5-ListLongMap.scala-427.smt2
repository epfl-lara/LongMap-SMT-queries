; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7970 () Bool)

(assert start!7970)

(declare-fun b!49933 () Bool)

(declare-fun b_free!1519 () Bool)

(declare-fun b_next!1519 () Bool)

(assert (=> b!49933 (= b_free!1519 (not b_next!1519))))

(declare-fun tp!6602 () Bool)

(declare-fun b_and!2729 () Bool)

(assert (=> b!49933 (= tp!6602 b_and!2729)))

(declare-fun b!49931 () Bool)

(declare-fun e!32184 () Bool)

(declare-fun tp_is_empty!2173 () Bool)

(assert (=> b!49931 (= e!32184 tp_is_empty!2173)))

(declare-fun mapIsEmpty!2144 () Bool)

(declare-fun mapRes!2144 () Bool)

(assert (=> mapIsEmpty!2144 mapRes!2144))

(declare-fun lt!21005 () Bool)

(declare-datatypes ((array!3255 0))(
  ( (array!3256 (arr!1557 (Array (_ BitVec 32) (_ BitVec 64))) (size!1779 (_ BitVec 32))) )
))
(declare-datatypes ((V!2545 0))(
  ( (V!2546 (val!1131 Int)) )
))
(declare-datatypes ((ValueCell!743 0))(
  ( (ValueCellFull!743 (v!2150 V!2545)) (EmptyCell!743) )
))
(declare-datatypes ((array!3257 0))(
  ( (array!3258 (arr!1558 (Array (_ BitVec 32) ValueCell!743)) (size!1780 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!394 0))(
  ( (LongMapFixedSize!395 (defaultEntry!1911 Int) (mask!5691 (_ BitVec 32)) (extraKeys!1802 (_ BitVec 32)) (zeroValue!1829 V!2545) (minValue!1829 V!2545) (_size!246 (_ BitVec 32)) (_keys!3517 array!3255) (_values!1894 array!3257) (_vacant!246 (_ BitVec 32))) )
))
(declare-fun thiss!1134 () LongMapFixedSize!394)

(declare-fun valid!127 (LongMapFixedSize!394) Bool)

(assert (=> start!7970 (= lt!21005 (valid!127 thiss!1134))))

(assert (=> start!7970 false))

(declare-fun e!32185 () Bool)

(assert (=> start!7970 e!32185))

(declare-fun b!49932 () Bool)

(declare-fun e!32181 () Bool)

(assert (=> b!49932 (= e!32181 (and e!32184 mapRes!2144))))

(declare-fun condMapEmpty!2144 () Bool)

(declare-fun mapDefault!2144 () ValueCell!743)

