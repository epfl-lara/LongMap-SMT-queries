; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17700 () Bool)

(assert start!17700)

(declare-fun b!177002 () Bool)

(declare-fun b_free!4373 () Bool)

(declare-fun b_next!4373 () Bool)

(assert (=> b!177002 (= b_free!4373 (not b_next!4373))))

(declare-fun tp!15815 () Bool)

(declare-fun b_and!10871 () Bool)

(assert (=> b!177002 (= tp!15815 b_and!10871)))

(declare-fun b!176997 () Bool)

(declare-fun res!83911 () Bool)

(declare-fun e!116725 () Bool)

(assert (=> b!176997 (=> (not res!83911) (not e!116725))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!176997 (= res!83911 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176998 () Bool)

(declare-fun res!83913 () Bool)

(assert (=> b!176998 (=> (not res!83913) (not e!116725))))

(declare-datatypes ((V!5173 0))(
  ( (V!5174 (val!2117 Int)) )
))
(declare-datatypes ((ValueCell!1729 0))(
  ( (ValueCellFull!1729 (v!3996 V!5173)) (EmptyCell!1729) )
))
(declare-datatypes ((array!7439 0))(
  ( (array!7440 (arr!3529 (Array (_ BitVec 32) (_ BitVec 64))) (size!3833 (_ BitVec 32))) )
))
(declare-datatypes ((array!7441 0))(
  ( (array!7442 (arr!3530 (Array (_ BitVec 32) ValueCell!1729)) (size!3834 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2366 0))(
  ( (LongMapFixedSize!2367 (defaultEntry!3645 Int) (mask!8574 (_ BitVec 32)) (extraKeys!3382 (_ BitVec 32)) (zeroValue!3486 V!5173) (minValue!3486 V!5173) (_size!1232 (_ BitVec 32)) (_keys!5510 array!7439) (_values!3628 array!7441) (_vacant!1232 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2366)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7439 (_ BitVec 32)) Bool)

(assert (=> b!176998 (= res!83913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5510 thiss!1248) (mask!8574 thiss!1248)))))

(declare-fun b!176999 () Bool)

(declare-fun res!83909 () Bool)

(assert (=> b!176999 (=> (not res!83909) (not e!116725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176999 (= res!83909 (validMask!0 (mask!8574 thiss!1248)))))

(declare-fun mapNonEmpty!7077 () Bool)

(declare-fun mapRes!7077 () Bool)

(declare-fun tp!15816 () Bool)

(declare-fun e!116721 () Bool)

(assert (=> mapNonEmpty!7077 (= mapRes!7077 (and tp!15816 e!116721))))

(declare-fun mapKey!7077 () (_ BitVec 32))

(declare-fun mapRest!7077 () (Array (_ BitVec 32) ValueCell!1729))

(declare-fun mapValue!7077 () ValueCell!1729)

(assert (=> mapNonEmpty!7077 (= (arr!3530 (_values!3628 thiss!1248)) (store mapRest!7077 mapKey!7077 mapValue!7077))))

(declare-fun mapIsEmpty!7077 () Bool)

(assert (=> mapIsEmpty!7077 mapRes!7077))

(declare-fun b!177000 () Bool)

(declare-fun res!83915 () Bool)

(assert (=> b!177000 (=> (not res!83915) (not e!116725))))

(declare-datatypes ((List!2248 0))(
  ( (Nil!2245) (Cons!2244 (h!2865 (_ BitVec 64)) (t!7076 List!2248)) )
))
(declare-fun arrayNoDuplicates!0 (array!7439 (_ BitVec 32) List!2248) Bool)

(assert (=> b!177000 (= res!83915 (arrayNoDuplicates!0 (_keys!5510 thiss!1248) #b00000000000000000000000000000000 Nil!2245))))

(declare-fun b!177001 () Bool)

(declare-fun res!83910 () Bool)

(assert (=> b!177001 (=> (not res!83910) (not e!116725))))

(declare-datatypes ((tuple2!3296 0))(
  ( (tuple2!3297 (_1!1659 (_ BitVec 64)) (_2!1659 V!5173)) )
))
(declare-datatypes ((List!2249 0))(
  ( (Nil!2246) (Cons!2245 (h!2866 tuple2!3296) (t!7077 List!2249)) )
))
(declare-datatypes ((ListLongMap!2223 0))(
  ( (ListLongMap!2224 (toList!1127 List!2249)) )
))
(declare-fun contains!1192 (ListLongMap!2223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!779 (array!7439 array!7441 (_ BitVec 32) (_ BitVec 32) V!5173 V!5173 (_ BitVec 32) Int) ListLongMap!2223)

(assert (=> b!177001 (= res!83910 (contains!1192 (getCurrentListMap!779 (_keys!5510 thiss!1248) (_values!3628 thiss!1248) (mask!8574 thiss!1248) (extraKeys!3382 thiss!1248) (zeroValue!3486 thiss!1248) (minValue!3486 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3645 thiss!1248)) key!828))))

(declare-fun tp_is_empty!4145 () Bool)

(declare-fun e!116724 () Bool)

(declare-fun e!116723 () Bool)

(declare-fun array_inv!2261 (array!7439) Bool)

(declare-fun array_inv!2262 (array!7441) Bool)

(assert (=> b!177002 (= e!116723 (and tp!15815 tp_is_empty!4145 (array_inv!2261 (_keys!5510 thiss!1248)) (array_inv!2262 (_values!3628 thiss!1248)) e!116724))))

(declare-fun b!177003 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!177003 (= e!116725 (not (validKeyInArray!0 key!828)))))

(declare-fun res!83908 () Bool)

(assert (=> start!17700 (=> (not res!83908) (not e!116725))))

(declare-fun valid!993 (LongMapFixedSize!2366) Bool)

(assert (=> start!17700 (= res!83908 (valid!993 thiss!1248))))

(assert (=> start!17700 e!116725))

(assert (=> start!17700 e!116723))

(assert (=> start!17700 true))

(declare-fun b!176996 () Bool)

(assert (=> b!176996 (= e!116721 tp_is_empty!4145)))

(declare-fun b!177004 () Bool)

(declare-fun e!116722 () Bool)

(assert (=> b!177004 (= e!116724 (and e!116722 mapRes!7077))))

(declare-fun condMapEmpty!7077 () Bool)

(declare-fun mapDefault!7077 () ValueCell!1729)

