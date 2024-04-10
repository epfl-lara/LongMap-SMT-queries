; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16234 () Bool)

(assert start!16234)

(declare-fun b!161952 () Bool)

(declare-fun b_free!3695 () Bool)

(declare-fun b_next!3695 () Bool)

(assert (=> b!161952 (= b_free!3695 (not b_next!3695))))

(declare-fun tp!13654 () Bool)

(declare-fun b_and!10109 () Bool)

(assert (=> b!161952 (= tp!13654 b_and!10109)))

(declare-fun mapIsEmpty!5933 () Bool)

(declare-fun mapRes!5933 () Bool)

(assert (=> mapIsEmpty!5933 mapRes!5933))

(declare-fun res!76717 () Bool)

(declare-fun e!105978 () Bool)

(assert (=> start!16234 (=> (not res!76717) (not e!105978))))

(declare-datatypes ((V!4309 0))(
  ( (V!4310 (val!1793 Int)) )
))
(declare-datatypes ((ValueCell!1405 0))(
  ( (ValueCellFull!1405 (v!3658 V!4309)) (EmptyCell!1405) )
))
(declare-datatypes ((array!6073 0))(
  ( (array!6074 (arr!2881 (Array (_ BitVec 32) (_ BitVec 64))) (size!3165 (_ BitVec 32))) )
))
(declare-datatypes ((array!6075 0))(
  ( (array!6076 (arr!2882 (Array (_ BitVec 32) ValueCell!1405)) (size!3166 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1718 0))(
  ( (LongMapFixedSize!1719 (defaultEntry!3301 Int) (mask!7907 (_ BitVec 32)) (extraKeys!3042 (_ BitVec 32)) (zeroValue!3144 V!4309) (minValue!3144 V!4309) (_size!908 (_ BitVec 32)) (_keys!5102 array!6073) (_values!3284 array!6075) (_vacant!908 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1718)

(declare-fun valid!781 (LongMapFixedSize!1718) Bool)

(assert (=> start!16234 (= res!76717 (valid!781 thiss!1248))))

(assert (=> start!16234 e!105978))

(declare-fun e!105973 () Bool)

(assert (=> start!16234 e!105973))

(assert (=> start!16234 true))

(declare-fun tp_is_empty!3497 () Bool)

(assert (=> start!16234 tp_is_empty!3497))

(declare-fun b!161945 () Bool)

(declare-fun res!76720 () Bool)

(assert (=> b!161945 (=> (not res!76720) (not e!105978))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161945 (= res!76720 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5933 () Bool)

(declare-fun tp!13655 () Bool)

(declare-fun e!105971 () Bool)

(assert (=> mapNonEmpty!5933 (= mapRes!5933 (and tp!13655 e!105971))))

(declare-fun mapKey!5933 () (_ BitVec 32))

(declare-fun mapRest!5933 () (Array (_ BitVec 32) ValueCell!1405))

(declare-fun mapValue!5933 () ValueCell!1405)

(assert (=> mapNonEmpty!5933 (= (arr!2882 (_values!3284 thiss!1248)) (store mapRest!5933 mapKey!5933 mapValue!5933))))

(declare-fun b!161946 () Bool)

(assert (=> b!161946 (= e!105971 tp_is_empty!3497)))

(declare-fun b!161947 () Bool)

(declare-fun e!105976 () Bool)

(assert (=> b!161947 (= e!105976 false)))

(declare-fun lt!82325 () Bool)

(declare-datatypes ((tuple2!2976 0))(
  ( (tuple2!2977 (_1!1499 Bool) (_2!1499 LongMapFixedSize!1718)) )
))
(declare-fun lt!82326 () tuple2!2976)

(declare-datatypes ((tuple2!2978 0))(
  ( (tuple2!2979 (_1!1500 (_ BitVec 64)) (_2!1500 V!4309)) )
))
(declare-datatypes ((List!1982 0))(
  ( (Nil!1979) (Cons!1978 (h!2591 tuple2!2978) (t!6784 List!1982)) )
))
(declare-datatypes ((ListLongMap!1959 0))(
  ( (ListLongMap!1960 (toList!995 List!1982)) )
))
(declare-fun contains!1031 (ListLongMap!1959 (_ BitVec 64)) Bool)

(declare-fun map!1667 (LongMapFixedSize!1718) ListLongMap!1959)

(assert (=> b!161947 (= lt!82325 (contains!1031 (map!1667 (_2!1499 lt!82326)) key!828))))

(declare-fun b!161948 () Bool)

(declare-fun e!105977 () Bool)

(declare-fun e!105975 () Bool)

(assert (=> b!161948 (= e!105977 (and e!105975 mapRes!5933))))

(declare-fun condMapEmpty!5933 () Bool)

(declare-fun mapDefault!5933 () ValueCell!1405)

