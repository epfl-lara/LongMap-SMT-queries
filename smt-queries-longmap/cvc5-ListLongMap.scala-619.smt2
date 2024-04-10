; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16062 () Bool)

(assert start!16062)

(declare-fun b!159429 () Bool)

(declare-fun b_free!3523 () Bool)

(declare-fun b_next!3523 () Bool)

(assert (=> b!159429 (= b_free!3523 (not b_next!3523))))

(declare-fun tp!13139 () Bool)

(declare-fun b_and!9937 () Bool)

(assert (=> b!159429 (= tp!13139 b_and!9937)))

(declare-fun mapNonEmpty!5675 () Bool)

(declare-fun mapRes!5675 () Bool)

(declare-fun tp!13138 () Bool)

(declare-fun e!104354 () Bool)

(assert (=> mapNonEmpty!5675 (= mapRes!5675 (and tp!13138 e!104354))))

(declare-fun mapKey!5675 () (_ BitVec 32))

(declare-datatypes ((V!4081 0))(
  ( (V!4082 (val!1707 Int)) )
))
(declare-datatypes ((ValueCell!1319 0))(
  ( (ValueCellFull!1319 (v!3572 V!4081)) (EmptyCell!1319) )
))
(declare-fun mapValue!5675 () ValueCell!1319)

(declare-fun mapRest!5675 () (Array (_ BitVec 32) ValueCell!1319))

(declare-datatypes ((array!5729 0))(
  ( (array!5730 (arr!2709 (Array (_ BitVec 32) (_ BitVec 64))) (size!2993 (_ BitVec 32))) )
))
(declare-datatypes ((array!5731 0))(
  ( (array!5732 (arr!2710 (Array (_ BitVec 32) ValueCell!1319)) (size!2994 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1546 0))(
  ( (LongMapFixedSize!1547 (defaultEntry!3215 Int) (mask!7765 (_ BitVec 32)) (extraKeys!2956 (_ BitVec 32)) (zeroValue!3058 V!4081) (minValue!3058 V!4081) (_size!822 (_ BitVec 32)) (_keys!5016 array!5729) (_values!3198 array!5731) (_vacant!822 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1546)

(assert (=> mapNonEmpty!5675 (= (arr!2710 (_values!3198 thiss!1248)) (store mapRest!5675 mapKey!5675 mapValue!5675))))

(declare-fun e!104353 () Bool)

(declare-fun tp_is_empty!3325 () Bool)

(declare-fun e!104358 () Bool)

(declare-fun array_inv!1723 (array!5729) Bool)

(declare-fun array_inv!1724 (array!5731) Bool)

(assert (=> b!159429 (= e!104353 (and tp!13139 tp_is_empty!3325 (array_inv!1723 (_keys!5016 thiss!1248)) (array_inv!1724 (_values!3198 thiss!1248)) e!104358))))

(declare-fun b!159430 () Bool)

(declare-fun e!104355 () Bool)

(assert (=> b!159430 (= e!104355 false)))

(declare-fun lt!81997 () Bool)

(declare-datatypes ((List!1907 0))(
  ( (Nil!1904) (Cons!1903 (h!2516 (_ BitVec 64)) (t!6709 List!1907)) )
))
(declare-fun arrayNoDuplicates!0 (array!5729 (_ BitVec 32) List!1907) Bool)

(assert (=> b!159430 (= lt!81997 (arrayNoDuplicates!0 (_keys!5016 thiss!1248) #b00000000000000000000000000000000 Nil!1904))))

(declare-fun b!159431 () Bool)

(declare-fun res!75325 () Bool)

(assert (=> b!159431 (=> (not res!75325) (not e!104355))))

(assert (=> b!159431 (= res!75325 (and (= (size!2994 (_values!3198 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7765 thiss!1248))) (= (size!2993 (_keys!5016 thiss!1248)) (size!2994 (_values!3198 thiss!1248))) (bvsge (mask!7765 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2956 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2956 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159432 () Bool)

(declare-fun res!75324 () Bool)

(assert (=> b!159432 (=> (not res!75324) (not e!104355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159432 (= res!75324 (validMask!0 (mask!7765 thiss!1248)))))

(declare-fun b!159433 () Bool)

(declare-fun res!75326 () Bool)

(assert (=> b!159433 (=> (not res!75326) (not e!104355))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2886 0))(
  ( (tuple2!2887 (_1!1454 (_ BitVec 64)) (_2!1454 V!4081)) )
))
(declare-datatypes ((List!1908 0))(
  ( (Nil!1905) (Cons!1904 (h!2517 tuple2!2886) (t!6710 List!1908)) )
))
(declare-datatypes ((ListLongMap!1873 0))(
  ( (ListLongMap!1874 (toList!952 List!1908)) )
))
(declare-fun contains!988 (ListLongMap!1873 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!616 (array!5729 array!5731 (_ BitVec 32) (_ BitVec 32) V!4081 V!4081 (_ BitVec 32) Int) ListLongMap!1873)

(assert (=> b!159433 (= res!75326 (contains!988 (getCurrentListMap!616 (_keys!5016 thiss!1248) (_values!3198 thiss!1248) (mask!7765 thiss!1248) (extraKeys!2956 thiss!1248) (zeroValue!3058 thiss!1248) (minValue!3058 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3215 thiss!1248)) key!828))))

(declare-fun b!159434 () Bool)

(declare-fun e!104357 () Bool)

(assert (=> b!159434 (= e!104358 (and e!104357 mapRes!5675))))

(declare-fun condMapEmpty!5675 () Bool)

(declare-fun mapDefault!5675 () ValueCell!1319)

