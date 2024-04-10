; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80910 () Bool)

(assert start!80910)

(declare-fun b!948013 () Bool)

(declare-fun b_free!18193 () Bool)

(declare-fun b_next!18193 () Bool)

(assert (=> b!948013 (= b_free!18193 (not b_next!18193))))

(declare-fun tp!63150 () Bool)

(declare-fun b_and!29619 () Bool)

(assert (=> b!948013 (= tp!63150 b_and!29619)))

(declare-fun b!948010 () Bool)

(declare-fun e!533648 () Bool)

(declare-datatypes ((V!32567 0))(
  ( (V!32568 (val!10401 Int)) )
))
(declare-datatypes ((ValueCell!9869 0))(
  ( (ValueCellFull!9869 (v!12937 V!32567)) (EmptyCell!9869) )
))
(declare-datatypes ((array!57406 0))(
  ( (array!57407 (arr!27610 (Array (_ BitVec 32) ValueCell!9869)) (size!28083 (_ BitVec 32))) )
))
(declare-datatypes ((array!57408 0))(
  ( (array!57409 (arr!27611 (Array (_ BitVec 32) (_ BitVec 64))) (size!28084 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4888 0))(
  ( (LongMapFixedSize!4889 (defaultEntry!5744 Int) (mask!27496 (_ BitVec 32)) (extraKeys!5476 (_ BitVec 32)) (zeroValue!5580 V!32567) (minValue!5580 V!32567) (_size!2499 (_ BitVec 32)) (_keys!10659 array!57408) (_values!5767 array!57406) (_vacant!2499 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4888)

(assert (=> b!948010 (= e!533648 (not (= (size!28083 (_values!5767 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27496 thiss!1141)))))))

(declare-fun res!636113 () Bool)

(assert (=> start!80910 (=> (not res!636113) (not e!533648))))

(declare-fun valid!1860 (LongMapFixedSize!4888) Bool)

(assert (=> start!80910 (= res!636113 (valid!1860 thiss!1141))))

(assert (=> start!80910 e!533648))

(declare-fun e!533646 () Bool)

(assert (=> start!80910 e!533646))

(assert (=> start!80910 true))

(declare-fun mapIsEmpty!32938 () Bool)

(declare-fun mapRes!32938 () Bool)

(assert (=> mapIsEmpty!32938 mapRes!32938))

(declare-fun mapNonEmpty!32938 () Bool)

(declare-fun tp!63149 () Bool)

(declare-fun e!533649 () Bool)

(assert (=> mapNonEmpty!32938 (= mapRes!32938 (and tp!63149 e!533649))))

(declare-fun mapKey!32938 () (_ BitVec 32))

(declare-fun mapRest!32938 () (Array (_ BitVec 32) ValueCell!9869))

(declare-fun mapValue!32938 () ValueCell!9869)

(assert (=> mapNonEmpty!32938 (= (arr!27610 (_values!5767 thiss!1141)) (store mapRest!32938 mapKey!32938 mapValue!32938))))

(declare-fun b!948011 () Bool)

(declare-fun tp_is_empty!20701 () Bool)

(assert (=> b!948011 (= e!533649 tp_is_empty!20701)))

(declare-fun b!948012 () Bool)

(declare-fun res!636112 () Bool)

(assert (=> b!948012 (=> (not res!636112) (not e!533648))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13520 0))(
  ( (tuple2!13521 (_1!6771 (_ BitVec 64)) (_2!6771 V!32567)) )
))
(declare-datatypes ((List!19315 0))(
  ( (Nil!19312) (Cons!19311 (h!20467 tuple2!13520) (t!27640 List!19315)) )
))
(declare-datatypes ((ListLongMap!12217 0))(
  ( (ListLongMap!12218 (toList!6124 List!19315)) )
))
(declare-fun contains!5206 (ListLongMap!12217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3357 (array!57408 array!57406 (_ BitVec 32) (_ BitVec 32) V!32567 V!32567 (_ BitVec 32) Int) ListLongMap!12217)

(assert (=> b!948012 (= res!636112 (contains!5206 (getCurrentListMap!3357 (_keys!10659 thiss!1141) (_values!5767 thiss!1141) (mask!27496 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)) key!756))))

(declare-fun e!533647 () Bool)

(declare-fun array_inv!21432 (array!57408) Bool)

(declare-fun array_inv!21433 (array!57406) Bool)

(assert (=> b!948013 (= e!533646 (and tp!63150 tp_is_empty!20701 (array_inv!21432 (_keys!10659 thiss!1141)) (array_inv!21433 (_values!5767 thiss!1141)) e!533647))))

(declare-fun b!948014 () Bool)

(declare-fun res!636115 () Bool)

(assert (=> b!948014 (=> (not res!636115) (not e!533648))))

(declare-datatypes ((SeekEntryResult!9123 0))(
  ( (MissingZero!9123 (index!38863 (_ BitVec 32))) (Found!9123 (index!38864 (_ BitVec 32))) (Intermediate!9123 (undefined!9935 Bool) (index!38865 (_ BitVec 32)) (x!81575 (_ BitVec 32))) (Undefined!9123) (MissingVacant!9123 (index!38866 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57408 (_ BitVec 32)) SeekEntryResult!9123)

(assert (=> b!948014 (= res!636115 (not (is-Found!9123 (seekEntry!0 key!756 (_keys!10659 thiss!1141) (mask!27496 thiss!1141)))))))

(declare-fun b!948015 () Bool)

(declare-fun res!636114 () Bool)

(assert (=> b!948015 (=> (not res!636114) (not e!533648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948015 (= res!636114 (validMask!0 (mask!27496 thiss!1141)))))

(declare-fun b!948016 () Bool)

(declare-fun e!533645 () Bool)

(assert (=> b!948016 (= e!533647 (and e!533645 mapRes!32938))))

(declare-fun condMapEmpty!32938 () Bool)

(declare-fun mapDefault!32938 () ValueCell!9869)

