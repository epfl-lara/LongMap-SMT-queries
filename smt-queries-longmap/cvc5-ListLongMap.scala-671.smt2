; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16530 () Bool)

(assert start!16530)

(declare-fun b!164415 () Bool)

(declare-fun b_free!3835 () Bool)

(declare-fun b_next!3835 () Bool)

(assert (=> b!164415 (= b_free!3835 (not b_next!3835))))

(declare-fun tp!14105 () Bool)

(declare-fun b_and!10249 () Bool)

(assert (=> b!164415 (= tp!14105 b_and!10249)))

(declare-fun e!107872 () Bool)

(declare-fun tp_is_empty!3637 () Bool)

(declare-datatypes ((V!4497 0))(
  ( (V!4498 (val!1863 Int)) )
))
(declare-datatypes ((ValueCell!1475 0))(
  ( (ValueCellFull!1475 (v!3728 V!4497)) (EmptyCell!1475) )
))
(declare-datatypes ((array!6371 0))(
  ( (array!6372 (arr!3021 (Array (_ BitVec 32) (_ BitVec 64))) (size!3309 (_ BitVec 32))) )
))
(declare-datatypes ((array!6373 0))(
  ( (array!6374 (arr!3022 (Array (_ BitVec 32) ValueCell!1475)) (size!3310 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1858 0))(
  ( (LongMapFixedSize!1859 (defaultEntry!3371 Int) (mask!8062 (_ BitVec 32)) (extraKeys!3112 (_ BitVec 32)) (zeroValue!3214 V!4497) (minValue!3214 V!4497) (_size!978 (_ BitVec 32)) (_keys!5196 array!6371) (_values!3354 array!6373) (_vacant!978 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1858)

(declare-fun e!107871 () Bool)

(declare-fun array_inv!1935 (array!6371) Bool)

(declare-fun array_inv!1936 (array!6373) Bool)

(assert (=> b!164415 (= e!107872 (and tp!14105 tp_is_empty!3637 (array_inv!1935 (_keys!5196 thiss!1248)) (array_inv!1936 (_values!3354 thiss!1248)) e!107871))))

(declare-fun b!164416 () Bool)

(declare-fun e!107873 () Bool)

(assert (=> b!164416 (= e!107873 tp_is_empty!3637)))

(declare-fun mapIsEmpty!6174 () Bool)

(declare-fun mapRes!6174 () Bool)

(assert (=> mapIsEmpty!6174 mapRes!6174))

(declare-fun mapNonEmpty!6174 () Bool)

(declare-fun tp!14106 () Bool)

(assert (=> mapNonEmpty!6174 (= mapRes!6174 (and tp!14106 e!107873))))

(declare-fun mapValue!6174 () ValueCell!1475)

(declare-fun mapKey!6174 () (_ BitVec 32))

(declare-fun mapRest!6174 () (Array (_ BitVec 32) ValueCell!1475))

(assert (=> mapNonEmpty!6174 (= (arr!3022 (_values!3354 thiss!1248)) (store mapRest!6174 mapKey!6174 mapValue!6174))))

(declare-fun b!164417 () Bool)

(declare-fun e!107874 () Bool)

(assert (=> b!164417 (= e!107874 false)))

(declare-fun lt!82884 () Bool)

(declare-datatypes ((List!2006 0))(
  ( (Nil!2003) (Cons!2002 (h!2619 (_ BitVec 64)) (t!6808 List!2006)) )
))
(declare-fun arrayNoDuplicates!0 (array!6371 (_ BitVec 32) List!2006) Bool)

(assert (=> b!164417 (= lt!82884 (arrayNoDuplicates!0 (_keys!5196 thiss!1248) #b00000000000000000000000000000000 Nil!2003))))

(declare-fun res!77843 () Bool)

(declare-fun e!107870 () Bool)

(assert (=> start!16530 (=> (not res!77843) (not e!107870))))

(declare-fun valid!827 (LongMapFixedSize!1858) Bool)

(assert (=> start!16530 (= res!77843 (valid!827 thiss!1248))))

(assert (=> start!16530 e!107870))

(assert (=> start!16530 e!107872))

(assert (=> start!16530 true))

(declare-fun b!164414 () Bool)

(declare-fun res!77839 () Bool)

(assert (=> b!164414 (=> (not res!77839) (not e!107874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6371 (_ BitVec 32)) Bool)

(assert (=> b!164414 (= res!77839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5196 thiss!1248) (mask!8062 thiss!1248)))))

(declare-fun b!164418 () Bool)

(declare-fun res!77844 () Bool)

(assert (=> b!164418 (=> (not res!77844) (not e!107874))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3024 0))(
  ( (tuple2!3025 (_1!1523 (_ BitVec 64)) (_2!1523 V!4497)) )
))
(declare-datatypes ((List!2007 0))(
  ( (Nil!2004) (Cons!2003 (h!2620 tuple2!3024) (t!6809 List!2007)) )
))
(declare-datatypes ((ListLongMap!1979 0))(
  ( (ListLongMap!1980 (toList!1005 List!2007)) )
))
(declare-fun contains!1047 (ListLongMap!1979 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!663 (array!6371 array!6373 (_ BitVec 32) (_ BitVec 32) V!4497 V!4497 (_ BitVec 32) Int) ListLongMap!1979)

(assert (=> b!164418 (= res!77844 (contains!1047 (getCurrentListMap!663 (_keys!5196 thiss!1248) (_values!3354 thiss!1248) (mask!8062 thiss!1248) (extraKeys!3112 thiss!1248) (zeroValue!3214 thiss!1248) (minValue!3214 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3371 thiss!1248)) key!828))))

(declare-fun b!164419 () Bool)

(declare-fun e!107876 () Bool)

(assert (=> b!164419 (= e!107871 (and e!107876 mapRes!6174))))

(declare-fun condMapEmpty!6174 () Bool)

(declare-fun mapDefault!6174 () ValueCell!1475)

