; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25236 () Bool)

(assert start!25236)

(declare-fun b!262860 () Bool)

(declare-fun b_free!6793 () Bool)

(declare-fun b_next!6793 () Bool)

(assert (=> b!262860 (= b_free!6793 (not b_next!6793))))

(declare-fun tp!23715 () Bool)

(declare-fun b_and!13935 () Bool)

(assert (=> b!262860 (= tp!23715 b_and!13935)))

(declare-fun b!262851 () Bool)

(declare-fun e!170349 () Bool)

(declare-fun tp_is_empty!6655 () Bool)

(assert (=> b!262851 (= e!170349 tp_is_empty!6655)))

(declare-fun b!262852 () Bool)

(declare-fun e!170348 () Bool)

(declare-fun e!170345 () Bool)

(assert (=> b!262852 (= e!170348 e!170345)))

(declare-fun res!128390 () Bool)

(assert (=> b!262852 (=> (not res!128390) (not e!170345))))

(declare-datatypes ((V!8521 0))(
  ( (V!8522 (val!3372 Int)) )
))
(declare-datatypes ((tuple2!4976 0))(
  ( (tuple2!4977 (_1!2499 (_ BitVec 64)) (_2!2499 V!8521)) )
))
(declare-datatypes ((List!3851 0))(
  ( (Nil!3848) (Cons!3847 (h!4513 tuple2!4976) (t!8928 List!3851)) )
))
(declare-datatypes ((ListLongMap!3889 0))(
  ( (ListLongMap!3890 (toList!1960 List!3851)) )
))
(declare-fun lt!132948 () ListLongMap!3889)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1911 (ListLongMap!3889 (_ BitVec 64)) Bool)

(assert (=> b!262852 (= res!128390 (contains!1911 lt!132948 key!932))))

(declare-datatypes ((ValueCell!2984 0))(
  ( (ValueCellFull!2984 (v!5503 V!8521)) (EmptyCell!2984) )
))
(declare-datatypes ((array!12671 0))(
  ( (array!12672 (arr!5996 (Array (_ BitVec 32) ValueCell!2984)) (size!6347 (_ BitVec 32))) )
))
(declare-datatypes ((array!12673 0))(
  ( (array!12674 (arr!5997 (Array (_ BitVec 32) (_ BitVec 64))) (size!6348 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3868 0))(
  ( (LongMapFixedSize!3869 (defaultEntry!4842 Int) (mask!11208 (_ BitVec 32)) (extraKeys!4579 (_ BitVec 32)) (zeroValue!4683 V!8521) (minValue!4683 V!8521) (_size!1983 (_ BitVec 32)) (_keys!7034 array!12673) (_values!4825 array!12671) (_vacant!1983 (_ BitVec 32))) )
))
(declare-fun lt!132946 () LongMapFixedSize!3868)

(declare-fun map!2757 (LongMapFixedSize!3868) ListLongMap!3889)

(assert (=> b!262852 (= lt!132948 (map!2757 lt!132946))))

(declare-fun b!262853 () Bool)

(declare-fun res!128386 () Bool)

(declare-fun e!170338 () Bool)

(assert (=> b!262853 (=> (not res!128386) (not e!170338))))

(declare-fun call!25142 () Bool)

(assert (=> b!262853 (= res!128386 call!25142)))

(declare-fun e!170347 () Bool)

(assert (=> b!262853 (= e!170347 e!170338)))

(declare-fun b!262854 () Bool)

(declare-datatypes ((Unit!8188 0))(
  ( (Unit!8189) )
))
(declare-fun e!170351 () Unit!8188)

(declare-fun lt!132943 () Unit!8188)

(assert (=> b!262854 (= e!170351 lt!132943)))

(declare-fun thiss!1504 () LongMapFixedSize!3868)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!454 (array!12673 array!12671 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) Int) Unit!8188)

(assert (=> b!262854 (= lt!132943 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!454 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)))))

(declare-fun c!44811 () Bool)

(declare-datatypes ((SeekEntryResult!1199 0))(
  ( (MissingZero!1199 (index!6966 (_ BitVec 32))) (Found!1199 (index!6967 (_ BitVec 32))) (Intermediate!1199 (undefined!2011 Bool) (index!6968 (_ BitVec 32)) (x!25241 (_ BitVec 32))) (Undefined!1199) (MissingVacant!1199 (index!6969 (_ BitVec 32))) )
))
(declare-fun lt!132956 () SeekEntryResult!1199)

(assert (=> b!262854 (= c!44811 (is-MissingZero!1199 lt!132956))))

(assert (=> b!262854 e!170347))

(declare-fun b!262855 () Bool)

(declare-fun e!170350 () Bool)

(declare-fun e!170346 () Bool)

(assert (=> b!262855 (= e!170350 e!170346)))

(declare-fun res!128384 () Bool)

(assert (=> b!262855 (=> (not res!128384) (not e!170346))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262855 (= res!128384 (inRange!0 index!297 (mask!11208 thiss!1504)))))

(declare-fun lt!132961 () Unit!8188)

(assert (=> b!262855 (= lt!132961 e!170351)))

(declare-fun c!44809 () Bool)

(declare-fun lt!132952 () ListLongMap!3889)

(assert (=> b!262855 (= c!44809 (contains!1911 lt!132952 key!932))))

(declare-fun getCurrentListMap!1488 (array!12673 array!12671 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) Int) ListLongMap!3889)

(assert (=> b!262855 (= lt!132952 (getCurrentListMap!1488 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun b!262856 () Bool)

(declare-fun e!170343 () Bool)

(assert (=> b!262856 (= e!170343 (is-Undefined!1199 lt!132956))))

(declare-fun b!262857 () Bool)

(declare-fun call!25141 () Bool)

(assert (=> b!262857 (= e!170338 (not call!25141))))

(declare-fun b!262858 () Bool)

(declare-fun c!44812 () Bool)

(assert (=> b!262858 (= c!44812 (is-MissingVacant!1199 lt!132956))))

(assert (=> b!262858 (= e!170347 e!170343)))

(declare-fun b!262859 () Bool)

(declare-fun res!128385 () Bool)

(declare-fun e!170337 () Bool)

(assert (=> b!262859 (=> (not res!128385) (not e!170337))))

(assert (=> b!262859 (= res!128385 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!170342 () Bool)

(declare-fun e!170341 () Bool)

(declare-fun array_inv!3961 (array!12673) Bool)

(declare-fun array_inv!3962 (array!12671) Bool)

(assert (=> b!262860 (= e!170342 (and tp!23715 tp_is_empty!6655 (array_inv!3961 (_keys!7034 thiss!1504)) (array_inv!3962 (_values!4825 thiss!1504)) e!170341))))

(declare-fun b!262861 () Bool)

(declare-fun mapRes!11347 () Bool)

(assert (=> b!262861 (= e!170341 (and e!170349 mapRes!11347))))

(declare-fun condMapEmpty!11347 () Bool)

(declare-fun mapDefault!11347 () ValueCell!2984)

