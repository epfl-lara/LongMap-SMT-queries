; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90304 () Bool)

(assert start!90304)

(declare-fun b!1033618 () Bool)

(declare-fun b_free!20801 () Bool)

(declare-fun b_next!20801 () Bool)

(assert (=> b!1033618 (= b_free!20801 (not b_next!20801))))

(declare-fun tp!73502 () Bool)

(declare-fun b_and!33273 () Bool)

(assert (=> b!1033618 (= tp!73502 b_and!33273)))

(declare-fun b!1033616 () Bool)

(declare-fun e!584261 () Bool)

(declare-fun tp_is_empty!24521 () Bool)

(assert (=> b!1033616 (= e!584261 tp_is_empty!24521)))

(declare-fun b!1033617 () Bool)

(declare-fun res!690596 () Bool)

(declare-fun e!584262 () Bool)

(assert (=> b!1033617 (=> (not res!690596) (not e!584262))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033617 (= res!690596 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!690594 () Bool)

(assert (=> start!90304 (=> (not res!690594) (not e!584262))))

(declare-datatypes ((V!37567 0))(
  ( (V!37568 (val!12311 Int)) )
))
(declare-datatypes ((ValueCell!11557 0))(
  ( (ValueCellFull!11557 (v!14888 V!37567)) (EmptyCell!11557) )
))
(declare-datatypes ((array!65122 0))(
  ( (array!65123 (arr!31355 (Array (_ BitVec 32) (_ BitVec 64))) (size!31877 (_ BitVec 32))) )
))
(declare-datatypes ((array!65124 0))(
  ( (array!65125 (arr!31356 (Array (_ BitVec 32) ValueCell!11557)) (size!31878 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5708 0))(
  ( (LongMapFixedSize!5709 (defaultEntry!6228 Int) (mask!30085 (_ BitVec 32)) (extraKeys!5960 (_ BitVec 32)) (zeroValue!6064 V!37567) (minValue!6064 V!37567) (_size!2909 (_ BitVec 32)) (_keys!11408 array!65122) (_values!6251 array!65124) (_vacant!2909 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5708)

(declare-fun valid!2157 (LongMapFixedSize!5708) Bool)

(assert (=> start!90304 (= res!690594 (valid!2157 thiss!1427))))

(assert (=> start!90304 e!584262))

(declare-fun e!584265 () Bool)

(assert (=> start!90304 e!584265))

(assert (=> start!90304 true))

(declare-fun e!584263 () Bool)

(declare-fun array_inv!24257 (array!65122) Bool)

(declare-fun array_inv!24258 (array!65124) Bool)

(assert (=> b!1033618 (= e!584265 (and tp!73502 tp_is_empty!24521 (array_inv!24257 (_keys!11408 thiss!1427)) (array_inv!24258 (_values!6251 thiss!1427)) e!584263))))

(declare-fun b!1033619 () Bool)

(declare-fun e!584264 () Bool)

(assert (=> b!1033619 (= e!584262 (not e!584264))))

(declare-fun res!690595 () Bool)

(assert (=> b!1033619 (=> (not res!690595) (not e!584264))))

(declare-fun lt!456132 () LongMapFixedSize!5708)

(assert (=> b!1033619 (= res!690595 (valid!2157 lt!456132))))

(declare-fun lt!456133 () V!37567)

(assert (=> b!1033619 (= lt!456132 (LongMapFixedSize!5709 (defaultEntry!6228 thiss!1427) (mask!30085 thiss!1427) (bvand (extraKeys!5960 thiss!1427) #b00000000000000000000000000000010) lt!456133 (minValue!6064 thiss!1427) (_size!2909 thiss!1427) (_keys!11408 thiss!1427) (_values!6251 thiss!1427) (_vacant!2909 thiss!1427)))))

(declare-datatypes ((tuple2!15728 0))(
  ( (tuple2!15729 (_1!7875 (_ BitVec 64)) (_2!7875 V!37567)) )
))
(declare-datatypes ((List!21906 0))(
  ( (Nil!21903) (Cons!21902 (h!23104 tuple2!15728) (t!31106 List!21906)) )
))
(declare-datatypes ((ListLongMap!13757 0))(
  ( (ListLongMap!13758 (toList!6894 List!21906)) )
))
(declare-fun -!521 (ListLongMap!13757 (_ BitVec 64)) ListLongMap!13757)

(declare-fun getCurrentListMap!3942 (array!65122 array!65124 (_ BitVec 32) (_ BitVec 32) V!37567 V!37567 (_ BitVec 32) Int) ListLongMap!13757)

(assert (=> b!1033619 (= (-!521 (getCurrentListMap!3942 (_keys!11408 thiss!1427) (_values!6251 thiss!1427) (mask!30085 thiss!1427) (extraKeys!5960 thiss!1427) (zeroValue!6064 thiss!1427) (minValue!6064 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6228 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3942 (_keys!11408 thiss!1427) (_values!6251 thiss!1427) (mask!30085 thiss!1427) (bvand (extraKeys!5960 thiss!1427) #b00000000000000000000000000000010) lt!456133 (minValue!6064 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6228 thiss!1427)))))

(declare-datatypes ((Unit!33833 0))(
  ( (Unit!33834) )
))
(declare-fun lt!456134 () Unit!33833)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!13 (array!65122 array!65124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37567 V!37567 V!37567 Int) Unit!33833)

(assert (=> b!1033619 (= lt!456134 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!13 (_keys!11408 thiss!1427) (_values!6251 thiss!1427) (mask!30085 thiss!1427) (extraKeys!5960 thiss!1427) (bvand (extraKeys!5960 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6064 thiss!1427) lt!456133 (minValue!6064 thiss!1427) (defaultEntry!6228 thiss!1427)))))

(declare-fun dynLambda!1991 (Int (_ BitVec 64)) V!37567)

(assert (=> b!1033619 (= lt!456133 (dynLambda!1991 (defaultEntry!6228 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033620 () Bool)

(declare-fun map!14702 (LongMapFixedSize!5708) ListLongMap!13757)

(assert (=> b!1033620 (= e!584264 (= (map!14702 lt!456132) (-!521 (map!14702 thiss!1427) key!909)))))

(declare-fun mapIsEmpty!38264 () Bool)

(declare-fun mapRes!38264 () Bool)

(assert (=> mapIsEmpty!38264 mapRes!38264))

(declare-fun mapNonEmpty!38264 () Bool)

(declare-fun tp!73503 () Bool)

(declare-fun e!584266 () Bool)

(assert (=> mapNonEmpty!38264 (= mapRes!38264 (and tp!73503 e!584266))))

(declare-fun mapRest!38264 () (Array (_ BitVec 32) ValueCell!11557))

(declare-fun mapValue!38264 () ValueCell!11557)

(declare-fun mapKey!38264 () (_ BitVec 32))

(assert (=> mapNonEmpty!38264 (= (arr!31356 (_values!6251 thiss!1427)) (store mapRest!38264 mapKey!38264 mapValue!38264))))

(declare-fun b!1033621 () Bool)

(assert (=> b!1033621 (= e!584266 tp_is_empty!24521)))

(declare-fun b!1033622 () Bool)

(assert (=> b!1033622 (= e!584263 (and e!584261 mapRes!38264))))

(declare-fun condMapEmpty!38264 () Bool)

(declare-fun mapDefault!38264 () ValueCell!11557)

