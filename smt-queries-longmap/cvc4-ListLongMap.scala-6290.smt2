; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80422 () Bool)

(assert start!80422)

(declare-fun b!944707 () Bool)

(declare-fun b_free!18065 () Bool)

(declare-fun b_next!18065 () Bool)

(assert (=> b!944707 (= b_free!18065 (not b_next!18065))))

(declare-fun tp!62705 () Bool)

(declare-fun b_and!29483 () Bool)

(assert (=> b!944707 (= tp!62705 b_and!29483)))

(declare-fun e!531262 () Bool)

(declare-datatypes ((V!32395 0))(
  ( (V!32396 (val!10337 Int)) )
))
(declare-datatypes ((ValueCell!9805 0))(
  ( (ValueCellFull!9805 (v!12869 V!32395)) (EmptyCell!9805) )
))
(declare-datatypes ((array!57114 0))(
  ( (array!57115 (arr!27482 (Array (_ BitVec 32) ValueCell!9805)) (size!27948 (_ BitVec 32))) )
))
(declare-datatypes ((array!57116 0))(
  ( (array!57117 (arr!27483 (Array (_ BitVec 32) (_ BitVec 64))) (size!27949 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4760 0))(
  ( (LongMapFixedSize!4761 (defaultEntry!5675 Int) (mask!27329 (_ BitVec 32)) (extraKeys!5407 (_ BitVec 32)) (zeroValue!5511 V!32395) (minValue!5511 V!32395) (_size!2435 (_ BitVec 32)) (_keys!10553 array!57116) (_values!5698 array!57114) (_vacant!2435 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4760)

(declare-fun tp_is_empty!20573 () Bool)

(declare-fun e!531265 () Bool)

(declare-fun array_inv!21352 (array!57116) Bool)

(declare-fun array_inv!21353 (array!57114) Bool)

(assert (=> b!944707 (= e!531262 (and tp!62705 tp_is_empty!20573 (array_inv!21352 (_keys!10553 thiss!1141)) (array_inv!21353 (_values!5698 thiss!1141)) e!531265))))

(declare-fun b!944708 () Bool)

(declare-fun e!531259 () Bool)

(assert (=> b!944708 (= e!531259 true)))

(declare-datatypes ((SeekEntryResult!9074 0))(
  ( (MissingZero!9074 (index!38667 (_ BitVec 32))) (Found!9074 (index!38668 (_ BitVec 32))) (Intermediate!9074 (undefined!9886 Bool) (index!38669 (_ BitVec 32)) (x!81141 (_ BitVec 32))) (Undefined!9074) (MissingVacant!9074 (index!38670 (_ BitVec 32))) )
))
(declare-fun lt!425721 () SeekEntryResult!9074)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57116 (_ BitVec 32)) SeekEntryResult!9074)

(assert (=> b!944708 (= lt!425721 (seekEntryOrOpen!0 key!756 (_keys!10553 thiss!1141) (mask!27329 thiss!1141)))))

(declare-fun b!944709 () Bool)

(declare-fun res!634629 () Bool)

(declare-fun e!531263 () Bool)

(assert (=> b!944709 (=> (not res!634629) (not e!531263))))

(declare-datatypes ((tuple2!13492 0))(
  ( (tuple2!13493 (_1!6757 (_ BitVec 64)) (_2!6757 V!32395)) )
))
(declare-datatypes ((List!19280 0))(
  ( (Nil!19277) (Cons!19276 (h!20427 tuple2!13492) (t!27597 List!19280)) )
))
(declare-datatypes ((ListLongMap!12189 0))(
  ( (ListLongMap!12190 (toList!6110 List!19280)) )
))
(declare-fun contains!5182 (ListLongMap!12189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3344 (array!57116 array!57114 (_ BitVec 32) (_ BitVec 32) V!32395 V!32395 (_ BitVec 32) Int) ListLongMap!12189)

(assert (=> b!944709 (= res!634629 (contains!5182 (getCurrentListMap!3344 (_keys!10553 thiss!1141) (_values!5698 thiss!1141) (mask!27329 thiss!1141) (extraKeys!5407 thiss!1141) (zeroValue!5511 thiss!1141) (minValue!5511 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5675 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32685 () Bool)

(declare-fun mapRes!32685 () Bool)

(declare-fun tp!62704 () Bool)

(declare-fun e!531261 () Bool)

(assert (=> mapNonEmpty!32685 (= mapRes!32685 (and tp!62704 e!531261))))

(declare-fun mapRest!32685 () (Array (_ BitVec 32) ValueCell!9805))

(declare-fun mapValue!32685 () ValueCell!9805)

(declare-fun mapKey!32685 () (_ BitVec 32))

(assert (=> mapNonEmpty!32685 (= (arr!27482 (_values!5698 thiss!1141)) (store mapRest!32685 mapKey!32685 mapValue!32685))))

(declare-fun b!944710 () Bool)

(declare-fun res!634630 () Bool)

(assert (=> b!944710 (=> res!634630 e!531259)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944710 (= res!634630 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944711 () Bool)

(declare-fun e!531264 () Bool)

(assert (=> b!944711 (= e!531265 (and e!531264 mapRes!32685))))

(declare-fun condMapEmpty!32685 () Bool)

(declare-fun mapDefault!32685 () ValueCell!9805)

