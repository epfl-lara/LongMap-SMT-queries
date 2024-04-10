; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81204 () Bool)

(assert start!81204)

(declare-fun b!950268 () Bool)

(declare-fun b_free!18239 () Bool)

(declare-fun b_next!18239 () Bool)

(assert (=> b!950268 (= b_free!18239 (not b_next!18239))))

(declare-fun tp!63313 () Bool)

(declare-fun b_and!29695 () Bool)

(assert (=> b!950268 (= tp!63313 b_and!29695)))

(declare-fun b!950260 () Bool)

(declare-fun res!637131 () Bool)

(declare-fun e!534996 () Bool)

(assert (=> b!950260 (=> (not res!637131) (not e!534996))))

(declare-datatypes ((V!32627 0))(
  ( (V!32628 (val!10424 Int)) )
))
(declare-datatypes ((ValueCell!9892 0))(
  ( (ValueCellFull!9892 (v!12967 V!32627)) (EmptyCell!9892) )
))
(declare-datatypes ((array!57512 0))(
  ( (array!57513 (arr!27656 (Array (_ BitVec 32) ValueCell!9892)) (size!28133 (_ BitVec 32))) )
))
(declare-datatypes ((array!57514 0))(
  ( (array!57515 (arr!27657 (Array (_ BitVec 32) (_ BitVec 64))) (size!28134 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4934 0))(
  ( (LongMapFixedSize!4935 (defaultEntry!5778 Int) (mask!27576 (_ BitVec 32)) (extraKeys!5510 (_ BitVec 32)) (zeroValue!5614 V!32627) (minValue!5614 V!32627) (_size!2522 (_ BitVec 32)) (_keys!10714 array!57514) (_values!5801 array!57512) (_vacant!2522 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4934)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950260 (= res!637131 (validMask!0 (mask!27576 thiss!1141)))))

(declare-fun b!950261 () Bool)

(declare-fun e!534995 () Bool)

(declare-fun tp_is_empty!20747 () Bool)

(assert (=> b!950261 (= e!534995 tp_is_empty!20747)))

(declare-fun b!950262 () Bool)

(declare-fun res!637127 () Bool)

(assert (=> b!950262 (=> (not res!637127) (not e!534996))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13546 0))(
  ( (tuple2!13547 (_1!6784 (_ BitVec 64)) (_2!6784 V!32627)) )
))
(declare-datatypes ((List!19337 0))(
  ( (Nil!19334) (Cons!19333 (h!20493 tuple2!13546) (t!27676 List!19337)) )
))
(declare-datatypes ((ListLongMap!12243 0))(
  ( (ListLongMap!12244 (toList!6137 List!19337)) )
))
(declare-fun contains!5228 (ListLongMap!12243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3370 (array!57514 array!57512 (_ BitVec 32) (_ BitVec 32) V!32627 V!32627 (_ BitVec 32) Int) ListLongMap!12243)

(assert (=> b!950262 (= res!637127 (contains!5228 (getCurrentListMap!3370 (_keys!10714 thiss!1141) (_values!5801 thiss!1141) (mask!27576 thiss!1141) (extraKeys!5510 thiss!1141) (zeroValue!5614 thiss!1141) (minValue!5614 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5778 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!33032 () Bool)

(declare-fun mapRes!33032 () Bool)

(declare-fun tp!63312 () Bool)

(assert (=> mapNonEmpty!33032 (= mapRes!33032 (and tp!63312 e!534995))))

(declare-fun mapRest!33032 () (Array (_ BitVec 32) ValueCell!9892))

(declare-fun mapKey!33032 () (_ BitVec 32))

(declare-fun mapValue!33032 () ValueCell!9892)

(assert (=> mapNonEmpty!33032 (= (arr!27656 (_values!5801 thiss!1141)) (store mapRest!33032 mapKey!33032 mapValue!33032))))

(declare-fun b!950264 () Bool)

(declare-fun res!637129 () Bool)

(assert (=> b!950264 (=> (not res!637129) (not e!534996))))

(assert (=> b!950264 (= res!637129 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950265 () Bool)

(declare-fun res!637130 () Bool)

(assert (=> b!950265 (=> (not res!637130) (not e!534996))))

(declare-datatypes ((SeekEntryResult!9139 0))(
  ( (MissingZero!9139 (index!38927 (_ BitVec 32))) (Found!9139 (index!38928 (_ BitVec 32))) (Intermediate!9139 (undefined!9951 Bool) (index!38929 (_ BitVec 32)) (x!81749 (_ BitVec 32))) (Undefined!9139) (MissingVacant!9139 (index!38930 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57514 (_ BitVec 32)) SeekEntryResult!9139)

(assert (=> b!950265 (= res!637130 (not (is-Found!9139 (seekEntry!0 key!756 (_keys!10714 thiss!1141) (mask!27576 thiss!1141)))))))

(declare-fun b!950266 () Bool)

(declare-fun e!534997 () Bool)

(assert (=> b!950266 (= e!534997 tp_is_empty!20747)))

(declare-fun mapIsEmpty!33032 () Bool)

(assert (=> mapIsEmpty!33032 mapRes!33032))

(declare-fun b!950267 () Bool)

(declare-fun res!637128 () Bool)

(assert (=> b!950267 (=> (not res!637128) (not e!534996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57514 (_ BitVec 32)) Bool)

(assert (=> b!950267 (= res!637128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10714 thiss!1141) (mask!27576 thiss!1141)))))

(declare-fun e!534998 () Bool)

(declare-fun e!534994 () Bool)

(declare-fun array_inv!21466 (array!57514) Bool)

(declare-fun array_inv!21467 (array!57512) Bool)

(assert (=> b!950268 (= e!534994 (and tp!63313 tp_is_empty!20747 (array_inv!21466 (_keys!10714 thiss!1141)) (array_inv!21467 (_values!5801 thiss!1141)) e!534998))))

(declare-fun b!950263 () Bool)

(declare-fun res!637132 () Bool)

(assert (=> b!950263 (=> (not res!637132) (not e!534996))))

(assert (=> b!950263 (= res!637132 (and (= (size!28133 (_values!5801 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27576 thiss!1141))) (= (size!28134 (_keys!10714 thiss!1141)) (size!28133 (_values!5801 thiss!1141))) (bvsge (mask!27576 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5510 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5510 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun res!637126 () Bool)

(assert (=> start!81204 (=> (not res!637126) (not e!534996))))

(declare-fun valid!1876 (LongMapFixedSize!4934) Bool)

(assert (=> start!81204 (= res!637126 (valid!1876 thiss!1141))))

(assert (=> start!81204 e!534996))

(assert (=> start!81204 e!534994))

(assert (=> start!81204 true))

(declare-fun b!950269 () Bool)

(assert (=> b!950269 (= e!534996 false)))

(declare-fun lt!427938 () Bool)

(declare-datatypes ((List!19338 0))(
  ( (Nil!19335) (Cons!19334 (h!20494 (_ BitVec 64)) (t!27677 List!19338)) )
))
(declare-fun arrayNoDuplicates!0 (array!57514 (_ BitVec 32) List!19338) Bool)

(assert (=> b!950269 (= lt!427938 (arrayNoDuplicates!0 (_keys!10714 thiss!1141) #b00000000000000000000000000000000 Nil!19335))))

(declare-fun b!950270 () Bool)

(assert (=> b!950270 (= e!534998 (and e!534997 mapRes!33032))))

(declare-fun condMapEmpty!33032 () Bool)

(declare-fun mapDefault!33032 () ValueCell!9892)

