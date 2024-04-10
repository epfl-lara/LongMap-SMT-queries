; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81584 () Bool)

(assert start!81584)

(declare-fun b!953074 () Bool)

(declare-fun b_free!18311 () Bool)

(declare-fun b_next!18311 () Bool)

(assert (=> b!953074 (= b_free!18311 (not b_next!18311))))

(declare-fun tp!63560 () Bool)

(declare-fun b_and!29795 () Bool)

(assert (=> b!953074 (= tp!63560 b_and!29795)))

(declare-fun mapNonEmpty!33172 () Bool)

(declare-fun mapRes!33172 () Bool)

(declare-fun tp!63561 () Bool)

(declare-fun e!536796 () Bool)

(assert (=> mapNonEmpty!33172 (= mapRes!33172 (and tp!63561 e!536796))))

(declare-fun mapKey!33172 () (_ BitVec 32))

(declare-datatypes ((V!32723 0))(
  ( (V!32724 (val!10460 Int)) )
))
(declare-datatypes ((ValueCell!9928 0))(
  ( (ValueCellFull!9928 (v!13013 V!32723)) (EmptyCell!9928) )
))
(declare-datatypes ((array!57676 0))(
  ( (array!57677 (arr!27728 (Array (_ BitVec 32) ValueCell!9928)) (size!28207 (_ BitVec 32))) )
))
(declare-datatypes ((array!57678 0))(
  ( (array!57679 (arr!27729 (Array (_ BitVec 32) (_ BitVec 64))) (size!28208 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5006 0))(
  ( (LongMapFixedSize!5007 (defaultEntry!5838 Int) (mask!27701 (_ BitVec 32)) (extraKeys!5570 (_ BitVec 32)) (zeroValue!5674 V!32723) (minValue!5674 V!32723) (_size!2558 (_ BitVec 32)) (_keys!10797 array!57678) (_values!5861 array!57676) (_vacant!2558 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!5006)

(declare-fun mapValue!33172 () ValueCell!9928)

(declare-fun mapRest!33172 () (Array (_ BitVec 32) ValueCell!9928))

(assert (=> mapNonEmpty!33172 (= (arr!27728 (_values!5861 thiss!1141)) (store mapRest!33172 mapKey!33172 mapValue!33172))))

(declare-fun b!953070 () Bool)

(declare-datatypes ((Unit!32067 0))(
  ( (Unit!32068) )
))
(declare-fun e!536801 () Unit!32067)

(declare-fun Unit!32069 () Unit!32067)

(assert (=> b!953070 (= e!536801 Unit!32069)))

(declare-fun lt!429522 () Unit!32067)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun lemmaKeyInListMapIsInArray!342 (array!57678 array!57676 (_ BitVec 32) (_ BitVec 32) V!32723 V!32723 (_ BitVec 64) Int) Unit!32067)

(assert (=> b!953070 (= lt!429522 (lemmaKeyInListMapIsInArray!342 (_keys!10797 thiss!1141) (_values!5861 thiss!1141) (mask!27701 thiss!1141) (extraKeys!5570 thiss!1141) (zeroValue!5674 thiss!1141) (minValue!5674 thiss!1141) key!756 (defaultEntry!5838 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953070 (arrayContainsKey!0 (_keys!10797 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429520 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57678 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953070 (= lt!429520 (arrayScanForKey!0 (_keys!10797 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun lt!429521 () Unit!32067)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32067)

(assert (=> b!953070 (= lt!429521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10797 thiss!1141) (mask!27701 thiss!1141) #b00000000000000000000000000000000 lt!429520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57678 (_ BitVec 32)) Bool)

(assert (=> b!953070 (arrayForallSeekEntryOrOpenFound!0 lt!429520 (_keys!10797 thiss!1141) (mask!27701 thiss!1141))))

(declare-fun lt!429518 () Unit!32067)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57678 (_ BitVec 32)) Unit!32067)

(assert (=> b!953070 (= lt!429518 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429520 (_keys!10797 thiss!1141) (mask!27701 thiss!1141)))))

(assert (=> b!953070 false))

(declare-fun res!638350 () Bool)

(declare-fun e!536802 () Bool)

(assert (=> start!81584 (=> (not res!638350) (not e!536802))))

(declare-fun valid!1905 (LongMapFixedSize!5006) Bool)

(assert (=> start!81584 (= res!638350 (valid!1905 thiss!1141))))

(assert (=> start!81584 e!536802))

(declare-fun e!536798 () Bool)

(assert (=> start!81584 e!536798))

(assert (=> start!81584 true))

(declare-fun b!953071 () Bool)

(declare-fun e!536797 () Bool)

(declare-fun tp_is_empty!20819 () Bool)

(assert (=> b!953071 (= e!536797 tp_is_empty!20819)))

(declare-fun b!953072 () Bool)

(declare-datatypes ((tuple2!13600 0))(
  ( (tuple2!13601 (_1!6811 (_ BitVec 64)) (_2!6811 V!32723)) )
))
(declare-datatypes ((List!19375 0))(
  ( (Nil!19372) (Cons!19371 (h!20533 tuple2!13600) (t!27734 List!19375)) )
))
(declare-datatypes ((ListLongMap!12297 0))(
  ( (ListLongMap!12298 (toList!6164 List!19375)) )
))
(declare-fun contains!5259 (ListLongMap!12297 (_ BitVec 64)) Bool)

(declare-fun map!13111 (LongMapFixedSize!5006) ListLongMap!12297)

(assert (=> b!953072 (= e!536802 (contains!5259 (map!13111 thiss!1141) key!756))))

(declare-fun lt!429519 () Unit!32067)

(assert (=> b!953072 (= lt!429519 e!536801)))

(declare-fun c!99742 () Bool)

(declare-fun getCurrentListMap!3397 (array!57678 array!57676 (_ BitVec 32) (_ BitVec 32) V!32723 V!32723 (_ BitVec 32) Int) ListLongMap!12297)

(assert (=> b!953072 (= c!99742 (contains!5259 (getCurrentListMap!3397 (_keys!10797 thiss!1141) (_values!5861 thiss!1141) (mask!27701 thiss!1141) (extraKeys!5570 thiss!1141) (zeroValue!5674 thiss!1141) (minValue!5674 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5838 thiss!1141)) key!756))))

(declare-fun b!953073 () Bool)

(declare-fun res!638351 () Bool)

(assert (=> b!953073 (=> (not res!638351) (not e!536802))))

(declare-datatypes ((SeekEntryResult!9168 0))(
  ( (MissingZero!9168 (index!39043 (_ BitVec 32))) (Found!9168 (index!39044 (_ BitVec 32))) (Intermediate!9168 (undefined!9980 Bool) (index!39045 (_ BitVec 32)) (x!81990 (_ BitVec 32))) (Undefined!9168) (MissingVacant!9168 (index!39046 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57678 (_ BitVec 32)) SeekEntryResult!9168)

(assert (=> b!953073 (= res!638351 (not (is-Found!9168 (seekEntry!0 key!756 (_keys!10797 thiss!1141) (mask!27701 thiss!1141)))))))

(declare-fun e!536800 () Bool)

(declare-fun array_inv!21518 (array!57678) Bool)

(declare-fun array_inv!21519 (array!57676) Bool)

(assert (=> b!953074 (= e!536798 (and tp!63560 tp_is_empty!20819 (array_inv!21518 (_keys!10797 thiss!1141)) (array_inv!21519 (_values!5861 thiss!1141)) e!536800))))

(declare-fun mapIsEmpty!33172 () Bool)

(assert (=> mapIsEmpty!33172 mapRes!33172))

(declare-fun b!953075 () Bool)

(declare-fun res!638352 () Bool)

(assert (=> b!953075 (=> (not res!638352) (not e!536802))))

(assert (=> b!953075 (= res!638352 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!953076 () Bool)

(assert (=> b!953076 (= e!536796 tp_is_empty!20819)))

(declare-fun b!953077 () Bool)

(assert (=> b!953077 (= e!536800 (and e!536797 mapRes!33172))))

(declare-fun condMapEmpty!33172 () Bool)

(declare-fun mapDefault!33172 () ValueCell!9928)

