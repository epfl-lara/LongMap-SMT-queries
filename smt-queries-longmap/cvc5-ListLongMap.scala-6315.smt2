; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81042 () Bool)

(assert start!81042)

(declare-fun b!948974 () Bool)

(declare-fun b_free!18211 () Bool)

(declare-fun b_next!18211 () Bool)

(assert (=> b!948974 (= b_free!18211 (not b_next!18211))))

(declare-fun tp!63215 () Bool)

(declare-fun b_and!29651 () Bool)

(assert (=> b!948974 (= tp!63215 b_and!29651)))

(declare-fun b!948972 () Bool)

(declare-fun e!534231 () Bool)

(declare-fun tp_is_empty!20719 () Bool)

(assert (=> b!948972 (= e!534231 tp_is_empty!20719)))

(declare-fun mapNonEmpty!32976 () Bool)

(declare-fun mapRes!32976 () Bool)

(declare-fun tp!63214 () Bool)

(declare-fun e!534230 () Bool)

(assert (=> mapNonEmpty!32976 (= mapRes!32976 (and tp!63214 e!534230))))

(declare-fun mapKey!32976 () (_ BitVec 32))

(declare-datatypes ((V!32591 0))(
  ( (V!32592 (val!10410 Int)) )
))
(declare-datatypes ((ValueCell!9878 0))(
  ( (ValueCellFull!9878 (v!12949 V!32591)) (EmptyCell!9878) )
))
(declare-fun mapRest!32976 () (Array (_ BitVec 32) ValueCell!9878))

(declare-datatypes ((array!57448 0))(
  ( (array!57449 (arr!27628 (Array (_ BitVec 32) ValueCell!9878)) (size!28103 (_ BitVec 32))) )
))
(declare-datatypes ((array!57450 0))(
  ( (array!57451 (arr!27629 (Array (_ BitVec 32) (_ BitVec 64))) (size!28104 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4906 0))(
  ( (LongMapFixedSize!4907 (defaultEntry!5758 Int) (mask!27530 (_ BitVec 32)) (extraKeys!5490 (_ BitVec 32)) (zeroValue!5594 V!32591) (minValue!5594 V!32591) (_size!2508 (_ BitVec 32)) (_keys!10682 array!57450) (_values!5781 array!57448) (_vacant!2508 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4906)

(declare-fun mapValue!32976 () ValueCell!9878)

(assert (=> mapNonEmpty!32976 (= (arr!27628 (_values!5781 thiss!1141)) (store mapRest!32976 mapKey!32976 mapValue!32976))))

(declare-fun res!636531 () Bool)

(declare-fun e!534228 () Bool)

(assert (=> start!81042 (=> (not res!636531) (not e!534228))))

(declare-fun valid!1869 (LongMapFixedSize!4906) Bool)

(assert (=> start!81042 (= res!636531 (valid!1869 thiss!1141))))

(assert (=> start!81042 e!534228))

(declare-fun e!534232 () Bool)

(assert (=> start!81042 e!534232))

(assert (=> start!81042 true))

(declare-fun b!948973 () Bool)

(declare-fun res!636530 () Bool)

(assert (=> b!948973 (=> (not res!636530) (not e!534228))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13530 0))(
  ( (tuple2!13531 (_1!6776 (_ BitVec 64)) (_2!6776 V!32591)) )
))
(declare-datatypes ((List!19323 0))(
  ( (Nil!19320) (Cons!19319 (h!20477 tuple2!13530) (t!27654 List!19323)) )
))
(declare-datatypes ((ListLongMap!12227 0))(
  ( (ListLongMap!12228 (toList!6129 List!19323)) )
))
(declare-fun contains!5215 (ListLongMap!12227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3362 (array!57450 array!57448 (_ BitVec 32) (_ BitVec 32) V!32591 V!32591 (_ BitVec 32) Int) ListLongMap!12227)

(assert (=> b!948973 (= res!636530 (contains!5215 (getCurrentListMap!3362 (_keys!10682 thiss!1141) (_values!5781 thiss!1141) (mask!27530 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)) key!756))))

(declare-fun e!534233 () Bool)

(declare-fun array_inv!21448 (array!57450) Bool)

(declare-fun array_inv!21449 (array!57448) Bool)

(assert (=> b!948974 (= e!534232 (and tp!63215 tp_is_empty!20719 (array_inv!21448 (_keys!10682 thiss!1141)) (array_inv!21449 (_values!5781 thiss!1141)) e!534233))))

(declare-fun b!948975 () Bool)

(declare-fun res!636532 () Bool)

(assert (=> b!948975 (=> (not res!636532) (not e!534228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948975 (= res!636532 (validMask!0 (mask!27530 thiss!1141)))))

(declare-fun b!948976 () Bool)

(declare-fun res!636534 () Bool)

(assert (=> b!948976 (=> (not res!636534) (not e!534228))))

(assert (=> b!948976 (= res!636534 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948977 () Bool)

(assert (=> b!948977 (= e!534228 (and (= (size!28103 (_values!5781 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27530 thiss!1141))) (= (size!28104 (_keys!10682 thiss!1141)) (size!28103 (_values!5781 thiss!1141))) (bvsge (mask!27530 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5490 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!948978 () Bool)

(assert (=> b!948978 (= e!534230 tp_is_empty!20719)))

(declare-fun b!948979 () Bool)

(declare-fun res!636533 () Bool)

(assert (=> b!948979 (=> (not res!636533) (not e!534228))))

(declare-datatypes ((SeekEntryResult!9130 0))(
  ( (MissingZero!9130 (index!38891 (_ BitVec 32))) (Found!9130 (index!38892 (_ BitVec 32))) (Intermediate!9130 (undefined!9942 Bool) (index!38893 (_ BitVec 32)) (x!81652 (_ BitVec 32))) (Undefined!9130) (MissingVacant!9130 (index!38894 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57450 (_ BitVec 32)) SeekEntryResult!9130)

(assert (=> b!948979 (= res!636533 (not (is-Found!9130 (seekEntry!0 key!756 (_keys!10682 thiss!1141) (mask!27530 thiss!1141)))))))

(declare-fun b!948980 () Bool)

(assert (=> b!948980 (= e!534233 (and e!534231 mapRes!32976))))

(declare-fun condMapEmpty!32976 () Bool)

(declare-fun mapDefault!32976 () ValueCell!9878)

