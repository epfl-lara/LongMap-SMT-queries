; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89316 () Bool)

(assert start!89316)

(declare-fun b!1024017 () Bool)

(declare-fun b_free!20341 () Bool)

(declare-fun b_next!20341 () Bool)

(assert (=> b!1024017 (= b_free!20341 (not b_next!20341))))

(declare-fun tp!72061 () Bool)

(declare-fun b_and!32587 () Bool)

(assert (=> b!1024017 (= tp!72061 b_and!32587)))

(declare-fun b!1024013 () Bool)

(declare-fun e!577148 () Bool)

(declare-fun tp_is_empty!24061 () Bool)

(assert (=> b!1024013 (= e!577148 tp_is_empty!24061)))

(declare-fun b!1024014 () Bool)

(declare-fun e!577146 () Bool)

(declare-datatypes ((V!36955 0))(
  ( (V!36956 (val!12081 Int)) )
))
(declare-datatypes ((ValueCell!11327 0))(
  ( (ValueCellFull!11327 (v!14650 V!36955)) (EmptyCell!11327) )
))
(declare-datatypes ((array!64168 0))(
  ( (array!64169 (arr!30895 (Array (_ BitVec 32) (_ BitVec 64))) (size!31407 (_ BitVec 32))) )
))
(declare-datatypes ((array!64170 0))(
  ( (array!64171 (arr!30896 (Array (_ BitVec 32) ValueCell!11327)) (size!31408 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5248 0))(
  ( (LongMapFixedSize!5249 (defaultEntry!5976 Int) (mask!29615 (_ BitVec 32)) (extraKeys!5708 (_ BitVec 32)) (zeroValue!5812 V!36955) (minValue!5812 V!36955) (_size!2679 (_ BitVec 32)) (_keys!11122 array!64168) (_values!5999 array!64170) (_vacant!2679 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5248)

(assert (=> b!1024014 (= e!577146 (not (= (size!31407 (_keys!11122 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29615 thiss!1427)))))))

(declare-fun b!1024015 () Bool)

(declare-fun res!685672 () Bool)

(assert (=> b!1024015 (=> (not res!685672) (not e!577146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024015 (= res!685672 (validMask!0 (mask!29615 thiss!1427)))))

(declare-fun mapNonEmpty!37513 () Bool)

(declare-fun mapRes!37513 () Bool)

(declare-fun tp!72062 () Bool)

(declare-fun e!577145 () Bool)

(assert (=> mapNonEmpty!37513 (= mapRes!37513 (and tp!72062 e!577145))))

(declare-fun mapKey!37513 () (_ BitVec 32))

(declare-fun mapRest!37513 () (Array (_ BitVec 32) ValueCell!11327))

(declare-fun mapValue!37513 () ValueCell!11327)

(assert (=> mapNonEmpty!37513 (= (arr!30896 (_values!5999 thiss!1427)) (store mapRest!37513 mapKey!37513 mapValue!37513))))

(declare-fun mapIsEmpty!37513 () Bool)

(assert (=> mapIsEmpty!37513 mapRes!37513))

(declare-fun b!1024016 () Bool)

(declare-fun e!577143 () Bool)

(assert (=> b!1024016 (= e!577143 (and e!577148 mapRes!37513))))

(declare-fun condMapEmpty!37513 () Bool)

(declare-fun mapDefault!37513 () ValueCell!11327)

