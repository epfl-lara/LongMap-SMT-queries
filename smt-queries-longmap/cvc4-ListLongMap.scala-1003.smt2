; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21622 () Bool)

(assert start!21622)

(declare-fun b!216741 () Bool)

(declare-fun b_free!5771 () Bool)

(declare-fun b_next!5771 () Bool)

(assert (=> b!216741 (= b_free!5771 (not b_next!5771))))

(declare-fun tp!20448 () Bool)

(declare-fun b_and!12661 () Bool)

(assert (=> b!216741 (= tp!20448 b_and!12661)))

(declare-fun b!216733 () Bool)

(declare-fun res!106021 () Bool)

(declare-fun e!141007 () Bool)

(assert (=> b!216733 (=> (not res!106021) (not e!141007))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216733 (= res!106021 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216734 () Bool)

(declare-fun res!106025 () Bool)

(declare-fun e!141010 () Bool)

(assert (=> b!216734 (=> (not res!106025) (not e!141010))))

(declare-datatypes ((V!7157 0))(
  ( (V!7158 (val!2861 Int)) )
))
(declare-datatypes ((ValueCell!2473 0))(
  ( (ValueCellFull!2473 (v!4879 V!7157)) (EmptyCell!2473) )
))
(declare-datatypes ((array!10505 0))(
  ( (array!10506 (arr!4974 (Array (_ BitVec 32) ValueCell!2473)) (size!5306 (_ BitVec 32))) )
))
(declare-datatypes ((array!10507 0))(
  ( (array!10508 (arr!4975 (Array (_ BitVec 32) (_ BitVec 64))) (size!5307 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2846 0))(
  ( (LongMapFixedSize!2847 (defaultEntry!4073 Int) (mask!9814 (_ BitVec 32)) (extraKeys!3810 (_ BitVec 32)) (zeroValue!3914 V!7157) (minValue!3914 V!7157) (_size!1472 (_ BitVec 32)) (_keys!6122 array!10507) (_values!4056 array!10505) (_vacant!1472 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2846)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216734 (= res!106025 (validMask!0 (mask!9814 thiss!1504)))))

(declare-fun b!216735 () Bool)

(assert (=> b!216735 (= e!141007 e!141010)))

(declare-fun res!106020 () Bool)

(assert (=> b!216735 (=> (not res!106020) (not e!141010))))

(declare-datatypes ((SeekEntryResult!750 0))(
  ( (MissingZero!750 (index!5170 (_ BitVec 32))) (Found!750 (index!5171 (_ BitVec 32))) (Intermediate!750 (undefined!1562 Bool) (index!5172 (_ BitVec 32)) (x!22662 (_ BitVec 32))) (Undefined!750) (MissingVacant!750 (index!5173 (_ BitVec 32))) )
))
(declare-fun lt!111218 () SeekEntryResult!750)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216735 (= res!106020 (or (= lt!111218 (MissingZero!750 index!297)) (= lt!111218 (MissingVacant!750 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10507 (_ BitVec 32)) SeekEntryResult!750)

(assert (=> b!216735 (= lt!111218 (seekEntryOrOpen!0 key!932 (_keys!6122 thiss!1504) (mask!9814 thiss!1504)))))

(declare-fun mapNonEmpty!9612 () Bool)

(declare-fun mapRes!9612 () Bool)

(declare-fun tp!20447 () Bool)

(declare-fun e!141006 () Bool)

(assert (=> mapNonEmpty!9612 (= mapRes!9612 (and tp!20447 e!141006))))

(declare-fun mapValue!9612 () ValueCell!2473)

(declare-fun mapKey!9612 () (_ BitVec 32))

(declare-fun mapRest!9612 () (Array (_ BitVec 32) ValueCell!2473))

(assert (=> mapNonEmpty!9612 (= (arr!4974 (_values!4056 thiss!1504)) (store mapRest!9612 mapKey!9612 mapValue!9612))))

(declare-fun b!216736 () Bool)

(declare-fun res!106022 () Bool)

(assert (=> b!216736 (=> (not res!106022) (not e!141010))))

(assert (=> b!216736 (= res!106022 (and (= (size!5306 (_values!4056 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9814 thiss!1504))) (= (size!5307 (_keys!6122 thiss!1504)) (size!5306 (_values!4056 thiss!1504))) (bvsge (mask!9814 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3810 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3810 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216737 () Bool)

(declare-fun res!106024 () Bool)

(assert (=> b!216737 (=> (not res!106024) (not e!141010))))

(declare-datatypes ((tuple2!4256 0))(
  ( (tuple2!4257 (_1!2139 (_ BitVec 64)) (_2!2139 V!7157)) )
))
(declare-datatypes ((List!3161 0))(
  ( (Nil!3158) (Cons!3157 (h!3804 tuple2!4256) (t!8116 List!3161)) )
))
(declare-datatypes ((ListLongMap!3169 0))(
  ( (ListLongMap!3170 (toList!1600 List!3161)) )
))
(declare-fun contains!1441 (ListLongMap!3169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1128 (array!10507 array!10505 (_ BitVec 32) (_ BitVec 32) V!7157 V!7157 (_ BitVec 32) Int) ListLongMap!3169)

(assert (=> b!216737 (= res!106024 (contains!1441 (getCurrentListMap!1128 (_keys!6122 thiss!1504) (_values!4056 thiss!1504) (mask!9814 thiss!1504) (extraKeys!3810 thiss!1504) (zeroValue!3914 thiss!1504) (minValue!3914 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4073 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!9612 () Bool)

(assert (=> mapIsEmpty!9612 mapRes!9612))

(declare-fun b!216738 () Bool)

(declare-fun tp_is_empty!5633 () Bool)

(assert (=> b!216738 (= e!141006 tp_is_empty!5633)))

(declare-fun b!216739 () Bool)

(declare-fun e!141005 () Bool)

(declare-fun e!141004 () Bool)

(assert (=> b!216739 (= e!141005 (and e!141004 mapRes!9612))))

(declare-fun condMapEmpty!9612 () Bool)

(declare-fun mapDefault!9612 () ValueCell!2473)

