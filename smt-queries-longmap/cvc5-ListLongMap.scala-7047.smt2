; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89294 () Bool)

(assert start!89294)

(declare-fun b!1023891 () Bool)

(declare-fun b_free!20335 () Bool)

(declare-fun b_next!20335 () Bool)

(assert (=> b!1023891 (= b_free!20335 (not b_next!20335))))

(declare-fun tp!72040 () Bool)

(declare-fun b_and!32581 () Bool)

(assert (=> b!1023891 (= tp!72040 b_and!32581)))

(declare-fun b!1023887 () Bool)

(declare-fun e!577052 () Bool)

(declare-fun tp_is_empty!24055 () Bool)

(assert (=> b!1023887 (= e!577052 tp_is_empty!24055)))

(declare-fun b!1023888 () Bool)

(declare-fun e!577049 () Bool)

(assert (=> b!1023888 (= e!577049 tp_is_empty!24055)))

(declare-fun b!1023889 () Bool)

(declare-fun e!577051 () Bool)

(declare-datatypes ((V!36947 0))(
  ( (V!36948 (val!12078 Int)) )
))
(declare-datatypes ((ValueCell!11324 0))(
  ( (ValueCellFull!11324 (v!14647 V!36947)) (EmptyCell!11324) )
))
(declare-datatypes ((array!64154 0))(
  ( (array!64155 (arr!30889 (Array (_ BitVec 32) (_ BitVec 64))) (size!31400 (_ BitVec 32))) )
))
(declare-datatypes ((array!64156 0))(
  ( (array!64157 (arr!30890 (Array (_ BitVec 32) ValueCell!11324)) (size!31401 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5242 0))(
  ( (LongMapFixedSize!5243 (defaultEntry!5973 Int) (mask!29608 (_ BitVec 32)) (extraKeys!5705 (_ BitVec 32)) (zeroValue!5809 V!36947) (minValue!5809 V!36947) (_size!2676 (_ BitVec 32)) (_keys!11118 array!64154) (_values!5996 array!64156) (_vacant!2676 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5242)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023889 (= e!577051 (not (validMask!0 (mask!29608 thiss!1427))))))

(declare-fun b!1023890 () Bool)

(declare-fun res!685615 () Bool)

(assert (=> b!1023890 (=> (not res!685615) (not e!577051))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023890 (= res!685615 (not (= key!909 (bvneg key!909))))))

(declare-fun res!685616 () Bool)

(assert (=> start!89294 (=> (not res!685616) (not e!577051))))

(declare-fun valid!1997 (LongMapFixedSize!5242) Bool)

(assert (=> start!89294 (= res!685616 (valid!1997 thiss!1427))))

(assert (=> start!89294 e!577051))

(declare-fun e!577050 () Bool)

(assert (=> start!89294 e!577050))

(assert (=> start!89294 true))

(declare-fun mapNonEmpty!37500 () Bool)

(declare-fun mapRes!37500 () Bool)

(declare-fun tp!72039 () Bool)

(assert (=> mapNonEmpty!37500 (= mapRes!37500 (and tp!72039 e!577049))))

(declare-fun mapRest!37500 () (Array (_ BitVec 32) ValueCell!11324))

(declare-fun mapKey!37500 () (_ BitVec 32))

(declare-fun mapValue!37500 () ValueCell!11324)

(assert (=> mapNonEmpty!37500 (= (arr!30890 (_values!5996 thiss!1427)) (store mapRest!37500 mapKey!37500 mapValue!37500))))

(declare-fun e!577048 () Bool)

(declare-fun array_inv!23931 (array!64154) Bool)

(declare-fun array_inv!23932 (array!64156) Bool)

(assert (=> b!1023891 (= e!577050 (and tp!72040 tp_is_empty!24055 (array_inv!23931 (_keys!11118 thiss!1427)) (array_inv!23932 (_values!5996 thiss!1427)) e!577048))))

(declare-fun mapIsEmpty!37500 () Bool)

(assert (=> mapIsEmpty!37500 mapRes!37500))

(declare-fun b!1023892 () Bool)

(assert (=> b!1023892 (= e!577048 (and e!577052 mapRes!37500))))

(declare-fun condMapEmpty!37500 () Bool)

(declare-fun mapDefault!37500 () ValueCell!11324)

