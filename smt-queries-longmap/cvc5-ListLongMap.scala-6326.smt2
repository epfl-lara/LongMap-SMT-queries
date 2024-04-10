; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81406 () Bool)

(assert start!81406)

(declare-fun b!951766 () Bool)

(declare-fun b_free!18277 () Bool)

(declare-fun b_next!18277 () Bool)

(assert (=> b!951766 (= b_free!18277 (not b_next!18277))))

(declare-fun tp!63446 () Bool)

(declare-fun b_and!29749 () Bool)

(assert (=> b!951766 (= tp!63446 b_and!29749)))

(declare-fun b!951758 () Bool)

(declare-fun e!535966 () Bool)

(declare-fun tp_is_empty!20785 () Bool)

(assert (=> b!951758 (= e!535966 tp_is_empty!20785)))

(declare-fun res!637771 () Bool)

(declare-fun e!535969 () Bool)

(assert (=> start!81406 (=> (not res!637771) (not e!535969))))

(declare-datatypes ((V!32679 0))(
  ( (V!32680 (val!10443 Int)) )
))
(declare-datatypes ((ValueCell!9911 0))(
  ( (ValueCellFull!9911 (v!12992 V!32679)) (EmptyCell!9911) )
))
(declare-datatypes ((array!57600 0))(
  ( (array!57601 (arr!27694 (Array (_ BitVec 32) ValueCell!9911)) (size!28172 (_ BitVec 32))) )
))
(declare-datatypes ((array!57602 0))(
  ( (array!57603 (arr!27695 (Array (_ BitVec 32) (_ BitVec 64))) (size!28173 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4972 0))(
  ( (LongMapFixedSize!4973 (defaultEntry!5811 Int) (mask!27642 (_ BitVec 32)) (extraKeys!5543 (_ BitVec 32)) (zeroValue!5647 V!32679) (minValue!5647 V!32679) (_size!2541 (_ BitVec 32)) (_keys!10758 array!57602) (_values!5834 array!57600) (_vacant!2541 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4972)

(declare-fun valid!1892 (LongMapFixedSize!4972) Bool)

(assert (=> start!81406 (= res!637771 (valid!1892 thiss!1141))))

(assert (=> start!81406 e!535969))

(declare-fun e!535965 () Bool)

(assert (=> start!81406 e!535965))

(assert (=> start!81406 true))

(declare-fun b!951759 () Bool)

(declare-fun e!535967 () Bool)

(assert (=> b!951759 (= e!535967 tp_is_empty!20785)))

(declare-fun b!951760 () Bool)

(declare-fun res!637774 () Bool)

(assert (=> b!951760 (=> (not res!637774) (not e!535969))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9156 0))(
  ( (MissingZero!9156 (index!38995 (_ BitVec 32))) (Found!9156 (index!38996 (_ BitVec 32))) (Intermediate!9156 (undefined!9968 Bool) (index!38997 (_ BitVec 32)) (x!81890 (_ BitVec 32))) (Undefined!9156) (MissingVacant!9156 (index!38998 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57602 (_ BitVec 32)) SeekEntryResult!9156)

(assert (=> b!951760 (= res!637774 (not (is-Found!9156 (seekEntry!0 key!756 (_keys!10758 thiss!1141) (mask!27642 thiss!1141)))))))

(declare-fun b!951761 () Bool)

(declare-fun e!535970 () Bool)

(assert (=> b!951761 (= e!535970 (= (size!28173 (_keys!10758 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27642 thiss!1141))))))

(declare-fun mapIsEmpty!33108 () Bool)

(declare-fun mapRes!33108 () Bool)

(assert (=> mapIsEmpty!33108 mapRes!33108))

(declare-fun b!951762 () Bool)

(declare-fun res!637773 () Bool)

(assert (=> b!951762 (=> (not res!637773) (not e!535969))))

(declare-datatypes ((tuple2!13576 0))(
  ( (tuple2!13577 (_1!6799 (_ BitVec 64)) (_2!6799 V!32679)) )
))
(declare-datatypes ((List!19359 0))(
  ( (Nil!19356) (Cons!19355 (h!20516 tuple2!13576) (t!27710 List!19359)) )
))
(declare-datatypes ((ListLongMap!12273 0))(
  ( (ListLongMap!12274 (toList!6152 List!19359)) )
))
(declare-fun contains!5245 (ListLongMap!12273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3385 (array!57602 array!57600 (_ BitVec 32) (_ BitVec 32) V!32679 V!32679 (_ BitVec 32) Int) ListLongMap!12273)

(assert (=> b!951762 (= res!637773 (contains!5245 (getCurrentListMap!3385 (_keys!10758 thiss!1141) (_values!5834 thiss!1141) (mask!27642 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)) key!756))))

(declare-fun b!951763 () Bool)

(assert (=> b!951763 (= e!535969 (not e!535970))))

(declare-fun res!637772 () Bool)

(assert (=> b!951763 (=> res!637772 e!535970)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951763 (= res!637772 (not (validMask!0 (mask!27642 thiss!1141))))))

(declare-fun lt!428770 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57602 (_ BitVec 32)) Bool)

(assert (=> b!951763 (arrayForallSeekEntryOrOpenFound!0 lt!428770 (_keys!10758 thiss!1141) (mask!27642 thiss!1141))))

(declare-datatypes ((Unit!32029 0))(
  ( (Unit!32030) )
))
(declare-fun lt!428771 () Unit!32029)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32029)

(assert (=> b!951763 (= lt!428771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10758 thiss!1141) (mask!27642 thiss!1141) #b00000000000000000000000000000000 lt!428770))))

(declare-fun arrayScanForKey!0 (array!57602 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951763 (= lt!428770 (arrayScanForKey!0 (_keys!10758 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951763 (arrayContainsKey!0 (_keys!10758 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!428772 () Unit!32029)

(declare-fun lemmaKeyInListMapIsInArray!331 (array!57602 array!57600 (_ BitVec 32) (_ BitVec 32) V!32679 V!32679 (_ BitVec 64) Int) Unit!32029)

(assert (=> b!951763 (= lt!428772 (lemmaKeyInListMapIsInArray!331 (_keys!10758 thiss!1141) (_values!5834 thiss!1141) (mask!27642 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) key!756 (defaultEntry!5811 thiss!1141)))))

(declare-fun b!951764 () Bool)

(declare-fun res!637775 () Bool)

(assert (=> b!951764 (=> (not res!637775) (not e!535969))))

(assert (=> b!951764 (= res!637775 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951765 () Bool)

(declare-fun e!535964 () Bool)

(assert (=> b!951765 (= e!535964 (and e!535967 mapRes!33108))))

(declare-fun condMapEmpty!33108 () Bool)

(declare-fun mapDefault!33108 () ValueCell!9911)

