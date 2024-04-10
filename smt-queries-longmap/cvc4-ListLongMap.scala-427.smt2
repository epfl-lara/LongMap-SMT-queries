; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7974 () Bool)

(assert start!7974)

(declare-fun b!49957 () Bool)

(declare-fun b_free!1523 () Bool)

(declare-fun b_next!1523 () Bool)

(assert (=> b!49957 (= b_free!1523 (not b_next!1523))))

(declare-fun tp!6613 () Bool)

(declare-fun b_and!2733 () Bool)

(assert (=> b!49957 (= tp!6613 b_and!2733)))

(declare-fun mapIsEmpty!2150 () Bool)

(declare-fun mapRes!2150 () Bool)

(assert (=> mapIsEmpty!2150 mapRes!2150))

(declare-fun mapNonEmpty!2150 () Bool)

(declare-fun tp!6614 () Bool)

(declare-fun e!32212 () Bool)

(assert (=> mapNonEmpty!2150 (= mapRes!2150 (and tp!6614 e!32212))))

(declare-datatypes ((V!2549 0))(
  ( (V!2550 (val!1133 Int)) )
))
(declare-datatypes ((ValueCell!745 0))(
  ( (ValueCellFull!745 (v!2152 V!2549)) (EmptyCell!745) )
))
(declare-fun mapRest!2150 () (Array (_ BitVec 32) ValueCell!745))

(declare-fun mapKey!2150 () (_ BitVec 32))

(declare-fun mapValue!2150 () ValueCell!745)

(declare-datatypes ((array!3263 0))(
  ( (array!3264 (arr!1561 (Array (_ BitVec 32) (_ BitVec 64))) (size!1783 (_ BitVec 32))) )
))
(declare-datatypes ((array!3265 0))(
  ( (array!3266 (arr!1562 (Array (_ BitVec 32) ValueCell!745)) (size!1784 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!398 0))(
  ( (LongMapFixedSize!399 (defaultEntry!1913 Int) (mask!5693 (_ BitVec 32)) (extraKeys!1804 (_ BitVec 32)) (zeroValue!1831 V!2549) (minValue!1831 V!2549) (_size!248 (_ BitVec 32)) (_keys!3519 array!3263) (_values!1896 array!3265) (_vacant!248 (_ BitVec 32))) )
))
(declare-fun thiss!1134 () LongMapFixedSize!398)

(assert (=> mapNonEmpty!2150 (= (arr!1562 (_values!1896 thiss!1134)) (store mapRest!2150 mapKey!2150 mapValue!2150))))

(declare-fun b!49955 () Bool)

(declare-fun tp_is_empty!2177 () Bool)

(assert (=> b!49955 (= e!32212 tp_is_empty!2177)))

(declare-fun lt!21011 () Bool)

(declare-fun valid!129 (LongMapFixedSize!398) Bool)

(assert (=> start!7974 (= lt!21011 (valid!129 thiss!1134))))

(assert (=> start!7974 false))

(declare-fun e!32213 () Bool)

(assert (=> start!7974 e!32213))

(declare-fun b!49956 () Bool)

(declare-fun e!32214 () Bool)

(declare-fun e!32215 () Bool)

(assert (=> b!49956 (= e!32214 (and e!32215 mapRes!2150))))

(declare-fun condMapEmpty!2150 () Bool)

(declare-fun mapDefault!2150 () ValueCell!745)

